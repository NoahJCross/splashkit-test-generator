import pytest
from splashkit import *


def test_ProcessEvents_integration():
    SimulateKeyPress(Keycode.A)
    ProcessEvents()
    assert KeyTyped(Keycode.A) is True
    SimulateMouseClick(Mousebutton.Left)
    ProcessEvents()
    assert MouseClicked(Mousebutton.Left) is True


def test_QuitRequested_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    ProcessEvents()
    assert QuitRequested() is False
    SimulateKeyPress(Keycode.Escape)
    ProcessEvents()
    assert QuitRequested() is True
    CloseWindow(test_window)


def test_ResetQuit_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    ProcessEvents()
    assert QuitRequested() is True
    ResetQuit()
    ProcessEvents()
    assert QuitRequested() is False
    CloseWindow(test_window)


def test_AnyKeyPressed_integration():
    ProcessEvents()
    assert AnyKeyPressed() is False
    SimulateKeyPress(Keycode.A)
    ProcessEvents()
    assert AnyKeyPressed() is True


def test_DeregisterCallbackOnKeyDown_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    RegisterCallbackOnKeyDown(OnKeyDown())
    SimulateKeyPress(Keycode.A)
    ProcessEvents()
    assert KeyDown(Keycode.A) is True
    DeregisterCallbackOnKeyDown(OnKeyDown())
    SimulateKeyPress(Keycode.B)
    ProcessEvents()
    assert KeyDown(Keycode.B) is False
    CloseWindow(test_window)


def test_DeregisterCallbackOnKeyTyped_integration():
    RegisterCallbackOnKeyTyped(OnKeyTyped())
    SimulateKeyPress(Keycode.A)
    ProcessEvents()
    assert KeyTyped(Keycode.A) is True
    DeregisterCallbackOnKeyTyped(OnKeyTyped())
    SimulateKeyPress(Keycode.B)
    ProcessEvents()
    assert KeyTyped(Keycode.B) is False


def test_DeregisterCallbackOnKeyUp_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    RegisterCallbackOnKeyUp(OnKeyUp())
    SimulateKeyPress(Keycode.A)
    ProcessEvents()
    assert KeyUp(Keycode.A) is True
    DeregisterCallbackOnKeyUp(OnKeyUp())
    SimulateKeyPress(Keycode.B)
    ProcessEvents()
    assert KeyUp(Keycode.B) is False
    CloseWindow(test_window)


def test_KeyDown_integration():
    ProcessEvents()
    assert KeyDown(Keycode.A) is False
    SimulateKeyPress(Keycode.A)
    ProcessEvents()
    assert KeyDown(Keycode.A) is True
    SimulateKeyRelease(Keycode.A)
    ProcessEvents()
    assert KeyDown(Keycode.A) is False


def test_KeyName_integration():
    test_key_name1 = KeyName(Keycode.A)
    assert test_key_name1 == "A"
    test_key_name2 = KeyName(Keycode.Enter)
    assert test_key_name2 == "Enter"


def test_KeyReleased_integration():
    ProcessEvents()
    assert KeyReleased(Keycode.A) is False
    SimulateKeyPress(Keycode.A)
    ProcessEvents()
    SimulateKeyRelease(Keycode.A)
    ProcessEvents()
    assert KeyReleased(Keycode.A) is True


def test_KeyTyped_integration():
    ProcessEvents()
    assert KeyTyped(Keycode.A) is False
    SimulateKeyPress(Keycode.A)
    ProcessEvents()
    assert KeyTyped(Keycode.A) is True


def test_KeyUp_integration():
    ProcessEvents()
    assert KeyUp(Keycode.A) is True
    SimulateKeyPress(Keycode.A)
    ProcessEvents()
    assert KeyUp(Keycode.A) is False
    SimulateKeyRelease(Keycode.A)
    ProcessEvents()
    assert KeyUp(Keycode.A) is True


def test_RegisterCallbackOnKeyDown_integration():
    RegisterCallbackOnKeyDown(OnKeyDown())
    ProcessEvents()
    SimulateKeyPress(Keycode.A)
    ProcessEvents()
    assert KeyDown(Keycode.A) is True
    DeregisterCallbackOnKeyDown(OnKeyDown())


def test_RegisterCallbackOnKeyTyped_integration():
    RegisterCallbackOnKeyTyped(OnKeyTyped())
    ProcessEvents()
    SimulateKeyPress(Keycode.A)
    ProcessEvents()
    assert KeyTyped(Keycode.A) is True
    DeregisterCallbackOnKeyTyped(OnKeyTyped())


