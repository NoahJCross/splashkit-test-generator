import pytest
from splashkit import *

class TestInput:

def test_process_events_integration():
    test_window = open_window("Test Window", 800, 600)
    while key_typed(KeyCode.AKey) == false:
        process_events()
        clear_screen_to_white()
        draw_text_no_font_no_size("Press A to test events", color_black(), 10.0, 10.0)
        draw_text_no_font_no_size(f"Key Typed: {key_typed(KeyCode.AKey)}", color_black(), 10.0, 30.0)
        refresh_screen()
    
    while mouse_clicked(MouseButton.LeftButton) == false:
        process_events()
        clear_screen_to_white()
        draw_text_no_font_no_size("Click left mouse button to test events", color_black(), 10.0, 10.0)
        draw_text_no_font_no_size(f"Mouse Clicked: {mouse_clicked(MouseButton.LeftButton)}", color_black(), 10.0, 30.0)
        refresh_screen()
    
    close_window(test_window)


def test_quit_requested_integration():
    test_window = open_window("Test Window", 800, 600)
    while quit_requested() == false:
        process_events()
        clear_screen_to_white()
        draw_text_no_font_no_size("Press Escape to test quit", color_black(), 10.0, 10.0)
        draw_text_no_font_no_size(f"Quit Requested: {quit_requested()}", color_black(), 10.0, 30.0)
        refresh_screen()
    
    close_window(test_window)


def test_reset_quit_integration():
    test_window = open_window("Test Window", 800, 600)
    while quit_requested() == false:
        process_events()
        clear_screen_to_white()
        draw_text_no_font_no_size("Press Escape to test quit", color_black(), 10.0, 10.0)
        draw_text_no_font_no_size(f"Quit Requested: {quit_requested()}", color_black(), 10.0, 30.0)
        refresh_screen()
        reset_quit()
    
    while key_down(KeyCode.AKey) == false:
        process_events()
        clear_screen_to_white()
        draw_text_no_font_no_size("Press A to continue after reset", color_black(), 10.0, 10.0)
        draw_text_no_font_no_size(f"Key Down: {key_down(KeyCode.AKey)}", color_black(), 10.0, 30.0)
        refresh_screen()
    
    close_window(test_window)


def test_any_key_pressed_integration():
    test_window = open_window("Test Window", 800, 600)
    while any_key_pressed() == false:
        process_events()
        clear_screen_to_white()
        draw_text_no_font_no_size("Press any key to test", color_black(), 10.0, 10.0)
        draw_text_no_font_no_size(f"Any Key Pressed: {any_key_pressed()}", color_black(), 10.0, 30.0)
        refresh_screen()
    
    close_window(test_window)


def test_deregister_callback_on_key_down_integration():
    callbacks = key_callbacks();
    test_window = open_window("Test Window", 800, 600)
    register_callback_on_key_down(callbacks.on_key_down)
    while key_down(KeyCode.AKey) == false:
        process_events()
        clear_screen_to_white()
        draw_text_no_font_no_size("Press A to test callback", color_black(), 10.0, 10.0)
        draw_text_no_font_no_size(f"Key Down: {key_down(KeyCode.AKey)}", color_black(), 10.0, 30.0)
        draw_text_no_font_no_size(f"Callback received: {callbacks.get_key_down}", color_black(), 10.0, 50.0)
        refresh_screen()
        deregister_callback_on_key_down(callbacks.on_key_down)
    
    while key_down(KeyCode.BKey) == false:
        process_events()
        clear_screen_to_white()
        draw_text_no_font_no_size("Press B to test deregistered callback", color_black(), 10.0, 10.0)
        draw_text_no_font_no_size(f"Key Down: {key_down(KeyCode.BKey)}", color_black(), 10.0, 30.0)
        draw_text_no_font_no_size(f"Callback received: {callbacks.get_key_down}", color_black(), 10.0, 50.0)
        refresh_screen()
    
    close_window(test_window)


