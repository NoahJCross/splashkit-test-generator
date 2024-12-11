# frozen_string_literal: true
# rubocop:disable Layout/HashAlignment

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

      naming_convention: ->(name) { name.to_snake_case },

      assert_conditions: {
        'equal'                   => ->(v1, v2, _)    { "REQUIRE(#{v1} == #{v2});\n" },
        'not_equal'               => ->(v1, v2, _)    { "REQUIRE(#{v1} != #{v2});\n" },
        'greater_than'            => ->(v1, v2, _)    { "REQUIRE(#{v1} > #{v2});\n" },
        'less_than'               => ->(v1, v2, _)    { "REQUIRE(#{v1} < #{v2});\n" },
        'null'                    => ->(v1, _, _)     { "REQUIRE(#{v1} == nullptr);\n" },
        'not_null'                => ->(v1, _, _)     { "REQUIRE(#{v1} != nullptr);\n" },
        'range'                   => ->(v1, v2, v3)   { "REQUIRE(#{v1} >= #{v2} && #{v1} <= #{v3});\n" },
        'true'                    => ->(v1, _, _)     { "REQUIRE(#{v1});\n" },
        'false'                   => ->(v1, _, _)     { "REQUIRE_FALSE(#{v1});\n" },
        'greater_than_or_equal'   => ->(v1, v2, _)    { "REQUIRE(#{v1} >= #{v2});\n" },
        'less_than_or_equal'      => ->(v1, v2, _)    { "REQUIRE(#{v1} <= #{v2});\n" },
        'throws'                  => ->(v1, _, _)     { "REQUIRE_THROWS_AS(#{v1}, std::exception);\n" },
        'not_empty'               => ->(v1, _, _)     { "REQUIRE(!#{v1}.empty());\n" },
        'contains'                => ->(v1, v2, _)    { "REQUIRE(#{v2}.find(#{v1}) != std::string::npos);\n" },
        'empty'                   => ->(v1, _, _)     { "REQUIRE(#{v1}.empty());\n" }
      }.freeze,

      if_conditions: {
        'greater_than' => ->(v1, v2) { "#{v1} > #{v2}" },
        'true'         => ->(v1, _)  { "#{v1} == true" },
        'false'        => ->(v1, _)  { "#{v1} == false" },
        'equal'        => ->(v1, v2) { "#{v1} == #{v2}" },
        'not_equal'    => ->(v1, v2) { "#{v1} != #{v2}" }
      }.freeze,

      control_flow: {
        loop:      ->(iterations) { "for (int i = 0; i < #{iterations}; ++i) {\n" },
        while:     ->(condition) { "while (#{condition}) {\n" },
        if:        ->(condition) { "if (#{condition}) {\n" },
        else:      -> { "else {\n" },
        break:     -> { "break;\n" },
        end:       -> { "}\n" }
      }.freeze,

      string_handlers: {
        interpolation: ->(expr) { "\" << #{expr} << \"" },
        concatenation: ->(parts) { "std::string(\"#{parts.join}\")" },
        char:          ->(value) { "'#{value}'" }
      }.freeze,

      numeric_constants: {
        'inf'          => 'std::numeric_limits<double>::infinity()',
        'neg_inf'      => '-std::numeric_limits<double>::infinity()',
        'max_value'    => 'std::numeric_limits<float>::max()'
      }.freeze,

      type_handlers: {
        list:      ->(values, target_type = nil) { 
          mapped_type = DEFAULT_CONFIG[:type_handlers][:mapping][target_type] || target_type || 'auto'
          "std::vector<#{mapped_type}> { #{values} }" 
        },
        class:     ->(name, args) { "#{name}(#{args})" },
        mapping:   {
          'json' => 'Json',
          'line' => 'Line'
        }.freeze,
        enum:      ->(type, value, semicolon = true) { 
          "#{type.to_pascal_case}::#{value.to_upper_case}#{semicolon ? ";\n" : ''}"
        }

      }.freeze,
      variable_handlers: {
        declaration:   ->(name) { "auto #{name.to_snake_case} = " },
        reference:     ->(name) { name.to_snake_case.to_s },
        field_access:  ->(var, field) { "#{var}->#{field}" },
        array_access:  ->(arr, idx) { "#{arr}[#{idx}]" },
        matrix_access: ->(var, row, col) { "#{var}[#{row}][#{col}]" }
      }.freeze,

      function_handlers: {
        call:      ->(name, params, semicolon = true) { "#{name.to_snake_case}(#{params})#{semicolon ? ';' : ''}" },
        pointer:   ->(_) { "nullptr;\n" },
        test:      ->(name) { "TEST_CASE(\"#{name.to_snake_case}_integration\") {\n" }
      }.freeze,

      class_wrapper: {
        header: [
          ->(group) { "class Test#{group.to_pascal_case} {\n" },
          "public:\n"
        ],
        constructor_wrapper: {
          header: ->(group) { "Test#{group.to_pascal_case}() {\n" },
          footer: "}\n\n"
        },
        footer: ["};\n"],
        indent_after: ["public:\n"],
        unindent_before: ["};\n"]
      }.freeze,

      file_extension: 'cpp',
      runtime_requirement: 'g++',
      installation_steps: [
        '1. Install SplashKit SDK following instructions at https://splashkit.io/installation/',
        '2. Install Catch2: sudo apt-get install catch2 (Ubuntu) or brew install catch2 (macOS)',
        '3. Compile: g++ integration_tests.cpp -l SplashKit -o integration_tests'
      ].join("\n"),
      run_command: './integration_tests',
    }.freeze
  end
end
