import pytest
from splashkit import *
from ..helpers import *
import contextlib
class TestInput:
    def setup_method(self):
        set_resources_path("/mnt/c/Users/Noahc/Documents/aYear_2_semester_2/TeamProject/GitHubRepo/splashkit_test_generator/resources")

    def test_process_events_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
        while key_typed(KeyCode.AKey) is False:
            process_events()
            clear_screen_to_white()
            draw_text_no_font_no_size("Test: process_events", color_black(), 10.0, 10.0)
            draw_text_no_font_no_size("Press A to test events", color_black(), 10.0, 30.0)
            draw_text_no_font_no_size(f"Key Typed: {key_typed(KeyCode.AKey)}", color_black(), 10.0, 50.0)
            refresh_screen()
            
        while mouse_clicked(MouseButton.LeftButton) == false:
            process_events()
            clear_screen_to_white()
            draw_text_no_font_no_size("Test: process_events", color_black(), 10.0, 10.0)
            draw_text_no_font_no_size("Click left mouse button to test events", color_black(), 10.0, 30.0)
            draw_text_no_font_no_size(f"Mouse Clicked: {mouse_clicked(MouseButton.LeftButton)}", color_black(), 10.0, 50.0)
            refresh_screen()
            
            
    def test_quit_requested_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
        while quit_requested() == false:
            process_events()
            clear_screen_to_white()
            draw_text_no_font_no_size("Test: quit_requested", color_black(), 10.0, 10.0)
            draw_text_no_font_no_size("Close window to test quit requested", color_black(), 10.0, 30.0)
            draw_text_no_font_no_size(f"Quit Requested: {quit_requested()}", color_black(), 10.0, 50.0)
            refresh_screen()
            
            
    def test_reset_quit_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
        while quit_requested() == false:
            process_events()
            clear_screen_to_white()
            draw_text_no_font_no_size("Test: reset_quit", color_black(), 10.0, 10.0)
            draw_text_no_font_no_size("Close window to test reset quit", color_black(), 10.0, 30.0)
            draw_text_no_font_no_size(f"Quit Requested: {quit_requested()}", color_black(), 10.0, 50.0)
            refresh_screen()
            
            reset_quit()
        while key_down(KeyCode.SpaceKey) == false:
            process_events()
            clear_screen_to_white()
            draw_text_no_font_no_size("Test: reset_quit", color_black(), 10.0, 10.0)
            draw_text_no_font_no_size("Press Space to end test after reset quit", color_black(), 10.0, 30.0)
            draw_text_no_font_no_size(f"Key Down: {key_down(KeyCode.AKey)}", color_black(), 10.0, 50.0)
            refresh_screen()
            
            
    def test_any_key_pressed_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
        while any_key_pressed() == false:
            process_events()
            clear_screen_to_white()
            draw_text_no_font_no_size("Test: any_key_pressed", color_black(), 10.0, 10.0)
            draw_text_no_font_no_size("Press any key to test", color_black(), 10.0, 30.0)
            draw_text_no_font_no_size(f"Any Key Pressed: {any_key_pressed()}", color_black(), 10.0, 50.0)
            refresh_screen()
            
            assert any_key_pressed()
            
    def test_deregister_callback_on_key_down_integration():
        callbacks = key_callbacks();
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
            register_callback_on_key_down(callbacks.on_key_down)
        while callbacks.get_key_down != KeyCode.AKey:
            process_events()
            clear_screen_to_white()
            draw_text_no_font_no_size("Test: deregister_callback_on_key_down", color_black(), 10.0, 10.0)
            draw_text_no_font_no_size("Press A to test callback", color_black(), 10.0, 30.0)
            draw_text_no_font_no_size(f"Key Down: {key_down(KeyCode.AKey)}", color_black(), 10.0, 50.0)
            draw_text_no_font_no_size(f"Callback received: {key_name(callbacks.get_key_down)}", color_black(), 10.0, 70.0)
            refresh_screen()
            
            deregister_callback_on_key_down(callbacks.on_key_down)
        while key_down(KeyCode.SpaceKey) == false:
            process_events()
            clear_screen_to_white()
            draw_text_no_font_no_size("Test: deregister_callback_on_key_down", color_black(), 10.0, 10.0)
            draw_text_no_font_no_size("Press B to test deregistered callback on key down", color_black(), 10.0, 30.0)
            draw_text_no_font_no_size(f"Key Down: {key_down(KeyCode.BKey)}", color_black(), 10.0, 50.0)
            draw_text_no_font_no_size(f"Callback received: {key_name(callbacks.get_key_down)}", color_black(), 10.0, 70.0)
            draw_text_no_font_no_size("Press Space to end test", color_black(), 10.0, 90.0)
            refresh_screen()
            
            
    def test_deregister_callback_on_key_typed_integration():
        callbacks = key_callbacks();
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
            register_callback_on_key_typed(callbacks.on_key_typed)
        while callbacks.get_key_typed != KeyCode.AKey:
            process_events()
            clear_screen_to_white()
            draw_text_no_font_no_size("Test: deregister_callback_on_key_typed", color_black(), 10.0, 10.0)
            draw_text_no_font_no_size("Press A to test callback", color_black(), 10.0, 30.0)
            draw_text_no_font_no_size(f"Key Typed: {key_typed(KeyCode.AKey)}", color_black(), 10.0, 50.0)
            draw_text_no_font_no_size(f"Callback received: {key_name(callbacks.get_key_typed)}", color_black(), 10.0, 70.0)
            refresh_screen()
            
            deregister_callback_on_key_typed(callbacks.on_key_typed)
        while key_down(KeyCode.SpaceKey) == false:
            process_events()
            clear_screen_to_white()
            draw_text_no_font_no_size("Test: deregister_callback_on_key_typed", color_black(), 10.0, 10.0)
            draw_text_no_font_no_size("Press B to test deregistered callback on key typed", color_black(), 10.0, 30.0)
            draw_text_no_font_no_size(f"Key Typed: {key_typed(KeyCode.BKey)}", color_black(), 10.0, 50.0)
            draw_text_no_font_no_size(f"Callback received: {key_name(callbacks.get_key_typed)}", color_black(), 10.0, 70.0)
            draw_text_no_font_no_size("Press Space to end test", color_black(), 10.0, 90.0)
            refresh_screen()
            
            
    def test_deregister_callback_on_key_up_integration():
        callbacks = key_callbacks();
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
            register_callback_on_key_up(callbacks.on_key_up)
        while callbacks.get_key_up != KeyCode.AKey:
            process_events()
            clear_screen_to_white()
            draw_text_no_font_no_size("Test: deregister_callback_on_key_up", color_black(), 10.0, 10.0)
            draw_text_no_font_no_size("Press and release A to test callback", color_black(), 10.0, 30.0)
            draw_text_no_font_no_size(f"Key Up: {key_up(KeyCode.AKey)}", color_black(), 10.0, 50.0)
            draw_text_no_font_no_size(f"Callback received: {key_name(callbacks.get_key_up)}", color_black(), 10.0, 70.0)
            refresh_screen()
            
            deregister_callback_on_key_up(callbacks.on_key_up)
        while key_down(KeyCode.SpaceKey) == false:
            process_events()
            clear_screen_to_white()
            draw_text_no_font_no_size("Test: deregister_callback_on_key_up", color_black(), 10.0, 10.0)
            draw_text_no_font_no_size("Press and release B to test deregistered callback on key up", color_black(), 10.0, 30.0)
            draw_text_no_font_no_size(f"Key Up: {key_up(KeyCode.BKey)}", color_black(), 10.0, 50.0)
            draw_text_no_font_no_size(f"Callback received: {key_name(callbacks.get_key_up)}", color_black(), 10.0, 70.0)
            draw_text_no_font_no_size("Press Space to end test", color_black(), 10.0, 90.0)
            refresh_screen()
            
            
    def test_key_down_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
        while key_down(KeyCode.AKey) == false:
            process_events()
            clear_screen_to_white()
            draw_text_no_font_no_size("Test: key_down", color_black(), 10.0, 10.0)
            draw_text_no_font_no_size("Press and hold A", color_black(), 10.0, 30.0)
            draw_text_no_font_no_size(f"Key Down: {key_down(KeyCode.AKey)}", color_black(), 10.0, 50.0)
            refresh_screen()
            
        while key_down(KeyCode.AKey) != false:
            process_events()
            clear_screen_to_white()
            draw_text_no_font_no_size("Test: key_down", color_black(), 10.0, 10.0)
            draw_text_no_font_no_size("Release A", color_black(), 10.0, 30.0)
            draw_text_no_font_no_size(f"Key Down: {key_down(KeyCode.AKey)}", color_black(), 10.0, 50.0)
            refresh_screen()
            
            
    def test_key_name_integration():
        callbacks = key_callbacks();
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
            register_callback_on_key_typed(callbacks.on_key_typed)
        while key_down(KeyCode.AKey) == false:
            process_events()
            clear_screen_to_white()
            draw_text_no_font_no_size("Test: key_name", color_black(), 10.0, 10.0)
            draw_text_no_font_no_size("Press A to test key name", color_black(), 10.0, 30.0)
            draw_text_no_font_no_size(f"Key Name: {key_name(callbacks.get_key_typed)}", color_black(), 10.0, 50.0)
            refresh_screen()
            
        while key_down(KeyCode.ReturnKey) == false:
            process_events()
            clear_screen_to_white()
            draw_text_no_font_no_size("Test: key_name", color_black(), 10.0, 10.0)
            draw_text_no_font_no_size("Press Enter to test key name", color_black(), 10.0, 30.0)
            draw_text_no_font_no_size(f"Key Name: {key_name(callbacks.get_key_typed)}", color_black(), 10.0, 50.0)
            refresh_screen()
            
            
    def test_key_released_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
        while key_released(KeyCode.AKey) == false:
            process_events()
            clear_screen_to_white()
            draw_text_no_font_no_size("Test: key_released", color_black(), 10.0, 10.0)
            draw_text_no_font_no_size("Press and release A", color_black(), 10.0, 30.0)
            draw_text_no_font_no_size(f"Key Released: {key_released(KeyCode.AKey)}", color_black(), 10.0, 50.0)
            refresh_screen()
            
            
    def test_key_typed_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
        while key_typed(KeyCode.AKey) is False:
            process_events()
            clear_screen_to_white()
            draw_text_no_font_no_size("Test: key_typed", color_black(), 10.0, 10.0)
            draw_text_no_font_no_size("Press A to test key typed", color_black(), 10.0, 30.0)
            draw_text_no_font_no_size(f"Key Typed: {key_typed(KeyCode.AKey)}", color_black(), 10.0, 50.0)
            refresh_screen()
            
            
    def test_key_up_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
        while key_up(KeyCode.AKey) == false:
            process_events()
            clear_screen_to_white()
            draw_text_no_font_no_size("Test: key_up", color_black(), 10.0, 10.0)
            draw_text_no_font_no_size("Press and release A", color_black(), 10.0, 30.0)
            draw_text_no_font_no_size(f"Key Up: {key_up(KeyCode.AKey)}", color_black(), 10.0, 50.0)
            refresh_screen()
            
            
    def test_register_callback_on_key_down_integration():
        callbacks = key_callbacks();
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
            register_callback_on_key_down(callbacks.on_key_down)
        while callbacks.get_key_down != KeyCode.AKey:
            process_events()
            clear_screen_to_white()
            draw_text_no_font_no_size("Test: register_callback_on_key_down", color_black(), 10.0, 10.0)
            draw_text_no_font_no_size("Press A to test callback on key down", color_black(), 10.0, 30.0)
            draw_text_no_font_no_size(f"Key Down: {key_down(KeyCode.AKey)}", color_black(), 10.0, 50.0)
            draw_text_no_font_no_size(f"Callback received: {key_name(callbacks.get_key_down)}", color_black(), 10.0, 70.0)
            refresh_screen()
            
            deregister_callback_on_key_down(callbacks.on_key_down)
            
    def test_register_callback_on_key_typed_integration():
        callbacks = key_callbacks();
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
            register_callback_on_key_typed(callbacks.on_key_typed)
        while callbacks.get_key_typed != KeyCode.AKey:
            process_events()
            clear_screen_to_white()
            draw_text_no_font_no_size("Test: register_callback_on_key_typed", color_black(), 10.0, 10.0)
            draw_text_no_font_no_size("Press A to test callback on key typed", color_black(), 10.0, 30.0)
            draw_text_no_font_no_size(f"Key Typed: {key_typed(KeyCode.AKey)}", color_black(), 10.0, 50.0)
            draw_text_no_font_no_size(f"Callback received: {key_name(callbacks.get_key_typed)}", color_black(), 10.0, 70.0)
            refresh_screen()
            
            deregister_callback_on_key_typed(callbacks.on_key_typed)
            
    def test_register_callback_on_key_up_integration():
        callbacks = key_callbacks();
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
            register_callback_on_key_up(callbacks.on_key_up)
        while callbacks.get_key_up != KeyCode.AKey:
            process_events()
            clear_screen_to_white()
            draw_text_no_font_no_size("Test: register_callback_on_key_up", color_black(), 10.0, 10.0)
            draw_text_no_font_no_size("Press and release A to test callback on key up", color_black(), 10.0, 30.0)
            draw_text_no_font_no_size(f"Key Up: {key_up(KeyCode.AKey)}", color_black(), 10.0, 50.0)
            draw_text_no_font_no_size(f"Callback received: {key_name(callbacks.get_key_up)}", color_black(), 10.0, 70.0)
            refresh_screen()
            
            deregister_callback_on_key_up(callbacks.on_key_up)
            
    def test_hide_mouse_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
        while key_down(KeyCode.HKey) == false:
            process_events()
            clear_screen_to_white()
            draw_text_no_font_no_size("Test: hide_mouse", color_black(), 10.0, 10.0)
            draw_text_no_font_no_size("Press H to hide mouse", color_black(), 10.0, 30.0)
            draw_text_no_font_no_size(f"Mouse Shown: {mouse_shown()}", color_black(), 10.0, 50.0)
            refresh_screen()
            
            hide_mouse()
        while key_down(KeyCode.SpaceKey) == false:
            process_events()
            clear_screen_to_white()
            draw_text_no_font_no_size("Test: hide_mouse", color_black(), 10.0, 10.0)
            draw_text_no_font_no_size(f"Mouse Shown: {mouse_shown()}", color_black(), 10.0, 30.0)
            draw_text_no_font_no_size("Press Space to end test", color_black(), 10.0, 50.0)
            refresh_screen()
            
            show_mouse()
            
    def test_mouse_clicked_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
        while mouse_clicked(MouseButton.LeftButton) == false:
            process_events()
            clear_screen_to_white()
            draw_text_no_font_no_size("Test: mouse_clicked", color_black(), 10.0, 10.0)
            draw_text_no_font_no_size("Click left mouse button", color_black(), 10.0, 30.0)
            draw_text_no_font_no_size(f"Mouse Clicked: {mouse_clicked(MouseButton.LeftButton)}", color_black(), 10.0, 50.0)
            refresh_screen()
            
            
    def test_mouse_down_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
        while mouse_down(MouseButton.LeftButton) == false:
            process_events()
            clear_screen_to_white()
            draw_text_no_font_no_size("Test: mouse_down", color_black(), 10.0, 10.0)
            draw_text_no_font_no_size("Press and hold left mouse button", color_black(), 10.0, 30.0)
            draw_text_no_font_no_size(f"Mouse Down: {mouse_down(MouseButton.LeftButton)}", color_black(), 10.0, 50.0)
            refresh_screen()
            
        while mouse_down(MouseButton.LeftButton) != false:
            process_events()
            clear_screen_to_white()
            draw_text_no_font_no_size("Test: mouse_down", color_black(), 10.0, 10.0)
            draw_text_no_font_no_size("Release left mouse button", color_black(), 10.0, 30.0)
            draw_text_no_font_no_size(f"Mouse Down: {mouse_down(MouseButton.LeftButton)}", color_black(), 10.0, 50.0)
            refresh_screen()
            
            
    def test_mouse_movement_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
        while key_down(KeyCode.SpaceKey) == false:
            process_events()
            clear_screen_to_white()
            movement = mouse_movement()
            draw_text_no_font_no_size("Test: mouse_movement", color_black(), 10.0, 10.0)
            draw_text_no_font_no_size("Move mouse to test movement", color_black(), 10.0, 30.0)
            draw_text_no_font_no_size(f"Mouse Movement: X={movement.x}, Y={movement.y}", color_black(), 10.0, 50.0)
            draw_text_no_font_no_size("Press Space to end test", color_black(), 10.0, 70.0)
            refresh_screen()
            
            
    def test_mouse_position_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
        while key_down(KeyCode.SpaceKey) == false:
            process_events()
            clear_screen_to_white()
            position = mouse_position()
            draw_text_no_font_no_size("Test: mouse_position", color_black(), 10.0, 10.0)
            draw_text_no_font_no_size("Move mouse to test position", color_black(), 10.0, 30.0)
            draw_text_no_font_no_size(f"Mouse Position: X={position.x}, Y={position.y}", color_black(), 10.0, 50.0)
            draw_text_no_font_no_size("Press Space to end test", color_black(), 10.0, 70.0)
            refresh_screen()
            
            
    def test_mouse_position_vector_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
        while key_down(KeyCode.SpaceKey) == false:
            process_events()
            clear_screen_to_white()
            position = mouse_position_vector()
            draw_text_no_font_no_size("Test: mouse_position_vector", color_black(), 10.0, 10.0)
            draw_text_no_font_no_size("Move mouse to test position", color_black(), 10.0, 30.0)
            draw_text_no_font_no_size(f"Mouse Position: X={position.x}, Y={position.y}", color_black(), 10.0, 50.0)
            draw_text_no_font_no_size("Press Space to end test", color_black(), 10.0, 70.0)
            refresh_screen()
            
            
    def test_mouse_shown_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
        while key_down(KeyCode.HKey) == false:
            process_events()
            clear_screen_to_white()
            draw_text_no_font_no_size("Test: mouse_shown", color_black(), 10.0, 10.0)
            draw_text_no_font_no_size("Press H to hide mouse", color_black(), 10.0, 30.0)
            draw_text_no_font_no_size(f"Mouse Shown: {mouse_shown()}", color_black(), 10.0, 50.0)
            refresh_screen()
            
            hide_mouse()
            assert not mouse_shown()
        while key_down(KeyCode.SKey) == false:
            process_events()
            clear_screen_to_white()
            draw_text_no_font_no_size("Test: mouse_shown", color_black(), 10.0, 10.0)
            draw_text_no_font_no_size("Press S to show mouse", color_black(), 10.0, 30.0)
            draw_text_no_font_no_size(f"Mouse Shown: {mouse_shown()}", color_black(), 10.0, 50.0)
            refresh_screen()
            
            show_mouse()
            assert mouse_shown()
            
    def test_mouse_up_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
        while mouse_up(MouseButton.LeftButton) == false:
            process_events()
            clear_screen_to_white()
            draw_text_no_font_no_size("Test: mouse_up", color_black(), 10.0, 10.0)
            draw_text_no_font_no_size("Click and release left mouse button", color_black(), 10.0, 30.0)
            draw_text_no_font_no_size(f"Mouse Up: {mouse_up(MouseButton.LeftButton)}", color_black(), 10.0, 50.0)
            refresh_screen()
            
            
    def test_mouse_wheel_scroll_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
        while key_down(KeyCode.SpaceKey) == false:
            process_events()
            clear_screen_to_white()
            scroll = mouse_wheel_scroll()
            draw_text_no_font_no_size("Test: mouse_wheel_scroll", color_black(), 10.0, 10.0)
            draw_text_no_font_no_size("Scroll mouse wheel to test", color_black(), 10.0, 30.0)
            draw_text_no_font_no_size(f"Scroll Value: X={scroll.x}, Y={scroll.y}", color_black(), 10.0, 50.0)
            draw_text_no_font_no_size("Press Space to end test", color_black(), 10.0, 70.0)
            refresh_screen()
            
            
    def test_mouse_x_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
        while key_down(KeyCode.SpaceKey) == false:
            process_events()
            clear_screen_to_white()
            draw_text_no_font_no_size("Test: mouse_x", color_black(), 10.0, 10.0)
            draw_text_no_font_no_size("Move mouse to test X position", color_black(), 10.0, 30.0)
            draw_text_no_font_no_size(f"Mouse Position: X={mouse_x()}, Y={mouse_y()}", color_black(), 10.0, 50.0)
            draw_text_no_font_no_size("Press Space to end test", color_black(), 10.0, 70.0)
            refresh_screen()
            
            
    def test_mouse_y_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
        while key_down(KeyCode.SpaceKey) == false:
            process_events()
            clear_screen_to_white()
            draw_text_no_font_no_size("Test: mouse_y", color_black(), 10.0, 10.0)
            draw_text_no_font_no_size("Move mouse to test Y position", color_black(), 10.0, 30.0)
            draw_text_no_font_no_size(f"Mouse Position: X={mouse_x()}, Y={mouse_y()}", color_black(), 10.0, 50.0)
            draw_text_no_font_no_size("Press Space to end test", color_black(), 10.0, 70.0)
            refresh_screen()
            
            
    def test_move_mouse_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
        while key_down(KeyCode.MKey) == false:
            process_events()
            clear_screen_to_white()
            draw_text_no_font_no_size("Test: move_mouse", color_black(), 10.0, 10.0)
            draw_text_no_font_no_size("Press M to move mouse to center", color_black(), 10.0, 30.0)
            draw_text_no_font_no_size(f"Mouse Position: X={mouse_x()}, Y={mouse_y()}", color_black(), 10.0, 50.0)
            refresh_screen()
            
        while key_down(KeyCode.SpaceKey) == false:
            process_events()
            clear_screen_to_white()
            draw_text_no_font_no_size("Test: move_mouse", color_black(), 10.0, 10.0)
            draw_text_no_font_no_size("Mouse moved to center", color_black(), 10.0, 30.0)
            draw_text_no_font_no_size(f"Mouse Position: X={mouse_x()}, Y={mouse_y()}", color_black(), 10.0, 50.0)
            draw_text_no_font_no_size("Press Space to end test", color_black(), 10.0, 70.0)
            move_mouse(400.0, 300.0)
            refresh_screen()
            
            
    def test_move_mouse_to_point_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
        while key_down(KeyCode.MKey) == false:
            process_events()
            clear_screen_to_white()
            draw_text_no_font_no_size("Test: move_mouse_to_point", color_black(), 10.0, 10.0)
            draw_text_no_font_no_size("Press M to move mouse to center", color_black(), 10.0, 30.0)
            draw_text_no_font_no_size(f"Mouse Position: X={mouse_x()}, Y={mouse_y()}", color_black(), 10.0, 50.0)
            refresh_screen()
            
        while key_down(KeyCode.SpaceKey) == false:
            process_events()
            clear_screen_to_white()
            draw_text_no_font_no_size("Test: move_mouse_to_point", color_black(), 10.0, 10.0)
            draw_text_no_font_no_size("Mouse moved to center", color_black(), 10.0, 30.0)
            draw_text_no_font_no_size(f"Mouse Position: X={mouse_x()}, Y={mouse_y()}", color_black(), 10.0, 50.0)
            draw_text_no_font_no_size("Press Space to end test", color_black(), 10.0, 70.0)
            move_mouse_to_point(point_at(400.0, 300.0))
            refresh_screen()
            
            
    def test_show_mouse_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
            hide_mouse()
        while key_down(KeyCode.SKey) == false:
            process_events()
            clear_screen_to_white()
            draw_text_no_font_no_size("Test: show_mouse", color_black(), 10.0, 10.0)
            draw_text_no_font_no_size("Press S to show mouse", color_black(), 10.0, 30.0)
            draw_text_no_font_no_size(f"Mouse Shown: {mouse_shown()}", color_black(), 10.0, 50.0)
            refresh_screen()
            
            show_mouse()
        while key_down(KeyCode.SpaceKey) == false:
            process_events()
            clear_screen_to_white()
            draw_text_no_font_no_size("Test: show_mouse", color_black(), 10.0, 10.0)
            draw_text_no_font_no_size(f"Mouse Shown: {mouse_shown()}", color_black(), 10.0, 30.0)
            draw_text_no_font_no_size("Press Space to end test", color_black(), 10.0, 50.0)
            refresh_screen()
            
            
    def test_show_mouse_with_boolean_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
        while key_down(KeyCode.HKey) == false:
            process_events()
            clear_screen_to_white()
            draw_text_no_font_no_size("Test: show_mouse_with_boolean", color_black(), 10.0, 10.0)
            draw_text_no_font_no_size("Press H to hide mouse", color_black(), 10.0, 30.0)
            draw_text_no_font_no_size(f"Mouse Shown: {mouse_shown()}", color_black(), 10.0, 50.0)
            refresh_screen()
            
            show_mouse_with_boolean(false)
            assert not mouse_shown()
        while key_down(KeyCode.SKey) == false:
            process_events()
            clear_screen_to_white()
            draw_text_no_font_no_size("Test: show_mouse_with_boolean", color_black(), 10.0, 10.0)
            draw_text_no_font_no_size("Press S to show mouse", color_black(), 10.0, 30.0)
            draw_text_no_font_no_size(f"Mouse Shown: {mouse_shown()}", color_black(), 10.0, 50.0)
            refresh_screen()
            
            show_mouse_with_boolean(true)
            assert mouse_shown()
            
    def test_draw_collected_text_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
            test_font = load_font("test_font", "hara.ttf")
            with font_cleanup():
                start_reading_text(rectangle_from(100.0, 100.0, 200.0, 30.0))
        while key_down(KeyCode.ReturnKey) == false:
            process_events()
            clear_screen_to_white()
            draw_text_no_font_no_size("Test: draw_collected_text", color_black(), 10.0, 10.0)
            draw_text_no_font_no_size("Type some text, press Enter when done", color_black(), 10.0, 30.0)
            draw_collected_text(color_black(), test_font, 18, option_defaults())
            refresh_screen()
            
            end_reading_text_in_window(test_window)
            
    def test_end_reading_text_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
            start_reading_text(rectangle_from(100.0, 100.0, 200.0, 30.0))
            assert reading_text()
        while key_down(KeyCode.ReturnKey) == false:
            process_events()
            clear_screen_to_white()
            draw_text_no_font_no_size("Test: end_reading_text", color_black(), 10.0, 10.0)
            draw_text_no_font_no_size("Type some text, press Enter when done", color_black(), 10.0, 30.0)
            draw_text_no_font_no_size(f"Reading Text: {reading_text()}", color_black(), 10.0, 50.0)
            refresh_screen()
            
            end_reading_text()
            assert not reading_text()
        while key_down(KeyCode.SpaceKey) == false:
            process_events()
            clear_screen_to_white()
            draw_text_no_font_no_size("Test: end_reading_text", color_black(), 10.0, 10.0)
            draw_text_no_font_no_size("Text input ended", color_black(), 10.0, 30.0)
            draw_text_no_font_no_size(f"Reading Text: {reading_text()}", color_black(), 10.0, 50.0)
            draw_text_no_font_no_size("Press Space to end test", color_black(), 10.0, 70.0)
            refresh_screen()
            
            
    def test_end_reading_text_in_window_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
            test_rectangle = rectangle_from(100.0, 100.0, 200.0, 30.0)
            start_reading_text_in_window(test_window, test_rectangle)
            assert reading_text()
        while key_down(KeyCode.ReturnKey) == false:
            process_events()
            clear_screen_to_white()
            draw_text_no_font_no_size("Test: end_reading_text_in_window", color_black(), 10.0, 10.0)
            draw_text_no_font_no_size("Type some text, press Enter when done", color_black(), 10.0, 30.0)
            draw_text_no_font_no_size(f"Reading Text: {reading_text_in_window(test_window)}", color_black(), 10.0, 50.0)
            refresh_screen()
            
            end_reading_text_in_window(test_window)
            assert not reading_text()
        while key_down(KeyCode.SpaceKey) == false:
            process_events()
            clear_screen_to_white()
            draw_text_no_font_no_size("Test: end_reading_text_in_window", color_black(), 10.0, 10.0)
            draw_text_no_font_no_size("Text input ended", color_black(), 10.0, 30.0)
            draw_text_no_font_no_size(f"Reading Text: {reading_text_in_window(test_window)}", color_black(), 10.0, 50.0)
            draw_text_no_font_no_size("Press Space to end test", color_black(), 10.0, 70.0)
            refresh_screen()
            
            
    def test_reading_text_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
            start_reading_text(rectangle_from(100.0, 100.0, 200.0, 30.0))
            assert reading_text()
        while key_down(KeyCode.ReturnKey) == false:
            process_events()
            clear_screen_to_white()
            draw_text_no_font_no_size("Test: reading_text", color_black(), 10.0, 10.0)
            draw_text_no_font_no_size("Type some text, press Enter when done", color_black(), 10.0, 30.0)
            draw_text_no_font_no_size(f"Reading Text: {reading_text()}", color_black(), 10.0, 50.0)
            refresh_screen()
            
            end_reading_text_in_window(test_window)
            assert not reading_text()
            
    def test_reading_text_in_window_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
            test_rectangle = rectangle_from(100.0, 100.0, 200.0, 30.0)
            start_reading_text_in_window(test_window, test_rectangle)
            assert reading_text_in_window(test_window)
        while key_down(KeyCode.ReturnKey) == false:
            process_events()
            clear_screen_to_white()
            draw_text_no_font_no_size("Test: reading_text_in_window", color_black(), 10.0, 10.0)
            draw_text_no_font_no_size("Type some text, press Enter when done", color_black(), 10.0, 30.0)
            draw_text_no_font_no_size(f"Reading Text: {reading_text_in_window(test_window)}", color_black(), 10.0, 50.0)
            refresh_screen()
            
            end_reading_text_in_window(test_window)
            assert not reading_text_in_window(test_window)
            
    def test_start_reading_text_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
            test_rect = rectangle_from(100.0, 100.0, 200.0, 30.0)
            start_reading_text(test_rect)
            assert reading_text()
        while key_down(KeyCode.ReturnKey) == false:
            process_events()
            clear_screen_to_white()
            draw_text_no_font_no_size("Test: start_reading_text", color_black(), 10.0, 10.0)
            draw_text_no_font_no_size("Type some text, press Enter when done", color_black(), 10.0, 30.0)
            draw_text_no_font_no_size(f"Current Text: {text_input()}", color_black(), 10.0, 50.0)
            refresh_screen()
            
            end_reading_text_in_window(test_window)
            assert not reading_text()
            
    def test_start_reading_text_with_initial_text_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
            test_rect = rectangle_from(100.0, 100.0, 200.0, 30.0)
            start_reading_text_with_initial_text(test_rect, "Initial Text")
            assert reading_text()
        while key_down(KeyCode.ReturnKey) == false:
            process_events()
            clear_screen_to_white()
            draw_text_no_font_no_size("Test: start_reading_text_with_initial_text", color_black(), 10.0, 10.0)
            draw_text_no_font_no_size("Type some text, press Enter when done", color_black(), 10.0, 30.0)
            draw_text_no_font_no_size(f"Current Text: {text_input()}", color_black(), 10.0, 50.0)
            refresh_screen()
            
            end_reading_text_in_window(test_window)
            assert not reading_text()
            
    def test_start_reading_text_in_window_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
            test_rect = rectangle_from(100.0, 100.0, 200.0, 30.0)
            start_reading_text_in_window(test_window, test_rect)
            assert reading_text()
        while key_down(KeyCode.ReturnKey) == false:
            process_events()
            clear_screen_to_white()
            draw_text_no_font_no_size("Test: start_reading_text_in_window", color_black(), 10.0, 10.0)
            draw_text_no_font_no_size("Type some text, press Enter when done", color_black(), 10.0, 30.0)
            draw_text_no_font_no_size(f"Current Text: {text_input_in_window(test_window)}", color_black(), 10.0, 50.0)
            refresh_screen()
            
            end_reading_text_in_window(test_window)
            assert not reading_text()
            
    def test_start_reading_text_in_window_with_initial_text_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
            test_rect = rectangle_from(100.0, 100.0, 200.0, 30.0)
            start_reading_text_in_window_with_initial_text(test_window, test_rect, "Initial Text")
            assert reading_text()
        while key_down(KeyCode.ReturnKey) == false:
            process_events()
            clear_screen_to_white()
            draw_text_no_font_no_size("Test: start_reading_text_in_window_with_initial_text", color_black(), 10.0, 10.0)
            draw_text_no_font_no_size("Type some text, press Enter when done", color_black(), 10.0, 30.0)
            draw_text_no_font_no_size(f"Current Text: {text_input_in_window(test_window)}", color_black(), 10.0, 50.0)
            refresh_screen()
            
            end_reading_text_in_window(test_window)
            assert not reading_text()
            
    def test_text_entry_cancelled_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
            start_reading_text(rectangle_from(100.0, 100.0, 200.0, 30.0))
        while key_down(KeyCode.SpaceKey) == false:
            process_events()
            clear_screen_to_white()
            draw_text_no_font_no_size("Test: text_entry_cancelled", color_black(), 10.0, 10.0)
            draw_text_no_font_no_size("Press Escape to cancel text entry", color_black(), 10.0, 30.0)
            draw_text_no_font_no_size(f"Text Entry Cancelled: {text_entry_cancelled()}", color_black(), 10.0, 50.0)
            draw_text_no_font_no_size("Press space to end test", color_black(), 10.0, 70.0)
            refresh_screen()
            
            assert text_entry_cancelled()
            end_reading_text_in_window(test_window)
            
    def test_text_entry_cancelled_in_window_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
            test_rect = rectangle_from(100.0, 100.0, 200.0, 30.0)
            start_reading_text_in_window(test_window, test_rect)
        while key_down(KeyCode.SpaceKey) == false:
            process_events()
            clear_screen_to_white()
            draw_text_no_font_no_size("Test: text_entry_cancelled_in_window", color_black(), 10.0, 10.0)
            draw_text_no_font_no_size("Press Escape to cancel text entry", color_black(), 10.0, 30.0)
            draw_text_no_font_no_size(f"Text Entry Cancelled: {text_entry_cancelled_in_window(test_window)}", color_black(), 10.0, 50.0)
            draw_text_no_font_no_size("Press space to end test", color_black(), 10.0, 70.0)
            refresh_screen()
            
            assert text_entry_cancelled_in_window(test_window)
            end_reading_text_in_window(test_window)
            
    def test_text_input_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
            start_reading_text(rectangle_from(100.0, 100.0, 200.0, 30.0))
        while key_down(KeyCode.ReturnKey) == false:
            process_events()
            clear_screen_to_white()
            draw_text_no_font_no_size("Test: text_input", color_black(), 10.0, 10.0)
            draw_text_no_font_no_size("Type some text, press Enter when done", color_black(), 10.0, 30.0)
            draw_text_no_font_no_size(f"Current Text: {text_input()}", color_black(), 10.0, 50.0)
            refresh_screen()
            
            end_reading_text_in_window(test_window)
            
    def test_text_input_in_window_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
            test_rect = rectangle_from(100.0, 100.0, 200.0, 30.0)
            start_reading_text_in_window(test_window, test_rect)
        while key_down(KeyCode.ReturnKey) == false:
            process_events()
            clear_screen_to_white()
            draw_text_no_font_no_size("Test: text_input_in_window", color_black(), 10.0, 10.0)
            draw_text_no_font_no_size("Type some text, press Enter when done", color_black(), 10.0, 30.0)
            draw_text_no_font_no_size(f"Current Text: {text_input_in_window(test_window)}", color_black(), 10.0, 50.0)
            refresh_screen()
            
            end_reading_text_in_window(test_window)
            
