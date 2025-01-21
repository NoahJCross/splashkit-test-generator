# Core Ruby libraries
require 'json'
require 'fileutils'

# Configuration
require_relative 'test_generator/config/language_config'

# Core data models
require_relative 'test_generator/models/function'
require_relative 'test_generator/models/parameter'

# Service handlers for messages and class wrapping
require_relative 'test_generator/services/handlers/class_wrapper_handler'
require_relative 'test_generator/services/handlers/constructor_handler'
require_relative 'test_generator/services/handlers/tear_down_handler'

# Code and value formatting services
require_relative 'test_generator/services/formatters/code_formatter'
require_relative 'test_generator/services/formatters/value_formatter'

# Test writing services
require_relative 'test_generator/services/writers/step_writer'
require_relative 'test_generator/services/writers/test_case'
require_relative 'test_generator/services/writers/test_writer'

# Test loading services
require_relative 'test_generator/services/loaders/test_loader'

# Configuration validation
require_relative 'test_generator/validators/config_validator'
require_relative 'test_generator/validators/source_validator'

# Utility classes
require_relative 'test_generator/utils/function_lookup'
require_relative 'test_generator/utils/parser'
require_relative 'test_generator/utils/pascal_variable_collector'
require_relative 'test_generator/utils/cmake_builder'
require_relative 'test_generator/utils/binding_fetcher'

# Shared utilities
require_relative 'shared/utils/lib_processor'
require_relative 'shared/utils/directory_manager'
require_relative 'shared/handlers/message_handler'
require_relative 'shared/extensions/string_extensions'

# Custom error definitions
require_relative 'test_generator/errors/test_generator_errors'
