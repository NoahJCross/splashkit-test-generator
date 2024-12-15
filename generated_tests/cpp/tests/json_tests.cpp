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
        auto test_json = create_json(string("{"name":"John","age":30,"city":"New York"}"));
        REQUIRE(json_has_key(test_json, string("name")));
        REQUIRE(string("John") == json_read_string(test_json, string("name")));
        free_json(test_json);
    }
    TEST_CASE("free_all_json_integration") {
        auto test_json1 = create_json();
        auto test_json2 = create_json();
        auto count1 = json_count_keys(test_json1);
        json_set_string(test_json1, string("key"), string("value"));
        json_set_string(test_json2, string("key"), string("value"));
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
        json_set_string(test_json, string("key"), string("value"));
        free_json(test_json);
        REQUIRE_FALSE(json_has_key(test_json, string("key")));
    }
    TEST_CASE("json_count_keys_integration") {
        auto test_json = create_json();
        json_set_string(test_json, string("key1"), string("value1"));
        json_set_number(test_json, string("key2"), 42);
        auto key_count = json_count_keys(test_json);
        REQUIRE(2 == key_count);
        free_json(test_json);
    }
    TEST_CASE("json_from_color_integration") {
        auto test_color = color_bright_green();
        auto test_json = json_from_color(test_color);
        REQUIRE(json_has_key(test_json, string("color")));
        REQUIRE(string("#00ff00ff") == json_read_string(test_json, string("color")));
        free_json(test_json);
        free_all_json();
    }
    TEST_CASE("json_from_file_integration") {
        auto test_json = json_from_file(string("person.json"));
        REQUIRE(test_json != nullptr);
        auto test_value = json_read_string(test_json, string("firstName"));
        REQUIRE(string("John") == test_value);
        free_json(test_json);
    }
    TEST_CASE("json_from_string_integration") {
        auto test_json = json_from_string(string("{"name":"John","age":30,"city":"New York"}"));
        REQUIRE(string("John") == json_read_string(test_json, string("name")));
        REQUIRE(30 == json_read_number_as_int(test_json, string("age")));
        REQUIRE(string("New York") == json_read_string(test_json, string("city")));
        free_json(test_json);
    }
    TEST_CASE("json_has_key_integration") {
        auto test_json = create_json();
        json_set_string(test_json, string("key1"), string("value1"));
        REQUIRE(json_has_key(test_json, string("key1")));
        REQUIRE_FALSE(json_has_key(test_json, string("key2")));
        free_json(test_json);
    }
    TEST_CASE("json_read_array_of_double_integration") {
        auto test_json = create_json();
        json_set_array(test_json, string("numbers"), vector<double> { 1.1, 2.2, 3.3 });
        auto out_result = vector<double> {  };
        json_read_array(test_json, string("numbers"), &out_result);
        REQUIRE(1.1 == out_result[0]);
        REQUIRE(2.2 == out_result[1]);
        free_json(test_json);
        free_all_json();
    }
    TEST_CASE("json_read_array_of_json_integration") {
        auto test_json = create_json();
        auto test_json1 = create_json();
        auto test_json2 = create_json();
        json_set_string(test_json1, string("key1"), string("value1"));
        json_set_string(test_json2, string("key2"), string("value2"));
        auto test_json_array = vector<Json> { test_json1, test_json2 };
        json_set_array(test_json, string("array_key"), test_json_array);
        auto out_result = vector<Json> {  };
        json_read_array(test_json, string("array_key"), &out_result);
        REQUIRE(2 == out_result.size());
        free_json(test_json);
        free_json(test_json1);
        free_json(test_json2);
        free_all_json();
    }
    TEST_CASE("json_read_array_of_string_integration") {
        auto test_json = create_json();
        json_set_array(test_json, string("test_array"), vector<string> { string("item1"), string("item2"), string("item3") });
        auto out_result = vector<string> {  };
        json_read_array(test_json, string("test_array"), &out_result);
        REQUIRE(3 == out_result.size());
        REQUIRE(string("item1") == out_result[0]);
        free_json(test_json);
    }
    TEST_CASE("json_read_array_of_bool_integration") {
        auto test_json = create_json();
        json_set_array(test_json, string("test_key"), vector<bool> { true, false, true });
        auto out_result = vector<bool> {  };
        json_read_array(test_json, string("test_key"), &out_result);
        REQUIRE(3 == out_result.size());
        REQUIRE(out_result[0]);
        REQUIRE_FALSE(out_result[1]);
        free_json(test_json);
    }
    TEST_CASE("json_read_bool_integration") {
        auto test_json = create_json();
        json_set_bool(test_json, string("test_key"), true);
        REQUIRE(json_read_bool(test_json, string("test_key")));
        json_set_bool(test_json, string("test_key"), false);
        REQUIRE_FALSE(json_read_bool(test_json, string("test_key")));
        free_json(test_json);
    }
    TEST_CASE("json_read_number_integration") {
        auto test_json = create_json();
        json_set_number(test_json, string("test_key"), 42.5f);
        auto test_result = json_read_number(test_json, string("test_key"));
        REQUIRE(42.5 == test_result);
        free_json(test_json);
    }
    TEST_CASE("json_read_number_as_double_integration") {
        auto test_json = create_json();
        json_set_number(test_json, string("test_key"), 3.14);
        auto test_result = json_read_number_as_double(test_json, string("test_key"));
        REQUIRE(3.14 == test_result);
        free_json(test_json);
    }
    TEST_CASE("json_read_number_as_int_integration") {
        auto test_json = create_json();
        json_set_number(test_json, string("test_key"), 42);
        auto test_result = json_read_number_as_int(test_json, string("test_key"));
        REQUIRE(42 == test_result);
        free_json(test_json);
    }
    TEST_CASE("json_read_object_integration") {
        auto test_json = create_json();
        json_set_object(test_json, string("nestedObject"), create_json());
        auto read_json = json_read_object(test_json, string("nestedObject"));
        REQUIRE(read_json != nullptr);
        free_json(test_json);
        free_json(read_json);
    }
    TEST_CASE("json_read_string_integration") {
        auto test_json = create_json();
        json_set_string(test_json, string("test_key"), string("test_value"));
        auto read_value = json_read_string(test_json, string("test_key"));
        REQUIRE(string("test_value") == read_value);
        free_json(test_json);
    }
    TEST_CASE("json_set_array_of_string_integration") {
        auto test_json = create_json();
        json_set_array(test_json, string("test_key"), vector<string> { string("value1"), string("value2"), string("value3") });
        auto out_result = vector<string> {  };
        json_read_array(test_json, string("test_key"), &out_result);
        REQUIRE(vector<string> { string("value1"), string("value2"), string("value3") } == out_result);
        free_json(test_json);
    }
    TEST_CASE("json_set_array_of_double_integration") {
        auto test_json = create_json();
        json_set_array(test_json, string("numbers"), vector<double> { 1.1, 2.2, 3.3 });
        auto out_result = vector<double> {  };
        json_read_array(test_json, string("numbers"), &out_result);
        REQUIRE(vector<double> { 1.1, 2.2, 3.3 } == out_result);
        free_json(test_json);
    }
    TEST_CASE("json_set_array_of_bool_integration") {
        auto test_json = create_json();
        json_set_array(test_json, string("test_key"), vector<bool> { true, false });
        auto out_result = vector<bool> {  };
        json_read_array(test_json, string("test_key"), &out_result);
        REQUIRE(vector<bool> { true, false } == out_result);
        free_json(test_json);
    }
    TEST_CASE("json_set_array_of_json_integration") {
        auto test_json = create_json();
        auto test_json1 = create_json();
        auto test_json2 = create_json();
        json_set_string(test_json1, string("key1"), string("value1"));
        json_set_string(test_json2, string("key2"), string("value2"));
        auto test_json_array = vector<Json> { test_json1, test_json2 };
        json_set_array(test_json, string("array_key"), test_json_array);
        auto out_result = vector<Json> {  };
        json_read_array(test_json, string("array_key"), &out_result);
        REQUIRE(string("value1") == json_read_string(out_result[0], string("key1")));
        REQUIRE(string("value2") == json_read_string(out_result[1], string("key2")));
        free_all_json();
    }
    TEST_CASE("json_set_bool_integration") {
        auto test_json = create_json();
        json_set_bool(test_json, string("test_key"), true);
        REQUIRE(json_has_key(test_json, string("test_key")));
        REQUIRE(json_read_bool(test_json, string("test_key")));
        free_json(test_json);
    }
    TEST_CASE("json_set_number_integer_integration") {
        auto test_json = create_json();
        json_set_number(test_json, string("age"), 30);
        REQUIRE(30 == json_read_number_as_int(test_json, string("age")));
        free_json(test_json);
    }
    TEST_CASE("json_set_number_double_integration") {
        auto test_json = create_json();
        json_set_number(test_json, string("test_key"), 3.14);
        REQUIRE(3.14 == json_read_number_as_double(test_json, string("test_key")));
        free_json(test_json);
    }
    TEST_CASE("json_set_number_float_integration") {
        auto test_json = create_json();
        json_set_number(test_json, string("test_key"), 3.14f);
        REQUIRE(3.140000104904175 == json_read_number(test_json, string("test_key")));
        free_json(test_json);
    }
    TEST_CASE("json_set_object_integration") {
        auto test_json = create_json();
        auto test_nested_json = create_json();
        json_set_object(test_json, string("nested"), test_nested_json);
        REQUIRE(json_has_key(test_json, string("nested")));
        free_json(test_json);
        free_json(test_nested_json);
        free_all_json();
    }
    TEST_CASE("json_set_string_integration") {
        auto test_json = create_json();
        json_set_string(test_json, string("test_key"), string("test_value"));
        REQUIRE(string("test_value") == json_read_string(test_json, string("test_key")));
        free_json(test_json);
    }
    TEST_CASE("json_to_color_integration") {
        auto test_json = create_json();
        json_set_string(test_json, string("color"), string("#ff0000ff"));
        auto test_color = json_to_color(test_json);
        REQUIRE(string("#ff0000ff") == color_to_string(test_color));
        free_json(test_json);
    }
    TEST_CASE("json_to_file_integration") {
        auto test_json = create_json();
        json_set_string(test_json, string("testKey"), string("testValue"));
        json_to_file(test_json, string("test.json"));
        auto loaded_json = json_from_file(string("test.json"));
        REQUIRE(string("testValue") == json_read_string(loaded_json, string("testKey")));
        free_json(test_json);
        free_json(loaded_json);
    }
    TEST_CASE("json_to_string_integration") {
        auto test_json = create_json();
        json_set_string(test_json, string("key"), string("value"));
        auto test_json_string = json_to_string(test_json);
        REQUIRE(string("") != test_json_string);
        free_json(test_json);
    }
};
