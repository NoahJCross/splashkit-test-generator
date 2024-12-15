import pytest
from splashkit import *

class TestResourceBundles:

def test_free_resource_bundle_integration():
    load_resource_bundle("test", "test.txt")
    assert has_resource_bundle("test")
    assert has_bitmap("FrogBmp")
    assert has_font_name_as_string("hara")
    free_resource_bundle("test")
    assert not has_resource_bundle("test")


def test_has_resource_bundle_integration():
    load_resource_bundle("test", "test.txt")
    assert has_resource_bundle("test")
    free_resource_bundle("test")
    assert not has_resource_bundle("test")
    assert not has_resource_bundle("nonexistent")


def test_load_resource_bundle_integration():
    load_resource_bundle("test", "test.txt")
    assert has_resource_bundle("test")
    assert has_animation_script("WalkingScript")
    assert has_bitmap("FrogBmp")
    assert has_font_name_as_string("hara")
    assert has_sound_effect("error")
    assert has_timer__named("my timer")
    assert has_resource_bundle("blah")
    free_resource_bundle("test")
    assert not has_resource_bundle("test_bundle")

