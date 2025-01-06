uses SplashKit, TestFramework, ../Helpers;
type
    TTestInput = class(TTestCase)
    protected
        procedure Setup; override;
    end;
begin
    inherited;
    SetResourcesPath('/mnt/c/Users/Noahc/Documents/aYear_2_semester_2/TeamProject/GitHubRepo/splashkit_test_generator/resources');
end;
procedure TestProcessEventsIntegration;
begin
    OpenWindow('Test Window 1', 800, 600);
    CleanupWindow := TWindowCleanup.Create;
    while KeyTyped(KeyCode.A_KEY) = false do
        ProcessEvents();
        ClearScreen();
        DrawText('Test: process_events', ColorBlack(), 10.0, 10.0);
        DrawText('Press A to test events', ColorBlack(), 10.0, 30.0);
        DrawText('Key Typed: ' + KeyTyped(KeyCode.A_KEY), ColorBlack(), 10.0, 50.0);
        RefreshScreen();
    end;
    while MouseClicked(MouseButton.LEFT_BUTTON) = false do
        ProcessEvents();
        ClearScreen();
        DrawText('Test: process_events', ColorBlack(), 10.0, 10.0);
        DrawText('Click left mouse button to test events', ColorBlack(), 10.0, 30.0);
        DrawText('Mouse Clicked: ' + MouseClicked(MouseButton.LEFT_BUTTON), ColorBlack(), 10.0, 50.0);
        RefreshScreen();
    end;
end;
procedure TestQuitRequestedIntegration;
begin
    OpenWindow('Test Window 2', 800, 600);
    CleanupWindow := TWindowCleanup.Create;
    while QuitRequested() = false do
        ProcessEvents();
        ClearScreen();
        DrawText('Test: quit_requested', ColorBlack(), 10.0, 10.0);
        DrawText('Close window to test quit requested', ColorBlack(), 10.0, 30.0);
        DrawText('Quit Requested: ' + QuitRequested(), ColorBlack(), 10.0, 50.0);
        RefreshScreen();
    end;
end;
procedure TestResetQuitIntegration;
begin
    OpenWindow('Test Window 3', 800, 600);
    CleanupWindow := TWindowCleanup.Create;
    while QuitRequested() = false do
        ProcessEvents();
        ClearScreen();
        DrawText('Test: reset_quit', ColorBlack(), 10.0, 10.0);
        DrawText('Close window to test reset quit', ColorBlack(), 10.0, 30.0);
        DrawText('Quit Requested: ' + QuitRequested(), ColorBlack(), 10.0, 50.0);
        RefreshScreen();
    end;
    ResetQuit();
    while KeyDown(KeyCode.SPACE_KEY) = false do
        ProcessEvents();
        ClearScreen();
        DrawText('Test: reset_quit', ColorBlack(), 10.0, 10.0);
        DrawText('Press Space to end test after reset quit', ColorBlack(), 10.0, 30.0);
        DrawText('Key Down: ' + KeyDown(KeyCode.A_KEY), ColorBlack(), 10.0, 50.0);
        RefreshScreen();
    end;
end;
procedure TestAnyKeyPressedIntegration;
begin
    OpenWindow('Test Window 4', 800, 600);
    CleanupWindow := TWindowCleanup.Create;
    while AnyKeyPressed() = false do
        ProcessEvents();
        ClearScreen();
        DrawText('Test: any_key_pressed', ColorBlack(), 10.0, 10.0);
        DrawText('Press any key to test', ColorBlack(), 10.0, 30.0);
        DrawText('Any Key Pressed: ' + AnyKeyPressed(), ColorBlack(), 10.0, 50.0);
        RefreshScreen();
    end;
    AssertTrue(AnyKeyPressed());
end;
procedure TestDeregisterCallbackOnKeyDownIntegration;
begin
    callbacks := KeyCallbacks.Create();
    OpenWindow('Test Window 5', 800, 600);
    CleanupWindow := TWindowCleanup.Create;
    RegisterCallbackOnKeyDown(callbacks.on_key_down);
    while callbacks.get_key_down <> KeyCode.A_KEY do
        ProcessEvents();
        ClearScreen();
        DrawText('Test: deregister_callback_on_key_down', ColorBlack(), 10.0, 10.0);
        DrawText('Press A to test callback', ColorBlack(), 10.0, 30.0);
        DrawText('Key Down: ' + KeyDown(KeyCode.A_KEY), ColorBlack(), 10.0, 50.0);
        DrawText('Callback received: ' + KeyName(callbacks.get_key_down), ColorBlack(), 10.0, 70.0);
        RefreshScreen();
    end;
    DeregisterCallbackOnKeyDown(callbacks.on_key_down);
    while KeyDown(KeyCode.SPACE_KEY) = false do
        ProcessEvents();
        ClearScreen();
        DrawText('Test: deregister_callback_on_key_down', ColorBlack(), 10.0, 10.0);
        DrawText('Press B to test deregistered callback on key down', ColorBlack(), 10.0, 30.0);
        DrawText('Key Down: ' + KeyDown(KeyCode.B_KEY), ColorBlack(), 10.0, 50.0);
        DrawText('Callback received: ' + KeyName(callbacks.get_key_down), ColorBlack(), 10.0, 70.0);
        DrawText('Press Space to end test', ColorBlack(), 10.0, 90.0);
        RefreshScreen();
    end;
