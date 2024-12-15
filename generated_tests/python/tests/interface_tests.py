import pytest
from splashkit import *

class TestInterface:

def test_add_column_integration():
    test_window = open_window("Test Window", 800, 600)
    while quit_requested() is False:
        process_events()
        clear_screen_to_white()
        start_panel("Test Panel", rectangle_from(0.0, 0.0, 800.0, 600.0))
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
        clear_screen_to_white()
        start_panel("Test Panel", rectangle_from(0.0, 0.0, 800.0, 600.0))
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
        clear_screen_to_white()
        button_clicked = bitmap_button(test_bitmap)
        draw_interface()
        refresh_screen()
    
    assert button_clicked
    free_bitmap(test_bitmap)
    close_window(test_window)


def test_bitmap_button_at_position_integration():
    test_window = open_window("Test Window", 800, 600)
    test_bitmap = create_bitmap("test_bitmap", 100, 100)
    test_rectangle = rectangle_from(100.0, 100.0, 100.0, 100.0)
    button_clicked = false;
    while quit_requested() is False:
        process_events()
        clear_screen_to_white()
        button_clicked = bitmap_button_at_position(test_bitmap, test_rectangle)
        draw_interface()
        refresh_screen()
    
    assert button_clicked
    free_bitmap(test_bitmap)
    close_window(test_window)


def test_bitmap_button_at_position_with_options_integration():
    test_window = open_window("Test Window", 800, 600)
    test_bitmap = create_bitmap("test_bitmap", 100, 100)
    test_rectangle = rectangle_from(100.0, 100.0, 100.0, 100.0)
    button_clicked = false;
    while quit_requested() is False:
        process_events()
        clear_screen_to_white()
        button_clicked = bitmap_button_at_position_with_options(test_bitmap, test_rectangle, option_defaults())
        draw_interface()
        refresh_screen()
    
    assert button_clicked
    free_bitmap(test_bitmap)
    close_window(test_window)


def test_bitmap_button_with_options_integration():
    test_window = open_window("Test Window", 800, 600)
    test_bitmap = create_bitmap("test_bitmap", 100, 100)
    test_options1 = option_defaults()
    test_options2 = option_scale_bmp_with_options(0.5, 0.5, test_options1)
    button_clicked = false;
    while quit_requested() is False:
        process_events()
        clear_screen_to_white()
        button_clicked = bitmap_button_with_options(test_bitmap, test_options2)
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
        clear_screen_to_white()
        button_clicked = bitmap_button_labeled("Click Me", test_bitmap)
        draw_interface()
        refresh_screen()
    
    assert button_clicked
    free_bitmap(test_bitmap)
    close_window(test_window)


def test_bitmap_button_labeled_with_options_integration():
    test_window = open_window("Test Window", 800, 600)
    test_bitmap = create_bitmap("test_bitmap", 100, 100)
    test_options1 = option_defaults()
    test_options2 = option_scale_bmp_with_options(0.5, 0.5, test_options1)
    button_clicked = false;
    while quit_requested() is False:
        process_events()
        clear_screen_to_white()
        button_clicked = bitmap_button_labeled_with_options("Click Me", test_bitmap, test_options2)
        draw_interface()
        refresh_screen()
    
    assert button_clicked
    free_bitmap(test_bitmap)
    close_window(test_window)


def test_button_at_position_integration():
    test_window = open_window("Test Window", 800, 600)
    test_rectangle = rectangle_from(100.0, 100.0, 200.0, 50.0)
    button_clicked = false;
    while quit_requested() is False:
        process_events()
        clear_screen_to_white()
        button_clicked = button_at_position("Click Me", test_rectangle)
        draw_interface()
        refresh_screen()
    
    assert button_clicked
    close_window(test_window)


def test_button_integration():
    test_window = open_window("Test Window", 800, 600)
    button_clicked = false;
    while quit_requested() is False:
        process_events()
        clear_screen_to_white()
        button_clicked = button("Click Me")
        draw_interface()
        refresh_screen()
    
    assert button_clicked
    close_window(test_window)


def test_button_labeled_integration():
    test_window = open_window("Test Window", 800, 600)
    button_clicked = false;
    while quit_requested() is False:
        process_events()
        clear_screen_to_white()
        button_clicked = button_labeled("Label:", "Click Me")
        draw_interface()
        refresh_screen()
    
    assert button_clicked
    close_window(test_window)


