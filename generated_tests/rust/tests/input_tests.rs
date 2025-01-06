use std::*;
use splashkit::*;
use splashkit_tests::helpers::*;
#[cfg(test)]
use ctor::ctor;
mod test_input {
    use super::*;
    #[ctor]
    fn setup()
    {
        set_resources_path("/mnt/c/Users/Noahc/Documents/aYear_2_semester_2/TeamProject/GitHubRepo/splashkit_test_generator/resources".to_string());
    }
    #[test]
    fn test_process_events_integration() {
        open_window("Test Window 1".to_string(), 800, 600);
        let _cleanup_window = WindowCleanup::new();
        while key_typed(KeyCode::AKey) == false {
            process_events();
            clear_screen_to_white();
            draw_text_no_font_no_size("Test: process_events".to_string(), color_black(), 10.0, 10.0);
            draw_text_no_font_no_size("Press A to test events".to_string(), color_black(), 10.0, 30.0);
            draw_text_no_font_no_size(format!("Key Typed: {}", key_typed(KeyCode::AKey)), color_black(), 10.0, 50.0);
            refresh_screen();
        }
        while mouse_clicked(MouseButton::LeftButton) == false {
            process_events();
            clear_screen_to_white();
            draw_text_no_font_no_size("Test: process_events".to_string(), color_black(), 10.0, 10.0);
            draw_text_no_font_no_size("Click left mouse button to test events".to_string(), color_black(), 10.0, 30.0);
            draw_text_no_font_no_size(format!("Mouse Clicked: {}", mouse_clicked(MouseButton::LeftButton)), color_black(), 10.0, 50.0);
            refresh_screen();
        }
    }
    #[test]
    fn test_quit_requested_integration() {
        open_window("Test Window 2".to_string(), 800, 600);
        let _cleanup_window = WindowCleanup::new();
        while quit_requested() == false {
            process_events();
            clear_screen_to_white();
            draw_text_no_font_no_size("Test: quit_requested".to_string(), color_black(), 10.0, 10.0);
            draw_text_no_font_no_size("Close window to test quit requested".to_string(), color_black(), 10.0, 30.0);
            draw_text_no_font_no_size(format!("Quit Requested: {}", quit_requested()), color_black(), 10.0, 50.0);
            refresh_screen();
        }
    }
    #[test]
    fn test_reset_quit_integration() {
        open_window("Test Window 3".to_string(), 800, 600);
        let _cleanup_window = WindowCleanup::new();
        while quit_requested() == false {
            process_events();
            clear_screen_to_white();
            draw_text_no_font_no_size("Test: reset_quit".to_string(), color_black(), 10.0, 10.0);
            draw_text_no_font_no_size("Close window to test reset quit".to_string(), color_black(), 10.0, 30.0);
            draw_text_no_font_no_size(format!("Quit Requested: {}", quit_requested()), color_black(), 10.0, 50.0);
            refresh_screen();
        }
        reset_quit();
        while key_down(KeyCode::SpaceKey) == false {
            process_events();
            clear_screen_to_white();
            draw_text_no_font_no_size("Test: reset_quit".to_string(), color_black(), 10.0, 10.0);
            draw_text_no_font_no_size("Press Space to end test after reset quit".to_string(), color_black(), 10.0, 30.0);
            draw_text_no_font_no_size(format!("Key Down: {}", key_down(KeyCode::AKey)), color_black(), 10.0, 50.0);
            refresh_screen();
        }
    }
    #[test]
    fn test_any_key_pressed_integration() {
        open_window("Test Window 4".to_string(), 800, 600);
        let _cleanup_window = WindowCleanup::new();
        while any_key_pressed() == false {
            process_events();
            clear_screen_to_white();
            draw_text_no_font_no_size("Test: any_key_pressed".to_string(), color_black(), 10.0, 10.0);
            draw_text_no_font_no_size("Press any key to test".to_string(), color_black(), 10.0, 30.0);
            draw_text_no_font_no_size(format!("Any Key Pressed: {}", any_key_pressed()), color_black(), 10.0, 50.0);
            refresh_screen();
        }
        assert!(any_key_pressed());
    }
    #[test]
    fn test_deregister_callback_on_key_down_integration() {
        let callbacks = KeyCallbacks::new();
        open_window("Test Window 5".to_string(), 800, 600);
        let _cleanup_window = WindowCleanup::new();
        register_callback_on_key_down(callbacks.on_key_down());
        while callbacks.get_key_down() != KeyCode::AKey {
            process_events();
            clear_screen_to_white();
            draw_text_no_font_no_size("Test: deregister_callback_on_key_down".to_string(), color_black(), 10.0, 10.0);
            draw_text_no_font_no_size("Press A to test callback".to_string(), color_black(), 10.0, 30.0);
            draw_text_no_font_no_size(format!("Key Down: {}", key_down(KeyCode::AKey)), color_black(), 10.0, 50.0);
            draw_text_no_font_no_size(format!("Callback received: {}", key_name(callbacks.get_key_down())), color_black(), 10.0, 70.0);
            refresh_screen();
        }
        deregister_callback_on_key_down(callbacks.on_key_down());
        while key_down(KeyCode::SpaceKey) == false {
            process_events();
            clear_screen_to_white();
            draw_text_no_font_no_size("Test: deregister_callback_on_key_down".to_string(), color_black(), 10.0, 10.0);
            draw_text_no_font_no_size("Press B to test deregistered callback on key down".to_string(), color_black(), 10.0, 30.0);
            draw_text_no_font_no_size(format!("Key Down: {}", key_down(KeyCode::BKey)), color_black(), 10.0, 50.0);
            draw_text_no_font_no_size(format!("Callback received: {}", key_name(callbacks.get_key_down())), color_black(), 10.0, 70.0);
            draw_text_no_font_no_size("Press Space to end test".to_string(), color_black(), 10.0, 90.0);
            refresh_screen();
        }
    }
    #[test]
    fn test_deregister_callback_on_key_typed_integration() {
        let callbacks = KeyCallbacks::new();
        open_window("Test Window 6".to_string(), 800, 600);
        let _cleanup_window = WindowCleanup::new();
        register_callback_on_key_typed(callbacks.on_key_typed());
        while callbacks.get_key_typed() != KeyCode::AKey {
            process_events();
            clear_screen_to_white();
            draw_text_no_font_no_size("Test: deregister_callback_on_key_typed".to_string(), color_black(), 10.0, 10.0);
            draw_text_no_font_no_size("Press A to test callback".to_string(), color_black(), 10.0, 30.0);
            draw_text_no_font_no_size(format!("Key Typed: {}", key_typed(KeyCode::AKey)), color_black(), 10.0, 50.0);
            draw_text_no_font_no_size(format!("Callback received: {}", key_name(callbacks.get_key_typed())), color_black(), 10.0, 70.0);
            refresh_screen();
        }
        deregister_callback_on_key_typed(callbacks.on_key_typed());
        while key_down(KeyCode::SpaceKey) == false {
            process_events();
            clear_screen_to_white();
            draw_text_no_font_no_size("Test: deregister_callback_on_key_typed".to_string(), color_black(), 10.0, 10.0);
            draw_text_no_font_no_size("Press B to test deregistered callback on key typed".to_string(), color_black(), 10.0, 30.0);
            draw_text_no_font_no_size(format!("Key Typed: {}", key_typed(KeyCode::BKey)), color_black(), 10.0, 50.0);
            draw_text_no_font_no_size(format!("Callback received: {}", key_name(callbacks.get_key_typed())), color_black(), 10.0, 70.0);
            draw_text_no_font_no_size("Press Space to end test".to_string(), color_black(), 10.0, 90.0);
            refresh_screen();
        }
    }
    #[test]
    fn test_deregister_callback_on_key_up_integration() {
        let callbacks = KeyCallbacks::new();
        open_window("Test Window 7".to_string(), 800, 600);
        let _cleanup_window = WindowCleanup::new();
        register_callback_on_key_up(callbacks.on_key_up());
        while callbacks.get_key_up() != KeyCode::AKey {
            process_events();
            clear_screen_to_white();
            draw_text_no_font_no_size("Test: deregister_callback_on_key_up".to_string(), color_black(), 10.0, 10.0);
            draw_text_no_font_no_size("Press and release A to test callback".to_string(), color_black(), 10.0, 30.0);
            draw_text_no_font_no_size(format!("Key Up: {}", key_up(KeyCode::AKey)), color_black(), 10.0, 50.0);
            draw_text_no_font_no_size(format!("Callback received: {}", key_name(callbacks.get_key_up())), color_black(), 10.0, 70.0);
            refresh_screen();
        }
        deregister_callback_on_key_up(callbacks.on_key_up());
        while key_down(KeyCode::SpaceKey) == false {
            process_events();
            clear_screen_to_white();
            draw_text_no_font_no_size("Test: deregister_callback_on_key_up".to_string(), color_black(), 10.0, 10.0);
            draw_text_no_font_no_size("Press and release B to test deregistered callback on key up".to_string(), color_black(), 10.0, 30.0);
            draw_text_no_font_no_size(format!("Key Up: {}", key_up(KeyCode::BKey)), color_black(), 10.0, 50.0);
            draw_text_no_font_no_size(format!("Callback received: {}", key_name(callbacks.get_key_up())), color_black(), 10.0, 70.0);
            draw_text_no_font_no_size("Press Space to end test".to_string(), color_black(), 10.0, 90.0);
            refresh_screen();
        }
    }
    #[test]
    fn test_key_down_integration() {
        open_window("Test Window 8".to_string(), 800, 600);
        let _cleanup_window = WindowCleanup::new();
        while key_down(KeyCode::AKey) == false {
            process_events();
            clear_screen_to_white();
            draw_text_no_font_no_size("Test: key_down".to_string(), color_black(), 10.0, 10.0);
            draw_text_no_font_no_size("Press and hold A".to_string(), color_black(), 10.0, 30.0);
            draw_text_no_font_no_size(format!("Key Down: {}", key_down(KeyCode::AKey)), color_black(), 10.0, 50.0);
            refresh_screen();
        }
        while key_down(KeyCode::AKey) != false {
            process_events();
            clear_screen_to_white();
            draw_text_no_font_no_size("Test: key_down".to_string(), color_black(), 10.0, 10.0);
            draw_text_no_font_no_size("Release A".to_string(), color_black(), 10.0, 30.0);
            draw_text_no_font_no_size(format!("Key Down: {}", key_down(KeyCode::AKey)), color_black(), 10.0, 50.0);
            refresh_screen();
        }
    }
    #[test]
    fn test_key_name_integration() {
        let callbacks = KeyCallbacks::new();
        open_window("Test Window 9".to_string(), 800, 600);
        let _cleanup_window = WindowCleanup::new();
        register_callback_on_key_typed(callbacks.on_key_typed());
        while key_down(KeyCode::AKey) == false {
            process_events();
            clear_screen_to_white();
            draw_text_no_font_no_size("Test: key_name".to_string(), color_black(), 10.0, 10.0);
            draw_text_no_font_no_size("Press A to test key name".to_string(), color_black(), 10.0, 30.0);
            draw_text_no_font_no_size(format!("Key Name: {}", key_name(callbacks.get_key_typed())), color_black(), 10.0, 50.0);
            refresh_screen();
        }
        while key_down(KeyCode::ReturnKey) == false {
            process_events();
            clear_screen_to_white();
            draw_text_no_font_no_size("Test: key_name".to_string(), color_black(), 10.0, 10.0);
            draw_text_no_font_no_size("Press Enter to test key name".to_string(), color_black(), 10.0, 30.0);
            draw_text_no_font_no_size(format!("Key Name: {}", key_name(callbacks.get_key_typed())), color_black(), 10.0, 50.0);
            refresh_screen();
        }
    }
    #[test]
    fn test_key_released_integration() {
        open_window("Test Window 10".to_string(), 800, 600);
        let _cleanup_window = WindowCleanup::new();
        while key_released(KeyCode::AKey) == false {
            process_events();
            clear_screen_to_white();
            draw_text_no_font_no_size("Test: key_released".to_string(), color_black(), 10.0, 10.0);
            draw_text_no_font_no_size("Press and release A".to_string(), color_black(), 10.0, 30.0);
            draw_text_no_font_no_size(format!("Key Released: {}", key_released(KeyCode::AKey)), color_black(), 10.0, 50.0);
            refresh_screen();
        }
    }
    #[test]
    fn test_key_typed_integration() {
        open_window("Test Window 11".to_string(), 800, 600);
        let _cleanup_window = WindowCleanup::new();
        while key_typed(KeyCode::AKey) == false {
            process_events();
            clear_screen_to_white();
            draw_text_no_font_no_size("Test: key_typed".to_string(), color_black(), 10.0, 10.0);
            draw_text_no_font_no_size("Press A to test key typed".to_string(), color_black(), 10.0, 30.0);
            draw_text_no_font_no_size(format!("Key Typed: {}", key_typed(KeyCode::AKey)), color_black(), 10.0, 50.0);
            refresh_screen();
        }
    }
    #[test]
    fn test_key_up_integration() {
        open_window("Test Window 12".to_string(), 800, 600);
        let _cleanup_window = WindowCleanup::new();
        while key_up(KeyCode::AKey) == false {
            process_events();
            clear_screen_to_white();
            draw_text_no_font_no_size("Test: key_up".to_string(), color_black(), 10.0, 10.0);
            draw_text_no_font_no_size("Press and release A".to_string(), color_black(), 10.0, 30.0);
            draw_text_no_font_no_size(format!("Key Up: {}", key_up(KeyCode::AKey)), color_black(), 10.0, 50.0);
            refresh_screen();
        }
    }
    #[test]
    fn test_register_callback_on_key_down_integration() {
        let callbacks = KeyCallbacks::new();
        open_window("Test Window 13".to_string(), 800, 600);
        let _cleanup_window = WindowCleanup::new();
        register_callback_on_key_down(callbacks.on_key_down());
        while callbacks.get_key_down() != KeyCode::AKey {
            process_events();
            clear_screen_to_white();
            draw_text_no_font_no_size("Test: register_callback_on_key_down".to_string(), color_black(), 10.0, 10.0);
            draw_text_no_font_no_size("Press A to test callback on key down".to_string(), color_black(), 10.0, 30.0);
            draw_text_no_font_no_size(format!("Key Down: {}", key_down(KeyCode::AKey)), color_black(), 10.0, 50.0);
            draw_text_no_font_no_size(format!("Callback received: {}", key_name(callbacks.get_key_down())), color_black(), 10.0, 70.0);
            refresh_screen();
        }
        deregister_callback_on_key_down(callbacks.on_key_down());
    }
    #[test]
    fn test_register_callback_on_key_typed_integration() {
        let callbacks = KeyCallbacks::new();
        open_window("Test Window 14".to_string(), 800, 600);
        let _cleanup_window = WindowCleanup::new();
        register_callback_on_key_typed(callbacks.on_key_typed());
        while callbacks.get_key_typed() != KeyCode::AKey {
            process_events();
            clear_screen_to_white();
            draw_text_no_font_no_size("Test: register_callback_on_key_typed".to_string(), color_black(), 10.0, 10.0);
            draw_text_no_font_no_size("Press A to test callback on key typed".to_string(), color_black(), 10.0, 30.0);
            draw_text_no_font_no_size(format!("Key Typed: {}", key_typed(KeyCode::AKey)), color_black(), 10.0, 50.0);
            draw_text_no_font_no_size(format!("Callback received: {}", key_name(callbacks.get_key_typed())), color_black(), 10.0, 70.0);
            refresh_screen();
        }
        deregister_callback_on_key_typed(callbacks.on_key_typed());
    }
    #[test]
    fn test_register_callback_on_key_up_integration() {
        let callbacks = KeyCallbacks::new();
        open_window("Test Window 15".to_string(), 800, 600);
        let _cleanup_window = WindowCleanup::new();
        register_callback_on_key_up(callbacks.on_key_up());
        while callbacks.get_key_up() != KeyCode::AKey {
            process_events();
            clear_screen_to_white();
            draw_text_no_font_no_size("Test: register_callback_on_key_up".to_string(), color_black(), 10.0, 10.0);
            draw_text_no_font_no_size("Press and release A to test callback on key up".to_string(), color_black(), 10.0, 30.0);
            draw_text_no_font_no_size(format!("Key Up: {}", key_up(KeyCode::AKey)), color_black(), 10.0, 50.0);
            draw_text_no_font_no_size(format!("Callback received: {}", key_name(callbacks.get_key_up())), color_black(), 10.0, 70.0);
            refresh_screen();
        }
        deregister_callback_on_key_up(callbacks.on_key_up());
    }
    #[test]
    fn test_hide_mouse_integration() {
        open_window("Test Window 16".to_string(), 800, 600);
        let _cleanup_window = WindowCleanup::new();
        while key_down(KeyCode::HKey) == false {
            process_events();
            clear_screen_to_white();
            draw_text_no_font_no_size("Test: hide_mouse".to_string(), color_black(), 10.0, 10.0);
            draw_text_no_font_no_size("Press H to hide mouse".to_string(), color_black(), 10.0, 30.0);
            draw_text_no_font_no_size(format!("Mouse Shown: {}", mouse_shown()), color_black(), 10.0, 50.0);
            refresh_screen();
        }
        hide_mouse();
        while key_down(KeyCode::SpaceKey) == false {
            process_events();
            clear_screen_to_white();
            draw_text_no_font_no_size("Test: hide_mouse".to_string(), color_black(), 10.0, 10.0);
            draw_text_no_font_no_size(format!("Mouse Shown: {}", mouse_shown()), color_black(), 10.0, 30.0);
            draw_text_no_font_no_size("Press Space to end test".to_string(), color_black(), 10.0, 50.0);
            refresh_screen();
        }
        show_mouse();
    }
    #[test]
    fn test_mouse_clicked_integration() {
        open_window("Test Window 17".to_string(), 800, 600);
        let _cleanup_window = WindowCleanup::new();
        while mouse_clicked(MouseButton::LeftButton) == false {
            process_events();
            clear_screen_to_white();
            draw_text_no_font_no_size("Test: mouse_clicked".to_string(), color_black(), 10.0, 10.0);
            draw_text_no_font_no_size("Click left mouse button".to_string(), color_black(), 10.0, 30.0);
            draw_text_no_font_no_size(format!("Mouse Clicked: {}", mouse_clicked(MouseButton::LeftButton)), color_black(), 10.0, 50.0);
            refresh_screen();
        }
    }
    #[test]
    fn test_mouse_down_integration() {
        open_window("Test Window 18".to_string(), 800, 600);
        let _cleanup_window = WindowCleanup::new();
        while mouse_down(MouseButton::LeftButton) == false {
            process_events();
            clear_screen_to_white();
            draw_text_no_font_no_size("Test: mouse_down".to_string(), color_black(), 10.0, 10.0);
            draw_text_no_font_no_size("Press and hold left mouse button".to_string(), color_black(), 10.0, 30.0);
            draw_text_no_font_no_size(format!("Mouse Down: {}", mouse_down(MouseButton::LeftButton)), color_black(), 10.0, 50.0);
            refresh_screen();
        }
        while mouse_down(MouseButton::LeftButton) != false {
            process_events();
            clear_screen_to_white();
            draw_text_no_font_no_size("Test: mouse_down".to_string(), color_black(), 10.0, 10.0);
            draw_text_no_font_no_size("Release left mouse button".to_string(), color_black(), 10.0, 30.0);
            draw_text_no_font_no_size(format!("Mouse Down: {}", mouse_down(MouseButton::LeftButton)), color_black(), 10.0, 50.0);
            refresh_screen();
        }
    }
    #[test]
    fn test_mouse_movement_integration() {
        open_window("Test Window 19".to_string(), 800, 600);
        let _cleanup_window = WindowCleanup::new();
        while key_down(KeyCode::SpaceKey) == false {
            process_events();
            clear_screen_to_white();
            let movement = mouse_movement();
            draw_text_no_font_no_size("Test: mouse_movement".to_string(), color_black(), 10.0, 10.0);
            draw_text_no_font_no_size("Move mouse to test movement".to_string(), color_black(), 10.0, 30.0);
            draw_text_no_font_no_size(format!("Mouse Movement: X={}, Y={}", movement.x, movement.y), color_black(), 10.0, 50.0);
            draw_text_no_font_no_size("Press Space to end test".to_string(), color_black(), 10.0, 70.0);
            refresh_screen();
        }
    }
    #[test]
    fn test_mouse_position_integration() {
        open_window("Test Window 20".to_string(), 800, 600);
        let _cleanup_window = WindowCleanup::new();
        while key_down(KeyCode::SpaceKey) == false {
            process_events();
            clear_screen_to_white();
            let position = mouse_position();
            draw_text_no_font_no_size("Test: mouse_position".to_string(), color_black(), 10.0, 10.0);
            draw_text_no_font_no_size("Move mouse to test position".to_string(), color_black(), 10.0, 30.0);
            draw_text_no_font_no_size(format!("Mouse Position: X={}, Y={}", position.x, position.y), color_black(), 10.0, 50.0);
            draw_text_no_font_no_size("Press Space to end test".to_string(), color_black(), 10.0, 70.0);
            refresh_screen();
        }
    }
    #[test]
    fn test_mouse_position_vector_integration() {
        open_window("Test Window 21".to_string(), 800, 600);
        let _cleanup_window = WindowCleanup::new();
        while key_down(KeyCode::SpaceKey) == false {
            process_events();
            clear_screen_to_white();
            let position = mouse_position_vector();
            draw_text_no_font_no_size("Test: mouse_position_vector".to_string(), color_black(), 10.0, 10.0);
            draw_text_no_font_no_size("Move mouse to test position".to_string(), color_black(), 10.0, 30.0);
            draw_text_no_font_no_size(format!("Mouse Position: X={}, Y={}", position.x, position.y), color_black(), 10.0, 50.0);
            draw_text_no_font_no_size("Press Space to end test".to_string(), color_black(), 10.0, 70.0);
            refresh_screen();
        }
    }
    #[test]
    fn test_mouse_shown_integration() {
        open_window("Test Window 22".to_string(), 800, 600);
        let _cleanup_window = WindowCleanup::new();
        while key_down(KeyCode::HKey) == false {
            process_events();
            clear_screen_to_white();
            draw_text_no_font_no_size("Test: mouse_shown".to_string(), color_black(), 10.0, 10.0);
            draw_text_no_font_no_size("Press H to hide mouse".to_string(), color_black(), 10.0, 30.0);
            draw_text_no_font_no_size(format!("Mouse Shown: {}", mouse_shown()), color_black(), 10.0, 50.0);
            refresh_screen();
        }
        hide_mouse();
        assert!(!mouse_shown());
        while key_down(KeyCode::SKey) == false {
            process_events();
            clear_screen_to_white();
            draw_text_no_font_no_size("Test: mouse_shown".to_string(), color_black(), 10.0, 10.0);
            draw_text_no_font_no_size("Press S to show mouse".to_string(), color_black(), 10.0, 30.0);
            draw_text_no_font_no_size(format!("Mouse Shown: {}", mouse_shown()), color_black(), 10.0, 50.0);
            refresh_screen();
        }
        show_mouse();
        assert!(mouse_shown());
    }
    #[test]
    fn test_mouse_up_integration() {
        open_window("Test Window 23".to_string(), 800, 600);
        let _cleanup_window = WindowCleanup::new();
        while mouse_up(MouseButton::LeftButton) == false {
            process_events();
            clear_screen_to_white();
            draw_text_no_font_no_size("Test: mouse_up".to_string(), color_black(), 10.0, 10.0);
            draw_text_no_font_no_size("Click and release left mouse button".to_string(), color_black(), 10.0, 30.0);
            draw_text_no_font_no_size(format!("Mouse Up: {}", mouse_up(MouseButton::LeftButton)), color_black(), 10.0, 50.0);
            refresh_screen();
        }
    }
    #[test]
    fn test_mouse_wheel_scroll_integration() {
        open_window("Test Window 24".to_string(), 800, 600);
        let _cleanup_window = WindowCleanup::new();
        while key_down(KeyCode::SpaceKey) == false {
            process_events();
            clear_screen_to_white();
            let scroll = mouse_wheel_scroll();
            draw_text_no_font_no_size("Test: mouse_wheel_scroll".to_string(), color_black(), 10.0, 10.0);
            draw_text_no_font_no_size("Scroll mouse wheel to test".to_string(), color_black(), 10.0, 30.0);
            draw_text_no_font_no_size(format!("Scroll Value: X={}, Y={}", scroll.x, scroll.y), color_black(), 10.0, 50.0);
            draw_text_no_font_no_size("Press Space to end test".to_string(), color_black(), 10.0, 70.0);
            refresh_screen();
        }
    }
    #[test]
    fn test_mouse_x_integration() {
        open_window("Test Window 25".to_string(), 800, 600);
        let _cleanup_window = WindowCleanup::new();
        while key_down(KeyCode::SpaceKey) == false {
            process_events();
            clear_screen_to_white();
            draw_text_no_font_no_size("Test: mouse_x".to_string(), color_black(), 10.0, 10.0);
            draw_text_no_font_no_size("Move mouse to test X position".to_string(), color_black(), 10.0, 30.0);
            draw_text_no_font_no_size(format!("Mouse Position: X={}, Y={}", mouse_x(), mouse_y()), color_black(), 10.0, 50.0);
            draw_text_no_font_no_size("Press Space to end test".to_string(), color_black(), 10.0, 70.0);
            refresh_screen();
        }
    }
    #[test]
    fn test_mouse_y_integration() {
        open_window("Test Window 26".to_string(), 800, 600);
        let _cleanup_window = WindowCleanup::new();
        while key_down(KeyCode::SpaceKey) == false {
            process_events();
            clear_screen_to_white();
            draw_text_no_font_no_size("Test: mouse_y".to_string(), color_black(), 10.0, 10.0);
            draw_text_no_font_no_size("Move mouse to test Y position".to_string(), color_black(), 10.0, 30.0);
            draw_text_no_font_no_size(format!("Mouse Position: X={}, Y={}", mouse_x(), mouse_y()), color_black(), 10.0, 50.0);
            draw_text_no_font_no_size("Press Space to end test".to_string(), color_black(), 10.0, 70.0);
            refresh_screen();
        }
    }
    #[test]
    fn test_move_mouse_integration() {
        open_window("Test Window 27".to_string(), 800, 600);
        let _cleanup_window = WindowCleanup::new();
        while key_down(KeyCode::MKey) == false {
            process_events();
            clear_screen_to_white();
            draw_text_no_font_no_size("Test: move_mouse".to_string(), color_black(), 10.0, 10.0);
            draw_text_no_font_no_size("Press M to move mouse to center".to_string(), color_black(), 10.0, 30.0);
            draw_text_no_font_no_size(format!("Mouse Position: X={}, Y={}", mouse_x(), mouse_y()), color_black(), 10.0, 50.0);
            refresh_screen();
        }
        while key_down(KeyCode::SpaceKey) == false {
            process_events();
            clear_screen_to_white();
            draw_text_no_font_no_size("Test: move_mouse".to_string(), color_black(), 10.0, 10.0);
            draw_text_no_font_no_size("Mouse moved to center".to_string(), color_black(), 10.0, 30.0);
            draw_text_no_font_no_size(format!("Mouse Position: X={}, Y={}", mouse_x(), mouse_y()), color_black(), 10.0, 50.0);
            draw_text_no_font_no_size("Press Space to end test".to_string(), color_black(), 10.0, 70.0);
            move_mouse(400.0, 300.0);
            refresh_screen();
        }
    }
    #[test]
    fn test_move_mouse_to_point_integration() {
        open_window("Test Window 28".to_string(), 800, 600);
        let _cleanup_window = WindowCleanup::new();
        while key_down(KeyCode::MKey) == false {
            process_events();
            clear_screen_to_white();
            draw_text_no_font_no_size("Test: move_mouse_to_point".to_string(), color_black(), 10.0, 10.0);
            draw_text_no_font_no_size("Press M to move mouse to center".to_string(), color_black(), 10.0, 30.0);
            draw_text_no_font_no_size(format!("Mouse Position: X={}, Y={}", mouse_x(), mouse_y()), color_black(), 10.0, 50.0);
            refresh_screen();
        }
        while key_down(KeyCode::SpaceKey) == false {
            process_events();
            clear_screen_to_white();
            draw_text_no_font_no_size("Test: move_mouse_to_point".to_string(), color_black(), 10.0, 10.0);
            draw_text_no_font_no_size("Mouse moved to center".to_string(), color_black(), 10.0, 30.0);
            draw_text_no_font_no_size(format!("Mouse Position: X={}, Y={}", mouse_x(), mouse_y()), color_black(), 10.0, 50.0);
            draw_text_no_font_no_size("Press Space to end test".to_string(), color_black(), 10.0, 70.0);
            move_mouse_to_point(point_at(400.0, 300.0));
            refresh_screen();
        }
    }
    #[test]
    fn test_show_mouse_integration() {
        open_window("Test Window 29".to_string(), 800, 600);
        let _cleanup_window = WindowCleanup::new();
        hide_mouse();
        while key_down(KeyCode::SKey) == false {
            process_events();
            clear_screen_to_white();
            draw_text_no_font_no_size("Test: show_mouse".to_string(), color_black(), 10.0, 10.0);
            draw_text_no_font_no_size("Press S to show mouse".to_string(), color_black(), 10.0, 30.0);
            draw_text_no_font_no_size(format!("Mouse Shown: {}", mouse_shown()), color_black(), 10.0, 50.0);
            refresh_screen();
        }
        show_mouse();
        while key_down(KeyCode::SpaceKey) == false {
            process_events();
            clear_screen_to_white();
            draw_text_no_font_no_size("Test: show_mouse".to_string(), color_black(), 10.0, 10.0);
            draw_text_no_font_no_size(format!("Mouse Shown: {}", mouse_shown()), color_black(), 10.0, 30.0);
            draw_text_no_font_no_size("Press Space to end test".to_string(), color_black(), 10.0, 50.0);
            refresh_screen();
        }
    }
    #[test]
    fn test_show_mouse_with_boolean_integration() {
        open_window("Test Window 30".to_string(), 800, 600);
        let _cleanup_window = WindowCleanup::new();
        while key_down(KeyCode::HKey) == false {
            process_events();
            clear_screen_to_white();
            draw_text_no_font_no_size("Test: show_mouse_with_boolean".to_string(), color_black(), 10.0, 10.0);
            draw_text_no_font_no_size("Press H to hide mouse".to_string(), color_black(), 10.0, 30.0);
            draw_text_no_font_no_size(format!("Mouse Shown: {}", mouse_shown()), color_black(), 10.0, 50.0);
            refresh_screen();
        }
        show_mouse_with_boolean(false);
        assert!(!mouse_shown());
        while key_down(KeyCode::SKey) == false {
            process_events();
            clear_screen_to_white();
            draw_text_no_font_no_size("Test: show_mouse_with_boolean".to_string(), color_black(), 10.0, 10.0);
            draw_text_no_font_no_size("Press S to show mouse".to_string(), color_black(), 10.0, 30.0);
            draw_text_no_font_no_size(format!("Mouse Shown: {}", mouse_shown()), color_black(), 10.0, 50.0);
            refresh_screen();
        }
        show_mouse_with_boolean(true);
        assert!(mouse_shown());
    }
    #[test]
    fn test_draw_collected_text_integration() {
        open_window("Test Window 31".to_string(), 800, 600);
        let _cleanup_window = WindowCleanup::new();
        let test_font = load_font("test_font".to_string(), "hara.ttf".to_string());
        let _cleanup_font = FontCleanup::new();
        start_reading_text(rectangle_from(100.0, 100.0, 200.0, 30.0));
        while key_down(KeyCode::ReturnKey) == false {
            process_events();
            clear_screen_to_white();
            draw_text_no_font_no_size("Test: draw_collected_text".to_string(), color_black(), 10.0, 10.0);
            draw_text_no_font_no_size("Type some text, press Enter when done".to_string(), color_black(), 10.0, 30.0);
            draw_collected_text(color_black(), test_font, 18, option_defaults());
            refresh_screen();
        }
        end_reading_text();
    }
    #[test]
    fn test_end_reading_text_integration() {
        open_window("Test Window 32".to_string(), 800, 600);
        let _cleanup_window = WindowCleanup::new();
        start_reading_text(rectangle_from(100.0, 100.0, 200.0, 30.0));
        assert!(reading_text());
        while key_down(KeyCode::ReturnKey) == false {
            process_events();
            clear_screen_to_white();
            draw_text_no_font_no_size("Test: end_reading_text".to_string(), color_black(), 10.0, 10.0);
            draw_text_no_font_no_size("Type some text, press Enter when done".to_string(), color_black(), 10.0, 30.0);
            draw_text_no_font_no_size(format!("Reading Text: {}", reading_text()), color_black(), 10.0, 50.0);
            refresh_screen();
        }
        end_reading_text();
        assert!(!reading_text());
        while key_down(KeyCode::SpaceKey) == false {
            process_events();
            clear_screen_to_white();
            draw_text_no_font_no_size("Test: end_reading_text".to_string(), color_black(), 10.0, 10.0);
            draw_text_no_font_no_size("Text input ended".to_string(), color_black(), 10.0, 30.0);
            draw_text_no_font_no_size(format!("Reading Text: {}", reading_text()), color_black(), 10.0, 50.0);
            draw_text_no_font_no_size("Press Space to end test".to_string(), color_black(), 10.0, 70.0);
            refresh_screen();
        }
    }
    #[test]
    fn test_end_reading_text_in_window_integration() {
        let test_window = open_window("Test Window 33".to_string(), 800, 600);
        let _cleanup_window = WindowCleanup::new();
        let test_rectangle = rectangle_from(100.0, 100.0, 200.0, 30.0);
        start_reading_text_in_window(test_window, test_rectangle);
        assert!(reading_text());
        while key_down(KeyCode::ReturnKey) == false {
            process_events();
            clear_screen_to_white();
            draw_text_no_font_no_size("Test: end_reading_text_in_window".to_string(), color_black(), 10.0, 10.0);
            draw_text_no_font_no_size("Type some text, press Enter when done".to_string(), color_black(), 10.0, 30.0);
            draw_text_no_font_no_size(format!("Reading Text: {}", reading_text_in_window(test_window)), color_black(), 10.0, 50.0);
            refresh_screen();
        }
        end_reading_text_in_window(test_window);
        assert!(!reading_text());
        while key_down(KeyCode::SpaceKey) == false {
            process_events();
            clear_screen_to_white();
            draw_text_no_font_no_size("Test: end_reading_text_in_window".to_string(), color_black(), 10.0, 10.0);
            draw_text_no_font_no_size("Text input ended".to_string(), color_black(), 10.0, 30.0);
            draw_text_no_font_no_size(format!("Reading Text: {}", reading_text_in_window(test_window)), color_black(), 10.0, 50.0);
            draw_text_no_font_no_size("Press Space to end test".to_string(), color_black(), 10.0, 70.0);
            refresh_screen();
        }
    }
    #[test]
    fn test_reading_text_integration() {
        open_window("Test Window 34".to_string(), 800, 600);
        let _cleanup_window = WindowCleanup::new();
        start_reading_text(rectangle_from(100.0, 100.0, 200.0, 30.0));
        assert!(reading_text());
        while key_down(KeyCode::ReturnKey) == false {
            process_events();
            clear_screen_to_white();
            draw_text_no_font_no_size("Test: reading_text".to_string(), color_black(), 10.0, 10.0);
            draw_text_no_font_no_size("Type some text, press Enter when done".to_string(), color_black(), 10.0, 30.0);
            draw_text_no_font_no_size(format!("Reading Text: {}", reading_text()), color_black(), 10.0, 50.0);
            refresh_screen();
        }
        end_reading_text();
        assert!(!reading_text());
    }
    #[test]
    fn test_reading_text_in_window_integration() {
        let test_window = open_window("Test Window 35".to_string(), 800, 600);
        let _cleanup_window = WindowCleanup::new();
        let test_rectangle = rectangle_from(100.0, 100.0, 200.0, 30.0);
        start_reading_text_in_window(test_window, test_rectangle);
        assert!(reading_text_in_window(test_window));
        while key_down(KeyCode::ReturnKey) == false {
            process_events();
            clear_screen_to_white();
            draw_text_no_font_no_size("Test: reading_text_in_window".to_string(), color_black(), 10.0, 10.0);
            draw_text_no_font_no_size("Type some text, press Enter when done".to_string(), color_black(), 10.0, 30.0);
            draw_text_no_font_no_size(format!("Reading Text: {}", reading_text_in_window(test_window)), color_black(), 10.0, 50.0);
            refresh_screen();
        }
        end_reading_text_in_window(test_window);
        assert!(!reading_text_in_window(test_window));
    }
    #[test]
    fn test_start_reading_text_integration() {
        open_window("Test Window 36".to_string(), 800, 600);
        let _cleanup_window = WindowCleanup::new();
        let test_rect = rectangle_from(100.0, 100.0, 200.0, 30.0);
        start_reading_text(test_rect);
        assert!(reading_text());
        while key_down(KeyCode::ReturnKey) == false {
            process_events();
            clear_screen_to_white();
            draw_text_no_font_no_size("Test: start_reading_text".to_string(), color_black(), 10.0, 10.0);
            draw_text_no_font_no_size("Type some text, press Enter when done".to_string(), color_black(), 10.0, 30.0);
            draw_text_no_font_no_size(format!("Current Text: {}", text_input()), color_black(), 10.0, 50.0);
            refresh_screen();
        }
        end_reading_text();
        assert!(!reading_text());
    }
    #[test]
    fn test_start_reading_text_with_initial_text_integration() {
        open_window("Test Window 37".to_string(), 800, 600);
        let _cleanup_window = WindowCleanup::new();
        let test_rect = rectangle_from(100.0, 100.0, 200.0, 30.0);
        start_reading_text_with_initial_text(test_rect, "Initial Text".to_string());
        assert!(reading_text());
        while key_down(KeyCode::ReturnKey) == false {
            process_events();
            clear_screen_to_white();
            draw_text_no_font_no_size("Test: start_reading_text_with_initial_text".to_string(), color_black(), 10.0, 10.0);
            draw_text_no_font_no_size("Type some text, press Enter when done".to_string(), color_black(), 10.0, 30.0);
            draw_text_no_font_no_size(format!("Current Text: {}", text_input()), color_black(), 10.0, 50.0);
            refresh_screen();
        }
        end_reading_text();
        assert!(!reading_text());
    }
    #[test]
    fn test_start_reading_text_in_window_integration() {
        let test_window = open_window("Test Window 38".to_string(), 800, 600);
        let _cleanup_window = WindowCleanup::new();
        let test_rect = rectangle_from(100.0, 100.0, 200.0, 30.0);
        start_reading_text_in_window(test_window, test_rect);
        assert!(reading_text());
        while key_down(KeyCode::ReturnKey) == false {
            process_events();
            clear_screen_to_white();
            draw_text_no_font_no_size("Test: start_reading_text_in_window".to_string(), color_black(), 10.0, 10.0);
            draw_text_no_font_no_size("Type some text, press Enter when done".to_string(), color_black(), 10.0, 30.0);
            draw_text_no_font_no_size(format!("Current Text: {}", text_input_in_window(test_window)), color_black(), 10.0, 50.0);
            refresh_screen();
        }
        end_reading_text_in_window(test_window);
        assert!(!reading_text());
    }
    #[test]
    fn test_start_reading_text_in_window_with_initial_text_integration() {
        let test_window = open_window("Test Window 39".to_string(), 800, 600);
        let _cleanup_window = WindowCleanup::new();
        let test_rect = rectangle_from(100.0, 100.0, 200.0, 30.0);
        start_reading_text_in_window_with_initial_text(test_window, test_rect, "Initial Text".to_string());
        assert!(reading_text());
        while key_down(KeyCode::ReturnKey) == false {
            process_events();
            clear_screen_to_white();
            draw_text_no_font_no_size("Test: start_reading_text_in_window_with_initial_text".to_string(), color_black(), 10.0, 10.0);
            draw_text_no_font_no_size("Type some text, press Enter when done".to_string(), color_black(), 10.0, 30.0);
            draw_text_no_font_no_size(format!("Current Text: {}", text_input_in_window(test_window)), color_black(), 10.0, 50.0);
            refresh_screen();
        }
        end_reading_text_in_window(test_window);
        assert!(!reading_text());
    }
    #[test]
    fn test_text_entry_cancelled_integration() {
        open_window("Test Window 40".to_string(), 800, 600);
        let _cleanup_window = WindowCleanup::new();
        start_reading_text(rectangle_from(100.0, 100.0, 200.0, 30.0));
        while key_down(KeyCode::SpaceKey) == false {
            process_events();
            clear_screen_to_white();
            draw_text_no_font_no_size("Test: text_entry_cancelled".to_string(), color_black(), 10.0, 10.0);
            draw_text_no_font_no_size("Press Escape to cancel text entry".to_string(), color_black(), 10.0, 30.0);
            draw_text_no_font_no_size(format!("Text Entry Cancelled: {}", text_entry_cancelled()), color_black(), 10.0, 50.0);
            draw_text_no_font_no_size("Press space to end test".to_string(), color_black(), 10.0, 70.0);
            refresh_screen();
        }
        end_reading_text();
    }
    #[test]
    fn test_text_entry_cancelled_in_window_integration() {
        let test_window = open_window("Test Window 41".to_string(), 800, 600);
        let _cleanup_window = WindowCleanup::new();
        let test_rect = rectangle_from(100.0, 100.0, 200.0, 30.0);
        start_reading_text_in_window(test_window, test_rect);
        while key_down(KeyCode::SpaceKey) == false {
            process_events();
            clear_screen_to_white();
            draw_text_no_font_no_size("Test: text_entry_cancelled_in_window".to_string(), color_black(), 10.0, 10.0);
            draw_text_no_font_no_size("Press Escape to cancel text entry".to_string(), color_black(), 10.0, 30.0);
            draw_text_no_font_no_size(format!("Text Entry Cancelled: {}", text_entry_cancelled_in_window(test_window)), color_black(), 10.0, 50.0);
            draw_text_no_font_no_size("Press space to end test".to_string(), color_black(), 10.0, 70.0);
            refresh_screen();
        }
        assert!(text_entry_cancelled_in_window(test_window));
        end_reading_text_in_window(test_window);
    }
    #[test]
    fn test_text_input_integration() {
        open_window("Test Window 42".to_string(), 800, 600);
        let _cleanup_window = WindowCleanup::new();
        start_reading_text(rectangle_from(100.0, 100.0, 200.0, 30.0));
        while key_down(KeyCode::ReturnKey) == false {
            process_events();
            clear_screen_to_white();
            draw_text_no_font_no_size("Test: text_input".to_string(), color_black(), 10.0, 10.0);
            draw_text_no_font_no_size("Type some text, press Enter when done".to_string(), color_black(), 10.0, 30.0);
            draw_text_no_font_no_size(format!("Current Text: {}", text_input()), color_black(), 10.0, 50.0);
            refresh_screen();
        }
        end_reading_text();
    }
    #[test]
    fn test_text_input_in_window_integration() {
        let test_window = open_window("Test Window 43".to_string(), 800, 600);
        let _cleanup_window = WindowCleanup::new();
        let test_rect = rectangle_from(100.0, 100.0, 200.0, 30.0);
        start_reading_text_in_window(test_window, test_rect);
        while key_down(KeyCode::ReturnKey) == false {
            process_events();
            clear_screen_to_white();
            draw_text_no_font_no_size("Test: text_input_in_window".to_string(), color_black(), 10.0, 10.0);
            draw_text_no_font_no_size("Type some text, press Enter when done".to_string(), color_black(), 10.0, 30.0);
            draw_text_no_font_no_size(format!("Current Text: {}", text_input_in_window(test_window)), color_black(), 10.0, 50.0);
            refresh_screen();
        }
        end_reading_text_in_window(test_window);
    }
}
