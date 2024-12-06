#include "splashkit.h"
#include <catch2/catch.hpp>

TEST_CASE("free_resource_bundle_integration") {
    load_resource_bundle("test", "test.txt");
    REQUIRE(has_resource_bundle("test"));
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
    load_resource_bundle("test_bundle", "test_bundle.txt");
    REQUIRE(has_resource_bundle("test_bundle"));
    free_resource_bundle("test_bundle");
    REQUIRE_FALSE(has_resource_bundle("test_bundle"));
}