end;
procedure TestDeregisterCallbackOnKeyTypedIntegration;
begin
    callbacks := KeyCallbacks.Create();
    OpenWindow('Test Window 6', 800, 600);
    CleanupWindow := TWindowCleanup.Create;
    RegisterCallbackOnKeyTyped(callbacks.on_key_typed);
    while callbacks.get_key_typed <> KeyCode.A_KEY do
        ProcessEvents();
        ClearScreen();
        DrawText('Test: deregister_callback_on_key_typed', ColorBlack(), 10.0, 10.0);
        DrawText('Press A to test callback', ColorBlack(), 10.0, 30.0);
        DrawText('Key Typed: ' + KeyTyped(KeyCode.A_KEY), ColorBlack(), 10.0, 50.0);
        DrawText('Callback received: ' + KeyName(callbacks.get_key_typed), ColorBlack(), 10.0, 70.0);
        RefreshScreen();
    end;
    DeregisterCallbackOnKeyTyped(callbacks.on_key_typed);
    while KeyDown(KeyCode.SPACE_KEY) = false do
        ProcessEvents();
        ClearScreen();
        DrawText('Test: deregister_callback_on_key_typed', ColorBlack(), 10.0, 10.0);
        DrawText('Press B to test deregistered callback on key typed', ColorBlack(), 10.0, 30.0);
        DrawText('Key Typed: ' + KeyTyped(KeyCode.B_KEY), ColorBlack(), 10.0, 50.0);
        DrawText('Callback received: ' + KeyName(callbacks.get_key_typed), ColorBlack(), 10.0, 70.0);
        DrawText('Press Space to end test', ColorBlack(), 10.0, 90.0);
        RefreshScreen();
    end;
end;
procedure TestDeregisterCallbackOnKeyUpIntegration;
begin
    callbacks := KeyCallbacks.Create();
    OpenWindow('Test Window 7', 800, 600);
    CleanupWindow := TWindowCleanup.Create;
    RegisterCallbackOnKeyUp(callbacks.on_key_up);
    while callbacks.get_key_up <> KeyCode.A_KEY do
        ProcessEvents();
        ClearScreen();
        DrawText('Test: deregister_callback_on_key_up', ColorBlack(), 10.0, 10.0);
        DrawText('Press and release A to test callback', ColorBlack(), 10.0, 30.0);
        DrawText('Key Up: ' + KeyUp(KeyCode.A_KEY), ColorBlack(), 10.0, 50.0);
        DrawText('Callback received: ' + KeyName(callbacks.get_key_up), ColorBlack(), 10.0, 70.0);
        RefreshScreen();
    end;
    DeregisterCallbackOnKeyUp(callbacks.on_key_up);
    while KeyDown(KeyCode.SPACE_KEY) = false do
        ProcessEvents();
        ClearScreen();
        DrawText('Test: deregister_callback_on_key_up', ColorBlack(), 10.0, 10.0);
        DrawText('Press and release B to test deregistered callback on key up', ColorBlack(), 10.0, 30.0);
        DrawText('Key Up: ' + KeyUp(KeyCode.B_KEY), ColorBlack(), 10.0, 50.0);
        DrawText('Callback received: ' + KeyName(callbacks.get_key_up), ColorBlack(), 10.0, 70.0);
        DrawText('Press Space to end test', ColorBlack(), 10.0, 90.0);
        RefreshScreen();
    end;
end;
procedure TestKeyDownIntegration;
begin
    OpenWindow('Test Window 8', 800, 600);
    CleanupWindow := TWindowCleanup.Create;
    while KeyDown(KeyCode.A_KEY) = false do
        ProcessEvents();
        ClearScreen();
        DrawText('Test: key_down', ColorBlack(), 10.0, 10.0);
        DrawText('Press and hold A', ColorBlack(), 10.0, 30.0);
        DrawText('Key Down: ' + KeyDown(KeyCode.A_KEY), ColorBlack(), 10.0, 50.0);
        RefreshScreen();
    end;
    while KeyDown(KeyCode.A_KEY) <> false do
        ProcessEvents();
        ClearScreen();
        DrawText('Test: key_down', ColorBlack(), 10.0, 10.0);
        DrawText('Release A', ColorBlack(), 10.0, 30.0);
        DrawText('Key Down: ' + KeyDown(KeyCode.A_KEY), ColorBlack(), 10.0, 50.0);
        RefreshScreen();
    end;
end;
procedure TestKeyNameIntegration;
begin
    callbacks := KeyCallbacks.Create();
    OpenWindow('Test Window 9', 800, 600);
    CleanupWindow := TWindowCleanup.Create;
    RegisterCallbackOnKeyTyped(callbacks.on_key_typed);
    while KeyDown(KeyCode.A_KEY) = false do
        ProcessEvents();
        ClearScreen();
        DrawText('Test: key_name', ColorBlack(), 10.0, 10.0);
        DrawText('Press A to test key name', ColorBlack(), 10.0, 30.0);
        DrawText('Key Name: ' + KeyName(callbacks.get_key_typed), ColorBlack(), 10.0, 50.0);
        RefreshScreen();
    end;
    while KeyDown(KeyCode.RETURN_KEY) = false do
        ProcessEvents();
        ClearScreen();
        DrawText('Test: key_name', ColorBlack(), 10.0, 10.0);
        DrawText('Press Enter to test key name', ColorBlack(), 10.0, 30.0);
        DrawText('Key Name: ' + KeyName(callbacks.get_key_typed), ColorBlack(), 10.0, 50.0);
        RefreshScreen();
    end;
