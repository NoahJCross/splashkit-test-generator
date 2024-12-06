using Xunit;
using static SplashKitSDK.SplashKit;

namespace SplashKitTests
{
    public class IntegrationTests
    {
        [Fact]
        public void TestContainsIntegration()
        {
            var testResult = Contains("SplashKit is awesome", "awesome");
            Assert.True(testResult);
            var testResult = Contains("SplashKit is awesome", "unreal");
            Assert.False(testResult);
        }
        [Fact]
        public void TestConvertToDoubleIntegration()
        {
            var testResult = ConvertToDouble("123.456");
            Assert.Equal(123.456, testResult);
            var testResult = ConvertToDouble("-123.456");
            Assert.Equal(-123.456, testResult);
            var testResult = ConvertToDouble("invalid");
            Assert.Null(testResult);
        }
        [Fact]
        public void TestConvertToIntegerIntegration()
        {
            var testResult = ConvertToInteger("123");
            Assert.Equal(123, testResult);
            var testResult = ConvertToInteger("-456");
            Assert.Equal(-456, testResult);
            var testResult = ConvertToInteger("123.456");
            Assert.Equal(123, testResult);
            var testResult = ConvertToInteger("abc");
            Assert.Throws<Exception>(() => { ConvertToInteger("abc") });
        }
        [Fact]
        public void TestIndexOfIntegration()
        {
            var testResult = IndexOf("splashkit library", "library");
            Assert.Equal(10, testResult);
            var testResult = IndexOf("splashkit library", "unreal");
            Assert.Equal(-1, testResult);
        }
        [Fact]
        public void TestIsDoubleIntegration()
        {
            var testResult = IsDouble("123.456");
            Assert.True(testResult);
            var testResult = IsDouble("123");
            Assert.True(testResult);
            var testResult = IsDouble("-123.456");
            Assert.True(testResult);
            var testResult = IsDouble("SplashKit");
            Assert.False(testResult);
            var testResult = IsDouble("");
            Assert.False(testResult);
        }
        [Fact]
        public void TestIsIntegerIntegration()
        {
            var testResult = IsInteger("123");
            Assert.True(testResult);
            var testResult = IsInteger("123.456");
            Assert.False(testResult);
            var testResult = IsInteger("-123");
            Assert.True(testResult);
            var testResult = IsInteger("SplashKit");
            Assert.False(testResult);
            var testResult = IsInteger("");
            Assert.False(testResult);
        }
        [Fact]
        public void TestIsNumberIntegration()
        {
            var testResult = IsNumber("123.456");
            Assert.True(testResult);
            var testResult = IsNumber("abc");
            Assert.False(testResult);
        }
        [Fact]
        public void TestLengthOfIntegration()
        {
            var testLength = LengthOf("SplashKit");
            Assert.Equal(9, testLength);
            var testLengthEmpty = LengthOf("");
            Assert.Equal(0, testLengthEmpty);
        }
        [Fact]
        public void TestReplaceAllIntegration()
        {
            var testResult = ReplaceAll("hello world", "world", "SplashKit");
            Assert.Equal("hello SplashKit", testResult);
            var testResult = ReplaceAll("aaaa", "a", "b");
            Assert.Equal("bbbb", testResult);
            var testResult = ReplaceAll("test", "t", "");
            Assert.Equal("es", testResult);
        }
        [Fact]
        public void TestSplitIntegration()
        {
            var testResult = Split("splashkit library", " ");
            Assert.Equal(2, LengthOf(testResult));
            Assert.Equal(0, IndexOf(testResult, "splashkit"));
            Assert.Equal(0, IndexOf(testResult, "library"));
        }
        [Fact]
        public void TestToLowercaseIntegration()
        {
            var testLowercase = ToLowercase("SPLASHKIT");
            Assert.Equal("splashkit", testLowercase);
            var testEmpty = ToLowercase("");
            Assert.Equal("", testEmpty);
        }
        [Fact]
        public void TestToUppercaseIntegration()
        {
            var testUppercase = ToUppercase("hello");
            Assert.Equal("HELLO", testUppercase);
        }
        [Fact]
        public void TestTrimIntegration()
        {
            var testTrimmed = Trim("  Hello, World!  ");
            Assert.Equal("Hello, World!", testTrimmed);
            var testEmptyTrimmed = Trim(" \t\n  ");
            Assert.Equal("", testEmptyTrimmed);
        }
        [Fact]
        public void TestRndRangeIntegration()
        {
            var testResult = Rnd(1, 10);
            Assert.InRange(testResult, 1, 10);
        }
        [Fact]
        public void TestRndIntegration()
        {
            var testRandom = Rnd();
            Assert.True(testRandom > 0.0);
            Assert.True(testRandom < 1.0);
        }
        [Fact]
        public void TestRndIntIntegration()
        {
            var testResult = Rnd(10);
            Assert.InRange(testResult, 0, 10);
        }
        [Fact]
        public void TestCurrentTicksIntegration()
        {
            var testTicks = CurrentTicks();
            Assert.True(testTicks > 0);
        }
        [Fact]
        public void TestDelayIntegration()
        {
            var testStartTime = CurrentTicks();
            Delay(1000);
            var testEndTime = CurrentTicks();
            Assert.True(CurrentTicks() > testStartTime);
            Assert.InRange(CurrentTicks(), testStartTime, 1100);
        }
        [Fact]
        public void TestDisplayDialogIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testFont = LoadFont("test_font", "path/to/font.ttf");
            DisplayDialog("Test Title", "This is a test message.", testFont, 12);
            FreeFont(testFont);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestFileAsStringIntegration()
        {
            var testFileContent = FileAsString("test_file.txt", ResourceKind.BundleResource);
            Assert.NotEqual("", testFileContent);
        }
    }
}