def test_RegisterCallbackOnKeyUp_integration():
    RegisterCallbackOnKeyUp(OnKeyUp())
    ProcessEvents()
    SimulateKeyPress(Keycode.A)
    SimulateKeyRelease(Keycode.A)
    ProcessEvents()
    assert _key_up == "A"
    DeregisterCallbackOnKeyUp(OnKeyUp())


def test_HideMouse_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    ProcessEvents()
    assert MouseShown() is True
    HideMouse()
    ProcessEvents()
    assert MouseShown() is False
    CloseWindow(test_window)


def test_MouseClicked_integration():
    ProcessEvents()
    assert MouseClicked(Mousebutton.Left) is False
    SimulateMouseClick(Mousebutton.Left)
    ProcessEvents()
    assert MouseClicked(Mousebutton.Left) is True


def test_MouseDown_integration():
    ProcessEvents()
    assert MouseDown(Mousebutton.Left) is False
    SimulateMousePress(Mousebutton.Left)
    ProcessEvents()
    assert MouseDown(Mousebutton.Left) is True
    SimulateMouseRelease(Mousebutton.Left)
    ProcessEvents()
    assert MouseDown(Mousebutton.Left) is False


def test_MouseMovement_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    MoveMouse(100.0, 100.0)
    ProcessEvents()
    test_movement = MouseMovement()
    assert test_movement.x == 100.0
    assert test_movement.y == 100.0
    CloseWindow(test_window)


def test_MousePosition_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    MoveMouse(400.0, 300.0)
    ProcessEvents()
    test_position = MousePosition()
    assert test_position.x == 400.0
    assert test_position.y == 300.0
    CloseWindow(test_window)


def test_MousePositionVector_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    MoveMouse(400.0, 300.0)
    ProcessEvents()
    test_mouse_position = MousePositionVector()
    assert test_mouse_position.x == 400.0
    assert test_mouse_position.y == 300.0
    CloseWindow(test_window)


def test_MouseShown_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    ShowMouse()
    ProcessEvents()
    assert MouseShown() is True
    HideMouse()
    ProcessEvents()
    assert MouseShown() is False
    CloseWindow(test_window)


def test_MouseUp_integration():
    ProcessEvents()
    assert MouseUp(Mousebutton.Left) is True
    SimulateMouseClick(Mousebutton.Left)
    ProcessEvents()
    assert MouseUp(Mousebutton.Left) is False


def test_MouseWheelScroll_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    ProcessEvents()
    assert MouseWheelScroll() == VectorFromAngle(0.0, 0.0)
    SimulateMouseWheelScroll(10.0, 5.0)
    ProcessEvents()
    assert MouseWheelScroll() is True
    CloseWindow(test_window)


def test_MouseX_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    MoveMouse(400.0, 300.0)
    ProcessEvents()
    assert 399.0 <= MouseX() <= 401.0
    CloseWindow(test_window)


def test_MouseY_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    MoveMouse(400.0, 300.0)
    ProcessEvents()
    assert MouseY() == 300.0
    CloseWindow(test_window)


def test_MoveMouse_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    ProcessEvents()
    MoveMouse(400.0, 300.0)
    ProcessEvents()
    assert 399.0 <= MouseX() <= 401.0
    assert 299.0 <= MouseY() <= 301.0
    CloseWindow(test_window)


def test_MoveMouseToPoint_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    MoveMouseToPoint(PointAt(400.0, 300.0))
    ProcessEvents()
    assert MousePosition() == PointAt(400.0, 300.0)
    CloseWindow(test_window)


def test_ShowMouse_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    HideMouse()
    ProcessEvents()
    assert MouseShown() is False
    ShowMouse()
    ProcessEvents()
    assert MouseShown() is True
    CloseWindow(test_window)


def test_ShowMouseWithBoolean_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    ShowMouseWithBoolean(true)
    ProcessEvents()
    assert MouseShown() is True
    ShowMouseWithBoolean(false)
    ProcessEvents()
    assert MouseShown() is False
    CloseWindow(test_window)


def test_DrawCollectedText_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_font = LoadFont("test_font", "path/to/font.ttf")
    StartReadingText(RectangleFrom(100, 100, 200, 30))
    ProcessEvents()
    SimulateKeyPress(Keycode.A)
    ProcessEvents()
    DrawCollectedText(ColorBlack(), test_font, 18, OptionDefaults())
    RefreshScreen()
    assert GetPixel(test_window, 105, 115) == ColorBlack()
    EndReadingText()
    FreeFont(test_font)
    CloseWindow(test_window)