def test_deregister_callback_on_key_typed_integration():
    callbacks = key_callbacks();
    test_window = open_window("Test Window", 800, 600)
    register_callback_on_key_typed(callbacks.on_key_typed)
    while key_typed(KeyCode.AKey) == false:
        process_events()
        clear_screen_to_white()
        draw_text_no_font_no_size("Press A to test callback", color_black(), 10.0, 10.0)
        draw_text_no_font_no_size(f"Key Typed: {key_typed(KeyCode.AKey)}", color_black(), 10.0, 30.0)
        draw_text_no_font_no_size(f"Callback received: {callbacks.get_key_typed}", color_black(), 10.0, 50.0)
        refresh_screen()
        deregister_callback_on_key_typed(callbacks.on_key_typed)
    
    while key_typed(KeyCode.BKey) == false:
        process_events()
        clear_screen_to_white()
        draw_text_no_font_no_size("Press B to test deregistered callback", color_black(), 10.0, 10.0)
        draw_text_no_font_no_size(f"Key Typed: {key_typed(KeyCode.BKey)}", color_black(), 10.0, 30.0)
        draw_text_no_font_no_size(f"Callback received: {callbacks.get_key_typed}", color_black(), 10.0, 50.0)
        refresh_screen()
    
    close_window(test_window)


def test_deregister_callback_on_key_up_integration():
    callbacks = key_callbacks();
    test_window = open_window("Test Window", 800, 600)
    register_callback_on_key_up(callbacks.on_key_up)
    while key_up(KeyCode.AKey) == false:
        process_events()
        clear_screen_to_white()
        draw_text_no_font_no_size("Press and release A to test callback", color_black(), 10.0, 10.0)
        draw_text_no_font_no_size(f"Key Up: {key_up(KeyCode.AKey)}", color_black(), 10.0, 30.0)
        draw_text_no_font_no_size(f"Callback received: {callbacks.get_key_up}", color_black(), 10.0, 50.0)
        refresh_screen()
        deregister_callback_on_key_up(callbacks.on_key_up)
    
    while key_up(KeyCode.BKey) == false:
        process_events()
        clear_screen_to_white()
        draw_text_no_font_no_size("Press and release B to test deregistered callback", color_black(), 10.0, 10.0)
        draw_text_no_font_no_size(f"Key Up: {key_up(KeyCode.BKey)}", color_black(), 10.0, 30.0)
        draw_text_no_font_no_size(f"Callback received: {callbacks.get_key_up}", color_black(), 10.0, 50.0)
        refresh_screen()
    
    close_window(test_window)


def test_key_down_integration():
    test_window = open_window("Test Window", 800, 600)
    while key_down(KeyCode.AKey) == false:
        process_events()
        clear_screen_to_white()
        draw_text_no_font_no_size("Press and hold A", color_black(), 10.0, 10.0)
        draw_text_no_font_no_size(f"Key Down: {key_down(KeyCode.AKey)}", color_black(), 10.0, 30.0)
        refresh_screen()
    
    while key_down(KeyCode.AKey) != false:
        process_events()
        clear_screen_to_white()
        draw_text_no_font_no_size("Release A", color_black(), 10.0, 10.0)
        draw_text_no_font_no_size(f"Key Down: {key_down(KeyCode.AKey)}", color_black(), 10.0, 30.0)
        refresh_screen()
    
    close_window(test_window)


def test_key_name_integration():
    test_window = open_window("Test Window", 800, 600)
    while key_down(KeyCode.AKey) == false:
        process_events()
        clear_screen_to_white()
        draw_text_no_font_no_size("Press A to test key name", color_black(), 10.0, 10.0)
        draw_text_no_font_no_size(f"Key Name: {key_name(KeyCode.AKey)}", color_black(), 10.0, 30.0)
        refresh_screen()
    
    while key_down(KeyCode.KeypadEnter) == false:
        process_events()
        clear_screen_to_white()
        draw_text_no_font_no_size("Press Enter to test key name", color_black(), 10.0, 10.0)
        draw_text_no_font_no_size(f"Key Name: {key_name(KeyCode.KeypadEnter)}", color_black(), 10.0, 30.0)
        refresh_screen()
    
    close_window(test_window)


