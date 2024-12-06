import pytest
from splashkit import *


def test_ClearWindow_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_color = ColorBlack()
    ClearWindow(test_window, test_color)
    RefreshWindow(test_window)
    assert GetPixel(PointAt(WindowWidth(test_window), WindowHeight(test_window))) == ColorBlack()
    CloseWindow(test_window)


def test_CloseAllWindows_integration():
    test_window_1 = OpenWindow("Test Window 1", 800, 600)
    test_window_2 = OpenWindow("Test Window 2", 800, 600)
    CloseAllWindows()
    assert HasWindow("Test Window 1") is False
    assert HasWindow("Test Window 2") is False


def test_CloseCurrentWindow_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    SetCurrentWindow(test_window)
    CloseCurrentWindow()
    assert HasWindow("Test Window") is False


def test_CloseWindowNamed_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    window_exists = HasWindow("Test Window")
    assert window_exists is True
    CloseWindowNamed("Test Window")
    window_exists = HasWindow("Test Window")
    assert window_exists is False


def test_CloseWindow_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    CloseWindow(test_window)
    assert HasWindow("Test Window") is False


def test_CurrentWindow_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    SetCurrentWindow(test_window)
    assert CurrentWindow() == test_window
    CloseWindow(test_window)


def test_CurrentWindowHasBorder_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    assert CurrentWindowHasBorder() is True
    CurrentWindowToggleBorder()
    assert CurrentWindowHasBorder() is False
    CloseWindow(test_window)


def test_CurrentWindowHeight_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    SetCurrentWindow(test_window)
    assert CurrentWindowHeight() == 600
    CloseWindow(test_window)


def test_CurrentWindowIsFullscreen_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    assert CurrentWindowIsFullscreen() is False
    CurrentWindowToggleFullscreen()
    assert CurrentWindowIsFullscreen() is True
    CurrentWindowToggleFullscreen()
    assert CurrentWindowIsFullscreen() is False
    CloseWindow(test_window)


def test_CurrentWindowPosition_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_position = CurrentWindowPosition()
    assert test_position is not None
    CloseWindow(test_window)


def test_CurrentWindowToggleBorder_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    CurrentWindowToggleBorder()
    assert CurrentWindowHasBorder() is False
    CurrentWindowToggleBorder()
    assert CurrentWindowHasBorder() is True
    CloseWindow(test_window)


def test_CurrentWindowToggleFullscreen_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    CurrentWindowToggleFullscreen()
    assert CurrentWindowIsFullscreen() is True
    CurrentWindowToggleFullscreen()
    assert CurrentWindowIsFullscreen() is False
    CloseWindow(test_window)


def test_CurrentWindowWidth_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    SetCurrentWindow(test_window)
    assert CurrentWindowWidth() == 800
    CloseWindow(test_window)


def test_CurrentWindowX_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    MoveWindowTo(test_window, 100, 200)
    SetCurrentWindow(test_window)
    assert CurrentWindowX() == 100
    CloseWindow(test_window)


def test_CurrentWindowY_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_y = CurrentWindowY()
    assert test_y > -1
    CloseWindow(test_window)


def test_HasWindow_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    assert HasWindow("Test Window") is True
    CloseWindow(test_window)
    assert HasWindow("Test Window") is False


def test_IsCurrentWindow_integration():
    test_window_1 = OpenWindow("Test Window 1", 800, 600)
    test_window_2 = OpenWindow("Test Window 2", 800, 600)
    SetCurrentWindow(test_window_1)
    assert IsCurrentWindow(test_window_1) is True
    assert IsCurrentWindow(test_window_2) is False
    SetCurrentWindow(test_window_2)
    assert IsCurrentWindow(test_window_2) is True
    assert IsCurrentWindow(test_window_1) is False
    CloseWindow(test_window_1)
    CloseWindow(test_window_2)


def test_MoveCurrentWindowTo_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    MoveCurrentWindowTo(100, 100)
    assert CurrentWindowX() == 100
    assert CurrentWindowY() == 100
    CloseWindow(test_window)


def test_MoveWindowToNamed_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    MoveWindowToNamed("Test Window", 100, 100)
    ProcessEvents()
    assert WindowXNamed("Test Window") == 100
    assert WindowYNamed("Test Window") == 100
    CloseWindowNamed("Test Window")


def test_MoveWindowTo_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    MoveWindowTo(test_window, 100, 100)
    assert WindowX(test_window) == 100
    assert WindowY(test_window) == 100
    CloseWindow(test_window)


def test_OpenWindow_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    assert test_window is not None
    CloseWindow(test_window)


def test_RefreshWindow_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    DrawCircle(ColorBlack(), CircleAt(400.0, 300.0, 50.0))
    RefreshWindow(test_window)
    assert PointInCircle(PointAt(400.0, 300.0), CircleAt(400.0, 300.0, 50.0)) is True
    CloseWindow(test_window)


def test_RefreshWindowWithTargetFps_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    RefreshWindowWithTargetFps(test_window, 60)
    CloseWindow(test_window)


def test_ResizeCurrentWindow_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    SetCurrentWindow(test_window)
    ResizeCurrentWindow(1024, 768)
    ProcessEvents()
    assert CurrentWindowWidth() == 1024
    assert CurrentWindowHeight() == 768
    CloseWindow(test_window)


def test_ResizeWindow_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    ResizeWindow(test_window, 1024, 768)
    assert WindowWidth(test_window) == 1024
    assert WindowHeight(test_window) == 768
    CloseWindow(test_window)


def test_SetCurrentWindowNamed_integration():
    test_window_1 = OpenWindow("Test Window 1", 800, 600)
    test_window_2 = OpenWindow("Test Window 2", 800, 600)
    SetCurrentWindowNamed("Test Window 2")
    assert IsCurrentWindow(test_window_2) is True
    CloseWindow(test_window_1)
    CloseWindow(test_window_2)


