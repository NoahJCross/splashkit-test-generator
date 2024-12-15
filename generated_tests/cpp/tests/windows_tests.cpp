#include "splashkit.h"
#include <catch2/catch.hpp>

class TestWindows {
public:
    TEST_CASE("clear_window_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        auto color = color_black();
        clear_window(test_window, color);
        refresh_window(test_window);
        auto pixel = get_pixel(point_at(0.0, 0.0));
        REQUIRE(color == pixel);
        close_window(test_window);
    }
    TEST_CASE("close_all_windows_integration") {
        open_window(string("Test Window 1"), 800, 600);
        open_window(string("Test Window 2"), 800, 600);
        close_all_windows();
        REQUIRE_FALSE(has_window(string("Test Window 1")));
        REQUIRE_FALSE(has_window(string("Test Window 2")));
    }
    TEST_CASE("close_current_window_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        set_current_window(test_window);
        close_current_window();
        REQUIRE_FALSE(has_window(string("Test Window")));
        REQUIRE(current_window() == nullptr);
    }
    TEST_CASE("close_window_named_integration") {
        open_window(string("Test Window"), 800, 600);
        REQUIRE(has_window(string("Test Window")));
        close_window(string("Test Window"));
        REQUIRE_FALSE(has_window(string("Test Window")));
    }
    TEST_CASE("close_window_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        auto window_name = window_caption(test_window);
        close_window(test_window);
        REQUIRE_FALSE(has_window(window_name));
        REQUIRE_FALSE(window_has_focus(test_window));
    }
    TEST_CASE("current_window_integration") {
        auto window1 = open_window(string("Test Window 1"), 800, 600);
        auto window2 = open_window(string("Test Window 2"), 800, 600);
        set_current_window(window2);
        REQUIRE(window2 == current_window());
        REQUIRE(is_current_window(window2));
        REQUIRE_FALSE(is_current_window(window1));
        close_all_windows();
    }
    TEST_CASE("current_window_has_border_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        set_current_window(test_window);
        REQUIRE(current_window_has_border());
        current_window_toggle_border();
        REQUIRE_FALSE(current_window_has_border());
        close_window(test_window);
    }
    TEST_CASE("current_window_height_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        set_current_window(test_window);
        REQUIRE(600 == current_window_height());
        resize_current_window(800, 400);
        REQUIRE(400 == current_window_height());
        close_window(test_window);
    }
    TEST_CASE("current_window_is_fullscreen_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        set_current_window(test_window);
        REQUIRE_FALSE(current_window_is_fullscreen());
        current_window_toggle_fullscreen();
        REQUIRE(current_window_is_fullscreen());
        close_window(test_window);
    }
    TEST_CASE("current_window_position_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        set_current_window(test_window);
        move_current_window_to(100, 200);
        auto position = current_window_position();
        REQUIRE(100.0 == position->x);
        REQUIRE(200.0 == position->y);
        close_window(test_window);
    }
    TEST_CASE("current_window_toggle_border_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        set_current_window(test_window);
        auto initial_border = current_window_has_border();
        current_window_toggle_border();
        REQUIRE(initial_border != current_window_has_border());
        close_window(test_window);
    }
    TEST_CASE("current_window_toggle_fullscreen_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        set_current_window(test_window);
        auto initial_fullscreen = current_window_is_fullscreen();
        current_window_toggle_fullscreen();
        REQUIRE(initial_fullscreen != current_window_is_fullscreen());
        close_window(test_window);
    }
    TEST_CASE("current_window_width_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        set_current_window(test_window);
        REQUIRE(800 == current_window_width());
        resize_current_window(400, 600);
        REQUIRE(400 == current_window_width());
        close_window(test_window);
    }
    TEST_CASE("current_window_x_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        set_current_window(test_window);
        move_current_window_to(100, 200);
        REQUIRE(100 == current_window_x());
        move_current_window_to(300, 200);
        REQUIRE(300 == current_window_x());
        close_window(test_window);
    }
    TEST_CASE("current_window_y_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        set_current_window(test_window);
        move_current_window_to(0, 100);
        process_events();
        REQUIRE(100 == current_window_y());
        close_window(test_window);
    }
    TEST_CASE("has_window_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        REQUIRE(has_window(string("Test Window")));
        REQUIRE(has_window(window_caption(test_window)));
        close_window(test_window);
        REQUIRE_FALSE(has_window(string("Test Window")));
    }
    TEST_CASE("is_current_window_integration") {
        auto window1 = open_window(string("Test Window 1"), 800, 600);
        auto window2 = open_window(string("Test Window 2"), 800, 600);
        set_current_window(window1);
        REQUIRE(is_current_window(window1));
        REQUIRE_FALSE(is_current_window(window2));
        close_all_windows();
    }
    TEST_CASE("move_current_window_to_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        set_current_window(test_window);
        move_current_window_to(100, 200);
        process_events();
        REQUIRE(100 == current_window_x());
        REQUIRE(200 == current_window_y());
        close_window(test_window);
    }
    TEST_CASE("move_window_to_named_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        move_window_to(string("Test Window"), 150, 250);
        process_events();
        REQUIRE(150 == window_x(string("Test Window")));
        REQUIRE(250 == window_y(string("Test Window")));
        close_window(test_window);
    }
    TEST_CASE("move_window_to_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        move_window_to(test_window, 200, 300);
        process_events();
        REQUIRE(200 == window_x(test_window));
        REQUIRE(300 == window_y(test_window));
        close_window(test_window);
    }
    TEST_CASE("open_window_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        REQUIRE(test_window != nullptr);
        REQUIRE(string("Test Window") == window_caption(test_window));
        REQUIRE(800 == window_width(test_window));
        REQUIRE(600 == window_height(test_window));
        close_window(test_window);
    }
    TEST_CASE("refresh_window_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        clear_window(test_window, color_white());
        draw_circle(color_black(), 400.0, 300.0, 50.0);
        refresh_window(test_window);
        auto pixel = get_pixel(point_at(400.0, 300.0));
        REQUIRE(color_black() == pixel);
        close_window(test_window);
    }
    TEST_CASE("refresh_window_with_target_fps_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        refresh_window(test_window, 60u);
        close_window(test_window);
    }
    TEST_CASE("resize_current_window_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        set_current_window(test_window);
        resize_current_window(1024, 768);
        process_events();
        REQUIRE(1024 == window_width(test_window));
        REQUIRE(768 == window_height(test_window));
        close_window(test_window);
    }
    TEST_CASE("resize_window_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        resize_window(test_window, 1024, 768);
        process_events();
        REQUIRE(1024 == window_width(test_window));
        REQUIRE(768 == window_height(test_window));
        close_window(test_window);
    }
    TEST_CASE("set_current_window_named_integration") {
        open_window(string("Test Window 1"), 800, 600);
        auto window2 = open_window(string("Test Window 2"), 800, 600);
        set_current_window(string("Test Window 2"));
        REQUIRE(window2 == current_window());
        close_all_windows();
    }
    TEST_CASE("set_current_window_integration") {
        open_window(string("Test Window 1"), 800, 600);
        auto window2 = open_window(string("Test Window 2"), 800, 600);
        set_current_window(window2);
        REQUIRE(window2 == current_window());
        close_all_windows();
    }
    TEST_CASE("window_caption_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        REQUIRE(string("Test Window") == window_caption(test_window));
        close_window(test_window);
    }
    TEST_CASE("window_close_requested_named_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        process_events();
        REQUIRE_FALSE(window_close_requested(string("Test Window")));
        while (window_close_requested(string("Test Window")) == false) {
            process_events();
        }
        REQUIRE(window_close_requested(string("Test Window")));
        close_window(test_window);
    }
    TEST_CASE("window_close_requested_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        process_events();
        REQUIRE_FALSE(window_close_requested(test_window));
        while (window_close_requested(test_window) == false) {
            process_events();
        }
        REQUIRE(window_close_requested(test_window));
        close_window(test_window);
    }
    TEST_CASE("window_has_border_named_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        REQUIRE(window_has_border(string("Test Window")));
        window_toggle_border(string("Test Window"));
        process_events();
        REQUIRE_FALSE(window_has_border(string("Test Window")));
        close_window(test_window);
    }
    TEST_CASE("window_has_border_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        REQUIRE(window_has_border(test_window));
        window_toggle_border(test_window);
        process_events();
        REQUIRE_FALSE(window_has_border(test_window));
        close_window(test_window);
    }
    TEST_CASE("window_has_focus_integration") {
        auto window1 = open_window(string("Test Window 1"), 800, 600);
        auto window2 = open_window(string("Test Window 2"), 800, 600);
        process_events();
        REQUIRE(window_has_focus(window2));
        REQUIRE_FALSE(window_has_focus(window1));
        close_all_windows();
    }
    TEST_CASE("window_height_named_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        REQUIRE(600 == window_height(string("Test Window")));
        resize_window(test_window, 800, 400);
        process_events();
        REQUIRE(400 == window_height(string("Test Window")));
        close_window(test_window);
    }
    TEST_CASE("window_height_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        REQUIRE(600 == window_height(test_window));
        resize_window(test_window, 800, 400);
        process_events();
        REQUIRE(400 == window_height(test_window));
        close_window(test_window);
    }
    TEST_CASE("window_is_fullscreen_named_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        REQUIRE_FALSE(window_is_fullscreen(string("Test Window")));
        window_toggle_fullscreen(string("Test Window"));
        process_events();
        REQUIRE(window_is_fullscreen(string("Test Window")));
        close_window(test_window);
    }
    TEST_CASE("window_is_fullscreen_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        REQUIRE_FALSE(window_is_fullscreen(test_window));
        window_toggle_fullscreen(test_window);
        process_events();
        REQUIRE(window_is_fullscreen(test_window));
        close_window(test_window);
    }
    TEST_CASE("window_named_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        auto named_window = window_named(string("Test Window"));
        REQUIRE(test_window == named_window);
        REQUIRE(window_caption(test_window) == window_caption(named_window));
        close_window(test_window);
    }
    TEST_CASE("window_position_named_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        move_window_to(string("Test Window"), 100, 200);
        process_events();
        auto position = window_position(string("Test Window"));
        REQUIRE(100.0 == position->x);
        REQUIRE(200.0 == position->y);
        close_window(test_window);
    }
    TEST_CASE("window_position_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        move_window_to(test_window, 100, 200);
        process_events();
        auto position = window_position(test_window);
        REQUIRE(100.0 == position->x);
        REQUIRE(200.0 == position->y);
        close_window(test_window);
    }
    TEST_CASE("window_set_icon_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        auto icon = create_bitmap(string("test_icon"), 32, 32);
        clear_bitmap(icon, color_white());
        window_set_icon(test_window, icon);
        process_events();
        free_bitmap(icon);
        close_window(test_window);
    }
    TEST_CASE("window_toggle_border_named_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        REQUIRE(window_has_border(string("Test Window")));
        window_toggle_border(string("Test Window"));
        process_events();
        REQUIRE_FALSE(window_has_border(string("Test Window")));
        close_window(test_window);
    }
    TEST_CASE("window_toggle_border_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        REQUIRE(window_has_border(test_window));
        window_toggle_border(test_window);
        process_events();
        REQUIRE_FALSE(window_has_border(test_window));
        close_window(test_window);
    }
    TEST_CASE("window_toggle_fullscreen_named_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        REQUIRE_FALSE(window_is_fullscreen(string("Test Window")));
        window_toggle_fullscreen(string("Test Window"));
        process_events();
        REQUIRE(window_is_fullscreen(string("Test Window")));
        close_window(test_window);
    }
    TEST_CASE("window_toggle_fullscreen_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        REQUIRE_FALSE(window_is_fullscreen(test_window));
        window_toggle_fullscreen(test_window);
        process_events();
        REQUIRE(window_is_fullscreen(test_window));
        close_window(test_window);
    }
    TEST_CASE("window_width_named_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        REQUIRE(800 == window_width(string("Test Window")));
        resize_window(test_window, 1024, 600);
        process_events();
        REQUIRE(1024 == window_width(string("Test Window")));
        close_window(test_window);
    }
    TEST_CASE("window_width_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        REQUIRE(800 == window_width(test_window));
        resize_window(test_window, 1024, 600);
        process_events();
        REQUIRE(1024 == window_width(test_window));
        close_window(test_window);
    }
    TEST_CASE("window_with_focus_integration") {
        auto window1 = open_window(string("Test Window 1"), 800, 600);
        auto window2 = open_window(string("Test Window 2"), 800, 600);
        process_events();
        REQUIRE(window2 == window_with_focus());
        set_current_window(window1);
        process_events();
        REQUIRE(window1 == window_with_focus());
        close_all_windows();
    }
    TEST_CASE("window_x_named_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        move_window_to(string("Test Window"), 100, 200);
        process_events();
        REQUIRE(100 == window_x(string("Test Window")));
        move_window_to(string("Test Window"), 300, 200);
        process_events();
        REQUIRE(300 == window_x(string("Test Window")));
        close_window(test_window);
    }
    TEST_CASE("window_x_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        move_window_to(test_window, 100, 200);
        process_events();
        REQUIRE(100 == window_x(test_window));
        move_window_to(test_window, 300, 200);
        process_events();
        REQUIRE(300 == window_x(test_window));
        close_window(test_window);
    }
    TEST_CASE("window_y_named_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        move_window_to(string("Test Window"), 100, 200);
        process_events();
        REQUIRE(200 == window_y(string("Test Window")));
        move_window_to(string("Test Window"), 100, 400);
        process_events();
        REQUIRE(400 == window_y(string("Test Window")));
        close_window(test_window);
    }
    TEST_CASE("window_y_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        move_window_to(test_window, 100, 200);
        process_events();
        REQUIRE(200 == window_y(test_window));
        move_window_to(test_window, 100, 400);
        process_events();
        REQUIRE(400 == window_y(test_window));
        close_window(test_window);
    }
};
