import pytest
from splashkit import *


def test_CreateJson_integration():
    test_json = CreateJson()
    assert test_json is not None
    FreeJson(test_json)


def test_CreateJsonFromString_integration():
    test_json = CreateJsonFromString("{\"name\":\"John\",\"age\":30,\"city\":\"New York\"}")
    assert JsonHasKey(test_json, "name") is True
    assert JsonReadString(test_json, "name") == "John"
    FreeJson(test_json)


def test_FreeAllJson_integration():
    test_json1 = CreateJson()
    test_json2 = CreateJson()
    count1 = JsonCountKeys(test_json1)
    count2 = JsonCountKeys(test_json2)
    assert count1 > 0
    assert count2 > 0
    FreeAllJson()
    count1_after_free = JsonCountKeys(test_json1)
    count2_after_free = JsonCountKeys(test_json2)
    assert count1_after_free == 0
    assert count2_after_free == 0


def test_FreeJson_integration():
    test_json = CreateJson()
    JsonSetString(test_json, "key", "value")
    FreeJson(test_json)
    assert JsonHasKey(test_json, "key") is False


def test_JsonCountKeys_integration():
    test_json = CreateJson()
    JsonSetString(test_json, "key1", "value1")
    JsonSetNumberInteger(test_json, "key2", 42)
    key_count = JsonCountKeys(test_json)
    assert key_count == 2
    FreeJson(test_json)


def test_JsonFromColor_integration():
    test_color = ColorBrightGreen()
    test_json = JsonFromColor(test_color)
    assert JsonHasKey(test_json, "color") is True
    assert JsonReadString(test_json, "color") == "#00ff00ff"
    FreeJson(test_json)
    FreeAllJson()


def test_JsonFromFile_integration():
    test_json = JsonFromFile("test.json")
    assert test_json is not None
    test_value = JsonReadString(test_json, "key")
    assert test_value == "expected_value"
    FreeJson(test_json)


def test_JsonFromString_integration():
    test_json = JsonFromString("{\"name\":\"John\",\"age\":30,\"city\":\"New York\"}")
    assert JsonReadString(test_json, "name") == "John"
    assert JsonReadNumberAsInt(test_json, "age") == 30
    assert JsonReadString(test_json, "city") == "New York"
    FreeJson(test_json)


def test_JsonHasKey_integration():
    test_json = CreateJson()
    JsonSetString(test_json, "key1", "value1")
    assert JsonHasKey(test_json, "key1") is True
    assert JsonHasKey(test_json, "key2") is False
    FreeJson(test_json)


def test_JsonReadArrayOfDouble_integration():
    test_json = CreateJson()
    JsonSetArrayOfDouble(test_json, "numbers", [1.1, 2.2, 3.3])
    JsonReadArrayOfDouble(test_json, "numbers", {:value_type=>"list", :value=>[]})
    assert {:value_type=>"array_access", :array_name=>"out_result", :index=>0} == 3
    assert {:value_type=>"array_access", :array_name=>"out_result", :index=>1} == 2.2
    FreeJson(test_json)
    FreeAllJson()


def test_JsonReadArrayOfJson_integration():
    test_json = CreateJson()
    test_json_nested1 = CreateJson()
    test_json_nested2 = CreateJson()
    JsonSetString(test_json_nested1, "key1", "value1")
    JsonSetString(test_json_nested2, "key2", "value2")
    JsonSetArrayOfJson(test_json, "array_key", {:value_type=>"vector", :value=>[{:value_type=>"variable", :variable_name=>"test_json_nested1"}, {:value_type=>"variable", :variable_name=>"test_json_nested2"}]})
    JsonReadArrayOfJson(test_json, "array_key", {:value_type=>"vector", :variable_name=>[]})
    assert out_result == 2
    FreeJson(test_json)
    FreeJson(test_json_nested1)
    FreeJson(test_json_nested2)
    FreeAllJson()


def test_JsonReadArrayOfString_integration():
    test_json = CreateJson()
    JsonSetArrayOfString(test_json, "test_array", ["item1", "item2", "item3"])
    JsonReadArrayOfString(test_json, "test_array", out_result)
    assert size == 3
    assert index_of_json0 == "item1"
    FreeJson(test_json)


def test_JsonReadArrayOfBool_integration():
    test_json = CreateJson()
    JsonSetArrayOfBool(test_json, "test_key", "[true, false, true]")
    JsonReadArrayOfBool(test_json, "test_key", out_result)
    assert size == 3
    assert index_of_json0 == 0
    assert index_of_json1 != 1
    assert index_of_json2 == 2
    FreeJson(test_json)


def test_JsonReadBool_integration():
    test_json = CreateJson()
    JsonSetBool(test_json, "test_key", true)
    assert JsonReadBool(test_json, "test_key") is True
    JsonSetBool(test_json, "test_key", false)
    assert JsonReadBool(test_json, "test_key") is False
    FreeJson(test_json)


def test_JsonReadNumber_integration():
    test_json = CreateJson()
    JsonSetNumberFloat(test_json, "test_key", 42.5)
    test_result = JsonReadNumber(test_json, "test_key")
    assert test_result == 42.5
    FreeJson(test_json)