def test_checkbox_at_position_integration():
    test_window = open_window("Test Window", 800, 600)
    test_rect = rectangle_from(100.0, 100.0, 200.0, 50.0)
    initial_checkbox_result = false;
    current_checkbox_result = initial_checkbox_result;
    while quit_requested() is False:
        process_events()
        clear_screen_to_white()
        current_checkbox_result = checkbox_at_position("Test Checkbox", current_checkbox_result, test_rect)
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
        clear_screen_to_white()
        current_checkbox_result = checkbox("Test Checkbox", current_checkbox_result)
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
        clear_screen_to_white()
        current_checkbox_result = checkbox_labeled("Test Checkbox", "Check me", current_checkbox_result)
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
        clear_screen_to_white()
        current_color = color_slider_at_position(current_color, rectangle_from(300.0, 300.0, 400.0, 24.0))
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
        clear_screen_to_white()
        current_color = color_slider(current_color)
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
        clear_screen_to_white()
        current_color = color_slider_labeled("Test Color Slider", current_color)
        draw_interface()
        refresh_screen()
    
    assert test_color != current_color
    close_window(test_window)


def test_disable_interface_integration():
    test_window = open_window("Test Window", 800, 600)
    start_panel("Test Panel", rectangle_from(100.0, 100.0, 200.0, 200.0))
    button("Test Button")
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
        clear_screen_to_white()
        start_panel("Test Panel", rectangle_from(100.0, 100.0, 200.0, 200.0))
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
        clear_screen_to_white()
        start_inset("Test Inset", 60)
        end_inset("Test Inset")
        draw_interface()
        refresh_screen()
    
    close_window(test_window)


def test_end_panel_integration():
    test_window = open_window("Test Window", 800, 600)
    while quit_requested() is False:
        process_events()
        clear_screen_to_white()
        start_panel("Test Panel", rectangle_from(100.0, 100.0, 200.0, 200.0))
        end_panel("Test Panel")
        draw_interface()
        refresh_screen()
    
    close_window(test_window)


def test_end_popup_integration():
    test_window = open_window("Test Window", 800, 600)
    while quit_requested() is False:
        process_events()
        clear_screen_to_white()
        start_popup("Test Popup")
        end_popup("Test Popup")
        draw_interface()
        refresh_screen()
    
    close_window(test_window)


def test_end_treenode_integration():
    test_window = open_window("Test Window", 800, 600)
    while quit_requested() is False:
        process_events()
        clear_screen_to_white()
        start_panel("Test Panel", rectangle_from(10.0, 10.0, 200.0, 200.0))
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
        clear_screen_to_white()
        start_panel("Test Panel", rectangle_from(10.0, 10.0, 300.0, 200.0))
        add_column(100)
        enter_column()
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
        clear_screen_to_white()
        header("Test Header")
        draw_interface()
        refresh_screen()
    
    close_window(test_window)


def test_hsb_color_slider_at_position_integration():
    test_window = open_window("Test Window", 800, 600)
    test_rect = rectangle_from(100.0, 100.0, 200.0, 100.0)
    test_color = hsb_color_slider_at_position(color_black(), test_rect)
    current_color = test_color;
    while quit_requested() is False:
        process_events()
        clear_screen_to_white()
        current_color = hsb_color_slider_at_position(current_color, test_rect)
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
        clear_screen_to_white()
        current_color = hsb_color_slider(current_color)
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
        clear_screen_to_white()
        current_color = hsb_color_slider_labeled("Color Slider", current_color)
        draw_interface()
        refresh_screen()
    
    assert test_color != current_color
    close_window(test_window)


def test_interface_enabled_integration():
    initial_state = interface_enabled()
    assert initial_state
    disable_interface()
    disabled_state = interface_enabled()
    assert not disabled_state
    enable_interface()
    enabled_state = interface_enabled()
    assert enabled_state


def test_interface_style_panel_integration():
    test_window = open_window("Test Window", 800, 600)
    test_rectangle = rectangle_from(0.0, 0.0, 200.0, 200.0)
    while quit_requested() is False:
        process_events()
        clear_screen_to_white()
        interface_style_panel(test_rectangle)
        draw_interface()
        refresh_screen()
    
    close_window(test_window)


