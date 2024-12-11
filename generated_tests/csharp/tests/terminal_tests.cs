using Xunit;
using static SplashKitSDK.SplashKit;

namespace SplashKitTests
{
    public class TestTerminal
    {
        [Fact]
        public void TestReadCharIntegration()
        {
            # TODO: Implement io_setup step
            var result = ReadChar();
            Assert.Equal("A", result);
        }
        [Fact]
        public void TestReadLineIntegration()
        {
            # TODO: Implement io_setup step
            var result = ReadLine();
            Assert.Equal("Test Input", "Test Input");
        }
        [Fact]
        public void TestTerminalHasInputIntegration()
        {
            # TODO: Implement io_setup step
            Assert.True(TerminalHasInput());
        }
        [Fact]
        public void TestWriteCharIntegration()
        {
            # TODO: Implement io_setup step
            WriteChar("A");
            Assert.Equal("A", "A");
        }
        [Fact]
        public void TestWriteDoubleIntegration()
        {
            # TODO: Implement io_setup step
            WriteDouble(3.14);
            Assert.Equal("3.14", "3.14");
        }
        [Fact]
        public void TestWriteIntIntegration()
        {
            # TODO: Implement io_setup step
            WriteInt(42);
            Assert.Equal("42", "42");
        }
        [Fact]
        public void TestWriteIntegration()
        {
            # TODO: Implement io_setup step
            Write("Test String");
            Assert.Equal("Test String", "Test String");
        }
        [Fact]
        public void TestWriteLineCharIntegration()
        {
            # TODO: Implement io_setup step
            WriteLineChar("A");
            Assert.Equal({:value_type=>"concat", :value=>["A", "new_line"]}, {:value_type=>"string_with_newline", :value=>"A"});
        }
        [Fact]
        public void TestWriteLineEmptyIntegration()
        {
            # TODO: Implement io_setup step
            WriteLineEmpty();
            Assert.Equal(Environment.NewLine, {:value_type=>"io_step", :variable_name=>"string_writer", :variable_field=>"to_string"});
        }
        [Fact]
        public void TestWriteLineDoubleIntegration()
        {
            # TODO: Implement io_setup step
            WriteLineDouble(3.14);
            Assert.Equal({:value_type=>"concat", :value=>["3.14", "new_line"]}, {:value_type=>"string_with_newline", :value=>"3.14"});
        }
        [Fact]
        public void TestWriteLineIntIntegration()
        {
            # TODO: Implement io_setup step
            WriteLineInt(42);
            Assert.Equal({:value_type=>"concat", :value=>["42", "new_line"]}, {:value_type=>"string_with_newline", :value=>"42"});
        }
        [Fact]
        public void TestWriteLineIntegration()
        {
            # TODO: Implement io_setup step
            WriteLine("Test Line");
            Assert.Equal({:value_type=>"concat", :value=>["Test Line", "new_line"]}, {:value_type=>"string_with_newline", :value=>"Test Line"});
        }
    }
}
