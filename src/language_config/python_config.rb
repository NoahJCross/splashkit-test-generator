# frozen_string_literal: true

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
      test_header: ->(func_name) { "\ndef test_#{func_name.to_pascal_case}_integration():\n" },
      variable_declaration: ->(var_name) { "#{var_name.to_snake_case} = " },
      variable_syntax: ->(var_name) { var_name.to_snake_case.to_s },
      enum_syntax: ->(enum_type, enum_value, include_semicolon = true) { "#{enum_type.to_pascal_case}.#{enum_value.to_pascal_case}#{include_semicolon ? ";\n" : ''}" },
      function_pointer_syntax: ->(name) { "None\n" }, # TODO: Implement Python callback
      function_syntax: ->(func_name, params, _ = true) { "#{func_name.to_pascal_case}(#{params})" },
      field_syntax: ->(variable_value, field_name) { "#{variable_value}.#{field_name}" },
      matrix_access_syntax: ->(row, col) { "[#{row}, #{col}]" },
      loop_syntax: ->(iterations) { "for _ in range(#{iterations}):\n" },
      if_syntax: ->(condition) { "if #{condition}:\n" },
      while_syntax: ->(condition) { "while #{condition}:\n" },
      footer: "\n",
      else_syntax: "else:\n",
      break_syntax: "break\n",
      naming_convention: :snake_case,
      assert_equal: ->(value1, value2) { "assert #{value1} == #{value2}\n" },
      assert_not_equal: ->(value1, value2) { "assert #{value1} != #{value2}\n" },
      assert_greater_than: ->(value1, value2) { "assert #{value1} > #{value2}\n" },
      assert_less_than: ->(value1, value2) { "assert #{value1} < #{value2}\n" },
      assert_null: ->(value) { "assert #{value} is None\n" },
      assert_not_null: ->(value) { "assert #{value} is not None\n" },
      assert_in_range: ->(value, min, max) { "assert #{min} <= #{value} <= #{max}\n" },
      assert_true: ->(value) { "assert #{value} is True\n" },
      assert_false: ->(value) { "assert #{value} is False\n" },
      assert_greater_than_or_equal: ->(value1, value2) { "assert #{value1} >= #{value2}\n" },
      assert_less_than_or_equal: ->(value1, value2) { "assert #{value1} <= #{value2}\n" },
      assert_throws: ->(value) { "with pytest.raises(Exception):\n    #{value}\n" },
      file_extension: 'py',
      comment_syntax: ->(text) { text.split("\n").map { |line| "# #{line}" }.join("\n") },
      runtime_requirement: 'Python 3',
      installation_steps: [
        '1. Install SplashKit SDK following instructions at https://splashkit.io/installation/',
        '2. Install pytest: pip install pytest'
      ].join("\n"),
      run_command: 'skm python3 integration_tests.py'
    }.freeze
  end
end

