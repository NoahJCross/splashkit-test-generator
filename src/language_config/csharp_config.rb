# frozen_string_literal: true

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
        "using static SplashKitSDK.SplashKit;\n\n",
      ],
      class_wrapper: {
        header: [
          "namespace SplashKitTests\n",
          "{\n",
          "public class IntegrationTests\n",
          "{\n"
        ],
        footer: [
          "}\n",
          "}\n"
        ],
        indent_after: ["{\n"],
        unindent_before: ["}\n"]
      },
      test_header: ->(func_name) { "[Fact]\npublic void Test#{func_name.to_pascal_case}Integration()\n{\n" },
      variable_declaration: ->(var_name) { "var #{var_name.to_camel_case} = " },
      variable_syntax: ->(var_name) { var_name.to_camel_case.to_s },
      enum_syntax: ->(enum_type, enum_value, include_semicolon = true) { "#{enum_type.to_pascal_case}.#{enum_value.to_pascal_case}#{include_semicolon ? ";\n" : ''}" },
      function_pointer_syntax: ->(name) { "null;\n" }, # TODO
      function_syntax: ->(func_name, params, include_semicolon = true) { "#{func_name.to_pascal_case}(#{params})#{include_semicolon ? ";" : ''}" },
      field_syntax: ->(variable_value, field_name) { "#{variable_value}.#{field_name.capitalize}" },
      matrix_access_syntax: ->(row, col) { "[#{row}, #{col}]" },
      loop_syntax: ->(iterations) { "for (int i = 0; i < #{iterations}; i++) {\n" },
      if_syntax: ->(condition) { "if (#{condition}) {\n" },
      while_syntax: ->(condition) { "while (#{condition}) {\n" },
      footer: "}\n",
      break_syntax: "break;\n",
      else_syntax: "else\n{\n",
      naming_convention: :pascal_case,
      assert_equal: ->(value1, value2) { "Assert.Equal(#{value2}, #{value1});\n" },
      assert_not_equal: ->(value1, value2) { "Assert.NotEqual(#{value2}, #{value1});\n" },
      assert_greater_than: ->(value1, value2) { "Assert.True(#{value1} > #{value2});\n" },
      assert_less_than: ->(value1, value2) { "Assert.True(#{value1} < #{value2});\n" },
      assert_null: ->(value) { "Assert.Null(#{value});\n" },
      assert_not_null: ->(value) { "Assert.NotNull(#{value});\n" },
      assert_in_range: ->(value, min, max) { "Assert.InRange(#{value}, #{min}, #{max});\n" },
      assert_true: ->(value) { "Assert.True(#{value});\n" },
      assert_false: ->(value) { "Assert.False(#{value});\n" },
      assert_greater_than_or_equal: ->(value1, value2) { "Assert.True(#{value1} >= #{value2});\n" },
      assert_less_than_or_equal: ->(value1, value2) { "Assert.True(#{value1} <= #{value2});\n" },
      assert_throws: ->(value) { "Assert.Throws<Exception>(() => { #{value} });\n" },
      file_extension: 'cs',
      runtime_requirement: '.NET',
      installation_steps: [
        '1. Install SplashKit SDK following instructions at https://splashkit.io/installation/',
        '2. Create new test project: dotnet new xunit',
        '3. Install Xunit: dotnet add package Xunit',
        '4. Add SplashKit: dotnet add package SplashKit'
      ].join("\n"),
      run_command: 'dotnet test'
    }.freeze
  end
end

