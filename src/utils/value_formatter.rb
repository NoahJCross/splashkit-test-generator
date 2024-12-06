# Module for formatting values in test generation
module ValueFormatter
  class << self
    TODO_FUNCTIONS = [
      'simulate_key_press',
      'simulate_mouse_click',
      'simulate_key_release',
      'simulate_mouse_press',
      'simulate_mouse_release',
      'simulate_mouse_wheel_scroll',
      'simulate_mouse_move',
      'simulate_mouse_down',
      'simulate_mouse_up',
      'delete_file',
      'simulate_sprite_event'
    ]

    # Maps value types to their corresponding formatting methods
    def formatter_map
      {
        'function' => :format_function_value,
        'variable' => :format_variable_value,
        'variable_field' => :format_variable_field_value,
        'variable_matrix_access' => :format_variable_matrix_access_value,
        'primitive' => :format_primitive_value,
        'enum' => :format_enum_value
      }
    end

    # Formats the value based on its type
    def format_value(value, functions, config)
      formatter = formatter_map[value[:value_type]]
      formatter ? send(formatter, value, functions, config) : value.to_s
    end

    # Formats function values
    def format_function_value(value, functions, config)
      args = (value[:args] || []).map { |arg| format_value(arg, functions, config) }.join(', ')
      function_name = FunctionLookup.determine_function_name(value, functions, config)
      if !function_name
        raise "Function name is required for function value #{JSON.pretty_generate(value)}"
      end
      config[:function_syntax].call(function_name, args, false)
    end

    # Formats variable values
    def format_variable_value(value, _, config)
      if !value[:variable_name]
        raise "Variable name is required for variable value #{JSON.pretty_generate(value)}"
      end

      config[:variable_syntax].call(value[:variable_name])
    end

    # Formats variable field values
    def format_variable_field_value(value, functions, config)
      variable_value = format_variable_value(value, functions, config)
      config[:field_syntax].call(variable_value, value[:variable_field])
    end

    # Formats primitive values
    def format_primitive_value(value, _, _)
      value[:value].inspect
    end

    # Formats enum values
    def format_enum_value(value, _, config)
      config[:enum_syntax].call(value[:enum_type], value[:value], false)
    end

    # Formats variable matrix access values
    def format_variable_matrix_access_value(value, functions, config)
      "#{format_variable_value(value, functions, config)}#{config[:matrix_access_syntax].call(value[:row], value[:col])}"
    end
  end
end
