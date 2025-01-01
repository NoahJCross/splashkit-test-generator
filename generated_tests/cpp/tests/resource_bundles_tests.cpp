#include "splashkit.h"
#include <catch2/catch.hpp>
#include "../helpers.hpp"
class TestResourceBundles {
public:
    TestResourceBundles()
    {
        set_resources_path(string("/mnt/c/Users/Noahc/Documents/aYear_2_semester_2/TeamProject/GitHubRepo/splashkit_test_generator/resources"));
    }
    TEST_CASE("free_resource_bundle_integration") {
        load_resource_bundle(string("test_resource_bundle"), string("test.txt"));
        ResourceCleanup cleanup_resource(string("test_resource_bundle"));
        REQUIRE(has_resource_bundle(string("test_resource_bundle")));
        REQUIRE(has_bitmap(string("FrogBmp")));
        REQUIRE(has_font(string("hara")));
        free_resource_bundle(string("test_resource_bundle"));
        REQUIRE_FALSE(has_resource_bundle(string("test_resource_bundle")));
    }
    TEST_CASE("has_resource_bundle_integration") {
        load_resource_bundle(string("test_resource_bundle"), string("test.txt"));
        ResourceCleanup cleanup_resource(string("test_resource_bundle"));
        REQUIRE(has_resource_bundle(string("test_resource_bundle")));
        free_resource_bundle(string("test_resource_bundle"));
        REQUIRE_FALSE(has_resource_bundle(string("test_resource_bundle")));
        REQUIRE_FALSE(has_resource_bundle(string("nonexistent")));
    }
    TEST_CASE("load_resource_bundle_integration") {
        load_resource_bundle(string("test_resource_bundle"), string("test.txt"));
        ResourceCleanup cleanup_resource(string("test_resource_bundle"));
        REQUIRE(has_resource_bundle(string("test_resource_bundle")));
        REQUIRE(has_animation_script(string("WalkingScript")));
        REQUIRE(has_bitmap(string("FrogBmp")));
        REQUIRE(has_font(string("hara")));
        REQUIRE(has_sound_effect(string("error")));
        REQUIRE(has_timer(string("my timer")));
        REQUIRE(has_resource_bundle(string("blah")));
        free_resource_bundle(string("test_resource_bundle"));
        REQUIRE_FALSE(has_resource_bundle(string("test_bundle")));
    }
};
