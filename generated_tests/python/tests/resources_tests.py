import pytest
from splashkit import *


def test_DeregisterFreeNotifier_integration():
    register_free_notifier(test_notifier)
    deregister_free_notifier(test_notifier)
    assert test_notifier is None


def test_PathToResource_integration():
    set_resources_path("resources")
    image_path = path_to_resource("test_image.png", ResourceKind.ImageResource)
    assert image_path != ""
    text_path = path_to_resource("nonexistent_file.txt", ResourceKind.AnimationResource)
    assert text_path == ""


def test_PathToResources_integration():
    resource_path = path_to_resources()
    assert resource_path is not None
    set_resources_path("/new/resources")
    new_resource_path = path_to_resources()
    assert new_resource_path == "/new/resources"


def test_PathToResourcesForKind_integration():
    set_resources_path("resources")
    image_path = path_to_resources_for_kind(ResourceKind.ImageResource)
    assert image_path == "resources/images"
    sound_path = path_to_resources_for_kind(ResourceKind.SoundResource)
    assert sound_path == "resources/sounds"


def test_RegisterFreeNotifier_integration():
    register_free_notifier(free_notifier())
    assert notifier_called is True
    deregister_free_notifier(free_notifier())
    assert notifier_called is False


def test_SetResourcesPath_integration():
    set_resources_path("/resources")
    assert path_to_resources() == "/resources"
    set_resources_path("/new/resources")
    assert path_to_resources() == "/new/resources"

