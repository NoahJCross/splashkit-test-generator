using Xunit;
using SplashKitSDK;
using static SplashKitSDK.SplashKit;
using HttpMethod = SplashKitSDK.HttpMethod;
namespace SplashKitTests
{
    public class TestInput
    {
        public TestInput()
        {
            SetResourcesPath("/mnt/c/Users/Noahc/Documents/aYear_2_semester_2/TeamProject/GitHubRepo/splashkit_test_generator/resources");
        }
        [Fact]
        public void TestProcessEventsIntegration() {
            OpenWindow("Test Window 1", 800, 600);
            using var cleanupWindow = new WindowCleanup();
            while (!KeyTyped(KeyCode.AKey)) {
                ProcessEvents();
                ClearScreen();
                DrawText("Test: process_events", ColorBlack(), 10.0, 10.0);
                DrawText("Press A to test events", ColorBlack(), 10.0, 30.0);
                DrawText($"Key Typed: {KeyTyped(KeyCode.AKey)}", ColorBlack(), 10.0, 50.0);
                RefreshScreen();
            }
            while (MouseClicked(MouseButton.LeftButton) == false) {
                ProcessEvents();
                ClearScreen();
                DrawText("Test: process_events", ColorBlack(), 10.0, 10.0);
                DrawText("Click left mouse button to test events", ColorBlack(), 10.0, 30.0);
                DrawText($"Mouse Clicked: {MouseClicked(MouseButton.LeftButton)}", ColorBlack(), 10.0, 50.0);
                RefreshScreen();
            }
        }
        [Fact]
        public void TestQuitRequestedIntegration() {
            OpenWindow("Test Window 2", 800, 600);
            using var cleanupWindow = new WindowCleanup();
            while (QuitRequested() == false) {
                ProcessEvents();
                ClearScreen();
                DrawText("Test: quit_requested", ColorBlack(), 10.0, 10.0);
                DrawText("Close window to test quit requested", ColorBlack(), 10.0, 30.0);
                DrawText($"Quit Requested: {QuitRequested()}", ColorBlack(), 10.0, 50.0);
                RefreshScreen();
            }
        }
        [Fact]
        public void TestResetQuitIntegration() {
            OpenWindow("Test Window 3", 800, 600);
            using var cleanupWindow = new WindowCleanup();
            while (QuitRequested() == false) {
                ProcessEvents();
                ClearScreen();
                DrawText("Test: reset_quit", ColorBlack(), 10.0, 10.0);
                DrawText("Close window to test reset quit", ColorBlack(), 10.0, 30.0);
                DrawText($"Quit Requested: {QuitRequested()}", ColorBlack(), 10.0, 50.0);
                RefreshScreen();
            }
            ResetQuit();
            while (KeyDown(KeyCode.SpaceKey) == false) {
                ProcessEvents();
                ClearScreen();
                DrawText("Test: reset_quit", ColorBlack(), 10.0, 10.0);
                DrawText("Press Space to end test after reset quit", ColorBlack(), 10.0, 30.0);
                DrawText($"Key Down: {KeyDown(KeyCode.AKey)}", ColorBlack(), 10.0, 50.0);
                RefreshScreen();
            }
        }
        [Fact]
        public void TestAnyKeyPressedIntegration() {
            OpenWindow("Test Window 4", 800, 600);
            using var cleanupWindow = new WindowCleanup();
            while (AnyKeyPressed() == false) {
                ProcessEvents();
                ClearScreen();
                DrawText("Test: any_key_pressed", ColorBlack(), 10.0, 10.0);
                DrawText("Press any key to test", ColorBlack(), 10.0, 30.0);
                DrawText($"Any Key Pressed: {AnyKeyPressed()}", ColorBlack(), 10.0, 50.0);
                RefreshScreen();
            }
            Assert.True(AnyKeyPressed());
        }
        [Fact]
        public void TestDeregisterCallbackOnKeyDownIntegration() {
            var callbacks = new KeyCallbacks();
            OpenWindow("Test Window 5", 800, 600);
            using var cleanupWindow = new WindowCleanup();
            RegisterCallbackOnKeyDown(callbacks.OnKeyDown());
            while (callbacks.GetKeyDown() != KeyCode.AKey) {
                ProcessEvents();
                ClearScreen();
                DrawText("Test: deregister_callback_on_key_down", ColorBlack(), 10.0, 10.0);
                DrawText("Press A to test callback", ColorBlack(), 10.0, 30.0);
                DrawText($"Key Down: {KeyDown(KeyCode.AKey)}", ColorBlack(), 10.0, 50.0);
                DrawText($"Callback received: {KeyName(callbacks.GetKeyDown())}", ColorBlack(), 10.0, 70.0);
                RefreshScreen();
            }
            DeregisterCallbackOnKeyDown(callbacks.OnKeyDown());
            while (KeyDown(KeyCode.SpaceKey) == false) {
                ProcessEvents();
                ClearScreen();
                DrawText("Test: deregister_callback_on_key_down", ColorBlack(), 10.0, 10.0);
                DrawText("Press B to test deregistered callback on key down", ColorBlack(), 10.0, 30.0);
                DrawText($"Key Down: {KeyDown(KeyCode.BKey)}", ColorBlack(), 10.0, 50.0);
                DrawText($"Callback received: {KeyName(callbacks.GetKeyDown())}", ColorBlack(), 10.0, 70.0);
                DrawText("Press Space to end test", ColorBlack(), 10.0, 90.0);
                RefreshScreen();
            }
        }
        [Fact]
        public void TestDeregisterCallbackOnKeyTypedIntegration() {
            var callbacks = new KeyCallbacks();
            OpenWindow("Test Window 6", 800, 600);
            using var cleanupWindow = new WindowCleanup();
            RegisterCallbackOnKeyTyped(callbacks.OnKeyTyped());
            while (callbacks.GetKeyTyped() != KeyCode.AKey) {
                ProcessEvents();
                ClearScreen();
                DrawText("Test: deregister_callback_on_key_typed", ColorBlack(), 10.0, 10.0);
                DrawText("Press A to test callback", ColorBlack(), 10.0, 30.0);
                DrawText($"Key Typed: {KeyTyped(KeyCode.AKey)}", ColorBlack(), 10.0, 50.0);
                DrawText($"Callback received: {KeyName(callbacks.GetKeyTyped())}", ColorBlack(), 10.0, 70.0);
                RefreshScreen();
            }
            DeregisterCallbackOnKeyTyped(callbacks.OnKeyTyped());
            while (KeyDown(KeyCode.SpaceKey) == false) {
                ProcessEvents();
                ClearScreen();
                DrawText("Test: deregister_callback_on_key_typed", ColorBlack(), 10.0, 10.0);
                DrawText("Press B to test deregistered callback on key typed", ColorBlack(), 10.0, 30.0);
                DrawText($"Key Typed: {KeyTyped(KeyCode.BKey)}", ColorBlack(), 10.0, 50.0);
                DrawText($"Callback received: {KeyName(callbacks.GetKeyTyped())}", ColorBlack(), 10.0, 70.0);
                DrawText("Press Space to end test", ColorBlack(), 10.0, 90.0);
                RefreshScreen();
            }
        }
        [Fact]
        public void TestDeregisterCallbackOnKeyUpIntegration() {
            var callbacks = new KeyCallbacks();
            OpenWindow("Test Window 7", 800, 600);
            using var cleanupWindow = new WindowCleanup();
            RegisterCallbackOnKeyUp(callbacks.OnKeyUp());
            while (callbacks.GetKeyUp() != KeyCode.AKey) {
                ProcessEvents();
                ClearScreen();
                DrawText("Test: deregister_callback_on_key_up", ColorBlack(), 10.0, 10.0);
                DrawText("Press and release A to test callback", ColorBlack(), 10.0, 30.0);
                DrawText($"Key Up: {KeyUp(KeyCode.AKey)}", ColorBlack(), 10.0, 50.0);
                DrawText($"Callback received: {KeyName(callbacks.GetKeyUp())}", ColorBlack(), 10.0, 70.0);
                RefreshScreen();
            }
            DeregisterCallbackOnKeyUp(callbacks.OnKeyUp());
            while (KeyDown(KeyCode.SpaceKey) == false) {
                ProcessEvents();
                ClearScreen();
                DrawText("Test: deregister_callback_on_key_up", ColorBlack(), 10.0, 10.0);
                DrawText("Press and release B to test deregistered callback on key up", ColorBlack(), 10.0, 30.0);
                DrawText($"Key Up: {KeyUp(KeyCode.BKey)}", ColorBlack(), 10.0, 50.0);
                DrawText($"Callback received: {KeyName(callbacks.GetKeyUp())}", ColorBlack(), 10.0, 70.0);
                DrawText("Press Space to end test", ColorBlack(), 10.0, 90.0);
                RefreshScreen();
            }
        }
        [Fact]
        public void TestKeyDownIntegration() {
            OpenWindow("Test Window 8", 800, 600);
            using var cleanupWindow = new WindowCleanup();
            while (KeyDown(KeyCode.AKey) == false) {
                ProcessEvents();
                ClearScreen();
                DrawText("Test: key_down", ColorBlack(), 10.0, 10.0);
                DrawText("Press and hold A", ColorBlack(), 10.0, 30.0);
                DrawText($"Key Down: {KeyDown(KeyCode.AKey)}", ColorBlack(), 10.0, 50.0);
                RefreshScreen();
            }
            while (KeyDown(KeyCode.AKey) != false) {
                ProcessEvents();
                ClearScreen();
                DrawText("Test: key_down", ColorBlack(), 10.0, 10.0);
                DrawText("Release A", ColorBlack(), 10.0, 30.0);
                DrawText($"Key Down: {KeyDown(KeyCode.AKey)}", ColorBlack(), 10.0, 50.0);
                RefreshScreen();
            }
        }
        [Fact]
        public void TestKeyNameIntegration() {
            var callbacks = new KeyCallbacks();
            OpenWindow("Test Window 9", 800, 600);
            using var cleanupWindow = new WindowCleanup();
            RegisterCallbackOnKeyTyped(callbacks.OnKeyTyped());
            while (KeyDown(KeyCode.AKey) == false) {
                ProcessEvents();
                ClearScreen();
                DrawText("Test: key_name", ColorBlack(), 10.0, 10.0);
                DrawText("Press A to test key name", ColorBlack(), 10.0, 30.0);
                DrawText($"Key Name: {KeyName(callbacks.GetKeyTyped())}", ColorBlack(), 10.0, 50.0);
                RefreshScreen();
            }
            while (KeyDown(KeyCode.ReturnKey) == false) {
                ProcessEvents();
                ClearScreen();
                DrawText("Test: key_name", ColorBlack(), 10.0, 10.0);
                DrawText("Press Enter to test key name", ColorBlack(), 10.0, 30.0);
                DrawText($"Key Name: {KeyName(callbacks.GetKeyTyped())}", ColorBlack(), 10.0, 50.0);
                RefreshScreen();
            }
        }
        [Fact]
        public void TestKeyReleasedIntegration() {
            OpenWindow("Test Window 10", 800, 600);
            using var cleanupWindow = new WindowCleanup();
            while (KeyReleased(KeyCode.AKey) == false) {
                ProcessEvents();
                ClearScreen();
                DrawText("Test: key_released", ColorBlack(), 10.0, 10.0);
                DrawText("Press and release A", ColorBlack(), 10.0, 30.0);
                DrawText($"Key Released: {KeyReleased(KeyCode.AKey)}", ColorBlack(), 10.0, 50.0);
                RefreshScreen();
            }
        }
        [Fact]
        public void TestKeyTypedIntegration() {
            OpenWindow("Test Window 11", 800, 600);
            using var cleanupWindow = new WindowCleanup();
            while (!KeyTyped(KeyCode.AKey)) {
                ProcessEvents();
                ClearScreen();
                DrawText("Test: key_typed", ColorBlack(), 10.0, 10.0);
                DrawText("Press A to test key typed", ColorBlack(), 10.0, 30.0);
                DrawText($"Key Typed: {KeyTyped(KeyCode.AKey)}", ColorBlack(), 10.0, 50.0);
                RefreshScreen();
            }
        }
        [Fact]
        public void TestKeyUpIntegration() {
            OpenWindow("Test Window 12", 800, 600);
            using var cleanupWindow = new WindowCleanup();
            while (KeyUp(KeyCode.AKey) == false) {
                ProcessEvents();
                ClearScreen();
                DrawText("Test: key_up", ColorBlack(), 10.0, 10.0);
                DrawText("Press and release A", ColorBlack(), 10.0, 30.0);
                DrawText($"Key Up: {KeyUp(KeyCode.AKey)}", ColorBlack(), 10.0, 50.0);
                RefreshScreen();
            }
        }
        [Fact]
        public void TestRegisterCallbackOnKeyDownIntegration() {
            var callbacks = new KeyCallbacks();
            OpenWindow("Test Window 13", 800, 600);
            using var cleanupWindow = new WindowCleanup();
            RegisterCallbackOnKeyDown(callbacks.OnKeyDown());
            while (callbacks.GetKeyDown() != KeyCode.AKey) {
                ProcessEvents();
                ClearScreen();
                DrawText("Test: register_callback_on_key_down", ColorBlack(), 10.0, 10.0);
                DrawText("Press A to test callback on key down", ColorBlack(), 10.0, 30.0);
                DrawText($"Key Down: {KeyDown(KeyCode.AKey)}", ColorBlack(), 10.0, 50.0);
                DrawText($"Callback received: {KeyName(callbacks.GetKeyDown())}", ColorBlack(), 10.0, 70.0);
                RefreshScreen();
            }
            DeregisterCallbackOnKeyDown(callbacks.OnKeyDown());
        }
        [Fact]
        public void TestRegisterCallbackOnKeyTypedIntegration() {
            var callbacks = new KeyCallbacks();
            OpenWindow("Test Window 14", 800, 600);
            using var cleanupWindow = new WindowCleanup();
            RegisterCallbackOnKeyTyped(callbacks.OnKeyTyped());
            while (callbacks.GetKeyTyped() != KeyCode.AKey) {
                ProcessEvents();
                ClearScreen();
                DrawText("Test: register_callback_on_key_typed", ColorBlack(), 10.0, 10.0);
                DrawText("Press A to test callback on key typed", ColorBlack(), 10.0, 30.0);
                DrawText($"Key Typed: {KeyTyped(KeyCode.AKey)}", ColorBlack(), 10.0, 50.0);
                DrawText($"Callback received: {KeyName(callbacks.GetKeyTyped())}", ColorBlack(), 10.0, 70.0);
                RefreshScreen();
            }
            DeregisterCallbackOnKeyTyped(callbacks.OnKeyTyped());
        }
        [Fact]
        public void TestRegisterCallbackOnKeyUpIntegration() {
            var callbacks = new KeyCallbacks();
            OpenWindow("Test Window 15", 800, 600);
            using var cleanupWindow = new WindowCleanup();
            RegisterCallbackOnKeyUp(callbacks.OnKeyUp());
            while (callbacks.GetKeyUp() != KeyCode.AKey) {
                ProcessEvents();
                ClearScreen();
                DrawText("Test: register_callback_on_key_up", ColorBlack(), 10.0, 10.0);
                DrawText("Press and release A to test callback on key up", ColorBlack(), 10.0, 30.0);
                DrawText($"Key Up: {KeyUp(KeyCode.AKey)}", ColorBlack(), 10.0, 50.0);
                DrawText($"Callback received: {KeyName(callbacks.GetKeyUp())}", ColorBlack(), 10.0, 70.0);
                RefreshScreen();
            }
            DeregisterCallbackOnKeyUp(callbacks.OnKeyUp());
        }
        [Fact]
        public void TestHideMouseIntegration() {
            OpenWindow("Test Window 16", 800, 600);
            using var cleanupWindow = new WindowCleanup();
            while (KeyDown(KeyCode.HKey) == false) {
                ProcessEvents();
                ClearScreen();
                DrawText("Test: hide_mouse", ColorBlack(), 10.0, 10.0);
                DrawText("Press H to hide mouse", ColorBlack(), 10.0, 30.0);
                DrawText($"Mouse Shown: {MouseShown()}", ColorBlack(), 10.0, 50.0);
                RefreshScreen();
            }
            HideMouse();
            while (KeyDown(KeyCode.SpaceKey) == false) {
                ProcessEvents();
                ClearScreen();
                DrawText("Test: hide_mouse", ColorBlack(), 10.0, 10.0);
                DrawText($"Mouse Shown: {MouseShown()}", ColorBlack(), 10.0, 30.0);
                DrawText("Press Space to end test", ColorBlack(), 10.0, 50.0);
                RefreshScreen();
            }
            ShowMouse();
        }
        [Fact]
        public void TestMouseClickedIntegration() {
            OpenWindow("Test Window 17", 800, 600);
            using var cleanupWindow = new WindowCleanup();
            while (MouseClicked(MouseButton.LeftButton) == false) {
                ProcessEvents();
                ClearScreen();
                DrawText("Test: mouse_clicked", ColorBlack(), 10.0, 10.0);
                DrawText("Click left mouse button", ColorBlack(), 10.0, 30.0);
                DrawText($"Mouse Clicked: {MouseClicked(MouseButton.LeftButton)}", ColorBlack(), 10.0, 50.0);
                RefreshScreen();
            }
        }
        [Fact]
        public void TestMouseDownIntegration() {
            OpenWindow("Test Window 18", 800, 600);
            using var cleanupWindow = new WindowCleanup();
            while (MouseDown(MouseButton.LeftButton) == false) {
                ProcessEvents();
                ClearScreen();
                DrawText("Test: mouse_down", ColorBlack(), 10.0, 10.0);
                DrawText("Press and hold left mouse button", ColorBlack(), 10.0, 30.0);
                DrawText($"Mouse Down: {MouseDown(MouseButton.LeftButton)}", ColorBlack(), 10.0, 50.0);
                RefreshScreen();
            }
            while (MouseDown(MouseButton.LeftButton) != false) {
                ProcessEvents();
                ClearScreen();
                DrawText("Test: mouse_down", ColorBlack(), 10.0, 10.0);
                DrawText("Release left mouse button", ColorBlack(), 10.0, 30.0);
                DrawText($"Mouse Down: {MouseDown(MouseButton.LeftButton)}", ColorBlack(), 10.0, 50.0);
                RefreshScreen();
            }
        }
        [Fact]
        public void TestMouseMovementIntegration() {
            OpenWindow("Test Window 19", 800, 600);
            using var cleanupWindow = new WindowCleanup();
            while (KeyDown(KeyCode.SpaceKey) == false) {
                ProcessEvents();
                ClearScreen();
                var movement = MouseMovement();
                DrawText("Test: mouse_movement", ColorBlack(), 10.0, 10.0);
                DrawText("Move mouse to test movement", ColorBlack(), 10.0, 30.0);
                DrawText($"Mouse Movement: X={movement.X}, Y={movement.Y}", ColorBlack(), 10.0, 50.0);
                DrawText("Press Space to end test", ColorBlack(), 10.0, 70.0);
                RefreshScreen();
            }
        }
        [Fact]
        public void TestMousePositionIntegration() {
            OpenWindow("Test Window 20", 800, 600);
            using var cleanupWindow = new WindowCleanup();
            while (KeyDown(KeyCode.SpaceKey) == false) {
                ProcessEvents();
                ClearScreen();
                var position = MousePosition();
                DrawText("Test: mouse_position", ColorBlack(), 10.0, 10.0);
                DrawText("Move mouse to test position", ColorBlack(), 10.0, 30.0);
                DrawText($"Mouse Position: X={position.X}, Y={position.Y}", ColorBlack(), 10.0, 50.0);
                DrawText("Press Space to end test", ColorBlack(), 10.0, 70.0);
                RefreshScreen();
            }
        }
        [Fact]
        public void TestMousePositionVectorIntegration() {
            OpenWindow("Test Window 21", 800, 600);
            using var cleanupWindow = new WindowCleanup();
            while (KeyDown(KeyCode.SpaceKey) == false) {
                ProcessEvents();
                ClearScreen();
                var position = MousePositionVector();
                DrawText("Test: mouse_position_vector", ColorBlack(), 10.0, 10.0);
                DrawText("Move mouse to test position", ColorBlack(), 10.0, 30.0);
                DrawText($"Mouse Position: X={position.X}, Y={position.Y}", ColorBlack(), 10.0, 50.0);
                DrawText("Press Space to end test", ColorBlack(), 10.0, 70.0);
                RefreshScreen();
            }
        }
        [Fact]
        public void TestMouseShownIntegration() {
            OpenWindow("Test Window 22", 800, 600);
            using var cleanupWindow = new WindowCleanup();
            while (KeyDown(KeyCode.HKey) == false) {
                ProcessEvents();
                ClearScreen();
                DrawText("Test: mouse_shown", ColorBlack(), 10.0, 10.0);
                DrawText("Press H to hide mouse", ColorBlack(), 10.0, 30.0);
                DrawText($"Mouse Shown: {MouseShown()}", ColorBlack(), 10.0, 50.0);
                RefreshScreen();
            }
            HideMouse();
            Assert.False(MouseShown());
            while (KeyDown(KeyCode.SKey) == false) {
                ProcessEvents();
                ClearScreen();
                DrawText("Test: mouse_shown", ColorBlack(), 10.0, 10.0);
                DrawText("Press S to show mouse", ColorBlack(), 10.0, 30.0);
                DrawText($"Mouse Shown: {MouseShown()}", ColorBlack(), 10.0, 50.0);
                RefreshScreen();
            }
            ShowMouse();
            Assert.True(MouseShown());
        }
        [Fact]
        public void TestMouseUpIntegration() {
            OpenWindow("Test Window 23", 800, 600);
            using var cleanupWindow = new WindowCleanup();
            while (MouseUp(MouseButton.LeftButton) == false) {
                ProcessEvents();
                ClearScreen();
                DrawText("Test: mouse_up", ColorBlack(), 10.0, 10.0);
                DrawText("Click and release left mouse button", ColorBlack(), 10.0, 30.0);
                DrawText($"Mouse Up: {MouseUp(MouseButton.LeftButton)}", ColorBlack(), 10.0, 50.0);
                RefreshScreen();
            }
        }
        [Fact]
        public void TestMouseWheelScrollIntegration() {
            OpenWindow("Test Window 24", 800, 600);
            using var cleanupWindow = new WindowCleanup();
            while (KeyDown(KeyCode.SpaceKey) == false) {
                ProcessEvents();
                ClearScreen();
                var scroll = MouseWheelScroll();
                DrawText("Test: mouse_wheel_scroll", ColorBlack(), 10.0, 10.0);
                DrawText("Scroll mouse wheel to test", ColorBlack(), 10.0, 30.0);
                DrawText($"Scroll Value: X={scroll.X}, Y={scroll.Y}", ColorBlack(), 10.0, 50.0);
                DrawText("Press Space to end test", ColorBlack(), 10.0, 70.0);
                RefreshScreen();
            }
        }
        [Fact]
        public void TestMouseXIntegration() {
            OpenWindow("Test Window 25", 800, 600);
            using var cleanupWindow = new WindowCleanup();
            while (KeyDown(KeyCode.SpaceKey) == false) {
                ProcessEvents();
                ClearScreen();
                DrawText("Test: mouse_x", ColorBlack(), 10.0, 10.0);
                DrawText("Move mouse to test X position", ColorBlack(), 10.0, 30.0);
                DrawText($"Mouse Position: X={MouseX()}, Y={MouseY()}", ColorBlack(), 10.0, 50.0);
                DrawText("Press Space to end test", ColorBlack(), 10.0, 70.0);
                RefreshScreen();
            }
        }
        [Fact]
        public void TestMouseYIntegration() {
            OpenWindow("Test Window 26", 800, 600);
            using var cleanupWindow = new WindowCleanup();
            while (KeyDown(KeyCode.SpaceKey) == false) {
                ProcessEvents();
                ClearScreen();
                DrawText("Test: mouse_y", ColorBlack(), 10.0, 10.0);
                DrawText("Move mouse to test Y position", ColorBlack(), 10.0, 30.0);
                DrawText($"Mouse Position: X={MouseX()}, Y={MouseY()}", ColorBlack(), 10.0, 50.0);
                DrawText("Press Space to end test", ColorBlack(), 10.0, 70.0);
                RefreshScreen();
            }
        }
        [Fact]
        public void TestMoveMouseIntegration() {
            OpenWindow("Test Window 27", 800, 600);
            using var cleanupWindow = new WindowCleanup();
            while (KeyDown(KeyCode.MKey) == false) {
                ProcessEvents();
                ClearScreen();
                DrawText("Test: move_mouse", ColorBlack(), 10.0, 10.0);
                DrawText("Press M to move mouse to center", ColorBlack(), 10.0, 30.0);
                DrawText($"Mouse Position: X={MouseX()}, Y={MouseY()}", ColorBlack(), 10.0, 50.0);
                RefreshScreen();
            }
            while (KeyDown(KeyCode.SpaceKey) == false) {
                ProcessEvents();
                ClearScreen();
                DrawText("Test: move_mouse", ColorBlack(), 10.0, 10.0);
                DrawText("Mouse moved to center", ColorBlack(), 10.0, 30.0);
                DrawText($"Mouse Position: X={MouseX()}, Y={MouseY()}", ColorBlack(), 10.0, 50.0);
                DrawText("Press Space to end test", ColorBlack(), 10.0, 70.0);
                MoveMouse(400.0, 300.0);
                RefreshScreen();
            }
        }
        [Fact]
        public void TestMoveMouseToPointIntegration() {
            OpenWindow("Test Window 28", 800, 600);
            using var cleanupWindow = new WindowCleanup();
            while (KeyDown(KeyCode.MKey) == false) {
                ProcessEvents();
                ClearScreen();
                DrawText("Test: move_mouse_to_point", ColorBlack(), 10.0, 10.0);
                DrawText("Press M to move mouse to center", ColorBlack(), 10.0, 30.0);
                DrawText($"Mouse Position: X={MouseX()}, Y={MouseY()}", ColorBlack(), 10.0, 50.0);
                RefreshScreen();
            }
            while (KeyDown(KeyCode.SpaceKey) == false) {
                ProcessEvents();
                ClearScreen();
                DrawText("Test: move_mouse_to_point", ColorBlack(), 10.0, 10.0);
                DrawText("Mouse moved to center", ColorBlack(), 10.0, 30.0);
                DrawText($"Mouse Position: X={MouseX()}, Y={MouseY()}", ColorBlack(), 10.0, 50.0);
                DrawText("Press Space to end test", ColorBlack(), 10.0, 70.0);
                MoveMouse(PointAt(400.0, 300.0));
                RefreshScreen();
            }
        }
        [Fact]
        public void TestShowMouseIntegration() {
            OpenWindow("Test Window 29", 800, 600);
            using var cleanupWindow = new WindowCleanup();
            HideMouse();
            while (KeyDown(KeyCode.SKey) == false) {
                ProcessEvents();
                ClearScreen();
                DrawText("Test: show_mouse", ColorBlack(), 10.0, 10.0);
                DrawText("Press S to show mouse", ColorBlack(), 10.0, 30.0);
                DrawText($"Mouse Shown: {MouseShown()}", ColorBlack(), 10.0, 50.0);
                RefreshScreen();
            }
            ShowMouse();
            while (KeyDown(KeyCode.SpaceKey) == false) {
                ProcessEvents();
                ClearScreen();
                DrawText("Test: show_mouse", ColorBlack(), 10.0, 10.0);
                DrawText($"Mouse Shown: {MouseShown()}", ColorBlack(), 10.0, 30.0);
                DrawText("Press Space to end test", ColorBlack(), 10.0, 50.0);
                RefreshScreen();
            }
        }
        [Fact]
        public void TestShowMouseWithBooleanIntegration() {
            OpenWindow("Test Window 30", 800, 600);
            using var cleanupWindow = new WindowCleanup();
            while (KeyDown(KeyCode.HKey) == false) {
                ProcessEvents();
                ClearScreen();
                DrawText("Test: show_mouse_with_boolean", ColorBlack(), 10.0, 10.0);
                DrawText("Press H to hide mouse", ColorBlack(), 10.0, 30.0);
                DrawText($"Mouse Shown: {MouseShown()}", ColorBlack(), 10.0, 50.0);
                RefreshScreen();
            }
            ShowMouse(false);
            Assert.False(MouseShown());
            while (KeyDown(KeyCode.SKey) == false) {
                ProcessEvents();
                ClearScreen();
                DrawText("Test: show_mouse_with_boolean", ColorBlack(), 10.0, 10.0);
                DrawText("Press S to show mouse", ColorBlack(), 10.0, 30.0);
                DrawText($"Mouse Shown: {MouseShown()}", ColorBlack(), 10.0, 50.0);
                RefreshScreen();
            }
            ShowMouse(true);
            Assert.True(MouseShown());
        }
        [Fact]
        public void TestDrawCollectedTextIntegration() {
            OpenWindow("Test Window 31", 800, 600);
            using var cleanupWindow = new WindowCleanup();
            var testFont = LoadFont("test_font", "hara.ttf");
            using var cleanupFont = new FontCleanup();
            StartReadingText(RectangleFrom(100.0, 100.0, 200.0, 30.0));
            while (KeyDown(KeyCode.ReturnKey) == false) {
                ProcessEvents();
                ClearScreen();
                DrawText("Test: draw_collected_text", ColorBlack(), 10.0, 10.0);
                DrawText("Type some text, press Enter when done", ColorBlack(), 10.0, 30.0);
                DrawCollectedText(ColorBlack(), testFont, 18, OptionDefaults());
                RefreshScreen();
            }
            EndReadingText();
        }
        [Fact]
        public void TestEndReadingTextIntegration() {
            OpenWindow("Test Window 32", 800, 600);
            using var cleanupWindow = new WindowCleanup();
            StartReadingText(RectangleFrom(100.0, 100.0, 200.0, 30.0));
            Assert.True(ReadingText());
            while (KeyDown(KeyCode.ReturnKey) == false) {
                ProcessEvents();
                ClearScreen();
                DrawText("Test: end_reading_text", ColorBlack(), 10.0, 10.0);
                DrawText("Type some text, press Enter when done", ColorBlack(), 10.0, 30.0);
                DrawText($"Reading Text: {ReadingText()}", ColorBlack(), 10.0, 50.0);
                RefreshScreen();
            }
            EndReadingText();
            Assert.False(ReadingText());
            while (KeyDown(KeyCode.SpaceKey) == false) {
                ProcessEvents();
                ClearScreen();
                DrawText("Test: end_reading_text", ColorBlack(), 10.0, 10.0);
                DrawText("Text input ended", ColorBlack(), 10.0, 30.0);
                DrawText($"Reading Text: {ReadingText()}", ColorBlack(), 10.0, 50.0);
                DrawText("Press Space to end test", ColorBlack(), 10.0, 70.0);
                RefreshScreen();
            }
        }
        [Fact]
        public void TestEndReadingTextInWindowIntegration() {
            var testWindow = OpenWindow("Test Window 33", 800, 600);
            using var cleanupWindow = new WindowCleanup();
            var testRectangle = RectangleFrom(100.0, 100.0, 200.0, 30.0);
            StartReadingText(testWindow, testRectangle);
            Assert.True(ReadingText());
            while (KeyDown(KeyCode.ReturnKey) == false) {
                ProcessEvents();
                ClearScreen();
                DrawText("Test: end_reading_text_in_window", ColorBlack(), 10.0, 10.0);
                DrawText("Type some text, press Enter when done", ColorBlack(), 10.0, 30.0);
                DrawText($"Reading Text: {ReadingText(testWindow)}", ColorBlack(), 10.0, 50.0);
                RefreshScreen();
            }
            EndReadingText(testWindow);
            Assert.False(ReadingText());
            while (KeyDown(KeyCode.SpaceKey) == false) {
                ProcessEvents();
                ClearScreen();
                DrawText("Test: end_reading_text_in_window", ColorBlack(), 10.0, 10.0);
                DrawText("Text input ended", ColorBlack(), 10.0, 30.0);
                DrawText($"Reading Text: {ReadingText(testWindow)}", ColorBlack(), 10.0, 50.0);
                DrawText("Press Space to end test", ColorBlack(), 10.0, 70.0);
                RefreshScreen();
            }
        }
        [Fact]
        public void TestReadingTextIntegration() {
            OpenWindow("Test Window 34", 800, 600);
            using var cleanupWindow = new WindowCleanup();
            StartReadingText(RectangleFrom(100.0, 100.0, 200.0, 30.0));
            Assert.True(ReadingText());
            while (KeyDown(KeyCode.ReturnKey) == false) {
                ProcessEvents();
                ClearScreen();
                DrawText("Test: reading_text", ColorBlack(), 10.0, 10.0);
                DrawText("Type some text, press Enter when done", ColorBlack(), 10.0, 30.0);
                DrawText($"Reading Text: {ReadingText()}", ColorBlack(), 10.0, 50.0);
                RefreshScreen();
            }
            EndReadingText();
            Assert.False(ReadingText());
        }
        [Fact]
        public void TestReadingTextInWindowIntegration() {
            var testWindow = OpenWindow("Test Window 35", 800, 600);
            using var cleanupWindow = new WindowCleanup();
            var testRectangle = RectangleFrom(100.0, 100.0, 200.0, 30.0);
            StartReadingText(testWindow, testRectangle);
            Assert.True(ReadingText(testWindow));
            while (KeyDown(KeyCode.ReturnKey) == false) {
                ProcessEvents();
                ClearScreen();
                DrawText("Test: reading_text_in_window", ColorBlack(), 10.0, 10.0);
                DrawText("Type some text, press Enter when done", ColorBlack(), 10.0, 30.0);
                DrawText($"Reading Text: {ReadingText(testWindow)}", ColorBlack(), 10.0, 50.0);
                RefreshScreen();
            }
            EndReadingText(testWindow);
            Assert.False(ReadingText(testWindow));
        }
        [Fact]
        public void TestStartReadingTextIntegration() {
            OpenWindow("Test Window 36", 800, 600);
            using var cleanupWindow = new WindowCleanup();
            var testRect = RectangleFrom(100.0, 100.0, 200.0, 30.0);
            StartReadingText(testRect);
            Assert.True(ReadingText());
            while (KeyDown(KeyCode.ReturnKey) == false) {
                ProcessEvents();
                ClearScreen();
                DrawText("Test: start_reading_text", ColorBlack(), 10.0, 10.0);
                DrawText("Type some text, press Enter when done", ColorBlack(), 10.0, 30.0);
                DrawText($"Current Text: {TextInput()}", ColorBlack(), 10.0, 50.0);
                RefreshScreen();
            }
            EndReadingText();
            Assert.False(ReadingText());
        }
        [Fact]
        public void TestStartReadingTextWithInitialTextIntegration() {
            OpenWindow("Test Window 37", 800, 600);
            using var cleanupWindow = new WindowCleanup();
            var testRect = RectangleFrom(100.0, 100.0, 200.0, 30.0);
            StartReadingText(testRect, "Initial Text");
            Assert.True(ReadingText());
            while (KeyDown(KeyCode.ReturnKey) == false) {
                ProcessEvents();
                ClearScreen();
                DrawText("Test: start_reading_text_with_initial_text", ColorBlack(), 10.0, 10.0);
                DrawText("Type some text, press Enter when done", ColorBlack(), 10.0, 30.0);
                DrawText($"Current Text: {TextInput()}", ColorBlack(), 10.0, 50.0);
                RefreshScreen();
            }
            EndReadingText();
            Assert.False(ReadingText());
        }
        [Fact]
        public void TestStartReadingTextInWindowIntegration() {
            var testWindow = OpenWindow("Test Window 38", 800, 600);
            using var cleanupWindow = new WindowCleanup();
            var testRect = RectangleFrom(100.0, 100.0, 200.0, 30.0);
            StartReadingText(testWindow, testRect);
            Assert.True(ReadingText());
            while (KeyDown(KeyCode.ReturnKey) == false) {
                ProcessEvents();
                ClearScreen();
                DrawText("Test: start_reading_text_in_window", ColorBlack(), 10.0, 10.0);
                DrawText("Type some text, press Enter when done", ColorBlack(), 10.0, 30.0);
                DrawText($"Current Text: {TextInput(testWindow)}", ColorBlack(), 10.0, 50.0);
                RefreshScreen();
            }
            EndReadingText(testWindow);
            Assert.False(ReadingText());
        }
        [Fact]
        public void TestStartReadingTextInWindowWithInitialTextIntegration() {
            var testWindow = OpenWindow("Test Window 39", 800, 600);
            using var cleanupWindow = new WindowCleanup();
            var testRect = RectangleFrom(100.0, 100.0, 200.0, 30.0);
            StartReadingText(testWindow, testRect, "Initial Text");
            Assert.True(ReadingText());
            while (KeyDown(KeyCode.ReturnKey) == false) {
                ProcessEvents();
                ClearScreen();
                DrawText("Test: start_reading_text_in_window_with_initial_text", ColorBlack(), 10.0, 10.0);
                DrawText("Type some text, press Enter when done", ColorBlack(), 10.0, 30.0);
                DrawText($"Current Text: {TextInput(testWindow)}", ColorBlack(), 10.0, 50.0);
                RefreshScreen();
            }
            EndReadingText(testWindow);
            Assert.False(ReadingText());
        }
        [Fact]
        public void TestTextEntryCancelledIntegration() {
            OpenWindow("Test Window 40", 800, 600);
            using var cleanupWindow = new WindowCleanup();
            StartReadingText(RectangleFrom(100.0, 100.0, 200.0, 30.0));
            while (KeyDown(KeyCode.SpaceKey) == false) {
                ProcessEvents();
                ClearScreen();
                DrawText("Test: text_entry_cancelled", ColorBlack(), 10.0, 10.0);
                DrawText("Press Escape to cancel text entry", ColorBlack(), 10.0, 30.0);
                DrawText($"Text Entry Cancelled: {TextEntryCancelled()}", ColorBlack(), 10.0, 50.0);
                DrawText("Press space to end test", ColorBlack(), 10.0, 70.0);
                RefreshScreen();
            }
            EndReadingText();
        }
        [Fact]
        public void TestTextEntryCancelledInWindowIntegration() {
            var testWindow = OpenWindow("Test Window 41", 800, 600);
            using var cleanupWindow = new WindowCleanup();
            var testRect = RectangleFrom(100.0, 100.0, 200.0, 30.0);
            StartReadingText(testWindow, testRect);
            while (KeyDown(KeyCode.SpaceKey) == false) {
                ProcessEvents();
                ClearScreen();
                DrawText("Test: text_entry_cancelled_in_window", ColorBlack(), 10.0, 10.0);
                DrawText("Press Escape to cancel text entry", ColorBlack(), 10.0, 30.0);
                DrawText($"Text Entry Cancelled: {TextEntryCancelled(testWindow)}", ColorBlack(), 10.0, 50.0);
                DrawText("Press space to end test", ColorBlack(), 10.0, 70.0);
                RefreshScreen();
            }
            Assert.True(TextEntryCancelled(testWindow));
            EndReadingText(testWindow);
        }
        [Fact]
        public void TestTextInputIntegration() {
            OpenWindow("Test Window 42", 800, 600);
            using var cleanupWindow = new WindowCleanup();
            StartReadingText(RectangleFrom(100.0, 100.0, 200.0, 30.0));
            while (KeyDown(KeyCode.ReturnKey) == false) {
                ProcessEvents();
                ClearScreen();
                DrawText("Test: text_input", ColorBlack(), 10.0, 10.0);
                DrawText("Type some text, press Enter when done", ColorBlack(), 10.0, 30.0);
                DrawText($"Current Text: {TextInput()}", ColorBlack(), 10.0, 50.0);
                RefreshScreen();
            }
            EndReadingText();
        }
        [Fact]
        public void TestTextInputInWindowIntegration() {
            var testWindow = OpenWindow("Test Window 43", 800, 600);
            using var cleanupWindow = new WindowCleanup();
            var testRect = RectangleFrom(100.0, 100.0, 200.0, 30.0);
            StartReadingText(testWindow, testRect);
            while (KeyDown(KeyCode.ReturnKey) == false) {
                ProcessEvents();
                ClearScreen();
                DrawText("Test: text_input_in_window", ColorBlack(), 10.0, 10.0);
                DrawText("Type some text, press Enter when done", ColorBlack(), 10.0, 30.0);
                DrawText($"Current Text: {TextInput(testWindow)}", ColorBlack(), 10.0, 50.0);
                RefreshScreen();
            }
            EndReadingText(testWindow);
        }
    }
}
