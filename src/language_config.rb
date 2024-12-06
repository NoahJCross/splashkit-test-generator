# frozen_string_literal: true

require_relative 'language_config/base_config'
Dir[File.join(__dir__, 'language_config', '*_config.rb')].sort.each { |file| require file }

# Configuration for different language test generators
module LanguageConfig
  # List of supported languages
  SUPPORTED_LANGUAGES = %i[python cpp rust csharp pascal].freeze

  # Returns the configuration for a specified language
  def self.for_language(language)
    # Dynamically get the configuration class for the specified language
    config_class = Object.const_get("LanguageConfig::#{language.to_s.capitalize}Config")
    config_class.new.get
  rescue NameError
    raise "Unsupported language: #{language}"
  end
end
