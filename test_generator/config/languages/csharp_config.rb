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
        'using Xunit;',
        'using SplashKitSDK;',
        'using static SplashKitSDK.SplashKit;',
        'using HttpMethod = SplashKitSDK.HttpMethod;'
      ],
      naming_convention: ->(name) { name.to_pascal_case },

      assert_conditions: {
        'equal'                   => ->(v1, v2, precision = nil)    { "Assert.Equal(#{v1}, #{v2}#{precision ? ", #{precision}" : ''});" },
        'not_equal'               => ->(v1, v2, _)    { "Assert.NotEqual(#{v1}, #{v2});" },
        'greater_than'            => ->(v1, v2, _)    { "Assert.True(#{v1} > #{v2});" },
        'less_than'               => ->(v1, v2, _)    { "Assert.True(#{v1} < #{v2});" },
        'null'                    => ->(v1, _, _)     { "Assert.Null(#{v1});" },
        'not_null'                => ->(v1, _, _)     { "Assert.NotNull(#{v1});" },
        'range'                   => ->(v1, v2, v3)   { "Assert.InRange(#{v1}, #{v2}, #{v3});" },
        'true'                    => ->(v1, _, _)     { "Assert.True(#{v1});" },
        'false'                   => ->(v1, _, _)     { "Assert.False(#{v1});" },
        'greater_than_or_equal'   => ->(v1, v2, _)    { "Assert.True(#{v1} >= #{v2});" },
        'less_than_or_equal'      => ->(v1, v2, _)    { "Assert.True(#{v1} <= #{v2});" },
        'throws'                  => ->(v1, _, _)     { "Assert.Throws<Exception>(() => { #{v1} });" },
        'not_empty'               => ->(v1, _, _)     { "Assert.NotEmpty(#{v1});" },
        'contains'                => ->(v1, v2, _)    { "Assert.Contains(#{v1}, #{v2});" },
        'empty'                   => ->(v1, _, _)     { "Assert.Empty(#{v1});" }
      }.freeze,

      if_conditions: {
        'greater_than' => ->(v1, v2) { "#{v1} > #{v2}" },
        'true'         => ->(v1, _)  { "#{v1}" },
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
        loop:      ->(iterations) { "for (int i = 0; i < #{iterations}; i++) {" },
        while:     ->(condition) { "while (#{condition}) {" },
        if:        ->(condition) { "if (#{condition}) {" },
        else:      -> { 'else {' },
        break:     -> { 'break;' },
        end:       -> { '}' },
        new_line: 'Environment.NewLine'
      }.freeze,

      string_handlers: {
        char:          ->(value) { "'#{value}'" },
        string_ref: ->(value) { value },
        format_string: ->(text_parts, expressions) {
          "$\"#{text_parts.zip(expressions.map { |e| "{#{e}}" }).flatten.compact.join}\""
        }
      }.freeze,

      type_handlers: {
        list:      ->(values, target_type = nil) { 
          mapped_type = DEFAULT_CONFIG[:type_handlers][:mapping][target_type] || target_type || 'dynamic'
          "new List<#{mapped_type}> { #{values} }"
        },
        class_instance:     ->(name, args) { "new #{name}(#{args})" },
        mapping:   {
          'json' => 'Json',
          'line' => 'Line'
        }.freeze,
        enum:      ->(type, value, semicolon = true) { 
          "#{type.to_pascal_case}.#{value.to_pascal_case}#{semicolon ? ';' : ''}"
        },
        string: ->(value) { "\"#{value}\"" },
        object: ->(object_type, variable_name) { {
          object_type: object_type.to_pascal_case,
          variable_name: variable_name.to_camel_case
        } },
      }.freeze,

      literal_cast: {
        unsigned_int: ->(value) { "#{value}u" },
        float: ->(value) { "#{value}f" },
        double: ->(value) { value },
      }.freeze,

      variable_handlers: {
        declaration: {
          regular: ->(name) { "var #{name.to_camel_case} = " },
          mutable: ->(name) { "var #{name.to_camel_case} = " }
        },
        identifier:     ->(name) { name.to_camel_case.to_s },
        field_access: ->(var, field) { 
          formatted_field = field.split('.').map(&:to_pascal_case).join('.')
          "#{var}.#{formatted_field}"
        },
        delegate_call: ->(var, field) { "#{var}.#{field.to_pascal_case}();" },
        array_access:  ->(arr, idx) { "#{arr}[#{idx}]" },
        matrix_access: ->(var, row, col) { "#{var}[#{row}, #{col}]" },
        array_size:    ->(arr) { "#{arr}.Count" },
        reference_operator: ->(var) { "ref #{var}" }
      }.freeze,

      function_handlers: {
        call:      ->(name, params, semicolon = true) { "#{name.to_pascal_case}(#{params})#{semicolon ? ';' : ''}" },
        pointer:   ->(_) { 'null;' },
        test:      ->(name) { ["[Fact]", "public void Test#{name.to_pascal_case}Integration() {"] }
      }.freeze,

      comment_syntax: {
        single: '//',
        multi_start: '/*',
        multi_end: '*/'
      }.freeze,

      class_wrapper: {
        header: [
          'namespace SplashKitTests',
          '{',
          ->(group) { "public class Test#{group.to_pascal_case}" },
          '{'
        ],
        constructor_wrapper: {
          header: ->(group) { ["public Test#{group.to_pascal_case}()", '{' ]},
          footer: ['}']
        },
        footer: [
          '}',
          '}'
        ]
      }.freeze,

      cleanup_handlers: {
        setup: ->(name, type, args = nil) {
          "using var #{name.to_camel_case} = new #{type.to_pascal_case}Cleanup#{args ? "(#{args})" : '()'};"
        }
      }.freeze,

      indentation: {
        indent_after: ['{'],
        unindent_before: ['}']
      }.freeze,

      file_extension: 'cs',

      terminal_handlers: {
        message: ->(text) { "Console.WriteLine(\"#{text}\");" }
      }.freeze
    }.freeze
  end
end
