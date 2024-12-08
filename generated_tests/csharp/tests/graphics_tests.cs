using Xunit;
using static SplashKitSDK.SplashKit;

namespace SplashKitTests
{
    public class IntegrationTests
    {
        [Fact]
        public void TestDrawCircleRecordIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testCircle = CircleAt(400.0, 300.0, 50.0);
            DrawCircle(ColorBlack(), testCircle);
            RefreshScreen();
            Assert.True(PointInCircle(PointAt(400.0, 300.0), testCircle));
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestDrawCircleRecordWithOptionsIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testCircle = CircleAt(400.0, 300.0, 50.0);
            DrawCircle(ColorBlack(), testCircle, OptionDefaults());
            RefreshScreen();
            Assert.True(PointInCircle(PointAt(400.0, 300.0), testCircle));
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestDrawCircleIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            DrawCircle(ColorBlack(), 400.0, 300.0, 50.0);
            RefreshScreen();
            Assert.True(PointInCircle(PointAt(400.0, 300.0), CircleAt(400.0, 300.0, 50.0)));
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestDrawCircleWithOptionsIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            DrawCircle(ColorBlack(), 400.0, 300.0, 50.0, OptionDefaults());
            RefreshScreen();
            Assert.True(PointInCircle(PointAt(400.0, 300.0), CircleAt(400.0, 300.0, 50.0)));
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestDrawCircleOnBitmapIntegration()
        {
            var testBitmap = CreateBitmap("test_bitmap", 200, 200);
            DrawCircleOnBitmap(testBitmap, ColorBlack(), 100.0, 100.0, 50.0);
            Assert.True(PixelDrawnAtPoint(testBitmap, 100.0, 100.0));
            FreeBitmap(testBitmap);
        }
        [Fact]
        public void TestDrawCircleOnBitmapWithOptionsIntegration()
        {
            var testBitmap = CreateBitmap("test_bitmap", 200, 200);
            DrawCircleOnBitmap(testBitmap, ColorBlack(), 100.0, 100.0, 50.0, OptionDefaults());
            Assert.True(PixelDrawnAtPoint(testBitmap, 100.0, 100.0));
            FreeBitmap(testBitmap);
        }
        [Fact]
        public void TestDrawCircleOnWindowIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            DrawCircleOnWindow(testWindow, ColorBlack(), 400.0, 300.0, 50.0);
            RefreshScreen();
            Assert.True(PointInCircle(PointAt(400.0, 300.0), CircleAt(400.0, 300.0, 50.0)));
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestDrawCircleOnWindowWithOptionsIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            DrawCircleOnWindow(testWindow, ColorBlack(), 400.0, 300.0, 50.0, OptionDefaults());
            RefreshScreen();
            Assert.True(PointInCircle(PointAt(400.0, 300.0), CircleAt(400.0, 300.0, 50.0)));
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestFillCircleRecordIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testCircle = CircleAt(400.0, 300.0, 50.0);
            FillCircle(ColorBlack(), testCircle);
            RefreshScreen();
            Assert.True(PointInCircle(PointAt(400.0, 300.0), testCircle));
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestFillCircleRecordWithOptionsIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testCircle = CircleAt(400.0, 300.0, 50.0);
            FillCircle(ColorBlack(), testCircle, OptionDefaults());
            RefreshScreen();
            Assert.True(PointInCircle(PointAt(400.0, 300.0), testCircle));
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestFillCircleIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            FillCircle(ColorBlack(), 400.0, 300.0, 50.0);
            RefreshScreen();
            Assert.True(PointInCircle(PointAt(400.0, 300.0), CircleAt(400.0, 300.0, 50.0)));
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestFillCircleWithOptionsIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            FillCircle(ColorBlack(), 400.0, 300.0, 50.0, OptionDefaults());
            RefreshScreen();
            Assert.True(PointInCircle(PointAt(400.0, 300.0), CircleAt(400.0, 300.0, 50.0)));
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestFillCircleOnBitmapIntegration()
        {
            var testBitmap = CreateBitmap("test_bitmap", 200, 200);
            FillCircleOnBitmap(testBitmap, ColorRed(), 100.0, 100.0, 50.0);
            Assert.True(PixelDrawnAtPoint(testBitmap, 100.0, 100.0));
            Assert.True(PixelDrawnAtPoint(testBitmap, 150.0, 100.0));
            Assert.False(PixelDrawnAtPoint(testBitmap, 200.0, 100.0));
            FreeBitmap(testBitmap);
        }
        [Fact]
        public void TestFillCircleOnBitmapWithOptionsIntegration()
        {
            var testBitmap = CreateBitmap("test_bitmap", 200, 200);
            FillCircleOnBitmap(testBitmap, ColorBlack(), 100.0, 100.0, 50.0, OptionDefaults());
            Assert.True(PixelDrawnAtPoint(testBitmap, 100.0, 100.0));
            Assert.True(PixelDrawnAtPoint(testBitmap, 150.0, 100.0));
            Assert.False(PixelDrawnAtPoint(testBitmap, 200.0, 100.0));
            FreeBitmap(testBitmap);
        }
        [Fact]
        public void TestFillCircleOnWindowIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            FillCircleOnWindow(testWindow, ColorBlack(), 400.0, 300.0, 50.0);
            RefreshScreen();
            Assert.True(PointInCircle(PointAt(400.0, 300.0), CircleAt(400.0, 300.0, 50.0)));
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestFillCircleOnWindowWithOptionsIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            FillCircleOnWindow(testWindow, ColorBlack(), 400.0, 300.0, 50.0, OptionDefaults());
            RefreshScreen();
            Assert.True(PointInCircle(PointAt(400.0, 300.0), CircleAt(400.0, 300.0, 50.0)));
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestCurrentClipIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testClip = CurrentClip();
            Assert.Equal(testClip.Width, 800);
            Assert.Equal(testClip.Height, 600);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestCurrentClipForBitmapIntegration()
        {
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testRectangle = RectangleFrom(10, 10, 50, 50);
            PushClip(testBitmap, testRectangle);
            var testClip = CurrentClip(testBitmap);
            Assert.Equal(RectangleLeft(testClip), 10);
            Assert.Equal(RectangleTop(testClip), 10);
            Assert.Equal(testClip.Width, 50);
            Assert.Equal(testClip.Height, 50);
            FreeBitmap(testBitmap);
        }
        [Fact]
        public void TestCurrentClipForWindowIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testClip = CurrentClip(testWindow);
            Assert.Equal(RectangleFrom(0, 0, 800, 600), testClip);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestPopClipForWindowIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testRectangle = RectangleFrom(100, 100, 200, 200);
            PushClip(testWindow, testRectangle);
            var testCurrentClip = CurrentClip(testWindow);
            Assert.Equal(testCurrentClip, testRectangle);
            PopClip(testWindow);
            var testCurrentClipAfterPop = CurrentClip(testWindow);
            Assert.Equal(RectangleFrom(0, 0, 800, 600), testCurrentClipAfterPop);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestPopClipIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            PushClip(RectangleFrom(100, 100, 200, 200));
            DrawCircle(ColorBlack(), 150, 150, 50);
            RefreshScreen();
            Assert.True(PointInCircle(PointAt(150, 150), CircleAt(150, 150, 50)));
            PopClip();
            DrawCircle(ColorRed(), 300, 300, 50);
            RefreshScreen();
            Assert.True(PointInCircle(PointAt(300, 300), CircleAt(300, 300, 50)));
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestPopClipForBitmapIntegration()
        {
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            PushClip(testBitmap, RectangleFrom(0, 0, 50, 50));
            PopClip(testBitmap);
            Assert.Equal(CurrentClip(testBitmap), RectangleFrom(0, 0, 100, 100));
            FreeBitmap(testBitmap);
        }
        [Fact]
        public void TestPushClipForWindowIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testRectangle = RectangleFrom(100.0, 100.0, 200.0, 200.0);
            PushClip(testWindow, testRectangle);
            var testCurrentClip = CurrentClip(testWindow);
            Assert.Equal(testCurrentClip, testRectangle);
            RefreshScreen();
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestPushClipForBitmapIntegration()
        {
            var testBitmap = CreateBitmap("test_bitmap", 200, 200);
            var testRectangle = RectangleFrom(50, 50, 100, 100);
            PushClip(testBitmap, testRectangle);
            var testCurrentClip = CurrentClip(testBitmap);
            Assert.Equal(RectangleLeft(testCurrentClip), 50);
            Assert.Equal(RectangleTop(testCurrentClip), 50);
            Assert.Equal(testCurrentClip.Width, 100);
            Assert.Equal(testCurrentClip.Height, 100);
            FreeBitmap(testBitmap);
        }
        [Fact]
        public void TestPushClipIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testRectangle = RectangleFrom(100.0, 100.0, 200.0, 200.0);
            PushClip(testRectangle);
            var testCurrentClip = CurrentClip();
            Assert.Equal(testCurrentClip, testRectangle);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestResetClipForBitmapIntegration()
        {
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            PushClip(testBitmap, RectangleFrom(10, 10, 50, 50));
            ResetClip(testBitmap);
            Assert.Equal(CurrentClip(testBitmap), RectangleFrom(0, 0, 100, 100));
            FreeBitmap(testBitmap);
        }
        [Fact]
        public void TestResetClipIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            PushClip(RectangleFrom(100, 100, 200, 200));
            ResetClip();
            var testClipRect = CurrentClip();
            Assert.Equal(RectangleFrom(0, 0, 800, 600), testClipRect);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestResetClipForWindowIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            PushClip(testWindow, RectangleFrom(100, 100, 200, 200));
            ResetClip(testWindow);
            var testClipRect = CurrentClip(testWindow);
            Assert.Equal(RectangleFrom(0, 0, 800, 600), testClipRect);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestSetClipIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testRectangle = RectangleFrom(100.0, 100.0, 200.0, 200.0);
            SetClip(testRectangle);
            var testCurrentClip = CurrentClip();
            Assert.Equal(testCurrentClip, testRectangle);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestSetClipForBitmapIntegration()
        {
            var testBitmap = CreateBitmap("test_bitmap", 200, 200);
            var testRectangle = RectangleFrom(50, 50, 100, 100);
            SetClip(testBitmap, testRectangle);
            var testCurrentClip = CurrentClip(testBitmap);
            Assert.Equal(testCurrentClip, testRectangle);
            FreeBitmap(testBitmap);
        }
        [Fact]
        public void TestSetClipForWindowIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testRectangle = RectangleFrom(100, 100, 200, 200);
            SetClip(testWindow, testRectangle);
            var testCurrentClip = CurrentClip(testWindow);
            Assert.Equal(testCurrentClip, testRectangle);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestOptionDefaultsIntegration()
        {
            var testOptions = OptionDefaults();
            Assert.NotNull(testOptions);
        }
        [Fact]
        public void TestOptionDrawToBitmapIntegration()
        {
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testOptions = OptionDrawTo(testBitmap);
            DrawCircle(ColorBlack(), CircleAt(50.0, 50.0, 25.0), testOptions);
            Assert.True(PixelDrawnAtPoint(testBitmap, 50.0, 50.0));
            Assert.False(PixelDrawnAtPoint(testBitmap, 100.0, 100.0));
            FreeBitmap(testBitmap);
        }
        [Fact]
        public void TestOptionDrawToBitmapWithOptionsIntegration()
        {
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testOptions = OptionDefaults();
            var testDrawingOptions = OptionDrawTo(testBitmap, testOptions);
            DrawCircle(ColorBlack(), CircleAt(50.0, 50.0, 25.0), testDrawingOptions);
            Assert.True(PixelDrawnAtPoint(testBitmap, 50.0, 50.0));
            Assert.False(PixelDrawnAtPoint(testBitmap, 100.0, 100.0));
            FreeBitmap(testBitmap);
        }
        [Fact]
        public void TestOptionDrawToWindowIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testCircle = CircleAt(400.0, 300.0, 50.0);
            DrawCircle(ColorBlack(), testCircle, OptionDrawTo(testWindow));
            RefreshScreen();
            Assert.True(PointInCircle(PointAt(400.0, 300.0), testCircle));
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestOptionDrawToWindowWithOptionsIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testOptions = OptionDefaults();
            var testDrawOptions = OptionDrawTo(testWindow, testOptions);
            DrawCircle(ColorBlack(), CircleAt(400.0, 300.0, 50.0), testDrawOptions);
            RefreshScreen();
            Assert.True(PointInCircle(PointAt(400.0, 300.0), CircleAt(400.0, 300.0, 50.0)));
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestOptionFlipXIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = LoadBitmap("test_bitmap", "test_bitmap.png");
            DrawBitmap(testBitmap, 100.0, 100.0, OptionFlipX());
            RefreshScreen();
            Assert.True(PixelDrawnAtPoint(testBitmap, PointAt(50.0, 100.0)));
            Assert.False(PixelDrawnAtPoint(testBitmap, PointAt(150.0, 100.0)));
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestOptionFlipXWithOptionsIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = LoadBitmap("test_bitmap", "test_bitmap.png");
            DrawBitmap(testBitmap, 400, 300, OptionFlipX(OptionDefaults()));
            RefreshScreen();
            Assert.True(PixelDrawnAtPoint(testBitmap, PointAt(BitmapWidth(testBitmap), BitmapHeight(testBitmap))));
            Assert.False(PixelDrawnAtPoint(testBitmap, PointAt(0, BitmapHeight(testBitmap))));
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestOptionFlipXyIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = LoadBitmap("test_bitmap", "test_bitmap.png");
            DrawBitmap(testBitmap, 400.0, 300.0, OptionFlipXy());
            RefreshScreen();
            Assert.True(PixelDrawnAtPoint(testBitmap, PointAt(BitmapWidth(testBitmap), 0.0)));
            Assert.True(PixelDrawnAtPoint(testBitmap, PointAt(0.0, BitmapHeight(testBitmap))));
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestOptionFlipXyWithOptionsIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = LoadBitmap("test_bitmap", "test_bitmap.png");
            var testOptions = OptionDefaults();
            var testOptionsFlipped = OptionFlipXy(testOptions);
            DrawBitmap(testBitmap, 400, 300, testOptionsFlipped);
            RefreshScreen();
            Assert.True(PixelDrawnAtPoint(testBitmap, PointAt(BitmapWidth(testBitmap), 0)));
            Assert.False(PixelDrawnAtPoint(testBitmap, PointAt(0, BitmapHeight(testBitmap))));
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestOptionFlipYIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = LoadBitmap("test_bitmap", "test_bitmap.png");
            DrawBitmap(testBitmap, 400.0, 300.0, OptionFlipY());
            RefreshScreen();
            Assert.True(PixelDrawnAtPoint(testBitmap, 400.0, BitmapHeight(testBitmap)));
            Assert.False(PixelDrawnAtPoint(testBitmap, 400.0, 0.0));
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestOptionFlipYWithOptionsIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = LoadBitmap("test_bitmap", "test_bitmap.png");
            DrawBitmap(testBitmap, 400.0, 300.0, OptionFlipY(OptionDefaults()));
            RefreshScreen();
            Assert.True(PixelDrawnAtPoint(testBitmap, PointAt(400.0, BitmapHeight(testBitmap))));
            Assert.False(PixelDrawnAtPoint(testBitmap, PointAt(400.0, 0.0)));
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestOptionLineWidthIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            DrawLine(ColorBlack(), 100.0, 100.0, 200.0, 200.0, OptionLineWidth(1));
            RefreshScreen();
            Assert.Equal(GetPixel(PointAt(100.0, 100.0)), ColorBlack());
            DrawLine(ColorBlack(), 300.0, 300.0, 400.0, 400.0, OptionLineWidth(5));
            RefreshScreen();
            Assert.Equal(GetPixel(PointAt(300.0, 300.0)), ColorBlack());
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestOptionLineWidthWithOptionsIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testCircle = CircleAt(400.0, 300.0, 50.0);
            DrawCircle(ColorBlack(), testCircle, OptionLineWidth(3, OptionDefaults()));
            RefreshScreen();
            Assert.True(PointInCircle(PointAt(400.0, 300.0), testCircle));
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestOptionPartBmpIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = LoadBitmap("test_bitmap", "test_bitmap.png");
            var testOptions = OptionPartBmp(0.0, 0.0, 50.0, 50.0);
            DrawBitmap(testBitmap, 100.0, 100.0, testOptions);
            RefreshScreen();
            Assert.True(PixelDrawnAtPoint(testBitmap, PointAt(25.0, 25.0)));
            Assert.False(PixelDrawnAtPoint(testBitmap, PointAt(75.0, 75.0)));
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestOptionPartBmpWithOptionsIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = LoadBitmap("test_bitmap", "test_bitmap.png");
            var testOptions = OptionPartBmp(10.0, 10.0, 50.0, 50.0, OptionDefaults());
            DrawBitmap(testBitmap, 100.0, 100.0, testOptions);
            RefreshScreen();
            Assert.True(PixelDrawnAtPoint(testBitmap, PointAt(110.0, 110.0)));
            Assert.False(PixelDrawnAtPoint(testBitmap, PointAt(160.0, 160.0)));
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestOptionPartBmpFromRectangleIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = LoadBitmap("test_bitmap", "test_bitmap.png");
            var testRectangle = RectangleFrom(100, 100, 200, 200);
            var testOptions = OptionPartBmp(testRectangle);
            DrawBitmap(testBitmap, 0, 0, testOptions);
            RefreshScreen();
            Assert.True(PixelDrawnAtPoint(testBitmap, PointAt(150, 150)));
            Assert.False(PixelDrawnAtPoint(testBitmap, PointAt(350, 350)));
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestOptionPartBmpFromRectangleWithOptionsIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = LoadBitmap("test_bitmap", "test_bitmap.png");
            var testRectangle = RectangleFrom(100.0, 100.0, 200.0, 200.0);
            var testOptions = OptionPartBmp(testRectangle, OptionDefaults());
            DrawBitmap(testBitmap, 0.0, 0.0, testOptions);
            RefreshScreen();
            Assert.True(PixelDrawnAtPoint(testBitmap, PointAt(150.0, 150.0)));
            Assert.False(PixelDrawnAtPoint(testBitmap, PointAt(350.0, 350.0)));
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestOptionRotateBmpIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = LoadBitmap("test_bitmap", "test_bitmap.png");
            DrawBitmap(testBitmap, 400.0, 300.0, OptionRotateBmp(45.0));
            RefreshScreen();
            Assert.True(PixelDrawnAtPoint(testBitmap, PointAt(400.0, 300.0)));
            Assert.False(PixelDrawnAtPoint(testBitmap, PointAt(BitmapWidth(testBitmap), 300.0)));
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestOptionRotateBmpWithAnchorIntegration()
        {
            var testWindow = OpenWindow("Rotation Test", 800, 600);
            var testBitmap = LoadBitmap("test_bitmap", "test_bitmap.png");
            var testOptions = OptionRotateBmp(45.0, 50.0, 50.0);
            DrawBitmap(testBitmap, 400.0, 300.0, testOptions);
            RefreshScreen();
            Assert.True(PixelDrawnAtPoint(testBitmap, PointAt(400.0, 300.0)));
            Assert.True(PixelDrawnAtPoint(testBitmap, PointAt(BitmapWidth(testBitmap), BitmapHeight(testBitmap))));
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestOptionRotateBmpWithAnchorAndOptionsIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = LoadBitmap("test_bitmap", "test_bitmap.png");
            var testOptions = OptionRotateBmp(45.0, 50.0, 50.0, OptionDefaults());
            DrawBitmap(testBitmap, 400.0, 300.0, testOptions);
            RefreshScreen();
            Assert.True(PixelDrawnAtPoint(testBitmap, PointAt(400.0, 300.0)));
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestOptionRotateBmpWithOptionsIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = LoadBitmap("test_bitmap", "test_bitmap.png");
            var testOptions = OptionRotateBmp(45.0, OptionDefaults());
            DrawBitmap(testBitmap, 400.0, 300.0, testOptions);
            RefreshScreen();
            Assert.True(PixelDrawnAtPoint(testBitmap, PointAt(400.0, 300.0)));
            Assert.True(PixelDrawnAtPoint(testBitmap, PointAt(Cosine(45.0), Sine(45.0))));
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestOptionScaleBmpIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = LoadBitmap("test_bitmap", "test_bitmap.png");
            DrawBitmap(testBitmap, 100.0, 100.0, OptionScaleBmp(2.0, 2.0));
            RefreshScreen();
            Assert.True(PixelDrawnAtPoint(testBitmap, PointAt(100.0, 100.0)));
            Assert.True(PixelDrawnAtPoint(testBitmap, PointAt(BitmapWidth(testBitmap), BitmapHeight(testBitmap))));
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestOptionScaleBmpWithOptionsIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = LoadBitmap("test_bitmap", "test_bitmap.png");
            var testOptions = OptionScaleBmp(2.0, 2.0, OptionDefaults());
            DrawBitmap(testBitmap, 100.0, 100.0, testOptions);
            RefreshScreen();
            Assert.True(PixelDrawnAtPoint(testBitmap, PointAt(100.0, 100.0)));
            Assert.True(PixelDrawnAtPoint(testBitmap, PointAt(BitmapWidth(testBitmap), BitmapHeight(testBitmap))));
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestOptionToScreenIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testOptions = OptionToScreen();
            DrawCircle(ColorBlack(), CircleAt(400.0, 300.0, 50.0), testOptions);
            RefreshScreen();
            Assert.True(PointInCircle(PointAt(400.0, 300.0), CircleAt(400.0, 300.0, 50.0)));
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestOptionToScreenWithOptionsIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testOptions = OptionDefaults();
            var testScreenOptions = OptionToScreen(testOptions);
            DrawCircle(ColorBlack(), CircleAt(400.0, 300.0, 50.0), testScreenOptions);
            RefreshScreen();
            Assert.True(PointInCircle(PointAt(400.0, 300.0), CircleAt(400.0, 300.0, 50.0)));
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestOptionToWorldIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            MoveCameraTo(100.0, 100.0);
            DrawCircle(ColorBlack(), 100.0, 100.0, 50.0, OptionToWorld());
            RefreshScreen();
            Assert.True(PointInCircle(PointAt(0.0, 0.0), CircleAt(100.0, 100.0, 50.0)));
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestOptionToWorldWithOptionsIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testOptions = OptionDefaults();
            var testWorldOptions = OptionToWorld(testOptions);
            DrawCircle(ColorBlack(), CircleAt(100.0, 100.0, 50.0), testWorldOptions);
            RefreshScreen();
            Assert.True(PointInCircle(PointAt(100.0, 100.0), CircleAt(100.0, 100.0, 50.0)));
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestOptionWithAnimationIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testAnimation = CreateAnimation("script", "test_animation");
            DrawBitmap(testBitmap, 100, 100, OptionWithAnimation(testAnimation));
            DrawBitmap(testBitmap, 100.0, 100.0, OptionWithAnimation(testAnimation));
            RefreshScreen();
            Assert.True(PixelDrawnAtPoint(testBitmap, PointAt(50.0, 50.0)));
            FreeBitmap(testBitmap);
            FreeAnimation(testAnimation);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestOptionWithAnimationWithOptionsIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = LoadBitmap("test_bitmap", "test_bitmap.png");
            var testAnimation = CreateAnimation("script", "test_animation");
            DrawBitmap(testBitmap, 100, 100, OptionWithAnimation(testAnimation));
            var testOptions = OptionWithAnimation(testAnimation, OptionDefaults());
            DrawBitmap(testBitmap, 100.0, 100.0, testOptions);
            RefreshScreen();
            Assert.True(PixelDrawnAtPoint(testBitmap, PointAt(100.0, 100.0)));
            FreeBitmap(testBitmap);
            FreeAnimation(testAnimation);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestOptionWithBitmapCellIntegration()
        {
            var testBitmap = LoadBitmap("test_bitmap", "test_bitmap.png");
            BitmapSetCellDetails(testBitmap, 32, 32, 4, 4, 16);
            var testWindow = OpenWindow("Test Window", 800, 600);
            DrawBitmap(testBitmap, 100.0, 100.0, OptionWithBitmapCell(5));
            RefreshScreen();
            Assert.True(PixelDrawnAtPoint(testBitmap, PointAt(116.0, 116.0)));
            Assert.False(PixelDrawnAtPoint(testBitmap, PointAt(150.0, 150.0)));
            CloseWindow(testWindow);
            FreeBitmap(testBitmap);
        }
        [Fact]
        public void TestOptionWithBitmapCellWithOptionsIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = LoadBitmap("test_bitmap", "test_bitmap.png");
            BitmapSetCellDetails(testBitmap, 32, 32, 4, 4, 16);
            var testOptions = OptionWithBitmapCell(5, OptionDefaults());
            DrawBitmap(testBitmap, 100.0, 100.0, testOptions);
            RefreshScreen();
            Assert.True(PixelDrawnAtPoint(testBitmap, PointAt(116.0, 116.0)));
            Assert.False(PixelDrawnAtPoint(testBitmap, PointAt(150.0, 150.0)));
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestDrawEllipseWithinRectangleIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testRectangle = RectangleFrom(100.0, 100.0, 200.0, 150.0);
            DrawEllipse(ColorBlack(), testRectangle, OptionDefaults());
            RefreshScreen();
            Assert.True(PointInCircle(PointAt(200.0, 175.0), CircleAt(RectangleCenter(testRectangle), testRectangle.Width)));
            Assert.False(PointInCircle(PointAt(350.0, 175.0), CircleAt(RectangleCenter(testRectangle), testRectangle.Width)));
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestDrawEllipseWithinRectangleWithOptionsIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testRectangle = RectangleFrom(100.0, 100.0, 200.0, 100.0);
            DrawEllipse(ColorBlack(), testRectangle, OptionDefaults());
            RefreshScreen();
            Assert.True(PointInCircle(PointAt(200.0, 150.0), CircleAt(RectangleCenter(testRectangle), testRectangle.Width)));
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestDrawEllipseIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            DrawEllipse(ColorBlack(), 400.0, 300.0, 100.0, 50.0);
            RefreshScreen();
            Assert.True(PointInCircle(PointAt(400.0, 300.0), CircleAt(400.0, 300.0, 50.0)));
            Assert.False(PointInCircle(PointAt(550.0, 300.0), CircleAt(400.0, 300.0, 50.0)));
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestDrawEllipseWithOptionsIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            DrawEllipse(ColorBlack(), 400.0, 300.0, 100.0, 50.0, OptionDefaults());
            RefreshScreen();
            Assert.True(PointInCircle(PointAt(400.0, 300.0), CircleAt(400.0, 300.0, 50.0)));
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestDrawEllipseOnBitmapWithinRectangleIntegration()
        {
            var testBitmap = CreateBitmap("test_bitmap", 200, 200);
            var testRectangle = RectangleFrom(50.0, 50.0, 100.0, 100.0);
            DrawEllipseOnBitmap(testBitmap, ColorBlack(), testRectangle);
            Assert.True(PixelDrawnAtPoint(testBitmap, PointAt(100.0, 100.0)));
            Assert.False(PixelDrawnAtPoint(testBitmap, PointAt(200.0, 200.0)));
            FreeBitmap(testBitmap);
        }
        [Fact]
        public void TestDrawEllipseOnBitmapWithinRectangleWithOptionsIntegration()
        {
            var testBitmap = CreateBitmap("test_bitmap", 200, 200);
            var testRect = RectangleFrom(50.0, 50.0, 100.0, 100.0);
            DrawEllipseOnBitmap(testBitmap, ColorBlack(), testRect, OptionDefaults());
            Assert.True(PixelDrawnAtPoint(testBitmap, PointAt(75.0, 75.0)));
            Assert.False(PixelDrawnAtPoint(testBitmap, PointAt(0.0, 0.0)));
            FreeBitmap(testBitmap);
        }
        [Fact]
        public void TestDrawEllipseOnBitmapIntegration()
        {
            var testBitmap = CreateBitmap("test_bitmap", 200, 200);
            var testColor = ColorBlack();
            DrawEllipseOnBitmap(testBitmap, testColor, 100.0, 100.0, 50.0, 30.0);
            Assert.True(PixelDrawnAtPoint(testBitmap, 100.0, 100.0));
            Assert.False(PixelDrawnAtPoint(testBitmap, 160.0, 100.0));
            FreeBitmap(testBitmap);
        }
        [Fact]
        public void TestDrawEllipseOnBitmapWithOptionsIntegration()
        {
            var testBitmap = CreateBitmap("test_bitmap", 200, 200);
            DrawEllipseOnBitmap(testBitmap, ColorBlack(), 100.0, 100.0, 50.0, 30.0, OptionDefaults());
            Assert.True(PixelDrawnAtPoint(testBitmap, PointAt(100.0, 100.0)));
            Assert.False(PixelDrawnAtPoint(testBitmap, PointAt(150.0, 100.0)));
            FreeBitmap(testBitmap);
        }
        [Fact]
        public void TestDrawEllipseOnWindowWithinRectangleIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testRectangle = RectangleFrom(100.0, 100.0, 200.0, 100.0);
            DrawEllipseOnWindow(testWindow, ColorBlack(), testRectangle);
            RefreshScreen();
            Assert.True(PointInCircle(PointAt(200.0, 150.0), CircleAt(RectangleCenter(testRectangle), testRectangle.Width)));
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestDrawEllipseOnWindowWithinRectangleWithOptionsIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testRect = RectangleFrom(100.0, 100.0, 200.0, 100.0);
            DrawEllipseOnWindow(testWindow, ColorBlack(), testRect, OptionDefaults());
            RefreshScreen();
            Assert.True(PointInCircle(PointAt(200.0, 150.0), CircleAt(PointAt(200.0, 150.0), 100.0)));
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestDrawEllipseOnWindowIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            DrawEllipseOnWindow(testWindow, ColorBlack(), 400.0, 300.0, 100.0, 50.0);
            RefreshScreen();
            Assert.True(PointInCircle(PointAt(400.0, 300.0), CircleAt(400.0, 300.0, 50.0)));
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestDrawEllipseOnWindowWithOptionsIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            DrawEllipseOnWindow(testWindow, ColorBlack(), 400.0, 300.0, 100.0, 50.0, OptionDefaults());
            RefreshScreen();
            Assert.True(PointInCircle(PointAt(400.0, 300.0), CircleAt(400.0, 300.0, 50.0)));
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestFillEllipseWithinRectangleIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testRectangle = RectangleFrom(100.0, 100.0, 200.0, 100.0);
            FillEllipse(ColorBlack(), testRectangle);
            RefreshScreen();
            Assert.True(PointInCircle(PointAt(200.0, 150.0), CircleAt(RectangleCenter(testRectangle), testRectangle.Width)));
            Assert.False(PointInCircle(PointAt(350.0, 150.0), CircleAt(RectangleCenter(testRectangle), testRectangle.Width)));
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestFillEllipseWithinRectangleWithOptionsIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testRectangle = RectangleFrom(100.0, 100.0, 200.0, 100.0);
            FillEllipse(ColorBlack(), testRectangle, OptionDefaults());
            RefreshScreen();
            Assert.True(PointInCircle(PointAt(200.0, 150.0), CircleAt(RectangleCenter(testRectangle), testRectangle.Width)));
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestFillEllipseIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            FillEllipse(ColorBlack(), 400.0, 300.0, 100.0, 50.0);
            RefreshScreen();
            Assert.True(PointInCircle(PointAt(400.0, 300.0), CircleAt(400.0, 300.0, 50.0)));
            Assert.False(PointInCircle(PointAt(550.0, 300.0), CircleAt(400.0, 300.0, 50.0)));
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestFillEllipseWithOptionsIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            FillEllipse(ColorBlack(), 400.0, 300.0, 100.0, 50.0, OptionDefaults());
            RefreshScreen();
            Assert.True(PointInCircle(PointAt(400.0, 300.0), CircleAt(400.0, 300.0, 50.0)));
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestFillEllipseOnBitmapWithinRectangleIntegration()
        {
            var testBitmap = CreateBitmap("test_bitmap", 200, 200);
            var testRectangle = RectangleFrom(50.0, 50.0, 100.0, 100.0);
            FillEllipseOnBitmap(testBitmap, ColorBlack(), testRectangle);
            Assert.True(PixelDrawnAtPoint(testBitmap, PointAt(100.0, 100.0)));
            Assert.False(PixelDrawnAtPoint(testBitmap, PointAt(200.0, 200.0)));
            FreeBitmap(testBitmap);
        }
        [Fact]
        public void TestFillEllipseOnBitmapWithinRectangleWithOptionsIntegration()
        {
            var testBitmap = CreateBitmap("test_bitmap", 200, 200);
            var testRect = RectangleFrom(50.0, 50.0, 100.0, 100.0);
            FillEllipseOnBitmap(testBitmap, ColorBlack(), testRect, OptionDefaults());
            Assert.True(PixelDrawnAtPoint(testBitmap, PointAt(100.0, 100.0)));
            Assert.False(PixelDrawnAtPoint(testBitmap, PointAt(200.0, 100.0)));
            FreeBitmap(testBitmap);
        }
        [Fact]
        public void TestFillEllipseOnBitmapIntegration()
        {
            var testBitmap = CreateBitmap("test_bitmap", 200, 200);
            FillEllipseOnBitmap(testBitmap, ColorBlack(), 100.0, 100.0, 50.0, 30.0);
            Assert.True(PixelDrawnAtPoint(testBitmap, 100.0, 100.0));
            Assert.True(PixelDrawnAtPoint(testBitmap, 125.0, 100.0));
            Assert.False(PixelDrawnAtPoint(testBitmap, 150.0, 100.0));
            FreeBitmap(testBitmap);
        }
        [Fact]
        public void TestFillEllipseOnBitmapWithOptionsIntegration()
        {
            var testBitmap = CreateBitmap("test_bitmap", 200, 200);
            FillEllipseOnBitmap(testBitmap, ColorBlack(), 50.0, 50.0, 100.0, 50.0, OptionDefaults());
            Assert.True(PixelDrawnAtPoint(testBitmap, 50.0, 50.0));
            Assert.False(PixelDrawnAtPoint(testBitmap, 150.0, 50.0));
            FreeBitmap(testBitmap);
        }
        [Fact]
        public void TestFillEllipseOnWindowWithinRectangleIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testRectangle = RectangleFrom(100.0, 100.0, 200.0, 150.0);
            FillEllipseOnWindow(testWindow, ColorBlack(), testRectangle);
            RefreshScreen();
            Assert.True(PointInCircle(PointAt(200.0, 175.0), CircleAt(RectangleCenter(testRectangle), testRectangle.Width)));
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestFillEllipseOnWindowWithinRectangleWithOptionsIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testRectangle = RectangleFrom(100.0, 100.0, 200.0, 150.0);
            FillEllipseOnWindow(testWindow, ColorBlack(), testRectangle, OptionDefaults());
            RefreshScreen();
            Assert.True(PointInCircle(PointAt(200.0, 175.0), CircleAt(200.0, 175.0, 100.0)));
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestFillEllipseOnWindowIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            FillEllipseOnWindow(testWindow, ColorBlack(), 400.0, 300.0, 100.0, 50.0);
            RefreshScreen();
            Assert.True(PointInCircle(PointAt(400.0, 300.0), CircleAt(400.0, 300.0, 50.0)));
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestFillEllipseOnWindowWithOptionsIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            FillEllipseOnWindow(testWindow, ColorBlack(), 400.0, 300.0, 100.0, 50.0, OptionDefaults());
            RefreshScreen();
            Assert.True(PointInCircle(PointAt(400.0, 300.0), CircleAt(400.0, 300.0, 50.0)));
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestClearScreenToWhiteIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            DrawPixel(ColorBlack(), 100.0, 100.0);
            RefreshScreen();
            Assert.Equal(GetPixel(PointAt(100.0, 100.0)), ColorBlack());
            ClearScreen();
            RefreshScreen();
            Assert.NotEqual(GetPixel(PointAt(100.0, 100.0)), ColorBlack());
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestClearScreenIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            DrawPixel(ColorBlack(), 100.0, 100.0);
            RefreshScreen();
            Assert.Equal(GetPixel(PointAt(400.0, 300.0)), ColorBlack());
            ClearScreen(ColorWhite());
            RefreshScreen();
            Assert.NotEqual(GetPixel(PointAt(400.0, 300.0)), ColorBlack());
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestDisplayDetailsIntegration()
        {
            var testNumberOfDisplays = NumberOfDisplays();
            Assert.True(testNumberOfDisplays > 0);
            var testDisplay = DisplayDetails(0);
            Assert.NotNull(testDisplay);
            Assert.True(DisplayWidth(testDisplay) > 0);
            Assert.True(DisplayHeight(testDisplay) > 0);
            Assert.Equal(testNumberOfDisplays, 0);
        }
        [Fact]
        public void TestDisplayHeightIntegration()
        {
            var testDisplay = DisplayDetails(0);
            var testHeight = DisplayHeight(testDisplay);
            Assert.True(testHeight > 0);
        }
        [Fact]
        public void TestDisplayNameIntegration()
        {
            var testDisplay = DisplayDetails(0);
            var testDisplayName = DisplayName(testDisplay);
            Assert.NotNull(testDisplayName);
        }
        [Fact]
        public void TestDisplayWidthIntegration()
        {
            var testDisplay = DisplayDetails(0);
            var testWidth = DisplayWidth(testDisplay);
            Assert.True(testWidth > 0);
        }
        [Fact]
        public void TestDisplayXIntegration()
        {
            var testDisplay = DisplayDetails(0);
            var testX = DisplayX(testDisplay);
            Assert.True(testX > -1);
        }
        [Fact]
        public void TestDisplayYIntegration()
        {
            var testDisplay = DisplayDetails(0);
            var testY = DisplayY(testDisplay);
            Assert.NotEqual(testY, -1);
        }
        [Fact]
        public void TestNumberOfDisplaysIntegration()
        {
            var testDisplayCount = NumberOfDisplays();
            Assert.True(testDisplayCount > 0);
        }
        [Fact]
        public void TestRefreshScreenIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            DrawCircle(ColorBlack(), CircleAt(400.0, 300.0, 50.0));
            RefreshScreen();
            Assert.True(PointInCircle(PointAt(400.0, 300.0), CircleAt(400.0, 300.0, 50.0)));
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestRefreshScreenWithTargetFpsIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            RefreshScreen(60);
            Assert.True(WindowCloseRequested(testWindow));
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestSaveBitmapIntegration()
        {
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            DrawPixelOnBitmap(testBitmap, ColorBlack(), 50, 50);
            SaveBitmap(testBitmap, "test_save");
            FreeBitmap(testBitmap);
        }
        [Fact]
        public void TestScreenHeightIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testHeight = ScreenHeight();
            Assert.Equal(testHeight, 600);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestScreenWidthIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testWidth = ScreenWidth();
            Assert.Equal(testWidth, 800);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestTakeScreenshotIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            DrawCircle(ColorBlack(), 400, 300, 50);
            RefreshScreen();
            TakeScreenshot("screenshot_test");
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestTakeScreenshotOfWindowIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            DrawCircle(ColorBlack(), 400, 300, 50);
            RefreshScreen();
            TakeScreenshot(testWindow, "screenshot_test");
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestBitmapBoundingCircleIntegration()
        {
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testPoint = PointAt(50.0, 50.0);
            var testCircle = BitmapBoundingCircle(testBitmap, testPoint);
            Assert.Equal(CircleRadius(testCircle), 50.0);
            Assert.Equal(CenterPoint(testCircle), testPoint);
            FreeBitmap(testBitmap);
        }
        [Fact]
        public void TestBitmapBoundingRectangleIntegration()
        {
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testRectangle = BitmapBoundingRectangle(testBitmap);
            Assert.Equal(testRectangle.Width, BitmapWidth(testBitmap));
            Assert.Equal(testRectangle.Height, BitmapHeight(testBitmap));
            FreeBitmap(testBitmap);
        }
        [Fact]
        public void TestBitmapBoundingRectangleAtLocationIntegration()
        {
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testRectangle = BitmapBoundingRectangle(testBitmap, 50.0, 50.0);
            Assert.Equal(RectangleLeft(testRectangle), 50.0);
            Assert.Equal(RectangleTop(testRectangle), 50.0);
            Assert.Equal(RectangleRight(testRectangle), 150.0);
            Assert.Equal(RectangleBottom(testRectangle), 150.0);
            FreeBitmap(testBitmap);
        }
        [Fact]
        public void TestBitmapCellCenterIntegration()
        {
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testCenter = BitmapCellCenter(testBitmap);
            Assert.Equal(testCenter.X, 50.0);
            Assert.Equal(testCenter.Y, 50.0);
            FreeBitmap(testBitmap);
        }
        [Fact]
        public void TestBitmapCellCircleIntegration()
        {
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testCircle = BitmapCellCircle(testBitmap, 50.0, 50.0);
            Assert.Equal(CircleRadius(testCircle), 50.0);
            Assert.Equal(CircleX(testCircle), 50.0);
            Assert.Equal(CircleY(testCircle), 50.0);
            FreeBitmap(testBitmap);
        }
        [Fact]
        public void TestBitmapCellCircleAtPointIntegration()
        {
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            BitmapSetCellDetails(testBitmap, 50, 50, 2, 2, 4);
            var testCircle = BitmapCellCircle(testBitmap, PointAt(100, 100));
            Assert.Equal(CircleX(testCircle), 125);
            Assert.Equal(CircleY(testCircle), 125);
            Assert.Equal(CircleRadius(testCircle), 25);
            FreeBitmap(testBitmap);
        }
        [Fact]
        public void TestBitmapCellCircleAtPointWithScaleIntegration()
        {
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            BitmapSetCellDetails(testBitmap, 50, 50, 2, 2, 4);
            var testCircle = BitmapCellCircle(testBitmap, PointAt(100.0, 100.0), 2.0);
            Assert.Equal(CircleRadius(testCircle), 50.0);
            FreeBitmap(testBitmap);
        }
        [Fact]
        public void TestBitmapCellColumnsIntegration()
        {
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            BitmapSetCellDetails(testBitmap, 20, 20, 5, 5, 25);
            Assert.Equal(BitmapCellColumns(testBitmap), 5);
            FreeBitmap(testBitmap);
        }
        [Fact]
        public void TestBitmapCellCountIntegration()
        {
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            BitmapSetCellDetails(testBitmap, 20, 20, 5, 5, 25);
            Assert.Equal(BitmapCellCount(testBitmap), 25);
            FreeBitmap(testBitmap);
        }
        [Fact]
        public void TestBitmapCellHeightIntegration()
        {
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            BitmapSetCellDetails(testBitmap, 20, 20, 5, 5, 25);
            Assert.Equal(BitmapCellHeight(testBitmap), 20);
            FreeBitmap(testBitmap);
        }
        [Fact]
        public void TestBitmapCellOffsetIntegration()
        {
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            BitmapSetCellDetails(testBitmap, 25, 25, 4, 4, 16);
            var testOffset = BitmapCellOffset(testBitmap, 5);
            Assert.Equal(testOffset.X, 75);
            Assert.Equal(testOffset.Y, 0);
            FreeBitmap(testBitmap);
        }
        [Fact]
        public void TestBitmapCellRectangleIntegration()
        {
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            BitmapSetCellDetails(testBitmap, 25, 25, 4, 4, 16);
            var testRectangle = BitmapCellRectangle(testBitmap);
            Assert.Equal(testRectangle.Width, 25);
            Assert.Equal(testRectangle.Height, 25);
            FreeBitmap(testBitmap);
        }
        [Fact]
        public void TestBitmapCellRectangleAtPointIntegration()
        {
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            BitmapSetCellDetails(testBitmap, 25, 25, 4, 4, 16);
            var testRectangle = BitmapCellRectangle(testBitmap, PointAt(50.0, 50.0));
            Assert.Equal(RectangleLeft(testRectangle), 50.0);
            Assert.Equal(RectangleTop(testRectangle), 50.0);
            Assert.Equal(RectangleRight(testRectangle), 75.0);
            Assert.Equal(RectangleBottom(testRectangle), 75.0);
            FreeBitmap(testBitmap);
        }
        [Fact]
        public void TestBitmapCellRowsIntegration()
        {
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            BitmapSetCellDetails(testBitmap, 20, 20, 5, 5, 25);
            Assert.Equal(BitmapCellRows(testBitmap), 5);
            FreeBitmap(testBitmap);
        }
        [Fact]
        public void TestBitmapCellWidthIntegration()
        {
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            BitmapSetCellDetails(testBitmap, 25, 25, 4, 4, 16);
            Assert.Equal(BitmapCellWidth(testBitmap), 25);
            FreeBitmap(testBitmap);
        }
        [Fact]
        public void TestBitmapCenterIntegration()
        {
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testCenter = BitmapCenter(testBitmap);
            Assert.Equal(testCenter.X, 50.0);
            Assert.Equal(testCenter.Y, 50.0);
            FreeBitmap(testBitmap);
        }
        [Fact]
        public void TestBitmapFilenameIntegration()
        {
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testFilename = BitmapFilename(testBitmap);
            Assert.Equal(testFilename, "");
            FreeBitmap(testBitmap);
        }
        [Fact]
        public void TestBitmapHeightIntegration()
        {
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testHeight = BitmapHeight(testBitmap);
            Assert.Equal(testHeight, 100);
            FreeBitmap(testBitmap);
        }
        [Fact]
        public void TestBitmapHeightOfBitmapNamedIntegration()
        {
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            Assert.Equal(BitmapHeight("test_bitmap"), 100);
            FreeBitmap(testBitmap);
        }
        [Fact]
        public void TestBitmapNameIntegration()
        {
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testBitmapName = BitmapName(testBitmap);
            Assert.Equal(testBitmapName, "test_bitmap");
            FreeBitmap(testBitmap);
        }
        [Fact]
        public void TestBitmapNamedIntegration()
        {
            var testBitmap = LoadBitmap("test_bitmap", "test_bitmap.png");
            var testNamedBitmap = BitmapNamed("test_bitmap");
            Assert.NotNull(testNamedBitmap);
            var testNonexistentBitmap = BitmapNamed("nonexistent_bitmap");
            Assert.Null(testNonexistentBitmap);
            FreeAllBitmaps();
        }
        [Fact]
        public void TestBitmapRectangleOfCellIntegration()
        {
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            BitmapSetCellDetails(testBitmap, 25, 25, 4, 4, 16);
            var testRectangle = BitmapRectangleOfCell(testBitmap, 5);
            Assert.Equal(RectangleLeft(testRectangle), 0);
            Assert.Equal(RectangleTop(testRectangle), 75);
            Assert.Equal(RectangleRight(testRectangle), 25);
            Assert.Equal(RectangleBottom(testRectangle), 100);
            FreeBitmap(testBitmap);
        }
        [Fact]
        public void TestBitmapSetCellDetailsIntegration()
        {
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            BitmapSetCellDetails(testBitmap, 20, 20, 5, 5, 25);
            Assert.Equal(BitmapCellWidth(testBitmap), 20);
            Assert.Equal(BitmapCellHeight(testBitmap), 20);
            Assert.Equal(BitmapCellColumns(testBitmap), 5);
            Assert.Equal(BitmapCellRows(testBitmap), 5);
            Assert.Equal(BitmapCellCount(testBitmap), 25);
            FreeBitmap(testBitmap);
        }
        [Fact]
        public void TestBitmapValidIntegration()
        {
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            Assert.True(BitmapValid(testBitmap));
            FreeBitmap(testBitmap);
            Assert.False(BitmapValid(testBitmap));
        }
        [Fact]
        public void TestBitmapWidthIntegration()
        {
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testWidth = BitmapWidth(testBitmap);
            Assert.Equal(testWidth, 100);
            FreeBitmap(testBitmap);
        }
        [Fact]
        public void TestBitmapWidthOfBitmapNamedIntegration()
        {
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testWindow = OpenWindow("Test Window", 800, 600);
            DrawBitmap(BitmapNamed("test_bitmap"), 100, 100);
            RefreshScreen();
            Assert.Equal(BitmapWidth("test_bitmap"), 100);
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestClearBitmapIntegration()
        {
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            DrawPixelOnBitmap(testBitmap, ColorBlack(), 50, 50);
            ClearBitmap(testBitmap, ColorWhite());
            Assert.False(PixelDrawnAtPoint(testBitmap, 50, 50));
            FreeBitmap(testBitmap);
        }
        [Fact]
        public void TestClearBitmapNamedIntegration()
        {
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testWindow = OpenWindow("Test Window", 800, 600);
            DrawBitmap(testBitmap, 100.0, 100.0);
            RefreshScreen();
            Assert.True(PixelDrawnAtPoint(testBitmap, 50.0, 50.0));
            ClearBitmap("test_bitmap", ColorWhite());
            RefreshScreen();
            Assert.False(PixelDrawnAtPoint(testBitmap, 50.0, 50.0));
            CloseWindow(testWindow);
            FreeBitmap(testBitmap);
        }
        [Fact]
        public void TestCreateBitmapIntegration()
        {
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            Assert.NotNull(testBitmap);
            Assert.Equal(BitmapWidth(testBitmap), 100);
            Assert.Equal(BitmapHeight(testBitmap), 100);
            FreeBitmap(testBitmap);
        }
        [Fact]
        public void TestDrawBitmapIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            DrawBitmap(testBitmap, 100.0, 100.0);
            RefreshScreen();
            Assert.True(PixelDrawnAtPoint(testBitmap, PointAt(50.0, 50.0)));
            Assert.False(PixelDrawnAtPoint(testBitmap, PointAt(BitmapWidth(testBitmap), BitmapHeight(testBitmap))));
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestDrawBitmapWithOptionsIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            DrawBitmap(testBitmap, 100.0, 100.0, OptionDefaults());
            RefreshScreen();
            Assert.True(PixelDrawnAtPoint(testBitmap, PointAt(50.0, 50.0)));
            Assert.False(PixelDrawnAtPoint(testBitmap, PointAt(150.0, 100.0)));
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestDrawBitmapNamedIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            DrawBitmap("test_bitmap", 100.0, 100.0);
            RefreshScreen();
            Assert.True(PixelDrawnAtPoint(BitmapNamed("test_bitmap"), 50.0, 50.0));
            Assert.False(PixelDrawnAtPoint(BitmapNamed("test_bitmap"), BitmapWidth(BitmapNamed("test_bitmap")), BitmapHeight(BitmapNamed("test_bitmap"))));
            FreeAllBitmaps();
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestDrawBitmapNamedWithOptionsIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            DrawBitmap("test_bitmap", 100.0, 100.0, OptionDefaults());
            RefreshScreen();
            Assert.True(PixelDrawnAtPoint(testBitmap, PointAt(50.0, 50.0)));
            Assert.False(PixelDrawnAtPoint(testBitmap, PointAt(150.0, 150.0)));
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestDrawBitmapOnBitmapOnBitmapIntegration()
        {
            var testDestination = CreateBitmap("test_destination", 100, 100);
            var testSource = CreateBitmap("test_source", 50, 50);
            DrawBitmapOnBitmap(testDestination, testSource, 25.0, 25.0);
            Assert.True(PixelDrawnAtPoint(testDestination, PointAt(50.0, 50.0)));
            Assert.False(PixelDrawnAtPoint(testDestination, PointAt(75.0, 75.0)));
            FreeBitmap(testDestination);
            FreeBitmap(testSource);
        }
        [Fact]
        public void TestDrawBitmapOnBitmapOnBitmapWithOptionsIntegration()
        {
            var testDestination = CreateBitmap("test_destination", 100, 100);
            var testSource = CreateBitmap("test_source", 50, 50);
            DrawPixelOnBitmap(testSource, ColorBlack(), PointAt(25.0, 25.0));
            DrawBitmapOnBitmap(testDestination, testSource, 25.0, 25.0, OptionDefaults());
            Assert.True(PixelDrawnAtPoint(testDestination, PointAt(25.0, 25.0)));
            Assert.False(PixelDrawnAtPoint(testDestination, PointAt(75.0, 75.0)));
            FreeBitmap(testDestination);
            FreeBitmap(testSource);
        }
        [Fact]
        public void TestDrawBitmapOnWindowIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            DrawBitmapOnWindow(testWindow, testBitmap, 100.0, 100.0);
            RefreshScreen();
            Assert.True(PixelDrawnAtPoint(testBitmap, PointAt(50.0, 50.0)));
            Assert.False(PixelDrawnAtPoint(testBitmap, PointAt(150.0, 150.0)));
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestDrawBitmapOnWindowWithOptionsIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            DrawBitmapOnWindow(testWindow, testBitmap, 100.0, 100.0, OptionDefaults());
            RefreshScreen();
            Assert.True(PixelDrawnAtPoint(testBitmap, PointAt(50.0, 50.0)));
            Assert.False(PixelDrawnAtPoint(testBitmap, PointAt(150.0, 100.0)));
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestFreeAllBitmapsIntegration()
        {
            var testBitmap1 = CreateBitmap("test_bitmap_1", 100, 100);
            var testBitmap2 = CreateBitmap("test_bitmap_2", 100, 100);
            FreeAllBitmaps();
            Assert.False(BitmapValid(testBitmap1));
            Assert.False(BitmapValid(testBitmap2));
        }
        [Fact]
        public void TestFreeBitmapIntegration()
        {
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            FreeBitmap(testBitmap);
            Assert.False(BitmapValid(testBitmap));
        }
        [Fact]
        public void TestHasBitmapIntegration()
        {
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            Assert.True(HasBitmap("test_bitmap"));
            FreeBitmap(testBitmap);
            Assert.False(HasBitmap("test_bitmap"));
        }
        [Fact]
        public void TestLoadBitmapIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = LoadBitmap("test_bitmap", "test_bitmap.png");
            DrawBitmap(testBitmap, 100.0, 100.0);
            RefreshScreen();
            Assert.True(PixelDrawnAtPoint(testBitmap, PointAt(100.0, 100.0)));
            Assert.False(PixelDrawnAtPoint(testBitmap, PointAt(BitmapWidth(testBitmap), BitmapHeight(testBitmap))));
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestPixelDrawnAtPointPtIntegration()
        {
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            DrawPixelOnBitmap(testBitmap, ColorBlack(), PointAt(50.0, 50.0));
            Assert.True(PixelDrawnAtPoint(testBitmap, PointAt(50.0, 50.0)));
            Assert.False(PixelDrawnAtPoint(testBitmap, PointAt(75.0, 75.0)));
            FreeBitmap(testBitmap);
        }
        [Fact]
        public void TestPixelDrawnAtPointIntegration()
        {
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            DrawPixelOnBitmap(testBitmap, ColorBlack(), 50.0, 50.0);
            Assert.True(PixelDrawnAtPoint(testBitmap, 50.0, 50.0));
            Assert.False(PixelDrawnAtPoint(testBitmap, 75.0, 75.0));
            FreeBitmap(testBitmap);
        }
        [Fact]
        public void TestPixelDrawnAtPointInCellPtIntegration()
        {
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            DrawPixelOnBitmap(testBitmap, ColorBlack(), PointAt(50.0, 50.0));
            BitmapSetCellDetails(testBitmap, 100, 100, 1, 1, 1);
            Assert.True(PixelDrawnAtPoint(testBitmap, 0, PointAt(50.0, 50.0)));
            Assert.False(PixelDrawnAtPoint(testBitmap, 0, PointAt(75.0, 50.0)));
            FreeBitmap(testBitmap);
        }
        [Fact]
        public void TestPixelDrawnAtPointInCellIntegration()
        {
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            DrawPixel(ColorBlack(), PointAt(50.0, 50.0));
            var testWindow = OpenWindow("Test Window", 800, 600);
            DrawBitmap(testBitmap, 100.0, 100.0);
            RefreshScreen();
            Assert.True(PixelDrawnAtPoint(testBitmap, 0, PointAt(50.0, 50.0)));
            Assert.False(PixelDrawnAtPoint(testBitmap, 0, PointAt(75.0, 75.0)));
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestSetupCollisionMaskIntegration()
        {
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            SetupCollisionMask(testBitmap);
            var testPixelDrawn = PixelDrawnAtPoint(testBitmap, PointAt(50, 50));
            Assert.True(testPixelDrawn);
            FreeBitmap(testBitmap);
        }
        [Fact]
        public void TestDrawLineRecordIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testLine = LineFrom(PointAt(100.0, 100.0), PointAt(200.0, 200.0));
            DrawLine(ColorBlack(), testLine);
            RefreshScreen();
            Assert.Equal(GetPixel(PointAt(100.0, 100.0)), ColorBlack());
            Assert.NotEqual(GetPixel(PointAt(99.0, 99.0)), ColorBlack());
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestDrawLineRecordWithOptionsIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testLine = LineFrom(PointAt(100.0, 100.0), PointAt(200.0, 200.0));
            DrawLine(ColorBlack(), testLine, OptionLineWidth(3, OptionDefaults()));
            RefreshScreen();
            Assert.Equal(GetPixel(PointAt(100.0, 100.0)), ColorBlack());
            Assert.NotEqual(GetPixel(PointAt(99.0, 99.0)), ColorBlack());
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestDrawLinePointToPointIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            DrawLine(ColorBlack(), PointAt(100.0, 100.0), PointAt(200.0, 200.0));
            RefreshScreen();
            Assert.Equal(GetPixel(PointAt(100.0, 100.0)), ColorBlack());
            Assert.NotEqual(GetPixel(PointAt(99.0, 99.0)), ColorBlack());
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestDrawLinePointToPointWithOptionsIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            DrawLine(ColorBlack(), PointAt(100.0, 100.0), PointAt(200.0, 200.0), OptionDefaults());
            RefreshScreen();
            Assert.Equal(GetPixel(PointAt(100.0, 100.0)), ColorBlack());
            Assert.NotEqual(GetPixel(PointAt(99.0, 99.0)), ColorBlack());
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestDrawLineIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            DrawLine(ColorBlack(), 100.0, 100.0, 200.0, 200.0);
            RefreshScreen();
            Assert.Equal(GetPixel(PointAt(100.0, 100.0)), ColorBlack());
            Assert.NotEqual(GetPixel(PointAt(99.0, 99.0)), ColorBlack());
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestDrawLineWithOptionsIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            DrawLine(ColorBlack(), 100.0, 100.0, 200.0, 200.0, OptionDefaults());
            RefreshScreen();
            Assert.Equal(GetPixel(PointAt(100.0, 100.0)), ColorBlack());
            Assert.NotEqual(GetPixel(PointAt(99.0, 99.0)), ColorBlack());
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestDrawLineOnBitmapRecordIntegration()
        {
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testLine = LineFrom(PointAt(10.0, 10.0), PointAt(90.0, 90.0));
            DrawLineOnBitmap(testBitmap, ColorBlack(), testLine);
            Assert.True(PixelDrawnAtPoint(testBitmap, PointAt(50.0, 50.0)));
            Assert.False(PixelDrawnAtPoint(testBitmap, PointAt(100.0, 100.0)));
            FreeBitmap(testBitmap);
        }
        [Fact]
        public void TestDrawLineOnBitmapRecordWithOptionsIntegration()
        {
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testLine = LineFrom(PointAt(10.0, 10.0), PointAt(90.0, 90.0));
            DrawLineOnBitmap(testBitmap, ColorBlack(), testLine, OptionDefaults());
            Assert.True(PixelDrawnAtPoint(testBitmap, PointAt(50.0, 50.0)));
            Assert.False(PixelDrawnAtPoint(testBitmap, PointAt(95.0, 50.0)));
            FreeBitmap(testBitmap);
        }
        [Fact]
        public void TestDrawLineOnBitmapPointToPointIntegration()
        {
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            DrawLineOnBitmap(testBitmap, ColorBlack(), PointAt(10.0, 10.0), PointAt(90.0, 90.0));
            Assert.True(PixelDrawnAtPoint(testBitmap, 50.0, 50.0));
            Assert.False(PixelDrawnAtPoint(testBitmap, 0.0, 0.0));
            FreeBitmap(testBitmap);
        }
        [Fact]
        public void TestDrawLineOnBitmapPointToPointWithOptionsIntegration()
        {
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testFromPt = PointAt(10.0, 10.0);
            var testToPt = PointAt(90.0, 90.0);
            DrawLineOnBitmap(testBitmap, ColorBlack(), testFromPt, testToPt, OptionDefaults());
            Assert.True(PixelDrawnAtPoint(testBitmap, 10.0, 10.0));
            Assert.True(PixelDrawnAtPoint(testBitmap, 90.0, 90.0));
            Assert.False(PixelDrawnAtPoint(testBitmap, 5.0, 5.0));
            FreeBitmap(testBitmap);
        }
        [Fact]
        public void TestDrawLineOnBitmapIntegration()
        {
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testColor = ColorBlack();
            DrawLineOnBitmap(testBitmap, testColor, 10.0, 10.0, 90.0, 90.0);
            Assert.True(PixelDrawnAtPoint(testBitmap, 50.0, 50.0));
            Assert.False(PixelDrawnAtPoint(testBitmap, 95.0, 50.0));
            FreeBitmap(testBitmap);
        }
        [Fact]
        public void TestDrawLineOnBitmapWithOptionsIntegration()
        {
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            DrawLineOnBitmap(testBitmap, ColorBlack(), 10.0, 10.0, 90.0, 90.0, OptionDefaults());
            Assert.True(PixelDrawnAtPoint(testBitmap, PointAt(50.0, 50.0)));
            Assert.False(PixelDrawnAtPoint(testBitmap, PointAt(5.0, 5.0)));
            FreeBitmap(testBitmap);
        }
        [Fact]
        public void TestDrawLineOnWindowRecordIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testLine = LineFrom(PointAt(100.0, 100.0), PointAt(700.0, 500.0));
            DrawLineOnWindow(testWindow, ColorBlack(), testLine);
            RefreshScreen();
            Assert.Equal(GetPixel(testWindow, PointAt(100.0, 100.0)), ColorBlack());
            Assert.NotEqual(GetPixel(testWindow, PointAt(99.0, 99.0)), ColorBlack());
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestDrawLineOnWindowRecordWithOptionsIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testLine = LineFrom(PointAt(100.0, 100.0), PointAt(200.0, 200.0));
            DrawLineOnWindow(testWindow, ColorBlack(), testLine, OptionDefaults());
            RefreshScreen();
            Assert.Equal(GetPixel(testWindow, PointAt(100.0, 100.0)), ColorBlack());
            Assert.NotEqual(GetPixel(testWindow, PointAt(99.0, 99.0)), ColorBlack());
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestDrawLineOnWindowPointToPointIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            DrawLineOnWindow(testWindow, ColorBlack(), PointAt(100.0, 100.0), PointAt(200.0, 200.0));
            RefreshScreen();
            Assert.Equal(GetPixel(testWindow, 100.0, 100.0), ColorBlack());
            Assert.NotEqual(GetPixel(testWindow, 99.0, 99.0), ColorBlack());
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestDrawLineOnWindowPointToPointWithOptionsIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            DrawLineOnWindow(testWindow, ColorBlack(), PointAt(100.0, 100.0), PointAt(200.0, 200.0), OptionDefaults());
            RefreshScreen();
            Assert.Equal(GetPixel(testWindow, 100.0, 100.0), ColorBlack());
            Assert.NotEqual(GetPixel(testWindow, 99.0, 99.0), ColorBlack());
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestDrawLineOnWindowIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            DrawLineOnWindow(testWindow, ColorBlack(), 100.0, 100.0, 200.0, 200.0);
            RefreshScreen();
            Assert.Equal(GetPixel(testWindow, 100.0, 100.0), ColorBlack());
            Assert.NotEqual(GetPixel(testWindow, 99.0, 99.0), ColorBlack());
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestDrawLineOnWindowWithOptionsIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            DrawLineOnWindow(testWindow, ColorBlack(), 100.0, 100.0, 200.0, 200.0, OptionDefaults());
            RefreshScreen();
            Assert.Equal(GetPixel(testWindow, 100.0, 100.0), ColorBlack());
            Assert.NotEqual(GetPixel(testWindow, 99.0, 99.0), ColorBlack());
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestDrawPixelAtPointIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            DrawPixel(ColorBlack(), PointAt(100.0, 100.0));
            RefreshScreen();
            Assert.Equal(GetPixel(PointAt(100.0, 100.0)), ColorBlack());
            Assert.NotEqual(GetPixel(PointAt(99.0, 99.0)), ColorBlack());
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestDrawPixelAtPointWithOptionsIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            DrawPixel(ColorBlack(), PointAt(100.0, 100.0), OptionDefaults());
            RefreshScreen();
            Assert.Equal(GetPixel(PointAt(100.0, 100.0)), ColorBlack());
            Assert.Equal(GetPixel(PointAt(100.0, 100.0)), ColorBlack());
            Assert.NotEqual(GetPixel(PointAt(99.0, 99.0)), ColorBlack());
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestDrawPixelIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            DrawPixel(ColorBlack(), 100.0, 100.0);
            RefreshScreen();
            Assert.Equal(GetPixel(PointAt(100.0, 100.0)), ColorBlack());
            Assert.NotEqual(GetPixel(PointAt(99.0, 99.0)), ColorBlack());
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestDrawPixelWithOptionsIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            DrawPixel(ColorBlack(), 100.0, 100.0, OptionDefaults());
            RefreshScreen();
            Assert.Equal(GetPixel(PointAt(100.0, 100.0)), ColorBlack());
            Assert.NotEqual(GetPixel(PointAt(99.0, 99.0)), ColorBlack());
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestDrawPixelOnBitmapAtPointIntegration()
        {
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testColor = ColorBlack();
            var testPoint = PointAt(50.0, 50.0);
            DrawPixelOnBitmap(testBitmap, testColor, testPoint);
            Assert.True(PixelDrawnAtPoint(testBitmap, testPoint));
            Assert.False(PixelDrawnAtPoint(testBitmap, PointAt(0.0, 0.0)));
            FreeBitmap(testBitmap);
        }
        [Fact]
        public void TestDrawPixelOnBitmapAtPointWithOptionsIntegration()
        {
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testColor = ColorBlack();
            var testPoint = PointAt(50.0, 50.0);
            DrawPixelOnBitmap(testBitmap, testColor, testPoint, OptionDefaults());
            Assert.True(PixelDrawnAtPoint(testBitmap, testPoint));
            Assert.False(PixelDrawnAtPoint(testBitmap, PointAt(0.0, 0.0)));
            FreeBitmap(testBitmap);
        }
        [Fact]
        public void TestDrawPixelOnBitmapIntegration()
        {
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testColor = ColorBlack();
            DrawPixelOnBitmap(testBitmap, testColor, 50.0, 50.0);
            Assert.True(PixelDrawnAtPoint(testBitmap, 50.0, 50.0));
            Assert.False(PixelDrawnAtPoint(testBitmap, 51.0, 50.0));
            FreeBitmap(testBitmap);
        }
        [Fact]
        public void TestDrawPixelOnBitmapWithOptionsIntegration()
        {
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testColor = ColorBlack();
            DrawPixelOnBitmap(testBitmap, testColor, 50.0, 50.0, OptionDefaults());
            Assert.True(PixelDrawnAtPoint(testBitmap, 50.0, 50.0));
            Assert.False(PixelDrawnAtPoint(testBitmap, 51.0, 50.0));
            FreeBitmap(testBitmap);
        }
        [Fact]
        public void TestDrawPixelOnWindowAtPointIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testColor = ColorBlack();
            var testPoint = PointAt(100.0, 100.0);
            DrawPixelOnWindow(testWindow, testColor, testPoint);
            RefreshScreen();
            Assert.Equal(GetPixel(PointAt(100.0, 100.0)), ColorBlack());
            Assert.NotEqual(GetPixel(PointAt(99.0, 99.0)), ColorBlack());
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestDrawPixelOnWindowAtPointWithOptionsIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testPoint = PointAt(100.0, 100.0);
            DrawPixelOnWindow(testWindow, ColorBlack(), testPoint, OptionDefaults());
            RefreshScreen();
            Assert.Equal(GetPixel(PointAt(100.0, 100.0)), ColorBlack());
            Assert.NotEqual(GetPixel(PointAt(99.0, 99.0)), ColorBlack());
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestDrawPixelOnWindowIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            DrawPixelOnWindow(testWindow, ColorBlack(), 100.0, 100.0);
            RefreshScreen();
            Assert.Equal(GetPixel(PointAt(100.0, 100.0)), ColorBlack());
            Assert.NotEqual(GetPixel(PointAt(99.0, 99.0)), ColorBlack());
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestDrawPixelOnWindowWithOptionsIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            DrawPixelOnWindow(testWindow, ColorBlack(), 100.0, 100.0, OptionDefaults());
            RefreshScreen();
            Assert.Equal(GetPixel(PointAt(100.0, 100.0)), ColorBlack());
            Assert.NotEqual(GetPixel(PointAt(99.0, 99.0)), ColorBlack());
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestGetPixelFromBitmapAtPointIntegration()
        {
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            DrawPixelOnBitmap(testBitmap, ColorBlack(), PointAt(50.0, 50.0));
            var testColor = GetPixel(testBitmap, PointAt(50.0, 50.0));
            Assert.Equal(ColorBlack(), testColor);
            FreeBitmap(testBitmap);
        }
        [Fact]
        public void TestGetPixelFromBitmapIntegration()
        {
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            DrawPixelOnBitmap(testBitmap, ColorBlack(), 50.0, 50.0);
            var testPixelColor = GetPixel(testBitmap, 50.0, 50.0);
            Assert.Equal(testPixelColor, ColorBlack());
            FreeBitmap(testBitmap);
        }
        [Fact]
        public void TestGetPixelAtPointIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            DrawPixel(ColorBlack(), PointAt(100.0, 100.0));
            RefreshScreen();
            Assert.Equal(GetPixel(PointAt(100.0, 100.0)), ColorBlack());
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestGetPixelIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            DrawPixel(ColorBlack(), 100.0, 100.0);
            RefreshScreen();
            Assert.Equal(GetPixel(100.0, 100.0), ColorBlack());
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestGetPixelFromWindowAtPointIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            DrawPixel(ColorBlack(), PointAt(100.0, 100.0));
            RefreshScreen();
            Assert.Equal(GetPixel(testWindow, PointAt(100.0, 100.0)), ColorBlack());
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestGetPixelFromWindowIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            DrawPixel(ColorBlack(), 100.0, 100.0);
            RefreshScreen();
            Assert.Equal(GetPixel(testWindow, 100.0, 100.0), ColorBlack());
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestGetPixelFromWindowAtPointFromWindowIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            DrawPixel(ColorBlack(), PointAt(100.0, 100.0));
            RefreshScreen();
            var testPixel = GetPixelFromWindow(testWindow, PointAt(100.0, 100.0));
            Assert.Equal(ColorBlack(), testPixel);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestGetPixelFromWindowFromWindowIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            DrawPixel(ColorBlack(), 100.0, 100.0);
            RefreshScreen();
            var testPixelColor = GetPixel(testWindow, 100.0, 100.0);
            Assert.Equal(ColorBlack(), testPixelColor);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestDrawQuadIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testQuad = QuadFrom(PointAt(100.0, 100.0), PointAt(200.0, 100.0), PointAt(100.0, 200.0), PointAt(200.0, 200.0));
            DrawQuad(ColorBlack(), testQuad);
            RefreshScreen();
            Assert.True(PointInQuad(PointAt(150.0, 150.0), testQuad));
            Assert.False(PointInQuad(PointAt(250.0, 250.0), testQuad));
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestDrawQuadWithOptionsIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testQuad = QuadFrom(PointAt(100.0, 100.0), PointAt(200.0, 100.0), PointAt(100.0, 200.0), PointAt(200.0, 200.0));
            DrawQuad(ColorBlack(), testQuad, OptionDefaults());
            RefreshScreen();
            Assert.True(PointInQuad(PointAt(150.0, 150.0), testQuad));
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestDrawQuadOnBitmapIntegration()
        {
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testQuad = QuadFrom(PointAt(10.0, 10.0), PointAt(90.0, 10.0), PointAt(10.0, 90.0), PointAt(90.0, 90.0));
            DrawQuadOnBitmap(testBitmap, ColorBlack(), testQuad);
            Assert.True(PixelDrawnAtPoint(testBitmap, PointAt(50.0, 50.0)));
            Assert.False(PixelDrawnAtPoint(testBitmap, PointAt(100.0, 100.0)));
            FreeBitmap(testBitmap);
        }
        [Fact]
        public void TestDrawQuadOnBitmapWithOptionsIntegration()
        {
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testQuad = QuadFrom(PointAt(10.0, 10.0), PointAt(90.0, 10.0), PointAt(90.0, 90.0), PointAt(10.0, 90.0));
            DrawQuadOnBitmap(testBitmap, ColorBlack(), testQuad, OptionDefaults());
            Assert.True(PixelDrawnAtPoint(testBitmap, PointAt(50.0, 50.0)));
            Assert.False(PixelDrawnAtPoint(testBitmap, PointAt(101.0, 50.0)));
            FreeBitmap(testBitmap);
        }
        [Fact]
        public void TestDrawQuadOnWindowIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testQuad = QuadFrom(PointAt(100.0, 100.0), PointAt(200.0, 100.0), PointAt(100.0, 200.0), PointAt(200.0, 200.0));
            DrawQuadOnWindow(testWindow, ColorBlack(), testQuad);
            RefreshScreen();
            Assert.True(PointInQuad(PointAt(150.0, 150.0), testQuad));
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestDrawQuadOnWindowWithOptionsIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testQuad = QuadFrom(PointAt(100.0, 100.0), PointAt(200.0, 100.0), PointAt(100.0, 200.0), PointAt(200.0, 200.0));
            DrawQuadOnWindow(testWindow, ColorBlack(), testQuad, OptionDefaults());
            RefreshScreen();
            Assert.True(PointInQuad(PointAt(150.0, 150.0), testQuad));
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestDrawRectangleRecordIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testRectangle = RectangleFrom(100.0, 100.0, 200.0, 150.0);
            DrawRectangle(ColorBlack(), testRectangle);
            RefreshScreen();
            Assert.True(PointInRectangle(PointAt(150.0, 125.0), testRectangle));
            Assert.False(PointInRectangle(PointAt(301.0, 251.0), testRectangle));
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestDrawRectangleRecordWithOptionsIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testRectangle = RectangleFrom(100.0, 100.0, 200.0, 150.0);
            DrawRectangle(ColorBlack(), testRectangle, OptionDefaults());
            RefreshScreen();
            Assert.True(PointInRectangle(PointAt(150.0, 125.0), testRectangle));
            Assert.False(PointInRectangle(PointAt(350.0, 300.0), testRectangle));
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestDrawRectangleIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            DrawRectangle(ColorBlack(), 100.0, 100.0, 200.0, 150.0);
            RefreshScreen();
            Assert.True(PointInRectangle(PointAt(150.0, 125.0), RectangleFrom(100.0, 100.0, 200.0, 150.0)));
            Assert.False(PointInRectangle(PointAt(301.0, 251.0), RectangleFrom(100.0, 100.0, 200.0, 150.0)));
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestDrawRectangleWithOptionsIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            DrawRectangle(ColorBlack(), 100.0, 100.0, 200.0, 150.0, OptionLineWidth(3, OptionDefaults()));
            RefreshScreen();
            Assert.True(PointInRectangle(PointAt(150.0, 125.0), RectangleFrom(100.0, 100.0, 200.0, 150.0)));
            Assert.False(PointInRectangle(PointAt(301.0, 251.0), RectangleFrom(100.0, 100.0, 200.0, 150.0)));
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestDrawRectangleOnBitmapRecordIntegration()
        {
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testRectangle = RectangleFrom(50.0, 50.0, 20.0, 30.0);
            DrawRectangleOnBitmap(testBitmap, ColorBlack(), testRectangle);
            Assert.True(PixelDrawnAtPoint(testBitmap, PointAt(50.0, 50.0)));
            Assert.False(PixelDrawnAtPoint(testBitmap, PointAt(80.0, 90.0)));
            FreeBitmap(testBitmap);
        }
        [Fact]
        public void TestDrawRectangleOnBitmapRecordWithOptionsIntegration()
        {
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testRectangle = RectangleFrom(50.0, 50.0, 20.0, 20.0);
            DrawRectangleOnBitmap(testBitmap, ColorBlack(), testRectangle, OptionDefaults());
            Assert.True(PixelDrawnAtPoint(testBitmap, PointAt(50.0, 50.0)));
            Assert.False(PixelDrawnAtPoint(testBitmap, PointAt(75.0, 75.0)));
            FreeBitmap(testBitmap);
        }
        [Fact]
        public void TestDrawRectangleOnBitmapIntegration()
        {
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            DrawRectangleOnBitmap(testBitmap, ColorBlack(), 50.0, 50.0, 20.0, 20.0);
            Assert.True(PixelDrawnAtPoint(testBitmap, 50.0, 50.0));
            Assert.False(PixelDrawnAtPoint(testBitmap, 75.0, 75.0));
            FreeBitmap(testBitmap);
        }
        [Fact]
        public void TestDrawRectangleOnBitmapWithOptionsIntegration()
        {
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            DrawRectangleOnBitmap(testBitmap, ColorBlack(), 50.0, 50.0, 20.0, 20.0, OptionDefaults());
            Assert.True(PixelDrawnAtPoint(testBitmap, 50.0, 50.0));
            Assert.False(PixelDrawnAtPoint(testBitmap, 75.0, 75.0));
            FreeBitmap(testBitmap);
        }
        [Fact]
        public void TestDrawRectangleOnWindowRecordIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testRectangle = RectangleFrom(100.0, 100.0, 50.0, 50.0);
            DrawRectangleOnWindow(testWindow, ColorBlack(), testRectangle);
            RefreshScreen();
            Assert.True(PointInRectangle(PointAt(125.0, 125.0), testRectangle));
            Assert.False(PointInRectangle(PointAt(200.0, 200.0), testRectangle));
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestDrawRectangleOnWindowRecordWithOptionsIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testRectangle = RectangleFrom(100.0, 100.0, 50.0, 50.0);
            DrawRectangleOnWindow(testWindow, ColorBlack(), testRectangle, OptionDefaults());
            RefreshScreen();
            Assert.True(PointInRectangle(PointAt(125.0, 125.0), testRectangle));
            Assert.False(PointInRectangle(PointAt(175.0, 175.0), testRectangle));
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestDrawRectangleOnWindowIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            DrawRectangleOnWindow(testWindow, ColorBlack(), 100.0, 100.0, 50.0, 50.0);
            RefreshScreen();
            Assert.True(PointInRectangle(PointAt(100.0, 100.0), RectangleFrom(100.0, 100.0, 50.0, 50.0)));
            Assert.False(PointInRectangle(PointAt(200.0, 200.0), RectangleFrom(100.0, 100.0, 50.0, 50.0)));
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestDrawRectangleOnWindowWithOptionsIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testRectangle = RectangleFrom(100.0, 100.0, 50.0, 50.0);
            DrawRectangleOnWindow(testWindow, ColorBlack(), testRectangle, OptionDefaults());
            RefreshScreen();
            Assert.True(PointInRectangle(PointAt(125.0, 125.0), testRectangle));
            Assert.False(PointInRectangle(PointAt(200.0, 200.0), testRectangle));
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestFillQuadIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testQuad = QuadFrom(PointAt(100.0, 100.0), PointAt(300.0, 100.0), PointAt(100.0, 300.0), PointAt(300.0, 300.0));
            FillQuad(ColorBlack(), testQuad);
            RefreshScreen();
            Assert.True(PointInQuad(PointAt(200.0, 200.0), testQuad));
            Assert.False(PointInQuad(PointAt(400.0, 400.0), testQuad));
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestFillQuadWithOptionsIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testQuad = QuadFrom(PointAt(100.0, 100.0), PointAt(300.0, 100.0), PointAt(100.0, 300.0), PointAt(300.0, 300.0));
            FillQuad(ColorBlack(), testQuad, OptionDefaults());
            RefreshScreen();
            Assert.True(PointInQuad(PointAt(200.0, 200.0), testQuad));
            Assert.False(PointInQuad(PointAt(400.0, 400.0), testQuad));
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestFillQuadOnBitmapIntegration()
        {
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testQuad = QuadFrom(PointAt(10.0, 10.0), PointAt(90.0, 10.0), PointAt(10.0, 90.0), PointAt(90.0, 90.0));
            FillQuadOnBitmap(testBitmap, ColorBlack(), testQuad);
            Assert.True(PixelDrawnAtPoint(testBitmap, PointAt(50.0, 50.0)));
            Assert.False(PixelDrawnAtPoint(testBitmap, PointAt(0.0, 0.0)));
            FreeBitmap(testBitmap);
        }
        [Fact]
        public void TestFillQuadOnBitmapWithOptionsIntegration()
        {
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testQuad = QuadFrom(PointAt(10.0, 10.0), PointAt(90.0, 10.0), PointAt(90.0, 90.0), PointAt(10.0, 90.0));
            FillQuadOnBitmap(testBitmap, ColorBlack(), testQuad, OptionDefaults());
            Assert.True(PixelDrawnAtPoint(testBitmap, PointAt(50.0, 50.0)));
            Assert.False(PixelDrawnAtPoint(testBitmap, PointAt(101.0, 50.0)));
            FreeBitmap(testBitmap);
        }
        [Fact]
        public void TestFillQuadOnWindowIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testQuad = QuadFrom(PointAt(100.0, 100.0), PointAt(200.0, 100.0), PointAt(100.0, 200.0), PointAt(200.0, 200.0));
            FillQuadOnWindow(testWindow, ColorBlack(), testQuad);
            RefreshScreen();
            Assert.True(PointInQuad(PointAt(150.0, 150.0), testQuad));
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestFillQuadOnWindowWithOptionsIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testQuad = QuadFrom(PointAt(100.0, 100.0), PointAt(200.0, 100.0), PointAt(200.0, 200.0), PointAt(100.0, 200.0));
            FillQuadOnWindow(testWindow, ColorBlack(), testQuad, OptionDefaults());
            RefreshScreen();
            Assert.True(PointInQuad(PointAt(150.0, 150.0), testQuad));
            Assert.False(PointInQuad(PointAt(250.0, 150.0), testQuad));
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestFillRectangleRecordIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testRectangle = RectangleFrom(100.0, 100.0, 200.0, 150.0);
            FillRectangle(ColorBlack(), testRectangle);
            RefreshScreen();
            Assert.True(PointInRectangle(PointAt(150.0, 125.0), testRectangle));
            Assert.False(PointInRectangle(PointAt(350.0, 275.0), testRectangle));
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestFillRectangleRecordWithOptionsIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testRectangle = RectangleFrom(100.0, 100.0, 200.0, 150.0);
            FillRectangle(ColorBlack(), testRectangle, OptionDefaults());
            RefreshScreen();
            Assert.True(PointInRectangle(PointAt(150.0, 125.0), testRectangle));
            Assert.False(PointInRectangle(PointAt(350.0, 275.0), testRectangle));
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestFillRectangleIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            FillRectangle(ColorBlack(), 100.0, 100.0, 200.0, 150.0);
            RefreshScreen();
            Assert.True(PointInRectangle(PointAt(150.0, 125.0), RectangleFrom(100.0, 100.0, 200.0, 150.0)));
            Assert.False(PointInRectangle(PointAt(301.0, 251.0), RectangleFrom(100.0, 100.0, 200.0, 150.0)));
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestFillRectangleWithOptionsIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            FillRectangle(ColorBlack(), 100.0, 100.0, 200.0, 150.0, OptionDefaults());
            RefreshScreen();
            Assert.True(PointInRectangle(PointAt(150.0, 125.0), RectangleFrom(100.0, 100.0, 200.0, 150.0)));
            Assert.False(PointInRectangle(PointAt(301.0, 251.0), RectangleFrom(100.0, 100.0, 200.0, 150.0)));
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestFillRectangleOnBitmapRecordIntegration()
        {
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testRectangle = RectangleFrom(25.0, 25.0, 50.0, 50.0);
            FillRectangleOnBitmap(testBitmap, ColorBlack(), testRectangle);
            Assert.True(PixelDrawnAtPoint(testBitmap, PointAt(50.0, 50.0)));
            Assert.False(PixelDrawnAtPoint(testBitmap, PointAt(10.0, 10.0)));
            FreeBitmap(testBitmap);
        }
        [Fact]
        public void TestFillRectangleOnBitmapRecordWithOptionsIntegration()
        {
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testRectangle = RectangleFrom(25.0, 25.0, 50.0, 50.0);
            FillRectangleOnBitmap(testBitmap, ColorBlack(), testRectangle, OptionDefaults());
            Assert.True(PixelDrawnAtPoint(testBitmap, PointAt(50.0, 50.0)));
            Assert.False(PixelDrawnAtPoint(testBitmap, PointAt(10.0, 10.0)));
            FreeBitmap(testBitmap);
        }
        [Fact]
        public void TestFillRectangleOnBitmapIntegration()
        {
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            FillRectangleOnBitmap(testBitmap, ColorBlack(), 25.0, 25.0, 50.0, 50.0);
            Assert.True(PixelDrawnAtPoint(testBitmap, 50.0, 50.0));
            Assert.False(PixelDrawnAtPoint(testBitmap, 75.0, 75.0));
            FreeBitmap(testBitmap);
        }
        [Fact]
        public void TestFillRectangleOnBitmapWithOptionsIntegration()
        {
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            FillRectangleOnBitmap(testBitmap, ColorBlack(), 25.0, 25.0, 50.0, 50.0, OptionDefaults());
            Assert.True(PixelDrawnAtPoint(testBitmap, PointAt(50.0, 50.0)));
            Assert.False(PixelDrawnAtPoint(testBitmap, PointAt(10.0, 10.0)));
            FreeBitmap(testBitmap);
        }
        [Fact]
        public void TestFillRectangleOnWindowRecordIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testRectangle = RectangleFrom(100.0, 100.0, 200.0, 150.0);
            FillRectangleOnWindow(testWindow, ColorBlack(), testRectangle);
            RefreshScreen();
            Assert.True(PointInRectangle(PointAt(150.0, 125.0), testRectangle));
            Assert.False(PointInRectangle(PointAt(350.0, 275.0), testRectangle));
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestFillRectangleOnWindowRecordWithOptionsIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testRectangle = RectangleFrom(100.0, 100.0, 200.0, 150.0);
            FillRectangleOnWindow(testWindow, ColorBlack(), testRectangle, OptionDefaults());
            RefreshScreen();
            Assert.True(PointInRectangle(PointAt(150.0, 125.0), testRectangle));
            Assert.False(PointInRectangle(PointAt(350.0, 275.0), testRectangle));
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestFillRectangleOnWindowIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            FillRectangleOnWindow(testWindow, ColorBlack(), 100.0, 100.0, 50.0, 50.0);
            RefreshScreen();
            Assert.True(PointInRectangle(PointAt(125.0, 125.0), RectangleFrom(100.0, 100.0, 50.0, 50.0)));
            Assert.False(PointInRectangle(PointAt(175.0, 175.0), RectangleFrom(100.0, 100.0, 50.0, 50.0)));
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestFillRectangleOnWindowWithOptionsIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            FillRectangleOnWindow(testWindow, ColorBlack(), 100.0, 100.0, 50.0, 50.0, OptionDefaults());
            RefreshScreen();
            Assert.True(PointInRectangle(PointAt(125.0, 125.0), RectangleFrom(100.0, 100.0, 50.0, 50.0)));
            Assert.False(PointInRectangle(PointAt(175.0, 175.0), RectangleFrom(100.0, 100.0, 50.0, 50.0)));
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestDrawTextFontAsStringIntegration()
        {
            var testWindow = OpenWindow("Text Drawing Test", 800, 600);
            DrawText("Hello, World!", ColorBlack(), "hara", 24, 100.0, 100.0);
            RefreshScreen();
            var testRectangle = RectangleFrom(100.0, 100.0, TextWidth("Hello, World!", GetSystemFont(), 12), TextHeight("Hello, World!", GetSystemFont(), 12));
            Assert.True(PointInRectangle(PointAt(100.0, 100.0), testRectangle));
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestDrawTextWithOptionsFontAsStringIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            DrawText("Hello, World!", ColorBlack(), "leaguegothic", 24, 100.0, 100.0, OptionDefaults());
            RefreshScreen();
            var testRectangle = RectangleFrom(100.0, 100.0, TextWidth("Hello, World!", GetSystemFont(), 12), TextHeight("Hello, World!", GetSystemFont(), 12));
            Assert.True(PointInRectangle(PointAt(100.0, 100.0), testRectangle));
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestDrawTextNoFontNoSizeIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            DrawText("Hello, World!", ColorBlack(), 100.0, 100.0);
            RefreshScreen();
            var testRectangle = RectangleFrom(100.0, 100.0, TextWidth("Hello, World!", GetSystemFont(), 12), TextHeight("Hello, World!", GetSystemFont(), 12));
            Assert.True(PointInRectangle(PointAt(100.0, 100.0), testRectangle));
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestDrawTextNoFontNoSizeWithOptionsIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            DrawText("Hello, World!", ColorBlack(), 100.0, 100.0, OptionDefaults());
            RefreshScreen();
            var testRectangle = RectangleFrom(100.0, 100.0, TextWidth("Hello, World!", GetSystemFont(), 12), TextHeight("Hello, World!", GetSystemFont(), 12));
            Assert.True(PointInRectangle(PointAt(100.0, 100.0), testRectangle));
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestDrawTextIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            DrawText("Hello, World!", ColorBlack(), FontNamed("hara"), 24, 100.0, 100.0);
            RefreshScreen();
            var testRectangle = RectangleFrom(100.0, 100.0, TextWidth("Hello, World!", GetSystemFont(), 12), TextHeight("Hello, World!", GetSystemFont(), 12));
            Assert.True(PointInRectangle(PointAt(100.0, 100.0), testRectangle));
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestDrawTextWithOptionsIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            DrawText("Hello, World!", ColorBlack(), FontNamed("hara"), 24, 100.0, 100.0, OptionDefaults());
            RefreshScreen();
            var testRectangle = RectangleFrom(100.0, 100.0, TextWidth("Hello, World!", GetSystemFont(), 12), TextHeight("Hello, World!", GetSystemFont(), 12));
            Assert.True(PointInRectangle(PointAt(100.0, 100.0), testRectangle));
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestDrawTextOnBitmapFontAsStringIntegration()
        {
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            DrawTextOnBitmap(testBitmap, "Hello", ColorBlack(), "hara", 12, 10.0, 10.0);
            Assert.True(PixelDrawnAtPoint(testBitmap, 10.0, 10.0));
            Assert.False(PixelDrawnAtPoint(testBitmap, 90.0, 90.0));
            FreeBitmap(testBitmap);
        }
        [Fact]
        public void TestDrawTextOnBitmapWithOptionsFontAsStringIntegration()
        {
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            DrawTextOnBitmap(testBitmap, "Hello", ColorBlack(), "hara", 12, 10.0, 10.0, OptionDefaults());
            Assert.True(PixelDrawnAtPoint(testBitmap, 10.0, 10.0));
            Assert.False(PixelDrawnAtPoint(testBitmap, 90.0, 90.0));
            FreeBitmap(testBitmap);
        }
        [Fact]
        public void TestDrawTextOnBitmapNoFontNoSizeIntegration()
        {
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            DrawTextOnBitmap(testBitmap, "Test", ColorBlack(), 10.0, 10.0);
            Assert.True(PixelDrawnAtPoint(testBitmap, 10.0, 10.0));
            Assert.False(PixelDrawnAtPoint(testBitmap, 90.0, 90.0));
            FreeBitmap(testBitmap);
        }
        [Fact]
        public void TestDrawTextOnBitmapNoFontNoSizeWithOptionsIntegration()
        {
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            DrawTextOnBitmap(testBitmap, "Test", ColorBlack(), 10.0, 10.0, OptionDefaults());
            Assert.True(PixelDrawnAtPoint(testBitmap, 10.0, 10.0));
            Assert.False(PixelDrawnAtPoint(testBitmap, 90.0, 90.0));
            FreeBitmap(testBitmap);
        }
        [Fact]
        public void TestDrawTextOnBitmapIntegration()
        {
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            DrawTextOnBitmap(testBitmap, "Hello", ColorBlack(), FontNamed("hara"), 12, 10.0, 10.0);
            Assert.True(PixelDrawnAtPoint(testBitmap, 10.0, 10.0));
            Assert.False(PixelDrawnAtPoint(testBitmap, 90.0, 90.0));
            FreeBitmap(testBitmap);
        }
        [Fact]
        public void TestDrawTextOnBitmapWithOptionsIntegration()
        {
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            DrawTextOnBitmap(testBitmap, "Test", ColorBlack(), FontNamed("hara"), 24, 10.0, 10.0, OptionDefaults());
            Assert.True(PixelDrawnAtPoint(testBitmap, 10.0, 10.0));
            Assert.False(PixelDrawnAtPoint(testBitmap, 90.0, 90.0));
            FreeBitmap(testBitmap);
        }
        [Fact]
        public void TestDrawTextOnWindowFontAsStringIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            DrawTextOnWindow(testWindow, "Hello, World!", ColorBlack(), "hara", 24, 10.0, 10.0);
            RefreshScreen();
            var testRectangle = RectangleFrom(100.0, 100.0, TextWidth("Hello, World!", GetSystemFont(), 12), TextHeight("Hello, World!", GetSystemFont(), 12));
            Assert.True(PointInRectangle(PointAt(100.0, 100.0), testRectangle));
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestDrawTextOnWindowWithOptionsFontAsStringIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            DrawTextOnWindow(testWindow, "Hello, World!", ColorBlack(), "hara", 24, 10.0, 10.0, OptionDefaults());
            RefreshScreen();
            var testRectangle = RectangleFrom(100.0, 100.0, TextWidth("Hello, World!", GetSystemFont(), 12), TextHeight("Hello, World!", GetSystemFont(), 12));
            Assert.True(PointInRectangle(PointAt(100.0, 100.0), testRectangle));
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestDrawTextOnWindowNoFontNoSizeIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            DrawTextOnWindow(testWindow, "Hello, World!", ColorBlack(), 10.0, 10.0);
            RefreshScreen();
            var testRectangle = RectangleFrom(100.0, 100.0, TextWidth("Hello, World!", GetSystemFont(), 12), TextHeight("Hello, World!", GetSystemFont(), 12));
            Assert.True(PointInRectangle(PointAt(100.0, 100.0), testRectangle));
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestDrawTextOnWindowNoFontNoSizeWithOptionsIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            DrawTextOnWindow(testWindow, "Hello, World!", ColorBlack(), 10.0, 10.0, OptionDefaults());
            RefreshScreen();
            var testRectangle = RectangleFrom(100.0, 100.0, TextWidth("Hello, World!", GetSystemFont(), 12), TextHeight("Hello, World!", GetSystemFont(), 12));
            Assert.True(PointInRectangle(PointAt(100.0, 100.0), testRectangle));
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestDrawTextOnWindowIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testFont = LoadFont("test_font", "hara.ttf");
            FontLoadSize(testFont, 24);
            DrawTextOnWindow(testWindow, "Hello, World!", ColorBlack(), testFont, 24, 10.0, 10.0);
            RefreshScreen();
            var testRectangle = RectangleFrom(100.0, 100.0, TextWidth("Hello, World!", GetSystemFont(), 12), TextHeight("Hello, World!", GetSystemFont(), 12));
            Assert.True(PointInRectangle(PointAt(100.0, 100.0), testRectangle));
            CloseWindow(testWindow);
            FreeFont(testFont);
        }
        [Fact]
        public void TestDrawTextOnWindowWithOptionsIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testFont = LoadFont("test_font", "hara.ttf");
            DrawTextOnWindow(testWindow, "Hello, World!", ColorBlack(), testFont, 24, 10.0, 10.0, OptionDefaults());
            RefreshScreen();
            var testRectangle = RectangleFrom(100.0, 100.0, TextWidth("Hello, World!", GetSystemFont(), 12), TextHeight("Hello, World!", GetSystemFont(), 12));
            Assert.True(PointInRectangle(PointAt(100.0, 100.0), testRectangle));
            CloseWindow(testWindow);
            FreeFont(testFont);
        }
        [Fact]
        public void TestFontHasSizeNameAsStringIntegration()
        {
            var testResult1 = FontHasSize("hara", 12);
            Assert.True(testResult1);
            var testResult2 = FontHasSize("nonexistent_font", 12);
            Assert.False(testResult2);
        }
        [Fact]
        public void TestFontHasSizeIntegration()
        {
            var testFont = LoadFont("test_font", "hara.ttf");
            var hasSize12 = FontHasSize(testFont, 12);
            Assert.True(hasSize12);
            var hasSize999 = FontHasSize(testFont, 999);
            Assert.False(hasSize999);
            FreeFont(testFont);
        }
        [Fact]
        public void TestFontLoadSizeNameAsStringIntegration()
        {
            FontLoadSize("test_font", 12);
            var testFontSizeCheck = FontHasSize("test_font", 12);
            Assert.True(testFontSizeCheck);
        }
        [Fact]
        public void TestFontLoadSizeIntegration()
        {
            var testFont = LoadFont("test_font", "hara.ttf");
            FontLoadSize(testFont, 12);
            Assert.True(FontHasSize(testFont, 12));
            FreeFont(testFont);
        }
        [Fact]
        public void TestFontNamedIntegration()
        {
            var testWindow = OpenWindow("Font Test", 800, 600);
            var testFont = FontNamed("hara");
            DrawText("Test Text", ColorBlack(), testFont, 24, 100.0, 100.0);
            RefreshScreen();
            Assert.NotNull(testFont);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestFreeAllFontsIntegration()
        {
            var testFont = LoadFont("test_font", "hara.ttf");
            var testFontNamed = FontNamed("test_font");
            Assert.NotNull(testFontNamed);
            FreeAllFonts();
            var testHasFont = HasFont("test_font");
            Assert.False(testHasFont);
        }
        [Fact]
        public void TestFreeFontIntegration()
        {
            var testFont = LoadFont("test_font", "hara.ttf");
            FreeFont(testFont);
            Assert.False(HasFont(testFont));
        }
        [Fact]
        public void TestGetFontStyleNameAsStringIntegration()
        {
            var testFont = LoadFont("test_font", "hara.ttf");
            var testStyle = GetFontStyle("test_font");
            Assert.NotNull(testStyle);
            FreeFont(testFont);
        }
        [Fact]
        public void TestGetFontStyleIntegration()
        {
            var testFont = LoadFont("test_font", "hara.ttf");
            var testStyle = GetFontStyle(testFont);
            Assert.NotEqual(testStyle, FontStyle.BoldFont);
            FreeFont(testFont);
        }
        [Fact]
        public void TestGetSystemFontIntegration()
        {
            var testFont = GetSystemFont();
            Assert.NotNull(testFont);
            var testHasSize = FontHasSize(testFont, 12);
            Assert.True(testHasSize);
        }
        [Fact]
        public void TestHasFontIntegration()
        {
            var testFont = LoadFont("test_font", "hara.ttf");
            Assert.True(HasFont(testFont));
            FreeFont(testFont);
            Assert.False(HasFont(testFont));
        }
        [Fact]
        public void TestHasFontNameAsStringIntegration()
        {
            var testResultHara = HasFont("hara");
            Assert.True(testResultHara);
            var testResultNonexistent = HasFont("nonexistent_font");
            Assert.False(testResultNonexistent);
        }
        [Fact]
        public void TestLoadFontIntegration()
        {
            var testWindow = OpenWindow("Font Test", 800, 600);
            var testFont = LoadFont("test_font", "hara.ttf");
            DrawText("Hello, World!", ColorBlack(), testFont, 24, 100.0, 100.0, OptionDefaults());
            RefreshScreen();
            Assert.True(HasFont("test_font"));
            CloseWindow(testWindow);
            FreeFont(testFont);
        }
        [Fact]
        public void TestSetFontStyleNameAsStringIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testFont = LoadFont("test_font", "hara.ttf");
            FontLoadSize("test_font", 24);
            SetFontStyle("test_font", FontStyle.BoldFont);
            DrawText("Bold Text", ColorBlack(), "test_font", 24, 100.0, 100.0);
            RefreshScreen();
            Assert.Equal(GetFontStyle("test_font"), FontStyle.BoldFont);
            CloseWindow(testWindow);
            FreeFont(testFont);
        }
        [Fact]
        public void TestSetFontStyleIntegration()
        {
            var testFont = FontNamed("hara");
            SetFontStyle(testFont, FontStyle.BoldFont);
            var testStyle = GetFontStyle(testFont);
            Assert.Equal(testStyle, FontStyle.BoldFont);
            FreeFont(testFont);
        }
        [Fact]
        public void TestTextHeightFontNamedIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testHeight = TextHeight("Hello, World!", "hara", 24);
            Assert.True(testHeight > 0);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestTextHeightIntegration()
        {
            var testFont = LoadFont("test_font", "hara.ttf");
            FontLoadSize(testFont, 24);
            var testHeight = TextHeight("Hello, World!", testFont, 24);
            Assert.True(testHeight > 0);
            FreeFont(testFont);
        }
        [Fact]
        public void TestTextWidthFontNamedIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testWidth = TextWidth("Hello, World!", "hara", 24);
            DrawText("Hello, World!", ColorBlack(), "hara", 24, 100.0, 100.0);
            RefreshScreen();
            Assert.True(testWidth > 0);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestTextWidthIntegration()
        {
            var testFont = LoadFont("test_font", "hara.ttf");
            FontLoadSize(testFont, 12);
            var testWidth = TextWidth("Hello, World!", testFont, 12);
            Assert.True(testWidth > 0);
            FreeFont(testFont);
        }
        [Fact]
        public void TestDrawTriangleRecordIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testTriangle = TriangleFrom(PointAt(100.0, 100.0), PointAt(200.0, 200.0), PointAt(150.0, 300.0));
            DrawTriangle(ColorBlack(), testTriangle);
            RefreshScreen();
            Assert.True(PointInTriangle(PointAt(150.0, 200.0), testTriangle));
            Assert.False(PointInTriangle(PointAt(300.0, 300.0), testTriangle));
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestDrawTriangleRecordWithOptionsIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testTriangle = TriangleFrom(PointAt(100.0, 100.0), PointAt(200.0, 200.0), PointAt(150.0, 300.0));
            DrawTriangle(ColorBlack(), testTriangle, OptionDefaults());
            RefreshScreen();
            Assert.True(PointInTriangle(PointAt(150.0, 150.0), testTriangle));
            Assert.False(PointInTriangle(PointAt(300.0, 300.0), testTriangle));
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestDrawTriangleIntegration()
        {
            var testWindow = OpenWindow("Triangle Test", 800, 600);
            DrawTriangle(ColorBlack(), 100.0, 100.0, 200.0, 300.0, 300.0, 100.0);
            RefreshScreen();
            Assert.True(PointInTriangle(PointAt(150.0, 150.0), TriangleFrom(PointAt(100.0, 100.0), PointAt(200.0, 300.0), PointAt(300.0, 100.0))));
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestDrawTriangleWithOptionsIntegration()
        {
            var testWindow = OpenWindow("Triangle Test", 800, 600);
            DrawTriangle(ColorBlack(), 100.0, 100.0, 200.0, 200.0, 150.0, 300.0, OptionDefaults());
            RefreshScreen();
            Assert.True(PointInTriangle(PointAt(150.0, 150.0), TriangleFrom(PointAt(100.0, 100.0), PointAt(200.0, 200.0), PointAt(150.0, 300.0))));
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestDrawTriangleOnBitmapRecordIntegration()
        {
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testTriangle = TriangleFrom(PointAt(25.0, 25.0), PointAt(75.0, 25.0), PointAt(50.0, 75.0));
            DrawTriangleOnBitmap(testBitmap, ColorBlack(), testTriangle);
            Assert.True(PixelDrawnAtPoint(testBitmap, PointAt(50.0, 50.0)));
            Assert.False(PixelDrawnAtPoint(testBitmap, PointAt(10.0, 10.0)));
            FreeBitmap(testBitmap);
        }
        [Fact]
        public void TestDrawTriangleOnBitmapRecordWithOptionsIntegration()
        {
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testTriangle = TriangleFrom(PointAt(25.0, 25.0), PointAt(75.0, 25.0), PointAt(50.0, 75.0));
            DrawTriangleOnBitmap(testBitmap, ColorBlack(), testTriangle, OptionDefaults());
            Assert.True(PixelDrawnAtPoint(testBitmap, PointAt(50.0, 50.0)));
            Assert.False(PixelDrawnAtPoint(testBitmap, PointAt(10.0, 10.0)));
            FreeBitmap(testBitmap);
        }
        [Fact]
        public void TestDrawTriangleOnBitmapIntegration()
        {
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            DrawTriangleOnBitmap(testBitmap, ColorBlack(), 25.0, 25.0, 75.0, 25.0, 50.0, 75.0);
            Assert.True(PixelDrawnAtPoint(testBitmap, PointAt(50.0, 50.0)));
            Assert.False(PixelDrawnAtPoint(testBitmap, PointAt(10.0, 10.0)));
            FreeBitmap(testBitmap);
        }
        [Fact]
        public void TestDrawTriangleOnBitmapWithOptionsIntegration()
        {
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            DrawTriangleOnBitmap(testBitmap, ColorBlack(), 10.0, 10.0, 50.0, 90.0, 90.0, 10.0, OptionDefaults());
            Assert.True(PixelDrawnAtPoint(testBitmap, PointAt(50.0, 50.0)));
            Assert.False(PixelDrawnAtPoint(testBitmap, PointAt(100.0, 100.0)));
            FreeBitmap(testBitmap);
        }
        [Fact]
        public void TestDrawTriangleOnWindowRecordIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testTriangle = TriangleFrom(PointAt(100.0, 100.0), PointAt(200.0, 200.0), PointAt(150.0, 300.0));
            DrawTriangleOnWindow(testWindow, ColorBlack(), testTriangle);
            RefreshScreen();
            Assert.True(PointInTriangle(PointAt(150.0, 200.0), testTriangle));
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestDrawTriangleOnWindowRecordWithOptionsIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testTriangle = TriangleFrom(PointAt(100.0, 100.0), PointAt(200.0, 200.0), PointAt(150.0, 250.0));
            DrawTriangleOnWindow(testWindow, ColorBlack(), testTriangle, OptionDefaults());
            RefreshScreen();
            Assert.True(PointInTriangle(PointAt(150.0, 150.0), testTriangle));
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestDrawTriangleOnWindowIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            DrawTriangleOnWindow(testWindow, ColorBlack(), 100.0, 100.0, 200.0, 300.0, 300.0, 100.0);
            RefreshScreen();
            Assert.True(PointInTriangle(PointAt(200.0, 200.0), TriangleFrom(PointAt(100.0, 100.0), PointAt(200.0, 300.0), PointAt(300.0, 100.0))));
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestDrawTriangleOnWindowWithOptionsIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            DrawTriangleOnWindow(testWindow, ColorBlack(), 100.0, 100.0, 200.0, 200.0, 150.0, 300.0, OptionDefaults());
            RefreshScreen();
            Assert.True(PointInTriangle(PointAt(150.0, 200.0), TriangleFrom(100.0, 100.0, 200.0, 200.0, 150.0, 300.0)));
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestFillTriangleRecordIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testTriangle = TriangleFrom(PointAt(100.0, 100.0), PointAt(200.0, 300.0), PointAt(300.0, 100.0));
            FillTriangle(ColorBlack(), testTriangle);
            RefreshScreen();
            Assert.True(PointInTriangle(PointAt(200.0, 200.0), testTriangle));
            Assert.False(PointInTriangle(PointAt(400.0, 400.0), testTriangle));
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestFillTriangleRecordWithOptionsIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testTriangle = TriangleFrom(PointAt(100.0, 100.0), PointAt(200.0, 300.0), PointAt(300.0, 100.0));
            FillTriangle(ColorBlack(), testTriangle, OptionDefaults());
            RefreshScreen();
            Assert.True(PointInTriangle(PointAt(200.0, 200.0), testTriangle));
            Assert.False(PointInTriangle(PointAt(400.0, 400.0), testTriangle));
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestFillTriangleIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            FillTriangle(ColorBlack(), 100.0, 100.0, 200.0, 300.0, 300.0, 100.0);
            RefreshScreen();
            Assert.True(PointInTriangle(PointAt(150.0, 150.0), TriangleFrom(PointAt(100.0, 100.0), PointAt(200.0, 300.0), PointAt(300.0, 100.0))));
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestFillTriangleWithOptionsIntegration()
        {
            var testWindow = OpenWindow("Triangle Test", 800, 600);
            FillTriangle(ColorRed(), 100.0, 100.0, 200.0, 300.0, 300.0, 100.0, OptionDefaults());
            RefreshScreen();
            Assert.True(PointInTriangle(PointAt(150.0, 150.0), TriangleFrom(PointAt(100.0, 100.0), PointAt(200.0, 300.0), PointAt(300.0, 100.0))));
            Assert.False(PointInTriangle(PointAt(350.0, 150.0), TriangleFrom(PointAt(100.0, 100.0), PointAt(200.0, 300.0), PointAt(300.0, 100.0))));
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestFillTriangleOnBitmapRecordIntegration()
        {
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testTriangle = TriangleFrom(PointAt(25.0, 25.0), PointAt(75.0, 25.0), PointAt(50.0, 75.0));
            FillTriangleOnBitmap(testBitmap, ColorBlack(), testTriangle);
            Assert.True(PixelDrawnAtPoint(testBitmap, PointAt(50.0, 50.0)));
            Assert.False(PixelDrawnAtPoint(testBitmap, PointAt(0.0, 0.0)));
            FreeBitmap(testBitmap);
        }
        [Fact]
        public void TestFillTriangleOnBitmapRecordWithOptionsIntegration()
        {
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testTriangle = TriangleFrom(PointAt(25.0, 25.0), PointAt(75.0, 25.0), PointAt(50.0, 75.0));
            FillTriangleOnBitmap(testBitmap, ColorBlack(), testTriangle, OptionDefaults());
            Assert.True(PixelDrawnAtPoint(testBitmap, PointAt(50.0, 50.0)));
            Assert.False(PixelDrawnAtPoint(testBitmap, PointAt(10.0, 10.0)));
            FreeBitmap(testBitmap);
        }
        [Fact]
        public void TestFillTriangleOnBitmapIntegration()
        {
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            FillTriangleOnBitmap(testBitmap, ColorBlack(), 25.0, 25.0, 75.0, 25.0, 50.0, 75.0);
            Assert.True(PixelDrawnAtPoint(testBitmap, 50.0, 50.0));
            Assert.False(PixelDrawnAtPoint(testBitmap, 0.0, 0.0));
            FreeBitmap(testBitmap);
        }
        [Fact]
        public void TestFillTriangleOnBitmapWithOptionsIntegration()
        {
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            FillTriangleOnBitmap(testBitmap, ColorBlack(), 25.0, 25.0, 75.0, 25.0, 50.0, 75.0, OptionDefaults());
            Assert.True(PixelDrawnAtPoint(testBitmap, 50.0, 50.0));
            Assert.False(PixelDrawnAtPoint(testBitmap, 0.0, 0.0));
            FreeBitmap(testBitmap);
        }
        [Fact]
        public void TestFillTriangleOnWindowRecordIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testTriangle = TriangleFrom(PointAt(100.0, 100.0), PointAt(200.0, 300.0), PointAt(300.0, 100.0));
            FillTriangleOnWindow(testWindow, ColorBlack(), testTriangle);
            RefreshScreen();
            Assert.True(PointInTriangle(PointAt(200.0, 200.0), testTriangle));
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestFillTriangleOnWindowRecordWithOptionsIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testTriangle = TriangleFrom(PointAt(100.0, 100.0), PointAt(200.0, 300.0), PointAt(300.0, 100.0));
            FillTriangleOnWindow(testWindow, ColorBlack(), testTriangle, OptionDefaults());
            RefreshScreen();
            Assert.True(PointInTriangle(PointAt(200.0, 200.0), testTriangle));
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestFillTriangleOnWindowIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            FillTriangleOnWindow(testWindow, ColorBlack(), 100.0, 100.0, 200.0, 300.0, 300.0, 100.0);
            RefreshScreen();
            Assert.True(PointInTriangle(PointAt(200.0, 200.0), TriangleFrom(PointAt(100.0, 100.0), PointAt(200.0, 300.0), PointAt(300.0, 100.0))));
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestFillTriangleOnWindowWithOptionsIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            FillTriangleOnWindow(testWindow, ColorBlack(), 100.0, 100.0, 200.0, 300.0, 300.0, 100.0, OptionDefaults());
            RefreshScreen();
            Assert.True(PointInTriangle(PointAt(150.0, 150.0), TriangleFrom(PointAt(100.0, 100.0), PointAt(200.0, 300.0), PointAt(300.0, 100.0))));
            Assert.False(PointInTriangle(PointAt(350.0, 150.0), TriangleFrom(PointAt(100.0, 100.0), PointAt(200.0, 300.0), PointAt(300.0, 100.0))));
            CloseWindow(testWindow);
        }
    }
}
