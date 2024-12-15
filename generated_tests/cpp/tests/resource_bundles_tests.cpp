#include "splashkit.h"
#include <catch2/catch.hpp>

class TestResourceBundles {
public:
    TEST_CASE("free_resource_bundle_integration") {
        load_resource_bundle(string("test"), string("test.txt"));
        REQUIRE(has_resource_bundle(string("test")));
        REQUIRE(has_bitmap(string("FrogBmp")));
        REQUIRE(has_font(string("hara")));
        free_resource_bundle(string("test"));
        REQUIRE_FALSE(has_resource_bundle(string("test")));
    }
    TEST_CASE("has_resource_bundle_integration") {
        load_resource_bundle(string("test"), string("test.txt"));
        REQUIRE(has_resource_bundle(string("test")));
        free_resource_bundle(string("test"));
        REQUIRE_FALSE(has_resource_bundle(string("test")));
        REQUIRE_FALSE(has_resource_bundle(string("nonexistent")));
    }
    TEST_CASE("load_resource_bundle_integration") {
        load_resource_bundle(string("test"), string("test.txt"));
        REQUIRE(has_resource_bundle(string("test")));
        REQUIRE(has_animation_script(string("WalkingScript")));
        REQUIRE(has_bitmap(string("FrogBmp")));
        REQUIRE(has_font(string("hara")));
        REQUIRE(has_sound_effect(string("error")));
        REQUIRE(has_timer(string("my timer")));
        REQUIRE(has_resource_bundle(string("blah")));
        free_resource_bundle(string("test"));
        REQUIRE_FALSE(has_resource_bundle(string("test_bundle")));
    }
};
