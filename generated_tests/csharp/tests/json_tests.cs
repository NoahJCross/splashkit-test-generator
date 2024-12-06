using Xunit;
using static SplashKitSDK.SplashKit;

namespace SplashKitTests
{
    public class IntegrationTests
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
            var testJson = JsonFromFile("test.json");
            Assert.NotNull(testJson);
            var testValue = JsonReadString(testJson, "key");
            Assert.Equal("expected_value", testValue);
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
            JsonSetArray(testJson, "numbers", [1.1, 2.2, 3.3]);
            JsonReadArray(testJson, "numbers", {:value_type=>"list", :value=>[]});
            Assert.Equal(3, {:value_type=>"array_access", :array_name=>"out_result", :index=>0});
            Assert.Equal(2.2, {:value_type=>"array_access", :array_name=>"out_result", :index=>1});
            FreeJson(testJson);
            FreeAllJson();
        }
        [Fact]
        public void TestJsonReadArrayOfJsonIntegration()
        {
            var testJson = CreateJson();
            var testJsonNested1 = CreateJson();
            var testJsonNested2 = CreateJson();
            JsonSetString(testJsonNested1, "key1", "value1");
            JsonSetString(testJsonNested2, "key2", "value2");
            JsonSetArray(testJson, "array_key", {:value_type=>"vector", :value=>[{:value_type=>"variable", :variable_name=>"test_json_nested1"}, {:value_type=>"variable", :variable_name=>"test_json_nested2"}]});
            JsonReadArray(testJson, "array_key", {:value_type=>"vector", :variable_name=>[]});
            Assert.Equal(2, outResult);
            FreeJson(testJson);
            FreeJson(testJsonNested1);
            FreeJson(testJsonNested2);
            FreeAllJson();
        }
        [Fact]
        public void TestJsonReadArrayOfStringIntegration()
        {
            var testJson = CreateJson();
            JsonSetArray(testJson, "test_array", ["item1", "item2", "item3"]);
            JsonReadArray(testJson, "test_array", outResult);
            Assert.Equal(3, size);
            Assert.Equal("item1", indexOfJson0);
            FreeJson(testJson);
        }
        [Fact]
        public void TestJsonReadArrayOfBoolIntegration()
        {
            var testJson = CreateJson();
            JsonSetArray(testJson, "test_key", "[true, false, true]");
            JsonReadArray(testJson, "test_key", outResult);
            Assert.Equal(3, size);
            Assert.Equal(0, indexOfJson0);
            Assert.NotEqual(1, indexOfJson1);
            Assert.Equal(2, indexOfJson2);
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
            JsonSetNumber(testJson, "test_key", 42.5);
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
            JsonSetArray(testJson, "test_key", ["value1", "value2", "value3"]);
            JsonReadArray(testJson, "test_key", {:value_type=>"list", :value=>[]});
            Assert.Equal(3, testResult);
            FreeJson(testJson);
        }
        [Fact]
        public void TestJsonSetArrayOfDoubleIntegration()
        {
            var testJson = CreateJson();
            JsonSetArray(testJson, "numbers", [1.1, 2.2, 3.3]);
            JsonReadArray(testJson, "numbers", {:value_type=>"list", :value=>[]});
            Assert.Equal([1.1, 2.2, 3.3], readNumbers);
            FreeJson(testJson);
        }
        [Fact]
        public void TestJsonSetArrayOfBoolIntegration()
        {
            var testJson = CreateJson();
            JsonSetArray(testJson, "test_key", "[true, false, true]");
            JsonReadArray(testJson, "test_key", {:value_type=>"list", :value=>[]});
            Assert.Equal("[true, false, true]", readArray);
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
            JsonSetArray(testJson, "array_key", [{:value_type=>"variable", :variable_name=>"test_json1"}, {:value_type=>"variable", :variable_name=>"test_json2"}]);
            Assert.Equal("value1", JsonReadString(JsonReadObject(testJson, 0), "key1"));
            Assert.Equal("value2", JsonReadString(JsonReadObject(readArray, 1), "key2"));
            FreeJson(testJson);
            FreeJson(testJson1);
            FreeJson(testJson2);
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
            JsonSetNumber(testJson, "test_key", 3.14);
            Assert.Equal(3.14, JsonReadNumber(testJson, "test_key"));
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
            JsonSetString(testJson, "color", "#FF0000FF");
            var testColor = JsonToColor(testJson);
            Assert.Equal("#FF0000FF", ColorToString(testColor));
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
