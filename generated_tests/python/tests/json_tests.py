import pytest
from splashkit import *


def test_CreateJson_integration():
    test_json = create_json()
    assert test_json is not None
    free_json(test_json)


def test_CreateJsonFromString_integration():
    test_json = create_json_from_string("{\"name\":\"John\",\"age\":30,\"city\":\"New York\"}")
    assert json_has_key(test_json, "name") is True
    assert "John" == json_read_string(test_json, "name")
    free_json(test_json)


def test_FreeAllJson_integration():
    test_json1 = create_json()
    test_json2 = create_json()
    count1 = json_count_keys(test_json1)
    count2 = json_count_keys(test_json2)
    assert count1 > 0
    assert count2 > 0
    free_all_json()
    count1_after_free = json_count_keys(test_json1)
    count2_after_free = json_count_keys(test_json2)
    assert 0 == count1_after_free
    assert 0 == count2_after_free


def test_FreeJson_integration():
    test_json = create_json()
    json_set_string(test_json, "key", "value")
    free_json(test_json)
    assert json_has_key(test_json, "key") is False


def test_JsonCountKeys_integration():
    test_json = create_json()
    json_set_string(test_json, "key1", "value1")
    json_set_number_integer(test_json, "key2", 42)
    key_count = json_count_keys(test_json)
    assert 2 == key_count
    free_json(test_json)


def test_JsonFromColor_integration():
    test_color = color_bright_green()
    test_json = json_from_color(test_color)
    assert json_has_key(test_json, "color") is True
    assert "#00ff00ff" == json_read_string(test_json, "color")
    free_json(test_json)
    free_all_json()


def test_JsonFromFile_integration():
    test_json = json_from_file("test.json")
    assert test_json is not None
    test_value = json_read_string(test_json, "key")
    assert "expected_value" == test_value
    free_json(test_json)


def test_JsonFromString_integration():
    test_json = json_from_string("{\"name\":\"John\",\"age\":30,\"city\":\"New York\"}")
    assert "John" == json_read_string(test_json, "name")
    assert 30 == json_read_number_as_int(test_json, "age")
    assert "New York" == json_read_string(test_json, "city")
    free_json(test_json)


def test_JsonHasKey_integration():
    test_json = create_json()
    json_set_string(test_json, "key1", "value1")
    assert json_has_key(test_json, "key1") is True
    assert json_has_key(test_json, "key2") is False
    free_json(test_json)


def test_JsonReadArrayOfDouble_integration():
    test_json = create_json()
    json_set_array_of_double(test_json, "numbers", [1.1, 2.2, 3.3];)
    out_result = [];
    json_read_array_of_double(test_json, "numbers", out_result)
    assert 1.1 == out_result[0]
    assert 2.2 == out_result[1]
    free_json(test_json)
    free_all_json()


def test_JsonReadArrayOfJson_integration():
    test_json = create_json()
    test_json1 = create_json()
    test_json2 = create_json()
    json_set_string(test_json_nested1, "key1", "value1")
    json_set_string(test_json_nested2, "key2", "value2")
    test_json_array = [test_json1, test_json2];
    json_set_array_of_json(test_json, "array_key", test_json_array)
    out_result = [];
    json_read_array_of_json(test_json, "array_key", out_result)
    assert size(out_result) == 2
    free_json(test_json)
    free_json(test_json_nested1)
    free_json(test_json_nested2)
    free_all_json()


def test_JsonReadArrayOfString_integration():
    test_json = create_json()
    json_set_array_of_string(test_json, "test_array", ["item1", "item2", "item3"])
    out_result = [];
    json_read_array_of_string(test_json, "test_array", out_result)
    assert 3 == size(out_result)
    assert "item1" == out_result[0]
    free_json(test_json)


def test_JsonReadArrayOfBool_integration():
    test_json = create_json()
    json_set_array_of_bool(test_json, "test_key", [true, false, true];)
    out_result = [];
    json_read_array_of_bool(test_json, "test_key", out_result)
    assert size(out_result) == 3
    assert out_result[0] is True
    assert out_result[1] is False
    free_json(test_json)


def test_JsonReadBool_integration():
    test_json = create_json()
    json_set_bool(test_json, "test_key", true)
    assert json_read_bool(test_json, "test_key") is True
    json_set_bool(test_json, "test_key", false)
    assert json_read_bool(test_json, "test_key") is False
    free_json(test_json)


