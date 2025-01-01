import pytest
from splashkit import *
from ..helpers import *
import contextlib
class TestInterface:
    def setup_method(self):
        set_resources_path("/mnt/c/Users/Noahc/Documents/aYear_2_semester_2/TeamProject/GitHubRepo/splashkit_test_generator/resources")

    def test_add_column_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
        while key_typed(KeyCode.SpaceKey) is False:
            process_events()
            clear_screen_to_white()
            draw_text_no_font_no_size("Test: add_column", color_black(), 10.0, 10.0)
            draw_text_no_font_no_size("Expected: Two columns - first 100px wide, second fills remaining space", color_black(), 10.0, 30.0)
            draw_text_no_font_no_size("Press space to end test", color_black(), 10.0, 50.0)
            start_panel("Test Panel", rectangle_from(0.0, 70.0, 800.0, 530.0))
            start_custom_layout()
            add_column(100)
            add_column(-1)
            button("Left Column")
            button("Right Column")
            end_panel("Test Panel")
            draw_interface()
            refresh_screen()
            
            
    def test_add_column_relative_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
        while key_typed(KeyCode.SpaceKey) is False:
            process_events()
            clear_screen_to_white()
            draw_text_no_font_no_size("Test: add_column_relative", color_black(), 10.0, 10.0)
            draw_text_no_font_no_size("Expected: Two equal-width columns (50% each)", color_black(), 10.0, 30.0)
            draw_text_no_font_no_size("Press space to end test", color_black(), 10.0, 50.0)
            start_panel("Test Panel", rectangle_from(0.0, 70.0, 800.0, 530.0))
            start_custom_layout()
            add_column_relative(0.5)
            add_column_relative(0.5)
            button("Left Column")
            button("Right Column")
            end_panel("Test Panel")
            draw_interface()
            refresh_screen()
            
            
    def test_bitmap_button_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
            test_bitmap = create_bitmap("test_bitmap", 100, 100)
            with bitmap_cleanup():
                clear_bitmap(test_bitmap, color_red())
                button_clicked = false;
        while button_clicked is False:
            process_events()
            clear_screen_to_white()
            draw_text_no_font_no_size("Test: bitmap_button", color_black(), 10.0, 10.0)
            draw_text_no_font_no_size("Expected: A clickable button with a red bitmap image", color_black(), 10.0, 30.0)
            draw_text_no_font_no_size("Click the button to end test", color_black(), 10.0, 50.0)
            start_panel("Test Panel", rectangle_from(0.0, 70.0, 800.0, 530.0))
            set_layout_height(100)
            button_clicked = bitmap_button(test_bitmap)
            end_panel("Test Panel")
            draw_interface()
            refresh_screen()
            
            assert button_clicked
            
    def test_bitmap_button_at_position_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
            test_bitmap = create_bitmap("test_bitmap", 100, 100)
            clear_bitmap(test_bitmap, color_red())
            with bitmap_cleanup():
                test_rectangle = rectangle_from(100.0, 100.0, 100.0, 100.0)
                button_clicked = false;
        while button_clicked is False:
            process_events()
            clear_screen_to_white()
            draw_text_no_font_no_size("Test: bitmap_button_at_position", color_black(), 10.0, 10.0)
            draw_text_no_font_no_size("Expected: A red bitmap button at position (100,100)", color_black(), 10.0, 30.0)
            draw_text_no_font_no_size("Click the button to end test", color_black(), 10.0, 50.0)
            button_clicked = bitmap_button_at_position(test_bitmap, test_rectangle)
            draw_interface()
            refresh_screen()
            
            assert button_clicked
            
    def test_bitmap_button_at_position_with_options_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
            test_bitmap = create_bitmap("test_bitmap", 100, 100)
            clear_bitmap(test_bitmap, color_red())
            with bitmap_cleanup():
                test_rectangle = rectangle_from(100.0, 100.0, 100.0, 100.0)
                button_clicked = false;
        while button_clicked is False:
            process_events()
            clear_screen_to_white()
            draw_text_no_font_no_size("Test: bitmap_button_at_position_with_options", color_black(), 10.0, 10.0)
            draw_text_no_font_no_size("Expected: A red bitmap button at position (100,100) with default options", color_black(), 10.0, 30.0)
            draw_text_no_font_no_size("Click the button to end test", color_black(), 10.0, 50.0)
            button_clicked = bitmap_button_at_position_with_options(test_bitmap, test_rectangle, option_defaults())
            draw_interface()
            refresh_screen()
            
            assert button_clicked
            
    def test_bitmap_button_with_options_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
            test_bitmap = create_bitmap("test_bitmap", 100, 100)
            clear_bitmap(test_bitmap, color_red())
            with bitmap_cleanup():
                test_options1 = option_defaults()
                test_options2 = option_scale_bmp_with_options(0.5, 0.5, test_options1)
                button_clicked = false;
        while button_clicked is False:
            process_events()
            clear_screen_to_white()
            draw_text_no_font_no_size("Test: bitmap_button_with_options", color_black(), 10.0, 10.0)
            draw_text_no_font_no_size("Expected: A red bitmap button scaled to 50% size", color_black(), 10.0, 30.0)
            draw_text_no_font_no_size("Click the button to end test", color_black(), 10.0, 50.0)
            start_panel("Test Panel", rectangle_from(0.0, 70.0, 800.0, 530.0))
            set_layout_height(50)
            button_clicked = bitmap_button_with_options(test_bitmap, test_options2)
            end_panel("Test Panel")
            draw_interface()
            refresh_screen()
            
            assert button_clicked
            
    def test_bitmap_button_labeled_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
            test_bitmap = create_bitmap("test_bitmap", 20, 20)
            clear_bitmap(test_bitmap, color_red())
            with bitmap_cleanup():
                button_clicked = false;
        while button_clicked is False:
            process_events()
            clear_screen_to_white()
            draw_text_no_font_no_size("Test: bitmap_button_labeled", color_black(), 10.0, 10.0)
            draw_text_no_font_no_size("Expected: A red bitmap button with label 'Click Me'", color_black(), 10.0, 30.0)
            draw_text_no_font_no_size("Click the button to end test", color_black(), 10.0, 50.0)
            start_panel("Test Panel", rectangle_from(0.0, 70.0, 800.0, 530.0))
            button_clicked = bitmap_button_labeled("Click Me", test_bitmap)
            end_panel("Test Panel")
            draw_interface()
            refresh_screen()
            
            assert button_clicked
            
    def test_bitmap_button_labeled_with_options_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
            test_bitmap = create_bitmap("test_bitmap", 20, 20)
            clear_bitmap(test_bitmap, color_red())
            with bitmap_cleanup():
                test_options1 = option_defaults()
                test_options2 = option_scale_bmp_with_options(0.5, 0.5, test_options1)
                button_clicked = false;
        while button_clicked is False:
            process_events()
            clear_screen_to_white()
            draw_text_no_font_no_size("Test: bitmap_button_labeled_with_options", color_black(), 10.0, 10.0)
            draw_text_no_font_no_size("Expected: A red bitmap button scaled to 50% with label 'Click Me'", color_black(), 10.0, 30.0)
            draw_text_no_font_no_size("Click the button to end test", color_black(), 10.0, 50.0)
            start_panel("Test Panel", rectangle_from(0.0, 70.0, 800.0, 530.0))
            button_clicked = bitmap_button_labeled_with_options("Click Me", test_bitmap, test_options2)
            end_panel("Test Panel")
            draw_interface()
            refresh_screen()
            
            assert button_clicked
            
    def test_button_at_position_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
            test_rectangle = rectangle_from(100.0, 100.0, 200.0, 50.0)
            button_clicked = false;
        while button_clicked is False:
            process_events()
            clear_screen_to_white()
            draw_text_no_font_no_size("Test: button_at_position", color_black(), 10.0, 10.0)
            draw_text_no_font_no_size("Expected: A button with text 'Click Me' at position (100,100) with size 200x50", color_black(), 10.0, 30.0)
            draw_text_no_font_no_size("Click the button to end test", color_black(), 10.0, 50.0)
            button_clicked = button_at_position("Click Me", test_rectangle)
            draw_interface()
            refresh_screen()
            
            assert button_clicked
            
    def test_button_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
            button_clicked = false;
        while button_clicked is False:
            process_events()
            clear_screen_to_white()
            draw_text_no_font_no_size("Test: button", color_black(), 10.0, 10.0)
            draw_text_no_font_no_size("Expected: A button with text 'Click Me' using default layout", color_black(), 10.0, 30.0)
            draw_text_no_font_no_size("Click the button to end test", color_black(), 10.0, 50.0)
            start_panel("Test Panel", rectangle_from(0.0, 70.0, 800.0, 530.0))
            button_clicked = button("Click Me")
            end_panel("Test Panel")
            draw_interface()
            refresh_screen()
            
            assert button_clicked
            
    def test_button_labeled_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
            button_clicked = false;
        while button_clicked is False:
            process_events()
            clear_screen_to_white()
            draw_text_no_font_no_size("Test: button_labeled", color_black(), 10.0, 10.0)
            draw_text_no_font_no_size("Expected: A button with text 'Click Me' and label 'Label:' in a two-column layout", color_black(), 10.0, 30.0)
            draw_text_no_font_no_size("Click the button to end test", color_black(), 10.0, 50.0)
            start_panel("Test Panel", rectangle_from(0.0, 70.0, 800.0, 530.0))
            button_clicked = button_labeled("Label:", "Click Me")
            end_panel("Test Panel")
            draw_interface()
            refresh_screen()
            
            assert button_clicked
            
    def test_checkbox_at_position_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
            test_rect = rectangle_from(100.0, 100.0, 200.0, 50.0)
            initial_checkbox_result = false;
            current_checkbox_result = initial_checkbox_result;
        while current_checkbox_result is False:
            process_events()
            clear_screen_to_white()
            draw_text_no_font_no_size("Test: checkbox_at_position", color_black(), 10.0, 10.0)
            draw_text_no_font_no_size("Expected: A checkbox with text 'Test Checkbox' at position (100,100) with size 200x50", color_black(), 10.0, 30.0)
            draw_text_no_font_no_size("Click the checkbox to end test", color_black(), 10.0, 50.0)
            current_checkbox_result = checkbox_at_position("Test Checkbox", current_checkbox_result, test_rect)
            draw_interface()
            refresh_screen()
            
            assert current_checkbox_result
            
    def test_checkbox_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
            initial_checkbox_result = false;
            current_checkbox_result = initial_checkbox_result;
        while current_checkbox_result is False:
            process_events()
            clear_screen_to_white()
            draw_text_no_font_no_size("Test: checkbox", color_black(), 10.0, 10.0)
            draw_text_no_font_no_size("Expected: A checkbox with text 'Test Checkbox' using default layout", color_black(), 10.0, 30.0)
            draw_text_no_font_no_size("Click the checkbox to end test", color_black(), 10.0, 50.0)
            start_panel("Test Panel", rectangle_from(0.0, 70.0, 800.0, 530.0))
            current_checkbox_result = checkbox("Test Checkbox", current_checkbox_result)
            end_panel("Test Panel")
            draw_interface()
            refresh_screen()
            
            assert current_checkbox_result
            
    def test_checkbox_labeled_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
            initial_checkbox_result = false;
            current_checkbox_result = initial_checkbox_result;
        while current_checkbox_result is False:
            process_events()
            clear_screen_to_white()
            draw_text_no_font_no_size("Test: checkbox_labeled", color_black(), 10.0, 10.0)
            draw_text_no_font_no_size("Expected: A checkbox with text 'Check me' and label 'Test Checkbox' in a two-column layout", color_black(), 10.0, 30.0)
            draw_text_no_font_no_size("Click the checkbox to end test", color_black(), 10.0, 50.0)
            start_panel("Test Panel", rectangle_from(0.0, 70.0, 800.0, 530.0))
            set_interface_label_width(110)
            current_checkbox_result = checkbox_labeled("Test Checkbox", "Check me", current_checkbox_result)
            end_panel("Test Panel")
            draw_interface()
            refresh_screen()
            
            assert current_checkbox_result
            
    def test_color_slider_at_position_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
            initial_color = color_black()
            current_color = initial_color;
        while key_typed(KeyCode.SpaceKey) is False:
            process_events()
            clear_screen_to_white()
            draw_text_no_font_no_size("Test: color_slider_at_position", color_black(), 10.0, 10.0)
            draw_text_no_font_no_size("Expected: A color slider using RGBA controls at position (100,100) with size 400x24", color_black(), 10.0, 30.0)
            draw_text_no_font_no_size("Change the color and press space to pass", color_black(), 10.0, 50.0)
            current_color = color_slider_at_position(current_color, rectangle_from(100.0, 100.0, 400.0, 24.0))
            draw_interface()
            refresh_screen()
            
            assert current_color != initial_color
            
    def test_color_slider_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
            initial_color = color_black()
            current_color = initial_color;
        while key_typed(KeyCode.SpaceKey) is False:
            process_events()
            clear_screen_to_white()
            draw_text_no_font_no_size("Test: color_slider", color_black(), 10.0, 10.0)
            draw_text_no_font_no_size("Expected: A color slider with RGBA controls using default layout", color_black(), 10.0, 30.0)
            draw_text_no_font_no_size("Change the color and press space to pass", color_black(), 10.0, 50.0)
            start_panel("Test Panel", rectangle_from(0.0, 70.0, 800.0, 530.0))
            current_color = color_slider(current_color)
            end_panel("Test Panel")
            draw_interface()
            refresh_screen()
            
            assert not quit_requested()
            
    def test_color_slider_labeled_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
            initial_color = color_black()
            current_color = initial_color;
        while key_typed(KeyCode.SpaceKey) is False:
            process_events()
            clear_screen_to_white()
            draw_text_no_font_no_size("Test: color_slider_labeled", color_black(), 10.0, 10.0)
            draw_text_no_font_no_size("Expected: A color slider with label 'Test Color Slider' in a two-column layout", color_black(), 10.0, 30.0)
            draw_text_no_font_no_size("Change the color and press space to pass", color_black(), 10.0, 50.0)
            set_interface_label_width(120)
            start_panel("Test Panel", rectangle_from(0.0, 70.0, 800.0, 530.0))
            current_color = color_slider_labeled("Test Color Slider", current_color)
            end_panel("Test Panel")
            draw_interface()
            refresh_screen()
            
            assert initial_color != current_color
            
    def test_disable_interface_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
            button_clicked = false;
            assert interface_enabled()
            disable_interface()
        while key_typed(KeyCode.SpaceKey) is False:
            process_events()
            clear_screen_to_white()
            draw_text_no_font_no_size("Test: disable_interface", color_black(), 10.0, 10.0)
            draw_text_no_font_no_size("Expected: A button that is disabled", color_black(), 10.0, 30.0)
            draw_text_no_font_no_size("Click the button and press space to verify that the button is disabled", color_black(), 10.0, 50.0)
            start_panel("Test Panel", rectangle_from(0.0, 70.0, 800.0, 530.0))
            button_clicked = button_labeled("Try to click me")
            end_panel("Test Panel")
            draw_interface()
            refresh_screen()
            
            assert not interface_enabled()
            assert not button_clicked
            
    def test_draw_interface_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
        while key_typed(KeyCode.SpaceKey) is False:
            process_events()
            clear_screen_to_white()
            draw_text_no_font_no_size("Test: draw_interface", color_black(), 10.0, 10.0)
            draw_text_no_font_no_size("Expected: A panel at position (100,100) with size 200x200", color_black(), 10.0, 30.0)
            draw_text_no_font_no_size("Press space to end test", color_black(), 10.0, 50.0)
            start_panel("Test Panel", rectangle_from(100.0, 100.0, 200.0, 200.0))
            button("Test Button")
            end_panel("Test Panel")
            draw_interface()
            refresh_screen()
            
            
    def test_enable_interface_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
            disable_interface()
        while key_typed(KeyCode.SpaceKey) is False:
            process_events()
            clear_screen_to_white()
            draw_text_no_font_no_size("Test: enable_interface", color_black(), 10.0, 10.0)
            draw_text_no_font_no_size("Expected: Button should be disabled", color_black(), 10.0, 30.0)
            draw_text_no_font_no_size("Press space to continue", color_black(), 10.0, 50.0)
            start_panel("Test Panel", rectangle_from(0.0, 70.0, 800.0, 530.0))
            button("Test Button")
            end_panel("Test Panel")
            draw_interface()
            refresh_screen()
            
            assert not interface_enabled()
            enable_interface()
            button_clicked = false;
        while button_clicked is False:
            process_events()
            clear_screen_to_white()
            draw_text_no_font_no_size("Test: enable_interface", color_black(), 10.0, 10.0)
            draw_text_no_font_no_size("Expected: Button should be enabled", color_black(), 10.0, 30.0)
            draw_text_no_font_no_size("Click the button to end test", color_black(), 10.0, 50.0)
            start_panel("Test Panel", rectangle_from(0.0, 70.0, 800.0, 530.0))
            button_clicked = button("Test Button")
            end_panel("Test Panel")
            draw_interface()
            refresh_screen()
            
            assert interface_enabled()
            assert button_clicked
            
    def test_end_inset_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
        while key_typed(KeyCode.SpaceKey) is False:
            process_events()
            clear_screen_to_white()
            draw_text_no_font_no_size("Test: end_inset", color_black(), 10.0, 10.0)
            draw_text_no_font_no_size("Expected: An inset with height 60 pixels containing a button", color_black(), 10.0, 30.0)
            draw_text_no_font_no_size("Press space to end test", color_black(), 10.0, 50.0)
            start_panel("Test Panel", rectangle_from(0.0, 70.0, 800.0, 530.0))
            start_inset("Test Inset", 60)
            button("Test Button")
            end_inset("Test Inset")
            end_panel("Test Panel")
            draw_interface()
            refresh_screen()
            
            
    def test_end_panel_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
        while key_typed(KeyCode.SpaceKey) is False:
            process_events()
            clear_screen_to_white()
            draw_text_no_font_no_size("Test: end_panel", color_black(), 10.0, 10.0)
            draw_text_no_font_no_size("Expected: A panel at position (100,100) with size 200x200 containing a button", color_black(), 10.0, 30.0)
            draw_text_no_font_no_size("Press space to end test", color_black(), 10.0, 50.0)
            start_panel("Test Panel", rectangle_from(100.0, 100.0, 200.0, 200.0))
            button("Test Button")
            end_panel("Test Panel")
            draw_interface()
            refresh_screen()
            
            
    def test_end_popup_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
        while key_typed(KeyCode.SpaceKey) is False:
            process_events()
            clear_screen_to_white()
            draw_text_no_font_no_size("Test: end_popup", color_black(), 10.0, 10.0)
            draw_text_no_font_no_size("Expected: Click the button to show a popup with a label", color_black(), 10.0, 30.0)
            draw_text_no_font_no_size("Press space to end test", color_black(), 10.0, 50.0)
            start_panel("Test Panel", rectangle_from(0.0, 70.0, 800.0, 530.0))
            if button("Open Popup") is True:
                open_popup("Test Popup")
                
                if start_popup("Test Popup") is True:
                    single_line_layout()
                    set_interface_label_width(200)
                    label_element("Test Label")
                    end_popup("Test Popup")
                    
                    end_panel("Test Panel")
                    draw_interface()
                    refresh_screen()
                    
                    
    def test_end_treenode_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
        while key_typed(KeyCode.SpaceKey) is False:
            process_events()
            clear_screen_to_white()
            draw_text_no_font_no_size("Test: end_treenode", color_black(), 10.0, 10.0)
            draw_text_no_font_no_size("Expected: A panel containing a collapsible tree node with a button", color_black(), 10.0, 30.0)
            draw_text_no_font_no_size("Press space to end test", color_black(), 10.0, 50.0)
            start_panel("Test Panel", rectangle_from(10.0, 70.0, 200.0, 200.0))
            if start_treenode("Test Node") is True:
                button("Test Button")
                end_treenode("Test Node")
                
                end_panel("Test Panel")
                draw_interface()
                refresh_screen()
                
                
    def test_enter_column_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
        while key_typed(KeyCode.SpaceKey) is False:
            process_events()
            clear_screen_to_white()
            draw_text_no_font_no_size("Test: enter_column", color_black(), 10.0, 10.0)
            draw_text_no_font_no_size("Expected: A panel with a 100-pixel wide column containing a button", color_black(), 10.0, 30.0)
            draw_text_no_font_no_size("Press space to end test", color_black(), 10.0, 50.0)
            start_panel("Test Panel", rectangle_from(10.0, 70.0, 300.0, 200.0))
            add_column(100)
            enter_column()
            button("Click to end test")
            leave_column()
            end_panel("Test Panel")
            draw_interface()
            refresh_screen()
            
            
    def test_get_interface_label_width_integration():
        test_label_width = get_interface_label_width()
        assert 60 == test_label_width
        
    def test_header_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
        while key_typed(KeyCode.SpaceKey) is False:
            process_events()
            clear_screen_to_white()
            draw_text_no_font_no_size("Test: header", color_black(), 10.0, 10.0)
            draw_text_no_font_no_size("Expected: A collapsible header labeled 'Test Header' with a button", color_black(), 10.0, 30.0)
            draw_text_no_font_no_size("Press space to end test", color_black(), 10.0, 50.0)
            start_panel("Test Panel", rectangle_from(10.0, 70.0, 300.0, 200.0))
            if header("Test Header") is True:
                button("Test Button")
                
                end_panel("Test Panel")
                draw_interface()
                refresh_screen()
                
                
    def test_hsb_color_slider_at_position_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
            initial_color = color_black()
            test_rect = rectangle_from(100.0, 100.0, 400.0, 24.0)
            current_color = initial_color;
        while key_typed(KeyCode.SpaceKey) is False:
            process_events()
            clear_screen_to_white()
            draw_text_no_font_no_size("Test: hsb_color_slider_at_position", color_black(), 10.0, 10.0)
            draw_text_no_font_no_size("Expected: A HSB color slider at position (100,100) with size 400x24", color_black(), 10.0, 30.0)
            draw_text_no_font_no_size("Change the color and press space to pass", color_black(), 10.0, 50.0)
            current_color = hsb_color_slider_at_position(current_color, test_rect)
            draw_interface()
            refresh_screen()
            
            assert current_color != initial_color
            
    def test_hsb_color_slider_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
            initial_color = color_black()
            current_color = initial_color;
        while key_typed(KeyCode.SpaceKey) is False:
            process_events()
            clear_screen_to_white()
            draw_text_no_font_no_size("Test: hsb_color_slider", color_black(), 10.0, 10.0)
            draw_text_no_font_no_size("Expected: A HSB color slider using default layout", color_black(), 10.0, 30.0)
            draw_text_no_font_no_size("Change the color and press space to pass", color_black(), 10.0, 50.0)
            start_panel("Test Panel", rectangle_from(0.0, 70.0, 800.0, 530.0))
            current_color = hsb_color_slider(current_color)
            end_panel("Test Panel")
            draw_interface()
            refresh_screen()
            
            assert current_color != initial_color
            
    def test_hsb_color_slider_labeled_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
            initial_color = color_black()
            current_color = initial_color;
        while key_typed(KeyCode.SpaceKey) is False:
            process_events()
            clear_screen_to_white()
            draw_text_no_font_no_size("Test: hsb_color_slider_labeled", color_black(), 10.0, 10.0)
            draw_text_no_font_no_size("Expected: A HSB color slider with label 'Color Slider' in a two-column layout", color_black(), 10.0, 30.0)
            draw_text_no_font_no_size("Change the color and press space to pass", color_black(), 10.0, 50.0)
            start_panel("Test Panel", rectangle_from(0.0, 70.0, 800.0, 530.0))
            set_interface_label_width(100)
            current_color = hsb_color_slider_labeled("Color Slider", current_color)
            end_panel("Test Panel")
            draw_interface()
            refresh_screen()
            
            assert current_color != initial_color
            
    def test_interface_enabled_integration():
        open_window("Test Window", 800, 600)
        with window_cleanup():
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
        with window_cleanup():
            panel_rectangle = rectangle_from(0.0, 70.0, 800.0, 530.0)
        while key_typed(KeyCode.SpaceKey) is False:
            process_events()
            clear_screen_to_white()
            draw_text_no_font_no_size("Test: interface_style_panel", color_black(), 10.0, 10.0)
            draw_text_no_font_no_size("Expected: A panel with controls to adjust the interface style", color_black(), 10.0, 30.0)
            draw_text_no_font_no_size("Adjust the style and press space to end test", color_black(), 10.0, 50.0)
            interface_style_panel(panel_rectangle)
            draw_interface()
            refresh_screen()
            
            
    def test_label_element_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
        while key_typed(KeyCode.SpaceKey) is False:
            process_events()
            clear_screen_to_white()
            draw_text_no_font_no_size("Test: label_element", color_black(), 10.0, 10.0)
            draw_text_no_font_no_size("Expected: A label with text 'Test Label' using default layout", color_black(), 10.0, 30.0)
            draw_text_no_font_no_size("Press space to end test", color_black(), 10.0, 50.0)
            start_panel("Test Panel", rectangle_from(0.0, 70.0, 800.0, 530.0))
            label_element("Test Label")
            end_panel("Test Panel")
            draw_interface()
            refresh_screen()
            
            
    def test_label_element_at_position_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
            test_rectangle = rectangle_from(100.0, 100.0, 200.0, 50.0)
        while key_typed(KeyCode.SpaceKey) is False:
            process_events()
            clear_screen_to_white()
            draw_text_no_font_no_size("Test: label_element_at_position", color_black(), 10.0, 10.0)
            draw_text_no_font_no_size("Expected: A label with text 'Test Label' at position (100,100)", color_black(), 10.0, 30.0)
            draw_text_no_font_no_size("Press space to end test", color_black(), 10.0, 50.0)
            label_element_at_position("Test Label", test_rectangle)
            draw_interface()
            refresh_screen()
            
            
    def test_last_element_changed_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
            initial_value = 0.0;
            current_value = 0.0;
            element_changed = false;
        while key_typed(KeyCode.SpaceKey) is False:
            process_events()
            clear_screen_to_white()
            draw_text_no_font_no_size("Test: last_element_changed", color_black(), 10.0, 10.0)
            draw_text_no_font_no_size("Expected: A slider that detects value changes", color_black(), 10.0, 30.0)
            draw_text_no_font_no_size("Move the slider and press space to pass", color_black(), 10.0, 50.0)
            start_panel("Test Panel", rectangle_from(0.0, 70.0, 800.0, 530.0))
            current_value = slider_labeled("Test Slider", current_value, 0.0, 100.0)
            if last_element_changed() is True:
                element_changed = true;
                
                end_panel("Test Panel")
                draw_interface()
                refresh_screen()
                
                assert current_value != initial_value
                assert element_changed
                
    def test_last_element_confirmed_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
            button_clicked = false;
        while key_typed(KeyCode.SpaceKey) is False:
            process_events()
            clear_screen_to_white()
            draw_text_no_font_no_size("Test: last_element_confirmed", color_black(), 10.0, 10.0)
            draw_text_no_font_no_size("Expected: A button that detects when clicked", color_black(), 10.0, 30.0)
            draw_text_no_font_no_size("Click the button and press space to pass", color_black(), 10.0, 50.0)
            start_panel("Test Panel", rectangle_from(0.0, 70.0, 800.0, 530.0))
            button("Test Button")
            if last_element_confirmed() is True:
                button_clicked = true;
                
                end_panel("Test Panel")
                draw_interface()
                refresh_screen()
                
                assert button_clicked
                
    def test_leave_column_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
        while key_typed(KeyCode.SpaceKey) is False:
            process_events()
            clear_screen()
            draw_text_no_font_no_size("Test: leave_column", color_black(), 10.0, 10.0)
            draw_text_no_font_no_size("Expected: A button that appears after leaving a column with a width of 100", color_black(), 10.0, 30.0)
            draw_text_no_font_no_size("Press space to end test", color_black(), 10.0, 50.0)
            start_panel("Test Panel", rectangle_from(10.0, 70.0, 300.0, 200.0))
            start_custom_layout()
            add_column(100)
            add_column(-1)
            enter_column()
            leave_column()
            button("Test Button")
            end_panel("Test Panel")
            draw_interface()
            refresh_screen()
            
            
    def test_number_box_at_position_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
            test_rect = rectangle_from(100.0, 100.0, 200.0, 30.0)
            test_result = 5.0;
        while key_typed(KeyCode.SpaceKey) is False:
            process_events()
            clear_screen()
            draw_text_no_font_no_size("Test: number_box_at_position", color_black(), 10.0, 10.0)
            draw_text_no_font_no_size("Expected: A number box at position (100,100) with size 200x30", color_black(), 10.0, 30.0)
            draw_text_no_font_no_size("Change the number and press space to pass", color_black(), 10.0, 50.0)
            test_result = number_box_at_position(test_result, 1.0, test_rect)
            draw_interface()
            refresh_screen()
            
            assert 5.0 != test_result
            
    def test_number_box_integration():
        test_window = open_window("Number Box Test", 800, 600)
        with window_cleanup():
            test_result = 5.0;
        while key_typed(KeyCode.SpaceKey) is False:
            process_events()
            clear_screen()
            draw_text_no_font_no_size("Test: number_box", color_black(), 10.0, 10.0)
            draw_text_no_font_no_size("Expected: A number box with step size 1.0 using the default layout", color_black(), 10.0, 30.0)
            draw_text_no_font_no_size("Change the number and press space to pass", color_black(), 10.0, 50.0)
            start_panel("Test Panel", rectangle_from(10.0, 70.0, 300.0, 200.0))
            test_result = number_box(test_result, 1.0)
            end_panel("Test Panel")
            draw_interface()
            refresh_screen()
            
            assert 5.0 != test_result
            
    def test_number_box_labeled_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
            test_result = 5.0;
        while key_typed(KeyCode.SpaceKey) is False:
            process_events()
            clear_screen()
            draw_text_no_font_no_size("Test: number_box_labeled", color_black(), 10.0, 10.0)
            draw_text_no_font_no_size("Expected: A labeled number box with step size 1.0 using the default layout", color_black(), 10.0, 30.0)
            draw_text_no_font_no_size("Change the number and press space to pass", color_black(), 10.0, 50.0)
            start_panel("Test Panel", rectangle_from(10.0, 70.0, 300.0, 200.0))
            set_interface_label_width(100)
            test_result = number_box_labeled("Test Value", test_result, 1.0)
            end_panel("Test Panel")
            draw_interface()
            refresh_screen()
            
            assert 5.0 != test_result
            
    def test_open_popup_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
        while key_typed(KeyCode.SpaceKey) is False:
            process_events()
            clear_screen_to_white()
            draw_text_no_font_no_size("Test: open_popup", color_black(), 10.0, 10.0)
            draw_text_no_font_no_size("Expected: Click the button to show a popup with a label", color_black(), 10.0, 30.0)
            draw_text_no_font_no_size("Press space to end test", color_black(), 10.0, 50.0)
            start_panel("Test Panel", rectangle_from(0.0, 70.0, 800.0, 530.0))
            if button("Open Popup") is True:
                open_popup("Test Popup")
                
                if start_popup("Test Popup") is True:
                    single_line_layout()
                    set_interface_label_width(200)
                    label_element("Test Label")
                    end_popup("Test Popup")
                    
                    end_panel("Test Panel")
                    draw_interface()
                    refresh_screen()
                    
                    
    def test_paragraph_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
            set_interface_font(load_font("hara", "hara.ttf"))
            with font_cleanup():
                set_interface_font_size(12)
        while key_typed(KeyCode.SpaceKey) is False:
            process_events()
            clear_screen()
            draw_text_no_font_no_size("Test: paragraph", color_black(), 10.0, 10.0)
            draw_text_no_font_no_size("Expected: A paragraph of text that wraps correctly within the panel", color_black(), 10.0, 30.0)
            draw_text_no_font_no_size("Press space to end test", color_black(), 10.0, 50.0)
            start_panel("Test Panel", rectangle_from(10.0, 70.0, 300.0, 200.0))
            paragraph("This is a test paragraph to check if the text wraps correctly. weguy YGWE FYw eiuofhWEOF wue fuhwbeuf WUEFU wue")
            end_panel("Test Panel")
            draw_interface()
            refresh_screen()
            
            
    def test_paragraph_at_position_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
            test_rectangle = rectangle_from(100.0, 100.0, 200.0, 100.0)
        while key_typed(KeyCode.SpaceKey) is False:
            process_events()
            clear_screen()
            draw_text_no_font_no_size("Test: paragraph_at_position", color_black(), 10.0, 10.0)
            draw_text_no_font_no_size("Expected: A paragraph at position (100,100) with size 200x100", color_black(), 10.0, 30.0)
            draw_text_no_font_no_size("Press space to end test", color_black(), 10.0, 50.0)
            paragraph("This is a test paragraph to check if the text wraps correctly. weguy YGWE FYw eiuofhWEOF wue fuhwbeuf WUEFU wue", test_rectangle)
            draw_interface()
            refresh_screen()
            
            
    def test_reset_layout_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
        while key_typed(KeyCode.SpaceKey) is False:
            process_events()
            clear_screen()
            draw_text_no_font_no_size("Test: reset_layout", color_black(), 10.0, 10.0)
            draw_text_no_font_no_size("Expected: The second button should not be confined to the created columns after reset", color_black(), 10.0, 30.0)
            draw_text_no_font_no_size("Press space to end test", color_black(), 10.0, 50.0)
            start_panel("Test Panel", rectangle_from(10.0, 70.0, 300.0, 200.0))
            start_custom_layout()
            add_column(200)
            add_column(-1)
            button("Button 1")
            reset_layout()
            button("Button 2")
            end_panel("Test Panel")
            draw_interface()
            refresh_screen()
            
            
    def test_set_interface_accent_color_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
            set_interface_accent_color(color_red(), 0.5)
        while key_typed(KeyCode.SpaceKey) is False:
            process_events()
            clear_screen()
            draw_text_no_font_no_size("Test: set_interface_accent_color", color_black(), 10.0, 10.0)
            draw_text_no_font_no_size("Expected: A button with red accent color at 50% contrast", color_black(), 10.0, 30.0)
            draw_text_no_font_no_size("Press space to end test", color_black(), 10.0, 50.0)
            start_panel("Test Panel", rectangle_from(10.0, 70.0, 300.0, 200.0))
            button("Test Button")
            end_panel("Test Panel")
            draw_interface()
            refresh_screen()
            
            
    def test_set_interface_border_color_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
            set_interface_border_color(color_red())
        while key_typed(KeyCode.SpaceKey) is False:
            process_events()
            clear_screen()
            draw_text_no_font_no_size("Test: set_interface_border_color", color_black(), 10.0, 10.0)
            draw_text_no_font_no_size("Expected: A panel and button with red borders", color_black(), 10.0, 30.0)
            draw_text_no_font_no_size("Press space to end test", color_black(), 10.0, 50.0)
            start_panel("Test Panel", rectangle_from(10.0, 70.0, 300.0, 200.0))
            button("Test Button")
            end_panel("Test Panel")
            draw_interface()
            refresh_screen()
            
            
    def test_set_interface_colors_auto_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
            set_interface_colors_auto(color_white(), color_blue(), 0.5, 0.7, 0.3)
        while key_typed(KeyCode.SpaceKey) is False:
            process_events()
            clear_screen()
            draw_text_no_font_no_size("Test: set_interface_colors_auto", color_black(), 10.0, 10.0)
            draw_text_no_font_no_size("Expected: A panel with white main color and blue accent color", color_black(), 10.0, 30.0)
            draw_text_no_font_no_size("Press space to end test", color_black(), 10.0, 70.0)
            start_panel("Test Panel", rectangle_from(10.0, 90.0, 300.0, 200.0))
            button("Test Button")
            end_panel("Test Panel")
            draw_interface()
            refresh_screen()
            
            
    def test_set_interface_element_color_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
            set_interface_element_color(color_black(), 0.5)
        while key_typed(KeyCode.SpaceKey) is False:
            process_events()
            clear_screen()
            draw_text_no_font_no_size("Test: set_interface_element_color", color_black(), 10.0, 10.0)
            draw_text_no_font_no_size("Expected: A panel with black element color at 50% contrast", color_black(), 10.0, 30.0)
            draw_text_no_font_no_size("Press space to end test", color_black(), 10.0, 50.0)
            start_panel("Test Panel", rectangle_from(10.0, 70.0, 300.0, 200.0))
            button("Test Button")
            end_panel("Test Panel")
            draw_interface()
            refresh_screen()
            
            
    def test_set_interface_element_shadows_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
            set_interface_element_shadows(10, color_blue(), point_at(5.0, 5.0))
        while key_typed(KeyCode.SpaceKey) is False:
            process_events()
            clear_screen()
            draw_text_no_font_no_size("Test: set_interface_element_shadows", color_black(), 10.0, 10.0)
            draw_text_no_font_no_size("Expected: Elements with blue shadow (radius: 10, offset: 5,5)", color_black(), 10.0, 30.0)
            draw_text_no_font_no_size("Press space to end test", color_black(), 10.0, 50.0)
            start_panel("Test Panel", rectangle_from(10.0, 70.0, 300.0, 200.0))
            button("Test Button")
            end_panel("Test Panel")
            draw_interface()
            refresh_screen()
            
            
    def test_set_interface_font_font_as_string_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
            load_font("hara", "hara.ttf")
            with font_cleanup():
                load_font("demolition", "demolition.ttf")
        while key_typed(KeyCode.SpaceKey) is False:
            process_events()
            clear_screen()
            draw_text_no_font_no_size("Test: set_interface_font_font_as_string", color_black(), 10.0, 10.0)
            draw_text_no_font_no_size("Press space to end test", color_black(), 10.0, 30.0)
            start_panel("Hara Font", rectangle_from(10.0, 70.0, 300.0, 100.0))
            set_interface_font_font_as_string("hara")
            label_element("This text uses Hara font")
            end_panel("Hara Font")
            start_panel("Demolition Font", rectangle_from(10.0, 180.0, 300.0, 100.0))
            set_interface_font_font_as_string("demolition")
            label_element("This text uses Demolition font")
            end_panel("Demolition Font")
            draw_interface()
            refresh_screen()
            
            
    def test_set_interface_font_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
            hara_font = load_font("hara", "hara.ttf")
            with font_cleanup():
                demolition_font = load_font("demolition", "demolition.ttf")
        while key_typed(KeyCode.SpaceKey) is False:
            process_events()
            clear_screen()
            draw_text_no_font_no_size("Test: set_interface_font", color_black(), 10.0, 10.0)
            draw_text_no_font_no_size("Press space to end test", color_black(), 10.0, 30.0)
            start_panel("Hara Font", rectangle_from(10.0, 70.0, 300.0, 100.0))
            set_interface_font(hara_font)
            label_element("This text uses Hara font")
            end_panel("Hara Font")
            start_panel("Demolition Font", rectangle_from(10.0, 180.0, 300.0, 100.0))
            set_interface_font(demolition_font)
            label_element("This text uses Demolition font")
            end_panel("Demolition Font")
            draw_interface()
            refresh_screen()
            
            
    def test_set_interface_font_size_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
        while key_typed(KeyCode.SpaceKey) is False:
            process_events()
            clear_screen()
            draw_text_no_font_no_size("Test: set_interface_font_size", color_black(), 10.0, 10.0)
            draw_text_no_font_no_size("Press space to end test", color_black(), 10.0, 30.0)
            set_interface_font_size(12)
            start_panel("Small Font", rectangle_from(10.0, 70.0, 300.0, 100.0))
            label_element("This text uses 12pt font size")
            end_panel("Small Font")
            set_interface_font_size(16)
            start_panel("Medium Font", rectangle_from(10.0, 180.0, 300.0, 100.0))
            label_element("This text uses 16pt font size")
            end_panel("Medium Font")
            set_interface_font_size(24)
            start_panel("Large Font", rectangle_from(10.0, 290.0, 300.0, 100.0))
            label_element("This text uses 24pt font size")
            end_panel("Large Font")
            draw_interface()
            refresh_screen()
            
            
    def test_set_interface_label_width_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
            set_interface_label_width(100)
            assert 100 == get_interface_label_width()
            
    def test_set_interface_panel_shadows_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
            set_interface_panel_shadows(10, color_blue(), point_at(5.0, 5.0))
        while key_typed(KeyCode.SpaceKey) is False:
            process_events()
            clear_screen()
            draw_text_no_font_no_size("Test: set_interface_panel_shadows", color_black(), 10.0, 10.0)
            draw_text_no_font_no_size("Expected: A panel with blue shadow (10px radius, 5px offset)", color_black(), 10.0, 30.0)
            draw_text_no_font_no_size("Press space to end test", color_black(), 10.0, 50.0)
            start_panel("Test Panel", rectangle_from(10.0, 70.0, 300.0, 200.0))
            button("Test Button")
            end_panel("Test Panel")
            draw_interface()
            refresh_screen()
            
            
    def test_set_interface_root_text_color_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
            set_interface_root_text_color(color_red())
        while key_typed(KeyCode.SpaceKey) is False:
            process_events()
            clear_screen()
            draw_text_no_font_no_size("Test: set_interface_root_text_color", color_black(), 10.0, 10.0)
            draw_text_no_font_no_size("Expected: Text outside panels should be red, text inside panels unchanged", color_black(), 10.0, 30.0)
            draw_text_no_font_no_size("Press space to end test", color_black(), 10.0, 50.0)
            label_element_at_position("This text should be red (outside panel)", rectangle_from(10.0, 90.0, 300.0, 20.0))
            start_panel("Test Panel", rectangle_from(10.0, 120.0, 300.0, 200.0))
            label_element("This text should be normal (inside panel)")
            end_panel("Test Panel")
            draw_interface()
            refresh_screen()
            
            
    def test_set_interface_shadows_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
            set_interface_shadows(10, color_blue(), point_at(5.0, 5.0))
        while key_typed(KeyCode.SpaceKey) is False:
            process_events()
            clear_screen()
            draw_text_no_font_no_size("Test: set_interface_shadows", color_black(), 10.0, 10.0)
            draw_text_no_font_no_size("Expected: Panel and button with blue shadows (10px radius, 5px offset)", color_black(), 10.0, 30.0)
            draw_text_no_font_no_size("Press space to end test", color_black(), 10.0, 50.0)
            start_panel("Test Panel", rectangle_from(10.0, 70.0, 300.0, 200.0))
            button("Test Button")
            end_panel("Test Panel")
            draw_interface()
            refresh_screen()
            
            
    def test_set_interface_spacing_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
            set_interface_spacing(10, 5)
        while key_typed(KeyCode.SpaceKey) is False:
            process_events()
            clear_screen()
            draw_text_no_font_no_size("Test: set_interface_spacing", color_black(), 10.0, 10.0)
            draw_text_no_font_no_size("Expected: Panel with buttons spaced 10px apart and 5px padding", color_black(), 10.0, 30.0)
            draw_text_no_font_no_size("Press space to end test", color_black(), 10.0, 50.0)
            start_panel("Test Panel", rectangle_from(10.0, 70.0, 300.0, 200.0))
            button("Button 1")
            button("Button 2")
            end_panel("Test Panel")
            draw_interface()
            refresh_screen()
            
            
    def test_set_interface_style_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
            set_interface_style(InterfaceStyle.BubbleMulticolored)
        while key_typed(KeyCode.SpaceKey) is False:
            process_events()
            clear_screen()
            draw_text_no_font_no_size("Test: set_interface_style", color_black(), 10.0, 10.0)
            draw_text_no_font_no_size("Expected: Panel and button with bubble multicolored style theme", color_black(), 10.0, 30.0)
            draw_text_no_font_no_size("Press space to end test", color_black(), 10.0, 50.0)
            start_panel("Test Panel", rectangle_from(10.0, 70.0, 300.0, 200.0))
            button("Test Button")
            end_panel("Test Panel")
            draw_interface()
            refresh_screen()
            
            
    def test_set_interface_style_with_color_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
            set_interface_style(InterfaceStyle.ShadedDarkStyle, color_blue())
        while key_typed(KeyCode.SpaceKey) is False:
            process_events()
            clear_screen()
            draw_text_no_font_no_size("Test: set_interface_style_with_color", color_black(), 10.0, 10.0)
            draw_text_no_font_no_size("Expected: Panel and button with shaded dark style theme in blue", color_black(), 10.0, 30.0)
            draw_text_no_font_no_size("Press space to end test", color_black(), 10.0, 50.0)
            start_panel("Test Panel", rectangle_from(10.0, 70.0, 300.0, 200.0))
            button("Test Button")
            end_panel("Test Panel")
            draw_interface()
            refresh_screen()
            
            
    def test_set_interface_text_color_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
            set_interface_text_color(color_red())
        while key_typed(KeyCode.SpaceKey) is False:
            process_events()
            clear_screen()
            draw_text_no_font_no_size("Test: set_interface_text_color", color_black(), 10.0, 10.0)
            draw_text_no_font_no_size("Expected: Panel with red text inside", color_black(), 10.0, 30.0)
            draw_text_no_font_no_size("Press space to end test", color_black(), 10.0, 50.0)
            start_panel("Test Panel", rectangle_from(10.0, 70.0, 300.0, 200.0))
            label_element("This text should be red")
            end_panel("Test Panel")
            draw_interface()
            refresh_screen()
            
            
    def test_set_layout_height_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
        while key_typed(KeyCode.SpaceKey) is False:
            process_events()
            clear_screen()
            draw_text_no_font_no_size("Test: set_layout_height", color_black(), 10.0, 10.0)
            draw_text_no_font_no_size("Expected: Button with 100px height", color_black(), 10.0, 30.0)
            draw_text_no_font_no_size("Press space to end test", color_black(), 10.0, 50.0)
            start_panel("Test Panel", rectangle_from(10.0, 70.0, 300.0, 200.0))
            set_layout_height(100)
            button("Test Button")
            end_panel("Test Panel")
            draw_interface()
            refresh_screen()
            
            
    def test_single_line_layout_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
        while key_typed(KeyCode.SpaceKey) is False:
            process_events()
            clear_screen()
            draw_text_no_font_no_size("Test: single_line_layout", color_black(), 10.0, 10.0)
            draw_text_no_font_no_size("Expected: Two buttons arranged horizontally in a single line", color_black(), 10.0, 30.0)
            draw_text_no_font_no_size("Press space to end test", color_black(), 10.0, 50.0)
            start_panel("Test Panel", rectangle_from(10.0, 70.0, 300.0, 200.0))
            single_line_layout()
            button("Button 1")
            button("Button 2")
            end_panel("Test Panel")
            draw_interface()
            refresh_screen()
            
            
    def test_slider_at_position_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
            test_rect = rectangle_from(100.0, 100.0, 200.0, 20.0)
            initial_value = 50.0;
            slider_result = initial_value;
        while key_typed(KeyCode.SpaceKey) is False:
            process_events()
            clear_screen()
            draw_text_no_font_no_size("Test: slider_at_position", color_black(), 10.0, 10.0)
            draw_text_no_font_no_size("Expected: Slider with initial value 50, range 0-100 at position (100,100)", color_black(), 10.0, 30.0)
            draw_text_no_font_no_size("Change the value and press space to pass", color_black(), 10.0, 50.0)
            slider_result = slider_at_position(slider_result, 0.0, 100.0, test_rect)
            draw_interface()
            refresh_screen()
            
            assert initial_value != slider_result
            
    def test_slider_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
            initial_value = 50.0;
            slider_result = initial_value;
        while key_typed(KeyCode.SpaceKey) is False:
            process_events()
            clear_screen()
            draw_text_no_font_no_size("Test: slider", color_black(), 10.0, 10.0)
            draw_text_no_font_no_size("Expected: Slider with initial value 50, range 0-100 using default layout", color_black(), 10.0, 30.0)
            draw_text_no_font_no_size("Change the value and press space to pass", color_black(), 10.0, 50.0)
            start_panel("Test Panel", rectangle_from(10.0, 70.0, 300.0, 200.0))
            slider_result = slider(slider_result, 0.0, 100.0)
            end_panel("Test Panel")
            draw_interface()
            refresh_screen()
            
            assert initial_value != slider_result
            
    def test_slider_labeled_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
            initial_value = 50.0;
            slider_result = initial_value;
        while key_typed(KeyCode.SpaceKey) is False:
            process_events()
            clear_screen()
            draw_text_no_font_no_size("Test: slider_labeled", color_black(), 10.0, 10.0)
            draw_text_no_font_no_size("Expected: Labeled slider with initial value 50, range 0-100 using default layout", color_black(), 10.0, 30.0)
            draw_text_no_font_no_size("Change the value and press space to pass", color_black(), 10.0, 50.0)
            start_panel("Test Panel", rectangle_from(10.0, 70.0, 300.0, 200.0))
            set_interface_label_width(100)
            slider_result = slider("Test Slider", slider_result, 0.0, 100.0)
            end_panel("Test Panel")
            draw_interface()
            refresh_screen()
            
            assert initial_value != slider_result
            
    def test_split_into_columns_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
        while key_typed(KeyCode.SpaceKey) is False:
            process_events()
            clear_screen()
            draw_text_no_font_no_size("Test: split_into_columns", color_black(), 10.0, 10.0)
            draw_text_no_font_no_size("Expected: Three buttons arranged in equal columns", color_black(), 10.0, 30.0)
            draw_text_no_font_no_size("Press space to end test", color_black(), 10.0, 50.0)
            start_panel("Test Panel", rectangle_from(10.0, 70.0, 300.0, 200.0))
            start_custom_layout()
            split_into_columns(3)
            button("Button 1")
            button("Button 2")
            button("Button 3")
            end_panel("Test Panel")
            draw_interface()
            refresh_screen()
            
            
    def test_split_into_columns_with_last_width_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
        while key_typed(KeyCode.SpaceKey) is False:
            process_events()
            clear_screen()
            draw_text_no_font_no_size("Test: split_into_columns_with_last_width", color_black(), 10.0, 10.0)
            draw_text_no_font_no_size("Expected: Three buttons with last column width 200px", color_black(), 10.0, 30.0)
            draw_text_no_font_no_size("Press space to end test", color_black(), 10.0, 50.0)
            start_panel("Test Panel", rectangle_from(10.0, 70.0, 300.0, 200.0))
            start_custom_layout()
            split_into_columns_with_last_width(3, 200)
            button("Button 1")
            button("Button 2")
            button("Button 3")
            end_panel("Test Panel")
            draw_interface()
            refresh_screen()
            
            
    def test_split_into_columns_relative_with_last_width_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
        while key_typed(KeyCode.SpaceKey) is False:
            process_events()
            clear_screen()
            draw_text_no_font_no_size("Test: split_into_columns_relative_with_last_width", color_black(), 10.0, 10.0)
            draw_text_no_font_no_size("Expected: Three buttons with last column 50% of panel width", color_black(), 10.0, 30.0)
            draw_text_no_font_no_size("Press space to end test", color_black(), 10.0, 50.0)
            start_panel("Test Panel", rectangle_from(10.0, 70.0, 300.0, 200.0))
            start_custom_layout()
            split_into_columns_relative_with_last_width(3, 0.5)
            button("Button 1")
            button("Button 2")
            button("Button 3")
            reset_layout()
            end_panel("Test Panel")
            draw_interface()
            refresh_screen()
            
            
    def test_start_custom_layout_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
        while key_typed(KeyCode.SpaceKey) is False:
            process_events()
            clear_screen()
            draw_text_no_font_no_size("Test: start_custom_layout", color_black(), 10.0, 10.0)
            draw_text_no_font_no_size("Expected: Button in 200px wide column", color_black(), 10.0, 30.0)
            draw_text_no_font_no_size("Press space to end test", color_black(), 10.0, 50.0)
            start_panel("Test Panel", rectangle_from(10.0, 70.0, 300.0, 200.0))
            start_custom_layout()
            add_column(200)
            button("Test Button")
            end_panel("Test Panel")
            draw_interface()
            refresh_screen()
            
            
    def test_start_inset_at_position_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
            test_rect = rectangle_from(10.0, 70.0, 300.0, 200.0)
        while key_typed(KeyCode.SpaceKey) is False:
            process_events()
            clear_screen()
            draw_text_no_font_no_size("Test: start_inset_at_position", color_black(), 10.0, 10.0)
            draw_text_no_font_no_size("Expected: An inset at position (10,70) containing a button using default layout", color_black(), 10.0, 30.0)
            draw_text_no_font_no_size("Press space to end test", color_black(), 10.0, 50.0)
            start_inset_at_position("test_inset", test_rect)
            button("Test Button")
            end_inset("test_inset")
            draw_interface()
            refresh_screen()
            
            
    def test_start_inset_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
        while key_typed(KeyCode.SpaceKey) is False:
            process_events()
            clear_screen_to_white()
            draw_text_no_font_no_size("Test: start_inset", color_black(), 10.0, 10.0)
            draw_text_no_font_no_size("Expected: An inset with height 60 pixels containing a button", color_black(), 10.0, 30.0)
            draw_text_no_font_no_size("Press space to end test", color_black(), 10.0, 50.0)
            start_panel("Test Panel", rectangle_from(0.0, 70.0, 800.0, 530.0))
            start_inset("Test Inset", 60)
            button("Test Button")
            end_inset("Test Inset")
            end_panel("Test Panel")
            draw_interface()
            refresh_screen()
            
            
    def test_start_panel_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
            test_rectangle = rectangle_from(10.0, 70.0, 300.0, 200.0)
        while key_typed(KeyCode.SpaceKey) is False:
            process_events()
            clear_screen()
            draw_text_no_font_no_size("Test: start_panel", color_black(), 10.0, 10.0)
            draw_text_no_font_no_size("Expected: Panel with button", color_black(), 10.0, 30.0)
            draw_text_no_font_no_size("Press space to end test", color_black(), 10.0, 50.0)
            start_panel("Test Panel", test_rectangle)
            button("Test Button")
            end_panel("Test Panel")
            draw_interface()
            refresh_screen()
            
            
    def test_start_popup_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
        while key_typed(KeyCode.SpaceKey) is False:
            process_events()
            clear_screen_to_white()
            draw_text_no_font_no_size("Test: start_popup", color_black(), 10.0, 10.0)
            draw_text_no_font_no_size("Expected: Click the button to show a popup with a label", color_black(), 10.0, 30.0)
            draw_text_no_font_no_size("Press space to end test", color_black(), 10.0, 50.0)
            start_panel("Test Panel", rectangle_from(0.0, 70.0, 800.0, 530.0))
            if button("Open Popup") is True:
                open_popup("Test Popup")
                
                if start_popup("Test Popup") is True:
                    single_line_layout()
                    set_interface_label_width(200)
                    label_element("Test Label")
                    end_popup("Test Popup")
                    
                    end_panel("Test Panel")
                    draw_interface()
                    refresh_screen()
                    
                    
    def test_start_treenode_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
        while key_typed(KeyCode.SpaceKey) is False:
            process_events()
            clear_screen_to_white()
            draw_text_no_font_no_size("Test: start_treenode", color_black(), 10.0, 10.0)
            draw_text_no_font_no_size("Expected: A panel containing a collapsible tree node with a button", color_black(), 10.0, 30.0)
            draw_text_no_font_no_size("Press space to end test", color_black(), 10.0, 50.0)
            start_panel("Test Panel", rectangle_from(10.0, 70.0, 200.0, 200.0))
            if start_treenode("Test Node") is True:
                button("Test Button")
                end_treenode("Test Node")
                
                end_panel("Test Panel")
                draw_interface()
                refresh_screen()
                
                
    def test_text_box_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
            initial_text = "Initial Text";
            text_result = initial_text;
        while key_typed(KeyCode.SpaceKey) is False:
            process_events()
            clear_screen()
            draw_text_no_font_no_size("Test: text_box", color_black(), 10.0, 10.0)
            draw_text_no_font_no_size("Expected: Text box with editable text", color_black(), 10.0, 30.0)
            draw_text_no_font_no_size("Change the text and press space to pass", color_black(), 10.0, 50.0)
            start_panel("Test Panel", rectangle_from(10.0, 70.0, 300.0, 200.0))
            text_result = text_box(text_result)
            end_panel("Test Panel")
            draw_interface()
            refresh_screen()
            
            assert initial_text != text_result
            
    def test_text_box_at_position_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
            test_rect = rectangle_from(10.0, 70.0, 300.0, 30.0)
            initial_text = "Initial Text";
            text_result = initial_text;
        while key_typed(KeyCode.SpaceKey) is False:
            process_events()
            clear_screen()
            draw_text_no_font_no_size("Test: text_box_at_position", color_black(), 10.0, 10.0)
            draw_text_no_font_no_size("Expected: Text box at position (10,70) with size 300x30", color_black(), 10.0, 30.0)
            draw_text_no_font_no_size("Change the text and press space to pass", color_black(), 10.0, 50.0)
            text_result = text_box_at_position(text_result, test_rect)
            draw_interface()
            refresh_screen()
            
            assert initial_text != text_result
            
    def test_text_box_labeled_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
            initial_text = "Initial Text";
            text_result = initial_text;
        while key_typed(KeyCode.SpaceKey) is False:
            process_events()
            clear_screen()
            draw_text_no_font_no_size("Test: text_box_labeled", color_black(), 10.0, 10.0)
            draw_text_no_font_no_size("Expected: Labeled text box with editable text", color_black(), 10.0, 30.0)
            draw_text_no_font_no_size("Change the text and press space to pass", color_black(), 10.0, 50.0)
            start_panel("Test Panel", rectangle_from(10.0, 70.0, 300.0, 200.0))
            set_interface_label_width(100)
            text_result = text_box_labeled("Test Text Box", text_result)
            end_panel("Test Panel")
            draw_interface()
            refresh_screen()
            
            assert initial_text != text_result
            