def test_key_released_integration():
    test_window = open_window("Test Window", 800, 600)
    while key_released(KeyCode.AKey) == false:
        process_events()
        clear_screen_to_white()
        draw_text_no_font_no_size("Press and release A", color_black(), 10.0, 10.0)
        draw_text_no_font_no_size(f"Key Released: {key_released(KeyCode.AKey)}", color_black(), 10.0, 30.0)
        refresh_screen()
    
    close_window(test_window)


def test_key_typed_integration():
    test_window = open_window("Test Window", 800, 600)
    while key_typed(KeyCode.AKey) == false:
        process_events()
        clear_screen_to_white()
        draw_text_no_font_no_size("Press A to test key typed", color_black(), 10.0, 10.0)
        draw_text_no_font_no_size(f"Key Typed: {key_typed(KeyCode.AKey)}", color_black(), 10.0, 30.0)
        refresh_screen()
    
    close_window(test_window)


def test_key_up_integration():
    test_window = open_window("Test Window", 800, 600)
    while key_up(KeyCode.AKey) == false:
        process_events()
        clear_screen_to_white()
        draw_text_no_font_no_size("Press and release A", color_black(), 10.0, 10.0)
        draw_text_no_font_no_size(f"Key Up: {key_up(KeyCode.AKey)}", color_black(), 10.0, 30.0)
        refresh_screen()
    
    close_window(test_window)


def test_register_callback_on_key_down_integration():
    callbacks = key_callbacks();
    test_window = open_window("Test Window", 800, 600)
    register_callback_on_key_down(callbacks.on_key_down)
    while key_down(KeyCode.AKey) == false:
        process_events()
        clear_screen_to_white()
        draw_text_no_font_no_size("Press A to test callback", color_black(), 10.0, 10.0)
        draw_text_no_font_no_size(f"Key Down: {key_down(KeyCode.AKey)}", color_black(), 10.0, 30.0)
        draw_text_no_font_no_size(f"Callback received: {callbacks.get_key_down}", color_black(), 10.0, 50.0)
        refresh_screen()
    
    deregister_callback_on_key_down(callbacks.on_key_down)
    close_window(test_window)


def test_register_callback_on_key_typed_integration():
    callbacks = key_callbacks();
    test_window = open_window("Test Window", 800, 600)
    register_callback_on_key_typed(callbacks.on_key_typed)
    while key_typed(KeyCode.AKey) == false:
        process_events()
        clear_screen_to_white()
        draw_text_no_font_no_size("Press A to test callback", color_black(), 10.0, 10.0)
        draw_text_no_font_no_size(f"Key Typed: {key_typed(KeyCode.AKey)}", color_black(), 10.0, 30.0)
        draw_text_no_font_no_size(f"Callback received: {callbacks.get_key_typed}", color_black(), 10.0, 50.0)
        refresh_screen()
    
    deregister_callback_on_key_typed(callbacks.on_key_typed)
    close_window(test_window)


def test_register_callback_on_key_up_integration():
    callbacks = key_callbacks();
    test_window = open_window("Test Window", 800, 600)
    register_callback_on_key_up(callbacks.on_key_up)
    while key_up(KeyCode.AKey) == false:
        process_events()
        clear_screen_to_white()
        draw_text_no_font_no_size("Press and release A to test callback", color_black(), 10.0, 10.0)
        draw_text_no_font_no_size(f"Key Up: {key_up(KeyCode.AKey)}", color_black(), 10.0, 30.0)
        draw_text_no_font_no_size(f"Callback received: {callbacks.get_key_up}", color_black(), 10.0, 50.0)
        refresh_screen()
    
    deregister_callback_on_key_up(callbacks.on_key_up)
    close_window(test_window)


