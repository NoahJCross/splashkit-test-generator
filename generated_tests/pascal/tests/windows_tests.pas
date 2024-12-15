uses SplashKit, TestFramework

type
TTestWindows = class(TTestCase)
protected
procedure TIntegrationTests.TestClearWindowIntegration;
begin
    testWindow := OpenWindow('Test Window', 800, 600);
    color := ColorBlack();
    ClearWindow(testWindow, color);
    RefreshWindow(testWindow);
    pixel := GetPixel(PointAt(0.0, 0.0));
    AssertEquals(color, pixel);
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestCloseAllWindowsIntegration;
begin
    OpenWindow('Test Window 1', 800, 600);
    OpenWindow('Test Window 2', 800, 600);
    CloseAllWindows();
    AssertFalse(HasWindow('Test Window 1'));
    AssertFalse(HasWindow('Test Window 2'));
end;
procedure TIntegrationTests.TestCloseCurrentWindowIntegration;
begin
    testWindow := OpenWindow('Test Window', 800, 600);
    SetCurrentWindow(testWindow);
    CloseCurrentWindow();
    AssertFalse(HasWindow('Test Window'));
    AssertNull(CurrentWindow());
end;
procedure TIntegrationTests.TestCloseWindowNamedIntegration;
begin
    OpenWindow('Test Window', 800, 600);
    AssertTrue(HasWindow('Test Window'));
    CloseWindow('Test Window');
    AssertFalse(HasWindow('Test Window'));
end;
procedure TIntegrationTests.TestCloseWindowIntegration;
begin
    testWindow := OpenWindow('Test Window', 800, 600);
    windowName := WindowCaption(testWindow);
    CloseWindow(testWindow);
    AssertFalse(HasWindow(windowName));
    AssertFalse(WindowHasFocus(testWindow));
end;
procedure TIntegrationTests.TestCurrentWindowIntegration;
begin
    window1 := OpenWindow('Test Window 1', 800, 600);
    window2 := OpenWindow('Test Window 2', 800, 600);
    SetCurrentWindow(window2);
    AssertEquals(window2, CurrentWindow());
    AssertTrue(IsCurrentWindow(window2));
    AssertFalse(IsCurrentWindow(window1));
    CloseAllWindows();
end;
procedure TIntegrationTests.TestCurrentWindowHasBorderIntegration;
begin
    testWindow := OpenWindow('Test Window', 800, 600);
    SetCurrentWindow(testWindow);
    AssertTrue(CurrentWindowHasBorder());
    CurrentWindowToggleBorder();
    AssertFalse(CurrentWindowHasBorder());
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestCurrentWindowHeightIntegration;
begin
    testWindow := OpenWindow('Test Window', 800, 600);
    SetCurrentWindow(testWindow);
    AssertEquals(600, CurrentWindowHeight());
    ResizeCurrentWindow(800, 400);
    AssertEquals(400, CurrentWindowHeight());
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestCurrentWindowIsFullscreenIntegration;
begin
    testWindow := OpenWindow('Test Window', 800, 600);
    SetCurrentWindow(testWindow);
    AssertFalse(CurrentWindowIsFullscreen());
    CurrentWindowToggleFullscreen();
    AssertTrue(CurrentWindowIsFullscreen());
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestCurrentWindowPositionIntegration;
begin
    testWindow := OpenWindow('Test Window', 800, 600);
    SetCurrentWindow(testWindow);
    MoveCurrentWindowTo(100, 200);
    position := CurrentWindowPosition();
    AssertEquals(100.0, position.x);
    AssertEquals(200.0, position.y);
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestCurrentWindowToggleBorderIntegration;
begin
    testWindow := OpenWindow('Test Window', 800, 600);
    SetCurrentWindow(testWindow);
    initialBorder := CurrentWindowHasBorder();
    CurrentWindowToggleBorder();
    AssertNotEquals(initialBorder, CurrentWindowHasBorder());
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestCurrentWindowToggleFullscreenIntegration;
begin
    testWindow := OpenWindow('Test Window', 800, 600);
    SetCurrentWindow(testWindow);
    initialFullscreen := CurrentWindowIsFullscreen();
    CurrentWindowToggleFullscreen();
    AssertNotEquals(initialFullscreen, CurrentWindowIsFullscreen());
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestCurrentWindowWidthIntegration;
begin
    testWindow := OpenWindow('Test Window', 800, 600);
    SetCurrentWindow(testWindow);
    AssertEquals(800, CurrentWindowWidth());
    ResizeCurrentWindow(400, 600);
    AssertEquals(400, CurrentWindowWidth());
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestCurrentWindowXIntegration;
begin
    testWindow := OpenWindow('Test Window', 800, 600);
    SetCurrentWindow(testWindow);
    MoveCurrentWindowTo(100, 200);
    AssertEquals(100, CurrentWindowX());
    MoveCurrentWindowTo(300, 200);
    AssertEquals(300, CurrentWindowX());
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestCurrentWindowYIntegration;
begin
    testWindow := OpenWindow('Test Window', 800, 600);
    SetCurrentWindow(testWindow);
    MoveCurrentWindowTo(0, 100);
    ProcessEvents();
    AssertEquals(100, CurrentWindowY());
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestHasWindowIntegration;
begin
    testWindow := OpenWindow('Test Window', 800, 600);
    AssertTrue(HasWindow('Test Window'));
    AssertTrue(HasWindow(WindowCaption(testWindow)));
    CloseWindow(testWindow);
    AssertFalse(HasWindow('Test Window'));
