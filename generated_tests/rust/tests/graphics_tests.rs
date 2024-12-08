use splashkit::*;
#[cfg(test)]
mod test_runner {
    pub fn run_tests_sequential(tests: &[&dyn Fn()]) {
        for test in tests {
            test();
        }
    }
}
#![test_runner(test_runner::run_tests_sequential)]
#[test]
fn test_draw_circle_record_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_circle = circle_at(400.0, 300.0, 50.0);
    draw_circle(color_black(), test_circle);
    refresh_screen();
    assert!(point_in_circle(point_at(400.0, 300.0), test_circle));
    close_window(test_window);
}
#[test]
fn test_draw_circle_record_with_options_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_circle = circle_at(400.0, 300.0, 50.0);
    draw_circle(color_black(), test_circle, option_defaults());
    refresh_screen();
    assert!(point_in_circle(point_at(400.0, 300.0), test_circle));
    close_window(test_window);
}
#[test]
fn test_draw_circle_integration() {
    let test_window = open_window("Test Window", 800, 600);
    draw_circle(color_black(), 400.0, 300.0, 50.0);
    refresh_screen();
    assert!(point_in_circle(point_at(400.0, 300.0), circle_at(400.0, 300.0, 50.0)));
    close_window(test_window);
}
#[test]
fn test_draw_circle_with_options_integration() {
    let test_window = open_window("Test Window", 800, 600);
    draw_circle(color_black(), 400.0, 300.0, 50.0, option_defaults());
    refresh_screen();
    assert!(point_in_circle(point_at(400.0, 300.0), circle_at(400.0, 300.0, 50.0)));
    close_window(test_window);
}
#[test]
fn test_draw_circle_on_bitmap_integration() {
    let test_bitmap = create_bitmap("test_bitmap", 200, 200);
    draw_circle_on_bitmap(test_bitmap, color_black(), 100.0, 100.0, 50.0);
    assert!(pixel_drawn_at_point(test_bitmap, 100.0, 100.0));
    free_bitmap(test_bitmap);
}
#[test]
fn test_draw_circle_on_bitmap_with_options_integration() {
    let test_bitmap = create_bitmap("test_bitmap", 200, 200);
    draw_circle_on_bitmap(test_bitmap, color_black(), 100.0, 100.0, 50.0, option_defaults());
    assert!(pixel_drawn_at_point(test_bitmap, 100.0, 100.0));
    free_bitmap(test_bitmap);
}
#[test]
fn test_draw_circle_on_window_integration() {
    let test_window = open_window("Test Window", 800, 600);
    draw_circle_on_window(test_window, color_black(), 400.0, 300.0, 50.0);
    refresh_screen();
    assert!(point_in_circle(point_at(400.0, 300.0), circle_at(400.0, 300.0, 50.0)));
    close_window(test_window);
}
#[test]
fn test_draw_circle_on_window_with_options_integration() {
    let test_window = open_window("Test Window", 800, 600);
    draw_circle_on_window(test_window, color_black(), 400.0, 300.0, 50.0, option_defaults());
    refresh_screen();
    assert!(point_in_circle(point_at(400.0, 300.0), circle_at(400.0, 300.0, 50.0)));
    close_window(test_window);
}
#[test]
fn test_fill_circle_record_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_circle = circle_at(400.0, 300.0, 50.0);
    fill_circle(color_black(), test_circle);
    refresh_screen();
    assert!(point_in_circle(point_at(400.0, 300.0), test_circle));
    close_window(test_window);
}
#[test]
fn test_fill_circle_record_with_options_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_circle = circle_at(400.0, 300.0, 50.0);
    fill_circle(color_black(), test_circle, option_defaults());
    refresh_screen();
    assert!(point_in_circle(point_at(400.0, 300.0), test_circle));
    close_window(test_window);
}
#[test]
fn test_fill_circle_integration() {
    let test_window = open_window("Test Window", 800, 600);
    fill_circle(color_black(), 400.0, 300.0, 50.0);
    refresh_screen();
    assert!(point_in_circle(point_at(400.0, 300.0), circle_at(400.0, 300.0, 50.0)));
    close_window(test_window);
}
#[test]
fn test_fill_circle_with_options_integration() {
    let test_window = open_window("Test Window", 800, 600);
    fill_circle(color_black(), 400.0, 300.0, 50.0, option_defaults());
    refresh_screen();
    assert!(point_in_circle(point_at(400.0, 300.0), circle_at(400.0, 300.0, 50.0)));
    close_window(test_window);
}
#[test]
fn test_fill_circle_on_bitmap_integration() {
    let test_bitmap = create_bitmap("test_bitmap", 200, 200);
    fill_circle_on_bitmap(test_bitmap, color_red(), 100.0, 100.0, 50.0);
    assert!(pixel_drawn_at_point(test_bitmap, 100.0, 100.0));
    assert!(pixel_drawn_at_point(test_bitmap, 150.0, 100.0));
    assert!(!pixel_drawn_at_point(test_bitmap, 200.0, 100.0));
    free_bitmap(test_bitmap);
}
#[test]
fn test_fill_circle_on_bitmap_with_options_integration() {
    let test_bitmap = create_bitmap("test_bitmap", 200, 200);
    fill_circle_on_bitmap(test_bitmap, color_black(), 100.0, 100.0, 50.0, option_defaults());
    assert!(pixel_drawn_at_point(test_bitmap, 100.0, 100.0));
    assert!(pixel_drawn_at_point(test_bitmap, 150.0, 100.0));
    assert!(!pixel_drawn_at_point(test_bitmap, 200.0, 100.0));
    free_bitmap(test_bitmap);
}
#[test]
fn test_fill_circle_on_window_integration() {
    let test_window = open_window("Test Window", 800, 600);
    fill_circle_on_window(test_window, color_black(), 400.0, 300.0, 50.0);
    refresh_screen();
    assert!(point_in_circle(point_at(400.0, 300.0), circle_at(400.0, 300.0, 50.0)));
    close_window(test_window);
}
#[test]
fn test_fill_circle_on_window_with_options_integration() {
    let test_window = open_window("Test Window", 800, 600);
    fill_circle_on_window(test_window, color_black(), 400.0, 300.0, 50.0, option_defaults());
    refresh_screen();
    assert!(point_in_circle(point_at(400.0, 300.0), circle_at(400.0, 300.0, 50.0)));
    close_window(test_window);
}
#[test]
fn test_current_clip_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_clip = current_clip();
    assert_eq!(test_clip.width, 800);
    assert_eq!(test_clip.height, 600);
    close_window(test_window);
}
#[test]
fn test_current_clip_for_bitmap_integration() {
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    let test_rectangle = rectangle_from(10, 10, 50, 50);
    push_clip(test_bitmap, test_rectangle);
    let test_clip = current_clip(test_bitmap);
    assert_eq!(rectangle_left(test_clip), 10);
    assert_eq!(rectangle_top(test_clip), 10);
    assert_eq!(test_clip.width, 50);
    assert_eq!(test_clip.height, 50);
    free_bitmap(test_bitmap);
}
#[test]
fn test_current_clip_for_window_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_clip = current_clip(test_window);
    assert_eq!(rectangle_from(0, 0, 800, 600), test_clip);
    close_window(test_window);
}
#[test]
fn test_pop_clip_for_window_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_rectangle = rectangle_from(100, 100, 200, 200);
    push_clip(test_window, test_rectangle);
    let test_current_clip = current_clip(test_window);
    assert_eq!(test_current_clip, test_rectangle);
    pop_clip(test_window);
    let test_current_clip_after_pop = current_clip(test_window);
    assert_eq!(rectangle_from(0, 0, 800, 600), test_current_clip_after_pop);
    close_window(test_window);
}
#[test]
fn test_pop_clip_integration() {
    let test_window = open_window("Test Window", 800, 600);
    push_clip(rectangle_from(100, 100, 200, 200));
    draw_circle(color_black(), 150, 150, 50);
    refresh_screen();
    assert!(point_in_circle(point_at(150, 150), circle_at(150, 150, 50)));
    pop_clip();
    draw_circle(color_red(), 300, 300, 50);
    refresh_screen();
    assert!(point_in_circle(point_at(300, 300), circle_at(300, 300, 50)));
    close_window(test_window);
}
#[test]
fn test_pop_clip_for_bitmap_integration() {
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    push_clip(test_bitmap, rectangle_from(0, 0, 50, 50));
    pop_clip(test_bitmap);
    assert_eq!(current_clip(test_bitmap), rectangle_from(0, 0, 100, 100));
    free_bitmap(test_bitmap);
}
#[test]
fn test_push_clip_for_window_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_rectangle = rectangle_from(100.0, 100.0, 200.0, 200.0);
    push_clip_for_window(test_window, test_rectangle);
    let test_current_clip = current_clip_for_window(test_window);
    assert_eq!(test_current_clip, test_rectangle);
    refresh_screen();
    close_window(test_window);
}
#[test]
fn test_push_clip_for_bitmap_integration() {
    let test_bitmap = create_bitmap("test_bitmap", 200, 200);
    let test_rectangle = rectangle_from(50, 50, 100, 100);
    push_clip(test_bitmap, test_rectangle);
    let test_current_clip = current_clip(test_bitmap);
    assert_eq!(rectangle_left(test_current_clip), 50);
    assert_eq!(rectangle_top(test_current_clip), 50);
    assert_eq!(test_current_clip.width, 100);
    assert_eq!(test_current_clip.height, 100);
    free_bitmap(test_bitmap);
}
#[test]
fn test_push_clip_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_rectangle = rectangle_from(100.0, 100.0, 200.0, 200.0);
    push_clip(test_rectangle);
    let test_current_clip = current_clip();
    assert_eq!(test_current_clip, test_rectangle);
    close_window(test_window);
}
#[test]
fn test_reset_clip_for_bitmap_integration() {
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    push_clip(test_bitmap, rectangle_from(10, 10, 50, 50));
    reset_clip_for_bitmap(test_bitmap);
    assert_eq!(current_clip_for_bitmap(test_bitmap), rectangle_from(0, 0, 100, 100));
    free_bitmap(test_bitmap);
}
#[test]
fn test_reset_clip_integration() {
    let test_window = open_window("Test Window", 800, 600);
    push_clip(rectangle_from(100, 100, 200, 200));
    reset_clip();
    let test_clip_rect = current_clip();
    assert_eq!(rectangle_from(0, 0, 800, 600), test_clip_rect);
    close_window(test_window);
}
#[test]
fn test_reset_clip_for_window_integration() {
    let test_window = open_window("Test Window", 800, 600);
    push_clip(test_window, rectangle_from(100, 100, 200, 200));
    reset_clip_for_window(test_window);
    let test_clip_rect = current_clip_for_window(test_window);
    assert_eq!(rectangle_from(0, 0, 800, 600), test_clip_rect);
    close_window(test_window);
}
#[test]
fn test_set_clip_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_rectangle = rectangle_from(100.0, 100.0, 200.0, 200.0);
    set_clip(test_rectangle);
    let test_current_clip = current_clip();
    assert_eq!(test_current_clip, test_rectangle);
    close_window(test_window);
}
#[test]
fn test_set_clip_for_bitmap_integration() {
    let test_bitmap = create_bitmap("test_bitmap", 200, 200);
    let test_rectangle = rectangle_from(50, 50, 100, 100);
    set_clip(test_bitmap, test_rectangle);
    let test_current_clip = current_clip(test_bitmap);
    assert_eq!(test_current_clip, test_rectangle);
    free_bitmap(test_bitmap);
}
#[test]
fn test_set_clip_for_window_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_rectangle = rectangle_from(100, 100, 200, 200);
    set_clip(test_window, test_rectangle);
    let test_current_clip = current_clip(test_window);
    assert_eq!(test_current_clip, test_rectangle);
    close_window(test_window);
}
#[test]
fn test_option_defaults_integration() {
    let test_options = option_defaults();
    assert!(test_options.is_some());
}
#[test]
fn test_option_draw_to_bitmap_integration() {
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    let test_options = option_draw_to_bitmap(test_bitmap);
    draw_circle(color_black(), circle_at(50.0, 50.0, 25.0), test_options);
    assert!(pixel_drawn_at_point(test_bitmap, 50.0, 50.0));
    assert!(!pixel_drawn_at_point(test_bitmap, 100.0, 100.0));
    free_bitmap(test_bitmap);
}
#[test]
fn test_option_draw_to_bitmap_with_options_integration() {
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    let test_options = option_defaults();
    let test_drawing_options = option_draw_to_bitmap_with_options(test_bitmap, test_options);
    draw_circle(color_black(), circle_at(50.0, 50.0, 25.0), test_drawing_options);
    assert!(pixel_drawn_at_point(test_bitmap, 50.0, 50.0));
    assert!(!pixel_drawn_at_point(test_bitmap, 100.0, 100.0));
    free_bitmap(test_bitmap);
}
#[test]
fn test_option_draw_to_window_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_circle = circle_at(400.0, 300.0, 50.0);
    draw_circle(color_black(), test_circle, option_draw_to_window(test_window));
    refresh_screen();
    assert!(point_in_circle(point_at(400.0, 300.0), test_circle));
    close_window(test_window);
}
#[test]
fn test_option_draw_to_window_with_options_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_options = option_defaults();
    let test_draw_options = option_draw_to_window_with_options(test_window, test_options);
    draw_circle(color_black(), circle_at(400.0, 300.0, 50.0), test_draw_options);
    refresh_screen();
    assert!(point_in_circle(point_at(400.0, 300.0), circle_at(400.0, 300.0, 50.0)));
    close_window(test_window);
}
#[test]
fn test_option_flip_x_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_bitmap = load_bitmap("test_bitmap", "test_bitmap.png");
    draw_bitmap_with_options(test_bitmap, 100.0, 100.0, option_flip_x());
    refresh_screen();
    assert!(pixel_drawn_at_point(test_bitmap, point_at(50.0, 100.0)));
    assert!(!pixel_drawn_at_point(test_bitmap, point_at(150.0, 100.0)));
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_option_flip_x_with_options_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_bitmap = load_bitmap("test_bitmap", "test_bitmap.png");
    draw_bitmap_with_options(test_bitmap, 400, 300, option_flip_x(option_defaults()));
    refresh_screen();
    assert!(pixel_drawn_at_point(test_bitmap, point_at(bitmap_width(test_bitmap), bitmap_height(test_bitmap))));
    assert!(!pixel_drawn_at_point(test_bitmap, point_at(0, bitmap_height(test_bitmap))));
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_option_flip_xy_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_bitmap = load_bitmap("test_bitmap", "test_bitmap.png");
    draw_bitmap_with_options(test_bitmap, 400.0, 300.0, option_flip_xy());
    refresh_screen();
    assert!(pixel_drawn_at_point(test_bitmap, point_at(bitmap_width(test_bitmap), 0.0)));
    assert!(pixel_drawn_at_point(test_bitmap, point_at(0.0, bitmap_height(test_bitmap))));
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_option_flip_xy_with_options_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_bitmap = load_bitmap("test_bitmap", "test_bitmap.png");
    let test_options = option_defaults();
    let test_options_flipped = option_flip_xy(test_options);
    draw_bitmap_with_options(test_bitmap, 400, 300, test_options_flipped);
    refresh_screen();
    assert!(pixel_drawn_at_point(test_bitmap, point_at(bitmap_width(test_bitmap), 0)));
    assert!(!pixel_drawn_at_point(test_bitmap, point_at(0, bitmap_height(test_bitmap))));
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_option_flip_y_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_bitmap = load_bitmap("test_bitmap", "test_bitmap.png");
    draw_bitmap_with_options(test_bitmap, 400.0, 300.0, option_flip_y());
    refresh_screen();
    assert!(pixel_drawn_at_point(test_bitmap, 400.0, bitmap_height(test_bitmap)));
    assert!(!pixel_drawn_at_point(test_bitmap, 400.0, 0.0));
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_option_flip_y_with_options_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_bitmap = load_bitmap("test_bitmap", "test_bitmap.png");
    draw_bitmap_with_options(test_bitmap, 400.0, 300.0, option_flip_y(option_defaults()));
    refresh_screen();
    assert!(pixel_drawn_at_point(test_bitmap, point_at(400.0, bitmap_height(test_bitmap))));
    assert!(!pixel_drawn_at_point(test_bitmap, point_at(400.0, 0.0)));
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_option_line_width_integration() {
    let test_window = open_window("Test Window", 800, 600);
    draw_line(color_black(), 100.0, 100.0, 200.0, 200.0, option_line_width(1));
    refresh_screen();
    assert_eq!(get_pixel(point_at(100.0, 100.0)), color_black());
    draw_line(color_black(), 300.0, 300.0, 400.0, 400.0, option_line_width(5));
    refresh_screen();
    assert_eq!(get_pixel(point_at(300.0, 300.0)), color_black());
    close_window(test_window);
}
#[test]
fn test_option_line_width_with_options_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_circle = circle_at(400.0, 300.0, 50.0);
    draw_circle(color_black(), test_circle, option_line_width(3, option_defaults()));
    refresh_screen();
    assert!(point_in_circle(point_at(400.0, 300.0), test_circle));
    close_window(test_window);
}
#[test]
fn test_option_part_bmp_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_bitmap = load_bitmap("test_bitmap", "test_bitmap.png");
    let test_options = option_part_bmp(0.0, 0.0, 50.0, 50.0);
    draw_bitmap_with_options(test_bitmap, 100.0, 100.0, test_options);
    refresh_screen();
    assert!(pixel_drawn_at_point(test_bitmap, point_at(25.0, 25.0)));
    assert!(!pixel_drawn_at_point(test_bitmap, point_at(75.0, 75.0)));
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_option_part_bmp_with_options_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_bitmap = load_bitmap("test_bitmap", "test_bitmap.png");
    let test_options = option_part_bmp(10.0, 10.0, 50.0, 50.0, option_defaults());
    draw_bitmap_with_options(test_bitmap, 100.0, 100.0, test_options);
    refresh_screen();
    assert!(pixel_drawn_at_point(test_bitmap, point_at(110.0, 110.0)));
    assert!(!pixel_drawn_at_point(test_bitmap, point_at(160.0, 160.0)));
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_option_part_bmp_from_rectangle_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_bitmap = load_bitmap("test_bitmap", "test_bitmap.png");
    let test_rectangle = rectangle_from(100, 100, 200, 200);
    let test_options = option_part_bmp(test_rectangle);
    draw_bitmap_with_options(test_bitmap, 0, 0, test_options);
    refresh_screen();
    assert!(pixel_drawn_at_point(test_bitmap, point_at(150, 150)));
    assert!(!pixel_drawn_at_point(test_bitmap, point_at(350, 350)));
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_option_part_bmp_from_rectangle_with_options_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_bitmap = load_bitmap("test_bitmap", "test_bitmap.png");
    let test_rectangle = rectangle_from(100.0, 100.0, 200.0, 200.0);
    let test_options = option_part_bmp(test_rectangle, option_defaults());
    draw_bitmap_with_options(test_bitmap, 0.0, 0.0, test_options);
    refresh_screen();
    assert!(pixel_drawn_at_point(test_bitmap, point_at(150.0, 150.0)));
    assert!(!pixel_drawn_at_point(test_bitmap, point_at(350.0, 350.0)));
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_option_rotate_bmp_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_bitmap = load_bitmap("test_bitmap", "test_bitmap.png");
    draw_bitmap_with_options(test_bitmap, 400.0, 300.0, option_rotate_bmp(45.0));
    refresh_screen();
    assert!(pixel_drawn_at_point(test_bitmap, point_at(400.0, 300.0)));
    assert!(!pixel_drawn_at_point(test_bitmap, point_at(bitmap_width(test_bitmap), 300.0)));
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_option_rotate_bmp_with_anchor_integration() {
    let test_window = open_window("Rotation Test", 800, 600);
    let test_bitmap = load_bitmap("test_bitmap", "test_bitmap.png");
    let test_options = option_rotate_bmp(45.0, 50.0, 50.0);
    draw_bitmap_with_options(test_bitmap, 400.0, 300.0, test_options);
    refresh_screen();
    assert!(pixel_drawn_at_point(test_bitmap, point_at(400.0, 300.0)));
    assert!(pixel_drawn_at_point(test_bitmap, point_at(bitmap_width(test_bitmap), bitmap_height(test_bitmap))));
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_option_rotate_bmp_with_anchor_and_options_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_bitmap = load_bitmap("test_bitmap", "test_bitmap.png");
    let test_options = option_rotate_bmp(45.0, 50.0, 50.0, option_defaults());
    draw_bitmap_with_options(test_bitmap, 400.0, 300.0, test_options);
    refresh_screen();
    assert!(pixel_drawn_at_point(test_bitmap, point_at(400.0, 300.0)));
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_option_rotate_bmp_with_options_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_bitmap = load_bitmap("test_bitmap", "test_bitmap.png");
    let test_options = option_rotate_bmp(45.0, option_defaults());
    draw_bitmap_with_options(test_bitmap, 400.0, 300.0, test_options);
    refresh_screen();
    assert!(pixel_drawn_at_point(test_bitmap, point_at(400.0, 300.0)));
    assert!(pixel_drawn_at_point(test_bitmap, point_at(cosine(45.0), sine(45.0))));
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_option_scale_bmp_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_bitmap = load_bitmap("test_bitmap", "test_bitmap.png");
    draw_bitmap_with_options(test_bitmap, 100.0, 100.0, option_scale_bmp(2.0, 2.0));
    refresh_screen();
    assert!(pixel_drawn_at_point(test_bitmap, point_at(100.0, 100.0)));
    assert!(pixel_drawn_at_point(test_bitmap, point_at(bitmap_width(test_bitmap), bitmap_height(test_bitmap))));
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_option_scale_bmp_with_options_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_bitmap = load_bitmap("test_bitmap", "test_bitmap.png");
    let test_options = option_scale_bmp(2.0, 2.0, option_defaults());
    draw_bitmap_with_options(test_bitmap, 100.0, 100.0, test_options);
    refresh_screen();
    assert!(pixel_drawn_at_point(test_bitmap, point_at(100.0, 100.0)));
    assert!(pixel_drawn_at_point(test_bitmap, point_at(bitmap_width(test_bitmap), bitmap_height(test_bitmap))));
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_option_to_screen_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_options = option_to_screen();
    draw_circle(color_black(), circle_at(400.0, 300.0, 50.0), test_options);
    refresh_screen();
    assert!(point_in_circle(point_at(400.0, 300.0), circle_at(400.0, 300.0, 50.0)));
    close_window(test_window);
}
#[test]
fn test_option_to_screen_with_options_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_options = option_defaults();
    let test_screen_options = option_to_screen(test_options);
    draw_circle(color_black(), circle_at(400.0, 300.0, 50.0), test_screen_options);
    refresh_screen();
    assert!(point_in_circle(point_at(400.0, 300.0), circle_at(400.0, 300.0, 50.0)));
    close_window(test_window);
}
#[test]
fn test_option_to_world_integration() {
    let test_window = open_window("Test Window", 800, 600);
    move_camera_to(100.0, 100.0);
    draw_circle(color_black(), 100.0, 100.0, 50.0, option_to_world());
    refresh_screen();
    assert!(point_in_circle(point_at(0.0, 0.0), circle_at(100.0, 100.0, 50.0)));
    close_window(test_window);
}
#[test]
fn test_option_to_world_with_options_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_options = option_defaults();
    let test_world_options = option_to_world(test_options);
    draw_circle(color_black(), circle_at(100.0, 100.0, 50.0), test_world_options);
    refresh_screen();
    assert!(point_in_circle(point_at(100.0, 100.0), circle_at(100.0, 100.0, 50.0)));
    close_window(test_window);
}
#[test]
fn test_option_with_animation_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    let test_animation = create_animation("script", "test_animation");
    draw_bitmap(test_bitmap, 100, 100, option_with_animation(test_animation));
    draw_bitmap(test_bitmap, 100.0, 100.0, option_with_animation(test_animation));
    refresh_screen();
    assert!(pixel_drawn_at_point(test_bitmap, point_at(50.0, 50.0)));
    free_bitmap(test_bitmap);
    free_animation(test_animation);
    close_window(test_window);
}
#[test]
fn test_option_with_animation_with_options_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_bitmap = load_bitmap("test_bitmap", "test_bitmap.png");
    let test_animation = create_animation("script", "test_animation");
    draw_bitmap(test_bitmap, 100, 100, option_with_animation(test_animation));
    let test_options = option_with_animation(test_animation, option_defaults());
    draw_bitmap(test_bitmap, 100.0, 100.0, test_options);
    refresh_screen();
    assert!(pixel_drawn_at_point(test_bitmap, point_at(100.0, 100.0)));
    free_bitmap(test_bitmap);
    free_animation(test_animation);
    close_window(test_window);
}
#[test]
fn test_option_with_bitmap_cell_integration() {
    let test_bitmap = load_bitmap("test_bitmap", "test_bitmap.png");
    bitmap_set_cell_details(test_bitmap, 32, 32, 4, 4, 16);
    let test_window = open_window("Test Window", 800, 600);
    draw_bitmap_with_options(test_bitmap, 100.0, 100.0, option_with_bitmap_cell(5));
    refresh_screen();
    assert!(pixel_drawn_at_point(test_bitmap, point_at(116.0, 116.0)));
    assert!(!pixel_drawn_at_point(test_bitmap, point_at(150.0, 150.0)));
    close_window(test_window);
    free_bitmap(test_bitmap);
}
#[test]
fn test_option_with_bitmap_cell_with_options_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_bitmap = load_bitmap("test_bitmap", "test_bitmap.png");
    bitmap_set_cell_details(test_bitmap, 32, 32, 4, 4, 16);
    let test_options = option_with_bitmap_cell(5, option_defaults());
    draw_bitmap(test_bitmap, 100.0, 100.0, test_options);
    refresh_screen();
    assert!(pixel_drawn_at_point(test_bitmap, point_at(116.0, 116.0)));
    assert!(!pixel_drawn_at_point(test_bitmap, point_at(150.0, 150.0)));
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_draw_ellipse_within_rectangle_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_rectangle = rectangle_from(100.0, 100.0, 200.0, 150.0);
    draw_ellipse(color_black(), test_rectangle, option_defaults());
    refresh_screen();
    assert!(point_in_circle(point_at(200.0, 175.0), circle_at(rectangle_center(test_rectangle), test_rectangle.width)));
    assert!(!point_in_circle(point_at(350.0, 175.0), circle_at(rectangle_center(test_rectangle), test_rectangle.width)));
    close_window(test_window);
}
#[test]
fn test_draw_ellipse_within_rectangle_with_options_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_rectangle = rectangle_from(100.0, 100.0, 200.0, 100.0);
    draw_ellipse(color_black(), test_rectangle, option_defaults());
    refresh_screen();
    assert!(point_in_circle(point_at(200.0, 150.0), circle_at(rectangle_center(test_rectangle), test_rectangle.width)));
    close_window(test_window);
}
#[test]
fn test_draw_ellipse_integration() {
    let test_window = open_window("Test Window", 800, 600);
    draw_ellipse(color_black(), 400.0, 300.0, 100.0, 50.0);
    refresh_screen();
    assert!(point_in_circle(point_at(400.0, 300.0), circle_at(400.0, 300.0, 50.0)));
    assert!(!point_in_circle(point_at(550.0, 300.0), circle_at(400.0, 300.0, 50.0)));
    close_window(test_window);
}
#[test]
fn test_draw_ellipse_with_options_integration() {
    let test_window = open_window("Test Window", 800, 600);
    draw_ellipse(color_black(), 400.0, 300.0, 100.0, 50.0, option_defaults());
    refresh_screen();
    assert!(point_in_circle(point_at(400.0, 300.0), circle_at(400.0, 300.0, 50.0)));
    close_window(test_window);
}
#[test]
fn test_draw_ellipse_on_bitmap_within_rectangle_integration() {
    let test_bitmap = create_bitmap("test_bitmap", 200, 200);
    let test_rectangle = rectangle_from(50.0, 50.0, 100.0, 100.0);
    draw_ellipse_on_bitmap(test_bitmap, color_black(), test_rectangle);
    assert!(pixel_drawn_at_point(test_bitmap, point_at(100.0, 100.0)));
    assert!(!pixel_drawn_at_point(test_bitmap, point_at(200.0, 200.0)));
    free_bitmap(test_bitmap);
}
#[test]
fn test_draw_ellipse_on_bitmap_within_rectangle_with_options_integration() {
    let test_bitmap = create_bitmap("test_bitmap", 200, 200);
    let test_rect = rectangle_from(50.0, 50.0, 100.0, 100.0);
    draw_ellipse_on_bitmap(test_bitmap, color_black(), test_rect, option_defaults());
    assert!(pixel_drawn_at_point(test_bitmap, point_at(75.0, 75.0)));
    assert!(!pixel_drawn_at_point(test_bitmap, point_at(0.0, 0.0)));
    free_bitmap(test_bitmap);
}
#[test]
fn test_draw_ellipse_on_bitmap_integration() {
    let test_bitmap = create_bitmap("test_bitmap", 200, 200);
    let test_color = color_black();
    draw_ellipse_on_bitmap(test_bitmap, test_color, 100.0, 100.0, 50.0, 30.0);
    assert!(pixel_drawn_at_point(test_bitmap, 100.0, 100.0));
    assert!(!pixel_drawn_at_point(test_bitmap, 160.0, 100.0));
    free_bitmap(test_bitmap);
}
#[test]
fn test_draw_ellipse_on_bitmap_with_options_integration() {
    let test_bitmap = create_bitmap("test_bitmap", 200, 200);
    draw_ellipse_on_bitmap(test_bitmap, color_black(), 100.0, 100.0, 50.0, 30.0, option_defaults());
    assert!(pixel_drawn_at_point(test_bitmap, point_at(100.0, 100.0)));
    assert!(!pixel_drawn_at_point(test_bitmap, point_at(150.0, 100.0)));
    free_bitmap(test_bitmap);
}
#[test]
fn test_draw_ellipse_on_window_within_rectangle_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_rectangle = rectangle_from(100.0, 100.0, 200.0, 100.0);
    draw_ellipse_on_window(test_window, color_black(), test_rectangle);
    refresh_screen();
    assert!(point_in_circle(point_at(200.0, 150.0), circle_at(rectangle_center(test_rectangle), test_rectangle.width)));
    close_window(test_window);
}
#[test]
fn test_draw_ellipse_on_window_within_rectangle_with_options_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_rect = rectangle_from(100.0, 100.0, 200.0, 100.0);
    draw_ellipse_on_window(test_window, color_black(), test_rect, option_defaults());
    refresh_screen();
    assert!(point_in_circle(point_at(200.0, 150.0), circle_at(point_at(200.0, 150.0), 100.0)));
    close_window(test_window);
}
#[test]
fn test_draw_ellipse_on_window_integration() {
    let test_window = open_window("Test Window", 800, 600);
    draw_ellipse_on_window(test_window, color_black(), 400.0, 300.0, 100.0, 50.0);
    refresh_screen();
    assert!(point_in_circle(point_at(400.0, 300.0), circle_at(400.0, 300.0, 50.0)));
    close_window(test_window);
}
#[test]
fn test_draw_ellipse_on_window_with_options_integration() {
    let test_window = open_window("Test Window", 800, 600);
    draw_ellipse_on_window(test_window, color_black(), 400.0, 300.0, 100.0, 50.0, option_defaults());
    refresh_screen();
    assert!(point_in_circle(point_at(400.0, 300.0), circle_at(400.0, 300.0, 50.0)));
    close_window(test_window);
}
#[test]
fn test_fill_ellipse_within_rectangle_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_rectangle = rectangle_from(100.0, 100.0, 200.0, 100.0);
    fill_ellipse(color_black(), test_rectangle);
    refresh_screen();
    assert!(point_in_circle(point_at(200.0, 150.0), circle_at(rectangle_center(test_rectangle), test_rectangle.width)));
    assert!(!point_in_circle(point_at(350.0, 150.0), circle_at(rectangle_center(test_rectangle), test_rectangle.width)));
    close_window(test_window);
}
#[test]
fn test_fill_ellipse_within_rectangle_with_options_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_rectangle = rectangle_from(100.0, 100.0, 200.0, 100.0);
    fill_ellipse(color_black(), test_rectangle, option_defaults());
    refresh_screen();
    assert!(point_in_circle(point_at(200.0, 150.0), circle_at(rectangle_center(test_rectangle), test_rectangle.width)));
    close_window(test_window);
}
#[test]
fn test_fill_ellipse_integration() {
    let test_window = open_window("Test Window", 800, 600);
    fill_ellipse(color_black(), 400.0, 300.0, 100.0, 50.0);
    refresh_screen();
    assert!(point_in_circle(point_at(400.0, 300.0), circle_at(400.0, 300.0, 50.0)));
    assert!(!point_in_circle(point_at(550.0, 300.0), circle_at(400.0, 300.0, 50.0)));
    close_window(test_window);
}
#[test]
fn test_fill_ellipse_with_options_integration() {
    let test_window = open_window("Test Window", 800, 600);
    fill_ellipse(color_black(), 400.0, 300.0, 100.0, 50.0, option_defaults());
    refresh_screen();
    assert!(point_in_circle(point_at(400.0, 300.0), circle_at(400.0, 300.0, 50.0)));
    close_window(test_window);
}
#[test]
fn test_fill_ellipse_on_bitmap_within_rectangle_integration() {
    let test_bitmap = create_bitmap("test_bitmap", 200, 200);
    let test_rectangle = rectangle_from(50.0, 50.0, 100.0, 100.0);
    fill_ellipse_on_bitmap(test_bitmap, color_black(), test_rectangle);
    assert!(pixel_drawn_at_point(test_bitmap, point_at(100.0, 100.0)));
    assert!(!pixel_drawn_at_point(test_bitmap, point_at(200.0, 200.0)));
    free_bitmap(test_bitmap);
}
#[test]
fn test_fill_ellipse_on_bitmap_within_rectangle_with_options_integration() {
    let test_bitmap = create_bitmap("test_bitmap", 200, 200);
    let test_rect = rectangle_from(50.0, 50.0, 100.0, 100.0);
    fill_ellipse_on_bitmap(test_bitmap, color_black(), test_rect, option_defaults());
    assert!(pixel_drawn_at_point(test_bitmap, point_at(100.0, 100.0)));
    assert!(!pixel_drawn_at_point(test_bitmap, point_at(200.0, 100.0)));
    free_bitmap(test_bitmap);
}
#[test]
fn test_fill_ellipse_on_bitmap_integration() {
    let test_bitmap = create_bitmap("test_bitmap", 200, 200);
    fill_ellipse_on_bitmap(test_bitmap, color_black(), 100.0, 100.0, 50.0, 30.0);
    assert!(pixel_drawn_at_point(test_bitmap, 100.0, 100.0));
    assert!(pixel_drawn_at_point(test_bitmap, 125.0, 100.0));
    assert!(!pixel_drawn_at_point(test_bitmap, 150.0, 100.0));
    free_bitmap(test_bitmap);
}
#[test]
fn test_fill_ellipse_on_bitmap_with_options_integration() {
    let test_bitmap = create_bitmap("test_bitmap", 200, 200);
    fill_ellipse_on_bitmap(test_bitmap, color_black(), 50.0, 50.0, 100.0, 50.0, option_defaults());
    assert!(pixel_drawn_at_point(test_bitmap, 50.0, 50.0));
    assert!(!pixel_drawn_at_point(test_bitmap, 150.0, 50.0));
    free_bitmap(test_bitmap);
}
#[test]
fn test_fill_ellipse_on_window_within_rectangle_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_rectangle = rectangle_from(100.0, 100.0, 200.0, 150.0);
    fill_ellipse_on_window(test_window, color_black(), test_rectangle);
    refresh_screen();
    assert!(point_in_circle(point_at(200.0, 175.0), circle_at(rectangle_center(test_rectangle), test_rectangle.width)));
    close_window(test_window);
}
#[test]
fn test_fill_ellipse_on_window_within_rectangle_with_options_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_rectangle = rectangle_from(100.0, 100.0, 200.0, 150.0);
    fill_ellipse_on_window(test_window, color_black(), test_rectangle, option_defaults());
    refresh_screen();
    assert!(point_in_circle(point_at(200.0, 175.0), circle_at(200.0, 175.0, 100.0)));
    close_window(test_window);
}
#[test]
fn test_fill_ellipse_on_window_integration() {
    let test_window = open_window("Test Window", 800, 600);
    fill_ellipse_on_window(test_window, color_black(), 400.0, 300.0, 100.0, 50.0);
    refresh_screen();
    assert!(point_in_circle(point_at(400.0, 300.0), circle_at(400.0, 300.0, 50.0)));
    close_window(test_window);
}
#[test]
fn test_fill_ellipse_on_window_with_options_integration() {
    let test_window = open_window("Test Window", 800, 600);
    fill_ellipse_on_window(test_window, color_black(), 400.0, 300.0, 100.0, 50.0, option_defaults());
    refresh_screen();
    assert!(point_in_circle(point_at(400.0, 300.0), circle_at(400.0, 300.0, 50.0)));
    close_window(test_window);
}
#[test]
fn test_clear_screen_to_white_integration() {
    let test_window = open_window("Test Window", 800, 600);
    draw_pixel(color_black(), 100.0, 100.0);
    refresh_screen();
    assert_eq!(get_pixel(point_at(100.0, 100.0)), color_black());
    clear_screen();
    refresh_screen();
    assert_ne!(get_pixel(point_at(100.0, 100.0)), color_black());
    close_window(test_window);
}
#[test]
fn test_clear_screen_integration() {
    let test_window = open_window("Test Window", 800, 600);
    draw_pixel(color_black(), 100.0, 100.0);
    refresh_screen();
    assert_eq!(get_pixel(point_at(400.0, 300.0)), color_black());
    clear_screen(color_white());
    refresh_screen();
    assert_ne!(get_pixel(point_at(400.0, 300.0)), color_black());
    close_window(test_window);
}
#[test]
fn test_display_details_integration() {
    let test_number_of_displays = number_of_displays();
    assert!(test_number_of_displays > 0);
    let test_display = display_details(0);
    assert!(test_display.is_some());
    assert!(display_width(test_display) > 0);
    assert!(display_height(test_display) > 0);
    assert_eq!(test_number_of_displays, 0);
}
#[test]
fn test_display_height_integration() {
    let test_display = display_details(0);
    let test_height = display_height(test_display);
    assert!(test_height > 0);
}
#[test]
fn test_display_name_integration() {
    let test_display = display_details(0);
    let test_display_name = display_name(test_display);
    assert!(test_display_name.is_some());
}
#[test]
fn test_display_width_integration() {
    let test_display = display_details(0);
    let test_width = display_width(test_display);
    assert!(test_width > 0);
}
#[test]
fn test_display_x_integration() {
    let test_display = display_details(0);
    let test_x = display_x(test_display);
    assert!(test_x > -1);
}
#[test]
fn test_display_y_integration() {
    let test_display = display_details(0);
    let test_y = display_y(test_display);
    assert_ne!(test_y, -1);
}
#[test]
fn test_number_of_displays_integration() {
    let test_display_count = number_of_displays();
    assert!(test_display_count > 0);
}
#[test]
fn test_refresh_screen_integration() {
    let test_window = open_window("Test Window", 800, 600);
    draw_circle(color_black(), circle_at(400.0, 300.0, 50.0));
    refresh_screen();
    assert!(point_in_circle(point_at(400.0, 300.0), circle_at(400.0, 300.0, 50.0)));
    close_window(test_window);
}
#[test]
fn test_refresh_screen_with_target_fps_integration() {
    let test_window = open_window("Test Window", 800, 600);
    refresh_screen(60);
    assert!(window_close_requested(test_window));
    close_window(test_window);
}
#[test]
fn test_save_bitmap_integration() {
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    draw_pixel_on_bitmap(test_bitmap, color_black(), 50, 50);
    save_bitmap(test_bitmap, "test_save");
    free_bitmap(test_bitmap);
}
#[test]
fn test_screen_height_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_height = screen_height();
    assert_eq!(test_height, 600);
    close_window(test_window);
}
#[test]
fn test_screen_width_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_width = screen_width();
    assert_eq!(test_width, 800);
    close_window(test_window);
}
#[test]
fn test_take_screenshot_integration() {
    let test_window = open_window("Test Window", 800, 600);
    draw_circle(color_black(), 400, 300, 50);
    refresh_screen();
    take_screenshot("screenshot_test");
    close_window(test_window);
}
#[test]
fn test_take_screenshot_of_window_integration() {
    let test_window = open_window("Test Window", 800, 600);
    draw_circle(color_black(), 400, 300, 50);
    refresh_screen();
    take_screenshot(test_window, "screenshot_test");
    close_window(test_window);
}
#[test]
fn test_bitmap_bounding_circle_integration() {
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    let test_point = point_at(50.0, 50.0);
    let test_circle = bitmap_bounding_circle(test_bitmap, test_point);
    assert_eq!(circle_radius(test_circle), 50.0);
    assert_eq!(center_point(test_circle), test_point);
    free_bitmap(test_bitmap);
}
#[test]
fn test_bitmap_bounding_rectangle_integration() {
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    let test_rectangle = bitmap_bounding_rectangle(test_bitmap);
    assert_eq!(test_rectangle.width, bitmap_width(test_bitmap));
    assert_eq!(test_rectangle.height, bitmap_height(test_bitmap));
    free_bitmap(test_bitmap);
}
#[test]
fn test_bitmap_bounding_rectangle_at_location_integration() {
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    let test_rectangle = bitmap_bounding_rectangle_at_location(test_bitmap, 50.0, 50.0);
    assert_eq!(rectangle_left(test_rectangle), 50.0);
    assert_eq!(rectangle_top(test_rectangle), 50.0);
    assert_eq!(rectangle_right(test_rectangle), 150.0);
    assert_eq!(rectangle_bottom(test_rectangle), 150.0);
    free_bitmap(test_bitmap);
}
#[test]
fn test_bitmap_cell_center_integration() {
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    let test_center = bitmap_cell_center(test_bitmap);
    assert_eq!(test_center.x, 50.0);
    assert_eq!(test_center.y, 50.0);
    free_bitmap(test_bitmap);
}
#[test]
fn test_bitmap_cell_circle_integration() {
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    let test_circle = bitmap_cell_circle(test_bitmap, 50.0, 50.0);
    assert_eq!(circle_radius(test_circle), 50.0);
    assert_eq!(circle_x(test_circle), 50.0);
    assert_eq!(circle_y(test_circle), 50.0);
    free_bitmap(test_bitmap);
}
#[test]
fn test_bitmap_cell_circle_at_point_integration() {
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    bitmap_set_cell_details(test_bitmap, 50, 50, 2, 2, 4);
    let test_circle = bitmap_cell_circle_at_point(test_bitmap, point_at(100, 100));
    assert_eq!(circle_x(test_circle), 125);
    assert_eq!(circle_y(test_circle), 125);
    assert_eq!(circle_radius(test_circle), 25);
    free_bitmap(test_bitmap);
}
#[test]
fn test_bitmap_cell_circle_at_point_with_scale_integration() {
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    bitmap_set_cell_details(test_bitmap, 50, 50, 2, 2, 4);
    let test_circle = bitmap_cell_circle_at_point_with_scale(test_bitmap, point_at(100.0, 100.0), 2.0);
    assert_eq!(circle_radius(test_circle), 50.0);
    free_bitmap(test_bitmap);
}
#[test]
fn test_bitmap_cell_columns_integration() {
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    bitmap_set_cell_details(test_bitmap, 20, 20, 5, 5, 25);
    assert_eq!(bitmap_cell_columns(test_bitmap), 5);
    free_bitmap(test_bitmap);
}
#[test]
fn test_bitmap_cell_count_integration() {
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    bitmap_set_cell_details(test_bitmap, 20, 20, 5, 5, 25);
    assert_eq!(bitmap_cell_count(test_bitmap), 25);
    free_bitmap(test_bitmap);
}
#[test]
fn test_bitmap_cell_height_integration() {
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    bitmap_set_cell_details(test_bitmap, 20, 20, 5, 5, 25);
    assert_eq!(bitmap_cell_height(test_bitmap), 20);
    free_bitmap(test_bitmap);
}
#[test]
fn test_bitmap_cell_offset_integration() {
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    bitmap_set_cell_details(test_bitmap, 25, 25, 4, 4, 16);
    let test_offset = bitmap_cell_offset(test_bitmap, 5);
    assert_eq!(test_offset.x, 75);
    assert_eq!(test_offset.y, 0);
    free_bitmap(test_bitmap);
}
#[test]
fn test_bitmap_cell_rectangle_integration() {
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    bitmap_set_cell_details(test_bitmap, 25, 25, 4, 4, 16);
    let test_rectangle = bitmap_cell_rectangle(test_bitmap);
    assert_eq!(test_rectangle.width, 25);
    assert_eq!(test_rectangle.height, 25);
    free_bitmap(test_bitmap);
}
#[test]
fn test_bitmap_cell_rectangle_at_point_integration() {
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    bitmap_set_cell_details(test_bitmap, 25, 25, 4, 4, 16);
    let test_rectangle = bitmap_cell_rectangle_at_point(test_bitmap, point_at(50.0, 50.0));
    assert_eq!(rectangle_left(test_rectangle), 50.0);
    assert_eq!(rectangle_top(test_rectangle), 50.0);
    assert_eq!(rectangle_right(test_rectangle), 75.0);
    assert_eq!(rectangle_bottom(test_rectangle), 75.0);
    free_bitmap(test_bitmap);
}
#[test]
fn test_bitmap_cell_rows_integration() {
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    bitmap_set_cell_details(test_bitmap, 20, 20, 5, 5, 25);
    assert_eq!(bitmap_cell_rows(test_bitmap), 5);
    free_bitmap(test_bitmap);
}
#[test]
fn test_bitmap_cell_width_integration() {
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    bitmap_set_cell_details(test_bitmap, 25, 25, 4, 4, 16);
    assert_eq!(bitmap_cell_width(test_bitmap), 25);
    free_bitmap(test_bitmap);
}
#[test]
fn test_bitmap_center_integration() {
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    let test_center = bitmap_center(test_bitmap);
    assert_eq!(test_center.x, 50.0);
    assert_eq!(test_center.y, 50.0);
    free_bitmap(test_bitmap);
}
#[test]
fn test_bitmap_filename_integration() {
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    let test_filename = bitmap_filename(test_bitmap);
    assert_eq!(test_filename, "");
    free_bitmap(test_bitmap);
}
#[test]
fn test_bitmap_height_integration() {
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    let test_height = bitmap_height(test_bitmap);
    assert_eq!(test_height, 100);
    free_bitmap(test_bitmap);
}
#[test]
fn test_bitmap_height_of_bitmap_named_integration() {
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    assert_eq!(bitmap_height_of_bitmap_named("test_bitmap"), 100);
    free_bitmap(test_bitmap);
}
#[test]
fn test_bitmap_name_integration() {
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    let test_bitmap_name = bitmap_name(test_bitmap);
    assert_eq!(test_bitmap_name, "test_bitmap");
    free_bitmap(test_bitmap);
}
#[test]
fn test_bitmap_named_integration() {
    let test_bitmap = load_bitmap("test_bitmap", "test_bitmap.png");
    let test_named_bitmap = bitmap_named("test_bitmap");
    assert!(test_named_bitmap.is_some());
    let test_nonexistent_bitmap = bitmap_named("nonexistent_bitmap");
    assert!(test_nonexistent_bitmap.is_none());
    free_all_bitmaps();
}
#[test]
fn test_bitmap_rectangle_of_cell_integration() {
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    bitmap_set_cell_details(test_bitmap, 25, 25, 4, 4, 16);
    let test_rectangle = bitmap_rectangle_of_cell(test_bitmap, 5);
    assert_eq!(rectangle_left(test_rectangle), 0);
    assert_eq!(rectangle_top(test_rectangle), 75);
    assert_eq!(rectangle_right(test_rectangle), 25);
    assert_eq!(rectangle_bottom(test_rectangle), 100);
    free_bitmap(test_bitmap);
}
#[test]
fn test_bitmap_set_cell_details_integration() {
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    bitmap_set_cell_details(test_bitmap, 20, 20, 5, 5, 25);
    assert_eq!(bitmap_cell_width(test_bitmap), 20);
    assert_eq!(bitmap_cell_height(test_bitmap), 20);
    assert_eq!(bitmap_cell_columns(test_bitmap), 5);
    assert_eq!(bitmap_cell_rows(test_bitmap), 5);
    assert_eq!(bitmap_cell_count(test_bitmap), 25);
    free_bitmap(test_bitmap);
}
#[test]
fn test_bitmap_valid_integration() {
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    assert!(bitmap_valid(test_bitmap));
    free_bitmap(test_bitmap);
    assert!(!bitmap_valid(test_bitmap));
}
#[test]
fn test_bitmap_width_integration() {
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    let test_width = bitmap_width(test_bitmap);
    assert_eq!(test_width, 100);
    free_bitmap(test_bitmap);
}
#[test]
fn test_bitmap_width_of_bitmap_named_integration() {
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    let test_window = open_window("Test Window", 800, 600);
    draw_bitmap(bitmap_named("test_bitmap"), 100, 100);
    refresh_screen();
    assert_eq!(bitmap_width_of_bitmap_named("test_bitmap"), 100);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_clear_bitmap_integration() {
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    draw_pixel_on_bitmap(test_bitmap, color_black(), 50, 50);
    clear_bitmap(test_bitmap, color_white());
    assert!(!pixel_drawn_at_point(test_bitmap, 50, 50));
    free_bitmap(test_bitmap);
}
#[test]
fn test_clear_bitmap_named_integration() {
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    let test_window = open_window("Test Window", 800, 600);
    draw_bitmap(test_bitmap, 100.0, 100.0);
    refresh_screen();
    assert!(pixel_drawn_at_point(test_bitmap, 50.0, 50.0));
    clear_bitmap_named("test_bitmap", color_white());
    refresh_screen();
    assert!(!pixel_drawn_at_point(test_bitmap, 50.0, 50.0));
    close_window(test_window);
    free_bitmap(test_bitmap);
}
#[test]
fn test_create_bitmap_integration() {
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    assert!(test_bitmap.is_some());
    assert_eq!(bitmap_width(test_bitmap), 100);
    assert_eq!(bitmap_height(test_bitmap), 100);
    free_bitmap(test_bitmap);
}
#[test]
fn test_draw_bitmap_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    draw_bitmap(test_bitmap, 100.0, 100.0);
    refresh_screen();
    assert!(pixel_drawn_at_point(test_bitmap, point_at(50.0, 50.0)));
    assert!(!pixel_drawn_at_point(test_bitmap, point_at(bitmap_width(test_bitmap), bitmap_height(test_bitmap))));
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_draw_bitmap_with_options_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    draw_bitmap_with_options(test_bitmap, 100.0, 100.0, option_defaults());
    refresh_screen();
    assert!(pixel_drawn_at_point(test_bitmap, point_at(50.0, 50.0)));
    assert!(!pixel_drawn_at_point(test_bitmap, point_at(150.0, 100.0)));
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_draw_bitmap_named_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    draw_bitmap_named("test_bitmap", 100.0, 100.0);
    refresh_screen();
    assert!(pixel_drawn_at_point(bitmap_named("test_bitmap"), 50.0, 50.0));
    assert!(!pixel_drawn_at_point(bitmap_named("test_bitmap"), bitmap_width(bitmap_named("test_bitmap")), bitmap_height(bitmap_named("test_bitmap"))));
    free_all_bitmaps();
    close_window(test_window);
}
#[test]
fn test_draw_bitmap_named_with_options_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    draw_bitmap("test_bitmap", 100.0, 100.0, option_defaults());
    refresh_screen();
    assert!(pixel_drawn_at_point(test_bitmap, point_at(50.0, 50.0)));
    assert!(!pixel_drawn_at_point(test_bitmap, point_at(150.0, 150.0)));
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_draw_bitmap_on_bitmap_on_bitmap_integration() {
    let test_destination = create_bitmap("test_destination", 100, 100);
    let test_source = create_bitmap("test_source", 50, 50);
    draw_bitmap_on_bitmap_on_bitmap(test_destination, test_source, 25.0, 25.0);
    assert!(pixel_drawn_at_point(test_destination, point_at(50.0, 50.0)));
    assert!(!pixel_drawn_at_point(test_destination, point_at(75.0, 75.0)));
    free_bitmap(test_destination);
    free_bitmap(test_source);
}
#[test]
fn test_draw_bitmap_on_bitmap_on_bitmap_with_options_integration() {
    let test_destination = create_bitmap("test_destination", 100, 100);
    let test_source = create_bitmap("test_source", 50, 50);
    draw_pixel_on_bitmap(test_source, color_black(), point_at(25.0, 25.0));
    draw_bitmap_on_bitmap_on_bitmap_with_options(test_destination, test_source, 25.0, 25.0, option_defaults());
    assert!(pixel_drawn_at_point(test_destination, point_at(25.0, 25.0)));
    assert!(!pixel_drawn_at_point(test_destination, point_at(75.0, 75.0)));
    free_bitmap(test_destination);
    free_bitmap(test_source);
}
#[test]
fn test_draw_bitmap_on_window_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    draw_bitmap_on_window(test_window, test_bitmap, 100.0, 100.0);
    refresh_screen();
    assert!(pixel_drawn_at_point(test_bitmap, point_at(50.0, 50.0)));
    assert!(!pixel_drawn_at_point(test_bitmap, point_at(150.0, 150.0)));
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_draw_bitmap_on_window_with_options_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    draw_bitmap_on_window_with_options(test_window, test_bitmap, 100.0, 100.0, option_defaults());
    refresh_screen();
    assert!(pixel_drawn_at_point(test_bitmap, point_at(50.0, 50.0)));
    assert!(!pixel_drawn_at_point(test_bitmap, point_at(150.0, 100.0)));
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_free_all_bitmaps_integration() {
    let test_bitmap_1 = create_bitmap("test_bitmap_1", 100, 100);
    let test_bitmap_2 = create_bitmap("test_bitmap_2", 100, 100);
    free_all_bitmaps();
    assert!(!bitmap_valid(test_bitmap_1));
    assert!(!bitmap_valid(test_bitmap_2));
}
#[test]
fn test_free_bitmap_integration() {
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    free_bitmap(test_bitmap);
    assert!(!bitmap_valid(test_bitmap));
}
#[test]
fn test_has_bitmap_integration() {
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    assert!(has_bitmap("test_bitmap"));
    free_bitmap(test_bitmap);
    assert!(!has_bitmap("test_bitmap"));
}
#[test]
fn test_load_bitmap_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_bitmap = load_bitmap("test_bitmap", "test_bitmap.png");
    draw_bitmap(test_bitmap, 100.0, 100.0);
    refresh_screen();
    assert!(pixel_drawn_at_point(test_bitmap, point_at(100.0, 100.0)));
    assert!(!pixel_drawn_at_point(test_bitmap, point_at(bitmap_width(test_bitmap), bitmap_height(test_bitmap))));
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_pixel_drawn_at_point_pt_integration() {
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    draw_pixel_on_bitmap(test_bitmap, color_black(), point_at(50.0, 50.0));
    assert!(pixel_drawn_at_point_pt(test_bitmap, point_at(50.0, 50.0)));
    assert!(!pixel_drawn_at_point_pt(test_bitmap, point_at(75.0, 75.0)));
    free_bitmap(test_bitmap);
}
#[test]
fn test_pixel_drawn_at_point_integration() {
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    draw_pixel_on_bitmap(test_bitmap, color_black(), 50.0, 50.0);
    assert!(pixel_drawn_at_point(test_bitmap, 50.0, 50.0));
    assert!(!pixel_drawn_at_point(test_bitmap, 75.0, 75.0));
    free_bitmap(test_bitmap);
}
#[test]
fn test_pixel_drawn_at_point_in_cell_pt_integration() {
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    draw_pixel_on_bitmap(test_bitmap, color_black(), point_at(50.0, 50.0));
    bitmap_set_cell_details(test_bitmap, 100, 100, 1, 1, 1);
    assert!(pixel_drawn_at_point(test_bitmap, 0, point_at(50.0, 50.0)));
    assert!(!pixel_drawn_at_point(test_bitmap, 0, point_at(75.0, 50.0)));
    free_bitmap(test_bitmap);
}
#[test]
fn test_pixel_drawn_at_point_in_cell_integration() {
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    draw_pixel(color_black(), point_at(50.0, 50.0));
    let test_window = open_window("Test Window", 800, 600);
    draw_bitmap(test_bitmap, 100.0, 100.0);
    refresh_screen();
    assert!(pixel_drawn_at_point_in_cell(test_bitmap, 0, point_at(50.0, 50.0)));
    assert!(!pixel_drawn_at_point_in_cell(test_bitmap, 0, point_at(75.0, 75.0)));
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_setup_collision_mask_integration() {
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    setup_collision_mask(test_bitmap);
    let test_pixel_drawn = pixel_drawn_at_point(test_bitmap, point_at(50, 50));
    assert!(test_pixel_drawn);
    free_bitmap(test_bitmap);
}
#[test]
fn test_draw_line_record_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_line = line_from(point_at(100.0, 100.0), point_at(200.0, 200.0));
    draw_line(color_black(), test_line);
    refresh_screen();
    assert_eq!(get_pixel(point_at(100.0, 100.0)), color_black());
    assert_ne!(get_pixel(point_at(99.0, 99.0)), color_black());
    close_window(test_window);
}
#[test]
fn test_draw_line_record_with_options_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_line = line_from(point_at(100.0, 100.0), point_at(200.0, 200.0));
    draw_line_record_with_options(color_black(), test_line, option_line_width(3, option_defaults()));
    refresh_screen();
    assert_eq!(get_pixel(point_at(100.0, 100.0)), color_black());
    assert_ne!(get_pixel(point_at(99.0, 99.0)), color_black());
    close_window(test_window);
}
#[test]
fn test_draw_line_point_to_point_integration() {
    let test_window = open_window("Test Window", 800, 600);
    draw_line_point_to_point(color_black(), point_at(100.0, 100.0), point_at(200.0, 200.0));
    refresh_screen();
    assert_eq!(get_pixel(point_at(100.0, 100.0)), color_black());
    assert_ne!(get_pixel(point_at(99.0, 99.0)), color_black());
    close_window(test_window);
}
#[test]
fn test_draw_line_point_to_point_with_options_integration() {
    let test_window = open_window("Test Window", 800, 600);
    draw_line_point_to_point_with_options(color_black(), point_at(100.0, 100.0), point_at(200.0, 200.0), option_defaults());
    refresh_screen();
    assert_eq!(get_pixel(point_at(100.0, 100.0)), color_black());
    assert_ne!(get_pixel(point_at(99.0, 99.0)), color_black());
    close_window(test_window);
}
#[test]
fn test_draw_line_integration() {
    let test_window = open_window("Test Window", 800, 600);
    draw_line(color_black(), 100.0, 100.0, 200.0, 200.0);
    refresh_screen();
    assert_eq!(get_pixel(point_at(100.0, 100.0)), color_black());
    assert_ne!(get_pixel(point_at(99.0, 99.0)), color_black());
    close_window(test_window);
}
#[test]
fn test_draw_line_with_options_integration() {
    let test_window = open_window("Test Window", 800, 600);
    draw_line_with_options(color_black(), 100.0, 100.0, 200.0, 200.0, option_defaults());
    refresh_screen();
    assert_eq!(get_pixel(point_at(100.0, 100.0)), color_black());
    assert_ne!(get_pixel(point_at(99.0, 99.0)), color_black());
    close_window(test_window);
}
#[test]
fn test_draw_line_on_bitmap_record_integration() {
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    let test_line = line_from(point_at(10.0, 10.0), point_at(90.0, 90.0));
    draw_line_on_bitmap(test_bitmap, color_black(), test_line);
    assert!(pixel_drawn_at_point(test_bitmap, point_at(50.0, 50.0)));
    assert!(!pixel_drawn_at_point(test_bitmap, point_at(100.0, 100.0)));
    free_bitmap(test_bitmap);
}
#[test]
fn test_draw_line_on_bitmap_record_with_options_integration() {
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    let test_line = line_from(point_at(10.0, 10.0), point_at(90.0, 90.0));
    draw_line_on_bitmap(test_bitmap, color_black(), test_line, option_defaults());
    assert!(pixel_drawn_at_point(test_bitmap, point_at(50.0, 50.0)));
    assert!(!pixel_drawn_at_point(test_bitmap, point_at(95.0, 50.0)));
    free_bitmap(test_bitmap);
}
#[test]
fn test_draw_line_on_bitmap_point_to_point_integration() {
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    draw_line_on_bitmap(test_bitmap, color_black(), point_at(10.0, 10.0), point_at(90.0, 90.0));
    assert!(pixel_drawn_at_point(test_bitmap, 50.0, 50.0));
    assert!(!pixel_drawn_at_point(test_bitmap, 0.0, 0.0));
    free_bitmap(test_bitmap);
}
#[test]
fn test_draw_line_on_bitmap_point_to_point_with_options_integration() {
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    let test_from_pt = point_at(10.0, 10.0);
    let test_to_pt = point_at(90.0, 90.0);
    draw_line_on_bitmap_point_to_point_with_options(test_bitmap, color_black(), test_from_pt, test_to_pt, option_defaults());
    assert!(pixel_drawn_at_point(test_bitmap, 10.0, 10.0));
    assert!(pixel_drawn_at_point(test_bitmap, 90.0, 90.0));
    assert!(!pixel_drawn_at_point(test_bitmap, 5.0, 5.0));
    free_bitmap(test_bitmap);
}
#[test]
fn test_draw_line_on_bitmap_integration() {
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    let test_color = color_black();
    draw_line_on_bitmap(test_bitmap, test_color, 10.0, 10.0, 90.0, 90.0);
    assert!(pixel_drawn_at_point(test_bitmap, 50.0, 50.0));
    assert!(!pixel_drawn_at_point(test_bitmap, 95.0, 50.0));
    free_bitmap(test_bitmap);
}
#[test]
fn test_draw_line_on_bitmap_with_options_integration() {
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    draw_line_on_bitmap_with_options(test_bitmap, color_black(), 10.0, 10.0, 90.0, 90.0, option_defaults());
    assert!(pixel_drawn_at_point(test_bitmap, point_at(50.0, 50.0)));
    assert!(!pixel_drawn_at_point(test_bitmap, point_at(5.0, 5.0)));
    free_bitmap(test_bitmap);
}
#[test]
fn test_draw_line_on_window_record_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_line = line_from(point_at(100.0, 100.0), point_at(700.0, 500.0));
    draw_line_on_window(test_window, color_black(), test_line);
    refresh_screen();
    assert_eq!(get_pixel(test_window, point_at(100.0, 100.0)), color_black());
    assert_ne!(get_pixel(test_window, point_at(99.0, 99.0)), color_black());
    close_window(test_window);
}
#[test]
fn test_draw_line_on_window_record_with_options_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_line = line_from(point_at(100.0, 100.0), point_at(200.0, 200.0));
    draw_line_on_window(test_window, color_black(), test_line, option_defaults());
    refresh_screen();
    assert_eq!(get_pixel(test_window, point_at(100.0, 100.0)), color_black());
    assert_ne!(get_pixel(test_window, point_at(99.0, 99.0)), color_black());
    close_window(test_window);
}
#[test]
fn test_draw_line_on_window_point_to_point_integration() {
    let test_window = open_window("Test Window", 800, 600);
    draw_line_on_window(test_window, color_black(), point_at(100.0, 100.0), point_at(200.0, 200.0));
    refresh_screen();
    assert_eq!(get_pixel(test_window, 100.0, 100.0), color_black());
    assert_ne!(get_pixel(test_window, 99.0, 99.0), color_black());
    close_window(test_window);
}
#[test]
fn test_draw_line_on_window_point_to_point_with_options_integration() {
    let test_window = open_window("Test Window", 800, 600);
    draw_line_on_window(test_window, color_black(), point_at(100.0, 100.0), point_at(200.0, 200.0), option_defaults());
    refresh_screen();
    assert_eq!(get_pixel(test_window, 100.0, 100.0), color_black());
    assert_ne!(get_pixel(test_window, 99.0, 99.0), color_black());
    close_window(test_window);
}
#[test]
fn test_draw_line_on_window_integration() {
    let test_window = open_window("Test Window", 800, 600);
    draw_line_on_window(test_window, color_black(), 100.0, 100.0, 200.0, 200.0);
    refresh_screen();
    assert_eq!(get_pixel(test_window, 100.0, 100.0), color_black());
    assert_ne!(get_pixel(test_window, 99.0, 99.0), color_black());
    close_window(test_window);
}
#[test]
fn test_draw_line_on_window_with_options_integration() {
    let test_window = open_window("Test Window", 800, 600);
    draw_line_on_window(test_window, color_black(), 100.0, 100.0, 200.0, 200.0, option_defaults());
    refresh_screen();
    assert_eq!(get_pixel(test_window, 100.0, 100.0), color_black());
    assert_ne!(get_pixel(test_window, 99.0, 99.0), color_black());
    close_window(test_window);
}
#[test]
fn test_draw_pixel_at_point_integration() {
    let test_window = open_window("Test Window", 800, 600);
    draw_pixel(color_black(), point_at(100.0, 100.0));
    refresh_screen();
    assert_eq!(get_pixel(point_at(100.0, 100.0)), color_black());
    assert_ne!(get_pixel(point_at(99.0, 99.0)), color_black());
    close_window(test_window);
}
#[test]
fn test_draw_pixel_at_point_with_options_integration() {
    let test_window = open_window("Test Window", 800, 600);
    draw_pixel_at_point_with_options(color_black(), point_at(100.0, 100.0), option_defaults());
    refresh_screen();
    assert_eq!(get_pixel(point_at(100.0, 100.0)), color_black());
    assert_eq!(get_pixel(point_at(100.0, 100.0)), color_black());
    assert_ne!(get_pixel(point_at(99.0, 99.0)), color_black());
    close_window(test_window);
}
#[test]
fn test_draw_pixel_integration() {
    let test_window = open_window("Test Window", 800, 600);
    draw_pixel(color_black(), 100.0, 100.0);
    refresh_screen();
    assert_eq!(get_pixel(point_at(100.0, 100.0)), color_black());
    assert_ne!(get_pixel(point_at(99.0, 99.0)), color_black());
    close_window(test_window);
}
#[test]
fn test_draw_pixel_with_options_integration() {
    let test_window = open_window("Test Window", 800, 600);
    draw_pixel(color_black(), 100.0, 100.0, option_defaults());
    refresh_screen();
    assert_eq!(get_pixel(point_at(100.0, 100.0)), color_black());
    assert_ne!(get_pixel(point_at(99.0, 99.0)), color_black());
    close_window(test_window);
}
#[test]
fn test_draw_pixel_on_bitmap_at_point_integration() {
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    let test_color = color_black();
    let test_point = point_at(50.0, 50.0);
    draw_pixel_on_bitmap(test_bitmap, test_color, test_point);
    assert!(pixel_drawn_at_point(test_bitmap, test_point));
    assert!(!pixel_drawn_at_point(test_bitmap, point_at(0.0, 0.0)));
    free_bitmap(test_bitmap);
}
#[test]
fn test_draw_pixel_on_bitmap_at_point_with_options_integration() {
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    let test_color = color_black();
    let test_point = point_at(50.0, 50.0);
    draw_pixel_on_bitmap(test_bitmap, test_color, test_point, option_defaults());
    assert!(pixel_drawn_at_point(test_bitmap, test_point));
    assert!(!pixel_drawn_at_point(test_bitmap, point_at(0.0, 0.0)));
    free_bitmap(test_bitmap);
}
#[test]
fn test_draw_pixel_on_bitmap_integration() {
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    let test_color = color_black();
    draw_pixel_on_bitmap(test_bitmap, test_color, 50.0, 50.0);
    assert!(pixel_drawn_at_point(test_bitmap, 50.0, 50.0));
    assert!(!pixel_drawn_at_point(test_bitmap, 51.0, 50.0));
    free_bitmap(test_bitmap);
}
#[test]
fn test_draw_pixel_on_bitmap_with_options_integration() {
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    let test_color = color_black();
    draw_pixel_on_bitmap(test_bitmap, test_color, 50.0, 50.0, option_defaults());
    assert!(pixel_drawn_at_point(test_bitmap, 50.0, 50.0));
    assert!(!pixel_drawn_at_point(test_bitmap, 51.0, 50.0));
    free_bitmap(test_bitmap);
}
#[test]
fn test_draw_pixel_on_window_at_point_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_color = color_black();
    let test_point = point_at(100.0, 100.0);
    draw_pixel_on_window(test_window, test_color, test_point);
    refresh_screen();
    assert_eq!(get_pixel(point_at(100.0, 100.0)), color_black());
    assert_ne!(get_pixel(point_at(99.0, 99.0)), color_black());
    close_window(test_window);
}
#[test]
fn test_draw_pixel_on_window_at_point_with_options_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_point = point_at(100.0, 100.0);
    draw_pixel_on_window(test_window, color_black(), test_point, option_defaults());
    refresh_screen();
    assert_eq!(get_pixel(point_at(100.0, 100.0)), color_black());
    assert_ne!(get_pixel(point_at(99.0, 99.0)), color_black());
    close_window(test_window);
}
#[test]
fn test_draw_pixel_on_window_integration() {
    let test_window = open_window("Test Window", 800, 600);
    draw_pixel_on_window(test_window, color_black(), 100.0, 100.0);
    refresh_screen();
    assert_eq!(get_pixel(point_at(100.0, 100.0)), color_black());
    assert_ne!(get_pixel(point_at(99.0, 99.0)), color_black());
    close_window(test_window);
}
#[test]
fn test_draw_pixel_on_window_with_options_integration() {
    let test_window = open_window("Test Window", 800, 600);
    draw_pixel_on_window(test_window, color_black(), 100.0, 100.0, option_defaults());
    refresh_screen();
    assert_eq!(get_pixel(point_at(100.0, 100.0)), color_black());
    assert_ne!(get_pixel(point_at(99.0, 99.0)), color_black());
    close_window(test_window);
}
#[test]
fn test_get_pixel_from_bitmap_at_point_integration() {
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    draw_pixel_on_bitmap(test_bitmap, color_black(), point_at(50.0, 50.0));
    let test_color = get_pixel_from_bitmap_at_point(test_bitmap, point_at(50.0, 50.0));
    assert_eq!(color_black(), test_color);
    free_bitmap(test_bitmap);
}
#[test]
fn test_get_pixel_from_bitmap_integration() {
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    draw_pixel_on_bitmap(test_bitmap, color_black(), 50.0, 50.0);
    let test_pixel_color = get_pixel_from_bitmap(test_bitmap, 50.0, 50.0);
    assert_eq!(test_pixel_color, color_black());
    free_bitmap(test_bitmap);
}
#[test]
fn test_get_pixel_at_point_integration() {
    let test_window = open_window("Test Window", 800, 600);
    draw_pixel(color_black(), point_at(100.0, 100.0));
    refresh_screen();
    assert_eq!(get_pixel_at_point(point_at(100.0, 100.0)), color_black());
    close_window(test_window);
}
#[test]
fn test_get_pixel_integration() {
    let test_window = open_window("Test Window", 800, 600);
    draw_pixel(color_black(), 100.0, 100.0);
    refresh_screen();
    assert_eq!(get_pixel(100.0, 100.0), color_black());
    close_window(test_window);
}
#[test]
fn test_get_pixel_from_window_at_point_integration() {
    let test_window = open_window("Test Window", 800, 600);
    draw_pixel(color_black(), point_at(100.0, 100.0));
    refresh_screen();
    assert_eq!(get_pixel_from_window_at_point(test_window, point_at(100.0, 100.0)), color_black());
    close_window(test_window);
}
#[test]
fn test_get_pixel_from_window_integration() {
    let test_window = open_window("Test Window", 800, 600);
    draw_pixel(color_black(), 100.0, 100.0);
    refresh_screen();
    assert_eq!(get_pixel_from_window(test_window, 100.0, 100.0), color_black());
    close_window(test_window);
}
#[test]
fn test_get_pixel_from_window_at_point_from_window_integration() {
    let test_window = open_window("Test Window", 800, 600);
    draw_pixel(color_black(), point_at(100.0, 100.0));
    refresh_screen();
    let test_pixel = get_pixel_from_window_at_point_from_window(test_window, point_at(100.0, 100.0));
    assert_eq!(color_black(), test_pixel);
    close_window(test_window);
}
#[test]
fn test_get_pixel_from_window_from_window_integration() {
    let test_window = open_window("Test Window", 800, 600);
    draw_pixel(color_black(), 100.0, 100.0);
    refresh_screen();
    let test_pixel_color = get_pixel_from_window(test_window, 100.0, 100.0);
    assert_eq!(color_black(), test_pixel_color);
    close_window(test_window);
}
#[test]
fn test_draw_quad_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_quad = quad_from(point_at(100.0, 100.0), point_at(200.0, 100.0), point_at(100.0, 200.0), point_at(200.0, 200.0));
    draw_quad(color_black(), test_quad);
    refresh_screen();
    assert!(point_in_quad(point_at(150.0, 150.0), test_quad));
    assert!(!point_in_quad(point_at(250.0, 250.0), test_quad));
    close_window(test_window);
}
#[test]
fn test_draw_quad_with_options_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_quad = quad_from(point_at(100.0, 100.0), point_at(200.0, 100.0), point_at(100.0, 200.0), point_at(200.0, 200.0));
    draw_quad_with_options(color_black(), test_quad, option_defaults());
    refresh_screen();
    assert!(point_in_quad(point_at(150.0, 150.0), test_quad));
    close_window(test_window);
}
#[test]
fn test_draw_quad_on_bitmap_integration() {
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    let test_quad = quad_from(point_at(10.0, 10.0), point_at(90.0, 10.0), point_at(10.0, 90.0), point_at(90.0, 90.0));
    draw_quad_on_bitmap(test_bitmap, color_black(), test_quad);
    assert!(pixel_drawn_at_point(test_bitmap, point_at(50.0, 50.0)));
    assert!(!pixel_drawn_at_point(test_bitmap, point_at(100.0, 100.0)));
    free_bitmap(test_bitmap);
}
#[test]
fn test_draw_quad_on_bitmap_with_options_integration() {
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    let test_quad = quad_from(point_at(10.0, 10.0), point_at(90.0, 10.0), point_at(90.0, 90.0), point_at(10.0, 90.0));
    draw_quad_on_bitmap_with_options(test_bitmap, color_black(), test_quad, option_defaults());
    assert!(pixel_drawn_at_point(test_bitmap, point_at(50.0, 50.0)));
    assert!(!pixel_drawn_at_point(test_bitmap, point_at(101.0, 50.0)));
    free_bitmap(test_bitmap);
}
#[test]
fn test_draw_quad_on_window_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_quad = quad_from(point_at(100.0, 100.0), point_at(200.0, 100.0), point_at(100.0, 200.0), point_at(200.0, 200.0));
    draw_quad_on_window(test_window, color_black(), test_quad);
    refresh_screen();
    assert!(point_in_quad(point_at(150.0, 150.0), test_quad));
    close_window(test_window);
}
#[test]
fn test_draw_quad_on_window_with_options_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_quad = quad_from(point_at(100.0, 100.0), point_at(200.0, 100.0), point_at(100.0, 200.0), point_at(200.0, 200.0));
    draw_quad_on_window(test_window, color_black(), test_quad, option_defaults());
    refresh_screen();
    assert!(point_in_quad(point_at(150.0, 150.0), test_quad));
    close_window(test_window);
}
#[test]
fn test_draw_rectangle_record_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_rectangle = rectangle_from(100.0, 100.0, 200.0, 150.0);
    draw_rectangle(color_black(), test_rectangle);
    refresh_screen();
    assert!(point_in_rectangle(point_at(150.0, 125.0), test_rectangle));
    assert!(!point_in_rectangle(point_at(301.0, 251.0), test_rectangle));
    close_window(test_window);
}
#[test]
fn test_draw_rectangle_record_with_options_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_rectangle = rectangle_from(100.0, 100.0, 200.0, 150.0);
    draw_rectangle(color_black(), test_rectangle, option_defaults());
    refresh_screen();
    assert!(point_in_rectangle(point_at(150.0, 125.0), test_rectangle));
    assert!(!point_in_rectangle(point_at(350.0, 300.0), test_rectangle));
    close_window(test_window);
}
#[test]
fn test_draw_rectangle_integration() {
    let test_window = open_window("Test Window", 800, 600);
    draw_rectangle(color_black(), 100.0, 100.0, 200.0, 150.0);
    refresh_screen();
    assert!(point_in_rectangle(point_at(150.0, 125.0), rectangle_from(100.0, 100.0, 200.0, 150.0)));
    assert!(!point_in_rectangle(point_at(301.0, 251.0), rectangle_from(100.0, 100.0, 200.0, 150.0)));
    close_window(test_window);
}
#[test]
fn test_draw_rectangle_with_options_integration() {
    let test_window = open_window("Test Window", 800, 600);
    draw_rectangle_with_options(color_black(), 100.0, 100.0, 200.0, 150.0, option_line_width(3, option_defaults()));
    refresh_screen();
    assert!(point_in_rectangle(point_at(150.0, 125.0), rectangle_from(100.0, 100.0, 200.0, 150.0)));
    assert!(!point_in_rectangle(point_at(301.0, 251.0), rectangle_from(100.0, 100.0, 200.0, 150.0)));
    close_window(test_window);
}
#[test]
fn test_draw_rectangle_on_bitmap_record_integration() {
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    let test_rectangle = rectangle_from(50.0, 50.0, 20.0, 30.0);
    draw_rectangle_on_bitmap(test_bitmap, color_black(), test_rectangle);
    assert!(pixel_drawn_at_point(test_bitmap, point_at(50.0, 50.0)));
    assert!(!pixel_drawn_at_point(test_bitmap, point_at(80.0, 90.0)));
    free_bitmap(test_bitmap);
}
#[test]
fn test_draw_rectangle_on_bitmap_record_with_options_integration() {
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    let test_rectangle = rectangle_from(50.0, 50.0, 20.0, 20.0);
    draw_rectangle_on_bitmap(test_bitmap, color_black(), test_rectangle, option_defaults());
    assert!(pixel_drawn_at_point(test_bitmap, point_at(50.0, 50.0)));
    assert!(!pixel_drawn_at_point(test_bitmap, point_at(75.0, 75.0)));
    free_bitmap(test_bitmap);
}
#[test]
fn test_draw_rectangle_on_bitmap_integration() {
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    draw_rectangle_on_bitmap(test_bitmap, color_black(), 50.0, 50.0, 20.0, 20.0);
    assert!(pixel_drawn_at_point(test_bitmap, 50.0, 50.0));
    assert!(!pixel_drawn_at_point(test_bitmap, 75.0, 75.0));
    free_bitmap(test_bitmap);
}
#[test]
fn test_draw_rectangle_on_bitmap_with_options_integration() {
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    draw_rectangle_on_bitmap_with_options(test_bitmap, color_black(), 50.0, 50.0, 20.0, 20.0, option_defaults());
    assert!(pixel_drawn_at_point(test_bitmap, 50.0, 50.0));
    assert!(!pixel_drawn_at_point(test_bitmap, 75.0, 75.0));
    free_bitmap(test_bitmap);
}
#[test]
fn test_draw_rectangle_on_window_record_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_rectangle = rectangle_from(100.0, 100.0, 50.0, 50.0);
    draw_rectangle_on_window(test_window, color_black(), test_rectangle);
    refresh_screen();
    assert!(point_in_rectangle(point_at(125.0, 125.0), test_rectangle));
    assert!(!point_in_rectangle(point_at(200.0, 200.0), test_rectangle));
    close_window(test_window);
}
#[test]
fn test_draw_rectangle_on_window_record_with_options_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_rectangle = rectangle_from(100.0, 100.0, 50.0, 50.0);
    draw_rectangle_on_window(test_window, color_black(), test_rectangle, option_defaults());
    refresh_screen();
    assert!(point_in_rectangle(point_at(125.0, 125.0), test_rectangle));
    assert!(!point_in_rectangle(point_at(175.0, 175.0), test_rectangle));
    close_window(test_window);
}
#[test]
fn test_draw_rectangle_on_window_integration() {
    let test_window = open_window("Test Window", 800, 600);
    draw_rectangle_on_window(test_window, color_black(), 100.0, 100.0, 50.0, 50.0);
    refresh_screen();
    assert!(point_in_rectangle(point_at(100.0, 100.0), rectangle_from(100.0, 100.0, 50.0, 50.0)));
    assert!(!point_in_rectangle(point_at(200.0, 200.0), rectangle_from(100.0, 100.0, 50.0, 50.0)));
    close_window(test_window);
}
#[test]
fn test_draw_rectangle_on_window_with_options_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_rectangle = rectangle_from(100.0, 100.0, 50.0, 50.0);
    draw_rectangle_on_window(test_window, color_black(), test_rectangle, option_defaults());
    refresh_screen();
    assert!(point_in_rectangle(point_at(125.0, 125.0), test_rectangle));
    assert!(!point_in_rectangle(point_at(200.0, 200.0), test_rectangle));
    close_window(test_window);
}
#[test]
fn test_fill_quad_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_quad = quad_from(point_at(100.0, 100.0), point_at(300.0, 100.0), point_at(100.0, 300.0), point_at(300.0, 300.0));
    fill_quad(color_black(), test_quad);
    refresh_screen();
    assert!(point_in_quad(point_at(200.0, 200.0), test_quad));
    assert!(!point_in_quad(point_at(400.0, 400.0), test_quad));
    close_window(test_window);
}
#[test]
fn test_fill_quad_with_options_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_quad = quad_from(point_at(100.0, 100.0), point_at(300.0, 100.0), point_at(100.0, 300.0), point_at(300.0, 300.0));
    fill_quad_with_options(color_black(), test_quad, option_defaults());
    refresh_screen();
    assert!(point_in_quad(point_at(200.0, 200.0), test_quad));
    assert!(!point_in_quad(point_at(400.0, 400.0), test_quad));
    close_window(test_window);
}
#[test]
fn test_fill_quad_on_bitmap_integration() {
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    let test_quad = quad_from(point_at(10.0, 10.0), point_at(90.0, 10.0), point_at(10.0, 90.0), point_at(90.0, 90.0));
    fill_quad_on_bitmap(test_bitmap, color_black(), test_quad);
    assert!(pixel_drawn_at_point(test_bitmap, point_at(50.0, 50.0)));
    assert!(!pixel_drawn_at_point(test_bitmap, point_at(0.0, 0.0)));
    free_bitmap(test_bitmap);
}
#[test]
fn test_fill_quad_on_bitmap_with_options_integration() {
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    let test_quad = quad_from(point_at(10.0, 10.0), point_at(90.0, 10.0), point_at(90.0, 90.0), point_at(10.0, 90.0));
    fill_quad_on_bitmap_with_options(test_bitmap, color_black(), test_quad, option_defaults());
    assert!(pixel_drawn_at_point(test_bitmap, point_at(50.0, 50.0)));
    assert!(!pixel_drawn_at_point(test_bitmap, point_at(101.0, 50.0)));
    free_bitmap(test_bitmap);
}
#[test]
fn test_fill_quad_on_window_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_quad = quad_from(point_at(100.0, 100.0), point_at(200.0, 100.0), point_at(100.0, 200.0), point_at(200.0, 200.0));
    fill_quad_on_window(test_window, color_black(), test_quad);
    refresh_screen();
    assert!(point_in_quad(point_at(150.0, 150.0), test_quad));
    close_window(test_window);
}
#[test]
fn test_fill_quad_on_window_with_options_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_quad = quad_from(point_at(100.0, 100.0), point_at(200.0, 100.0), point_at(200.0, 200.0), point_at(100.0, 200.0));
    fill_quad_on_window(test_window, color_black(), test_quad, option_defaults());
    refresh_screen();
    assert!(point_in_quad(point_at(150.0, 150.0), test_quad));
    assert!(!point_in_quad(point_at(250.0, 150.0), test_quad));
    close_window(test_window);
}
#[test]
fn test_fill_rectangle_record_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_rectangle = rectangle_from(100.0, 100.0, 200.0, 150.0);
    fill_rectangle(color_black(), test_rectangle);
    refresh_screen();
    assert!(point_in_rectangle(point_at(150.0, 125.0), test_rectangle));
    assert!(!point_in_rectangle(point_at(350.0, 275.0), test_rectangle));
    close_window(test_window);
}
#[test]
fn test_fill_rectangle_record_with_options_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_rectangle = rectangle_from(100.0, 100.0, 200.0, 150.0);
    fill_rectangle_record_with_options(color_black(), test_rectangle, option_defaults());
    refresh_screen();
    assert!(point_in_rectangle(point_at(150.0, 125.0), test_rectangle));
    assert!(!point_in_rectangle(point_at(350.0, 275.0), test_rectangle));
    close_window(test_window);
}
#[test]
fn test_fill_rectangle_integration() {
    let test_window = open_window("Test Window", 800, 600);
    fill_rectangle(color_black(), 100.0, 100.0, 200.0, 150.0);
    refresh_screen();
    assert!(point_in_rectangle(point_at(150.0, 125.0), rectangle_from(100.0, 100.0, 200.0, 150.0)));
    assert!(!point_in_rectangle(point_at(301.0, 251.0), rectangle_from(100.0, 100.0, 200.0, 150.0)));
    close_window(test_window);
}
#[test]
fn test_fill_rectangle_with_options_integration() {
    let test_window = open_window("Test Window", 800, 600);
    fill_rectangle(color_black(), 100.0, 100.0, 200.0, 150.0, option_defaults());
    refresh_screen();
    assert!(point_in_rectangle(point_at(150.0, 125.0), rectangle_from(100.0, 100.0, 200.0, 150.0)));
    assert!(!point_in_rectangle(point_at(301.0, 251.0), rectangle_from(100.0, 100.0, 200.0, 150.0)));
    close_window(test_window);
}
#[test]
fn test_fill_rectangle_on_bitmap_record_integration() {
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    let test_rectangle = rectangle_from(25.0, 25.0, 50.0, 50.0);
    fill_rectangle_on_bitmap(test_bitmap, color_black(), test_rectangle);
    assert!(pixel_drawn_at_point(test_bitmap, point_at(50.0, 50.0)));
    assert!(!pixel_drawn_at_point(test_bitmap, point_at(10.0, 10.0)));
    free_bitmap(test_bitmap);
}
#[test]
fn test_fill_rectangle_on_bitmap_record_with_options_integration() {
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    let test_rectangle = rectangle_from(25.0, 25.0, 50.0, 50.0);
    fill_rectangle_on_bitmap(test_bitmap, color_black(), test_rectangle, option_defaults());
    assert!(pixel_drawn_at_point(test_bitmap, point_at(50.0, 50.0)));
    assert!(!pixel_drawn_at_point(test_bitmap, point_at(10.0, 10.0)));
    free_bitmap(test_bitmap);
}
#[test]
fn test_fill_rectangle_on_bitmap_integration() {
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    fill_rectangle_on_bitmap(test_bitmap, color_black(), 25.0, 25.0, 50.0, 50.0);
    assert!(pixel_drawn_at_point(test_bitmap, 50.0, 50.0));
    assert!(!pixel_drawn_at_point(test_bitmap, 75.0, 75.0));
    free_bitmap(test_bitmap);
}
#[test]
fn test_fill_rectangle_on_bitmap_with_options_integration() {
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    fill_rectangle_on_bitmap(test_bitmap, color_black(), 25.0, 25.0, 50.0, 50.0, option_defaults());
    assert!(pixel_drawn_at_point(test_bitmap, point_at(50.0, 50.0)));
    assert!(!pixel_drawn_at_point(test_bitmap, point_at(10.0, 10.0)));
    free_bitmap(test_bitmap);
}
#[test]
fn test_fill_rectangle_on_window_record_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_rectangle = rectangle_from(100.0, 100.0, 200.0, 150.0);
    fill_rectangle_on_window(test_window, color_black(), test_rectangle);
    refresh_screen();
    assert!(point_in_rectangle(point_at(150.0, 125.0), test_rectangle));
    assert!(!point_in_rectangle(point_at(350.0, 275.0), test_rectangle));
    close_window(test_window);
}
#[test]
fn test_fill_rectangle_on_window_record_with_options_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_rectangle = rectangle_from(100.0, 100.0, 200.0, 150.0);
    fill_rectangle_on_window(test_window, color_black(), test_rectangle, option_defaults());
    refresh_screen();
    assert!(point_in_rectangle(point_at(150.0, 125.0), test_rectangle));
    assert!(!point_in_rectangle(point_at(350.0, 275.0), test_rectangle));
    close_window(test_window);
}
#[test]
fn test_fill_rectangle_on_window_integration() {
    let test_window = open_window("Test Window", 800, 600);
    fill_rectangle_on_window(test_window, color_black(), 100.0, 100.0, 50.0, 50.0);
    refresh_screen();
    assert!(point_in_rectangle(point_at(125.0, 125.0), rectangle_from(100.0, 100.0, 50.0, 50.0)));
    assert!(!point_in_rectangle(point_at(175.0, 175.0), rectangle_from(100.0, 100.0, 50.0, 50.0)));
    close_window(test_window);
}
#[test]
fn test_fill_rectangle_on_window_with_options_integration() {
    let test_window = open_window("Test Window", 800, 600);
    fill_rectangle_on_window(test_window, color_black(), 100.0, 100.0, 50.0, 50.0, option_defaults());
    refresh_screen();
    assert!(point_in_rectangle(point_at(125.0, 125.0), rectangle_from(100.0, 100.0, 50.0, 50.0)));
    assert!(!point_in_rectangle(point_at(175.0, 175.0), rectangle_from(100.0, 100.0, 50.0, 50.0)));
    close_window(test_window);
}
#[test]
fn test_draw_text_font_as_string_integration() {
    let test_window = open_window("Text Drawing Test", 800, 600);
    draw_text_font_as_string("Hello, World!", color_black(), "hara", 24, 100.0, 100.0);
    refresh_screen();
    let test_rectangle = rectangle_from(100.0, 100.0, text_width("Hello, World!", get_system_font(), 12), text_height("Hello, World!", get_system_font(), 12));
    assert!(point_in_rectangle(point_at(100.0, 100.0), test_rectangle));
    close_window(test_window);
}
#[test]
fn test_draw_text_with_options_font_as_string_integration() {
    let test_window = open_window("Test Window", 800, 600);
    draw_text("Hello, World!", color_black(), "leaguegothic", 24, 100.0, 100.0, option_defaults());
    refresh_screen();
    let test_rectangle = rectangle_from(100.0, 100.0, text_width("Hello, World!", get_system_font(), 12), text_height("Hello, World!", get_system_font(), 12));
    assert!(point_in_rectangle(point_at(100.0, 100.0), test_rectangle));
    close_window(test_window);
}
#[test]
fn test_draw_text_no_font_no_size_integration() {
    let test_window = open_window("Test Window", 800, 600);
    draw_text_no_font_no_size("Hello, World!", color_black(), 100.0, 100.0);
    refresh_screen();
    let test_rectangle = rectangle_from(100.0, 100.0, text_width("Hello, World!", get_system_font(), 12), text_height("Hello, World!", get_system_font(), 12));
    assert!(point_in_rectangle(point_at(100.0, 100.0), test_rectangle));
    close_window(test_window);
}
#[test]
fn test_draw_text_no_font_no_size_with_options_integration() {
    let test_window = open_window("Test Window", 800, 600);
    draw_text_no_font_no_size_with_options("Hello, World!", color_black(), 100.0, 100.0, option_defaults());
    refresh_screen();
    let test_rectangle = rectangle_from(100.0, 100.0, text_width("Hello, World!", get_system_font(), 12), text_height("Hello, World!", get_system_font(), 12));
    assert!(point_in_rectangle(point_at(100.0, 100.0), test_rectangle));
    close_window(test_window);
}
#[test]
fn test_draw_text_integration() {
    let test_window = open_window("Test Window", 800, 600);
    draw_text("Hello, World!", color_black(), font_named("hara"), 24, 100.0, 100.0);
    refresh_screen();
    let test_rectangle = rectangle_from(100.0, 100.0, text_width("Hello, World!", get_system_font(), 12), text_height("Hello, World!", get_system_font(), 12));
    assert!(point_in_rectangle(point_at(100.0, 100.0), test_rectangle));
    close_window(test_window);
}
#[test]
fn test_draw_text_with_options_integration() {
    let test_window = open_window("Test Window", 800, 600);
    draw_text_with_options("Hello, World!", color_black(), font_named("hara"), 24, 100.0, 100.0, option_defaults());
    refresh_screen();
    let test_rectangle = rectangle_from(100.0, 100.0, text_width("Hello, World!", get_system_font(), 12), text_height("Hello, World!", get_system_font(), 12));
    assert!(point_in_rectangle(point_at(100.0, 100.0), test_rectangle));
    close_window(test_window);
}
#[test]
fn test_draw_text_on_bitmap_font_as_string_integration() {
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    draw_text_on_bitmap(test_bitmap, "Hello", color_black(), "hara", 12, 10.0, 10.0);
    assert!(pixel_drawn_at_point(test_bitmap, 10.0, 10.0));
    assert!(!pixel_drawn_at_point(test_bitmap, 90.0, 90.0));
    free_bitmap(test_bitmap);
}
#[test]
fn test_draw_text_on_bitmap_with_options_font_as_string_integration() {
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    draw_text_on_bitmap(test_bitmap, "Hello", color_black(), "hara", 12, 10.0, 10.0, option_defaults());
    assert!(pixel_drawn_at_point(test_bitmap, 10.0, 10.0));
    assert!(!pixel_drawn_at_point(test_bitmap, 90.0, 90.0));
    free_bitmap(test_bitmap);
}
#[test]
fn test_draw_text_on_bitmap_no_font_no_size_integration() {
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    draw_text_on_bitmap(test_bitmap, "Test", color_black(), 10.0, 10.0);
    assert!(pixel_drawn_at_point(test_bitmap, 10.0, 10.0));
    assert!(!pixel_drawn_at_point(test_bitmap, 90.0, 90.0));
    free_bitmap(test_bitmap);
}
#[test]
fn test_draw_text_on_bitmap_no_font_no_size_with_options_integration() {
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    draw_text_on_bitmap(test_bitmap, "Test", color_black(), 10.0, 10.0, option_defaults());
    assert!(pixel_drawn_at_point(test_bitmap, 10.0, 10.0));
    assert!(!pixel_drawn_at_point(test_bitmap, 90.0, 90.0));
    free_bitmap(test_bitmap);
}
#[test]
fn test_draw_text_on_bitmap_integration() {
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    draw_text_on_bitmap(test_bitmap, "Hello", color_black(), font_named("hara"), 12, 10.0, 10.0);
    assert!(pixel_drawn_at_point(test_bitmap, 10.0, 10.0));
    assert!(!pixel_drawn_at_point(test_bitmap, 90.0, 90.0));
    free_bitmap(test_bitmap);
}
#[test]
fn test_draw_text_on_bitmap_with_options_integration() {
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    draw_text_on_bitmap(test_bitmap, "Test", color_black(), font_named("hara"), 24, 10.0, 10.0, option_defaults());
    assert!(pixel_drawn_at_point(test_bitmap, 10.0, 10.0));
    assert!(!pixel_drawn_at_point(test_bitmap, 90.0, 90.0));
    free_bitmap(test_bitmap);
}
#[test]
fn test_draw_text_on_window_font_as_string_integration() {
    let test_window = open_window("Test Window", 800, 600);
    draw_text_on_window(test_window, "Hello, World!", color_black(), "hara", 24, 10.0, 10.0);
    refresh_screen();
    let test_rectangle = rectangle_from(100.0, 100.0, text_width("Hello, World!", get_system_font(), 12), text_height("Hello, World!", get_system_font(), 12));
    assert!(point_in_rectangle(point_at(100.0, 100.0), test_rectangle));
    close_window(test_window);
}
#[test]
fn test_draw_text_on_window_with_options_font_as_string_integration() {
    let test_window = open_window("Test Window", 800, 600);
    draw_text_on_window(test_window, "Hello, World!", color_black(), "hara", 24, 10.0, 10.0, option_defaults());
    refresh_screen();
    let test_rectangle = rectangle_from(100.0, 100.0, text_width("Hello, World!", get_system_font(), 12), text_height("Hello, World!", get_system_font(), 12));
    assert!(point_in_rectangle(point_at(100.0, 100.0), test_rectangle));
    close_window(test_window);
}
#[test]
fn test_draw_text_on_window_no_font_no_size_integration() {
    let test_window = open_window("Test Window", 800, 600);
    draw_text_on_window(test_window, "Hello, World!", color_black(), 10.0, 10.0);
    refresh_screen();
    let test_rectangle = rectangle_from(100.0, 100.0, text_width("Hello, World!", get_system_font(), 12), text_height("Hello, World!", get_system_font(), 12));
    assert!(point_in_rectangle(point_at(100.0, 100.0), test_rectangle));
    close_window(test_window);
}
#[test]
fn test_draw_text_on_window_no_font_no_size_with_options_integration() {
    let test_window = open_window("Test Window", 800, 600);
    draw_text_on_window(test_window, "Hello, World!", color_black(), 10.0, 10.0, option_defaults());
    refresh_screen();
    let test_rectangle = rectangle_from(100.0, 100.0, text_width("Hello, World!", get_system_font(), 12), text_height("Hello, World!", get_system_font(), 12));
    assert!(point_in_rectangle(point_at(100.0, 100.0), test_rectangle));
    close_window(test_window);
}
#[test]
fn test_draw_text_on_window_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_font = load_font("test_font", "hara.ttf");
    font_load_size(test_font, 24);
    draw_text_on_window(test_window, "Hello, World!", color_black(), test_font, 24, 10.0, 10.0);
    refresh_screen();
    let test_rectangle = rectangle_from(100.0, 100.0, text_width("Hello, World!", get_system_font(), 12), text_height("Hello, World!", get_system_font(), 12));
    assert!(point_in_rectangle(point_at(100.0, 100.0), test_rectangle));
    close_window(test_window);
    free_font(test_font);
}
#[test]
fn test_draw_text_on_window_with_options_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_font = load_font("test_font", "hara.ttf");
    draw_text_on_window(test_window, "Hello, World!", color_black(), test_font, 24, 10.0, 10.0, option_defaults());
    refresh_screen();
    let test_rectangle = rectangle_from(100.0, 100.0, text_width("Hello, World!", get_system_font(), 12), text_height("Hello, World!", get_system_font(), 12));
    assert!(point_in_rectangle(point_at(100.0, 100.0), test_rectangle));
    close_window(test_window);
    free_font(test_font);
}
#[test]
fn test_font_has_size_name_as_string_integration() {
    let test_result1 = font_has_size_name_as_string("hara", 12);
    assert!(test_result1);
    let test_result2 = font_has_size_name_as_string("nonexistent_font", 12);
    assert!(!test_result2);
}
#[test]
fn test_font_has_size_integration() {
    let test_font = load_font("test_font", "hara.ttf");
    let has_size_12 = font_has_size(test_font, 12);
    assert!(has_size_12);
    let has_size_999 = font_has_size(test_font, 999);
    assert!(!has_size_999);
    free_font(test_font);
}
#[test]
fn test_font_load_size_name_as_string_integration() {
    font_load_size("test_font", 12);
    let test_font_size_check = font_has_size("test_font", 12);
    assert!(test_font_size_check);
}
#[test]
fn test_font_load_size_integration() {
    let test_font = load_font("test_font", "hara.ttf");
    font_load_size(test_font, 12);
    assert!(font_has_size(test_font, 12));
    free_font(test_font);
}
#[test]
fn test_font_named_integration() {
    let test_window = open_window("Font Test", 800, 600);
    let test_font = font_named("hara");
    draw_text("Test Text", color_black(), test_font, 24, 100.0, 100.0);
    refresh_screen();
    assert!(test_font.is_some());
    close_window(test_window);
}
#[test]
fn test_free_all_fonts_integration() {
    let test_font = load_font("test_font", "hara.ttf");
    let test_font_named = font_named("test_font");
    assert!(test_font_named.is_some());
    free_all_fonts();
    let test_has_font = has_font("test_font");
    assert!(!test_has_font);
}
#[test]
fn test_free_font_integration() {
    let test_font = load_font("test_font", "hara.ttf");
    free_font(test_font);
    assert!(!has_font(test_font));
}
#[test]
fn test_get_font_style_name_as_string_integration() {
    let test_font = load_font("test_font", "hara.ttf");
    let test_style = get_font_style("test_font");
    assert!(test_style.is_some());
    free_font(test_font);
}
#[test]
fn test_get_font_style_integration() {
    let test_font = load_font("test_font", "hara.ttf");
    let test_style = get_font_style(test_font);
    assert_ne!(test_style, FontStyle::BoldFont);
    free_font(test_font);
}
#[test]
fn test_get_system_font_integration() {
    let test_font = get_system_font();
    assert!(test_font.is_some());
    let test_has_size = font_has_size(test_font, 12);
    assert!(test_has_size);
}
#[test]
fn test_has_font_integration() {
    let test_font = load_font("test_font", "hara.ttf");
    assert!(has_font(test_font));
    free_font(test_font);
    assert!(!has_font(test_font));
}
#[test]
fn test_has_font_name_as_string_integration() {
    let test_result_hara = has_font("hara");
    assert!(test_result_hara);
    let test_result_nonexistent = has_font("nonexistent_font");
    assert!(!test_result_nonexistent);
}
#[test]
fn test_load_font_integration() {
    let test_window = open_window("Font Test", 800, 600);
    let test_font = load_font("test_font", "hara.ttf");
    draw_text("Hello, World!", color_black(), test_font, 24, 100.0, 100.0, option_defaults());
    refresh_screen();
    assert!(has_font("test_font"));
    close_window(test_window);
    free_font(test_font);
}
#[test]
fn test_set_font_style_name_as_string_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_font = load_font("test_font", "hara.ttf");
    font_load_size("test_font", 24);
    set_font_style_name_as_string("test_font", FontStyle::BoldFont);
    draw_text("Bold Text", color_black(), "test_font", 24, 100.0, 100.0);
    refresh_screen();
    assert_eq!(get_font_style_name_as_string("test_font"), FontStyle::BoldFont);
    close_window(test_window);
    free_font(test_font);
}
#[test]
fn test_set_font_style_integration() {
    let test_font = font_named("hara");
    set_font_style(test_font, FontStyle::BoldFont);
    let test_style = get_font_style(test_font);
    assert_eq!(test_style, FontStyle::BoldFont);
    free_font(test_font);
}
#[test]
fn test_text_height_font_named_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_height = text_height_font_named("Hello, World!", "hara", 24);
    assert!(test_height > 0);
    close_window(test_window);
}
#[test]
fn test_text_height_integration() {
    let test_font = load_font("test_font", "hara.ttf");
    font_load_size(test_font, 24);
    let test_height = text_height("Hello, World!", test_font, 24);
    assert!(test_height > 0);
    free_font(test_font);
}
#[test]
fn test_text_width_font_named_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_width = text_width_font_named("Hello, World!", "hara", 24);
    draw_text("Hello, World!", color_black(), "hara", 24, 100.0, 100.0);
    refresh_screen();
    assert!(test_width > 0);
    close_window(test_window);
}
#[test]
fn test_text_width_integration() {
    let test_font = load_font("test_font", "hara.ttf");
    font_load_size(test_font, 12);
    let test_width = text_width("Hello, World!", test_font, 12);
    assert!(test_width > 0);
    free_font(test_font);
}
#[test]
fn test_draw_triangle_record_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_triangle = triangle_from(point_at(100.0, 100.0), point_at(200.0, 200.0), point_at(150.0, 300.0));
    draw_triangle(color_black(), test_triangle);
    refresh_screen();
    assert!(point_in_triangle(point_at(150.0, 200.0), test_triangle));
    assert!(!point_in_triangle(point_at(300.0, 300.0), test_triangle));
    close_window(test_window);
}
#[test]
fn test_draw_triangle_record_with_options_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_triangle = triangle_from(point_at(100.0, 100.0), point_at(200.0, 200.0), point_at(150.0, 300.0));
    draw_triangle(color_black(), test_triangle, option_defaults());
    refresh_screen();
    assert!(point_in_triangle(point_at(150.0, 150.0), test_triangle));
    assert!(!point_in_triangle(point_at(300.0, 300.0), test_triangle));
    close_window(test_window);
}
#[test]
fn test_draw_triangle_integration() {
    let test_window = open_window("Triangle Test", 800, 600);
    draw_triangle(color_black(), 100.0, 100.0, 200.0, 300.0, 300.0, 100.0);
    refresh_screen();
    assert!(point_in_triangle(point_at(150.0, 150.0), triangle_from(point_at(100.0, 100.0), point_at(200.0, 300.0), point_at(300.0, 100.0))));
    close_window(test_window);
}
#[test]
fn test_draw_triangle_with_options_integration() {
    let test_window = open_window("Triangle Test", 800, 600);
    draw_triangle_with_options(color_black(), 100.0, 100.0, 200.0, 200.0, 150.0, 300.0, option_defaults());
    refresh_screen();
    assert!(point_in_triangle(point_at(150.0, 150.0), triangle_from(point_at(100.0, 100.0), point_at(200.0, 200.0), point_at(150.0, 300.0))));
    close_window(test_window);
}
#[test]
fn test_draw_triangle_on_bitmap_record_integration() {
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    let test_triangle = triangle_from(point_at(25.0, 25.0), point_at(75.0, 25.0), point_at(50.0, 75.0));
    draw_triangle_on_bitmap(test_bitmap, color_black(), test_triangle);
    assert!(pixel_drawn_at_point(test_bitmap, point_at(50.0, 50.0)));
    assert!(!pixel_drawn_at_point(test_bitmap, point_at(10.0, 10.0)));
    free_bitmap(test_bitmap);
}
#[test]
fn test_draw_triangle_on_bitmap_record_with_options_integration() {
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    let test_triangle = triangle_from(point_at(25.0, 25.0), point_at(75.0, 25.0), point_at(50.0, 75.0));
    draw_triangle_on_bitmap(test_bitmap, color_black(), test_triangle, option_defaults());
    assert!(pixel_drawn_at_point(test_bitmap, point_at(50.0, 50.0)));
    assert!(!pixel_drawn_at_point(test_bitmap, point_at(10.0, 10.0)));
    free_bitmap(test_bitmap);
}
#[test]
fn test_draw_triangle_on_bitmap_integration() {
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    draw_triangle_on_bitmap(test_bitmap, color_black(), 25.0, 25.0, 75.0, 25.0, 50.0, 75.0);
    assert!(pixel_drawn_at_point(test_bitmap, point_at(50.0, 50.0)));
    assert!(!pixel_drawn_at_point(test_bitmap, point_at(10.0, 10.0)));
    free_bitmap(test_bitmap);
}
#[test]
fn test_draw_triangle_on_bitmap_with_options_integration() {
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    draw_triangle_on_bitmap(test_bitmap, color_black(), 10.0, 10.0, 50.0, 90.0, 90.0, 10.0, option_defaults());
    assert!(pixel_drawn_at_point(test_bitmap, point_at(50.0, 50.0)));
    assert!(!pixel_drawn_at_point(test_bitmap, point_at(100.0, 100.0)));
    free_bitmap(test_bitmap);
}
#[test]
fn test_draw_triangle_on_window_record_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_triangle = triangle_from(point_at(100.0, 100.0), point_at(200.0, 200.0), point_at(150.0, 300.0));
    draw_triangle_on_window(test_window, color_black(), test_triangle);
    refresh_screen();
    assert!(point_in_triangle(point_at(150.0, 200.0), test_triangle));
    close_window(test_window);
}
#[test]
fn test_draw_triangle_on_window_record_with_options_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_triangle = triangle_from(point_at(100.0, 100.0), point_at(200.0, 200.0), point_at(150.0, 250.0));
    draw_triangle_on_window(test_window, color_black(), test_triangle, option_defaults());
    refresh_screen();
    assert!(point_in_triangle(point_at(150.0, 150.0), test_triangle));
    close_window(test_window);
}
#[test]
fn test_draw_triangle_on_window_integration() {
    let test_window = open_window("Test Window", 800, 600);
    draw_triangle_on_window(test_window, color_black(), 100.0, 100.0, 200.0, 300.0, 300.0, 100.0);
    refresh_screen();
    assert!(point_in_triangle(point_at(200.0, 200.0), triangle_from(point_at(100.0, 100.0), point_at(200.0, 300.0), point_at(300.0, 100.0))));
    close_window(test_window);
}
#[test]
fn test_draw_triangle_on_window_with_options_integration() {
    let test_window = open_window("Test Window", 800, 600);
    draw_triangle_on_window_with_options(test_window, color_black(), 100.0, 100.0, 200.0, 200.0, 150.0, 300.0, option_defaults());
    refresh_screen();
    assert!(point_in_triangle(point_at(150.0, 200.0), triangle_from(100.0, 100.0, 200.0, 200.0, 150.0, 300.0)));
    close_window(test_window);
}
#[test]
fn test_fill_triangle_record_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_triangle = triangle_from(point_at(100.0, 100.0), point_at(200.0, 300.0), point_at(300.0, 100.0));
    fill_triangle(color_black(), test_triangle);
    refresh_screen();
    assert!(point_in_triangle(point_at(200.0, 200.0), test_triangle));
    assert!(!point_in_triangle(point_at(400.0, 400.0), test_triangle));
    close_window(test_window);
}
#[test]
fn test_fill_triangle_record_with_options_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_triangle = triangle_from(point_at(100.0, 100.0), point_at(200.0, 300.0), point_at(300.0, 100.0));
    fill_triangle(color_black(), test_triangle, option_defaults());
    refresh_screen();
    assert!(point_in_triangle(point_at(200.0, 200.0), test_triangle));
    assert!(!point_in_triangle(point_at(400.0, 400.0), test_triangle));
    close_window(test_window);
}
#[test]
fn test_fill_triangle_integration() {
    let test_window = open_window("Test Window", 800, 600);
    fill_triangle(color_black(), 100.0, 100.0, 200.0, 300.0, 300.0, 100.0);
    refresh_screen();
    assert!(point_in_triangle(point_at(150.0, 150.0), triangle_from(point_at(100.0, 100.0), point_at(200.0, 300.0), point_at(300.0, 100.0))));
    close_window(test_window);
}
#[test]
fn test_fill_triangle_with_options_integration() {
    let test_window = open_window("Triangle Test", 800, 600);
    fill_triangle_with_options(color_red(), 100.0, 100.0, 200.0, 300.0, 300.0, 100.0, option_defaults());
    refresh_screen();
    assert!(point_in_triangle(point_at(150.0, 150.0), triangle_from(point_at(100.0, 100.0), point_at(200.0, 300.0), point_at(300.0, 100.0))));
    assert!(!point_in_triangle(point_at(350.0, 150.0), triangle_from(point_at(100.0, 100.0), point_at(200.0, 300.0), point_at(300.0, 100.0))));
    close_window(test_window);
}
#[test]
fn test_fill_triangle_on_bitmap_record_integration() {
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    let test_triangle = triangle_from(point_at(25.0, 25.0), point_at(75.0, 25.0), point_at(50.0, 75.0));
    fill_triangle_on_bitmap(test_bitmap, color_black(), test_triangle);
    assert!(pixel_drawn_at_point(test_bitmap, point_at(50.0, 50.0)));
    assert!(!pixel_drawn_at_point(test_bitmap, point_at(0.0, 0.0)));
    free_bitmap(test_bitmap);
}
#[test]
fn test_fill_triangle_on_bitmap_record_with_options_integration() {
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    let test_triangle = triangle_from(point_at(25.0, 25.0), point_at(75.0, 25.0), point_at(50.0, 75.0));
    fill_triangle_on_bitmap(test_bitmap, color_black(), test_triangle, option_defaults());
    assert!(pixel_drawn_at_point(test_bitmap, point_at(50.0, 50.0)));
    assert!(!pixel_drawn_at_point(test_bitmap, point_at(10.0, 10.0)));
    free_bitmap(test_bitmap);
}
#[test]
fn test_fill_triangle_on_bitmap_integration() {
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    fill_triangle_on_bitmap(test_bitmap, color_black(), 25.0, 25.0, 75.0, 25.0, 50.0, 75.0);
    assert!(pixel_drawn_at_point(test_bitmap, 50.0, 50.0));
    assert!(!pixel_drawn_at_point(test_bitmap, 0.0, 0.0));
    free_bitmap(test_bitmap);
}
#[test]
fn test_fill_triangle_on_bitmap_with_options_integration() {
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    fill_triangle_on_bitmap_with_options(test_bitmap, color_black(), 25.0, 25.0, 75.0, 25.0, 50.0, 75.0, option_defaults());
    assert!(pixel_drawn_at_point(test_bitmap, 50.0, 50.0));
    assert!(!pixel_drawn_at_point(test_bitmap, 0.0, 0.0));
    free_bitmap(test_bitmap);
}
#[test]
fn test_fill_triangle_on_window_record_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_triangle = triangle_from(point_at(100.0, 100.0), point_at(200.0, 300.0), point_at(300.0, 100.0));
    fill_triangle_on_window(test_window, color_black(), test_triangle);
    refresh_screen();
    assert!(point_in_triangle(point_at(200.0, 200.0), test_triangle));
    close_window(test_window);
}
#[test]
fn test_fill_triangle_on_window_record_with_options_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_triangle = triangle_from(point_at(100.0, 100.0), point_at(200.0, 300.0), point_at(300.0, 100.0));
    fill_triangle_on_window(test_window, color_black(), test_triangle, option_defaults());
    refresh_screen();
    assert!(point_in_triangle(point_at(200.0, 200.0), test_triangle));
    close_window(test_window);
}
#[test]
fn test_fill_triangle_on_window_integration() {
    let test_window = open_window("Test Window", 800, 600);
    fill_triangle_on_window(test_window, color_black(), 100.0, 100.0, 200.0, 300.0, 300.0, 100.0);
    refresh_screen();
    assert!(point_in_triangle(point_at(200.0, 200.0), triangle_from(point_at(100.0, 100.0), point_at(200.0, 300.0), point_at(300.0, 100.0))));
    close_window(test_window);
}
#[test]
fn test_fill_triangle_on_window_with_options_integration() {
    let test_window = open_window("Test Window", 800, 600);
    fill_triangle_on_window(test_window, color_black(), 100.0, 100.0, 200.0, 300.0, 300.0, 100.0, option_defaults());
    refresh_screen();
    assert!(point_in_triangle(point_at(150.0, 150.0), triangle_from(point_at(100.0, 100.0), point_at(200.0, 300.0), point_at(300.0, 100.0))));
    assert!(!point_in_triangle(point_at(350.0, 150.0), triangle_from(point_at(100.0, 100.0), point_at(200.0, 300.0), point_at(300.0, 100.0))));
    close_window(test_window);
}