def test_label_element_integration():
    test_window = open_window("Test Window", 800, 600)
    while quit_requested() is False:
        process_events()
        clear_screen_to_white()
        label_element("Test Label")
        draw_interface()
        refresh_screen()
    
    close_window(test_window)


def test_label_element_at_position_integration():
    test_window = open_window("Test Window", 800, 600)
    test_rectangle = rectangle_from(100.0, 100.0, 200.0, 50.0)
    while quit_requested() is False:
        process_events()
        clear_screen_to_white()
        label_element_at_position("Test Label", test_rectangle)
        draw_interface()
        refresh_screen()
    
    close_window(test_window)


def test_last_element_changed_integration():
    test_window = open_window("Test Window", 800, 600)
    while quit_requested() is False:
        process_events()
        clear_screen_to_white()
        slider_labeled("Test Slider", 0.0, 0.0, 100.0)
        draw_interface()
        refresh_screen()
    
    assert last_element_changed()
    close_window(test_window)


def test_last_element_confirmed_integration():
    test_window = open_window("Test Window", 800, 600)
    while quit_requested() is False:
        process_events()
        clear_screen_to_white()
        button("Test Button")
        draw_interface()
        refresh_screen()
    
    assert last_element_confirmed()
    close_window(test_window)


def test_leave_column_integration():
    test_window = open_window("Test Window", 800, 600)
    button_result = false;
    while quit_requested() is False:
        process_events()
        clear_screen_to_white()
        start_panel("Test Panel", rectangle_from(10.0, 10.0, 300.0, 200.0))
        start_custom_layout()
        add_column(100)
        enter_column()
        leave_column()
        button_result = button("Test Button")
        end_panel("Test Panel")
        draw_interface()
        refresh_screen()
    
    assert button_result
    close_window(test_window)


def test_number_box_at_position_integration():
    test_window = open_window("Test Window", 800, 600)
    test_rect = rectangle_from(100.0, 100.0, 200.0, 30.0)
    test_result = 5.0;
    while quit_requested() is False:
        process_events()
        clear_screen_to_white()
        test_result = number_box_at_position(test_result, 1.0, test_rect)
        draw_interface()
        refresh_screen()
    
    assert 1.0 <= test_result <= 5.0
    close_window(test_window)


def test_number_box_integration():
    test_window = open_window("Number Box Test", 800, 600)
    test_result = 5.0;
    while quit_requested() is False:
        process_events()
        clear_screen_to_white()
        test_result = number_box(test_result, 1.0)
        draw_interface()
        refresh_screen()
    
    assert 1.0 <= test_result <= 5.0
    close_window(test_window)


def test_number_box_labeled_integration():
    test_window = open_window("Test Window", 800, 600)
    test_result = 5.0;
    while quit_requested() is False:
        process_events()
        clear_screen_to_white()
        test_result = number_box_labeled("Test Value", test_result, 1.0)
        draw_interface()
        refresh_screen()
    
    assert 1.0 <= test_result <= 5.0
    close_window(test_window)


def test_open_popup_integration():
    test_window = open_window("Test Window", 800, 600)
    while quit_requested() is False:
        process_events()
        clear_screen_to_white()
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
        clear_screen_to_white()
        paragraph("This is a test paragraph to check if the text wraps correctly.")
        draw_interface()
        refresh_screen()
    
    free_font(font_named("hara"))
    close_window(test_window)


def test_paragraph_at_position_integration():
    test_window = open_window("Test Window", 800, 600)
    test_rectangle = rectangle_from(100.0, 100.0, 200.0, 100.0)
    while quit_requested() is False:
        process_events()
        clear_screen_to_white()
        paragraph_at_position("This is a test paragraph.", test_rectangle)
        draw_interface()
        refresh_screen()
    
    close_window(test_window)


def test_reset_layout_integration():
    test_window = open_window("Test Window", 800, 600)
    while quit_requested() is False:
        process_events()
        clear_screen_to_white()
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
        clear_screen_to_white()
        button("Test Button")
        draw_interface()
        refresh_screen()
    
    close_window(test_window)


