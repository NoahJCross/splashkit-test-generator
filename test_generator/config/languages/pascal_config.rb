# frozen_string_literal: true
# rubocop:disable Layout/HashAlignment

module LanguageConfig
  # Configuration class for generating Pascal test files
  class PascalConfig < BaseConfig
    def initialize
      super()
      self.config = DEFAULT_CONFIG.merge
    end
    DEFAULT_CONFIG = {
      supports_overloading: true,
      imports: [
        "uses SplashKit, TestFramework\n\n"
      ],

      naming_convention: ->(name) { name.to_pascal_case },

      assert_conditions: {
        'equal'                   => ->(v1, v2, _)    { "AssertEquals(#{v1}, #{v2});\n" },
        'not_equal'               => ->(v1, v2, _)    { "AssertNotEquals(#{v1}, #{v2});\n" },
        'greater_than'            => ->(v1, v2, _)    { "AssertTrue(#{v1} > #{v2});\n" },
        'less_than'               => ->(v1, v2, _)    { "AssertTrue(#{v1} < #{v2});\n" },
        'null'                    => ->(v1, _, _)     { "AssertNull(#{v1});\n" },
        'not_null'                => ->(v1, _, _)     { "AssertNotNull(#{v1});\n" },
        'range'                   => ->(v1, v2, v3)   { "AssertTrue((#{v1} >= #{v2}) and (#{v1} <= #{v3}));\n" },
        'true'                    => ->(v1, _, _)     { "AssertTrue(#{v1});\n" },
        'false'                   => ->(v1, _, _)     { "AssertFalse(#{v1});\n" },
        'greater_than_or_equal'   => ->(v1, v2, _)    { "AssertTrue(#{v1} >= #{v2});\n" },
        'less_than_or_equal'      => ->(v1, v2, _)    { "AssertTrue(#{v1} <= #{v2});\n" },
        'throws'                  => ->(v1, _, _)     { "try\n#{v1}\nexcept\nend;\n" },
        'not_empty'               => ->(v1, _, _)     { "AssertTrue(Length(#{v1}) > 0);\n" },
        'contains'                => ->(v1, v2, _)    { "AssertTrue(Pos(#{v1}, #{v2}) > 0);\n" },
        'empty'                   => ->(v1, _, _)     { "AssertTrue(Length(#{v1}) = 0);\n" }
      }.freeze,

      if_conditions: {
        'greater_than' => ->(v1, v2) { "#{v1} > #{v2}" },
        'true'         => ->(v1, _)  { "#{v1} = true" },
        'false'        => ->(v1, _)  { "#{v1} = false" },
        'equal'        => ->(v1, v2) { "#{v1} = #{v2}" },
        'not_equal'    => ->(v1, v2) { "#{v1} <> #{v2}" }
      }.freeze,

      control_flow: {
        loop:      ->(iterations) { "for i := 0 to #{iterations - 1} do\n" },
        while:     ->(condition) { "while #{condition} do\n" },
        if:        ->(condition) { "if #{condition} then\n" },
        else:      -> { "else\n" },
        break:     -> { "break;\n" },
        end:       -> { "end;\n" }
      }.freeze,

      string_handlers: {
        interpolation: ->(expr) { "' + #{expr} + '" },
        concatenation: ->(parts) { "'#{parts.join}'" },
        char:          ->(value) { "'#{value}'" }
      }.freeze,

      numeric_constants: {
        'inf'          => 'MaxDouble',
        'neg_inf'      => '-MaxDouble',
        'max_value'    => 'MaxSingle'
      }.freeze,

      type_handlers: {
        list:      ->(values, target_type = nil) { 
          mapped_type = DEFAULT_CONFIG[:type_handlers][:mapping][target_type] || target_type || 'Integer'
          "TArray<#{mapped_type}>.Create(#{values})" 
        },
        class:     ->(name, args) { "#{name}.Create(#{args})" },
        mapping:   {
          'bool'   => 'Boolean',
          'double' => 'Double',
          'string' => 'String',
          'json'   => 'Json',
          'line'   => 'Line'
        }.freeze,
        enum:      ->(type, value, semicolon = true) { 
          "#{type.to_pascal_case}.#{value.to_upper_case}#{semicolon ? ";\n" : ''}" 
        }
      }.freeze,

      variable_handlers: {
        declaration:   ->(name) { "#{name.to_camel_case} := " },
        reference:     ->(name) { name.to_camel_case.to_s },
        field_access:  ->(var, field) { "#{var}.#{field}" },
        array_access:  ->(arr, idx) { "#{arr}[#{idx}]" },
        matrix_access: ->(var, row, col) { "#{var}[#{row}, #{col}]" }
      }.freeze,

      function_handlers: {
        call:      ->(name, params, semicolon = true) { "#{name.to_pascal_case}(#{params})#{semicolon ? ';' : ''}" },
        pointer:   ->(_) { "nil;\n" },
        test:      ->(name) { "procedure TIntegrationTests.Test#{name.to_pascal_case}Integration;\nbegin\n" }
      }.freeze,

      class_wrapper: {
        header: [
          "type\n",
          ->(group) { "TTest#{group.to_pascal_case} = class(TTestCase)\n" },
          "protected\n"
        ],
        constructor_wrapper: {
          header: "procedure Setup; override;\nbegin\n  inherited;\n",
          footer: "end;\n\npublished\n"
        },
        footer: [
          "end;\n",
          "\n",
          "procedure RegisterTests;\n",
          "begin\n",
          ->(group) { "TestFramework.RegisterTest(TTest#{group.to_pascal_case}.Suite);\n" },
          "end;\n"
        ]
      }.freeze,

      file_extension: 'pas',
      runtime_requirement: 'Free Pascal Compiler',
      installation_steps: [
        '1. Install SplashKit SDK following instructions at https://splashkit.io/installation/',
        '2. Install FPTest unit testing framework:',
        '   fppkg install fptest',
        '3. Compile: fpc integration_tests.pas'
      ].join("\n"),
      run_command: './integration_tests',
    }.freeze
  end
end

