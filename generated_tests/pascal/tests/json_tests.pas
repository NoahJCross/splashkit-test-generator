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
    AssertEquals("John", JsonReadString(testJson, "name"));
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
    AssertEquals(0, count1AfterFree);
    AssertEquals(0, count2AfterFree);
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
    AssertEquals(2, keyCount);
    FreeJson(testJson);
end;
procedure TIntegrationTests.TestJsonFromColorIntegration;
begin
    testColor := ColorBrightGreen();
    testJson := JsonFromColor(testColor);
    AssertTrue(JsonHasKey(testJson, "color"));
    AssertEquals("#00ff00ff", JsonReadString(testJson, "color"));
    FreeJson(testJson);
    FreeAllJson();
end;
procedure TIntegrationTests.TestJsonFromFileIntegration;
begin
    testJson := JsonFromFile("test.json");
    AssertNotNull(testJson);
    testValue := JsonReadString(testJson, "key");
    AssertEquals("expected_value", testValue);
    FreeJson(testJson);
end;
procedure TIntegrationTests.TestJsonFromStringIntegration;
begin
    testJson := JsonFromString("{\"name\":\"John\",\"age\":30,\"city\":\"New York\"}");
    AssertEquals("John", JsonReadString(testJson, "name"));
    AssertEquals(30, JsonReadNumberAsInt(testJson, "age"));
    AssertEquals("New York", JsonReadString(testJson, "city"));
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
    JsonSetArray(testJson, "numbers", TArray<Double>.Create(1.1, 2.2, 3.3););
    outResult := TArray<Double>.Create();
    JsonReadArray(testJson, "numbers", outResult);
    AssertEquals(1.1, outResult[0]);
    AssertEquals(2.2, outResult[1]);
    FreeJson(testJson);
    FreeAllJson();
end;
procedure TIntegrationTests.TestJsonReadArrayOfJsonIntegration;
begin
    testJson := CreateJson();
    testJson1 := CreateJson();
    testJson2 := CreateJson();
    JsonSetString(testJsonNested1, "key1", "value1");
    JsonSetString(testJsonNested2, "key2", "value2");
    testJsonArray := TArray<Json>.Create(testJson1, testJson2);
    JsonSetArray(testJson, "array_key", testJsonArray);
    outResult := TArray<Json>.Create();
    JsonReadArray(testJson, "array_key", outResult);
    AssertEquals(Size(outResult), 2);
    FreeJson(testJson);
    FreeJson(testJsonNested1);
    FreeJson(testJsonNested2);
    FreeAllJson();
end;
procedure TIntegrationTests.TestJsonReadArrayOfStringIntegration;
begin
    testJson := CreateJson();
    JsonSetArray(testJson, "test_array", ["item1", "item2", "item3"]);
    outResult := TArray<String>.Create();
    JsonReadArray(testJson, "test_array", outResult);
    AssertEquals(3, Size(outResult));
    AssertEquals("item1", outResult[0]);
    FreeJson(testJson);
end;
procedure TIntegrationTests.TestJsonReadArrayOfBoolIntegration;
begin
    testJson := CreateJson();
    JsonSetArray(testJson, "test_key", TArray<Boolean>.Create(true, false, true););
    outResult := TArray<Boolean>.Create();
    JsonReadArray(testJson, "test_key", outResult);
    AssertEquals(Size(outResult), 3);
    AssertTrue(outResult[0]);
    AssertFalse(outResult[1]);
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
    AssertEquals(42.5, testResult);
    FreeJson(testJson);
end;
procedure TIntegrationTests.TestJsonReadNumberAsDoubleIntegration;
begin
    testJson := CreateJson();
    JsonSetNumber(testJson, "test_key", 3.14);
    testResult := JsonReadNumberAsDouble(testJson, "test_key");
    AssertEquals(3.14, testResult);
    FreeJson(testJson);
end;
procedure TIntegrationTests.TestJsonReadNumberAsIntIntegration;
begin
    testJson := CreateJson();
    JsonSetNumber(testJson, "test_key", 42);
    testResult := JsonReadNumberAsInt(testJson, "test_key");
    AssertEquals(42, testResult);
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
    AssertEquals("test_value", readValue);
    FreeJson(testJson);
