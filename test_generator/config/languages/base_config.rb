module LanguageConfig
  # Base configuration class for all language configurations
  class BaseConfig
    def initialize
      @config = {
        imports: [],
        indent_size: 4,
        assignment_operator: '=',
        identifier_cases: {
          types:      :pascal_case,
          functions:  :snake_case,
          variables:  :snake_case,
          fields:     :snake_case,
          constants:  :upper_case
        },

        function_handlers: {
          call: ->(name, params) { "#{apply_case(name, :functions)}(#{params})" },
          test: ->(_, name) { ["test_#{apply_case(name, :functions)}"] }
        },

        type_handlers: {
          list:           method(:format_list),
          class_instance: method(:format_class_instance),
          mapping:        {},
          enum:           method(:format_enum),
          string:         {},
        },

        literal_cast: {
          unsigned_int: ->(value) { value },
          float: ->(value) { value },
          double: ->(value) { value }
        },

        comparison_cast: {
          unsigned_int: ->(value) { value },
          float: ->(value) { value },
          double: ->(value) { value }
        },

        variable_handlers: {
          declaration: {
            regular: ->(name) { "#{var_keyword}#{add_space}#{apply_case(name, :variables)} #{assignment_operator} " },
            string: ->(name) { "#{string_assignment_operator}#{add_space}#{apply_case(name, :variables)} #{assignment_operator} " },
            mutable: ->(name) { "#{var_mut_keyword}#{add_space}#{apply_case(name, :variables)} #{assignment_operator} " },
            reassignment: ->(name) { "#{apply_case(name, :variables)} #{assignment_operator} " }
          },
          identifier: ->(name) { apply_case(name, :variables) },
          field_access: method(:format_field_access),
          method_call: method(:format_method_call),
          array_access: method(:format_array_access),
          matrix_access: method(:format_matrix_access),
          reference_operator: ->(var) { var }
        },

        list_handlers: {
          prefix: ->(_) { '[' },
          suffix: ']',
          separator: ',',
          type_wrapper: ->(type) { type }
        },

        enum_handlers: {
          separator: '.'
        },

        array_handlers: {
          prefix: ->(arr) { "#{apply_case(arr, :variables)}[" },
          suffix: ']',
          separator: ']['
        },

        method_handlers: {
          prefix: ->(var, method) { "#{var}.#{apply_case(method, :functions)}(" },
          suffix: ')',
          separator: ', '
        },

        class_handlers: {
          prefix: ->(name) { "#{apply_case(name, :types)}(" },
          suffix: ')',
          separator: ', '
        }.freeze,
      }
    end

    def get
      @config
    end

    def config=(options)
      @config.merge!(options)
    end

    private

    def var_keyword
      @config[:var_keyword]
    end

    def var_mut_keyword
      @config[:var_keyword] + (@config[:var_mut_keyword] ? " #{@config[:var_mut_keyword]}" : '')
    end

    def assignment_operator
      @config[:assignment_operator]
    end

    def string_assignment_operator
      @config[:string_keyword] || var_keyword
    end

    def add_space
      @config[:var_keyword].empty? ? '' : ' '
    end

    def format_field_access(var, field)
      parts = field.split('.')
      formatted_parts = []
      parts.each do |part|
        formatted_parts << apply_case(part, :fields)
      end
      "#{var}.#{formatted_parts.join('.')}"
    end

    def format_matrix_access(var, row, col)
      formatted_var = apply_case(var, :variables)
      separator = @config[:array_handlers][:matrix_separator] || @config[:array_handlers][:separator]
      "#{formatted_var}[#{row}#{separator}#{col}]"
    end

    def apply_case(value, type)
      case @config[:identifier_cases][type]
      when :snake_case then value.to_snake_case
      when :pascal_case then value.to_pascal_case
      when :camel_case then value.to_camel_case
      when :upper_case then value.to_upper_case
      else value
      end
    end

    def format_list(values, target_type = nil)
      handlers = @config[:list_handlers]
      if target_type
        mapped_type = @config[:type_mapping]&.[](target_type) || target_type
        type_str = handlers[:type_wrapper] ? handlers[:type_wrapper].call(mapped_type) : ''
      else
        type_str = ''
      end
      "#{handlers[:prefix].call(type_str)}#{values.join(handlers[:separator])}#{handlers[:suffix]}"
    end

    def format_enum(type, value)
      type_formatted = apply_case(type, :types)
      value_formatted = apply_case(value, :constants)
      separator = @config[:enum_handlers][:separator]
      "#{type_formatted}#{separator}#{value_formatted}"
    end

    def format_array_access(var, *indices)
      handlers = @config[:array_handlers]
      "#{handlers[:prefix].call(var)}#{indices.join(handlers[:separator])}#{handlers[:suffix]}"
    end

    def format_method_call(var, method, *args)
      handlers = @config[:method_handlers]
      "#{handlers[:prefix].call(var, method)}#{args.join(handlers[:separator])}#{handlers[:suffix]}"
    end

    def format_class_instance(name, args)
      handlers = @config[:class_handlers]
      formatted_name = apply_case(name, :types)
      formatted_args = args.join(handlers[:separator])
      "#{handlers[:prefix].call(formatted_name)}#{formatted_args}#{handlers[:suffix]}"
    end

    def deep_merge(base, override)
      result = base.dup
      override.each do |key, value|
        if value.is_a?(Hash) && result[key].is_a?(Hash)
          result[key] = deep_merge(result[key], value)
        elsif value.is_a?(Array) && result[key].is_a?(Array)
          result[key] = result[key] + value
        else
          result[key] = value
        end
      end
      result
    end
  end
end
