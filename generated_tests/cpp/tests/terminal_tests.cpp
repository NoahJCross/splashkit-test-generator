#include "splashkit.h"
#include <catch2/catch.hpp>

TEST_CASE("read_char_integration") {
    write("Please type a character: ");
    auto test_char = read_char();
    write_line("You typed: ", test_char);
    REQUIRE(test_char != nullptr);
}
TEST_CASE("read_line_integration") {
    write("Please enter your name: ");
    auto test_input = read_line();
    REQUIRE(test_input != "");
    write_line("You entered: ", test_input);
}
TEST_CASE("terminal_has_input_integration") {
    write("Type something and press Enter: ");
    process_events();
    REQUIRE_FALSE(terminal_has_input());
    auto test_input = read_line();
    process_events();
    REQUIRE(terminal_has_input());
}
TEST_CASE("write_char_integration") {
    write("A");
    REQUIRE(terminal_has_input());
    auto test_char = read_char();
    REQUIRE(test_char == "A");
}
TEST_CASE("write_double_integration") {
    write(3.14);
    REQUIRE(terminal_has_input());
}
TEST_CASE("write_int_integration") {
    write(42);
    REQUIRE(terminal_has_input());
}
TEST_CASE("write_integration") {
    write("Test String");
    REQUIRE(terminal_has_input());
    auto test_output = read_line();
    REQUIRE(test_output == "Test String");
}
TEST_CASE("write_line_char_integration") {
    write_line("A");
    REQUIRE(terminal_has_input());
    auto test_char = read_char();
    REQUIRE(test_char == "A");
}
TEST_CASE("write_line_empty_integration") {
    write("Test line");
    write_line();
    write("Next line");
    REQUIRE(terminal_has_input());
}
TEST_CASE("write_line_double_integration") {
    write_line(42.5);
    REQUIRE(terminal_has_input());
}
TEST_CASE("write_line_int_integration") {
    write_line(42);
    REQUIRE(terminal_has_input());
}
TEST_CASE("write_line_integration") {
    write_line("Test Line");
    REQUIRE(terminal_has_input());
}
