#include "splashkit.h"
#include <catch2/catch.hpp>
#include "../helpers.hpp"
class TestAnimations {
public:
    TestAnimations()
    {
        set_resources_path(string("/mnt/c/Users/Noahc/Documents/aYear_2_semester_2/TeamProject/GitHubRepo/splashkit_test_generator/resources"));
    }
    TEST_CASE("animation_count_integration") {
        auto test_script = load_animation_script(string("kermit"), string("kermit.txt"));
        AnimationScriptCleanup cleanup_animation_script;
        auto count = animation_count(test_script);
        REQUIRE(count > 0);
    }
    TEST_CASE("animation_current_cell_integration") {
        auto test_script = load_animation_script(string("kermit"), string("kermit.txt"));
        AnimationScriptCleanup cleanup_animation_script;
        auto test_animation = create_animation(test_script, string("moonwalkback"));
        AnimationCleanup cleanup_animation(test_animation);
        auto current_cell = animation_current_cell(test_animation);
        REQUIRE(current_cell > -1);
    }
    TEST_CASE("animation_current_vector_integration") {
        auto test_script = load_animation_script(string("kermit"), string("kermit.txt"));
        AnimationScriptCleanup cleanup_animation_script;
        auto test_animation = create_animation(test_script, string("moonwalkback"));
        AnimationCleanup cleanup_animation(test_animation);
        auto current_vector = animation_current_vector(test_animation);
        REQUIRE(0.0 == current_vector.x);
        REQUIRE(0.0 == current_vector.y);
    }
    TEST_CASE("animation_ended_integration") {
        auto test_script = load_animation_script(string("kermit"), string("kermit.txt"));
        AnimationScriptCleanup cleanup_animation_script;
        auto test_animation = create_animation(test_script, string("moonwalkback"));
        AnimationCleanup cleanup_animation(test_animation);
        REQUIRE_FALSE(animation_ended(test_animation));
        for (int i = 0; i < 50; ++i) {
            update_animation(test_animation, 100.0f);
        }
        REQUIRE(animation_ended(test_animation));
    }
    TEST_CASE("animation_entered_frame_integration") {
        auto test_script = load_animation_script(string("kermit"), string("kermit.txt"));
        AnimationScriptCleanup cleanup_animation_script;
        auto test_animation = create_animation(test_script, string("walkfront"));
        AnimationCleanup cleanup_animation(test_animation);
        update_animation(test_animation, 20f);
        REQUIRE(animation_entered_frame(test_animation));
        update_animation(test_animation);
        REQUIRE_FALSE(animation_entered_frame(test_animation));
    }
    TEST_CASE("animation_frame_time_integration") {
        auto test_script = load_animation_script(string("kermit"), string("kermit.txt"));
        AnimationScriptCleanup cleanup_animation_script;
        auto test_animation = create_animation(test_script, string("walkfront"));
        AnimationCleanup cleanup_animation(test_animation);
        update_animation(test_animation);
        auto frame_time = animation_frame_time(test_animation);
        REQUIRE(frame_time > 0.0f);
    }
    TEST_CASE("animation_index_integration") {
        auto test_script = load_animation_script(string("kermit"), string("kermit.txt"));
        AnimationScriptCleanup cleanup_animation_script;
        auto index = animation_index(test_script, string("walkfront"));
        REQUIRE(index > -1);
        auto non_existent_index = animation_index(test_script, string("NonExistentAnimation"));
        REQUIRE(-1 == non_existent_index);
    }
    TEST_CASE("animation_name_integration") {
        auto test_script = load_animation_script(string("kermit"), string("kermit.txt"));
        AnimationScriptCleanup cleanup_animation_script;
        auto test_animation = create_animation(test_script, string("moonwalkback"));
        AnimationCleanup cleanup_animation(test_animation);
        auto anim_name = animation_name(test_animation);
        REQUIRE(string("moonwalkback") == anim_name);
    }
    TEST_CASE("animation_script_name_integration") {
        auto test_script = load_animation_script(string("kermit"), string("kermit.txt"));
        AnimationScriptCleanup cleanup_animation_script;
        auto script_name = animation_script_name(test_script);
        REQUIRE(string("kermit") == script_name);
    }
    TEST_CASE("animation_script_named_integration") {
        auto test_script = load_animation_script(string("kermit"), string("kermit.txt"));
        AnimationScriptCleanup cleanup_animation_script;
        animation_script_named(string("kermit"));
        REQUIRE(test_script != nullptr);
        REQUIRE(test_script == test_script);
    }
    TEST_CASE("assign_animation_with_script_integration") {
        auto test_script = load_animation_script(string("kermit"), string("kermit.txt"));
        AnimationScriptCleanup cleanup_animation_script;
        auto test_animation = create_animation(test_script, string("moonwalkback"));
        AnimationCleanup cleanup_animation(test_animation);
        assign_animation(test_animation, test_script, string("walkfront"));
        REQUIRE(string("walkfront") == animation_name(test_animation));
    }
    TEST_CASE("assign_animation_with_script_and_sound_integration") {
        auto test_script = load_animation_script(string("kermit"), string("kermit.txt"));
        AnimationScriptCleanup cleanup_animation_script;
        auto test_animation = create_animation(test_script, string("walkfront"));
        AnimationCleanup cleanup_animation(test_animation);
        assign_animation(test_animation, test_script, string("walkleft"), true);
        REQUIRE(string("walkleft") == animation_name(test_animation));
    }
    TEST_CASE("assign_animation_index_with_script_integration") {
        auto test_script = load_animation_script(string("kermit"), string("kermit.txt"));
        AnimationScriptCleanup cleanup_animation_script;
        auto test_animation = create_animation(test_script, string("moonwalkback"));
        AnimationCleanup cleanup_animation(test_animation);
        assign_animation(test_animation, test_script, 0);
        REQUIRE(string("walkfront") == animation_name(test_animation));
    }
    TEST_CASE("assign_animation_index_with_script_and_sound_integration") {
        auto test_script = load_animation_script(string("kermit"), string("kermit.txt"));
        AnimationScriptCleanup cleanup_animation_script;
        auto test_animation = create_animation(test_script, string("moonwalkback"));
        AnimationCleanup cleanup_animation(test_animation);
        assign_animation(test_animation, test_script, 0, true);
        REQUIRE(string("walkfront") == animation_name(test_animation));
    }
    TEST_CASE("assign_animation_with_script_named_integration") {
        auto test_script = load_animation_script(string("kermit"), string("kermit.txt"));
        AnimationScriptCleanup cleanup_animation_script;
        auto test_animation = create_animation(test_script, string("moonwalkback"));
        AnimationCleanup cleanup_animation(test_animation);
        assign_animation(test_animation, string("kermit"), string("walkfront"));
        REQUIRE(string("walkfront") == animation_name(test_animation));
    }
    TEST_CASE("assign_animation_with_script_named_and_sound_integration") {
        auto test_script = load_animation_script(string("kermit"), string("kermit.txt"));
        AnimationScriptCleanup cleanup_animation_script;
        auto test_animation = create_animation(test_script, string("walkfront"));
        AnimationCleanup cleanup_animation(test_animation);
        assign_animation(test_animation, string("kermit"), string("walkfront"), true);
        REQUIRE(string("walkfront") == animation_name(test_animation));
    }
    TEST_CASE("assign_animation_index_integration") {
        auto test_script = load_animation_script(string("kermit"), string("kermit.txt"));
        AnimationScriptCleanup cleanup_animation_script;
        auto test_animation = create_animation(test_script, string("moonwalkback"));
        AnimationCleanup cleanup_animation(test_animation);
        assign_animation(test_animation, 0);
        REQUIRE(0 == animation_current_cell(test_animation));
    }
    TEST_CASE("assign_animation_index_with_sound_integration") {
        auto test_script = load_animation_script(string("kermit"), string("kermit.txt"));
        AnimationScriptCleanup cleanup_animation_script;
        auto test_animation = create_animation(test_script, string("moonwalkback"), false);
        AnimationCleanup cleanup_animation(test_animation);
        assign_animation(test_animation, 0, true);
        REQUIRE(animation_entered_frame(test_animation));
    }
    TEST_CASE("assign_animation_integration") {
        auto test_script = load_animation_script(string("kermit"), string("kermit.txt"));
        AnimationScriptCleanup cleanup_animation_script;
        auto test_animation = create_animation(test_script, string("moonwalkback"));
        AnimationCleanup cleanup_animation(test_animation);
        assign_animation(test_animation, string("walkfront"));
        REQUIRE(string("walkfront") == animation_name(test_animation));
    }
    TEST_CASE("assign_animation_with_sound_integration") {
        auto test_script = load_animation_script(string("kermit"), string("kermit.txt"));
        AnimationScriptCleanup cleanup_animation_script;
        auto test_animation = create_animation(test_script, string("moonwalkback"));
        AnimationCleanup cleanup_animation(test_animation);
        assign_animation(test_animation, string("walkfront"), true);
        REQUIRE(string("walkfront") == animation_name(test_animation));
    }
    TEST_CASE("create_animation_from_index_with_sound_integration") {
        auto test_script = load_animation_script(string("kermit"), string("kermit.txt"));
        AnimationScriptCleanup cleanup_animation_script;
        auto test_animation = create_animation(test_script, 0, true);
        AnimationCleanup cleanup_animation(test_animation);
        REQUIRE(test_animation != nullptr);
        auto anim_name = animation_name(test_animation);
        REQUIRE(string("walkfront") == anim_name);
    }
    TEST_CASE("create_animation_integration") {
        auto test_script = load_animation_script(string("kermit"), string("kermit.txt"));
        AnimationScriptCleanup cleanup_animation_script;
        auto test_animation = create_animation(test_script, string("moonwalkback"));
        AnimationCleanup cleanup_animation(test_animation);
        REQUIRE(test_animation != nullptr);
        auto anim_name = animation_name(test_animation);
        REQUIRE(string("moonwalkback") == anim_name);
    }
    TEST_CASE("create_animation_with_sound_integration") {
        auto test_script = load_animation_script(string("kermit"), string("kermit.txt"));
        AnimationScriptCleanup cleanup_animation_script;
        auto test_animation = create_animation(test_script, string("moonwalkback"), true);
        AnimationCleanup cleanup_animation(test_animation);
        REQUIRE(test_animation != nullptr);
        auto anim_name = animation_name(test_animation);
        REQUIRE(string("moonwalkback") == anim_name);
    }
    TEST_CASE("create_animation_from_script_named_integration") {
        load_animation_script(string("kermit"), string("kermit.txt"));
        AnimationScriptCleanup cleanup_animation_script;
        auto test_animation = create_animation(string("kermit"), string("moonwalkback"));
        AnimationCleanup cleanup_animation(test_animation);
        REQUIRE(test_animation != nullptr);
        auto anim_name = animation_name(test_animation);
        REQUIRE(string("moonwalkback") == anim_name);
    }
    TEST_CASE("create_animation_from_script_named_with_sound_integration") {
        load_animation_script(string("test_script"), string("kermit.txt"));
        AnimationScriptCleanup cleanup_animation_script;
        auto test_animation = create_animation(string("test_script"), string("moonwalkback"), true);
        AnimationCleanup cleanup_animation(test_animation);
        REQUIRE(test_animation != nullptr);
        auto anim_name = animation_name(test_animation);
        REQUIRE(string("moonwalkback") == anim_name);
    }
    TEST_CASE("free_all_animation_scripts_integration") {
        load_animation_script(string("free_all_kermit1"), string("kermit.txt"));
        AnimationScriptCleanup cleanup_animation_script;
        load_animation_script(string("free_all_kermit2"), string("kermit.txt"));
        REQUIRE(has_animation_script(string("free_all_kermit1")));
        REQUIRE(has_animation_script(string("free_all_kermit2")));
        free_all_animation_scripts();
        REQUIRE_FALSE(has_animation_script(string("free_all_kermit1")));
        REQUIRE_FALSE(has_animation_script(string("free_all_kermit2")));
    }
    TEST_CASE("free_animation_integration") {
        auto test_script = load_animation_script(string("kermit"), string("kermit.txt"));
        AnimationScriptCleanup cleanup_animation_script;
        auto test_animation = create_animation(test_script, string("moonwalkback"));
        AnimationCleanup cleanup_animation(test_animation);
        free_animation(test_animation);
        REQUIRE(string("") == animation_name(test_animation));
        REQUIRE(animation_ended(test_animation));
    }
    TEST_CASE("free_animation_script_integration") {
        auto test_script = load_animation_script(string("kermit"), string("kermit.txt"));
        AnimationScriptCleanup cleanup_animation_script;
        REQUIRE(test_script != nullptr);
        free_animation_script(test_script);
        auto script_exists = has_animation_script(string("has_kermit"));
        REQUIRE_FALSE(script_exists);
    }
    TEST_CASE("free_animation_script_with_name_integration") {
        load_animation_script(string("free_kermit"), string("kermit.txt"));
        AnimationScriptCleanup cleanup_animation_script;
        REQUIRE(has_animation_script(string("free_kermit")));
        free_animation_script(string("free_kermit"));
        REQUIRE_FALSE(has_animation_script(string("free_kermit")));
    }
    TEST_CASE("has_animation_named_integration") {
        auto test_script = load_animation_script(string("kermit"), string("kermit.txt"));
        AnimationScriptCleanup cleanup_animation_script;
        auto has_walkfront = has_animation_named(test_script, string("walkfront"));
        REQUIRE(has_walkfront);
        auto has_nonexistent = has_animation_named(test_script, string("NonExistentAnimation"));
        REQUIRE_FALSE(has_nonexistent);
    }
    TEST_CASE("has_animation_script_integration") {
        auto test_script = load_animation_script(string("has_kermit"), string("kermit.txt"));
        AnimationScriptCleanup cleanup_animation_script;
        REQUIRE(has_animation_script(string("has_kermit")));
        free_animation_script(test_script);
        REQUIRE_FALSE(has_animation_script(string("has_kermit")));
    }
    TEST_CASE("load_animation_script_integration") {
        auto test_script = load_animation_script(string("test_animation_name"), string("kermit.txt"));
        AnimationScriptCleanup cleanup_animation_script;
        REQUIRE(test_script != nullptr);
        auto script_name = animation_script_name(test_script);
        REQUIRE(string("test_animation_name") == script_name);
        free_animation_script(test_script);
        auto script_exists = has_animation_script(string("test_animation_name"));
        REQUIRE_FALSE(script_exists);
    }
    TEST_CASE("restart_animation_integration") {
        auto test_script = load_animation_script(string("kermit"), string("kermit.txt"));
        AnimationScriptCleanup cleanup_animation_script;
        auto test_animation = create_animation(test_script, string("moonwalkback"));
        AnimationCleanup cleanup_animation(test_animation);
        for (int i = 0; i < 50; ++i) {
            update_animation(test_animation, 100.0f);
        }
        auto anim_ended = animation_ended(test_animation);
        REQUIRE(anim_ended);
        restart_animation(test_animation);
        auto anim_ended_after_restart = animation_ended(test_animation);
        REQUIRE_FALSE(anim_ended_after_restart);
    }
    TEST_CASE("restart_animation_with_sound_integration") {
        auto test_script = load_animation_script(string("kermit"), string("kermit.txt"));
        AnimationScriptCleanup cleanup_animation_script;
        auto test_animation = create_animation(test_script, string("moonwalkback"), true);
        AnimationCleanup cleanup_animation(test_animation);
        update_animation(test_animation);
        restart_animation(test_animation, true);
        REQUIRE(3 == animation_current_cell(test_animation));
    }
    TEST_CASE("update_animation_percent_with_sound_integration") {
        auto test_script = load_animation_script(string("kermit"), string("kermit.txt"));
        AnimationScriptCleanup cleanup_animation_script;
        auto test_animation = create_animation(test_script, string("moonwalkback"));
        AnimationCleanup cleanup_animation(test_animation);
        update_animation(test_animation, 0.5f, true);
        REQUIRE(animation_frame_time(test_animation) > 0.0f);
    }
    TEST_CASE("update_animation_integration") {
        auto test_script = load_animation_script(string("kermit"), string("kermit.txt"));
        AnimationScriptCleanup cleanup_animation_script;
        auto test_animation = create_animation(test_script, string("moonwalkback"));
        AnimationCleanup cleanup_animation(test_animation);
        update_animation(test_animation);
        REQUIRE(0 != animation_current_cell(test_animation));
    }
    TEST_CASE("update_animation_percent_integration") {
        auto test_script = load_animation_script(string("kermit"), string("kermit.txt"));
        AnimationScriptCleanup cleanup_animation_script;
        auto test_animation = create_animation(test_script, string("walkfront"));
        AnimationCleanup cleanup_animation(test_animation);
        update_animation(test_animation, 0.5f);
        REQUIRE(animation_frame_time(test_animation) > 0.0f);
    }
};
