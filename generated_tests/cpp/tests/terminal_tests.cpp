#include <catch2/catch_all.hpp>
#include <limits>
#include "splashkit.h"
#include "../helpers.hpp"
struct TestTerminalFixture
{
};
TEST_CASE_METHOD(TestTerminalFixture, "read_char_integration") {
    write_line();
    cout << "Enter the letter A";
    auto result = read_char();
    REQUIRE('A' == result);
}
TEST_CASE_METHOD(TestTerminalFixture, "read_line_integration") {
    write_line();
    cout << "Enter the text: Test Input";
    auto result = read_line();
    REQUIRE("Test Input" == result);
}
TEST_CASE_METHOD(TestTerminalFixture, "terminal_has_input_integration") {
    write_line();
    cout << "Enter some text: Some Input";
    auto result = terminal_has_input();
    REQUIRE(result);
}
TEST_CASE_METHOD(TestTerminalFixture, "write_char_integration") {
    write_line();
    cout << "Should print A:";
    write('A');
    write_line();
}
TEST_CASE_METHOD(TestTerminalFixture, "write_double_integration") {
    write_line();
    cout << "Should print 3.14:";
    write(3.14);
    write_line();
}
TEST_CASE_METHOD(TestTerminalFixture, "write_int_integration") {
    write_line();
    cout << "Should print 42:";
    write(42);
    write_line();
}
TEST_CASE_METHOD(TestTerminalFixture, "write_integration") {
    write_line();
    cout << "Should print Test String:";
    write("Test String");
    write_line();
}
TEST_CASE_METHOD(TestTerminalFixture, "write_line_char_integration") {
    write_line();
    cout << "Should print A:";
    write_line('A');
}
TEST_CASE_METHOD(TestTerminalFixture, "write_line_empty_integration") {
    write_line();
    cout << "Should print empty line:";
    write_line();
}
TEST_CASE_METHOD(TestTerminalFixture, "write_line_double_integration") {
    write_line();
    cout << "Should print 3.14:";
    write_line(3.14);
}
TEST_CASE_METHOD(TestTerminalFixture, "write_line_int_integration") {
    write_line();
    cout << "Should print 42:";
    write_line(42);
}
TEST_CASE_METHOD(TestTerminalFixture, "write_line_integration") {
    write_line();
    cout << "Should print Test Line:";
    write_line("Test Line");
}
