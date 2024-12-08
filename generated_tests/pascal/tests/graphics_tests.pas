uses SplashKit, TestFramework

type
TIntegrationTests = class(TTestCase)
published
procedure TIntegrationTests.TestDrawCircleRecordIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    testCircle := CircleAt(400.0, 300.0, 50.0);
    DrawCircle(ColorBlack(), testCircle);
    RefreshScreen();
    AssertTrue(PointInCircle(PointAt(400.0, 300.0), testCircle));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestDrawCircleRecordWithOptionsIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    testCircle := CircleAt(400.0, 300.0, 50.0);
    DrawCircle(ColorBlack(), testCircle, OptionDefaults());
    RefreshScreen();
    AssertTrue(PointInCircle(PointAt(400.0, 300.0), testCircle));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestDrawCircleIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    DrawCircle(ColorBlack(), 400.0, 300.0, 50.0);
    RefreshScreen();
    AssertTrue(PointInCircle(PointAt(400.0, 300.0), CircleAt(400.0, 300.0, 50.0)));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestDrawCircleWithOptionsIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    DrawCircle(ColorBlack(), 400.0, 300.0, 50.0, OptionDefaults());
    RefreshScreen();
    AssertTrue(PointInCircle(PointAt(400.0, 300.0), CircleAt(400.0, 300.0, 50.0)));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestDrawCircleOnBitmapIntegration;
begin
    testBitmap := CreateBitmap("test_bitmap", 200, 200);
    DrawCircleOnBitmap(testBitmap, ColorBlack(), 100.0, 100.0, 50.0);
    AssertTrue(PixelDrawnAtPoint(testBitmap, 100.0, 100.0));
    FreeBitmap(testBitmap);
end;
procedure TIntegrationTests.TestDrawCircleOnBitmapWithOptionsIntegration;
begin
    testBitmap := CreateBitmap("test_bitmap", 200, 200);
    DrawCircleOnBitmap(testBitmap, ColorBlack(), 100.0, 100.0, 50.0, OptionDefaults());
    AssertTrue(PixelDrawnAtPoint(testBitmap, 100.0, 100.0));
    FreeBitmap(testBitmap);
end;
procedure TIntegrationTests.TestDrawCircleOnWindowIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    DrawCircleOnWindow(testWindow, ColorBlack(), 400.0, 300.0, 50.0);
    RefreshScreen();
    AssertTrue(PointInCircle(PointAt(400.0, 300.0), CircleAt(400.0, 300.0, 50.0)));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestDrawCircleOnWindowWithOptionsIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    DrawCircleOnWindow(testWindow, ColorBlack(), 400.0, 300.0, 50.0, OptionDefaults());
    RefreshScreen();
    AssertTrue(PointInCircle(PointAt(400.0, 300.0), CircleAt(400.0, 300.0, 50.0)));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestFillCircleRecordIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    testCircle := CircleAt(400.0, 300.0, 50.0);
    FillCircle(ColorBlack(), testCircle);
    RefreshScreen();
    AssertTrue(PointInCircle(PointAt(400.0, 300.0), testCircle));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestFillCircleRecordWithOptionsIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    testCircle := CircleAt(400.0, 300.0, 50.0);
    FillCircle(ColorBlack(), testCircle, OptionDefaults());
    RefreshScreen();
    AssertTrue(PointInCircle(PointAt(400.0, 300.0), testCircle));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestFillCircleIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    FillCircle(ColorBlack(), 400.0, 300.0, 50.0);
    RefreshScreen();
    AssertTrue(PointInCircle(PointAt(400.0, 300.0), CircleAt(400.0, 300.0, 50.0)));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestFillCircleWithOptionsIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    FillCircle(ColorBlack(), 400.0, 300.0, 50.0, OptionDefaults());
    RefreshScreen();
    AssertTrue(PointInCircle(PointAt(400.0, 300.0), CircleAt(400.0, 300.0, 50.0)));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestFillCircleOnBitmapIntegration;
begin
    testBitmap := CreateBitmap("test_bitmap", 200, 200);
    FillCircleOnBitmap(testBitmap, ColorRed(), 100.0, 100.0, 50.0);
    AssertTrue(PixelDrawnAtPoint(testBitmap, 100.0, 100.0));
    AssertTrue(PixelDrawnAtPoint(testBitmap, 150.0, 100.0));
    AssertFalse(PixelDrawnAtPoint(testBitmap, 200.0, 100.0));
    FreeBitmap(testBitmap);
end;
procedure TIntegrationTests.TestFillCircleOnBitmapWithOptionsIntegration;
begin
    testBitmap := CreateBitmap("test_bitmap", 200, 200);
    FillCircleOnBitmap(testBitmap, ColorBlack(), 100.0, 100.0, 50.0, OptionDefaults());
    AssertTrue(PixelDrawnAtPoint(testBitmap, 100.0, 100.0));
    AssertTrue(PixelDrawnAtPoint(testBitmap, 150.0, 100.0));
    AssertFalse(PixelDrawnAtPoint(testBitmap, 200.0, 100.0));
    FreeBitmap(testBitmap);
end;
procedure TIntegrationTests.TestFillCircleOnWindowIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    FillCircleOnWindow(testWindow, ColorBlack(), 400.0, 300.0, 50.0);
    RefreshScreen();
    AssertTrue(PointInCircle(PointAt(400.0, 300.0), CircleAt(400.0, 300.0, 50.0)));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestFillCircleOnWindowWithOptionsIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    FillCircleOnWindow(testWindow, ColorBlack(), 400.0, 300.0, 50.0, OptionDefaults());
    RefreshScreen();
    AssertTrue(PointInCircle(PointAt(400.0, 300.0), CircleAt(400.0, 300.0, 50.0)));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestCurrentClipIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    testClip := CurrentClip();
    AssertEquals(800, testClip.width);
    AssertEquals(600, testClip.height);
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestCurrentClipForBitmapIntegration;
begin
    testBitmap := CreateBitmap("test_bitmap", 100, 100);
    testRectangle := RectangleFrom(10, 10, 50, 50);
    PushClip(testBitmap, testRectangle);
    testClip := CurrentClip(testBitmap);
    AssertEquals(10, RectangleLeft(testClip));
    AssertEquals(10, RectangleTop(testClip));
    AssertEquals(50, testClip.width);
    AssertEquals(50, testClip.height);
    FreeBitmap(testBitmap);
end;
procedure TIntegrationTests.TestCurrentClipForWindowIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    testClip := CurrentClip(testWindow);
    AssertEquals(testClip, RectangleFrom(0, 0, 800, 600));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestPopClipForWindowIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    testRectangle := RectangleFrom(100, 100, 200, 200);
    PushClip(testWindow, testRectangle);
    testCurrentClip := CurrentClip(testWindow);
    AssertEquals(testRectangle, testCurrentClip);
    PopClip(testWindow);
    testCurrentClipAfterPop := CurrentClip(testWindow);
    AssertEquals(testCurrentClipAfterPop, RectangleFrom(0, 0, 800, 600));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestPopClipIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    PushClip(RectangleFrom(100, 100, 200, 200));
    DrawCircle(ColorBlack(), 150, 150, 50);
    RefreshScreen();
    AssertTrue(PointInCircle(PointAt(150, 150), CircleAt(150, 150, 50)));
    PopClip();
    DrawCircle(ColorRed(), 300, 300, 50);
    RefreshScreen();
    AssertTrue(PointInCircle(PointAt(300, 300), CircleAt(300, 300, 50)));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestPopClipForBitmapIntegration;
begin
    testBitmap := CreateBitmap("test_bitmap", 100, 100);
    PushClip(testBitmap, RectangleFrom(0, 0, 50, 50));
    PopClip(testBitmap);
    AssertEquals(RectangleFrom(0, 0, 100, 100), CurrentClip(testBitmap));
    FreeBitmap(testBitmap);
end;
procedure TIntegrationTests.TestPushClipForWindowIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    testRectangle := RectangleFrom(100.0, 100.0, 200.0, 200.0);
    PushClip(testWindow, testRectangle);
    testCurrentClip := CurrentClip(testWindow);
    AssertEquals(testRectangle, testCurrentClip);
    RefreshScreen();
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestPushClipForBitmapIntegration;
begin
    testBitmap := CreateBitmap("test_bitmap", 200, 200);
    testRectangle := RectangleFrom(50, 50, 100, 100);
    PushClip(testBitmap, testRectangle);
    testCurrentClip := CurrentClip(testBitmap);
    AssertEquals(50, RectangleLeft(testCurrentClip));
    AssertEquals(50, RectangleTop(testCurrentClip));
    AssertEquals(100, testCurrentClip.width);
    AssertEquals(100, testCurrentClip.height);
    FreeBitmap(testBitmap);
end;
procedure TIntegrationTests.TestPushClipIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    testRectangle := RectangleFrom(100.0, 100.0, 200.0, 200.0);
    PushClip(testRectangle);
    testCurrentClip := CurrentClip();
    AssertEquals(testRectangle, testCurrentClip);
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestResetClipForBitmapIntegration;
begin
    testBitmap := CreateBitmap("test_bitmap", 100, 100);
    PushClip(testBitmap, RectangleFrom(10, 10, 50, 50));
    ResetClip(testBitmap);
    AssertEquals(RectangleFrom(0, 0, 100, 100), CurrentClip(testBitmap));
    FreeBitmap(testBitmap);
end;
procedure TIntegrationTests.TestResetClipIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    PushClip(RectangleFrom(100, 100, 200, 200));
    ResetClip();
    testClipRect := CurrentClip();
    AssertEquals(testClipRect, RectangleFrom(0, 0, 800, 600));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestResetClipForWindowIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    PushClip(testWindow, RectangleFrom(100, 100, 200, 200));
    ResetClip(testWindow);
    testClipRect := CurrentClip(testWindow);
    AssertEquals(testClipRect, RectangleFrom(0, 0, 800, 600));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestSetClipIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    testRectangle := RectangleFrom(100.0, 100.0, 200.0, 200.0);
    SetClip(testRectangle);
    testCurrentClip := CurrentClip();
    AssertEquals(testRectangle, testCurrentClip);
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestSetClipForBitmapIntegration;
begin
    testBitmap := CreateBitmap("test_bitmap", 200, 200);
    testRectangle := RectangleFrom(50, 50, 100, 100);
    SetClip(testBitmap, testRectangle);
    testCurrentClip := CurrentClip(testBitmap);
    AssertEquals(testRectangle, testCurrentClip);
    FreeBitmap(testBitmap);
end;
procedure TIntegrationTests.TestSetClipForWindowIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    testRectangle := RectangleFrom(100, 100, 200, 200);
    SetClip(testWindow, testRectangle);
    testCurrentClip := CurrentClip(testWindow);
    AssertEquals(testRectangle, testCurrentClip);
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestOptionDefaultsIntegration;
begin
    testOptions := OptionDefaults();
    AssertNotNull(testOptions);
end;
procedure TIntegrationTests.TestOptionDrawToBitmapIntegration;
begin
    testBitmap := CreateBitmap("test_bitmap", 100, 100);
    testOptions := OptionDrawTo(testBitmap);
    DrawCircle(ColorBlack(), CircleAt(50.0, 50.0, 25.0), testOptions);
    AssertTrue(PixelDrawnAtPoint(testBitmap, 50.0, 50.0));
    AssertFalse(PixelDrawnAtPoint(testBitmap, 100.0, 100.0));
    FreeBitmap(testBitmap);
end;
procedure TIntegrationTests.TestOptionDrawToBitmapWithOptionsIntegration;
begin
    testBitmap := CreateBitmap("test_bitmap", 100, 100);
    testOptions := OptionDefaults();
    testDrawingOptions := OptionDrawTo(testBitmap, testOptions);
    DrawCircle(ColorBlack(), CircleAt(50.0, 50.0, 25.0), testDrawingOptions);
    AssertTrue(PixelDrawnAtPoint(testBitmap, 50.0, 50.0));
    AssertFalse(PixelDrawnAtPoint(testBitmap, 100.0, 100.0));
    FreeBitmap(testBitmap);
