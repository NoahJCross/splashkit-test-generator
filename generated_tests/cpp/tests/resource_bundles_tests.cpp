#include "splashkit.h"
#include <catch2/catch.hpp>

class TestResourceBundles {
public:
    TEST_CASE("free_resource_bundle_integration") {
        load_resource_bundle("test", "test.txt");
        REQUIRE(has_resource_bundle("test"));
        REQUIRE(has_bitmap("FrogBmp"));
        REQUIRE(has_font("hara"));
        free_resource_bundle("test");
        REQUIRE_FALSE(has_resource_bundle("test"));
    }
    TEST_CASE("has_resource_bundle_integration") {
        load_resource_bundle("test", "test.txt");
        REQUIRE(has_resource_bundle("test"));
        free_resource_bundle("test");
        REQUIRE_FALSE(has_resource_bundle("test"));
        REQUIRE_FALSE(has_resource_bundle("nonexistent"));
    }
    TEST_CASE("load_resource_bundle_integration") {
        load_resource_bundle("test", "test.txt");
        REQUIRE(has_resource_bundle("test"));
        REQUIRE(has_animation_script("WalkingScript"));
        REQUIRE(has_bitmap("FrogBmp"));
        REQUIRE(has_font("hara"));
        REQUIRE(has_sound_effect("error"));
        REQUIRE(has_timer_named("my timer"));
        REQUIRE(has_resource_bundle("blah"));
        free_resource_bundle("test");
        REQUIRE_FALSE(has_resource_bundle("test_bundle"));
    }
};
