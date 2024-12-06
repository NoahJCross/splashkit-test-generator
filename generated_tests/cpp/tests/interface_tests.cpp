#include "splashkit.h"
#include <catch2/catch.hpp>

TEST_CASE("add_column_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_panel = start_panel("Test Panel", rectangle_from(0, 0, 800, 600));
    start_custom_layout();
    add_column(100);
    add_column(-1);
    button("Test Button");
    end_panel("Test Panel");
    draw_interface();
    refresh_screen();
    close_window(test_window);
}
TEST_CASE("add_column_relative_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    start_panel("Test Panel", rectangle_from(0, 0, 800, 600));
    start_custom_layout();
    add_column_relative(0.5);
    button("Button 1");
    add_column_relative(0.5);
    button("Button 2");
    end_panel("Test Panel");
    draw_interface();
    refresh_screen();
    REQUIRE(point_in_rectangle(point_at(200, 300), rectangle_from(0, 0, 400, 600)));
    close_window(test_window);
}
TEST_CASE("bitmap_button_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
    process_events();
    simulate_mouse_click(Mousebutton::LEFT);
    process_events();
    auto button_clicked = bitmap_button(test_bitmap);
    REQUIRE(button_clicked);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
TEST_CASE("bitmap_button_at_position_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
    auto test_rectangle = rectangle_from(100, 100, 100, 100);
    process_events();
    simulate_mouse_click(Mousebutton::LEFT);
    process_events();
    auto button_clicked = bitmap_button(test_bitmap, test_rectangle);
    REQUIRE(button_clicked);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
TEST_CASE("bitmap_button_at_position_with_options_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
    auto test_rectangle = rectangle_from(100, 100, 100, 100);
    auto test_options = option_defaults();
    auto button_clicked = bitmap_button(test_bitmap, test_rectangle, test_options);
    process_events();
    simulate_mouse_click(Mousebutton::LEFT);
    process_events();
    REQUIRE(button_clicked);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
TEST_CASE("bitmap_button_with_options_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
    auto test_options1 = option_defaults();
    auto test_options2 = option_scale_bmp(0.5, 0.5, test_options1);
    process_events();
    simulate_mouse_click(Mousebutton::LEFT);
    process_events();
    auto button_clicked = bitmap_button(test_bitmap, test_options2);
    REQUIRE(button_clicked);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
TEST_CASE("bitmap_button_labeled_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
    process_events();
    auto button_clicked1 = bitmap_button("Click Me", test_bitmap);
    REQUIRE_FALSE(button_clicked1);
    simulate_mouse_click(Mousebutton::LEFT);
    process_events();
    auto button_clicked2 = bitmap_button("Click Me", test_bitmap);
    REQUIRE(button_clicked2);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
TEST_CASE("bitmap_button_labeled_with_options_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
    auto test_options1 = option_defaults();
    auto test_options2 = option_scale_bmp(0.5, 0.5, test_options1);
    process_events();
    simulate_mouse_click(Mousebutton::LEFT);
    process_events();
    auto button_clicked = bitmap_button("Click Me", test_bitmap, test_options2);
    REQUIRE(button_clicked);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
TEST_CASE("button_at_position_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_rectangle = rectangle_from(100, 100, 200, 50);
    process_events();
    auto button_clicked1 = button("Click Me", test_rectangle);
    REQUIRE_FALSE(button_clicked1);
    simulate_mouse_click(Mousebutton::LEFT);
    process_events();
    auto button_clicked2 = button("Click Me", test_rectangle);
    REQUIRE(button_clicked2);
    close_window(test_window);
}
TEST_CASE("button_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_panel = start_panel("Test Panel", rectangle_from(100, 100, 200, 100));
    process_events();
    auto button_clicked1 = button("Click Me");
    REQUIRE_FALSE(button_clicked1);
    simulate_mouse_click(Mousebutton::LEFT);
    process_events();
    auto button_clicked2 = button("Click Me");
    REQUIRE(button_clicked2);
    end_panel("Test Panel");
    close_window(test_window);
}
TEST_CASE("button_labeled_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    process_events();
    auto button_result1 = button("Label:", "Click Me");
    REQUIRE_FALSE(button_result1);
    simulate_mouse_click(Mousebutton::LEFT);
    process_events();
    auto button_result2 = button("Label:", "Click Me");
    REQUIRE(button_result2);
    close_window(test_window);
}
TEST_CASE("checkbox_at_position_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_rect = rectangle_from(100, 100, 200, 50);
    process_events();
    auto test_checkbox_result1 = checkbox("Test Checkbox", false, test_rect);
    REQUIRE_FALSE(test_checkbox_result1);
    simulate_mouse_click(Mousebutton::LEFT);
    process_events();
    auto test_checkbox_result2 = checkbox("Test Checkbox", test_checkbox_result1, test_rect);
    REQUIRE(test_checkbox_result2);
    close_window(test_window);
}
TEST_CASE("checkbox_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    process_events();
    auto test_checkbox_result1 = checkbox("Test Checkbox", false);
    REQUIRE_FALSE(test_checkbox_result1);
    simulate_mouse_click(Mousebutton::LEFT);
    process_events();
    auto test_checkbox_result2 = checkbox("Test Checkbox", test_checkbox_result1);
    REQUIRE(test_checkbox_result2);
    close_window(test_window);
}
TEST_CASE("checkbox_labeled_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    process_events();
    auto test_checkbox_result1 = checkbox("Test Checkbox", "Check me", false);
    REQUIRE_FALSE(test_checkbox_result1);
    simulate_mouse_click(Mousebutton::LEFT);
    process_events();
    auto test_checkbox_result2 = checkbox("Test Checkbox", "Check me", test_checkbox_result1);
    REQUIRE(test_checkbox_result2);
    close_window(test_window);
}
TEST_CASE("color_slider_at_position_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_color = color_black();
    auto test_rect = rectangle_from(100, 100, 200, 100);
    auto result_color = color_slider(test_color, test_rect);
    process_events();
    simulate_mouse_click(Mousebutton::LEFT);
    process_events();
    REQUIRE(test_color != result_color);
    close_window(test_window);
}
TEST_CASE("color_slider_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_color = color_black();
    auto result_color = color_slider(test_color);
    draw_interface();
    refresh_screen();
    REQUIRE(test_color != result_color);
    close_window(test_window);
}
TEST_CASE("color_slider_labeled_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_color = color_black();
    auto result_color = color_slider("Test Color Slider", test_color);
    process_events();
    REQUIRE(result_color != color_black());
    close_window(test_window);
}
TEST_CASE("disable_interface_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_panel = start_panel("Test Panel", rectangle_from(100, 100, 200, 200));
    auto test_button = button("Test Button");
    process_events();
    REQUIRE(interface_enabled());
    disable_interface();
    process_events();
    REQUIRE_FALSE(interface_enabled());
    enable_interface();
    process_events();
    REQUIRE(interface_enabled());
    end_panel("Test Panel");
    close_window(test_window);
}
TEST_CASE("draw_interface_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    start_panel("Test Panel", rectangle_from(100, 100, 200, 200));
    button("Test Button");
    end_panel("Test Panel");
    draw_interface();
    refresh_screen();
    REQUIRE(get_pixel(point_at(150, 150)) == color_black());
    close_window(test_window);
}
TEST_CASE("enable_interface_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    disable_interface();
    process_events();
    REQUIRE_FALSE(interface_enabled());
    enable_interface();
    process_events();
    REQUIRE(interface_enabled());
    close_window(test_window);
}
TEST_CASE("end_inset_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    start_inset("Test Inset", 60);
    end_inset("Test Inset");
    close_window(test_window);
}
TEST_CASE("end_panel_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_panel = start_panel("Test Panel", rectangle_from(100, 100, 200, 200));
    end_panel("Test Panel");
    close_window(test_window);
}
TEST_CASE("end_popup_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_popup = start_popup("Test Popup");
    end_popup("Test Popup");
    close_window(test_window);
}
TEST_CASE("end_treenode_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    start_panel("Test Panel", rectangle_from(10, 10, 200, 200));
    auto test_node = start_treenode("Test Node");
    end_treenode("Test Node");
    end_panel("Test Panel");
    draw_interface();
    refresh_screen();
    close_window(test_window);
}
TEST_CASE("enter_column_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_panel = start_panel("Test Panel", rectangle_from(10, 10, 300, 200));
    add_column(100);
    enter_column();
    button("Button1");
    leave_column();
    end_panel("Test Panel");
    draw_interface();
    refresh_screen();
    close_window(test_window);
}
TEST_CASE("get_interface_label_width_integration") {
    auto test_label_width = get_interface_label_width();
    REQUIRE(test_label_width == 60);
}
TEST_CASE("header_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    process_events();
    auto test_header_result = header("Test Header");
    REQUIRE(test_header_result != nullptr);
    close_window(test_window);
}
TEST_CASE("hsb_color_slider_at_position_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_color = hsb_color(0.5, 1.0, 0.5);
    auto test_rect = rectangle_from(100, 100, 200, 100);
    auto result_color = hsb_color_slider(test_color, test_rect);
    process_events();
    REQUIRE(test_color != result_color);
    close_window(test_window);
}
TEST_CASE("hsb_color_slider_integration") {
    auto test_window = open_window("HSB Slider Test", 800, 600);
    auto test_color = color_black();
    auto result_color = hsb_color_slider(test_color);
    draw_interface();
    refresh_screen();
    REQUIRE(test_color != result_color);
    close_window(test_window);
}
TEST_CASE("hsb_color_slider_labeled_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_color = color_black();
    auto test_result_color = hsb_color_slider("Color Slider", test_color);
    process_events();
    REQUIRE(test_result_color != color_black());
    close_window(test_window);
}
TEST_CASE("interface_enabled_integration") {
    auto initial_state = interface_enabled();
    disable_interface();
    auto disabled_state = interface_enabled();
    REQUIRE_FALSE(disabled_state);
    enable_interface();
    auto enabled_state = interface_enabled();
    REQUIRE(enabled_state);
}
TEST_CASE("interface_style_panel_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_rectangle = rectangle_from(0, 0, 200, 200);
    interface_style_panel(test_rectangle);
    refresh_screen();
    close_window(test_window);
}
TEST_CASE("label_element_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    label_element("Test Label");
    draw_interface();
    refresh_screen();
    REQUIRE(pixel_drawn_at_point(point_at(10, 10)));
    close_window(test_window);
}
TEST_CASE("label_element_at_position_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_rectangle = rectangle_from(100, 100, 200, 50);
    label_element("Test Label", test_rectangle);
    refresh_screen();
    close_window(test_window);
}
TEST_CASE("last_element_changed_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    process_events();
    slider("Test Slider", 0.0, 0.0, 100.0);
    process_events();
    REQUIRE_FALSE(last_element_changed());
    simulate_mouse_move(100, 100);
    simulate_mouse_down(Mousebutton::LEFT);
    simulate_mouse_move(200, 200);
    simulate_mouse_up(Mousebutton::LEFT);
    process_events();
    REQUIRE(last_element_changed());
    close_window(test_window);
}
TEST_CASE("last_element_confirmed_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_button = button("Test Button");
    process_events();
    REQUIRE_FALSE(last_element_confirmed());
    simulate_mouse_click(Mousebutton::LEFT);
    process_events();
    REQUIRE(last_element_confirmed());
    close_window(test_window);
}
TEST_CASE("leave_column_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    start_panel("Test Panel", rectangle_from(10, 10, 300, 200));
    start_custom_layout();
    add_column(100);
    enter_column();
    leave_column();
    auto button_result = button("Test Button");
    REQUIRE_FALSE(button_result);
    end_panel("Test Panel");
    close_window(test_window);
}
TEST_CASE("number_box_at_position_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_rect = rectangle_from(100, 100, 200, 30);
    auto test_result = number_box(5.0, 1.0, test_rect);
    process_events();
    REQUIRE(test_result >= 4.0 && test_result <= 6.0);
    close_window(test_window);
}
TEST_CASE("number_box_integration") {
    auto test_window = open_window("Number Box Test", 800, 600);
    process_events();
    auto test_result = number_box(5.0, 1.0);
    REQUIRE(test_result >= 4.0 && test_result <= 6.0);
    close_window(test_window);
}
TEST_CASE("number_box_labeled_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_result = number_box("Test Value", 5.0, 1.0);
    REQUIRE(test_result >= 4.0 && test_result <= 6.0);
    close_window(test_window);
}
TEST_CASE("open_popup_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_popup = start_popup("Test Popup");
    process_events();
    open_popup("Test Popup");
    process_events();
    REQUIRE(popup_is_open);
    end_popup("Test Popup");
    close_window(test_window);
}
TEST_CASE("paragraph_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    set_interface_font(load_font("test_font", "arial.ttf"));
    set_interface_font_size(12);
    paragraph("This is a test paragraph to check if the text wraps correctly.");
    draw_interface();
    refresh_screen();
    REQUIRE(get_pixel(point_at(10, 10)) == color_black());
    free_font(font_named("test_font"));
    close_window(test_window);
}
TEST_CASE("paragraph_at_position_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_rectangle = rectangle_from(100, 100, 200, 100);
    paragraph("This is a test paragraph.", test_rectangle);
    refresh_screen();
    REQUIRE(get_pixel(point_at(rectangle_left(test_rectangle), rectangle_top(test_rectangle))) == color_black());
    close_window(test_window);
}
TEST_CASE("reset_layout_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    start_custom_layout();
    add_column(200);
    add_column(-1);
    reset_layout();
    draw_interface();
    refresh_screen();
    close_window(test_window);
}
TEST_CASE("set_interface_accent_color_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    set_interface_accent_color(color_red(), 0.5);
    button("Test Button");
    draw_interface();
    refresh_screen();
    REQUIRE(get_pixel(point_at(10, 10)) == color_red());
    close_window(test_window);
}
TEST_CASE("set_interface_border_color_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    set_interface_border_color(color_red());
    start_panel("Test Panel", rectangle_from(100, 100, 200, 100));
    button("Test Button");
    end_panel("Test Panel");
    draw_interface();
    refresh_screen();
    REQUIRE(get_pixel(100, 100) == color_red());
    close_window(test_window);
}
TEST_CASE("set_interface_colors_auto_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    set_interface_colors_auto(color_white(), color_blue(), 0.5, 0.7, 0.3);
    start_panel("Test Panel", rectangle_from(100, 100, 200, 200));
    button("Test Button");
    end_panel("Test Panel");
    draw_interface();
    refresh_screen();
    REQUIRE(get_pixel(150, 150) == color_blue());
    close_window(test_window);
}
TEST_CASE("set_interface_element_color_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    set_interface_element_color(color_black(), 0.5);
    start_panel("Test Panel", rectangle_from(100, 100, 200, 200));
    button("Test Button");
    end_panel("Test Panel");
    draw_interface();
    refresh_screen();
    REQUIRE(get_pixel(150, 150) == color_black());
    close_window(test_window);
}
TEST_CASE("set_interface_element_shadows_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    set_interface_element_shadows(10, color_black(), point_at(5, 5));
    start_panel("Test Panel", rectangle_from(100, 100, 200, 200));
    button("Test Button");
    end_panel("Test Panel");
    draw_interface();
    refresh_screen();
    REQUIRE(pixel_drawn_at_point(point_at(105, 105)));
    close_window(test_window);
}
TEST_CASE("set_interface_font_font_as_string_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    set_interface_font("Arial");
    label_element("Test Text");
    draw_interface();
    refresh_screen();
    close_window(test_window);
}
TEST_CASE("set_interface_font_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_font = load_font("test_font", "arial.ttf");
    set_interface_font(test_font);
    label_element("Test Text");
    draw_interface();
    refresh_screen();
    free_font(test_font);
    close_window(test_window);
}
TEST_CASE("set_interface_font_size_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    set_interface_font_size(16);
    label_element("Test Text");
    draw_interface();
    REQUIRE(pixel_drawn_at_point(point_at(10, 20)));
    close_window(test_window);
}
TEST_CASE("set_interface_label_width_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    set_interface_label_width(100);
    auto test_width = get_interface_label_width();
    REQUIRE(test_width == 100);
    close_window(test_window);
}
TEST_CASE("set_interface_panel_shadows_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    set_interface_panel_shadows(10, rgba_color(0, 0, 0, 128), point_at(5, 5));
    auto panel_visible = start_panel("Test Panel", rectangle_from(100, 100, 200, 150));
    end_panel("Test Panel");
    draw_interface();
    refresh_screen();
    REQUIRE(get_pixel(point_at(105, 105)) == rgba_color(0, 0, 0, 128));
    close_window(test_window);
}
TEST_CASE("set_interface_root_text_color_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    set_interface_root_text_color(color_red());
    label_element("Test Text", rectangle_from(100, 100, 200, 50));
    refresh_screen();
    REQUIRE(pixel_drawn_at_point(color_red(), 105, 105));
    close_window(test_window);
}
TEST_CASE("set_interface_shadows_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    set_interface_shadows(10, rgba_color(0, 0, 0, 128), point_at(5, 5));
    auto panel_visible = start_panel("Test Panel", rectangle_from(100, 100, 200, 200));
if (REQUIRE(panel_visible);
) {
        button("Test Button");
        end_panel("Test Panel");
        draw_interface();
        refresh_screen();
        REQUIRE(pixel_drawn_at_point(point_at(105, 105)));
}
}
    close_window(test_window);
}
TEST_CASE("set_interface_spacing_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    set_interface_spacing(10, 5);
    auto test_panel = start_panel("Test Panel", rectangle_from(100, 100, 200, 200));
    button("Button 1");
    button("Button 2");
    end_panel("Test Panel");
    draw_interface();
    refresh_screen();
    REQUIRE(pixel_drawn_at_point(point_at(110, 110)));
    close_window(test_window);
}
TEST_CASE("set_interface_style_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    set_interface_style(InterfaceStyle::DARK);
    button("Test Button");
    draw_interface();
    refresh_screen();
    close_window(test_window);
}
TEST_CASE("set_interface_style_with_color_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    set_interface_style(InterfaceStyle::DARK, color_blue());
    auto test_panel = start_panel("Test Panel", rectangle_from(100, 100, 200, 200));
    button("Test Button");
    draw_interface();
    refresh_screen();
    REQUIRE(get_pixel(point_at(150, 150)) == color_blue());
    close_window(test_window);
}
TEST_CASE("set_interface_text_color_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    set_interface_text_color(color_red());
    label_element("Test Text");
    draw_interface();
    refresh_screen();
    REQUIRE(get_pixel(point_at(10, 10)) == color_red());
    close_window(test_window);
}
TEST_CASE("set_layout_height_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_panel = start_panel("Test Panel", rectangle_from(0, 0, 800, 600));
    set_layout_height(50);
    button("Test Button");
    end_panel("Test Panel");
    draw_interface();
    refresh_screen();
    close_window(test_window);
}
TEST_CASE("single_line_layout_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    single_line_layout();
    auto test_button1 = button("Button1");
    auto test_button2 = button("Button2");
    reset_layout();
    close_window(test_window);
}
TEST_CASE("slider_at_position_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_rect = rectangle_from(100, 100, 200, 20);
    process_events();
    auto slider_result = slider(50.0, 0.0, 100.0, test_rect);
    REQUIRE(slider_result >= 0.0 && slider_result <= 100.0);
    close_window(test_window);
}
TEST_CASE("slider_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    process_events();
    auto test_slider_result = slider(50.0, 0.0, 100.0);
    REQUIRE(test_slider_result >= 0.0 && test_slider_result <= 100.0);
    close_window(test_window);
}
TEST_CASE("slider_labeled_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_slider_value = slider("Test Slider", 50.0, 0.0, 100.0);
    REQUIRE(test_slider_value >= 0.0 && test_slider_value <= 100.0);
    close_window(test_window);
}
TEST_CASE("split_into_columns_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    start_panel("Test Panel", rectangle_from(0, 0, 800, 600));
    split_into_columns(3);
    end_panel("Test Panel");
    close_window(test_window);
}
TEST_CASE("split_into_columns_with_last_width_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_panel = start_panel("Test Panel", rectangle_from(0, 0, 800, 600));
    split_into_columns(3, 200);
    button("Button 1");
    button("Button 2");
    button("Button 3");
    end_panel("Test Panel");
    close_window(test_window);
}
TEST_CASE("split_into_columns_relative_with_last_width_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_panel = start_panel("Test Panel", rectangle_from(0, 0, 800, 600));
    split_into_columns_relative(3, 0.5);
    button("Button 1");
    button("Button 2");
    button("Button 3");
    end_panel("Test Panel");
    draw_interface();
    refresh_screen();
    REQUIRE(point_in_rectangle(point_at(200, 300), rectangle_from(0, 0, 200, 600)));
    REQUIRE(point_in_rectangle(point_at(600, 300), rectangle_from(400, 0, 400, 600)));
    close_window(test_window);
}
TEST_CASE("start_custom_layout_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    start_custom_layout();
    add_column(200);
    auto button_result = button("Test Button");
    reset_layout();
    close_window(test_window);
    REQUIRE(button_result);
}
TEST_CASE("start_inset_at_position_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_rect = rectangle_from(100, 100, 200, 200);
    start_inset("test_inset", test_rect);
    end_inset("test_inset");
    close_window(test_window);
}
TEST_CASE("start_inset_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    start_panel("Test Panel", rectangle_from(100, 100, 300, 300));
    start_inset("Test Inset", 100);
    button("Test Button");
    end_inset("Test Inset");
    end_panel("Test Panel");
    close_window(test_window);
}
TEST_CASE("start_panel_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_rectangle = rectangle_from(100, 100, 200, 150);
    auto panel_visible = start_panel("Test Panel", test_rectangle);
    REQUIRE(panel_visible);
    end_panel("Test Panel");
    close_window(test_window);
}
TEST_CASE("start_popup_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto popup_visible = start_popup("Test Popup");
    REQUIRE(popup_visible);
    end_popup("Test Popup");
    close_window(test_window);
}
TEST_CASE("start_treenode_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    start_panel("Test Panel", rectangle_from(0, 0, 800, 600));
    auto test_node_expanded = start_treenode("Test Node");
    REQUIRE(test_node_expanded);
    end_treenode("Test Node");
    end_panel("Test Panel");
    close_window(test_window);
}
TEST_CASE("text_box_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_text_box_result = text_box("Initial Text");
    process_events();
    REQUIRE(test_text_box_result == "Initial Text");
    simulate_key_press(Keycode::A);
    process_events();
    auto test_text_box_result_updated = text_box(test_text_box_result);
    REQUIRE(test_text_box_result_updated == "Initial TextA");
    close_window(test_window);
}
TEST_CASE("text_box_at_position_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_rect = rectangle_from(100, 100, 200, 30);
    process_events();
    auto test_result1 = text_box("Initial Text", test_rect);
    REQUIRE(test_result2 == "Initial Text");
    simulate_key_press(Keycode::A);
    process_events();
    auto test_result2 = text_box(test_result1, test_rect);
    REQUIRE(test_result1 == "Initial TextA");
    close_window(test_window);
}
TEST_CASE("text_box_labeled_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_text_box_result = text_box("Enter Name", "John");
    process_events();
    REQUIRE(test_text_box_result == "John");
    close_window(test_window);
}
