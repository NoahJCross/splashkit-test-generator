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
mod test_input {
use super::*;
#[test]
fn test_process_events_integration() {
    let test_window = open_window("Test Window", 800, 600);
    while key_typed(KeyCode::AKey) == false {
        process_events();
        clear_screen();
        draw_text("Press A to test events", color_black(), 10, 10);
        draw_text(format!("Key Typed: {key_typed(KeyCode::AKey)}"), color_black(), 10, 30);
        refresh_screen();
    }
    while mouse_clicked(MouseButton::LeftButton) == false {
        process_events();
        clear_screen();
        draw_text("Click left mouse button to test events", color_black(), 10, 10);
        draw_text(format!("Mouse Clicked: {mouse_clicked(MouseButton::LeftButton)}"), color_black(), 10, 30);
        refresh_screen();
    }
    close_window(test_window);
}
#[test]
fn test_quit_requested_integration() {
    let test_window = open_window("Test Window", 800, 600);
    while quit_requested() == false {
        process_events();
        clear_screen();
        draw_text("Press Escape to test quit", color_black(), 10, 10);
        draw_text(format!("Quit Requested: {quit_requested()}"), color_black(), 10, 30);
        refresh_screen();
    }
    close_window(test_window);
}
#[test]
fn test_reset_quit_integration() {
    let test_window = open_window("Test Window", 800, 600);
    while quit_requested() == false {
        process_events();
        clear_screen();
        draw_text("Press Escape to test quit", color_black(), 10, 10);
        draw_text(format!("Quit Requested: {quit_requested()}"), color_black(), 10, 30);
        refresh_screen();
        reset_quit();
    }
    while key_down(KeyCode::AKey) == false {
        process_events();
        clear_screen();
        draw_text("Press A to continue after reset", color_black(), 10, 10);
        draw_text(format!("Key Down: {key_down(KeyCode::AKey)}"), color_black(), 10, 30);
        refresh_screen();
    }
    close_window(test_window);
}
#[test]
fn test_any_key_pressed_integration() {
    let test_window = open_window("Test Window", 800, 600);
    while any_key_pressed() == false {
        process_events();
        clear_screen();
        draw_text("Press any key to test", color_black(), 10, 10);
        draw_text(format!("Any Key Pressed: {any_key_pressed()}"), color_black(), 10, 30);
        refresh_screen();
    }
    close_window(test_window);
}
#[test]
fn test_deregister_callback_on_key_down_integration() {
    let callbacks = key_callbacks::new();
    let test_window = open_window("Test Window", 800, 600);
    register_callback_on_key_down(callbacks.on_key_down);
    while key_down(KeyCode::AKey) == false {
        process_events();
        clear_screen();
        draw_text("Press A to test callback", color_black(), 10, 10);
        draw_text(format!("Key Down: {key_down(KeyCode::AKey)}"), color_black(), 10, 30);
        draw_text(format!("Callback received: {callbacks.get_key_down}"), color_black(), 10, 50);
        refresh_screen();
        deregister_callback_on_key_down(callbacks.on_key_down);
    }
    while key_down(KeyCode::BKey) == false {
        process_events();
        clear_screen();
        draw_text("Press B to test deregistered callback", color_black(), 10, 10);
        draw_text(format!("Key Down: {key_down(KeyCode::BKey)}"), color_black(), 10, 30);
        draw_text(format!("Callback received: {callbacks.get_key_down}"), color_black(), 10, 50);
        refresh_screen();
    }
    close_window(test_window);
}
#[test]
fn test_deregister_callback_on_key_typed_integration() {
    let callbacks = key_callbacks::new();
    let test_window = open_window("Test Window", 800, 600);
    register_callback_on_key_typed(callbacks.on_key_typed);
    while key_typed(KeyCode::AKey) == false {
        process_events();
        clear_screen();
        draw_text("Press A to test callback", color_black(), 10, 10);
        draw_text(format!("Key Typed: {key_typed(KeyCode::AKey)}"), color_black(), 10, 30);
        draw_text(format!("Callback received: {callbacks.get_key_typed}"), color_black(), 10, 50);
        refresh_screen();
        deregister_callback_on_key_typed(callbacks.on_key_typed);
    }
    while key_typed(KeyCode::BKey) == false {
        process_events();
        clear_screen();
        draw_text("Press B to test deregistered callback", color_black(), 10, 10);
        draw_text(format!("Key Typed: {key_typed(KeyCode::BKey)}"), color_black(), 10, 30);
        draw_text(format!("Callback received: {callbacks.get_key_typed}"), color_black(), 10, 50);
        refresh_screen();
    }
    close_window(test_window);
}
#[test]
fn test_deregister_callback_on_key_up_integration() {
    let callbacks = key_callbacks::new();
    let test_window = open_window("Test Window", 800, 600);
    register_callback_on_key_up(callbacks.on_key_up);
    while key_up(KeyCode::AKey) == false {
        process_events();
        clear_screen();
        draw_text("Press and release A to test callback", color_black(), 10, 10);
        draw_text(format!("Key Up: {key_up(KeyCode::AKey)}"), color_black(), 10, 30);
        draw_text(format!("Callback received: {callbacks.get_key_up}"), color_black(), 10, 50);
        refresh_screen();
        deregister_callback_on_key_up(callbacks.on_key_up);
    }
    while key_up(KeyCode::BKey) == false {
        process_events();
        clear_screen();
        draw_text("Press and release B to test deregistered callback", color_black(), 10, 10);
        draw_text(format!("Key Up: {key_up(KeyCode::BKey)}"), color_black(), 10, 30);
        draw_text(format!("Callback received: {callbacks.get_key_up}"), color_black(), 10, 50);
        refresh_screen();
    }
    close_window(test_window);
}
#[test]
fn test_key_down_integration() {
    let test_window = open_window("Test Window", 800, 600);
    while key_down(KeyCode::AKey) == false {
        process_events();
        clear_screen();
        draw_text("Press and hold A", color_black(), 10, 10);
        draw_text(format!("Key Down: {key_down(KeyCode::AKey)}"), color_black(), 10, 30);
        refresh_screen();
    }
    while key_down(KeyCode::AKey) != false {
        process_events();
        clear_screen();
        draw_text("Release A", color_black(), 10, 10);
        draw_text(format!("Key Down: {key_down(KeyCode::AKey)}"), color_black(), 10, 30);
        refresh_screen();
    }
    close_window(test_window);
}
#[test]
fn test_key_name_integration() {
    let test_window = open_window("Test Window", 800, 600);
    while key_down(KeyCode::AKey) == false {
        process_events();
        clear_screen();
        draw_text("Press A to test key name", color_black(), 10, 10);
        draw_text(format!("Key Name: {key_name(KeyCode::AKey)}"), color_black(), 10, 30);
        refresh_screen();
    }
    while key_down(KeyCode::KeypadEnter) == false {
        process_events();
        clear_screen();
        draw_text("Press Enter to test key name", color_black(), 10, 10);
        draw_text(format!("Key Name: {key_name(KeyCode::KeypadEnter)}"), color_black(), 10, 30);
        refresh_screen();
    }
    close_window(test_window);
}
#[test]
fn test_key_released_integration() {
    let test_window = open_window("Test Window", 800, 600);
    while key_released(KeyCode::AKey) == false {
        process_events();
        clear_screen();
        draw_text("Press and release A", color_black(), 10, 10);
        draw_text(format!("Key Released: {key_released(KeyCode::AKey)}"), color_black(), 10, 30);
        refresh_screen();
    }
    close_window(test_window);
}
#[test]
fn test_key_typed_integration() {
    let test_window = open_window("Test Window", 800, 600);
    while key_typed(KeyCode::AKey) == false {
        process_events();
        clear_screen();
        draw_text("Press A to test key typed", color_black(), 10, 10);
        draw_text(format!("Key Typed: {key_typed(KeyCode::AKey)}"), color_black(), 10, 30);
        refresh_screen();
    }
    close_window(test_window);
}
#[test]
fn test_key_up_integration() {
    let test_window = open_window("Test Window", 800, 600);
    while key_up(KeyCode::AKey) == false {
        process_events();
        clear_screen();
        draw_text("Press and release A", color_black(), 10, 10);
        draw_text(format!("Key Up: {key_up(KeyCode::AKey)}"), color_black(), 10, 30);
        refresh_screen();
    }
    close_window(test_window);
}
#[test]
fn test_register_callback_on_key_down_integration() {
    let callbacks = key_callbacks::new();
    let test_window = open_window("Test Window", 800, 600);
    register_callback_on_key_down(callbacks.on_key_down);
    while key_down(KeyCode::AKey) == false {
        process_events();
        clear_screen();
        draw_text("Press A to test callback", color_black(), 10, 10);
        draw_text(format!("Key Down: {key_down(KeyCode::AKey)}"), color_black(), 10, 30);
        draw_text(format!("Callback received: {callbacks.get_key_down}"), color_black(), 10, 50);
        refresh_screen();
    }
    deregister_callback_on_key_down(callbacks.on_key_down);
    close_window(test_window);
}
#[test]
fn test_register_callback_on_key_typed_integration() {
    let callbacks = key_callbacks::new();
    let test_window = open_window("Test Window", 800, 600);
    register_callback_on_key_typed(callbacks.on_key_typed);
    while key_typed(KeyCode::AKey) == false {
        process_events();
        clear_screen();
        draw_text("Press A to test callback", color_black(), 10, 10);
        draw_text(format!("Key Typed: {key_typed(KeyCode::AKey)}"), color_black(), 10, 30);
        draw_text(format!("Callback received: {callbacks.get_key_typed}"), color_black(), 10, 50);
        refresh_screen();
    }
    deregister_callback_on_key_typed(callbacks.on_key_typed);
    close_window(test_window);
}
#[test]
fn test_register_callback_on_key_up_integration() {
    let callbacks = key_callbacks::new();
    let test_window = open_window("Test Window", 800, 600);
    register_callback_on_key_up(callbacks.on_key_up);
    while key_up(KeyCode::AKey) == false {
        process_events();
        clear_screen();
        draw_text("Press and release A to test callback", color_black(), 10, 10);
        draw_text(format!("Key Up: {key_up(KeyCode::AKey)}"), color_black(), 10, 30);
        draw_text(format!("Callback received: {callbacks.get_key_up}"), color_black(), 10, 50);
        refresh_screen();
    }
    deregister_callback_on_key_up(callbacks.on_key_up);
    close_window(test_window);
}
#[test]
fn test_hide_mouse_integration() {
    let test_window = open_window("Test Window", 800, 600);
    while key_down(KeyCode::HKey) == false {
        process_events();
        clear_screen();
        draw_text("Press H to hide mouse", color_black(), 10, 10);
        draw_text(format!("Mouse Shown: {mouse_shown()}"), color_black(), 10, 30);
        refresh_screen();
        hide_mouse();
    }
    while key_down(KeyCode::SKey) == false {
        process_events();
        clear_screen();
        draw_text("Press S to show mouse", color_black(), 10, 10);
        draw_text(format!("Mouse Shown: {mouse_shown()}"), color_black(), 10, 30);
        refresh_screen();
    }
    show_mouse();
    close_window(test_window);
}
#[test]
fn test_mouse_clicked_integration() {
    let test_window = open_window("Test Window", 800, 600);
    while mouse_clicked(MouseButton::LeftButton) == false {
        process_events();
        clear_screen();
        draw_text("Click left mouse button", color_black(), 10, 10);
        draw_text(format!("Mouse Clicked: {mouse_clicked(MouseButton::LeftButton)}"), color_black(), 10, 30);
        refresh_screen();
    }
    close_window(test_window);
}
#[test]
fn test_mouse_down_integration() {
    let test_window = open_window("Test Window", 800, 600);
    while mouse_down(MouseButton::LeftButton) == false {
        process_events();
        clear_screen();
        draw_text("Press and hold left mouse button", color_black(), 10, 10);
        draw_text(format!("Mouse Down: {mouse_down(MouseButton::LeftButton)}"), color_black(), 10, 30);
        refresh_screen();
    }
    while mouse_down(MouseButton::LeftButton) != false {
        process_events();
        clear_screen();
        draw_text("Release left mouse button", color_black(), 10, 10);
        draw_text(format!("Mouse Down: {mouse_down(MouseButton::LeftButton)}"), color_black(), 10, 30);
        refresh_screen();
    }
    close_window(test_window);
}
#[test]
fn test_mouse_movement_integration() {
    let test_window = open_window("Test Window", 800, 600);
    while key_down(KeyCode::SpaceKey) == false {
        process_events();
        clear_screen();
        let movement = mouse_movement();
        draw_text("Move mouse to test movement", color_black(), 10, 10);
        draw_text(format!("Mouse Position: X={mouse_x()}, Y={mouse_y()}"), color_black(), 10, 30);
        draw_text("Press Space to end test", color_black(), 10, 50);
        refresh_screen();
    }
    close_window(test_window);
}
#[test]
fn test_mouse_position_integration() {
    let test_window = open_window("Test Window", 800, 600);
    while key_down(KeyCode::SpaceKey) == false {
        process_events();
        clear_screen();
        let position = mouse_position();
        draw_text("Move mouse to test position", color_black(), 10, 10);
        draw_text(format!("Mouse Position: X={mouse_x()}, Y={mouse_y()}"), color_black(), 10, 30);
        draw_text("Press Space to end test", color_black(), 10, 50);
        refresh_screen();
    }
    close_window(test_window);
}
#[test]
fn test_mouse_position_vector_integration() {
    let test_window = open_window("Test Window", 800, 600);
    while key_down(KeyCode::SpaceKey) == false {
        process_events();
        clear_screen();
        let position = mouse_position_vector();
        draw_text("Move mouse to test position", color_black(), 10, 10);
        draw_text(format!("Mouse Position: X={mouse_x()}, Y={mouse_y()}"), color_black(), 10, 30);
        draw_text("Press Space to end test", color_black(), 10, 50);
        refresh_screen();
    }
    close_window(test_window);
}
#[test]
fn test_mouse_shown_integration() {
    let test_window = open_window("Test Window", 800, 600);
    while key_down(KeyCode::HKey) == false {
        process_events();
        clear_screen();
        draw_text("Press H to hide mouse", color_black(), 10, 10);
        draw_text(format!("Mouse Shown: {mouse_shown()}"), color_black(), 10, 30);
        refresh_screen();
        hide_mouse();
    }
    while key_down(KeyCode::SKey) == false {
        process_events();
        clear_screen();
        draw_text("Press S to show mouse", color_black(), 10, 10);
        draw_text(format!("Mouse Shown: {mouse_shown()}"), color_black(), 10, 30);
        refresh_screen();
    }
    show_mouse();
    close_window(test_window);
}
#[test]
fn test_mouse_up_integration() {
    let test_window = open_window("Test Window", 800, 600);
    while mouse_up(MouseButton::LeftButton) == false {
        process_events();
        clear_screen();
        draw_text("Click and release left mouse button", color_black(), 10, 10);
        draw_text(format!("Mouse Up: {mouse_up(MouseButton::LeftButton)}"), color_black(), 10, 30);
        refresh_screen();
    }
    close_window(test_window);
}
#[test]
fn test_mouse_wheel_scroll_integration() {
    let test_window = open_window("Test Window", 800, 600);
    while key_down(KeyCode::SpaceKey) == false {
        process_events();
        clear_screen();
        let scroll = mouse_wheel_scroll();
        draw_text("Scroll mouse wheel to test", color_black(), 10, 10);
        draw_text(format!("Mouse Position: X={mouse_x()}, Y={mouse_y()}"), color_black(), 10, 30);
        draw_text("Press Space to end test", color_black(), 10, 50);
        refresh_screen();
    }
    close_window(test_window);
}
#[test]
fn test_mouse_x_integration() {
    let test_window = open_window("Test Window", 800, 600);
    while key_down(KeyCode::SpaceKey) == false {
        process_events();
        clear_screen();
        draw_text("Move mouse to test X position", color_black(), 10, 10);
        draw_text(format!("Mouse Position: X={mouse_x()}, Y={mouse_y()}"), color_black(), 10, 30);
        draw_text("Press Space to end test", color_black(), 10, 50);
        refresh_screen();
    }
    close_window(test_window);
}
#[test]
fn test_mouse_y_integration() {
    let test_window = open_window("Test Window", 800, 600);
    while key_down(KeyCode::SpaceKey) == false {
        process_events();
        clear_screen();
        draw_text("Move mouse to test Y position", color_black(), 10, 10);
        draw_text(format!("Mouse Position: X={mouse_x()}, Y={mouse_y()}"), color_black(), 10, 30);
        draw_text("Press Space to end test", color_black(), 10, 50);
        refresh_screen();
    }
    close_window(test_window);
}
#[test]
fn test_move_mouse_integration() {
    let test_window = open_window("Test Window", 800, 600);
    while key_down(KeyCode::MKey) == false {
        process_events();
        clear_screen();
        draw_text("Press M to move mouse to center", color_black(), 10, 10);
        draw_text(format!("Mouse Position: X={mouse_x()}, Y={mouse_y()}"), color_black(), 10, 30);
        refresh_screen();
        move_mouse(400, 300);
    }
    while key_down(KeyCode::SpaceKey) == false {
        process_events();
        clear_screen();
        draw_text("Mouse moved to center", color_black(), 10, 10);
        draw_text(format!("Mouse Position: X={mouse_x()}, Y={mouse_y()}"), color_black(), 10, 30);
        draw_text("Press Space to end test", color_black(), 10, 50);
        refresh_screen();
    }
    close_window(test_window);
}
#[test]
fn test_move_mouse_to_point_integration() {
    let test_window = open_window("Test Window", 800, 600);
    while key_down(KeyCode::MKey) == false {
        process_events();
        clear_screen();
        draw_text("Press M to move mouse to center", color_black(), 10, 10);
        draw_text(format!("Mouse Position: X={mouse_x()}, Y={mouse_y()}"), color_black(), 10, 30);
        refresh_screen();
        move_mouse_to_point(point_at(400, 300));
    }
    while key_down(KeyCode::SpaceKey) == false {
        process_events();
        clear_screen();
        draw_text("Mouse moved to center", color_black(), 10, 10);
        draw_text(format!("Mouse Position: X={mouse_x()}, Y={mouse_y()}"), color_black(), 10, 30);
        draw_text("Press Space to end test", color_black(), 10, 50);
        refresh_screen();
    }
    close_window(test_window);
}
#[test]
fn test_show_mouse_integration() {
    let test_window = open_window("Test Window", 800, 600);
    while key_down(KeyCode::HKey) == false {
        process_events();
        clear_screen();
        draw_text("Press H to hide mouse", color_black(), 10, 10);
        draw_text(format!("Mouse Shown: {mouse_shown()}"), color_black(), 10, 30);
        refresh_screen();
        hide_mouse();
    }
    while key_down(KeyCode::SKey) == false {
        process_events();
        clear_screen();
        draw_text("Press S to show mouse", color_black(), 10, 10);
        draw_text(format!("Mouse Shown: {mouse_shown()}"), color_black(), 10, 30);
        refresh_screen();
    }
    show_mouse();
    close_window(test_window);
}
#[test]
fn test_show_mouse_with_boolean_integration() {
    let test_window = open_window("Test Window", 800, 600);
    while key_down(KeyCode::HKey) == false {
        process_events();
        clear_screen();
        draw_text("Press H to hide mouse", color_black(), 10, 10);
        draw_text(format!("Mouse Shown: {mouse_shown()}"), color_black(), 10, 30);
        refresh_screen();
        show_mouse_with_boolean(false);
    }
    while key_down(KeyCode::SKey) == false {
        process_events();
        clear_screen();
        draw_text("Press S to show mouse", color_black(), 10, 10);
        draw_text(format!("Mouse Shown: {mouse_shown()}"), color_black(), 10, 30);
        refresh_screen();
    }
    show_mouse_with_boolean(true);
    close_window(test_window);
}
#[test]
fn test_draw_collected_text_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_font = load_font("test_font", "hara.ttf");
    start_reading_text(rectangle_from(100, 100, 200, 30));
    while key_down(KeyCode::KeypadEnter) == false {
        process_events();
        clear_screen();
        draw_text("Type some text, press Enter when done", color_black(), 10, 10);
        draw_collected_text(color_black(), test_font, 18, option_defaults());
        refresh_screen();
    }
    end_reading_text();
    free_font(test_font);
    close_window(test_window);
}
#[test]
fn test_end_reading_text_integration() {
    let test_window = open_window("Test Window", 800, 600);
    start_reading_text(rectangle_from(100, 100, 200, 30));
    while key_down(KeyCode::KeypadEnter) == false {
        process_events();
        clear_screen();
        draw_text("Type some text, press Enter when done", color_black(), 10, 10);
        draw_text(format!("Reading Text: {reading_text()}"), color_black(), 10, 30);
        refresh_screen();
        end_reading_text();
    }
    while key_down(KeyCode::SpaceKey) == false {
        process_events();
        clear_screen();
        draw_text("Text input ended", color_black(), 10, 10);
        draw_text(format!("Reading Text: {reading_text()}"), color_black(), 10, 30);
        draw_text("Press Space to end test", color_black(), 10, 50);
        refresh_screen();
    }
    close_window(test_window);
}
#[test]
fn test_end_reading_text_in_window_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_rectangle = rectangle_from(100, 100, 200, 30);
    start_reading_text(test_window, test_rectangle);
    while key_down(KeyCode::KeypadEnter) == false {
        process_events();
        clear_screen();
        draw_text("Type some text, press Enter when done", color_black(), 10, 10);
        draw_text(format!("Reading Text: {reading_text(test_window)}"), color_black(), 10, 30);
        refresh_screen();
        end_reading_text_in_window(test_window);
    }
    while key_down(KeyCode::SpaceKey) == false {
        process_events();
        clear_screen();
        draw_text("Text input ended", color_black(), 10, 10);
        draw_text(format!("Reading Text: {reading_text(test_window)}"), color_black(), 10, 30);
        draw_text("Press Space to end test", color_black(), 10, 50);
        refresh_screen();
    }
    close_window(test_window);
}
#[test]
fn test_reading_text_integration() {
    let test_window = open_window("Test Window", 800, 600);
    start_reading_text(rectangle_from(100, 100, 200, 30));
    while key_down(KeyCode::KeypadEnter) == false {
        process_events();
        clear_screen();
        draw_text("Type some text, press Enter when done", color_black(), 10, 10);
        draw_text(format!("Reading Text: {reading_text()}"), color_black(), 10, 30);
        refresh_screen();
    }
    end_reading_text();
    close_window(test_window);
}
#[test]
fn test_reading_text_in_window_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_rectangle = rectangle_from(100, 100, 200, 30);
    start_reading_text(test_window, test_rectangle);
    while key_down(KeyCode::KeypadEnter) == false {
        process_events();
        clear_screen();
        draw_text("Type some text, press Enter when done", color_black(), 10, 10);
        draw_text(format!("Reading Text: {reading_text_in_window(test_window)}"), color_black(), 10, 30);
        refresh_screen();
    }
    end_reading_text(test_window);
    close_window(test_window);
}
#[test]
fn test_start_reading_text_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_rect = rectangle_from(100, 100, 200, 30);
    start_reading_text(test_rect);
    while key_down(KeyCode::KeypadEnter) == false {
        process_events();
        clear_screen();
        draw_text("Type some text, press Enter when done", color_black(), 10, 10);
        draw_text(format!("Current Text: {text_input()}"), color_black(), 10, 30);
        refresh_screen();
    }
    end_reading_text();
    close_window(test_window);
}
#[test]
fn test_start_reading_text_with_initial_text_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_rect = rectangle_from(100, 100, 200, 30);
    start_reading_text_with_initial_text(test_rect, "Initial Text");
    while key_down(KeyCode::KeypadEnter) == false {
        process_events();
        clear_screen();
        draw_text("Type some text, press Enter when done", color_black(), 10, 10);
        draw_text(format!("Current Text: {text_input()}"), color_black(), 10, 30);
        refresh_screen();
    }
    end_reading_text();
    close_window(test_window);
}
#[test]
fn test_start_reading_text_in_window_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_rect = rectangle_from(100, 100, 200, 30);
    start_reading_text_in_window(test_window, test_rect);
    while key_down(KeyCode::KeypadEnter) == false {
        process_events();
        clear_screen();
        draw_text("Type some text, press Enter when done", color_black(), 10, 10);
        draw_text(format!("Current Text: {text_input(test_window)}"), color_black(), 10, 30);
        refresh_screen();
    }
    end_reading_text(test_window);
    close_window(test_window);
}
#[test]
fn test_start_reading_text_in_window_with_initial_text_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_rect = rectangle_from(100, 100, 200, 30);
    start_reading_text_in_window_with_initial_text(test_window, test_rect, "Initial Text");
    while key_down(KeyCode::KeypadEnter) == false {
        process_events();
        clear_screen();
        draw_text("Type some text, press Enter when done", color_black(), 10, 10);
        draw_text(format!("Current Text: {text_input(test_window)}"), color_black(), 10, 30);
        refresh_screen();
    }
    end_reading_text(test_window);
    close_window(test_window);
}
#[test]
fn test_text_entry_cancelled_integration() {
    let test_window = open_window("Test Window", 800, 600);
    start_reading_text(rectangle_from(100, 100, 200, 30));
    while key_down(KeyCode::EscapeKey) == false {
        process_events();
        clear_screen();
        draw_text("Press Escape to cancel text entry", color_black(), 10, 10);
        draw_text(format!("Text Entry Cancelled: {text_entry_cancelled()}"), color_black(), 10, 30);
        refresh_screen();
    }
    end_reading_text();
    close_window(test_window);
}
#[test]
fn test_text_entry_cancelled_in_window_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_rect = rectangle_from(100, 100, 200, 30);
    start_reading_text(test_window, test_rect);
    while key_down(KeyCode::EscapeKey) == false {
        process_events();
        clear_screen();
        draw_text("Press Escape to cancel text entry", color_black(), 10, 10);
        draw_text(format!("Text Entry Cancelled: {text_entry_cancelled_in_window(test_window)}"), color_black(), 10, 30);
        refresh_screen();
    }
    end_reading_text(test_window);
    close_window(test_window);
}
#[test]
fn test_text_input_integration() {
    let test_window = open_window("Test Window", 800, 600);
    start_reading_text(rectangle_from(100, 100, 200, 30));
    while key_down(KeyCode::KeypadEnter) == false {
        process_events();
        clear_screen();
        draw_text("Type some text, press Enter when done", color_black(), 10, 10);
        draw_text(format!("Current Text: {text_input()}"), color_black(), 10, 30);
        refresh_screen();
    }
    end_reading_text();
    close_window(test_window);
}
#[test]
fn test_text_input_in_window_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_rect = rectangle_from(100, 100, 200, 30);
    start_reading_text(test_window, test_rect);
    while key_down(KeyCode::KeypadEnter) == false {
        process_events();
        clear_screen();
        draw_text("Type some text, press Enter when done", color_black(), 10, 10);
        draw_text(format!("Current Text: {text_input_in_window(test_window)}"), color_black(), 10, 30);
        refresh_screen();
    }
    end_reading_text(test_window);
    close_window(test_window);
}
}
