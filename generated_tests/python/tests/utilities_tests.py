import pytest
from splashkit import *


def test_Contains_integration():
    test_result = Contains("SplashKit is awesome", "awesome")
    assert test_result is True
    test_result = Contains("SplashKit is awesome", "unreal")
    assert test_result is False


def test_ConvertToDouble_integration():
    test_result = ConvertToDouble("123.456")
    assert test_result == 123.456
    test_result = ConvertToDouble("-123.456")
    assert test_result == -123.456
    test_result = ConvertToDouble("invalid")
    assert test_result is None


def test_ConvertToInteger_integration():
    test_result = ConvertToInteger("123")
    assert test_result == 123
    test_result = ConvertToInteger("-456")
    assert test_result == -456
    test_result = ConvertToInteger("123.456")
    assert test_result == 123
    test_result = ConvertToInteger("abc")
    with pytest.raises(Exception):
        ConvertToInteger("abc")


def test_IndexOf_integration():
    test_result = IndexOf("splashkit library", "library")
    assert test_result == 10
    test_result = IndexOf("splashkit library", "unreal")
    assert test_result == -1


def test_IsDouble_integration():
    test_result = IsDouble("123.456")
    assert test_result is True
    test_result = IsDouble("123")
    assert test_result is True
    test_result = IsDouble("-123.456")
    assert test_result is True
    test_result = IsDouble("SplashKit")
    assert test_result is False
    test_result = IsDouble("")
    assert test_result is False


def test_IsInteger_integration():
    test_result = IsInteger("123")
    assert test_result is True
    test_result = IsInteger("123.456")
    assert test_result is False
    test_result = IsInteger("-123")
    assert test_result is True
    test_result = IsInteger("SplashKit")
    assert test_result is False
    test_result = IsInteger("")
    assert test_result is False


def test_IsNumber_integration():
    test_result = IsNumber("123.456")
    assert test_result is True
    test_result = IsNumber("abc")
    assert test_result is False


def test_LengthOf_integration():
    test_length = LengthOf("SplashKit")
    assert test_length == 9
    test_length_empty = LengthOf("")
    assert test_length_empty == 0


def test_ReplaceAll_integration():
    test_result = ReplaceAll("hello world", "world", "SplashKit")
    assert test_result == "hello SplashKit"
    test_result = ReplaceAll("aaaa", "a", "b")
    assert test_result == "bbbb"
    test_result = ReplaceAll("test", "t", "")
    assert test_result == "es"


def test_Split_integration():
    test_result = Split("splashkit library", " ")
    assert LengthOf(test_result) == 2
    assert IndexOf(test_result, "splashkit") == 0
    assert IndexOf(test_result, "library") == 0


def test_ToLowercase_integration():
    test_lowercase = ToLowercase("SPLASHKIT")
    assert test_lowercase == "splashkit"
    test_empty = ToLowercase("")
    assert test_empty == ""


def test_ToUppercase_integration():
    test_uppercase = ToUppercase("hello")
    assert test_uppercase == "HELLO"


def test_Trim_integration():
    test_trimmed = Trim("  Hello, World!  ")
    assert test_trimmed == "Hello, World!"
    test_empty_trimmed = Trim(" \t\n  ")
    assert test_empty_trimmed == ""


def test_RndRange_integration():
    test_result = RndRange(1, 10)
    assert 1 <= test_result <= 10


def test_Rnd_integration():
    test_random = Rnd()
    assert test_random > 0.0
    assert test_random < 1.0


def test_RndInt_integration():
    test_result = RndInt(10)
    assert 0 <= test_result <= 10


def test_CurrentTicks_integration():
    test_ticks = CurrentTicks()
    assert test_ticks > 0


def test_Delay_integration():
    test_start_time = CurrentTicks()
    Delay(1000)
    test_end_time = CurrentTicks()
    assert CurrentTicks() > test_start_time
    assert test_start_time <= CurrentTicks() <= 1100


def test_DisplayDialog_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_font = LoadFont("test_font", "path/to/font.ttf")
    DisplayDialog("Test Title", "This is a test message.", test_font, 12)
    FreeFont(test_font)
    CloseWindow(test_window)


def test_FileAsString_integration():
    test_file_content = FileAsString("test_file.txt", ResourceKind.BundleResource)
    assert test_file_content != ""

