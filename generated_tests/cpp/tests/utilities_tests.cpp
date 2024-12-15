#include "splashkit.h"
#include <catch2/catch.hpp>

class TestUtilities {
public:
    TEST_CASE("contains_integration") {
        REQUIRE(contains(string("splashkit library"), string("splashkit")));
        REQUIRE(contains(string("splashkit library"), string("library")));
        REQUIRE(contains(string("splashkit library"), string("it lib")));
        REQUIRE(contains(string("splashkit library"), string("")));
        REQUIRE_FALSE(contains(string("splashkit library"), string("unreal")));
        REQUIRE_FALSE(contains(string(""), string("splashkit")));
    }
    TEST_CASE("convert_to_double_integration") {
        REQUIRE(123.0 == convert_to_double(string("123")));
        REQUIRE(123.456 == convert_to_double(string("123.456")));
        REQUIRE(-123.0 == convert_to_double(string("-123")));
        REQUIRE(-123.456 == convert_to_double(string("-123.456")));
        REQUIRE(0.456 == convert_to_double(string(".456")));
        REQUIRE(123.0 == convert_to_double(string("123.")));
        REQUIRE(123.456 == convert_to_double(string("000123.456")));
        REQUIRE(123.456 == convert_to_double(string("123.456000")));
        REQUIRE(numeric_limits<double>::infinity() == convert_to_double(string("inf")));
        REQUIRE(-numeric_limits<double>::infinity() == convert_to_double(string("-inf")));
        REQUIRE(123.0 == convert_to_double(string("1.23e2")));
    }
    TEST_CASE("convert_to_integer_integration") {
        REQUIRE(123 == convert_to_integer(string("123")));
        REQUIRE(123 == convert_to_integer(string("123.456")));
        REQUIRE(-123 == convert_to_integer(string("-123")));
        REQUIRE(-123 == convert_to_integer(string("-123.456")));
        REQUIRE(123 == convert_to_integer(string("123.")));
        REQUIRE(123 == convert_to_integer(string("000123.456")));
        REQUIRE(123 == convert_to_integer(string("123.456000")));
    }
    TEST_CASE("index_of_integration") {
        REQUIRE(0 == index_of(string("splashkit library"), string("splashkit")));
        REQUIRE(10 == index_of(string("splashkit library"), string("library")));
        REQUIRE(7 == index_of(string("splashkit library"), string("it lib")));
        REQUIRE(-1 == index_of(string("splashkit library"), string("unreal")));
        REQUIRE(0 == index_of(string("splashkit library"), string("splashkit library")));
        REQUIRE(-1 == index_of(string("splashkit library"), string("splashkit library is the best")));
        REQUIRE(0 == index_of(string("splashkit library"), string("")));
        REQUIRE(-1 == index_of(string(""), string("splashkit")));
        REQUIRE(0 == index_of(string(""), string("")));
    }
    TEST_CASE("is_double_integration") {
        REQUIRE(is_double(string("123.456")));
        REQUIRE(is_double(string("123")));
        REQUIRE(is_double(string("-123.456")));
        REQUIRE(is_double(string("-123")));
        REQUIRE(is_double(string("123.")));
        REQUIRE(is_double(string("000123.456")));
        REQUIRE(is_double(string("123.456000")));
        REQUIRE_FALSE(is_double(string(".456")));
        REQUIRE_FALSE(is_double(string("SplashKit")));
        REQUIRE_FALSE(is_double(string("")));
    }
    TEST_CASE("is_integer_integration") {
        REQUIRE(is_integer(string("123")));
        REQUIRE(is_integer(string("-123")));
        REQUIRE_FALSE(is_integer(string("123.456")));
        REQUIRE_FALSE(is_integer(string("-123.456")));
        REQUIRE_FALSE(is_integer(string(".456")));
        REQUIRE_FALSE(is_integer(string("SplashKit")));
        REQUIRE_FALSE(is_integer(string("")));
    }
    TEST_CASE("is_number_integration") {
        REQUIRE(is_number(string("123")));
        REQUIRE(is_number(string("123.456")));
        REQUIRE(is_number(string("-123")));
        REQUIRE(is_number(string("-123.456")));
        REQUIRE_FALSE(is_number(string("SplashKit")));
        REQUIRE_FALSE(is_number(string("")));
    }
    TEST_CASE("length_of_integration") {
        REQUIRE(9 == length_of(string("splashkit")));
        REQUIRE(0 == length_of(string("")));
    }
    TEST_CASE("replace_all_integration") {
        REQUIRE(string("SK library") == replace_all(string("splashkit library"), string("splashkit"), string("SK")));
        REQUIRE(string("splashkit lib") == replace_all(string("splashkit library"), string("library"), string("lib")));
        REQUIRE(string("splashkitlibrary") == replace_all(string("splashkit library"), string("it lib"), string("itlib")));
        REQUIRE(string("splashkit library") == replace_all(string("splashkit library"), string("unreal"), string("tournament")));
        REQUIRE(string("SK") == replace_all(string("splashkit library"), string("splashkit library"), string("SK")));
        REQUIRE(string(" library") == replace_all(string("splashkit library"), string("splashkit"), string("")));
        REQUIRE(string("splashkit library") == replace_all(string("splashkit library"), string(""), string("SK")));
        REQUIRE(string("") == replace_all(string(""), string(""), string("SK")));
    }
    TEST_CASE("split_integration") {
        auto result = split(string("splashkit library"), ' ');
        REQUIRE(vector<string> { string("splashkit"), string("library") } == result);
        REQUIRE(vector<string> { string("") } == split(string(""), ' '));
        REQUIRE(vector<string> { string("splashkit library") } == split(string("splashkit library"), ','));
        REQUIRE(vector<string> { string(""), string("splashkit library") } == split(string(",splashkit library"), ','));
        REQUIRE(vector<string> { string("splashkit library"), string("") } == split(string("splashkit library,"), ','));
        REQUIRE(vector<string> { string(""), string("splashkit library"), string("") } == split(string(",splashkit library,"), ','));
        REQUIRE(vector<string> { string("splashkit"), string(""), string("library") } == split(string("splashkit,,library"), ','));
    }
    TEST_CASE("to_lowercase_integration") {
        REQUIRE(string("splashkit") == to_lowercase(string("SPLASHKIT")));
        REQUIRE(string("") == to_lowercase(string("")));
        REQUIRE(string("splashkit") == to_lowercase(string("splashkit")));
        REQUIRE(string("splashkit") == to_lowercase(string("SpLaShKiT")));
    }
    TEST_CASE("to_uppercase_integration") {
        REQUIRE(string("SPLASHKIT") == to_uppercase(string("splashkit")));
        REQUIRE(string("") == to_uppercase(string("")));
        REQUIRE(string("SPLASHKIT") == to_uppercase(string("SPLASHKIT")));
        REQUIRE(string("SPLASHKIT") == to_uppercase(string("SpLaShKiT")));
    }
    TEST_CASE("trim_integration") {
        REQUIRE(string("splashkit") == trim(string("  splashkit")));
        REQUIRE(string("splashkit") == trim(string("splashkit  ")));
        REQUIRE(string("splashkit") == trim(string("  splashkit  ")));
        REQUIRE(string("splashkit") == trim(string("splashkit")));
        REQUIRE(string("") == trim(string("")));
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
        auto test_timer = create_timer(string("test_timer"));
        start_timer(test_timer);
        auto initial_ticks = timer_ticks(test_timer);
        delay(200);
        REQUIRE(initial_ticks + 200 < timer_ticks(test_timer));
    }
    TEST_CASE("display_dialog_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        auto test_font = load_font(string("test_font"), string("hara.ttf"));
        display_dialog(string("Test Dialog"), string("This is a test message"), test_font, 20);
        free_font(test_font);
        close_window(test_window);
    }
    TEST_CASE("file_as_string_integration") {
        REQUIRE(string("BITMAP,ufo,ufo.png
        ") == file_as_string(string("blah.txt"), ResourceKind::BUNDLE_RESOURCE));
        REQUIRE(string("") == file_as_string(string(""), ResourceKind::BUNDLE_RESOURCE));
        REQUIRE(string("") == file_as_string(string("invalid.txt"), ResourceKind::BUNDLE_RESOURCE));
    }
};