end;
procedure TIntegrationTests.TestIsCurrentWindowIntegration;
begin
    window1 := OpenWindow('Test Window 1', 800, 600);
    window2 := OpenWindow('Test Window 2', 800, 600);
    SetCurrentWindow(window1);
    AssertTrue(IsCurrentWindow(window1));
    AssertFalse(IsCurrentWindow(window2));
    CloseAllWindows();
end;
procedure TIntegrationTests.TestMoveCurrentWindowToIntegration;
begin
    testWindow := OpenWindow('Test Window', 800, 600);
    SetCurrentWindow(testWindow);
    MoveCurrentWindowTo(100, 200);
    ProcessEvents();
    AssertEquals(100, CurrentWindowX());
    AssertEquals(200, CurrentWindowY());
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestMoveWindowToNamedIntegration;
begin
    testWindow := OpenWindow('Test Window', 800, 600);
    MoveWindowTo('Test Window', 150, 250);
    ProcessEvents();
    AssertEquals(150, WindowX('Test Window'));
    AssertEquals(250, WindowY('Test Window'));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestMoveWindowToIntegration;
begin
    testWindow := OpenWindow('Test Window', 800, 600);
    MoveWindowTo(testWindow, 200, 300);
    ProcessEvents();
    AssertEquals(200, WindowX(testWindow));
    AssertEquals(300, WindowY(testWindow));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestOpenWindowIntegration;
begin
    testWindow := OpenWindow('Test Window', 800, 600);
    AssertNotNull(testWindow);
    AssertEquals('Test Window', WindowCaption(testWindow));
    AssertEquals(800, WindowWidth(testWindow));
    AssertEquals(600, WindowHeight(testWindow));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestRefreshWindowIntegration;
begin
    testWindow := OpenWindow('Test Window', 800, 600);
    ClearWindow(testWindow, ColorWhite());
    DrawCircle(ColorBlack(), 400.0, 300.0, 50.0);
    RefreshWindow(testWindow);
    pixel := GetPixel(PointAt(400.0, 300.0));
    AssertEquals(ColorBlack(), pixel);
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestRefreshWindowWithTargetFpsIntegration;
begin
    testWindow := OpenWindow('Test Window', 800, 600);
    RefreshWindow(testWindow, Cardinal(60));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestResizeCurrentWindowIntegration;
begin
    testWindow := OpenWindow('Test Window', 800, 600);
    SetCurrentWindow(testWindow);
    ResizeCurrentWindow(1024, 768);
    ProcessEvents();
    AssertEquals(1024, WindowWidth(testWindow));
    AssertEquals(768, WindowHeight(testWindow));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestResizeWindowIntegration;
begin
    testWindow := OpenWindow('Test Window', 800, 600);
    ResizeWindow(testWindow, 1024, 768);
    ProcessEvents();
    AssertEquals(1024, WindowWidth(testWindow));
    AssertEquals(768, WindowHeight(testWindow));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestSetCurrentWindowNamedIntegration;
begin
    OpenWindow('Test Window 1', 800, 600);
    window2 := OpenWindow('Test Window 2', 800, 600);
    SetCurrentWindow('Test Window 2');
    AssertEquals(window2, CurrentWindow());
    CloseAllWindows();
