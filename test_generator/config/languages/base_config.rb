module LanguageConfig
  # Base configuration class for all language configurations
  class BaseConfig
    def initialize
      @config = {
        imports: [],
        indent_size: 4,
        naming_convention: ->(value) { value.to_snake_case },
        comment_syntax: {
          single: '//',
          multi_start: '/*',
          multi_end: '*/'
        },
        package_manager: 'SplashKit SDK',
        literal_cast: {
          unsigned_int: ->(value) { value.to_s },
          float: ->(value) { value.to_s },
          double: ->(value) { value.to_s }
        },
        comparison_cast: {
          unsigned_int: ->(value) { value.to_s },
          float: ->(value) { value.to_s },
          double: ->(value) { value.to_s }
        }
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
