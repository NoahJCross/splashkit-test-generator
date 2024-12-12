use splashkit::*;
#[cfg(test)]
mod test_runner {
    pub fn run_tests_sequential(tests: &[&dyn Fn()]) {
        for test in tests {
            test();
        }
    }
}
#![test_runner(test_runner::run_tests_sequential)]
mod test_logging {
use super::*;
#[test]
fn test_close_log_process_integration() {
    init_custom_logger("test_logging", true, LogMode::LogConsoleAndFile);
    log(LogLevel::Info, "This message should appear in both console and file.");
    close_log_process();
}
#[test]
fn test_init_custom_logger_integration() {
    init_custom_logger(LogMode::LogConsole);
    log(LogLevel::Info, "This message should appear in the console.");
    log(LogLevel::Info, "This message should appear in the console.");
    init_custom_logger(LogMode::LogFileOnly);
    log(LogLevel::Info, "This message should only appear in the log file.");
    log(LogLevel::Info, "This message should only appear in the log file.");
    close_log_process();
}
#[test]
fn test_init_custom_logger__name_override_mode_integration() {
    init_custom_logger__name_override_mode("test_app", true, LogMode::LogConsoleAndFile);
    log(LogLevel::Info, "This message should appear in both console and file.");
    init_custom_logger__name_override_mode("test_app", false, LogMode::LogFileOnly);
    log(LogLevel::Info, "This message should only appear in the file.");
    close_log_process();
}
#[test]
fn test_log_integration() {
    init_custom_logger("test_logging", true, LogMode::LogConsoleAndFile);
    log(LogLevel::Info, "This message should appear in both console and file.");
    close_log_process();
}
}