def test_JsonReadNumberAsDouble_integration():
    test_json = CreateJson()
    JsonSetNumberDouble(test_json, "test_key", 3.14)
    test_result = JsonReadNumberAsDouble(test_json, "test_key")
    assert test_result == 3.14
    FreeJson(test_json)


def test_JsonReadNumberAsInt_integration():
    test_json = CreateJson()
    JsonSetNumberInteger(test_json, "test_key", 42)
    test_result = JsonReadNumberAsInt(test_json, "test_key")
    assert test_result == 42
    FreeJson(test_json)


def test_JsonReadObject_integration():
    test_json = CreateJson()
    JsonSetObject(test_json, "nestedObject", CreateJson())
    read_json = JsonReadObject(test_json, "nestedObject")
    assert read_json is not None
    FreeJson(test_json)
    FreeJson(read_json)


def test_JsonReadString_integration():
    test_json = CreateJson()
    JsonSetString(test_json, "test_key", "test_value")
    read_value = JsonReadString(test_json, "test_key")
    assert read_value == "test_value"
    FreeJson(test_json)


def test_JsonSetArrayOfString_integration():
    test_json = CreateJson()
    JsonSetArrayOfString(test_json, "test_key", ["value1", "value2", "value3"])
    JsonReadArrayOfString(test_json, "test_key", {:value_type=>"list", :value=>[]})
    assert test_result == 3
    FreeJson(test_json)


def test_JsonSetArrayOfDouble_integration():
    test_json = CreateJson()
    JsonSetArrayOfDouble(test_json, "numbers", [1.1, 2.2, 3.3])
    JsonReadArrayOfDouble(test_json, "numbers", {:value_type=>"list", :value=>[]})
    assert read_numbers == [1.1, 2.2, 3.3]
    FreeJson(test_json)


def test_JsonSetArrayOfBool_integration():
    test_json = CreateJson()
    JsonSetArrayOfBool(test_json, "test_key", "[true, false, true]")
    JsonReadArrayOfBool(test_json, "test_key", {:value_type=>"list", :value=>[]})
    assert read_array == "[true, false, true]"
    FreeJson(test_json)


def test_JsonSetArrayOfJson_integration():
    test_json = CreateJson()
    test_json1 = CreateJson()
    test_json2 = CreateJson()
    JsonSetString(test_json1, "key1", "value1")
    JsonSetString(test_json2, "key2", "value2")
    JsonSetArrayOfJson(test_json, "array_key", [{:value_type=>"variable", :variable_name=>"test_json1"}, {:value_type=>"variable", :variable_name=>"test_json2"}])
    assert JsonReadString(JsonReadObject(test_json, 0), "key1") == "value1"
    assert JsonReadString(JsonReadObject(read_array, 1), "key2") == "value2"
    FreeJson(test_json)
    FreeJson(test_json1)
    FreeJson(test_json2)
    FreeAllJson()


def test_JsonSetBool_integration():
    test_json = CreateJson()
    JsonSetBool(test_json, "test_key", true)
    assert JsonHasKey(test_json, "test_key") is True
    assert JsonReadBool(test_json, "test_key") is True
    FreeJson(test_json)


def test_JsonSetNumberInteger_integration():
    test_json = CreateJson()
    JsonSetNumberInteger(test_json, "age", 30)
    assert JsonReadNumberAsInt(test_json, "age") == 30
    FreeJson(test_json)


def test_JsonSetNumberDouble_integration():
    test_json = CreateJson()
    JsonSetNumberDouble(test_json, "test_key", 3.14)
    assert JsonReadNumberAsDouble(test_json, "test_key") == 3.14
    FreeJson(test_json)


def test_JsonSetNumberFloat_integration():
    test_json = CreateJson()
    JsonSetNumberFloat(test_json, "test_key", 3.14)
    assert JsonReadNumber(test_json, "test_key") == 3.14
    FreeJson(test_json)


def test_JsonSetObject_integration():
    test_json = CreateJson()
    test_nested_json = CreateJson()
    JsonSetObject(test_json, "nested", test_nested_json)
    assert JsonHasKey(test_json, "nested") is True
    FreeJson(test_json)
    FreeJson(test_nested_json)
    FreeAllJson()


def test_JsonSetString_integration():
    test_json = CreateJson()
    JsonSetString(test_json, "test_key", "test_value")
    assert JsonReadString(test_json, "test_key") == "test_value"
    FreeJson(test_json)


def test_JsonToColor_integration():
    test_json = CreateJson()
    JsonSetString(test_json, "color", "#FF0000FF")
    test_color = JsonToColor(test_json)
    assert ColorToString(test_color) == "#FF0000FF"
    FreeJson(test_json)


def test_JsonToFile_integration():
    test_json = CreateJson()
    JsonSetString(test_json, "testKey", "testValue")
    JsonToFile(test_json, "test.json")
    loaded_json = JsonFromFile("test.json")
    assert JsonReadString(loaded_json, "testKey") == "testValue"
    FreeJson(test_json)
    FreeJson(loaded_json)


def test_JsonToString_integration():
    test_json = CreateJson()
    JsonSetString(test_json, "key", "value")
    test_json_string = JsonToString(test_json)
    assert test_json_string != ""
    FreeJson(test_json)

