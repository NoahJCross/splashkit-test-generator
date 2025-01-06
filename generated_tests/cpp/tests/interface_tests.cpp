#include <catch2/catch_all.hpp>
#include <limits>
#include "splashkit.h"
#include "../helpers.hpp"
struct TestInterfaceFixture
{
    TestInterfaceFixture()
    {
        set_resources_path("/mnt/c/Users/Noahc/Documents/aYear_2_semester_2/TeamProject/GitHubRepo/splashkit_test_generator/resources");
    }
};
TEST_CASE_METHOD(TestInterfaceFixture, "add_column_integration") {
    open_window("Test Window 1", 800, 600);
    window_cleanup cleanup_window;
    process_events();
    while (key_down(key_code::SPACE_KEY) == false) {
        process_events();
        clear_screen();
        draw_text("Test: add_column", color_black(), 10.0, 10.0);
        draw_text("Expected: Two columns - first 100px wide, second fills remaining space", color_black(), 10.0, 30.0);
        draw_text("Press space to end test", color_black(), 10.0, 50.0);
        start_panel("Test Panel 1", rectangle_from(0.0, 70.0, 800.0, 530.0));
        start_custom_layout();
        add_column(100);
        add_column(-1);
        button("Left Column");
        button("Right Column");
        end_panel("Test Panel 1");
        draw_interface();
        refresh_screen();
    }
}
TEST_CASE_METHOD(TestInterfaceFixture, "add_column_relative_integration") {
    open_window("Test Window 2", 800, 600);
    window_cleanup cleanup_window;
    process_events();
    while (key_down(key_code::SPACE_KEY) == false) {
        process_events();
        clear_screen();
        draw_text("Test: add_column_relative", color_black(), 10.0, 10.0);
        draw_text("Expected: Two equal-width columns (50% each)", color_black(), 10.0, 30.0);
        draw_text("Press space to end test", color_black(), 10.0, 50.0);
        start_panel("Test Panel 2", rectangle_from(0.0, 70.0, 800.0, 530.0));
        start_custom_layout();
        add_column_relative(0.5);
        add_column_relative(0.5);
        button("Left Column");
        button("Right Column");
        end_panel("Test Panel 2");
        draw_interface();
        refresh_screen();
    }
}
TEST_CASE_METHOD(TestInterfaceFixture, "bitmap_button_integration") {
    open_window("Test Window 3", 800, 600);
    window_cleanup cleanup_window;
    auto test_bitmap = create_bitmap("Test Bitmap 1", 100, 100);
    bitmap_cleanup cleanup_bitmap;
    clear_bitmap(test_bitmap, color_red());
    auto button_clicked = false;
    while (button_clicked == false) {
        process_events();
        clear_screen();
        draw_text("Test: bitmap_button", color_black(), 10.0, 10.0);
        draw_text("Expected: A clickable button with a red bitmap image", color_black(), 10.0, 30.0);
        draw_text("Click the button to end test", color_black(), 10.0, 50.0);
        start_panel("Test Panel 3", rectangle_from(0.0, 70.0, 800.0, 530.0));
        set_layout_height(100);
        button_clicked = bitmap_button(test_bitmap);
        end_panel("Test Panel 3");
        draw_interface();
        refresh_screen();
    }
    REQUIRE(button_clicked);
}
TEST_CASE_METHOD(TestInterfaceFixture, "bitmap_button_at_position_integration") {
    open_window("Test Window 4", 800, 600);
    window_cleanup cleanup_window;
    auto test_bitmap = create_bitmap("Test Bitmap 2", 100, 100);
    clear_bitmap(test_bitmap, color_red());
    bitmap_cleanup cleanup_bitmap;
    auto test_rectangle = rectangle_from(100.0, 100.0, 100.0, 100.0);
    auto button_clicked = false;
    while (button_clicked == false) {
        process_events();
        clear_screen();
        draw_text("Test: bitmap_button_at_position", color_black(), 10.0, 10.0);
        draw_text("Expected: A red bitmap button at position (100,100)", color_black(), 10.0, 30.0);
        draw_text("Click the button to end test", color_black(), 10.0, 50.0);
        button_clicked = bitmap_button(test_bitmap, test_rectangle);
        draw_interface();
        refresh_screen();
    }
    REQUIRE(button_clicked);
}
TEST_CASE_METHOD(TestInterfaceFixture, "bitmap_button_at_position_with_options_integration") {
    open_window("Test Window 5", 800, 600);
    window_cleanup cleanup_window;
    auto test_bitmap = create_bitmap("Test Bitmap 3", 100, 100);
    clear_bitmap(test_bitmap, color_red());
    bitmap_cleanup cleanup_bitmap;
    auto test_rectangle = rectangle_from(100.0, 100.0, 100.0, 100.0);
    auto button_clicked = false;
    while (button_clicked == false) {
        process_events();
        clear_screen();
        draw_text("Test: bitmap_button_at_position_with_options", color_black(), 10.0, 10.0);
        draw_text("Expected: A red bitmap button at position (100,100) with default options", color_black(), 10.0, 30.0);
        draw_text("Click the button to end test", color_black(), 10.0, 50.0);
        button_clicked = bitmap_button(test_bitmap, test_rectangle, option_defaults());
        draw_interface();
        refresh_screen();
    }
    REQUIRE(button_clicked);
}
TEST_CASE_METHOD(TestInterfaceFixture, "bitmap_button_with_options_integration") {
    open_window("Test Window 6", 800, 600);
    window_cleanup cleanup_window;
    auto test_bitmap = create_bitmap("Test Bitmap 4", 100, 100);
    clear_bitmap(test_bitmap, color_red());
    bitmap_cleanup cleanup_bitmap;
    auto test_options1 = option_defaults();
    auto test_options2 = option_scale_bmp(0.5, 0.5, test_options1);
    auto button_clicked = false;
    while (button_clicked == false) {
        process_events();
        clear_screen();
        draw_text("Test: bitmap_button_with_options", color_black(), 10.0, 10.0);
        draw_text("Expected: A red bitmap button scaled to 50% size", color_black(), 10.0, 30.0);
        draw_text("Click the button to end test", color_black(), 10.0, 50.0);
        start_panel("Test Panel 4", rectangle_from(0.0, 70.0, 800.0, 530.0));
        set_layout_height(50);
        button_clicked = bitmap_button(test_bitmap, test_options2);
        end_panel("Test Panel 4");
        draw_interface();
        refresh_screen();
    }
    REQUIRE(button_clicked);
}
TEST_CASE_METHOD(TestInterfaceFixture, "bitmap_button_labeled_integration") {
    open_window("Test Window 7", 800, 600);
    window_cleanup cleanup_window;
    auto test_bitmap = create_bitmap("Test Bitmap 5", 20, 20);
    clear_bitmap(test_bitmap, color_red());
    bitmap_cleanup cleanup_bitmap;
    auto button_clicked = false;
    while (button_clicked == false) {
        process_events();
        clear_screen();
        draw_text("Test: bitmap_button_labeled", color_black(), 10.0, 10.0);
        draw_text("Expected: A red bitmap button with label 'Click Me'", color_black(), 10.0, 30.0);
        draw_text("Click the button to end test", color_black(), 10.0, 50.0);
        start_panel("Test Panel 5", rectangle_from(0.0, 70.0, 800.0, 530.0));
        button_clicked = bitmap_button("Click Me", test_bitmap);
        end_panel("Test Panel 5");
        draw_interface();
        refresh_screen();
    }
    REQUIRE(button_clicked);
}
TEST_CASE_METHOD(TestInterfaceFixture, "bitmap_button_labeled_with_options_integration") {
    open_window("Test Window 8", 800, 600);
    window_cleanup cleanup_window;
    auto test_bitmap = create_bitmap("Test Bitmap 6", 20, 20);
    clear_bitmap(test_bitmap, color_red());
    bitmap_cleanup cleanup_bitmap;
    auto test_options1 = option_defaults();
    auto test_options2 = option_scale_bmp(0.5, 0.5, test_options1);
    auto button_clicked = false;
    while (button_clicked == false) {
        process_events();
        clear_screen();
        draw_text("Test: bitmap_button_labeled_with_options", color_black(), 10.0, 10.0);
        draw_text("Expected: A red bitmap button scaled to 50% with label 'Click Me'", color_black(), 10.0, 30.0);
        draw_text("Click the button to end test", color_black(), 10.0, 50.0);
        start_panel("Test Panel 6", rectangle_from(0.0, 70.0, 800.0, 530.0));
        button_clicked = bitmap_button("Click Me", test_bitmap, test_options2);
        end_panel("Test Panel 6");
        draw_interface();
        refresh_screen();
    }
    REQUIRE(button_clicked);
}
TEST_CASE_METHOD(TestInterfaceFixture, "button_at_position_integration") {
    open_window("Test Window 9", 800, 600);
    window_cleanup cleanup_window;
    auto test_rectangle = rectangle_from(100.0, 100.0, 200.0, 50.0);
    auto button_clicked = false;
    while (button_clicked == false) {
        process_events();
        clear_screen();
        draw_text("Test: button_at_position", color_black(), 10.0, 10.0);
        draw_text("Expected: A button with text 'Click Me' at position (100,100) with size 200x50", color_black(), 10.0, 30.0);
        draw_text("Click the button to end test", color_black(), 10.0, 50.0);
        button_clicked = button("Click Me", test_rectangle);
        draw_interface();
        refresh_screen();
    }
    REQUIRE(button_clicked);
}
TEST_CASE_METHOD(TestInterfaceFixture, "button_integration") {
    open_window("Test Window 10", 800, 600);
    window_cleanup cleanup_window;
    auto button_clicked = false;
    while (button_clicked == false) {
        process_events();
        clear_screen();
        draw_text("Test: button", color_black(), 10.0, 10.0);
        draw_text("Expected: A button with text 'Click Me' using default layout", color_black(), 10.0, 30.0);
        draw_text("Click the button to end test", color_black(), 10.0, 50.0);
        start_panel("Test Panel 7", rectangle_from(0.0, 70.0, 800.0, 530.0));
        button_clicked = button("Click Me");
        end_panel("Test Panel 7");
        draw_interface();
        refresh_screen();
    }
    REQUIRE(button_clicked);
}
TEST_CASE_METHOD(TestInterfaceFixture, "button_labeled_integration") {
    open_window("Test Window 11", 800, 600);
    window_cleanup cleanup_window;
    auto button_clicked = false;
    while (button_clicked == false) {
        process_events();
        clear_screen();
        draw_text("Test: button_labeled", color_black(), 10.0, 10.0);
        draw_text("Expected: A button with text 'Click Me' and label 'Label:' in a two-column layout", color_black(), 10.0, 30.0);
        draw_text("Click the button to end test", color_black(), 10.0, 50.0);
        start_panel("Test Panel 8", rectangle_from(0.0, 70.0, 800.0, 530.0));
        button_clicked = button("Label:", "Click Me");
        end_panel("Test Panel 8");
        draw_interface();
        refresh_screen();
    }
    REQUIRE(button_clicked);
}
TEST_CASE_METHOD(TestInterfaceFixture, "checkbox_at_position_integration") {
    open_window("Test Window 12", 800, 600);
    window_cleanup cleanup_window;
    auto test_rect = rectangle_from(100.0, 100.0, 200.0, 50.0);
    auto initial_checkbox_result = false;
    auto current_checkbox_result = initial_checkbox_result;
    while (current_checkbox_result == false) {
        process_events();
        clear_screen();
        draw_text("Test: checkbox_at_position", color_black(), 10.0, 10.0);
        draw_text("Expected: A checkbox with text 'Test Checkbox' at position (100,100) with size 200x50", color_black(), 10.0, 30.0);
        draw_text("Click the checkbox to end test", color_black(), 10.0, 50.0);
        current_checkbox_result = checkbox("Test Checkbox", current_checkbox_result, test_rect);
        draw_interface();
        refresh_screen();
    }
    REQUIRE(current_checkbox_result);
}
TEST_CASE_METHOD(TestInterfaceFixture, "checkbox_integration") {
    open_window("Test Window 13", 800, 600);
    window_cleanup cleanup_window;
    auto initial_checkbox_result = false;
    auto current_checkbox_result = initial_checkbox_result;
    while (current_checkbox_result == false) {
        process_events();
        clear_screen();
        draw_text("Test: checkbox", color_black(), 10.0, 10.0);
        draw_text("Expected: A checkbox with text 'Test Checkbox' using default layout", color_black(), 10.0, 30.0);
        draw_text("Click the checkbox to end test", color_black(), 10.0, 50.0);
        start_panel("Test Panel 9", rectangle_from(0.0, 70.0, 800.0, 530.0));
        current_checkbox_result = checkbox("Test Checkbox", current_checkbox_result);
        end_panel("Test Panel 9");
        draw_interface();
        refresh_screen();
    }
    REQUIRE(current_checkbox_result);
}
TEST_CASE_METHOD(TestInterfaceFixture, "checkbox_labeled_integration") {
    open_window("Test Window 14", 800, 600);
    window_cleanup cleanup_window;
    auto initial_checkbox_result = false;
    auto current_checkbox_result = initial_checkbox_result;
    while (current_checkbox_result == false) {
        process_events();
        clear_screen();
        draw_text("Test: checkbox_labeled", color_black(), 10.0, 10.0);
        draw_text("Expected: A checkbox with text 'Check me' and label 'Test Checkbox' in a two-column layout", color_black(), 10.0, 30.0);
        draw_text("Click the checkbox to end test", color_black(), 10.0, 50.0);
        start_panel("Test Panel 10", rectangle_from(0.0, 70.0, 800.0, 530.0));
        set_interface_label_width(110);
        current_checkbox_result = checkbox("Test Checkbox", "Check me", current_checkbox_result);
        end_panel("Test Panel 10");
        draw_interface();
        refresh_screen();
    }
    REQUIRE(current_checkbox_result);
}
TEST_CASE_METHOD(TestInterfaceFixture, "color_slider_at_position_integration") {
    open_window("Test Window 15", 800, 600);
    window_cleanup cleanup_window;
    auto initial_color = color_black();
    auto current_color = initial_color;
    process_events();
    while (key_down(key_code::SPACE_KEY) == false) {
        process_events();
        clear_screen();
        draw_text("Test: color_slider_at_position", color_black(), 10.0, 10.0);
        draw_text("Expected: A color slider using RGBA controls at position (100,100) with size 400x24", color_black(), 10.0, 30.0);
        draw_text("Change the color and press space to pass", color_black(), 10.0, 50.0);
        current_color = color_slider(current_color, rectangle_from(100.0, 100.0, 400.0, 24.0));
        draw_interface();
        refresh_screen();
    }
    REQUIRE(current_color != initial_color);
}
TEST_CASE_METHOD(TestInterfaceFixture, "color_slider_integration") {
    open_window("Test Window 16", 800, 600);
    window_cleanup cleanup_window;
    auto initial_color = color_black();
    auto current_color = initial_color;
    process_events();
    while (key_down(key_code::SPACE_KEY) == false) {
        process_events();
        clear_screen();
        draw_text("Test: color_slider", color_black(), 10.0, 10.0);
        draw_text("Expected: A color slider with RGBA controls using default layout", color_black(), 10.0, 30.0);
        draw_text("Change the color and press space to pass", color_black(), 10.0, 50.0);
        start_panel("Test Panel 11", rectangle_from(0.0, 70.0, 800.0, 530.0));
        current_color = color_slider(current_color);
        end_panel("Test Panel 11");
        draw_interface();
        refresh_screen();
    }
    REQUIRE_FALSE(quit_requested());
}
TEST_CASE_METHOD(TestInterfaceFixture, "color_slider_labeled_integration") {
    open_window("Test Window 17", 800, 600);
    window_cleanup cleanup_window;
    auto initial_color = color_black();
    auto current_color = initial_color;
    process_events();
    while (key_down(key_code::SPACE_KEY) == false) {
        process_events();
        clear_screen();
        draw_text("Test: color_slider_labeled", color_black(), 10.0, 10.0);
        draw_text("Expected: A color slider with label 'Test Color Slider' in a two-column layout", color_black(), 10.0, 30.0);
        draw_text("Change the color and press space to pass", color_black(), 10.0, 50.0);
        set_interface_label_width(120);
        start_panel("Test Panel 12", rectangle_from(0.0, 70.0, 800.0, 530.0));
        current_color = color_slider("Test Color Slider", current_color);
        end_panel("Test Panel 12");
        draw_interface();
        refresh_screen();
    }
    REQUIRE(initial_color != current_color);
}
TEST_CASE_METHOD(TestInterfaceFixture, "disable_interface_integration") {
    open_window("Test Window 18", 800, 600);
    window_cleanup cleanup_window;
    auto button_clicked = false;
    REQUIRE(interface_enabled());
    disable_interface();
    process_events();
    while (key_down(key_code::SPACE_KEY) == false) {
        process_events();
        clear_screen();
        draw_text("Test: disable_interface", color_black(), 10.0, 10.0);
        draw_text("Expected: A button that is disabled", color_black(), 10.0, 30.0);
        draw_text("Click the button and press space to verify that the button is disabled", color_black(), 10.0, 50.0);
        start_panel("Test Panel 13", rectangle_from(0.0, 70.0, 800.0, 530.0));
        button_clicked = button("Try to click me");
        end_panel("Test Panel 13");
        draw_interface();
        refresh_screen();
    }
    REQUIRE_FALSE(interface_enabled());
    REQUIRE_FALSE(button_clicked);
    enable_interface();
}
TEST_CASE_METHOD(TestInterfaceFixture, "draw_interface_integration") {
    open_window("Test Window 19", 800, 600);
    window_cleanup cleanup_window;
    process_events();
    while (key_down(key_code::SPACE_KEY) == false) {
        process_events();
        clear_screen();
        draw_text("Test: draw_interface", color_black(), 10.0, 10.0);
        draw_text("Expected: A panel at position (100,100) with size 200x200", color_black(), 10.0, 30.0);
        draw_text("Press space to end test", color_black(), 10.0, 50.0);
        start_panel("Test Panel 14", rectangle_from(100.0, 100.0, 200.0, 200.0));
        button("Test Button");
        end_panel("Test Panel 14");
        draw_interface();
        refresh_screen();
    }
}
TEST_CASE_METHOD(TestInterfaceFixture, "enable_interface_integration") {
    open_window("Test Window 20", 800, 600);
    window_cleanup cleanup_window;
    disable_interface();
    process_events();
    while (key_down(key_code::SPACE_KEY) == false) {
        process_events();
        clear_screen();
        draw_text("Test: enable_interface", color_black(), 10.0, 10.0);
        draw_text("Expected: Button should be disabled", color_black(), 10.0, 30.0);
        draw_text("Press space to continue", color_black(), 10.0, 50.0);
        start_panel("Test Panel 15", rectangle_from(0.0, 70.0, 800.0, 530.0));
        button("Test Button");
        end_panel("Test Panel 15");
        draw_interface();
        refresh_screen();
    }
    REQUIRE_FALSE(interface_enabled());
    enable_interface();
    auto button_clicked = false;
    while (button_clicked == false) {
        process_events();
        clear_screen();
        draw_text("Test: enable_interface", color_black(), 10.0, 10.0);
        draw_text("Expected: Button should be enabled", color_black(), 10.0, 30.0);
        draw_text("Click the button to end test", color_black(), 10.0, 50.0);
        start_panel("Test Panel 16", rectangle_from(0.0, 70.0, 800.0, 530.0));
        button_clicked = button("Test Button");
        end_panel("Test Panel 16");
        draw_interface();
        refresh_screen();
    }
    REQUIRE(interface_enabled());
    REQUIRE(button_clicked);
}
TEST_CASE_METHOD(TestInterfaceFixture, "end_inset_integration") {
    open_window("Test Window 21", 800, 600);
    window_cleanup cleanup_window;
    process_events();
    while (key_down(key_code::SPACE_KEY) == false) {
        process_events();
        clear_screen();
        draw_text("Test: end_inset", color_black(), 10.0, 10.0);
        draw_text("Expected: An inset with height 60 pixels containing a button", color_black(), 10.0, 30.0);
        draw_text("Press space to end test", color_black(), 10.0, 50.0);
        start_panel("Test Panel 17", rectangle_from(0.0, 70.0, 800.0, 530.0));
        start_inset("Test Inset", 60);
        button("Test Button");
        end_inset("Test Inset");
        end_panel("Test Panel 17");
        draw_interface();
        refresh_screen();
    }
}
TEST_CASE_METHOD(TestInterfaceFixture, "end_panel_integration") {
    open_window("Test Window 22", 800, 600);
    window_cleanup cleanup_window;
    process_events();
    while (key_down(key_code::SPACE_KEY) == false) {
        process_events();
        clear_screen();
        draw_text("Test: end_panel", color_black(), 10.0, 10.0);
        draw_text("Expected: A panel at position (100,100) with size 200x200 containing a button", color_black(), 10.0, 30.0);
        draw_text("Press space to end test", color_black(), 10.0, 50.0);
        start_panel("Test Panel 18", rectangle_from(100.0, 100.0, 200.0, 200.0));
        button("Test Button");
        end_panel("Test Panel 18");
        draw_interface();
        refresh_screen();
    }
}
TEST_CASE_METHOD(TestInterfaceFixture, "end_popup_integration") {
    open_window("Test Window 23", 800, 600);
    window_cleanup cleanup_window;
    process_events();
    while (key_down(key_code::SPACE_KEY) == false) {
        process_events();
        clear_screen();
        draw_text("Test: end_popup", color_black(), 10.0, 10.0);
        draw_text("Expected: Click the button to show a popup with a label", color_black(), 10.0, 30.0);
        draw_text("Press space to end test", color_black(), 10.0, 50.0);
        start_panel("Test Panel 19", rectangle_from(0.0, 70.0, 800.0, 530.0));
        if (button("Open Popup") == true) {
            open_popup("Test Popup");
        }
        if (start_popup("Test Popup") == true) {
            single_line_layout();
            set_interface_label_width(200);
            label_element("Test Label");
            end_popup("Test Popup");
        }
        end_panel("Test Panel 19");
        draw_interface();
        refresh_screen();
    }
}
TEST_CASE_METHOD(TestInterfaceFixture, "end_treenode_integration") {
    open_window("Test Window 24", 800, 600);
    window_cleanup cleanup_window;
    process_events();
    while (key_down(key_code::SPACE_KEY) == false) {
        process_events();
        clear_screen();
        draw_text("Test: end_treenode", color_black(), 10.0, 10.0);
        draw_text("Expected: A panel containing a collapsible tree node with a button", color_black(), 10.0, 30.0);
        draw_text("Press space to end test", color_black(), 10.0, 50.0);
        start_panel("Test Panel 20", rectangle_from(10.0, 70.0, 200.0, 200.0));
        if (start_treenode("Test Node") == true) {
            button("Test Button");
            end_treenode("Test Node");
        }
        end_panel("Test Panel 20");
        draw_interface();
        refresh_screen();
    }
}
TEST_CASE_METHOD(TestInterfaceFixture, "enter_column_integration") {
    open_window("Test Window 25", 800, 600);
    window_cleanup cleanup_window;
    process_events();
    while (key_down(key_code::SPACE_KEY) == false) {
        process_events();
        clear_screen();
        draw_text("Test: enter_column", color_black(), 10.0, 10.0);
        draw_text("Expected: A panel with a 100-pixel wide column containing a button", color_black(), 10.0, 30.0);
        draw_text("Test Button", color_black(), 10.0, 50.0);
        start_panel("Test Panel 21", rectangle_from(10.0, 70.0, 300.0, 200.0));
        add_column(100);
        enter_column();
        button("Test Button");
        leave_column();
        end_panel("Test Panel 21");
        draw_interface();
        refresh_screen();
    }
}
TEST_CASE_METHOD(TestInterfaceFixture, "get_interface_label_width_integration") {
    process_events();
    set_interface_label_width(100);
    auto test_label_width = get_interface_label_width();
    REQUIRE(100 == test_label_width);
}
TEST_CASE_METHOD(TestInterfaceFixture, "header_integration") {
    open_window("Test Window 26", 800, 600);
    window_cleanup cleanup_window;
    process_events();
    while (key_down(key_code::SPACE_KEY) == false) {
        process_events();
        clear_screen();
        draw_text("Test: header", color_black(), 10.0, 10.0);
        draw_text("Expected: A collapsible header labeled 'Test Header' with a button", color_black(), 10.0, 30.0);
        draw_text("Press space to end test", color_black(), 10.0, 50.0);
        start_panel("Test Panel 22", rectangle_from(10.0, 70.0, 300.0, 200.0));
        if (header("Test Header") == true) {
            button("Test Button");
        }
        end_panel("Test Panel 22");
        draw_interface();
        refresh_screen();
    }
}
TEST_CASE_METHOD(TestInterfaceFixture, "hsb_color_slider_at_position_integration") {
    open_window("Test Window 27", 800, 600);
    window_cleanup cleanup_window;
    auto initial_color = color_black();
    auto test_rect = rectangle_from(100.0, 100.0, 400.0, 24.0);
    auto current_color = initial_color;
    process_events();
    while (key_down(key_code::SPACE_KEY) == false) {
        process_events();
        clear_screen();
        draw_text("Test: hsb_color_slider_at_position", color_black(), 10.0, 10.0);
        draw_text("Expected: A HSB color slider at position (100,100) with size 400x24", color_black(), 10.0, 30.0);
        draw_text("Change the color and press space to pass", color_black(), 10.0, 50.0);
        current_color = hsb_color_slider(current_color, test_rect);
        draw_interface();
        refresh_screen();
    }
    REQUIRE(current_color != initial_color);
}
TEST_CASE_METHOD(TestInterfaceFixture, "hsb_color_slider_integration") {
    open_window("Test Window 28", 800, 600);
    window_cleanup cleanup_window;
    auto initial_color = color_black();
    auto current_color = initial_color;
    process_events();
    while (key_down(key_code::SPACE_KEY) == false) {
        process_events();
        clear_screen();
        draw_text("Test: hsb_color_slider", color_black(), 10.0, 10.0);
        draw_text("Expected: A HSB color slider using default layout", color_black(), 10.0, 30.0);
        draw_text("Change the color and press space to pass", color_black(), 10.0, 50.0);
        start_panel("Test Panel 23", rectangle_from(0.0, 70.0, 800.0, 530.0));
        current_color = hsb_color_slider(current_color);
        end_panel("Test Panel 23");
        draw_interface();
        refresh_screen();
    }
    REQUIRE(current_color != initial_color);
}
TEST_CASE_METHOD(TestInterfaceFixture, "hsb_color_slider_labeled_integration") {
    open_window("Test Window 29", 800, 600);
    window_cleanup cleanup_window;
    auto initial_color = color_black();
    auto current_color = initial_color;
    process_events();
    while (key_down(key_code::SPACE_KEY) == false) {
        process_events();
        clear_screen();
        draw_text("Test: hsb_color_slider_labeled", color_black(), 10.0, 10.0);
        draw_text("Expected: A HSB color slider with label 'Color Slider' in a two-column layout", color_black(), 10.0, 30.0);
        draw_text("Change the color and press space to pass", color_black(), 10.0, 50.0);
        start_panel("Test Panel 24", rectangle_from(0.0, 70.0, 800.0, 530.0));
        set_interface_label_width(100);
        current_color = hsb_color_slider("Color Slider", current_color);
        end_panel("Test Panel 24");
        draw_interface();
        refresh_screen();
    }
    REQUIRE(current_color != initial_color);
}
TEST_CASE_METHOD(TestInterfaceFixture, "interface_enabled_integration") {
    window_cleanup cleanup_window;
    auto initial_state = interface_enabled();
    REQUIRE(initial_state);
    disable_interface();
    auto disabled_state = interface_enabled();
    REQUIRE_FALSE(disabled_state);
    enable_interface();
    auto enabled_state = interface_enabled();
    REQUIRE(enabled_state);
}
TEST_CASE_METHOD(TestInterfaceFixture, "interface_style_panel_integration") {
    layout_cleanup layout_cleanup;
    open_window("Test Window 30", 800, 600);
    window_cleanup cleanup_window;
    auto panel_rectangle = rectangle_from(0.0, 70.0, 800.0, 530.0);
    process_events();
    while (key_down(key_code::SPACE_KEY) == false) {
        process_events();
        clear_screen();
        draw_text("Test: interface_style_panel", color_black(), 10.0, 10.0);
        draw_text("Expected: A panel with controls to adjust the interface style", color_black(), 10.0, 30.0);
        draw_text("Adjust the style and press space to end test", color_black(), 10.0, 50.0);
        interface_style_panel(panel_rectangle);
        draw_interface();
        refresh_screen();
    }
}
TEST_CASE_METHOD(TestInterfaceFixture, "label_element_integration") {
    open_window("Test Window 31", 800, 600);
    window_cleanup cleanup_window;
    process_events();
    while (key_down(key_code::SPACE_KEY) == false) {
        process_events();
        clear_screen();
        draw_text("Test: label_element", color_black(), 10.0, 10.0);
        draw_text("Expected: A label with text 'Test Label' using default layout", color_black(), 10.0, 30.0);
        draw_text("Press space to end test", color_black(), 10.0, 50.0);
        start_panel("Test Panel 25", rectangle_from(0.0, 70.0, 800.0, 530.0));
        label_element("Test Label");
        end_panel("Test Panel 25");
        draw_interface();
        refresh_screen();
    }
}
TEST_CASE_METHOD(TestInterfaceFixture, "label_element_at_position_integration") {
    open_window("Test Window 32", 800, 600);
    window_cleanup cleanup_window;
    auto test_rectangle = rectangle_from(100.0, 100.0, 200.0, 50.0);
    process_events();
    while (key_down(key_code::SPACE_KEY) == false) {
        process_events();
        clear_screen();
        draw_text("Test: label_element_at_position", color_black(), 10.0, 10.0);
        draw_text("Expected: A label with text 'Test Label' at position (100,100)", color_black(), 10.0, 30.0);
        draw_text("Press space to end test", color_black(), 10.0, 50.0);
        label_element("Test Label", test_rectangle);
        draw_interface();
        refresh_screen();
    }
}
TEST_CASE_METHOD(TestInterfaceFixture, "last_element_changed_integration") {
    open_window("Test Window 33", 800, 600);
    window_cleanup cleanup_window;
    auto initial_value = 0.0f;
    auto current_value = 0.0f;
    auto element_changed = false;
    process_events();
    while (key_down(key_code::SPACE_KEY) == false) {
        process_events();
        clear_screen();
        draw_text("Test: last_element_changed", color_black(), 10.0, 10.0);
        draw_text("Expected: A slider that detects value changes", color_black(), 10.0, 30.0);
        draw_text("Move the slider and press space to pass", color_black(), 10.0, 50.0);
        start_panel("Test Panel 26", rectangle_from(0.0, 70.0, 800.0, 530.0));
        current_value = slider("Test Slider", current_value, 0.0f, 100.0f);
        if (last_element_changed() == true) {
            element_changed = true;
        }
        end_panel("Test Panel 26");
        draw_interface();
        refresh_screen();
    }
    REQUIRE(current_value != initial_value);
    REQUIRE(element_changed);
}
TEST_CASE_METHOD(TestInterfaceFixture, "last_element_confirmed_integration") {
    open_window("Test Window 34", 800, 600);
    window_cleanup cleanup_window;
    auto button_clicked = false;
    process_events();
    while (key_down(key_code::SPACE_KEY) == false) {
        process_events();
        clear_screen();
        draw_text("Test: last_element_confirmed", color_black(), 10.0, 10.0);
        draw_text("Expected: A button that detects when clicked", color_black(), 10.0, 30.0);
        draw_text("Click the button and press space to pass", color_black(), 10.0, 50.0);
        start_panel("Test Panel 27", rectangle_from(0.0, 70.0, 800.0, 530.0));
        button("Test Button");
        if (last_element_confirmed() == true) {
            button_clicked = true;
        }
        end_panel("Test Panel 27");
        draw_interface();
        refresh_screen();
    }
    REQUIRE(button_clicked);
}
TEST_CASE_METHOD(TestInterfaceFixture, "leave_column_integration") {
    open_window("Test Window 35", 800, 600);
    window_cleanup cleanup_window;
    process_events();
    while (key_down(key_code::SPACE_KEY) == false) {
        process_events();
        clear_screen();
        draw_text("Test: leave_column", color_black(), 10.0, 10.0);
        draw_text("Expected: A button that appears after leaving a column with a width of 100", color_black(), 10.0, 30.0);
        draw_text("Press space to end test", color_black(), 10.0, 50.0);
        start_panel("Test Panel 28", rectangle_from(10.0, 70.0, 300.0, 200.0));
        start_custom_layout();
        add_column(100);
        add_column(-1);
        enter_column();
        leave_column();
        button("Test Button");
        end_panel("Test Panel 28");
        draw_interface();
        refresh_screen();
    }
}
TEST_CASE_METHOD(TestInterfaceFixture, "number_box_at_position_integration") {
    open_window("Test Window 36", 800, 600);
    window_cleanup cleanup_window;
    auto test_rect = rectangle_from(100.0, 100.0, 200.0, 30.0);
    auto test_result = 5.0f;
    process_events();
    while (key_down(key_code::SPACE_KEY) == false) {
        process_events();
        clear_screen();
        draw_text("Test: number_box_at_position", color_black(), 10.0, 10.0);
        draw_text("Expected: A number box at position (100,100) with size 200x30", color_black(), 10.0, 30.0);
        draw_text("Change the number and press space to pass", color_black(), 10.0, 50.0);
        test_result = number_box(test_result, 1.0f, test_rect);
        draw_interface();
        refresh_screen();
    }
    REQUIRE(5.0f != test_result);
}
TEST_CASE_METHOD(TestInterfaceFixture, "number_box_integration") {
    open_window("Test Window 37", 800, 600);
    window_cleanup cleanup_window;
    auto test_result = 5.0f;
    process_events();
    while (key_down(key_code::SPACE_KEY) == false) {
        process_events();
        clear_screen();
        draw_text("Test: number_box", color_black(), 10.0, 10.0);
        draw_text("Expected: A number box with step size 1.0 using the default layout", color_black(), 10.0, 30.0);
        draw_text("Change the number and press space to pass", color_black(), 10.0, 50.0);
        start_panel("Test Panel 29", rectangle_from(10.0, 70.0, 300.0, 200.0));
        test_result = number_box(test_result, 1.0f);
        end_panel("Test Panel 29");
        draw_interface();
        refresh_screen();
    }
    REQUIRE(5.0f != test_result);
}
TEST_CASE_METHOD(TestInterfaceFixture, "number_box_labeled_integration") {
    open_window("Test Window 38", 800, 600);
    window_cleanup cleanup_window;
    auto test_result = 5.0f;
    process_events();
    while (key_down(key_code::SPACE_KEY) == false) {
        process_events();
        clear_screen();
        draw_text("Test: number_box_labeled", color_black(), 10.0, 10.0);
        draw_text("Expected: A labeled number box with step size 1.0 using the default layout", color_black(), 10.0, 30.0);
        draw_text("Change the number and press space to pass", color_black(), 10.0, 50.0);
        start_panel("Test Panel 30", rectangle_from(10.0, 70.0, 300.0, 200.0));
        set_interface_label_width(100);
        test_result = number_box("Test Value", test_result, 1.0f);
        end_panel("Test Panel 30");
        draw_interface();
        refresh_screen();
    }
    REQUIRE(5.0f != test_result);
}
TEST_CASE_METHOD(TestInterfaceFixture, "open_popup_integration") {
    open_window("Test Window 39", 800, 600);
    window_cleanup cleanup_window;
    process_events();
    while (key_down(key_code::SPACE_KEY) == false) {
        process_events();
        clear_screen();
        draw_text("Test: open_popup", color_black(), 10.0, 10.0);
        draw_text("Expected: Click the button to show a popup with a label", color_black(), 10.0, 30.0);
        draw_text("Press space to end test", color_black(), 10.0, 50.0);
        start_panel("Test Panel 31", rectangle_from(0.0, 70.0, 800.0, 530.0));
        if (button("Open Popup") == true) {
            open_popup("Test Popup");
        }
        if (start_popup("Test Popup") == true) {
            single_line_layout();
            set_interface_label_width(200);
            label_element("Test Label");
            end_popup("Test Popup");
        }
        end_panel("Test Panel 31");
        draw_interface();
        refresh_screen();
    }
}
TEST_CASE_METHOD(TestInterfaceFixture, "paragraph_integration") {
    layout_cleanup layout_cleanup;
    open_window("Test Window 40", 800, 600);
    window_cleanup cleanup_window;
    process_events();
    set_interface_font(load_font("hara", "hara.ttf"));
    interface_font_cleanup cleanup_interface_font;
    font_cleanup cleanup_font;
    set_interface_font_size(12);
    while (key_down(key_code::SPACE_KEY) == false) {
        process_events();
        clear_screen();
        draw_text("Test: paragraph", color_black(), 10.0, 10.0);
        draw_text("Expected: A paragraph of text that wraps correctly within the panel", color_black(), 10.0, 30.0);
        draw_text("Press space to end test", color_black(), 10.0, 50.0);
        start_panel("Test Panel 32", rectangle_from(10.0, 70.0, 300.0, 200.0));
        paragraph("This is a test paragraph to check if the text wraps correctly. weguy YGWE FYw eiuofhWEOF wue fuhwbeuf WUEFU wue");
        end_panel("Test Panel 32");
        draw_interface();
        refresh_screen();
    }
    set_interface_font_size(13);
}
TEST_CASE_METHOD(TestInterfaceFixture, "paragraph_at_position_integration") {
    open_window("Test Window 41", 800, 600);
    window_cleanup cleanup_window;
    auto test_rectangle = rectangle_from(100.0, 100.0, 200.0, 100.0);
    process_events();
    while (key_down(key_code::SPACE_KEY) == false) {
        process_events();
        clear_screen();
        draw_text("Test: paragraph_at_position", color_black(), 10.0, 10.0);
        draw_text("Expected: A paragraph at position (100,100) with size 200x100", color_black(), 10.0, 30.0);
        draw_text("Press space to end test", color_black(), 10.0, 50.0);
        paragraph("This is a test paragraph to check if the text wraps correctly. weguy YGWE FYw eiuofhWEOF wue fuhwbeuf WUEFU wue", test_rectangle);
        draw_interface();
        refresh_screen();
    }
}
TEST_CASE_METHOD(TestInterfaceFixture, "reset_layout_integration") {
    open_window("Test Window 42", 800, 600);
    window_cleanup cleanup_window;
    process_events();
    while (key_down(key_code::SPACE_KEY) == false) {
        process_events();
        clear_screen();
        draw_text("Test: reset_layout", color_black(), 10.0, 10.0);
        draw_text("Expected: The second button should not be confined to the created columns after reset", color_black(), 10.0, 30.0);
        draw_text("Press space to end test", color_black(), 10.0, 50.0);
        start_panel("Test Panel 33", rectangle_from(10.0, 70.0, 300.0, 200.0));
        start_custom_layout();
        add_column(200);
        add_column(-1);
        button("Button 1");
        reset_layout();
        button("Button 2");
        end_panel("Test Panel 33");
        draw_interface();
        refresh_screen();
    }
}
TEST_CASE_METHOD(TestInterfaceFixture, "set_interface_accent_color_integration") {
    layout_cleanup layout_cleanup;
    open_window("Test Window 43", 800, 600);
    window_cleanup cleanup_window;
    process_events();
    set_interface_accent_color(color_red(), 0.5f);
    while (key_down(key_code::SPACE_KEY) == false) {
        process_events();
        clear_screen();
        draw_text("Test: set_interface_accent_color", color_black(), 10.0, 10.0);
        draw_text("Expected: A button with red accent color at 50% contrast", color_black(), 10.0, 30.0);
        draw_text("Press space to end test", color_black(), 10.0, 50.0);
        start_panel("Test Panel 34", rectangle_from(10.0, 70.0, 300.0, 200.0));
        button("Test Button");
        end_panel("Test Panel 34");
        draw_interface();
        refresh_screen();
    }
}
TEST_CASE_METHOD(TestInterfaceFixture, "set_interface_border_color_integration") {
    layout_cleanup layout_cleanup;
    open_window("Test Window 44", 800, 600);
    window_cleanup cleanup_window;
    process_events();
    set_interface_border_color(color_red());
    while (key_down(key_code::SPACE_KEY) == false) {
        process_events();
        clear_screen();
        draw_text("Test: set_interface_border_color", color_black(), 10.0, 10.0);
        draw_text("Expected: A panel and button with red borders", color_black(), 10.0, 30.0);
        draw_text("Press space to end test", color_black(), 10.0, 50.0);
        start_panel("Test Panel 35", rectangle_from(10.0, 70.0, 300.0, 200.0));
        button("Test Button");
        end_panel("Test Panel 35");
        draw_interface();
        refresh_screen();
    }
}
TEST_CASE_METHOD(TestInterfaceFixture, "set_interface_colors_auto_integration") {
    layout_cleanup layout_cleanup;
    open_window("Test Window 45", 800, 600);
    window_cleanup cleanup_window;
    process_events();
    set_interface_colors_auto(color_white(), color_blue(), 0.5f, 0.7f, 0.3f);
    while (key_down(key_code::SPACE_KEY) == false) {
        process_events();
        clear_screen();
        draw_text("Test: set_interface_colors_auto", color_black(), 10.0, 10.0);
        draw_text("Expected: A panel with white main color and blue accent color", color_black(), 10.0, 30.0);
        draw_text("Press space to end test", color_black(), 10.0, 70.0);
        start_panel("Test Panel 36", rectangle_from(10.0, 90.0, 300.0, 200.0));
        button("Test Button");
        end_panel("Test Panel 36");
        draw_interface();
        refresh_screen();
    }
}
TEST_CASE_METHOD(TestInterfaceFixture, "set_interface_element_color_integration") {
    layout_cleanup layout_cleanup;
    open_window("Test Window 46", 800, 600);
    window_cleanup cleanup_window;
    process_events();
    set_interface_element_color(color_black(), 0.5f);
    while (key_down(key_code::SPACE_KEY) == false) {
        process_events();
        clear_screen();
        draw_text("Test: set_interface_element_color", color_black(), 10.0, 10.0);
        draw_text("Expected: A panel with black element color at 50% contrast", color_black(), 10.0, 30.0);
        draw_text("Press space to end test", color_black(), 10.0, 50.0);
        start_panel("Test Panel 37", rectangle_from(10.0, 70.0, 300.0, 200.0));
        button("Test Button");
        end_panel("Test Panel 37");
        draw_interface();
        refresh_screen();
    }
}
TEST_CASE_METHOD(TestInterfaceFixture, "set_interface_element_shadows_integration") {
    layout_cleanup layout_cleanup;
    open_window("Test Window 47", 800, 600);
    window_cleanup cleanup_window;
    process_events();
    set_interface_element_shadows(10, color_blue(), point_at(5.0, 5.0));
    while (key_down(key_code::SPACE_KEY) == false) {
        process_events();
        clear_screen();
        draw_text("Test: set_interface_element_shadows", color_black(), 10.0, 10.0);
        draw_text("Expected: Elements with blue shadow (radius: 10, offset: 5,5)", color_black(), 10.0, 30.0);
        draw_text("Press space to end test", color_black(), 10.0, 50.0);
        start_panel("Test Panel 38", rectangle_from(10.0, 70.0, 300.0, 200.0));
        button("Test Button");
        end_panel("Test Panel 38");
        draw_interface();
        refresh_screen();
    }
}
TEST_CASE_METHOD(TestInterfaceFixture, "set_interface_font_font_as_string_integration") {
    layout_cleanup layout_cleanup;
    open_window("Test Window 48", 800, 600);
    window_cleanup cleanup_window;
    load_font("hara", "hara.ttf");
    interface_font_cleanup cleanup_interface_font;
    font_cleanup cleanup_font;
    load_font("demolition", "demolition.otf");
    process_events();
    while (key_down(key_code::SPACE_KEY) == false) {
        process_events();
        clear_screen();
        draw_text("Test: set_interface_font_font_as_string", color_black(), 10.0, 10.0);
        draw_text("Press space to end test", color_black(), 10.0, 30.0);
        set_interface_font("hara");
        start_panel("Hara Font", rectangle_from(10.0, 70.0, 300.0, 100.0));
        label_element("This text uses Hara font");
        end_panel("Hara Font");
        set_interface_font("demolition");
        start_panel("Demolition Font", rectangle_from(10.0, 180.0, 300.0, 100.0));
        label_element("This text uses Demolition font");
        end_panel("Demolition Font");
        draw_interface();
        refresh_screen();
    }
}
TEST_CASE_METHOD(TestInterfaceFixture, "set_interface_font_integration") {
    layout_cleanup layout_cleanup;
    open_window("Test Window 49", 800, 600);
    window_cleanup cleanup_window;
    auto hara_font = load_font("hara", "hara.ttf");
    interface_font_cleanup cleanup_interface_font;
    font_cleanup cleanup_font;
    auto demolition_font = load_font("demolition", "demolition.otf");
    process_events();
    while (key_down(key_code::SPACE_KEY) == false) {
        process_events();
        clear_screen();
        draw_text("Test: set_interface_font", color_black(), 10.0, 10.0);
        draw_text("Press space to end test", color_black(), 10.0, 30.0);
        set_interface_font(hara_font);
        start_panel("Hara Font", rectangle_from(10.0, 70.0, 300.0, 100.0));
        label_element("This text uses Hara font");
        end_panel("Hara Font");
        set_interface_font(demolition_font);
        start_panel("Demolition Font", rectangle_from(10.0, 180.0, 300.0, 100.0));
        label_element("This text uses Demolition font");
        end_panel("Demolition Font");
        draw_interface();
        refresh_screen();
    }
}
TEST_CASE_METHOD(TestInterfaceFixture, "set_interface_font_size_integration") {
    layout_cleanup layout_cleanup;
    open_window("Test Window 50", 800, 600);
    window_cleanup cleanup_window;
    process_events();
    while (key_down(key_code::SPACE_KEY) == false) {
        process_events();
        clear_screen();
        draw_text("Test: set_interface_font_size", color_black(), 10.0, 10.0);
        draw_text("Press space to end test", color_black(), 10.0, 30.0);
        set_interface_font_size(12);
        start_panel("Small Font", rectangle_from(10.0, 70.0, 300.0, 100.0));
        label_element("This text uses 12pt font size");
        end_panel("Small Font");
        set_interface_font_size(16);
        start_panel("Medium Font", rectangle_from(10.0, 180.0, 300.0, 100.0));
        label_element("This text uses 16pt font size");
        end_panel("Medium Font");
        set_interface_font_size(24);
        start_panel("Large Font", rectangle_from(10.0, 290.0, 300.0, 100.0));
        label_element("This text uses 24pt font size");
        end_panel("Large Font");
        draw_interface();
        refresh_screen();
    }
    set_interface_font_size(13);
}
TEST_CASE_METHOD(TestInterfaceFixture, "set_interface_label_width_integration") {
    open_window("Test Window 51", 800, 600);
    window_cleanup cleanup_window;
    set_interface_label_width(100);
    REQUIRE(100 == get_interface_label_width());
}
TEST_CASE_METHOD(TestInterfaceFixture, "set_interface_panel_shadows_integration") {
    layout_cleanup layout_cleanup;
    open_window("Test Window 52", 800, 600);
    window_cleanup cleanup_window;
    process_events();
    set_interface_panel_shadows(10, color_blue(), point_at(5.0, 5.0));
    while (key_down(key_code::SPACE_KEY) == false) {
        process_events();
        clear_screen();
        draw_text("Test: set_interface_panel_shadows", color_black(), 10.0, 10.0);
        draw_text("Expected: A panel with blue shadow (10px radius, 5px offset)", color_black(), 10.0, 30.0);
        draw_text("Press space to end test", color_black(), 10.0, 50.0);
        start_panel("Test Panel 39", rectangle_from(10.0, 70.0, 300.0, 200.0));
        button("Test Button");
        end_panel("Test Panel 39");
        draw_interface();
        refresh_screen();
    }
}
TEST_CASE_METHOD(TestInterfaceFixture, "set_interface_root_text_color_integration") {
    layout_cleanup layout_cleanup;
    open_window("Test Window 53", 800, 600);
    window_cleanup cleanup_window;
    process_events();
    set_interface_root_text_color(color_red());
    while (key_down(key_code::SPACE_KEY) == false) {
        process_events();
        clear_screen();
        draw_text("Test: set_interface_root_text_color", color_black(), 10.0, 10.0);
        draw_text("Expected: Text outside panels should be red, text inside panels unchanged", color_black(), 10.0, 30.0);
        draw_text("Press space to end test", color_black(), 10.0, 50.0);
        label_element("This text should be red (outside panel)", rectangle_from(10.0, 90.0, 300.0, 20.0));
        start_panel("Test Panel 40", rectangle_from(10.0, 120.0, 300.0, 200.0));
        label_element("This text should be normal (inside panel)");
        end_panel("Test Panel 40");
        draw_interface();
        refresh_screen();
    }
}
TEST_CASE_METHOD(TestInterfaceFixture, "set_interface_shadows_integration") {
    layout_cleanup layout_cleanup;
    open_window("Test Window 54", 800, 600);
    window_cleanup cleanup_window;
    process_events();
    set_interface_shadows(10, color_blue(), point_at(5.0, 5.0));
    while (key_down(key_code::SPACE_KEY) == false) {
        process_events();
        clear_screen();
        draw_text("Test: set_interface_shadows", color_black(), 10.0, 10.0);
        draw_text("Expected: Panel and button with blue shadows (10px radius, 5px offset)", color_black(), 10.0, 30.0);
        draw_text("Press space to end test", color_black(), 10.0, 50.0);
        start_panel("Test Panel 41", rectangle_from(10.0, 70.0, 300.0, 200.0));
        button("Test Button");
        end_panel("Test Panel 41");
        draw_interface();
        refresh_screen();
    }
}
TEST_CASE_METHOD(TestInterfaceFixture, "set_interface_spacing_integration") {
    layout_cleanup layout_cleanup;
    open_window("Test Window 55", 800, 600);
    window_cleanup cleanup_window;
    set_interface_spacing(10, 5);
    process_events();
    while (key_down(key_code::SPACE_KEY) == false) {
        process_events();
        clear_screen();
        draw_text("Test: set_interface_spacing", color_black(), 10.0, 10.0);
        draw_text("Expected: Panel with buttons spaced 10px apart and 5px padding", color_black(), 10.0, 30.0);
        draw_text("Press space to end test", color_black(), 10.0, 50.0);
        start_panel("Test Panel 42", rectangle_from(10.0, 70.0, 300.0, 200.0));
        button("Button 1");
        button("Button 2");
        end_panel("Test Panel 42");
        draw_interface();
        refresh_screen();
    }
}
TEST_CASE_METHOD(TestInterfaceFixture, "set_interface_style_integration") {
    layout_cleanup layout_cleanup;
    open_window("Test Window 56", 800, 600);
    window_cleanup cleanup_window;
    process_events();
    set_interface_style(interface_style::BUBBLE_MULTICOLORED);
    while (key_down(key_code::SPACE_KEY) == false) {
        process_events();
        clear_screen();
        draw_text("Test: set_interface_style", color_black(), 10.0, 10.0);
        draw_text("Expected: Panel and button with bubble multicolored style theme", color_black(), 10.0, 30.0);
        draw_text("Press space to end test", color_black(), 10.0, 50.0);
        start_panel("Test Panel 43", rectangle_from(10.0, 70.0, 300.0, 200.0));
        button("Test Button");
        end_panel("Test Panel 43");
        draw_interface();
        refresh_screen();
    }
}
TEST_CASE_METHOD(TestInterfaceFixture, "set_interface_style_with_color_integration") {
    layout_cleanup layout_cleanup;
    open_window("Test Window 57", 800, 600);
    window_cleanup cleanup_window;
    process_events();
    set_interface_style(interface_style::SHADED_DARK_STYLE, color_blue());
    while (key_down(key_code::SPACE_KEY) == false) {
        process_events();
        clear_screen();
        draw_text("Test: set_interface_style_with_color", color_black(), 10.0, 10.0);
        draw_text("Expected: Panel and button with shaded dark style theme in blue", color_black(), 10.0, 30.0);
        draw_text("Press space to end test", color_black(), 10.0, 50.0);
        start_panel("Test Panel 44", rectangle_from(10.0, 70.0, 300.0, 200.0));
        button("Test Button");
        end_panel("Test Panel 44");
        draw_interface();
        refresh_screen();
    }
}
TEST_CASE_METHOD(TestInterfaceFixture, "set_interface_text_color_integration") {
    layout_cleanup layout_cleanup;
    open_window("Test Window 58", 800, 600);
    window_cleanup cleanup_window;
    process_events();
    set_interface_text_color(color_red());
    while (key_down(key_code::SPACE_KEY) == false) {
        process_events();
        clear_screen();
        draw_text("Test: set_interface_text_color", color_black(), 10.0, 10.0);
        draw_text("Expected: Panel with red text inside", color_black(), 10.0, 30.0);
        draw_text("Press space to end test", color_black(), 10.0, 50.0);
        start_panel("Test Panel 45", rectangle_from(10.0, 70.0, 300.0, 200.0));
        label_element("This text should be red");
        end_panel("Test Panel 45");
        draw_interface();
        refresh_screen();
    }
}
TEST_CASE_METHOD(TestInterfaceFixture, "set_layout_height_integration") {
    layout_cleanup layout_cleanup;
    open_window("Test Window 59", 800, 600);
    window_cleanup cleanup_window;
    process_events();
    while (key_down(key_code::SPACE_KEY) == false) {
        process_events();
        clear_screen();
        draw_text("Test: set_layout_height", color_black(), 10.0, 10.0);
        draw_text("Expected: Button with 100px height", color_black(), 10.0, 30.0);
        draw_text("Press space to end test", color_black(), 10.0, 50.0);
        start_panel("Test Panel 46", rectangle_from(10.0, 70.0, 300.0, 200.0));
        set_layout_height(100);
        button("Test Button");
        end_panel("Test Panel 46");
        draw_interface();
        refresh_screen();
    }
}
TEST_CASE_METHOD(TestInterfaceFixture, "single_line_layout_integration") {
    open_window("Test Window 60", 800, 600);
    window_cleanup cleanup_window;
    process_events();
    while (key_down(key_code::SPACE_KEY) == false) {
        process_events();
        clear_screen();
        draw_text("Test: single_line_layout", color_black(), 10.0, 10.0);
        draw_text("Expected: Two buttons arranged horizontally in a single line", color_black(), 10.0, 30.0);
        draw_text("Press space to end test", color_black(), 10.0, 50.0);
        start_panel("Test Panel 47", rectangle_from(10.0, 70.0, 300.0, 200.0));
        single_line_layout();
        button("Button 1");
        button("Button 2");
        end_panel("Test Panel 47");
        draw_interface();
        refresh_screen();
    }
}
TEST_CASE_METHOD(TestInterfaceFixture, "slider_at_position_integration") {
    open_window("Test Window 61", 800, 600);
    window_cleanup cleanup_window;
    auto test_rect = rectangle_from(100.0, 100.0, 200.0, 20.0);
    auto initial_value = 50.0f;
    auto slider_result = initial_value;
    process_events();
    while (key_down(key_code::SPACE_KEY) == false) {
        process_events();
        clear_screen();
        draw_text("Test: slider_at_position", color_black(), 10.0, 10.0);
        draw_text("Expected: Slider with initial value 50, range 0-100 at position (100,100)", color_black(), 10.0, 30.0);
        draw_text("Change the value and press space to pass", color_black(), 10.0, 50.0);
        slider_result = slider(slider_result, 0.0f, 100.0f, test_rect);
        draw_interface();
        refresh_screen();
    }
    REQUIRE(initial_value != slider_result);
}
TEST_CASE_METHOD(TestInterfaceFixture, "slider_integration") {
    open_window("Test Window 62", 800, 600);
    window_cleanup cleanup_window;
    auto initial_value = 50.0f;
    auto slider_result = initial_value;
    process_events();
    while (key_down(key_code::SPACE_KEY) == false) {
        process_events();
        clear_screen();
        draw_text("Test: slider", color_black(), 10.0, 10.0);
        draw_text("Expected: Slider with initial value 50, range 0-100 using default layout", color_black(), 10.0, 30.0);
        draw_text("Change the value and press space to pass", color_black(), 10.0, 50.0);
        start_panel("Test Panel 48", rectangle_from(10.0, 70.0, 300.0, 200.0));
        slider_result = slider(slider_result, 0.0f, 100.0f);
        end_panel("Test Panel 48");
        draw_interface();
        refresh_screen();
    }
    REQUIRE(initial_value != slider_result);
}
TEST_CASE_METHOD(TestInterfaceFixture, "slider_labeled_integration") {
    open_window("Test Window 63", 800, 600);
    window_cleanup cleanup_window;
    auto initial_value = 50.0f;
    auto slider_result = initial_value;
    process_events();
    while (key_down(key_code::SPACE_KEY) == false) {
        process_events();
        clear_screen();
        draw_text("Test: slider_labeled", color_black(), 10.0, 10.0);
        draw_text("Expected: Labeled slider with initial value 50, range 0-100 using default layout", color_black(), 10.0, 30.0);
        draw_text("Change the value and press space to pass", color_black(), 10.0, 50.0);
        start_panel("Test Panel 49", rectangle_from(10.0, 70.0, 300.0, 200.0));
        set_interface_label_width(100);
        slider_result = slider("Test Slider", slider_result, 0.0f, 100.0f);
        end_panel("Test Panel 49");
        draw_interface();
        refresh_screen();
    }
    REQUIRE(initial_value != slider_result);
}
TEST_CASE_METHOD(TestInterfaceFixture, "split_into_columns_integration") {
    open_window("Test Window 64", 800, 600);
    window_cleanup cleanup_window;
    process_events();
    while (key_down(key_code::SPACE_KEY) == false) {
        process_events();
        clear_screen();
        draw_text("Test: split_into_columns", color_black(), 10.0, 10.0);
        draw_text("Expected: Three buttons arranged in equal columns", color_black(), 10.0, 30.0);
        draw_text("Press space to end test", color_black(), 10.0, 50.0);
        start_panel("Test Panel 50", rectangle_from(10.0, 70.0, 300.0, 200.0));
        start_custom_layout();
        split_into_columns(3);
        button("Button 1");
        button("Button 2");
        button("Button 3");
        end_panel("Test Panel 50");
        draw_interface();
        refresh_screen();
    }
}
TEST_CASE_METHOD(TestInterfaceFixture, "split_into_columns_with_last_width_integration") {
    open_window("Test Window 65", 800, 600);
    window_cleanup cleanup_window;
    process_events();
    while (key_down(key_code::SPACE_KEY) == false) {
        process_events();
        clear_screen();
        draw_text("Test: split_into_columns_with_last_width", color_black(), 10.0, 10.0);
        draw_text("Expected: Three buttons with last column width 200px", color_black(), 10.0, 30.0);
        draw_text("Press space to end test", color_black(), 10.0, 50.0);
        start_panel("Test Panel 51", rectangle_from(10.0, 70.0, 300.0, 200.0));
        start_custom_layout();
        split_into_columns(3, 200);
        button("Button 1");
        button("Button 2");
        button("Button 3");
        end_panel("Test Panel 51");
        draw_interface();
        refresh_screen();
    }
}
TEST_CASE_METHOD(TestInterfaceFixture, "split_into_columns_relative_with_last_width_integration") {
    open_window("Test Window 66", 800, 600);
    window_cleanup cleanup_window;
    process_events();
    while (key_down(key_code::SPACE_KEY) == false) {
        process_events();
        clear_screen();
        draw_text("Test: split_into_columns_relative_with_last_width", color_black(), 10.0, 10.0);
        draw_text("Expected: Three buttons with last column 50% of panel width", color_black(), 10.0, 30.0);
        draw_text("Press space to end test", color_black(), 10.0, 50.0);
        start_panel("Test Panel 52", rectangle_from(10.0, 70.0, 300.0, 200.0));
        start_custom_layout();
        split_into_columns_relative(3, 0.5);
        button("Button 1");
        button("Button 2");
        button("Button 3");
        reset_layout();
        end_panel("Test Panel 52");
        draw_interface();
        refresh_screen();
    }
}
TEST_CASE_METHOD(TestInterfaceFixture, "start_custom_layout_integration") {
    layout_cleanup layout_cleanup;
    open_window("Test Window 67", 800, 600);
    window_cleanup cleanup_window;
    process_events();
    while (key_down(key_code::SPACE_KEY) == false) {
        process_events();
        clear_screen();
        draw_text("Test: start_custom_layout", color_black(), 10.0, 10.0);
        draw_text("Expected: Button in 200px wide column", color_black(), 10.0, 30.0);
        draw_text("Press space to end test", color_black(), 10.0, 50.0);
        start_panel("Test Panel 53", rectangle_from(10.0, 70.0, 300.0, 200.0));
        start_custom_layout();
        add_column(200);
        button("Test Button");
        end_panel("Test Panel 53");
        draw_interface();
        refresh_screen();
    }
}
TEST_CASE_METHOD(TestInterfaceFixture, "start_inset_at_position_integration") {
    open_window("Test Window 68", 800, 600);
    window_cleanup cleanup_window;
    auto test_rect = rectangle_from(10.0, 70.0, 300.0, 200.0);
    process_events();
    while (key_down(key_code::SPACE_KEY) == false) {
        process_events();
        clear_screen();
        draw_text("Test: start_inset_at_position", color_black(), 10.0, 10.0);
        draw_text("Expected: An inset at position (10,70) containing a button using default layout", color_black(), 10.0, 30.0);
        draw_text("Press space to end test", color_black(), 10.0, 50.0);
        start_inset("test_inset", test_rect);
        button("Test Button");
        end_inset("test_inset");
        draw_interface();
        refresh_screen();
    }
}
TEST_CASE_METHOD(TestInterfaceFixture, "start_inset_integration") {
    open_window("Test Window 69", 800, 600);
    window_cleanup cleanup_window;
    process_events();
    while (key_down(key_code::SPACE_KEY) == false) {
        process_events();
        clear_screen();
        draw_text("Test: start_inset", color_black(), 10.0, 10.0);
        draw_text("Expected: An inset with height 60 pixels containing a button", color_black(), 10.0, 30.0);
        draw_text("Press space to end test", color_black(), 10.0, 50.0);
        start_panel("Test Panel 54", rectangle_from(0.0, 70.0, 800.0, 530.0));
        start_inset("Test Inset", 60);
        button("Test Button");
        end_inset("Test Inset");
        end_panel("Test Panel 54");
        draw_interface();
        refresh_screen();
    }
}
TEST_CASE_METHOD(TestInterfaceFixture, "start_panel_integration") {
    open_window("Test Window 70", 800, 600);
    window_cleanup cleanup_window;
    auto test_rectangle = rectangle_from(10.0, 70.0, 300.0, 200.0);
    process_events();
    while (key_down(key_code::SPACE_KEY) == false) {
        process_events();
        clear_screen();
        draw_text("Test: start_panel", color_black(), 10.0, 10.0);
        draw_text("Expected: Panel with button", color_black(), 10.0, 30.0);
        draw_text("Press space to end test", color_black(), 10.0, 50.0);
        start_panel("Test Panel 55", test_rectangle);
        button("Test Button");
        end_panel("Test Panel 55");
        draw_interface();
        refresh_screen();
    }
}
TEST_CASE_METHOD(TestInterfaceFixture, "start_popup_integration") {
    open_window("Test Window 71", 800, 600);
    window_cleanup cleanup_window;
    process_events();
    while (key_down(key_code::SPACE_KEY) == false) {
        process_events();
        clear_screen();
        draw_text("Test: start_popup", color_black(), 10.0, 10.0);
        draw_text("Expected: Click the button to show a popup with a label", color_black(), 10.0, 30.0);
        draw_text("Press space to end test", color_black(), 10.0, 50.0);
        start_panel("Test Panel 56", rectangle_from(0.0, 70.0, 800.0, 530.0));
        if (button("Open Popup") == true) {
            open_popup("Test Popup");
        }
        if (start_popup("Test Popup") == true) {
            single_line_layout();
            set_interface_label_width(200);
            label_element("Test Label");
            end_popup("Test Popup");
        }
        end_panel("Test Panel 56");
        draw_interface();
        refresh_screen();
    }
}
TEST_CASE_METHOD(TestInterfaceFixture, "start_treenode_integration") {
    open_window("Test Window 72", 800, 600);
    window_cleanup cleanup_window;
    process_events();
    while (key_down(key_code::SPACE_KEY) == false) {
        process_events();
        clear_screen();
        draw_text("Test: start_treenode", color_black(), 10.0, 10.0);
        draw_text("Expected: A panel containing a collapsible tree node with a button", color_black(), 10.0, 30.0);
        draw_text("Press space to end test", color_black(), 10.0, 50.0);
        start_panel("Test Panel 57", rectangle_from(10.0, 70.0, 200.0, 200.0));
        if (start_treenode("Test Node") == true) {
            button("Test Button");
            end_treenode("Test Node");
        }
        end_panel("Test Panel 57");
        draw_interface();
        refresh_screen();
    }
}
TEST_CASE_METHOD(TestInterfaceFixture, "text_box_integration") {
    open_window("Test Window 73", 800, 600);
    window_cleanup cleanup_window;
    auto initial_text = "Initial Text";
    auto text_result = initial_text;
    process_events();
    while (key_down(key_code::SPACE_KEY) == false) {
        process_events();
        clear_screen();
        draw_text("Test: text_box", color_black(), 10.0, 10.0);
        draw_text("Expected: Text box with editable text", color_black(), 10.0, 30.0);
        draw_text("Change the text and press space to pass", color_black(), 10.0, 50.0);
        start_panel("Test Panel 58", rectangle_from(10.0, 70.0, 300.0, 200.0));
        text_result = text_box(text_result);
        end_panel("Test Panel 58");
        draw_interface();
        refresh_screen();
    }
    REQUIRE(initial_text != text_result);
}
TEST_CASE_METHOD(TestInterfaceFixture, "text_box_at_position_integration") {
    open_window("Test Window 74", 800, 600);
    window_cleanup cleanup_window;
    auto test_rect = rectangle_from(10.0, 70.0, 300.0, 30.0);
    auto initial_text = "Initial Text";
    auto text_result = initial_text;
    process_events();
    while (key_down(key_code::SPACE_KEY) == false) {
        process_events();
        clear_screen();
        draw_text("Test: text_box_at_position", color_black(), 10.0, 10.0);
        draw_text("Expected: Text box at position (10,70) with size 300x30", color_black(), 10.0, 30.0);
        draw_text("Change the text and press space to pass", color_black(), 10.0, 50.0);
        text_result = text_box(text_result, test_rect);
        draw_interface();
        refresh_screen();
    }
    REQUIRE(initial_text != text_result);
}
TEST_CASE_METHOD(TestInterfaceFixture, "text_box_labeled_integration") {
    open_window("Test Window 75", 800, 600);
    window_cleanup cleanup_window;
    auto initial_text = "Initial Text";
    auto text_result = initial_text;
    process_events();
    while (key_down(key_code::SPACE_KEY) == false) {
        process_events();
        clear_screen();
        draw_text("Test: text_box_labeled", color_black(), 10.0, 10.0);
        draw_text("Expected: Labeled text box with editable text", color_black(), 10.0, 30.0);
        draw_text("Change the text and press space to pass", color_black(), 10.0, 50.0);
        start_panel("Test Panel 59", rectangle_from(10.0, 70.0, 300.0, 200.0));
        set_interface_label_width(100);
        text_result = text_box("Test Text Box", text_result);
        end_panel("Test Panel 59");
        draw_interface();
        refresh_screen();
    }
    REQUIRE(initial_text != text_result);
}
