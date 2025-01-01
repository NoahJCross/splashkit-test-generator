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
    # @param config [Hash] The language configuration
    # @return [String] The indented text
    def indent(text, config)
      text_str = text.to_s
      # Check for reset patterns and their target levels
      check_reset_patterns(text_str, config)
      config.indentation[:unindent_before]&.any? { |pattern| text_str.end_with?(pattern) } && decrease_indent
      indented_text = "#{' ' * (@level * @indent_size)}#{text_str.strip}\n"
      config.indentation[:indent_after]&.any? { |pattern| text_str.end_with?(pattern) } && increase_indent
      indented_text
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
    def format_line(line, config)
      return '' if line.nil? || line.empty?

      indent(line.strip, config)
    end


    private

    def check_reset_patterns(text_str, config)
      config.indentation[:reset_on]&.each do |pattern, target_level|
        if text_str.strip.start_with?(pattern)
          @level = target_level
          break
        end
      end
    end
  end
end
