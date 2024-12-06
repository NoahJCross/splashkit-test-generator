import pytest
from splashkit import *


def test_AddColumn_integration():
    test_window = open_window("Test Window", 800, 600)
    test_panel = start_panel("Test Panel", rectangle_from(0, 0, 800, 600))
    start_custom_layout()
    add_column(100)
    add_column(-1)
    button("Test Button")
    end_panel("Test Panel")
    draw_interface()
    refresh_screen()
    close_window(test_window)


def test_AddColumnRelative_integration():
    test_window = open_window("Test Window", 800, 600)
    start_panel("Test Panel", rectangle_from(0, 0, 800, 600))
    start_custom_layout()
    add_column_relative(0.5)
    button("Button 1")
    add_column_relative(0.5)
    button("Button 2")
    end_panel("Test Panel")
    draw_interface()
    refresh_screen()
    assert point_in_rectangle(point_at(200, 300), rectangle_from(0, 0, 400, 600)) is True
    close_window(test_window)


def test_BitmapButton_integration():
    test_window = open_window("Test Window", 800, 600)
    test_bitmap = create_bitmap("test_bitmap", 100, 100)
    process_events()
    simulate_mouse_click(Mousebutton.Left)
    process_events()
    button_clicked = bitmap_button(test_bitmap)
    assert button_clicked is True
    free_bitmap(test_bitmap)
    close_window(test_window)


def test_BitmapButtonAtPosition_integration():
    test_window = open_window("Test Window", 800, 600)
    test_bitmap = create_bitmap("test_bitmap", 100, 100)
    test_rectangle = rectangle_from(100, 100, 100, 100)
    process_events()
    simulate_mouse_click(Mousebutton.Left)
    process_events()
    button_clicked = bitmap_button_at_position(test_bitmap, test_rectangle)
    assert button_clicked is True
    free_bitmap(test_bitmap)
    close_window(test_window)


def test_BitmapButtonAtPositionWithOptions_integration():
    test_window = open_window("Test Window", 800, 600)
    test_bitmap = create_bitmap("test_bitmap", 100, 100)
    test_rectangle = rectangle_from(100, 100, 100, 100)
    test_options = option_defaults()
    button_clicked = bitmap_button_at_position_with_options(test_bitmap, test_rectangle, test_options)
    process_events()
    simulate_mouse_click(Mousebutton.Left)
    process_events()
    assert button_clicked is True
    free_bitmap(test_bitmap)
    close_window(test_window)


def test_BitmapButtonWithOptions_integration():
    test_window = open_window("Test Window", 800, 600)
    test_bitmap = create_bitmap("test_bitmap", 100, 100)
    test_options1 = option_defaults()
    test_options2 = option_scale_bmp(0.5, 0.5, test_options1)
    process_events()
    simulate_mouse_click(Mousebutton.Left)
    process_events()
    button_clicked = bitmap_button_with_options(test_bitmap, test_options2)
    assert button_clicked is True
    free_bitmap(test_bitmap)
    close_window(test_window)


def test_BitmapButtonLabeled_integration():
    test_window = open_window("Test Window", 800, 600)
    test_bitmap = create_bitmap("test_bitmap", 100, 100)
    process_events()
    button_clicked1 = bitmap_button_labeled("Click Me", test_bitmap)
    assert button_clicked1 is False
    simulate_mouse_click(Mousebutton.Left)
    process_events()
    button_clicked2 = bitmap_button_labeled("Click Me", test_bitmap)
    assert button_clicked2 is True
    free_bitmap(test_bitmap)
    close_window(test_window)


def test_BitmapButtonLabeledWithOptions_integration():
    test_window = open_window("Test Window", 800, 600)
    test_bitmap = create_bitmap("test_bitmap", 100, 100)
    test_options1 = option_defaults()
    test_options2 = option_scale_bmp(0.5, 0.5, test_options1)
    process_events()
    simulate_mouse_click(Mousebutton.Left)
    process_events()
    button_clicked = bitmap_button_labeled_with_options("Click Me", test_bitmap, test_options2)
    assert button_clicked is True
    free_bitmap(test_bitmap)
    close_window(test_window)