end;
procedure TIntegrationTests.TestOptionDrawToWindowIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    testCircle := CircleAt(400.0, 300.0, 50.0);
    DrawCircle(ColorBlack(), testCircle, OptionDrawTo(testWindow));
    RefreshScreen();
    AssertTrue(PointInCircle(PointAt(400.0, 300.0), testCircle));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestOptionDrawToWindowWithOptionsIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    testOptions := OptionDefaults();
    testDrawOptions := OptionDrawTo(testWindow, testOptions);
    DrawCircle(ColorBlack(), CircleAt(400.0, 300.0, 50.0), testDrawOptions);
    RefreshScreen();
    AssertTrue(PointInCircle(PointAt(400.0, 300.0), CircleAt(400.0, 300.0, 50.0)));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestOptionFlipXIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    testBitmap := LoadBitmap("test_bitmap", "test_bitmap.png");
    DrawBitmap(testBitmap, 100.0, 100.0, OptionFlipX());
    RefreshScreen();
    AssertTrue(PixelDrawnAtPoint(testBitmap, PointAt(50.0, 100.0)));
    AssertFalse(PixelDrawnAtPoint(testBitmap, PointAt(150.0, 100.0)));
    FreeBitmap(testBitmap);
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestOptionFlipXWithOptionsIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    testBitmap := LoadBitmap("test_bitmap", "test_bitmap.png");
    DrawBitmap(testBitmap, 400, 300, OptionFlipX(OptionDefaults()));
    RefreshScreen();
    AssertTrue(PixelDrawnAtPoint(testBitmap, PointAt(BitmapWidth(testBitmap), BitmapHeight(testBitmap))));
    AssertFalse(PixelDrawnAtPoint(testBitmap, PointAt(0, BitmapHeight(testBitmap))));
    FreeBitmap(testBitmap);
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestOptionFlipXyIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    testBitmap := LoadBitmap("test_bitmap", "test_bitmap.png");
    DrawBitmap(testBitmap, 400.0, 300.0, OptionFlipXy());
    RefreshScreen();
    AssertTrue(PixelDrawnAtPoint(testBitmap, PointAt(BitmapWidth(testBitmap), 0.0)));
    AssertTrue(PixelDrawnAtPoint(testBitmap, PointAt(0.0, BitmapHeight(testBitmap))));
    FreeBitmap(testBitmap);
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestOptionFlipXyWithOptionsIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    testBitmap := LoadBitmap("test_bitmap", "test_bitmap.png");
    testOptions := OptionDefaults();
    testOptionsFlipped := OptionFlipXy(testOptions);
    DrawBitmap(testBitmap, 400, 300, testOptionsFlipped);
    RefreshScreen();
    AssertTrue(PixelDrawnAtPoint(testBitmap, PointAt(BitmapWidth(testBitmap), 0)));
    AssertFalse(PixelDrawnAtPoint(testBitmap, PointAt(0, BitmapHeight(testBitmap))));
    FreeBitmap(testBitmap);
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestOptionFlipYIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    testBitmap := LoadBitmap("test_bitmap", "test_bitmap.png");
    DrawBitmap(testBitmap, 400.0, 300.0, OptionFlipY());
    RefreshScreen();
    AssertTrue(PixelDrawnAtPoint(testBitmap, 400.0, BitmapHeight(testBitmap)));
    AssertFalse(PixelDrawnAtPoint(testBitmap, 400.0, 0.0));
    FreeBitmap(testBitmap);
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestOptionFlipYWithOptionsIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    testBitmap := LoadBitmap("test_bitmap", "test_bitmap.png");
    DrawBitmap(testBitmap, 400.0, 300.0, OptionFlipY(OptionDefaults()));
    RefreshScreen();
    AssertTrue(PixelDrawnAtPoint(testBitmap, PointAt(400.0, BitmapHeight(testBitmap))));
    AssertFalse(PixelDrawnAtPoint(testBitmap, PointAt(400.0, 0.0)));
    FreeBitmap(testBitmap);
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestOptionLineWidthIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    DrawLine(ColorBlack(), 100.0, 100.0, 200.0, 200.0, OptionLineWidth(1));
    RefreshScreen();
    AssertEquals(ColorBlack(), GetPixel(PointAt(100.0, 100.0)));
    DrawLine(ColorBlack(), 300.0, 300.0, 400.0, 400.0, OptionLineWidth(5));
    RefreshScreen();
    AssertEquals(ColorBlack(), GetPixel(PointAt(300.0, 300.0)));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestOptionLineWidthWithOptionsIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    testCircle := CircleAt(400.0, 300.0, 50.0);
    DrawCircle(ColorBlack(), testCircle, OptionLineWidth(3, OptionDefaults()));
    RefreshScreen();
    AssertTrue(PointInCircle(PointAt(400.0, 300.0), testCircle));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestOptionPartBmpIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    testBitmap := LoadBitmap("test_bitmap", "test_bitmap.png");
    testOptions := OptionPartBmp(0.0, 0.0, 50.0, 50.0);
    DrawBitmap(testBitmap, 100.0, 100.0, testOptions);
    RefreshScreen();
    AssertTrue(PixelDrawnAtPoint(testBitmap, PointAt(25.0, 25.0)));
    AssertFalse(PixelDrawnAtPoint(testBitmap, PointAt(75.0, 75.0)));
    FreeBitmap(testBitmap);
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestOptionPartBmpWithOptionsIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    testBitmap := LoadBitmap("test_bitmap", "test_bitmap.png");
    testOptions := OptionPartBmp(10.0, 10.0, 50.0, 50.0, OptionDefaults());
    DrawBitmap(testBitmap, 100.0, 100.0, testOptions);
    RefreshScreen();
    AssertTrue(PixelDrawnAtPoint(testBitmap, PointAt(110.0, 110.0)));
    AssertFalse(PixelDrawnAtPoint(testBitmap, PointAt(160.0, 160.0)));
    FreeBitmap(testBitmap);
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestOptionPartBmpFromRectangleIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    testBitmap := LoadBitmap("test_bitmap", "test_bitmap.png");
    testRectangle := RectangleFrom(100, 100, 200, 200);
    testOptions := OptionPartBmp(testRectangle);
    DrawBitmap(testBitmap, 0, 0, testOptions);
    RefreshScreen();
    AssertTrue(PixelDrawnAtPoint(testBitmap, PointAt(150, 150)));
    AssertFalse(PixelDrawnAtPoint(testBitmap, PointAt(350, 350)));
    FreeBitmap(testBitmap);
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestOptionPartBmpFromRectangleWithOptionsIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    testBitmap := LoadBitmap("test_bitmap", "test_bitmap.png");
    testRectangle := RectangleFrom(100.0, 100.0, 200.0, 200.0);
    testOptions := OptionPartBmp(testRectangle, OptionDefaults());
    DrawBitmap(testBitmap, 0.0, 0.0, testOptions);
    RefreshScreen();
    AssertTrue(PixelDrawnAtPoint(testBitmap, PointAt(150.0, 150.0)));
    AssertFalse(PixelDrawnAtPoint(testBitmap, PointAt(350.0, 350.0)));
    FreeBitmap(testBitmap);
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestOptionRotateBmpIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    testBitmap := LoadBitmap("test_bitmap", "test_bitmap.png");
    DrawBitmap(testBitmap, 400.0, 300.0, OptionRotateBmp(45.0));
    RefreshScreen();
    AssertTrue(PixelDrawnAtPoint(testBitmap, PointAt(400.0, 300.0)));
    AssertFalse(PixelDrawnAtPoint(testBitmap, PointAt(BitmapWidth(testBitmap), 300.0)));
    FreeBitmap(testBitmap);
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestOptionRotateBmpWithAnchorIntegration;
begin
    testWindow := OpenWindow("Rotation Test", 800, 600);
    testBitmap := LoadBitmap("test_bitmap", "test_bitmap.png");
    testOptions := OptionRotateBmp(45.0, 50.0, 50.0);
    DrawBitmap(testBitmap, 400.0, 300.0, testOptions);
    RefreshScreen();
    AssertTrue(PixelDrawnAtPoint(testBitmap, PointAt(400.0, 300.0)));
    AssertTrue(PixelDrawnAtPoint(testBitmap, PointAt(BitmapWidth(testBitmap), BitmapHeight(testBitmap))));
    FreeBitmap(testBitmap);
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestOptionRotateBmpWithAnchorAndOptionsIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    testBitmap := LoadBitmap("test_bitmap", "test_bitmap.png");
    testOptions := OptionRotateBmp(45.0, 50.0, 50.0, OptionDefaults());
    DrawBitmap(testBitmap, 400.0, 300.0, testOptions);
    RefreshScreen();
    AssertTrue(PixelDrawnAtPoint(testBitmap, PointAt(400.0, 300.0)));
    FreeBitmap(testBitmap);
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestOptionRotateBmpWithOptionsIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    testBitmap := LoadBitmap("test_bitmap", "test_bitmap.png");
    testOptions := OptionRotateBmp(45.0, OptionDefaults());
    DrawBitmap(testBitmap, 400.0, 300.0, testOptions);
    RefreshScreen();
    AssertTrue(PixelDrawnAtPoint(testBitmap, PointAt(400.0, 300.0)));
    AssertTrue(PixelDrawnAtPoint(testBitmap, PointAt(Cosine(45.0), Sine(45.0))));
    FreeBitmap(testBitmap);
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestOptionScaleBmpIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    testBitmap := LoadBitmap("test_bitmap", "test_bitmap.png");
    DrawBitmap(testBitmap, 100.0, 100.0, OptionScaleBmp(2.0, 2.0));
    RefreshScreen();
    AssertTrue(PixelDrawnAtPoint(testBitmap, PointAt(100.0, 100.0)));
    AssertTrue(PixelDrawnAtPoint(testBitmap, PointAt(BitmapWidth(testBitmap), BitmapHeight(testBitmap))));
    FreeBitmap(testBitmap);
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestOptionScaleBmpWithOptionsIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    testBitmap := LoadBitmap("test_bitmap", "test_bitmap.png");
    testOptions := OptionScaleBmp(2.0, 2.0, OptionDefaults());
    DrawBitmap(testBitmap, 100.0, 100.0, testOptions);
    RefreshScreen();
    AssertTrue(PixelDrawnAtPoint(testBitmap, PointAt(100.0, 100.0)));
    AssertTrue(PixelDrawnAtPoint(testBitmap, PointAt(BitmapWidth(testBitmap), BitmapHeight(testBitmap))));
    FreeBitmap(testBitmap);
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestOptionToScreenIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    testOptions := OptionToScreen();
    DrawCircle(ColorBlack(), CircleAt(400.0, 300.0, 50.0), testOptions);
    RefreshScreen();
    AssertTrue(PointInCircle(PointAt(400.0, 300.0), CircleAt(400.0, 300.0, 50.0)));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestOptionToScreenWithOptionsIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    testOptions := OptionDefaults();
    testScreenOptions := OptionToScreen(testOptions);
    DrawCircle(ColorBlack(), CircleAt(400.0, 300.0, 50.0), testScreenOptions);
    RefreshScreen();
    AssertTrue(PointInCircle(PointAt(400.0, 300.0), CircleAt(400.0, 300.0, 50.0)));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestOptionToWorldIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    MoveCameraTo(100.0, 100.0);
    DrawCircle(ColorBlack(), 100.0, 100.0, 50.0, OptionToWorld());
    RefreshScreen();
    AssertTrue(PointInCircle(PointAt(0.0, 0.0), CircleAt(100.0, 100.0, 50.0)));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestOptionToWorldWithOptionsIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    testOptions := OptionDefaults();
    testWorldOptions := OptionToWorld(testOptions);
    DrawCircle(ColorBlack(), CircleAt(100.0, 100.0, 50.0), testWorldOptions);
    RefreshScreen();
    AssertTrue(PointInCircle(PointAt(100.0, 100.0), CircleAt(100.0, 100.0, 50.0)));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestOptionWithAnimationIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    testBitmap := CreateBitmap("test_bitmap", 100, 100);
    testAnimation := CreateAnimation("script", "test_animation");
    DrawBitmap(testBitmap, 100, 100, OptionWithAnimation(testAnimation));
    DrawBitmap(testBitmap, 100.0, 100.0, OptionWithAnimation(testAnimation));
    RefreshScreen();
    AssertTrue(PixelDrawnAtPoint(testBitmap, PointAt(50.0, 50.0)));
    FreeBitmap(testBitmap);
    FreeAnimation(testAnimation);
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestOptionWithAnimationWithOptionsIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    testBitmap := LoadBitmap("test_bitmap", "test_bitmap.png");
    testAnimation := CreateAnimation("script", "test_animation");
    DrawBitmap(testBitmap, 100, 100, OptionWithAnimation(testAnimation));
    testOptions := OptionWithAnimation(testAnimation, OptionDefaults());
    DrawBitmap(testBitmap, 100.0, 100.0, testOptions);
    RefreshScreen();
    AssertTrue(PixelDrawnAtPoint(testBitmap, PointAt(100.0, 100.0)));
    FreeBitmap(testBitmap);
    FreeAnimation(testAnimation);
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestOptionWithBitmapCellIntegration;
begin
    testBitmap := LoadBitmap("test_bitmap", "test_bitmap.png");
    BitmapSetCellDetails(testBitmap, 32, 32, 4, 4, 16);
    testWindow := OpenWindow("Test Window", 800, 600);
    DrawBitmap(testBitmap, 100.0, 100.0, OptionWithBitmapCell(5));
    RefreshScreen();
    AssertTrue(PixelDrawnAtPoint(testBitmap, PointAt(116.0, 116.0)));
    AssertFalse(PixelDrawnAtPoint(testBitmap, PointAt(150.0, 150.0)));
    CloseWindow(testWindow);
    FreeBitmap(testBitmap);
end;
procedure TIntegrationTests.TestOptionWithBitmapCellWithOptionsIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    testBitmap := LoadBitmap("test_bitmap", "test_bitmap.png");
    BitmapSetCellDetails(testBitmap, 32, 32, 4, 4, 16);
    testOptions := OptionWithBitmapCell(5, OptionDefaults());
    DrawBitmap(testBitmap, 100.0, 100.0, testOptions);
    RefreshScreen();
    AssertTrue(PixelDrawnAtPoint(testBitmap, PointAt(116.0, 116.0)));
    AssertFalse(PixelDrawnAtPoint(testBitmap, PointAt(150.0, 150.0)));
    FreeBitmap(testBitmap);
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestDrawEllipseWithinRectangleIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    testRectangle := RectangleFrom(100.0, 100.0, 200.0, 150.0);
    DrawEllipse(ColorBlack(), testRectangle, OptionDefaults());
    RefreshScreen();
    AssertTrue(PointInCircle(PointAt(200.0, 175.0), CircleAt(RectangleCenter(testRectangle), testRectangle.width)));
    AssertFalse(PointInCircle(PointAt(350.0, 175.0), CircleAt(RectangleCenter(testRectangle), testRectangle.width)));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestDrawEllipseWithinRectangleWithOptionsIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    testRectangle := RectangleFrom(100.0, 100.0, 200.0, 100.0);
    DrawEllipse(ColorBlack(), testRectangle, OptionDefaults());
    RefreshScreen();
    AssertTrue(PointInCircle(PointAt(200.0, 150.0), CircleAt(RectangleCenter(testRectangle), testRectangle.width)));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestDrawEllipseIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    DrawEllipse(ColorBlack(), 400.0, 300.0, 100.0, 50.0);
    RefreshScreen();
    AssertTrue(PointInCircle(PointAt(400.0, 300.0), CircleAt(400.0, 300.0, 50.0)));
    AssertFalse(PointInCircle(PointAt(550.0, 300.0), CircleAt(400.0, 300.0, 50.0)));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestDrawEllipseWithOptionsIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    DrawEllipse(ColorBlack(), 400.0, 300.0, 100.0, 50.0, OptionDefaults());
    RefreshScreen();
    AssertTrue(PointInCircle(PointAt(400.0, 300.0), CircleAt(400.0, 300.0, 50.0)));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestDrawEllipseOnBitmapWithinRectangleIntegration;
begin
    testBitmap := CreateBitmap("test_bitmap", 200, 200);
    testRectangle := RectangleFrom(50.0, 50.0, 100.0, 100.0);
    DrawEllipseOnBitmap(testBitmap, ColorBlack(), testRectangle);
    AssertTrue(PixelDrawnAtPoint(testBitmap, PointAt(100.0, 100.0)));
    AssertFalse(PixelDrawnAtPoint(testBitmap, PointAt(200.0, 200.0)));
    FreeBitmap(testBitmap);
end;
procedure TIntegrationTests.TestDrawEllipseOnBitmapWithinRectangleWithOptionsIntegration;
begin
    testBitmap := CreateBitmap("test_bitmap", 200, 200);
    testRect := RectangleFrom(50.0, 50.0, 100.0, 100.0);
    DrawEllipseOnBitmap(testBitmap, ColorBlack(), testRect, OptionDefaults());
    AssertTrue(PixelDrawnAtPoint(testBitmap, PointAt(75.0, 75.0)));
    AssertFalse(PixelDrawnAtPoint(testBitmap, PointAt(0.0, 0.0)));
    FreeBitmap(testBitmap);
end;
procedure TIntegrationTests.TestDrawEllipseOnBitmapIntegration;
begin
    testBitmap := CreateBitmap("test_bitmap", 200, 200);
    testColor := ColorBlack();
    DrawEllipseOnBitmap(testBitmap, testColor, 100.0, 100.0, 50.0, 30.0);
    AssertTrue(PixelDrawnAtPoint(testBitmap, 100.0, 100.0));
    AssertFalse(PixelDrawnAtPoint(testBitmap, 160.0, 100.0));
    FreeBitmap(testBitmap);
end;
procedure TIntegrationTests.TestDrawEllipseOnBitmapWithOptionsIntegration;
begin
    testBitmap := CreateBitmap("test_bitmap", 200, 200);
    DrawEllipseOnBitmap(testBitmap, ColorBlack(), 100.0, 100.0, 50.0, 30.0, OptionDefaults());
    AssertTrue(PixelDrawnAtPoint(testBitmap, PointAt(100.0, 100.0)));
    AssertFalse(PixelDrawnAtPoint(testBitmap, PointAt(150.0, 100.0)));
    FreeBitmap(testBitmap);
