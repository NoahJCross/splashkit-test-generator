#include "splashkit.h"
#include <catch2/catch.hpp>
#include "../helpers.hpp"
class TestGraphics {
public:
    TestGraphics()
    {
        set_resources_path(string("/mnt/c/Users/Noahc/Documents/aYear_2_semester_2/TeamProject/GitHubRepo/splashkit_test_generator/resources"));
    }
    TEST_CASE("draw_circle_record_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        WindowCleanup cleanup_window;
        clear_window(test_window, color_white());
        auto test_circle = circle_at(400.0, 300.0, 50.0);
        draw_circle(color_black(), test_circle);
        REQUIRE(color_black() == get_pixel(test_window, 450.0, 300.0));
        REQUIRE(color_white() == get_pixel(test_window, 400.0, 300.0));
        REQUIRE(color_white() == get_pixel(test_window, 460.0, 300.0));
    }
    TEST_CASE("draw_circle_record_with_options_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        WindowCleanup cleanup_window;
        clear_window(test_window, color_white());
        auto test_circle = circle_at(400.0, 300.0, 50.0);
        draw_circle(color_black(), test_circle, option_defaults());
        REQUIRE(color_black() == get_pixel(test_window, 450.0, 300.0));
        REQUIRE(color_white() == get_pixel(test_window, 400.0, 300.0));
        REQUIRE(color_white() == get_pixel(test_window, 460.0, 300.0));
    }
    TEST_CASE("draw_circle_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        WindowCleanup cleanup_window;
        clear_window(test_window, color_white());
        draw_circle(color_black(), 400.0, 300.0, 50.0);
        refresh_screen();
        REQUIRE(color_black() == get_pixel(test_window, 450.0, 300.0));
        REQUIRE(color_white() == get_pixel(test_window, 425.0, 300.0));
        REQUIRE(color_white() == get_pixel(test_window, 460.0, 300.0));
    }
    TEST_CASE("draw_circle_with_options_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        WindowCleanup cleanup_window;
        clear_window(test_window, color_white());
        draw_circle(color_black(), 400.0, 300.0, 50.0, option_defaults());
        REQUIRE(color_black() == get_pixel(test_window, 450.0, 300.0));
        REQUIRE(color_white() == get_pixel(test_window, 400.0, 300.0));
        REQUIRE(color_white() == get_pixel(test_window, 460.0, 300.0));
    }
    TEST_CASE("draw_circle_on_bitmap_integration") {
        auto test_bitmap = create_bitmap(string("test_bitmap"), 200, 200);
        BitmapCleanup cleanup_bitmap;
        clear_bitmap(test_bitmap, color_white());
        draw_circle_on_bitmap(test_bitmap, color_black(), 100.0, 100.0, 50.0);
        REQUIRE(color_black() == get_pixel(test_bitmap, 150.0, 100.0));
        REQUIRE(color_white() == get_pixel(test_bitmap, 100.0, 100.0));
        REQUIRE(color_white() == get_pixel(test_bitmap, 160.0, 100.0));
    }
    TEST_CASE("draw_circle_on_bitmap_with_options_integration") {
        auto test_bitmap = create_bitmap(string("test_bitmap"), 200, 200);
        BitmapCleanup cleanup_bitmap;
        clear_bitmap(test_bitmap, color_white());
        draw_circle_on_bitmap(test_bitmap, color_black(), 100.0, 100.0, 50.0, option_defaults());
        REQUIRE(color_black() == get_pixel(test_bitmap, 150.0, 100.0));
        REQUIRE(color_white() == get_pixel(test_bitmap, 100.0, 100.0));
        REQUIRE(color_white() == get_pixel(test_bitmap, 160.0, 100.0));
    }
    TEST_CASE("draw_circle_on_window_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        WindowCleanup cleanup_window;
        clear_window(test_window, color_white());
        draw_circle_on_window(test_window, color_black(), 400.0, 300.0, 50.0);
        REQUIRE(color_black() == get_pixel(test_window, 450.0, 300.0));
        REQUIRE(color_white() == get_pixel(test_window, 400.0, 300.0));
        REQUIRE(color_white() == get_pixel(test_window, 460.0, 300.0));
    }
    TEST_CASE("draw_circle_on_window_with_options_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        WindowCleanup cleanup_window;
        clear_window(test_window, color_white());
        draw_circle_on_window(test_window, color_black(), 400.0, 300.0, 50.0, option_defaults());
        REQUIRE(color_black() == get_pixel(test_window, 450.0, 300.0));
        REQUIRE(color_black() == get_pixel(test_window, 350.0, 300.0));
        REQUIRE(color_white() == get_pixel(test_window, 400.0, 400.0));
    }
    TEST_CASE("fill_circle_record_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        WindowCleanup cleanup_window;
        clear_window(test_window, color_white());
        auto test_circle = circle_at(400.0, 300.0, 50.0);
        fill_circle(color_black(), test_circle);
        REQUIRE(color_black() == get_pixel(test_window, 400.0, 300.0));
        REQUIRE(color_black() == get_pixel(test_window, 425.0, 300.0));
        REQUIRE(color_white() == get_pixel(test_window, 460.0, 300.0));
    }
    TEST_CASE("fill_circle_record_with_options_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        WindowCleanup cleanup_window;
        clear_window(test_window, color_white());
        auto test_circle = circle_at(400.0, 300.0, 50.0);
        fill_circle(color_black(), test_circle, option_defaults());
        REQUIRE(color_black() == get_pixel(test_window, 400.0, 300.0));
        REQUIRE(color_black() == get_pixel(test_window, 425.0, 300.0));
        REQUIRE(color_white() == get_pixel(test_window, 460.0, 300.0));
    }
    TEST_CASE("fill_circle_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        WindowCleanup cleanup_window;
        clear_window(test_window, color_white());
        fill_circle(color_black(), 400.0, 300.0, 50.0);
        REQUIRE(color_black() == get_pixel(test_window, 400.0, 300.0));
        REQUIRE(color_black() == get_pixel(test_window, 425.0, 300.0));
        REQUIRE(color_white() == get_pixel(test_window, 460.0, 300.0));
    }
    TEST_CASE("fill_circle_with_options_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        WindowCleanup cleanup_window;
        clear_window(test_window, color_white());
        fill_circle(color_black(), 400.0, 300.0, 50.0, option_defaults());
        REQUIRE(color_black() == get_pixel(test_window, 400.0, 300.0));
        REQUIRE(color_black() == get_pixel(test_window, 425.0, 300.0));
        REQUIRE(color_white() == get_pixel(test_window, 460.0, 300.0));
    }
    TEST_CASE("fill_circle_on_bitmap_integration") {
        auto test_bitmap = create_bitmap(string("test_bitmap"), 200, 200);
        BitmapCleanup cleanup_bitmap;
        clear_bitmap(test_bitmap, color_white());
        fill_circle_on_bitmap(test_bitmap, color_red(), 100.0, 100.0, 50.0);
        REQUIRE(color_red() == get_pixel(test_bitmap, 100.0, 100.0));
        REQUIRE(color_red() == get_pixel(test_bitmap, 125.0, 100.0));
        REQUIRE(color_white() == get_pixel(test_bitmap, 160.0, 100.0));
    }
    TEST_CASE("fill_circle_on_bitmap_with_options_integration") {
        auto test_bitmap = create_bitmap(string("test_bitmap"), 200, 200);
        BitmapCleanup cleanup_bitmap;
        clear_bitmap(test_bitmap, color_white());
        fill_circle_on_bitmap(test_bitmap, color_black(), 100.0, 100.0, 50.0, option_defaults());
        REQUIRE(color_black() == get_pixel(test_bitmap, 100.0, 100.0));
        REQUIRE(color_black() == get_pixel(test_bitmap, 125.0, 100.0));
        REQUIRE(color_white() == get_pixel(test_bitmap, 160.0, 100.0));
    }
    TEST_CASE("fill_circle_on_window_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        WindowCleanup cleanup_window;
        clear_window(test_window, color_white());
        fill_circle_on_window(test_window, color_black(), 400.0, 300.0, 50.0);
        REQUIRE(color_black() == get_pixel(test_window, 400.0, 300.0));
        REQUIRE(color_black() == get_pixel(test_window, 425.0, 300.0));
        REQUIRE(color_white() == get_pixel(test_window, 460.0, 300.0));
    }
    TEST_CASE("fill_circle_on_window_with_options_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        WindowCleanup cleanup_window;
        clear_window(test_window, color_white());
        fill_circle_on_window(test_window, color_black(), 400.0, 300.0, 50.0, option_defaults());
        REQUIRE(color_black() == get_pixel(test_window, 400.0, 300.0));
        REQUIRE(color_black() == get_pixel(test_window, 425.0, 300.0));
        REQUIRE(color_white() == get_pixel(test_window, 460.0, 300.0));
    }
    TEST_CASE("current_clip_integration") {
        open_window(string("Test Window"), 800, 600);
        WindowCleanup cleanup_window;
        auto test_clip = current_clip();
        REQUIRE(0.0f == rectangle_left(test_clip));
        REQUIRE(0.0f == rectangle_top(test_clip));
        REQUIRE(800.0 == test_clip.width);
        REQUIRE(600.0 == test_clip.height);
    }
    TEST_CASE("current_clip_for_bitmap_integration") {
        auto test_bitmap = create_bitmap(string("test_bitmap"), 100, 100);
        BitmapCleanup cleanup_bitmap;
        auto test_rectangle = rectangle_from(10.0, 10.0, 50.0, 50.0);
        push_clip(test_bitmap, test_rectangle);
        auto test_clip = current_clip(test_bitmap);
        REQUIRE(10.0f == rectangle_left(test_clip));
        REQUIRE(10.0f == rectangle_top(test_clip));
        REQUIRE(50.0 == test_clip.width);
        REQUIRE(50.0 == test_clip.height);
    }
    TEST_CASE("current_clip_for_window_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        WindowCleanup cleanup_window;
        auto test_clip = current_clip(test_window);
        REQUIRE(0.0f == rectangle_left(test_clip));
        REQUIRE(0.0f == rectangle_top(test_clip));
        REQUIRE(800.0 == test_clip.width);
        REQUIRE(600.0 == test_clip.height);
    }
    TEST_CASE("pop_clip_for_window_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        WindowCleanup cleanup_window;
        auto test_rectangle = rectangle_from(0.0, 0.0, 250.0, 250.0);
        push_clip(test_window, test_rectangle);
        auto test_current_clip = current_clip(test_window);
        REQUIRE(0.0f == rectangle_left(test_current_clip));
        REQUIRE(0.0f == rectangle_top(test_current_clip));
        REQUIRE(250.0 == test_current_clip.width);
        REQUIRE(250.0 == test_current_clip.height);
        pop_clip(test_window);
        auto test_current_clip_after_pop = current_clip(test_window);
        REQUIRE(0.0f == rectangle_left(test_current_clip_after_pop));
        REQUIRE(0.0f == rectangle_top(test_current_clip_after_pop));
        REQUIRE(800.0 == test_current_clip_after_pop.width);
        REQUIRE(600.0 == test_current_clip_after_pop.height);
    }
    TEST_CASE("pop_clip_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        WindowCleanup cleanup_window;
        clear_window(test_window, color_white());
        push_clip(rectangle_from(0.0, 0.0, 250.0, 250.0));
        fill_rectangle(color_red(), 0.0, 0.0, 300.0, 300.0);
        refresh_screen();
        REQUIRE(color_red() == get_pixel(test_window, 125.0, 125.0));
        REQUIRE(color_white() == get_pixel(test_window, 275.0, 275.0));
        pop_clip();
        fill_rectangle(color_green(), 300.0, 300.0, 100.0, 100.0);
        refresh_screen();
        REQUIRE(color_red() == get_pixel(test_window, 125.0, 125.0));
        auto test_color = color_green();
        auto test_pixel = get_pixel(test_window, 350.0, 350.0);
        REQUIRE(red_of(test_color) == red_of(test_pixel));
        REQUIRE(green_of(test_color) == green_of(test_pixel));
        REQUIRE(blue_of(test_color) == blue_of(test_pixel));
        REQUIRE(alpha_of(test_color) == alpha_of(test_pixel));
    }
    TEST_CASE("pop_clip_for_bitmap_integration") {
        auto test_bitmap = create_bitmap(string("test_bitmap"), 100, 100);
        BitmapCleanup cleanup_bitmap;
        clear_bitmap(test_bitmap, color_white());
        push_clip(test_bitmap, rectangle_from(0.0, 0.0, 50.0, 50.0));
        fill_circle(color_black(), 25.0, 25.0, 20.0, option_draw_to(test_bitmap));
        REQUIRE(color_black() == get_pixel(test_bitmap, 25.0, 25.0));
        REQUIRE(color_white() == get_pixel(test_bitmap, 75.0, 75.0));
        pop_clip(test_bitmap);
        auto test_clip = current_clip(test_bitmap);
        REQUIRE(0.0f == rectangle_left(test_clip));
        REQUIRE(0.0f == rectangle_top(test_clip));
        REQUIRE(100.0 == test_clip.width);
        REQUIRE(100.0 == test_clip.height);
    }
    TEST_CASE("push_clip_for_window_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        WindowCleanup cleanup_window;
        auto test_rectangle = rectangle_from(100.0, 100.0, 200.0, 200.0);
        push_clip(test_window, test_rectangle);
        auto test_current_clip = current_clip(test_window);
        REQUIRE(100.0f == rectangle_left(test_current_clip));
        REQUIRE(100.0f == rectangle_top(test_current_clip));
        REQUIRE(200.0 == test_current_clip.width);
        REQUIRE(200.0 == test_current_clip.height);
        refresh_screen();
    }
    TEST_CASE("push_clip_for_bitmap_integration") {
        auto test_bitmap = create_bitmap(string("test_bitmap"), 200, 200);
        BitmapCleanup cleanup_bitmap;
        auto test_rectangle = rectangle_from(50.0, 50.0, 100.0, 100.0);
        push_clip(test_bitmap, test_rectangle);
        auto test_current_clip = current_clip(test_bitmap);
        REQUIRE(50.0f == rectangle_left(test_current_clip));
        REQUIRE(50.0f == rectangle_top(test_current_clip));
        REQUIRE(100.0 == test_current_clip.width);
        REQUIRE(100.0 == test_current_clip.height);
    }
    TEST_CASE("push_clip_integration") {
        open_window(string("Test Window"), 800, 600);
        WindowCleanup cleanup_window;
        auto test_rectangle = rectangle_from(100.0, 100.0, 200.0, 200.0);
        push_clip(test_rectangle);
        auto test_current_clip = current_clip();
        REQUIRE(100.0f == rectangle_left(test_current_clip));
        REQUIRE(100.0f == rectangle_top(test_current_clip));
        REQUIRE(200.0 == test_current_clip.width);
        REQUIRE(200.0 == test_current_clip.height);
    }
    TEST_CASE("reset_clip_for_bitmap_integration") {
        auto test_bitmap = create_bitmap(string("test_bitmap"), 100, 100);
        BitmapCleanup cleanup_bitmap;
        push_clip(test_bitmap, rectangle_from(10.0, 10.0, 50.0, 50.0));
        reset_clip(test_bitmap);
        auto test_clip = current_clip(test_bitmap);
        REQUIRE(0.0f == rectangle_left(test_clip));
        REQUIRE(0.0f == rectangle_top(test_clip));
        REQUIRE(100.0 == test_clip.width);
        REQUIRE(100.0 == test_clip.height);
    }
    TEST_CASE("reset_clip_integration") {
        open_window(string("Test Window"), 800, 600);
        WindowCleanup cleanup_window;
        push_clip(rectangle_from(100.0, 100.0, 200.0, 200.0));
        reset_clip();
        auto test_clip = current_clip();
        REQUIRE(0.0f == rectangle_left(test_clip));
        REQUIRE(0.0f == rectangle_top(test_clip));
        REQUIRE(800.0 == test_clip.width);
        REQUIRE(600.0 == test_clip.height);
    }
    TEST_CASE("reset_clip_for_window_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        WindowCleanup cleanup_window;
        push_clip(test_window, rectangle_from(100.0, 100.0, 200.0, 200.0));
        reset_clip(test_window);
        auto test_clip = current_clip(test_window);
        REQUIRE(0.0f == rectangle_left(test_clip));
        REQUIRE(0.0f == rectangle_top(test_clip));
        REQUIRE(800.0 == test_clip.width);
        REQUIRE(600.0 == test_clip.height);
    }
    TEST_CASE("set_clip_integration") {
        open_window(string("Test Window"), 800, 600);
        WindowCleanup cleanup_window;
        auto test_rectangle = rectangle_from(100.0, 100.0, 200.0, 200.0);
        set_clip(test_rectangle);
        auto test_current_clip = current_clip();
        REQUIRE(100.0f == rectangle_left(test_current_clip));
        REQUIRE(100.0f == rectangle_top(test_current_clip));
        REQUIRE(200.0 == test_current_clip.width);
        REQUIRE(200.0 == test_current_clip.height);
    }
    TEST_CASE("set_clip_for_bitmap_integration") {
        auto test_bitmap = create_bitmap(string("test_bitmap"), 200, 200);
        BitmapCleanup cleanup_bitmap;
        auto test_rectangle = rectangle_from(50.0, 50.0, 100.0, 100.0);
        set_clip(test_bitmap, test_rectangle);
        auto test_current_clip = current_clip(test_bitmap);
        REQUIRE(50.0f == rectangle_left(test_current_clip));
        REQUIRE(50.0f == rectangle_top(test_current_clip));
        REQUIRE(100.0 == test_current_clip.width);
        REQUIRE(100.0 == test_current_clip.height);
    }
    TEST_CASE("set_clip_for_window_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        WindowCleanup cleanup_window;
        auto test_rectangle = rectangle_from(100.0, 100.0, 200.0, 200.0);
        set_clip(test_window, test_rectangle);
        auto test_current_clip = current_clip(test_window);
        REQUIRE(100.0f == rectangle_left(test_current_clip));
        REQUIRE(100.0f == rectangle_top(test_current_clip));
        REQUIRE(200.0 == test_current_clip.width);
        REQUIRE(200.0 == test_current_clip.height);
    }
    TEST_CASE("option_defaults_integration") {
        auto test_options = option_defaults();
        REQUIRE(test_options != nullptr);
    }
    TEST_CASE("option_draw_to_bitmap_integration") {
        auto test_bitmap = create_bitmap(string("test_bitmap"), 100, 100);
        BitmapCleanup cleanup_bitmap;
        clear_bitmap(test_bitmap, color_white());
        auto test_options = option_draw_to(test_bitmap);
        draw_circle(color_black(), circle_at(50.0, 50.0, 25.0), test_options);
        REQUIRE(color_black() == get_pixel(test_bitmap, 75.0, 50.0));
        REQUIRE(color_white() == get_pixel(test_bitmap, 90.0, 90.0));
    }
    TEST_CASE("option_draw_to_bitmap_with_options_integration") {
        auto test_bitmap = create_bitmap(string("test_bitmap"), 100, 100);
        BitmapCleanup cleanup_bitmap;
        clear_bitmap(test_bitmap, color_white());
        auto test_options = option_defaults();
        auto test_drawing_options = option_draw_to(test_bitmap, test_options);
        draw_circle(color_black(), circle_at(50.0, 50.0, 25.0), test_drawing_options);
        REQUIRE(color_black() == get_pixel(test_bitmap, 75.0, 50.0));
        REQUIRE(color_white() == get_pixel(test_bitmap, 90.0, 90.0));
    }
    TEST_CASE("option_draw_to_window_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        WindowCleanup cleanup_window;
        clear_window(test_window, color_white());
        draw_circle(color_black(), circle_at(400.0, 300.0, 50.0), option_draw_to(test_window));
        refresh_screen();
        REQUIRE(color_black() == get_pixel(test_window, 450.0, 300.0));
        REQUIRE(color_white() == get_pixel(test_window, 460.0, 300.0));
    }
    TEST_CASE("option_draw_to_window_with_options_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        WindowCleanup cleanup_window;
        clear_window(test_window, color_white());
        auto test_options = option_defaults();
        draw_circle(color_black(), circle_at(400.0, 300.0, 50.0), option_draw_to(test_window, test_options));
        refresh_screen();
        REQUIRE(color_black() == get_pixel(test_window, 450.0, 300.0));
        REQUIRE(color_white() == get_pixel(test_window, 460.0, 300.0));
    }
    TEST_CASE("option_flip_x_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        WindowCleanup cleanup_window;
        clear_window(test_window, color_white());
        auto test_bitmap = create_bitmap(string("test_bitmap"), 100, 100);
        BitmapCleanup cleanup_bitmap;
        clear_bitmap(test_bitmap, color_white());
        fill_rectangle_on_bitmap(test_bitmap, color_black(), 0.0, 0.0, 50.0, 100.0);
        draw_bitmap(test_bitmap, 100.0, 100.0, option_flip_x());
        refresh_screen();
        REQUIRE(color_black() == get_pixel(test_window, 125.0, 100.0));
        REQUIRE(color_white() == get_pixel(test_window, 75.0, 100.0));
        free_bitmap(test_bitmap);
    }
    TEST_CASE("option_flip_x_with_options_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        WindowCleanup cleanup_window;
        clear_window(test_window, color_white());
        auto test_bitmap = create_bitmap(string("test_bitmap"), 100, 100);
        BitmapCleanup cleanup_bitmap;
        clear_bitmap(test_bitmap, color_white());
        fill_rectangle_on_bitmap(test_bitmap, color_black(), 0.0, 0.0, 50.0, 100.0);
        draw_bitmap(test_bitmap, 400.0, 300.0, option_flip_x(option_defaults()));
        refresh_screen();
        REQUIRE(color_black() == get_pixel(test_window, 425.0, 300.0));
        REQUIRE(color_white() == get_pixel(test_window, 375.0, 300.0));
        free_bitmap(test_bitmap);
    }
    TEST_CASE("option_flip_xy_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        WindowCleanup cleanup_window;
        clear_window(test_window, color_white());
        auto test_bitmap = create_bitmap(string("test_bitmap"), 100, 100);
        BitmapCleanup cleanup_bitmap;
        clear_bitmap(test_bitmap, color_white());
        fill_rectangle_on_bitmap(test_bitmap, color_black(), 0.0, 0.0, 50.0, 50.0);
        draw_bitmap(test_bitmap, 400.0, 300.0, option_flip_xy());
        refresh_screen();
        REQUIRE(color_black() == get_pixel(test_window, 450.0, 350.0));
        REQUIRE(color_white() == get_pixel(test_window, 450.0, 250.0));
        free_bitmap(test_bitmap);
    }
    TEST_CASE("option_flip_xy_with_options_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        WindowCleanup cleanup_window;
        clear_window(test_window, color_white());
        auto test_bitmap = create_bitmap(string("test_bitmap"), 100, 100);
        BitmapCleanup cleanup_bitmap;
        clear_bitmap(test_bitmap, color_white());
        fill_rectangle_on_bitmap(test_bitmap, color_black(), 0.0, 0.0, 50.0, 50.0);
        draw_bitmap(test_bitmap, 400.0, 300.0, option_flip_xy(option_defaults()));
        refresh_screen();
        REQUIRE(color_black() == get_pixel(test_window, 450.0, 350.0));
        REQUIRE(color_white() == get_pixel(test_window, 450.0, 250.0));
        free_bitmap(test_bitmap);
    }
    TEST_CASE("option_flip_y_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        WindowCleanup cleanup_window;
        clear_window(test_window, color_white());
        auto test_bitmap = create_bitmap(string("test_bitmap"), 100, 100);
        BitmapCleanup cleanup_bitmap;
        clear_bitmap(test_bitmap, color_white());
        fill_rectangle_on_bitmap(test_bitmap, color_black(), 0.0, 0.0, 100.0, 50.0);
        draw_bitmap(test_bitmap, 400.0, 300.0, option_flip_y());
        refresh_screen();
        REQUIRE(color_black() == get_pixel(test_window, 400.0, 325.0));
        REQUIRE(color_white() == get_pixel(test_window, 400.0, 275.0));
        free_bitmap(test_bitmap);
    }
    TEST_CASE("option_flip_y_with_options_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        WindowCleanup cleanup_window;
        clear_window(test_window, color_white());
        auto test_bitmap = create_bitmap(string("test_bitmap"), 100, 100);
        BitmapCleanup cleanup_bitmap;
        clear_bitmap(test_bitmap, color_white());
        fill_rectangle_on_bitmap(test_bitmap, color_black(), 0.0, 0.0, 100.0, 50.0);
        draw_bitmap(test_bitmap, 400.0, 300.0, option_flip_y(option_defaults()));
        refresh_screen();
        REQUIRE(color_black() == get_pixel(test_window, 400.0, 325.0));
        REQUIRE(color_white() == get_pixel(test_window, 400.0, 275.0));
        free_bitmap(test_bitmap);
    }
    TEST_CASE("option_line_width_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        WindowCleanup cleanup_window;
        clear_window(test_window, color_white());
        draw_line(color_black(), 100.0, 100.0, 200.0, 200.0, option_line_width(5));
        refresh_screen();
        REQUIRE(color_black() == get_pixel(test_window, 150.0, 150.0));
        REQUIRE(color_white() == get_pixel(test_window, 140.0, 150.0));
    }
    TEST_CASE("option_line_width_with_options_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        WindowCleanup cleanup_window;
        clear_window(test_window, color_white());
        draw_line(color_black(), 100.0, 100.0, 200.0, 200.0, option_line_width(5, option_defaults()));
        refresh_screen();
        REQUIRE(color_black() == get_pixel(test_window, 150.0, 150.0));
        REQUIRE(color_white() == get_pixel(test_window, 145.0, 150.0));
    }
    TEST_CASE("option_part_bmp_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        WindowCleanup cleanup_window;
        clear_window(test_window, color_white());
        auto test_bitmap = create_bitmap(string("test_bitmap"), 100, 100);
        BitmapCleanup cleanup_bitmap;
        clear_bitmap(test_bitmap, color_black());
        draw_bitmap(test_bitmap, 100.0, 100.0, option_part_bmp(0.0, 0.0, 50.0, 50.0));
        refresh_screen();
        REQUIRE(color_black() == get_pixel(test_window, 125.0, 125.0));
        REQUIRE(color_white() == get_pixel(test_window, 175.0, 175.0));
        free_bitmap(test_bitmap);
    }
    TEST_CASE("option_part_bmp_with_options_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        WindowCleanup cleanup_window;
        clear_window(test_window, color_white());
        auto test_bitmap = create_bitmap(string("test_bitmap"), 100, 100);
        BitmapCleanup cleanup_bitmap;
        clear_bitmap(test_bitmap, color_black());
        draw_bitmap(test_bitmap, 100.0, 100.0, option_part_bmp(0.0, 0.0, 50.0, 50.0, option_defaults()));
        refresh_screen();
        REQUIRE(color_black() == get_pixel(test_window, 125.0, 125.0));
        REQUIRE(color_white() == get_pixel(test_window, 175.0, 175.0));
        free_bitmap(test_bitmap);
    }
    TEST_CASE("option_part_bmp_from_rectangle_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        WindowCleanup cleanup_window;
        clear_window(test_window, color_white());
        auto test_bitmap = create_bitmap(string("test_bitmap"), 100, 100);
        BitmapCleanup cleanup_bitmap;
        clear_bitmap(test_bitmap, color_black());
        draw_bitmap(test_bitmap, 0.0, 0.0, option_part_bmp(rectangle_from(0.0, 0.0, 50.0, 50.0)));
        refresh_screen();
        REQUIRE(color_black() == get_pixel(test_window, 25.0, 25.0));
        REQUIRE(color_white() == get_pixel(test_window, 75.0, 75.0));
        free_bitmap(test_bitmap);
    }
    TEST_CASE("option_part_bmp_from_rectangle_with_options_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        WindowCleanup cleanup_window;
        clear_window(test_window, color_white());
        auto test_bitmap = create_bitmap(string("test_bitmap"), 100, 100);
        BitmapCleanup cleanup_bitmap;
        clear_bitmap(test_bitmap, color_black());
        draw_bitmap(test_bitmap, 0.0, 0.0, option_part_bmp(rectangle_from(0.0, 0.0, 50.0, 50.0), option_defaults()));
        refresh_screen();
        REQUIRE(color_black() == get_pixel(test_window, 25.0, 25.0));
        REQUIRE(color_white() == get_pixel(test_window, 75.0, 75.0));
        free_bitmap(test_bitmap);
    }
    TEST_CASE("option_rotate_bmp_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        WindowCleanup cleanup_window;
        clear_window(test_window, color_white());
        auto test_bitmap = create_bitmap(string("test_bitmap"), 100, 100);
        BitmapCleanup cleanup_bitmap;
        clear_bitmap(test_bitmap, color_white());
        fill_rectangle_on_bitmap(test_bitmap, color_black(), 0.0, 0.0, 50.0, 100.0);
        draw_bitmap(test_bitmap, 400.0, 300.0, option_rotate_bmp(90.0));
        refresh_screen();
        REQUIRE(color_black() == get_pixel(test_window, 400.0, 300.0));
        REQUIRE(color_white() == get_pixel(test_window, 400.0, 350.0));
        free_bitmap(test_bitmap);
    }
    TEST_CASE("option_rotate_bmp_with_anchor_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        WindowCleanup cleanup_window;
        clear_window(test_window, color_white());
        auto test_bitmap = create_bitmap(string("test_bitmap"), 100, 100);
        BitmapCleanup cleanup_bitmap;
        clear_bitmap(test_bitmap, color_white());
        fill_rectangle_on_bitmap(test_bitmap, color_black(), 0.0, 0.0, 50.0, 100.0);
        draw_bitmap(test_bitmap, 400.0, 300.0, option_rotate_bmp(90.0, 50.0, 50.0));
        refresh_screen();
        REQUIRE(color_black() == get_pixel(test_window, 500.0, 300.0));
        REQUIRE(color_white() == get_pixel(test_window, 450.0, 300.0));
        free_bitmap(test_bitmap);
    }
    TEST_CASE("option_rotate_bmp_with_anchor_and_options_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        WindowCleanup cleanup_window;
        clear_window(test_window, color_white());
        auto test_bitmap = create_bitmap(string("test_bitmap"), 100, 100);
        BitmapCleanup cleanup_bitmap;
        clear_bitmap(test_bitmap, color_white());
        fill_rectangle_on_bitmap(test_bitmap, color_black(), 0.0, 0.0, 50.0, 100.0);
        draw_bitmap(test_bitmap, 400.0, 300.0, option_rotate_bmp(90.0, 50.0, 50.0, option_defaults()));
        refresh_screen();
        REQUIRE(color_black() == get_pixel(test_window, 500.0, 300.0));
        REQUIRE(color_white() == get_pixel(test_window, 400.0, 300.0));
        free_bitmap(test_bitmap);
    }
    TEST_CASE("option_rotate_bmp_with_options_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        WindowCleanup cleanup_window;
        clear_window(test_window, color_white());
        auto test_bitmap = create_bitmap(string("test_bitmap"), 100, 100);
        BitmapCleanup cleanup_bitmap;
        clear_bitmap(test_bitmap, color_white());
        fill_rectangle_on_bitmap(test_bitmap, color_black(), 0.0, 0.0, 50.0, 100.0);
        draw_bitmap(test_bitmap, 400.0, 300.0, option_rotate_bmp(90.0, option_defaults()));
        refresh_screen();
        REQUIRE(color_black() == get_pixel(test_window, 400.0, 300.0));
        REQUIRE(color_white() == get_pixel(test_window, 400.0, 350.0));
        free_bitmap(test_bitmap);
    }
    TEST_CASE("option_scale_bmp_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        WindowCleanup cleanup_window;
        clear_window(test_window, color_white());
        auto test_bitmap = create_bitmap(string("test_bitmap"), 50, 50);
        BitmapCleanup cleanup_bitmap;
        clear_bitmap(test_bitmap, color_black());
        draw_bitmap(test_bitmap, 400.0, 300.0, option_scale_bmp(2.0, 2.0));
        refresh_screen();
        REQUIRE(color_black() == get_pixel(test_window, 451.0, 300.0));
        REQUIRE(color_white() == get_pixel(test_window, 500.0, 300.0));
        free_bitmap(test_bitmap);
    }
    TEST_CASE("option_scale_bmp_with_options_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        WindowCleanup cleanup_window;
        clear_window(test_window, color_white());
        auto test_bitmap = create_bitmap(string("test_bitmap"), 50, 50);
        BitmapCleanup cleanup_bitmap;
        clear_bitmap(test_bitmap, color_black());
        draw_bitmap(test_bitmap, 400.0, 300.0, option_scale_bmp(2.0, 2.0, option_defaults()));
        refresh_screen();
        REQUIRE(color_black() == get_pixel(test_window, 451.0, 300.0));
        REQUIRE(color_white() == get_pixel(test_window, 500.0, 300.0));
        free_bitmap(test_bitmap);
    }
    TEST_CASE("option_to_screen_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        WindowCleanup cleanup_window;
        clear_window(test_window, color_white());
        draw_circle(color_black(), circle_at(400.0, 300.0, 50.0), option_to_screen());
        refresh_screen();
        REQUIRE(color_black() == get_pixel(test_window, 450.0, 300.0));
        REQUIRE(color_white() == get_pixel(test_window, 451.0, 300.0));
    }
    TEST_CASE("option_to_screen_with_options_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        WindowCleanup cleanup_window;
        clear_window(test_window, color_white());
        draw_circle(color_black(), circle_at(400.0, 300.0, 50.0), option_to_screen(option_defaults()));
        refresh_screen();
        REQUIRE(color_black() == get_pixel(test_window, 400.0, 250.0));
        REQUIRE(color_white() == get_pixel(test_window, 400.0, 300.0));
    }
    TEST_CASE("option_to_world_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        WindowCleanup cleanup_window;
        clear_window(test_window, color_white());
        move_camera_to(100.0, 100.0);
        draw_circle(color_black(), circle_at(400.0, 300.0, 50.0), option_to_world());
        refresh_screen();
        REQUIRE(color_black() == get_pixel(test_window, 350.0, 200.0));
        REQUIRE(color_white() == get_pixel(test_window, 375.0, 200.0));
    }
    TEST_CASE("option_to_world_with_options_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        WindowCleanup cleanup_window;
        clear_window(test_window, color_white());
        move_camera_to(100.0, 100.0);
        draw_circle(color_black(), circle_at(400.0, 300.0, 50.0), option_to_world(option_defaults()));
        refresh_screen();
        REQUIRE(color_black() == get_pixel(test_window, 350.0, 200.0));
        REQUIRE(color_white() == get_pixel(test_window, 375.0, 200.0));
    }
    TEST_CASE("option_with_animation_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        WindowCleanup cleanup_window;
        auto kermit_script = load_animation_script(string("kermit"), string("kermit.txt"));
        AnimationScriptCleanup cleanup_animation_script;
        auto test_animation = create_animation(kermit_script, string("moonwalkback"));
        AnimationCleanup cleanup_animation(test_animation);
        auto test_bitmap = load_bitmap(string("frog"), string("frog.png"));
        BitmapCleanup cleanup_bitmap;
        bitmap_set_cell_details(test_bitmap, 73, 105, 4, 4, 16);
        while (window_close_requested(test_window) == false) {
            clear_screen();
            draw_bitmap(test_bitmap, 100.0, 100.0, option_with_animation(test_animation));
            draw_text(string("Test: option_with_animation. Should be moving. Close when done."), color_black(), 10.0, 10.0);
            update_animation(test_animation);
            delay(100);
            refresh_screen();
        }
    }
    TEST_CASE("option_with_animation_with_options_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        WindowCleanup cleanup_window;
        auto kermit_script = load_animation_script(string("kermit"), string("kermit.txt"));
        AnimationScriptCleanup cleanup_animation_script;
        auto test_animation = create_animation(kermit_script, string("moonwalkback"));
        AnimationCleanup cleanup_animation(test_animation);
        auto test_bitmap = load_bitmap(string("frog"), string("frog.png"));
        BitmapCleanup cleanup_bitmap;
        bitmap_set_cell_details(test_bitmap, 73, 105, 4, 4, 16);
        while (window_close_requested(test_window) == false) {
            clear_screen();
            draw_bitmap(test_bitmap, 100.0, 100.0, option_with_animation(test_animation, option_defaults()));
            draw_text(string("Test: option_with_animation_with_options. Should be moving. Close when done."), color_black(), 10.0, 10.0);
            update_animation(test_animation);
            delay(100);
            refresh_screen();
        }
    }
    TEST_CASE("option_with_bitmap_cell_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        WindowCleanup cleanup_window;
        clear_window(test_window, color_white());
        auto test_bitmap = create_bitmap(string("test_bitmap"), 64, 64);
        BitmapCleanup cleanup_bitmap;
        clear_bitmap(test_bitmap, color_black());
        bitmap_set_cell_details(test_bitmap, 32, 32, 2, 2, 4);
        draw_bitmap(test_bitmap, 100.0, 100.0, option_with_bitmap_cell(1));
        refresh_screen();
        REQUIRE(color_black() == get_pixel(test_window, 116.0, 116.0));
        REQUIRE(color_white() == get_pixel(test_window, 84.0, 84.0));
        free_bitmap(test_bitmap);
    }
    TEST_CASE("option_with_bitmap_cell_with_options_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        WindowCleanup cleanup_window;
        clear_window(test_window, color_white());
        auto test_bitmap = create_bitmap(string("test_bitmap"), 64, 64);
        BitmapCleanup cleanup_bitmap;
        clear_bitmap(test_bitmap, color_black());
        bitmap_set_cell_details(test_bitmap, 32, 32, 2, 2, 4);
        draw_bitmap(test_bitmap, 100.0, 100.0, option_with_bitmap_cell(1, option_defaults()));
        refresh_screen();
        REQUIRE(color_black() == get_pixel(test_window, 116.0, 116.0));
        REQUIRE(color_white() == get_pixel(test_window, 84.0, 84.0));
        free_bitmap(test_bitmap);
    }
    TEST_CASE("draw_ellipse_within_rectangle_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        WindowCleanup cleanup_window;
        clear_window(test_window, color_white());
        draw_ellipse(color_black(), rectangle_from(100.0, 100.0, 200.0, 150.0));
        refresh_screen();
        REQUIRE(color_black() == get_pixel(test_window, 300.0, 175.0));
        REQUIRE(color_white() == get_pixel(test_window, 200.0, 175.0));
        REQUIRE(color_white() == get_pixel(test_window, 350.0, 175.0));
    }
    TEST_CASE("draw_ellipse_within_rectangle_with_options_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        WindowCleanup cleanup_window;
        clear_window(test_window, color_white());
        draw_ellipse(color_black(), rectangle_from(100.0, 100.0, 200.0, 100.0), option_defaults());
        refresh_screen();
        REQUIRE(color_black() == get_pixel(test_window, 300.0, 150.0));
        REQUIRE(color_white() == get_pixel(test_window, 200.0, 150.0));
        REQUIRE(color_white() == get_pixel(test_window, 350.0, 150.0));
    }
    TEST_CASE("draw_ellipse_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        WindowCleanup cleanup_window;
        clear_window(test_window, color_white());
        draw_ellipse(color_black(), 400.0, 300.0, 100.0, 50.0);
        refresh_screen();
        REQUIRE(color_black() == get_pixel(test_window, 450.0, 300.0));
        REQUIRE(color_white() == get_pixel(test_window, 400.0, 300.0));
        REQUIRE(color_white() == get_pixel(test_window, 500.0, 300.0));
    }
    TEST_CASE("draw_ellipse_with_options_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        WindowCleanup cleanup_window;
        clear_window(test_window, color_white());
        draw_ellipse(color_black(), 400.0, 300.0, 100.0, 50.0, option_defaults());
        refresh_screen();
        REQUIRE(color_black() == get_pixel(test_window, 450.0, 300.0));
        REQUIRE(color_white() == get_pixel(test_window, 400.0, 300.0));
        REQUIRE(color_white() == get_pixel(test_window, 500.0, 300.0));
    }
    TEST_CASE("draw_ellipse_on_bitmap_within_rectangle_integration") {
        auto test_bitmap = create_bitmap(string("test_bitmap"), 200, 200);
        BitmapCleanup cleanup_bitmap;
        clear_bitmap(test_bitmap, color_white());
        auto rect = rectangle_from(50.0, 50.0, 100.0, 100.0);
        draw_ellipse_on_bitmap(test_bitmap, color_black(), rect);
        REQUIRE(color_black() == get_pixel(test_bitmap, 150.0, 100.0));
        REQUIRE(color_white() == get_pixel(test_bitmap, 125.0, 100.0));
        REQUIRE(color_white() == get_pixel(test_bitmap, 175.0, 100.0));
    }
    TEST_CASE("draw_ellipse_on_bitmap_within_rectangle_with_options_integration") {
        auto test_bitmap = create_bitmap(string("test_bitmap"), 200, 200);
        BitmapCleanup cleanup_bitmap;
        clear_bitmap(test_bitmap, color_white());
        draw_ellipse_on_bitmap(test_bitmap, color_black(), rectangle_from(50.0, 50.0, 100.0, 100.0), option_defaults());
        REQUIRE(color_black() == get_pixel(test_bitmap, 150.0, 100.0));
        REQUIRE(color_white() == get_pixel(test_bitmap, 125.0, 100.0));
        REQUIRE(color_white() == get_pixel(test_bitmap, 175.0, 100.0));
    }
    TEST_CASE("draw_ellipse_on_bitmap_integration") {
        auto test_bitmap = create_bitmap(string("test_bitmap"), 200, 200);
        BitmapCleanup cleanup_bitmap;
        clear_bitmap(test_bitmap, color_white());
        draw_ellipse_on_bitmap(test_bitmap, color_black(), 100.0, 100.0, 50.0, 30.0);
        REQUIRE(color_black() == get_pixel(test_bitmap, 125.0, 100.0));
        REQUIRE(color_white() == get_pixel(test_bitmap, 100.0, 100.0));
        REQUIRE(color_white() == get_pixel(test_bitmap, 160.0, 100.0));
    }
    TEST_CASE("draw_ellipse_on_bitmap_with_options_integration") {
        auto test_bitmap = create_bitmap(string("test_bitmap"), 200, 200);
        BitmapCleanup cleanup_bitmap;
        clear_bitmap(test_bitmap, color_white());
        draw_ellipse_on_bitmap(test_bitmap, color_black(), 100.0, 100.0, 50.0, 30.0, option_defaults());
        REQUIRE(color_black() == get_pixel(test_bitmap, 125.0, 100.0));
        REQUIRE(color_white() == get_pixel(test_bitmap, 100.0, 100.0));
        REQUIRE(color_white() == get_pixel(test_bitmap, 160.0, 100.0));
    }
    TEST_CASE("draw_ellipse_on_window_within_rectangle_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        WindowCleanup cleanup_window;
        clear_window(test_window, color_white());
        auto rect = rectangle_from(100.0, 100.0, 200.0, 100.0);
        draw_ellipse_on_window(test_window, color_black(), rect);
        refresh_screen();
        REQUIRE(color_black() == get_pixel(test_window, 300.0, 150.0));
        REQUIRE(color_white() == get_pixel(test_window, 250.0, 150.0));
        REQUIRE(color_white() == get_pixel(test_window, 350.0, 150.0));
    }
    TEST_CASE("draw_ellipse_on_window_within_rectangle_with_options_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        WindowCleanup cleanup_window;
        clear_window(test_window, color_white());
        auto rect = rectangle_from(100.0, 100.0, 200.0, 100.0);
        draw_ellipse_on_window(test_window, color_black(), rect, option_defaults());
        refresh_screen();
        REQUIRE(color_black() == get_pixel(test_window, 300.0, 150.0));
        REQUIRE(color_white() == get_pixel(test_window, 250.0, 150.0));
        REQUIRE(color_white() == get_pixel(test_window, 350.0, 150.0));
    }
    TEST_CASE("draw_ellipse_on_window_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        WindowCleanup cleanup_window;
        clear_window(test_window, color_white());
        draw_ellipse_on_window(test_window, color_black(), 400.0, 300.0, 100.0, 50.0);
        refresh_screen();
        REQUIRE(color_black() == get_pixel(test_window, 450.0, 300.0));
        REQUIRE(color_white() == get_pixel(test_window, 400.0, 300.0));
        REQUIRE(color_white() == get_pixel(test_window, 500.0, 300.0));
    }
    TEST_CASE("draw_ellipse_on_window_with_options_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        WindowCleanup cleanup_window;
        clear_window(test_window, color_white());
        draw_ellipse_on_window(test_window, color_black(), 400.0, 300.0, 100.0, 50.0, option_defaults());
        refresh_screen();
        REQUIRE(color_black() == get_pixel(test_window, 450.0, 300.0));
        REQUIRE(color_white() == get_pixel(test_window, 450.0, 325.0));
        REQUIRE(color_white() == get_pixel(test_window, 500.0, 300.0));
    }
    TEST_CASE("fill_ellipse_within_rectangle_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        WindowCleanup cleanup_window;
        clear_window(test_window, color_white());
        fill_ellipse(color_black(), rectangle_from(100.0, 100.0, 200.0, 100.0));
        refresh_screen();
        REQUIRE(color_black() == get_pixel(test_window, 200.0, 100.0));
        REQUIRE(color_black() == get_pixel(test_window, 150.0, 150.0));
        REQUIRE(color_white() == get_pixel(test_window, 50.0, 50.0));
    }
    TEST_CASE("fill_ellipse_within_rectangle_with_options_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        WindowCleanup cleanup_window;
        clear_window(test_window, color_white());
        fill_ellipse(color_black(), rectangle_from(100.0, 100.0, 200.0, 100.0), option_defaults());
        refresh_screen();
        REQUIRE(color_black() == get_pixel(test_window, 200.0, 100.0));
        REQUIRE(color_black() == get_pixel(test_window, 150.0, 150.0));
        REQUIRE(color_white() == get_pixel(test_window, 50.0, 50.0));
    }
    TEST_CASE("fill_ellipse_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        WindowCleanup cleanup_window;
        clear_window(test_window, color_white());
        fill_ellipse(color_black(), 400.0, 300.0, 100.0, 50.0);
        refresh_screen();
        REQUIRE(color_black() == get_pixel(test_window, 450.0, 300.0));
        REQUIRE(color_black() == get_pixel(test_window, 450.0, 325.0));
        REQUIRE(color_white() == get_pixel(test_window, 500.0, 300.0));
    }
    TEST_CASE("fill_ellipse_with_options_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        WindowCleanup cleanup_window;
        clear_window(test_window, color_white());
        fill_ellipse(color_black(), 400.0, 300.0, 100.0, 50.0, option_defaults());
        refresh_screen();
        REQUIRE(color_black() == get_pixel(test_window, 450.0, 300.0));
        REQUIRE(color_black() == get_pixel(test_window, 450.0, 325.0));
        REQUIRE(color_white() == get_pixel(test_window, 300.0, 300.0));
    }
    TEST_CASE("fill_ellipse_on_bitmap_within_rectangle_integration") {
        auto test_bitmap = create_bitmap(string("test_bitmap"), 200, 200);
        BitmapCleanup cleanup_bitmap;
        clear_bitmap(test_bitmap, color_white());
        fill_ellipse_on_bitmap(test_bitmap, color_black(), rectangle_from(50.0, 50.0, 100.0, 100.0));
        REQUIRE(color_black() == get_pixel(test_bitmap, 100.0, 100.0));
        REQUIRE(color_black() == get_pixel(test_bitmap, 75.0, 75.0));
        REQUIRE(color_white() == get_pixel(test_bitmap, 175.0, 175.0));
    }
    TEST_CASE("fill_ellipse_on_bitmap_within_rectangle_with_options_integration") {
        auto test_bitmap = create_bitmap(string("test_bitmap"), 200, 200);
        BitmapCleanup cleanup_bitmap;
        clear_bitmap(test_bitmap, color_white());
        fill_ellipse_on_bitmap(test_bitmap, color_black(), rectangle_from(50.0, 50.0, 100.0, 100.0), option_defaults());
        REQUIRE(color_black() == get_pixel(test_bitmap, 100.0, 100.0));
        REQUIRE(color_black() == get_pixel(test_bitmap, 75.0, 75.0));
        REQUIRE(color_white() == get_pixel(test_bitmap, 175.0, 175.0));
    }
    TEST_CASE("fill_ellipse_on_bitmap_integration") {
        auto test_bitmap = create_bitmap(string("test_bitmap"), 200, 200);
        BitmapCleanup cleanup_bitmap;
        clear_bitmap(test_bitmap, color_white());
        fill_ellipse_on_bitmap(test_bitmap, color_black(), 100.0, 100.0, 50.0, 30.0);
        REQUIRE(color_black() == get_pixel(test_bitmap, 125.0, 100.0));
        REQUIRE(color_black() == get_pixel(test_bitmap, 125.0, 125.0));
        REQUIRE(color_white() == get_pixel(test_bitmap, 150.0, 100.0));
    }
    TEST_CASE("fill_ellipse_on_bitmap_with_options_integration") {
        auto test_bitmap = create_bitmap(string("test_bitmap"), 200, 200);
        BitmapCleanup cleanup_bitmap;
        clear_bitmap(test_bitmap, color_white());
        fill_ellipse_on_bitmap(test_bitmap, color_black(), 50.0, 50.0, 100.0, 50.0, option_defaults());
        REQUIRE(color_black() == get_pixel(test_bitmap, 100.0, 50.0));
        REQUIRE(color_black() == get_pixel(test_bitmap, 100.0, 75.0));
        REQUIRE(color_white() == get_pixel(test_bitmap, 150.0, 50.0));
    }
    TEST_CASE("fill_ellipse_on_window_within_rectangle_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        WindowCleanup cleanup_window;
        clear_window(test_window, color_white());
        fill_ellipse_on_window(test_window, color_black(), rectangle_from(100.0, 100.0, 200.0, 150.0));
        refresh_screen();
        REQUIRE(color_black() == get_pixel(test_window, 200.0, 175.0));
        REQUIRE(color_black() == get_pixel(test_window, 150.0, 175.0));
        REQUIRE(color_white() == get_pixel(test_window, 350.0, 175.0));
    }
    TEST_CASE("fill_ellipse_on_window_within_rectangle_with_options_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        WindowCleanup cleanup_window;
        clear_window(test_window, color_white());
        fill_ellipse_on_window(test_window, color_black(), rectangle_from(100.0, 100.0, 200.0, 150.0), option_defaults());
        refresh_screen();
        REQUIRE(color_black() == get_pixel(test_window, 200.0, 175.0));
        REQUIRE(color_black() == get_pixel(test_window, 150.0, 175.0));
        REQUIRE(color_white() == get_pixel(test_window, 350.0, 175.0));
    }
    TEST_CASE("fill_ellipse_on_window_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        WindowCleanup cleanup_window;
        clear_window(test_window, color_white());
        fill_ellipse_on_window(test_window, color_black(), 400.0, 300.0, 100.0, 50.0);
        refresh_screen();
        REQUIRE(color_black() == get_pixel(test_window, 450.0, 300.0));
        REQUIRE(color_black() == get_pixel(test_window, 450.0, 325.0));
        REQUIRE(color_white() == get_pixel(test_window, 500.0, 300.0));
    }
    TEST_CASE("fill_ellipse_on_window_with_options_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        WindowCleanup cleanup_window;
        clear_window(test_window, color_white());
        fill_ellipse_on_window(test_window, color_black(), 400.0, 300.0, 100.0, 50.0, option_defaults());
        refresh_screen();
        REQUIRE(color_black() == get_pixel(test_window, 450.0, 300.0));
        REQUIRE(color_black() == get_pixel(test_window, 450.0, 325.0));
        REQUIRE(color_white() == get_pixel(test_window, 500.0, 300.0));
    }
    TEST_CASE("clear_screen_to_white_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        WindowCleanup cleanup_window;
        draw_pixel(color_black(), 100.0, 100.0);
        refresh_screen();
        REQUIRE(color_black() == get_pixel(test_window, 100.0, 100.0));
        clear_screen();
        refresh_screen();
        REQUIRE(color_white() == get_pixel(test_window, 100.0, 100.0));
    }
    TEST_CASE("clear_screen_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        WindowCleanup cleanup_window;
        draw_pixel(color_black(), 100.0, 100.0);
        refresh_screen();
        REQUIRE(color_black() == get_pixel(test_window, 100.0, 100.0));
        clear_screen(color_white());
        refresh_screen();
        REQUIRE(color_white() == get_pixel(test_window, 100.0, 100.0));
    }
    TEST_CASE("display_details_integration") {
        auto displays = number_of_displays();
        REQUIRE(displays > 0);
        auto display = display_details(0u);
        REQUIRE(display != nullptr);
        REQUIRE(display_width(display) > 0);
        REQUIRE(display_height(display) > 0);
        REQUIRE(!display_name(display).empty());
    }
    TEST_CASE("display_height_integration") {
        auto display = display_details(0u);
        REQUIRE(display_height(display) > 0);
    }
    TEST_CASE("display_name_integration") {
        auto display = display_details(0u);
        REQUIRE(!display_name(display).empty());
        REQUIRE(!display_name(display).empty());
    }
    TEST_CASE("display_width_integration") {
        auto display = display_details(0u);
        REQUIRE(display_width(display) > 0);
    }
    TEST_CASE("display_x_integration") {
        auto display = display_details(0u);
        REQUIRE(0 == display_x(display));
    }
    TEST_CASE("display_y_integration") {
        auto display = display_details(0u);
        REQUIRE(0 == display_y(display));
    }
    TEST_CASE("number_of_displays_integration") {
        REQUIRE(number_of_displays() > 0);
    }
    TEST_CASE("refresh_screen_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        WindowCleanup cleanup_window;
        clear_window(test_window, color_white());
        draw_circle(color_black(), circle_at(400.0, 300.0, 50.0));
        refresh_screen();
    }
    TEST_CASE("refresh_screen_with_target_fps_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        WindowCleanup cleanup_window;
        clear_window(test_window, color_white());
        draw_circle(color_black(), circle_at(400.0, 300.0, 50.0));
        refresh_screen(60u);
    }
    TEST_CASE("save_bitmap_integration") {
        auto test_bitmap = create_bitmap(string("test_bitmap"), 100, 100);
        BitmapCleanup cleanup_bitmap;
        clear_bitmap(test_bitmap, color_white());
        draw_pixel_on_bitmap(test_bitmap, color_black(), 50.0, 50.0);
        save_bitmap(test_bitmap, string("test_bitmap"));
    }
    TEST_CASE("screen_height_integration") {
        open_window(string("Test Window"), 800, 600);
        WindowCleanup cleanup_window;
        REQUIRE(600 == screen_height());
    }
    TEST_CASE("screen_width_integration") {
        open_window(string("Test Window"), 800, 600);
        WindowCleanup cleanup_window;
        REQUIRE(800 == screen_width());
    }
    TEST_CASE("take_screenshot_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        WindowCleanup cleanup_window;
        clear_window(test_window, color_white());
        draw_circle(color_black(), circle_at(400.0, 300.0, 50.0));
        refresh_screen();
        take_screenshot(string("test_screenshot"));
    }
    TEST_CASE("take_screenshot_of_window_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        WindowCleanup cleanup_window;
        clear_window(test_window, color_white());
        draw_circle(color_black(), circle_at(400.0, 300.0, 50.0));
        refresh_screen();
        take_screenshot(test_window, string("test_screenshot"));
    }
    TEST_CASE("bitmap_bounding_circle_integration") {
        auto test_bitmap = create_bitmap(string("test_bitmap"), 100, 100);
        BitmapCleanup cleanup_bitmap;
        auto test_point = point_at(50.0, 50.0);
        auto bounding_circle = bitmap_bounding_circle(test_bitmap, test_point);
        REQUIRE(test_point == center_point(bounding_circle));
        REQUIRE(100.0f == circle_radius(bounding_circle));
    }
    TEST_CASE("bitmap_bounding_rectangle_integration") {
        auto test_bitmap = create_bitmap(string("test_bitmap"), 100, 100);
        BitmapCleanup cleanup_bitmap;
        auto bounding_rect = bitmap_bounding_rectangle(test_bitmap);
        REQUIRE(0.0 == bounding_rect.x);
        REQUIRE(0.0 == bounding_rect.y);
        REQUIRE(100.0 == bounding_rect.width);
        REQUIRE(100.0 == bounding_rect.height);
    }
    TEST_CASE("bitmap_bounding_rectangle_at_location_integration") {
        auto test_bitmap = create_bitmap(string("test_bitmap"), 100, 100);
        BitmapCleanup cleanup_bitmap;
        auto bounding_rect = bitmap_bounding_rectangle(test_bitmap, 50.0, 50.0);
        REQUIRE(50.0 == bounding_rect.x);
        REQUIRE(50.0 == bounding_rect.y);
        REQUIRE(100.0 == bounding_rect.width);
        REQUIRE(100.0 == bounding_rect.height);
    }
    TEST_CASE("bitmap_cell_center_integration") {
        auto test_bitmap = create_bitmap(string("test_bitmap"), 100, 100);
        BitmapCleanup cleanup_bitmap;
        auto center = bitmap_cell_center(test_bitmap);
        REQUIRE(50.0 == center.x);
        REQUIRE(50.0 == center.y);
    }
    TEST_CASE("bitmap_cell_circle_integration") {
        auto test_bitmap = create_bitmap(string("test_bitmap"), 100, 100);
        BitmapCleanup cleanup_bitmap;
        bitmap_set_cell_details(test_bitmap, 50, 50, 2, 2, 4);
        auto circle = bitmap_cell_circle(test_bitmap, 50.0, 50.0);
        REQUIRE(50.0 == circle.center.x);
        REQUIRE(50.0 == circle.center.x);
        REQUIRE(25.0 == circle.radius);
    }
    TEST_CASE("bitmap_cell_circle_at_point_integration") {
        auto test_bitmap = create_bitmap(string("test_bitmap"), 100, 100);
        BitmapCleanup cleanup_bitmap;
        bitmap_set_cell_details(test_bitmap, 50, 50, 2, 2, 4);
        auto circle = bitmap_cell_circle(test_bitmap, point_at(100.0, 100.0));
        REQUIRE(100.0 == circle.center.x);
        REQUIRE(100.0 == circle.center.x);
        REQUIRE(25.0 == circle.radius);
    }
    TEST_CASE("bitmap_cell_circle_at_point_with_scale_integration") {
        auto test_bitmap = create_bitmap(string("test_bitmap"), 100, 100);
        BitmapCleanup cleanup_bitmap;
        bitmap_set_cell_details(test_bitmap, 50, 50, 2, 2, 4);
        auto circle = bitmap_cell_circle(test_bitmap, point_at(100.0, 100.0), 2.0);
        REQUIRE(100.0 == circle.center.x);
        REQUIRE(100.0 == circle.center.x);
        REQUIRE(50.0 == circle.radius);
    }
    TEST_CASE("bitmap_cell_columns_integration") {
        auto test_bitmap = create_bitmap(string("test_bitmap"), 100, 100);
        BitmapCleanup cleanup_bitmap;
        bitmap_set_cell_details(test_bitmap, 20, 20, 5, 5, 25);
        REQUIRE(5 == bitmap_cell_columns(test_bitmap));
    }
    TEST_CASE("bitmap_cell_count_integration") {
        auto test_bitmap = create_bitmap(string("test_bitmap"), 100, 100);
        BitmapCleanup cleanup_bitmap;
        bitmap_set_cell_details(test_bitmap, 20, 20, 5, 5, 25);
        REQUIRE(25 == bitmap_cell_count(test_bitmap));
    }
    TEST_CASE("bitmap_cell_height_integration") {
        auto test_bitmap = create_bitmap(string("test_bitmap"), 100, 100);
        BitmapCleanup cleanup_bitmap;
        bitmap_set_cell_details(test_bitmap, 20, 20, 5, 5, 25);
        REQUIRE(20 == bitmap_cell_height(test_bitmap));
    }
    TEST_CASE("bitmap_cell_offset_integration") {
        auto test_bitmap = create_bitmap(string("test_bitmap"), 100, 100);
        BitmapCleanup cleanup_bitmap;
        bitmap_set_cell_details(test_bitmap, 25, 25, 4, 4, 16);
        auto offset = bitmap_cell_offset(test_bitmap, 5);
        REQUIRE(25.0 == offset.x);
        REQUIRE(25.0 == offset.y);
    }
    TEST_CASE("bitmap_cell_rectangle_integration") {
        auto test_bitmap = create_bitmap(string("test_bitmap"), 100, 100);
        BitmapCleanup cleanup_bitmap;
        bitmap_set_cell_details(test_bitmap, 25, 25, 4, 4, 16);
        auto rect = bitmap_cell_rectangle(test_bitmap);
        REQUIRE(0.0 == rect.x);
        REQUIRE(0.0 == rect.y);
        REQUIRE(25.0 == rect.width);
        REQUIRE(25.0 == rect.height);
    }
    TEST_CASE("bitmap_cell_rectangle_at_point_integration") {
        auto test_bitmap = create_bitmap(string("test_bitmap"), 100, 100);
        BitmapCleanup cleanup_bitmap;
        bitmap_set_cell_details(test_bitmap, 25, 25, 4, 4, 16);
        auto rect = bitmap_cell_rectangle(test_bitmap, point_at(50.0, 50.0));
        REQUIRE(50.0 == rect.x);
        REQUIRE(50.0 == rect.y);
        REQUIRE(25.0 == rect.width);
        REQUIRE(25.0 == rect.height);
    }
    TEST_CASE("bitmap_cell_rows_integration") {
        auto test_bitmap = create_bitmap(string("test_bitmap"), 100, 100);
        BitmapCleanup cleanup_bitmap;
        bitmap_set_cell_details(test_bitmap, 20, 20, 5, 5, 25);
        REQUIRE(5 == bitmap_cell_rows(test_bitmap));
    }
    TEST_CASE("bitmap_cell_width_integration") {
        auto test_bitmap = create_bitmap(string("test_bitmap"), 100, 100);
        BitmapCleanup cleanup_bitmap;
        bitmap_set_cell_details(test_bitmap, 25, 25, 4, 4, 16);
        REQUIRE(25 == bitmap_cell_width(test_bitmap));
    }
    TEST_CASE("bitmap_center_integration") {
        auto test_bitmap = create_bitmap(string("test_bitmap"), 100, 100);
        BitmapCleanup cleanup_bitmap;
        auto test_center = bitmap_center(test_bitmap);
        REQUIRE(50.0 == test_center.x);
        REQUIRE(50.0 == test_center.y);
    }
    TEST_CASE("bitmap_filename_integration") {
        auto test_bitmap = create_bitmap(string("test_bitmap"), 100, 100);
        BitmapCleanup cleanup_bitmap;
        REQUIRE(string("") == bitmap_filename(test_bitmap));
    }
    TEST_CASE("bitmap_height_integration") {
        auto test_bitmap = create_bitmap(string("test_bitmap"), 100, 100);
        BitmapCleanup cleanup_bitmap;
        REQUIRE(100 == bitmap_height(test_bitmap));
    }
    TEST_CASE("bitmap_height_of_bitmap_named_integration") {
        create_bitmap(string("bitmap_height"), 100, 100);
        BitmapCleanup cleanup_bitmap;
        REQUIRE(100 == bitmap_height(string("bitmap_height")));
    }
    TEST_CASE("bitmap_name_integration") {
        auto test_bitmap = create_bitmap(string("bitmap_name"), 100, 100);
        BitmapCleanup cleanup_bitmap;
        REQUIRE(string("bitmap_name") == bitmap_name(test_bitmap));
    }
    TEST_CASE("bitmap_named_integration") {
        create_bitmap(string("test_bitmap"), 100, 100);
        BitmapCleanup cleanup_bitmap;
        REQUIRE(bitmap_named(string("test_bitmap")) != nullptr);
        REQUIRE(bitmap_named(string("nonexistent_bitmap")) == nullptr);
    }
    TEST_CASE("bitmap_rectangle_of_cell_integration") {
        auto test_bitmap = create_bitmap(string("test_bitmap"), 100, 100);
        BitmapCleanup cleanup_bitmap;
        bitmap_set_cell_details(test_bitmap, 25, 25, 4, 4, 16);
        auto rect = bitmap_rectangle_of_cell(test_bitmap, 5);
        REQUIRE(25.0 == rect.x);
        REQUIRE(25.0 == rect.y);
        REQUIRE(25.0 == rect.width);
        REQUIRE(25.0 == rect.height);
    }
    TEST_CASE("bitmap_set_cell_details_integration") {
        auto test_bitmap = create_bitmap(string("test_bitmap"), 100, 100);
        BitmapCleanup cleanup_bitmap;
        bitmap_set_cell_details(test_bitmap, 20, 20, 5, 5, 25);
        REQUIRE(20 == bitmap_cell_width(test_bitmap));
        REQUIRE(20 == bitmap_cell_height(test_bitmap));
        REQUIRE(5 == bitmap_cell_columns(test_bitmap));
        REQUIRE(5 == bitmap_cell_rows(test_bitmap));
        REQUIRE(25 == bitmap_cell_count(test_bitmap));
    }
    TEST_CASE("bitmap_valid_integration") {
        auto test_bitmap = create_bitmap(string("test_bitmap"), 100, 100);
        BitmapCleanup cleanup_bitmap;
        REQUIRE(bitmap_valid(test_bitmap));
        free_bitmap(test_bitmap);
        REQUIRE_FALSE(bitmap_valid(test_bitmap));
    }
    TEST_CASE("bitmap_width_integration") {
        auto test_bitmap = create_bitmap(string("test_bitmap"), 100, 100);
        BitmapCleanup cleanup_bitmap;
        REQUIRE(100 == bitmap_width(test_bitmap));
    }
    TEST_CASE("bitmap_width_of_bitmap_named_integration") {
        create_bitmap(string("bitmap_width"), 100, 100);
        BitmapCleanup cleanup_bitmap;
        REQUIRE(100 == bitmap_width(string("bitmap_width")));
    }
    TEST_CASE("clear_bitmap_integration") {
        auto test_bitmap = create_bitmap(string("test_bitmap"), 100, 100);
        BitmapCleanup cleanup_bitmap;
        draw_pixel_on_bitmap(test_bitmap, color_black(), 50.0, 50.0);
        REQUIRE(color_black() == get_pixel(test_bitmap, 50.0, 50.0));
        clear_bitmap(test_bitmap, color_white());
        REQUIRE(color_white() == get_pixel(test_bitmap, 50.0, 50.0));
    }
    TEST_CASE("clear_bitmap_named_integration") {
        auto test_bitmap = create_bitmap(string("bitmap_named"), 100, 100);
        BitmapCleanup cleanup_bitmap;
        fill_rectangle_on_bitmap(test_bitmap, color_red(), 0.0, 0.0, 100.0, 100.0);
        REQUIRE(color_red() == get_pixel(test_bitmap, 50.0, 50.0));
        clear_bitmap(string("bitmap_named"), color_white());
        REQUIRE(color_white() == get_pixel(test_bitmap, 50.0, 50.0));
    }
    TEST_CASE("create_bitmap_integration") {
        auto test_bitmap = create_bitmap(string("bitmap_name1"), 100, 100);
        BitmapCleanup cleanup_bitmap;
        REQUIRE(test_bitmap != nullptr);
        REQUIRE(100 == bitmap_width(test_bitmap));
        REQUIRE(100 == bitmap_height(test_bitmap));
        REQUIRE(string("bitmap_name1") == bitmap_name(test_bitmap));
    }
    TEST_CASE("draw_bitmap_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        WindowCleanup cleanup_window;
        auto test_bitmap = create_bitmap(string("test_bitmap"), 100, 100);
        BitmapCleanup cleanup_bitmap;
        clear_window(test_window, color_white());
        fill_rectangle_on_bitmap(test_bitmap, color_red(), 0.0, 0.0, 50.0, 50.0);
        draw_bitmap(test_bitmap, 100.0, 100.0);
        refresh_screen();
        REQUIRE(color_red() == get_pixel(test_window, 125.0, 125.0));
        REQUIRE(color_white() == get_pixel(test_window, 175.0, 175.0));
        free_bitmap(test_bitmap);
    }
    TEST_CASE("draw_bitmap_with_options_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        WindowCleanup cleanup_window;
        auto test_bitmap = create_bitmap(string("test_bitmap"), 100, 100);
        BitmapCleanup cleanup_bitmap;
        clear_window(test_window, color_white());
        fill_rectangle_on_bitmap(test_bitmap, color_red(), 0.0, 0.0, 100.0, 100.0);
        draw_bitmap(test_bitmap, 100.0, 100.0, option_defaults());
        refresh_screen();
        REQUIRE(color_red() == get_pixel(test_window, 125.0, 125.0));
        REQUIRE(color_white() == get_pixel(test_window, 50.0, 50.0));
        free_bitmap(test_bitmap);
    }
    TEST_CASE("draw_bitmap_named_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        WindowCleanup cleanup_window;
        auto test_bitmap = create_bitmap(string("test_bitmap"), 100, 100);
        BitmapCleanup cleanup_bitmap;
        clear_window(test_window, color_white());
        fill_rectangle_on_bitmap(test_bitmap, color_red(), 0.0, 0.0, 100.0, 100.0);
        draw_bitmap(string("test_bitmap"), 100.0, 100.0);
        refresh_screen();
        REQUIRE(color_red() == get_pixel(test_window, 125.0, 125.0));
        REQUIRE(color_white() == get_pixel(test_window, 50.0, 50.0));
        free_bitmap(test_bitmap);
    }
    TEST_CASE("draw_bitmap_named_with_options_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        WindowCleanup cleanup_window;
        auto test_bitmap = create_bitmap(string("test_bitmap"), 100, 100);
        BitmapCleanup cleanup_bitmap;
        clear_window(test_window, color_white());
        fill_rectangle_on_bitmap(test_bitmap, color_red(), 0.0, 0.0, 100.0, 100.0);
        draw_bitmap(string("test_bitmap"), 100.0, 100.0, option_defaults());
        refresh_screen();
        REQUIRE(color_red() == get_pixel(test_window, 125.0, 125.0));
        REQUIRE(color_white() == get_pixel(test_window, 50.0, 50.0));
        free_bitmap(test_bitmap);
    }
    TEST_CASE("draw_bitmap_on_bitmap_on_bitmap_integration") {
        auto dest_bitmap = create_bitmap(string("test_destination"), 100, 100);
        BitmapCleanup cleanup_bitmap;
        auto source_bitmap = create_bitmap(string("test_source"), 50, 50);
        clear_bitmap(dest_bitmap, color_white());
        fill_rectangle_on_bitmap(source_bitmap, color_red(), 0.0, 0.0, 50.0, 50.0);
        draw_bitmap_on_bitmap(dest_bitmap, source_bitmap, 25.0, 25.0);
        REQUIRE(color_red() == get_pixel(dest_bitmap, 50.0, 50.0));
        REQUIRE(color_white() == get_pixel(dest_bitmap, 10.0, 10.0));
    }
    TEST_CASE("draw_bitmap_on_bitmap_on_bitmap_with_options_integration") {
        auto dest_bitmap = create_bitmap(string("test_destination"), 100, 100);
        BitmapCleanup cleanup_bitmap;
        auto source_bitmap = create_bitmap(string("test_source"), 50, 50);
        clear_bitmap(dest_bitmap, color_white());
        fill_rectangle_on_bitmap(source_bitmap, color_red(), 0.0, 0.0, 50.0, 50.0);
        draw_bitmap_on_bitmap(dest_bitmap, source_bitmap, 25.0, 25.0, option_defaults());
        REQUIRE(color_red() == get_pixel(dest_bitmap, 50.0, 50.0));
        REQUIRE(color_white() == get_pixel(dest_bitmap, 10.0, 10.0));
    }
    TEST_CASE("draw_bitmap_on_window_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        WindowCleanup cleanup_window;
        auto test_bitmap = create_bitmap(string("test_bitmap"), 100, 100);
        BitmapCleanup cleanup_bitmap;
        clear_window(test_window, color_white());
        fill_rectangle_on_bitmap(test_bitmap, color_red(), 0.0, 0.0, 100.0, 100.0);
        draw_bitmap_on_window(test_window, test_bitmap, 100.0, 100.0);
        refresh_screen();
        REQUIRE(color_red() == get_pixel(test_window, 125.0, 125.0));
        REQUIRE(color_white() == get_pixel(test_window, 50.0, 50.0));
        free_bitmap(test_bitmap);
    }
    TEST_CASE("draw_bitmap_on_window_with_options_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        WindowCleanup cleanup_window;
        auto test_bitmap = create_bitmap(string("test_bitmap"), 100, 100);
        BitmapCleanup cleanup_bitmap;
        clear_window(test_window, color_white());
        fill_rectangle_on_bitmap(test_bitmap, color_red(), 0.0, 0.0, 100.0, 100.0);
        draw_bitmap_on_window(test_window, test_bitmap, 100.0, 100.0, option_defaults());
        refresh_screen();
        REQUIRE(color_red() == get_pixel(test_window, 125.0, 125.0));
        REQUIRE(color_white() == get_pixel(test_window, 50.0, 50.0));
        free_bitmap(test_bitmap);
    }
    TEST_CASE("free_all_bitmaps_integration") {
        auto bitmap1 = create_bitmap(string("test_bitmap_1"), 100, 100);
        BitmapCleanup cleanup_bitmap;
        auto bitmap2 = create_bitmap(string("test_bitmap_2"), 100, 100);
        REQUIRE(bitmap_valid(bitmap1));
        REQUIRE(bitmap_valid(bitmap2));
        free_all_bitmaps();
        REQUIRE_FALSE(bitmap_valid(bitmap1));
        REQUIRE_FALSE(bitmap_valid(bitmap2));
    }
    TEST_CASE("free_bitmap_integration") {
        auto test_bitmap = create_bitmap(string("test_bitmap"), 100, 100);
        BitmapCleanup cleanup_bitmap;
        REQUIRE(bitmap_valid(test_bitmap));
        free_bitmap(test_bitmap);
        REQUIRE_FALSE(bitmap_valid(test_bitmap));
    }
    TEST_CASE("has_bitmap_integration") {
        auto test_bitmap = create_bitmap(string("test_bitmap"), 100, 100);
        BitmapCleanup cleanup_bitmap;
        REQUIRE(has_bitmap(string("test_bitmap")));
        free_bitmap(test_bitmap);
        REQUIRE_FALSE(has_bitmap(string("test_bitmap")));
    }
    TEST_CASE("load_bitmap_integration") {
        auto loaded_bitmap = load_bitmap(string("loaded_bitmap"), string("frog.png"));
        BitmapCleanup cleanup_bitmap;
        REQUIRE(color_white() != get_pixel(loaded_bitmap, 50.0, 50.0));
    }
    TEST_CASE("pixel_drawn_at_point_pt_integration") {
        auto test_bitmap = create_bitmap(string("test_bitmap"), 100, 100);
        BitmapCleanup cleanup_bitmap;
        clear_bitmap(test_bitmap, color_white());
        draw_pixel_on_bitmap(test_bitmap, color_black(), point_at(50.0, 50.0));
        REQUIRE(color_black() == get_pixel(test_bitmap, 50.0, 50.0));
        REQUIRE(color_white() == get_pixel(test_bitmap, 75.0, 75.0));
    }
    TEST_CASE("pixel_drawn_at_point_integration") {
        auto test_bitmap = create_bitmap(string("test_bitmap"), 100, 100);
        BitmapCleanup cleanup_bitmap;
        clear_bitmap(test_bitmap, color_white());
        draw_pixel_on_bitmap(test_bitmap, color_black(), 50.0, 50.0);
        REQUIRE(color_black() == get_pixel(test_bitmap, 50.0, 50.0));
        REQUIRE(color_white() == get_pixel(test_bitmap, 75.0, 75.0));
    }
    TEST_CASE("pixel_drawn_at_point_in_cell_pt_integration") {
        auto test_bitmap = create_bitmap(string("test_bitmap"), 100, 100);
        BitmapCleanup cleanup_bitmap;
        clear_bitmap(test_bitmap, color_white());
        draw_pixel_on_bitmap(test_bitmap, color_black(), point_at(50.0, 50.0));
        bitmap_set_cell_details(test_bitmap, 100, 100, 1, 1, 1);
        REQUIRE(color_black() == get_pixel(test_bitmap, 50.0, 50.0));
        REQUIRE(color_white() == get_pixel(test_bitmap, 75.0, 50.0));
    }
    TEST_CASE("pixel_drawn_at_point_in_cell_integration") {
        auto test_bitmap = create_bitmap(string("test_bitmap"), 100, 100);
        BitmapCleanup cleanup_bitmap;
        clear_bitmap(test_bitmap, color_white());
        draw_pixel_on_bitmap(test_bitmap, color_black(), point_at(50.0, 50.0));
        bitmap_set_cell_details(test_bitmap, 100, 100, 1, 1, 1);
        REQUIRE(color_black() == get_pixel(test_bitmap, 50.0, 50.0));
        REQUIRE(color_white() == get_pixel(test_bitmap, 75.0, 75.0));
    }
    TEST_CASE("setup_collision_mask_integration") {
        open_window(string("Test Window"), 800, 600);
        WindowCleanup cleanup_window;
        auto test_bitmap = create_bitmap(string("test_bitmap"), 100, 100);
        BitmapCleanup cleanup_bitmap;
        clear_bitmap(test_bitmap, color_black());
        auto test_circle = circle_at(120.0, 120.0, 30.0);
        auto collision_before_mask = bitmap_circle_collision(test_bitmap, 100.0, 100.0, test_circle);
        setup_collision_mask(test_bitmap);
        auto collision_after_mask = bitmap_circle_collision(test_bitmap, 100.0, 100.0, test_circle);
        REQUIRE_FALSE(collision_before_mask);
        REQUIRE(collision_after_mask);
    }
    TEST_CASE("draw_line_record_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        WindowCleanup cleanup_window;
        clear_window(test_window, color_white());
        draw_line(color_black(), line_from(point_at(100.0, 100.0), point_at(200.0, 200.0)));
        refresh_screen();
        REQUIRE(color_black() == get_pixel(test_window, 100.0, 100.0));
        REQUIRE(color_white() == get_pixel(test_window, 99.0, 99.0));
    }
    TEST_CASE("draw_line_record_with_options_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        WindowCleanup cleanup_window;
        clear_window(test_window, color_white());
        draw_line(color_black(), line_from(point_at(100.0, 100.0), point_at(200.0, 200.0)), option_line_width(3, option_defaults()));
        refresh_screen();
        REQUIRE(color_black() == get_pixel(test_window, 100.0, 100.0));
        REQUIRE(color_white() == get_pixel(test_window, 99.0, 99.0));
    }
    TEST_CASE("draw_line_point_to_point_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        WindowCleanup cleanup_window;
        clear_window(test_window, color_white());
        draw_line(color_black(), point_at(100.0, 100.0), point_at(200.0, 200.0));
        refresh_screen();
        REQUIRE(color_black() == get_pixel(test_window, 100.0, 100.0));
        REQUIRE(color_white() == get_pixel(test_window, 99.0, 99.0));
    }
    TEST_CASE("draw_line_point_to_point_with_options_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        WindowCleanup cleanup_window;
        clear_window(test_window, color_white());
        draw_line(color_black(), point_at(100.0, 100.0), point_at(200.0, 200.0), option_defaults());
        refresh_screen();
        REQUIRE(color_black() == get_pixel(test_window, 100.0, 100.0));
        REQUIRE(color_white() == get_pixel(test_window, 99.0, 99.0));
    }
    TEST_CASE("draw_line_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        WindowCleanup cleanup_window;
        clear_window(test_window, color_white());
        draw_line(color_black(), 100.0, 100.0, 200.0, 200.0);
        refresh_screen();
        REQUIRE(color_black() == get_pixel(test_window, 100.0, 100.0));
        REQUIRE(color_white() == get_pixel(test_window, 99.0, 99.0));
    }
    TEST_CASE("draw_line_with_options_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        WindowCleanup cleanup_window;
        clear_window(test_window, color_white());
        draw_line(color_black(), 100.0, 100.0, 200.0, 200.0, option_defaults());
        refresh_screen();
        REQUIRE(color_black() == get_pixel(test_window, 100.0, 100.0));
        REQUIRE(color_white() == get_pixel(test_window, 99.0, 99.0));
    }
    TEST_CASE("draw_line_on_bitmap_record_integration") {
        auto test_bitmap = create_bitmap(string("test_bitmap"), 100, 100);
        BitmapCleanup cleanup_bitmap;
        clear_bitmap(test_bitmap, color_white());
        draw_line_on_bitmap(test_bitmap, color_black(), line_from(point_at(10.0, 10.0), point_at(90.0, 90.0)));
        REQUIRE(color_black() == get_pixel(test_bitmap, 50.0, 50.0));
        REQUIRE(color_white() == get_pixel(test_bitmap, 95.0, 95.0));
    }
    TEST_CASE("draw_line_on_bitmap_record_with_options_integration") {
        auto test_bitmap = create_bitmap(string("test_bitmap"), 100, 100);
        BitmapCleanup cleanup_bitmap;
        clear_bitmap(test_bitmap, color_white());
        draw_line_on_bitmap(test_bitmap, color_black(), line_from(point_at(10.0, 10.0), point_at(90.0, 90.0)), option_defaults());
        REQUIRE(color_black() == get_pixel(test_bitmap, 50.0, 50.0));
        REQUIRE(color_white() == get_pixel(test_bitmap, 95.0, 50.0));
    }
    TEST_CASE("draw_line_on_bitmap_point_to_point_integration") {
        auto test_bitmap = create_bitmap(string("test_bitmap"), 100, 100);
        BitmapCleanup cleanup_bitmap;
        clear_bitmap(test_bitmap, color_white());
        draw_line_on_bitmap(test_bitmap, color_black(), point_at(10.0, 10.0), point_at(90.0, 90.0));
        REQUIRE(color_black() == get_pixel(test_bitmap, 50.0, 50.0));
        REQUIRE(color_white() == get_pixel(test_bitmap, 0.0, 0.0));
    }
    TEST_CASE("draw_line_on_bitmap_point_to_point_with_options_integration") {
        auto test_bitmap = create_bitmap(string("test_bitmap"), 100, 100);
        BitmapCleanup cleanup_bitmap;
        clear_bitmap(test_bitmap, color_white());
        draw_line_on_bitmap(test_bitmap, color_black(), point_at(10.0, 10.0), point_at(90.0, 90.0), option_defaults());
        REQUIRE(color_black() == get_pixel(test_bitmap, 10.0, 10.0));
        REQUIRE(color_black() == get_pixel(test_bitmap, 90.0, 90.0));
        REQUIRE(color_white() == get_pixel(test_bitmap, 5.0, 5.0));
    }
    TEST_CASE("draw_line_on_bitmap_integration") {
        auto test_bitmap = create_bitmap(string("test_bitmap"), 100, 100);
        BitmapCleanup cleanup_bitmap;
        clear_bitmap(test_bitmap, color_white());
        draw_line_on_bitmap(test_bitmap, color_black(), 10.0, 10.0, 90.0, 90.0);
        REQUIRE(color_black() == get_pixel(test_bitmap, 50.0, 50.0));
        REQUIRE(color_white() == get_pixel(test_bitmap, 95.0, 50.0));
    }
    TEST_CASE("draw_line_on_bitmap_with_options_integration") {
        auto test_bitmap = create_bitmap(string("test_bitmap"), 100, 100);
        BitmapCleanup cleanup_bitmap;
        clear_bitmap(test_bitmap, color_white());
        draw_line_on_bitmap(test_bitmap, color_black(), 10.0, 10.0, 90.0, 90.0, option_defaults());
        REQUIRE(color_black() == get_pixel(test_bitmap, 50.0, 50.0));
        REQUIRE(color_white() == get_pixel(test_bitmap, 5.0, 5.0));
    }
    TEST_CASE("draw_line_on_window_record_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        WindowCleanup cleanup_window;
        clear_window(test_window, color_white());
        auto test_line = line_from(point_at(100.0, 100.0), point_at(150.0, 150.0));
        draw_line_on_window(test_window, color_black(), test_line);
        refresh_screen();
        REQUIRE(color_black() == get_pixel(test_window, 100.0, 100.0));
        REQUIRE(color_white() == get_pixel(test_window, 99.0, 99.0));
    }
    TEST_CASE("draw_line_on_window_record_with_options_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        WindowCleanup cleanup_window;
        clear_window(test_window, color_white());
        auto test_line = line_from(point_at(100.0, 100.0), point_at(150.0, 150.0));
        draw_line_on_window(test_window, color_black(), test_line, option_defaults());
        refresh_screen();
        REQUIRE(color_black() == get_pixel(test_window, 100.0, 100.0));
        REQUIRE(color_white() == get_pixel(test_window, 99.0, 99.0));
    }
    TEST_CASE("draw_line_on_window_point_to_point_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        WindowCleanup cleanup_window;
        clear_window(test_window, color_white());
        draw_line_on_window(test_window, color_black(), point_at(100.0, 100.0), point_at(200.0, 200.0));
        refresh_screen();
        REQUIRE(color_black() == get_pixel(test_window, 100.0, 100.0));
        REQUIRE(color_white() == get_pixel(test_window, 99.0, 99.0));
    }
    TEST_CASE("draw_line_on_window_point_to_point_with_options_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        WindowCleanup cleanup_window;
        clear_window(test_window, color_white());
        draw_line_on_window(test_window, color_black(), point_at(100.0, 100.0), point_at(200.0, 200.0), option_defaults());
        refresh_screen();
        REQUIRE(color_black() == get_pixel(test_window, 100.0, 100.0));
        REQUIRE(color_white() == get_pixel(test_window, 99.0, 99.0));
    }
    TEST_CASE("draw_line_on_window_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        WindowCleanup cleanup_window;
        clear_window(test_window, color_white());
        draw_line_on_window(test_window, color_black(), 100.0, 100.0, 200.0, 200.0);
        refresh_screen();
        REQUIRE(color_black() == get_pixel(test_window, 100.0, 100.0));
        REQUIRE(color_white() == get_pixel(test_window, 99.0, 99.0));
    }
    TEST_CASE("draw_line_on_window_with_options_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        WindowCleanup cleanup_window;
        clear_window(test_window, color_white());
        draw_line_on_window(test_window, color_black(), 100.0, 100.0, 200.0, 200.0, option_defaults());
        refresh_screen();
        REQUIRE(color_black() == get_pixel(test_window, 100.0, 100.0));
        REQUIRE(color_white() == get_pixel(test_window, 99.0, 99.0));
    }
    TEST_CASE("draw_pixel_at_point_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        WindowCleanup cleanup_window;
        clear_window(test_window, color_white());
        draw_pixel(color_black(), point_at(100.0, 100.0));
        refresh_screen();
        REQUIRE(color_black() == get_pixel(test_window, 100.0, 100.0));
        REQUIRE(color_white() == get_pixel(test_window, 99.0, 99.0));
    }
    TEST_CASE("draw_pixel_at_point_with_options_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        WindowCleanup cleanup_window;
        clear_window(test_window, color_white());
        draw_pixel(color_black(), point_at(100.0, 100.0), option_defaults());
        refresh_screen();
        REQUIRE(color_black() == get_pixel(test_window, 100.0, 100.0));
        REQUIRE(color_white() == get_pixel(test_window, 99.0, 99.0));
    }
    TEST_CASE("draw_pixel_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        WindowCleanup cleanup_window;
        clear_window(test_window, color_white());
        draw_pixel(color_black(), 100.0, 100.0);
        refresh_screen();
        REQUIRE(color_black() == get_pixel(test_window, 100.0, 100.0));
        REQUIRE(color_white() == get_pixel(test_window, 99.0, 99.0));
    }
    TEST_CASE("draw_pixel_with_options_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        WindowCleanup cleanup_window;
        clear_window(test_window, color_white());
        draw_pixel(color_black(), 100.0, 100.0, option_defaults());
        refresh_screen();
        REQUIRE(color_black() == get_pixel(test_window, 100.0, 100.0));
        REQUIRE(color_white() == get_pixel(test_window, 99.0, 99.0));
    }
    TEST_CASE("draw_pixel_on_bitmap_at_point_integration") {
        auto test_bitmap = create_bitmap(string("test_bitmap"), 100, 100);
        BitmapCleanup cleanup_bitmap;
        clear_bitmap(test_bitmap, color_white());
        draw_pixel_on_bitmap(test_bitmap, color_black(), point_at(50.0, 50.0));
        REQUIRE(color_black() == get_pixel(test_bitmap, 50.0, 50.0));
        REQUIRE(color_white() == get_pixel(test_bitmap, 0.0, 0.0));
    }
    TEST_CASE("draw_pixel_on_bitmap_at_point_with_options_integration") {
        auto test_bitmap = create_bitmap(string("test_bitmap"), 100, 100);
        BitmapCleanup cleanup_bitmap;
        clear_bitmap(test_bitmap, color_white());
        draw_pixel_on_bitmap(test_bitmap, color_black(), point_at(50.0, 50.0), option_defaults());
        REQUIRE(color_black() == get_pixel(test_bitmap, 50.0, 50.0));
        REQUIRE(color_white() == get_pixel(test_bitmap, 0.0, 0.0));
    }
    TEST_CASE("draw_pixel_on_bitmap_integration") {
        auto test_bitmap = create_bitmap(string("test_bitmap"), 100, 100);
        BitmapCleanup cleanup_bitmap;
        clear_bitmap(test_bitmap, color_white());
        draw_pixel_on_bitmap(test_bitmap, color_black(), 50.0, 50.0);
        REQUIRE(color_black() == get_pixel(test_bitmap, 50.0, 50.0));
        REQUIRE(color_white() == get_pixel(test_bitmap, 51.0, 50.0));
    }
    TEST_CASE("draw_pixel_on_bitmap_with_options_integration") {
        auto test_bitmap = create_bitmap(string("test_bitmap"), 100, 100);
        BitmapCleanup cleanup_bitmap;
        clear_bitmap(test_bitmap, color_white());
        draw_pixel_on_bitmap(test_bitmap, color_black(), 50.0, 50.0, option_defaults());
        REQUIRE(color_black() == get_pixel(test_bitmap, 50.0, 50.0));
        REQUIRE(color_white() == get_pixel(test_bitmap, 51.0, 50.0));
    }
    TEST_CASE("draw_pixel_on_window_at_point_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        WindowCleanup cleanup_window;
        clear_window(test_window, color_white());
        draw_pixel_on_window(test_window, color_black(), point_at(100.0, 100.0));
        refresh_screen();
        REQUIRE(color_black() == get_pixel(test_window, 100.0, 100.0));
        REQUIRE(color_white() == get_pixel(test_window, 99.0, 99.0));
    }
    TEST_CASE("draw_pixel_on_window_at_point_with_options_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        WindowCleanup cleanup_window;
        clear_window(test_window, color_white());
        draw_pixel_on_window(test_window, color_black(), point_at(100.0, 100.0), option_defaults());
        refresh_screen();
        REQUIRE(color_black() == get_pixel(test_window, 100.0, 100.0));
        REQUIRE(color_white() == get_pixel(test_window, 99.0, 99.0));
    }
    TEST_CASE("draw_pixel_on_window_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        WindowCleanup cleanup_window;
        clear_window(test_window, color_white());
        draw_pixel_on_window(test_window, color_black(), 100.0, 100.0);
        refresh_screen();
        REQUIRE(color_black() == get_pixel(test_window, 100.0, 100.0));
        REQUIRE(color_white() == get_pixel(test_window, 99.0, 99.0));
    }
    TEST_CASE("draw_pixel_on_window_with_options_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        WindowCleanup cleanup_window;
        clear_window(test_window, color_white());
        draw_pixel_on_window(test_window, color_black(), 100.0, 100.0, option_defaults());
        refresh_screen();
        REQUIRE(color_black() == get_pixel(test_window, 100.0, 100.0));
        REQUIRE(color_white() == get_pixel(test_window, 99.0, 99.0));
    }
    TEST_CASE("get_pixel_from_bitmap_at_point_integration") {
        auto test_bitmap = create_bitmap(string("test_bitmap"), 100, 100);
        BitmapCleanup cleanup_bitmap;
        clear_bitmap(test_bitmap, color_white());
        draw_pixel_on_bitmap(test_bitmap, color_black(), point_at(50.0, 50.0));
        REQUIRE(color_black() == get_pixel(test_bitmap, point_at(50.0, 50.0)));
        REQUIRE(color_white() == get_pixel(test_bitmap, point_at(49.0, 49.0)));
    }
    TEST_CASE("get_pixel_from_bitmap_integration") {
        auto test_bitmap = create_bitmap(string("test_bitmap"), 100, 100);
        BitmapCleanup cleanup_bitmap;
        clear_bitmap(test_bitmap, color_white());
        draw_pixel_on_bitmap(test_bitmap, color_black(), 50.0, 50.0);
        REQUIRE(color_black() == get_pixel(test_bitmap, 50.0, 50.0));
        REQUIRE(color_white() == get_pixel(test_bitmap, 49.0, 49.0));
    }
    TEST_CASE("get_pixel_at_point_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        WindowCleanup cleanup_window;
        clear_window(test_window, color_white());
        draw_pixel(color_black(), point_at(100.0, 100.0));
        refresh_screen();
        REQUIRE(color_black() == get_pixel(test_window, 100.0, 100.0));
        REQUIRE(color_white() == get_pixel(test_window, 99.0, 99.0));
    }
    TEST_CASE("get_pixel_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        WindowCleanup cleanup_window;
        clear_window(test_window, color_white());
        draw_pixel(color_black(), 100.0, 100.0);
        refresh_screen();
        REQUIRE(color_black() == get_pixel(test_window, 100.0, 100.0));
        REQUIRE(color_white() == get_pixel(test_window, 99.0, 99.0));
    }
    TEST_CASE("get_pixel_from_window_at_point_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        WindowCleanup cleanup_window;
        clear_window(test_window, color_white());
        draw_pixel(color_black(), point_at(100.0, 100.0));
        refresh_screen();
        REQUIRE(color_black() == get_pixel(test_window, point_at(100.0, 100.0)));
        REQUIRE(color_white() == get_pixel(test_window, point_at(99.0, 99.0)));
    }
    TEST_CASE("get_pixel_from_window_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        WindowCleanup cleanup_window;
        clear_window(test_window, color_white());
        draw_pixel(color_black(), 100.0, 100.0);
        refresh_screen();
        REQUIRE(color_black() == get_pixel(test_window, 100.0, 100.0));
        REQUIRE(color_white() == get_pixel(test_window, 99.0, 99.0));
    }
    TEST_CASE("get_pixel_from_window_at_point_from_window_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        WindowCleanup cleanup_window;
        clear_window(test_window, color_white());
        draw_pixel(color_black(), point_at(100.0, 100.0));
        refresh_screen();
        REQUIRE(color_black() == get_pixel_from_window(test_window, point_at(100.0, 100.0)));
        REQUIRE(color_white() == get_pixel_from_window(test_window, point_at(99.0, 99.0)));
    }
    TEST_CASE("get_pixel_from_window_from_window_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        WindowCleanup cleanup_window;
        clear_window(test_window, color_white());
        draw_pixel(color_black(), 100.0, 100.0);
        refresh_screen();
        REQUIRE(color_black() == get_pixel_from_window(test_window, 100.0, 100.0));
        REQUIRE(color_white() == get_pixel_from_window(test_window, 99.0, 99.0));
    }
    TEST_CASE("draw_quad_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        WindowCleanup cleanup_window;
        clear_window(test_window, color_white());
        auto quad = quad_from(point_at(100.0, 100.0), point_at(200.0, 100.0), point_at(100.0, 200.0), point_at(200.0, 200.0));
        draw_quad(color_black(), quad);
        refresh_screen();
        REQUIRE(color_black() == get_pixel(test_window, 100.0, 100.0));
        REQUIRE(color_white() == get_pixel(test_window, 150.0, 150.0));
        REQUIRE(color_white() == get_pixel(test_window, 250.0, 250.0));
    }
    TEST_CASE("draw_quad_with_options_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        WindowCleanup cleanup_window;
        clear_window(test_window, color_white());
        auto quad = quad_from(point_at(100.0, 100.0), point_at(200.0, 100.0), point_at(100.0, 200.0), point_at(200.0, 200.0));
        draw_quad(color_black(), quad, option_defaults());
        refresh_screen();
        REQUIRE(color_black() == get_pixel(test_window, 100.0, 100.0));
        REQUIRE(color_white() == get_pixel(test_window, 150.0, 150.0));
        REQUIRE(color_white() == get_pixel(test_window, 250.0, 250.0));
    }
    TEST_CASE("draw_quad_on_bitmap_integration") {
        auto test_bitmap = create_bitmap(string("test_bitmap"), 100, 100);
        BitmapCleanup cleanup_bitmap;
        clear_bitmap(test_bitmap, color_white());
        auto quad = quad_from(point_at(10.0, 10.0), point_at(90.0, 10.0), point_at(10.0, 90.0), point_at(90.0, 90.0));
        draw_quad_on_bitmap(test_bitmap, color_black(), quad);
        REQUIRE(color_black() == get_pixel(test_bitmap, 10.0, 10.0));
        REQUIRE(color_white() == get_pixel(test_bitmap, 50.0, 50.0));
        REQUIRE(color_white() == get_pixel(test_bitmap, 5.0, 5.0));
    }
    TEST_CASE("draw_quad_on_bitmap_with_options_integration") {
        auto test_bitmap = create_bitmap(string("test_bitmap"), 100, 100);
        BitmapCleanup cleanup_bitmap;
        clear_bitmap(test_bitmap, color_white());
        auto quad = quad_from(point_at(10.0, 10.0), point_at(90.0, 10.0), point_at(90.0, 90.0), point_at(10.0, 90.0));
        draw_quad_on_bitmap(test_bitmap, color_black(), quad, option_defaults());
        REQUIRE(color_black() == get_pixel(test_bitmap, 10.0, 10.0));
        REQUIRE(color_black() == get_pixel(test_bitmap, 50.0, 50.0));
        REQUIRE(color_white() == get_pixel(test_bitmap, 5.0, 5.0));
    }
    TEST_CASE("draw_quad_on_window_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        WindowCleanup cleanup_window;
        clear_window(test_window, color_white());
        auto quad = quad_from(point_at(100.0, 100.0), point_at(200.0, 100.0), point_at(100.0, 200.0), point_at(200.0, 200.0));
        draw_quad_on_window(test_window, color_black(), quad);
        refresh_screen();
        REQUIRE(color_black() == get_pixel(test_window, 100.0, 100.0));
        REQUIRE(color_white() == get_pixel(test_window, 150.0, 150.0));
        REQUIRE(color_white() == get_pixel(test_window, 250.0, 250.0));
    }
    TEST_CASE("draw_quad_on_window_with_options_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        WindowCleanup cleanup_window;
        clear_window(test_window, color_white());
        auto quad = quad_from(point_at(100.0, 100.0), point_at(200.0, 100.0), point_at(100.0, 200.0), point_at(200.0, 200.0));
        draw_quad_on_window(test_window, color_black(), quad, option_defaults());
        refresh_screen();
        REQUIRE(color_black() == get_pixel(test_window, 100.0, 100.0));
        REQUIRE(color_white() == get_pixel(test_window, 150.0, 150.0));
        REQUIRE(color_white() == get_pixel(test_window, 250.0, 250.0));
    }
    TEST_CASE("draw_rectangle_record_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        WindowCleanup cleanup_window;
        clear_window(test_window, color_white());
        auto rectangle = rectangle_from(100.0, 100.0, 200.0, 150.0);
        draw_rectangle(color_black(), rectangle);
        refresh_screen();
        REQUIRE(color_black() == get_pixel(test_window, 100.0, 100.0));
        REQUIRE(color_white() == get_pixel(test_window, 150.0, 125.0));
        REQUIRE(color_white() == get_pixel(test_window, 301.0, 251.0));
    }
    TEST_CASE("draw_rectangle_record_with_options_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        WindowCleanup cleanup_window;
        clear_window(test_window, color_white());
        auto rectangle = rectangle_from(100.0, 100.0, 200.0, 150.0);
        draw_rectangle(color_black(), rectangle, option_defaults());
        refresh_screen();
        REQUIRE(color_black() == get_pixel(test_window, 100.0, 100.0));
        REQUIRE(color_white() == get_pixel(test_window, 150.0, 125.0));
        REQUIRE(color_white() == get_pixel(test_window, 350.0, 300.0));
    }
    TEST_CASE("draw_rectangle_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        WindowCleanup cleanup_window;
        clear_window(test_window, color_white());
        draw_rectangle(color_black(), 100.0, 100.0, 200.0, 150.0);
        refresh_screen();
        REQUIRE(color_black() == get_pixel(test_window, 100.0, 100.0));
        REQUIRE(color_white() == get_pixel(test_window, 301.0, 251.0));
    }
    TEST_CASE("draw_rectangle_with_options_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        WindowCleanup cleanup_window;
        clear_window(test_window, color_white());
        draw_rectangle(color_black(), 100.0, 100.0, 200.0, 150.0, option_line_width(3, option_defaults()));
        refresh_screen();
        REQUIRE(color_black() == get_pixel(test_window, 100.0, 100.0));
        REQUIRE(color_black() == get_pixel(test_window, 101.0, 100.0));
        REQUIRE(color_white() == get_pixel(test_window, 150.0, 125.0));
        REQUIRE(color_white() == get_pixel(test_window, 301.0, 251.0));
    }
    TEST_CASE("draw_rectangle_on_bitmap_record_integration") {
        auto test_bitmap = create_bitmap(string("test_bitmap"), 100, 100);
        BitmapCleanup cleanup_bitmap;
        clear_bitmap(test_bitmap, color_white());
        auto rectangle = rectangle_from(50.0, 50.0, 20.0, 30.0);
        draw_rectangle_on_bitmap(test_bitmap, color_black(), rectangle);
        REQUIRE(color_black() == get_pixel(test_bitmap, 50.0, 50.0));
        REQUIRE(color_white() == get_pixel(test_bitmap, 80.0, 90.0));
    }
    TEST_CASE("draw_rectangle_on_bitmap_record_with_options_integration") {
        auto test_bitmap = create_bitmap(string("test_bitmap"), 100, 100);
        BitmapCleanup cleanup_bitmap;
        clear_bitmap(test_bitmap, color_white());
        auto rectangle = rectangle_from(50.0, 50.0, 20.0, 20.0);
        draw_rectangle_on_bitmap(test_bitmap, color_black(), rectangle, option_defaults());
        REQUIRE(color_black() == get_pixel(test_bitmap, 50.0, 50.0));
        REQUIRE(color_white() == get_pixel(test_bitmap, 75.0, 75.0));
    }
    TEST_CASE("draw_rectangle_on_bitmap_integration") {
        auto test_bitmap = create_bitmap(string("test_bitmap"), 100, 100);
        BitmapCleanup cleanup_bitmap;
        clear_bitmap(test_bitmap, color_white());
        draw_rectangle_on_bitmap(test_bitmap, color_black(), 50.0, 50.0, 20.0, 20.0);
        REQUIRE(color_black() == get_pixel(test_bitmap, 50.0, 50.0));
        REQUIRE(color_white() == get_pixel(test_bitmap, 75.0, 75.0));
    }
    TEST_CASE("draw_rectangle_on_bitmap_with_options_integration") {
        auto test_bitmap = create_bitmap(string("test_bitmap"), 100, 100);
        BitmapCleanup cleanup_bitmap;
        clear_bitmap(test_bitmap, color_white());
        draw_rectangle_on_bitmap(test_bitmap, color_black(), 50.0, 50.0, 20.0, 20.0, option_defaults());
        REQUIRE(color_black() == get_pixel(test_bitmap, 50.0, 50.0));
        REQUIRE(color_white() == get_pixel(test_bitmap, 75.0, 75.0));
    }
    TEST_CASE("draw_rectangle_on_window_record_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        WindowCleanup cleanup_window;
        clear_window(test_window, color_white());
        auto rectangle = rectangle_from(100.0, 100.0, 50.0, 50.0);
        draw_rectangle_on_window(test_window, color_black(), rectangle);
        refresh_screen();
        REQUIRE(color_black() == get_pixel(test_window, 100.0, 100.0));
        REQUIRE(color_white() == get_pixel(test_window, 125.0, 125.0));
        REQUIRE(color_white() == get_pixel(test_window, 200.0, 200.0));
    }
    TEST_CASE("draw_rectangle_on_window_record_with_options_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        WindowCleanup cleanup_window;
        clear_window(test_window, color_white());
        auto rectangle = rectangle_from(100.0, 100.0, 50.0, 50.0);
        draw_rectangle_on_window(test_window, color_black(), rectangle, option_defaults());
        refresh_screen();
        REQUIRE(color_black() == get_pixel(test_window, 100.0, 100.0));
        REQUIRE(color_white() == get_pixel(test_window, 125.0, 125.0));
        REQUIRE(color_white() == get_pixel(test_window, 175.0, 175.0));
    }
    TEST_CASE("draw_rectangle_on_window_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        WindowCleanup cleanup_window;
        clear_window(test_window, color_white());
        draw_rectangle_on_window(test_window, color_black(), 100.0, 100.0, 50.0, 50.0);
        refresh_screen();
        REQUIRE(color_black() == get_pixel(test_window, 100.0, 100.0));
        REQUIRE(color_white() == get_pixel(test_window, 200.0, 200.0));
    }
    TEST_CASE("draw_rectangle_on_window_with_options_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        WindowCleanup cleanup_window;
        clear_window(test_window, color_white());
        draw_rectangle_on_window(test_window, color_black(), 100.0, 100.0, 50.0, 50.0, option_defaults());
        refresh_screen();
        REQUIRE(color_black() == get_pixel(test_window, 100.0, 100.0));
        REQUIRE(color_white() == get_pixel(test_window, 200.0, 200.0));
    }
    TEST_CASE("fill_quad_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        WindowCleanup cleanup_window;
        clear_window(test_window, color_white());
        auto quad = quad_from(point_at(100.0, 100.0), point_at(300.0, 100.0), point_at(100.0, 300.0), point_at(300.0, 300.0));
        fill_quad(color_black(), quad);
        refresh_screen();
        REQUIRE(color_black() == get_pixel(test_window, 200.0, 200.0));
        REQUIRE(color_white() == get_pixel(test_window, 400.0, 400.0));
    }
    TEST_CASE("fill_quad_with_options_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        WindowCleanup cleanup_window;
        clear_window(test_window, color_white());
        auto quad = quad_from(point_at(100.0, 100.0), point_at(300.0, 100.0), point_at(100.0, 300.0), point_at(300.0, 300.0));
        fill_quad(color_black(), quad, option_defaults());
        refresh_screen();
        REQUIRE(color_black() == get_pixel(test_window, 200.0, 200.0));
        REQUIRE(color_white() == get_pixel(test_window, 400.0, 400.0));
    }
    TEST_CASE("fill_quad_on_bitmap_integration") {
        auto test_bitmap = create_bitmap(string("test_bitmap"), 100, 100);
        BitmapCleanup cleanup_bitmap;
        clear_bitmap(test_bitmap, color_white());
        auto quad = quad_from(point_at(10.0, 10.0), point_at(90.0, 10.0), point_at(10.0, 90.0), point_at(90.0, 90.0));
        fill_quad_on_bitmap(test_bitmap, color_black(), quad);
        REQUIRE(color_black() == get_pixel(test_bitmap, 50.0, 50.0));
        REQUIRE(color_white() == get_pixel(test_bitmap, 0.0, 0.0));
    }
    TEST_CASE("fill_quad_on_bitmap_with_options_integration") {
        auto test_bitmap = create_bitmap(string("test_bitmap"), 100, 100);
        BitmapCleanup cleanup_bitmap;
        clear_bitmap(test_bitmap, color_white());
        auto quad = quad_from(point_at(10.0, 10.0), point_at(90.0, 10.0), point_at(90.0, 90.0), point_at(10.0, 90.0));
        fill_quad_on_bitmap(test_bitmap, color_black(), quad, option_defaults());
        REQUIRE(color_black() == get_pixel(test_bitmap, 50.0, 50.0));
        REQUIRE(color_white() == get_pixel(test_bitmap, 95.0, 50.0));
    }
    TEST_CASE("fill_quad_on_window_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        WindowCleanup cleanup_window;
        clear_window(test_window, color_white());
        auto quad = quad_from(point_at(100.0, 100.0), point_at(200.0, 100.0), point_at(100.0, 200.0), point_at(200.0, 200.0));
        fill_quad_on_window(test_window, color_black(), quad);
        refresh_screen();
        REQUIRE(color_black() == get_pixel(test_window, 150.0, 150.0));
        REQUIRE(color_white() == get_pixel(test_window, 250.0, 250.0));
    }
    TEST_CASE("fill_quad_on_window_with_options_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        WindowCleanup cleanup_window;
        clear_window(test_window, color_white());
        auto quad = quad_from(point_at(100.0, 100.0), point_at(200.0, 100.0), point_at(200.0, 200.0), point_at(100.0, 200.0));
        fill_quad_on_window(test_window, color_black(), quad, option_defaults());
        refresh_screen();
        REQUIRE(color_black() == get_pixel(test_window, 150.0, 150.0));
        REQUIRE(color_white() == get_pixel(test_window, 250.0, 150.0));
    }
    TEST_CASE("fill_rectangle_record_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        WindowCleanup cleanup_window;
        clear_window(test_window, color_white());
        auto rectangle = rectangle_from(100.0, 100.0, 200.0, 150.0);
        fill_rectangle(color_black(), rectangle);
        refresh_screen();
        REQUIRE(color_black() == get_pixel(test_window, 150.0, 125.0));
        REQUIRE(color_white() == get_pixel(test_window, 350.0, 275.0));
    }
    TEST_CASE("fill_rectangle_record_with_options_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        WindowCleanup cleanup_window;
        clear_window(test_window, color_white());
        auto rectangle = rectangle_from(100.0, 100.0, 200.0, 150.0);
        fill_rectangle(color_black(), rectangle, option_defaults());
        refresh_screen();
        REQUIRE(color_black() == get_pixel(test_window, 150.0, 125.0));
        REQUIRE(color_white() == get_pixel(test_window, 350.0, 275.0));
    }
    TEST_CASE("fill_rectangle_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        WindowCleanup cleanup_window;
        clear_window(test_window, color_white());
        fill_rectangle(color_black(), 100.0, 100.0, 200.0, 150.0);
        refresh_screen();
        REQUIRE(color_black() == get_pixel(test_window, 150.0, 125.0));
        REQUIRE(color_white() == get_pixel(test_window, 301.0, 251.0));
    }
    TEST_CASE("fill_rectangle_with_options_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        WindowCleanup cleanup_window;
        clear_window(test_window, color_white());
        fill_rectangle(color_black(), 100.0, 100.0, 200.0, 150.0, option_defaults());
        refresh_screen();
        REQUIRE(color_black() == get_pixel(test_window, 150.0, 125.0));
        REQUIRE(color_white() == get_pixel(test_window, 301.0, 251.0));
    }
    TEST_CASE("fill_rectangle_on_bitmap_record_integration") {
        auto test_bitmap = create_bitmap(string("test_bitmap"), 100, 100);
        BitmapCleanup cleanup_bitmap;
        clear_bitmap(test_bitmap, color_white());
        auto rectangle = rectangle_from(25.0, 25.0, 50.0, 50.0);
        fill_rectangle_on_bitmap(test_bitmap, color_black(), rectangle);
        REQUIRE(color_black() == get_pixel(test_bitmap, 50.0, 50.0));
        REQUIRE(color_white() == get_pixel(test_bitmap, 10.0, 10.0));
    }
    TEST_CASE("fill_rectangle_on_bitmap_record_with_options_integration") {
        auto test_bitmap = create_bitmap(string("test_bitmap"), 100, 100);
        BitmapCleanup cleanup_bitmap;
        clear_bitmap(test_bitmap, color_white());
        auto rectangle = rectangle_from(25.0, 25.0, 50.0, 50.0);
        fill_rectangle_on_bitmap(test_bitmap, color_black(), rectangle, option_defaults());
        REQUIRE(color_black() == get_pixel(test_bitmap, 50.0, 50.0));
        REQUIRE(color_white() == get_pixel(test_bitmap, 10.0, 10.0));
    }
    TEST_CASE("fill_rectangle_on_bitmap_integration") {
        auto test_bitmap = create_bitmap(string("test_bitmap"), 100, 100);
        BitmapCleanup cleanup_bitmap;
        clear_bitmap(test_bitmap, color_white());
        fill_rectangle_on_bitmap(test_bitmap, color_black(), 25.0, 25.0, 50.0, 50.0);
        REQUIRE(color_black() == get_pixel(test_bitmap, 50.0, 50.0));
        REQUIRE(color_white() == get_pixel(test_bitmap, 75.0, 75.0));
    }
    TEST_CASE("fill_rectangle_on_bitmap_with_options_integration") {
        auto test_bitmap = create_bitmap(string("test_bitmap"), 100, 100);
        BitmapCleanup cleanup_bitmap;
        clear_bitmap(test_bitmap, color_white());
        fill_rectangle_on_bitmap(test_bitmap, color_black(), 25.0, 25.0, 50.0, 50.0, option_defaults());
        REQUIRE(color_black() == get_pixel(test_bitmap, 50.0, 50.0));
        REQUIRE(color_white() == get_pixel(test_bitmap, 10.0, 10.0));
    }
    TEST_CASE("fill_rectangle_on_window_record_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        WindowCleanup cleanup_window;
        clear_window(test_window, color_white());
        auto rectangle = rectangle_from(100.0, 100.0, 200.0, 150.0);
        fill_rectangle_on_window(test_window, color_black(), rectangle);
        refresh_screen();
        REQUIRE(color_black() == get_pixel(test_window, 150.0, 125.0));
        REQUIRE(color_white() == get_pixel(test_window, 350.0, 275.0));
    }
    TEST_CASE("fill_rectangle_on_window_record_with_options_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        WindowCleanup cleanup_window;
        clear_window(test_window, color_white());
        auto rectangle = rectangle_from(100.0, 100.0, 200.0, 150.0);
        fill_rectangle_on_window(test_window, color_black(), rectangle, option_defaults());
        refresh_screen();
        REQUIRE(color_black() == get_pixel(test_window, 150.0, 125.0));
        REQUIRE(color_white() == get_pixel(test_window, 350.0, 275.0));
    }
    TEST_CASE("fill_rectangle_on_window_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        WindowCleanup cleanup_window;
        clear_window(test_window, color_white());
        fill_rectangle_on_window(test_window, color_black(), 100.0, 100.0, 50.0, 50.0);
        refresh_screen();
        REQUIRE(color_black() == get_pixel(test_window, 125.0, 125.0));
        REQUIRE(color_white() == get_pixel(test_window, 175.0, 175.0));
    }
    TEST_CASE("fill_rectangle_on_window_with_options_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        WindowCleanup cleanup_window;
        clear_window(test_window, color_white());
        fill_rectangle_on_window(test_window, color_black(), 100.0, 100.0, 50.0, 50.0, option_defaults());
        refresh_screen();
        REQUIRE(color_black() == get_pixel(test_window, 125.0, 125.0));
        REQUIRE(color_white() == get_pixel(test_window, 175.0, 175.0));
    }
    TEST_CASE("draw_text_font_as_string_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        WindowCleanup cleanup_window;
        clear_window(test_window, color_white());
        refresh_screen();
        load_font(string("hara"), string("hara.ttf"));
        FontCleanup cleanup_font;
        draw_text(string("Test Text"), color_black(), string("hara"), 24, 100.0, 100.0);
        refresh_screen();
        REQUIRE(color_black() == get_pixel(test_window, 120.0, 110.0));
        REQUIRE(color_white() == get_pixel(test_window, 90.0, 90.0));
    }
    TEST_CASE("draw_text_with_options_font_as_string_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        WindowCleanup cleanup_window;
        clear_window(test_window, color_white());
        load_font(string("hara"), string("hara.ttf"));
        FontCleanup cleanup_font;
        draw_text(string("Test Text"), color_black(), string("hara"), 24, 100.0, 100.0, option_defaults());
        refresh_screen();
        REQUIRE(color_black() == get_pixel(test_window, 120.0, 110.0));
        REQUIRE(color_white() == get_pixel(test_window, 90.0, 90.0));
    }
    TEST_CASE("draw_text_no_font_no_size_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        WindowCleanup cleanup_window;
        clear_window(test_window, color_white());
        draw_text(string("Test Text"), color_black(), 100.0, 100.0);
        refresh_screen();
        REQUIRE(color_black() == get_pixel(test_window, 105.0, 100.0));
        REQUIRE(color_white() == get_pixel(test_window, 90.0, 90.0));
    }
    TEST_CASE("draw_text_no_font_no_size_with_options_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        WindowCleanup cleanup_window;
        clear_window(test_window, color_white());
        draw_text(string("Test Text"), color_black(), 100.0, 100.0, option_defaults());
        refresh_screen();
        REQUIRE(color_black() == get_pixel(test_window, 105.0, 100.0));
        REQUIRE(color_white() == get_pixel(test_window, 90.0, 90.0));
    }
    TEST_CASE("draw_text_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        WindowCleanup cleanup_window;
        clear_window(test_window, color_white());
        load_font(string("hara"), string("hara.ttf"));
        FontCleanup cleanup_font;
        draw_text(string("Test Text"), color_black(), font_named(string("hara")), 24, 100.0, 100.0);
        refresh_screen();
        REQUIRE(color_black() == get_pixel(test_window, 120.0, 110.0));
        REQUIRE(color_white() == get_pixel(test_window, 90.0, 90.0));
    }
    TEST_CASE("draw_text_with_options_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        WindowCleanup cleanup_window;
        clear_window(test_window, color_white());
        load_font(string("hara"), string("hara.ttf"));
        FontCleanup cleanup_font;
        draw_text(string("Test Text"), color_black(), font_named(string("hara")), 24, 100.0, 100.0, option_defaults());
        refresh_screen();
        REQUIRE(color_black() == get_pixel(test_window, 120.0, 110.0));
        REQUIRE(color_white() == get_pixel(test_window, 90.0, 90.0));
    }
    TEST_CASE("draw_text_on_bitmap_font_as_string_integration") {
        auto test_bitmap = create_bitmap(string("test_bitmap"), 200, 200);
        BitmapCleanup cleanup_bitmap;
        clear_bitmap(test_bitmap, color_white());
        load_font(string("hara"), string("hara.ttf"));
        FontCleanup cleanup_font;
        draw_text_on_bitmap(test_bitmap, string("Test Text"), color_black(), string("hara"), 24, 100.0, 100.0);
        REQUIRE(color_black() == get_pixel(test_bitmap, 120.0, 110.0));
        REQUIRE(color_white() == get_pixel(test_bitmap, 90.0, 90.0));
    }
    TEST_CASE("draw_text_on_bitmap_with_options_font_as_string_integration") {
        auto test_bitmap = create_bitmap(string("test_bitmap"), 200, 200);
        BitmapCleanup cleanup_bitmap;
        clear_bitmap(test_bitmap, color_white());
        load_font(string("hara"), string("hara.ttf"));
        FontCleanup cleanup_font;
        draw_text_on_bitmap(test_bitmap, string("Test Text"), color_black(), string("hara"), 24, 100.0, 100.0, option_defaults());
        REQUIRE(color_black() == get_pixel(test_bitmap, 120.0, 110.0));
        REQUIRE(color_white() == get_pixel(test_bitmap, 90.0, 90.0));
    }
    TEST_CASE("draw_text_on_bitmap_no_font_no_size_integration") {
        auto test_bitmap = create_bitmap(string("test_bitmap"), 200, 200);
        BitmapCleanup cleanup_bitmap;
        clear_bitmap(test_bitmap, color_white());
        draw_text_on_bitmap(test_bitmap, string("Test Text"), color_black(), 100.0, 100.0);
        REQUIRE(color_black() == get_pixel(test_bitmap, 105.0, 100.0));
        REQUIRE(color_white() == get_pixel(test_bitmap, 90.0, 90.0));
    }
    TEST_CASE("draw_text_on_bitmap_no_font_no_size_with_options_integration") {
        auto test_bitmap = create_bitmap(string("test_bitmap"), 200, 200);
        BitmapCleanup cleanup_bitmap;
        clear_bitmap(test_bitmap, color_white());
        draw_text_on_bitmap(test_bitmap, string("Test Text"), color_black(), 100.0, 100.0, option_defaults());
        REQUIRE(color_black() == get_pixel(test_bitmap, 105.0, 100.0));
        REQUIRE(color_white() == get_pixel(test_bitmap, 90.0, 90.0));
    }
    TEST_CASE("draw_text_on_bitmap_integration") {
        auto test_bitmap = create_bitmap(string("test_bitmap"), 200, 200);
        BitmapCleanup cleanup_bitmap;
        clear_bitmap(test_bitmap, color_white());
        load_font(string("hara"), string("hara.ttf"));
        FontCleanup cleanup_font;
        draw_text_on_bitmap(test_bitmap, string("Test Text"), color_black(), font_named(string("hara")), 24, 100.0, 100.0);
        REQUIRE(color_black() == get_pixel(test_bitmap, 120.0, 110.0));
        REQUIRE(color_white() == get_pixel(test_bitmap, 90.0, 90.0));
    }
    TEST_CASE("draw_text_on_bitmap_with_options_integration") {
        auto test_bitmap = create_bitmap(string("test_bitmap"), 200, 200);
        BitmapCleanup cleanup_bitmap;
        clear_bitmap(test_bitmap, color_white());
        load_font(string("hara"), string("hara.ttf"));
        FontCleanup cleanup_font;
        draw_text_on_bitmap(test_bitmap, string("Test Text"), color_black(), font_named(string("hara")), 24, 100.0, 100.0, option_defaults());
        REQUIRE(color_black() == get_pixel(test_bitmap, 120.0, 110.0));
        REQUIRE(color_white() == get_pixel(test_bitmap, 90.0, 90.0));
    }
    TEST_CASE("draw_text_on_window_font_as_string_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        WindowCleanup cleanup_window;
        clear_window(test_window, color_white());
        load_font(string("hara"), string("hara.ttf"));
        FontCleanup cleanup_font;
        draw_text_on_window(test_window, string("Test Text"), color_black(), string("hara"), 24, 100.0, 100.0);
        refresh_screen();
        REQUIRE(color_black() == get_pixel(test_window, 120.0, 110.0));
        REQUIRE(color_white() == get_pixel(test_window, 90.0, 90.0));
    }
    TEST_CASE("draw_text_on_window_with_options_font_as_string_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        WindowCleanup cleanup_window;
        clear_window(test_window, color_white());
        load_font(string("hara"), string("hara.ttf"));
        FontCleanup cleanup_font;
        draw_text_on_window(test_window, string("Test Text"), color_black(), string("hara"), 24, 100.0, 100.0, option_defaults());
        refresh_screen();
        REQUIRE(color_black() == get_pixel(test_window, 120.0, 110.0));
        REQUIRE(color_white() == get_pixel(test_window, 90.0, 90.0));
    }
    TEST_CASE("draw_text_on_window_no_font_no_size_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        WindowCleanup cleanup_window;
        clear_window(test_window, color_white());
        draw_text_on_window(test_window, string("Test Text"), color_black(), 100.0, 100.0);
        refresh_screen();
        REQUIRE(color_black() == get_pixel(test_window, 105.0, 100.0));
        REQUIRE(color_white() == get_pixel(test_window, 90.0, 90.0));
    }
    TEST_CASE("draw_text_on_window_no_font_no_size_with_options_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        WindowCleanup cleanup_window;
        clear_window(test_window, color_white());
        draw_text_on_window(test_window, string("Test Text"), color_black(), 100.0, 100.0, option_defaults());
        refresh_screen();
        REQUIRE(color_black() == get_pixel(test_window, 105.0, 100.0));
        REQUIRE(color_white() == get_pixel(test_window, 90.0, 90.0));
    }
    TEST_CASE("draw_text_on_window_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        WindowCleanup cleanup_window;
        clear_window(test_window, color_white());
        load_font(string("hara"), string("hara.ttf"));
        FontCleanup cleanup_font;
        auto test_font = font_named(string("hara"));
        font_load_size(test_font, 24);
        draw_text_on_window(test_window, string("Test Text"), color_black(), test_font, 24, 100.0, 100.0);
        refresh_screen();
        REQUIRE(color_black() == get_pixel(test_window, 120.0, 110.0));
        REQUIRE(color_white() == get_pixel(test_window, 90.0, 90.0));
    }
    TEST_CASE("draw_text_on_window_with_options_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        WindowCleanup cleanup_window;
        clear_window(test_window, color_white());
        auto test_font = load_font(string("test_font"), string("hara.ttf"));
        FontCleanup cleanup_font;
        draw_text_on_window(test_window, string("Test Text"), color_black(), test_font, 24, 100.0, 100.0, option_defaults());
        refresh_screen();
        REQUIRE(color_black() == get_pixel(test_window, 120.0, 110.0));
        REQUIRE(color_white() == get_pixel(test_window, 90.0, 90.0));
    }
    TEST_CASE("font_has_size_name_as_string_integration") {
        load_font(string("hara"), string("hara.ttf"));
        FontCleanup cleanup_font;
        font_load_size(string("hara"), 12);
        REQUIRE(font_has_size(string("hara"), 12));
        REQUIRE_FALSE(font_has_size(string("nonexistent_font"), 12));
    }
    TEST_CASE("font_has_size_integration") {
        auto test_font = load_font(string("test_font"), string("hara.ttf"));
        FontCleanup cleanup_font;
        font_load_size(test_font, 12);
        REQUIRE(font_has_size(test_font, 12));
        REQUIRE_FALSE(font_has_size(test_font, 999));
    }
    TEST_CASE("font_load_size_name_as_string_integration") {
        load_font(string("test_font"), string("hara.ttf"));
        FontCleanup cleanup_font;
        font_load_size(string("test_font"), 12);
        REQUIRE(font_has_size(string("test_font"), 12));
    }
    TEST_CASE("font_load_size_integration") {
        auto test_font = load_font(string("test_font"), string("hara.ttf"));
        FontCleanup cleanup_font;
        font_load_size(test_font, 12);
        REQUIRE(font_has_size(test_font, 12));
    }
    TEST_CASE("font_named_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        WindowCleanup cleanup_window;
        clear_window(test_window, color_white());
        load_font(string("hara"), string("hara.ttf"));
        FontCleanup cleanup_font;
        auto test_font = font_named(string("hara"));
        draw_text(string("Test Text"), color_black(), test_font, 24, 100.0, 100.0);
        refresh_screen();
        REQUIRE(test_font != nullptr);
        REQUIRE(color_black() == get_pixel(test_window, 120.0, 110.0));
        REQUIRE(color_white() == get_pixel(test_window, 90.0, 90.0));
    }
    TEST_CASE("free_all_fonts_integration") {
        load_font(string("test_font"), string("hara.ttf"));
        FontCleanup cleanup_font;
        REQUIRE(has_font(string("test_font")));
        free_all_fonts();
        REQUIRE_FALSE(has_font(string("test_font")));
    }
    TEST_CASE("free_font_integration") {
        auto test_font = load_font(string("test_font"), string("hara.ttf"));
        FontCleanup cleanup_font;
        REQUIRE(has_font(test_font));
        free_font(test_font);
        REQUIRE_FALSE(has_font(test_font));
    }
    TEST_CASE("get_font_style_name_as_string_integration") {
        load_font(string("test_font"), string("hara.ttf"));
        FontCleanup cleanup_font;
        auto style = get_font_style(string("test_font"));
        REQUIRE(FontStyle::BOLD_FONT == style);
    }
    TEST_CASE("get_font_style_integration") {
        auto test_font = load_font(string("test_font"), string("hara.ttf"));
        FontCleanup cleanup_font;
        auto style = get_font_style(test_font);
        REQUIRE(FontStyle::BOLD_FONT == style);
    }
    TEST_CASE("get_system_font_integration") {
        auto system_font = get_system_font();
        REQUIRE(system_font != nullptr);
    }
    TEST_CASE("has_font_integration") {
        auto test_font = load_font(string("test_font"), string("hara.ttf"));
        FontCleanup cleanup_font;
        REQUIRE(has_font(test_font));
        free_font(test_font);
        REQUIRE_FALSE(has_font(test_font));
    }
    TEST_CASE("has_font_name_as_string_integration") {
        load_font(string("test_font"), string("hara.ttf"));
        FontCleanup cleanup_font;
        REQUIRE(has_font(string("test_font")));
        REQUIRE_FALSE(has_font(string("nonexistent_font")));
    }
    TEST_CASE("load_font_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        WindowCleanup cleanup_window;
        clear_window(test_window, color_white());
        auto test_font = load_font(string("test_font"), string("hara.ttf"));
        FontCleanup cleanup_font;
        draw_text(string("Test Text"), color_black(), test_font, 24, 100.0, 100.0, option_defaults());
        refresh_screen();
        REQUIRE(has_font(string("test_font")));
        REQUIRE(color_black() == get_pixel(test_window, 105.0, 105.0));
    }
    TEST_CASE("set_font_style_name_as_string_integration") {
        load_font(string("test_font"), string("hara.ttf"));
        FontCleanup cleanup_font;
        set_font_style(string("test_font"), FontStyle::BOLD_FONT);
        REQUIRE(FontStyle::BOLD_FONT == get_font_style(string("test_font")));
    }
    TEST_CASE("set_font_style_integration") {
        auto test_font = load_font(string("test_font"), string("hara.ttf"));
        FontCleanup cleanup_font;
        set_font_style(test_font, FontStyle::BOLD_FONT);
        REQUIRE(FontStyle::BOLD_FONT == get_font_style(test_font));
    }
    TEST_CASE("text_height_font_named_integration") {
        load_font(string("test_font"), string("hara.ttf"));
        FontCleanup cleanup_font;
        font_load_size(string("test_font"), 24);
        auto height = text_height(string("Test Text"), string("test_font"), 24);
        REQUIRE(height > 0);
        REQUIRE(height >= 24);
    }
    TEST_CASE("text_height_integration") {
        auto test_font = load_font(string("test_font"), string("hara.ttf"));
        FontCleanup cleanup_font;
        font_load_size(test_font, 24);
        auto height = text_height(string("Test Text"), test_font, 24);
        REQUIRE(height > 0);
        REQUIRE(height >= 24);
    }
    TEST_CASE("text_width_font_named_integration") {
        auto test_font = load_font(string("hara"), string("hara.ttf"));
        FontCleanup cleanup_font;
        font_load_size(test_font, 12);
        auto width = text_width(string("Test Text"), string("hara"), 24);
        REQUIRE(width > 0);
        REQUIRE(width >= text_height(string("Test Text"), string("hara"), 24));
    }
    TEST_CASE("text_width_integration") {
        auto test_font = load_font(string("test_font"), string("hara.ttf"));
        FontCleanup cleanup_font;
        font_load_size(test_font, 12);
        auto width = text_width(string("Test Text"), test_font, 24);
        REQUIRE(width > 0);
        REQUIRE(width >= text_height(string("Text Height"), test_font, 24));
    }
    TEST_CASE("draw_triangle_record_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        WindowCleanup cleanup_window;
        clear_window(test_window, color_white());
        auto triangle = triangle_from(point_at(100.0, 100.0), point_at(200.0, 200.0), point_at(150.0, 300.0));
        draw_triangle(color_black(), triangle);
        refresh_screen();
        REQUIRE(color_black() == get_pixel(test_window, 100.0, 100.0));
        REQUIRE(color_white() == get_pixel(test_window, 150.0, 200.0));
    }
    TEST_CASE("draw_triangle_record_with_options_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        WindowCleanup cleanup_window;
        clear_window(test_window, color_white());
        auto triangle = triangle_from(point_at(100.0, 100.0), point_at(200.0, 200.0), point_at(150.0, 300.0));
        draw_triangle(color_black(), triangle, option_defaults());
        refresh_screen();
        REQUIRE(color_black() == get_pixel(test_window, 100.0, 100.0));
        REQUIRE(color_white() == get_pixel(test_window, 150.0, 200.0));
    }
    TEST_CASE("draw_triangle_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        WindowCleanup cleanup_window;
        clear_window(test_window, color_white());
        draw_triangle(color_black(), 100.0, 100.0, 200.0, 300.0, 300.0, 100.0);
        refresh_screen();
        REQUIRE(color_black() == get_pixel(test_window, 100.0, 100.0));
        REQUIRE(color_white() == get_pixel(test_window, 200.0, 150.0));
    }
    TEST_CASE("draw_triangle_with_options_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        WindowCleanup cleanup_window;
        clear_window(test_window, color_white());
        draw_triangle(color_black(), 100.0, 100.0, 200.0, 200.0, 150.0, 300.0, option_defaults());
        refresh_screen();
        REQUIRE(color_black() == get_pixel(test_window, 100.0, 100.0));
        REQUIRE(color_white() == get_pixel(test_window, 150.0, 200.0));
    }
    TEST_CASE("draw_triangle_on_bitmap_record_integration") {
        auto test_bitmap = create_bitmap(string("test_bitmap"), 100, 100);
        BitmapCleanup cleanup_bitmap;
        clear_bitmap(test_bitmap, color_white());
        auto triangle = triangle_from(point_at(25.0, 25.0), point_at(75.0, 25.0), point_at(50.0, 75.0));
        draw_triangle_on_bitmap(test_bitmap, color_black(), triangle);
        REQUIRE(color_black() == get_pixel(test_bitmap, 25.0, 25.0));
        REQUIRE(color_white() == get_pixel(test_bitmap, 50.0, 50.0));
    }
    TEST_CASE("draw_triangle_on_bitmap_record_with_options_integration") {
        auto test_bitmap = create_bitmap(string("test_bitmap"), 100, 100);
        BitmapCleanup cleanup_bitmap;
        clear_bitmap(test_bitmap, color_white());
        auto triangle = triangle_from(point_at(25.0, 25.0), point_at(75.0, 25.0), point_at(50.0, 75.0));
        draw_triangle_on_bitmap(test_bitmap, color_black(), triangle, option_defaults());
        REQUIRE(color_black() == get_pixel(test_bitmap, 25.0, 25.0));
        REQUIRE(color_white() == get_pixel(test_bitmap, 50.0, 50.0));
    }
    TEST_CASE("draw_triangle_on_bitmap_integration") {
        auto test_bitmap = create_bitmap(string("test_bitmap"), 100, 100);
        BitmapCleanup cleanup_bitmap;
        clear_bitmap(test_bitmap, color_white());
        draw_triangle_on_bitmap(test_bitmap, color_black(), 25.0, 25.0, 75.0, 25.0, 50.0, 75.0);
        REQUIRE(color_black() == get_pixel(test_bitmap, 25.0, 25.0));
        REQUIRE(color_white() == get_pixel(test_bitmap, 50.0, 50.0));
    }
    TEST_CASE("draw_triangle_on_bitmap_with_options_integration") {
        auto test_bitmap = create_bitmap(string("test_bitmap"), 100, 100);
        BitmapCleanup cleanup_bitmap;
        clear_bitmap(test_bitmap, color_white());
        draw_triangle_on_bitmap(test_bitmap, color_black(), 25.0, 25.0, 75.0, 25.0, 50.0, 75.0, option_defaults());
        REQUIRE(color_black() == get_pixel(test_bitmap, 25.0, 25.0));
        REQUIRE(color_white() == get_pixel(test_bitmap, 50.0, 50.0));
    }
    TEST_CASE("draw_triangle_on_window_record_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        WindowCleanup cleanup_window;
        clear_window(test_window, color_white());
        auto triangle = triangle_from(point_at(100.0, 100.0), point_at(200.0, 200.0), point_at(150.0, 300.0));
        draw_triangle_on_window(test_window, color_black(), triangle);
        refresh_screen();
        REQUIRE(color_black() == get_pixel(test_window, 100.0, 100.0));
        REQUIRE(color_white() == get_pixel(test_window, 50.0, 50.0));
    }
    TEST_CASE("draw_triangle_on_window_record_with_options_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        WindowCleanup cleanup_window;
        clear_window(test_window, color_white());
        auto triangle = triangle_from(point_at(100.0, 100.0), point_at(200.0, 200.0), point_at(150.0, 250.0));
        draw_triangle_on_window(test_window, color_black(), triangle, option_defaults());
        refresh_screen();
        REQUIRE(color_black() == get_pixel(test_window, 150.0, 150.0));
        REQUIRE(color_white() == get_pixel(test_window, 50.0, 50.0));
    }
    TEST_CASE("draw_triangle_on_window_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        WindowCleanup cleanup_window;
        clear_window(test_window, color_white());
        draw_triangle_on_window(test_window, color_black(), 100.0, 100.0, 200.0, 300.0, 300.0, 100.0);
        refresh_screen();
        REQUIRE(color_black() == get_pixel(test_window, 100.0, 100.0));
        REQUIRE(color_white() == get_pixel(test_window, 50.0, 50.0));
    }
    TEST_CASE("draw_triangle_on_window_with_options_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        WindowCleanup cleanup_window;
        clear_window(test_window, color_white());
        draw_triangle_on_window(test_window, color_black(), 100.0, 100.0, 200.0, 200.0, 150.0, 300.0, option_defaults());
        refresh_screen();
        REQUIRE(color_black() == get_pixel(test_window, 100.0, 100.0));
        REQUIRE(color_white() == get_pixel(test_window, 50.0, 50.0));
    }
    TEST_CASE("fill_triangle_record_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        WindowCleanup cleanup_window;
        clear_window(test_window, color_white());
        auto triangle = triangle_from(point_at(100.0, 100.0), point_at(200.0, 300.0), point_at(300.0, 100.0));
        fill_triangle(color_black(), triangle);
        refresh_screen();
        REQUIRE(color_black() == get_pixel(test_window, 200.0, 150.0));
        REQUIRE(color_white() == get_pixel(test_window, 50.0, 50.0));
    }
    TEST_CASE("fill_triangle_record_with_options_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        WindowCleanup cleanup_window;
        clear_window(test_window, color_white());
        auto triangle = triangle_from(point_at(100.0, 100.0), point_at(200.0, 300.0), point_at(300.0, 100.0));
        fill_triangle(color_black(), triangle, option_defaults());
        refresh_screen();
        REQUIRE(color_black() == get_pixel(test_window, 200.0, 150.0));
        REQUIRE(color_white() == get_pixel(test_window, 50.0, 50.0));
    }
    TEST_CASE("fill_triangle_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        WindowCleanup cleanup_window;
        clear_window(test_window, color_white());
        fill_triangle(color_black(), 100.0, 100.0, 200.0, 300.0, 300.0, 100.0);
        refresh_screen();
        REQUIRE(color_black() == get_pixel(test_window, 200.0, 150.0));
        REQUIRE(color_white() == get_pixel(test_window, 50.0, 50.0));
    }
    TEST_CASE("fill_triangle_with_options_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        WindowCleanup cleanup_window;
        clear_window(test_window, color_white());
        fill_triangle(color_red(), 100.0, 100.0, 200.0, 300.0, 300.0, 100.0, option_defaults());
        refresh_screen();
        REQUIRE(color_red() == get_pixel(test_window, 150.0, 150.0));
        REQUIRE(color_white() == get_pixel(test_window, 350.0, 150.0));
    }
    TEST_CASE("fill_triangle_on_bitmap_record_integration") {
        auto test_bitmap = create_bitmap(string("test_bitmap"), 100, 100);
        BitmapCleanup cleanup_bitmap;
        clear_bitmap(test_bitmap, color_white());
        auto triangle = triangle_from(point_at(25.0, 25.0), point_at(75.0, 25.0), point_at(50.0, 75.0));
        fill_triangle_on_bitmap(test_bitmap, color_black(), triangle);
        REQUIRE(color_black() == get_pixel(test_bitmap, 50.0, 50.0));
        REQUIRE(color_white() == get_pixel(test_bitmap, 0.0, 0.0));
    }
    TEST_CASE("fill_triangle_on_bitmap_record_with_options_integration") {
        auto test_bitmap = create_bitmap(string("test_bitmap"), 100, 100);
        BitmapCleanup cleanup_bitmap;
        clear_bitmap(test_bitmap, color_white());
        auto triangle = triangle_from(point_at(25.0, 25.0), point_at(75.0, 25.0), point_at(50.0, 75.0));
        fill_triangle_on_bitmap(test_bitmap, color_black(), triangle, option_defaults());
        REQUIRE(color_black() == get_pixel(test_bitmap, 50.0, 50.0));
        REQUIRE(color_white() == get_pixel(test_bitmap, 10.0, 10.0));
    }
    TEST_CASE("fill_triangle_on_bitmap_integration") {
        auto test_bitmap = create_bitmap(string("test_bitmap"), 100, 100);
        BitmapCleanup cleanup_bitmap;
        clear_bitmap(test_bitmap, color_white());
        fill_triangle_on_bitmap(test_bitmap, color_black(), 25.0, 25.0, 75.0, 25.0, 50.0, 75.0);
        REQUIRE(color_black() == get_pixel(test_bitmap, 50.0, 50.0));
        REQUIRE(color_white() == get_pixel(test_bitmap, 0.0, 0.0));
    }
    TEST_CASE("fill_triangle_on_bitmap_with_options_integration") {
        auto test_bitmap = create_bitmap(string("test_bitmap"), 100, 100);
        BitmapCleanup cleanup_bitmap;
        clear_bitmap(test_bitmap, color_white());
        fill_triangle_on_bitmap(test_bitmap, color_black(), 25.0, 25.0, 75.0, 25.0, 50.0, 75.0, option_defaults());
        REQUIRE(color_black() == get_pixel(test_bitmap, 50.0, 50.0));
        REQUIRE(color_white() == get_pixel(test_bitmap, 0.0, 0.0));
    }
    TEST_CASE("fill_triangle_on_window_record_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        WindowCleanup cleanup_window;
        clear_window(test_window, color_white());
        auto triangle = triangle_from(point_at(100.0, 100.0), point_at(200.0, 300.0), point_at(300.0, 100.0));
        fill_triangle_on_window(test_window, color_black(), triangle);
        refresh_screen();
        REQUIRE(color_black() == get_pixel(test_window, 200.0, 200.0));
        REQUIRE(color_white() == get_pixel(test_window, 50.0, 50.0));
    }
    TEST_CASE("fill_triangle_on_window_record_with_options_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        WindowCleanup cleanup_window;
        clear_window(test_window, color_white());
        auto triangle = triangle_from(point_at(100.0, 100.0), point_at(200.0, 300.0), point_at(300.0, 100.0));
        fill_triangle_on_window(test_window, color_black(), triangle, option_defaults());
        refresh_screen();
        REQUIRE(color_black() == get_pixel(test_window, 200.0, 200.0));
        REQUIRE(color_white() == get_pixel(test_window, 50.0, 50.0));
    }
    TEST_CASE("fill_triangle_on_window_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        WindowCleanup cleanup_window;
        clear_window(test_window, color_white());
        fill_triangle_on_window(test_window, color_black(), 100.0, 100.0, 200.0, 300.0, 300.0, 100.0);
        refresh_screen();
        REQUIRE(color_black() == get_pixel(test_window, 200.0, 200.0));
        REQUIRE(color_white() == get_pixel(test_window, 50.0, 50.0));
    }
    TEST_CASE("fill_triangle_on_window_with_options_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        WindowCleanup cleanup_window;
        clear_window(test_window, color_white());
        fill_triangle_on_window(test_window, color_black(), 100.0, 100.0, 200.0, 300.0, 300.0, 100.0, option_defaults());
        refresh_screen();
        REQUIRE(color_black() == get_pixel(test_window, 150.0, 150.0));
        REQUIRE(color_white() == get_pixel(test_window, 350.0, 150.0));
    }
};
