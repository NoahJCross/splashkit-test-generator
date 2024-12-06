uses SplashKit, TestFramework

type
TIntegrationTests = class(TTestCase)
published
procedure TIntegrationTests.TestCreateJsonIntegration;
begin
    testJson := create_json();
    AssertNotNull(testJson);
    free_json(testJson);
end;
procedure TIntegrationTests.TestCreateJsonFromStringIntegration;
begin
    testJson := create_json("{\"name\":\"John\",\"age\":30,\"city\":\"New York\"}");
    AssertTrue(json_has_key(testJson, "name"));
    AssertEquals(json_read_string(testJson, "name"), "John");
    free_json(testJson);
end;
procedure TIntegrationTests.TestFreeAllJsonIntegration;
begin
    testJson1 := create_json();
    testJson2 := create_json();
    count1 := json_count_keys(testJson1);
    count2 := json_count_keys(testJson2);
    AssertTrue(count1 > 0);
    AssertTrue(count2 > 0);
    free_all_json();
    count1AfterFree := json_count_keys(testJson1);
    count2AfterFree := json_count_keys(testJson2);
    AssertEquals(count1AfterFree, 0);
    AssertEquals(count2AfterFree, 0);
end;
procedure TIntegrationTests.TestFreeJsonIntegration;
begin
    testJson := create_json();
    json_set_string(testJson, "key", "value");
    free_json(testJson);
    AssertFalse(json_has_key(testJson, "key"));
end;
procedure TIntegrationTests.TestJsonCountKeysIntegration;
begin
    testJson := create_json();
    json_set_string(testJson, "key1", "value1");
    json_set_number(testJson, "key2", 42);
    keyCount := json_count_keys(testJson);
    AssertEquals(keyCount, 2);
    free_json(testJson);
end;
procedure TIntegrationTests.TestJsonFromColorIntegration;
begin
    testColor := color_bright_green();
    testJson := json_from_color(testColor);
    AssertTrue(json_has_key(testJson, "color"));
    AssertEquals(json_read_string(testJson, "color"), "#00ff00ff");
    free_json(testJson);
    free_all_json();
end;
procedure TIntegrationTests.TestJsonFromFileIntegration;
begin
    testJson := json_from_file("test.json");
    AssertNotNull(testJson);
    testValue := json_read_string(testJson, "key");
    AssertEquals(testValue, "expected_value");
    free_json(testJson);
end;
procedure TIntegrationTests.TestJsonFromStringIntegration;
begin
    testJson := json_from_string("{\"name\":\"John\",\"age\":30,\"city\":\"New York\"}");
    AssertEquals(json_read_string(testJson, "name"), "John");
    AssertEquals(json_read_number_as_int(testJson, "age"), 30);
    AssertEquals(json_read_string(testJson, "city"), "New York");
    free_json(testJson);
end;
procedure TIntegrationTests.TestJsonHasKeyIntegration;
begin
    testJson := create_json();
    json_set_string(testJson, "key1", "value1");
    AssertTrue(json_has_key(testJson, "key1"));
    AssertFalse(json_has_key(testJson, "key2"));
    free_json(testJson);
end;
procedure TIntegrationTests.TestJsonReadArrayOfDoubleIntegration;
begin
    testJson := create_json();
    json_set_array(testJson, "numbers", [1.1, 2.2, 3.3]);
    json_read_array(testJson, "numbers", {:value_type=>"list", :value=>[]});
    AssertEquals({:value_type=>"array_access", :array_name=>"out_result", :index=>0}, 3);
    AssertEquals({:value_type=>"array_access", :array_name=>"out_result", :index=>1}, 2.2);
    free_json(testJson);
    free_all_json();