end;
procedure TIntegrationTests.TestDrawEllipseOnWindowWithinRectangleIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    testRectangle := RectangleFrom(100.0, 100.0, 200.0, 100.0);
    DrawEllipseOnWindow(testWindow, ColorBlack(), testRectangle);
    RefreshScreen();
    AssertTrue(PointInCircle(PointAt(200.0, 150.0), CircleAt(RectangleCenter(testRectangle), testRectangle.width)));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestDrawEllipseOnWindowWithinRectangleWithOptionsIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    testRect := RectangleFrom(100.0, 100.0, 200.0, 100.0);
    DrawEllipseOnWindow(testWindow, ColorBlack(), testRect, OptionDefaults());
    RefreshScreen();
    AssertTrue(PointInCircle(PointAt(200.0, 150.0), CircleAt(PointAt(200.0, 150.0), 100.0)));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestDrawEllipseOnWindowIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    DrawEllipseOnWindow(testWindow, ColorBlack(), 400.0, 300.0, 100.0, 50.0);
    RefreshScreen();
    AssertTrue(PointInCircle(PointAt(400.0, 300.0), CircleAt(400.0, 300.0, 50.0)));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestDrawEllipseOnWindowWithOptionsIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    DrawEllipseOnWindow(testWindow, ColorBlack(), 400.0, 300.0, 100.0, 50.0, OptionDefaults());
    RefreshScreen();
    AssertTrue(PointInCircle(PointAt(400.0, 300.0), CircleAt(400.0, 300.0, 50.0)));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestFillEllipseWithinRectangleIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    testRectangle := RectangleFrom(100.0, 100.0, 200.0, 100.0);
    FillEllipse(ColorBlack(), testRectangle);
    RefreshScreen();
    AssertTrue(PointInCircle(PointAt(200.0, 150.0), CircleAt(RectangleCenter(testRectangle), testRectangle.width)));
    AssertFalse(PointInCircle(PointAt(350.0, 150.0), CircleAt(RectangleCenter(testRectangle), testRectangle.width)));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestFillEllipseWithinRectangleWithOptionsIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    testRectangle := RectangleFrom(100.0, 100.0, 200.0, 100.0);
    FillEllipse(ColorBlack(), testRectangle, OptionDefaults());
    RefreshScreen();
    AssertTrue(PointInCircle(PointAt(200.0, 150.0), CircleAt(RectangleCenter(testRectangle), testRectangle.width)));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestFillEllipseIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    FillEllipse(ColorBlack(), 400.0, 300.0, 100.0, 50.0);
    RefreshScreen();
    AssertTrue(PointInCircle(PointAt(400.0, 300.0), CircleAt(400.0, 300.0, 50.0)));
    AssertFalse(PointInCircle(PointAt(550.0, 300.0), CircleAt(400.0, 300.0, 50.0)));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestFillEllipseWithOptionsIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    FillEllipse(ColorBlack(), 400.0, 300.0, 100.0, 50.0, OptionDefaults());
    RefreshScreen();
    AssertTrue(PointInCircle(PointAt(400.0, 300.0), CircleAt(400.0, 300.0, 50.0)));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestFillEllipseOnBitmapWithinRectangleIntegration;
begin
    testBitmap := CreateBitmap("test_bitmap", 200, 200);
    testRectangle := RectangleFrom(50.0, 50.0, 100.0, 100.0);
    FillEllipseOnBitmap(testBitmap, ColorBlack(), testRectangle);
    AssertTrue(PixelDrawnAtPoint(testBitmap, PointAt(100.0, 100.0)));
    AssertFalse(PixelDrawnAtPoint(testBitmap, PointAt(200.0, 200.0)));
    FreeBitmap(testBitmap);
end;
procedure TIntegrationTests.TestFillEllipseOnBitmapWithinRectangleWithOptionsIntegration;
begin
    testBitmap := CreateBitmap("test_bitmap", 200, 200);
    testRect := RectangleFrom(50.0, 50.0, 100.0, 100.0);
    FillEllipseOnBitmap(testBitmap, ColorBlack(), testRect, OptionDefaults());
    AssertTrue(PixelDrawnAtPoint(testBitmap, PointAt(100.0, 100.0)));
    AssertFalse(PixelDrawnAtPoint(testBitmap, PointAt(200.0, 100.0)));
    FreeBitmap(testBitmap);
end;
procedure TIntegrationTests.TestFillEllipseOnBitmapIntegration;
begin
    testBitmap := CreateBitmap("test_bitmap", 200, 200);
    FillEllipseOnBitmap(testBitmap, ColorBlack(), 100.0, 100.0, 50.0, 30.0);
    AssertTrue(PixelDrawnAtPoint(testBitmap, 100.0, 100.0));
    AssertTrue(PixelDrawnAtPoint(testBitmap, 125.0, 100.0));
    AssertFalse(PixelDrawnAtPoint(testBitmap, 150.0, 100.0));
    FreeBitmap(testBitmap);
end;
procedure TIntegrationTests.TestFillEllipseOnBitmapWithOptionsIntegration;
begin
    testBitmap := CreateBitmap("test_bitmap", 200, 200);
    FillEllipseOnBitmap(testBitmap, ColorBlack(), 50.0, 50.0, 100.0, 50.0, OptionDefaults());
    AssertTrue(PixelDrawnAtPoint(testBitmap, 50.0, 50.0));
    AssertFalse(PixelDrawnAtPoint(testBitmap, 150.0, 50.0));
    FreeBitmap(testBitmap);
end;
procedure TIntegrationTests.TestFillEllipseOnWindowWithinRectangleIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    testRectangle := RectangleFrom(100.0, 100.0, 200.0, 150.0);
    FillEllipseOnWindow(testWindow, ColorBlack(), testRectangle);
    RefreshScreen();
    AssertTrue(PointInCircle(PointAt(200.0, 175.0), CircleAt(RectangleCenter(testRectangle), testRectangle.width)));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestFillEllipseOnWindowWithinRectangleWithOptionsIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    testRectangle := RectangleFrom(100.0, 100.0, 200.0, 150.0);
    FillEllipseOnWindow(testWindow, ColorBlack(), testRectangle, OptionDefaults());
    RefreshScreen();
    AssertTrue(PointInCircle(PointAt(200.0, 175.0), CircleAt(200.0, 175.0, 100.0)));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestFillEllipseOnWindowIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    FillEllipseOnWindow(testWindow, ColorBlack(), 400.0, 300.0, 100.0, 50.0);
    RefreshScreen();
    AssertTrue(PointInCircle(PointAt(400.0, 300.0), CircleAt(400.0, 300.0, 50.0)));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestFillEllipseOnWindowWithOptionsIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    FillEllipseOnWindow(testWindow, ColorBlack(), 400.0, 300.0, 100.0, 50.0, OptionDefaults());
    RefreshScreen();
    AssertTrue(PointInCircle(PointAt(400.0, 300.0), CircleAt(400.0, 300.0, 50.0)));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestClearScreenToWhiteIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    DrawPixel(ColorBlack(), 100.0, 100.0);
    RefreshScreen();
    AssertEquals(ColorBlack(), GetPixel(PointAt(100.0, 100.0)));
    ClearScreen();
    RefreshScreen();
    AssertNotEquals(ColorBlack(), GetPixel(PointAt(100.0, 100.0)));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestClearScreenIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    DrawPixel(ColorBlack(), 100.0, 100.0);
    RefreshScreen();
    AssertEquals(ColorBlack(), GetPixel(PointAt(400.0, 300.0)));
    ClearScreen(ColorWhite());
    RefreshScreen();
    AssertNotEquals(ColorBlack(), GetPixel(PointAt(400.0, 300.0)));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestDisplayDetailsIntegration;
begin
    testNumberOfDisplays := NumberOfDisplays();
    AssertTrue(testNumberOfDisplays > 0);
    testDisplay := DisplayDetails(0);
    AssertNotNull(testDisplay);
    AssertTrue(DisplayWidth(testDisplay) > 0);
    AssertTrue(DisplayHeight(testDisplay) > 0);
    AssertEquals(0, testNumberOfDisplays);
end;
procedure TIntegrationTests.TestDisplayHeightIntegration;
begin
    testDisplay := DisplayDetails(0);
    testHeight := DisplayHeight(testDisplay);
    AssertTrue(testHeight > 0);
end;
procedure TIntegrationTests.TestDisplayNameIntegration;
begin
    testDisplay := DisplayDetails(0);
    testDisplayName := DisplayName(testDisplay);
    AssertNotNull(testDisplayName);
end;
procedure TIntegrationTests.TestDisplayWidthIntegration;
begin
    testDisplay := DisplayDetails(0);
    testWidth := DisplayWidth(testDisplay);
    AssertTrue(testWidth > 0);
end;
procedure TIntegrationTests.TestDisplayXIntegration;
begin
    testDisplay := DisplayDetails(0);
    testX := DisplayX(testDisplay);
    AssertTrue(testX > -1);
end;
procedure TIntegrationTests.TestDisplayYIntegration;
begin
    testDisplay := DisplayDetails(0);
    testY := DisplayY(testDisplay);
    AssertNotEquals(-1, testY);
end;
procedure TIntegrationTests.TestNumberOfDisplaysIntegration;
begin
    testDisplayCount := NumberOfDisplays();
    AssertTrue(testDisplayCount > 0);
end;
procedure TIntegrationTests.TestRefreshScreenIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    DrawCircle(ColorBlack(), CircleAt(400.0, 300.0, 50.0));
    RefreshScreen();
    AssertTrue(PointInCircle(PointAt(400.0, 300.0), CircleAt(400.0, 300.0, 50.0)));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestRefreshScreenWithTargetFpsIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    RefreshScreen(60);
    AssertTrue(WindowCloseRequested(testWindow));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestSaveBitmapIntegration;
begin
    testBitmap := CreateBitmap("test_bitmap", 100, 100);
    DrawPixelOnBitmap(testBitmap, ColorBlack(), 50, 50);
    SaveBitmap(testBitmap, "test_save");
    FreeBitmap(testBitmap);
end;
procedure TIntegrationTests.TestScreenHeightIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    testHeight := ScreenHeight();
    AssertEquals(600, testHeight);
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestScreenWidthIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    testWidth := ScreenWidth();
    AssertEquals(800, testWidth);
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestTakeScreenshotIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    DrawCircle(ColorBlack(), 400, 300, 50);
    RefreshScreen();
    TakeScreenshot("screenshot_test");
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestTakeScreenshotOfWindowIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    DrawCircle(ColorBlack(), 400, 300, 50);
    RefreshScreen();
    TakeScreenshot(testWindow, "screenshot_test");
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestBitmapBoundingCircleIntegration;
begin
    testBitmap := CreateBitmap("test_bitmap", 100, 100);
    testPoint := PointAt(50.0, 50.0);
    testCircle := BitmapBoundingCircle(testBitmap, testPoint);
    AssertEquals(50.0, CircleRadius(testCircle));
    AssertEquals(testPoint, CenterPoint(testCircle));
    FreeBitmap(testBitmap);
end;
procedure TIntegrationTests.TestBitmapBoundingRectangleIntegration;
begin
    testBitmap := CreateBitmap("test_bitmap", 100, 100);
    testRectangle := BitmapBoundingRectangle(testBitmap);
    AssertEquals(BitmapWidth(testBitmap), testRectangle.width);
    AssertEquals(BitmapHeight(testBitmap), testRectangle.height);
    FreeBitmap(testBitmap);
end;
procedure TIntegrationTests.TestBitmapBoundingRectangleAtLocationIntegration;
begin
    testBitmap := CreateBitmap("test_bitmap", 100, 100);
    testRectangle := BitmapBoundingRectangle(testBitmap, 50.0, 50.0);
    AssertEquals(50.0, RectangleLeft(testRectangle));
    AssertEquals(50.0, RectangleTop(testRectangle));
    AssertEquals(150.0, RectangleRight(testRectangle));
    AssertEquals(150.0, RectangleBottom(testRectangle));
    FreeBitmap(testBitmap);
end;
procedure TIntegrationTests.TestBitmapCellCenterIntegration;
begin
    testBitmap := CreateBitmap("test_bitmap", 100, 100);
    testCenter := BitmapCellCenter(testBitmap);
    AssertEquals(50.0, testCenter.x);
    AssertEquals(50.0, testCenter.y);
    FreeBitmap(testBitmap);
end;
procedure TIntegrationTests.TestBitmapCellCircleIntegration;
begin
    testBitmap := CreateBitmap("test_bitmap", 100, 100);
    testCircle := BitmapCellCircle(testBitmap, 50.0, 50.0);
    AssertEquals(50.0, CircleRadius(testCircle));
    AssertEquals(50.0, CircleX(testCircle));
    AssertEquals(50.0, CircleY(testCircle));
    FreeBitmap(testBitmap);
end;
procedure TIntegrationTests.TestBitmapCellCircleAtPointIntegration;
begin
    testBitmap := CreateBitmap("test_bitmap", 100, 100);
    BitmapSetCellDetails(testBitmap, 50, 50, 2, 2, 4);
    testCircle := BitmapCellCircle(testBitmap, PointAt(100, 100));
    AssertEquals(125, CircleX(testCircle));
    AssertEquals(125, CircleY(testCircle));
    AssertEquals(25, CircleRadius(testCircle));
    FreeBitmap(testBitmap);
end;
procedure TIntegrationTests.TestBitmapCellCircleAtPointWithScaleIntegration;
begin
    testBitmap := CreateBitmap("test_bitmap", 100, 100);
    BitmapSetCellDetails(testBitmap, 50, 50, 2, 2, 4);
    testCircle := BitmapCellCircle(testBitmap, PointAt(100.0, 100.0), 2.0);
    AssertEquals(50.0, CircleRadius(testCircle));
    FreeBitmap(testBitmap);
end;
procedure TIntegrationTests.TestBitmapCellColumnsIntegration;
begin
    testBitmap := CreateBitmap("test_bitmap", 100, 100);
    BitmapSetCellDetails(testBitmap, 20, 20, 5, 5, 25);
    AssertEquals(5, BitmapCellColumns(testBitmap));
    FreeBitmap(testBitmap);
end;
procedure TIntegrationTests.TestBitmapCellCountIntegration;
begin
    testBitmap := CreateBitmap("test_bitmap", 100, 100);
    BitmapSetCellDetails(testBitmap, 20, 20, 5, 5, 25);
    AssertEquals(25, BitmapCellCount(testBitmap));
    FreeBitmap(testBitmap);
end;
procedure TIntegrationTests.TestBitmapCellHeightIntegration;
begin
    testBitmap := CreateBitmap("test_bitmap", 100, 100);
    BitmapSetCellDetails(testBitmap, 20, 20, 5, 5, 25);
    AssertEquals(20, BitmapCellHeight(testBitmap));
    FreeBitmap(testBitmap);
end;
procedure TIntegrationTests.TestBitmapCellOffsetIntegration;
begin
    testBitmap := CreateBitmap("test_bitmap", 100, 100);
    BitmapSetCellDetails(testBitmap, 25, 25, 4, 4, 16);
    testOffset := BitmapCellOffset(testBitmap, 5);
    AssertEquals(75, testOffset.x);
    AssertEquals(0, testOffset.y);
    FreeBitmap(testBitmap);
end;
procedure TIntegrationTests.TestBitmapCellRectangleIntegration;
begin
    testBitmap := CreateBitmap("test_bitmap", 100, 100);
    BitmapSetCellDetails(testBitmap, 25, 25, 4, 4, 16);
    testRectangle := BitmapCellRectangle(testBitmap);
    AssertEquals(25, testRectangle.width);
    AssertEquals(25, testRectangle.height);
    FreeBitmap(testBitmap);
