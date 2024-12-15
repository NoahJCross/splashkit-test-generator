import pytest
from splashkit import *

class TestUtilities:

def test_contains_integration():
    assert contains("splashkit library", "splashkit")
    assert contains("splashkit library", "library")
    assert contains("splashkit library", "it lib")
    assert contains("splashkit library", "")
    assert not contains("splashkit library", "unreal")
    assert not contains("", "splashkit")


def test_convert_to_double_integration():
    assert 123.0 == convert_to_double("123")
    assert 123.456 == convert_to_double("123.456")
    assert -123.0 == convert_to_double("-123")
    assert -123.456 == convert_to_double("-123.456")
    assert 0.456 == convert_to_double(".456")
    assert 123.0 == convert_to_double("123.")
    assert 123.456 == convert_to_double("000123.456")
    assert 123.456 == convert_to_double("123.456000")
    assert float('inf') == convert_to_double("inf")
    assert float('-inf') == convert_to_double("-inf")
    assert 123.0 == convert_to_double("1.23e2")


def test_convert_to_integer_integration():
    assert 123 == convert_to_integer("123")
    assert 123 == convert_to_integer("123.456")
    assert -123 == convert_to_integer("-123")
    assert -123 == convert_to_integer("-123.456")
    assert 123 == convert_to_integer("123.")
    assert 123 == convert_to_integer("000123.456")
    assert 123 == convert_to_integer("123.456000")


def test_index_of_integration():
    assert 0 == index_of("splashkit library", "splashkit")
    assert 10 == index_of("splashkit library", "library")
    assert 7 == index_of("splashkit library", "it lib")
    assert -1 == index_of("splashkit library", "unreal")
    assert 0 == index_of("splashkit library", "splashkit library")
    assert -1 == index_of("splashkit library", "splashkit library is the best")
    assert 0 == index_of("splashkit library", "")
    assert -1 == index_of("", "splashkit")
    assert 0 == index_of("", "")


def test_is_double_integration():
    assert is_double("123.456")
    assert is_double("123")
    assert is_double("-123.456")
    assert is_double("-123")
    assert is_double("123.")
    assert is_double("000123.456")
    assert is_double("123.456000")
    assert not is_double(".456")
    assert not is_double("SplashKit")
    assert not is_double("")


def test_is_integer_integration():
    assert is_integer("123")
    assert is_integer("-123")
    assert not is_integer("123.456")
    assert not is_integer("-123.456")
    assert not is_integer(".456")
    assert not is_integer("SplashKit")
    assert not is_integer("")


def test_is_number_integration():
    assert is_number("123")
    assert is_number("123.456")
    assert is_number("-123")
    assert is_number("-123.456")
    assert not is_number("SplashKit")
    assert not is_number("")


def test_length_of_integration():
    assert 9 == length_of("splashkit")
    assert 0 == length_of("")


def test_replace_all_integration():
    assert "SK library" == replace_all("splashkit library", "splashkit", "SK")
    assert "splashkit lib" == replace_all("splashkit library", "library", "lib")
    assert "splashkitlibrary" == replace_all("splashkit library", "it lib", "itlib")
    assert "splashkit library" == replace_all("splashkit library", "unreal", "tournament")
    assert "SK" == replace_all("splashkit library", "splashkit library", "SK")
    assert " library" == replace_all("splashkit library", "splashkit", "")
    assert "splashkit library" == replace_all("splashkit library", "", "SK")
    assert "" == replace_all("", "", "SK")


def test_split_integration():
    result = split("splashkit library", ' ')
    assert ["splashkit", "library"] == result
    assert [""] == split("", ' ')
    assert ["splashkit library"] == split("splashkit library", ',')
    assert ["", "splashkit library"] == split(",splashkit library", ',')
    assert ["splashkit library", ""] == split("splashkit library,", ',')
    assert ["", "splashkit library", ""] == split(",splashkit library,", ',')
    assert ["splashkit", "", "library"] == split("splashkit,,library", ',')


def test_to_lowercase_integration():
    assert "splashkit" == to_lowercase("SPLASHKIT")
    assert "" == to_lowercase("")
    assert "splashkit" == to_lowercase("splashkit")
    assert "splashkit" == to_lowercase("SpLaShKiT")


def test_to_uppercase_integration():
    assert "SPLASHKIT" == to_uppercase("splashkit")
    assert "" == to_uppercase("")
    assert "SPLASHKIT" == to_uppercase("SPLASHKIT")
    assert "SPLASHKIT" == to_uppercase("SpLaShKiT")


def test_trim_integration():
    assert "splashkit" == trim("  splashkit")
    assert "splashkit" == trim("splashkit  ")
    assert "splashkit" == trim("  splashkit  ")
    assert "splashkit" == trim("splashkit")
    assert "" == trim("")


def test_rnd_range_integration():
    assert -1 <= rnd_range(-1, 5) <= 5
    assert 1 == rnd_range(1, 1)
    assert 1 <= rnd_range(5, 1) <= 5


def test_rnd_integration():
    assert 0.0 <= rnd() <= 3.4028235e+38


def test_rnd_int_integration():
    assert 0 <= rnd_int(1) <= 1
    assert 0 <= rnd_int(10) <= 10
    assert 0 == rnd_int(-1)
    assert 0 == rnd_int(0)


def test_current_ticks_integration():
    test_ticks = current_ticks()
    assert test_ticks > 0


def test_delay_integration():
    test_timer = create_timer("test_timer")
    start_timer(test_timer)
    initial_ticks = timer_ticks(test_timer)
    delay(200)
    assert initial_ticks + 200 < timer_ticks(test_timer)


def test_display_dialog_integration():
    test_window = open_window("Test Window", 800, 600)
    test_font = load_font("test_font", "hara.ttf")
    display_dialog("Test Dialog", "This is a test message", test_font, 20)
    free_font(test_font)
    close_window(test_window)


def test_file_as_string_integration():
    assert "BITMAP,ufo,ufo.png
    " == file_as_string("blah.txt", ResourceKind.BundleResource)
    assert "" == file_as_string("", ResourceKind.BundleResource)
    assert "" == file_as_string("invalid.txt", ResourceKind.BundleResource)

