uses SplashKit, TestFramework

type
TIntegrationTests = class(TTestCase)
published
procedure TIntegrationTests.TestCreateJsonIntegration;
begin
    testJson := CreateJson();
    AssertNotNull(testJson);
    FreeJson(testJson);
end;
procedure TIntegrationTests.TestCreateJsonFromStringIntegration;
begin
    testJson := CreateJson("{\"name\":\"John\",\"age\":30,\"city\":\"New York\"}");
    AssertTrue(JsonHasKey(testJson, "name"));
    AssertEquals(JsonReadString(testJson, "name"), "John");
    FreeJson(testJson);
end;
procedure TIntegrationTests.TestFreeAllJsonIntegration;
begin
    testJson1 := CreateJson();
    testJson2 := CreateJson();
    count1 := JsonCountKeys(testJson1);
    count2 := JsonCountKeys(testJson2);
    AssertTrue(count1 > 0);
    AssertTrue(count2 > 0);
    FreeAllJson();
    count1AfterFree := JsonCountKeys(testJson1);
    count2AfterFree := JsonCountKeys(testJson2);
    AssertEquals(count1AfterFree, 0);
    AssertEquals(count2AfterFree, 0);
end;
procedure TIntegrationTests.TestFreeJsonIntegration;
begin
    testJson := CreateJson();
    JsonSetString(testJson, "key", "value");
    FreeJson(testJson);
    AssertFalse(JsonHasKey(testJson, "key"));
end;
procedure TIntegrationTests.TestJsonCountKeysIntegration;
begin
    testJson := CreateJson();
    JsonSetString(testJson, "key1", "value1");
    JsonSetNumber(testJson, "key2", 42);
    keyCount := JsonCountKeys(testJson);
    AssertEquals(keyCount, 2);
    FreeJson(testJson);
end;
procedure TIntegrationTests.TestJsonFromColorIntegration;
begin
    testColor := ColorBrightGreen();
    testJson := JsonFromColor(testColor);
    AssertTrue(JsonHasKey(testJson, "color"));
    AssertEquals(JsonReadString(testJson, "color"), "#00ff00ff");
    FreeJson(testJson);
    FreeAllJson();
end;
procedure TIntegrationTests.TestJsonFromFileIntegration;
begin
    testJson := JsonFromFile("test.json");
    AssertNotNull(testJson);
    testValue := JsonReadString(testJson, "key");
    AssertEquals(testValue, "expected_value");
    FreeJson(testJson);
end;
procedure TIntegrationTests.TestJsonFromStringIntegration;
begin
    testJson := JsonFromString("{\"name\":\"John\",\"age\":30,\"city\":\"New York\"}");
    AssertEquals(JsonReadString(testJson, "name"), "John");
    AssertEquals(JsonReadNumberAsInt(testJson, "age"), 30);
    AssertEquals(JsonReadString(testJson, "city"), "New York");
    FreeJson(testJson);
end;
procedure TIntegrationTests.TestJsonHasKeyIntegration;
begin
    testJson := CreateJson();
    JsonSetString(testJson, "key1", "value1");
    AssertTrue(JsonHasKey(testJson, "key1"));
    AssertFalse(JsonHasKey(testJson, "key2"));
    FreeJson(testJson);
end;
procedure TIntegrationTests.TestJsonReadArrayOfDoubleIntegration;
begin
    testJson := CreateJson();
    JsonSetArray(testJson, "numbers", [1.1, 2.2, 3.3]);
    JsonReadArray(testJson, "numbers", {:value_type=>"list", :value=>[]});
    AssertEquals({:value_type=>"array_access", :array_name=>"out_result", :index=>0}, 3);
    AssertEquals({:value_type=>"array_access", :array_name=>"out_result", :index=>1}, 2.2);
    FreeJson(testJson);
    FreeAllJson();
