module TestGenerator
  # Class responsible for writing test files for each function group
  class TestWriter
    def initialize(group, group_functions, all_functions, config, group_tests)
      @group = group
      @group_functions = group_functions # Functions for this group only
      @functions = all_functions # All available functions
      @config = config
      @group_tests = group_tests
      @formatter = CodeFormatter.new(config.indent_size)
    end

    # Writes the test file for a function group
    # @param tests_dir [String] Directory where test files will be written
    # @return [void]
    def write_to(tests_dir)
      FileUtils.mkdir_p(File.dirname(test_file_path(tests_dir)))
      File.open(test_file_path(tests_dir), 'w') do |file|
        write_content(file)
      end
    rescue SystemCallError => e
      raise TestGeneratorError, "Failed to write test file: #{e.message}"
    end

    private

    # Generates the file path for the test file
    # @param tests_dir [String] Base directory for test files
    # @return [String] Complete file path
    def test_file_path(tests_dir)
      "#{tests_dir}/#{@group.downcase.gsub(/\s+/, '_')}_tests.#{@config.file_extension}"
    end

    # Writes the complete test file content
    # @param file [File] File handle to write to
    # @return [void]
    def write_content(file)
      write_imports(file)
      if @config.class_wrapper
        write_wrapped_tests(file)
      else
        write_unwrapped_tests(file)
      end
    end

    # Writes import statements at the start of the file
    # @param file [File] File handle to write to
    # @return [void]
    def write_imports(file)
      @config.imports.each do |import|
        line = import.respond_to?(:call) ? import.call(@group) : import
        file.puts(line)
      end
    end

    # Writes tests wrapped in a class structure
    # @param file [File] File handle to write to
    # @return [void]
    def write_wrapped_tests(file)
      write_class_header(file)
      write_constructor(file)
      write_class_footer(file) if @config.language == :cpp
      write_test_methods(file)
      write_tear_down(file)
      write_class_footer(file) if @config.language != :cpp
    end

    # Writes tests without class wrapping
    # @param file [File] File handle to write to
    # @return [void]
    def write_unwrapped_tests(file)
      @group_functions.each do |function|
        write_test_method(file, function)
      end
    end

    # Writes the class header with proper indentation
    # @param file [File] File handle to write to
    # @return [void]
    def write_class_header(file)
      @config.class_wrapper[:header].each do |line|
        if line == 'published_functions' && @config.language == :pascal
          write_published_section(file)
        elsif line == 'private_vars' && @config.language == :pascal
          write_private_vars(file)
        else
          line = line.call(@group) if line.respond_to?(:call)
          file.puts(@formatter.indent(line, @config))
        end
      end
    end

    # Writes the private vars for Pascal test classes
    # @param file [File] File handle to write to
    # @return [void]
    def write_private_vars(file)
      return unless @group_tests[@group][:cleanup]

      file.puts(@formatter.indent('private', @config))
      @group_tests[@group][:cleanup].each do |step|
        file.puts(@formatter.indent("cleanup#{step[:cleanup_type].to_pascal_case}: #{step[:cleanup_type].to_pascal_case}Cleanup;", @config))
      end
    end

    # Writes the published section for Pascal test classes
    # @param file [File] File handle to write to
    # @return [void]
    def write_published_section(file)
      @group_functions.each do |function|
        test_case = find_test_case(function)
        test_name = "procedure Test#{test_case[:name].to_pascal_case}Integration;"
        file.puts(@formatter.indent(test_name, @config))
      end
      write_protected_section(file)
    end

    # Writes the protected section with setup and tear down declarations
    # @param file [File] File handle to write to
    # @return [void]
    def write_protected_section(file)
      return unless should_write_protected_section?

      write_protected_line(file, :begin)
      write_protected_line(file, :setup) if should_write_constructor?
      write_protected_line(file, :tear_down) if should_write_tear_down?
    end

    def write_protected_line(file, section_type)
      line = @config.class_wrapper[:publish][section_type]
      file.puts(@formatter.indent(line, @config))
    end

    # Checks if the protected section should be written
    # @return [Boolean] True if the protected section should be written
    def should_write_protected_section?
      should_write_constructor? || should_write_tear_down?
    end

    # Writes the constructor if required
    # @param file [File] File handle to write to
    # @return [void]
    def write_constructor(file)
      return unless should_write_constructor?

      write_constructor_header(file)
      write_constructor_steps(file)
      write_constructor_footer(file)
    end

    # Writes the constructor header lines
    # @param file [File] File handle to write to
    # @return [void]
    def write_constructor_header(file)
      @config.class_wrapper_handler.constructor_header(@group).each do |line|
        formatted_line = line.respond_to?(:call) ? line.call(@group) : line
        file.puts(@formatter.format_line(formatted_line, @config))
      end
    end

    # Writes the constructor steps, including resource path setup if needed
    # @param file [File] File handle to write to
    # @return [void]
    def write_constructor_steps(file)
      constructor_steps&.each do |step|
        step = update_resources_path(step) if step[:function_name] == 'set_resources_path'
        file.puts(StepWriter.write_test_step(step, @functions, @config, @formatter))
      end
    end

    # Writes the constructor footer lines
    # @param file [File] File handle to write to
    # @return [void]
    def write_constructor_footer(file)
      @config.class_wrapper_handler.constructor_footer.each do |line|
        file.puts(@formatter.format_line(line, @config))
      end
    end

    # Writes individual test methods for each function
    # @param file [File] File handle to write to
    # @return [void]
    def write_test_methods(file)
      @group_functions.each do |function|
        test_case = find_test_case(function)
        test = TestCase.new(test_case[:name], @group, test_case[:steps], @config, @functions)
        file.puts(test.to_code(@formatter))
      end
    end

    # Writes the tear down method
    # @param file [File] File handle to write to
    # @return [void]
    def write_tear_down(file)
      return unless should_write_tear_down?

      @config.tear_down[:header].call(@group).each do |line|
        file.puts(@formatter.indent(line, @config))
      end
      write_tear_down_steps(file)
      @config.tear_down[:footer].each do |line|
        file.puts(@formatter.indent(line, @config))
      end
    end

    # Writes the tear down steps
    # @param file [File] File handle to write to
    # @return [void]
    def write_tear_down_steps(file)
      @group_tests[@group][:cleanup].each do |step|
        @config.tear_down[:step].call(step[:cleanup_type]).each do |line|
          file.puts(@formatter.indent(line, @config))
        end
      end
    end

    # Writes the class footer
    # @param file [File] File handle to write to
    # @return [void]
    def write_class_footer(file)
      @config.class_wrapper_handler.footer_lines.each do |line|
        line = line.call(@group) if line.respond_to?(:call)
        file.puts(@formatter.indent(line, @config))
      end
    end

    # Checks if constructor should be written
    # @return [Boolean] True if constructor should be written
    def should_write_constructor?
      @config.class_wrapper_handler.constructor_header(@group) && constructor_steps
    end

    # Checks if tear down should be written
    # @return [Boolean] True if tear down should be written
    def should_write_tear_down?
      @config.tear_down && @config.tear_down[:step] && @group_tests[@group][:cleanup]
    end

    # Gets constructor steps from group tests
    # @return [Array, nil] Array of constructor steps or nil if none exist
    def constructor_steps
      return nil unless @group_tests[@group].is_a?(Hash)

      @group_tests[@group][:constructor]
    end

    # Finds the test case for a given function
    # @param function [Function] The function to find tests for
    # @return [Hash] The test case for the function
    # @raise [StandardError] If no test case is found
    def find_test_case(function)
      test_case = FunctionLookup.get_test_by_function_name(function, @group_tests)
      validate_test_case_exists!(function, test_case)
      test_case
    end

    # Validates that a test case exists for a given function
    # @param function [Function] The function to validate
    # @param test_case [Hash, nil] The test case or nil if not found
    # @raise [ValidationError] If no test case is found
    def validate_test_case_exists!(function, test_case)
      return if test_case

      raise ValidationError, <<~ERROR
        No test case found for:
        - Function: #{function.name}
        - Group: #{function.group}
        - Available groups: #{@group_tests.to_h.keys.join(', ')}
      ERROR
    end

    # Updates the resources path for set_resources_path step
    # @param step [Hash] The step to update
    # @return [Hash] The updated step
    def update_resources_path(step)
      step = step.dup
      step[:args] = step[:args].map(&:dup)
      step[:args][0][:value] = File.join(File.expand_path('../../..', __dir__), 'resources')
      step
    end
  end
end
