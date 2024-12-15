import pytest
from splashkit import *

class TestJson:

def test_create_json_integration():
    test_json = create_json()
    assert test_json is not None
    free_json(test_json)


def test_create_json_from_string_integration():
    test_json = create_json_from_string("{"name":"John","age":30,"city":"New York"}")
    assert json_has_key(test_json, "name")
    assert "John" == json_read_string(test_json, "name")
    free_json(test_json)


def test_free_all_json_integration():
    test_json1 = create_json()
    test_json2 = create_json()
    count1 = json_count_keys(test_json1)
    json_set_string(test_json1, "key", "value")
    json_set_string(test_json2, "key", "value")
    count2 = json_count_keys(test_json2)
    assert count1 > 0
    assert count2 > 0
    free_all_json()
    count1_after_free = json_count_keys(test_json1)
    count2_after_free = json_count_keys(test_json2)
    assert 0 == count1_after_free
    assert 0 == count2_after_free


def test_free_json_integration():
    test_json = create_json()
    json_set_string(test_json, "key", "value")
    free_json(test_json)
    assert not json_has_key(test_json, "key")


def test_json_count_keys_integration():
    test_json = create_json()
    json_set_string(test_json, "key1", "value1")
    json_set_number_integer(test_json, "key2", 42)
    key_count = json_count_keys(test_json)
    assert 2 == key_count
    free_json(test_json)


def test_json_from_color_integration():
    test_color = color_bright_green()
    test_json = json_from_color(test_color)
    assert json_has_key(test_json, "color")
    assert "#00ff00ff" == json_read_string(test_json, "color")
    free_json(test_json)
    free_all_json()


def test_json_from_file_integration():
    test_json = json_from_file("person.json")
    assert test_json is not None
    test_value = json_read_string(test_json, "firstName")
    assert "John" == test_value
    free_json(test_json)


def test_json_from_string_integration():
    test_json = json_from_string("{"name":"John","age":30,"city":"New York"}")
    assert "John" == json_read_string(test_json, "name")
    assert 30 == json_read_number_as_int(test_json, "age")
    assert "New York" == json_read_string(test_json, "city")
    free_json(test_json)


def test_json_has_key_integration():
    test_json = create_json()
    json_set_string(test_json, "key1", "value1")
    assert json_has_key(test_json, "key1")
    assert not json_has_key(test_json, "key2")
    free_json(test_json)


def test_json_read_array_of_double_integration():
    test_json = create_json()
    json_set_array_of_double(test_json, "numbers", [1.1, 2.2, 3.3])
    out_result = [];
    json_read_array_of_double(test_json, "numbers", out_result)
    assert 1.1 == out_result[0]
    assert 2.2 == out_result[1]
    free_json(test_json)
    free_all_json()


def test_json_read_array_of_json_integration():
    test_json = create_json()
    test_json1 = create_json()
    test_json2 = create_json()
    json_set_string(test_json1, "key1", "value1")
    json_set_string(test_json2, "key2", "value2")
    test_json_array = [test_json1, test_json2];
    json_set_array_of_json(test_json, "array_key", test_json_array)
    out_result = [];
    json_read_array_of_json(test_json, "array_key", out_result)
    assert 2 == len(out_result)
    free_json(test_json)
    free_json(test_json1)
    free_json(test_json2)
    free_all_json()


def test_json_read_array_of_string_integration():
    test_json = create_json()
    json_set_array_of_string(test_json, "test_array", ["item1", "item2", "item3"])
    out_result = [];
    json_read_array_of_string(test_json, "test_array", out_result)
    assert 3 == len(out_result)
    assert "item1" == out_result[0]
    free_json(test_json)


def test_json_read_array_of_bool_integration():
    test_json = create_json()
    json_set_array_of_bool(test_json, "test_key", [true, false, true])
    out_result = [];
    json_read_array_of_bool(test_json, "test_key", out_result)
    assert 3 == len(out_result)
    assert out_result[0]
    assert not out_result[1]
    free_json(test_json)


def test_json_read_bool_integration():
    test_json = create_json()
    json_set_bool(test_json, "test_key", true)
    assert json_read_bool(test_json, "test_key")
    json_set_bool(test_json, "test_key", false)
    assert not json_read_bool(test_json, "test_key")
    free_json(test_json)


def test_json_read_number_integration():
    test_json = create_json()
    json_set_number_float(test_json, "test_key", 42.5)
    test_result = json_read_number(test_json, "test_key")
    assert 42.5 == test_result
    free_json(test_json)


