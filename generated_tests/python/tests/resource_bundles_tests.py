import pytest
from splashkit import *


def test_FreeResourceBundle_integration():
    LoadResourceBundle("test", "test.txt")
    assert HasResourceBundle("test") is True
    FreeResourceBundle("test")
    assert HasResourceBundle("test") is False


def test_HasResourceBundle_integration():
    LoadResourceBundle("test", "test.txt")
    assert HasResourceBundle("test") is True
    FreeResourceBundle("test")
    assert HasResourceBundle("test") is False
    assert HasResourceBundle("nonexistent") is False


def test_LoadResourceBundle_integration():
    LoadResourceBundle("test_bundle", "test_bundle.txt")
    assert HasResourceBundle("test_bundle") is True
    FreeResourceBundle("test_bundle")
    assert HasResourceBundle("test_bundle") is False

