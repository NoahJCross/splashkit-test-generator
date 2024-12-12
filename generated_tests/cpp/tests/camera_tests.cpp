#include "splashkit.h"
#include <catch2/catch.hpp>

class TestCamera {
public:
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
        REQUIRE(100.0 == camera_x());
        close_window(test_window);
    }
    TEST_CASE("camera_y_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        set_camera_position(point_at(100.0, 200.0));
        REQUIRE(200.0 == camera_y());
        close_window(test_window);
    }
    TEST_CASE("center_camera_on_vector_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        auto test_sprite = create_sprite("test_sprite");
        sprite_set_position(test_sprite, point_at(100.0, 100.0));
        center_camera_on(test_sprite, vector_from_angle(50.0, 50.0));
        REQUIRE(point_at(-267.8606182336807, -161.69777810573578) == camera_position());
        free_sprite(test_sprite);
        close_window(test_window);
    }
    TEST_CASE("center_camera_on_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        auto test_sprite = create_sprite("test_sprite");
        sprite_set_position(test_sprite, point_at(100.0, 100.0));
        center_camera_on(test_sprite, 0.0, 0.0);
        REQUIRE(point_at(-300, -200) == camera_position());
        free_sprite(test_sprite);
        close_window(test_window);
    }
    TEST_CASE("move_camera_by_vector_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        auto test_vector = vector_from_angle(0.0, 100.0);
        move_camera_by(test_vector);
        REQUIRE(100.0 == camera_x());
        REQUIRE(0.0 == camera_y());
        close_window(test_window);
    }
    TEST_CASE("move_camera_by_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        move_camera_by(100.0, 100.0);
        REQUIRE(100.0 == camera_x());
        REQUIRE(100.0 == camera_y());
        close_window(test_window);
    }
    TEST_CASE("move_camera_to_point_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        move_camera_to(point_at(100.0, 100.0));
        REQUIRE(point_at(100.0, 100.0) == camera_position());
        close_window(test_window);
    }
    TEST_CASE("move_camera_to_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        move_camera_to(100.0, 100.0);
        REQUIRE(100.0 == camera_x());
        REQUIRE(100.0 == camera_y());
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
        set_camera_x(0);
        set_camera_y(0);
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
        set_camera_x(0);
        set_camera_y(0);
        auto test_center = screen_center();
        REQUIRE(400 == test_center->x);
        REQUIRE(300 == test_center->y);
        close_window(test_window);
    }
    TEST_CASE("screen_rectangle_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        auto test_rectangle = screen_rectangle();
        REQUIRE(800 == test_rectangle->width);
        REQUIRE(600 == test_rectangle->height);
        close_window(test_window);
    }
    TEST_CASE("set_camera_position_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        set_camera_position(point_at(100.0, 100.0));
        REQUIRE(point_at(100.0, 100.0) == camera_position());
        close_window(test_window);
    }
    TEST_CASE("set_camera_x_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        set_camera_x(100.0);
        REQUIRE(100.0 == camera_x());
        close_window(test_window);
    }
    TEST_CASE("set_camera_y_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        set_camera_y(100.0);
        REQUIRE(100.0 == camera_y());
        close_window(test_window);
    }
    TEST_CASE("to_screen_point_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        set_camera_position(point_at(100.0, 100.0));
        auto test_screen_point = to_screen(point_at(150.0, 150.0));
        REQUIRE(50.0 == test_screen_point->x);
        REQUIRE(50.0 == test_screen_point->y);
        close_window(test_window);
    }
    TEST_CASE("to_screen_rectangle_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        auto test_rectangle = rectangle_from(100.0, 100.0, 200.0, 200.0);
        auto screen_rectangle = to_screen(test_rectangle);
        REQUIRE(to_screen_x(100.0) == rectangle_left(screen_rectangle));
        REQUIRE(to_screen_y(100.0) == rectangle_top(screen_rectangle));
        close_window(test_window);
    }
    TEST_CASE("to_screen_x_integration") {
        set_camera_x(100.0);
        auto test_screen_x = to_screen_x(150.0);
        REQUIRE(50.0 == test_screen_x);
    }
    TEST_CASE("to_screen_y_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        set_camera_position(point_at(100.0, 100.0));
        auto test_screen_y = to_screen_y(150.0);
        REQUIRE(50.0 == test_screen_y);
        close_window(test_window);
    }
    TEST_CASE("to_world_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        set_camera_position(point_at(100.0, 100.0));
        auto test_world_point = to_world(point_at(400.0, 300.0));
        REQUIRE(500.0 == test_world_point->x);
        REQUIRE(400.0 == test_world_point->y);
        close_window(test_window);
    }
    TEST_CASE("to_world_x_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        set_camera_position(point_at(100.0, 100.0));
        auto test_world_x = to_world_x(400.0);
        REQUIRE(500.0 == test_world_x);
        close_window(test_window);
    }
    TEST_CASE("to_world_y_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        set_camera_position(point_at(100.0, 100.0));
        auto test_world_y = to_world_y(300.0);
        REQUIRE(400.0 == test_world_y);
        close_window(test_window);
    }
    TEST_CASE("vector_world_to_screen_integration") {
        auto test_vector = vector_world_to_screen();
        REQUIRE(vector_from_angle(0.0, 0.0) != test_vector);
    }
    TEST_CASE("window_area_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        auto test_area = window_area(test_window);
        REQUIRE(800 == test_area->width);
        REQUIRE(600 == test_area->height);
        close_window(test_window);
    }
};
