import pytest
from splashkit import *

class TestLogging:

def test_close_log_process_integration():
    init_custom_logger("test_logging", true, LogMode.LogConsoleAndFile)
    log(LogLevel.Info, "This message should appear in both console and file.")
    close_log_process()


def test_init_custom_logger_integration():
    init_custom_logger(LogMode.LogConsole)
    log(LogLevel.Info, "This message should appear in the console.")
    log(LogLevel.Info, "This message should appear in the console.")
    init_custom_logger(LogMode.LogFileOnly)
    log(LogLevel.Info, "This message should only appear in the log file.")
    log(LogLevel.Info, "This message should only appear in the log file.")
    close_log_process()


def test_init_custom_logger__name_override_mode_integration():
    init_custom_logger__name_override_mode("test_app", true, LogMode.LogConsoleAndFile)
    log(LogLevel.Info, "This message should appear in both console and file.")
    init_custom_logger__name_override_mode("test_app", false, LogMode.LogFileOnly)
    log(LogLevel.Info, "This message should only appear in the file.")
    close_log_process()


def test_log_integration():
    init_custom_logger("test_logging", true, LogMode.LogConsoleAndFile)
    log(LogLevel.Info, "This message should appear in both console and file.")
    close_log_process()

