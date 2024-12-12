module TestGenerator
  # Class responsible for generating individual test case code with proper formatting
  class TestCase
    attr_reader :name, :steps

    def initialize(name, steps, config, functions)
      @name = name
      @steps = steps
      @config = config
      @functions = functions
    end

    # Generates formatted code for the test case
    # @param formatter [CodeFormatter] The formatter to use for code indentation
    # @return [String] The complete formatted test case code
    def to_code(formatter)
      code = formatter.indent(write_header)
      formatter.increase_indent
      code << write_steps(formatter)
      formatter.decrease_indent
      code << formatter.indent(@config.control_flow[:end].call)
      code
    end

    private

    # Writes the test case header with the test name
    # @return [String] The formatted test header
    def write_header
      @config.function_handlers[:test].call(@name)
    end

    # Writes all test steps in sequence
    # @param formatter [CodeFormatter] The formatter to use for code indentation
    # @return [String] The formatted test steps code
    def write_steps(formatter)
      @steps.map.with_index do |step, index|
        StepWriter.write_test_step(step, @functions, @config, formatter)
      rescue StandardError => e
        raise TestGeneratorError, "Error writing step #{index + 1} in test '#{@name}': #{e.message}"
      end.join
    end
  end
end
