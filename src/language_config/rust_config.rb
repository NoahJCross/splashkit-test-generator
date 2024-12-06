# frozen_string_literal: true

module LanguageConfig
  # Configuration class for generating Rust test files
  class RustConfig < BaseConfig
    def initialize
      super()
      self.config = DEFAULT_CONFIG.merge
    end
    DEFAULT_CONFIG = {
      supports_overloading: false,
      imports: [
        "use splashkit::*;\n",
        "#[cfg(test)]\n",
        "mod test_runner {\n",
        "    pub fn run_tests_sequential(tests: &[&dyn Fn()]) {\n",
        "        for test in tests {\n",
        "            test();\n",
        "        }\n",
        "    }\n",
        "}\n",
        "#![test_runner(test_runner::run_tests_sequential)]\n",
      ],
      test_header: ->(func_name) { "#[test]\nfn test_#{func_name.to_snake_case}_integration() {\n" },
      variable_declaration: ->(var_name) { "let #{var_name.to_snake_case} = " },
      variable_syntax: ->(var_name) { var_name.to_snake_case.to_s },
      enum_syntax: ->(enum_type, enum_value, include_semicolon = true) { "#{enum_type.to_pascal_case}::#{enum_value.to_pascal_case}#{include_semicolon ? ";\n" : ''}" },
      function_pointer_syntax: ->(name) { "let callback = |_| (); #{name}Wrapper::new(callback);\n" },
      function_syntax: ->(func_name, params, include_semicolon = true) { "#{func_name.to_snake_case}(#{params})#{include_semicolon ? ";" : ''}" },
      field_syntax: ->(variable_value, field_name) { "#{variable_value}.#{field_name}" },
      matrix_access_syntax: ->(row, col) { "[#{row}, #{col}]" },
      loop_syntax: ->(iterations) { "for _ in 0..#{iterations} {\n" },
      if_syntax: ->(condition) { "if #{condition} {\n" },
      while_syntax: ->(condition) { "while #{condition} {\n" },
      footer: "}\n",
      else_syntax: "else {\n",
      break_syntax: "break;\n",
      assert_equal: ->(value1, value2) { "assert_eq!(#{value1}, #{value2});\n" },
      assert_not_equal: ->(value1, value2) { "assert_ne!(#{value1}, #{value2});\n" },
      assert_greater_than: ->(value1, value2) { "assert!(#{value1} > #{value2});\n" },
      assert_less_than: ->(value1, value2) { "assert!(#{value1} < #{value2});\n" },
      assert_null: ->(value) { "assert!(#{value}.is_none());\n" },
      assert_not_null: ->(value) { "assert!(#{value}.is_some());\n" },
      assert_in_range: ->(value, min, max) { "assert!((#{min}..=#{max}).contains(&#{value}));\n" },
      assert_true: ->(value) { "assert!(#{value});\n" },
      assert_false: ->(value) { "assert!(!#{value});\n" },
      assert_greater_than_or_equal: ->(value1, value2) { "assert!(#{value1} >= #{value2});\n" },
      assert_less_than_or_equal: ->(value1, value2) { "assert!(#{value1} <= #{value2});\n" },
      assert_throws: ->(value) { "assert!(std::panic::catch_unwind(|| { #{value} }).is_err());\n" },
      file_extension: 'rs',
      runtime_requirement: 'Rust',
      installation_steps: [
        '1. Install SplashKit SDK following instructions at https://splashkit.io/installation/',
        '2. Create new Cargo project: cargo new splashkit_tests',
        '3. Add to Cargo.toml:',
        '   [dependencies]',
        '   splashkit = "*"',
        '4. Move integration_tests.rs to splashkit_tests/src/lib.rs'
      ].join("\n"),
      run_command: 'cd splashkit_tests && cargo test'

    }.freeze
  end
end
