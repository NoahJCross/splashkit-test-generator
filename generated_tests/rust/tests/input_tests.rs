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
fn test_process_events_integration() {
    simulate_key_press(KeyCode::A);
    process_events();
    assert!(key_typed(KeyCode::A));
    simulate_mouse_click(MouseButton::Left);
    process_events();
    assert!(mouse_clicked(MouseButton::Left));
}
#[test]
fn test_quit_requested_integration() {
    let test_window = open_window("Test Window", 800, 600);
    process_events();
    assert!(!quit_requested());
    simulate_key_press(KeyCode::Escape);
    process_events();
    assert!(quit_requested());
    close_window(test_window);
}
#[test]
fn test_reset_quit_integration() {
    let test_window = open_window("Test Window", 800, 600);
    process_events();
    assert!(quit_requested());
    reset_quit();
    process_events();
    assert!(!quit_requested());
    close_window(test_window);
}
#[test]
fn test_any_key_pressed_integration() {
    process_events();
    assert!(!any_key_pressed());
    simulate_key_press(KeyCode::A);
    process_events();
    assert!(any_key_pressed());
}
#[test]
fn test_deregister_callback_on_key_down_integration() {
    let test_window = open_window("Test Window", 800, 600);
    register_callback_on_key_down(_on_key_down());
    simulate_key_press(KeyCode::A);
    process_events();
    assert!(key_down(KeyCode::A));
    deregister_callback_on_key_down(_on_key_down());
    simulate_key_press(KeyCode::B);
    process_events();
    assert!(!key_down(KeyCode::B));
    close_window(test_window);
}
#[test]
fn test_deregister_callback_on_key_typed_integration() {
    register_callback_on_key_typed(_on_key_typed());
    simulate_key_press(KeyCode::A);
    process_events();
    assert!(key_typed(KeyCode::A));
    deregister_callback_on_key_typed(_on_key_typed());
    simulate_key_press(KeyCode::B);
    process_events();
    assert!(!key_typed(KeyCode::B));
}
#[test]
fn test_deregister_callback_on_key_up_integration() {
    let test_window = open_window("Test Window", 800, 600);
    register_callback_on_key_up(_on_key_up());
    simulate_key_press(KeyCode::A);
    process_events();
    assert!(key_up(KeyCode::A));
    deregister_callback_on_key_up(_on_key_up());
    simulate_key_press(KeyCode::B);
    process_events();
    assert!(!key_up(KeyCode::B));
    close_window(test_window);
}
#[test]
fn test_key_down_integration() {
    process_events();
    assert!(!key_down(KeyCode::A));
    simulate_key_press(KeyCode::A);
    process_events();
    assert!(key_down(KeyCode::A));
    simulate_key_release(KeyCode::A);
    process_events();
    assert!(!key_down(KeyCode::A));
}
#[test]
fn test_key_name_integration() {
    let test_key_name1 = key_name(KeyCode::A);
    assert_eq!("A", test_key_name1);
    let test_key_name2 = key_name(KeyCode::Enter);
    assert_eq!("Enter", test_key_name2);
}
#[test]
fn test_key_released_integration() {
    process_events();
    assert!(!key_released(KeyCode::A));
    simulate_key_press(KeyCode::A);
    process_events();
    simulate_key_release(KeyCode::A);
    process_events();
    assert!(key_released(KeyCode::A));
}
#[test]
fn test_key_typed_integration() {
    process_events();
    assert!(!key_typed(KeyCode::A));
    simulate_key_press(KeyCode::A);
    process_events();
    assert!(key_typed(KeyCode::A));
}
#[test]
fn test_key_up_integration() {
    process_events();
    assert!(key_up(KeyCode::A));
    simulate_key_press(KeyCode::A);
    process_events();
    assert!(!key_up(KeyCode::A));
    simulate_key_release(KeyCode::A);
    process_events();
    assert!(key_up(KeyCode::A));
}
#[test]
fn test_register_callback_on_key_down_integration() {
    register_callback_on_key_down(_on_key_down());
    process_events();
    simulate_key_press(KeyCode::A);
    process_events();
    assert!(key_down(KeyCode::A));
    deregister_callback_on_key_down(_on_key_down());
}
#[test]
fn test_register_callback_on_key_typed_integration() {
    register_callback_on_key_typed(_on_key_typed());
    process_events();
    simulate_key_press(KeyCode::A);
    process_events();
    assert!(key_typed(KeyCode::A));
    deregister_callback_on_key_typed(_on_key_typed());
}
#[test]
fn test_register_callback_on_key_up_integration() {
    register_callback_on_key_up(_on_key_up());
    process_events();
    simulate_key_press(KeyCode::A);
    simulate_key_release(KeyCode::A);
    process_events();
    assert_eq!("A", _key_up);
    deregister_callback_on_key_up(_on_key_up());
}
#[test]
fn test_hide_mouse_integration() {
    let test_window = open_window("Test Window", 800, 600);
    process_events();
    assert!(mouse_shown());
    hide_mouse();
    process_events();
    assert!(!mouse_shown());
    close_window(test_window);
}
#[test]
fn test_mouse_clicked_integration() {
    process_events();
    assert!(!mouse_clicked(MouseButton::Left));
    simulate_mouse_click(MouseButton::Left);
    process_events();
    assert!(mouse_clicked(MouseButton::Left));
}
#[test]
fn test_mouse_down_integration() {
    process_events();
    assert!(!mouse_down(MouseButton::Left));
    simulate_mouse_press(MouseButton::Left);
    process_events();
    assert!(mouse_down(MouseButton::Left));
    simulate_mouse_release(MouseButton::Left);
    process_events();
    assert!(!mouse_down(MouseButton::Left));
}
#[test]
fn test_mouse_movement_integration() {
    let test_window = open_window("Test Window", 800, 600);
    move_mouse(100.0, 100.0);
    process_events();
    let test_movement = mouse_movement();
    assert_eq!(100.0, test_movement.x);
    assert_eq!(100.0, test_movement.y);
    close_window(test_window);
}
#[test]
fn test_mouse_position_integration() {
    let test_window = open_window("Test Window", 800, 600);
    move_mouse(400.0, 300.0);
    process_events();
    let test_position = mouse_position();
    assert_eq!(400.0, test_position.x);
    assert_eq!(300.0, test_position.y);
    close_window(test_window);
}
#[test]
fn test_mouse_position_vector_integration() {
    let test_window = open_window("Test Window", 800, 600);
    move_mouse(400.0, 300.0);
    process_events();
    let test_mouse_position = mouse_position_vector();
    assert_eq!(400.0, test_mouse_position.x);
    assert_eq!(300.0, test_mouse_position.y);
    close_window(test_window);
}
#[test]
fn test_mouse_shown_integration() {
    let test_window = open_window("Test Window", 800, 600);
    show_mouse();
    process_events();
    assert!(mouse_shown());
    hide_mouse();
    process_events();
    assert!(!mouse_shown());
    close_window(test_window);
}
#[test]
fn test_mouse_up_integration() {
    process_events();
    assert!(mouse_up(MouseButton::Left));
    simulate_mouse_click(MouseButton::Left);
    process_events();
    assert!(!mouse_up(MouseButton::Left));
}
#[test]
fn test_mouse_wheel_scroll_integration() {
    let test_window = open_window("Test Window", 800, 600);
    process_events();
    assert_eq!(vector_from_angle(0.0, 0.0), mouse_wheel_scroll());
    simulate_mouse_wheel_scroll(10.0, 5.0);
    process_events();
    assert!(mouse_wheel_scroll());
    close_window(test_window);
}
#[test]
fn test_mouse_x_integration() {
    let test_window = open_window("Test Window", 800, 600);
    move_mouse(400.0, 300.0);
    process_events();
    assert!((399.0..=401.0).contains(&mouse_x()));
    close_window(test_window);
}
#[test]
fn test_mouse_y_integration() {
    let test_window = open_window("Test Window", 800, 600);
    move_mouse(400.0, 300.0);
    process_events();
    assert_eq!(300.0, mouse_y());
    close_window(test_window);
}
#[test]
fn test_move_mouse_integration() {
    let test_window = open_window("Test Window", 800, 600);
    process_events();
    move_mouse(400.0, 300.0);
    process_events();
    assert!((399.0..=401.0).contains(&mouse_x()));
    assert!((299.0..=301.0).contains(&mouse_y()));
    close_window(test_window);
}
#[test]
fn test_move_mouse_to_point_integration() {
    let test_window = open_window("Test Window", 800, 600);
    move_mouse_to_point(point_at(400.0, 300.0));
    process_events();
    assert_eq!(point_at(400.0, 300.0), mouse_position());
    close_window(test_window);
}
#[test]
fn test_show_mouse_integration() {
    let test_window = open_window("Test Window", 800, 600);
    hide_mouse();
    process_events();
    assert!(!mouse_shown());
    show_mouse();
    process_events();
    assert!(mouse_shown());
    close_window(test_window);
}
#[test]
fn test_show_mouse_with_boolean_integration() {
    let test_window = open_window("Test Window", 800, 600);
    show_mouse_with_boolean(true);
    process_events();
    assert!(mouse_shown());
    show_mouse_with_boolean(false);
    process_events();
    assert!(!mouse_shown());
    close_window(test_window);
}
#[test]
fn test_draw_collected_text_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_font = load_font("test_font", "path/to/font.ttf");
    start_reading_text(rectangle_from(100, 100, 200, 30));
    process_events();
    simulate_key_press(KeyCode::A);
    process_events();
    draw_collected_text(color_black(), test_font, 18, option_defaults());
    refresh_screen();
    assert_eq!(color_black(), get_pixel(test_window, 105, 115));
    end_reading_text();
    free_font(test_font);
    close_window(test_window);
}
#[test]
fn test_end_reading_text_integration() {
    let test_window = open_window("Test Window", 800, 600);
    start_reading_text(rectangle_from(100.0, 100.0, 200.0, 30.0));
    process_events();
    assert!(reading_text());
    end_reading_text();
    process_events();
    assert!(!reading_text());
    close_window(test_window);
}
#[test]
fn test_end_reading_text_in_window_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_rectangle = rectangle_from(100.0, 100.0, 200.0, 30.0);
    start_reading_text_in_window(test_window, test_rectangle);
    process_events();
    assert!(reading_text_in_window(test_window));
    end_reading_text_in_window(test_window);
    process_events();
    assert!(!reading_text_in_window(test_window));
    close_window(test_window);
}
#[test]
fn test_reading_text_integration() {
    let test_window = open_window("Test Window", 800, 600);
    start_reading_text(rectangle_from(100.0, 100.0, 200.0, 30.0));
    process_events();
    assert!(reading_text());
    end_reading_text();
    process_events();
    assert!(!reading_text());
    close_window(test_window);
}
#[test]
fn test_reading_text_in_window_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_rectangle = rectangle_from(100.0, 100.0, 200.0, 30.0);
    start_reading_text_in_window(test_window, test_rectangle);
    process_events();
    assert!(reading_text_in_window(test_window));
    end_reading_text_in_window(test_window);
    process_events();
    assert!(!reading_text_in_window(test_window));
    close_window(test_window);
}
#[test]
fn test_start_reading_text_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_rect = rectangle_from(100.0, 100.0, 200.0, 30.0);
    start_reading_text(test_rect);
    process_events();
    assert!(reading_text());
    end_reading_text();
    process_events();
    assert!(!reading_text());
    close_window(test_window);
}
#[test]
fn test_start_reading_text_with_initial_text_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_rect = rectangle_from(100.0, 100.0, 200.0, 30.0);
    start_reading_text_with_initial_text(test_rect, "Initial Text");
    process_events();
    assert!(reading_text());
    end_reading_text();
    close_window(test_window);
}
#[test]
fn test_start_reading_text_in_window_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_rect = rectangle_from(100.0, 100.0, 200.0, 30.0);
    start_reading_text_in_window(test_window, test_rect);
    process_events();
    assert!(reading_text_in_window(test_window));
    end_reading_text_in_window(test_window);
    close_window(test_window);
}
#[test]
fn test_start_reading_text_in_window_with_initial_text_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_rect = rectangle_from(100.0, 100.0, 200.0, 30.0);
    start_reading_text_in_window_with_initial_text(test_window, test_rect, "Initial Text");
    process_events();
    assert!(reading_text_in_window(test_window));
    end_reading_text_in_window(test_window);
    close_window(test_window);
}
#[test]
fn test_text_entry_cancelled_integration() {
    let test_window = open_window("Test Window", 800, 600);
    start_reading_text(rectangle_from(100.0, 100.0, 200.0, 30.0));
    process_events();
    assert!(!text_entry_cancelled());
    simulate_key_press(KeyCode::Escape);
    process_events();
    assert!(text_entry_cancelled());
    end_reading_text();
    close_window(test_window);
}
#[test]
fn test_text_entry_cancelled_in_window_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_rect = rectangle_from(100.0, 100.0, 200.0, 30.0);
    start_reading_text_in_window(test_window, test_rect);
    process_events();
    assert!(!text_entry_cancelled_in_window(test_window));
    simulate_key_press(KeyCode::Escape);
    process_events();
    assert!(text_entry_cancelled_in_window(test_window));
    close_window(test_window);
}
#[test]
fn test_text_input_integration() {
    let test_window = open_window("Test Window", 800, 600);
    start_reading_text(rectangle_from(100.0, 100.0, 200.0, 30.0));
    process_events();
    simulate_key_press(KeyCode::A);
    process_events();
    assert_eq!("A", text_input());
    end_reading_text();
    close_window(test_window);
}
#[test]
fn test_text_input_in_window_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_rectangle = rectangle_from(100.0, 100.0, 200.0, 30.0);
    start_reading_text_in_window(test_window, test_rectangle);
    process_events();
    simulate_key_press(KeyCode::A);
    process_events();
    assert_eq!("A", text_input_in_window(test_window));
    end_reading_text_in_window(test_window);
    close_window(test_window);
}
