#include "splashkit.h"
#include <catch2/catch.hpp>
#include "../helpers.hpp"
class TestInterface {
public:
    TestInterface()
    {
        set_resources_path(string("/mnt/c/Users/Noahc/Documents/aYear_2_semester_2/TeamProject/GitHubRepo/splashkit_test_generator/resources"));
    }
    TEST_CASE("add_column_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        WindowCleanup cleanup_window;
        while (key_typed(KeyCode::SPACE_KEY) == false) {
            process_events();
            clear_screen();
            draw_text(string("Test: add_column"), color_black(), 10.0, 10.0);
            draw_text(string("Expected: Two columns - first 100px wide, second fills remaining space"), color_black(), 10.0, 30.0);
            draw_text(string("Press space to end test"), color_black(), 10.0, 50.0);
            start_panel(string("Test Panel"), rectangle_from(0.0, 70.0, 800.0, 530.0));
            start_custom_layout();
            add_column(100);
            add_column(-1);
            button(string("Left Column"));
            button(string("Right Column"));
            end_panel(string("Test Panel"));
            draw_interface();
            refresh_screen();
        }
    }
    TEST_CASE("add_column_relative_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        WindowCleanup cleanup_window;
        while (key_typed(KeyCode::SPACE_KEY) == false) {
            process_events();
            clear_screen();
            draw_text(string("Test: add_column_relative"), color_black(), 10.0, 10.0);
            draw_text(string("Expected: Two equal-width columns (50% each)"), color_black(), 10.0, 30.0);
            draw_text(string("Press space to end test"), color_black(), 10.0, 50.0);
            start_panel(string("Test Panel"), rectangle_from(0.0, 70.0, 800.0, 530.0));
            start_custom_layout();
            add_column_relative(0.5);
            add_column_relative(0.5);
            button(string("Left Column"));
            button(string("Right Column"));
            end_panel(string("Test Panel"));
            draw_interface();
            refresh_screen();
        }
    }
    TEST_CASE("bitmap_button_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        WindowCleanup cleanup_window;
        auto test_bitmap = create_bitmap(string("test_bitmap"), 100, 100);
        BitmapCleanup cleanup_bitmap;
        clear_bitmap(test_bitmap, color_red());
        auto button_clicked = false;
        while (button_clicked == false) {
            process_events();
            clear_screen();
            draw_text(string("Test: bitmap_button"), color_black(), 10.0, 10.0);
            draw_text(string("Expected: A clickable button with a red bitmap image"), color_black(), 10.0, 30.0);
            draw_text(string("Click the button to end test"), color_black(), 10.0, 50.0);
            start_panel(string("Test Panel"), rectangle_from(0.0, 70.0, 800.0, 530.0));
            set_layout_height(100);
            button_clicked = bitmap_button(test_bitmap);
            end_panel(string("Test Panel"));
            draw_interface();
            refresh_screen();
        }
        REQUIRE(button_clicked);
    }
    TEST_CASE("bitmap_button_at_position_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        WindowCleanup cleanup_window;
        auto test_bitmap = create_bitmap(string("test_bitmap"), 100, 100);
        clear_bitmap(test_bitmap, color_red());
        BitmapCleanup cleanup_bitmap;
        auto test_rectangle = rectangle_from(100.0, 100.0, 100.0, 100.0);
        auto button_clicked = false;
        while (button_clicked == false) {
            process_events();
            clear_screen();
            draw_text(string("Test: bitmap_button_at_position"), color_black(), 10.0, 10.0);
            draw_text(string("Expected: A red bitmap button at position (100,100)"), color_black(), 10.0, 30.0);
            draw_text(string("Click the button to end test"), color_black(), 10.0, 50.0);
            button_clicked = bitmap_button(test_bitmap, test_rectangle);
            draw_interface();
            refresh_screen();
        }
        REQUIRE(button_clicked);
    }
    TEST_CASE("bitmap_button_at_position_with_options_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        WindowCleanup cleanup_window;
        auto test_bitmap = create_bitmap(string("test_bitmap"), 100, 100);
        clear_bitmap(test_bitmap, color_red());
        BitmapCleanup cleanup_bitmap;
        auto test_rectangle = rectangle_from(100.0, 100.0, 100.0, 100.0);
        auto button_clicked = false;
        while (button_clicked == false) {
            process_events();
            clear_screen();
            draw_text(string("Test: bitmap_button_at_position_with_options"), color_black(), 10.0, 10.0);
            draw_text(string("Expected: A red bitmap button at position (100,100) with default options"), color_black(), 10.0, 30.0);
            draw_text(string("Click the button to end test"), color_black(), 10.0, 50.0);
            button_clicked = bitmap_button(test_bitmap, test_rectangle, option_defaults());
            draw_interface();
            refresh_screen();
        }
        REQUIRE(button_clicked);
    }
    TEST_CASE("bitmap_button_with_options_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        WindowCleanup cleanup_window;
        auto test_bitmap = create_bitmap(string("test_bitmap"), 100, 100);
        clear_bitmap(test_bitmap, color_red());
        BitmapCleanup cleanup_bitmap;
        auto test_options1 = option_defaults();
        auto test_options2 = option_scale_bmp(0.5, 0.5, test_options1);
        auto button_clicked = false;
        while (button_clicked == false) {
            process_events();
            clear_screen();
            draw_text(string("Test: bitmap_button_with_options"), color_black(), 10.0, 10.0);
            draw_text(string("Expected: A red bitmap button scaled to 50% size"), color_black(), 10.0, 30.0);
            draw_text(string("Click the button to end test"), color_black(), 10.0, 50.0);
            start_panel(string("Test Panel"), rectangle_from(0.0, 70.0, 800.0, 530.0));
            set_layout_height(50);
            button_clicked = bitmap_button(test_bitmap, test_options2);
            end_panel(string("Test Panel"));
            draw_interface();
            refresh_screen();
        }
        REQUIRE(button_clicked);
    }
    TEST_CASE("bitmap_button_labeled_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        WindowCleanup cleanup_window;
        auto test_bitmap = create_bitmap(string("test_bitmap"), 20, 20);
        clear_bitmap(test_bitmap, color_red());
        BitmapCleanup cleanup_bitmap;
        auto button_clicked = false;
        while (button_clicked == false) {
            process_events();
            clear_screen();
            draw_text(string("Test: bitmap_button_labeled"), color_black(), 10.0, 10.0);
            draw_text(string("Expected: A red bitmap button with label 'Click Me'"), color_black(), 10.0, 30.0);
            draw_text(string("Click the button to end test"), color_black(), 10.0, 50.0);
            start_panel(string("Test Panel"), rectangle_from(0.0, 70.0, 800.0, 530.0));
            button_clicked = bitmap_button(string("Click Me"), test_bitmap);
            end_panel(string("Test Panel"));
            draw_interface();
            refresh_screen();
        }
        REQUIRE(button_clicked);
    }
    TEST_CASE("bitmap_button_labeled_with_options_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        WindowCleanup cleanup_window;
        auto test_bitmap = create_bitmap(string("test_bitmap"), 20, 20);
        clear_bitmap(test_bitmap, color_red());
        BitmapCleanup cleanup_bitmap;
        auto test_options1 = option_defaults();
        auto test_options2 = option_scale_bmp(0.5, 0.5, test_options1);
        auto button_clicked = false;
        while (button_clicked == false) {
            process_events();
            clear_screen();
            draw_text(string("Test: bitmap_button_labeled_with_options"), color_black(), 10.0, 10.0);
            draw_text(string("Expected: A red bitmap button scaled to 50% with label 'Click Me'"), color_black(), 10.0, 30.0);
            draw_text(string("Click the button to end test"), color_black(), 10.0, 50.0);
            start_panel(string("Test Panel"), rectangle_from(0.0, 70.0, 800.0, 530.0));
            button_clicked = bitmap_button(string("Click Me"), test_bitmap, test_options2);
            end_panel(string("Test Panel"));
            draw_interface();
            refresh_screen();
        }
        REQUIRE(button_clicked);
    }
    TEST_CASE("button_at_position_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        WindowCleanup cleanup_window;
        auto test_rectangle = rectangle_from(100.0, 100.0, 200.0, 50.0);
        auto button_clicked = false;
        while (button_clicked == false) {
            process_events();
            clear_screen();
            draw_text(string("Test: button_at_position"), color_black(), 10.0, 10.0);
            draw_text(string("Expected: A button with text 'Click Me' at position (100,100) with size 200x50"), color_black(), 10.0, 30.0);
            draw_text(string("Click the button to end test"), color_black(), 10.0, 50.0);
            button_clicked = button(string("Click Me"), test_rectangle);
            draw_interface();
            refresh_screen();
        }
        REQUIRE(button_clicked);
    }
    TEST_CASE("button_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        WindowCleanup cleanup_window;
        auto button_clicked = false;
        while (button_clicked == false) {
            process_events();
            clear_screen();
            draw_text(string("Test: button"), color_black(), 10.0, 10.0);
            draw_text(string("Expected: A button with text 'Click Me' using default layout"), color_black(), 10.0, 30.0);
            draw_text(string("Click the button to end test"), color_black(), 10.0, 50.0);
            start_panel(string("Test Panel"), rectangle_from(0.0, 70.0, 800.0, 530.0));
            button_clicked = button(string("Click Me"));
            end_panel(string("Test Panel"));
            draw_interface();
            refresh_screen();
        }
        REQUIRE(button_clicked);
    }
    TEST_CASE("button_labeled_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        WindowCleanup cleanup_window;
        auto button_clicked = false;
        while (button_clicked == false) {
            process_events();
            clear_screen();
            draw_text(string("Test: button_labeled"), color_black(), 10.0, 10.0);
            draw_text(string("Expected: A button with text 'Click Me' and label 'Label:' in a two-column layout"), color_black(), 10.0, 30.0);
            draw_text(string("Click the button to end test"), color_black(), 10.0, 50.0);
            start_panel(string("Test Panel"), rectangle_from(0.0, 70.0, 800.0, 530.0));
            button_clicked = button(string("Label:"), string("Click Me"));
            end_panel(string("Test Panel"));
            draw_interface();
            refresh_screen();
        }
        REQUIRE(button_clicked);
    }
    TEST_CASE("checkbox_at_position_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        WindowCleanup cleanup_window;
        auto test_rect = rectangle_from(100.0, 100.0, 200.0, 50.0);
        auto initial_checkbox_result = false;
        auto current_checkbox_result = initial_checkbox_result;
        while (current_checkbox_result == false) {
            process_events();
            clear_screen();
            draw_text(string("Test: checkbox_at_position"), color_black(), 10.0, 10.0);
            draw_text(string("Expected: A checkbox with text 'Test Checkbox' at position (100,100) with size 200x50"), color_black(), 10.0, 30.0);
            draw_text(string("Click the checkbox to end test"), color_black(), 10.0, 50.0);
            current_checkbox_result = checkbox(string("Test Checkbox"), current_checkbox_result, test_rect);
            draw_interface();
            refresh_screen();
        }
        REQUIRE(current_checkbox_result);
    }
    TEST_CASE("checkbox_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        WindowCleanup cleanup_window;
        auto initial_checkbox_result = false;
        auto current_checkbox_result = initial_checkbox_result;
        while (current_checkbox_result == false) {
            process_events();
            clear_screen();
            draw_text(string("Test: checkbox"), color_black(), 10.0, 10.0);
            draw_text(string("Expected: A checkbox with text 'Test Checkbox' using default layout"), color_black(), 10.0, 30.0);
            draw_text(string("Click the checkbox to end test"), color_black(), 10.0, 50.0);
            start_panel(string("Test Panel"), rectangle_from(0.0, 70.0, 800.0, 530.0));
            current_checkbox_result = checkbox(string("Test Checkbox"), current_checkbox_result);
            end_panel(string("Test Panel"));
            draw_interface();
            refresh_screen();
        }
        REQUIRE(current_checkbox_result);
    }
    TEST_CASE("checkbox_labeled_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        WindowCleanup cleanup_window;
        auto initial_checkbox_result = false;
        auto current_checkbox_result = initial_checkbox_result;
        while (current_checkbox_result == false) {
            process_events();
            clear_screen();
            draw_text(string("Test: checkbox_labeled"), color_black(), 10.0, 10.0);
            draw_text(string("Expected: A checkbox with text 'Check me' and label 'Test Checkbox' in a two-column layout"), color_black(), 10.0, 30.0);
            draw_text(string("Click the checkbox to end test"), color_black(), 10.0, 50.0);
            start_panel(string("Test Panel"), rectangle_from(0.0, 70.0, 800.0, 530.0));
            set_interface_label_width(110);
            current_checkbox_result = checkbox(string("Test Checkbox"), string("Check me"), current_checkbox_result);
            end_panel(string("Test Panel"));
            draw_interface();
            refresh_screen();
        }
        REQUIRE(current_checkbox_result);
    }
    TEST_CASE("color_slider_at_position_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        WindowCleanup cleanup_window;
        auto initial_color = color_black();
        auto current_color = initial_color;
        while (key_typed(KeyCode::SPACE_KEY) == false) {
            process_events();
            clear_screen();
            draw_text(string("Test: color_slider_at_position"), color_black(), 10.0, 10.0);
            draw_text(string("Expected: A color slider using RGBA controls at position (100,100) with size 400x24"), color_black(), 10.0, 30.0);
            draw_text(string("Change the color and press space to pass"), color_black(), 10.0, 50.0);
            current_color = color_slider(current_color, rectangle_from(100.0, 100.0, 400.0, 24.0));
            draw_interface();
            refresh_screen();
        }
        REQUIRE(current_color != initial_color);
    }
    TEST_CASE("color_slider_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        WindowCleanup cleanup_window;
        auto initial_color = color_black();
        auto current_color = initial_color;
        while (key_typed(KeyCode::SPACE_KEY) == false) {
            process_events();
            clear_screen();
            draw_text(string("Test: color_slider"), color_black(), 10.0, 10.0);
            draw_text(string("Expected: A color slider with RGBA controls using default layout"), color_black(), 10.0, 30.0);
            draw_text(string("Change the color and press space to pass"), color_black(), 10.0, 50.0);
            start_panel(string("Test Panel"), rectangle_from(0.0, 70.0, 800.0, 530.0));
            current_color = color_slider(current_color);
            end_panel(string("Test Panel"));
            draw_interface();
            refresh_screen();
        }
        REQUIRE_FALSE(quit_requested());
    }
    TEST_CASE("color_slider_labeled_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        WindowCleanup cleanup_window;
        auto initial_color = color_black();
        auto current_color = initial_color;
        while (key_typed(KeyCode::SPACE_KEY) == false) {
            process_events();
            clear_screen();
            draw_text(string("Test: color_slider_labeled"), color_black(), 10.0, 10.0);
            draw_text(string("Expected: A color slider with label 'Test Color Slider' in a two-column layout"), color_black(), 10.0, 30.0);
            draw_text(string("Change the color and press space to pass"), color_black(), 10.0, 50.0);
            set_interface_label_width(120);
            start_panel(string("Test Panel"), rectangle_from(0.0, 70.0, 800.0, 530.0));
            current_color = color_slider(string("Test Color Slider"), current_color);
            end_panel(string("Test Panel"));
            draw_interface();
            refresh_screen();
        }
        REQUIRE(initial_color != current_color);
    }
    TEST_CASE("disable_interface_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        WindowCleanup cleanup_window;
        auto button_clicked = false;
        REQUIRE(interface_enabled());
        disable_interface();
        while (key_typed(KeyCode::SPACE_KEY) == false) {
            process_events();
            clear_screen();
            draw_text(string("Test: disable_interface"), color_black(), 10.0, 10.0);
            draw_text(string("Expected: A button that is disabled"), color_black(), 10.0, 30.0);
            draw_text(string("Click the button and press space to verify that the button is disabled"), color_black(), 10.0, 50.0);
            start_panel(string("Test Panel"), rectangle_from(0.0, 70.0, 800.0, 530.0));
            button_clicked = button(string("Try to click me"));
            end_panel(string("Test Panel"));
            draw_interface();
            refresh_screen();
        }
        REQUIRE_FALSE(interface_enabled());
        REQUIRE_FALSE(button_clicked);
    }
    TEST_CASE("draw_interface_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        WindowCleanup cleanup_window;
        while (key_typed(KeyCode::SPACE_KEY) == false) {
            process_events();
            clear_screen();
            draw_text(string("Test: draw_interface"), color_black(), 10.0, 10.0);
            draw_text(string("Expected: A panel at position (100,100) with size 200x200"), color_black(), 10.0, 30.0);
            draw_text(string("Press space to end test"), color_black(), 10.0, 50.0);
            start_panel(string("Test Panel"), rectangle_from(100.0, 100.0, 200.0, 200.0));
            button(string("Test Button"));
            end_panel(string("Test Panel"));
            draw_interface();
            refresh_screen();
        }
    }
    TEST_CASE("enable_interface_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        WindowCleanup cleanup_window;
        disable_interface();
        while (key_typed(KeyCode::SPACE_KEY) == false) {
            process_events();
            clear_screen();
            draw_text(string("Test: enable_interface"), color_black(), 10.0, 10.0);
            draw_text(string("Expected: Button should be disabled"), color_black(), 10.0, 30.0);
            draw_text(string("Press space to continue"), color_black(), 10.0, 50.0);
            start_panel(string("Test Panel"), rectangle_from(0.0, 70.0, 800.0, 530.0));
            button(string("Test Button"));
            end_panel(string("Test Panel"));
            draw_interface();
            refresh_screen();
        }
        REQUIRE_FALSE(interface_enabled());
        enable_interface();
        auto button_clicked = false;
        while (button_clicked == false) {
            process_events();
            clear_screen();
            draw_text(string("Test: enable_interface"), color_black(), 10.0, 10.0);
            draw_text(string("Expected: Button should be enabled"), color_black(), 10.0, 30.0);
            draw_text(string("Click the button to end test"), color_black(), 10.0, 50.0);
            start_panel(string("Test Panel"), rectangle_from(0.0, 70.0, 800.0, 530.0));
            button_clicked = button(string("Test Button"));
            end_panel(string("Test Panel"));
            draw_interface();
            refresh_screen();
        }
        REQUIRE(interface_enabled());
        REQUIRE(button_clicked);
    }
    TEST_CASE("end_inset_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        WindowCleanup cleanup_window;
        while (key_typed(KeyCode::SPACE_KEY) == false) {
            process_events();
            clear_screen();
            draw_text(string("Test: end_inset"), color_black(), 10.0, 10.0);
            draw_text(string("Expected: An inset with height 60 pixels containing a button"), color_black(), 10.0, 30.0);
            draw_text(string("Press space to end test"), color_black(), 10.0, 50.0);
            start_panel(string("Test Panel"), rectangle_from(0.0, 70.0, 800.0, 530.0));
            start_inset(string("Test Inset"), 60);
            button(string("Test Button"));
            end_inset(string("Test Inset"));
            end_panel(string("Test Panel"));
            draw_interface();
            refresh_screen();
        }
    }
    TEST_CASE("end_panel_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        WindowCleanup cleanup_window;
        while (key_typed(KeyCode::SPACE_KEY) == false) {
            process_events();
            clear_screen();
            draw_text(string("Test: end_panel"), color_black(), 10.0, 10.0);
            draw_text(string("Expected: A panel at position (100,100) with size 200x200 containing a button"), color_black(), 10.0, 30.0);
            draw_text(string("Press space to end test"), color_black(), 10.0, 50.0);
            start_panel(string("Test Panel"), rectangle_from(100.0, 100.0, 200.0, 200.0));
            button(string("Test Button"));
            end_panel(string("Test Panel"));
            draw_interface();
            refresh_screen();
        }
    }
    TEST_CASE("end_popup_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        WindowCleanup cleanup_window;
        while (key_typed(KeyCode::SPACE_KEY) == false) {
            process_events();
            clear_screen();
            draw_text(string("Test: end_popup"), color_black(), 10.0, 10.0);
            draw_text(string("Expected: Click the button to show a popup with a label"), color_black(), 10.0, 30.0);
            draw_text(string("Press space to end test"), color_black(), 10.0, 50.0);
            start_panel(string("Test Panel"), rectangle_from(0.0, 70.0, 800.0, 530.0));
            if (button(string("Open Popup")) == true) {
                open_popup(string("Test Popup"));
            }
            if (start_popup(string("Test Popup")) == true) {
                single_line_layout();
                set_interface_label_width(200);
                label_element(string("Test Label"));
                end_popup(string("Test Popup"));
            }
            end_panel(string("Test Panel"));
            draw_interface();
            refresh_screen();
        }
    }
    TEST_CASE("end_treenode_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        WindowCleanup cleanup_window;
        while (key_typed(KeyCode::SPACE_KEY) == false) {
            process_events();
            clear_screen();
            draw_text(string("Test: end_treenode"), color_black(), 10.0, 10.0);
            draw_text(string("Expected: A panel containing a collapsible tree node with a button"), color_black(), 10.0, 30.0);
            draw_text(string("Press space to end test"), color_black(), 10.0, 50.0);
            start_panel(string("Test Panel"), rectangle_from(10.0, 70.0, 200.0, 200.0));
            if (start_treenode(string("Test Node")) == true) {
                button(string("Test Button"));
                end_treenode(string("Test Node"));
            }
            end_panel(string("Test Panel"));
            draw_interface();
            refresh_screen();
        }
    }
    TEST_CASE("enter_column_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        WindowCleanup cleanup_window;
        while (key_typed(KeyCode::SPACE_KEY) == false) {
            process_events();
            clear_screen();
            draw_text(string("Test: enter_column"), color_black(), 10.0, 10.0);
            draw_text(string("Expected: A panel with a 100-pixel wide column containing a button"), color_black(), 10.0, 30.0);
            draw_text(string("Press space to end test"), color_black(), 10.0, 50.0);
            start_panel(string("Test Panel"), rectangle_from(10.0, 70.0, 300.0, 200.0));
            add_column(100);
            enter_column();
            button(string("Click to end test"));
            leave_column();
            end_panel(string("Test Panel"));
            draw_interface();
            refresh_screen();
        }
    }
    TEST_CASE("get_interface_label_width_integration") {
        auto test_label_width = get_interface_label_width();
        REQUIRE(60 == test_label_width);
    }
    TEST_CASE("header_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        WindowCleanup cleanup_window;
        while (key_typed(KeyCode::SPACE_KEY) == false) {
            process_events();
            clear_screen();
            draw_text(string("Test: header"), color_black(), 10.0, 10.0);
            draw_text(string("Expected: A collapsible header labeled 'Test Header' with a button"), color_black(), 10.0, 30.0);
            draw_text(string("Press space to end test"), color_black(), 10.0, 50.0);
            start_panel(string("Test Panel"), rectangle_from(10.0, 70.0, 300.0, 200.0));
            if (header(string("Test Header")) == true) {
                button(string("Test Button"));
            }
            end_panel(string("Test Panel"));
            draw_interface();
            refresh_screen();
        }
    }
    TEST_CASE("hsb_color_slider_at_position_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        WindowCleanup cleanup_window;
        auto initial_color = color_black();
        auto test_rect = rectangle_from(100.0, 100.0, 400.0, 24.0);
        auto current_color = initial_color;
        while (key_typed(KeyCode::SPACE_KEY) == false) {
            process_events();
            clear_screen();
            draw_text(string("Test: hsb_color_slider_at_position"), color_black(), 10.0, 10.0);
            draw_text(string("Expected: A HSB color slider at position (100,100) with size 400x24"), color_black(), 10.0, 30.0);
            draw_text(string("Change the color and press space to pass"), color_black(), 10.0, 50.0);
            current_color = hsb_color_slider(current_color, test_rect);
            draw_interface();
            refresh_screen();
        }
        REQUIRE(current_color != initial_color);
    }
    TEST_CASE("hsb_color_slider_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        WindowCleanup cleanup_window;
        auto initial_color = color_black();
        auto current_color = initial_color;
        while (key_typed(KeyCode::SPACE_KEY) == false) {
            process_events();
            clear_screen();
            draw_text(string("Test: hsb_color_slider"), color_black(), 10.0, 10.0);
            draw_text(string("Expected: A HSB color slider using default layout"), color_black(), 10.0, 30.0);
            draw_text(string("Change the color and press space to pass"), color_black(), 10.0, 50.0);
            start_panel(string("Test Panel"), rectangle_from(0.0, 70.0, 800.0, 530.0));
            current_color = hsb_color_slider(current_color);
            end_panel(string("Test Panel"));
            draw_interface();
            refresh_screen();
        }
        REQUIRE(current_color != initial_color);
    }
    TEST_CASE("hsb_color_slider_labeled_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        WindowCleanup cleanup_window;
        auto initial_color = color_black();
        auto current_color = initial_color;
        while (key_typed(KeyCode::SPACE_KEY) == false) {
            process_events();
            clear_screen();
            draw_text(string("Test: hsb_color_slider_labeled"), color_black(), 10.0, 10.0);
            draw_text(string("Expected: A HSB color slider with label 'Color Slider' in a two-column layout"), color_black(), 10.0, 30.0);
            draw_text(string("Change the color and press space to pass"), color_black(), 10.0, 50.0);
            start_panel(string("Test Panel"), rectangle_from(0.0, 70.0, 800.0, 530.0));
            set_interface_label_width(100);
            current_color = hsb_color_slider(string("Color Slider"), current_color);
            end_panel(string("Test Panel"));
            draw_interface();
            refresh_screen();
        }
        REQUIRE(current_color != initial_color);
    }
    TEST_CASE("interface_enabled_integration") {
        open_window(string("Test Window"), 800, 600);
        WindowCleanup cleanup_window;
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
        WindowCleanup cleanup_window;
        auto panel_rectangle = rectangle_from(0.0, 70.0, 800.0, 530.0);
        while (key_typed(KeyCode::SPACE_KEY) == false) {
            process_events();
            clear_screen();
            draw_text(string("Test: interface_style_panel"), color_black(), 10.0, 10.0);
            draw_text(string("Expected: A panel with controls to adjust the interface style"), color_black(), 10.0, 30.0);
            draw_text(string("Adjust the style and press space to end test"), color_black(), 10.0, 50.0);
            interface_style_panel(panel_rectangle);
            draw_interface();
            refresh_screen();
        }
    }
    TEST_CASE("label_element_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        WindowCleanup cleanup_window;
        while (key_typed(KeyCode::SPACE_KEY) == false) {
            process_events();
            clear_screen();
            draw_text(string("Test: label_element"), color_black(), 10.0, 10.0);
            draw_text(string("Expected: A label with text 'Test Label' using default layout"), color_black(), 10.0, 30.0);
            draw_text(string("Press space to end test"), color_black(), 10.0, 50.0);
            start_panel(string("Test Panel"), rectangle_from(0.0, 70.0, 800.0, 530.0));
            label_element(string("Test Label"));
            end_panel(string("Test Panel"));
            draw_interface();
            refresh_screen();
        }
    }
    TEST_CASE("label_element_at_position_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        WindowCleanup cleanup_window;
        auto test_rectangle = rectangle_from(100.0, 100.0, 200.0, 50.0);
        while (key_typed(KeyCode::SPACE_KEY) == false) {
            process_events();
            clear_screen();
            draw_text(string("Test: label_element_at_position"), color_black(), 10.0, 10.0);
            draw_text(string("Expected: A label with text 'Test Label' at position (100,100)"), color_black(), 10.0, 30.0);
            draw_text(string("Press space to end test"), color_black(), 10.0, 50.0);
            label_element(string("Test Label"), test_rectangle);
            draw_interface();
            refresh_screen();
        }
    }
    TEST_CASE("last_element_changed_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        WindowCleanup cleanup_window;
        auto initial_value = 0.0f;
        auto current_value = 0.0f;
        auto element_changed = false;
        while (key_typed(KeyCode::SPACE_KEY) == false) {
            process_events();
            clear_screen();
            draw_text(string("Test: last_element_changed"), color_black(), 10.0, 10.0);
            draw_text(string("Expected: A slider that detects value changes"), color_black(), 10.0, 30.0);
            draw_text(string("Move the slider and press space to pass"), color_black(), 10.0, 50.0);
            start_panel(string("Test Panel"), rectangle_from(0.0, 70.0, 800.0, 530.0));
            current_value = slider(string("Test Slider"), current_value, 0.0f, 100.0f);
            if (last_element_changed() == true) {
                element_changed = true;
            }
            end_panel(string("Test Panel"));
            draw_interface();
            refresh_screen();
        }
        REQUIRE(current_value != initial_value);
        REQUIRE(element_changed);
    }
    TEST_CASE("last_element_confirmed_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        WindowCleanup cleanup_window;
        auto button_clicked = false;
        while (key_typed(KeyCode::SPACE_KEY) == false) {
            process_events();
            clear_screen();
            draw_text(string("Test: last_element_confirmed"), color_black(), 10.0, 10.0);
            draw_text(string("Expected: A button that detects when clicked"), color_black(), 10.0, 30.0);
            draw_text(string("Click the button and press space to pass"), color_black(), 10.0, 50.0);
            start_panel(string("Test Panel"), rectangle_from(0.0, 70.0, 800.0, 530.0));
            button(string("Test Button"));
            if (last_element_confirmed() == true) {
                button_clicked = true;
            }
            end_panel(string("Test Panel"));
            draw_interface();
            refresh_screen();
        }
        REQUIRE(button_clicked);
    }
    TEST_CASE("leave_column_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        WindowCleanup cleanup_window;
        while (key_typed(KeyCode::SPACE_KEY) == false) {
            process_events();
            clear_screen();
            draw_text(string("Test: leave_column"), color_black(), 10.0, 10.0);
            draw_text(string("Expected: A button that appears after leaving a column with a width of 100"), color_black(), 10.0, 30.0);
            draw_text(string("Press space to end test"), color_black(), 10.0, 50.0);
            start_panel(string("Test Panel"), rectangle_from(10.0, 70.0, 300.0, 200.0));
            start_custom_layout();
            add_column(100);
            add_column(-1);
            enter_column();
            leave_column();
            button(string("Test Button"));
            end_panel(string("Test Panel"));
            draw_interface();
            refresh_screen();
        }
    }
    TEST_CASE("number_box_at_position_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        WindowCleanup cleanup_window;
        auto test_rect = rectangle_from(100.0, 100.0, 200.0, 30.0);
        auto test_result = 5.0f;
        while (key_typed(KeyCode::SPACE_KEY) == false) {
            process_events();
            clear_screen();
            draw_text(string("Test: number_box_at_position"), color_black(), 10.0, 10.0);
            draw_text(string("Expected: A number box at position (100,100) with size 200x30"), color_black(), 10.0, 30.0);
            draw_text(string("Change the number and press space to pass"), color_black(), 10.0, 50.0);
            test_result = number_box(test_result, 1.0f, test_rect);
            draw_interface();
            refresh_screen();
        }
        REQUIRE(5.0f != test_result);
    }
    TEST_CASE("number_box_integration") {
        auto test_window = open_window(string("Number Box Test"), 800, 600);
        WindowCleanup cleanup_window;
        auto test_result = 5.0f;
        while (key_typed(KeyCode::SPACE_KEY) == false) {
            process_events();
            clear_screen();
            draw_text(string("Test: number_box"), color_black(), 10.0, 10.0);
            draw_text(string("Expected: A number box with step size 1.0 using the default layout"), color_black(), 10.0, 30.0);
            draw_text(string("Change the number and press space to pass"), color_black(), 10.0, 50.0);
            start_panel(string("Test Panel"), rectangle_from(10.0, 70.0, 300.0, 200.0));
            test_result = number_box(test_result, 1.0f);
            end_panel(string("Test Panel"));
            draw_interface();
            refresh_screen();
        }
        REQUIRE(5.0f != test_result);
    }
    TEST_CASE("number_box_labeled_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        WindowCleanup cleanup_window;
        auto test_result = 5.0f;
        while (key_typed(KeyCode::SPACE_KEY) == false) {
            process_events();
            clear_screen();
            draw_text(string("Test: number_box_labeled"), color_black(), 10.0, 10.0);
            draw_text(string("Expected: A labeled number box with step size 1.0 using the default layout"), color_black(), 10.0, 30.0);
            draw_text(string("Change the number and press space to pass"), color_black(), 10.0, 50.0);
            start_panel(string("Test Panel"), rectangle_from(10.0, 70.0, 300.0, 200.0));
            set_interface_label_width(100);
            test_result = number_box(string("Test Value"), test_result, 1.0f);
            end_panel(string("Test Panel"));
            draw_interface();
            refresh_screen();
        }
        REQUIRE(5.0f != test_result);
    }
    TEST_CASE("open_popup_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        WindowCleanup cleanup_window;
        while (key_typed(KeyCode::SPACE_KEY) == false) {
            process_events();
            clear_screen();
            draw_text(string("Test: open_popup"), color_black(), 10.0, 10.0);
            draw_text(string("Expected: Click the button to show a popup with a label"), color_black(), 10.0, 30.0);
            draw_text(string("Press space to end test"), color_black(), 10.0, 50.0);
            start_panel(string("Test Panel"), rectangle_from(0.0, 70.0, 800.0, 530.0));
            if (button(string("Open Popup")) == true) {
                open_popup(string("Test Popup"));
            }
            if (start_popup(string("Test Popup")) == true) {
                single_line_layout();
                set_interface_label_width(200);
                label_element(string("Test Label"));
                end_popup(string("Test Popup"));
            }
            end_panel(string("Test Panel"));
            draw_interface();
            refresh_screen();
        }
    }
    TEST_CASE("paragraph_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        WindowCleanup cleanup_window;
        set_interface_font(load_font(string("hara"), string("hara.ttf")));
        FontCleanup cleanup_font;
        set_interface_font_size(12);
        while (key_typed(KeyCode::SPACE_KEY) == false) {
            process_events();
            clear_screen();
            draw_text(string("Test: paragraph"), color_black(), 10.0, 10.0);
            draw_text(string("Expected: A paragraph of text that wraps correctly within the panel"), color_black(), 10.0, 30.0);
            draw_text(string("Press space to end test"), color_black(), 10.0, 50.0);
            start_panel(string("Test Panel"), rectangle_from(10.0, 70.0, 300.0, 200.0));
            paragraph(string("This is a test paragraph to check if the text wraps correctly. weguy YGWE FYw eiuofhWEOF wue fuhwbeuf WUEFU wue"));
            end_panel(string("Test Panel"));
            draw_interface();
            refresh_screen();
        }
    }
    TEST_CASE("paragraph_at_position_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        WindowCleanup cleanup_window;
        auto test_rectangle = rectangle_from(100.0, 100.0, 200.0, 100.0);
        while (key_typed(KeyCode::SPACE_KEY) == false) {
            process_events();
            clear_screen();
            draw_text(string("Test: paragraph_at_position"), color_black(), 10.0, 10.0);
            draw_text(string("Expected: A paragraph at position (100,100) with size 200x100"), color_black(), 10.0, 30.0);
            draw_text(string("Press space to end test"), color_black(), 10.0, 50.0);
            paragraph(string("This is a test paragraph to check if the text wraps correctly. weguy YGWE FYw eiuofhWEOF wue fuhwbeuf WUEFU wue"), test_rectangle);
            draw_interface();
            refresh_screen();
        }
    }
    TEST_CASE("reset_layout_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        WindowCleanup cleanup_window;
        while (key_typed(KeyCode::SPACE_KEY) == false) {
            process_events();
            clear_screen();
            draw_text(string("Test: reset_layout"), color_black(), 10.0, 10.0);
            draw_text(string("Expected: The second button should not be confined to the created columns after reset"), color_black(), 10.0, 30.0);
            draw_text(string("Press space to end test"), color_black(), 10.0, 50.0);
            start_panel(string("Test Panel"), rectangle_from(10.0, 70.0, 300.0, 200.0));
            start_custom_layout();
            add_column(200);
            add_column(-1);
            button(string("Button 1"));
            reset_layout();
            button(string("Button 2"));
            end_panel(string("Test Panel"));
            draw_interface();
            refresh_screen();
        }
    }
    TEST_CASE("set_interface_accent_color_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        WindowCleanup cleanup_window;
        set_interface_accent_color(color_red(), 0.5f);
        while (key_typed(KeyCode::SPACE_KEY) == false) {
            process_events();
            clear_screen();
            draw_text(string("Test: set_interface_accent_color"), color_black(), 10.0, 10.0);
            draw_text(string("Expected: A button with red accent color at 50% contrast"), color_black(), 10.0, 30.0);
            draw_text(string("Press space to end test"), color_black(), 10.0, 50.0);
            start_panel(string("Test Panel"), rectangle_from(10.0, 70.0, 300.0, 200.0));
            button(string("Test Button"));
            end_panel(string("Test Panel"));
            draw_interface();
            refresh_screen();
        }
    }
    TEST_CASE("set_interface_border_color_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        WindowCleanup cleanup_window;
        set_interface_border_color(color_red());
        while (key_typed(KeyCode::SPACE_KEY) == false) {
            process_events();
            clear_screen();
            draw_text(string("Test: set_interface_border_color"), color_black(), 10.0, 10.0);
            draw_text(string("Expected: A panel and button with red borders"), color_black(), 10.0, 30.0);
            draw_text(string("Press space to end test"), color_black(), 10.0, 50.0);
            start_panel(string("Test Panel"), rectangle_from(10.0, 70.0, 300.0, 200.0));
            button(string("Test Button"));
            end_panel(string("Test Panel"));
            draw_interface();
            refresh_screen();
        }
    }
    TEST_CASE("set_interface_colors_auto_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        WindowCleanup cleanup_window;
        set_interface_colors_auto(color_white(), color_blue(), 0.5f, 0.7f, 0.3f);
        while (key_typed(KeyCode::SPACE_KEY) == false) {
            process_events();
            clear_screen();
            draw_text(string("Test: set_interface_colors_auto"), color_black(), 10.0, 10.0);
            draw_text(string("Expected: A panel with white main color and blue accent color"), color_black(), 10.0, 30.0);
            draw_text(string("Press space to end test"), color_black(), 10.0, 70.0);
            start_panel(string("Test Panel"), rectangle_from(10.0, 90.0, 300.0, 200.0));
            button(string("Test Button"));
            end_panel(string("Test Panel"));
            draw_interface();
            refresh_screen();
        }
    }
    TEST_CASE("set_interface_element_color_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        WindowCleanup cleanup_window;
        set_interface_element_color(color_black(), 0.5f);
        while (key_typed(KeyCode::SPACE_KEY) == false) {
            process_events();
            clear_screen();
            draw_text(string("Test: set_interface_element_color"), color_black(), 10.0, 10.0);
            draw_text(string("Expected: A panel with black element color at 50% contrast"), color_black(), 10.0, 30.0);
            draw_text(string("Press space to end test"), color_black(), 10.0, 50.0);
            start_panel(string("Test Panel"), rectangle_from(10.0, 70.0, 300.0, 200.0));
            button(string("Test Button"));
            end_panel(string("Test Panel"));
            draw_interface();
            refresh_screen();
        }
    }
    TEST_CASE("set_interface_element_shadows_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        WindowCleanup cleanup_window;
        set_interface_element_shadows(10, color_blue(), point_at(5.0, 5.0));
        while (key_typed(KeyCode::SPACE_KEY) == false) {
            process_events();
            clear_screen();
            draw_text(string("Test: set_interface_element_shadows"), color_black(), 10.0, 10.0);
            draw_text(string("Expected: Elements with blue shadow (radius: 10, offset: 5,5)"), color_black(), 10.0, 30.0);
            draw_text(string("Press space to end test"), color_black(), 10.0, 50.0);
            start_panel(string("Test Panel"), rectangle_from(10.0, 70.0, 300.0, 200.0));
            button(string("Test Button"));
            end_panel(string("Test Panel"));
            draw_interface();
            refresh_screen();
        }
    }
    TEST_CASE("set_interface_font_font_as_string_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        WindowCleanup cleanup_window;
        load_font(string("hara"), string("hara.ttf"));
        FontCleanup cleanup_font;
        load_font(string("demolition"), string("demolition.ttf"));
        while (key_typed(KeyCode::SPACE_KEY) == false) {
            process_events();
            clear_screen();
            draw_text(string("Test: set_interface_font_font_as_string"), color_black(), 10.0, 10.0);
            draw_text(string("Press space to end test"), color_black(), 10.0, 30.0);
            start_panel(string("Hara Font"), rectangle_from(10.0, 70.0, 300.0, 100.0));
            set_interface_font(string("hara"));
            label_element(string("This text uses Hara font"));
            end_panel(string("Hara Font"));
            start_panel(string("Demolition Font"), rectangle_from(10.0, 180.0, 300.0, 100.0));
            set_interface_font(string("demolition"));
            label_element(string("This text uses Demolition font"));
            end_panel(string("Demolition Font"));
            draw_interface();
            refresh_screen();
        }
    }
    TEST_CASE("set_interface_font_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        WindowCleanup cleanup_window;
        auto hara_font = load_font(string("hara"), string("hara.ttf"));
        FontCleanup cleanup_font;
        auto demolition_font = load_font(string("demolition"), string("demolition.ttf"));
        while (key_typed(KeyCode::SPACE_KEY) == false) {
            process_events();
            clear_screen();
            draw_text(string("Test: set_interface_font"), color_black(), 10.0, 10.0);
            draw_text(string("Press space to end test"), color_black(), 10.0, 30.0);
            start_panel(string("Hara Font"), rectangle_from(10.0, 70.0, 300.0, 100.0));
            set_interface_font(hara_font);
            label_element(string("This text uses Hara font"));
            end_panel(string("Hara Font"));
            start_panel(string("Demolition Font"), rectangle_from(10.0, 180.0, 300.0, 100.0));
            set_interface_font(demolition_font);
            label_element(string("This text uses Demolition font"));
            end_panel(string("Demolition Font"));
            draw_interface();
            refresh_screen();
        }
    }
    TEST_CASE("set_interface_font_size_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        WindowCleanup cleanup_window;
        while (key_typed(KeyCode::SPACE_KEY) == false) {
            process_events();
            clear_screen();
            draw_text(string("Test: set_interface_font_size"), color_black(), 10.0, 10.0);
            draw_text(string("Press space to end test"), color_black(), 10.0, 30.0);
            set_interface_font_size(12);
            start_panel(string("Small Font"), rectangle_from(10.0, 70.0, 300.0, 100.0));
            label_element(string("This text uses 12pt font size"));
            end_panel(string("Small Font"));
            set_interface_font_size(16);
            start_panel(string("Medium Font"), rectangle_from(10.0, 180.0, 300.0, 100.0));
            label_element(string("This text uses 16pt font size"));
            end_panel(string("Medium Font"));
            set_interface_font_size(24);
            start_panel(string("Large Font"), rectangle_from(10.0, 290.0, 300.0, 100.0));
            label_element(string("This text uses 24pt font size"));
            end_panel(string("Large Font"));
            draw_interface();
            refresh_screen();
        }
    }
    TEST_CASE("set_interface_label_width_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        WindowCleanup cleanup_window;
        set_interface_label_width(100);
        REQUIRE(100 == get_interface_label_width());
    }
    TEST_CASE("set_interface_panel_shadows_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        WindowCleanup cleanup_window;
        set_interface_panel_shadows(10, color_blue(), point_at(5.0, 5.0));
        while (key_typed(KeyCode::SPACE_KEY) == false) {
            process_events();
            clear_screen();
            draw_text(string("Test: set_interface_panel_shadows"), color_black(), 10.0, 10.0);
            draw_text(string("Expected: A panel with blue shadow (10px radius, 5px offset)"), color_black(), 10.0, 30.0);
            draw_text(string("Press space to end test"), color_black(), 10.0, 50.0);
            start_panel(string("Test Panel"), rectangle_from(10.0, 70.0, 300.0, 200.0));
            button(string("Test Button"));
            end_panel(string("Test Panel"));
            draw_interface();
            refresh_screen();
        }
    }
    TEST_CASE("set_interface_root_text_color_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        WindowCleanup cleanup_window;
        set_interface_root_text_color(color_red());
        while (key_typed(KeyCode::SPACE_KEY) == false) {
            process_events();
            clear_screen();
            draw_text(string("Test: set_interface_root_text_color"), color_black(), 10.0, 10.0);
            draw_text(string("Expected: Text outside panels should be red, text inside panels unchanged"), color_black(), 10.0, 30.0);
            draw_text(string("Press space to end test"), color_black(), 10.0, 50.0);
            label_element(string("This text should be red (outside panel)"), rectangle_from(10.0, 90.0, 300.0, 20.0));
            start_panel(string("Test Panel"), rectangle_from(10.0, 120.0, 300.0, 200.0));
            label_element(string("This text should be normal (inside panel)"));
            end_panel(string("Test Panel"));
            draw_interface();
            refresh_screen();
        }
    }
    TEST_CASE("set_interface_shadows_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        WindowCleanup cleanup_window;
        set_interface_shadows(10, color_blue(), point_at(5.0, 5.0));
        while (key_typed(KeyCode::SPACE_KEY) == false) {
            process_events();
            clear_screen();
            draw_text(string("Test: set_interface_shadows"), color_black(), 10.0, 10.0);
            draw_text(string("Expected: Panel and button with blue shadows (10px radius, 5px offset)"), color_black(), 10.0, 30.0);
            draw_text(string("Press space to end test"), color_black(), 10.0, 50.0);
            start_panel(string("Test Panel"), rectangle_from(10.0, 70.0, 300.0, 200.0));
            button(string("Test Button"));
            end_panel(string("Test Panel"));
            draw_interface();
            refresh_screen();
        }
    }
    TEST_CASE("set_interface_spacing_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        WindowCleanup cleanup_window;
        set_interface_spacing(10, 5);
        while (key_typed(KeyCode::SPACE_KEY) == false) {
            process_events();
            clear_screen();
            draw_text(string("Test: set_interface_spacing"), color_black(), 10.0, 10.0);
            draw_text(string("Expected: Panel with buttons spaced 10px apart and 5px padding"), color_black(), 10.0, 30.0);
            draw_text(string("Press space to end test"), color_black(), 10.0, 50.0);
            start_panel(string("Test Panel"), rectangle_from(10.0, 70.0, 300.0, 200.0));
            button(string("Button 1"));
            button(string("Button 2"));
            end_panel(string("Test Panel"));
            draw_interface();
            refresh_screen();
        }
    }
    TEST_CASE("set_interface_style_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        WindowCleanup cleanup_window;
        set_interface_style(InterfaceStyle::BUBBLE_MULTICOLORED);
        while (key_typed(KeyCode::SPACE_KEY) == false) {
            process_events();
            clear_screen();
            draw_text(string("Test: set_interface_style"), color_black(), 10.0, 10.0);
            draw_text(string("Expected: Panel and button with bubble multicolored style theme"), color_black(), 10.0, 30.0);
            draw_text(string("Press space to end test"), color_black(), 10.0, 50.0);
            start_panel(string("Test Panel"), rectangle_from(10.0, 70.0, 300.0, 200.0));
            button(string("Test Button"));
            end_panel(string("Test Panel"));
            draw_interface();
            refresh_screen();
        }
    }
    TEST_CASE("set_interface_style_with_color_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        WindowCleanup cleanup_window;
        set_interface_style(InterfaceStyle::SHADED_DARK_STYLE, color_blue());
        while (key_typed(KeyCode::SPACE_KEY) == false) {
            process_events();
            clear_screen();
            draw_text(string("Test: set_interface_style_with_color"), color_black(), 10.0, 10.0);
            draw_text(string("Expected: Panel and button with shaded dark style theme in blue"), color_black(), 10.0, 30.0);
            draw_text(string("Press space to end test"), color_black(), 10.0, 50.0);
            start_panel(string("Test Panel"), rectangle_from(10.0, 70.0, 300.0, 200.0));
            button(string("Test Button"));
            end_panel(string("Test Panel"));
            draw_interface();
            refresh_screen();
        }
    }
    TEST_CASE("set_interface_text_color_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        WindowCleanup cleanup_window;
        set_interface_text_color(color_red());
        while (key_typed(KeyCode::SPACE_KEY) == false) {
            process_events();
            clear_screen();
            draw_text(string("Test: set_interface_text_color"), color_black(), 10.0, 10.0);
            draw_text(string("Expected: Panel with red text inside"), color_black(), 10.0, 30.0);
            draw_text(string("Press space to end test"), color_black(), 10.0, 50.0);
            start_panel(string("Test Panel"), rectangle_from(10.0, 70.0, 300.0, 200.0));
            label_element(string("This text should be red"));
            end_panel(string("Test Panel"));
            draw_interface();
            refresh_screen();
        }
    }
    TEST_CASE("set_layout_height_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        WindowCleanup cleanup_window;
        while (key_typed(KeyCode::SPACE_KEY) == false) {
            process_events();
            clear_screen();
            draw_text(string("Test: set_layout_height"), color_black(), 10.0, 10.0);
            draw_text(string("Expected: Button with 100px height"), color_black(), 10.0, 30.0);
            draw_text(string("Press space to end test"), color_black(), 10.0, 50.0);
            start_panel(string("Test Panel"), rectangle_from(10.0, 70.0, 300.0, 200.0));
            set_layout_height(100);
            button(string("Test Button"));
            end_panel(string("Test Panel"));
            draw_interface();
            refresh_screen();
        }
    }
    TEST_CASE("single_line_layout_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        WindowCleanup cleanup_window;
        while (key_typed(KeyCode::SPACE_KEY) == false) {
            process_events();
            clear_screen();
            draw_text(string("Test: single_line_layout"), color_black(), 10.0, 10.0);
            draw_text(string("Expected: Two buttons arranged horizontally in a single line"), color_black(), 10.0, 30.0);
            draw_text(string("Press space to end test"), color_black(), 10.0, 50.0);
            start_panel(string("Test Panel"), rectangle_from(10.0, 70.0, 300.0, 200.0));
            single_line_layout();
            button(string("Button 1"));
            button(string("Button 2"));
            end_panel(string("Test Panel"));
            draw_interface();
            refresh_screen();
        }
    }
    TEST_CASE("slider_at_position_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        WindowCleanup cleanup_window;
        auto test_rect = rectangle_from(100.0, 100.0, 200.0, 20.0);
        auto initial_value = 50.0f;
        auto slider_result = initial_value;
        while (key_typed(KeyCode::SPACE_KEY) == false) {
            process_events();
            clear_screen();
            draw_text(string("Test: slider_at_position"), color_black(), 10.0, 10.0);
            draw_text(string("Expected: Slider with initial value 50, range 0-100 at position (100,100)"), color_black(), 10.0, 30.0);
            draw_text(string("Change the value and press space to pass"), color_black(), 10.0, 50.0);
            slider_result = slider(slider_result, 0.0f, 100.0f, test_rect);
            draw_interface();
            refresh_screen();
        }
        REQUIRE(initial_value != slider_result);
    }
    TEST_CASE("slider_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        WindowCleanup cleanup_window;
        auto initial_value = 50.0f;
        auto slider_result = initial_value;
        while (key_typed(KeyCode::SPACE_KEY) == false) {
            process_events();
            clear_screen();
            draw_text(string("Test: slider"), color_black(), 10.0, 10.0);
            draw_text(string("Expected: Slider with initial value 50, range 0-100 using default layout"), color_black(), 10.0, 30.0);
            draw_text(string("Change the value and press space to pass"), color_black(), 10.0, 50.0);
            start_panel(string("Test Panel"), rectangle_from(10.0, 70.0, 300.0, 200.0));
            slider_result = slider(slider_result, 0.0f, 100.0f);
            end_panel(string("Test Panel"));
            draw_interface();
            refresh_screen();
        }
        REQUIRE(initial_value != slider_result);
    }
    TEST_CASE("slider_labeled_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        WindowCleanup cleanup_window;
        auto initial_value = 50.0f;
        auto slider_result = initial_value;
        while (key_typed(KeyCode::SPACE_KEY) == false) {
            process_events();
            clear_screen();
            draw_text(string("Test: slider_labeled"), color_black(), 10.0, 10.0);
            draw_text(string("Expected: Labeled slider with initial value 50, range 0-100 using default layout"), color_black(), 10.0, 30.0);
            draw_text(string("Change the value and press space to pass"), color_black(), 10.0, 50.0);
            start_panel(string("Test Panel"), rectangle_from(10.0, 70.0, 300.0, 200.0));
            set_interface_label_width(100);
            slider_result = slider(string("Test Slider"), slider_result, 0.0f, 100.0f);
            end_panel(string("Test Panel"));
            draw_interface();
            refresh_screen();
        }
        REQUIRE(initial_value != slider_result);
    }
    TEST_CASE("split_into_columns_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        WindowCleanup cleanup_window;
        while (key_typed(KeyCode::SPACE_KEY) == false) {
            process_events();
            clear_screen();
            draw_text(string("Test: split_into_columns"), color_black(), 10.0, 10.0);
            draw_text(string("Expected: Three buttons arranged in equal columns"), color_black(), 10.0, 30.0);
            draw_text(string("Press space to end test"), color_black(), 10.0, 50.0);
            start_panel(string("Test Panel"), rectangle_from(10.0, 70.0, 300.0, 200.0));
            start_custom_layout();
            split_into_columns(3);
            button(string("Button 1"));
            button(string("Button 2"));
            button(string("Button 3"));
            end_panel(string("Test Panel"));
            draw_interface();
            refresh_screen();
        }
    }
    TEST_CASE("split_into_columns_with_last_width_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        WindowCleanup cleanup_window;
        while (key_typed(KeyCode::SPACE_KEY) == false) {
            process_events();
            clear_screen();
            draw_text(string("Test: split_into_columns_with_last_width"), color_black(), 10.0, 10.0);
            draw_text(string("Expected: Three buttons with last column width 200px"), color_black(), 10.0, 30.0);
            draw_text(string("Press space to end test"), color_black(), 10.0, 50.0);
            start_panel(string("Test Panel"), rectangle_from(10.0, 70.0, 300.0, 200.0));
            start_custom_layout();
            split_into_columns(3, 200);
            button(string("Button 1"));
            button(string("Button 2"));
            button(string("Button 3"));
            end_panel(string("Test Panel"));
            draw_interface();
            refresh_screen();
        }
    }
    TEST_CASE("split_into_columns_relative_with_last_width_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        WindowCleanup cleanup_window;
        while (key_typed(KeyCode::SPACE_KEY) == false) {
            process_events();
            clear_screen();
            draw_text(string("Test: split_into_columns_relative_with_last_width"), color_black(), 10.0, 10.0);
            draw_text(string("Expected: Three buttons with last column 50% of panel width"), color_black(), 10.0, 30.0);
            draw_text(string("Press space to end test"), color_black(), 10.0, 50.0);
            start_panel(string("Test Panel"), rectangle_from(10.0, 70.0, 300.0, 200.0));
            start_custom_layout();
            split_into_columns_relative(3, 0.5);
            button(string("Button 1"));
            button(string("Button 2"));
            button(string("Button 3"));
            reset_layout();
            end_panel(string("Test Panel"));
            draw_interface();
            refresh_screen();
        }
    }
    TEST_CASE("start_custom_layout_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        WindowCleanup cleanup_window;
        while (key_typed(KeyCode::SPACE_KEY) == false) {
            process_events();
            clear_screen();
            draw_text(string("Test: start_custom_layout"), color_black(), 10.0, 10.0);
            draw_text(string("Expected: Button in 200px wide column"), color_black(), 10.0, 30.0);
            draw_text(string("Press space to end test"), color_black(), 10.0, 50.0);
            start_panel(string("Test Panel"), rectangle_from(10.0, 70.0, 300.0, 200.0));
            start_custom_layout();
            add_column(200);
            button(string("Test Button"));
            end_panel(string("Test Panel"));
            draw_interface();
            refresh_screen();
        }
    }
    TEST_CASE("start_inset_at_position_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        WindowCleanup cleanup_window;
        auto test_rect = rectangle_from(10.0, 70.0, 300.0, 200.0);
        while (key_typed(KeyCode::SPACE_KEY) == false) {
            process_events();
            clear_screen();
            draw_text(string("Test: start_inset_at_position"), color_black(), 10.0, 10.0);
            draw_text(string("Expected: An inset at position (10,70) containing a button using default layout"), color_black(), 10.0, 30.0);
            draw_text(string("Press space to end test"), color_black(), 10.0, 50.0);
            start_inset(string("test_inset"), test_rect);
            button(string("Test Button"));
            end_inset(string("test_inset"));
            draw_interface();
            refresh_screen();
        }
    }
    TEST_CASE("start_inset_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        WindowCleanup cleanup_window;
        while (key_typed(KeyCode::SPACE_KEY) == false) {
            process_events();
            clear_screen();
            draw_text(string("Test: start_inset"), color_black(), 10.0, 10.0);
            draw_text(string("Expected: An inset with height 60 pixels containing a button"), color_black(), 10.0, 30.0);
            draw_text(string("Press space to end test"), color_black(), 10.0, 50.0);
            start_panel(string("Test Panel"), rectangle_from(0.0, 70.0, 800.0, 530.0));
            start_inset(string("Test Inset"), 60);
            button(string("Test Button"));
            end_inset(string("Test Inset"));
            end_panel(string("Test Panel"));
            draw_interface();
            refresh_screen();
        }
    }
    TEST_CASE("start_panel_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        WindowCleanup cleanup_window;
        auto test_rectangle = rectangle_from(10.0, 70.0, 300.0, 200.0);
        while (key_typed(KeyCode::SPACE_KEY) == false) {
            process_events();
            clear_screen();
            draw_text(string("Test: start_panel"), color_black(), 10.0, 10.0);
            draw_text(string("Expected: Panel with button"), color_black(), 10.0, 30.0);
            draw_text(string("Press space to end test"), color_black(), 10.0, 50.0);
            start_panel(string("Test Panel"), test_rectangle);
            button(string("Test Button"));
            end_panel(string("Test Panel"));
            draw_interface();
            refresh_screen();
        }
    }
    TEST_CASE("start_popup_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        WindowCleanup cleanup_window;
        while (key_typed(KeyCode::SPACE_KEY) == false) {
            process_events();
            clear_screen();
            draw_text(string("Test: start_popup"), color_black(), 10.0, 10.0);
            draw_text(string("Expected: Click the button to show a popup with a label"), color_black(), 10.0, 30.0);
            draw_text(string("Press space to end test"), color_black(), 10.0, 50.0);
            start_panel(string("Test Panel"), rectangle_from(0.0, 70.0, 800.0, 530.0));
            if (button(string("Open Popup")) == true) {
                open_popup(string("Test Popup"));
            }
            if (start_popup(string("Test Popup")) == true) {
                single_line_layout();
                set_interface_label_width(200);
                label_element(string("Test Label"));
                end_popup(string("Test Popup"));
            }
            end_panel(string("Test Panel"));
            draw_interface();
            refresh_screen();
        }
    }
    TEST_CASE("start_treenode_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        WindowCleanup cleanup_window;
        while (key_typed(KeyCode::SPACE_KEY) == false) {
            process_events();
            clear_screen();
            draw_text(string("Test: start_treenode"), color_black(), 10.0, 10.0);
            draw_text(string("Expected: A panel containing a collapsible tree node with a button"), color_black(), 10.0, 30.0);
            draw_text(string("Press space to end test"), color_black(), 10.0, 50.0);
            start_panel(string("Test Panel"), rectangle_from(10.0, 70.0, 200.0, 200.0));
            if (start_treenode(string("Test Node")) == true) {
                button(string("Test Button"));
                end_treenode(string("Test Node"));
            }
            end_panel(string("Test Panel"));
            draw_interface();
            refresh_screen();
        }
    }
    TEST_CASE("text_box_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        WindowCleanup cleanup_window;
        auto initial_text = string("Initial Text");
        auto text_result = initial_text;
        while (key_typed(KeyCode::SPACE_KEY) == false) {
            process_events();
            clear_screen();
            draw_text(string("Test: text_box"), color_black(), 10.0, 10.0);
            draw_text(string("Expected: Text box with editable text"), color_black(), 10.0, 30.0);
            draw_text(string("Change the text and press space to pass"), color_black(), 10.0, 50.0);
            start_panel(string("Test Panel"), rectangle_from(10.0, 70.0, 300.0, 200.0));
            text_result = text_box(text_result);
            end_panel(string("Test Panel"));
            draw_interface();
            refresh_screen();
        }
        REQUIRE(initial_text != text_result);
    }
    TEST_CASE("text_box_at_position_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        WindowCleanup cleanup_window;
        auto test_rect = rectangle_from(10.0, 70.0, 300.0, 30.0);
        auto initial_text = string("Initial Text");
        auto text_result = initial_text;
        while (key_typed(KeyCode::SPACE_KEY) == false) {
            process_events();
            clear_screen();
            draw_text(string("Test: text_box_at_position"), color_black(), 10.0, 10.0);
            draw_text(string("Expected: Text box at position (10,70) with size 300x30"), color_black(), 10.0, 30.0);
            draw_text(string("Change the text and press space to pass"), color_black(), 10.0, 50.0);
            text_result = text_box(text_result, test_rect);
            draw_interface();
            refresh_screen();
        }
        REQUIRE(initial_text != text_result);
    }
    TEST_CASE("text_box_labeled_integration") {
        auto test_window = open_window(string("Test Window"), 800, 600);
        WindowCleanup cleanup_window;
        auto initial_text = string("Initial Text");
        auto text_result = initial_text;
        while (key_typed(KeyCode::SPACE_KEY) == false) {
            process_events();
            clear_screen();
            draw_text(string("Test: text_box_labeled"), color_black(), 10.0, 10.0);
            draw_text(string("Expected: Labeled text box with editable text"), color_black(), 10.0, 30.0);
            draw_text(string("Change the text and press space to pass"), color_black(), 10.0, 50.0);
            start_panel(string("Test Panel"), rectangle_from(10.0, 70.0, 300.0, 200.0));
            set_interface_label_width(100);
            text_result = text_box(string("Test Text Box"), text_result);
            end_panel(string("Test Panel"));
            draw_interface();
            refresh_screen();
        }
        REQUIRE(initial_text != text_result);
    }
};
