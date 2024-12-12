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
      @config.imports.each { |import| file.puts(import) }
    end

    # Writes tests wrapped in a class structure
    # @param file [File] File handle to write to
    # @return [void]
    def write_wrapped_tests(file)
      write_class_header(file)
      write_constructor(file)
      write_test_methods(file)
      write_class_footer(file)
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
      @config.class_wrapper.header_lines(@group).each do |line|
        file.puts(@formatter.format_line(line))
        @formatter.increase_indent if @config.class_wrapper.indent_after?(line)
      end
    end

    # Writes the constructor if required
    # @param file [File] File handle to write to
    # @return [void]
    def write_constructor(file)
      return unless should_write_constructor?

      header = @config.class_wrapper.constructor_header(@group)
      file.puts(@formatter.format_line(header))
      @formatter.increase_indent

      constructor_steps.each do |step|
        file.puts(TestStepWriter.write_test_step(step, @functions, @config, @formatter))
      end

      footer = @config.class_wrapper.constructor_footer
      @formatter.decrease_indent
      file.puts(@formatter.format_line(footer))
    end

    # Writes individual test methods for each function
    # @param file [File] File handle to write to
    # @return [void]
    def write_test_methods(file)
      @group_functions.each do |function|
        test_case = find_test_case(function)
        test = TestCase.new(test_case[:name], test_case[:steps], @config, @functions)
        file.puts(test.to_code(@formatter))
      end
    end

    # Writes the class footer with proper indentation
    # @param file [File] File handle to write to
    # @return [void]
    def write_class_footer(file)
      @config.class_wrapper.footer_lines.each do |line|
        @formatter.decrease_indent if @config.class_wrapper.unindent_before?(line)
        file.puts(@formatter.indent(line))
      end
    end

    # Checks if constructor should be written
    # @return [Boolean] True if constructor should be written
    def should_write_constructor?
      @config.class_wrapper.constructor_header(@group) && constructor_steps
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
      # MessageHandler.log_info("Found test case for #{function.name}: #{test_case ? 'yes' : 'no'}")
      validate_test_case_exists!(function, test_case)
      test_case
    end

    def validate_test_case_exists!(function, test_case)
      return if test_case

      raise ValidationError, <<~ERROR
        No test case found for:
        - Function: #{function.name}
        - Group: #{function.group}
        - Available groups: #{@group_tests.to_h.keys.join(', ')}
      ERROR
    end
  end
end