end;
procedure TestKeyReleasedIntegration;
begin
    OpenWindow('Test Window 10', 800, 600);
    CleanupWindow := TWindowCleanup.Create;
    while KeyReleased(KeyCode.A_KEY) = false do
        ProcessEvents();
        ClearScreen();
        DrawText('Test: key_released', ColorBlack(), 10.0, 10.0);
        DrawText('Press and release A', ColorBlack(), 10.0, 30.0);
        DrawText('Key Released: ' + KeyReleased(KeyCode.A_KEY), ColorBlack(), 10.0, 50.0);
        RefreshScreen();
    end;
end;
procedure TestKeyTypedIntegration;
begin
    OpenWindow('Test Window 11', 800, 600);
    CleanupWindow := TWindowCleanup.Create;
    while KeyTyped(KeyCode.A_KEY) = false do
        ProcessEvents();
        ClearScreen();
        DrawText('Test: key_typed', ColorBlack(), 10.0, 10.0);
        DrawText('Press A to test key typed', ColorBlack(), 10.0, 30.0);
        DrawText('Key Typed: ' + KeyTyped(KeyCode.A_KEY), ColorBlack(), 10.0, 50.0);
        RefreshScreen();
    end;
end;
procedure TestKeyUpIntegration;
begin
    OpenWindow('Test Window 12', 800, 600);
    CleanupWindow := TWindowCleanup.Create;
    while KeyUp(KeyCode.A_KEY) = false do
        ProcessEvents();
        ClearScreen();
        DrawText('Test: key_up', ColorBlack(), 10.0, 10.0);
        DrawText('Press and release A', ColorBlack(), 10.0, 30.0);
        DrawText('Key Up: ' + KeyUp(KeyCode.A_KEY), ColorBlack(), 10.0, 50.0);
        RefreshScreen();
    end;
end;
procedure TestRegisterCallbackOnKeyDownIntegration;
begin
    callbacks := KeyCallbacks.Create();
    OpenWindow('Test Window 13', 800, 600);
    CleanupWindow := TWindowCleanup.Create;
    RegisterCallbackOnKeyDown(callbacks.on_key_down);
    while callbacks.get_key_down <> KeyCode.A_KEY do
        ProcessEvents();
        ClearScreen();
        DrawText('Test: register_callback_on_key_down', ColorBlack(), 10.0, 10.0);
        DrawText('Press A to test callback on key down', ColorBlack(), 10.0, 30.0);
        DrawText('Key Down: ' + KeyDown(KeyCode.A_KEY), ColorBlack(), 10.0, 50.0);
        DrawText('Callback received: ' + KeyName(callbacks.get_key_down), ColorBlack(), 10.0, 70.0);
        RefreshScreen();
    end;
    DeregisterCallbackOnKeyDown(callbacks.on_key_down);
end;
procedure TestRegisterCallbackOnKeyTypedIntegration;
begin
    callbacks := KeyCallbacks.Create();
    OpenWindow('Test Window 14', 800, 600);
    CleanupWindow := TWindowCleanup.Create;
    RegisterCallbackOnKeyTyped(callbacks.on_key_typed);
    while callbacks.get_key_typed <> KeyCode.A_KEY do
        ProcessEvents();
        ClearScreen();
        DrawText('Test: register_callback_on_key_typed', ColorBlack(), 10.0, 10.0);
        DrawText('Press A to test callback on key typed', ColorBlack(), 10.0, 30.0);
        DrawText('Key Typed: ' + KeyTyped(KeyCode.A_KEY), ColorBlack(), 10.0, 50.0);
        DrawText('Callback received: ' + KeyName(callbacks.get_key_typed), ColorBlack(), 10.0, 70.0);
        RefreshScreen();
    end;
    DeregisterCallbackOnKeyTyped(callbacks.on_key_typed);
end;
procedure TestRegisterCallbackOnKeyUpIntegration;
begin
    callbacks := KeyCallbacks.Create();
    OpenWindow('Test Window 15', 800, 600);
    CleanupWindow := TWindowCleanup.Create;
    RegisterCallbackOnKeyUp(callbacks.on_key_up);
    while callbacks.get_key_up <> KeyCode.A_KEY do
        ProcessEvents();
        ClearScreen();
        DrawText('Test: register_callback_on_key_up', ColorBlack(), 10.0, 10.0);
        DrawText('Press and release A to test callback on key up', ColorBlack(), 10.0, 30.0);
        DrawText('Key Up: ' + KeyUp(KeyCode.A_KEY), ColorBlack(), 10.0, 50.0);
        DrawText('Callback received: ' + KeyName(callbacks.get_key_up), ColorBlack(), 10.0, 70.0);
        RefreshScreen();
    end;
    DeregisterCallbackOnKeyUp(callbacks.on_key_up);
