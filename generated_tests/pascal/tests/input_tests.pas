uses SplashKit, TestFramework

type
TIntegrationTests = class(TTestCase)
published
procedure TIntegrationTests.TestProcessEventsIntegration;
begin
    SimulateKeyPress(Keycode.A);
    ProcessEvents();
    AssertTrue(KeyTyped(Keycode.A));
    SimulateMouseClick(Mousebutton.LEFT);
    ProcessEvents();
    AssertTrue(MouseClicked(Mousebutton.LEFT));
end;
procedure TIntegrationTests.TestQuitRequestedIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    ProcessEvents();
    AssertFalse(QuitRequested());
    SimulateKeyPress(Keycode.ESCAPE);
    ProcessEvents();
    AssertTrue(QuitRequested());
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestResetQuitIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    ProcessEvents();
    AssertTrue(QuitRequested());
    ResetQuit();
    ProcessEvents();
    AssertFalse(QuitRequested());
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestAnyKeyPressedIntegration;
begin
    ProcessEvents();
    AssertFalse(AnyKeyPressed());
    SimulateKeyPress(Keycode.A);
    ProcessEvents();
    AssertTrue(AnyKeyPressed());
end;
procedure TIntegrationTests.TestDeregisterCallbackOnKeyDownIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    RegisterCallbackOnKeyDown(OnKeyDown());
    SimulateKeyPress(Keycode.A);
    ProcessEvents();
    AssertTrue(KeyDown(Keycode.A));
    DeregisterCallbackOnKeyDown(OnKeyDown());
    SimulateKeyPress(Keycode.B);
    ProcessEvents();
    AssertFalse(KeyDown(Keycode.B));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestDeregisterCallbackOnKeyTypedIntegration;
begin
    RegisterCallbackOnKeyTyped(OnKeyTyped());
    SimulateKeyPress(Keycode.A);
    ProcessEvents();
    AssertTrue(KeyTyped(Keycode.A));
    DeregisterCallbackOnKeyTyped(OnKeyTyped());
    SimulateKeyPress(Keycode.B);
    ProcessEvents();
    AssertFalse(KeyTyped(Keycode.B));
end;
procedure TIntegrationTests.TestDeregisterCallbackOnKeyUpIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    RegisterCallbackOnKeyUp(OnKeyUp());
    SimulateKeyPress(Keycode.A);
    ProcessEvents();
    AssertTrue(KeyUp(Keycode.A));
    DeregisterCallbackOnKeyUp(OnKeyUp());
    SimulateKeyPress(Keycode.B);
    ProcessEvents();
    AssertFalse(KeyUp(Keycode.B));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestKeyDownIntegration;
begin
    ProcessEvents();
    AssertFalse(KeyDown(Keycode.A));
    SimulateKeyPress(Keycode.A);
    ProcessEvents();
    AssertTrue(KeyDown(Keycode.A));
    SimulateKeyRelease(Keycode.A);
    ProcessEvents();
    AssertFalse(KeyDown(Keycode.A));
end;
procedure TIntegrationTests.TestKeyNameIntegration;
begin
    testKeyName1 := KeyName(Keycode.A);
    AssertEquals(testKeyName1, "A");
    testKeyName2 := KeyName(Keycode.ENTER);
    AssertEquals(testKeyName2, "Enter");
end;
procedure TIntegrationTests.TestKeyReleasedIntegration;
begin
    ProcessEvents();
    AssertFalse(KeyReleased(Keycode.A));
    SimulateKeyPress(Keycode.A);
    ProcessEvents();
    SimulateKeyRelease(Keycode.A);
    ProcessEvents();
    AssertTrue(KeyReleased(Keycode.A));
end;
procedure TIntegrationTests.TestKeyTypedIntegration;
begin
    ProcessEvents();
    AssertFalse(KeyTyped(Keycode.A));
    SimulateKeyPress(Keycode.A);
    ProcessEvents();
    AssertTrue(KeyTyped(Keycode.A));
end;
procedure TIntegrationTests.TestKeyUpIntegration;
begin
    ProcessEvents();
    AssertTrue(KeyUp(Keycode.A));
    SimulateKeyPress(Keycode.A);
    ProcessEvents();
    AssertFalse(KeyUp(Keycode.A));
    SimulateKeyRelease(Keycode.A);
    ProcessEvents();
    AssertTrue(KeyUp(Keycode.A));
end;
procedure TIntegrationTests.TestRegisterCallbackOnKeyDownIntegration;
begin
    RegisterCallbackOnKeyDown(OnKeyDown());
    ProcessEvents();
    SimulateKeyPress(Keycode.A);
    ProcessEvents();
    AssertTrue(KeyDown(Keycode.A));
    DeregisterCallbackOnKeyDown(OnKeyDown());
