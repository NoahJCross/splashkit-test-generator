import pytest
from splashkit import *


def test_ClearWindow_integration():
    test_window = open_window("Test Window", 800, 600)
    test_color = color_black()
    clear_window(test_window, test_color)
    refresh_window(test_window)
    assert color_black() == get_pixel(point_at(window_width(test_window), window_height(test_window)))
    close_window(test_window)


def test_CloseAllWindows_integration():
    test_window_1 = open_window("Test Window 1", 800, 600)
    test_window_2 = open_window("Test Window 2", 800, 600)
    close_all_windows()
    assert has_window("Test Window 1") is False
    assert has_window("Test Window 2") is False


def test_CloseCurrentWindow_integration():
    test_window = open_window("Test Window", 800, 600)
    set_current_window(test_window)
    close_current_window()
    assert has_window("Test Window") is False


def test_CloseWindowNamed_integration():
    test_window = open_window("Test Window", 800, 600)
    window_exists = has_window("Test Window")
    assert window_exists is True
    close_window_named("Test Window")
    window_exists = has_window("Test Window")
    assert window_exists is False


def test_CloseWindow_integration():
    test_window = open_window("Test Window", 800, 600)
    close_window(test_window)
    assert has_window("Test Window") is False


def test_CurrentWindow_integration():
    test_window = open_window("Test Window", 800, 600)
    set_current_window(test_window)
    assert test_window == current_window()
    close_window(test_window)


def test_CurrentWindowHasBorder_integration():
    test_window = open_window("Test Window", 800, 600)
    assert current_window_has_border() is True
    current_window_toggle_border()
    assert current_window_has_border() is False
    close_window(test_window)


def test_CurrentWindowHeight_integration():
    test_window = open_window("Test Window", 800, 600)
    set_current_window(test_window)
    assert 600 == current_window_height()
    close_window(test_window)


def test_CurrentWindowIsFullscreen_integration():
    test_window = open_window("Test Window", 800, 600)
    assert current_window_is_fullscreen() is False
    current_window_toggle_fullscreen()
    assert current_window_is_fullscreen() is True
    current_window_toggle_fullscreen()
    assert current_window_is_fullscreen() is False
    close_window(test_window)


def test_CurrentWindowPosition_integration():
    test_window = open_window("Test Window", 800, 600)
    test_position = current_window_position()
    assert test_position is not None
    close_window(test_window)


def test_CurrentWindowToggleBorder_integration():
    test_window = open_window("Test Window", 800, 600)
    current_window_toggle_border()
    assert current_window_has_border() is False
    current_window_toggle_border()
    assert current_window_has_border() is True
    close_window(test_window)


def test_CurrentWindowToggleFullscreen_integration():
    test_window = open_window("Test Window", 800, 600)
    current_window_toggle_fullscreen()
    assert current_window_is_fullscreen() is True
    current_window_toggle_fullscreen()
    assert current_window_is_fullscreen() is False
    close_window(test_window)


def test_CurrentWindowWidth_integration():
    test_window = open_window("Test Window", 800, 600)
    set_current_window(test_window)
    assert 800 == current_window_width()
    close_window(test_window)


def test_CurrentWindowX_integration():
    test_window = open_window("Test Window", 800, 600)
    move_window_to(test_window, 100, 200)
    set_current_window(test_window)
    assert 100 == current_window_x()
    close_window(test_window)


def test_CurrentWindowY_integration():
    test_window = open_window("Test Window", 800, 600)
    test_y = current_window_y()
    assert test_y > -1
    close_window(test_window)


def test_HasWindow_integration():
    test_window = open_window("Test Window", 800, 600)
    assert has_window("Test Window") is True
    close_window(test_window)
    assert has_window("Test Window") is False


def test_IsCurrentWindow_integration():
    test_window_1 = open_window("Test Window 1", 800, 600)
    test_window_2 = open_window("Test Window 2", 800, 600)
    set_current_window(test_window_1)
    assert is_current_window(test_window_1) is True
    assert is_current_window(test_window_2) is False
    set_current_window(test_window_2)
    assert is_current_window(test_window_2) is True
    assert is_current_window(test_window_1) is False
    close_window(test_window_1)
    close_window(test_window_2)


