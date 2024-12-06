#include "splashkit.h"
#include <catch2/catch.hpp>

TEST_CASE("deregister_free_notifier_integration") {
    register_free_notifier(test_notifier);
    deregister_free_notifier(test_notifier);
    REQUIRE(test_notifier == nullptr);
}
TEST_CASE("path_to_resource_integration") {
    set_resources_path("resources");
    auto image_path = path_to_resource("test_image.png", ResourceKind::IMAGE_RESOURCE);
    REQUIRE(image_path != "");
    auto text_path = path_to_resource("nonexistent_file.txt", ResourceKind::ANIMATION_RESOURCE);
    REQUIRE(text_path == "");
}
TEST_CASE("path_to_resources_integration") {
    auto resource_path = path_to_resources();
    REQUIRE(resource_path != nullptr);
    set_resources_path("/new/resources");
    auto new_resource_path = path_to_resources();
    REQUIRE(new_resource_path == "/new/resources");
}
TEST_CASE("path_to_resources_for_kind_integration") {
    set_resources_path("resources");
    auto image_path = path_to_resources(ResourceKind::IMAGE_RESOURCE);
    REQUIRE(image_path == "resources/images");
    auto sound_path = path_to_resources(ResourceKind::SOUND_RESOURCE);
    REQUIRE(sound_path == "resources/sounds");
}
TEST_CASE("register_free_notifier_integration") {
    register_free_notifier(free_notifier());
    REQUIRE(notifier_called);
    deregister_free_notifier(free_notifier());
    REQUIRE_FALSE(notifier_called);
}
TEST_CASE("set_resources_path_integration") {
    set_resources_path("/resources");
    REQUIRE(path_to_resources() == "/resources");
    set_resources_path("/new/resources");
    REQUIRE(path_to_resources() == "/new/resources");
}