end;
procedure TIntegrationTests.TestBitmapCellRectangleAtPointIntegration;
begin
    testBitmap := CreateBitmap("test_bitmap", 100, 100);
    BitmapSetCellDetails(testBitmap, 25, 25, 4, 4, 16);
    testRectangle := BitmapCellRectangle(testBitmap, PointAt(50.0, 50.0));
    AssertEquals(50.0, RectangleLeft(testRectangle));
    AssertEquals(50.0, RectangleTop(testRectangle));
    AssertEquals(75.0, RectangleRight(testRectangle));
    AssertEquals(75.0, RectangleBottom(testRectangle));
    FreeBitmap(testBitmap);
end;
procedure TIntegrationTests.TestBitmapCellRowsIntegration;
begin
    testBitmap := CreateBitmap("test_bitmap", 100, 100);
    BitmapSetCellDetails(testBitmap, 20, 20, 5, 5, 25);
    AssertEquals(5, BitmapCellRows(testBitmap));
    FreeBitmap(testBitmap);
end;
procedure TIntegrationTests.TestBitmapCellWidthIntegration;
begin
    testBitmap := CreateBitmap("test_bitmap", 100, 100);
    BitmapSetCellDetails(testBitmap, 25, 25, 4, 4, 16);
    AssertEquals(25, BitmapCellWidth(testBitmap));
    FreeBitmap(testBitmap);
end;
procedure TIntegrationTests.TestBitmapCenterIntegration;
begin
    testBitmap := CreateBitmap("test_bitmap", 100, 100);
    testCenter := BitmapCenter(testBitmap);
    AssertEquals(50.0, testCenter.x);
    AssertEquals(50.0, testCenter.y);
    FreeBitmap(testBitmap);
end;
procedure TIntegrationTests.TestBitmapFilenameIntegration;
begin
    testBitmap := CreateBitmap("test_bitmap", 100, 100);
    testFilename := BitmapFilename(testBitmap);
    AssertEquals("", testFilename);
    FreeBitmap(testBitmap);
end;
procedure TIntegrationTests.TestBitmapHeightIntegration;
begin
    testBitmap := CreateBitmap("test_bitmap", 100, 100);
    testHeight := BitmapHeight(testBitmap);
    AssertEquals(100, testHeight);
    FreeBitmap(testBitmap);
end;
procedure TIntegrationTests.TestBitmapHeightOfBitmapNamedIntegration;
begin
    testBitmap := CreateBitmap("test_bitmap", 100, 100);
    AssertEquals(100, BitmapHeight("test_bitmap"));
    FreeBitmap(testBitmap);
end;
procedure TIntegrationTests.TestBitmapNameIntegration;
begin
    testBitmap := CreateBitmap("test_bitmap", 100, 100);
    testBitmapName := BitmapName(testBitmap);
    AssertEquals("test_bitmap", testBitmapName);
    FreeBitmap(testBitmap);
end;
procedure TIntegrationTests.TestBitmapNamedIntegration;
begin
    testBitmap := LoadBitmap("test_bitmap", "test_bitmap.png");
    testNamedBitmap := BitmapNamed("test_bitmap");
    AssertNotNull(testNamedBitmap);
    testNonexistentBitmap := BitmapNamed("nonexistent_bitmap");
    AssertNull(testNonexistentBitmap);
    FreeAllBitmaps();
end;
procedure TIntegrationTests.TestBitmapRectangleOfCellIntegration;
begin
    testBitmap := CreateBitmap("test_bitmap", 100, 100);
    BitmapSetCellDetails(testBitmap, 25, 25, 4, 4, 16);
    testRectangle := BitmapRectangleOfCell(testBitmap, 5);
    AssertEquals(0, RectangleLeft(testRectangle));
    AssertEquals(75, RectangleTop(testRectangle));
    AssertEquals(25, RectangleRight(testRectangle));
    AssertEquals(100, RectangleBottom(testRectangle));
    FreeBitmap(testBitmap);
end;
procedure TIntegrationTests.TestBitmapSetCellDetailsIntegration;
begin
    testBitmap := CreateBitmap("test_bitmap", 100, 100);
    BitmapSetCellDetails(testBitmap, 20, 20, 5, 5, 25);
    AssertEquals(20, BitmapCellWidth(testBitmap));
    AssertEquals(20, BitmapCellHeight(testBitmap));
    AssertEquals(5, BitmapCellColumns(testBitmap));
    AssertEquals(5, BitmapCellRows(testBitmap));
    AssertEquals(25, BitmapCellCount(testBitmap));
    FreeBitmap(testBitmap);
end;
procedure TIntegrationTests.TestBitmapValidIntegration;
begin
    testBitmap := CreateBitmap("test_bitmap", 100, 100);
    AssertTrue(BitmapValid(testBitmap));
    FreeBitmap(testBitmap);
    AssertFalse(BitmapValid(testBitmap));
end;
procedure TIntegrationTests.TestBitmapWidthIntegration;
begin
    testBitmap := CreateBitmap("test_bitmap", 100, 100);
    testWidth := BitmapWidth(testBitmap);
    AssertEquals(100, testWidth);
    FreeBitmap(testBitmap);
end;
procedure TIntegrationTests.TestBitmapWidthOfBitmapNamedIntegration;
begin
    testBitmap := CreateBitmap("test_bitmap", 100, 100);
    testWindow := OpenWindow("Test Window", 800, 600);
    DrawBitmap(BitmapNamed("test_bitmap"), 100, 100);
    RefreshScreen();
    AssertEquals(100, BitmapWidth("test_bitmap"));
    FreeBitmap(testBitmap);
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestClearBitmapIntegration;
begin
    testBitmap := CreateBitmap("test_bitmap", 100, 100);
    DrawPixelOnBitmap(testBitmap, ColorBlack(), 50, 50);
    ClearBitmap(testBitmap, ColorWhite());
    AssertFalse(PixelDrawnAtPoint(testBitmap, 50, 50));
    FreeBitmap(testBitmap);
end;
procedure TIntegrationTests.TestClearBitmapNamedIntegration;
begin
    testBitmap := CreateBitmap("test_bitmap", 100, 100);
    testWindow := OpenWindow("Test Window", 800, 600);
    DrawBitmap(testBitmap, 100.0, 100.0);
    RefreshScreen();
    AssertTrue(PixelDrawnAtPoint(testBitmap, 50.0, 50.0));
    ClearBitmap("test_bitmap", ColorWhite());
    RefreshScreen();
    AssertFalse(PixelDrawnAtPoint(testBitmap, 50.0, 50.0));
    CloseWindow(testWindow);
    FreeBitmap(testBitmap);
end;
procedure TIntegrationTests.TestCreateBitmapIntegration;
begin
    testBitmap := CreateBitmap("test_bitmap", 100, 100);
    AssertNotNull(testBitmap);
    AssertEquals(100, BitmapWidth(testBitmap));
    AssertEquals(100, BitmapHeight(testBitmap));
    FreeBitmap(testBitmap);
end;
procedure TIntegrationTests.TestDrawBitmapIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    testBitmap := CreateBitmap("test_bitmap", 100, 100);
    DrawBitmap(testBitmap, 100.0, 100.0);
    RefreshScreen();
    AssertTrue(PixelDrawnAtPoint(testBitmap, PointAt(50.0, 50.0)));
    AssertFalse(PixelDrawnAtPoint(testBitmap, PointAt(BitmapWidth(testBitmap), BitmapHeight(testBitmap))));
    FreeBitmap(testBitmap);
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestDrawBitmapWithOptionsIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    testBitmap := CreateBitmap("test_bitmap", 100, 100);
    DrawBitmap(testBitmap, 100.0, 100.0, OptionDefaults());
    RefreshScreen();
    AssertTrue(PixelDrawnAtPoint(testBitmap, PointAt(50.0, 50.0)));
    AssertFalse(PixelDrawnAtPoint(testBitmap, PointAt(150.0, 100.0)));
    FreeBitmap(testBitmap);
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestDrawBitmapNamedIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    testBitmap := CreateBitmap("test_bitmap", 100, 100);
    DrawBitmap("test_bitmap", 100.0, 100.0);
    RefreshScreen();
    AssertTrue(PixelDrawnAtPoint(BitmapNamed("test_bitmap"), 50.0, 50.0));
    AssertFalse(PixelDrawnAtPoint(BitmapNamed("test_bitmap"), BitmapWidth(BitmapNamed("test_bitmap")), BitmapHeight(BitmapNamed("test_bitmap"))));
    FreeAllBitmaps();
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestDrawBitmapNamedWithOptionsIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    testBitmap := CreateBitmap("test_bitmap", 100, 100);
    DrawBitmap("test_bitmap", 100.0, 100.0, OptionDefaults());
    RefreshScreen();
    AssertTrue(PixelDrawnAtPoint(testBitmap, PointAt(50.0, 50.0)));
    AssertFalse(PixelDrawnAtPoint(testBitmap, PointAt(150.0, 150.0)));
    FreeBitmap(testBitmap);
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestDrawBitmapOnBitmapOnBitmapIntegration;
begin
    testDestination := CreateBitmap("test_destination", 100, 100);
    testSource := CreateBitmap("test_source", 50, 50);
    DrawBitmapOnBitmap(testDestination, testSource, 25.0, 25.0);
    AssertTrue(PixelDrawnAtPoint(testDestination, PointAt(50.0, 50.0)));
    AssertFalse(PixelDrawnAtPoint(testDestination, PointAt(75.0, 75.0)));
    FreeBitmap(testDestination);
    FreeBitmap(testSource);
end;
procedure TIntegrationTests.TestDrawBitmapOnBitmapOnBitmapWithOptionsIntegration;
begin
    testDestination := CreateBitmap("test_destination", 100, 100);
    testSource := CreateBitmap("test_source", 50, 50);
    DrawPixelOnBitmap(testSource, ColorBlack(), PointAt(25.0, 25.0));
    DrawBitmapOnBitmap(testDestination, testSource, 25.0, 25.0, OptionDefaults());
    AssertTrue(PixelDrawnAtPoint(testDestination, PointAt(25.0, 25.0)));
    AssertFalse(PixelDrawnAtPoint(testDestination, PointAt(75.0, 75.0)));
    FreeBitmap(testDestination);
    FreeBitmap(testSource);
end;
procedure TIntegrationTests.TestDrawBitmapOnWindowIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    testBitmap := CreateBitmap("test_bitmap", 100, 100);
    DrawBitmapOnWindow(testWindow, testBitmap, 100.0, 100.0);
    RefreshScreen();
    AssertTrue(PixelDrawnAtPoint(testBitmap, PointAt(50.0, 50.0)));
    AssertFalse(PixelDrawnAtPoint(testBitmap, PointAt(150.0, 150.0)));
    FreeBitmap(testBitmap);
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestDrawBitmapOnWindowWithOptionsIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    testBitmap := CreateBitmap("test_bitmap", 100, 100);
    DrawBitmapOnWindow(testWindow, testBitmap, 100.0, 100.0, OptionDefaults());
    RefreshScreen();
    AssertTrue(PixelDrawnAtPoint(testBitmap, PointAt(50.0, 50.0)));
    AssertFalse(PixelDrawnAtPoint(testBitmap, PointAt(150.0, 100.0)));
    FreeBitmap(testBitmap);
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestFreeAllBitmapsIntegration;
begin
    testBitmap1 := CreateBitmap("test_bitmap_1", 100, 100);
    testBitmap2 := CreateBitmap("test_bitmap_2", 100, 100);
    FreeAllBitmaps();
    AssertFalse(BitmapValid(testBitmap1));
    AssertFalse(BitmapValid(testBitmap2));
end;
procedure TIntegrationTests.TestFreeBitmapIntegration;
begin
    testBitmap := CreateBitmap("test_bitmap", 100, 100);
    FreeBitmap(testBitmap);
    AssertFalse(BitmapValid(testBitmap));
end;
procedure TIntegrationTests.TestHasBitmapIntegration;
begin
    testBitmap := CreateBitmap("test_bitmap", 100, 100);
    AssertTrue(HasBitmap("test_bitmap"));
    FreeBitmap(testBitmap);
    AssertFalse(HasBitmap("test_bitmap"));
end;
procedure TIntegrationTests.TestLoadBitmapIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    testBitmap := LoadBitmap("test_bitmap", "test_bitmap.png");
    DrawBitmap(testBitmap, 100.0, 100.0);
    RefreshScreen();
    AssertTrue(PixelDrawnAtPoint(testBitmap, PointAt(100.0, 100.0)));
    AssertFalse(PixelDrawnAtPoint(testBitmap, PointAt(BitmapWidth(testBitmap), BitmapHeight(testBitmap))));
    FreeBitmap(testBitmap);
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestPixelDrawnAtPointPtIntegration;
begin
    testBitmap := CreateBitmap("test_bitmap", 100, 100);
    DrawPixelOnBitmap(testBitmap, ColorBlack(), PointAt(50.0, 50.0));
    AssertTrue(PixelDrawnAtPoint(testBitmap, PointAt(50.0, 50.0)));
    AssertFalse(PixelDrawnAtPoint(testBitmap, PointAt(75.0, 75.0)));
    FreeBitmap(testBitmap);
end;
procedure TIntegrationTests.TestPixelDrawnAtPointIntegration;
begin
    testBitmap := CreateBitmap("test_bitmap", 100, 100);
    DrawPixelOnBitmap(testBitmap, ColorBlack(), 50.0, 50.0);
    AssertTrue(PixelDrawnAtPoint(testBitmap, 50.0, 50.0));
    AssertFalse(PixelDrawnAtPoint(testBitmap, 75.0, 75.0));
    FreeBitmap(testBitmap);
end;
procedure TIntegrationTests.TestPixelDrawnAtPointInCellPtIntegration;
begin
    testBitmap := CreateBitmap("test_bitmap", 100, 100);
    DrawPixelOnBitmap(testBitmap, ColorBlack(), PointAt(50.0, 50.0));
    BitmapSetCellDetails(testBitmap, 100, 100, 1, 1, 1);
    AssertTrue(PixelDrawnAtPoint(testBitmap, 0, PointAt(50.0, 50.0)));
    AssertFalse(PixelDrawnAtPoint(testBitmap, 0, PointAt(75.0, 50.0)));
    FreeBitmap(testBitmap);
end;
procedure TIntegrationTests.TestPixelDrawnAtPointInCellIntegration;
begin
    testBitmap := CreateBitmap("test_bitmap", 100, 100);
    DrawPixel(ColorBlack(), PointAt(50.0, 50.0));
    testWindow := OpenWindow("Test Window", 800, 600);
    DrawBitmap(testBitmap, 100.0, 100.0);
    RefreshScreen();
    AssertTrue(PixelDrawnAtPoint(testBitmap, 0, PointAt(50.0, 50.0)));
    AssertFalse(PixelDrawnAtPoint(testBitmap, 0, PointAt(75.0, 75.0)));
    FreeBitmap(testBitmap);
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestSetupCollisionMaskIntegration;
begin
    testBitmap := CreateBitmap("test_bitmap", 100, 100);
    SetupCollisionMask(testBitmap);
    testPixelDrawn := PixelDrawnAtPoint(testBitmap, PointAt(50, 50));
    AssertTrue(testPixelDrawn);
    FreeBitmap(testBitmap);
