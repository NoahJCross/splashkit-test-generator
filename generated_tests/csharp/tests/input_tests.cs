using Xunit;
using static SplashKitSDK.SplashKit;

namespace SplashKitTests
{
    public class IntegrationTests
    {
        [Fact]
        public void TestProcessEventsIntegration()
        {
            SimulateKeyPress(Keycode.A);
            ProcessEvents();
            Assert.True(KeyTyped(Keycode.A));
            SimulateMouseClick(Mousebutton.Left);
            ProcessEvents();
            Assert.True(MouseClicked(Mousebutton.Left));
        }
        [Fact]
        public void TestQuitRequestedIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            ProcessEvents();
            Assert.False(QuitRequested());
            SimulateKeyPress(Keycode.Escape);
            ProcessEvents();
            Assert.True(QuitRequested());
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestResetQuitIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            ProcessEvents();
            Assert.True(QuitRequested());
            ResetQuit();
            ProcessEvents();
            Assert.False(QuitRequested());
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestAnyKeyPressedIntegration()
        {
            ProcessEvents();
            Assert.False(AnyKeyPressed());
            SimulateKeyPress(Keycode.A);
            ProcessEvents();
            Assert.True(AnyKeyPressed());
        }
        [Fact]
        public void TestDeregisterCallbackOnKeyDownIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            RegisterCallbackOnKeyDown(OnKeyDown());
            SimulateKeyPress(Keycode.A);
            ProcessEvents();
            Assert.True(KeyDown(Keycode.A));
            DeregisterCallbackOnKeyDown(OnKeyDown());
            SimulateKeyPress(Keycode.B);
            ProcessEvents();
            Assert.False(KeyDown(Keycode.B));
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestDeregisterCallbackOnKeyTypedIntegration()
        {
            RegisterCallbackOnKeyTyped(OnKeyTyped());
            SimulateKeyPress(Keycode.A);
            ProcessEvents();
            Assert.True(KeyTyped(Keycode.A));
            DeregisterCallbackOnKeyTyped(OnKeyTyped());
            SimulateKeyPress(Keycode.B);
            ProcessEvents();
            Assert.False(KeyTyped(Keycode.B));
        }
        [Fact]
        public void TestDeregisterCallbackOnKeyUpIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            RegisterCallbackOnKeyUp(OnKeyUp());
            SimulateKeyPress(Keycode.A);
            ProcessEvents();
            Assert.True(KeyUp(Keycode.A));
            DeregisterCallbackOnKeyUp(OnKeyUp());
            SimulateKeyPress(Keycode.B);
            ProcessEvents();
            Assert.False(KeyUp(Keycode.B));
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestKeyDownIntegration()
        {
            ProcessEvents();
            Assert.False(KeyDown(Keycode.A));
            SimulateKeyPress(Keycode.A);
            ProcessEvents();
            Assert.True(KeyDown(Keycode.A));
            SimulateKeyRelease(Keycode.A);
            ProcessEvents();
            Assert.False(KeyDown(Keycode.A));
        }
        [Fact]
        public void TestKeyNameIntegration()
        {
            var testKeyName1 = KeyName(Keycode.A);
            Assert.Equal("A", testKeyName1);
            var testKeyName2 = KeyName(Keycode.Enter);
            Assert.Equal("Enter", testKeyName2);
        }
        [Fact]
        public void TestKeyReleasedIntegration()
        {
            ProcessEvents();
            Assert.False(KeyReleased(Keycode.A));
            SimulateKeyPress(Keycode.A);
            ProcessEvents();
            SimulateKeyRelease(Keycode.A);
            ProcessEvents();
            Assert.True(KeyReleased(Keycode.A));
        }
        [Fact]
        public void TestKeyTypedIntegration()
        {
            ProcessEvents();
            Assert.False(KeyTyped(Keycode.A));
            SimulateKeyPress(Keycode.A);
            ProcessEvents();
            Assert.True(KeyTyped(Keycode.A));
        }
        [Fact]
        public void TestKeyUpIntegration()
        {
            ProcessEvents();
            Assert.True(KeyUp(Keycode.A));
            SimulateKeyPress(Keycode.A);
            ProcessEvents();
            Assert.False(KeyUp(Keycode.A));
            SimulateKeyRelease(Keycode.A);
            ProcessEvents();
            Assert.True(KeyUp(Keycode.A));
        }
        [Fact]
        public void TestRegisterCallbackOnKeyDownIntegration()
        {
            RegisterCallbackOnKeyDown(OnKeyDown());
            ProcessEvents();
            SimulateKeyPress(Keycode.A);
            ProcessEvents();
            Assert.True(KeyDown(Keycode.A));
            DeregisterCallbackOnKeyDown(OnKeyDown());
        }
        [Fact]
        public void TestRegisterCallbackOnKeyTypedIntegration()
        {
            RegisterCallbackOnKeyTyped(OnKeyTyped());
            ProcessEvents();
            SimulateKeyPress(Keycode.A);
            ProcessEvents();
            Assert.True(KeyTyped(Keycode.A));
            DeregisterCallbackOnKeyTyped(OnKeyTyped());
        }
        [Fact]
        public void TestRegisterCallbackOnKeyUpIntegration()
        {
            RegisterCallbackOnKeyUp(OnKeyUp());
            ProcessEvents();
            SimulateKeyPress(Keycode.A);
            SimulateKeyRelease(Keycode.A);
            ProcessEvents();
            Assert.Equal("A", KeyUp);
            DeregisterCallbackOnKeyUp(OnKeyUp());
        }
        [Fact]
        public void TestHideMouseIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            ProcessEvents();
            Assert.True(MouseShown());
            HideMouse();
            ProcessEvents();
            Assert.False(MouseShown());
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestMouseClickedIntegration()
        {
            ProcessEvents();
            Assert.False(MouseClicked(Mousebutton.Left));
            SimulateMouseClick(Mousebutton.Left);
            ProcessEvents();
            Assert.True(MouseClicked(Mousebutton.Left));
        }
        [Fact]
        public void TestMouseDownIntegration()
        {
            ProcessEvents();
            Assert.False(MouseDown(Mousebutton.Left));
            SimulateMousePress(Mousebutton.Left);
            ProcessEvents();
            Assert.True(MouseDown(Mousebutton.Left));
            SimulateMouseRelease(Mousebutton.Left);
            ProcessEvents();
            Assert.False(MouseDown(Mousebutton.Left));
        }
        [Fact]
        public void TestMouseMovementIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            MoveMouse(100.0, 100.0);
            ProcessEvents();
            var testMovement = MouseMovement();
            Assert.Equal(100.0, testMovement.X);
            Assert.Equal(100.0, testMovement.Y);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestMousePositionIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            MoveMouse(400.0, 300.0);
            ProcessEvents();
            var testPosition = MousePosition();
            Assert.Equal(400.0, testPosition.X);
            Assert.Equal(300.0, testPosition.Y);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestMousePositionVectorIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            MoveMouse(400.0, 300.0);
            ProcessEvents();
            var testMousePosition = MousePositionVector();
            Assert.Equal(400.0, testMousePosition.X);
            Assert.Equal(300.0, testMousePosition.Y);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestMouseShownIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            ShowMouse();
            ProcessEvents();
            Assert.True(MouseShown());
            HideMouse();
            ProcessEvents();
            Assert.False(MouseShown());
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestMouseUpIntegration()
        {
            ProcessEvents();
            Assert.True(MouseUp(Mousebutton.Left));
            SimulateMouseClick(Mousebutton.Left);
            ProcessEvents();
            Assert.False(MouseUp(Mousebutton.Left));
        }
        [Fact]
        public void TestMouseWheelScrollIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            ProcessEvents();
            Assert.Equal(VectorFromAngle(0.0, 0.0), MouseWheelScroll());
            SimulateMouseWheelScroll(10.0, 5.0);
            ProcessEvents();
            Assert.True(MouseWheelScroll());
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestMouseXIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            MoveMouse(400.0, 300.0);
            ProcessEvents();
            Assert.InRange(MouseX(), 399.0, 401.0);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestMouseYIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            MoveMouse(400.0, 300.0);
            ProcessEvents();
            Assert.Equal(300.0, MouseY());
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestMoveMouseIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            ProcessEvents();
            MoveMouse(400.0, 300.0);
            ProcessEvents();
            Assert.InRange(MouseX(), 399.0, 401.0);
            Assert.InRange(MouseY(), 299.0, 301.0);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestMoveMouseToPointIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            MoveMouse(PointAt(400.0, 300.0));
            ProcessEvents();
            Assert.Equal(PointAt(400.0, 300.0), MousePosition());
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestShowMouseIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            HideMouse();
            ProcessEvents();
            Assert.False(MouseShown());
            ShowMouse();
            ProcessEvents();
            Assert.True(MouseShown());
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestShowMouseWithBooleanIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            ShowMouse(true);
            ProcessEvents();
            Assert.True(MouseShown());
            ShowMouse(false);
            ProcessEvents();
            Assert.False(MouseShown());
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestDrawCollectedTextIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testFont = LoadFont("test_font", "path/to/font.ttf");
            StartReadingText(RectangleFrom(100, 100, 200, 30));
            ProcessEvents();
            SimulateKeyPress(Keycode.A);
            ProcessEvents();
            DrawCollectedText(ColorBlack(), testFont, 18, OptionDefaults());
            RefreshScreen();
            Assert.Equal(ColorBlack(), GetPixel(testWindow, 105, 115));
            EndReadingText();
            FreeFont(testFont);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestEndReadingTextIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            StartReadingText(RectangleFrom(100.0, 100.0, 200.0, 30.0));
            ProcessEvents();
            Assert.True(ReadingText());
            EndReadingText();
            ProcessEvents();
            Assert.False(ReadingText());
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestEndReadingTextInWindowIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testRectangle = RectangleFrom(100.0, 100.0, 200.0, 30.0);
            StartReadingText(testWindow, testRectangle);
            ProcessEvents();
            Assert.True(ReadingText(testWindow));
            EndReadingText(testWindow);
            ProcessEvents();
            Assert.False(ReadingText(testWindow));
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestReadingTextIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            StartReadingText(RectangleFrom(100.0, 100.0, 200.0, 30.0));
            ProcessEvents();
            Assert.True(ReadingText());
            EndReadingText();
            ProcessEvents();
            Assert.False(ReadingText());
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestReadingTextInWindowIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testRectangle = RectangleFrom(100.0, 100.0, 200.0, 30.0);
            StartReadingText(testWindow, testRectangle);
            ProcessEvents();
            Assert.True(ReadingText(testWindow));
            EndReadingText(testWindow);
            ProcessEvents();
            Assert.False(ReadingText(testWindow));
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestStartReadingTextIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testRect = RectangleFrom(100.0, 100.0, 200.0, 30.0);
            StartReadingText(testRect);
            ProcessEvents();
            Assert.True(ReadingText());
            EndReadingText();
            ProcessEvents();
            Assert.False(ReadingText());
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestStartReadingTextWithInitialTextIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testRect = RectangleFrom(100.0, 100.0, 200.0, 30.0);
            StartReadingText(testRect, "Initial Text");
            ProcessEvents();
            Assert.True(ReadingText());
            EndReadingText();
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestStartReadingTextInWindowIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testRect = RectangleFrom(100.0, 100.0, 200.0, 30.0);
            StartReadingText(testWindow, testRect);
            ProcessEvents();
            Assert.True(ReadingText(testWindow));
            EndReadingText(testWindow);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestStartReadingTextInWindowWithInitialTextIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testRect = RectangleFrom(100.0, 100.0, 200.0, 30.0);
            StartReadingText(testWindow, testRect, "Initial Text");
            ProcessEvents();
            Assert.True(ReadingText(testWindow));
            EndReadingText(testWindow);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestTextEntryCancelledIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            StartReadingText(RectangleFrom(100.0, 100.0, 200.0, 30.0));
            ProcessEvents();
            Assert.False(TextEntryCancelled());
            SimulateKeyPress(Keycode.Escape);
            ProcessEvents();
            Assert.True(TextEntryCancelled());
            EndReadingText();
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestTextEntryCancelledInWindowIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testRect = RectangleFrom(100.0, 100.0, 200.0, 30.0);
            StartReadingText(testWindow, testRect);
            ProcessEvents();
            Assert.False(TextEntryCancelled(testWindow));
            SimulateKeyPress(Keycode.Escape);
            ProcessEvents();
            Assert.True(TextEntryCancelled(testWindow));
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestTextInputIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            StartReadingText(RectangleFrom(100.0, 100.0, 200.0, 30.0));
            ProcessEvents();
            SimulateKeyPress(Keycode.A);
            ProcessEvents();
            Assert.Equal("A", TextInput());
            EndReadingText();
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestTextInputInWindowIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testRectangle = RectangleFrom(100.0, 100.0, 200.0, 30.0);
            StartReadingText(testWindow, testRectangle);
            ProcessEvents();
            SimulateKeyPress(Keycode.A);
            ProcessEvents();
            Assert.Equal("A", TextInput(testWindow));
            EndReadingText(testWindow);
            CloseWindow(testWindow);
        }
    }
}