def test_JsonReadNumber_integration():
    test_json = create_json()
    json_set_number_float(test_json, "test_key", 42.5)
    test_result = json_read_number(test_json, "test_key")
    assert 42.5 == test_result
    free_json(test_json)


def test_JsonReadNumberAsDouble_integration():
    test_json = create_json()
    json_set_number_double(test_json, "test_key", 3.14)
    test_result = json_read_number_as_double(test_json, "test_key")
    assert 3.14 == test_result
    free_json(test_json)


def test_JsonReadNumberAsInt_integration():
    test_json = create_json()
    json_set_number_integer(test_json, "test_key", 42)
    test_result = json_read_number_as_int(test_json, "test_key")
    assert 42 == test_result
    free_json(test_json)


def test_JsonReadObject_integration():
    test_json = create_json()
    json_set_object(test_json, "nestedObject", create_json())
    read_json = json_read_object(test_json, "nestedObject")
    assert read_json is not None
    free_json(test_json)
    free_json(read_json)


def test_JsonReadString_integration():
    test_json = create_json()
    json_set_string(test_json, "test_key", "test_value")
    read_value = json_read_string(test_json, "test_key")
    assert "test_value" == read_value
    free_json(test_json)


def test_JsonSetArrayOfString_integration():
    test_json = create_json()
    json_set_array_of_string(test_json, "test_key", ["value1", "value2", "value3"];)
    out_result = [];
    json_read_array_of_string(test_json, "test_key", out_result)
    assert ["value1", "value2", "value3"] == out_result
    free_json(test_json)


def test_JsonSetArrayOfDouble_integration():
    test_json = create_json()
    json_set_array_of_double(test_json, "numbers", [1.1, 2.2, 3.3];)
    out_result = [];
    json_read_array_of_double(test_json, "numbers", out_result)
    assert [1.1, 2.2, 3.3] == out_result
    free_json(test_json)


def test_JsonSetArrayOfBool_integration():
    test_json = create_json()
    json_set_array_of_bool(test_json, "test_key", [true, false, true])
    out_result = [];
    json_read_array_of_bool(test_json, "test_key", out_result)
    assert [true, false, true] == out_result
    free_json(test_json)


def test_JsonSetArrayOfJson_integration():
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


def test_JsonSetBool_integration():
    test_json = create_json()
    json_set_bool(test_json, "test_key", true)
    assert json_has_key(test_json, "test_key") is True
    assert json_read_bool(test_json, "test_key") is True
    free_json(test_json)


def test_JsonSetNumberInteger_integration():
    test_json = create_json()
    json_set_number_integer(test_json, "age", 30)
    assert 30 == json_read_number_as_int(test_json, "age")
    free_json(test_json)


def test_JsonSetNumberDouble_integration():
    test_json = create_json()
    json_set_number_double(test_json, "test_key", 3.14)
    assert 3.14 == json_read_number_as_double(test_json, "test_key")
    free_json(test_json)


def test_JsonSetNumberFloat_integration():
    test_json = create_json()
    json_set_number_float(test_json, "test_key", 3.14)
    assert 3.14 == json_read_number(test_json, "test_key")
    free_json(test_json)


def test_JsonSetObject_integration():
    test_json = create_json()
    test_nested_json = create_json()
    json_set_object(test_json, "nested", test_nested_json)
    assert json_has_key(test_json, "nested") is True
    free_json(test_json)
    free_json(test_nested_json)
    free_all_json()


def test_JsonSetString_integration():
    test_json = create_json()
    json_set_string(test_json, "test_key", "test_value")
    assert "test_value" == json_read_string(test_json, "test_key")
    free_json(test_json)


def test_JsonToColor_integration():
    test_json = create_json()
    json_set_string(test_json, "color", "#FF0000FF")
    test_color = json_to_color(test_json)
    assert "#FF0000FF" == color_to_string(test_color)
    free_json(test_json)


def test_JsonToFile_integration():
    test_json = create_json()
    json_set_string(test_json, "testKey", "testValue")
    json_to_file(test_json, "test.json")
    loaded_json = json_from_file("test.json")
    assert "testValue" == json_read_string(loaded_json, "testKey")
    free_json(test_json)
    free_json(loaded_json)


def test_JsonToString_integration():
    test_json = create_json()
    json_set_string(test_json, "key", "value")
    test_json_string = json_to_string(test_json)
    assert "" != test_json_string
    free_json(test_json)

