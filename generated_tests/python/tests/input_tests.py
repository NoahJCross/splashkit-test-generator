import pytest
from splashkit import *


def test_ProcessEvents_integration():
    simulate_key_press(Keycode.A)
    process_events()
    assert key_typed(Keycode.A) is True
    simulate_mouse_click(Mousebutton.Left)
    process_events()
    assert mouse_clicked(Mousebutton.Left) is True


def test_QuitRequested_integration():
    test_window = open_window("Test Window", 800, 600)
    process_events()
    assert quit_requested() is False
    simulate_key_press(Keycode.Escape)
    process_events()
    assert quit_requested() is True
    close_window(test_window)


def test_ResetQuit_integration():
    test_window = open_window("Test Window", 800, 600)
    process_events()
    assert quit_requested() is True
    reset_quit()
    process_events()
    assert quit_requested() is False
    close_window(test_window)


def test_AnyKeyPressed_integration():
    process_events()
    assert any_key_pressed() is False
    simulate_key_press(Keycode.A)
    process_events()
    assert any_key_pressed() is True


def test_DeregisterCallbackOnKeyDown_integration():
    test_window = open_window("Test Window", 800, 600)
    register_callback_on_key_down(_on_key_down())
    simulate_key_press(Keycode.A)
    process_events()
    assert key_down(Keycode.A) is True
    deregister_callback_on_key_down(_on_key_down())
    simulate_key_press(Keycode.B)
    process_events()
    assert key_down(Keycode.B) is False
    close_window(test_window)


def test_DeregisterCallbackOnKeyTyped_integration():
    register_callback_on_key_typed(_on_key_typed())
    simulate_key_press(Keycode.A)
    process_events()
    assert key_typed(Keycode.A) is True
    deregister_callback_on_key_typed(_on_key_typed())
    simulate_key_press(Keycode.B)
    process_events()
    assert key_typed(Keycode.B) is False


def test_DeregisterCallbackOnKeyUp_integration():
    test_window = open_window("Test Window", 800, 600)
    register_callback_on_key_up(_on_key_up())
    simulate_key_press(Keycode.A)
    process_events()
    assert key_up(Keycode.A) is True
    deregister_callback_on_key_up(_on_key_up())
    simulate_key_press(Keycode.B)
    process_events()
    assert key_up(Keycode.B) is False
    close_window(test_window)


def test_KeyDown_integration():
    process_events()
    assert key_down(Keycode.A) is False
    simulate_key_press(Keycode.A)
    process_events()
    assert key_down(Keycode.A) is True
    simulate_key_release(Keycode.A)
    process_events()
    assert key_down(Keycode.A) is False


def test_KeyName_integration():
    test_key_name1 = key_name(Keycode.A)
    assert test_key_name1 == "A"
    test_key_name2 = key_name(Keycode.Enter)
    assert test_key_name2 == "Enter"


def test_KeyReleased_integration():
    process_events()
    assert key_released(Keycode.A) is False
    simulate_key_press(Keycode.A)
    process_events()
    simulate_key_release(Keycode.A)
    process_events()
    assert key_released(Keycode.A) is True


def test_KeyTyped_integration():
    process_events()
    assert key_typed(Keycode.A) is False
    simulate_key_press(Keycode.A)
    process_events()
    assert key_typed(Keycode.A) is True


def test_KeyUp_integration():
    process_events()
    assert key_up(Keycode.A) is True
    simulate_key_press(Keycode.A)
    process_events()
    assert key_up(Keycode.A) is False
    simulate_key_release(Keycode.A)
    process_events()
    assert key_up(Keycode.A) is True


def test_RegisterCallbackOnKeyDown_integration():
    register_callback_on_key_down(_on_key_down())
    process_events()
    simulate_key_press(Keycode.A)
    process_events()
    assert key_down(Keycode.A) is True
    deregister_callback_on_key_down(_on_key_down())


def test_RegisterCallbackOnKeyTyped_integration():
    register_callback_on_key_typed(_on_key_typed())
    process_events()
    simulate_key_press(Keycode.A)
    process_events()
    assert key_typed(Keycode.A) is True
    deregister_callback_on_key_typed(_on_key_typed())


def test_RegisterCallbackOnKeyUp_integration():
    register_callback_on_key_up(_on_key_up())
    process_events()
    simulate_key_press(Keycode.A)
    simulate_key_release(Keycode.A)
    process_events()
    assert _key_up == "A"
    deregister_callback_on_key_up(_on_key_up())


