#include "splashkit.h"
#include <catch2/catch.hpp>
#include "../helpers.hpp"
class TestResources {
public:
    TEST_CASE("deregister_free_notifier_integration") {
        auto free_notifier = notifier_tracker();
        register_free_notifier(free_notifier.on_free);
        auto test_bitmap1 = create_bitmap(string("test_bitmap"), 100, 100);
        BitmapCleanup cleanup_bitmap;
        free_bitmap(test_bitmap1);
        REQUIRE(free_notifier.was_notified);
        deregister_free_notifier(free_notifier.on_free);
        free_notifier.reset();
        auto test_bitmap2 = create_bitmap(string("test_bitmap"), 100, 100);
        free_bitmap(test_bitmap2);
        REQUIRE_FALSE(free_notifier.was_notified);
    }
    TEST_CASE("path_to_resource_integration") {
        set_resources_path(string("resources"));
        auto image_path = path_to_resource(string("test_image.png"), ResourceKind::IMAGE_RESOURCE);
        REQUIRE(string("") != image_path);
    }
    TEST_CASE("path_to_resources_integration") {
        auto resource_path = path_to_resources();
        REQUIRE(!resource_path.empty());
        set_resources_path(string("/new/resources"));
        auto new_resource_path = path_to_resources();
        REQUIRE(string("/new/resources") == new_resource_path);
    }
    TEST_CASE("path_to_resources_for_kind_integration") {
        set_resources_path(string("resources"));
        auto image_path = path_to_resources(ResourceKind::IMAGE_RESOURCE);
        REQUIRE(string("resources/images") == image_path);
        auto sound_path = path_to_resources(ResourceKind::SOUND_RESOURCE);
        REQUIRE(string("resources/sounds") == sound_path);
    }
    TEST_CASE("register_free_notifier_integration") {
        auto free_notifier = notifier_tracker();
        register_free_notifier(free_notifier.on_free);
        auto test_bitmap = create_bitmap(string("test_bitmap"), 100, 100);
        BitmapCleanup cleanup_bitmap;
        free_bitmap(test_bitmap);
        REQUIRE(free_notifier.was_notified);
        deregister_free_notifier(free_notifier.on_free);
    }
    TEST_CASE("set_resources_path_integration") {
        set_resources_path(string("/resources"));
        REQUIRE(string("/resources") == path_to_resources());
        set_resources_path(string("/new/resources"));
        REQUIRE(string("/new/resources") == path_to_resources());
    }
};
