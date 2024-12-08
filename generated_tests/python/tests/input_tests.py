import pytest
from splashkit import *


def test_ProcessEvents_integration():
    simulate_key_press(KeyCode.A)
    process_events()
    assert key_typed(KeyCode.A) is True
    simulate_mouse_click(MouseButton.Left)
    process_events()
    assert mouse_clicked(MouseButton.Left) is True


def test_QuitRequested_integration():
    test_window = open_window("Test Window", 800, 600)
    process_events()
    assert quit_requested() is False
    simulate_key_press(KeyCode.Escape)
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
    simulate_key_press(KeyCode.A)
    process_events()
    assert any_key_pressed() is True


def test_DeregisterCallbackOnKeyDown_integration():
    test_window = open_window("Test Window", 800, 600)
    register_callback_on_key_down(_on_key_down())
    simulate_key_press(KeyCode.A)
    process_events()
    assert key_down(KeyCode.A) is True
    deregister_callback_on_key_down(_on_key_down())
    simulate_key_press(KeyCode.B)
    process_events()
    assert key_down(KeyCode.B) is False
    close_window(test_window)


def test_DeregisterCallbackOnKeyTyped_integration():
    register_callback_on_key_typed(_on_key_typed())
    simulate_key_press(KeyCode.A)
    process_events()
    assert key_typed(KeyCode.A) is True
    deregister_callback_on_key_typed(_on_key_typed())
    simulate_key_press(KeyCode.B)
    process_events()
    assert key_typed(KeyCode.B) is False


def test_DeregisterCallbackOnKeyUp_integration():
    test_window = open_window("Test Window", 800, 600)
    register_callback_on_key_up(_on_key_up())
    simulate_key_press(KeyCode.A)
    process_events()
    assert key_up(KeyCode.A) is True
    deregister_callback_on_key_up(_on_key_up())
    simulate_key_press(KeyCode.B)
    process_events()
    assert key_up(KeyCode.B) is False
    close_window(test_window)


def test_KeyDown_integration():
    process_events()
    assert key_down(KeyCode.A) is False
    simulate_key_press(KeyCode.A)
    process_events()
    assert key_down(KeyCode.A) is True
    simulate_key_release(KeyCode.A)
    process_events()
    assert key_down(KeyCode.A) is False


def test_KeyName_integration():
    test_key_name1 = key_name(KeyCode.A)
    assert "A" == test_key_name1
    test_key_name2 = key_name(KeyCode.Enter)
    assert "Enter" == test_key_name2


def test_KeyReleased_integration():
    process_events()
    assert key_released(KeyCode.A) is False
    simulate_key_press(KeyCode.A)
    process_events()
    simulate_key_release(KeyCode.A)
    process_events()
    assert key_released(KeyCode.A) is True


def test_KeyTyped_integration():
    process_events()
    assert key_typed(KeyCode.A) is False
    simulate_key_press(KeyCode.A)
    process_events()
    assert key_typed(KeyCode.A) is True


def test_KeyUp_integration():
    process_events()
    assert key_up(KeyCode.A) is True
    simulate_key_press(KeyCode.A)
    process_events()
    assert key_up(KeyCode.A) is False
    simulate_key_release(KeyCode.A)
    process_events()
    assert key_up(KeyCode.A) is True


def test_RegisterCallbackOnKeyDown_integration():
    register_callback_on_key_down(_on_key_down())
    process_events()
    simulate_key_press(KeyCode.A)
    process_events()
    assert key_down(KeyCode.A) is True
    deregister_callback_on_key_down(_on_key_down())


def test_RegisterCallbackOnKeyTyped_integration():
    register_callback_on_key_typed(_on_key_typed())
    process_events()
    simulate_key_press(KeyCode.A)
    process_events()
    assert key_typed(KeyCode.A) is True
    deregister_callback_on_key_typed(_on_key_typed())


def test_RegisterCallbackOnKeyUp_integration():
    register_callback_on_key_up(_on_key_up())
    process_events()
    simulate_key_press(KeyCode.A)
    simulate_key_release(KeyCode.A)
    process_events()
    assert "A" == _key_up
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
    assert mouse_clicked(MouseButton.Left) is False
    simulate_mouse_click(MouseButton.Left)
    process_events()
    assert mouse_clicked(MouseButton.Left) is True


def test_MouseDown_integration():
    process_events()
    assert mouse_down(MouseButton.Left) is False
    simulate_mouse_press(MouseButton.Left)
    process_events()
    assert mouse_down(MouseButton.Left) is True
    simulate_mouse_release(MouseButton.Left)
    process_events()
    assert mouse_down(MouseButton.Left) is False


def test_MouseMovement_integration():
    test_window = open_window("Test Window", 800, 600)
    move_mouse(100.0, 100.0)
    process_events()
    test_movement = mouse_movement()
    assert 100.0 == test_movement.x
    assert 100.0 == test_movement.y
    close_window(test_window)


def test_MousePosition_integration():
    test_window = open_window("Test Window", 800, 600)
    move_mouse(400.0, 300.0)
    process_events()
    test_position = mouse_position()
    assert 400.0 == test_position.x
    assert 300.0 == test_position.y
    close_window(test_window)


def test_MousePositionVector_integration():
    test_window = open_window("Test Window", 800, 600)
    move_mouse(400.0, 300.0)
    process_events()
    test_mouse_position = mouse_position_vector()
    assert 400.0 == test_mouse_position.x
    assert 300.0 == test_mouse_position.y
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
    assert mouse_up(MouseButton.Left) is True
    simulate_mouse_click(MouseButton.Left)
    process_events()
    assert mouse_up(MouseButton.Left) is False


def test_MouseWheelScroll_integration():
    test_window = open_window("Test Window", 800, 600)
    process_events()
    assert vector_from_angle(0.0, 0.0) == mouse_wheel_scroll()
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
    assert 300.0 == mouse_y()
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
    assert point_at(400.0, 300.0) == mouse_position()
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
    simulate_key_press(KeyCode.A)
    process_events()
    draw_collected_text(color_black(), test_font, 18, option_defaults())
    refresh_screen()
    assert color_black() == get_pixel(test_window, 105, 115)
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
    simulate_key_press(KeyCode.Escape)
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
    simulate_key_press(KeyCode.Escape)
    process_events()
    assert text_entry_cancelled_in_window(test_window) is True
    close_window(test_window)


def test_TextInput_integration():
    test_window = open_window("Test Window", 800, 600)
    start_reading_text(rectangle_from(100.0, 100.0, 200.0, 30.0))
    process_events()
    simulate_key_press(KeyCode.A)
    process_events()
    assert "A" == text_input()
    end_reading_text()
    close_window(test_window)


def test_TextInputInWindow_integration():
    test_window = open_window("Test Window", 800, 600)
    test_rectangle = rectangle_from(100.0, 100.0, 200.0, 30.0)
    start_reading_text_in_window(test_window, test_rectangle)
    process_events()
    simulate_key_press(KeyCode.A)
    process_events()
    assert "A" == text_input_in_window(test_window)
    end_reading_text_in_window(test_window)
    close_window(test_window)

