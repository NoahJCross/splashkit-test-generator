import pytest
from splashkit import *

class TestInterface:

def test_add_column_integration():
    test_window = open_window("Test Window", 800, 600)
    while quit_requested() is False:
        process_events()
        clear_screen()
        start_panel("Test Panel", rectangle_from(0, 0, 800, 600))
        start_custom_layout()
        add_column(100)
        add_column(-1)
        button("Test Button")
        end_panel("Test Panel")
        draw_interface()
        refresh_screen()
    
    close_window(test_window)


def test_add_column_relative_integration():
    test_window = open_window("Test Window", 800, 600)
    while quit_requested() is False:
        process_events()
        clear_screen()
        start_panel("Test Panel", rectangle_from(0, 0, 800, 600))
        start_custom_layout()
        add_column_relative(0.5)
        button("Button 1")
        add_column_relative(0.5)
        button("Button 2")
        end_panel("Test Panel")
        draw_interface()
        refresh_screen()
    
    close_window(test_window)


def test_bitmap_button_integration():
    test_window = open_window("Test Window", 800, 600)
    test_bitmap = create_bitmap("test_bitmap", 100, 100)
    button_clicked = false;
    while quit_requested() is False:
        process_events()
        clear_screen()
        button_clicked = bitmap_button(test_bitmap);
        draw_interface()
        refresh_screen()
    
    assert button_clicked
    free_bitmap(test_bitmap)
    close_window(test_window)


def test_bitmap_button_at_position_integration():
    test_window = open_window("Test Window", 800, 600)
    test_bitmap = create_bitmap("test_bitmap", 100, 100)
    test_rectangle = rectangle_from(100, 100, 100, 100)
    button_clicked = false;
    while quit_requested() is False:
        process_events()
        clear_screen()
        button_clicked = bitmap_button(test_bitmap, test_rectangle);
        draw_interface()
        refresh_screen()
    
    assert button_clicked
    free_bitmap(test_bitmap)
    close_window(test_window)


def test_bitmap_button_at_position_with_options_integration():
    test_window = open_window("Test Window", 800, 600)
    test_bitmap = create_bitmap("test_bitmap", 100, 100)
    test_rectangle = rectangle_from(100, 100, 100, 100)
    button_clicked = false;
    while quit_requested() is False:
        process_events()
        clear_screen()
        button_clicked = bitmap_button(test_bitmap, test_rectangle, option_defaults());
        draw_interface()
        refresh_screen()
    
    assert button_clicked
    free_bitmap(test_bitmap)
    close_window(test_window)


def test_bitmap_button_with_options_integration():
    test_window = open_window("Test Window", 800, 600)
    test_bitmap = create_bitmap("test_bitmap", 100, 100)
    test_options1 = option_defaults()
    test_options2 = option_scale_bmp(0.5, 0.5, test_options1)
    button_clicked = false;
    while quit_requested() is False:
        process_events()
        clear_screen()
        button_clicked = bitmap_button(test_bitmap, test_options2);
        draw_interface()
        refresh_screen()
    
    assert button_clicked
    free_bitmap(test_bitmap)
    close_window(test_window)


def test_bitmap_button_labeled_integration():
    test_window = open_window("Test Window", 800, 600)
    test_bitmap = create_bitmap("test_bitmap", 100, 100)
    button_clicked = false;
    while quit_requested() is False:
        process_events()
        clear_screen()
        button_clicked = bitmap_button("Click Me", test_bitmap);
        draw_interface()
        refresh_screen()
    
    assert button_clicked
    free_bitmap(test_bitmap)
    close_window(test_window)


def test_bitmap_button_labeled_with_options_integration():
    test_window = open_window("Test Window", 800, 600)
    test_bitmap = create_bitmap("test_bitmap", 100, 100)
    test_options1 = option_defaults()
    test_options2 = option_scale_bmp(0.5, 0.5, test_options1)
    button_clicked = false;
    while quit_requested() is False:
        process_events()
        clear_screen()
        button_clicked = bitmap_button("Click Me", test_bitmap, test_options2);
        draw_interface()
        refresh_screen()
    
    assert button_clicked
    free_bitmap(test_bitmap)
    close_window(test_window)