end;
procedure TestHideMouseIntegration;
begin
    OpenWindow('Test Window 16', 800, 600);
    CleanupWindow := TWindowCleanup.Create;
    while KeyDown(KeyCode.H_KEY) = false do
        ProcessEvents();
        ClearScreen();
        DrawText('Test: hide_mouse', ColorBlack(), 10.0, 10.0);
        DrawText('Press H to hide mouse', ColorBlack(), 10.0, 30.0);
        DrawText('Mouse Shown: ' + MouseShown(), ColorBlack(), 10.0, 50.0);
        RefreshScreen();
    end;
    HideMouse();
    while KeyDown(KeyCode.SPACE_KEY) = false do
        ProcessEvents();
        ClearScreen();
        DrawText('Test: hide_mouse', ColorBlack(), 10.0, 10.0);
        DrawText('Mouse Shown: ' + MouseShown(), ColorBlack(), 10.0, 30.0);
        DrawText('Press Space to end test', ColorBlack(), 10.0, 50.0);
        RefreshScreen();
    end;
    ShowMouse();
end;
procedure TestMouseClickedIntegration;
begin
    OpenWindow('Test Window 17', 800, 600);
    CleanupWindow := TWindowCleanup.Create;
    while MouseClicked(MouseButton.LEFT_BUTTON) = false do
        ProcessEvents();
        ClearScreen();
        DrawText('Test: mouse_clicked', ColorBlack(), 10.0, 10.0);
        DrawText('Click left mouse button', ColorBlack(), 10.0, 30.0);
        DrawText('Mouse Clicked: ' + MouseClicked(MouseButton.LEFT_BUTTON), ColorBlack(), 10.0, 50.0);
        RefreshScreen();
    end;
end;
procedure TestMouseDownIntegration;
begin
    OpenWindow('Test Window 18', 800, 600);
    CleanupWindow := TWindowCleanup.Create;
    while MouseDown(MouseButton.LEFT_BUTTON) = false do
        ProcessEvents();
        ClearScreen();
        DrawText('Test: mouse_down', ColorBlack(), 10.0, 10.0);
        DrawText('Press and hold left mouse button', ColorBlack(), 10.0, 30.0);
        DrawText('Mouse Down: ' + MouseDown(MouseButton.LEFT_BUTTON), ColorBlack(), 10.0, 50.0);
        RefreshScreen();
    end;
    while MouseDown(MouseButton.LEFT_BUTTON) <> false do
        ProcessEvents();
        ClearScreen();
        DrawText('Test: mouse_down', ColorBlack(), 10.0, 10.0);
        DrawText('Release left mouse button', ColorBlack(), 10.0, 30.0);
        DrawText('Mouse Down: ' + MouseDown(MouseButton.LEFT_BUTTON), ColorBlack(), 10.0, 50.0);
        RefreshScreen();
    end;
end;
procedure TestMouseMovementIntegration;
begin
    OpenWindow('Test Window 19', 800, 600);
    CleanupWindow := TWindowCleanup.Create;
    while KeyDown(KeyCode.SPACE_KEY) = false do
        ProcessEvents();
        ClearScreen();
        movement := MouseMovement();
        DrawText('Test: mouse_movement', ColorBlack(), 10.0, 10.0);
        DrawText('Move mouse to test movement', ColorBlack(), 10.0, 30.0);
        DrawText('Mouse Movement: X=' + movement.x + ', Y=' + movement.y, ColorBlack(), 10.0, 50.0);
        DrawText('Press Space to end test', ColorBlack(), 10.0, 70.0);
        RefreshScreen();
    end;
end;
procedure TestMousePositionIntegration;
begin
    OpenWindow('Test Window 20', 800, 600);
    CleanupWindow := TWindowCleanup.Create;
    while KeyDown(KeyCode.SPACE_KEY) = false do
        ProcessEvents();
        ClearScreen();
        position := MousePosition();
        DrawText('Test: mouse_position', ColorBlack(), 10.0, 10.0);
        DrawText('Move mouse to test position', ColorBlack(), 10.0, 30.0);
        DrawText('Mouse Position: X=' + position.x + ', Y=' + position.y, ColorBlack(), 10.0, 50.0);
        DrawText('Press Space to end test', ColorBlack(), 10.0, 70.0);
        RefreshScreen();
    end;
end;
procedure TestMousePositionVectorIntegration;
begin
    OpenWindow('Test Window 21', 800, 600);
    CleanupWindow := TWindowCleanup.Create;
    while KeyDown(KeyCode.SPACE_KEY) = false do
        ProcessEvents();
        ClearScreen();
        position := MousePositionVector();
        DrawText('Test: mouse_position_vector', ColorBlack(), 10.0, 10.0);
        DrawText('Move mouse to test position', ColorBlack(), 10.0, 30.0);
        DrawText('Mouse Position: X=' + position.x + ', Y=' + position.y, ColorBlack(), 10.0, 50.0);
        DrawText('Press Space to end test', ColorBlack(), 10.0, 70.0);
        RefreshScreen();
    end;