end;
procedure TIntegrationTests.TestJsonReadArrayOfJsonIntegration;
begin
    testJson := create_json();
    testJsonNested1 := create_json();
    testJsonNested2 := create_json();
    json_set_string(testJsonNested1, "key1", "value1");
    json_set_string(testJsonNested2, "key2", "value2");
    json_set_array(testJson, "array_key", {:value_type=>"vector", :value=>[{:value_type=>"variable", :variable_name=>"test_json_nested1"}, {:value_type=>"variable", :variable_name=>"test_json_nested2"}]});
    json_read_array(testJson, "array_key", {:value_type=>"vector", :variable_name=>[]});
    AssertEquals(outResult, 2);
    free_json(testJson);
    free_json(testJsonNested1);
    free_json(testJsonNested2);
    free_all_json();
end;
procedure TIntegrationTests.TestJsonReadArrayOfStringIntegration;
begin
    testJson := create_json();
    json_set_array(testJson, "test_array", ["item1", "item2", "item3"]);
    json_read_array(testJson, "test_array", outResult);
    AssertEquals(size, 3);
    AssertEquals(indexOfJson0, "item1");
    free_json(testJson);
end;
procedure TIntegrationTests.TestJsonReadArrayOfBoolIntegration;
begin
    testJson := create_json();
    json_set_array(testJson, "test_key", "[true, false, true]");
    json_read_array(testJson, "test_key", outResult);
    AssertEquals(size, 3);
    AssertEquals(indexOfJson0, 0);
    AssertNotEquals(indexOfJson1, 1);
    AssertEquals(indexOfJson2, 2);
    free_json(testJson);
end;
procedure TIntegrationTests.TestJsonReadBoolIntegration;
begin
    testJson := create_json();
    json_set_bool(testJson, "test_key", true);
    AssertTrue(json_read_bool(testJson, "test_key"));
    json_set_bool(testJson, "test_key", false);
    AssertFalse(json_read_bool(testJson, "test_key"));
    free_json(testJson);
end;
procedure TIntegrationTests.TestJsonReadNumberIntegration;
begin
    testJson := create_json();
    json_set_number(testJson, "test_key", 42.5);
    testResult := json_read_number(testJson, "test_key");
    AssertEquals(testResult, 42.5);
    free_json(testJson);
end;
procedure TIntegrationTests.TestJsonReadNumberAsDoubleIntegration;
begin
    testJson := create_json();
    json_set_number(testJson, "test_key", 3.14);
    testResult := json_read_number_as_double(testJson, "test_key");
    AssertEquals(testResult, 3.14);
    free_json(testJson);
end;
procedure TIntegrationTests.TestJsonReadNumberAsIntIntegration;
begin
    testJson := create_json();
    json_set_number(testJson, "test_key", 42);
    testResult := json_read_number_as_int(testJson, "test_key");
    AssertEquals(testResult, 42);
    free_json(testJson);
end;
procedure TIntegrationTests.TestJsonReadObjectIntegration;
begin
    testJson := create_json();
    json_set_object(testJson, "nestedObject", create_json());
    readJson := json_read_object(testJson, "nestedObject");
    AssertNotNull(readJson);
    free_json(testJson);
    free_json(readJson);
end;
procedure TIntegrationTests.TestJsonReadStringIntegration;
begin
    testJson := create_json();
    json_set_string(testJson, "test_key", "test_value");
    readValue := json_read_string(testJson, "test_key");
    AssertEquals(readValue, "test_value");
    free_json(testJson);
end;
procedure TIntegrationTests.TestJsonSetArrayOfStringIntegration;
begin
    testJson := create_json();
    json_set_array(testJson, "test_key", ["value1", "value2", "value3"]);
    json_read_array(testJson, "test_key", {:value_type=>"list", :value=>[]});
    AssertEquals(testResult, 3);
    free_json(testJson);
end;
procedure TIntegrationTests.TestJsonSetArrayOfDoubleIntegration;
begin
    testJson := create_json();
    json_set_array(testJson, "numbers", [1.1, 2.2, 3.3]);
    json_read_array(testJson, "numbers", {:value_type=>"list", :value=>[]});
    AssertEquals(readNumbers, [1.1, 2.2, 3.3]);
    free_json(testJson);
