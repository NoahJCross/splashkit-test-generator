uses SplashKit, TestFramework

type
TTestInput = class(TTestCase)
protected
procedure TIntegrationTests.TestProcessEventsIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    while KeyTyped(KeyCode.A_KEY) = false do
        ProcessEvents();
        ClearScreen();
        DrawText("Press A to test events", ColorBlack(), 10, 10);
        DrawText('Key Typed: ' + KeyTyped(KeyCode.A_KEY) + '', ColorBlack(), 10, 30);
        RefreshScreen();
    end;
    while MouseClicked(MouseButton.LEFT_BUTTON) = false do
        ProcessEvents();
        ClearScreen();
        DrawText("Click left mouse button to test events", ColorBlack(), 10, 10);
        DrawText('Mouse Clicked: ' + MouseClicked(MouseButton.LEFT_BUTTON) + '', ColorBlack(), 10, 30);
        RefreshScreen();
    end;
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestQuitRequestedIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    while QuitRequested() = false do
        ProcessEvents();
        ClearScreen();
        DrawText("Press Escape to test quit", ColorBlack(), 10, 10);
        DrawText('Quit Requested: ' + QuitRequested() + '', ColorBlack(), 10, 30);
        RefreshScreen();
    end;
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestResetQuitIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    while QuitRequested() = false do
        ProcessEvents();
        ClearScreen();
        DrawText("Press Escape to test quit", ColorBlack(), 10, 10);
        DrawText('Quit Requested: ' + QuitRequested() + '', ColorBlack(), 10, 30);
        RefreshScreen();
        ResetQuit();
    end;
    while KeyDown(KeyCode.A_KEY) = false do
        ProcessEvents();
        ClearScreen();
        DrawText("Press A to continue after reset", ColorBlack(), 10, 10);
        DrawText('Key Down: ' + KeyDown(KeyCode.A_KEY) + '', ColorBlack(), 10, 30);
        RefreshScreen();
    end;
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestAnyKeyPressedIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    while AnyKeyPressed() = false do
        ProcessEvents();
        ClearScreen();
        DrawText("Press any key to test", ColorBlack(), 10, 10);
        DrawText('Any Key Pressed: ' + AnyKeyPressed() + '', ColorBlack(), 10, 30);
        RefreshScreen();
    end;
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestDeregisterCallbackOnKeyDownIntegration;
begin
    callbacks := KeyCallbacks.Create();
    testWindow := OpenWindow("Test Window", 800, 600);
    RegisterCallbackOnKeyDown(callbacks.on_key_down);
    while KeyDown(KeyCode.A_KEY) = false do
        ProcessEvents();
        ClearScreen();
        DrawText("Press A to test callback", ColorBlack(), 10, 10);
        DrawText('Key Down: ' + KeyDown(KeyCode.A_KEY) + '', ColorBlack(), 10, 30);
        DrawText('Callback received: ' + callbacks.get_key_down + '', ColorBlack(), 10, 50);
        RefreshScreen();
        DeregisterCallbackOnKeyDown(callbacks.on_key_down);
    end;
    while KeyDown(KeyCode.B_KEY) = false do
        ProcessEvents();
        ClearScreen();
        DrawText("Press B to test deregistered callback", ColorBlack(), 10, 10);
        DrawText('Key Down: ' + KeyDown(KeyCode.B_KEY) + '', ColorBlack(), 10, 30);
        DrawText('Callback received: ' + callbacks.get_key_down + '', ColorBlack(), 10, 50);
        RefreshScreen();
    end;
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestDeregisterCallbackOnKeyTypedIntegration;
begin
    callbacks := KeyCallbacks.Create();
    testWindow := OpenWindow("Test Window", 800, 600);
    RegisterCallbackOnKeyTyped(callbacks.on_key_typed);
    while KeyTyped(KeyCode.A_KEY) = false do
        ProcessEvents();
        ClearScreen();
        DrawText("Press A to test callback", ColorBlack(), 10, 10);
        DrawText('Key Typed: ' + KeyTyped(KeyCode.A_KEY) + '', ColorBlack(), 10, 30);
        DrawText('Callback received: ' + callbacks.get_key_typed + '', ColorBlack(), 10, 50);
        RefreshScreen();
        DeregisterCallbackOnKeyTyped(callbacks.on_key_typed);
    end;
    while KeyTyped(KeyCode.B_KEY) = false do
        ProcessEvents();
        ClearScreen();
        DrawText("Press B to test deregistered callback", ColorBlack(), 10, 10);
        DrawText('Key Typed: ' + KeyTyped(KeyCode.B_KEY) + '', ColorBlack(), 10, 30);
        DrawText('Callback received: ' + callbacks.get_key_typed + '', ColorBlack(), 10, 50);
        RefreshScreen();
    end;
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestDeregisterCallbackOnKeyUpIntegration;
begin
    callbacks := KeyCallbacks.Create();
    testWindow := OpenWindow("Test Window", 800, 600);
    RegisterCallbackOnKeyUp(callbacks.on_key_up);
    while KeyUp(KeyCode.A_KEY) = false do
        ProcessEvents();
        ClearScreen();
        DrawText("Press and release A to test callback", ColorBlack(), 10, 10);
        DrawText('Key Up: ' + KeyUp(KeyCode.A_KEY) + '', ColorBlack(), 10, 30);
        DrawText('Callback received: ' + callbacks.get_key_up + '', ColorBlack(), 10, 50);
        RefreshScreen();
        DeregisterCallbackOnKeyUp(callbacks.on_key_up);
    end;
    while KeyUp(KeyCode.B_KEY) = false do
        ProcessEvents();
        ClearScreen();
        DrawText("Press and release B to test deregistered callback", ColorBlack(), 10, 10);
        DrawText('Key Up: ' + KeyUp(KeyCode.B_KEY) + '', ColorBlack(), 10, 30);
        DrawText('Callback received: ' + callbacks.get_key_up + '', ColorBlack(), 10, 50);
        RefreshScreen();
    end;
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestKeyDownIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    while KeyDown(KeyCode.A_KEY) = false do
        ProcessEvents();
        ClearScreen();
        DrawText("Press and hold A", ColorBlack(), 10, 10);
        DrawText('Key Down: ' + KeyDown(KeyCode.A_KEY) + '', ColorBlack(), 10, 30);
        RefreshScreen();
    end;
    while KeyDown(KeyCode.A_KEY) <> false do
        ProcessEvents();
        ClearScreen();
        DrawText("Release A", ColorBlack(), 10, 10);
        DrawText('Key Down: ' + KeyDown(KeyCode.A_KEY) + '', ColorBlack(), 10, 30);
        RefreshScreen();
    end;
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestKeyNameIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    while KeyDown(KeyCode.A_KEY) = false do
        ProcessEvents();
        ClearScreen();
        DrawText("Press A to test key name", ColorBlack(), 10, 10);
        DrawText('Key Name: ' + KeyName(KeyCode.A_KEY) + '', ColorBlack(), 10, 30);
        RefreshScreen();
    end;
    while KeyDown(KeyCode.KEYPAD_ENTER) = false do
        ProcessEvents();
        ClearScreen();
        DrawText("Press Enter to test key name", ColorBlack(), 10, 10);
        DrawText('Key Name: ' + KeyName(KeyCode.KEYPAD_ENTER) + '', ColorBlack(), 10, 30);
        RefreshScreen();
    end;
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestKeyReleasedIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    while KeyReleased(KeyCode.A_KEY) = false do
        ProcessEvents();
        ClearScreen();
        DrawText("Press and release A", ColorBlack(), 10, 10);
        DrawText('Key Released: ' + KeyReleased(KeyCode.A_KEY) + '', ColorBlack(), 10, 30);
        RefreshScreen();
    end;
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestKeyTypedIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    while KeyTyped(KeyCode.A_KEY) = false do
        ProcessEvents();
        ClearScreen();
        DrawText("Press A to test key typed", ColorBlack(), 10, 10);
        DrawText('Key Typed: ' + KeyTyped(KeyCode.A_KEY) + '', ColorBlack(), 10, 30);
        RefreshScreen();
    end;
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestKeyUpIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    while KeyUp(KeyCode.A_KEY) = false do
        ProcessEvents();
        ClearScreen();
        DrawText("Press and release A", ColorBlack(), 10, 10);
        DrawText('Key Up: ' + KeyUp(KeyCode.A_KEY) + '', ColorBlack(), 10, 30);
        RefreshScreen();
    end;
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestRegisterCallbackOnKeyDownIntegration;
begin
    callbacks := KeyCallbacks.Create();
    testWindow := OpenWindow("Test Window", 800, 600);
    RegisterCallbackOnKeyDown(callbacks.on_key_down);
    while KeyDown(KeyCode.A_KEY) = false do
        ProcessEvents();
        ClearScreen();
        DrawText("Press A to test callback", ColorBlack(), 10, 10);
        DrawText('Key Down: ' + KeyDown(KeyCode.A_KEY) + '', ColorBlack(), 10, 30);
        DrawText('Callback received: ' + callbacks.get_key_down + '', ColorBlack(), 10, 50);
        RefreshScreen();
    end;
    DeregisterCallbackOnKeyDown(callbacks.on_key_down);
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestRegisterCallbackOnKeyTypedIntegration;
begin
    callbacks := KeyCallbacks.Create();
    testWindow := OpenWindow("Test Window", 800, 600);
    RegisterCallbackOnKeyTyped(callbacks.on_key_typed);
    while KeyTyped(KeyCode.A_KEY) = false do
        ProcessEvents();
        ClearScreen();
        DrawText("Press A to test callback", ColorBlack(), 10, 10);
        DrawText('Key Typed: ' + KeyTyped(KeyCode.A_KEY) + '', ColorBlack(), 10, 30);
        DrawText('Callback received: ' + callbacks.get_key_typed + '', ColorBlack(), 10, 50);
        RefreshScreen();
    end;
    DeregisterCallbackOnKeyTyped(callbacks.on_key_typed);
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestRegisterCallbackOnKeyUpIntegration;
begin
    callbacks := KeyCallbacks.Create();
    testWindow := OpenWindow("Test Window", 800, 600);
    RegisterCallbackOnKeyUp(callbacks.on_key_up);
    while KeyUp(KeyCode.A_KEY) = false do
        ProcessEvents();
        ClearScreen();
        DrawText("Press and release A to test callback", ColorBlack(), 10, 10);
        DrawText('Key Up: ' + KeyUp(KeyCode.A_KEY) + '', ColorBlack(), 10, 30);
        DrawText('Callback received: ' + callbacks.get_key_up + '', ColorBlack(), 10, 50);
        RefreshScreen();
    end;
    DeregisterCallbackOnKeyUp(callbacks.on_key_up);
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestHideMouseIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    while KeyDown(KeyCode.H_KEY) = false do
        ProcessEvents();
        ClearScreen();
        DrawText("Press H to hide mouse", ColorBlack(), 10, 10);
        DrawText('Mouse Shown: ' + MouseShown() + '', ColorBlack(), 10, 30);
        RefreshScreen();
        HideMouse();
    end;
    while KeyDown(KeyCode.S_KEY) = false do
        ProcessEvents();
        ClearScreen();
        DrawText("Press S to show mouse", ColorBlack(), 10, 10);
        DrawText('Mouse Shown: ' + MouseShown() + '', ColorBlack(), 10, 30);
        RefreshScreen();
    end;
    ShowMouse();
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestMouseClickedIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    while MouseClicked(MouseButton.LEFT_BUTTON) = false do
        ProcessEvents();
        ClearScreen();
        DrawText("Click left mouse button", ColorBlack(), 10, 10);
        DrawText('Mouse Clicked: ' + MouseClicked(MouseButton.LEFT_BUTTON) + '', ColorBlack(), 10, 30);
        RefreshScreen();
    end;
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestMouseDownIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    while MouseDown(MouseButton.LEFT_BUTTON) = false do
        ProcessEvents();
        ClearScreen();
        DrawText("Press and hold left mouse button", ColorBlack(), 10, 10);
        DrawText('Mouse Down: ' + MouseDown(MouseButton.LEFT_BUTTON) + '', ColorBlack(), 10, 30);
        RefreshScreen();
    end;
    while MouseDown(MouseButton.LEFT_BUTTON) <> false do
        ProcessEvents();
        ClearScreen();
        DrawText("Release left mouse button", ColorBlack(), 10, 10);
        DrawText('Mouse Down: ' + MouseDown(MouseButton.LEFT_BUTTON) + '', ColorBlack(), 10, 30);
        RefreshScreen();
    end;
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestMouseMovementIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    while KeyDown(KeyCode.SPACE_KEY) = false do
        ProcessEvents();
        ClearScreen();
        movement := MouseMovement();
        DrawText("Move mouse to test movement", ColorBlack(), 10, 10);
        DrawText('Mouse Position: X=' + MouseX() + ', Y=' + MouseY() + '', ColorBlack(), 10, 30);
        DrawText("Press Space to end test", ColorBlack(), 10, 50);
        RefreshScreen();
    end;
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestMousePositionIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    while KeyDown(KeyCode.SPACE_KEY) = false do
        ProcessEvents();
        ClearScreen();
        position := MousePosition();
        DrawText("Move mouse to test position", ColorBlack(), 10, 10);
        DrawText('Mouse Position: X=' + MouseX() + ', Y=' + MouseY() + '', ColorBlack(), 10, 30);
        DrawText("Press Space to end test", ColorBlack(), 10, 50);
        RefreshScreen();
    end;
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestMousePositionVectorIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    while KeyDown(KeyCode.SPACE_KEY) = false do
        ProcessEvents();
        ClearScreen();
        position := MousePositionVector();
        DrawText("Move mouse to test position", ColorBlack(), 10, 10);
        DrawText('Mouse Position: X=' + MouseX() + ', Y=' + MouseY() + '', ColorBlack(), 10, 30);
        DrawText("Press Space to end test", ColorBlack(), 10, 50);
        RefreshScreen();
    end;
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestMouseShownIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    while KeyDown(KeyCode.H_KEY) = false do
        ProcessEvents();
        ClearScreen();
        DrawText("Press H to hide mouse", ColorBlack(), 10, 10);
        DrawText('Mouse Shown: ' + MouseShown() + '', ColorBlack(), 10, 30);
        RefreshScreen();
        HideMouse();
    end;
    while KeyDown(KeyCode.S_KEY) = false do
        ProcessEvents();
        ClearScreen();
        DrawText("Press S to show mouse", ColorBlack(), 10, 10);
        DrawText('Mouse Shown: ' + MouseShown() + '', ColorBlack(), 10, 30);
        RefreshScreen();
    end;
    ShowMouse();
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestMouseUpIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    while MouseUp(MouseButton.LEFT_BUTTON) = false do
        ProcessEvents();
        ClearScreen();
        DrawText("Click and release left mouse button", ColorBlack(), 10, 10);
        DrawText('Mouse Up: ' + MouseUp(MouseButton.LEFT_BUTTON) + '', ColorBlack(), 10, 30);
        RefreshScreen();
    end;
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestMouseWheelScrollIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    while KeyDown(KeyCode.SPACE_KEY) = false do
        ProcessEvents();
        ClearScreen();
        scroll := MouseWheelScroll();
        DrawText("Scroll mouse wheel to test", ColorBlack(), 10, 10);
        DrawText('Mouse Position: X=' + MouseX() + ', Y=' + MouseY() + '', ColorBlack(), 10, 30);
        DrawText("Press Space to end test", ColorBlack(), 10, 50);
        RefreshScreen();
    end;
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestMouseXIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    while KeyDown(KeyCode.SPACE_KEY) = false do
        ProcessEvents();
        ClearScreen();
        DrawText("Move mouse to test X position", ColorBlack(), 10, 10);
        DrawText('Mouse Position: X=' + MouseX() + ', Y=' + MouseY() + '', ColorBlack(), 10, 30);
        DrawText("Press Space to end test", ColorBlack(), 10, 50);
        RefreshScreen();
    end;
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestMouseYIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    while KeyDown(KeyCode.SPACE_KEY) = false do
        ProcessEvents();
        ClearScreen();
        DrawText("Move mouse to test Y position", ColorBlack(), 10, 10);
        DrawText('Mouse Position: X=' + MouseX() + ', Y=' + MouseY() + '', ColorBlack(), 10, 30);
        DrawText("Press Space to end test", ColorBlack(), 10, 50);
        RefreshScreen();
    end;
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestMoveMouseIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    while KeyDown(KeyCode.M_KEY) = false do
        ProcessEvents();
        ClearScreen();
        DrawText("Press M to move mouse to center", ColorBlack(), 10, 10);
        DrawText('Mouse Position: X=' + MouseX() + ', Y=' + MouseY() + '', ColorBlack(), 10, 30);
        RefreshScreen();
        MoveMouse(400, 300);
    end;
    while KeyDown(KeyCode.SPACE_KEY) = false do
        ProcessEvents();
        ClearScreen();
        DrawText("Mouse moved to center", ColorBlack(), 10, 10);
        DrawText('Mouse Position: X=' + MouseX() + ', Y=' + MouseY() + '', ColorBlack(), 10, 30);
        DrawText("Press Space to end test", ColorBlack(), 10, 50);
        RefreshScreen();
    end;
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestMoveMouseToPointIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    while KeyDown(KeyCode.M_KEY) = false do
        ProcessEvents();
        ClearScreen();
        DrawText("Press M to move mouse to center", ColorBlack(), 10, 10);
        DrawText('Mouse Position: X=' + MouseX() + ', Y=' + MouseY() + '', ColorBlack(), 10, 30);
        RefreshScreen();
        MoveMouse(PointAt(400, 300));
    end;
    while KeyDown(KeyCode.SPACE_KEY) = false do
        ProcessEvents();
        ClearScreen();
        DrawText("Mouse moved to center", ColorBlack(), 10, 10);
        DrawText('Mouse Position: X=' + MouseX() + ', Y=' + MouseY() + '', ColorBlack(), 10, 30);
        DrawText("Press Space to end test", ColorBlack(), 10, 50);
        RefreshScreen();
    end;
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestShowMouseIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    while KeyDown(KeyCode.H_KEY) = false do
        ProcessEvents();
        ClearScreen();
        DrawText("Press H to hide mouse", ColorBlack(), 10, 10);
        DrawText('Mouse Shown: ' + MouseShown() + '', ColorBlack(), 10, 30);
        RefreshScreen();
        HideMouse();
    end;
    while KeyDown(KeyCode.S_KEY) = false do
        ProcessEvents();
        ClearScreen();
        DrawText("Press S to show mouse", ColorBlack(), 10, 10);
        DrawText('Mouse Shown: ' + MouseShown() + '', ColorBlack(), 10, 30);
        RefreshScreen();
    end;
    ShowMouse();
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestShowMouseWithBooleanIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    while KeyDown(KeyCode.H_KEY) = false do
        ProcessEvents();
        ClearScreen();
        DrawText("Press H to hide mouse", ColorBlack(), 10, 10);
        DrawText('Mouse Shown: ' + MouseShown() + '', ColorBlack(), 10, 30);
        RefreshScreen();
        ShowMouse(false);
    end;
    while KeyDown(KeyCode.S_KEY) = false do
        ProcessEvents();
        ClearScreen();
        DrawText("Press S to show mouse", ColorBlack(), 10, 10);
        DrawText('Mouse Shown: ' + MouseShown() + '', ColorBlack(), 10, 30);
        RefreshScreen();
    end;
    ShowMouse(true);
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestDrawCollectedTextIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    testFont := LoadFont("test_font", "hara.ttf");
    StartReadingText(RectangleFrom(100, 100, 200, 30));
    while KeyDown(KeyCode.KEYPAD_ENTER) = false do
        ProcessEvents();
        ClearScreen();
        DrawText("Type some text, press Enter when done", ColorBlack(), 10, 10);
        DrawCollectedText(ColorBlack(), testFont, 18, OptionDefaults());
        RefreshScreen();
    end;
    EndReadingText();
    FreeFont(testFont);
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestEndReadingTextIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    StartReadingText(RectangleFrom(100, 100, 200, 30));
    while KeyDown(KeyCode.KEYPAD_ENTER) = false do
        ProcessEvents();
        ClearScreen();
        DrawText("Type some text, press Enter when done", ColorBlack(), 10, 10);
        DrawText('Reading Text: ' + ReadingText() + '', ColorBlack(), 10, 30);
        RefreshScreen();
        EndReadingText();
    end;
    while KeyDown(KeyCode.SPACE_KEY) = false do
        ProcessEvents();
        ClearScreen();
        DrawText("Text input ended", ColorBlack(), 10, 10);
        DrawText('Reading Text: ' + ReadingText() + '', ColorBlack(), 10, 30);
        DrawText("Press Space to end test", ColorBlack(), 10, 50);
        RefreshScreen();
    end;
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestEndReadingTextInWindowIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    testRectangle := RectangleFrom(100, 100, 200, 30);
    StartReadingText(testWindow, testRectangle);
    while KeyDown(KeyCode.KEYPAD_ENTER) = false do
        ProcessEvents();
        ClearScreen();
        DrawText("Type some text, press Enter when done", ColorBlack(), 10, 10);
        DrawText('Reading Text: ' + ReadingText(testWindow) + '', ColorBlack(), 10, 30);
        RefreshScreen();
        EndReadingText(testWindow);
    end;
    while KeyDown(KeyCode.SPACE_KEY) = false do
        ProcessEvents();
        ClearScreen();
        DrawText("Text input ended", ColorBlack(), 10, 10);
        DrawText('Reading Text: ' + ReadingText(testWindow) + '', ColorBlack(), 10, 30);
        DrawText("Press Space to end test", ColorBlack(), 10, 50);
        RefreshScreen();
    end;
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestReadingTextIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    StartReadingText(RectangleFrom(100, 100, 200, 30));
    while KeyDown(KeyCode.KEYPAD_ENTER) = false do
        ProcessEvents();
        ClearScreen();
        DrawText("Type some text, press Enter when done", ColorBlack(), 10, 10);
        DrawText('Reading Text: ' + ReadingText() + '', ColorBlack(), 10, 30);
        RefreshScreen();
    end;
    EndReadingText();
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestReadingTextInWindowIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    testRectangle := RectangleFrom(100, 100, 200, 30);
    StartReadingText(testWindow, testRectangle);
    while KeyDown(KeyCode.KEYPAD_ENTER) = false do
        ProcessEvents();
        ClearScreen();
        DrawText("Type some text, press Enter when done", ColorBlack(), 10, 10);
        DrawText('Reading Text: ' + ReadingText(testWindow) + '', ColorBlack(), 10, 30);
        RefreshScreen();
    end;
    EndReadingText(testWindow);
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestStartReadingTextIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    testRect := RectangleFrom(100, 100, 200, 30);
    StartReadingText(testRect);
    while KeyDown(KeyCode.KEYPAD_ENTER) = false do
        ProcessEvents();
        ClearScreen();
        DrawText("Type some text, press Enter when done", ColorBlack(), 10, 10);
        DrawText('Current Text: ' + TextInput() + '', ColorBlack(), 10, 30);
        RefreshScreen();
    end;
    EndReadingText();
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestStartReadingTextWithInitialTextIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    testRect := RectangleFrom(100, 100, 200, 30);
    StartReadingText(testRect, "Initial Text");
    while KeyDown(KeyCode.KEYPAD_ENTER) = false do
        ProcessEvents();
        ClearScreen();
        DrawText("Type some text, press Enter when done", ColorBlack(), 10, 10);
        DrawText('Current Text: ' + TextInput() + '', ColorBlack(), 10, 30);
        RefreshScreen();
    end;
    EndReadingText();
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestStartReadingTextInWindowIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    testRect := RectangleFrom(100, 100, 200, 30);
    StartReadingText(testWindow, testRect);
    while KeyDown(KeyCode.KEYPAD_ENTER) = false do
        ProcessEvents();
        ClearScreen();
        DrawText("Type some text, press Enter when done", ColorBlack(), 10, 10);
        DrawText('Current Text: ' + TextInput(testWindow) + '', ColorBlack(), 10, 30);
        RefreshScreen();
    end;
    EndReadingText(testWindow);
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestStartReadingTextInWindowWithInitialTextIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    testRect := RectangleFrom(100, 100, 200, 30);
    StartReadingText(testWindow, testRect, "Initial Text");
    while KeyDown(KeyCode.KEYPAD_ENTER) = false do
        ProcessEvents();
        ClearScreen();
        DrawText("Type some text, press Enter when done", ColorBlack(), 10, 10);
        DrawText('Current Text: ' + TextInput(testWindow) + '', ColorBlack(), 10, 30);
        RefreshScreen();
    end;
    EndReadingText(testWindow);
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestTextEntryCancelledIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    StartReadingText(RectangleFrom(100, 100, 200, 30));
    while KeyDown(KeyCode.ESCAPE_KEY) = false do
        ProcessEvents();
        ClearScreen();
        DrawText("Press Escape to cancel text entry", ColorBlack(), 10, 10);
        DrawText('Text Entry Cancelled: ' + TextEntryCancelled() + '', ColorBlack(), 10, 30);
        RefreshScreen();
    end;
    EndReadingText();
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestTextEntryCancelledInWindowIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    testRect := RectangleFrom(100, 100, 200, 30);
    StartReadingText(testWindow, testRect);
    while KeyDown(KeyCode.ESCAPE_KEY) = false do
        ProcessEvents();
        ClearScreen();
        DrawText("Press Escape to cancel text entry", ColorBlack(), 10, 10);
        DrawText('Text Entry Cancelled: ' + TextEntryCancelled(testWindow) + '', ColorBlack(), 10, 30);
        RefreshScreen();
    end;
    EndReadingText(testWindow);
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestTextInputIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    StartReadingText(RectangleFrom(100, 100, 200, 30));
    while KeyDown(KeyCode.KEYPAD_ENTER) = false do
        ProcessEvents();
        ClearScreen();
        DrawText("Type some text, press Enter when done", ColorBlack(), 10, 10);
        DrawText('Current Text: ' + TextInput() + '', ColorBlack(), 10, 30);
        RefreshScreen();
    end;
    EndReadingText();
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestTextInputInWindowIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    testRect := RectangleFrom(100, 100, 200, 30);
    StartReadingText(testWindow, testRect);
    while KeyDown(KeyCode.KEYPAD_ENTER) = false do
        ProcessEvents();
        ClearScreen();
        DrawText("Type some text, press Enter when done", ColorBlack(), 10, 10);
        DrawText('Current Text: ' + TextInput(testWindow) + '', ColorBlack(), 10, 30);
        RefreshScreen();
    end;
    EndReadingText(testWindow);
    CloseWindow(testWindow);
end;
end;

procedure RegisterTests;
begin
#<Proc:0x00007f7a8f3c6228 /mnt/c/Users/Noahc/Documents/.Year 2 Semester 3/Team Project (A)/Github Repo/splashkit_test_generator/test_generator/config/languages/pascal_config.rb:117 (lambda)>
end;
