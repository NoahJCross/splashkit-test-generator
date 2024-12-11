#include "splashkit.h"
#include <catch2/catch.hpp>

class TestGraphics {
public:
    TEST_CASE("draw_circle_record_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        clear_window(test_window, color_white());
        auto test_circle = circle_at(400.0, 300.0, 50.0);
        draw_circle_record(color_black(), test_circle);
        REQUIRE(color_black() == get_pixel_from_window(test_window, 450, 300));
        REQUIRE(color_white() == get_pixel_from_window(test_window, 400, 300));
        REQUIRE(color_white() == get_pixel_from_window(test_window, 460, 300));
        close_window(test_window);
    }
    TEST_CASE("draw_circle_record_with_options_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        clear_window(test_window, color_white());
        auto test_circle = circle_at(400.0, 300.0, 50.0);
        draw_circle_record_with_options(color_black(), test_circle, option_defaults());
        REQUIRE(color_black() == get_pixel_from_window(test_window, 450, 300));
        REQUIRE(color_white() == get_pixel_from_window(test_window, 400, 300));
        REQUIRE(color_white() == get_pixel_from_window(test_window, 460, 300));
        close_window(test_window);
    }
    TEST_CASE("draw_circle_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        clear_window(test_window, color_white());
        draw_circle(color_black(), 400.0, 300.0, 50.0);
        refresh_screen();
        REQUIRE(color_black() == get_pixel_from_window(test_window, 450, 300));
        REQUIRE(color_white() == get_pixel_from_window(test_window, 425, 300));
        REQUIRE(color_white() == get_pixel_from_window(test_window, 460, 300));
        close_window(test_window);
    }
    TEST_CASE("draw_circle_with_options_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        clear_window(test_window, color_white());
        draw_circle_with_options(color_black(), 400.0, 300.0, 50.0, option_defaults());
        REQUIRE(color_black() == get_pixel_from_window(test_window, 450, 300));
        REQUIRE(color_white() == get_pixel_from_window(test_window, 400, 300));
        REQUIRE(color_white() == get_pixel_from_window(test_window, 460, 300));
        close_window(test_window);
    }
    TEST_CASE("draw_circle_on_bitmap_integration") {
        auto test_bitmap = create_bitmap("test_bitmap", 200, 200);
        clear_bitmap(test_bitmap, color_white());
        draw_circle_on_bitmap(test_bitmap, color_black(), 100.0, 100.0, 50.0);
        REQUIRE(color_black() == get_pixel(test_bitmap, 150, 100));
        REQUIRE(color_white() == get_pixel(test_bitmap, 100, 100));
        REQUIRE(color_white() == get_pixel(test_bitmap, 160, 100));
        free_bitmap(test_bitmap);
    }
    TEST_CASE("draw_circle_on_bitmap_with_options_integration") {
        auto test_bitmap = create_bitmap("test_bitmap", 200, 200);
        clear_bitmap(test_bitmap, color_white());
        draw_circle_on_bitmap_with_options(test_bitmap, color_black(), 100.0, 100.0, 50.0, option_defaults());
        REQUIRE(color_black() == get_pixel(test_bitmap, 150, 100));
        REQUIRE(color_white() == get_pixel(test_bitmap, 100, 100));
        REQUIRE(color_white() == get_pixel(test_bitmap, 160, 100));
        free_bitmap(test_bitmap);
    }
    TEST_CASE("draw_circle_on_window_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        clear_window(test_window, color_white());
        draw_circle_on_window(test_window, color_black(), 400.0, 300.0, 50.0);
        REQUIRE(color_black() == get_pixel_from_window(test_window, 450, 300));
        REQUIRE(color_white() == get_pixel_from_window(test_window, 400, 300));
        REQUIRE(color_white() == get_pixel_from_window(test_window, 460, 300));
        close_window(test_window);
    }
    TEST_CASE("draw_circle_on_window_with_options_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        clear_window(test_window, color_white());
        draw_circle_on_window_with_options(test_window, color_black(), 400.0, 300.0, 50.0, option_defaults());
        REQUIRE(color_black() == get_pixel_from_window(test_window, 450, 300));
        REQUIRE(color_black() == get_pixel_from_window(test_window, 350, 300));
        REQUIRE(color_white() == get_pixel_from_window(test_window, 400, 400));
        close_window(test_window);
    }
    TEST_CASE("fill_circle_record_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        clear_window(test_window, color_white());
        auto test_circle = circle_at(400.0, 300.0, 50.0);
        fill_circle_record(color_black(), test_circle);
        REQUIRE(color_black() == get_pixel_from_window(test_window, 400, 300));
        REQUIRE(color_black() == get_pixel_from_window(test_window, 425, 300));
        REQUIRE(color_white() == get_pixel_from_window(test_window, 460, 300));
        close_window(test_window);
    }
    TEST_CASE("fill_circle_record_with_options_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        clear_window(test_window, color_white());
        auto test_circle = circle_at(400.0, 300.0, 50.0);
        fill_circle_record_with_options(color_black(), test_circle, option_defaults());
        REQUIRE(color_black() == get_pixel_from_window(test_window, 400, 300));
        REQUIRE(color_black() == get_pixel_from_window(test_window, 425, 300));
        REQUIRE(color_white() == get_pixel_from_window(test_window, 460, 300));
        close_window(test_window);
    }
    TEST_CASE("fill_circle_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        clear_window(test_window, color_white());
        fill_circle(color_black(), 400.0, 300.0, 50.0);
        REQUIRE(color_black() == get_pixel_from_window(test_window, 400, 300));
        REQUIRE(color_black() == get_pixel_from_window(test_window, 425, 300));
        REQUIRE(color_white() == get_pixel_from_window(test_window, 460, 300));
        close_window(test_window);
    }
    TEST_CASE("fill_circle_with_options_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        clear_window(test_window, color_white());
        fill_circle_with_options(color_black(), 400.0, 300.0, 50.0, option_defaults());
        REQUIRE(color_black() == get_pixel_from_window(test_window, 400, 300));
        REQUIRE(color_black() == get_pixel_from_window(test_window, 425, 300));
        REQUIRE(color_white() == get_pixel_from_window(test_window, 460, 300));
        close_window(test_window);
    }
    TEST_CASE("fill_circle_on_bitmap_integration") {
        auto test_bitmap = create_bitmap("test_bitmap", 200, 200);
        clear_bitmap(test_bitmap, color_white());
        fill_circle_on_bitmap(test_bitmap, color_red(), 100.0, 100.0, 50.0);
        REQUIRE(color_red() == get_pixel(test_bitmap, 100, 100));
        REQUIRE(color_red() == get_pixel(test_bitmap, 125, 100));
        REQUIRE(color_white() == get_pixel(test_bitmap, 160, 100));
        free_bitmap(test_bitmap);
    }
    TEST_CASE("fill_circle_on_bitmap_with_options_integration") {
        auto test_bitmap = create_bitmap("test_bitmap", 200, 200);
        clear_bitmap(test_bitmap, color_white());
        fill_circle_on_bitmap_with_options(test_bitmap, color_black(), 100.0, 100.0, 50.0, option_defaults());
        REQUIRE(color_black() == get_pixel(test_bitmap, 100, 100));
        REQUIRE(color_black() == get_pixel(test_bitmap, 125, 100));
        REQUIRE(color_white() == get_pixel(test_bitmap, 160, 100));
        free_bitmap(test_bitmap);
    }
    TEST_CASE("fill_circle_on_window_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        clear_window(test_window, color_white());
        fill_circle_on_window(test_window, color_black(), 400.0, 300.0, 50.0);
        REQUIRE(color_black() == get_pixel_from_window(test_window, 400, 300));
        REQUIRE(color_black() == get_pixel_from_window(test_window, 425, 300));
        REQUIRE(color_white() == get_pixel_from_window(test_window, 460, 300));
        close_window(test_window);
    }
    TEST_CASE("fill_circle_on_window_with_options_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        clear_window(test_window, color_white());
        fill_circle_on_window_with_options(test_window, color_black(), 400.0, 300.0, 50.0, option_defaults());
        REQUIRE(color_black() == get_pixel_from_window(test_window, 400, 300));
        REQUIRE(color_black() == get_pixel_from_window(test_window, 425, 300));
        REQUIRE(color_white() == get_pixel_from_window(test_window, 460, 300));
        close_window(test_window);
    }
    TEST_CASE("current_clip_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        auto test_clip = current_clip();
        REQUIRE(0 == rectangle_left(test_clip));
        REQUIRE(0 == rectangle_top(test_clip));
        REQUIRE(800 == test_clip->Width);
        REQUIRE(600 == test_clip->Height);
        close_window(test_window);
    }
    TEST_CASE("current_clip_for_bitmap_integration") {
        auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
        auto test_rectangle = rectangle_from(10, 10, 50, 50);
        push_clip(test_bitmap, test_rectangle);
        auto test_clip = current_clip_for_bitmap(test_bitmap);
        REQUIRE(0 == rectangle_left(test_clip));
        REQUIRE(0 == rectangle_top(test_clip));
        REQUIRE(50 == rectangle_right(test_clip));
        REQUIRE(50 == rectangle_bottom(test_clip));
        free_bitmap(test_bitmap);
    }
    TEST_CASE("current_clip_for_window_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        auto test_clip = current_clip_for_window(test_window);
        REQUIRE(0 == rectangle_left(test_clip));
        REQUIRE(0 == rectangle_top(test_clip));
        REQUIRE(800 == test_clip->Width);
        REQUIRE(600 == test_clip->Height);
        close_window(test_window);
    }
    TEST_CASE("pop_clip_for_window_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        auto test_rectangle = rectangle_from(0, 0, 250, 250);
        push_clip(test_window, test_rectangle);
        auto test_current_clip = current_clip(test_window);
        REQUIRE(0 == rectangle_left(test_current_clip));
        REQUIRE(0 == rectangle_top(test_current_clip));
        REQUIRE(250 == test_current_clip->Width);
        REQUIRE(250 == test_current_clip->Height);
        pop_clip_for_window(test_window);
        auto test_current_clip_after_pop = current_clip(test_window);
        REQUIRE(0 == rectangle_left(test_current_clip_after_pop));
        REQUIRE(0 == rectangle_top(test_current_clip_after_pop));
        REQUIRE(800 == test_current_clip_after_pop->Width);
        REQUIRE(600 == test_current_clip_after_pop->Height);
        close_window(test_window);
    }
    TEST_CASE("pop_clip_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        clear_window(test_window, color_white());
        push_clip(rectangle_from(0, 0, 250, 250));
        fill_rectangle(color_red(), 0, 0, 300, 300);
        refresh_screen();
        REQUIRE(color_red() == get_pixel_from_window(test_window, 125, 125));
        REQUIRE(color_white() == get_pixel_from_window(test_window, 275, 275));
        pop_clip();
        fill_rectangle(color_green(), 300, 300, 100, 100);
        refresh_screen();
        REQUIRE(color_red() == get_pixel_from_window(test_window, 125, 125));
        REQUIRE(color_green() == get_pixel_from_window(test_window, 350, 350));
        close_window(test_window);
    }
    TEST_CASE("pop_clip_for_bitmap_integration") {
        auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
        clear_bitmap(test_bitmap, color_white());
        push_clip(test_bitmap, rectangle_from(0, 0, 50, 50));
        fill_circle(color_black(), 25, 25, 20, option_draw_to_bitmap(test_bitmap));
        REQUIRE(color_black() == get_pixel(test_bitmap, 25, 25));
        REQUIRE(color_white() == get_pixel(test_bitmap, 75, 75));
        pop_clip_for_bitmap(test_bitmap);
        auto test_clip = current_clip(test_bitmap);
        REQUIRE(0 == rectangle_left(full_clip));
        REQUIRE(0 == rectangle_top(full_clip));
        REQUIRE(100 == test_clip->Width);
        REQUIRE(100 == test_clip->height);
        free_bitmap(test_bitmap);
    }
    TEST_CASE("push_clip_for_window_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        auto test_rectangle = rectangle_from(100.0, 100.0, 200.0, 200.0);
        push_clip_for_window(test_window, test_rectangle);
        auto test_current_clip = current_clip(test_window);
        REQUIRE(100 == rectangle_left(test_current_clip));
        REQUIRE(100 == rectangle_top(test_current_clip));
        REQUIRE(200 == test_current_clip->Width);
        REQUIRE(200 == test_current_clip->Height);
        refresh_screen();
        close_window(test_window);
    }
    TEST_CASE("push_clip_for_bitmap_integration") {
        auto test_bitmap = create_bitmap("test_bitmap", 200, 200);
        auto test_rectangle = rectangle_from(50, 50, 100, 100);
        push_clip_for_bitmap(test_bitmap, test_rectangle);
        auto test_current_clip = current_clip(test_bitmap);
        REQUIRE(50 == rectangle_left(test_current_clip));
        REQUIRE(50 == rectangle_top(test_current_clip));
        REQUIRE(100 == test_current_clip->Width);
        REQUIRE(100 == test_current_clip->Height);
        free_bitmap(test_bitmap);
    }
    TEST_CASE("push_clip_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        auto test_rectangle = rectangle_from(100.0, 100.0, 200.0, 200.0);
        push_clip(test_rectangle);
        auto test_current_clip = current_clip();
        REQUIRE(100 == rectangle_left(test_current_clip));
        REQUIRE(100 == rectangle_top(test_current_clip));
        REQUIRE(200 == test_current_clip->Width);
        REQUIRE(200 == test_current_clip->Height);
        close_window(test_window);
    }
    TEST_CASE("reset_clip_for_bitmap_integration") {
        auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
        push_clip(test_bitmap, rectangle_from(10, 10, 50, 50));
        reset_clip_for_bitmap(test_bitmap);
        auto test_clip = current_clip(test_bitmap);
        REQUIRE(0 == rectangle_left(reset_clip));
        REQUIRE(0 == rectangle_top(reset_clip));
        REQUIRE(100 == test_clip->width);
        REQUIRE(100 == test_clip->height);
        free_bitmap(test_bitmap);
    }
    TEST_CASE("reset_clip_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        push_clip(rectangle_from(100, 100, 200, 200));
        reset_clip();
        auto test_clip = current_clip();
        REQUIRE(0 == rectangle_left(test_clip));
        REQUIRE(0 == rectangle_top(test_clip));
        REQUIRE(800 == test_clip->Width);
        REQUIRE(600 == test_clip->Height);
        close_window(test_window);
    }
    TEST_CASE("reset_clip_for_window_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        push_clip(test_window, rectangle_from(100, 100, 200, 200));
        reset_clip_for_window(test_window);
        auto test_clip = current_clip(test_window);
        REQUIRE(0 == rectangle_left(test_clip));
        REQUIRE(0 == rectangle_top(test_clip));
        REQUIRE(800 == test_clip->Width);
        REQUIRE(600 == test_clip->Height);
        close_window(test_window);
    }
    TEST_CASE("set_clip_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        auto test_rectangle = rectangle_from(100.0, 100.0, 200.0, 200.0);
        set_clip(test_rectangle);
        auto test_current_clip = current_clip();
        REQUIRE(100 == rectangle_left(test_current_clip));
        REQUIRE(100 == rectangle_top(test_current_clip));
        REQUIRE(200 == test_current_clip->Width);
        REQUIRE(200 == test_current_clip->Height);
        close_window(test_window);
    }
    TEST_CASE("set_clip_for_bitmap_integration") {
        auto test_bitmap = create_bitmap("test_bitmap", 200, 200);
        auto test_rectangle = rectangle_from(50, 50, 100, 100);
        set_clip_for_bitmap(test_bitmap, test_rectangle);
        auto test_current_clip = current_clip(test_bitmap);
        REQUIRE(50 == rectangle_left(test_current_clip));
        REQUIRE(50 == rectangle_top(test_current_clip));
        REQUIRE(100 == test_current_clip->Width);
        REQUIRE(100 == test_current_clip->Height);
        free_bitmap(test_bitmap);
    }
    TEST_CASE("set_clip_for_window_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        auto test_rectangle = rectangle_from(100, 100, 200, 200);
        set_clip_for_window(test_window, test_rectangle);
        auto test_current_clip = current_clip(test_window);
        REQUIRE(100 == rectangle_left(test_current_clip));
        REQUIRE(100 == rectangle_top(test_current_clip));
        REQUIRE(200 == test_current_clip->Width);
        REQUIRE(200 == test_current_clip->Height);
        close_window(test_window);
    }
    TEST_CASE("option_defaults_integration") {
        auto test_options = option_defaults();
        REQUIRE(test_options != nullptr);
    }
    TEST_CASE("option_draw_to_bitmap_integration") {
        auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
        clear_bitmap(test_bitmap, color_white());
        auto test_options = option_draw_to_bitmap(test_bitmap);
        draw_circle(color_black(), circle_at(50.0, 50.0, 25.0), test_options);
        REQUIRE(color_black() == get_pixel(test_bitmap, 75, 50));
        REQUIRE(color_white() == get_pixel(test_bitmap, 90, 90));
        free_bitmap(test_bitmap);
    }
    TEST_CASE("option_draw_to_bitmap_with_options_integration") {
        auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
        clear_bitmap(test_bitmap, color_white());
        auto test_options = option_defaults();
        auto test_drawing_options = option_draw_to_bitmap_with_options(test_bitmap, test_options);
        draw_circle(color_black(), circle_at(50.0, 50.0, 25.0), test_drawing_options);
        REQUIRE(color_black() == get_pixel(test_bitmap, 75, 50));
        REQUIRE(color_white() == get_pixel(test_bitmap, 90, 90));
        free_bitmap(test_bitmap);
    }
    TEST_CASE("option_draw_to_window_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        clear_window(test_window, color_white());
        draw_circle(color_black(), circle_at(400.0, 300.0, 50.0), option_draw_to_window(test_window));
        refresh_screen();
        REQUIRE(color_black() == get_pixel_from_window(test_window, 450, 300));
        REQUIRE(color_white() == get_pixel_from_window(test_window, 460, 300));
        close_window(test_window);
    }
    TEST_CASE("option_draw_to_window_with_options_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        clear_window(test_window, color_white());
        auto test_options = option_defaults();
        draw_circle(color_black(), circle_at(400.0, 300.0, 50.0), option_draw_to_window_with_options(test_window, test_options));
        refresh_screen();
        REQUIRE(color_black() == get_pixel_from_window(test_window, 450, 300));
        REQUIRE(color_white() == get_pixel_from_window(test_window, 460, 300));
        close_window(test_window);
    }
    TEST_CASE("option_flip_x_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        clear_window(test_window, color_white());
        auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
        clear_bitmap(test_bitmap, color_white());
        fill_rectangle_on_bitmap(test_bitmap, color_black(), 0, 0, 50, 100);
        draw_bitmap(test_bitmap, 100.0, 100.0, option_flip_x());
        refresh_screen();
        REQUIRE(color_black() == get_pixel_from_window(test_window, 125, 100));
        REQUIRE(color_white() == get_pixel_from_window(test_window, 75, 100));
        free_bitmap(test_bitmap);
        close_window(test_window);
    }
    TEST_CASE("option_flip_x_with_options_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        clear_window(test_window, color_white());
        auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
        clear_bitmap(test_bitmap, color_white());
        fill_rectangle_on_bitmap(test_bitmap, color_black(), 0, 0, 50, 100);
        draw_bitmap(test_bitmap, 400, 300, option_flip_x_with_options(option_defaults()));
        refresh_screen();
        REQUIRE(color_black() == get_pixel_from_window(test_window, 425, 300));
        REQUIRE(color_white() == get_pixel_from_window(test_window, 375, 300));
        free_bitmap(test_bitmap);
        close_window(test_window);
    }
    TEST_CASE("option_flip_xy_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        clear_window(test_window, color_white());
        auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
        clear_bitmap(test_bitmap, color_white());
        fill_rectangle_on_bitmap(test_bitmap, color_black(), 0, 0, 50, 50);
        draw_bitmap(test_bitmap, 400.0, 300.0, option_flip_xy());
        refresh_screen();
        REQUIRE(color_black() == get_pixel_from_window(test_window, 450, 350));
        REQUIRE(color_white() == get_pixel_from_window(test_window, 450, 250));
        free_bitmap(test_bitmap);
        close_window(test_window);
    }
    TEST_CASE("option_flip_xy_with_options_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        clear_window(test_window, color_white());
        auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
        clear_bitmap(test_bitmap, color_white());
        fill_rectangle_on_bitmap(test_bitmap, color_black(), 0, 0, 50, 50);
        draw_bitmap(test_bitmap, 400, 300, option_flip_xy_with_options(option_defaults()));
        refresh_screen();
        REQUIRE(color_black() == get_pixel_from_window(test_window, 450, 350));
        REQUIRE(color_white() == get_pixel_from_window(test_window, 450, 250));
        free_bitmap(test_bitmap);
        close_window(test_window);
    }
    TEST_CASE("option_flip_y_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        clear_window(test_window, color_white());
        auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
        clear_bitmap(test_bitmap, color_white());
        fill_rectangle_on_bitmap(test_bitmap, color_black(), 0, 0, 100, 50);
        draw_bitmap(test_bitmap, 400.0, 300.0, option_flip_y());
        refresh_screen();
        REQUIRE(color_black() == get_pixel_from_window(test_window, 400, 325));
        REQUIRE(color_white() == get_pixel_from_window(test_window, 400, 275));
        free_bitmap(test_bitmap);
        close_window(test_window);
    }
    TEST_CASE("option_flip_y_with_options_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        clear_window(test_window, color_white());
        auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
        clear_bitmap(test_bitmap, color_white());
        fill_rectangle_on_bitmap(test_bitmap, color_black(), 0, 0, 100, 50);
        draw_bitmap(test_bitmap, 400.0, 300.0, option_flip_y_with_options(option_defaults()));
        refresh_screen();
        REQUIRE(color_black() == get_pixel_from_window(test_window, 400, 325));
        REQUIRE(color_white() == get_pixel_from_window(test_window, 400, 275));
        free_bitmap(test_bitmap);
        close_window(test_window);
    }
    TEST_CASE("option_line_width_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        clear_window(test_window, color_white());
        draw_line(color_black(), 100.0, 100.0, 200.0, 200.0, option_line_width(5));
        refresh_screen();
        REQUIRE(color_black() == get_pixel_from_window(test_window, 150, 150));
        REQUIRE(color_white() == get_pixel_from_window(test_window, 140, 150));
        close_window(test_window);
    }
    TEST_CASE("option_line_width_with_options_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        clear_window(test_window, color_white());
        draw_line(color_black(), 100.0, 100.0, 200.0, 200.0, option_line_width_with_options(5, option_defaults()));
        refresh_screen();
        REQUIRE(color_black() == get_pixel_from_window(test_window, 150, 150));
        REQUIRE(color_white() == get_pixel_from_window(test_window, 145, 150));
        close_window(test_window);
    }
    TEST_CASE("option_part_bmp_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        clear_window(test_window, color_white());
        auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
        clear_bitmap(test_bitmap, color_black());
        draw_bitmap(test_bitmap, 100.0, 100.0, option_part_bmp(0.0, 0.0, 50.0, 50.0));
        refresh_screen();
        REQUIRE(color_black() == get_pixel_from_window(test_window, 125, 125));
        REQUIRE(color_white() == get_pixel_from_window(test_window, 175, 175));
        free_bitmap(test_bitmap);
        close_window(test_window);
    }
    TEST_CASE("option_part_bmp_with_options_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        clear_window(test_window, color_white());
        auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
        clear_bitmap(test_bitmap, color_black());
        draw_bitmap(test_bitmap, 100.0, 100.0, option_part_bmp_with_options(0.0, 0.0, 50.0, 50.0, option_defaults()));
        refresh_screen();
        REQUIRE(color_black() == get_pixel_from_window(test_window, 125, 125));
        REQUIRE(color_white() == get_pixel_from_window(test_window, 175, 175));
        free_bitmap(test_bitmap);
        close_window(test_window);
    }
    TEST_CASE("option_part_bmp_from_rectangle_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        clear_window(test_window, color_white());
        auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
        clear_bitmap(test_bitmap, color_black());
        draw_bitmap(test_bitmap, 0, 0, option_part_bmp_from_rectangle(rectangle_from(0, 0, 50, 50)));
        refresh_screen();
        REQUIRE(color_black() == get_pixel_from_window(test_window, 25, 25));
        REQUIRE(color_white() == get_pixel_from_window(test_window, 75, 75));
        free_bitmap(test_bitmap);
        close_window(test_window);
    }
    TEST_CASE("option_part_bmp_from_rectangle_with_options_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        clear_window(test_window, color_white());
        auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
        clear_bitmap(test_bitmap, color_black());
        draw_bitmap(test_bitmap, 0, 0, option_part_bmp_from_rectangle_with_options(rectangle_from(0, 0, 50, 50), option_defaults()));
        refresh_screen();
        REQUIRE(color_black() == get_pixel_from_window(test_window, 25, 25));
        REQUIRE(color_white() == get_pixel_from_window(test_window, 75, 75));
        free_bitmap(test_bitmap);
        close_window(test_window);
    }
    TEST_CASE("option_rotate_bmp_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        clear_window(test_window, color_white());
        auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
        clear_bitmap(test_bitmap, color_white());
        fill_rectangle_on_bitmap(test_bitmap, color_black(), 0, 0, 50, 100);
        draw_bitmap(test_bitmap, 400.0, 300.0, option_rotate_bmp(90.0));
        refresh_screen();
        REQUIRE(color_black() == get_pixel_from_window(test_window, 400, 300));
        REQUIRE(color_white() == get_pixel_from_window(test_window, 400, 350));
        free_bitmap(test_bitmap);
        close_window(test_window);
    }
    TEST_CASE("option_rotate_bmp_with_anchor_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        clear_window(test_window, color_white());
        auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
        clear_bitmap(test_bitmap, color_white());
        fill_rectangle_on_bitmap(test_bitmap, color_black(), 0, 0, 50, 100);
        draw_bitmap(test_bitmap, 400.0, 300.0, option_rotate_bmp_with_anchor(90.0, 50.0, 50.0));
        refresh_screen();
        REQUIRE(color_black() == get_pixel_from_window(test_window, 500, 300));
        REQUIRE(color_white() == get_pixel_from_window(test_window, 450, 300));
        free_bitmap(test_bitmap);
        close_window(test_window);
    }
    TEST_CASE("option_rotate_bmp_with_anchor_and_options_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        clear_window(test_window, color_white());
        auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
        clear_bitmap(test_bitmap, color_white());
        fill_rectangle_on_bitmap(test_bitmap, color_black(), 0, 0, 50, 100);
        draw_bitmap(test_bitmap, 400.0, 300.0, option_rotate_bmp_with_anchor_and_options(90.0, 50.0, 50.0, option_defaults()));
        refresh_screen();
        REQUIRE(color_black() == get_pixel_from_window(test_window, 500, 300));
        REQUIRE(color_white() == get_pixel_from_window(test_window, 400, 300));
        free_bitmap(test_bitmap);
        close_window(test_window);
    }
    TEST_CASE("option_rotate_bmp_with_options_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        clear_window(test_window, color_white());
        auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
        clear_bitmap(test_bitmap, color_white());
        fill_rectangle_on_bitmap(test_bitmap, color_black(), 0, 0, 50, 100);
        draw_bitmap(test_bitmap, 400.0, 300.0, option_rotate_bmp_with_options(90.0, option_defaults()));
        refresh_screen();
        REQUIRE(color_black() == get_pixel_from_window(test_window, 400, 300));
        REQUIRE(color_white() == get_pixel_from_window(test_window, 400, 350));
        free_bitmap(test_bitmap);
        close_window(test_window);
    }
    TEST_CASE("option_scale_bmp_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        clear_window(test_window, color_white());
        auto test_bitmap = create_bitmap("test_bitmap", 50, 50);
        clear_bitmap(test_bitmap, color_black());
        draw_bitmap(test_bitmap, 400.0, 300.0, option_scale_bmp(2.0, 2.0));
        refresh_screen();
        REQUIRE(color_black() == get_pixel_from_window(test_window, 451, 300));
        REQUIRE(color_white() == get_pixel_from_window(test_window, 500, 300));
        free_bitmap(test_bitmap);
        close_window(test_window);
    }
    TEST_CASE("option_scale_bmp_with_options_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        clear_window(test_window, color_white());
        auto test_bitmap = create_bitmap("test_bitmap", 50, 50);
        clear_bitmap(test_bitmap, color_black());
        draw_bitmap(test_bitmap, 400.0, 300.0, option_scale_bmp_with_options(2.0, 2.0, option_defaults()));
        refresh_screen();
        REQUIRE(color_black() == get_pixel_from_window(test_window, 451, 300));
        REQUIRE(color_white() == get_pixel_from_window(test_window, 500, 300));
        free_bitmap(test_bitmap);
        close_window(test_window);
    }
    TEST_CASE("option_to_screen_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        clear_window(test_window, color_white());
        draw_circle(color_black(), circle_at(400.0, 300.0, 50.0), option_to_screen());
        refresh_screen();
        REQUIRE(color_black() == get_pixel_from_window(test_window, 450, 300));
        REQUIRE(color_white() == get_pixel_from_window(test_window, 451, 300));
        close_window(test_window);
    }
    TEST_CASE("option_to_screen_with_options_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        clear_window(test_window, color_white());
        draw_circle(color_black(), circle_at(400.0, 300.0, 50.0), option_to_screen_with_options(option_defaults()));
        refresh_screen();
        REQUIRE(color_black() == get_pixel_from_window(test_window, 400, 250));
        REQUIRE(color_white() == get_pixel_from_window(test_window, 400, 300));
        close_window(test_window);
    }
    TEST_CASE("option_to_world_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        clear_window(test_window, color_white());
        move_camera_to(100.0, 100.0);
        draw_circle(color_black(), circle_at(400.0, 300.0, 50.0), option_to_world());
        refresh_screen();
        REQUIRE(color_black() == get_pixel_from_window(test_window, 350, 200));
        REQUIRE(color_white() == get_pixel_from_window(test_window, 375, 200));
        close_window(test_window);
    }
    TEST_CASE("option_to_world_with_options_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        clear_window(test_window, color_white());
        move_camera_to(100.0, 100.0);
        draw_circle(color_black(), circle_at(400.0, 300.0, 50.0), option_to_world_with_options(option_defaults()));
        refresh_screen();
        REQUIRE(color_black() == get_pixel_from_window(test_window, 350, 200));
        REQUIRE(color_white() == get_pixel_from_window(test_window, 375, 200));
        close_window(test_window);
    }
    TEST_CASE("option_with_animation_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        clear_window(test_window, color_white());
        auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
        clear_bitmap(test_bitmap, color_black());
        auto test_animation = create_animation("test_animation", "default");
        draw_bitmap(test_bitmap, 100, 100, option_with_animation(test_animation));
        refresh_screen();
        REQUIRE(color_black() == get_pixel_from_window(test_window, 125, 125));
        REQUIRE(color_white() == get_pixel_from_window(test_window, 75, 75));
        free_animation(test_animation);
        free_bitmap(test_bitmap);
        close_window(test_window);
    }
    TEST_CASE("option_with_animation_with_options_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        clear_window(test_window, color_white());
        auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
        clear_bitmap(test_bitmap, color_black());
        auto test_animation = create_animation("test_animation", "default");
        draw_bitmap(test_bitmap, 100, 100, option_with_animation_with_options(test_animation, option_defaults()));
        refresh_screen();
        REQUIRE(color_black() == get_pixel_from_window(test_window, 125, 125));
        REQUIRE(color_white() == get_pixel_from_window(test_window, 75, 75));
        free_animation(test_animation);
        free_bitmap(test_bitmap);
        close_window(test_window);
    }
    TEST_CASE("option_with_bitmap_cell_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        clear_window(test_window, color_white());
        auto test_bitmap = create_bitmap("test_bitmap", 64, 64);
        clear_bitmap(test_bitmap, color_black());
        bitmap_set_cell_details(test_bitmap, 32, 32, 2, 2, 4);
        draw_bitmap(test_bitmap, 100, 100, option_with_bitmap_cell(1));
        refresh_screen();
        REQUIRE(color_black() == get_pixel_from_window(test_window, 116, 116));
        REQUIRE(color_white() == get_pixel_from_window(test_window, 84, 84));
        free_bitmap(test_bitmap);
        close_window(test_window);
    }
    TEST_CASE("option_with_bitmap_cell_with_options_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        clear_window(test_window, color_white());
        auto test_bitmap = create_bitmap("test_bitmap", 64, 64);
        clear_bitmap(test_bitmap, color_black());
        bitmap_set_cell_details(test_bitmap, 32, 32, 2, 2, 4);
        draw_bitmap(test_bitmap, 100, 100, option_with_bitmap_cell_with_options(1, option_defaults()));
        refresh_screen();
        REQUIRE(color_black() == get_pixel_from_window(test_window, 116, 116));
        REQUIRE(color_white() == get_pixel_from_window(test_window, 84, 84));
        free_bitmap(test_bitmap);
        close_window(test_window);
    }
    TEST_CASE("draw_ellipse_within_rectangle_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        clear_window(test_window, color_white());
        draw_ellipse_within_rectangle(color_black(), rectangle_from(100, 100, 200, 150));
        refresh_screen();
        REQUIRE(color_black() == get_pixel_from_window(test_window, 300, 175));
        REQUIRE(color_white() == get_pixel_from_window(test_window, 200, 175));
        REQUIRE(color_white() == get_pixel_from_window(test_window, 350, 175));
        close_window(test_window);
    }
    TEST_CASE("draw_ellipse_within_rectangle_with_options_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        clear_window(test_window, color_white());
        draw_ellipse_within_rectangle_with_options(color_black(), rectangle_from(100, 100, 200, 100), option_defaults());
        refresh_screen();
        REQUIRE(color_black() == get_pixel_from_window(test_window, 300, 150));
        REQUIRE(color_white() == get_pixel_from_window(test_window, 200, 150));
        REQUIRE(color_white() == get_pixel_from_window(test_window, 350, 150));
        close_window(test_window);
    }
    TEST_CASE("draw_ellipse_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        clear_window(test_window, color_white());
        draw_ellipse(color_black(), 400.0, 300.0, 100.0, 50.0);
        refresh_screen();
        REQUIRE(color_black() == get_pixel_from_window(test_window, 450, 300));
        REQUIRE(color_white() == get_pixel_from_window(test_window, 400, 300));
        REQUIRE(color_white() == get_pixel_from_window(test_window, 500, 300));
        close_window(test_window);
    }
    TEST_CASE("draw_ellipse_with_options_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        clear_window(test_window, color_white());
        draw_ellipse_with_options(color_black(), 400.0, 300.0, 100.0, 50.0, option_defaults());
        refresh_screen();
        REQUIRE(color_black() == get_pixel_from_window(test_window, 450, 300));
        REQUIRE(color_white() == get_pixel_from_window(test_window, 400, 300));
        REQUIRE(color_white() == get_pixel_from_window(test_window, 500, 300));
        close_window(test_window);
    }
    TEST_CASE("draw_ellipse_on_bitmap_within_rectangle_integration") {
        auto test_bitmap = create_bitmap("test_bitmap", 200, 200);
        clear_bitmap(test_bitmap, color_white());
        auto rect = rectangle_from(50.0, 50.0, 100.0, 100.0);
        draw_ellipse_on_bitmap_within_rectangle(test_bitmap, color_black(), rect);
        REQUIRE(color_black() == get_pixel(test_bitmap, 150, 100));
        REQUIRE(color_white() == get_pixel(test_bitmap, 125, 100));
        REQUIRE(color_white() == get_pixel(test_bitmap, 175, 100));
        free_bitmap(test_bitmap);
    }
    TEST_CASE("draw_ellipse_on_bitmap_within_rectangle_with_options_integration") {
        auto test_bitmap = create_bitmap("test_bitmap", 200, 200);
        clear_bitmap(test_bitmap, color_white());
        draw_ellipse_on_bitmap_within_rectangle_with_options(test_bitmap, color_black(), rectangle_from(50.0, 50.0, 100.0, 100.0), option_defaults());
        REQUIRE(color_black() == get_pixel(test_bitmap, 150, 100));
        REQUIRE(color_white() == get_pixel(test_bitmap, 125, 100));
        REQUIRE(color_white() == get_pixel(test_bitmap, 175, 100));
        free_bitmap(test_bitmap);
    }
    TEST_CASE("draw_ellipse_on_bitmap_integration") {
        auto test_bitmap = create_bitmap("test_bitmap", 200, 200);
        clear_bitmap(test_bitmap, color_white());
        draw_ellipse_on_bitmap(test_bitmap, color_black(), 100.0, 100.0, 50.0, 30.0);
        REQUIRE(color_black() == get_pixel(test_bitmap, 125, 100));
        REQUIRE(color_white() == get_pixel(test_bitmap, 100, 100));
        REQUIRE(color_white() == get_pixel(test_bitmap, 160, 100));
        free_bitmap(test_bitmap);
    }
    TEST_CASE("draw_ellipse_on_bitmap_with_options_integration") {
        auto test_bitmap = create_bitmap("test_bitmap", 200, 200);
        clear_bitmap(test_bitmap, color_white());
        draw_ellipse_on_bitmap_with_options(test_bitmap, color_black(), 100.0, 100.0, 50.0, 30.0, option_defaults());
        REQUIRE(color_black() == get_pixel(test_bitmap, 125, 100));
        REQUIRE(color_white() == get_pixel(test_bitmap, 100, 100));
        REQUIRE(color_white() == get_pixel(test_bitmap, 160, 100));
        free_bitmap(test_bitmap);
    }
    TEST_CASE("draw_ellipse_on_window_within_rectangle_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        clear_window(test_window, color_white());
        auto rect = rectangle_from(100.0, 100.0, 200.0, 100.0);
        draw_ellipse_on_window_within_rectangle(test_window, color_black(), rect);
        refresh_screen();
        REQUIRE(color_black() == get_pixel_from_window(test_window, 300, 150));
        REQUIRE(color_white() == get_pixel_from_window(test_window, 250, 150));
        REQUIRE(color_white() == get_pixel_from_window(test_window, 350, 150));
        close_window(test_window);
    }
    TEST_CASE("draw_ellipse_on_window_within_rectangle_with_options_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        clear_window(test_window, color_white());
        auto rect = rectangle_from(100.0, 100.0, 200.0, 100.0);
        draw_ellipse_on_window_within_rectangle_with_options(test_window, color_black(), rect, option_defaults());
        refresh_screen();
        REQUIRE(color_black() == get_pixel_from_window(test_window, 300, 150));
        REQUIRE(color_white() == get_pixel_from_window(test_window, 250, 150));
        REQUIRE(color_white() == get_pixel_from_window(test_window, 350, 150));
        close_window(test_window);
    }
    TEST_CASE("draw_ellipse_on_window_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        clear_window(test_window, color_white());
        draw_ellipse_on_window(test_window, color_black(), 400.0, 300.0, 100.0, 50.0);
        refresh_screen();
        REQUIRE(color_black() == get_pixel_from_window(test_window, 450, 300));
        REQUIRE(color_white() == get_pixel_from_window(test_window, 400, 300));
        REQUIRE(color_white() == get_pixel_from_window(test_window, 500, 300));
        close_window(test_window);
    }
    TEST_CASE("draw_ellipse_on_window_with_options_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        clear_window(test_window, color_white());
        draw_ellipse_on_window_with_options(test_window, color_black(), 400.0, 300.0, 100.0, 50.0, option_defaults());
        refresh_screen();
        REQUIRE(color_black() == get_pixel_from_window(test_window, 450, 300));
        REQUIRE(color_white() == get_pixel_from_window(test_window, 450, 325));
        REQUIRE(color_white() == get_pixel_from_window(test_window, 500, 300));
        close_window(test_window);
    }
    TEST_CASE("fill_ellipse_within_rectangle_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        clear_window(test_window, color_white());
        fill_ellipse_within_rectangle(color_black(), rectangle_from(100.0, 100.0, 200.0, 100.0));
        refresh_screen();
        REQUIRE(color_black() == get_pixel_from_window(test_window, 200, 100));
        REQUIRE(color_black() == get_pixel_from_window(test_window, 150, 150));
        REQUIRE(color_white() == get_pixel_from_window(test_window, 50, 50));
        close_window(test_window);
    }
    TEST_CASE("fill_ellipse_within_rectangle_with_options_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        clear_window(test_window, color_white());
        fill_ellipse_within_rectangle_with_options(color_black(), rectangle_from(100.0, 100.0, 200.0, 100.0), option_defaults());
        refresh_screen();
        REQUIRE(color_black() == get_pixel_from_window(test_window, 200, 100));
        REQUIRE(color_black() == get_pixel_from_window(test_window, 150, 150));
        REQUIRE(color_white() == get_pixel_from_window(test_window, 50, 50));
        close_window(test_window);
    }
    TEST_CASE("fill_ellipse_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        clear_window(test_window, color_white());
        fill_ellipse(color_black(), 400.0, 300.0, 100.0, 50.0);
        refresh_screen();
        REQUIRE(color_black() == get_pixel_from_window(test_window, 450, 300));
        REQUIRE(color_black() == get_pixel_from_window(test_window, 450, 325));
        REQUIRE(color_white() == get_pixel_from_window(test_window, 500, 300));
        close_window(test_window);
    }
    TEST_CASE("fill_ellipse_with_options_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        clear_window(test_window, color_white());
        fill_ellipse_with_options(color_black(), 400.0, 300.0, 100.0, 50.0, option_defaults());
        refresh_screen();
        REQUIRE(color_black() == get_pixel_from_window(test_window, 450, 300));
        REQUIRE(color_black() == get_pixel_from_window(test_window, 450, 325));
        REQUIRE(color_white() == get_pixel_from_window(test_window, 300, 300));
        close_window(test_window);
    }
    TEST_CASE("fill_ellipse_on_bitmap_within_rectangle_integration") {
        auto test_bitmap = create_bitmap("test_bitmap", 200, 200);
        clear_bitmap(test_bitmap, color_white());
        fill_ellipse_on_bitmap_within_rectangle(test_bitmap, color_black(), rectangle_from(50.0, 50.0, 100.0, 100.0));
        REQUIRE(color_black() == get_pixel(test_bitmap, 100, 100));
        REQUIRE(color_black() == get_pixel(test_bitmap, 75, 75));
        REQUIRE(color_white() == get_pixel(test_bitmap, 175, 175));
        free_bitmap(test_bitmap);
    }
    TEST_CASE("fill_ellipse_on_bitmap_within_rectangle_with_options_integration") {
        auto test_bitmap = create_bitmap("test_bitmap", 200, 200);
        clear_bitmap(test_bitmap, color_white());
        fill_ellipse_on_bitmap_within_rectangle_with_options(test_bitmap, color_black(), rectangle_from(50.0, 50.0, 100.0, 100.0), option_defaults());
        REQUIRE(color_black() == get_pixel(test_bitmap, 100, 100));
        REQUIRE(color_black() == get_pixel(test_bitmap, 75, 75));
        REQUIRE(color_white() == get_pixel(test_bitmap, 175, 175));
        free_bitmap(test_bitmap);
    }
    TEST_CASE("fill_ellipse_on_bitmap_integration") {
        auto test_bitmap = create_bitmap("test_bitmap", 200, 200);
        clear_bitmap(test_bitmap, color_white());
        fill_ellipse_on_bitmap(test_bitmap, color_black(), 100.0, 100.0, 50.0, 30.0);
        REQUIRE(color_black() == get_pixel(test_bitmap, 125, 100));
        REQUIRE(color_black() == get_pixel(test_bitmap, 125, 125));
        REQUIRE(color_white() == get_pixel(test_bitmap, 150, 100));
        free_bitmap(test_bitmap);
    }
    TEST_CASE("fill_ellipse_on_bitmap_with_options_integration") {
        auto test_bitmap = create_bitmap("test_bitmap", 200, 200);
        clear_bitmap(test_bitmap, color_white());
        fill_ellipse_on_bitmap_with_options(test_bitmap, color_black(), 50.0, 50.0, 100.0, 50.0, option_defaults());
        REQUIRE(color_black() == get_pixel(test_bitmap, 100, 50));
        REQUIRE(color_black() == get_pixel(test_bitmap, 100, 75));
        REQUIRE(color_white() == get_pixel(test_bitmap, 150, 50));
        free_bitmap(test_bitmap);
    }
    TEST_CASE("fill_ellipse_on_window_within_rectangle_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        clear_window(test_window, color_white());
        fill_ellipse_on_window_within_rectangle(test_window, color_black(), rectangle_from(100.0, 100.0, 200.0, 150.0));
        refresh_screen();
        REQUIRE(color_black() == get_pixel_from_window(test_window, 200, 175));
        REQUIRE(color_black() == get_pixel_from_window(test_window, 150, 175));
        REQUIRE(color_white() == get_pixel_from_window(test_window, 350, 175));
        close_window(test_window);
    }
    TEST_CASE("fill_ellipse_on_window_within_rectangle_with_options_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        clear_window(test_window, color_white());
        fill_ellipse_on_window_within_rectangle_with_options(test_window, color_black(), rectangle_from(100.0, 100.0, 200.0, 150.0), option_defaults());
        refresh_screen();
        REQUIRE(color_black() == get_pixel_from_window(test_window, 200, 175));
        REQUIRE(color_black() == get_pixel_from_window(test_window, 150, 175));
        REQUIRE(color_white() == get_pixel_from_window(test_window, 350, 175));
        close_window(test_window);
    }
    TEST_CASE("fill_ellipse_on_window_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        clear_window(test_window, color_white());
        fill_ellipse_on_window(test_window, color_black(), 400.0, 300.0, 100.0, 50.0);
        refresh_screen();
        REQUIRE(color_black() == get_pixel_from_window(test_window, 450, 300));
        REQUIRE(color_black() == get_pixel_from_window(test_window, 450, 325));
        REQUIRE(color_white() == get_pixel_from_window(test_window, 500, 300));
        close_window(test_window);
    }
    TEST_CASE("fill_ellipse_on_window_with_options_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        clear_window(test_window, color_white());
        fill_ellipse_on_window_with_options(test_window, color_black(), 400.0, 300.0, 100.0, 50.0, option_defaults());
        refresh_screen();
        REQUIRE(color_black() == get_pixel_from_window(test_window, 450, 300));
        REQUIRE(color_black() == get_pixel_from_window(test_window, 450, 325));
        REQUIRE(color_white() == get_pixel_from_window(test_window, 500, 300));
        close_window(test_window);
    }
    TEST_CASE("clear_screen_to_white_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        draw_pixel(color_black(), 100.0, 100.0);
        refresh_screen();
        REQUIRE(color_black() == get_pixel_from_window(test_window, 100, 100));
        clear_screen_to_white();
        refresh_screen();
        REQUIRE(color_white() == get_pixel_from_window(test_window, 100, 100));
        close_window(test_window);
    }
    TEST_CASE("clear_screen_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        draw_pixel(color_black(), 100.0, 100.0);
        refresh_screen();
        REQUIRE(color_black() == get_pixel_from_window(test_window, 100, 100));
        clear_screen(color_white());
        refresh_screen();
        REQUIRE(color_white() == get_pixel_from_window(test_window, 100, 100));
        close_window(test_window);
    }
    TEST_CASE("display_details_integration") {
        auto displays = number_of_displays();
        REQUIRE(displays > 0);
        auto display = display_details(0);
        REQUIRE(display != nullptr);
        REQUIRE(display_width(display) > 0);
        REQUIRE(display_height(display) > 0);
        REQUIRE(display_name(display) != nullptr);
    }
    TEST_CASE("display_height_integration") {
        auto display = display_details(0);
        REQUIRE(display_height(display) > 0);
    }
    TEST_CASE("display_name_integration") {
        auto display = display_details(0);
        REQUIRE(display_name(display) != nullptr);
        REQUIRE(!display_name(display).empty());
    }
    TEST_CASE("display_width_integration") {
        auto display = display_details(0);
        REQUIRE(display_width(display) > 0);
    }
    TEST_CASE("display_x_integration") {
        auto display = display_details(0);
        REQUIRE(display_x(display) > 0);
    }
    TEST_CASE("display_y_integration") {
        auto display = display_details(0);
        REQUIRE(display_y(display) > 0);
    }
    TEST_CASE("number_of_displays_integration") {
        REQUIRE(number_of_displays() > 0);
    }
    TEST_CASE("refresh_screen_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        clear_window(test_window, color_white());
        draw_circle(color_black(), circle_at(400.0, 300.0, 50.0));
        refresh_screen();
        close_window(test_window);
    }
    TEST_CASE("refresh_screen_with_target_fps_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        clear_window(test_window, color_white());
        draw_circle(color_black(), circle_at(400.0, 300.0, 50.0));
        refresh_screen_with_target_fps(60);
        close_window(test_window);
    }
    TEST_CASE("save_bitmap_integration") {
        auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
        clear_bitmap(test_bitmap, color_white());
        draw_pixel_on_bitmap(test_bitmap, color_black(), 50, 50);
        save_bitmap(test_bitmap, "test_bitmap");
        free_bitmap(test_bitmap);
    }
    TEST_CASE("screen_height_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        REQUIRE(600 == screen_height());
        close_window(test_window);
    }
    TEST_CASE("screen_width_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        REQUIRE(800 == screen_width());
        close_window(test_window);
    }
    TEST_CASE("take_screenshot_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        clear_window(test_window, color_white());
        draw_circle(color_black(), circle_at(400, 300, 50));
        refresh_screen();
        take_screenshot("test_screenshot");
        close_window(test_window);
    }
    TEST_CASE("take_screenshot_of_window_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        clear_window(test_window, color_white());
        draw_circle(color_black(), circle_at(400, 300, 50));
        refresh_screen();
        take_screenshot_of_window(test_window, "test_screenshot");
        close_window(test_window);
    }
    TEST_CASE("bitmap_bounding_circle_integration") {
        auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
        auto test_point = point_at(50.0, 50.0);
        auto bounding_circle = bitmap_bounding_circle(test_bitmap, test_point);
        REQUIRE(test_point == center_point(bounding_circle));
        REQUIRE(100 == circle_radius(bounding_circle));
        free_bitmap(test_bitmap);
    }
    TEST_CASE("bitmap_bounding_rectangle_integration") {
        auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
        auto bounding_rect = bitmap_bounding_rectangle(test_bitmap);
        REQUIRE(0 == bounding_rect->X);
        REQUIRE(0 == bounding_rect->Y);
        REQUIRE(100 == bounding_rect->Width);
        REQUIRE(100 == bounding_rect->Height);
        free_bitmap(test_bitmap);
    }
    TEST_CASE("bitmap_bounding_rectangle_at_location_integration") {
        auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
        auto bounding_rect = bitmap_bounding_rectangle_at_location(test_bitmap, 50.0, 50.0);
        REQUIRE(50 == bounding_rect->X);
        REQUIRE(50 == bounding_rect->Y);
        REQUIRE(100 == bounding_rect->Width);
        REQUIRE(100 == bounding_rect->Height);
        free_bitmap(test_bitmap);
    }
    TEST_CASE("bitmap_cell_center_integration") {
        auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
        auto center = bitmap_cell_center(test_bitmap);
        REQUIRE(50.0 == center->X);
        REQUIRE(50.0 == center->Y);
        free_bitmap(test_bitmap);
    }
    TEST_CASE("bitmap_cell_circle_integration") {
        auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
        bitmap_set_cell_details(test_bitmap, 50, 50, 2, 2, 4);
        auto circle = bitmap_cell_circle(test_bitmap, 50.0, 50.0);
        REQUIRE(50.0 == circle->Center.X);
        REQUIRE(50.0 == circle->Center.Y);
        REQUIRE(25 == circle->Radius);
        free_bitmap(test_bitmap);
    }
    TEST_CASE("bitmap_cell_circle_at_point_integration") {
        auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
        bitmap_set_cell_details(test_bitmap, 50, 50, 2, 2, 4);
        auto circle = bitmap_cell_circle_at_point(test_bitmap, point_at(100, 100));
        REQUIRE(100.0 == circle->Center.X);
        REQUIRE(100.0 == circle->Center.Y);
        REQUIRE(25 == circle->Radius);
        free_bitmap(test_bitmap);
    }
    TEST_CASE("bitmap_cell_circle_at_point_with_scale_integration") {
        auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
        bitmap_set_cell_details(test_bitmap, 50, 50, 2, 2, 4);
        auto circle = bitmap_cell_circle_at_point_with_scale(test_bitmap, point_at(100.0, 100.0), 2.0);
        REQUIRE(100.0 == circle->Center.X);
        REQUIRE(100.0 == circle->Center.Y);
        REQUIRE(50 == circle->Radius);
        free_bitmap(test_bitmap);
    }
    TEST_CASE("bitmap_cell_columns_integration") {
        auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
        bitmap_set_cell_details(test_bitmap, 20, 20, 5, 5, 25);
        REQUIRE(5 == bitmap_cell_columns(test_bitmap));
        free_bitmap(test_bitmap);
    }
    TEST_CASE("bitmap_cell_count_integration") {
        auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
        bitmap_set_cell_details(test_bitmap, 20, 20, 5, 5, 25);
        REQUIRE(25 == bitmap_cell_count(test_bitmap));
        free_bitmap(test_bitmap);
    }
    TEST_CASE("bitmap_cell_height_integration") {
        auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
        bitmap_set_cell_details(test_bitmap, 20, 20, 5, 5, 25);
        REQUIRE(20 == bitmap_cell_height(test_bitmap));
        free_bitmap(test_bitmap);
    }
    TEST_CASE("bitmap_cell_offset_integration") {
        auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
        bitmap_set_cell_details(test_bitmap, 25, 25, 4, 4, 16);
        auto offset = bitmap_cell_offset(test_bitmap, 5);
        REQUIRE(25.0 == offset->X);
        REQUIRE(25.0 == offset->Y);
        free_bitmap(test_bitmap);
    }
    TEST_CASE("bitmap_cell_rectangle_integration") {
        auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
        bitmap_set_cell_details(test_bitmap, 25, 25, 4, 4, 16);
        auto rect = bitmap_cell_rectangle(test_bitmap);
        REQUIRE(0 == rect->X);
        REQUIRE(0 == rect->Y);
        REQUIRE(25 == rect->Width);
        REQUIRE(25 == rect->Height);
        free_bitmap(test_bitmap);
    }
    TEST_CASE("bitmap_cell_rectangle_at_point_integration") {
        auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
        bitmap_set_cell_details(test_bitmap, 25, 25, 4, 4, 16);
        auto rect = bitmap_cell_rectangle_at_point(test_bitmap, point_at(50.0, 50.0));
        REQUIRE(50.0 == rect->X);
        REQUIRE(50.0 == rect->Y);
        REQUIRE(25.0 == rect->Width);
        REQUIRE(25.0 == rect->Height);
        free_bitmap(test_bitmap);
    }
    TEST_CASE("bitmap_cell_rows_integration") {
        auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
        bitmap_set_cell_details(test_bitmap, 20, 20, 5, 5, 25);
        REQUIRE(5 == bitmap_cell_rows(test_bitmap));
        free_bitmap(test_bitmap);
    }
    TEST_CASE("bitmap_cell_width_integration") {
        auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
        bitmap_set_cell_details(test_bitmap, 25, 25, 4, 4, 16);
        REQUIRE(25 == bitmap_cell_width(test_bitmap));
        free_bitmap(test_bitmap);
    }
    TEST_CASE("bitmap_center_integration") {
        auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
        auto test_center = bitmap_center(test_bitmap);
        REQUIRE(50.0 == test_center->X);
        REQUIRE(50.0 == test_center->Y);
        free_bitmap(test_bitmap);
    }
    TEST_CASE("bitmap_filename_integration") {
        auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
        REQUIRE("" == bitmap_filename(test_bitmap));
        free_bitmap(test_bitmap);
    }
    TEST_CASE("bitmap_height_integration") {
        auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
        REQUIRE(100 == bitmap_height(test_bitmap));
        free_bitmap(test_bitmap);
    }
    TEST_CASE("bitmap_height_of_bitmap_named_integration") {
        auto test_bitmap = create_bitmap("bitmap_height", 100, 100);
        REQUIRE(100 == bitmap_height_of_bitmap_named("bitmap_height"));
        free_bitmap(test_bitmap);
    }
    TEST_CASE("bitmap_name_integration") {
        auto test_bitmap = create_bitmap("bitmap_name", 100, 100);
        REQUIRE("bitmap_name" == bitmap_name(test_bitmap));
        free_bitmap(test_bitmap);
    }
    TEST_CASE("bitmap_named_integration") {
        auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
        REQUIRE(bitmap_named("test_bitmap") != nullptr);
        REQUIRE(bitmap_named("nonexistent_bitmap") == nullptr);
        free_bitmap(test_bitmap);
    }
    TEST_CASE("bitmap_rectangle_of_cell_integration") {
        auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
        bitmap_set_cell_details(test_bitmap, 25, 25, 4, 4, 16);
        auto rect = bitmap_rectangle_of_cell(test_bitmap, 5);
        REQUIRE(25.0 == rect->X);
        REQUIRE(25.0 == rect->Y);
        REQUIRE(25.0 == rect->Width);
        REQUIRE(25.0 == rect->Height);
        free_bitmap(test_bitmap);
    }
    TEST_CASE("bitmap_set_cell_details_integration") {
        auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
        bitmap_set_cell_details(test_bitmap, 20, 20, 5, 5, 25);
        REQUIRE(20 == bitmap_cell_width(test_bitmap));
        REQUIRE(20 == bitmap_cell_height(test_bitmap));
        REQUIRE(5 == bitmap_cell_columns(test_bitmap));
        REQUIRE(5 == bitmap_cell_rows(test_bitmap));
        REQUIRE(25 == bitmap_cell_count(test_bitmap));
        free_bitmap(test_bitmap);
    }
    TEST_CASE("bitmap_valid_integration") {
        auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
        REQUIRE(bitmap_valid(test_bitmap));
        free_bitmap(test_bitmap);
        REQUIRE_FALSE(bitmap_valid(test_bitmap));
    }
    TEST_CASE("bitmap_width_integration") {
        auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
        REQUIRE(100 == bitmap_width(test_bitmap));
        free_bitmap(test_bitmap);
    }
    TEST_CASE("bitmap_width_of_bitmap_named_integration") {
        auto test_bitmap = create_bitmap("bitmap_width", 100, 100);
        REQUIRE(100 == bitmap_width_of_bitmap_named("bitmap_width"));
        free_bitmap(test_bitmap);
    }
    TEST_CASE("clear_bitmap_integration") {
        auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
        draw_pixel_on_bitmap(test_bitmap, color_black(), 50, 50);
        REQUIRE(color_black() == get_pixel(test_bitmap, 50, 50));
        clear_bitmap(test_bitmap, color_white());
        REQUIRE(color_white() == get_pixel(test_bitmap, 50, 50));
        free_bitmap(test_bitmap);
    }
    TEST_CASE("clear_bitmap_named_integration") {
        auto test_bitmap = create_bitmap("bitmap_named", 100, 100);
        fill_rectangle_on_bitmap(test_bitmap, color_red(), 0, 0, 100, 100);
        REQUIRE(color_red() == get_pixel(test_bitmap, 50, 50));
        clear_bitmap_named("bitmap_named", color_white());
        REQUIRE(color_white() == get_pixel(test_bitmap, 50, 50));
        free_bitmap(test_bitmap);
    }
    TEST_CASE("create_bitmap_integration") {
        auto test_bitmap = create_bitmap("bitmap_name1", 100, 100);
        REQUIRE(test_bitmap != nullptr);
        REQUIRE(100 == bitmap_width(test_bitmap));
        REQUIRE(100 == bitmap_height(test_bitmap));
        REQUIRE("bitmap_name1" == bitmap_name(test_bitmap));
        free_bitmap(test_bitmap);
    }
    TEST_CASE("draw_bitmap_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
        clear_window(test_window, color_white());
        fill_rectangle_on_bitmap(test_bitmap, color_red(), 0, 0, 50, 50);
        draw_bitmap(test_bitmap, 100.0, 100.0);
        refresh_screen();
        REQUIRE(color_red() == get_pixel_from_window(test_window, 125, 125));
        REQUIRE(color_white() == get_pixel_from_window(test_window, 175, 175));
        free_bitmap(test_bitmap);
        close_window(test_window);
    }
    TEST_CASE("draw_bitmap_with_options_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
        clear_window(test_window, color_white());
        fill_rectangle_on_bitmap(test_bitmap, color_red(), 0, 0, 100, 100);
        draw_bitmap_with_options(test_bitmap, 100.0, 100.0, option_defaults());
        refresh_screen();
        REQUIRE(color_red() == get_pixel_from_window(test_window, 125, 125));
        REQUIRE(color_white() == get_pixel_from_window(test_window, 50, 50));
        free_bitmap(test_bitmap);
        close_window(test_window);
    }
    TEST_CASE("draw_bitmap_named_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
        clear_window(test_window, color_white());
        fill_rectangle_on_bitmap(test_bitmap, color_red(), 0, 0, 100, 100);
        draw_bitmap_named("test_bitmap", 100.0, 100.0);
        refresh_screen();
        REQUIRE(color_red() == get_pixel_from_window(test_window, 125, 125));
        REQUIRE(color_white() == get_pixel_from_window(test_window, 50, 50));
        free_bitmap(test_bitmap);
        close_window(test_window);
    }
    TEST_CASE("draw_bitmap_named_with_options_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
        clear_window(test_window, color_white());
        fill_rectangle_on_bitmap(test_bitmap, color_red(), 0, 0, 100, 100);
        draw_bitmap_named_with_options("test_bitmap", 100.0, 100.0, option_defaults());
        refresh_screen();
        REQUIRE(color_red() == get_pixel_from_window(test_window, 125, 125));
        REQUIRE(color_white() == get_pixel_from_window(test_window, 50, 50));
        free_bitmap(test_bitmap);
        close_window(test_window);
    }
    TEST_CASE("draw_bitmap_on_bitmap_on_bitmap_integration") {
        auto dest_bitmap = create_bitmap("test_destination", 100, 100);
        auto source_bitmap = create_bitmap("test_source", 50, 50);
        clear_bitmap(dest_bitmap, color_white());
        fill_rectangle_on_bitmap(source_bitmap, color_red(), 0, 0, 50, 50);
        draw_bitmap_on_bitmap_on_bitmap(dest_bitmap, source_bitmap, 25.0, 25.0);
        REQUIRE(color_red() == get_pixel(dest_bitmap, 50, 50));
        REQUIRE(color_white() == get_pixel(dest_bitmap, 10, 10));
        free_bitmap(dest_bitmap);
        free_bitmap(source_bitmap);
    }
    TEST_CASE("draw_bitmap_on_bitmap_on_bitmap_with_options_integration") {
        auto dest_bitmap = create_bitmap("test_destination", 100, 100);
        auto source_bitmap = create_bitmap("test_source", 50, 50);
        clear_bitmap(dest_bitmap, color_white());
        fill_rectangle_on_bitmap(source_bitmap, color_red(), 0, 0, 50, 50);
        draw_bitmap_on_bitmap_on_bitmap_with_options(dest_bitmap, source_bitmap, 25.0, 25.0, option_defaults());
        REQUIRE(color_red() == get_pixel(dest_bitmap, 50, 50));
        REQUIRE(color_white() == get_pixel(dest_bitmap, 10, 10));
        free_bitmap(dest_bitmap);
        free_bitmap(source_bitmap);
    }
    TEST_CASE("draw_bitmap_on_window_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
        clear_window(test_window, color_white());
        fill_rectangle_on_bitmap(test_bitmap, color_red(), 0, 0, 100, 100);
        draw_bitmap_on_window(test_window, test_bitmap, 100.0, 100.0);
        refresh_screen();
        REQUIRE(color_red() == get_pixel_from_window(test_window, 125, 125));
        REQUIRE(color_white() == get_pixel_from_window(test_window, 50, 50));
        free_bitmap(test_bitmap);
        close_window(test_window);
    }
    TEST_CASE("draw_bitmap_on_window_with_options_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
        clear_window(test_window, color_white());
        fill_rectangle_on_bitmap(test_bitmap, color_red(), 0, 0, 100, 100);
        draw_bitmap_on_window_with_options(test_window, test_bitmap, 100.0, 100.0, option_defaults());
        refresh_screen();
        REQUIRE(color_red() == get_pixel_from_window(test_window, 125, 125));
        REQUIRE(color_white() == get_pixel_from_window(test_window, 50, 50));
        free_bitmap(test_bitmap);
        close_window(test_window);
    }
    TEST_CASE("free_all_bitmaps_integration") {
        auto bitmap1 = create_bitmap("test_bitmap_1", 100, 100);
        auto bitmap2 = create_bitmap("test_bitmap_2", 100, 100);
        REQUIRE(bitmap_valid(bitmap1));
        REQUIRE(bitmap_valid(bitmap2));
        free_all_bitmaps();
        REQUIRE_FALSE(bitmap_valid(bitmap1));
        REQUIRE_FALSE(bitmap_valid(bitmap2));
    }
    TEST_CASE("free_bitmap_integration") {
        auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
        REQUIRE(bitmap_valid(test_bitmap));
        free_bitmap(test_bitmap);
        REQUIRE_FALSE(bitmap_valid(test_bitmap));
    }
    TEST_CASE("has_bitmap_integration") {
        auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
        REQUIRE(has_bitmap("test_bitmap"));
        free_bitmap(test_bitmap);
        REQUIRE_FALSE(has_bitmap("test_bitmap"));
    }
    TEST_CASE("load_bitmap_integration") {
        auto loaded_bitmap = load_bitmap("loaded_bitmap", "frog.png");
        REQUIRE(color_black() == get_pixel(loaded_bitmap, 50, 50));
        REQUIRE(color_white() == get_pixel(loaded_bitmap, 75, 75));
        free_bitmap(loaded_bitmap);
    }
    TEST_CASE("pixel_drawn_at_point_pt_integration") {
        auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
        clear_bitmap(test_bitmap, color_white());
        draw_pixel_on_bitmap(test_bitmap, color_black(), point_at(50.0, 50.0));
        REQUIRE(color_black() == get_pixel(test_bitmap, 50, 50));
        REQUIRE(color_white() == get_pixel(test_bitmap, 75, 75));
        free_bitmap(test_bitmap);
    }
    TEST_CASE("pixel_drawn_at_point_integration") {
        auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
        clear_bitmap(test_bitmap, color_white());
        draw_pixel_on_bitmap(test_bitmap, color_black(), 50.0, 50.0);
        REQUIRE(color_black() == get_pixel(test_bitmap, 50, 50));
        REQUIRE(color_white() == get_pixel(test_bitmap, 75, 75));
        free_bitmap(test_bitmap);
    }
    TEST_CASE("pixel_drawn_at_point_in_cell_pt_integration") {
        auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
        clear_bitmap(test_bitmap, color_white());
        draw_pixel_on_bitmap(test_bitmap, color_black(), point_at(50.0, 50.0));
        bitmap_set_cell_details(test_bitmap, 100, 100, 1, 1, 1);
        REQUIRE(color_black() == get_pixel(test_bitmap, 50, 50));
        REQUIRE(color_white() == get_pixel(test_bitmap, 75, 50));
        free_bitmap(test_bitmap);
    }
    TEST_CASE("pixel_drawn_at_point_in_cell_integration") {
        auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
        clear_bitmap(test_bitmap, color_white());
        draw_pixel_on_bitmap(test_bitmap, color_black(), point_at(50.0, 50.0));
        bitmap_set_cell_details(test_bitmap, 100, 100, 1, 1, 1);
        REQUIRE(color_black() == get_pixel(test_bitmap, 50, 50));
        REQUIRE(color_white() == get_pixel(test_bitmap, 75, 75));
        free_bitmap(test_bitmap);
    }
    TEST_CASE("setup_collision_mask_integration") {
        auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
        clear_bitmap(test_bitmap, color_white());
        setup_collision_mask(test_bitmap);
        REQUIRE(color_black() == get_pixel(test_bitmap, 50, 50));
        free_bitmap(test_bitmap);
    }
    TEST_CASE("draw_line_record_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        clear_window(test_window, color_white());
        draw_line_record(color_black(), line_from(point_at(100.0, 100.0), point_at(200.0, 200.0)));
        refresh_screen();
        REQUIRE(color_black() == get_pixel_from_window(test_window, 100, 100));
        REQUIRE(color_white() == get_pixel_from_window(test_window, 99, 99));
        close_window(test_window);
    }
    TEST_CASE("draw_line_record_with_options_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        clear_window(test_window, color_white());
        draw_line_record_with_options(color_black(), line_from(point_at(100.0, 100.0), point_at(200.0, 200.0)), option_line_width(3, option_defaults()));
        refresh_screen();
        REQUIRE(color_black() == get_pixel_from_window(test_window, 100, 100));
        REQUIRE(color_white() == get_pixel_from_window(test_window, 99, 99));
        close_window(test_window);
    }
    TEST_CASE("draw_line_point_to_point_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        clear_window(test_window, color_white());
        draw_line_point_to_point(color_black(), point_at(100.0, 100.0), point_at(200.0, 200.0));
        refresh_screen();
        REQUIRE(color_black() == get_pixel_from_window(test_window, 100, 100));
        REQUIRE(color_white() == get_pixel_from_window(test_window, 99, 99));
        close_window(test_window);
    }
    TEST_CASE("draw_line_point_to_point_with_options_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        clear_window(test_window, color_white());
        draw_line_point_to_point_with_options(color_black(), point_at(100.0, 100.0), point_at(200.0, 200.0), option_defaults());
        refresh_screen();
        REQUIRE(color_black() == get_pixel_from_window(test_window, 100, 100));
        REQUIRE(color_white() == get_pixel_from_window(test_window, 99, 99));
        close_window(test_window);
    }
    TEST_CASE("draw_line_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        clear_window(test_window, color_white());
        draw_line(color_black(), 100.0, 100.0, 200.0, 200.0);
        refresh_screen();
        REQUIRE(color_black() == get_pixel_from_window(test_window, 100, 100));
        REQUIRE(color_white() == get_pixel_from_window(test_window, 99, 99));
        close_window(test_window);
    }
    TEST_CASE("draw_line_with_options_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        clear_window(test_window, color_white());
        draw_line_with_options(color_black(), 100.0, 100.0, 200.0, 200.0, option_defaults());
        refresh_screen();
        REQUIRE(color_black() == get_pixel_from_window(test_window, 100, 100));
        REQUIRE(color_white() == get_pixel_from_window(test_window, 99, 99));
        close_window(test_window);
    }
    TEST_CASE("draw_line_on_bitmap_record_integration") {
        auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
        clear_bitmap(test_bitmap, color_white());
        draw_line_on_bitmap_record(test_bitmap, color_black(), line_from(point_at(10.0, 10.0), point_at(90.0, 90.0)));
        REQUIRE(color_black() == get_pixel(test_bitmap, 50, 50));
        REQUIRE(color_white() == get_pixel(test_bitmap, 95, 95));
        free_bitmap(test_bitmap);
    }
    TEST_CASE("draw_line_on_bitmap_record_with_options_integration") {
        auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
        clear_bitmap(test_bitmap, color_white());
        draw_line_on_bitmap_record_with_options(test_bitmap, color_black(), line_from(point_at(10.0, 10.0), point_at(90.0, 90.0)), option_defaults());
        REQUIRE(color_black() == get_pixel(test_bitmap, 50, 50));
        REQUIRE(color_white() == get_pixel(test_bitmap, 95, 50));
        free_bitmap(test_bitmap);
    }
    TEST_CASE("draw_line_on_bitmap_point_to_point_integration") {
        auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
        clear_bitmap(test_bitmap, color_white());
        draw_line_on_bitmap_point_to_point(test_bitmap, color_black(), point_at(10.0, 10.0), point_at(90.0, 90.0));
        REQUIRE(color_black() == get_pixel(test_bitmap, 50, 50));
        REQUIRE(color_white() == get_pixel(test_bitmap, 0, 0));
        free_bitmap(test_bitmap);
    }
    TEST_CASE("draw_line_on_bitmap_point_to_point_with_options_integration") {
        auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
        clear_bitmap(test_bitmap, color_white());
        draw_line_on_bitmap_point_to_point_with_options(test_bitmap, color_black(), point_at(10.0, 10.0), point_at(90.0, 90.0), option_defaults());
        REQUIRE(color_black() == get_pixel(test_bitmap, 10, 10));
        REQUIRE(color_black() == get_pixel(test_bitmap, 90, 90));
        REQUIRE(color_white() == get_pixel(test_bitmap, 5, 5));
        free_bitmap(test_bitmap);
    }
    TEST_CASE("draw_line_on_bitmap_integration") {
        auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
        clear_bitmap(test_bitmap, color_white());
        draw_line_on_bitmap(test_bitmap, color_black(), 10.0, 10.0, 90.0, 90.0);
        REQUIRE(color_black() == get_pixel(test_bitmap, 50, 50));
        REQUIRE(color_white() == get_pixel(test_bitmap, 95, 50));
        free_bitmap(test_bitmap);
    }
    TEST_CASE("draw_line_on_bitmap_with_options_integration") {
        auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
        clear_bitmap(test_bitmap, color_white());
        draw_line_on_bitmap_with_options(test_bitmap, color_black(), 10.0, 10.0, 90.0, 90.0, option_defaults());
        REQUIRE(color_black() == get_pixel(test_bitmap, 50, 50));
        REQUIRE(color_white() == get_pixel(test_bitmap, 5, 5));
        free_bitmap(test_bitmap);
    }
    TEST_CASE("draw_line_on_window_record_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        clear_window(test_window, color_white());
        line_from(point_at(100.0, 100.0), point_at(150.0, 150.0));
        refresh_screen();
        REQUIRE(color_black() == get_pixel_from_window(test_window, 100, 100));
        REQUIRE(color_white() == get_pixel_from_window(test_window, 99, 99));
        close_window(test_window);
    }
    TEST_CASE("draw_line_on_window_record_with_options_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        clear_window(test_window, color_white());
        option_defaults();
        refresh_screen();
        REQUIRE(color_black() == get_pixel_from_window(test_window, 100, 100));
        REQUIRE(color_white() == get_pixel_from_window(test_window, 99, 99));
        close_window(test_window);
    }
    TEST_CASE("draw_line_on_window_point_to_point_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        clear_window(test_window, color_white());
        draw_line_on_window_point_to_point(test_window, color_black(), point_at(100.0, 100.0), point_at(200.0, 200.0));
        refresh_screen();
        REQUIRE(color_black() == get_pixel_from_window(test_window, 100, 100));
        REQUIRE(color_white() == get_pixel_from_window(test_window, 99, 99));
        close_window(test_window);
    }
    TEST_CASE("draw_line_on_window_point_to_point_with_options_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        clear_window(test_window, color_white());
        option_defaults();
        refresh_screen();
        REQUIRE(color_black() == get_pixel_from_window(test_window, 100, 100));
        REQUIRE(color_white() == get_pixel_from_window(test_window, 99, 99));
        close_window(test_window);
    }
    TEST_CASE("draw_line_on_window_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        clear_window(test_window, color_white());
        draw_line_on_window(test_window, color_black(), 100.0, 100.0, 200.0, 200.0);
        refresh_screen();
        REQUIRE(color_black() == get_pixel_from_window(test_window, 100, 100));
        REQUIRE(color_white() == get_pixel_from_window(test_window, 99, 99));
        close_window(test_window);
    }
    TEST_CASE("draw_line_on_window_with_options_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        clear_window(test_window, color_white());
        draw_line_on_window_with_options(test_window, color_black(), 100.0, 100.0, 200.0, 200.0, option_defaults());
        refresh_screen();
        REQUIRE(color_black() == get_pixel_from_window(test_window, 100, 100));
        REQUIRE(color_white() == get_pixel_from_window(test_window, 99, 99));
        close_window(test_window);
    }
    TEST_CASE("draw_pixel_at_point_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        clear_window(test_window, color_white());
        draw_pixel_at_point(color_black(), point_at(100.0, 100.0));
        refresh_screen();
        REQUIRE(color_black() == get_pixel_from_window(test_window, 100, 100));
        REQUIRE(color_white() == get_pixel_from_window(test_window, 99, 99));
        close_window(test_window);
    }
    TEST_CASE("draw_pixel_at_point_with_options_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        clear_window(test_window, color_white());
        draw_pixel_at_point_with_options(color_black(), point_at(100.0, 100.0), option_defaults());
        refresh_screen();
        REQUIRE(color_black() == get_pixel_from_window(test_window, 100, 100));
        REQUIRE(color_white() == get_pixel_from_window(test_window, 99, 99));
        close_window(test_window);
    }
    TEST_CASE("draw_pixel_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        clear_window(test_window, color_white());
        draw_pixel(color_black(), 100.0, 100.0);
        refresh_screen();
        REQUIRE(color_black() == get_pixel_from_window(test_window, 100, 100));
        REQUIRE(color_white() == get_pixel_from_window(test_window, 99, 99));
        close_window(test_window);
    }
    TEST_CASE("draw_pixel_with_options_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        clear_window(test_window, color_white());
        draw_pixel_with_options(color_black(), 100.0, 100.0, option_defaults());
        refresh_screen();
        REQUIRE(color_black() == get_pixel_from_window(test_window, 100, 100));
        REQUIRE(color_white() == get_pixel_from_window(test_window, 99, 99));
        close_window(test_window);
    }
    TEST_CASE("draw_pixel_on_bitmap_at_point_integration") {
        auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
        clear_bitmap(test_bitmap, color_white());
        draw_pixel_on_bitmap_at_point(test_bitmap, color_black(), point_at(50.0, 50.0));
        REQUIRE(color_black() == get_pixel(test_bitmap, 50, 50));
        REQUIRE(color_white() == get_pixel(test_bitmap, 0, 0));
        free_bitmap(test_bitmap);
    }
    TEST_CASE("draw_pixel_on_bitmap_at_point_with_options_integration") {
        auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
        clear_bitmap(test_bitmap, color_white());
        draw_pixel_on_bitmap_at_point_with_options(test_bitmap, color_black(), point_at(50.0, 50.0), option_defaults());
        REQUIRE(color_black() == get_pixel(test_bitmap, 50, 50));
        REQUIRE(color_white() == get_pixel(test_bitmap, 0, 0));
        free_bitmap(test_bitmap);
    }
    TEST_CASE("draw_pixel_on_bitmap_integration") {
        auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
        clear_bitmap(test_bitmap, color_white());
        draw_pixel_on_bitmap(test_bitmap, color_black(), 50.0, 50.0);
        REQUIRE(color_black() == get_pixel(test_bitmap, 50, 50));
        REQUIRE(color_white() == get_pixel(test_bitmap, 51, 50));
        free_bitmap(test_bitmap);
    }
    TEST_CASE("draw_pixel_on_bitmap_with_options_integration") {
        auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
        clear_bitmap(test_bitmap, color_white());
        draw_pixel_on_bitmap_with_options(test_bitmap, color_black(), 50.0, 50.0, option_defaults());
        REQUIRE(color_black() == get_pixel(test_bitmap, 50, 50));
        REQUIRE(color_white() == get_pixel(test_bitmap, 51, 50));
        free_bitmap(test_bitmap);
    }
    TEST_CASE("draw_pixel_on_window_at_point_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        clear_window(test_window, color_white());
        draw_pixel_on_window_at_point(test_window, color_black(), point_at(100.0, 100.0));
        refresh_screen();
        REQUIRE(color_black() == get_pixel_from_window(test_window, 100, 100));
        REQUIRE(color_white() == get_pixel_from_window(test_window, 99, 99));
        close_window(test_window);
    }
    TEST_CASE("draw_pixel_on_window_at_point_with_options_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        clear_window(test_window, color_white());
        draw_pixel_on_window_at_point_with_options(test_window, color_black(), point_at(100.0, 100.0), option_defaults());
        refresh_screen();
        REQUIRE(color_black() == get_pixel_from_window(test_window, 100, 100));
        REQUIRE(color_white() == get_pixel_from_window(test_window, 99, 99));
        close_window(test_window);
    }
    TEST_CASE("draw_pixel_on_window_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        clear_window(test_window, color_white());
        draw_pixel_on_window(test_window, color_black(), 100.0, 100.0);
        refresh_screen();
        REQUIRE(color_black() == get_pixel_from_window(test_window, 100, 100));
        REQUIRE(color_white() == get_pixel_from_window(test_window, 99, 99));
        close_window(test_window);
    }
    TEST_CASE("draw_pixel_on_window_with_options_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        clear_window(test_window, color_white());
        draw_pixel_on_window_with_options(test_window, color_black(), 100.0, 100.0, option_defaults());
        refresh_screen();
        REQUIRE(color_black() == get_pixel_from_window(test_window, 100, 100));
        REQUIRE(color_white() == get_pixel_from_window(test_window, 99, 99));
        close_window(test_window);
    }
    TEST_CASE("get_pixel_from_bitmap_at_point_integration") {
        auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
        clear_bitmap(test_bitmap, color_white());
        draw_pixel_on_bitmap(test_bitmap, color_black(), point_at(50.0, 50.0));
        REQUIRE(color_black() == get_pixel_from_bitmap_at_point(test_bitmap, 50, 50));
        REQUIRE(color_white() == get_pixel_from_bitmap_at_point(test_bitmap, 49, 49));
        free_bitmap(test_bitmap);
    }
    TEST_CASE("get_pixel_from_bitmap_integration") {
        auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
        clear_bitmap(test_bitmap, color_white());
        draw_pixel_on_bitmap(test_bitmap, color_black(), 50.0, 50.0);
        REQUIRE(color_black() == get_pixel_from_bitmap(test_bitmap, 50, 50));
        REQUIRE(color_white() == get_pixel_from_bitmap(test_bitmap, 49, 49));
        free_bitmap(test_bitmap);
    }
    TEST_CASE("get_pixel_at_point_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        clear_window(test_window, color_white());
        draw_pixel(color_black(), point_at(100.0, 100.0));
        refresh_screen();
        REQUIRE(color_black() == get_pixel_from_window(test_window, 100, 100));
        REQUIRE(color_white() == get_pixel_from_window(test_window, 99, 99));
        close_window(test_window);
    }
    TEST_CASE("get_pixel_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        clear_window(test_window, color_white());
        draw_pixel(color_black(), 100.0, 100.0);
        refresh_screen();
        REQUIRE(color_black() == get_pixel_from_window(test_window, 100, 100));
        REQUIRE(color_white() == get_pixel_from_window(test_window, 99, 99));
        close_window(test_window);
    }
    TEST_CASE("get_pixel_from_window_at_point_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        clear_window(test_window, color_white());
        draw_pixel(color_black(), point_at(100.0, 100.0));
        refresh_screen();
        REQUIRE(color_black() == get_pixel_from_window_at_point(test_window, 100, 100));
        REQUIRE(color_white() == get_pixel_from_window_at_point(test_window, 99, 99));
        close_window(test_window);
    }
    TEST_CASE("get_pixel_from_window_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        clear_window(test_window, color_white());
        draw_pixel(color_black(), 100.0, 100.0);
        refresh_screen();
        REQUIRE(color_black() == get_pixel_from_window(test_window, 100, 100));
        REQUIRE(color_white() == get_pixel_from_window(test_window, 99, 99));
        close_window(test_window);
    }
    TEST_CASE("get_pixel_from_window_at_point_from_window_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        clear_window(test_window, color_white());
        draw_pixel(color_black(), point_at(100.0, 100.0));
        refresh_screen();
        REQUIRE(color_black() == get_pixel_from_window_at_point_from_window(test_window, 100, 100));
        REQUIRE(color_white() == get_pixel_from_window_at_point_from_window(test_window, 99, 99));
        close_window(test_window);
    }
    TEST_CASE("get_pixel_from_window_from_window_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        clear_window(test_window, color_white());
        draw_pixel(color_black(), 100.0, 100.0);
        refresh_screen();
        REQUIRE(color_black() == get_pixel_from_window_from_window(test_window, 100, 100));
        REQUIRE(color_white() == get_pixel_from_window_from_window(test_window, 99, 99));
        close_window(test_window);
    }
    TEST_CASE("draw_quad_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        clear_window(test_window, color_white());
        auto quad = quad_from(point_at(100.0, 100.0), point_at(200.0, 100.0), point_at(100.0, 200.0), point_at(200.0, 200.0));
        draw_quad(color_black(), quad);
        refresh_screen();
        REQUIRE(color_black() == get_pixel_from_window(test_window, 100, 100));
        REQUIRE(color_white() == get_pixel_from_window(test_window, 150, 150));
        REQUIRE(color_white() == get_pixel_from_window(test_window, 250, 250));
        close_window(test_window);
    }
    TEST_CASE("draw_quad_with_options_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        clear_window(test_window, color_white());
        auto quad = quad_from(point_at(100.0, 100.0), point_at(200.0, 100.0), point_at(100.0, 200.0), point_at(200.0, 200.0));
        draw_quad_with_options(color_black(), quad, option_defaults());
        refresh_screen();
        REQUIRE(color_black() == get_pixel_from_window(test_window, 100, 100));
        REQUIRE(color_white() == get_pixel_from_window(test_window, 150, 150));
        REQUIRE(color_white() == get_pixel_from_window(test_window, 250, 250));
        close_window(test_window);
    }
    TEST_CASE("draw_quad_on_bitmap_integration") {
        auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
        clear_bitmap(test_bitmap, color_white());
        auto quad = quad_from(point_at(10.0, 10.0), point_at(90.0, 10.0), point_at(10.0, 90.0), point_at(90.0, 90.0));
        draw_quad_on_bitmap(test_bitmap, color_black(), quad);
        REQUIRE(color_black() == get_pixel(test_bitmap, 10, 10));
        REQUIRE(color_white() == get_pixel(test_bitmap, 50, 50));
        REQUIRE(color_white() == get_pixel(test_bitmap, 5, 5));
        free_bitmap(test_bitmap);
    }
    TEST_CASE("draw_quad_on_bitmap_with_options_integration") {
        auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
        clear_bitmap(test_bitmap, color_white());
        auto quad = quad_from(point_at(10.0, 10.0), point_at(90.0, 10.0), point_at(90.0, 90.0), point_at(10.0, 90.0));
        draw_quad_on_bitmap_with_options(test_bitmap, color_black(), quad, option_defaults());
        REQUIRE(color_black() == get_pixel(test_bitmap, 10, 10));
        REQUIRE(color_black() == get_pixel(test_bitmap, 50, 50));
        REQUIRE(color_white() == get_pixel(test_bitmap, 5, 5));
        free_bitmap(test_bitmap);
    }
    TEST_CASE("draw_quad_on_window_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        clear_window(test_window, color_white());
        auto quad = quad_from(point_at(100.0, 100.0), point_at(200.0, 100.0), point_at(100.0, 200.0), point_at(200.0, 200.0));
        draw_quad_on_window(test_window, color_black(), quad);
        refresh_screen();
        REQUIRE(color_black() == get_pixel_from_window(test_window, 100, 100));
        REQUIRE(color_white() == get_pixel_from_window(test_window, 150, 150));
        REQUIRE(color_white() == get_pixel_from_window(test_window, 250, 250));
        close_window(test_window);
    }
    TEST_CASE("draw_quad_on_window_with_options_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        clear_window(test_window, color_white());
        auto quad = quad_from(point_at(100.0, 100.0), point_at(200.0, 100.0), point_at(100.0, 200.0), point_at(200.0, 200.0));
        draw_quad_on_window_with_options(test_window, color_black(), quad, option_defaults());
        refresh_screen();
        REQUIRE(color_black() == get_pixel_from_window(test_window, 100, 100));
        REQUIRE(color_white() == get_pixel_from_window(test_window, 150, 150));
        REQUIRE(color_white() == get_pixel_from_window(test_window, 250, 250));
        close_window(test_window);
    }
    TEST_CASE("draw_rectangle_record_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        clear_window(test_window, color_white());
        auto rectangle = rectangle_from(100.0, 100.0, 200.0, 150.0);
        draw_rectangle_record(color_black(), rectangle);
        refresh_screen();
        REQUIRE(color_black() == get_pixel_from_window(test_window, 100, 100));
        REQUIRE(color_white() == get_pixel_from_window(test_window, 150, 125));
        REQUIRE(color_white() == get_pixel_from_window(test_window, 301, 251));
        close_window(test_window);
    }
    TEST_CASE("draw_rectangle_record_with_options_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        clear_window(test_window, color_white());
        auto rectangle = rectangle_from(100.0, 100.0, 200.0, 150.0);
        draw_rectangle_record_with_options(color_black(), rectangle, option_defaults());
        refresh_screen();
        REQUIRE(color_black() == get_pixel_from_window(test_window, 100, 100));
        REQUIRE(color_white() == get_pixel_from_window(test_window, 150, 125));
        REQUIRE(color_white() == get_pixel_from_window(test_window, 350, 300));
        close_window(test_window);
    }
    TEST_CASE("draw_rectangle_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        clear_window(test_window, color_white());
        draw_rectangle(color_black(), 100.0, 100.0, 200.0, 150.0);
        refresh_screen();
        REQUIRE(color_black() == get_pixel_from_window(test_window, 100, 100));
        REQUIRE(color_white() == get_pixel_from_window(test_window, 301, 251));
        close_window(test_window);
    }
    TEST_CASE("draw_rectangle_with_options_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        clear_window(test_window, color_white());
        draw_rectangle_with_options(color_black(), 100.0, 100.0, 200.0, 150.0, option_line_width(3, option_defaults()));
        refresh_screen();
        REQUIRE(color_black() == get_pixel_from_window(test_window, 100, 100));
        REQUIRE(color_black() == get_pixel_from_window(test_window, 101, 100));
        REQUIRE(color_white() == get_pixel_from_window(test_window, 150, 125));
        REQUIRE(color_white() == get_pixel_from_window(test_window, 301, 251));
        close_window(test_window);
    }
    TEST_CASE("draw_rectangle_on_bitmap_record_integration") {
        auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
        clear_bitmap(test_bitmap, color_white());
        auto rectangle = rectangle_from(50.0, 50.0, 20.0, 30.0);
        draw_rectangle_on_bitmap_record(test_bitmap, color_black(), rectangle);
        REQUIRE(color_black() == get_pixel(test_bitmap, 50, 50));
        REQUIRE(color_white() == get_pixel(test_bitmap, 80, 90));
        free_bitmap(test_bitmap);
    }
    TEST_CASE("draw_rectangle_on_bitmap_record_with_options_integration") {
        auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
        clear_bitmap(test_bitmap, color_white());
        auto rectangle = rectangle_from(50.0, 50.0, 20.0, 20.0);
        draw_rectangle_on_bitmap_record_with_options(test_bitmap, color_black(), rectangle, option_defaults());
        REQUIRE(color_black() == get_pixel(test_bitmap, 50, 50));
        REQUIRE(color_white() == get_pixel(test_bitmap, 75, 75));
        free_bitmap(test_bitmap);
    }
    TEST_CASE("draw_rectangle_on_bitmap_integration") {
        auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
        clear_bitmap(test_bitmap, color_white());
        draw_rectangle_on_bitmap(test_bitmap, color_black(), 50.0, 50.0, 20.0, 20.0);
        REQUIRE(color_black() == get_pixel(test_bitmap, 50, 50));
        REQUIRE(color_white() == get_pixel(test_bitmap, 75, 75));
        free_bitmap(test_bitmap);
    }
    TEST_CASE("draw_rectangle_on_bitmap_with_options_integration") {
        auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
        clear_bitmap(test_bitmap, color_white());
        draw_rectangle_on_bitmap_with_options(test_bitmap, color_black(), 50.0, 50.0, 20.0, 20.0, option_defaults());
        REQUIRE(color_black() == get_pixel(test_bitmap, 50, 50));
        REQUIRE(color_white() == get_pixel(test_bitmap, 75, 75));
        free_bitmap(test_bitmap);
    }
    TEST_CASE("draw_rectangle_on_window_record_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        clear_window(test_window, color_white());
        auto rectangle = rectangle_from(100.0, 100.0, 50.0, 50.0);
        draw_rectangle_on_window_record(test_window, color_black(), rectangle);
        refresh_screen();
        REQUIRE(color_black() == get_pixel_from_window(test_window, 100, 100));
        REQUIRE(color_white() == get_pixel_from_window(test_window, 125, 125));
        REQUIRE(color_white() == get_pixel_from_window(test_window, 200, 200));
        close_window(test_window);
    }
    TEST_CASE("draw_rectangle_on_window_record_with_options_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        clear_window(test_window, color_white());
        auto rectangle = rectangle_from(100.0, 100.0, 50.0, 50.0);
        draw_rectangle_on_window_record_with_options(test_window, color_black(), rectangle, option_defaults());
        refresh_screen();
        REQUIRE(color_black() == get_pixel_from_window(test_window, 100, 100));
        REQUIRE(color_white() == get_pixel_from_window(test_window, 125, 125));
        REQUIRE(color_white() == get_pixel_from_window(test_window, 175, 175));
        close_window(test_window);
    }
    TEST_CASE("draw_rectangle_on_window_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        clear_window(test_window, color_white());
        draw_rectangle_on_window(test_window, color_black(), 100.0, 100.0, 50.0, 50.0);
        refresh_screen();
        REQUIRE(color_black() == get_pixel_from_window(test_window, 100, 100));
        REQUIRE(color_white() == get_pixel_from_window(test_window, 200, 200));
        close_window(test_window);
    }
    TEST_CASE("draw_rectangle_on_window_with_options_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        clear_window(test_window, color_white());
        draw_rectangle_on_window_with_options(test_window, color_black(), 100.0, 100.0, 50.0, 50.0, option_defaults());
        refresh_screen();
        REQUIRE(color_black() == get_pixel_from_window(test_window, 100, 100));
        REQUIRE(color_white() == get_pixel_from_window(test_window, 200, 200));
        close_window(test_window);
    }
    TEST_CASE("fill_quad_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        clear_window(test_window, color_white());
        auto quad = quad_from(point_at(100.0, 100.0), point_at(300.0, 100.0), point_at(100.0, 300.0), point_at(300.0, 300.0));
        fill_quad(color_black(), quad);
        refresh_screen();
        REQUIRE(color_black() == get_pixel_from_window(test_window, 200, 200));
        REQUIRE(color_white() == get_pixel_from_window(test_window, 400, 400));
        close_window(test_window);
    }
    TEST_CASE("fill_quad_with_options_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        clear_window(test_window, color_white());
        auto quad = quad_from(point_at(100.0, 100.0), point_at(300.0, 100.0), point_at(100.0, 300.0), point_at(300.0, 300.0));
        fill_quad_with_options(color_black(), quad, option_defaults());
        refresh_screen();
        REQUIRE(color_black() == get_pixel_from_window(test_window, 200, 200));
        REQUIRE(color_white() == get_pixel_from_window(test_window, 400, 400));
        close_window(test_window);
    }
    TEST_CASE("fill_quad_on_bitmap_integration") {
        auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
        clear_bitmap(test_bitmap, color_white());
        auto quad = quad_from(point_at(10.0, 10.0), point_at(90.0, 10.0), point_at(10.0, 90.0), point_at(90.0, 90.0));
        fill_quad_on_bitmap(test_bitmap, color_black(), quad);
        REQUIRE(color_black() == get_pixel(test_bitmap, 50, 50));
        REQUIRE(color_white() == get_pixel(test_bitmap, 0, 0));
        free_bitmap(test_bitmap);
    }
    TEST_CASE("fill_quad_on_bitmap_with_options_integration") {
        auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
        clear_bitmap(test_bitmap, color_white());
        auto quad = quad_from(point_at(10.0, 10.0), point_at(90.0, 10.0), point_at(90.0, 90.0), point_at(10.0, 90.0));
        fill_quad_on_bitmap_with_options(test_bitmap, color_black(), quad, option_defaults());
        REQUIRE(color_black() == get_pixel(test_bitmap, 50, 50));
        REQUIRE(color_white() == get_pixel(test_bitmap, 95, 50));
        free_bitmap(test_bitmap);
    }
    TEST_CASE("fill_quad_on_window_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        clear_window(test_window, color_white());
        auto quad = quad_from(point_at(100.0, 100.0), point_at(200.0, 100.0), point_at(100.0, 200.0), point_at(200.0, 200.0));
        fill_quad_on_window(test_window, color_black(), quad);
        refresh_screen();
        REQUIRE(color_black() == get_pixel_from_window(test_window, 150, 150));
        REQUIRE(color_white() == get_pixel_from_window(test_window, 250, 250));
        close_window(test_window);
    }
    TEST_CASE("fill_quad_on_window_with_options_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        clear_window(test_window, color_white());
        auto quad = quad_from(point_at(100.0, 100.0), point_at(200.0, 100.0), point_at(200.0, 200.0), point_at(100.0, 200.0));
        fill_quad_on_window_with_options(test_window, color_black(), quad, option_defaults());
        refresh_screen();
        REQUIRE(color_black() == get_pixel_from_window(test_window, 150, 150));
        REQUIRE(color_white() == get_pixel_from_window(test_window, 250, 150));
        close_window(test_window);
    }
    TEST_CASE("fill_rectangle_record_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        clear_window(test_window, color_white());
        auto rectangle = rectangle_from(100.0, 100.0, 200.0, 150.0);
        fill_rectangle_record(color_black(), rectangle);
        refresh_screen();
        REQUIRE(color_black() == get_pixel_from_window(test_window, 150, 125));
        REQUIRE(color_white() == get_pixel_from_window(test_window, 350, 275));
        close_window(test_window);
    }
    TEST_CASE("fill_rectangle_record_with_options_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        clear_window(test_window, color_white());
        auto rectangle = rectangle_from(100.0, 100.0, 200.0, 150.0);
        fill_rectangle_record_with_options(color_black(), rectangle, option_defaults());
        refresh_screen();
        REQUIRE(color_black() == get_pixel_from_window(test_window, 150, 125));
        REQUIRE(color_white() == get_pixel_from_window(test_window, 350, 275));
        close_window(test_window);
    }
    TEST_CASE("fill_rectangle_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        clear_window(test_window, color_white());
        fill_rectangle(color_black(), 100.0, 100.0, 200.0, 150.0);
        refresh_screen();
        REQUIRE(color_black() == get_pixel_from_window(test_window, 150, 125));
        REQUIRE(color_white() == get_pixel_from_window(test_window, 301, 251));
        close_window(test_window);
    }
    TEST_CASE("fill_rectangle_with_options_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        clear_window(test_window, color_white());
        fill_rectangle_with_options(color_black(), 100.0, 100.0, 200.0, 150.0, option_defaults());
        refresh_screen();
        REQUIRE(color_black() == get_pixel_from_window(test_window, 150, 125));
        REQUIRE(color_white() == get_pixel_from_window(test_window, 301, 251));
        close_window(test_window);
    }
    TEST_CASE("fill_rectangle_on_bitmap_record_integration") {
        auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
        clear_bitmap(test_bitmap, color_white());
        auto rectangle = rectangle_from(25.0, 25.0, 50.0, 50.0);
        fill_rectangle_on_bitmap_record(test_bitmap, color_black(), rectangle);
        REQUIRE(color_black() == get_pixel(test_bitmap, 50, 50));
        REQUIRE(color_white() == get_pixel(test_bitmap, 10, 10));
        free_bitmap(test_bitmap);
    }
    TEST_CASE("fill_rectangle_on_bitmap_record_with_options_integration") {
        auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
        clear_bitmap(test_bitmap, color_white());
        auto rectangle = rectangle_from(25.0, 25.0, 50.0, 50.0);
        fill_rectangle_on_bitmap_record_with_options(test_bitmap, color_black(), rectangle, option_defaults());
        REQUIRE(color_black() == get_pixel(test_bitmap, 50, 50));
        REQUIRE(color_white() == get_pixel(test_bitmap, 10, 10));
        free_bitmap(test_bitmap);
    }
    TEST_CASE("fill_rectangle_on_bitmap_integration") {
        auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
        clear_bitmap(test_bitmap, color_white());
        fill_rectangle_on_bitmap(test_bitmap, color_black(), 25.0, 25.0, 50.0, 50.0);
        REQUIRE(color_black() == get_pixel(test_bitmap, 50, 50));
        REQUIRE(color_white() == get_pixel(test_bitmap, 75, 75));
        free_bitmap(test_bitmap);
    }
    TEST_CASE("fill_rectangle_on_bitmap_with_options_integration") {
        auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
        clear_bitmap(test_bitmap, color_white());
        fill_rectangle_on_bitmap_with_options(test_bitmap, color_black(), 25.0, 25.0, 50.0, 50.0, option_defaults());
        REQUIRE(color_black() == get_pixel(test_bitmap, 50, 50));
        REQUIRE(color_white() == get_pixel(test_bitmap, 10, 10));
        free_bitmap(test_bitmap);
    }
    TEST_CASE("fill_rectangle_on_window_record_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        clear_window(test_window, color_white());
        auto rectangle = rectangle_from(100.0, 100.0, 200.0, 150.0);
        fill_rectangle_on_window_record(test_window, color_black(), rectangle);
        refresh_screen();
        REQUIRE(color_black() == get_pixel_from_window(test_window, 150, 125));
        REQUIRE(color_white() == get_pixel_from_window(test_window, 350, 275));
        close_window(test_window);
    }
    TEST_CASE("fill_rectangle_on_window_record_with_options_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        clear_window(test_window, color_white());
        auto rectangle = rectangle_from(100.0, 100.0, 200.0, 150.0);
        fill_rectangle_on_window_record_with_options(test_window, color_black(), rectangle, option_defaults());
        refresh_screen();
        REQUIRE(color_black() == get_pixel_from_window(test_window, 150, 125));
        REQUIRE(color_white() == get_pixel_from_window(test_window, 350, 275));
        close_window(test_window);
    }
    TEST_CASE("fill_rectangle_on_window_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        clear_window(test_window, color_white());
        fill_rectangle_on_window(test_window, color_black(), 100.0, 100.0, 50.0, 50.0);
        refresh_screen();
        REQUIRE(color_black() == get_pixel_from_window(test_window, 125, 125));
        REQUIRE(color_white() == get_pixel_from_window(test_window, 175, 175));
        close_window(test_window);
    }
    TEST_CASE("fill_rectangle_on_window_with_options_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        clear_window(test_window, color_white());
        fill_rectangle_on_window_with_options(test_window, color_black(), 100.0, 100.0, 50.0, 50.0, option_defaults());
        refresh_screen();
        REQUIRE(color_black() == get_pixel_from_window(test_window, 125, 125));
        REQUIRE(color_white() == get_pixel_from_window(test_window, 175, 175));
        close_window(test_window);
    }
    TEST_CASE("draw_text_font_as_string_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        clear_window(test_window, color_white());
        refresh_screen();
        load_font("hara", "hara.ttf");
        draw_text_font_as_string("Test Text", color_black(), "hara", 24, 100.0, 100.0);
        refresh_screen();
        REQUIRE(color_black() == get_pixel_from_window(test_window, 120, 110));
        REQUIRE(color_white() == get_pixel_from_window(test_window, 90, 90));
        close_window(test_window);
        free_all_fonts();
    }
    TEST_CASE("draw_text_with_options_font_as_string_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        clear_window(test_window, color_white());
        load_font("hara", "hara.ttf");
        draw_text_with_options_font_as_string("Test Text", color_black(), "hara", 24, 100.0, 100.0, option_defaults());
        refresh_screen();
        REQUIRE(color_black() == get_pixel_from_window(test_window, 120, 110));
        REQUIRE(color_white() == get_pixel_from_window(test_window, 90, 90));
        close_window(test_window);
        free_all_fonts();
    }
    TEST_CASE("draw_text_no_font_no_size_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        clear_window(test_window, color_white());
        draw_text_no_font_no_size("Test Text", color_black(), 100.0, 100.0);
        refresh_screen();
        REQUIRE(color_black() == get_pixel_from_window(test_window, 105, 100));
        REQUIRE(color_white() == get_pixel_from_window(test_window, 90, 90));
        close_window(test_window);
    }
    TEST_CASE("draw_text_no_font_no_size_with_options_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        clear_window(test_window, color_white());
        draw_text_no_font_no_size_with_options("Test Text", color_black(), 100.0, 100.0, option_defaults());
        refresh_screen();
        REQUIRE(color_black() == get_pixel_from_window(test_window, 105, 100));
        REQUIRE(color_white() == get_pixel_from_window(test_window, 90, 90));
        close_window(test_window);
    }
    TEST_CASE("draw_text_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        clear_window(test_window, color_white());
        load_font("hara", "hara.ttf");
        draw_text("Test Text", color_black(), font_named("hara"), 24, 100.0, 100.0);
        refresh_screen();
        REQUIRE(color_black() == get_pixel_from_window(test_window, 120, 110));
        REQUIRE(color_white() == get_pixel_from_window(test_window, 90, 90));
        close_window(test_window);
        free_all_fonts();
    }
    TEST_CASE("draw_text_with_options_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        clear_window(test_window, color_white());
        load_font("hara", "hara.ttf");
        draw_text_with_options("Test Text", color_black(), font_named("hara"), 24, 100.0, 100.0, option_defaults());
        refresh_screen();
        REQUIRE(color_black() == get_pixel_from_window(test_window, 120, 110));
        REQUIRE(color_white() == get_pixel_from_window(test_window, 90, 90));
        close_window(test_window);
        free_all_fonts();
    }
    TEST_CASE("draw_text_on_bitmap_font_as_string_integration") {
        auto test_bitmap = create_bitmap("test_bitmap", 200, 200);
        clear_bitmap(test_bitmap, color_white());
        load_font("hara", "hara.ttf");
        draw_text_on_bitmap_font_as_string(test_bitmap, "Test Text", color_black(), "hara", 24, 100.0, 100.0);
        REQUIRE(color_black() == get_pixel(test_bitmap, 120, 110));
        REQUIRE(color_white() == get_pixel(test_bitmap, 90, 90));
        free_bitmap(test_bitmap);
        free_all_fonts();
    }
    TEST_CASE("draw_text_on_bitmap_with_options_font_as_string_integration") {
        auto test_bitmap = create_bitmap("test_bitmap", 200, 200);
        clear_bitmap(test_bitmap, color_white());
        load_font("hara", "hara.ttf");
        draw_text_on_bitmap_with_options_font_as_string(test_bitmap, "Test Text", color_black(), "hara", 24, 100.0, 100.0, option_defaults());
        REQUIRE(color_black() == get_pixel(test_bitmap, 120, 110));
        REQUIRE(color_white() == get_pixel(test_bitmap, 90, 90));
        free_bitmap(test_bitmap);
        free_all_fonts();
    }
    TEST_CASE("draw_text_on_bitmap_no_font_no_size_integration") {
        auto test_bitmap = create_bitmap("test_bitmap", 200, 200);
        clear_bitmap(test_bitmap, color_white());
        draw_text_on_bitmap_no_font_no_size(test_bitmap, "Test Text", color_black(), 100.0, 100.0);
        REQUIRE(color_black() == get_pixel(test_bitmap, 105, 100));
        REQUIRE(color_white() == get_pixel(test_bitmap, 90, 90));
        free_bitmap(test_bitmap);
    }
    TEST_CASE("draw_text_on_bitmap_no_font_no_size_with_options_integration") {
        auto test_bitmap = create_bitmap("test_bitmap", 200, 200);
        clear_bitmap(test_bitmap, color_white());
        draw_text_on_bitmap_no_font_no_size_with_options(test_bitmap, "Test Text", color_black(), 100.0, 100.0, option_defaults());
        REQUIRE(color_black() == get_pixel(test_bitmap, 105, 100));
        REQUIRE(color_white() == get_pixel(test_bitmap, 90, 90));
        free_bitmap(test_bitmap);
    }
    TEST_CASE("draw_text_on_bitmap_integration") {
        auto test_bitmap = create_bitmap("test_bitmap", 200, 200);
        clear_bitmap(test_bitmap, color_white());
        load_font("hara", "hara.ttf");
        draw_text_on_bitmap(test_bitmap, "Test Text", color_black(), font_named("hara"), 24, 100.0, 100.0);
        REQUIRE(color_black() == get_pixel(test_bitmap, 120, 110));
        REQUIRE(color_white() == get_pixel(test_bitmap, 90, 90));
        free_bitmap(test_bitmap);
        free_all_fonts();
    }
    TEST_CASE("draw_text_on_bitmap_with_options_integration") {
        auto test_bitmap = create_bitmap("test_bitmap", 200, 200);
        clear_bitmap(test_bitmap, color_white());
        load_font("hara", "hara.ttf");
        draw_text_on_bitmap_with_options(test_bitmap, "Test Text", color_black(), font_named("hara"), 24, 100.0, 100.0, option_defaults());
        REQUIRE(color_black() == get_pixel(test_bitmap, 120, 110));
        REQUIRE(color_white() == get_pixel(test_bitmap, 90, 90));
        free_bitmap(test_bitmap);
        free_all_fonts();
    }
    TEST_CASE("draw_text_on_window_font_as_string_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        clear_window(test_window, color_white());
        load_font("hara", "hara.ttf");
        draw_text_on_window_font_as_string(test_window, "Test Text", color_black(), "hara", 24, 100.0, 100.0);
        refresh_screen();
        REQUIRE(color_black() == get_pixel_from_window(test_window, 120, 110));
        REQUIRE(color_white() == get_pixel_from_window(test_window, 90, 90));
        close_window(test_window);
        free_all_fonts();
    }
    TEST_CASE("draw_text_on_window_with_options_font_as_string_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        clear_window(test_window, color_white());
        load_font("hara", "hara.ttf");
        draw_text_on_window_with_options_font_as_string(test_window, "Test Text", color_black(), "hara", 24, 100.0, 100.0, option_defaults());
        refresh_screen();
        REQUIRE(color_black() == get_pixel_from_window(test_window, 120, 110));
        REQUIRE(color_white() == get_pixel_from_window(test_window, 90, 90));
        close_window(test_window);
        free_all_fonts();
    }
    TEST_CASE("draw_text_on_window_no_font_no_size_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        clear_window(test_window, color_white());
        draw_text_on_window_no_font_no_size(test_window, "Test Text", color_black(), 100.0, 100.0);
        refresh_screen();
        REQUIRE(color_black() == get_pixel_from_window(test_window, 105, 100));
        REQUIRE(color_white() == get_pixel_from_window(test_window, 90, 90));
        close_window(test_window);
    }
    TEST_CASE("draw_text_on_window_no_font_no_size_with_options_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        clear_window(test_window, color_white());
        draw_text_on_window_no_font_no_size_with_options(test_window, "Test Text", color_black(), 100.0, 100.0, option_defaults());
        refresh_screen();
        REQUIRE(color_black() == get_pixel_from_window(test_window, 105, 100));
        REQUIRE(color_white() == get_pixel_from_window(test_window, 90, 90));
        close_window(test_window);
    }
    TEST_CASE("draw_text_on_window_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        clear_window(test_window, color_white());
        load_font("hara", "hara.ttf");
        auto test_font = font_named("hara");
        font_load_size(test_font, 24);
        draw_text_on_window(test_window, "Test Text", color_black(), test_font, 24, 100.0, 100.0);
        refresh_screen();
        REQUIRE(color_black() == get_pixel_from_window(test_window, 120, 110));
        REQUIRE(color_white() == get_pixel_from_window(test_window, 90, 90));
        close_window(test_window);
        free_all_fonts();
    }
    TEST_CASE("draw_text_on_window_with_options_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        clear_window(test_window, color_white());
        auto test_font = load_font("test_font", "hara.ttf");
        draw_text_on_window_with_options(test_window, "Test Text", color_black(), test_font, 24, 100.0, 100.0, option_defaults());
        refresh_screen();
        REQUIRE(color_black() == get_pixel_from_window(test_window, 120, 110));
        REQUIRE(color_white() == get_pixel_from_window(test_window, 90, 90));
        close_window(test_window);
        free_font(test_font);
    }
    TEST_CASE("font_has_size_name_as_string_integration") {
        load_font("hara", "hara.ttf");
        font_load_size("hara", 12);
        REQUIRE(font_has_size_name_as_string("hara", 12));
        REQUIRE_FALSE(font_has_size_name_as_string("nonexistent_font", 12));
        free_all_fonts();
    }
    TEST_CASE("font_has_size_integration") {
        auto test_font = load_font("test_font", "hara.ttf");
        font_load_size(test_font, 12);
        REQUIRE(font_has_size(test_font, 12));
        REQUIRE_FALSE(font_has_size(test_font, 999));
        free_font(test_font);
    }
    TEST_CASE("font_load_size_name_as_string_integration") {
        load_font("test_font", "hara.ttf");
        font_load_size_name_as_string("test_font", 12);
        REQUIRE(font_has_size("test_font", 12));
        free_all_fonts();
    }
    TEST_CASE("font_load_size_integration") {
        auto test_font = load_font("test_font", "hara.ttf");
        font_load_size(test_font, 12);
        REQUIRE(font_has_size(test_font, 12));
        free_font(test_font);
    }
    TEST_CASE("font_named_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        clear_window(test_window, color_white());
        load_font("hara", "hara.ttf");
        auto test_font = font_named("hara");
        draw_text("Test Text", color_black(), test_font, 24, 100.0, 100.0);
        refresh_screen();
        REQUIRE(test_font != nullptr);
        REQUIRE(color_black() == get_pixel_from_window(test_window, 120, 110));
        REQUIRE(color_white() == get_pixel_from_window(test_window, 90, 90));
        close_window(test_window);
        free_all_fonts();
    }
    TEST_CASE("free_all_fonts_integration") {
        auto test_font = load_font("test_font", "hara.ttf");
        REQUIRE(has_font("test_font"));
        free_all_fonts();
        REQUIRE_FALSE(has_font("test_font"));
    }
    TEST_CASE("free_font_integration") {
        auto test_font = load_font("test_font", "hara.ttf");
        REQUIRE(has_font(test_font));
        free_font(test_font);
        REQUIRE_FALSE(has_font(test_font));
    }
    TEST_CASE("get_font_style_name_as_string_integration") {
        auto test_font = load_font("test_font", "hara.ttf");
        auto style = get_font_style_name_as_string("test_font");
        REQUIRE(FontStyle::BOLD_FONT == style);
        free_font(test_font);
    }
    TEST_CASE("get_font_style_integration") {
        auto test_font = load_font("test_font", "hara.ttf");
        auto style = get_font_style(test_font);
        REQUIRE(FontStyle::BOLD_FONT == style);
        free_font(test_font);
    }
    TEST_CASE("get_system_font_integration") {
        auto system_font = get_system_font();
        REQUIRE(system_font != nullptr);
    }
    TEST_CASE("has_font_integration") {
        auto test_font = load_font("test_font", "hara.ttf");
        REQUIRE(has_font(test_font));
        free_font(test_font);
        REQUIRE_FALSE(has_font(test_font));
    }
    TEST_CASE("has_font_name_as_string_integration") {
        REQUIRE(has_font_name_as_string("hara"));
        REQUIRE_FALSE(has_font_name_as_string("nonexistent_font"));
    }
    TEST_CASE("load_font_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        clear_window(test_window, color_white());
        auto test_font = load_font("test_font", "hara.ttf");
        draw_text("Test Text", color_black(), test_font, 24, 100.0, 100.0, option_defaults());
        refresh_screen();
        REQUIRE(has_font("test_font"));
        REQUIRE(color_black() == get_pixel_from_window(test_window, 105, 105));
        close_window(test_window);
        free_font(test_font);
    }
    TEST_CASE("set_font_style_name_as_string_integration") {
        auto test_font = load_font("test_font", "hara.ttf");
        set_font_style_name_as_string("test_font", FontStyle::BOLD_FONT);
        REQUIRE(FontStyle::BOLD_FONT == get_font_style("test_font"));
        free_font(test_font);
    }
    TEST_CASE("set_font_style_integration") {
        auto test_font = load_font("test_font", "hara.ttf");
        set_font_style(test_font, FontStyle::BOLD_FONT);
        REQUIRE(FontStyle::BOLD_FONT == get_font_style(test_font));
        free_font(test_font);
    }
    TEST_CASE("text_height_font_named_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        auto height = text_height_font_named("Test Text", "hara", 24);
        REQUIRE(height > 0);
        REQUIRE(height >= 24);
        close_window(test_window);
    }
    TEST_CASE("text_height_integration") {
        auto test_font = load_font("test_font", "hara.ttf");
        font_load_size(test_font, 24);
        auto height = text_height("Test Text", test_font, 24);
        REQUIRE(height > 0);
        REQUIRE(height >= 24);
        free_font(test_font);
    }
    TEST_CASE("text_width_font_named_integration") {
        auto test_font = load_font("hara", "hara.ttf");
        font_load_size(test_font, 12);
        auto width = text_width_font_named("Test Text", "hara", 24);
        REQUIRE(width > 0);
        REQUIRE(width >= text_height("Test Text", "hara", 24));
        free_font(test_font);
    }
    TEST_CASE("text_width_integration") {
        auto test_font = load_font("test_font", "hara.ttf");
        font_load_size(test_font, 12);
        auto width = text_width("Test Text", test_font, 24);
        REQUIRE(width > 0);
        REQUIRE(width >= text_height("Text Height", test_font, 24));
        free_font(test_font);
    }
    TEST_CASE("draw_triangle_record_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        clear_window(test_window, color_white());
        auto triangle = triangle_from(point_at(100.0, 100.0), point_at(200.0, 200.0), point_at(150.0, 300.0));
        draw_triangle_record(color_black(), triangle);
        refresh_screen();
        REQUIRE(color_black() == get_pixel_from_window(test_window, 100, 100));
        REQUIRE(color_white() == get_pixel_from_window(test_window, 150, 200));
        close_window(test_window);
    }
    TEST_CASE("draw_triangle_record_with_options_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        clear_window(test_window, color_white());
        auto triangle = triangle_from(point_at(100.0, 100.0), point_at(200.0, 200.0), point_at(150.0, 300.0));
        draw_triangle_record_with_options(color_black(), triangle, option_defaults());
        refresh_screen();
        REQUIRE(color_black() == get_pixel_from_window(test_window, 100, 100));
        REQUIRE(color_white() == get_pixel_from_window(test_window, 150, 200));
        close_window(test_window);
    }
    TEST_CASE("draw_triangle_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        clear_window(test_window, color_white());
        draw_triangle(color_black(), 100.0, 100.0, 200.0, 300.0, 300.0, 100.0);
        refresh_screen();
        REQUIRE(color_black() == get_pixel_from_window(test_window, 100, 100));
        REQUIRE(color_white() == get_pixel_from_window(test_window, 200, 150));
        close_window(test_window);
    }
    TEST_CASE("draw_triangle_with_options_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        clear_window(test_window, color_white());
        draw_triangle_with_options(color_black(), 100.0, 100.0, 200.0, 200.0, 150.0, 300.0, option_defaults());
        refresh_screen();
        REQUIRE(color_black() == get_pixel_from_window(test_window, 100, 100));
        REQUIRE(color_white() == get_pixel_from_window(test_window, 150, 200));
        close_window(test_window);
    }
    TEST_CASE("draw_triangle_on_bitmap_record_integration") {
        auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
        clear_bitmap(test_bitmap, color_white());
        auto triangle = triangle_from(point_at(25.0, 25.0), point_at(75.0, 25.0), point_at(50.0, 75.0));
        draw_triangle_on_bitmap_record(test_bitmap, color_black(), triangle);
        REQUIRE(color_black() == get_pixel(test_bitmap, 25, 25));
        REQUIRE(color_white() == get_pixel(test_bitmap, 50, 50));
        free_bitmap(test_bitmap);
    }
    TEST_CASE("draw_triangle_on_bitmap_record_with_options_integration") {
        auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
        clear_bitmap(test_bitmap, color_white());
        auto triangle = triangle_from(point_at(25.0, 25.0), point_at(75.0, 25.0), point_at(50.0, 75.0));
        draw_triangle_on_bitmap_record_with_options(test_bitmap, color_black(), triangle, option_defaults());
        REQUIRE(color_black() == get_pixel(test_bitmap, 25, 25));
        REQUIRE(color_white() == get_pixel(test_bitmap, 50, 50));
        free_bitmap(test_bitmap);
    }
    TEST_CASE("draw_triangle_on_bitmap_integration") {
        auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
        clear_bitmap(test_bitmap, color_white());
        draw_triangle_on_bitmap(test_bitmap, color_black(), 25.0, 25.0, 75.0, 25.0, 50.0, 75.0);
        REQUIRE(color_black() == get_pixel(test_bitmap, 25, 25));
        REQUIRE(color_white() == get_pixel(test_bitmap, 50, 50));
        free_bitmap(test_bitmap);
    }
    TEST_CASE("draw_triangle_on_bitmap_with_options_integration") {
        auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
        clear_bitmap(test_bitmap, color_white());
        draw_triangle_on_bitmap_with_options(test_bitmap, color_black(), 25.0, 25.0, 75.0, 25.0, 50.0, 75.0, option_defaults());
        REQUIRE(color_black() == get_pixel(test_bitmap, 25, 25));
        REQUIRE(color_white() == get_pixel(test_bitmap, 50, 50));
        free_bitmap(test_bitmap);
    }
    TEST_CASE("draw_triangle_on_window_record_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        clear_window(test_window, color_white());
        auto triangle = triangle_from(point_at(100.0, 100.0), point_at(200.0, 200.0), point_at(150.0, 300.0));
        draw_triangle_on_window_record(test_window, color_black(), triangle);
        refresh_screen();
        REQUIRE(color_black() == get_pixel_from_window(test_window, 100, 100));
        REQUIRE(color_white() == get_pixel_from_window(test_window, 50, 50));
        close_window(test_window);
    }
    TEST_CASE("draw_triangle_on_window_record_with_options_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        clear_window(test_window, color_white());
        auto triangle = triangle_from(point_at(100.0, 100.0), point_at(200.0, 200.0), point_at(150.0, 250.0));
        draw_triangle_on_window_record_with_options(test_window, color_black(), triangle, option_defaults());
        refresh_screen();
        REQUIRE(color_black() == get_pixel_from_window(test_window, 150, 150));
        REQUIRE(color_white() == get_pixel_from_window(test_window, 50, 50));
        close_window(test_window);
    }
    TEST_CASE("draw_triangle_on_window_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        clear_window(test_window, color_white());
        draw_triangle_on_window(test_window, color_black(), 100.0, 100.0, 200.0, 300.0, 300.0, 100.0);
        refresh_screen();
        REQUIRE(color_black() == get_pixel_from_window(test_window, 100, 100));
        REQUIRE(color_white() == get_pixel_from_window(test_window, 50, 50));
        close_window(test_window);
    }
    TEST_CASE("draw_triangle_on_window_with_options_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        clear_window(test_window, color_white());
        draw_triangle_on_window_with_options(test_window, color_black(), 100.0, 100.0, 200.0, 200.0, 150.0, 300.0, option_defaults());
        refresh_screen();
        REQUIRE(color_black() == get_pixel_from_window(test_window, 100, 100));
        REQUIRE(color_white() == get_pixel_from_window(test_window, 50, 50));
        close_window(test_window);
    }
    TEST_CASE("fill_triangle_record_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        clear_window(test_window, color_white());
        auto triangle = triangle_from(point_at(100.0, 100.0), point_at(200.0, 300.0), point_at(300.0, 100.0));
        fill_triangle_record(color_black(), triangle);
        refresh_screen();
        REQUIRE(color_black() == get_pixel_from_window(test_window, 200, 150));
        REQUIRE(color_white() == get_pixel_from_window(test_window, 50, 50));
        close_window(test_window);
    }
    TEST_CASE("fill_triangle_record_with_options_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        clear_window(test_window, color_white());
        auto triangle = triangle_from(point_at(100.0, 100.0), point_at(200.0, 300.0), point_at(300.0, 100.0));
        fill_triangle_record_with_options(color_black(), triangle, option_defaults());
        refresh_screen();
        REQUIRE(color_black() == get_pixel_from_window(test_window, 200, 150));
        REQUIRE(color_white() == get_pixel_from_window(test_window, 50, 50));
        close_window(test_window);
    }
    TEST_CASE("fill_triangle_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        clear_window(test_window, color_white());
        fill_triangle(color_black(), 100.0, 100.0, 200.0, 300.0, 300.0, 100.0);
        refresh_screen();
        REQUIRE(color_black() == get_pixel_from_window(test_window, 200, 150));
        REQUIRE(color_white() == get_pixel_from_window(test_window, 50, 50));
        close_window(test_window);
    }
    TEST_CASE("fill_triangle_with_options_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        clear_window(test_window, color_white());
        fill_triangle_with_options(color_red(), 100.0, 100.0, 200.0, 300.0, 300.0, 100.0, option_defaults());
        refresh_screen();
        REQUIRE(color_red() == get_pixel_from_window(test_window, 150, 150));
        REQUIRE(color_white() == get_pixel_from_window(test_window, 350, 150));
        close_window(test_window);
    }
    TEST_CASE("fill_triangle_on_bitmap_record_integration") {
        auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
        clear_bitmap(test_bitmap, color_white());
        auto triangle = triangle_from(point_at(25.0, 25.0), point_at(75.0, 25.0), point_at(50.0, 75.0));
        fill_triangle_on_bitmap_record(test_bitmap, color_black(), triangle);
        REQUIRE(color_black() == get_pixel(test_bitmap, 50, 50));
        REQUIRE(color_white() == get_pixel(test_bitmap, 0, 0));
        free_bitmap(test_bitmap);
    }
    TEST_CASE("fill_triangle_on_bitmap_record_with_options_integration") {
        auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
        clear_bitmap(test_bitmap, color_white());
        auto triangle = triangle_from(point_at(25.0, 25.0), point_at(75.0, 25.0), point_at(50.0, 75.0));
        fill_triangle_on_bitmap_record_with_options(test_bitmap, color_black(), triangle, option_defaults());
        REQUIRE(color_black() == get_pixel(test_bitmap, 50, 50));
        REQUIRE(color_white() == get_pixel(test_bitmap, 10, 10));
        free_bitmap(test_bitmap);
    }
    TEST_CASE("fill_triangle_on_bitmap_integration") {
        auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
        clear_bitmap(test_bitmap, color_white());
        fill_triangle_on_bitmap(test_bitmap, color_black(), 25.0, 25.0, 75.0, 25.0, 50.0, 75.0);
        REQUIRE(color_black() == get_pixel(test_bitmap, 50, 50));
        REQUIRE(color_white() == get_pixel(test_bitmap, 0, 0));
        free_bitmap(test_bitmap);
    }
    TEST_CASE("fill_triangle_on_bitmap_with_options_integration") {
        auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
        clear_bitmap(test_bitmap, color_white());
        fill_triangle_on_bitmap_with_options(test_bitmap, color_black(), 25.0, 25.0, 75.0, 25.0, 50.0, 75.0, option_defaults());
        REQUIRE(color_black() == get_pixel(test_bitmap, 50, 50));
        REQUIRE(color_white() == get_pixel(test_bitmap, 0, 0));
        free_bitmap(test_bitmap);
    }
    TEST_CASE("fill_triangle_on_window_record_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        clear_window(test_window, color_white());
        auto triangle = triangle_from(point_at(100.0, 100.0), point_at(200.0, 300.0), point_at(300.0, 100.0));
        fill_triangle_on_window_record(test_window, color_black(), triangle);
        refresh_screen();
        REQUIRE(color_black() == get_pixel_from_window(test_window, 200, 200));
        REQUIRE(color_white() == get_pixel_from_window(test_window, 50, 50));
        close_window(test_window);
    }
    TEST_CASE("fill_triangle_on_window_record_with_options_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        clear_window(test_window, color_white());
        auto triangle = triangle_from(point_at(100.0, 100.0), point_at(200.0, 300.0), point_at(300.0, 100.0));
        fill_triangle_on_window_record_with_options(test_window, color_black(), triangle, option_defaults());
        refresh_screen();
        REQUIRE(color_black() == get_pixel_from_window(test_window, 200, 200));
        REQUIRE(color_white() == get_pixel_from_window(test_window, 50, 50));
        close_window(test_window);
    }
    TEST_CASE("fill_triangle_on_window_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        clear_window(test_window, color_white());
        fill_triangle_on_window(test_window, color_black(), 100.0, 100.0, 200.0, 300.0, 300.0, 100.0);
        refresh_screen();
        REQUIRE(color_black() == get_pixel_from_window(test_window, 200, 200));
        REQUIRE(color_white() == get_pixel_from_window(test_window, 50, 50));
        close_window(test_window);
    }
    TEST_CASE("fill_triangle_on_window_with_options_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        clear_window(test_window, color_white());
        fill_triangle_on_window_with_options(test_window, color_black(), 100.0, 100.0, 200.0, 300.0, 300.0, 100.0, option_defaults());
        refresh_screen();
        REQUIRE(color_black() == get_pixel_from_window(test_window, 150, 150));
        REQUIRE(color_white() == get_pixel_from_window(test_window, 350, 150));
        close_window(test_window);
    }
};
