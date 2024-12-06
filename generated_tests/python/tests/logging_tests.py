import pytest
from splashkit import *


def test_CloseLogProcess_integration():
    InitCustomLogger("test_logging", true, "LOG_CONSOLE_AND_FILE")
    Log("INFO", "Test message")
    CloseLogProcess()
    assert file_exists == "test_logging.log"
    DeleteFile("test_logging.log")


def test_InitCustomLogger_integration():
    InitCustomLogger("LOG_CONSOLE")
    Log("INFO", "This message should appear in the console.")
    assert Log("INFO", "This message should appear in the console.") is True
    InitCustomLogger("LOG_FILE_ONLY")
    Log("INFO", "This message should only appear in the log file.")
    assert Log("INFO", "This message should only appear in the log file.") is False
    CloseLogProcess()


def test_InitCustomLoggerNameOverrideMode_integration():
    InitCustomLoggerNameOverrideMode("test_app", true, "LOG_CONSOLE_AND_FILE")
    Log("INFO", "This message should appear in both console and file.")
    assert file_exists == "test_app.log"
    InitCustomLoggerNameOverrideMode("test_app", false, "LOG_FILE_ONLY")
    Log("INFO", "This message should only appear in the file.")
    assert file_exists == "test_app.log"
    CloseLogProcess()


def test_Log_integration():
    InitCustomLogger("test_logging", true, "LOG_CONSOLE_AND_FILE")
    Log("INFO", "This is an info message")
    assert Log("INFO", "This is an info message") is True
    CloseLogProcess()

