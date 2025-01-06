using Xunit;
using SplashKitSDK;
using static SplashKitSDK.SplashKit;
using HttpMethod = SplashKitSDK.HttpMethod;
namespace SplashKitTests
{
    public class TestCamera
    {
        [Fact]
        public void TestCameraPositionIntegration() {
            OpenWindow("Test Window 1", 800, 600);
            using var cleanupWindow = new WindowCleanup();
            var testCameraPosition = CameraPosition();
            Assert.Equal(0.0, testCameraPosition.X);
            Assert.Equal(0.0, testCameraPosition.Y);
        }
        [Fact]
        public void TestCameraXIntegration() {
            OpenWindow("Test Window 2", 800, 600);
            using var cleanupWindow = new WindowCleanup();
            SetCameraPosition(PointAt(100.0, 100.0));
            Assert.Equal(100.0, CameraX());
        }
        [Fact]
        public void TestCameraYIntegration() {
            OpenWindow("Test Window 3", 800, 600);
            using var cleanupWindow = new WindowCleanup();
            SetCameraPosition(PointAt(100.0, 200.0));
            Assert.Equal(200.0, CameraY());
        }
        [Fact]
        public void TestCenterCameraOnVectorIntegration() {
            OpenWindow("Test Window 4", 800, 600);
            using var cleanupWindow = new WindowCleanup();
            var testBitmap = CreateBitmap("Test Bitmap 1", 100, 100);
            using var cleanupBitmap = new BitmapCleanup();
            var testSprite = CreateSprite(testBitmap);
            using var cleanupSprite = new SpriteCleanup();
            SpriteSetPosition(testSprite, PointAt(100.0, 100.0));
            CenterCameraOn(testSprite, VectorFromAngle(50.0, 50.0));
            Assert.Equal(PointAt(-267.8606182336807, -161.69777810573578), CameraPosition());
        }
        [Fact]
        public void TestCenterCameraOnIntegration() {
            OpenWindow("Test Window 5", 800, 600);
            using var cleanupWindow = new WindowCleanup();
            var testBitmap = CreateBitmap("Test Bitmap 2", 100, 100);
            using var cleanupBitmap = new BitmapCleanup();
            var testSprite = CreateSprite(testBitmap);
            using var cleanupSprite = new SpriteCleanup();
            SpriteSetPosition(testSprite, PointAt(100.0, 100.0));
            CenterCameraOn(testSprite, 0.0, 0.0);
            Assert.Equal(PointAt(-300.0, -200.0), CameraPosition());
        }
        [Fact]
        public void TestMoveCameraByVectorIntegration() {
            OpenWindow("Test Window 6", 800, 600);
            using var cleanupWindow = new WindowCleanup();
            var testVector = VectorFromAngle(0.0, 100.0);
            MoveCameraTo(0.0, 0.0);
            MoveCameraBy(testVector);
            Assert.Equal(100.0, CameraX());
            Assert.Equal(0.0, CameraY());
        }
        [Fact]
        public void TestMoveCameraByIntegration() {
            OpenWindow("Test Window 7", 800, 600);
            using var cleanupWindow = new WindowCleanup();
            MoveCameraTo(0.0, 0.0);
            MoveCameraBy(100.0, 100.0);
            Assert.Equal(100.0, CameraX());
            Assert.Equal(100.0, CameraY());
        }
        [Fact]
        public void TestMoveCameraToPointIntegration() {
            OpenWindow("Test Window 8", 800, 600);
            using var cleanupWindow = new WindowCleanup();
            MoveCameraTo(PointAt(100.0, 100.0));
            Assert.Equal(PointAt(100.0, 100.0), CameraPosition());
        }
        [Fact]
        public void TestMoveCameraToIntegration() {
            OpenWindow("Test Window 9", 800, 600);
            using var cleanupWindow = new WindowCleanup();
            MoveCameraTo(100.0, 100.0);
            Assert.Equal(100.0, CameraX());
            Assert.Equal(100.0, CameraY());
        }
        [Fact]
        public void TestPointInWindowIntegration() {
            var testWindow = OpenWindow("Test Window 10", 800, 600);
            using var cleanupWindow = new WindowCleanup();
            var testPoint = PointAt(400.0, 300.0);
            Assert.True(PointInWindow(testWindow, testPoint));
            var testPointOutside = PointAt(1000.0, 1000.0);
            Assert.False(PointInWindow(testWindow, testPointOutside));
        }
        [Fact]
        public void TestPointOnScreenIntegration() {
            OpenWindow("Test Window 11", 800, 600);
            using var cleanupWindow = new WindowCleanup();
            var testPoint = PointAt(400.0, 300.0);
            Assert.True(PointOnScreen(testPoint));
            var testPointOutside = PointAt(1000.0, 1000.0);
            Assert.False(PointOnScreen(testPointOutside));
        }
        [Fact]
        public void TestRectInWindowIntegration() {
            var testWindow = OpenWindow("Test Window 12", 800, 600);
            using var cleanupWindow = new WindowCleanup();
            SetCameraX(0.0);
            SetCameraY(0.0);
            var testRectangle = RectangleFrom(0.0, 0.0, 100.0, 100.0);
            Assert.True(RectInWindow(testWindow, testRectangle));
            var testRectangleOutside = RectangleFrom(1000.0, 1000.0, 100.0, 100.0);
            Assert.False(RectInWindow(testWindow, testRectangleOutside));
        }
        [Fact]
        public void TestRectOnScreenIntegration() {
            OpenWindow("Test Window 13", 800, 600);
            using var cleanupWindow = new WindowCleanup();
            var testRectangle = RectangleFrom(0.0, 0.0, 100.0, 100.0);
            Assert.True(RectOnScreen(testRectangle));
            MoveCameraTo(1000.0, 1000.0);
            Assert.False(RectOnScreen(testRectangle));
        }
        [Fact]
        public void TestScreenCenterIntegration() {
            OpenWindow("Test Window 14", 800, 600);
            using var cleanupWindow = new WindowCleanup();
            SetCameraX(0.0);
            SetCameraY(0.0);
            var testCenter = ScreenCenter();
            Assert.Equal(400.0, testCenter.X);
            Assert.Equal(300.0, testCenter.Y);
        }
        [Fact]
        public void TestScreenRectangleIntegration() {
            OpenWindow("Test Window 15", 800, 600);
            using var cleanupWindow = new WindowCleanup();
            var testRectangle = ScreenRectangle();
            Assert.Equal(800.0, testRectangle.Width);
            Assert.Equal(600.0, testRectangle.Height);
        }
        [Fact]
        public void TestSetCameraPositionIntegration() {
            OpenWindow("Test Window 16", 800, 600);
            using var cleanupWindow = new WindowCleanup();
            SetCameraPosition(PointAt(100.0, 100.0));
            Assert.Equal(PointAt(100.0, 100.0), CameraPosition());
        }
        [Fact]
        public void TestSetCameraXIntegration() {
            OpenWindow("Test Window 17", 800, 600);
            using var cleanupWindow = new WindowCleanup();
            SetCameraX(100.0);
            Assert.Equal(100.0, CameraX());
        }
        [Fact]
        public void TestSetCameraYIntegration() {
            OpenWindow("Test Window 18", 800, 600);
            using var cleanupWindow = new WindowCleanup();
            SetCameraY(100.0);
            Assert.Equal(100.0, CameraY());
        }
        [Fact]
        public void TestToScreenPointIntegration() {
            OpenWindow("Test Window 19", 800, 600);
            using var cleanupWindow = new WindowCleanup();
            SetCameraPosition(PointAt(100.0, 100.0));
            var testScreenPoint = ToScreen(PointAt(150.0, 150.0));
            Assert.Equal(50.0, testScreenPoint.X);
            Assert.Equal(50.0, testScreenPoint.Y);
        }
        [Fact]
        public void TestToScreenRectangleIntegration() {
            OpenWindow("Test Window 20", 800, 600);
            using var cleanupWindow = new WindowCleanup();
            var testRectangle = RectangleFrom(100.0, 100.0, 200.0, 200.0);
            var screenRectangle = ToScreen(testRectangle);
            Assert.Equal(ToScreenX(100.0), RectangleLeft(screenRectangle));
            Assert.Equal(ToScreenY(100.0), RectangleTop(screenRectangle));
        }
        [Fact]
        public void TestToScreenXIntegration() {
            OpenWindow("Test Window 21", 800, 600);
            using var cleanupWindow = new WindowCleanup();
            SetCameraX(100.0);
            var testScreenX = ToScreenX(150.0);
            Assert.Equal(50.0, testScreenX);
        }
        [Fact]
        public void TestToScreenYIntegration() {
            OpenWindow("Test Window 22", 800, 600);
            using var cleanupWindow = new WindowCleanup();
            SetCameraY(100.0);
            var testScreenY = ToScreenY(150.0);
            Assert.Equal(50.0, testScreenY);
        }
        [Fact]
        public void TestToWorldIntegration() {
            OpenWindow("Test Window 23", 800, 600);
            using var cleanupWindow = new WindowCleanup();
            SetCameraPosition(PointAt(100.0, 100.0));
            var testWorldPoint = ToWorld(PointAt(400.0, 300.0));
            Assert.Equal(500.0, testWorldPoint.X);
            Assert.Equal(400.0, testWorldPoint.Y);
        }
        [Fact]
        public void TestToWorldXIntegration() {
            OpenWindow("Test Window 24", 800, 600);
            using var cleanupWindow = new WindowCleanup();
            SetCameraPosition(PointAt(100.0, 100.0));
            var testWorldX = ToWorldX(400.0);
            Assert.Equal(500.0, testWorldX);
        }
        [Fact]
        public void TestToWorldYIntegration() {
            OpenWindow("Test Window 25", 800, 600);
            using var cleanupWindow = new WindowCleanup();
            SetCameraPosition(PointAt(100.0, 100.0));
            var testWorldY = ToWorldY(300.0);
            Assert.Equal(400.0, testWorldY);
        }
        [Fact]
        public void TestVectorWorldToScreenIntegration() {
            var testVector1 = VectorWorldToScreen();
            Assert.Equal(VectorFromAngle(0.0, 0.0), testVector1);
            MoveCameraTo(100.0, 100.0);
            var testVector2 = VectorWorldToScreen();
            var testVectorTo = VectorTo(-100.0, -100.0);
            Assert.Equal(testVectorTo.X, testVector2.X);
            Assert.Equal(testVectorTo.Y, testVector2.Y);
        }
        [Fact]
        public void TestWindowAreaIntegration() {
            var testWindow = OpenWindow("Test Window 26", 800, 600);
            using var cleanupWindow = new WindowCleanup();
            var testArea = WindowArea(testWindow);
            Assert.Equal(800.0, testArea.Width);
            Assert.Equal(600.0, testArea.Height);
        }
    }
}
