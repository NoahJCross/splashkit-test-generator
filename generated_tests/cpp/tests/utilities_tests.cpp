#include "splashkit.h"
#include <catch2/catch.hpp>

class TestUtilities {
public:
    TEST_CASE("contains_integration") {
        REQUIRE(contains("splashkit library", "splashkit"));
        REQUIRE(contains("splashkit library", "library"));
        REQUIRE(contains("splashkit library", "it lib"));
        REQUIRE(contains("splashkit library", ""));
        REQUIRE_FALSE(contains("splashkit library", "unreal"));
        REQUIRE_FALSE(contains("", "splashkit"));
    }
    TEST_CASE("convert_to_double_integration") {
        REQUIRE(123.0 == convert_to_double("123"));
        REQUIRE(123.456 == convert_to_double("123.456"));
        REQUIRE(-123.0 == convert_to_double("-123"));
        REQUIRE(-123.456 == convert_to_double("-123.456"));
        REQUIRE(0.456 == convert_to_double(".456"));
        REQUIRE(123.0 == convert_to_double("123."));
        REQUIRE(123.456 == convert_to_double("000123.456"));
        REQUIRE(123.456 == convert_to_double("123.456000"));
        REQUIRE(numeric_limits<double>::infinity() == convert_to_double("inf"));
        REQUIRE(-numeric_limits<double>::infinity() == convert_to_double("-inf"));
        REQUIRE(123.0 == convert_to_double("1.23e2"));
    }
    TEST_CASE("convert_to_integer_integration") {
        REQUIRE(123 == convert_to_integer("123"));
        REQUIRE(123 == convert_to_integer("123.456"));
        REQUIRE(-123 == convert_to_integer("-123"));
        REQUIRE(-123 == convert_to_integer("-123.456"));
        REQUIRE(123 == convert_to_integer("123."));
        REQUIRE(123 == convert_to_integer("000123.456"));
        REQUIRE(123 == convert_to_integer("123.456000"));
    }
    TEST_CASE("index_of_integration") {
        REQUIRE(0 == index_of("splashkit library", "splashkit"));
        REQUIRE(10 == index_of("splashkit library", "library"));
        REQUIRE(7 == index_of("splashkit library", "it lib"));
        REQUIRE(-1 == index_of("splashkit library", "unreal"));
        REQUIRE(0 == index_of("splashkit library", "splashkit library"));
        REQUIRE(-1 == index_of("splashkit library", "splashkit library is the best"));
        REQUIRE(0 == index_of("splashkit library", ""));
        REQUIRE(-1 == index_of("", "splashkit"));
        REQUIRE(0 == index_of("", ""));
    }
    TEST_CASE("is_double_integration") {
        REQUIRE(is_double("123.456"));
        REQUIRE(is_double("123"));
        REQUIRE(is_double("-123.456"));
        REQUIRE(is_double("-123"));
        REQUIRE(is_double("123."));
        REQUIRE(is_double("000123.456"));
        REQUIRE(is_double("123.456000"));
        REQUIRE_FALSE(is_double(".456"));
        REQUIRE_FALSE(is_double("SplashKit"));
        REQUIRE_FALSE(is_double(""));
    }
    TEST_CASE("is_integer_integration") {
        REQUIRE(is_integer("123"));
        REQUIRE(is_integer("-123"));
        REQUIRE_FALSE(is_integer("123.456"));
        REQUIRE_FALSE(is_integer("-123.456"));
        REQUIRE_FALSE(is_integer(".456"));
        REQUIRE_FALSE(is_integer("SplashKit"));
        REQUIRE_FALSE(is_integer(""));
    }
    TEST_CASE("is_number_integration") {
        REQUIRE(is_number("123"));
        REQUIRE(is_number("123.456"));
        REQUIRE(is_number("-123"));
        REQUIRE(is_number("-123.456"));
        REQUIRE_FALSE(is_number("SplashKit"));
        REQUIRE_FALSE(is_number(""));
    }
    TEST_CASE("length_of_integration") {
        REQUIRE(9 == length_of("splashkit"));
        REQUIRE(0 == length_of(""));
    }
    TEST_CASE("replace_all_integration") {
        REQUIRE("SK library" == replace_all("splashkit library", "splashkit", "SK"));
        REQUIRE("splashkit lib" == replace_all("splashkit library", "library", "lib"));
        REQUIRE("splashkitlibrary" == replace_all("splashkit library", "it lib", "itlib"));
        REQUIRE("splashkit library" == replace_all("splashkit library", "unreal", "tournament"));
        REQUIRE("SK" == replace_all("splashkit library", "splashkit library", "SK"));
        REQUIRE(" library" == replace_all("splashkit library", "splashkit", ""));
        REQUIRE("splashkit library" == replace_all("splashkit library", "", "SK"));
        REQUIRE("" == replace_all("", "", "SK"));
    }
    TEST_CASE("split_integration") {
        auto result = split("splashkit library", ' ');
        REQUIRE(vector<string> { "splashkit", "library" } == result);
        REQUIRE(vector<string> { "" } == split("", ' '));
        REQUIRE(vector<string> { "splashkit library" } == split("splashkit library", ','));
        REQUIRE(vector<string> { "", "splashkit library" } == split(",splashkit library", ','));
        REQUIRE(vector<string> { "splashkit library", "" } == split("splashkit library,", ','));
        REQUIRE(vector<string> { "", "splashkit library", "" } == split(",splashkit library,", ','));
        REQUIRE(vector<string> { "splashkit", "", "library" } == split("splashkit,,library", ','));
    }
    TEST_CASE("to_lowercase_integration") {
        REQUIRE("splashkit" == to_lowercase("SPLASHKIT"));
        REQUIRE("" == to_lowercase(""));
        REQUIRE("splashkit" == to_lowercase("splashkit"));
        REQUIRE("splashkit" == to_lowercase("SpLaShKiT"));
    }
    TEST_CASE("to_uppercase_integration") {
        REQUIRE("SPLASHKIT" == to_uppercase("splashkit"));
        REQUIRE("" == to_uppercase(""));
        REQUIRE("SPLASHKIT" == to_uppercase("SPLASHKIT"));
        REQUIRE("SPLASHKIT" == to_uppercase("SpLaShKiT"));
    }
    TEST_CASE("trim_integration") {
        REQUIRE("splashkit" == trim("  splashkit"));
        REQUIRE("splashkit" == trim("splashkit  "));
        REQUIRE("splashkit" == trim("  splashkit  "));
        REQUIRE("splashkit" == trim("splashkit"));
        REQUIRE("" == trim(""));
    }
    TEST_CASE("rnd_range_integration") {
        REQUIRE(rnd(-1, 5) >= -1 && rnd(-1, 5) <= 5);
        REQUIRE(1 == rnd(1, 1));
        REQUIRE(rnd(5, 1) >= 1 && rnd(5, 1) <= 5);
    }
    TEST_CASE("rnd_integration") {
        REQUIRE(rnd() >= 0.0 && rnd() <= numeric_limits<float>::max());
    }
    TEST_CASE("rnd_int_integration") {
        REQUIRE(rnd(1) >= 0 && rnd(1) <= 1);
        REQUIRE(rnd(10) >= 0 && rnd(10) <= 10);
        REQUIRE(0 == rnd(-1));
        REQUIRE(0 == rnd(0));
    }
    TEST_CASE("current_ticks_integration") {
        auto test_ticks = current_ticks();
        REQUIRE(test_ticks > 0);
    }
    TEST_CASE("delay_integration") {
        auto test_timer = create_timer("test_timer");
        start_timer(test_timer);
        auto initial_ticks = timer_ticks(test_timer);
        delay(200);
        REQUIRE(initial_ticks + 200 < timer_ticks(test_timer));
    }
    TEST_CASE("display_dialog_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        auto test_font = load_font("test_font", "hara.ttf");
        display_dialog("Test Dialog", "This is a test message", test_font, 20);
        free_font(test_font);
        close_window(test_window);
    }
    TEST_CASE("file_as_string_integration") {
        REQUIRE("BITMAP,ufo,ufo.png\n" == file_as_string("blah.txt", ResourceKind::BUNDLE_RESOURCE));
        REQUIRE("" == file_as_string("", ResourceKind::BUNDLE_RESOURCE));
        REQUIRE("" == file_as_string("invalid.txt", ResourceKind::BUNDLE_RESOURCE));
    }
};