end;
procedure TIntegrationTests.TestRegisterCallbackOnKeyTypedIntegration;
begin
    RegisterCallbackOnKeyTyped(OnKeyTyped());
    ProcessEvents();
    SimulateKeyPress(Keycode.A);
    ProcessEvents();
    AssertTrue(KeyTyped(Keycode.A));
    DeregisterCallbackOnKeyTyped(OnKeyTyped());
end;
procedure TIntegrationTests.TestRegisterCallbackOnKeyUpIntegration;
begin
    RegisterCallbackOnKeyUp(OnKeyUp());
    ProcessEvents();
    SimulateKeyPress(Keycode.A);
    SimulateKeyRelease(Keycode.A);
    ProcessEvents();
    AssertEquals(KeyUp, "A");
    DeregisterCallbackOnKeyUp(OnKeyUp());
end;
procedure TIntegrationTests.TestHideMouseIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    ProcessEvents();
    AssertTrue(MouseShown());
    HideMouse();
    ProcessEvents();
    AssertFalse(MouseShown());
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestMouseClickedIntegration;
begin
    ProcessEvents();
    AssertFalse(MouseClicked(Mousebutton.LEFT));
    SimulateMouseClick(Mousebutton.LEFT);
    ProcessEvents();
    AssertTrue(MouseClicked(Mousebutton.LEFT));
end;
procedure TIntegrationTests.TestMouseDownIntegration;
begin
    ProcessEvents();
    AssertFalse(MouseDown(Mousebutton.LEFT));
    SimulateMousePress(Mousebutton.LEFT);
    ProcessEvents();
    AssertTrue(MouseDown(Mousebutton.LEFT));
    SimulateMouseRelease(Mousebutton.LEFT);
    ProcessEvents();
    AssertFalse(MouseDown(Mousebutton.LEFT));
end;
procedure TIntegrationTests.TestMouseMovementIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    MoveMouse(100.0, 100.0);
    ProcessEvents();
    testMovement := MouseMovement();
    AssertEquals(testMovement.x, 100.0);
    AssertEquals(testMovement.y, 100.0);
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestMousePositionIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    MoveMouse(400.0, 300.0);
    ProcessEvents();
    testPosition := MousePosition();
    AssertEquals(testPosition.x, 400.0);
    AssertEquals(testPosition.y, 300.0);
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestMousePositionVectorIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    MoveMouse(400.0, 300.0);
    ProcessEvents();
    testMousePosition := MousePositionVector();
    AssertEquals(testMousePosition.x, 400.0);
    AssertEquals(testMousePosition.y, 300.0);
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestMouseShownIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    ShowMouse();
    ProcessEvents();
    AssertTrue(MouseShown());
    HideMouse();
    ProcessEvents();
    AssertFalse(MouseShown());
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestMouseUpIntegration;
begin
    ProcessEvents();
    AssertTrue(MouseUp(Mousebutton.LEFT));
    SimulateMouseClick(Mousebutton.LEFT);
    ProcessEvents();
    AssertFalse(MouseUp(Mousebutton.LEFT));
