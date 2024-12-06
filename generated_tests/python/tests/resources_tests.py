import pytest
from splashkit import *


def test_DeregisterFreeNotifier_integration():
    RegisterFreeNotifier(test_notifier)
    DeregisterFreeNotifier(test_notifier)
    assert test_notifier is None


def test_PathToResource_integration():
    SetResourcesPath("resources")
    image_path = PathToResource("test_image.png", ResourceKind.ImageResource)
    assert image_path != ""
    text_path = PathToResource("nonexistent_file.txt", ResourceKind.AnimationResource)
    assert text_path == ""


def test_PathToResources_integration():
    resource_path = PathToResources()
    assert resource_path is not None
    SetResourcesPath("/new/resources")
    new_resource_path = PathToResources()
    assert new_resource_path == "/new/resources"


def test_PathToResourcesForKind_integration():
    SetResourcesPath("resources")
    image_path = PathToResourcesForKind(ResourceKind.ImageResource)
    assert image_path == "resources/images"
    sound_path = PathToResourcesForKind(ResourceKind.SoundResource)
    assert sound_path == "resources/sounds"


def test_RegisterFreeNotifier_integration():
    RegisterFreeNotifier(FreeNotifier())
    assert notifier_called is True
    DeregisterFreeNotifier(FreeNotifier())
    assert notifier_called is False


def test_SetResourcesPath_integration():
    SetResourcesPath("/resources")
    assert PathToResources() == "/resources"
    SetResourcesPath("/new/resources")
    assert PathToResources() == "/new/resources"

