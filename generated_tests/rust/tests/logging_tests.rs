use std::*;
use splashkit::*;
#[cfg(test)]
mod test_logging {
use super::*;
#[test]
fn test_close_log_process_integration() {
    init_custom_logger__name_override_mode("test_logging".to_string(), true, LogMode::LogConsoleAndFile);
    log(LogLevel::Info, "This message should appear in both console and file.".to_string());
    close_log_process();
}
#[test]
fn test_init_custom_logger_integration() {
    init_custom_logger(LogMode::LogConsole);
    log(LogLevel::Info, "This message should appear in the console.".to_string());
    log(LogLevel::Info, "This message should appear in the console.".to_string());
    init_custom_logger(LogMode::LogFileOnly);
    log(LogLevel::Info, "This message should only appear in the log file.".to_string());
    log(LogLevel::Info, "This message should only appear in the log file.".to_string());
    close_log_process();
}
#[test]
fn test_init_custom_logger__name_override_mode_integration() {
    init_custom_logger__name_override_mode("test_app".to_string(), true, LogMode::LogConsoleAndFile);
    log(LogLevel::Info, "This message should appear in both console and file.".to_string());
    init_custom_logger__name_override_mode("test_app".to_string(), false, LogMode::LogFileOnly);
    log(LogLevel::Info, "This message should only appear in the file.".to_string());
    close_log_process();
}
#[test]
fn test_log_integration() {
    init_custom_logger__name_override_mode("test_logging".to_string(), true, LogMode::LogConsoleAndFile);
    log(LogLevel::Info, "This message should appear in both console and file.".to_string());
    close_log_process();
}
}