def test_set_interface_border_color_integration():
    test_window = open_window("Test Window", 800, 600)
    set_interface_border_color(color_red())
    while quit_requested() is False:
        process_events()
        clear_screen_to_white()
        start_panel("Test Panel", rectangle_from(100.0, 100.0, 200.0, 100.0))
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
        clear_screen_to_white()
        start_panel("Test Panel", rectangle_from(100.0, 100.0, 200.0, 200.0))
        button("Test Button")
        end_panel("Test Panel")
        draw_interface()
        refresh_screen()
    
    close_window(test_window)


def test_set_interface_element_color_integration():
    test_window = open_window("Test Window", 800, 600)
    while quit_requested() is False:
        process_events()
        clear_screen_to_white()
        set_interface_element_color(color_black(), 0.5)
        start_panel("Test Panel", rectangle_from(100.0, 100.0, 200.0, 200.0))
        button("Test Button")
        end_panel("Test Panel")
        draw_interface()
        refresh_screen()
    
    close_window(test_window)


def test_set_interface_element_shadows_integration():
    test_window = open_window("Test Window", 800, 600)
    while quit_requested() is False:
        process_events()
        clear_screen_to_white()
        start_panel("Test Panel", rectangle_from(100.0, 100.0, 200.0, 200.0))
        button("Test Button")
        end_panel("Test Panel")
        draw_interface()
        refresh_screen()
    
    close_window(test_window)


def test_set_interface_font_font_as_string_integration():
    test_window = open_window("Test Window", 800, 600)
    load_font("hara", "hara.ttf")
    set_interface_font_font_as_string("hara")
    while quit_requested() is False:
        process_events()
        clear_screen_to_white()
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
        clear_screen_to_white()
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
        clear_screen_to_white()
        label_element("Test Text")
        draw_interface()
        refresh_screen()
    
    close_window(test_window)


def test_set_interface_label_width_integration():
    test_window = open_window("Test Window", 800, 600)
    set_interface_label_width(100)
    assert 100 == get_interface_label_width()
    close_window(test_window)


def test_set_interface_panel_shadows_integration():
    test_window = open_window("Test Window", 800, 600)
    set_interface_panel_shadows(10, rgba_color(0, 0, 0, 128), point_at(5.0, 5.0))
    while quit_requested() is False:
        process_events()
        clear_screen_to_white()
        start_panel("Test Panel", rectangle_from(100.0, 100.0, 200.0, 150.0))
        end_panel("Test Panel")
        draw_interface()
        refresh_screen()
    
    assert rgba_color(0, 0, 0, 128) == get_pixel_at_point(point_at(105.0, 105.0))
    close_window(test_window)


def test_set_interface_root_text_color_integration():
    test_window = open_window("Test Window", 800, 600)
    set_interface_root_text_color(color_red())
    while quit_requested() is False:
        process_events()
        clear_screen_to_white()
        label_element_at_position("Test Text", rectangle_from(100.0, 100.0, 200.0, 50.0))
        draw_interface()
        refresh_screen()
    
    assert color_red() == get_pixel_at_point(point_at(105.0, 105.0))
    close_window(test_window)


def test_set_interface_shadows_integration():
    test_window = open_window("Test Window", 800, 600)
    set_interface_shadows(10, rgba_color(0, 0, 0, 128), point_at(5.0, 5.0))
    while quit_requested() is False:
        process_events()
        clear_screen_to_white()
        start_panel("Test Panel", rectangle_from(100.0, 100.0, 200.0, 200.0))
        button("Test Button")
        end_panel("Test Panel")
        draw_interface()
        refresh_screen()
    
    assert rgba_color(0, 0, 0, 128) == get_pixel_at_point(point_at(105.0, 105.0))
    close_window(test_window)


def test_set_interface_spacing_integration():
    test_window = open_window("Test Window", 800, 600)
    set_interface_spacing(10, 5)
    while quit_requested() is False:
        process_events()
        clear_screen_to_white()
        start_panel("Test Panel", rectangle_from(100.0, 100.0, 200.0, 200.0))
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
        clear_screen_to_white()
        start_panel("Test Panel", rectangle_from(100.0, 100.0, 200.0, 200.0))
        button("Test Button")
        end_panel("Test Panel")
        draw_interface()
        refresh_screen()
    
    close_window(test_window)


