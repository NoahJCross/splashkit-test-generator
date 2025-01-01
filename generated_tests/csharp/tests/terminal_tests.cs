using Xunit;
using SplashKitSDK;
using static SplashKitSDK.SplashKit;
using HttpMethod = SplashKitSDK.HttpMethod;
namespace SplashKitTests
{
    public class TestTerminal
    {
        [Fact]
        public void TestReadCharIntegration() {
            Console.WriteLine("Enter the letter A");
            var result = ReadChar();
            Assert.Equal('A', result);
        }
        [Fact]
        public void TestReadLineIntegration() {
            Console.WriteLine("Enter the text: Test Input");
            var result = ReadLine();
            Assert.Equal("Test Input", result);
        }
        [Fact]
        public void TestTerminalHasInputIntegration() {
            Console.WriteLine("Enter some text: Some Input");
            var result = TerminalHasInput();
            Assert.True(result);
        }
        [Fact]
        public void TestWriteCharIntegration() {
            Console.WriteLine("Should print A:");
            Write('A');
            WriteLine();
        }
        [Fact]
        public void TestWriteDoubleIntegration() {
            Console.WriteLine("Should print 3.14:");
            Write(3.14);
            WriteLine();
        }
        [Fact]
        public void TestWriteIntIntegration() {
            Console.WriteLine("Should print 42:");
            Write(42);
            WriteLine();
        }
        [Fact]
        public void TestWriteIntegration() {
            Console.WriteLine("Should print Test String:");
            Write("Test String");
            WriteLine();
        }
        [Fact]
        public void TestWriteLineCharIntegration() {
            Console.WriteLine("Should print A:");
            WriteLine('A');
        }
        [Fact]
        public void TestWriteLineEmptyIntegration() {
            Console.WriteLine("Should print empty line:");
            WriteLine();
        }
        [Fact]
        public void TestWriteLineDoubleIntegration() {
            Console.WriteLine("Should print 3.14:");
            WriteLine(3.14);
        }
        [Fact]
        public void TestWriteLineIntIntegration() {
            Console.WriteLine("Should print 42:");
            WriteLine(42);
        }
        [Fact]
        public void TestWriteLineIntegration() {
            Console.WriteLine("Should print Test Line:");
            WriteLine("Test Line");
        }
    }
}