end;
procedure TIntegrationTests.TestJsonReadArrayOfJsonIntegration;
begin
    testJson := CreateJson();
    testJsonNested1 := CreateJson();
    testJsonNested2 := CreateJson();
    JsonSetString(testJsonNested1, "key1", "value1");
    JsonSetString(testJsonNested2, "key2", "value2");
    JsonSetArray(testJson, "array_key", {:value_type=>"vector", :value=>[{:value_type=>"variable", :variable_name=>"test_json_nested1"}, {:value_type=>"variable", :variable_name=>"test_json_nested2"}]});
    JsonReadArray(testJson, "array_key", {:value_type=>"vector", :variable_name=>[]});
    AssertEquals(outResult, 2);
    FreeJson(testJson);
    FreeJson(testJsonNested1);
    FreeJson(testJsonNested2);
    FreeAllJson();
end;
procedure TIntegrationTests.TestJsonReadArrayOfStringIntegration;
begin
    testJson := CreateJson();
    JsonSetArray(testJson, "test_array", ["item1", "item2", "item3"]);
    JsonReadArray(testJson, "test_array", outResult);
    AssertEquals(size, 3);
    AssertEquals(indexOfJson0, "item1");
    FreeJson(testJson);
end;
procedure TIntegrationTests.TestJsonReadArrayOfBoolIntegration;
begin
    testJson := CreateJson();
    JsonSetArray(testJson, "test_key", "[true, false, true]");
    JsonReadArray(testJson, "test_key", outResult);
    AssertEquals(size, 3);
    AssertEquals(indexOfJson0, 0);
    AssertNotEquals(indexOfJson1, 1);
    AssertEquals(indexOfJson2, 2);
    FreeJson(testJson);
end;
procedure TIntegrationTests.TestJsonReadBoolIntegration;
begin
    testJson := CreateJson();
    JsonSetBool(testJson, "test_key", true);
    AssertTrue(JsonReadBool(testJson, "test_key"));
    JsonSetBool(testJson, "test_key", false);
    AssertFalse(JsonReadBool(testJson, "test_key"));
    FreeJson(testJson);
end;
procedure TIntegrationTests.TestJsonReadNumberIntegration;
begin
    testJson := CreateJson();
    JsonSetNumber(testJson, "test_key", 42.5);
    testResult := JsonReadNumber(testJson, "test_key");
    AssertEquals(testResult, 42.5);
    FreeJson(testJson);
end;
procedure TIntegrationTests.TestJsonReadNumberAsDoubleIntegration;
begin
    testJson := CreateJson();
    JsonSetNumber(testJson, "test_key", 3.14);
    testResult := JsonReadNumberAsDouble(testJson, "test_key");
    AssertEquals(testResult, 3.14);
    FreeJson(testJson);
end;
procedure TIntegrationTests.TestJsonReadNumberAsIntIntegration;
begin
    testJson := CreateJson();
    JsonSetNumber(testJson, "test_key", 42);
    testResult := JsonReadNumberAsInt(testJson, "test_key");
    AssertEquals(testResult, 42);
    FreeJson(testJson);
end;
procedure TIntegrationTests.TestJsonReadObjectIntegration;
begin
    testJson := CreateJson();
    JsonSetObject(testJson, "nestedObject", CreateJson());
    readJson := JsonReadObject(testJson, "nestedObject");
    AssertNotNull(readJson);
    FreeJson(testJson);
    FreeJson(readJson);
end;
procedure TIntegrationTests.TestJsonReadStringIntegration;
begin
    testJson := CreateJson();
    JsonSetString(testJson, "test_key", "test_value");
    readValue := JsonReadString(testJson, "test_key");
    AssertEquals(readValue, "test_value");
    FreeJson(testJson);
end;
procedure TIntegrationTests.TestJsonSetArrayOfStringIntegration;
begin
    testJson := CreateJson();
    JsonSetArray(testJson, "test_key", ["value1", "value2", "value3"]);
    JsonReadArray(testJson, "test_key", {:value_type=>"list", :value=>[]});
    AssertEquals(testResult, 3);
    FreeJson(testJson);
end;
procedure TIntegrationTests.TestJsonSetArrayOfDoubleIntegration;
begin
    testJson := CreateJson();
    JsonSetArray(testJson, "numbers", [1.1, 2.2, 3.3]);
    JsonReadArray(testJson, "numbers", {:value_type=>"list", :value=>[]});
    AssertEquals(readNumbers, [1.1, 2.2, 3.3]);
    FreeJson(testJson);