end;
procedure TIntegrationTests.TestSetCurrentWindowIntegration;
begin
    OpenWindow('Test Window 1', 800, 600);
    window2 := OpenWindow('Test Window 2', 800, 600);
    SetCurrentWindow(window2);
    AssertEquals(window2, CurrentWindow());
    CloseAllWindows();
end;
procedure TIntegrationTests.TestWindowCaptionIntegration;
begin
    testWindow := OpenWindow('Test Window', 800, 600);
    AssertEquals('Test Window', WindowCaption(testWindow));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestWindowCloseRequestedNamedIntegration;
begin
    testWindow := OpenWindow('Test Window', 800, 600);
    ProcessEvents();
    AssertFalse(WindowCloseRequested('Test Window'));
    while WindowCloseRequested('Test Window') = false do
        ProcessEvents();
    end;
    AssertTrue(WindowCloseRequested('Test Window'));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestWindowCloseRequestedIntegration;
begin
    testWindow := OpenWindow('Test Window', 800, 600);
    ProcessEvents();
    AssertFalse(WindowCloseRequested(testWindow));
    while WindowCloseRequested(testWindow) = false do
        ProcessEvents();
    end;
    AssertTrue(WindowCloseRequested(testWindow));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestWindowHasBorderNamedIntegration;
begin
    testWindow := OpenWindow('Test Window', 800, 600);
    AssertTrue(WindowHasBorder('Test Window'));
    WindowToggleBorder('Test Window');
    ProcessEvents();
    AssertFalse(WindowHasBorder('Test Window'));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestWindowHasBorderIntegration;
begin
    testWindow := OpenWindow('Test Window', 800, 600);
    AssertTrue(WindowHasBorder(testWindow));
    WindowToggleBorder(testWindow);
    ProcessEvents();
    AssertFalse(WindowHasBorder(testWindow));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestWindowHasFocusIntegration;
begin
    window1 := OpenWindow('Test Window 1', 800, 600);
    window2 := OpenWindow('Test Window 2', 800, 600);
    ProcessEvents();
    AssertTrue(WindowHasFocus(window2));
    AssertFalse(WindowHasFocus(window1));
    CloseAllWindows();
end;
procedure TIntegrationTests.TestWindowHeightNamedIntegration;
begin
    testWindow := OpenWindow('Test Window', 800, 600);
    AssertEquals(600, WindowHeight('Test Window'));
    ResizeWindow(testWindow, 800, 400);
    ProcessEvents();
    AssertEquals(400, WindowHeight('Test Window'));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestWindowHeightIntegration;
begin
    testWindow := OpenWindow('Test Window', 800, 600);
    AssertEquals(600, WindowHeight(testWindow));
    ResizeWindow(testWindow, 800, 400);
    ProcessEvents();
    AssertEquals(400, WindowHeight(testWindow));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestWindowIsFullscreenNamedIntegration;
begin
    testWindow := OpenWindow('Test Window', 800, 600);
    AssertFalse(WindowIsFullscreen('Test Window'));
    WindowToggleFullscreen('Test Window');
    ProcessEvents();
    AssertTrue(WindowIsFullscreen('Test Window'));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestWindowIsFullscreenIntegration;
begin
    testWindow := OpenWindow('Test Window', 800, 600);
    AssertFalse(WindowIsFullscreen(testWindow));
    WindowToggleFullscreen(testWindow);
    ProcessEvents();
    AssertTrue(WindowIsFullscreen(testWindow));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestWindowNamedIntegration;
begin
    testWindow := OpenWindow('Test Window', 800, 600);
    namedWindow := WindowNamed('Test Window');
    AssertEquals(testWindow, namedWindow);
    AssertEquals(WindowCaption(testWindow), WindowCaption(namedWindow));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestWindowPositionNamedIntegration;
begin
    testWindow := OpenWindow('Test Window', 800, 600);
    MoveWindowTo('Test Window', 100, 200);
    ProcessEvents();
    position := WindowPosition('Test Window');
    AssertEquals(100.0, position.x);
    AssertEquals(200.0, position.y);
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestWindowPositionIntegration;
begin
    testWindow := OpenWindow('Test Window', 800, 600);
    MoveWindowTo(testWindow, 100, 200);
    ProcessEvents();
    position := WindowPosition(testWindow);
    AssertEquals(100.0, position.x);
    AssertEquals(200.0, position.y);
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestWindowSetIconIntegration;
begin
    testWindow := OpenWindow('Test Window', 800, 600);
    icon := CreateBitmap('test_icon', 32, 32);
    ClearBitmap(icon, ColorWhite());
    WindowSetIcon(testWindow, icon);
    ProcessEvents();
    FreeBitmap(icon);
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestWindowToggleBorderNamedIntegration;
begin
    testWindow := OpenWindow('Test Window', 800, 600);
    AssertTrue(WindowHasBorder('Test Window'));
    WindowToggleBorder('Test Window');
    ProcessEvents();
    AssertFalse(WindowHasBorder('Test Window'));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestWindowToggleBorderIntegration;
