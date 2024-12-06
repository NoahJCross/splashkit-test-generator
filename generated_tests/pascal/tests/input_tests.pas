uses SplashKit, TestFramework

type
TIntegrationTests = class(TTestCase)
published
procedure TIntegrationTests.TestProcessEventsIntegration;
begin
    simulate_key_press(Keycode.A);
    process_events();
    AssertTrue(key_typed(Keycode.A));
    simulate_mouse_click(Mousebutton.LEFT);
    process_events();
    AssertTrue(mouse_clicked(Mousebutton.LEFT));
end;
procedure TIntegrationTests.TestQuitRequestedIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    process_events();
    AssertFalse(quit_requested());
    simulate_key_press(Keycode.ESCAPE);
    process_events();
    AssertTrue(quit_requested());
    close_window(testWindow);
end;
procedure TIntegrationTests.TestResetQuitIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    process_events();
    AssertTrue(quit_requested());
    reset_quit();
    process_events();
    AssertFalse(quit_requested());
    close_window(testWindow);
end;
procedure TIntegrationTests.TestAnyKeyPressedIntegration;
begin
    process_events();
    AssertFalse(any_key_pressed());
    simulate_key_press(Keycode.A);
    process_events();
    AssertTrue(any_key_pressed());
end;
procedure TIntegrationTests.TestDeregisterCallbackOnKeyDownIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    register_callback_on_key_down(_on_key_down());
    simulate_key_press(Keycode.A);
    process_events();
    AssertTrue(key_down(Keycode.A));
    deregister_callback_on_key_down(_on_key_down());
    simulate_key_press(Keycode.B);
    process_events();
    AssertFalse(key_down(Keycode.B));
    close_window(testWindow);
end;
procedure TIntegrationTests.TestDeregisterCallbackOnKeyTypedIntegration;
begin
    register_callback_on_key_typed(_on_key_typed());
    simulate_key_press(Keycode.A);
    process_events();
    AssertTrue(key_typed(Keycode.A));
    deregister_callback_on_key_typed(_on_key_typed());
    simulate_key_press(Keycode.B);
    process_events();
    AssertFalse(key_typed(Keycode.B));
end;
procedure TIntegrationTests.TestDeregisterCallbackOnKeyUpIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    register_callback_on_key_up(_on_key_up());
    simulate_key_press(Keycode.A);
    process_events();
    AssertTrue(key_up(Keycode.A));
    deregister_callback_on_key_up(_on_key_up());
    simulate_key_press(Keycode.B);
    process_events();
    AssertFalse(key_up(Keycode.B));
    close_window(testWindow);
end;
procedure TIntegrationTests.TestKeyDownIntegration;
begin
    process_events();
    AssertFalse(key_down(Keycode.A));
    simulate_key_press(Keycode.A);
    process_events();
    AssertTrue(key_down(Keycode.A));
    simulate_key_release(Keycode.A);
    process_events();
    AssertFalse(key_down(Keycode.A));
end;
procedure TIntegrationTests.TestKeyNameIntegration;
begin
    testKeyName1 := key_name(Keycode.A);
    AssertEquals(testKeyName1, "A");
    testKeyName2 := key_name(Keycode.ENTER);
    AssertEquals(testKeyName2, "Enter");
end;
procedure TIntegrationTests.TestKeyReleasedIntegration;
begin
    process_events();
    AssertFalse(key_released(Keycode.A));
    simulate_key_press(Keycode.A);
    process_events();
    simulate_key_release(Keycode.A);
    process_events();
    AssertTrue(key_released(Keycode.A));
end;
procedure TIntegrationTests.TestKeyTypedIntegration;
begin
    process_events();
    AssertFalse(key_typed(Keycode.A));
    simulate_key_press(Keycode.A);
    process_events();
    AssertTrue(key_typed(Keycode.A));
end;
procedure TIntegrationTests.TestKeyUpIntegration;
begin
    process_events();
    AssertTrue(key_up(Keycode.A));
    simulate_key_press(Keycode.A);
    process_events();
    AssertFalse(key_up(Keycode.A));
    simulate_key_release(Keycode.A);
    process_events();
    AssertTrue(key_up(Keycode.A));
end;
procedure TIntegrationTests.TestRegisterCallbackOnKeyDownIntegration;
begin
    register_callback_on_key_down(_on_key_down());
    process_events();
    simulate_key_press(Keycode.A);
    process_events();
    AssertTrue(key_down(Keycode.A));
    deregister_callback_on_key_down(_on_key_down());
end;
procedure TIntegrationTests.TestRegisterCallbackOnKeyTypedIntegration;
begin
    register_callback_on_key_typed(_on_key_typed());
    process_events();
    simulate_key_press(Keycode.A);
    process_events();
    AssertTrue(key_typed(Keycode.A));
    deregister_callback_on_key_typed(_on_key_typed());
