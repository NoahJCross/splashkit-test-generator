uses SplashKit, TestFramework, ../Helpers;
type
    TTestJson = class(TTestCase)
    protected
        procedure Setup; override;
    end;
begin
    inherited;
    SetResourcesPath('/mnt/c/Users/Noahc/Documents/aYear_2_semester_2/TeamProject/GitHubRepo/splashkit_test_generator/resources');
end;
procedure TestCreateJsonIntegration;
begin
    testJson := CreateJson();
    CleanupJson := TJsonCleanup.Create;
    AssertNotNull(testJson);
end;
procedure TestCreateJsonFromStringIntegration;
begin
    testJson := CreateJson('{\"name\":\"John\",\"age\":30,\"city\":\"New York\"}');
    CleanupJson := TJsonCleanup.Create;
    AssertTrue(JsonHasKey(testJson, 'name'));
    AssertEquals('John', JsonReadString(testJson, 'name'));
end;
procedure TestFreeAllJsonIntegration;
begin
    testJson1 := CreateJson();
    CleanupJson := TJsonCleanup.Create;
    testJson2 := CreateJson();
    JsonSetString(testJson1, 'key', 'value');
    JsonSetString(testJson2, 'key', 'value');
    count1 := JsonCountKeys(testJson1);
    count2 := JsonCountKeys(testJson2);
    AssertEquals(1, count1);
    AssertEquals(1, count2);
    FreeAllJson();
    count1AfterFree := JsonCountKeys(testJson1);
    count2AfterFree := JsonCountKeys(testJson2);
    AssertEquals(0, count1AfterFree);
    AssertEquals(0, count2AfterFree);
end;
procedure TestFreeJsonIntegration;
begin
    testJson := CreateJson();
    CleanupJson := TJsonCleanup.Create;
    JsonSetString(testJson, 'key', 'value');
    FreeJson(testJson);
    AssertFalse(JsonHasKey(testJson, 'key'));
end;
procedure TestJsonCountKeysIntegration;
begin
    testJson := CreateJson();
    CleanupJson := TJsonCleanup.Create;
    JsonSetString(testJson, 'key1', 'value1');
    JsonSetNumber(testJson, 'key2', 42);
    keyCount := JsonCountKeys(testJson);
    AssertEquals(2, keyCount);
end;
procedure TestJsonFromColorIntegration;
begin
    testColor := ColorBrightGreen();
    testJson := JsonFromColor(testColor);
    AssertTrue(JsonHasKey(testJson, 'color'));
    AssertEquals('#00ff00ff', JsonReadString(testJson, 'color'));
end;
procedure TestJsonFromFileIntegration;
begin
    testJson := JsonFromFile('person.json');
    AssertNotNull(testJson);
    testValue := JsonReadString(testJson, 'firstName');
    AssertEquals('John', testValue);
end;
procedure TestJsonFromStringIntegration;
begin
    testJson := JsonFromString('{\"name\":\"John\",\"age\":30,\"city\":\"New York\"}');
    AssertEquals('John', JsonReadString(testJson, 'name'));
    AssertEquals(30, JsonReadNumberAsInt(testJson, 'age'));
    AssertEquals('New York', JsonReadString(testJson, 'city'));
end;
procedure TestJsonHasKeyIntegration;
begin
    testJson := CreateJson();
    CleanupJson := TJsonCleanup.Create;
    JsonSetString(testJson, 'key1', 'value1');
    AssertTrue(JsonHasKey(testJson, 'key1'));
    AssertFalse(JsonHasKey(testJson, 'key2'));
end;
procedure TestJsonReadArrayOfDoubleIntegration;
begin
    testJson := CreateJson();
    CleanupJson := TJsonCleanup.Create;
    JsonSetArray(testJson, 'numbers', TArray<Double>.Create(1.1, 2.2, 3.3));
    outResult := TArray<Double>.Create();
    JsonReadArray(testJson, 'numbers', @outResult);
    AssertEquals(1.1, outResult[0]);
    AssertEquals(2.2, outResult[1]);
