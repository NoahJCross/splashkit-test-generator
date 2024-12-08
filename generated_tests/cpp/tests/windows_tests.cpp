#include "splashkit.h"
#include <catch2/catch.hpp>

TEST_CASE("clear_window_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_color = color_black();
    clear_window(test_window, test_color);
    refresh_window(test_window);
    REQUIRE(get_pixel(point_at(window_width(test_window), window_height(test_window))) == color_black());
    close_window(test_window);
}
TEST_CASE("close_all_windows_integration") {
    auto test_window_1 = open_window("Test Window 1", 800, 600);
    auto test_window_2 = open_window("Test Window 2", 800, 600);
    close_all_windows();
    REQUIRE_FALSE(has_window("Test Window 1"));
    REQUIRE_FALSE(has_window("Test Window 2"));
}
TEST_CASE("close_current_window_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    set_current_window(test_window);
    close_current_window();
    REQUIRE_FALSE(has_window("Test Window"));
}
TEST_CASE("close_window_named_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto window_exists = has_window("Test Window");
    REQUIRE(window_exists);
    close_window("Test Window");
    auto window_exists = has_window("Test Window");
    REQUIRE_FALSE(window_exists);
}
TEST_CASE("close_window_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    close_window(test_window);
    REQUIRE_FALSE(has_window("Test Window"));
}
TEST_CASE("current_window_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    set_current_window(test_window);
    REQUIRE(current_window() == test_window);
    close_window(test_window);
}
TEST_CASE("current_window_has_border_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    REQUIRE(current_window_has_border());
    current_window_toggle_border();
    REQUIRE_FALSE(current_window_has_border());
    close_window(test_window);
}
TEST_CASE("current_window_height_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    set_current_window(test_window);
    REQUIRE(current_window_height() == 600);
    close_window(test_window);
}
TEST_CASE("current_window_is_fullscreen_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    REQUIRE_FALSE(current_window_is_fullscreen());
    current_window_toggle_fullscreen();
    REQUIRE(current_window_is_fullscreen());
    current_window_toggle_fullscreen();
    REQUIRE_FALSE(current_window_is_fullscreen());
    close_window(test_window);
}
TEST_CASE("current_window_position_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_position = current_window_position();
    REQUIRE(test_position != nullptr);
    close_window(test_window);
}
TEST_CASE("current_window_toggle_border_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    current_window_toggle_border();
    REQUIRE_FALSE(current_window_has_border());
    current_window_toggle_border();
    REQUIRE(current_window_has_border());
    close_window(test_window);
}
TEST_CASE("current_window_toggle_fullscreen_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    current_window_toggle_fullscreen();
    REQUIRE(current_window_is_fullscreen());
    current_window_toggle_fullscreen();
    REQUIRE_FALSE(current_window_is_fullscreen());
    close_window(test_window);
}
TEST_CASE("current_window_width_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    set_current_window(test_window);
    REQUIRE(current_window_width() == 800);
    close_window(test_window);
}
TEST_CASE("current_window_x_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    move_window_to(test_window, 100, 200);
    set_current_window(test_window);
    REQUIRE(current_window_x() == 100);
    close_window(test_window);
}
TEST_CASE("current_window_y_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_y = current_window_y();
    REQUIRE(test_y > -1);
    close_window(test_window);
}
TEST_CASE("has_window_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    REQUIRE(has_window("Test Window"));
    close_window(test_window);
    REQUIRE_FALSE(has_window("Test Window"));
}
TEST_CASE("is_current_window_integration") {
    auto test_window_1 = open_window("Test Window 1", 800, 600);
    auto test_window_2 = open_window("Test Window 2", 800, 600);
    set_current_window(test_window_1);
    REQUIRE(is_current_window(test_window_1));
    REQUIRE_FALSE(is_current_window(test_window_2));
    set_current_window(test_window_2);
    REQUIRE(is_current_window(test_window_2));
    REQUIRE_FALSE(is_current_window(test_window_1));
    close_window(test_window_1);
    close_window(test_window_2);
}
TEST_CASE("move_current_window_to_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    move_current_window_to(100, 100);
    REQUIRE(current_window_x() == 100);
    REQUIRE(current_window_y() == 100);
    close_window(test_window);
}
TEST_CASE("move_window_to_named_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    move_window_to("Test Window", 100, 100);
    process_events();
    REQUIRE(window_x("Test Window") == 100);
    REQUIRE(window_y("Test Window") == 100);
    close_window("Test Window");
}
TEST_CASE("move_window_to_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    move_window_to(test_window, 100, 100);
    REQUIRE(window_x(test_window) == 100);
    REQUIRE(window_y(test_window) == 100);
    close_window(test_window);
}
TEST_CASE("open_window_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    REQUIRE(test_window != nullptr);
    close_window(test_window);
}
TEST_CASE("refresh_window_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    draw_circle(color_black(), circle_at(400.0, 300.0, 50.0));
    refresh_window(test_window);
    REQUIRE(point_in_circle(point_at(400.0, 300.0), circle_at(400.0, 300.0, 50.0)));
    close_window(test_window);
}
TEST_CASE("refresh_window_with_target_fps_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    refresh_window(test_window, 60);
    close_window(test_window);
}
TEST_CASE("resize_current_window_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    set_current_window(test_window);
    resize_current_window(1024, 768);
    process_events();
    REQUIRE(current_window_width() == 1024);
    REQUIRE(current_window_height() == 768);
    close_window(test_window);
}
TEST_CASE("resize_window_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    resize_window(test_window, 1024, 768);
    REQUIRE(window_width(test_window) == 1024);
    REQUIRE(window_height(test_window) == 768);
    close_window(test_window);
}
TEST_CASE("set_current_window_named_integration") {
    auto test_window_1 = open_window("Test Window 1", 800, 600);
    auto test_window_2 = open_window("Test Window 2", 800, 600);
    set_current_window("Test Window 2");
    REQUIRE(is_current_window(test_window_2));
    close_window(test_window_1);
    close_window(test_window_2);
}
TEST_CASE("set_current_window_integration") {
    auto test_window_1 = open_window("Test Window 1", 800, 600);
    auto test_window_2 = open_window("Test Window 2", 800, 600);
    set_current_window(test_window_2);
    REQUIRE(is_current_window(test_window_2));
    close_window(test_window_1);
    close_window(test_window_2);
}
TEST_CASE("window_caption_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    REQUIRE(window_caption(test_window) == "Test Window");
    close_window(test_window);
}
TEST_CASE("window_close_requested_named_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    process_events();
    REQUIRE_FALSE(window_close_requested("Test Window"));
    simulate_key_press(KeyCode::ESCAPE);
    process_events();
    REQUIRE(window_close_requested("Test Window"));
    close_window(test_window);
}
TEST_CASE("window_close_requested_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    process_events();
    REQUIRE_FALSE(window_close_requested(test_window));
    simulate_key_press(KeyCode::ESCAPE);
    process_events();
    REQUIRE(window_close_requested(test_window));
    close_window(test_window);
}
TEST_CASE("window_has_border_named_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    REQUIRE(window_has_border("Test Window"));
    window_toggle_border("Test Window");
    REQUIRE_FALSE(window_has_border("Test Window"));
    close_window("Test Window");
}
TEST_CASE("window_has_border_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    REQUIRE(window_has_border(test_window));
    window_toggle_border(test_window);
    REQUIRE_FALSE(window_has_border(test_window));
    close_window(test_window);
}
TEST_CASE("window_has_focus_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    process_events();
    REQUIRE(window_has_focus(test_window));
    close_window(test_window);
}
TEST_CASE("window_height_named_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    REQUIRE(window_height("Test Window") == 600);
    close_window(test_window);
}
TEST_CASE("window_height_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    REQUIRE(window_height(test_window) == 600);
    close_window(test_window);
}
TEST_CASE("window_is_fullscreen_named_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    window_toggle_fullscreen(test_window);
    REQUIRE(window_is_fullscreen("Test Window"));
    window_toggle_fullscreen(test_window);
    REQUIRE_FALSE(window_is_fullscreen("Test Window"));
    close_window(test_window);
}
TEST_CASE("window_is_fullscreen_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    REQUIRE_FALSE(window_is_fullscreen(test_window));
    window_toggle_fullscreen(test_window);
    REQUIRE(window_is_fullscreen(test_window));
    close_window(test_window);
}
TEST_CASE("window_named_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto retrieved_window = window_named("Test Window");
    REQUIRE(test_window == retrieved_window);
    close_window(test_window);
}
TEST_CASE("window_position_named_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_position = window_position("Test Window");
    REQUIRE(test_position != nullptr);
    close_window(test_window);
}
TEST_CASE("window_position_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_position = window_position(test_window);
    REQUIRE(test_position != nullptr);
    close_window(test_window);
}
TEST_CASE("window_set_icon_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_bitmap = create_bitmap("test_icon", 32, 32);
    window_set_icon(test_window, test_bitmap);
    close_window(test_window);
    free_bitmap(test_bitmap);
}
TEST_CASE("window_toggle_border_named_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_has_border = window_has_border("Test Window");
    REQUIRE(test_has_border);
    window_toggle_border("Test Window");
    auto test_has_border = window_has_border("Test Window");
    REQUIRE_FALSE(test_has_border);
    close_window("Test Window");
}
TEST_CASE("window_toggle_border_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    REQUIRE(window_has_border(test_window));
    window_toggle_border(test_window);
    REQUIRE_FALSE(window_has_border(test_window));
    window_toggle_border(test_window);
    REQUIRE(window_has_border(test_window));
    close_window(test_window);
}
TEST_CASE("window_toggle_fullscreen_named_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    process_events();
    REQUIRE_FALSE(window_is_fullscreen("Test Window"));
    window_toggle_fullscreen("Test Window");
    process_events();
    REQUIRE(window_is_fullscreen("Test Window"));
    close_window("Test Window");
}
TEST_CASE("window_toggle_fullscreen_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto initial_fullscreen_state = window_is_fullscreen(test_window);
    window_toggle_fullscreen(test_window);
    auto new_fullscreen_state = window_is_fullscreen(test_window);
    REQUIRE(initial_fullscreen_state != new_fullscreen_state);
    close_window(test_window);
}
TEST_CASE("window_width_named_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    REQUIRE(window_width("Test Window") == 800);
    close_window(test_window);
}
TEST_CASE("window_width_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    REQUIRE(window_width(test_window) == 800);
    close_window(test_window);
}
TEST_CASE("window_with_focus_integration") {
    auto test_window_1 = open_window("Test Window 1", 800, 600);
    auto test_window_2 = open_window("Test Window 2", 800, 600);
    set_current_window(test_window_1);
    auto focused_window = window_with_focus();
    REQUIRE(focused_window == test_window_1);
    set_current_window(test_window_2);
    auto focused_window = window_with_focus();
    REQUIRE(focused_window == test_window_2);
    close_window(test_window_1);
    close_window(test_window_2);
}
TEST_CASE("window_x_named_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    move_window_to("Test Window", 100, 200);
    REQUIRE(window_x("Test Window") == 100);
    close_window("Test Window");
}
TEST_CASE("window_x_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    REQUIRE(window_x(test_window) > -1);
    close_window(test_window);
}
TEST_CASE("window_y_named_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    move_window_to("Test Window", 100, 200);
    auto test_window_y = window_y("Test Window");
    REQUIRE(test_window_y == 200);
    close_window("Test Window");
}
TEST_CASE("window_y_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    move_window_to(test_window, 100, 200);
    REQUIRE(window_y(test_window) == 200);
    close_window(test_window);
}