def test_button_at_position_integration():
    test_window = open_window("Test Window", 800, 600)
    test_rectangle = rectangle_from(100, 100, 200, 50)
    button_clicked = false;
    while quit_requested() is False:
        process_events()
        clear_screen()
        button_clicked = button("Click Me", test_rectangle);
        draw_interface()
        refresh_screen()
    
    assert button_clicked
    close_window(test_window)


def test_button_integration():
    test_window = open_window("Test Window", 800, 600)
    button_clicked = false;
    while quit_requested() is False:
        process_events()
        clear_screen()
        button_clicked = button("Click Me");
        draw_interface()
        refresh_screen()
    
    assert button_clicked
    close_window(test_window)


def test_button_labeled_integration():
    test_window = open_window("Test Window", 800, 600)
    button_clicked = false;
    while quit_requested() is False:
        process_events()
        clear_screen()
        button_clicked = button("Label:", "Click Me");
        draw_interface()
        refresh_screen()
    
    assert button_clicked
    close_window(test_window)


def test_checkbox_at_position_integration():
    test_window = open_window("Test Window", 800, 600)
    test_rect = rectangle_from(100, 100, 200, 50)
    initial_checkbox_result = false;
    current_checkbox_result = initial_checkbox_result;
    while quit_requested() is False:
        process_events()
        clear_screen()
        current_checkbox_result = checkbox("Test Checkbox", current_checkbox_result, test_rect);
        draw_interface()
        refresh_screen()
    
    assert current_checkbox_result
    close_window(test_window)


def test_checkbox_integration():
    test_window = open_window("Test Window", 800, 600)
    initial_checkbox_result = false;
    current_checkbox_result = initial_checkbox_result;
    while quit_requested() is False:
        process_events()
        clear_screen()
        current_checkbox_result = checkbox("Test Checkbox", current_checkbox_result);
        draw_interface()
        refresh_screen()
    
    assert current_checkbox_result
    close_window(test_window)


def test_checkbox_labeled_integration():
    test_window = open_window("Test Window", 800, 600)
    initial_checkbox_result = false;
    current_checkbox_result = initial_checkbox_result;
    while quit_requested() is False:
        process_events()
        clear_screen()
        current_checkbox_result = checkbox("Test Checkbox", "Check me", current_checkbox_result);
        draw_interface()
        refresh_screen()
    
    assert current_checkbox_result
    close_window(test_window)


def test_color_slider_at_position_integration():
    test_window = open_window("Test Window", 800, 600)
    initial_color = color_black()
    current_color = initial_color;
    while quit_requested() is False:
        process_events()
        clear_screen()
        current_color = color_slider(current_color, rectangle_from(300, 300, 400, 24));
        draw_interface()
        refresh_screen()
    
    assert current_color != initial_color
    close_window(test_window)


def test_color_slider_integration():
    test_window = open_window("Test Window", 800, 600)
    test_color = color_black()
    current_color = test_color;
    while quit_requested() is False:
        process_events()
        clear_screen()
        current_color = color_slider(current_color);
        draw_interface()
        refresh_screen()
    
    assert current_color != test_color
    close_window(test_window)


def test_color_slider_labeled_integration():
    test_window = open_window("Test Window", 800, 600)
    test_color = color_black()
    current_color = test_color;
    while quit_requested() is False:
        process_events()
        clear_screen()
        current_color = color_slider("Test Color Slider", current_color);
        draw_interface()
        refresh_screen()
    
    assert test_color != current_color
    close_window(test_window)


def test_disable_interface_integration():
    test_window = open_window("Test Window", 800, 600)
    test_panel = start_panel("Test Panel", rectangle_from(100, 100, 200, 200))
    test_button = button("Test Button")
    process_events()
    assert interface_enabled()
    disable_interface()
    process_events()
    assert not interface_enabled()
    enable_interface()
    process_events()
    assert interface_enabled()
    end_panel("Test Panel")
    close_window(test_window)


def test_draw_interface_integration():
    test_window = open_window("Test Window", 800, 600)
    while quit_requested() is False:
        process_events()
        clear_screen()
        start_panel("Test Panel", rectangle_from(100, 100, 200, 200))
        write_line("Test Button clicked!")
        end_panel("Test Panel")
        draw_interface()
        refresh_screen()
    
    close_window(test_window)


def test_enable_interface_integration():
    test_window = open_window("Test Window", 800, 600)
    disable_interface()
    process_events()
    assert not interface_enabled()
    enable_interface()
    process_events()
    assert interface_enabled()
    close_window(test_window)


