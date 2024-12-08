using Xunit;
using static SplashKitSDK.SplashKit;

namespace SplashKitTests
{
    public class IntegrationTests
    {
        [Fact]
        public void TestReadCharIntegration()
        {
            Write("Please type a character: ");
            var testChar = ReadChar();
            WriteLine("You typed: ", testChar);
            Assert.NotNull(testChar);
        }
        [Fact]
        public void TestReadLineIntegration()
        {
            Write("Please enter your name: ");
            var testInput = ReadLine();
            Assert.NotEqual(testInput, "");
            WriteLine("You entered: ", testInput);
        }
        [Fact]
        public void TestTerminalHasInputIntegration()
        {
            Write("Type something and press Enter: ");
            ProcessEvents();
            Assert.False(TerminalHasInput());
            var testInput = ReadLine();
            ProcessEvents();
            Assert.True(TerminalHasInput());
        }
        [Fact]
        public void TestWriteCharIntegration()
        {
            Write("A");
            Assert.True(TerminalHasInput());
            var testChar = ReadChar();
            Assert.Equal(testChar, "A");
        }
        [Fact]
        public void TestWriteDoubleIntegration()
        {
            Write(3.14);
            Assert.True(TerminalHasInput());
        }
        [Fact]
        public void TestWriteIntIntegration()
        {
            Write(42);
            Assert.True(TerminalHasInput());
        }
        [Fact]
        public void TestWriteIntegration()
        {
            Write("Test String");
            Assert.True(TerminalHasInput());
            var testOutput = ReadLine();
            Assert.Equal(testOutput, "Test String");
        }
        [Fact]
        public void TestWriteLineCharIntegration()
        {
            WriteLine("A");
            Assert.True(TerminalHasInput());
            var testChar = ReadChar();
            Assert.Equal(testChar, "A");
        }
        [Fact]
        public void TestWriteLineEmptyIntegration()
        {
            Write("Test line");
            WriteLine();
            Write("Next line");
            Assert.True(TerminalHasInput());
        }
        [Fact]
        public void TestWriteLineDoubleIntegration()
        {
            WriteLine(42.5);
            Assert.True(TerminalHasInput());
        }
        [Fact]
        public void TestWriteLineIntIntegration()
        {
            WriteLine(42);
            Assert.True(TerminalHasInput());
        }
        [Fact]
        public void TestWriteLineIntegration()
        {
            WriteLine("Test Line");
            Assert.True(TerminalHasInput());
        }
    }
}
