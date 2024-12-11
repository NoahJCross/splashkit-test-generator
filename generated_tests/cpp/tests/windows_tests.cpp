#include "splashkit.h"
#include <catch2/catch.hpp>

class TestWindows {
public:
    TEST_CASE("clear_window_integration") {
        auto window = open_window("Test Window", 800, 600);
        auto color = color_black();
        clear_window(window, color);
        refresh_window(window);
        auto pixel = get_pixel(point_at(0, 0));
        REQUIRE(color == pixel);
        close_window(window);
    }
    TEST_CASE("close_all_windows_integration") {
        auto window1 = open_window("Test Window 1", 800, 600);
        auto window2 = open_window("Test Window 2", 800, 600);
        close_all_windows();
        REQUIRE_FALSE(has_window("Test Window 1"));
        REQUIRE_FALSE(has_window("Test Window 2"));
    }
    TEST_CASE("close_current_window_integration") {
        auto window = open_window("Test Window", 800, 600);
        set_current_window(window);
        close_current_window();
        REQUIRE_FALSE(has_window("Test Window"));
        REQUIRE(current_window() == nullptr);
    }
    TEST_CASE("close_window_named_integration") {
        auto window = open_window("Test Window", 800, 600);
        REQUIRE(has_window("Test Window"));
        close_window_named("Test Window");
        REQUIRE_FALSE(has_window("Test Window"));
    }
    TEST_CASE("close_window_integration") {
        auto window = open_window("Test Window", 800, 600);
        auto window_name = window_caption(window);
        close_window(window);
        REQUIRE_FALSE(has_window(window_name));
        REQUIRE_FALSE(window_has_focus(window));
    }
    TEST_CASE("current_window_integration") {
        auto window1 = open_window("Test Window 1", 800, 600);
        auto window2 = open_window("Test Window 2", 800, 600);
        set_current_window(window2);
        REQUIRE(window2 == current_window());
        REQUIRE(is_current_window(window2));
        REQUIRE_FALSE(is_current_window(window1));
        close_all_windows();
    }
    TEST_CASE("current_window_has_border_integration") {
        auto window = open_window("Test Window", 800, 600);
        set_current_window(window);
        REQUIRE(current_window_has_border());
        current_window_toggle_border();
        REQUIRE_FALSE(current_window_has_border());
        close_window(window);
    }
    TEST_CASE("current_window_height_integration") {
        auto window = open_window("Test Window", 800, 600);
        set_current_window(window);
        REQUIRE(600 == current_window_height());
        resize_current_window(800, 400);
        REQUIRE(400 == current_window_height());
        close_window(window);
    }
    TEST_CASE("current_window_is_fullscreen_integration") {
        auto window = open_window("Test Window", 800, 600);
        set_current_window(window);
        REQUIRE_FALSE(current_window_is_fullscreen());
        current_window_toggle_fullscreen();
        REQUIRE(current_window_is_fullscreen());
        close_window(window);
    }
    TEST_CASE("current_window_position_integration") {
        auto window = open_window("Test Window", 800, 600);
        set_current_window(window);
        move_current_window_to(100, 200);
        auto position = current_window_position();
        REQUIRE(100 == position->X);
        REQUIRE(200 == position->Y);
        close_window(window);
    }
    TEST_CASE("current_window_toggle_border_integration") {
        auto window = open_window("Test Window", 800, 600);
        set_current_window(window);
        auto initial_border = current_window_has_border();
        current_window_toggle_border();
        REQUIRE(initial_border != current_window_has_border());
        close_window(window);
    }
    TEST_CASE("current_window_toggle_fullscreen_integration") {
        auto window = open_window("Test Window", 800, 600);
        set_current_window(window);
        auto initial_fullscreen = current_window_is_fullscreen();
        current_window_toggle_fullscreen();
        REQUIRE(initial_fullscreen != current_window_is_fullscreen());
        close_window(window);
    }
    TEST_CASE("current_window_width_integration") {
        auto window = open_window("Test Window", 800, 600);
        set_current_window(window);
        REQUIRE(800 == current_window_width());
        resize_current_window(400, 600);
        REQUIRE(400 == current_window_width());
        close_window(window);
    }
    TEST_CASE("current_window_x_integration") {
        auto window = open_window("Test Window", 800, 600);
        set_current_window(window);
        move_current_window_to(100, 200);
        REQUIRE(100 == current_window_x());
        move_current_window_to(300, 200);
        REQUIRE(300 == current_window_x());
        close_window(window);
    }
    TEST_CASE("current_window_y_integration") {
        auto window = open_window("Test Window", 800, 600);
        set_current_window(window);
        move_current_window_to(0, 100);
        process_events();
        REQUIRE(100 == current_window_y());
        close_window(window);
    }
    TEST_CASE("has_window_integration") {
        auto window = open_window("Test Window", 800, 600);
        REQUIRE(has_window("Test Window"));
        REQUIRE(has_window(window_caption(window)));
        close_window(window);
        REQUIRE_FALSE(has_window("Test Window"));
    }
    TEST_CASE("is_current_window_integration") {
        auto window1 = open_window("Test Window 1", 800, 600);
        auto window2 = open_window("Test Window 2", 800, 600);
        set_current_window(window1);
        REQUIRE(is_current_window(window1));
        REQUIRE_FALSE(is_current_window(window2));
        close_all_windows();
    }
    TEST_CASE("move_current_window_to_integration") {
        auto window = open_window("Test Window", 800, 600);
        set_current_window(window);
        move_current_window_to(100, 200);
        process_events();
        REQUIRE(100 == current_window_x());
        REQUIRE(200 == current_window_y());
        close_window(window);
    }
    TEST_CASE("move_window_to_named_integration") {
        auto window = open_window("Test Window", 800, 600);
        move_window_to_named("Test Window", 150, 250);
        process_events();
        REQUIRE(150 == window_x("Test Window"));
        REQUIRE(250 == window_y("Test Window"));
        close_window(window);
    }
    TEST_CASE("move_window_to_integration") {
        auto window = open_window("Test Window", 800, 600);
        move_window_to(window, 200, 300);
        process_events();
        REQUIRE(200 == window_x(window));
        REQUIRE(300 == window_y(window));
        close_window(window);
    }
    TEST_CASE("open_window_integration") {
        auto window = open_window("Test Window", 800, 600);
        REQUIRE(window != nullptr);
        REQUIRE("Test Window" == window_caption(window));
        REQUIRE(800 == window_width(window));
        REQUIRE(600 == window_height(window));
        close_window(window);
    }
    TEST_CASE("refresh_window_integration") {
        auto window = open_window("Test Window", 800, 600);
        clear_window(window, color_white());
        draw_circle(color_black(), 400, 300, 50);
        refresh_window(window);
        auto pixel = get_pixel(point_at(400, 300));
        REQUIRE(color_black() == pixel);
        close_window(window);
    }
    TEST_CASE("refresh_window_with_target_fps_integration") {
        auto window = open_window("Test Window", 800, 600);
        refresh_window_with_target_fps(window, 60);
        close_window(window);
    }
    TEST_CASE("resize_current_window_integration") {
        auto window = open_window("Test Window", 800, 600);
        set_current_window(window);
        resize_current_window(1024, 768);
        process_events();
        REQUIRE(1024 == window_width(window));
        REQUIRE(768 == window_height(window));
        close_window(window);
    }
    TEST_CASE("resize_window_integration") {
        auto window = open_window("Test Window", 800, 600);
        resize_window(window, 1024, 768);
        process_events();
        REQUIRE(1024 == window_width(window));
        REQUIRE(768 == window_height(window));
        close_window(window);
    }
    TEST_CASE("set_current_window_named_integration") {
        auto window1 = open_window("Test Window 1", 800, 600);
        auto window2 = open_window("Test Window 2", 800, 600);
        set_current_window_named("Test Window 2");
        REQUIRE(window2 == current_window());
        close_all_windows();
    }
    TEST_CASE("set_current_window_integration") {
        auto window1 = open_window("Test Window 1", 800, 600);
        auto window2 = open_window("Test Window 2", 800, 600);
        set_current_window(window2);
        REQUIRE(window2 == current_window());
        close_all_windows();
    }
    TEST_CASE("window_caption_integration") {
        auto window = open_window("Test Window", 800, 600);
        REQUIRE("Test Window" == window_caption(window));
        close_window(window);
    }
    TEST_CASE("window_close_requested_named_integration") {
        auto window = open_window("Test Window", 800, 600);
        process_events();
        REQUIRE_FALSE(window_close_requested_named("Test Window"));
        while (window_close_requested_named("Test Window") == false) {
            process_events();
        }
        REQUIRE(window_close_requested_named("Test Window"));
        close_window(window);
    }
    TEST_CASE("window_close_requested_integration") {
        auto window = open_window("Test Window", 800, 600);
        process_events();
        REQUIRE_FALSE(window_close_requested(window));
        while (window_close_requested(window) == false) {
            process_events();
        }
        REQUIRE(window_close_requested(window));
        close_window(window);
    }
    TEST_CASE("window_has_border_named_integration") {
        auto window = open_window("Test Window", 800, 600);
        REQUIRE(window_has_border_named("Test Window"));
        window_toggle_border("Test Window");
        process_events();
        REQUIRE_FALSE(window_has_border_named("Test Window"));
        close_window(window);
    }
    TEST_CASE("window_has_border_integration") {
        auto window = open_window("Test Window", 800, 600);
        REQUIRE(window_has_border(window));
        window_toggle_border(window);
        process_events();
        REQUIRE_FALSE(window_has_border(window));
        close_window(window);
    }
    TEST_CASE("window_has_focus_integration") {
        auto window1 = open_window("Test Window 1", 800, 600);
        auto window2 = open_window("Test Window 2", 800, 600);
        process_events();
        REQUIRE(window_has_focus(window2));
        REQUIRE_FALSE(window_has_focus(window1));
        close_all_windows();
    }
    TEST_CASE("window_height_named_integration") {
        auto window = open_window("Test Window", 800, 600);
        REQUIRE(600 == window_height_named("Test Window"));
        resize_window(window, 800, 400);
        process_events();
        REQUIRE(400 == window_height_named("Test Window"));
        close_window(window);
    }
    TEST_CASE("window_height_integration") {
        auto window = open_window("Test Window", 800, 600);
        REQUIRE(600 == window_height(window));
        resize_window(window, 800, 400);
        process_events();
        REQUIRE(400 == window_height(window));
        close_window(window);
    }
    TEST_CASE("window_is_fullscreen_named_integration") {
        auto window = open_window("Test Window", 800, 600);
        REQUIRE_FALSE(window_is_fullscreen_named("Test Window"));
        window_toggle_fullscreen("Test Window");
        process_events();
        REQUIRE(window_is_fullscreen_named("Test Window"));
        close_window(window);
    }
    TEST_CASE("window_is_fullscreen_integration") {
        auto window = open_window("Test Window", 800, 600);
        REQUIRE_FALSE(window_is_fullscreen(window));
        window_toggle_fullscreen(window);
        process_events();
        REQUIRE(window_is_fullscreen(window));
        close_window(window);
    }
    TEST_CASE("window_named_integration") {
        auto window = open_window("Test Window", 800, 600);
        auto named_window = window_named("Test Window");
        REQUIRE(window == named_window);
        REQUIRE(window_caption(window) == window_caption(named_window));
        close_window(window);
    }
    TEST_CASE("window_position_named_integration") {
        auto window = open_window("Test Window", 800, 600);
        move_window_to("Test Window", 100, 200);
        process_events();
        auto position = window_position_named("Test Window");
        REQUIRE(100 == position->X);
        REQUIRE(200 == position->Y);
        close_window(window);
    }
    TEST_CASE("window_position_integration") {
        auto window = open_window("Test Window", 800, 600);
        move_window_to(window, 100, 200);
        process_events();
        auto position = window_position(window);
        REQUIRE(100 == position->X);
        REQUIRE(200 == position->Y);
        close_window(window);
    }
    TEST_CASE("window_set_icon_integration") {
        auto window = open_window("Test Window", 800, 600);
        auto icon = create_bitmap("test_icon", 32, 32);
        clear_bitmap(icon, color_white());
        window_set_icon(window, icon);
        process_events();
        free_bitmap(icon);
        close_window(window);
    }
    TEST_CASE("window_toggle_border_named_integration") {
        auto window = open_window("Test Window", 800, 600);
        REQUIRE(window_has_border("Test Window"));
        window_toggle_border_named("Test Window");
        process_events();
        REQUIRE_FALSE(window_has_border("Test Window"));
        close_window(window);
    }
    TEST_CASE("window_toggle_border_integration") {
        auto window = open_window("Test Window", 800, 600);
        REQUIRE(window_has_border(window));
        window_toggle_border(window);
        process_events();
        REQUIRE_FALSE(window_has_border(window));
        close_window(window);
    }
    TEST_CASE("window_toggle_fullscreen_named_integration") {
        auto window = open_window("Test Window", 800, 600);
        REQUIRE_FALSE(window_is_fullscreen("Test Window"));
        window_toggle_fullscreen_named("Test Window");
        process_events();
        REQUIRE(window_is_fullscreen("Test Window"));
        close_window(window);
    }
    TEST_CASE("window_toggle_fullscreen_integration") {
        auto window = open_window("Test Window", 800, 600);
        REQUIRE_FALSE(window_is_fullscreen(window));
        window_toggle_fullscreen(window);
        process_events();
        REQUIRE(window_is_fullscreen(window));
        close_window(window);
    }
    TEST_CASE("window_width_named_integration") {
        auto window = open_window("Test Window", 800, 600);
        REQUIRE(800 == window_width_named("Test Window"));
        resize_window(window, 1024, 600);
        process_events();
        REQUIRE(1024 == window_width_named("Test Window"));
        close_window(window);
    }
    TEST_CASE("window_width_integration") {
        auto window = open_window("Test Window", 800, 600);
        REQUIRE(800 == window_width(window));
        resize_window(window, 1024, 600);
        process_events();
        REQUIRE(1024 == window_width(window));
        close_window(window);
    }
    TEST_CASE("window_with_focus_integration") {
        auto window1 = open_window("Test Window 1", 800, 600);
        auto window2 = open_window("Test Window 2", 800, 600);
        process_events();
        REQUIRE(window2 == window_with_focus());
        set_current_window(window1);
        process_events();
        REQUIRE(window1 == window_with_focus());
        close_all_windows();
    }
    TEST_CASE("window_x_named_integration") {
        auto window = open_window("Test Window", 800, 600);
        move_window_to("Test Window", 100, 200);
        process_events();
        REQUIRE(100 == window_x_named("Test Window"));
        move_window_to("Test Window", 300, 200);
        process_events();
        REQUIRE(300 == window_x_named("Test Window"));
        close_window(window);
    }
    TEST_CASE("window_x_integration") {
        auto window = open_window("Test Window", 800, 600);
        move_window_to(window, 100, 200);
        process_events();
        REQUIRE(100 == window_x(window));
        move_window_to(window, 300, 200);
        process_events();
        REQUIRE(300 == window_x(window));
        close_window(window);
    }
    TEST_CASE("window_y_named_integration") {
        auto window = open_window("Test Window", 800, 600);
        move_window_to("Test Window", 100, 200);
        process_events();
        REQUIRE(200 == window_y_named("Test Window"));
        move_window_to("Test Window", 100, 400);
        process_events();
        REQUIRE(400 == window_y_named("Test Window"));
        close_window(window);
    }
    TEST_CASE("window_y_integration") {
        auto window = open_window("Test Window", 800, 600);
        move_window_to(window, 100, 200);
        process_events();
        REQUIRE(200 == window_y(window));
        move_window_to(window, 100, 400);
        process_events();
        REQUIRE(400 == window_y(window));
        close_window(window);
    }
};