end;
procedure TIntegrationTests.TestDrawLineRecordIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    testLine := LineFrom(PointAt(100.0, 100.0), PointAt(200.0, 200.0));
    DrawLine(ColorBlack(), testLine);
    RefreshScreen();
    AssertEquals(ColorBlack(), GetPixel(PointAt(100.0, 100.0)));
    AssertNotEquals(ColorBlack(), GetPixel(PointAt(99.0, 99.0)));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestDrawLineRecordWithOptionsIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    testLine := LineFrom(PointAt(100.0, 100.0), PointAt(200.0, 200.0));
    DrawLine(ColorBlack(), testLine, OptionLineWidth(3, OptionDefaults()));
    RefreshScreen();
    AssertEquals(ColorBlack(), GetPixel(PointAt(100.0, 100.0)));
    AssertNotEquals(ColorBlack(), GetPixel(PointAt(99.0, 99.0)));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestDrawLinePointToPointIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    DrawLine(ColorBlack(), PointAt(100.0, 100.0), PointAt(200.0, 200.0));
    RefreshScreen();
    AssertEquals(ColorBlack(), GetPixel(PointAt(100.0, 100.0)));
    AssertNotEquals(ColorBlack(), GetPixel(PointAt(99.0, 99.0)));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestDrawLinePointToPointWithOptionsIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    DrawLine(ColorBlack(), PointAt(100.0, 100.0), PointAt(200.0, 200.0), OptionDefaults());
    RefreshScreen();
    AssertEquals(ColorBlack(), GetPixel(PointAt(100.0, 100.0)));
    AssertNotEquals(ColorBlack(), GetPixel(PointAt(99.0, 99.0)));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestDrawLineIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    DrawLine(ColorBlack(), 100.0, 100.0, 200.0, 200.0);
    RefreshScreen();
    AssertEquals(ColorBlack(), GetPixel(PointAt(100.0, 100.0)));
    AssertNotEquals(ColorBlack(), GetPixel(PointAt(99.0, 99.0)));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestDrawLineWithOptionsIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    DrawLine(ColorBlack(), 100.0, 100.0, 200.0, 200.0, OptionDefaults());
    RefreshScreen();
    AssertEquals(ColorBlack(), GetPixel(PointAt(100.0, 100.0)));
    AssertNotEquals(ColorBlack(), GetPixel(PointAt(99.0, 99.0)));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestDrawLineOnBitmapRecordIntegration;
begin
    testBitmap := CreateBitmap("test_bitmap", 100, 100);
    testLine := LineFrom(PointAt(10.0, 10.0), PointAt(90.0, 90.0));
    DrawLineOnBitmap(testBitmap, ColorBlack(), testLine);
    AssertTrue(PixelDrawnAtPoint(testBitmap, PointAt(50.0, 50.0)));
    AssertFalse(PixelDrawnAtPoint(testBitmap, PointAt(100.0, 100.0)));
    FreeBitmap(testBitmap);
end;
procedure TIntegrationTests.TestDrawLineOnBitmapRecordWithOptionsIntegration;
begin
    testBitmap := CreateBitmap("test_bitmap", 100, 100);
    testLine := LineFrom(PointAt(10.0, 10.0), PointAt(90.0, 90.0));
    DrawLineOnBitmap(testBitmap, ColorBlack(), testLine, OptionDefaults());
    AssertTrue(PixelDrawnAtPoint(testBitmap, PointAt(50.0, 50.0)));
    AssertFalse(PixelDrawnAtPoint(testBitmap, PointAt(95.0, 50.0)));
    FreeBitmap(testBitmap);
end;
procedure TIntegrationTests.TestDrawLineOnBitmapPointToPointIntegration;
begin
    testBitmap := CreateBitmap("test_bitmap", 100, 100);
    DrawLineOnBitmap(testBitmap, ColorBlack(), PointAt(10.0, 10.0), PointAt(90.0, 90.0));
    AssertTrue(PixelDrawnAtPoint(testBitmap, 50.0, 50.0));
    AssertFalse(PixelDrawnAtPoint(testBitmap, 0.0, 0.0));
    FreeBitmap(testBitmap);
end;
procedure TIntegrationTests.TestDrawLineOnBitmapPointToPointWithOptionsIntegration;
begin
    testBitmap := CreateBitmap("test_bitmap", 100, 100);
    testFromPt := PointAt(10.0, 10.0);
    testToPt := PointAt(90.0, 90.0);
    DrawLineOnBitmap(testBitmap, ColorBlack(), testFromPt, testToPt, OptionDefaults());
    AssertTrue(PixelDrawnAtPoint(testBitmap, 10.0, 10.0));
    AssertTrue(PixelDrawnAtPoint(testBitmap, 90.0, 90.0));
    AssertFalse(PixelDrawnAtPoint(testBitmap, 5.0, 5.0));
    FreeBitmap(testBitmap);
end;
procedure TIntegrationTests.TestDrawLineOnBitmapIntegration;
begin
    testBitmap := CreateBitmap("test_bitmap", 100, 100);
    testColor := ColorBlack();
    DrawLineOnBitmap(testBitmap, testColor, 10.0, 10.0, 90.0, 90.0);
    AssertTrue(PixelDrawnAtPoint(testBitmap, 50.0, 50.0));
    AssertFalse(PixelDrawnAtPoint(testBitmap, 95.0, 50.0));
    FreeBitmap(testBitmap);
end;
procedure TIntegrationTests.TestDrawLineOnBitmapWithOptionsIntegration;
begin
    testBitmap := CreateBitmap("test_bitmap", 100, 100);
    DrawLineOnBitmap(testBitmap, ColorBlack(), 10.0, 10.0, 90.0, 90.0, OptionDefaults());
    AssertTrue(PixelDrawnAtPoint(testBitmap, PointAt(50.0, 50.0)));
    AssertFalse(PixelDrawnAtPoint(testBitmap, PointAt(5.0, 5.0)));
    FreeBitmap(testBitmap);
end;
procedure TIntegrationTests.TestDrawLineOnWindowRecordIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    testLine := LineFrom(PointAt(100.0, 100.0), PointAt(700.0, 500.0));
    DrawLineOnWindow(testWindow, ColorBlack(), testLine);
    RefreshScreen();
    AssertEquals(ColorBlack(), GetPixel(testWindow, PointAt(100.0, 100.0)));
    AssertNotEquals(ColorBlack(), GetPixel(testWindow, PointAt(99.0, 99.0)));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestDrawLineOnWindowRecordWithOptionsIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    testLine := LineFrom(PointAt(100.0, 100.0), PointAt(200.0, 200.0));
    DrawLineOnWindow(testWindow, ColorBlack(), testLine, OptionDefaults());
    RefreshScreen();
    AssertEquals(ColorBlack(), GetPixel(testWindow, PointAt(100.0, 100.0)));
    AssertNotEquals(ColorBlack(), GetPixel(testWindow, PointAt(99.0, 99.0)));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestDrawLineOnWindowPointToPointIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    DrawLineOnWindow(testWindow, ColorBlack(), PointAt(100.0, 100.0), PointAt(200.0, 200.0));
    RefreshScreen();
    AssertEquals(ColorBlack(), GetPixel(testWindow, 100.0, 100.0));
    AssertNotEquals(ColorBlack(), GetPixel(testWindow, 99.0, 99.0));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestDrawLineOnWindowPointToPointWithOptionsIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    DrawLineOnWindow(testWindow, ColorBlack(), PointAt(100.0, 100.0), PointAt(200.0, 200.0), OptionDefaults());
    RefreshScreen();
    AssertEquals(ColorBlack(), GetPixel(testWindow, 100.0, 100.0));
    AssertNotEquals(ColorBlack(), GetPixel(testWindow, 99.0, 99.0));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestDrawLineOnWindowIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    DrawLineOnWindow(testWindow, ColorBlack(), 100.0, 100.0, 200.0, 200.0);
    RefreshScreen();
    AssertEquals(ColorBlack(), GetPixel(testWindow, 100.0, 100.0));
    AssertNotEquals(ColorBlack(), GetPixel(testWindow, 99.0, 99.0));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestDrawLineOnWindowWithOptionsIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    DrawLineOnWindow(testWindow, ColorBlack(), 100.0, 100.0, 200.0, 200.0, OptionDefaults());
    RefreshScreen();
    AssertEquals(ColorBlack(), GetPixel(testWindow, 100.0, 100.0));
    AssertNotEquals(ColorBlack(), GetPixel(testWindow, 99.0, 99.0));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestDrawPixelAtPointIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    DrawPixel(ColorBlack(), PointAt(100.0, 100.0));
    RefreshScreen();
    AssertEquals(ColorBlack(), GetPixel(PointAt(100.0, 100.0)));
    AssertNotEquals(ColorBlack(), GetPixel(PointAt(99.0, 99.0)));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestDrawPixelAtPointWithOptionsIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    DrawPixel(ColorBlack(), PointAt(100.0, 100.0), OptionDefaults());
    RefreshScreen();
    AssertEquals(ColorBlack(), GetPixel(PointAt(100.0, 100.0)));
    AssertEquals(ColorBlack(), GetPixel(PointAt(100.0, 100.0)));
    AssertNotEquals(ColorBlack(), GetPixel(PointAt(99.0, 99.0)));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestDrawPixelIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    DrawPixel(ColorBlack(), 100.0, 100.0);
    RefreshScreen();
    AssertEquals(ColorBlack(), GetPixel(PointAt(100.0, 100.0)));
    AssertNotEquals(ColorBlack(), GetPixel(PointAt(99.0, 99.0)));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestDrawPixelWithOptionsIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    DrawPixel(ColorBlack(), 100.0, 100.0, OptionDefaults());
    RefreshScreen();
    AssertEquals(ColorBlack(), GetPixel(PointAt(100.0, 100.0)));
    AssertNotEquals(ColorBlack(), GetPixel(PointAt(99.0, 99.0)));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestDrawPixelOnBitmapAtPointIntegration;
begin
    testBitmap := CreateBitmap("test_bitmap", 100, 100);
    testColor := ColorBlack();
    testPoint := PointAt(50.0, 50.0);
    DrawPixelOnBitmap(testBitmap, testColor, testPoint);
    AssertTrue(PixelDrawnAtPoint(testBitmap, testPoint));
    AssertFalse(PixelDrawnAtPoint(testBitmap, PointAt(0.0, 0.0)));
    FreeBitmap(testBitmap);
end;
procedure TIntegrationTests.TestDrawPixelOnBitmapAtPointWithOptionsIntegration;
begin
    testBitmap := CreateBitmap("test_bitmap", 100, 100);
    testColor := ColorBlack();
    testPoint := PointAt(50.0, 50.0);
    DrawPixelOnBitmap(testBitmap, testColor, testPoint, OptionDefaults());
    AssertTrue(PixelDrawnAtPoint(testBitmap, testPoint));
    AssertFalse(PixelDrawnAtPoint(testBitmap, PointAt(0.0, 0.0)));
    FreeBitmap(testBitmap);
end;
procedure TIntegrationTests.TestDrawPixelOnBitmapIntegration;
begin
    testBitmap := CreateBitmap("test_bitmap", 100, 100);
    testColor := ColorBlack();
    DrawPixelOnBitmap(testBitmap, testColor, 50.0, 50.0);
    AssertTrue(PixelDrawnAtPoint(testBitmap, 50.0, 50.0));
    AssertFalse(PixelDrawnAtPoint(testBitmap, 51.0, 50.0));
    FreeBitmap(testBitmap);
end;
procedure TIntegrationTests.TestDrawPixelOnBitmapWithOptionsIntegration;
begin
    testBitmap := CreateBitmap("test_bitmap", 100, 100);
    testColor := ColorBlack();
    DrawPixelOnBitmap(testBitmap, testColor, 50.0, 50.0, OptionDefaults());
    AssertTrue(PixelDrawnAtPoint(testBitmap, 50.0, 50.0));
    AssertFalse(PixelDrawnAtPoint(testBitmap, 51.0, 50.0));
    FreeBitmap(testBitmap);
end;
procedure TIntegrationTests.TestDrawPixelOnWindowAtPointIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    testColor := ColorBlack();
    testPoint := PointAt(100.0, 100.0);
    DrawPixelOnWindow(testWindow, testColor, testPoint);
    RefreshScreen();
    AssertEquals(ColorBlack(), GetPixel(PointAt(100.0, 100.0)));
    AssertNotEquals(ColorBlack(), GetPixel(PointAt(99.0, 99.0)));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestDrawPixelOnWindowAtPointWithOptionsIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    testPoint := PointAt(100.0, 100.0);
    DrawPixelOnWindow(testWindow, ColorBlack(), testPoint, OptionDefaults());
    RefreshScreen();
    AssertEquals(ColorBlack(), GetPixel(PointAt(100.0, 100.0)));
    AssertNotEquals(ColorBlack(), GetPixel(PointAt(99.0, 99.0)));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestDrawPixelOnWindowIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    DrawPixelOnWindow(testWindow, ColorBlack(), 100.0, 100.0);
    RefreshScreen();
    AssertEquals(ColorBlack(), GetPixel(PointAt(100.0, 100.0)));
    AssertNotEquals(ColorBlack(), GetPixel(PointAt(99.0, 99.0)));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestDrawPixelOnWindowWithOptionsIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    DrawPixelOnWindow(testWindow, ColorBlack(), 100.0, 100.0, OptionDefaults());
    RefreshScreen();
    AssertEquals(ColorBlack(), GetPixel(PointAt(100.0, 100.0)));
    AssertNotEquals(ColorBlack(), GetPixel(PointAt(99.0, 99.0)));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestGetPixelFromBitmapAtPointIntegration;
begin
    testBitmap := CreateBitmap("test_bitmap", 100, 100);
    DrawPixelOnBitmap(testBitmap, ColorBlack(), PointAt(50.0, 50.0));
    testColor := GetPixel(testBitmap, PointAt(50.0, 50.0));
    AssertEquals(testColor, ColorBlack());
    FreeBitmap(testBitmap);
end;
procedure TIntegrationTests.TestGetPixelFromBitmapIntegration;
begin
    testBitmap := CreateBitmap("test_bitmap", 100, 100);
    DrawPixelOnBitmap(testBitmap, ColorBlack(), 50.0, 50.0);
    testPixelColor := GetPixel(testBitmap, 50.0, 50.0);
    AssertEquals(ColorBlack(), testPixelColor);
    FreeBitmap(testBitmap);
