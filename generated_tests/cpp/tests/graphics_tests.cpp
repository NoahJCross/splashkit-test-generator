#include "splashkit.h"
#include <catch2/catch.hpp>

TEST_CASE("draw_circle_record_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_circle = circle_at(400.0, 300.0, 50.0);
    draw_circle(color_black(), test_circle);
    refresh_screen();
    REQUIRE(point_in_circle(point_at(400.0, 300.0), test_circle));
    close_window(test_window);
}
TEST_CASE("draw_circle_record_with_options_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_circle = circle_at(400.0, 300.0, 50.0);
    draw_circle(color_black(), test_circle, option_defaults());
    refresh_screen();
    REQUIRE(point_in_circle(point_at(400.0, 300.0), test_circle));
    close_window(test_window);
}
TEST_CASE("draw_circle_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    draw_circle(color_black(), 400.0, 300.0, 50.0);
    refresh_screen();
    REQUIRE(point_in_circle(point_at(400.0, 300.0), circle_at(400.0, 300.0, 50.0)));
    close_window(test_window);
}
TEST_CASE("draw_circle_with_options_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    draw_circle(color_black(), 400.0, 300.0, 50.0, option_defaults());
    refresh_screen();
    REQUIRE(point_in_circle(point_at(400.0, 300.0), circle_at(400.0, 300.0, 50.0)));
    close_window(test_window);
}
TEST_CASE("draw_circle_on_bitmap_integration") {
    auto test_bitmap = create_bitmap("test_bitmap", 200, 200);
    draw_circle_on_bitmap(test_bitmap, color_black(), 100.0, 100.0, 50.0);
    REQUIRE(pixel_drawn_at_point(test_bitmap, 100.0, 100.0));
    free_bitmap(test_bitmap);
}
TEST_CASE("draw_circle_on_bitmap_with_options_integration") {
    auto test_bitmap = create_bitmap("test_bitmap", 200, 200);
    draw_circle_on_bitmap(test_bitmap, color_black(), 100.0, 100.0, 50.0, option_defaults());
    REQUIRE(pixel_drawn_at_point(test_bitmap, 100.0, 100.0));
    free_bitmap(test_bitmap);
}
TEST_CASE("draw_circle_on_window_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    draw_circle_on_window(test_window, color_black(), 400.0, 300.0, 50.0);
    refresh_screen();
    REQUIRE(point_in_circle(point_at(400.0, 300.0), circle_at(400.0, 300.0, 50.0)));
    close_window(test_window);
}
TEST_CASE("draw_circle_on_window_with_options_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    draw_circle_on_window(test_window, color_black(), 400.0, 300.0, 50.0, option_defaults());
    refresh_screen();
    REQUIRE(point_in_circle(point_at(400.0, 300.0), circle_at(400.0, 300.0, 50.0)));
    close_window(test_window);
}
TEST_CASE("fill_circle_record_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_circle = circle_at(400.0, 300.0, 50.0);
    fill_circle(color_black(), test_circle);
    refresh_screen();
    REQUIRE(point_in_circle(point_at(400.0, 300.0), test_circle));
    close_window(test_window);
}
TEST_CASE("fill_circle_record_with_options_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_circle = circle_at(400.0, 300.0, 50.0);
    fill_circle(color_black(), test_circle, option_defaults());
    refresh_screen();
    REQUIRE(point_in_circle(point_at(400.0, 300.0), test_circle));
    close_window(test_window);
}
TEST_CASE("fill_circle_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    fill_circle(color_black(), 400.0, 300.0, 50.0);
    refresh_screen();
    REQUIRE(point_in_circle(point_at(400.0, 300.0), circle_at(400.0, 300.0, 50.0)));
    close_window(test_window);
}
TEST_CASE("fill_circle_with_options_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    fill_circle(color_black(), 400.0, 300.0, 50.0, option_defaults());
    refresh_screen();
    REQUIRE(point_in_circle(point_at(400.0, 300.0), circle_at(400.0, 300.0, 50.0)));
    close_window(test_window);
}
TEST_CASE("fill_circle_on_bitmap_integration") {
    auto test_bitmap = create_bitmap("test_bitmap", 200, 200);
    fill_circle_on_bitmap(test_bitmap, color_red(), 100.0, 100.0, 50.0);
    REQUIRE(pixel_drawn_at_point(test_bitmap, 100.0, 100.0));
    REQUIRE(pixel_drawn_at_point(test_bitmap, 150.0, 100.0));
    REQUIRE_FALSE(pixel_drawn_at_point(test_bitmap, 200.0, 100.0));
    free_bitmap(test_bitmap);
}
TEST_CASE("fill_circle_on_bitmap_with_options_integration") {
    auto test_bitmap = create_bitmap("test_bitmap", 200, 200);
    fill_circle_on_bitmap(test_bitmap, color_black(), 100.0, 100.0, 50.0, option_defaults());
    REQUIRE(pixel_drawn_at_point(test_bitmap, 100.0, 100.0));
    REQUIRE(pixel_drawn_at_point(test_bitmap, 150.0, 100.0));
    REQUIRE_FALSE(pixel_drawn_at_point(test_bitmap, 200.0, 100.0));
    free_bitmap(test_bitmap);
}
TEST_CASE("fill_circle_on_window_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    fill_circle_on_window(test_window, color_black(), 400.0, 300.0, 50.0);
    refresh_screen();
    REQUIRE(point_in_circle(point_at(400.0, 300.0), circle_at(400.0, 300.0, 50.0)));
    close_window(test_window);
}
TEST_CASE("fill_circle_on_window_with_options_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    fill_circle_on_window(test_window, color_black(), 400.0, 300.0, 50.0, option_defaults());
    refresh_screen();
    REQUIRE(point_in_circle(point_at(400.0, 300.0), circle_at(400.0, 300.0, 50.0)));
    close_window(test_window);
}
TEST_CASE("current_clip_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_clip = current_clip();
    REQUIRE(test_clip->width == 800);
    REQUIRE(test_clip->height == 600);
    close_window(test_window);
}
TEST_CASE("current_clip_for_bitmap_integration") {
    auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
    auto test_rectangle = rectangle_from(10, 10, 50, 50);
    push_clip(test_bitmap, test_rectangle);
    auto test_clip = current_clip(test_bitmap);
    REQUIRE(rectangle_left(test_clip) == 10);
    REQUIRE(rectangle_top(test_clip) == 10);
    REQUIRE(test_clip->width == 50);
    REQUIRE(test_clip->height == 50);
    free_bitmap(test_bitmap);
}
TEST_CASE("current_clip_for_window_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_clip = current_clip(test_window);
    REQUIRE(rectangle_from(0, 0, 800, 600) == test_clip);
    close_window(test_window);
}
TEST_CASE("pop_clip_for_window_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_rectangle = rectangle_from(100, 100, 200, 200);
    push_clip(test_window, test_rectangle);
    auto test_current_clip = current_clip(test_window);
    REQUIRE(test_current_clip == test_rectangle);
    pop_clip(test_window);
    auto test_current_clip_after_pop = current_clip(test_window);
    REQUIRE(rectangle_from(0, 0, 800, 600) == test_current_clip_after_pop);
    close_window(test_window);
}
TEST_CASE("pop_clip_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    push_clip(rectangle_from(100, 100, 200, 200));
    draw_circle(color_black(), 150, 150, 50);
    refresh_screen();
    REQUIRE(point_in_circle(point_at(150, 150), circle_at(150, 150, 50)));
    pop_clip();
    draw_circle(color_red(), 300, 300, 50);
    refresh_screen();
    REQUIRE(point_in_circle(point_at(300, 300), circle_at(300, 300, 50)));
    close_window(test_window);
}
TEST_CASE("pop_clip_for_bitmap_integration") {
    auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
    push_clip(test_bitmap, rectangle_from(0, 0, 50, 50));
    pop_clip(test_bitmap);
    REQUIRE(current_clip(test_bitmap) == rectangle_from(0, 0, 100, 100));
    free_bitmap(test_bitmap);
}
TEST_CASE("push_clip_for_window_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_rectangle = rectangle_from(100.0, 100.0, 200.0, 200.0);
    push_clip(test_window, test_rectangle);
    auto test_current_clip = current_clip(test_window);
    REQUIRE(test_current_clip == test_rectangle);
    refresh_screen();
    close_window(test_window);
}
TEST_CASE("push_clip_for_bitmap_integration") {
    auto test_bitmap = create_bitmap("test_bitmap", 200, 200);
    auto test_rectangle = rectangle_from(50, 50, 100, 100);
    push_clip(test_bitmap, test_rectangle);
    auto test_current_clip = current_clip(test_bitmap);
    REQUIRE(rectangle_left(test_current_clip) == 50);
    REQUIRE(rectangle_top(test_current_clip) == 50);
    REQUIRE(test_current_clip->width == 100);
    REQUIRE(test_current_clip->height == 100);
    free_bitmap(test_bitmap);
}
TEST_CASE("push_clip_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_rectangle = rectangle_from(100.0, 100.0, 200.0, 200.0);
    push_clip(test_rectangle);
    auto test_current_clip = current_clip();
    REQUIRE(test_current_clip == test_rectangle);
    close_window(test_window);
}
TEST_CASE("reset_clip_for_bitmap_integration") {
    auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
    push_clip(test_bitmap, rectangle_from(10, 10, 50, 50));
    reset_clip(test_bitmap);
    REQUIRE(current_clip(test_bitmap) == rectangle_from(0, 0, 100, 100));
    free_bitmap(test_bitmap);
}
TEST_CASE("reset_clip_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    push_clip(rectangle_from(100, 100, 200, 200));
    reset_clip();
    auto test_clip_rect = current_clip();
    REQUIRE(rectangle_from(0, 0, 800, 600) == test_clip_rect);
    close_window(test_window);
}
TEST_CASE("reset_clip_for_window_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    push_clip(test_window, rectangle_from(100, 100, 200, 200));
    reset_clip(test_window);
    auto test_clip_rect = current_clip(test_window);
    REQUIRE(rectangle_from(0, 0, 800, 600) == test_clip_rect);
    close_window(test_window);
}
TEST_CASE("set_clip_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_rectangle = rectangle_from(100.0, 100.0, 200.0, 200.0);
    set_clip(test_rectangle);
    auto test_current_clip = current_clip();
    REQUIRE(test_current_clip == test_rectangle);
    close_window(test_window);
}
TEST_CASE("set_clip_for_bitmap_integration") {
    auto test_bitmap = create_bitmap("test_bitmap", 200, 200);
    auto test_rectangle = rectangle_from(50, 50, 100, 100);
    set_clip(test_bitmap, test_rectangle);
    auto test_current_clip = current_clip(test_bitmap);
    REQUIRE(test_current_clip == test_rectangle);
    free_bitmap(test_bitmap);
}
TEST_CASE("set_clip_for_window_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_rectangle = rectangle_from(100, 100, 200, 200);
    set_clip(test_window, test_rectangle);
    auto test_current_clip = current_clip(test_window);
    REQUIRE(test_current_clip == test_rectangle);
    close_window(test_window);
}
TEST_CASE("option_defaults_integration") {
    auto test_options = option_defaults();
    REQUIRE(test_options != nullptr);
}
TEST_CASE("option_draw_to_bitmap_integration") {
    auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
    auto test_options = option_draw_to(test_bitmap);
    draw_circle(color_black(), circle_at(50.0, 50.0, 25.0), test_options);
    REQUIRE(pixel_drawn_at_point(test_bitmap, 50.0, 50.0));
    REQUIRE_FALSE(pixel_drawn_at_point(test_bitmap, 100.0, 100.0));
    free_bitmap(test_bitmap);
}
TEST_CASE("option_draw_to_bitmap_with_options_integration") {
    auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
    auto test_options = option_defaults();
    auto test_drawing_options = option_draw_to(test_bitmap, test_options);
    draw_circle(color_black(), circle_at(50.0, 50.0, 25.0), test_drawing_options);
    REQUIRE(pixel_drawn_at_point(test_bitmap, 50.0, 50.0));
    REQUIRE_FALSE(pixel_drawn_at_point(test_bitmap, 100.0, 100.0));
    free_bitmap(test_bitmap);
}
TEST_CASE("option_draw_to_window_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_circle = circle_at(400.0, 300.0, 50.0);
    draw_circle(color_black(), test_circle, option_draw_to(test_window));
    refresh_screen();
    REQUIRE(point_in_circle(point_at(400.0, 300.0), test_circle));
    close_window(test_window);
}
TEST_CASE("option_draw_to_window_with_options_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_options = option_defaults();
    auto test_draw_options = option_draw_to(test_window, test_options);
    draw_circle(color_black(), circle_at(400.0, 300.0, 50.0), test_draw_options);
    refresh_screen();
    REQUIRE(point_in_circle(point_at(400.0, 300.0), circle_at(400.0, 300.0, 50.0)));
    close_window(test_window);
}
TEST_CASE("option_flip_x_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_bitmap = load_bitmap("test_bitmap", "test_bitmap.png");
    draw_bitmap(test_bitmap, 100.0, 100.0, option_flip_x());
    refresh_screen();
    REQUIRE(pixel_drawn_at_point(test_bitmap, point_at(50.0, 100.0)));
    REQUIRE_FALSE(pixel_drawn_at_point(test_bitmap, point_at(150.0, 100.0)));
    free_bitmap(test_bitmap);
    close_window(test_window);
}
TEST_CASE("option_flip_x_with_options_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_bitmap = load_bitmap("test_bitmap", "test_bitmap.png");
    draw_bitmap(test_bitmap, 400, 300, option_flip_x(option_defaults()));
    refresh_screen();
    REQUIRE(pixel_drawn_at_point(test_bitmap, point_at(bitmap_width(test_bitmap), bitmap_height(test_bitmap))));
    REQUIRE_FALSE(pixel_drawn_at_point(test_bitmap, point_at(0, bitmap_height(test_bitmap))));
    free_bitmap(test_bitmap);
    close_window(test_window);
}
TEST_CASE("option_flip_xy_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_bitmap = load_bitmap("test_bitmap", "test_bitmap.png");
    draw_bitmap(test_bitmap, 400.0, 300.0, option_flip_xy());
    refresh_screen();
    REQUIRE(pixel_drawn_at_point(test_bitmap, point_at(bitmap_width(test_bitmap), 0.0)));
    REQUIRE(pixel_drawn_at_point(test_bitmap, point_at(0.0, bitmap_height(test_bitmap))));
    free_bitmap(test_bitmap);
    close_window(test_window);
}
TEST_CASE("option_flip_xy_with_options_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_bitmap = load_bitmap("test_bitmap", "test_bitmap.png");
    auto test_options = option_defaults();
    auto test_options_flipped = option_flip_xy(test_options);
    draw_bitmap(test_bitmap, 400, 300, test_options_flipped);
    refresh_screen();
    REQUIRE(pixel_drawn_at_point(test_bitmap, point_at(bitmap_width(test_bitmap), 0)));
    REQUIRE_FALSE(pixel_drawn_at_point(test_bitmap, point_at(0, bitmap_height(test_bitmap))));
    free_bitmap(test_bitmap);
    close_window(test_window);
}
TEST_CASE("option_flip_y_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_bitmap = load_bitmap("test_bitmap", "test_bitmap.png");
    draw_bitmap(test_bitmap, 400.0, 300.0, option_flip_y());
    refresh_screen();
    REQUIRE(pixel_drawn_at_point(test_bitmap, 400.0, bitmap_height(test_bitmap)));
    REQUIRE_FALSE(pixel_drawn_at_point(test_bitmap, 400.0, 0.0));
    free_bitmap(test_bitmap);
    close_window(test_window);
}
TEST_CASE("option_flip_y_with_options_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_bitmap = load_bitmap("test_bitmap", "test_bitmap.png");
    draw_bitmap(test_bitmap, 400.0, 300.0, option_flip_y(option_defaults()));
    refresh_screen();
    REQUIRE(pixel_drawn_at_point(test_bitmap, point_at(400.0, bitmap_height(test_bitmap))));
    REQUIRE_FALSE(pixel_drawn_at_point(test_bitmap, point_at(400.0, 0.0)));
    free_bitmap(test_bitmap);
    close_window(test_window);
}
TEST_CASE("option_line_width_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    draw_line(color_black(), 100.0, 100.0, 200.0, 200.0, option_line_width(1));
    refresh_screen();
    REQUIRE(get_pixel(point_at(100.0, 100.0)) == color_black());
    draw_line(color_black(), 300.0, 300.0, 400.0, 400.0, option_line_width(5));
    refresh_screen();
    REQUIRE(get_pixel(point_at(300.0, 300.0)) == color_black());
    close_window(test_window);
}
TEST_CASE("option_line_width_with_options_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_circle = circle_at(400.0, 300.0, 50.0);
    draw_circle(color_black(), test_circle, option_line_width(3, option_defaults()));
    refresh_screen();
    REQUIRE(point_in_circle(point_at(400.0, 300.0), test_circle));
    close_window(test_window);
}
TEST_CASE("option_part_bmp_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_bitmap = load_bitmap("test_bitmap", "test_bitmap.png");
    auto test_options = option_part_bmp(0.0, 0.0, 50.0, 50.0);
    draw_bitmap(test_bitmap, 100.0, 100.0, test_options);
    refresh_screen();
    REQUIRE(pixel_drawn_at_point(test_bitmap, point_at(25.0, 25.0)));
    REQUIRE_FALSE(pixel_drawn_at_point(test_bitmap, point_at(75.0, 75.0)));
    free_bitmap(test_bitmap);
    close_window(test_window);
}
TEST_CASE("option_part_bmp_with_options_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_bitmap = load_bitmap("test_bitmap", "test_bitmap.png");
    auto test_options = option_part_bmp(10.0, 10.0, 50.0, 50.0, option_defaults());
    draw_bitmap(test_bitmap, 100.0, 100.0, test_options);
    refresh_screen();
    REQUIRE(pixel_drawn_at_point(test_bitmap, point_at(110.0, 110.0)));
    REQUIRE_FALSE(pixel_drawn_at_point(test_bitmap, point_at(160.0, 160.0)));
    free_bitmap(test_bitmap);
    close_window(test_window);
}
TEST_CASE("option_part_bmp_from_rectangle_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_bitmap = load_bitmap("test_bitmap", "test_bitmap.png");
    auto test_rectangle = rectangle_from(100, 100, 200, 200);
    auto test_options = option_part_bmp(test_rectangle);
    draw_bitmap(test_bitmap, 0, 0, test_options);
    refresh_screen();
    REQUIRE(pixel_drawn_at_point(test_bitmap, point_at(150, 150)));
    REQUIRE_FALSE(pixel_drawn_at_point(test_bitmap, point_at(350, 350)));
    free_bitmap(test_bitmap);
    close_window(test_window);
}
TEST_CASE("option_part_bmp_from_rectangle_with_options_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_bitmap = load_bitmap("test_bitmap", "test_bitmap.png");
    auto test_rectangle = rectangle_from(100.0, 100.0, 200.0, 200.0);
    auto test_options = option_part_bmp(test_rectangle, option_defaults());
    draw_bitmap(test_bitmap, 0.0, 0.0, test_options);
    refresh_screen();
    REQUIRE(pixel_drawn_at_point(test_bitmap, point_at(150.0, 150.0)));
    REQUIRE_FALSE(pixel_drawn_at_point(test_bitmap, point_at(350.0, 350.0)));
    free_bitmap(test_bitmap);
    close_window(test_window);
}
TEST_CASE("option_rotate_bmp_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_bitmap = load_bitmap("test_bitmap", "test_bitmap.png");
    draw_bitmap(test_bitmap, 400.0, 300.0, option_rotate_bmp(45.0));
    refresh_screen();
    REQUIRE(pixel_drawn_at_point(test_bitmap, point_at(400.0, 300.0)));
    REQUIRE_FALSE(pixel_drawn_at_point(test_bitmap, point_at(bitmap_width(test_bitmap), 300.0)));
    free_bitmap(test_bitmap);
    close_window(test_window);
}
TEST_CASE("option_rotate_bmp_with_anchor_integration") {
    auto test_window = open_window("Rotation Test", 800, 600);
    auto test_bitmap = load_bitmap("test_bitmap", "test_bitmap.png");
    auto test_options = option_rotate_bmp(45.0, 50.0, 50.0);
    draw_bitmap(test_bitmap, 400.0, 300.0, test_options);
    refresh_screen();
    REQUIRE(pixel_drawn_at_point(test_bitmap, point_at(400.0, 300.0)));
    REQUIRE(pixel_drawn_at_point(test_bitmap, point_at(bitmap_width(test_bitmap), bitmap_height(test_bitmap))));
    free_bitmap(test_bitmap);
    close_window(test_window);
}
TEST_CASE("option_rotate_bmp_with_anchor_and_options_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_bitmap = load_bitmap("test_bitmap", "test_bitmap.png");
    auto test_options = option_rotate_bmp(45.0, 50.0, 50.0, option_defaults());
    draw_bitmap(test_bitmap, 400.0, 300.0, test_options);
    refresh_screen();
    REQUIRE(pixel_drawn_at_point(test_bitmap, point_at(400.0, 300.0)));
    free_bitmap(test_bitmap);
    close_window(test_window);
}
TEST_CASE("option_rotate_bmp_with_options_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_bitmap = load_bitmap("test_bitmap", "test_bitmap.png");
    auto test_options = option_rotate_bmp(45.0, option_defaults());
    draw_bitmap(test_bitmap, 400.0, 300.0, test_options);
    refresh_screen();
    REQUIRE(pixel_drawn_at_point(test_bitmap, point_at(400.0, 300.0)));
    REQUIRE(pixel_drawn_at_point(test_bitmap, point_at(cosine(45.0), sine(45.0))));
    free_bitmap(test_bitmap);
    close_window(test_window);
}
TEST_CASE("option_scale_bmp_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_bitmap = load_bitmap("test_bitmap", "test_bitmap.png");
    draw_bitmap(test_bitmap, 100.0, 100.0, option_scale_bmp(2.0, 2.0));
    refresh_screen();
    REQUIRE(pixel_drawn_at_point(test_bitmap, point_at(100.0, 100.0)));
    REQUIRE(pixel_drawn_at_point(test_bitmap, point_at(bitmap_width(test_bitmap), bitmap_height(test_bitmap))));
    free_bitmap(test_bitmap);
    close_window(test_window);
}
TEST_CASE("option_scale_bmp_with_options_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_bitmap = load_bitmap("test_bitmap", "test_bitmap.png");
    auto test_options = option_scale_bmp(2.0, 2.0, option_defaults());
    draw_bitmap(test_bitmap, 100.0, 100.0, test_options);
    refresh_screen();
    REQUIRE(pixel_drawn_at_point(test_bitmap, point_at(100.0, 100.0)));
    REQUIRE(pixel_drawn_at_point(test_bitmap, point_at(bitmap_width(test_bitmap), bitmap_height(test_bitmap))));
    free_bitmap(test_bitmap);
    close_window(test_window);
}
TEST_CASE("option_to_screen_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_options = option_to_screen();
    draw_circle(color_black(), circle_at(400.0, 300.0, 50.0), test_options);
    refresh_screen();
    REQUIRE(point_in_circle(point_at(400.0, 300.0), circle_at(400.0, 300.0, 50.0)));
    close_window(test_window);
}
TEST_CASE("option_to_screen_with_options_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_options = option_defaults();
    auto test_screen_options = option_to_screen(test_options);
    draw_circle(color_black(), circle_at(400.0, 300.0, 50.0), test_screen_options);
    refresh_screen();
    REQUIRE(point_in_circle(point_at(400.0, 300.0), circle_at(400.0, 300.0, 50.0)));
    close_window(test_window);
}
TEST_CASE("option_to_world_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    move_camera_to(100.0, 100.0);
    draw_circle(color_black(), 100.0, 100.0, 50.0, option_to_world());
    refresh_screen();
    REQUIRE(point_in_circle(point_at(0.0, 0.0), circle_at(100.0, 100.0, 50.0)));
    close_window(test_window);
}
TEST_CASE("option_to_world_with_options_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_options = option_defaults();
    auto test_world_options = option_to_world(test_options);
    draw_circle(color_black(), circle_at(100.0, 100.0, 50.0), test_world_options);
    refresh_screen();
    REQUIRE(point_in_circle(point_at(100.0, 100.0), circle_at(100.0, 100.0, 50.0)));
    close_window(test_window);
}
TEST_CASE("option_with_animation_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
    auto test_animation = create_animation("script", "test_animation");
    draw_bitmap(test_bitmap, 100, 100, option_with_animation(test_animation));
    draw_bitmap(test_bitmap, 100.0, 100.0, option_with_animation(test_animation));
    refresh_screen();
    REQUIRE(pixel_drawn_at_point(test_bitmap, point_at(50.0, 50.0)));
    free_bitmap(test_bitmap);
    free_animation(test_animation);
    close_window(test_window);
}
TEST_CASE("option_with_animation_with_options_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_bitmap = load_bitmap("test_bitmap", "test_bitmap.png");
    auto test_animation = create_animation("script", "test_animation");
    draw_bitmap(test_bitmap, 100, 100, option_with_animation(test_animation));
    auto test_options = option_with_animation(test_animation, option_defaults());
    draw_bitmap(test_bitmap, 100.0, 100.0, test_options);
    refresh_screen();
    REQUIRE(pixel_drawn_at_point(test_bitmap, point_at(100.0, 100.0)));
    free_bitmap(test_bitmap);
    free_animation(test_animation);
    close_window(test_window);
}
TEST_CASE("option_with_bitmap_cell_integration") {
    auto test_bitmap = load_bitmap("test_bitmap", "test_bitmap.png");
    bitmap_set_cell_details(test_bitmap, 32, 32, 4, 4, 16);
    auto test_window = open_window("Test Window", 800, 600);
    draw_bitmap(test_bitmap, 100.0, 100.0, option_with_bitmap_cell(5));
    refresh_screen();
    REQUIRE(pixel_drawn_at_point(test_bitmap, point_at(116.0, 116.0)));
    REQUIRE_FALSE(pixel_drawn_at_point(test_bitmap, point_at(150.0, 150.0)));
    close_window(test_window);
    free_bitmap(test_bitmap);
}
TEST_CASE("option_with_bitmap_cell_with_options_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_bitmap = load_bitmap("test_bitmap", "test_bitmap.png");
    bitmap_set_cell_details(test_bitmap, 32, 32, 4, 4, 16);
    auto test_options = option_with_bitmap_cell(5, option_defaults());
    draw_bitmap(test_bitmap, 100.0, 100.0, test_options);
    refresh_screen();
    REQUIRE(pixel_drawn_at_point(test_bitmap, point_at(116.0, 116.0)));
    REQUIRE_FALSE(pixel_drawn_at_point(test_bitmap, point_at(150.0, 150.0)));
    free_bitmap(test_bitmap);
    close_window(test_window);
}
TEST_CASE("draw_ellipse_within_rectangle_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_rectangle = rectangle_from(100.0, 100.0, 200.0, 150.0);
    draw_ellipse(color_black(), test_rectangle, option_defaults());
    refresh_screen();
    REQUIRE(point_in_circle(point_at(200.0, 175.0), circle_at(rectangle_center(test_rectangle), test_rectangle->width)));
    REQUIRE_FALSE(point_in_circle(point_at(350.0, 175.0), circle_at(rectangle_center(test_rectangle), test_rectangle->width)));
    close_window(test_window);
}
TEST_CASE("draw_ellipse_within_rectangle_with_options_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_rectangle = rectangle_from(100.0, 100.0, 200.0, 100.0);
    draw_ellipse(color_black(), test_rectangle, option_defaults());
    refresh_screen();
    REQUIRE(point_in_circle(point_at(200.0, 150.0), circle_at(rectangle_center(test_rectangle), test_rectangle->width)));
    close_window(test_window);
}
TEST_CASE("draw_ellipse_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    draw_ellipse(color_black(), 400.0, 300.0, 100.0, 50.0);
    refresh_screen();
    REQUIRE(point_in_circle(point_at(400.0, 300.0), circle_at(400.0, 300.0, 50.0)));
    REQUIRE_FALSE(point_in_circle(point_at(550.0, 300.0), circle_at(400.0, 300.0, 50.0)));
    close_window(test_window);
}
TEST_CASE("draw_ellipse_with_options_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    draw_ellipse(color_black(), 400.0, 300.0, 100.0, 50.0, option_defaults());
    refresh_screen();
    REQUIRE(point_in_circle(point_at(400.0, 300.0), circle_at(400.0, 300.0, 50.0)));
    close_window(test_window);
}
TEST_CASE("draw_ellipse_on_bitmap_within_rectangle_integration") {
    auto test_bitmap = create_bitmap("test_bitmap", 200, 200);
    auto test_rectangle = rectangle_from(50.0, 50.0, 100.0, 100.0);
    draw_ellipse_on_bitmap(test_bitmap, color_black(), test_rectangle);
    REQUIRE(pixel_drawn_at_point(test_bitmap, point_at(100.0, 100.0)));
    REQUIRE_FALSE(pixel_drawn_at_point(test_bitmap, point_at(200.0, 200.0)));
    free_bitmap(test_bitmap);
}
TEST_CASE("draw_ellipse_on_bitmap_within_rectangle_with_options_integration") {
    auto test_bitmap = create_bitmap("test_bitmap", 200, 200);
    auto test_rect = rectangle_from(50.0, 50.0, 100.0, 100.0);
    draw_ellipse_on_bitmap(test_bitmap, color_black(), test_rect, option_defaults());
    REQUIRE(pixel_drawn_at_point(test_bitmap, point_at(75.0, 75.0)));
    REQUIRE_FALSE(pixel_drawn_at_point(test_bitmap, point_at(0.0, 0.0)));
    free_bitmap(test_bitmap);
}
TEST_CASE("draw_ellipse_on_bitmap_integration") {
    auto test_bitmap = create_bitmap("test_bitmap", 200, 200);
    auto test_color = color_black();
    draw_ellipse_on_bitmap(test_bitmap, test_color, 100.0, 100.0, 50.0, 30.0);
    REQUIRE(pixel_drawn_at_point(test_bitmap, 100.0, 100.0));
    REQUIRE_FALSE(pixel_drawn_at_point(test_bitmap, 160.0, 100.0));
    free_bitmap(test_bitmap);
}
TEST_CASE("draw_ellipse_on_bitmap_with_options_integration") {
    auto test_bitmap = create_bitmap("test_bitmap", 200, 200);
    draw_ellipse_on_bitmap(test_bitmap, color_black(), 100.0, 100.0, 50.0, 30.0, option_defaults());
    REQUIRE(pixel_drawn_at_point(test_bitmap, point_at(100.0, 100.0)));
    REQUIRE_FALSE(pixel_drawn_at_point(test_bitmap, point_at(150.0, 100.0)));
    free_bitmap(test_bitmap);
}
TEST_CASE("draw_ellipse_on_window_within_rectangle_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_rectangle = rectangle_from(100.0, 100.0, 200.0, 100.0);
    draw_ellipse_on_window(test_window, color_black(), test_rectangle);
    refresh_screen();
    REQUIRE(point_in_circle(point_at(200.0, 150.0), circle_at(rectangle_center(test_rectangle), test_rectangle->width)));
    close_window(test_window);
}
TEST_CASE("draw_ellipse_on_window_within_rectangle_with_options_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_rect = rectangle_from(100.0, 100.0, 200.0, 100.0);
    draw_ellipse_on_window(test_window, color_black(), test_rect, option_defaults());
    refresh_screen();
    REQUIRE(point_in_circle(point_at(200.0, 150.0), circle_at(point_at(200.0, 150.0), 100.0)));
    close_window(test_window);
}
TEST_CASE("draw_ellipse_on_window_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    draw_ellipse_on_window(test_window, color_black(), 400.0, 300.0, 100.0, 50.0);
    refresh_screen();
    REQUIRE(point_in_circle(point_at(400.0, 300.0), circle_at(400.0, 300.0, 50.0)));
    close_window(test_window);
}
TEST_CASE("draw_ellipse_on_window_with_options_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    draw_ellipse_on_window(test_window, color_black(), 400.0, 300.0, 100.0, 50.0, option_defaults());
    refresh_screen();
    REQUIRE(point_in_circle(point_at(400.0, 300.0), circle_at(400.0, 300.0, 50.0)));
    close_window(test_window);
}
TEST_CASE("fill_ellipse_within_rectangle_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_rectangle = rectangle_from(100.0, 100.0, 200.0, 100.0);
    fill_ellipse(color_black(), test_rectangle);
    refresh_screen();
    REQUIRE(point_in_circle(point_at(200.0, 150.0), circle_at(rectangle_center(test_rectangle), test_rectangle->width)));
    REQUIRE_FALSE(point_in_circle(point_at(350.0, 150.0), circle_at(rectangle_center(test_rectangle), test_rectangle->width)));
    close_window(test_window);
}
TEST_CASE("fill_ellipse_within_rectangle_with_options_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_rectangle = rectangle_from(100.0, 100.0, 200.0, 100.0);
    fill_ellipse(color_black(), test_rectangle, option_defaults());
    refresh_screen();
    REQUIRE(point_in_circle(point_at(200.0, 150.0), circle_at(rectangle_center(test_rectangle), test_rectangle->width)));
    close_window(test_window);
}
TEST_CASE("fill_ellipse_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    fill_ellipse(color_black(), 400.0, 300.0, 100.0, 50.0);
    refresh_screen();
    REQUIRE(point_in_circle(point_at(400.0, 300.0), circle_at(400.0, 300.0, 50.0)));
    REQUIRE_FALSE(point_in_circle(point_at(550.0, 300.0), circle_at(400.0, 300.0, 50.0)));
    close_window(test_window);
}
TEST_CASE("fill_ellipse_with_options_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    fill_ellipse(color_black(), 400.0, 300.0, 100.0, 50.0, option_defaults());
    refresh_screen();
    REQUIRE(point_in_circle(point_at(400.0, 300.0), circle_at(400.0, 300.0, 50.0)));
    close_window(test_window);
}
TEST_CASE("fill_ellipse_on_bitmap_within_rectangle_integration") {
    auto test_bitmap = create_bitmap("test_bitmap", 200, 200);
    auto test_rectangle = rectangle_from(50.0, 50.0, 100.0, 100.0);
    fill_ellipse_on_bitmap(test_bitmap, color_black(), test_rectangle);
    REQUIRE(pixel_drawn_at_point(test_bitmap, point_at(100.0, 100.0)));
    REQUIRE_FALSE(pixel_drawn_at_point(test_bitmap, point_at(200.0, 200.0)));
    free_bitmap(test_bitmap);
}
TEST_CASE("fill_ellipse_on_bitmap_within_rectangle_with_options_integration") {
    auto test_bitmap = create_bitmap("test_bitmap", 200, 200);
    auto test_rect = rectangle_from(50.0, 50.0, 100.0, 100.0);
    fill_ellipse_on_bitmap(test_bitmap, color_black(), test_rect, option_defaults());
    REQUIRE(pixel_drawn_at_point(test_bitmap, point_at(100.0, 100.0)));
    REQUIRE_FALSE(pixel_drawn_at_point(test_bitmap, point_at(200.0, 100.0)));
    free_bitmap(test_bitmap);
}
TEST_CASE("fill_ellipse_on_bitmap_integration") {
    auto test_bitmap = create_bitmap("test_bitmap", 200, 200);
    fill_ellipse_on_bitmap(test_bitmap, color_black(), 100.0, 100.0, 50.0, 30.0);
    REQUIRE(pixel_drawn_at_point(test_bitmap, 100.0, 100.0));
    REQUIRE(pixel_drawn_at_point(test_bitmap, 125.0, 100.0));
    REQUIRE_FALSE(pixel_drawn_at_point(test_bitmap, 150.0, 100.0));
    free_bitmap(test_bitmap);
}
TEST_CASE("fill_ellipse_on_bitmap_with_options_integration") {
    auto test_bitmap = create_bitmap("test_bitmap", 200, 200);
    fill_ellipse_on_bitmap(test_bitmap, color_black(), 50.0, 50.0, 100.0, 50.0, option_defaults());
    REQUIRE(pixel_drawn_at_point(test_bitmap, 50.0, 50.0));
    REQUIRE_FALSE(pixel_drawn_at_point(test_bitmap, 150.0, 50.0));
    free_bitmap(test_bitmap);
}
TEST_CASE("fill_ellipse_on_window_within_rectangle_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_rectangle = rectangle_from(100.0, 100.0, 200.0, 150.0);
    fill_ellipse_on_window(test_window, color_black(), test_rectangle);
    refresh_screen();
    REQUIRE(point_in_circle(point_at(200.0, 175.0), circle_at(rectangle_center(test_rectangle), test_rectangle->width)));
    close_window(test_window);
}
TEST_CASE("fill_ellipse_on_window_within_rectangle_with_options_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_rectangle = rectangle_from(100.0, 100.0, 200.0, 150.0);
    fill_ellipse_on_window(test_window, color_black(), test_rectangle, option_defaults());
    refresh_screen();
    REQUIRE(point_in_circle(point_at(200.0, 175.0), circle_at(200.0, 175.0, 100.0)));
    close_window(test_window);
}
TEST_CASE("fill_ellipse_on_window_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    fill_ellipse_on_window(test_window, color_black(), 400.0, 300.0, 100.0, 50.0);
    refresh_screen();
    REQUIRE(point_in_circle(point_at(400.0, 300.0), circle_at(400.0, 300.0, 50.0)));
    close_window(test_window);
}
TEST_CASE("fill_ellipse_on_window_with_options_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    fill_ellipse_on_window(test_window, color_black(), 400.0, 300.0, 100.0, 50.0, option_defaults());
    refresh_screen();
    REQUIRE(point_in_circle(point_at(400.0, 300.0), circle_at(400.0, 300.0, 50.0)));
    close_window(test_window);
}
TEST_CASE("clear_screen_to_white_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    draw_pixel(color_black(), 100.0, 100.0);
    refresh_screen();
    REQUIRE(get_pixel(point_at(100.0, 100.0)) == color_black());
    clear_screen();
    refresh_screen();
    REQUIRE(get_pixel(point_at(100.0, 100.0)) != color_black());
    close_window(test_window);
}
TEST_CASE("clear_screen_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    draw_pixel(color_black(), 100.0, 100.0);
    refresh_screen();
    REQUIRE(get_pixel(point_at(400.0, 300.0)) == color_black());
    clear_screen(color_white());
    refresh_screen();
    REQUIRE(get_pixel(point_at(400.0, 300.0)) != color_black());
    close_window(test_window);
}
TEST_CASE("display_details_integration") {
    auto test_number_of_displays = number_of_displays();
if (REQUIRE(test_number_of_displays > 0);
) {
        auto test_display = display_details(0);
        REQUIRE(test_display != nullptr);
        REQUIRE(display_width(test_display) > 0);
        REQUIRE(display_height(test_display) > 0);
}
    else {
        REQUIRE(test_number_of_displays == 0);
}
}
TEST_CASE("display_height_integration") {
    auto test_display = display_details(0);
    auto test_height = display_height(test_display);
    REQUIRE(test_height > 0);
}
TEST_CASE("display_name_integration") {
    auto test_display = display_details(0);
    auto test_display_name = display_name(test_display);
    REQUIRE(test_display_name != nullptr);
}
TEST_CASE("display_width_integration") {
    auto test_display = display_details(0);
    auto test_width = display_width(test_display);
    REQUIRE(test_width > 0);
}
TEST_CASE("display_x_integration") {
    auto test_display = display_details(0);
    auto test_x = display_x(test_display);
    REQUIRE(test_x > -1);
}
TEST_CASE("display_y_integration") {
    auto test_display = display_details(0);
    auto test_y = display_y(test_display);
    REQUIRE(test_y != -1);
}
TEST_CASE("number_of_displays_integration") {
    auto test_display_count = number_of_displays();
    REQUIRE(test_display_count > 0);
}
TEST_CASE("refresh_screen_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    draw_circle(color_black(), circle_at(400.0, 300.0, 50.0));
    refresh_screen();
    REQUIRE(point_in_circle(point_at(400.0, 300.0), circle_at(400.0, 300.0, 50.0)));
    close_window(test_window);
}
TEST_CASE("refresh_screen_with_target_fps_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    refresh_screen(60);
    REQUIRE(window_close_requested(test_window));
    close_window(test_window);
}
TEST_CASE("save_bitmap_integration") {
    auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
    draw_pixel_on_bitmap(test_bitmap, color_black(), 50, 50);
    save_bitmap(test_bitmap, "test_save");
    free_bitmap(test_bitmap);
}
TEST_CASE("screen_height_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_height = screen_height();
    REQUIRE(test_height == 600);
    close_window(test_window);
}
TEST_CASE("screen_width_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_width = screen_width();
    REQUIRE(test_width == 800);
    close_window(test_window);
}
TEST_CASE("take_screenshot_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    draw_circle(color_black(), 400, 300, 50);
    refresh_screen();
    take_screenshot("screenshot_test");
    close_window(test_window);
}
TEST_CASE("take_screenshot_of_window_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    draw_circle(color_black(), 400, 300, 50);
    refresh_screen();
    take_screenshot(test_window, "screenshot_test");
    close_window(test_window);
}
TEST_CASE("bitmap_bounding_circle_integration") {
    auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
    auto test_point = point_at(50.0, 50.0);
    auto test_circle = bitmap_bounding_circle(test_bitmap, test_point);
    REQUIRE(circle_radius(test_circle) == 50.0);
    REQUIRE(center_point(test_circle) == test_point);
    free_bitmap(test_bitmap);
}
TEST_CASE("bitmap_bounding_rectangle_integration") {
    auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
    auto test_rectangle = bitmap_bounding_rectangle(test_bitmap);
    REQUIRE(test_rectangle->width == bitmap_width(test_bitmap));
    REQUIRE(test_rectangle->height == bitmap_height(test_bitmap));
    free_bitmap(test_bitmap);
}
TEST_CASE("bitmap_bounding_rectangle_at_location_integration") {
    auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
    auto test_rectangle = bitmap_bounding_rectangle(test_bitmap, 50.0, 50.0);
    REQUIRE(rectangle_left(test_rectangle) == 50.0);
    REQUIRE(rectangle_top(test_rectangle) == 50.0);
    REQUIRE(rectangle_right(test_rectangle) == 150.0);
    REQUIRE(rectangle_bottom(test_rectangle) == 150.0);
    free_bitmap(test_bitmap);
}
TEST_CASE("bitmap_cell_center_integration") {
    auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
    auto test_center = bitmap_cell_center(test_bitmap);
    REQUIRE(test_center->x == 50.0);
    REQUIRE(test_center->y == 50.0);
    free_bitmap(test_bitmap);
}
TEST_CASE("bitmap_cell_circle_integration") {
    auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
    auto test_circle = bitmap_cell_circle(test_bitmap, 50.0, 50.0);
    REQUIRE(circle_radius(test_circle) == 50.0);
    REQUIRE(circle_x(test_circle) == 50.0);
    REQUIRE(circle_y(test_circle) == 50.0);
    free_bitmap(test_bitmap);
}
TEST_CASE("bitmap_cell_circle_at_point_integration") {
    auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
    bitmap_set_cell_details(test_bitmap, 50, 50, 2, 2, 4);
    auto test_circle = bitmap_cell_circle(test_bitmap, point_at(100, 100));
    REQUIRE(circle_x(test_circle) == 125);
    REQUIRE(circle_y(test_circle) == 125);
    REQUIRE(circle_radius(test_circle) == 25);
    free_bitmap(test_bitmap);
}
TEST_CASE("bitmap_cell_circle_at_point_with_scale_integration") {
    auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
    bitmap_set_cell_details(test_bitmap, 50, 50, 2, 2, 4);
    auto test_circle = bitmap_cell_circle(test_bitmap, point_at(100.0, 100.0), 2.0);
    REQUIRE(circle_radius(test_circle) == 50.0);
    free_bitmap(test_bitmap);
}
TEST_CASE("bitmap_cell_columns_integration") {
    auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
    bitmap_set_cell_details(test_bitmap, 20, 20, 5, 5, 25);
    REQUIRE(bitmap_cell_columns(test_bitmap) == 5);
    free_bitmap(test_bitmap);
}
TEST_CASE("bitmap_cell_count_integration") {
    auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
    bitmap_set_cell_details(test_bitmap, 20, 20, 5, 5, 25);
    REQUIRE(bitmap_cell_count(test_bitmap) == 25);
    free_bitmap(test_bitmap);
}
TEST_CASE("bitmap_cell_height_integration") {
    auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
    bitmap_set_cell_details(test_bitmap, 20, 20, 5, 5, 25);
    REQUIRE(bitmap_cell_height(test_bitmap) == 20);
    free_bitmap(test_bitmap);
}
TEST_CASE("bitmap_cell_offset_integration") {
    auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
    bitmap_set_cell_details(test_bitmap, 25, 25, 4, 4, 16);
    auto test_offset = bitmap_cell_offset(test_bitmap, 5);
    REQUIRE(test_offset->x == 75);
    REQUIRE(test_offset->y == 0);
    free_bitmap(test_bitmap);
}
TEST_CASE("bitmap_cell_rectangle_integration") {
    auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
    bitmap_set_cell_details(test_bitmap, 25, 25, 4, 4, 16);
    auto test_rectangle = bitmap_cell_rectangle(test_bitmap);
    REQUIRE(test_rectangle->width == 25);
    REQUIRE(test_rectangle->height == 25);
    free_bitmap(test_bitmap);
}
TEST_CASE("bitmap_cell_rectangle_at_point_integration") {
    auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
    bitmap_set_cell_details(test_bitmap, 25, 25, 4, 4, 16);
    auto test_rectangle = bitmap_cell_rectangle(test_bitmap, point_at(50.0, 50.0));
    REQUIRE(rectangle_left(test_rectangle) == 50.0);
    REQUIRE(rectangle_top(test_rectangle) == 50.0);
    REQUIRE(rectangle_right(test_rectangle) == 75.0);
    REQUIRE(rectangle_bottom(test_rectangle) == 75.0);
    free_bitmap(test_bitmap);
}
TEST_CASE("bitmap_cell_rows_integration") {
    auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
    bitmap_set_cell_details(test_bitmap, 20, 20, 5, 5, 25);
    REQUIRE(bitmap_cell_rows(test_bitmap) == 5);
    free_bitmap(test_bitmap);
}
TEST_CASE("bitmap_cell_width_integration") {
    auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
    bitmap_set_cell_details(test_bitmap, 25, 25, 4, 4, 16);
    REQUIRE(bitmap_cell_width(test_bitmap) == 25);
    free_bitmap(test_bitmap);
}
TEST_CASE("bitmap_center_integration") {
    auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
    auto test_center = bitmap_center(test_bitmap);
    REQUIRE(test_center->x == 50.0);
    REQUIRE(test_center->y == 50.0);
    free_bitmap(test_bitmap);
}
TEST_CASE("bitmap_filename_integration") {
    auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
    auto test_filename = bitmap_filename(test_bitmap);
    REQUIRE(test_filename == "");
    free_bitmap(test_bitmap);
}
TEST_CASE("bitmap_height_integration") {
    auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
    auto test_height = bitmap_height(test_bitmap);
    REQUIRE(test_height == 100);
    free_bitmap(test_bitmap);
}
TEST_CASE("bitmap_height_of_bitmap_named_integration") {
    auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
    REQUIRE(bitmap_height("test_bitmap") == 100);
    free_bitmap(test_bitmap);
}
TEST_CASE("bitmap_name_integration") {
    auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
    auto test_bitmap_name = bitmap_name(test_bitmap);
    REQUIRE(test_bitmap_name == "test_bitmap");
    free_bitmap(test_bitmap);
}
TEST_CASE("bitmap_named_integration") {
    auto test_bitmap = load_bitmap("test_bitmap", "test_bitmap.png");
    auto test_named_bitmap = bitmap_named("test_bitmap");
    REQUIRE(test_named_bitmap != nullptr);
    auto test_nonexistent_bitmap = bitmap_named("nonexistent_bitmap");
    REQUIRE(test_nonexistent_bitmap == nullptr);
    free_all_bitmaps();
}
TEST_CASE("bitmap_rectangle_of_cell_integration") {
    auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
    bitmap_set_cell_details(test_bitmap, 25, 25, 4, 4, 16);
    auto test_rectangle = bitmap_rectangle_of_cell(test_bitmap, 5);
    REQUIRE(rectangle_left(test_rectangle) == 0);
    REQUIRE(rectangle_top(test_rectangle) == 75);
    REQUIRE(rectangle_right(test_rectangle) == 25);
    REQUIRE(rectangle_bottom(test_rectangle) == 100);
    free_bitmap(test_bitmap);
}
TEST_CASE("bitmap_set_cell_details_integration") {
    auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
    bitmap_set_cell_details(test_bitmap, 20, 20, 5, 5, 25);
    REQUIRE(bitmap_cell_width(test_bitmap) == 20);
    REQUIRE(bitmap_cell_height(test_bitmap) == 20);
    REQUIRE(bitmap_cell_columns(test_bitmap) == 5);
    REQUIRE(bitmap_cell_rows(test_bitmap) == 5);
    REQUIRE(bitmap_cell_count(test_bitmap) == 25);
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
    auto test_width = bitmap_width(test_bitmap);
    REQUIRE(test_width == 100);
    free_bitmap(test_bitmap);
}
TEST_CASE("bitmap_width_of_bitmap_named_integration") {
    auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
    auto test_window = open_window("Test Window", 800, 600);
    draw_bitmap(bitmap_named("test_bitmap"), 100, 100);
    refresh_screen();
    REQUIRE(bitmap_width("test_bitmap") == 100);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
TEST_CASE("clear_bitmap_integration") {
    auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
    draw_pixel_on_bitmap(test_bitmap, color_black(), 50, 50);
    clear_bitmap(test_bitmap, color_white());
    REQUIRE_FALSE(pixel_drawn_at_point(test_bitmap, 50, 50));
    free_bitmap(test_bitmap);
}
TEST_CASE("clear_bitmap_named_integration") {
    auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
    auto test_window = open_window("Test Window", 800, 600);
    draw_bitmap(test_bitmap, 100.0, 100.0);
    refresh_screen();
    REQUIRE(pixel_drawn_at_point(test_bitmap, 50.0, 50.0));
    clear_bitmap("test_bitmap", color_white());
    refresh_screen();
    REQUIRE_FALSE(pixel_drawn_at_point(test_bitmap, 50.0, 50.0));
    close_window(test_window);
    free_bitmap(test_bitmap);
}
TEST_CASE("create_bitmap_integration") {
    auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
    REQUIRE(test_bitmap != nullptr);
    REQUIRE(bitmap_width(test_bitmap) == 100);
    REQUIRE(bitmap_height(test_bitmap) == 100);
    free_bitmap(test_bitmap);
}
TEST_CASE("draw_bitmap_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
    draw_bitmap(test_bitmap, 100.0, 100.0);
    refresh_screen();
    REQUIRE(pixel_drawn_at_point(test_bitmap, point_at(50.0, 50.0)));
    REQUIRE_FALSE(pixel_drawn_at_point(test_bitmap, point_at(bitmap_width(test_bitmap), bitmap_height(test_bitmap))));
    free_bitmap(test_bitmap);
    close_window(test_window);
}
TEST_CASE("draw_bitmap_with_options_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
    draw_bitmap(test_bitmap, 100.0, 100.0, option_defaults());
    refresh_screen();
    REQUIRE(pixel_drawn_at_point(test_bitmap, point_at(50.0, 50.0)));
    REQUIRE_FALSE(pixel_drawn_at_point(test_bitmap, point_at(150.0, 100.0)));
    free_bitmap(test_bitmap);
    close_window(test_window);
}
TEST_CASE("draw_bitmap_named_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
    draw_bitmap("test_bitmap", 100.0, 100.0);
    refresh_screen();
    REQUIRE(pixel_drawn_at_point(bitmap_named("test_bitmap"), 50.0, 50.0));
    REQUIRE_FALSE(pixel_drawn_at_point(bitmap_named("test_bitmap"), bitmap_width(bitmap_named("test_bitmap")), bitmap_height(bitmap_named("test_bitmap"))));
    free_all_bitmaps();
    close_window(test_window);
}
TEST_CASE("draw_bitmap_named_with_options_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
    draw_bitmap("test_bitmap", 100.0, 100.0, option_defaults());
    refresh_screen();
    REQUIRE(pixel_drawn_at_point(test_bitmap, point_at(50.0, 50.0)));
    REQUIRE_FALSE(pixel_drawn_at_point(test_bitmap, point_at(150.0, 150.0)));
    free_bitmap(test_bitmap);
    close_window(test_window);
}
TEST_CASE("draw_bitmap_on_bitmap_on_bitmap_integration") {
    auto test_destination = create_bitmap("test_destination", 100, 100);
    auto test_source = create_bitmap("test_source", 50, 50);
    draw_bitmap_on_bitmap(test_destination, test_source, 25.0, 25.0);
    REQUIRE(pixel_drawn_at_point(test_destination, point_at(50.0, 50.0)));
    REQUIRE_FALSE(pixel_drawn_at_point(test_destination, point_at(75.0, 75.0)));
    free_bitmap(test_destination);
    free_bitmap(test_source);
}
TEST_CASE("draw_bitmap_on_bitmap_on_bitmap_with_options_integration") {
    auto test_destination = create_bitmap("test_destination", 100, 100);
    auto test_source = create_bitmap("test_source", 50, 50);
    draw_pixel_on_bitmap(test_source, color_black(), point_at(25.0, 25.0));
    draw_bitmap_on_bitmap(test_destination, test_source, 25.0, 25.0, option_defaults());
    REQUIRE(pixel_drawn_at_point(test_destination, point_at(25.0, 25.0)));
    REQUIRE_FALSE(pixel_drawn_at_point(test_destination, point_at(75.0, 75.0)));
    free_bitmap(test_destination);
    free_bitmap(test_source);
}
TEST_CASE("draw_bitmap_on_window_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
    draw_bitmap_on_window(test_window, test_bitmap, 100.0, 100.0);
    refresh_screen();
    REQUIRE(pixel_drawn_at_point(test_bitmap, point_at(50.0, 50.0)));
    REQUIRE_FALSE(pixel_drawn_at_point(test_bitmap, point_at(150.0, 150.0)));
    free_bitmap(test_bitmap);
    close_window(test_window);
}
TEST_CASE("draw_bitmap_on_window_with_options_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
    draw_bitmap_on_window(test_window, test_bitmap, 100.0, 100.0, option_defaults());
    refresh_screen();
    REQUIRE(pixel_drawn_at_point(test_bitmap, point_at(50.0, 50.0)));
    REQUIRE_FALSE(pixel_drawn_at_point(test_bitmap, point_at(150.0, 100.0)));
    free_bitmap(test_bitmap);
    close_window(test_window);
}
TEST_CASE("free_all_bitmaps_integration") {
    auto test_bitmap_1 = create_bitmap("test_bitmap_1", 100, 100);
    auto test_bitmap_2 = create_bitmap("test_bitmap_2", 100, 100);
    free_all_bitmaps();
    REQUIRE_FALSE(bitmap_valid(test_bitmap_1));
    REQUIRE_FALSE(bitmap_valid(test_bitmap_2));
}
TEST_CASE("free_bitmap_integration") {
    auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
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
    auto test_window = open_window("Test Window", 800, 600);
    auto test_bitmap = load_bitmap("test_bitmap", "test_bitmap.png");
    draw_bitmap(test_bitmap, 100.0, 100.0);
    refresh_screen();
    REQUIRE(pixel_drawn_at_point(test_bitmap, point_at(100.0, 100.0)));
    REQUIRE_FALSE(pixel_drawn_at_point(test_bitmap, point_at(bitmap_width(test_bitmap), bitmap_height(test_bitmap))));
    free_bitmap(test_bitmap);
    close_window(test_window);
}
TEST_CASE("pixel_drawn_at_point_pt_integration") {
    auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
    draw_pixel_on_bitmap(test_bitmap, color_black(), point_at(50.0, 50.0));
    REQUIRE(pixel_drawn_at_point(test_bitmap, point_at(50.0, 50.0)));
    REQUIRE_FALSE(pixel_drawn_at_point(test_bitmap, point_at(75.0, 75.0)));
    free_bitmap(test_bitmap);
}
TEST_CASE("pixel_drawn_at_point_integration") {
    auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
    draw_pixel_on_bitmap(test_bitmap, color_black(), 50.0, 50.0);
    REQUIRE(pixel_drawn_at_point(test_bitmap, 50.0, 50.0));
    REQUIRE_FALSE(pixel_drawn_at_point(test_bitmap, 75.0, 75.0));
    free_bitmap(test_bitmap);
}
TEST_CASE("pixel_drawn_at_point_in_cell_pt_integration") {
    auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
    draw_pixel_on_bitmap(test_bitmap, color_black(), point_at(50.0, 50.0));
    bitmap_set_cell_details(test_bitmap, 100, 100, 1, 1, 1);
    REQUIRE(pixel_drawn_at_point(test_bitmap, 0, point_at(50.0, 50.0)));
    REQUIRE_FALSE(pixel_drawn_at_point(test_bitmap, 0, point_at(75.0, 50.0)));
    free_bitmap(test_bitmap);
}
TEST_CASE("pixel_drawn_at_point_in_cell_integration") {
    auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
    draw_pixel(color_black(), point_at(50.0, 50.0));
    auto test_window = open_window("Test Window", 800, 600);
    draw_bitmap(test_bitmap, 100.0, 100.0);
    refresh_screen();
    REQUIRE(pixel_drawn_at_point(test_bitmap, 0, point_at(50.0, 50.0)));
    REQUIRE_FALSE(pixel_drawn_at_point(test_bitmap, 0, point_at(75.0, 75.0)));
    free_bitmap(test_bitmap);
    close_window(test_window);
}
TEST_CASE("setup_collision_mask_integration") {
    auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
    setup_collision_mask(test_bitmap);
    auto test_pixel_drawn = pixel_drawn_at_point(test_bitmap, point_at(50, 50));
    REQUIRE(test_pixel_drawn);
    free_bitmap(test_bitmap);
}
TEST_CASE("draw_line_record_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_line = line_from(point_at(100.0, 100.0), point_at(200.0, 200.0));
    draw_line(color_black(), test_line);
    refresh_screen();
    REQUIRE(get_pixel(point_at(100.0, 100.0)) == color_black());
    REQUIRE(get_pixel(point_at(99.0, 99.0)) != color_black());
    close_window(test_window);
}
TEST_CASE("draw_line_record_with_options_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_line = line_from(point_at(100.0, 100.0), point_at(200.0, 200.0));
    draw_line(color_black(), test_line, option_line_width(3, option_defaults()));
    refresh_screen();
    REQUIRE(get_pixel(point_at(100.0, 100.0)) == color_black());
    REQUIRE(get_pixel(point_at(99.0, 99.0)) != color_black());
    close_window(test_window);
}
TEST_CASE("draw_line_point_to_point_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    draw_line(color_black(), point_at(100.0, 100.0), point_at(200.0, 200.0));
    refresh_screen();
    REQUIRE(get_pixel(point_at(100.0, 100.0)) == color_black());
    REQUIRE(get_pixel(point_at(99.0, 99.0)) != color_black());
    close_window(test_window);
}
TEST_CASE("draw_line_point_to_point_with_options_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    draw_line(color_black(), point_at(100.0, 100.0), point_at(200.0, 200.0), option_defaults());
    refresh_screen();
    REQUIRE(get_pixel(point_at(100.0, 100.0)) == color_black());
    REQUIRE(get_pixel(point_at(99.0, 99.0)) != color_black());
    close_window(test_window);
}
TEST_CASE("draw_line_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    draw_line(color_black(), 100.0, 100.0, 200.0, 200.0);
    refresh_screen();
    REQUIRE(get_pixel(point_at(100.0, 100.0)) == color_black());
    REQUIRE(get_pixel(point_at(99.0, 99.0)) != color_black());
    close_window(test_window);
}
TEST_CASE("draw_line_with_options_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    draw_line(color_black(), 100.0, 100.0, 200.0, 200.0, option_defaults());
    refresh_screen();
    REQUIRE(get_pixel(point_at(100.0, 100.0)) == color_black());
    REQUIRE(get_pixel(point_at(99.0, 99.0)) != color_black());
    close_window(test_window);
}
TEST_CASE("draw_line_on_bitmap_record_integration") {
    auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
    auto test_line = line_from(point_at(10.0, 10.0), point_at(90.0, 90.0));
    draw_line_on_bitmap(test_bitmap, color_black(), test_line);
    REQUIRE(pixel_drawn_at_point(test_bitmap, point_at(50.0, 50.0)));
    REQUIRE_FALSE(pixel_drawn_at_point(test_bitmap, point_at(100.0, 100.0)));
    free_bitmap(test_bitmap);
}
TEST_CASE("draw_line_on_bitmap_record_with_options_integration") {
    auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
    auto test_line = line_from(point_at(10.0, 10.0), point_at(90.0, 90.0));
    draw_line_on_bitmap(test_bitmap, color_black(), test_line, option_defaults());
    REQUIRE(pixel_drawn_at_point(test_bitmap, point_at(50.0, 50.0)));
    REQUIRE_FALSE(pixel_drawn_at_point(test_bitmap, point_at(95.0, 50.0)));
    free_bitmap(test_bitmap);
}
TEST_CASE("draw_line_on_bitmap_point_to_point_integration") {
    auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
    draw_line_on_bitmap(test_bitmap, color_black(), point_at(10.0, 10.0), point_at(90.0, 90.0));
    REQUIRE(pixel_drawn_at_point(test_bitmap, 50.0, 50.0));
    REQUIRE_FALSE(pixel_drawn_at_point(test_bitmap, 0.0, 0.0));
    free_bitmap(test_bitmap);
}
TEST_CASE("draw_line_on_bitmap_point_to_point_with_options_integration") {
    auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
    auto test_from_pt = point_at(10.0, 10.0);
    auto test_to_pt = point_at(90.0, 90.0);
    draw_line_on_bitmap(test_bitmap, color_black(), test_from_pt, test_to_pt, option_defaults());
    REQUIRE(pixel_drawn_at_point(test_bitmap, 10.0, 10.0));
    REQUIRE(pixel_drawn_at_point(test_bitmap, 90.0, 90.0));
    REQUIRE_FALSE(pixel_drawn_at_point(test_bitmap, 5.0, 5.0));
    free_bitmap(test_bitmap);
}
TEST_CASE("draw_line_on_bitmap_integration") {
    auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
    auto test_color = color_black();
    draw_line_on_bitmap(test_bitmap, test_color, 10.0, 10.0, 90.0, 90.0);
    REQUIRE(pixel_drawn_at_point(test_bitmap, 50.0, 50.0));
    REQUIRE_FALSE(pixel_drawn_at_point(test_bitmap, 95.0, 50.0));
    free_bitmap(test_bitmap);
}
TEST_CASE("draw_line_on_bitmap_with_options_integration") {
    auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
    draw_line_on_bitmap(test_bitmap, color_black(), 10.0, 10.0, 90.0, 90.0, option_defaults());
    REQUIRE(pixel_drawn_at_point(test_bitmap, point_at(50.0, 50.0)));
    REQUIRE_FALSE(pixel_drawn_at_point(test_bitmap, point_at(5.0, 5.0)));
    free_bitmap(test_bitmap);
}
TEST_CASE("draw_line_on_window_record_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_line = line_from(point_at(100.0, 100.0), point_at(700.0, 500.0));
    draw_line_on_window(test_window, color_black(), test_line);
    refresh_screen();
    REQUIRE(get_pixel(test_window, point_at(100.0, 100.0)) == color_black());
    REQUIRE(get_pixel(test_window, point_at(99.0, 99.0)) != color_black());
    close_window(test_window);
}
TEST_CASE("draw_line_on_window_record_with_options_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_line = line_from(point_at(100.0, 100.0), point_at(200.0, 200.0));
    draw_line_on_window(test_window, color_black(), test_line, option_defaults());
    refresh_screen();
    REQUIRE(get_pixel(test_window, point_at(100.0, 100.0)) == color_black());
    REQUIRE(get_pixel(test_window, point_at(99.0, 99.0)) != color_black());
    close_window(test_window);
}
TEST_CASE("draw_line_on_window_point_to_point_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    draw_line_on_window(test_window, color_black(), point_at(100.0, 100.0), point_at(200.0, 200.0));
    refresh_screen();
    REQUIRE(get_pixel(test_window, 100.0, 100.0) == color_black());
    REQUIRE(get_pixel(test_window, 99.0, 99.0) != color_black());
    close_window(test_window);
}
TEST_CASE("draw_line_on_window_point_to_point_with_options_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    draw_line_on_window(test_window, color_black(), point_at(100.0, 100.0), point_at(200.0, 200.0), option_defaults());
    refresh_screen();
    REQUIRE(get_pixel(test_window, 100.0, 100.0) == color_black());
    REQUIRE(get_pixel(test_window, 99.0, 99.0) != color_black());
    close_window(test_window);
}
TEST_CASE("draw_line_on_window_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    draw_line_on_window(test_window, color_black(), 100.0, 100.0, 200.0, 200.0);
    refresh_screen();
    REQUIRE(get_pixel(test_window, 100.0, 100.0) == color_black());
    REQUIRE(get_pixel(test_window, 99.0, 99.0) != color_black());
    close_window(test_window);
}
TEST_CASE("draw_line_on_window_with_options_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    draw_line_on_window(test_window, color_black(), 100.0, 100.0, 200.0, 200.0, option_defaults());
    refresh_screen();
    REQUIRE(get_pixel(test_window, 100.0, 100.0) == color_black());
    REQUIRE(get_pixel(test_window, 99.0, 99.0) != color_black());
    close_window(test_window);
}
TEST_CASE("draw_pixel_at_point_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    draw_pixel(color_black(), point_at(100.0, 100.0));
    refresh_screen();
    REQUIRE(get_pixel(point_at(100.0, 100.0)) == color_black());
    REQUIRE(get_pixel(point_at(99.0, 99.0)) != color_black());
    close_window(test_window);
}
TEST_CASE("draw_pixel_at_point_with_options_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    draw_pixel(color_black(), point_at(100.0, 100.0), option_defaults());
    refresh_screen();
    REQUIRE(get_pixel(point_at(100.0, 100.0)) == color_black());
    REQUIRE(get_pixel(point_at(100.0, 100.0)) == color_black());
    REQUIRE(get_pixel(point_at(99.0, 99.0)) != color_black());
    close_window(test_window);
}
TEST_CASE("draw_pixel_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    draw_pixel(color_black(), 100.0, 100.0);
    refresh_screen();
    REQUIRE(get_pixel(point_at(100.0, 100.0)) == color_black());
    REQUIRE(get_pixel(point_at(99.0, 99.0)) != color_black());
    close_window(test_window);
}
TEST_CASE("draw_pixel_with_options_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    draw_pixel(color_black(), 100.0, 100.0, option_defaults());
    refresh_screen();
    REQUIRE(get_pixel(point_at(100.0, 100.0)) == color_black());
    REQUIRE(get_pixel(point_at(99.0, 99.0)) != color_black());
    close_window(test_window);
}
TEST_CASE("draw_pixel_on_bitmap_at_point_integration") {
    auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
    auto test_color = color_black();
    auto test_point = point_at(50.0, 50.0);
    draw_pixel_on_bitmap(test_bitmap, test_color, test_point);
    REQUIRE(pixel_drawn_at_point(test_bitmap, test_point));
    REQUIRE_FALSE(pixel_drawn_at_point(test_bitmap, point_at(0.0, 0.0)));
    free_bitmap(test_bitmap);
}
TEST_CASE("draw_pixel_on_bitmap_at_point_with_options_integration") {
    auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
    auto test_color = color_black();
    auto test_point = point_at(50.0, 50.0);
    draw_pixel_on_bitmap(test_bitmap, test_color, test_point, option_defaults());
    REQUIRE(pixel_drawn_at_point(test_bitmap, test_point));
    REQUIRE_FALSE(pixel_drawn_at_point(test_bitmap, point_at(0.0, 0.0)));
    free_bitmap(test_bitmap);
}
TEST_CASE("draw_pixel_on_bitmap_integration") {
    auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
    auto test_color = color_black();
    draw_pixel_on_bitmap(test_bitmap, test_color, 50.0, 50.0);
    REQUIRE(pixel_drawn_at_point(test_bitmap, 50.0, 50.0));
    REQUIRE_FALSE(pixel_drawn_at_point(test_bitmap, 51.0, 50.0));
    free_bitmap(test_bitmap);
}
TEST_CASE("draw_pixel_on_bitmap_with_options_integration") {
    auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
    auto test_color = color_black();
    draw_pixel_on_bitmap(test_bitmap, test_color, 50.0, 50.0, option_defaults());
    REQUIRE(pixel_drawn_at_point(test_bitmap, 50.0, 50.0));
    REQUIRE_FALSE(pixel_drawn_at_point(test_bitmap, 51.0, 50.0));
    free_bitmap(test_bitmap);
}
TEST_CASE("draw_pixel_on_window_at_point_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_color = color_black();
    auto test_point = point_at(100.0, 100.0);
    draw_pixel_on_window(test_window, test_color, test_point);
    refresh_screen();
    REQUIRE(get_pixel(point_at(100.0, 100.0)) == color_black());
    REQUIRE(get_pixel(point_at(99.0, 99.0)) != color_black());
    close_window(test_window);
}
TEST_CASE("draw_pixel_on_window_at_point_with_options_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_point = point_at(100.0, 100.0);
    draw_pixel_on_window(test_window, color_black(), test_point, option_defaults());
    refresh_screen();
    REQUIRE(get_pixel(point_at(100.0, 100.0)) == color_black());
    REQUIRE(get_pixel(point_at(99.0, 99.0)) != color_black());
    close_window(test_window);
}
TEST_CASE("draw_pixel_on_window_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    draw_pixel_on_window(test_window, color_black(), 100.0, 100.0);
    refresh_screen();
    REQUIRE(get_pixel(point_at(100.0, 100.0)) == color_black());
    REQUIRE(get_pixel(point_at(99.0, 99.0)) != color_black());
    close_window(test_window);
}
TEST_CASE("draw_pixel_on_window_with_options_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    draw_pixel_on_window(test_window, color_black(), 100.0, 100.0, option_defaults());
    refresh_screen();
    REQUIRE(get_pixel(point_at(100.0, 100.0)) == color_black());
    REQUIRE(get_pixel(point_at(99.0, 99.0)) != color_black());
    close_window(test_window);
}
TEST_CASE("get_pixel_from_bitmap_at_point_integration") {
    auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
    draw_pixel_on_bitmap(test_bitmap, color_black(), point_at(50.0, 50.0));
    auto test_color = get_pixel(test_bitmap, point_at(50.0, 50.0));
    REQUIRE(color_black() == test_color);
    free_bitmap(test_bitmap);
}
TEST_CASE("get_pixel_from_bitmap_integration") {
    auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
    draw_pixel_on_bitmap(test_bitmap, color_black(), 50.0, 50.0);
    auto test_pixel_color = get_pixel(test_bitmap, 50.0, 50.0);
    REQUIRE(test_pixel_color == color_black());
    free_bitmap(test_bitmap);
}
TEST_CASE("get_pixel_at_point_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    draw_pixel(color_black(), point_at(100.0, 100.0));
    refresh_screen();
    REQUIRE(get_pixel(point_at(100.0, 100.0)) == color_black());
    close_window(test_window);
}
TEST_CASE("get_pixel_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    draw_pixel(color_black(), 100.0, 100.0);
    refresh_screen();
    REQUIRE(get_pixel(100.0, 100.0) == color_black());
    close_window(test_window);
}
TEST_CASE("get_pixel_from_window_at_point_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    draw_pixel(color_black(), point_at(100.0, 100.0));
    refresh_screen();
    REQUIRE(get_pixel(test_window, point_at(100.0, 100.0)) == color_black());
    close_window(test_window);
}
TEST_CASE("get_pixel_from_window_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    draw_pixel(color_black(), 100.0, 100.0);
    refresh_screen();
    REQUIRE(get_pixel(test_window, 100.0, 100.0) == color_black());
    close_window(test_window);
}
TEST_CASE("get_pixel_from_window_at_point_from_window_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    draw_pixel(color_black(), point_at(100.0, 100.0));
    refresh_screen();
    auto test_pixel = get_pixel_from_window(test_window, point_at(100.0, 100.0));
    REQUIRE(color_black() == test_pixel);
    close_window(test_window);
}
TEST_CASE("get_pixel_from_window_from_window_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    draw_pixel(color_black(), 100.0, 100.0);
    refresh_screen();
    auto test_pixel_color = get_pixel(test_window, 100.0, 100.0);
    REQUIRE(color_black() == test_pixel_color);
    close_window(test_window);
}
TEST_CASE("draw_quad_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_quad = quad_from(point_at(100.0, 100.0), point_at(200.0, 100.0), point_at(100.0, 200.0), point_at(200.0, 200.0));
    draw_quad(color_black(), test_quad);
    refresh_screen();
    REQUIRE(point_in_quad(point_at(150.0, 150.0), test_quad));
    REQUIRE_FALSE(point_in_quad(point_at(250.0, 250.0), test_quad));
    close_window(test_window);
}
TEST_CASE("draw_quad_with_options_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_quad = quad_from(point_at(100.0, 100.0), point_at(200.0, 100.0), point_at(100.0, 200.0), point_at(200.0, 200.0));
    draw_quad(color_black(), test_quad, option_defaults());
    refresh_screen();
    REQUIRE(point_in_quad(point_at(150.0, 150.0), test_quad));
    close_window(test_window);
}
TEST_CASE("draw_quad_on_bitmap_integration") {
    auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
    auto test_quad = quad_from(point_at(10.0, 10.0), point_at(90.0, 10.0), point_at(10.0, 90.0), point_at(90.0, 90.0));
    draw_quad_on_bitmap(test_bitmap, color_black(), test_quad);
    REQUIRE(pixel_drawn_at_point(test_bitmap, point_at(50.0, 50.0)));
    REQUIRE_FALSE(pixel_drawn_at_point(test_bitmap, point_at(100.0, 100.0)));
    free_bitmap(test_bitmap);
}
TEST_CASE("draw_quad_on_bitmap_with_options_integration") {
    auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
    auto test_quad = quad_from(point_at(10.0, 10.0), point_at(90.0, 10.0), point_at(90.0, 90.0), point_at(10.0, 90.0));
    draw_quad_on_bitmap(test_bitmap, color_black(), test_quad, option_defaults());
    REQUIRE(pixel_drawn_at_point(test_bitmap, point_at(50.0, 50.0)));
    REQUIRE_FALSE(pixel_drawn_at_point(test_bitmap, point_at(101.0, 50.0)));
    free_bitmap(test_bitmap);
}
TEST_CASE("draw_quad_on_window_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_quad = quad_from(point_at(100.0, 100.0), point_at(200.0, 100.0), point_at(100.0, 200.0), point_at(200.0, 200.0));
    draw_quad_on_window(test_window, color_black(), test_quad);
    refresh_screen();
    REQUIRE(point_in_quad(point_at(150.0, 150.0), test_quad));
    close_window(test_window);
}
TEST_CASE("draw_quad_on_window_with_options_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_quad = quad_from(point_at(100.0, 100.0), point_at(200.0, 100.0), point_at(100.0, 200.0), point_at(200.0, 200.0));
    draw_quad_on_window(test_window, color_black(), test_quad, option_defaults());
    refresh_screen();
    REQUIRE(point_in_quad(point_at(150.0, 150.0), test_quad));
    close_window(test_window);
}
TEST_CASE("draw_rectangle_record_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_rectangle = rectangle_from(100.0, 100.0, 200.0, 150.0);
    draw_rectangle(color_black(), test_rectangle);
    refresh_screen();
    REQUIRE(point_in_rectangle(point_at(150.0, 125.0), test_rectangle));
    REQUIRE_FALSE(point_in_rectangle(point_at(301.0, 251.0), test_rectangle));
    close_window(test_window);
}
TEST_CASE("draw_rectangle_record_with_options_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_rectangle = rectangle_from(100.0, 100.0, 200.0, 150.0);
    draw_rectangle(color_black(), test_rectangle, option_defaults());
    refresh_screen();
    REQUIRE(point_in_rectangle(point_at(150.0, 125.0), test_rectangle));
    REQUIRE_FALSE(point_in_rectangle(point_at(350.0, 300.0), test_rectangle));
    close_window(test_window);
}
TEST_CASE("draw_rectangle_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    draw_rectangle(color_black(), 100.0, 100.0, 200.0, 150.0);
    refresh_screen();
    REQUIRE(point_in_rectangle(point_at(150.0, 125.0), rectangle_from(100.0, 100.0, 200.0, 150.0)));
    REQUIRE_FALSE(point_in_rectangle(point_at(301.0, 251.0), rectangle_from(100.0, 100.0, 200.0, 150.0)));
    close_window(test_window);
}
TEST_CASE("draw_rectangle_with_options_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    draw_rectangle(color_black(), 100.0, 100.0, 200.0, 150.0, option_line_width(3, option_defaults()));
    refresh_screen();
    REQUIRE(point_in_rectangle(point_at(150.0, 125.0), rectangle_from(100.0, 100.0, 200.0, 150.0)));
    REQUIRE_FALSE(point_in_rectangle(point_at(301.0, 251.0), rectangle_from(100.0, 100.0, 200.0, 150.0)));
    close_window(test_window);
}
TEST_CASE("draw_rectangle_on_bitmap_record_integration") {
    auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
    auto test_rectangle = rectangle_from(50.0, 50.0, 20.0, 30.0);
    draw_rectangle_on_bitmap(test_bitmap, color_black(), test_rectangle);
    REQUIRE(pixel_drawn_at_point(test_bitmap, point_at(50.0, 50.0)));
    REQUIRE_FALSE(pixel_drawn_at_point(test_bitmap, point_at(80.0, 90.0)));
    free_bitmap(test_bitmap);
}
TEST_CASE("draw_rectangle_on_bitmap_record_with_options_integration") {
    auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
    auto test_rectangle = rectangle_from(50.0, 50.0, 20.0, 20.0);
    draw_rectangle_on_bitmap(test_bitmap, color_black(), test_rectangle, option_defaults());
    REQUIRE(pixel_drawn_at_point(test_bitmap, point_at(50.0, 50.0)));
    REQUIRE_FALSE(pixel_drawn_at_point(test_bitmap, point_at(75.0, 75.0)));
    free_bitmap(test_bitmap);
}
TEST_CASE("draw_rectangle_on_bitmap_integration") {
    auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
    draw_rectangle_on_bitmap(test_bitmap, color_black(), 50.0, 50.0, 20.0, 20.0);
    REQUIRE(pixel_drawn_at_point(test_bitmap, 50.0, 50.0));
    REQUIRE_FALSE(pixel_drawn_at_point(test_bitmap, 75.0, 75.0));
    free_bitmap(test_bitmap);
}
TEST_CASE("draw_rectangle_on_bitmap_with_options_integration") {
    auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
    draw_rectangle_on_bitmap(test_bitmap, color_black(), 50.0, 50.0, 20.0, 20.0, option_defaults());
    REQUIRE(pixel_drawn_at_point(test_bitmap, 50.0, 50.0));
    REQUIRE_FALSE(pixel_drawn_at_point(test_bitmap, 75.0, 75.0));
    free_bitmap(test_bitmap);
}
TEST_CASE("draw_rectangle_on_window_record_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_rectangle = rectangle_from(100.0, 100.0, 50.0, 50.0);
    draw_rectangle_on_window(test_window, color_black(), test_rectangle);
    refresh_screen();
    REQUIRE(point_in_rectangle(point_at(125.0, 125.0), test_rectangle));
    REQUIRE_FALSE(point_in_rectangle(point_at(200.0, 200.0), test_rectangle));
    close_window(test_window);
}
TEST_CASE("draw_rectangle_on_window_record_with_options_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_rectangle = rectangle_from(100.0, 100.0, 50.0, 50.0);
    draw_rectangle_on_window(test_window, color_black(), test_rectangle, option_defaults());
    refresh_screen();
    REQUIRE(point_in_rectangle(point_at(125.0, 125.0), test_rectangle));
    REQUIRE_FALSE(point_in_rectangle(point_at(175.0, 175.0), test_rectangle));
    close_window(test_window);
}
TEST_CASE("draw_rectangle_on_window_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    draw_rectangle_on_window(test_window, color_black(), 100.0, 100.0, 50.0, 50.0);
    refresh_screen();
    REQUIRE(point_in_rectangle(point_at(100.0, 100.0), rectangle_from(100.0, 100.0, 50.0, 50.0)));
    REQUIRE_FALSE(point_in_rectangle(point_at(200.0, 200.0), rectangle_from(100.0, 100.0, 50.0, 50.0)));
    close_window(test_window);
}
TEST_CASE("draw_rectangle_on_window_with_options_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_rectangle = rectangle_from(100.0, 100.0, 50.0, 50.0);
    draw_rectangle_on_window(test_window, color_black(), test_rectangle, option_defaults());
    refresh_screen();
    REQUIRE(point_in_rectangle(point_at(125.0, 125.0), test_rectangle));
    REQUIRE_FALSE(point_in_rectangle(point_at(200.0, 200.0), test_rectangle));
    close_window(test_window);
}
TEST_CASE("fill_quad_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_quad = quad_from(point_at(100.0, 100.0), point_at(300.0, 100.0), point_at(100.0, 300.0), point_at(300.0, 300.0));
    fill_quad(color_black(), test_quad);
    refresh_screen();
    REQUIRE(point_in_quad(point_at(200.0, 200.0), test_quad));
    REQUIRE_FALSE(point_in_quad(point_at(400.0, 400.0), test_quad));
    close_window(test_window);
}
TEST_CASE("fill_quad_with_options_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_quad = quad_from(point_at(100.0, 100.0), point_at(300.0, 100.0), point_at(100.0, 300.0), point_at(300.0, 300.0));
    fill_quad(color_black(), test_quad, option_defaults());
    refresh_screen();
    REQUIRE(point_in_quad(point_at(200.0, 200.0), test_quad));
    REQUIRE_FALSE(point_in_quad(point_at(400.0, 400.0), test_quad));
    close_window(test_window);
}
TEST_CASE("fill_quad_on_bitmap_integration") {
    auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
    auto test_quad = quad_from(point_at(10.0, 10.0), point_at(90.0, 10.0), point_at(10.0, 90.0), point_at(90.0, 90.0));
    fill_quad_on_bitmap(test_bitmap, color_black(), test_quad);
    REQUIRE(pixel_drawn_at_point(test_bitmap, point_at(50.0, 50.0)));
    REQUIRE_FALSE(pixel_drawn_at_point(test_bitmap, point_at(0.0, 0.0)));
    free_bitmap(test_bitmap);
}
TEST_CASE("fill_quad_on_bitmap_with_options_integration") {
    auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
    auto test_quad = quad_from(point_at(10.0, 10.0), point_at(90.0, 10.0), point_at(90.0, 90.0), point_at(10.0, 90.0));
    fill_quad_on_bitmap(test_bitmap, color_black(), test_quad, option_defaults());
    REQUIRE(pixel_drawn_at_point(test_bitmap, point_at(50.0, 50.0)));
    REQUIRE_FALSE(pixel_drawn_at_point(test_bitmap, point_at(101.0, 50.0)));
    free_bitmap(test_bitmap);
}
TEST_CASE("fill_quad_on_window_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_quad = quad_from(point_at(100.0, 100.0), point_at(200.0, 100.0), point_at(100.0, 200.0), point_at(200.0, 200.0));
    fill_quad_on_window(test_window, color_black(), test_quad);
    refresh_screen();
    REQUIRE(point_in_quad(point_at(150.0, 150.0), test_quad));
    close_window(test_window);
}
TEST_CASE("fill_quad_on_window_with_options_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_quad = quad_from(point_at(100.0, 100.0), point_at(200.0, 100.0), point_at(200.0, 200.0), point_at(100.0, 200.0));
    fill_quad_on_window(test_window, color_black(), test_quad, option_defaults());
    refresh_screen();
    REQUIRE(point_in_quad(point_at(150.0, 150.0), test_quad));
    REQUIRE_FALSE(point_in_quad(point_at(250.0, 150.0), test_quad));
    close_window(test_window);
}
TEST_CASE("fill_rectangle_record_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_rectangle = rectangle_from(100.0, 100.0, 200.0, 150.0);
    fill_rectangle(color_black(), test_rectangle);
    refresh_screen();
    REQUIRE(point_in_rectangle(point_at(150.0, 125.0), test_rectangle));
    REQUIRE_FALSE(point_in_rectangle(point_at(350.0, 275.0), test_rectangle));
    close_window(test_window);
}
TEST_CASE("fill_rectangle_record_with_options_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_rectangle = rectangle_from(100.0, 100.0, 200.0, 150.0);
    fill_rectangle(color_black(), test_rectangle, option_defaults());
    refresh_screen();
    REQUIRE(point_in_rectangle(point_at(150.0, 125.0), test_rectangle));
    REQUIRE_FALSE(point_in_rectangle(point_at(350.0, 275.0), test_rectangle));
    close_window(test_window);
}
TEST_CASE("fill_rectangle_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    fill_rectangle(color_black(), 100.0, 100.0, 200.0, 150.0);
    refresh_screen();
    REQUIRE(point_in_rectangle(point_at(150.0, 125.0), rectangle_from(100.0, 100.0, 200.0, 150.0)));
    REQUIRE_FALSE(point_in_rectangle(point_at(301.0, 251.0), rectangle_from(100.0, 100.0, 200.0, 150.0)));
    close_window(test_window);
}
TEST_CASE("fill_rectangle_with_options_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    fill_rectangle(color_black(), 100.0, 100.0, 200.0, 150.0, option_defaults());
    refresh_screen();
    REQUIRE(point_in_rectangle(point_at(150.0, 125.0), rectangle_from(100.0, 100.0, 200.0, 150.0)));
    REQUIRE_FALSE(point_in_rectangle(point_at(301.0, 251.0), rectangle_from(100.0, 100.0, 200.0, 150.0)));
    close_window(test_window);
}
TEST_CASE("fill_rectangle_on_bitmap_record_integration") {
    auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
    auto test_rectangle = rectangle_from(25.0, 25.0, 50.0, 50.0);
    fill_rectangle_on_bitmap(test_bitmap, color_black(), test_rectangle);
    REQUIRE(pixel_drawn_at_point(test_bitmap, point_at(50.0, 50.0)));
    REQUIRE_FALSE(pixel_drawn_at_point(test_bitmap, point_at(10.0, 10.0)));
    free_bitmap(test_bitmap);
}
TEST_CASE("fill_rectangle_on_bitmap_record_with_options_integration") {
    auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
    auto test_rectangle = rectangle_from(25.0, 25.0, 50.0, 50.0);
    fill_rectangle_on_bitmap(test_bitmap, color_black(), test_rectangle, option_defaults());
    REQUIRE(pixel_drawn_at_point(test_bitmap, point_at(50.0, 50.0)));
    REQUIRE_FALSE(pixel_drawn_at_point(test_bitmap, point_at(10.0, 10.0)));
    free_bitmap(test_bitmap);
}
TEST_CASE("fill_rectangle_on_bitmap_integration") {
    auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
    fill_rectangle_on_bitmap(test_bitmap, color_black(), 25.0, 25.0, 50.0, 50.0);
    REQUIRE(pixel_drawn_at_point(test_bitmap, 50.0, 50.0));
    REQUIRE_FALSE(pixel_drawn_at_point(test_bitmap, 75.0, 75.0));
    free_bitmap(test_bitmap);
}
TEST_CASE("fill_rectangle_on_bitmap_with_options_integration") {
    auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
    fill_rectangle_on_bitmap(test_bitmap, color_black(), 25.0, 25.0, 50.0, 50.0, option_defaults());
    REQUIRE(pixel_drawn_at_point(test_bitmap, point_at(50.0, 50.0)));
    REQUIRE_FALSE(pixel_drawn_at_point(test_bitmap, point_at(10.0, 10.0)));
    free_bitmap(test_bitmap);
}
TEST_CASE("fill_rectangle_on_window_record_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_rectangle = rectangle_from(100.0, 100.0, 200.0, 150.0);
    fill_rectangle_on_window(test_window, color_black(), test_rectangle);
    refresh_screen();
    REQUIRE(point_in_rectangle(point_at(150.0, 125.0), test_rectangle));
    REQUIRE_FALSE(point_in_rectangle(point_at(350.0, 275.0), test_rectangle));
    close_window(test_window);
}
TEST_CASE("fill_rectangle_on_window_record_with_options_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_rectangle = rectangle_from(100.0, 100.0, 200.0, 150.0);
    fill_rectangle_on_window(test_window, color_black(), test_rectangle, option_defaults());
    refresh_screen();
    REQUIRE(point_in_rectangle(point_at(150.0, 125.0), test_rectangle));
    REQUIRE_FALSE(point_in_rectangle(point_at(350.0, 275.0), test_rectangle));
    close_window(test_window);
}
TEST_CASE("fill_rectangle_on_window_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    fill_rectangle_on_window(test_window, color_black(), 100.0, 100.0, 50.0, 50.0);
    refresh_screen();
    REQUIRE(point_in_rectangle(point_at(125.0, 125.0), rectangle_from(100.0, 100.0, 50.0, 50.0)));
    REQUIRE_FALSE(point_in_rectangle(point_at(175.0, 175.0), rectangle_from(100.0, 100.0, 50.0, 50.0)));
    close_window(test_window);
}
TEST_CASE("fill_rectangle_on_window_with_options_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    fill_rectangle_on_window(test_window, color_black(), 100.0, 100.0, 50.0, 50.0, option_defaults());
    refresh_screen();
    REQUIRE(point_in_rectangle(point_at(125.0, 125.0), rectangle_from(100.0, 100.0, 50.0, 50.0)));
    REQUIRE_FALSE(point_in_rectangle(point_at(175.0, 175.0), rectangle_from(100.0, 100.0, 50.0, 50.0)));
    close_window(test_window);
}
TEST_CASE("draw_text_font_as_string_integration") {
    auto test_window = open_window("Text Drawing Test", 800, 600);
    draw_text("Hello, World!", color_black(), "hara", 24, 100.0, 100.0);
    refresh_screen();
    auto test_rectangle = rectangle_from(100.0, 100.0, text_width("Hello, World!", get_system_font(), 12), text_height("Hello, World!", get_system_font(), 12));
    REQUIRE(point_in_rectangle(point_at(100.0, 100.0), test_rectangle));
    close_window(test_window);
}
TEST_CASE("draw_text_with_options_font_as_string_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    draw_text("Hello, World!", color_black(), "leaguegothic", 24, 100.0, 100.0, option_defaults());
    refresh_screen();
    auto test_rectangle = rectangle_from(100.0, 100.0, text_width("Hello, World!", get_system_font(), 12), text_height("Hello, World!", get_system_font(), 12));
    REQUIRE(point_in_rectangle(point_at(100.0, 100.0), test_rectangle));
    close_window(test_window);
}
TEST_CASE("draw_text_no_font_no_size_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    draw_text("Hello, World!", color_black(), 100.0, 100.0);
    refresh_screen();
    auto test_rectangle = rectangle_from(100.0, 100.0, text_width("Hello, World!", get_system_font(), 12), text_height("Hello, World!", get_system_font(), 12));
    REQUIRE(point_in_rectangle(point_at(100.0, 100.0), test_rectangle));
    close_window(test_window);
}
TEST_CASE("draw_text_no_font_no_size_with_options_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    draw_text("Hello, World!", color_black(), 100.0, 100.0, option_defaults());
    refresh_screen();
    auto test_rectangle = rectangle_from(100.0, 100.0, text_width("Hello, World!", get_system_font(), 12), text_height("Hello, World!", get_system_font(), 12));
    REQUIRE(point_in_rectangle(point_at(100.0, 100.0), test_rectangle));
    close_window(test_window);
}
TEST_CASE("draw_text_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    draw_text("Hello, World!", color_black(), font_named("hara"), 24, 100.0, 100.0);
    refresh_screen();
    auto test_rectangle = rectangle_from(100.0, 100.0, text_width("Hello, World!", get_system_font(), 12), text_height("Hello, World!", get_system_font(), 12));
    REQUIRE(point_in_rectangle(point_at(100.0, 100.0), test_rectangle));
    close_window(test_window);
}
TEST_CASE("draw_text_with_options_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    draw_text("Hello, World!", color_black(), font_named("hara"), 24, 100.0, 100.0, option_defaults());
    refresh_screen();
    auto test_rectangle = rectangle_from(100.0, 100.0, text_width("Hello, World!", get_system_font(), 12), text_height("Hello, World!", get_system_font(), 12));
    REQUIRE(point_in_rectangle(point_at(100.0, 100.0), test_rectangle));
    close_window(test_window);
}
TEST_CASE("draw_text_on_bitmap_font_as_string_integration") {
    auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
    draw_text_on_bitmap(test_bitmap, "Hello", color_black(), "hara", 12, 10.0, 10.0);
    REQUIRE(pixel_drawn_at_point(test_bitmap, 10.0, 10.0));
    REQUIRE_FALSE(pixel_drawn_at_point(test_bitmap, 90.0, 90.0));
    free_bitmap(test_bitmap);
}
TEST_CASE("draw_text_on_bitmap_with_options_font_as_string_integration") {
    auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
    draw_text_on_bitmap(test_bitmap, "Hello", color_black(), "hara", 12, 10.0, 10.0, option_defaults());
    REQUIRE(pixel_drawn_at_point(test_bitmap, 10.0, 10.0));
    REQUIRE_FALSE(pixel_drawn_at_point(test_bitmap, 90.0, 90.0));
    free_bitmap(test_bitmap);
}
TEST_CASE("draw_text_on_bitmap_no_font_no_size_integration") {
    auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
    draw_text_on_bitmap(test_bitmap, "Test", color_black(), 10.0, 10.0);
    REQUIRE(pixel_drawn_at_point(test_bitmap, 10.0, 10.0));
    REQUIRE_FALSE(pixel_drawn_at_point(test_bitmap, 90.0, 90.0));
    free_bitmap(test_bitmap);
}
TEST_CASE("draw_text_on_bitmap_no_font_no_size_with_options_integration") {
    auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
    draw_text_on_bitmap(test_bitmap, "Test", color_black(), 10.0, 10.0, option_defaults());
    REQUIRE(pixel_drawn_at_point(test_bitmap, 10.0, 10.0));
    REQUIRE_FALSE(pixel_drawn_at_point(test_bitmap, 90.0, 90.0));
    free_bitmap(test_bitmap);
}
TEST_CASE("draw_text_on_bitmap_integration") {
    auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
    draw_text_on_bitmap(test_bitmap, "Hello", color_black(), font_named("hara"), 12, 10.0, 10.0);
    REQUIRE(pixel_drawn_at_point(test_bitmap, 10.0, 10.0));
    REQUIRE_FALSE(pixel_drawn_at_point(test_bitmap, 90.0, 90.0));
    free_bitmap(test_bitmap);
}
TEST_CASE("draw_text_on_bitmap_with_options_integration") {
    auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
    draw_text_on_bitmap(test_bitmap, "Test", color_black(), font_named("hara"), 24, 10.0, 10.0, option_defaults());
    REQUIRE(pixel_drawn_at_point(test_bitmap, 10.0, 10.0));
    REQUIRE_FALSE(pixel_drawn_at_point(test_bitmap, 90.0, 90.0));
    free_bitmap(test_bitmap);
}
TEST_CASE("draw_text_on_window_font_as_string_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    draw_text_on_window(test_window, "Hello, World!", color_black(), "hara", 24, 10.0, 10.0);
    refresh_screen();
    auto test_rectangle = rectangle_from(100.0, 100.0, text_width("Hello, World!", get_system_font(), 12), text_height("Hello, World!", get_system_font(), 12));
    REQUIRE(point_in_rectangle(point_at(100.0, 100.0), test_rectangle));
    close_window(test_window);
}
TEST_CASE("draw_text_on_window_with_options_font_as_string_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    draw_text_on_window(test_window, "Hello, World!", color_black(), "hara", 24, 10.0, 10.0, option_defaults());
    refresh_screen();
    auto test_rectangle = rectangle_from(100.0, 100.0, text_width("Hello, World!", get_system_font(), 12), text_height("Hello, World!", get_system_font(), 12));
    REQUIRE(point_in_rectangle(point_at(100.0, 100.0), test_rectangle));
    close_window(test_window);
}
TEST_CASE("draw_text_on_window_no_font_no_size_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    draw_text_on_window(test_window, "Hello, World!", color_black(), 10.0, 10.0);
    refresh_screen();
    auto test_rectangle = rectangle_from(100.0, 100.0, text_width("Hello, World!", get_system_font(), 12), text_height("Hello, World!", get_system_font(), 12));
    REQUIRE(point_in_rectangle(point_at(100.0, 100.0), test_rectangle));
    close_window(test_window);
}
TEST_CASE("draw_text_on_window_no_font_no_size_with_options_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    draw_text_on_window(test_window, "Hello, World!", color_black(), 10.0, 10.0, option_defaults());
    refresh_screen();
    auto test_rectangle = rectangle_from(100.0, 100.0, text_width("Hello, World!", get_system_font(), 12), text_height("Hello, World!", get_system_font(), 12));
    REQUIRE(point_in_rectangle(point_at(100.0, 100.0), test_rectangle));
    close_window(test_window);
}
TEST_CASE("draw_text_on_window_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_font = load_font("test_font", "hara.ttf");
    font_load_size(test_font, 24);
    draw_text_on_window(test_window, "Hello, World!", color_black(), test_font, 24, 10.0, 10.0);
    refresh_screen();
    auto test_rectangle = rectangle_from(100.0, 100.0, text_width("Hello, World!", get_system_font(), 12), text_height("Hello, World!", get_system_font(), 12));
    REQUIRE(point_in_rectangle(point_at(100.0, 100.0), test_rectangle));
    close_window(test_window);
    free_font(test_font);
}
TEST_CASE("draw_text_on_window_with_options_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_font = load_font("test_font", "hara.ttf");
    draw_text_on_window(test_window, "Hello, World!", color_black(), test_font, 24, 10.0, 10.0, option_defaults());
    refresh_screen();
    auto test_rectangle = rectangle_from(100.0, 100.0, text_width("Hello, World!", get_system_font(), 12), text_height("Hello, World!", get_system_font(), 12));
    REQUIRE(point_in_rectangle(point_at(100.0, 100.0), test_rectangle));
    close_window(test_window);
    free_font(test_font);
}
TEST_CASE("font_has_size_name_as_string_integration") {
    auto test_result1 = font_has_size("hara", 12);
    REQUIRE(test_result1);
    auto test_result2 = font_has_size("nonexistent_font", 12);
    REQUIRE_FALSE(test_result2);
}
TEST_CASE("font_has_size_integration") {
    auto test_font = load_font("test_font", "hara.ttf");
    auto has_size_12 = font_has_size(test_font, 12);
    REQUIRE(has_size_12);
    auto has_size_999 = font_has_size(test_font, 999);
    REQUIRE_FALSE(has_size_999);
    free_font(test_font);
}
TEST_CASE("font_load_size_name_as_string_integration") {
    font_load_size("test_font", 12);
    auto test_font_size_check = font_has_size("test_font", 12);
    REQUIRE(test_font_size_check);
}
TEST_CASE("font_load_size_integration") {
    auto test_font = load_font("test_font", "hara.ttf");
    font_load_size(test_font, 12);
    REQUIRE(font_has_size(test_font, 12));
    free_font(test_font);
}
TEST_CASE("font_named_integration") {
    auto test_window = open_window("Font Test", 800, 600);
    auto test_font = font_named("hara");
    draw_text("Test Text", color_black(), test_font, 24, 100.0, 100.0);
    refresh_screen();
    REQUIRE(test_font != nullptr);
    close_window(test_window);
}
TEST_CASE("free_all_fonts_integration") {
    auto test_font = load_font("test_font", "hara.ttf");
    auto test_font_named = font_named("test_font");
    REQUIRE(test_font_named != nullptr);
    free_all_fonts();
    auto test_has_font = has_font("test_font");
    REQUIRE_FALSE(test_has_font);
}
TEST_CASE("free_font_integration") {
    auto test_font = load_font("test_font", "hara.ttf");
    free_font(test_font);
    REQUIRE_FALSE(has_font(test_font));
}
TEST_CASE("get_font_style_name_as_string_integration") {
    auto test_font = load_font("test_font", "hara.ttf");
    auto test_style = get_font_style("test_font");
    REQUIRE(test_style != nullptr);
    free_font(test_font);
}
TEST_CASE("get_font_style_integration") {
    auto test_font = load_font("test_font", "hara.ttf");
    auto test_style = get_font_style(test_font);
    REQUIRE(test_style != FontStyle::BOLD_FONT);
    free_font(test_font);
}
TEST_CASE("get_system_font_integration") {
    auto test_font = get_system_font();
    REQUIRE(test_font != nullptr);
    auto test_has_size = font_has_size(test_font, 12);
    REQUIRE(test_has_size);
}
TEST_CASE("has_font_integration") {
    auto test_font = load_font("test_font", "hara.ttf");
    REQUIRE(has_font(test_font));
    free_font(test_font);
    REQUIRE_FALSE(has_font(test_font));
}
TEST_CASE("has_font_name_as_string_integration") {
    auto test_result_hara = has_font("hara");
    REQUIRE(test_result_hara);
    auto test_result_nonexistent = has_font("nonexistent_font");
    REQUIRE_FALSE(test_result_nonexistent);
}
TEST_CASE("load_font_integration") {
    auto test_window = open_window("Font Test", 800, 600);
    auto test_font = load_font("test_font", "hara.ttf");
    draw_text("Hello, World!", color_black(), test_font, 24, 100.0, 100.0, option_defaults());
    refresh_screen();
    REQUIRE(has_font("test_font"));
    close_window(test_window);
    free_font(test_font);
}
TEST_CASE("set_font_style_name_as_string_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_font = load_font("test_font", "hara.ttf");
    font_load_size("test_font", 24);
    set_font_style("test_font", FontStyle::BOLD_FONT);
    draw_text("Bold Text", color_black(), "test_font", 24, 100.0, 100.0);
    refresh_screen();
    REQUIRE(get_font_style("test_font") == FontStyle::BOLD_FONT);
    close_window(test_window);
    free_font(test_font);
}
TEST_CASE("set_font_style_integration") {
    auto test_font = font_named("hara");
    set_font_style(test_font, FontStyle::BOLD_FONT);
    auto test_style = get_font_style(test_font);
    REQUIRE(test_style == FontStyle::BOLD_FONT);
    free_font(test_font);
}
TEST_CASE("text_height_font_named_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_height = text_height("Hello, World!", "hara", 24);
    REQUIRE(test_height > 0);
    close_window(test_window);
}
TEST_CASE("text_height_integration") {
    auto test_font = load_font("test_font", "hara.ttf");
    font_load_size(test_font, 24);
    auto test_height = text_height("Hello, World!", test_font, 24);
    REQUIRE(test_height > 0);
    free_font(test_font);
}
TEST_CASE("text_width_font_named_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_width = text_width("Hello, World!", "hara", 24);
    draw_text("Hello, World!", color_black(), "hara", 24, 100.0, 100.0);
    refresh_screen();
    REQUIRE(test_width > 0);
    close_window(test_window);
}
TEST_CASE("text_width_integration") {
    auto test_font = load_font("test_font", "hara.ttf");
    font_load_size(test_font, 12);
    auto test_width = text_width("Hello, World!", test_font, 12);
    REQUIRE(test_width > 0);
    free_font(test_font);
}
TEST_CASE("draw_triangle_record_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_triangle = triangle_from(point_at(100.0, 100.0), point_at(200.0, 200.0), point_at(150.0, 300.0));
    draw_triangle(color_black(), test_triangle);
    refresh_screen();
    REQUIRE(point_in_triangle(point_at(150.0, 200.0), test_triangle));
    REQUIRE_FALSE(point_in_triangle(point_at(300.0, 300.0), test_triangle));
    close_window(test_window);
}
TEST_CASE("draw_triangle_record_with_options_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_triangle = triangle_from(point_at(100.0, 100.0), point_at(200.0, 200.0), point_at(150.0, 300.0));
    draw_triangle(color_black(), test_triangle, option_defaults());
    refresh_screen();
    REQUIRE(point_in_triangle(point_at(150.0, 150.0), test_triangle));
    REQUIRE_FALSE(point_in_triangle(point_at(300.0, 300.0), test_triangle));
    close_window(test_window);
}
TEST_CASE("draw_triangle_integration") {
    auto test_window = open_window("Triangle Test", 800, 600);
    draw_triangle(color_black(), 100.0, 100.0, 200.0, 300.0, 300.0, 100.0);
    refresh_screen();
    REQUIRE(point_in_triangle(point_at(150.0, 150.0), triangle_from(point_at(100.0, 100.0), point_at(200.0, 300.0), point_at(300.0, 100.0))));
    close_window(test_window);
}
TEST_CASE("draw_triangle_with_options_integration") {
    auto test_window = open_window("Triangle Test", 800, 600);
    draw_triangle(color_black(), 100.0, 100.0, 200.0, 200.0, 150.0, 300.0, option_defaults());
    refresh_screen();
    REQUIRE(point_in_triangle(point_at(150.0, 150.0), triangle_from(point_at(100.0, 100.0), point_at(200.0, 200.0), point_at(150.0, 300.0))));
    close_window(test_window);
}
TEST_CASE("draw_triangle_on_bitmap_record_integration") {
    auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
    auto test_triangle = triangle_from(point_at(25.0, 25.0), point_at(75.0, 25.0), point_at(50.0, 75.0));
    draw_triangle_on_bitmap(test_bitmap, color_black(), test_triangle);
    REQUIRE(pixel_drawn_at_point(test_bitmap, point_at(50.0, 50.0)));
    REQUIRE_FALSE(pixel_drawn_at_point(test_bitmap, point_at(10.0, 10.0)));
    free_bitmap(test_bitmap);
}
TEST_CASE("draw_triangle_on_bitmap_record_with_options_integration") {
    auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
    auto test_triangle = triangle_from(point_at(25.0, 25.0), point_at(75.0, 25.0), point_at(50.0, 75.0));
    draw_triangle_on_bitmap(test_bitmap, color_black(), test_triangle, option_defaults());
    REQUIRE(pixel_drawn_at_point(test_bitmap, point_at(50.0, 50.0)));
    REQUIRE_FALSE(pixel_drawn_at_point(test_bitmap, point_at(10.0, 10.0)));
    free_bitmap(test_bitmap);
}
TEST_CASE("draw_triangle_on_bitmap_integration") {
    auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
    draw_triangle_on_bitmap(test_bitmap, color_black(), 25.0, 25.0, 75.0, 25.0, 50.0, 75.0);
    REQUIRE(pixel_drawn_at_point(test_bitmap, point_at(50.0, 50.0)));
    REQUIRE_FALSE(pixel_drawn_at_point(test_bitmap, point_at(10.0, 10.0)));
    free_bitmap(test_bitmap);
}
TEST_CASE("draw_triangle_on_bitmap_with_options_integration") {
    auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
    draw_triangle_on_bitmap(test_bitmap, color_black(), 10.0, 10.0, 50.0, 90.0, 90.0, 10.0, option_defaults());
    REQUIRE(pixel_drawn_at_point(test_bitmap, point_at(50.0, 50.0)));
    REQUIRE_FALSE(pixel_drawn_at_point(test_bitmap, point_at(100.0, 100.0)));
    free_bitmap(test_bitmap);
}
TEST_CASE("draw_triangle_on_window_record_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_triangle = triangle_from(point_at(100.0, 100.0), point_at(200.0, 200.0), point_at(150.0, 300.0));
    draw_triangle_on_window(test_window, color_black(), test_triangle);
    refresh_screen();
    REQUIRE(point_in_triangle(point_at(150.0, 200.0), test_triangle));
    close_window(test_window);
}
TEST_CASE("draw_triangle_on_window_record_with_options_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_triangle = triangle_from(point_at(100.0, 100.0), point_at(200.0, 200.0), point_at(150.0, 250.0));
    draw_triangle_on_window(test_window, color_black(), test_triangle, option_defaults());
    refresh_screen();
    REQUIRE(point_in_triangle(point_at(150.0, 150.0), test_triangle));
    close_window(test_window);
}
TEST_CASE("draw_triangle_on_window_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    draw_triangle_on_window(test_window, color_black(), 100.0, 100.0, 200.0, 300.0, 300.0, 100.0);
    refresh_screen();
    REQUIRE(point_in_triangle(point_at(200.0, 200.0), triangle_from(point_at(100.0, 100.0), point_at(200.0, 300.0), point_at(300.0, 100.0))));
    close_window(test_window);
}
TEST_CASE("draw_triangle_on_window_with_options_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    draw_triangle_on_window(test_window, color_black(), 100.0, 100.0, 200.0, 200.0, 150.0, 300.0, option_defaults());
    refresh_screen();
    REQUIRE(point_in_triangle(point_at(150.0, 200.0), triangle_from(100.0, 100.0, 200.0, 200.0, 150.0, 300.0)));
    close_window(test_window);
}
TEST_CASE("fill_triangle_record_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_triangle = triangle_from(point_at(100.0, 100.0), point_at(200.0, 300.0), point_at(300.0, 100.0));
    fill_triangle(color_black(), test_triangle);
    refresh_screen();
    REQUIRE(point_in_triangle(point_at(200.0, 200.0), test_triangle));
    REQUIRE_FALSE(point_in_triangle(point_at(400.0, 400.0), test_triangle));
    close_window(test_window);
}
TEST_CASE("fill_triangle_record_with_options_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_triangle = triangle_from(point_at(100.0, 100.0), point_at(200.0, 300.0), point_at(300.0, 100.0));
    fill_triangle(color_black(), test_triangle, option_defaults());
    refresh_screen();
    REQUIRE(point_in_triangle(point_at(200.0, 200.0), test_triangle));
    REQUIRE_FALSE(point_in_triangle(point_at(400.0, 400.0), test_triangle));
    close_window(test_window);
}
TEST_CASE("fill_triangle_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    fill_triangle(color_black(), 100.0, 100.0, 200.0, 300.0, 300.0, 100.0);
    refresh_screen();
    REQUIRE(point_in_triangle(point_at(150.0, 150.0), triangle_from(point_at(100.0, 100.0), point_at(200.0, 300.0), point_at(300.0, 100.0))));
    close_window(test_window);
}
TEST_CASE("fill_triangle_with_options_integration") {
    auto test_window = open_window("Triangle Test", 800, 600);
    fill_triangle(color_red(), 100.0, 100.0, 200.0, 300.0, 300.0, 100.0, option_defaults());
    refresh_screen();
    REQUIRE(point_in_triangle(point_at(150.0, 150.0), triangle_from(point_at(100.0, 100.0), point_at(200.0, 300.0), point_at(300.0, 100.0))));
    REQUIRE_FALSE(point_in_triangle(point_at(350.0, 150.0), triangle_from(point_at(100.0, 100.0), point_at(200.0, 300.0), point_at(300.0, 100.0))));
    close_window(test_window);
}
TEST_CASE("fill_triangle_on_bitmap_record_integration") {
    auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
    auto test_triangle = triangle_from(point_at(25.0, 25.0), point_at(75.0, 25.0), point_at(50.0, 75.0));
    fill_triangle_on_bitmap(test_bitmap, color_black(), test_triangle);
    REQUIRE(pixel_drawn_at_point(test_bitmap, point_at(50.0, 50.0)));
    REQUIRE_FALSE(pixel_drawn_at_point(test_bitmap, point_at(0.0, 0.0)));
    free_bitmap(test_bitmap);
}
TEST_CASE("fill_triangle_on_bitmap_record_with_options_integration") {
    auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
    auto test_triangle = triangle_from(point_at(25.0, 25.0), point_at(75.0, 25.0), point_at(50.0, 75.0));
    fill_triangle_on_bitmap(test_bitmap, color_black(), test_triangle, option_defaults());
    REQUIRE(pixel_drawn_at_point(test_bitmap, point_at(50.0, 50.0)));
    REQUIRE_FALSE(pixel_drawn_at_point(test_bitmap, point_at(10.0, 10.0)));
    free_bitmap(test_bitmap);
}
TEST_CASE("fill_triangle_on_bitmap_integration") {
    auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
    fill_triangle_on_bitmap(test_bitmap, color_black(), 25.0, 25.0, 75.0, 25.0, 50.0, 75.0);
    REQUIRE(pixel_drawn_at_point(test_bitmap, 50.0, 50.0));
    REQUIRE_FALSE(pixel_drawn_at_point(test_bitmap, 0.0, 0.0));
    free_bitmap(test_bitmap);
}
TEST_CASE("fill_triangle_on_bitmap_with_options_integration") {
    auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
    fill_triangle_on_bitmap(test_bitmap, color_black(), 25.0, 25.0, 75.0, 25.0, 50.0, 75.0, option_defaults());
    REQUIRE(pixel_drawn_at_point(test_bitmap, 50.0, 50.0));
    REQUIRE_FALSE(pixel_drawn_at_point(test_bitmap, 0.0, 0.0));
    free_bitmap(test_bitmap);
}
TEST_CASE("fill_triangle_on_window_record_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_triangle = triangle_from(point_at(100.0, 100.0), point_at(200.0, 300.0), point_at(300.0, 100.0));
    fill_triangle_on_window(test_window, color_black(), test_triangle);
    refresh_screen();
    REQUIRE(point_in_triangle(point_at(200.0, 200.0), test_triangle));
    close_window(test_window);
}
TEST_CASE("fill_triangle_on_window_record_with_options_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_triangle = triangle_from(point_at(100.0, 100.0), point_at(200.0, 300.0), point_at(300.0, 100.0));
    fill_triangle_on_window(test_window, color_black(), test_triangle, option_defaults());
    refresh_screen();
    REQUIRE(point_in_triangle(point_at(200.0, 200.0), test_triangle));
    close_window(test_window);
}
TEST_CASE("fill_triangle_on_window_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    fill_triangle_on_window(test_window, color_black(), 100.0, 100.0, 200.0, 300.0, 300.0, 100.0);
    refresh_screen();
    REQUIRE(point_in_triangle(point_at(200.0, 200.0), triangle_from(point_at(100.0, 100.0), point_at(200.0, 300.0), point_at(300.0, 100.0))));
    close_window(test_window);
}
TEST_CASE("fill_triangle_on_window_with_options_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    fill_triangle_on_window(test_window, color_black(), 100.0, 100.0, 200.0, 300.0, 300.0, 100.0, option_defaults());
    refresh_screen();
    REQUIRE(point_in_triangle(point_at(150.0, 150.0), triangle_from(point_at(100.0, 100.0), point_at(200.0, 300.0), point_at(300.0, 100.0))));
    REQUIRE_FALSE(point_in_triangle(point_at(350.0, 150.0), triangle_from(point_at(100.0, 100.0), point_at(200.0, 300.0), point_at(300.0, 100.0))));
    close_window(test_window);
}