def test_MoveCurrentWindowTo_integration():
    test_window = open_window("Test Window", 800, 600)
    move_current_window_to(100, 100)
    assert 100 == current_window_x()
    assert 100 == current_window_y()
    close_window(test_window)


def test_MoveWindowToNamed_integration():
    test_window = open_window("Test Window", 800, 600)
    move_window_to_named("Test Window", 100, 100)
    process_events()
    assert 100 == window_x_named("Test Window")
    assert 100 == window_y_named("Test Window")
    close_window_named("Test Window")


def test_MoveWindowTo_integration():
    test_window = open_window("Test Window", 800, 600)
    move_window_to(test_window, 100, 100)
    assert 100 == window_x(test_window)
    assert 100 == window_y(test_window)
    close_window(test_window)


def test_OpenWindow_integration():
    test_window = open_window("Test Window", 800, 600)
    assert test_window is not None
    close_window(test_window)


def test_RefreshWindow_integration():
    test_window = open_window("Test Window", 800, 600)
    draw_circle(color_black(), circle_at(400.0, 300.0, 50.0))
    refresh_window(test_window)
    assert point_in_circle(point_at(400.0, 300.0), circle_at(400.0, 300.0, 50.0)) is True
    close_window(test_window)


def test_RefreshWindowWithTargetFps_integration():
    test_window = open_window("Test Window", 800, 600)
    refresh_window_with_target_fps(test_window, 60)
    close_window(test_window)


def test_ResizeCurrentWindow_integration():
    test_window = open_window("Test Window", 800, 600)
    set_current_window(test_window)
    resize_current_window(1024, 768)
    process_events()
    assert 1024 == current_window_width()
    assert 768 == current_window_height()
    close_window(test_window)


def test_ResizeWindow_integration():
    test_window = open_window("Test Window", 800, 600)
    resize_window(test_window, 1024, 768)
    assert 1024 == window_width(test_window)
    assert 768 == window_height(test_window)
    close_window(test_window)


def test_SetCurrentWindowNamed_integration():
    test_window_1 = open_window("Test Window 1", 800, 600)
    test_window_2 = open_window("Test Window 2", 800, 600)
    set_current_window_named("Test Window 2")
    assert is_current_window(test_window_2) is True
    close_window(test_window_1)
    close_window(test_window_2)


def test_SetCurrentWindow_integration():
    test_window_1 = open_window("Test Window 1", 800, 600)
    test_window_2 = open_window("Test Window 2", 800, 600)
    set_current_window(test_window_2)
    assert is_current_window(test_window_2) is True
    close_window(test_window_1)
    close_window(test_window_2)


def test_WindowCaption_integration():
    test_window = open_window("Test Window", 800, 600)
    assert "Test Window" == window_caption(test_window)
    close_window(test_window)


def test_WindowCloseRequestedNamed_integration():
    test_window = open_window("Test Window", 800, 600)
    process_events()
    assert window_close_requested_named("Test Window") is False
    simulate_key_press(KeyCode.Escape)
    process_events()
    assert window_close_requested_named("Test Window") is True
    close_window(test_window)


def test_WindowCloseRequested_integration():
    test_window = open_window("Test Window", 800, 600)
    process_events()
    assert window_close_requested(test_window) is False
    simulate_key_press(KeyCode.Escape)
    process_events()
    assert window_close_requested(test_window) is True
    close_window(test_window)


def test_WindowHasBorderNamed_integration():
    test_window = open_window("Test Window", 800, 600)
    assert window_has_border_named("Test Window") is True
    window_toggle_border_named("Test Window")
    assert window_has_border_named("Test Window") is False
    close_window_named("Test Window")


def test_WindowHasBorder_integration():
    test_window = open_window("Test Window", 800, 600)
    assert window_has_border(test_window) is True
    window_toggle_border(test_window)
    assert window_has_border(test_window) is False
    close_window(test_window)


def test_WindowHasFocus_integration():
    test_window = open_window("Test Window", 800, 600)
    process_events()
    assert window_has_focus(test_window) is True
    close_window(test_window)


def test_WindowHeightNamed_integration():
    test_window = open_window("Test Window", 800, 600)
    assert 600 == window_height_named("Test Window")
    close_window(test_window)


def test_WindowHeight_integration():
    test_window = open_window("Test Window", 800, 600)
    assert 600 == window_height(test_window)
    close_window(test_window)