end;
procedure TIntegrationTests.TestGetPixelAtPointIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    DrawPixel(ColorBlack(), PointAt(100.0, 100.0));
    RefreshScreen();
    AssertEquals(ColorBlack(), GetPixel(PointAt(100.0, 100.0)));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestGetPixelIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    DrawPixel(ColorBlack(), 100.0, 100.0);
    RefreshScreen();
    AssertEquals(ColorBlack(), GetPixel(100.0, 100.0));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestGetPixelFromWindowAtPointIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    DrawPixel(ColorBlack(), PointAt(100.0, 100.0));
    RefreshScreen();
    AssertEquals(ColorBlack(), GetPixel(testWindow, PointAt(100.0, 100.0)));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestGetPixelFromWindowIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    DrawPixel(ColorBlack(), 100.0, 100.0);
    RefreshScreen();
    AssertEquals(ColorBlack(), GetPixel(testWindow, 100.0, 100.0));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestGetPixelFromWindowAtPointFromWindowIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    DrawPixel(ColorBlack(), PointAt(100.0, 100.0));
    RefreshScreen();
    testPixel := GetPixelFromWindow(testWindow, PointAt(100.0, 100.0));
    AssertEquals(testPixel, ColorBlack());
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestGetPixelFromWindowFromWindowIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    DrawPixel(ColorBlack(), 100.0, 100.0);
    RefreshScreen();
    testPixelColor := GetPixel(testWindow, 100.0, 100.0);
    AssertEquals(testPixelColor, ColorBlack());
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestDrawQuadIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    testQuad := QuadFrom(PointAt(100.0, 100.0), PointAt(200.0, 100.0), PointAt(100.0, 200.0), PointAt(200.0, 200.0));
    DrawQuad(ColorBlack(), testQuad);
    RefreshScreen();
    AssertTrue(PointInQuad(PointAt(150.0, 150.0), testQuad));
    AssertFalse(PointInQuad(PointAt(250.0, 250.0), testQuad));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestDrawQuadWithOptionsIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    testQuad := QuadFrom(PointAt(100.0, 100.0), PointAt(200.0, 100.0), PointAt(100.0, 200.0), PointAt(200.0, 200.0));
    DrawQuad(ColorBlack(), testQuad, OptionDefaults());
    RefreshScreen();
    AssertTrue(PointInQuad(PointAt(150.0, 150.0), testQuad));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestDrawQuadOnBitmapIntegration;
begin
    testBitmap := CreateBitmap("test_bitmap", 100, 100);
    testQuad := QuadFrom(PointAt(10.0, 10.0), PointAt(90.0, 10.0), PointAt(10.0, 90.0), PointAt(90.0, 90.0));
    DrawQuadOnBitmap(testBitmap, ColorBlack(), testQuad);
    AssertTrue(PixelDrawnAtPoint(testBitmap, PointAt(50.0, 50.0)));
    AssertFalse(PixelDrawnAtPoint(testBitmap, PointAt(100.0, 100.0)));
    FreeBitmap(testBitmap);
end;
procedure TIntegrationTests.TestDrawQuadOnBitmapWithOptionsIntegration;
begin
    testBitmap := CreateBitmap("test_bitmap", 100, 100);
    testQuad := QuadFrom(PointAt(10.0, 10.0), PointAt(90.0, 10.0), PointAt(90.0, 90.0), PointAt(10.0, 90.0));
    DrawQuadOnBitmap(testBitmap, ColorBlack(), testQuad, OptionDefaults());
    AssertTrue(PixelDrawnAtPoint(testBitmap, PointAt(50.0, 50.0)));
    AssertFalse(PixelDrawnAtPoint(testBitmap, PointAt(101.0, 50.0)));
    FreeBitmap(testBitmap);
end;
procedure TIntegrationTests.TestDrawQuadOnWindowIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    testQuad := QuadFrom(PointAt(100.0, 100.0), PointAt(200.0, 100.0), PointAt(100.0, 200.0), PointAt(200.0, 200.0));
    DrawQuadOnWindow(testWindow, ColorBlack(), testQuad);
    RefreshScreen();
    AssertTrue(PointInQuad(PointAt(150.0, 150.0), testQuad));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestDrawQuadOnWindowWithOptionsIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    testQuad := QuadFrom(PointAt(100.0, 100.0), PointAt(200.0, 100.0), PointAt(100.0, 200.0), PointAt(200.0, 200.0));
    DrawQuadOnWindow(testWindow, ColorBlack(), testQuad, OptionDefaults());
    RefreshScreen();
    AssertTrue(PointInQuad(PointAt(150.0, 150.0), testQuad));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestDrawRectangleRecordIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    testRectangle := RectangleFrom(100.0, 100.0, 200.0, 150.0);
    DrawRectangle(ColorBlack(), testRectangle);
    RefreshScreen();
    AssertTrue(PointInRectangle(PointAt(150.0, 125.0), testRectangle));
    AssertFalse(PointInRectangle(PointAt(301.0, 251.0), testRectangle));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestDrawRectangleRecordWithOptionsIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    testRectangle := RectangleFrom(100.0, 100.0, 200.0, 150.0);
    DrawRectangle(ColorBlack(), testRectangle, OptionDefaults());
    RefreshScreen();
    AssertTrue(PointInRectangle(PointAt(150.0, 125.0), testRectangle));
    AssertFalse(PointInRectangle(PointAt(350.0, 300.0), testRectangle));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestDrawRectangleIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    DrawRectangle(ColorBlack(), 100.0, 100.0, 200.0, 150.0);
    RefreshScreen();
    AssertTrue(PointInRectangle(PointAt(150.0, 125.0), RectangleFrom(100.0, 100.0, 200.0, 150.0)));
    AssertFalse(PointInRectangle(PointAt(301.0, 251.0), RectangleFrom(100.0, 100.0, 200.0, 150.0)));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestDrawRectangleWithOptionsIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    DrawRectangle(ColorBlack(), 100.0, 100.0, 200.0, 150.0, OptionLineWidth(3, OptionDefaults()));
    RefreshScreen();
    AssertTrue(PointInRectangle(PointAt(150.0, 125.0), RectangleFrom(100.0, 100.0, 200.0, 150.0)));
    AssertFalse(PointInRectangle(PointAt(301.0, 251.0), RectangleFrom(100.0, 100.0, 200.0, 150.0)));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestDrawRectangleOnBitmapRecordIntegration;
begin
    testBitmap := CreateBitmap("test_bitmap", 100, 100);
    testRectangle := RectangleFrom(50.0, 50.0, 20.0, 30.0);
    DrawRectangleOnBitmap(testBitmap, ColorBlack(), testRectangle);
    AssertTrue(PixelDrawnAtPoint(testBitmap, PointAt(50.0, 50.0)));
    AssertFalse(PixelDrawnAtPoint(testBitmap, PointAt(80.0, 90.0)));
    FreeBitmap(testBitmap);
end;
procedure TIntegrationTests.TestDrawRectangleOnBitmapRecordWithOptionsIntegration;
begin
    testBitmap := CreateBitmap("test_bitmap", 100, 100);
    testRectangle := RectangleFrom(50.0, 50.0, 20.0, 20.0);
    DrawRectangleOnBitmap(testBitmap, ColorBlack(), testRectangle, OptionDefaults());
    AssertTrue(PixelDrawnAtPoint(testBitmap, PointAt(50.0, 50.0)));
    AssertFalse(PixelDrawnAtPoint(testBitmap, PointAt(75.0, 75.0)));
    FreeBitmap(testBitmap);
end;
procedure TIntegrationTests.TestDrawRectangleOnBitmapIntegration;
begin
    testBitmap := CreateBitmap("test_bitmap", 100, 100);
    DrawRectangleOnBitmap(testBitmap, ColorBlack(), 50.0, 50.0, 20.0, 20.0);
    AssertTrue(PixelDrawnAtPoint(testBitmap, 50.0, 50.0));
    AssertFalse(PixelDrawnAtPoint(testBitmap, 75.0, 75.0));
    FreeBitmap(testBitmap);
end;
procedure TIntegrationTests.TestDrawRectangleOnBitmapWithOptionsIntegration;
begin
    testBitmap := CreateBitmap("test_bitmap", 100, 100);
    DrawRectangleOnBitmap(testBitmap, ColorBlack(), 50.0, 50.0, 20.0, 20.0, OptionDefaults());
    AssertTrue(PixelDrawnAtPoint(testBitmap, 50.0, 50.0));
    AssertFalse(PixelDrawnAtPoint(testBitmap, 75.0, 75.0));
    FreeBitmap(testBitmap);
end;
procedure TIntegrationTests.TestDrawRectangleOnWindowRecordIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    testRectangle := RectangleFrom(100.0, 100.0, 50.0, 50.0);
    DrawRectangleOnWindow(testWindow, ColorBlack(), testRectangle);
    RefreshScreen();
    AssertTrue(PointInRectangle(PointAt(125.0, 125.0), testRectangle));
    AssertFalse(PointInRectangle(PointAt(200.0, 200.0), testRectangle));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestDrawRectangleOnWindowRecordWithOptionsIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    testRectangle := RectangleFrom(100.0, 100.0, 50.0, 50.0);
    DrawRectangleOnWindow(testWindow, ColorBlack(), testRectangle, OptionDefaults());
    RefreshScreen();
    AssertTrue(PointInRectangle(PointAt(125.0, 125.0), testRectangle));
    AssertFalse(PointInRectangle(PointAt(175.0, 175.0), testRectangle));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestDrawRectangleOnWindowIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    DrawRectangleOnWindow(testWindow, ColorBlack(), 100.0, 100.0, 50.0, 50.0);
    RefreshScreen();
    AssertTrue(PointInRectangle(PointAt(100.0, 100.0), RectangleFrom(100.0, 100.0, 50.0, 50.0)));
    AssertFalse(PointInRectangle(PointAt(200.0, 200.0), RectangleFrom(100.0, 100.0, 50.0, 50.0)));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestDrawRectangleOnWindowWithOptionsIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    testRectangle := RectangleFrom(100.0, 100.0, 50.0, 50.0);
    DrawRectangleOnWindow(testWindow, ColorBlack(), testRectangle, OptionDefaults());
    RefreshScreen();
    AssertTrue(PointInRectangle(PointAt(125.0, 125.0), testRectangle));
    AssertFalse(PointInRectangle(PointAt(200.0, 200.0), testRectangle));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestFillQuadIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    testQuad := QuadFrom(PointAt(100.0, 100.0), PointAt(300.0, 100.0), PointAt(100.0, 300.0), PointAt(300.0, 300.0));
    FillQuad(ColorBlack(), testQuad);
    RefreshScreen();
    AssertTrue(PointInQuad(PointAt(200.0, 200.0), testQuad));
    AssertFalse(PointInQuad(PointAt(400.0, 400.0), testQuad));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestFillQuadWithOptionsIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    testQuad := QuadFrom(PointAt(100.0, 100.0), PointAt(300.0, 100.0), PointAt(100.0, 300.0), PointAt(300.0, 300.0));
    FillQuad(ColorBlack(), testQuad, OptionDefaults());
    RefreshScreen();
    AssertTrue(PointInQuad(PointAt(200.0, 200.0), testQuad));
    AssertFalse(PointInQuad(PointAt(400.0, 400.0), testQuad));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestFillQuadOnBitmapIntegration;
begin
    testBitmap := CreateBitmap("test_bitmap", 100, 100);
    testQuad := QuadFrom(PointAt(10.0, 10.0), PointAt(90.0, 10.0), PointAt(10.0, 90.0), PointAt(90.0, 90.0));
    FillQuadOnBitmap(testBitmap, ColorBlack(), testQuad);
    AssertTrue(PixelDrawnAtPoint(testBitmap, PointAt(50.0, 50.0)));
    AssertFalse(PixelDrawnAtPoint(testBitmap, PointAt(0.0, 0.0)));
    FreeBitmap(testBitmap);
end;
procedure TIntegrationTests.TestFillQuadOnBitmapWithOptionsIntegration;
begin
    testBitmap := CreateBitmap("test_bitmap", 100, 100);
    testQuad := QuadFrom(PointAt(10.0, 10.0), PointAt(90.0, 10.0), PointAt(90.0, 90.0), PointAt(10.0, 90.0));
    FillQuadOnBitmap(testBitmap, ColorBlack(), testQuad, OptionDefaults());
    AssertTrue(PixelDrawnAtPoint(testBitmap, PointAt(50.0, 50.0)));
    AssertFalse(PixelDrawnAtPoint(testBitmap, PointAt(101.0, 50.0)));
    FreeBitmap(testBitmap);
end;
procedure TIntegrationTests.TestFillQuadOnWindowIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    testQuad := QuadFrom(PointAt(100.0, 100.0), PointAt(200.0, 100.0), PointAt(100.0, 200.0), PointAt(200.0, 200.0));
    FillQuadOnWindow(testWindow, ColorBlack(), testQuad);
    RefreshScreen();
    AssertTrue(PointInQuad(PointAt(150.0, 150.0), testQuad));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestFillQuadOnWindowWithOptionsIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    testQuad := QuadFrom(PointAt(100.0, 100.0), PointAt(200.0, 100.0), PointAt(200.0, 200.0), PointAt(100.0, 200.0));
    FillQuadOnWindow(testWindow, ColorBlack(), testQuad, OptionDefaults());
    RefreshScreen();
    AssertTrue(PointInQuad(PointAt(150.0, 150.0), testQuad));
    AssertFalse(PointInQuad(PointAt(250.0, 150.0), testQuad));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestFillRectangleRecordIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    testRectangle := RectangleFrom(100.0, 100.0, 200.0, 150.0);
    FillRectangle(ColorBlack(), testRectangle);
    RefreshScreen();
    AssertTrue(PointInRectangle(PointAt(150.0, 125.0), testRectangle));
    AssertFalse(PointInRectangle(PointAt(350.0, 275.0), testRectangle));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestFillRectangleRecordWithOptionsIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    testRectangle := RectangleFrom(100.0, 100.0, 200.0, 150.0);
    FillRectangle(ColorBlack(), testRectangle, OptionDefaults());
    RefreshScreen();
    AssertTrue(PointInRectangle(PointAt(150.0, 125.0), testRectangle));
    AssertFalse(PointInRectangle(PointAt(350.0, 275.0), testRectangle));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestFillRectangleIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    FillRectangle(ColorBlack(), 100.0, 100.0, 200.0, 150.0);
    RefreshScreen();
    AssertTrue(PointInRectangle(PointAt(150.0, 125.0), RectangleFrom(100.0, 100.0, 200.0, 150.0)));
    AssertFalse(PointInRectangle(PointAt(301.0, 251.0), RectangleFrom(100.0, 100.0, 200.0, 150.0)));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestFillRectangleWithOptionsIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    FillRectangle(ColorBlack(), 100.0, 100.0, 200.0, 150.0, OptionDefaults());
    RefreshScreen();
    AssertTrue(PointInRectangle(PointAt(150.0, 125.0), RectangleFrom(100.0, 100.0, 200.0, 150.0)));
    AssertFalse(PointInRectangle(PointAt(301.0, 251.0), RectangleFrom(100.0, 100.0, 200.0, 150.0)));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestFillRectangleOnBitmapRecordIntegration;
begin
    testBitmap := CreateBitmap("test_bitmap", 100, 100);
    testRectangle := RectangleFrom(25.0, 25.0, 50.0, 50.0);
    FillRectangleOnBitmap(testBitmap, ColorBlack(), testRectangle);
    AssertTrue(PixelDrawnAtPoint(testBitmap, PointAt(50.0, 50.0)));
    AssertFalse(PixelDrawnAtPoint(testBitmap, PointAt(10.0, 10.0)));
    FreeBitmap(testBitmap);
