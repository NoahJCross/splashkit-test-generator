using System;
using System.IO;
using Xunit;
using static SplashKitSDK.SplashKit;

namespace SplashKitTests
{
    public class TestCamera
    {
        [Fact]
        public void TestCameraPositionIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testCameraPosition = CameraPosition();
            Assert.Equal(0.0, testCameraPosition.X);
            Assert.Equal(0.0, testCameraPosition.Y);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestCameraXIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            SetCameraPosition(PointAt(100.0, 100.0));
            Assert.Equal(100.0, CameraX());
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestCameraYIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            SetCameraPosition(PointAt(100.0, 200.0));
            Assert.Equal(200.0, CameraY());
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestCenterCameraOnVectorIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testSprite = CreateSprite("test_sprite");
            SpriteSetPosition(testSprite, PointAt(100.0, 100.0));
            CenterCameraOn(testSprite, VectorFromAngle(50.0, 50.0));
            Assert.Equal(PointAt(-267.8606182336807, -161.69777810573578), CameraPosition());
            FreeSprite(testSprite);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestCenterCameraOnIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testSprite = CreateSprite("test_sprite");
            SpriteSetPosition(testSprite, PointAt(100.0, 100.0));
            CenterCameraOn(testSprite, 0.0, 0.0);
            Assert.Equal(PointAt(-300.0, -200.0), CameraPosition());
            FreeSprite(testSprite);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestMoveCameraByVectorIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testVector = VectorFromAngle(0.0, 100.0);
            MoveCameraBy(testVector);
            Assert.Equal(100.0, CameraX());
            Assert.Equal(0.0, CameraY());
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestMoveCameraByIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            MoveCameraBy(100.0, 100.0);
            Assert.Equal(100.0, CameraX());
            Assert.Equal(100.0, CameraY());
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestMoveCameraToPointIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            MoveCameraTo(PointAt(100.0, 100.0));
            Assert.Equal(PointAt(100.0, 100.0), CameraPosition());
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestMoveCameraToIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            MoveCameraTo(100.0, 100.0);
            Assert.Equal(100.0, CameraX());
            Assert.Equal(100.0, CameraY());
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestPointInWindowIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testPoint = PointAt(400.0, 300.0);
            Assert.True(PointInWindow(testWindow, testPoint));
            var testPointOutside = PointAt(1000.0, 1000.0);
            Assert.False(PointInWindow(testWindow, testPointOutside));
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestPointOnScreenIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testPoint = PointAt(400.0, 300.0);
            Assert.True(PointOnScreen(testPoint));
            var testPointOutside = PointAt(1000.0, 1000.0);
            Assert.False(PointOnScreen(testPointOutside));
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestRectInWindowIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            SetCameraX(0.0);
            SetCameraY(0.0);
            var testRectangle = RectangleFrom(0.0, 0.0, 100.0, 100.0);
            Assert.True(RectInWindow(testWindow, testRectangle));
            var testRectangleOutside = RectangleFrom(1000.0, 1000.0, 100.0, 100.0);
            Assert.False(RectInWindow(testWindow, testRectangleOutside));
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestRectOnScreenIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testRectangle = RectangleFrom(0.0, 0.0, 100.0, 100.0);
            Assert.True(RectOnScreen(testRectangle));
            MoveCameraTo(1000.0, 1000.0);
            Assert.False(RectOnScreen(testRectangle));
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestScreenCenterIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            SetCameraX(0.0);
            SetCameraY(0.0);
            var testCenter = ScreenCenter();
            Assert.Equal(400.0, testCenter.X);
            Assert.Equal(300.0, testCenter.Y);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestScreenRectangleIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testRectangle = ScreenRectangle();
            Assert.Equal(800.0, testRectangle.Width);
            Assert.Equal(600.0, testRectangle.Height);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestSetCameraPositionIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            SetCameraPosition(PointAt(100.0, 100.0));
            Assert.Equal(PointAt(100.0, 100.0), CameraPosition());
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestSetCameraXIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            SetCameraX(100.0);
            Assert.Equal(100.0, CameraX());
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestSetCameraYIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            SetCameraY(100.0);
            Assert.Equal(100.0, CameraY());
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestToScreenPointIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            SetCameraPosition(PointAt(100.0, 100.0));
            var testScreenPoint = ToScreen(PointAt(150.0, 150.0));
            Assert.Equal(50.0, testScreenPoint.X);
            Assert.Equal(50.0, testScreenPoint.Y);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestToScreenRectangleIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testRectangle = RectangleFrom(100.0, 100.0, 200.0, 200.0);
            var screenRectangle = ToScreen(testRectangle);
            Assert.Equal(ToScreenX(100.0)f, RectangleLeft(screenRectangle));
            Assert.Equal(ToScreenY(100.0)f, RectangleTop(screenRectangle));
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestToScreenXIntegration()
        {
            SetCameraX(100.0);
            var testScreenX = ToScreenX(150.0);
            Assert.Equal(50.0, testScreenX);
        }
        [Fact]
        public void TestToScreenYIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            SetCameraPosition(PointAt(100.0, 100.0));
            var testScreenY = ToScreenY(150.0);
            Assert.Equal(50.0, testScreenY);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestToWorldIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            SetCameraPosition(PointAt(100.0, 100.0));
            var testWorldPoint = ToWorld(PointAt(400.0, 300.0));
            Assert.Equal(500.0, testWorldPoint.X);
            Assert.Equal(400.0, testWorldPoint.Y);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestToWorldXIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            SetCameraPosition(PointAt(100.0, 100.0));
            var testWorldX = ToWorldX(400.0);
            Assert.Equal(500.0, testWorldX);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestToWorldYIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            SetCameraPosition(PointAt(100.0, 100.0));
            var testWorldY = ToWorldY(300.0);
            Assert.Equal(400.0, testWorldY);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestVectorWorldToScreenIntegration()
        {
            var testVector = VectorWorldToScreen();
            Assert.NotEqual(VectorFromAngle(0.0, 0.0), testVector);
        }
        [Fact]
        public void TestWindowAreaIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testArea = WindowArea(testWindow);
            Assert.Equal(800.0, testArea.Width);
            Assert.Equal(600.0, testArea.Height);
            CloseWindow(testWindow);
        }
    }
}