def test_hide_mouse_integration():
    test_window = open_window("Test Window", 800, 600)
    while key_down(KeyCode.HKey) == false:
        process_events()
        clear_screen_to_white()
        draw_text_no_font_no_size("Press H to hide mouse", color_black(), 10.0, 10.0)
        draw_text_no_font_no_size(f"Mouse Shown: {mouse_shown()}", color_black(), 10.0, 30.0)
        refresh_screen()
        hide_mouse()
    
    while key_down(KeyCode.SKey) == false:
        process_events()
        clear_screen_to_white()
        draw_text_no_font_no_size("Press S to show mouse", color_black(), 10.0, 10.0)
        draw_text_no_font_no_size(f"Mouse Shown: {mouse_shown()}", color_black(), 10.0, 30.0)
        refresh_screen()
    
    show_mouse()
    close_window(test_window)


def test_mouse_clicked_integration():
    test_window = open_window("Test Window", 800, 600)
    while mouse_clicked(MouseButton.LeftButton) == false:
        process_events()
        clear_screen_to_white()
        draw_text_no_font_no_size("Click left mouse button", color_black(), 10.0, 10.0)
        draw_text_no_font_no_size(f"Mouse Clicked: {mouse_clicked(MouseButton.LeftButton)}", color_black(), 10.0, 30.0)
        refresh_screen()
    
    close_window(test_window)


def test_mouse_down_integration():
    test_window = open_window("Test Window", 800, 600)
    while mouse_down(MouseButton.LeftButton) == false:
        process_events()
        clear_screen_to_white()
        draw_text_no_font_no_size("Press and hold left mouse button", color_black(), 10.0, 10.0)
        draw_text_no_font_no_size(f"Mouse Down: {mouse_down(MouseButton.LeftButton)}", color_black(), 10.0, 30.0)
        refresh_screen()
    
    while mouse_down(MouseButton.LeftButton) != false:
        process_events()
        clear_screen_to_white()
        draw_text_no_font_no_size("Release left mouse button", color_black(), 10.0, 10.0)
        draw_text_no_font_no_size(f"Mouse Down: {mouse_down(MouseButton.LeftButton)}", color_black(), 10.0, 30.0)
        refresh_screen()
    
    close_window(test_window)


def test_mouse_movement_integration():
    test_window = open_window("Test Window", 800, 600)
    while key_down(KeyCode.SpaceKey) == false:
        process_events()
        clear_screen_to_white()
        movement = mouse_movement()
        draw_text_no_font_no_size("Move mouse to test movement", color_black(), 10.0, 10.0)
        draw_text_no_font_no_size(f"Mouse Movement: X={movement.x}, Y={movement.y}", color_black(), 10.0, 30.0)
        draw_text_no_font_no_size("Press Space to end test", color_black(), 10.0, 50.0)
        refresh_screen()
    
    close_window(test_window)


def test_mouse_position_integration():
    test_window = open_window("Test Window", 800, 600)
    while key_down(KeyCode.SpaceKey) == false:
        process_events()
        clear_screen_to_white()
        position = mouse_position()
        draw_text_no_font_no_size("Move mouse to test position", color_black(), 10.0, 10.0)
        draw_text_no_font_no_size(f"Mouse Position: X={position.x}, Y={position.y}", color_black(), 10.0, 30.0)
        draw_text_no_font_no_size("Press Space to end test", color_black(), 10.0, 50.0)
        refresh_screen()
    
    close_window(test_window)


def test_mouse_position_vector_integration():
    test_window = open_window("Test Window", 800, 600)
    while key_down(KeyCode.SpaceKey) == false:
        process_events()
        clear_screen_to_white()
        position = mouse_position_vector()
        draw_text_no_font_no_size("Move mouse to test position", color_black(), 10.0, 10.0)
        draw_text_no_font_no_size(f"Mouse Position: X={position.x}, Y={position.y}", color_black(), 10.0, 30.0)
        draw_text_no_font_no_size("Press Space to end test", color_black(), 10.0, 50.0)
        refresh_screen()
    
    close_window(test_window)


