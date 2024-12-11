module TestGenerator
  # Handles class wrapping configuration for test file generation
  class ClassWrapperHandler
    def initialize(config)
      @config = config
    end

    # Gets the header lines for the class wrapper
    # @param group [String] The group name for the test class
    # @return [Array<String>] Array of header lines, with procs evaluated
    def header_lines(group)
      @config[:header].map do |line|
        line.is_a?(Proc) ? line.call(group) : line
      end
    end

    # Gets the constructor header for the class
    # @param group [String] The group name for the test class
    # @return [String] The constructor header, with proc evaluated if applicable
    def constructor_header(group)
      header = @config[:constructor_wrapper][:header]
      header.is_a?(Proc) ? header.call(group) : header
    end

    # Gets the constructor footer
    # @return [String] The constructor footer
    def constructor_footer
      @config[:constructor_wrapper][:footer]
    end

    # Gets the footer lines for the class wrapper
    # @return [Array<String>] Array of footer lines
    def footer_lines
      @config[:footer]
    end

    # Checks if indentation should increase after a line
    # @param line [String] The line to check
    # @return [Boolean] True if indentation should increase
    def indent_after?(line)
      @config[:indent_after]&.include?(line)
    end

    # Checks if indentation should decrease before a line
    # @param line [String] The line to check
    # @return [Boolean] True if indentation should decrease
    def unindent_before?(line)
      @config[:unindent_before]&.include?(line)
    end
  end
end
