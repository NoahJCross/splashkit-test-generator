using Xunit;
using static SplashKitSDK.SplashKit;

namespace SplashKitTests
{
    public class TestInput
    {
        [Fact]
        public void TestProcessEventsIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            while (KeyTyped(KeyCode.AKey) == false) {
                ProcessEvents();
                ClearScreen();
                DrawText("Press A to test events", ColorBlack(), 10, 10);
                DrawText($"Key Typed: {KeyTyped(KeyCode.AKey)}", ColorBlack(), 10, 30);
                RefreshScreen();
            }
            while (MouseClicked(MouseButton.LeftButton) == false) {
                ProcessEvents();
                ClearScreen();
                DrawText("Click left mouse button to test events", ColorBlack(), 10, 10);
                DrawText($"Mouse Clicked: {MouseClicked(MouseButton.LeftButton)}", ColorBlack(), 10, 30);
                RefreshScreen();
            }
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestQuitRequestedIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            while (QuitRequested() == false) {
                ProcessEvents();
                ClearScreen();
                DrawText("Press Escape to test quit", ColorBlack(), 10, 10);
                DrawText($"Quit Requested: {QuitRequested()}", ColorBlack(), 10, 30);
                RefreshScreen();
            }
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestResetQuitIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            while (QuitRequested() == false) {
                ProcessEvents();
                ClearScreen();
                DrawText("Press Escape to test quit", ColorBlack(), 10, 10);
                DrawText($"Quit Requested: {QuitRequested()}", ColorBlack(), 10, 30);
                RefreshScreen();
                ResetQuit();
            }
            while (KeyDown(KeyCode.AKey) == false) {
                ProcessEvents();
                ClearScreen();
                DrawText("Press A to continue after reset", ColorBlack(), 10, 10);
                DrawText($"Key Down: {KeyDown(KeyCode.AKey)}", ColorBlack(), 10, 30);
                RefreshScreen();
            }
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestAnyKeyPressedIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            while (AnyKeyPressed() == false) {
                ProcessEvents();
                ClearScreen();
                DrawText("Press any key to test", ColorBlack(), 10, 10);
                DrawText($"Any Key Pressed: {AnyKeyPressed()}", ColorBlack(), 10, 30);
                RefreshScreen();
            }
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestDeregisterCallbackOnKeyDownIntegration()
        {
            var callbacks = new KeyCallbacks();
            var testWindow = OpenWindow("Test Window", 800, 600);
            RegisterCallbackOnKeyDown(callbacks.OnKeyDown);
            while (KeyDown(KeyCode.AKey) == false) {
                ProcessEvents();
                ClearScreen();
                DrawText("Press A to test callback", ColorBlack(), 10, 10);
                DrawText($"Key Down: {KeyDown(KeyCode.AKey)}", ColorBlack(), 10, 30);
                DrawText($"Callback received: {callbacks.GetKeyDown}", ColorBlack(), 10, 50);
                RefreshScreen();
                DeregisterCallbackOnKeyDown(callbacks.OnKeyDown);
            }
            while (KeyDown(KeyCode.BKey) == false) {
                ProcessEvents();
                ClearScreen();
                DrawText("Press B to test deregistered callback", ColorBlack(), 10, 10);
                DrawText($"Key Down: {KeyDown(KeyCode.BKey)}", ColorBlack(), 10, 30);
                DrawText($"Callback received: {callbacks.GetKeyDown}", ColorBlack(), 10, 50);
                RefreshScreen();
            }
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestDeregisterCallbackOnKeyTypedIntegration()
        {
            var callbacks = new KeyCallbacks();
            var testWindow = OpenWindow("Test Window", 800, 600);
            RegisterCallbackOnKeyTyped(callbacks.OnKeyTyped);
            while (KeyTyped(KeyCode.AKey) == false) {
                ProcessEvents();
                ClearScreen();
                DrawText("Press A to test callback", ColorBlack(), 10, 10);
                DrawText($"Key Typed: {KeyTyped(KeyCode.AKey)}", ColorBlack(), 10, 30);
                DrawText($"Callback received: {callbacks.GetKeyTyped}", ColorBlack(), 10, 50);
                RefreshScreen();
                DeregisterCallbackOnKeyTyped(callbacks.OnKeyTyped);
            }
            while (KeyTyped(KeyCode.BKey) == false) {
                ProcessEvents();
                ClearScreen();
                DrawText("Press B to test deregistered callback", ColorBlack(), 10, 10);
                DrawText($"Key Typed: {KeyTyped(KeyCode.BKey)}", ColorBlack(), 10, 30);
                DrawText($"Callback received: {callbacks.GetKeyTyped}", ColorBlack(), 10, 50);
                RefreshScreen();
            }
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestDeregisterCallbackOnKeyUpIntegration()
        {
            var callbacks = new KeyCallbacks();
            var testWindow = OpenWindow("Test Window", 800, 600);
            RegisterCallbackOnKeyUp(callbacks.OnKeyUp);
            while (KeyUp(KeyCode.AKey) == false) {
                ProcessEvents();
                ClearScreen();
                DrawText("Press and release A to test callback", ColorBlack(), 10, 10);
                DrawText($"Key Up: {KeyUp(KeyCode.AKey)}", ColorBlack(), 10, 30);
                DrawText($"Callback received: {callbacks.GetKeyUp}", ColorBlack(), 10, 50);
                RefreshScreen();
                DeregisterCallbackOnKeyUp(callbacks.OnKeyUp);
            }
            while (KeyUp(KeyCode.BKey) == false) {
                ProcessEvents();
                ClearScreen();
                DrawText("Press and release B to test deregistered callback", ColorBlack(), 10, 10);
                DrawText($"Key Up: {KeyUp(KeyCode.BKey)}", ColorBlack(), 10, 30);
                DrawText($"Callback received: {callbacks.GetKeyUp}", ColorBlack(), 10, 50);
                RefreshScreen();
            }
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestKeyDownIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            while (KeyDown(KeyCode.AKey) == false) {
                ProcessEvents();
                ClearScreen();
                DrawText("Press and hold A", ColorBlack(), 10, 10);
                DrawText($"Key Down: {KeyDown(KeyCode.AKey)}", ColorBlack(), 10, 30);
                RefreshScreen();
            }
            while (KeyDown(KeyCode.AKey) != false) {
                ProcessEvents();
                ClearScreen();
                DrawText("Release A", ColorBlack(), 10, 10);
                DrawText($"Key Down: {KeyDown(KeyCode.AKey)}", ColorBlack(), 10, 30);
                RefreshScreen();
            }
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestKeyNameIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            while (KeyDown(KeyCode.AKey) == false) {
                ProcessEvents();
                ClearScreen();
                DrawText("Press A to test key name", ColorBlack(), 10, 10);
                DrawText($"Key Name: {KeyName(KeyCode.AKey)}", ColorBlack(), 10, 30);
                RefreshScreen();
            }
            while (KeyDown(KeyCode.KeypadEnter) == false) {
                ProcessEvents();
                ClearScreen();
                DrawText("Press Enter to test key name", ColorBlack(), 10, 10);
                DrawText($"Key Name: {KeyName(KeyCode.KeypadEnter)}", ColorBlack(), 10, 30);
                RefreshScreen();
            }
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestKeyReleasedIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            while (KeyReleased(KeyCode.AKey) == false) {
                ProcessEvents();
                ClearScreen();
                DrawText("Press and release A", ColorBlack(), 10, 10);
                DrawText($"Key Released: {KeyReleased(KeyCode.AKey)}", ColorBlack(), 10, 30);
                RefreshScreen();
            }
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestKeyTypedIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            while (KeyTyped(KeyCode.AKey) == false) {
                ProcessEvents();
                ClearScreen();
                DrawText("Press A to test key typed", ColorBlack(), 10, 10);
                DrawText($"Key Typed: {KeyTyped(KeyCode.AKey)}", ColorBlack(), 10, 30);
                RefreshScreen();
            }
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestKeyUpIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            while (KeyUp(KeyCode.AKey) == false) {
                ProcessEvents();
                ClearScreen();
                DrawText("Press and release A", ColorBlack(), 10, 10);
                DrawText($"Key Up: {KeyUp(KeyCode.AKey)}", ColorBlack(), 10, 30);
                RefreshScreen();
            }
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestRegisterCallbackOnKeyDownIntegration()
        {
            var callbacks = new KeyCallbacks();
            var testWindow = OpenWindow("Test Window", 800, 600);
            RegisterCallbackOnKeyDown(callbacks.OnKeyDown);
            while (KeyDown(KeyCode.AKey) == false) {
                ProcessEvents();
                ClearScreen();
                DrawText("Press A to test callback", ColorBlack(), 10, 10);
                DrawText($"Key Down: {KeyDown(KeyCode.AKey)}", ColorBlack(), 10, 30);
                DrawText($"Callback received: {callbacks.GetKeyDown}", ColorBlack(), 10, 50);
                RefreshScreen();
            }
            DeregisterCallbackOnKeyDown(callbacks.OnKeyDown);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestRegisterCallbackOnKeyTypedIntegration()
        {
            var callbacks = new KeyCallbacks();
            var testWindow = OpenWindow("Test Window", 800, 600);
            RegisterCallbackOnKeyTyped(callbacks.OnKeyTyped);
            while (KeyTyped(KeyCode.AKey) == false) {
                ProcessEvents();
                ClearScreen();
                DrawText("Press A to test callback", ColorBlack(), 10, 10);
                DrawText($"Key Typed: {KeyTyped(KeyCode.AKey)}", ColorBlack(), 10, 30);
                DrawText($"Callback received: {callbacks.GetKeyTyped}", ColorBlack(), 10, 50);
                RefreshScreen();
            }
            DeregisterCallbackOnKeyTyped(callbacks.OnKeyTyped);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestRegisterCallbackOnKeyUpIntegration()
        {
            var callbacks = new KeyCallbacks();
            var testWindow = OpenWindow("Test Window", 800, 600);
            RegisterCallbackOnKeyUp(callbacks.OnKeyUp);
            while (KeyUp(KeyCode.AKey) == false) {
                ProcessEvents();
                ClearScreen();
                DrawText("Press and release A to test callback", ColorBlack(), 10, 10);
                DrawText($"Key Up: {KeyUp(KeyCode.AKey)}", ColorBlack(), 10, 30);
                DrawText($"Callback received: {callbacks.GetKeyUp}", ColorBlack(), 10, 50);
                RefreshScreen();
            }
            DeregisterCallbackOnKeyUp(callbacks.OnKeyUp);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestHideMouseIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            while (KeyDown(KeyCode.HKey) == false) {
                ProcessEvents();
                ClearScreen();
                DrawText("Press H to hide mouse", ColorBlack(), 10, 10);
                DrawText($"Mouse Shown: {MouseShown()}", ColorBlack(), 10, 30);
                RefreshScreen();
                HideMouse();
            }
            while (KeyDown(KeyCode.SKey) == false) {
                ProcessEvents();
                ClearScreen();
                DrawText("Press S to show mouse", ColorBlack(), 10, 10);
                DrawText($"Mouse Shown: {MouseShown()}", ColorBlack(), 10, 30);
                RefreshScreen();
            }
            ShowMouse();
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestMouseClickedIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            while (MouseClicked(MouseButton.LeftButton) == false) {
                ProcessEvents();
                ClearScreen();
                DrawText("Click left mouse button", ColorBlack(), 10, 10);
                DrawText($"Mouse Clicked: {MouseClicked(MouseButton.LeftButton)}", ColorBlack(), 10, 30);
                RefreshScreen();
            }
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestMouseDownIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            while (MouseDown(MouseButton.LeftButton) == false) {
                ProcessEvents();
                ClearScreen();
                DrawText("Press and hold left mouse button", ColorBlack(), 10, 10);
                DrawText($"Mouse Down: {MouseDown(MouseButton.LeftButton)}", ColorBlack(), 10, 30);
                RefreshScreen();
            }
            while (MouseDown(MouseButton.LeftButton) != false) {
                ProcessEvents();
                ClearScreen();
                DrawText("Release left mouse button", ColorBlack(), 10, 10);
                DrawText($"Mouse Down: {MouseDown(MouseButton.LeftButton)}", ColorBlack(), 10, 30);
                RefreshScreen();
            }
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestMouseMovementIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            while (KeyDown(KeyCode.SpaceKey) == false) {
                ProcessEvents();
                ClearScreen();
                var movement = MouseMovement();
                DrawText("Move mouse to test movement", ColorBlack(), 10, 10);
                DrawText($"Mouse Position: X={MouseX()}, Y={MouseY()}", ColorBlack(), 10, 30);
                DrawText("Press Space to end test", ColorBlack(), 10, 50);
                RefreshScreen();
            }
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestMousePositionIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            while (KeyDown(KeyCode.SpaceKey) == false) {
                ProcessEvents();
                ClearScreen();
                var position = MousePosition();
                DrawText("Move mouse to test position", ColorBlack(), 10, 10);
                DrawText($"Mouse Position: X={MouseX()}, Y={MouseY()}", ColorBlack(), 10, 30);
                DrawText("Press Space to end test", ColorBlack(), 10, 50);
                RefreshScreen();
            }
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestMousePositionVectorIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            while (KeyDown(KeyCode.SpaceKey) == false) {
                ProcessEvents();
                ClearScreen();
                var position = MousePositionVector();
                DrawText("Move mouse to test position", ColorBlack(), 10, 10);
                DrawText($"Mouse Position: X={MouseX()}, Y={MouseY()}", ColorBlack(), 10, 30);
                DrawText("Press Space to end test", ColorBlack(), 10, 50);
                RefreshScreen();
            }
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestMouseShownIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            while (KeyDown(KeyCode.HKey) == false) {
                ProcessEvents();
                ClearScreen();
                DrawText("Press H to hide mouse", ColorBlack(), 10, 10);
                DrawText($"Mouse Shown: {MouseShown()}", ColorBlack(), 10, 30);
                RefreshScreen();
                HideMouse();
            }
            while (KeyDown(KeyCode.SKey) == false) {
                ProcessEvents();
                ClearScreen();
                DrawText("Press S to show mouse", ColorBlack(), 10, 10);
                DrawText($"Mouse Shown: {MouseShown()}", ColorBlack(), 10, 30);
                RefreshScreen();
            }
            ShowMouse();
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestMouseUpIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            while (MouseUp(MouseButton.LeftButton) == false) {
                ProcessEvents();
                ClearScreen();
                DrawText("Click and release left mouse button", ColorBlack(), 10, 10);
                DrawText($"Mouse Up: {MouseUp(MouseButton.LeftButton)}", ColorBlack(), 10, 30);
                RefreshScreen();
            }
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestMouseWheelScrollIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            while (KeyDown(KeyCode.SpaceKey) == false) {
                ProcessEvents();
                ClearScreen();
                var scroll = MouseWheelScroll();
                DrawText("Scroll mouse wheel to test", ColorBlack(), 10, 10);
                DrawText($"Mouse Position: X={MouseX()}, Y={MouseY()}", ColorBlack(), 10, 30);
                DrawText("Press Space to end test", ColorBlack(), 10, 50);
                RefreshScreen();
            }
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestMouseXIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            while (KeyDown(KeyCode.SpaceKey) == false) {
                ProcessEvents();
                ClearScreen();
                DrawText("Move mouse to test X position", ColorBlack(), 10, 10);
                DrawText($"Mouse Position: X={MouseX()}, Y={MouseY()}", ColorBlack(), 10, 30);
                DrawText("Press Space to end test", ColorBlack(), 10, 50);
                RefreshScreen();
            }
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestMouseYIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            while (KeyDown(KeyCode.SpaceKey) == false) {
                ProcessEvents();
                ClearScreen();
                DrawText("Move mouse to test Y position", ColorBlack(), 10, 10);
                DrawText($"Mouse Position: X={MouseX()}, Y={MouseY()}", ColorBlack(), 10, 30);
                DrawText("Press Space to end test", ColorBlack(), 10, 50);
                RefreshScreen();
            }
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestMoveMouseIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            while (KeyDown(KeyCode.MKey) == false) {
                ProcessEvents();
                ClearScreen();
                DrawText("Press M to move mouse to center", ColorBlack(), 10, 10);
                DrawText($"Mouse Position: X={MouseX()}, Y={MouseY()}", ColorBlack(), 10, 30);
                RefreshScreen();
                MoveMouse(400, 300);
            }
            while (KeyDown(KeyCode.SpaceKey) == false) {
                ProcessEvents();
                ClearScreen();
                DrawText("Mouse moved to center", ColorBlack(), 10, 10);
                DrawText($"Mouse Position: X={MouseX()}, Y={MouseY()}", ColorBlack(), 10, 30);
                DrawText("Press Space to end test", ColorBlack(), 10, 50);
                RefreshScreen();
            }
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestMoveMouseToPointIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            while (KeyDown(KeyCode.MKey) == false) {
                ProcessEvents();
                ClearScreen();
                DrawText("Press M to move mouse to center", ColorBlack(), 10, 10);
                DrawText($"Mouse Position: X={MouseX()}, Y={MouseY()}", ColorBlack(), 10, 30);
                RefreshScreen();
                MoveMouse(PointAt(400, 300));
            }
            while (KeyDown(KeyCode.SpaceKey) == false) {
                ProcessEvents();
                ClearScreen();
                DrawText("Mouse moved to center", ColorBlack(), 10, 10);
                DrawText($"Mouse Position: X={MouseX()}, Y={MouseY()}", ColorBlack(), 10, 30);
                DrawText("Press Space to end test", ColorBlack(), 10, 50);
                RefreshScreen();
            }
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestShowMouseIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            while (KeyDown(KeyCode.HKey) == false) {
                ProcessEvents();
                ClearScreen();
                DrawText("Press H to hide mouse", ColorBlack(), 10, 10);
                DrawText($"Mouse Shown: {MouseShown()}", ColorBlack(), 10, 30);
                RefreshScreen();
                HideMouse();
            }
            while (KeyDown(KeyCode.SKey) == false) {
                ProcessEvents();
                ClearScreen();
                DrawText("Press S to show mouse", ColorBlack(), 10, 10);
                DrawText($"Mouse Shown: {MouseShown()}", ColorBlack(), 10, 30);
                RefreshScreen();
            }
            ShowMouse();
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestShowMouseWithBooleanIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            while (KeyDown(KeyCode.HKey) == false) {
                ProcessEvents();
                ClearScreen();
                DrawText("Press H to hide mouse", ColorBlack(), 10, 10);
                DrawText($"Mouse Shown: {MouseShown()}", ColorBlack(), 10, 30);
                RefreshScreen();
                ShowMouse(false);
            }
            while (KeyDown(KeyCode.SKey) == false) {
                ProcessEvents();
                ClearScreen();
                DrawText("Press S to show mouse", ColorBlack(), 10, 10);
                DrawText($"Mouse Shown: {MouseShown()}", ColorBlack(), 10, 30);
                RefreshScreen();
            }
            ShowMouse(true);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestDrawCollectedTextIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testFont = LoadFont("test_font", "hara.ttf");
            StartReadingText(RectangleFrom(100, 100, 200, 30));
            while (KeyDown(KeyCode.KeypadEnter) == false) {
                ProcessEvents();
                ClearScreen();
                DrawText("Type some text, press Enter when done", ColorBlack(), 10, 10);
                DrawCollectedText(ColorBlack(), testFont, 18, OptionDefaults());
                RefreshScreen();
            }
            EndReadingText();
            FreeFont(testFont);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestEndReadingTextIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            StartReadingText(RectangleFrom(100, 100, 200, 30));
            while (KeyDown(KeyCode.KeypadEnter) == false) {
                ProcessEvents();
                ClearScreen();
                DrawText("Type some text, press Enter when done", ColorBlack(), 10, 10);
                DrawText($"Reading Text: {ReadingText()}", ColorBlack(), 10, 30);
                RefreshScreen();
                EndReadingText();
            }
            while (KeyDown(KeyCode.SpaceKey) == false) {
                ProcessEvents();
                ClearScreen();
                DrawText("Text input ended", ColorBlack(), 10, 10);
                DrawText($"Reading Text: {ReadingText()}", ColorBlack(), 10, 30);
                DrawText("Press Space to end test", ColorBlack(), 10, 50);
                RefreshScreen();
            }
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestEndReadingTextInWindowIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testRectangle = RectangleFrom(100, 100, 200, 30);
            StartReadingText(testWindow, testRectangle);
            while (KeyDown(KeyCode.KeypadEnter) == false) {
                ProcessEvents();
                ClearScreen();
                DrawText("Type some text, press Enter when done", ColorBlack(), 10, 10);
                DrawText($"Reading Text: {ReadingText(testWindow)}", ColorBlack(), 10, 30);
                RefreshScreen();
                EndReadingText(testWindow);
            }
            while (KeyDown(KeyCode.SpaceKey) == false) {
                ProcessEvents();
                ClearScreen();
                DrawText("Text input ended", ColorBlack(), 10, 10);
                DrawText($"Reading Text: {ReadingText(testWindow)}", ColorBlack(), 10, 30);
                DrawText("Press Space to end test", ColorBlack(), 10, 50);
                RefreshScreen();
            }
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestReadingTextIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            StartReadingText(RectangleFrom(100, 100, 200, 30));
            while (KeyDown(KeyCode.KeypadEnter) == false) {
                ProcessEvents();
                ClearScreen();
                DrawText("Type some text, press Enter when done", ColorBlack(), 10, 10);
                DrawText($"Reading Text: {ReadingText()}", ColorBlack(), 10, 30);
                RefreshScreen();
            }
            EndReadingText();
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestReadingTextInWindowIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testRectangle = RectangleFrom(100, 100, 200, 30);
            StartReadingText(testWindow, testRectangle);
            while (KeyDown(KeyCode.KeypadEnter) == false) {
                ProcessEvents();
                ClearScreen();
                DrawText("Type some text, press Enter when done", ColorBlack(), 10, 10);
                DrawText($"Reading Text: {ReadingText(testWindow)}", ColorBlack(), 10, 30);
                RefreshScreen();
            }
            EndReadingText(testWindow);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestStartReadingTextIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testRect = RectangleFrom(100, 100, 200, 30);
            StartReadingText(testRect);
            while (KeyDown(KeyCode.KeypadEnter) == false) {
                ProcessEvents();
                ClearScreen();
                DrawText("Type some text, press Enter when done", ColorBlack(), 10, 10);
                DrawText($"Current Text: {TextInput()}", ColorBlack(), 10, 30);
                RefreshScreen();
            }
            EndReadingText();
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestStartReadingTextWithInitialTextIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testRect = RectangleFrom(100, 100, 200, 30);
            StartReadingText(testRect, "Initial Text");
            while (KeyDown(KeyCode.KeypadEnter) == false) {
                ProcessEvents();
                ClearScreen();
                DrawText("Type some text, press Enter when done", ColorBlack(), 10, 10);
                DrawText($"Current Text: {TextInput()}", ColorBlack(), 10, 30);
                RefreshScreen();
            }
            EndReadingText();
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestStartReadingTextInWindowIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testRect = RectangleFrom(100, 100, 200, 30);
            StartReadingText(testWindow, testRect);
            while (KeyDown(KeyCode.KeypadEnter) == false) {
                ProcessEvents();
                ClearScreen();
                DrawText("Type some text, press Enter when done", ColorBlack(), 10, 10);
                DrawText($"Current Text: {TextInput(testWindow)}", ColorBlack(), 10, 30);
                RefreshScreen();
            }
            EndReadingText(testWindow);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestStartReadingTextInWindowWithInitialTextIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testRect = RectangleFrom(100, 100, 200, 30);
            StartReadingText(testWindow, testRect, "Initial Text");
            while (KeyDown(KeyCode.KeypadEnter) == false) {
                ProcessEvents();
                ClearScreen();
                DrawText("Type some text, press Enter when done", ColorBlack(), 10, 10);
                DrawText($"Current Text: {TextInput(testWindow)}", ColorBlack(), 10, 30);
                RefreshScreen();
            }
            EndReadingText(testWindow);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestTextEntryCancelledIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            StartReadingText(RectangleFrom(100, 100, 200, 30));
            while (KeyDown(KeyCode.EscapeKey) == false) {
                ProcessEvents();
                ClearScreen();
                DrawText("Press Escape to cancel text entry", ColorBlack(), 10, 10);
                DrawText($"Text Entry Cancelled: {TextEntryCancelled()}", ColorBlack(), 10, 30);
                RefreshScreen();
            }
            EndReadingText();
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestTextEntryCancelledInWindowIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testRect = RectangleFrom(100, 100, 200, 30);
            StartReadingText(testWindow, testRect);
            while (KeyDown(KeyCode.EscapeKey) == false) {
                ProcessEvents();
                ClearScreen();
                DrawText("Press Escape to cancel text entry", ColorBlack(), 10, 10);
                DrawText($"Text Entry Cancelled: {TextEntryCancelled(testWindow)}", ColorBlack(), 10, 30);
                RefreshScreen();
            }
            EndReadingText(testWindow);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestTextInputIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            StartReadingText(RectangleFrom(100, 100, 200, 30));
            while (KeyDown(KeyCode.KeypadEnter) == false) {
                ProcessEvents();
                ClearScreen();
                DrawText("Type some text, press Enter when done", ColorBlack(), 10, 10);
                DrawText($"Current Text: {TextInput()}", ColorBlack(), 10, 30);
                RefreshScreen();
            }
            EndReadingText();
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestTextInputInWindowIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testRect = RectangleFrom(100, 100, 200, 30);
            StartReadingText(testWindow, testRect);
            while (KeyDown(KeyCode.KeypadEnter) == false) {
                ProcessEvents();
                ClearScreen();
                DrawText("Type some text, press Enter when done", ColorBlack(), 10, 10);
                DrawText($"Current Text: {TextInput(testWindow)}", ColorBlack(), 10, 30);
                RefreshScreen();
            }
            EndReadingText(testWindow);
            CloseWindow(testWindow);
        }
    }
}