def test_mouse_shown_integration():
    test_window = open_window("Test Window", 800, 600)
    while key_down(KeyCode.HKey) == false:
        process_events()
        clear_screen_to_white()
        draw_text_no_font_no_size("Press H to hide mouse", color_black(), 10.0, 10.0)
        draw_text_no_font_no_size(f"Mouse Shown: {mouse_shown()}", color_black(), 10.0, 30.0)
        refresh_screen()
        hide_mouse()
    
    while key_down(KeyCode.SKey) == false:
        process_events()
        clear_screen_to_white()
        draw_text_no_font_no_size("Press S to show mouse", color_black(), 10.0, 10.0)
        draw_text_no_font_no_size(f"Mouse Shown: {mouse_shown()}", color_black(), 10.0, 30.0)
        refresh_screen()
    
    show_mouse()
    close_window(test_window)


def test_mouse_up_integration():
    test_window = open_window("Test Window", 800, 600)
    while mouse_up(MouseButton.LeftButton) == false:
        process_events()
        clear_screen_to_white()
        draw_text_no_font_no_size("Click and release left mouse button", color_black(), 10.0, 10.0)
        draw_text_no_font_no_size(f"Mouse Up: {mouse_up(MouseButton.LeftButton)}", color_black(), 10.0, 30.0)
        refresh_screen()
    
    close_window(test_window)


def test_mouse_wheel_scroll_integration():
    test_window = open_window("Test Window", 800, 600)
    while key_down(KeyCode.SpaceKey) == false:
        process_events()
        clear_screen_to_white()
        scroll = mouse_wheel_scroll()
        draw_text_no_font_no_size("Scroll mouse wheel to test", color_black(), 10.0, 10.0)
        draw_text_no_font_no_size(f"Scroll Value: X={scroll.x}, Y={scroll.y}", color_black(), 10.0, 30.0)
        draw_text_no_font_no_size("Press Space to end test", color_black(), 10.0, 50.0)
        refresh_screen()
    
    close_window(test_window)


def test_mouse_x_integration():
    test_window = open_window("Test Window", 800, 600)
    while key_down(KeyCode.SpaceKey) == false:
        process_events()
        clear_screen_to_white()
        draw_text_no_font_no_size("Move mouse to test X position", color_black(), 10.0, 10.0)
        draw_text_no_font_no_size(f"Mouse Position: X={mouse_x()}, Y={mouse_y()}", color_black(), 10.0, 30.0)
        draw_text_no_font_no_size("Press Space to end test", color_black(), 10.0, 50.0)
        refresh_screen()
    
    close_window(test_window)


def test_mouse_y_integration():
    test_window = open_window("Test Window", 800, 600)
    while key_down(KeyCode.SpaceKey) == false:
        process_events()
        clear_screen_to_white()
        draw_text_no_font_no_size("Move mouse to test Y position", color_black(), 10.0, 10.0)
        draw_text_no_font_no_size(f"Mouse Position: X={mouse_x()}, Y={mouse_y()}", color_black(), 10.0, 30.0)
        draw_text_no_font_no_size("Press Space to end test", color_black(), 10.0, 50.0)
        refresh_screen()
    
    close_window(test_window)


def test_move_mouse_integration():
    test_window = open_window("Test Window", 800, 600)
    while key_down(KeyCode.MKey) == false:
        process_events()
        clear_screen_to_white()
        draw_text_no_font_no_size("Press M to move mouse to center", color_black(), 10.0, 10.0)
        draw_text_no_font_no_size(f"Mouse Position: X={mouse_x()}, Y={mouse_y()}", color_black(), 10.0, 30.0)
        refresh_screen()
        move_mouse(400.0, 300.0)
    
    while key_down(KeyCode.SpaceKey) == false:
        process_events()
        clear_screen_to_white()
        draw_text_no_font_no_size("Mouse moved to center", color_black(), 10.0, 10.0)
        draw_text_no_font_no_size(f"Mouse Position: X={mouse_x()}, Y={mouse_y()}", color_black(), 10.0, 30.0)
        draw_text_no_font_no_size("Press Space to end test", color_black(), 10.0, 50.0)
        refresh_screen()
    
    close_window(test_window)