def test_ButtonAtPosition_integration():
    test_window = open_window("Test Window", 800, 600)
    test_rectangle = rectangle_from(100, 100, 200, 50)
    process_events()
    button_clicked1 = button_at_position("Click Me", test_rectangle)
    assert button_clicked1 is False
    simulate_mouse_click(Mousebutton.Left)
    process_events()
    button_clicked2 = button_at_position("Click Me", test_rectangle)
    assert button_clicked2 is True
    close_window(test_window)


def test_Button_integration():
    test_window = open_window("Test Window", 800, 600)
    test_panel = start_panel("Test Panel", rectangle_from(100, 100, 200, 100))
    process_events()
    button_clicked1 = button("Click Me")
    assert button_clicked1 is False
    simulate_mouse_click(Mousebutton.Left)
    process_events()
    button_clicked2 = button("Click Me")
    assert button_clicked2 is True
    end_panel("Test Panel")
    close_window(test_window)


def test_ButtonLabeled_integration():
    test_window = open_window("Test Window", 800, 600)
    process_events()
    button_result1 = button_labeled("Label:", "Click Me")
    assert button_result1 is False
    simulate_mouse_click(Mousebutton.Left)
    process_events()
    button_result2 = button_labeled("Label:", "Click Me")
    assert button_result2 is True
    close_window(test_window)


def test_CheckboxAtPosition_integration():
    test_window = open_window("Test Window", 800, 600)
    test_rect = rectangle_from(100, 100, 200, 50)
    process_events()
    test_checkbox_result1 = checkbox_at_position("Test Checkbox", false, test_rect)
    assert test_checkbox_result1 is False
    simulate_mouse_click(Mousebutton.Left)
    process_events()
    test_checkbox_result2 = checkbox_at_position("Test Checkbox", test_checkbox_result1, test_rect)
    assert test_checkbox_result2 is True
    close_window(test_window)


def test_Checkbox_integration():
    test_window = open_window("Test Window", 800, 600)
    process_events()
    test_checkbox_result1 = checkbox("Test Checkbox", false)
    assert test_checkbox_result1 is False
    simulate_mouse_click(Mousebutton.Left)
    process_events()
    test_checkbox_result2 = checkbox("Test Checkbox", test_checkbox_result1)
    assert test_checkbox_result2 is True
    close_window(test_window)


def test_CheckboxLabeled_integration():
    test_window = open_window("Test Window", 800, 600)
    process_events()
    test_checkbox_result1 = checkbox_labeled("Test Checkbox", "Check me", false)
    assert test_checkbox_result1 is False
    simulate_mouse_click(Mousebutton.Left)
    process_events()
    test_checkbox_result2 = checkbox_labeled("Test Checkbox", "Check me", test_checkbox_result1)
    assert test_checkbox_result2 is True
    close_window(test_window)


def test_ColorSliderAtPosition_integration():
    test_window = open_window("Test Window", 800, 600)
    test_color = color_black()
    test_rect = rectangle_from(100, 100, 200, 100)
    result_color = color_slider_at_position(test_color, test_rect)
    process_events()
    simulate_mouse_click(Mousebutton.Left)
    process_events()
    assert test_color != result_color
    close_window(test_window)


def test_ColorSlider_integration():
    test_window = open_window("Test Window", 800, 600)
    test_color = color_black()
    result_color = color_slider(test_color)
    draw_interface()
    refresh_screen()
    assert test_color != result_color
    close_window(test_window)


def test_ColorSliderLabeled_integration():
    test_window = open_window("Test Window", 800, 600)
    test_color = color_black()
    result_color = color_slider_labeled("Test Color Slider", test_color)
    process_events()
    assert result_color != color_black()
    close_window(test_window)


