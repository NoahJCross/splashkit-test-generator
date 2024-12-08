#include "splashkit.h"
#include <catch2/catch.hpp>

TEST_CASE("animation_count_integration") {
    auto script = load_animation_script("kermit", "kermit.txt");
    auto count = animation_count(script);
    REQUIRE(count > 0);
    free_animation_script(script);
}
TEST_CASE("animation_current_cell_integration") {
    auto kermit_script = load_animation_script("kermit", "kermit.txt");
    auto anim = create_animation(kermit_script, "moonwalkback");
    auto current_cell = animation_current_cell(anim);
    REQUIRE(current_cell > -1);
    free_animation(anim);
    free_animation_script(kermit_script);
}
TEST_CASE("animation_current_vector_integration") {
    auto kermit_script = load_animation_script("kermit", "kermit.txt");
    auto anim = create_animation(kermit_script, "moonwalkback");
    auto current_vector = animation_current_vector(anim);
    REQUIRE(0 == current_vector->x);
    REQUIRE(0 == current_vector->y);
    free_animation(anim);
    free_animation_script(kermit_script);
}
TEST_CASE("animation_ended_integration") {
    auto kermit_script = load_animation_script("kermit", "kermit.txt");
    auto anim = create_animation(kermit_script, "moonwalkback");
    REQUIRE_FALSE(animation_ended(anim));
    update_animation(anim);
    REQUIRE_FALSE(animation_ended(anim));
    update_animation(anim);
    REQUIRE(animation_ended(anim));
    free_animation(anim);
    free_animation_script(kermit_script);
}
TEST_CASE("animation_entered_frame_integration") {
    auto kermit_script = load_animation_script("kermit", "kermit.txt");
    auto anim = create_animation(kermit_script, "walkfront");
    update_animation(anim, 20);
    REQUIRE(animation_entered_frame(anim));
    update_animation(anim);
    REQUIRE_FALSE(animation_entered_frame(anim));
    free_animation(anim);
    free_animation_script(kermit_script);
}
TEST_CASE("animation_frame_time_integration") {
    auto kermit_script = load_animation_script("kermit", "kermit.txt");
    auto anim = create_animation(kermit_script, "walkfront");
    update_animation(anim);
    auto frame_time = animation_frame_time(anim);
    REQUIRE(frame_time > 0);
    free_animation(anim);
    free_animation_script(kermit_script);
}
TEST_CASE("animation_index_integration") {
    auto script = load_animation_script("kermit", "kermit.txt");
    auto index = animation_index(script, "walkfront");
    REQUIRE(index > -1);
    auto non_existent_index = animation_index(script, "NonExistentAnimation");
    REQUIRE(-1 == non_existent_index);
    free_animation_script(script);
}
TEST_CASE("animation_name_integration") {
    auto kermit_script = load_animation_script("kermit", "kermit.txt");
    auto anim = create_animation(kermit_script, "moonwalkback");
    auto anim_name = animation_name(anim);
    REQUIRE("moonwalkback" == anim_name);
    free_animation(anim);
    free_animation_script(kermit_script);
}
TEST_CASE("animation_script_name_integration") {
    auto kermit_script = load_animation_script("kermit", "kermit.txt");
    auto script_name = animation_script_name(kermit_script);
    REQUIRE("kermit" == script_name);
    free_animation_script(kermit_script);
}
TEST_CASE("animation_script_named_integration") {
    auto kermit_script = load_animation_script("kermit", "kermit.txt");
    auto loaded_script = animation_script_named("kermit");
    REQUIRE(loaded_script != nullptr);
    auto script_name = animation_script_name(loaded_script);
    REQUIRE("kermit" == script_name);
    free_animation_script(kermit_script);
}
TEST_CASE("assign_animation_with_script_integration") {
    auto kermit_script = load_animation_script("kermit", "kermit.txt");
    auto anim = create_animation(kermit_script, "moonwalkback");
    assign_animation(anim, kermit_script, "walkfront");
    REQUIRE("walkfront" == animation_name(anim));
    free_animation_script(kermit_script);
    free_animation(anim);
}
TEST_CASE("assign_animation_with_script_and_sound_integration") {
    auto kermit_script = load_animation_script("kermit", "kermit.txt");
    auto anim = create_animation(kermit_script, "walkfront");
    assign_animation(anim, kermit_script, "walkleft", true);
    REQUIRE("walkleft" == animation_name(anim));
    free_animation(anim);
    free_animation_script(kermit_script);
}
TEST_CASE("assign_animation_index_with_script_integration") {
    auto kermit_script = load_animation_script("kermit", "kermit.txt");
    auto anim = create_animation(kermit_script, "moonwalkback");
    assign_animation(anim, kermit_script, 0);
    REQUIRE("walkfront" == animation_name(anim));
    free_animation_script(kermit_script);
    free_animation(anim);
}
TEST_CASE("assign_animation_index_with_script_and_sound_integration") {
    auto kermit_script = load_animation_script("kermit", "kermit.txt");
    auto anim = create_animation(kermit_script, "moonwalkback");
    assign_animation(anim, kermit_script, 0, true);
    REQUIRE("walkfront" == animation_name(anim));
    free_animation_script(kermit_script);
    free_animation(anim);
}
TEST_CASE("assign_animation_with_script_named_integration") {
    auto kermit_script = load_animation_script("kermit", "kermit.txt");
    auto anim = create_animation(kermit_script, "moonwalkback");
    assign_animation(anim, "kermit", "walkfront");
    REQUIRE("walkfront" == animation_name(anim));
    free_animation_script(kermit_script);
    free_animation(anim);
}
TEST_CASE("assign_animation_with_script_named_and_sound_integration") {
    auto kermit_script = load_animation_script("kermit", "kermit.txt");
    auto anim = create_animation(kermit_script, "walkfront");
    assign_animation(anim, "kermit", "walkfront", true);
    REQUIRE("walkfront" == animation_name(anim));
    free_animation(anim);
    free_animation_script(kermit_script);
}
TEST_CASE("assign_animation_index_integration") {
    auto kermit_script = load_animation_script("kermit", "kermit.txt");
    auto anim = create_animation(kermit_script, "moonwalkback");
    assign_animation(anim, 0);
    REQUIRE(0 == animation_current_cell(anim));
    free_animation(anim);
    free_animation_script(kermit_script);
}
TEST_CASE("assign_animation_index_with_sound_integration") {
    auto kermit_script = load_animation_script("kermit", "kermit.txt");
    auto anim = create_animation(kermit_script, "moonwalkback", false);
    assign_animation(anim, 0, true);
    REQUIRE(animation_entered_frame(anim));
    free_animation_script(kermit_script);
    free_animation(anim);
}
TEST_CASE("assign_animation_integration") {
    auto kermit_script = load_animation_script("kermit", "kermit.txt");
    auto anim = create_animation(kermit_script, "moonwalkback");
    assign_animation(anim, "walkfront");
    REQUIRE("walkfront" == animation_name(anim));
    free_animation(anim);
    free_animation_script(kermit_script);
}
TEST_CASE("assign_animation_with_sound_integration") {
    auto kermit_script = load_animation_script("kermit", "kermit.txt");
    auto anim = create_animation(kermit_script, "moonwalkback");
    assign_animation(anim, "walkfront", true);
    REQUIRE("walkfront" == animation_name(anim));
    free_animation_script(kermit_script);
    free_animation(anim);
}
TEST_CASE("create_animation_from_index_with_sound_integration") {
    auto kermit_script = load_animation_script("kermit", "kermit.txt");
    auto anim = create_animation(kermit_script, 0, true);
    REQUIRE(anim != nullptr);
    auto anim_name = animation_name(anim);
    REQUIRE("walkfront" == anim_name);
    free_animation(anim);
    free_animation_script(kermit_script);
}
TEST_CASE("create_animation_integration") {
    auto kermit_script = load_animation_script("kermit", "kermit.txt");
    auto anim = create_animation(kermit_script, "moonwalkback");
    REQUIRE(anim != nullptr);
    auto anim_name = animation_name(anim);
    REQUIRE("moonwalkback" == anim_name);
    free_animation(anim);
    free_animation_script(kermit_script);
}
TEST_CASE("create_animation_with_sound_integration") {
    auto kermit_script = load_animation_script("kermit", "kermit.txt");
    auto anim = create_animation(kermit_script, "moonwalkback", true);
    REQUIRE(anim != nullptr);
    auto anim_name = animation_name(anim);
    REQUIRE("moonwalkback" == anim_name);
    free_animation_script(kermit_script);
    free_animation(anim);
}
TEST_CASE("create_animation_from_script_named_integration") {
    auto kermit_script = load_animation_script("kermit", "kermit.txt");
    auto anim = create_animation("kermit", "moonwalkback");
    REQUIRE(anim != nullptr);
    auto anim_name = animation_name(anim);
    REQUIRE("moonwalkback" == anim_name);
    free_animation(anim);
    free_animation_script(kermit_script);
}
TEST_CASE("create_animation_from_script_named_with_sound_integration") {
    auto kermit_script = load_animation_script("kermit", "kermit.txt");
    auto anim = create_animation(kermit_script, "moonwalkback", true);
    REQUIRE(anim != nullptr);
    auto anim_name = animation_name(anim);
    REQUIRE("moonwalkback" == anim_name);
    free_animation_script(kermit_script);
    free_animation(anim);
}
TEST_CASE("free_all_animation_scripts_integration") {
    auto kermit_script = load_animation_script("kermit", "kermit.txt");
    REQUIRE(has_animation_script("kermit"));
    free_all_animation_scripts();
    REQUIRE_FALSE(has_animation_script("kermit"));
}
TEST_CASE("free_animation_integration") {
    auto kermit_script = load_animation_script("kermit", "kermit.txt");
    auto anim = create_animation(kermit_script, "moonwalkback");
    free_animation(anim);
    REQUIRE(anim == nullptr);
    free_animation_script(kermit_script);
}
TEST_CASE("free_animation_script_integration") {
    auto script = load_animation_script("kermit", "kermit.txt");
    REQUIRE(script != nullptr);
    free_animation_script(script);
    auto script_exists = has_animation_script("kermit");
    REQUIRE_FALSE(script_exists);
}
TEST_CASE("free_animation_script_with_name_integration") {
    auto kermit_script = load_animation_script("kermit", "kermit.txt");
    REQUIRE(has_animation_script("kermit"));
    free_animation_script("kermit");
    REQUIRE_FALSE(has_animation_script("kermit"));
}
TEST_CASE("has_animation_named_integration") {
    auto kermit_script = load_animation_script("kermit", "kermit.txt");
    auto has_walkfront = has_animation_named(kermit_script, "walkfront");
    REQUIRE(has_walkfront);
    auto has_nonexistent = has_animation_named(kermit_script, "NonExistentAnimation");
    REQUIRE_FALSE(has_nonexistent);
    free_animation_script(kermit_script);
}
TEST_CASE("has_animation_script_integration") {
    auto kermit_script = load_animation_script("kermit", "kermit.txt");
    REQUIRE(has_animation_script("kermit"));
    free_animation_script(kermit_script);
    REQUIRE_FALSE(has_animation_script("kermit"));
}
TEST_CASE("load_animation_script_integration") {
    auto loaded_script = load_animation_script("test_animation", "kermit.txt");
    REQUIRE(loaded_script != nullptr);
    auto script_name = animation_script_name(loaded_script);
    REQUIRE("test_animation" == script_name);
    free_animation_script(loaded_script);
    auto script_exists = has_animation_script("test_animation");
    REQUIRE_FALSE(script_exists);
}
TEST_CASE("restart_animation_integration") {
    auto kermit_script = load_animation_script("kermit", "kermit.txt");
    auto anim = create_animation(kermit_script, "moonwalkback");
    update_animation(anim);
    auto anim_ended = animation_ended(anim);
    REQUIRE(anim_ended);
    restart_animation(anim);
    auto anim_ended_after_restart = animation_ended(anim);
    REQUIRE_FALSE(anim_ended_after_restart);
    free_animation(anim);
    free_animation_script(kermit_script);
}
TEST_CASE("restart_animation_with_sound_integration") {
    auto kermit_script = load_animation_script("kermit", "kermit.txt");
    auto anim = create_animation(kermit_script, "moonwalkback", true);
    update_animation(anim);
    restart_animation(anim, true);
    REQUIRE(3 == animation_current_cell(anim));
    free_animation(anim);
    free_animation_script(kermit_script);
}
TEST_CASE("update_animation_percent_with_sound_integration") {
    auto kermit_script = load_animation_script("kermit", "kermit.txt");
    auto anim = create_animation(kermit_script, "moonwalkback");
    update_animation(anim, 0.5, true);
    REQUIRE(animation_frame_time(anim) > 0);
    free_animation(anim);
    free_animation_script(kermit_script);
}
TEST_CASE("update_animation_integration") {
    auto kermit_script = load_animation_script("kermit", "kermit.txt");
    auto anim = create_animation(kermit_script, "moonwalkback");
    update_animation(anim);
    REQUIRE(0 != animation_current_cell(anim));
    free_animation(anim);
    free_animation_script(kermit_script);
}
TEST_CASE("update_animation_percent_integration") {
    auto kermit_script = load_animation_script("kermit", "kermit.txt");
    auto anim = create_animation(kermit_script, "walkfront");
    update_animation(anim, 0.5);
    REQUIRE(animation_frame_time(anim) > 0);
    free_animation(anim);
    free_animation_script(kermit_script);
}