end;
procedure TIntegrationTests.TestMouseWheelScrollIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    ProcessEvents();
    AssertEquals(MouseWheelScroll(), VectorFromAngle(0.0, 0.0));
    SimulateMouseWheelScroll(10.0, 5.0);
    ProcessEvents();
    AssertTrue(MouseWheelScroll());
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestMouseXIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    MoveMouse(400.0, 300.0);
    ProcessEvents();
    AssertTrue((MouseX() >= 399.0) and (MouseX() <= 401.0));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestMouseYIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    MoveMouse(400.0, 300.0);
    ProcessEvents();
    AssertEquals(MouseY(), 300.0);
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestMoveMouseIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    ProcessEvents();
    MoveMouse(400.0, 300.0);
    ProcessEvents();
    AssertTrue((MouseX() >= 399.0) and (MouseX() <= 401.0));
    AssertTrue((MouseY() >= 299.0) and (MouseY() <= 301.0));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestMoveMouseToPointIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    MoveMouse(PointAt(400.0, 300.0));
    ProcessEvents();
    AssertEquals(MousePosition(), PointAt(400.0, 300.0));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestShowMouseIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    HideMouse();
    ProcessEvents();
    AssertFalse(MouseShown());
    ShowMouse();
    ProcessEvents();
    AssertTrue(MouseShown());
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestShowMouseWithBooleanIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    ShowMouse(true);
    ProcessEvents();
    AssertTrue(MouseShown());
    ShowMouse(false);
    ProcessEvents();
    AssertFalse(MouseShown());
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestDrawCollectedTextIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    testFont := LoadFont("test_font", "path/to/font.ttf");
    StartReadingText(RectangleFrom(100, 100, 200, 30));
    ProcessEvents();
    SimulateKeyPress(Keycode.A);
    ProcessEvents();
    DrawCollectedText(ColorBlack(), testFont, 18, OptionDefaults());
    RefreshScreen();
    AssertEquals(GetPixel(testWindow, 105, 115), ColorBlack());
    EndReadingText();
    FreeFont(testFont);
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestEndReadingTextIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    StartReadingText(RectangleFrom(100.0, 100.0, 200.0, 30.0));
    ProcessEvents();
    AssertTrue(ReadingText());
    EndReadingText();
    ProcessEvents();
    AssertFalse(ReadingText());
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestEndReadingTextInWindowIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    testRectangle := RectangleFrom(100.0, 100.0, 200.0, 30.0);
    StartReadingText(testWindow, testRectangle);
    ProcessEvents();
    AssertTrue(ReadingText(testWindow));
    EndReadingText(testWindow);
    ProcessEvents();
    AssertFalse(ReadingText(testWindow));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestReadingTextIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    StartReadingText(RectangleFrom(100.0, 100.0, 200.0, 30.0));
    ProcessEvents();
    AssertTrue(ReadingText());
    EndReadingText();
    ProcessEvents();
    AssertFalse(ReadingText());
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestReadingTextInWindowIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    testRectangle := RectangleFrom(100.0, 100.0, 200.0, 30.0);
    StartReadingText(testWindow, testRectangle);
    ProcessEvents();
    AssertTrue(ReadingText(testWindow));
    EndReadingText(testWindow);
    ProcessEvents();
    AssertFalse(ReadingText(testWindow));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestStartReadingTextIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    testRect := RectangleFrom(100.0, 100.0, 200.0, 30.0);
    StartReadingText(testRect);
    ProcessEvents();
    AssertTrue(ReadingText());
    EndReadingText();
    ProcessEvents();
    AssertFalse(ReadingText());
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestStartReadingTextWithInitialTextIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    testRect := RectangleFrom(100.0, 100.0, 200.0, 30.0);
    StartReadingText(testRect, "Initial Text");
    ProcessEvents();
    AssertTrue(ReadingText());
    EndReadingText();
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestStartReadingTextInWindowIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    testRect := RectangleFrom(100.0, 100.0, 200.0, 30.0);
    StartReadingText(testWindow, testRect);
    ProcessEvents();
    AssertTrue(ReadingText(testWindow));
    EndReadingText(testWindow);
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestStartReadingTextInWindowWithInitialTextIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    testRect := RectangleFrom(100.0, 100.0, 200.0, 30.0);
    StartReadingText(testWindow, testRect, "Initial Text");
    ProcessEvents();
    AssertTrue(ReadingText(testWindow));
    EndReadingText(testWindow);
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestTextEntryCancelledIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    StartReadingText(RectangleFrom(100.0, 100.0, 200.0, 30.0));
    ProcessEvents();
    AssertFalse(TextEntryCancelled());
    SimulateKeyPress(Keycode.ESCAPE);
    ProcessEvents();
    AssertTrue(TextEntryCancelled());
    EndReadingText();
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestTextEntryCancelledInWindowIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    testRect := RectangleFrom(100.0, 100.0, 200.0, 30.0);
    StartReadingText(testWindow, testRect);
    ProcessEvents();
    AssertFalse(TextEntryCancelled(testWindow));
    SimulateKeyPress(Keycode.ESCAPE);
    ProcessEvents();
    AssertTrue(TextEntryCancelled(testWindow));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestTextInputIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    StartReadingText(RectangleFrom(100.0, 100.0, 200.0, 30.0));
    ProcessEvents();
    SimulateKeyPress(Keycode.A);
    ProcessEvents();
    AssertEquals(TextInput(), "A");
    EndReadingText();
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestTextInputInWindowIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    testRectangle := RectangleFrom(100.0, 100.0, 200.0, 30.0);
    StartReadingText(testWindow, testRectangle);
    ProcessEvents();
    SimulateKeyPress(Keycode.A);
    ProcessEvents();
    AssertEquals(TextInput(testWindow), "A");
    EndReadingText(testWindow);
    CloseWindow(testWindow);
end;
end;

procedure RegisterTests;
begin
TestFramework.RegisterTest(TIntegrationTests.Suite);
end;
