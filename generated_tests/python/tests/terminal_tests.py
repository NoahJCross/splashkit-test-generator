import pytest
from splashkit import *


def test_ReadChar_integration():
    Write("Please type a character: ")
    test_char = ReadChar()
    WriteLine("You typed: ", test_char)
    assert test_char is not None


def test_ReadLine_integration():
    Write("Please enter your name: ")
    test_input = ReadLine()
    assert test_input != ""
    WriteLine("You entered: ", test_input)


def test_TerminalHasInput_integration():
    Write("Type something and press Enter: ")
    ProcessEvents()
    assert TerminalHasInput() is False
    test_input = ReadLine()
    ProcessEvents()
    assert TerminalHasInput() is True


def test_WriteChar_integration():
    WriteChar("A")
    assert TerminalHasInput() is True
    test_char = ReadChar()
    assert test_char == "A"


def test_WriteDouble_integration():
    WriteDouble(3.14)
    assert TerminalHasInput() is True


def test_WriteInt_integration():
    WriteInt(42)
    assert TerminalHasInput() is True


def test_Write_integration():
    Write("Test String")
    assert TerminalHasInput() is True
    test_output = ReadLine()
    assert test_output == "Test String"


def test_WriteLineChar_integration():
    WriteLineChar("A")
    assert TerminalHasInput() is True
    test_char = ReadChar()
    assert test_char == "A"


def test_WriteLineEmpty_integration():
    Write("Test line")
    WriteLine()
    Write("Next line")
    assert TerminalHasInput() is True


def test_WriteLineDouble_integration():
    WriteLineDouble(42.5)
    assert TerminalHasInput() is True


def test_WriteLineInt_integration():
    WriteLineInt(42)
    assert TerminalHasInput() is True


def test_WriteLine_integration():
    WriteLine("Test Line")
    assert TerminalHasInput() is True

