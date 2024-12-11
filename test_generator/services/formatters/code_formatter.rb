module TestGenerator
  # Class responsible for handling code indentation and formatting in test generation
  class CodeFormatter
    attr_reader :level

    def initialize(indent_size)
      @indent_size = indent_size
      @level = 0
    end

    # Indents text with the current indentation level
    # @param text [String, Object] The text to indent
    # @return [String] The indented text
    def indent(text)
      spaces = ' ' * (@level * @indent_size)
      if text.is_a?(String)
        text.lines.map { |line| "#{spaces}#{line.chomp}" }.join("\n") << "\n"
      else
        "#{spaces}#{text}"
      end
    end

    # Increases the indentation level by one
    # @return [void]
    def increase_indent
      @level += 1
    end

    # Decreases the indentation level by one if possible
    # @return [void]
    def decrease_indent
      @level -= 1 if @level > 0
    end

    # Formats and indents a single line of code
    # @param line [String] The line to format
    # @return [String] The formatted and indented line
    def format_line(line)
      return '' if line.nil? || line.empty?

      indent(line.strip)
    end
  end
end
