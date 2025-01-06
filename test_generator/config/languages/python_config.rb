module LanguageConfig
  # Configuration class for generating python test files
  class PythonConfig < BaseConfig
    def initialize
      super()
      self.config = DEFAULT_CONFIG.merge
    end
    DEFAULT_CONFIG = {
      supports_overloading: false,
      imports: [
        'import pytest',
        'from splashkit import *',
        'from ..helpers import *',
        'import contextlib'
      ],

      naming_convention: ->(name) { name.to_snake_case },


      assert_conditions: {
        'equal'                   => ->(v1, v2, precision = nil) { precision ? "assert abs(#{v1} - #{v2}) <= #{precision}" : "assert #{v1} == #{v2}" },
        'not_equal'               => ->(v1, v2, _)    { "assert #{v1} != #{v2}" },
        'greater_than'            => ->(v1, v2, _)    { "assert #{v1} > #{v2}" },
        'less_than'               => ->(v1, v2, _)    { "assert #{v1} < #{v2}" },
        'null'                    => ->(v1, _, _)     { "assert #{v1} is None" },
        'not_null'                => ->(v1, _, _)     { "assert #{v1} is not None" },
        'range'                   => ->(v1, v2, v3)   { "assert #{v2} <= #{v1} <= #{v3}" },
        'true'                    => ->(v1, _, _)     { "assert #{v1}" },
        'false'                   => ->(v1, _, _)     { "assert not #{v1}" },
        'greater_than_or_equal'   => ->(v1, v2, _)    { "assert #{v1} >= #{v2}" },
        'less_than_or_equal'      => ->(v1, v2, _)    { "assert #{v1} <= #{v2}" },
        'throws'                  => ->(v1, _, _)     { "with pytest.raises(Exception):    #{v1}" },
        'not_empty'               => ->(v1, _, _)     { "assert len(#{v1}) > 0" },
        'contains'                => ->(v1, v2, _)    { "assert #{v1} in #{v2}" },
        'empty'                   => ->(v1, _, _)     { "assert len(#{v1}) == 0" }
      }.freeze,

      if_conditions: {
        'greater_than' => ->(v1, v2) { "#{v1} > #{v2}" },
        'true'         => ->(v1, _)  { "#{v1} is True" },
        'false'        => ->(v1, _)  { "#{v1} is False" },
        'equal'        => ->(v1, v2) { "#{v1} == #{v2}" },
        'not_equal'    => ->(v1, v2) { "#{v1} != #{v2}" }
      }.freeze,

      numeric_constants: {
        infinity: "float('inf')",
        negative_infinity: "float('-inf')",
        max_value: '3.4028235e+38'
      }.freeze,

      control_flow: {
        loop:      ->(iterations) { "for _ in range(#{iterations}):" },
        while:     ->(condition) { "while #{condition}:" },
        if:        ->(condition) { "if #{condition}:" },
        else:      -> { 'else:' },
        break:     -> { 'break' },
        end:       -> { '' },
        new_line: "'\'"
      }.freeze,

      string_handlers: {
        interpolation: ->(expr) { "{#{expr}}" },
        char:          ->(value) { "'#{value}'" },
        string_ref: ->(value) { value },
        format_string: ->(text_parts, expressions) {
          "f\"#{text_parts.zip(expressions.map { |e| "{#{e}}" }).flatten.compact.join}\""
        }
      }.freeze,

      type_handlers: {
        list:      ->(values, _) { "[#{values}]" },
        class_instance:     ->(name, args) { "#{name}(#{args})" },
        mapping:   {
          'double' => 'float',
          'string' => 'str',
          'json' => 'Json',
          'line' => 'Line'
        }.freeze,
        enum:      ->(type, value, semicolon = true) { 
          "#{type.to_pascal_case}.#{value.to_pascal_case}#{semicolon ? ';' : ''}" 
        },
        string: ->(value) { "\"#{value}\"" },
        object: ->(object_type, variable_name) { {
          object_type: object_type.to_pascal_case,
          variable_name: variable_name.to_snake_case
        } }
      }.freeze,

      literal_cast: {
        unsigned_int: ->(value) { value },
        float: ->(value) { value },
        double: ->(value) { value },
      }.freeze,

      variable_handlers: {
        declaration: {
          regular: ->(name) { "#{name.to_snake_case} = " },
          mutable: ->(name) { "#{name.to_snake_case} = " }
        },
        identifier:     ->(name) { name.to_snake_case },
        field_access:  ->(var, field) { "#{var}.#{field}" },
        method_call: ->(var, field) { "#{var}.#{field}()" },
        array_access:  ->(arr, idx) { "#{arr}[#{idx}]" },
        matrix_access: ->(var, row, col) { "#{var}[#{row}][#{col}]" },
        array_size:    ->(arr) { "len(#{arr})" },
        reference_operator: ->(var) { var }
      }.freeze,

      function_handlers: {
        call:      ->(name, params, _ = true) { "#{name.to_snake_case}(#{params})" },
        pointer:   ->(_) { 'None' },
        test:      ->(_, name) { ["def test_#{name.to_snake_case}_integration():"] }
      }.freeze,

      comment_syntax: {
        single: '#',
        multi_start: "'''",
        multi_end: "'''",
      }.freeze,

      class_wrapper: {
        header: [->(group) { "class Test#{group.to_pascal_case}:" }],
        constructor_wrapper: {
          header: ['def setup_method(self):'],
          footer: ['']
        },
        footer: []
      }.freeze,

      cleanup_handlers: {
        setup: ->(_, type, args = nil) {
          "with #{type}_cleanup(#{args}):"
        }
      }.freeze,

      indentation: {
        indent_after: [':'],
        unindent_before: ['finally:', 'except:', 'else:', 'elif:'],
        reset_on: {
          '@contextlib.contextmanager' => 1,
          'def' => 1,
          'while' => 2
        }
      }.freeze,

      terminal_handlers: {
        message: ->(text) { "print(\"#{text}\", end=\"\")" }
      }.freeze,

      file_extension: 'py'
    }.freeze
  end
end
