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
        'uses SplashKit, TestFramework, ../Helpers;'
      ],

      naming_convention: ->(name) { name.to_pascal_case },

      assert_conditions: {
        'equal'                   => ->(v1, v2, precision = nil) { precision ? "AssertTrue(Abs(#{v1} - #{v2}) <= #{precision});" : "AssertEquals(#{v1}, #{v2});" },
        'not_equal'               => ->(v1, v2, _)    { "AssertNotEquals(#{v1}, #{v2});" },
        'greater_than'            => ->(v1, v2, _)    { "AssertTrue(#{v1} > #{v2});" },
        'less_than'               => ->(v1, v2, _)    { "AssertTrue(#{v1} < #{v2});" },
        'null'                    => ->(v1, _, _)     { "AssertNull(#{v1});" },
        'not_null'                => ->(v1, _, _)     { "AssertNotNull(#{v1});" },
        'range'                   => ->(v1, v2, v3)   { "AssertTrue((#{v1} >= #{v2}) and (#{v1} <= #{v3}));" },
        'true'                    => ->(v1, _, _)     { "AssertTrue(#{v1});" },
        'false'                   => ->(v1, _, _)     { "AssertFalse(#{v1});" },
        'greater_than_or_equal'   => ->(v1, v2, _)    { "AssertTrue(#{v1} >= #{v2});" },
        'less_than_or_equal'      => ->(v1, v2, _)    { "AssertTrue(#{v1} <= #{v2});" },
        'throws'                  => ->(v1, _, _)     { "try#{v1}exceptend;" },
        'not_empty'               => ->(v1, _, _)     { "AssertTrue(Length(#{v1}) > 0);" },
        'contains'                => ->(v1, v2, _)    { "AssertTrue(Pos(#{v1}, #{v2}) > 0);" },
        'empty'                   => ->(v1, _, _)     { "AssertTrue(Length(#{v1}) = 0);" }
      }.freeze,

      if_conditions: {
        'greater_than' => ->(v1, v2) { "#{v1} > #{v2}" },
        'true'         => ->(v1, _)  { "#{v1} = true" },
        'false'        => ->(v1, _)  { "#{v1} = false" },
        'equal'        => ->(v1, v2) { "#{v1} = #{v2}" },
        'not_equal'    => ->(v1, v2) { "#{v1} <> #{v2}" }
      }.freeze,

      numeric_constants: {
        infinity: 'MaxDouble',
        negative_infinity: '-MaxDouble',
        max_value: 'MaxSingle'
      }.freeze,

      control_flow: {
        loop:      ->(iterations) { "for i := 0 to #{iterations - 1} do" },
        while:     ->(condition) { "while #{condition} do" },
        if:        ->(condition) { "if #{condition} then" },
        else:      -> { 'else' },
        break:     -> { 'break;' },
        end:       -> { 'end;' },
        new_line: 'LineEnding'
      }.freeze,

      string_handlers: {
        char: ->(value) { "'#{value}'" },
        string_ref: ->(value) { value },
        format_string: ->(text_parts, expressions) {
          text_parts.zip(expressions).flatten.compact.each_with_index.map { |p, i| i.odd? ? p : "'#{p}'" }.join(' + ')
        }
      }.freeze,

      type_handlers: {
        list:      ->(values, target_type = nil) { 
          mapped_type = DEFAULT_CONFIG[:type_handlers][:mapping][target_type] || target_type || 'Integer'
          "TArray<#{mapped_type}>.Create(#{values})" 
        },
        class_instance:     ->(name, args) { "#{name}.Create(#{args})" },
        mapping:   {
          'bool'   => 'Boolean',
          'double' => 'Double',
          'string' => 'String',
          'json'   => 'Json',
          'line'   => 'Line'
        }.freeze,
        enum:      ->(type, value, semicolon = true) { 
          "#{type.to_pascal_case}.#{value.to_upper_case}#{semicolon ? ';' : ''}" 
        },
        string: ->(value) { "'#{value}'" },
        object: ->(object_type, variable_name) { {
          object_type: object_type.to_pascal_case,
          variable_name: variable_name.to_camel_case
        } }
      }.freeze,

      literal_cast: {
        unsigned_int: ->(value) { "Cardinal(#{value})" },
        float: ->(value) { value },
        double: ->(value) { value },
      }.freeze,

      variable_handlers: {
        declaration: {
          regular: ->(name) { "#{name.to_camel_case} := " },
          mutable: ->(name) { "#{name.to_camel_case} := " }
        },
        identifier:     ->(name) { name.to_camel_case.to_s },
        field_access:  ->(var, field) { "#{var}.#{field}" },
        method_call: ->(var, field) { "#{var}.#{field}" },
        array_access:  ->(arr, idx) { "#{arr}[#{idx}]" },
        matrix_access: ->(var, row, col) { "#{var}[#{row}, #{col}]" },
        array_size:    ->(arr) { "Length(#{arr})" },
        reference_operator: ->(var) { "@#{var}" }
      }.freeze,

      function_handlers: {
        call:      ->(name, params, semicolon = true) { "#{name.to_pascal_case}(#{params})#{semicolon ? ';' : ''}" },
        pointer:   ->(_) { 'nil;' },
        test:      ->(_, name) { ["procedure Test#{name.to_pascal_case}Integration;", 'begin'] }
      }.freeze,

      comment_syntax: {
        single: '//',
        multi_start: '{',
        multi_end: '}',
      }.freeze,

      class_wrapper: {
        header: [
          'type',
          ->(group) { "TTest#{group.to_pascal_case} = class(TTestCase)" },
          'protected',
          'procedure Setup; override;',
          'end;'
        ],
        constructor_wrapper: {
          header: ['begin', 'inherited;'],
          footer: ['end;']
        },
        footer: [
          'end;',
          '',
          'procedure RegisterTests;',
          'begin',
          ->(group) { "TestFramework.RegisterTest(TTest#{group.to_pascal_case}.Suite);" },
          'end;'
        ]
      }.freeze,

      cleanup_handlers: {
        setup: ->(name, type, arg = nil) {
          "#{name.to_pascal_case} := T#{type.to_pascal_case}Cleanup.Create#{arg ? "(#{arg})" : ';'}"
        }
      }.freeze,

      indentation: {
        indent_after: ['begin', 'type', 'protected', 'published', 'do', 'class(TTestCase)', 'Create(Name: string);', 'constructor Create;'],
        unindent_before: ['end;', 'end.', 'protected', 'published', 'inherited', 'begin']
      }.freeze,

      terminal_handlers: {
        message: ->(text) { "Write('#{text}');" }
      }.freeze,

      file_extension: 'pas'
    }.freeze
  end
end

