#include "splashkit.h"
#include <catch2/catch.hpp>

TEST_CASE("contains_integration") {
    auto test_result = contains("SplashKit is awesome", "awesome");
    REQUIRE(test_result);
    auto test_result = contains("SplashKit is awesome", "unreal");
    REQUIRE_FALSE(test_result);
}
TEST_CASE("convert_to_double_integration") {
    auto test_result = convert_to_double("123.456");
    REQUIRE(test_result == 123.456);
    auto test_result = convert_to_double("-123.456");
    REQUIRE(test_result == -123.456);
    auto test_result = convert_to_double("invalid");
    REQUIRE(test_result == nullptr);
}
TEST_CASE("convert_to_integer_integration") {
    auto test_result = convert_to_integer("123");
    REQUIRE(test_result == 123);
    auto test_result = convert_to_integer("-456");
    REQUIRE(test_result == -456);
    auto test_result = convert_to_integer("123.456");
    REQUIRE(test_result == 123);
    auto test_result = convert_to_integer("abc");
    REQUIRE_THROWS_AS(convert_to_integer("abc"), std::exception);
}
TEST_CASE("index_of_integration") {
    auto test_result = index_of("splashkit library", "library");
    REQUIRE(test_result == 10);
    auto test_result = index_of("splashkit library", "unreal");
    REQUIRE(test_result == -1);
}
TEST_CASE("is_double_integration") {
    auto test_result = is_double("123.456");
    REQUIRE(test_result);
    auto test_result = is_double("123");
    REQUIRE(test_result);
    auto test_result = is_double("-123.456");
    REQUIRE(test_result);
    auto test_result = is_double("SplashKit");
    REQUIRE_FALSE(test_result);
    auto test_result = is_double("");
    REQUIRE_FALSE(test_result);
}
TEST_CASE("is_integer_integration") {
    auto test_result = is_integer("123");
    REQUIRE(test_result);
    auto test_result = is_integer("123.456");
    REQUIRE_FALSE(test_result);
    auto test_result = is_integer("-123");
    REQUIRE(test_result);
    auto test_result = is_integer("SplashKit");
    REQUIRE_FALSE(test_result);
    auto test_result = is_integer("");
    REQUIRE_FALSE(test_result);
}
TEST_CASE("is_number_integration") {
    auto test_result = is_number("123.456");
    REQUIRE(test_result);
    auto test_result = is_number("abc");
    REQUIRE_FALSE(test_result);
}
TEST_CASE("length_of_integration") {
    auto test_length = length_of("SplashKit");
    REQUIRE(test_length == 9);
    auto test_length_empty = length_of("");
    REQUIRE(test_length_empty == 0);
}
TEST_CASE("replace_all_integration") {
    auto test_result = replace_all("hello world", "world", "SplashKit");
    REQUIRE(test_result == "hello SplashKit");
    auto test_result = replace_all("aaaa", "a", "b");
    REQUIRE(test_result == "bbbb");
    auto test_result = replace_all("test", "t", "");
    REQUIRE(test_result == "es");
}
TEST_CASE("split_integration") {
    auto test_result = split("splashkit library", " ");
    REQUIRE(length_of(test_result) == 2);
    REQUIRE(index_of(test_result, "splashkit") == 0);
    REQUIRE(index_of(test_result, "library") == 0);
}
TEST_CASE("to_lowercase_integration") {
    auto test_lowercase = to_lowercase("SPLASHKIT");
    REQUIRE(test_lowercase == "splashkit");
    auto test_empty = to_lowercase("");
    REQUIRE(test_empty == "");
}
TEST_CASE("to_uppercase_integration") {
    auto test_uppercase = to_uppercase("hello");
    REQUIRE(test_uppercase == "HELLO");
}
TEST_CASE("trim_integration") {
    auto test_trimmed = trim("  Hello, World!  ");
    REQUIRE(test_trimmed == "Hello, World!");
    auto test_empty_trimmed = trim(" \t\n  ");
    REQUIRE(test_empty_trimmed == "");
}
TEST_CASE("rnd_range_integration") {
    auto test_result = rnd(1, 10);
    REQUIRE(test_result >= 1 && test_result <= 10);
}
TEST_CASE("rnd_integration") {
    auto test_random = rnd();
    REQUIRE(test_random > 0.0);
    REQUIRE(test_random < 1.0);
}
TEST_CASE("rnd_int_integration") {
    auto test_result = rnd(10);
    REQUIRE(test_result >= 0 && test_result <= 10);
}
TEST_CASE("current_ticks_integration") {
    auto test_ticks = current_ticks();
    REQUIRE(test_ticks > 0);
}
TEST_CASE("delay_integration") {
    auto test_start_time = current_ticks();
    delay(1000);
    auto test_end_time = current_ticks();
    REQUIRE(current_ticks() > test_start_time);
    REQUIRE(current_ticks() >= test_start_time && current_ticks() <= 1100);
}
TEST_CASE("display_dialog_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_font = load_font("test_font", "path/to/font.ttf");
    display_dialog("Test Title", "This is a test message.", test_font, 12);
    free_font(test_font);
    close_window(test_window);
}
TEST_CASE("file_as_string_integration") {
    auto test_file_content = file_as_string("test_file.txt", ResourceKind::BUNDLE_RESOURCE);
    REQUIRE(test_file_content != "");
}