def test_end_inset_integration():
    test_window = open_window("Test Window", 800, 600)
    while quit_requested() is False:
        process_events()
        clear_screen()
        start_inset("Test Inset", 60)
        end_inset("Test Inset")
        draw_interface()
        refresh_screen()
    
    close_window(test_window)


def test_end_panel_integration():
    test_window = open_window("Test Window", 800, 600)
    while quit_requested() is False:
        process_events()
        clear_screen()
        start_panel("Test Panel", rectangle_from(100, 100, 200, 200))
        end_panel("Test Panel")
        draw_interface()
        refresh_screen()
    
    close_window(test_window)


def test_end_popup_integration():
    test_window = open_window("Test Window", 800, 600)
    while quit_requested() is False:
        process_events()
        clear_screen()
        start_popup("Test Popup")
        end_popup("Test Popup")
        draw_interface()
        refresh_screen()
    
    close_window(test_window)


def test_end_treenode_integration():
    test_window = open_window("Test Window", 800, 600)
    while quit_requested() is False:
        process_events()
        clear_screen()
        start_panel("Test Panel", rectangle_from(10, 10, 200, 200))
        start_treenode("Test Node")
        end_treenode("Test Node")
        end_panel("Test Panel")
        draw_interface()
        refresh_screen()
    
    close_window(test_window)


def test_enter_column_integration():
    test_window = open_window("Test Window", 800, 600)
    while quit_requested() is False:
        process_events()
        clear_screen()
        start_panel("Test Panel", rectangle_from(10, 10, 300, 200))
        add_column(100)
        enter_column()
        write_line("Button1 clicked!")
        leave_column()
        end_panel("Test Panel")
        draw_interface()
        refresh_screen()
    
    close_window(test_window)


def test_get_interface_label_width_integration():
    test_label_width = get_interface_label_width()
    assert 60 == test_label_width


def test_header_integration():
    test_window = open_window("Test Window", 800, 600)
    while quit_requested() is False:
        process_events()
        clear_screen()
        test_header_result = header("Test Header")
        draw_interface()
        refresh_screen()
    
    close_window(test_window)


def test_hsb_color_slider_at_position_integration():
    test_window = open_window("Test Window", 800, 600)
    test_rect = rectangle_from(100, 100, 200, 100)
    test_color = hsb_color_slider_at_position(color_black(), test_rect)
    current_color = test_color;
    while quit_requested() is False:
        process_events()
        clear_screen()
        current_color = hsb_color_slider(current_color, test_rect);
        draw_interface()
        refresh_screen()
    
    assert current_color != test_color
    close_window(test_window)


def test_hsb_color_slider_integration():
    test_window = open_window("HSB Slider Test", 800, 600)
    test_color = color_black()
    current_color = test_color;
    while quit_requested() is False:
        process_events()
        clear_screen()
        current_color = hsb_color_slider(current_color);
        draw_interface()
        refresh_screen()
    
    assert current_color != test_color
    close_window(test_window)


def test_hsb_color_slider_labeled_integration():
    test_window = open_window("Test Window", 800, 600)
    test_color = color_black()
    current_color = test_color;
    while quit_requested() is False:
        process_events()
        clear_screen()
        current_color = hsb_color_slider("Color Slider", current_color);
        draw_interface()
        refresh_screen()
    
    assert test_color != current_color
    close_window(test_window)


def test_interface_enabled_integration():
    initial_state = interface_enabled()
    disable_interface()
    disabled_state = interface_enabled()
    assert not disabled_state
    enable_interface()
    enabled_state = interface_enabled()
    assert enabled_state


def test_interface_style_panel_integration():
    test_window = open_window("Test Window", 800, 600)
    test_rectangle = rectangle_from(0, 0, 200, 200)
    while quit_requested() is False:
        process_events()
        clear_screen()
        interface_style_panel(test_rectangle)
        draw_interface()
        refresh_screen()
    
    close_window(test_window)


def test_label_element_integration():
    test_window = open_window("Test Window", 800, 600)
    while quit_requested() is False:
        process_events()
        clear_screen()
        label_element("Test Label")
        draw_interface()
        refresh_screen()
    
    close_window(test_window)


