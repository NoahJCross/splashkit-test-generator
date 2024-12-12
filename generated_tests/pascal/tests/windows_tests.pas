uses SplashKit, TestFramework

type
TTestWindows = class(TTestCase)
protected
procedure TIntegrationTests.TestClearWindowIntegration;
begin
    window := OpenWindow("Test Window", 800, 600);
    color := ColorBlack();
    ClearWindow(window, color);
    RefreshWindow(window);
    pixel := GetPixel(PointAt(0, 0));
    AssertEquals(color, pixel);
    CloseWindow(window);
end;
procedure TIntegrationTests.TestCloseAllWindowsIntegration;
begin
    window1 := OpenWindow("Test Window 1", 800, 600);
    window2 := OpenWindow("Test Window 2", 800, 600);
    CloseAllWindows();
    AssertFalse(HasWindow("Test Window 1"));
    AssertFalse(HasWindow("Test Window 2"));
end;
procedure TIntegrationTests.TestCloseCurrentWindowIntegration;
begin
    window := OpenWindow("Test Window", 800, 600);
    SetCurrentWindow(window);
    CloseCurrentWindow();
    AssertFalse(HasWindow("Test Window"));
    AssertNull(CurrentWindow());
end;
procedure TIntegrationTests.TestCloseWindowNamedIntegration;
begin
    window := OpenWindow("Test Window", 800, 600);
    AssertTrue(HasWindow("Test Window"));
    CloseWindow("Test Window");
    AssertFalse(HasWindow("Test Window"));
end;
procedure TIntegrationTests.TestCloseWindowIntegration;
begin
    window := OpenWindow("Test Window", 800, 600);
    windowName := WindowCaption(window);
    CloseWindow(window);
    AssertFalse(HasWindow(windowName));
    AssertFalse(WindowHasFocus(window));
end;
procedure TIntegrationTests.TestCurrentWindowIntegration;
begin
    window1 := OpenWindow("Test Window 1", 800, 600);
    window2 := OpenWindow("Test Window 2", 800, 600);
    SetCurrentWindow(window2);
    AssertEquals(window2, CurrentWindow());
    AssertTrue(IsCurrentWindow(window2));
    AssertFalse(IsCurrentWindow(window1));
    CloseAllWindows();
end;
procedure TIntegrationTests.TestCurrentWindowHasBorderIntegration;
begin
    window := OpenWindow("Test Window", 800, 600);
    SetCurrentWindow(window);
    AssertTrue(CurrentWindowHasBorder());
    CurrentWindowToggleBorder();
    AssertFalse(CurrentWindowHasBorder());
    CloseWindow(window);
end;
procedure TIntegrationTests.TestCurrentWindowHeightIntegration;
begin
    window := OpenWindow("Test Window", 800, 600);
    SetCurrentWindow(window);
    AssertEquals(600, CurrentWindowHeight());
    ResizeCurrentWindow(800, 400);
    AssertEquals(400, CurrentWindowHeight());
    CloseWindow(window);
end;
procedure TIntegrationTests.TestCurrentWindowIsFullscreenIntegration;
begin
    window := OpenWindow("Test Window", 800, 600);
    SetCurrentWindow(window);
    AssertFalse(CurrentWindowIsFullscreen());
    CurrentWindowToggleFullscreen();
    AssertTrue(CurrentWindowIsFullscreen());
    CloseWindow(window);
end;
procedure TIntegrationTests.TestCurrentWindowPositionIntegration;
begin
    window := OpenWindow("Test Window", 800, 600);
    SetCurrentWindow(window);
    MoveCurrentWindowTo(100, 200);
    position := CurrentWindowPosition();
    AssertEquals(100, position.X);
    AssertEquals(200, position.Y);
    CloseWindow(window);