end;
procedure TestJsonReadArrayOfJsonIntegration;
begin
    testJson := CreateJson();
    CleanupJson := TJsonCleanup.Create;
    testJson1 := CreateJson();
    testJson2 := CreateJson();
    JsonSetString(testJson1, 'key1', 'value1');
    JsonSetString(testJson2, 'key2', 'value2');
    testJsonArray := TArray<Json>.Create(testJson1, testJson2);
    JsonSetArray(testJson, 'array_key', testJsonArray);
    outResult := TArray<Json>.Create();
    JsonReadArray(testJson, 'array_key', @outResult);
    AssertEquals(2, Length(outResult));
end;
procedure TestJsonReadArrayOfStringIntegration;
begin
    testJson := CreateJson();
    CleanupJson := TJsonCleanup.Create;
    JsonSetArray(testJson, 'test_array', TArray<String>.Create('item1', 'item2', 'item3'));
    outResult := TArray<String>.Create();
    JsonReadArray(testJson, 'test_array', @outResult);
    AssertEquals(3, Length(outResult));
    AssertEquals('item1', outResult[0]);
end;
procedure TestJsonReadArrayOfBoolIntegration;
begin
    testJson := CreateJson();
    CleanupJson := TJsonCleanup.Create;
    JsonSetArray(testJson, 'test_key', TArray<Boolean>.Create(true, false, true));
    outResult := TArray<Boolean>.Create();
    JsonReadArray(testJson, 'test_key', @outResult);
    AssertEquals(3, Length(outResult));
    AssertTrue(outResult[0]);
    AssertFalse(outResult[1]);
end;
procedure TestJsonReadBoolIntegration;
begin
    testJson := CreateJson();
    CleanupJson := TJsonCleanup.Create;
    JsonSetBool(testJson, 'test_key', true);
    AssertTrue(JsonReadBool(testJson, 'test_key'));
    JsonSetBool(testJson, 'test_key', false);
    AssertFalse(JsonReadBool(testJson, 'test_key'));
end;
procedure TestJsonReadNumberIntegration;
begin
    testJson := CreateJson();
    CleanupJson := TJsonCleanup.Create;
    JsonSetNumber(testJson, 'test_key', 42.5);
    testResult := JsonReadNumber(testJson, 'test_key');
    AssertEquals(42.5, testResult);
end;
procedure TestJsonReadNumberAsDoubleIntegration;
begin
    testJson := CreateJson();
    CleanupJson := TJsonCleanup.Create;
    JsonSetNumber(testJson, 'test_key', 3.14);
    testResult := JsonReadNumberAsDouble(testJson, 'test_key');
    AssertEquals(3.14, testResult);
end;
procedure TestJsonReadNumberAsIntIntegration;
begin
    testJson := CreateJson();
    CleanupJson := TJsonCleanup.Create;
    JsonSetNumber(testJson, 'test_key', 42);
    testResult := JsonReadNumberAsInt(testJson, 'test_key');
    AssertEquals(42, testResult);
end;
procedure TestJsonReadObjectIntegration;
begin
    testJson := CreateJson();
    CleanupJson := TJsonCleanup.Create;
    nestedJson := CreateJson();
    JsonSetString(nestedJson, 'test', 'value');
    JsonSetObject(testJson, 'nestedObject', nestedJson);
    readJson := JsonReadObject(testJson, 'nestedObject');
    AssertNotNull(readJson);
end;
procedure TestJsonReadStringIntegration;
begin
    testJson := CreateJson();
    CleanupJson := TJsonCleanup.Create;
    JsonSetString(testJson, 'test_key', 'test_value');
    readValue := JsonReadString(testJson, 'test_key');
    AssertEquals('test_value', readValue);
end;
procedure TestJsonSetArrayOfStringIntegration;
begin
    testJson := CreateJson();
    CleanupJson := TJsonCleanup.Create;
    JsonSetArray(testJson, 'test_key', TArray<String>.Create('value1', 'value2', 'value3'));
    outResult := TArray<String>.Create();
    JsonReadArray(testJson, 'test_key', @outResult);
    AssertEquals(TArray<String>.Create('value1', 'value2', 'value3'), outResult);
end;
procedure TestJsonSetArrayOfDoubleIntegration;
begin
    testJson := CreateJson();
    CleanupJson := TJsonCleanup.Create;
    JsonSetArray(testJson, 'numbers', TArray<Double>.Create(1.1, 2.2, 3.3));
    outResult := TArray<Double>.Create();
    JsonReadArray(testJson, 'numbers', @outResult);
    AssertEquals(TArray<Double>.Create(1.1, 2.2, 3.3), outResult);
