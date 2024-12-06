#include "splashkit.h"
#include <catch2/catch.hpp>

TEST_CASE("create_json_integration") {
    auto test_json = create_json();
    REQUIRE(test_json != nullptr);
    free_json(test_json);
}
TEST_CASE("create_json_from_string_integration") {
    auto test_json = create_json("{\"name\":\"John\",\"age\":30,\"city\":\"New York\"}");
    REQUIRE(json_has_key(test_json, "name"));
    REQUIRE(json_read_string(test_json, "name") == "John");
    free_json(test_json);
}
TEST_CASE("free_all_json_integration") {
    auto test_json1 = create_json();
    auto test_json2 = create_json();
    auto count1 = json_count_keys(test_json1);
    auto count2 = json_count_keys(test_json2);
    REQUIRE(count1 > 0);
    REQUIRE(count2 > 0);
    free_all_json();
    auto count1_after_free = json_count_keys(test_json1);
    auto count2_after_free = json_count_keys(test_json2);
    REQUIRE(count1_after_free == 0);
    REQUIRE(count2_after_free == 0);
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
    json_set_number(test_json, "key2", 42);
    auto key_count = json_count_keys(test_json);
    REQUIRE(key_count == 2);
    free_json(test_json);
}
TEST_CASE("json_from_color_integration") {
    auto test_color = color_bright_green();
    auto test_json = json_from_color(test_color);
    REQUIRE(json_has_key(test_json, "color"));
    REQUIRE(json_read_string(test_json, "color") == "#00ff00ff");
    free_json(test_json);
    free_all_json();
}
TEST_CASE("json_from_file_integration") {
    auto test_json = json_from_file("test.json");
    REQUIRE(test_json != nullptr);
    auto test_value = json_read_string(test_json, "key");
    REQUIRE(test_value == "expected_value");
    free_json(test_json);
}
TEST_CASE("json_from_string_integration") {
    auto test_json = json_from_string("{\"name\":\"John\",\"age\":30,\"city\":\"New York\"}");
    REQUIRE(json_read_string(test_json, "name") == "John");
    REQUIRE(json_read_number_as_int(test_json, "age") == 30);
    REQUIRE(json_read_string(test_json, "city") == "New York");
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
    json_set_array(test_json, "numbers", [1.1, 2.2, 3.3]);
    json_read_array(test_json, "numbers", {:value_type=>"list", :value=>[]});
    REQUIRE({:value_type=>"array_access", :array_name=>"out_result", :index=>0} == 3);
    REQUIRE({:value_type=>"array_access", :array_name=>"out_result", :index=>1} == 2.2);
    free_json(test_json);
    free_all_json();
}
TEST_CASE("json_read_array_of_json_integration") {
    auto test_json = create_json();
    auto test_json_nested1 = create_json();
    auto test_json_nested2 = create_json();
    json_set_string(test_json_nested1, "key1", "value1");
    json_set_string(test_json_nested2, "key2", "value2");
    json_set_array(test_json, "array_key", {:value_type=>"vector", :value=>[{:value_type=>"variable", :variable_name=>"test_json_nested1"}, {:value_type=>"variable", :variable_name=>"test_json_nested2"}]});
    json_read_array(test_json, "array_key", {:value_type=>"vector", :variable_name=>[]});
    REQUIRE(out_result == 2);
    free_json(test_json);
    free_json(test_json_nested1);
    free_json(test_json_nested2);
    free_all_json();
}
TEST_CASE("json_read_array_of_string_integration") {
    auto test_json = create_json();
    json_set_array(test_json, "test_array", ["item1", "item2", "item3"]);
    json_read_array(test_json, "test_array", out_result);
    REQUIRE(size == 3);
    REQUIRE(index_of_json0 == "item1");
    free_json(test_json);
}
TEST_CASE("json_read_array_of_bool_integration") {
    auto test_json = create_json();
    json_set_array(test_json, "test_key", "[true, false, true]");
    json_read_array(test_json, "test_key", out_result);
    REQUIRE(size == 3);
    REQUIRE(index_of_json0 == 0);
    REQUIRE(index_of_json1 != 1);
    REQUIRE(index_of_json2 == 2);
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
    json_set_number(test_json, "test_key", 42.5);
    auto test_result = json_read_number(test_json, "test_key");
    REQUIRE(test_result == 42.5);
    free_json(test_json);
}
TEST_CASE("json_read_number_as_double_integration") {
    auto test_json = create_json();
    json_set_number(test_json, "test_key", 3.14);
    auto test_result = json_read_number_as_double(test_json, "test_key");
    REQUIRE(test_result == 3.14);
    free_json(test_json);
}
TEST_CASE("json_read_number_as_int_integration") {
    auto test_json = create_json();
    json_set_number(test_json, "test_key", 42);
    auto test_result = json_read_number_as_int(test_json, "test_key");
    REQUIRE(test_result == 42);
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
    REQUIRE(read_value == "test_value");
    free_json(test_json);
}
TEST_CASE("json_set_array_of_string_integration") {
    auto test_json = create_json();
    json_set_array(test_json, "test_key", ["value1", "value2", "value3"]);
    json_read_array(test_json, "test_key", {:value_type=>"list", :value=>[]});
    REQUIRE(test_result == 3);
    free_json(test_json);
}
TEST_CASE("json_set_array_of_double_integration") {
    auto test_json = create_json();
    json_set_array(test_json, "numbers", [1.1, 2.2, 3.3]);
    json_read_array(test_json, "numbers", {:value_type=>"list", :value=>[]});
    REQUIRE(read_numbers == [1.1, 2.2, 3.3]);
    free_json(test_json);
}
TEST_CASE("json_set_array_of_bool_integration") {
    auto test_json = create_json();
    json_set_array(test_json, "test_key", "[true, false, true]");
    json_read_array(test_json, "test_key", {:value_type=>"list", :value=>[]});
    REQUIRE(read_array == "[true, false, true]");
    free_json(test_json);
}
TEST_CASE("json_set_array_of_json_integration") {
    auto test_json = create_json();
    auto test_json1 = create_json();
    auto test_json2 = create_json();
    json_set_string(test_json1, "key1", "value1");
    json_set_string(test_json2, "key2", "value2");
    json_set_array(test_json, "array_key", [{:value_type=>"variable", :variable_name=>"test_json1"}, {:value_type=>"variable", :variable_name=>"test_json2"}]);
    REQUIRE(json_read_string(json_read_object(test_json, 0), "key1") == "value1");
    REQUIRE(json_read_string(json_read_object(read_array, 1), "key2") == "value2");
    free_json(test_json);
    free_json(test_json1);
    free_json(test_json2);
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
    json_set_number(test_json, "age", 30);
    REQUIRE(json_read_number_as_int(test_json, "age") == 30);
    free_json(test_json);
}
TEST_CASE("json_set_number_double_integration") {
    auto test_json = create_json();
    json_set_number(test_json, "test_key", 3.14);
    REQUIRE(json_read_number_as_double(test_json, "test_key") == 3.14);
    free_json(test_json);
}
TEST_CASE("json_set_number_float_integration") {
    auto test_json = create_json();
    json_set_number(test_json, "test_key", 3.14);
    REQUIRE(json_read_number(test_json, "test_key") == 3.14);
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
    REQUIRE(json_read_string(test_json, "test_key") == "test_value");
    free_json(test_json);
}
TEST_CASE("json_to_color_integration") {
    auto test_json = create_json();
    json_set_string(test_json, "color", "#FF0000FF");
    auto test_color = json_to_color(test_json);
    REQUIRE(color_to_string(test_color) == "#FF0000FF");
    free_json(test_json);
}
TEST_CASE("json_to_file_integration") {
    auto test_json = create_json();
    json_set_string(test_json, "testKey", "testValue");
    json_to_file(test_json, "test.json");
    auto loaded_json = json_from_file("test.json");
    REQUIRE(json_read_string(loaded_json, "testKey") == "testValue");
    free_json(test_json);
    free_json(loaded_json);
}
TEST_CASE("json_to_string_integration") {
    auto test_json = create_json();
    json_set_string(test_json, "key", "value");
    auto test_json_string = json_to_string(test_json);
    REQUIRE(test_json_string != "");
    free_json(test_json);
}
