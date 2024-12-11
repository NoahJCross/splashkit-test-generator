uses SplashKit, TestFramework

type
TTestCamera = class(TTestCase)
protected
procedure TIntegrationTests.TestCameraPositionIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    testCameraPosition := CameraPosition();
    AssertEquals(0.0, testCameraPosition.x);
    AssertEquals(0.0, testCameraPosition.y);
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestCameraXIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    SetCameraPosition(PointAt(100.0, 100.0));
    AssertEquals(100.0, CameraX());
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestCameraYIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    SetCameraPosition(PointAt(100.0, 200.0));
    AssertEquals(200.0, CameraY());
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestCenterCameraOnVectorIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    testSprite := CreateSprite("test_sprite");
    SpriteSetPosition(testSprite, PointAt(100.0, 100.0));
    CenterCameraOnVector(testSprite, VectorFromAngle(50.0, 50.0));
    AssertEquals(PointAt(-267.8606182336807, -161.69777810573578), CameraPosition());
    FreeSprite(testSprite);
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestCenterCameraOnIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    testSprite := CreateSprite("test_sprite");
    SpriteSetPosition(testSprite, PointAt(100.0, 100.0));
    CenterCameraOn(testSprite, 0.0, 0.0);
    AssertEquals(PointAt(-300, -200), CameraPosition());
    FreeSprite(testSprite);
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestMoveCameraByVectorIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    testVector := VectorFromAngle(0.0, 100.0);
    MoveCameraByVector(testVector);
    AssertEquals(100.0, CameraX());
    AssertEquals(0.0, CameraY());
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestMoveCameraByIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    MoveCameraBy(100.0, 100.0);
    AssertEquals(100.0, CameraX());
    AssertEquals(100.0, CameraY());
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestMoveCameraToPointIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    MoveCameraToPoint(PointAt(100.0, 100.0));
    AssertEquals(PointAt(100.0, 100.0), CameraPosition());
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestMoveCameraToIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    MoveCameraTo(100.0, 100.0);
    AssertEquals(100.0, CameraX());
    AssertEquals(100.0, CameraY());
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
    SetCameraX(0);
    SetCameraY(0);
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
    SetCameraX(0);
    SetCameraY(0);
    testCenter := ScreenCenter();
    AssertEquals(400, testCenter.x);
    AssertEquals(300, testCenter.y);
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestScreenRectangleIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    testRectangle := ScreenRectangle();
    AssertEquals(800, testRectangle.width);
    AssertEquals(600, testRectangle.height);
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestSetCameraPositionIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    SetCameraPosition(PointAt(100.0, 100.0));
    AssertEquals(PointAt(100.0, 100.0), CameraPosition());
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestSetCameraXIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    SetCameraX(100.0);
    AssertEquals(100.0, CameraX());
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestSetCameraYIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    SetCameraY(100.0);
    AssertEquals(100.0, CameraY());
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestToScreenPointIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    SetCameraPosition(PointAt(100.0, 100.0));
    testScreenPoint := ToScreenPoint(PointAt(150.0, 150.0));
    AssertEquals(50.0, testScreenPoint.x);
    AssertEquals(50.0, testScreenPoint.y);
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestToScreenRectangleIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    testRectangle := RectangleFrom(100.0, 100.0, 200.0, 200.0);
    screenRectangle := ToScreenRectangle(testRectangle);
    AssertEquals(ToScreenX(100.0), RectangleLeft(screenRectangle));
    AssertEquals(ToScreenY(100.0), RectangleTop(screenRectangle));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestToScreenXIntegration;
begin
    SetCameraX(100.0);
    testScreenX := ToScreenX(150.0);
    AssertEquals(50.0, testScreenX);
end;
procedure TIntegrationTests.TestToScreenYIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    SetCameraPosition(PointAt(100.0, 100.0));
    testScreenY := ToScreenY(150.0);
    AssertEquals(50.0, testScreenY);
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestToWorldIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    SetCameraPosition(PointAt(100.0, 100.0));
    testWorldPoint := ToWorld(PointAt(400.0, 300.0));
    AssertEquals(500.0, testWorldPoint.x);
    AssertEquals(400.0, testWorldPoint.y);
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestToWorldXIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    SetCameraPosition(PointAt(100.0, 100.0));
    testWorldX := ToWorldX(400.0);
    AssertEquals(500.0, testWorldX);
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestToWorldYIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    SetCameraPosition(PointAt(100.0, 100.0));
    testWorldY := ToWorldY(300.0);
    AssertEquals(400.0, testWorldY);
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestVectorWorldToScreenIntegration;
begin
    testVector := VectorWorldToScreen();
    AssertNotEquals(VectorFromAngle(0.0, 0.0), testVector);
end;
procedure TIntegrationTests.TestWindowAreaIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    testArea := WindowArea(testWindow);
    AssertEquals(800, testArea.width);
    AssertEquals(600, testArea.height);
    CloseWindow(testWindow);
end;
end;

procedure RegisterTests;
begin
#<Proc:0x00007f8aefd57268 /mnt/c/Users/Noahc/Documents/.Year 2 Semester 3/Team Project (A)/Github Repo/splashkit_test_generator/test_generator/config/languages/pascal_config.rb:113 (lambda)>
end;
