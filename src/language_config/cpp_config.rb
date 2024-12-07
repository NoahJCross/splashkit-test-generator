# frozen_string_literal: true

module LanguageConfig
  # Configuration class for generating Cpp test files
  class CppConfig < BaseConfig
    def initialize
      super()
      self.config = DEFAULT_CONFIG.merge
    end
    DEFAULT_CONFIG = {
      supports_overloading: true,
      imports: [
        "#include \"splashkit.h\"\n",
        "#include <catch2/catch.hpp>\n\n"
      ],
      test_header: ->(func_name) { "TEST_CASE(\"#{func_name.to_snake_case}_integration\") {\n" },
      variable_declaration: ->(var_name) { "auto #{var_name.to_snake_case} = " },
      variable_syntax: ->(var_name) { var_name.to_snake_case.to_s },
      enum_syntax: ->(enum_type, enum_value, include_semicolon = true) { "#{enum_type.to_pascal_case}::#{enum_value.to_upper_case}#{include_semicolon ? ";\n" : ''}" },
      function_pointer_syntax: ->(name) { "nullptr;\n" }, # TODO
      function_syntax: ->(func_name, params, include_semicolon = true) { "#{func_name.to_snake_case}(#{params})#{include_semicolon ? ";" : ''}" },
      field_syntax: ->(variable_value, field_name) { "#{variable_value}->#{field_name}" },
      matrix_access_syntax: ->(row, col) { "[#{row}][#{col}]" },
      loop_syntax: ->(iterations) { "for (int i = 0; i < #{iterations}; ++i) {\n" },
      if_syntax: ->(condition) { "if (#{condition}) {\n" },
      if_greater_than: ->(value1, value2) { "#{value1} > #{value2}" },
      if_true: ->(value) { "#{value} == true" },
      if_false: ->(value) { "#{value} == false" },
      if_equal: ->(value1, value2) { "#{value1} == #{value2}" },
      while_syntax: ->(condition) { "while (#{condition}) {\n" },
      footer: "}\n",
      else_syntax: "else {\n",
      break_syntax: "break;\n",
      assert_equal: ->(value1, value2) { "REQUIRE(#{value1} == #{value2});\n" },
      assert_not_equal: ->(value1, value2) { "REQUIRE(#{value1} != #{value2});\n" },
      assert_greater_than: ->(value1, value2) { "REQUIRE(#{value1} > #{value2});\n" },
      assert_less_than: ->(value1, value2) { "REQUIRE(#{value1} < #{value2});\n" },
      assert_null: ->(value) { "REQUIRE(#{value} == nullptr);\n" },
      assert_not_null: ->(value) { "REQUIRE(#{value} != nullptr);\n" },
      assert_in_range: ->(value, min, max) { "REQUIRE(#{value} >= #{min} && #{value} <= #{max});\n" },
      assert_true: ->(value) { "REQUIRE(#{value});\n" },
      assert_false: ->(value) { "REQUIRE_FALSE(#{value});\n" },
      assert_greater_than_or_equal: ->(value1, value2) { "REQUIRE(#{value1} >= #{value2});\n" },
      assert_less_than_or_equal: ->(value1, value2) { "REQUIRE(#{value1} <= #{value2});\n" },
      assert_throws: ->(value) { "REQUIRE_THROWS_AS(#{value}, std::exception);\n" },
      file_extension: 'cpp',
      runtime_requirement: 'g++',
      installation_steps: [
        '1. Install SplashKit SDK following instructions at https://splashkit.io/installation/',
        '2. Install Catch2: sudo apt-get install catch2 (Ubuntu) or brew install catch2 (macOS)',
        '3. Compile: g++ integration_tests.cpp -l SplashKit -o integration_tests'
      ].join("\n"),
      run_command: './integration_tests',
      if_not_equal: ->(value1, value2) { "#{value1} != #{value2}" }
    }.freeze
  end
end
