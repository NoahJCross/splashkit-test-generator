using Xunit;
using static SplashKitSDK.SplashKit;

namespace SplashKitTests
{
    public class TestUtilities
    {
        [Fact]
        public void TestContainsIntegration()
        {
            Assert.True(Contains("splashkit library", "splashkit"));
            Assert.True(Contains("splashkit library", "library"));
            Assert.True(Contains("splashkit library", "it lib"));
            Assert.True(Contains("splashkit library", ""));
            Assert.False(Contains("splashkit library", "unreal"));
            Assert.False(Contains("", "splashkit"));
        }
        [Fact]
        public void TestConvertToDoubleIntegration()
        {
            Assert.Equal(123.0, ConvertToDouble("123"));
            Assert.Equal(123.456, ConvertToDouble("123.456"));
            Assert.Equal(-123.0, ConvertToDouble("-123"));
            Assert.Equal(-123.456, ConvertToDouble("-123.456"));
            Assert.Equal(0.456, ConvertToDouble(".456"));
            Assert.Equal(123.0, ConvertToDouble("123."));
            Assert.Equal(123.456, ConvertToDouble("000123.456"));
            Assert.Equal(123.456, ConvertToDouble("123.456000"));
            Assert.Equal(float.PositiveInfinity, ConvertToDouble("inf"));
            Assert.Equal(float.NegativeInfinity, ConvertToDouble("-inf"));
            Assert.Equal(123.0, ConvertToDouble("1.23e2"));
        }
        [Fact]
        public void TestConvertToIntegerIntegration()
        {
            Assert.Equal(123, ConvertToInteger("123"));
            Assert.Equal(123, ConvertToInteger("123.456"));
            Assert.Equal(-123, ConvertToInteger("-123"));
            Assert.Equal(-123, ConvertToInteger("-123.456"));
            Assert.Equal(123, ConvertToInteger("123."));
            Assert.Equal(123, ConvertToInteger("000123.456"));
            Assert.Equal(123, ConvertToInteger("123.456000"));
        }
        [Fact]
        public void TestIndexOfIntegration()
        {
            Assert.Equal(0, IndexOf("splashkit library", "splashkit"));
            Assert.Equal(10, IndexOf("splashkit library", "library"));
            Assert.Equal(7, IndexOf("splashkit library", "it lib"));
            Assert.Equal(-1, IndexOf("splashkit library", "unreal"));
            Assert.Equal(0, IndexOf("splashkit library", "splashkit library"));
            Assert.Equal(-1, IndexOf("splashkit library", "splashkit library is the best"));
            Assert.Equal(0, IndexOf("splashkit library", ""));
            Assert.Equal(-1, IndexOf("", "splashkit"));
            Assert.Equal(0, IndexOf("", ""));
        }
        [Fact]
        public void TestIsDoubleIntegration()
        {
            Assert.True(IsDouble("123.456"));
            Assert.True(IsDouble("123"));
            Assert.True(IsDouble("-123.456"));
            Assert.True(IsDouble("-123"));
            Assert.True(IsDouble("123."));
            Assert.True(IsDouble("000123.456"));
            Assert.True(IsDouble("123.456000"));
            Assert.False(IsDouble(".456"));
            Assert.False(IsDouble("SplashKit"));
            Assert.False(IsDouble(""));
        }
        [Fact]
        public void TestIsIntegerIntegration()
        {
            Assert.True(IsInteger("123"));
            Assert.True(IsInteger("-123"));
            Assert.False(IsInteger("123.456"));
            Assert.False(IsInteger("-123.456"));
            Assert.False(IsInteger(".456"));
            Assert.False(IsInteger("SplashKit"));
            Assert.False(IsInteger(""));
        }
        [Fact]
        public void TestIsNumberIntegration()
        {
            Assert.True(IsNumber("123"));
            Assert.True(IsNumber("123.456"));
            Assert.True(IsNumber("-123"));
            Assert.True(IsNumber("-123.456"));
            Assert.False(IsNumber("SplashKit"));
            Assert.False(IsNumber(""));
        }
        [Fact]
        public void TestLengthOfIntegration()
        {
            Assert.Equal(9, LengthOf("splashkit"));
            Assert.Equal(0, LengthOf(""));
        }
        [Fact]
        public void TestReplaceAllIntegration()
        {
            Assert.Equal("SK library", ReplaceAll("splashkit library", "splashkit", "SK"));
            Assert.Equal("splashkit lib", ReplaceAll("splashkit library", "library", "lib"));
            Assert.Equal("splashkitlibrary", ReplaceAll("splashkit library", "it lib", "itlib"));
            Assert.Equal("splashkit library", ReplaceAll("splashkit library", "unreal", "tournament"));
            Assert.Equal("SK", ReplaceAll("splashkit library", "splashkit library", "SK"));
            Assert.Equal(" library", ReplaceAll("splashkit library", "splashkit", ""));
            Assert.Equal("splashkit library", ReplaceAll("splashkit library", "", "SK"));
            Assert.Equal("", ReplaceAll("", "", "SK"));
        }
        [Fact]
        public void TestSplitIntegration()
        {
            var result = Split("splashkit library", ' ');
            Assert.Equal(new List<string> { "splashkit", "library" }, result);
            Assert.Equal(new List<string> { "" }, Split("", ' '));
            Assert.Equal(new List<string> { "splashkit library" }, Split("splashkit library", ','));
            Assert.Equal(new List<string> { "", "splashkit library" }, Split(",splashkit library", ','));
            Assert.Equal(new List<string> { "splashkit library", "" }, Split("splashkit library,", ','));
            Assert.Equal(new List<string> { "", "splashkit library", "" }, Split(",splashkit library,", ','));
            Assert.Equal(new List<string> { "splashkit", "", "library" }, Split("splashkit,,library", ','));
        }
        [Fact]
        public void TestToLowercaseIntegration()
        {
            Assert.Equal("splashkit", ToLowercase("SPLASHKIT"));
            Assert.Equal("", ToLowercase(""));
            Assert.Equal("splashkit", ToLowercase("splashkit"));
            Assert.Equal("splashkit", ToLowercase("SpLaShKiT"));
        }
        [Fact]
        public void TestToUppercaseIntegration()
        {
            Assert.Equal("SPLASHKIT", ToUppercase("splashkit"));
            Assert.Equal("", ToUppercase(""));
            Assert.Equal("SPLASHKIT", ToUppercase("SPLASHKIT"));
            Assert.Equal("SPLASHKIT", ToUppercase("SpLaShKiT"));
        }
        [Fact]
        public void TestTrimIntegration()
        {
            Assert.Equal("splashkit", Trim("  splashkit"));
            Assert.Equal("splashkit", Trim("splashkit  "));
            Assert.Equal("splashkit", Trim("  splashkit  "));
            Assert.Equal("splashkit", Trim("splashkit"));
            Assert.Equal("", Trim(""));
        }
        [Fact]
        public void TestRndRangeIntegration()
        {
            Assert.InRange(Rnd(-1, 5), -1, 5);
            Assert.Equal(1, Rnd(1, 1));
            Assert.InRange(Rnd(5, 1), 1, 5);
        }
        [Fact]
        public void TestRndIntegration()
        {
            Assert.InRange(Rnd(), 0.0, float.MaxValue);
        }
        [Fact]
        public void TestRndIntIntegration()
        {
            Assert.InRange(Rnd(1), 0, 1);
            Assert.InRange(Rnd(10), 0, 10);
            Assert.Equal(0, Rnd(-1));
            Assert.Equal(0, Rnd(0));
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
            var testTimer = CreateTimer("test_timer");
            StartTimer(testTimer);
            var initialTicks = TimerTicks(testTimer);
            Delay(200);
            Assert.True(initialTicks + 200 < TimerTicks(testTimer));
        }
        [Fact]
        public void TestDisplayDialogIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testFont = LoadFont("test_font", "hara.ttf");
            DisplayDialog("Test Dialog", "This is a test message", testFont, 20);
            FreeFont(testFont);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestFileAsStringIntegration()
        {
            Assert.Equal("BITMAP,ufo,ufo.png\n", FileAsString("blah.txt", ResourceKind.BundleResource));
            Assert.Equal("", FileAsString("", ResourceKind.BundleResource));
            Assert.Equal("", FileAsString("invalid.txt", ResourceKind.BundleResource));
        }
    }
}
