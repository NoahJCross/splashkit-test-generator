import pytest
from splashkit import *

class TestResourceBundles:

def test_free_resource_bundle_integration():
    load_resource_bundle("test", "test.txt")
    assert has_resource_bundle("test")
    assert has_bitmap("FrogBmp")
    assert has_font("hara")
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
    assert has_font("hara")
    assert has_sound_effect("error")
    assert has_timer_named("my timer")
    assert has_resource_bundle("blah")
    free_resource_bundle("test")
    assert not has_resource_bundle("test_bundle")