end;
procedure TestMouseShownIntegration;
begin
    OpenWindow('Test Window 22', 800, 600);
    CleanupWindow := TWindowCleanup.Create;
    while KeyDown(KeyCode.H_KEY) = false do
        ProcessEvents();
        ClearScreen();
        DrawText('Test: mouse_shown', ColorBlack(), 10.0, 10.0);
        DrawText('Press H to hide mouse', ColorBlack(), 10.0, 30.0);
        DrawText('Mouse Shown: ' + MouseShown(), ColorBlack(), 10.0, 50.0);
        RefreshScreen();
    end;
    HideMouse();
    AssertFalse(MouseShown());
    while KeyDown(KeyCode.S_KEY) = false do
        ProcessEvents();
        ClearScreen();
        DrawText('Test: mouse_shown', ColorBlack(), 10.0, 10.0);
        DrawText('Press S to show mouse', ColorBlack(), 10.0, 30.0);
        DrawText('Mouse Shown: ' + MouseShown(), ColorBlack(), 10.0, 50.0);
        RefreshScreen();
    end;
    ShowMouse();
    AssertTrue(MouseShown());
end;
procedure TestMouseUpIntegration;
begin
    OpenWindow('Test Window 23', 800, 600);
    CleanupWindow := TWindowCleanup.Create;
    while MouseUp(MouseButton.LEFT_BUTTON) = false do
        ProcessEvents();
        ClearScreen();
        DrawText('Test: mouse_up', ColorBlack(), 10.0, 10.0);
        DrawText('Click and release left mouse button', ColorBlack(), 10.0, 30.0);
        DrawText('Mouse Up: ' + MouseUp(MouseButton.LEFT_BUTTON), ColorBlack(), 10.0, 50.0);
        RefreshScreen();
    end;
end;
procedure TestMouseWheelScrollIntegration;
begin
    OpenWindow('Test Window 24', 800, 600);
    CleanupWindow := TWindowCleanup.Create;
    while KeyDown(KeyCode.SPACE_KEY) = false do
        ProcessEvents();
        ClearScreen();
        scroll := MouseWheelScroll();
        DrawText('Test: mouse_wheel_scroll', ColorBlack(), 10.0, 10.0);
        DrawText('Scroll mouse wheel to test', ColorBlack(), 10.0, 30.0);
        DrawText('Scroll Value: X=' + scroll.x + ', Y=' + scroll.y, ColorBlack(), 10.0, 50.0);
        DrawText('Press Space to end test', ColorBlack(), 10.0, 70.0);
        RefreshScreen();
    end;
end;
procedure TestMouseXIntegration;
begin
    OpenWindow('Test Window 25', 800, 600);
    CleanupWindow := TWindowCleanup.Create;
    while KeyDown(KeyCode.SPACE_KEY) = false do
        ProcessEvents();
        ClearScreen();
        DrawText('Test: mouse_x', ColorBlack(), 10.0, 10.0);
        DrawText('Move mouse to test X position', ColorBlack(), 10.0, 30.0);
        DrawText('Mouse Position: X=' + MouseX() + ', Y=' + MouseY(), ColorBlack(), 10.0, 50.0);
        DrawText('Press Space to end test', ColorBlack(), 10.0, 70.0);
        RefreshScreen();
    end;
end;
procedure TestMouseYIntegration;
begin
    OpenWindow('Test Window 26', 800, 600);
    CleanupWindow := TWindowCleanup.Create;
    while KeyDown(KeyCode.SPACE_KEY) = false do
        ProcessEvents();
        ClearScreen();
        DrawText('Test: mouse_y', ColorBlack(), 10.0, 10.0);
        DrawText('Move mouse to test Y position', ColorBlack(), 10.0, 30.0);
        DrawText('Mouse Position: X=' + MouseX() + ', Y=' + MouseY(), ColorBlack(), 10.0, 50.0);
        DrawText('Press Space to end test', ColorBlack(), 10.0, 70.0);
        RefreshScreen();
    end;
end;
procedure TestMoveMouseIntegration;
begin
    OpenWindow('Test Window 27', 800, 600);
    CleanupWindow := TWindowCleanup.Create;
    while KeyDown(KeyCode.M_KEY) = false do
        ProcessEvents();
        ClearScreen();
        DrawText('Test: move_mouse', ColorBlack(), 10.0, 10.0);
        DrawText('Press M to move mouse to center', ColorBlack(), 10.0, 30.0);
        DrawText('Mouse Position: X=' + MouseX() + ', Y=' + MouseY(), ColorBlack(), 10.0, 50.0);
        RefreshScreen();
    end;
    while KeyDown(KeyCode.SPACE_KEY) = false do
        ProcessEvents();
        ClearScreen();
        DrawText('Test: move_mouse', ColorBlack(), 10.0, 10.0);
        DrawText('Mouse moved to center', ColorBlack(), 10.0, 30.0);
        DrawText('Mouse Position: X=' + MouseX() + ', Y=' + MouseY(), ColorBlack(), 10.0, 50.0);
        DrawText('Press Space to end test', ColorBlack(), 10.0, 70.0);
        MoveMouse(400.0, 300.0);
        RefreshScreen();
    end;
