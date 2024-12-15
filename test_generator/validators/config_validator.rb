module TestGenerator
  # Class responsible for validating language configuration handlers and their required methods
  class ConfigValidator
    # List of required configuration handlers that must be present
    REQUIRED_HANDLERS = %i[
      variable_handlers
      function_handlers
      assert_conditions
      if_conditions
      control_flow
      string_handlers
      type_handlers
      naming_convention
      numeric_constants
      imports
      file_extension
      runtime_requirement
      installation_steps
      run_command
      class_wrapper
      supports_overloading
    ].freeze

    # Creates a new validator instance
    # @param config [Object] The configuration object to validate
    def initialize(config)
      @config = config.instance_variables.each_with_object({}) do |var, hash|
        hash[var.to_s.delete('@').to_sym] = config.instance_variable_get(var)
      end
    end

    # Validates a configuration by creating a new validator instance
    # @param config [Object] The configuration to validate
    # @return [Boolean] True if validation passes
    # @raise [StandardError] If validation fails
    def self.validate!(config)
      new(config).validate!
    end

    # Performs all validation checks
    # @return [Boolean] True if all validations pass
    # @raise [StandardError] If any validation fails
    def validate!
      validate_required_handlers
      validate_handler_methods
      true
    end

    private

    # Checks for presence of all required handlers
    # @raise [StandardError] If any required handlers are missing
    def validate_required_handlers
      missing = REQUIRED_HANDLERS - @config.keys
      raise "Missing required handlers: #{missing.join(', ')}" if missing.any?
    end

    # Validates all handler method requirements
    # @return [void]
    def validate_handler_methods
      validate_variable_handlers
      validate_function_handlers
      validate_control_flow
      validate_string_handlers
      validate_type_handlers
      validate_assert_conditions
      validate_if_conditions
      validate_class_wrapper
    end

    # Validates required variable handler methods
    # @return [void]
    def validate_variable_handlers
      required = %i[declaration reference field_access array_access matrix_access array_size reference_operator]
      validate_methods(@config[:variable_handlers], required, 'variable_handlers')
    end

    # Validates required function handler methods
    # @return [void]
    def validate_function_handlers
      required = %i[call test]
      validate_methods(@config[:function_handlers], required, 'function_handlers')
    end

    # Validates required control flow methods
    # @return [void]
    def validate_control_flow
      required = %i[loop while if else break end]
      validate_methods(@config[:control_flow], required, 'control_flow')
    end

    # Validates required string handler methods
    # @return [void]
    def validate_string_handlers
      required = %i[char format_string]
      validate_methods(@config[:string_handlers], required, 'string_handlers')
    end

    # Validates required type handler methods
    # @return [void]
    def validate_type_handlers
      required = %i[list class enum mapping unsigned_int float]
      validate_methods(@config[:type_handlers], required, 'type_handlers')
    end

    # Validates required assert condition methods
    # @return [void]
    def validate_assert_conditions
      required = %w[equal not_equal greater_than less_than null not_null range true false 
                    greater_than_or_equal less_than_or_equal throws not_empty contains empty]
      validate_methods(@config[:assert_conditions], required, 'assert_conditions')
    end

    # Validates required if condition methods
    # @return [void]
    def validate_if_conditions
      required = %w[greater_than true false equal not_equal]
      validate_methods(@config[:if_conditions], required, 'if_conditions')
    end

    # Validates required class wrapper methods
    # @return [void]
    def validate_class_wrapper
      required = %i[header constructor_wrapper footer]
      validate_methods(@config[:class_wrapper], required, 'class_wrapper')
    end

    # Validates that a handler has all required methods
    # @param handler [Object] The handler to validate
    # @param required_methods [Array<Symbol>] List of required method names
    # @param handler_name [String] Name of the handler for error messages
    # @raise [StandardError] If handler is invalid or missing required methods
    def validate_methods(handler, required_methods, handler_name)
      raise "Invalid or missing handler: #{handler_name}" if handler.nil? || !handler.respond_to?(:keys)

      missing = required_methods - handler.keys
      return unless missing.any?

      error_msg = "Missing required methods in #{handler_name}: #{missing.join(', ')}"
      MessageHandler.log_error(error_msg)
      raise error_msg
    end
  end
end