def test_HideMouse_integration():
    test_window = open_window("Test Window", 800, 600)
    process_events()
    assert mouse_shown() is True
    hide_mouse()
    process_events()
    assert mouse_shown() is False
    close_window(test_window)


def test_MouseClicked_integration():
    process_events()
    assert mouse_clicked(Mousebutton.Left) is False
    simulate_mouse_click(Mousebutton.Left)
    process_events()
    assert mouse_clicked(Mousebutton.Left) is True


def test_MouseDown_integration():
    process_events()
    assert mouse_down(Mousebutton.Left) is False
    simulate_mouse_press(Mousebutton.Left)
    process_events()
    assert mouse_down(Mousebutton.Left) is True
    simulate_mouse_release(Mousebutton.Left)
    process_events()
    assert mouse_down(Mousebutton.Left) is False


def test_MouseMovement_integration():
    test_window = open_window("Test Window", 800, 600)
    move_mouse(100.0, 100.0)
    process_events()
    test_movement = mouse_movement()
    assert test_movement.x == 100.0
    assert test_movement.y == 100.0
    close_window(test_window)


def test_MousePosition_integration():
    test_window = open_window("Test Window", 800, 600)
    move_mouse(400.0, 300.0)
    process_events()
    test_position = mouse_position()
    assert test_position.x == 400.0
    assert test_position.y == 300.0
    close_window(test_window)


def test_MousePositionVector_integration():
    test_window = open_window("Test Window", 800, 600)
    move_mouse(400.0, 300.0)
    process_events()
    test_mouse_position = mouse_position_vector()
    assert test_mouse_position.x == 400.0
    assert test_mouse_position.y == 300.0
    close_window(test_window)


def test_MouseShown_integration():
    test_window = open_window("Test Window", 800, 600)
    show_mouse()
    process_events()
    assert mouse_shown() is True
    hide_mouse()
    process_events()
    assert mouse_shown() is False
    close_window(test_window)


def test_MouseUp_integration():
    process_events()
    assert mouse_up(Mousebutton.Left) is True
    simulate_mouse_click(Mousebutton.Left)
    process_events()
    assert mouse_up(Mousebutton.Left) is False


def test_MouseWheelScroll_integration():
    test_window = open_window("Test Window", 800, 600)
    process_events()
    assert mouse_wheel_scroll() == vector_from_angle(0.0, 0.0)
    simulate_mouse_wheel_scroll(10.0, 5.0)
    process_events()
    assert mouse_wheel_scroll() is True
    close_window(test_window)


def test_MouseX_integration():
    test_window = open_window("Test Window", 800, 600)
    move_mouse(400.0, 300.0)
    process_events()
    assert 399.0 <= mouse_x() <= 401.0
    close_window(test_window)


def test_MouseY_integration():
    test_window = open_window("Test Window", 800, 600)
    move_mouse(400.0, 300.0)
    process_events()
    assert mouse_y() == 300.0
    close_window(test_window)


def test_MoveMouse_integration():
    test_window = open_window("Test Window", 800, 600)
    process_events()
    move_mouse(400.0, 300.0)
    process_events()
    assert 399.0 <= mouse_x() <= 401.0
    assert 299.0 <= mouse_y() <= 301.0
    close_window(test_window)


def test_MoveMouseToPoint_integration():
    test_window = open_window("Test Window", 800, 600)
    move_mouse_to_point(point_at(400.0, 300.0))
    process_events()
    assert mouse_position() == point_at(400.0, 300.0)
    close_window(test_window)


def test_ShowMouse_integration():
    test_window = open_window("Test Window", 800, 600)
    hide_mouse()
    process_events()
    assert mouse_shown() is False
    show_mouse()
    process_events()
    assert mouse_shown() is True
    close_window(test_window)


def test_ShowMouseWithBoolean_integration():
    test_window = open_window("Test Window", 800, 600)
    show_mouse_with_boolean(true)
    process_events()
    assert mouse_shown() is True
    show_mouse_with_boolean(false)
    process_events()
    assert mouse_shown() is False
    close_window(test_window)


def test_DrawCollectedText_integration():
    test_window = open_window("Test Window", 800, 600)
    test_font = load_font("test_font", "path/to/font.ttf")
    start_reading_text(rectangle_from(100, 100, 200, 30))
    process_events()
    simulate_key_press(Keycode.A)
    process_events()
    draw_collected_text(color_black(), test_font, 18, option_defaults())
    refresh_screen()
    assert get_pixel(test_window, 105, 115) == color_black()
    end_reading_text()
    free_font(test_font)
    close_window(test_window)


