uses SplashKit, TestFramework, ../Helpers;
type
    TTestLogging = class(TTestCase)
    protected
        procedure Setup; override;
    end;
    procedure TestCloseLogProcessIntegration;
begin
    InitCustomLogger('test_logging', true, LogMode.LOG_CONSOLE_AND_FILE);
    CleanupLogger := TLoggerCleanup.Create;
    Log(LogLevel.INFO, 'This message should appear in both console and file.');
    CloseLogProcess();
end;
procedure TestInitCustomLoggerIntegration;
begin
    InitCustomLogger(LogMode.LOG_CONSOLE);
    CleanupLogger := TLoggerCleanup.Create;
    Log(LogLevel.INFO, 'This message should appear in the console.');
    Log(LogLevel.INFO, 'This message should appear in the console.');
    InitCustomLogger(LogMode.LOG_FILE_ONLY);
    Log(LogLevel.INFO, 'This message should only appear in the log file.');
    Log(LogLevel.INFO, 'This message should only appear in the log file.');
end;
procedure TestInitCustomLoggerNameOverrideModeIntegration;
begin
    InitCustomLogger('test_app', true, LogMode.LOG_CONSOLE_AND_FILE);
    CleanupLogger := TLoggerCleanup.Create;
    Log(LogLevel.INFO, 'This message should appear in both console and file.');
    InitCustomLogger('test_app', false, LogMode.LOG_FILE_ONLY);
    Log(LogLevel.INFO, 'This message should only appear in the file.');
end;
procedure TestLogIntegration;
begin
    InitCustomLogger('test_logging', true, LogMode.LOG_CONSOLE_AND_FILE);
    CleanupLogger := TLoggerCleanup.Create;
    Log(LogLevel.INFO, 'This message should appear in both console and file.');
end;
end;

procedure RegisterTests;
begin
    #<Proc:0x00007fbbcab52da8 /mnt/c/Users/Noahc/Documents/aYear_2_semester_2/TeamProject/GitHubRepo/splashkit_test_generator/test_generator/config/languages/pascal_config.rb:138 (lambda)>
end;