def test_label_element_at_position_integration():
    test_window = open_window("Test Window", 800, 600)
    test_rectangle = rectangle_from(100, 100, 200, 50)
    while quit_requested() is False:
        process_events()
        clear_screen()
        label_element_at_position("Test Label", test_rectangle)
        draw_interface()
        refresh_screen()
    
    close_window(test_window)


def test_last_element_changed_integration():
    test_window = open_window("Test Window", 800, 600)
    while quit_requested() is False:
        process_events()
        clear_screen()
        slider("Test Slider", 0.0, 0.0, 100.0)
        draw_interface()
        refresh_screen()
    
    assert last_element_changed()
    close_window(test_window)


def test_last_element_confirmed_integration():
    test_window = open_window("Test Window", 800, 600)
    while quit_requested() is False:
        process_events()
        clear_screen()
        test_button = button("Test Button")
        draw_interface()
        refresh_screen()
    
    assert last_element_confirmed()
    close_window(test_window)


def test_leave_column_integration():
    test_window = open_window("Test Window", 800, 600)
    button_result = false;
    while quit_requested() is False:
        process_events()
        clear_screen()
        start_panel("Test Panel", rectangle_from(10, 10, 300, 200))
        start_custom_layout()
        add_column(100)
        enter_column()
        leave_column()
        button_result = button("Test Button");
        end_panel("Test Panel")
        draw_interface()
        refresh_screen()
    
    assert button_result
    close_window(test_window)


def test_number_box_at_position_integration():
    test_window = open_window("Test Window", 800, 600)
    test_rect = rectangle_from(100, 100, 200, 30)
    test_result = 5.0;
    while quit_requested() is False:
        process_events()
        clear_screen()
        test_result = number_box(test_result, 1.0, test_rect);
        draw_interface()
        refresh_screen()
    
    assert 1.0 <= test_result <= 5.0
    close_window(test_window)


def test_number_box_integration():
    test_window = open_window("Number Box Test", 800, 600)
    test_result = 5.0;
    while quit_requested() is False:
        process_events()
        clear_screen()
        test_result = number_box(test_result, 1.0);
        draw_interface()
        refresh_screen()
    
    assert 1.0 <= test_result <= 5.0
    close_window(test_window)


def test_number_box_labeled_integration():
    test_window = open_window("Test Window", 800, 600)
    test_result = 5.0;
    while quit_requested() is False:
        process_events()
        clear_screen()
        test_result = number_box("Test Value", test_result, 1.0);
        draw_interface()
        refresh_screen()
    
    assert 1.0 <= test_result <= 5.0
    close_window(test_window)


def test_open_popup_integration():
    test_window = open_window("Test Window", 800, 600)
    while quit_requested() is False:
        process_events()
        clear_screen()
        start_popup("Test Popup")
        end_popup("Test Popup")
        draw_interface()
        refresh_screen()
    
    close_window(test_window)


def test_paragraph_integration():
    test_window = open_window("Test Window", 800, 600)
    set_interface_font(load_font("hara", "hara.ttf"))
    set_interface_font_size(12)
    while quit_requested() is False:
        process_events()
        clear_screen()
        paragraph("This is a test paragraph to check if the text wraps correctly.")
        draw_interface()
        refresh_screen()
    
    free_font(font_named("hara"))
    close_window(test_window)


def test_paragraph_at_position_integration():
    test_window = open_window("Test Window", 800, 600)
    test_rectangle = rectangle_from(100, 100, 200, 100)
    while quit_requested() is False:
        process_events()
        clear_screen()
        paragraph_at_position("This is a test paragraph.", test_rectangle)
        draw_interface()
        refresh_screen()
    
    close_window(test_window)


def test_reset_layout_integration():
    test_window = open_window("Test Window", 800, 600)
    while quit_requested() is False:
        process_events()
        clear_screen()
        start_custom_layout()
        add_column(200)
        add_column(-1)
        reset_layout()
        draw_interface()
        refresh_screen()
    
    close_window(test_window)


def test_set_interface_accent_color_integration():
    test_window = open_window("Test Window", 800, 600)
    set_interface_accent_color(color_red(), 0.5)
    while quit_requested() is False:
        process_events()
        clear_screen()
        button("Test Button")
        draw_interface()
        refresh_screen()
    
    close_window(test_window)