def test_EndReadingText_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    StartReadingText(RectangleFrom(100.0, 100.0, 200.0, 30.0))
    ProcessEvents()
    assert ReadingText() is True
    EndReadingText()
    ProcessEvents()
    assert ReadingText() is False
    CloseWindow(test_window)


def test_EndReadingTextInWindow_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_rectangle = RectangleFrom(100.0, 100.0, 200.0, 30.0)
    StartReadingTextInWindow(test_window, test_rectangle)
    ProcessEvents()
    assert ReadingTextInWindow(test_window) is True
    EndReadingTextInWindow(test_window)
    ProcessEvents()
    assert ReadingTextInWindow(test_window) is False
    CloseWindow(test_window)


def test_ReadingText_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    StartReadingText(RectangleFrom(100.0, 100.0, 200.0, 30.0))
    ProcessEvents()
    assert ReadingText() is True
    EndReadingText()
    ProcessEvents()
    assert ReadingText() is False
    CloseWindow(test_window)


def test_ReadingTextInWindow_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_rectangle = RectangleFrom(100.0, 100.0, 200.0, 30.0)
    StartReadingTextInWindow(test_window, test_rectangle)
    ProcessEvents()
    assert ReadingTextInWindow(test_window) is True
    EndReadingTextInWindow(test_window)
    ProcessEvents()
    assert ReadingTextInWindow(test_window) is False
    CloseWindow(test_window)


def test_StartReadingText_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_rect = RectangleFrom(100.0, 100.0, 200.0, 30.0)
    StartReadingText(test_rect)
    ProcessEvents()
    assert ReadingText() is True
    EndReadingText()
    ProcessEvents()
    assert ReadingText() is False
    CloseWindow(test_window)


def test_StartReadingTextWithInitialText_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_rect = RectangleFrom(100.0, 100.0, 200.0, 30.0)
    StartReadingTextWithInitialText(test_rect, "Initial Text")
    ProcessEvents()
    assert ReadingText() is True
    EndReadingText()
    CloseWindow(test_window)


def test_StartReadingTextInWindow_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_rect = RectangleFrom(100.0, 100.0, 200.0, 30.0)
    StartReadingTextInWindow(test_window, test_rect)
    ProcessEvents()
    assert ReadingTextInWindow(test_window) is True
    EndReadingTextInWindow(test_window)
    CloseWindow(test_window)


def test_StartReadingTextInWindowWithInitialText_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_rect = RectangleFrom(100.0, 100.0, 200.0, 30.0)
    StartReadingTextInWindowWithInitialText(test_window, test_rect, "Initial Text")
    ProcessEvents()
    assert ReadingTextInWindow(test_window) is True
    EndReadingTextInWindow(test_window)
    CloseWindow(test_window)


def test_TextEntryCancelled_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    StartReadingText(RectangleFrom(100.0, 100.0, 200.0, 30.0))
    ProcessEvents()
    assert TextEntryCancelled() is False
    SimulateKeyPress(Keycode.Escape)
    ProcessEvents()
    assert TextEntryCancelled() is True
    EndReadingText()
    CloseWindow(test_window)


def test_TextEntryCancelledInWindow_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_rect = RectangleFrom(100.0, 100.0, 200.0, 30.0)
    StartReadingTextInWindow(test_window, test_rect)
    ProcessEvents()
    assert TextEntryCancelledInWindow(test_window) is False
    SimulateKeyPress(Keycode.Escape)
    ProcessEvents()
    assert TextEntryCancelledInWindow(test_window) is True
    CloseWindow(test_window)


def test_TextInput_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    StartReadingText(RectangleFrom(100.0, 100.0, 200.0, 30.0))
    ProcessEvents()
    SimulateKeyPress(Keycode.A)
    ProcessEvents()
    assert TextInput() == "A"
    EndReadingText()
    CloseWindow(test_window)


def test_TextInputInWindow_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_rectangle = RectangleFrom(100.0, 100.0, 200.0, 30.0)
    StartReadingTextInWindow(test_window, test_rectangle)
    ProcessEvents()
    SimulateKeyPress(Keycode.A)
    ProcessEvents()
    assert TextInputInWindow(test_window) == "A"
    EndReadingTextInWindow(test_window)
    CloseWindow(test_window)

