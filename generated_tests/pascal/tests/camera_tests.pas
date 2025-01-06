uses SplashKit, TestFramework, ../Helpers;
type
    TTestCamera = class(TTestCase)
    protected
        procedure Setup; override;
    end;
    procedure TestCameraPositionIntegration;
begin
    OpenWindow('Test Window 1', 800, 600);
    CleanupWindow := TWindowCleanup.Create;
    testCameraPosition := CameraPosition();
    AssertEquals(0.0, testCameraPosition.x);
    AssertEquals(0.0, testCameraPosition.y);
end;
procedure TestCameraXIntegration;
begin
    OpenWindow('Test Window 2', 800, 600);
    CleanupWindow := TWindowCleanup.Create;
    SetCameraPosition(PointAt(100.0, 100.0));
    AssertEquals(100.0, CameraX());
end;
procedure TestCameraYIntegration;
begin
    OpenWindow('Test Window 3', 800, 600);
    CleanupWindow := TWindowCleanup.Create;
    SetCameraPosition(PointAt(100.0, 200.0));
    AssertEquals(200.0, CameraY());
end;
procedure TestCenterCameraOnVectorIntegration;
begin
    OpenWindow('Test Window 4', 800, 600);
    CleanupWindow := TWindowCleanup.Create;
    testBitmap := CreateBitmap('Test Bitmap 1', 100, 100);
    CleanupBitmap := TBitmapCleanup.Create;
    testSprite := CreateSprite(testBitmap);
    CleanupSprite := TSpriteCleanup.Create;
    SpriteSetPosition(testSprite, PointAt(100.0, 100.0));
    CenterCameraOn(testSprite, VectorFromAngle(50.0, 50.0));
    AssertEquals(PointAt(-267.8606182336807, -161.69777810573578), CameraPosition());
end;
procedure TestCenterCameraOnIntegration;
begin
    OpenWindow('Test Window 5', 800, 600);
    CleanupWindow := TWindowCleanup.Create;
    testBitmap := CreateBitmap('Test Bitmap 2', 100, 100);
    CleanupBitmap := TBitmapCleanup.Create;
    testSprite := CreateSprite(testBitmap);
    CleanupSprite := TSpriteCleanup.Create;
    SpriteSetPosition(testSprite, PointAt(100.0, 100.0));
    CenterCameraOn(testSprite, 0.0, 0.0);
    AssertEquals(PointAt(-300.0, -200.0), CameraPosition());
end;
procedure TestMoveCameraByVectorIntegration;
begin
    OpenWindow('Test Window 6', 800, 600);
    CleanupWindow := TWindowCleanup.Create;
    testVector := VectorFromAngle(0.0, 100.0);
    MoveCameraTo(0.0, 0.0);
    MoveCameraBy(testVector);
    AssertEquals(100.0, CameraX());
    AssertEquals(0.0, CameraY());
end;
procedure TestMoveCameraByIntegration;
begin
    OpenWindow('Test Window 7', 800, 600);
    CleanupWindow := TWindowCleanup.Create;
    MoveCameraTo(0.0, 0.0);
    MoveCameraBy(100.0, 100.0);
    AssertEquals(100.0, CameraX());
    AssertEquals(100.0, CameraY());
end;
procedure TestMoveCameraToPointIntegration;
begin
    OpenWindow('Test Window 8', 800, 600);
    CleanupWindow := TWindowCleanup.Create;
    MoveCameraTo(PointAt(100.0, 100.0));
    AssertEquals(PointAt(100.0, 100.0), CameraPosition());
end;
procedure TestMoveCameraToIntegration;
begin
    OpenWindow('Test Window 9', 800, 600);
    CleanupWindow := TWindowCleanup.Create;
    MoveCameraTo(100.0, 100.0);
    AssertEquals(100.0, CameraX());
    AssertEquals(100.0, CameraY());
end;
procedure TestPointInWindowIntegration;
begin
    testWindow := OpenWindow('Test Window 10', 800, 600);
    CleanupWindow := TWindowCleanup.Create;
    testPoint := PointAt(400.0, 300.0);
    AssertTrue(PointInWindow(testWindow, testPoint));
    testPointOutside := PointAt(1000.0, 1000.0);
    AssertFalse(PointInWindow(testWindow, testPointOutside));
end;
procedure TestPointOnScreenIntegration;
begin
    OpenWindow('Test Window 11', 800, 600);
    CleanupWindow := TWindowCleanup.Create;
    testPoint := PointAt(400.0, 300.0);
    AssertTrue(PointOnScreen(testPoint));
    testPointOutside := PointAt(1000.0, 1000.0);
    AssertFalse(PointOnScreen(testPointOutside));
end;
procedure TestRectInWindowIntegration;
begin
    testWindow := OpenWindow('Test Window 12', 800, 600);
    CleanupWindow := TWindowCleanup.Create;
    SetCameraX(0.0);
    SetCameraY(0.0);
    testRectangle := RectangleFrom(0.0, 0.0, 100.0, 100.0);
    AssertTrue(RectInWindow(testWindow, testRectangle));
    testRectangleOutside := RectangleFrom(1000.0, 1000.0, 100.0, 100.0);
    AssertFalse(RectInWindow(testWindow, testRectangleOutside));
