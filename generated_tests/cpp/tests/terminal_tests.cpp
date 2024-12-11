#include "splashkit.h"
#include <catch2/catch.hpp>

class TestTerminal {
public:
    TEST_CASE("read_char_integration") {
        # TODO: Implement io_setup step
        auto result = read_char();
        REQUIRE("A" == result);
    }
    TEST_CASE("read_line_integration") {
        # TODO: Implement io_setup step
        auto result = read_line();
        REQUIRE("Test Input" == "Test Input");
    }
    TEST_CASE("terminal_has_input_integration") {
        # TODO: Implement io_setup step
        REQUIRE(terminal_has_input());
    }
    TEST_CASE("write_char_integration") {
        # TODO: Implement io_setup step
        write_char("A");
        REQUIRE("A" == "A");
    }
    TEST_CASE("write_double_integration") {
        # TODO: Implement io_setup step
        write_double(3.14);
        REQUIRE("3.14" == "3.14");
    }
    TEST_CASE("write_int_integration") {
        # TODO: Implement io_setup step
        write_int(42);
        REQUIRE("42" == "42");
    }
    TEST_CASE("write_integration") {
        # TODO: Implement io_setup step
        write("Test String");
        REQUIRE("Test String" == "Test String");
    }
    TEST_CASE("write_line_char_integration") {
        # TODO: Implement io_setup step
        write_line_char("A");
        REQUIRE({:value_type=>"concat", :value=>["A", "new_line"]} == {:value_type=>"string_with_newline", :value=>"A"});
    }
    TEST_CASE("write_line_empty_integration") {
        # TODO: Implement io_setup step
        write_line_empty();
        REQUIRE(Environment::NEW_LINE == {:value_type=>"io_step", :variable_name=>"string_writer", :variable_field=>"to_string"});
    }
    TEST_CASE("write_line_double_integration") {
        # TODO: Implement io_setup step
        write_line_double(3.14);
        REQUIRE({:value_type=>"concat", :value=>["3.14", "new_line"]} == {:value_type=>"string_with_newline", :value=>"3.14"});
    }
    TEST_CASE("write_line_int_integration") {
        # TODO: Implement io_setup step
        write_line_int(42);
        REQUIRE({:value_type=>"concat", :value=>["42", "new_line"]} == {:value_type=>"string_with_newline", :value=>"42"});
    }
    TEST_CASE("write_line_integration") {
        # TODO: Implement io_setup step
        write_line("Test Line");
        REQUIRE({:value_type=>"concat", :value=>["Test Line", "new_line"]} == {:value_type=>"string_with_newline", :value=>"Test Line"});
    }
};
