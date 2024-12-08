#include "splashkit.h"
#include <catch2/catch.hpp>

TEST_CASE("close_log_process_integration") {
    init_custom_logger("test_logging", true, LogMode::LOG_CONSOLE_AND_FILE);
    log(LogLevel::INFO, "Test message");
    close_log_process();
    REQUIRE(file_exists == "test_logging.log");
    delete_file("test_logging.log");
}
TEST_CASE("init_custom_logger_integration") {
    init_custom_logger(LogMode::LOG_CONSOLE);
    log(LogLevel::INFO, "This message should appear in the console.");
    REQUIRE(log(LogLevel::INFO, "This message should appear in the console."));
    init_custom_logger(LogMode::LOG_FILE_ONLY);
    log(LogLevel::INFO, "This message should only appear in the log file.");
    REQUIRE_FALSE(log(LogLevel::INFO, "This message should only appear in the log file."));
    close_log_process();
}
TEST_CASE("init_custom_logger__name_override_mode_integration") {
    init_custom_logger("test_app", true, LogMode::LOG_CONSOLE_AND_FILE);
    log(LogLevel::INFO, "This message should appear in both console and file.");
    REQUIRE(file_exists == "test_app.log");
    init_custom_logger("test_app", false, LogMode::LOG_FILE_ONLY);
    log(LogLevel::INFO, "This message should only appear in the file.");
    REQUIRE(file_exists == "test_app.log");
    close_log_process();
}
TEST_CASE("log_integration") {
    init_custom_logger("test_logging", true, LogMode::LOG_CONSOLE_AND_FILE);
    log(LogLevel::INFO, "This is an info message");
    REQUIRE(log(LogLevel::INFO, "This is an info message"));
    close_log_process();
}