end;
procedure TestRectOnScreenIntegration;
begin
    OpenWindow('Test Window 13', 800, 600);
    CleanupWindow := TWindowCleanup.Create;
    testRectangle := RectangleFrom(0.0, 0.0, 100.0, 100.0);
    AssertTrue(RectOnScreen(testRectangle));
    MoveCameraTo(1000.0, 1000.0);
    AssertFalse(RectOnScreen(testRectangle));
end;
procedure TestScreenCenterIntegration;
begin
    OpenWindow('Test Window 14', 800, 600);
    CleanupWindow := TWindowCleanup.Create;
    SetCameraX(0.0);
    SetCameraY(0.0);
    testCenter := ScreenCenter();
    AssertEquals(400.0, testCenter.x);
    AssertEquals(300.0, testCenter.y);
end;
procedure TestScreenRectangleIntegration;
begin
    OpenWindow('Test Window 15', 800, 600);
    CleanupWindow := TWindowCleanup.Create;
    testRectangle := ScreenRectangle();
    AssertEquals(800.0, testRectangle.width);
    AssertEquals(600.0, testRectangle.height);
end;
procedure TestSetCameraPositionIntegration;
begin
    OpenWindow('Test Window 16', 800, 600);
    CleanupWindow := TWindowCleanup.Create;
    SetCameraPosition(PointAt(100.0, 100.0));
    AssertEquals(PointAt(100.0, 100.0), CameraPosition());
end;
procedure TestSetCameraXIntegration;
begin
    OpenWindow('Test Window 17', 800, 600);
    CleanupWindow := TWindowCleanup.Create;
    SetCameraX(100.0);
    AssertEquals(100.0, CameraX());
end;
procedure TestSetCameraYIntegration;
begin
    OpenWindow('Test Window 18', 800, 600);
    CleanupWindow := TWindowCleanup.Create;
    SetCameraY(100.0);
    AssertEquals(100.0, CameraY());
end;
procedure TestToScreenPointIntegration;
begin
    OpenWindow('Test Window 19', 800, 600);
    CleanupWindow := TWindowCleanup.Create;
    SetCameraPosition(PointAt(100.0, 100.0));
    testScreenPoint := ToScreen(PointAt(150.0, 150.0));
    AssertEquals(50.0, testScreenPoint.x);
    AssertEquals(50.0, testScreenPoint.y);
end;
procedure TestToScreenRectangleIntegration;
begin
    OpenWindow('Test Window 20', 800, 600);
    CleanupWindow := TWindowCleanup.Create;
    testRectangle := RectangleFrom(100.0, 100.0, 200.0, 200.0);
    screenRectangle := ToScreen(testRectangle);
    AssertEquals(ToScreenX(100.0), RectangleLeft(screenRectangle));
    AssertEquals(ToScreenY(100.0), RectangleTop(screenRectangle));
end;
procedure TestToScreenXIntegration;
begin
    OpenWindow('Test Window 21', 800, 600);
    CleanupWindow := TWindowCleanup.Create;
    SetCameraX(100.0);
    testScreenX := ToScreenX(150.0);
    AssertEquals(50.0, testScreenX);
end;
procedure TestToScreenYIntegration;
begin
    OpenWindow('Test Window 22', 800, 600);
    CleanupWindow := TWindowCleanup.Create;
    SetCameraY(100.0);
    testScreenY := ToScreenY(150.0);
    AssertEquals(50.0, testScreenY);
end;
procedure TestToWorldIntegration;
begin
    OpenWindow('Test Window 23', 800, 600);
    CleanupWindow := TWindowCleanup.Create;
    SetCameraPosition(PointAt(100.0, 100.0));
    testWorldPoint := ToWorld(PointAt(400.0, 300.0));
    AssertEquals(500.0, testWorldPoint.x);
    AssertEquals(400.0, testWorldPoint.y);
end;
procedure TestToWorldXIntegration;
begin
    OpenWindow('Test Window 24', 800, 600);
    CleanupWindow := TWindowCleanup.Create;
    SetCameraPosition(PointAt(100.0, 100.0));
    testWorldX := ToWorldX(400.0);
    AssertEquals(500.0, testWorldX);
end;
procedure TestToWorldYIntegration;
begin
    OpenWindow('Test Window 25', 800, 600);
    CleanupWindow := TWindowCleanup.Create;
    SetCameraPosition(PointAt(100.0, 100.0));
    testWorldY := ToWorldY(300.0);
    AssertEquals(400.0, testWorldY);
end;
procedure TestVectorWorldToScreenIntegration;
begin
    testVector1 := VectorWorldToScreen();
    AssertEquals(VectorFromAngle(0.0, 0.0), testVector1);
    MoveCameraTo(100.0, 100.0);
    testVector2 := VectorWorldToScreen();
    testVectorTo := VectorTo(-100.0, -100.0);
    AssertEquals(testVectorTo.x, testVector2.x);
    AssertEquals(testVectorTo.y, testVector2.y);
end;
procedure TestWindowAreaIntegration;
begin
    testWindow := OpenWindow('Test Window 26', 800, 600);
    CleanupWindow := TWindowCleanup.Create;
    testArea := WindowArea(testWindow);
    AssertEquals(800.0, testArea.width);
    AssertEquals(600.0, testArea.height);
end;
end;

procedure RegisterTests;
begin
    #<Proc:0x00007faa116e2450 /mnt/c/Users/Noahc/Documents/aYear_2_semester_2/TeamProject/GitHubRepo/splashkit_test_generator/test_generator/config/languages/pascal_config.rb:138 (lambda)>
end;
