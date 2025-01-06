#include <catch2/catch_all.hpp>
#include <limits>
#include "splashkit.h"
#include "../helpers.hpp"
struct TestGraphicsFixture
{
    TestGraphicsFixture()
    {
        set_resources_path("/mnt/c/Users/Noahc/Documents/aYear_2_semester_2/TeamProject/GitHubRepo/splashkit_test_generator/resources");
    }
};
TEST_CASE_METHOD(TestGraphicsFixture, "draw_circle_record_integration") {
    auto test_window = open_window("Test Window 1", 800, 600);
    window_cleanup cleanup_window;
    clear_window(test_window, color_white());
    auto test_circle = circle_at(400.0, 300.0, 50.0);
    draw_circle(color_black(), test_circle);
    REQUIRE(color_black() == get_pixel(test_window, 450.0, 300.0));
    REQUIRE(color_white() == get_pixel(test_window, 400.0, 300.0));
    REQUIRE(color_white() == get_pixel(test_window, 460.0, 300.0));
}
TEST_CASE_METHOD(TestGraphicsFixture, "draw_circle_record_with_options_integration") {
    auto test_window = open_window("Test Window 2", 800, 600);
    window_cleanup cleanup_window;
    clear_window(test_window, color_white());
    auto test_circle = circle_at(400.0, 300.0, 50.0);
    draw_circle(color_black(), test_circle, option_defaults());
    REQUIRE(color_black() == get_pixel(test_window, 450.0, 300.0));
    REQUIRE(color_white() == get_pixel(test_window, 400.0, 300.0));
    REQUIRE(color_white() == get_pixel(test_window, 460.0, 300.0));
}
TEST_CASE_METHOD(TestGraphicsFixture, "draw_circle_integration") {
    auto test_window = open_window("Test Window 3", 800, 600);
    window_cleanup cleanup_window;
    clear_window(test_window, color_white());
    draw_circle(color_black(), 400.0, 300.0, 50.0);
    refresh_screen();
    REQUIRE(color_black() == get_pixel(test_window, 450.0, 300.0));
    REQUIRE(color_white() == get_pixel(test_window, 425.0, 300.0));
    REQUIRE(color_white() == get_pixel(test_window, 460.0, 300.0));
}
TEST_CASE_METHOD(TestGraphicsFixture, "draw_circle_with_options_integration") {
    auto test_window = open_window("Test Window 4", 800, 600);
    window_cleanup cleanup_window;
    clear_window(test_window, color_white());
    draw_circle(color_black(), 400.0, 300.0, 50.0, option_defaults());
    REQUIRE(color_black() == get_pixel(test_window, 450.0, 300.0));
    REQUIRE(color_white() == get_pixel(test_window, 400.0, 300.0));
    REQUIRE(color_white() == get_pixel(test_window, 460.0, 300.0));
}
TEST_CASE_METHOD(TestGraphicsFixture, "draw_circle_on_bitmap_integration") {
    auto test_bitmap = create_bitmap("Test Bitmap 1", 200, 200);
    bitmap_cleanup cleanup_bitmap;
    clear_bitmap(test_bitmap, color_white());
    draw_circle_on_bitmap(test_bitmap, color_black(), 100.0, 100.0, 50.0);
    REQUIRE(color_black() == get_pixel(test_bitmap, 150.0, 100.0));
    REQUIRE(color_white() == get_pixel(test_bitmap, 100.0, 100.0));
    REQUIRE(color_white() == get_pixel(test_bitmap, 160.0, 100.0));
}
TEST_CASE_METHOD(TestGraphicsFixture, "draw_circle_on_bitmap_with_options_integration") {
    auto test_bitmap = create_bitmap("Test Bitmap 2", 200, 200);
    bitmap_cleanup cleanup_bitmap;
    clear_bitmap(test_bitmap, color_white());
    draw_circle_on_bitmap(test_bitmap, color_black(), 100.0, 100.0, 50.0, option_defaults());
    REQUIRE(color_black() == get_pixel(test_bitmap, 150.0, 100.0));
    REQUIRE(color_white() == get_pixel(test_bitmap, 100.0, 100.0));
    REQUIRE(color_white() == get_pixel(test_bitmap, 160.0, 100.0));
}
TEST_CASE_METHOD(TestGraphicsFixture, "draw_circle_on_window_integration") {
    auto test_window = open_window("Test Window 5", 800, 600);
    window_cleanup cleanup_window;
    clear_window(test_window, color_white());
    draw_circle_on_window(test_window, color_black(), 400.0, 300.0, 50.0);
    REQUIRE(color_black() == get_pixel(test_window, 450.0, 300.0));
    REQUIRE(color_white() == get_pixel(test_window, 400.0, 300.0));
    REQUIRE(color_white() == get_pixel(test_window, 460.0, 300.0));
}
TEST_CASE_METHOD(TestGraphicsFixture, "draw_circle_on_window_with_options_integration") {
    auto test_window = open_window("Test Window 6", 800, 600);
    window_cleanup cleanup_window;
    clear_window(test_window, color_white());
    draw_circle_on_window(test_window, color_black(), 400.0, 300.0, 50.0, option_defaults());
    REQUIRE(color_black() == get_pixel(test_window, 450.0, 300.0));
    REQUIRE(color_black() == get_pixel(test_window, 350.0, 300.0));
    REQUIRE(color_white() == get_pixel(test_window, 400.0, 400.0));
}
TEST_CASE_METHOD(TestGraphicsFixture, "fill_circle_record_integration") {
    auto test_window = open_window("Test Window 7", 800, 600);
    window_cleanup cleanup_window;
    clear_window(test_window, color_white());
    auto test_circle = circle_at(400.0, 300.0, 50.0);
    fill_circle(color_black(), test_circle);
    REQUIRE(color_black() == get_pixel(test_window, 400.0, 300.0));
    REQUIRE(color_black() == get_pixel(test_window, 425.0, 300.0));
    REQUIRE(color_white() == get_pixel(test_window, 460.0, 300.0));
}
TEST_CASE_METHOD(TestGraphicsFixture, "fill_circle_record_with_options_integration") {
    auto test_window = open_window("Test Window 8", 800, 600);
    window_cleanup cleanup_window;
    clear_window(test_window, color_white());
    auto test_circle = circle_at(400.0, 300.0, 50.0);
    fill_circle(color_black(), test_circle, option_defaults());
    REQUIRE(color_black() == get_pixel(test_window, 400.0, 300.0));
    REQUIRE(color_black() == get_pixel(test_window, 425.0, 300.0));
    REQUIRE(color_white() == get_pixel(test_window, 460.0, 300.0));
}
TEST_CASE_METHOD(TestGraphicsFixture, "fill_circle_integration") {
    auto test_window = open_window("Test Window 9", 800, 600);
    window_cleanup cleanup_window;
    clear_window(test_window, color_white());
    fill_circle(color_black(), 400.0, 300.0, 50.0);
    REQUIRE(color_black() == get_pixel(test_window, 400.0, 300.0));
    REQUIRE(color_black() == get_pixel(test_window, 425.0, 300.0));
    REQUIRE(color_white() == get_pixel(test_window, 460.0, 300.0));
}
TEST_CASE_METHOD(TestGraphicsFixture, "fill_circle_with_options_integration") {
    auto test_window = open_window("Test Window 10", 800, 600);
    window_cleanup cleanup_window;
    clear_window(test_window, color_white());
    fill_circle(color_black(), 400.0, 300.0, 50.0, option_defaults());
    REQUIRE(color_black() == get_pixel(test_window, 400.0, 300.0));
    REQUIRE(color_black() == get_pixel(test_window, 425.0, 300.0));
    REQUIRE(color_white() == get_pixel(test_window, 460.0, 300.0));
}
TEST_CASE_METHOD(TestGraphicsFixture, "fill_circle_on_bitmap_integration") {
    auto test_bitmap = create_bitmap("Test Bitmap 3", 200, 200);
    bitmap_cleanup cleanup_bitmap;
    clear_bitmap(test_bitmap, color_white());
    fill_circle_on_bitmap(test_bitmap, color_red(), 100.0, 100.0, 50.0);
    REQUIRE(color_red() == get_pixel(test_bitmap, 100.0, 100.0));
    REQUIRE(color_red() == get_pixel(test_bitmap, 125.0, 100.0));
    REQUIRE(color_white() == get_pixel(test_bitmap, 160.0, 100.0));
}
TEST_CASE_METHOD(TestGraphicsFixture, "fill_circle_on_bitmap_with_options_integration") {
    auto test_bitmap = create_bitmap("Test Bitmap 4", 200, 200);
    bitmap_cleanup cleanup_bitmap;
    clear_bitmap(test_bitmap, color_white());
    fill_circle_on_bitmap(test_bitmap, color_black(), 100.0, 100.0, 50.0, option_defaults());
    REQUIRE(color_black() == get_pixel(test_bitmap, 100.0, 100.0));
    REQUIRE(color_black() == get_pixel(test_bitmap, 125.0, 100.0));
    REQUIRE(color_white() == get_pixel(test_bitmap, 160.0, 100.0));
}
TEST_CASE_METHOD(TestGraphicsFixture, "fill_circle_on_window_integration") {
    auto test_window = open_window("Test Window 11", 800, 600);
    window_cleanup cleanup_window;
    clear_window(test_window, color_white());
    fill_circle_on_window(test_window, color_black(), 400.0, 300.0, 50.0);
    REQUIRE(color_black() == get_pixel(test_window, 400.0, 300.0));
    REQUIRE(color_black() == get_pixel(test_window, 425.0, 300.0));
    REQUIRE(color_white() == get_pixel(test_window, 460.0, 300.0));
}
TEST_CASE_METHOD(TestGraphicsFixture, "fill_circle_on_window_with_options_integration") {
    auto test_window = open_window("Test Window 12", 800, 600);
    window_cleanup cleanup_window;
    clear_window(test_window, color_white());
    fill_circle_on_window(test_window, color_black(), 400.0, 300.0, 50.0, option_defaults());
    REQUIRE(color_black() == get_pixel(test_window, 400.0, 300.0));
    REQUIRE(color_black() == get_pixel(test_window, 425.0, 300.0));
    REQUIRE(color_white() == get_pixel(test_window, 460.0, 300.0));
}
TEST_CASE_METHOD(TestGraphicsFixture, "current_clip_integration") {
    open_window("Test Window 13", 800, 600);
    window_cleanup cleanup_window;
    auto test_clip = current_clip();
    REQUIRE(0.0f == rectangle_left(test_clip));
    REQUIRE(0.0f == rectangle_top(test_clip));
    REQUIRE(800.0 == test_clip.width);
    REQUIRE(600.0 == test_clip.height);
}
TEST_CASE_METHOD(TestGraphicsFixture, "current_clip_for_bitmap_integration") {
    auto test_bitmap = create_bitmap("Test Bitmap 5", 100, 100);
    bitmap_cleanup cleanup_bitmap;
    auto test_rectangle = rectangle_from(10.0, 10.0, 50.0, 50.0);
    push_clip(test_bitmap, test_rectangle);
    auto test_clip = current_clip(test_bitmap);
    REQUIRE(10.0f == rectangle_left(test_clip));
    REQUIRE(10.0f == rectangle_top(test_clip));
    REQUIRE(50.0 == test_clip.width);
    REQUIRE(50.0 == test_clip.height);
}
TEST_CASE_METHOD(TestGraphicsFixture, "current_clip_for_window_integration") {
    auto test_window = open_window("Test Window 14", 800, 600);
    window_cleanup cleanup_window;
    auto test_clip = current_clip(test_window);
    REQUIRE(0.0f == rectangle_left(test_clip));
    REQUIRE(0.0f == rectangle_top(test_clip));
    REQUIRE(800.0 == test_clip.width);
    REQUIRE(600.0 == test_clip.height);
}
TEST_CASE_METHOD(TestGraphicsFixture, "pop_clip_for_window_integration") {
    auto test_window = open_window("Test Window 15", 800, 600);
    window_cleanup cleanup_window;
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
TEST_CASE_METHOD(TestGraphicsFixture, "pop_clip_integration") {
    auto test_window = open_window("Test Window 16", 800, 600);
    window_cleanup cleanup_window;
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
TEST_CASE_METHOD(TestGraphicsFixture, "pop_clip_for_bitmap_integration") {
    auto test_bitmap = create_bitmap("Test Bitmap 6", 100, 100);
    bitmap_cleanup cleanup_bitmap;
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
TEST_CASE_METHOD(TestGraphicsFixture, "push_clip_for_window_integration") {
    auto test_window = open_window("Test Window 17", 800, 600);
    window_cleanup cleanup_window;
    auto test_rectangle = rectangle_from(100.0, 100.0, 200.0, 200.0);
    push_clip(test_window, test_rectangle);
    auto test_current_clip = current_clip(test_window);
    REQUIRE(100.0f == rectangle_left(test_current_clip));
    REQUIRE(100.0f == rectangle_top(test_current_clip));
    REQUIRE(200.0 == test_current_clip.width);
    REQUIRE(200.0 == test_current_clip.height);
    refresh_screen();
}
TEST_CASE_METHOD(TestGraphicsFixture, "push_clip_for_bitmap_integration") {
    auto test_bitmap = create_bitmap("Test Bitmap 7", 200, 200);
    bitmap_cleanup cleanup_bitmap;
    auto test_rectangle = rectangle_from(50.0, 50.0, 100.0, 100.0);
    push_clip(test_bitmap, test_rectangle);
    auto test_current_clip = current_clip(test_bitmap);
    REQUIRE(50.0f == rectangle_left(test_current_clip));
    REQUIRE(50.0f == rectangle_top(test_current_clip));
    REQUIRE(100.0 == test_current_clip.width);
    REQUIRE(100.0 == test_current_clip.height);
}
TEST_CASE_METHOD(TestGraphicsFixture, "push_clip_integration") {
    open_window("Test Window 18", 800, 600);
    window_cleanup cleanup_window;
    auto test_rectangle = rectangle_from(100.0, 100.0, 200.0, 200.0);
    push_clip(test_rectangle);
    auto test_current_clip = current_clip();
    REQUIRE(100.0f == rectangle_left(test_current_clip));
    REQUIRE(100.0f == rectangle_top(test_current_clip));
    REQUIRE(200.0 == test_current_clip.width);
    REQUIRE(200.0 == test_current_clip.height);
}
TEST_CASE_METHOD(TestGraphicsFixture, "reset_clip_for_bitmap_integration") {
    auto test_bitmap = create_bitmap("Test Bitmap 8", 100, 100);
    bitmap_cleanup cleanup_bitmap;
    push_clip(test_bitmap, rectangle_from(10.0, 10.0, 50.0, 50.0));
    reset_clip(test_bitmap);
    auto test_clip = current_clip(test_bitmap);
    REQUIRE(0.0f == rectangle_left(test_clip));
    REQUIRE(0.0f == rectangle_top(test_clip));
    REQUIRE(100.0 == test_clip.width);
    REQUIRE(100.0 == test_clip.height);
}
TEST_CASE_METHOD(TestGraphicsFixture, "reset_clip_integration") {
    open_window("Test Window 19", 800, 600);
    window_cleanup cleanup_window;
    push_clip(rectangle_from(100.0, 100.0, 200.0, 200.0));
    reset_clip();
    auto test_clip = current_clip();
    REQUIRE(0.0f == rectangle_left(test_clip));
    REQUIRE(0.0f == rectangle_top(test_clip));
    REQUIRE(800.0 == test_clip.width);
    REQUIRE(600.0 == test_clip.height);
}
TEST_CASE_METHOD(TestGraphicsFixture, "reset_clip_for_window_integration") {
    auto test_window = open_window("Test Window 20", 800, 600);
    window_cleanup cleanup_window;
    push_clip(test_window, rectangle_from(100.0, 100.0, 200.0, 200.0));
    reset_clip(test_window);
    auto test_clip = current_clip(test_window);
    REQUIRE(0.0f == rectangle_left(test_clip));
    REQUIRE(0.0f == rectangle_top(test_clip));
    REQUIRE(800.0 == test_clip.width);
    REQUIRE(600.0 == test_clip.height);
}
TEST_CASE_METHOD(TestGraphicsFixture, "set_clip_integration") {
    open_window("Test Window 21", 800, 600);
    window_cleanup cleanup_window;
    auto test_rectangle = rectangle_from(100.0, 100.0, 200.0, 200.0);
    set_clip(test_rectangle);
    auto test_current_clip = current_clip();
    REQUIRE(100.0f == rectangle_left(test_current_clip));
    REQUIRE(100.0f == rectangle_top(test_current_clip));
    REQUIRE(200.0 == test_current_clip.width);
    REQUIRE(200.0 == test_current_clip.height);
}
TEST_CASE_METHOD(TestGraphicsFixture, "set_clip_for_bitmap_integration") {
    auto test_bitmap = create_bitmap("Test Bitmap 9", 200, 200);
    bitmap_cleanup cleanup_bitmap;
    auto test_rectangle = rectangle_from(50.0, 50.0, 100.0, 100.0);
    set_clip(test_bitmap, test_rectangle);
    auto test_current_clip = current_clip(test_bitmap);
    REQUIRE(50.0f == rectangle_left(test_current_clip));
    REQUIRE(50.0f == rectangle_top(test_current_clip));
    REQUIRE(100.0 == test_current_clip.width);
    REQUIRE(100.0 == test_current_clip.height);
}
TEST_CASE_METHOD(TestGraphicsFixture, "set_clip_for_window_integration") {
    auto test_window = open_window("Test Window 22", 800, 600);
    window_cleanup cleanup_window;
    auto test_rectangle = rectangle_from(100.0, 100.0, 200.0, 200.0);
    set_clip(test_window, test_rectangle);
    auto test_current_clip = current_clip(test_window);
    REQUIRE(100.0f == rectangle_left(test_current_clip));
    REQUIRE(100.0f == rectangle_top(test_current_clip));
    REQUIRE(200.0 == test_current_clip.width);
    REQUIRE(200.0 == test_current_clip.height);
}
TEST_CASE_METHOD(TestGraphicsFixture, "option_defaults_integration") {
    auto test_options = option_defaults();
    REQUIRE(test_options != nullptr);
}
TEST_CASE_METHOD(TestGraphicsFixture, "option_draw_to_bitmap_integration") {
    auto test_bitmap = create_bitmap("Test Bitmap 10", 100, 100);
    bitmap_cleanup cleanup_bitmap;
    clear_bitmap(test_bitmap, color_white());
    auto test_options = option_draw_to(test_bitmap);
    draw_circle(color_black(), circle_at(50.0, 50.0, 25.0), test_options);
    REQUIRE(color_black() == get_pixel(test_bitmap, 75.0, 50.0));
    REQUIRE(color_white() == get_pixel(test_bitmap, 90.0, 90.0));
}
TEST_CASE_METHOD(TestGraphicsFixture, "option_draw_to_bitmap_with_options_integration") {
    auto test_bitmap = create_bitmap("Test Bitmap 11", 100, 100);
    bitmap_cleanup cleanup_bitmap;
    clear_bitmap(test_bitmap, color_white());
    auto test_options = option_defaults();
    auto test_drawing_options = option_draw_to(test_bitmap, test_options);
    draw_circle(color_black(), circle_at(50.0, 50.0, 25.0), test_drawing_options);
    REQUIRE(color_black() == get_pixel(test_bitmap, 75.0, 50.0));
    REQUIRE(color_white() == get_pixel(test_bitmap, 90.0, 90.0));
}
TEST_CASE_METHOD(TestGraphicsFixture, "option_draw_to_window_integration") {
    auto test_window = open_window("Test Window 23", 800, 600);
    window_cleanup cleanup_window;
    clear_window(test_window, color_white());
    draw_circle(color_black(), circle_at(400.0, 300.0, 50.0), option_draw_to(test_window));
    refresh_screen();
    REQUIRE(color_black() == get_pixel(test_window, 450.0, 300.0));
    REQUIRE(color_white() == get_pixel(test_window, 460.0, 300.0));
}
TEST_CASE_METHOD(TestGraphicsFixture, "option_draw_to_window_with_options_integration") {
    auto test_window = open_window("Test Window 24", 800, 600);
    window_cleanup cleanup_window;
    clear_window(test_window, color_white());
    auto test_options = option_defaults();
    draw_circle(color_black(), circle_at(400.0, 300.0, 50.0), option_draw_to(test_window, test_options));
    refresh_screen();
    REQUIRE(color_black() == get_pixel(test_window, 450.0, 300.0));
    REQUIRE(color_white() == get_pixel(test_window, 460.0, 300.0));
}
TEST_CASE_METHOD(TestGraphicsFixture, "option_flip_x_integration") {
    auto test_window = open_window("Test Window 25", 800, 600);
    window_cleanup cleanup_window;
    clear_window(test_window, color_white());
    auto test_bitmap = create_bitmap("Test Bitmap 12", 100, 100);
    bitmap_cleanup cleanup_bitmap;
    clear_bitmap(test_bitmap, color_white());
    fill_rectangle_on_bitmap(test_bitmap, color_black(), 0.0, 0.0, 50.0, 100.0);
    draw_bitmap(test_bitmap, 100.0, 100.0, option_flip_x());
    refresh_screen();
    REQUIRE(color_black() == get_pixel(test_window, 125.0, 100.0));
    REQUIRE(color_white() == get_pixel(test_window, 75.0, 100.0));
    free_bitmap(test_bitmap);
}
TEST_CASE_METHOD(TestGraphicsFixture, "option_flip_x_with_options_integration") {
    auto test_window = open_window("Test Window 26", 800, 600);
    window_cleanup cleanup_window;
    clear_window(test_window, color_white());
    auto test_bitmap = create_bitmap("Test Bitmap 13", 100, 100);
    bitmap_cleanup cleanup_bitmap;
    clear_bitmap(test_bitmap, color_white());
    fill_rectangle_on_bitmap(test_bitmap, color_black(), 0.0, 0.0, 50.0, 100.0);
    draw_bitmap(test_bitmap, 400.0, 300.0, option_flip_x(option_defaults()));
    refresh_screen();
    REQUIRE(color_black() == get_pixel(test_window, 425.0, 300.0));
    REQUIRE(color_white() == get_pixel(test_window, 375.0, 300.0));
    free_bitmap(test_bitmap);
}
TEST_CASE_METHOD(TestGraphicsFixture, "option_flip_xy_integration") {
    auto test_window = open_window("Test Window 27", 800, 600);
    window_cleanup cleanup_window;
    clear_window(test_window, color_white());
    auto test_bitmap = create_bitmap("Test Bitmap 14", 100, 100);
    bitmap_cleanup cleanup_bitmap;
    clear_bitmap(test_bitmap, color_white());
    fill_rectangle_on_bitmap(test_bitmap, color_black(), 0.0, 0.0, 50.0, 50.0);
    draw_bitmap(test_bitmap, 400.0, 300.0, option_flip_xy());
    refresh_screen();
    REQUIRE(color_black() == get_pixel(test_window, 450.0, 350.0));
    REQUIRE(color_white() == get_pixel(test_window, 450.0, 250.0));
    free_bitmap(test_bitmap);
}
TEST_CASE_METHOD(TestGraphicsFixture, "option_flip_xy_with_options_integration") {
    auto test_window = open_window("Test Window 28", 800, 600);
    window_cleanup cleanup_window;
    clear_window(test_window, color_white());
    auto test_bitmap = create_bitmap("Test Bitmap 15", 100, 100);
    bitmap_cleanup cleanup_bitmap;
    clear_bitmap(test_bitmap, color_white());
    fill_rectangle_on_bitmap(test_bitmap, color_black(), 0.0, 0.0, 50.0, 50.0);
    draw_bitmap(test_bitmap, 400.0, 300.0, option_flip_xy(option_defaults()));
    refresh_screen();
    REQUIRE(color_black() == get_pixel(test_window, 450.0, 350.0));
    REQUIRE(color_white() == get_pixel(test_window, 450.0, 250.0));
    free_bitmap(test_bitmap);
}
TEST_CASE_METHOD(TestGraphicsFixture, "option_flip_y_integration") {
    auto test_window = open_window("Test Window 29", 800, 600);
    window_cleanup cleanup_window;
    clear_window(test_window, color_white());
    auto test_bitmap = create_bitmap("Test Bitmap 16", 100, 100);
    bitmap_cleanup cleanup_bitmap;
    clear_bitmap(test_bitmap, color_white());
    fill_rectangle_on_bitmap(test_bitmap, color_black(), 0.0, 0.0, 100.0, 50.0);
    draw_bitmap(test_bitmap, 400.0, 300.0, option_flip_y());
    refresh_screen();
    REQUIRE(color_black() == get_pixel(test_window, 400.0, 325.0));
    REQUIRE(color_white() == get_pixel(test_window, 400.0, 275.0));
    free_bitmap(test_bitmap);
}
TEST_CASE_METHOD(TestGraphicsFixture, "option_flip_y_with_options_integration") {
    auto test_window = open_window("Test Window 30", 800, 600);
    window_cleanup cleanup_window;
    clear_window(test_window, color_white());
    auto test_bitmap = create_bitmap("Test Bitmap 17", 100, 100);
    bitmap_cleanup cleanup_bitmap;
    clear_bitmap(test_bitmap, color_white());
    fill_rectangle_on_bitmap(test_bitmap, color_black(), 0.0, 0.0, 100.0, 50.0);
    draw_bitmap(test_bitmap, 400.0, 300.0, option_flip_y(option_defaults()));
    refresh_screen();
    REQUIRE(color_black() == get_pixel(test_window, 400.0, 325.0));
    REQUIRE(color_white() == get_pixel(test_window, 400.0, 275.0));
    free_bitmap(test_bitmap);
}
TEST_CASE_METHOD(TestGraphicsFixture, "option_line_width_integration") {
    auto test_window = open_window("Test Window 31", 800, 600);
    window_cleanup cleanup_window;
    clear_window(test_window, color_white());
    draw_line(color_black(), 100.0, 100.0, 200.0, 200.0, option_line_width(5));
    refresh_screen();
    REQUIRE(color_black() == get_pixel(test_window, 150.0, 150.0));
    REQUIRE(color_white() == get_pixel(test_window, 140.0, 150.0));
}
TEST_CASE_METHOD(TestGraphicsFixture, "option_line_width_with_options_integration") {
    auto test_window = open_window("Test Window 32", 800, 600);
    window_cleanup cleanup_window;
    clear_window(test_window, color_white());
    draw_line(color_black(), 100.0, 100.0, 200.0, 200.0, option_line_width(5, option_defaults()));
    refresh_screen();
    REQUIRE(color_black() == get_pixel(test_window, 150.0, 150.0));
    REQUIRE(color_white() == get_pixel(test_window, 145.0, 150.0));
}
TEST_CASE_METHOD(TestGraphicsFixture, "option_part_bmp_integration") {
    auto test_window = open_window("Test Window 33", 800, 600);
    window_cleanup cleanup_window;
    clear_window(test_window, color_white());
    auto test_bitmap = create_bitmap("Test Bitmap 18", 100, 100);
    bitmap_cleanup cleanup_bitmap;
    clear_bitmap(test_bitmap, color_black());
    draw_bitmap(test_bitmap, 100.0, 100.0, option_part_bmp(0.0, 0.0, 50.0, 50.0));
    refresh_screen();
    REQUIRE(color_black() == get_pixel(test_window, 125.0, 125.0));
    REQUIRE(color_white() == get_pixel(test_window, 175.0, 175.0));
    free_bitmap(test_bitmap);
}
TEST_CASE_METHOD(TestGraphicsFixture, "option_part_bmp_with_options_integration") {
    auto test_window = open_window("Test Window 34", 800, 600);
    window_cleanup cleanup_window;
    clear_window(test_window, color_white());
    auto test_bitmap = create_bitmap("Test Bitmap 19", 100, 100);
    bitmap_cleanup cleanup_bitmap;
    clear_bitmap(test_bitmap, color_black());
    draw_bitmap(test_bitmap, 100.0, 100.0, option_part_bmp(0.0, 0.0, 50.0, 50.0, option_defaults()));
    refresh_screen();
    REQUIRE(color_black() == get_pixel(test_window, 125.0, 125.0));
    REQUIRE(color_white() == get_pixel(test_window, 175.0, 175.0));
    free_bitmap(test_bitmap);
}
TEST_CASE_METHOD(TestGraphicsFixture, "option_part_bmp_from_rectangle_integration") {
    auto test_window = open_window("Test Window 35", 800, 600);
    window_cleanup cleanup_window;
    clear_window(test_window, color_white());
    auto test_bitmap = create_bitmap("Test Bitmap 20", 100, 100);
    bitmap_cleanup cleanup_bitmap;
    clear_bitmap(test_bitmap, color_black());
    draw_bitmap(test_bitmap, 0.0, 0.0, option_part_bmp(rectangle_from(0.0, 0.0, 50.0, 50.0)));
    refresh_screen();
    REQUIRE(color_black() == get_pixel(test_window, 25.0, 25.0));
    REQUIRE(color_white() == get_pixel(test_window, 75.0, 75.0));
    free_bitmap(test_bitmap);
}
TEST_CASE_METHOD(TestGraphicsFixture, "option_part_bmp_from_rectangle_with_options_integration") {
    auto test_window = open_window("Test Window 36", 800, 600);
    window_cleanup cleanup_window;
    clear_window(test_window, color_white());
    auto test_bitmap = create_bitmap("Test Bitmap 21", 100, 100);
    bitmap_cleanup cleanup_bitmap;
    clear_bitmap(test_bitmap, color_black());
    draw_bitmap(test_bitmap, 0.0, 0.0, option_part_bmp(rectangle_from(0.0, 0.0, 50.0, 50.0), option_defaults()));
    refresh_screen();
    REQUIRE(color_black() == get_pixel(test_window, 25.0, 25.0));
    REQUIRE(color_white() == get_pixel(test_window, 75.0, 75.0));
    free_bitmap(test_bitmap);
}
TEST_CASE_METHOD(TestGraphicsFixture, "option_rotate_bmp_integration") {
    auto test_window = open_window("Test Window 37", 800, 600);
    window_cleanup cleanup_window;
    clear_window(test_window, color_white());
    auto test_bitmap = create_bitmap("Test Bitmap 22", 100, 100);
    bitmap_cleanup cleanup_bitmap;
    clear_bitmap(test_bitmap, color_white());
    fill_rectangle_on_bitmap(test_bitmap, color_black(), 0.0, 0.0, 50.0, 100.0);
    draw_bitmap(test_bitmap, 400.0, 300.0, option_rotate_bmp(90.0));
    refresh_screen();
    REQUIRE(color_black() == get_pixel(test_window, 400.0, 300.0));
    REQUIRE(color_white() == get_pixel(test_window, 400.0, 350.0));
    free_bitmap(test_bitmap);
}
TEST_CASE_METHOD(TestGraphicsFixture, "option_rotate_bmp_with_anchor_integration") {
    auto test_window = open_window("Test Window 38", 800, 600);
    window_cleanup cleanup_window;
    clear_window(test_window, color_white());
    auto test_bitmap = create_bitmap("Test Bitmap 23", 100, 100);
    bitmap_cleanup cleanup_bitmap;
    clear_bitmap(test_bitmap, color_white());
    fill_rectangle_on_bitmap(test_bitmap, color_black(), 0.0, 0.0, 50.0, 100.0);
    draw_bitmap(test_bitmap, 400.0, 300.0, option_rotate_bmp(90.0, 50.0, 50.0));
    refresh_screen();
    REQUIRE(color_black() == get_pixel(test_window, 500.0, 300.0));
    REQUIRE(color_white() == get_pixel(test_window, 450.0, 300.0));
    free_bitmap(test_bitmap);
}
TEST_CASE_METHOD(TestGraphicsFixture, "option_rotate_bmp_with_anchor_and_options_integration") {
    auto test_window = open_window("Test Window 39", 800, 600);
    window_cleanup cleanup_window;
    clear_window(test_window, color_white());
    auto test_bitmap = create_bitmap("Test Bitmap 24", 100, 100);
    bitmap_cleanup cleanup_bitmap;
    clear_bitmap(test_bitmap, color_white());
    fill_rectangle_on_bitmap(test_bitmap, color_black(), 0.0, 0.0, 50.0, 100.0);
    draw_bitmap(test_bitmap, 400.0, 300.0, option_rotate_bmp(90.0, 50.0, 50.0, option_defaults()));
    refresh_screen();
    REQUIRE(color_black() == get_pixel(test_window, 500.0, 300.0));
    REQUIRE(color_white() == get_pixel(test_window, 400.0, 300.0));
    free_bitmap(test_bitmap);
}
TEST_CASE_METHOD(TestGraphicsFixture, "option_rotate_bmp_with_options_integration") {
    auto test_window = open_window("Test Window 40", 800, 600);
    window_cleanup cleanup_window;
    clear_window(test_window, color_white());
    auto test_bitmap = create_bitmap("Test Bitmap 25", 100, 100);
    bitmap_cleanup cleanup_bitmap;
    clear_bitmap(test_bitmap, color_white());
    fill_rectangle_on_bitmap(test_bitmap, color_black(), 0.0, 0.0, 50.0, 100.0);
    draw_bitmap(test_bitmap, 400.0, 300.0, option_rotate_bmp(90.0, option_defaults()));
    refresh_screen();
    REQUIRE(color_black() == get_pixel(test_window, 400.0, 300.0));
    REQUIRE(color_white() == get_pixel(test_window, 400.0, 350.0));
    free_bitmap(test_bitmap);
}
TEST_CASE_METHOD(TestGraphicsFixture, "option_scale_bmp_integration") {
    auto test_window = open_window("Test Window 41", 800, 600);
    window_cleanup cleanup_window;
    clear_window(test_window, color_white());
    auto test_bitmap = create_bitmap("Test Bitmap 26", 50, 50);
    bitmap_cleanup cleanup_bitmap;
    clear_bitmap(test_bitmap, color_black());
    draw_bitmap(test_bitmap, 400.0, 300.0, option_scale_bmp(2.0, 2.0));
    refresh_screen();
    REQUIRE(color_black() == get_pixel(test_window, 451.0, 300.0));
    REQUIRE(color_white() == get_pixel(test_window, 500.0, 300.0));
    free_bitmap(test_bitmap);
}
TEST_CASE_METHOD(TestGraphicsFixture, "option_scale_bmp_with_options_integration") {
    auto test_window = open_window("Test Window 42", 800, 600);
    window_cleanup cleanup_window;
    clear_window(test_window, color_white());
    auto test_bitmap = create_bitmap("Test Bitmap 27", 50, 50);
    bitmap_cleanup cleanup_bitmap;
    clear_bitmap(test_bitmap, color_black());
    draw_bitmap(test_bitmap, 400.0, 300.0, option_scale_bmp(2.0, 2.0, option_defaults()));
    refresh_screen();
    REQUIRE(color_black() == get_pixel(test_window, 451.0, 300.0));
    REQUIRE(color_white() == get_pixel(test_window, 500.0, 300.0));
    free_bitmap(test_bitmap);
}
TEST_CASE_METHOD(TestGraphicsFixture, "option_to_screen_integration") {
    auto test_window = open_window("Test Window 43", 800, 600);
    window_cleanup cleanup_window;
    clear_window(test_window, color_white());
    draw_circle(color_black(), circle_at(400.0, 300.0, 50.0), option_to_screen());
    refresh_screen();
    REQUIRE(color_black() == get_pixel(test_window, 450.0, 300.0));
    REQUIRE(color_white() == get_pixel(test_window, 451.0, 300.0));
}
TEST_CASE_METHOD(TestGraphicsFixture, "option_to_screen_with_options_integration") {
    auto test_window = open_window("Test Window 44", 800, 600);
    window_cleanup cleanup_window;
    clear_window(test_window, color_white());
    draw_circle(color_black(), circle_at(400.0, 300.0, 50.0), option_to_screen(option_defaults()));
    refresh_screen();
    REQUIRE(color_black() == get_pixel(test_window, 400.0, 250.0));
    REQUIRE(color_white() == get_pixel(test_window, 400.0, 300.0));
}
TEST_CASE_METHOD(TestGraphicsFixture, "option_to_world_integration") {
    auto test_window = open_window("Test Window 45", 800, 600);
    window_cleanup cleanup_window;
    clear_window(test_window, color_white());
    move_camera_to(100.0, 100.0);
    draw_circle(color_black(), circle_at(400.0, 300.0, 50.0), option_to_world());
    refresh_screen();
    REQUIRE(color_black() == get_pixel(test_window, 350.0, 200.0));
    REQUIRE(color_white() == get_pixel(test_window, 375.0, 200.0));
}
TEST_CASE_METHOD(TestGraphicsFixture, "option_to_world_with_options_integration") {
    auto test_window = open_window("Test Window 46", 800, 600);
    window_cleanup cleanup_window;
    clear_window(test_window, color_white());
    move_camera_to(100.0, 100.0);
    draw_circle(color_black(), circle_at(400.0, 300.0, 50.0), option_to_world(option_defaults()));
    refresh_screen();
    REQUIRE(color_black() == get_pixel(test_window, 350.0, 200.0));
    REQUIRE(color_white() == get_pixel(test_window, 375.0, 200.0));
}
TEST_CASE_METHOD(TestGraphicsFixture, "option_with_animation_integration") {
    auto test_window = open_window("Test Window 47", 800, 600);
    window_cleanup cleanup_window;
    auto kermit_script = load_animation_script("Test Script 1", "kermit.txt");
    animation_script_cleanup cleanup_animation_script;
    auto test_animation = create_animation(kermit_script, "moonwalkback");
    animation_cleanup cleanup_animation(test_animation);
    auto test_bitmap = load_bitmap("Test Bitmap 28", "frog.png");
    bitmap_cleanup cleanup_bitmap;
    bitmap_set_cell_details(test_bitmap, 73, 105, 4, 4, 16);
    while (window_close_requested(test_window) == false) {
        clear_screen();
        draw_bitmap(test_bitmap, 100.0, 100.0, option_with_animation(test_animation));
        draw_text("Test: option_with_animation. Should be moving. Close when done.", color_black(), 10.0, 10.0);
        update_animation(test_animation);
        delay(100);
        refresh_screen();
    }
}
TEST_CASE_METHOD(TestGraphicsFixture, "option_with_animation_with_options_integration") {
    auto test_window = open_window("Test Window 48", 800, 600);
    window_cleanup cleanup_window;
    auto kermit_script = load_animation_script("Test Script 2", "kermit.txt");
    animation_script_cleanup cleanup_animation_script;
    auto test_animation = create_animation(kermit_script, "moonwalkback");
    animation_cleanup cleanup_animation(test_animation);
    auto test_bitmap = load_bitmap("Test Bitmap 29", "frog.png");
    bitmap_cleanup cleanup_bitmap;
    bitmap_set_cell_details(test_bitmap, 73, 105, 4, 4, 16);
    while (window_close_requested(test_window) == false) {
        clear_screen();
        draw_bitmap(test_bitmap, 100.0, 100.0, option_with_animation(test_animation, option_defaults()));
        draw_text("Test: option_with_animation_with_options. Should be moving. Close when done.", color_black(), 10.0, 10.0);
        update_animation(test_animation);
        delay(100);
        refresh_screen();
    }
}
TEST_CASE_METHOD(TestGraphicsFixture, "option_with_bitmap_cell_integration") {
    auto test_window = open_window("Test Window 49", 800, 600);
    window_cleanup cleanup_window;
    clear_window(test_window, color_white());
    auto test_bitmap = create_bitmap("Test Bitmap 30", 64, 64);
    bitmap_cleanup cleanup_bitmap;
    clear_bitmap(test_bitmap, color_black());
    bitmap_set_cell_details(test_bitmap, 32, 32, 2, 2, 4);
    draw_bitmap(test_bitmap, 100.0, 100.0, option_with_bitmap_cell(1));
    refresh_screen();
    REQUIRE(color_black() == get_pixel(test_window, 116.0, 116.0));
    REQUIRE(color_white() == get_pixel(test_window, 84.0, 84.0));
    free_bitmap(test_bitmap);
}
TEST_CASE_METHOD(TestGraphicsFixture, "option_with_bitmap_cell_with_options_integration") {
    auto test_window = open_window("Test Window 50", 800, 600);
    window_cleanup cleanup_window;
    clear_window(test_window, color_white());
    auto test_bitmap = create_bitmap("Test Bitmap 31", 64, 64);
    bitmap_cleanup cleanup_bitmap;
    clear_bitmap(test_bitmap, color_black());
    bitmap_set_cell_details(test_bitmap, 32, 32, 2, 2, 4);
    draw_bitmap(test_bitmap, 100.0, 100.0, option_with_bitmap_cell(1, option_defaults()));
    refresh_screen();
    REQUIRE(color_black() == get_pixel(test_window, 116.0, 116.0));
    REQUIRE(color_white() == get_pixel(test_window, 84.0, 84.0));
    free_bitmap(test_bitmap);
}
TEST_CASE_METHOD(TestGraphicsFixture, "draw_ellipse_within_rectangle_integration") {
    auto test_window = open_window("Test Window 51", 800, 600);
    window_cleanup cleanup_window;
    clear_window(test_window, color_white());
    draw_ellipse(color_black(), rectangle_from(100.0, 100.0, 200.0, 150.0));
    refresh_screen();
    REQUIRE(color_black() == get_pixel(test_window, 300.0, 175.0));
    REQUIRE(color_white() == get_pixel(test_window, 200.0, 175.0));
    REQUIRE(color_white() == get_pixel(test_window, 350.0, 175.0));
}
TEST_CASE_METHOD(TestGraphicsFixture, "draw_ellipse_within_rectangle_with_options_integration") {
    auto test_window = open_window("Test Window 52", 800, 600);
    window_cleanup cleanup_window;
    clear_window(test_window, color_white());
    draw_ellipse(color_black(), rectangle_from(100.0, 100.0, 200.0, 100.0), option_defaults());
    refresh_screen();
    REQUIRE(color_black() == get_pixel(test_window, 300.0, 150.0));
    REQUIRE(color_white() == get_pixel(test_window, 200.0, 150.0));
    REQUIRE(color_white() == get_pixel(test_window, 350.0, 150.0));
}
TEST_CASE_METHOD(TestGraphicsFixture, "draw_ellipse_integration") {
    auto test_window = open_window("Test Window 53", 800, 600);
    window_cleanup cleanup_window;
    clear_window(test_window, color_white());
    draw_ellipse(color_black(), 400.0, 300.0, 100.0, 50.0);
    refresh_screen();
    REQUIRE(color_black() == get_pixel(test_window, 450.0, 300.0));
    REQUIRE(color_white() == get_pixel(test_window, 400.0, 300.0));
    REQUIRE(color_white() == get_pixel(test_window, 500.0, 300.0));
}
TEST_CASE_METHOD(TestGraphicsFixture, "draw_ellipse_with_options_integration") {
    auto test_window = open_window("Test Window 54", 800, 600);
    window_cleanup cleanup_window;
    clear_window(test_window, color_white());
    draw_ellipse(color_black(), 400.0, 300.0, 100.0, 50.0, option_defaults());
    refresh_screen();
    REQUIRE(color_black() == get_pixel(test_window, 450.0, 300.0));
    REQUIRE(color_white() == get_pixel(test_window, 400.0, 300.0));
    REQUIRE(color_white() == get_pixel(test_window, 500.0, 300.0));
}
TEST_CASE_METHOD(TestGraphicsFixture, "draw_ellipse_on_bitmap_within_rectangle_integration") {
    auto test_bitmap = create_bitmap("Test Bitmap 32", 200, 200);
    bitmap_cleanup cleanup_bitmap;
    clear_bitmap(test_bitmap, color_white());
    auto rect = rectangle_from(50.0, 50.0, 100.0, 100.0);
    draw_ellipse_on_bitmap(test_bitmap, color_black(), rect);
    REQUIRE(color_black() == get_pixel(test_bitmap, 150.0, 100.0));
    REQUIRE(color_white() == get_pixel(test_bitmap, 125.0, 100.0));
    REQUIRE(color_white() == get_pixel(test_bitmap, 175.0, 100.0));
}
TEST_CASE_METHOD(TestGraphicsFixture, "draw_ellipse_on_bitmap_within_rectangle_with_options_integration") {
    auto test_bitmap = create_bitmap("Test Bitmap 33", 200, 200);
    bitmap_cleanup cleanup_bitmap;
    clear_bitmap(test_bitmap, color_white());
    draw_ellipse_on_bitmap(test_bitmap, color_black(), rectangle_from(50.0, 50.0, 100.0, 100.0), option_defaults());
    REQUIRE(color_black() == get_pixel(test_bitmap, 150.0, 100.0));
    REQUIRE(color_white() == get_pixel(test_bitmap, 125.0, 100.0));
    REQUIRE(color_white() == get_pixel(test_bitmap, 175.0, 100.0));
}
TEST_CASE_METHOD(TestGraphicsFixture, "draw_ellipse_on_bitmap_integration") {
    auto test_bitmap = create_bitmap("Test Bitmap 34", 200, 200);
    bitmap_cleanup cleanup_bitmap;
    clear_bitmap(test_bitmap, color_white());
    draw_ellipse_on_bitmap(test_bitmap, color_black(), 100.0, 100.0, 50.0, 30.0);
    REQUIRE(color_black() == get_pixel(test_bitmap, 125.0, 100.0));
    REQUIRE(color_white() == get_pixel(test_bitmap, 100.0, 100.0));
    REQUIRE(color_white() == get_pixel(test_bitmap, 160.0, 100.0));
}
TEST_CASE_METHOD(TestGraphicsFixture, "draw_ellipse_on_bitmap_with_options_integration") {
    auto test_bitmap = create_bitmap("Test Bitmap 35", 200, 200);
    bitmap_cleanup cleanup_bitmap;
    clear_bitmap(test_bitmap, color_white());
    draw_ellipse_on_bitmap(test_bitmap, color_black(), 100.0, 100.0, 50.0, 30.0, option_defaults());
    REQUIRE(color_black() == get_pixel(test_bitmap, 125.0, 100.0));
    REQUIRE(color_white() == get_pixel(test_bitmap, 100.0, 100.0));
    REQUIRE(color_white() == get_pixel(test_bitmap, 160.0, 100.0));
}
TEST_CASE_METHOD(TestGraphicsFixture, "draw_ellipse_on_window_within_rectangle_integration") {
    auto test_window = open_window("Test Window 55", 800, 600);
    window_cleanup cleanup_window;
    clear_window(test_window, color_white());
    auto rect = rectangle_from(100.0, 100.0, 200.0, 100.0);
    draw_ellipse_on_window(test_window, color_black(), rect);
    refresh_screen();
    REQUIRE(color_black() == get_pixel(test_window, 300.0, 150.0));
    REQUIRE(color_white() == get_pixel(test_window, 250.0, 150.0));
    REQUIRE(color_white() == get_pixel(test_window, 350.0, 150.0));
}
TEST_CASE_METHOD(TestGraphicsFixture, "draw_ellipse_on_window_within_rectangle_with_options_integration") {
    auto test_window = open_window("Test Window 56", 800, 600);
    window_cleanup cleanup_window;
    clear_window(test_window, color_white());
    auto rect = rectangle_from(100.0, 100.0, 200.0, 100.0);
    draw_ellipse_on_window(test_window, color_black(), rect, option_defaults());
    refresh_screen();
    REQUIRE(color_black() == get_pixel(test_window, 300.0, 150.0));
    REQUIRE(color_white() == get_pixel(test_window, 250.0, 150.0));
    REQUIRE(color_white() == get_pixel(test_window, 350.0, 150.0));
}
TEST_CASE_METHOD(TestGraphicsFixture, "draw_ellipse_on_window_integration") {
    auto test_window = open_window("Test Window 57", 800, 600);
    window_cleanup cleanup_window;
    clear_window(test_window, color_white());
    draw_ellipse_on_window(test_window, color_black(), 400.0, 300.0, 100.0, 50.0);
    refresh_screen();
    REQUIRE(color_black() == get_pixel(test_window, 450.0, 300.0));
    REQUIRE(color_white() == get_pixel(test_window, 400.0, 300.0));
    REQUIRE(color_white() == get_pixel(test_window, 500.0, 300.0));
}
TEST_CASE_METHOD(TestGraphicsFixture, "draw_ellipse_on_window_with_options_integration") {
    auto test_window = open_window("Test Window 58", 800, 600);
    window_cleanup cleanup_window;
    clear_window(test_window, color_white());
    draw_ellipse_on_window(test_window, color_black(), 400.0, 300.0, 100.0, 50.0, option_defaults());
    refresh_screen();
    REQUIRE(color_black() == get_pixel(test_window, 450.0, 300.0));
    REQUIRE(color_white() == get_pixel(test_window, 450.0, 325.0));
    REQUIRE(color_white() == get_pixel(test_window, 500.0, 300.0));
}
TEST_CASE_METHOD(TestGraphicsFixture, "fill_ellipse_within_rectangle_integration") {
    auto test_window = open_window("Test Window 59", 800, 600);
    window_cleanup cleanup_window;
    clear_window(test_window, color_white());
    fill_ellipse(color_black(), rectangle_from(100.0, 100.0, 200.0, 100.0));
    refresh_screen();
    REQUIRE(color_black() == get_pixel(test_window, 200.0, 100.0));
    REQUIRE(color_black() == get_pixel(test_window, 150.0, 150.0));
    REQUIRE(color_white() == get_pixel(test_window, 50.0, 50.0));
}
TEST_CASE_METHOD(TestGraphicsFixture, "fill_ellipse_within_rectangle_with_options_integration") {
    auto test_window = open_window("Test Window 60", 800, 600);
    window_cleanup cleanup_window;
    clear_window(test_window, color_white());
    fill_ellipse(color_black(), rectangle_from(100.0, 100.0, 200.0, 100.0), option_defaults());
    refresh_screen();
    REQUIRE(color_black() == get_pixel(test_window, 200.0, 100.0));
    REQUIRE(color_black() == get_pixel(test_window, 150.0, 150.0));
    REQUIRE(color_white() == get_pixel(test_window, 50.0, 50.0));
}
TEST_CASE_METHOD(TestGraphicsFixture, "fill_ellipse_integration") {
    auto test_window = open_window("Test Window 61", 800, 600);
    window_cleanup cleanup_window;
    clear_window(test_window, color_white());
    fill_ellipse(color_black(), 400.0, 300.0, 100.0, 50.0);
    refresh_screen();
    REQUIRE(color_black() == get_pixel(test_window, 450.0, 300.0));
    REQUIRE(color_black() == get_pixel(test_window, 450.0, 325.0));
    REQUIRE(color_white() == get_pixel(test_window, 500.0, 300.0));
}
TEST_CASE_METHOD(TestGraphicsFixture, "fill_ellipse_with_options_integration") {
    auto test_window = open_window("Test Window 62", 800, 600);
    window_cleanup cleanup_window;
    clear_window(test_window, color_white());
    fill_ellipse(color_black(), 400.0, 300.0, 100.0, 50.0, option_defaults());
    refresh_screen();
    REQUIRE(color_black() == get_pixel(test_window, 450.0, 300.0));
    REQUIRE(color_black() == get_pixel(test_window, 450.0, 325.0));
    REQUIRE(color_white() == get_pixel(test_window, 300.0, 300.0));
}
TEST_CASE_METHOD(TestGraphicsFixture, "fill_ellipse_on_bitmap_within_rectangle_integration") {
    auto test_bitmap = create_bitmap("Test Bitmap 36", 200, 200);
    bitmap_cleanup cleanup_bitmap;
    clear_bitmap(test_bitmap, color_white());
    fill_ellipse_on_bitmap(test_bitmap, color_black(), rectangle_from(50.0, 50.0, 100.0, 100.0));
    REQUIRE(color_black() == get_pixel(test_bitmap, 100.0, 100.0));
    REQUIRE(color_black() == get_pixel(test_bitmap, 75.0, 75.0));
    REQUIRE(color_white() == get_pixel(test_bitmap, 175.0, 175.0));
}
TEST_CASE_METHOD(TestGraphicsFixture, "fill_ellipse_on_bitmap_within_rectangle_with_options_integration") {
    auto test_bitmap = create_bitmap("Test Bitmap 37", 200, 200);
    bitmap_cleanup cleanup_bitmap;
    clear_bitmap(test_bitmap, color_white());
    fill_ellipse_on_bitmap(test_bitmap, color_black(), rectangle_from(50.0, 50.0, 100.0, 100.0), option_defaults());
    REQUIRE(color_black() == get_pixel(test_bitmap, 100.0, 100.0));
    REQUIRE(color_black() == get_pixel(test_bitmap, 75.0, 75.0));
    REQUIRE(color_white() == get_pixel(test_bitmap, 175.0, 175.0));
}
TEST_CASE_METHOD(TestGraphicsFixture, "fill_ellipse_on_bitmap_integration") {
    auto test_bitmap = create_bitmap("Test Bitmap 38", 200, 200);
    bitmap_cleanup cleanup_bitmap;
    clear_bitmap(test_bitmap, color_white());
    fill_ellipse_on_bitmap(test_bitmap, color_black(), 100.0, 100.0, 50.0, 30.0);
    REQUIRE(color_black() == get_pixel(test_bitmap, 125.0, 100.0));
    REQUIRE(color_black() == get_pixel(test_bitmap, 125.0, 125.0));
    REQUIRE(color_white() == get_pixel(test_bitmap, 150.0, 100.0));
}
TEST_CASE_METHOD(TestGraphicsFixture, "fill_ellipse_on_bitmap_with_options_integration") {
    auto test_bitmap = create_bitmap("Test Bitmap 39", 200, 200);
    bitmap_cleanup cleanup_bitmap;
    clear_bitmap(test_bitmap, color_white());
    fill_ellipse_on_bitmap(test_bitmap, color_black(), 50.0, 50.0, 100.0, 50.0, option_defaults());
    REQUIRE(color_black() == get_pixel(test_bitmap, 100.0, 50.0));
    REQUIRE(color_black() == get_pixel(test_bitmap, 100.0, 75.0));
    REQUIRE(color_white() == get_pixel(test_bitmap, 150.0, 50.0));
}
TEST_CASE_METHOD(TestGraphicsFixture, "fill_ellipse_on_window_within_rectangle_integration") {
    auto test_window = open_window("Test Window 63", 800, 600);
    window_cleanup cleanup_window;
    clear_window(test_window, color_white());
    fill_ellipse_on_window(test_window, color_black(), rectangle_from(100.0, 100.0, 200.0, 150.0));
    refresh_screen();
    REQUIRE(color_black() == get_pixel(test_window, 200.0, 175.0));
    REQUIRE(color_black() == get_pixel(test_window, 150.0, 175.0));
    REQUIRE(color_white() == get_pixel(test_window, 350.0, 175.0));
}
TEST_CASE_METHOD(TestGraphicsFixture, "fill_ellipse_on_window_within_rectangle_with_options_integration") {
    auto test_window = open_window("Test Window 64", 800, 600);
    window_cleanup cleanup_window;
    clear_window(test_window, color_white());
    fill_ellipse_on_window(test_window, color_black(), rectangle_from(100.0, 100.0, 200.0, 150.0), option_defaults());
    refresh_screen();
    REQUIRE(color_black() == get_pixel(test_window, 200.0, 175.0));
    REQUIRE(color_black() == get_pixel(test_window, 150.0, 175.0));
    REQUIRE(color_white() == get_pixel(test_window, 350.0, 175.0));
}
TEST_CASE_METHOD(TestGraphicsFixture, "fill_ellipse_on_window_integration") {
    auto test_window = open_window("Test Window 65", 800, 600);
    window_cleanup cleanup_window;
    clear_window(test_window, color_white());
    fill_ellipse_on_window(test_window, color_black(), 400.0, 300.0, 100.0, 50.0);
    refresh_screen();
    REQUIRE(color_black() == get_pixel(test_window, 450.0, 300.0));
    REQUIRE(color_black() == get_pixel(test_window, 450.0, 325.0));
    REQUIRE(color_white() == get_pixel(test_window, 500.0, 300.0));
}
TEST_CASE_METHOD(TestGraphicsFixture, "fill_ellipse_on_window_with_options_integration") {
    auto test_window = open_window("Test Window 66", 800, 600);
    window_cleanup cleanup_window;
    clear_window(test_window, color_white());
    fill_ellipse_on_window(test_window, color_black(), 400.0, 300.0, 100.0, 50.0, option_defaults());
    refresh_screen();
    REQUIRE(color_black() == get_pixel(test_window, 450.0, 300.0));
    REQUIRE(color_black() == get_pixel(test_window, 450.0, 325.0));
    REQUIRE(color_white() == get_pixel(test_window, 500.0, 300.0));
}
TEST_CASE_METHOD(TestGraphicsFixture, "clear_screen_to_white_integration") {
    auto test_window = open_window("Test Window 67", 800, 600);
    window_cleanup cleanup_window;
    draw_pixel(color_black(), 100.0, 100.0);
    refresh_screen();
    REQUIRE(color_black() == get_pixel(test_window, 100.0, 100.0));
    clear_screen();
    refresh_screen();
    REQUIRE(color_white() == get_pixel(test_window, 100.0, 100.0));
}
TEST_CASE_METHOD(TestGraphicsFixture, "clear_screen_integration") {
    auto test_window = open_window("Test Window 68", 800, 600);
    window_cleanup cleanup_window;
    draw_pixel(color_black(), 100.0, 100.0);
    refresh_screen();
    REQUIRE(color_black() == get_pixel(test_window, 100.0, 100.0));
    clear_screen(color_white());
    refresh_screen();
    REQUIRE(color_white() == get_pixel(test_window, 100.0, 100.0));
}
TEST_CASE_METHOD(TestGraphicsFixture, "display_details_integration") {
    auto displays = number_of_displays();
    REQUIRE(displays > 0);
    auto display = display_details(0u);
    REQUIRE(display != nullptr);
    REQUIRE(display_width(display) > 0);
    REQUIRE(display_height(display) > 0);
    REQUIRE(!display_name(display).empty());
}
TEST_CASE_METHOD(TestGraphicsFixture, "display_height_integration") {
    auto display = display_details(0u);
    REQUIRE(display_height(display) > 0);
}
TEST_CASE_METHOD(TestGraphicsFixture, "display_name_integration") {
    auto display = display_details(0u);
    REQUIRE(!display_name(display).empty());
    REQUIRE(!display_name(display).empty());
}
TEST_CASE_METHOD(TestGraphicsFixture, "display_width_integration") {
    auto display = display_details(0u);
    REQUIRE(display_width(display) > 0);
}
TEST_CASE_METHOD(TestGraphicsFixture, "display_x_integration") {
    auto display = display_details(0u);
    REQUIRE(0 == display_x(display));
}
TEST_CASE_METHOD(TestGraphicsFixture, "display_y_integration") {
    auto display = display_details(0u);
    REQUIRE(0 == display_y(display));
}
TEST_CASE_METHOD(TestGraphicsFixture, "number_of_displays_integration") {
    REQUIRE(number_of_displays() > 0);
}
TEST_CASE_METHOD(TestGraphicsFixture, "refresh_screen_integration") {
    auto test_window = open_window("Test Window 69", 800, 600);
    window_cleanup cleanup_window;
    clear_window(test_window, color_white());
    draw_circle(color_black(), circle_at(400.0, 300.0, 50.0));
    refresh_screen();
}
TEST_CASE_METHOD(TestGraphicsFixture, "refresh_screen_with_target_fps_integration") {
    auto test_window = open_window("Test Window 70", 800, 600);
    window_cleanup cleanup_window;
    clear_window(test_window, color_white());
    draw_circle(color_black(), circle_at(400.0, 300.0, 50.0));
    refresh_screen(60u);
}
TEST_CASE_METHOD(TestGraphicsFixture, "save_bitmap_integration") {
    auto test_bitmap = create_bitmap("Test Bitmap 40", 100, 100);
    bitmap_cleanup cleanup_bitmap;
    clear_bitmap(test_bitmap, color_white());
    draw_pixel_on_bitmap(test_bitmap, color_black(), 50.0, 50.0);
    save_bitmap(test_bitmap, "Test Bitmap 40");
}
TEST_CASE_METHOD(TestGraphicsFixture, "screen_height_integration") {
    open_window("Test Window 71", 800, 600);
    window_cleanup cleanup_window;
    REQUIRE(600 == screen_height());
}
TEST_CASE_METHOD(TestGraphicsFixture, "screen_width_integration") {
    open_window("Test Window 72", 800, 600);
    window_cleanup cleanup_window;
    REQUIRE(800 == screen_width());
}
TEST_CASE_METHOD(TestGraphicsFixture, "take_screenshot_integration") {
    auto test_window = open_window("Test Window 73", 800, 600);
    window_cleanup cleanup_window;
    clear_window(test_window, color_white());
    draw_circle(color_black(), circle_at(400.0, 300.0, 50.0));
    refresh_screen();
    take_screenshot("test_screenshot");
}
TEST_CASE_METHOD(TestGraphicsFixture, "take_screenshot_of_window_integration") {
    auto test_window = open_window("Test Window 74", 800, 600);
    window_cleanup cleanup_window;
    clear_window(test_window, color_white());
    draw_circle(color_black(), circle_at(400.0, 300.0, 50.0));
    refresh_screen();
    take_screenshot(test_window, "test_screenshot");
}
TEST_CASE_METHOD(TestGraphicsFixture, "bitmap_bounding_circle_integration") {
    auto test_bitmap = create_bitmap("Test Bitmap 41", 100, 100);
    bitmap_cleanup cleanup_bitmap;
    auto test_point = point_at(50.0, 50.0);
    auto bounding_circle = bitmap_bounding_circle(test_bitmap, test_point);
    REQUIRE(test_point == center_point(bounding_circle));
    REQUIRE(100.0f == circle_radius(bounding_circle));
}
TEST_CASE_METHOD(TestGraphicsFixture, "bitmap_bounding_rectangle_integration") {
    auto test_bitmap = create_bitmap("Test Bitmap 42", 100, 100);
    bitmap_cleanup cleanup_bitmap;
    auto bounding_rect = bitmap_bounding_rectangle(test_bitmap);
    REQUIRE(0.0 == bounding_rect.x);
    REQUIRE(0.0 == bounding_rect.y);
    REQUIRE(100.0 == bounding_rect.width);
    REQUIRE(100.0 == bounding_rect.height);
}
TEST_CASE_METHOD(TestGraphicsFixture, "bitmap_bounding_rectangle_at_location_integration") {
    auto test_bitmap = create_bitmap("Test Bitmap 43", 100, 100);
    bitmap_cleanup cleanup_bitmap;
    auto bounding_rect = bitmap_bounding_rectangle(test_bitmap, 50.0, 50.0);
    REQUIRE(50.0 == bounding_rect.x);
    REQUIRE(50.0 == bounding_rect.y);
    REQUIRE(100.0 == bounding_rect.width);
    REQUIRE(100.0 == bounding_rect.height);
}
TEST_CASE_METHOD(TestGraphicsFixture, "bitmap_cell_center_integration") {
    auto test_bitmap = create_bitmap("Test Bitmap 44", 100, 100);
    bitmap_cleanup cleanup_bitmap;
    auto center = bitmap_cell_center(test_bitmap);
    REQUIRE(50.0 == center.x);
    REQUIRE(50.0 == center.y);
}
TEST_CASE_METHOD(TestGraphicsFixture, "bitmap_cell_circle_integration") {
    auto test_bitmap = create_bitmap("Test Bitmap 45", 100, 100);
    bitmap_cleanup cleanup_bitmap;
    bitmap_set_cell_details(test_bitmap, 50, 50, 2, 2, 4);
    auto circle = bitmap_cell_circle(test_bitmap, 50.0, 50.0);
    REQUIRE(50.0 == circle.center.x);
    REQUIRE(50.0 == circle.center.x);
    REQUIRE(25.0 == circle.radius);
}
TEST_CASE_METHOD(TestGraphicsFixture, "bitmap_cell_circle_at_point_integration") {
    auto test_bitmap = create_bitmap("Test Bitmap 46", 100, 100);
    bitmap_cleanup cleanup_bitmap;
    bitmap_set_cell_details(test_bitmap, 50, 50, 2, 2, 4);
    auto circle = bitmap_cell_circle(test_bitmap, point_at(100.0, 100.0));
    REQUIRE(100.0 == circle.center.x);
    REQUIRE(100.0 == circle.center.x);
    REQUIRE(25.0 == circle.radius);
}
TEST_CASE_METHOD(TestGraphicsFixture, "bitmap_cell_circle_at_point_with_scale_integration") {
    auto test_bitmap = create_bitmap("Test Bitmap 47", 100, 100);
    bitmap_cleanup cleanup_bitmap;
    bitmap_set_cell_details(test_bitmap, 50, 50, 2, 2, 4);
    auto circle = bitmap_cell_circle(test_bitmap, point_at(100.0, 100.0), 2.0);
    REQUIRE(100.0 == circle.center.x);
    REQUIRE(100.0 == circle.center.x);
    REQUIRE(50.0 == circle.radius);
}
TEST_CASE_METHOD(TestGraphicsFixture, "bitmap_cell_columns_integration") {
    auto test_bitmap = create_bitmap("Test Bitmap 48", 100, 100);
    bitmap_cleanup cleanup_bitmap;
    bitmap_set_cell_details(test_bitmap, 20, 20, 5, 5, 25);
    REQUIRE(5 == bitmap_cell_columns(test_bitmap));
}
TEST_CASE_METHOD(TestGraphicsFixture, "bitmap_cell_count_integration") {
    auto test_bitmap = create_bitmap("Test Bitmap 49", 100, 100);
    bitmap_cleanup cleanup_bitmap;
    bitmap_set_cell_details(test_bitmap, 20, 20, 5, 5, 25);
    REQUIRE(25 == bitmap_cell_count(test_bitmap));
}
TEST_CASE_METHOD(TestGraphicsFixture, "bitmap_cell_height_integration") {
    auto test_bitmap = create_bitmap("Test Bitmap 50", 100, 100);
    bitmap_cleanup cleanup_bitmap;
    bitmap_set_cell_details(test_bitmap, 20, 20, 5, 5, 25);
    REQUIRE(20 == bitmap_cell_height(test_bitmap));
}
TEST_CASE_METHOD(TestGraphicsFixture, "bitmap_cell_offset_integration") {
    auto test_bitmap = create_bitmap("Test Bitmap 51", 100, 100);
    bitmap_cleanup cleanup_bitmap;
    bitmap_set_cell_details(test_bitmap, 25, 25, 4, 4, 16);
    auto offset = bitmap_cell_offset(test_bitmap, 5);
    REQUIRE(25.0 == offset.x);
    REQUIRE(25.0 == offset.y);
}
TEST_CASE_METHOD(TestGraphicsFixture, "bitmap_cell_rectangle_integration") {
    auto test_bitmap = create_bitmap("Test Bitmap 52", 100, 100);
    bitmap_cleanup cleanup_bitmap;
    bitmap_set_cell_details(test_bitmap, 25, 25, 4, 4, 16);
    auto rect = bitmap_cell_rectangle(test_bitmap);
    REQUIRE(0.0 == rect.x);
    REQUIRE(0.0 == rect.y);
    REQUIRE(25.0 == rect.width);
    REQUIRE(25.0 == rect.height);
}
TEST_CASE_METHOD(TestGraphicsFixture, "bitmap_cell_rectangle_at_point_integration") {
    auto test_bitmap = create_bitmap("Test Bitmap 53", 100, 100);
    bitmap_cleanup cleanup_bitmap;
    bitmap_set_cell_details(test_bitmap, 25, 25, 4, 4, 16);
    auto rect = bitmap_cell_rectangle(test_bitmap, point_at(50.0, 50.0));
    REQUIRE(50.0 == rect.x);
    REQUIRE(50.0 == rect.y);
    REQUIRE(25.0 == rect.width);
    REQUIRE(25.0 == rect.height);
}
TEST_CASE_METHOD(TestGraphicsFixture, "bitmap_cell_rows_integration") {
    auto test_bitmap = create_bitmap("Test Bitmap 54", 100, 100);
    bitmap_cleanup cleanup_bitmap;
    bitmap_set_cell_details(test_bitmap, 20, 20, 5, 5, 25);
    REQUIRE(5 == bitmap_cell_rows(test_bitmap));
}
TEST_CASE_METHOD(TestGraphicsFixture, "bitmap_cell_width_integration") {
    auto test_bitmap = create_bitmap("Test Bitmap 55", 100, 100);
    bitmap_cleanup cleanup_bitmap;
    bitmap_set_cell_details(test_bitmap, 25, 25, 4, 4, 16);
    REQUIRE(25 == bitmap_cell_width(test_bitmap));
}
TEST_CASE_METHOD(TestGraphicsFixture, "bitmap_center_integration") {
    auto test_bitmap = create_bitmap("Test Bitmap 56", 100, 100);
    bitmap_cleanup cleanup_bitmap;
    auto test_center = bitmap_center(test_bitmap);
    REQUIRE(50.0 == test_center.x);
    REQUIRE(50.0 == test_center.y);
}
TEST_CASE_METHOD(TestGraphicsFixture, "bitmap_filename_integration") {
    auto test_bitmap = create_bitmap("Test Bitmap 57", 100, 100);
    bitmap_cleanup cleanup_bitmap;
    REQUIRE("" == bitmap_filename(test_bitmap));
}
TEST_CASE_METHOD(TestGraphicsFixture, "bitmap_height_integration") {
    auto test_bitmap = create_bitmap("Test Bitmap 58", 100, 100);
    bitmap_cleanup cleanup_bitmap;
    REQUIRE(100 == bitmap_height(test_bitmap));
}
TEST_CASE_METHOD(TestGraphicsFixture, "bitmap_height_of_bitmap_named_integration") {
    create_bitmap("Test Bitmap 59", 100, 100);
    bitmap_cleanup cleanup_bitmap;
    REQUIRE(100 == bitmap_height("Test Bitmap 59"));
}
TEST_CASE_METHOD(TestGraphicsFixture, "bitmap_name_integration") {
    auto test_bitmap = create_bitmap("Test Bitmap 60", 100, 100);
    bitmap_cleanup cleanup_bitmap;
    REQUIRE("Test Bitmap 60" == bitmap_name(test_bitmap));
}
TEST_CASE_METHOD(TestGraphicsFixture, "bitmap_named_integration") {
    create_bitmap("Test Bitmap 61", 100, 100);
    bitmap_cleanup cleanup_bitmap;
    REQUIRE(bitmap_named("Test Bitmap 61") != nullptr);
    REQUIRE(bitmap_named("nonexistent_bitmap") == nullptr);
}
TEST_CASE_METHOD(TestGraphicsFixture, "bitmap_rectangle_of_cell_integration") {
    auto test_bitmap = create_bitmap("Test Bitmap 62", 100, 100);
    bitmap_cleanup cleanup_bitmap;
    bitmap_set_cell_details(test_bitmap, 25, 25, 4, 4, 16);
    auto rect = bitmap_rectangle_of_cell(test_bitmap, 5);
    REQUIRE(25.0 == rect.x);
    REQUIRE(25.0 == rect.y);
    REQUIRE(25.0 == rect.width);
    REQUIRE(25.0 == rect.height);
}
TEST_CASE_METHOD(TestGraphicsFixture, "bitmap_set_cell_details_integration") {
    auto test_bitmap = create_bitmap("Test Bitmap 63", 100, 100);
    bitmap_cleanup cleanup_bitmap;
    bitmap_set_cell_details(test_bitmap, 20, 20, 5, 5, 25);
    REQUIRE(20 == bitmap_cell_width(test_bitmap));
    REQUIRE(20 == bitmap_cell_height(test_bitmap));
    REQUIRE(5 == bitmap_cell_columns(test_bitmap));
    REQUIRE(5 == bitmap_cell_rows(test_bitmap));
    REQUIRE(25 == bitmap_cell_count(test_bitmap));
}
TEST_CASE_METHOD(TestGraphicsFixture, "bitmap_valid_integration") {
    auto test_bitmap = create_bitmap("Test Bitmap 64", 100, 100);
    bitmap_cleanup cleanup_bitmap;
    REQUIRE(bitmap_valid(test_bitmap));
    free_bitmap(test_bitmap);
    REQUIRE_FALSE(bitmap_valid(test_bitmap));
}
TEST_CASE_METHOD(TestGraphicsFixture, "bitmap_width_integration") {
    auto test_bitmap = create_bitmap("Test Bitmap 65", 100, 100);
    bitmap_cleanup cleanup_bitmap;
    REQUIRE(100 == bitmap_width(test_bitmap));
}
TEST_CASE_METHOD(TestGraphicsFixture, "bitmap_width_of_bitmap_named_integration") {
    create_bitmap("Test Bitmap 66", 100, 100);
    bitmap_cleanup cleanup_bitmap;
    REQUIRE(100 == bitmap_width("Test Bitmap 66"));
}
TEST_CASE_METHOD(TestGraphicsFixture, "clear_bitmap_integration") {
    auto test_bitmap = create_bitmap("Test Bitmap 67", 100, 100);
    bitmap_cleanup cleanup_bitmap;
    draw_pixel_on_bitmap(test_bitmap, color_black(), 50.0, 50.0);
    REQUIRE(color_black() == get_pixel(test_bitmap, 50.0, 50.0));
    clear_bitmap(test_bitmap, color_white());
    REQUIRE(color_white() == get_pixel(test_bitmap, 50.0, 50.0));
}
TEST_CASE_METHOD(TestGraphicsFixture, "clear_bitmap_named_integration") {
    auto test_bitmap = create_bitmap("Test Bitmap 68", 100, 100);
    bitmap_cleanup cleanup_bitmap;
    fill_rectangle_on_bitmap(test_bitmap, color_red(), 0.0, 0.0, 100.0, 100.0);
    REQUIRE(color_red() == get_pixel(test_bitmap, 50.0, 50.0));
    clear_bitmap("Test Bitmap 68", color_white());
    REQUIRE(color_white() == get_pixel(test_bitmap, 50.0, 50.0));
}
TEST_CASE_METHOD(TestGraphicsFixture, "create_bitmap_integration") {
    auto test_bitmap = create_bitmap("Test Bitmap 69", 100, 100);
    bitmap_cleanup cleanup_bitmap;
    REQUIRE(test_bitmap != nullptr);
    REQUIRE(100 == bitmap_width(test_bitmap));
    REQUIRE(100 == bitmap_height(test_bitmap));
    REQUIRE("Test Bitmap 69" == bitmap_name(test_bitmap));
}
TEST_CASE_METHOD(TestGraphicsFixture, "draw_bitmap_integration") {
    auto test_window = open_window("Test Window 75", 800, 600);
    window_cleanup cleanup_window;
    auto test_bitmap = create_bitmap("Test Bitmap 70", 100, 100);
    bitmap_cleanup cleanup_bitmap;
    clear_window(test_window, color_white());
    fill_rectangle_on_bitmap(test_bitmap, color_red(), 0.0, 0.0, 50.0, 50.0);
    draw_bitmap(test_bitmap, 100.0, 100.0);
    refresh_screen();
    REQUIRE(color_red() == get_pixel(test_window, 125.0, 125.0));
    REQUIRE(color_white() == get_pixel(test_window, 175.0, 175.0));
    free_bitmap(test_bitmap);
}
TEST_CASE_METHOD(TestGraphicsFixture, "draw_bitmap_with_options_integration") {
    auto test_window = open_window("Test Window 76", 800, 600);
    window_cleanup cleanup_window;
    auto test_bitmap = create_bitmap("Test Bitmap 71", 100, 100);
    bitmap_cleanup cleanup_bitmap;
    clear_window(test_window, color_white());
    fill_rectangle_on_bitmap(test_bitmap, color_red(), 0.0, 0.0, 100.0, 100.0);
    draw_bitmap(test_bitmap, 100.0, 100.0, option_defaults());
    refresh_screen();
    REQUIRE(color_red() == get_pixel(test_window, 125.0, 125.0));
    REQUIRE(color_white() == get_pixel(test_window, 50.0, 50.0));
    free_bitmap(test_bitmap);
}
TEST_CASE_METHOD(TestGraphicsFixture, "draw_bitmap_named_integration") {
    auto test_window = open_window("Test Window 77", 800, 600);
    window_cleanup cleanup_window;
    auto test_bitmap = create_bitmap("Test Bitmap 72", 100, 100);
    bitmap_cleanup cleanup_bitmap;
    clear_window(test_window, color_white());
    fill_rectangle_on_bitmap(test_bitmap, color_red(), 0.0, 0.0, 100.0, 100.0);
    draw_bitmap("Test Bitmap 72", 100.0, 100.0);
    refresh_screen();
    REQUIRE(color_red() == get_pixel(test_window, 125.0, 125.0));
    REQUIRE(color_white() == get_pixel(test_window, 50.0, 50.0));
    free_bitmap(test_bitmap);
}
TEST_CASE_METHOD(TestGraphicsFixture, "draw_bitmap_named_with_options_integration") {
    auto test_window = open_window("Test Window 78", 800, 600);
    window_cleanup cleanup_window;
    auto test_bitmap = create_bitmap("Test Bitmap 73", 100, 100);
    bitmap_cleanup cleanup_bitmap;
    clear_window(test_window, color_white());
    fill_rectangle_on_bitmap(test_bitmap, color_red(), 0.0, 0.0, 100.0, 100.0);
    draw_bitmap("Test Bitmap 73", 100.0, 100.0, option_defaults());
    refresh_screen();
    REQUIRE(color_red() == get_pixel(test_window, 125.0, 125.0));
    REQUIRE(color_white() == get_pixel(test_window, 50.0, 50.0));
    free_bitmap(test_bitmap);
}
TEST_CASE_METHOD(TestGraphicsFixture, "draw_bitmap_on_bitmap_on_bitmap_integration") {
    auto dest_bitmap = create_bitmap("Test Bitmap 74", 100, 100);
    bitmap_cleanup cleanup_bitmap;
    auto source_bitmap = create_bitmap("Test Bitmap 75", 50, 50);
    clear_bitmap(dest_bitmap, color_white());
    fill_rectangle_on_bitmap(source_bitmap, color_red(), 0.0, 0.0, 50.0, 50.0);
    draw_bitmap_on_bitmap(dest_bitmap, source_bitmap, 25.0, 25.0);
    REQUIRE(color_red() == get_pixel(dest_bitmap, 50.0, 50.0));
    REQUIRE(color_white() == get_pixel(dest_bitmap, 10.0, 10.0));
}
TEST_CASE_METHOD(TestGraphicsFixture, "draw_bitmap_on_bitmap_on_bitmap_with_options_integration") {
    auto dest_bitmap = create_bitmap("Test Bitmap 76", 100, 100);
    bitmap_cleanup cleanup_bitmap;
    auto source_bitmap = create_bitmap("Test Bitmap 77", 50, 50);
    clear_bitmap(dest_bitmap, color_white());
    fill_rectangle_on_bitmap(source_bitmap, color_red(), 0.0, 0.0, 50.0, 50.0);
    draw_bitmap_on_bitmap(dest_bitmap, source_bitmap, 25.0, 25.0, option_defaults());
    REQUIRE(color_red() == get_pixel(dest_bitmap, 50.0, 50.0));
    REQUIRE(color_white() == get_pixel(dest_bitmap, 10.0, 10.0));
}
TEST_CASE_METHOD(TestGraphicsFixture, "draw_bitmap_on_window_integration") {
    auto test_window = open_window("Test Window 79", 800, 600);
    window_cleanup cleanup_window;
    auto test_bitmap = create_bitmap("Test Bitmap 78", 100, 100);
    bitmap_cleanup cleanup_bitmap;
    clear_window(test_window, color_white());
    fill_rectangle_on_bitmap(test_bitmap, color_red(), 0.0, 0.0, 100.0, 100.0);
    draw_bitmap_on_window(test_window, test_bitmap, 100.0, 100.0);
    refresh_screen();
    REQUIRE(color_red() == get_pixel(test_window, 125.0, 125.0));
    REQUIRE(color_white() == get_pixel(test_window, 50.0, 50.0));
    free_bitmap(test_bitmap);
}
TEST_CASE_METHOD(TestGraphicsFixture, "draw_bitmap_on_window_with_options_integration") {
    auto test_window = open_window("Test Window 80", 800, 600);
    window_cleanup cleanup_window;
    auto test_bitmap = create_bitmap("Test Bitmap 79", 100, 100);
    bitmap_cleanup cleanup_bitmap;
    clear_window(test_window, color_white());
    fill_rectangle_on_bitmap(test_bitmap, color_red(), 0.0, 0.0, 100.0, 100.0);
    draw_bitmap_on_window(test_window, test_bitmap, 100.0, 100.0, option_defaults());
    refresh_screen();
    REQUIRE(color_red() == get_pixel(test_window, 125.0, 125.0));
    REQUIRE(color_white() == get_pixel(test_window, 50.0, 50.0));
    free_bitmap(test_bitmap);
}
TEST_CASE_METHOD(TestGraphicsFixture, "free_all_bitmaps_integration") {
    auto bitmap1 = create_bitmap("Test Bitmap 80", 100, 100);
    bitmap_cleanup cleanup_bitmap;
    auto bitmap2 = create_bitmap("Test Bitmap 81", 100, 100);
    REQUIRE(bitmap_valid(bitmap1));
    REQUIRE(bitmap_valid(bitmap2));
    free_all_bitmaps();
    REQUIRE_FALSE(bitmap_valid(bitmap1));
    REQUIRE_FALSE(bitmap_valid(bitmap2));
}
TEST_CASE_METHOD(TestGraphicsFixture, "free_bitmap_integration") {
    auto test_bitmap = create_bitmap("Test Bitmap 82", 100, 100);
    bitmap_cleanup cleanup_bitmap;
    REQUIRE(bitmap_valid(test_bitmap));
    free_bitmap(test_bitmap);
    REQUIRE_FALSE(bitmap_valid(test_bitmap));
}
TEST_CASE_METHOD(TestGraphicsFixture, "has_bitmap_integration") {
    auto test_bitmap = create_bitmap("Test Bitmap 83", 100, 100);
    bitmap_cleanup cleanup_bitmap;
    REQUIRE(has_bitmap("Test Bitmap 83"));
    free_bitmap(test_bitmap);
    REQUIRE_FALSE(has_bitmap("Test Bitmap 83"));
}
TEST_CASE_METHOD(TestGraphicsFixture, "load_bitmap_integration") {
    auto loaded_bitmap = load_bitmap("Test Bitmap 84", "frog.png");
    bitmap_cleanup cleanup_bitmap;
    REQUIRE(color_white() != get_pixel(loaded_bitmap, 50.0, 50.0));
}
TEST_CASE_METHOD(TestGraphicsFixture, "pixel_drawn_at_point_pt_integration") {
    auto test_bitmap = create_bitmap("Test Bitmap 85", 100, 100);
    bitmap_cleanup cleanup_bitmap;
    clear_bitmap(test_bitmap, color_white());
    draw_pixel_on_bitmap(test_bitmap, color_black(), point_at(50.0, 50.0));
    REQUIRE(color_black() == get_pixel(test_bitmap, 50.0, 50.0));
    REQUIRE(color_white() == get_pixel(test_bitmap, 75.0, 75.0));
}
TEST_CASE_METHOD(TestGraphicsFixture, "pixel_drawn_at_point_integration") {
    auto test_bitmap = create_bitmap("Test Bitmap 86", 100, 100);
    bitmap_cleanup cleanup_bitmap;
    clear_bitmap(test_bitmap, color_white());
    draw_pixel_on_bitmap(test_bitmap, color_black(), 50.0, 50.0);
    REQUIRE(color_black() == get_pixel(test_bitmap, 50.0, 50.0));
    REQUIRE(color_white() == get_pixel(test_bitmap, 75.0, 75.0));
}
TEST_CASE_METHOD(TestGraphicsFixture, "pixel_drawn_at_point_in_cell_pt_integration") {
    auto test_bitmap = create_bitmap("Test Bitmap 87", 100, 100);
    bitmap_cleanup cleanup_bitmap;
    clear_bitmap(test_bitmap, color_white());
    draw_pixel_on_bitmap(test_bitmap, color_black(), point_at(50.0, 50.0));
    bitmap_set_cell_details(test_bitmap, 100, 100, 1, 1, 1);
    REQUIRE(color_black() == get_pixel(test_bitmap, 50.0, 50.0));
    REQUIRE(color_white() == get_pixel(test_bitmap, 75.0, 50.0));
}
TEST_CASE_METHOD(TestGraphicsFixture, "pixel_drawn_at_point_in_cell_integration") {
    auto test_bitmap = create_bitmap("Test Bitmap 88", 100, 100);
    bitmap_cleanup cleanup_bitmap;
    clear_bitmap(test_bitmap, color_white());
    draw_pixel_on_bitmap(test_bitmap, color_black(), point_at(50.0, 50.0));
    bitmap_set_cell_details(test_bitmap, 100, 100, 1, 1, 1);
    REQUIRE(color_black() == get_pixel(test_bitmap, 50.0, 50.0));
    REQUIRE(color_white() == get_pixel(test_bitmap, 75.0, 75.0));
}
TEST_CASE_METHOD(TestGraphicsFixture, "setup_collision_mask_integration") {
    open_window("Test Window 81", 800, 600);
    window_cleanup cleanup_window;
    auto test_bitmap = create_bitmap("Test Bitmap 89", 100, 100);
    bitmap_cleanup cleanup_bitmap;
    clear_bitmap(test_bitmap, color_black());
    auto test_circle = circle_at(120.0, 120.0, 30.0);
    auto collision_before_mask = bitmap_circle_collision(test_bitmap, 100.0, 100.0, test_circle);
    setup_collision_mask(test_bitmap);
    auto collision_after_mask = bitmap_circle_collision(test_bitmap, 100.0, 100.0, test_circle);
    REQUIRE_FALSE(collision_before_mask);
    REQUIRE(collision_after_mask);
}
TEST_CASE_METHOD(TestGraphicsFixture, "draw_line_record_integration") {
    auto test_window = open_window("Test Window 82", 800, 600);
    window_cleanup cleanup_window;
    clear_window(test_window, color_white());
    draw_line(color_black(), line_from(point_at(100.0, 100.0), point_at(200.0, 200.0)));
    refresh_screen();
    REQUIRE(color_black() == get_pixel(test_window, 100.0, 100.0));
    REQUIRE(color_white() == get_pixel(test_window, 99.0, 99.0));
}
TEST_CASE_METHOD(TestGraphicsFixture, "draw_line_record_with_options_integration") {
    auto test_window = open_window("Test Window 83", 800, 600);
    window_cleanup cleanup_window;
    clear_window(test_window, color_white());
    draw_line(color_black(), line_from(point_at(100.0, 100.0), point_at(200.0, 200.0)), option_line_width(3, option_defaults()));
    refresh_screen();
    REQUIRE(color_black() == get_pixel(test_window, 100.0, 100.0));
    REQUIRE(color_white() == get_pixel(test_window, 99.0, 99.0));
}
TEST_CASE_METHOD(TestGraphicsFixture, "draw_line_point_to_point_integration") {
    auto test_window = open_window("Test Window 84", 800, 600);
    window_cleanup cleanup_window;
    clear_window(test_window, color_white());
    draw_line(color_black(), point_at(100.0, 100.0), point_at(200.0, 200.0));
    refresh_screen();
    REQUIRE(color_black() == get_pixel(test_window, 100.0, 100.0));
    REQUIRE(color_white() == get_pixel(test_window, 99.0, 99.0));
}
TEST_CASE_METHOD(TestGraphicsFixture, "draw_line_point_to_point_with_options_integration") {
    auto test_window = open_window("Test Window 85", 800, 600);
    window_cleanup cleanup_window;
    clear_window(test_window, color_white());
    draw_line(color_black(), point_at(100.0, 100.0), point_at(200.0, 200.0), option_defaults());
    refresh_screen();
    REQUIRE(color_black() == get_pixel(test_window, 100.0, 100.0));
    REQUIRE(color_white() == get_pixel(test_window, 99.0, 99.0));
}
TEST_CASE_METHOD(TestGraphicsFixture, "draw_line_integration") {
    auto test_window = open_window("Test Window 86", 800, 600);
    window_cleanup cleanup_window;
    clear_window(test_window, color_white());
    draw_line(color_black(), 100.0, 100.0, 200.0, 200.0);
    refresh_screen();
    REQUIRE(color_black() == get_pixel(test_window, 100.0, 100.0));
    REQUIRE(color_white() == get_pixel(test_window, 99.0, 99.0));
}
TEST_CASE_METHOD(TestGraphicsFixture, "draw_line_with_options_integration") {
    auto test_window = open_window("Test Window 87", 800, 600);
    window_cleanup cleanup_window;
    clear_window(test_window, color_white());
    draw_line(color_black(), 100.0, 100.0, 200.0, 200.0, option_defaults());
    refresh_screen();
    REQUIRE(color_black() == get_pixel(test_window, 100.0, 100.0));
    REQUIRE(color_white() == get_pixel(test_window, 99.0, 99.0));
}
TEST_CASE_METHOD(TestGraphicsFixture, "draw_line_on_bitmap_record_integration") {
    auto test_bitmap = create_bitmap("Test Bitmap 90", 100, 100);
    bitmap_cleanup cleanup_bitmap;
    clear_bitmap(test_bitmap, color_white());
    draw_line_on_bitmap(test_bitmap, color_black(), line_from(point_at(10.0, 10.0), point_at(90.0, 90.0)));
    REQUIRE(color_black() == get_pixel(test_bitmap, 50.0, 50.0));
    REQUIRE(color_white() == get_pixel(test_bitmap, 95.0, 95.0));
}
TEST_CASE_METHOD(TestGraphicsFixture, "draw_line_on_bitmap_record_with_options_integration") {
    auto test_bitmap = create_bitmap("Test Bitmap 91", 100, 100);
    bitmap_cleanup cleanup_bitmap;
    clear_bitmap(test_bitmap, color_white());
    draw_line_on_bitmap(test_bitmap, color_black(), line_from(point_at(10.0, 10.0), point_at(90.0, 90.0)), option_defaults());
    REQUIRE(color_black() == get_pixel(test_bitmap, 50.0, 50.0));
    REQUIRE(color_white() == get_pixel(test_bitmap, 95.0, 50.0));
}
TEST_CASE_METHOD(TestGraphicsFixture, "draw_line_on_bitmap_point_to_point_integration") {
    auto test_bitmap = create_bitmap("Test Bitmap 92", 100, 100);
    bitmap_cleanup cleanup_bitmap;
    clear_bitmap(test_bitmap, color_white());
    draw_line_on_bitmap(test_bitmap, color_black(), point_at(10.0, 10.0), point_at(90.0, 90.0));
    REQUIRE(color_black() == get_pixel(test_bitmap, 50.0, 50.0));
    REQUIRE(color_white() == get_pixel(test_bitmap, 0.0, 0.0));
}
TEST_CASE_METHOD(TestGraphicsFixture, "draw_line_on_bitmap_point_to_point_with_options_integration") {
    auto test_bitmap = create_bitmap("Test Bitmap 93", 100, 100);
    bitmap_cleanup cleanup_bitmap;
    clear_bitmap(test_bitmap, color_white());
    draw_line_on_bitmap(test_bitmap, color_black(), point_at(10.0, 10.0), point_at(90.0, 90.0), option_defaults());
    REQUIRE(color_black() == get_pixel(test_bitmap, 10.0, 10.0));
    REQUIRE(color_black() == get_pixel(test_bitmap, 90.0, 90.0));
    REQUIRE(color_white() == get_pixel(test_bitmap, 5.0, 5.0));
}
TEST_CASE_METHOD(TestGraphicsFixture, "draw_line_on_bitmap_integration") {
    auto test_bitmap = create_bitmap("Test Bitmap 94", 100, 100);
    bitmap_cleanup cleanup_bitmap;
    clear_bitmap(test_bitmap, color_white());
    draw_line_on_bitmap(test_bitmap, color_black(), 10.0, 10.0, 90.0, 90.0);
    REQUIRE(color_black() == get_pixel(test_bitmap, 50.0, 50.0));
    REQUIRE(color_white() == get_pixel(test_bitmap, 95.0, 50.0));
}
TEST_CASE_METHOD(TestGraphicsFixture, "draw_line_on_bitmap_with_options_integration") {
    auto test_bitmap = create_bitmap("Test Bitmap 95", 100, 100);
    bitmap_cleanup cleanup_bitmap;
    clear_bitmap(test_bitmap, color_white());
    draw_line_on_bitmap(test_bitmap, color_black(), 10.0, 10.0, 90.0, 90.0, option_defaults());
    REQUIRE(color_black() == get_pixel(test_bitmap, 50.0, 50.0));
    REQUIRE(color_white() == get_pixel(test_bitmap, 5.0, 5.0));
}
TEST_CASE_METHOD(TestGraphicsFixture, "draw_line_on_window_record_integration") {
    auto test_window = open_window("Test Window 88", 800, 600);
    window_cleanup cleanup_window;
    clear_window(test_window, color_white());
    auto test_line = line_from(point_at(100.0, 100.0), point_at(150.0, 150.0));
    draw_line_on_window(test_window, color_black(), test_line);
    refresh_screen();
    REQUIRE(color_black() == get_pixel(test_window, 100.0, 100.0));
    REQUIRE(color_white() == get_pixel(test_window, 99.0, 99.0));
}
TEST_CASE_METHOD(TestGraphicsFixture, "draw_line_on_window_record_with_options_integration") {
    auto test_window = open_window("Test Window 89", 800, 600);
    window_cleanup cleanup_window;
    clear_window(test_window, color_white());
    auto test_line = line_from(point_at(100.0, 100.0), point_at(150.0, 150.0));
    draw_line_on_window(test_window, color_black(), test_line, option_defaults());
    refresh_screen();
    REQUIRE(color_black() == get_pixel(test_window, 100.0, 100.0));
    REQUIRE(color_white() == get_pixel(test_window, 99.0, 99.0));
}
TEST_CASE_METHOD(TestGraphicsFixture, "draw_line_on_window_point_to_point_integration") {
    auto test_window = open_window("Test Window 90", 800, 600);
    window_cleanup cleanup_window;
    clear_window(test_window, color_white());
    draw_line_on_window(test_window, color_black(), point_at(100.0, 100.0), point_at(200.0, 200.0));
    refresh_screen();
    REQUIRE(color_black() == get_pixel(test_window, 100.0, 100.0));
    REQUIRE(color_white() == get_pixel(test_window, 99.0, 99.0));
}
TEST_CASE_METHOD(TestGraphicsFixture, "draw_line_on_window_point_to_point_with_options_integration") {
    auto test_window = open_window("Test Window 91", 800, 600);
    window_cleanup cleanup_window;
    clear_window(test_window, color_white());
    draw_line_on_window(test_window, color_black(), point_at(100.0, 100.0), point_at(200.0, 200.0), option_defaults());
    refresh_screen();
    REQUIRE(color_black() == get_pixel(test_window, 100.0, 100.0));
    REQUIRE(color_white() == get_pixel(test_window, 99.0, 99.0));
}
TEST_CASE_METHOD(TestGraphicsFixture, "draw_line_on_window_integration") {
    auto test_window = open_window("Test Window 92", 800, 600);
    window_cleanup cleanup_window;
    clear_window(test_window, color_white());
    draw_line_on_window(test_window, color_black(), 100.0, 100.0, 200.0, 200.0);
    refresh_screen();
    REQUIRE(color_black() == get_pixel(test_window, 100.0, 100.0));
    REQUIRE(color_white() == get_pixel(test_window, 99.0, 99.0));
}
TEST_CASE_METHOD(TestGraphicsFixture, "draw_line_on_window_with_options_integration") {
    auto test_window = open_window("Test Window 93", 800, 600);
    window_cleanup cleanup_window;
    clear_window(test_window, color_white());
    draw_line_on_window(test_window, color_black(), 100.0, 100.0, 200.0, 200.0, option_defaults());
    refresh_screen();
    REQUIRE(color_black() == get_pixel(test_window, 100.0, 100.0));
    REQUIRE(color_white() == get_pixel(test_window, 99.0, 99.0));
}
TEST_CASE_METHOD(TestGraphicsFixture, "draw_pixel_at_point_integration") {
    auto test_window = open_window("Test Window 94", 800, 600);
    window_cleanup cleanup_window;
    clear_window(test_window, color_white());
    draw_pixel(color_black(), point_at(100.0, 100.0));
    refresh_screen();
    REQUIRE(color_black() == get_pixel(test_window, 100.0, 100.0));
    REQUIRE(color_white() == get_pixel(test_window, 99.0, 99.0));
}
TEST_CASE_METHOD(TestGraphicsFixture, "draw_pixel_at_point_with_options_integration") {
    auto test_window = open_window("Test Window 95", 800, 600);
    window_cleanup cleanup_window;
    clear_window(test_window, color_white());
    draw_pixel(color_black(), point_at(100.0, 100.0), option_defaults());
    refresh_screen();
    REQUIRE(color_black() == get_pixel(test_window, 100.0, 100.0));
    REQUIRE(color_white() == get_pixel(test_window, 99.0, 99.0));
}
TEST_CASE_METHOD(TestGraphicsFixture, "draw_pixel_integration") {
    auto test_window = open_window("Test Window 96", 800, 600);
    window_cleanup cleanup_window;
    clear_window(test_window, color_white());
    draw_pixel(color_black(), 100.0, 100.0);
    refresh_screen();
    REQUIRE(color_black() == get_pixel(test_window, 100.0, 100.0));
    REQUIRE(color_white() == get_pixel(test_window, 99.0, 99.0));
}
TEST_CASE_METHOD(TestGraphicsFixture, "draw_pixel_with_options_integration") {
    auto test_window = open_window("Test Window 97", 800, 600);
    window_cleanup cleanup_window;
    clear_window(test_window, color_white());
    draw_pixel(color_black(), 100.0, 100.0, option_defaults());
    refresh_screen();
    REQUIRE(color_black() == get_pixel(test_window, 100.0, 100.0));
    REQUIRE(color_white() == get_pixel(test_window, 99.0, 99.0));
}
TEST_CASE_METHOD(TestGraphicsFixture, "draw_pixel_on_bitmap_at_point_integration") {
    auto test_bitmap = create_bitmap("Test Bitmap 96", 100, 100);
    bitmap_cleanup cleanup_bitmap;
    clear_bitmap(test_bitmap, color_white());
    draw_pixel_on_bitmap(test_bitmap, color_black(), point_at(50.0, 50.0));
    REQUIRE(color_black() == get_pixel(test_bitmap, 50.0, 50.0));
    REQUIRE(color_white() == get_pixel(test_bitmap, 0.0, 0.0));
}
TEST_CASE_METHOD(TestGraphicsFixture, "draw_pixel_on_bitmap_at_point_with_options_integration") {
    auto test_bitmap = create_bitmap("Test Bitmap 97", 100, 100);
    bitmap_cleanup cleanup_bitmap;
    clear_bitmap(test_bitmap, color_white());
    draw_pixel_on_bitmap(test_bitmap, color_black(), point_at(50.0, 50.0), option_defaults());
    REQUIRE(color_black() == get_pixel(test_bitmap, 50.0, 50.0));
    REQUIRE(color_white() == get_pixel(test_bitmap, 0.0, 0.0));
}
TEST_CASE_METHOD(TestGraphicsFixture, "draw_pixel_on_bitmap_integration") {
    auto test_bitmap = create_bitmap("Test Bitmap 98", 100, 100);
    bitmap_cleanup cleanup_bitmap;
    clear_bitmap(test_bitmap, color_white());
    draw_pixel_on_bitmap(test_bitmap, color_black(), 50.0, 50.0);
    REQUIRE(color_black() == get_pixel(test_bitmap, 50.0, 50.0));
    REQUIRE(color_white() == get_pixel(test_bitmap, 51.0, 50.0));
}
TEST_CASE_METHOD(TestGraphicsFixture, "draw_pixel_on_bitmap_with_options_integration") {
    auto test_bitmap = create_bitmap("Test Bitmap 99", 100, 100);
    bitmap_cleanup cleanup_bitmap;
    clear_bitmap(test_bitmap, color_white());
    draw_pixel_on_bitmap(test_bitmap, color_black(), 50.0, 50.0, option_defaults());
    REQUIRE(color_black() == get_pixel(test_bitmap, 50.0, 50.0));
    REQUIRE(color_white() == get_pixel(test_bitmap, 51.0, 50.0));
}
TEST_CASE_METHOD(TestGraphicsFixture, "draw_pixel_on_window_at_point_integration") {
    auto test_window = open_window("Test Window 98", 800, 600);
    window_cleanup cleanup_window;
    clear_window(test_window, color_white());
    draw_pixel_on_window(test_window, color_black(), point_at(100.0, 100.0));
    refresh_screen();
    REQUIRE(color_black() == get_pixel(test_window, 100.0, 100.0));
    REQUIRE(color_white() == get_pixel(test_window, 99.0, 99.0));
}
TEST_CASE_METHOD(TestGraphicsFixture, "draw_pixel_on_window_at_point_with_options_integration") {
    auto test_window = open_window("Test Window 99", 800, 600);
    window_cleanup cleanup_window;
    clear_window(test_window, color_white());
    draw_pixel_on_window(test_window, color_black(), point_at(100.0, 100.0), option_defaults());
    refresh_screen();
    REQUIRE(color_black() == get_pixel(test_window, 100.0, 100.0));
    REQUIRE(color_white() == get_pixel(test_window, 99.0, 99.0));
}
TEST_CASE_METHOD(TestGraphicsFixture, "draw_pixel_on_window_integration") {
    auto test_window = open_window("Test Window 100", 800, 600);
    window_cleanup cleanup_window;
    clear_window(test_window, color_white());
    draw_pixel_on_window(test_window, color_black(), 100.0, 100.0);
    refresh_screen();
    REQUIRE(color_black() == get_pixel(test_window, 100.0, 100.0));
    REQUIRE(color_white() == get_pixel(test_window, 99.0, 99.0));
}
TEST_CASE_METHOD(TestGraphicsFixture, "draw_pixel_on_window_with_options_integration") {
    auto test_window = open_window("Test Window 101", 800, 600);
    window_cleanup cleanup_window;
    clear_window(test_window, color_white());
    draw_pixel_on_window(test_window, color_black(), 100.0, 100.0, option_defaults());
    refresh_screen();
    REQUIRE(color_black() == get_pixel(test_window, 100.0, 100.0));
    REQUIRE(color_white() == get_pixel(test_window, 99.0, 99.0));
}
TEST_CASE_METHOD(TestGraphicsFixture, "get_pixel_from_bitmap_at_point_integration") {
    auto test_bitmap = create_bitmap("Test Bitmap 100", 100, 100);
    bitmap_cleanup cleanup_bitmap;
    clear_bitmap(test_bitmap, color_white());
    draw_pixel_on_bitmap(test_bitmap, color_black(), point_at(50.0, 50.0));
    REQUIRE(color_black() == get_pixel(test_bitmap, point_at(50.0, 50.0)));
    REQUIRE(color_white() == get_pixel(test_bitmap, point_at(49.0, 49.0)));
}
TEST_CASE_METHOD(TestGraphicsFixture, "get_pixel_from_bitmap_integration") {
    auto test_bitmap = create_bitmap("Test Bitmap 101", 100, 100);
    bitmap_cleanup cleanup_bitmap;
    clear_bitmap(test_bitmap, color_white());
    draw_pixel_on_bitmap(test_bitmap, color_black(), 50.0, 50.0);
    REQUIRE(color_black() == get_pixel(test_bitmap, 50.0, 50.0));
    REQUIRE(color_white() == get_pixel(test_bitmap, 49.0, 49.0));
}
TEST_CASE_METHOD(TestGraphicsFixture, "get_pixel_at_point_integration") {
    auto test_window = open_window("Test Window 102", 800, 600);
    window_cleanup cleanup_window;
    clear_window(test_window, color_white());
    draw_pixel(color_black(), point_at(100.0, 100.0));
    refresh_screen();
    REQUIRE(color_black() == get_pixel(test_window, 100.0, 100.0));
    REQUIRE(color_white() == get_pixel(test_window, 99.0, 99.0));
}
TEST_CASE_METHOD(TestGraphicsFixture, "get_pixel_integration") {
    auto test_window = open_window("Test Window 103", 800, 600);
    window_cleanup cleanup_window;
    clear_window(test_window, color_white());
    draw_pixel(color_black(), 100.0, 100.0);
    refresh_screen();
    REQUIRE(color_black() == get_pixel(test_window, 100.0, 100.0));
    REQUIRE(color_white() == get_pixel(test_window, 99.0, 99.0));
}
TEST_CASE_METHOD(TestGraphicsFixture, "get_pixel_from_window_at_point_integration") {
    auto test_window = open_window("Test Window 104", 800, 600);
    window_cleanup cleanup_window;
    clear_window(test_window, color_white());
    draw_pixel(color_black(), point_at(100.0, 100.0));
    refresh_screen();
    REQUIRE(color_black() == get_pixel(test_window, point_at(100.0, 100.0)));
    REQUIRE(color_white() == get_pixel(test_window, point_at(99.0, 99.0)));
}
TEST_CASE_METHOD(TestGraphicsFixture, "get_pixel_from_window_integration") {
    auto test_window = open_window("Test Window 105", 800, 600);
    window_cleanup cleanup_window;
    clear_window(test_window, color_white());
    draw_pixel(color_black(), 100.0, 100.0);
    refresh_screen();
    REQUIRE(color_black() == get_pixel(test_window, 100.0, 100.0));
    REQUIRE(color_white() == get_pixel(test_window, 99.0, 99.0));
}
TEST_CASE_METHOD(TestGraphicsFixture, "get_pixel_from_window_at_point_from_window_integration") {
    auto test_window = open_window("Test Window 106", 800, 600);
    window_cleanup cleanup_window;
    clear_window(test_window, color_white());
    draw_pixel(color_black(), point_at(100.0, 100.0));
    refresh_screen();
    REQUIRE(color_black() == get_pixel_from_window(test_window, point_at(100.0, 100.0)));
    REQUIRE(color_white() == get_pixel_from_window(test_window, point_at(99.0, 99.0)));
}
TEST_CASE_METHOD(TestGraphicsFixture, "get_pixel_from_window_from_window_integration") {
    auto test_window = open_window("Test Window 107", 800, 600);
    window_cleanup cleanup_window;
    clear_window(test_window, color_white());
    draw_pixel(color_black(), 100.0, 100.0);
    refresh_screen();
    REQUIRE(color_black() == get_pixel_from_window(test_window, 100.0, 100.0));
    REQUIRE(color_white() == get_pixel_from_window(test_window, 99.0, 99.0));
}
TEST_CASE_METHOD(TestGraphicsFixture, "draw_quad_integration") {
    auto test_window = open_window("Test Window 108", 800, 600);
    window_cleanup cleanup_window;
    clear_window(test_window, color_white());
    auto quad = quad_from(point_at(100.0, 100.0), point_at(200.0, 100.0), point_at(100.0, 200.0), point_at(200.0, 200.0));
    draw_quad(color_black(), quad);
    refresh_screen();
    REQUIRE(color_black() == get_pixel(test_window, 100.0, 100.0));
    REQUIRE(color_white() == get_pixel(test_window, 150.0, 150.0));
    REQUIRE(color_white() == get_pixel(test_window, 250.0, 250.0));
}
TEST_CASE_METHOD(TestGraphicsFixture, "draw_quad_with_options_integration") {
    auto test_window = open_window("Test Window 109", 800, 600);
    window_cleanup cleanup_window;
    clear_window(test_window, color_white());
    auto quad = quad_from(point_at(100.0, 100.0), point_at(200.0, 100.0), point_at(100.0, 200.0), point_at(200.0, 200.0));
    draw_quad(color_black(), quad, option_defaults());
    refresh_screen();
    REQUIRE(color_black() == get_pixel(test_window, 100.0, 100.0));
    REQUIRE(color_white() == get_pixel(test_window, 150.0, 150.0));
    REQUIRE(color_white() == get_pixel(test_window, 250.0, 250.0));
}
TEST_CASE_METHOD(TestGraphicsFixture, "draw_quad_on_bitmap_integration") {
    auto test_bitmap = create_bitmap("Test Bitmap 102", 100, 100);
    bitmap_cleanup cleanup_bitmap;
    clear_bitmap(test_bitmap, color_white());
    auto quad = quad_from(point_at(10.0, 10.0), point_at(90.0, 10.0), point_at(10.0, 90.0), point_at(90.0, 90.0));
    draw_quad_on_bitmap(test_bitmap, color_black(), quad);
    REQUIRE(color_black() == get_pixel(test_bitmap, 10.0, 10.0));
    REQUIRE(color_white() == get_pixel(test_bitmap, 50.0, 50.0));
    REQUIRE(color_white() == get_pixel(test_bitmap, 5.0, 5.0));
}
TEST_CASE_METHOD(TestGraphicsFixture, "draw_quad_on_bitmap_with_options_integration") {
    auto test_bitmap = create_bitmap("Test Bitmap 103", 100, 100);
    bitmap_cleanup cleanup_bitmap;
    clear_bitmap(test_bitmap, color_white());
    auto quad = quad_from(point_at(10.0, 10.0), point_at(90.0, 10.0), point_at(90.0, 90.0), point_at(10.0, 90.0));
    draw_quad_on_bitmap(test_bitmap, color_black(), quad, option_defaults());
    REQUIRE(color_black() == get_pixel(test_bitmap, 10.0, 10.0));
    REQUIRE(color_black() == get_pixel(test_bitmap, 50.0, 50.0));
    REQUIRE(color_white() == get_pixel(test_bitmap, 5.0, 5.0));
}
TEST_CASE_METHOD(TestGraphicsFixture, "draw_quad_on_window_integration") {
    auto test_window = open_window("Test Window 110", 800, 600);
    window_cleanup cleanup_window;
    clear_window(test_window, color_white());
    auto quad = quad_from(point_at(100.0, 100.0), point_at(200.0, 100.0), point_at(100.0, 200.0), point_at(200.0, 200.0));
    draw_quad_on_window(test_window, color_black(), quad);
    refresh_screen();
    REQUIRE(color_black() == get_pixel(test_window, 100.0, 100.0));
    REQUIRE(color_white() == get_pixel(test_window, 150.0, 150.0));
    REQUIRE(color_white() == get_pixel(test_window, 250.0, 250.0));
}
TEST_CASE_METHOD(TestGraphicsFixture, "draw_quad_on_window_with_options_integration") {
    auto test_window = open_window("Test Window 111", 800, 600);
    window_cleanup cleanup_window;
    clear_window(test_window, color_white());
    auto quad = quad_from(point_at(100.0, 100.0), point_at(200.0, 100.0), point_at(100.0, 200.0), point_at(200.0, 200.0));
    draw_quad_on_window(test_window, color_black(), quad, option_defaults());
    refresh_screen();
    REQUIRE(color_black() == get_pixel(test_window, 100.0, 100.0));
    REQUIRE(color_white() == get_pixel(test_window, 150.0, 150.0));
    REQUIRE(color_white() == get_pixel(test_window, 250.0, 250.0));
}
TEST_CASE_METHOD(TestGraphicsFixture, "draw_rectangle_record_integration") {
    auto test_window = open_window("Test Window 112", 800, 600);
    window_cleanup cleanup_window;
    clear_window(test_window, color_white());
    auto rectangle = rectangle_from(100.0, 100.0, 200.0, 150.0);
    draw_rectangle(color_black(), rectangle);
    refresh_screen();
    REQUIRE(color_black() == get_pixel(test_window, 100.0, 100.0));
    REQUIRE(color_white() == get_pixel(test_window, 150.0, 125.0));
    REQUIRE(color_white() == get_pixel(test_window, 301.0, 251.0));
}
TEST_CASE_METHOD(TestGraphicsFixture, "draw_rectangle_record_with_options_integration") {
    auto test_window = open_window("Test Window 113", 800, 600);
    window_cleanup cleanup_window;
    clear_window(test_window, color_white());
    auto rectangle = rectangle_from(100.0, 100.0, 200.0, 150.0);
    draw_rectangle(color_black(), rectangle, option_defaults());
    refresh_screen();
    REQUIRE(color_black() == get_pixel(test_window, 100.0, 100.0));
    REQUIRE(color_white() == get_pixel(test_window, 150.0, 125.0));
    REQUIRE(color_white() == get_pixel(test_window, 350.0, 300.0));
}
TEST_CASE_METHOD(TestGraphicsFixture, "draw_rectangle_integration") {
    auto test_window = open_window("Test Window 114", 800, 600);
    window_cleanup cleanup_window;
    clear_window(test_window, color_white());
    draw_rectangle(color_black(), 100.0, 100.0, 200.0, 150.0);
    refresh_screen();
    REQUIRE(color_black() == get_pixel(test_window, 100.0, 100.0));
    REQUIRE(color_white() == get_pixel(test_window, 301.0, 251.0));
}
TEST_CASE_METHOD(TestGraphicsFixture, "draw_rectangle_with_options_integration") {
    auto test_window = open_window("Test Window 115", 800, 600);
    window_cleanup cleanup_window;
    clear_window(test_window, color_white());
    draw_rectangle(color_black(), 100.0, 100.0, 200.0, 150.0, option_line_width(3, option_defaults()));
    refresh_screen();
    REQUIRE(color_black() == get_pixel(test_window, 100.0, 100.0));
    REQUIRE(color_black() == get_pixel(test_window, 101.0, 100.0));
    REQUIRE(color_white() == get_pixel(test_window, 150.0, 125.0));
    REQUIRE(color_white() == get_pixel(test_window, 301.0, 251.0));
}
TEST_CASE_METHOD(TestGraphicsFixture, "draw_rectangle_on_bitmap_record_integration") {
    auto test_bitmap = create_bitmap("Test Bitmap 104", 100, 100);
    bitmap_cleanup cleanup_bitmap;
    clear_bitmap(test_bitmap, color_white());
    auto rectangle = rectangle_from(50.0, 50.0, 20.0, 30.0);
    draw_rectangle_on_bitmap(test_bitmap, color_black(), rectangle);
    REQUIRE(color_black() == get_pixel(test_bitmap, 50.0, 50.0));
    REQUIRE(color_white() == get_pixel(test_bitmap, 80.0, 90.0));
}
TEST_CASE_METHOD(TestGraphicsFixture, "draw_rectangle_on_bitmap_record_with_options_integration") {
    auto test_bitmap = create_bitmap("Test Bitmap 105", 100, 100);
    bitmap_cleanup cleanup_bitmap;
    clear_bitmap(test_bitmap, color_white());
    auto rectangle = rectangle_from(50.0, 50.0, 20.0, 20.0);
    draw_rectangle_on_bitmap(test_bitmap, color_black(), rectangle, option_defaults());
    REQUIRE(color_black() == get_pixel(test_bitmap, 50.0, 50.0));
    REQUIRE(color_white() == get_pixel(test_bitmap, 75.0, 75.0));
}
TEST_CASE_METHOD(TestGraphicsFixture, "draw_rectangle_on_bitmap_integration") {
    auto test_bitmap = create_bitmap("Test Bitmap 106", 100, 100);
    bitmap_cleanup cleanup_bitmap;
    clear_bitmap(test_bitmap, color_white());
    draw_rectangle_on_bitmap(test_bitmap, color_black(), 50.0, 50.0, 20.0, 20.0);
    REQUIRE(color_black() == get_pixel(test_bitmap, 50.0, 50.0));
    REQUIRE(color_white() == get_pixel(test_bitmap, 75.0, 75.0));
}
TEST_CASE_METHOD(TestGraphicsFixture, "draw_rectangle_on_bitmap_with_options_integration") {
    auto test_bitmap = create_bitmap("Test Bitmap 107", 100, 100);
    bitmap_cleanup cleanup_bitmap;
    clear_bitmap(test_bitmap, color_white());
    draw_rectangle_on_bitmap(test_bitmap, color_black(), 50.0, 50.0, 20.0, 20.0, option_defaults());
    REQUIRE(color_black() == get_pixel(test_bitmap, 50.0, 50.0));
    REQUIRE(color_white() == get_pixel(test_bitmap, 75.0, 75.0));
}
TEST_CASE_METHOD(TestGraphicsFixture, "draw_rectangle_on_window_record_integration") {
    auto test_window = open_window("Test Window 116", 800, 600);
    window_cleanup cleanup_window;
    clear_window(test_window, color_white());
    auto rectangle = rectangle_from(100.0, 100.0, 50.0, 50.0);
    draw_rectangle_on_window(test_window, color_black(), rectangle);
    refresh_screen();
    REQUIRE(color_black() == get_pixel(test_window, 100.0, 100.0));
    REQUIRE(color_white() == get_pixel(test_window, 125.0, 125.0));
    REQUIRE(color_white() == get_pixel(test_window, 200.0, 200.0));
}
TEST_CASE_METHOD(TestGraphicsFixture, "draw_rectangle_on_window_record_with_options_integration") {
    auto test_window = open_window("Test Window 117", 800, 600);
    window_cleanup cleanup_window;
    clear_window(test_window, color_white());
    auto rectangle = rectangle_from(100.0, 100.0, 50.0, 50.0);
    draw_rectangle_on_window(test_window, color_black(), rectangle, option_defaults());
    refresh_screen();
    REQUIRE(color_black() == get_pixel(test_window, 100.0, 100.0));
    REQUIRE(color_white() == get_pixel(test_window, 125.0, 125.0));
    REQUIRE(color_white() == get_pixel(test_window, 175.0, 175.0));
}
TEST_CASE_METHOD(TestGraphicsFixture, "draw_rectangle_on_window_integration") {
    auto test_window = open_window("Test Window 118", 800, 600);
    window_cleanup cleanup_window;
    clear_window(test_window, color_white());
    draw_rectangle_on_window(test_window, color_black(), 100.0, 100.0, 50.0, 50.0);
    refresh_screen();
    REQUIRE(color_black() == get_pixel(test_window, 100.0, 100.0));
    REQUIRE(color_white() == get_pixel(test_window, 200.0, 200.0));
}
TEST_CASE_METHOD(TestGraphicsFixture, "draw_rectangle_on_window_with_options_integration") {
    auto test_window = open_window("Test Window 119", 800, 600);
    window_cleanup cleanup_window;
    clear_window(test_window, color_white());
    draw_rectangle_on_window(test_window, color_black(), 100.0, 100.0, 50.0, 50.0, option_defaults());
    refresh_screen();
    REQUIRE(color_black() == get_pixel(test_window, 100.0, 100.0));
    REQUIRE(color_white() == get_pixel(test_window, 200.0, 200.0));
}
TEST_CASE_METHOD(TestGraphicsFixture, "fill_quad_integration") {
    auto test_window = open_window("Test Window 120", 800, 600);
    window_cleanup cleanup_window;
    clear_window(test_window, color_white());
    auto quad = quad_from(point_at(100.0, 100.0), point_at(300.0, 100.0), point_at(100.0, 300.0), point_at(300.0, 300.0));
    fill_quad(color_black(), quad);
    refresh_screen();
    REQUIRE(color_black() == get_pixel(test_window, 200.0, 200.0));
    REQUIRE(color_white() == get_pixel(test_window, 400.0, 400.0));
}
TEST_CASE_METHOD(TestGraphicsFixture, "fill_quad_with_options_integration") {
    auto test_window = open_window("Test Window 121", 800, 600);
    window_cleanup cleanup_window;
    clear_window(test_window, color_white());
    auto quad = quad_from(point_at(100.0, 100.0), point_at(300.0, 100.0), point_at(100.0, 300.0), point_at(300.0, 300.0));
    fill_quad(color_black(), quad, option_defaults());
    refresh_screen();
    REQUIRE(color_black() == get_pixel(test_window, 200.0, 200.0));
    REQUIRE(color_white() == get_pixel(test_window, 400.0, 400.0));
}
TEST_CASE_METHOD(TestGraphicsFixture, "fill_quad_on_bitmap_integration") {
    auto test_bitmap = create_bitmap("Test Bitmap 108", 100, 100);
    bitmap_cleanup cleanup_bitmap;
    clear_bitmap(test_bitmap, color_white());
    auto quad = quad_from(point_at(10.0, 10.0), point_at(90.0, 10.0), point_at(10.0, 90.0), point_at(90.0, 90.0));
    fill_quad_on_bitmap(test_bitmap, color_black(), quad);
    REQUIRE(color_black() == get_pixel(test_bitmap, 50.0, 50.0));
    REQUIRE(color_white() == get_pixel(test_bitmap, 0.0, 0.0));
}
TEST_CASE_METHOD(TestGraphicsFixture, "fill_quad_on_bitmap_with_options_integration") {
    auto test_bitmap = create_bitmap("Test Bitmap 109", 100, 100);
    bitmap_cleanup cleanup_bitmap;
    clear_bitmap(test_bitmap, color_white());
    auto quad = quad_from(point_at(10.0, 10.0), point_at(90.0, 10.0), point_at(90.0, 90.0), point_at(10.0, 90.0));
    fill_quad_on_bitmap(test_bitmap, color_black(), quad, option_defaults());
    REQUIRE(color_black() == get_pixel(test_bitmap, 50.0, 50.0));
    REQUIRE(color_white() == get_pixel(test_bitmap, 95.0, 50.0));
}
TEST_CASE_METHOD(TestGraphicsFixture, "fill_quad_on_window_integration") {
    auto test_window = open_window("Test Window 122", 800, 600);
    window_cleanup cleanup_window;
    clear_window(test_window, color_white());
    auto quad = quad_from(point_at(100.0, 100.0), point_at(200.0, 100.0), point_at(100.0, 200.0), point_at(200.0, 200.0));
    fill_quad_on_window(test_window, color_black(), quad);
    refresh_screen();
    REQUIRE(color_black() == get_pixel(test_window, 150.0, 150.0));
    REQUIRE(color_white() == get_pixel(test_window, 250.0, 250.0));
}
TEST_CASE_METHOD(TestGraphicsFixture, "fill_quad_on_window_with_options_integration") {
    auto test_window = open_window("Test Window 123", 800, 600);
    window_cleanup cleanup_window;
    clear_window(test_window, color_white());
    auto quad = quad_from(point_at(100.0, 100.0), point_at(200.0, 100.0), point_at(200.0, 200.0), point_at(100.0, 200.0));
    fill_quad_on_window(test_window, color_black(), quad, option_defaults());
    refresh_screen();
    REQUIRE(color_black() == get_pixel(test_window, 150.0, 150.0));
    REQUIRE(color_white() == get_pixel(test_window, 250.0, 150.0));
}
TEST_CASE_METHOD(TestGraphicsFixture, "fill_rectangle_record_integration") {
    auto test_window = open_window("Test Window 124", 800, 600);
    window_cleanup cleanup_window;
    clear_window(test_window, color_white());
    auto rectangle = rectangle_from(100.0, 100.0, 200.0, 150.0);
    fill_rectangle(color_black(), rectangle);
    refresh_screen();
    REQUIRE(color_black() == get_pixel(test_window, 150.0, 125.0));
    REQUIRE(color_white() == get_pixel(test_window, 350.0, 275.0));
}
TEST_CASE_METHOD(TestGraphicsFixture, "fill_rectangle_record_with_options_integration") {
    auto test_window = open_window("Test Window 125", 800, 600);
    window_cleanup cleanup_window;
    clear_window(test_window, color_white());
    auto rectangle = rectangle_from(100.0, 100.0, 200.0, 150.0);
    fill_rectangle(color_black(), rectangle, option_defaults());
    refresh_screen();
    REQUIRE(color_black() == get_pixel(test_window, 150.0, 125.0));
    REQUIRE(color_white() == get_pixel(test_window, 350.0, 275.0));
}
TEST_CASE_METHOD(TestGraphicsFixture, "fill_rectangle_integration") {
    auto test_window = open_window("Test Window 126", 800, 600);
    window_cleanup cleanup_window;
    clear_window(test_window, color_white());
    fill_rectangle(color_black(), 100.0, 100.0, 200.0, 150.0);
    refresh_screen();
    REQUIRE(color_black() == get_pixel(test_window, 150.0, 125.0));
    REQUIRE(color_white() == get_pixel(test_window, 301.0, 251.0));
}
TEST_CASE_METHOD(TestGraphicsFixture, "fill_rectangle_with_options_integration") {
    auto test_window = open_window("Test Window 127", 800, 600);
    window_cleanup cleanup_window;
    clear_window(test_window, color_white());
    fill_rectangle(color_black(), 100.0, 100.0, 200.0, 150.0, option_defaults());
    refresh_screen();
    REQUIRE(color_black() == get_pixel(test_window, 150.0, 125.0));
    REQUIRE(color_white() == get_pixel(test_window, 301.0, 251.0));
}
TEST_CASE_METHOD(TestGraphicsFixture, "fill_rectangle_on_bitmap_record_integration") {
    auto test_bitmap = create_bitmap("Test Bitmap 110", 100, 100);
    bitmap_cleanup cleanup_bitmap;
    clear_bitmap(test_bitmap, color_white());
    auto rectangle = rectangle_from(25.0, 25.0, 50.0, 50.0);
    fill_rectangle_on_bitmap(test_bitmap, color_black(), rectangle);
    REQUIRE(color_black() == get_pixel(test_bitmap, 50.0, 50.0));
    REQUIRE(color_white() == get_pixel(test_bitmap, 10.0, 10.0));
}
TEST_CASE_METHOD(TestGraphicsFixture, "fill_rectangle_on_bitmap_record_with_options_integration") {
    auto test_bitmap = create_bitmap("Test Bitmap 111", 100, 100);
    bitmap_cleanup cleanup_bitmap;
    clear_bitmap(test_bitmap, color_white());
    auto rectangle = rectangle_from(25.0, 25.0, 50.0, 50.0);
    fill_rectangle_on_bitmap(test_bitmap, color_black(), rectangle, option_defaults());
    REQUIRE(color_black() == get_pixel(test_bitmap, 50.0, 50.0));
    REQUIRE(color_white() == get_pixel(test_bitmap, 10.0, 10.0));
}
TEST_CASE_METHOD(TestGraphicsFixture, "fill_rectangle_on_bitmap_integration") {
    auto test_bitmap = create_bitmap("Test Bitmap 112", 100, 100);
    bitmap_cleanup cleanup_bitmap;
    clear_bitmap(test_bitmap, color_white());
    fill_rectangle_on_bitmap(test_bitmap, color_black(), 25.0, 25.0, 50.0, 50.0);
    REQUIRE(color_black() == get_pixel(test_bitmap, 50.0, 50.0));
    REQUIRE(color_white() == get_pixel(test_bitmap, 75.0, 75.0));
}
TEST_CASE_METHOD(TestGraphicsFixture, "fill_rectangle_on_bitmap_with_options_integration") {
    auto test_bitmap = create_bitmap("Test Bitmap 113", 100, 100);
    bitmap_cleanup cleanup_bitmap;
    clear_bitmap(test_bitmap, color_white());
    fill_rectangle_on_bitmap(test_bitmap, color_black(), 25.0, 25.0, 50.0, 50.0, option_defaults());
    REQUIRE(color_black() == get_pixel(test_bitmap, 50.0, 50.0));
    REQUIRE(color_white() == get_pixel(test_bitmap, 10.0, 10.0));
}
TEST_CASE_METHOD(TestGraphicsFixture, "fill_rectangle_on_window_record_integration") {
    auto test_window = open_window("Test Window 128", 800, 600);
    window_cleanup cleanup_window;
    clear_window(test_window, color_white());
    auto rectangle = rectangle_from(100.0, 100.0, 200.0, 150.0);
    fill_rectangle_on_window(test_window, color_black(), rectangle);
    refresh_screen();
    REQUIRE(color_black() == get_pixel(test_window, 150.0, 125.0));
    REQUIRE(color_white() == get_pixel(test_window, 350.0, 275.0));
}
TEST_CASE_METHOD(TestGraphicsFixture, "fill_rectangle_on_window_record_with_options_integration") {
    auto test_window = open_window("Test Window 129", 800, 600);
    window_cleanup cleanup_window;
    clear_window(test_window, color_white());
    auto rectangle = rectangle_from(100.0, 100.0, 200.0, 150.0);
    fill_rectangle_on_window(test_window, color_black(), rectangle, option_defaults());
    refresh_screen();
    REQUIRE(color_black() == get_pixel(test_window, 150.0, 125.0));
    REQUIRE(color_white() == get_pixel(test_window, 350.0, 275.0));
}
TEST_CASE_METHOD(TestGraphicsFixture, "fill_rectangle_on_window_integration") {
    auto test_window = open_window("Test Window 130", 800, 600);
    window_cleanup cleanup_window;
    clear_window(test_window, color_white());
    fill_rectangle_on_window(test_window, color_black(), 100.0, 100.0, 50.0, 50.0);
    refresh_screen();
    REQUIRE(color_black() == get_pixel(test_window, 125.0, 125.0));
    REQUIRE(color_white() == get_pixel(test_window, 175.0, 175.0));
}
TEST_CASE_METHOD(TestGraphicsFixture, "fill_rectangle_on_window_with_options_integration") {
    auto test_window = open_window("Test Window 131", 800, 600);
    window_cleanup cleanup_window;
    clear_window(test_window, color_white());
    fill_rectangle_on_window(test_window, color_black(), 100.0, 100.0, 50.0, 50.0, option_defaults());
    refresh_screen();
    REQUIRE(color_black() == get_pixel(test_window, 125.0, 125.0));
    REQUIRE(color_white() == get_pixel(test_window, 175.0, 175.0));
}
TEST_CASE_METHOD(TestGraphicsFixture, "draw_text_font_as_string_integration") {
    auto test_window = open_window("Test Window 132", 800, 600);
    window_cleanup cleanup_window;
    clear_window(test_window, color_white());
    refresh_screen();
    load_font("hara", "hara.ttf");
    font_cleanup cleanup_font;
    draw_text("Test Text", color_black(), "hara", 24, 100.0, 100.0);
    refresh_screen();
    REQUIRE(color_black() == get_pixel(test_window, 120.0, 110.0));
    REQUIRE(color_white() == get_pixel(test_window, 90.0, 90.0));
}
TEST_CASE_METHOD(TestGraphicsFixture, "draw_text_with_options_font_as_string_integration") {
    auto test_window = open_window("Test Window 133", 800, 600);
    window_cleanup cleanup_window;
    clear_window(test_window, color_white());
    load_font("hara", "hara.ttf");
    font_cleanup cleanup_font;
    draw_text("Test Text", color_black(), "hara", 24, 100.0, 100.0, option_defaults());
    refresh_screen();
    REQUIRE(color_black() == get_pixel(test_window, 120.0, 110.0));
    REQUIRE(color_white() == get_pixel(test_window, 90.0, 90.0));
}
TEST_CASE_METHOD(TestGraphicsFixture, "draw_text_no_font_no_size_integration") {
    auto test_window = open_window("Test Window 134", 800, 600);
    window_cleanup cleanup_window;
    clear_window(test_window, color_white());
    draw_text("Test Text", color_black(), 100.0, 100.0);
    refresh_screen();
    REQUIRE(color_black() == get_pixel(test_window, 105.0, 100.0));
    REQUIRE(color_white() == get_pixel(test_window, 90.0, 90.0));
}
TEST_CASE_METHOD(TestGraphicsFixture, "draw_text_no_font_no_size_with_options_integration") {
    auto test_window = open_window("Test Window 135", 800, 600);
    window_cleanup cleanup_window;
    clear_window(test_window, color_white());
    draw_text("Test Text", color_black(), 100.0, 100.0, option_defaults());
    refresh_screen();
    REQUIRE(color_black() == get_pixel(test_window, 105.0, 100.0));
    REQUIRE(color_white() == get_pixel(test_window, 90.0, 90.0));
}
TEST_CASE_METHOD(TestGraphicsFixture, "draw_text_integration") {
    auto test_window = open_window("Test Window 136", 800, 600);
    window_cleanup cleanup_window;
    clear_window(test_window, color_white());
    load_font("hara", "hara.ttf");
    font_cleanup cleanup_font;
    draw_text("Test Text", color_black(), font_named("hara"), 24, 100.0, 100.0);
    refresh_screen();
    REQUIRE(color_black() == get_pixel(test_window, 120.0, 110.0));
    REQUIRE(color_white() == get_pixel(test_window, 90.0, 90.0));
}
TEST_CASE_METHOD(TestGraphicsFixture, "draw_text_with_options_integration") {
    auto test_window = open_window("Test Window 137", 800, 600);
    window_cleanup cleanup_window;
    clear_window(test_window, color_white());
    load_font("hara", "hara.ttf");
    font_cleanup cleanup_font;
    draw_text("Test Text", color_black(), font_named("hara"), 24, 100.0, 100.0, option_defaults());
    refresh_screen();
    REQUIRE(color_black() == get_pixel(test_window, 120.0, 110.0));
    REQUIRE(color_white() == get_pixel(test_window, 90.0, 90.0));
}
TEST_CASE_METHOD(TestGraphicsFixture, "draw_text_on_bitmap_font_as_string_integration") {
    auto test_bitmap = create_bitmap("Test Bitmap 114", 200, 200);
    bitmap_cleanup cleanup_bitmap;
    clear_bitmap(test_bitmap, color_white());
    load_font("hara", "hara.ttf");
    font_cleanup cleanup_font;
    draw_text_on_bitmap(test_bitmap, "Test Text", color_black(), "hara", 24, 100.0, 100.0);
    REQUIRE(color_black() == get_pixel(test_bitmap, 120.0, 110.0));
    REQUIRE(color_white() == get_pixel(test_bitmap, 90.0, 90.0));
}
TEST_CASE_METHOD(TestGraphicsFixture, "draw_text_on_bitmap_with_options_font_as_string_integration") {
    auto test_bitmap = create_bitmap("Test Bitmap 115", 200, 200);
    bitmap_cleanup cleanup_bitmap;
    clear_bitmap(test_bitmap, color_white());
    load_font("hara", "hara.ttf");
    font_cleanup cleanup_font;
    draw_text_on_bitmap(test_bitmap, "Test Text", color_black(), "hara", 24, 100.0, 100.0, option_defaults());
    REQUIRE(color_black() == get_pixel(test_bitmap, 120.0, 110.0));
    REQUIRE(color_white() == get_pixel(test_bitmap, 90.0, 90.0));
}
TEST_CASE_METHOD(TestGraphicsFixture, "draw_text_on_bitmap_no_font_no_size_integration") {
    auto test_bitmap = create_bitmap("Test Bitmap 116", 200, 200);
    bitmap_cleanup cleanup_bitmap;
    clear_bitmap(test_bitmap, color_white());
    draw_text_on_bitmap(test_bitmap, "Test Text", color_black(), 100.0, 100.0);
    REQUIRE(color_black() == get_pixel(test_bitmap, 105.0, 100.0));
    REQUIRE(color_white() == get_pixel(test_bitmap, 90.0, 90.0));
}
TEST_CASE_METHOD(TestGraphicsFixture, "draw_text_on_bitmap_no_font_no_size_with_options_integration") {
    auto test_bitmap = create_bitmap("Test Bitmap 117", 200, 200);
    bitmap_cleanup cleanup_bitmap;
    clear_bitmap(test_bitmap, color_white());
    draw_text_on_bitmap(test_bitmap, "Test Text", color_black(), 100.0, 100.0, option_defaults());
    REQUIRE(color_black() == get_pixel(test_bitmap, 105.0, 100.0));
    REQUIRE(color_white() == get_pixel(test_bitmap, 90.0, 90.0));
}
TEST_CASE_METHOD(TestGraphicsFixture, "draw_text_on_bitmap_integration") {
    auto test_bitmap = create_bitmap("Test Bitmap 118", 200, 200);
    bitmap_cleanup cleanup_bitmap;
    clear_bitmap(test_bitmap, color_white());
    load_font("hara", "hara.ttf");
    font_cleanup cleanup_font;
    draw_text_on_bitmap(test_bitmap, "Test Text", color_black(), font_named("hara"), 24, 100.0, 100.0);
    REQUIRE(color_black() == get_pixel(test_bitmap, 120.0, 110.0));
    REQUIRE(color_white() == get_pixel(test_bitmap, 90.0, 90.0));
}
TEST_CASE_METHOD(TestGraphicsFixture, "draw_text_on_bitmap_with_options_integration") {
    auto test_bitmap = create_bitmap("Test Bitmap 119", 200, 200);
    bitmap_cleanup cleanup_bitmap;
    clear_bitmap(test_bitmap, color_white());
    load_font("hara", "hara.ttf");
    font_cleanup cleanup_font;
    draw_text_on_bitmap(test_bitmap, "Test Text", color_black(), font_named("hara"), 24, 100.0, 100.0, option_defaults());
    REQUIRE(color_black() == get_pixel(test_bitmap, 120.0, 110.0));
    REQUIRE(color_white() == get_pixel(test_bitmap, 90.0, 90.0));
}
TEST_CASE_METHOD(TestGraphicsFixture, "draw_text_on_window_font_as_string_integration") {
    auto test_window = open_window("Test Window 138", 800, 600);
    window_cleanup cleanup_window;
    clear_window(test_window, color_white());
    load_font("hara", "hara.ttf");
    font_cleanup cleanup_font;
    draw_text_on_window(test_window, "Test Text", color_black(), "hara", 24, 100.0, 100.0);
    refresh_screen();
    REQUIRE(color_black() == get_pixel(test_window, 120.0, 110.0));
    REQUIRE(color_white() == get_pixel(test_window, 90.0, 90.0));
}
TEST_CASE_METHOD(TestGraphicsFixture, "draw_text_on_window_with_options_font_as_string_integration") {
    auto test_window = open_window("Test Window 139", 800, 600);
    window_cleanup cleanup_window;
    clear_window(test_window, color_white());
    load_font("hara", "hara.ttf");
    font_cleanup cleanup_font;
    draw_text_on_window(test_window, "Test Text", color_black(), "hara", 24, 100.0, 100.0, option_defaults());
    refresh_screen();
    REQUIRE(color_black() == get_pixel(test_window, 120.0, 110.0));
    REQUIRE(color_white() == get_pixel(test_window, 90.0, 90.0));
}
TEST_CASE_METHOD(TestGraphicsFixture, "draw_text_on_window_no_font_no_size_integration") {
    auto test_window = open_window("Test Window 140", 800, 600);
    window_cleanup cleanup_window;
    clear_window(test_window, color_white());
    draw_text_on_window(test_window, "Test Text", color_black(), 100.0, 100.0);
    refresh_screen();
    REQUIRE(color_black() == get_pixel(test_window, 105.0, 100.0));
    REQUIRE(color_white() == get_pixel(test_window, 90.0, 90.0));
}
TEST_CASE_METHOD(TestGraphicsFixture, "draw_text_on_window_no_font_no_size_with_options_integration") {
    auto test_window = open_window("Test Window 141", 800, 600);
    window_cleanup cleanup_window;
    clear_window(test_window, color_white());
    draw_text_on_window(test_window, "Test Text", color_black(), 100.0, 100.0, option_defaults());
    refresh_screen();
    REQUIRE(color_black() == get_pixel(test_window, 105.0, 100.0));
    REQUIRE(color_white() == get_pixel(test_window, 90.0, 90.0));
}
TEST_CASE_METHOD(TestGraphicsFixture, "draw_text_on_window_integration") {
    auto test_window = open_window("Test Window 142", 800, 600);
    window_cleanup cleanup_window;
    clear_window(test_window, color_white());
    load_font("hara", "hara.ttf");
    font_cleanup cleanup_font;
    auto test_font = font_named("hara");
    font_load_size(test_font, 24);
    draw_text_on_window(test_window, "Test Text", color_black(), test_font, 24, 100.0, 100.0);
    refresh_screen();
    REQUIRE(color_black() == get_pixel(test_window, 120.0, 110.0));
    REQUIRE(color_white() == get_pixel(test_window, 90.0, 90.0));
}
TEST_CASE_METHOD(TestGraphicsFixture, "draw_text_on_window_with_options_integration") {
    auto test_window = open_window("Test Window 143", 800, 600);
    window_cleanup cleanup_window;
    clear_window(test_window, color_white());
    auto test_font = load_font("Test Font", "hara.ttf");
    font_cleanup cleanup_font;
    draw_text_on_window(test_window, "Test Text", color_black(), test_font, 24, 100.0, 100.0, option_defaults());
    refresh_screen();
    REQUIRE(color_black() == get_pixel(test_window, 120.0, 110.0));
    REQUIRE(color_white() == get_pixel(test_window, 90.0, 90.0));
}
TEST_CASE_METHOD(TestGraphicsFixture, "font_has_size_name_as_string_integration") {
    load_font("hara", "hara.ttf");
    font_cleanup cleanup_font;
    font_load_size("hara", 12);
    REQUIRE(font_has_size("hara", 12));
    REQUIRE_FALSE(font_has_size("nonexistent_font", 12));
}
TEST_CASE_METHOD(TestGraphicsFixture, "font_has_size_integration") {
    auto test_font = load_font("Test Font", "hara.ttf");
    font_cleanup cleanup_font;
    font_load_size(test_font, 12);
    REQUIRE(font_has_size(test_font, 12));
    REQUIRE_FALSE(font_has_size(test_font, 999));
}
TEST_CASE_METHOD(TestGraphicsFixture, "font_load_size_name_as_string_integration") {
    load_font("Test Font", "hara.ttf");
    font_cleanup cleanup_font;
    font_load_size("Test Font", 12);
    REQUIRE(font_has_size("Test Font", 12));
}
TEST_CASE_METHOD(TestGraphicsFixture, "font_load_size_integration") {
    auto test_font = load_font("Test Font", "hara.ttf");
    font_cleanup cleanup_font;
    font_load_size(test_font, 12);
    REQUIRE(font_has_size(test_font, 12));
}
TEST_CASE_METHOD(TestGraphicsFixture, "font_named_integration") {
    auto test_window = open_window("Test Window 144", 800, 600);
    window_cleanup cleanup_window;
    clear_window(test_window, color_white());
    load_font("hara", "hara.ttf");
    font_cleanup cleanup_font;
    auto test_font = font_named("hara");
    draw_text("Test Text", color_black(), test_font, 24, 100.0, 100.0);
    refresh_screen();
    REQUIRE(test_font != nullptr);
    REQUIRE(color_black() == get_pixel(test_window, 120.0, 110.0));
    REQUIRE(color_white() == get_pixel(test_window, 90.0, 90.0));
}
TEST_CASE_METHOD(TestGraphicsFixture, "free_all_fonts_integration") {
    load_font("Test Font", "hara.ttf");
    font_cleanup cleanup_font;
    REQUIRE(has_font("Test Font"));
    free_all_fonts();
    REQUIRE_FALSE(has_font("Test Font"));
}
TEST_CASE_METHOD(TestGraphicsFixture, "free_font_integration") {
    auto test_font = load_font("Test Font", "hara.ttf");
    font_cleanup cleanup_font;
    REQUIRE(has_font(test_font));
    free_font(test_font);
    REQUIRE_FALSE(has_font(test_font));
}
TEST_CASE_METHOD(TestGraphicsFixture, "get_font_style_name_as_string_integration") {
    load_font("Test Font", "hara.ttf");
    font_cleanup cleanup_font;
    auto style = get_font_style("Test Font");
    REQUIRE(font_style::BOLD_FONT == style);
}
TEST_CASE_METHOD(TestGraphicsFixture, "get_font_style_integration") {
    auto test_font = load_font("Test Font", "hara.ttf");
    font_cleanup cleanup_font;
    auto style = get_font_style(test_font);
    REQUIRE(font_style::BOLD_FONT == style);
}
TEST_CASE_METHOD(TestGraphicsFixture, "get_system_font_integration") {
    auto system_font = get_system_font();
    REQUIRE(system_font != nullptr);
}
TEST_CASE_METHOD(TestGraphicsFixture, "has_font_integration") {
    auto test_font = load_font("Test Font", "hara.ttf");
    font_cleanup cleanup_font;
    REQUIRE(has_font(test_font));
    free_font(test_font);
    REQUIRE_FALSE(has_font(test_font));
}
TEST_CASE_METHOD(TestGraphicsFixture, "has_font_name_as_string_integration") {
    load_font("Test Font", "hara.ttf");
    font_cleanup cleanup_font;
    REQUIRE(has_font("Test Font"));
    REQUIRE_FALSE(has_font("nonexistent_font"));
}
TEST_CASE_METHOD(TestGraphicsFixture, "load_font_integration") {
    auto test_window = open_window("Test Window 145", 800, 600);
    window_cleanup cleanup_window;
    clear_window(test_window, color_white());
    auto test_font = load_font("Test Font", "hara.ttf");
    font_cleanup cleanup_font;
    draw_text("Test Text", color_black(), test_font, 24, 100.0, 100.0, option_defaults());
    refresh_screen();
    REQUIRE(has_font("Test Font"));
    REQUIRE(color_black() == get_pixel(test_window, 105.0, 105.0));
}
TEST_CASE_METHOD(TestGraphicsFixture, "set_font_style_name_as_string_integration") {
    load_font("Test Font", "hara.ttf");
    font_cleanup cleanup_font;
    set_font_style("Test Font", font_style::BOLD_FONT);
    REQUIRE(font_style::BOLD_FONT == get_font_style("Test Font"));
}
TEST_CASE_METHOD(TestGraphicsFixture, "set_font_style_integration") {
    auto test_font = load_font("Test Font", "hara.ttf");
    font_cleanup cleanup_font;
    set_font_style(test_font, font_style::BOLD_FONT);
    REQUIRE(font_style::BOLD_FONT == get_font_style(test_font));
}
TEST_CASE_METHOD(TestGraphicsFixture, "text_height_font_named_integration") {
    load_font("Test Font", "hara.ttf");
    font_cleanup cleanup_font;
    font_load_size("Test Font", 24);
    auto height = text_height("Test Text", "Test Font", 24);
    REQUIRE(height > 0);
    REQUIRE(height >= 24);
}
TEST_CASE_METHOD(TestGraphicsFixture, "text_height_integration") {
    auto test_font = load_font("Test Font", "hara.ttf");
    font_cleanup cleanup_font;
    font_load_size(test_font, 24);
    auto height = text_height("Test Text", test_font, 24);
    REQUIRE(height > 0);
    REQUIRE(height >= 24);
}
TEST_CASE_METHOD(TestGraphicsFixture, "text_width_font_named_integration") {
    auto test_font = load_font("hara", "hara.ttf");
    font_cleanup cleanup_font;
    font_load_size(test_font, 12);
    auto width = text_width("Test Text", "hara", 24);
    REQUIRE(width > 0);
    REQUIRE(width >= text_height("Test Text", "hara", 24));
}
TEST_CASE_METHOD(TestGraphicsFixture, "text_width_integration") {
    auto test_font = load_font("Test Font", "hara.ttf");
    font_cleanup cleanup_font;
    font_load_size(test_font, 12);
    auto width = text_width("Test Text", test_font, 24);
    REQUIRE(width > 0);
    REQUIRE(width >= text_height("Text Height", test_font, 24));
}
TEST_CASE_METHOD(TestGraphicsFixture, "draw_triangle_record_integration") {
    auto test_window = open_window("Test Window 146", 800, 600);
    window_cleanup cleanup_window;
    clear_window(test_window, color_white());
    auto triangle = triangle_from(point_at(100.0, 100.0), point_at(200.0, 200.0), point_at(150.0, 300.0));
    draw_triangle(color_black(), triangle);
    refresh_screen();
    REQUIRE(color_black() == get_pixel(test_window, 100.0, 100.0));
    REQUIRE(color_white() == get_pixel(test_window, 150.0, 200.0));
}
TEST_CASE_METHOD(TestGraphicsFixture, "draw_triangle_record_with_options_integration") {
    auto test_window = open_window("Test Window 147", 800, 600);
    window_cleanup cleanup_window;
    clear_window(test_window, color_white());
    auto triangle = triangle_from(point_at(100.0, 100.0), point_at(200.0, 200.0), point_at(150.0, 300.0));
    draw_triangle(color_black(), triangle, option_defaults());
    refresh_screen();
    REQUIRE(color_black() == get_pixel(test_window, 100.0, 100.0));
    REQUIRE(color_white() == get_pixel(test_window, 150.0, 200.0));
}
TEST_CASE_METHOD(TestGraphicsFixture, "draw_triangle_integration") {
    auto test_window = open_window("Test Window 148", 800, 600);
    window_cleanup cleanup_window;
    clear_window(test_window, color_white());
    draw_triangle(color_black(), 100.0, 100.0, 200.0, 300.0, 300.0, 100.0);
    refresh_screen();
    REQUIRE(color_black() == get_pixel(test_window, 100.0, 100.0));
    REQUIRE(color_white() == get_pixel(test_window, 200.0, 150.0));
}
TEST_CASE_METHOD(TestGraphicsFixture, "draw_triangle_with_options_integration") {
    auto test_window = open_window("Test Window 149", 800, 600);
    window_cleanup cleanup_window;
    clear_window(test_window, color_white());
    draw_triangle(color_black(), 100.0, 100.0, 200.0, 200.0, 150.0, 300.0, option_defaults());
    refresh_screen();
    REQUIRE(color_black() == get_pixel(test_window, 100.0, 100.0));
    REQUIRE(color_white() == get_pixel(test_window, 150.0, 200.0));
}
TEST_CASE_METHOD(TestGraphicsFixture, "draw_triangle_on_bitmap_record_integration") {
    auto test_bitmap = create_bitmap("Test Bitmap 120", 100, 100);
    bitmap_cleanup cleanup_bitmap;
    clear_bitmap(test_bitmap, color_white());
    auto triangle = triangle_from(point_at(25.0, 25.0), point_at(75.0, 25.0), point_at(50.0, 75.0));
    draw_triangle_on_bitmap(test_bitmap, color_black(), triangle);
    REQUIRE(color_black() == get_pixel(test_bitmap, 25.0, 25.0));
    REQUIRE(color_white() == get_pixel(test_bitmap, 50.0, 50.0));
}
TEST_CASE_METHOD(TestGraphicsFixture, "draw_triangle_on_bitmap_record_with_options_integration") {
    auto test_bitmap = create_bitmap("Test Bitmap 121", 100, 100);
    bitmap_cleanup cleanup_bitmap;
    clear_bitmap(test_bitmap, color_white());
    auto triangle = triangle_from(point_at(25.0, 25.0), point_at(75.0, 25.0), point_at(50.0, 75.0));
    draw_triangle_on_bitmap(test_bitmap, color_black(), triangle, option_defaults());
    REQUIRE(color_black() == get_pixel(test_bitmap, 25.0, 25.0));
    REQUIRE(color_white() == get_pixel(test_bitmap, 50.0, 50.0));
}
TEST_CASE_METHOD(TestGraphicsFixture, "draw_triangle_on_bitmap_integration") {
    auto test_bitmap = create_bitmap("Test Bitmap 122", 100, 100);
    bitmap_cleanup cleanup_bitmap;
    clear_bitmap(test_bitmap, color_white());
    draw_triangle_on_bitmap(test_bitmap, color_black(), 25.0, 25.0, 75.0, 25.0, 50.0, 75.0);
    REQUIRE(color_black() == get_pixel(test_bitmap, 25.0, 25.0));
    REQUIRE(color_white() == get_pixel(test_bitmap, 50.0, 50.0));
}
TEST_CASE_METHOD(TestGraphicsFixture, "draw_triangle_on_bitmap_with_options_integration") {
    auto test_bitmap = create_bitmap("Test Bitmap 123", 100, 100);
    bitmap_cleanup cleanup_bitmap;
    clear_bitmap(test_bitmap, color_white());
    draw_triangle_on_bitmap(test_bitmap, color_black(), 25.0, 25.0, 75.0, 25.0, 50.0, 75.0, option_defaults());
    REQUIRE(color_black() == get_pixel(test_bitmap, 25.0, 25.0));
    REQUIRE(color_white() == get_pixel(test_bitmap, 50.0, 50.0));
}
TEST_CASE_METHOD(TestGraphicsFixture, "draw_triangle_on_window_record_integration") {
    auto test_window = open_window("Test Window 150", 800, 600);
    window_cleanup cleanup_window;
    clear_window(test_window, color_white());
    auto triangle = triangle_from(point_at(100.0, 100.0), point_at(200.0, 200.0), point_at(150.0, 300.0));
    draw_triangle_on_window(test_window, color_black(), triangle);
    refresh_screen();
    REQUIRE(color_black() == get_pixel(test_window, 100.0, 100.0));
    REQUIRE(color_white() == get_pixel(test_window, 50.0, 50.0));
}
TEST_CASE_METHOD(TestGraphicsFixture, "draw_triangle_on_window_record_with_options_integration") {
    auto test_window = open_window("Test Window 151", 800, 600);
    window_cleanup cleanup_window;
    clear_window(test_window, color_white());
    auto triangle = triangle_from(point_at(100.0, 100.0), point_at(200.0, 200.0), point_at(150.0, 250.0));
    draw_triangle_on_window(test_window, color_black(), triangle, option_defaults());
    refresh_screen();
    REQUIRE(color_black() == get_pixel(test_window, 150.0, 150.0));
    REQUIRE(color_white() == get_pixel(test_window, 50.0, 50.0));
}
TEST_CASE_METHOD(TestGraphicsFixture, "draw_triangle_on_window_integration") {
    auto test_window = open_window("Test Window 152", 800, 600);
    window_cleanup cleanup_window;
    clear_window(test_window, color_white());
    draw_triangle_on_window(test_window, color_black(), 100.0, 100.0, 200.0, 300.0, 300.0, 100.0);
    refresh_screen();
    REQUIRE(color_black() == get_pixel(test_window, 100.0, 100.0));
    REQUIRE(color_white() == get_pixel(test_window, 50.0, 50.0));
}
TEST_CASE_METHOD(TestGraphicsFixture, "draw_triangle_on_window_with_options_integration") {
    auto test_window = open_window("Test Window 153", 800, 600);
    window_cleanup cleanup_window;
    clear_window(test_window, color_white());
    draw_triangle_on_window(test_window, color_black(), 100.0, 100.0, 200.0, 200.0, 150.0, 300.0, option_defaults());
    refresh_screen();
    REQUIRE(color_black() == get_pixel(test_window, 100.0, 100.0));
    REQUIRE(color_white() == get_pixel(test_window, 50.0, 50.0));
}
TEST_CASE_METHOD(TestGraphicsFixture, "fill_triangle_record_integration") {
    auto test_window = open_window("Test Window 154", 800, 600);
    window_cleanup cleanup_window;
    clear_window(test_window, color_white());
    auto triangle = triangle_from(point_at(100.0, 100.0), point_at(200.0, 300.0), point_at(300.0, 100.0));
    fill_triangle(color_black(), triangle);
    refresh_screen();
    REQUIRE(color_black() == get_pixel(test_window, 200.0, 150.0));
    REQUIRE(color_white() == get_pixel(test_window, 50.0, 50.0));
}
TEST_CASE_METHOD(TestGraphicsFixture, "fill_triangle_record_with_options_integration") {
    auto test_window = open_window("Test Window 155", 800, 600);
    window_cleanup cleanup_window;
    clear_window(test_window, color_white());
    auto triangle = triangle_from(point_at(100.0, 100.0), point_at(200.0, 300.0), point_at(300.0, 100.0));
    fill_triangle(color_black(), triangle, option_defaults());
    refresh_screen();
    REQUIRE(color_black() == get_pixel(test_window, 200.0, 150.0));
    REQUIRE(color_white() == get_pixel(test_window, 50.0, 50.0));
}
TEST_CASE_METHOD(TestGraphicsFixture, "fill_triangle_integration") {
    auto test_window = open_window("Test Window 156", 800, 600);
    window_cleanup cleanup_window;
    clear_window(test_window, color_white());
    fill_triangle(color_black(), 100.0, 100.0, 200.0, 300.0, 300.0, 100.0);
    refresh_screen();
    REQUIRE(color_black() == get_pixel(test_window, 200.0, 150.0));
    REQUIRE(color_white() == get_pixel(test_window, 50.0, 50.0));
}
TEST_CASE_METHOD(TestGraphicsFixture, "fill_triangle_with_options_integration") {
    auto test_window = open_window("Test Window 157", 800, 600);
    window_cleanup cleanup_window;
    clear_window(test_window, color_white());
    fill_triangle(color_red(), 100.0, 100.0, 200.0, 300.0, 300.0, 100.0, option_defaults());
    refresh_screen();
    REQUIRE(color_red() == get_pixel(test_window, 150.0, 150.0));
    REQUIRE(color_white() == get_pixel(test_window, 350.0, 150.0));
}
TEST_CASE_METHOD(TestGraphicsFixture, "fill_triangle_on_bitmap_record_integration") {
    auto test_bitmap = create_bitmap("Test Bitmap 124", 100, 100);
    bitmap_cleanup cleanup_bitmap;
    clear_bitmap(test_bitmap, color_white());
    auto triangle = triangle_from(point_at(25.0, 25.0), point_at(75.0, 25.0), point_at(50.0, 75.0));
    fill_triangle_on_bitmap(test_bitmap, color_black(), triangle);
    REQUIRE(color_black() == get_pixel(test_bitmap, 50.0, 50.0));
    REQUIRE(color_white() == get_pixel(test_bitmap, 0.0, 0.0));
}
TEST_CASE_METHOD(TestGraphicsFixture, "fill_triangle_on_bitmap_record_with_options_integration") {
    auto test_bitmap = create_bitmap("Test Bitmap 125", 100, 100);
    bitmap_cleanup cleanup_bitmap;
    clear_bitmap(test_bitmap, color_white());
    auto triangle = triangle_from(point_at(25.0, 25.0), point_at(75.0, 25.0), point_at(50.0, 75.0));
    fill_triangle_on_bitmap(test_bitmap, color_black(), triangle, option_defaults());
    REQUIRE(color_black() == get_pixel(test_bitmap, 50.0, 50.0));
    REQUIRE(color_white() == get_pixel(test_bitmap, 10.0, 10.0));
}
TEST_CASE_METHOD(TestGraphicsFixture, "fill_triangle_on_bitmap_integration") {
    auto test_bitmap = create_bitmap("Test Bitmap 126", 100, 100);
    bitmap_cleanup cleanup_bitmap;
    clear_bitmap(test_bitmap, color_white());
    fill_triangle_on_bitmap(test_bitmap, color_black(), 25.0, 25.0, 75.0, 25.0, 50.0, 75.0);
    REQUIRE(color_black() == get_pixel(test_bitmap, 50.0, 50.0));
    REQUIRE(color_white() == get_pixel(test_bitmap, 0.0, 0.0));
}
TEST_CASE_METHOD(TestGraphicsFixture, "fill_triangle_on_bitmap_with_options_integration") {
    auto test_bitmap = create_bitmap("Test Bitmap 127", 100, 100);
    bitmap_cleanup cleanup_bitmap;
    clear_bitmap(test_bitmap, color_white());
    fill_triangle_on_bitmap(test_bitmap, color_black(), 25.0, 25.0, 75.0, 25.0, 50.0, 75.0, option_defaults());
    REQUIRE(color_black() == get_pixel(test_bitmap, 50.0, 50.0));
    REQUIRE(color_white() == get_pixel(test_bitmap, 0.0, 0.0));
}
TEST_CASE_METHOD(TestGraphicsFixture, "fill_triangle_on_window_record_integration") {
    auto test_window = open_window("Test Window 158", 800, 600);
    window_cleanup cleanup_window;
    clear_window(test_window, color_white());
    auto triangle = triangle_from(point_at(100.0, 100.0), point_at(200.0, 300.0), point_at(300.0, 100.0));
    fill_triangle_on_window(test_window, color_black(), triangle);
    refresh_screen();
    REQUIRE(color_black() == get_pixel(test_window, 200.0, 200.0));
    REQUIRE(color_white() == get_pixel(test_window, 50.0, 50.0));
}
TEST_CASE_METHOD(TestGraphicsFixture, "fill_triangle_on_window_record_with_options_integration") {
    auto test_window = open_window("Test Window 159", 800, 600);
    window_cleanup cleanup_window;
    clear_window(test_window, color_white());
    auto triangle = triangle_from(point_at(100.0, 100.0), point_at(200.0, 300.0), point_at(300.0, 100.0));
    fill_triangle_on_window(test_window, color_black(), triangle, option_defaults());
    refresh_screen();
    REQUIRE(color_black() == get_pixel(test_window, 200.0, 200.0));
    REQUIRE(color_white() == get_pixel(test_window, 50.0, 50.0));
}
TEST_CASE_METHOD(TestGraphicsFixture, "fill_triangle_on_window_integration") {
    auto test_window = open_window("Test Window 160", 800, 600);
    window_cleanup cleanup_window;
    clear_window(test_window, color_white());
    fill_triangle_on_window(test_window, color_black(), 100.0, 100.0, 200.0, 300.0, 300.0, 100.0);
    refresh_screen();
    REQUIRE(color_black() == get_pixel(test_window, 200.0, 200.0));
    REQUIRE(color_white() == get_pixel(test_window, 50.0, 50.0));
}
TEST_CASE_METHOD(TestGraphicsFixture, "fill_triangle_on_window_with_options_integration") {
    auto test_window = open_window("Test Window 161", 800, 600);
    window_cleanup cleanup_window;
    clear_window(test_window, color_white());
    fill_triangle_on_window(test_window, color_black(), 100.0, 100.0, 200.0, 300.0, 300.0, 100.0, option_defaults());
    refresh_screen();
    REQUIRE(color_black() == get_pixel(test_window, 150.0, 150.0));
    REQUIRE(color_white() == get_pixel(test_window, 350.0, 150.0));
}