end;
procedure TIntegrationTests.TestJsonSetArrayOfBoolIntegration;
begin
    testJson := create_json();
    json_set_array(testJson, "test_key", "[true, false, true]");
    json_read_array(testJson, "test_key", {:value_type=>"list", :value=>[]});
    AssertEquals(readArray, "[true, false, true]");
    free_json(testJson);
end;
procedure TIntegrationTests.TestJsonSetArrayOfJsonIntegration;
begin
    testJson := create_json();
    testJson1 := create_json();
    testJson2 := create_json();
    json_set_string(testJson1, "key1", "value1");
    json_set_string(testJson2, "key2", "value2");
    json_set_array(testJson, "array_key", [{:value_type=>"variable", :variable_name=>"test_json1"}, {:value_type=>"variable", :variable_name=>"test_json2"}]);
    AssertEquals(json_read_string(json_read_object(testJson, 0), "key1"), "value1");
    AssertEquals(json_read_string(json_read_object(readArray, 1), "key2"), "value2");
    free_json(testJson);
    free_json(testJson1);
    free_json(testJson2);
    free_all_json();
end;
procedure TIntegrationTests.TestJsonSetBoolIntegration;
begin
    testJson := create_json();
    json_set_bool(testJson, "test_key", true);
    AssertTrue(json_has_key(testJson, "test_key"));
    AssertTrue(json_read_bool(testJson, "test_key"));
    free_json(testJson);
end;
procedure TIntegrationTests.TestJsonSetNumberIntegerIntegration;
begin
    testJson := create_json();
    json_set_number(testJson, "age", 30);
    AssertEquals(json_read_number_as_int(testJson, "age"), 30);
    free_json(testJson);
end;
procedure TIntegrationTests.TestJsonSetNumberDoubleIntegration;
begin
    testJson := create_json();
    json_set_number(testJson, "test_key", 3.14);
    AssertEquals(json_read_number_as_double(testJson, "test_key"), 3.14);
    free_json(testJson);
end;
procedure TIntegrationTests.TestJsonSetNumberFloatIntegration;
begin
    testJson := create_json();
    json_set_number(testJson, "test_key", 3.14);
    AssertEquals(json_read_number(testJson, "test_key"), 3.14);
    free_json(testJson);
end;
procedure TIntegrationTests.TestJsonSetObjectIntegration;
begin
    testJson := create_json();
    testNestedJson := create_json();
    json_set_object(testJson, "nested", testNestedJson);
    AssertTrue(json_has_key(testJson, "nested"));
    free_json(testJson);
    free_json(testNestedJson);
    free_all_json();
end;
procedure TIntegrationTests.TestJsonSetStringIntegration;
begin
    testJson := create_json();
    json_set_string(testJson, "test_key", "test_value");
    AssertEquals(json_read_string(testJson, "test_key"), "test_value");
    free_json(testJson);
end;
procedure TIntegrationTests.TestJsonToColorIntegration;
begin
    testJson := create_json();
    json_set_string(testJson, "color", "#FF0000FF");
    testColor := json_to_color(testJson);
    AssertEquals(color_to_string(testColor), "#FF0000FF");
    free_json(testJson);
end;
procedure TIntegrationTests.TestJsonToFileIntegration;
begin
    testJson := create_json();
    json_set_string(testJson, "testKey", "testValue");
    json_to_file(testJson, "test.json");
    loadedJson := json_from_file("test.json");
    AssertEquals(json_read_string(loadedJson, "testKey"), "testValue");
    free_json(testJson);
    free_json(loadedJson);
end;
procedure TIntegrationTests.TestJsonToStringIntegration;
begin
    testJson := create_json();
    json_set_string(testJson, "key", "value");
    testJsonString := json_to_string(testJson);
    AssertNotEquals(testJsonString, "");
    free_json(testJson);
end;
end;

procedure RegisterTests;
begin
TestFramework.RegisterTest(TIntegrationTests.Suite);
end;
