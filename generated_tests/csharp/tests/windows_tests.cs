using Xunit;
using static SplashKitSDK.SplashKit;

namespace SplashKitTests
{
    public class IntegrationTests
    {
        [Fact]
        public void TestClearWindowIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testColor = ColorBlack();
            ClearWindow(testWindow, testColor);
            RefreshWindow(testWindow);
            Assert.Equal(ColorBlack(), GetPixel(PointAt(WindowWidth(testWindow), WindowHeight(testWindow))));
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestCloseAllWindowsIntegration()
        {
            var testWindow1 = OpenWindow("Test Window 1", 800, 600);
            var testWindow2 = OpenWindow("Test Window 2", 800, 600);
            CloseAllWindows();
            Assert.False(HasWindow("Test Window 1"));
            Assert.False(HasWindow("Test Window 2"));
        }
        [Fact]
        public void TestCloseCurrentWindowIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            SetCurrentWindow(testWindow);
            CloseCurrentWindow();
            Assert.False(HasWindow("Test Window"));
        }
        [Fact]
        public void TestCloseWindowNamedIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var windowExists = HasWindow("Test Window");
            Assert.True(windowExists);
            CloseWindow("Test Window");
            var windowExists = HasWindow("Test Window");
            Assert.False(windowExists);
        }
        [Fact]
        public void TestCloseWindowIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            CloseWindow(testWindow);
            Assert.False(HasWindow("Test Window"));
        }
        [Fact]
        public void TestCurrentWindowIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            SetCurrentWindow(testWindow);
            Assert.Equal(testWindow, CurrentWindow());
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestCurrentWindowHasBorderIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            Assert.True(CurrentWindowHasBorder());
            CurrentWindowToggleBorder();
            Assert.False(CurrentWindowHasBorder());
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestCurrentWindowHeightIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            SetCurrentWindow(testWindow);
            Assert.Equal(600, CurrentWindowHeight());
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestCurrentWindowIsFullscreenIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            Assert.False(CurrentWindowIsFullscreen());
            CurrentWindowToggleFullscreen();
            Assert.True(CurrentWindowIsFullscreen());
            CurrentWindowToggleFullscreen();
            Assert.False(CurrentWindowIsFullscreen());
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestCurrentWindowPositionIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testPosition = CurrentWindowPosition();
            Assert.NotNull(testPosition);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestCurrentWindowToggleBorderIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            CurrentWindowToggleBorder();
            Assert.False(CurrentWindowHasBorder());
            CurrentWindowToggleBorder();
            Assert.True(CurrentWindowHasBorder());
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestCurrentWindowToggleFullscreenIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            CurrentWindowToggleFullscreen();
            Assert.True(CurrentWindowIsFullscreen());
            CurrentWindowToggleFullscreen();
            Assert.False(CurrentWindowIsFullscreen());
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestCurrentWindowWidthIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            SetCurrentWindow(testWindow);
            Assert.Equal(800, CurrentWindowWidth());
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestCurrentWindowXIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            MoveWindowTo(testWindow, 100, 200);
            SetCurrentWindow(testWindow);
            Assert.Equal(100, CurrentWindowX());
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestCurrentWindowYIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testY = CurrentWindowY();
            Assert.True(testY > -1);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestHasWindowIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            Assert.True(HasWindow("Test Window"));
            CloseWindow(testWindow);
            Assert.False(HasWindow("Test Window"));
        }
        [Fact]
        public void TestIsCurrentWindowIntegration()
        {
            var testWindow1 = OpenWindow("Test Window 1", 800, 600);
            var testWindow2 = OpenWindow("Test Window 2", 800, 600);
            SetCurrentWindow(testWindow1);
            Assert.True(IsCurrentWindow(testWindow1));
            Assert.False(IsCurrentWindow(testWindow2));
            SetCurrentWindow(testWindow2);
            Assert.True(IsCurrentWindow(testWindow2));
            Assert.False(IsCurrentWindow(testWindow1));
            CloseWindow(testWindow1);
            CloseWindow(testWindow2);
        }
        [Fact]
        public void TestMoveCurrentWindowToIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            MoveCurrentWindowTo(100, 100);
            Assert.Equal(100, CurrentWindowX());
            Assert.Equal(100, CurrentWindowY());
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestMoveWindowToNamedIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            MoveWindowTo("Test Window", 100, 100);
            ProcessEvents();
            Assert.Equal(100, WindowX("Test Window"));
            Assert.Equal(100, WindowY("Test Window"));
            CloseWindow("Test Window");
        }
        [Fact]
        public void TestMoveWindowToIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            MoveWindowTo(testWindow, 100, 100);
            Assert.Equal(100, WindowX(testWindow));
            Assert.Equal(100, WindowY(testWindow));
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestOpenWindowIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            Assert.NotNull(testWindow);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestRefreshWindowIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            DrawCircle(ColorBlack(), CircleAt(400.0, 300.0, 50.0));
            RefreshWindow(testWindow);
            Assert.True(PointInCircle(PointAt(400.0, 300.0), CircleAt(400.0, 300.0, 50.0)));
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestRefreshWindowWithTargetFpsIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            RefreshWindow(testWindow, 60);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestResizeCurrentWindowIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            SetCurrentWindow(testWindow);
            ResizeCurrentWindow(1024, 768);
            ProcessEvents();
            Assert.Equal(1024, CurrentWindowWidth());
            Assert.Equal(768, CurrentWindowHeight());
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestResizeWindowIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            ResizeWindow(testWindow, 1024, 768);
            Assert.Equal(1024, WindowWidth(testWindow));
            Assert.Equal(768, WindowHeight(testWindow));
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestSetCurrentWindowNamedIntegration()
        {
            var testWindow1 = OpenWindow("Test Window 1", 800, 600);
            var testWindow2 = OpenWindow("Test Window 2", 800, 600);
            SetCurrentWindow("Test Window 2");
            Assert.True(IsCurrentWindow(testWindow2));
            CloseWindow(testWindow1);
            CloseWindow(testWindow2);
        }
        [Fact]
        public void TestSetCurrentWindowIntegration()
        {
            var testWindow1 = OpenWindow("Test Window 1", 800, 600);
            var testWindow2 = OpenWindow("Test Window 2", 800, 600);
            SetCurrentWindow(testWindow2);
            Assert.True(IsCurrentWindow(testWindow2));
            CloseWindow(testWindow1);
            CloseWindow(testWindow2);
        }
        [Fact]
        public void TestWindowCaptionIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            Assert.Equal("Test Window", WindowCaption(testWindow));
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestWindowCloseRequestedNamedIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            ProcessEvents();
            Assert.False(WindowCloseRequested("Test Window"));
            SimulateKeyPress(KeyCode.Escape);
            ProcessEvents();
            Assert.True(WindowCloseRequested("Test Window"));
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestWindowCloseRequestedIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            ProcessEvents();
            Assert.False(WindowCloseRequested(testWindow));
            SimulateKeyPress(KeyCode.Escape);
            ProcessEvents();
            Assert.True(WindowCloseRequested(testWindow));
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestWindowHasBorderNamedIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            Assert.True(WindowHasBorder("Test Window"));
            WindowToggleBorder("Test Window");
            Assert.False(WindowHasBorder("Test Window"));
            CloseWindow("Test Window");
        }
        [Fact]
        public void TestWindowHasBorderIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            Assert.True(WindowHasBorder(testWindow));
            WindowToggleBorder(testWindow);
            Assert.False(WindowHasBorder(testWindow));
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestWindowHasFocusIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            ProcessEvents();
            Assert.True(WindowHasFocus(testWindow));
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestWindowHeightNamedIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            Assert.Equal(600, WindowHeight("Test Window"));
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestWindowHeightIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            Assert.Equal(600, WindowHeight(testWindow));
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestWindowIsFullscreenNamedIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            WindowToggleFullscreen(testWindow);
            Assert.True(WindowIsFullscreen("Test Window"));
            WindowToggleFullscreen(testWindow);
            Assert.False(WindowIsFullscreen("Test Window"));
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestWindowIsFullscreenIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            Assert.False(WindowIsFullscreen(testWindow));
            WindowToggleFullscreen(testWindow);
            Assert.True(WindowIsFullscreen(testWindow));
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestWindowNamedIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var retrievedWindow = WindowNamed("Test Window");
            Assert.Equal(retrievedWindow, testWindow);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestWindowPositionNamedIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testPosition = WindowPosition("Test Window");
            Assert.NotNull(testPosition);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestWindowPositionIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testPosition = WindowPosition(testWindow);
            Assert.NotNull(testPosition);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestWindowSetIconIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_icon", 32, 32);
            WindowSetIcon(testWindow, testBitmap);
            CloseWindow(testWindow);
            FreeBitmap(testBitmap);
        }
        [Fact]
        public void TestWindowToggleBorderNamedIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testHasBorder = WindowHasBorder("Test Window");
            Assert.True(testHasBorder);
            WindowToggleBorder("Test Window");
            var testHasBorder = WindowHasBorder("Test Window");
            Assert.False(testHasBorder);
            CloseWindow("Test Window");
        }
        [Fact]
        public void TestWindowToggleBorderIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            Assert.True(WindowHasBorder(testWindow));
            WindowToggleBorder(testWindow);
            Assert.False(WindowHasBorder(testWindow));
            WindowToggleBorder(testWindow);
            Assert.True(WindowHasBorder(testWindow));
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestWindowToggleFullscreenNamedIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            ProcessEvents();
            Assert.False(WindowIsFullscreen("Test Window"));
            WindowToggleFullscreen("Test Window");
            ProcessEvents();
            Assert.True(WindowIsFullscreen("Test Window"));
            CloseWindow("Test Window");
        }
        [Fact]
        public void TestWindowToggleFullscreenIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var initialFullscreenState = WindowIsFullscreen(testWindow);
            WindowToggleFullscreen(testWindow);
            var newFullscreenState = WindowIsFullscreen(testWindow);
            Assert.NotEqual(newFullscreenState, initialFullscreenState);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestWindowWidthNamedIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            Assert.Equal(800, WindowWidth("Test Window"));
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestWindowWidthIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            Assert.Equal(800, WindowWidth(testWindow));
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestWindowWithFocusIntegration()
        {
            var testWindow1 = OpenWindow("Test Window 1", 800, 600);
            var testWindow2 = OpenWindow("Test Window 2", 800, 600);
            SetCurrentWindow(testWindow1);
            var focusedWindow = WindowWithFocus();
            Assert.Equal(testWindow1, focusedWindow);
            SetCurrentWindow(testWindow2);
            var focusedWindow = WindowWithFocus();
            Assert.Equal(testWindow2, focusedWindow);
            CloseWindow(testWindow1);
            CloseWindow(testWindow2);
        }
        [Fact]
        public void TestWindowXNamedIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            MoveWindowTo("Test Window", 100, 200);
            Assert.Equal(100, WindowX("Test Window"));
            CloseWindow("Test Window");
        }
        [Fact]
        public void TestWindowXIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            Assert.True(WindowX(testWindow) > -1);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestWindowYNamedIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            MoveWindowTo("Test Window", 100, 200);
            var testWindowY = WindowY("Test Window");
            Assert.Equal(200, testWindowY);
            CloseWindow("Test Window");
        }
        [Fact]
        public void TestWindowYIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            MoveWindowTo(testWindow, 100, 200);
            Assert.Equal(200, WindowY(testWindow));
            CloseWindow(testWindow);
        }
    }
}
