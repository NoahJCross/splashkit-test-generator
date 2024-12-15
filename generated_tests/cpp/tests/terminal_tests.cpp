#include "splashkit.h"
#include <catch2/catch.hpp>

class TestTerminal {
public:
    TEST_CASE("read_char_integration") {
        cout << "Enter the letter A";
        auto result = read_char();
        REQUIRE('A' == result);
    }
    TEST_CASE("read_line_integration") {
        cout << "Enter the text: Test Input";
        auto result = read_line();
        REQUIRE(string("Test Input") == result);
    }
    TEST_CASE("terminal_has_input_integration") {
        cout << "Enter some text: Some Input";
        auto result = terminal_has_input();
        REQUIRE(result);
    }
    TEST_CASE("write_char_integration") {
        write('A');
    }
    TEST_CASE("write_double_integration") {
        write(3.14);
    }
    TEST_CASE("write_int_integration") {
        write(42);
    }
    TEST_CASE("write_integration") {
        write(string("Test String"));
    }
    TEST_CASE("write_line_char_integration") {
        write_line('A');
    }
    TEST_CASE("write_line_empty_integration") {
        write_line();
    }
    TEST_CASE("write_line_double_integration") {
        write_line(3.14);
    }
    TEST_CASE("write_line_int_integration") {
        write_line(42);
    }
    TEST_CASE("write_line_integration") {
        write_line(string("Test Line"));
    }
};
