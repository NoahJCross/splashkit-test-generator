using Xunit;
using SplashKitSDK;
using static SplashKitSDK.SplashKit;
using HttpMethod = SplashKitSDK.HttpMethod;
namespace SplashKitTests
{
    public class TestLogging
    {
        [Fact]
        public void TestCloseLogProcessIntegration() {
            InitCustomLogger("test_logging1", true, LogMode.LogConsoleAndFile);
            using var cleanupLogger = new LoggerCleanup();
            Log(LogLevel.Info, "This message should appear in both console and file.");
            CloseLogProcess();
        }
        [Fact]
        public void TestInitCustomLoggerIntegration() {
            InitCustomLogger(LogMode.LogConsole);
            using var cleanupLogger = new LoggerCleanup();
            Log(LogLevel.Info, "This message should appear in the console.");
            Log(LogLevel.Info, "This message should appear in the console.");
            InitCustomLogger(LogMode.LogFileOnly);
            Log(LogLevel.Info, "This message should only appear in the log file.");
            Log(LogLevel.Info, "This message should only appear in the log file.");
        }
        [Fact]
        public void TestInitCustomLoggerNameOverrideModeIntegration() {
            InitCustomLogger("test_logging2", true, LogMode.LogConsoleAndFile);
            using var cleanupLogger = new LoggerCleanup();
            Log(LogLevel.Info, "This message should appear in both console and file.");
            InitCustomLogger("test_logging3", false, LogMode.LogFileOnly);
            Log(LogLevel.Info, "This message should only appear in the file.");
        }
        [Fact]
        public void TestLogIntegration() {
            InitCustomLogger("test_logging4", true, LogMode.LogConsoleAndFile);
            using var cleanupLogger = new LoggerCleanup();
            Log(LogLevel.Info, "This message should appear in both console and file.");
        }
    }
}
