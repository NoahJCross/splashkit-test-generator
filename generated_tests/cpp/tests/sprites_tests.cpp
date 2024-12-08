#include "splashkit.h"
#include <catch2/catch.hpp>

TEST_CASE("call_for_all_sprites_with_value_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
    auto test_sprite1 = create_sprite(test_bitmap);
    auto test_sprite2 = create_sprite(test_bitmap);
    sprite_set_x(test_sprite1, 100);
    sprite_set_x(test_sprite2, 200);
    call_for_all_sprites(sprite_set_x(test_sprite1, 300), 300);
    REQUIRE(300 == sprite_x(test_sprite1));
    REQUIRE(300 == sprite_x(test_sprite2));
    free_all_sprites();
    free_bitmap(test_bitmap);
    close_window(test_window);
}
TEST_CASE("call_for_all_sprites_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
    auto test_sprite_1 = create_sprite(test_bitmap);
    auto test_sprite_2 = create_sprite(test_bitmap);
    sprite_set_x(test_sprite_1, 100);
    sprite_set_y(test_sprite_1, 100);
    sprite_set_x(test_sprite_2, 200);
    sprite_set_y(test_sprite_2, 200);
    call_for_all_sprites(_test_sprite_function());
    REQUIRE(sprite_at(test_sprite_1, point_at(100, 100)));
    REQUIRE(sprite_at(test_sprite_2, point_at(200, 200)));
    free_all_sprites();
    free_bitmap(test_bitmap);
    close_window(test_window);
}
TEST_CASE("call_on_sprite_event_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
    auto test_sprite = create_sprite(test_bitmap);
    call_on_sprite_event(_on_sprite_event());
    process_events();
    simulate_mouse_click(MouseButton::LEFT);
    process_events();
    REQUIRE(mouse_clicked(MouseButton::LEFT));
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
TEST_CASE("center_point_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
    auto test_sprite = create_sprite(test_bitmap);
    sprite_set_position(test_sprite, point_at(100, 100));
    auto test_center_point = center_point(test_sprite);
    REQUIRE(150 == test_center_point->x);
    REQUIRE(150 == test_center_point->y);
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
TEST_CASE("create_sprite_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
    auto test_sprite = create_sprite(test_bitmap);
    REQUIRE(test_sprite != nullptr);
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
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
TEST_CASE("create_sprite_named_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
    auto test_sprite = create_sprite("test_sprite", test_bitmap);
    REQUIRE(test_sprite != nullptr);
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
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    free_animation_script(test_animation);
    close_window(test_window);
}
TEST_CASE("create_sprite_with_bitmap_and_animation_named_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
    auto test_sprite = create_sprite("test_bitmap", "test_animation");
    REQUIRE(test_sprite != nullptr);
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
TEST_CASE("create_sprite_pack_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    create_sprite_pack("test_pack");
    REQUIRE(has_sprite_pack("test_pack"));
    free_sprite_pack("test_pack");
    close_window(test_window);
}
TEST_CASE("current_sprite_pack_integration") {
    create_sprite_pack("test_pack");
    select_sprite_pack("test_pack");
    auto current_pack = current_sprite_pack();
    REQUIRE("test_pack" == current_pack);
    free_sprite_pack("test_pack");
}
TEST_CASE("draw_all_sprites_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
    auto test_sprite1 = create_sprite(test_bitmap);
    auto test_sprite2 = create_sprite(test_bitmap);
    sprite_set_x(test_sprite1, 100);
    sprite_set_y(test_sprite1, 100);
    sprite_set_x(test_sprite2, 200);
    sprite_set_y(test_sprite2, 200);
    draw_all_sprites();
    refresh_screen();
    REQUIRE(color_white() != get_pixel(100, 100));
    REQUIRE(color_white() != get_pixel(200, 200));
    free_all_sprites();
    free_bitmap(test_bitmap);
    close_window(test_window);
}
TEST_CASE("draw_sprite_offset_by_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
    auto test_sprite = create_sprite(test_bitmap);
    sprite_set_position(test_sprite, point_at(400, 300));
    draw_sprite(test_sprite, vector_to(50, 50));
    refresh_screen();
    REQUIRE(color_white() != get_pixel(point_at(450, 350)));
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
TEST_CASE("draw_sprite_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
    auto test_sprite = create_sprite(test_bitmap);
    sprite_set_position(test_sprite, point_at(400, 300));
    draw_sprite(test_sprite);
    refresh_screen();
    REQUIRE(sprite_on_screen_at(test_sprite, point_at(400, 300)));
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
TEST_CASE("draw_sprite_offset_x_y_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
    auto test_sprite = create_sprite(test_bitmap);
    sprite_set_position(test_sprite, point_at(400, 300));
    draw_sprite(test_sprite, 50, 50);
    refresh_screen();
    REQUIRE(point_in_circle(point_at(450, 350), sprite_collision_circle(test_sprite)));
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
TEST_CASE("free_all_sprites_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
    auto test_sprite = create_sprite(test_bitmap);
    free_all_sprites();
    REQUIRE_FALSE(has_sprite("test_sprite"));
    free_bitmap(test_bitmap);
    close_window(test_window);
}
TEST_CASE("free_sprite_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
    auto test_sprite = create_sprite(test_bitmap);
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
TEST_CASE("free_sprite_pack_integration") {
    create_sprite_pack("test_pack");
    auto test_has_pack = has_sprite_pack("test_pack");
    REQUIRE(test_has_pack);
    free_sprite_pack("test_pack");
    auto test_has_pack = has_sprite_pack("test_pack");
    REQUIRE_FALSE(test_has_pack);
}
TEST_CASE("has_sprite_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
    auto test_sprite = create_sprite(test_bitmap);
    REQUIRE(has_sprite("test_sprite"));
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
TEST_CASE("has_sprite_pack_integration") {
    create_sprite_pack("test_pack");
    REQUIRE(has_sprite_pack("test_pack"));
    REQUIRE_FALSE(has_sprite_pack("non_existent_pack"));
    free_sprite_pack("test_pack");
}
TEST_CASE("move_sprite_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
    auto test_sprite = create_sprite(test_bitmap);
    sprite_set_velocity(test_sprite, vector_to(10.0, 10.0));
    sprite_set_position(test_sprite, point_at(100.0, 100.0));
    move_sprite(test_sprite);
    process_events();
    REQUIRE(point_at(100.0, 100.0) != sprite_position(test_sprite));
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
TEST_CASE("move_sprite_by_vector_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
    auto test_sprite = create_sprite(test_bitmap);
    sprite_set_position(test_sprite, point_at(100, 100));
    move_sprite(test_sprite, vector_to(50, 50));
    process_events();
    REQUIRE(150 == sprite_x(test_sprite));
    REQUIRE(150 == sprite_y(test_sprite));
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
TEST_CASE("move_sprite_by_vector_percent_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
    auto test_sprite = create_sprite(test_bitmap);
    sprite_set_position(test_sprite, point_at(100.0, 100.0));
    move_sprite(test_sprite, vector_to(50.0, 50.0), 0.5);
    REQUIRE(125.0 == sprite_x(test_sprite));
    REQUIRE(125.0 == sprite_y(test_sprite));
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
TEST_CASE("move_sprite_percent_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
    auto test_sprite = create_sprite(test_bitmap);
    sprite_set_position(test_sprite, point_at(100.0, 100.0));
    sprite_set_velocity(test_sprite, vector_to(10.0, 10.0));
    move_sprite(test_sprite, 0.5);
    process_events();
    REQUIRE(point_in_circle(point_at(105.0, 105.0), sprite_circle(test_sprite)));
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
TEST_CASE("move_sprite_to_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
    auto test_sprite = create_sprite(test_bitmap);
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
    auto test_sprite = create_sprite("rocket_sprt.png");
    select_sprite_pack("test_pack");
    draw_all_sprites();
    REQUIRE(sprite_on_screen_at(test_sprite, point_at(400, 300)));
    free_all_sprites();
    free_sprite_pack("test_pack");
    close_window(test_window);
}
TEST_CASE("sprite_add_layer_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
    auto test_sprite = create_sprite(test_bitmap);
    auto new_layer_bitmap = create_bitmap("new_layer_bitmap", 50, 50);
    auto layer_index = sprite_add_layer(test_sprite, new_layer_bitmap, "new_layer");
    REQUIRE(layer_index > -1);
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    free_bitmap(new_layer_bitmap);
    close_window(test_window);
}
TEST_CASE("sprite_add_to_velocity_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
    auto test_sprite = create_sprite(test_bitmap);
    sprite_set_position(test_sprite, point_at(400, 300));
    sprite_add_to_velocity(test_sprite, vector_to(10, 10));
    update_sprite(test_sprite);
    REQUIRE(410 == sprite_x(test_sprite));
    REQUIRE(310 == sprite_y(test_sprite));
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
TEST_CASE("sprite_add_value_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
    auto test_sprite = create_sprite(test_bitmap);
    sprite_add_value(test_sprite, "health");
    REQUIRE(sprite_has_value(test_sprite, "health"));
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
TEST_CASE("sprite_add_value_with_default_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
    auto test_sprite = create_sprite(test_bitmap);
    sprite_add_value(test_sprite, "health", 100.0);
    REQUIRE(sprite_has_value(test_sprite, "health"));
    REQUIRE(100.0 == sprite_value(test_sprite, "health"));
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
TEST_CASE("sprite_anchor_point_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
    auto test_sprite = create_sprite(test_bitmap);
    auto test_anchor_point = sprite_anchor_point(test_sprite);
    REQUIRE(50 == test_anchor_point->x);
    REQUIRE(50 == test_anchor_point->y);
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
TEST_CASE("sprite_anchor_position_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
    auto test_sprite = create_sprite(test_bitmap);
    sprite_set_position(test_sprite, point_at(100, 100));
    auto test_anchor_position = sprite_anchor_position(test_sprite);
    REQUIRE(100 == test_anchor_position->x);
    REQUIRE(100 == test_anchor_position->y);
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
TEST_CASE("sprite_animation_has_ended_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
    auto test_sprite = create_sprite(test_bitmap);
    sprite_start_animation(test_sprite, "default");
    update_sprite_animation(test_sprite);
    REQUIRE_FALSE(sprite_animation_has_ended(test_sprite));
    update_sprite_animation(test_sprite);
    REQUIRE(sprite_animation_has_ended(test_sprite));
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
TEST_CASE("sprite_animation_name_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
    auto test_sprite = create_sprite(test_bitmap);
    sprite_start_animation(test_sprite, "default");
    auto test_animation_name = sprite_animation_name(test_sprite);
    REQUIRE("default" == test_animation_name);
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
TEST_CASE("sprite_at_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
    auto test_sprite = create_sprite(test_bitmap);
    sprite_set_position(test_sprite, point_at(400, 300));
    process_events();
    REQUIRE(sprite_at(test_sprite, point_at(400, 300)));
    REQUIRE_FALSE(sprite_at(test_sprite, point_at(500, 400)));
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
TEST_CASE("sprite_bring_layer_forward_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
    auto test_sprite = create_sprite(test_bitmap);
    auto layer_index = sprite_add_layer(test_sprite, test_bitmap, "layer2");
    auto initial_layer_position = sprite_visible_index_of_layer(test_sprite, layer_index);
    sprite_bring_layer_forward(test_sprite, layer_index);
    auto new_layer_position = sprite_visible_index_of_layer(test_sprite, layer_index);
    REQUIRE(new_layer_position > initial_layer_position);
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
TEST_CASE("sprite_bring_layer_to_front_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
    auto test_sprite = create_sprite(test_bitmap);
    auto layer_index = sprite_add_layer(test_sprite, test_bitmap, "layer2");
    sprite_bring_layer_to_front(test_sprite, layer_index);
    REQUIRE(sprite_visible_layer_count(test_sprite) == sprite_visible_index_of_layer(test_sprite, layer_index));
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
TEST_CASE("sprite_call_on_event_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
    auto test_sprite = create_sprite(test_bitmap);
    sprite_call_on_event(test_sprite, _on_sprite_event());
    process_events();
    simulate_mouse_click(MouseButton::LEFT);
    process_events();
    REQUIRE(sprite_event_occurred(test_sprite));
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
TEST_CASE("sprite_circle_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
    auto test_sprite = create_sprite(test_bitmap);
    auto test_circle = sprite_circle(test_sprite);
    REQUIRE(point_in_circle(point_at(50, 50), test_circle));
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
TEST_CASE("sprite_collision_bitmap_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
    auto test_sprite = create_sprite(test_bitmap);
    auto collision_bitmap = sprite_collision_bitmap(test_sprite);
    REQUIRE(100 == bitmap_width(collision_bitmap));
    REQUIRE(100 == bitmap_height(collision_bitmap));
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
TEST_CASE("sprite_collision_circle_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
    auto test_sprite = create_sprite(test_bitmap);
    auto test_circle = sprite_collision_circle(test_sprite);
    REQUIRE(point_in_circle(point_at(50, 50), test_circle));
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
TEST_CASE("sprite_collision_kind_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
    auto test_sprite = create_sprite(test_bitmap);
    sprite_set_collision_kind(test_sprite, CollisionTestKind::PIXEL_COLLISIONS);
    REQUIRE(CollisionTestKind::PIXEL_COLLISIONS == sprite_collision_kind(test_sprite));
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
TEST_CASE("sprite_collision_rectangle_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
    auto test_sprite = create_sprite(test_bitmap);
    auto test_rectangle = sprite_collision_rectangle(test_sprite);
    REQUIRE(100 == test_rectangle->width);
    REQUIRE(100 == test_rectangle->height);
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
TEST_CASE("sprite_current_cell_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
    auto test_sprite = create_sprite(test_bitmap);
    sprite_start_animation(test_sprite, 0);
    update_sprite(test_sprite);
    REQUIRE(0 == sprite_current_cell(test_sprite));
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
TEST_CASE("sprite_current_cell_rectangle_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
    auto test_sprite = create_sprite(test_bitmap);
    auto test_rectangle = sprite_current_cell_rectangle(test_sprite);
    REQUIRE(0 == rectangle_left(test_rectangle));
    REQUIRE(0 == rectangle_top(test_rectangle));
    REQUIRE(bitmap_width(test_bitmap) == rectangle_right(test_rectangle));
    REQUIRE(bitmap_height(test_bitmap) == rectangle_bottom(test_rectangle));
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
TEST_CASE("sprite_dx_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
    auto test_sprite = create_sprite(test_bitmap);
    sprite_set_dx(test_sprite, 5.0);
    REQUIRE(5.0 == sprite_dx(test_sprite));
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
TEST_CASE("sprite_dy_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
    auto test_sprite = create_sprite(test_bitmap);
    sprite_set_dy(test_sprite, 5.0);
    REQUIRE(5.0 == sprite_dy(test_sprite));
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
TEST_CASE("sprite_has_value_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
    auto test_sprite = create_sprite(test_bitmap);
    sprite_add_value(test_sprite, "health");
    REQUIRE(sprite_has_value(test_sprite, "health"));
    REQUIRE_FALSE(sprite_has_value(test_sprite, "mana"));
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
TEST_CASE("sprite_heading_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
    auto test_sprite = create_sprite(test_bitmap);
    sprite_set_velocity(test_sprite, vector_to(1.0, 1.0));
    auto test_heading = sprite_heading(test_sprite);
    REQUIRE(test_heading >= 45.0 && test_heading <= 45.01);
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
TEST_CASE("sprite_height_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
    auto test_sprite = create_sprite(test_bitmap);
    REQUIRE(100 == sprite_height(test_sprite));
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
TEST_CASE("sprite_hide_layer_named_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
    auto test_sprite = create_sprite(test_bitmap);
    auto layer_index = sprite_add_layer(test_sprite, test_bitmap, "layer2");
    sprite_hide_layer(test_sprite, "layer2");
    REQUIRE_FALSE(sprite_layer_visible(test_sprite, layer_index));
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
TEST_CASE("sprite_hide_layer_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
    auto test_sprite = create_sprite(test_bitmap);
    auto layer_index = sprite_add_layer(test_sprite, test_bitmap, "layer2");
    sprite_show_layer(test_sprite, layer_index);
    sprite_hide_layer(test_sprite, layer_index);
    REQUIRE_FALSE(sprite_layer_visible(test_sprite, layer_index));
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
TEST_CASE("sprite_layer_named_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
    auto test_sprite = create_sprite(test_bitmap);
    sprite_add_layer(test_sprite, test_bitmap, "layer2");
    auto test_layer_bitmap = sprite_layer(test_sprite, "layer2");
    REQUIRE(test_layer_bitmap != nullptr);
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
TEST_CASE("sprite_layer_at_index_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
    auto test_sprite = create_sprite(test_bitmap);
    auto layer_index = sprite_add_layer(test_sprite, test_bitmap, "layer2");
    auto test_layer_bitmap = sprite_layer(test_sprite, layer_index);
    REQUIRE(test_layer_bitmap != nullptr);
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
TEST_CASE("sprite_layer_circle_named_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
    auto test_sprite = create_sprite(test_bitmap);
    auto test_circle = sprite_layer_circle(test_sprite, "layer1");
    REQUIRE(point_in_circle(point_at(50, 50), test_circle));
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
TEST_CASE("sprite_layer_circle_at_index_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
    auto test_sprite = create_sprite(test_bitmap);
    auto test_circle = sprite_layer_circle(test_sprite, 0);
    REQUIRE(point_in_circle(point_at(50, 50), test_circle));
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
TEST_CASE("sprite_layer_count_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
    auto test_sprite = create_sprite(test_bitmap);
    REQUIRE(1 == sprite_layer_count(test_sprite));
    sprite_add_layer(test_sprite, test_bitmap, "layer2");
    REQUIRE(2 == sprite_layer_count(test_sprite));
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
TEST_CASE("sprite_layer_height_named_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
    auto test_sprite = create_sprite(test_bitmap);
    sprite_add_layer(test_sprite, test_bitmap, "layer2");
    REQUIRE(100 == sprite_layer_height(test_sprite, "layer2"));
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
TEST_CASE("sprite_layer_height_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
    auto test_sprite = create_sprite(test_bitmap);
    auto layer_height = sprite_layer_height(test_sprite, 0);
    REQUIRE(100 == layer_height);
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
TEST_CASE("sprite_layer_index_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
    auto test_sprite = create_sprite(test_bitmap);
    auto layer_index = sprite_add_layer(test_sprite, test_bitmap, "layer2");
    REQUIRE(layer_index == sprite_layer_index(test_sprite, "layer2"));
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
TEST_CASE("sprite_layer_name_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
    auto test_sprite = create_sprite(test_bitmap);
    auto layer_index = sprite_add_layer(test_sprite, test_bitmap, "layer2");
    REQUIRE("layer2" == sprite_layer_name(test_sprite, layer_index));
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
TEST_CASE("sprite_layer_offset_named_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
    auto test_sprite = create_sprite(test_bitmap);
    sprite_set_layer_offset(test_sprite, "layer1", vector_to(10, 10));
    auto layer_offset = sprite_layer_offset(test_sprite, "layer1");
    REQUIRE(10 == layer_offset->x);
    REQUIRE(10 == layer_offset->y);
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
TEST_CASE("sprite_layer_offset_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
    auto test_sprite = create_sprite(test_bitmap);
    auto layer_index = sprite_add_layer(test_sprite, test_bitmap, "layer2");
    sprite_set_layer_offset(test_sprite, layer_index, vector_to(10, 10));
    REQUIRE(vector_to(10, 10) == sprite_layer_offset(test_sprite, layer_index));
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
TEST_CASE("sprite_layer_rectangle_named_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
    auto test_sprite = create_sprite(test_bitmap);
    auto test_rectangle = sprite_layer_rectangle(test_sprite, "layer1");
    REQUIRE(0 == rectangle_left(test_rectangle));
    REQUIRE(0 == rectangle_top(test_rectangle));
    REQUIRE(100 == rectangle_right(test_rectangle));
    REQUIRE(100 == rectangle_bottom(test_rectangle));
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
TEST_CASE("sprite_layer_rectangle_at_index_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
    auto test_sprite = create_sprite(test_bitmap);
    auto test_rectangle = sprite_layer_rectangle(test_sprite, 0);
    REQUIRE(bitmap_width(test_bitmap) == test_rectangle->width);
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
TEST_CASE("sprite_layer_width_named_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
    auto test_sprite = create_sprite(test_bitmap);
    sprite_add_layer(test_sprite, test_bitmap, "layer2");
    REQUIRE(100 == sprite_layer_width(test_sprite, "layer2"));
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
TEST_CASE("sprite_layer_width_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
    auto test_sprite = create_sprite(test_bitmap);
    REQUIRE(100 == sprite_layer_width(test_sprite, 0));
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
TEST_CASE("sprite_location_matrix_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
    auto test_sprite = create_sprite(test_bitmap);
    sprite_set_position(test_sprite, point_at(100.0, 100.0));
    sprite_set_rotation(test_sprite, 45.0);
    auto test_matrix = sprite_location_matrix(test_sprite);
    auto test_point = point_at(50.0, 50.0);
    auto result_point = matrix_multiply(test_matrix, test_point);
    REQUIRE(result_point->x >= 149.0 && result_point->x <= 150.0);
    REQUIRE(result_point->y >= 149.0 && result_point->y <= 150.0);
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
TEST_CASE("sprite_mass_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
    auto test_sprite = create_sprite(test_bitmap);
    sprite_set_mass(test_sprite, 10.0);
    REQUIRE(10.0 == sprite_mass(test_sprite));
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
TEST_CASE("sprite_move_from_anchor_point_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
    auto test_sprite = create_sprite(test_bitmap);
    sprite_set_move_from_anchor_point(test_sprite, true);
    REQUIRE(sprite_move_from_anchor_point(test_sprite));
    sprite_set_move_from_anchor_point(test_sprite, false);
    REQUIRE_FALSE(sprite_move_from_anchor_point(test_sprite));
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
TEST_CASE("sprite_move_to_taking_seconds_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
    auto test_sprite = create_sprite(test_bitmap);
    sprite_set_position(test_sprite, point_at(100, 100));
    sprite_move_to(test_sprite, point_at(400, 300), 2.0);
    process_events();
    REQUIRE(point_in_circle(point_at(400, 300), sprite_collision_circle(test_sprite)));
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
TEST_CASE("sprite_name_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
    auto test_sprite = create_sprite(test_bitmap);
    REQUIRE("test_sprite" == sprite_name(test_sprite));
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
TEST_CASE("sprite_named_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
    auto test_sprite = create_sprite(test_bitmap);
    auto named_sprite = sprite_named("test_sprite");
    REQUIRE(named_sprite != nullptr);
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
TEST_CASE("sprite_offscreen_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
    auto test_sprite = create_sprite(test_bitmap);
    sprite_set_position(test_sprite, point_at(0, 0));
    REQUIRE_FALSE(sprite_offscreen(test_sprite));
    sprite_set_position(test_sprite, point_at(-100, -100));
    REQUIRE(sprite_offscreen(test_sprite));
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
TEST_CASE("sprite_on_screen_at_point_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
    auto test_sprite = create_sprite(test_bitmap);
    sprite_set_position(test_sprite, point_at(100, 100));
    draw_sprite(test_sprite);
    refresh_screen();
    REQUIRE(sprite_on_screen_at(test_sprite, point_at(100, 100)));
    REQUIRE_FALSE(sprite_on_screen_at(test_sprite, point_at(1000, 1000)));
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
TEST_CASE("sprite_on_screen_at_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
    auto test_sprite = create_sprite(test_bitmap);
    sprite_set_position(test_sprite, point_at(100, 100));
    REQUIRE(sprite_on_screen_at(test_sprite, 100, 100));
    REQUIRE_FALSE(sprite_on_screen_at(test_sprite, 1000, 1000));
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
TEST_CASE("sprite_position_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
    auto test_sprite = create_sprite(test_bitmap);
    sprite_set_position(test_sprite, point_at(100.0, 100.0));
    auto test_position = sprite_position(test_sprite);
    REQUIRE(100.0 == test_position->x);
    REQUIRE(100.0 == test_position->y);
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
TEST_CASE("sprite_replay_animation_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
    auto test_sprite = create_sprite(test_bitmap);
    sprite_start_animation(test_sprite, 0);
    sprite_replay_animation(test_sprite);
    REQUIRE(sprite_animation_has_ended(test_sprite));
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
TEST_CASE("sprite_replay_animation_with_sound_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
    auto test_sprite = create_sprite(test_bitmap);
    sprite_replay_animation(test_sprite, true);
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
TEST_CASE("sprite_rotation_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
    auto test_sprite = create_sprite(test_bitmap);
    sprite_set_rotation(test_sprite, 45.0);
    REQUIRE(45.0 == sprite_rotation(test_sprite));
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
TEST_CASE("sprite_scale_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
    auto test_sprite = create_sprite(test_bitmap);
    sprite_set_scale(test_sprite, 2.0);
    REQUIRE(2.0 == sprite_scale(test_sprite));
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
TEST_CASE("sprite_screen_rectangle_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
    auto test_sprite = create_sprite(test_bitmap);
    sprite_set_position(test_sprite, point_at(100, 100));
    auto test_rectangle = sprite_screen_rectangle(test_sprite);
    REQUIRE(100 == rectangle_left(test_rectangle));
    REQUIRE(100 == rectangle_top(test_rectangle));
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
TEST_CASE("sprite_send_layer_backward_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
    auto test_sprite = create_sprite(test_bitmap);
    auto layer_index = sprite_add_layer(test_sprite, test_bitmap, "layer2");
    sprite_send_layer_backward(test_sprite, layer_index);
    REQUIRE(sprite_visible_index_of_layer(test_sprite, layer_index) < 1);
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
TEST_CASE("sprite_send_layer_to_back_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
    auto test_sprite = create_sprite(test_bitmap);
    auto layer_index = sprite_add_layer(test_sprite, test_bitmap, "layer2");
    sprite_send_layer_to_back(test_sprite, layer_index);
    REQUIRE(0 == sprite_visible_index_of_layer(test_sprite, layer_index));
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
TEST_CASE("sprite_set_anchor_point_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
    auto test_sprite = create_sprite(test_bitmap);
    sprite_set_anchor_point(test_sprite, point_at(50, 50));
    auto test_anchor_point = sprite_anchor_point(test_sprite);
    REQUIRE(50 == test_anchor_point->x);
    REQUIRE(50 == test_anchor_point->y);
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
TEST_CASE("sprite_set_collision_bitmap_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
    auto test_sprite = create_sprite(test_bitmap);
    sprite_set_collision_bitmap(test_sprite, test_bitmap);
    REQUIRE(test_bitmap == sprite_collision_bitmap(test_sprite));
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
TEST_CASE("sprite_set_collision_kind_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
    auto test_sprite = create_sprite(test_bitmap);
    sprite_set_collision_kind(test_sprite, CollisionTestKind::PIXEL_COLLISIONS);
    REQUIRE(CollisionTestKind::PIXEL_COLLISIONS == sprite_collision_kind(test_sprite));
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
TEST_CASE("sprite_set_dx_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
    auto test_sprite = create_sprite(test_bitmap);
    sprite_set_dx(test_sprite, 5.0);
    REQUIRE(5.0 == sprite_dx(test_sprite));
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
TEST_CASE("sprite_set_dy_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
    auto test_sprite = create_sprite(test_bitmap);
    sprite_set_dy(test_sprite, 5.0);
    REQUIRE(5.0 == sprite_dy(test_sprite));
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
TEST_CASE("sprite_set_heading_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
    auto test_sprite = create_sprite(test_bitmap);
    sprite_set_heading(test_sprite, 45.0);
    REQUIRE(45.0 == sprite_heading(test_sprite));
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
TEST_CASE("sprite_set_layer_offset_named_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
    auto test_sprite = create_sprite(test_bitmap);
    sprite_set_layer_offset(test_sprite, "layer1", vector_to(10.0, 10.0));
    auto test_offset = sprite_layer_offset(test_sprite, "layer1");
    REQUIRE(10.0 == test_offset->x);
    REQUIRE(10.0 == test_offset->y);
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
TEST_CASE("sprite_set_layer_offset_at_index_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
    auto test_sprite = create_sprite(test_bitmap);
    sprite_set_layer_offset(test_sprite, 0, vector_to(10.0, 10.0));
    REQUIRE(vector_to(10.0, 10.0) == sprite_layer_offset(test_sprite, 0));
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
TEST_CASE("sprite_set_mass_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
    auto test_sprite = create_sprite(test_bitmap);
    sprite_set_mass(test_sprite, 10.0);
    REQUIRE(10.0 == sprite_mass(test_sprite));
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
TEST_CASE("sprite_set_move_from_anchor_point_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
    auto test_sprite = create_sprite(test_bitmap);
    sprite_set_move_from_anchor_point(test_sprite, true);
    REQUIRE(sprite_move_from_anchor_point(test_sprite));
    sprite_set_move_from_anchor_point(test_sprite, false);
    REQUIRE_FALSE(sprite_move_from_anchor_point(test_sprite));
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
TEST_CASE("sprite_set_position_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
    auto test_sprite = create_sprite(test_bitmap);
    sprite_set_position(test_sprite, point_at(100, 100));
    REQUIRE(100 == sprite_x(test_sprite));
    REQUIRE(100 == sprite_y(test_sprite));
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
TEST_CASE("sprite_set_rotation_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
    auto test_sprite = create_sprite(test_bitmap);
    sprite_set_rotation(test_sprite, 45.0);
    REQUIRE(45.0 == sprite_rotation(test_sprite));
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
TEST_CASE("sprite_set_scale_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
    auto test_sprite = create_sprite(test_bitmap);
    sprite_set_scale(test_sprite, 2.0);
    REQUIRE(2.0 == sprite_scale(test_sprite));
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
TEST_CASE("sprite_set_speed_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
    auto test_sprite = create_sprite(test_bitmap);
    sprite_set_speed(test_sprite, 5.0);
    REQUIRE(5.0 == sprite_speed(test_sprite));
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
TEST_CASE("sprite_set_value_named_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
    auto test_sprite = create_sprite(test_bitmap);
    sprite_add_value(test_sprite, "test_value");
    sprite_set_value(test_sprite, "test_value", 10.5);
    REQUIRE(10.5 == sprite_value(test_sprite, "test_value"));
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
TEST_CASE("sprite_set_velocity_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
    auto test_sprite = create_sprite(test_bitmap);
    sprite_set_velocity(test_sprite, vector_to(5.0, 5.0));
    update_sprite(test_sprite);
    REQUIRE(sprite_at(test_sprite, point_at(5.0, 5.0)));
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
TEST_CASE("sprite_set_x_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
    auto test_sprite = create_sprite(test_bitmap);
    sprite_set_x(test_sprite, 150.0);
    REQUIRE(150.0 == sprite_x(test_sprite));
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
TEST_CASE("sprite_set_y_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
    auto test_sprite = create_sprite(test_bitmap);
    sprite_set_y(test_sprite, 300.0);
    REQUIRE(300.0 == sprite_y(test_sprite));
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
TEST_CASE("sprite_show_layer_named_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
    auto test_sprite = create_sprite(test_bitmap);
    auto layer_index = sprite_add_layer(test_sprite, test_bitmap, "layer2");
    auto result = sprite_show_layer(test_sprite, "layer2");
    REQUIRE(1 == result);
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
TEST_CASE("sprite_show_layer_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
    auto test_sprite = create_sprite(test_bitmap);
    auto layer_index = sprite_add_layer(test_sprite, test_bitmap, "layer2");
    sprite_hide_layer(test_sprite, 1);
    auto result = sprite_show_layer(test_sprite, 1);
    REQUIRE(1 == result);
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
TEST_CASE("sprite_speed_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
    auto test_sprite = create_sprite(test_bitmap);
    sprite_set_velocity(test_sprite, vector_to(5.0, 5.0));
    auto test_speed = sprite_speed(test_sprite);
    REQUIRE(7.0710678118654755 == test_speed);
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
TEST_CASE("sprite_start_animation_named_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
    auto test_sprite = create_sprite(test_bitmap);
    sprite_start_animation(test_sprite, "test_animation");
    REQUIRE(sprite_animation_name(test_sprite));
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
TEST_CASE("sprite_start_animation_named_with_sound_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
    auto test_sprite = create_sprite(test_bitmap);
    sprite_start_animation(test_sprite, "test_animation", true);
    update_sprite(test_sprite);
    REQUIRE(sprite_animation_has_ended(test_sprite));
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
TEST_CASE("sprite_start_animation_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
    auto test_sprite = create_sprite(test_bitmap);
    sprite_start_animation(test_sprite, 0);
    update_sprite(test_sprite);
    REQUIRE(sprite_animation_has_ended(test_sprite));
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
TEST_CASE("sprite_start_animation_with_sound_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
    auto test_sprite = create_sprite(test_bitmap);
    sprite_start_animation(test_sprite, 0, true);
    update_sprite(test_sprite);
    REQUIRE(sprite_animation_has_ended(test_sprite));
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
TEST_CASE("sprite_stop_calling_on_event_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
    auto test_sprite = create_sprite(test_bitmap);
    sprite_call_on_event(test_sprite, _on_sprite_event());
    process_events();
    simulate_sprite_event(test_sprite);
    process_events();
    REQUIRE(_on_sprite_event_called());
    sprite_stop_calling_on_event(test_sprite, _on_sprite_event());
    process_events();
    simulate_sprite_event(test_sprite);
    process_events();
    REQUIRE_FALSE(_on_sprite_event_called());
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
TEST_CASE("sprite_toggle_layer_visible_named_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
    auto test_sprite = create_sprite(test_bitmap);
    sprite_add_layer(test_sprite, test_bitmap, "layer2");
    sprite_toggle_layer_visible(test_sprite, "layer2");
    REQUIRE_FALSE(sprite_visible_layer_count(test_sprite));
    sprite_toggle_layer_visible(test_sprite, "layer2");
    REQUIRE(2 == sprite_visible_layer_count(test_sprite));
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
TEST_CASE("sprite_toggle_layer_visible_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
    auto test_sprite = create_sprite(test_bitmap);
    auto layer_index = sprite_add_layer(test_sprite, test_bitmap, "layer2");
    sprite_hide_layer(test_sprite, layer_index);
    sprite_toggle_layer_visible(test_sprite, layer_index);
    REQUIRE(sprite_visible_layer_count(test_sprite));
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
TEST_CASE("sprite_value_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
    auto test_sprite = create_sprite(test_bitmap);
    sprite_add_value(test_sprite, "test_value", 10.0);
    auto sprite_value_result = sprite_value(test_sprite, "test_value");
    REQUIRE(10.0 == sprite_value_result);
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
TEST_CASE("sprite_value_count_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
    auto test_sprite = create_sprite(test_bitmap);
    sprite_add_value(test_sprite, "health");
    sprite_add_value(test_sprite, "speed");
    REQUIRE(2 == sprite_value_count(test_sprite));
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
TEST_CASE("sprite_velocity_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
    auto test_sprite = create_sprite(test_bitmap);
    sprite_set_velocity(test_sprite, vector_to(5.0, 5.0));
    auto test_velocity = sprite_velocity(test_sprite);
    REQUIRE(5.0 == test_velocity->x);
    REQUIRE(5.0 == test_velocity->y);
    free_all_sprites();
    free_bitmap(test_bitmap);
    close_window(test_window);
}
TEST_CASE("sprite_visible_index_of_layer_named_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
    auto test_sprite = create_sprite(test_bitmap);
    sprite_add_layer(test_sprite, test_bitmap, "layer2");
    auto layer_index = sprite_visible_index_of_layer(test_sprite, "layer2");
    REQUIRE(1 == layer_index);
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
TEST_CASE("sprite_visible_index_of_layer_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
    auto test_sprite = create_sprite(test_bitmap);
    auto layer_index = sprite_add_layer(test_sprite, test_bitmap, "layer2");
    sprite_show_layer(test_sprite, layer_index);
    REQUIRE(1 == sprite_visible_index_of_layer(test_sprite, layer_index));
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
TEST_CASE("sprite_visible_layer_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
    auto test_sprite = create_sprite(test_bitmap);
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
    auto test_sprite = create_sprite(test_bitmap);
    REQUIRE(1 == sprite_visible_layer_count(test_sprite));
    sprite_add_layer(test_sprite, test_bitmap, "layer2");
    sprite_show_layer(test_sprite, "layer2");
    REQUIRE(2 == sprite_visible_layer_count(test_sprite));
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
TEST_CASE("sprite_visible_layer_id_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
    auto test_sprite = create_sprite(test_bitmap);
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
    auto test_sprite = create_sprite(test_bitmap);
    REQUIRE(100 == sprite_width(test_sprite));
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
TEST_CASE("sprite_x_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
    auto test_sprite = create_sprite(test_bitmap);
    sprite_set_x(test_sprite, 150.0);
    REQUIRE(150.0 == sprite_x(test_sprite));
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
TEST_CASE("sprite_y_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
    auto test_sprite = create_sprite(test_bitmap);
    sprite_set_y(test_sprite, 200.0);
    REQUIRE(200.0 == sprite_y(test_sprite));
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
TEST_CASE("stop_calling_on_sprite_event_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
    auto test_sprite = create_sprite(test_bitmap);
    call_on_sprite_event(_on_sprite_event());
    process_events();
    simulate_sprite_event(test_sprite);
    process_events();
    REQUIRE(sprite_event_occurred(test_sprite));
    stop_calling_on_sprite_event(_on_sprite_event());
    process_events();
    simulate_sprite_event(test_sprite);
    process_events();
    REQUIRE_FALSE(sprite_event_occurred(test_sprite));
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
TEST_CASE("update_all_sprites_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
    auto test_sprite1 = create_sprite(test_bitmap);
    auto test_sprite2 = create_sprite(test_bitmap);
    sprite_set_position(test_sprite1, point_at(100, 100));
    sprite_set_position(test_sprite2, point_at(200, 200));
    sprite_set_velocity(test_sprite1, vector_to(1, 1));
    sprite_set_velocity(test_sprite2, vector_to(-1, -1));
    update_all_sprites();
    REQUIRE(point_at(100, 100) != sprite_position(test_sprite1));
    REQUIRE(point_at(200, 200) != sprite_position(test_sprite2));
    free_all_sprites();
    close_window(test_window);
}
TEST_CASE("update_all_sprites_percent_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
    auto test_sprite1 = create_sprite(test_bitmap);
    auto test_sprite2 = create_sprite(test_bitmap);
    sprite_set_velocity(test_sprite1, vector_to(1.0, 1.0));
    sprite_set_velocity(test_sprite2, vector_to(-1.0, -1.0));
    update_all_sprites(0.5);
    REQUIRE(sprite_at(test_sprite1, point_at(50.0, 50.0)));
    REQUIRE(sprite_at(test_sprite2, point_at(50.0, 50.0)));
    free_all_sprites();
    free_bitmap(test_bitmap);
    close_window(test_window);
}
TEST_CASE("update_sprite_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
    auto test_sprite = create_sprite(test_bitmap);
    sprite_set_velocity(test_sprite, vector_to(1.0, 1.0));
    update_sprite(test_sprite);
    REQUIRE(0.0 != sprite_x(test_sprite));
    REQUIRE(0.0 != sprite_y(test_sprite));
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
TEST_CASE("update_sprite_with_sound_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
    auto test_sprite = create_sprite(test_bitmap);
    sprite_set_velocity(test_sprite, vector_to(1.0, 1.0));
    sprite_start_animation(test_sprite, 0, true);
    update_sprite(test_sprite, true);
    REQUIRE(0.0 != sprite_x(test_sprite));
    REQUIRE(0.0 != sprite_y(test_sprite));
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
TEST_CASE("update_sprite_percent_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
    auto test_sprite = create_sprite(test_bitmap);
    sprite_set_position(test_sprite, point_at(100.0, 100.0));
    sprite_set_velocity(test_sprite, vector_to(1.0, 1.0));
    update_sprite(test_sprite, 0.5);
    REQUIRE(point_in_circle(point_at(100.5, 100.5), sprite_collision_circle(test_sprite)));
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
TEST_CASE("update_sprite_percent_with_sound_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
    auto test_sprite = create_sprite(test_bitmap);
    sprite_set_position(test_sprite, point_at(400, 300));
    update_sprite(test_sprite, 0.5, true);
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
TEST_CASE("update_sprite_animation_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
    auto test_sprite = create_sprite(test_bitmap);
    sprite_start_animation(test_sprite, 0);
    update_sprite_animation(test_sprite);
    REQUIRE(sprite_current_cell(test_sprite) > 0);
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
TEST_CASE("update_sprite_animation_with_sound_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
    auto test_sprite = create_sprite(test_bitmap);
    update_sprite_animation(test_sprite, true);
    REQUIRE(sprite_animation_has_ended(test_sprite));
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
TEST_CASE("update_sprite_animation_percent_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
    auto test_sprite = create_sprite(test_bitmap);
    update_sprite_animation(test_sprite, 0.5);
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
TEST_CASE("update_sprite_animation_percent_with_sound_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
    auto test_sprite = create_sprite(test_bitmap);
    update_sprite_animation(test_sprite, 0.5, true);
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
TEST_CASE("vector_from_center_sprite_to_point_point_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
    auto test_sprite = create_sprite(test_bitmap);
    sprite_set_position(test_sprite, point_at(400, 300));
    auto test_vector = vector_from_center_sprite_to_point(test_sprite, point_at(500, 400));
    REQUIRE(100 == test_vector->x);
    REQUIRE(100 == test_vector->y);
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
TEST_CASE("vector_from_to_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
    auto test_sprite1 = create_sprite(test_bitmap);
    auto test_sprite2 = create_sprite(test_bitmap);
    sprite_set_position(test_sprite1, point_at(100, 100));
    sprite_set_position(test_sprite2, point_at(200, 200));
    auto test_vector = vector_from_to(test_sprite1, test_sprite2);
    REQUIRE(100 == test_vector->x);
    REQUIRE(100 == test_vector->y);
    free_all_sprites();
    close_window(test_window);
}