def test_EndReadingText_integration():
    test_window = open_window("Test Window", 800, 600)
    start_reading_text(rectangle_from(100.0, 100.0, 200.0, 30.0))
    process_events()
    assert reading_text() is True
    end_reading_text()
    process_events()
    assert reading_text() is False
    close_window(test_window)


def test_EndReadingTextInWindow_integration():
    test_window = open_window("Test Window", 800, 600)
    test_rectangle = rectangle_from(100.0, 100.0, 200.0, 30.0)
    start_reading_text_in_window(test_window, test_rectangle)
    process_events()
    assert reading_text_in_window(test_window) is True
    end_reading_text_in_window(test_window)
    process_events()
    assert reading_text_in_window(test_window) is False
    close_window(test_window)


def test_ReadingText_integration():
    test_window = open_window("Test Window", 800, 600)
    start_reading_text(rectangle_from(100.0, 100.0, 200.0, 30.0))
    process_events()
    assert reading_text() is True
    end_reading_text()
    process_events()
    assert reading_text() is False
    close_window(test_window)


def test_ReadingTextInWindow_integration():
    test_window = open_window("Test Window", 800, 600)
    test_rectangle = rectangle_from(100.0, 100.0, 200.0, 30.0)
    start_reading_text_in_window(test_window, test_rectangle)
    process_events()
    assert reading_text_in_window(test_window) is True
    end_reading_text_in_window(test_window)
    process_events()
    assert reading_text_in_window(test_window) is False
    close_window(test_window)


def test_StartReadingText_integration():
    test_window = open_window("Test Window", 800, 600)
    test_rect = rectangle_from(100.0, 100.0, 200.0, 30.0)
    start_reading_text(test_rect)
    process_events()
    assert reading_text() is True
    end_reading_text()
    process_events()
    assert reading_text() is False
    close_window(test_window)


def test_StartReadingTextWithInitialText_integration():
    test_window = open_window("Test Window", 800, 600)
    test_rect = rectangle_from(100.0, 100.0, 200.0, 30.0)
    start_reading_text_with_initial_text(test_rect, "Initial Text")
    process_events()
    assert reading_text() is True
    end_reading_text()
    close_window(test_window)


def test_StartReadingTextInWindow_integration():
    test_window = open_window("Test Window", 800, 600)
    test_rect = rectangle_from(100.0, 100.0, 200.0, 30.0)
    start_reading_text_in_window(test_window, test_rect)
    process_events()
    assert reading_text_in_window(test_window) is True
    end_reading_text_in_window(test_window)
    close_window(test_window)


def test_StartReadingTextInWindowWithInitialText_integration():
    test_window = open_window("Test Window", 800, 600)
    test_rect = rectangle_from(100.0, 100.0, 200.0, 30.0)
    start_reading_text_in_window_with_initial_text(test_window, test_rect, "Initial Text")
    process_events()
    assert reading_text_in_window(test_window) is True
    end_reading_text_in_window(test_window)
    close_window(test_window)


def test_TextEntryCancelled_integration():
    test_window = open_window("Test Window", 800, 600)
    start_reading_text(rectangle_from(100.0, 100.0, 200.0, 30.0))
    process_events()
    assert text_entry_cancelled() is False
    simulate_key_press(Keycode.Escape)
    process_events()
    assert text_entry_cancelled() is True
    end_reading_text()
    close_window(test_window)


def test_TextEntryCancelledInWindow_integration():
    test_window = open_window("Test Window", 800, 600)
    test_rect = rectangle_from(100.0, 100.0, 200.0, 30.0)
    start_reading_text_in_window(test_window, test_rect)
    process_events()
    assert text_entry_cancelled_in_window(test_window) is False
    simulate_key_press(Keycode.Escape)
    process_events()
    assert text_entry_cancelled_in_window(test_window) is True
    close_window(test_window)


def test_TextInput_integration():
    test_window = open_window("Test Window", 800, 600)
    start_reading_text(rectangle_from(100.0, 100.0, 200.0, 30.0))
    process_events()
    simulate_key_press(Keycode.A)
    process_events()
    assert text_input() == "A"
    end_reading_text()
    close_window(test_window)


def test_TextInputInWindow_integration():
    test_window = open_window("Test Window", 800, 600)
    test_rectangle = rectangle_from(100.0, 100.0, 200.0, 30.0)
    start_reading_text_in_window(test_window, test_rectangle)
    process_events()
    simulate_key_press(Keycode.A)
    process_events()
    assert text_input_in_window(test_window) == "A"
    end_reading_text_in_window(test_window)
    close_window(test_window)

