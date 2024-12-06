module TestGenerator
  # Handles the writing of test code by generating integration tests
  # for SplashKit functions with their dependencies
  module TestWriter
    # Class variables to hold configuration and state
    @config = nil
    @indent_level = 0
    @group_tests = {}
    @functions = []

    # Main method to write integration tests
    def self.write_integration_tests(functions, language)
      @functions = functions
      @config = LanguageConfig.for_language(language)
      language_dir, tests_dir = setup_directories(language)
      load_all_group_tests
      grouped_functions = functions.group_by { |func| func.group || 'ungrouped' }
      grouped_functions.each do |group, group_functions|
        write_group_tests(group, group_functions, tests_dir)
      end
      # Create a README file for the generated tests
      File.open("#{language_dir}/README.md", 'w') { |file| write_readme(file, language) }
    end

    class << self
      private

      # Load test files
      def load_test_files
        files = Dir.glob('data/result/*.json')
        files.map do |file|
          content = JSON.parse(File.read(file), symbolize_names: true)
          content[:tests]
        end
      end

      # Indent text based on the current indent level
      def indent(text)
        spaces = ' ' * (@indent_level * @config[:indent_size])
        if text.is_a?(String)
          text.lines.map { |line| "#{spaces}#{line.chomp}" }.join("\n") << "\n"
        else
          "#{spaces}#{text}"
        end
      end

      # Set up directories for generated tests
      def setup_directories(language)
        base_dir = "generated_tests/#{language}"
        Dir.mkdir(base_dir) unless Dir.exist?(base_dir)
        tests_dir = "#{base_dir}/tests"
        Dir.mkdir(tests_dir) unless Dir.exist?(tests_dir)
        [base_dir, tests_dir]
      end

      # Load all group tests from JSON files
      def load_all_group_tests
        Dir.glob('data/tests/*.json').each do |file|
          group = File.basename(file, '.json')
          load_group_tests(group)
        end
      end

      # Load tests for a specific group
      def load_group_tests(group)
        return @group_tests[group] if @group_tests.key?(group)

        group_tests_file_path = "data/tests/#{group}.json"
        if File.exist?(group_tests_file_path)
          group_tests_data = JSON.parse(File.read(group_tests_file_path), symbolize_names: true)
          @group_tests[group] = group_tests_data[:tests]
        else
          puts "Warning: No test file found for group: #{group}"
          @group_tests[group] = []
        end
      end

      # Write tests for a specific group to a file
      def write_group_tests(group, group_functions, tests_dir)
        file_name = "#{group.downcase.gsub(/\s+/, '_')}_tests.#{@config[:file_extension]}"
        File.open("#{tests_dir}/#{file_name}", 'w') do |file|
          write_tests_to_file(file, group_functions)
        end
      end

      # Write README content to the file
      def write_readme(file, language)
        file.puts "# Test for #{language}"
        file.puts "\n## Prerequisites"
        file.puts "- #{@config[:runtime_requirement]}" if @config[:runtime_requirement]
        file.puts "- #{@config[:package_manager]}" if @config[:package_manager]
        file.puts "\n## Installation"
        file.puts @config[:installation_steps] if @config[:installation_steps]
        file.puts "\n## Running the test"
        file.puts @config[:run_command] if @config[:run_command]
      end

      # Write tests to the specified file
      def write_tests_to_file(file, functions)
        @config[:imports].each { |import| file.puts import }
        if @config[:class_wrapper]
          write_wrapped_tests(file, functions)
        else
          write_unwrapped_tests(file, functions)
        end
      end

      # Write tests wrapped in a class structure
      def write_wrapped_tests(file, tests)
        write_wrapper_header(file)
        write_unwrapped_tests(file, tests)
        write_wrapper_footer(file)
      end

      # Write the header for the wrapper class
      def write_wrapper_header(file)
        @config[:class_wrapper][:header].each do |line|
          file.puts indent(line)
          @indent_level += 1 if @config[:class_wrapper][:indent_after]&.include?(line)
        end
      end

      # Write the footer for the wrapper class
      def write_wrapper_footer(file)
        @config[:class_wrapper][:footer].each do |line|
          @indent_level -= 1 if @config[:class_wrapper][:unindent_before]&.include?(line)
          file.puts indent(line)
        end
      end

      # Write unwrapped tests to the file
      def write_unwrapped_tests(file, functions)
        functions.each do |function|
          next unless (test_case = FunctionLookup.get_test_by_function_name(function, @group_tests))

          file.puts write_test(test_case)
        end
      end

      # Write the header for a specific test
      def write_test_header(func)
        @config[:test_header].call(func)
      end

      # Write the complete test code for a test case
      def write_test(test_case)
        test_code = ''
        test_code << indent(write_test_header(test_case[:name]))
        @indent_level += 1
        test_case[:steps].each do |step|
          test_code << write_test_step(step, test_case[:name])
        end
        @indent_level -= 1
        test_code << indent(@config[:footer])
        test_code
      end

      # Write a variable step in the test TODO
      def write_variable_step(step, _)
        indent(ValueFormatter.format_variable_value(step, @functions, @config) + "todo")
      end

      # Write a specific test step based on its type
      def write_test_step(step, function_name)
        step_type = step[:step_type]
        if step_type == 'assertion'
          indent(write_assertion_step(step, function_name))
        else
          send("write_#{step_type}_step", step, function_name)
        end
      end

      # Write a function step
      def write_function_step(step, _)
        args = step[:args].map { |arg| ValueFormatter.format_value(arg, @functions, @config) }.join(', ')
        function_name = FunctionLookup.determine_function_name(step, @functions, @config)
        raise "Function name cannot be nil or empty #{JSON.pretty_generate(step)}" if function_name.nil? || function_name.empty?

        function_call = write_function_call(function_name, args, step)
        indent(function_call)
      end

      # Write a function call step
      def write_function_call(function_name, args, step)
        if step[:store_result]
          @config[:variable_declaration].call(step[:store_result]) + @config[:function_syntax].call(function_name, args)
        else
          @config[:function_syntax].call(function_name, args)
        end
      end

      # Write an assertion step 
      def write_assertion_step(step, function_name)
        comparison = step[:compare]
        value1 = ValueFormatter.format_value(comparison[:value1], @functions, @config)
        value2 = ValueFormatter.format_value(comparison[:value2], @functions, @config) if comparison[:value2]
        value3 = ValueFormatter.format_value(comparison[:value3], @functions, @config) if comparison[:value3]
        comparison_method = AssertionBuilder.comparison_method_map[comparison[:compare_type]]
        if comparison_method
          AssertionBuilder.send(comparison_method, value1, value2, value3, @config)
        else
          MessageHandler.handle_unsupported_comparison(comparison, function_name)
        end
      end

      # Write a loop step
      def write_loop_step(step, function_name)
        loop_code = @config[:loop_syntax].call(step[:iterations])
        @indent_level += 1
        step[:loop_steps].each do |inner_step|
          loop_code << write_step_code(inner_step, function_name)
        end
        @indent_level -= 1
        loop_code << @config[:footer]
        loop_code
      end

      # Write an if step in the test
      def write_if_step(step, function_name)
        condition_code = write_assertion_step(step, function_name)
        if_code = @config[:if_syntax].call(condition_code)
        @indent_level += 1
        step[:then_steps].each do |then_step|
          if_code << write_test_step(then_step, function_name)
        end
        @indent_level -= 1
        if_code << @config[:footer]
        write_else_steps(step, if_code, function_name)
      end

      # Write else steps for an if statement
      def write_else_steps(step, if_code, function_name)
        if step[:else_steps]
          if_code << indent(@config[:else_syntax])
          @indent_level += 1
          step[:else_steps].each do |else_step|
            if_code << write_test_step(else_step, function_name)
          end
          @indent_level -= 1
        end
        if_code << @config[:footer]
        if_code
      end

      # Write a while step
      def write_while_step(step, function_name)
        while_code = @config[:while_syntax].call(write_assertion_step(step[:condition], function_name).strip)
        @indent_level += 1
        step[:while_steps].each do |inner_step|
          while_code << write_step_code(inner_step, function_name)
        end
        @indent_level -= 1
        while_code << @config[:footer]
        while_code
      end
    end
  end
end