def test_move_mouse_to_point_integration():
    test_window = open_window("Test Window", 800, 600)
    while key_down(KeyCode.MKey) == false:
        process_events()
        clear_screen_to_white()
        draw_text_no_font_no_size("Press M to move mouse to center", color_black(), 10.0, 10.0)
        draw_text_no_font_no_size(f"Mouse Position: X={mouse_x()}, Y={mouse_y()}", color_black(), 10.0, 30.0)
        refresh_screen()
        move_mouse_to_point(point_at(400.0, 300.0))
    
    while key_down(KeyCode.SpaceKey) == false:
        process_events()
        clear_screen_to_white()
        draw_text_no_font_no_size("Mouse moved to center", color_black(), 10.0, 10.0)
        draw_text_no_font_no_size(f"Mouse Position: X={mouse_x()}, Y={mouse_y()}", color_black(), 10.0, 30.0)
        draw_text_no_font_no_size("Press Space to end test", color_black(), 10.0, 50.0)
        refresh_screen()
    
    close_window(test_window)


def test_show_mouse_integration():
    test_window = open_window("Test Window", 800, 600)
    while key_down(KeyCode.HKey) == false:
        process_events()
        clear_screen_to_white()
        draw_text_no_font_no_size("Press H to hide mouse", color_black(), 10.0, 10.0)
        draw_text_no_font_no_size(f"Mouse Shown: {mouse_shown()}", color_black(), 10.0, 30.0)
        refresh_screen()
        hide_mouse()
    
    while key_down(KeyCode.SKey) == false:
        process_events()
        clear_screen_to_white()
        draw_text_no_font_no_size("Press S to show mouse", color_black(), 10.0, 10.0)
        draw_text_no_font_no_size(f"Mouse Shown: {mouse_shown()}", color_black(), 10.0, 30.0)
        refresh_screen()
    
    show_mouse()
    close_window(test_window)


def test_show_mouse_with_boolean_integration():
    test_window = open_window("Test Window", 800, 600)
    while key_down(KeyCode.HKey) == false:
        process_events()
        clear_screen_to_white()
        draw_text_no_font_no_size("Press H to hide mouse", color_black(), 10.0, 10.0)
        draw_text_no_font_no_size(f"Mouse Shown: {mouse_shown()}", color_black(), 10.0, 30.0)
        refresh_screen()
        show_mouse_with_boolean(false)
    
    while key_down(KeyCode.SKey) == false:
        process_events()
        clear_screen_to_white()
        draw_text_no_font_no_size("Press S to show mouse", color_black(), 10.0, 10.0)
        draw_text_no_font_no_size(f"Mouse Shown: {mouse_shown()}", color_black(), 10.0, 30.0)
        refresh_screen()
    
    show_mouse_with_boolean(true)
    close_window(test_window)


def test_draw_collected_text_integration():
    test_window = open_window("Test Window", 800, 600)
    test_font = load_font("test_font", "hara.ttf")
    start_reading_text(rectangle_from(100.0, 100.0, 200.0, 30.0))
    while key_down(KeyCode.KeypadEnter) == false:
        process_events()
        clear_screen_to_white()
        draw_text_no_font_no_size("Type some text, press Enter when done", color_black(), 10.0, 10.0)
        draw_collected_text(color_black(), test_font, 18, option_defaults())
        refresh_screen()
    
    end_reading_text()
    free_font(test_font)
    close_window(test_window)


def test_end_reading_text_integration():
    test_window = open_window("Test Window", 800, 600)
    start_reading_text(rectangle_from(100.0, 100.0, 200.0, 30.0))
    while key_down(KeyCode.KeypadEnter) == false:
        process_events()
        clear_screen_to_white()
        draw_text_no_font_no_size("Type some text, press Enter when done", color_black(), 10.0, 10.0)
        draw_text_no_font_no_size(f"Reading Text: {reading_text()}", color_black(), 10.0, 30.0)
        refresh_screen()
        end_reading_text()
    
    while key_down(KeyCode.SpaceKey) == false:
        process_events()
        clear_screen_to_white()
        draw_text_no_font_no_size("Text input ended", color_black(), 10.0, 10.0)
        draw_text_no_font_no_size(f"Reading Text: {reading_text()}", color_black(), 10.0, 30.0)
        draw_text_no_font_no_size("Press Space to end test", color_black(), 10.0, 50.0)
        refresh_screen()
    
    close_window(test_window)


