#include "splashkit.h"
#include <catch2/catch.hpp>

class TestJson {
public:
    TEST_CASE("create_json_integration") {
        auto test_json = create_json();
        REQUIRE(test_json != nullptr);
        free_json(test_json);
    }
    TEST_CASE("create_json_from_string_integration") {
        auto test_json = create_json_from_string("{\"name\":\"John\",\"age\":30,\"city\":\"New York\"}");
        REQUIRE(json_has_key(test_json, "name"));
        REQUIRE("John" == json_read_string(test_json, "name"));
        free_json(test_json);
    }
    TEST_CASE("free_all_json_integration") {
        auto test_json1 = create_json();
        auto test_json2 = create_json();
        auto count1 = json_count_keys(test_json1);
        json_set_string(test_json1, "key", "value");
        json_set_string(test_json2, "key", "value");
        auto count2 = json_count_keys(test_json2);
        REQUIRE(count1 > 0);
        REQUIRE(count2 > 0);
        free_all_json();
        auto count1_after_free = json_count_keys(test_json1);
        auto count2_after_free = json_count_keys(test_json2);
        REQUIRE(0 == count1_after_free);
        REQUIRE(0 == count2_after_free);
    }
    TEST_CASE("free_json_integration") {
        auto test_json = create_json();
        json_set_string(test_json, "key", "value");
        free_json(test_json);
        REQUIRE_FALSE(json_has_key(test_json, "key"));
    }
    TEST_CASE("json_count_keys_integration") {
        auto test_json = create_json();
        json_set_string(test_json, "key1", "value1");
        json_set_number_integer(test_json, "key2", 42);
        auto key_count = json_count_keys(test_json);
        REQUIRE(2 == key_count);
        free_json(test_json);
    }
    TEST_CASE("json_from_color_integration") {
        auto test_color = color_bright_green();
        auto test_json = json_from_color(test_color);
        REQUIRE(json_has_key(test_json, "color"));
        REQUIRE("#00ff00ff" == json_read_string(test_json, "color"));
        free_json(test_json);
        free_all_json();
    }
    TEST_CASE("json_from_file_integration") {
        auto test_json = json_from_file("person.json");
        REQUIRE(test_json != nullptr);
        auto test_value = json_read_string(test_json, "firstName");
        REQUIRE("John" == test_value);
        free_json(test_json);
    }
    TEST_CASE("json_from_string_integration") {
        auto test_json = json_from_string("{\"name\":\"John\",\"age\":30,\"city\":\"New York\"}");
        REQUIRE("John" == json_read_string(test_json, "name"));
        REQUIRE(30 == json_read_number_as_int(test_json, "age"));
        REQUIRE("New York" == json_read_string(test_json, "city"));
        free_json(test_json);
    }
    TEST_CASE("json_has_key_integration") {
        auto test_json = create_json();
        json_set_string(test_json, "key1", "value1");
        REQUIRE(json_has_key(test_json, "key1"));
        REQUIRE_FALSE(json_has_key(test_json, "key2"));
        free_json(test_json);
    }
    TEST_CASE("json_read_array_of_double_integration") {
        auto test_json = create_json();
        json_set_array_of_double(test_json, "numbers", std::vector<double> { 1.1, 2.2, 3.3 });
        auto out_result = std::vector<double> {  };
        json_read_array_of_double(test_json, "numbers", out_result);
        REQUIRE(1.1 == out_result[0]);
        REQUIRE(2.2 == out_result[1]);
        free_json(test_json);
        free_all_json();
    }
    TEST_CASE("json_read_array_of_json_integration") {
        auto test_json = create_json();
        auto test_json1 = create_json();
        auto test_json2 = create_json();
        json_set_string(test_json1, "key1", "value1");
        json_set_string(test_json2, "key2", "value2");
        auto test_json_array = std::vector<Json> { test_json1, test_json2 };
        json_set_array_of_json(test_json, "array_key", test_json_array);
        auto out_result = std::vector<Json> {  };
        json_read_array_of_json(test_json, "array_key", out_result);
        REQUIRE(2 == size(out_result));
        free_json(test_json);
        free_json(test_json1);
        free_json(test_json2);
        free_all_json();
    }
    TEST_CASE("json_read_array_of_string_integration") {
        auto test_json = create_json();
        json_set_array_of_string(test_json, "test_array", ["item1", "item2", "item3"]);
        auto out_result = std::vector<string> {  };
        json_read_array_of_string(test_json, "test_array", out_result);
        REQUIRE(3 == size(out_result));
        REQUIRE("item1" == out_result[0]);
        free_json(test_json);
    }
    TEST_CASE("json_read_array_of_bool_integration") {
        auto test_json = create_json();
        json_set_array_of_bool(test_json, "test_key", std::vector<bool> { true, false, true });
        auto out_result = std::vector<bool> {  };
        json_read_array_of_bool(test_json, "test_key", out_result);
        REQUIRE(3 == size(out_result));
        REQUIRE(out_result[0]);
        REQUIRE_FALSE(out_result[1]);
        free_json(test_json);
    }
    TEST_CASE("json_read_bool_integration") {
        auto test_json = create_json();
        json_set_bool(test_json, "test_key", true);
        REQUIRE(json_read_bool(test_json, "test_key"));
        json_set_bool(test_json, "test_key", false);
        REQUIRE_FALSE(json_read_bool(test_json, "test_key"));
        free_json(test_json);
    }
    TEST_CASE("json_read_number_integration") {
        auto test_json = create_json();
        json_set_number_float(test_json, "test_key", 42.5);
        auto test_result = json_read_number(test_json, "test_key");
        REQUIRE(42.5 == test_result);
        free_json(test_json);
    }
    TEST_CASE("json_read_number_as_double_integration") {
        auto test_json = create_json();
        json_set_number_double(test_json, "test_key", 3.14);
        auto test_result = json_read_number_as_double(test_json, "test_key");
        REQUIRE(3.14 == test_result);
        free_json(test_json);
    }
    TEST_CASE("json_read_number_as_int_integration") {
        auto test_json = create_json();
        json_set_number_integer(test_json, "test_key", 42);
        auto test_result = json_read_number_as_int(test_json, "test_key");
        REQUIRE(42 == test_result);
        free_json(test_json);
    }
    TEST_CASE("json_read_object_integration") {
        auto test_json = create_json();
        json_set_object(test_json, "nestedObject", create_json());
        auto read_json = json_read_object(test_json, "nestedObject");
        REQUIRE(read_json != nullptr);
        free_json(test_json);
        free_json(read_json);
    }
    TEST_CASE("json_read_string_integration") {
        auto test_json = create_json();
        json_set_string(test_json, "test_key", "test_value");
        auto read_value = json_read_string(test_json, "test_key");
        REQUIRE("test_value" == read_value);
        free_json(test_json);
    }
    TEST_CASE("json_set_array_of_string_integration") {
        auto test_json = create_json();
        json_set_array_of_string(test_json, "test_key", std::vector<string> { "value1", "value2", "value3" });
        auto out_result = std::vector<string> {  };
        json_read_array_of_string(test_json, "test_key", out_result);
        REQUIRE(["value1", "value2", "value3"] == out_result);
        free_json(test_json);
    }
    TEST_CASE("json_set_array_of_double_integration") {
        auto test_json = create_json();
        json_set_array_of_double(test_json, "numbers", std::vector<double> { 1.1, 2.2, 3.3 });
        auto out_result = std::vector<double> {  };
        json_read_array_of_double(test_json, "numbers", out_result);
        REQUIRE([1.1, 2.2, 3.3] == out_result);
        free_json(test_json);
    }
    TEST_CASE("json_set_array_of_bool_integration") {
        auto test_json = create_json();
        json_set_array_of_bool(test_json, "test_key", [true, false, true]);
        auto out_result = std::vector<bool> {  };
        json_read_array_of_bool(test_json, "test_key", out_result);
        REQUIRE([true, false, true] == out_result);
        free_json(test_json);
    }
    TEST_CASE("json_set_array_of_json_integration") {
        auto test_json = create_json();
        auto test_json1 = create_json();
        auto test_json2 = create_json();
        json_set_string(test_json1, "key1", "value1");
        json_set_string(test_json2, "key2", "value2");
        auto test_json_array = std::vector<Json> { test_json1, test_json2 };
        json_set_array_of_json(test_json, "array_key", test_json_array);
        auto out_result = std::vector<Json> {  };
        json_read_array_of_json(test_json, "array_key", out_result);
        REQUIRE("value1" == json_read_string(out_result[0], "key1"));
        REQUIRE("value2" == json_read_string(out_result[1], "key2"));
        free_all_json();
    }
    TEST_CASE("json_set_bool_integration") {
        auto test_json = create_json();
        json_set_bool(test_json, "test_key", true);
        REQUIRE(json_has_key(test_json, "test_key"));
        REQUIRE(json_read_bool(test_json, "test_key"));
        free_json(test_json);
    }
    TEST_CASE("json_set_number_integer_integration") {
        auto test_json = create_json();
        json_set_number_integer(test_json, "age", 30);
        REQUIRE(30 == json_read_number_as_int(test_json, "age"));
        free_json(test_json);
    }
    TEST_CASE("json_set_number_double_integration") {
        auto test_json = create_json();
        json_set_number_double(test_json, "test_key", 3.14);
        REQUIRE(3.14 == json_read_number_as_double(test_json, "test_key"));
        free_json(test_json);
    }
    TEST_CASE("json_set_number_float_integration") {
        auto test_json = create_json();
        json_set_number_float(test_json, "test_key", 3.14);
        REQUIRE(3.140000104904175 == json_read_number(test_json, "test_key"));
        free_json(test_json);
    }
    TEST_CASE("json_set_object_integration") {
        auto test_json = create_json();
        auto test_nested_json = create_json();
        json_set_object(test_json, "nested", test_nested_json);
        REQUIRE(json_has_key(test_json, "nested"));
        free_json(test_json);
        free_json(test_nested_json);
        free_all_json();
    }
    TEST_CASE("json_set_string_integration") {
        auto test_json = create_json();
        json_set_string(test_json, "test_key", "test_value");
        REQUIRE("test_value" == json_read_string(test_json, "test_key"));
        free_json(test_json);
    }
    TEST_CASE("json_to_color_integration") {
        auto test_json = create_json();
        json_set_string(test_json, "color", "#ff0000ff");
        auto test_color = json_to_color(test_json);
        REQUIRE("#ff0000ff" == color_to_string(test_color));
        free_json(test_json);
    }
    TEST_CASE("json_to_file_integration") {
        auto test_json = create_json();
        json_set_string(test_json, "testKey", "testValue");
        json_to_file(test_json, "test.json");
        auto loaded_json = json_from_file("test.json");
        REQUIRE("testValue" == json_read_string(loaded_json, "testKey"));
        free_json(test_json);
        free_json(loaded_json);
    }
    TEST_CASE("json_to_string_integration") {
        auto test_json = create_json();
        json_set_string(test_json, "key", "value");
        auto test_json_string = json_to_string(test_json);
        REQUIRE("" != test_json_string);
        free_json(test_json);
    }
};
