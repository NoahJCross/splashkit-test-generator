import pytest
from splashkit import *


def test_FreeResourceBundle_integration():
    load_resource_bundle("test", "test.txt")
    assert has_resource_bundle("test") is True
    free_resource_bundle("test")
    assert has_resource_bundle("test") is False


def test_HasResourceBundle_integration():
    load_resource_bundle("test", "test.txt")
    assert has_resource_bundle("test") is True
    free_resource_bundle("test")
    assert has_resource_bundle("test") is False
    assert has_resource_bundle("nonexistent") is False


def test_LoadResourceBundle_integration():
    load_resource_bundle("test_bundle", "test_bundle.txt")
    assert has_resource_bundle("test_bundle") is True
    free_resource_bundle("test_bundle")
    assert has_resource_bundle("test_bundle") is False

