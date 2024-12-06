uses SplashKit, TestFramework

type
TIntegrationTests = class(TTestCase)
published
procedure TIntegrationTests.TestCameraPositionIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    testCameraPosition := camera_position();
    AssertEquals(0.0, testCameraPosition);
    AssertEquals(0.0, testCameraPosition);
    close_window(testWindow);
end;
procedure TIntegrationTests.TestCameraXIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    set_camera_position(point_at(100.0, 100.0));
    AssertEquals(camera_x(), 100.0);
    close_window(testWindow);
end;
procedure TIntegrationTests.TestCameraYIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    set_camera_position(point_at(100.0, 200.0));
    AssertEquals(camera_y(), 200.0);
    close_window(testWindow);
end;
procedure TIntegrationTests.TestCenterCameraOnVectorIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    testSprite := create_sprite("test_sprite");
    sprite_set_position(testSprite, point_at(100.0, 100.0));
    center_camera_on(testSprite, vector_from_angle(50.0, 50.0));
    AssertEquals(camera_position(), point_at(50.0, 50.0));
    free_sprite(testSprite);
    close_window(testWindow);
end;
procedure TIntegrationTests.TestCenterCameraOnIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    testSprite := create_sprite("test_sprite");
    sprite_set_position(testSprite, point_at(100.0, 100.0));
    center_camera_on(testSprite, 0.0, 0.0);
    AssertEquals(camera_position(), point_at(50.0, 50.0));
    free_sprite(testSprite);
    close_window(testWindow);
end;
procedure TIntegrationTests.TestMoveCameraByVectorIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    testVector := vector_from_angle(0.0, 100.0);
    move_camera_by(testVector);
    AssertEquals(camera_x(), 100.0);
    AssertEquals(camera_y(), 100.0);
    close_window(testWindow);
end;
procedure TIntegrationTests.TestMoveCameraByIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    move_camera_by(100.0, 100.0);
    AssertEquals(camera_x(), 100.0);
    AssertEquals(camera_y(), 100.0);
    close_window(testWindow);
end;
procedure TIntegrationTests.TestMoveCameraToPointIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    move_camera_to(point_at(100.0, 100.0));
    AssertEquals(camera_position(), point_at(100.0, 100.0));
    close_window(testWindow);
end;
procedure TIntegrationTests.TestMoveCameraToIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    move_camera_to(100.0, 100.0);
    AssertEquals(camera_x(), 100.0);
    AssertEquals(camera_y(), 100.0);
    close_window(testWindow);
end;
procedure TIntegrationTests.TestPointInWindowIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    testPoint := point_at(400, 300);
    AssertTrue(point_in_window(testWindow, testPoint));
    testPointOutside := point_at(1000, 1000);
    AssertFalse(point_in_window(testWindow, testPointOutside));
    close_window(testWindow);
end;
procedure TIntegrationTests.TestPointOnScreenIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    testPoint := point_at(400.0, 300.0);
    AssertTrue(point_on_screen(testPoint));
    testPointOutside := point_at(1000.0, 1000.0);
    AssertFalse(point_on_screen(testPointOutside));
    close_window(testWindow);
end;
procedure TIntegrationTests.TestRectInWindowIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    testRectangle := rectangle_from(0, 0, 100, 100);
    AssertTrue(rect_in_window(testWindow, testRectangle));
    testRectangleOutside := rectangle_from(1000, 1000, 100, 100);
    AssertFalse(rect_in_window(testWindow, testRectangleOutside));
    close_window(testWindow);
end;
procedure TIntegrationTests.TestRectOnScreenIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    testRectangle := rectangle_from(0, 0, 100, 100);
    AssertTrue(rect_on_screen(testRectangle));
    move_camera_to(1000, 1000);
    AssertFalse(rect_on_screen(testRectangle));
    close_window(testWindow);
end;
procedure TIntegrationTests.TestScreenCenterIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    testCenter := screen_center();
    AssertEquals(todo(), testCenter);
    AssertEquals(todo(), testCenter);
    close_window(testWindow);
end;
procedure TIntegrationTests.TestScreenRectangleIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    testRectangle := screen_rectangle();
    AssertEquals(testRectangle.width, 800);
    AssertEquals(testRectangle.height, 600);
    close_window(testWindow);
end;
procedure TIntegrationTests.TestSetCameraPositionIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    set_camera_position(point_at(100.0, 100.0));
    AssertEquals(camera_position(), point_at(100.0, 100.0));
    close_window(testWindow);
end;
procedure TIntegrationTests.TestSetCameraXIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    set_camera_x(100.0);
    AssertEquals(camera_x(), 100.0);
    close_window(testWindow);
end;
procedure TIntegrationTests.TestSetCameraYIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    set_camera_y(100.0);
    AssertEquals(camera_y(), 100.0);
    close_window(testWindow);
end;
procedure TIntegrationTests.TestToScreenPointIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    set_camera_position(point_at(100.0, 100.0));
    testScreenPoint := to_screen(point_at(150.0, 150.0));
    AssertEquals(todo(), testScreenPoint);
    AssertEquals(todo(), testScreenPoint);
    close_window(testWindow);
end;
procedure TIntegrationTests.TestToScreenRectangleIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    testRectangle := rectangle_from(100.0, 100.0, 200.0, 200.0);
    screenRectangle := to_screen(testRectangle);
    AssertEquals(rectangle_left(screenRectangle), to_screen_x(100.0));
    AssertEquals(rectangle_top(screenRectangle), to_screen_y(100.0));
    close_window(testWindow);
end;
procedure TIntegrationTests.TestToScreenXIntegration;
begin
    set_camera_x(100.0);
    testScreenX := to_screen_x(150.0);
    AssertEquals(testScreenX, 50.0);
end;
procedure TIntegrationTests.TestToScreenYIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    set_camera_position(point_at(100.0, 100.0));
    testScreenY := to_screen_y(150.0);
    AssertEquals(testScreenY, 50.0);
    close_window(testWindow);
end;
procedure TIntegrationTests.TestToWorldIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    set_camera_position(point_at(100.0, 100.0));
    testWorldPoint := to_world(point_at(400.0, 300.0));
    AssertEquals(todo(), testWorldPoint);
    AssertEquals(todo(), testWorldPoint);
    close_window(testWindow);
end;
procedure TIntegrationTests.TestToWorldXIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    set_camera_position(point_at(100.0, 100.0));
    testWorldX := to_world_x(400.0);
    AssertEquals(testWorldX, camera_x());
    close_window(testWindow);
end;
procedure TIntegrationTests.TestToWorldYIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    set_camera_position(point_at(100.0, 100.0));
    testWorldY := to_world_y(300.0);
    AssertEquals(testWorldY, 400.0);
    close_window(testWindow);
end;
procedure TIntegrationTests.TestVectorWorldToScreenIntegration;
begin
    testVector := vector_world_to_screen();
    AssertNotEquals(testVector, vector_from_angle(0.0, 0.0));
end;
procedure TIntegrationTests.TestWindowAreaIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    testArea := window_area(testWindow);
    AssertEquals(testArea.width, 800);
    AssertEquals(testArea.height, 600);
    close_window(testWindow);
end;
end;

procedure RegisterTests;
begin
TestFramework.RegisterTest(TIntegrationTests.Suite);
end;
