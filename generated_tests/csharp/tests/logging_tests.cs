using Xunit;
using static SplashKitSDK.SplashKit;

namespace SplashKitTests
{
    public class IntegrationTests
    {
        [Fact]
        public void TestCloseLogProcessIntegration()
        {
            InitCustomLogger("test_logging", true, LogMode.LogConsoleAndFile);
            Log(LogLevel.Info, "Test message");
            CloseLogProcess();
            Assert.Equal(fileExists, "test_logging.log");
            DeleteFile("test_logging.log");
        }
        [Fact]
        public void TestInitCustomLoggerIntegration()
        {
            InitCustomLogger(LogMode.LogConsole);
            Log(LogLevel.Info, "This message should appear in the console.");
            Assert.True(Log(LogLevel.Info, "This message should appear in the console."));
            InitCustomLogger(LogMode.LogFileOnly);
            Log(LogLevel.Info, "This message should only appear in the log file.");
            Assert.False(Log(LogLevel.Info, "This message should only appear in the log file."));
            CloseLogProcess();
        }
        [Fact]
        public void TestInitCustomLoggerNameOverrideModeIntegration()
        {
            InitCustomLogger("test_app", true, LogMode.LogConsoleAndFile);
            Log(LogLevel.Info, "This message should appear in both console and file.");
            Assert.Equal(fileExists, "test_app.log");
            InitCustomLogger("test_app", false, LogMode.LogFileOnly);
            Log(LogLevel.Info, "This message should only appear in the file.");
            Assert.Equal(fileExists, "test_app.log");
            CloseLogProcess();
        }
        [Fact]
        public void TestLogIntegration()
        {
            InitCustomLogger("test_logging", true, LogMode.LogConsoleAndFile);
            Log(LogLevel.Info, "This is an info message");
            Assert.True(Log(LogLevel.Info, "This is an info message"));
            CloseLogProcess();
        }
    }
}