def test_DisableInterface_integration():
    test_window = open_window("Test Window", 800, 600)
    test_panel = start_panel("Test Panel", rectangle_from(100, 100, 200, 200))
    test_button = button("Test Button")
    process_events()
    assert interface_enabled() is True
    disable_interface()
    process_events()
    assert interface_enabled() is False
    enable_interface()
    process_events()
    assert interface_enabled() is True
    end_panel("Test Panel")
    close_window(test_window)


def test_DrawInterface_integration():
    test_window = open_window("Test Window", 800, 600)
    start_panel("Test Panel", rectangle_from(100, 100, 200, 200))
    button("Test Button")
    end_panel("Test Panel")
    draw_interface()
    refresh_screen()
    assert get_pixel(point_at(150, 150)) == color_black()
    close_window(test_window)


def test_EnableInterface_integration():
    test_window = open_window("Test Window", 800, 600)
    disable_interface()
    process_events()
    assert interface_enabled() is False
    enable_interface()
    process_events()
    assert interface_enabled() is True
    close_window(test_window)


def test_EndInset_integration():
    test_window = open_window("Test Window", 800, 600)
    start_inset("Test Inset", 60)
    end_inset("Test Inset")
    close_window(test_window)


def test_EndPanel_integration():
    test_window = open_window("Test Window", 800, 600)
    test_panel = start_panel("Test Panel", rectangle_from(100, 100, 200, 200))
    end_panel("Test Panel")
    close_window(test_window)


def test_EndPopup_integration():
    test_window = open_window("Test Window", 800, 600)
    test_popup = start_popup("Test Popup")
    end_popup("Test Popup")
    close_window(test_window)


def test_EndTreenode_integration():
    test_window = open_window("Test Window", 800, 600)
    start_panel("Test Panel", rectangle_from(10, 10, 200, 200))
    test_node = start_treenode("Test Node")
    end_treenode("Test Node")
    end_panel("Test Panel")
    draw_interface()
    refresh_screen()
    close_window(test_window)


def test_EnterColumn_integration():
    test_window = open_window("Test Window", 800, 600)
    test_panel = start_panel("Test Panel", rectangle_from(10, 10, 300, 200))
    add_column(100)
    enter_column()
    button("Button1")
    leave_column()
    end_panel("Test Panel")
    draw_interface()
    refresh_screen()
    close_window(test_window)


def test_GetInterfaceLabelWidth_integration():
    test_label_width = get_interface_label_width()
    assert test_label_width == 60


def test_Header_integration():
    test_window = open_window("Test Window", 800, 600)
    process_events()
    test_header_result = header("Test Header")
    assert test_header_result is not None
    close_window(test_window)


def test_HSBColorSliderAtPosition_integration():
    test_window = open_window("Test Window", 800, 600)
    test_color = hsb_color(0.5, 1.0, 0.5)
    test_rect = rectangle_from(100, 100, 200, 100)
    result_color = hsb_color_slider_at_position(test_color, test_rect)
    process_events()
    assert test_color != result_color
    close_window(test_window)


def test_HSBColorSlider_integration():
    test_window = open_window("HSB Slider Test", 800, 600)
    test_color = color_black()
    result_color = hsb_color_slider(test_color)
    draw_interface()
    refresh_screen()
    assert test_color != result_color
    close_window(test_window)


def test_HSBColorSliderLabeled_integration():
    test_window = open_window("Test Window", 800, 600)
    test_color = color_black()
    test_result_color = hsb_color_slider_labeled("Color Slider", test_color)
    process_events()
    assert test_result_color != color_black()
    close_window(test_window)


def test_InterfaceEnabled_integration():
    initial_state = interface_enabled()
    disable_interface()
    disabled_state = interface_enabled()
    assert disabled_state is False
    enable_interface()
    enabled_state = interface_enabled()
    assert enabled_state is True