end;
procedure TIntegrationTests.TestCurrentWindowToggleBorderIntegration;
begin
    window := OpenWindow("Test Window", 800, 600);
    SetCurrentWindow(window);
    initialBorder := CurrentWindowHasBorder();
    CurrentWindowToggleBorder();
    AssertNotEquals(initialBorder, CurrentWindowHasBorder());
    CloseWindow(window);
end;
procedure TIntegrationTests.TestCurrentWindowToggleFullscreenIntegration;
begin
    window := OpenWindow("Test Window", 800, 600);
    SetCurrentWindow(window);
    initialFullscreen := CurrentWindowIsFullscreen();
    CurrentWindowToggleFullscreen();
    AssertNotEquals(initialFullscreen, CurrentWindowIsFullscreen());
    CloseWindow(window);
end;
procedure TIntegrationTests.TestCurrentWindowWidthIntegration;
begin
    window := OpenWindow("Test Window", 800, 600);
    SetCurrentWindow(window);
    AssertEquals(800, CurrentWindowWidth());
    ResizeCurrentWindow(400, 600);
    AssertEquals(400, CurrentWindowWidth());
    CloseWindow(window);
end;
procedure TIntegrationTests.TestCurrentWindowXIntegration;
begin
    window := OpenWindow("Test Window", 800, 600);
    SetCurrentWindow(window);
    MoveCurrentWindowTo(100, 200);
    AssertEquals(100, CurrentWindowX());
    MoveCurrentWindowTo(300, 200);
    AssertEquals(300, CurrentWindowX());
    CloseWindow(window);
end;
procedure TIntegrationTests.TestCurrentWindowYIntegration;
begin
    window := OpenWindow("Test Window", 800, 600);
    SetCurrentWindow(window);
    MoveCurrentWindowTo(0, 100);
    ProcessEvents();
    AssertEquals(100, CurrentWindowY());
    CloseWindow(window);
end;
procedure TIntegrationTests.TestHasWindowIntegration;
begin
    window := OpenWindow("Test Window", 800, 600);
    AssertTrue(HasWindow("Test Window"));
    AssertTrue(HasWindow(WindowCaption(window)));
    CloseWindow(window);
    AssertFalse(HasWindow("Test Window"));
end;
procedure TIntegrationTests.TestIsCurrentWindowIntegration;
begin
    window1 := OpenWindow("Test Window 1", 800, 600);
    window2 := OpenWindow("Test Window 2", 800, 600);
    SetCurrentWindow(window1);
    AssertTrue(IsCurrentWindow(window1));
    AssertFalse(IsCurrentWindow(window2));
    CloseAllWindows();
end;
procedure TIntegrationTests.TestMoveCurrentWindowToIntegration;
begin
    window := OpenWindow("Test Window", 800, 600);
    SetCurrentWindow(window);
    MoveCurrentWindowTo(100, 200);
    ProcessEvents();
    AssertEquals(100, CurrentWindowX());
    AssertEquals(200, CurrentWindowY());
    CloseWindow(window);
end;
procedure TIntegrationTests.TestMoveWindowToNamedIntegration;
begin
    window := OpenWindow("Test Window", 800, 600);
    MoveWindowTo("Test Window", 150, 250);
    ProcessEvents();
    AssertEquals(150, WindowX("Test Window"));
    AssertEquals(250, WindowY("Test Window"));
    CloseWindow(window);
end;
procedure TIntegrationTests.TestMoveWindowToIntegration;
begin
    window := OpenWindow("Test Window", 800, 600);
    MoveWindowTo(window, 200, 300);
    ProcessEvents();
    AssertEquals(200, WindowX(window));
    AssertEquals(300, WindowY(window));
    CloseWindow(window);
end;
procedure TIntegrationTests.TestOpenWindowIntegration;
begin
    window := OpenWindow("Test Window", 800, 600);
    AssertNotNull(window);
    AssertEquals("Test Window", WindowCaption(window));
    AssertEquals(800, WindowWidth(window));
    AssertEquals(600, WindowHeight(window));
    CloseWindow(window);
