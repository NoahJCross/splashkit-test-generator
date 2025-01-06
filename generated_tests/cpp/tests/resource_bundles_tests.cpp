#include <catch2/catch_all.hpp>
#include <limits>
#include "splashkit.h"
#include "../helpers.hpp"
struct TestResourceBundlesFixture
{
    TestResourceBundlesFixture()
    {
        set_resources_path("/mnt/c/Users/Noahc/Documents/aYear_2_semester_2/TeamProject/GitHubRepo/splashkit_test_generator/resources");
    }
};
TEST_CASE_METHOD(TestResourceBundlesFixture, "free_resource_bundle_integration") {
    load_resource_bundle("Test Resource Bundle", "test.txt");
    resource_cleanup cleanup_resource("Test Resource Bundle");
    REQUIRE(has_resource_bundle("Test Resource Bundle"));
    REQUIRE(has_bitmap("FrogBmp"));
    REQUIRE(has_font("hara"));
    free_resource_bundle("Test Resource Bundle");
    REQUIRE_FALSE(has_resource_bundle("Test Resource Bundle"));
}
TEST_CASE_METHOD(TestResourceBundlesFixture, "has_resource_bundle_integration") {
    load_resource_bundle("Test Resource Bundle", "test.txt");
    resource_cleanup cleanup_resource("Test Resource Bundle");
    REQUIRE(has_resource_bundle("Test Resource Bundle"));
    free_resource_bundle("Test Resource Bundle");
    REQUIRE_FALSE(has_resource_bundle("Test Resource Bundle"));
    REQUIRE_FALSE(has_resource_bundle("nonexistent"));
}
TEST_CASE_METHOD(TestResourceBundlesFixture, "load_resource_bundle_integration") {
    load_resource_bundle("Test Resource Bundle", "test.txt");
    resource_cleanup cleanup_resource("Test Resource Bundle");
    REQUIRE(has_resource_bundle("Test Resource Bundle"));
    REQUIRE(has_animation_script("WalkingScript"));
    REQUIRE(has_bitmap("FrogBmp"));
    REQUIRE(has_font("hara"));
    REQUIRE(has_sound_effect("error"));
    REQUIRE(has_timer("my timer"));
    REQUIRE(has_resource_bundle("blah"));
    free_resource_bundle("Test Resource Bundle");
    REQUIRE_FALSE(has_resource_bundle("test_bundle"));
}
