# frozen_string_literal: true

# Module for handling error and warning messages
module MessageHandler
  class << self
    # Colorizes the given text with the specified color code
    def colorize(text, color_code)
      "\e[#{color_code}m#{text}\e[0m"
    end

    # Handles unsupported comparison types by logging an error message and raising an exception
    def handle_unsupported_comparison(comparison, function_name)
      puts "\n#{colorize('ERROR: Unsupported comparison type in step for function:', '31')}"
      puts colorize(function_name.to_s, '33')
      puts JSON.pretty_generate(comparison)
      raise "Unsupported comparison type: #{comparison[:compare_type]}"
    end
  end
end
