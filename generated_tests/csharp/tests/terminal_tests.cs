using System;
using System.IO;
using Xunit;
using static SplashKitSDK.SplashKit;

namespace SplashKitTests
{
    public class TestTerminal
    {
        [Fact]
        public void TestReadCharIntegration()
        {
            Console.WriteLine("Enter the letter A");
            var result = ReadChar();
            Assert.Equal('A', result);
        }
        [Fact]
        public void TestReadLineIntegration()
        {
            Console.WriteLine("Enter the text: Test Input");
            var result = ReadLine();
            Assert.Equal("Test Input", result);
        }
        [Fact]
        public void TestTerminalHasInputIntegration()
        {
            Console.WriteLine("Enter some text: Some Input");
            var result = TerminalHasInput();
            Assert.True(result);
        }
        [Fact]
        public void TestWriteCharIntegration()
        {
            Write('A');
        }
        [Fact]
        public void TestWriteDoubleIntegration()
        {
            Write(3.14);
        }
        [Fact]
        public void TestWriteIntIntegration()
        {
            Write(42);
        }
        [Fact]
        public void TestWriteIntegration()
        {
            Write("Test String");
        }
        [Fact]
        public void TestWriteLineCharIntegration()
        {
            WriteLine('A');
        }
        [Fact]
        public void TestWriteLineEmptyIntegration()
        {
            WriteLine();
        }
        [Fact]
        public void TestWriteLineDoubleIntegration()
        {
            WriteLine(3.14);
        }
        [Fact]
        public void TestWriteLineIntIntegration()
        {
            WriteLine(42);
        }
        [Fact]
        public void TestWriteLineIntegration()
        {
            WriteLine("Test Line");
        }
    }
}
