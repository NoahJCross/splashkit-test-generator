using Xunit;
using static SplashKitSDK.SplashKit;

namespace SplashKitTests
{
    public class TestWindows
    {
        [Fact]
        public void TestClearWindowIntegration()
        {
            var window = OpenWindow("Test Window", 800, 600);
            var color = ColorBlack();
            ClearWindow(window, color);
            RefreshWindow(window);
            var pixel = GetPixel(PointAt(0, 0));
            Assert.Equal(color, pixel);
            CloseWindow(window);
        }
        [Fact]
        public void TestCloseAllWindowsIntegration()
        {
            var window1 = OpenWindow("Test Window 1", 800, 600);
            var window2 = OpenWindow("Test Window 2", 800, 600);
            CloseAllWindows();
            Assert.False(HasWindow("Test Window 1"));
            Assert.False(HasWindow("Test Window 2"));
        }
        [Fact]
        public void TestCloseCurrentWindowIntegration()
        {
            var window = OpenWindow("Test Window", 800, 600);
            SetCurrentWindow(window);
            CloseCurrentWindow();
            Assert.False(HasWindow("Test Window"));
            Assert.Null(CurrentWindow());
        }
        [Fact]
        public void TestCloseWindowNamedIntegration()
        {
            var window = OpenWindow("Test Window", 800, 600);
            Assert.True(HasWindow("Test Window"));
            CloseWindowNamed("Test Window");
            Assert.False(HasWindow("Test Window"));
        }
        [Fact]
        public void TestCloseWindowIntegration()
        {
            var window = OpenWindow("Test Window", 800, 600);
            var windowName = WindowCaption(window);
            CloseWindow(window);
            Assert.False(HasWindow(windowName));
            Assert.False(WindowHasFocus(window));
        }
        [Fact]
        public void TestCurrentWindowIntegration()
        {
            var window1 = OpenWindow("Test Window 1", 800, 600);
            var window2 = OpenWindow("Test Window 2", 800, 600);
            SetCurrentWindow(window2);
            Assert.Equal(window2, CurrentWindow());
            Assert.True(IsCurrentWindow(window2));
            Assert.False(IsCurrentWindow(window1));
            CloseAllWindows();
        }
        [Fact]
        public void TestCurrentWindowHasBorderIntegration()
        {
            var window = OpenWindow("Test Window", 800, 600);
            SetCurrentWindow(window);
            Assert.True(CurrentWindowHasBorder());
            CurrentWindowToggleBorder();
            Assert.False(CurrentWindowHasBorder());
            CloseWindow(window);
        }
        [Fact]
        public void TestCurrentWindowHeightIntegration()
        {
            var window = OpenWindow("Test Window", 800, 600);
            SetCurrentWindow(window);
            Assert.Equal(600, CurrentWindowHeight());
            ResizeCurrentWindow(800, 400);
            Assert.Equal(400, CurrentWindowHeight());
            CloseWindow(window);
        }
        [Fact]
        public void TestCurrentWindowIsFullscreenIntegration()
        {
            var window = OpenWindow("Test Window", 800, 600);
            SetCurrentWindow(window);
            Assert.False(CurrentWindowIsFullscreen());
            CurrentWindowToggleFullscreen();
            Assert.True(CurrentWindowIsFullscreen());
            CloseWindow(window);
        }
        [Fact]
        public void TestCurrentWindowPositionIntegration()
        {
            var window = OpenWindow("Test Window", 800, 600);
            SetCurrentWindow(window);
            MoveCurrentWindowTo(100, 200);
            var position = CurrentWindowPosition();
            Assert.Equal(100, position.X);
            Assert.Equal(200, position.Y);
            CloseWindow(window);
        }
        [Fact]
        public void TestCurrentWindowToggleBorderIntegration()
        {
            var window = OpenWindow("Test Window", 800, 600);
            SetCurrentWindow(window);
            var initialBorder = CurrentWindowHasBorder();
            CurrentWindowToggleBorder();
            Assert.NotEqual(initialBorder, CurrentWindowHasBorder());
            CloseWindow(window);
        }
        [Fact]
        public void TestCurrentWindowToggleFullscreenIntegration()
        {
            var window = OpenWindow("Test Window", 800, 600);
            SetCurrentWindow(window);
            var initialFullscreen = CurrentWindowIsFullscreen();
            CurrentWindowToggleFullscreen();
            Assert.NotEqual(initialFullscreen, CurrentWindowIsFullscreen());
            CloseWindow(window);
        }
        [Fact]
        public void TestCurrentWindowWidthIntegration()
        {
            var window = OpenWindow("Test Window", 800, 600);
            SetCurrentWindow(window);
            Assert.Equal(800, CurrentWindowWidth());
            ResizeCurrentWindow(400, 600);
            Assert.Equal(400, CurrentWindowWidth());
            CloseWindow(window);
        }
        [Fact]
        public void TestCurrentWindowXIntegration()
        {
            var window = OpenWindow("Test Window", 800, 600);
            SetCurrentWindow(window);
            MoveCurrentWindowTo(100, 200);
            Assert.Equal(100, CurrentWindowX());
            MoveCurrentWindowTo(300, 200);
            Assert.Equal(300, CurrentWindowX());
            CloseWindow(window);
        }
        [Fact]
        public void TestCurrentWindowYIntegration()
        {
            var window = OpenWindow("Test Window", 800, 600);
            SetCurrentWindow(window);
            MoveCurrentWindowTo(0, 100);
            ProcessEvents();
            Assert.Equal(100, CurrentWindowY());
            CloseWindow(window);
        }
        [Fact]
        public void TestHasWindowIntegration()
        {
            var window = OpenWindow("Test Window", 800, 600);
            Assert.True(HasWindow("Test Window"));
            Assert.True(HasWindow(WindowCaption(window)));
            CloseWindow(window);
            Assert.False(HasWindow("Test Window"));
        }
        [Fact]
        public void TestIsCurrentWindowIntegration()
        {
            var window1 = OpenWindow("Test Window 1", 800, 600);
            var window2 = OpenWindow("Test Window 2", 800, 600);
            SetCurrentWindow(window1);
            Assert.True(IsCurrentWindow(window1));
            Assert.False(IsCurrentWindow(window2));
            CloseAllWindows();
        }
        [Fact]
        public void TestMoveCurrentWindowToIntegration()
        {
            var window = OpenWindow("Test Window", 800, 600);
            SetCurrentWindow(window);
            MoveCurrentWindowTo(100, 200);
            ProcessEvents();
            Assert.Equal(100, CurrentWindowX());
            Assert.Equal(200, CurrentWindowY());
            CloseWindow(window);
        }
        [Fact]
        public void TestMoveWindowToNamedIntegration()
        {
            var window = OpenWindow("Test Window", 800, 600);
            MoveWindowToNamed("Test Window", 150, 250);
            ProcessEvents();
            Assert.Equal(150, WindowX("Test Window"));
            Assert.Equal(250, WindowY("Test Window"));
            CloseWindow(window);
        }
        [Fact]
        public void TestMoveWindowToIntegration()
        {
            var window = OpenWindow("Test Window", 800, 600);
            MoveWindowTo(window, 200, 300);
            ProcessEvents();
            Assert.Equal(200, WindowX(window));
            Assert.Equal(300, WindowY(window));
            CloseWindow(window);
        }
        [Fact]
        public void TestOpenWindowIntegration()
        {
            var window = OpenWindow("Test Window", 800, 600);
            Assert.NotNull(window);
            Assert.Equal("Test Window", WindowCaption(window));
            Assert.Equal(800, WindowWidth(window));
            Assert.Equal(600, WindowHeight(window));
            CloseWindow(window);
        }
        [Fact]
        public void TestRefreshWindowIntegration()
        {
            var window = OpenWindow("Test Window", 800, 600);
            ClearWindow(window, ColorWhite());
            DrawCircle(ColorBlack(), 400, 300, 50);
            RefreshWindow(window);
            var pixel = GetPixel(PointAt(400, 300));
            Assert.Equal(ColorBlack(), pixel);
            CloseWindow(window);
        }
        [Fact]
        public void TestRefreshWindowWithTargetFpsIntegration()
        {
            var window = OpenWindow("Test Window", 800, 600);
            RefreshWindowWithTargetFps(window, 60);
            CloseWindow(window);
        }
        [Fact]
        public void TestResizeCurrentWindowIntegration()
        {
            var window = OpenWindow("Test Window", 800, 600);
            SetCurrentWindow(window);
            ResizeCurrentWindow(1024, 768);
            ProcessEvents();
            Assert.Equal(1024, WindowWidth(window));
            Assert.Equal(768, WindowHeight(window));
            CloseWindow(window);
        }
        [Fact]
        public void TestResizeWindowIntegration()
        {
            var window = OpenWindow("Test Window", 800, 600);
            ResizeWindow(window, 1024, 768);
            ProcessEvents();
            Assert.Equal(1024, WindowWidth(window));
            Assert.Equal(768, WindowHeight(window));
            CloseWindow(window);
        }
        [Fact]
        public void TestSetCurrentWindowNamedIntegration()
        {
            var window1 = OpenWindow("Test Window 1", 800, 600);
            var window2 = OpenWindow("Test Window 2", 800, 600);
            SetCurrentWindowNamed("Test Window 2");
            Assert.Equal(window2, CurrentWindow());
            CloseAllWindows();
        }
        [Fact]
        public void TestSetCurrentWindowIntegration()
        {
            var window1 = OpenWindow("Test Window 1", 800, 600);
            var window2 = OpenWindow("Test Window 2", 800, 600);
            SetCurrentWindow(window2);
            Assert.Equal(window2, CurrentWindow());
            CloseAllWindows();
        }
        [Fact]
        public void TestWindowCaptionIntegration()
        {
            var window = OpenWindow("Test Window", 800, 600);
            Assert.Equal("Test Window", WindowCaption(window));
            CloseWindow(window);
        }
        [Fact]
        public void TestWindowCloseRequestedNamedIntegration()
        {
            var window = OpenWindow("Test Window", 800, 600);
            ProcessEvents();
            Assert.False(WindowCloseRequestedNamed("Test Window"));
            while (!WindowCloseRequestedNamed("Test Window")) {
                ProcessEvents();
            }
            Assert.True(WindowCloseRequestedNamed("Test Window"));
            CloseWindow(window);
        }
        [Fact]
        public void TestWindowCloseRequestedIntegration()
        {
            var window = OpenWindow("Test Window", 800, 600);
            ProcessEvents();
            Assert.False(WindowCloseRequested(window));
            while (!WindowCloseRequested(window)) {
                ProcessEvents();
            }
            Assert.True(WindowCloseRequested(window));
            CloseWindow(window);
        }
        [Fact]
        public void TestWindowHasBorderNamedIntegration()
        {
            var window = OpenWindow("Test Window", 800, 600);
            Assert.True(WindowHasBorderNamed("Test Window"));
            WindowToggleBorder("Test Window");
            ProcessEvents();
            Assert.False(WindowHasBorderNamed("Test Window"));
            CloseWindow(window);
        }
        [Fact]
        public void TestWindowHasBorderIntegration()
        {
            var window = OpenWindow("Test Window", 800, 600);
            Assert.True(WindowHasBorder(window));
            WindowToggleBorder(window);
            ProcessEvents();
            Assert.False(WindowHasBorder(window));
            CloseWindow(window);
        }
        [Fact]
        public void TestWindowHasFocusIntegration()
        {
            var window1 = OpenWindow("Test Window 1", 800, 600);
            var window2 = OpenWindow("Test Window 2", 800, 600);
            ProcessEvents();
            Assert.True(WindowHasFocus(window2));
            Assert.False(WindowHasFocus(window1));
            CloseAllWindows();
        }
        [Fact]
        public void TestWindowHeightNamedIntegration()
        {
            var window = OpenWindow("Test Window", 800, 600);
            Assert.Equal(600, WindowHeightNamed("Test Window"));
            ResizeWindow(window, 800, 400);
            ProcessEvents();
            Assert.Equal(400, WindowHeightNamed("Test Window"));
            CloseWindow(window);
        }
        [Fact]
        public void TestWindowHeightIntegration()
        {
            var window = OpenWindow("Test Window", 800, 600);
            Assert.Equal(600, WindowHeight(window));
            ResizeWindow(window, 800, 400);
            ProcessEvents();
            Assert.Equal(400, WindowHeight(window));
            CloseWindow(window);
        }
        [Fact]
        public void TestWindowIsFullscreenNamedIntegration()
        {
            var window = OpenWindow("Test Window", 800, 600);
            Assert.False(WindowIsFullscreenNamed("Test Window"));
            WindowToggleFullscreen("Test Window");
            ProcessEvents();
            Assert.True(WindowIsFullscreenNamed("Test Window"));
            CloseWindow(window);
        }
        [Fact]
        public void TestWindowIsFullscreenIntegration()
        {
            var window = OpenWindow("Test Window", 800, 600);
            Assert.False(WindowIsFullscreen(window));
            WindowToggleFullscreen(window);
            ProcessEvents();
            Assert.True(WindowIsFullscreen(window));
            CloseWindow(window);
        }
        [Fact]
        public void TestWindowNamedIntegration()
        {
            var window = OpenWindow("Test Window", 800, 600);
            var namedWindow = WindowNamed("Test Window");
            Assert.Equal(window, namedWindow);
            Assert.Equal(WindowCaption(window), WindowCaption(namedWindow));
            CloseWindow(window);
        }
        [Fact]
        public void TestWindowPositionNamedIntegration()
        {
            var window = OpenWindow("Test Window", 800, 600);
            MoveWindowTo("Test Window", 100, 200);
            ProcessEvents();
            var position = WindowPositionNamed("Test Window");
            Assert.Equal(100, position.X);
            Assert.Equal(200, position.Y);
            CloseWindow(window);
        }
        [Fact]
        public void TestWindowPositionIntegration()
        {
            var window = OpenWindow("Test Window", 800, 600);
            MoveWindowTo(window, 100, 200);
            ProcessEvents();
            var position = WindowPosition(window);
            Assert.Equal(100, position.X);
            Assert.Equal(200, position.Y);
            CloseWindow(window);
        }
        [Fact]
        public void TestWindowSetIconIntegration()
        {
            var window = OpenWindow("Test Window", 800, 600);
            var icon = CreateBitmap("test_icon", 32, 32);
            ClearBitmap(icon, ColorWhite());
            WindowSetIcon(window, icon);
            ProcessEvents();
            FreeBitmap(icon);
            CloseWindow(window);
        }
        [Fact]
        public void TestWindowToggleBorderNamedIntegration()
        {
            var window = OpenWindow("Test Window", 800, 600);
            Assert.True(WindowHasBorder("Test Window"));
            WindowToggleBorderNamed("Test Window");
            ProcessEvents();
            Assert.False(WindowHasBorder("Test Window"));
            CloseWindow(window);
        }
        [Fact]
        public void TestWindowToggleBorderIntegration()
        {
            var window = OpenWindow("Test Window", 800, 600);
            Assert.True(WindowHasBorder(window));
            WindowToggleBorder(window);
            ProcessEvents();
            Assert.False(WindowHasBorder(window));
            CloseWindow(window);
        }
        [Fact]
        public void TestWindowToggleFullscreenNamedIntegration()
        {
            var window = OpenWindow("Test Window", 800, 600);
            Assert.False(WindowIsFullscreen("Test Window"));
            WindowToggleFullscreenNamed("Test Window");
            ProcessEvents();
            Assert.True(WindowIsFullscreen("Test Window"));
            CloseWindow(window);
        }
        [Fact]
        public void TestWindowToggleFullscreenIntegration()
        {
            var window = OpenWindow("Test Window", 800, 600);
            Assert.False(WindowIsFullscreen(window));
            WindowToggleFullscreen(window);
            ProcessEvents();
            Assert.True(WindowIsFullscreen(window));
            CloseWindow(window);
        }
        [Fact]
        public void TestWindowWidthNamedIntegration()
        {
            var window = OpenWindow("Test Window", 800, 600);
            Assert.Equal(800, WindowWidthNamed("Test Window"));
            ResizeWindow(window, 1024, 600);
            ProcessEvents();
            Assert.Equal(1024, WindowWidthNamed("Test Window"));
            CloseWindow(window);
        }
        [Fact]
        public void TestWindowWidthIntegration()
        {
            var window = OpenWindow("Test Window", 800, 600);
            Assert.Equal(800, WindowWidth(window));
            ResizeWindow(window, 1024, 600);
            ProcessEvents();
            Assert.Equal(1024, WindowWidth(window));
            CloseWindow(window);
        }
        [Fact]
        public void TestWindowWithFocusIntegration()
        {
            var window1 = OpenWindow("Test Window 1", 800, 600);
            var window2 = OpenWindow("Test Window 2", 800, 600);
            ProcessEvents();
            Assert.Equal(window2, WindowWithFocus());
            SetCurrentWindow(window1);
            ProcessEvents();
            Assert.Equal(window1, WindowWithFocus());
            CloseAllWindows();
        }
        [Fact]
        public void TestWindowXNamedIntegration()
        {
            var window = OpenWindow("Test Window", 800, 600);
            MoveWindowTo("Test Window", 100, 200);
            ProcessEvents();
            Assert.Equal(100, WindowXNamed("Test Window"));
            MoveWindowTo("Test Window", 300, 200);
            ProcessEvents();
            Assert.Equal(300, WindowXNamed("Test Window"));
            CloseWindow(window);
        }
        [Fact]
        public void TestWindowXIntegration()
        {
            var window = OpenWindow("Test Window", 800, 600);
            MoveWindowTo(window, 100, 200);
            ProcessEvents();
            Assert.Equal(100, WindowX(window));
            MoveWindowTo(window, 300, 200);
            ProcessEvents();
            Assert.Equal(300, WindowX(window));
            CloseWindow(window);
        }
        [Fact]
        public void TestWindowYNamedIntegration()
        {
            var window = OpenWindow("Test Window", 800, 600);
            MoveWindowTo("Test Window", 100, 200);
            ProcessEvents();
            Assert.Equal(200, WindowYNamed("Test Window"));
            MoveWindowTo("Test Window", 100, 400);
            ProcessEvents();
            Assert.Equal(400, WindowYNamed("Test Window"));
            CloseWindow(window);
        }
        [Fact]
        public void TestWindowYIntegration()
        {
            var window = OpenWindow("Test Window", 800, 600);
            MoveWindowTo(window, 100, 200);
            ProcessEvents();
            Assert.Equal(200, WindowY(window));
            MoveWindowTo(window, 100, 400);
            ProcessEvents();
            Assert.Equal(400, WindowY(window));
            CloseWindow(window);
        }
    }
}
