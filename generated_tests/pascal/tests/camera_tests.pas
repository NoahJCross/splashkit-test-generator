uses SplashKit, TestFramework

type
TIntegrationTests = class(TTestCase)
published
procedure TIntegrationTests.TestCameraPositionIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    testCameraPosition := CameraPosition();
    AssertEquals(0.0, testCameraPosition);
    AssertEquals(0.0, testCameraPosition);
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestCameraXIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    SetCameraPosition(PointAt(100.0, 100.0));
    AssertEquals(CameraX(), 100.0);
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestCameraYIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    SetCameraPosition(PointAt(100.0, 200.0));
    AssertEquals(CameraY(), 200.0);
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestCenterCameraOnVectorIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    testSprite := CreateSprite("test_sprite");
    SpriteSetPosition(testSprite, PointAt(100.0, 100.0));
    CenterCameraOn(testSprite, VectorFromAngle(50.0, 50.0));
    AssertEquals(CameraPosition(), PointAt(50.0, 50.0));
    FreeSprite(testSprite);
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestCenterCameraOnIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    testSprite := CreateSprite("test_sprite");
    SpriteSetPosition(testSprite, PointAt(100.0, 100.0));
    CenterCameraOn(testSprite, 0.0, 0.0);
    AssertEquals(CameraPosition(), PointAt(50.0, 50.0));
    FreeSprite(testSprite);
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestMoveCameraByVectorIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    testVector := VectorFromAngle(0.0, 100.0);
    MoveCameraBy(testVector);
    AssertEquals(CameraX(), 100.0);
    AssertEquals(CameraY(), 100.0);
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestMoveCameraByIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    MoveCameraBy(100.0, 100.0);
    AssertEquals(CameraX(), 100.0);
    AssertEquals(CameraY(), 100.0);
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestMoveCameraToPointIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    MoveCameraTo(PointAt(100.0, 100.0));
    AssertEquals(CameraPosition(), PointAt(100.0, 100.0));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestMoveCameraToIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    MoveCameraTo(100.0, 100.0);
    AssertEquals(CameraX(), 100.0);
    AssertEquals(CameraY(), 100.0);
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestPointInWindowIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    testPoint := PointAt(400, 300);
    AssertTrue(PointInWindow(testWindow, testPoint));
    testPointOutside := PointAt(1000, 1000);
    AssertFalse(PointInWindow(testWindow, testPointOutside));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestPointOnScreenIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    testPoint := PointAt(400.0, 300.0);
    AssertTrue(PointOnScreen(testPoint));
    testPointOutside := PointAt(1000.0, 1000.0);
    AssertFalse(PointOnScreen(testPointOutside));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestRectInWindowIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    testRectangle := RectangleFrom(0, 0, 100, 100);
    AssertTrue(RectInWindow(testWindow, testRectangle));
    testRectangleOutside := RectangleFrom(1000, 1000, 100, 100);
    AssertFalse(RectInWindow(testWindow, testRectangleOutside));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestRectOnScreenIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    testRectangle := RectangleFrom(0, 0, 100, 100);
    AssertTrue(RectOnScreen(testRectangle));
    MoveCameraTo(1000, 1000);
    AssertFalse(RectOnScreen(testRectangle));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestScreenCenterIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    testCenter := ScreenCenter();
    AssertEquals(Todo(), testCenter);
    AssertEquals(Todo(), testCenter);
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestScreenRectangleIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    testRectangle := ScreenRectangle();
    AssertEquals(testRectangle.width, 800);
    AssertEquals(testRectangle.height, 600);
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestSetCameraPositionIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    SetCameraPosition(PointAt(100.0, 100.0));
    AssertEquals(CameraPosition(), PointAt(100.0, 100.0));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestSetCameraXIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    SetCameraX(100.0);
    AssertEquals(CameraX(), 100.0);
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestSetCameraYIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    SetCameraY(100.0);
    AssertEquals(CameraY(), 100.0);
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestToScreenPointIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    SetCameraPosition(PointAt(100.0, 100.0));
    testScreenPoint := ToScreen(PointAt(150.0, 150.0));
    AssertEquals(Todo(), testScreenPoint);
    AssertEquals(Todo(), testScreenPoint);
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestToScreenRectangleIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    testRectangle := RectangleFrom(100.0, 100.0, 200.0, 200.0);
    screenRectangle := ToScreen(testRectangle);
    AssertEquals(RectangleLeft(screenRectangle), ToScreenX(100.0));
    AssertEquals(RectangleTop(screenRectangle), ToScreenY(100.0));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestToScreenXIntegration;
begin
    SetCameraX(100.0);
    testScreenX := ToScreenX(150.0);
    AssertEquals(testScreenX, 50.0);
end;
procedure TIntegrationTests.TestToScreenYIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    SetCameraPosition(PointAt(100.0, 100.0));
    testScreenY := ToScreenY(150.0);
    AssertEquals(testScreenY, 50.0);
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestToWorldIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    SetCameraPosition(PointAt(100.0, 100.0));
    testWorldPoint := ToWorld(PointAt(400.0, 300.0));
    AssertEquals(Todo(), testWorldPoint);
    AssertEquals(Todo(), testWorldPoint);
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestToWorldXIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    SetCameraPosition(PointAt(100.0, 100.0));
    testWorldX := ToWorldX(400.0);
    AssertEquals(testWorldX, CameraX());
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestToWorldYIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    SetCameraPosition(PointAt(100.0, 100.0));
    testWorldY := ToWorldY(300.0);
    AssertEquals(testWorldY, 400.0);
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestVectorWorldToScreenIntegration;
begin
    testVector := VectorWorldToScreen();
    AssertNotEquals(testVector, VectorFromAngle(0.0, 0.0));
end;
procedure TIntegrationTests.TestWindowAreaIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    testArea := WindowArea(testWindow);
    AssertEquals(testArea.width, 800);
    AssertEquals(testArea.height, 600);
    CloseWindow(testWindow);
end;
end;

procedure RegisterTests;
begin
TestFramework.RegisterTest(TIntegrationTests.Suite);
end;