def test_end_reading_text_in_window_integration():
    test_window = open_window("Test Window", 800, 600)
    test_rectangle = rectangle_from(100.0, 100.0, 200.0, 30.0)
    start_reading_text_in_window(test_window, test_rectangle)
    while key_down(KeyCode.KeypadEnter) == false:
        process_events()
        clear_screen_to_white()
        draw_text_no_font_no_size("Type some text, press Enter when done", color_black(), 10.0, 10.0)
        draw_text_no_font_no_size(f"Reading Text: {reading_text_in_window(test_window)}", color_black(), 10.0, 30.0)
        refresh_screen()
        end_reading_text_in_window(test_window)
    
    while key_down(KeyCode.SpaceKey) == false:
        process_events()
        clear_screen_to_white()
        draw_text_no_font_no_size("Text input ended", color_black(), 10.0, 10.0)
        draw_text_no_font_no_size(f"Reading Text: {reading_text_in_window(test_window)}", color_black(), 10.0, 30.0)
        draw_text_no_font_no_size("Press Space to end test", color_black(), 10.0, 50.0)
        refresh_screen()
    
    close_window(test_window)


def test_reading_text_integration():
    test_window = open_window("Test Window", 800, 600)
    start_reading_text(rectangle_from(100.0, 100.0, 200.0, 30.0))
    while key_down(KeyCode.KeypadEnter) == false:
        process_events()
        clear_screen_to_white()
        draw_text_no_font_no_size("Type some text, press Enter when done", color_black(), 10.0, 10.0)
        draw_text_no_font_no_size(f"Reading Text: {reading_text()}", color_black(), 10.0, 30.0)
        refresh_screen()
    
    end_reading_text()
    close_window(test_window)


def test_reading_text_in_window_integration():
    test_window = open_window("Test Window", 800, 600)
    test_rectangle = rectangle_from(100.0, 100.0, 200.0, 30.0)
    start_reading_text_in_window(test_window, test_rectangle)
    while key_down(KeyCode.KeypadEnter) == false:
        process_events()
        clear_screen_to_white()
        draw_text_no_font_no_size("Type some text, press Enter when done", color_black(), 10.0, 10.0)
        draw_text_no_font_no_size(f"Reading Text: {reading_text_in_window(test_window)}", color_black(), 10.0, 30.0)
        refresh_screen()
    
    end_reading_text_in_window(test_window)
    close_window(test_window)


def test_start_reading_text_integration():
    test_window = open_window("Test Window", 800, 600)
    test_rect = rectangle_from(100.0, 100.0, 200.0, 30.0)
    start_reading_text(test_rect)
    while key_down(KeyCode.KeypadEnter) == false:
        process_events()
        clear_screen_to_white()
        draw_text_no_font_no_size("Type some text, press Enter when done", color_black(), 10.0, 10.0)
        draw_text_no_font_no_size(f"Current Text: {text_input()}", color_black(), 10.0, 30.0)
        refresh_screen()
    
    end_reading_text()
    close_window(test_window)


def test_start_reading_text_with_initial_text_integration():
    test_window = open_window("Test Window", 800, 600)
    test_rect = rectangle_from(100.0, 100.0, 200.0, 30.0)
    start_reading_text_with_initial_text(test_rect, "Initial Text")
    while key_down(KeyCode.KeypadEnter) == false:
        process_events()
        clear_screen_to_white()
        draw_text_no_font_no_size("Type some text, press Enter when done", color_black(), 10.0, 10.0)
        draw_text_no_font_no_size(f"Current Text: {text_input()}", color_black(), 10.0, 30.0)
        refresh_screen()
    
    end_reading_text()
    close_window(test_window)


