#include "splashkit.h"
#include <catch2/catch.hpp>

class TestAnimations {
public:
    TEST_CASE("animation_count_integration") {
        auto script = load_animation_script(string("kermit"), string("kermit.txt"));
        auto count = animation_count(script);
        REQUIRE(count > 0);
        free_animation_script(script);
    }
    TEST_CASE("animation_current_cell_integration") {
        auto kermit_script = load_animation_script(string("kermit"), string("kermit.txt"));
        auto anim = create_animation(kermit_script, string("moonwalkback"));
        auto current_cell = animation_current_cell(anim);
        REQUIRE(current_cell > -1);
        free_animation(anim);
        free_animation_script(kermit_script);
    }
    TEST_CASE("animation_current_vector_integration") {
        auto kermit_script = load_animation_script(string("kermit"), string("kermit.txt"));
        auto anim = create_animation(kermit_script, string("moonwalkback"));
        auto current_vector = animation_current_vector(anim);
        REQUIRE(0.0 == current_vector->x);
        REQUIRE(0.0 == current_vector->y);
        free_animation(anim);
        free_animation_script(kermit_script);
    }
    TEST_CASE("animation_ended_integration") {
        auto kermit_script = load_animation_script(string("kermit"), string("kermit.txt"));
        auto anim = create_animation(kermit_script, string("moonwalkback"));
        REQUIRE_FALSE(animation_ended(anim));
        for (int i = 0; i < 50; ++i) {
            update_animation(anim, 100.0f);
        }
        REQUIRE_FALSE(animation_ended(anim));
        update_animation(anim);
        REQUIRE(animation_ended(anim));
        free_animation(anim);
        free_animation_script(kermit_script);
    }
    TEST_CASE("animation_entered_frame_integration") {
        auto kermit_script = load_animation_script(string("kermit"), string("kermit.txt"));
        auto anim = create_animation(kermit_script, string("walkfront"));
        update_animation(anim, 20f);
        REQUIRE(animation_entered_frame(anim));
        update_animation(anim);
        REQUIRE_FALSE(animation_entered_frame(anim));
        free_animation(anim);
        free_animation_script(kermit_script);
    }
    TEST_CASE("animation_frame_time_integration") {
        auto kermit_script = load_animation_script(string("kermit"), string("kermit.txt"));
        auto anim = create_animation(kermit_script, string("walkfront"));
        update_animation(anim);
        auto frame_time = animation_frame_time(anim);
        REQUIRE(frame_time > 0.0f);
        free_animation(anim);
        free_animation_script(kermit_script);
    }
    TEST_CASE("animation_index_integration") {
        auto script = load_animation_script(string("kermit"), string("kermit.txt"));
        auto index = animation_index(script, string("walkfront"));
        REQUIRE(index > -1);
        auto non_existent_index = animation_index(script, string("NonExistentAnimation"));
        REQUIRE(-1 == non_existent_index);
        free_animation_script(script);
    }
    TEST_CASE("animation_name_integration") {
        auto kermit_script = load_animation_script(string("kermit"), string("kermit.txt"));
        auto anim = create_animation(kermit_script, string("moonwalkback"));
        auto anim_name = animation_name(anim);
        REQUIRE(string("moonwalkback") == anim_name);
        free_animation(anim);
        free_animation_script(kermit_script);
    }
    TEST_CASE("animation_script_name_integration") {
        auto kermit_script = load_animation_script(string("kermit"), string("kermit.txt"));
        auto script_name = animation_script_name(kermit_script);
        REQUIRE(string("kermit") == script_name);
        free_animation_script(kermit_script);
    }
    TEST_CASE("animation_script_named_integration") {
        auto kermit_script = load_animation_script(string("kermit"), string("kermit.txt"));
        auto loaded_script = animation_script_named(string("kermit"));
        REQUIRE(loaded_script != nullptr);
        REQUIRE(loaded_script == loaded_script);
        free_animation_script(kermit_script);
    }
    TEST_CASE("assign_animation_with_script_integration") {
        auto kermit_script = load_animation_script(string("kermit"), string("kermit.txt"));
        auto anim = create_animation(kermit_script, string("moonwalkback"));
        assign_animation(anim, kermit_script, string("walkfront"));
        REQUIRE(string("walkfront") == animation_name(anim));
        free_animation_script(kermit_script);
        free_animation(anim);
    }
    TEST_CASE("assign_animation_with_script_and_sound_integration") {
        auto kermit_script = load_animation_script(string("kermit"), string("kermit.txt"));
        auto anim = create_animation(kermit_script, string("walkfront"));
        assign_animation(anim, kermit_script, string("walkleft"), true);
        REQUIRE(string("walkleft") == animation_name(anim));
        free_animation(anim);
        free_animation_script(kermit_script);
    }
    TEST_CASE("assign_animation_index_with_script_integration") {
        auto kermit_script = load_animation_script(string("kermit"), string("kermit.txt"));
        auto anim = create_animation(kermit_script, string("moonwalkback"));
        assign_animation(anim, kermit_script, 0);
        REQUIRE(string("walkfront") == animation_name(anim));
        free_animation_script(kermit_script);
        free_animation(anim);
    }
    TEST_CASE("assign_animation_index_with_script_and_sound_integration") {
        auto kermit_script = load_animation_script(string("kermit"), string("kermit.txt"));
        auto anim = create_animation(kermit_script, string("moonwalkback"));
        assign_animation(anim, kermit_script, 0, true);
        REQUIRE(string("walkfront") == animation_name(anim));
        free_animation_script(kermit_script);
        free_animation(anim);
    }
    TEST_CASE("assign_animation_with_script_named_integration") {
        auto kermit_script = load_animation_script(string("kermit"), string("kermit.txt"));
        auto anim = create_animation(kermit_script, string("moonwalkback"));
        assign_animation(anim, string("kermit"), string("walkfront"));
        REQUIRE(string("walkfront") == animation_name(anim));
        free_animation_script(kermit_script);
        free_animation(anim);
    }
    TEST_CASE("assign_animation_with_script_named_and_sound_integration") {
        auto kermit_script = load_animation_script(string("kermit"), string("kermit.txt"));
        auto anim = create_animation(kermit_script, string("walkfront"));
        assign_animation(anim, string("kermit"), string("walkfront"), true);
        REQUIRE(string("walkfront") == animation_name(anim));
        free_animation(anim);
        free_animation_script(kermit_script);
    }
    TEST_CASE("assign_animation_index_integration") {
        auto kermit_script = load_animation_script(string("kermit"), string("kermit.txt"));
        auto anim = create_animation(kermit_script, string("moonwalkback"));
        assign_animation(anim, 0);
        REQUIRE(0 == animation_current_cell(anim));
        free_animation(anim);
        free_animation_script(kermit_script);
    }
    TEST_CASE("assign_animation_index_with_sound_integration") {
        auto kermit_script = load_animation_script(string("kermit"), string("kermit.txt"));
        auto anim = create_animation(kermit_script, string("moonwalkback"), false);
        assign_animation(anim, 0, true);
        REQUIRE(animation_entered_frame(anim));
        free_animation_script(kermit_script);
        free_animation(anim);
    }
    TEST_CASE("assign_animation_integration") {
        auto kermit_script = load_animation_script(string("kermit"), string("kermit.txt"));
        auto anim = create_animation(kermit_script, string("moonwalkback"));
        assign_animation(anim, string("walkfront"));
        REQUIRE(string("walkfront") == animation_name(anim));
        free_animation(anim);
        free_animation_script(kermit_script);
    }
    TEST_CASE("assign_animation_with_sound_integration") {
        auto kermit_script = load_animation_script(string("kermit"), string("kermit.txt"));
        auto anim = create_animation(kermit_script, string("moonwalkback"));
        assign_animation(anim, string("walkfront"), true);
        REQUIRE(string("walkfront") == animation_name(anim));
        free_animation_script(kermit_script);
        free_animation(anim);
    }
    TEST_CASE("create_animation_from_index_with_sound_integration") {
        auto kermit_script = load_animation_script(string("kermit"), string("kermit.txt"));
        auto anim = create_animation(kermit_script, 0, true);
        REQUIRE(anim != nullptr);
        auto anim_name = animation_name(anim);
        REQUIRE(string("walkfront") == anim_name);
        free_animation(anim);
        free_animation_script(kermit_script);
    }
    TEST_CASE("create_animation_integration") {
        auto kermit_script = load_animation_script(string("kermit"), string("kermit.txt"));
        auto anim = create_animation(kermit_script, string("moonwalkback"));
        REQUIRE(anim != nullptr);
        auto anim_name = animation_name(anim);
        REQUIRE(string("moonwalkback") == anim_name);
        free_animation(anim);
        free_animation_script(kermit_script);
    }
    TEST_CASE("create_animation_with_sound_integration") {
        auto kermit_script = load_animation_script(string("kermit"), string("kermit.txt"));
        auto anim = create_animation(kermit_script, string("moonwalkback"), true);
        REQUIRE(anim != nullptr);
        auto anim_name = animation_name(anim);
        REQUIRE(string("moonwalkback") == anim_name);
        free_animation_script(kermit_script);
        free_animation(anim);
    }
    TEST_CASE("create_animation_from_script_named_integration") {
        auto kermit_script = load_animation_script(string("kermit"), string("kermit.txt"));
        auto anim = create_animation(string("kermit"), string("moonwalkback"));
        REQUIRE(anim != nullptr);
        auto anim_name = animation_name(anim);
        REQUIRE(string("moonwalkback") == anim_name);
        free_animation(anim);
        free_animation_script(kermit_script);
    }
    TEST_CASE("create_animation_from_script_named_with_sound_integration") {
        auto kermit_script = load_animation_script(string("kermit"), string("kermit.txt"));
        auto anim = create_animation(string(""), string("moonwalkback"), true);
        REQUIRE(anim != nullptr);
        auto anim_name = animation_name(anim);
        REQUIRE(string("moonwalkback") == anim_name);
        free_animation_script(kermit_script);
        free_animation(anim);
    }
    TEST_CASE("free_all_animation_scripts_integration") {
        load_animation_script(string("kermitq"), string("kermit.txt"));
        load_animation_script(string("kermit2"), string("kermit.txt"));
        REQUIRE(has_animation_script(string("kermit1")));
        REQUIRE(has_animation_script(string("kermit2")));
        free_all_animation_scripts();
        REQUIRE_FALSE(has_animation_script(string("kermit1")));
        REQUIRE_FALSE(has_animation_script(string("kermit2")));
    }
    TEST_CASE("free_animation_integration") {
        auto kermit_script = load_animation_script(string("kermit"), string("kermit.txt"));
        auto anim = create_animation(kermit_script, string("moonwalkback"));
        free_animation(anim);
        REQUIRE(string("") == animation_name(anim));
        REQUIRE(animation_ended(anim));
        free_animation_script(kermit_script);
    }
    TEST_CASE("free_animation_script_integration") {
        auto script = load_animation_script(string("kermit"), string("kermit.txt"));
        REQUIRE(script != nullptr);
        free_animation_script(script);
        auto script_exists = has_animation_script(string("kermit"));
        REQUIRE_FALSE(script_exists);
    }
    TEST_CASE("free_animation_script_with_name_integration") {
        load_animation_script(string("kermit"), string("kermit.txt"));
        REQUIRE(has_animation_script(string("kermit")));
        free_animation_script(string("kermit"));
        REQUIRE_FALSE(has_animation_script(string("kermit")));
    }
    TEST_CASE("has_animation_named_integration") {
        auto kermit_script = load_animation_script(string("kermit"), string("kermit.txt"));
        auto has_walkfront = has_animation_named(kermit_script, string("walkfront"));
        REQUIRE(has_walkfront);
        auto has_nonexistent = has_animation_named(kermit_script, string("NonExistentAnimation"));
        REQUIRE_FALSE(has_nonexistent);
        free_animation_script(kermit_script);
    }
    TEST_CASE("has_animation_script_integration") {
        auto kermit_script = load_animation_script(string("kermit"), string("kermit.txt"));
        REQUIRE(has_animation_script(string("kermit")));
        free_animation_script(kermit_script);
        REQUIRE_FALSE(has_animation_script(string("kermit")));
    }
    TEST_CASE("load_animation_script_integration") {
        auto loaded_script = load_animation_script(string("test_animation"), string("kermit.txt"));
        REQUIRE(loaded_script != nullptr);
        auto script_name = animation_script_name(loaded_script);
        REQUIRE(string("test_animation") == script_name);
        free_animation_script(loaded_script);
        auto script_exists = has_animation_script(string("test_animation"));
        REQUIRE_FALSE(script_exists);
    }
    TEST_CASE("restart_animation_integration") {
        auto kermit_script = load_animation_script(string("kermit"), string("kermit.txt"));
        auto anim = create_animation(kermit_script, string("moonwalkback"));
        for (int i = 0; i < 50; ++i) {
            update_animation(anim, 100.0f);
        }
        auto anim_ended = animation_ended(anim);
        REQUIRE(anim_ended);
        restart_animation(anim);
        auto anim_ended_after_restart = animation_ended(anim);
        REQUIRE_FALSE(anim_ended_after_restart);
        free_animation(anim);
        free_animation_script(kermit_script);
    }
    TEST_CASE("restart_animation_with_sound_integration") {
        auto kermit_script = load_animation_script(string("kermit"), string("kermit.txt"));
        auto anim = create_animation(kermit_script, string("moonwalkback"), true);
        update_animation(anim);
        restart_animation(anim, true);
        REQUIRE(3 == animation_current_cell(anim));
        free_animation(anim);
        free_animation_script(kermit_script);
    }
    TEST_CASE("update_animation_percent_with_sound_integration") {
        auto kermit_script = load_animation_script(string("kermit"), string("kermit.txt"));
        auto anim = create_animation(kermit_script, string("moonwalkback"));
        update_animation(anim, 0.5f, true);
        REQUIRE(animation_frame_time(anim) > 0.0f);
        free_animation(anim);
        free_animation_script(kermit_script);
    }
    TEST_CASE("update_animation_integration") {
        auto kermit_script = load_animation_script(string("kermit"), string("kermit.txt"));
        auto anim = create_animation(kermit_script, string("moonwalkback"));
        update_animation(anim);
        REQUIRE(0 != animation_current_cell(anim));
        free_animation(anim);
        free_animation_script(kermit_script);
    }
    TEST_CASE("update_animation_percent_integration") {
        auto kermit_script = load_animation_script(string("kermit"), string("kermit.txt"));
        auto anim = create_animation(kermit_script, string("walkfront"));
        update_animation(anim, 0.5f);
        REQUIRE(animation_frame_time(anim) > 0.0f);
        free_animation(anim);
        free_animation_script(kermit_script);
    }
};