def test_InterfaceStylePanel_integration():
    test_window = open_window("Test Window", 800, 600)
    test_rectangle = rectangle_from(0, 0, 200, 200)
    interface_style_panel(test_rectangle)
    refresh_screen()
    close_window(test_window)


def test_LabelElement_integration():
    test_window = open_window("Test Window", 800, 600)
    label_element("Test Label")
    draw_interface()
    refresh_screen()
    assert pixel_drawn_at_point(point_at(10, 10)) is True
    close_window(test_window)


def test_LabelElementAtPosition_integration():
    test_window = open_window("Test Window", 800, 600)
    test_rectangle = rectangle_from(100, 100, 200, 50)
    label_element_at_position("Test Label", test_rectangle)
    refresh_screen()
    close_window(test_window)


def test_LastElementChanged_integration():
    test_window = open_window("Test Window", 800, 600)
    process_events()
    slider("Test Slider", 0.0, 0.0, 100.0)
    process_events()
    assert last_element_changed() is False
    simulate_mouse_move(100, 100)
    simulate_mouse_down(Mousebutton.Left)
    simulate_mouse_move(200, 200)
    simulate_mouse_up(Mousebutton.Left)
    process_events()
    assert last_element_changed() is True
    close_window(test_window)


def test_LastElementConfirmed_integration():
    test_window = open_window("Test Window", 800, 600)
    test_button = button("Test Button")
    process_events()
    assert last_element_confirmed() is False
    simulate_mouse_click(Mousebutton.Left)
    process_events()
    assert last_element_confirmed() is True
    close_window(test_window)


def test_LeaveColumn_integration():
    test_window = open_window("Test Window", 800, 600)
    start_panel("Test Panel", rectangle_from(10, 10, 300, 200))
    start_custom_layout()
    add_column(100)
    enter_column()
    leave_column()
    button_result = button("Test Button")
    assert button_result is False
    end_panel("Test Panel")
    close_window(test_window)


def test_NumberBoxAtPosition_integration():
    test_window = open_window("Test Window", 800, 600)
    test_rect = rectangle_from(100, 100, 200, 30)
    test_result = number_box_at_position(5.0, 1.0, test_rect)
    process_events()
    assert 4.0 <= test_result <= 6.0
    close_window(test_window)


def test_NumberBox_integration():
    test_window = open_window("Number Box Test", 800, 600)
    process_events()
    test_result = number_box(5.0, 1.0)
    assert 4.0 <= test_result <= 6.0
    close_window(test_window)


def test_NumberBoxLabeled_integration():
    test_window = open_window("Test Window", 800, 600)
    test_result = number_box_labeled("Test Value", 5.0, 1.0)
    assert 4.0 <= test_result <= 6.0
    close_window(test_window)


def test_OpenPopup_integration():
    test_window = open_window("Test Window", 800, 600)
    test_popup = start_popup("Test Popup")
    process_events()
    open_popup("Test Popup")
    process_events()
    assert popup_is_open is True
    end_popup("Test Popup")
    close_window(test_window)


def test_Paragraph_integration():
    test_window = open_window("Test Window", 800, 600)
    set_interface_font(load_font("test_font", "arial.ttf"))
    set_interface_font_size(12)
    paragraph("This is a test paragraph to check if the text wraps correctly.")
    draw_interface()
    refresh_screen()
    assert get_pixel(point_at(10, 10)) == color_black()
    free_font(font_named("test_font"))
    close_window(test_window)


def test_ParagraphAtPosition_integration():
    test_window = open_window("Test Window", 800, 600)
    test_rectangle = rectangle_from(100, 100, 200, 100)
    paragraph_at_position("This is a test paragraph.", test_rectangle)
    refresh_screen()
    assert get_pixel(point_at(rectangle_left(test_rectangle), rectangle_top(test_rectangle))) == color_black()
    close_window(test_window)