end;
procedure TIntegrationTests.TestRegisterCallbackOnKeyUpIntegration;
begin
    register_callback_on_key_up(_on_key_up());
    process_events();
    simulate_key_press(Keycode.A);
    simulate_key_release(Keycode.A);
    process_events();
    AssertEquals(KeyUp, "A");
    deregister_callback_on_key_up(_on_key_up());
end;
procedure TIntegrationTests.TestHideMouseIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    process_events();
    AssertTrue(mouse_shown());
    hide_mouse();
    process_events();
    AssertFalse(mouse_shown());
    close_window(testWindow);
end;
procedure TIntegrationTests.TestMouseClickedIntegration;
begin
    process_events();
    AssertFalse(mouse_clicked(Mousebutton.LEFT));
    simulate_mouse_click(Mousebutton.LEFT);
    process_events();
    AssertTrue(mouse_clicked(Mousebutton.LEFT));
end;
procedure TIntegrationTests.TestMouseDownIntegration;
begin
    process_events();
    AssertFalse(mouse_down(Mousebutton.LEFT));
    simulate_mouse_press(Mousebutton.LEFT);
    process_events();
    AssertTrue(mouse_down(Mousebutton.LEFT));
    simulate_mouse_release(Mousebutton.LEFT);
    process_events();
    AssertFalse(mouse_down(Mousebutton.LEFT));
end;
procedure TIntegrationTests.TestMouseMovementIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    move_mouse(100.0, 100.0);
    process_events();
    testMovement := mouse_movement();
    AssertEquals(testMovement.x, 100.0);
    AssertEquals(testMovement.y, 100.0);
    close_window(testWindow);
end;
procedure TIntegrationTests.TestMousePositionIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    move_mouse(400.0, 300.0);
    process_events();
    testPosition := mouse_position();
    AssertEquals(testPosition.x, 400.0);
    AssertEquals(testPosition.y, 300.0);
    close_window(testWindow);
end;
procedure TIntegrationTests.TestMousePositionVectorIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    move_mouse(400.0, 300.0);
    process_events();
    testMousePosition := mouse_position_vector();
    AssertEquals(testMousePosition.x, 400.0);
    AssertEquals(testMousePosition.y, 300.0);
    close_window(testWindow);
end;
procedure TIntegrationTests.TestMouseShownIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    show_mouse();
    process_events();
    AssertTrue(mouse_shown());
    hide_mouse();
    process_events();
    AssertFalse(mouse_shown());
    close_window(testWindow);
end;
procedure TIntegrationTests.TestMouseUpIntegration;
begin
    process_events();
    AssertTrue(mouse_up(Mousebutton.LEFT));
    simulate_mouse_click(Mousebutton.LEFT);
    process_events();
    AssertFalse(mouse_up(Mousebutton.LEFT));
end;
procedure TIntegrationTests.TestMouseWheelScrollIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    process_events();
    AssertEquals(mouse_wheel_scroll(), vector_from_angle(0.0, 0.0));
    simulate_mouse_wheel_scroll(10.0, 5.0);
    process_events();
    AssertTrue(mouse_wheel_scroll());
    close_window(testWindow);
end;
procedure TIntegrationTests.TestMouseXIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    move_mouse(400.0, 300.0);
    process_events();
    AssertTrue((mouse_x() >= 399.0) and (mouse_x() <= 401.0));
    close_window(testWindow);
end;
procedure TIntegrationTests.TestMouseYIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    move_mouse(400.0, 300.0);
    process_events();
    AssertEquals(mouse_y(), 300.0);
    close_window(testWindow);
end;
procedure TIntegrationTests.TestMoveMouseIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    process_events();
    move_mouse(400.0, 300.0);
    process_events();
    AssertTrue((mouse_x() >= 399.0) and (mouse_x() <= 401.0));
    AssertTrue((mouse_y() >= 299.0) and (mouse_y() <= 301.0));
    close_window(testWindow);
end;
procedure TIntegrationTests.TestMoveMouseToPointIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    move_mouse(point_at(400.0, 300.0));
    process_events();
    AssertEquals(mouse_position(), point_at(400.0, 300.0));
    close_window(testWindow);
end;
procedure TIntegrationTests.TestShowMouseIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    hide_mouse();
    process_events();
    AssertFalse(mouse_shown());
    show_mouse();
    process_events();
    AssertTrue(mouse_shown());
    close_window(testWindow);
end;
procedure TIntegrationTests.TestShowMouseWithBooleanIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    show_mouse(true);
    process_events();
    AssertTrue(mouse_shown());
    show_mouse(false);
    process_events();
    AssertFalse(mouse_shown());
    close_window(testWindow);
