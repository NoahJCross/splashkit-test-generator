uses SplashKit, TestFramework

type
TIntegrationTests = class(TTestCase)
published
procedure TIntegrationTests.TestCloseLogProcessIntegration;
begin
    init_custom_logger("test_logging", true, "LOG_CONSOLE_AND_FILE");
    log("INFO", "Test message");
    close_log_process();
    AssertEquals(fileExists, "test_logging.log");
    delete_file("test_logging.log");
end;
procedure TIntegrationTests.TestInitCustomLoggerIntegration;
begin
    init_custom_logger("LOG_CONSOLE");
    log("INFO", "This message should appear in the console.");
    AssertTrue(log("INFO", "This message should appear in the console."));
    init_custom_logger("LOG_FILE_ONLY");
    log("INFO", "This message should only appear in the log file.");
    AssertFalse(log("INFO", "This message should only appear in the log file."));
    close_log_process();
end;
procedure TIntegrationTests.TestInitCustomLoggerNameOverrideModeIntegration;
begin
    init_custom_logger("test_app", true, "LOG_CONSOLE_AND_FILE");
    log("INFO", "This message should appear in both console and file.");
    AssertEquals(fileExists, "test_app.log");
    init_custom_logger("test_app", false, "LOG_FILE_ONLY");
    log("INFO", "This message should only appear in the file.");
    AssertEquals(fileExists, "test_app.log");
    close_log_process();
end;
procedure TIntegrationTests.TestLogIntegration;
begin
    init_custom_logger("test_logging", true, "LOG_CONSOLE_AND_FILE");
    log("INFO", "This is an info message");
    AssertTrue(log("INFO", "This is an info message"));
    close_log_process();
end;
end;

procedure RegisterTests;
begin
TestFramework.RegisterTest(TIntegrationTests.Suite);
end;
