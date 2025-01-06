#include <catch2/catch_all.hpp>
#include <limits>
#include "splashkit.h"
#include "../helpers.hpp"
struct TestSpritesFixture
{
    TestSpritesFixture()
    {
        set_resources_path("/mnt/c/Users/Noahc/Documents/aYear_2_semester_2/TeamProject/GitHubRepo/splashkit_test_generator/resources");
    }
};
TEST_CASE_METHOD(TestSpritesFixture, "call_for_all_sprites_with_value_integration") {
    auto test_sprite_delegates = sprite_delegates();
    auto test_bitmap = create_bitmap("Test Bitmap 1", 100, 100);
    bitmap_cleanup cleanup_bitmap;
    create_sprite(test_bitmap);
    sprite_cleanup cleanup_sprite;
    create_sprite(test_bitmap);
    call_for_all_sprites(test_sprite_delegates.sprite_float_function(), 300.0f);
    REQUIRE(2 == test_sprite_delegates.float_function_call_count());
    REQUIRE(test_sprite_delegates.event_called());
}
TEST_CASE_METHOD(TestSpritesFixture, "call_for_all_sprites_integration") {
    auto test_sprite_delegates = sprite_delegates();
    auto test_bitmap = create_bitmap("Test Bitmap 2", 100, 100);
    bitmap_cleanup cleanup_bitmap;
    create_sprite(test_bitmap);
    sprite_cleanup cleanup_sprite;
    create_sprite(test_bitmap);
    call_for_all_sprites(test_sprite_delegates.sprite_function());
    REQUIRE(2 == test_sprite_delegates.function_call_count());
    REQUIRE(test_sprite_delegates.event_called());
}
TEST_CASE_METHOD(TestSpritesFixture, "call_on_sprite_event_integration") {
    auto test_sprite_delegates = sprite_delegates();
    auto test_bitmap = create_bitmap("Test Bitmap 34", 100, 100);
    bitmap_cleanup cleanup_bitmap;
    auto test_animation = load_animation_script("Test Script 6", "kermit.txt");
    animation_script_cleanup cleanup_animation_script;
    auto test_sprite = create_sprite(test_bitmap, test_animation);
    sprite_cleanup cleanup_sprite;
    call_on_sprite_event(test_sprite_delegates.sprite_event_handler());
    update_sprite(test_sprite);
    stop_calling_on_sprite_event(test_sprite_delegates.sprite_event_handler());
    REQUIRE(test_sprite_delegates.event_called());
}
TEST_CASE_METHOD(TestSpritesFixture, "center_point_of_sprite_integration") {
    auto test_bitmap = create_bitmap("Test Bitmap 3", 100, 100);
    bitmap_cleanup cleanup_bitmap;
    auto test_sprite = create_sprite(test_bitmap);
    sprite_cleanup cleanup_sprite;
    sprite_set_position(test_sprite, point_at(100.0, 100.0));
    auto test_center_point = center_point(test_sprite);
    REQUIRE(150.0 == test_center_point.x);
    REQUIRE(150.0 == test_center_point.y);
}
TEST_CASE_METHOD(TestSpritesFixture, "create_sprite_integration") {
    auto test_bitmap = create_bitmap("Test Bitmap 4", 100, 100);
    bitmap_cleanup cleanup_bitmap;
    auto test_sprite = create_sprite(test_bitmap);
    sprite_cleanup cleanup_sprite;
    REQUIRE(test_sprite != nullptr);
    REQUIRE(has_sprite(sprite_name(test_sprite)));
}
TEST_CASE_METHOD(TestSpritesFixture, "create_sprite_with_animation_integration") {
    auto test_bitmap = create_bitmap("Test Bitmap 5", 100, 100);
    bitmap_cleanup cleanup_bitmap;
    auto test_animation = load_animation_script("Test Script 1", "kermit.txt");
    animation_script_cleanup cleanup_animation_script;
    auto test_sprite = create_sprite(test_bitmap, test_animation);
    sprite_cleanup cleanup_sprite;
    REQUIRE(test_sprite != nullptr);
    REQUIRE(has_sprite(sprite_name(test_sprite)));
}
TEST_CASE_METHOD(TestSpritesFixture, "create_sprite_with_bitmap_named_integration") {
    create_bitmap("Test Bitmap 6", 100, 100);
    bitmap_cleanup cleanup_bitmap;
    auto test_sprite = create_sprite("Test Bitmap 6");
    sprite_cleanup cleanup_sprite;
    REQUIRE(test_sprite != nullptr);
    REQUIRE(has_sprite(sprite_name(test_sprite)));
}
TEST_CASE_METHOD(TestSpritesFixture, "create_sprite_named_integration") {
    auto test_bitmap = create_bitmap("Test Bitmap 7", 100, 100);
    bitmap_cleanup cleanup_bitmap;
    auto test_sprite = create_sprite("Test Sprite 1", test_bitmap);
    sprite_cleanup cleanup_sprite;
    REQUIRE(test_sprite != nullptr);
    REQUIRE("Test Sprite 1" == sprite_name(test_sprite));
}
TEST_CASE_METHOD(TestSpritesFixture, "create_sprite_named_with_animation_integration") {
    auto test_bitmap = create_bitmap("Test Bitmap 8", 100, 100);
    bitmap_cleanup cleanup_bitmap;
    auto test_animation = load_animation_script("Test Script 2", "kermit.txt");
    animation_script_cleanup cleanup_animation_script;
    auto test_sprite = create_sprite("Test Sprite 2", test_bitmap, test_animation);
    sprite_cleanup cleanup_sprite;
    REQUIRE(test_sprite != nullptr);
    REQUIRE("Test Sprite 2" == sprite_name(test_sprite));
}
TEST_CASE_METHOD(TestSpritesFixture, "create_sprite_with_bitmap_and_animation_named_integration") {
    create_bitmap("Test Bitmap 9", 100, 100);
    bitmap_cleanup cleanup_bitmap;
    load_animation_script("Test Script 3", "kermit.txt");
    animation_script_cleanup cleanup_animation_script;
    auto test_sprite = create_sprite("Test Bitmap 9", "test_animation");
    sprite_cleanup cleanup_sprite;
    REQUIRE(test_sprite != nullptr);
    REQUIRE(has_sprite(sprite_name(test_sprite)));
}
TEST_CASE_METHOD(TestSpritesFixture, "create_sprite_pack_integration") {
    REQUIRE_FALSE(has_sprite_pack("Test Sprite Pack 1"));
    create_sprite_pack("Test Sprite Pack 1");
    sprite_pack_cleanup cleanup_sprite_pack("Test Sprite Pack 1");
    REQUIRE(has_sprite_pack("Test Sprite Pack 1"));
}
TEST_CASE_METHOD(TestSpritesFixture, "current_sprite_pack_integration") {
    REQUIRE("default" == current_sprite_pack());
    create_sprite_pack("Test Sprite Pack 2");
    sprite_pack_cleanup cleanup_sprite_pack("Test Sprite Pack 2");
    select_sprite_pack("Test Sprite Pack 2");
    REQUIRE("Test Sprite Pack 2" == current_sprite_pack());
}
TEST_CASE_METHOD(TestSpritesFixture, "draw_all_sprites_integration") {
    auto test_window = open_window("Test Window 1", 800, 600);
    window_cleanup cleanup_window;
    auto test_bitmap = create_bitmap("Test Bitmap 10", 100, 100);
    bitmap_cleanup cleanup_bitmap;
    clear_bitmap(test_bitmap, color_black());
    auto test_sprite1 = create_sprite(test_bitmap);
    sprite_cleanup cleanup_sprite;
    auto test_sprite2 = create_sprite(test_bitmap);
    sprite_set_position(test_sprite1, point_at(100.0, 100.0));
    sprite_set_position(test_sprite2, point_at(200.0, 200.0));
    clear_screen(color_white());
    draw_all_sprites();
    refresh_screen();
    REQUIRE(color_black() == get_pixel(test_window, 100.0, 100.0));
    REQUIRE(color_black() == get_pixel(test_window, 200.0, 200.0));
}
TEST_CASE_METHOD(TestSpritesFixture, "draw_sprite_offset_by_integration") {
    auto test_window = open_window("Test Window 3", 800, 600);
    window_cleanup cleanup_window;
    auto test_bitmap = create_bitmap("Test Bitmap 12", 100, 100);
    bitmap_cleanup cleanup_bitmap;
    clear_bitmap(test_bitmap, color_black());
    auto test_sprite = create_sprite(test_bitmap);
    sprite_cleanup cleanup_sprite;
    sprite_set_position(test_sprite, point_at(400.0, 300.0));
    clear_screen(color_white());
    draw_sprite(test_sprite, vector_from_angle(50.0, 50.0));
    refresh_screen();
    REQUIRE(color_white() != get_pixel(test_window, 450.0, 350.0));
}
TEST_CASE_METHOD(TestSpritesFixture, "draw_sprite_integration") {
    auto test_window = open_window("Test Window 4", 800, 600);
    window_cleanup cleanup_window;
    auto test_bitmap = create_bitmap("Test Bitmap 13", 100, 100);
    bitmap_cleanup cleanup_bitmap;
    clear_bitmap(test_bitmap, color_black());
    auto test_sprite = create_sprite(test_bitmap);
    sprite_cleanup cleanup_sprite;
    sprite_set_position(test_sprite, point_at(400.0, 300.0));
    clear_screen(color_white());
    draw_sprite(test_sprite);
    refresh_screen();
    REQUIRE(color_black() == get_pixel(test_window, 400.0, 300.0));
}
TEST_CASE_METHOD(TestSpritesFixture, "draw_sprite_offset_x_y_integration") {
    auto test_window = open_window("Test Window 2", 800, 600);
    window_cleanup cleanup_window;
    auto test_bitmap = create_bitmap("Test Bitmap 11", 100, 100);
    bitmap_cleanup cleanup_bitmap;
    clear_bitmap(test_bitmap, color_black());
    auto test_sprite = create_sprite(test_bitmap);
    sprite_cleanup cleanup_sprite;
    sprite_set_position(test_sprite, point_at(400.0, 300.0));
    clear_screen(color_white());
    draw_sprite(test_sprite, 50.0, 50.0);
    refresh_screen();
    REQUIRE(color_white() != get_pixel(test_window, 450.0, 350.0));
}
TEST_CASE_METHOD(TestSpritesFixture, "free_all_sprites_integration") {
    auto test_bitmap = create_bitmap("Test Bitmap 14", 100, 100);
    bitmap_cleanup cleanup_bitmap;
    create_sprite("Test Sprite 3", test_bitmap);
    sprite_cleanup cleanup_sprite;
    create_sprite("Test Sprite 4", test_bitmap);
    REQUIRE(has_sprite("Test Sprite 3"));
    REQUIRE(has_sprite("Test Sprite 4"));
    free_all_sprites();
    REQUIRE_FALSE(has_sprite("Test Sprite 3"));
    REQUIRE_FALSE(has_sprite("Test Sprite 4"));
}
TEST_CASE_METHOD(TestSpritesFixture, "free_sprite_integration") {
    auto test_bitmap = create_bitmap("Test Bitmap 15", 100, 100);
    bitmap_cleanup cleanup_bitmap;
    auto test_sprite = create_sprite("Test Sprite 5", test_bitmap);
    sprite_cleanup cleanup_sprite;
    REQUIRE(has_sprite("Test Sprite 5"));
    free_sprite(test_sprite);
    REQUIRE_FALSE(has_sprite("Test Sprite 5"));
}
TEST_CASE_METHOD(TestSpritesFixture, "free_sprite_pack_integration") {
    REQUIRE("default" == current_sprite_pack());
    create_sprite_pack("Test Sprite Pack 3");
    sprite_pack_cleanup cleanup_sprite_pack("Test Sprite Pack 3");
    select_sprite_pack("Test Sprite Pack 3");
    REQUIRE(has_sprite_pack("Test Sprite Pack 3"));
    REQUIRE("Test Sprite Pack 3" == current_sprite_pack());
    free_sprite_pack("Test Sprite Pack 3");
    REQUIRE_FALSE(has_sprite_pack("Test Sprite Pack 3"));
    REQUIRE("default" == current_sprite_pack());
}
TEST_CASE_METHOD(TestSpritesFixture, "has_sprite_integration") {
    auto test_bitmap = create_bitmap("Test Bitmap 16", 100, 100);
    bitmap_cleanup cleanup_bitmap;
    REQUIRE_FALSE(has_sprite("Test Sprite 6"));
    auto test_sprite = create_sprite("Test Sprite 6", test_bitmap);
    sprite_cleanup cleanup_sprite;
    REQUIRE(has_sprite("Test Sprite 6"));
    free_sprite(test_sprite);
    REQUIRE_FALSE(has_sprite("Test Sprite 6"));
}
TEST_CASE_METHOD(TestSpritesFixture, "has_sprite_pack_integration") {
    REQUIRE_FALSE(has_sprite_pack("Test Sprite Pack 4"));
    create_sprite_pack("Test Sprite Pack 4");
    sprite_pack_cleanup cleanup_sprite_pack("Test Sprite Pack 4");
    REQUIRE(has_sprite_pack("Test Sprite Pack 4"));
    free_sprite_pack("Test Sprite Pack 4");
    REQUIRE_FALSE(has_sprite_pack("Test Sprite Pack 4"));
}
TEST_CASE_METHOD(TestSpritesFixture, "move_sprite_integration") {
    auto test_bitmap = create_bitmap("Test Bitmap 17", 100, 100);
    bitmap_cleanup cleanup_bitmap;
    auto test_sprite = create_sprite(test_bitmap);
    sprite_cleanup cleanup_sprite;
    auto start_position = point_at(100.0, 100.0);
    sprite_set_position(test_sprite, start_position);
    sprite_set_velocity(test_sprite, vector_to(10.0, 10.0));
    move_sprite(test_sprite);
    REQUIRE(110.0f == sprite_x(test_sprite));
    REQUIRE(110.0f == sprite_y(test_sprite));
}
TEST_CASE_METHOD(TestSpritesFixture, "move_sprite_by_vector_integration") {
    auto test_bitmap = create_bitmap("Test Bitmap 18", 100, 100);
    bitmap_cleanup cleanup_bitmap;
    auto test_sprite = create_sprite(test_bitmap);
    sprite_cleanup cleanup_sprite;
    sprite_set_position(test_sprite, point_at(100.0, 100.0));
    move_sprite(test_sprite, vector_to(50.0, 50.0));
    REQUIRE(150.0f == sprite_x(test_sprite));
    REQUIRE(150.0f == sprite_y(test_sprite));
}
TEST_CASE_METHOD(TestSpritesFixture, "move_sprite_by_vector_percent_integration") {
    auto test_bitmap = create_bitmap("Test Bitmap 19", 100, 100);
    bitmap_cleanup cleanup_bitmap;
    auto test_sprite = create_sprite(test_bitmap);
    sprite_cleanup cleanup_sprite;
    sprite_set_position(test_sprite, point_at(100.0, 100.0));
    move_sprite(test_sprite, vector_to(50.0, 50.0), 0.5f);
    REQUIRE(125.0f == sprite_x(test_sprite));
    REQUIRE(125.0f == sprite_y(test_sprite));
}
TEST_CASE_METHOD(TestSpritesFixture, "move_sprite_percent_integration") {
    auto test_bitmap = create_bitmap("Test Bitmap 20", 100, 100);
    bitmap_cleanup cleanup_bitmap;
    auto test_sprite = create_sprite(test_bitmap);
    sprite_cleanup cleanup_sprite;
    sprite_set_position(test_sprite, point_at(100.0, 100.0));
    sprite_set_velocity(test_sprite, vector_to(10.0, 10.0));
    move_sprite(test_sprite, 0.5f);
    REQUIRE(105.0f == sprite_x(test_sprite));
    REQUIRE(105.0f == sprite_y(test_sprite));
}
TEST_CASE_METHOD(TestSpritesFixture, "move_sprite_to_integration") {
    auto test_bitmap = create_bitmap("Test Bitmap 21", 100, 100);
    bitmap_cleanup cleanup_bitmap;
    auto test_sprite = create_sprite(test_bitmap);
    sprite_cleanup cleanup_sprite;
    move_sprite_to(test_sprite, 400.0, 300.0);
    REQUIRE(400.0f == sprite_x(test_sprite));
    REQUIRE(300.0f == sprite_y(test_sprite));
}
TEST_CASE_METHOD(TestSpritesFixture, "select_sprite_pack_integration") {
    create_sprite_pack("Test Sprite Pack 5");
    sprite_pack_cleanup cleanup_sprite_pack("Test Sprite Pack 5");
    REQUIRE("default" == current_sprite_pack());
    select_sprite_pack("Test Sprite Pack 5");
    REQUIRE("Test Sprite Pack 5" == current_sprite_pack());
}
TEST_CASE_METHOD(TestSpritesFixture, "sprite_add_layer_integration") {
    auto test_bitmap = create_bitmap("Test Bitmap 22", 100, 100);
    bitmap_cleanup cleanup_bitmap;
    auto test_sprite = create_sprite(test_bitmap);
    sprite_cleanup cleanup_sprite;
    auto new_layer_bitmap = create_bitmap("Test Bitmap 23", 50, 50);
    auto layer_index = sprite_add_layer(test_sprite, new_layer_bitmap, "Test Bitmap 23");
    REQUIRE(1 == layer_index);
    REQUIRE(2 == sprite_layer_count(test_sprite));
}
TEST_CASE_METHOD(TestSpritesFixture, "sprite_add_to_velocity_integration") {
    auto test_bitmap = create_bitmap("Test Bitmap 24", 100, 100);
    bitmap_cleanup cleanup_bitmap;
    auto test_sprite = create_sprite(test_bitmap);
    sprite_cleanup cleanup_sprite;
    sprite_set_velocity(test_sprite, vector_to(0.0, 0.0));
    sprite_add_to_velocity(test_sprite, vector_to(10.0, 10.0));
    auto velocity = sprite_velocity(test_sprite);
    REQUIRE(10.0 == velocity.x);
    REQUIRE(10.0 == velocity.y);
}
TEST_CASE_METHOD(TestSpritesFixture, "sprite_add_value_integration") {
    auto test_bitmap = create_bitmap("Test Bitmap 25", 100, 100);
    bitmap_cleanup cleanup_bitmap;
    auto test_sprite = create_sprite(test_bitmap);
    sprite_cleanup cleanup_sprite;
    sprite_add_value(test_sprite, "health", 100.0f);
    REQUIRE(sprite_has_value(test_sprite, "health"));
    REQUIRE(100.0f == sprite_value(test_sprite, "health"));
}
TEST_CASE_METHOD(TestSpritesFixture, "sprite_add_value_with_default_integration") {
    auto test_bitmap = create_bitmap("Test Bitmap 26", 100, 100);
    bitmap_cleanup cleanup_bitmap;
    auto test_sprite = create_sprite(test_bitmap);
    sprite_cleanup cleanup_sprite;
    sprite_add_value(test_sprite, "health", 100.0f);
    REQUIRE(sprite_has_value(test_sprite, "health"));
    REQUIRE(100.0f == sprite_value(test_sprite, "health"));
}
TEST_CASE_METHOD(TestSpritesFixture, "sprite_anchor_point_integration") {
    auto test_bitmap = create_bitmap("Test Bitmap 27", 100, 100);
    bitmap_cleanup cleanup_bitmap;
    auto test_sprite = create_sprite(test_bitmap);
    sprite_cleanup cleanup_sprite;
    auto anchor_point = sprite_anchor_point(test_sprite);
    REQUIRE(50.0 == anchor_point.x);
    REQUIRE(50.0 == anchor_point.y);
}
TEST_CASE_METHOD(TestSpritesFixture, "sprite_anchor_position_integration") {
    auto test_bitmap = create_bitmap("Test Bitmap 28", 100, 100);
    bitmap_cleanup cleanup_bitmap;
    auto test_sprite = create_sprite(test_bitmap);
    sprite_cleanup cleanup_sprite;
    sprite_set_position(test_sprite, point_at(100.0, 100.0));
    auto anchor_position = sprite_anchor_position(test_sprite);
    REQUIRE(150.0 == anchor_position.x);
    REQUIRE(150.0 == anchor_position.y);
}
TEST_CASE_METHOD(TestSpritesFixture, "sprite_animation_has_ended_integration") {
    auto test_bitmap = create_bitmap("Test Bitmap 29", 100, 100);
    bitmap_cleanup cleanup_bitmap;
    auto test_animation = load_animation_script("Test Script 4", "kermit.txt");
    animation_script_cleanup cleanup_animation_script;
    auto test_sprite = create_sprite(test_bitmap, test_animation);
    sprite_cleanup cleanup_sprite;
    sprite_start_animation(test_sprite, "walkfront");
    REQUIRE_FALSE(sprite_animation_has_ended(test_sprite));
    for (int i = 0; i < 5; ++i) {
        update_sprite_animation(test_sprite, 100.0f);
    }
    REQUIRE(sprite_animation_has_ended(test_sprite));
}
TEST_CASE_METHOD(TestSpritesFixture, "sprite_animation_name_integration") {
    auto test_bitmap = create_bitmap("Test Bitmap 30", 100, 100);
    bitmap_cleanup cleanup_bitmap;
    auto test_animation = load_animation_script("Test Script 5", "kermit.txt");
    animation_script_cleanup cleanup_animation_script;
    auto test_sprite = create_sprite(test_bitmap, test_animation);
    sprite_cleanup cleanup_sprite;
    sprite_start_animation(test_sprite, "walkfront");
    REQUIRE("walkfront" == sprite_animation_name(test_sprite));
}
TEST_CASE_METHOD(TestSpritesFixture, "sprite_at_integration") {
    auto test_bitmap = create_bitmap("Test Bitmap 31", 100, 100);
    bitmap_cleanup cleanup_bitmap;
    clear_bitmap(test_bitmap, color_red());
    setup_collision_mask(test_bitmap);
    auto test_sprite = create_sprite(test_bitmap);
    sprite_cleanup cleanup_sprite;
    sprite_set_x(test_sprite, 400.0f);
    sprite_set_y(test_sprite, 300.0f);
    REQUIRE(sprite_at(test_sprite, point_at(451.0, 350.0)));
    REQUIRE_FALSE(sprite_at(test_sprite, point_at(600.0, 500.0)));
}
TEST_CASE_METHOD(TestSpritesFixture, "sprite_bring_layer_forward_integration") {
    auto test_bitmap = create_bitmap("Test Bitmap 33", 100, 100);
    bitmap_cleanup cleanup_bitmap;
    auto test_sprite = create_sprite(test_bitmap);
    sprite_cleanup cleanup_sprite;
    auto layer_index = sprite_add_layer(test_sprite, test_bitmap, "layer2");
    sprite_show_layer(test_sprite, layer_index);
    auto visible_index = sprite_visible_index_of_layer(test_sprite, layer_index);
    sprite_bring_layer_forward(test_sprite, visible_index);
    REQUIRE(0 == sprite_visible_index_of_layer(test_sprite, layer_index));
}
TEST_CASE_METHOD(TestSpritesFixture, "sprite_bring_layer_to_front_integration") {
    auto test_bitmap = create_bitmap("Test Bitmap 32", 100, 100);
    bitmap_cleanup cleanup_bitmap;
    auto test_sprite = create_sprite(test_bitmap);
    sprite_cleanup cleanup_sprite;
    auto layer_index = sprite_add_layer(test_sprite, test_bitmap, "layer2");
    sprite_show_layer(test_sprite, layer_index);
    auto visible_index = sprite_visible_index_of_layer(test_sprite, layer_index);
    sprite_bring_layer_to_front(test_sprite, visible_index);
    REQUIRE(0 == sprite_visible_index_of_layer(test_sprite, "layer2"));
}
TEST_CASE_METHOD(TestSpritesFixture, "sprite_call_on_event_integration") {
    auto test_sprite_delegates = sprite_delegates();
    auto test_bitmap = create_bitmap("Test Bitmap 35", 100, 100);
    bitmap_cleanup cleanup_bitmap;
    auto test_sprite = create_sprite(test_bitmap);
    sprite_cleanup cleanup_sprite;
    sprite_call_on_event(test_sprite, test_sprite_delegates.sprite_event_handler());
    update_sprite(test_sprite);
    stop_calling_on_sprite_event(test_sprite_delegates.sprite_event_handler());
    REQUIRE(test_sprite_delegates.event_called());
}
TEST_CASE_METHOD(TestSpritesFixture, "sprite_circle_integration") {
    auto test_bitmap = create_bitmap("Test Bitmap 36", 100, 100);
    bitmap_cleanup cleanup_bitmap;
    auto test_sprite = create_sprite(test_bitmap);
    sprite_cleanup cleanup_sprite;
    auto circle = sprite_circle(test_sprite);
    REQUIRE(50.0 == circle.center.x);
    REQUIRE(50.0 == circle.center.y);
    REQUIRE(50.0 == circle.radius);
}
TEST_CASE_METHOD(TestSpritesFixture, "sprite_collision_bitmap_integration") {
    auto test_bitmap = create_bitmap("Test Bitmap 37", 100, 100);
    bitmap_cleanup cleanup_bitmap;
    auto test_sprite = create_sprite(test_bitmap);
    sprite_cleanup cleanup_sprite;
    auto collision_bitmap = sprite_collision_bitmap(test_sprite);
    REQUIRE(test_bitmap == collision_bitmap);
}
TEST_CASE_METHOD(TestSpritesFixture, "sprite_collision_circle_integration") {
    auto test_bitmap = create_bitmap("Test Bitmap 38", 100, 100);
    bitmap_cleanup cleanup_bitmap;
    auto test_sprite = create_sprite(test_bitmap);
    sprite_cleanup cleanup_sprite;
    auto circle = sprite_collision_circle(test_sprite);
    REQUIRE(50.0 == circle.center.x);
    REQUIRE(50.0 == circle.center.y);
    REQUIRE(50.0 == circle.radius);
}
TEST_CASE_METHOD(TestSpritesFixture, "sprite_collision_kind_integration") {
    auto test_bitmap = create_bitmap("Test Bitmap 39", 100, 100);
    bitmap_cleanup cleanup_bitmap;
    auto test_sprite = create_sprite(test_bitmap);
    sprite_cleanup cleanup_sprite;
    REQUIRE(collision_test_kind::PIXEL_COLLISIONS == sprite_collision_kind(test_sprite));
    sprite_set_collision_kind(test_sprite, collision_test_kind::AABB_COLLISIONS);
    REQUIRE(collision_test_kind::AABB_COLLISIONS == sprite_collision_kind(test_sprite));
}
TEST_CASE_METHOD(TestSpritesFixture, "sprite_collision_rectangle_integration") {
    auto test_bitmap = create_bitmap("Test Bitmap 40", 100, 100);
    bitmap_cleanup cleanup_bitmap;
    auto test_sprite = create_sprite(test_bitmap);
    sprite_cleanup cleanup_sprite;
    auto rect = sprite_collision_rectangle(test_sprite);
    REQUIRE(0.0 == rect.x);
    REQUIRE(0.0 == rect.y);
    REQUIRE(100.0 == rect.width);
    REQUIRE(100.0 == rect.height);
}
TEST_CASE_METHOD(TestSpritesFixture, "sprite_current_cell_integration") {
    auto test_bitmap = create_bitmap("Test Bitmap 41", 100, 100);
    bitmap_cleanup cleanup_bitmap;
    auto test_animation = load_animation_script("Test Script 7", "kermit.txt");
    animation_script_cleanup cleanup_animation_script;
    auto test_sprite = create_sprite(test_bitmap, test_animation);
    sprite_cleanup cleanup_sprite;
    sprite_start_animation(test_sprite, "walkfront");
    REQUIRE(0 == sprite_current_cell(test_sprite));
    update_sprite(test_sprite, 100.0f);
    REQUIRE(1 == sprite_current_cell(test_sprite));
}
TEST_CASE_METHOD(TestSpritesFixture, "sprite_current_cell_rectangle_integration") {
    auto test_bitmap = create_bitmap("Test Bitmap 42", 100, 100);
    bitmap_cleanup cleanup_bitmap;
    auto test_sprite = create_sprite(test_bitmap);
    sprite_cleanup cleanup_sprite;
    auto rect = sprite_current_cell_rectangle(test_sprite);
    REQUIRE(0.0 == rect.x);
    REQUIRE(0.0 == rect.y);
    REQUIRE(100.0 == rect.width);
    REQUIRE(100.0 == rect.height);
}
TEST_CASE_METHOD(TestSpritesFixture, "sprite_dx_integration") {
    auto test_bitmap = create_bitmap("Test Bitmap 43", 100, 100);
    bitmap_cleanup cleanup_bitmap;
    auto test_sprite = create_sprite(test_bitmap);
    sprite_cleanup cleanup_sprite;
    REQUIRE(0.0 == sprite_dx(test_sprite));
    sprite_set_dx(test_sprite, 5.0f);
    REQUIRE(5.0 == sprite_dx(test_sprite));
}
TEST_CASE_METHOD(TestSpritesFixture, "sprite_dy_integration") {
    auto test_bitmap = create_bitmap("Test Bitmap 44", 100, 100);
    bitmap_cleanup cleanup_bitmap;
    auto test_sprite = create_sprite(test_bitmap);
    sprite_cleanup cleanup_sprite;
    REQUIRE(0.0 == sprite_dy(test_sprite));
    sprite_set_dy(test_sprite, 5.0f);
    REQUIRE(5.0 == sprite_dy(test_sprite));
}
TEST_CASE_METHOD(TestSpritesFixture, "sprite_has_value_integration") {
    auto test_bitmap = create_bitmap("Test Bitmap 45", 100, 100);
    bitmap_cleanup cleanup_bitmap;
    auto test_sprite = create_sprite(test_bitmap);
    sprite_cleanup cleanup_sprite;
    REQUIRE_FALSE(sprite_has_value(test_sprite, "health"));
    sprite_add_value(test_sprite, "health", 100.0f);
    REQUIRE(sprite_has_value(test_sprite, "health"));
    REQUIRE_FALSE(sprite_has_value(test_sprite, "mana"));
}
TEST_CASE_METHOD(TestSpritesFixture, "sprite_heading_integration") {
    auto test_bitmap = create_bitmap("Test Bitmap 46", 100, 100);
    bitmap_cleanup cleanup_bitmap;
    auto test_sprite = create_sprite(test_bitmap);
    sprite_cleanup cleanup_sprite;
    REQUIRE(90.0 == sprite_heading(test_sprite));
    sprite_set_velocity(test_sprite, vector_to(1.0, 1.0));
    REQUIRE(45.0 == sprite_heading(test_sprite));
}
TEST_CASE_METHOD(TestSpritesFixture, "sprite_height_integration") {
    auto test_bitmap = create_bitmap("Test Bitmap 47", 100, 100);
    bitmap_cleanup cleanup_bitmap;
    auto test_sprite = create_sprite(test_bitmap);
    sprite_cleanup cleanup_sprite;
    REQUIRE(100 == sprite_height(test_sprite));
}
TEST_CASE_METHOD(TestSpritesFixture, "sprite_hide_layer_named_integration") {
    auto test_bitmap = create_bitmap("Test Bitmap 48", 100, 100);
    bitmap_cleanup cleanup_bitmap;
    auto test_sprite = create_sprite(test_bitmap);
    sprite_cleanup cleanup_sprite;
    sprite_add_layer(test_sprite, test_bitmap, "layer2");
    sprite_show_layer(test_sprite, "layer2");
    REQUIRE(2 == sprite_visible_layer_count(test_sprite));
    sprite_hide_layer(test_sprite, "layer2");
    REQUIRE(1 == sprite_visible_layer_count(test_sprite));
}
TEST_CASE_METHOD(TestSpritesFixture, "sprite_hide_layer_integration") {
    auto test_bitmap = create_bitmap("Test Bitmap 49", 100, 100);
    bitmap_cleanup cleanup_bitmap;
    auto test_sprite = create_sprite(test_bitmap);
    sprite_cleanup cleanup_sprite;
    auto layer_idx = sprite_add_layer(test_sprite, test_bitmap, "layer2");
    sprite_show_layer(test_sprite, layer_idx);
    REQUIRE(2 == sprite_visible_layer_count(test_sprite));
    sprite_hide_layer(test_sprite, layer_idx);
    REQUIRE(1 == sprite_visible_layer_count(test_sprite));
}
TEST_CASE_METHOD(TestSpritesFixture, "sprite_layer_named_integration") {
    auto test_bitmap = create_bitmap("Test Bitmap 50", 100, 100);
    bitmap_cleanup cleanup_bitmap;
    auto test_sprite = create_sprite(test_bitmap);
    sprite_cleanup cleanup_sprite;
    sprite_add_layer(test_sprite, test_bitmap, "layer2");
    REQUIRE(test_bitmap == sprite_layer(test_sprite, "layer2"));
}
TEST_CASE_METHOD(TestSpritesFixture, "sprite_layer_at_index_integration") {
    auto test_bitmap = create_bitmap("Test Bitmap 51", 100, 100);
    bitmap_cleanup cleanup_bitmap;
    auto test_sprite = create_sprite(test_bitmap);
    sprite_cleanup cleanup_sprite;
    auto layer_idx = sprite_add_layer(test_sprite, test_bitmap, "layer2");
    REQUIRE(test_bitmap == sprite_layer(test_sprite, layer_idx));
}
TEST_CASE_METHOD(TestSpritesFixture, "sprite_layer_circle_named_integration") {
    auto test_bitmap = create_bitmap("Test Bitmap 52", 100, 100);
    bitmap_cleanup cleanup_bitmap;
    auto test_sprite = create_sprite(test_bitmap);
    sprite_cleanup cleanup_sprite;
    auto circle = sprite_layer_circle(test_sprite, "base_layer");
    REQUIRE(50.0 == circle.center.x);
    REQUIRE(50.0 == circle.center.y);
    REQUIRE(50.0 == circle.radius);
}
TEST_CASE_METHOD(TestSpritesFixture, "sprite_layer_circle_at_index_integration") {
    auto test_bitmap = create_bitmap("Test Bitmap 53", 100, 100);
    bitmap_cleanup cleanup_bitmap;
    auto test_sprite = create_sprite(test_bitmap);
    sprite_cleanup cleanup_sprite;
    auto circle = sprite_layer_circle(test_sprite, 0);
    REQUIRE(50.0 == circle.center.x);
    REQUIRE(50.0 == circle.center.y);
    REQUIRE(50.0 == circle.radius);
}
TEST_CASE_METHOD(TestSpritesFixture, "sprite_layer_count_integration") {
    auto test_bitmap = create_bitmap("Test Bitmap 54", 100, 100);
    bitmap_cleanup cleanup_bitmap;
    auto test_sprite = create_sprite(test_bitmap);
    sprite_cleanup cleanup_sprite;
    REQUIRE(1 == sprite_layer_count(test_sprite));
    auto layer_idx = sprite_add_layer(test_sprite, test_bitmap, "layer2");
    REQUIRE(2 == sprite_layer_count(test_sprite));
    REQUIRE(1 == layer_idx);
}
TEST_CASE_METHOD(TestSpritesFixture, "sprite_layer_height_named_integration") {
    auto test_bitmap = create_bitmap("Test Bitmap 55", 100, 100);
    bitmap_cleanup cleanup_bitmap;
    auto test_sprite = create_sprite(test_bitmap);
    sprite_cleanup cleanup_sprite;
    REQUIRE(100 == sprite_layer_height(test_sprite, "base_layer"));
    sprite_add_layer(test_sprite, test_bitmap, "layer2");
    REQUIRE(100 == sprite_layer_height(test_sprite, "layer2"));
}
TEST_CASE_METHOD(TestSpritesFixture, "sprite_layer_height_integration") {
    auto test_bitmap = create_bitmap("Test Bitmap 56", 100, 100);
    bitmap_cleanup cleanup_bitmap;
    auto test_sprite = create_sprite(test_bitmap);
    sprite_cleanup cleanup_sprite;
    REQUIRE(100 == sprite_layer_height(test_sprite, 0));
    auto layer_idx = sprite_add_layer(test_sprite, test_bitmap, "layer2");
    REQUIRE(100 == sprite_layer_height(test_sprite, layer_idx));
}
TEST_CASE_METHOD(TestSpritesFixture, "sprite_layer_index_integration") {
    auto test_bitmap = create_bitmap("Test Bitmap 57", 100, 100);
    bitmap_cleanup cleanup_bitmap;
    auto test_sprite = create_sprite(test_bitmap);
    sprite_cleanup cleanup_sprite;
    REQUIRE(0 == sprite_layer_index(test_sprite, "base_layer"));
    auto layer_idx = sprite_add_layer(test_sprite, test_bitmap, "layer2");
    REQUIRE(layer_idx == sprite_layer_index(test_sprite, "layer2"));
}
TEST_CASE_METHOD(TestSpritesFixture, "sprite_layer_name_integration") {
    auto test_bitmap = create_bitmap("Test Bitmap 58", 100, 100);
    bitmap_cleanup cleanup_bitmap;
    auto test_sprite = create_sprite(test_bitmap);
    sprite_cleanup cleanup_sprite;
    auto layer_idx = sprite_add_layer(test_sprite, test_bitmap, "layer2");
    REQUIRE("" == sprite_layer_name(test_sprite, layer_idx));
}
TEST_CASE_METHOD(TestSpritesFixture, "sprite_layer_offset_named_integration") {
    auto test_bitmap = create_bitmap("Test Bitmap 59", 100, 100);
    bitmap_cleanup cleanup_bitmap;
    auto test_sprite = create_sprite(test_bitmap);
    sprite_cleanup cleanup_sprite;
    REQUIRE(vector_to(0.0, 0.0) == sprite_layer_offset(test_sprite, "base_layer"));
    sprite_set_layer_offset(test_sprite, "base_layer", vector_to(10.0, 10.0));
    REQUIRE(vector_to(10.0, 10.0) == sprite_layer_offset(test_sprite, "base_layer"));
}
TEST_CASE_METHOD(TestSpritesFixture, "sprite_layer_offset_integration") {
    auto test_bitmap = create_bitmap("Test Bitmap 60", 100, 100);
    bitmap_cleanup cleanup_bitmap;
    auto test_sprite = create_sprite(test_bitmap);
    sprite_cleanup cleanup_sprite;
    REQUIRE(vector_to(0.0, 0.0) == sprite_layer_offset(test_sprite, 0));
    auto layer_idx = sprite_add_layer(test_sprite, test_bitmap, "layer2");
    sprite_set_layer_offset(test_sprite, layer_idx, vector_to(10.0, 10.0));
    REQUIRE(vector_to(10.0, 10.0) == sprite_layer_offset(test_sprite, layer_idx));
}
TEST_CASE_METHOD(TestSpritesFixture, "sprite_layer_rectangle_named_integration") {
    auto test_bitmap = create_bitmap("Test Bitmap 61", 100, 100);
    bitmap_cleanup cleanup_bitmap;
    auto test_sprite = create_sprite(test_bitmap);
    sprite_cleanup cleanup_sprite;
    auto rect = sprite_layer_rectangle(test_sprite, "base_layer");
    REQUIRE(0.0 == rect.x);
    REQUIRE(0.0 == rect.y);
    REQUIRE(100.0 == rect.width);
    REQUIRE(100.0 == rect.height);
}
TEST_CASE_METHOD(TestSpritesFixture, "sprite_layer_rectangle_at_index_integration") {
    auto test_bitmap = create_bitmap("Test Bitmap 62", 100, 100);
    bitmap_cleanup cleanup_bitmap;
    auto test_sprite = create_sprite(test_bitmap);
    sprite_cleanup cleanup_sprite;
    auto rect = sprite_layer_rectangle(test_sprite, 0);
    REQUIRE(0.0 == rect.x);
    REQUIRE(0.0 == rect.y);
    REQUIRE(100.0 == rect.width);
    REQUIRE(100.0 == rect.height);
}
TEST_CASE_METHOD(TestSpritesFixture, "sprite_layer_width_named_integration") {
    auto test_bitmap = create_bitmap("Test Bitmap 63", 100, 100);
    bitmap_cleanup cleanup_bitmap;
    auto test_sprite = create_sprite(test_bitmap);
    sprite_cleanup cleanup_sprite;
    REQUIRE(100 == sprite_layer_width(test_sprite, "base_layer"));
    sprite_add_layer(test_sprite, test_bitmap, "layer2");
    REQUIRE(100 == sprite_layer_width(test_sprite, "layer2"));
}
TEST_CASE_METHOD(TestSpritesFixture, "sprite_layer_width_integration") {
    auto test_bitmap = create_bitmap("Test Bitmap 64", 100, 100);
    bitmap_cleanup cleanup_bitmap;
    auto test_sprite = create_sprite(test_bitmap);
    sprite_cleanup cleanup_sprite;
    REQUIRE(100 == sprite_layer_width(test_sprite, 0));
    auto layer_idx = sprite_add_layer(test_sprite, test_bitmap, "layer2");
    REQUIRE(100 == sprite_layer_width(test_sprite, layer_idx));
}
TEST_CASE_METHOD(TestSpritesFixture, "sprite_location_matrix_integration") {
    auto test_bitmap = create_bitmap("Test Bitmap 65", 100, 100);
    bitmap_cleanup cleanup_bitmap;
    auto test_sprite = create_sprite(test_bitmap);
    sprite_cleanup cleanup_sprite;
    sprite_set_position(test_sprite, point_at(100.0, 100.0));
    sprite_set_rotation(test_sprite, 45.0f);
    auto matrix = sprite_location_matrix(test_sprite);
    REQUIRE(150.0 == matrix.elements[0][2]);
    REQUIRE(1.0 == matrix.elements[2][2]);
}
TEST_CASE_METHOD(TestSpritesFixture, "sprite_mass_integration") {
    auto test_bitmap = create_bitmap("Test Bitmap 66", 100, 100);
    bitmap_cleanup cleanup_bitmap;
    auto test_sprite = create_sprite(test_bitmap);
    sprite_cleanup cleanup_sprite;
    REQUIRE(1.0 == sprite_mass(test_sprite));
    sprite_set_mass(test_sprite, 10.0f);
    REQUIRE(10.0 == sprite_mass(test_sprite));
}
TEST_CASE_METHOD(TestSpritesFixture, "sprite_move_from_anchor_point_integration") {
    auto test_bitmap = create_bitmap("Test Bitmap 67", 100, 100);
    bitmap_cleanup cleanup_bitmap;
    auto test_sprite = create_sprite(test_bitmap);
    sprite_cleanup cleanup_sprite;
    REQUIRE_FALSE(sprite_move_from_anchor_point(test_sprite));
    sprite_set_move_from_anchor_point(test_sprite, true);
    REQUIRE(sprite_move_from_anchor_point(test_sprite));
}
TEST_CASE_METHOD(TestSpritesFixture, "sprite_move_to_taking_seconds_integration") {
    auto test_bitmap = create_bitmap("Test Bitmap 68", 100, 100);
    bitmap_cleanup cleanup_bitmap;
    auto test_sprite = create_sprite(test_bitmap);
    sprite_cleanup cleanup_sprite;
    sprite_set_position(test_sprite, point_at(100.0, 100.0));
    sprite_move_to(test_sprite, point_at(200.0, 200.0), 1.0f);
    for (int i = 0; i < 5; ++i) {
        update_sprite(test_sprite);
        delay(300);
    }
    auto sprite_center = center_point(test_sprite);
    REQUIRE(abs(200.0 - sprite_center.x) <= 2.0);
    REQUIRE(abs(200.0 - sprite_center.y) <= 2.0);
}
TEST_CASE_METHOD(TestSpritesFixture, "sprite_name_integration") {
    auto test_bitmap = create_bitmap("Test Bitmap 69", 100, 100);
    bitmap_cleanup cleanup_bitmap;
    auto test_sprite = create_sprite("Test Sprite 7", test_bitmap);
    sprite_cleanup cleanup_sprite;
    REQUIRE("Test Sprite 7" == sprite_name(test_sprite));
}
TEST_CASE_METHOD(TestSpritesFixture, "sprite_named_integration") {
    auto test_bitmap = create_bitmap("Test Bitmap 70", 100, 100);
    bitmap_cleanup cleanup_bitmap;
    auto test_sprite = create_sprite("Test Sprite 8", test_bitmap);
    sprite_cleanup cleanup_sprite;
    REQUIRE(test_sprite == sprite_named("Test Sprite 8"));
    REQUIRE(sprite_named("non_existent_sprite") == nullptr);
}
TEST_CASE_METHOD(TestSpritesFixture, "sprite_offscreen_integration") {
    open_window("Test Window 5", 800, 600);
    window_cleanup cleanup_window;
    auto test_bitmap = create_bitmap("Test Bitmap 71", 100, 100);
    bitmap_cleanup cleanup_bitmap;
    auto test_sprite = create_sprite(test_bitmap);
    sprite_cleanup cleanup_sprite;
    sprite_set_position(test_sprite, point_at(400.0, 300.0));
    REQUIRE_FALSE(sprite_offscreen(test_sprite));
    sprite_set_position(test_sprite, point_at(-200.0, -200.0));
    REQUIRE(sprite_offscreen(test_sprite));
}
TEST_CASE_METHOD(TestSpritesFixture, "sprite_on_screen_at_point_integration") {
    open_window("Test Window 6", 800, 600);
    window_cleanup cleanup_window;
    auto test_bitmap = create_bitmap("Test Bitmap 72", 100, 100);
    bitmap_cleanup cleanup_bitmap;
    clear_bitmap(test_bitmap, color_red());
    setup_collision_mask(test_bitmap);
    auto test_sprite = create_sprite(test_bitmap);
    sprite_cleanup cleanup_sprite;
    sprite_set_position(test_sprite, point_at(400.0, 300.0));
    draw_sprite(test_sprite);
    refresh_screen();
    REQUIRE(sprite_on_screen_at(test_sprite, point_at(451.0, 350.0)));
    REQUIRE_FALSE(sprite_on_screen_at(test_sprite, point_at(0.0, 0.0)));
}
TEST_CASE_METHOD(TestSpritesFixture, "sprite_on_screen_at_integration") {
    open_window("Test Window 7", 800, 600);
    window_cleanup cleanup_window;
    auto test_bitmap = create_bitmap("Test Bitmap 73", 100, 100);
    bitmap_cleanup cleanup_bitmap;
    clear_bitmap(test_bitmap, color_red());
    setup_collision_mask(test_bitmap);
    auto test_sprite = create_sprite(test_bitmap);
    sprite_cleanup cleanup_sprite;
    sprite_set_position(test_sprite, point_at(400.0, 300.0));
    draw_sprite(test_sprite);
    refresh_screen();
    REQUIRE(sprite_on_screen_at(test_sprite, 451.0, 350.0));
    REQUIRE_FALSE(sprite_on_screen_at(test_sprite, 0.0, 0.0));
}
TEST_CASE_METHOD(TestSpritesFixture, "sprite_position_integration") {
    auto test_bitmap = create_bitmap("Test Bitmap 74", 100, 100);
    bitmap_cleanup cleanup_bitmap;
    auto test_sprite = create_sprite(test_bitmap);
    sprite_cleanup cleanup_sprite;
    REQUIRE(point_at(0.0, 0.0) == sprite_position(test_sprite));
    sprite_set_position(test_sprite, point_at(400.0, 300.0));
    REQUIRE(point_at(400.0, 300.0) == sprite_position(test_sprite));
}
TEST_CASE_METHOD(TestSpritesFixture, "sprite_replay_animation_integration") {
    auto test_bitmap = create_bitmap("Test Bitmap 75", 100, 100);
    bitmap_cleanup cleanup_bitmap;
    auto test_animation = load_animation_script("Test Script 8", "kermit.txt");
    animation_script_cleanup cleanup_animation_script;
    auto test_sprite = create_sprite(test_bitmap, test_animation);
    sprite_cleanup cleanup_sprite;
    sprite_start_animation(test_sprite, "walkfront");
    REQUIRE_FALSE(sprite_animation_has_ended(test_sprite));
    for (int i = 0; i < 5; ++i) {
        update_sprite(test_sprite, 100.0f);
    }
    REQUIRE(sprite_animation_has_ended(test_sprite));
    sprite_replay_animation(test_sprite);
    REQUIRE_FALSE(sprite_animation_has_ended(test_sprite));
}
TEST_CASE_METHOD(TestSpritesFixture, "sprite_replay_animation_with_sound_integration") {
    auto test_bitmap = create_bitmap("Test Bitmap 76", 100, 100);
    bitmap_cleanup cleanup_bitmap;
    auto test_animation = load_animation_script("Test Script 9", "startup.txt");
    animation_script_cleanup cleanup_animation_script;
    auto test_sprite = create_sprite(test_bitmap, test_animation);
    sprite_cleanup cleanup_sprite;
    sprite_start_animation(test_sprite, "splash");
    REQUIRE_FALSE(sprite_animation_has_ended(test_sprite));
    for (int i = 0; i < 100; ++i) {
        update_sprite_animation(test_sprite, 100.0f);
    }
    REQUIRE(sprite_animation_has_ended(test_sprite));
    sprite_replay_animation(test_sprite, true);
    REQUIRE(sound_effect_playing("SwinGameStart"));
    REQUIRE_FALSE(sprite_animation_has_ended(test_sprite));
}
TEST_CASE_METHOD(TestSpritesFixture, "sprite_rotation_integration") {
    auto test_bitmap = create_bitmap("Test Bitmap 77", 100, 100);
    bitmap_cleanup cleanup_bitmap;
    auto test_sprite = create_sprite(test_bitmap);
    sprite_cleanup cleanup_sprite;
    REQUIRE(0.0 == sprite_rotation(test_sprite));
    sprite_set_rotation(test_sprite, 45.0f);
    REQUIRE(45.0 == sprite_rotation(test_sprite));
}
TEST_CASE_METHOD(TestSpritesFixture, "sprite_scale_integration") {
    auto test_bitmap = create_bitmap("Test Bitmap 78", 100, 100);
    bitmap_cleanup cleanup_bitmap;
    auto test_sprite = create_sprite(test_bitmap);
    sprite_cleanup cleanup_sprite;
    REQUIRE(1.0f == sprite_scale(test_sprite));
    sprite_set_scale(test_sprite, 2.0f);
    REQUIRE(2.0f == sprite_scale(test_sprite));
}
TEST_CASE_METHOD(TestSpritesFixture, "sprite_screen_rectangle_integration") {
    open_window("Test Window 8", 800, 600);
    window_cleanup cleanup_window;
    auto test_bitmap = create_bitmap("Test Bitmap 79", 100, 100);
    bitmap_cleanup cleanup_bitmap;
    auto test_animation = load_animation_script("Test Script 10", "kermit.txt");
    animation_script_cleanup cleanup_animation_script;
    clear_bitmap(test_bitmap, color_white());
    auto test_sprite = create_sprite(test_bitmap, test_animation);
    sprite_cleanup cleanup_sprite;
    sprite_start_animation(test_sprite, "walkfront");
    sprite_set_position(test_sprite, point_at(0.0, 0.0));
    auto rect = sprite_screen_rectangle(test_sprite);
    REQUIRE(0.0 == rect.x);
    REQUIRE(0.0 == rect.y);
    REQUIRE(100.0 == rect.width);
    REQUIRE(100.0 == rect.height);
}
TEST_CASE_METHOD(TestSpritesFixture, "sprite_send_layer_backward_integration") {
    auto test_bitmap = create_bitmap("Test Bitmap 80", 100, 100);
    bitmap_cleanup cleanup_bitmap;
    auto test_sprite = create_sprite(test_bitmap);
    sprite_cleanup cleanup_sprite;
    auto layer1 = sprite_add_layer(test_sprite, test_bitmap, "layer1");
    sprite_show_layer(test_sprite, layer1);
    auto layer2 = sprite_add_layer(test_sprite, test_bitmap, "layer2");
    sprite_show_layer(test_sprite, layer2);
    auto visible_index = sprite_visible_index_of_layer(test_sprite, layer2);
    sprite_send_layer_backward(test_sprite, visible_index);
    REQUIRE(2 == sprite_visible_index_of_layer(test_sprite, layer2));
}
TEST_CASE_METHOD(TestSpritesFixture, "sprite_send_layer_to_back_integration") {
    auto test_bitmap = create_bitmap("Test Bitmap 81", 100, 100);
    bitmap_cleanup cleanup_bitmap;
    auto test_sprite = create_sprite(test_bitmap);
    sprite_cleanup cleanup_sprite;
    auto layer1 = sprite_add_layer(test_sprite, test_bitmap, "layer1");
    sprite_show_layer(test_sprite, layer1);
    auto layer2 = sprite_add_layer(test_sprite, test_bitmap, "layer2");
    sprite_show_layer(test_sprite, layer2);
    auto visible_index = sprite_visible_index_of_layer(test_sprite, layer2);
    sprite_send_layer_to_back(test_sprite, visible_index);
    REQUIRE(2 == sprite_visible_index_of_layer(test_sprite, layer2));
}
TEST_CASE_METHOD(TestSpritesFixture, "sprite_set_anchor_point_integration") {
    auto test_bitmap = create_bitmap("Test Bitmap 82", 100, 100);
    bitmap_cleanup cleanup_bitmap;
    auto test_sprite = create_sprite(test_bitmap);
    sprite_cleanup cleanup_sprite;
    REQUIRE(point_at(50.0, 50.0) == sprite_anchor_point(test_sprite));
    sprite_set_anchor_point(test_sprite, point_at(25.0, 25.0));
    REQUIRE(point_at(25.0, 25.0) == sprite_anchor_point(test_sprite));
}
TEST_CASE_METHOD(TestSpritesFixture, "sprite_set_collision_bitmap_integration") {
    auto test_bitmap = create_bitmap("Test Bitmap 83", 100, 100);
    bitmap_cleanup cleanup_bitmap;
    auto test_sprite = create_sprite(test_bitmap);
    sprite_cleanup cleanup_sprite;
    REQUIRE(test_bitmap == sprite_collision_bitmap(test_sprite));
    auto new_bitmap = create_bitmap("Test Bitmap 84", 200, 200);
    sprite_set_collision_bitmap(test_sprite, new_bitmap);
    REQUIRE(new_bitmap == sprite_collision_bitmap(test_sprite));
}
TEST_CASE_METHOD(TestSpritesFixture, "sprite_set_collision_kind_integration") {
    auto test_bitmap = create_bitmap("Test Bitmap 85", 100, 100);
    bitmap_cleanup cleanup_bitmap;
    auto test_sprite = create_sprite(test_bitmap);
    sprite_cleanup cleanup_sprite;
    REQUIRE(collision_test_kind::PIXEL_COLLISIONS == sprite_collision_kind(test_sprite));
    sprite_set_collision_kind(test_sprite, collision_test_kind::AABB_COLLISIONS);
    REQUIRE(collision_test_kind::AABB_COLLISIONS == sprite_collision_kind(test_sprite));
}
TEST_CASE_METHOD(TestSpritesFixture, "sprite_set_dx_integration") {
    auto test_bitmap = create_bitmap("Test Bitmap 86", 100, 100);
    bitmap_cleanup cleanup_bitmap;
    auto test_sprite = create_sprite(test_bitmap);
    sprite_cleanup cleanup_sprite;
    REQUIRE(0.0 == sprite_dx(test_sprite));
    sprite_set_dx(test_sprite, 5.0f);
    REQUIRE(5.0 == sprite_dx(test_sprite));
}
TEST_CASE_METHOD(TestSpritesFixture, "sprite_set_dy_integration") {
    auto test_bitmap = create_bitmap("Test Bitmap 87", 100, 100);
    bitmap_cleanup cleanup_bitmap;
    auto test_sprite = create_sprite(test_bitmap);
    sprite_cleanup cleanup_sprite;
    REQUIRE(0.0 == sprite_dy(test_sprite));
    sprite_set_dy(test_sprite, 5.0f);
    REQUIRE(5.0 == sprite_dy(test_sprite));
}
TEST_CASE_METHOD(TestSpritesFixture, "sprite_set_heading_integration") {
    auto test_bitmap = create_bitmap("Test Bitmap 88", 100, 100);
    bitmap_cleanup cleanup_bitmap;
    auto test_sprite = create_sprite(test_bitmap);
    sprite_cleanup cleanup_sprite;
    sprite_set_velocity(test_sprite, vector_from_angle(90.0, 1.0));
    REQUIRE(90.0 == sprite_heading(test_sprite));
    sprite_set_heading(test_sprite, 45.0f);
    REQUIRE(45.0 == sprite_heading(test_sprite));
}
TEST_CASE_METHOD(TestSpritesFixture, "sprite_set_layer_offset_named_integration") {
    auto test_bitmap = create_bitmap("Test Bitmap 89", 100, 100);
    bitmap_cleanup cleanup_bitmap;
    auto test_sprite = create_sprite(test_bitmap);
    sprite_cleanup cleanup_sprite;
    REQUIRE(vector_to(0.0, 0.0) == sprite_layer_offset(test_sprite, "base_layer"));
    sprite_set_layer_offset(test_sprite, "base_layer", vector_to(10.0, 10.0));
    REQUIRE(vector_to(10.0, 10.0) == sprite_layer_offset(test_sprite, "base_layer"));
}
TEST_CASE_METHOD(TestSpritesFixture, "sprite_set_layer_offset_at_index_integration") {
    auto test_bitmap = create_bitmap("Test Bitmap 90", 100, 100);
    bitmap_cleanup cleanup_bitmap;
    auto test_sprite = create_sprite(test_bitmap);
    sprite_cleanup cleanup_sprite;
    REQUIRE(vector_to(0.0, 0.0) == sprite_layer_offset(test_sprite, 0));
    sprite_set_layer_offset(test_sprite, 0, vector_to(10.0, 10.0));
    REQUIRE(vector_to(10.0, 10.0) == sprite_layer_offset(test_sprite, 0));
}
TEST_CASE_METHOD(TestSpritesFixture, "sprite_set_mass_integration") {
    auto test_bitmap = create_bitmap("Test Bitmap 91", 100, 100);
    bitmap_cleanup cleanup_bitmap;
    auto test_sprite = create_sprite(test_bitmap);
    sprite_cleanup cleanup_sprite;
    REQUIRE(1.0 == sprite_mass(test_sprite));
    sprite_set_mass(test_sprite, 10.0f);
    REQUIRE(10.0 == sprite_mass(test_sprite));
}
TEST_CASE_METHOD(TestSpritesFixture, "sprite_set_move_from_anchor_point_integration") {
    auto test_bitmap = create_bitmap("Test Bitmap 92", 100, 100);
    bitmap_cleanup cleanup_bitmap;
    auto test_sprite = create_sprite(test_bitmap);
    sprite_cleanup cleanup_sprite;
    REQUIRE_FALSE(sprite_move_from_anchor_point(test_sprite));
    sprite_set_move_from_anchor_point(test_sprite, true);
    REQUIRE(sprite_move_from_anchor_point(test_sprite));
}
TEST_CASE_METHOD(TestSpritesFixture, "sprite_set_position_integration") {
    auto test_bitmap = create_bitmap("Test Bitmap 93", 100, 100);
    bitmap_cleanup cleanup_bitmap;
    auto test_sprite = create_sprite(test_bitmap);
    sprite_cleanup cleanup_sprite;
    REQUIRE(point_at(0.0, 0.0) == sprite_position(test_sprite));
    sprite_set_position(test_sprite, point_at(100.0, 100.0));
    REQUIRE(point_at(100.0, 100.0) == sprite_position(test_sprite));
}
TEST_CASE_METHOD(TestSpritesFixture, "sprite_set_rotation_integration") {
    auto test_bitmap = create_bitmap("Test Bitmap 94", 100, 100);
    bitmap_cleanup cleanup_bitmap;
    auto test_sprite = create_sprite(test_bitmap);
    sprite_cleanup cleanup_sprite;
    REQUIRE(0.0 == sprite_rotation(test_sprite));
    sprite_set_rotation(test_sprite, 45.0f);
    REQUIRE(45.0 == sprite_rotation(test_sprite));
}
TEST_CASE_METHOD(TestSpritesFixture, "sprite_set_scale_integration") {
    auto test_bitmap = create_bitmap("Test Bitmap 95", 100, 100);
    bitmap_cleanup cleanup_bitmap;
    auto test_sprite = create_sprite(test_bitmap);
    sprite_cleanup cleanup_sprite;
    REQUIRE(1.0f == sprite_scale(test_sprite));
    sprite_set_scale(test_sprite, 2.0f);
    REQUIRE(2.0f == sprite_scale(test_sprite));
}
TEST_CASE_METHOD(TestSpritesFixture, "sprite_set_speed_integration") {
    auto test_bitmap = create_bitmap("Test Bitmap 96", 100, 100);
    bitmap_cleanup cleanup_bitmap;
    auto test_sprite = create_sprite(test_bitmap);
    sprite_cleanup cleanup_sprite;
    sprite_set_velocity(test_sprite, vector_from_angle(0.0, 1.0));
    sprite_set_speed(test_sprite, 5.0f);
    REQUIRE(5.0 == sprite_speed(test_sprite));
}
TEST_CASE_METHOD(TestSpritesFixture, "sprite_set_value_named_integration") {
    auto test_bitmap = create_bitmap("Test Bitmap 97", 100, 100);
    bitmap_cleanup cleanup_bitmap;
    auto test_sprite = create_sprite(test_bitmap);
    sprite_cleanup cleanup_sprite;
    REQUIRE_FALSE(sprite_has_value(test_sprite, "test_value"));
    sprite_add_value(test_sprite, "test_value", 0.0f);
    sprite_set_value(test_sprite, "test_value", 10.5f);
    REQUIRE(10.5f == sprite_value(test_sprite, "test_value"));
}
TEST_CASE_METHOD(TestSpritesFixture, "sprite_set_velocity_integration") {
    auto test_bitmap = create_bitmap("Test Bitmap 98", 100, 100);
    bitmap_cleanup cleanup_bitmap;
    auto test_sprite = create_sprite(test_bitmap);
    sprite_cleanup cleanup_sprite;
    REQUIRE(vector_to(0.0, 0.0) == sprite_velocity(test_sprite));
    sprite_set_velocity(test_sprite, vector_to(5.0, 5.0));
    REQUIRE(vector_to(5.0, 5.0) == sprite_velocity(test_sprite));
}
TEST_CASE_METHOD(TestSpritesFixture, "sprite_set_x_integration") {
    auto test_bitmap = create_bitmap("Test Bitmap 99", 100, 100);
    bitmap_cleanup cleanup_bitmap;
    auto test_sprite = create_sprite(test_bitmap);
    sprite_cleanup cleanup_sprite;
    REQUIRE(0.0f == sprite_x(test_sprite));
    sprite_set_x(test_sprite, 150.0f);
    REQUIRE(150.0f == sprite_x(test_sprite));
}
TEST_CASE_METHOD(TestSpritesFixture, "sprite_set_y_integration") {
    auto test_bitmap = create_bitmap("Test Bitmap 100", 100, 100);
    bitmap_cleanup cleanup_bitmap;
    auto test_sprite = create_sprite(test_bitmap);
    sprite_cleanup cleanup_sprite;
    REQUIRE(0.0f == sprite_y(test_sprite));
    sprite_set_y(test_sprite, 300.0f);
    REQUIRE(300.0f == sprite_y(test_sprite));
}
TEST_CASE_METHOD(TestSpritesFixture, "sprite_show_layer_named_integration") {
    auto test_bitmap = create_bitmap("Test Bitmap 101", 100, 100);
    bitmap_cleanup cleanup_bitmap;
    auto test_sprite = create_sprite(test_bitmap);
    sprite_cleanup cleanup_sprite;
    auto layer_idx = sprite_add_layer(test_sprite, test_bitmap, "layer2");
    sprite_hide_layer(test_sprite, "layer2");
    REQUIRE(1 == sprite_visible_layer_count(test_sprite));
    REQUIRE(layer_idx == sprite_show_layer(test_sprite, "layer2"));
    REQUIRE(2 == sprite_visible_layer_count(test_sprite));
}
TEST_CASE_METHOD(TestSpritesFixture, "sprite_show_layer_integration") {
    auto test_bitmap = create_bitmap("Test Bitmap 102", 100, 100);
    bitmap_cleanup cleanup_bitmap;
    auto test_sprite = create_sprite(test_bitmap);
    sprite_cleanup cleanup_sprite;
    auto layer_idx = sprite_add_layer(test_sprite, test_bitmap, "layer2");
    sprite_hide_layer(test_sprite, layer_idx);
    REQUIRE(1 == sprite_visible_layer_count(test_sprite));
    REQUIRE(layer_idx == sprite_show_layer(test_sprite, layer_idx));
    REQUIRE(2 == sprite_visible_layer_count(test_sprite));
}
TEST_CASE_METHOD(TestSpritesFixture, "sprite_speed_integration") {
    auto test_bitmap = create_bitmap("Test Bitmap 103", 100, 100);
    bitmap_cleanup cleanup_bitmap;
    auto test_sprite = create_sprite(test_bitmap);
    sprite_cleanup cleanup_sprite;
    REQUIRE(0.0 == sprite_speed(test_sprite));
    sprite_set_velocity(test_sprite, vector_to(3.0, 4.0));
    REQUIRE(5.0 == sprite_speed(test_sprite));
}
TEST_CASE_METHOD(TestSpritesFixture, "sprite_start_animation_named_integration") {
    auto test_bitmap = create_bitmap("Test Bitmap 104", 100, 100);
    bitmap_cleanup cleanup_bitmap;
    auto test_animation = load_animation_script("Test Script 11", "kermit.txt");
    animation_script_cleanup cleanup_animation_script;
    auto test_sprite = create_sprite(test_bitmap, test_animation);
    sprite_cleanup cleanup_sprite;
    sprite_start_animation(test_sprite, "walkfront");
    REQUIRE_FALSE(sprite_animation_has_ended(test_sprite));
    for (int i = 0; i < 5; ++i) {
        update_sprite_animation(test_sprite, 100.0f);
    }
    REQUIRE(sprite_animation_has_ended(test_sprite));
    REQUIRE("walkfront" == sprite_animation_name(test_sprite));
}
TEST_CASE_METHOD(TestSpritesFixture, "sprite_start_animation_named_with_sound_integration") {
    auto test_bitmap = create_bitmap("Test Bitmap 105", 100, 100);
    bitmap_cleanup cleanup_bitmap;
    auto test_animation = load_animation_script("Test Script 12", "startup.txt");
    animation_script_cleanup cleanup_animation_script;
    auto test_sprite = create_sprite(test_bitmap, test_animation);
    sprite_cleanup cleanup_sprite;
    sprite_start_animation(test_sprite, "splash", true);
    REQUIRE_FALSE(sprite_animation_has_ended(test_sprite));
    REQUIRE(sound_effect_playing("SwinGameStart"));
    for (int i = 0; i < 100; ++i) {
        update_sprite_animation(test_sprite, 100.0f);
    }
    REQUIRE(sprite_animation_has_ended(test_sprite));
    REQUIRE("splash" == sprite_animation_name(test_sprite));
}
TEST_CASE_METHOD(TestSpritesFixture, "sprite_start_animation_integration") {
    auto test_bitmap = create_bitmap("Test Bitmap 106", 100, 100);
    bitmap_cleanup cleanup_bitmap;
    auto test_animation = load_animation_script("Test Script 13", "kermit.txt");
    animation_script_cleanup cleanup_animation_script;
    auto test_sprite = create_sprite(test_bitmap, test_animation);
    sprite_cleanup cleanup_sprite;
    sprite_start_animation(test_sprite, 0);
    REQUIRE_FALSE(sprite_animation_has_ended(test_sprite));
    for (int i = 0; i < 5; ++i) {
        update_sprite_animation(test_sprite, 100.0f);
    }
    REQUIRE(sprite_animation_has_ended(test_sprite));
}
TEST_CASE_METHOD(TestSpritesFixture, "sprite_start_animation_with_sound_integration") {
    auto test_bitmap = create_bitmap("Test Bitmap 107", 100, 100);
    bitmap_cleanup cleanup_bitmap;
    auto test_animation = load_animation_script("Test Script 14", "startup.txt");
    animation_script_cleanup cleanup_animation_script;
    auto test_sprite = create_sprite(test_bitmap, test_animation);
    sprite_cleanup cleanup_sprite;
    sprite_start_animation(test_sprite, 0, true);
    REQUIRE_FALSE(sprite_animation_has_ended(test_sprite));
    REQUIRE(sound_effect_playing("SwinGameStart"));
    for (int i = 0; i < 100; ++i) {
        update_sprite_animation(test_sprite, 100.0f, true);
    }
    REQUIRE(sprite_animation_has_ended(test_sprite));
}
TEST_CASE_METHOD(TestSpritesFixture, "sprite_stop_calling_on_event_integration") {
    auto test_sprite_delegates = sprite_delegates();
    auto test_bitmap = create_bitmap("Test Bitmap 109", 100, 100);
    bitmap_cleanup cleanup_bitmap;
    auto test_sprite = create_sprite(test_bitmap);
    sprite_cleanup cleanup_sprite;
    sprite_call_on_event(test_sprite, test_sprite_delegates.sprite_event_handler());
    update_sprite(test_sprite);
    REQUIRE(test_sprite_delegates.event_called());
    sprite_stop_calling_on_event(test_sprite, test_sprite_delegates.sprite_event_handler());
    test_sprite_delegates.reset()
;    update_sprite(test_sprite);
    REQUIRE_FALSE(test_sprite_delegates.event_called());
}
TEST_CASE_METHOD(TestSpritesFixture, "sprite_toggle_layer_visible_named_integration") {
    auto test_bitmap = create_bitmap("Test Bitmap 110", 100, 100);
    bitmap_cleanup cleanup_bitmap;
    auto test_sprite = create_sprite(test_bitmap);
    sprite_cleanup cleanup_sprite;
    sprite_add_layer(test_sprite, test_bitmap, "layer2");
    sprite_show_layer(test_sprite, "layer2");
    REQUIRE(2 == sprite_visible_layer_count(test_sprite));
    sprite_toggle_layer_visible(test_sprite, "layer2");
    REQUIRE(1 == sprite_visible_layer_count(test_sprite));
    sprite_toggle_layer_visible(test_sprite, "layer2");
    REQUIRE(2 == sprite_visible_layer_count(test_sprite));
}
TEST_CASE_METHOD(TestSpritesFixture, "sprite_toggle_layer_visible_integration") {
    auto test_bitmap = create_bitmap("Test Bitmap 111", 100, 100);
    bitmap_cleanup cleanup_bitmap;
    auto test_sprite = create_sprite(test_bitmap);
    sprite_cleanup cleanup_sprite;
    auto layer_idx = sprite_add_layer(test_sprite, test_bitmap, "layer2");
    sprite_show_layer(test_sprite, layer_idx);
    REQUIRE(2 == sprite_visible_layer_count(test_sprite));
    sprite_toggle_layer_visible(test_sprite, layer_idx);
    REQUIRE(1 == sprite_visible_layer_count(test_sprite));
}
TEST_CASE_METHOD(TestSpritesFixture, "sprite_value_integration") {
    auto test_bitmap = create_bitmap("Test Bitmap 112", 100, 100);
    bitmap_cleanup cleanup_bitmap;
    auto test_sprite = create_sprite(test_bitmap);
    sprite_cleanup cleanup_sprite;
    REQUIRE(3 == sprite_value_count(test_sprite));
    sprite_add_value(test_sprite, "test_value", 0.0f);
    REQUIRE(0.0f == sprite_value(test_sprite, "test_value"));
}
TEST_CASE_METHOD(TestSpritesFixture, "sprite_value_count_integration") {
    auto test_bitmap = create_bitmap("Test Bitmap 113", 100, 100);
    bitmap_cleanup cleanup_bitmap;
    auto test_sprite = create_sprite(test_bitmap);
    sprite_cleanup cleanup_sprite;
    REQUIRE(3 == sprite_value_count(test_sprite));
    sprite_add_value(test_sprite, "health", 0.0f);
    sprite_add_value(test_sprite, "speed", 0.0f);
    REQUIRE(5 == sprite_value_count(test_sprite));
}
TEST_CASE_METHOD(TestSpritesFixture, "sprite_velocity_integration") {
    auto test_bitmap = create_bitmap("Test Bitmap 114", 100, 100);
    bitmap_cleanup cleanup_bitmap;
    auto test_sprite = create_sprite(test_bitmap);
    sprite_cleanup cleanup_sprite;
    REQUIRE(vector_to(0.0, 0.0) == sprite_velocity(test_sprite));
    sprite_set_velocity(test_sprite, vector_to(5.0, 5.0));
    REQUIRE(vector_to(5.0, 5.0) == sprite_velocity(test_sprite));
}
TEST_CASE_METHOD(TestSpritesFixture, "sprite_visible_index_of_layer_named_integration") {
    auto test_bitmap = create_bitmap("Test Bitmap 115", 100, 100);
    bitmap_cleanup cleanup_bitmap;
    auto test_sprite = create_sprite(test_bitmap);
    sprite_cleanup cleanup_sprite;
    REQUIRE(0 == sprite_visible_index_of_layer(test_sprite, "base_layer"));
    sprite_add_layer(test_sprite, test_bitmap, "layer2");
    sprite_show_layer(test_sprite, "layer2");
    REQUIRE(1 == sprite_visible_index_of_layer(test_sprite, "layer2"));
}
TEST_CASE_METHOD(TestSpritesFixture, "sprite_visible_index_of_layer_integration") {
    auto test_bitmap = create_bitmap("Test Bitmap 116", 100, 100);
    bitmap_cleanup cleanup_bitmap;
    auto test_sprite = create_sprite(test_bitmap);
    sprite_cleanup cleanup_sprite;
    REQUIRE(0 == sprite_visible_index_of_layer(test_sprite, 0));
    auto layer_idx = sprite_add_layer(test_sprite, test_bitmap, "layer2");
    sprite_show_layer(test_sprite, layer_idx);
    REQUIRE(1 == sprite_visible_index_of_layer(test_sprite, layer_idx));
}
TEST_CASE_METHOD(TestSpritesFixture, "sprite_visible_layer_integration") {
    auto test_bitmap = create_bitmap("Test Bitmap 117", 100, 100);
    bitmap_cleanup cleanup_bitmap;
    auto test_sprite = create_sprite(test_bitmap);
    sprite_cleanup cleanup_sprite;
    REQUIRE(0 == sprite_visible_layer(test_sprite, 0));
    sprite_add_layer(test_sprite, test_bitmap, "layer2");
    sprite_show_layer(test_sprite, "layer2");
    REQUIRE(1 == sprite_visible_layer(test_sprite, 1));
}
TEST_CASE_METHOD(TestSpritesFixture, "sprite_visible_layer_count_integration") {
    auto test_bitmap = create_bitmap("Test Bitmap 118", 100, 100);
    bitmap_cleanup cleanup_bitmap;
    auto test_sprite = create_sprite(test_bitmap);
    sprite_cleanup cleanup_sprite;
    REQUIRE(1 == sprite_visible_layer_count(test_sprite));
    sprite_add_layer(test_sprite, test_bitmap, "layer2");
    sprite_show_layer(test_sprite, "layer2");
    REQUIRE(2 == sprite_visible_layer_count(test_sprite));
    sprite_hide_layer(test_sprite, "layer2");
    REQUIRE(1 == sprite_visible_layer_count(test_sprite));
}
TEST_CASE_METHOD(TestSpritesFixture, "sprite_visible_layer_id_integration") {
    auto test_bitmap = create_bitmap("Test Bitmap 119", 100, 100);
    bitmap_cleanup cleanup_bitmap;
    auto test_sprite = create_sprite(test_bitmap);
    sprite_cleanup cleanup_sprite;
    REQUIRE(0 == sprite_visible_layer_id(test_sprite, 0));
    sprite_add_layer(test_sprite, test_bitmap, "layer2");
    sprite_show_layer(test_sprite, "layer2");
    REQUIRE(1 == sprite_visible_layer_id(test_sprite, 1));
}
TEST_CASE_METHOD(TestSpritesFixture, "sprite_width_integration") {
    auto test_bitmap = create_bitmap("Test Bitmap 120", 100, 100);
    bitmap_cleanup cleanup_bitmap;
    auto test_sprite = create_sprite(test_bitmap);
    sprite_cleanup cleanup_sprite;
    REQUIRE(1.0f == sprite_scale(test_sprite));
    sprite_set_scale(test_sprite, 2.0f);
    REQUIRE(2.0f == sprite_scale(test_sprite));
}
TEST_CASE_METHOD(TestSpritesFixture, "sprite_x_integration") {
    auto test_bitmap = create_bitmap("Test Bitmap 121", 100, 100);
    bitmap_cleanup cleanup_bitmap;
    auto test_sprite = create_sprite(test_bitmap);
    sprite_cleanup cleanup_sprite;
    REQUIRE(0.0f == sprite_x(test_sprite));
    sprite_set_x(test_sprite, 150.0f);
    REQUIRE(150.0f == sprite_x(test_sprite));
}
TEST_CASE_METHOD(TestSpritesFixture, "sprite_y_integration") {
    auto test_bitmap = create_bitmap("Test Bitmap 122", 100, 100);
    bitmap_cleanup cleanup_bitmap;
    auto test_sprite = create_sprite(test_bitmap);
    sprite_cleanup cleanup_sprite;
    REQUIRE(0.0f == sprite_y(test_sprite));
    sprite_set_y(test_sprite, 200.0f);
    REQUIRE(200.0f == sprite_y(test_sprite));
}
TEST_CASE_METHOD(TestSpritesFixture, "stop_calling_on_sprite_event_integration") {
    auto test_sprite_delegates = sprite_delegates();
    auto test_bitmap = create_bitmap("Test Bitmap 108", 100, 100);
    bitmap_cleanup cleanup_bitmap;
    auto test_sprite = create_sprite(test_bitmap);
    sprite_cleanup cleanup_sprite;
    call_on_sprite_event(test_sprite_delegates.sprite_event_handler());
    update_sprite(test_sprite);
    REQUIRE(test_sprite_delegates.event_called());
    stop_calling_on_sprite_event(test_sprite_delegates.sprite_event_handler());
    test_sprite_delegates.reset()
;    update_sprite(test_sprite);
    REQUIRE_FALSE(test_sprite_delegates.event_called());
}
TEST_CASE_METHOD(TestSpritesFixture, "update_all_sprites_integration") {
    auto test_bitmap = create_bitmap("Test Bitmap 123", 100, 100);
    bitmap_cleanup cleanup_bitmap;
    auto test_sprite1 = create_sprite(test_bitmap);
    sprite_cleanup cleanup_sprite;
    auto test_sprite2 = create_sprite(test_bitmap);
    sprite_set_velocity(test_sprite1, vector_to(10.0, 10.0));
    sprite_set_velocity(test_sprite2, vector_to(-10.0, -10.0));
    update_all_sprites();
    REQUIRE(vector_to(10.0, 10.0) == sprite_velocity(test_sprite1));
    REQUIRE(vector_to(-10.0, -10.0) == sprite_velocity(test_sprite2));
}
TEST_CASE_METHOD(TestSpritesFixture, "update_all_sprites_percent_integration") {
    auto test_bitmap = create_bitmap("Test Bitmap 124", 100, 100);
    bitmap_cleanup cleanup_bitmap;
    auto test_sprite1 = create_sprite(test_bitmap);
    sprite_cleanup cleanup_sprite;
    auto test_sprite2 = create_sprite(test_bitmap);
    sprite_set_velocity(test_sprite1, vector_to(100.0, 100.0));
    sprite_set_velocity(test_sprite2, vector_to(-100.0, -100.0));
    update_all_sprites(0.5f);
    REQUIRE(50.0f == sprite_x(test_sprite1));
    REQUIRE(50.0f == sprite_y(test_sprite1));
    REQUIRE(-50.0f == sprite_x(test_sprite2));
    REQUIRE(-50.0f == sprite_y(test_sprite2));
}
TEST_CASE_METHOD(TestSpritesFixture, "update_sprite_integration") {
    auto test_bitmap = create_bitmap("Test Bitmap 125", 100, 100);
    bitmap_cleanup cleanup_bitmap;
    auto test_sprite = create_sprite(test_bitmap);
    sprite_cleanup cleanup_sprite;
    sprite_set_velocity(test_sprite, vector_to(10.0, 10.0));
    auto initial_pos = sprite_position(test_sprite);
    update_sprite(test_sprite);
    REQUIRE(initial_pos != sprite_position(test_sprite));
}
TEST_CASE_METHOD(TestSpritesFixture, "update_sprite_with_sound_integration") {
    auto test_bitmap = create_bitmap("Test Bitmap 126", 100, 100);
    bitmap_cleanup cleanup_bitmap;
    auto test_animation = load_animation_script("Test Script 15", "startup.txt");
    animation_script_cleanup cleanup_animation_script;
    auto test_sprite = create_sprite(test_bitmap, test_animation);
    sprite_cleanup cleanup_sprite;
    sprite_start_animation(test_sprite, "splash", true);
    update_sprite(test_sprite, true);
    REQUIRE(sound_effect_playing("SwinGameStart"));
    stop_sound_effect("SwinGameStart");
    update_sprite(test_sprite, false);
    REQUIRE_FALSE(sound_effect_playing("SwinGameStart"));
}
TEST_CASE_METHOD(TestSpritesFixture, "update_sprite_percent_integration") {
    auto test_bitmap = create_bitmap("Test Bitmap 127", 100, 100);
    bitmap_cleanup cleanup_bitmap;
    auto test_sprite = create_sprite(test_bitmap);
    sprite_cleanup cleanup_sprite;
    sprite_set_velocity(test_sprite, vector_to(100.0, 100.0));
    update_sprite(test_sprite, 0.5f);
    REQUIRE(50.0f == sprite_x(test_sprite));
    REQUIRE(50.0f == sprite_y(test_sprite));
}
TEST_CASE_METHOD(TestSpritesFixture, "update_sprite_percent_with_sound_integration") {
    auto test_animation = load_animation_script("Test Script 16", "startup.txt");
    animation_script_cleanup cleanup_animation_script;
    auto test_bitmap = create_bitmap("Test Bitmap 128", 100, 100);
    bitmap_cleanup cleanup_bitmap;
    auto test_sprite = create_sprite(test_bitmap, test_animation);
    sprite_cleanup cleanup_sprite;
    sprite_start_animation(test_sprite, "splash", true);
    update_sprite(test_sprite, 0.5f, true);
    REQUIRE(sound_effect_playing("SwinGameStart"));
    stop_sound_effect("SwinGameStart");
    update_sprite(test_sprite, 0.5f, false);
    REQUIRE_FALSE(sound_effect_playing("SwinGameStart"));
}
TEST_CASE_METHOD(TestSpritesFixture, "update_sprite_animation_integration") {
    auto test_bitmap = create_bitmap("Test Bitmap 129", 100, 100);
    bitmap_cleanup cleanup_bitmap;
    auto test_animation = load_animation_script("Test Script 17", "kermit.txt");
    animation_script_cleanup cleanup_animation_script;
    auto test_sprite = create_sprite(test_bitmap, test_animation);
    sprite_cleanup cleanup_sprite;
    sprite_start_animation(test_sprite, "walkfront");
    REQUIRE_FALSE(sprite_animation_has_ended(test_sprite));
    for (int i = 0; i < 50; ++i) {
        update_sprite_animation(test_sprite);
    }
    REQUIRE(sprite_animation_has_ended(test_sprite));
}
TEST_CASE_METHOD(TestSpritesFixture, "update_sprite_animation_with_sound_integration") {
    auto test_bitmap = create_bitmap("Test Bitmap 130", 100, 100);
    bitmap_cleanup cleanup_bitmap;
    auto test_animation = load_animation_script("Test Script 18", "startup.txt");
    animation_script_cleanup cleanup_animation_script;
    auto test_sprite = create_sprite(test_bitmap, test_animation);
    sprite_cleanup cleanup_sprite;
    sprite_start_animation(test_sprite, "splash");
    update_sprite_animation(test_sprite, true);
    REQUIRE(sound_effect_playing("SwinGameStart"));
    stop_sound_effect("SwinGameStart");
    for (int i = 0; i < 100; ++i) {
        update_sprite_animation(test_sprite, false);
    }
    REQUIRE_FALSE(sound_effect_playing("SwinGameStart"));
}
TEST_CASE_METHOD(TestSpritesFixture, "update_sprite_animation_percent_integration") {
    auto test_bitmap = create_bitmap("Test Bitmap 131", 100, 100);
    bitmap_cleanup cleanup_bitmap;
    auto test_animation = load_animation_script("Test Script 19", "startup.txt");
    animation_script_cleanup cleanup_animation_script;
    auto test_sprite = create_sprite(test_bitmap, test_animation);
    sprite_cleanup cleanup_sprite;
    sprite_start_animation(test_sprite, "splash");
    REQUIRE_FALSE(sprite_animation_has_ended(test_sprite));
    for (int i = 0; i < 100; ++i) {
        update_sprite_animation(test_sprite, 100.0f);
    }
    REQUIRE(sprite_animation_has_ended(test_sprite));
}
TEST_CASE_METHOD(TestSpritesFixture, "update_sprite_animation_percent_with_sound_integration") {
    auto test_bitmap = create_bitmap("Test Bitmap 132", 100, 100);
    bitmap_cleanup cleanup_bitmap;
    auto test_animation = load_animation_script("Test Script 20", "startup.txt");
    animation_script_cleanup cleanup_animation_script;
    auto test_sprite = create_sprite(test_bitmap, test_animation);
    sprite_cleanup cleanup_sprite;
    sprite_start_animation(test_sprite, "splash");
    REQUIRE_FALSE(sprite_animation_has_ended(test_sprite));
    update_sprite_animation(test_sprite, 100.0f, true);
    REQUIRE(sound_effect_playing("SwinGameStart"));
    stop_sound_effect("SwinGameStart");
    for (int i = 0; i < 100; ++i) {
        update_sprite_animation(test_sprite, 100.0f, false);
    }
    REQUIRE_FALSE(sound_effect_playing("SwinGameStart"));
}
TEST_CASE_METHOD(TestSpritesFixture, "vector_from_center_sprite_to_point_point_integration") {
    auto test_bitmap = create_bitmap("Test Bitmap 133", 100, 100);
    bitmap_cleanup cleanup_bitmap;
    auto test_sprite = create_sprite(test_bitmap);
    sprite_cleanup cleanup_sprite;
    sprite_set_position(test_sprite, point_at(0.0, 0.0));
    auto target_point = point_at(150.0, 150.0);
    auto vector = vector_from_center_sprite_to_point(test_sprite, target_point);
    REQUIRE(100.0 == vector.x);
    REQUIRE(100.0 == vector.y);
}
TEST_CASE_METHOD(TestSpritesFixture, "vector_from_to_integration") {
    auto test_bitmap = create_bitmap("Test Bitmap 134", 100, 100);
    bitmap_cleanup cleanup_bitmap;
    auto test_sprite1 = create_sprite(test_bitmap);
    sprite_cleanup cleanup_sprite;
    auto test_sprite2 = create_sprite(test_bitmap);
    sprite_set_position(test_sprite1, point_at(0.0, 0.0));
    sprite_set_position(test_sprite2, point_at(100.0, 100.0));
    auto vector = vector_from_to(test_sprite1, test_sprite2);
    REQUIRE(100.0 == vector.x);
    REQUIRE(100.0 == vector.y);
}
