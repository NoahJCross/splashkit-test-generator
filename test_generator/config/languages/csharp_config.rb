# frozen_string_literal: true
# rubocop:disable Layout/HashAlignment

module LanguageConfig
  # Configuration class for generating Csharp test files
  class CsharpConfig < BaseConfig
    def initialize
      super()
      self.config = DEFAULT_CONFIG.merge
    end
    DEFAULT_CONFIG = {
      supports_overloading: true,
      imports: [
        "using Xunit;\n",
        "using static SplashKitSDK.SplashKit;\n\n"
      ],
      naming_convention: ->(name) { name.to_pascal_case },
      

      assert_conditions: {
        'equal'                   => ->(v1, v2, _)    { "Assert.Equal(#{v1}, #{v2});\n" },
        'not_equal'               => ->(v1, v2, _)    { "Assert.NotEqual(#{v1}, #{v2});\n" },
        'greater_than'            => ->(v1, v2, _)    { "Assert.True(#{v1} > #{v2});\n" },
        'less_than'               => ->(v1, v2, _)    { "Assert.True(#{v1} < #{v2});\n" },
        'null'                    => ->(v1, _, _)     { "Assert.Null(#{v1});\n" },
        'not_null'                => ->(v1, _, _)     { "Assert.NotNull(#{v1});\n" },
        'range'                   => ->(v1, v2, v3)   { "Assert.InRange(#{v1}, #{v2}, #{v3});\n" },
        'true'                    => ->(v1, _, _)     { "Assert.True(#{v1});\n" },
        'false'                   => ->(v1, _, _)     { "Assert.False(#{v1});\n" },
        'greater_than_or_equal'   => ->(v1, v2, _)    { "Assert.True(#{v1} >= #{v2});\n" },
        'less_than_or_equal'      => ->(v1, v2, _)    { "Assert.True(#{v1} <= #{v2});\n" },
        'throws'                  => ->(v1, _, _)     { "Assert.Throws<Exception>(() => { #{v1} });\n" },
        'not_empty'               => ->(v1, _, _)     { "Assert.NotEmpty(#{v1});\n" },
        'contains'                => ->(v1, v2, _)    { "Assert.Contains(#{v1}, #{v2});\n" },
        'empty'                   => ->(v1, _, _)     { "Assert.Empty(#{v1});\n" }
      }.freeze,

      if_conditions: {
        'greater_than' => ->(v1, v2) { "#{v1} > #{v2}" },
        'true'         => ->(v1, _)  { "#{v1} == true" },
        'false'        => ->(v1, _)  { "!#{v1}" },
        'equal'        => ->(v1, v2) { "#{v1} == #{v2}" },
        'not_equal'    => ->(v1, v2) { "#{v1} != #{v2}" }
      }.freeze,

      numeric_constants: {
        infinity: 'float.PositiveInfinity',
        negative_infinity: 'float.NegativeInfinity',
        max_value: 'float.MaxValue'
      }.freeze,

      control_flow: {
        loop:      ->(iterations) { "for (int i = 0; i < #{iterations}; i++) {\n" },
        while:     ->(condition) { "while (#{condition}) {\n" },
        if:        ->(condition) { "if (#{condition}) {\n" },
        else:      -> { "else\n{\n" },
        break:     -> { "break;\n" },
        end:       -> { "}\n" }
      }.freeze,

      string_handlers: {
        interpolation: ->(expr) { "{#{expr}}" },
        concatenation: ->(parts) { "$\"#{parts.join}\"" },
        char:          ->(value) { "'#{value}'" }
      }.freeze,

      type_handlers: {
        list:      ->(values, target_type = nil) { 
          mapped_type = DEFAULT_CONFIG[:type_handlers][:mapping][target_type] || target_type || 'dynamic'
          "new List<#{mapped_type}> { #{values} }" 
        },
        class:     ->(name, args) { "new #{name}(#{args})" },
        mapping:   {
          'json' => 'Json',
          'line' => 'Line'
        }.freeze,
        enum:      ->(type, value, semicolon = true) { 
          "#{type.to_pascal_case}.#{value.to_pascal_case}#{semicolon ? ";\n" : ''}" 
        },
        unsigned_int: ->(value) { "#{value}u" },
        float: ->(value) { "#{value}f" }
      }.freeze,

      variable_handlers: {
        declaration:   ->(name) { "var #{name.to_camel_case} = " },
        reference:     ->(name) { name.to_camel_case.to_s },
        field_access: ->(var, field) { 
          formatted_field = field.split('.').map(&:to_pascal_case).join('.')
          "#{var}.#{formatted_field}"
        },
        array_access:  ->(arr, idx) { "#{arr}[#{idx}]" },
        matrix_access: ->(var, row, col) { "#{var}[#{row}, #{col}]" },
        array_size:    ->(arr) { "#{arr}.Count" },
        reference_operator: ->(var) { "ref #{var}" }
      }.freeze,

      function_handlers: {
        call:      ->(name, params, semicolon = true) { "#{name.to_pascal_case}(#{params})#{semicolon ? ';' : ''}" },
        pointer:   ->(_) { "null;\n" },
        test:      ->(name) { "[Fact]\npublic void Test#{name.to_pascal_case}Integration()\n{\n" }
      }.freeze,

      class_wrapper: {
        header: [
          "namespace SplashKitTests\n",
          "{\n",
          ->(group) { "public class Test#{group.to_pascal_case}\n" },
          "{\n"
        ],
        constructor_wrapper: {
          header: ->(group) { "public Test#{group.to_pascal_case}()\n{\n" },
          footer: "}\n\n"
        },
        footer: [
          "}\n",
          "}\n"
        ],
        indent_after: ["{\n"],
        unindent_before: ["}\n"]
      }.freeze,
      file_extension: 'cs',
      runtime_requirement: '.NET',
      installation_steps: [
        '1. Install SplashKit SDK following instructions at https://splashkit.io/installation/',
        '2. Create new test project: dotnet new xunit',
        '3. Install Xunit: dotnet add package Xunit',
        '4. Add SplashKit: dotnet add package SplashKit'
      ].join("\n"),
      run_command: 'dotnet test',
    }.freeze
  end
end
