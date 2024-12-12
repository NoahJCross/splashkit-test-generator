import pytest
from splashkit import *

class TestResources:

def test_deregister_free_notifier_integration():
    free_notifier = notifier_tracker();
    register_free_notifier(free_notifier.on_free)
    deregister_free_notifier(free_notifier.on_free)
    assert free_notifier.was_notified


def test_path_to_resource_integration():
    set_resources_path("resources")
    image_path = path_to_resource("test_image.png", ResourceKind.ImageResource)
    assert "" != image_path
    text_path = path_to_resource("nonexistent_file.txt", ResourceKind.AnimationResource)
    assert "" == text_path


def test_path_to_resources_integration():
    resource_path = path_to_resources()
    assert resource_path is not None
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
    assert free_notifier.was_notified
    deregister_free_notifier(free_notifier.on_free)
    assert not free_notifier.was_notified


def test_set_resources_path_integration():
    set_resources_path("/resources")
    assert "/resources" == path_to_resources()
    set_resources_path("/new/resources")
    assert "/new/resources" == path_to_resources()

