#include <catch2/catch_all.hpp>
#include <limits>
#include "splashkit.h"
#include "../helpers.hpp"
struct TestResourcesFixture
{
};
TEST_CASE_METHOD(TestResourcesFixture, "deregister_free_notifier_integration") {
    auto free_notifier = notifier_tracker();
    register_free_notifier(free_notifier.on_free());
    auto test_bitmap1 = create_bitmap("Test Bitmap 1", 100, 100);
    bitmap_cleanup cleanup_bitmap;
    free_bitmap(test_bitmap1);
    REQUIRE(free_notifier.was_notified());
    deregister_free_notifier(free_notifier.on_free());
    free_notifier.reset()
;    auto test_bitmap2 = create_bitmap("Test Bitmap 2", 100, 100);
    free_bitmap(test_bitmap2);
    REQUIRE_FALSE(free_notifier.was_notified());
}
TEST_CASE_METHOD(TestResourcesFixture, "path_to_resource_integration") {
    set_resources_path("resources");
    auto image_path = path_to_resource("test_image.png", resource_kind::IMAGE_RESOURCE);
    REQUIRE("resources/images/test_image.png" == image_path);
}
TEST_CASE_METHOD(TestResourcesFixture, "path_to_resources_integration") {
    auto resource_path = path_to_resources();
    REQUIRE(!resource_path.empty());
    set_resources_path("/new/resources");
    auto new_resource_path = path_to_resources();
    REQUIRE("/new/resources" == new_resource_path);
}
TEST_CASE_METHOD(TestResourcesFixture, "path_to_resources_for_kind_integration") {
    set_resources_path("resources");
    auto image_path = path_to_resources(resource_kind::IMAGE_RESOURCE);
    REQUIRE("resources/images/" == image_path);
    auto sound_path = path_to_resources(resource_kind::SOUND_RESOURCE);
    REQUIRE("resources/sounds/" == sound_path);
}
TEST_CASE_METHOD(TestResourcesFixture, "register_free_notifier_integration") {
    auto free_notifier = notifier_tracker();
    register_free_notifier(free_notifier.on_free());
    auto test_bitmap = create_bitmap("Test Bitmap 3", 100, 100);
    bitmap_cleanup cleanup_bitmap;
    free_bitmap(test_bitmap);
    REQUIRE(free_notifier.was_notified());
    deregister_free_notifier(free_notifier.on_free());
}
TEST_CASE_METHOD(TestResourcesFixture, "set_resources_path_integration") {
    set_resources_path("/resources");
    REQUIRE("/resources" == path_to_resources());
    set_resources_path("/new/resources");
    REQUIRE("/new/resources" == path_to_resources());
}
