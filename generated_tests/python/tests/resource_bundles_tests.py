import pytest
from splashkit import *
from ..helpers import *
import contextlib
class TestResourceBundles:
    def setup_method(self):
        set_resources_path("/mnt/c/Users/Noahc/Documents/aYear_2_semester_2/TeamProject/GitHubRepo/splashkit_test_generator/resources")

    def test_free_resource_bundle_integration():
        load_resource_bundle("test_resource_bundle", "test.txt")
        with resource_cleanup("test_resource_bundle"):
            assert has_resource_bundle("test_resource_bundle")
            assert has_bitmap("FrogBmp")
            assert has_font_name_as_string("hara")
            free_resource_bundle("test_resource_bundle")
            assert not has_resource_bundle("test_resource_bundle")
            
    def test_has_resource_bundle_integration():
        load_resource_bundle("test_resource_bundle", "test.txt")
        with resource_cleanup("test_resource_bundle"):
            assert has_resource_bundle("test_resource_bundle")
            free_resource_bundle("test_resource_bundle")
            assert not has_resource_bundle("test_resource_bundle")
            assert not has_resource_bundle("nonexistent")
            
    def test_load_resource_bundle_integration():
        load_resource_bundle("test_resource_bundle", "test.txt")
        with resource_cleanup("test_resource_bundle"):
            assert has_resource_bundle("test_resource_bundle")
            assert has_animation_script("WalkingScript")
            assert has_bitmap("FrogBmp")
            assert has_font_name_as_string("hara")
            assert has_sound_effect("error")
            assert has_timer__named("my timer")
            assert has_resource_bundle("blah")
            free_resource_bundle("test_resource_bundle")
            assert not has_resource_bundle("test_bundle")
            
