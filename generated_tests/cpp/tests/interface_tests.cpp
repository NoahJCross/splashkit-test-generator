#include "splashkit.h"
#include <catch2/catch.hpp>

class TestInterface {
public:
    TEST_CASE("add_column_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        while (quit_requested() == false) {
            process_events();
            clear_screen();
            start_panel(string("Test Panel"), rectangle_from(0.0, 0.0, 800.0, 600.0));
            start_custom_layout();
            add_column(100);
            add_column(-1);
            button(string("Test Button"));
            end_panel(string("Test Panel"));
            draw_interface();
            refresh_screen();
        }
        close_window(test_window);
    }
    TEST_CASE("add_column_relative_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        while (quit_requested() == false) {
            process_events();
            clear_screen();
            start_panel(string("Test Panel"), rectangle_from(0.0, 0.0, 800.0, 600.0));
            start_custom_layout();
            add_column_relative(0.5);
            button(string("Button 1"));
            add_column_relative(0.5);
            button(string("Button 2"));
            end_panel(string("Test Panel"));
            draw_interface();
            refresh_screen();
        }
        close_window(test_window);
    }
    TEST_CASE("bitmap_button_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        auto test_bitmap = create_bitmap(string("test_bitmap"), 100, 100);
        auto button_clicked = false;
        while (quit_requested() == false) {
            process_events();
            clear_screen();
            button_clicked = bitmap_button(test_bitmap);
            draw_interface();
            refresh_screen();
        }
        REQUIRE(button_clicked);
        free_bitmap(test_bitmap);
        close_window(test_window);
    }
    TEST_CASE("bitmap_button_at_position_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        auto test_bitmap = create_bitmap(string("test_bitmap"), 100, 100);
        auto test_rectangle = rectangle_from(100.0, 100.0, 100.0, 100.0);
        auto button_clicked = false;
        while (quit_requested() == false) {
            process_events();
            clear_screen();
            button_clicked = bitmap_button(test_bitmap, test_rectangle);
            draw_interface();
            refresh_screen();
        }
        REQUIRE(button_clicked);
        free_bitmap(test_bitmap);
        close_window(test_window);
    }
    TEST_CASE("bitmap_button_at_position_with_options_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        auto test_bitmap = create_bitmap(string("test_bitmap"), 100, 100);
        auto test_rectangle = rectangle_from(100.0, 100.0, 100.0, 100.0);
        auto button_clicked = false;
        while (quit_requested() == false) {
            process_events();
            clear_screen();
            button_clicked = bitmap_button(test_bitmap, test_rectangle, option_defaults());
            draw_interface();
            refresh_screen();
        }
        REQUIRE(button_clicked);
        free_bitmap(test_bitmap);
        close_window(test_window);
    }
    TEST_CASE("bitmap_button_with_options_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        auto test_bitmap = create_bitmap(string("test_bitmap"), 100, 100);
        auto test_options1 = option_defaults();
        auto test_options2 = option_scale_bmp(0.5, 0.5, test_options1);
        auto button_clicked = false;
        while (quit_requested() == false) {
            process_events();
            clear_screen();
            button_clicked = bitmap_button(test_bitmap, test_options2);
            draw_interface();
            refresh_screen();
        }
        REQUIRE(button_clicked);
        free_bitmap(test_bitmap);
        close_window(test_window);
    }
    TEST_CASE("bitmap_button_labeled_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        auto test_bitmap = create_bitmap(string("test_bitmap"), 100, 100);
        auto button_clicked = false;
        while (quit_requested() == false) {
            process_events();
            clear_screen();
            button_clicked = bitmap_button(string("Click Me"), test_bitmap);
            draw_interface();
            refresh_screen();
        }
        REQUIRE(button_clicked);
        free_bitmap(test_bitmap);
        close_window(test_window);
    }
    TEST_CASE("bitmap_button_labeled_with_options_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        auto test_bitmap = create_bitmap(string("test_bitmap"), 100, 100);
        auto test_options1 = option_defaults();
        auto test_options2 = option_scale_bmp(0.5, 0.5, test_options1);
        auto button_clicked = false;
        while (quit_requested() == false) {
            process_events();
            clear_screen();
            button_clicked = bitmap_button(string("Click Me"), test_bitmap, test_options2);
            draw_interface();
            refresh_screen();
        }
        REQUIRE(button_clicked);
        free_bitmap(test_bitmap);
        close_window(test_window);
    }
    TEST_CASE("button_at_position_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        auto test_rectangle = rectangle_from(100.0, 100.0, 200.0, 50.0);
        auto button_clicked = false;
        while (quit_requested() == false) {
            process_events();
            clear_screen();
            button_clicked = button(string("Click Me"), test_rectangle);
            draw_interface();
            refresh_screen();
        }
        REQUIRE(button_clicked);
        close_window(test_window);
    }
    TEST_CASE("button_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        auto button_clicked = false;
        while (quit_requested() == false) {
            process_events();
            clear_screen();
            button_clicked = button(string("Click Me"));
            draw_interface();
            refresh_screen();
        }
        REQUIRE(button_clicked);
        close_window(test_window);
    }
    TEST_CASE("button_labeled_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        auto button_clicked = false;
        while (quit_requested() == false) {
            process_events();
            clear_screen();
            button_clicked = button(string("Label:"), string("Click Me"));
            draw_interface();
            refresh_screen();
        }
        REQUIRE(button_clicked);
        close_window(test_window);
    }
    TEST_CASE("checkbox_at_position_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        auto test_rect = rectangle_from(100.0, 100.0, 200.0, 50.0);
        auto initial_checkbox_result = false;
        auto current_checkbox_result = initial_checkbox_result;
        while (quit_requested() == false) {
            process_events();
            clear_screen();
            current_checkbox_result = checkbox(string("Test Checkbox"), current_checkbox_result, test_rect);
            draw_interface();
            refresh_screen();
        }
        REQUIRE(current_checkbox_result);
        close_window(test_window);
    }
    TEST_CASE("checkbox_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        auto initial_checkbox_result = false;
        auto current_checkbox_result = initial_checkbox_result;
        while (quit_requested() == false) {
            process_events();
            clear_screen();
            current_checkbox_result = checkbox(string("Test Checkbox"), current_checkbox_result);
            draw_interface();
            refresh_screen();
        }
        REQUIRE(current_checkbox_result);
        close_window(test_window);
    }
    TEST_CASE("checkbox_labeled_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        auto initial_checkbox_result = false;
        auto current_checkbox_result = initial_checkbox_result;
        while (quit_requested() == false) {
            process_events();
            clear_screen();
            current_checkbox_result = checkbox(string("Test Checkbox"), string("Check me"), current_checkbox_result);
            draw_interface();
            refresh_screen();
        }
        REQUIRE(current_checkbox_result);
        close_window(test_window);
    }
    TEST_CASE("color_slider_at_position_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        auto initial_color = color_black();
        auto current_color = initial_color;
        while (quit_requested() == false) {
            process_events();
            clear_screen();
            current_color = color_slider(current_color, rectangle_from(300.0, 300.0, 400.0, 24.0));
            draw_interface();
            refresh_screen();
        }
        REQUIRE(current_color != initial_color);
        close_window(test_window);
    }
    TEST_CASE("color_slider_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        auto test_color = color_black();
        auto current_color = test_color;
        while (quit_requested() == false) {
            process_events();
            clear_screen();
            current_color = color_slider(current_color);
            draw_interface();
            refresh_screen();
        }
        REQUIRE(current_color != test_color);
        close_window(test_window);
    }
    TEST_CASE("color_slider_labeled_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        auto test_color = color_black();
        auto current_color = test_color;
        while (quit_requested() == false) {
            process_events();
            clear_screen();
            current_color = color_slider(string("Test Color Slider"), current_color);
            draw_interface();
            refresh_screen();
        }
        REQUIRE(test_color != current_color);
        close_window(test_window);
    }
    TEST_CASE("disable_interface_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        start_panel(string("Test Panel"), rectangle_from(100.0, 100.0, 200.0, 200.0));
        button(string("Test Button"));
        process_events();
        REQUIRE(interface_enabled());
        disable_interface();
        process_events();
        REQUIRE_FALSE(interface_enabled());
        enable_interface();
        process_events();
        REQUIRE(interface_enabled());
        end_panel(string("Test Panel"));
        close_window(test_window);
    }
    TEST_CASE("draw_interface_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        while (quit_requested() == false) {
            process_events();
            clear_screen();
            start_panel(string("Test Panel"), rectangle_from(100.0, 100.0, 200.0, 200.0));
            end_panel(string("Test Panel"));
            draw_interface();
            refresh_screen();
        }
        close_window(test_window);
    }
    TEST_CASE("enable_interface_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        disable_interface();
        process_events();
        REQUIRE_FALSE(interface_enabled());
        enable_interface();
        process_events();
        REQUIRE(interface_enabled());
        close_window(test_window);
    }
    TEST_CASE("end_inset_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        while (quit_requested() == false) {
            process_events();
            clear_screen();
            start_inset(string("Test Inset"), 60);
            end_inset(string("Test Inset"));
            draw_interface();
            refresh_screen();
        }
        close_window(test_window);
    }
    TEST_CASE("end_panel_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        while (quit_requested() == false) {
            process_events();
            clear_screen();
            start_panel(string("Test Panel"), rectangle_from(100.0, 100.0, 200.0, 200.0));
            end_panel(string("Test Panel"));
            draw_interface();
            refresh_screen();
        }
        close_window(test_window);
    }
    TEST_CASE("end_popup_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        while (quit_requested() == false) {
            process_events();
            clear_screen();
            start_popup(string("Test Popup"));
            end_popup(string("Test Popup"));
            draw_interface();
            refresh_screen();
        }
        close_window(test_window);
    }
    TEST_CASE("end_treenode_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        while (quit_requested() == false) {
            process_events();
            clear_screen();
            start_panel(string("Test Panel"), rectangle_from(10.0, 10.0, 200.0, 200.0));
            start_treenode(string("Test Node"));
            end_treenode(string("Test Node"));
            end_panel(string("Test Panel"));
            draw_interface();
            refresh_screen();
        }
        close_window(test_window);
    }
    TEST_CASE("enter_column_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        while (quit_requested() == false) {
            process_events();
            clear_screen();
            start_panel(string("Test Panel"), rectangle_from(10.0, 10.0, 300.0, 200.0));
            add_column(100);
            enter_column();
            leave_column();
            end_panel(string("Test Panel"));
            draw_interface();
            refresh_screen();
        }
        close_window(test_window);
    }
    TEST_CASE("get_interface_label_width_integration") {
        auto test_label_width = get_interface_label_width();
        REQUIRE(60 == test_label_width);
    }
    TEST_CASE("header_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        while (quit_requested() == false) {
            process_events();
            clear_screen();
            header(string("Test Header"));
            draw_interface();
            refresh_screen();
        }
        close_window(test_window);
    }
    TEST_CASE("hsb_color_slider_at_position_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        auto test_rect = rectangle_from(100.0, 100.0, 200.0, 100.0);
        auto test_color = hsb_color_slider(color_black(), test_rect);
        auto current_color = test_color;
        while (quit_requested() == false) {
            process_events();
            clear_screen();
            current_color = hsb_color_slider(current_color, test_rect);
            draw_interface();
            refresh_screen();
        }
        REQUIRE(current_color != test_color);
        close_window(test_window);
    }
    TEST_CASE("hsb_color_slider_integration") {
        auto test_window = open_window(string("HSB Slider Test"), 800, 600);
        auto test_color = color_black();
        auto current_color = test_color;
        while (quit_requested() == false) {
            process_events();
            clear_screen();
            current_color = hsb_color_slider(current_color);
            draw_interface();
            refresh_screen();
        }
        REQUIRE(current_color != test_color);
        close_window(test_window);
    }
    TEST_CASE("hsb_color_slider_labeled_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        auto test_color = color_black();
        auto current_color = test_color;
        while (quit_requested() == false) {
            process_events();
            clear_screen();
            current_color = hsb_color_slider(string("Color Slider"), current_color);
            draw_interface();
            refresh_screen();
        }
        REQUIRE(test_color != current_color);
        close_window(test_window);
    }
    TEST_CASE("interface_enabled_integration") {
        auto initial_state = interface_enabled();
        REQUIRE(initial_state);
        disable_interface();
        auto disabled_state = interface_enabled();
        REQUIRE_FALSE(disabled_state);
        enable_interface();
        auto enabled_state = interface_enabled();
        REQUIRE(enabled_state);
    }
    TEST_CASE("interface_style_panel_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        auto test_rectangle = rectangle_from(0.0, 0.0, 200.0, 200.0);
        while (quit_requested() == false) {
            process_events();
            clear_screen();
            interface_style_panel(test_rectangle);
            draw_interface();
            refresh_screen();
        }
        close_window(test_window);
    }
    TEST_CASE("label_element_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        while (quit_requested() == false) {
            process_events();
            clear_screen();
            label_element(string("Test Label"));
            draw_interface();
            refresh_screen();
        }
        close_window(test_window);
    }
    TEST_CASE("label_element_at_position_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        auto test_rectangle = rectangle_from(100.0, 100.0, 200.0, 50.0);
        while (quit_requested() == false) {
            process_events();
            clear_screen();
            label_element(string("Test Label"), test_rectangle);
            draw_interface();
            refresh_screen();
        }
        close_window(test_window);
    }
    TEST_CASE("last_element_changed_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        while (quit_requested() == false) {
            process_events();
            clear_screen();
            slider(string("Test Slider"), 0.0f, 0.0f, 100.0f);
            draw_interface();
            refresh_screen();
        }
        REQUIRE(last_element_changed());
        close_window(test_window);
    }
    TEST_CASE("last_element_confirmed_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        while (quit_requested() == false) {
            process_events();
            clear_screen();
            button(string("Test Button"));
            draw_interface();
            refresh_screen();
        }
        REQUIRE(last_element_confirmed());
        close_window(test_window);
    }
    TEST_CASE("leave_column_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        auto button_result = false;
        while (quit_requested() == false) {
            process_events();
            clear_screen();
            start_panel(string("Test Panel"), rectangle_from(10.0, 10.0, 300.0, 200.0));
            start_custom_layout();
            add_column(100);
            enter_column();
            leave_column();
            button_result = button(string("Test Button"));
            end_panel(string("Test Panel"));
            draw_interface();
            refresh_screen();
        }
        REQUIRE(button_result);
        close_window(test_window);
    }
    TEST_CASE("number_box_at_position_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        auto test_rect = rectangle_from(100.0, 100.0, 200.0, 30.0);
        auto test_result = 5.0f;
        while (quit_requested() == false) {
            process_events();
            clear_screen();
            test_result = number_box(test_result, 1.0f, test_rect);
            draw_interface();
            refresh_screen();
        }
        REQUIRE(test_result >= 1.0f && test_result <= 5.0f);
        close_window(test_window);
    }
    TEST_CASE("number_box_integration") {
        auto test_window = open_window(string("Number Box Test"), 800, 600);
        auto test_result = 5.0f;
        while (quit_requested() == false) {
            process_events();
            clear_screen();
            test_result = number_box(test_result, 1.0f);
            draw_interface();
            refresh_screen();
        }
        REQUIRE(test_result >= 1.0f && test_result <= 5.0f);
        close_window(test_window);
    }
    TEST_CASE("number_box_labeled_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        auto test_result = 5.0f;
        while (quit_requested() == false) {
            process_events();
            clear_screen();
            test_result = number_box(string("Test Value"), test_result, 1.0f);
            draw_interface();
            refresh_screen();
        }
        REQUIRE(test_result >= 1.0f && test_result <= 5.0f);
        close_window(test_window);
    }
    TEST_CASE("open_popup_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        while (quit_requested() == false) {
            process_events();
            clear_screen();
            start_popup(string("Test Popup"));
            end_popup(string("Test Popup"));
            draw_interface();
            refresh_screen();
        }
        close_window(test_window);
    }
    TEST_CASE("paragraph_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        set_interface_font(load_font(string("hara"), string("hara.ttf")));
        set_interface_font_size(12);
        while (quit_requested() == false) {
            process_events();
            clear_screen();
            paragraph(string("This is a test paragraph to check if the text wraps correctly."));
            draw_interface();
            refresh_screen();
        }
        free_font(font_named(string("hara")));
        close_window(test_window);
    }
    TEST_CASE("paragraph_at_position_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        auto test_rectangle = rectangle_from(100.0, 100.0, 200.0, 100.0);
        while (quit_requested() == false) {
            process_events();
            clear_screen();
            paragraph(string("This is a test paragraph."), test_rectangle);
            draw_interface();
            refresh_screen();
        }
        close_window(test_window);
    }
    TEST_CASE("reset_layout_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        while (quit_requested() == false) {
            process_events();
            clear_screen();
            start_custom_layout();
            add_column(200);
            add_column(-1);
            reset_layout();
            draw_interface();
            refresh_screen();
        }
        close_window(test_window);
    }
    TEST_CASE("set_interface_accent_color_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        set_interface_accent_color(color_red(), 0.5f);
        while (quit_requested() == false) {
            process_events();
            clear_screen();
            button(string("Test Button"));
            draw_interface();
            refresh_screen();
        }
        close_window(test_window);
    }
    TEST_CASE("set_interface_border_color_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        set_interface_border_color(color_red());
        while (quit_requested() == false) {
            process_events();
            clear_screen();
            start_panel(string("Test Panel"), rectangle_from(100.0, 100.0, 200.0, 100.0));
            button(string("Test Button"));
            end_panel(string("Test Panel"));
            draw_interface();
            refresh_screen();
        }
        close_window(test_window);
    }
    TEST_CASE("set_interface_colors_auto_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        set_interface_colors_auto(color_white(), color_blue(), 0.5f, 0.7f, 0.3f);
        while (quit_requested() == false) {
            process_events();
            clear_screen();
            start_panel(string("Test Panel"), rectangle_from(100.0, 100.0, 200.0, 200.0));
            button(string("Test Button"));
            end_panel(string("Test Panel"));
            draw_interface();
            refresh_screen();
        }
        close_window(test_window);
    }
    TEST_CASE("set_interface_element_color_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        while (quit_requested() == false) {
            process_events();
            clear_screen();
            set_interface_element_color(color_black(), 0.5f);
            start_panel(string("Test Panel"), rectangle_from(100.0, 100.0, 200.0, 200.0));
            button(string("Test Button"));
            end_panel(string("Test Panel"));
            draw_interface();
            refresh_screen();
        }
        close_window(test_window);
    }
    TEST_CASE("set_interface_element_shadows_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        while (quit_requested() == false) {
            process_events();
            clear_screen();
            start_panel(string("Test Panel"), rectangle_from(100.0, 100.0, 200.0, 200.0));
            button(string("Test Button"));
            end_panel(string("Test Panel"));
            draw_interface();
            refresh_screen();
        }
        close_window(test_window);
    }
    TEST_CASE("set_interface_font_font_as_string_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        load_font(string("hara"), string("hara.ttf"));
        set_interface_font(string("hara"));
        while (quit_requested() == false) {
            process_events();
            clear_screen();
            label_element(string("Test Text"));
            draw_interface();
            refresh_screen();
        }
        close_window(test_window);
    }
    TEST_CASE("set_interface_font_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        auto test_font = load_font(string("hara"), string("hara.ttf"));
        set_interface_font(test_font);
        while (quit_requested() == false) {
            process_events();
            clear_screen();
            label_element(string("Test Text"));
            draw_interface();
            refresh_screen();
        }
        free_font(test_font);
        close_window(test_window);
    }
    TEST_CASE("set_interface_font_size_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        set_interface_font_size(16);
        while (quit_requested() == false) {
            process_events();
            clear_screen();
            label_element(string("Test Text"));
            draw_interface();
            refresh_screen();
        }
        close_window(test_window);
    }
    TEST_CASE("set_interface_label_width_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        set_interface_label_width(100);
        REQUIRE(100 == get_interface_label_width());
        close_window(test_window);
    }
    TEST_CASE("set_interface_panel_shadows_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        set_interface_panel_shadows(10, rgba_color(0, 0, 0, 128), point_at(5.0, 5.0));
        while (quit_requested() == false) {
            process_events();
            clear_screen();
            start_panel(string("Test Panel"), rectangle_from(100.0, 100.0, 200.0, 150.0));
            end_panel(string("Test Panel"));
            draw_interface();
            refresh_screen();
        }
        REQUIRE(rgba_color(0, 0, 0, 128) == get_pixel(point_at(105.0, 105.0)));
        close_window(test_window);
    }
    TEST_CASE("set_interface_root_text_color_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        set_interface_root_text_color(color_red());
        while (quit_requested() == false) {
            process_events();
            clear_screen();
            label_element(string("Test Text"), rectangle_from(100.0, 100.0, 200.0, 50.0));
            draw_interface();
            refresh_screen();
        }
        REQUIRE(color_red() == get_pixel(point_at(105.0, 105.0)));
        close_window(test_window);
    }
    TEST_CASE("set_interface_shadows_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        set_interface_shadows(10, rgba_color(0, 0, 0, 128), point_at(5.0, 5.0));
        while (quit_requested() == false) {
            process_events();
            clear_screen();
            start_panel(string("Test Panel"), rectangle_from(100.0, 100.0, 200.0, 200.0));
            button(string("Test Button"));
            end_panel(string("Test Panel"));
            draw_interface();
            refresh_screen();
        }
        REQUIRE(rgba_color(0, 0, 0, 128) == get_pixel(point_at(105.0, 105.0)));
        close_window(test_window);
    }
    TEST_CASE("set_interface_spacing_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        set_interface_spacing(10, 5);
        while (quit_requested() == false) {
            process_events();
            clear_screen();
            start_panel(string("Test Panel"), rectangle_from(100.0, 100.0, 200.0, 200.0));
            button(string("Button 1"));
            button(string("Button 2"));
            end_panel(string("Test Panel"));
            draw_interface();
            refresh_screen();
        }
        close_window(test_window);
    }
    TEST_CASE("set_interface_style_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        set_interface_style(InterfaceStyle::SHADED_DARK_STYLE);
        while (quit_requested() == false) {
            process_events();
            clear_screen();
            start_panel(string("Test Panel"), rectangle_from(100.0, 100.0, 200.0, 200.0));
            button(string("Test Button"));
            end_panel(string("Test Panel"));
            draw_interface();
            refresh_screen();
        }
        close_window(test_window);
    }
    TEST_CASE("set_interface_style_with_color_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        set_interface_style(InterfaceStyle::SHADED_DARK_STYLE, color_blue());
        REQUIRE(color_blue() == get_pixel(point_at(150.0, 150.0)));
        close_window(test_window);
    }
    TEST_CASE("set_interface_text_color_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        set_interface_text_color(color_red());
        while (quit_requested() == false) {
            process_events();
            clear_screen();
            label_element(string("Test Text"));
            draw_interface();
            refresh_screen();
        }
        REQUIRE(color_red() == get_pixel(point_at(10.0, 10.0)));
        close_window(test_window);
    }
    TEST_CASE("set_layout_height_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        set_layout_height(50);
        while (quit_requested() == false) {
            process_events();
            clear_screen();
            start_panel(string("Test Panel"), rectangle_from(0.0, 0.0, 800.0, 600.0));
            button(string("Test Button"));
            end_panel(string("Test Panel"));
            draw_interface();
            refresh_screen();
        }
        close_window(test_window);
    }
    TEST_CASE("single_line_layout_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        single_line_layout();
        while (quit_requested() == false) {
            process_events();
            clear_screen();
            button(string("Button1"));
            button(string("Button2"));
            reset_layout();
            draw_interface();
            refresh_screen();
        }
        close_window(test_window);
    }
    TEST_CASE("slider_at_position_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        auto test_rect = rectangle_from(100.0, 100.0, 200.0, 20.0);
        auto initial_value = 50.0f;
        auto slider_result = initial_value;
        while (quit_requested() == false) {
            process_events();
            clear_screen();
            slider_result = slider(slider_result, 0.0f, 100.0f, test_rect);
            draw_interface();
            refresh_screen();
        }
        REQUIRE(initial_value != slider_result);
        close_window(test_window);
    }
    TEST_CASE("slider_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        auto initial_value = 50.0f;
        auto slider_result = initial_value;
        while (quit_requested() == false) {
            process_events();
            clear_screen();
            slider_result = slider(slider_result, 0.0f, 100.0f);
            draw_interface();
            refresh_screen();
        }
        REQUIRE(initial_value != slider_result);
        close_window(test_window);
    }
    TEST_CASE("slider_labeled_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        auto initial_value = 50.0f;
        auto slider_result = initial_value;
        while (quit_requested() == false) {
            process_events();
            clear_screen();
            slider_result = slider(string("Test Slider"), slider_result, 0.0f, 100.0f);
            draw_interface();
            refresh_screen();
        }
        REQUIRE(initial_value != slider_result);
        close_window(test_window);
    }
    TEST_CASE("split_into_columns_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        while (quit_requested() == false) {
            process_events();
            clear_screen();
            start_panel(string("Test Panel"), rectangle_from(0.0, 0.0, 800.0, 600.0));
            split_into_columns(3);
            button(string("Button 1"));
            button(string("Button 2"));
            button(string("Button 3"));
            end_panel(string("Test Panel"));
            draw_interface();
            refresh_screen();
        }
        close_window(test_window);
    }
    TEST_CASE("split_into_columns_with_last_width_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        while (quit_requested() == false) {
            process_events();
            clear_screen();
            start_panel(string("Test Panel"), rectangle_from(0.0, 0.0, 800.0, 600.0));
            split_into_columns(3, 200);
            button(string("Button 1"));
            button(string("Button 2"));
            button(string("Button 3"));
            end_panel(string("Test Panel"));
            draw_interface();
            refresh_screen();
        }
        close_window(test_window);
    }
    TEST_CASE("split_into_columns_relative_with_last_width_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        while (quit_requested() == false) {
            process_events();
            clear_screen();
            start_panel(string("Test Panel"), rectangle_from(0.0, 0.0, 800.0, 600.0));
            split_into_columns_relative(3, 0.5);
            button(string("Button 1"));
            button(string("Button 2"));
            button(string("Button 3"));
            end_panel(string("Test Panel"));
            draw_interface();
            refresh_screen();
        }
        close_window(test_window);
    }
    TEST_CASE("start_custom_layout_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        auto button_result = false;
        while (quit_requested() == false) {
            process_events();
            clear_screen();
            start_custom_layout();
            add_column(200);
            button_result = button(string("Test Button"));
            reset_layout();
            draw_interface();
            refresh_screen();
        }
        close_window(test_window);
        REQUIRE(button_result);
    }
    TEST_CASE("start_inset_at_position_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        auto test_rect = rectangle_from(100.0, 100.0, 200.0, 200.0);
        while (quit_requested() == false) {
            process_events();
            clear_screen();
            start_inset(string("test_inset"), test_rect);
            button(string("Test Button"));
            end_inset(string("test_inset"));
            draw_interface();
            refresh_screen();
        }
        close_window(test_window);
    }
    TEST_CASE("start_inset_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        while (quit_requested() == false) {
            process_events();
            clear_screen();
            start_inset(string("Test Inset"), 100);
            button(string("Test Button"));
            end_inset(string("Test Inset"));
            draw_interface();
            refresh_screen();
        }
        close_window(test_window);
    }
    TEST_CASE("start_panel_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        auto test_rectangle = rectangle_from(100.0, 100.0, 200.0, 150.0);
        while (quit_requested() == false) {
            process_events();
            clear_screen();
            start_panel(string("Test Panel"), test_rectangle);
            button(string("Test Button"));
            end_panel(string("Test Panel"));
            draw_interface();
            refresh_screen();
        }
        close_window(test_window);
    }
    TEST_CASE("start_popup_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        while (quit_requested() == false) {
            process_events();
            clear_screen();
            start_popup(string("Test Popup"));
            button(string("Test Button"));
            end_popup(string("Test Popup"));
            draw_interface();
            refresh_screen();
        }
        close_window(test_window);
    }
    TEST_CASE("start_treenode_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        while (quit_requested() == false) {
            process_events();
            clear_screen();
            start_panel(string("Test Panel"), rectangle_from(0.0, 0.0, 800.0, 600.0));
            start_treenode(string("Test Node"));
            button(string("Test Button1"));
            button(string("Test Button2"));
            button(string("Test Button3"));
            end_treenode(string("Test Node"));
            end_panel(string("Test Panel"));
            draw_interface();
            refresh_screen();
        }
        close_window(test_window);
    }
    TEST_CASE("text_box_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        auto initial_text = string("Initial Text");
        auto text_result = initial_text;
        while (quit_requested() == false) {
            process_events();
            clear_screen();
            text_result = text_box(text_result);
            draw_interface();
            refresh_screen();
        }
        REQUIRE(initial_text != text_result);
        close_window(test_window);
    }
    TEST_CASE("text_box_at_position_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        auto test_rect = rectangle_from(100.0, 100.0, 200.0, 30.0);
        auto initial_text = string("Initial Text");
        auto text_result = initial_text;
        while (quit_requested() == false) {
            process_events();
            clear_screen();
            text_result = text_box(text_result, test_rect);
            draw_interface();
            refresh_screen();
        }
        REQUIRE(initial_text != text_result);
        close_window(test_window);
    }
    TEST_CASE("text_box_labeled_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        auto initial_text = string("Initial Text");
        auto text_result = initial_text;
        while (quit_requested() == false) {
            process_events();
            clear_screen();
            text_result = text_box(string("Enter Name"), text_result);
            draw_interface();
            refresh_screen();
        }
        REQUIRE(initial_text != text_result);
        close_window(test_window);
    }
};
