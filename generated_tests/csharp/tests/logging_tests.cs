using Xunit;
using static SplashKitSDK.SplashKit;

namespace SplashKitTests
{
    public class IntegrationTests
    {
        [Fact]
        public void TestCloseLogProcessIntegration()
        {
            InitCustomLogger("test_logging", true, "LOG_CONSOLE_AND_FILE");
            Log("INFO", "Test message");
            CloseLogProcess();
            Assert.Equal("test_logging.log", fileExists);
            DeleteFile("test_logging.log");
        }
        [Fact]
        public void TestInitCustomLoggerIntegration()
        {
            InitCustomLogger("LOG_CONSOLE");
            Log("INFO", "This message should appear in the console.");
            Assert.True(Log("INFO", "This message should appear in the console."));
            InitCustomLogger("LOG_FILE_ONLY");
            Log("INFO", "This message should only appear in the log file.");
            Assert.False(Log("INFO", "This message should only appear in the log file."));
            CloseLogProcess();
        }
        [Fact]
        public void TestInitCustomLoggerNameOverrideModeIntegration()
        {
            InitCustomLogger("test_app", true, "LOG_CONSOLE_AND_FILE");
            Log("INFO", "This message should appear in both console and file.");
            Assert.Equal("test_app.log", fileExists);
            InitCustomLogger("test_app", false, "LOG_FILE_ONLY");
            Log("INFO", "This message should only appear in the file.");
            Assert.Equal("test_app.log", fileExists);
            CloseLogProcess();
        }
        [Fact]
        public void TestLogIntegration()
        {
            InitCustomLogger("test_logging", true, "LOG_CONSOLE_AND_FILE");
            Log("INFO", "This is an info message");
            Assert.True(Log("INFO", "This is an info message"));
            CloseLogProcess();
        }
    }
}