def test_json_read_number_as_double_integration():
    test_json = create_json()
    json_set_number_double(test_json, "test_key", 3.14)
    test_result = json_read_number_as_double(test_json, "test_key")
    assert 3.14 == test_result
    free_json(test_json)


def test_json_read_number_as_int_integration():
    test_json = create_json()
    json_set_number_integer(test_json, "test_key", 42)
    test_result = json_read_number_as_int(test_json, "test_key")
    assert 42 == test_result
    free_json(test_json)


def test_json_read_object_integration():
    test_json = create_json()
    json_set_object(test_json, "nestedObject", create_json())
    read_json = json_read_object(test_json, "nestedObject")
    assert read_json is not None
    free_json(test_json)
    free_json(read_json)


def test_json_read_string_integration():
    test_json = create_json()
    json_set_string(test_json, "test_key", "test_value")
    read_value = json_read_string(test_json, "test_key")
    assert "test_value" == read_value
    free_json(test_json)


def test_json_set_array_of_string_integration():
    test_json = create_json()
    json_set_array_of_string(test_json, "test_key", ["value1", "value2", "value3"])
    out_result = [];
    json_read_array_of_string(test_json, "test_key", out_result)
    assert ["value1", "value2", "value3"] == out_result
    free_json(test_json)


def test_json_set_array_of_double_integration():
    test_json = create_json()
    json_set_array_of_double(test_json, "numbers", [1.1, 2.2, 3.3])
    out_result = [];
    json_read_array_of_double(test_json, "numbers", out_result)
    assert [1.1, 2.2, 3.3] == out_result
    free_json(test_json)


def test_json_set_array_of_bool_integration():
    test_json = create_json()
    json_set_array_of_bool(test_json, "test_key", [true, false])
    out_result = [];
    json_read_array_of_bool(test_json, "test_key", out_result)
    assert [true, false] == out_result
    free_json(test_json)


def test_json_set_array_of_json_integration():
    test_json = create_json()
    test_json1 = create_json()
    test_json2 = create_json()
    json_set_string(test_json1, "key1", "value1")
    json_set_string(test_json2, "key2", "value2")
    test_json_array = [test_json1, test_json2];
    json_set_array_of_json(test_json, "array_key", test_json_array)
    out_result = [];
    json_read_array_of_json(test_json, "array_key", out_result)
    assert "value1" == json_read_string(out_result[0], "key1")
    assert "value2" == json_read_string(out_result[1], "key2")
    free_all_json()


def test_json_set_bool_integration():
    test_json = create_json()
    json_set_bool(test_json, "test_key", true)
    assert json_has_key(test_json, "test_key")
    assert json_read_bool(test_json, "test_key")
    free_json(test_json)


def test_json_set_number_integer_integration():
    test_json = create_json()
    json_set_number_integer(test_json, "age", 30)
    assert 30 == json_read_number_as_int(test_json, "age")
    free_json(test_json)


def test_json_set_number_double_integration():
    test_json = create_json()
    json_set_number_double(test_json, "test_key", 3.14)
    assert 3.14 == json_read_number_as_double(test_json, "test_key")
    free_json(test_json)


def test_json_set_number_float_integration():
    test_json = create_json()
    json_set_number_float(test_json, "test_key", 3.14)
    assert 3.140000104904175 == json_read_number(test_json, "test_key")
    free_json(test_json)


def test_json_set_object_integration():
    test_json = create_json()
    test_nested_json = create_json()
    json_set_object(test_json, "nested", test_nested_json)
    assert json_has_key(test_json, "nested")
    free_json(test_json)
    free_json(test_nested_json)
    free_all_json()


def test_json_set_string_integration():
    test_json = create_json()
    json_set_string(test_json, "test_key", "test_value")
    assert "test_value" == json_read_string(test_json, "test_key")
    free_json(test_json)


def test_json_to_color_integration():
    test_json = create_json()
    json_set_string(test_json, "color", "#ff0000ff")
    test_color = json_to_color(test_json)
    assert "#ff0000ff" == color_to_string(test_color)
    free_json(test_json)


def test_json_to_file_integration():
    test_json = create_json()
    json_set_string(test_json, "testKey", "testValue")
    json_to_file(test_json, "test.json")
    loaded_json = json_from_file("test.json")
    assert "testValue" == json_read_string(loaded_json, "testKey")
    free_json(test_json)
    free_json(loaded_json)


def test_json_to_string_integration():
    test_json = create_json()
    json_set_string(test_json, "key", "value")
    test_json_string = json_to_string(test_json)
    assert "" != test_json_string
    free_json(test_json)

