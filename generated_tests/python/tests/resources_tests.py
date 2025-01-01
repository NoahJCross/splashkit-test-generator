import pytest
from splashkit import *
from ..helpers import *
import contextlib
class TestResources:
    def test_deregister_free_notifier_integration():
        free_notifier = notifier_tracker();
        register_free_notifier(free_notifier.on_free)
        test_bitmap1 = create_bitmap("test_bitmap", 100, 100)
        with bitmap_cleanup():
            free_bitmap(test_bitmap1)
            assert free_notifier.was_notified
            deregister_free_notifier(free_notifier.on_free)
            free_notifier.reset()
            test_bitmap2 = create_bitmap("test_bitmap", 100, 100)
            free_bitmap(test_bitmap2)
            assert not free_notifier.was_notified
            
    def test_path_to_resource_integration():
        set_resources_path("resources")
        image_path = path_to_resource("test_image.png", ResourceKind.ImageResource)
        assert "" != image_path
        
    def test_path_to_resources_integration():
        resource_path = path_to_resources()
        assert len(resource_path) > 0
        set_resources_path("/new/resources")
        new_resource_path = path_to_resources()
        assert "/new/resources" == new_resource_path
        
    def test_path_to_resources_for_kind_integration():
        set_resources_path("resources")
        image_path = path_to_resources_for_kind(ResourceKind.ImageResource)
        assert "resources/images" == image_path
        sound_path = path_to_resources_for_kind(ResourceKind.SoundResource)
        assert "resources/sounds" == sound_path
        
    def test_register_free_notifier_integration():
        free_notifier = notifier_tracker();
        register_free_notifier(free_notifier.on_free)
        test_bitmap = create_bitmap("test_bitmap", 100, 100)
        with bitmap_cleanup():
            free_bitmap(test_bitmap)
            assert free_notifier.was_notified
            deregister_free_notifier(free_notifier.on_free)
            
    def test_set_resources_path_integration():
        set_resources_path("/resources")
        assert "/resources" == path_to_resources()
        set_resources_path("/new/resources")
        assert "/new/resources" == path_to_resources()
        
