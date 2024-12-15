using System;
using System.IO;
using Xunit;
using static SplashKitSDK.SplashKit;

namespace SplashKitTests
{
    public class TestWindows
    {
        [Fact]
        public void TestClearWindowIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var color = ColorBlack();
            ClearWindow(testWindow, color);
            RefreshWindow(testWindow);
            var pixel = GetPixel(PointAt(0.0, 0.0));
            Assert.Equal(color, pixel);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestCloseAllWindowsIntegration()
        {
            OpenWindow("Test Window 1", 800, 600);
            OpenWindow("Test Window 2", 800, 600);
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
            Assert.Null(CurrentWindow());
        }
        [Fact]
        public void TestCloseWindowNamedIntegration()
        {
            OpenWindow("Test Window", 800, 600);
            Assert.True(HasWindow("Test Window"));
            CloseWindow("Test Window");
            Assert.False(HasWindow("Test Window"));
        }
        [Fact]
        public void TestCloseWindowIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var windowName = WindowCaption(testWindow);
            CloseWindow(testWindow);
            Assert.False(HasWindow(windowName));
            Assert.False(WindowHasFocus(testWindow));
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
            var testWindow = OpenWindow("Test Window", 800, 600);
            SetCurrentWindow(testWindow);
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
            ResizeCurrentWindow(800, 400);
            Assert.Equal(400, CurrentWindowHeight());
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestCurrentWindowIsFullscreenIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            SetCurrentWindow(testWindow);
            Assert.False(CurrentWindowIsFullscreen());
            CurrentWindowToggleFullscreen();
            Assert.True(CurrentWindowIsFullscreen());
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestCurrentWindowPositionIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            SetCurrentWindow(testWindow);
            MoveCurrentWindowTo(100, 200);
            var position = CurrentWindowPosition();
            Assert.Equal(100.0, position.X);
            Assert.Equal(200.0, position.Y);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestCurrentWindowToggleBorderIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            SetCurrentWindow(testWindow);
            var initialBorder = CurrentWindowHasBorder();
            CurrentWindowToggleBorder();
            Assert.NotEqual(initialBorder, CurrentWindowHasBorder());
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestCurrentWindowToggleFullscreenIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            SetCurrentWindow(testWindow);
            var initialFullscreen = CurrentWindowIsFullscreen();
            CurrentWindowToggleFullscreen();
            Assert.NotEqual(initialFullscreen, CurrentWindowIsFullscreen());
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestCurrentWindowWidthIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            SetCurrentWindow(testWindow);
            Assert.Equal(800, CurrentWindowWidth());
            ResizeCurrentWindow(400, 600);
            Assert.Equal(400, CurrentWindowWidth());
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestCurrentWindowXIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            SetCurrentWindow(testWindow);
            MoveCurrentWindowTo(100, 200);
            Assert.Equal(100, CurrentWindowX());
            MoveCurrentWindowTo(300, 200);
            Assert.Equal(300, CurrentWindowX());
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestCurrentWindowYIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            SetCurrentWindow(testWindow);
            MoveCurrentWindowTo(0, 100);
            ProcessEvents();
            Assert.Equal(100, CurrentWindowY());
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestHasWindowIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            Assert.True(HasWindow("Test Window"));
            Assert.True(HasWindow(WindowCaption(testWindow)));
            CloseWindow(testWindow);
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
            var testWindow = OpenWindow("Test Window", 800, 600);
            SetCurrentWindow(testWindow);
            MoveCurrentWindowTo(100, 200);
            ProcessEvents();
            Assert.Equal(100, CurrentWindowX());
            Assert.Equal(200, CurrentWindowY());
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestMoveWindowToNamedIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            MoveWindowTo("Test Window", 150, 250);
            ProcessEvents();
            Assert.Equal(150, WindowX("Test Window"));
            Assert.Equal(250, WindowY("Test Window"));
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestMoveWindowToIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            MoveWindowTo(testWindow, 200, 300);
            ProcessEvents();
            Assert.Equal(200, WindowX(testWindow));
            Assert.Equal(300, WindowY(testWindow));
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestOpenWindowIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            Assert.NotNull(testWindow);
            Assert.Equal("Test Window", WindowCaption(testWindow));
            Assert.Equal(800, WindowWidth(testWindow));
            Assert.Equal(600, WindowHeight(testWindow));
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestRefreshWindowIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            ClearWindow(testWindow, ColorWhite());
            DrawCircle(ColorBlack(), 400.0, 300.0, 50.0);
            RefreshWindow(testWindow);
            var pixel = GetPixel(PointAt(400.0, 300.0));
            Assert.Equal(ColorBlack(), pixel);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestRefreshWindowWithTargetFpsIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            RefreshWindow(testWindow, 60u);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestResizeCurrentWindowIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            SetCurrentWindow(testWindow);
            ResizeCurrentWindow(1024, 768);
            ProcessEvents();
            Assert.Equal(1024, WindowWidth(testWindow));
            Assert.Equal(768, WindowHeight(testWindow));
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestResizeWindowIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            ResizeWindow(testWindow, 1024, 768);
            ProcessEvents();
            Assert.Equal(1024, WindowWidth(testWindow));
            Assert.Equal(768, WindowHeight(testWindow));
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestSetCurrentWindowNamedIntegration()
        {
            OpenWindow("Test Window 1", 800, 600);
            var window2 = OpenWindow("Test Window 2", 800, 600);
            SetCurrentWindow("Test Window 2");
            Assert.Equal(window2, CurrentWindow());
            CloseAllWindows();
        }
        [Fact]
        public void TestSetCurrentWindowIntegration()
        {
            OpenWindow("Test Window 1", 800, 600);
            var window2 = OpenWindow("Test Window 2", 800, 600);
            SetCurrentWindow(window2);
            Assert.Equal(window2, CurrentWindow());
            CloseAllWindows();
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
            while (!WindowCloseRequested("Test Window")) {
                ProcessEvents();
            }
            Assert.True(WindowCloseRequested("Test Window"));
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestWindowCloseRequestedIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            ProcessEvents();
            Assert.False(WindowCloseRequested(testWindow));
            while (!WindowCloseRequested(testWindow)) {
                ProcessEvents();
            }
            Assert.True(WindowCloseRequested(testWindow));
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestWindowHasBorderNamedIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            Assert.True(WindowHasBorder("Test Window"));
            WindowToggleBorder("Test Window");
            ProcessEvents();
            Assert.False(WindowHasBorder("Test Window"));
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestWindowHasBorderIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            Assert.True(WindowHasBorder(testWindow));
            WindowToggleBorder(testWindow);
            ProcessEvents();
            Assert.False(WindowHasBorder(testWindow));
            CloseWindow(testWindow);
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
            var testWindow = OpenWindow("Test Window", 800, 600);
            Assert.Equal(600, WindowHeight("Test Window"));
            ResizeWindow(testWindow, 800, 400);
            ProcessEvents();
            Assert.Equal(400, WindowHeight("Test Window"));
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestWindowHeightIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            Assert.Equal(600, WindowHeight(testWindow));
            ResizeWindow(testWindow, 800, 400);
            ProcessEvents();
            Assert.Equal(400, WindowHeight(testWindow));
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestWindowIsFullscreenNamedIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            Assert.False(WindowIsFullscreen("Test Window"));
            WindowToggleFullscreen("Test Window");
            ProcessEvents();
            Assert.True(WindowIsFullscreen("Test Window"));
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestWindowIsFullscreenIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            Assert.False(WindowIsFullscreen(testWindow));
            WindowToggleFullscreen(testWindow);
            ProcessEvents();
            Assert.True(WindowIsFullscreen(testWindow));
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestWindowNamedIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var namedWindow = WindowNamed("Test Window");
            Assert.Equal(testWindow, namedWindow);
            Assert.Equal(WindowCaption(testWindow), WindowCaption(namedWindow));
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestWindowPositionNamedIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            MoveWindowTo("Test Window", 100, 200);
            ProcessEvents();
            var position = WindowPosition("Test Window");
            Assert.Equal(100.0, position.X);
            Assert.Equal(200.0, position.Y);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestWindowPositionIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            MoveWindowTo(testWindow, 100, 200);
            ProcessEvents();
            var position = WindowPosition(testWindow);
            Assert.Equal(100.0, position.X);
            Assert.Equal(200.0, position.Y);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestWindowSetIconIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var icon = CreateBitmap("test_icon", 32, 32);
            ClearBitmap(icon, ColorWhite());
            WindowSetIcon(testWindow, icon);
            ProcessEvents();
            FreeBitmap(icon);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestWindowToggleBorderNamedIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            Assert.True(WindowHasBorder("Test Window"));
            WindowToggleBorder("Test Window");
            ProcessEvents();
            Assert.False(WindowHasBorder("Test Window"));
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestWindowToggleBorderIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            Assert.True(WindowHasBorder(testWindow));
            WindowToggleBorder(testWindow);
            ProcessEvents();
            Assert.False(WindowHasBorder(testWindow));
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestWindowToggleFullscreenNamedIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            Assert.False(WindowIsFullscreen("Test Window"));
            WindowToggleFullscreen("Test Window");
            ProcessEvents();
            Assert.True(WindowIsFullscreen("Test Window"));
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestWindowToggleFullscreenIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            Assert.False(WindowIsFullscreen(testWindow));
            WindowToggleFullscreen(testWindow);
            ProcessEvents();
            Assert.True(WindowIsFullscreen(testWindow));
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestWindowWidthNamedIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            Assert.Equal(800, WindowWidth("Test Window"));
            ResizeWindow(testWindow, 1024, 600);
            ProcessEvents();
            Assert.Equal(1024, WindowWidth("Test Window"));
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestWindowWidthIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            Assert.Equal(800, WindowWidth(testWindow));
            ResizeWindow(testWindow, 1024, 600);
            ProcessEvents();
            Assert.Equal(1024, WindowWidth(testWindow));
            CloseWindow(testWindow);
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
            var testWindow = OpenWindow("Test Window", 800, 600);
            MoveWindowTo("Test Window", 100, 200);
            ProcessEvents();
            Assert.Equal(100, WindowX("Test Window"));
            MoveWindowTo("Test Window", 300, 200);
            ProcessEvents();
            Assert.Equal(300, WindowX("Test Window"));
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestWindowXIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            MoveWindowTo(testWindow, 100, 200);
            ProcessEvents();
            Assert.Equal(100, WindowX(testWindow));
            MoveWindowTo(testWindow, 300, 200);
            ProcessEvents();
            Assert.Equal(300, WindowX(testWindow));
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestWindowYNamedIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            MoveWindowTo("Test Window", 100, 200);
            ProcessEvents();
            Assert.Equal(200, WindowY("Test Window"));
            MoveWindowTo("Test Window", 100, 400);
            ProcessEvents();
            Assert.Equal(400, WindowY("Test Window"));
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestWindowYIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            MoveWindowTo(testWindow, 100, 200);
            ProcessEvents();
            Assert.Equal(200, WindowY(testWindow));
            MoveWindowTo(testWindow, 100, 400);
            ProcessEvents();
            Assert.Equal(400, WindowY(testWindow));
            CloseWindow(testWindow);
        }
    }
}