end;
procedure TestJsonSetArrayOfBoolIntegration;
begin
    testJson := CreateJson();
    CleanupJson := TJsonCleanup.Create;
    JsonSetArray(testJson, 'test_key', TArray<Boolean>.Create(true, false));
    outResult := TArray<Boolean>.Create();
    JsonReadArray(testJson, 'test_key', @outResult);
    AssertEquals(TArray<Boolean>.Create(true, false), outResult);
end;
procedure TestJsonSetArrayOfJsonIntegration;
begin
    testJson := CreateJson();
    CleanupJson := TJsonCleanup.Create;
    testJson1 := CreateJson();
    testJson2 := CreateJson();
    JsonSetString(testJson1, 'key1', 'value1');
    JsonSetString(testJson2, 'key2', 'value2');
    testJsonArray := TArray<Json>.Create(testJson1, testJson2);
    JsonSetArray(testJson, 'array_key', testJsonArray);
    outResult := TArray<Json>.Create();
    JsonReadArray(testJson, 'array_key', @outResult);
    AssertEquals('value1', JsonReadString(outResult[0], 'key1'));
    AssertEquals('value2', JsonReadString(outResult[1], 'key2'));
end;
procedure TestJsonSetBoolIntegration;
begin
    testJson := CreateJson();
    CleanupJson := TJsonCleanup.Create;
    JsonSetBool(testJson, 'test_key', true);
    AssertTrue(JsonHasKey(testJson, 'test_key'));
    AssertTrue(JsonReadBool(testJson, 'test_key'));
end;
procedure TestJsonSetNumberIntegerIntegration;
begin
    testJson := CreateJson();
    CleanupJson := TJsonCleanup.Create;
    JsonSetNumber(testJson, 'age', 30);
    AssertEquals(30, JsonReadNumberAsInt(testJson, 'age'));
end;
procedure TestJsonSetNumberDoubleIntegration;
begin
    testJson := CreateJson();
    CleanupJson := TJsonCleanup.Create;
    JsonSetNumber(testJson, 'test_key', 3.14);
    AssertEquals(3.14, JsonReadNumberAsDouble(testJson, 'test_key'));
end;
procedure TestJsonSetNumberFloatIntegration;
begin
    testJson := CreateJson();
    CleanupJson := TJsonCleanup.Create;
    JsonSetNumber(testJson, 'test_key', 3.14);
    AssertEquals(3.140000104904175, JsonReadNumber(testJson, 'test_key'));
end;
procedure TestJsonSetObjectIntegration;
begin
    testJson := CreateJson();
    CleanupJson := TJsonCleanup.Create;
    testNestedJson := CreateJson();
    JsonSetObject(testJson, 'nested', testNestedJson);
    AssertTrue(JsonHasKey(testJson, 'nested'));
end;
procedure TestJsonSetStringIntegration;
begin
    testJson := CreateJson();
    CleanupJson := TJsonCleanup.Create;
    JsonSetString(testJson, 'test_key', 'test_value');
    AssertEquals('test_value', JsonReadString(testJson, 'test_key'));
end;
procedure TestJsonToColorIntegration;
begin
    testJson := CreateJson();
    CleanupJson := TJsonCleanup.Create;
    JsonSetString(testJson, 'color', '#ff0000ff');
    testColor := JsonToColor(testJson);
    AssertEquals('#ff0000ff', ColorToString(testColor));
end;
procedure TestJsonToFileIntegration;
begin
    testJson := CreateJson();
    CleanupJson := TJsonCleanup.Create;
    JsonSetString(testJson, 'testKey', 'testValue');
    JsonToFile(testJson, 'test.json');
    loadedJson := JsonFromFile('test.json');
    AssertEquals('testValue', JsonReadString(loadedJson, 'testKey'));
end;
procedure TestJsonToStringIntegration;
begin
    testJson := CreateJson();
    CleanupJson := TJsonCleanup.Create;
    JsonSetString(testJson, 'key', 'value');
    testJsonString := JsonToString(testJson);
    AssertNotEquals('', testJsonString);
end;
end;

procedure RegisterTests;
begin
    #<Proc:0x00007faa116e2450 /mnt/c/Users/Noahc/Documents/aYear_2_semester_2/TeamProject/GitHubRepo/splashkit_test_generator/test_generator/config/languages/pascal_config.rb:138 (lambda)>
end;
