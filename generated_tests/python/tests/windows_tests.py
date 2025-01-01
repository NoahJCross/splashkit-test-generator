import pytest
from splashkit import *
from ..helpers import *
import contextlib
class TestWindows:
    def test_clear_window_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
            color = color_black()
            clear_window(test_window, color)
            refresh_window(test_window)
            pixel = get_pixel_at_point(point_at(0.0, 0.0))
            assert color == pixel
            
    def test_close_all_windows_integration():
        open_window("Test Window 1", 800, 600)
        with window_cleanup():
            open_window("Test Window 2", 800, 600)
            close_all_windows()
            assert not has_window("Test Window 1")
            assert not has_window("Test Window 2")
            
    def test_close_current_window_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
            set_current_window(test_window)
            close_current_window()
            assert not has_window("Test Window")
            assert current_window() is None
            
    def test_close_window_named_integration():
        open_window("Test Window", 800, 600)
        with window_cleanup():
            assert has_window("Test Window")
            close_window_named("Test Window")
            assert not has_window("Test Window")
            
    def test_close_window_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
            window_name = window_caption(test_window)
            close_window(test_window)
            assert not has_window(window_name)
            
    def test_current_window_integration():
        test_window1 = open_window("Test Window 1", 800, 600)
        with window_cleanup():
            test_window2 = open_window("Test Window 2", 800, 600)
            set_current_window(test_window2)
            assert test_window2 == current_window()
            assert is_current_window(test_window2)
            assert not is_current_window(test_window1)
            
    def test_current_window_has_border_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
            set_current_window(test_window)
            assert current_window_has_border()
            current_window_toggle_border()
            assert not current_window_has_border()
            
    def test_current_window_height_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
            set_current_window(test_window)
            assert 600 == current_window_height()
            resize_current_window(800, 400)
            assert 400 == current_window_height()
            
    def test_current_window_is_fullscreen_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
            set_current_window(test_window)
            assert not current_window_is_fullscreen()
            current_window_toggle_fullscreen()
            assert current_window_is_fullscreen()
            
    def test_current_window_position_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
            set_current_window(test_window)
            move_current_window_to(100, 200)
            position = current_window_position()
            assert 68.0 == position.x
            assert 168.0 == position.y
            
    def test_current_window_toggle_border_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
            set_current_window(test_window)
            initial_border = current_window_has_border()
            current_window_toggle_border()
            assert initial_border != current_window_has_border()
            
    def test_current_window_toggle_fullscreen_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
            set_current_window(test_window)
            initial_fullscreen = current_window_is_fullscreen()
            current_window_toggle_fullscreen()
            assert initial_fullscreen != current_window_is_fullscreen()
            
    def test_current_window_width_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
            set_current_window(test_window)
            assert 800 == current_window_width()
            resize_current_window(400, 600)
            assert 400 == current_window_width()
            
    def test_current_window_x_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
            set_current_window(test_window)
            move_current_window_to(100, 200)
            assert 68 == current_window_x()
            move_current_window_to(300, 200)
            assert 268 == current_window_x()
            
    def test_current_window_y_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
            set_current_window(test_window)
            move_current_window_to(0, 100)
            assert 68 == current_window_y()
            
    def test_has_window_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
            assert has_window("Test Window")
            assert has_window(window_caption(test_window))
            close_window(test_window)
            assert not has_window("Test Window")
            
    def test_is_current_window_integration():
        test_window1 = open_window("Test Window 1", 800, 600)
        with window_cleanup():
            test_window2 = open_window("Test Window 2", 800, 600)
            set_current_window(test_window1)
            assert is_current_window(test_window1)
            assert not is_current_window(test_window2)
            
    def test_move_current_window_to_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
            set_current_window(test_window)
            move_current_window_to(100, 200)
            assert 68 == current_window_x()
            assert 168 == current_window_y()
            
    def test_move_window_to_named_integration():
        open_window("Test Window", 800, 600)
        with window_cleanup():
            move_window_to_named("Test Window", 150, 250)
            assert 118 == window_x_named("Test Window")
            assert 218 == window_y_named("Test Window")
            
    def test_move_window_to_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
            move_window_to(test_window, 200, 300)
            assert 168 == window_x(test_window)
            assert 268 == window_y(test_window)
            
    def test_open_window_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
            assert test_window is not None
            assert "Test Window" == window_caption(test_window)
            assert 800 == window_width(test_window)
            assert 600 == window_height(test_window)
            
    def test_refresh_window_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
            clear_window(test_window, color_white())
            draw_circle(color_black(), 400.0, 300.0, 50.0)
            refresh_window(test_window)
            pixel = get_pixel_at_point(point_at(400.0, 350.0))
            assert color_black() == pixel
            
    def test_refresh_window_with_target_fps_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
            refresh_window_with_target_fps(test_window, 60)
            
    def test_resize_current_window_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
            set_current_window(test_window)
            resize_current_window(1024, 768)
            assert 1024 == window_width(test_window)
            assert 768 == window_height(test_window)
            
    def test_resize_window_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
            resize_window(test_window, 1024, 768)
            assert 1024 == window_width(test_window)
            assert 768 == window_height(test_window)
            
    def test_set_current_window_named_integration():
        open_window("Test Window 1", 800, 600)
        with window_cleanup():
            test_window2 = open_window("Test Window 2", 800, 600)
            set_current_window_named("Test Window 2")
            assert test_window2 == current_window()
            
    def test_set_current_window_integration():
        open_window("Test Window 1", 800, 600)
        with window_cleanup():
            test_window2 = open_window("Test Window 2", 800, 600)
            set_current_window(test_window2)
            assert test_window2 == current_window()
            
    def test_window_caption_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
            assert "Test Window" == window_caption(test_window)
            
    def test_window_close_requested_named_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
            assert not window_close_requested_named("Test Window")
        while window_close_requested_named("Test Window") is False:
            process_events()
            clear_window(test_window, color_white())
            draw_text_no_font_no_size("Test: window_close_requested_named. Close window to pass.", color_black(), 10, 10)
            refresh_screen()
            
            assert window_close_requested_named("Test Window")
            
    def test_window_close_requested_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
            assert not window_close_requested(test_window)
        while window_close_requested(test_window) is False:
            process_events()
            clear_window(test_window, color_white())
            draw_text_no_font_no_size("Test: window_close_requested. Close window to pass.", color_black(), 10, 10)
            refresh_screen()
            
            assert window_close_requested(test_window)
            
    def test_window_has_border_named_integration():
        open_window("Test Window", 800, 600)
        with window_cleanup():
            assert window_has_border_named("Test Window")
            window_toggle_border_named("Test Window")
            assert not window_has_border_named("Test Window")
            
    def test_window_has_border_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
            assert window_has_border(test_window)
            window_toggle_border(test_window)
            assert not window_has_border(test_window)
            
    def test_window_has_focus_integration():
        test_window1 = open_window("Test Window 1", 800, 600)
        with window_cleanup():
            test_window2 = open_window("Test Window 2", 800, 600)
            process_events()
            assert window_has_focus(test_window2)
            assert not window_has_focus(test_window1)
            
    def test_window_height_named_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
            assert 600 == window_height_named("Test Window")
            resize_window(test_window, 800, 400)
            assert 400 == window_height_named("Test Window")
            
    def test_window_height_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
            assert 600 == window_height(test_window)
            resize_window(test_window, 800, 400)
            assert 400 == window_height(test_window)
            
    def test_window_is_fullscreen_named_integration():
        open_window("Test Window", 800, 600)
        with window_cleanup():
            assert not window_is_fullscreen_named("Test Window")
            window_toggle_fullscreen_named("Test Window")
            assert window_is_fullscreen_named("Test Window")
            
    def test_window_is_fullscreen_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
            assert not window_is_fullscreen(test_window)
            window_toggle_fullscreen(test_window)
            assert window_is_fullscreen(test_window)
            
    def test_window_named_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
            named_window = window_named("Test Window")
            assert test_window == named_window
            assert window_caption(test_window) == window_caption(named_window)
            
    def test_window_position_named_integration():
        open_window("Test Window", 800, 600)
        with window_cleanup():
            move_window_to_named("Test Window", 100, 200)
            delay(500)
            position = window_position_named("Test Window")
            assert 68.0 == position.x
            assert 168.0 == position.y
            
    def test_window_position_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
            move_window_to(test_window, 100, 200)
            delay(500)
            position = window_position(test_window)
            assert 68.0 == position.x
            assert 168.0 == position.y
            
    def test_window_set_icon_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
            icon = create_bitmap("test_icon", 32, 32)
            with bitmap_cleanup():
                clear_bitmap(icon, color_white())
                window_set_icon(test_window, icon)
                free_bitmap(icon)
                
    def test_window_toggle_border_named_integration():
        open_window("Test Window", 800, 600)
        with window_cleanup():
            assert window_has_border_named("Test Window")
            window_toggle_border_named("Test Window")
            assert not window_has_border_named("Test Window")
            
    def test_window_toggle_border_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
            assert window_has_border(test_window)
            window_toggle_border(test_window)
            assert not window_has_border(test_window)
            
    def test_window_toggle_fullscreen_named_integration():
        open_window("Test Window", 800, 600)
        with window_cleanup():
            assert not window_is_fullscreen_named("Test Window")
            window_toggle_fullscreen_named("Test Window")
            assert window_is_fullscreen_named("Test Window")
            
    def test_window_toggle_fullscreen_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
            assert not window_is_fullscreen(test_window)
            window_toggle_fullscreen(test_window)
            assert window_is_fullscreen(test_window)
            
    def test_window_width_named_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
            assert 800 == window_width_named("Test Window")
            resize_window(test_window, 1024, 600)
            assert 1024 == window_width_named("Test Window")
            
    def test_window_width_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
            assert 800 == window_width(test_window)
            resize_window(test_window, 1024, 600)
            assert 1024 == window_width(test_window)
            
    def test_window_with_focus_integration():
        test_window1 = open_window("Test Window 1", 800, 600)
        with window_cleanup():
            move_window_to(test_window1, 200, 200)
            delay(500)
            test_window2 = open_window("Test Window 2", 800, 600)
            move_window_to(test_window2, 850, 200)
            delay(500)
            assert test_window2 == window_with_focus()
        while window_with_focus() != test_window1:
            process_events()
            clear_screen()
            draw_text_no_font_no_size_with_options("Test: window_with_focus. Click this window to pass.", color_black(), 10, 10, option_draw_to_window(test_window1))
            refresh_screen()
            
            assert test_window1 == window_with_focus()
            
    def test_window_x_named_integration():
        open_window("Test Window", 800, 600)
        with window_cleanup():
            move_window_to_named("Test Window", 100, 200)
            assert 68 == window_x_named("Test Window")
            move_window_to_named("Test Window", 300, 200)
            assert 268 == window_x_named("Test Window")
            
    def test_window_x_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
            move_window_to(test_window, 100, 200)
            assert 68 == window_x(test_window)
            move_window_to(test_window, 300, 200)
            assert 268 == window_x(test_window)
            
    def test_window_y_named_integration():
        open_window("Test Window", 800, 600)
        with window_cleanup():
            move_window_to_named("Test Window", 100, 200)
            assert 168 == window_y_named("Test Window")
            move_window_to_named("Test Window", 100, 400)
            assert 368 == window_y_named("Test Window")
            
    def test_window_y_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
            move_window_to(test_window, 100, 200)
            assert 168 == window_y(test_window)
            move_window_to(test_window, 100, 400)
            assert 368 == window_y(test_window)
            