end;
procedure TestMoveMouseToPointIntegration;
begin
    OpenWindow('Test Window 28', 800, 600);
    CleanupWindow := TWindowCleanup.Create;
    while KeyDown(KeyCode.M_KEY) = false do
        ProcessEvents();
        ClearScreen();
        DrawText('Test: move_mouse_to_point', ColorBlack(), 10.0, 10.0);
        DrawText('Press M to move mouse to center', ColorBlack(), 10.0, 30.0);
        DrawText('Mouse Position: X=' + MouseX() + ', Y=' + MouseY(), ColorBlack(), 10.0, 50.0);
        RefreshScreen();
    end;
    while KeyDown(KeyCode.SPACE_KEY) = false do
        ProcessEvents();
        ClearScreen();
        DrawText('Test: move_mouse_to_point', ColorBlack(), 10.0, 10.0);
        DrawText('Mouse moved to center', ColorBlack(), 10.0, 30.0);
        DrawText('Mouse Position: X=' + MouseX() + ', Y=' + MouseY(), ColorBlack(), 10.0, 50.0);
        DrawText('Press Space to end test', ColorBlack(), 10.0, 70.0);
        MoveMouse(PointAt(400.0, 300.0));
        RefreshScreen();
    end;
end;
procedure TestShowMouseIntegration;
begin
    OpenWindow('Test Window 29', 800, 600);
    CleanupWindow := TWindowCleanup.Create;
    HideMouse();
    while KeyDown(KeyCode.S_KEY) = false do
        ProcessEvents();
        ClearScreen();
        DrawText('Test: show_mouse', ColorBlack(), 10.0, 10.0);
        DrawText('Press S to show mouse', ColorBlack(), 10.0, 30.0);
        DrawText('Mouse Shown: ' + MouseShown(), ColorBlack(), 10.0, 50.0);
        RefreshScreen();
    end;
    ShowMouse();
    while KeyDown(KeyCode.SPACE_KEY) = false do
        ProcessEvents();
        ClearScreen();
        DrawText('Test: show_mouse', ColorBlack(), 10.0, 10.0);
        DrawText('Mouse Shown: ' + MouseShown(), ColorBlack(), 10.0, 30.0);
        DrawText('Press Space to end test', ColorBlack(), 10.0, 50.0);
        RefreshScreen();
    end;
end;
procedure TestShowMouseWithBooleanIntegration;
begin
    OpenWindow('Test Window 30', 800, 600);
    CleanupWindow := TWindowCleanup.Create;
    while KeyDown(KeyCode.H_KEY) = false do
        ProcessEvents();
        ClearScreen();
        DrawText('Test: show_mouse_with_boolean', ColorBlack(), 10.0, 10.0);
        DrawText('Press H to hide mouse', ColorBlack(), 10.0, 30.0);
        DrawText('Mouse Shown: ' + MouseShown(), ColorBlack(), 10.0, 50.0);
        RefreshScreen();
    end;
    ShowMouse(false);
    AssertFalse(MouseShown());
    while KeyDown(KeyCode.S_KEY) = false do
        ProcessEvents();
        ClearScreen();
        DrawText('Test: show_mouse_with_boolean', ColorBlack(), 10.0, 10.0);
        DrawText('Press S to show mouse', ColorBlack(), 10.0, 30.0);
        DrawText('Mouse Shown: ' + MouseShown(), ColorBlack(), 10.0, 50.0);
        RefreshScreen();
    end;
    ShowMouse(true);
    AssertTrue(MouseShown());
end;
procedure TestDrawCollectedTextIntegration;
begin
    OpenWindow('Test Window 31', 800, 600);
    CleanupWindow := TWindowCleanup.Create;
    testFont := LoadFont('test_font', 'hara.ttf');
    CleanupFont := TFontCleanup.Create;
    StartReadingText(RectangleFrom(100.0, 100.0, 200.0, 30.0));
    while KeyDown(KeyCode.RETURN_KEY) = false do
        ProcessEvents();
        ClearScreen();
        DrawText('Test: draw_collected_text', ColorBlack(), 10.0, 10.0);
        DrawText('Type some text, press Enter when done', ColorBlack(), 10.0, 30.0);
        DrawCollectedText(ColorBlack(), testFont, 18, OptionDefaults());
        RefreshScreen();
    end;
    EndReadingText();
end;
procedure TestEndReadingTextIntegration;
begin
    OpenWindow('Test Window 32', 800, 600);
    CleanupWindow := TWindowCleanup.Create;
    StartReadingText(RectangleFrom(100.0, 100.0, 200.0, 30.0));
    AssertTrue(ReadingText());
    while KeyDown(KeyCode.RETURN_KEY) = false do
        ProcessEvents();
        ClearScreen();
        DrawText('Test: end_reading_text', ColorBlack(), 10.0, 10.0);
        DrawText('Type some text, press Enter when done', ColorBlack(), 10.0, 30.0);
        DrawText('Reading Text: ' + ReadingText(), ColorBlack(), 10.0, 50.0);
        RefreshScreen();
    end;
    EndReadingText();
    AssertFalse(ReadingText());
    while KeyDown(KeyCode.SPACE_KEY) = false do
        ProcessEvents();
        ClearScreen();
        DrawText('Test: end_reading_text', ColorBlack(), 10.0, 10.0);
        DrawText('Text input ended', ColorBlack(), 10.0, 30.0);
        DrawText('Reading Text: ' + ReadingText(), ColorBlack(), 10.0, 50.0);
        DrawText('Press Space to end test', ColorBlack(), 10.0, 70.0);
        RefreshScreen();
    end;
