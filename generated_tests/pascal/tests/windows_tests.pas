uses SplashKit, TestFramework

type
TIntegrationTests = class(TTestCase)
published
procedure TIntegrationTests.TestClearWindowIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    testColor := color_black();
    clear_window(testWindow, testColor);
    refresh_window(testWindow);
    AssertEquals(get_pixel(point_at(window_width(testWindow), window_height(testWindow))), color_black());
    close_window(testWindow);
end;
procedure TIntegrationTests.TestCloseAllWindowsIntegration;
begin
    testWindow1 := open_window("Test Window 1", 800, 600);
    testWindow2 := open_window("Test Window 2", 800, 600);
    close_all_windows();
    AssertFalse(has_window("Test Window 1"));
    AssertFalse(has_window("Test Window 2"));
end;
procedure TIntegrationTests.TestCloseCurrentWindowIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    set_current_window(testWindow);
    close_current_window();
    AssertFalse(has_window("Test Window"));
end;
procedure TIntegrationTests.TestCloseWindowNamedIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    windowExists := has_window("Test Window");
    AssertTrue(windowExists);
    close_window("Test Window");
    windowExists := has_window("Test Window");
    AssertFalse(windowExists);
end;
procedure TIntegrationTests.TestCloseWindowIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    close_window(testWindow);
    AssertFalse(has_window("Test Window"));
end;
procedure TIntegrationTests.TestCurrentWindowIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    set_current_window(testWindow);
    AssertEquals(current_window(), testWindow);
    close_window(testWindow);
end;
procedure TIntegrationTests.TestCurrentWindowHasBorderIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    AssertTrue(current_window_has_border());
    current_window_toggle_border();
    AssertFalse(current_window_has_border());
    close_window(testWindow);
end;
procedure TIntegrationTests.TestCurrentWindowHeightIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    set_current_window(testWindow);
    AssertEquals(current_window_height(), 600);
    close_window(testWindow);
end;
procedure TIntegrationTests.TestCurrentWindowIsFullscreenIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    AssertFalse(current_window_is_fullscreen());
    current_window_toggle_fullscreen();
    AssertTrue(current_window_is_fullscreen());
    current_window_toggle_fullscreen();
    AssertFalse(current_window_is_fullscreen());
    close_window(testWindow);
end;
procedure TIntegrationTests.TestCurrentWindowPositionIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    testPosition := current_window_position();
    AssertNotNull(testPosition);
    close_window(testWindow);
end;
procedure TIntegrationTests.TestCurrentWindowToggleBorderIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    current_window_toggle_border();
    AssertFalse(current_window_has_border());
    current_window_toggle_border();
    AssertTrue(current_window_has_border());
    close_window(testWindow);
end;
procedure TIntegrationTests.TestCurrentWindowToggleFullscreenIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    current_window_toggle_fullscreen();
    AssertTrue(current_window_is_fullscreen());
    current_window_toggle_fullscreen();
    AssertFalse(current_window_is_fullscreen());
    close_window(testWindow);
end;
procedure TIntegrationTests.TestCurrentWindowWidthIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    set_current_window(testWindow);
    AssertEquals(current_window_width(), 800);
    close_window(testWindow);
end;
procedure TIntegrationTests.TestCurrentWindowXIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    move_window_to(testWindow, 100, 200);
    set_current_window(testWindow);
    AssertEquals(current_window_x(), 100);
    close_window(testWindow);
end;
procedure TIntegrationTests.TestCurrentWindowYIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    testY := current_window_y();
    AssertTrue(testY > -1);
    close_window(testWindow);
end;
procedure TIntegrationTests.TestHasWindowIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    AssertTrue(has_window("Test Window"));
    close_window(testWindow);
    AssertFalse(has_window("Test Window"));
end;
procedure TIntegrationTests.TestIsCurrentWindowIntegration;
begin
    testWindow1 := open_window("Test Window 1", 800, 600);
    testWindow2 := open_window("Test Window 2", 800, 600);
    set_current_window(testWindow1);
    AssertTrue(is_current_window(testWindow1));
    AssertFalse(is_current_window(testWindow2));
    set_current_window(testWindow2);
    AssertTrue(is_current_window(testWindow2));
    AssertFalse(is_current_window(testWindow1));
    close_window(testWindow1);
    close_window(testWindow2);
