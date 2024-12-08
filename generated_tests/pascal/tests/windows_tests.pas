uses SplashKit, TestFramework

type
TIntegrationTests = class(TTestCase)
published
procedure TIntegrationTests.TestClearWindowIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    testColor := ColorBlack();
    ClearWindow(testWindow, testColor);
    RefreshWindow(testWindow);
    AssertEquals(ColorBlack(), GetPixel(PointAt(WindowWidth(testWindow), WindowHeight(testWindow))));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestCloseAllWindowsIntegration;
begin
    testWindow1 := OpenWindow("Test Window 1", 800, 600);
    testWindow2 := OpenWindow("Test Window 2", 800, 600);
    CloseAllWindows();
    AssertFalse(HasWindow("Test Window 1"));
    AssertFalse(HasWindow("Test Window 2"));
end;
procedure TIntegrationTests.TestCloseCurrentWindowIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    SetCurrentWindow(testWindow);
    CloseCurrentWindow();
    AssertFalse(HasWindow("Test Window"));
end;
procedure TIntegrationTests.TestCloseWindowNamedIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    windowExists := HasWindow("Test Window");
    AssertTrue(windowExists);
    CloseWindow("Test Window");
    windowExists := HasWindow("Test Window");
    AssertFalse(windowExists);
end;
procedure TIntegrationTests.TestCloseWindowIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    CloseWindow(testWindow);
    AssertFalse(HasWindow("Test Window"));
end;
procedure TIntegrationTests.TestCurrentWindowIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    SetCurrentWindow(testWindow);
    AssertEquals(testWindow, CurrentWindow());
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestCurrentWindowHasBorderIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    AssertTrue(CurrentWindowHasBorder());
    CurrentWindowToggleBorder();
    AssertFalse(CurrentWindowHasBorder());
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestCurrentWindowHeightIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    SetCurrentWindow(testWindow);
    AssertEquals(600, CurrentWindowHeight());
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestCurrentWindowIsFullscreenIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    AssertFalse(CurrentWindowIsFullscreen());
    CurrentWindowToggleFullscreen();
    AssertTrue(CurrentWindowIsFullscreen());
    CurrentWindowToggleFullscreen();
    AssertFalse(CurrentWindowIsFullscreen());
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestCurrentWindowPositionIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    testPosition := CurrentWindowPosition();
    AssertNotNull(testPosition);
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestCurrentWindowToggleBorderIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    CurrentWindowToggleBorder();
    AssertFalse(CurrentWindowHasBorder());
    CurrentWindowToggleBorder();
    AssertTrue(CurrentWindowHasBorder());
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestCurrentWindowToggleFullscreenIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    CurrentWindowToggleFullscreen();
    AssertTrue(CurrentWindowIsFullscreen());
    CurrentWindowToggleFullscreen();
    AssertFalse(CurrentWindowIsFullscreen());
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestCurrentWindowWidthIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    SetCurrentWindow(testWindow);
    AssertEquals(800, CurrentWindowWidth());
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestCurrentWindowXIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    MoveWindowTo(testWindow, 100, 200);
    SetCurrentWindow(testWindow);
    AssertEquals(100, CurrentWindowX());
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestCurrentWindowYIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    testY := CurrentWindowY();
    AssertTrue(testY > -1);
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestHasWindowIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    AssertTrue(HasWindow("Test Window"));
    CloseWindow(testWindow);
    AssertFalse(HasWindow("Test Window"));
end;
procedure TIntegrationTests.TestIsCurrentWindowIntegration;
begin
    testWindow1 := OpenWindow("Test Window 1", 800, 600);
    testWindow2 := OpenWindow("Test Window 2", 800, 600);
    SetCurrentWindow(testWindow1);
    AssertTrue(IsCurrentWindow(testWindow1));
    AssertFalse(IsCurrentWindow(testWindow2));
    SetCurrentWindow(testWindow2);
    AssertTrue(IsCurrentWindow(testWindow2));
    AssertFalse(IsCurrentWindow(testWindow1));
    CloseWindow(testWindow1);
    CloseWindow(testWindow2);
