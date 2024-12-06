# frozen_string_literal: true

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
      class_wrapper: {
        header: [
          "type\n",
          "TIntegrationTests = class(TTestCase)\n",
          "published\n"
        ],
        footer: [
          "end;\n",
          "\n",
          "procedure RegisterTests;\n",
          "begin\n",
          "TestFramework.RegisterTest(TIntegrationTests.Suite);\n",
          "end;\n"
        ]
      },
      test_header: ->(func_name) { "procedure TIntegrationTests.Test#{func_name.to_pascal_case}Integration;\nbegin\n" },
      variable_declaration: ->(var_name) { "#{var_name.to_camel_case} := " },
      variable_syntax: ->(var_name) { var_name.to_camel_case.to_s },
      enum_syntax: ->(enum_type, enum_value, include_semicolon = true) { "#{enum_type.to_pascal_case}.#{enum_value.to_upper_case}#{include_semicolon ? ";\n" : ''}" },
      function_pointer_syntax: ->(name) { "nil;\n" }, # TODO
      function_syntax: ->(func_name, params, include_semicolon = true) { "#{func_name.to_pascal_case}(#{params})#{include_semicolon ? ";" : ''}" },
      field_syntax: ->(variable_value, field_name) { "#{variable_value}.#{field_name}" },
      matrix_access_syntax: ->(row, col) { "[#{row}, #{col}]" },
      loop_syntax: ->(iterations) { "for i := 0 to #{iterations - 1} do\n" },
      if_syntax: ->(condition) { "if #{condition} then\n" },
      while_syntax: ->(condition) { "while #{condition} do\n" },
      footer: "end;\n",
      else_syntax: "else\n",
      break_syntax: "break;\n",
      naming_convention: :pascal_case,
      assert_equal: ->(value1, value2) { "AssertEquals(#{value1}, #{value2});\n" },
      assert_not_equal: ->(value1, value2) { "AssertNotEquals(#{value1}, #{value2});\n" },
      assert_greater_than: ->(value1, value2) { "AssertTrue(#{value1} > #{value2});\n" },
      assert_less_than: ->(value1, value2) { "AssertTrue(#{value1} < #{value2});\n" },
      assert_null: ->(value) { "AssertNull(#{value});\n" },
      assert_not_null: ->(value) { "AssertNotNull(#{value});\n" },
      assert_in_range: ->(value, min, max) { "AssertTrue((#{value} >= #{min}) and (#{value} <= #{max}));\n" },
      assert_true: ->(value) { "AssertTrue(#{value});\n" },
      assert_false: ->(value) { "AssertFalse(#{value});\n" },
      assert_greater_than_or_equal: ->(value1, value2) { "AssertTrue(#{value1} >= #{value2});\n" },
      assert_less_than_or_equal: ->(value1, value2) { "AssertTrue(#{value1} <= #{value2});\n" },
      assert_throws: ->(value) { "try\n#{value}\nexcept\nend;\n" },
      file_extension: 'pas',
      runtime_requirement: 'Free Pascal Compiler',
      installation_steps: [
        '1. Install SplashKit SDK following instructions at https://splashkit.io/installation/',
        '2. Install FPTest unit testing framework:',
        '   fppkg install fptest',
        '3. Compile: fpc integration_tests.pas'
      ].join("\n"),
      run_command: './integration_tests'
    }.freeze
  end
end