def test_WindowIsFullscreenNamed_integration():
    test_window = open_window("Test Window", 800, 600)
    window_toggle_fullscreen(test_window)
    assert window_is_fullscreen_named("Test Window") is True
    window_toggle_fullscreen(test_window)
    assert window_is_fullscreen_named("Test Window") is False
    close_window(test_window)


def test_WindowIsFullscreen_integration():
    test_window = open_window("Test Window", 800, 600)
    assert window_is_fullscreen(test_window) is False
    window_toggle_fullscreen(test_window)
    assert window_is_fullscreen(test_window) is True
    close_window(test_window)


def test_WindowNamed_integration():
    test_window = open_window("Test Window", 800, 600)
    retrieved_window = window_named("Test Window")
    assert retrieved_window == test_window
    close_window(test_window)


def test_WindowPositionNamed_integration():
    test_window = open_window("Test Window", 800, 600)
    test_position = window_position_named("Test Window")
    assert test_position is not None
    close_window(test_window)


def test_WindowPosition_integration():
    test_window = open_window("Test Window", 800, 600)
    test_position = window_position(test_window)
    assert test_position is not None
    close_window(test_window)


def test_WindowSetIcon_integration():
    test_window = open_window("Test Window", 800, 600)
    test_bitmap = create_bitmap("test_icon", 32, 32)
    window_set_icon(test_window, test_bitmap)
    close_window(test_window)
    free_bitmap(test_bitmap)


def test_WindowToggleBorderNamed_integration():
    test_window = open_window("Test Window", 800, 600)
    test_has_border = window_has_border_named("Test Window")
    assert test_has_border is True
    window_toggle_border_named("Test Window")
    test_has_border = window_has_border_named("Test Window")
    assert test_has_border is False
    close_window_named("Test Window")


def test_WindowToggleBorder_integration():
    test_window = open_window("Test Window", 800, 600)
    assert window_has_border(test_window) is True
    window_toggle_border(test_window)
    assert window_has_border(test_window) is False
    window_toggle_border(test_window)
    assert window_has_border(test_window) is True
    close_window(test_window)


def test_WindowToggleFullscreenNamed_integration():
    test_window = open_window("Test Window", 800, 600)
    process_events()
    assert window_is_fullscreen_named("Test Window") is False
    window_toggle_fullscreen_named("Test Window")
    process_events()
    assert window_is_fullscreen_named("Test Window") is True
    close_window_named("Test Window")


def test_WindowToggleFullscreen_integration():
    test_window = open_window("Test Window", 800, 600)
    initial_fullscreen_state = window_is_fullscreen(test_window)
    window_toggle_fullscreen(test_window)
    new_fullscreen_state = window_is_fullscreen(test_window)
    assert new_fullscreen_state != initial_fullscreen_state
    close_window(test_window)


def test_WindowWidthNamed_integration():
    test_window = open_window("Test Window", 800, 600)
    assert 800 == window_width_named("Test Window")
    close_window(test_window)


def test_WindowWidth_integration():
    test_window = open_window("Test Window", 800, 600)
    assert 800 == window_width(test_window)
    close_window(test_window)


def test_WindowWithFocus_integration():
    test_window_1 = open_window("Test Window 1", 800, 600)
    test_window_2 = open_window("Test Window 2", 800, 600)
    set_current_window(test_window_1)
    focused_window = window_with_focus()
    assert test_window_1 == focused_window
    set_current_window(test_window_2)
    focused_window = window_with_focus()
    assert test_window_2 == focused_window
    close_window(test_window_1)
    close_window(test_window_2)


def test_WindowXNamed_integration():
    test_window = open_window("Test Window", 800, 600)
    move_window_to_named("Test Window", 100, 200)
    assert 100 == window_x_named("Test Window")
    close_window_named("Test Window")


def test_WindowX_integration():
    test_window = open_window("Test Window", 800, 600)
    assert window_x(test_window) > -1
    close_window(test_window)


def test_WindowYNamed_integration():
    test_window = open_window("Test Window", 800, 600)
    move_window_to_named("Test Window", 100, 200)
    test_window_y = window_y_named("Test Window")
    assert 200 == test_window_y
    close_window_named("Test Window")


def test_WindowY_integration():
    test_window = open_window("Test Window", 800, 600)
    move_window_to(test_window, 100, 200)
    assert 200 == window_y(test_window)
    close_window(test_window)