def test_ResetLayout_integration():
    test_window = open_window("Test Window", 800, 600)
    start_custom_layout()
    add_column(200)
    add_column(-1)
    reset_layout()
    draw_interface()
    refresh_screen()
    close_window(test_window)


def test_SetInterfaceAccentColor_integration():
    test_window = open_window("Test Window", 800, 600)
    set_interface_accent_color(color_red(), 0.5)
    button("Test Button")
    draw_interface()
    refresh_screen()
    assert get_pixel(point_at(10, 10)) == color_red()
    close_window(test_window)


def test_SetInterfaceBorderColor_integration():
    test_window = open_window("Test Window", 800, 600)
    set_interface_border_color(color_red())
    start_panel("Test Panel", rectangle_from(100, 100, 200, 100))
    button("Test Button")
    end_panel("Test Panel")
    draw_interface()
    refresh_screen()
    assert get_pixel(100, 100) == color_red()
    close_window(test_window)


def test_SetInterfaceColorsAuto_integration():
    test_window = open_window("Test Window", 800, 600)
    set_interface_colors_auto(color_white(), color_blue(), 0.5, 0.7, 0.3)
    start_panel("Test Panel", rectangle_from(100, 100, 200, 200))
    button("Test Button")
    end_panel("Test Panel")
    draw_interface()
    refresh_screen()
    assert get_pixel(150, 150) == color_blue()
    close_window(test_window)


def test_SetInterfaceElementColor_integration():
    test_window = open_window("Test Window", 800, 600)
    set_interface_element_color(color_black(), 0.5)
    start_panel("Test Panel", rectangle_from(100, 100, 200, 200))
    button("Test Button")
    end_panel("Test Panel")
    draw_interface()
    refresh_screen()
    assert get_pixel(150, 150) == color_black()
    close_window(test_window)


def test_SetInterfaceElementShadows_integration():
    test_window = open_window("Test Window", 800, 600)
    set_interface_element_shadows(10, color_black(), point_at(5, 5))
    start_panel("Test Panel", rectangle_from(100, 100, 200, 200))
    button("Test Button")
    end_panel("Test Panel")
    draw_interface()
    refresh_screen()
    assert pixel_drawn_at_point(point_at(105, 105)) is True
    close_window(test_window)


def test_SetInterfaceFontFontAsString_integration():
    test_window = open_window("Test Window", 800, 600)
    set_interface_font_font_as_string("Arial")
    label_element("Test Text")
    draw_interface()
    refresh_screen()
    close_window(test_window)


def test_SetInterfaceFont_integration():
    test_window = open_window("Test Window", 800, 600)
    test_font = load_font("test_font", "arial.ttf")
    set_interface_font(test_font)
    label_element("Test Text")
    draw_interface()
    refresh_screen()
    free_font(test_font)
    close_window(test_window)


def test_SetInterfaceFontSize_integration():
    test_window = open_window("Test Window", 800, 600)
    set_interface_font_size(16)
    label_element("Test Text")
    draw_interface()
    assert pixel_drawn_at_point(point_at(10, 20)) is True
    close_window(test_window)


def test_SetInterfaceLabelWidth_integration():
    test_window = open_window("Test Window", 800, 600)
    set_interface_label_width(100)
    test_width = get_interface_label_width()
    assert test_width == 100
    close_window(test_window)


def test_SetInterfacePanelShadows_integration():
    test_window = open_window("Test Window", 800, 600)
    set_interface_panel_shadows(10, rgba_color(0, 0, 0, 128), point_at(5, 5))
    panel_visible = start_panel("Test Panel", rectangle_from(100, 100, 200, 150))
    end_panel("Test Panel")
    draw_interface()
    refresh_screen()
    assert get_pixel(point_at(105, 105)) == rgba_color(0, 0, 0, 128)
    close_window(test_window)


