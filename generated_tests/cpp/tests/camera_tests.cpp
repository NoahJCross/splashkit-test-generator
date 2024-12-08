#include "splashkit.h"
#include <catch2/catch.hpp>

TEST_CASE("camera_position_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_camera_position = camera_position();
    REQUIRE(0.0 == test_camera_position->x);
    REQUIRE(0.0 == test_camera_position->y);
    close_window(test_window);
}
TEST_CASE("camera_x_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    set_camera_position(point_at(100.0, 100.0));
    REQUIRE(camera_x() == 100.0);
    close_window(test_window);
}
TEST_CASE("camera_y_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    set_camera_position(point_at(100.0, 200.0));
    REQUIRE(camera_y() == 200.0);
    close_window(test_window);
}
TEST_CASE("center_camera_on_vector_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_sprite = create_sprite("test_sprite");
    sprite_set_position(test_sprite, point_at(100.0, 100.0));
    center_camera_on(test_sprite, vector_from_angle(50.0, 50.0));
    REQUIRE(camera_position() == point_at(50.0, 50.0));
    free_sprite(test_sprite);
    close_window(test_window);
}
TEST_CASE("center_camera_on_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_sprite = create_sprite("test_sprite");
    sprite_set_position(test_sprite, point_at(100.0, 100.0));
    center_camera_on(test_sprite, 0.0, 0.0);
    REQUIRE(camera_position() == point_at(50.0, 50.0));
    free_sprite(test_sprite);
    close_window(test_window);
}
TEST_CASE("move_camera_by_vector_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_vector = vector_from_angle(0.0, 100.0);
    move_camera_by(test_vector);
    REQUIRE(camera_x() == 100.0);
    REQUIRE(camera_y() == 100.0);
    close_window(test_window);
}
TEST_CASE("move_camera_by_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    move_camera_by(100.0, 100.0);
    REQUIRE(camera_x() == 100.0);
    REQUIRE(camera_y() == 100.0);
    close_window(test_window);
}
TEST_CASE("move_camera_to_point_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    move_camera_to(point_at(100.0, 100.0));
    REQUIRE(camera_position() == point_at(100.0, 100.0));
    close_window(test_window);
}
TEST_CASE("move_camera_to_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    move_camera_to(100.0, 100.0);
    REQUIRE(camera_x() == 100.0);
    REQUIRE(camera_y() == 100.0);
    close_window(test_window);
}
TEST_CASE("point_in_window_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_point = point_at(400, 300);
    REQUIRE(point_in_window(test_window, test_point));
    auto test_point_outside = point_at(1000, 1000);
    REQUIRE_FALSE(point_in_window(test_window, test_point_outside));
    close_window(test_window);
}
TEST_CASE("point_on_screen_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_point = point_at(400.0, 300.0);
    REQUIRE(point_on_screen(test_point));
    auto test_point_outside = point_at(1000.0, 1000.0);
    REQUIRE_FALSE(point_on_screen(test_point_outside));
    close_window(test_window);
}
TEST_CASE("rect_in_window_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_rectangle = rectangle_from(0, 0, 100, 100);
    REQUIRE(rect_in_window(test_window, test_rectangle));
    auto test_rectangle_outside = rectangle_from(1000, 1000, 100, 100);
    REQUIRE_FALSE(rect_in_window(test_window, test_rectangle_outside));
    close_window(test_window);
}
TEST_CASE("rect_on_screen_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_rectangle = rectangle_from(0, 0, 100, 100);
    REQUIRE(rect_on_screen(test_rectangle));
    move_camera_to(1000, 1000);
    REQUIRE_FALSE(rect_on_screen(test_rectangle));
    close_window(test_window);
}
TEST_CASE("screen_center_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_center = screen_center();
    REQUIRE(todo() == test_center);
    REQUIRE(todo() == test_center);
    close_window(test_window);
}
TEST_CASE("screen_rectangle_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_rectangle = screen_rectangle();
    REQUIRE(test_rectangle->width == 800);
    REQUIRE(test_rectangle->height == 600);
    close_window(test_window);
}
TEST_CASE("set_camera_position_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    set_camera_position(point_at(100.0, 100.0));
    REQUIRE(camera_position() == point_at(100.0, 100.0));
    close_window(test_window);
}
TEST_CASE("set_camera_x_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    set_camera_x(100.0);
    REQUIRE(camera_x() == 100.0);
    close_window(test_window);
}
TEST_CASE("set_camera_y_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    set_camera_y(100.0);
    REQUIRE(camera_y() == 100.0);
    close_window(test_window);
}
TEST_CASE("to_screen_point_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    set_camera_position(point_at(100.0, 100.0));
    auto test_screen_point = to_screen(point_at(150.0, 150.0));
    REQUIRE(todo() == test_screen_point);
    REQUIRE(todo() == test_screen_point);
    close_window(test_window);
}
TEST_CASE("to_screen_rectangle_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_rectangle = rectangle_from(100.0, 100.0, 200.0, 200.0);
    auto screen_rectangle = to_screen(test_rectangle);
    REQUIRE(rectangle_left(screen_rectangle) == to_screen_x(100.0));
    REQUIRE(rectangle_top(screen_rectangle) == to_screen_y(100.0));
    close_window(test_window);
}
TEST_CASE("to_screen_x_integration") {
    set_camera_x(100.0);
    auto test_screen_x = to_screen_x(150.0);
    REQUIRE(test_screen_x == 50.0);
}
TEST_CASE("to_screen_y_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    set_camera_position(point_at(100.0, 100.0));
    auto test_screen_y = to_screen_y(150.0);
    REQUIRE(test_screen_y == 50.0);
    close_window(test_window);
}
TEST_CASE("to_world_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    set_camera_position(point_at(100.0, 100.0));
    auto test_world_point = to_world(point_at(400.0, 300.0));
    REQUIRE(todo() == test_world_point);
    REQUIRE(todo() == test_world_point);
    close_window(test_window);
}
TEST_CASE("to_world_x_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    set_camera_position(point_at(100.0, 100.0));
    auto test_world_x = to_world_x(400.0);
    REQUIRE(test_world_x == camera_x());
    close_window(test_window);
}
TEST_CASE("to_world_y_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    set_camera_position(point_at(100.0, 100.0));
    auto test_world_y = to_world_y(300.0);
    REQUIRE(test_world_y == 400.0);
    close_window(test_window);
}
TEST_CASE("vector_world_to_screen_integration") {
    auto test_vector = vector_world_to_screen();
    REQUIRE(test_vector != vector_from_angle(0.0, 0.0));
}
TEST_CASE("window_area_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_area = window_area(test_window);
    REQUIRE(test_area->width == 800);
    REQUIRE(test_area->height == 600);
    close_window(test_window);
}