def test_start_reading_text_in_window_integration():
    test_window = open_window("Test Window", 800, 600)
    test_rect = rectangle_from(100.0, 100.0, 200.0, 30.0)
    start_reading_text_in_window(test_window, test_rect)
    while key_down(KeyCode.KeypadEnter) == false:
        process_events()
        clear_screen_to_white()
        draw_text_no_font_no_size("Type some text, press Enter when done", color_black(), 10.0, 10.0)
        draw_text_no_font_no_size(f"Current Text: {text_input_in_window(test_window)}", color_black(), 10.0, 30.0)
        refresh_screen()
    
    end_reading_text_in_window(test_window)
    close_window(test_window)


def test_start_reading_text_in_window_with_initial_text_integration():
    test_window = open_window("Test Window", 800, 600)
    test_rect = rectangle_from(100.0, 100.0, 200.0, 30.0)
    start_reading_text_in_window_with_initial_text(test_window, test_rect, "Initial Text")
    while key_down(KeyCode.KeypadEnter) == false:
        process_events()
        clear_screen_to_white()
        draw_text_no_font_no_size("Type some text, press Enter when done", color_black(), 10.0, 10.0)
        draw_text_no_font_no_size(f"Current Text: {text_input_in_window(test_window)}", color_black(), 10.0, 30.0)
        refresh_screen()
    
    end_reading_text_in_window(test_window)
    close_window(test_window)


def test_text_entry_cancelled_integration():
    test_window = open_window("Test Window", 800, 600)
    start_reading_text(rectangle_from(100.0, 100.0, 200.0, 30.0))
    while key_down(KeyCode.EscapeKey) == false:
        process_events()
        clear_screen_to_white()
        draw_text_no_font_no_size("Press Escape to cancel text entry", color_black(), 10.0, 10.0)
        draw_text_no_font_no_size(f"Text Entry Cancelled: {text_entry_cancelled()}", color_black(), 10.0, 30.0)
        refresh_screen()
    
    end_reading_text()
    close_window(test_window)


def test_text_entry_cancelled_in_window_integration():
    test_window = open_window("Test Window", 800, 600)
    test_rect = rectangle_from(100.0, 100.0, 200.0, 30.0)
    start_reading_text_in_window(test_window, test_rect)
    while key_down(KeyCode.EscapeKey) == false:
        process_events()
        clear_screen_to_white()
        draw_text_no_font_no_size("Press Escape to cancel text entry", color_black(), 10.0, 10.0)
        draw_text_no_font_no_size(f"Text Entry Cancelled: {text_entry_cancelled_in_window(test_window)}", color_black(), 10.0, 30.0)
        refresh_screen()
    
    end_reading_text_in_window(test_window)
    close_window(test_window)


def test_text_input_integration():
    test_window = open_window("Test Window", 800, 600)
    start_reading_text(rectangle_from(100.0, 100.0, 200.0, 30.0))
    while key_down(KeyCode.KeypadEnter) == false:
        process_events()
        clear_screen_to_white()
        draw_text_no_font_no_size("Type some text, press Enter when done", color_black(), 10.0, 10.0)
        draw_text_no_font_no_size(f"Current Text: {text_input()}", color_black(), 10.0, 30.0)
        refresh_screen()
    
    end_reading_text()
    close_window(test_window)


def test_text_input_in_window_integration():
    test_window = open_window("Test Window", 800, 600)
    test_rect = rectangle_from(100.0, 100.0, 200.0, 30.0)
    start_reading_text_in_window(test_window, test_rect)
    while key_down(KeyCode.KeypadEnter) == false:
        process_events()
        clear_screen_to_white()
        draw_text_no_font_no_size("Type some text, press Enter when done", color_black(), 10.0, 10.0)
        draw_text_no_font_no_size(f"Current Text: {text_input_in_window(test_window)}", color_black(), 10.0, 30.0)
        refresh_screen()
    
    end_reading_text_in_window(test_window)
    close_window(test_window)