def test_SetInterfaceRootTextColor_integration():
    test_window = open_window("Test Window", 800, 600)
    set_interface_root_text_color(color_red())
    label_element("Test Text", rectangle_from(100, 100, 200, 50))
    refresh_screen()
    assert pixel_drawn_at_point(color_red(), 105, 105) is True
    close_window(test_window)


def test_SetInterfaceShadows_integration():
    test_window = open_window("Test Window", 800, 600)
    set_interface_shadows(10, rgba_color(0, 0, 0, 128), point_at(5, 5))
    panel_visible = start_panel("Test Panel", rectangle_from(100, 100, 200, 200))
if assert panel_visible is True
:
        button("Test Button")
        end_panel("Test Panel")
        draw_interface()
        refresh_screen()
        assert pixel_drawn_at_point(point_at(105, 105)) is True


    close_window(test_window)


def test_SetInterfaceSpacing_integration():
    test_window = open_window("Test Window", 800, 600)
    set_interface_spacing(10, 5)
    test_panel = start_panel("Test Panel", rectangle_from(100, 100, 200, 200))
    button("Button 1")
    button("Button 2")
    end_panel("Test Panel")
    draw_interface()
    refresh_screen()
    assert pixel_drawn_at_point(point_at(110, 110)) is True
    close_window(test_window)


def test_SetInterfaceStyle_integration():
    test_window = open_window("Test Window", 800, 600)
    set_interface_style(InterfaceStyle.Dark)
    button("Test Button")
    draw_interface()
    refresh_screen()
    close_window(test_window)


def test_SetInterfaceStyleWithColor_integration():
    test_window = open_window("Test Window", 800, 600)
    set_interface_style_with_color(InterfaceStyle.Dark, color_blue())
    test_panel = start_panel("Test Panel", rectangle_from(100, 100, 200, 200))
    button("Test Button")
    draw_interface()
    refresh_screen()
    assert get_pixel(point_at(150, 150)) == color_blue()
    close_window(test_window)


def test_SetInterfaceTextColor_integration():
    test_window = open_window("Test Window", 800, 600)
    set_interface_text_color(color_red())
    label_element("Test Text")
    draw_interface()
    refresh_screen()
    assert get_pixel(point_at(10, 10)) == color_red()
    close_window(test_window)


def test_SetLayoutHeight_integration():
    test_window = open_window("Test Window", 800, 600)
    test_panel = start_panel("Test Panel", rectangle_from(0, 0, 800, 600))
    set_layout_height(50)
    button("Test Button")
    end_panel("Test Panel")
    draw_interface()
    refresh_screen()
    close_window(test_window)


def test_SingleLineLayout_integration():
    test_window = open_window("Test Window", 800, 600)
    single_line_layout()
    test_button1 = button("Button1")
    test_button2 = button("Button2")
    reset_layout()
    close_window(test_window)


def test_SliderAtPosition_integration():
    test_window = open_window("Test Window", 800, 600)
    test_rect = rectangle_from(100, 100, 200, 20)
    process_events()
    slider_result = slider_at_position(50.0, 0.0, 100.0, test_rect)
    assert 0.0 <= slider_result <= 100.0
    close_window(test_window)


def test_Slider_integration():
    test_window = open_window("Test Window", 800, 600)
    process_events()
    test_slider_result = slider(50.0, 0.0, 100.0)
    assert 0.0 <= test_slider_result <= 100.0
    close_window(test_window)


def test_SliderLabeled_integration():
    test_window = open_window("Test Window", 800, 600)
    test_slider_value = slider_labeled("Test Slider", 50.0, 0.0, 100.0)
    assert 0.0 <= test_slider_value <= 100.0
    close_window(test_window)


def test_SplitIntoColumns_integration():
    test_window = open_window("Test Window", 800, 600)
    start_panel("Test Panel", rectangle_from(0, 0, 800, 600))
    split_into_columns(3)
    end_panel("Test Panel")
    close_window(test_window)