end;
procedure TIntegrationTests.TestJsonSetArrayOfBoolIntegration;
begin
    testJson := CreateJson();
    JsonSetArray(testJson, "test_key", "[true, false, true]");
    JsonReadArray(testJson, "test_key", {:value_type=>"list", :value=>[]});
    AssertEquals(readArray, "[true, false, true]");
    FreeJson(testJson);
end;
procedure TIntegrationTests.TestJsonSetArrayOfJsonIntegration;
begin
    testJson := CreateJson();
    testJson1 := CreateJson();
    testJson2 := CreateJson();
    JsonSetString(testJson1, "key1", "value1");
    JsonSetString(testJson2, "key2", "value2");
    JsonSetArray(testJson, "array_key", [{:value_type=>"variable", :variable_name=>"test_json1"}, {:value_type=>"variable", :variable_name=>"test_json2"}]);
    AssertEquals(JsonReadString(JsonReadObject(testJson, 0), "key1"), "value1");
    AssertEquals(JsonReadString(JsonReadObject(readArray, 1), "key2"), "value2");
    FreeJson(testJson);
    FreeJson(testJson1);
    FreeJson(testJson2);
    FreeAllJson();
end;
procedure TIntegrationTests.TestJsonSetBoolIntegration;
begin
    testJson := CreateJson();
    JsonSetBool(testJson, "test_key", true);
    AssertTrue(JsonHasKey(testJson, "test_key"));
    AssertTrue(JsonReadBool(testJson, "test_key"));
    FreeJson(testJson);
end;
procedure TIntegrationTests.TestJsonSetNumberIntegerIntegration;
begin
    testJson := CreateJson();
    JsonSetNumber(testJson, "age", 30);
    AssertEquals(JsonReadNumberAsInt(testJson, "age"), 30);
    FreeJson(testJson);
end;
procedure TIntegrationTests.TestJsonSetNumberDoubleIntegration;
begin
    testJson := CreateJson();
    JsonSetNumber(testJson, "test_key", 3.14);
    AssertEquals(JsonReadNumberAsDouble(testJson, "test_key"), 3.14);
    FreeJson(testJson);
end;
procedure TIntegrationTests.TestJsonSetNumberFloatIntegration;
begin
    testJson := CreateJson();
    JsonSetNumber(testJson, "test_key", 3.14);
    AssertEquals(JsonReadNumber(testJson, "test_key"), 3.14);
    FreeJson(testJson);
end;
procedure TIntegrationTests.TestJsonSetObjectIntegration;
begin
    testJson := CreateJson();
    testNestedJson := CreateJson();
    JsonSetObject(testJson, "nested", testNestedJson);
    AssertTrue(JsonHasKey(testJson, "nested"));
    FreeJson(testJson);
    FreeJson(testNestedJson);
    FreeAllJson();
end;
procedure TIntegrationTests.TestJsonSetStringIntegration;
begin
    testJson := CreateJson();
    JsonSetString(testJson, "test_key", "test_value");
    AssertEquals(JsonReadString(testJson, "test_key"), "test_value");
    FreeJson(testJson);
end;
procedure TIntegrationTests.TestJsonToColorIntegration;
begin
    testJson := CreateJson();
    JsonSetString(testJson, "color", "#FF0000FF");
    testColor := JsonToColor(testJson);
    AssertEquals(ColorToString(testColor), "#FF0000FF");
    FreeJson(testJson);
end;
procedure TIntegrationTests.TestJsonToFileIntegration;
begin
    testJson := CreateJson();
    JsonSetString(testJson, "testKey", "testValue");
    JsonToFile(testJson, "test.json");
    loadedJson := JsonFromFile("test.json");
    AssertEquals(JsonReadString(loadedJson, "testKey"), "testValue");
    FreeJson(testJson);
    FreeJson(loadedJson);
end;
procedure TIntegrationTests.TestJsonToStringIntegration;
begin
    testJson := CreateJson();
    JsonSetString(testJson, "key", "value");
    testJsonString := JsonToString(testJson);
    AssertNotEquals(testJsonString, "");
    FreeJson(testJson);
end;
end;

procedure RegisterTests;
begin
TestFramework.RegisterTest(TIntegrationTests.Suite);
end;
