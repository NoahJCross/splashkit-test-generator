import pytest
from splashkit import *


def test_CloseLogProcess_integration():
    init_custom_logger("test_logging", true, LogMode.LogConsoleAndFile)
    log(LogLevel.Info, "Test message")
    close_log_process()
    assert file_exists == "test_logging.log"
    delete_file("test_logging.log")


def test_InitCustomLogger_integration():
    init_custom_logger(LogMode.LogConsole)
    log(LogLevel.Info, "This message should appear in the console.")
    assert log(LogLevel.Info, "This message should appear in the console.") is True
    init_custom_logger(LogMode.LogFileOnly)
    log(LogLevel.Info, "This message should only appear in the log file.")
    assert log(LogLevel.Info, "This message should only appear in the log file.") is False
    close_log_process()


def test_InitCustomLoggerNameOverrideMode_integration():
    init_custom_logger__name_override_mode("test_app", true, LogMode.LogConsoleAndFile)
    log(LogLevel.Info, "This message should appear in both console and file.")
    assert file_exists == "test_app.log"
    init_custom_logger__name_override_mode("test_app", false, LogMode.LogFileOnly)
    log(LogLevel.Info, "This message should only appear in the file.")
    assert file_exists == "test_app.log"
    close_log_process()


def test_Log_integration():
    init_custom_logger("test_logging", true, LogMode.LogConsoleAndFile)
    log(LogLevel.Info, "This is an info message")
    assert log(LogLevel.Info, "This is an info message") is True
    close_log_process()