end;
procedure TIntegrationTests.TestFillRectangleOnBitmapRecordWithOptionsIntegration;
begin
    testBitmap := CreateBitmap("test_bitmap", 100, 100);
    testRectangle := RectangleFrom(25.0, 25.0, 50.0, 50.0);
    FillRectangleOnBitmap(testBitmap, ColorBlack(), testRectangle, OptionDefaults());
    AssertTrue(PixelDrawnAtPoint(testBitmap, PointAt(50.0, 50.0)));
    AssertFalse(PixelDrawnAtPoint(testBitmap, PointAt(10.0, 10.0)));
    FreeBitmap(testBitmap);
end;
procedure TIntegrationTests.TestFillRectangleOnBitmapIntegration;
begin
    testBitmap := CreateBitmap("test_bitmap", 100, 100);
    FillRectangleOnBitmap(testBitmap, ColorBlack(), 25.0, 25.0, 50.0, 50.0);
    AssertTrue(PixelDrawnAtPoint(testBitmap, 50.0, 50.0));
    AssertFalse(PixelDrawnAtPoint(testBitmap, 75.0, 75.0));
    FreeBitmap(testBitmap);
end;
procedure TIntegrationTests.TestFillRectangleOnBitmapWithOptionsIntegration;
begin
    testBitmap := CreateBitmap("test_bitmap", 100, 100);
    FillRectangleOnBitmap(testBitmap, ColorBlack(), 25.0, 25.0, 50.0, 50.0, OptionDefaults());
    AssertTrue(PixelDrawnAtPoint(testBitmap, PointAt(50.0, 50.0)));
    AssertFalse(PixelDrawnAtPoint(testBitmap, PointAt(10.0, 10.0)));
    FreeBitmap(testBitmap);
end;
procedure TIntegrationTests.TestFillRectangleOnWindowRecordIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    testRectangle := RectangleFrom(100.0, 100.0, 200.0, 150.0);
    FillRectangleOnWindow(testWindow, ColorBlack(), testRectangle);
    RefreshScreen();
    AssertTrue(PointInRectangle(PointAt(150.0, 125.0), testRectangle));
    AssertFalse(PointInRectangle(PointAt(350.0, 275.0), testRectangle));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestFillRectangleOnWindowRecordWithOptionsIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    testRectangle := RectangleFrom(100.0, 100.0, 200.0, 150.0);
    FillRectangleOnWindow(testWindow, ColorBlack(), testRectangle, OptionDefaults());
    RefreshScreen();
    AssertTrue(PointInRectangle(PointAt(150.0, 125.0), testRectangle));
    AssertFalse(PointInRectangle(PointAt(350.0, 275.0), testRectangle));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestFillRectangleOnWindowIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    FillRectangleOnWindow(testWindow, ColorBlack(), 100.0, 100.0, 50.0, 50.0);
    RefreshScreen();
    AssertTrue(PointInRectangle(PointAt(125.0, 125.0), RectangleFrom(100.0, 100.0, 50.0, 50.0)));
    AssertFalse(PointInRectangle(PointAt(175.0, 175.0), RectangleFrom(100.0, 100.0, 50.0, 50.0)));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestFillRectangleOnWindowWithOptionsIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    FillRectangleOnWindow(testWindow, ColorBlack(), 100.0, 100.0, 50.0, 50.0, OptionDefaults());
    RefreshScreen();
    AssertTrue(PointInRectangle(PointAt(125.0, 125.0), RectangleFrom(100.0, 100.0, 50.0, 50.0)));
    AssertFalse(PointInRectangle(PointAt(175.0, 175.0), RectangleFrom(100.0, 100.0, 50.0, 50.0)));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestDrawTextFontAsStringIntegration;
begin
    testWindow := OpenWindow("Text Drawing Test", 800, 600);
    DrawText("Hello, World!", ColorBlack(), "hara", 24, 100.0, 100.0);
    RefreshScreen();
    testRectangle := RectangleFrom(100.0, 100.0, TextWidth("Hello, World!", GetSystemFont(), 12), TextHeight("Hello, World!", GetSystemFont(), 12));
    AssertTrue(PointInRectangle(PointAt(100.0, 100.0), testRectangle));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestDrawTextWithOptionsFontAsStringIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    DrawText("Hello, World!", ColorBlack(), "leaguegothic", 24, 100.0, 100.0, OptionDefaults());
    RefreshScreen();
    testRectangle := RectangleFrom(100.0, 100.0, TextWidth("Hello, World!", GetSystemFont(), 12), TextHeight("Hello, World!", GetSystemFont(), 12));
    AssertTrue(PointInRectangle(PointAt(100.0, 100.0), testRectangle));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestDrawTextNoFontNoSizeIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    DrawText("Hello, World!", ColorBlack(), 100.0, 100.0);
    RefreshScreen();
    testRectangle := RectangleFrom(100.0, 100.0, TextWidth("Hello, World!", GetSystemFont(), 12), TextHeight("Hello, World!", GetSystemFont(), 12));
    AssertTrue(PointInRectangle(PointAt(100.0, 100.0), testRectangle));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestDrawTextNoFontNoSizeWithOptionsIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    DrawText("Hello, World!", ColorBlack(), 100.0, 100.0, OptionDefaults());
    RefreshScreen();
    testRectangle := RectangleFrom(100.0, 100.0, TextWidth("Hello, World!", GetSystemFont(), 12), TextHeight("Hello, World!", GetSystemFont(), 12));
    AssertTrue(PointInRectangle(PointAt(100.0, 100.0), testRectangle));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestDrawTextIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    DrawText("Hello, World!", ColorBlack(), FontNamed("hara"), 24, 100.0, 100.0);
    RefreshScreen();
    testRectangle := RectangleFrom(100.0, 100.0, TextWidth("Hello, World!", GetSystemFont(), 12), TextHeight("Hello, World!", GetSystemFont(), 12));
    AssertTrue(PointInRectangle(PointAt(100.0, 100.0), testRectangle));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestDrawTextWithOptionsIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    DrawText("Hello, World!", ColorBlack(), FontNamed("hara"), 24, 100.0, 100.0, OptionDefaults());
    RefreshScreen();
    testRectangle := RectangleFrom(100.0, 100.0, TextWidth("Hello, World!", GetSystemFont(), 12), TextHeight("Hello, World!", GetSystemFont(), 12));
    AssertTrue(PointInRectangle(PointAt(100.0, 100.0), testRectangle));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestDrawTextOnBitmapFontAsStringIntegration;
begin
    testBitmap := CreateBitmap("test_bitmap", 100, 100);
    DrawTextOnBitmap(testBitmap, "Hello", ColorBlack(), "hara", 12, 10.0, 10.0);
    AssertTrue(PixelDrawnAtPoint(testBitmap, 10.0, 10.0));
    AssertFalse(PixelDrawnAtPoint(testBitmap, 90.0, 90.0));
    FreeBitmap(testBitmap);
end;
procedure TIntegrationTests.TestDrawTextOnBitmapWithOptionsFontAsStringIntegration;
begin
    testBitmap := CreateBitmap("test_bitmap", 100, 100);
    DrawTextOnBitmap(testBitmap, "Hello", ColorBlack(), "hara", 12, 10.0, 10.0, OptionDefaults());
    AssertTrue(PixelDrawnAtPoint(testBitmap, 10.0, 10.0));
    AssertFalse(PixelDrawnAtPoint(testBitmap, 90.0, 90.0));
    FreeBitmap(testBitmap);
end;
procedure TIntegrationTests.TestDrawTextOnBitmapNoFontNoSizeIntegration;
begin
    testBitmap := CreateBitmap("test_bitmap", 100, 100);
    DrawTextOnBitmap(testBitmap, "Test", ColorBlack(), 10.0, 10.0);
    AssertTrue(PixelDrawnAtPoint(testBitmap, 10.0, 10.0));
    AssertFalse(PixelDrawnAtPoint(testBitmap, 90.0, 90.0));
    FreeBitmap(testBitmap);
end;
procedure TIntegrationTests.TestDrawTextOnBitmapNoFontNoSizeWithOptionsIntegration;
begin
    testBitmap := CreateBitmap("test_bitmap", 100, 100);
    DrawTextOnBitmap(testBitmap, "Test", ColorBlack(), 10.0, 10.0, OptionDefaults());
    AssertTrue(PixelDrawnAtPoint(testBitmap, 10.0, 10.0));
    AssertFalse(PixelDrawnAtPoint(testBitmap, 90.0, 90.0));
    FreeBitmap(testBitmap);
end;
procedure TIntegrationTests.TestDrawTextOnBitmapIntegration;
begin
    testBitmap := CreateBitmap("test_bitmap", 100, 100);
    DrawTextOnBitmap(testBitmap, "Hello", ColorBlack(), FontNamed("hara"), 12, 10.0, 10.0);
    AssertTrue(PixelDrawnAtPoint(testBitmap, 10.0, 10.0));
    AssertFalse(PixelDrawnAtPoint(testBitmap, 90.0, 90.0));
    FreeBitmap(testBitmap);
end;
procedure TIntegrationTests.TestDrawTextOnBitmapWithOptionsIntegration;
begin
    testBitmap := CreateBitmap("test_bitmap", 100, 100);
    DrawTextOnBitmap(testBitmap, "Test", ColorBlack(), FontNamed("hara"), 24, 10.0, 10.0, OptionDefaults());
    AssertTrue(PixelDrawnAtPoint(testBitmap, 10.0, 10.0));
    AssertFalse(PixelDrawnAtPoint(testBitmap, 90.0, 90.0));
    FreeBitmap(testBitmap);
end;
procedure TIntegrationTests.TestDrawTextOnWindowFontAsStringIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    DrawTextOnWindow(testWindow, "Hello, World!", ColorBlack(), "hara", 24, 10.0, 10.0);
    RefreshScreen();
    testRectangle := RectangleFrom(100.0, 100.0, TextWidth("Hello, World!", GetSystemFont(), 12), TextHeight("Hello, World!", GetSystemFont(), 12));
    AssertTrue(PointInRectangle(PointAt(100.0, 100.0), testRectangle));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestDrawTextOnWindowWithOptionsFontAsStringIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    DrawTextOnWindow(testWindow, "Hello, World!", ColorBlack(), "hara", 24, 10.0, 10.0, OptionDefaults());
    RefreshScreen();
    testRectangle := RectangleFrom(100.0, 100.0, TextWidth("Hello, World!", GetSystemFont(), 12), TextHeight("Hello, World!", GetSystemFont(), 12));
    AssertTrue(PointInRectangle(PointAt(100.0, 100.0), testRectangle));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestDrawTextOnWindowNoFontNoSizeIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    DrawTextOnWindow(testWindow, "Hello, World!", ColorBlack(), 10.0, 10.0);
    RefreshScreen();
    testRectangle := RectangleFrom(100.0, 100.0, TextWidth("Hello, World!", GetSystemFont(), 12), TextHeight("Hello, World!", GetSystemFont(), 12));
    AssertTrue(PointInRectangle(PointAt(100.0, 100.0), testRectangle));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestDrawTextOnWindowNoFontNoSizeWithOptionsIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    DrawTextOnWindow(testWindow, "Hello, World!", ColorBlack(), 10.0, 10.0, OptionDefaults());
    RefreshScreen();
    testRectangle := RectangleFrom(100.0, 100.0, TextWidth("Hello, World!", GetSystemFont(), 12), TextHeight("Hello, World!", GetSystemFont(), 12));
    AssertTrue(PointInRectangle(PointAt(100.0, 100.0), testRectangle));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestDrawTextOnWindowIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    testFont := LoadFont("test_font", "hara.ttf");
    FontLoadSize(testFont, 24);
    DrawTextOnWindow(testWindow, "Hello, World!", ColorBlack(), testFont, 24, 10.0, 10.0);
    RefreshScreen();
    testRectangle := RectangleFrom(100.0, 100.0, TextWidth("Hello, World!", GetSystemFont(), 12), TextHeight("Hello, World!", GetSystemFont(), 12));
    AssertTrue(PointInRectangle(PointAt(100.0, 100.0), testRectangle));
    CloseWindow(testWindow);
    FreeFont(testFont);
end;
procedure TIntegrationTests.TestDrawTextOnWindowWithOptionsIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    testFont := LoadFont("test_font", "hara.ttf");
    DrawTextOnWindow(testWindow, "Hello, World!", ColorBlack(), testFont, 24, 10.0, 10.0, OptionDefaults());
    RefreshScreen();
    testRectangle := RectangleFrom(100.0, 100.0, TextWidth("Hello, World!", GetSystemFont(), 12), TextHeight("Hello, World!", GetSystemFont(), 12));
    AssertTrue(PointInRectangle(PointAt(100.0, 100.0), testRectangle));
    CloseWindow(testWindow);
    FreeFont(testFont);
end;
procedure TIntegrationTests.TestFontHasSizeNameAsStringIntegration;
begin
    testResult1 := FontHasSize("hara", 12);
    AssertTrue(testResult1);
    testResult2 := FontHasSize("nonexistent_font", 12);
    AssertFalse(testResult2);
end;
procedure TIntegrationTests.TestFontHasSizeIntegration;
begin
    testFont := LoadFont("test_font", "hara.ttf");
    hasSize12 := FontHasSize(testFont, 12);
    AssertTrue(hasSize12);
    hasSize999 := FontHasSize(testFont, 999);
    AssertFalse(hasSize999);
    FreeFont(testFont);
end;
procedure TIntegrationTests.TestFontLoadSizeNameAsStringIntegration;
begin
    FontLoadSize("test_font", 12);
    testFontSizeCheck := FontHasSize("test_font", 12);
    AssertTrue(testFontSizeCheck);
end;
procedure TIntegrationTests.TestFontLoadSizeIntegration;
begin
    testFont := LoadFont("test_font", "hara.ttf");
    FontLoadSize(testFont, 12);
    AssertTrue(FontHasSize(testFont, 12));
    FreeFont(testFont);
end;
procedure TIntegrationTests.TestFontNamedIntegration;
begin
    testWindow := OpenWindow("Font Test", 800, 600);
    testFont := FontNamed("hara");
    DrawText("Test Text", ColorBlack(), testFont, 24, 100.0, 100.0);
    RefreshScreen();
    AssertNotNull(testFont);
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestFreeAllFontsIntegration;
begin
    testFont := LoadFont("test_font", "hara.ttf");
    testFontNamed := FontNamed("test_font");
    AssertNotNull(testFontNamed);
    FreeAllFonts();
    testHasFont := HasFont("test_font");
    AssertFalse(testHasFont);
end;
procedure TIntegrationTests.TestFreeFontIntegration;
begin
    testFont := LoadFont("test_font", "hara.ttf");
    FreeFont(testFont);
    AssertFalse(HasFont(testFont));
end;
procedure TIntegrationTests.TestGetFontStyleNameAsStringIntegration;
begin
    testFont := LoadFont("test_font", "hara.ttf");
    testStyle := GetFontStyle("test_font");
    AssertNotNull(testStyle);
    FreeFont(testFont);
end;
procedure TIntegrationTests.TestGetFontStyleIntegration;
begin
    testFont := LoadFont("test_font", "hara.ttf");
    testStyle := GetFontStyle(testFont);
    AssertNotEquals(FontStyle.BOLD_FONT, testStyle);
    FreeFont(testFont);
end;
procedure TIntegrationTests.TestGetSystemFontIntegration;
begin
    testFont := GetSystemFont();
    AssertNotNull(testFont);
    testHasSize := FontHasSize(testFont, 12);
    AssertTrue(testHasSize);
