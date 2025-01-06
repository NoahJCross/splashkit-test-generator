#include <catch2/catch_all.hpp>
#include <limits>
#include "splashkit.h"
#include "../helpers.hpp"
struct TestWindowsFixture
{
};
TEST_CASE_METHOD(TestWindowsFixture, "clear_window_integration") {
    auto test_window = open_window("Test Window 1", 800, 600);
    window_cleanup cleanup_window;
    auto color = color_black();
    clear_window(test_window, color);
    refresh_window(test_window);
    auto pixel = get_pixel(point_at(0.0, 0.0));
    REQUIRE(color == pixel);
}
TEST_CASE_METHOD(TestWindowsFixture, "close_all_windows_integration") {
    open_window("Test Window 2", 800, 600);
    window_cleanup cleanup_window;
    open_window("Test Window 3", 800, 600);
    close_all_windows();
    REQUIRE_FALSE(has_window("Test Window 3"));
    REQUIRE_FALSE(has_window("Test Window 3"));
}
TEST_CASE_METHOD(TestWindowsFixture, "close_current_window_integration") {
    auto test_window = open_window("Test Window 4", 800, 600);
    window_cleanup cleanup_window;
    set_current_window(test_window);
    close_current_window();
    REQUIRE_FALSE(has_window("Test Window 4"));
    REQUIRE(current_window() == nullptr);
}
TEST_CASE_METHOD(TestWindowsFixture, "close_window_named_integration") {
    open_window("Test Window 5", 800, 600);
    window_cleanup cleanup_window;
    REQUIRE(has_window("Test Window 5"));
    close_window("Test Window 5");
    REQUIRE_FALSE(has_window("Test Window 5"));
}
TEST_CASE_METHOD(TestWindowsFixture, "close_window_integration") {
    auto test_window = open_window("Test Window 6", 800, 600);
    window_cleanup cleanup_window;
    auto window_name = window_caption(test_window);
    close_window(test_window);
    REQUIRE_FALSE(has_window(window_name));
}
TEST_CASE_METHOD(TestWindowsFixture, "current_window_integration") {
    auto test_window1 = open_window("Test Window 7", 800, 600);
    window_cleanup cleanup_window;
    auto test_window2 = open_window("Test Window 8", 800, 600);
    set_current_window(test_window2);
    REQUIRE(test_window2 == current_window());
    REQUIRE(is_current_window(test_window2));
    REQUIRE_FALSE(is_current_window(test_window1));
}
TEST_CASE_METHOD(TestWindowsFixture, "current_window_has_border_integration") {
    auto test_window = open_window("Test Window 9", 800, 600);
    window_cleanup cleanup_window;
    set_current_window(test_window);
    REQUIRE(current_window_has_border());
    current_window_toggle_border();
    REQUIRE_FALSE(current_window_has_border());
}
TEST_CASE_METHOD(TestWindowsFixture, "current_window_height_integration") {
    auto test_window = open_window("Test Window 10", 800, 600);
    window_cleanup cleanup_window;
    set_current_window(test_window);
    REQUIRE(600 == current_window_height());
    resize_current_window(800, 400);
    REQUIRE(400 == current_window_height());
}
TEST_CASE_METHOD(TestWindowsFixture, "current_window_is_fullscreen_integration") {
    auto test_window = open_window("Test Window 11", 800, 600);
    window_cleanup cleanup_window;
    set_current_window(test_window);
    REQUIRE_FALSE(current_window_is_fullscreen());
    current_window_toggle_fullscreen();
    REQUIRE(current_window_is_fullscreen());
}
TEST_CASE_METHOD(TestWindowsFixture, "current_window_position_integration") {
    auto test_window = open_window("Test Window 12", 800, 600);
    window_cleanup cleanup_window;
    set_current_window(test_window);
    move_current_window_to(100, 200);
    auto position = current_window_position();
    REQUIRE(68.0 == position.x);
    REQUIRE(168.0 == position.y);
}
TEST_CASE_METHOD(TestWindowsFixture, "current_window_toggle_border_integration") {
    auto test_window = open_window("Test Window 13", 800, 600);
    window_cleanup cleanup_window;
    set_current_window(test_window);
    auto initial_border = current_window_has_border();
    current_window_toggle_border();
    REQUIRE(initial_border != current_window_has_border());
}
TEST_CASE_METHOD(TestWindowsFixture, "current_window_toggle_fullscreen_integration") {
    auto test_window = open_window("Test Window 14", 800, 600);
    window_cleanup cleanup_window;
    set_current_window(test_window);
    auto initial_fullscreen = current_window_is_fullscreen();
    current_window_toggle_fullscreen();
    REQUIRE(initial_fullscreen != current_window_is_fullscreen());
}
TEST_CASE_METHOD(TestWindowsFixture, "current_window_width_integration") {
    auto test_window = open_window("Test Window 15", 800, 600);
    window_cleanup cleanup_window;
    set_current_window(test_window);
    REQUIRE(800 == current_window_width());
    resize_current_window(400, 600);
    REQUIRE(400 == current_window_width());
}
TEST_CASE_METHOD(TestWindowsFixture, "current_window_x_integration") {
    auto test_window = open_window("Test Window 16", 800, 600);
    window_cleanup cleanup_window;
    set_current_window(test_window);
    move_current_window_to(100, 200);
    REQUIRE(68 == current_window_x());
    move_current_window_to(300, 200);
    REQUIRE(268 == current_window_x());
}
TEST_CASE_METHOD(TestWindowsFixture, "current_window_y_integration") {
    auto test_window = open_window("Test Window 17", 800, 600);
    window_cleanup cleanup_window;
    set_current_window(test_window);
    move_current_window_to(0, 100);
    REQUIRE(68 == current_window_y());
}
TEST_CASE_METHOD(TestWindowsFixture, "has_window_integration") {
    auto test_window = open_window("Test Window 18", 800, 600);
    window_cleanup cleanup_window;
    REQUIRE(has_window("Test Window 18"));
    REQUIRE(has_window(window_caption(test_window)));
    close_window(test_window);
    REQUIRE_FALSE(has_window("Test Window 18"));
}
TEST_CASE_METHOD(TestWindowsFixture, "is_current_window_integration") {
    auto test_window1 = open_window("Test Window 19", 800, 600);
    window_cleanup cleanup_window;
    auto test_window2 = open_window("Test Window 20", 800, 600);
    set_current_window(test_window1);
    REQUIRE(is_current_window(test_window1));
    REQUIRE_FALSE(is_current_window(test_window2));
}
TEST_CASE_METHOD(TestWindowsFixture, "move_current_window_to_integration") {
    auto test_window = open_window("Test Window 21", 800, 600);
    window_cleanup cleanup_window;
    set_current_window(test_window);
    move_current_window_to(100, 200);
    REQUIRE(68 == current_window_x());
    REQUIRE(168 == current_window_y());
}
TEST_CASE_METHOD(TestWindowsFixture, "move_window_to_named_integration") {
    open_window("Test Window 22", 800, 600);
    window_cleanup cleanup_window;
    move_window_to("Test Window 22", 150, 250);
    REQUIRE(118 == window_x("Test Window 22"));
    REQUIRE(218 == window_y("Test Window 22"));
}
TEST_CASE_METHOD(TestWindowsFixture, "move_window_to_integration") {
    auto test_window = open_window("Test Window 23", 800, 600);
    window_cleanup cleanup_window;
    move_window_to(test_window, 200, 300);
    REQUIRE(168 == window_x(test_window));
    REQUIRE(268 == window_y(test_window));
}
TEST_CASE_METHOD(TestWindowsFixture, "open_window_integration") {
    auto test_window = open_window("Test Window 24", 800, 600);
    window_cleanup cleanup_window;
    REQUIRE(test_window != nullptr);
    REQUIRE("Test Window 24" == window_caption(test_window));
    REQUIRE(800 == window_width(test_window));
    REQUIRE(600 == window_height(test_window));
}
TEST_CASE_METHOD(TestWindowsFixture, "refresh_window_integration") {
    auto test_window = open_window("Test Window 25", 800, 600);
    window_cleanup cleanup_window;
    clear_window(test_window, color_white());
    draw_circle(color_black(), 400.0, 300.0, 50.0);
    refresh_window(test_window);
    auto pixel = get_pixel(point_at(400.0, 350.0));
    REQUIRE(color_black() == pixel);
}
TEST_CASE_METHOD(TestWindowsFixture, "refresh_window_with_target_fps_integration") {
    auto test_window = open_window("Test Window 26", 800, 600);
    window_cleanup cleanup_window;
    refresh_window(test_window, 60u);
}
TEST_CASE_METHOD(TestWindowsFixture, "resize_current_window_integration") {
    auto test_window = open_window("Test Window 27", 800, 600);
    window_cleanup cleanup_window;
    set_current_window(test_window);
    resize_current_window(1024, 768);
    REQUIRE(1024 == window_width(test_window));
    REQUIRE(768 == window_height(test_window));
}
TEST_CASE_METHOD(TestWindowsFixture, "resize_window_integration") {
    auto test_window = open_window("Test Window 28", 800, 600);
    window_cleanup cleanup_window;
    resize_window(test_window, 1024, 768);
    REQUIRE(1024 == window_width(test_window));
    REQUIRE(768 == window_height(test_window));
}
TEST_CASE_METHOD(TestWindowsFixture, "set_current_window_named_integration") {
    open_window("Test Window 29", 800, 600);
    window_cleanup cleanup_window;
    auto test_window2 = open_window("Test Window 30", 800, 600);
    set_current_window("Test Window 30");
    REQUIRE(test_window2 == current_window());
}
TEST_CASE_METHOD(TestWindowsFixture, "set_current_window_integration") {
    open_window("Test Window 31", 800, 600);
    window_cleanup cleanup_window;
    auto test_window2 = open_window("Test Window 32", 800, 600);
    set_current_window(test_window2);
    REQUIRE(test_window2 == current_window());
}
TEST_CASE_METHOD(TestWindowsFixture, "window_caption_integration") {
    auto test_window = open_window("Test Window 33", 800, 600);
    window_cleanup cleanup_window;
    REQUIRE("Test Window 33" == window_caption(test_window));
}
TEST_CASE_METHOD(TestWindowsFixture, "window_close_requested_named_integration") {
    auto test_window = open_window("Test Window 34", 800, 600);
    window_cleanup cleanup_window;
    REQUIRE_FALSE(window_close_requested("Test Window 34"));
    while (window_close_requested("Test Window 34") == false) {
        process_events();
        clear_window(test_window, color_white());
        draw_text("Test: window_close_requested_named. Close window to pass.", color_black(), 10.0, 10.0);
        refresh_screen();
    }
    REQUIRE(window_close_requested("Test Window 34"));
}
TEST_CASE_METHOD(TestWindowsFixture, "window_close_requested_integration") {
    auto test_window = open_window("Test Window 35", 800, 600);
    window_cleanup cleanup_window;
    REQUIRE_FALSE(window_close_requested(test_window));
    while (window_close_requested(test_window) == false) {
        process_events();
        clear_window(test_window, color_white());
        draw_text("Test: window_close_requested. Close window to pass.", color_black(), 10.0, 10.0);
        refresh_screen();
    }
    REQUIRE(window_close_requested(test_window));
}
TEST_CASE_METHOD(TestWindowsFixture, "window_has_border_named_integration") {
    open_window("Test Window 36", 800, 600);
    window_cleanup cleanup_window;
    REQUIRE(window_has_border("Test Window 36"));
    window_toggle_border("Test Window 36");
    REQUIRE_FALSE(window_has_border("Test Window 36"));
}
TEST_CASE_METHOD(TestWindowsFixture, "window_has_border_integration") {
    auto test_window = open_window("Test Window 37", 800, 600);
    window_cleanup cleanup_window;
    REQUIRE(window_has_border(test_window));
    window_toggle_border(test_window);
    REQUIRE_FALSE(window_has_border(test_window));
}
TEST_CASE_METHOD(TestWindowsFixture, "window_has_focus_integration") {
    auto test_window1 = open_window("Test Window 38", 800, 600);
    window_cleanup cleanup_window;
    auto test_window2 = open_window("Test Window 39", 800, 600);
    process_events();
    REQUIRE(window_has_focus(test_window2));
    REQUIRE_FALSE(window_has_focus(test_window1));
}
TEST_CASE_METHOD(TestWindowsFixture, "window_height_named_integration") {
    auto test_window = open_window("Test Window 40", 800, 600);
    window_cleanup cleanup_window;
    REQUIRE(600 == window_height("Test Window 40"));
    resize_window(test_window, 800, 400);
    REQUIRE(400 == window_height("Test Window 40"));
}
TEST_CASE_METHOD(TestWindowsFixture, "window_height_integration") {
    auto test_window = open_window("Test Window 41", 800, 600);
    window_cleanup cleanup_window;
    REQUIRE(600 == window_height(test_window));
    resize_window(test_window, 800, 400);
    REQUIRE(400 == window_height(test_window));
}
TEST_CASE_METHOD(TestWindowsFixture, "window_is_fullscreen_named_integration") {
    open_window("Test Window 42", 800, 600);
    window_cleanup cleanup_window;
    REQUIRE_FALSE(window_is_fullscreen("Test Window 42"));
    window_toggle_fullscreen("Test Window 42");
    REQUIRE(window_is_fullscreen("Test Window 42"));
}
TEST_CASE_METHOD(TestWindowsFixture, "window_is_fullscreen_integration") {
    auto test_window = open_window("Test Window 43", 800, 600);
    window_cleanup cleanup_window;
    REQUIRE_FALSE(window_is_fullscreen(test_window));
    window_toggle_fullscreen(test_window);
    REQUIRE(window_is_fullscreen(test_window));
}
TEST_CASE_METHOD(TestWindowsFixture, "window_named_integration") {
    auto test_window = open_window("Test Window 44", 800, 600);
    window_cleanup cleanup_window;
    auto named_window = window_named("Test Window 44");
    REQUIRE(test_window == named_window);
    REQUIRE(window_caption(test_window) == window_caption(named_window));
}
TEST_CASE_METHOD(TestWindowsFixture, "window_position_named_integration") {
    open_window("Test Window 45", 800, 600);
    window_cleanup cleanup_window;
    move_window_to("Test Window 45", 100, 200);
    delay(500);
    auto position = window_position("Test Window 45");
    REQUIRE(68.0 == position.x);
    REQUIRE(168.0 == position.y);
}
TEST_CASE_METHOD(TestWindowsFixture, "window_position_integration") {
    auto test_window = open_window("Test Window 46", 800, 600);
    window_cleanup cleanup_window;
    move_window_to(test_window, 100, 200);
    delay(500);
    auto position = window_position(test_window);
    REQUIRE(68.0 == position.x);
    REQUIRE(168.0 == position.y);
}
TEST_CASE_METHOD(TestWindowsFixture, "window_set_icon_integration") {
    auto test_window = open_window("Test Window 47", 800, 600);
    window_cleanup cleanup_window;
    auto icon = create_bitmap("Test Bitmap 1", 32, 32);
    bitmap_cleanup cleanup_bitmap;
    clear_bitmap(icon, color_white());
    window_set_icon(test_window, icon);
    free_bitmap(icon);
}
TEST_CASE_METHOD(TestWindowsFixture, "window_toggle_border_named_integration") {
    open_window("Test Window 48", 800, 600);
    window_cleanup cleanup_window;
    REQUIRE(window_has_border("Test Window 48"));
    window_toggle_border("Test Window 48");
    REQUIRE_FALSE(window_has_border("Test Window 48"));
}
TEST_CASE_METHOD(TestWindowsFixture, "window_toggle_border_integration") {
    auto test_window = open_window("Test Window 49", 800, 600);
    window_cleanup cleanup_window;
    REQUIRE(window_has_border(test_window));
    window_toggle_border(test_window);
    REQUIRE_FALSE(window_has_border(test_window));
}
TEST_CASE_METHOD(TestWindowsFixture, "window_toggle_fullscreen_named_integration") {
    open_window("Test Window 50", 800, 600);
    window_cleanup cleanup_window;
    REQUIRE_FALSE(window_is_fullscreen("Test Window 50"));
    window_toggle_fullscreen("Test Window 50");
    REQUIRE(window_is_fullscreen("Test Window 50"));
}
TEST_CASE_METHOD(TestWindowsFixture, "window_toggle_fullscreen_integration") {
    auto test_window = open_window("Test Window 51", 800, 600);
    window_cleanup cleanup_window;
    REQUIRE_FALSE(window_is_fullscreen(test_window));
    window_toggle_fullscreen(test_window);
    REQUIRE(window_is_fullscreen(test_window));
}
TEST_CASE_METHOD(TestWindowsFixture, "window_width_named_integration") {
    auto test_window = open_window("Test Window 52", 800, 600);
    window_cleanup cleanup_window;
    REQUIRE(800 == window_width("Test Window 52"));
    resize_window(test_window, 1024, 600);
    REQUIRE(1024 == window_width("Test Window 52"));
}
TEST_CASE_METHOD(TestWindowsFixture, "window_width_integration") {
    auto test_window = open_window("Test Window 53", 800, 600);
    window_cleanup cleanup_window;
    REQUIRE(800 == window_width(test_window));
    resize_window(test_window, 1024, 600);
    REQUIRE(1024 == window_width(test_window));
}
TEST_CASE_METHOD(TestWindowsFixture, "window_with_focus_integration") {
    auto test_window1 = open_window("Test Window 54", 800, 600);
    window_cleanup cleanup_window;
    move_window_to(test_window1, 200, 200);
    delay(500);
    auto test_window2 = open_window("Test Window 55", 800, 600);
    move_window_to(test_window2, 850, 200);
    delay(500);
    REQUIRE(test_window2 == window_with_focus());
    while (window_with_focus() != test_window1) {
        process_events();
        clear_screen();
        draw_text("Test: window_with_focus. Click this window to pass.", color_black(), 10.0, 10.0, option_draw_to(test_window1));
        refresh_screen();
    }
    REQUIRE(test_window1 == window_with_focus());
}
TEST_CASE_METHOD(TestWindowsFixture, "window_x_named_integration") {
    open_window("Test Window 56", 800, 600);
    window_cleanup cleanup_window;
    move_window_to("Test Window 56", 100, 200);
    REQUIRE(68 == window_x("Test Window 56"));
    move_window_to("Test Window 56", 300, 200);
    REQUIRE(268 == window_x("Test Window 56"));
}
TEST_CASE_METHOD(TestWindowsFixture, "window_x_integration") {
    auto test_window = open_window("Test Window 57", 800, 600);
    window_cleanup cleanup_window;
    move_window_to(test_window, 100, 200);
    REQUIRE(68 == window_x(test_window));
    move_window_to(test_window, 300, 200);
    REQUIRE(268 == window_x(test_window));
}
TEST_CASE_METHOD(TestWindowsFixture, "window_y_named_integration") {
    open_window("Test Window 58", 800, 600);
    window_cleanup cleanup_window;
    move_window_to("Test Window 58", 100, 200);
    REQUIRE(168 == window_y("Test Window 58"));
    move_window_to("Test Window 58", 100, 400);
    REQUIRE(368 == window_y("Test Window 58"));
}
TEST_CASE_METHOD(TestWindowsFixture, "window_y_integration") {
    auto test_window = open_window("Test Window 59", 800, 600);
    window_cleanup cleanup_window;
    move_window_to(test_window, 100, 200);
    REQUIRE(168 == window_y(test_window));
    move_window_to(test_window, 100, 400);
    REQUIRE(368 == window_y(test_window));
}
