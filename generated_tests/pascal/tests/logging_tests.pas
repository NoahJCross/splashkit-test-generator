uses SplashKit, TestFramework

type
TIntegrationTests = class(TTestCase)
published
procedure TIntegrationTests.TestCloseLogProcessIntegration;
begin
    InitCustomLogger("test_logging", true, LogMode.LOG_CONSOLE_AND_FILE);
    Log(LogLevel.INFO, "Test message");
    CloseLogProcess();
    AssertEquals(fileExists, "test_logging.log");
    DeleteFile("test_logging.log");
end;
procedure TIntegrationTests.TestInitCustomLoggerIntegration;
begin
    InitCustomLogger(LogMode.LOG_CONSOLE);
    Log(LogLevel.INFO, "This message should appear in the console.");
    AssertTrue(Log(LogLevel.INFO, "This message should appear in the console."));
    InitCustomLogger(LogMode.LOG_FILE_ONLY);
    Log(LogLevel.INFO, "This message should only appear in the log file.");
    AssertFalse(Log(LogLevel.INFO, "This message should only appear in the log file."));
    CloseLogProcess();
end;
procedure TIntegrationTests.TestInitCustomLoggerNameOverrideModeIntegration;
begin
    InitCustomLogger("test_app", true, LogMode.LOG_CONSOLE_AND_FILE);
    Log(LogLevel.INFO, "This message should appear in both console and file.");
    AssertEquals(fileExists, "test_app.log");
    InitCustomLogger("test_app", false, LogMode.LOG_FILE_ONLY);
    Log(LogLevel.INFO, "This message should only appear in the file.");
    AssertEquals(fileExists, "test_app.log");
    CloseLogProcess();
end;
procedure TIntegrationTests.TestLogIntegration;
begin
    InitCustomLogger("test_logging", true, LogMode.LOG_CONSOLE_AND_FILE);
    Log(LogLevel.INFO, "This is an info message");
    AssertTrue(Log(LogLevel.INFO, "This is an info message"));
    CloseLogProcess();
end;
end;

procedure RegisterTests;
begin
TestFramework.RegisterTest(TIntegrationTests.Suite);
end;