def test_set_interface_border_color_integration():
    test_window = open_window("Test Window", 800, 600)
    set_interface_border_color(color_red())
    while quit_requested() is False:
        process_events()
        clear_screen()
        start_panel("Test Panel", rectangle_from(100, 100, 200, 100))
        button("Test Button")
        end_panel("Test Panel")
        draw_interface()
        refresh_screen()
    
    close_window(test_window)


def test_set_interface_colors_auto_integration():
    test_window = open_window("Test Window", 800, 600)
    set_interface_colors_auto(color_white(), color_blue(), 0.5, 0.7, 0.3)
    while quit_requested() is False:
        process_events()
        clear_screen()
        start_panel("Test Panel", rectangle_from(100, 100, 200, 200))
        button("Test Button")
        end_panel("Test Panel")
        draw_interface()
        refresh_screen()
    
    close_window(test_window)


def test_set_interface_element_color_integration():
    test_window = open_window("Test Window", 800, 600)
    while quit_requested() is False:
        process_events()
        clear_screen()
        set_interface_element_color(color_black(), 0.5)
        start_panel("Test Panel", rectangle_from(100, 100, 200, 200))
        button("Test Button")
        end_panel("Test Panel")
        draw_interface()
        refresh_screen()
    
    close_window(test_window)


def test_set_interface_element_shadows_integration():
    test_window = open_window("Test Window", 800, 600)
    while quit_requested() is False:
        process_events()
        clear_screen()
        start_panel("Test Panel", rectangle_from(100, 100, 200, 200))
        button("Test Button")
        end_panel("Test Panel")
        draw_interface()
        refresh_screen()
    
    close_window(test_window)


def test_set_interface_font_font_as_string_integration():
    test_window = open_window("Test Window", 800, 600)
    test_font = load_font("hara", "hara.ttf")
    set_interface_font_font_as_string("hara")
    while quit_requested() is False:
        process_events()
        clear_screen()
        label_element("Test Text")
        draw_interface()
        refresh_screen()
    
    close_window(test_window)


def test_set_interface_font_integration():
    test_window = open_window("Test Window", 800, 600)
    test_font = load_font("hara", "hara.ttf")
    set_interface_font(test_font)
    while quit_requested() is False:
        process_events()
        clear_screen()
        label_element("Test Text")
        draw_interface()
        refresh_screen()
    
    free_font(test_font)
    close_window(test_window)


def test_set_interface_font_size_integration():
    test_window = open_window("Test Window", 800, 600)
    set_interface_font_size(16)
    while quit_requested() is False:
        process_events()
        clear_screen()
        label_element("Test Text")
        draw_interface()
        refresh_screen()
    
    close_window(test_window)


def test_set_interface_label_width_integration():
    test_window = open_window("Test Window", 800, 600)
    set_interface_label_width(100)
    while quit_requested() is False:
        process_events()
        clear_screen()
        test_width = get_interface_label_width()
        draw_interface()
        refresh_screen()
    
    assert 100 == get_interface_label_width()
    close_window(test_window)


def test_set_interface_panel_shadows_integration():
    test_window = open_window("Test Window", 800, 600)
    set_interface_panel_shadows(10, rgba_color(0, 0, 0, 128), point_at(5, 5))
    while quit_requested() is False:
        process_events()
        clear_screen()
        start_panel("Test Panel", rectangle_from(100, 100, 200, 150))
        end_panel("Test Panel")
        draw_interface()
        refresh_screen()
    
    assert rgba_color(0, 0, 0, 128) == get_pixel(point_at(105, 105))
    close_window(test_window)


def test_set_interface_root_text_color_integration():
    test_window = open_window("Test Window", 800, 600)
    set_interface_root_text_color(color_red())
    while quit_requested() is False:
        process_events()
        clear_screen()
        label_element("Test Text", rectangle_from(100, 100, 200, 50))
        draw_interface()
        refresh_screen()
    
    assert color_red() == get_pixel(point_at(105, 105))
    close_window(test_window)


def test_set_interface_shadows_integration():
    test_window = open_window("Test Window", 800, 600)
    set_interface_shadows(10, rgba_color(0, 0, 0, 128), point_at(5, 5))
    while quit_requested() is False:
        process_events()
        clear_screen()
        start_panel("Test Panel", rectangle_from(100, 100, 200, 200))
        button("Test Button")
        end_panel("Test Panel")
        draw_interface()
        refresh_screen()
    
    assert rgba_color(0, 0, 0, 128) == get_pixel(point_at(105, 105))
    close_window(test_window)