end;
procedure TIntegrationTests.TestRefreshWindowIntegration;
begin
    window := OpenWindow("Test Window", 800, 600);
    ClearWindow(window, ColorWhite());
    DrawCircle(ColorBlack(), 400, 300, 50);
    RefreshWindow(window);
    pixel := GetPixel(PointAt(400, 300));
    AssertEquals(ColorBlack(), pixel);
    CloseWindow(window);
end;
procedure TIntegrationTests.TestRefreshWindowWithTargetFpsIntegration;
begin
    window := OpenWindow("Test Window", 800, 600);
    RefreshWindow(window, 60);
    CloseWindow(window);
end;
procedure TIntegrationTests.TestResizeCurrentWindowIntegration;
begin
    window := OpenWindow("Test Window", 800, 600);
    SetCurrentWindow(window);
    ResizeCurrentWindow(1024, 768);
    ProcessEvents();
    AssertEquals(1024, WindowWidth(window));
    AssertEquals(768, WindowHeight(window));
    CloseWindow(window);
end;
procedure TIntegrationTests.TestResizeWindowIntegration;
begin
    window := OpenWindow("Test Window", 800, 600);
    ResizeWindow(window, 1024, 768);
    ProcessEvents();
    AssertEquals(1024, WindowWidth(window));
    AssertEquals(768, WindowHeight(window));
    CloseWindow(window);
end;
procedure TIntegrationTests.TestSetCurrentWindowNamedIntegration;
begin
    window1 := OpenWindow("Test Window 1", 800, 600);
    window2 := OpenWindow("Test Window 2", 800, 600);
    SetCurrentWindow("Test Window 2");
    AssertEquals(window2, CurrentWindow());
    CloseAllWindows();
end;
procedure TIntegrationTests.TestSetCurrentWindowIntegration;
begin
    window1 := OpenWindow("Test Window 1", 800, 600);
    window2 := OpenWindow("Test Window 2", 800, 600);
    SetCurrentWindow(window2);
    AssertEquals(window2, CurrentWindow());
    CloseAllWindows();
end;
procedure TIntegrationTests.TestWindowCaptionIntegration;
begin
    window := OpenWindow("Test Window", 800, 600);
    AssertEquals("Test Window", WindowCaption(window));
    CloseWindow(window);
end;
procedure TIntegrationTests.TestWindowCloseRequestedNamedIntegration;
begin
    window := OpenWindow("Test Window", 800, 600);
    ProcessEvents();
    AssertFalse(WindowCloseRequested("Test Window"));
    while WindowCloseRequested("Test Window") = false do
        ProcessEvents();
    end;
    AssertTrue(WindowCloseRequested("Test Window"));
    CloseWindow(window);
end;
procedure TIntegrationTests.TestWindowCloseRequestedIntegration;
begin
    window := OpenWindow("Test Window", 800, 600);
    ProcessEvents();
    AssertFalse(WindowCloseRequested(window));
    while WindowCloseRequested(window) = false do
        ProcessEvents();
    end;
    AssertTrue(WindowCloseRequested(window));
    CloseWindow(window);
end;
procedure TIntegrationTests.TestWindowHasBorderNamedIntegration;
begin
    window := OpenWindow("Test Window", 800, 600);
    AssertTrue(WindowHasBorder("Test Window"));
    WindowToggleBorder("Test Window");
    ProcessEvents();
    AssertFalse(WindowHasBorder("Test Window"));
    CloseWindow(window);
end;
procedure TIntegrationTests.TestWindowHasBorderIntegration;
begin
    window := OpenWindow("Test Window", 800, 600);
    AssertTrue(WindowHasBorder(window));
    WindowToggleBorder(window);
    ProcessEvents();
    AssertFalse(WindowHasBorder(window));
    CloseWindow(window);
