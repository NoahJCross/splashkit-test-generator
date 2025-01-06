import pytest
from splashkit import *
from ..helpers import *
import contextlib
class TestLogging:
    def test_close_log_process_integration():
        init_custom_logger__name_override_mode("test_logging1", true, LogMode.LogConsoleAndFile)
        with logger_cleanup():
            log(LogLevel.Info, "This message should appear in both console and file.")
            close_log_process()
            
    def test_init_custom_logger_integration():
        init_custom_logger(LogMode.LogConsole)
        with logger_cleanup():
            log(LogLevel.Info, "This message should appear in the console.")
            log(LogLevel.Info, "This message should appear in the console.")
            init_custom_logger(LogMode.LogFileOnly)
            log(LogLevel.Info, "This message should only appear in the log file.")
            log(LogLevel.Info, "This message should only appear in the log file.")
            
    def test_init_custom_logger__name_override_mode_integration():
        init_custom_logger__name_override_mode("test_logging2", true, LogMode.LogConsoleAndFile)
        with logger_cleanup():
            log(LogLevel.Info, "This message should appear in both console and file.")
            init_custom_logger__name_override_mode("test_logging3", false, LogMode.LogFileOnly)
            log(LogLevel.Info, "This message should only appear in the file.")
            
    def test_log_integration():
        init_custom_logger__name_override_mode("test_logging4", true, LogMode.LogConsoleAndFile)
        with logger_cleanup():
            log(LogLevel.Info, "This message should appear in both console and file.")
            
