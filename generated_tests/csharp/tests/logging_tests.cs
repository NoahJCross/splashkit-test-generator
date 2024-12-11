using Xunit;
using static SplashKitSDK.SplashKit;

namespace SplashKitTests
{
    public class TestLogging
    {
        [Fact]
        public void TestCloseLogProcessIntegration()
        {
            InitCustomLogger("test_logging", true, LogMode.LogConsoleAndFile);
            Log(LogLevel.Info, "This message should appear in both console and file.");
            CloseLogProcess();
        }
        [Fact]
        public void TestInitCustomLoggerIntegration()
        {
            InitCustomLogger(LogMode.LogConsole);
            Log(LogLevel.Info, "This message should appear in the console.");
            Log(LogLevel.Info, "This message should appear in the console.");
            InitCustomLogger(LogMode.LogFileOnly);
            Log(LogLevel.Info, "This message should only appear in the log file.");
            Log(LogLevel.Info, "This message should only appear in the log file.");
            CloseLogProcess();
        }
        [Fact]
        public void TestInitCustomLoggerNameOverrideModeIntegration()
        {
            InitCustomLoggerNameOverrideMode("test_app", true, LogMode.LogConsoleAndFile);
            Log(LogLevel.Info, "This message should appear in both console and file.");
            InitCustomLoggerNameOverrideMode("test_app", false, LogMode.LogFileOnly);
            Log(LogLevel.Info, "This message should only appear in the file.");
            CloseLogProcess();
        }
        [Fact]
        public void TestLogIntegration()
        {
            InitCustomLogger("test_logging", true, LogMode.LogConsoleAndFile);
            Log(LogLevel.Info, "This message should appear in both console and file.");
            CloseLogProcess();
        }
    }
}
