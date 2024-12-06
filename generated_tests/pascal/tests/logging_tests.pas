uses SplashKit, TestFramework

type
TIntegrationTests = class(TTestCase)
published
procedure TIntegrationTests.TestCloseLogProcessIntegration;
begin
    InitCustomLogger("test_logging", true, "LOG_CONSOLE_AND_FILE");
    Log("INFO", "Test message");
    CloseLogProcess();
    AssertEquals(fileExists, "test_logging.log");
    DeleteFile("test_logging.log");
end;
procedure TIntegrationTests.TestInitCustomLoggerIntegration;
begin
    InitCustomLogger("LOG_CONSOLE");
    Log("INFO", "This message should appear in the console.");
    AssertTrue(Log("INFO", "This message should appear in the console."));
    InitCustomLogger("LOG_FILE_ONLY");
    Log("INFO", "This message should only appear in the log file.");
    AssertFalse(Log("INFO", "This message should only appear in the log file."));
    CloseLogProcess();
end;
procedure TIntegrationTests.TestInitCustomLoggerNameOverrideModeIntegration;
begin
    InitCustomLogger("test_app", true, "LOG_CONSOLE_AND_FILE");
    Log("INFO", "This message should appear in both console and file.");
    AssertEquals(fileExists, "test_app.log");
    InitCustomLogger("test_app", false, "LOG_FILE_ONLY");
    Log("INFO", "This message should only appear in the file.");
    AssertEquals(fileExists, "test_app.log");
    CloseLogProcess();
end;
procedure TIntegrationTests.TestLogIntegration;
begin
    InitCustomLogger("test_logging", true, "LOG_CONSOLE_AND_FILE");
    Log("INFO", "This is an info message");
    AssertTrue(Log("INFO", "This is an info message"));
    CloseLogProcess();
end;
end;

procedure RegisterTests;
begin
TestFramework.RegisterTest(TIntegrationTests.Suite);
end;