end;
procedure TestEndReadingTextInWindowIntegration;
begin
    testWindow := OpenWindow('Test Window 33', 800, 600);
    CleanupWindow := TWindowCleanup.Create;
    testRectangle := RectangleFrom(100.0, 100.0, 200.0, 30.0);
    StartReadingText(testWindow, testRectangle);
    AssertTrue(ReadingText());
    while KeyDown(KeyCode.RETURN_KEY) = false do
        ProcessEvents();
        ClearScreen();
        DrawText('Test: end_reading_text_in_window', ColorBlack(), 10.0, 10.0);
        DrawText('Type some text, press Enter when done', ColorBlack(), 10.0, 30.0);
        DrawText('Reading Text: ' + ReadingText(testWindow), ColorBlack(), 10.0, 50.0);
        RefreshScreen();
    end;
    EndReadingText(testWindow);
    AssertFalse(ReadingText());
    while KeyDown(KeyCode.SPACE_KEY) = false do
        ProcessEvents();
        ClearScreen();
        DrawText('Test: end_reading_text_in_window', ColorBlack(), 10.0, 10.0);
        DrawText('Text input ended', ColorBlack(), 10.0, 30.0);
        DrawText('Reading Text: ' + ReadingText(testWindow), ColorBlack(), 10.0, 50.0);
        DrawText('Press Space to end test', ColorBlack(), 10.0, 70.0);
        RefreshScreen();
    end;
end;
procedure TestReadingTextIntegration;
begin
    OpenWindow('Test Window 34', 800, 600);
    CleanupWindow := TWindowCleanup.Create;
    StartReadingText(RectangleFrom(100.0, 100.0, 200.0, 30.0));
    AssertTrue(ReadingText());
    while KeyDown(KeyCode.RETURN_KEY) = false do
        ProcessEvents();
        ClearScreen();
        DrawText('Test: reading_text', ColorBlack(), 10.0, 10.0);
        DrawText('Type some text, press Enter when done', ColorBlack(), 10.0, 30.0);
        DrawText('Reading Text: ' + ReadingText(), ColorBlack(), 10.0, 50.0);
        RefreshScreen();
    end;
    EndReadingText();
    AssertFalse(ReadingText());
end;
procedure TestReadingTextInWindowIntegration;
begin
    testWindow := OpenWindow('Test Window 35', 800, 600);
    CleanupWindow := TWindowCleanup.Create;
    testRectangle := RectangleFrom(100.0, 100.0, 200.0, 30.0);
    StartReadingText(testWindow, testRectangle);
    AssertTrue(ReadingText(testWindow));
    while KeyDown(KeyCode.RETURN_KEY) = false do
        ProcessEvents();
        ClearScreen();
        DrawText('Test: reading_text_in_window', ColorBlack(), 10.0, 10.0);
        DrawText('Type some text, press Enter when done', ColorBlack(), 10.0, 30.0);
        DrawText('Reading Text: ' + ReadingText(testWindow), ColorBlack(), 10.0, 50.0);
        RefreshScreen();
    end;
    EndReadingText(testWindow);
    AssertFalse(ReadingText(testWindow));
end;
procedure TestStartReadingTextIntegration;
begin
    OpenWindow('Test Window 36', 800, 600);
    CleanupWindow := TWindowCleanup.Create;
    testRect := RectangleFrom(100.0, 100.0, 200.0, 30.0);
    StartReadingText(testRect);
    AssertTrue(ReadingText());
    while KeyDown(KeyCode.RETURN_KEY) = false do
        ProcessEvents();
        ClearScreen();
        DrawText('Test: start_reading_text', ColorBlack(), 10.0, 10.0);
        DrawText('Type some text, press Enter when done', ColorBlack(), 10.0, 30.0);
        DrawText('Current Text: ' + TextInput(), ColorBlack(), 10.0, 50.0);
        RefreshScreen();
    end;
    EndReadingText();
    AssertFalse(ReadingText());
end;
procedure TestStartReadingTextWithInitialTextIntegration;
begin
    OpenWindow('Test Window 37', 800, 600);
    CleanupWindow := TWindowCleanup.Create;
    testRect := RectangleFrom(100.0, 100.0, 200.0, 30.0);
    StartReadingText(testRect, 'Initial Text');
    AssertTrue(ReadingText());
    while KeyDown(KeyCode.RETURN_KEY) = false do
        ProcessEvents();
        ClearScreen();
        DrawText('Test: start_reading_text_with_initial_text', ColorBlack(), 10.0, 10.0);
        DrawText('Type some text, press Enter when done', ColorBlack(), 10.0, 30.0);
        DrawText('Current Text: ' + TextInput(), ColorBlack(), 10.0, 50.0);
        RefreshScreen();
    end;
    EndReadingText();
    AssertFalse(ReadingText());