end;
procedure TIntegrationTests.TestJsonSetArrayOfStringIntegration;
begin
    testJson := CreateJson();
    JsonSetArray(testJson, "test_key", TArray<String>.Create("value1", "value2", "value3"););
    outResult := TArray<String>.Create();
    JsonReadArray(testJson, "test_key", outResult);
    AssertEquals(["value1", "value2", "value3"], outResult);
    FreeJson(testJson);
end;
procedure TIntegrationTests.TestJsonSetArrayOfDoubleIntegration;
begin
    testJson := CreateJson();
    JsonSetArray(testJson, "numbers", TArray<Double>.Create(1.1, 2.2, 3.3););
    outResult := TArray<Double>.Create();
    JsonReadArray(testJson, "numbers", outResult);
    AssertEquals([1.1, 2.2, 3.3], outResult);
    FreeJson(testJson);
end;
procedure TIntegrationTests.TestJsonSetArrayOfBoolIntegration;
begin
    testJson := CreateJson();
    JsonSetArray(testJson, "test_key", [true, false, true]);
    outResult := TArray<Boolean>.Create();
    JsonReadArray(testJson, "test_key", outResult);
    AssertEquals([true, false, true], outResult);
    FreeJson(testJson);
end;
procedure TIntegrationTests.TestJsonSetArrayOfJsonIntegration;
begin
    testJson := CreateJson();
    testJson1 := CreateJson();
    testJson2 := CreateJson();
    JsonSetString(testJson1, "key1", "value1");
    JsonSetString(testJson2, "key2", "value2");
    testJsonArray := TArray<Json>.Create(testJson1, testJson2);
    JsonSetArray(testJson, "array_key", testJsonArray);
    outResult := TArray<Json>.Create();
    JsonReadArray(testJson, "array_key", outResult);
    AssertEquals("value1", JsonReadString(outResult[0], "key1"));
    AssertEquals("value2", JsonReadString(outResult[1], "key2"));
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
    AssertEquals(30, JsonReadNumberAsInt(testJson, "age"));
    FreeJson(testJson);
end;
procedure TIntegrationTests.TestJsonSetNumberDoubleIntegration;
begin
    testJson := CreateJson();
    JsonSetNumber(testJson, "test_key", 3.14);
    AssertEquals(3.14, JsonReadNumberAsDouble(testJson, "test_key"));
    FreeJson(testJson);
end;
procedure TIntegrationTests.TestJsonSetNumberFloatIntegration;
begin
    testJson := CreateJson();
    JsonSetNumber(testJson, "test_key", 3.14);
    AssertEquals(3.14, JsonReadNumber(testJson, "test_key"));
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
    AssertEquals("test_value", JsonReadString(testJson, "test_key"));
    FreeJson(testJson);
end;
procedure TIntegrationTests.TestJsonToColorIntegration;
begin
    testJson := CreateJson();
    JsonSetString(testJson, "color", "#FF0000FF");
    testColor := JsonToColor(testJson);
    AssertEquals("#FF0000FF", ColorToString(testColor));
    FreeJson(testJson);
end;
procedure TIntegrationTests.TestJsonToFileIntegration;
begin
    testJson := CreateJson();
    JsonSetString(testJson, "testKey", "testValue");
    JsonToFile(testJson, "test.json");
    loadedJson := JsonFromFile("test.json");
    AssertEquals("testValue", JsonReadString(loadedJson, "testKey"));
    FreeJson(testJson);
    FreeJson(loadedJson);
end;
procedure TIntegrationTests.TestJsonToStringIntegration;
begin
    testJson := CreateJson();
    JsonSetString(testJson, "key", "value");
    testJsonString := JsonToString(testJson);
    AssertNotEquals("", testJsonString);
    FreeJson(testJson);
end;
end;

procedure RegisterTests;
begin
TestFramework.RegisterTest(TIntegrationTests.Suite);
end;