end;
procedure TIntegrationTests.TestMoveCurrentWindowToIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    MoveCurrentWindowTo(100, 100);
    AssertEquals(100, CurrentWindowX());
    AssertEquals(100, CurrentWindowY());
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestMoveWindowToNamedIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    MoveWindowTo("Test Window", 100, 100);
    ProcessEvents();
    AssertEquals(100, WindowX("Test Window"));
    AssertEquals(100, WindowY("Test Window"));
    CloseWindow("Test Window");
end;
procedure TIntegrationTests.TestMoveWindowToIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    MoveWindowTo(testWindow, 100, 100);
    AssertEquals(100, WindowX(testWindow));
    AssertEquals(100, WindowY(testWindow));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestOpenWindowIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    AssertNotNull(testWindow);
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestRefreshWindowIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    DrawCircle(ColorBlack(), CircleAt(400.0, 300.0, 50.0));
    RefreshWindow(testWindow);
    AssertTrue(PointInCircle(PointAt(400.0, 300.0), CircleAt(400.0, 300.0, 50.0)));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestRefreshWindowWithTargetFpsIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    RefreshWindow(testWindow, 60);
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestResizeCurrentWindowIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    SetCurrentWindow(testWindow);
    ResizeCurrentWindow(1024, 768);
    ProcessEvents();
    AssertEquals(1024, CurrentWindowWidth());
    AssertEquals(768, CurrentWindowHeight());
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestResizeWindowIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    ResizeWindow(testWindow, 1024, 768);
    AssertEquals(1024, WindowWidth(testWindow));
    AssertEquals(768, WindowHeight(testWindow));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestSetCurrentWindowNamedIntegration;
begin
    testWindow1 := OpenWindow("Test Window 1", 800, 600);
    testWindow2 := OpenWindow("Test Window 2", 800, 600);
    SetCurrentWindow("Test Window 2");
    AssertTrue(IsCurrentWindow(testWindow2));
    CloseWindow(testWindow1);
    CloseWindow(testWindow2);
end;
procedure TIntegrationTests.TestSetCurrentWindowIntegration;
begin
    testWindow1 := OpenWindow("Test Window 1", 800, 600);
    testWindow2 := OpenWindow("Test Window 2", 800, 600);
    SetCurrentWindow(testWindow2);
    AssertTrue(IsCurrentWindow(testWindow2));
    CloseWindow(testWindow1);
    CloseWindow(testWindow2);
end;
procedure TIntegrationTests.TestWindowCaptionIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    AssertEquals("Test Window", WindowCaption(testWindow));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestWindowCloseRequestedNamedIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    ProcessEvents();
    AssertFalse(WindowCloseRequested("Test Window"));
    SimulateKeyPress(KeyCode.ESCAPE);
    ProcessEvents();
    AssertTrue(WindowCloseRequested("Test Window"));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestWindowCloseRequestedIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    ProcessEvents();
    AssertFalse(WindowCloseRequested(testWindow));
    SimulateKeyPress(KeyCode.ESCAPE);
    ProcessEvents();
    AssertTrue(WindowCloseRequested(testWindow));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestWindowHasBorderNamedIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    AssertTrue(WindowHasBorder("Test Window"));
    WindowToggleBorder("Test Window");
    AssertFalse(WindowHasBorder("Test Window"));
    CloseWindow("Test Window");
