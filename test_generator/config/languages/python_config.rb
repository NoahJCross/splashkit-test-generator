# frozen_string_literal: true
# rubocop:disable Layout/HashAlignment

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
        "import pytest\n",
        "from splashkit import *\n\n",
      ],

      naming_convention: ->(name) { name.to_snake_case },


      assert_conditions: {
        'equal'                   => ->(v1, v2, _)    { "assert #{v1} == #{v2}\n" },
        'not_equal'               => ->(v1, v2, _)    { "assert #{v1} != #{v2}\n" },
        'greater_than'            => ->(v1, v2, _)    { "assert #{v1} > #{v2}\n" },
        'less_than'               => ->(v1, v2, _)    { "assert #{v1} < #{v2}\n" },
        'null'                    => ->(v1, _, _)     { "assert #{v1} is None\n" },
        'not_null'                => ->(v1, _, _)     { "assert #{v1} is not None\n" },
        'range'                   => ->(v1, v2, v3)   { "assert #{v2} <= #{v1} <= #{v3}\n" },
        'true'                    => ->(v1, _, _)     { "assert #{v1}\n" },
        'false'                   => ->(v1, _, _)     { "assert not #{v1}\n" },
        'greater_than_or_equal'   => ->(v1, v2, _)    { "assert #{v1} >= #{v2}\n" },
        'less_than_or_equal'      => ->(v1, v2, _)    { "assert #{v1} <= #{v2}\n" },
        'throws'                  => ->(v1, _, _)     { "with pytest.raises(Exception):\n    #{v1}\n" },
        'not_empty'               => ->(v1, _, _)     { "assert len(#{v1}) > 0\n" },
        'contains'                => ->(v1, v2, _)    { "assert #{v1} in #{v2}\n" },
        'empty'                   => ->(v1, _, _)     { "assert len(#{v1}) == 0\n" }
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
        loop:      ->(iterations) { "for _ in range(#{iterations}):\n" },
        while:     ->(condition) { "while #{condition}:\n" },
        if:        ->(condition) { "if #{condition}:\n" },
        else:      -> { "else:\n" },
        break:     -> { "break\n" },
        end:       -> { "\n" }
      }.freeze,

      string_handlers: {
        interpolation: ->(expr) { "{#{expr}}" },
        concatenation: ->(parts) { "f\"#{parts.join}\"" },
        char:          ->(value) { "'#{value}'" }
      }.freeze,

      type_handlers: {
        list:      ->(values, _) { "[#{values}]" },
        class:     ->(name, args) { "#{name}(#{args})" },
        mapping:   {
          'double' => 'float',
          'string' => 'str',
          'json' => 'Json',
          'line' => 'Line'
        }.freeze,
        enum:      ->(type, value, semicolon = true) { 
          "#{type.to_pascal_case}.#{value.to_pascal_case}#{semicolon ? ";\n" : ''}" 
        },
        unsigned_int: ->(value) { value },
        float: ->(value) { value }
      }.freeze,

      variable_handlers: {
        declaration:   ->(name) { "#{name.to_snake_case} = " },
        reference:     ->(name) { name.to_snake_case },
        field_access:  ->(var, field) { "#{var}.#{field}" },
        array_access:  ->(arr, idx) { "#{arr}[#{idx}]" },
        matrix_access: ->(var, row, col) { "#{var}[#{row}][#{col}]" },
        array_size:    ->(arr) { "len(#{arr})" },
        reference_operator: ->(var) { var }
      }.freeze,

      function_handlers: {
        call:      ->(name, params, _ = true) { "#{name.to_snake_case}(#{params})" },
        pointer:   ->(_) { "None\n" },
        test:      ->(name) { "\ndef test_#{name.to_snake_case}_integration():\n" }
      }.freeze,

      class_wrapper: {
        header: [->(group) { "class Test#{group.to_pascal_case}:\n" }],
        constructor_wrapper: {
          header: "def setup_method(self):\n",
          footer: "\n"
        },
        footer: [],
        indent_after: [->(group) { "class Test#{group.to_pascal_case}:\n" }],
        unindent_before: []
      }.freeze,

      file_extension: 'py',
      runtime_requirement: 'Python 3',
      installation_steps: [
        '1. Install SplashKit SDK following instructions at https://splashkit.io/installation/',
        '2. Install pytest: pip install pytest'
      ].join("\n"),
      run_command: 'skm python3 integration_tests.py',
    }.freeze
  end
end
