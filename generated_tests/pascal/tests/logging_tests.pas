uses SplashKit, TestFramework

type
TTestLogging = class(TTestCase)
protected
procedure TIntegrationTests.TestCloseLogProcessIntegration;
begin
    InitCustomLogger('test_logging', true, LogMode.LOG_CONSOLE_AND_FILE);
    Log(LogLevel.INFO, 'This message should appear in both console and file.');
    CloseLogProcess();
end;
procedure TIntegrationTests.TestInitCustomLoggerIntegration;
begin
    InitCustomLogger(LogMode.LOG_CONSOLE);
    Log(LogLevel.INFO, 'This message should appear in the console.');
    Log(LogLevel.INFO, 'This message should appear in the console.');
    InitCustomLogger(LogMode.LOG_FILE_ONLY);
    Log(LogLevel.INFO, 'This message should only appear in the log file.');
    Log(LogLevel.INFO, 'This message should only appear in the log file.');
    CloseLogProcess();
end;
procedure TIntegrationTests.TestInitCustomLoggerNameOverrideModeIntegration;
begin
    InitCustomLogger('test_app', true, LogMode.LOG_CONSOLE_AND_FILE);
    Log(LogLevel.INFO, 'This message should appear in both console and file.');
    InitCustomLogger('test_app', false, LogMode.LOG_FILE_ONLY);
    Log(LogLevel.INFO, 'This message should only appear in the file.');
    CloseLogProcess();
end;
procedure TIntegrationTests.TestLogIntegration;
begin
    InitCustomLogger('test_logging', true, LogMode.LOG_CONSOLE_AND_FILE);
    Log(LogLevel.INFO, 'This message should appear in both console and file.');
    CloseLogProcess();
end;
end;

procedure RegisterTests;
begin
#<Proc:0x00007f20a9d04780 /mnt/c/Users/Noahc/Documents/.Year 2 Semester 3/Team Project (A)/Github Repo/splashkit_test_generator/test_generator/config/languages/pascal_config.rb:128 (lambda)>
end;