end;
procedure TIntegrationTests.TestWindowHasBorderIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    AssertTrue(WindowHasBorder(testWindow));
    WindowToggleBorder(testWindow);
    AssertFalse(WindowHasBorder(testWindow));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestWindowHasFocusIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    ProcessEvents();
    AssertTrue(WindowHasFocus(testWindow));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestWindowHeightNamedIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    AssertEquals(600, WindowHeight("Test Window"));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestWindowHeightIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    AssertEquals(600, WindowHeight(testWindow));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestWindowIsFullscreenNamedIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    WindowToggleFullscreen(testWindow);
    AssertTrue(WindowIsFullscreen("Test Window"));
    WindowToggleFullscreen(testWindow);
    AssertFalse(WindowIsFullscreen("Test Window"));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestWindowIsFullscreenIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    AssertFalse(WindowIsFullscreen(testWindow));
    WindowToggleFullscreen(testWindow);
    AssertTrue(WindowIsFullscreen(testWindow));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestWindowNamedIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    retrievedWindow := WindowNamed("Test Window");
    AssertEquals(retrievedWindow, testWindow);
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestWindowPositionNamedIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    testPosition := WindowPosition("Test Window");
    AssertNotNull(testPosition);
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestWindowPositionIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    testPosition := WindowPosition(testWindow);
    AssertNotNull(testPosition);
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestWindowSetIconIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    testBitmap := CreateBitmap("test_icon", 32, 32);
    WindowSetIcon(testWindow, testBitmap);
    CloseWindow(testWindow);
    FreeBitmap(testBitmap);
end;
procedure TIntegrationTests.TestWindowToggleBorderNamedIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    testHasBorder := WindowHasBorder("Test Window");
    AssertTrue(testHasBorder);
    WindowToggleBorder("Test Window");
    testHasBorder := WindowHasBorder("Test Window");
    AssertFalse(testHasBorder);
    CloseWindow("Test Window");
end;
procedure TIntegrationTests.TestWindowToggleBorderIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    AssertTrue(WindowHasBorder(testWindow));
    WindowToggleBorder(testWindow);
    AssertFalse(WindowHasBorder(testWindow));
    WindowToggleBorder(testWindow);
    AssertTrue(WindowHasBorder(testWindow));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestWindowToggleFullscreenNamedIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    ProcessEvents();
    AssertFalse(WindowIsFullscreen("Test Window"));
    WindowToggleFullscreen("Test Window");
    ProcessEvents();
    AssertTrue(WindowIsFullscreen("Test Window"));
    CloseWindow("Test Window");
end;
procedure TIntegrationTests.TestWindowToggleFullscreenIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    initialFullscreenState := WindowIsFullscreen(testWindow);
    WindowToggleFullscreen(testWindow);
    newFullscreenState := WindowIsFullscreen(testWindow);
    AssertNotEquals(newFullscreenState, initialFullscreenState);
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestWindowWidthNamedIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    AssertEquals(800, WindowWidth("Test Window"));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestWindowWidthIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    AssertEquals(800, WindowWidth(testWindow));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestWindowWithFocusIntegration;
begin
    testWindow1 := OpenWindow("Test Window 1", 800, 600);
    testWindow2 := OpenWindow("Test Window 2", 800, 600);
    SetCurrentWindow(testWindow1);
    focusedWindow := WindowWithFocus();
    AssertEquals(testWindow1, focusedWindow);
    SetCurrentWindow(testWindow2);
    focusedWindow := WindowWithFocus();
    AssertEquals(testWindow2, focusedWindow);
    CloseWindow(testWindow1);
    CloseWindow(testWindow2);
end;
procedure TIntegrationTests.TestWindowXNamedIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    MoveWindowTo("Test Window", 100, 200);
    AssertEquals(100, WindowX("Test Window"));
    CloseWindow("Test Window");
end;
procedure TIntegrationTests.TestWindowXIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    AssertTrue(WindowX(testWindow) > -1);
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestWindowYNamedIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    MoveWindowTo("Test Window", 100, 200);
    testWindowY := WindowY("Test Window");
    AssertEquals(200, testWindowY);
    CloseWindow("Test Window");
end;
procedure TIntegrationTests.TestWindowYIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    MoveWindowTo(testWindow, 100, 200);
    AssertEquals(200, WindowY(testWindow));
    CloseWindow(testWindow);
end;
end;

procedure RegisterTests;
begin
TestFramework.RegisterTest(TIntegrationTests.Suite);
end;
