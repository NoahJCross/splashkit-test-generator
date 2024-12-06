import pytest
from splashkit import *


def test_ReadChar_integration():
    write("Please type a character: ")
    test_char = read_char()
    write_line("You typed: ", test_char)
    assert test_char is not None


def test_ReadLine_integration():
    write("Please enter your name: ")
    test_input = read_line()
    assert test_input != ""
    write_line("You entered: ", test_input)


def test_TerminalHasInput_integration():
    write("Type something and press Enter: ")
    process_events()
    assert terminal_has_input() is False
    test_input = read_line()
    process_events()
    assert terminal_has_input() is True


def test_WriteChar_integration():
    write_char("A")
    assert terminal_has_input() is True
    test_char = read_char()
    assert test_char == "A"


def test_WriteDouble_integration():
    write_double(3.14)
    assert terminal_has_input() is True


def test_WriteInt_integration():
    write_int(42)
    assert terminal_has_input() is True


def test_Write_integration():
    write("Test String")
    assert terminal_has_input() is True
    test_output = read_line()
    assert test_output == "Test String"


def test_WriteLineChar_integration():
    write_line_char("A")
    assert terminal_has_input() is True
    test_char = read_char()
    assert test_char == "A"


def test_WriteLineEmpty_integration():
    write("Test line")
    write_line()
    write("Next line")
    assert terminal_has_input() is True


def test_WriteLineDouble_integration():
    write_line_double(42.5)
    assert terminal_has_input() is True


def test_WriteLineInt_integration():
    write_line_int(42)
    assert terminal_has_input() is True


def test_WriteLine_integration():
    write_line("Test Line")
    assert terminal_has_input() is True

