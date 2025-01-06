use std::*;
use splashkit::*;
use splashkit_tests::helpers::*;
#[cfg(test)]
use ctor::ctor;
mod test_interface {
    use super::*;
    #[ctor]
    fn setup()
    {
        set_resources_path("/mnt/c/Users/Noahc/Documents/aYear_2_semester_2/TeamProject/GitHubRepo/splashkit_test_generator/resources".to_string());
    }
    #[test]
    fn test_add_column_integration() {
        open_window("Test Window 1".to_string(), 800, 600);
        let _cleanup_window = WindowCleanup::new();
        process_events();
        while key_down(KeyCode::SpaceKey) == false {
            process_events();
            clear_screen_to_white();
            draw_text_no_font_no_size("Test: add_column".to_string(), color_black(), 10.0, 10.0);
            draw_text_no_font_no_size("Expected: Two columns - first 100px wide, second fills remaining space".to_string(), color_black(), 10.0, 30.0);
            draw_text_no_font_no_size("Press space to end test".to_string(), color_black(), 10.0, 50.0);
            start_panel("Test Panel 1".to_string(), rectangle_from(0.0, 70.0, 800.0, 530.0));
            start_custom_layout();
            add_column(100);
            add_column(-1);
            button("Left Column".to_string());
            button("Right Column".to_string());
            end_panel("Test Panel 1".to_string());
            draw_interface();
            refresh_screen();
        }
    }
    #[test]
    fn test_add_column_relative_integration() {
        open_window("Test Window 2".to_string(), 800, 600);
        let _cleanup_window = WindowCleanup::new();
        process_events();
        while key_down(KeyCode::SpaceKey) == false {
            process_events();
            clear_screen_to_white();
            draw_text_no_font_no_size("Test: add_column_relative".to_string(), color_black(), 10.0, 10.0);
            draw_text_no_font_no_size("Expected: Two equal-width columns (50% each)".to_string(), color_black(), 10.0, 30.0);
            draw_text_no_font_no_size("Press space to end test".to_string(), color_black(), 10.0, 50.0);
            start_panel("Test Panel 2".to_string(), rectangle_from(0.0, 70.0, 800.0, 530.0));
            start_custom_layout();
            add_column_relative(0.5);
            add_column_relative(0.5);
            button("Left Column".to_string());
            button("Right Column".to_string());
            end_panel("Test Panel 2".to_string());
            draw_interface();
            refresh_screen();
        }
    }
    #[test]
    fn test_bitmap_button_integration() {
        open_window("Test Window 3".to_string(), 800, 600);
        let _cleanup_window = WindowCleanup::new();
        let test_bitmap = create_bitmap("Test Bitmap 1".to_string(), 100, 100);
        let _cleanup_bitmap = BitmapCleanup::new();
        clear_bitmap(test_bitmap, color_red());
        let mut button_clicked = false;
        while button_clicked == false {
            process_events();
            clear_screen_to_white();
            draw_text_no_font_no_size("Test: bitmap_button".to_string(), color_black(), 10.0, 10.0);
            draw_text_no_font_no_size("Expected: A clickable button with a red bitmap image".to_string(), color_black(), 10.0, 30.0);
            draw_text_no_font_no_size("Click the button to end test".to_string(), color_black(), 10.0, 50.0);
            start_panel("Test Panel 3".to_string(), rectangle_from(0.0, 70.0, 800.0, 530.0));
            set_layout_height(100);
            button_clicked = bitmap_button(test_bitmap);
            end_panel("Test Panel 3".to_string());
            draw_interface();
            refresh_screen();
        }
        assert!(button_clicked);
    }
    #[test]
    fn test_bitmap_button_at_position_integration() {
        open_window("Test Window 4".to_string(), 800, 600);
        let _cleanup_window = WindowCleanup::new();
        let test_bitmap = create_bitmap("Test Bitmap 2".to_string(), 100, 100);
        clear_bitmap(test_bitmap, color_red());
        let _cleanup_bitmap = BitmapCleanup::new();
        let test_rectangle = rectangle_from(100.0, 100.0, 100.0, 100.0);
        let mut button_clicked = false;
        while button_clicked == false {
            process_events();
            clear_screen_to_white();
            draw_text_no_font_no_size("Test: bitmap_button_at_position".to_string(), color_black(), 10.0, 10.0);
            draw_text_no_font_no_size("Expected: A red bitmap button at position (100,100)".to_string(), color_black(), 10.0, 30.0);
            draw_text_no_font_no_size("Click the button to end test".to_string(), color_black(), 10.0, 50.0);
            button_clicked = bitmap_button_at_position(test_bitmap, test_rectangle);
            draw_interface();
            refresh_screen();
        }
        assert!(button_clicked);
    }
    #[test]
    fn test_bitmap_button_at_position_with_options_integration() {
        open_window("Test Window 5".to_string(), 800, 600);
        let _cleanup_window = WindowCleanup::new();
        let test_bitmap = create_bitmap("Test Bitmap 3".to_string(), 100, 100);
        clear_bitmap(test_bitmap, color_red());
        let _cleanup_bitmap = BitmapCleanup::new();
        let test_rectangle = rectangle_from(100.0, 100.0, 100.0, 100.0);
        let mut button_clicked = false;
        while button_clicked == false {
            process_events();
            clear_screen_to_white();
            draw_text_no_font_no_size("Test: bitmap_button_at_position_with_options".to_string(), color_black(), 10.0, 10.0);
            draw_text_no_font_no_size("Expected: A red bitmap button at position (100,100) with default options".to_string(), color_black(), 10.0, 30.0);
            draw_text_no_font_no_size("Click the button to end test".to_string(), color_black(), 10.0, 50.0);
            button_clicked = bitmap_button_at_position_with_options(test_bitmap, test_rectangle, option_defaults());
            draw_interface();
            refresh_screen();
        }
        assert!(button_clicked);
    }
    #[test]
    fn test_bitmap_button_with_options_integration() {
        open_window("Test Window 6".to_string(), 800, 600);
        let _cleanup_window = WindowCleanup::new();
        let test_bitmap = create_bitmap("Test Bitmap 4".to_string(), 100, 100);
        clear_bitmap(test_bitmap, color_red());
        let _cleanup_bitmap = BitmapCleanup::new();
        let test_options1 = option_defaults();
        let test_options2 = option_scale_bmp_with_options(0.5, 0.5, test_options1);
        let mut button_clicked = false;
        while button_clicked == false {
            process_events();
            clear_screen_to_white();
            draw_text_no_font_no_size("Test: bitmap_button_with_options".to_string(), color_black(), 10.0, 10.0);
            draw_text_no_font_no_size("Expected: A red bitmap button scaled to 50% size".to_string(), color_black(), 10.0, 30.0);
            draw_text_no_font_no_size("Click the button to end test".to_string(), color_black(), 10.0, 50.0);
            start_panel("Test Panel 4".to_string(), rectangle_from(0.0, 70.0, 800.0, 530.0));
            set_layout_height(50);
            button_clicked = bitmap_button_with_options(test_bitmap, test_options2);
            end_panel("Test Panel 4".to_string());
            draw_interface();
            refresh_screen();
        }
        assert!(button_clicked);
    }
    #[test]
    fn test_bitmap_button_labeled_integration() {
        open_window("Test Window 7".to_string(), 800, 600);
        let _cleanup_window = WindowCleanup::new();
        let test_bitmap = create_bitmap("Test Bitmap 5".to_string(), 20, 20);
        clear_bitmap(test_bitmap, color_red());
        let _cleanup_bitmap = BitmapCleanup::new();
        let mut button_clicked = false;
        while button_clicked == false {
            process_events();
            clear_screen_to_white();
            draw_text_no_font_no_size("Test: bitmap_button_labeled".to_string(), color_black(), 10.0, 10.0);
            draw_text_no_font_no_size("Expected: A red bitmap button with label 'Click Me'".to_string(), color_black(), 10.0, 30.0);
            draw_text_no_font_no_size("Click the button to end test".to_string(), color_black(), 10.0, 50.0);
            start_panel("Test Panel 5".to_string(), rectangle_from(0.0, 70.0, 800.0, 530.0));
            button_clicked = bitmap_button_labeled("Click Me".to_string(), test_bitmap);
            end_panel("Test Panel 5".to_string());
            draw_interface();
            refresh_screen();
        }
        assert!(button_clicked);
    }
    #[test]
    fn test_bitmap_button_labeled_with_options_integration() {
        open_window("Test Window 8".to_string(), 800, 600);
        let _cleanup_window = WindowCleanup::new();
        let test_bitmap = create_bitmap("Test Bitmap 6".to_string(), 20, 20);
        clear_bitmap(test_bitmap, color_red());
        let _cleanup_bitmap = BitmapCleanup::new();
        let test_options1 = option_defaults();
        let test_options2 = option_scale_bmp_with_options(0.5, 0.5, test_options1);
        let mut button_clicked = false;
        while button_clicked == false {
            process_events();
            clear_screen_to_white();
            draw_text_no_font_no_size("Test: bitmap_button_labeled_with_options".to_string(), color_black(), 10.0, 10.0);
            draw_text_no_font_no_size("Expected: A red bitmap button scaled to 50% with label 'Click Me'".to_string(), color_black(), 10.0, 30.0);
            draw_text_no_font_no_size("Click the button to end test".to_string(), color_black(), 10.0, 50.0);
            start_panel("Test Panel 6".to_string(), rectangle_from(0.0, 70.0, 800.0, 530.0));
            button_clicked = bitmap_button_labeled_with_options("Click Me".to_string(), test_bitmap, test_options2);
            end_panel("Test Panel 6".to_string());
            draw_interface();
            refresh_screen();
        }
        assert!(button_clicked);
    }
    #[test]
    fn test_button_at_position_integration() {
        open_window("Test Window 9".to_string(), 800, 600);
        let _cleanup_window = WindowCleanup::new();
        let test_rectangle = rectangle_from(100.0, 100.0, 200.0, 50.0);
        let mut button_clicked = false;
        while button_clicked == false {
            process_events();
            clear_screen_to_white();
            draw_text_no_font_no_size("Test: button_at_position".to_string(), color_black(), 10.0, 10.0);
            draw_text_no_font_no_size("Expected: A button with text 'Click Me' at position (100,100) with size 200x50".to_string(), color_black(), 10.0, 30.0);
            draw_text_no_font_no_size("Click the button to end test".to_string(), color_black(), 10.0, 50.0);
            button_clicked = button_at_position("Click Me".to_string(), test_rectangle);
            draw_interface();
            refresh_screen();
        }
        assert!(button_clicked);
    }
    #[test]
    fn test_button_integration() {
        open_window("Test Window 10".to_string(), 800, 600);
        let _cleanup_window = WindowCleanup::new();
        let mut button_clicked = false;
        while button_clicked == false {
            process_events();
            clear_screen_to_white();
            draw_text_no_font_no_size("Test: button".to_string(), color_black(), 10.0, 10.0);
            draw_text_no_font_no_size("Expected: A button with text 'Click Me' using default layout".to_string(), color_black(), 10.0, 30.0);
            draw_text_no_font_no_size("Click the button to end test".to_string(), color_black(), 10.0, 50.0);
            start_panel("Test Panel 7".to_string(), rectangle_from(0.0, 70.0, 800.0, 530.0));
            button_clicked = button("Click Me".to_string());
            end_panel("Test Panel 7".to_string());
            draw_interface();
            refresh_screen();
        }
        assert!(button_clicked);
    }
    #[test]
    fn test_button_labeled_integration() {
        open_window("Test Window 11".to_string(), 800, 600);
        let _cleanup_window = WindowCleanup::new();
        let mut button_clicked = false;
        while button_clicked == false {
            process_events();
            clear_screen_to_white();
            draw_text_no_font_no_size("Test: button_labeled".to_string(), color_black(), 10.0, 10.0);
            draw_text_no_font_no_size("Expected: A button with text 'Click Me' and label 'Label:' in a two-column layout".to_string(), color_black(), 10.0, 30.0);
            draw_text_no_font_no_size("Click the button to end test".to_string(), color_black(), 10.0, 50.0);
            start_panel("Test Panel 8".to_string(), rectangle_from(0.0, 70.0, 800.0, 530.0));
            button_clicked = button_labeled("Label:".to_string(), "Click Me".to_string());
            end_panel("Test Panel 8".to_string());
            draw_interface();
            refresh_screen();
        }
        assert!(button_clicked);
    }
    #[test]
    fn test_checkbox_at_position_integration() {
        open_window("Test Window 12".to_string(), 800, 600);
        let _cleanup_window = WindowCleanup::new();
        let test_rect = rectangle_from(100.0, 100.0, 200.0, 50.0);
        let initial_checkbox_result = false;
        let mut current_checkbox_result = initial_checkbox_result;
        while current_checkbox_result == false {
            process_events();
            clear_screen_to_white();
            draw_text_no_font_no_size("Test: checkbox_at_position".to_string(), color_black(), 10.0, 10.0);
            draw_text_no_font_no_size("Expected: A checkbox with text 'Test Checkbox' at position (100,100) with size 200x50".to_string(), color_black(), 10.0, 30.0);
            draw_text_no_font_no_size("Click the checkbox to end test".to_string(), color_black(), 10.0, 50.0);
            current_checkbox_result = checkbox_at_position("Test Checkbox".to_string(), current_checkbox_result, test_rect);
            draw_interface();
            refresh_screen();
        }
        assert!(current_checkbox_result);
    }
    #[test]
    fn test_checkbox_integration() {
        open_window("Test Window 13".to_string(), 800, 600);
        let _cleanup_window = WindowCleanup::new();
        let initial_checkbox_result = false;
        let mut current_checkbox_result = initial_checkbox_result;
        while current_checkbox_result == false {
            process_events();
            clear_screen_to_white();
            draw_text_no_font_no_size("Test: checkbox".to_string(), color_black(), 10.0, 10.0);
            draw_text_no_font_no_size("Expected: A checkbox with text 'Test Checkbox' using default layout".to_string(), color_black(), 10.0, 30.0);
            draw_text_no_font_no_size("Click the checkbox to end test".to_string(), color_black(), 10.0, 50.0);
            start_panel("Test Panel 9".to_string(), rectangle_from(0.0, 70.0, 800.0, 530.0));
            current_checkbox_result = checkbox("Test Checkbox".to_string(), current_checkbox_result);
            end_panel("Test Panel 9".to_string());
            draw_interface();
            refresh_screen();
        }
        assert!(current_checkbox_result);
    }
    #[test]
    fn test_checkbox_labeled_integration() {
        open_window("Test Window 14".to_string(), 800, 600);
        let _cleanup_window = WindowCleanup::new();
        let initial_checkbox_result = false;
        let mut current_checkbox_result = initial_checkbox_result;
        while current_checkbox_result == false {
            process_events();
            clear_screen_to_white();
            draw_text_no_font_no_size("Test: checkbox_labeled".to_string(), color_black(), 10.0, 10.0);
            draw_text_no_font_no_size("Expected: A checkbox with text 'Check me' and label 'Test Checkbox' in a two-column layout".to_string(), color_black(), 10.0, 30.0);
            draw_text_no_font_no_size("Click the checkbox to end test".to_string(), color_black(), 10.0, 50.0);
            start_panel("Test Panel 10".to_string(), rectangle_from(0.0, 70.0, 800.0, 530.0));
            set_interface_label_width(110);
            current_checkbox_result = checkbox_labeled("Test Checkbox".to_string(), "Check me".to_string(), current_checkbox_result);
            end_panel("Test Panel 10".to_string());
            draw_interface();
            refresh_screen();
        }
        assert!(current_checkbox_result);
    }
    #[test]
    fn test_color_slider_at_position_integration() {
        open_window("Test Window 15".to_string(), 800, 600);
        let _cleanup_window = WindowCleanup::new();
        let initial_color = color_black();
        let mut current_color = initial_color;
        process_events();
        while key_down(KeyCode::SpaceKey) == false {
            process_events();
            clear_screen_to_white();
            draw_text_no_font_no_size("Test: color_slider_at_position".to_string(), color_black(), 10.0, 10.0);
            draw_text_no_font_no_size("Expected: A color slider using RGBA controls at position (100,100) with size 400x24".to_string(), color_black(), 10.0, 30.0);
            draw_text_no_font_no_size("Change the color and press space to pass".to_string(), color_black(), 10.0, 50.0);
            current_color = color_slider_at_position(current_color, rectangle_from(100.0, 100.0, 400.0, 24.0));
            draw_interface();
            refresh_screen();
        }
        assert_ne!(current_color, initial_color);
    }
    #[test]
    fn test_color_slider_integration() {
        open_window("Test Window 16".to_string(), 800, 600);
        let _cleanup_window = WindowCleanup::new();
        let initial_color = color_black();
        let mut current_color = initial_color;
        process_events();
        while key_down(KeyCode::SpaceKey) == false {
            process_events();
            clear_screen_to_white();
            draw_text_no_font_no_size("Test: color_slider".to_string(), color_black(), 10.0, 10.0);
            draw_text_no_font_no_size("Expected: A color slider with RGBA controls using default layout".to_string(), color_black(), 10.0, 30.0);
            draw_text_no_font_no_size("Change the color and press space to pass".to_string(), color_black(), 10.0, 50.0);
            start_panel("Test Panel 11".to_string(), rectangle_from(0.0, 70.0, 800.0, 530.0));
            current_color = color_slider(current_color);
            end_panel("Test Panel 11".to_string());
            draw_interface();
            refresh_screen();
        }
        assert!(!quit_requested());
    }
    #[test]
    fn test_color_slider_labeled_integration() {
        open_window("Test Window 17".to_string(), 800, 600);
        let _cleanup_window = WindowCleanup::new();
        let initial_color = color_black();
        let mut current_color = initial_color;
        process_events();
        while key_down(KeyCode::SpaceKey) == false {
            process_events();
            clear_screen_to_white();
            draw_text_no_font_no_size("Test: color_slider_labeled".to_string(), color_black(), 10.0, 10.0);
            draw_text_no_font_no_size("Expected: A color slider with label 'Test Color Slider' in a two-column layout".to_string(), color_black(), 10.0, 30.0);
            draw_text_no_font_no_size("Change the color and press space to pass".to_string(), color_black(), 10.0, 50.0);
            set_interface_label_width(120);
            start_panel("Test Panel 12".to_string(), rectangle_from(0.0, 70.0, 800.0, 530.0));
            current_color = color_slider_labeled("Test Color Slider".to_string(), current_color);
            end_panel("Test Panel 12".to_string());
            draw_interface();
            refresh_screen();
        }
        assert_ne!(initial_color, current_color);
    }
    #[test]
    fn test_disable_interface_integration() {
        open_window("Test Window 18".to_string(), 800, 600);
        let _cleanup_window = WindowCleanup::new();
        let mut button_clicked = false;
        assert!(interface_enabled());
        disable_interface();
        process_events();
        while key_down(KeyCode::SpaceKey) == false {
            process_events();
            clear_screen_to_white();
            draw_text_no_font_no_size("Test: disable_interface".to_string(), color_black(), 10.0, 10.0);
            draw_text_no_font_no_size("Expected: A button that is disabled".to_string(), color_black(), 10.0, 30.0);
            draw_text_no_font_no_size("Click the button and press space to verify that the button is disabled".to_string(), color_black(), 10.0, 50.0);
            start_panel("Test Panel 13".to_string(), rectangle_from(0.0, 70.0, 800.0, 530.0));
            button_clicked = button("Try to click me".to_string());
            end_panel("Test Panel 13".to_string());
            draw_interface();
            refresh_screen();
        }
        assert!(!interface_enabled());
        assert!(!button_clicked);
        enable_interface();
    }
    #[test]
    fn test_draw_interface_integration() {
        open_window("Test Window 19".to_string(), 800, 600);
        let _cleanup_window = WindowCleanup::new();
        process_events();
        while key_down(KeyCode::SpaceKey) == false {
            process_events();
            clear_screen_to_white();
            draw_text_no_font_no_size("Test: draw_interface".to_string(), color_black(), 10.0, 10.0);
            draw_text_no_font_no_size("Expected: A panel at position (100,100) with size 200x200".to_string(), color_black(), 10.0, 30.0);
            draw_text_no_font_no_size("Press space to end test".to_string(), color_black(), 10.0, 50.0);
            start_panel("Test Panel 14".to_string(), rectangle_from(100.0, 100.0, 200.0, 200.0));
            button("Test Button".to_string());
            end_panel("Test Panel 14".to_string());
            draw_interface();
            refresh_screen();
        }
    }
    #[test]
    fn test_enable_interface_integration() {
        open_window("Test Window 20".to_string(), 800, 600);
        let _cleanup_window = WindowCleanup::new();
        disable_interface();
        process_events();
        while key_down(KeyCode::SpaceKey) == false {
            process_events();
            clear_screen_to_white();
            draw_text_no_font_no_size("Test: enable_interface".to_string(), color_black(), 10.0, 10.0);
            draw_text_no_font_no_size("Expected: Button should be disabled".to_string(), color_black(), 10.0, 30.0);
            draw_text_no_font_no_size("Press space to continue".to_string(), color_black(), 10.0, 50.0);
            start_panel("Test Panel 15".to_string(), rectangle_from(0.0, 70.0, 800.0, 530.0));
            button("Test Button".to_string());
            end_panel("Test Panel 15".to_string());
            draw_interface();
            refresh_screen();
        }
        assert!(!interface_enabled());
        enable_interface();
        let mut button_clicked = false;
        while button_clicked == false {
            process_events();
            clear_screen_to_white();
            draw_text_no_font_no_size("Test: enable_interface".to_string(), color_black(), 10.0, 10.0);
            draw_text_no_font_no_size("Expected: Button should be enabled".to_string(), color_black(), 10.0, 30.0);
            draw_text_no_font_no_size("Click the button to end test".to_string(), color_black(), 10.0, 50.0);
            start_panel("Test Panel 16".to_string(), rectangle_from(0.0, 70.0, 800.0, 530.0));
            button_clicked = button("Test Button".to_string());
            end_panel("Test Panel 16".to_string());
            draw_interface();
            refresh_screen();
        }
        assert!(interface_enabled());
        assert!(button_clicked);
    }
    #[test]
    fn test_end_inset_integration() {
        open_window("Test Window 21".to_string(), 800, 600);
        let _cleanup_window = WindowCleanup::new();
        process_events();
        while key_down(KeyCode::SpaceKey) == false {
            process_events();
            clear_screen_to_white();
            draw_text_no_font_no_size("Test: end_inset".to_string(), color_black(), 10.0, 10.0);
            draw_text_no_font_no_size("Expected: An inset with height 60 pixels containing a button".to_string(), color_black(), 10.0, 30.0);
            draw_text_no_font_no_size("Press space to end test".to_string(), color_black(), 10.0, 50.0);
            start_panel("Test Panel 17".to_string(), rectangle_from(0.0, 70.0, 800.0, 530.0));
            start_inset("Test Inset".to_string(), 60);
            button("Test Button".to_string());
            end_inset("Test Inset".to_string());
            end_panel("Test Panel 17".to_string());
            draw_interface();
            refresh_screen();
        }
    }
    #[test]
    fn test_end_panel_integration() {
        open_window("Test Window 22".to_string(), 800, 600);
        let _cleanup_window = WindowCleanup::new();
        process_events();
        while key_down(KeyCode::SpaceKey) == false {
            process_events();
            clear_screen_to_white();
            draw_text_no_font_no_size("Test: end_panel".to_string(), color_black(), 10.0, 10.0);
            draw_text_no_font_no_size("Expected: A panel at position (100,100) with size 200x200 containing a button".to_string(), color_black(), 10.0, 30.0);
            draw_text_no_font_no_size("Press space to end test".to_string(), color_black(), 10.0, 50.0);
            start_panel("Test Panel 18".to_string(), rectangle_from(100.0, 100.0, 200.0, 200.0));
            button("Test Button".to_string());
            end_panel("Test Panel 18".to_string());
            draw_interface();
            refresh_screen();
        }
    }
    #[test]
    fn test_end_popup_integration() {
        open_window("Test Window 23".to_string(), 800, 600);
        let _cleanup_window = WindowCleanup::new();
        process_events();
        while key_down(KeyCode::SpaceKey) == false {
            process_events();
            clear_screen_to_white();
            draw_text_no_font_no_size("Test: end_popup".to_string(), color_black(), 10.0, 10.0);
            draw_text_no_font_no_size("Expected: Click the button to show a popup with a label".to_string(), color_black(), 10.0, 30.0);
            draw_text_no_font_no_size("Press space to end test".to_string(), color_black(), 10.0, 50.0);
            start_panel("Test Panel 19".to_string(), rectangle_from(0.0, 70.0, 800.0, 530.0));
            if button("Open Popup".to_string()) == true {
                open_popup("Test Popup".to_string());
            }
            if start_popup("Test Popup".to_string()) == true {
                single_line_layout();
                set_interface_label_width(200);
                label_element("Test Label".to_string());
                end_popup("Test Popup".to_string());
            }
            end_panel("Test Panel 19".to_string());
            draw_interface();
            refresh_screen();
        }
    }
    #[test]
    fn test_end_treenode_integration() {
        open_window("Test Window 24".to_string(), 800, 600);
        let _cleanup_window = WindowCleanup::new();
        process_events();
        while key_down(KeyCode::SpaceKey) == false {
            process_events();
            clear_screen_to_white();
            draw_text_no_font_no_size("Test: end_treenode".to_string(), color_black(), 10.0, 10.0);
            draw_text_no_font_no_size("Expected: A panel containing a collapsible tree node with a button".to_string(), color_black(), 10.0, 30.0);
            draw_text_no_font_no_size("Press space to end test".to_string(), color_black(), 10.0, 50.0);
            start_panel("Test Panel 20".to_string(), rectangle_from(10.0, 70.0, 200.0, 200.0));
            if start_treenode("Test Node".to_string()) == true {
                button("Test Button".to_string());
                end_treenode("Test Node".to_string());
            }
            end_panel("Test Panel 20".to_string());
            draw_interface();
            refresh_screen();
        }
    }
    #[test]
    fn test_enter_column_integration() {
        open_window("Test Window 25".to_string(), 800, 600);
        let _cleanup_window = WindowCleanup::new();
        process_events();
        while key_down(KeyCode::SpaceKey) == false {
            process_events();
            clear_screen_to_white();
            draw_text_no_font_no_size("Test: enter_column".to_string(), color_black(), 10.0, 10.0);
            draw_text_no_font_no_size("Expected: A panel with a 100-pixel wide column containing a button".to_string(), color_black(), 10.0, 30.0);
            draw_text_no_font_no_size("Test Button".to_string(), color_black(), 10.0, 50.0);
            start_panel("Test Panel 21".to_string(), rectangle_from(10.0, 70.0, 300.0, 200.0));
            add_column(100);
            enter_column();
            button("Test Button".to_string());
            leave_column();
            end_panel("Test Panel 21".to_string());
            draw_interface();
            refresh_screen();
        }
    }
    #[test]
    fn test_get_interface_label_width_integration() {
        process_events();
        set_interface_label_width(100);
        let test_label_width = get_interface_label_width();
        assert_eq!(100, test_label_width);
    }
    #[test]
    fn test_header_integration() {
        open_window("Test Window 26".to_string(), 800, 600);
        let _cleanup_window = WindowCleanup::new();
        process_events();
        while key_down(KeyCode::SpaceKey) == false {
            process_events();
            clear_screen_to_white();
            draw_text_no_font_no_size("Test: header".to_string(), color_black(), 10.0, 10.0);
            draw_text_no_font_no_size("Expected: A collapsible header labeled 'Test Header' with a button".to_string(), color_black(), 10.0, 30.0);
            draw_text_no_font_no_size("Press space to end test".to_string(), color_black(), 10.0, 50.0);
            start_panel("Test Panel 22".to_string(), rectangle_from(10.0, 70.0, 300.0, 200.0));
            if header("Test Header".to_string()) == true {
                button("Test Button".to_string());
            }
            end_panel("Test Panel 22".to_string());
            draw_interface();
            refresh_screen();
        }
    }
    #[test]
    fn test_hsb_color_slider_at_position_integration() {
        open_window("Test Window 27".to_string(), 800, 600);
        let _cleanup_window = WindowCleanup::new();
        let initial_color = color_black();
        let test_rect = rectangle_from(100.0, 100.0, 400.0, 24.0);
        let mut current_color = initial_color;
        process_events();
        while key_down(KeyCode::SpaceKey) == false {
            process_events();
            clear_screen_to_white();
            draw_text_no_font_no_size("Test: hsb_color_slider_at_position".to_string(), color_black(), 10.0, 10.0);
            draw_text_no_font_no_size("Expected: A HSB color slider at position (100,100) with size 400x24".to_string(), color_black(), 10.0, 30.0);
            draw_text_no_font_no_size("Change the color and press space to pass".to_string(), color_black(), 10.0, 50.0);
            current_color = hsb_color_slider_at_position(current_color, test_rect);
            draw_interface();
            refresh_screen();
        }
        assert_ne!(current_color, initial_color);
    }
    #[test]
    fn test_hsb_color_slider_integration() {
        open_window("Test Window 28".to_string(), 800, 600);
        let _cleanup_window = WindowCleanup::new();
        let initial_color = color_black();
        let mut current_color = initial_color;
        process_events();
        while key_down(KeyCode::SpaceKey) == false {
            process_events();
            clear_screen_to_white();
            draw_text_no_font_no_size("Test: hsb_color_slider".to_string(), color_black(), 10.0, 10.0);
            draw_text_no_font_no_size("Expected: A HSB color slider using default layout".to_string(), color_black(), 10.0, 30.0);
            draw_text_no_font_no_size("Change the color and press space to pass".to_string(), color_black(), 10.0, 50.0);
            start_panel("Test Panel 23".to_string(), rectangle_from(0.0, 70.0, 800.0, 530.0));
            current_color = hsb_color_slider(current_color);
            end_panel("Test Panel 23".to_string());
            draw_interface();
            refresh_screen();
        }
        assert_ne!(current_color, initial_color);
    }
    #[test]
    fn test_hsb_color_slider_labeled_integration() {
        open_window("Test Window 29".to_string(), 800, 600);
        let _cleanup_window = WindowCleanup::new();
        let initial_color = color_black();
        let mut current_color = initial_color;
        process_events();
        while key_down(KeyCode::SpaceKey) == false {
            process_events();
            clear_screen_to_white();
            draw_text_no_font_no_size("Test: hsb_color_slider_labeled".to_string(), color_black(), 10.0, 10.0);
            draw_text_no_font_no_size("Expected: A HSB color slider with label 'Color Slider' in a two-column layout".to_string(), color_black(), 10.0, 30.0);
            draw_text_no_font_no_size("Change the color and press space to pass".to_string(), color_black(), 10.0, 50.0);
            start_panel("Test Panel 24".to_string(), rectangle_from(0.0, 70.0, 800.0, 530.0));
            set_interface_label_width(100);
            current_color = hsb_color_slider_labeled("Color Slider".to_string(), current_color);
            end_panel("Test Panel 24".to_string());
            draw_interface();
            refresh_screen();
        }
        assert_ne!(current_color, initial_color);
    }
    #[test]
    fn test_interface_enabled_integration() {
        let _cleanup_window = WindowCleanup::new();
        let initial_state = interface_enabled();
        assert!(initial_state);
        disable_interface();
        let disabled_state = interface_enabled();
        assert!(!disabled_state);
        enable_interface();
        let enabled_state = interface_enabled();
        assert!(enabled_state);
    }
    #[test]
    fn test_interface_style_panel_integration() {
        let _layout_cleanup = LayoutCleanup::new();
        open_window("Test Window 30".to_string(), 800, 600);
        let _cleanup_window = WindowCleanup::new();
        let panel_rectangle = rectangle_from(0.0, 70.0, 800.0, 530.0);
        process_events();
        while key_down(KeyCode::SpaceKey) == false {
            process_events();
            clear_screen_to_white();
            draw_text_no_font_no_size("Test: interface_style_panel".to_string(), color_black(), 10.0, 10.0);
            draw_text_no_font_no_size("Expected: A panel with controls to adjust the interface style".to_string(), color_black(), 10.0, 30.0);
            draw_text_no_font_no_size("Adjust the style and press space to end test".to_string(), color_black(), 10.0, 50.0);
            interface_style_panel(panel_rectangle);
            draw_interface();
            refresh_screen();
        }
    }
    #[test]
    fn test_label_element_integration() {
        open_window("Test Window 31".to_string(), 800, 600);
        let _cleanup_window = WindowCleanup::new();
        process_events();
        while key_down(KeyCode::SpaceKey) == false {
            process_events();
            clear_screen_to_white();
            draw_text_no_font_no_size("Test: label_element".to_string(), color_black(), 10.0, 10.0);
            draw_text_no_font_no_size("Expected: A label with text 'Test Label' using default layout".to_string(), color_black(), 10.0, 30.0);
            draw_text_no_font_no_size("Press space to end test".to_string(), color_black(), 10.0, 50.0);
            start_panel("Test Panel 25".to_string(), rectangle_from(0.0, 70.0, 800.0, 530.0));
            label_element("Test Label".to_string());
            end_panel("Test Panel 25".to_string());
            draw_interface();
            refresh_screen();
        }
    }
    #[test]
    fn test_label_element_at_position_integration() {
        open_window("Test Window 32".to_string(), 800, 600);
        let _cleanup_window = WindowCleanup::new();
        let test_rectangle = rectangle_from(100.0, 100.0, 200.0, 50.0);
        process_events();
        while key_down(KeyCode::SpaceKey) == false {
            process_events();
            clear_screen_to_white();
            draw_text_no_font_no_size("Test: label_element_at_position".to_string(), color_black(), 10.0, 10.0);
            draw_text_no_font_no_size("Expected: A label with text 'Test Label' at position (100,100)".to_string(), color_black(), 10.0, 30.0);
            draw_text_no_font_no_size("Press space to end test".to_string(), color_black(), 10.0, 50.0);
            label_element_at_position("Test Label".to_string(), test_rectangle);
            draw_interface();
            refresh_screen();
        }
    }
    #[test]
    fn test_last_element_changed_integration() {
        open_window("Test Window 33".to_string(), 800, 600);
        let _cleanup_window = WindowCleanup::new();
        let initial_value = 0.0 as f32;
        let mut current_value = 0.0 as f32;
        let mut element_changed = false;
        process_events();
        while key_down(KeyCode::SpaceKey) == false {
            process_events();
            clear_screen_to_white();
            draw_text_no_font_no_size("Test: last_element_changed".to_string(), color_black(), 10.0, 10.0);
            draw_text_no_font_no_size("Expected: A slider that detects value changes".to_string(), color_black(), 10.0, 30.0);
            draw_text_no_font_no_size("Move the slider and press space to pass".to_string(), color_black(), 10.0, 50.0);
            start_panel("Test Panel 26".to_string(), rectangle_from(0.0, 70.0, 800.0, 530.0));
            current_value = slider_labeled("Test Slider".to_string(), current_value, 0.0 as f32, 100.0 as f32);
            if last_element_changed() == true {
                element_changed = true;
            }
            end_panel("Test Panel 26".to_string());
            draw_interface();
            refresh_screen();
        }
        assert_ne!(current_value, initial_value);
        assert!(element_changed);
    }
    #[test]
    fn test_last_element_confirmed_integration() {
        open_window("Test Window 34".to_string(), 800, 600);
        let _cleanup_window = WindowCleanup::new();
        let mut button_clicked = false;
        process_events();
        while key_down(KeyCode::SpaceKey) == false {
            process_events();
            clear_screen_to_white();
            draw_text_no_font_no_size("Test: last_element_confirmed".to_string(), color_black(), 10.0, 10.0);
            draw_text_no_font_no_size("Expected: A button that detects when clicked".to_string(), color_black(), 10.0, 30.0);
            draw_text_no_font_no_size("Click the button and press space to pass".to_string(), color_black(), 10.0, 50.0);
            start_panel("Test Panel 27".to_string(), rectangle_from(0.0, 70.0, 800.0, 530.0));
            button("Test Button".to_string());
            if last_element_confirmed() == true {
                button_clicked = true;
            }
            end_panel("Test Panel 27".to_string());
            draw_interface();
            refresh_screen();
        }
        assert!(button_clicked);
    }
    #[test]
    fn test_leave_column_integration() {
        open_window("Test Window 35".to_string(), 800, 600);
        let _cleanup_window = WindowCleanup::new();
        process_events();
        while key_down(KeyCode::SpaceKey) == false {
            process_events();
            clear_screen_to_white();
            draw_text_no_font_no_size("Test: leave_column".to_string(), color_black(), 10.0, 10.0);
            draw_text_no_font_no_size("Expected: A button that appears after leaving a column with a width of 100".to_string(), color_black(), 10.0, 30.0);
            draw_text_no_font_no_size("Press space to end test".to_string(), color_black(), 10.0, 50.0);
            start_panel("Test Panel 28".to_string(), rectangle_from(10.0, 70.0, 300.0, 200.0));
            start_custom_layout();
            add_column(100);
            add_column(-1);
            enter_column();
            leave_column();
            button("Test Button".to_string());
            end_panel("Test Panel 28".to_string());
            draw_interface();
            refresh_screen();
        }
    }
    #[test]
    fn test_number_box_at_position_integration() {
        open_window("Test Window 36".to_string(), 800, 600);
        let _cleanup_window = WindowCleanup::new();
        let test_rect = rectangle_from(100.0, 100.0, 200.0, 30.0);
        let mut test_result = 5.0 as f32;
        process_events();
        while key_down(KeyCode::SpaceKey) == false {
            process_events();
            clear_screen_to_white();
            draw_text_no_font_no_size("Test: number_box_at_position".to_string(), color_black(), 10.0, 10.0);
            draw_text_no_font_no_size("Expected: A number box at position (100,100) with size 200x30".to_string(), color_black(), 10.0, 30.0);
            draw_text_no_font_no_size("Change the number and press space to pass".to_string(), color_black(), 10.0, 50.0);
            test_result = number_box_at_position(test_result, 1.0 as f32, test_rect);
            draw_interface();
            refresh_screen();
        }
        assert_ne!(5.0 as f32, test_result);
    }
    #[test]
    fn test_number_box_integration() {
        open_window("Test Window 37".to_string(), 800, 600);
        let _cleanup_window = WindowCleanup::new();
        let mut test_result = 5.0 as f32;
        process_events();
        while key_down(KeyCode::SpaceKey) == false {
            process_events();
            clear_screen_to_white();
            draw_text_no_font_no_size("Test: number_box".to_string(), color_black(), 10.0, 10.0);
            draw_text_no_font_no_size("Expected: A number box with step size 1.0 using the default layout".to_string(), color_black(), 10.0, 30.0);
            draw_text_no_font_no_size("Change the number and press space to pass".to_string(), color_black(), 10.0, 50.0);
            start_panel("Test Panel 29".to_string(), rectangle_from(10.0, 70.0, 300.0, 200.0));
            test_result = number_box(test_result, 1.0 as f32);
            end_panel("Test Panel 29".to_string());
            draw_interface();
            refresh_screen();
        }
        assert_ne!(5.0 as f32, test_result);
    }
    #[test]
    fn test_number_box_labeled_integration() {
        open_window("Test Window 38".to_string(), 800, 600);
        let _cleanup_window = WindowCleanup::new();
        let mut test_result = 5.0 as f32;
        process_events();
        while key_down(KeyCode::SpaceKey) == false {
            process_events();
            clear_screen_to_white();
            draw_text_no_font_no_size("Test: number_box_labeled".to_string(), color_black(), 10.0, 10.0);
            draw_text_no_font_no_size("Expected: A labeled number box with step size 1.0 using the default layout".to_string(), color_black(), 10.0, 30.0);
            draw_text_no_font_no_size("Change the number and press space to pass".to_string(), color_black(), 10.0, 50.0);
            start_panel("Test Panel 30".to_string(), rectangle_from(10.0, 70.0, 300.0, 200.0));
            set_interface_label_width(100);
            test_result = number_box_labeled("Test Value".to_string(), test_result, 1.0 as f32);
            end_panel("Test Panel 30".to_string());
            draw_interface();
            refresh_screen();
        }
        assert_ne!(5.0 as f32, test_result);
    }
    #[test]
    fn test_open_popup_integration() {
        open_window("Test Window 39".to_string(), 800, 600);
        let _cleanup_window = WindowCleanup::new();
        process_events();
        while key_down(KeyCode::SpaceKey) == false {
            process_events();
            clear_screen_to_white();
            draw_text_no_font_no_size("Test: open_popup".to_string(), color_black(), 10.0, 10.0);
            draw_text_no_font_no_size("Expected: Click the button to show a popup with a label".to_string(), color_black(), 10.0, 30.0);
            draw_text_no_font_no_size("Press space to end test".to_string(), color_black(), 10.0, 50.0);
            start_panel("Test Panel 31".to_string(), rectangle_from(0.0, 70.0, 800.0, 530.0));
            if button("Open Popup".to_string()) == true {
                open_popup("Test Popup".to_string());
            }
            if start_popup("Test Popup".to_string()) == true {
                single_line_layout();
                set_interface_label_width(200);
                label_element("Test Label".to_string());
                end_popup("Test Popup".to_string());
            }
            end_panel("Test Panel 31".to_string());
            draw_interface();
            refresh_screen();
        }
    }
    #[test]
    fn test_paragraph_integration() {
        let _layout_cleanup = LayoutCleanup::new();
        open_window("Test Window 40".to_string(), 800, 600);
        let _cleanup_window = WindowCleanup::new();
        process_events();
        set_interface_font(load_font("hara".to_string(), "hara.ttf".to_string()));
        let _cleanup_interface_font = InterfaceFontCleanup::new();
        let _cleanup_font = FontCleanup::new();
        set_interface_font_size(12);
        while key_down(KeyCode::SpaceKey) == false {
            process_events();
            clear_screen_to_white();
            draw_text_no_font_no_size("Test: paragraph".to_string(), color_black(), 10.0, 10.0);
            draw_text_no_font_no_size("Expected: A paragraph of text that wraps correctly within the panel".to_string(), color_black(), 10.0, 30.0);
            draw_text_no_font_no_size("Press space to end test".to_string(), color_black(), 10.0, 50.0);
            start_panel("Test Panel 32".to_string(), rectangle_from(10.0, 70.0, 300.0, 200.0));
            paragraph("This is a test paragraph to check if the text wraps correctly. weguy YGWE FYw eiuofhWEOF wue fuhwbeuf WUEFU wue".to_string());
            end_panel("Test Panel 32".to_string());
            draw_interface();
            refresh_screen();
        }
        set_interface_font_size(13);
    }
    #[test]
    fn test_paragraph_at_position_integration() {
        open_window("Test Window 41".to_string(), 800, 600);
        let _cleanup_window = WindowCleanup::new();
        let test_rectangle = rectangle_from(100.0, 100.0, 200.0, 100.0);
        process_events();
        while key_down(KeyCode::SpaceKey) == false {
            process_events();
            clear_screen_to_white();
            draw_text_no_font_no_size("Test: paragraph_at_position".to_string(), color_black(), 10.0, 10.0);
            draw_text_no_font_no_size("Expected: A paragraph at position (100,100) with size 200x100".to_string(), color_black(), 10.0, 30.0);
            draw_text_no_font_no_size("Press space to end test".to_string(), color_black(), 10.0, 50.0);
            paragraph_at_position("This is a test paragraph to check if the text wraps correctly. weguy YGWE FYw eiuofhWEOF wue fuhwbeuf WUEFU wue".to_string(), test_rectangle);
            draw_interface();
            refresh_screen();
        }
    }
    #[test]
    fn test_reset_layout_integration() {
        open_window("Test Window 42".to_string(), 800, 600);
        let _cleanup_window = WindowCleanup::new();
        process_events();
        while key_down(KeyCode::SpaceKey) == false {
            process_events();
            clear_screen_to_white();
            draw_text_no_font_no_size("Test: reset_layout".to_string(), color_black(), 10.0, 10.0);
            draw_text_no_font_no_size("Expected: The second button should not be confined to the created columns after reset".to_string(), color_black(), 10.0, 30.0);
            draw_text_no_font_no_size("Press space to end test".to_string(), color_black(), 10.0, 50.0);
            start_panel("Test Panel 33".to_string(), rectangle_from(10.0, 70.0, 300.0, 200.0));
            start_custom_layout();
            add_column(200);
            add_column(-1);
            button("Button 1".to_string());
            reset_layout();
            button("Button 2".to_string());
            end_panel("Test Panel 33".to_string());
            draw_interface();
            refresh_screen();
        }
    }
    #[test]
    fn test_set_interface_accent_color_integration() {
        let _layout_cleanup = LayoutCleanup::new();
        open_window("Test Window 43".to_string(), 800, 600);
        let _cleanup_window = WindowCleanup::new();
        process_events();
        set_interface_accent_color(color_red(), 0.5 as f32);
        while key_down(KeyCode::SpaceKey) == false {
            process_events();
            clear_screen_to_white();
            draw_text_no_font_no_size("Test: set_interface_accent_color".to_string(), color_black(), 10.0, 10.0);
            draw_text_no_font_no_size("Expected: A button with red accent color at 50% contrast".to_string(), color_black(), 10.0, 30.0);
            draw_text_no_font_no_size("Press space to end test".to_string(), color_black(), 10.0, 50.0);
            start_panel("Test Panel 34".to_string(), rectangle_from(10.0, 70.0, 300.0, 200.0));
            button("Test Button".to_string());
            end_panel("Test Panel 34".to_string());
            draw_interface();
            refresh_screen();
        }
    }
    #[test]
    fn test_set_interface_border_color_integration() {
        let _layout_cleanup = LayoutCleanup::new();
        open_window("Test Window 44".to_string(), 800, 600);
        let _cleanup_window = WindowCleanup::new();
        process_events();
        set_interface_border_color(color_red());
        while key_down(KeyCode::SpaceKey) == false {
            process_events();
            clear_screen_to_white();
            draw_text_no_font_no_size("Test: set_interface_border_color".to_string(), color_black(), 10.0, 10.0);
            draw_text_no_font_no_size("Expected: A panel and button with red borders".to_string(), color_black(), 10.0, 30.0);
            draw_text_no_font_no_size("Press space to end test".to_string(), color_black(), 10.0, 50.0);
            start_panel("Test Panel 35".to_string(), rectangle_from(10.0, 70.0, 300.0, 200.0));
            button("Test Button".to_string());
            end_panel("Test Panel 35".to_string());
            draw_interface();
            refresh_screen();
        }
    }
    #[test]
    fn test_set_interface_colors_auto_integration() {
        let _layout_cleanup = LayoutCleanup::new();
        open_window("Test Window 45".to_string(), 800, 600);
        let _cleanup_window = WindowCleanup::new();
        process_events();
        set_interface_colors_auto(color_white(), color_blue(), 0.5 as f32, 0.7 as f32, 0.3 as f32);
        while key_down(KeyCode::SpaceKey) == false {
            process_events();
            clear_screen_to_white();
            draw_text_no_font_no_size("Test: set_interface_colors_auto".to_string(), color_black(), 10.0, 10.0);
            draw_text_no_font_no_size("Expected: A panel with white main color and blue accent color".to_string(), color_black(), 10.0, 30.0);
            draw_text_no_font_no_size("Press space to end test".to_string(), color_black(), 10.0, 70.0);
            start_panel("Test Panel 36".to_string(), rectangle_from(10.0, 90.0, 300.0, 200.0));
            button("Test Button".to_string());
            end_panel("Test Panel 36".to_string());
            draw_interface();
            refresh_screen();
        }
    }
    #[test]
    fn test_set_interface_element_color_integration() {
        let _layout_cleanup = LayoutCleanup::new();
        open_window("Test Window 46".to_string(), 800, 600);
        let _cleanup_window = WindowCleanup::new();
        process_events();
        set_interface_element_color(color_black(), 0.5 as f32);
        while key_down(KeyCode::SpaceKey) == false {
            process_events();
            clear_screen_to_white();
            draw_text_no_font_no_size("Test: set_interface_element_color".to_string(), color_black(), 10.0, 10.0);
            draw_text_no_font_no_size("Expected: A panel with black element color at 50% contrast".to_string(), color_black(), 10.0, 30.0);
            draw_text_no_font_no_size("Press space to end test".to_string(), color_black(), 10.0, 50.0);
            start_panel("Test Panel 37".to_string(), rectangle_from(10.0, 70.0, 300.0, 200.0));
            button("Test Button".to_string());
            end_panel("Test Panel 37".to_string());
            draw_interface();
            refresh_screen();
        }
    }
    #[test]
    fn test_set_interface_element_shadows_integration() {
        let _layout_cleanup = LayoutCleanup::new();
        open_window("Test Window 47".to_string(), 800, 600);
        let _cleanup_window = WindowCleanup::new();
        process_events();
        set_interface_element_shadows(10, color_blue(), point_at(5.0, 5.0));
        while key_down(KeyCode::SpaceKey) == false {
            process_events();
            clear_screen_to_white();
            draw_text_no_font_no_size("Test: set_interface_element_shadows".to_string(), color_black(), 10.0, 10.0);
            draw_text_no_font_no_size("Expected: Elements with blue shadow (radius: 10, offset: 5,5)".to_string(), color_black(), 10.0, 30.0);
            draw_text_no_font_no_size("Press space to end test".to_string(), color_black(), 10.0, 50.0);
            start_panel("Test Panel 38".to_string(), rectangle_from(10.0, 70.0, 300.0, 200.0));
            button("Test Button".to_string());
            end_panel("Test Panel 38".to_string());
            draw_interface();
            refresh_screen();
        }
    }
    #[test]
    fn test_set_interface_font_font_as_string_integration() {
        let _layout_cleanup = LayoutCleanup::new();
        open_window("Test Window 48".to_string(), 800, 600);
        let _cleanup_window = WindowCleanup::new();
        load_font("hara".to_string(), "hara.ttf".to_string());
        let _cleanup_interface_font = InterfaceFontCleanup::new();
        let _cleanup_font = FontCleanup::new();
        load_font("demolition".to_string(), "demolition.otf".to_string());
        process_events();
        while key_down(KeyCode::SpaceKey) == false {
            process_events();
            clear_screen_to_white();
            draw_text_no_font_no_size("Test: set_interface_font_font_as_string".to_string(), color_black(), 10.0, 10.0);
            draw_text_no_font_no_size("Press space to end test".to_string(), color_black(), 10.0, 30.0);
            set_interface_font_font_as_string("hara".to_string());
            start_panel("Hara Font".to_string(), rectangle_from(10.0, 70.0, 300.0, 100.0));
            label_element("This text uses Hara font".to_string());
            end_panel("Hara Font".to_string());
            set_interface_font_font_as_string("demolition".to_string());
            start_panel("Demolition Font".to_string(), rectangle_from(10.0, 180.0, 300.0, 100.0));
            label_element("This text uses Demolition font".to_string());
            end_panel("Demolition Font".to_string());
            draw_interface();
            refresh_screen();
        }
    }
    #[test]
    fn test_set_interface_font_integration() {
        let _layout_cleanup = LayoutCleanup::new();
        open_window("Test Window 49".to_string(), 800, 600);
        let _cleanup_window = WindowCleanup::new();
        let hara_font = load_font("hara".to_string(), "hara.ttf".to_string());
        let _cleanup_interface_font = InterfaceFontCleanup::new();
        let _cleanup_font = FontCleanup::new();
        let demolition_font = load_font("demolition".to_string(), "demolition.otf".to_string());
        process_events();
        while key_down(KeyCode::SpaceKey) == false {
            process_events();
            clear_screen_to_white();
            draw_text_no_font_no_size("Test: set_interface_font".to_string(), color_black(), 10.0, 10.0);
            draw_text_no_font_no_size("Press space to end test".to_string(), color_black(), 10.0, 30.0);
            set_interface_font(hara_font);
            start_panel("Hara Font".to_string(), rectangle_from(10.0, 70.0, 300.0, 100.0));
            label_element("This text uses Hara font".to_string());
            end_panel("Hara Font".to_string());
            set_interface_font(demolition_font);
            start_panel("Demolition Font".to_string(), rectangle_from(10.0, 180.0, 300.0, 100.0));
            label_element("This text uses Demolition font".to_string());
            end_panel("Demolition Font".to_string());
            draw_interface();
            refresh_screen();
        }
    }
    #[test]
    fn test_set_interface_font_size_integration() {
        let _layout_cleanup = LayoutCleanup::new();
        open_window("Test Window 50".to_string(), 800, 600);
        let _cleanup_window = WindowCleanup::new();
        process_events();
        while key_down(KeyCode::SpaceKey) == false {
            process_events();
            clear_screen_to_white();
            draw_text_no_font_no_size("Test: set_interface_font_size".to_string(), color_black(), 10.0, 10.0);
            draw_text_no_font_no_size("Press space to end test".to_string(), color_black(), 10.0, 30.0);
            set_interface_font_size(12);
            start_panel("Small Font".to_string(), rectangle_from(10.0, 70.0, 300.0, 100.0));
            label_element("This text uses 12pt font size".to_string());
            end_panel("Small Font".to_string());
            set_interface_font_size(16);
            start_panel("Medium Font".to_string(), rectangle_from(10.0, 180.0, 300.0, 100.0));
            label_element("This text uses 16pt font size".to_string());
            end_panel("Medium Font".to_string());
            set_interface_font_size(24);
            start_panel("Large Font".to_string(), rectangle_from(10.0, 290.0, 300.0, 100.0));
            label_element("This text uses 24pt font size".to_string());
            end_panel("Large Font".to_string());
            draw_interface();
            refresh_screen();
        }
        set_interface_font_size(13);
    }
    #[test]
    fn test_set_interface_label_width_integration() {
        open_window("Test Window 51".to_string(), 800, 600);
        let _cleanup_window = WindowCleanup::new();
        set_interface_label_width(100);
        assert_eq!(100, get_interface_label_width());
    }
    #[test]
    fn test_set_interface_panel_shadows_integration() {
        let _layout_cleanup = LayoutCleanup::new();
        open_window("Test Window 52".to_string(), 800, 600);
        let _cleanup_window = WindowCleanup::new();
        process_events();
        set_interface_panel_shadows(10, color_blue(), point_at(5.0, 5.0));
        while key_down(KeyCode::SpaceKey) == false {
            process_events();
            clear_screen_to_white();
            draw_text_no_font_no_size("Test: set_interface_panel_shadows".to_string(), color_black(), 10.0, 10.0);
            draw_text_no_font_no_size("Expected: A panel with blue shadow (10px radius, 5px offset)".to_string(), color_black(), 10.0, 30.0);
            draw_text_no_font_no_size("Press space to end test".to_string(), color_black(), 10.0, 50.0);
            start_panel("Test Panel 39".to_string(), rectangle_from(10.0, 70.0, 300.0, 200.0));
            button("Test Button".to_string());
            end_panel("Test Panel 39".to_string());
            draw_interface();
            refresh_screen();
        }
    }
    #[test]
    fn test_set_interface_root_text_color_integration() {
        let _layout_cleanup = LayoutCleanup::new();
        open_window("Test Window 53".to_string(), 800, 600);
        let _cleanup_window = WindowCleanup::new();
        process_events();
        set_interface_root_text_color(color_red());
        while key_down(KeyCode::SpaceKey) == false {
            process_events();
            clear_screen_to_white();
            draw_text_no_font_no_size("Test: set_interface_root_text_color".to_string(), color_black(), 10.0, 10.0);
            draw_text_no_font_no_size("Expected: Text outside panels should be red, text inside panels unchanged".to_string(), color_black(), 10.0, 30.0);
            draw_text_no_font_no_size("Press space to end test".to_string(), color_black(), 10.0, 50.0);
            label_element_at_position("This text should be red (outside panel)".to_string(), rectangle_from(10.0, 90.0, 300.0, 20.0));
            start_panel("Test Panel 40".to_string(), rectangle_from(10.0, 120.0, 300.0, 200.0));
            label_element("This text should be normal (inside panel)".to_string());
            end_panel("Test Panel 40".to_string());
            draw_interface();
            refresh_screen();
        }
    }
    #[test]
    fn test_set_interface_shadows_integration() {
        let _layout_cleanup = LayoutCleanup::new();
        open_window("Test Window 54".to_string(), 800, 600);
        let _cleanup_window = WindowCleanup::new();
        process_events();
        set_interface_shadows(10, color_blue(), point_at(5.0, 5.0));
        while key_down(KeyCode::SpaceKey) == false {
            process_events();
            clear_screen_to_white();
            draw_text_no_font_no_size("Test: set_interface_shadows".to_string(), color_black(), 10.0, 10.0);
            draw_text_no_font_no_size("Expected: Panel and button with blue shadows (10px radius, 5px offset)".to_string(), color_black(), 10.0, 30.0);
            draw_text_no_font_no_size("Press space to end test".to_string(), color_black(), 10.0, 50.0);
            start_panel("Test Panel 41".to_string(), rectangle_from(10.0, 70.0, 300.0, 200.0));
            button("Test Button".to_string());
            end_panel("Test Panel 41".to_string());
            draw_interface();
            refresh_screen();
        }
    }
    #[test]
    fn test_set_interface_spacing_integration() {
        let _layout_cleanup = LayoutCleanup::new();
        open_window("Test Window 55".to_string(), 800, 600);
        let _cleanup_window = WindowCleanup::new();
        set_interface_spacing(10, 5);
        process_events();
        while key_down(KeyCode::SpaceKey) == false {
            process_events();
            clear_screen_to_white();
            draw_text_no_font_no_size("Test: set_interface_spacing".to_string(), color_black(), 10.0, 10.0);
            draw_text_no_font_no_size("Expected: Panel with buttons spaced 10px apart and 5px padding".to_string(), color_black(), 10.0, 30.0);
            draw_text_no_font_no_size("Press space to end test".to_string(), color_black(), 10.0, 50.0);
            start_panel("Test Panel 42".to_string(), rectangle_from(10.0, 70.0, 300.0, 200.0));
            button("Button 1".to_string());
            button("Button 2".to_string());
            end_panel("Test Panel 42".to_string());
            draw_interface();
            refresh_screen();
        }
    }
    #[test]
    fn test_set_interface_style_integration() {
        let _layout_cleanup = LayoutCleanup::new();
        open_window("Test Window 56".to_string(), 800, 600);
        let _cleanup_window = WindowCleanup::new();
        process_events();
        set_interface_style(InterfaceStyle::BubbleMulticolored);
        while key_down(KeyCode::SpaceKey) == false {
            process_events();
            clear_screen_to_white();
            draw_text_no_font_no_size("Test: set_interface_style".to_string(), color_black(), 10.0, 10.0);
            draw_text_no_font_no_size("Expected: Panel and button with bubble multicolored style theme".to_string(), color_black(), 10.0, 30.0);
            draw_text_no_font_no_size("Press space to end test".to_string(), color_black(), 10.0, 50.0);
            start_panel("Test Panel 43".to_string(), rectangle_from(10.0, 70.0, 300.0, 200.0));
            button("Test Button".to_string());
            end_panel("Test Panel 43".to_string());
            draw_interface();
            refresh_screen();
        }
    }
    #[test]
    fn test_set_interface_style_with_color_integration() {
        let _layout_cleanup = LayoutCleanup::new();
        open_window("Test Window 57".to_string(), 800, 600);
        let _cleanup_window = WindowCleanup::new();
        process_events();
        set_interface_style_with_color(InterfaceStyle::ShadedDarkStyle, color_blue());
        while key_down(KeyCode::SpaceKey) == false {
            process_events();
            clear_screen_to_white();
            draw_text_no_font_no_size("Test: set_interface_style_with_color".to_string(), color_black(), 10.0, 10.0);
            draw_text_no_font_no_size("Expected: Panel and button with shaded dark style theme in blue".to_string(), color_black(), 10.0, 30.0);
            draw_text_no_font_no_size("Press space to end test".to_string(), color_black(), 10.0, 50.0);
            start_panel("Test Panel 44".to_string(), rectangle_from(10.0, 70.0, 300.0, 200.0));
            button("Test Button".to_string());
            end_panel("Test Panel 44".to_string());
            draw_interface();
            refresh_screen();
        }
    }
    #[test]
    fn test_set_interface_text_color_integration() {
        let _layout_cleanup = LayoutCleanup::new();
        open_window("Test Window 58".to_string(), 800, 600);
        let _cleanup_window = WindowCleanup::new();
        process_events();
        set_interface_text_color(color_red());
        while key_down(KeyCode::SpaceKey) == false {
            process_events();
            clear_screen_to_white();
            draw_text_no_font_no_size("Test: set_interface_text_color".to_string(), color_black(), 10.0, 10.0);
            draw_text_no_font_no_size("Expected: Panel with red text inside".to_string(), color_black(), 10.0, 30.0);
            draw_text_no_font_no_size("Press space to end test".to_string(), color_black(), 10.0, 50.0);
            start_panel("Test Panel 45".to_string(), rectangle_from(10.0, 70.0, 300.0, 200.0));
            label_element("This text should be red".to_string());
            end_panel("Test Panel 45".to_string());
            draw_interface();
            refresh_screen();
        }
    }
    #[test]
    fn test_set_layout_height_integration() {
        let _layout_cleanup = LayoutCleanup::new();
        open_window("Test Window 59".to_string(), 800, 600);
        let _cleanup_window = WindowCleanup::new();
        process_events();
        while key_down(KeyCode::SpaceKey) == false {
            process_events();
            clear_screen_to_white();
            draw_text_no_font_no_size("Test: set_layout_height".to_string(), color_black(), 10.0, 10.0);
            draw_text_no_font_no_size("Expected: Button with 100px height".to_string(), color_black(), 10.0, 30.0);
            draw_text_no_font_no_size("Press space to end test".to_string(), color_black(), 10.0, 50.0);
            start_panel("Test Panel 46".to_string(), rectangle_from(10.0, 70.0, 300.0, 200.0));
            set_layout_height(100);
            button("Test Button".to_string());
            end_panel("Test Panel 46".to_string());
            draw_interface();
            refresh_screen();
        }
    }
    #[test]
    fn test_single_line_layout_integration() {
        open_window("Test Window 60".to_string(), 800, 600);
        let _cleanup_window = WindowCleanup::new();
        process_events();
        while key_down(KeyCode::SpaceKey) == false {
            process_events();
            clear_screen_to_white();
            draw_text_no_font_no_size("Test: single_line_layout".to_string(), color_black(), 10.0, 10.0);
            draw_text_no_font_no_size("Expected: Two buttons arranged horizontally in a single line".to_string(), color_black(), 10.0, 30.0);
            draw_text_no_font_no_size("Press space to end test".to_string(), color_black(), 10.0, 50.0);
            start_panel("Test Panel 47".to_string(), rectangle_from(10.0, 70.0, 300.0, 200.0));
            single_line_layout();
            button("Button 1".to_string());
            button("Button 2".to_string());
            end_panel("Test Panel 47".to_string());
            draw_interface();
            refresh_screen();
        }
    }
    #[test]
    fn test_slider_at_position_integration() {
        open_window("Test Window 61".to_string(), 800, 600);
        let _cleanup_window = WindowCleanup::new();
        let test_rect = rectangle_from(100.0, 100.0, 200.0, 20.0);
        let initial_value = 50.0 as f32;
        let mut slider_result = initial_value;
        process_events();
        while key_down(KeyCode::SpaceKey) == false {
            process_events();
            clear_screen_to_white();
            draw_text_no_font_no_size("Test: slider_at_position".to_string(), color_black(), 10.0, 10.0);
            draw_text_no_font_no_size("Expected: Slider with initial value 50, range 0-100 at position (100,100)".to_string(), color_black(), 10.0, 30.0);
            draw_text_no_font_no_size("Change the value and press space to pass".to_string(), color_black(), 10.0, 50.0);
            slider_result = slider_at_position(slider_result, 0.0 as f32, 100.0 as f32, test_rect);
            draw_interface();
            refresh_screen();
        }
        assert_ne!(initial_value, slider_result);
    }
    #[test]
    fn test_slider_integration() {
        open_window("Test Window 62".to_string(), 800, 600);
        let _cleanup_window = WindowCleanup::new();
        let initial_value = 50.0 as f32;
        let mut slider_result = initial_value;
        process_events();
        while key_down(KeyCode::SpaceKey) == false {
            process_events();
            clear_screen_to_white();
            draw_text_no_font_no_size("Test: slider".to_string(), color_black(), 10.0, 10.0);
            draw_text_no_font_no_size("Expected: Slider with initial value 50, range 0-100 using default layout".to_string(), color_black(), 10.0, 30.0);
            draw_text_no_font_no_size("Change the value and press space to pass".to_string(), color_black(), 10.0, 50.0);
            start_panel("Test Panel 48".to_string(), rectangle_from(10.0, 70.0, 300.0, 200.0));
            slider_result = slider(slider_result, 0.0 as f32, 100.0 as f32);
            end_panel("Test Panel 48".to_string());
            draw_interface();
            refresh_screen();
        }
        assert_ne!(initial_value, slider_result);
    }
    #[test]
    fn test_slider_labeled_integration() {
        open_window("Test Window 63".to_string(), 800, 600);
        let _cleanup_window = WindowCleanup::new();
        let initial_value = 50.0 as f32;
        let mut slider_result = initial_value;
        process_events();
        while key_down(KeyCode::SpaceKey) == false {
            process_events();
            clear_screen_to_white();
            draw_text_no_font_no_size("Test: slider_labeled".to_string(), color_black(), 10.0, 10.0);
            draw_text_no_font_no_size("Expected: Labeled slider with initial value 50, range 0-100 using default layout".to_string(), color_black(), 10.0, 30.0);
            draw_text_no_font_no_size("Change the value and press space to pass".to_string(), color_black(), 10.0, 50.0);
            start_panel("Test Panel 49".to_string(), rectangle_from(10.0, 70.0, 300.0, 200.0));
            set_interface_label_width(100);
            slider_result = slider_labeled("Test Slider".to_string(), slider_result, 0.0 as f32, 100.0 as f32);
            end_panel("Test Panel 49".to_string());
            draw_interface();
            refresh_screen();
        }
        assert_ne!(initial_value, slider_result);
    }
    #[test]
    fn test_split_into_columns_integration() {
        open_window("Test Window 64".to_string(), 800, 600);
        let _cleanup_window = WindowCleanup::new();
        process_events();
        while key_down(KeyCode::SpaceKey) == false {
            process_events();
            clear_screen_to_white();
            draw_text_no_font_no_size("Test: split_into_columns".to_string(), color_black(), 10.0, 10.0);
            draw_text_no_font_no_size("Expected: Three buttons arranged in equal columns".to_string(), color_black(), 10.0, 30.0);
            draw_text_no_font_no_size("Press space to end test".to_string(), color_black(), 10.0, 50.0);
            start_panel("Test Panel 50".to_string(), rectangle_from(10.0, 70.0, 300.0, 200.0));
            start_custom_layout();
            split_into_columns(3);
            button("Button 1".to_string());
            button("Button 2".to_string());
            button("Button 3".to_string());
            end_panel("Test Panel 50".to_string());
            draw_interface();
            refresh_screen();
        }
    }
    #[test]
    fn test_split_into_columns_with_last_width_integration() {
        open_window("Test Window 65".to_string(), 800, 600);
        let _cleanup_window = WindowCleanup::new();
        process_events();
        while key_down(KeyCode::SpaceKey) == false {
            process_events();
            clear_screen_to_white();
            draw_text_no_font_no_size("Test: split_into_columns_with_last_width".to_string(), color_black(), 10.0, 10.0);
            draw_text_no_font_no_size("Expected: Three buttons with last column width 200px".to_string(), color_black(), 10.0, 30.0);
            draw_text_no_font_no_size("Press space to end test".to_string(), color_black(), 10.0, 50.0);
            start_panel("Test Panel 51".to_string(), rectangle_from(10.0, 70.0, 300.0, 200.0));
            start_custom_layout();
            split_into_columns_with_last_width(3, 200);
            button("Button 1".to_string());
            button("Button 2".to_string());
            button("Button 3".to_string());
            end_panel("Test Panel 51".to_string());
            draw_interface();
            refresh_screen();
        }
    }
    #[test]
    fn test_split_into_columns_relative_with_last_width_integration() {
        open_window("Test Window 66".to_string(), 800, 600);
        let _cleanup_window = WindowCleanup::new();
        process_events();
        while key_down(KeyCode::SpaceKey) == false {
            process_events();
            clear_screen_to_white();
            draw_text_no_font_no_size("Test: split_into_columns_relative_with_last_width".to_string(), color_black(), 10.0, 10.0);
            draw_text_no_font_no_size("Expected: Three buttons with last column 50% of panel width".to_string(), color_black(), 10.0, 30.0);
            draw_text_no_font_no_size("Press space to end test".to_string(), color_black(), 10.0, 50.0);
            start_panel("Test Panel 52".to_string(), rectangle_from(10.0, 70.0, 300.0, 200.0));
            start_custom_layout();
            split_into_columns_relative_with_last_width(3, 0.5);
            button("Button 1".to_string());
            button("Button 2".to_string());
            button("Button 3".to_string());
            reset_layout();
            end_panel("Test Panel 52".to_string());
            draw_interface();
            refresh_screen();
        }
    }
    #[test]
    fn test_start_custom_layout_integration() {
        let _layout_cleanup = LayoutCleanup::new();
        open_window("Test Window 67".to_string(), 800, 600);
        let _cleanup_window = WindowCleanup::new();
        process_events();
        while key_down(KeyCode::SpaceKey) == false {
            process_events();
            clear_screen_to_white();
            draw_text_no_font_no_size("Test: start_custom_layout".to_string(), color_black(), 10.0, 10.0);
            draw_text_no_font_no_size("Expected: Button in 200px wide column".to_string(), color_black(), 10.0, 30.0);
            draw_text_no_font_no_size("Press space to end test".to_string(), color_black(), 10.0, 50.0);
            start_panel("Test Panel 53".to_string(), rectangle_from(10.0, 70.0, 300.0, 200.0));
            start_custom_layout();
            add_column(200);
            button("Test Button".to_string());
            end_panel("Test Panel 53".to_string());
            draw_interface();
            refresh_screen();
        }
    }
    #[test]
    fn test_start_inset_at_position_integration() {
        open_window("Test Window 68".to_string(), 800, 600);
        let _cleanup_window = WindowCleanup::new();
        let test_rect = rectangle_from(10.0, 70.0, 300.0, 200.0);
        process_events();
        while key_down(KeyCode::SpaceKey) == false {
            process_events();
            clear_screen_to_white();
            draw_text_no_font_no_size("Test: start_inset_at_position".to_string(), color_black(), 10.0, 10.0);
            draw_text_no_font_no_size("Expected: An inset at position (10,70) containing a button using default layout".to_string(), color_black(), 10.0, 30.0);
            draw_text_no_font_no_size("Press space to end test".to_string(), color_black(), 10.0, 50.0);
            start_inset_at_position("test_inset".to_string(), test_rect);
            button("Test Button".to_string());
            end_inset("test_inset".to_string());
            draw_interface();
            refresh_screen();
        }
    }
    #[test]
    fn test_start_inset_integration() {
        open_window("Test Window 69".to_string(), 800, 600);
        let _cleanup_window = WindowCleanup::new();
        process_events();
        while key_down(KeyCode::SpaceKey) == false {
            process_events();
            clear_screen_to_white();
            draw_text_no_font_no_size("Test: start_inset".to_string(), color_black(), 10.0, 10.0);
            draw_text_no_font_no_size("Expected: An inset with height 60 pixels containing a button".to_string(), color_black(), 10.0, 30.0);
            draw_text_no_font_no_size("Press space to end test".to_string(), color_black(), 10.0, 50.0);
            start_panel("Test Panel 54".to_string(), rectangle_from(0.0, 70.0, 800.0, 530.0));
            start_inset("Test Inset".to_string(), 60);
            button("Test Button".to_string());
            end_inset("Test Inset".to_string());
            end_panel("Test Panel 54".to_string());
            draw_interface();
            refresh_screen();
        }
    }
    #[test]
    fn test_start_panel_integration() {
        open_window("Test Window 70".to_string(), 800, 600);
        let _cleanup_window = WindowCleanup::new();
        let test_rectangle = rectangle_from(10.0, 70.0, 300.0, 200.0);
        process_events();
        while key_down(KeyCode::SpaceKey) == false {
            process_events();
            clear_screen_to_white();
            draw_text_no_font_no_size("Test: start_panel".to_string(), color_black(), 10.0, 10.0);
            draw_text_no_font_no_size("Expected: Panel with button".to_string(), color_black(), 10.0, 30.0);
            draw_text_no_font_no_size("Press space to end test".to_string(), color_black(), 10.0, 50.0);
            start_panel("Test Panel 55".to_string(), test_rectangle);
            button("Test Button".to_string());
            end_panel("Test Panel 55".to_string());
            draw_interface();
            refresh_screen();
        }
    }
    #[test]
    fn test_start_popup_integration() {
        open_window("Test Window 71".to_string(), 800, 600);
        let _cleanup_window = WindowCleanup::new();
        process_events();
        while key_down(KeyCode::SpaceKey) == false {
            process_events();
            clear_screen_to_white();
            draw_text_no_font_no_size("Test: start_popup".to_string(), color_black(), 10.0, 10.0);
            draw_text_no_font_no_size("Expected: Click the button to show a popup with a label".to_string(), color_black(), 10.0, 30.0);
            draw_text_no_font_no_size("Press space to end test".to_string(), color_black(), 10.0, 50.0);
            start_panel("Test Panel 56".to_string(), rectangle_from(0.0, 70.0, 800.0, 530.0));
            if button("Open Popup".to_string()) == true {
                open_popup("Test Popup".to_string());
            }
            if start_popup("Test Popup".to_string()) == true {
                single_line_layout();
                set_interface_label_width(200);
                label_element("Test Label".to_string());
                end_popup("Test Popup".to_string());
            }
            end_panel("Test Panel 56".to_string());
            draw_interface();
            refresh_screen();
        }
    }
    #[test]
    fn test_start_treenode_integration() {
        open_window("Test Window 72".to_string(), 800, 600);
        let _cleanup_window = WindowCleanup::new();
        process_events();
        while key_down(KeyCode::SpaceKey) == false {
            process_events();
            clear_screen_to_white();
            draw_text_no_font_no_size("Test: start_treenode".to_string(), color_black(), 10.0, 10.0);
            draw_text_no_font_no_size("Expected: A panel containing a collapsible tree node with a button".to_string(), color_black(), 10.0, 30.0);
            draw_text_no_font_no_size("Press space to end test".to_string(), color_black(), 10.0, 50.0);
            start_panel("Test Panel 57".to_string(), rectangle_from(10.0, 70.0, 200.0, 200.0));
            if start_treenode("Test Node".to_string()) == true {
                button("Test Button".to_string());
                end_treenode("Test Node".to_string());
            }
            end_panel("Test Panel 57".to_string());
            draw_interface();
            refresh_screen();
        }
    }
    #[test]
    fn test_text_box_integration() {
        open_window("Test Window 73".to_string(), 800, 600);
        let _cleanup_window = WindowCleanup::new();
        let initial_text = "Initial Text".to_string();
        let mut text_result = initial_text.clone();
        process_events();
        while key_down(KeyCode::SpaceKey) == false {
            process_events();
            clear_screen_to_white();
            draw_text_no_font_no_size("Test: text_box".to_string(), color_black(), 10.0, 10.0);
            draw_text_no_font_no_size("Expected: Text box with editable text".to_string(), color_black(), 10.0, 30.0);
            draw_text_no_font_no_size("Change the text and press space to pass".to_string(), color_black(), 10.0, 50.0);
            start_panel("Test Panel 58".to_string(), rectangle_from(10.0, 70.0, 300.0, 200.0));
            text_result = text_box(text_result);
            end_panel("Test Panel 58".to_string());
            draw_interface();
            refresh_screen();
        }
        assert_ne!(initial_text, text_result);
    }
    #[test]
    fn test_text_box_at_position_integration() {
        open_window("Test Window 74".to_string(), 800, 600);
        let _cleanup_window = WindowCleanup::new();
        let test_rect = rectangle_from(10.0, 70.0, 300.0, 30.0);
        let initial_text = "Initial Text".to_string();
        let mut text_result = initial_text.clone();
        process_events();
        while key_down(KeyCode::SpaceKey) == false {
            process_events();
            clear_screen_to_white();
            draw_text_no_font_no_size("Test: text_box_at_position".to_string(), color_black(), 10.0, 10.0);
            draw_text_no_font_no_size("Expected: Text box at position (10,70) with size 300x30".to_string(), color_black(), 10.0, 30.0);
            draw_text_no_font_no_size("Change the text and press space to pass".to_string(), color_black(), 10.0, 50.0);
            text_result = text_box_at_position(text_result, test_rect);
            draw_interface();
            refresh_screen();
        }
        assert_ne!(initial_text, text_result);
    }
    #[test]
    fn test_text_box_labeled_integration() {
        open_window("Test Window 75".to_string(), 800, 600);
        let _cleanup_window = WindowCleanup::new();
        let initial_text = "Initial Text".to_string();
        let mut text_result = initial_text.clone();
        process_events();
        while key_down(KeyCode::SpaceKey) == false {
            process_events();
            clear_screen_to_white();
            draw_text_no_font_no_size("Test: text_box_labeled".to_string(), color_black(), 10.0, 10.0);
            draw_text_no_font_no_size("Expected: Labeled text box with editable text".to_string(), color_black(), 10.0, 30.0);
            draw_text_no_font_no_size("Change the text and press space to pass".to_string(), color_black(), 10.0, 50.0);
            start_panel("Test Panel 59".to_string(), rectangle_from(10.0, 70.0, 300.0, 200.0));
            set_interface_label_width(100);
            text_result = text_box_labeled("Test Text Box".to_string(), text_result);
            end_panel("Test Panel 59".to_string());
            draw_interface();
            refresh_screen();
        }
        assert_ne!(initial_text, text_result);
    }
}