end;
procedure TestStartReadingTextInWindowIntegration;
begin
    testWindow := OpenWindow('Test Window 38', 800, 600);
    CleanupWindow := TWindowCleanup.Create;
    testRect := RectangleFrom(100.0, 100.0, 200.0, 30.0);
    StartReadingText(testWindow, testRect);
    AssertTrue(ReadingText());
    while KeyDown(KeyCode.RETURN_KEY) = false do
        ProcessEvents();
        ClearScreen();
        DrawText('Test: start_reading_text_in_window', ColorBlack(), 10.0, 10.0);
        DrawText('Type some text, press Enter when done', ColorBlack(), 10.0, 30.0);
        DrawText('Current Text: ' + TextInput(testWindow), ColorBlack(), 10.0, 50.0);
        RefreshScreen();
    end;
    EndReadingText(testWindow);
    AssertFalse(ReadingText());
end;
procedure TestStartReadingTextInWindowWithInitialTextIntegration;
begin
    testWindow := OpenWindow('Test Window 39', 800, 600);
    CleanupWindow := TWindowCleanup.Create;
    testRect := RectangleFrom(100.0, 100.0, 200.0, 30.0);
    StartReadingText(testWindow, testRect, 'Initial Text');
    AssertTrue(ReadingText());
    while KeyDown(KeyCode.RETURN_KEY) = false do
        ProcessEvents();
        ClearScreen();
        DrawText('Test: start_reading_text_in_window_with_initial_text', ColorBlack(), 10.0, 10.0);
        DrawText('Type some text, press Enter when done', ColorBlack(), 10.0, 30.0);
        DrawText('Current Text: ' + TextInput(testWindow), ColorBlack(), 10.0, 50.0);
        RefreshScreen();
    end;
    EndReadingText(testWindow);
    AssertFalse(ReadingText());
end;
procedure TestTextEntryCancelledIntegration;
begin
    OpenWindow('Test Window 40', 800, 600);
    CleanupWindow := TWindowCleanup.Create;
    StartReadingText(RectangleFrom(100.0, 100.0, 200.0, 30.0));
    while KeyDown(KeyCode.SPACE_KEY) = false do
        ProcessEvents();
        ClearScreen();
        DrawText('Test: text_entry_cancelled', ColorBlack(), 10.0, 10.0);
        DrawText('Press Escape to cancel text entry', ColorBlack(), 10.0, 30.0);
        DrawText('Text Entry Cancelled: ' + TextEntryCancelled(), ColorBlack(), 10.0, 50.0);
        DrawText('Press space to end test', ColorBlack(), 10.0, 70.0);
        RefreshScreen();
    end;
    EndReadingText();
end;
procedure TestTextEntryCancelledInWindowIntegration;
begin
    testWindow := OpenWindow('Test Window 41', 800, 600);
    CleanupWindow := TWindowCleanup.Create;
    testRect := RectangleFrom(100.0, 100.0, 200.0, 30.0);
    StartReadingText(testWindow, testRect);
    while KeyDown(KeyCode.SPACE_KEY) = false do
        ProcessEvents();
        ClearScreen();
        DrawText('Test: text_entry_cancelled_in_window', ColorBlack(), 10.0, 10.0);
        DrawText('Press Escape to cancel text entry', ColorBlack(), 10.0, 30.0);
        DrawText('Text Entry Cancelled: ' + TextEntryCancelled(testWindow), ColorBlack(), 10.0, 50.0);
        DrawText('Press space to end test', ColorBlack(), 10.0, 70.0);
        RefreshScreen();
    end;
    AssertTrue(TextEntryCancelled(testWindow));
    EndReadingText(testWindow);
end;
procedure TestTextInputIntegration;
begin
    OpenWindow('Test Window 42', 800, 600);
    CleanupWindow := TWindowCleanup.Create;
    StartReadingText(RectangleFrom(100.0, 100.0, 200.0, 30.0));
    while KeyDown(KeyCode.RETURN_KEY) = false do
        ProcessEvents();
        ClearScreen();
        DrawText('Test: text_input', ColorBlack(), 10.0, 10.0);
        DrawText('Type some text, press Enter when done', ColorBlack(), 10.0, 30.0);
        DrawText('Current Text: ' + TextInput(), ColorBlack(), 10.0, 50.0);
        RefreshScreen();
    end;
    EndReadingText();
end;
procedure TestTextInputInWindowIntegration;
begin
    testWindow := OpenWindow('Test Window 43', 800, 600);
    CleanupWindow := TWindowCleanup.Create;
    testRect := RectangleFrom(100.0, 100.0, 200.0, 30.0);
    StartReadingText(testWindow, testRect);
    while KeyDown(KeyCode.RETURN_KEY) = false do
        ProcessEvents();
        ClearScreen();
        DrawText('Test: text_input_in_window', ColorBlack(), 10.0, 10.0);
        DrawText('Type some text, press Enter when done', ColorBlack(), 10.0, 30.0);
        DrawText('Current Text: ' + TextInput(testWindow), ColorBlack(), 10.0, 50.0);
        RefreshScreen();
    end;
    EndReadingText(testWindow);
end;
end;

procedure RegisterTests;
begin
    #<Proc:0x00007faa116e2450 /mnt/c/Users/Noahc/Documents/aYear_2_semester_2/TeamProject/GitHubRepo/splashkit_test_generator/test_generator/config/languages/pascal_config.rb:138 (lambda)>
end;
