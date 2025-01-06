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
        'use std::*;',
        'use splashkit::*;',
        'use splashkit_tests::helpers::*;',
        '#[cfg(test)]',
        'use ctor::ctor;'
      ],

      naming_convention: ->(name) { name.to_snake_case },

      assert_conditions: {
        'equal'                   => ->(v1, v2, precision = nil) { precision ? "assert!((#{v1} - #{v2}).abs() <= #{precision});" : "assert_eq!(#{v1}, #{v2});" },
        'not_equal'               => ->(v1, v2, _)    { "assert_ne!(#{v1}, #{v2});" },
        'greater_than'            => ->(v1, v2, _)    { "assert!(#{v1} > #{v2});" },
        'less_than'               => ->(v1, v2, _)    { "assert!(#{v1} < #{v2});" },
        'null'                    => ->(v1, _, _)     { "assert!(#{v1}.is_null());" },
        'not_null'                => ->(v1, _, _)     { "assert!(!#{v1}.is_null());" },
        'range'                   => ->(v1, v2, v3)   { "assert!((#{v2}..=#{v3}).contains(&#{v1}));" },
        'true'                    => ->(v1, _, _)     { "assert!(#{v1});" },
        'false'                   => ->(v1, _, _)     { "assert!(!#{v1});" },
        'greater_than_or_equal'   => ->(v1, v2, _)    { "assert!(#{v1} >= #{v2});" },
        'less_than_or_equal'      => ->(v1, v2, _)    { "assert!(#{v1} <= #{v2});" },
        'throws'                  => ->(v1, _, _)     { "assert!(std::panic::catch_unwind(|| { #{v1} }).is_err());" },
        'not_empty'               => ->(v1, _, _)     { "assert!(!#{v1}.is_empty());" },
        'contains'                => ->(v1, v2, _)    { "assert!(#{v2}.contains(#{v1}));" },
        'empty'                   => ->(v1, _, _)     { "assert!(#{v1}.is_empty());" }
      }.freeze,

      if_conditions: {
        'greater_than' => ->(v1, v2) { "#{v1} > #{v2}" },
        'true'         => ->(v1, _)  { "#{v1} == true" },
        'false'        => ->(v1, _)  { "#{v1} == false" },
        'equal'        => ->(v1, v2) { "#{v1} == #{v2}" },
        'not_equal'    => ->(v1, v2) { "#{v1} != #{v2}" }
      }.freeze,

      numeric_constants: {
        infinity: 'f64::INFINITY',
        negative_infinity: 'f64::NEG_INFINITY',
        max_value: 'f32::MAX'
      }.freeze,

      control_flow: {
        loop:      ->(iterations) { "for _ in 0..#{iterations} {" },
        while:     ->(condition) { "while #{condition} {" },
        if:        ->(condition) { "if #{condition} {" },
        else:      -> { 'else {' },
        break:     -> { 'break;' },
        end:       -> { '}' },
        new_line: "'\'"
      }.freeze,

      string_handlers: {
        interpolation: ->(expr) { "{#{expr}}" },
        char:          ->(value) { "'#{value}'" },
        string_ref:    ->(value) { "#{value}.clone()" },
        format_string: ->(text_parts, expressions) {
          "format!(\"#{text_parts.join('{}')}{}\", #{expressions.join(', ')})"
        }
      }.freeze,

      type_handlers: {
        list:      ->(values, _) { "vec![#{values}]" },
        class_instance:     ->(name, args) { "#{name.to_pascal_case}::new(#{args})" },
        mapping:   {
          'double' => 'f64',
          'json'   => 'Json',
          'line'   => 'Line'
        }.freeze,
        enum:      ->(type, value, semicolon = true) { 
          "#{type.to_pascal_case}::#{value.to_pascal_case}#{semicolon ? ";" : ''}" 
        },
        string: ->(value) { "\"#{value}\".to_string()" },
        object: ->(object_type, variable_name) { {
          object_type: object_type.to_pascal_case,
          variable_name: variable_name.to_snake_case
        } }
      }.freeze,

      literal_cast: {
        unsigned_int: ->(value) { "#{value} as u32" },
        float: ->(value) { "#{value} as f32" },
        double: ->(value) { "#{value} as f64" },
      }.freeze,

      comparison_cast: {
        unsigned_int: ->(value) { "#{value} as u32" },
        float: ->(value) { "#{value} as f32" },
        double: ->(value) { "#{value} as f64" },
      }.freeze,

      variable_handlers: {
        declaration: {
          regular: ->(name) { "let #{name.to_snake_case} = " },
          mutable: ->(name) { "let mut #{name.to_snake_case} = " }
        },
        identifier:    ->(name) { name.to_snake_case.to_s },
        field_access: ->(var, field) { "#{var}.#{field}" },
        method_call: ->(var, field) { "#{var}.#{field}()" },
        array_access: ->(arr, idx) { "#{arr}[#{idx}]" },
        matrix_access: ->(var, row, col) { "#{var}[#{row}][#{col}]" },
        array_size:   ->(arr) { "#{arr}.len()" },
        reference_operator: ->(var) { "&mut #{var}" }
      }.freeze,

      function_handlers: {
        call:      ->(name, params, semicolon = true) { "#{name.to_snake_case}(#{params})#{semicolon ? ';' : ''}" },
        pointer:   ->(name) { "let callback = |_| (); #{name}Wrapper::new(callback);" },
        test:      ->(_, name) { ["#[test]", "fn test_#{name.to_snake_case}_integration() {"] }
      }.freeze,

      comment_syntax: {
        single: '//',
        multi_start: '/*',
        multi_end: '*/'
      }.freeze,

      class_wrapper: {
        header: [
          ->(group) { "mod test_#{group.to_snake_case} {" },
          'use super::*;'
        ],
        constructor_wrapper: {
          header: ['#[ctor]', 'fn setup()', '{'],
          footer: ['}']
        },
        footer: ['}']
      }.freeze,

      cleanup_handlers: {
        setup: ->(name, type, arg = nil) {
          "let _#{name.to_snake_case} = #{type.to_pascal_case}Cleanup::new(#{arg});"
        }
      }.freeze,

      indentation: {
        indent_after: ['{'],
        unindent_before: ['}']
      }.freeze,

      terminal_handlers: {
        message: ->(text) { "println!(\"#{text}\");" }
      }.freeze,

      file_extension: 'rs'
    }.freeze
  end
end