def test_SplitIntoColumnsWithLastWidth_integration():
    test_window = open_window("Test Window", 800, 600)
    test_panel = start_panel("Test Panel", rectangle_from(0, 0, 800, 600))
    split_into_columns_with_last_width(3, 200)
    button("Button 1")
    button("Button 2")
    button("Button 3")
    end_panel("Test Panel")
    close_window(test_window)


def test_SplitIntoColumnsRelativeWithLastWidth_integration():
    test_window = open_window("Test Window", 800, 600)
    test_panel = start_panel("Test Panel", rectangle_from(0, 0, 800, 600))
    split_into_columns_relative_with_last_width(3, 0.5)
    button("Button 1")
    button("Button 2")
    button("Button 3")
    end_panel("Test Panel")
    draw_interface()
    refresh_screen()
    assert point_in_rectangle(point_at(200, 300), rectangle_from(0, 0, 200, 600)) is True
    assert point_in_rectangle(point_at(600, 300), rectangle_from(400, 0, 400, 600)) is True
    close_window(test_window)


def test_StartCustomLayout_integration():
    test_window = open_window("Test Window", 800, 600)
    start_custom_layout()
    add_column(200)
    button_result = button("Test Button")
    reset_layout()
    close_window(test_window)
    assert button_result is True


def test_StartInsetAtPosition_integration():
    test_window = open_window("Test Window", 800, 600)
    test_rect = rectangle_from(100, 100, 200, 200)
    start_inset_at_position("test_inset", test_rect)
    end_inset("test_inset")
    close_window(test_window)


def test_StartInset_integration():
    test_window = open_window("Test Window", 800, 600)
    start_panel("Test Panel", rectangle_from(100, 100, 300, 300))
    start_inset("Test Inset", 100)
    button("Test Button")
    end_inset("Test Inset")
    end_panel("Test Panel")
    close_window(test_window)


def test_StartPanel_integration():
    test_window = open_window("Test Window", 800, 600)
    test_rectangle = rectangle_from(100, 100, 200, 150)
    panel_visible = start_panel("Test Panel", test_rectangle)
    assert panel_visible is True
    end_panel("Test Panel")
    close_window(test_window)


def test_StartPopup_integration():
    test_window = open_window("Test Window", 800, 600)
    popup_visible = start_popup("Test Popup")
    assert popup_visible is True
    end_popup("Test Popup")
    close_window(test_window)


def test_StartTreenode_integration():
    test_window = open_window("Test Window", 800, 600)
    start_panel("Test Panel", rectangle_from(0, 0, 800, 600))
    test_node_expanded = start_treenode("Test Node")
    assert test_node_expanded is True
    end_treenode("Test Node")
    end_panel("Test Panel")
    close_window(test_window)


def test_TextBox_integration():
    test_window = open_window("Test Window", 800, 600)
    test_text_box_result = text_box("Initial Text")
    process_events()
    assert test_text_box_result == "Initial Text"
    simulate_key_press(Keycode.A)
    process_events()
    test_text_box_result_updated = text_box(test_text_box_result)
    assert test_text_box_result_updated == "Initial TextA"
    close_window(test_window)


def test_TextBoxAtPosition_integration():
    test_window = open_window("Test Window", 800, 600)
    test_rect = rectangle_from(100, 100, 200, 30)
    process_events()
    test_result1 = text_box_at_position("Initial Text", test_rect)
    assert test_result2 == "Initial Text"
    simulate_key_press(Keycode.A)
    process_events()
    test_result2 = text_box_at_position(test_result1, test_rect)
    assert test_result1 == "Initial TextA"
    close_window(test_window)


def test_TextBoxLabeled_integration():
    test_window = open_window("Test Window", 800, 600)
    test_text_box_result = text_box_labeled("Enter Name", "John")
    process_events()
    assert test_text_box_result == "John"
    close_window(test_window)