def test_set_interface_spacing_integration():
    test_window = open_window("Test Window", 800, 600)
    set_interface_spacing(10, 5)
    while quit_requested() is False:
        process_events()
        clear_screen()
        start_panel("Test Panel", rectangle_from(100, 100, 200, 200))
        button("Button 1")
        button("Button 2")
        end_panel("Test Panel")
        draw_interface()
        refresh_screen()
    
    close_window(test_window)


def test_set_interface_style_integration():
    test_window = open_window("Test Window", 800, 600)
    set_interface_style(InterfaceStyle.ShadedDarkStyle)
    while quit_requested() is False:
        process_events()
        clear_screen()
        start_panel("Test Panel", rectangle_from(100, 100, 200, 200))
        button("Test Button")
        end_panel("Test Panel")
        draw_interface()
        refresh_screen()
    
    close_window(test_window)


def test_set_interface_style_with_color_integration():
    test_window = open_window("Test Window", 800, 600)
    set_interface_style_with_color(InterfaceStyle.ShadedDarkStyle, color_blue())
    while quit_requested() is False:
        process_events()
        clear_screen()
        test_panel = start_panel("Test Panel", rectangle_from(100, 100, 200, 200))
        button("Test Button")
        end_panel("Test Panel")
        draw_interface()
        refresh_screen()
    
    assert color_blue() == get_pixel(point_at(150, 150))
    close_window(test_window)


def test_set_interface_text_color_integration():
    test_window = open_window("Test Window", 800, 600)
    set_interface_text_color(color_red())
    while quit_requested() is False:
        process_events()
        clear_screen()
        label_element("Test Text")
        draw_interface()
        refresh_screen()
    
    assert color_red() == get_pixel(point_at(10, 10))
    close_window(test_window)


def test_set_layout_height_integration():
    test_window = open_window("Test Window", 800, 600)
    set_layout_height(50)
    while quit_requested() is False:
        process_events()
        clear_screen()
        start_panel("Test Panel", rectangle_from(0, 0, 800, 600))
        button("Test Button")
        end_panel("Test Panel")
        draw_interface()
        refresh_screen()
    
    close_window(test_window)


def test_single_line_layout_integration():
    test_window = open_window("Test Window", 800, 600)
    single_line_layout()
    while quit_requested() is False:
        process_events()
        clear_screen()
        test_button1 = button("Button1")
        test_button2 = button("Button2")
        reset_layout()
        draw_interface()
        refresh_screen()
    
    close_window(test_window)


def test_slider_at_position_integration():
    test_window = open_window("Test Window", 800, 600)
    test_rect = rectangle_from(100, 100, 200, 20)
    initial_value = 50.0;
    slider_result = initial_value;
    while quit_requested() is False:
        process_events()
        clear_screen()
        slider_result = slider(slider_result, 0.0, 100.0, test_rect);
        draw_interface()
        refresh_screen()
    
    assert initial_value != slider_result
    close_window(test_window)


def test_slider_integration():
    test_window = open_window("Test Window", 800, 600)
    initial_value = 50.0;
    slider_result = initial_value;
    while quit_requested() is False:
        process_events()
        clear_screen()
        slider_result = slider(slider_result, 0.0, 100.0);
        draw_interface()
        refresh_screen()
    
    assert initial_value != slider_result
    close_window(test_window)


def test_slider_labeled_integration():
    test_window = open_window("Test Window", 800, 600)
    initial_value = 50.0;
    slider_result = initial_value;
    while quit_requested() is False:
        process_events()
        clear_screen()
        slider_result = slider("Test Slider", slider_result, 0.0, 100.0);
        draw_interface()
        refresh_screen()
    
    assert initial_value != slider_result
    close_window(test_window)


def test_split_into_columns_integration():
    test_window = open_window("Test Window", 800, 600)
    while quit_requested() is False:
        process_events()
        clear_screen()
        start_panel("Test Panel", rectangle_from(0, 0, 800, 600))
        split_into_columns(3)
        button("Button 1")
        button("Button 2")
        button("Button 3")
        end_panel("Test Panel")
        draw_interface()
        refresh_screen()
    
    close_window(test_window)


