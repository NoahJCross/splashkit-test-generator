# frozen_string_literal: true

module TestGenerator
  # Module for looking up tests and functions by their unique names
  module FunctionLookup
    # Determines the appropriate function name based on the step configuration
    # @param step [Hash] The step containing the function name
    # @param config [Object] The language configuration object
    # @param functions [Array<Function>] List of available functions
    # @return [String] The formatted function name according to language convention
    # @raise [Error] If global function is not found
    def self.determine_function_name(step, config, functions)
      unique_global_name = step[:function_name]
      function = functions.find { |func| func.unique_global_name.downcase == unique_global_name.downcase }
      raise HandlerError, "Function '#{unique_global_name}' not found in available functions." if function.nil?

      MessageHandler.log_info("Found function: #{function.name}")
      config.naming_convention.call(function.name)
    rescue NoMethodError => e
      raise HandlerError, "Error processing function '#{unique_global_name}': #{e.message}"
    end

    # Retrieves a test with a given function name
    # @param function [Object] The function object
    # @param group_tests [Hash] Available group tests
    # @return [Hash, nil] The matching test or nil if not found
    def self.get_test_by_function_name(function, group_tests)
      group = function.group || 'ungrouped'
      tests = group_tests[group]
      tests.find { |t| t[:name] == function.unique_global_name }
    end

    # Finds a function by its unique global name
    # @param unique_global_name [String] The unique global name to search for
    # @param functions [Array] List of available functions
    # @return [Object, nil] The matching function or nil if not found
    def self.get_function_by_unique_global_name(unique_global_name, functions)
      function = functions.find { |func| func.unique_global_name == unique_global_name.downcase }
      MessageHandler.log_warning("Function with unique global name '#{unique_global_name}' not found") if function.nil?
      function
    end
  end
end