def test_SetCurrentWindow_integration():
    test_window_1 = OpenWindow("Test Window 1", 800, 600)
    test_window_2 = OpenWindow("Test Window 2", 800, 600)
    SetCurrentWindow(test_window_2)
    assert IsCurrentWindow(test_window_2) is True
    CloseWindow(test_window_1)
    CloseWindow(test_window_2)


def test_WindowCaption_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    assert WindowCaption(test_window) == "Test Window"
    CloseWindow(test_window)


def test_WindowCloseRequestedNamed_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    ProcessEvents()
    assert WindowCloseRequestedNamed("Test Window") is False
    SimulateKeyPress(Keycode.Escape)
    ProcessEvents()
    assert WindowCloseRequestedNamed("Test Window") is True
    CloseWindow(test_window)


def test_WindowCloseRequested_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    ProcessEvents()
    assert WindowCloseRequested(test_window) is False
    SimulateKeyPress(Keycode.Escape)
    ProcessEvents()
    assert WindowCloseRequested(test_window) is True
    CloseWindow(test_window)


def test_WindowHasBorderNamed_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    assert WindowHasBorderNamed("Test Window") is True
    WindowToggleBorderNamed("Test Window")
    assert WindowHasBorderNamed("Test Window") is False
    CloseWindowNamed("Test Window")


def test_WindowHasBorder_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    assert WindowHasBorder(test_window) is True
    WindowToggleBorder(test_window)
    assert WindowHasBorder(test_window) is False
    CloseWindow(test_window)


def test_WindowHasFocus_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    ProcessEvents()
    assert WindowHasFocus(test_window) is True
    CloseWindow(test_window)


def test_WindowHeightNamed_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    assert WindowHeightNamed("Test Window") == 600
    CloseWindow(test_window)


def test_WindowHeight_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    assert WindowHeight(test_window) == 600
    CloseWindow(test_window)


def test_WindowIsFullscreenNamed_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    WindowToggleFullscreen(test_window)
    assert WindowIsFullscreenNamed("Test Window") is True
    WindowToggleFullscreen(test_window)
    assert WindowIsFullscreenNamed("Test Window") is False
    CloseWindow(test_window)


def test_WindowIsFullscreen_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    assert WindowIsFullscreen(test_window) is False
    WindowToggleFullscreen(test_window)
    assert WindowIsFullscreen(test_window) is True
    CloseWindow(test_window)


def test_WindowNamed_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    retrieved_window = WindowNamed("Test Window")
    assert test_window == retrieved_window
    CloseWindow(test_window)


def test_WindowPositionNamed_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_position = WindowPositionNamed("Test Window")
    assert test_position is not None
    CloseWindow(test_window)


def test_WindowPosition_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_position = WindowPosition(test_window)
    assert test_position is not None
    CloseWindow(test_window)


def test_WindowSetIcon_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_bitmap = CreateBitmap("test_icon", 32, 32)
    WindowSetIcon(test_window, test_bitmap)
    CloseWindow(test_window)
    FreeBitmap(test_bitmap)


def test_WindowToggleBorderNamed_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_has_border = WindowHasBorderNamed("Test Window")
    assert test_has_border is True
    WindowToggleBorderNamed("Test Window")
    test_has_border = WindowHasBorderNamed("Test Window")
    assert test_has_border is False
    CloseWindowNamed("Test Window")


def test_WindowToggleBorder_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    assert WindowHasBorder(test_window) is True
    WindowToggleBorder(test_window)
    assert WindowHasBorder(test_window) is False
    WindowToggleBorder(test_window)
    assert WindowHasBorder(test_window) is True
    CloseWindow(test_window)


def test_WindowToggleFullscreenNamed_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    ProcessEvents()
    assert WindowIsFullscreenNamed("Test Window") is False
    WindowToggleFullscreenNamed("Test Window")
    ProcessEvents()
    assert WindowIsFullscreenNamed("Test Window") is True
    CloseWindowNamed("Test Window")


def test_WindowToggleFullscreen_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    initial_fullscreen_state = WindowIsFullscreen(test_window)
    WindowToggleFullscreen(test_window)
    new_fullscreen_state = WindowIsFullscreen(test_window)
    assert initial_fullscreen_state != new_fullscreen_state
    CloseWindow(test_window)


def test_WindowWidthNamed_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    assert WindowWidthNamed("Test Window") == 800
    CloseWindow(test_window)


def test_WindowWidth_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    assert WindowWidth(test_window) == 800
    CloseWindow(test_window)


def test_WindowWithFocus_integration():
    test_window_1 = OpenWindow("Test Window 1", 800, 600)
    test_window_2 = OpenWindow("Test Window 2", 800, 600)
    SetCurrentWindow(test_window_1)
    focused_window = WindowWithFocus()
    assert focused_window == test_window_1
    SetCurrentWindow(test_window_2)
    focused_window = WindowWithFocus()
    assert focused_window == test_window_2
    CloseWindow(test_window_1)
    CloseWindow(test_window_2)


def test_WindowXNamed_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    MoveWindowToNamed("Test Window", 100, 200)
    assert WindowXNamed("Test Window") == 100
    CloseWindowNamed("Test Window")


def test_WindowX_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    assert WindowX(test_window) > -1
    CloseWindow(test_window)


def test_WindowYNamed_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    MoveWindowToNamed("Test Window", 100, 200)
    test_window_y = WindowYNamed("Test Window")
    assert test_window_y == 200
    CloseWindowNamed("Test Window")


def test_WindowY_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    MoveWindowTo(test_window, 100, 200)
    assert WindowY(test_window) == 200
    CloseWindow(test_window)

