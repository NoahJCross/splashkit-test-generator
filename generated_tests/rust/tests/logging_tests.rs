use std::*;
use splashkit::*;
use splashkit_tests::helpers::*;
#[cfg(test)]
use ctor::ctor;
mod test_logging {
    use super::*;
    #[test]
    fn test_close_log_process_integration() {
        init_custom_logger__name_override_mode("test_logging1".to_string(), true, LogMode::LogConsoleAndFile);
        let _cleanup_logger = LoggerCleanup::new();
        log(LogLevel::Info, "This message should appear in both console and file.".to_string());
        close_log_process();
    }
    #[test]
    fn test_init_custom_logger_integration() {
        init_custom_logger(LogMode::LogConsole);
        let _cleanup_logger = LoggerCleanup::new();
        log(LogLevel::Info, "This message should appear in the console.".to_string());
        log(LogLevel::Info, "This message should appear in the console.".to_string());
        init_custom_logger(LogMode::LogFileOnly);
        log(LogLevel::Info, "This message should only appear in the log file.".to_string());
        log(LogLevel::Info, "This message should only appear in the log file.".to_string());
    }
    #[test]
    fn test_init_custom_logger__name_override_mode_integration() {
        init_custom_logger__name_override_mode("test_logging2".to_string(), true, LogMode::LogConsoleAndFile);
        let _cleanup_logger = LoggerCleanup::new();
        log(LogLevel::Info, "This message should appear in both console and file.".to_string());
        init_custom_logger__name_override_mode("test_logging3".to_string(), false, LogMode::LogFileOnly);
        log(LogLevel::Info, "This message should only appear in the file.".to_string());
    }
    #[test]
    fn test_log_integration() {
        init_custom_logger__name_override_mode("test_logging4".to_string(), true, LogMode::LogConsoleAndFile);
        let _cleanup_logger = LoggerCleanup::new();
        log(LogLevel::Info, "This message should appear in both console and file.".to_string());
    }
}
