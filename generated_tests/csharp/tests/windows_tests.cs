using Xunit;
using SplashKitSDK;
using static SplashKitSDK.SplashKit;
using HttpMethod = SplashKitSDK.HttpMethod;
namespace SplashKitTests
{
    public class TestWindows
    {
        [Fact]
        public void TestClearWindowIntegration() {
            var testWindow = OpenWindow("Test Window", 800, 600);
            using var cleanupWindow = new WindowCleanup();
            var color = ColorBlack();
            ClearWindow(testWindow, color);
            RefreshWindow(testWindow);
            var pixel = GetPixel(PointAt(0.0, 0.0));
            Assert.Equal(color, pixel);
        }
        [Fact]
        public void TestCloseAllWindowsIntegration() {
            OpenWindow("Test Window 1", 800, 600);
            using var cleanupWindow = new WindowCleanup();
            OpenWindow("Test Window 2", 800, 600);
            CloseAllWindows();
            Assert.False(HasWindow("Test Window 1"));
            Assert.False(HasWindow("Test Window 2"));
        }
        [Fact]
        public void TestCloseCurrentWindowIntegration() {
            var testWindow = OpenWindow("Test Window", 800, 600);
            using var cleanupWindow = new WindowCleanup();
            SetCurrentWindow(testWindow);
            CloseCurrentWindow();
            Assert.False(HasWindow("Test Window"));
            Assert.Null(CurrentWindow());
        }
        [Fact]
        public void TestCloseWindowNamedIntegration() {
            OpenWindow("Test Window", 800, 600);
            using var cleanupWindow = new WindowCleanup();
            Assert.True(HasWindow("Test Window"));
            CloseWindow("Test Window");
            Assert.False(HasWindow("Test Window"));
        }
        [Fact]
        public void TestCloseWindowIntegration() {
            var testWindow = OpenWindow("Test Window", 800, 600);
            using var cleanupWindow = new WindowCleanup();
            var windowName = WindowCaption(testWindow);
            CloseWindow(testWindow);
            Assert.False(HasWindow(windowName));
        }
        [Fact]
        public void TestCurrentWindowIntegration() {
            var testWindow1 = OpenWindow("Test Window 1", 800, 600);
            using var cleanupWindow = new WindowCleanup();
            var testWindow2 = OpenWindow("Test Window 2", 800, 600);
            SetCurrentWindow(testWindow2);
            Assert.Equal(testWindow2, CurrentWindow());
            Assert.True(IsCurrentWindow(testWindow2));
            Assert.False(IsCurrentWindow(testWindow1));
        }
        [Fact]
        public void TestCurrentWindowHasBorderIntegration() {
            var testWindow = OpenWindow("Test Window", 800, 600);
            using var cleanupWindow = new WindowCleanup();
            SetCurrentWindow(testWindow);
            Assert.True(CurrentWindowHasBorder());
            CurrentWindowToggleBorder();
            Assert.False(CurrentWindowHasBorder());
        }
        [Fact]
        public void TestCurrentWindowHeightIntegration() {
            var testWindow = OpenWindow("Test Window", 800, 600);
            using var cleanupWindow = new WindowCleanup();
            SetCurrentWindow(testWindow);
            Assert.Equal(600, CurrentWindowHeight());
            ResizeCurrentWindow(800, 400);
            Assert.Equal(400, CurrentWindowHeight());
        }
        [Fact]
        public void TestCurrentWindowIsFullscreenIntegration() {
            var testWindow = OpenWindow("Test Window", 800, 600);
            using var cleanupWindow = new WindowCleanup();
            SetCurrentWindow(testWindow);
            Assert.False(CurrentWindowIsFullscreen());
            CurrentWindowToggleFullscreen();
            Assert.True(CurrentWindowIsFullscreen());
        }
        [Fact]
        public void TestCurrentWindowPositionIntegration() {
            var testWindow = OpenWindow("Test Window", 800, 600);
            using var cleanupWindow = new WindowCleanup();
            SetCurrentWindow(testWindow);
            MoveCurrentWindowTo(100, 200);
            var position = CurrentWindowPosition();
            Assert.Equal(68.0, position.X);
            Assert.Equal(168.0, position.Y);
        }
        [Fact]
        public void TestCurrentWindowToggleBorderIntegration() {
            var testWindow = OpenWindow("Test Window", 800, 600);
            using var cleanupWindow = new WindowCleanup();
            SetCurrentWindow(testWindow);
            var initialBorder = CurrentWindowHasBorder();
            CurrentWindowToggleBorder();
            Assert.NotEqual(initialBorder, CurrentWindowHasBorder());
        }
        [Fact]
        public void TestCurrentWindowToggleFullscreenIntegration() {
            var testWindow = OpenWindow("Test Window", 800, 600);
            using var cleanupWindow = new WindowCleanup();
            SetCurrentWindow(testWindow);
            var initialFullscreen = CurrentWindowIsFullscreen();
            CurrentWindowToggleFullscreen();
            Assert.NotEqual(initialFullscreen, CurrentWindowIsFullscreen());
        }
        [Fact]
        public void TestCurrentWindowWidthIntegration() {
            var testWindow = OpenWindow("Test Window", 800, 600);
            using var cleanupWindow = new WindowCleanup();
            SetCurrentWindow(testWindow);
            Assert.Equal(800, CurrentWindowWidth());
            ResizeCurrentWindow(400, 600);
            Assert.Equal(400, CurrentWindowWidth());
        }
        [Fact]
        public void TestCurrentWindowXIntegration() {
            var testWindow = OpenWindow("Test Window", 800, 600);
            using var cleanupWindow = new WindowCleanup();
            SetCurrentWindow(testWindow);
            MoveCurrentWindowTo(100, 200);
            Assert.Equal(68, CurrentWindowX());
            MoveCurrentWindowTo(300, 200);
            Assert.Equal(268, CurrentWindowX());
        }
        [Fact]
        public void TestCurrentWindowYIntegration() {
            var testWindow = OpenWindow("Test Window", 800, 600);
            using var cleanupWindow = new WindowCleanup();
            SetCurrentWindow(testWindow);
            MoveCurrentWindowTo(0, 100);
            Assert.Equal(68, CurrentWindowY());
        }
        [Fact]
        public void TestHasWindowIntegration() {
            var testWindow = OpenWindow("Test Window", 800, 600);
            using var cleanupWindow = new WindowCleanup();
            Assert.True(HasWindow("Test Window"));
            Assert.True(HasWindow(WindowCaption(testWindow)));
            CloseWindow(testWindow);
            Assert.False(HasWindow("Test Window"));
        }
        [Fact]
        public void TestIsCurrentWindowIntegration() {
            var testWindow1 = OpenWindow("Test Window 1", 800, 600);
            using var cleanupWindow = new WindowCleanup();
            var testWindow2 = OpenWindow("Test Window 2", 800, 600);
            SetCurrentWindow(testWindow1);
            Assert.True(IsCurrentWindow(testWindow1));
            Assert.False(IsCurrentWindow(testWindow2));
        }
        [Fact]
        public void TestMoveCurrentWindowToIntegration() {
            var testWindow = OpenWindow("Test Window", 800, 600);
            using var cleanupWindow = new WindowCleanup();
            SetCurrentWindow(testWindow);
            MoveCurrentWindowTo(100, 200);
            Assert.Equal(68, CurrentWindowX());
            Assert.Equal(168, CurrentWindowY());
        }
        [Fact]
        public void TestMoveWindowToNamedIntegration() {
            OpenWindow("Test Window", 800, 600);
            using var cleanupWindow = new WindowCleanup();
            MoveWindowTo("Test Window", 150, 250);
            Assert.Equal(118, WindowX("Test Window"));
            Assert.Equal(218, WindowY("Test Window"));
        }
        [Fact]
        public void TestMoveWindowToIntegration() {
            var testWindow = OpenWindow("Test Window", 800, 600);
            using var cleanupWindow = new WindowCleanup();
            MoveWindowTo(testWindow, 200, 300);
            Assert.Equal(168, WindowX(testWindow));
            Assert.Equal(268, WindowY(testWindow));
        }
        [Fact]
        public void TestOpenWindowIntegration() {
            var testWindow = OpenWindow("Test Window", 800, 600);
            using var cleanupWindow = new WindowCleanup();
            Assert.NotNull(testWindow);
            Assert.Equal("Test Window", WindowCaption(testWindow));
            Assert.Equal(800, WindowWidth(testWindow));
            Assert.Equal(600, WindowHeight(testWindow));
        }
        [Fact]
        public void TestRefreshWindowIntegration() {
            var testWindow = OpenWindow("Test Window", 800, 600);
            using var cleanupWindow = new WindowCleanup();
            ClearWindow(testWindow, ColorWhite());
            DrawCircle(ColorBlack(), 400.0, 300.0, 50.0);
            RefreshWindow(testWindow);
            var pixel = GetPixel(PointAt(400.0, 350.0));
            Assert.Equal(ColorBlack(), pixel);
        }
        [Fact]
        public void TestRefreshWindowWithTargetFpsIntegration() {
            var testWindow = OpenWindow("Test Window", 800, 600);
            using var cleanupWindow = new WindowCleanup();
            RefreshWindow(testWindow, 60u);
        }
        [Fact]
        public void TestResizeCurrentWindowIntegration() {
            var testWindow = OpenWindow("Test Window", 800, 600);
            using var cleanupWindow = new WindowCleanup();
            SetCurrentWindow(testWindow);
            ResizeCurrentWindow(1024, 768);
            Assert.Equal(1024, WindowWidth(testWindow));
            Assert.Equal(768, WindowHeight(testWindow));
        }
        [Fact]
        public void TestResizeWindowIntegration() {
            var testWindow = OpenWindow("Test Window", 800, 600);
            using var cleanupWindow = new WindowCleanup();
            ResizeWindow(testWindow, 1024, 768);
            Assert.Equal(1024, WindowWidth(testWindow));
            Assert.Equal(768, WindowHeight(testWindow));
        }
        [Fact]
        public void TestSetCurrentWindowNamedIntegration() {
            OpenWindow("Test Window 1", 800, 600);
            using var cleanupWindow = new WindowCleanup();
            var testWindow2 = OpenWindow("Test Window 2", 800, 600);
            SetCurrentWindow("Test Window 2");
            Assert.Equal(testWindow2, CurrentWindow());
        }
        [Fact]
        public void TestSetCurrentWindowIntegration() {
            OpenWindow("Test Window 1", 800, 600);
            using var cleanupWindow = new WindowCleanup();
            var testWindow2 = OpenWindow("Test Window 2", 800, 600);
            SetCurrentWindow(testWindow2);
            Assert.Equal(testWindow2, CurrentWindow());
        }
        [Fact]
        public void TestWindowCaptionIntegration() {
            var testWindow = OpenWindow("Test Window", 800, 600);
            using var cleanupWindow = new WindowCleanup();
            Assert.Equal("Test Window", WindowCaption(testWindow));
        }
        [Fact]
        public void TestWindowCloseRequestedNamedIntegration() {
            var testWindow = OpenWindow("Test Window", 800, 600);
            using var cleanupWindow = new WindowCleanup();
            Assert.False(WindowCloseRequested("Test Window"));
            while (!WindowCloseRequested("Test Window")) {
                ProcessEvents();
                ClearWindow(testWindow, ColorWhite());
                DrawText("Test: window_close_requested_named. Close window to pass.", ColorBlack(), 10, 10);
                RefreshScreen();
            }
            Assert.True(WindowCloseRequested("Test Window"));
        }
        [Fact]
        public void TestWindowCloseRequestedIntegration() {
            var testWindow = OpenWindow("Test Window", 800, 600);
            using var cleanupWindow = new WindowCleanup();
            Assert.False(WindowCloseRequested(testWindow));
            while (!WindowCloseRequested(testWindow)) {
                ProcessEvents();
                ClearWindow(testWindow, ColorWhite());
                DrawText("Test: window_close_requested. Close window to pass.", ColorBlack(), 10, 10);
                RefreshScreen();
            }
            Assert.True(WindowCloseRequested(testWindow));
        }
        [Fact]
        public void TestWindowHasBorderNamedIntegration() {
            OpenWindow("Test Window", 800, 600);
            using var cleanupWindow = new WindowCleanup();
            Assert.True(WindowHasBorder("Test Window"));
            WindowToggleBorder("Test Window");
            Assert.False(WindowHasBorder("Test Window"));
        }
        [Fact]
        public void TestWindowHasBorderIntegration() {
            var testWindow = OpenWindow("Test Window", 800, 600);
            using var cleanupWindow = new WindowCleanup();
            Assert.True(WindowHasBorder(testWindow));
            WindowToggleBorder(testWindow);
            Assert.False(WindowHasBorder(testWindow));
        }
        [Fact]
        public void TestWindowHasFocusIntegration() {
            var testWindow1 = OpenWindow("Test Window 1", 800, 600);
            using var cleanupWindow = new WindowCleanup();
            var testWindow2 = OpenWindow("Test Window 2", 800, 600);
            ProcessEvents();
            Assert.True(WindowHasFocus(testWindow2));
            Assert.False(WindowHasFocus(testWindow1));
        }
        [Fact]
        public void TestWindowHeightNamedIntegration() {
            var testWindow = OpenWindow("Test Window", 800, 600);
            using var cleanupWindow = new WindowCleanup();
            Assert.Equal(600, WindowHeight("Test Window"));
            ResizeWindow(testWindow, 800, 400);
            Assert.Equal(400, WindowHeight("Test Window"));
        }
        [Fact]
        public void TestWindowHeightIntegration() {
            var testWindow = OpenWindow("Test Window", 800, 600);
            using var cleanupWindow = new WindowCleanup();
            Assert.Equal(600, WindowHeight(testWindow));
            ResizeWindow(testWindow, 800, 400);
            Assert.Equal(400, WindowHeight(testWindow));
        }
        [Fact]
        public void TestWindowIsFullscreenNamedIntegration() {
            OpenWindow("Test Window", 800, 600);
            using var cleanupWindow = new WindowCleanup();
            Assert.False(WindowIsFullscreen("Test Window"));
            WindowToggleFullscreen("Test Window");
            Assert.True(WindowIsFullscreen("Test Window"));
        }
        [Fact]
        public void TestWindowIsFullscreenIntegration() {
            var testWindow = OpenWindow("Test Window", 800, 600);
            using var cleanupWindow = new WindowCleanup();
            Assert.False(WindowIsFullscreen(testWindow));
            WindowToggleFullscreen(testWindow);
            Assert.True(WindowIsFullscreen(testWindow));
        }
        [Fact]
        public void TestWindowNamedIntegration() {
            var testWindow = OpenWindow("Test Window", 800, 600);
            using var cleanupWindow = new WindowCleanup();
            var namedWindow = WindowNamed("Test Window");
            Assert.Equal(testWindow, namedWindow);
            Assert.Equal(WindowCaption(testWindow), WindowCaption(namedWindow));
        }
        [Fact]
        public void TestWindowPositionNamedIntegration() {
            OpenWindow("Test Window", 800, 600);
            using var cleanupWindow = new WindowCleanup();
            MoveWindowTo("Test Window", 100, 200);
            Delay(500);
            var position = WindowPosition("Test Window");
            Assert.Equal(68.0, position.X);
            Assert.Equal(168.0, position.Y);
        }
        [Fact]
        public void TestWindowPositionIntegration() {
            var testWindow = OpenWindow("Test Window", 800, 600);
            using var cleanupWindow = new WindowCleanup();
            MoveWindowTo(testWindow, 100, 200);
            Delay(500);
            var position = WindowPosition(testWindow);
            Assert.Equal(68.0, position.X);
            Assert.Equal(168.0, position.Y);
        }
        [Fact]
        public void TestWindowSetIconIntegration() {
            var testWindow = OpenWindow("Test Window", 800, 600);
            using var cleanupWindow = new WindowCleanup();
            var icon = CreateBitmap("test_icon", 32, 32);
            using var cleanupBitmap = new BitmapCleanup();
            ClearBitmap(icon, ColorWhite());
            WindowSetIcon(testWindow, icon);
            FreeBitmap(icon);
        }
        [Fact]
        public void TestWindowToggleBorderNamedIntegration() {
            OpenWindow("Test Window", 800, 600);
            using var cleanupWindow = new WindowCleanup();
            Assert.True(WindowHasBorder("Test Window"));
            WindowToggleBorder("Test Window");
            Assert.False(WindowHasBorder("Test Window"));
        }
        [Fact]
        public void TestWindowToggleBorderIntegration() {
            var testWindow = OpenWindow("Test Window", 800, 600);
            using var cleanupWindow = new WindowCleanup();
            Assert.True(WindowHasBorder(testWindow));
            WindowToggleBorder(testWindow);
            Assert.False(WindowHasBorder(testWindow));
        }
        [Fact]
        public void TestWindowToggleFullscreenNamedIntegration() {
            OpenWindow("Test Window", 800, 600);
            using var cleanupWindow = new WindowCleanup();
            Assert.False(WindowIsFullscreen("Test Window"));
            WindowToggleFullscreen("Test Window");
            Assert.True(WindowIsFullscreen("Test Window"));
        }
        [Fact]
        public void TestWindowToggleFullscreenIntegration() {
            var testWindow = OpenWindow("Test Window", 800, 600);
            using var cleanupWindow = new WindowCleanup();
            Assert.False(WindowIsFullscreen(testWindow));
            WindowToggleFullscreen(testWindow);
            Assert.True(WindowIsFullscreen(testWindow));
        }
        [Fact]
        public void TestWindowWidthNamedIntegration() {
            var testWindow = OpenWindow("Test Window", 800, 600);
            using var cleanupWindow = new WindowCleanup();
            Assert.Equal(800, WindowWidth("Test Window"));
            ResizeWindow(testWindow, 1024, 600);
            Assert.Equal(1024, WindowWidth("Test Window"));
        }
        [Fact]
        public void TestWindowWidthIntegration() {
            var testWindow = OpenWindow("Test Window", 800, 600);
            using var cleanupWindow = new WindowCleanup();
            Assert.Equal(800, WindowWidth(testWindow));
            ResizeWindow(testWindow, 1024, 600);
            Assert.Equal(1024, WindowWidth(testWindow));
        }
        [Fact]
        public void TestWindowWithFocusIntegration() {
            var testWindow1 = OpenWindow("Test Window 1", 800, 600);
            using var cleanupWindow = new WindowCleanup();
            MoveWindowTo(testWindow1, 200, 200);
            Delay(500);
            var testWindow2 = OpenWindow("Test Window 2", 800, 600);
            MoveWindowTo(testWindow2, 850, 200);
            Delay(500);
            Assert.Equal(testWindow2, WindowWithFocus());
            while (WindowWithFocus() != testWindow1) {
                ProcessEvents();
                ClearScreen();
                DrawText("Test: window_with_focus. Click this window to pass.", ColorBlack(), 10, 10, OptionDrawTo(testWindow1));
                RefreshScreen();
            }
            Assert.Equal(testWindow1, WindowWithFocus());
        }
        [Fact]
        public void TestWindowXNamedIntegration() {
            OpenWindow("Test Window", 800, 600);
            using var cleanupWindow = new WindowCleanup();
            MoveWindowTo("Test Window", 100, 200);
            Assert.Equal(68, WindowX("Test Window"));
            MoveWindowTo("Test Window", 300, 200);
            Assert.Equal(268, WindowX("Test Window"));
        }
        [Fact]
        public void TestWindowXIntegration() {
            var testWindow = OpenWindow("Test Window", 800, 600);
            using var cleanupWindow = new WindowCleanup();
            MoveWindowTo(testWindow, 100, 200);
            Assert.Equal(68, WindowX(testWindow));
            MoveWindowTo(testWindow, 300, 200);
            Assert.Equal(268, WindowX(testWindow));
        }
        [Fact]
        public void TestWindowYNamedIntegration() {
            OpenWindow("Test Window", 800, 600);
            using var cleanupWindow = new WindowCleanup();
            MoveWindowTo("Test Window", 100, 200);
            Assert.Equal(168, WindowY("Test Window"));
            MoveWindowTo("Test Window", 100, 400);
            Assert.Equal(368, WindowY("Test Window"));
        }
        [Fact]
        public void TestWindowYIntegration() {
            var testWindow = OpenWindow("Test Window", 800, 600);
            using var cleanupWindow = new WindowCleanup();
            MoveWindowTo(testWindow, 100, 200);
            Assert.Equal(168, WindowY(testWindow));
            MoveWindowTo(testWindow, 100, 400);
            Assert.Equal(368, WindowY(testWindow));
        }
    }
}
