#include <catch2/catch_all.hpp>
#include <limits>
#include "splashkit.h"
#include "../helpers.hpp"
struct TestLoggingFixture
{
};
TEST_CASE_METHOD(TestLoggingFixture, "close_log_process_integration") {
    init_custom_logger("test_logging1", true, log_mode::LOG_CONSOLE_AND_FILE);
    logger_cleanup cleanup_logger;
    log(log_level::INFO, "This message should appear in both console and file.");
    close_log_process();
}
TEST_CASE_METHOD(TestLoggingFixture, "init_custom_logger_integration") {
    init_custom_logger(log_mode::LOG_CONSOLE);
    logger_cleanup cleanup_logger;
    log(log_level::INFO, "This message should appear in the console.");
    log(log_level::INFO, "This message should appear in the console.");
    init_custom_logger(log_mode::LOG_FILE_ONLY);
    log(log_level::INFO, "This message should only appear in the log file.");
    log(log_level::INFO, "This message should only appear in the log file.");
}
TEST_CASE_METHOD(TestLoggingFixture, "init_custom_logger__name_override_mode_integration") {
    init_custom_logger("test_logging2", true, log_mode::LOG_CONSOLE_AND_FILE);
    logger_cleanup cleanup_logger;
    log(log_level::INFO, "This message should appear in both console and file.");
    init_custom_logger("test_logging3", false, log_mode::LOG_FILE_ONLY);
    log(log_level::INFO, "This message should only appear in the file.");
}
TEST_CASE_METHOD(TestLoggingFixture, "log_integration") {
    init_custom_logger("test_logging4", true, log_mode::LOG_CONSOLE_AND_FILE);
    logger_cleanup cleanup_logger;
    log(log_level::INFO, "This message should appear in both console and file.");
}