begin
    testWindow := OpenWindow('Test Window', 800, 600);
    AssertTrue(WindowHasBorder(testWindow));
    WindowToggleBorder(testWindow);
    ProcessEvents();
    AssertFalse(WindowHasBorder(testWindow));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestWindowToggleFullscreenNamedIntegration;
begin
    testWindow := OpenWindow('Test Window', 800, 600);
    AssertFalse(WindowIsFullscreen('Test Window'));
    WindowToggleFullscreen('Test Window');
    ProcessEvents();
    AssertTrue(WindowIsFullscreen('Test Window'));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestWindowToggleFullscreenIntegration;
begin
    testWindow := OpenWindow('Test Window', 800, 600);
    AssertFalse(WindowIsFullscreen(testWindow));
    WindowToggleFullscreen(testWindow);
    ProcessEvents();
    AssertTrue(WindowIsFullscreen(testWindow));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestWindowWidthNamedIntegration;
begin
    testWindow := OpenWindow('Test Window', 800, 600);
    AssertEquals(800, WindowWidth('Test Window'));
    ResizeWindow(testWindow, 1024, 600);
    ProcessEvents();
    AssertEquals(1024, WindowWidth('Test Window'));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestWindowWidthIntegration;
begin
    testWindow := OpenWindow('Test Window', 800, 600);
    AssertEquals(800, WindowWidth(testWindow));
    ResizeWindow(testWindow, 1024, 600);
    ProcessEvents();
    AssertEquals(1024, WindowWidth(testWindow));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestWindowWithFocusIntegration;
begin
    window1 := OpenWindow('Test Window 1', 800, 600);
    window2 := OpenWindow('Test Window 2', 800, 600);
    ProcessEvents();
    AssertEquals(window2, WindowWithFocus());
    SetCurrentWindow(window1);
    ProcessEvents();
    AssertEquals(window1, WindowWithFocus());
    CloseAllWindows();
end;
procedure TIntegrationTests.TestWindowXNamedIntegration;
begin
    testWindow := OpenWindow('Test Window', 800, 600);
    MoveWindowTo('Test Window', 100, 200);
    ProcessEvents();
    AssertEquals(100, WindowX('Test Window'));
    MoveWindowTo('Test Window', 300, 200);
    ProcessEvents();
    AssertEquals(300, WindowX('Test Window'));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestWindowXIntegration;
begin
    testWindow := OpenWindow('Test Window', 800, 600);
    MoveWindowTo(testWindow, 100, 200);
    ProcessEvents();
    AssertEquals(100, WindowX(testWindow));
    MoveWindowTo(testWindow, 300, 200);
    ProcessEvents();
    AssertEquals(300, WindowX(testWindow));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestWindowYNamedIntegration;
begin
    testWindow := OpenWindow('Test Window', 800, 600);
    MoveWindowTo('Test Window', 100, 200);
    ProcessEvents();
    AssertEquals(200, WindowY('Test Window'));
    MoveWindowTo('Test Window', 100, 400);
    ProcessEvents();
    AssertEquals(400, WindowY('Test Window'));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestWindowYIntegration;
begin
    testWindow := OpenWindow('Test Window', 800, 600);
    MoveWindowTo(testWindow, 100, 200);
    ProcessEvents();
    AssertEquals(200, WindowY(testWindow));
    MoveWindowTo(testWindow, 100, 400);
    ProcessEvents();
    AssertEquals(400, WindowY(testWindow));
    CloseWindow(testWindow);
end;
end;

procedure RegisterTests;
begin
#<Proc:0x00007f20a9d04780 /mnt/c/Users/Noahc/Documents/.Year 2 Semester 3/Team Project (A)/Github Repo/splashkit_test_generator/test_generator/config/languages/pascal_config.rb:128 (lambda)>
end;