end;
procedure TIntegrationTests.TestMoveCurrentWindowToIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    move_current_window_to(100, 100);
    AssertEquals(current_window_x(), 100);
    AssertEquals(current_window_y(), 100);
    close_window(testWindow);
end;
procedure TIntegrationTests.TestMoveWindowToNamedIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    move_window_to("Test Window", 100, 100);
    process_events();
    AssertEquals(window_x("Test Window"), 100);
    AssertEquals(window_y("Test Window"), 100);
    close_window("Test Window");
end;
procedure TIntegrationTests.TestMoveWindowToIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    move_window_to(testWindow, 100, 100);
    AssertEquals(window_x(testWindow), 100);
    AssertEquals(window_y(testWindow), 100);
    close_window(testWindow);
end;
procedure TIntegrationTests.TestOpenWindowIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    AssertNotNull(testWindow);
    close_window(testWindow);
end;
procedure TIntegrationTests.TestRefreshWindowIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    draw_circle(color_black(), circle_at(400.0, 300.0, 50.0));
    refresh_window(testWindow);
    AssertTrue(point_in_circle(point_at(400.0, 300.0), circle_at(400.0, 300.0, 50.0)));
    close_window(testWindow);
end;
procedure TIntegrationTests.TestRefreshWindowWithTargetFpsIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    refresh_window(testWindow, 60);
    close_window(testWindow);
end;
procedure TIntegrationTests.TestResizeCurrentWindowIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    set_current_window(testWindow);
    resize_current_window(1024, 768);
    process_events();
    AssertEquals(current_window_width(), 1024);
    AssertEquals(current_window_height(), 768);
    close_window(testWindow);
end;
procedure TIntegrationTests.TestResizeWindowIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    resize_window(testWindow, 1024, 768);
    AssertEquals(window_width(testWindow), 1024);
    AssertEquals(window_height(testWindow), 768);
    close_window(testWindow);
end;
procedure TIntegrationTests.TestSetCurrentWindowNamedIntegration;
begin
    testWindow1 := open_window("Test Window 1", 800, 600);
    testWindow2 := open_window("Test Window 2", 800, 600);
    set_current_window("Test Window 2");
    AssertTrue(is_current_window(testWindow2));
    close_window(testWindow1);
    close_window(testWindow2);
end;
procedure TIntegrationTests.TestSetCurrentWindowIntegration;
begin
    testWindow1 := open_window("Test Window 1", 800, 600);
    testWindow2 := open_window("Test Window 2", 800, 600);
    set_current_window(testWindow2);
    AssertTrue(is_current_window(testWindow2));
    close_window(testWindow1);
    close_window(testWindow2);
end;
procedure TIntegrationTests.TestWindowCaptionIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    AssertEquals(window_caption(testWindow), "Test Window");
    close_window(testWindow);
end;
procedure TIntegrationTests.TestWindowCloseRequestedNamedIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    process_events();
    AssertFalse(window_close_requested("Test Window"));
    simulate_key_press(Keycode.ESCAPE);
    process_events();
    AssertTrue(window_close_requested("Test Window"));
    close_window(testWindow);
end;
procedure TIntegrationTests.TestWindowCloseRequestedIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    process_events();
    AssertFalse(window_close_requested(testWindow));
    simulate_key_press(Keycode.ESCAPE);
    process_events();
    AssertTrue(window_close_requested(testWindow));
    close_window(testWindow);
end;
procedure TIntegrationTests.TestWindowHasBorderNamedIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    AssertTrue(window_has_border("Test Window"));
    window_toggle_border("Test Window");
    AssertFalse(window_has_border("Test Window"));
    close_window("Test Window");
end;
procedure TIntegrationTests.TestWindowHasBorderIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    AssertTrue(window_has_border(testWindow));
    window_toggle_border(testWindow);
    AssertFalse(window_has_border(testWindow));
    close_window(testWindow);
end;
procedure TIntegrationTests.TestWindowHasFocusIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    process_events();
    AssertTrue(window_has_focus(testWindow));
    close_window(testWindow);
end;
procedure TIntegrationTests.TestWindowHeightNamedIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    AssertEquals(window_height("Test Window"), 600);
    close_window(testWindow);
end;
procedure TIntegrationTests.TestWindowHeightIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    AssertEquals(window_height(testWindow), 600);
    close_window(testWindow);
