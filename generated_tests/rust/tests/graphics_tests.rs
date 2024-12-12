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
mod test_graphics {
use super::*;
#[test]
fn test_draw_circle_record_integration() {
    let test_window = open_window("Test Window", 800, 600);
    clear_window(test_window, color_white());
    let test_circle = circle_at(400.0, 300.0, 50.0);
    draw_circle_record(color_black(), test_circle);
    assert_eq!(color_black(), get_pixel_from_window(test_window, 450, 300));
    assert_eq!(color_white(), get_pixel_from_window(test_window, 400, 300));
    assert_eq!(color_white(), get_pixel_from_window(test_window, 460, 300));
    close_window(test_window);
}
#[test]
fn test_draw_circle_record_with_options_integration() {
    let test_window = open_window("Test Window", 800, 600);
    clear_window(test_window, color_white());
    let test_circle = circle_at(400.0, 300.0, 50.0);
    draw_circle_record_with_options(color_black(), test_circle, option_defaults());
    assert_eq!(color_black(), get_pixel_from_window(test_window, 450, 300));
    assert_eq!(color_white(), get_pixel_from_window(test_window, 400, 300));
    assert_eq!(color_white(), get_pixel_from_window(test_window, 460, 300));
    close_window(test_window);
}
#[test]
fn test_draw_circle_integration() {
    let test_window = open_window("Test Window", 800, 600);
    clear_window(test_window, color_white());
    draw_circle(color_black(), 400.0, 300.0, 50.0);
    refresh_screen();
    assert_eq!(color_black(), get_pixel_from_window(test_window, 450, 300));
    assert_eq!(color_white(), get_pixel_from_window(test_window, 425, 300));
    assert_eq!(color_white(), get_pixel_from_window(test_window, 460, 300));
    close_window(test_window);
}
#[test]
fn test_draw_circle_with_options_integration() {
    let test_window = open_window("Test Window", 800, 600);
    clear_window(test_window, color_white());
    draw_circle_with_options(color_black(), 400.0, 300.0, 50.0, option_defaults());
    assert_eq!(color_black(), get_pixel_from_window(test_window, 450, 300));
    assert_eq!(color_white(), get_pixel_from_window(test_window, 400, 300));
    assert_eq!(color_white(), get_pixel_from_window(test_window, 460, 300));
    close_window(test_window);
}
#[test]
fn test_draw_circle_on_bitmap_integration() {
    let test_bitmap = create_bitmap("test_bitmap", 200, 200);
    clear_bitmap(test_bitmap, color_white());
    draw_circle_on_bitmap(test_bitmap, color_black(), 100.0, 100.0, 50.0);
    assert_eq!(color_black(), get_pixel(test_bitmap, 150, 100));
    assert_eq!(color_white(), get_pixel(test_bitmap, 100, 100));
    assert_eq!(color_white(), get_pixel(test_bitmap, 160, 100));
    free_bitmap(test_bitmap);
}
#[test]
fn test_draw_circle_on_bitmap_with_options_integration() {
    let test_bitmap = create_bitmap("test_bitmap", 200, 200);
    clear_bitmap(test_bitmap, color_white());
    draw_circle_on_bitmap_with_options(test_bitmap, color_black(), 100.0, 100.0, 50.0, option_defaults());
    assert_eq!(color_black(), get_pixel(test_bitmap, 150, 100));
    assert_eq!(color_white(), get_pixel(test_bitmap, 100, 100));
    assert_eq!(color_white(), get_pixel(test_bitmap, 160, 100));
    free_bitmap(test_bitmap);
}
#[test]
fn test_draw_circle_on_window_integration() {
    let test_window = open_window("Test Window", 800, 600);
    clear_window(test_window, color_white());
    draw_circle_on_window(test_window, color_black(), 400.0, 300.0, 50.0);
    assert_eq!(color_black(), get_pixel_from_window(test_window, 450, 300));
    assert_eq!(color_white(), get_pixel_from_window(test_window, 400, 300));
    assert_eq!(color_white(), get_pixel_from_window(test_window, 460, 300));
    close_window(test_window);
}
#[test]
fn test_draw_circle_on_window_with_options_integration() {
    let test_window = open_window("Test Window", 800, 600);
    clear_window(test_window, color_white());
    draw_circle_on_window_with_options(test_window, color_black(), 400.0, 300.0, 50.0, option_defaults());
    assert_eq!(color_black(), get_pixel_from_window(test_window, 450, 300));
    assert_eq!(color_black(), get_pixel_from_window(test_window, 350, 300));
    assert_eq!(color_white(), get_pixel_from_window(test_window, 400, 400));
    close_window(test_window);
}
#[test]
fn test_fill_circle_record_integration() {
    let test_window = open_window("Test Window", 800, 600);
    clear_window(test_window, color_white());
    let test_circle = circle_at(400.0, 300.0, 50.0);
    fill_circle_record(color_black(), test_circle);
    assert_eq!(color_black(), get_pixel_from_window(test_window, 400, 300));
    assert_eq!(color_black(), get_pixel_from_window(test_window, 425, 300));
    assert_eq!(color_white(), get_pixel_from_window(test_window, 460, 300));
    close_window(test_window);
}
#[test]
fn test_fill_circle_record_with_options_integration() {
    let test_window = open_window("Test Window", 800, 600);
    clear_window(test_window, color_white());
    let test_circle = circle_at(400.0, 300.0, 50.0);
    fill_circle_record_with_options(color_black(), test_circle, option_defaults());
    assert_eq!(color_black(), get_pixel_from_window(test_window, 400, 300));
    assert_eq!(color_black(), get_pixel_from_window(test_window, 425, 300));
    assert_eq!(color_white(), get_pixel_from_window(test_window, 460, 300));
    close_window(test_window);
}
#[test]
fn test_fill_circle_integration() {
    let test_window = open_window("Test Window", 800, 600);
    clear_window(test_window, color_white());
    fill_circle(color_black(), 400.0, 300.0, 50.0);
    assert_eq!(color_black(), get_pixel_from_window(test_window, 400, 300));
    assert_eq!(color_black(), get_pixel_from_window(test_window, 425, 300));
    assert_eq!(color_white(), get_pixel_from_window(test_window, 460, 300));
    close_window(test_window);
}
#[test]
fn test_fill_circle_with_options_integration() {
    let test_window = open_window("Test Window", 800, 600);
    clear_window(test_window, color_white());
    fill_circle_with_options(color_black(), 400.0, 300.0, 50.0, option_defaults());
    assert_eq!(color_black(), get_pixel_from_window(test_window, 400, 300));
    assert_eq!(color_black(), get_pixel_from_window(test_window, 425, 300));
    assert_eq!(color_white(), get_pixel_from_window(test_window, 460, 300));
    close_window(test_window);
}
#[test]
fn test_fill_circle_on_bitmap_integration() {
    let test_bitmap = create_bitmap("test_bitmap", 200, 200);
    clear_bitmap(test_bitmap, color_white());
    fill_circle_on_bitmap(test_bitmap, color_red(), 100.0, 100.0, 50.0);
    assert_eq!(color_red(), get_pixel(test_bitmap, 100, 100));
    assert_eq!(color_red(), get_pixel(test_bitmap, 125, 100));
    assert_eq!(color_white(), get_pixel(test_bitmap, 160, 100));
    free_bitmap(test_bitmap);
}
#[test]
fn test_fill_circle_on_bitmap_with_options_integration() {
    let test_bitmap = create_bitmap("test_bitmap", 200, 200);
    clear_bitmap(test_bitmap, color_white());
    fill_circle_on_bitmap_with_options(test_bitmap, color_black(), 100.0, 100.0, 50.0, option_defaults());
    assert_eq!(color_black(), get_pixel(test_bitmap, 100, 100));
    assert_eq!(color_black(), get_pixel(test_bitmap, 125, 100));
    assert_eq!(color_white(), get_pixel(test_bitmap, 160, 100));
    free_bitmap(test_bitmap);
}
#[test]
fn test_fill_circle_on_window_integration() {
    let test_window = open_window("Test Window", 800, 600);
    clear_window(test_window, color_white());
    fill_circle_on_window(test_window, color_black(), 400.0, 300.0, 50.0);
    assert_eq!(color_black(), get_pixel_from_window(test_window, 400, 300));
    assert_eq!(color_black(), get_pixel_from_window(test_window, 425, 300));
    assert_eq!(color_white(), get_pixel_from_window(test_window, 460, 300));
    close_window(test_window);
}
#[test]
fn test_fill_circle_on_window_with_options_integration() {
    let test_window = open_window("Test Window", 800, 600);
    clear_window(test_window, color_white());
    fill_circle_on_window_with_options(test_window, color_black(), 400.0, 300.0, 50.0, option_defaults());
    assert_eq!(color_black(), get_pixel_from_window(test_window, 400, 300));
    assert_eq!(color_black(), get_pixel_from_window(test_window, 425, 300));
    assert_eq!(color_white(), get_pixel_from_window(test_window, 460, 300));
    close_window(test_window);
}
#[test]
fn test_current_clip_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_clip = current_clip();
    assert_eq!(0, rectangle_left(test_clip));
    assert_eq!(0, rectangle_top(test_clip));
    assert_eq!(800, test_clip.Width);
    assert_eq!(600, test_clip.Height);
    close_window(test_window);
}
#[test]
fn test_current_clip_for_bitmap_integration() {
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    let test_rectangle = rectangle_from(10, 10, 50, 50);
    push_clip(test_bitmap, test_rectangle);
    let test_clip = current_clip_for_bitmap(test_bitmap);
    assert_eq!(0, rectangle_left(test_clip));
    assert_eq!(0, rectangle_top(test_clip));
    assert_eq!(50, rectangle_right(test_clip));
    assert_eq!(50, rectangle_bottom(test_clip));
    free_bitmap(test_bitmap);
}
#[test]
fn test_current_clip_for_window_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_clip = current_clip_for_window(test_window);
    assert_eq!(0, rectangle_left(test_clip));
    assert_eq!(0, rectangle_top(test_clip));
    assert_eq!(800, test_clip.Width);
    assert_eq!(600, test_clip.Height);
    close_window(test_window);
}
#[test]
fn test_pop_clip_for_window_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_rectangle = rectangle_from(0, 0, 250, 250);
    push_clip(test_window, test_rectangle);
    let test_current_clip = current_clip(test_window);
    assert_eq!(0, rectangle_left(test_current_clip));
    assert_eq!(0, rectangle_top(test_current_clip));
    assert_eq!(250, test_current_clip.Width);
    assert_eq!(250, test_current_clip.Height);
    pop_clip_for_window(test_window);
    let test_current_clip_after_pop = current_clip(test_window);
    assert_eq!(0, rectangle_left(test_current_clip_after_pop));
    assert_eq!(0, rectangle_top(test_current_clip_after_pop));
    assert_eq!(800, test_current_clip_after_pop.Width);
    assert_eq!(600, test_current_clip_after_pop.Height);
    close_window(test_window);
}
#[test]
fn test_pop_clip_integration() {
    let test_window = open_window("Test Window", 800, 600);
    clear_window(test_window, color_white());
    push_clip(rectangle_from(0, 0, 250, 250));
    fill_rectangle(color_red(), 0, 0, 300, 300);
    refresh_screen();
    assert_eq!(color_red(), get_pixel_from_window(test_window, 125, 125));
    assert_eq!(color_white(), get_pixel_from_window(test_window, 275, 275));
    pop_clip();
    fill_rectangle(color_green(), 300, 300, 100, 100);
    refresh_screen();
    assert_eq!(color_red(), get_pixel_from_window(test_window, 125, 125));
    assert_eq!(color_green(), get_pixel_from_window(test_window, 350, 350));
    close_window(test_window);
}
#[test]
fn test_pop_clip_for_bitmap_integration() {
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    clear_bitmap(test_bitmap, color_white());
    push_clip(test_bitmap, rectangle_from(0, 0, 50, 50));
    fill_circle(color_black(), 25, 25, 20, option_draw_to_bitmap(test_bitmap));
    assert_eq!(color_black(), get_pixel(test_bitmap, 25, 25));
    assert_eq!(color_white(), get_pixel(test_bitmap, 75, 75));
    pop_clip_for_bitmap(test_bitmap);
    let test_clip = current_clip(test_bitmap);
    assert_eq!(0, rectangle_left(test_clip));
    assert_eq!(0, rectangle_top(test_clip));
    assert_eq!(100, test_clip.Width);
    assert_eq!(100, test_clip.height);
    free_bitmap(test_bitmap);
}
#[test]
fn test_push_clip_for_window_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_rectangle = rectangle_from(100.0, 100.0, 200.0, 200.0);
    push_clip_for_window(test_window, test_rectangle);
    let test_current_clip = current_clip(test_window);
    assert_eq!(100, rectangle_left(test_current_clip));
    assert_eq!(100, rectangle_top(test_current_clip));
    assert_eq!(200, test_current_clip.Width);
    assert_eq!(200, test_current_clip.Height);
    refresh_screen();
    close_window(test_window);
}
#[test]
fn test_push_clip_for_bitmap_integration() {
    let test_bitmap = create_bitmap("test_bitmap", 200, 200);
    let test_rectangle = rectangle_from(50, 50, 100, 100);
    push_clip_for_bitmap(test_bitmap, test_rectangle);
    let test_current_clip = current_clip(test_bitmap);
    assert_eq!(50, rectangle_left(test_current_clip));
    assert_eq!(50, rectangle_top(test_current_clip));
    assert_eq!(100, test_current_clip.Width);
    assert_eq!(100, test_current_clip.Height);
    free_bitmap(test_bitmap);
}
#[test]
fn test_push_clip_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_rectangle = rectangle_from(100.0, 100.0, 200.0, 200.0);
    push_clip(test_rectangle);
    let test_current_clip = current_clip();
    assert_eq!(100, rectangle_left(test_current_clip));
    assert_eq!(100, rectangle_top(test_current_clip));
    assert_eq!(200, test_current_clip.Width);
    assert_eq!(200, test_current_clip.Height);
    close_window(test_window);
}
#[test]
fn test_reset_clip_for_bitmap_integration() {
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    push_clip(test_bitmap, rectangle_from(10, 10, 50, 50));
    reset_clip_for_bitmap(test_bitmap);
    let test_clip = current_clip(test_bitmap);
    assert_eq!(0, rectangle_left(test_clip));
    assert_eq!(0, rectangle_top(test_clip));
    assert_eq!(100, test_clip.width);
    assert_eq!(100, test_clip.height);
    free_bitmap(test_bitmap);
}
#[test]
fn test_reset_clip_integration() {
    let test_window = open_window("Test Window", 800, 600);
    push_clip(rectangle_from(100, 100, 200, 200));
    reset_clip();
    let test_clip = current_clip();
    assert_eq!(0, rectangle_left(test_clip));
    assert_eq!(0, rectangle_top(test_clip));
    assert_eq!(800, test_clip.Width);
    assert_eq!(600, test_clip.Height);
    close_window(test_window);
}
#[test]
fn test_reset_clip_for_window_integration() {
    let test_window = open_window("Test Window", 800, 600);
    push_clip(test_window, rectangle_from(100, 100, 200, 200));
    reset_clip_for_window(test_window);
    let test_clip = current_clip(test_window);
    assert_eq!(0, rectangle_left(test_clip));
    assert_eq!(0, rectangle_top(test_clip));
    assert_eq!(800, test_clip.Width);
    assert_eq!(600, test_clip.Height);
    close_window(test_window);
}
#[test]
fn test_set_clip_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_rectangle = rectangle_from(100.0, 100.0, 200.0, 200.0);
    set_clip(test_rectangle);
    let test_current_clip = current_clip();
    assert_eq!(100, rectangle_left(test_current_clip));
    assert_eq!(100, rectangle_top(test_current_clip));
    assert_eq!(200, test_current_clip.Width);
    assert_eq!(200, test_current_clip.Height);
    close_window(test_window);
}
#[test]
fn test_set_clip_for_bitmap_integration() {
    let test_bitmap = create_bitmap("test_bitmap", 200, 200);
    let test_rectangle = rectangle_from(50, 50, 100, 100);
    set_clip_for_bitmap(test_bitmap, test_rectangle);
    let test_current_clip = current_clip(test_bitmap);
    assert_eq!(50, rectangle_left(test_current_clip));
    assert_eq!(50, rectangle_top(test_current_clip));
    assert_eq!(100, test_current_clip.Width);
    assert_eq!(100, test_current_clip.Height);
    free_bitmap(test_bitmap);
}
#[test]
fn test_set_clip_for_window_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_rectangle = rectangle_from(100, 100, 200, 200);
    set_clip_for_window(test_window, test_rectangle);
    let test_current_clip = current_clip(test_window);
    assert_eq!(100, rectangle_left(test_current_clip));
    assert_eq!(100, rectangle_top(test_current_clip));
    assert_eq!(200, test_current_clip.Width);
    assert_eq!(200, test_current_clip.Height);
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
    clear_bitmap(test_bitmap, color_white());
    let test_options = option_draw_to_bitmap(test_bitmap);
    draw_circle(color_black(), circle_at(50.0, 50.0, 25.0), test_options);
    assert_eq!(color_black(), get_pixel(test_bitmap, 75, 50));
    assert_eq!(color_white(), get_pixel(test_bitmap, 90, 90));
    free_bitmap(test_bitmap);
}
#[test]
fn test_option_draw_to_bitmap_with_options_integration() {
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    clear_bitmap(test_bitmap, color_white());
    let test_options = option_defaults();
    let test_drawing_options = option_draw_to_bitmap_with_options(test_bitmap, test_options);
    draw_circle(color_black(), circle_at(50.0, 50.0, 25.0), test_drawing_options);
    assert_eq!(color_black(), get_pixel(test_bitmap, 75, 50));
    assert_eq!(color_white(), get_pixel(test_bitmap, 90, 90));
    free_bitmap(test_bitmap);
}
#[test]
fn test_option_draw_to_window_integration() {
    let test_window = open_window("Test Window", 800, 600);
    clear_window(test_window, color_white());
    draw_circle(color_black(), circle_at(400.0, 300.0, 50.0), option_draw_to_window(test_window));
    refresh_screen();
    assert_eq!(color_black(), get_pixel_from_window(test_window, 450, 300));
    assert_eq!(color_white(), get_pixel_from_window(test_window, 460, 300));
    close_window(test_window);
}
#[test]
fn test_option_draw_to_window_with_options_integration() {
    let test_window = open_window("Test Window", 800, 600);
    clear_window(test_window, color_white());
    let test_options = option_defaults();
    draw_circle(color_black(), circle_at(400.0, 300.0, 50.0), option_draw_to_window_with_options(test_window, test_options));
    refresh_screen();
    assert_eq!(color_black(), get_pixel_from_window(test_window, 450, 300));
    assert_eq!(color_white(), get_pixel_from_window(test_window, 460, 300));
    close_window(test_window);
}
#[test]
fn test_option_flip_x_integration() {
    let test_window = open_window("Test Window", 800, 600);
    clear_window(test_window, color_white());
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    clear_bitmap(test_bitmap, color_white());
    fill_rectangle_on_bitmap(test_bitmap, color_black(), 0, 0, 50, 100);
    draw_bitmap(test_bitmap, 100.0, 100.0, option_flip_x());
    refresh_screen();
    assert_eq!(color_black(), get_pixel_from_window(test_window, 125, 100));
    assert_eq!(color_white(), get_pixel_from_window(test_window, 75, 100));
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_option_flip_x_with_options_integration() {
    let test_window = open_window("Test Window", 800, 600);
    clear_window(test_window, color_white());
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    clear_bitmap(test_bitmap, color_white());
    fill_rectangle_on_bitmap(test_bitmap, color_black(), 0, 0, 50, 100);
    draw_bitmap(test_bitmap, 400, 300, option_flip_x_with_options(option_defaults()));
    refresh_screen();
    assert_eq!(color_black(), get_pixel_from_window(test_window, 425, 300));
    assert_eq!(color_white(), get_pixel_from_window(test_window, 375, 300));
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_option_flip_xy_integration() {
    let test_window = open_window("Test Window", 800, 600);
    clear_window(test_window, color_white());
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    clear_bitmap(test_bitmap, color_white());
    fill_rectangle_on_bitmap(test_bitmap, color_black(), 0, 0, 50, 50);
    draw_bitmap(test_bitmap, 400.0, 300.0, option_flip_xy());
    refresh_screen();
    assert_eq!(color_black(), get_pixel_from_window(test_window, 450, 350));
    assert_eq!(color_white(), get_pixel_from_window(test_window, 450, 250));
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_option_flip_xy_with_options_integration() {
    let test_window = open_window("Test Window", 800, 600);
    clear_window(test_window, color_white());
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    clear_bitmap(test_bitmap, color_white());
    fill_rectangle_on_bitmap(test_bitmap, color_black(), 0, 0, 50, 50);
    draw_bitmap(test_bitmap, 400, 300, option_flip_xy_with_options(option_defaults()));
    refresh_screen();
    assert_eq!(color_black(), get_pixel_from_window(test_window, 450, 350));
    assert_eq!(color_white(), get_pixel_from_window(test_window, 450, 250));
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_option_flip_y_integration() {
    let test_window = open_window("Test Window", 800, 600);
    clear_window(test_window, color_white());
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    clear_bitmap(test_bitmap, color_white());
    fill_rectangle_on_bitmap(test_bitmap, color_black(), 0, 0, 100, 50);
    draw_bitmap(test_bitmap, 400.0, 300.0, option_flip_y());
    refresh_screen();
    assert_eq!(color_black(), get_pixel_from_window(test_window, 400, 325));
    assert_eq!(color_white(), get_pixel_from_window(test_window, 400, 275));
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_option_flip_y_with_options_integration() {
    let test_window = open_window("Test Window", 800, 600);
    clear_window(test_window, color_white());
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    clear_bitmap(test_bitmap, color_white());
    fill_rectangle_on_bitmap(test_bitmap, color_black(), 0, 0, 100, 50);
    draw_bitmap(test_bitmap, 400.0, 300.0, option_flip_y_with_options(option_defaults()));
    refresh_screen();
    assert_eq!(color_black(), get_pixel_from_window(test_window, 400, 325));
    assert_eq!(color_white(), get_pixel_from_window(test_window, 400, 275));
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_option_line_width_integration() {
    let test_window = open_window("Test Window", 800, 600);
    clear_window(test_window, color_white());
    draw_line(color_black(), 100.0, 100.0, 200.0, 200.0, option_line_width(5));
    refresh_screen();
    assert_eq!(color_black(), get_pixel_from_window(test_window, 150, 150));
    assert_eq!(color_white(), get_pixel_from_window(test_window, 140, 150));
    close_window(test_window);
}
#[test]
fn test_option_line_width_with_options_integration() {
    let test_window = open_window("Test Window", 800, 600);
    clear_window(test_window, color_white());
    draw_line(color_black(), 100.0, 100.0, 200.0, 200.0, option_line_width_with_options(5, option_defaults()));
    refresh_screen();
    assert_eq!(color_black(), get_pixel_from_window(test_window, 150, 150));
    assert_eq!(color_white(), get_pixel_from_window(test_window, 145, 150));
    close_window(test_window);
}
#[test]
fn test_option_part_bmp_integration() {
    let test_window = open_window("Test Window", 800, 600);
    clear_window(test_window, color_white());
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    clear_bitmap(test_bitmap, color_black());
    draw_bitmap(test_bitmap, 100.0, 100.0, option_part_bmp(0.0, 0.0, 50.0, 50.0));
    refresh_screen();
    assert_eq!(color_black(), get_pixel_from_window(test_window, 125, 125));
    assert_eq!(color_white(), get_pixel_from_window(test_window, 175, 175));
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_option_part_bmp_with_options_integration() {
    let test_window = open_window("Test Window", 800, 600);
    clear_window(test_window, color_white());
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    clear_bitmap(test_bitmap, color_black());
    draw_bitmap(test_bitmap, 100.0, 100.0, option_part_bmp_with_options(0.0, 0.0, 50.0, 50.0, option_defaults()));
    refresh_screen();
    assert_eq!(color_black(), get_pixel_from_window(test_window, 125, 125));
    assert_eq!(color_white(), get_pixel_from_window(test_window, 175, 175));
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_option_part_bmp_from_rectangle_integration() {
    let test_window = open_window("Test Window", 800, 600);
    clear_window(test_window, color_white());
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    clear_bitmap(test_bitmap, color_black());
    draw_bitmap(test_bitmap, 0, 0, option_part_bmp_from_rectangle(rectangle_from(0, 0, 50, 50)));
    refresh_screen();
    assert_eq!(color_black(), get_pixel_from_window(test_window, 25, 25));
    assert_eq!(color_white(), get_pixel_from_window(test_window, 75, 75));
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_option_part_bmp_from_rectangle_with_options_integration() {
    let test_window = open_window("Test Window", 800, 600);
    clear_window(test_window, color_white());
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    clear_bitmap(test_bitmap, color_black());
    draw_bitmap(test_bitmap, 0, 0, option_part_bmp_from_rectangle_with_options(rectangle_from(0, 0, 50, 50), option_defaults()));
    refresh_screen();
    assert_eq!(color_black(), get_pixel_from_window(test_window, 25, 25));
    assert_eq!(color_white(), get_pixel_from_window(test_window, 75, 75));
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_option_rotate_bmp_integration() {
    let test_window = open_window("Test Window", 800, 600);
    clear_window(test_window, color_white());
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    clear_bitmap(test_bitmap, color_white());
    fill_rectangle_on_bitmap(test_bitmap, color_black(), 0, 0, 50, 100);
    draw_bitmap(test_bitmap, 400.0, 300.0, option_rotate_bmp(90.0));
    refresh_screen();
    assert_eq!(color_black(), get_pixel_from_window(test_window, 400, 300));
    assert_eq!(color_white(), get_pixel_from_window(test_window, 400, 350));
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_option_rotate_bmp_with_anchor_integration() {
    let test_window = open_window("Test Window", 800, 600);
    clear_window(test_window, color_white());
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    clear_bitmap(test_bitmap, color_white());
    fill_rectangle_on_bitmap(test_bitmap, color_black(), 0, 0, 50, 100);
    draw_bitmap(test_bitmap, 400.0, 300.0, option_rotate_bmp_with_anchor(90.0, 50.0, 50.0));
    refresh_screen();
    assert_eq!(color_black(), get_pixel_from_window(test_window, 500, 300));
    assert_eq!(color_white(), get_pixel_from_window(test_window, 450, 300));
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_option_rotate_bmp_with_anchor_and_options_integration() {
    let test_window = open_window("Test Window", 800, 600);
    clear_window(test_window, color_white());
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    clear_bitmap(test_bitmap, color_white());
    fill_rectangle_on_bitmap(test_bitmap, color_black(), 0, 0, 50, 100);
    draw_bitmap(test_bitmap, 400.0, 300.0, option_rotate_bmp_with_anchor_and_options(90.0, 50.0, 50.0, option_defaults()));
    refresh_screen();
    assert_eq!(color_black(), get_pixel_from_window(test_window, 500, 300));
    assert_eq!(color_white(), get_pixel_from_window(test_window, 400, 300));
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_option_rotate_bmp_with_options_integration() {
    let test_window = open_window("Test Window", 800, 600);
    clear_window(test_window, color_white());
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    clear_bitmap(test_bitmap, color_white());
    fill_rectangle_on_bitmap(test_bitmap, color_black(), 0, 0, 50, 100);
    draw_bitmap(test_bitmap, 400.0, 300.0, option_rotate_bmp_with_options(90.0, option_defaults()));
    refresh_screen();
    assert_eq!(color_black(), get_pixel_from_window(test_window, 400, 300));
    assert_eq!(color_white(), get_pixel_from_window(test_window, 400, 350));
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_option_scale_bmp_integration() {
    let test_window = open_window("Test Window", 800, 600);
    clear_window(test_window, color_white());
    let test_bitmap = create_bitmap("test_bitmap", 50, 50);
    clear_bitmap(test_bitmap, color_black());
    draw_bitmap(test_bitmap, 400.0, 300.0, option_scale_bmp(2.0, 2.0));
    refresh_screen();
    assert_eq!(color_black(), get_pixel_from_window(test_window, 451, 300));
    assert_eq!(color_white(), get_pixel_from_window(test_window, 500, 300));
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_option_scale_bmp_with_options_integration() {
    let test_window = open_window("Test Window", 800, 600);
    clear_window(test_window, color_white());
    let test_bitmap = create_bitmap("test_bitmap", 50, 50);
    clear_bitmap(test_bitmap, color_black());
    draw_bitmap(test_bitmap, 400.0, 300.0, option_scale_bmp_with_options(2.0, 2.0, option_defaults()));
    refresh_screen();
    assert_eq!(color_black(), get_pixel_from_window(test_window, 451, 300));
    assert_eq!(color_white(), get_pixel_from_window(test_window, 500, 300));
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_option_to_screen_integration() {
    let test_window = open_window("Test Window", 800, 600);
    clear_window(test_window, color_white());
    draw_circle(color_black(), circle_at(400.0, 300.0, 50.0), option_to_screen());
    refresh_screen();
    assert_eq!(color_black(), get_pixel_from_window(test_window, 450, 300));
    assert_eq!(color_white(), get_pixel_from_window(test_window, 451, 300));
    close_window(test_window);
}
#[test]
fn test_option_to_screen_with_options_integration() {
    let test_window = open_window("Test Window", 800, 600);
    clear_window(test_window, color_white());
    draw_circle(color_black(), circle_at(400.0, 300.0, 50.0), option_to_screen_with_options(option_defaults()));
    refresh_screen();
    assert_eq!(color_black(), get_pixel_from_window(test_window, 400, 250));
    assert_eq!(color_white(), get_pixel_from_window(test_window, 400, 300));
    close_window(test_window);
}
#[test]
fn test_option_to_world_integration() {
    let test_window = open_window("Test Window", 800, 600);
    clear_window(test_window, color_white());
    move_camera_to(100.0, 100.0);
    draw_circle(color_black(), circle_at(400.0, 300.0, 50.0), option_to_world());
    refresh_screen();
    assert_eq!(color_black(), get_pixel_from_window(test_window, 350, 200));
    assert_eq!(color_white(), get_pixel_from_window(test_window, 375, 200));
    close_window(test_window);
}
#[test]
fn test_option_to_world_with_options_integration() {
    let test_window = open_window("Test Window", 800, 600);
    clear_window(test_window, color_white());
    move_camera_to(100.0, 100.0);
    draw_circle(color_black(), circle_at(400.0, 300.0, 50.0), option_to_world_with_options(option_defaults()));
    refresh_screen();
    assert_eq!(color_black(), get_pixel_from_window(test_window, 350, 200));
    assert_eq!(color_white(), get_pixel_from_window(test_window, 375, 200));
    close_window(test_window);
}
#[test]
fn test_option_with_animation_integration() {
    let test_window = open_window("Test Window", 800, 600);
    clear_window(test_window, color_white());
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    clear_bitmap(test_bitmap, color_black());
    let test_animation = create_animation("test_animation", "default");
    draw_bitmap(test_bitmap, 100, 100, option_with_animation(test_animation));
    refresh_screen();
    assert_eq!(color_black(), get_pixel_from_window(test_window, 125, 125));
    assert_eq!(color_white(), get_pixel_from_window(test_window, 75, 75));
    free_animation(test_animation);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_option_with_animation_with_options_integration() {
    let test_window = open_window("Test Window", 800, 600);
    clear_window(test_window, color_white());
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    clear_bitmap(test_bitmap, color_black());
    let test_animation = create_animation("test_animation", "default");
    draw_bitmap(test_bitmap, 100, 100, option_with_animation_with_options(test_animation, option_defaults()));
    refresh_screen();
    assert_eq!(color_black(), get_pixel_from_window(test_window, 125, 125));
    assert_eq!(color_white(), get_pixel_from_window(test_window, 75, 75));
    free_animation(test_animation);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_option_with_bitmap_cell_integration() {
    let test_window = open_window("Test Window", 800, 600);
    clear_window(test_window, color_white());
    let test_bitmap = create_bitmap("test_bitmap", 64, 64);
    clear_bitmap(test_bitmap, color_black());
    bitmap_set_cell_details(test_bitmap, 32, 32, 2, 2, 4);
    draw_bitmap(test_bitmap, 100, 100, option_with_bitmap_cell(1));
    refresh_screen();
    assert_eq!(color_black(), get_pixel_from_window(test_window, 116, 116));
    assert_eq!(color_white(), get_pixel_from_window(test_window, 84, 84));
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_option_with_bitmap_cell_with_options_integration() {
    let test_window = open_window("Test Window", 800, 600);
    clear_window(test_window, color_white());
    let test_bitmap = create_bitmap("test_bitmap", 64, 64);
    clear_bitmap(test_bitmap, color_black());
    bitmap_set_cell_details(test_bitmap, 32, 32, 2, 2, 4);
    draw_bitmap(test_bitmap, 100, 100, option_with_bitmap_cell_with_options(1, option_defaults()));
    refresh_screen();
    assert_eq!(color_black(), get_pixel_from_window(test_window, 116, 116));
    assert_eq!(color_white(), get_pixel_from_window(test_window, 84, 84));
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_draw_ellipse_within_rectangle_integration() {
    let test_window = open_window("Test Window", 800, 600);
    clear_window(test_window, color_white());
    draw_ellipse_within_rectangle(color_black(), rectangle_from(100, 100, 200, 150));
    refresh_screen();
    assert_eq!(color_black(), get_pixel_from_window(test_window, 300, 175));
    assert_eq!(color_white(), get_pixel_from_window(test_window, 200, 175));
    assert_eq!(color_white(), get_pixel_from_window(test_window, 350, 175));
    close_window(test_window);
}
#[test]
fn test_draw_ellipse_within_rectangle_with_options_integration() {
    let test_window = open_window("Test Window", 800, 600);
    clear_window(test_window, color_white());
    draw_ellipse_within_rectangle_with_options(color_black(), rectangle_from(100, 100, 200, 100), option_defaults());
    refresh_screen();
    assert_eq!(color_black(), get_pixel_from_window(test_window, 300, 150));
    assert_eq!(color_white(), get_pixel_from_window(test_window, 200, 150));
    assert_eq!(color_white(), get_pixel_from_window(test_window, 350, 150));
    close_window(test_window);
}
#[test]
fn test_draw_ellipse_integration() {
    let test_window = open_window("Test Window", 800, 600);
    clear_window(test_window, color_white());
    draw_ellipse(color_black(), 400.0, 300.0, 100.0, 50.0);
    refresh_screen();
    assert_eq!(color_black(), get_pixel_from_window(test_window, 450, 300));
    assert_eq!(color_white(), get_pixel_from_window(test_window, 400, 300));
    assert_eq!(color_white(), get_pixel_from_window(test_window, 500, 300));
    close_window(test_window);
}
#[test]
fn test_draw_ellipse_with_options_integration() {
    let test_window = open_window("Test Window", 800, 600);
    clear_window(test_window, color_white());
    draw_ellipse_with_options(color_black(), 400.0, 300.0, 100.0, 50.0, option_defaults());
    refresh_screen();
    assert_eq!(color_black(), get_pixel_from_window(test_window, 450, 300));
    assert_eq!(color_white(), get_pixel_from_window(test_window, 400, 300));
    assert_eq!(color_white(), get_pixel_from_window(test_window, 500, 300));
    close_window(test_window);
}
#[test]
fn test_draw_ellipse_on_bitmap_within_rectangle_integration() {
    let test_bitmap = create_bitmap("test_bitmap", 200, 200);
    clear_bitmap(test_bitmap, color_white());
    let rect = rectangle_from(50.0, 50.0, 100.0, 100.0);
    draw_ellipse_on_bitmap_within_rectangle(test_bitmap, color_black(), rect);
    assert_eq!(color_black(), get_pixel(test_bitmap, 150, 100));
    assert_eq!(color_white(), get_pixel(test_bitmap, 125, 100));
    assert_eq!(color_white(), get_pixel(test_bitmap, 175, 100));
    free_bitmap(test_bitmap);
}
#[test]
fn test_draw_ellipse_on_bitmap_within_rectangle_with_options_integration() {
    let test_bitmap = create_bitmap("test_bitmap", 200, 200);
    clear_bitmap(test_bitmap, color_white());
    draw_ellipse_on_bitmap_within_rectangle_with_options(test_bitmap, color_black(), rectangle_from(50.0, 50.0, 100.0, 100.0), option_defaults());
    assert_eq!(color_black(), get_pixel(test_bitmap, 150, 100));
    assert_eq!(color_white(), get_pixel(test_bitmap, 125, 100));
    assert_eq!(color_white(), get_pixel(test_bitmap, 175, 100));
    free_bitmap(test_bitmap);
}
#[test]
fn test_draw_ellipse_on_bitmap_integration() {
    let test_bitmap = create_bitmap("test_bitmap", 200, 200);
    clear_bitmap(test_bitmap, color_white());
    draw_ellipse_on_bitmap(test_bitmap, color_black(), 100.0, 100.0, 50.0, 30.0);
    assert_eq!(color_black(), get_pixel(test_bitmap, 125, 100));
    assert_eq!(color_white(), get_pixel(test_bitmap, 100, 100));
    assert_eq!(color_white(), get_pixel(test_bitmap, 160, 100));
    free_bitmap(test_bitmap);
}
#[test]
fn test_draw_ellipse_on_bitmap_with_options_integration() {
    let test_bitmap = create_bitmap("test_bitmap", 200, 200);
    clear_bitmap(test_bitmap, color_white());
    draw_ellipse_on_bitmap_with_options(test_bitmap, color_black(), 100.0, 100.0, 50.0, 30.0, option_defaults());
    assert_eq!(color_black(), get_pixel(test_bitmap, 125, 100));
    assert_eq!(color_white(), get_pixel(test_bitmap, 100, 100));
    assert_eq!(color_white(), get_pixel(test_bitmap, 160, 100));
    free_bitmap(test_bitmap);
}
#[test]
fn test_draw_ellipse_on_window_within_rectangle_integration() {
    let test_window = open_window("Test Window", 800, 600);
    clear_window(test_window, color_white());
    let rect = rectangle_from(100.0, 100.0, 200.0, 100.0);
    draw_ellipse_on_window_within_rectangle(test_window, color_black(), rect);
    refresh_screen();
    assert_eq!(color_black(), get_pixel_from_window(test_window, 300, 150));
    assert_eq!(color_white(), get_pixel_from_window(test_window, 250, 150));
    assert_eq!(color_white(), get_pixel_from_window(test_window, 350, 150));
    close_window(test_window);
}
#[test]
fn test_draw_ellipse_on_window_within_rectangle_with_options_integration() {
    let test_window = open_window("Test Window", 800, 600);
    clear_window(test_window, color_white());
    let rect = rectangle_from(100.0, 100.0, 200.0, 100.0);
    draw_ellipse_on_window_within_rectangle_with_options(test_window, color_black(), rect, option_defaults());
    refresh_screen();
    assert_eq!(color_black(), get_pixel_from_window(test_window, 300, 150));
    assert_eq!(color_white(), get_pixel_from_window(test_window, 250, 150));
    assert_eq!(color_white(), get_pixel_from_window(test_window, 350, 150));
    close_window(test_window);
}
#[test]
fn test_draw_ellipse_on_window_integration() {
    let test_window = open_window("Test Window", 800, 600);
    clear_window(test_window, color_white());
    draw_ellipse_on_window(test_window, color_black(), 400.0, 300.0, 100.0, 50.0);
    refresh_screen();
    assert_eq!(color_black(), get_pixel_from_window(test_window, 450, 300));
    assert_eq!(color_white(), get_pixel_from_window(test_window, 400, 300));
    assert_eq!(color_white(), get_pixel_from_window(test_window, 500, 300));
    close_window(test_window);
}
#[test]
fn test_draw_ellipse_on_window_with_options_integration() {
    let test_window = open_window("Test Window", 800, 600);
    clear_window(test_window, color_white());
    draw_ellipse_on_window_with_options(test_window, color_black(), 400.0, 300.0, 100.0, 50.0, option_defaults());
    refresh_screen();
    assert_eq!(color_black(), get_pixel_from_window(test_window, 450, 300));
    assert_eq!(color_white(), get_pixel_from_window(test_window, 450, 325));
    assert_eq!(color_white(), get_pixel_from_window(test_window, 500, 300));
    close_window(test_window);
}
#[test]
fn test_fill_ellipse_within_rectangle_integration() {
    let test_window = open_window("Test Window", 800, 600);
    clear_window(test_window, color_white());
    fill_ellipse_within_rectangle(color_black(), rectangle_from(100.0, 100.0, 200.0, 100.0));
    refresh_screen();
    assert_eq!(color_black(), get_pixel_from_window(test_window, 200, 100));
    assert_eq!(color_black(), get_pixel_from_window(test_window, 150, 150));
    assert_eq!(color_white(), get_pixel_from_window(test_window, 50, 50));
    close_window(test_window);
}
#[test]
fn test_fill_ellipse_within_rectangle_with_options_integration() {
    let test_window = open_window("Test Window", 800, 600);
    clear_window(test_window, color_white());
    fill_ellipse_within_rectangle_with_options(color_black(), rectangle_from(100.0, 100.0, 200.0, 100.0), option_defaults());
    refresh_screen();
    assert_eq!(color_black(), get_pixel_from_window(test_window, 200, 100));
    assert_eq!(color_black(), get_pixel_from_window(test_window, 150, 150));
    assert_eq!(color_white(), get_pixel_from_window(test_window, 50, 50));
    close_window(test_window);
}
#[test]
fn test_fill_ellipse_integration() {
    let test_window = open_window("Test Window", 800, 600);
    clear_window(test_window, color_white());
    fill_ellipse(color_black(), 400.0, 300.0, 100.0, 50.0);
    refresh_screen();
    assert_eq!(color_black(), get_pixel_from_window(test_window, 450, 300));
    assert_eq!(color_black(), get_pixel_from_window(test_window, 450, 325));
    assert_eq!(color_white(), get_pixel_from_window(test_window, 500, 300));
    close_window(test_window);
}
#[test]
fn test_fill_ellipse_with_options_integration() {
    let test_window = open_window("Test Window", 800, 600);
    clear_window(test_window, color_white());
    fill_ellipse_with_options(color_black(), 400.0, 300.0, 100.0, 50.0, option_defaults());
    refresh_screen();
    assert_eq!(color_black(), get_pixel_from_window(test_window, 450, 300));
    assert_eq!(color_black(), get_pixel_from_window(test_window, 450, 325));
    assert_eq!(color_white(), get_pixel_from_window(test_window, 300, 300));
    close_window(test_window);
}
#[test]
fn test_fill_ellipse_on_bitmap_within_rectangle_integration() {
    let test_bitmap = create_bitmap("test_bitmap", 200, 200);
    clear_bitmap(test_bitmap, color_white());
    fill_ellipse_on_bitmap_within_rectangle(test_bitmap, color_black(), rectangle_from(50.0, 50.0, 100.0, 100.0));
    assert_eq!(color_black(), get_pixel(test_bitmap, 100, 100));
    assert_eq!(color_black(), get_pixel(test_bitmap, 75, 75));
    assert_eq!(color_white(), get_pixel(test_bitmap, 175, 175));
    free_bitmap(test_bitmap);
}
#[test]
fn test_fill_ellipse_on_bitmap_within_rectangle_with_options_integration() {
    let test_bitmap = create_bitmap("test_bitmap", 200, 200);
    clear_bitmap(test_bitmap, color_white());
    fill_ellipse_on_bitmap_within_rectangle_with_options(test_bitmap, color_black(), rectangle_from(50.0, 50.0, 100.0, 100.0), option_defaults());
    assert_eq!(color_black(), get_pixel(test_bitmap, 100, 100));
    assert_eq!(color_black(), get_pixel(test_bitmap, 75, 75));
    assert_eq!(color_white(), get_pixel(test_bitmap, 175, 175));
    free_bitmap(test_bitmap);
}
#[test]
fn test_fill_ellipse_on_bitmap_integration() {
    let test_bitmap = create_bitmap("test_bitmap", 200, 200);
    clear_bitmap(test_bitmap, color_white());
    fill_ellipse_on_bitmap(test_bitmap, color_black(), 100.0, 100.0, 50.0, 30.0);
    assert_eq!(color_black(), get_pixel(test_bitmap, 125, 100));
    assert_eq!(color_black(), get_pixel(test_bitmap, 125, 125));
    assert_eq!(color_white(), get_pixel(test_bitmap, 150, 100));
    free_bitmap(test_bitmap);
}
#[test]
fn test_fill_ellipse_on_bitmap_with_options_integration() {
    let test_bitmap = create_bitmap("test_bitmap", 200, 200);
    clear_bitmap(test_bitmap, color_white());
    fill_ellipse_on_bitmap_with_options(test_bitmap, color_black(), 50.0, 50.0, 100.0, 50.0, option_defaults());
    assert_eq!(color_black(), get_pixel(test_bitmap, 100, 50));
    assert_eq!(color_black(), get_pixel(test_bitmap, 100, 75));
    assert_eq!(color_white(), get_pixel(test_bitmap, 150, 50));
    free_bitmap(test_bitmap);
}
#[test]
fn test_fill_ellipse_on_window_within_rectangle_integration() {
    let test_window = open_window("Test Window", 800, 600);
    clear_window(test_window, color_white());
    fill_ellipse_on_window_within_rectangle(test_window, color_black(), rectangle_from(100.0, 100.0, 200.0, 150.0));
    refresh_screen();
    assert_eq!(color_black(), get_pixel_from_window(test_window, 200, 175));
    assert_eq!(color_black(), get_pixel_from_window(test_window, 150, 175));
    assert_eq!(color_white(), get_pixel_from_window(test_window, 350, 175));
    close_window(test_window);
}
#[test]
fn test_fill_ellipse_on_window_within_rectangle_with_options_integration() {
    let test_window = open_window("Test Window", 800, 600);
    clear_window(test_window, color_white());
    fill_ellipse_on_window_within_rectangle_with_options(test_window, color_black(), rectangle_from(100.0, 100.0, 200.0, 150.0), option_defaults());
    refresh_screen();
    assert_eq!(color_black(), get_pixel_from_window(test_window, 200, 175));
    assert_eq!(color_black(), get_pixel_from_window(test_window, 150, 175));
    assert_eq!(color_white(), get_pixel_from_window(test_window, 350, 175));
    close_window(test_window);
}
#[test]
fn test_fill_ellipse_on_window_integration() {
    let test_window = open_window("Test Window", 800, 600);
    clear_window(test_window, color_white());
    fill_ellipse_on_window(test_window, color_black(), 400.0, 300.0, 100.0, 50.0);
    refresh_screen();
    assert_eq!(color_black(), get_pixel_from_window(test_window, 450, 300));
    assert_eq!(color_black(), get_pixel_from_window(test_window, 450, 325));
    assert_eq!(color_white(), get_pixel_from_window(test_window, 500, 300));
    close_window(test_window);
}
#[test]
fn test_fill_ellipse_on_window_with_options_integration() {
    let test_window = open_window("Test Window", 800, 600);
    clear_window(test_window, color_white());
    fill_ellipse_on_window_with_options(test_window, color_black(), 400.0, 300.0, 100.0, 50.0, option_defaults());
    refresh_screen();
    assert_eq!(color_black(), get_pixel_from_window(test_window, 450, 300));
    assert_eq!(color_black(), get_pixel_from_window(test_window, 450, 325));
    assert_eq!(color_white(), get_pixel_from_window(test_window, 500, 300));
    close_window(test_window);
}
#[test]
fn test_clear_screen_to_white_integration() {
    let test_window = open_window("Test Window", 800, 600);
    draw_pixel(color_black(), 100.0, 100.0);
    refresh_screen();
    assert_eq!(color_black(), get_pixel_from_window(test_window, 100, 100));
    clear_screen_to_white();
    refresh_screen();
    assert_eq!(color_white(), get_pixel_from_window(test_window, 100, 100));
    close_window(test_window);
}
#[test]
fn test_clear_screen_integration() {
    let test_window = open_window("Test Window", 800, 600);
    draw_pixel(color_black(), 100.0, 100.0);
    refresh_screen();
    assert_eq!(color_black(), get_pixel_from_window(test_window, 100, 100));
    clear_screen(color_white());
    refresh_screen();
    assert_eq!(color_white(), get_pixel_from_window(test_window, 100, 100));
    close_window(test_window);
}
#[test]
fn test_display_details_integration() {
    let displays = number_of_displays();
    assert!(displays > 0);
    let display = display_details(0);
    assert!(display.is_some());
    assert!(display_width(display) > 0);
    assert!(display_height(display) > 0);
    assert!(display_name(display).is_some());
}
#[test]
fn test_display_height_integration() {
    let display = display_details(0);
    assert!(display_height(display) > 0);
}
#[test]
fn test_display_name_integration() {
    let display = display_details(0);
    assert!(display_name(display).is_some());
    assert!(!display_name(display).is_empty());
}
#[test]
fn test_display_width_integration() {
    let display = display_details(0);
    assert!(display_width(display) > 0);
}
#[test]
fn test_display_x_integration() {
    let display = display_details(0);
    assert!(display_x(display) > 0);
}
#[test]
fn test_display_y_integration() {
    let display = display_details(0);
    assert!(display_y(display) > 0);
}
#[test]
fn test_number_of_displays_integration() {
    assert!(number_of_displays() > 0);
}
#[test]
fn test_refresh_screen_integration() {
    let test_window = open_window("Test Window", 800, 600);
    clear_window(test_window, color_white());
    draw_circle(color_black(), circle_at(400.0, 300.0, 50.0));
    refresh_screen();
    close_window(test_window);
}
#[test]
fn test_refresh_screen_with_target_fps_integration() {
    let test_window = open_window("Test Window", 800, 600);
    clear_window(test_window, color_white());
    draw_circle(color_black(), circle_at(400.0, 300.0, 50.0));
    refresh_screen_with_target_fps(60);
    close_window(test_window);
}
#[test]
fn test_save_bitmap_integration() {
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    clear_bitmap(test_bitmap, color_white());
    draw_pixel_on_bitmap(test_bitmap, color_black(), 50, 50);
    save_bitmap(test_bitmap, "test_bitmap");
    free_bitmap(test_bitmap);
}
#[test]
fn test_screen_height_integration() {
    let test_window = open_window("Test Window", 800, 600);
    assert_eq!(600, screen_height());
    close_window(test_window);
}
#[test]
fn test_screen_width_integration() {
    let test_window = open_window("Test Window", 800, 600);
    assert_eq!(800, screen_width());
    close_window(test_window);
}
#[test]
fn test_take_screenshot_integration() {
    let test_window = open_window("Test Window", 800, 600);
    clear_window(test_window, color_white());
    draw_circle(color_black(), circle_at(400, 300, 50));
    refresh_screen();
    take_screenshot("test_screenshot");
    close_window(test_window);
}
#[test]
fn test_take_screenshot_of_window_integration() {
    let test_window = open_window("Test Window", 800, 600);
    clear_window(test_window, color_white());
    draw_circle(color_black(), circle_at(400, 300, 50));
    refresh_screen();
    take_screenshot_of_window(test_window, "test_screenshot");
    close_window(test_window);
}
#[test]
fn test_bitmap_bounding_circle_integration() {
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    let test_point = point_at(50.0, 50.0);
    let bounding_circle = bitmap_bounding_circle(test_bitmap, test_point);
    assert_eq!(test_point, center_point(bounding_circle));
    assert_eq!(100, circle_radius(bounding_circle));
    free_bitmap(test_bitmap);
}
#[test]
fn test_bitmap_bounding_rectangle_integration() {
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    let bounding_rect = bitmap_bounding_rectangle(test_bitmap);
    assert_eq!(0, bounding_rect.X);
    assert_eq!(0, bounding_rect.Y);
    assert_eq!(100, bounding_rect.Width);
    assert_eq!(100, bounding_rect.Height);
    free_bitmap(test_bitmap);
}
#[test]
fn test_bitmap_bounding_rectangle_at_location_integration() {
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    let bounding_rect = bitmap_bounding_rectangle_at_location(test_bitmap, 50.0, 50.0);
    assert_eq!(50, bounding_rect.X);
    assert_eq!(50, bounding_rect.Y);
    assert_eq!(100, bounding_rect.Width);
    assert_eq!(100, bounding_rect.Height);
    free_bitmap(test_bitmap);
}
#[test]
fn test_bitmap_cell_center_integration() {
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    let center = bitmap_cell_center(test_bitmap);
    assert_eq!(50.0, center.X);
    assert_eq!(50.0, center.Y);
    free_bitmap(test_bitmap);
}
#[test]
fn test_bitmap_cell_circle_integration() {
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    bitmap_set_cell_details(test_bitmap, 50, 50, 2, 2, 4);
    let circle = bitmap_cell_circle(test_bitmap, 50.0, 50.0);
    assert_eq!(50.0, circle.Center.X);
    assert_eq!(50.0, circle.Center.Y);
    assert_eq!(25, circle.Radius);
    free_bitmap(test_bitmap);
}
#[test]
fn test_bitmap_cell_circle_at_point_integration() {
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    bitmap_set_cell_details(test_bitmap, 50, 50, 2, 2, 4);
    let circle = bitmap_cell_circle_at_point(test_bitmap, point_at(100, 100));
    assert_eq!(100.0, circle.Center.X);
    assert_eq!(100.0, circle.Center.Y);
    assert_eq!(25, circle.Radius);
    free_bitmap(test_bitmap);
}
#[test]
fn test_bitmap_cell_circle_at_point_with_scale_integration() {
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    bitmap_set_cell_details(test_bitmap, 50, 50, 2, 2, 4);
    let circle = bitmap_cell_circle_at_point_with_scale(test_bitmap, point_at(100.0, 100.0), 2.0);
    assert_eq!(100.0, circle.Center.X);
    assert_eq!(100.0, circle.Center.Y);
    assert_eq!(50, circle.Radius);
    free_bitmap(test_bitmap);
}
#[test]
fn test_bitmap_cell_columns_integration() {
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    bitmap_set_cell_details(test_bitmap, 20, 20, 5, 5, 25);
    assert_eq!(5, bitmap_cell_columns(test_bitmap));
    free_bitmap(test_bitmap);
}
#[test]
fn test_bitmap_cell_count_integration() {
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    bitmap_set_cell_details(test_bitmap, 20, 20, 5, 5, 25);
    assert_eq!(25, bitmap_cell_count(test_bitmap));
    free_bitmap(test_bitmap);
}
#[test]
fn test_bitmap_cell_height_integration() {
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    bitmap_set_cell_details(test_bitmap, 20, 20, 5, 5, 25);
    assert_eq!(20, bitmap_cell_height(test_bitmap));
    free_bitmap(test_bitmap);
}
#[test]
fn test_bitmap_cell_offset_integration() {
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    bitmap_set_cell_details(test_bitmap, 25, 25, 4, 4, 16);
    let offset = bitmap_cell_offset(test_bitmap, 5);
    assert_eq!(25.0, offset.X);
    assert_eq!(25.0, offset.Y);
    free_bitmap(test_bitmap);
}
#[test]
fn test_bitmap_cell_rectangle_integration() {
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    bitmap_set_cell_details(test_bitmap, 25, 25, 4, 4, 16);
    let rect = bitmap_cell_rectangle(test_bitmap);
    assert_eq!(0, rect.X);
    assert_eq!(0, rect.Y);
    assert_eq!(25, rect.Width);
    assert_eq!(25, rect.Height);
    free_bitmap(test_bitmap);
}
#[test]
fn test_bitmap_cell_rectangle_at_point_integration() {
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    bitmap_set_cell_details(test_bitmap, 25, 25, 4, 4, 16);
    let rect = bitmap_cell_rectangle_at_point(test_bitmap, point_at(50.0, 50.0));
    assert_eq!(50.0, rect.X);
    assert_eq!(50.0, rect.Y);
    assert_eq!(25.0, rect.Width);
    assert_eq!(25.0, rect.Height);
    free_bitmap(test_bitmap);
}
#[test]
fn test_bitmap_cell_rows_integration() {
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    bitmap_set_cell_details(test_bitmap, 20, 20, 5, 5, 25);
    assert_eq!(5, bitmap_cell_rows(test_bitmap));
    free_bitmap(test_bitmap);
}
#[test]
fn test_bitmap_cell_width_integration() {
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    bitmap_set_cell_details(test_bitmap, 25, 25, 4, 4, 16);
    assert_eq!(25, bitmap_cell_width(test_bitmap));
    free_bitmap(test_bitmap);
}
#[test]
fn test_bitmap_center_integration() {
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    let test_center = bitmap_center(test_bitmap);
    assert_eq!(50.0, test_center.X);
    assert_eq!(50.0, test_center.Y);
    free_bitmap(test_bitmap);
}
#[test]
fn test_bitmap_filename_integration() {
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    assert_eq!("", bitmap_filename(test_bitmap));
    free_bitmap(test_bitmap);
}
#[test]
fn test_bitmap_height_integration() {
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    assert_eq!(100, bitmap_height(test_bitmap));
    free_bitmap(test_bitmap);
}
#[test]
fn test_bitmap_height_of_bitmap_named_integration() {
    let test_bitmap = create_bitmap("bitmap_height", 100, 100);
    assert_eq!(100, bitmap_height_of_bitmap_named("bitmap_height"));
    free_bitmap(test_bitmap);
}
#[test]
fn test_bitmap_name_integration() {
    let test_bitmap = create_bitmap("bitmap_name", 100, 100);
    assert_eq!("bitmap_name", bitmap_name(test_bitmap));
    free_bitmap(test_bitmap);
}
#[test]
fn test_bitmap_named_integration() {
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    assert!(bitmap_named("test_bitmap").is_some());
    assert!(bitmap_named("nonexistent_bitmap").is_none());
    free_bitmap(test_bitmap);
}
#[test]
fn test_bitmap_rectangle_of_cell_integration() {
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    bitmap_set_cell_details(test_bitmap, 25, 25, 4, 4, 16);
    let rect = bitmap_rectangle_of_cell(test_bitmap, 5);
    assert_eq!(25.0, rect.X);
    assert_eq!(25.0, rect.Y);
    assert_eq!(25.0, rect.Width);
    assert_eq!(25.0, rect.Height);
    free_bitmap(test_bitmap);
}
#[test]
fn test_bitmap_set_cell_details_integration() {
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    bitmap_set_cell_details(test_bitmap, 20, 20, 5, 5, 25);
    assert_eq!(20, bitmap_cell_width(test_bitmap));
    assert_eq!(20, bitmap_cell_height(test_bitmap));
    assert_eq!(5, bitmap_cell_columns(test_bitmap));
    assert_eq!(5, bitmap_cell_rows(test_bitmap));
    assert_eq!(25, bitmap_cell_count(test_bitmap));
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
    assert_eq!(100, bitmap_width(test_bitmap));
    free_bitmap(test_bitmap);
}
#[test]
fn test_bitmap_width_of_bitmap_named_integration() {
    let test_bitmap = create_bitmap("bitmap_width", 100, 100);
    assert_eq!(100, bitmap_width_of_bitmap_named("bitmap_width"));
    free_bitmap(test_bitmap);
}
#[test]
fn test_clear_bitmap_integration() {
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    draw_pixel_on_bitmap(test_bitmap, color_black(), 50, 50);
    assert_eq!(color_black(), get_pixel(test_bitmap, 50, 50));
    clear_bitmap(test_bitmap, color_white());
    assert_eq!(color_white(), get_pixel(test_bitmap, 50, 50));
    free_bitmap(test_bitmap);
}
#[test]
fn test_clear_bitmap_named_integration() {
    let test_bitmap = create_bitmap("bitmap_named", 100, 100);
    fill_rectangle_on_bitmap(test_bitmap, color_red(), 0, 0, 100, 100);
    assert_eq!(color_red(), get_pixel(test_bitmap, 50, 50));
    clear_bitmap_named("bitmap_named", color_white());
    assert_eq!(color_white(), get_pixel(test_bitmap, 50, 50));
    free_bitmap(test_bitmap);
}
#[test]
fn test_create_bitmap_integration() {
    let test_bitmap = create_bitmap("bitmap_name1", 100, 100);
    assert!(test_bitmap.is_some());
    assert_eq!(100, bitmap_width(test_bitmap));
    assert_eq!(100, bitmap_height(test_bitmap));
    assert_eq!("bitmap_name1", bitmap_name(test_bitmap));
    free_bitmap(test_bitmap);
}
#[test]
fn test_draw_bitmap_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    clear_window(test_window, color_white());
    fill_rectangle_on_bitmap(test_bitmap, color_red(), 0, 0, 50, 50);
    draw_bitmap(test_bitmap, 100.0, 100.0);
    refresh_screen();
    assert_eq!(color_red(), get_pixel_from_window(test_window, 125, 125));
    assert_eq!(color_white(), get_pixel_from_window(test_window, 175, 175));
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_draw_bitmap_with_options_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    clear_window(test_window, color_white());
    fill_rectangle_on_bitmap(test_bitmap, color_red(), 0, 0, 100, 100);
    draw_bitmap_with_options(test_bitmap, 100.0, 100.0, option_defaults());
    refresh_screen();
    assert_eq!(color_red(), get_pixel_from_window(test_window, 125, 125));
    assert_eq!(color_white(), get_pixel_from_window(test_window, 50, 50));
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_draw_bitmap_named_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    clear_window(test_window, color_white());
    fill_rectangle_on_bitmap(test_bitmap, color_red(), 0, 0, 100, 100);
    draw_bitmap_named("test_bitmap", 100.0, 100.0);
    refresh_screen();
    assert_eq!(color_red(), get_pixel_from_window(test_window, 125, 125));
    assert_eq!(color_white(), get_pixel_from_window(test_window, 50, 50));
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_draw_bitmap_named_with_options_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    clear_window(test_window, color_white());
    fill_rectangle_on_bitmap(test_bitmap, color_red(), 0, 0, 100, 100);
    draw_bitmap_named_with_options("test_bitmap", 100.0, 100.0, option_defaults());
    refresh_screen();
    assert_eq!(color_red(), get_pixel_from_window(test_window, 125, 125));
    assert_eq!(color_white(), get_pixel_from_window(test_window, 50, 50));
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_draw_bitmap_on_bitmap_on_bitmap_integration() {
    let dest_bitmap = create_bitmap("test_destination", 100, 100);
    let source_bitmap = create_bitmap("test_source", 50, 50);
    clear_bitmap(dest_bitmap, color_white());
    fill_rectangle_on_bitmap(source_bitmap, color_red(), 0, 0, 50, 50);
    draw_bitmap_on_bitmap_on_bitmap(dest_bitmap, source_bitmap, 25.0, 25.0);
    assert_eq!(color_red(), get_pixel(dest_bitmap, 50, 50));
    assert_eq!(color_white(), get_pixel(dest_bitmap, 10, 10));
    free_bitmap(dest_bitmap);
    free_bitmap(source_bitmap);
}
#[test]
fn test_draw_bitmap_on_bitmap_on_bitmap_with_options_integration() {
    let dest_bitmap = create_bitmap("test_destination", 100, 100);
    let source_bitmap = create_bitmap("test_source", 50, 50);
    clear_bitmap(dest_bitmap, color_white());
    fill_rectangle_on_bitmap(source_bitmap, color_red(), 0, 0, 50, 50);
    draw_bitmap_on_bitmap_on_bitmap_with_options(dest_bitmap, source_bitmap, 25.0, 25.0, option_defaults());
    assert_eq!(color_red(), get_pixel(dest_bitmap, 50, 50));
    assert_eq!(color_white(), get_pixel(dest_bitmap, 10, 10));
    free_bitmap(dest_bitmap);
    free_bitmap(source_bitmap);
}
#[test]
fn test_draw_bitmap_on_window_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    clear_window(test_window, color_white());
    fill_rectangle_on_bitmap(test_bitmap, color_red(), 0, 0, 100, 100);
    draw_bitmap_on_window(test_window, test_bitmap, 100.0, 100.0);
    refresh_screen();
    assert_eq!(color_red(), get_pixel_from_window(test_window, 125, 125));
    assert_eq!(color_white(), get_pixel_from_window(test_window, 50, 50));
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_draw_bitmap_on_window_with_options_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    clear_window(test_window, color_white());
    fill_rectangle_on_bitmap(test_bitmap, color_red(), 0, 0, 100, 100);
    draw_bitmap_on_window_with_options(test_window, test_bitmap, 100.0, 100.0, option_defaults());
    refresh_screen();
    assert_eq!(color_red(), get_pixel_from_window(test_window, 125, 125));
    assert_eq!(color_white(), get_pixel_from_window(test_window, 50, 50));
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_free_all_bitmaps_integration() {
    let bitmap1 = create_bitmap("test_bitmap_1", 100, 100);
    let bitmap2 = create_bitmap("test_bitmap_2", 100, 100);
    assert!(bitmap_valid(bitmap1));
    assert!(bitmap_valid(bitmap2));
    free_all_bitmaps();
    assert!(!bitmap_valid(bitmap1));
    assert!(!bitmap_valid(bitmap2));
}
#[test]
fn test_free_bitmap_integration() {
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    assert!(bitmap_valid(test_bitmap));
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
    let loaded_bitmap = load_bitmap("loaded_bitmap", "frog.png");
    assert_eq!(color_black(), get_pixel(loaded_bitmap, 50, 50));
    assert_eq!(color_white(), get_pixel(loaded_bitmap, 75, 75));
    free_bitmap(loaded_bitmap);
}
#[test]
fn test_pixel_drawn_at_point_pt_integration() {
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    clear_bitmap(test_bitmap, color_white());
    draw_pixel_on_bitmap(test_bitmap, color_black(), point_at(50.0, 50.0));
    assert_eq!(color_black(), get_pixel(test_bitmap, 50, 50));
    assert_eq!(color_white(), get_pixel(test_bitmap, 75, 75));
    free_bitmap(test_bitmap);
}
#[test]
fn test_pixel_drawn_at_point_integration() {
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    clear_bitmap(test_bitmap, color_white());
    draw_pixel_on_bitmap(test_bitmap, color_black(), 50.0, 50.0);
    assert_eq!(color_black(), get_pixel(test_bitmap, 50, 50));
    assert_eq!(color_white(), get_pixel(test_bitmap, 75, 75));
    free_bitmap(test_bitmap);
}
#[test]
fn test_pixel_drawn_at_point_in_cell_pt_integration() {
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    clear_bitmap(test_bitmap, color_white());
    draw_pixel_on_bitmap(test_bitmap, color_black(), point_at(50.0, 50.0));
    bitmap_set_cell_details(test_bitmap, 100, 100, 1, 1, 1);
    assert_eq!(color_black(), get_pixel(test_bitmap, 50, 50));
    assert_eq!(color_white(), get_pixel(test_bitmap, 75, 50));
    free_bitmap(test_bitmap);
}
#[test]
fn test_pixel_drawn_at_point_in_cell_integration() {
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    clear_bitmap(test_bitmap, color_white());
    draw_pixel_on_bitmap(test_bitmap, color_black(), point_at(50.0, 50.0));
    bitmap_set_cell_details(test_bitmap, 100, 100, 1, 1, 1);
    assert_eq!(color_black(), get_pixel(test_bitmap, 50, 50));
    assert_eq!(color_white(), get_pixel(test_bitmap, 75, 75));
    free_bitmap(test_bitmap);
}
#[test]
fn test_setup_collision_mask_integration() {
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    clear_bitmap(test_bitmap, color_white());
    setup_collision_mask(test_bitmap);
    assert_eq!(color_black(), get_pixel(test_bitmap, 50, 50));
    free_bitmap(test_bitmap);
}
#[test]
fn test_draw_line_record_integration() {
    let test_window = open_window("Test Window", 800, 600);
    clear_window(test_window, color_white());
    draw_line_record(color_black(), line_from(point_at(100.0, 100.0), point_at(200.0, 200.0)));
    refresh_screen();
    assert_eq!(color_black(), get_pixel_from_window(test_window, 100, 100));
    assert_eq!(color_white(), get_pixel_from_window(test_window, 99, 99));
    close_window(test_window);
}
#[test]
fn test_draw_line_record_with_options_integration() {
    let test_window = open_window("Test Window", 800, 600);
    clear_window(test_window, color_white());
    draw_line_record_with_options(color_black(), line_from(point_at(100.0, 100.0), point_at(200.0, 200.0)), option_line_width(3, option_defaults()));
    refresh_screen();
    assert_eq!(color_black(), get_pixel_from_window(test_window, 100, 100));
    assert_eq!(color_white(), get_pixel_from_window(test_window, 99, 99));
    close_window(test_window);
}
#[test]
fn test_draw_line_point_to_point_integration() {
    let test_window = open_window("Test Window", 800, 600);
    clear_window(test_window, color_white());
    draw_line_point_to_point(color_black(), point_at(100.0, 100.0), point_at(200.0, 200.0));
    refresh_screen();
    assert_eq!(color_black(), get_pixel_from_window(test_window, 100, 100));
    assert_eq!(color_white(), get_pixel_from_window(test_window, 99, 99));
    close_window(test_window);
}
#[test]
fn test_draw_line_point_to_point_with_options_integration() {
    let test_window = open_window("Test Window", 800, 600);
    clear_window(test_window, color_white());
    draw_line_point_to_point_with_options(color_black(), point_at(100.0, 100.0), point_at(200.0, 200.0), option_defaults());
    refresh_screen();
    assert_eq!(color_black(), get_pixel_from_window(test_window, 100, 100));
    assert_eq!(color_white(), get_pixel_from_window(test_window, 99, 99));
    close_window(test_window);
}
#[test]
fn test_draw_line_integration() {
    let test_window = open_window("Test Window", 800, 600);
    clear_window(test_window, color_white());
    draw_line(color_black(), 100.0, 100.0, 200.0, 200.0);
    refresh_screen();
    assert_eq!(color_black(), get_pixel_from_window(test_window, 100, 100));
    assert_eq!(color_white(), get_pixel_from_window(test_window, 99, 99));
    close_window(test_window);
}
#[test]
fn test_draw_line_with_options_integration() {
    let test_window = open_window("Test Window", 800, 600);
    clear_window(test_window, color_white());
    draw_line_with_options(color_black(), 100.0, 100.0, 200.0, 200.0, option_defaults());
    refresh_screen();
    assert_eq!(color_black(), get_pixel_from_window(test_window, 100, 100));
    assert_eq!(color_white(), get_pixel_from_window(test_window, 99, 99));
    close_window(test_window);
}
#[test]
fn test_draw_line_on_bitmap_record_integration() {
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    clear_bitmap(test_bitmap, color_white());
    draw_line_on_bitmap_record(test_bitmap, color_black(), line_from(point_at(10.0, 10.0), point_at(90.0, 90.0)));
    assert_eq!(color_black(), get_pixel(test_bitmap, 50, 50));
    assert_eq!(color_white(), get_pixel(test_bitmap, 95, 95));
    free_bitmap(test_bitmap);
}
#[test]
fn test_draw_line_on_bitmap_record_with_options_integration() {
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    clear_bitmap(test_bitmap, color_white());
    draw_line_on_bitmap_record_with_options(test_bitmap, color_black(), line_from(point_at(10.0, 10.0), point_at(90.0, 90.0)), option_defaults());
    assert_eq!(color_black(), get_pixel(test_bitmap, 50, 50));
    assert_eq!(color_white(), get_pixel(test_bitmap, 95, 50));
    free_bitmap(test_bitmap);
}
#[test]
fn test_draw_line_on_bitmap_point_to_point_integration() {
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    clear_bitmap(test_bitmap, color_white());
    draw_line_on_bitmap_point_to_point(test_bitmap, color_black(), point_at(10.0, 10.0), point_at(90.0, 90.0));
    assert_eq!(color_black(), get_pixel(test_bitmap, 50, 50));
    assert_eq!(color_white(), get_pixel(test_bitmap, 0, 0));
    free_bitmap(test_bitmap);
}
#[test]
fn test_draw_line_on_bitmap_point_to_point_with_options_integration() {
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    clear_bitmap(test_bitmap, color_white());
    draw_line_on_bitmap_point_to_point_with_options(test_bitmap, color_black(), point_at(10.0, 10.0), point_at(90.0, 90.0), option_defaults());
    assert_eq!(color_black(), get_pixel(test_bitmap, 10, 10));
    assert_eq!(color_black(), get_pixel(test_bitmap, 90, 90));
    assert_eq!(color_white(), get_pixel(test_bitmap, 5, 5));
    free_bitmap(test_bitmap);
}
#[test]
fn test_draw_line_on_bitmap_integration() {
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    clear_bitmap(test_bitmap, color_white());
    draw_line_on_bitmap(test_bitmap, color_black(), 10.0, 10.0, 90.0, 90.0);
    assert_eq!(color_black(), get_pixel(test_bitmap, 50, 50));
    assert_eq!(color_white(), get_pixel(test_bitmap, 95, 50));
    free_bitmap(test_bitmap);
}
#[test]
fn test_draw_line_on_bitmap_with_options_integration() {
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    clear_bitmap(test_bitmap, color_white());
    draw_line_on_bitmap_with_options(test_bitmap, color_black(), 10.0, 10.0, 90.0, 90.0, option_defaults());
    assert_eq!(color_black(), get_pixel(test_bitmap, 50, 50));
    assert_eq!(color_white(), get_pixel(test_bitmap, 5, 5));
    free_bitmap(test_bitmap);
}
#[test]
fn test_draw_line_on_window_record_integration() {
    let test_window = open_window("Test Window", 800, 600);
    clear_window(test_window, color_white());
    line_from(point_at(100.0, 100.0), point_at(150.0, 150.0));
    refresh_screen();
    assert_eq!(color_black(), get_pixel_from_window(test_window, 100, 100));
    assert_eq!(color_white(), get_pixel_from_window(test_window, 99, 99));
    close_window(test_window);
}
#[test]
fn test_draw_line_on_window_record_with_options_integration() {
    let test_window = open_window("Test Window", 800, 600);
    clear_window(test_window, color_white());
    option_defaults();
    refresh_screen();
    assert_eq!(color_black(), get_pixel_from_window(test_window, 100, 100));
    assert_eq!(color_white(), get_pixel_from_window(test_window, 99, 99));
    close_window(test_window);
}
#[test]
fn test_draw_line_on_window_point_to_point_integration() {
    let test_window = open_window("Test Window", 800, 600);
    clear_window(test_window, color_white());
    draw_line_on_window_point_to_point(test_window, color_black(), point_at(100.0, 100.0), point_at(200.0, 200.0));
    refresh_screen();
    assert_eq!(color_black(), get_pixel_from_window(test_window, 100, 100));
    assert_eq!(color_white(), get_pixel_from_window(test_window, 99, 99));
    close_window(test_window);
}
#[test]
fn test_draw_line_on_window_point_to_point_with_options_integration() {
    let test_window = open_window("Test Window", 800, 600);
    clear_window(test_window, color_white());
    option_defaults();
    refresh_screen();
    assert_eq!(color_black(), get_pixel_from_window(test_window, 100, 100));
    assert_eq!(color_white(), get_pixel_from_window(test_window, 99, 99));
    close_window(test_window);
}
#[test]
fn test_draw_line_on_window_integration() {
    let test_window = open_window("Test Window", 800, 600);
    clear_window(test_window, color_white());
    draw_line_on_window(test_window, color_black(), 100.0, 100.0, 200.0, 200.0);
    refresh_screen();
    assert_eq!(color_black(), get_pixel_from_window(test_window, 100, 100));
    assert_eq!(color_white(), get_pixel_from_window(test_window, 99, 99));
    close_window(test_window);
}
#[test]
fn test_draw_line_on_window_with_options_integration() {
    let test_window = open_window("Test Window", 800, 600);
    clear_window(test_window, color_white());
    draw_line_on_window_with_options(test_window, color_black(), 100.0, 100.0, 200.0, 200.0, option_defaults());
    refresh_screen();
    assert_eq!(color_black(), get_pixel_from_window(test_window, 100, 100));
    assert_eq!(color_white(), get_pixel_from_window(test_window, 99, 99));
    close_window(test_window);
}
#[test]
fn test_draw_pixel_at_point_integration() {
    let test_window = open_window("Test Window", 800, 600);
    clear_window(test_window, color_white());
    draw_pixel_at_point(color_black(), point_at(100.0, 100.0));
    refresh_screen();
    assert_eq!(color_black(), get_pixel_from_window(test_window, 100, 100));
    assert_eq!(color_white(), get_pixel_from_window(test_window, 99, 99));
    close_window(test_window);
}
#[test]
fn test_draw_pixel_at_point_with_options_integration() {
    let test_window = open_window("Test Window", 800, 600);
    clear_window(test_window, color_white());
    draw_pixel_at_point_with_options(color_black(), point_at(100.0, 100.0), option_defaults());
    refresh_screen();
    assert_eq!(color_black(), get_pixel_from_window(test_window, 100, 100));
    assert_eq!(color_white(), get_pixel_from_window(test_window, 99, 99));
    close_window(test_window);
}
#[test]
fn test_draw_pixel_integration() {
    let test_window = open_window("Test Window", 800, 600);
    clear_window(test_window, color_white());
    draw_pixel(color_black(), 100.0, 100.0);
    refresh_screen();
    assert_eq!(color_black(), get_pixel_from_window(test_window, 100, 100));
    assert_eq!(color_white(), get_pixel_from_window(test_window, 99, 99));
    close_window(test_window);
}
#[test]
fn test_draw_pixel_with_options_integration() {
    let test_window = open_window("Test Window", 800, 600);
    clear_window(test_window, color_white());
    draw_pixel_with_options(color_black(), 100.0, 100.0, option_defaults());
    refresh_screen();
    assert_eq!(color_black(), get_pixel_from_window(test_window, 100, 100));
    assert_eq!(color_white(), get_pixel_from_window(test_window, 99, 99));
    close_window(test_window);
}
#[test]
fn test_draw_pixel_on_bitmap_at_point_integration() {
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    clear_bitmap(test_bitmap, color_white());
    draw_pixel_on_bitmap_at_point(test_bitmap, color_black(), point_at(50.0, 50.0));
    assert_eq!(color_black(), get_pixel(test_bitmap, 50, 50));
    assert_eq!(color_white(), get_pixel(test_bitmap, 0, 0));
    free_bitmap(test_bitmap);
}
#[test]
fn test_draw_pixel_on_bitmap_at_point_with_options_integration() {
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    clear_bitmap(test_bitmap, color_white());
    draw_pixel_on_bitmap_at_point_with_options(test_bitmap, color_black(), point_at(50.0, 50.0), option_defaults());
    assert_eq!(color_black(), get_pixel(test_bitmap, 50, 50));
    assert_eq!(color_white(), get_pixel(test_bitmap, 0, 0));
    free_bitmap(test_bitmap);
}
#[test]
fn test_draw_pixel_on_bitmap_integration() {
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    clear_bitmap(test_bitmap, color_white());
    draw_pixel_on_bitmap(test_bitmap, color_black(), 50.0, 50.0);
    assert_eq!(color_black(), get_pixel(test_bitmap, 50, 50));
    assert_eq!(color_white(), get_pixel(test_bitmap, 51, 50));
    free_bitmap(test_bitmap);
}
#[test]
fn test_draw_pixel_on_bitmap_with_options_integration() {
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    clear_bitmap(test_bitmap, color_white());
    draw_pixel_on_bitmap_with_options(test_bitmap, color_black(), 50.0, 50.0, option_defaults());
    assert_eq!(color_black(), get_pixel(test_bitmap, 50, 50));
    assert_eq!(color_white(), get_pixel(test_bitmap, 51, 50));
    free_bitmap(test_bitmap);
}
#[test]
fn test_draw_pixel_on_window_at_point_integration() {
    let test_window = open_window("Test Window", 800, 600);
    clear_window(test_window, color_white());
    draw_pixel_on_window_at_point(test_window, color_black(), point_at(100.0, 100.0));
    refresh_screen();
    assert_eq!(color_black(), get_pixel_from_window(test_window, 100, 100));
    assert_eq!(color_white(), get_pixel_from_window(test_window, 99, 99));
    close_window(test_window);
}
#[test]
fn test_draw_pixel_on_window_at_point_with_options_integration() {
    let test_window = open_window("Test Window", 800, 600);
    clear_window(test_window, color_white());
    draw_pixel_on_window_at_point_with_options(test_window, color_black(), point_at(100.0, 100.0), option_defaults());
    refresh_screen();
    assert_eq!(color_black(), get_pixel_from_window(test_window, 100, 100));
    assert_eq!(color_white(), get_pixel_from_window(test_window, 99, 99));
    close_window(test_window);
}
#[test]
fn test_draw_pixel_on_window_integration() {
    let test_window = open_window("Test Window", 800, 600);
    clear_window(test_window, color_white());
    draw_pixel_on_window(test_window, color_black(), 100.0, 100.0);
    refresh_screen();
    assert_eq!(color_black(), get_pixel_from_window(test_window, 100, 100));
    assert_eq!(color_white(), get_pixel_from_window(test_window, 99, 99));
    close_window(test_window);
}
#[test]
fn test_draw_pixel_on_window_with_options_integration() {
    let test_window = open_window("Test Window", 800, 600);
    clear_window(test_window, color_white());
    draw_pixel_on_window_with_options(test_window, color_black(), 100.0, 100.0, option_defaults());
    refresh_screen();
    assert_eq!(color_black(), get_pixel_from_window(test_window, 100, 100));
    assert_eq!(color_white(), get_pixel_from_window(test_window, 99, 99));
    close_window(test_window);
}
#[test]
fn test_get_pixel_from_bitmap_at_point_integration() {
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    clear_bitmap(test_bitmap, color_white());
    draw_pixel_on_bitmap(test_bitmap, color_black(), point_at(50.0, 50.0));
    assert_eq!(color_black(), get_pixel_from_bitmap_at_point(test_bitmap, 50, 50));
    assert_eq!(color_white(), get_pixel_from_bitmap_at_point(test_bitmap, 49, 49));
    free_bitmap(test_bitmap);
}
#[test]
fn test_get_pixel_from_bitmap_integration() {
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    clear_bitmap(test_bitmap, color_white());
    draw_pixel_on_bitmap(test_bitmap, color_black(), 50.0, 50.0);
    assert_eq!(color_black(), get_pixel_from_bitmap(test_bitmap, 50, 50));
    assert_eq!(color_white(), get_pixel_from_bitmap(test_bitmap, 49, 49));
    free_bitmap(test_bitmap);
}
#[test]
fn test_get_pixel_at_point_integration() {
    let test_window = open_window("Test Window", 800, 600);
    clear_window(test_window, color_white());
    draw_pixel(color_black(), point_at(100.0, 100.0));
    refresh_screen();
    assert_eq!(color_black(), get_pixel_from_window(test_window, 100, 100));
    assert_eq!(color_white(), get_pixel_from_window(test_window, 99, 99));
    close_window(test_window);
}
#[test]
fn test_get_pixel_integration() {
    let test_window = open_window("Test Window", 800, 600);
    clear_window(test_window, color_white());
    draw_pixel(color_black(), 100.0, 100.0);
    refresh_screen();
    assert_eq!(color_black(), get_pixel_from_window(test_window, 100, 100));
    assert_eq!(color_white(), get_pixel_from_window(test_window, 99, 99));
    close_window(test_window);
}
#[test]
fn test_get_pixel_from_window_at_point_integration() {
    let test_window = open_window("Test Window", 800, 600);
    clear_window(test_window, color_white());
    draw_pixel(color_black(), point_at(100.0, 100.0));
    refresh_screen();
    assert_eq!(color_black(), get_pixel_from_window_at_point(test_window, 100, 100));
    assert_eq!(color_white(), get_pixel_from_window_at_point(test_window, 99, 99));
    close_window(test_window);
}
#[test]
fn test_get_pixel_from_window_integration() {
    let test_window = open_window("Test Window", 800, 600);
    clear_window(test_window, color_white());
    draw_pixel(color_black(), 100.0, 100.0);
    refresh_screen();
    assert_eq!(color_black(), get_pixel_from_window(test_window, 100, 100));
    assert_eq!(color_white(), get_pixel_from_window(test_window, 99, 99));
    close_window(test_window);
}
#[test]
fn test_get_pixel_from_window_at_point_from_window_integration() {
    let test_window = open_window("Test Window", 800, 600);
    clear_window(test_window, color_white());
    draw_pixel(color_black(), point_at(100.0, 100.0));
    refresh_screen();
    assert_eq!(color_black(), get_pixel_from_window_at_point_from_window(test_window, 100, 100));
    assert_eq!(color_white(), get_pixel_from_window_at_point_from_window(test_window, 99, 99));
    close_window(test_window);
}
#[test]
fn test_get_pixel_from_window_from_window_integration() {
    let test_window = open_window("Test Window", 800, 600);
    clear_window(test_window, color_white());
    draw_pixel(color_black(), 100.0, 100.0);
    refresh_screen();
    assert_eq!(color_black(), get_pixel_from_window_from_window(test_window, 100, 100));
    assert_eq!(color_white(), get_pixel_from_window_from_window(test_window, 99, 99));
    close_window(test_window);
}
#[test]
fn test_draw_quad_integration() {
    let test_window = open_window("Test Window", 800, 600);
    clear_window(test_window, color_white());
    let quad = quad_from(point_at(100.0, 100.0), point_at(200.0, 100.0), point_at(100.0, 200.0), point_at(200.0, 200.0));
    draw_quad(color_black(), quad);
    refresh_screen();
    assert_eq!(color_black(), get_pixel_from_window(test_window, 100, 100));
    assert_eq!(color_white(), get_pixel_from_window(test_window, 150, 150));
    assert_eq!(color_white(), get_pixel_from_window(test_window, 250, 250));
    close_window(test_window);
}
#[test]
fn test_draw_quad_with_options_integration() {
    let test_window = open_window("Test Window", 800, 600);
    clear_window(test_window, color_white());
    let quad = quad_from(point_at(100.0, 100.0), point_at(200.0, 100.0), point_at(100.0, 200.0), point_at(200.0, 200.0));
    draw_quad_with_options(color_black(), quad, option_defaults());
    refresh_screen();
    assert_eq!(color_black(), get_pixel_from_window(test_window, 100, 100));
    assert_eq!(color_white(), get_pixel_from_window(test_window, 150, 150));
    assert_eq!(color_white(), get_pixel_from_window(test_window, 250, 250));
    close_window(test_window);
}
#[test]
fn test_draw_quad_on_bitmap_integration() {
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    clear_bitmap(test_bitmap, color_white());
    let quad = quad_from(point_at(10.0, 10.0), point_at(90.0, 10.0), point_at(10.0, 90.0), point_at(90.0, 90.0));
    draw_quad_on_bitmap(test_bitmap, color_black(), quad);
    assert_eq!(color_black(), get_pixel(test_bitmap, 10, 10));
    assert_eq!(color_white(), get_pixel(test_bitmap, 50, 50));
    assert_eq!(color_white(), get_pixel(test_bitmap, 5, 5));
    free_bitmap(test_bitmap);
}
#[test]
fn test_draw_quad_on_bitmap_with_options_integration() {
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    clear_bitmap(test_bitmap, color_white());
    let quad = quad_from(point_at(10.0, 10.0), point_at(90.0, 10.0), point_at(90.0, 90.0), point_at(10.0, 90.0));
    draw_quad_on_bitmap_with_options(test_bitmap, color_black(), quad, option_defaults());
    assert_eq!(color_black(), get_pixel(test_bitmap, 10, 10));
    assert_eq!(color_black(), get_pixel(test_bitmap, 50, 50));
    assert_eq!(color_white(), get_pixel(test_bitmap, 5, 5));
    free_bitmap(test_bitmap);
}
#[test]
fn test_draw_quad_on_window_integration() {
    let test_window = open_window("Test Window", 800, 600);
    clear_window(test_window, color_white());
    let quad = quad_from(point_at(100.0, 100.0), point_at(200.0, 100.0), point_at(100.0, 200.0), point_at(200.0, 200.0));
    draw_quad_on_window(test_window, color_black(), quad);
    refresh_screen();
    assert_eq!(color_black(), get_pixel_from_window(test_window, 100, 100));
    assert_eq!(color_white(), get_pixel_from_window(test_window, 150, 150));
    assert_eq!(color_white(), get_pixel_from_window(test_window, 250, 250));
    close_window(test_window);
}
#[test]
fn test_draw_quad_on_window_with_options_integration() {
    let test_window = open_window("Test Window", 800, 600);
    clear_window(test_window, color_white());
    let quad = quad_from(point_at(100.0, 100.0), point_at(200.0, 100.0), point_at(100.0, 200.0), point_at(200.0, 200.0));
    draw_quad_on_window_with_options(test_window, color_black(), quad, option_defaults());
    refresh_screen();
    assert_eq!(color_black(), get_pixel_from_window(test_window, 100, 100));
    assert_eq!(color_white(), get_pixel_from_window(test_window, 150, 150));
    assert_eq!(color_white(), get_pixel_from_window(test_window, 250, 250));
    close_window(test_window);
}
#[test]
fn test_draw_rectangle_record_integration() {
    let test_window = open_window("Test Window", 800, 600);
    clear_window(test_window, color_white());
    let rectangle = rectangle_from(100.0, 100.0, 200.0, 150.0);
    draw_rectangle_record(color_black(), rectangle);
    refresh_screen();
    assert_eq!(color_black(), get_pixel_from_window(test_window, 100, 100));
    assert_eq!(color_white(), get_pixel_from_window(test_window, 150, 125));
    assert_eq!(color_white(), get_pixel_from_window(test_window, 301, 251));
    close_window(test_window);
}
#[test]
fn test_draw_rectangle_record_with_options_integration() {
    let test_window = open_window("Test Window", 800, 600);
    clear_window(test_window, color_white());
    let rectangle = rectangle_from(100.0, 100.0, 200.0, 150.0);
    draw_rectangle_record_with_options(color_black(), rectangle, option_defaults());
    refresh_screen();
    assert_eq!(color_black(), get_pixel_from_window(test_window, 100, 100));
    assert_eq!(color_white(), get_pixel_from_window(test_window, 150, 125));
    assert_eq!(color_white(), get_pixel_from_window(test_window, 350, 300));
    close_window(test_window);
}
#[test]
fn test_draw_rectangle_integration() {
    let test_window = open_window("Test Window", 800, 600);
    clear_window(test_window, color_white());
    draw_rectangle(color_black(), 100.0, 100.0, 200.0, 150.0);
    refresh_screen();
    assert_eq!(color_black(), get_pixel_from_window(test_window, 100, 100));
    assert_eq!(color_white(), get_pixel_from_window(test_window, 301, 251));
    close_window(test_window);
}
#[test]
fn test_draw_rectangle_with_options_integration() {
    let test_window = open_window("Test Window", 800, 600);
    clear_window(test_window, color_white());
    draw_rectangle_with_options(color_black(), 100.0, 100.0, 200.0, 150.0, option_line_width(3, option_defaults()));
    refresh_screen();
    assert_eq!(color_black(), get_pixel_from_window(test_window, 100, 100));
    assert_eq!(color_black(), get_pixel_from_window(test_window, 101, 100));
    assert_eq!(color_white(), get_pixel_from_window(test_window, 150, 125));
    assert_eq!(color_white(), get_pixel_from_window(test_window, 301, 251));
    close_window(test_window);
}
#[test]
fn test_draw_rectangle_on_bitmap_record_integration() {
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    clear_bitmap(test_bitmap, color_white());
    let rectangle = rectangle_from(50.0, 50.0, 20.0, 30.0);
    draw_rectangle_on_bitmap_record(test_bitmap, color_black(), rectangle);
    assert_eq!(color_black(), get_pixel(test_bitmap, 50, 50));
    assert_eq!(color_white(), get_pixel(test_bitmap, 80, 90));
    free_bitmap(test_bitmap);
}
#[test]
fn test_draw_rectangle_on_bitmap_record_with_options_integration() {
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    clear_bitmap(test_bitmap, color_white());
    let rectangle = rectangle_from(50.0, 50.0, 20.0, 20.0);
    draw_rectangle_on_bitmap_record_with_options(test_bitmap, color_black(), rectangle, option_defaults());
    assert_eq!(color_black(), get_pixel(test_bitmap, 50, 50));
    assert_eq!(color_white(), get_pixel(test_bitmap, 75, 75));
    free_bitmap(test_bitmap);
}
#[test]
fn test_draw_rectangle_on_bitmap_integration() {
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    clear_bitmap(test_bitmap, color_white());
    draw_rectangle_on_bitmap(test_bitmap, color_black(), 50.0, 50.0, 20.0, 20.0);
    assert_eq!(color_black(), get_pixel(test_bitmap, 50, 50));
    assert_eq!(color_white(), get_pixel(test_bitmap, 75, 75));
    free_bitmap(test_bitmap);
}
#[test]
fn test_draw_rectangle_on_bitmap_with_options_integration() {
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    clear_bitmap(test_bitmap, color_white());
    draw_rectangle_on_bitmap_with_options(test_bitmap, color_black(), 50.0, 50.0, 20.0, 20.0, option_defaults());
    assert_eq!(color_black(), get_pixel(test_bitmap, 50, 50));
    assert_eq!(color_white(), get_pixel(test_bitmap, 75, 75));
    free_bitmap(test_bitmap);
}
#[test]
fn test_draw_rectangle_on_window_record_integration() {
    let test_window = open_window("Test Window", 800, 600);
    clear_window(test_window, color_white());
    let rectangle = rectangle_from(100.0, 100.0, 50.0, 50.0);
    draw_rectangle_on_window_record(test_window, color_black(), rectangle);
    refresh_screen();
    assert_eq!(color_black(), get_pixel_from_window(test_window, 100, 100));
    assert_eq!(color_white(), get_pixel_from_window(test_window, 125, 125));
    assert_eq!(color_white(), get_pixel_from_window(test_window, 200, 200));
    close_window(test_window);
}
#[test]
fn test_draw_rectangle_on_window_record_with_options_integration() {
    let test_window = open_window("Test Window", 800, 600);
    clear_window(test_window, color_white());
    let rectangle = rectangle_from(100.0, 100.0, 50.0, 50.0);
    draw_rectangle_on_window_record_with_options(test_window, color_black(), rectangle, option_defaults());
    refresh_screen();
    assert_eq!(color_black(), get_pixel_from_window(test_window, 100, 100));
    assert_eq!(color_white(), get_pixel_from_window(test_window, 125, 125));
    assert_eq!(color_white(), get_pixel_from_window(test_window, 175, 175));
    close_window(test_window);
}
#[test]
fn test_draw_rectangle_on_window_integration() {
    let test_window = open_window("Test Window", 800, 600);
    clear_window(test_window, color_white());
    draw_rectangle_on_window(test_window, color_black(), 100.0, 100.0, 50.0, 50.0);
    refresh_screen();
    assert_eq!(color_black(), get_pixel_from_window(test_window, 100, 100));
    assert_eq!(color_white(), get_pixel_from_window(test_window, 200, 200));
    close_window(test_window);
}
#[test]
fn test_draw_rectangle_on_window_with_options_integration() {
    let test_window = open_window("Test Window", 800, 600);
    clear_window(test_window, color_white());
    draw_rectangle_on_window_with_options(test_window, color_black(), 100.0, 100.0, 50.0, 50.0, option_defaults());
    refresh_screen();
    assert_eq!(color_black(), get_pixel_from_window(test_window, 100, 100));
    assert_eq!(color_white(), get_pixel_from_window(test_window, 200, 200));
    close_window(test_window);
}
#[test]
fn test_fill_quad_integration() {
    let test_window = open_window("Test Window", 800, 600);
    clear_window(test_window, color_white());
    let quad = quad_from(point_at(100.0, 100.0), point_at(300.0, 100.0), point_at(100.0, 300.0), point_at(300.0, 300.0));
    fill_quad(color_black(), quad);
    refresh_screen();
    assert_eq!(color_black(), get_pixel_from_window(test_window, 200, 200));
    assert_eq!(color_white(), get_pixel_from_window(test_window, 400, 400));
    close_window(test_window);
}
#[test]
fn test_fill_quad_with_options_integration() {
    let test_window = open_window("Test Window", 800, 600);
    clear_window(test_window, color_white());
    let quad = quad_from(point_at(100.0, 100.0), point_at(300.0, 100.0), point_at(100.0, 300.0), point_at(300.0, 300.0));
    fill_quad_with_options(color_black(), quad, option_defaults());
    refresh_screen();
    assert_eq!(color_black(), get_pixel_from_window(test_window, 200, 200));
    assert_eq!(color_white(), get_pixel_from_window(test_window, 400, 400));
    close_window(test_window);
}
#[test]
fn test_fill_quad_on_bitmap_integration() {
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    clear_bitmap(test_bitmap, color_white());
    let quad = quad_from(point_at(10.0, 10.0), point_at(90.0, 10.0), point_at(10.0, 90.0), point_at(90.0, 90.0));
    fill_quad_on_bitmap(test_bitmap, color_black(), quad);
    assert_eq!(color_black(), get_pixel(test_bitmap, 50, 50));
    assert_eq!(color_white(), get_pixel(test_bitmap, 0, 0));
    free_bitmap(test_bitmap);
}
#[test]
fn test_fill_quad_on_bitmap_with_options_integration() {
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    clear_bitmap(test_bitmap, color_white());
    let quad = quad_from(point_at(10.0, 10.0), point_at(90.0, 10.0), point_at(90.0, 90.0), point_at(10.0, 90.0));
    fill_quad_on_bitmap_with_options(test_bitmap, color_black(), quad, option_defaults());
    assert_eq!(color_black(), get_pixel(test_bitmap, 50, 50));
    assert_eq!(color_white(), get_pixel(test_bitmap, 95, 50));
    free_bitmap(test_bitmap);
}
#[test]
fn test_fill_quad_on_window_integration() {
    let test_window = open_window("Test Window", 800, 600);
    clear_window(test_window, color_white());
    let quad = quad_from(point_at(100.0, 100.0), point_at(200.0, 100.0), point_at(100.0, 200.0), point_at(200.0, 200.0));
    fill_quad_on_window(test_window, color_black(), quad);
    refresh_screen();
    assert_eq!(color_black(), get_pixel_from_window(test_window, 150, 150));
    assert_eq!(color_white(), get_pixel_from_window(test_window, 250, 250));
    close_window(test_window);
}
#[test]
fn test_fill_quad_on_window_with_options_integration() {
    let test_window = open_window("Test Window", 800, 600);
    clear_window(test_window, color_white());
    let quad = quad_from(point_at(100.0, 100.0), point_at(200.0, 100.0), point_at(200.0, 200.0), point_at(100.0, 200.0));
    fill_quad_on_window_with_options(test_window, color_black(), quad, option_defaults());
    refresh_screen();
    assert_eq!(color_black(), get_pixel_from_window(test_window, 150, 150));
    assert_eq!(color_white(), get_pixel_from_window(test_window, 250, 150));
    close_window(test_window);
}
#[test]
fn test_fill_rectangle_record_integration() {
    let test_window = open_window("Test Window", 800, 600);
    clear_window(test_window, color_white());
    let rectangle = rectangle_from(100.0, 100.0, 200.0, 150.0);
    fill_rectangle_record(color_black(), rectangle);
    refresh_screen();
    assert_eq!(color_black(), get_pixel_from_window(test_window, 150, 125));
    assert_eq!(color_white(), get_pixel_from_window(test_window, 350, 275));
    close_window(test_window);
}
#[test]
fn test_fill_rectangle_record_with_options_integration() {
    let test_window = open_window("Test Window", 800, 600);
    clear_window(test_window, color_white());
    let rectangle = rectangle_from(100.0, 100.0, 200.0, 150.0);
    fill_rectangle_record_with_options(color_black(), rectangle, option_defaults());
    refresh_screen();
    assert_eq!(color_black(), get_pixel_from_window(test_window, 150, 125));
    assert_eq!(color_white(), get_pixel_from_window(test_window, 350, 275));
    close_window(test_window);
}
#[test]
fn test_fill_rectangle_integration() {
    let test_window = open_window("Test Window", 800, 600);
    clear_window(test_window, color_white());
    fill_rectangle(color_black(), 100.0, 100.0, 200.0, 150.0);
    refresh_screen();
    assert_eq!(color_black(), get_pixel_from_window(test_window, 150, 125));
    assert_eq!(color_white(), get_pixel_from_window(test_window, 301, 251));
    close_window(test_window);
}
#[test]
fn test_fill_rectangle_with_options_integration() {
    let test_window = open_window("Test Window", 800, 600);
    clear_window(test_window, color_white());
    fill_rectangle_with_options(color_black(), 100.0, 100.0, 200.0, 150.0, option_defaults());
    refresh_screen();
    assert_eq!(color_black(), get_pixel_from_window(test_window, 150, 125));
    assert_eq!(color_white(), get_pixel_from_window(test_window, 301, 251));
    close_window(test_window);
}
#[test]
fn test_fill_rectangle_on_bitmap_record_integration() {
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    clear_bitmap(test_bitmap, color_white());
    let rectangle = rectangle_from(25.0, 25.0, 50.0, 50.0);
    fill_rectangle_on_bitmap_record(test_bitmap, color_black(), rectangle);
    assert_eq!(color_black(), get_pixel(test_bitmap, 50, 50));
    assert_eq!(color_white(), get_pixel(test_bitmap, 10, 10));
    free_bitmap(test_bitmap);
}
#[test]
fn test_fill_rectangle_on_bitmap_record_with_options_integration() {
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    clear_bitmap(test_bitmap, color_white());
    let rectangle = rectangle_from(25.0, 25.0, 50.0, 50.0);
    fill_rectangle_on_bitmap_record_with_options(test_bitmap, color_black(), rectangle, option_defaults());
    assert_eq!(color_black(), get_pixel(test_bitmap, 50, 50));
    assert_eq!(color_white(), get_pixel(test_bitmap, 10, 10));
    free_bitmap(test_bitmap);
}
#[test]
fn test_fill_rectangle_on_bitmap_integration() {
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    clear_bitmap(test_bitmap, color_white());
    fill_rectangle_on_bitmap(test_bitmap, color_black(), 25.0, 25.0, 50.0, 50.0);
    assert_eq!(color_black(), get_pixel(test_bitmap, 50, 50));
    assert_eq!(color_white(), get_pixel(test_bitmap, 75, 75));
    free_bitmap(test_bitmap);
}
#[test]
fn test_fill_rectangle_on_bitmap_with_options_integration() {
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    clear_bitmap(test_bitmap, color_white());
    fill_rectangle_on_bitmap_with_options(test_bitmap, color_black(), 25.0, 25.0, 50.0, 50.0, option_defaults());
    assert_eq!(color_black(), get_pixel(test_bitmap, 50, 50));
    assert_eq!(color_white(), get_pixel(test_bitmap, 10, 10));
    free_bitmap(test_bitmap);
}
#[test]
fn test_fill_rectangle_on_window_record_integration() {
    let test_window = open_window("Test Window", 800, 600);
    clear_window(test_window, color_white());
    let rectangle = rectangle_from(100.0, 100.0, 200.0, 150.0);
    fill_rectangle_on_window_record(test_window, color_black(), rectangle);
    refresh_screen();
    assert_eq!(color_black(), get_pixel_from_window(test_window, 150, 125));
    assert_eq!(color_white(), get_pixel_from_window(test_window, 350, 275));
    close_window(test_window);
}
#[test]
fn test_fill_rectangle_on_window_record_with_options_integration() {
    let test_window = open_window("Test Window", 800, 600);
    clear_window(test_window, color_white());
    let rectangle = rectangle_from(100.0, 100.0, 200.0, 150.0);
    fill_rectangle_on_window_record_with_options(test_window, color_black(), rectangle, option_defaults());
    refresh_screen();
    assert_eq!(color_black(), get_pixel_from_window(test_window, 150, 125));
    assert_eq!(color_white(), get_pixel_from_window(test_window, 350, 275));
    close_window(test_window);
}
#[test]
fn test_fill_rectangle_on_window_integration() {
    let test_window = open_window("Test Window", 800, 600);
    clear_window(test_window, color_white());
    fill_rectangle_on_window(test_window, color_black(), 100.0, 100.0, 50.0, 50.0);
    refresh_screen();
    assert_eq!(color_black(), get_pixel_from_window(test_window, 125, 125));
    assert_eq!(color_white(), get_pixel_from_window(test_window, 175, 175));
    close_window(test_window);
}
#[test]
fn test_fill_rectangle_on_window_with_options_integration() {
    let test_window = open_window("Test Window", 800, 600);
    clear_window(test_window, color_white());
    fill_rectangle_on_window_with_options(test_window, color_black(), 100.0, 100.0, 50.0, 50.0, option_defaults());
    refresh_screen();
    assert_eq!(color_black(), get_pixel_from_window(test_window, 125, 125));
    assert_eq!(color_white(), get_pixel_from_window(test_window, 175, 175));
    close_window(test_window);
}
#[test]
fn test_draw_text_font_as_string_integration() {
    let test_window = open_window("Test Window", 800, 600);
    clear_window(test_window, color_white());
    refresh_screen();
    load_font("hara", "hara.ttf");
    draw_text_font_as_string("Test Text", color_black(), "hara", 24, 100.0, 100.0);
    refresh_screen();
    assert_eq!(color_black(), get_pixel_from_window(test_window, 120, 110));
    assert_eq!(color_white(), get_pixel_from_window(test_window, 90, 90));
    close_window(test_window);
    free_all_fonts();
}
#[test]
fn test_draw_text_with_options_font_as_string_integration() {
    let test_window = open_window("Test Window", 800, 600);
    clear_window(test_window, color_white());
    load_font("hara", "hara.ttf");
    draw_text_with_options_font_as_string("Test Text", color_black(), "hara", 24, 100.0, 100.0, option_defaults());
    refresh_screen();
    assert_eq!(color_black(), get_pixel_from_window(test_window, 120, 110));
    assert_eq!(color_white(), get_pixel_from_window(test_window, 90, 90));
    close_window(test_window);
    free_all_fonts();
}
#[test]
fn test_draw_text_no_font_no_size_integration() {
    let test_window = open_window("Test Window", 800, 600);
    clear_window(test_window, color_white());
    draw_text_no_font_no_size("Test Text", color_black(), 100.0, 100.0);
    refresh_screen();
    assert_eq!(color_black(), get_pixel_from_window(test_window, 105, 100));
    assert_eq!(color_white(), get_pixel_from_window(test_window, 90, 90));
    close_window(test_window);
}
#[test]
fn test_draw_text_no_font_no_size_with_options_integration() {
    let test_window = open_window("Test Window", 800, 600);
    clear_window(test_window, color_white());
    draw_text_no_font_no_size_with_options("Test Text", color_black(), 100.0, 100.0, option_defaults());
    refresh_screen();
    assert_eq!(color_black(), get_pixel_from_window(test_window, 105, 100));
    assert_eq!(color_white(), get_pixel_from_window(test_window, 90, 90));
    close_window(test_window);
}
#[test]
fn test_draw_text_integration() {
    let test_window = open_window("Test Window", 800, 600);
    clear_window(test_window, color_white());
    load_font("hara", "hara.ttf");
    draw_text("Test Text", color_black(), font_named("hara"), 24, 100.0, 100.0);
    refresh_screen();
    assert_eq!(color_black(), get_pixel_from_window(test_window, 120, 110));
    assert_eq!(color_white(), get_pixel_from_window(test_window, 90, 90));
    close_window(test_window);
    free_all_fonts();
}
#[test]
fn test_draw_text_with_options_integration() {
    let test_window = open_window("Test Window", 800, 600);
    clear_window(test_window, color_white());
    load_font("hara", "hara.ttf");
    draw_text_with_options("Test Text", color_black(), font_named("hara"), 24, 100.0, 100.0, option_defaults());
    refresh_screen();
    assert_eq!(color_black(), get_pixel_from_window(test_window, 120, 110));
    assert_eq!(color_white(), get_pixel_from_window(test_window, 90, 90));
    close_window(test_window);
    free_all_fonts();
}
#[test]
fn test_draw_text_on_bitmap_font_as_string_integration() {
    let test_bitmap = create_bitmap("test_bitmap", 200, 200);
    clear_bitmap(test_bitmap, color_white());
    load_font("hara", "hara.ttf");
    draw_text_on_bitmap_font_as_string(test_bitmap, "Test Text", color_black(), "hara", 24, 100.0, 100.0);
    assert_eq!(color_black(), get_pixel(test_bitmap, 120, 110));
    assert_eq!(color_white(), get_pixel(test_bitmap, 90, 90));
    free_bitmap(test_bitmap);
    free_all_fonts();
}
#[test]
fn test_draw_text_on_bitmap_with_options_font_as_string_integration() {
    let test_bitmap = create_bitmap("test_bitmap", 200, 200);
    clear_bitmap(test_bitmap, color_white());
    load_font("hara", "hara.ttf");
    draw_text_on_bitmap_with_options_font_as_string(test_bitmap, "Test Text", color_black(), "hara", 24, 100.0, 100.0, option_defaults());
    assert_eq!(color_black(), get_pixel(test_bitmap, 120, 110));
    assert_eq!(color_white(), get_pixel(test_bitmap, 90, 90));
    free_bitmap(test_bitmap);
    free_all_fonts();
}
#[test]
fn test_draw_text_on_bitmap_no_font_no_size_integration() {
    let test_bitmap = create_bitmap("test_bitmap", 200, 200);
    clear_bitmap(test_bitmap, color_white());
    draw_text_on_bitmap_no_font_no_size(test_bitmap, "Test Text", color_black(), 100.0, 100.0);
    assert_eq!(color_black(), get_pixel(test_bitmap, 105, 100));
    assert_eq!(color_white(), get_pixel(test_bitmap, 90, 90));
    free_bitmap(test_bitmap);
}
#[test]
fn test_draw_text_on_bitmap_no_font_no_size_with_options_integration() {
    let test_bitmap = create_bitmap("test_bitmap", 200, 200);
    clear_bitmap(test_bitmap, color_white());
    draw_text_on_bitmap_no_font_no_size_with_options(test_bitmap, "Test Text", color_black(), 100.0, 100.0, option_defaults());
    assert_eq!(color_black(), get_pixel(test_bitmap, 105, 100));
    assert_eq!(color_white(), get_pixel(test_bitmap, 90, 90));
    free_bitmap(test_bitmap);
}
#[test]
fn test_draw_text_on_bitmap_integration() {
    let test_bitmap = create_bitmap("test_bitmap", 200, 200);
    clear_bitmap(test_bitmap, color_white());
    load_font("hara", "hara.ttf");
    draw_text_on_bitmap(test_bitmap, "Test Text", color_black(), font_named("hara"), 24, 100.0, 100.0);
    assert_eq!(color_black(), get_pixel(test_bitmap, 120, 110));
    assert_eq!(color_white(), get_pixel(test_bitmap, 90, 90));
    free_bitmap(test_bitmap);
    free_all_fonts();
}
#[test]
fn test_draw_text_on_bitmap_with_options_integration() {
    let test_bitmap = create_bitmap("test_bitmap", 200, 200);
    clear_bitmap(test_bitmap, color_white());
    load_font("hara", "hara.ttf");
    draw_text_on_bitmap_with_options(test_bitmap, "Test Text", color_black(), font_named("hara"), 24, 100.0, 100.0, option_defaults());
    assert_eq!(color_black(), get_pixel(test_bitmap, 120, 110));
    assert_eq!(color_white(), get_pixel(test_bitmap, 90, 90));
    free_bitmap(test_bitmap);
    free_all_fonts();
}
#[test]
fn test_draw_text_on_window_font_as_string_integration() {
    let test_window = open_window("Test Window", 800, 600);
    clear_window(test_window, color_white());
    load_font("hara", "hara.ttf");
    draw_text_on_window_font_as_string(test_window, "Test Text", color_black(), "hara", 24, 100.0, 100.0);
    refresh_screen();
    assert_eq!(color_black(), get_pixel_from_window(test_window, 120, 110));
    assert_eq!(color_white(), get_pixel_from_window(test_window, 90, 90));
    close_window(test_window);
    free_all_fonts();
}
#[test]
fn test_draw_text_on_window_with_options_font_as_string_integration() {
    let test_window = open_window("Test Window", 800, 600);
    clear_window(test_window, color_white());
    load_font("hara", "hara.ttf");
    draw_text_on_window_with_options_font_as_string(test_window, "Test Text", color_black(), "hara", 24, 100.0, 100.0, option_defaults());
    refresh_screen();
    assert_eq!(color_black(), get_pixel_from_window(test_window, 120, 110));
    assert_eq!(color_white(), get_pixel_from_window(test_window, 90, 90));
    close_window(test_window);
    free_all_fonts();
}
#[test]
fn test_draw_text_on_window_no_font_no_size_integration() {
    let test_window = open_window("Test Window", 800, 600);
    clear_window(test_window, color_white());
    draw_text_on_window_no_font_no_size(test_window, "Test Text", color_black(), 100.0, 100.0);
    refresh_screen();
    assert_eq!(color_black(), get_pixel_from_window(test_window, 105, 100));
    assert_eq!(color_white(), get_pixel_from_window(test_window, 90, 90));
    close_window(test_window);
}
#[test]
fn test_draw_text_on_window_no_font_no_size_with_options_integration() {
    let test_window = open_window("Test Window", 800, 600);
    clear_window(test_window, color_white());
    draw_text_on_window_no_font_no_size_with_options(test_window, "Test Text", color_black(), 100.0, 100.0, option_defaults());
    refresh_screen();
    assert_eq!(color_black(), get_pixel_from_window(test_window, 105, 100));
    assert_eq!(color_white(), get_pixel_from_window(test_window, 90, 90));
    close_window(test_window);
}
#[test]
fn test_draw_text_on_window_integration() {
    let test_window = open_window("Test Window", 800, 600);
    clear_window(test_window, color_white());
    load_font("hara", "hara.ttf");
    let test_font = font_named("hara");
    font_load_size(test_font, 24);
    draw_text_on_window(test_window, "Test Text", color_black(), test_font, 24, 100.0, 100.0);
    refresh_screen();
    assert_eq!(color_black(), get_pixel_from_window(test_window, 120, 110));
    assert_eq!(color_white(), get_pixel_from_window(test_window, 90, 90));
    close_window(test_window);
    free_all_fonts();
}
#[test]
fn test_draw_text_on_window_with_options_integration() {
    let test_window = open_window("Test Window", 800, 600);
    clear_window(test_window, color_white());
    let test_font = load_font("test_font", "hara.ttf");
    draw_text_on_window_with_options(test_window, "Test Text", color_black(), test_font, 24, 100.0, 100.0, option_defaults());
    refresh_screen();
    assert_eq!(color_black(), get_pixel_from_window(test_window, 120, 110));
    assert_eq!(color_white(), get_pixel_from_window(test_window, 90, 90));
    close_window(test_window);
    free_font(test_font);
}
#[test]
fn test_font_has_size_name_as_string_integration() {
    load_font("hara", "hara.ttf");
    font_load_size("hara", 12);
    assert!(font_has_size_name_as_string("hara", 12));
    assert!(!font_has_size_name_as_string("nonexistent_font", 12));
    free_all_fonts();
}
#[test]
fn test_font_has_size_integration() {
    let test_font = load_font("test_font", "hara.ttf");
    font_load_size(test_font, 12);
    assert!(font_has_size(test_font, 12));
    assert!(!font_has_size(test_font, 999));
    free_font(test_font);
}
#[test]
fn test_font_load_size_name_as_string_integration() {
    load_font("test_font", "hara.ttf");
    font_load_size_name_as_string("test_font", 12);
    assert!(font_has_size("test_font", 12));
    free_all_fonts();
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
    let test_window = open_window("Test Window", 800, 600);
    clear_window(test_window, color_white());
    load_font("hara", "hara.ttf");
    let test_font = font_named("hara");
    draw_text("Test Text", color_black(), test_font, 24, 100.0, 100.0);
    refresh_screen();
    assert!(test_font.is_some());
    assert_eq!(color_black(), get_pixel_from_window(test_window, 120, 110));
    assert_eq!(color_white(), get_pixel_from_window(test_window, 90, 90));
    close_window(test_window);
    free_all_fonts();
}
#[test]
fn test_free_all_fonts_integration() {
    let test_font = load_font("test_font", "hara.ttf");
    assert!(has_font("test_font"));
    free_all_fonts();
    assert!(!has_font("test_font"));
}
#[test]
fn test_free_font_integration() {
    let test_font = load_font("test_font", "hara.ttf");
    assert!(has_font(test_font));
    free_font(test_font);
    assert!(!has_font(test_font));
}
#[test]
fn test_get_font_style_name_as_string_integration() {
    let test_font = load_font("test_font", "hara.ttf");
    let style = get_font_style_name_as_string("test_font");
    assert_eq!(FontStyle::BoldFont, style);
    free_font(test_font);
}
#[test]
fn test_get_font_style_integration() {
    let test_font = load_font("test_font", "hara.ttf");
    let style = get_font_style(test_font);
    assert_eq!(FontStyle::BoldFont, style);
    free_font(test_font);
}
#[test]
fn test_get_system_font_integration() {
    let system_font = get_system_font();
    assert!(system_font.is_some());
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
    assert!(has_font_name_as_string("hara"));
    assert!(!has_font_name_as_string("nonexistent_font"));
}
#[test]
fn test_load_font_integration() {
    let test_window = open_window("Test Window", 800, 600);
    clear_window(test_window, color_white());
    let test_font = load_font("test_font", "hara.ttf");
    draw_text("Test Text", color_black(), test_font, 24, 100.0, 100.0, option_defaults());
    refresh_screen();
    assert!(has_font("test_font"));
    assert_eq!(color_black(), get_pixel_from_window(test_window, 105, 105));
    close_window(test_window);
    free_font(test_font);
}
#[test]
fn test_set_font_style_name_as_string_integration() {
    let test_font = load_font("test_font", "hara.ttf");
    set_font_style_name_as_string("test_font", FontStyle::BoldFont);
    assert_eq!(FontStyle::BoldFont, get_font_style("test_font"));
    free_font(test_font);
}
#[test]
fn test_set_font_style_integration() {
    let test_font = load_font("test_font", "hara.ttf");
    set_font_style(test_font, FontStyle::BoldFont);
    assert_eq!(FontStyle::BoldFont, get_font_style(test_font));
    free_font(test_font);
}
#[test]
fn test_text_height_font_named_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let height = text_height_font_named("Test Text", "hara", 24);
    assert!(height > 0);
    assert!(height >= 24);
    close_window(test_window);
}
#[test]
fn test_text_height_integration() {
    let test_font = load_font("test_font", "hara.ttf");
    font_load_size(test_font, 24);
    let height = text_height("Test Text", test_font, 24);
    assert!(height > 0);
    assert!(height >= 24);
    free_font(test_font);
}
#[test]
fn test_text_width_font_named_integration() {
    let test_font = load_font("hara", "hara.ttf");
    font_load_size(test_font, 12);
    let width = text_width_font_named("Test Text", "hara", 24);
    assert!(width > 0);
    assert!(width >= text_height("Test Text", "hara", 24));
    free_font(test_font);
}
#[test]
fn test_text_width_integration() {
    let test_font = load_font("test_font", "hara.ttf");
    font_load_size(test_font, 12);
    let width = text_width("Test Text", test_font, 24);
    assert!(width > 0);
    assert!(width >= text_height("Text Height", test_font, 24));
    free_font(test_font);
}
#[test]
fn test_draw_triangle_record_integration() {
    let test_window = open_window("Test Window", 800, 600);
    clear_window(test_window, color_white());
    let triangle = triangle_from(point_at(100.0, 100.0), point_at(200.0, 200.0), point_at(150.0, 300.0));
    draw_triangle_record(color_black(), triangle);
    refresh_screen();
    assert_eq!(color_black(), get_pixel_from_window(test_window, 100, 100));
    assert_eq!(color_white(), get_pixel_from_window(test_window, 150, 200));
    close_window(test_window);
}
#[test]
fn test_draw_triangle_record_with_options_integration() {
    let test_window = open_window("Test Window", 800, 600);
    clear_window(test_window, color_white());
    let triangle = triangle_from(point_at(100.0, 100.0), point_at(200.0, 200.0), point_at(150.0, 300.0));
    draw_triangle_record_with_options(color_black(), triangle, option_defaults());
    refresh_screen();
    assert_eq!(color_black(), get_pixel_from_window(test_window, 100, 100));
    assert_eq!(color_white(), get_pixel_from_window(test_window, 150, 200));
    close_window(test_window);
}
#[test]
fn test_draw_triangle_integration() {
    let test_window = open_window("Test Window", 800, 600);
    clear_window(test_window, color_white());
    draw_triangle(color_black(), 100.0, 100.0, 200.0, 300.0, 300.0, 100.0);
    refresh_screen();
    assert_eq!(color_black(), get_pixel_from_window(test_window, 100, 100));
    assert_eq!(color_white(), get_pixel_from_window(test_window, 200, 150));
    close_window(test_window);
}
#[test]
fn test_draw_triangle_with_options_integration() {
    let test_window = open_window("Test Window", 800, 600);
    clear_window(test_window, color_white());
    draw_triangle_with_options(color_black(), 100.0, 100.0, 200.0, 200.0, 150.0, 300.0, option_defaults());
    refresh_screen();
    assert_eq!(color_black(), get_pixel_from_window(test_window, 100, 100));
    assert_eq!(color_white(), get_pixel_from_window(test_window, 150, 200));
    close_window(test_window);
}
#[test]
fn test_draw_triangle_on_bitmap_record_integration() {
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    clear_bitmap(test_bitmap, color_white());
    let triangle = triangle_from(point_at(25.0, 25.0), point_at(75.0, 25.0), point_at(50.0, 75.0));
    draw_triangle_on_bitmap_record(test_bitmap, color_black(), triangle);
    assert_eq!(color_black(), get_pixel(test_bitmap, 25, 25));
    assert_eq!(color_white(), get_pixel(test_bitmap, 50, 50));
    free_bitmap(test_bitmap);
}
#[test]
fn test_draw_triangle_on_bitmap_record_with_options_integration() {
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    clear_bitmap(test_bitmap, color_white());
    let triangle = triangle_from(point_at(25.0, 25.0), point_at(75.0, 25.0), point_at(50.0, 75.0));
    draw_triangle_on_bitmap_record_with_options(test_bitmap, color_black(), triangle, option_defaults());
    assert_eq!(color_black(), get_pixel(test_bitmap, 25, 25));
    assert_eq!(color_white(), get_pixel(test_bitmap, 50, 50));
    free_bitmap(test_bitmap);
}
#[test]
fn test_draw_triangle_on_bitmap_integration() {
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    clear_bitmap(test_bitmap, color_white());
    draw_triangle_on_bitmap(test_bitmap, color_black(), 25.0, 25.0, 75.0, 25.0, 50.0, 75.0);
    assert_eq!(color_black(), get_pixel(test_bitmap, 25, 25));
    assert_eq!(color_white(), get_pixel(test_bitmap, 50, 50));
    free_bitmap(test_bitmap);
}
#[test]
fn test_draw_triangle_on_bitmap_with_options_integration() {
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    clear_bitmap(test_bitmap, color_white());
    draw_triangle_on_bitmap_with_options(test_bitmap, color_black(), 25.0, 25.0, 75.0, 25.0, 50.0, 75.0, option_defaults());
    assert_eq!(color_black(), get_pixel(test_bitmap, 25, 25));
    assert_eq!(color_white(), get_pixel(test_bitmap, 50, 50));
    free_bitmap(test_bitmap);
}
#[test]
fn test_draw_triangle_on_window_record_integration() {
    let test_window = open_window("Test Window", 800, 600);
    clear_window(test_window, color_white());
    let triangle = triangle_from(point_at(100.0, 100.0), point_at(200.0, 200.0), point_at(150.0, 300.0));
    draw_triangle_on_window_record(test_window, color_black(), triangle);
    refresh_screen();
    assert_eq!(color_black(), get_pixel_from_window(test_window, 100, 100));
    assert_eq!(color_white(), get_pixel_from_window(test_window, 50, 50));
    close_window(test_window);
}
#[test]
fn test_draw_triangle_on_window_record_with_options_integration() {
    let test_window = open_window("Test Window", 800, 600);
    clear_window(test_window, color_white());
    let triangle = triangle_from(point_at(100.0, 100.0), point_at(200.0, 200.0), point_at(150.0, 250.0));
    draw_triangle_on_window_record_with_options(test_window, color_black(), triangle, option_defaults());
    refresh_screen();
    assert_eq!(color_black(), get_pixel_from_window(test_window, 150, 150));
    assert_eq!(color_white(), get_pixel_from_window(test_window, 50, 50));
    close_window(test_window);
}
#[test]
fn test_draw_triangle_on_window_integration() {
    let test_window = open_window("Test Window", 800, 600);
    clear_window(test_window, color_white());
    draw_triangle_on_window(test_window, color_black(), 100.0, 100.0, 200.0, 300.0, 300.0, 100.0);
    refresh_screen();
    assert_eq!(color_black(), get_pixel_from_window(test_window, 100, 100));
    assert_eq!(color_white(), get_pixel_from_window(test_window, 50, 50));
    close_window(test_window);
}
#[test]
fn test_draw_triangle_on_window_with_options_integration() {
    let test_window = open_window("Test Window", 800, 600);
    clear_window(test_window, color_white());
    draw_triangle_on_window_with_options(test_window, color_black(), 100.0, 100.0, 200.0, 200.0, 150.0, 300.0, option_defaults());
    refresh_screen();
    assert_eq!(color_black(), get_pixel_from_window(test_window, 100, 100));
    assert_eq!(color_white(), get_pixel_from_window(test_window, 50, 50));
    close_window(test_window);
}
#[test]
fn test_fill_triangle_record_integration() {
    let test_window = open_window("Test Window", 800, 600);
    clear_window(test_window, color_white());
    let triangle = triangle_from(point_at(100.0, 100.0), point_at(200.0, 300.0), point_at(300.0, 100.0));
    fill_triangle_record(color_black(), triangle);
    refresh_screen();
    assert_eq!(color_black(), get_pixel_from_window(test_window, 200, 150));
    assert_eq!(color_white(), get_pixel_from_window(test_window, 50, 50));
    close_window(test_window);
}
#[test]
fn test_fill_triangle_record_with_options_integration() {
    let test_window = open_window("Test Window", 800, 600);
    clear_window(test_window, color_white());
    let triangle = triangle_from(point_at(100.0, 100.0), point_at(200.0, 300.0), point_at(300.0, 100.0));
    fill_triangle_record_with_options(color_black(), triangle, option_defaults());
    refresh_screen();
    assert_eq!(color_black(), get_pixel_from_window(test_window, 200, 150));
    assert_eq!(color_white(), get_pixel_from_window(test_window, 50, 50));
    close_window(test_window);
}
#[test]
fn test_fill_triangle_integration() {
    let test_window = open_window("Test Window", 800, 600);
    clear_window(test_window, color_white());
    fill_triangle(color_black(), 100.0, 100.0, 200.0, 300.0, 300.0, 100.0);
    refresh_screen();
    assert_eq!(color_black(), get_pixel_from_window(test_window, 200, 150));
    assert_eq!(color_white(), get_pixel_from_window(test_window, 50, 50));
    close_window(test_window);
}
#[test]
fn test_fill_triangle_with_options_integration() {
    let test_window = open_window("Test Window", 800, 600);
    clear_window(test_window, color_white());
    fill_triangle_with_options(color_red(), 100.0, 100.0, 200.0, 300.0, 300.0, 100.0, option_defaults());
    refresh_screen();
    assert_eq!(color_red(), get_pixel_from_window(test_window, 150, 150));
    assert_eq!(color_white(), get_pixel_from_window(test_window, 350, 150));
    close_window(test_window);
}
#[test]
fn test_fill_triangle_on_bitmap_record_integration() {
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    clear_bitmap(test_bitmap, color_white());
    let triangle = triangle_from(point_at(25.0, 25.0), point_at(75.0, 25.0), point_at(50.0, 75.0));
    fill_triangle_on_bitmap_record(test_bitmap, color_black(), triangle);
    assert_eq!(color_black(), get_pixel(test_bitmap, 50, 50));
    assert_eq!(color_white(), get_pixel(test_bitmap, 0, 0));
    free_bitmap(test_bitmap);
}
#[test]
fn test_fill_triangle_on_bitmap_record_with_options_integration() {
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    clear_bitmap(test_bitmap, color_white());
    let triangle = triangle_from(point_at(25.0, 25.0), point_at(75.0, 25.0), point_at(50.0, 75.0));
    fill_triangle_on_bitmap_record_with_options(test_bitmap, color_black(), triangle, option_defaults());
    assert_eq!(color_black(), get_pixel(test_bitmap, 50, 50));
    assert_eq!(color_white(), get_pixel(test_bitmap, 10, 10));
    free_bitmap(test_bitmap);
}
#[test]
fn test_fill_triangle_on_bitmap_integration() {
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    clear_bitmap(test_bitmap, color_white());
    fill_triangle_on_bitmap(test_bitmap, color_black(), 25.0, 25.0, 75.0, 25.0, 50.0, 75.0);
    assert_eq!(color_black(), get_pixel(test_bitmap, 50, 50));
    assert_eq!(color_white(), get_pixel(test_bitmap, 0, 0));
    free_bitmap(test_bitmap);
}
#[test]
fn test_fill_triangle_on_bitmap_with_options_integration() {
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    clear_bitmap(test_bitmap, color_white());
    fill_triangle_on_bitmap_with_options(test_bitmap, color_black(), 25.0, 25.0, 75.0, 25.0, 50.0, 75.0, option_defaults());
    assert_eq!(color_black(), get_pixel(test_bitmap, 50, 50));
    assert_eq!(color_white(), get_pixel(test_bitmap, 0, 0));
    free_bitmap(test_bitmap);
}
#[test]
fn test_fill_triangle_on_window_record_integration() {
    let test_window = open_window("Test Window", 800, 600);
    clear_window(test_window, color_white());
    let triangle = triangle_from(point_at(100.0, 100.0), point_at(200.0, 300.0), point_at(300.0, 100.0));
    fill_triangle_on_window_record(test_window, color_black(), triangle);
    refresh_screen();
    assert_eq!(color_black(), get_pixel_from_window(test_window, 200, 200));
    assert_eq!(color_white(), get_pixel_from_window(test_window, 50, 50));
    close_window(test_window);
}
#[test]
fn test_fill_triangle_on_window_record_with_options_integration() {
    let test_window = open_window("Test Window", 800, 600);
    clear_window(test_window, color_white());
    let triangle = triangle_from(point_at(100.0, 100.0), point_at(200.0, 300.0), point_at(300.0, 100.0));
    fill_triangle_on_window_record_with_options(test_window, color_black(), triangle, option_defaults());
    refresh_screen();
    assert_eq!(color_black(), get_pixel_from_window(test_window, 200, 200));
    assert_eq!(color_white(), get_pixel_from_window(test_window, 50, 50));
    close_window(test_window);
}
#[test]
fn test_fill_triangle_on_window_integration() {
    let test_window = open_window("Test Window", 800, 600);
    clear_window(test_window, color_white());
    fill_triangle_on_window(test_window, color_black(), 100.0, 100.0, 200.0, 300.0, 300.0, 100.0);
    refresh_screen();
    assert_eq!(color_black(), get_pixel_from_window(test_window, 200, 200));
    assert_eq!(color_white(), get_pixel_from_window(test_window, 50, 50));
    close_window(test_window);
}
#[test]
fn test_fill_triangle_on_window_with_options_integration() {
    let test_window = open_window("Test Window", 800, 600);
    clear_window(test_window, color_white());
    fill_triangle_on_window_with_options(test_window, color_black(), 100.0, 100.0, 200.0, 300.0, 300.0, 100.0, option_defaults());
    refresh_screen();
    assert_eq!(color_black(), get_pixel_from_window(test_window, 150, 150));
    assert_eq!(color_white(), get_pixel_from_window(test_window, 350, 150));
    close_window(test_window);
}
}