end;
procedure TIntegrationTests.TestWindowHasFocusIntegration;
begin
    window1 := OpenWindow("Test Window 1", 800, 600);
    window2 := OpenWindow("Test Window 2", 800, 600);
    ProcessEvents();
    AssertTrue(WindowHasFocus(window2));
    AssertFalse(WindowHasFocus(window1));
    CloseAllWindows();
end;
procedure TIntegrationTests.TestWindowHeightNamedIntegration;
begin
    window := OpenWindow("Test Window", 800, 600);
    AssertEquals(600, WindowHeight("Test Window"));
    ResizeWindow(window, 800, 400);
    ProcessEvents();
    AssertEquals(400, WindowHeight("Test Window"));
    CloseWindow(window);
end;
procedure TIntegrationTests.TestWindowHeightIntegration;
begin
    window := OpenWindow("Test Window", 800, 600);
    AssertEquals(600, WindowHeight(window));
    ResizeWindow(window, 800, 400);
    ProcessEvents();
    AssertEquals(400, WindowHeight(window));
    CloseWindow(window);
end;
procedure TIntegrationTests.TestWindowIsFullscreenNamedIntegration;
begin
    window := OpenWindow("Test Window", 800, 600);
    AssertFalse(WindowIsFullscreen("Test Window"));
    WindowToggleFullscreen("Test Window");
    ProcessEvents();
    AssertTrue(WindowIsFullscreen("Test Window"));
    CloseWindow(window);
end;
procedure TIntegrationTests.TestWindowIsFullscreenIntegration;
begin
    window := OpenWindow("Test Window", 800, 600);
    AssertFalse(WindowIsFullscreen(window));
    WindowToggleFullscreen(window);
    ProcessEvents();
    AssertTrue(WindowIsFullscreen(window));
    CloseWindow(window);
end;
procedure TIntegrationTests.TestWindowNamedIntegration;
begin
    window := OpenWindow("Test Window", 800, 600);
    namedWindow := WindowNamed("Test Window");
    AssertEquals(window, namedWindow);
    AssertEquals(WindowCaption(window), WindowCaption(namedWindow));
    CloseWindow(window);
end;
procedure TIntegrationTests.TestWindowPositionNamedIntegration;
begin
    window := OpenWindow("Test Window", 800, 600);
    MoveWindowTo("Test Window", 100, 200);
    ProcessEvents();
    position := WindowPosition("Test Window");
    AssertEquals(100, position.X);
    AssertEquals(200, position.Y);
    CloseWindow(window);
end;
procedure TIntegrationTests.TestWindowPositionIntegration;
begin
    window := OpenWindow("Test Window", 800, 600);
    MoveWindowTo(window, 100, 200);
    ProcessEvents();
    position := WindowPosition(window);
    AssertEquals(100, position.X);
    AssertEquals(200, position.Y);
    CloseWindow(window);
end;
procedure TIntegrationTests.TestWindowSetIconIntegration;
begin
    window := OpenWindow("Test Window", 800, 600);
    icon := CreateBitmap("test_icon", 32, 32);
    ClearBitmap(icon, ColorWhite());
    WindowSetIcon(window, icon);
    ProcessEvents();
    FreeBitmap(icon);
    CloseWindow(window);
end;
procedure TIntegrationTests.TestWindowToggleBorderNamedIntegration;
begin
    window := OpenWindow("Test Window", 800, 600);
    AssertTrue(WindowHasBorder("Test Window"));
    WindowToggleBorder("Test Window");
    ProcessEvents();
    AssertFalse(WindowHasBorder("Test Window"));
    CloseWindow(window);
end;
procedure TIntegrationTests.TestWindowToggleBorderIntegration;
begin
    window := OpenWindow("Test Window", 800, 600);
    AssertTrue(WindowHasBorder(window));
    WindowToggleBorder(window);
    ProcessEvents();
    AssertFalse(WindowHasBorder(window));
    CloseWindow(window);