end;
procedure TIntegrationTests.TestDrawCollectedTextIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    testFont := load_font("test_font", "path/to/font.ttf");
    start_reading_text(rectangle_from(100, 100, 200, 30));
    process_events();
    simulate_key_press(Keycode.A);
    process_events();
    draw_collected_text(color_black(), testFont, 18, option_defaults());
    refresh_screen();
    AssertEquals(get_pixel(testWindow, 105, 115), color_black());
    end_reading_text();
    free_font(testFont);
    close_window(testWindow);
end;
procedure TIntegrationTests.TestEndReadingTextIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    start_reading_text(rectangle_from(100.0, 100.0, 200.0, 30.0));
    process_events();
    AssertTrue(reading_text());
    end_reading_text();
    process_events();
    AssertFalse(reading_text());
    close_window(testWindow);
end;
procedure TIntegrationTests.TestEndReadingTextInWindowIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    testRectangle := rectangle_from(100.0, 100.0, 200.0, 30.0);
    start_reading_text(testWindow, testRectangle);
    process_events();
    AssertTrue(reading_text(testWindow));
    end_reading_text(testWindow);
    process_events();
    AssertFalse(reading_text(testWindow));
    close_window(testWindow);
end;
procedure TIntegrationTests.TestReadingTextIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    start_reading_text(rectangle_from(100.0, 100.0, 200.0, 30.0));
    process_events();
    AssertTrue(reading_text());
    end_reading_text();
    process_events();
    AssertFalse(reading_text());
    close_window(testWindow);
end;
procedure TIntegrationTests.TestReadingTextInWindowIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    testRectangle := rectangle_from(100.0, 100.0, 200.0, 30.0);
    start_reading_text(testWindow, testRectangle);
    process_events();
    AssertTrue(reading_text(testWindow));
    end_reading_text(testWindow);
    process_events();
    AssertFalse(reading_text(testWindow));
    close_window(testWindow);
end;
procedure TIntegrationTests.TestStartReadingTextIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    testRect := rectangle_from(100.0, 100.0, 200.0, 30.0);
    start_reading_text(testRect);
    process_events();
    AssertTrue(reading_text());
    end_reading_text();
    process_events();
    AssertFalse(reading_text());
    close_window(testWindow);
end;
procedure TIntegrationTests.TestStartReadingTextWithInitialTextIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    testRect := rectangle_from(100.0, 100.0, 200.0, 30.0);
    start_reading_text(testRect, "Initial Text");
    process_events();
    AssertTrue(reading_text());
    end_reading_text();
    close_window(testWindow);
end;
procedure TIntegrationTests.TestStartReadingTextInWindowIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    testRect := rectangle_from(100.0, 100.0, 200.0, 30.0);
    start_reading_text(testWindow, testRect);
    process_events();
    AssertTrue(reading_text(testWindow));
    end_reading_text(testWindow);
    close_window(testWindow);
end;
procedure TIntegrationTests.TestStartReadingTextInWindowWithInitialTextIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    testRect := rectangle_from(100.0, 100.0, 200.0, 30.0);
    start_reading_text(testWindow, testRect, "Initial Text");
    process_events();
    AssertTrue(reading_text(testWindow));
    end_reading_text(testWindow);
    close_window(testWindow);
end;
procedure TIntegrationTests.TestTextEntryCancelledIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    start_reading_text(rectangle_from(100.0, 100.0, 200.0, 30.0));
    process_events();
    AssertFalse(text_entry_cancelled());
    simulate_key_press(Keycode.ESCAPE);
    process_events();
    AssertTrue(text_entry_cancelled());
    end_reading_text();
    close_window(testWindow);
end;
procedure TIntegrationTests.TestTextEntryCancelledInWindowIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    testRect := rectangle_from(100.0, 100.0, 200.0, 30.0);
    start_reading_text(testWindow, testRect);
    process_events();
    AssertFalse(text_entry_cancelled(testWindow));
    simulate_key_press(Keycode.ESCAPE);
    process_events();
    AssertTrue(text_entry_cancelled(testWindow));
    close_window(testWindow);
end;
procedure TIntegrationTests.TestTextInputIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    start_reading_text(rectangle_from(100.0, 100.0, 200.0, 30.0));
    process_events();
    simulate_key_press(Keycode.A);
    process_events();
    AssertEquals(text_input(), "A");
    end_reading_text();
    close_window(testWindow);
end;
procedure TIntegrationTests.TestTextInputInWindowIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    testRectangle := rectangle_from(100.0, 100.0, 200.0, 30.0);
    start_reading_text(testWindow, testRectangle);
    process_events();
    simulate_key_press(Keycode.A);
    process_events();
    AssertEquals(text_input(testWindow), "A");
    end_reading_text(testWindow);
    close_window(testWindow);
end;
end;

procedure RegisterTests;
begin
TestFramework.RegisterTest(TIntegrationTests.Suite);
end;
