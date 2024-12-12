#include "splashkit.h"
#include <catch2/catch.hpp>

class TestSprites {
public:
    TEST_CASE("call_for_all_sprites_with_value_integration") {
        auto helper = helper();
        auto test_window = open_window("Test Window", 800, 600);
        auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
        auto test_sprite1 = create_sprite(test_bitmap);
        auto test_sprite2 = create_sprite(test_bitmap);
        sprite_set_x(test_sprite1, 100f);
        sprite_set_x(test_sprite2, 200f);
        call_for_all_sprites(helper->SpriteFloatFunction, 300f);
        REQUIRE(300 == sprite_x(test_sprite1));
        REQUIRE(300 == sprite_x(test_sprite2));
        free_all_sprites();
        free_bitmap(test_bitmap);
        close_window(test_window);
    }
    TEST_CASE("call_for_all_sprites_integration") {
        auto helper = helper();
        auto test_window = open_window("Test Window", 800, 600);
        auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
        auto test_sprite1 = create_sprite(test_bitmap);
        auto test_sprite2 = create_sprite(test_bitmap);
        sprite_set_position(test_sprite1, point_at(100, 100));
        sprite_set_position(test_sprite2, point_at(200, 200));
        call_for_all_sprites(helper->SpriteFunction);
        REQUIRE(300 == sprite_x(test_sprite1));
        REQUIRE(300 == sprite_x(test_sprite2));
        free_all_sprites();
        free_bitmap(test_bitmap);
        close_window(test_window);
    }
    TEST_CASE("call_on_sprite_event_integration") {
        auto helper = helper();
        auto test_window = open_window("Test Window", 800, 600);
        auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
        auto test_sprite = create_sprite("test_sprite", test_bitmap);
        call_on_sprite_event(helper->sprite_event_handler);
        sprite_start_animation(test_sprite, "test");
        update_sprite(test_sprite);
        REQUIRE(helper->event_called);
        free_sprite(test_sprite);
        free_bitmap(test_bitmap);
        close_window(test_window);
    }
    TEST_CASE("center_point_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
        auto test_sprite = create_sprite(test_bitmap);
        sprite_set_position(test_sprite, point_at(100, 100));
        auto center_point = center_point(test_sprite);
        REQUIRE(150 == center_point->X);
        REQUIRE(150 == center_point->Y);
        free_sprite(test_sprite);
        free_bitmap(test_bitmap);
        close_window(test_window);
    }
    TEST_CASE("create_sprite_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
        auto test_sprite = create_sprite(test_bitmap);
        REQUIRE(test_sprite != nullptr);
        REQUIRE(has_sprite(sprite_name(test_sprite)));
        free_sprite(test_sprite);
        free_bitmap(test_bitmap);
        close_window(test_window);
    }
    TEST_CASE("create_sprite_with_animation_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
        auto test_animation = load_animation_script("test_animation", "kermit.txt");
        auto test_sprite = create_sprite(test_bitmap, test_animation);
        REQUIRE(test_sprite != nullptr);
        REQUIRE(has_sprite(sprite_name(test_sprite)));
        free_sprite(test_sprite);
        free_bitmap(test_bitmap);
        free_animation_script(test_animation);
        close_window(test_window);
    }
    TEST_CASE("create_sprite_with_bitmap_named_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
        auto test_sprite = create_sprite("test_bitmap");
        REQUIRE(test_sprite != nullptr);
        REQUIRE(has_sprite(sprite_name(test_sprite)));
        free_sprite(test_sprite);
        free_bitmap(test_bitmap);
        close_window(test_window);
    }
    TEST_CASE("create_sprite_named_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
        auto test_sprite = create_sprite("test_sprite", test_bitmap);
        REQUIRE(test_sprite != nullptr);
        REQUIRE("test_sprite" == sprite_name(test_sprite));
        free_sprite(test_sprite);
        free_bitmap(test_bitmap);
        close_window(test_window);
    }
    TEST_CASE("create_sprite_named_with_animation_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
        auto test_animation = load_animation_script("test_animation", "kermit.txt");
        auto test_sprite = create_sprite("test_sprite", test_bitmap, test_animation);
        REQUIRE(test_sprite != nullptr);
        REQUIRE("test_sprite" == sprite_name(test_sprite));
        free_sprite(test_sprite);
        free_bitmap(test_bitmap);
        free_animation_script(test_animation);
        close_window(test_window);
    }
    TEST_CASE("create_sprite_with_bitmap_and_animation_named_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
        auto test_animation = load_animation_script("test_animation", "kermit.txt");
        auto test_sprite = create_sprite("test_bitmap", "test_animation");
        REQUIRE(test_sprite != nullptr);
        REQUIRE(has_sprite(sprite_name(test_sprite)));
        free_sprite(test_sprite);
        free_bitmap(test_bitmap);
        free_animation_script(test_animation);
        close_window(test_window);
    }
    TEST_CASE("create_sprite_pack_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        REQUIRE_FALSE(has_sprite_pack("test_pack"));
        create_sprite_pack("test_pack");
        REQUIRE(has_sprite_pack("test_pack"));
        free_sprite_pack("test_pack");
        close_window(test_window);
    }
    TEST_CASE("current_sprite_pack_integration") {
        REQUIRE("default" == current_sprite_pack());
        create_sprite_pack("test_pack");
        select_sprite_pack("test_pack");
        REQUIRE("test_pack" == current_sprite_pack());
        select_sprite_pack("default");
        REQUIRE("default" == current_sprite_pack());
        free_sprite_pack("test_pack");
    }
    TEST_CASE("draw_all_sprites_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
        clear_bitmap(test_bitmap, color_black());
        auto test_sprite1 = create_sprite(test_bitmap);
        auto test_sprite2 = create_sprite(test_bitmap);
        sprite_set_position(test_sprite1, point_at(100, 100));
        sprite_set_position(test_sprite2, point_at(200, 200));
        clear_screen(color_white());
        draw_all_sprites();
        refresh_screen();
        REQUIRE(color_black() == get_pixel(test_window, 100, 100));
        REQUIRE(color_black() == get_pixel(test_window, 200, 200));
        free_all_sprites();
        free_bitmap(test_bitmap);
        close_window(test_window);
    }
    TEST_CASE("draw_sprite_offset_by_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
        clear_bitmap(test_bitmap, color_black());
        auto test_sprite = create_sprite(test_bitmap);
        sprite_set_position(test_sprite, point_at(400, 300));
        clear_screen(color_white());
        draw_sprite(test_sprite, vector_from_angle(50, 50));
        refresh_screen();
        REQUIRE(color_white() != get_pixel(test_window, 450, 350));
        free_sprite(test_sprite);
        free_bitmap(test_bitmap);
        close_window(test_window);
    }
    TEST_CASE("draw_sprite_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
        clear_bitmap(test_bitmap, color_black());
        auto test_sprite = create_sprite("test_sprite", test_bitmap);
        sprite_set_position(test_sprite, point_at(400, 300));
        clear_screen(color_white());
        draw_sprite(test_sprite);
        refresh_screen();
        REQUIRE(color_black() == get_pixel(test_window, 400, 300));
        free_sprite(test_sprite);
        free_bitmap(test_bitmap);
        close_window(test_window);
    }
    TEST_CASE("draw_sprite_offset_x_y_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
        clear_bitmap(test_bitmap, color_black());
        auto test_sprite = create_sprite(test_bitmap);
        sprite_set_position(test_sprite, point_at(400, 300));
        clear_screen(color_white());
        draw_sprite(test_sprite, 50.0, 50.0);
        refresh_screen();
        REQUIRE(color_white() != get_pixel(test_window, 450, 350));
        free_sprite(test_sprite);
        free_bitmap(test_bitmap);
        close_window(test_window);
    }
    TEST_CASE("free_all_sprites_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
        auto test_sprite1 = create_sprite("test_sprite1", test_bitmap);
        auto test_sprite2 = create_sprite("test_sprite2", test_bitmap);
        REQUIRE(has_sprite("test_sprite1"));
        REQUIRE(has_sprite("test_sprite2"));
        free_all_sprites();
        REQUIRE_FALSE(has_sprite("test_sprite1"));
        REQUIRE_FALSE(has_sprite("test_sprite2"));
        free_bitmap(test_bitmap);
        close_window(test_window);
    }
    TEST_CASE("free_sprite_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
        auto test_sprite = create_sprite("test_sprite", test_bitmap);
        REQUIRE(has_sprite("test_sprite"));
        free_sprite(test_sprite);
        REQUIRE_FALSE(has_sprite("test_sprite"));
        free_bitmap(test_bitmap);
        close_window(test_window);
    }
    TEST_CASE("free_sprite_pack_integration") {
        REQUIRE(has_sprite_pack("default"));
        create_sprite_pack("test_pack");
        REQUIRE(has_sprite_pack("test_pack"));
        free_sprite_pack("test_pack");
        REQUIRE_FALSE(has_sprite_pack("test_pack"));
        REQUIRE(has_sprite_pack("default"));
    }
    TEST_CASE("has_sprite_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
        REQUIRE_FALSE(has_sprite("test_sprite"));
        auto test_sprite = create_sprite("test_sprite", test_bitmap);
        REQUIRE(has_sprite("test_sprite"));
        free_sprite(test_sprite);
        REQUIRE_FALSE(has_sprite("test_sprite"));
        free_bitmap(test_bitmap);
        close_window(test_window);
    }
    TEST_CASE("has_sprite_pack_integration") {
        REQUIRE_FALSE(has_sprite_pack("test_pack"));
        create_sprite_pack("test_pack");
        REQUIRE(has_sprite_pack("test_pack"));
        free_sprite_pack("test_pack");
        REQUIRE_FALSE(has_sprite_pack("test_pack"));
    }
    TEST_CASE("move_sprite_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
        auto test_sprite = create_sprite("test_sprite", test_bitmap);
        auto start_position = point_at(100.0, 100.0);
        sprite_set_position(test_sprite, start_position);
        sprite_set_velocity(test_sprite, vector_to(10.0, 10.0));
        move_sprite(test_sprite);
        REQUIRE(110.0 == sprite_x(test_sprite));
        REQUIRE(110.0 == sprite_y(test_sprite));
        free_sprite(test_sprite);
        free_bitmap(test_bitmap);
        close_window(test_window);
    }
    TEST_CASE("move_sprite_by_vector_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
        auto test_sprite = create_sprite("test_sprite", test_bitmap);
        sprite_set_position(test_sprite, point_at(100, 100));
        move_sprite(test_sprite, vector_to(50, 50));
        REQUIRE(150 == sprite_x(test_sprite));
        REQUIRE(150 == sprite_y(test_sprite));
        free_sprite(test_sprite);
        free_bitmap(test_bitmap);
        close_window(test_window);
    }
    TEST_CASE("move_sprite_by_vector_percent_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
        auto test_sprite = create_sprite("test_sprite", test_bitmap);
        sprite_set_position(test_sprite, point_at(100.0, 100.0));
        move_sprite(test_sprite, vector_to(50.0, 50.0), 0.5f);
        REQUIRE(125.0 == sprite_x(test_sprite));
        REQUIRE(125.0 == sprite_y(test_sprite));
        free_sprite(test_sprite);
        free_bitmap(test_bitmap);
        close_window(test_window);
    }
    TEST_CASE("move_sprite_percent_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
        auto test_sprite = create_sprite("test_sprite", test_bitmap);
        sprite_set_position(test_sprite, point_at(100.0, 100.0));
        sprite_set_velocity(test_sprite, vector_to(10.0, 10.0));
        move_sprite(test_sprite, 0.5f);
        REQUIRE(105.0 == sprite_x(test_sprite));
        REQUIRE(105.0 == sprite_y(test_sprite));
        free_sprite(test_sprite);
        free_bitmap(test_bitmap);
        close_window(test_window);
    }
    TEST_CASE("move_sprite_to_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
        auto test_sprite = create_sprite("test_sprite", test_bitmap);
        move_sprite_to(test_sprite, 400.0, 300.0);
        REQUIRE(400.0 == sprite_x(test_sprite));
        REQUIRE(300.0 == sprite_y(test_sprite));
        free_sprite(test_sprite);
        free_bitmap(test_bitmap);
        close_window(test_window);
    }
    TEST_CASE("select_sprite_pack_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        create_sprite_pack("test_pack");
        auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
        auto test_sprite = create_sprite("test_sprite", test_bitmap);
        REQUIRE("default" == current_sprite_pack());
        select_sprite_pack("test_pack");
        REQUIRE("test_pack" == current_sprite_pack());
        free_sprite(test_sprite);
        free_bitmap(test_bitmap);
        free_sprite_pack("test_pack");
        close_window(test_window);
    }
    TEST_CASE("sprite_add_layer_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
        auto test_sprite = create_sprite("test_sprite", test_bitmap);
        auto new_layer_bitmap = create_bitmap("new_layer", 50, 50);
        auto layer_index = sprite_add_layer(test_sprite, new_layer_bitmap, "new_layer");
        REQUIRE(1 == layer_index);
        REQUIRE(2 == sprite_layer_count(test_sprite));
        free_sprite(test_sprite);
        free_bitmap(test_bitmap);
        free_bitmap(new_layer_bitmap);
        close_window(test_window);
    }
    TEST_CASE("sprite_add_to_velocity_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
        auto test_sprite = create_sprite("test_sprite", test_bitmap);
        sprite_set_velocity(test_sprite, vector_to(0, 0));
        sprite_add_to_velocity(test_sprite, vector_to(10, 10));
        auto velocity = sprite_velocity(test_sprite);
        REQUIRE(10.0 == velocity->X);
        REQUIRE(10.0 == velocity->Y);
        free_sprite(test_sprite);
        free_bitmap(test_bitmap);
        close_window(test_window);
    }
    TEST_CASE("sprite_add_value_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
        auto test_sprite = create_sprite("test_sprite", test_bitmap);
        sprite_add_value(test_sprite, "health", 100);
        REQUIRE(sprite_has_value(test_sprite, "health"));
        REQUIRE(100 == sprite_value(test_sprite, "health"));
        free_sprite(test_sprite);
        free_bitmap(test_bitmap);
        close_window(test_window);
    }
    TEST_CASE("sprite_add_value_with_default_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
        auto test_sprite = create_sprite("test_sprite", test_bitmap);
        sprite_add_value(test_sprite, "health", 100.0f);
        REQUIRE(sprite_has_value(test_sprite, "health"));
        REQUIRE(100.0 == sprite_value(test_sprite, "health"));
        free_sprite(test_sprite);
        free_bitmap(test_bitmap);
        close_window(test_window);
    }
    TEST_CASE("sprite_anchor_point_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
        auto test_sprite = create_sprite("test_sprite", test_bitmap);
        auto anchor_point = sprite_anchor_point(test_sprite);
        REQUIRE(50 == anchor_point->X);
        REQUIRE(50 == anchor_point->Y);
        free_sprite(test_sprite);
        free_bitmap(test_bitmap);
        close_window(test_window);
    }
    TEST_CASE("sprite_anchor_position_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
        auto test_sprite = create_sprite("test_sprite", test_bitmap);
        sprite_set_position(test_sprite, point_at(100, 100));
        auto anchor_position = sprite_anchor_position(test_sprite);
        REQUIRE(150 == anchor_position->X);
        REQUIRE(150 == anchor_position->Y);
        free_sprite(test_sprite);
        free_bitmap(test_bitmap);
        close_window(test_window);
    }
    TEST_CASE("sprite_animation_has_ended_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
        auto test_animation = load_animation_script("test_animation", "kermit.txt");
        auto test_sprite = create_sprite("test_sprite", test_bitmap, test_animation);
        sprite_start_animation(test_sprite, "walkfront");
        REQUIRE_FALSE(sprite_animation_has_ended(test_sprite));
        update_sprite_animation(test_sprite, 100);
        REQUIRE(sprite_animation_has_ended(test_sprite));
        free_sprite(test_sprite);
        free_bitmap(test_bitmap);
        free_animation_script(test_animation);
        close_window(test_window);
    }
    TEST_CASE("sprite_animation_name_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
        auto test_animation = load_animation_script("test_animation", "kermit.txt");
        auto test_sprite = create_sprite("test_sprite", test_bitmap, test_animation);
        sprite_start_animation(test_sprite, "walkfront");
        REQUIRE("walkfront" == sprite_animation_name(test_sprite));
        free_sprite(test_sprite);
        free_bitmap(test_bitmap);
        free_animation_script(test_animation);
        close_window(test_window);
    }
    TEST_CASE("sprite_at_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
        clear_bitmap(test_bitmap, color_red());
        auto test_sprite = create_sprite("test_sprite", test_bitmap);
        sprite_set_x(test_sprite, 400f);
        sprite_set_y(test_sprite, 300f);
        draw_sprite(test_sprite);
        REQUIRE(sprite_at(test_sprite, point_at(400, 300)));
        REQUIRE_FALSE(sprite_at(test_sprite, point_at(600, 500)));
        free_sprite(test_sprite);
        free_bitmap(test_bitmap);
        close_window(test_window);
    }
    TEST_CASE("sprite_bring_layer_forward_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
        auto test_sprite = create_sprite("test_sprite", test_bitmap);
        auto layer_index = sprite_add_layer(test_sprite, test_bitmap, "layer2");
        sprite_show_layer(test_sprite, layer_index);
        auto visible_index = sprite_visible_index_of_layer(test_sprite, layer_index);
        sprite_bring_layer_forward(test_sprite, visible_index);
        REQUIRE(0 == sprite_visible_index_of_layer(test_sprite, layer_index));
        free_sprite(test_sprite);
        free_bitmap(test_bitmap);
        close_window(test_window);
    }
    TEST_CASE("sprite_bring_layer_to_front_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
        auto test_sprite = create_sprite("test_sprite", test_bitmap);
        auto layer_index = sprite_add_layer(test_sprite, test_bitmap, "layer2");
        sprite_show_layer(test_sprite, layer_index);
        auto visible_index = sprite_visible_index_of_layer(test_sprite, layer_index);
        sprite_bring_layer_to_front(test_sprite, visible_index);
        REQUIRE(0 == sprite_visible_index_of_layer(test_sprite, "layer2"));
        free_sprite(test_sprite);
        free_bitmap(test_bitmap);
        close_window(test_window);
    }
    TEST_CASE("sprite_call_on_event_integration") {
        auto helper = helper();
        auto test_window = open_window("Test Window", 800, 600);
        auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
        auto test_sprite = create_sprite("test_sprite", test_bitmap);
        sprite_call_on_event(test_sprite, helper->sprite_event_handler);
        sprite_start_animation(test_sprite, "test");
        update_sprite(test_sprite);
        REQUIRE(helper->event_called);
        free_sprite(test_sprite);
        free_bitmap(test_bitmap);
        close_window(test_window);
    }
    TEST_CASE("sprite_circle_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
        auto test_sprite = create_sprite("test_sprite", test_bitmap);
        auto circle = sprite_circle(test_sprite);
        REQUIRE(50 == circle->Center.X);
        REQUIRE(50 == circle->Center.Y);
        REQUIRE(50 == circle->Radius);
        free_sprite(test_sprite);
        free_bitmap(test_bitmap);
        close_window(test_window);
    }
    TEST_CASE("sprite_collision_bitmap_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
        auto test_sprite = create_sprite("test_sprite", test_bitmap);
        auto collision_bitmap = sprite_collision_bitmap(test_sprite);
        REQUIRE(test_bitmap == collision_bitmap);
        free_sprite(test_sprite);
        free_bitmap(test_bitmap);
        close_window(test_window);
    }
    TEST_CASE("sprite_collision_circle_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
        auto test_sprite = create_sprite("test_sprite", test_bitmap);
        auto circle = sprite_collision_circle(test_sprite);
        REQUIRE(50 == circle->Center.X);
        REQUIRE(50 == circle->Center.Y);
        REQUIRE(50 == circle->Radius);
        free_sprite(test_sprite);
        free_bitmap(test_bitmap);
        close_window(test_window);
    }
    TEST_CASE("sprite_collision_kind_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
        auto test_sprite = create_sprite("test_sprite", test_bitmap);
        REQUIRE(CollisionTestKind::PIXEL_COLLISIONS == sprite_collision_kind(test_sprite));
        sprite_set_collision_kind(test_sprite, CollisionTestKind::AABB_COLLISIONS);
        REQUIRE(CollisionTestKind::AABB_COLLISIONS == sprite_collision_kind(test_sprite));
        free_sprite(test_sprite);
        free_bitmap(test_bitmap);
        close_window(test_window);
    }
    TEST_CASE("sprite_collision_rectangle_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
        auto test_sprite = create_sprite("test_sprite", test_bitmap);
        auto rect = sprite_collision_rectangle(test_sprite);
        REQUIRE(0 == rect->X);
        REQUIRE(0 == rect->Y);
        REQUIRE(100 == rect->Width);
        REQUIRE(100 == rect->Height);
        free_sprite(test_sprite);
        free_bitmap(test_bitmap);
        close_window(test_window);
    }
    TEST_CASE("sprite_current_cell_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
        auto test_animation = load_animation_script("test_animation", "kermit.txt");
        auto test_sprite = create_sprite("test_sprite", test_bitmap, test_animation);
        sprite_start_animation(test_sprite, "test_animation");
        REQUIRE(0 == sprite_current_cell(test_sprite));
        free_sprite(test_sprite);
        free_bitmap(test_bitmap);
        free_animation_script(test_animation);
        close_window(test_window);
    }
    TEST_CASE("sprite_current_cell_rectangle_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
        auto test_sprite = create_sprite("test_sprite", test_bitmap);
        auto rect = sprite_current_cell_rectangle(test_sprite);
        REQUIRE(0 == rect->X);
        REQUIRE(0 == rect->Y);
        REQUIRE(100 == rect->Width);
        REQUIRE(100 == rect->Height);
        free_sprite(test_sprite);
        free_bitmap(test_bitmap);
        close_window(test_window);
    }
    TEST_CASE("sprite_dx_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
        auto test_sprite = create_sprite("test_sprite", test_bitmap);
        REQUIRE(0.0 == sprite_dx(test_sprite));
        sprite_set_dx(test_sprite, 5.0f);
        REQUIRE(5.0 == sprite_dx(test_sprite));
        free_sprite(test_sprite);
        free_bitmap(test_bitmap);
        close_window(test_window);
    }
    TEST_CASE("sprite_dy_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
        auto test_sprite = create_sprite("test_sprite", test_bitmap);
        REQUIRE(0.0 == sprite_dy(test_sprite));
        sprite_set_dy(test_sprite, 5.0f);
        REQUIRE(5.0 == sprite_dy(test_sprite));
        free_sprite(test_sprite);
        free_bitmap(test_bitmap);
        close_window(test_window);
    }
    TEST_CASE("sprite_has_value_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
        auto test_sprite = create_sprite("test_sprite", test_bitmap);
        REQUIRE_FALSE(sprite_has_value(test_sprite, "health"));
        sprite_add_value(test_sprite, "health", 100);
        REQUIRE(sprite_has_value(test_sprite, "health"));
        REQUIRE_FALSE(sprite_has_value(test_sprite, "mana"));
        free_sprite(test_sprite);
        free_bitmap(test_bitmap);
        close_window(test_window);
    }
    TEST_CASE("sprite_heading_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
        auto test_sprite = create_sprite("test_sprite", test_bitmap);
        REQUIRE(90.0 == sprite_heading(test_sprite));
        sprite_set_velocity(test_sprite, vector_to(1.0, 1.0));
        REQUIRE(45.0 == sprite_heading(test_sprite));
        free_sprite(test_sprite);
        free_bitmap(test_bitmap);
        close_window(test_window);
    }
    TEST_CASE("sprite_height_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
        auto test_sprite = create_sprite("test_sprite", test_bitmap);
        REQUIRE(100 == sprite_height(test_sprite));
        sprite_set_scale(test_sprite, 2.0f);
        REQUIRE(100 == sprite_height(test_sprite));
        free_sprite(test_sprite);
        free_bitmap(test_bitmap);
        close_window(test_window);
    }
    TEST_CASE("sprite_hide_layer_named_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
        auto test_sprite = create_sprite("test_sprite", test_bitmap);
        sprite_add_layer(test_sprite, test_bitmap, "layer2");
        sprite_show_layer(test_sprite, "layer2");
        REQUIRE(2 == sprite_visible_layer_count(test_sprite));
        sprite_hide_layer(test_sprite, "layer2");
        REQUIRE(1 == sprite_visible_layer_count(test_sprite));
        free_sprite(test_sprite);
        free_bitmap(test_bitmap);
        close_window(test_window);
    }
    TEST_CASE("sprite_hide_layer_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
        auto test_sprite = create_sprite("test_sprite", test_bitmap);
        auto layer_idx = sprite_add_layer(test_sprite, test_bitmap, "layer2");
        sprite_show_layer(test_sprite, layer_idx);
        REQUIRE(2 == sprite_visible_layer_count(test_sprite));
        sprite_hide_layer(test_sprite, layer_idx);
        REQUIRE(1 == sprite_visible_layer_count(test_sprite));
        free_sprite(test_sprite);
        free_bitmap(test_bitmap);
        close_window(test_window);
    }
    TEST_CASE("sprite_layer_named_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
        auto test_sprite = create_sprite("test_sprite", test_bitmap);
        sprite_add_layer(test_sprite, test_bitmap, "layer2");
        REQUIRE(test_bitmap == sprite_layer(test_sprite, "layer2"));
        free_sprite(test_sprite);
        free_bitmap(test_bitmap);
        close_window(test_window);
    }
    TEST_CASE("sprite_layer_at_index_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
        auto test_sprite = create_sprite("test_sprite", test_bitmap);
        auto layer_idx = sprite_add_layer(test_sprite, test_bitmap, "layer2");
        REQUIRE(test_bitmap == sprite_layer(test_sprite, layer_idx));
        free_sprite(test_sprite);
        free_bitmap(test_bitmap);
        close_window(test_window);
    }
    TEST_CASE("sprite_layer_circle_named_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
        auto test_sprite = create_sprite("test_sprite", test_bitmap);
        auto circle = sprite_layer_circle(test_sprite, "base_layer");
        REQUIRE(50 == circle->Center.X);
        REQUIRE(50 == circle->Center.Y);
        REQUIRE(50 == circle->Radius);
        free_sprite(test_sprite);
        free_bitmap(test_bitmap);
        close_window(test_window);
    }
    TEST_CASE("sprite_layer_circle_at_index_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
        auto test_sprite = create_sprite("test_sprite", test_bitmap);
        auto circle = sprite_layer_circle(test_sprite, 0);
        REQUIRE(50 == circle->Center.X);
        REQUIRE(50 == circle->Center.Y);
        REQUIRE(50 == circle->Radius);
        free_sprite(test_sprite);
        free_bitmap(test_bitmap);
        close_window(test_window);
    }
    TEST_CASE("sprite_layer_count_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
        auto test_sprite = create_sprite("test_sprite", test_bitmap);
        REQUIRE(1 == sprite_layer_count(test_sprite));
        auto layer_idx = sprite_add_layer(test_sprite, test_bitmap, "layer2");
        REQUIRE(2 == sprite_layer_count(test_sprite));
        REQUIRE(1 == layer_idx);
        free_sprite(test_sprite);
        free_bitmap(test_bitmap);
        close_window(test_window);
    }
    TEST_CASE("sprite_layer_height_named_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
        auto test_sprite = create_sprite("test_sprite", test_bitmap);
        REQUIRE(100 == sprite_layer_height(test_sprite, "base_layer"));
        auto layer_idx = sprite_add_layer(test_sprite, test_bitmap, "layer2");
        REQUIRE(100 == sprite_layer_height(test_sprite, "layer2"));
        free_sprite(test_sprite);
        free_bitmap(test_bitmap);
        close_window(test_window);
    }
    TEST_CASE("sprite_layer_height_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
        auto test_sprite = create_sprite("test_sprite", test_bitmap);
        REQUIRE(100 == sprite_layer_height(test_sprite, 0));
        auto layer_idx = sprite_add_layer(test_sprite, test_bitmap, "layer2");
        REQUIRE(100 == sprite_layer_height(test_sprite, layer_idx));
        free_sprite(test_sprite);
        free_bitmap(test_bitmap);
        close_window(test_window);
    }
    TEST_CASE("sprite_layer_index_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
        auto test_sprite = create_sprite("test_sprite", test_bitmap);
        REQUIRE(0 == sprite_layer_index(test_sprite, "base_layer"));
        auto layer_idx = sprite_add_layer(test_sprite, test_bitmap, "layer2");
        REQUIRE(layer_idx == sprite_layer_index(test_sprite, "layer2"));
        free_sprite(test_sprite);
        free_bitmap(test_bitmap);
        close_window(test_window);
    }
    TEST_CASE("sprite_layer_name_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
        auto test_sprite = create_sprite("test_sprite", test_bitmap);
        auto layer_idx = sprite_add_layer(test_sprite, test_bitmap, "layer2");
        REQUIRE("layer2" == sprite_layer_name(test_sprite, layer_idx));
        free_sprite(test_sprite);
        free_bitmap(test_bitmap);
        close_window(test_window);
    }
    TEST_CASE("sprite_layer_offset_named_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
        auto test_sprite = create_sprite("test_sprite", test_bitmap);
        REQUIRE(vector_to(0, 0) == sprite_layer_offset(test_sprite, "base_layer"));
        sprite_set_layer_offset(test_sprite, "base_layer", vector_to(10, 10));
        REQUIRE(vector_to(10, 10) == sprite_layer_offset(test_sprite, "base_layer"));
        free_sprite(test_sprite);
        free_bitmap(test_bitmap);
        close_window(test_window);
    }
    TEST_CASE("sprite_layer_offset_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
        auto test_sprite = create_sprite("test_sprite", test_bitmap);
        REQUIRE(vector_to(0, 0) == sprite_layer_offset(test_sprite, 0));
        auto layer_idx = sprite_add_layer(test_sprite, test_bitmap, "layer2");
        sprite_set_layer_offset(test_sprite, layer_idx, vector_to(10, 10));
        REQUIRE(vector_to(10, 10) == sprite_layer_offset(test_sprite, layer_idx));
        free_sprite(test_sprite);
        free_bitmap(test_bitmap);
        close_window(test_window);
    }
    TEST_CASE("sprite_layer_rectangle_named_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
        auto test_sprite = create_sprite("test_sprite", test_bitmap);
        auto rect = sprite_layer_rectangle(test_sprite, "base_layer");
        REQUIRE(0 == rect->X);
        REQUIRE(0 == rect->Y);
        REQUIRE(100 == rect->Width);
        REQUIRE(100 == rect->Height);
        free_sprite(test_sprite);
        free_bitmap(test_bitmap);
        close_window(test_window);
    }
    TEST_CASE("sprite_layer_rectangle_at_index_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
        auto test_sprite = create_sprite("test_sprite", test_bitmap);
        auto rect = sprite_layer_rectangle(test_sprite, 0);
        REQUIRE(0 == rect->X);
        REQUIRE(0 == rect->Y);
        REQUIRE(100 == rect->Width);
        REQUIRE(100 == rect->Height);
        free_sprite(test_sprite);
        free_bitmap(test_bitmap);
        close_window(test_window);
    }
    TEST_CASE("sprite_layer_width_named_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
        auto test_sprite = create_sprite("test_sprite", test_bitmap);
        REQUIRE(100 == sprite_layer_width(test_sprite, "base_layer"));
        auto layer_idx = sprite_add_layer(test_sprite, test_bitmap, "layer2");
        REQUIRE(100 == sprite_layer_width(test_sprite, "layer2"));
        free_sprite(test_sprite);
        free_bitmap(test_bitmap);
        close_window(test_window);
    }
    TEST_CASE("sprite_layer_width_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
        auto test_sprite = create_sprite("test_sprite", test_bitmap);
        REQUIRE(100 == sprite_layer_width(test_sprite, 0));
        auto layer_idx = sprite_add_layer(test_sprite, test_bitmap, "layer2");
        REQUIRE(100 == sprite_layer_width(test_sprite, layer_idx));
        free_sprite(test_sprite);
        free_bitmap(test_bitmap);
        close_window(test_window);
    }
    TEST_CASE("sprite_location_matrix_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
        auto test_sprite = create_sprite("test_sprite", test_bitmap);
        sprite_set_position(test_sprite, point_at(100, 100));
        sprite_set_rotation(test_sprite, 45f);
        auto matrix = sprite_location_matrix(test_sprite);
        REQUIRE(150.0 == matrix->Elements[0][2]);
        REQUIRE(1 == matrix->Elements[2][2]);
        free_sprite(test_sprite);
        free_bitmap(test_bitmap);
        close_window(test_window);
    }
    TEST_CASE("sprite_mass_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
        auto test_sprite = create_sprite("test_sprite", test_bitmap);
        REQUIRE(1.0 == sprite_mass(test_sprite));
        sprite_set_mass(test_sprite, 10.0f);
        REQUIRE(10.0 == sprite_mass(test_sprite));
        free_sprite(test_sprite);
        free_bitmap(test_bitmap);
        close_window(test_window);
    }
    TEST_CASE("sprite_move_from_anchor_point_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
        auto test_sprite = create_sprite("test_sprite", test_bitmap);
        REQUIRE_FALSE(sprite_move_from_anchor_point(test_sprite));
        sprite_set_move_from_anchor_point(test_sprite, true);
        REQUIRE(sprite_move_from_anchor_point(test_sprite));
        free_sprite(test_sprite);
        free_bitmap(test_bitmap);
        close_window(test_window);
    }
    TEST_CASE("sprite_move_to_taking_seconds_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
        auto test_sprite = create_sprite("test_sprite", test_bitmap);
        sprite_set_position(test_sprite, point_at(100, 100));
        sprite_move_to(test_sprite, point_at(200, 200), 1.0f);
        update_sprite(test_sprite);
        auto position = sprite_position(test_sprite);
        free_sprite(test_sprite);
        free_bitmap(test_bitmap);
        close_window(test_window);
    }
    TEST_CASE("sprite_name_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
        auto test_sprite = create_sprite("test_sprite", test_bitmap);
        REQUIRE("test_sprite" == sprite_name(test_sprite));
        free_sprite(test_sprite);
        free_bitmap(test_bitmap);
        close_window(test_window);
    }
    TEST_CASE("sprite_named_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
        auto test_sprite = create_sprite("test_sprite", test_bitmap);
        REQUIRE(test_sprite == sprite_named("test_sprite"));
        REQUIRE(sprite_named("non_existent_sprite") == nullptr);
        free_sprite(test_sprite);
        free_bitmap(test_bitmap);
        close_window(test_window);
    }
    TEST_CASE("sprite_offscreen_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
        auto test_sprite = create_sprite("test_sprite", test_bitmap);
        sprite_set_position(test_sprite, point_at(400, 300));
        REQUIRE_FALSE(sprite_offscreen(test_sprite));
        sprite_set_position(test_sprite, point_at(-200, -200));
        REQUIRE(sprite_offscreen(test_sprite));
        free_sprite(test_sprite);
        free_bitmap(test_bitmap);
        close_window(test_window);
    }
    TEST_CASE("sprite_on_screen_at_point_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
        auto test_sprite = create_sprite("test_sprite", test_bitmap);
        sprite_set_position(test_sprite, point_at(400, 300));
        REQUIRE(sprite_on_screen_at(test_sprite, point_at(400, 300)));
        REQUIRE_FALSE(sprite_on_screen_at(test_sprite, point_at(0, 0)));
        free_sprite(test_sprite);
        free_bitmap(test_bitmap);
        close_window(test_window);
    }
    TEST_CASE("sprite_on_screen_at_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
        auto test_sprite = create_sprite("test_sprite", test_bitmap);
        sprite_set_position(test_sprite, point_at(400, 300));
        REQUIRE(sprite_on_screen_at(test_sprite, 400, 300));
        REQUIRE_FALSE(sprite_on_screen_at(test_sprite, 0, 0));
        free_sprite(test_sprite);
        free_bitmap(test_bitmap);
        close_window(test_window);
    }
    TEST_CASE("sprite_position_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
        auto test_sprite = create_sprite("test_sprite", test_bitmap);
        REQUIRE(point_at(0, 0) == sprite_position(test_sprite));
        sprite_set_position(test_sprite, point_at(400, 300));
        REQUIRE(point_at(400, 300) == sprite_position(test_sprite));
        free_sprite(test_sprite);
        free_bitmap(test_bitmap);
        close_window(test_window);
    }
    TEST_CASE("sprite_replay_animation_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
        auto test_animation = load_animation_script("test_animation", "kermit.txt");
        auto test_sprite = create_sprite(test_bitmap, test_animation);
        sprite_start_animation(test_sprite, "walkfront");
        REQUIRE_FALSE(sprite_animation_has_ended(test_sprite));
        update_sprite(test_sprite, 100);
        sprite_replay_animation(test_sprite);
        REQUIRE_FALSE(sprite_animation_has_ended(test_sprite));
        free_sprite(test_sprite);
        free_bitmap(test_bitmap);
        close_window(test_window);
    }
    TEST_CASE("sprite_replay_animation_with_sound_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
        auto test_animation = load_animation_script("test_animation", "kermit.txt");
        auto test_sprite = create_sprite(test_bitmap, test_animation);
        sprite_start_animation(test_sprite, "walkfront");
        REQUIRE_FALSE(sprite_animation_has_ended(test_sprite));
        update_sprite(test_sprite, 100);
        sprite_replay_animation(test_sprite, true);
        REQUIRE_FALSE(sprite_animation_has_ended(test_sprite));
        free_sprite(test_sprite);
        free_bitmap(test_bitmap);
        close_window(test_window);
    }
    TEST_CASE("sprite_rotation_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
        auto test_sprite = create_sprite("test_sprite", test_bitmap);
        REQUIRE(0.0 == sprite_rotation(test_sprite));
        sprite_set_rotation(test_sprite, 45.0f);
        REQUIRE(45.0 == sprite_rotation(test_sprite));
        free_sprite(test_sprite);
        free_bitmap(test_bitmap);
        close_window(test_window);
    }
    TEST_CASE("sprite_scale_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
        auto test_sprite = create_sprite("test_sprite", test_bitmap);
        REQUIRE(1.0 == sprite_scale(test_sprite));
        sprite_set_scale(test_sprite, 2.0f);
        REQUIRE(2.0 == sprite_scale(test_sprite));
        free_sprite(test_sprite);
        free_bitmap(test_bitmap);
        close_window(test_window);
    }
    TEST_CASE("sprite_screen_rectangle_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
        auto test_animation = load_animation_script("test_animation", "kermit.txt");
        clear_bitmap(test_bitmap, color_white());
        auto test_sprite = create_sprite(test_bitmap, test_animation);
        sprite_start_animation(test_sprite, "walkfront");
        sprite_set_position(test_sprite, point_at(0, 0));
        auto rect = sprite_screen_rectangle(test_sprite);
        REQUIRE(0 == rect->X);
        REQUIRE(0 == rect->Y);
        REQUIRE(100 == rect->Width);
        REQUIRE(100 == rect->Height);
        free_sprite(test_sprite);
        free_bitmap(test_bitmap);
        close_window(test_window);
    }
    TEST_CASE("sprite_send_layer_backward_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
        auto test_sprite = create_sprite("test_sprite", test_bitmap);
        auto layer1 = sprite_add_layer(test_sprite, test_bitmap, "layer1");
        sprite_show_layer(test_sprite, layer1);
        auto layer2 = sprite_add_layer(test_sprite, test_bitmap, "layer2");
        sprite_show_layer(test_sprite, layer2);
        auto visible_index = sprite_visible_index_of_layer(test_sprite, layer2);
        sprite_send_layer_backward(test_sprite, visible_index);
        REQUIRE(2 == sprite_visible_index_of_layer(test_sprite, layer2));
        free_sprite(test_sprite);
        free_bitmap(test_bitmap);
        close_window(test_window);
    }
    TEST_CASE("sprite_send_layer_to_back_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
        auto test_sprite = create_sprite("test_sprite", test_bitmap);
        auto layer1 = sprite_add_layer(test_sprite, test_bitmap, "layer1");
        sprite_show_layer(test_sprite, layer1);
        auto layer2 = sprite_add_layer(test_sprite, test_bitmap, "layer2");
        sprite_show_layer(test_sprite, layer2);
        auto visible_index = sprite_visible_index_of_layer(test_sprite, layer2);
        sprite_send_layer_to_back(test_sprite, visible_index);
        REQUIRE(2 == sprite_visible_index_of_layer(test_sprite, layer2));
        free_sprite(test_sprite);
        free_bitmap(test_bitmap);
        close_window(test_window);
    }
    TEST_CASE("sprite_set_anchor_point_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
        auto test_sprite = create_sprite("test_sprite", test_bitmap);
        REQUIRE(point_at(50, 50) == sprite_anchor_point(test_sprite));
        sprite_set_anchor_point(test_sprite, point_at(25, 25));
        REQUIRE(point_at(25, 25) == sprite_anchor_point(test_sprite));
        free_sprite(test_sprite);
        free_bitmap(test_bitmap);
        close_window(test_window);
    }
    TEST_CASE("sprite_set_collision_bitmap_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
        auto test_sprite = create_sprite("test_sprite", test_bitmap);
        REQUIRE(test_bitmap == sprite_collision_bitmap(test_sprite));
        auto new_bitmap = create_bitmap("new_bitmap", 200, 200);
        sprite_set_collision_bitmap(test_sprite, new_bitmap);
        REQUIRE(new_bitmap == sprite_collision_bitmap(test_sprite));
        free_sprite(test_sprite);
        free_bitmap(test_bitmap);
        free_bitmap(new_bitmap);
        close_window(test_window);
    }
    TEST_CASE("sprite_set_collision_kind_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
        auto test_sprite = create_sprite("test_sprite", test_bitmap);
        REQUIRE(CollisionTestKind::PIXEL_COLLISIONS == sprite_collision_kind(test_sprite));
        sprite_set_collision_kind(test_sprite, CollisionTestKind::AABB_COLLISIONS);
        REQUIRE(CollisionTestKind::AABB_COLLISIONS == sprite_collision_kind(test_sprite));
        free_sprite(test_sprite);
        free_bitmap(test_bitmap);
        close_window(test_window);
    }
    TEST_CASE("sprite_set_dx_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
        auto test_sprite = create_sprite("test_sprite", test_bitmap);
        REQUIRE(0.0 == sprite_dx(test_sprite));
        sprite_set_dx(test_sprite, 5.0f);
        REQUIRE(5.0 == sprite_dx(test_sprite));
        free_sprite(test_sprite);
        free_bitmap(test_bitmap);
        close_window(test_window);
    }
    TEST_CASE("sprite_set_dy_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
        auto test_sprite = create_sprite("test_sprite", test_bitmap);
        REQUIRE(0.0 == sprite_dy(test_sprite));
        sprite_set_dy(test_sprite, 5.0f);
        REQUIRE(5.0 == sprite_dy(test_sprite));
        free_sprite(test_sprite);
        free_bitmap(test_bitmap);
        close_window(test_window);
    }
    TEST_CASE("sprite_set_heading_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
        auto test_sprite = create_sprite("test_sprite", test_bitmap);
        sprite_set_velocity(test_sprite, vector_from_angle(90, 1));
        REQUIRE(90.0 == sprite_heading(test_sprite));
        sprite_set_heading(test_sprite, 45.0f);
        REQUIRE(45.0 == sprite_heading(test_sprite));
        free_sprite(test_sprite);
        free_bitmap(test_bitmap);
        close_window(test_window);
    }
    TEST_CASE("sprite_set_layer_offset_named_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
        auto test_sprite = create_sprite("test_sprite", test_bitmap);
        REQUIRE(vector_to(0, 0) == sprite_layer_offset(test_sprite, "base_layer"));
        sprite_set_layer_offset(test_sprite, "base_layer", vector_to(10.0, 10.0));
        REQUIRE(vector_to(10.0, 10.0) == sprite_layer_offset(test_sprite, "base_layer"));
        free_sprite(test_sprite);
        free_bitmap(test_bitmap);
        close_window(test_window);
    }
    TEST_CASE("sprite_set_layer_offset_at_index_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
        auto test_sprite = create_sprite("test_sprite", test_bitmap);
        REQUIRE(vector_to(0, 0) == sprite_layer_offset(test_sprite, 0));
        sprite_set_layer_offset(test_sprite, 0, vector_to(10.0, 10.0));
        REQUIRE(vector_to(10.0, 10.0) == sprite_layer_offset(test_sprite, 0));
        free_sprite(test_sprite);
        free_bitmap(test_bitmap);
        close_window(test_window);
    }
    TEST_CASE("sprite_set_mass_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
        auto test_sprite = create_sprite("test_sprite", test_bitmap);
        REQUIRE(1.0 == sprite_mass(test_sprite));
        sprite_set_mass(test_sprite, 10.0f);
        REQUIRE(10.0 == sprite_mass(test_sprite));
        free_sprite(test_sprite);
        free_bitmap(test_bitmap);
        close_window(test_window);
    }
    TEST_CASE("sprite_set_move_from_anchor_point_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
        auto test_sprite = create_sprite("test_sprite", test_bitmap);
        REQUIRE_FALSE(sprite_move_from_anchor_point(test_sprite));
        sprite_set_move_from_anchor_point(test_sprite, true);
        REQUIRE(sprite_move_from_anchor_point(test_sprite));
        free_sprite(test_sprite);
        free_bitmap(test_bitmap);
        close_window(test_window);
    }
    TEST_CASE("sprite_set_position_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
        auto test_sprite = create_sprite("test_sprite", test_bitmap);
        REQUIRE(point_at(0, 0) == sprite_position(test_sprite));
        sprite_set_position(test_sprite, point_at(100, 100));
        REQUIRE(point_at(100, 100) == sprite_position(test_sprite));
        free_sprite(test_sprite);
        free_bitmap(test_bitmap);
        close_window(test_window);
    }
    TEST_CASE("sprite_set_rotation_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
        auto test_sprite = create_sprite("test_sprite", test_bitmap);
        REQUIRE(0.0 == sprite_rotation(test_sprite));
        sprite_set_rotation(test_sprite, 45.0f);
        REQUIRE(45.0 == sprite_rotation(test_sprite));
        free_sprite(test_sprite);
        free_bitmap(test_bitmap);
        close_window(test_window);
    }
    TEST_CASE("sprite_set_scale_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
        auto test_sprite = create_sprite("test_sprite", test_bitmap);
        REQUIRE(1.0 == sprite_scale(test_sprite));
        sprite_set_scale(test_sprite, 2.0f);
        REQUIRE(2.0 == sprite_scale(test_sprite));
        free_sprite(test_sprite);
        free_bitmap(test_bitmap);
        close_window(test_window);
    }
    TEST_CASE("sprite_set_speed_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
        auto test_sprite = create_sprite("test_sprite", test_bitmap);
        sprite_set_velocity(test_sprite, vector_from_angle(0, 1));
        sprite_set_speed(test_sprite, 5.0f);
        REQUIRE(5.0 == sprite_speed(test_sprite));
        free_sprite(test_sprite);
        free_bitmap(test_bitmap);
        close_window(test_window);
    }
    TEST_CASE("sprite_set_value_named_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
        auto test_sprite = create_sprite("test_sprite", test_bitmap);
        REQUIRE_FALSE(sprite_has_value(test_sprite, "test_value"));
        sprite_add_value(test_sprite, "test_value", 0.0f);
        sprite_set_value(test_sprite, "test_value", 10.5f);
        REQUIRE(10.5 == sprite_value(test_sprite, "test_value"));
        free_sprite(test_sprite);
        free_bitmap(test_bitmap);
        close_window(test_window);
    }
    TEST_CASE("sprite_set_velocity_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
        auto test_sprite = create_sprite("test_sprite", test_bitmap);
        REQUIRE(vector_to(0, 0) == sprite_velocity(test_sprite));
        sprite_set_velocity(test_sprite, vector_to(5.0, 5.0));
        REQUIRE(vector_to(5.0, 5.0) == sprite_velocity(test_sprite));
        free_sprite(test_sprite);
        free_bitmap(test_bitmap);
        close_window(test_window);
    }
    TEST_CASE("sprite_set_x_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
        auto test_sprite = create_sprite("test_sprite", test_bitmap);
        REQUIRE(0.0 == sprite_x(test_sprite));
        sprite_set_x(test_sprite, 150.0f);
        REQUIRE(150.0 == sprite_x(test_sprite));
        free_sprite(test_sprite);
        free_bitmap(test_bitmap);
        close_window(test_window);
    }
    TEST_CASE("sprite_set_y_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
        auto test_sprite = create_sprite("test_sprite", test_bitmap);
        REQUIRE(0.0 == sprite_y(test_sprite));
        sprite_set_y(test_sprite, 300.0f);
        REQUIRE(300.0 == sprite_y(test_sprite));
        free_sprite(test_sprite);
        free_bitmap(test_bitmap);
        close_window(test_window);
    }
    TEST_CASE("sprite_show_layer_named_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
        auto test_sprite = create_sprite("test_sprite", test_bitmap);
        auto layer_idx = sprite_add_layer(test_sprite, test_bitmap, "layer2");
        sprite_hide_layer(test_sprite, "layer2");
        REQUIRE(1 == sprite_visible_layer_count(test_sprite));
        REQUIRE(layer_idx == sprite_show_layer(test_sprite, "layer2"));
        REQUIRE(2 == sprite_visible_layer_count(test_sprite));
        free_sprite(test_sprite);
        free_bitmap(test_bitmap);
        close_window(test_window);
    }
    TEST_CASE("sprite_show_layer_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
        auto test_sprite = create_sprite("test_sprite", test_bitmap);
        auto layer_idx = sprite_add_layer(test_sprite, test_bitmap, "layer2");
        sprite_hide_layer(test_sprite, layer_idx);
        REQUIRE(1 == sprite_visible_layer_count(test_sprite));
        REQUIRE(layer_idx == sprite_show_layer(test_sprite, layer_idx));
        REQUIRE(2 == sprite_visible_layer_count(test_sprite));
        free_sprite(test_sprite);
        free_bitmap(test_bitmap);
        close_window(test_window);
    }
    TEST_CASE("sprite_speed_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
        auto test_sprite = create_sprite("test_sprite", test_bitmap);
        REQUIRE(0.0 == sprite_speed(test_sprite));
        sprite_set_velocity(test_sprite, vector_to(3.0, 4.0));
        REQUIRE(5.0 == sprite_speed(test_sprite));
        free_sprite(test_sprite);
        free_bitmap(test_bitmap);
        close_window(test_window);
    }
    TEST_CASE("sprite_start_animation_named_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
        auto test_animation = load_animation_script("test_animation", "kermit.txt");
        auto test_sprite = create_sprite(test_bitmap, test_animation);
        sprite_start_animation(test_sprite, "walkfront");
        REQUIRE_FALSE(sprite_animation_has_ended(test_sprite));
        update_sprite_animation(test_sprite, 100);
        REQUIRE(sprite_animation_has_ended(test_sprite));
        REQUIRE("walkfront" == sprite_animation_name(test_sprite));
        free_sprite(test_sprite);
        free_bitmap(test_bitmap);
        close_window(test_window);
    }
    TEST_CASE("sprite_start_animation_named_with_sound_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
        auto test_animation = load_animation_script("test_animation", "kermit.txt");
        auto test_sprite = create_sprite(test_bitmap, test_animation);
        sprite_start_animation(test_sprite, "walkfront", true);
        REQUIRE_FALSE(sprite_animation_has_ended(test_sprite));
        update_sprite_animation(test_sprite, 100);
        REQUIRE(sprite_animation_has_ended(test_sprite));
        REQUIRE("walkfront" == sprite_animation_name(test_sprite));
        free_sprite(test_sprite);
        free_bitmap(test_bitmap);
        close_window(test_window);
    }
    TEST_CASE("sprite_start_animation_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
        auto test_animation = load_animation_script("test_animation", "kermit.txt");
        auto test_sprite = create_sprite(test_bitmap, test_animation);
        sprite_start_animation(test_sprite, 0);
        REQUIRE_FALSE(sprite_animation_has_ended(test_sprite));
        update_sprite_animation(test_sprite, 100);
        REQUIRE(sprite_animation_has_ended(test_sprite));
        free_sprite(test_sprite);
        free_bitmap(test_bitmap);
        close_window(test_window);
    }
    TEST_CASE("sprite_start_animation_with_sound_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
        auto test_animation = load_animation_script("test_animation", "kermit.txt");
        auto test_sprite = create_sprite(test_bitmap, test_animation);
        sprite_start_animation(test_sprite, 0, true);
        REQUIRE_FALSE(sprite_animation_has_ended(test_sprite));
        update_sprite_animation(test_sprite, 100);
        update_sprite_animation(test_sprite, true);
        REQUIRE(sprite_animation_has_ended(test_sprite));
        free_sprite(test_sprite);
        free_bitmap(test_bitmap);
        close_window(test_window);
    }
    TEST_CASE("sprite_stop_calling_on_event_integration") {
        auto helper = helper();
        auto test_window = open_window("Test Window", 800, 600);
        auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
        auto test_sprite = create_sprite("test_sprite", test_bitmap);
        sprite_set_x(test_sprite, 100f);
        sprite_call_on_event(test_sprite, helper->sprite_event_handler);
        update_sprite(test_sprite);
        REQUIRE(200 == sprite_x(test_sprite));
        sprite_set_x(test_sprite, 100f);
        sprite_stop_calling_on_event(test_sprite, helper->sprite_event_handler);
        update_sprite(test_sprite);
        REQUIRE(100 == sprite_x(test_sprite));
        free_sprite(test_sprite);
        free_bitmap(test_bitmap);
        close_window(test_window);
    }
    TEST_CASE("sprite_toggle_layer_visible_named_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
        auto test_sprite = create_sprite("test_sprite", test_bitmap);
        sprite_add_layer(test_sprite, test_bitmap, "layer2");
        sprite_show_layer(test_sprite, "layer2");
        REQUIRE(2 == sprite_visible_layer_count(test_sprite));
        sprite_toggle_layer_visible(test_sprite, "layer2");
        REQUIRE(1 == sprite_visible_layer_count(test_sprite));
        sprite_toggle_layer_visible(test_sprite, "layer2");
        REQUIRE(2 == sprite_visible_layer_count(test_sprite));
        free_sprite(test_sprite);
        free_bitmap(test_bitmap);
        close_window(test_window);
    }
    TEST_CASE("sprite_toggle_layer_visible_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
        auto test_sprite = create_sprite("test_sprite", test_bitmap);
        auto layer_idx = sprite_add_layer(test_sprite, test_bitmap, "layer2");
        sprite_show_layer(test_sprite, layer_idx);
        REQUIRE(2 == sprite_visible_layer_count(test_sprite));
        sprite_toggle_layer_visible(test_sprite, layer_idx);
        REQUIRE(1 == sprite_visible_layer_count(test_sprite));
        free_sprite(test_sprite);
        free_bitmap(test_bitmap);
        close_window(test_window);
    }
    TEST_CASE("sprite_value_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
        auto test_sprite = create_sprite("test_sprite", test_bitmap);
        REQUIRE(3 == sprite_value_count(test_sprite));
        sprite_add_value(test_sprite, "test_value", 0.0f);
        REQUIRE(10.0 == sprite_value(test_sprite, "test_value"));
        free_sprite(test_sprite);
        free_bitmap(test_bitmap);
        close_window(test_window);
    }
    TEST_CASE("sprite_value_count_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
        auto test_sprite = create_sprite("test_sprite", test_bitmap);
        REQUIRE(3 == sprite_value_count(test_sprite));
        sprite_add_value(test_sprite, "health", 0.0f);
        sprite_add_value(test_sprite, "speed", 0.0f);
        REQUIRE(5 == sprite_value_count(test_sprite));
        free_sprite(test_sprite);
        free_bitmap(test_bitmap);
        close_window(test_window);
    }
    TEST_CASE("sprite_velocity_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
        auto test_sprite = create_sprite("test_sprite", test_bitmap);
        REQUIRE(vector_to(0, 0) == sprite_velocity(test_sprite));
        sprite_set_velocity(test_sprite, vector_to(5.0, 5.0));
        REQUIRE(vector_to(5.0, 5.0) == sprite_velocity(test_sprite));
        free_sprite(test_sprite);
        free_bitmap(test_bitmap);
        close_window(test_window);
    }
    TEST_CASE("sprite_visible_index_of_layer_named_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
        auto test_sprite = create_sprite("test_sprite", test_bitmap);
        REQUIRE(0 == sprite_visible_index_of_layer(test_sprite, "base_layer"));
        sprite_add_layer(test_sprite, test_bitmap, "layer2");
        sprite_show_layer(test_sprite, "layer2");
        REQUIRE(1 == sprite_visible_index_of_layer(test_sprite, "layer2"));
        free_sprite(test_sprite);
        free_bitmap(test_bitmap);
        close_window(test_window);
    }
    TEST_CASE("sprite_visible_index_of_layer_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
        auto test_sprite = create_sprite("test_sprite", test_bitmap);
        REQUIRE(0 == sprite_visible_index_of_layer(test_sprite, 0));
        auto layer_idx = sprite_add_layer(test_sprite, test_bitmap, "layer2");
        sprite_show_layer(test_sprite, layer_idx);
        REQUIRE(1 == sprite_visible_index_of_layer(test_sprite, layer_idx));
        free_sprite(test_sprite);
        free_bitmap(test_bitmap);
        close_window(test_window);
    }
    TEST_CASE("sprite_visible_layer_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
        auto test_sprite = create_sprite("test_sprite", test_bitmap);
        REQUIRE(0 == sprite_visible_layer(test_sprite, 0));
        sprite_add_layer(test_sprite, test_bitmap, "layer2");
        sprite_show_layer(test_sprite, "layer2");
        REQUIRE(1 == sprite_visible_layer(test_sprite, 1));
        free_sprite(test_sprite);
        free_bitmap(test_bitmap);
        close_window(test_window);
    }
    TEST_CASE("sprite_visible_layer_count_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
        auto test_sprite = create_sprite("test_sprite", test_bitmap);
        REQUIRE(1 == sprite_visible_layer_count(test_sprite));
        sprite_add_layer(test_sprite, test_bitmap, "layer2");
        sprite_show_layer(test_sprite, "layer2");
        REQUIRE(2 == sprite_visible_layer_count(test_sprite));
        sprite_hide_layer(test_sprite, "layer2");
        REQUIRE(1 == sprite_visible_layer_count(test_sprite));
        free_sprite(test_sprite);
        free_bitmap(test_bitmap);
        close_window(test_window);
    }
    TEST_CASE("sprite_visible_layer_id_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
        auto test_sprite = create_sprite("test_sprite", test_bitmap);
        REQUIRE(0 == sprite_visible_layer_id(test_sprite, 0));
        sprite_add_layer(test_sprite, test_bitmap, "layer2");
        sprite_show_layer(test_sprite, "layer2");
        REQUIRE(1 == sprite_visible_layer_id(test_sprite, 1));
        free_sprite(test_sprite);
        free_bitmap(test_bitmap);
        close_window(test_window);
    }
    TEST_CASE("sprite_width_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
        auto test_sprite = create_sprite("test_sprite", test_bitmap);
        REQUIRE(1 == sprite_scale(test_sprite));
        sprite_set_scale(test_sprite, 2.0f);
        REQUIRE(2 == sprite_scale(test_sprite));
        free_sprite(test_sprite);
        free_bitmap(test_bitmap);
        close_window(test_window);
    }
    TEST_CASE("sprite_x_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
        auto test_sprite = create_sprite("test_sprite", test_bitmap);
        REQUIRE(0.0 == sprite_x(test_sprite));
        sprite_set_x(test_sprite, 150.0f);
        REQUIRE(150.0 == sprite_x(test_sprite));
        free_sprite(test_sprite);
        free_bitmap(test_bitmap);
        close_window(test_window);
    }
    TEST_CASE("sprite_y_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
        auto test_sprite = create_sprite("test_sprite", test_bitmap);
        REQUIRE(0.0 == sprite_y(test_sprite));
        sprite_set_y(test_sprite, 200.0f);
        REQUIRE(200.0 == sprite_y(test_sprite));
        free_sprite(test_sprite);
        free_bitmap(test_bitmap);
        close_window(test_window);
    }
    TEST_CASE("stop_calling_on_sprite_event_integration") {
        auto helper = helper();
        auto test_window = open_window("Test Window", 800, 600);
        auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
        auto test_sprite = create_sprite("test_sprite", test_bitmap);
        call_on_sprite_event(helper->sprite_event_handler);
        sprite_start_animation(test_sprite, "test");
        update_sprite(test_sprite);
        REQUIRE(helper->event_called);
        stop_calling_on_sprite_event(helper->sprite_event_handler);
        update_sprite(test_sprite);
        REQUIRE_FALSE(helper->event_called);
        free_sprite(test_sprite);
        free_bitmap(test_bitmap);
        close_window(test_window);
    }
    TEST_CASE("update_all_sprites_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
        auto test_sprite1 = create_sprite("test_sprite1", test_bitmap);
        auto test_sprite2 = create_sprite("test_sprite2", test_bitmap);
        sprite_set_velocity(test_sprite1, vector_to(10, 10));
        sprite_set_velocity(test_sprite2, vector_to(-10, -10));
        update_all_sprites();
        REQUIRE(vector_to(10, 10) == sprite_velocity(test_sprite1));
        REQUIRE(vector_to(-10, -10) == sprite_velocity(test_sprite2));
        free_all_sprites();
        free_bitmap(test_bitmap);
        close_window(test_window);
    }
    TEST_CASE("update_all_sprites_percent_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
        auto test_sprite1 = create_sprite("test_sprite1", test_bitmap);
        auto test_sprite2 = create_sprite("test_sprite2", test_bitmap);
        sprite_set_velocity(test_sprite1, vector_to(100.0, 100.0));
        sprite_set_velocity(test_sprite2, vector_to(-100.0, -100.0));
        update_all_sprites(0.5f);
        REQUIRE(50.0 == sprite_x(test_sprite1));
        REQUIRE(50.0 == sprite_y(test_sprite1));
        REQUIRE(-50.0 == sprite_x(test_sprite2));
        REQUIRE(-50.0 == sprite_y(test_sprite2));
        free_all_sprites();
        free_bitmap(test_bitmap);
        close_window(test_window);
    }
    TEST_CASE("update_sprite_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
        auto test_sprite = create_sprite("test_sprite", test_bitmap);
        sprite_set_velocity(test_sprite, vector_to(10.0, 10.0));
        auto initial_pos = sprite_position(test_sprite);
        update_sprite(test_sprite);
        REQUIRE(initial_pos != sprite_position(test_sprite));
        free_sprite(test_sprite);
        free_bitmap(test_bitmap);
        close_window(test_window);
    }
    TEST_CASE("update_sprite_with_sound_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
        auto test_animation = load_animation_script("test_animation", "kermit.txt");
        auto test_sprite = create_sprite(test_bitmap, test_animation);
        sprite_start_animation(test_sprite, "default", true);
        update_sprite(test_sprite, true);
        REQUIRE(sprite_animation_has_ended(test_sprite));
        free_sprite(test_sprite);
        free_bitmap(test_bitmap);
        close_window(test_window);
    }
    TEST_CASE("update_sprite_percent_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
        auto test_sprite = create_sprite("test_sprite", test_bitmap);
        sprite_set_velocity(test_sprite, vector_to(100.0, 100.0));
        update_sprite(test_sprite, 0.5f);
        REQUIRE(50.0 == sprite_x(test_sprite));
        REQUIRE(50.0 == sprite_y(test_sprite));
        free_sprite(test_sprite);
        free_bitmap(test_bitmap);
        close_window(test_window);
    }
    TEST_CASE("update_sprite_percent_with_sound_integration") {
        auto helper = helper();
        auto test_window = open_window("Test Window", 800, 600);
        auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
        auto test_sprite = create_sprite(test_bitmap);
        sprite_set_velocity(test_sprite, vector_to(100.0, 100.0));
        update_sprite(test_sprite, 0.5f, true);
        REQUIRE(50.0 == sprite_x(test_sprite));
        REQUIRE(50.0 == sprite_y(test_sprite));
        REQUIRE(sound_effect_playing("test_sound.wav"));
        update_sprite(test_sprite, 0.5f, false);
        REQUIRE_FALSE(sound_effect_playing("test_sound.wav"));
        free_sprite(test_sprite);
        free_bitmap(test_bitmap);
        close_window(test_window);
    }
    TEST_CASE("update_sprite_animation_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
        auto test_animation = load_animation_script("test_animation", "kermit.txt");
        auto test_sprite = create_sprite("test_sprite", test_bitmap, test_animation);
        sprite_start_animation(test_sprite, "walkfront");
        REQUIRE_FALSE(sprite_animation_has_ended(test_sprite));
        update_sprite_animation(test_sprite);
        REQUIRE(sprite_animation_has_ended(test_sprite));
        free_sprite(test_sprite);
        free_bitmap(test_bitmap);
        close_window(test_window);
    }
    TEST_CASE("update_sprite_animation_with_sound_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
        auto test_sprite = create_sprite("test_sprite", test_bitmap);
        sprite_start_animation(test_sprite, "default");
        update_sprite_animation(test_sprite, true);
        REQUIRE(sprite_animation_has_ended(test_sprite));
        free_sprite(test_sprite);
        free_bitmap(test_bitmap);
        close_window(test_window);
    }
    TEST_CASE("update_sprite_animation_percent_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
        auto test_animation = load_animation_script("test_animation", "kermit.txt");
        auto test_sprite = create_sprite("test_sprite", test_bitmap, test_animation);
        sprite_start_animation(test_sprite, "walkfront");
        REQUIRE_FALSE(sprite_animation_has_ended(test_sprite));
        update_sprite_animation(test_sprite, 100f);
        REQUIRE(sprite_animation_has_ended(test_sprite));
        free_sprite(test_sprite);
        free_bitmap(test_bitmap);
        close_window(test_window);
    }
    TEST_CASE("update_sprite_animation_percent_with_sound_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
        auto test_animation = load_animation_script("test_animation", "kermit.txt");
        auto test_sprite = create_sprite("test_sprite", test_bitmap, test_animation);
        sprite_start_animation(test_sprite, "walkfront");
        REQUIRE_FALSE(sprite_animation_has_ended(test_sprite));
        update_sprite_animation(test_sprite, 100f, true);
        REQUIRE(sprite_animation_has_ended(test_sprite));
        free_sprite(test_sprite);
        free_bitmap(test_bitmap);
        close_window(test_window);
    }
    TEST_CASE("vector_from_center_sprite_to_point_point_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
        auto test_sprite = create_sprite("test_sprite", test_bitmap);
        sprite_set_position(test_sprite, point_at(0, 0));
        auto center_point = point_at(50, 50);
        auto target_point = point_at(150, 150);
        auto vector = vector_from_center_sprite_to_point(test_sprite, target_point);
        REQUIRE(100 == vector->X);
        REQUIRE(100 == vector->Y);
        free_sprite(test_sprite);
        free_bitmap(test_bitmap);
        close_window(test_window);
    }
    TEST_CASE("vector_from_to_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
        auto sprite1 = create_sprite("sprite1", test_bitmap);
        auto sprite2 = create_sprite("sprite2", test_bitmap);
        sprite_set_position(sprite1, point_at(0, 0));
        sprite_set_position(sprite2, point_at(100, 100));
        auto vector = vector_from_to(sprite1, sprite2);
        REQUIRE(100 == vector->X);
        REQUIRE(100 == vector->Y);
        free_sprite(sprite1);
        free_sprite(sprite2);
        free_bitmap(test_bitmap);
        close_window(test_window);
    }
};
