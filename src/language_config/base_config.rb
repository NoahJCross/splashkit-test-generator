# frozen_string_literal: true

module LanguageConfig
  # Base configuration class for all language configurations
  class BaseConfig
    def initialize
      @config = {
        imports: [],
        indent_size: 4,
        naming_convention: :snake_case,
        comment_syntax: ->(text) { text.split("\n").map { |line| "// #{line}" }.join("\n") },
        package_manager: 'SplashKit SDK'
      }
    end

    def get
      @config
    end

    def config=(options)
      @config.merge!(options)
    end
  end
end

