import pytest
from splashkit import *
from ..helpers import *
import contextlib
class TestTerminal:
    def test_read_char_integration():
        print("Enter the letter A", end="")
        result = read_char()
        assert 'A' == result
        
    def test_read_line_integration():
        print("Enter the text: Test Input", end="")
        result = read_line()
        assert "Test Input" == result
        
    def test_terminal_has_input_integration():
        print("Enter some text: Some Input", end="")
        result = terminal_has_input()
        assert result
        
    def test_write_char_integration():
        print("Should print A:", end="")
        write_char('A')
        write_line_empty()
        
    def test_write_double_integration():
        print("Should print 3.14:", end="")
        write_double(3.14)
        write_line_empty()
        
    def test_write_int_integration():
        print("Should print 42:", end="")
        write_int(42)
        write_line_empty()
        
    def test_write_integration():
        print("Should print Test String:", end="")
        write("Test String")
        write_line_empty()
        
    def test_write_line_char_integration():
        print("Should print A:", end="")
        write_line_char('A')
        
    def test_write_line_empty_integration():
        print("Should print empty line:", end="")
        write_line_empty()
        
    def test_write_line_double_integration():
        print("Should print 3.14:", end="")
        write_line_double(3.14)
        
    def test_write_line_int_integration():
        print("Should print 42:", end="")
        write_line_int(42)
        
    def test_write_line_integration():
        print("Should print Test Line:", end="")
        write_line("Test Line")
        
