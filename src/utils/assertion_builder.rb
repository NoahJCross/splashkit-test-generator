# Provides methods for various assertion types used in test generation
module AssertionBuilder
  class << self
    # Maps comparison methods to their corresponding assertion methods
    def comparison_method_map
      {
        'equal' => :assert_equal,
        'not_equal' => :assert_not_equal,
        'greater_than' => :assert_greater_than,
        'less_than' => :assert_less_than,
        'greater_than_or_equal' => :assert_greater_than_or_equal,
        'less_than_or_equal' => :assert_less_than_or_equal,
        'null' => :assert_null,
        'not_null' => :assert_not_null,
        'range' => :assert_in_range,
        'true' => :assert_true,
        'false' => :assert_false,
        'throws' => :assert_throws
      }
    end

    # Asserts that two values are equal
    def assert_equal(value1, value2, _, config)
      config[:assert_equal].call(value1, value2)
    end

    # Asserts that two values are not equal
    def assert_not_equal(value1, value2, _, config)
      config[:assert_not_equal].call(value1, value2)
    end

    # Asserts that value1 is greater than value2
    def assert_greater_than(value1, value2, _, config)
      config[:assert_greater_than].call(value1, value2)
    end

    # Asserts that value1 is less than value2
    def assert_less_than(value1, value2, _, config)
      config[:assert_less_than].call(value1, value2)
    end

    # Asserts that value1 is greater than or equal to value2
    def assert_greater_than_or_equal(value1, value2, _, config)
      config[:assert_greater_than_or_equal].call(value1, value2)
    end

    # Asserts that value1 is less than or equal to value2
    def assert_less_than_or_equal(value1, value2, _, config)
      config[:assert_less_than_or_equal].call(value1, value2)
    end

    # Asserts that a value is null
    def assert_null(value1, _, _, config)
      config[:assert_null].call(value1)
    end

    # Asserts that a value is not null
    def assert_not_null(value1, _, _, config)
      config[:assert_not_null].call(value1)
    end

    # Asserts that a value is within a specified range
    def assert_in_range(value1, value2, value3, config)
      config[:assert_in_range].call(value1, value2, value3)
    end

    # Asserts that a value is true
    def assert_true(value1, _, _, config)
      config[:assert_true].call(value1)
    end

    # Asserts that a value is false
    def assert_false(value1, _, _, config)
      config[:assert_false].call(value1)
    end

    # Asserts that a value throws an exception
    def assert_throws(value1, _, _, config)
      config[:assert_throws].call(value1)
    end
  end
end
