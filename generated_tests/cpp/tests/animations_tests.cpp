#include <catch2/catch_all.hpp>
#include <limits>
#include "splashkit.h"
#include "../helpers.hpp"
struct TestAnimationsFixture
{
    TestAnimationsFixture()
    {
        set_resources_path("/mnt/c/Users/Noahc/Documents/aYear_2_semester_2/TeamProject/GitHubRepo/splashkit_test_generator/resources");
    }
};
TEST_CASE_METHOD(TestAnimationsFixture, "animation_count_integration") {
    auto test_script = load_animation_script("Test Script 1", "kermit.txt");
    animation_script_cleanup cleanup_animation_script;
    REQUIRE(animation_count(test_script) > 0);
}
TEST_CASE_METHOD(TestAnimationsFixture, "animation_current_cell_integration") {
    auto test_script = load_animation_script("Test Script 2", "kermit.txt");
    animation_script_cleanup cleanup_animation_script;
    auto test_animation = create_animation(test_script, "moonwalkback");
    animation_cleanup cleanup_animation(test_animation);
    REQUIRE(animation_current_cell(test_animation) > -1);
}
TEST_CASE_METHOD(TestAnimationsFixture, "animation_current_vector_integration") {
    auto test_script = load_animation_script("Test Script 3", "kermit.txt");
    animation_script_cleanup cleanup_animation_script;
    auto test_animation = create_animation(test_script, "moonwalkback");
    animation_cleanup cleanup_animation(test_animation);
    auto current_vector = animation_current_vector(test_animation);
    REQUIRE(0.0 == current_vector.x);
    REQUIRE(0.0 == current_vector.y);
}
TEST_CASE_METHOD(TestAnimationsFixture, "animation_ended_integration") {
    auto test_script = load_animation_script("Test Script 4", "kermit.txt");
    animation_script_cleanup cleanup_animation_script;
    auto test_animation = create_animation(test_script, "moonwalkback");
    animation_cleanup cleanup_animation(test_animation);
    REQUIRE_FALSE(animation_ended(test_animation));
    for (int i = 0; i < 50; ++i) {
        update_animation(test_animation, 100.0f);
    }
    REQUIRE(animation_ended(test_animation));
}
TEST_CASE_METHOD(TestAnimationsFixture, "animation_entered_frame_integration") {
    auto test_script = load_animation_script("Test Script 5", "kermit.txt");
    animation_script_cleanup cleanup_animation_script;
    auto test_animation = create_animation(test_script, "walkfront");
    animation_cleanup cleanup_animation(test_animation);
    update_animation(test_animation, 20.0f);
    REQUIRE(animation_entered_frame(test_animation));
    update_animation(test_animation);
    REQUIRE_FALSE(animation_entered_frame(test_animation));
}
TEST_CASE_METHOD(TestAnimationsFixture, "animation_frame_time_integration") {
    auto test_script = load_animation_script("Test Script 6", "kermit.txt");
    animation_script_cleanup cleanup_animation_script;
    auto test_animation = create_animation(test_script, "walkfront");
    animation_cleanup cleanup_animation(test_animation);
    update_animation(test_animation);
    auto frame_time = animation_frame_time(test_animation);
    REQUIRE(frame_time > 0.0f);
}
TEST_CASE_METHOD(TestAnimationsFixture, "animation_index_integration") {
    auto test_script = load_animation_script("Test Script 7", "kermit.txt");
    animation_script_cleanup cleanup_animation_script;
    REQUIRE(animation_index(test_script, "walkfront") > -1);
    REQUIRE(-1 == animation_index(test_script, "NonExistentAnimation"));
}
TEST_CASE_METHOD(TestAnimationsFixture, "animation_name_integration") {
    auto test_script = load_animation_script("Test Script 8", "kermit.txt");
    animation_script_cleanup cleanup_animation_script;
    auto test_animation = create_animation(test_script, "moonwalkback");
    animation_cleanup cleanup_animation(test_animation);
    auto anim_name = animation_name(test_animation);
    REQUIRE("moonwalkback" == anim_name);
}
TEST_CASE_METHOD(TestAnimationsFixture, "animation_script_name_integration") {
    auto test_script = load_animation_script("Test Script 9", "kermit.txt");
    animation_script_cleanup cleanup_animation_script;
    REQUIRE("Test Script 9" == animation_script_name(test_script));
}
TEST_CASE_METHOD(TestAnimationsFixture, "animation_script_named_integration") {
    auto test_script = load_animation_script("Test Script 10", "kermit.txt");
    animation_script_cleanup cleanup_animation_script;
    animation_script_named("Test Script 10");
    REQUIRE(test_script != nullptr);
    REQUIRE(test_script == test_script);
}
TEST_CASE_METHOD(TestAnimationsFixture, "assign_animation_with_script_integration") {
    auto test_script = load_animation_script("Test Script 11", "kermit.txt");
    animation_script_cleanup cleanup_animation_script;
    auto test_animation = create_animation(test_script, "moonwalkback");
    animation_cleanup cleanup_animation(test_animation);
    assign_animation(test_animation, test_script, "walkfront");
    REQUIRE("walkfront" == animation_name(test_animation));
}
TEST_CASE_METHOD(TestAnimationsFixture, "assign_animation_with_script_and_sound_integration") {
    auto test_script = load_animation_script("Test Script 12", "kermit.txt");
    animation_script_cleanup cleanup_animation_script;
    auto test_animation = create_animation(test_script, "walkfront");
    animation_cleanup cleanup_animation(test_animation);
    assign_animation(test_animation, test_script, "walkleft", true);
    REQUIRE("walkleft" == animation_name(test_animation));
}
TEST_CASE_METHOD(TestAnimationsFixture, "assign_animation_index_with_script_integration") {
    auto test_script = load_animation_script("Test Script 13", "kermit.txt");
    animation_script_cleanup cleanup_animation_script;
    auto test_animation = create_animation(test_script, "moonwalkback");
    animation_cleanup cleanup_animation(test_animation);
    assign_animation(test_animation, test_script, 0);
    REQUIRE("walkfront" == animation_name(test_animation));
}
TEST_CASE_METHOD(TestAnimationsFixture, "assign_animation_index_with_script_and_sound_integration") {
    auto test_script = load_animation_script("Test Script 14", "kermit.txt");
    animation_script_cleanup cleanup_animation_script;
    auto test_animation = create_animation(test_script, "moonwalkback");
    animation_cleanup cleanup_animation(test_animation);
    assign_animation(test_animation, test_script, 0, true);
    REQUIRE("walkfront" == animation_name(test_animation));
}
TEST_CASE_METHOD(TestAnimationsFixture, "assign_animation_with_script_named_integration") {
    auto test_script = load_animation_script("Test Script 15", "kermit.txt");
    animation_script_cleanup cleanup_animation_script;
    auto test_animation = create_animation(test_script, "moonwalkback");
    animation_cleanup cleanup_animation(test_animation);
    assign_animation(test_animation, "Test Script 15", "walkfront");
    REQUIRE("walkfront" == animation_name(test_animation));
}
TEST_CASE_METHOD(TestAnimationsFixture, "assign_animation_with_script_named_and_sound_integration") {
    auto test_script = load_animation_script("Test Script 16", "kermit.txt");
    animation_script_cleanup cleanup_animation_script;
    auto test_animation = create_animation(test_script, "walkfront");
    animation_cleanup cleanup_animation(test_animation);
    assign_animation(test_animation, "Test Script 16", "walkfront", true);
    REQUIRE("walkfront" == animation_name(test_animation));
}
TEST_CASE_METHOD(TestAnimationsFixture, "assign_animation_index_integration") {
    auto test_script = load_animation_script("Test Script 17", "kermit.txt");
    animation_script_cleanup cleanup_animation_script;
    auto test_animation = create_animation(test_script, "moonwalkback");
    animation_cleanup cleanup_animation(test_animation);
    assign_animation(test_animation, 0);
    REQUIRE(0 == animation_current_cell(test_animation));
}
TEST_CASE_METHOD(TestAnimationsFixture, "assign_animation_index_with_sound_integration") {
    auto test_script = load_animation_script("Test Script 18", "kermit.txt");
    animation_script_cleanup cleanup_animation_script;
    auto test_animation = create_animation(test_script, "moonwalkback", false);
    animation_cleanup cleanup_animation(test_animation);
    assign_animation(test_animation, 0, true);
    REQUIRE(animation_entered_frame(test_animation));
}
TEST_CASE_METHOD(TestAnimationsFixture, "assign_animation_integration") {
    auto test_script = load_animation_script("Test Script 19", "kermit.txt");
    animation_script_cleanup cleanup_animation_script;
    auto test_animation = create_animation(test_script, "moonwalkback");
    animation_cleanup cleanup_animation(test_animation);
    assign_animation(test_animation, "walkfront");
    REQUIRE("walkfront" == animation_name(test_animation));
}
TEST_CASE_METHOD(TestAnimationsFixture, "assign_animation_with_sound_integration") {
    auto test_script = load_animation_script("Test Script 20", "kermit.txt");
    animation_script_cleanup cleanup_animation_script;
    auto test_animation = create_animation(test_script, "moonwalkback");
    animation_cleanup cleanup_animation(test_animation);
    assign_animation(test_animation, "walkfront", true);
    REQUIRE("walkfront" == animation_name(test_animation));
}
TEST_CASE_METHOD(TestAnimationsFixture, "create_animation_from_index_with_sound_integration") {
    auto test_script = load_animation_script("Test Script 21", "kermit.txt");
    animation_script_cleanup cleanup_animation_script;
    auto test_animation = create_animation(test_script, 0, true);
    animation_cleanup cleanup_animation(test_animation);
    REQUIRE(test_animation != nullptr);
    REQUIRE("walkfront" == animation_name(test_animation));
}
TEST_CASE_METHOD(TestAnimationsFixture, "create_animation_integration") {
    auto test_script = load_animation_script("Test Script 22", "kermit.txt");
    animation_script_cleanup cleanup_animation_script;
    auto test_animation = create_animation(test_script, "moonwalkback");
    animation_cleanup cleanup_animation(test_animation);
    REQUIRE(test_animation != nullptr);
    REQUIRE("moonwalkback" == animation_name(test_animation));
}
TEST_CASE_METHOD(TestAnimationsFixture, "create_animation_with_sound_integration") {
    auto test_script = load_animation_script("Test Script 23", "kermit.txt");
    animation_script_cleanup cleanup_animation_script;
    auto test_animation = create_animation(test_script, "moonwalkback", true);
    animation_cleanup cleanup_animation(test_animation);
    REQUIRE(test_animation != nullptr);
    REQUIRE("moonwalkback" == animation_name(test_animation));
}
TEST_CASE_METHOD(TestAnimationsFixture, "create_animation_from_script_named_integration") {
    load_animation_script("Test Script 24", "kermit.txt");
    animation_script_cleanup cleanup_animation_script;
    auto test_animation = create_animation("Test Script 24", "moonwalkback");
    animation_cleanup cleanup_animation(test_animation);
    REQUIRE(test_animation != nullptr);
    REQUIRE("moonwalkback" == animation_name(test_animation));
}
TEST_CASE_METHOD(TestAnimationsFixture, "create_animation_from_script_named_with_sound_integration") {
    load_animation_script("Test Script 25", "kermit.txt");
    animation_script_cleanup cleanup_animation_script;
    auto test_animation = create_animation("Test Script 25", "moonwalkback", true);
    animation_cleanup cleanup_animation(test_animation);
    REQUIRE(test_animation != nullptr);
    REQUIRE("moonwalkback" == animation_name(test_animation));
}
TEST_CASE_METHOD(TestAnimationsFixture, "free_all_animation_scripts_integration") {
    load_animation_script("Test Script 26", "kermit.txt");
    animation_script_cleanup cleanup_animation_script;
    load_animation_script("Test Script 27", "kermit.txt");
    REQUIRE(has_animation_script("Test Script 26"));
    REQUIRE(has_animation_script("Test Script 27"));
    free_all_animation_scripts();
    REQUIRE_FALSE(has_animation_script("Test Script 26"));
    REQUIRE_FALSE(has_animation_script("Test Script 27"));
}
TEST_CASE_METHOD(TestAnimationsFixture, "free_animation_integration") {
    auto test_script = load_animation_script("Test Script 28", "kermit.txt");
    animation_script_cleanup cleanup_animation_script;
    auto test_animation = create_animation(test_script, "moonwalkback");
    animation_cleanup cleanup_animation(test_animation);
    free_animation(test_animation);
    REQUIRE("" == animation_name(test_animation));
    REQUIRE(animation_ended(test_animation));
}
TEST_CASE_METHOD(TestAnimationsFixture, "free_animation_script_integration") {
    auto test_script = load_animation_script("Test Script 29", "kermit.txt");
    animation_script_cleanup cleanup_animation_script;
    REQUIRE(test_script != nullptr);
    free_animation_script(test_script);
    REQUIRE_FALSE(has_animation_script("Test Script 29"));
}
TEST_CASE_METHOD(TestAnimationsFixture, "free_animation_script_with_name_integration") {
    load_animation_script("Test Script 30", "kermit.txt");
    animation_script_cleanup cleanup_animation_script;
    REQUIRE(has_animation_script("Test Script 30"));
    free_animation_script("Test Script 30");
    REQUIRE_FALSE(has_animation_script("Test Script 30"));
}
TEST_CASE_METHOD(TestAnimationsFixture, "has_animation_named_integration") {
    auto test_script = load_animation_script("Test Script 31", "kermit.txt");
    animation_script_cleanup cleanup_animation_script;
    REQUIRE(has_animation_named(test_script, "walkfront"));
    REQUIRE_FALSE(has_animation_named(test_script, "NonExistentAnimation"));
}
TEST_CASE_METHOD(TestAnimationsFixture, "has_animation_script_integration") {
    auto test_script = load_animation_script("Test Script 32", "kermit.txt");
    animation_script_cleanup cleanup_animation_script;
    REQUIRE(has_animation_script("Test Script 32"));
    free_animation_script(test_script);
    REQUIRE_FALSE(has_animation_script("Test Script 32"));
}
TEST_CASE_METHOD(TestAnimationsFixture, "load_animation_script_integration") {
    auto test_script = load_animation_script("Test Script 33", "kermit.txt");
    animation_script_cleanup cleanup_animation_script;
    REQUIRE(test_script != nullptr);
    auto script_name = animation_script_name(test_script);
    REQUIRE("Test Script 33" == script_name);
    free_animation_script(test_script);
    REQUIRE_FALSE(has_animation_script("Test Script 33"));
}
TEST_CASE_METHOD(TestAnimationsFixture, "restart_animation_integration") {
    auto test_script = load_animation_script("Test Script 34", "kermit.txt");
    animation_script_cleanup cleanup_animation_script;
    auto test_animation = create_animation(test_script, "moonwalkback");
    animation_cleanup cleanup_animation(test_animation);
    for (int i = 0; i < 50; ++i) {
        update_animation(test_animation, 100.0f);
    }
    auto anim_ended = animation_ended(test_animation);
    REQUIRE(anim_ended);
    restart_animation(test_animation);
    REQUIRE_FALSE(animation_ended(test_animation));
}
TEST_CASE_METHOD(TestAnimationsFixture, "restart_animation_with_sound_integration") {
    auto test_script = load_animation_script("Test Script 35", "kermit.txt");
    animation_script_cleanup cleanup_animation_script;
    auto test_animation = create_animation(test_script, "moonwalkback", true);
    animation_cleanup cleanup_animation(test_animation);
    update_animation(test_animation);
    restart_animation(test_animation, true);
    REQUIRE(3 == animation_current_cell(test_animation));
}
TEST_CASE_METHOD(TestAnimationsFixture, "update_animation_percent_with_sound_integration") {
    auto test_script = load_animation_script("Test Script 36", "kermit.txt");
    animation_script_cleanup cleanup_animation_script;
    auto test_animation = create_animation(test_script, "moonwalkback");
    animation_cleanup cleanup_animation(test_animation);
    update_animation(test_animation, 0.5f, true);
    REQUIRE(animation_frame_time(test_animation) > 0.0f);
}
TEST_CASE_METHOD(TestAnimationsFixture, "update_animation_integration") {
    auto test_script = load_animation_script("Test Script 37", "kermit.txt");
    animation_script_cleanup cleanup_animation_script;
    auto test_animation = create_animation(test_script, "moonwalkback");
    animation_cleanup cleanup_animation(test_animation);
    update_animation(test_animation);
    REQUIRE(0 != animation_current_cell(test_animation));
}
TEST_CASE_METHOD(TestAnimationsFixture, "update_animation_percent_integration") {
    auto test_script = load_animation_script("Test Script 38", "kermit.txt");
    animation_script_cleanup cleanup_animation_script;
    auto test_animation = create_animation(test_script, "walkfront");
    animation_cleanup cleanup_animation(test_animation);
    update_animation(test_animation, 0.5f);
    REQUIRE(animation_frame_time(test_animation) > 0.0f);
}