end;
procedure TIntegrationTests.TestWindowToggleFullscreenNamedIntegration;
begin
    window := OpenWindow("Test Window", 800, 600);
    AssertFalse(WindowIsFullscreen("Test Window"));
    WindowToggleFullscreen("Test Window");
    ProcessEvents();
    AssertTrue(WindowIsFullscreen("Test Window"));
    CloseWindow(window);
end;
procedure TIntegrationTests.TestWindowToggleFullscreenIntegration;
begin
    window := OpenWindow("Test Window", 800, 600);
    AssertFalse(WindowIsFullscreen(window));
    WindowToggleFullscreen(window);
    ProcessEvents();
    AssertTrue(WindowIsFullscreen(window));
    CloseWindow(window);
end;
procedure TIntegrationTests.TestWindowWidthNamedIntegration;
begin
    window := OpenWindow("Test Window", 800, 600);
    AssertEquals(800, WindowWidth("Test Window"));
    ResizeWindow(window, 1024, 600);
    ProcessEvents();
    AssertEquals(1024, WindowWidth("Test Window"));
    CloseWindow(window);
end;
procedure TIntegrationTests.TestWindowWidthIntegration;
begin
    window := OpenWindow("Test Window", 800, 600);
    AssertEquals(800, WindowWidth(window));
    ResizeWindow(window, 1024, 600);
    ProcessEvents();
    AssertEquals(1024, WindowWidth(window));
    CloseWindow(window);
end;
procedure TIntegrationTests.TestWindowWithFocusIntegration;
begin
    window1 := OpenWindow("Test Window 1", 800, 600);
    window2 := OpenWindow("Test Window 2", 800, 600);
    ProcessEvents();
    AssertEquals(window2, WindowWithFocus());
    SetCurrentWindow(window1);
    ProcessEvents();
    AssertEquals(window1, WindowWithFocus());
    CloseAllWindows();
end;
procedure TIntegrationTests.TestWindowXNamedIntegration;
begin
    window := OpenWindow("Test Window", 800, 600);
    MoveWindowTo("Test Window", 100, 200);
    ProcessEvents();
    AssertEquals(100, WindowX("Test Window"));
    MoveWindowTo("Test Window", 300, 200);
    ProcessEvents();
    AssertEquals(300, WindowX("Test Window"));
    CloseWindow(window);
end;
procedure TIntegrationTests.TestWindowXIntegration;
begin
    window := OpenWindow("Test Window", 800, 600);
    MoveWindowTo(window, 100, 200);
    ProcessEvents();
    AssertEquals(100, WindowX(window));
    MoveWindowTo(window, 300, 200);
    ProcessEvents();
    AssertEquals(300, WindowX(window));
    CloseWindow(window);
end;
procedure TIntegrationTests.TestWindowYNamedIntegration;
begin
    window := OpenWindow("Test Window", 800, 600);
    MoveWindowTo("Test Window", 100, 200);
    ProcessEvents();
    AssertEquals(200, WindowY("Test Window"));
    MoveWindowTo("Test Window", 100, 400);
    ProcessEvents();
    AssertEquals(400, WindowY("Test Window"));
    CloseWindow(window);
end;
procedure TIntegrationTests.TestWindowYIntegration;
begin
    window := OpenWindow("Test Window", 800, 600);
    MoveWindowTo(window, 100, 200);
    ProcessEvents();
    AssertEquals(200, WindowY(window));
    MoveWindowTo(window, 100, 400);
    ProcessEvents();
    AssertEquals(400, WindowY(window));
    CloseWindow(window);
end;
end;

procedure RegisterTests;
begin
#<Proc:0x00007f7a8f3c6228 /mnt/c/Users/Noahc/Documents/.Year 2 Semester 3/Team Project (A)/Github Repo/splashkit_test_generator/test_generator/config/languages/pascal_config.rb:117 (lambda)>
end;
