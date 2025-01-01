#include "splashkit.h"
#include <catch2/catch.hpp>
#include "../helpers.hpp"
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
        cout << "Should print A:";
        write('A');
        write_line();
    }
    TEST_CASE("write_double_integration") {
        cout << "Should print 3.14:";
        write(3.14);
        write_line();
    }
    TEST_CASE("write_int_integration") {
        cout << "Should print 42:";
        write(42);
        write_line();
    }
    TEST_CASE("write_integration") {
        cout << "Should print Test String:";
        write(string("Test String"));
        write_line();
    }
    TEST_CASE("write_line_char_integration") {
        cout << "Should print A:";
        write_line('A');
    }
    TEST_CASE("write_line_empty_integration") {
        cout << "Should print empty line:";
        write_line();
    }
    TEST_CASE("write_line_double_integration") {
        cout << "Should print 3.14:";
        write_line(3.14);
    }
    TEST_CASE("write_line_int_integration") {
        cout << "Should print 42:";
        write_line(42);
    }
    TEST_CASE("write_line_integration") {
        cout << "Should print Test Line:";
        write_line(string("Test Line"));
    }
};