def test_split_into_columns_with_last_width_integration():
    test_window = open_window("Test Window", 800, 600)
    while quit_requested() is False:
        process_events()
        clear_screen()
        start_panel("Test Panel", rectangle_from(0, 0, 800, 600))
        split_into_columns_with_last_width(3, 200)
        button("Button 1")
        button("Button 2")
        button("Button 3")
        end_panel("Test Panel")
        draw_interface()
        refresh_screen()
    
    close_window(test_window)


def test_split_into_columns_relative_with_last_width_integration():
    test_window = open_window("Test Window", 800, 600)
    while quit_requested() is False:
        process_events()
        clear_screen()
        start_panel("Test Panel", rectangle_from(0, 0, 800, 600))
        split_into_columns_relative_with_last_width(3, 0.5)
        button("Button 1")
        button("Button 2")
        button("Button 3")
        end_panel("Test Panel")
        draw_interface()
        refresh_screen()
    
    close_window(test_window)


def test_start_custom_layout_integration():
    test_window = open_window("Test Window", 800, 600)
    button_result = false;
    while quit_requested() is False:
        process_events()
        clear_screen()
        start_custom_layout()
        add_column(200)
        button_result = button("Test Button");
        reset_layout()
        draw_interface()
        refresh_screen()
    
    close_window(test_window)
    assert button_result


def test_start_inset_at_position_integration():
    test_window = open_window("Test Window", 800, 600)
    test_rect = rectangle_from(100, 100, 200, 200)
    while quit_requested() is False:
        process_events()
        clear_screen()
        start_inset_at_position("test_inset", test_rect)
        button("Test Button")
        end_inset("test_inset")
        draw_interface()
        refresh_screen()
    
    close_window(test_window)


def test_start_inset_integration():
    test_window = open_window("Test Window", 800, 600)
    while quit_requested() is False:
        process_events()
        clear_screen()
        start_inset("Test Inset", 100)
        button("Test Button")
        end_inset("Test Inset")
        draw_interface()
        refresh_screen()
    
    close_window(test_window)


def test_start_panel_integration():
    test_window = open_window("Test Window", 800, 600)
    test_rectangle = rectangle_from(100, 100, 200, 150)
    while quit_requested() is False:
        process_events()
        clear_screen()
        start_panel("Test Panel", test_rectangle)
        button("Test Button")
        end_panel("Test Panel")
        draw_interface()
        refresh_screen()
    
    close_window(test_window)


def test_start_popup_integration():
    test_window = open_window("Test Window", 800, 600)
    while quit_requested() is False:
        process_events()
        clear_screen()
        start_popup("Test Popup")
        button("Test Button")
        end_popup("Test Popup")
        draw_interface()
        refresh_screen()
    
    close_window(test_window)


def test_start_treenode_integration():
    test_window = open_window("Test Window", 800, 600)
    while quit_requested() is False:
        process_events()
        clear_screen()
        start_panel("Test Panel", rectangle_from(0, 0, 800, 600))
        start_treenode("Test Node")
        button("Test Button1")
        button("Test Button2")
        button("Test Button3")
        end_treenode("Test Node")
        end_panel("Test Panel")
        draw_interface()
        refresh_screen()
    
    close_window(test_window)


def test_text_box_integration():
    test_window = open_window("Test Window", 800, 600)
    initial_text = "Initial Text";
    text_result = initial_text;
    while quit_requested() is False:
        process_events()
        clear_screen()
        text_result = text_box(text_result);
        draw_interface()
        refresh_screen()
    
    assert initial_text != text_result
    close_window(test_window)


def test_text_box_at_position_integration():
    test_window = open_window("Test Window", 800, 600)
    test_rect = rectangle_from(100, 100, 200, 30)
    initial_text = "Initial Text";
    text_result = initial_text;
    while quit_requested() is False:
        process_events()
        clear_screen()
        text_result = text_box(text_result, test_rect);
        draw_interface()
        refresh_screen()
    
    assert initial_text != text_result
    close_window(test_window)


def test_text_box_labeled_integration():
    test_window = open_window("Test Window", 800, 600)
    initial_text = "Initial Text";
    text_result = initial_text;
    while quit_requested() is False:
        process_events()
        clear_screen()
        text_result = text_box("Enter Name", text_result);
        draw_interface()
        refresh_screen()
    
    assert initial_text != text_result
    close_window(test_window)