def test_set_interface_style_with_color_integration():
    test_window = open_window("Test Window", 800, 600)
    set_interface_style_with_color(InterfaceStyle.ShadedDarkStyle, color_blue())
    assert color_blue() == get_pixel_at_point(point_at(150.0, 150.0))
    close_window(test_window)


def test_set_interface_text_color_integration():
    test_window = open_window("Test Window", 800, 600)
    set_interface_text_color(color_red())
    while quit_requested() is False:
        process_events()
        clear_screen_to_white()
        label_element("Test Text")
        draw_interface()
        refresh_screen()
    
    assert color_red() == get_pixel_at_point(point_at(10.0, 10.0))
    close_window(test_window)


def test_set_layout_height_integration():
    test_window = open_window("Test Window", 800, 600)
    set_layout_height(50)
    while quit_requested() is False:
        process_events()
        clear_screen_to_white()
        start_panel("Test Panel", rectangle_from(0.0, 0.0, 800.0, 600.0))
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
        clear_screen_to_white()
        button("Button1")
        button("Button2")
        reset_layout()
        draw_interface()
        refresh_screen()
    
    close_window(test_window)


def test_slider_at_position_integration():
    test_window = open_window("Test Window", 800, 600)
    test_rect = rectangle_from(100.0, 100.0, 200.0, 20.0)
    initial_value = 50.0;
    slider_result = initial_value;
    while quit_requested() is False:
        process_events()
        clear_screen_to_white()
        slider_result = slider_at_position(slider_result, 0.0, 100.0, test_rect)
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
        clear_screen_to_white()
        slider_result = slider(slider_result, 0.0, 100.0)
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
        clear_screen_to_white()
        slider_result = slider_labeled("Test Slider", slider_result, 0.0, 100.0)
        draw_interface()
        refresh_screen()
    
    assert initial_value != slider_result
    close_window(test_window)


def test_split_into_columns_integration():
    test_window = open_window("Test Window", 800, 600)
    while quit_requested() is False:
        process_events()
        clear_screen_to_white()
        start_panel("Test Panel", rectangle_from(0.0, 0.0, 800.0, 600.0))
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
        clear_screen_to_white()
        start_panel("Test Panel", rectangle_from(0.0, 0.0, 800.0, 600.0))
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
        clear_screen_to_white()
        start_panel("Test Panel", rectangle_from(0.0, 0.0, 800.0, 600.0))
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
        clear_screen_to_white()
        start_custom_layout()
        add_column(200)
        button_result = button("Test Button")
        reset_layout()
        draw_interface()
        refresh_screen()
    
    close_window(test_window)
    assert button_result


def test_start_inset_at_position_integration():
    test_window = open_window("Test Window", 800, 600)
    test_rect = rectangle_from(100.0, 100.0, 200.0, 200.0)
    while quit_requested() is False:
        process_events()
        clear_screen_to_white()
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
        clear_screen_to_white()
        start_inset("Test Inset", 100)
        button("Test Button")
        end_inset("Test Inset")
        draw_interface()
        refresh_screen()
    
    close_window(test_window)


def test_start_panel_integration():
    test_window = open_window("Test Window", 800, 600)
    test_rectangle = rectangle_from(100.0, 100.0, 200.0, 150.0)
    while quit_requested() is False:
        process_events()
        clear_screen_to_white()
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
        clear_screen_to_white()
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
        clear_screen_to_white()
        start_panel("Test Panel", rectangle_from(0.0, 0.0, 800.0, 600.0))
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
        clear_screen_to_white()
        text_result = text_box(text_result)
        draw_interface()
        refresh_screen()
    
    assert initial_text != text_result
    close_window(test_window)


def test_text_box_at_position_integration():
    test_window = open_window("Test Window", 800, 600)
    test_rect = rectangle_from(100.0, 100.0, 200.0, 30.0)
    initial_text = "Initial Text";
    text_result = initial_text;
    while quit_requested() is False:
        process_events()
        clear_screen_to_white()
        text_result = text_box_at_position(text_result, test_rect)
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
        clear_screen_to_white()
        text_result = text_box_labeled("Enter Name", text_result)
        draw_interface()
        refresh_screen()
    
    assert initial_text != text_result
    close_window(test_window)

