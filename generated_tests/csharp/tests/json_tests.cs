using Xunit;
using static SplashKitSDK.SplashKit;

namespace SplashKitTests
{
    public class TestJson
    {
        [Fact]
        public void TestCreateJsonIntegration()
        {
            var testJson = CreateJson();
            Assert.NotNull(testJson);
            FreeJson(testJson);
        }
        [Fact]
        public void TestCreateJsonFromStringIntegration()
        {
            var testJson = CreateJson("{\"name\":\"John\",\"age\":30,\"city\":\"New York\"}");
            Assert.True(JsonHasKey(testJson, "name"));
            Assert.Equal("John", JsonReadString(testJson, "name"));
            FreeJson(testJson);
        }
        [Fact]
        public void TestFreeAllJsonIntegration()
        {
            var testJson1 = CreateJson();
            var testJson2 = CreateJson();
            var count1 = JsonCountKeys(testJson1);
            JsonSetString(testJson1, "key", "value");
            JsonSetString(testJson2, "key", "value");
            var count2 = JsonCountKeys(testJson2);
            Assert.True(count1 > 0);
            Assert.True(count2 > 0);
            FreeAllJson();
            var count1AfterFree = JsonCountKeys(testJson1);
            var count2AfterFree = JsonCountKeys(testJson2);
            Assert.Equal(0, count1AfterFree);
            Assert.Equal(0, count2AfterFree);
        }
        [Fact]
        public void TestFreeJsonIntegration()
        {
            var testJson = CreateJson();
            JsonSetString(testJson, "key", "value");
            FreeJson(testJson);
            Assert.False(JsonHasKey(testJson, "key"));
        }
        [Fact]
        public void TestJsonCountKeysIntegration()
        {
            var testJson = CreateJson();
            JsonSetString(testJson, "key1", "value1");
            JsonSetNumber(testJson, "key2", 42);
            var keyCount = JsonCountKeys(testJson);
            Assert.Equal(2, keyCount);
            FreeJson(testJson);
        }
        [Fact]
        public void TestJsonFromColorIntegration()
        {
            var testColor = ColorBrightGreen();
            var testJson = JsonFromColor(testColor);
            Assert.True(JsonHasKey(testJson, "color"));
            Assert.Equal("#00ff00ff", JsonReadString(testJson, "color"));
            FreeJson(testJson);
            FreeAllJson();
        }
        [Fact]
        public void TestJsonFromFileIntegration()
        {
            var testJson = JsonFromFile("person.json");
            Assert.NotNull(testJson);
            var testValue = JsonReadString(testJson, "firstName");
            Assert.Equal("John", testValue);
            FreeJson(testJson);
        }
        [Fact]
        public void TestJsonFromStringIntegration()
        {
            var testJson = JsonFromString("{\"name\":\"John\",\"age\":30,\"city\":\"New York\"}");
            Assert.Equal("John", JsonReadString(testJson, "name"));
            Assert.Equal(30, JsonReadNumberAsInt(testJson, "age"));
            Assert.Equal("New York", JsonReadString(testJson, "city"));
            FreeJson(testJson);
        }
        [Fact]
        public void TestJsonHasKeyIntegration()
        {
            var testJson = CreateJson();
            JsonSetString(testJson, "key1", "value1");
            Assert.True(JsonHasKey(testJson, "key1"));
            Assert.False(JsonHasKey(testJson, "key2"));
            FreeJson(testJson);
        }
        [Fact]
        public void TestJsonReadArrayOfDoubleIntegration()
        {
            var testJson = CreateJson();
            JsonSetArray(testJson, "numbers", new List<double> { 1.1, 2.2, 3.3 });
            var outResult = new List<double> {  };
            JsonReadArray(testJson, "numbers", ref outResult);
            Assert.Equal(1.1, outResult[0]);
            Assert.Equal(2.2, outResult[1]);
            FreeJson(testJson);
            FreeAllJson();
        }
        [Fact]
        public void TestJsonReadArrayOfJsonIntegration()
        {
            var testJson = CreateJson();
            var testJson1 = CreateJson();
            var testJson2 = CreateJson();
            JsonSetString(testJson1, "key1", "value1");
            JsonSetString(testJson2, "key2", "value2");
            var testJsonArray = new List<Json> { testJson1, testJson2 };
            JsonSetArray(testJson, "array_key", testJsonArray);
            var outResult = new List<Json> {  };
            JsonReadArray(testJson, "array_key", ref outResult);
            Assert.Equal(2, outResult.Count);
            FreeJson(testJson);
            FreeJson(testJson1);
            FreeJson(testJson2);
            FreeAllJson();
        }
        [Fact]
        public void TestJsonReadArrayOfStringIntegration()
        {
            var testJson = CreateJson();
            JsonSetArray(testJson, "test_array", new List<string> { "item1", "item2", "item3" });
            var outResult = new List<string> {  };
            JsonReadArray(testJson, "test_array", ref outResult);
            Assert.Equal(3, outResult.Count);
            Assert.Equal("item1", outResult[0]);
            FreeJson(testJson);
        }
        [Fact]
        public void TestJsonReadArrayOfBoolIntegration()
        {
            var testJson = CreateJson();
            JsonSetArray(testJson, "test_key", new List<bool> { true, false, true });
            var outResult = new List<bool> {  };
            JsonReadArray(testJson, "test_key", ref outResult);
            Assert.Equal(3, outResult.Count);
            Assert.True(outResult[0]);
            Assert.False(outResult[1]);
            FreeJson(testJson);
        }
        [Fact]
        public void TestJsonReadBoolIntegration()
        {
            var testJson = CreateJson();
            JsonSetBool(testJson, "test_key", true);
            Assert.True(JsonReadBool(testJson, "test_key"));
            JsonSetBool(testJson, "test_key", false);
            Assert.False(JsonReadBool(testJson, "test_key"));
            FreeJson(testJson);
        }
        [Fact]
        public void TestJsonReadNumberIntegration()
        {
            var testJson = CreateJson();
            JsonSetNumber(testJson, "test_key", 42.5f);
            var testResult = JsonReadNumber(testJson, "test_key");
            Assert.Equal(42.5, testResult);
            FreeJson(testJson);
        }
        [Fact]
        public void TestJsonReadNumberAsDoubleIntegration()
        {
            var testJson = CreateJson();
            JsonSetNumber(testJson, "test_key", 3.14);
            var testResult = JsonReadNumberAsDouble(testJson, "test_key");
            Assert.Equal(3.14, testResult);
            FreeJson(testJson);
        }
        [Fact]
        public void TestJsonReadNumberAsIntIntegration()
        {
            var testJson = CreateJson();
            JsonSetNumber(testJson, "test_key", 42);
            var testResult = JsonReadNumberAsInt(testJson, "test_key");
            Assert.Equal(42, testResult);
            FreeJson(testJson);
        }
        [Fact]
        public void TestJsonReadObjectIntegration()
        {
            var testJson = CreateJson();
            JsonSetObject(testJson, "nestedObject", CreateJson());
            var readJson = JsonReadObject(testJson, "nestedObject");
            Assert.NotNull(readJson);
            FreeJson(testJson);
            FreeJson(readJson);
        }
        [Fact]
        public void TestJsonReadStringIntegration()
        {
            var testJson = CreateJson();
            JsonSetString(testJson, "test_key", "test_value");
            var readValue = JsonReadString(testJson, "test_key");
            Assert.Equal("test_value", readValue);
            FreeJson(testJson);
        }
        [Fact]
        public void TestJsonSetArrayOfStringIntegration()
        {
            var testJson = CreateJson();
            JsonSetArray(testJson, "test_key", new List<string> { "value1", "value2", "value3" });
            var outResult = new List<string> {  };
            JsonReadArray(testJson, "test_key", ref outResult);
            Assert.Equal(new List<string> { "value1", "value2", "value3" }, outResult);
            FreeJson(testJson);
        }
        [Fact]
        public void TestJsonSetArrayOfDoubleIntegration()
        {
            var testJson = CreateJson();
            JsonSetArray(testJson, "numbers", new List<double> { 1.1, 2.2, 3.3 });
            var outResult = new List<double> {  };
            JsonReadArray(testJson, "numbers", ref outResult);
            Assert.Equal(new List<double> { 1.1, 2.2, 3.3 }, outResult);
            FreeJson(testJson);
        }
        [Fact]
        public void TestJsonSetArrayOfBoolIntegration()
        {
            var testJson = CreateJson();
            JsonSetArray(testJson, "test_key", new List<bool> { true, false });
            var outResult = new List<bool> {  };
            JsonReadArray(testJson, "test_key", ref outResult);
            Assert.Equal(new List<bool> { true, false }, outResult);
            FreeJson(testJson);
        }
        [Fact]
        public void TestJsonSetArrayOfJsonIntegration()
        {
            var testJson = CreateJson();
            var testJson1 = CreateJson();
            var testJson2 = CreateJson();
            JsonSetString(testJson1, "key1", "value1");
            JsonSetString(testJson2, "key2", "value2");
            var testJsonArray = new List<Json> { testJson1, testJson2 };
            JsonSetArray(testJson, "array_key", testJsonArray);
            var outResult = new List<Json> {  };
            JsonReadArray(testJson, "array_key", ref outResult);
            Assert.Equal("value1", JsonReadString(outResult[0], "key1"));
            Assert.Equal("value2", JsonReadString(outResult[1], "key2"));
            FreeAllJson();
        }
        [Fact]
        public void TestJsonSetBoolIntegration()
        {
            var testJson = CreateJson();
            JsonSetBool(testJson, "test_key", true);
            Assert.True(JsonHasKey(testJson, "test_key"));
            Assert.True(JsonReadBool(testJson, "test_key"));
            FreeJson(testJson);
        }
        [Fact]
        public void TestJsonSetNumberIntegerIntegration()
        {
            var testJson = CreateJson();
            JsonSetNumber(testJson, "age", 30);
            Assert.Equal(30, JsonReadNumberAsInt(testJson, "age"));
            FreeJson(testJson);
        }
        [Fact]
        public void TestJsonSetNumberDoubleIntegration()
        {
            var testJson = CreateJson();
            JsonSetNumber(testJson, "test_key", 3.14);
            Assert.Equal(3.14, JsonReadNumberAsDouble(testJson, "test_key"));
            FreeJson(testJson);
        }
        [Fact]
        public void TestJsonSetNumberFloatIntegration()
        {
            var testJson = CreateJson();
            JsonSetNumber(testJson, "test_key", 3.14f);
            Assert.Equal(3.140000104904175, JsonReadNumber(testJson, "test_key"));
            FreeJson(testJson);
        }
        [Fact]
        public void TestJsonSetObjectIntegration()
        {
            var testJson = CreateJson();
            var testNestedJson = CreateJson();
            JsonSetObject(testJson, "nested", testNestedJson);
            Assert.True(JsonHasKey(testJson, "nested"));
            FreeJson(testJson);
            FreeJson(testNestedJson);
            FreeAllJson();
        }
        [Fact]
        public void TestJsonSetStringIntegration()
        {
            var testJson = CreateJson();
            JsonSetString(testJson, "test_key", "test_value");
            Assert.Equal("test_value", JsonReadString(testJson, "test_key"));
            FreeJson(testJson);
        }
        [Fact]
        public void TestJsonToColorIntegration()
        {
            var testJson = CreateJson();
            JsonSetString(testJson, "color", "#ff0000ff");
            var testColor = JsonToColor(testJson);
            Assert.Equal("#ff0000ff", ColorToString(testColor));
            FreeJson(testJson);
        }
        [Fact]
        public void TestJsonToFileIntegration()
        {
            var testJson = CreateJson();
            JsonSetString(testJson, "testKey", "testValue");
            JsonToFile(testJson, "test.json");
            var loadedJson = JsonFromFile("test.json");
            Assert.Equal("testValue", JsonReadString(loadedJson, "testKey"));
            FreeJson(testJson);
            FreeJson(loadedJson);
        }
        [Fact]
        public void TestJsonToStringIntegration()
        {
            var testJson = CreateJson();
            JsonSetString(testJson, "key", "value");
            var testJsonString = JsonToString(testJson);
            Assert.NotEqual("", testJsonString);
            FreeJson(testJson);
        }
    }
}
