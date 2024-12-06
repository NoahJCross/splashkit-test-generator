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
fn test_add_column_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_panel = start_panel("Test Panel", rectangle_from(0, 0, 800, 600));
    start_custom_layout();
    add_column(100);
    add_column(-1);
    button("Test Button");
    end_panel("Test Panel");
    draw_interface();
    refresh_screen();
    close_window(test_window);
}
#[test]
fn test_add_column_relative_integration() {
    let test_window = open_window("Test Window", 800, 600);
    start_panel("Test Panel", rectangle_from(0, 0, 800, 600));
    start_custom_layout();
    add_column_relative(0.5);
    button("Button 1");
    add_column_relative(0.5);
    button("Button 2");
    end_panel("Test Panel");
    draw_interface();
    refresh_screen();
    assert!(point_in_rectangle(point_at(200, 300), rectangle_from(0, 0, 400, 600)));
    close_window(test_window);
}
#[test]
fn test_bitmap_button_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    process_events();
    simulate_mouse_click(Mousebutton::Left);
    process_events();
    let button_clicked = bitmap_button(test_bitmap);
    assert!(button_clicked);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_bitmap_button_at_position_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    let test_rectangle = rectangle_from(100, 100, 100, 100);
    process_events();
    simulate_mouse_click(Mousebutton::Left);
    process_events();
    let button_clicked = bitmap_button_at_position(test_bitmap, test_rectangle);
    assert!(button_clicked);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_bitmap_button_at_position_with_options_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    let test_rectangle = rectangle_from(100, 100, 100, 100);
    let test_options = option_defaults();
    let button_clicked = bitmap_button_at_position_with_options(test_bitmap, test_rectangle, test_options);
    process_events();
    simulate_mouse_click(Mousebutton::Left);
    process_events();
    assert!(button_clicked);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_bitmap_button_with_options_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    let test_options1 = option_defaults();
    let test_options2 = option_scale_bmp(0.5, 0.5, test_options1);
    process_events();
    simulate_mouse_click(Mousebutton::Left);
    process_events();
    let button_clicked = bitmap_button_with_options(test_bitmap, test_options2);
    assert!(button_clicked);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_bitmap_button_labeled_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    process_events();
    let button_clicked1 = bitmap_button_labeled("Click Me", test_bitmap);
    assert!(!button_clicked1);
    simulate_mouse_click(Mousebutton::Left);
    process_events();
    let button_clicked2 = bitmap_button_labeled("Click Me", test_bitmap);
    assert!(button_clicked2);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_bitmap_button_labeled_with_options_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    let test_options1 = option_defaults();
    let test_options2 = option_scale_bmp(0.5, 0.5, test_options1);
    process_events();
    simulate_mouse_click(Mousebutton::Left);
    process_events();
    let button_clicked = bitmap_button_labeled_with_options("Click Me", test_bitmap, test_options2);
    assert!(button_clicked);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_button_at_position_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_rectangle = rectangle_from(100, 100, 200, 50);
    process_events();
    let button_clicked1 = button_at_position("Click Me", test_rectangle);
    assert!(!button_clicked1);
    simulate_mouse_click(Mousebutton::Left);
    process_events();
    let button_clicked2 = button_at_position("Click Me", test_rectangle);
    assert!(button_clicked2);
    close_window(test_window);
}
#[test]
fn test_button_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_panel = start_panel("Test Panel", rectangle_from(100, 100, 200, 100));
    process_events();
    let button_clicked1 = button("Click Me");
    assert!(!button_clicked1);
    simulate_mouse_click(Mousebutton::Left);
    process_events();
    let button_clicked2 = button("Click Me");
    assert!(button_clicked2);
    end_panel("Test Panel");
    close_window(test_window);
}
#[test]
fn test_button_labeled_integration() {
    let test_window = open_window("Test Window", 800, 600);
    process_events();
    let button_result1 = button_labeled("Label:", "Click Me");
    assert!(!button_result1);
    simulate_mouse_click(Mousebutton::Left);
    process_events();
    let button_result2 = button_labeled("Label:", "Click Me");
    assert!(button_result2);
    close_window(test_window);
}
#[test]
fn test_checkbox_at_position_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_rect = rectangle_from(100, 100, 200, 50);
    process_events();
    let test_checkbox_result1 = checkbox_at_position("Test Checkbox", false, test_rect);
    assert!(!test_checkbox_result1);
    simulate_mouse_click(Mousebutton::Left);
    process_events();
    let test_checkbox_result2 = checkbox_at_position("Test Checkbox", test_checkbox_result1, test_rect);
    assert!(test_checkbox_result2);
    close_window(test_window);
}
#[test]
fn test_checkbox_integration() {
    let test_window = open_window("Test Window", 800, 600);
    process_events();
    let test_checkbox_result1 = checkbox("Test Checkbox", false);
    assert!(!test_checkbox_result1);
    simulate_mouse_click(Mousebutton::Left);
    process_events();
    let test_checkbox_result2 = checkbox("Test Checkbox", test_checkbox_result1);
    assert!(test_checkbox_result2);
    close_window(test_window);
}
#[test]
fn test_checkbox_labeled_integration() {
    let test_window = open_window("Test Window", 800, 600);
    process_events();
    let test_checkbox_result1 = checkbox_labeled("Test Checkbox", "Check me", false);
    assert!(!test_checkbox_result1);
    simulate_mouse_click(Mousebutton::Left);
    process_events();
    let test_checkbox_result2 = checkbox_labeled("Test Checkbox", "Check me", test_checkbox_result1);
    assert!(test_checkbox_result2);
    close_window(test_window);
}
#[test]
fn test_color_slider_at_position_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_color = color_black();
    let test_rect = rectangle_from(100, 100, 200, 100);
    let result_color = color_slider_at_position(test_color, test_rect);
    process_events();
    simulate_mouse_click(Mousebutton::Left);
    process_events();
    assert_ne!(test_color, result_color);
    close_window(test_window);
}
#[test]
fn test_color_slider_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_color = color_black();
    let result_color = color_slider(test_color);
    draw_interface();
    refresh_screen();
    assert_ne!(test_color, result_color);
    close_window(test_window);
}
#[test]
fn test_color_slider_labeled_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_color = color_black();
    let result_color = color_slider_labeled("Test Color Slider", test_color);
    process_events();
    assert_ne!(result_color, color_black());
    close_window(test_window);
}
#[test]
fn test_disable_interface_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_panel = start_panel("Test Panel", rectangle_from(100, 100, 200, 200));
    let test_button = button("Test Button");
    process_events();
    assert!(interface_enabled());
    disable_interface();
    process_events();
    assert!(!interface_enabled());
    enable_interface();
    process_events();
    assert!(interface_enabled());
    end_panel("Test Panel");
    close_window(test_window);
}
#[test]
fn test_draw_interface_integration() {
    let test_window = open_window("Test Window", 800, 600);
    start_panel("Test Panel", rectangle_from(100, 100, 200, 200));
    button("Test Button");
    end_panel("Test Panel");
    draw_interface();
    refresh_screen();
    assert_eq!(get_pixel(point_at(150, 150)), color_black());
    close_window(test_window);
}
#[test]
fn test_enable_interface_integration() {
    let test_window = open_window("Test Window", 800, 600);
    disable_interface();
    process_events();
    assert!(!interface_enabled());
    enable_interface();
    process_events();
    assert!(interface_enabled());
    close_window(test_window);
}
#[test]
fn test_end_inset_integration() {
    let test_window = open_window("Test Window", 800, 600);
    start_inset("Test Inset", 60);
    end_inset("Test Inset");
    close_window(test_window);
}
#[test]
fn test_end_panel_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_panel = start_panel("Test Panel", rectangle_from(100, 100, 200, 200));
    end_panel("Test Panel");
    close_window(test_window);
}
#[test]
fn test_end_popup_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_popup = start_popup("Test Popup");
    end_popup("Test Popup");
    close_window(test_window);
}
#[test]
fn test_end_treenode_integration() {
    let test_window = open_window("Test Window", 800, 600);
    start_panel("Test Panel", rectangle_from(10, 10, 200, 200));
    let test_node = start_treenode("Test Node");
    end_treenode("Test Node");
    end_panel("Test Panel");
    draw_interface();
    refresh_screen();
    close_window(test_window);
}
#[test]
fn test_enter_column_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_panel = start_panel("Test Panel", rectangle_from(10, 10, 300, 200));
    add_column(100);
    enter_column();
    button("Button1");
    leave_column();
    end_panel("Test Panel");
    draw_interface();
    refresh_screen();
    close_window(test_window);
}
#[test]
fn test_get_interface_label_width_integration() {
    let test_label_width = get_interface_label_width();
    assert_eq!(test_label_width, 60);
}
#[test]
fn test_header_integration() {
    let test_window = open_window("Test Window", 800, 600);
    process_events();
    let test_header_result = header("Test Header");
    assert!(test_header_result.is_some());
    close_window(test_window);
}
#[test]
fn test_hsb_color_slider_at_position_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_color = hsb_color(0.5, 1.0, 0.5);
    let test_rect = rectangle_from(100, 100, 200, 100);
    let result_color = hsb_color_slider_at_position(test_color, test_rect);
    process_events();
    assert_ne!(test_color, result_color);
    close_window(test_window);
}
#[test]
fn test_hsb_color_slider_integration() {
    let test_window = open_window("HSB Slider Test", 800, 600);
    let test_color = color_black();
    let result_color = hsb_color_slider(test_color);
    draw_interface();
    refresh_screen();
    assert_ne!(test_color, result_color);
    close_window(test_window);
}
#[test]
fn test_hsb_color_slider_labeled_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_color = color_black();
    let test_result_color = hsb_color_slider_labeled("Color Slider", test_color);
    process_events();
    assert_ne!(test_result_color, color_black());
    close_window(test_window);
}
#[test]
fn test_interface_enabled_integration() {
    let initial_state = interface_enabled();
    disable_interface();
    let disabled_state = interface_enabled();
    assert!(!disabled_state);
    enable_interface();
    let enabled_state = interface_enabled();
    assert!(enabled_state);
}
#[test]
fn test_interface_style_panel_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_rectangle = rectangle_from(0, 0, 200, 200);
    interface_style_panel(test_rectangle);
    refresh_screen();
    close_window(test_window);
}
#[test]
fn test_label_element_integration() {
    let test_window = open_window("Test Window", 800, 600);
    label_element("Test Label");
    draw_interface();
    refresh_screen();
    assert!(pixel_drawn_at_point(point_at(10, 10)));
    close_window(test_window);
}
#[test]
fn test_label_element_at_position_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_rectangle = rectangle_from(100, 100, 200, 50);
    label_element_at_position("Test Label", test_rectangle);
    refresh_screen();
    close_window(test_window);
}
#[test]
fn test_last_element_changed_integration() {
    let test_window = open_window("Test Window", 800, 600);
    process_events();
    slider("Test Slider", 0.0, 0.0, 100.0);
    process_events();
    assert!(!last_element_changed());
    simulate_mouse_move(100, 100);
    simulate_mouse_down(Mousebutton::Left);
    simulate_mouse_move(200, 200);
    simulate_mouse_up(Mousebutton::Left);
    process_events();
    assert!(last_element_changed());
    close_window(test_window);
}
#[test]
fn test_last_element_confirmed_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_button = button("Test Button");
    process_events();
    assert!(!last_element_confirmed());
    simulate_mouse_click(Mousebutton::Left);
    process_events();
    assert!(last_element_confirmed());
    close_window(test_window);
}
#[test]
fn test_leave_column_integration() {
    let test_window = open_window("Test Window", 800, 600);
    start_panel("Test Panel", rectangle_from(10, 10, 300, 200));
    start_custom_layout();
    add_column(100);
    enter_column();
    leave_column();
    let button_result = button("Test Button");
    assert!(!button_result);
    end_panel("Test Panel");
    close_window(test_window);
}
#[test]
fn test_number_box_at_position_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_rect = rectangle_from(100, 100, 200, 30);
    let test_result = number_box_at_position(5.0, 1.0, test_rect);
    process_events();
    assert!((4.0..=6.0).contains(&test_result));
    close_window(test_window);
}
#[test]
fn test_number_box_integration() {
    let test_window = open_window("Number Box Test", 800, 600);
    process_events();
    let test_result = number_box(5.0, 1.0);
    assert!((4.0..=6.0).contains(&test_result));
    close_window(test_window);
}
#[test]
fn test_number_box_labeled_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_result = number_box_labeled("Test Value", 5.0, 1.0);
    assert!((4.0..=6.0).contains(&test_result));
    close_window(test_window);
}
#[test]
fn test_open_popup_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_popup = start_popup("Test Popup");
    process_events();
    open_popup("Test Popup");
    process_events();
    assert!(popup_is_open);
    end_popup("Test Popup");
    close_window(test_window);
}
#[test]
fn test_paragraph_integration() {
    let test_window = open_window("Test Window", 800, 600);
    set_interface_font(load_font("test_font", "arial.ttf"));
    set_interface_font_size(12);
    paragraph("This is a test paragraph to check if the text wraps correctly.");
    draw_interface();
    refresh_screen();
    assert_eq!(get_pixel(point_at(10, 10)), color_black());
    free_font(font_named("test_font"));
    close_window(test_window);
}
#[test]
fn test_paragraph_at_position_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_rectangle = rectangle_from(100, 100, 200, 100);
    paragraph_at_position("This is a test paragraph.", test_rectangle);
    refresh_screen();
    assert_eq!(get_pixel(point_at(rectangle_left(test_rectangle), rectangle_top(test_rectangle))), color_black());
    close_window(test_window);
}
#[test]
fn test_reset_layout_integration() {
    let test_window = open_window("Test Window", 800, 600);
    start_custom_layout();
    add_column(200);
    add_column(-1);
    reset_layout();
    draw_interface();
    refresh_screen();
    close_window(test_window);
}
#[test]
fn test_set_interface_accent_color_integration() {
    let test_window = open_window("Test Window", 800, 600);
    set_interface_accent_color(color_red(), 0.5);
    button("Test Button");
    draw_interface();
    refresh_screen();
    assert_eq!(get_pixel(point_at(10, 10)), color_red());
    close_window(test_window);
}
#[test]
fn test_set_interface_border_color_integration() {
    let test_window = open_window("Test Window", 800, 600);
    set_interface_border_color(color_red());
    start_panel("Test Panel", rectangle_from(100, 100, 200, 100));
    button("Test Button");
    end_panel("Test Panel");
    draw_interface();
    refresh_screen();
    assert_eq!(get_pixel(100, 100), color_red());
    close_window(test_window);
}
#[test]
fn test_set_interface_colors_auto_integration() {
    let test_window = open_window("Test Window", 800, 600);
    set_interface_colors_auto(color_white(), color_blue(), 0.5, 0.7, 0.3);
    start_panel("Test Panel", rectangle_from(100, 100, 200, 200));
    button("Test Button");
    end_panel("Test Panel");
    draw_interface();
    refresh_screen();
    assert_eq!(get_pixel(150, 150), color_blue());
    close_window(test_window);
}
#[test]
fn test_set_interface_element_color_integration() {
    let test_window = open_window("Test Window", 800, 600);
    set_interface_element_color(color_black(), 0.5);
    start_panel("Test Panel", rectangle_from(100, 100, 200, 200));
    button("Test Button");
    end_panel("Test Panel");
    draw_interface();
    refresh_screen();
    assert_eq!(get_pixel(150, 150), color_black());
    close_window(test_window);
}
#[test]
fn test_set_interface_element_shadows_integration() {
    let test_window = open_window("Test Window", 800, 600);
    set_interface_element_shadows(10, color_black(), point_at(5, 5));
    start_panel("Test Panel", rectangle_from(100, 100, 200, 200));
    button("Test Button");
    end_panel("Test Panel");
    draw_interface();
    refresh_screen();
    assert!(pixel_drawn_at_point(point_at(105, 105)));
    close_window(test_window);
}
#[test]
fn test_set_interface_font_font_as_string_integration() {
    let test_window = open_window("Test Window", 800, 600);
    set_interface_font_font_as_string("Arial");
    label_element("Test Text");
    draw_interface();
    refresh_screen();
    close_window(test_window);
}
#[test]
fn test_set_interface_font_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_font = load_font("test_font", "arial.ttf");
    set_interface_font(test_font);
    label_element("Test Text");
    draw_interface();
    refresh_screen();
    free_font(test_font);
    close_window(test_window);
}
#[test]
fn test_set_interface_font_size_integration() {
    let test_window = open_window("Test Window", 800, 600);
    set_interface_font_size(16);
    label_element("Test Text");
    draw_interface();
    assert!(pixel_drawn_at_point(point_at(10, 20)));
    close_window(test_window);
}
#[test]
fn test_set_interface_label_width_integration() {
    let test_window = open_window("Test Window", 800, 600);
    set_interface_label_width(100);
    let test_width = get_interface_label_width();
    assert_eq!(test_width, 100);
    close_window(test_window);
}
#[test]
fn test_set_interface_panel_shadows_integration() {
    let test_window = open_window("Test Window", 800, 600);
    set_interface_panel_shadows(10, rgba_color(0, 0, 0, 128), point_at(5, 5));
    let panel_visible = start_panel("Test Panel", rectangle_from(100, 100, 200, 150));
    end_panel("Test Panel");
    draw_interface();
    refresh_screen();
    assert_eq!(get_pixel(point_at(105, 105)), rgba_color(0, 0, 0, 128));
    close_window(test_window);
}
#[test]
fn test_set_interface_root_text_color_integration() {
    let test_window = open_window("Test Window", 800, 600);
    set_interface_root_text_color(color_red());
    label_element("Test Text", rectangle_from(100, 100, 200, 50));
    refresh_screen();
    assert!(pixel_drawn_at_point(color_red(), 105, 105));
    close_window(test_window);
}
#[test]
fn test_set_interface_shadows_integration() {
    let test_window = open_window("Test Window", 800, 600);
    set_interface_shadows(10, rgba_color(0, 0, 0, 128), point_at(5, 5));
    let panel_visible = start_panel("Test Panel", rectangle_from(100, 100, 200, 200));
if assert!(panel_visible);
 {
        button("Test Button");
        end_panel("Test Panel");
        draw_interface();
        refresh_screen();
        assert!(pixel_drawn_at_point(point_at(105, 105)));
}
}
    close_window(test_window);
}
#[test]
fn test_set_interface_spacing_integration() {
    let test_window = open_window("Test Window", 800, 600);
    set_interface_spacing(10, 5);
    let test_panel = start_panel("Test Panel", rectangle_from(100, 100, 200, 200));
    button("Button 1");
    button("Button 2");
    end_panel("Test Panel");
    draw_interface();
    refresh_screen();
    assert!(pixel_drawn_at_point(point_at(110, 110)));
    close_window(test_window);
}
#[test]
fn test_set_interface_style_integration() {
    let test_window = open_window("Test Window", 800, 600);
    set_interface_style(InterfaceStyle::Dark);
    button("Test Button");
    draw_interface();
    refresh_screen();
    close_window(test_window);
}
#[test]
fn test_set_interface_style_with_color_integration() {
    let test_window = open_window("Test Window", 800, 600);
    set_interface_style_with_color(InterfaceStyle::Dark, color_blue());
    let test_panel = start_panel("Test Panel", rectangle_from(100, 100, 200, 200));
    button("Test Button");
    draw_interface();
    refresh_screen();
    assert_eq!(get_pixel(point_at(150, 150)), color_blue());
    close_window(test_window);
}
#[test]
fn test_set_interface_text_color_integration() {
    let test_window = open_window("Test Window", 800, 600);
    set_interface_text_color(color_red());
    label_element("Test Text");
    draw_interface();
    refresh_screen();
    assert_eq!(get_pixel(point_at(10, 10)), color_red());
    close_window(test_window);
}
#[test]
fn test_set_layout_height_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_panel = start_panel("Test Panel", rectangle_from(0, 0, 800, 600));
    set_layout_height(50);
    button("Test Button");
    end_panel("Test Panel");
    draw_interface();
    refresh_screen();
    close_window(test_window);
}
#[test]
fn test_single_line_layout_integration() {
    let test_window = open_window("Test Window", 800, 600);
    single_line_layout();
    let test_button1 = button("Button1");
    let test_button2 = button("Button2");
    reset_layout();
    close_window(test_window);
}
#[test]
fn test_slider_at_position_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_rect = rectangle_from(100, 100, 200, 20);
    process_events();
    let slider_result = slider_at_position(50.0, 0.0, 100.0, test_rect);
    assert!((0.0..=100.0).contains(&slider_result));
    close_window(test_window);
}
#[test]
fn test_slider_integration() {
    let test_window = open_window("Test Window", 800, 600);
    process_events();
    let test_slider_result = slider(50.0, 0.0, 100.0);
    assert!((0.0..=100.0).contains(&test_slider_result));
    close_window(test_window);
}
#[test]
fn test_slider_labeled_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_slider_value = slider_labeled("Test Slider", 50.0, 0.0, 100.0);
    assert!((0.0..=100.0).contains(&test_slider_value));
    close_window(test_window);
}
#[test]
fn test_split_into_columns_integration() {
    let test_window = open_window("Test Window", 800, 600);
    start_panel("Test Panel", rectangle_from(0, 0, 800, 600));
    split_into_columns(3);
    end_panel("Test Panel");
    close_window(test_window);
}
#[test]
fn test_split_into_columns_with_last_width_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_panel = start_panel("Test Panel", rectangle_from(0, 0, 800, 600));
    split_into_columns_with_last_width(3, 200);
    button("Button 1");
    button("Button 2");
    button("Button 3");
    end_panel("Test Panel");
    close_window(test_window);
}
#[test]
fn test_split_into_columns_relative_with_last_width_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_panel = start_panel("Test Panel", rectangle_from(0, 0, 800, 600));
    split_into_columns_relative_with_last_width(3, 0.5);
    button("Button 1");
    button("Button 2");
    button("Button 3");
    end_panel("Test Panel");
    draw_interface();
    refresh_screen();
    assert!(point_in_rectangle(point_at(200, 300), rectangle_from(0, 0, 200, 600)));
    assert!(point_in_rectangle(point_at(600, 300), rectangle_from(400, 0, 400, 600)));
    close_window(test_window);
}
#[test]
fn test_start_custom_layout_integration() {
    let test_window = open_window("Test Window", 800, 600);
    start_custom_layout();
    add_column(200);
    let button_result = button("Test Button");
    reset_layout();
    close_window(test_window);
    assert!(button_result);
}
#[test]
fn test_start_inset_at_position_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_rect = rectangle_from(100, 100, 200, 200);
    start_inset_at_position("test_inset", test_rect);
    end_inset("test_inset");
    close_window(test_window);
}
#[test]
fn test_start_inset_integration() {
    let test_window = open_window("Test Window", 800, 600);
    start_panel("Test Panel", rectangle_from(100, 100, 300, 300));
    start_inset("Test Inset", 100);
    button("Test Button");
    end_inset("Test Inset");
    end_panel("Test Panel");
    close_window(test_window);
}
#[test]
fn test_start_panel_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_rectangle = rectangle_from(100, 100, 200, 150);
    let panel_visible = start_panel("Test Panel", test_rectangle);
    assert!(panel_visible);
    end_panel("Test Panel");
    close_window(test_window);
}
#[test]
fn test_start_popup_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let popup_visible = start_popup("Test Popup");
    assert!(popup_visible);
    end_popup("Test Popup");
    close_window(test_window);
}
#[test]
fn test_start_treenode_integration() {
    let test_window = open_window("Test Window", 800, 600);
    start_panel("Test Panel", rectangle_from(0, 0, 800, 600));
    let test_node_expanded = start_treenode("Test Node");
    assert!(test_node_expanded);
    end_treenode("Test Node");
    end_panel("Test Panel");
    close_window(test_window);
}
#[test]
fn test_text_box_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_text_box_result = text_box("Initial Text");
    process_events();
    assert_eq!(test_text_box_result, "Initial Text");
    simulate_key_press(Keycode::A);
    process_events();
    let test_text_box_result_updated = text_box(test_text_box_result);
    assert_eq!(test_text_box_result_updated, "Initial TextA");
    close_window(test_window);
}
#[test]
fn test_text_box_at_position_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_rect = rectangle_from(100, 100, 200, 30);
    process_events();
    let test_result1 = text_box_at_position("Initial Text", test_rect);
    assert_eq!(test_result2, "Initial Text");
    simulate_key_press(Keycode::A);
    process_events();
    let test_result2 = text_box_at_position(test_result1, test_rect);
    assert_eq!(test_result1, "Initial TextA");
    close_window(test_window);
}
#[test]
fn test_text_box_labeled_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_text_box_result = text_box_labeled("Enter Name", "John");
    process_events();
    assert_eq!(test_text_box_result, "John");
    close_window(test_window);
}
