module LanguageConfig
  # Configuration class for generating Cpp test files
  class CppConfig < BaseConfig
    def initialize
      super()
      self.config = DEFAULT_CONFIG.merge
    end
    DEFAULT_CONFIG = {
      supports_overloading: true,

      test_main_file: {
        path: 'test_main.cpp',
        content: [
          '#define CATCH_CONFIG_RUNNER',
          '#include <catch2/catch_all.hpp>',
          '',
          'int main(int argc, char* argv[]) {',
          'return Catch::Session().run(argc, argv);',
          '}'
        ]
      },

      imports: [
        '#include <catch2/catch_all.hpp>',
        '#include <limits>',
        '#include "splashkit.h"',
        '#include "../helpers.hpp"'
      ],

      naming_convention: ->(name) { name.to_snake_case },

      assert_conditions: {
        'equal'                   => ->(v1, v2, precision = nil) { precision ? "REQUIRE(abs(#{v1} - #{v2}) <= #{precision});" : "REQUIRE(#{v1} == #{v2});" },
        'not_equal'               => ->(v1, v2, _)    { "REQUIRE(#{v1} != #{v2});" },
        'greater_than'            => ->(v1, v2, _)    { "REQUIRE(#{v1} > #{v2});" },
        'less_than'               => ->(v1, v2, _)    { "REQUIRE(#{v1} < #{v2});" },
        'null'                    => ->(v1, _, _)     { "REQUIRE(#{v1} == nullptr);" },
        'not_null'                => ->(v1, _, _)     { "REQUIRE(#{v1} != nullptr);" },
        'range'                   => ->(v1, v2, v3)   { "REQUIRE((#{v1} >= #{v2})); REQUIRE((#{v1} <= #{v3}));" },
        'true'                    => ->(v1, _, _)     { "REQUIRE(#{v1});" },
        'false'                   => ->(v1, _, _)     { "REQUIRE_FALSE(#{v1});" },
        'greater_than_or_equal'   => ->(v1, v2, _)    { "REQUIRE(#{v1} >= #{v2});" },
        'less_than_or_equal'      => ->(v1, v2, _)    { "REQUIRE(#{v1} <= #{v2});" },
        'throws'                  => ->(v1, _, _)     { "REQUIRE_THROWS_AS(#{v1}, exception);" },
        'not_empty'               => ->(v1, _, _)     { "REQUIRE(!#{v1}.empty());" },
        'contains'                => ->(v1, v2, _)    { "REQUIRE(#{v2}.find(#{v1}) != string::npos);" },
        'empty'                   => ->(v1, _, _)     { "REQUIRE(#{v1}.empty());" }
      }.freeze,

      if_conditions: {
        'greater_than' => ->(v1, v2) { "#{v1} > #{v2}" },
        'true'         => ->(v1, _)  { "#{v1} == true" },
        'false'        => ->(v1, _)  { "#{v1} == false" },
        'equal'        => ->(v1, v2) { "#{v1} == #{v2}" },
        'not_equal'    => ->(v1, v2) { "#{v1} != #{v2}" }
      }.freeze,

      numeric_constants: {
        infinity: 'std::numeric_limits<double>::infinity()',
        negative_infinity: '-std::numeric_limits<double>::infinity()',
        max_value: 'std::numeric_limits<float>::max()'
      }.freeze,

      control_flow: {
        loop:      ->(iterations) { "for (int i = 0; i < #{iterations}; ++i) {" },
        while:     ->(condition) { "while (#{condition}) {" },
        if:        ->(condition) { "if (#{condition}) {" },
        else:      -> { 'else {' },
        break:     -> { 'break;' },
        end:       -> { '}' },
        new_line: 'endl'
      }.freeze,

      string_handlers: {
        char: ->(value) { "'#{value}'" },
        string_ref: ->(value) { value },
        format_string: ->(text_parts, expressions) {
          text_parts.zip(expressions).flatten.compact.each_with_index.map { |p, i| i.odd? ? p : "\"#{p}\"" }.join(' << ')
        }
      }.freeze,

      type_handlers: {
        list:      ->(values, target_type = nil) { 
          mapped_type = DEFAULT_CONFIG[:type_handlers][:mapping][target_type] || target_type || 'auto'
          "vector<#{mapped_type}> { #{values} }"
        },
        class_instance:     ->(name, args) { "#{name}(#{args})" },
        mapping:   {
        }.freeze,
        enum:      ->(type, value, semicolon = true) { 
          "#{type.to_snake_case}::#{value.to_upper_case}#{semicolon ? ';' : ''}"
        },
        string: ->(value) { "\"#{value}\"" },
        object: ->(object_type, variable_name) { {
          object_type: object_type.to_snake_case,
          variable_name: variable_name.to_snake_case
        } },
      }.freeze,

      literal_cast: {
        unsigned_int: ->(value) { "#{value}u" },
        float: ->(value) { "#{value}f" },
        double: ->(value) { "#{value}d" },
      }.freeze,

      variable_handlers: {
        declaration: {
          regular: ->(name) { "auto #{name.to_snake_case} = " },
          mutable: ->(name) { "auto #{name.to_snake_case} = " }
        },
        identifier:     ->(name) { name.to_snake_case.to_s },
        field_access:  ->(var, field) { "#{var}.#{field}" },
        method_call: ->(var, field) { "#{var}.#{field}()" },
        array_access:  ->(arr, idx) { "#{arr}[#{idx}]" },
        matrix_access: ->(var, row, col) { "#{var}[#{row}][#{col}]" },
        array_size:    ->(arr) { "#{arr}.size()" },
        reference_operator: ->(var) { "#{var}" }
      }.freeze,

      function_handlers: {
        call:      ->(name, params, semicolon = true) { "#{name.to_snake_case}(#{params})#{semicolon ? ';' : ''}" },
        pointer:   ->(_) { 'nullptr;' },
        test:      ->(group, name) { ["TEST_CASE_METHOD(Test#{group.to_pascal_case}Fixture, \"#{name.to_snake_case}_integration\") {"] }
      }.freeze,

      comment_syntax: {
        single: '//',
        multi_start: '/*',
        multi_end: '*/',
      }.freeze,

      class_wrapper: {
        header: [
          ->(group) { "struct Test#{group.to_pascal_case}Fixture" },
          '{'
        ],
        constructor_wrapper: {
          header: ->(group) { ["Test#{group.to_pascal_case}Fixture()", '{'] },
          footer: ['}']
        },
        footer: ['};']
      }.freeze,

      cleanup_handlers: {
        setup: ->(name, type, arg = nil) {
          "#{type.to_snake_case}_cleanup #{name.to_snake_case}#{arg ? "(#{arg})" : '' };"
        }
      }.freeze,

      indentation: {
        indent_after: ['{', 'public:', 'private:'],
        unindent_before: ['};', '};', '}', 'public:', 'private:']
      }.freeze,

      terminal_handlers: {
        message: ->(text) { "cout << \"#{text}\";" }
      }.freeze,

      file_extension: 'cpp'
    }.freeze
  end
end