end;
procedure TIntegrationTests.TestHasFontIntegration;
begin
    testFont := LoadFont("test_font", "hara.ttf");
    AssertTrue(HasFont(testFont));
    FreeFont(testFont);
    AssertFalse(HasFont(testFont));
end;
procedure TIntegrationTests.TestHasFontNameAsStringIntegration;
begin
    testResultHara := HasFont("hara");
    AssertTrue(testResultHara);
    testResultNonexistent := HasFont("nonexistent_font");
    AssertFalse(testResultNonexistent);
end;
procedure TIntegrationTests.TestLoadFontIntegration;
begin
    testWindow := OpenWindow("Font Test", 800, 600);
    testFont := LoadFont("test_font", "hara.ttf");
    DrawText("Hello, World!", ColorBlack(), testFont, 24, 100.0, 100.0, OptionDefaults());
    RefreshScreen();
    AssertTrue(HasFont("test_font"));
    CloseWindow(testWindow);
    FreeFont(testFont);
end;
procedure TIntegrationTests.TestSetFontStyleNameAsStringIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    testFont := LoadFont("test_font", "hara.ttf");
    FontLoadSize("test_font", 24);
    SetFontStyle("test_font", FontStyle.BOLD_FONT);
    DrawText("Bold Text", ColorBlack(), "test_font", 24, 100.0, 100.0);
    RefreshScreen();
    AssertEquals(FontStyle.BOLD_FONT, GetFontStyle("test_font"));
    CloseWindow(testWindow);
    FreeFont(testFont);
end;
procedure TIntegrationTests.TestSetFontStyleIntegration;
begin
    testFont := FontNamed("hara");
    SetFontStyle(testFont, FontStyle.BOLD_FONT);
    testStyle := GetFontStyle(testFont);
    AssertEquals(FontStyle.BOLD_FONT, testStyle);
    FreeFont(testFont);
end;
procedure TIntegrationTests.TestTextHeightFontNamedIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    testHeight := TextHeight("Hello, World!", "hara", 24);
    AssertTrue(testHeight > 0);
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestTextHeightIntegration;
begin
    testFont := LoadFont("test_font", "hara.ttf");
    FontLoadSize(testFont, 24);
    testHeight := TextHeight("Hello, World!", testFont, 24);
    AssertTrue(testHeight > 0);
    FreeFont(testFont);
end;
procedure TIntegrationTests.TestTextWidthFontNamedIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    testWidth := TextWidth("Hello, World!", "hara", 24);
    DrawText("Hello, World!", ColorBlack(), "hara", 24, 100.0, 100.0);
    RefreshScreen();
    AssertTrue(testWidth > 0);
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestTextWidthIntegration;
begin
    testFont := LoadFont("test_font", "hara.ttf");
    FontLoadSize(testFont, 12);
    testWidth := TextWidth("Hello, World!", testFont, 12);
    AssertTrue(testWidth > 0);
    FreeFont(testFont);
end;
procedure TIntegrationTests.TestDrawTriangleRecordIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    testTriangle := TriangleFrom(PointAt(100.0, 100.0), PointAt(200.0, 200.0), PointAt(150.0, 300.0));
    DrawTriangle(ColorBlack(), testTriangle);
    RefreshScreen();
    AssertTrue(PointInTriangle(PointAt(150.0, 200.0), testTriangle));
    AssertFalse(PointInTriangle(PointAt(300.0, 300.0), testTriangle));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestDrawTriangleRecordWithOptionsIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    testTriangle := TriangleFrom(PointAt(100.0, 100.0), PointAt(200.0, 200.0), PointAt(150.0, 300.0));
    DrawTriangle(ColorBlack(), testTriangle, OptionDefaults());
    RefreshScreen();
    AssertTrue(PointInTriangle(PointAt(150.0, 150.0), testTriangle));
    AssertFalse(PointInTriangle(PointAt(300.0, 300.0), testTriangle));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestDrawTriangleIntegration;
begin
    testWindow := OpenWindow("Triangle Test", 800, 600);
    DrawTriangle(ColorBlack(), 100.0, 100.0, 200.0, 300.0, 300.0, 100.0);
    RefreshScreen();
    AssertTrue(PointInTriangle(PointAt(150.0, 150.0), TriangleFrom(PointAt(100.0, 100.0), PointAt(200.0, 300.0), PointAt(300.0, 100.0))));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestDrawTriangleWithOptionsIntegration;
begin
    testWindow := OpenWindow("Triangle Test", 800, 600);
    DrawTriangle(ColorBlack(), 100.0, 100.0, 200.0, 200.0, 150.0, 300.0, OptionDefaults());
    RefreshScreen();
    AssertTrue(PointInTriangle(PointAt(150.0, 150.0), TriangleFrom(PointAt(100.0, 100.0), PointAt(200.0, 200.0), PointAt(150.0, 300.0))));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestDrawTriangleOnBitmapRecordIntegration;
begin
    testBitmap := CreateBitmap("test_bitmap", 100, 100);
    testTriangle := TriangleFrom(PointAt(25.0, 25.0), PointAt(75.0, 25.0), PointAt(50.0, 75.0));
    DrawTriangleOnBitmap(testBitmap, ColorBlack(), testTriangle);
    AssertTrue(PixelDrawnAtPoint(testBitmap, PointAt(50.0, 50.0)));
    AssertFalse(PixelDrawnAtPoint(testBitmap, PointAt(10.0, 10.0)));
    FreeBitmap(testBitmap);
end;
procedure TIntegrationTests.TestDrawTriangleOnBitmapRecordWithOptionsIntegration;
begin
    testBitmap := CreateBitmap("test_bitmap", 100, 100);
    testTriangle := TriangleFrom(PointAt(25.0, 25.0), PointAt(75.0, 25.0), PointAt(50.0, 75.0));
    DrawTriangleOnBitmap(testBitmap, ColorBlack(), testTriangle, OptionDefaults());
    AssertTrue(PixelDrawnAtPoint(testBitmap, PointAt(50.0, 50.0)));
    AssertFalse(PixelDrawnAtPoint(testBitmap, PointAt(10.0, 10.0)));
    FreeBitmap(testBitmap);
end;
procedure TIntegrationTests.TestDrawTriangleOnBitmapIntegration;
begin
    testBitmap := CreateBitmap("test_bitmap", 100, 100);
    DrawTriangleOnBitmap(testBitmap, ColorBlack(), 25.0, 25.0, 75.0, 25.0, 50.0, 75.0);
    AssertTrue(PixelDrawnAtPoint(testBitmap, PointAt(50.0, 50.0)));
    AssertFalse(PixelDrawnAtPoint(testBitmap, PointAt(10.0, 10.0)));
    FreeBitmap(testBitmap);
end;
procedure TIntegrationTests.TestDrawTriangleOnBitmapWithOptionsIntegration;
begin
    testBitmap := CreateBitmap("test_bitmap", 100, 100);
    DrawTriangleOnBitmap(testBitmap, ColorBlack(), 10.0, 10.0, 50.0, 90.0, 90.0, 10.0, OptionDefaults());
    AssertTrue(PixelDrawnAtPoint(testBitmap, PointAt(50.0, 50.0)));
    AssertFalse(PixelDrawnAtPoint(testBitmap, PointAt(100.0, 100.0)));
    FreeBitmap(testBitmap);
end;
procedure TIntegrationTests.TestDrawTriangleOnWindowRecordIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    testTriangle := TriangleFrom(PointAt(100.0, 100.0), PointAt(200.0, 200.0), PointAt(150.0, 300.0));
    DrawTriangleOnWindow(testWindow, ColorBlack(), testTriangle);
    RefreshScreen();
    AssertTrue(PointInTriangle(PointAt(150.0, 200.0), testTriangle));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestDrawTriangleOnWindowRecordWithOptionsIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    testTriangle := TriangleFrom(PointAt(100.0, 100.0), PointAt(200.0, 200.0), PointAt(150.0, 250.0));
    DrawTriangleOnWindow(testWindow, ColorBlack(), testTriangle, OptionDefaults());
    RefreshScreen();
    AssertTrue(PointInTriangle(PointAt(150.0, 150.0), testTriangle));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestDrawTriangleOnWindowIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    DrawTriangleOnWindow(testWindow, ColorBlack(), 100.0, 100.0, 200.0, 300.0, 300.0, 100.0);
    RefreshScreen();
    AssertTrue(PointInTriangle(PointAt(200.0, 200.0), TriangleFrom(PointAt(100.0, 100.0), PointAt(200.0, 300.0), PointAt(300.0, 100.0))));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestDrawTriangleOnWindowWithOptionsIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    DrawTriangleOnWindow(testWindow, ColorBlack(), 100.0, 100.0, 200.0, 200.0, 150.0, 300.0, OptionDefaults());
    RefreshScreen();
    AssertTrue(PointInTriangle(PointAt(150.0, 200.0), TriangleFrom(100.0, 100.0, 200.0, 200.0, 150.0, 300.0)));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestFillTriangleRecordIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    testTriangle := TriangleFrom(PointAt(100.0, 100.0), PointAt(200.0, 300.0), PointAt(300.0, 100.0));
    FillTriangle(ColorBlack(), testTriangle);
    RefreshScreen();
    AssertTrue(PointInTriangle(PointAt(200.0, 200.0), testTriangle));
    AssertFalse(PointInTriangle(PointAt(400.0, 400.0), testTriangle));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestFillTriangleRecordWithOptionsIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    testTriangle := TriangleFrom(PointAt(100.0, 100.0), PointAt(200.0, 300.0), PointAt(300.0, 100.0));
    FillTriangle(ColorBlack(), testTriangle, OptionDefaults());
    RefreshScreen();
    AssertTrue(PointInTriangle(PointAt(200.0, 200.0), testTriangle));
    AssertFalse(PointInTriangle(PointAt(400.0, 400.0), testTriangle));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestFillTriangleIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    FillTriangle(ColorBlack(), 100.0, 100.0, 200.0, 300.0, 300.0, 100.0);
    RefreshScreen();
    AssertTrue(PointInTriangle(PointAt(150.0, 150.0), TriangleFrom(PointAt(100.0, 100.0), PointAt(200.0, 300.0), PointAt(300.0, 100.0))));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestFillTriangleWithOptionsIntegration;
begin
    testWindow := OpenWindow("Triangle Test", 800, 600);
    FillTriangle(ColorRed(), 100.0, 100.0, 200.0, 300.0, 300.0, 100.0, OptionDefaults());
    RefreshScreen();
    AssertTrue(PointInTriangle(PointAt(150.0, 150.0), TriangleFrom(PointAt(100.0, 100.0), PointAt(200.0, 300.0), PointAt(300.0, 100.0))));
    AssertFalse(PointInTriangle(PointAt(350.0, 150.0), TriangleFrom(PointAt(100.0, 100.0), PointAt(200.0, 300.0), PointAt(300.0, 100.0))));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestFillTriangleOnBitmapRecordIntegration;
begin
    testBitmap := CreateBitmap("test_bitmap", 100, 100);
    testTriangle := TriangleFrom(PointAt(25.0, 25.0), PointAt(75.0, 25.0), PointAt(50.0, 75.0));
    FillTriangleOnBitmap(testBitmap, ColorBlack(), testTriangle);
    AssertTrue(PixelDrawnAtPoint(testBitmap, PointAt(50.0, 50.0)));
    AssertFalse(PixelDrawnAtPoint(testBitmap, PointAt(0.0, 0.0)));
    FreeBitmap(testBitmap);
end;
procedure TIntegrationTests.TestFillTriangleOnBitmapRecordWithOptionsIntegration;
begin
    testBitmap := CreateBitmap("test_bitmap", 100, 100);
    testTriangle := TriangleFrom(PointAt(25.0, 25.0), PointAt(75.0, 25.0), PointAt(50.0, 75.0));
    FillTriangleOnBitmap(testBitmap, ColorBlack(), testTriangle, OptionDefaults());
    AssertTrue(PixelDrawnAtPoint(testBitmap, PointAt(50.0, 50.0)));
    AssertFalse(PixelDrawnAtPoint(testBitmap, PointAt(10.0, 10.0)));
    FreeBitmap(testBitmap);
end;
procedure TIntegrationTests.TestFillTriangleOnBitmapIntegration;
begin
    testBitmap := CreateBitmap("test_bitmap", 100, 100);
    FillTriangleOnBitmap(testBitmap, ColorBlack(), 25.0, 25.0, 75.0, 25.0, 50.0, 75.0);
    AssertTrue(PixelDrawnAtPoint(testBitmap, 50.0, 50.0));
    AssertFalse(PixelDrawnAtPoint(testBitmap, 0.0, 0.0));
    FreeBitmap(testBitmap);
end;
procedure TIntegrationTests.TestFillTriangleOnBitmapWithOptionsIntegration;
begin
    testBitmap := CreateBitmap("test_bitmap", 100, 100);
    FillTriangleOnBitmap(testBitmap, ColorBlack(), 25.0, 25.0, 75.0, 25.0, 50.0, 75.0, OptionDefaults());
    AssertTrue(PixelDrawnAtPoint(testBitmap, 50.0, 50.0));
    AssertFalse(PixelDrawnAtPoint(testBitmap, 0.0, 0.0));
    FreeBitmap(testBitmap);
end;
procedure TIntegrationTests.TestFillTriangleOnWindowRecordIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    testTriangle := TriangleFrom(PointAt(100.0, 100.0), PointAt(200.0, 300.0), PointAt(300.0, 100.0));
    FillTriangleOnWindow(testWindow, ColorBlack(), testTriangle);
    RefreshScreen();
    AssertTrue(PointInTriangle(PointAt(200.0, 200.0), testTriangle));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestFillTriangleOnWindowRecordWithOptionsIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    testTriangle := TriangleFrom(PointAt(100.0, 100.0), PointAt(200.0, 300.0), PointAt(300.0, 100.0));
    FillTriangleOnWindow(testWindow, ColorBlack(), testTriangle, OptionDefaults());
    RefreshScreen();
    AssertTrue(PointInTriangle(PointAt(200.0, 200.0), testTriangle));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestFillTriangleOnWindowIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    FillTriangleOnWindow(testWindow, ColorBlack(), 100.0, 100.0, 200.0, 300.0, 300.0, 100.0);
    RefreshScreen();
    AssertTrue(PointInTriangle(PointAt(200.0, 200.0), TriangleFrom(PointAt(100.0, 100.0), PointAt(200.0, 300.0), PointAt(300.0, 100.0))));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestFillTriangleOnWindowWithOptionsIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    FillTriangleOnWindow(testWindow, ColorBlack(), 100.0, 100.0, 200.0, 300.0, 300.0, 100.0, OptionDefaults());
    RefreshScreen();
    AssertTrue(PointInTriangle(PointAt(150.0, 150.0), TriangleFrom(PointAt(100.0, 100.0), PointAt(200.0, 300.0), PointAt(300.0, 100.0))));
    AssertFalse(PointInTriangle(PointAt(350.0, 150.0), TriangleFrom(PointAt(100.0, 100.0), PointAt(200.0, 300.0), PointAt(300.0, 100.0))));
    CloseWindow(testWindow);
end;
end;

procedure RegisterTests;
begin
TestFramework.RegisterTest(TIntegrationTests.Suite);
end;
