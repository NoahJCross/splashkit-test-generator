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
fn test_clear_window_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_color = color_black();
    clear_window(test_window, test_color);
    refresh_window(test_window);
    assert_eq!(color_black(), get_pixel(point_at(window_width(test_window), window_height(test_window))));
    close_window(test_window);
}
#[test]
fn test_close_all_windows_integration() {
    let test_window_1 = open_window("Test Window 1", 800, 600);
    let test_window_2 = open_window("Test Window 2", 800, 600);
    close_all_windows();
    assert!(!has_window("Test Window 1"));
    assert!(!has_window("Test Window 2"));
}
#[test]
fn test_close_current_window_integration() {
    let test_window = open_window("Test Window", 800, 600);
    set_current_window(test_window);
    close_current_window();
    assert!(!has_window("Test Window"));
}
#[test]
fn test_close_window_named_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let window_exists = has_window("Test Window");
    assert!(window_exists);
    close_window_named("Test Window");
    let window_exists = has_window("Test Window");
    assert!(!window_exists);
}
#[test]
fn test_close_window_integration() {
    let test_window = open_window("Test Window", 800, 600);
    close_window(test_window);
    assert!(!has_window("Test Window"));
}
#[test]
fn test_current_window_integration() {
    let test_window = open_window("Test Window", 800, 600);
    set_current_window(test_window);
    assert_eq!(test_window, current_window());
    close_window(test_window);
}
#[test]
fn test_current_window_has_border_integration() {
    let test_window = open_window("Test Window", 800, 600);
    assert!(current_window_has_border());
    current_window_toggle_border();
    assert!(!current_window_has_border());
    close_window(test_window);
}
#[test]
fn test_current_window_height_integration() {
    let test_window = open_window("Test Window", 800, 600);
    set_current_window(test_window);
    assert_eq!(600, current_window_height());
    close_window(test_window);
}
#[test]
fn test_current_window_is_fullscreen_integration() {
    let test_window = open_window("Test Window", 800, 600);
    assert!(!current_window_is_fullscreen());
    current_window_toggle_fullscreen();
    assert!(current_window_is_fullscreen());
    current_window_toggle_fullscreen();
    assert!(!current_window_is_fullscreen());
    close_window(test_window);
}
#[test]
fn test_current_window_position_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_position = current_window_position();
    assert!(test_position.is_some());
    close_window(test_window);
}
#[test]
fn test_current_window_toggle_border_integration() {
    let test_window = open_window("Test Window", 800, 600);
    current_window_toggle_border();
    assert!(!current_window_has_border());
    current_window_toggle_border();
    assert!(current_window_has_border());
    close_window(test_window);
}
#[test]
fn test_current_window_toggle_fullscreen_integration() {
    let test_window = open_window("Test Window", 800, 600);
    current_window_toggle_fullscreen();
    assert!(current_window_is_fullscreen());
    current_window_toggle_fullscreen();
    assert!(!current_window_is_fullscreen());
    close_window(test_window);
}
#[test]
fn test_current_window_width_integration() {
    let test_window = open_window("Test Window", 800, 600);
    set_current_window(test_window);
    assert_eq!(800, current_window_width());
    close_window(test_window);
}
#[test]
fn test_current_window_x_integration() {
    let test_window = open_window("Test Window", 800, 600);
    move_window_to(test_window, 100, 200);
    set_current_window(test_window);
    assert_eq!(100, current_window_x());
    close_window(test_window);
}
#[test]
fn test_current_window_y_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_y = current_window_y();
    assert!(test_y > -1);
    close_window(test_window);
}
#[test]
fn test_has_window_integration() {
    let test_window = open_window("Test Window", 800, 600);
    assert!(has_window("Test Window"));
    close_window(test_window);
    assert!(!has_window("Test Window"));
}
#[test]
fn test_is_current_window_integration() {
    let test_window_1 = open_window("Test Window 1", 800, 600);
    let test_window_2 = open_window("Test Window 2", 800, 600);
    set_current_window(test_window_1);
    assert!(is_current_window(test_window_1));
    assert!(!is_current_window(test_window_2));
    set_current_window(test_window_2);
    assert!(is_current_window(test_window_2));
    assert!(!is_current_window(test_window_1));
    close_window(test_window_1);
    close_window(test_window_2);
}
#[test]
fn test_move_current_window_to_integration() {
    let test_window = open_window("Test Window", 800, 600);
    move_current_window_to(100, 100);
    assert_eq!(100, current_window_x());
    assert_eq!(100, current_window_y());
    close_window(test_window);
}
#[test]
fn test_move_window_to_named_integration() {
    let test_window = open_window("Test Window", 800, 600);
    move_window_to_named("Test Window", 100, 100);
    process_events();
    assert_eq!(100, window_x_named("Test Window"));
    assert_eq!(100, window_y_named("Test Window"));
    close_window_named("Test Window");
}
#[test]
fn test_move_window_to_integration() {
    let test_window = open_window("Test Window", 800, 600);
    move_window_to(test_window, 100, 100);
    assert_eq!(100, window_x(test_window));
    assert_eq!(100, window_y(test_window));
    close_window(test_window);
}
#[test]
fn test_open_window_integration() {
    let test_window = open_window("Test Window", 800, 600);
    assert!(test_window.is_some());
    close_window(test_window);
}
#[test]
fn test_refresh_window_integration() {
    let test_window = open_window("Test Window", 800, 600);
    draw_circle(color_black(), circle_at(400.0, 300.0, 50.0));
    refresh_window(test_window);
    assert!(point_in_circle(point_at(400.0, 300.0), circle_at(400.0, 300.0, 50.0)));
    close_window(test_window);
}
#[test]
fn test_refresh_window_with_target_fps_integration() {
    let test_window = open_window("Test Window", 800, 600);
    refresh_window_with_target_fps(test_window, 60);
    close_window(test_window);
}
#[test]
fn test_resize_current_window_integration() {
    let test_window = open_window("Test Window", 800, 600);
    set_current_window(test_window);
    resize_current_window(1024, 768);
    process_events();
    assert_eq!(1024, current_window_width());
    assert_eq!(768, current_window_height());
    close_window(test_window);
}
#[test]
fn test_resize_window_integration() {
    let test_window = open_window("Test Window", 800, 600);
    resize_window(test_window, 1024, 768);
    assert_eq!(1024, window_width(test_window));
    assert_eq!(768, window_height(test_window));
    close_window(test_window);
}
#[test]
fn test_set_current_window_named_integration() {
    let test_window_1 = open_window("Test Window 1", 800, 600);
    let test_window_2 = open_window("Test Window 2", 800, 600);
    set_current_window_named("Test Window 2");
    assert!(is_current_window(test_window_2));
    close_window(test_window_1);
    close_window(test_window_2);
}
#[test]
fn test_set_current_window_integration() {
    let test_window_1 = open_window("Test Window 1", 800, 600);
    let test_window_2 = open_window("Test Window 2", 800, 600);
    set_current_window(test_window_2);
    assert!(is_current_window(test_window_2));
    close_window(test_window_1);
    close_window(test_window_2);
}
#[test]
fn test_window_caption_integration() {
    let test_window = open_window("Test Window", 800, 600);
    assert_eq!("Test Window", window_caption(test_window));
    close_window(test_window);
}
#[test]
fn test_window_close_requested_named_integration() {
    let test_window = open_window("Test Window", 800, 600);
    process_events();
    assert!(!window_close_requested_named("Test Window"));
    simulate_key_press(KeyCode::Escape);
    process_events();
    assert!(window_close_requested_named("Test Window"));
    close_window(test_window);
}
#[test]
fn test_window_close_requested_integration() {
    let test_window = open_window("Test Window", 800, 600);
    process_events();
    assert!(!window_close_requested(test_window));
    simulate_key_press(KeyCode::Escape);
    process_events();
    assert!(window_close_requested(test_window));
    close_window(test_window);
}
#[test]
fn test_window_has_border_named_integration() {
    let test_window = open_window("Test Window", 800, 600);
    assert!(window_has_border_named("Test Window"));
    window_toggle_border_named("Test Window");
    assert!(!window_has_border_named("Test Window"));
    close_window_named("Test Window");
}
#[test]
fn test_window_has_border_integration() {
    let test_window = open_window("Test Window", 800, 600);
    assert!(window_has_border(test_window));
    window_toggle_border(test_window);
    assert!(!window_has_border(test_window));
    close_window(test_window);
}
#[test]
fn test_window_has_focus_integration() {
    let test_window = open_window("Test Window", 800, 600);
    process_events();
    assert!(window_has_focus(test_window));
    close_window(test_window);
}
#[test]
fn test_window_height_named_integration() {
    let test_window = open_window("Test Window", 800, 600);
    assert_eq!(600, window_height_named("Test Window"));
    close_window(test_window);
}
#[test]
fn test_window_height_integration() {
    let test_window = open_window("Test Window", 800, 600);
    assert_eq!(600, window_height(test_window));
    close_window(test_window);
}
#[test]
fn test_window_is_fullscreen_named_integration() {
    let test_window = open_window("Test Window", 800, 600);
    window_toggle_fullscreen(test_window);
    assert!(window_is_fullscreen_named("Test Window"));
    window_toggle_fullscreen(test_window);
    assert!(!window_is_fullscreen_named("Test Window"));
    close_window(test_window);
}
#[test]
fn test_window_is_fullscreen_integration() {
    let test_window = open_window("Test Window", 800, 600);
    assert!(!window_is_fullscreen(test_window));
    window_toggle_fullscreen(test_window);
    assert!(window_is_fullscreen(test_window));
    close_window(test_window);
}
#[test]
fn test_window_named_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let retrieved_window = window_named("Test Window");
    assert_eq!(retrieved_window, test_window);
    close_window(test_window);
}
#[test]
fn test_window_position_named_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_position = window_position_named("Test Window");
    assert!(test_position.is_some());
    close_window(test_window);
}
#[test]
fn test_window_position_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_position = window_position(test_window);
    assert!(test_position.is_some());
    close_window(test_window);
}
#[test]
fn test_window_set_icon_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_bitmap = create_bitmap("test_icon", 32, 32);
    window_set_icon(test_window, test_bitmap);
    close_window(test_window);
    free_bitmap(test_bitmap);
}
#[test]
fn test_window_toggle_border_named_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_has_border = window_has_border_named("Test Window");
    assert!(test_has_border);
    window_toggle_border_named("Test Window");
    let test_has_border = window_has_border_named("Test Window");
    assert!(!test_has_border);
    close_window_named("Test Window");
}
#[test]
fn test_window_toggle_border_integration() {
    let test_window = open_window("Test Window", 800, 600);
    assert!(window_has_border(test_window));
    window_toggle_border(test_window);
    assert!(!window_has_border(test_window));
    window_toggle_border(test_window);
    assert!(window_has_border(test_window));
    close_window(test_window);
}
#[test]
fn test_window_toggle_fullscreen_named_integration() {
    let test_window = open_window("Test Window", 800, 600);
    process_events();
    assert!(!window_is_fullscreen_named("Test Window"));
    window_toggle_fullscreen_named("Test Window");
    process_events();
    assert!(window_is_fullscreen_named("Test Window"));
    close_window_named("Test Window");
}
#[test]
fn test_window_toggle_fullscreen_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let initial_fullscreen_state = window_is_fullscreen(test_window);
    window_toggle_fullscreen(test_window);
    let new_fullscreen_state = window_is_fullscreen(test_window);
    assert_ne!(new_fullscreen_state, initial_fullscreen_state);
    close_window(test_window);
}
#[test]
fn test_window_width_named_integration() {
    let test_window = open_window("Test Window", 800, 600);
    assert_eq!(800, window_width_named("Test Window"));
    close_window(test_window);
}
#[test]
fn test_window_width_integration() {
    let test_window = open_window("Test Window", 800, 600);
    assert_eq!(800, window_width(test_window));
    close_window(test_window);
}
#[test]
fn test_window_with_focus_integration() {
    let test_window_1 = open_window("Test Window 1", 800, 600);
    let test_window_2 = open_window("Test Window 2", 800, 600);
    set_current_window(test_window_1);
    let focused_window = window_with_focus();
    assert_eq!(test_window_1, focused_window);
    set_current_window(test_window_2);
    let focused_window = window_with_focus();
    assert_eq!(test_window_2, focused_window);
    close_window(test_window_1);
    close_window(test_window_2);
}
#[test]
fn test_window_x_named_integration() {
    let test_window = open_window("Test Window", 800, 600);
    move_window_to_named("Test Window", 100, 200);
    assert_eq!(100, window_x_named("Test Window"));
    close_window_named("Test Window");
}
#[test]
fn test_window_x_integration() {
    let test_window = open_window("Test Window", 800, 600);
    assert!(window_x(test_window) > -1);
    close_window(test_window);
}
#[test]
fn test_window_y_named_integration() {
    let test_window = open_window("Test Window", 800, 600);
    move_window_to_named("Test Window", 100, 200);
    let test_window_y = window_y_named("Test Window");
    assert_eq!(200, test_window_y);
    close_window_named("Test Window");
}
#[test]
fn test_window_y_integration() {
    let test_window = open_window("Test Window", 800, 600);
    move_window_to(test_window, 100, 200);
    assert_eq!(200, window_y(test_window));
    close_window(test_window);
}