end;
procedure TIntegrationTests.TestWindowIsFullscreenNamedIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    window_toggle_fullscreen(testWindow);
    AssertTrue(window_is_fullscreen("Test Window"));
    window_toggle_fullscreen(testWindow);
    AssertFalse(window_is_fullscreen("Test Window"));
    close_window(testWindow);
end;
procedure TIntegrationTests.TestWindowIsFullscreenIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    AssertFalse(window_is_fullscreen(testWindow));
    window_toggle_fullscreen(testWindow);
    AssertTrue(window_is_fullscreen(testWindow));
    close_window(testWindow);
end;
procedure TIntegrationTests.TestWindowNamedIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    retrievedWindow := window_named("Test Window");
    AssertEquals(testWindow, retrievedWindow);
    close_window(testWindow);
end;
procedure TIntegrationTests.TestWindowPositionNamedIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    testPosition := window_position("Test Window");
    AssertNotNull(testPosition);
    close_window(testWindow);
end;
procedure TIntegrationTests.TestWindowPositionIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    testPosition := window_position(testWindow);
    AssertNotNull(testPosition);
    close_window(testWindow);
end;
procedure TIntegrationTests.TestWindowSetIconIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    testBitmap := create_bitmap("test_icon", 32, 32);
    window_set_icon(testWindow, testBitmap);
    close_window(testWindow);
    free_bitmap(testBitmap);
end;
procedure TIntegrationTests.TestWindowToggleBorderNamedIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    testHasBorder := window_has_border("Test Window");
    AssertTrue(testHasBorder);
    window_toggle_border("Test Window");
    testHasBorder := window_has_border("Test Window");
    AssertFalse(testHasBorder);
    close_window("Test Window");
end;
procedure TIntegrationTests.TestWindowToggleBorderIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    AssertTrue(window_has_border(testWindow));
    window_toggle_border(testWindow);
    AssertFalse(window_has_border(testWindow));
    window_toggle_border(testWindow);
    AssertTrue(window_has_border(testWindow));
    close_window(testWindow);
end;
procedure TIntegrationTests.TestWindowToggleFullscreenNamedIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    process_events();
    AssertFalse(window_is_fullscreen("Test Window"));
    window_toggle_fullscreen("Test Window");
    process_events();
    AssertTrue(window_is_fullscreen("Test Window"));
    close_window("Test Window");
end;
procedure TIntegrationTests.TestWindowToggleFullscreenIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    initialFullscreenState := window_is_fullscreen(testWindow);
    window_toggle_fullscreen(testWindow);
    newFullscreenState := window_is_fullscreen(testWindow);
    AssertNotEquals(initialFullscreenState, newFullscreenState);
    close_window(testWindow);
end;
procedure TIntegrationTests.TestWindowWidthNamedIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    AssertEquals(window_width("Test Window"), 800);
    close_window(testWindow);
end;
procedure TIntegrationTests.TestWindowWidthIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    AssertEquals(window_width(testWindow), 800);
    close_window(testWindow);
end;
procedure TIntegrationTests.TestWindowWithFocusIntegration;
begin
    testWindow1 := open_window("Test Window 1", 800, 600);
    testWindow2 := open_window("Test Window 2", 800, 600);
    set_current_window(testWindow1);
    focusedWindow := window_with_focus();
    AssertEquals(focusedWindow, testWindow1);
    set_current_window(testWindow2);
    focusedWindow := window_with_focus();
    AssertEquals(focusedWindow, testWindow2);
    close_window(testWindow1);
    close_window(testWindow2);
end;
procedure TIntegrationTests.TestWindowXNamedIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    move_window_to("Test Window", 100, 200);
    AssertEquals(window_x("Test Window"), 100);
    close_window("Test Window");
end;
procedure TIntegrationTests.TestWindowXIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    AssertTrue(window_x(testWindow) > -1);
    close_window(testWindow);
end;
procedure TIntegrationTests.TestWindowYNamedIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    move_window_to("Test Window", 100, 200);
    testWindowY := window_y("Test Window");
    AssertEquals(testWindowY, 200);
    close_window("Test Window");
end;
procedure TIntegrationTests.TestWindowYIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    move_window_to(testWindow, 100, 200);
    AssertEquals(window_y(testWindow), 200);
    close_window(testWindow);
end;
end;

procedure RegisterTests;
begin
TestFramework.RegisterTest(TIntegrationTests.Suite);
end;
