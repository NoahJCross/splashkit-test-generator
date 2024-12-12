uses SplashKit, TestFramework

type
TTestGraphics = class(TTestCase)
protected
procedure TIntegrationTests.TestDrawCircleRecordIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    ClearWindow(testWindow, ColorWhite());
    testCircle := CircleAt(400.0, 300.0, 50.0);
    DrawCircle(ColorBlack(), testCircle);
    AssertEquals(ColorBlack(), GetPixel(testWindow, 450, 300));
    AssertEquals(ColorWhite(), GetPixel(testWindow, 400, 300));
    AssertEquals(ColorWhite(), GetPixel(testWindow, 460, 300));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestDrawCircleRecordWithOptionsIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    ClearWindow(testWindow, ColorWhite());
    testCircle := CircleAt(400.0, 300.0, 50.0);
    DrawCircle(ColorBlack(), testCircle, OptionDefaults());
    AssertEquals(ColorBlack(), GetPixel(testWindow, 450, 300));
    AssertEquals(ColorWhite(), GetPixel(testWindow, 400, 300));
    AssertEquals(ColorWhite(), GetPixel(testWindow, 460, 300));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestDrawCircleIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    ClearWindow(testWindow, ColorWhite());
    DrawCircle(ColorBlack(), 400.0, 300.0, 50.0);
    RefreshScreen();
    AssertEquals(ColorBlack(), GetPixel(testWindow, 450, 300));
    AssertEquals(ColorWhite(), GetPixel(testWindow, 425, 300));
    AssertEquals(ColorWhite(), GetPixel(testWindow, 460, 300));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestDrawCircleWithOptionsIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    ClearWindow(testWindow, ColorWhite());
    DrawCircle(ColorBlack(), 400.0, 300.0, 50.0, OptionDefaults());
    AssertEquals(ColorBlack(), GetPixel(testWindow, 450, 300));
    AssertEquals(ColorWhite(), GetPixel(testWindow, 400, 300));
    AssertEquals(ColorWhite(), GetPixel(testWindow, 460, 300));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestDrawCircleOnBitmapIntegration;
begin
    testBitmap := CreateBitmap("test_bitmap", 200, 200);
    ClearBitmap(testBitmap, ColorWhite());
    DrawCircleOnBitmap(testBitmap, ColorBlack(), 100.0, 100.0, 50.0);
    AssertEquals(ColorBlack(), GetPixel(testBitmap, 150, 100));
    AssertEquals(ColorWhite(), GetPixel(testBitmap, 100, 100));
    AssertEquals(ColorWhite(), GetPixel(testBitmap, 160, 100));
    FreeBitmap(testBitmap);
end;
procedure TIntegrationTests.TestDrawCircleOnBitmapWithOptionsIntegration;
begin
    testBitmap := CreateBitmap("test_bitmap", 200, 200);
    ClearBitmap(testBitmap, ColorWhite());
    DrawCircleOnBitmap(testBitmap, ColorBlack(), 100.0, 100.0, 50.0, OptionDefaults());
    AssertEquals(ColorBlack(), GetPixel(testBitmap, 150, 100));
    AssertEquals(ColorWhite(), GetPixel(testBitmap, 100, 100));
    AssertEquals(ColorWhite(), GetPixel(testBitmap, 160, 100));
    FreeBitmap(testBitmap);
end;
procedure TIntegrationTests.TestDrawCircleOnWindowIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    ClearWindow(testWindow, ColorWhite());
    DrawCircleOnWindow(testWindow, ColorBlack(), 400.0, 300.0, 50.0);
    AssertEquals(ColorBlack(), GetPixel(testWindow, 450, 300));
    AssertEquals(ColorWhite(), GetPixel(testWindow, 400, 300));
    AssertEquals(ColorWhite(), GetPixel(testWindow, 460, 300));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestDrawCircleOnWindowWithOptionsIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    ClearWindow(testWindow, ColorWhite());
    DrawCircleOnWindow(testWindow, ColorBlack(), 400.0, 300.0, 50.0, OptionDefaults());
    AssertEquals(ColorBlack(), GetPixel(testWindow, 450, 300));
    AssertEquals(ColorBlack(), GetPixel(testWindow, 350, 300));
    AssertEquals(ColorWhite(), GetPixel(testWindow, 400, 400));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestFillCircleRecordIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    ClearWindow(testWindow, ColorWhite());
    testCircle := CircleAt(400.0, 300.0, 50.0);
    FillCircle(ColorBlack(), testCircle);
    AssertEquals(ColorBlack(), GetPixel(testWindow, 400, 300));
    AssertEquals(ColorBlack(), GetPixel(testWindow, 425, 300));
    AssertEquals(ColorWhite(), GetPixel(testWindow, 460, 300));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestFillCircleRecordWithOptionsIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    ClearWindow(testWindow, ColorWhite());
    testCircle := CircleAt(400.0, 300.0, 50.0);
    FillCircle(ColorBlack(), testCircle, OptionDefaults());
    AssertEquals(ColorBlack(), GetPixel(testWindow, 400, 300));
    AssertEquals(ColorBlack(), GetPixel(testWindow, 425, 300));
    AssertEquals(ColorWhite(), GetPixel(testWindow, 460, 300));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestFillCircleIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    ClearWindow(testWindow, ColorWhite());
    FillCircle(ColorBlack(), 400.0, 300.0, 50.0);
    AssertEquals(ColorBlack(), GetPixel(testWindow, 400, 300));
    AssertEquals(ColorBlack(), GetPixel(testWindow, 425, 300));
    AssertEquals(ColorWhite(), GetPixel(testWindow, 460, 300));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestFillCircleWithOptionsIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    ClearWindow(testWindow, ColorWhite());
    FillCircle(ColorBlack(), 400.0, 300.0, 50.0, OptionDefaults());
    AssertEquals(ColorBlack(), GetPixel(testWindow, 400, 300));
    AssertEquals(ColorBlack(), GetPixel(testWindow, 425, 300));
    AssertEquals(ColorWhite(), GetPixel(testWindow, 460, 300));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestFillCircleOnBitmapIntegration;
begin
    testBitmap := CreateBitmap("test_bitmap", 200, 200);
    ClearBitmap(testBitmap, ColorWhite());
    FillCircleOnBitmap(testBitmap, ColorRed(), 100.0, 100.0, 50.0);
    AssertEquals(ColorRed(), GetPixel(testBitmap, 100, 100));
    AssertEquals(ColorRed(), GetPixel(testBitmap, 125, 100));
    AssertEquals(ColorWhite(), GetPixel(testBitmap, 160, 100));
    FreeBitmap(testBitmap);
end;
procedure TIntegrationTests.TestFillCircleOnBitmapWithOptionsIntegration;
begin
    testBitmap := CreateBitmap("test_bitmap", 200, 200);
    ClearBitmap(testBitmap, ColorWhite());
    FillCircleOnBitmap(testBitmap, ColorBlack(), 100.0, 100.0, 50.0, OptionDefaults());
    AssertEquals(ColorBlack(), GetPixel(testBitmap, 100, 100));
    AssertEquals(ColorBlack(), GetPixel(testBitmap, 125, 100));
    AssertEquals(ColorWhite(), GetPixel(testBitmap, 160, 100));
    FreeBitmap(testBitmap);
end;
procedure TIntegrationTests.TestFillCircleOnWindowIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    ClearWindow(testWindow, ColorWhite());
    FillCircleOnWindow(testWindow, ColorBlack(), 400.0, 300.0, 50.0);
    AssertEquals(ColorBlack(), GetPixel(testWindow, 400, 300));
    AssertEquals(ColorBlack(), GetPixel(testWindow, 425, 300));
    AssertEquals(ColorWhite(), GetPixel(testWindow, 460, 300));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestFillCircleOnWindowWithOptionsIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    ClearWindow(testWindow, ColorWhite());
    FillCircleOnWindow(testWindow, ColorBlack(), 400.0, 300.0, 50.0, OptionDefaults());
    AssertEquals(ColorBlack(), GetPixel(testWindow, 400, 300));
    AssertEquals(ColorBlack(), GetPixel(testWindow, 425, 300));
    AssertEquals(ColorWhite(), GetPixel(testWindow, 460, 300));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestCurrentClipIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    testClip := CurrentClip();
    AssertEquals(0, RectangleLeft(testClip));
    AssertEquals(0, RectangleTop(testClip));
    AssertEquals(800, testClip.Width);
    AssertEquals(600, testClip.Height);
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestCurrentClipForBitmapIntegration;
begin
    testBitmap := CreateBitmap("test_bitmap", 100, 100);
    testRectangle := RectangleFrom(10, 10, 50, 50);
    PushClip(testBitmap, testRectangle);
    testClip := CurrentClip(testBitmap);
    AssertEquals(0, RectangleLeft(testClip));
    AssertEquals(0, RectangleTop(testClip));
    AssertEquals(50, RectangleRight(testClip));
    AssertEquals(50, RectangleBottom(testClip));
    FreeBitmap(testBitmap);
end;
procedure TIntegrationTests.TestCurrentClipForWindowIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    testClip := CurrentClip(testWindow);
    AssertEquals(0, RectangleLeft(testClip));
    AssertEquals(0, RectangleTop(testClip));
    AssertEquals(800, testClip.Width);
    AssertEquals(600, testClip.Height);
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestPopClipForWindowIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    testRectangle := RectangleFrom(0, 0, 250, 250);
    PushClip(testWindow, testRectangle);
    testCurrentClip := CurrentClip(testWindow);
    AssertEquals(0, RectangleLeft(testCurrentClip));
    AssertEquals(0, RectangleTop(testCurrentClip));
    AssertEquals(250, testCurrentClip.Width);
    AssertEquals(250, testCurrentClip.Height);
    PopClip(testWindow);
    testCurrentClipAfterPop := CurrentClip(testWindow);
    AssertEquals(0, RectangleLeft(testCurrentClipAfterPop));
    AssertEquals(0, RectangleTop(testCurrentClipAfterPop));
    AssertEquals(800, testCurrentClipAfterPop.Width);
    AssertEquals(600, testCurrentClipAfterPop.Height);
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestPopClipIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    ClearWindow(testWindow, ColorWhite());
    PushClip(RectangleFrom(0, 0, 250, 250));
    FillRectangle(ColorRed(), 0, 0, 300, 300);
    RefreshScreen();
    AssertEquals(ColorRed(), GetPixel(testWindow, 125, 125));
    AssertEquals(ColorWhite(), GetPixel(testWindow, 275, 275));
    PopClip();
    FillRectangle(ColorGreen(), 300, 300, 100, 100);
    RefreshScreen();
    AssertEquals(ColorRed(), GetPixel(testWindow, 125, 125));
    AssertEquals(ColorGreen(), GetPixel(testWindow, 350, 350));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestPopClipForBitmapIntegration;
begin
    testBitmap := CreateBitmap("test_bitmap", 100, 100);
    ClearBitmap(testBitmap, ColorWhite());
    PushClip(testBitmap, RectangleFrom(0, 0, 50, 50));
    FillCircle(ColorBlack(), 25, 25, 20, OptionDrawTo(testBitmap));
    AssertEquals(ColorBlack(), GetPixel(testBitmap, 25, 25));
    AssertEquals(ColorWhite(), GetPixel(testBitmap, 75, 75));
    PopClip(testBitmap);
    testClip := CurrentClip(testBitmap);
    AssertEquals(0, RectangleLeft(testClip));
    AssertEquals(0, RectangleTop(testClip));
    AssertEquals(100, testClip.Width);
    AssertEquals(100, testClip.height);
    FreeBitmap(testBitmap);
end;
procedure TIntegrationTests.TestPushClipForWindowIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    testRectangle := RectangleFrom(100.0, 100.0, 200.0, 200.0);
    PushClip(testWindow, testRectangle);
    testCurrentClip := CurrentClip(testWindow);
    AssertEquals(100, RectangleLeft(testCurrentClip));
    AssertEquals(100, RectangleTop(testCurrentClip));
    AssertEquals(200, testCurrentClip.Width);
    AssertEquals(200, testCurrentClip.Height);
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
    AssertEquals(100, testCurrentClip.Width);
    AssertEquals(100, testCurrentClip.Height);
    FreeBitmap(testBitmap);
end;
procedure TIntegrationTests.TestPushClipIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    testRectangle := RectangleFrom(100.0, 100.0, 200.0, 200.0);
    PushClip(testRectangle);
    testCurrentClip := CurrentClip();
    AssertEquals(100, RectangleLeft(testCurrentClip));
    AssertEquals(100, RectangleTop(testCurrentClip));
    AssertEquals(200, testCurrentClip.Width);
    AssertEquals(200, testCurrentClip.Height);
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestResetClipForBitmapIntegration;
begin
    testBitmap := CreateBitmap("test_bitmap", 100, 100);
    PushClip(testBitmap, RectangleFrom(10, 10, 50, 50));
    ResetClip(testBitmap);
    testClip := CurrentClip(testBitmap);
    AssertEquals(0, RectangleLeft(testClip));
    AssertEquals(0, RectangleTop(testClip));
    AssertEquals(100, testClip.width);
    AssertEquals(100, testClip.height);
    FreeBitmap(testBitmap);
end;
procedure TIntegrationTests.TestResetClipIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    PushClip(RectangleFrom(100, 100, 200, 200));
    ResetClip();
    testClip := CurrentClip();
    AssertEquals(0, RectangleLeft(testClip));
    AssertEquals(0, RectangleTop(testClip));
    AssertEquals(800, testClip.Width);
    AssertEquals(600, testClip.Height);
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestResetClipForWindowIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    PushClip(testWindow, RectangleFrom(100, 100, 200, 200));
    ResetClip(testWindow);
    testClip := CurrentClip(testWindow);
    AssertEquals(0, RectangleLeft(testClip));
    AssertEquals(0, RectangleTop(testClip));
    AssertEquals(800, testClip.Width);
    AssertEquals(600, testClip.Height);
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestSetClipIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    testRectangle := RectangleFrom(100.0, 100.0, 200.0, 200.0);
    SetClip(testRectangle);
    testCurrentClip := CurrentClip();
    AssertEquals(100, RectangleLeft(testCurrentClip));
    AssertEquals(100, RectangleTop(testCurrentClip));
    AssertEquals(200, testCurrentClip.Width);
    AssertEquals(200, testCurrentClip.Height);
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestSetClipForBitmapIntegration;
begin
    testBitmap := CreateBitmap("test_bitmap", 200, 200);
    testRectangle := RectangleFrom(50, 50, 100, 100);
    SetClip(testBitmap, testRectangle);
    testCurrentClip := CurrentClip(testBitmap);
    AssertEquals(50, RectangleLeft(testCurrentClip));
    AssertEquals(50, RectangleTop(testCurrentClip));
    AssertEquals(100, testCurrentClip.Width);
    AssertEquals(100, testCurrentClip.Height);
    FreeBitmap(testBitmap);
end;
procedure TIntegrationTests.TestSetClipForWindowIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    testRectangle := RectangleFrom(100, 100, 200, 200);
    SetClip(testWindow, testRectangle);
    testCurrentClip := CurrentClip(testWindow);
    AssertEquals(100, RectangleLeft(testCurrentClip));
    AssertEquals(100, RectangleTop(testCurrentClip));
    AssertEquals(200, testCurrentClip.Width);
    AssertEquals(200, testCurrentClip.Height);
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
    ClearBitmap(testBitmap, ColorWhite());
    testOptions := OptionDrawTo(testBitmap);
    DrawCircle(ColorBlack(), CircleAt(50.0, 50.0, 25.0), testOptions);
    AssertEquals(ColorBlack(), GetPixel(testBitmap, 75, 50));
    AssertEquals(ColorWhite(), GetPixel(testBitmap, 90, 90));
    FreeBitmap(testBitmap);
end;
procedure TIntegrationTests.TestOptionDrawToBitmapWithOptionsIntegration;
begin
    testBitmap := CreateBitmap("test_bitmap", 100, 100);
    ClearBitmap(testBitmap, ColorWhite());
    testOptions := OptionDefaults();
    testDrawingOptions := OptionDrawTo(testBitmap, testOptions);
    DrawCircle(ColorBlack(), CircleAt(50.0, 50.0, 25.0), testDrawingOptions);
    AssertEquals(ColorBlack(), GetPixel(testBitmap, 75, 50));
    AssertEquals(ColorWhite(), GetPixel(testBitmap, 90, 90));
    FreeBitmap(testBitmap);
end;
procedure TIntegrationTests.TestOptionDrawToWindowIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    ClearWindow(testWindow, ColorWhite());
    DrawCircle(ColorBlack(), CircleAt(400.0, 300.0, 50.0), OptionDrawTo(testWindow));
    RefreshScreen();
    AssertEquals(ColorBlack(), GetPixel(testWindow, 450, 300));
    AssertEquals(ColorWhite(), GetPixel(testWindow, 460, 300));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestOptionDrawToWindowWithOptionsIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    ClearWindow(testWindow, ColorWhite());
    testOptions := OptionDefaults();
    DrawCircle(ColorBlack(), CircleAt(400.0, 300.0, 50.0), OptionDrawTo(testWindow, testOptions));
    RefreshScreen();
    AssertEquals(ColorBlack(), GetPixel(testWindow, 450, 300));
    AssertEquals(ColorWhite(), GetPixel(testWindow, 460, 300));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestOptionFlipXIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    ClearWindow(testWindow, ColorWhite());
    testBitmap := CreateBitmap("test_bitmap", 100, 100);
    ClearBitmap(testBitmap, ColorWhite());
    FillRectangleOnBitmap(testBitmap, ColorBlack(), 0, 0, 50, 100);
    DrawBitmap(testBitmap, 100.0, 100.0, OptionFlipX());
    RefreshScreen();
    AssertEquals(ColorBlack(), GetPixel(testWindow, 125, 100));
    AssertEquals(ColorWhite(), GetPixel(testWindow, 75, 100));
    FreeBitmap(testBitmap);
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestOptionFlipXWithOptionsIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    ClearWindow(testWindow, ColorWhite());
    testBitmap := CreateBitmap("test_bitmap", 100, 100);
    ClearBitmap(testBitmap, ColorWhite());
    FillRectangleOnBitmap(testBitmap, ColorBlack(), 0, 0, 50, 100);
    DrawBitmap(testBitmap, 400, 300, OptionFlipX(OptionDefaults()));
    RefreshScreen();
    AssertEquals(ColorBlack(), GetPixel(testWindow, 425, 300));
    AssertEquals(ColorWhite(), GetPixel(testWindow, 375, 300));
    FreeBitmap(testBitmap);
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestOptionFlipXyIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    ClearWindow(testWindow, ColorWhite());
    testBitmap := CreateBitmap("test_bitmap", 100, 100);
    ClearBitmap(testBitmap, ColorWhite());
    FillRectangleOnBitmap(testBitmap, ColorBlack(), 0, 0, 50, 50);
    DrawBitmap(testBitmap, 400.0, 300.0, OptionFlipXy());
    RefreshScreen();
    AssertEquals(ColorBlack(), GetPixel(testWindow, 450, 350));
    AssertEquals(ColorWhite(), GetPixel(testWindow, 450, 250));
    FreeBitmap(testBitmap);
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestOptionFlipXyWithOptionsIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    ClearWindow(testWindow, ColorWhite());
    testBitmap := CreateBitmap("test_bitmap", 100, 100);
    ClearBitmap(testBitmap, ColorWhite());
    FillRectangleOnBitmap(testBitmap, ColorBlack(), 0, 0, 50, 50);
    DrawBitmap(testBitmap, 400, 300, OptionFlipXy(OptionDefaults()));
    RefreshScreen();
    AssertEquals(ColorBlack(), GetPixel(testWindow, 450, 350));
    AssertEquals(ColorWhite(), GetPixel(testWindow, 450, 250));
    FreeBitmap(testBitmap);
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestOptionFlipYIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    ClearWindow(testWindow, ColorWhite());
    testBitmap := CreateBitmap("test_bitmap", 100, 100);
    ClearBitmap(testBitmap, ColorWhite());
    FillRectangleOnBitmap(testBitmap, ColorBlack(), 0, 0, 100, 50);
    DrawBitmap(testBitmap, 400.0, 300.0, OptionFlipY());
    RefreshScreen();
    AssertEquals(ColorBlack(), GetPixel(testWindow, 400, 325));
    AssertEquals(ColorWhite(), GetPixel(testWindow, 400, 275));
    FreeBitmap(testBitmap);
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestOptionFlipYWithOptionsIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    ClearWindow(testWindow, ColorWhite());
    testBitmap := CreateBitmap("test_bitmap", 100, 100);
    ClearBitmap(testBitmap, ColorWhite());
    FillRectangleOnBitmap(testBitmap, ColorBlack(), 0, 0, 100, 50);
    DrawBitmap(testBitmap, 400.0, 300.0, OptionFlipY(OptionDefaults()));
    RefreshScreen();
    AssertEquals(ColorBlack(), GetPixel(testWindow, 400, 325));
    AssertEquals(ColorWhite(), GetPixel(testWindow, 400, 275));
    FreeBitmap(testBitmap);
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestOptionLineWidthIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    ClearWindow(testWindow, ColorWhite());
    DrawLine(ColorBlack(), 100.0, 100.0, 200.0, 200.0, OptionLineWidth(5));
    RefreshScreen();
    AssertEquals(ColorBlack(), GetPixel(testWindow, 150, 150));
    AssertEquals(ColorWhite(), GetPixel(testWindow, 140, 150));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestOptionLineWidthWithOptionsIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    ClearWindow(testWindow, ColorWhite());
    DrawLine(ColorBlack(), 100.0, 100.0, 200.0, 200.0, OptionLineWidth(5, OptionDefaults()));
    RefreshScreen();
    AssertEquals(ColorBlack(), GetPixel(testWindow, 150, 150));
    AssertEquals(ColorWhite(), GetPixel(testWindow, 145, 150));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestOptionPartBmpIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    ClearWindow(testWindow, ColorWhite());
    testBitmap := CreateBitmap("test_bitmap", 100, 100);
    ClearBitmap(testBitmap, ColorBlack());
    DrawBitmap(testBitmap, 100.0, 100.0, OptionPartBmp(0.0, 0.0, 50.0, 50.0));
    RefreshScreen();
    AssertEquals(ColorBlack(), GetPixel(testWindow, 125, 125));
    AssertEquals(ColorWhite(), GetPixel(testWindow, 175, 175));
    FreeBitmap(testBitmap);
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestOptionPartBmpWithOptionsIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    ClearWindow(testWindow, ColorWhite());
    testBitmap := CreateBitmap("test_bitmap", 100, 100);
    ClearBitmap(testBitmap, ColorBlack());
    DrawBitmap(testBitmap, 100.0, 100.0, OptionPartBmp(0.0, 0.0, 50.0, 50.0, OptionDefaults()));
    RefreshScreen();
    AssertEquals(ColorBlack(), GetPixel(testWindow, 125, 125));
    AssertEquals(ColorWhite(), GetPixel(testWindow, 175, 175));
    FreeBitmap(testBitmap);
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestOptionPartBmpFromRectangleIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    ClearWindow(testWindow, ColorWhite());
    testBitmap := CreateBitmap("test_bitmap", 100, 100);
    ClearBitmap(testBitmap, ColorBlack());
    DrawBitmap(testBitmap, 0, 0, OptionPartBmp(RectangleFrom(0, 0, 50, 50)));
    RefreshScreen();
    AssertEquals(ColorBlack(), GetPixel(testWindow, 25, 25));
    AssertEquals(ColorWhite(), GetPixel(testWindow, 75, 75));
    FreeBitmap(testBitmap);
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestOptionPartBmpFromRectangleWithOptionsIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    ClearWindow(testWindow, ColorWhite());
    testBitmap := CreateBitmap("test_bitmap", 100, 100);
    ClearBitmap(testBitmap, ColorBlack());
    DrawBitmap(testBitmap, 0, 0, OptionPartBmp(RectangleFrom(0, 0, 50, 50), OptionDefaults()));
    RefreshScreen();
    AssertEquals(ColorBlack(), GetPixel(testWindow, 25, 25));
    AssertEquals(ColorWhite(), GetPixel(testWindow, 75, 75));
    FreeBitmap(testBitmap);
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestOptionRotateBmpIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    ClearWindow(testWindow, ColorWhite());
    testBitmap := CreateBitmap("test_bitmap", 100, 100);
    ClearBitmap(testBitmap, ColorWhite());
    FillRectangleOnBitmap(testBitmap, ColorBlack(), 0, 0, 50, 100);
    DrawBitmap(testBitmap, 400.0, 300.0, OptionRotateBmp(90.0));
    RefreshScreen();
    AssertEquals(ColorBlack(), GetPixel(testWindow, 400, 300));
    AssertEquals(ColorWhite(), GetPixel(testWindow, 400, 350));
    FreeBitmap(testBitmap);
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestOptionRotateBmpWithAnchorIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    ClearWindow(testWindow, ColorWhite());
    testBitmap := CreateBitmap("test_bitmap", 100, 100);
    ClearBitmap(testBitmap, ColorWhite());
    FillRectangleOnBitmap(testBitmap, ColorBlack(), 0, 0, 50, 100);
    DrawBitmap(testBitmap, 400.0, 300.0, OptionRotateBmp(90.0, 50.0, 50.0));
    RefreshScreen();
    AssertEquals(ColorBlack(), GetPixel(testWindow, 500, 300));
    AssertEquals(ColorWhite(), GetPixel(testWindow, 450, 300));
    FreeBitmap(testBitmap);
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestOptionRotateBmpWithAnchorAndOptionsIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    ClearWindow(testWindow, ColorWhite());
    testBitmap := CreateBitmap("test_bitmap", 100, 100);
    ClearBitmap(testBitmap, ColorWhite());
    FillRectangleOnBitmap(testBitmap, ColorBlack(), 0, 0, 50, 100);
    DrawBitmap(testBitmap, 400.0, 300.0, OptionRotateBmp(90.0, 50.0, 50.0, OptionDefaults()));
    RefreshScreen();
    AssertEquals(ColorBlack(), GetPixel(testWindow, 500, 300));
    AssertEquals(ColorWhite(), GetPixel(testWindow, 400, 300));
    FreeBitmap(testBitmap);
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestOptionRotateBmpWithOptionsIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    ClearWindow(testWindow, ColorWhite());
    testBitmap := CreateBitmap("test_bitmap", 100, 100);
    ClearBitmap(testBitmap, ColorWhite());
    FillRectangleOnBitmap(testBitmap, ColorBlack(), 0, 0, 50, 100);
    DrawBitmap(testBitmap, 400.0, 300.0, OptionRotateBmp(90.0, OptionDefaults()));
    RefreshScreen();
    AssertEquals(ColorBlack(), GetPixel(testWindow, 400, 300));
    AssertEquals(ColorWhite(), GetPixel(testWindow, 400, 350));
    FreeBitmap(testBitmap);
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestOptionScaleBmpIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    ClearWindow(testWindow, ColorWhite());
    testBitmap := CreateBitmap("test_bitmap", 50, 50);
    ClearBitmap(testBitmap, ColorBlack());
    DrawBitmap(testBitmap, 400.0, 300.0, OptionScaleBmp(2.0, 2.0));
    RefreshScreen();
    AssertEquals(ColorBlack(), GetPixel(testWindow, 451, 300));
    AssertEquals(ColorWhite(), GetPixel(testWindow, 500, 300));
    FreeBitmap(testBitmap);
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestOptionScaleBmpWithOptionsIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    ClearWindow(testWindow, ColorWhite());
    testBitmap := CreateBitmap("test_bitmap", 50, 50);
    ClearBitmap(testBitmap, ColorBlack());
    DrawBitmap(testBitmap, 400.0, 300.0, OptionScaleBmp(2.0, 2.0, OptionDefaults()));
    RefreshScreen();
    AssertEquals(ColorBlack(), GetPixel(testWindow, 451, 300));
    AssertEquals(ColorWhite(), GetPixel(testWindow, 500, 300));
    FreeBitmap(testBitmap);
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestOptionToScreenIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    ClearWindow(testWindow, ColorWhite());
    DrawCircle(ColorBlack(), CircleAt(400.0, 300.0, 50.0), OptionToScreen());
    RefreshScreen();
    AssertEquals(ColorBlack(), GetPixel(testWindow, 450, 300));
    AssertEquals(ColorWhite(), GetPixel(testWindow, 451, 300));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestOptionToScreenWithOptionsIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    ClearWindow(testWindow, ColorWhite());
    DrawCircle(ColorBlack(), CircleAt(400.0, 300.0, 50.0), OptionToScreen(OptionDefaults()));
    RefreshScreen();
    AssertEquals(ColorBlack(), GetPixel(testWindow, 400, 250));
    AssertEquals(ColorWhite(), GetPixel(testWindow, 400, 300));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestOptionToWorldIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    ClearWindow(testWindow, ColorWhite());
    MoveCameraTo(100.0, 100.0);
    DrawCircle(ColorBlack(), CircleAt(400.0, 300.0, 50.0), OptionToWorld());
    RefreshScreen();
    AssertEquals(ColorBlack(), GetPixel(testWindow, 350, 200));
    AssertEquals(ColorWhite(), GetPixel(testWindow, 375, 200));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestOptionToWorldWithOptionsIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    ClearWindow(testWindow, ColorWhite());
    MoveCameraTo(100.0, 100.0);
    DrawCircle(ColorBlack(), CircleAt(400.0, 300.0, 50.0), OptionToWorld(OptionDefaults()));
    RefreshScreen();
    AssertEquals(ColorBlack(), GetPixel(testWindow, 350, 200));
    AssertEquals(ColorWhite(), GetPixel(testWindow, 375, 200));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestOptionWithAnimationIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    ClearWindow(testWindow, ColorWhite());
    testBitmap := CreateBitmap("test_bitmap", 100, 100);
    ClearBitmap(testBitmap, ColorBlack());
    testAnimation := CreateAnimation("test_animation", "default");
    DrawBitmap(testBitmap, 100, 100, OptionWithAnimation(testAnimation));
    RefreshScreen();
    AssertEquals(ColorBlack(), GetPixel(testWindow, 125, 125));
    AssertEquals(ColorWhite(), GetPixel(testWindow, 75, 75));
    FreeAnimation(testAnimation);
    FreeBitmap(testBitmap);
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestOptionWithAnimationWithOptionsIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    ClearWindow(testWindow, ColorWhite());
    testBitmap := CreateBitmap("test_bitmap", 100, 100);
    ClearBitmap(testBitmap, ColorBlack());
    testAnimation := CreateAnimation("test_animation", "default");
    DrawBitmap(testBitmap, 100, 100, OptionWithAnimation(testAnimation, OptionDefaults()));
    RefreshScreen();
    AssertEquals(ColorBlack(), GetPixel(testWindow, 125, 125));
    AssertEquals(ColorWhite(), GetPixel(testWindow, 75, 75));
    FreeAnimation(testAnimation);
    FreeBitmap(testBitmap);
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestOptionWithBitmapCellIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    ClearWindow(testWindow, ColorWhite());
    testBitmap := CreateBitmap("test_bitmap", 64, 64);
    ClearBitmap(testBitmap, ColorBlack());
    BitmapSetCellDetails(testBitmap, 32, 32, 2, 2, 4);
    DrawBitmap(testBitmap, 100, 100, OptionWithBitmapCell(1));
    RefreshScreen();
    AssertEquals(ColorBlack(), GetPixel(testWindow, 116, 116));
    AssertEquals(ColorWhite(), GetPixel(testWindow, 84, 84));
    FreeBitmap(testBitmap);
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestOptionWithBitmapCellWithOptionsIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    ClearWindow(testWindow, ColorWhite());
    testBitmap := CreateBitmap("test_bitmap", 64, 64);
    ClearBitmap(testBitmap, ColorBlack());
    BitmapSetCellDetails(testBitmap, 32, 32, 2, 2, 4);
    DrawBitmap(testBitmap, 100, 100, OptionWithBitmapCell(1, OptionDefaults()));
    RefreshScreen();
    AssertEquals(ColorBlack(), GetPixel(testWindow, 116, 116));
    AssertEquals(ColorWhite(), GetPixel(testWindow, 84, 84));
    FreeBitmap(testBitmap);
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestDrawEllipseWithinRectangleIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    ClearWindow(testWindow, ColorWhite());
    DrawEllipse(ColorBlack(), RectangleFrom(100, 100, 200, 150));
    RefreshScreen();
    AssertEquals(ColorBlack(), GetPixel(testWindow, 300, 175));
    AssertEquals(ColorWhite(), GetPixel(testWindow, 200, 175));
    AssertEquals(ColorWhite(), GetPixel(testWindow, 350, 175));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestDrawEllipseWithinRectangleWithOptionsIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    ClearWindow(testWindow, ColorWhite());
    DrawEllipse(ColorBlack(), RectangleFrom(100, 100, 200, 100), OptionDefaults());
    RefreshScreen();
    AssertEquals(ColorBlack(), GetPixel(testWindow, 300, 150));
    AssertEquals(ColorWhite(), GetPixel(testWindow, 200, 150));
    AssertEquals(ColorWhite(), GetPixel(testWindow, 350, 150));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestDrawEllipseIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    ClearWindow(testWindow, ColorWhite());
    DrawEllipse(ColorBlack(), 400.0, 300.0, 100.0, 50.0);
    RefreshScreen();
    AssertEquals(ColorBlack(), GetPixel(testWindow, 450, 300));
    AssertEquals(ColorWhite(), GetPixel(testWindow, 400, 300));
    AssertEquals(ColorWhite(), GetPixel(testWindow, 500, 300));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestDrawEllipseWithOptionsIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    ClearWindow(testWindow, ColorWhite());
    DrawEllipse(ColorBlack(), 400.0, 300.0, 100.0, 50.0, OptionDefaults());
    RefreshScreen();
    AssertEquals(ColorBlack(), GetPixel(testWindow, 450, 300));
    AssertEquals(ColorWhite(), GetPixel(testWindow, 400, 300));
    AssertEquals(ColorWhite(), GetPixel(testWindow, 500, 300));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestDrawEllipseOnBitmapWithinRectangleIntegration;
begin
    testBitmap := CreateBitmap("test_bitmap", 200, 200);
    ClearBitmap(testBitmap, ColorWhite());
    rect := RectangleFrom(50.0, 50.0, 100.0, 100.0);
    DrawEllipseOnBitmap(testBitmap, ColorBlack(), rect);
    AssertEquals(ColorBlack(), GetPixel(testBitmap, 150, 100));
    AssertEquals(ColorWhite(), GetPixel(testBitmap, 125, 100));
    AssertEquals(ColorWhite(), GetPixel(testBitmap, 175, 100));
    FreeBitmap(testBitmap);
end;
procedure TIntegrationTests.TestDrawEllipseOnBitmapWithinRectangleWithOptionsIntegration;
begin
    testBitmap := CreateBitmap("test_bitmap", 200, 200);
    ClearBitmap(testBitmap, ColorWhite());
    DrawEllipseOnBitmap(testBitmap, ColorBlack(), RectangleFrom(50.0, 50.0, 100.0, 100.0), OptionDefaults());
    AssertEquals(ColorBlack(), GetPixel(testBitmap, 150, 100));
    AssertEquals(ColorWhite(), GetPixel(testBitmap, 125, 100));
    AssertEquals(ColorWhite(), GetPixel(testBitmap, 175, 100));
    FreeBitmap(testBitmap);
end;
procedure TIntegrationTests.TestDrawEllipseOnBitmapIntegration;
begin
    testBitmap := CreateBitmap("test_bitmap", 200, 200);
    ClearBitmap(testBitmap, ColorWhite());
    DrawEllipseOnBitmap(testBitmap, ColorBlack(), 100.0, 100.0, 50.0, 30.0);
    AssertEquals(ColorBlack(), GetPixel(testBitmap, 125, 100));
    AssertEquals(ColorWhite(), GetPixel(testBitmap, 100, 100));
    AssertEquals(ColorWhite(), GetPixel(testBitmap, 160, 100));
    FreeBitmap(testBitmap);
end;
procedure TIntegrationTests.TestDrawEllipseOnBitmapWithOptionsIntegration;
begin
    testBitmap := CreateBitmap("test_bitmap", 200, 200);
    ClearBitmap(testBitmap, ColorWhite());
    DrawEllipseOnBitmap(testBitmap, ColorBlack(), 100.0, 100.0, 50.0, 30.0, OptionDefaults());
    AssertEquals(ColorBlack(), GetPixel(testBitmap, 125, 100));
    AssertEquals(ColorWhite(), GetPixel(testBitmap, 100, 100));
    AssertEquals(ColorWhite(), GetPixel(testBitmap, 160, 100));
    FreeBitmap(testBitmap);
end;
procedure TIntegrationTests.TestDrawEllipseOnWindowWithinRectangleIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    ClearWindow(testWindow, ColorWhite());
    rect := RectangleFrom(100.0, 100.0, 200.0, 100.0);
    DrawEllipseOnWindow(testWindow, ColorBlack(), rect);
    RefreshScreen();
    AssertEquals(ColorBlack(), GetPixel(testWindow, 300, 150));
    AssertEquals(ColorWhite(), GetPixel(testWindow, 250, 150));
    AssertEquals(ColorWhite(), GetPixel(testWindow, 350, 150));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestDrawEllipseOnWindowWithinRectangleWithOptionsIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    ClearWindow(testWindow, ColorWhite());
    rect := RectangleFrom(100.0, 100.0, 200.0, 100.0);
    DrawEllipseOnWindow(testWindow, ColorBlack(), rect, OptionDefaults());
    RefreshScreen();
    AssertEquals(ColorBlack(), GetPixel(testWindow, 300, 150));
    AssertEquals(ColorWhite(), GetPixel(testWindow, 250, 150));
    AssertEquals(ColorWhite(), GetPixel(testWindow, 350, 150));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestDrawEllipseOnWindowIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    ClearWindow(testWindow, ColorWhite());
    DrawEllipseOnWindow(testWindow, ColorBlack(), 400.0, 300.0, 100.0, 50.0);
    RefreshScreen();
    AssertEquals(ColorBlack(), GetPixel(testWindow, 450, 300));
    AssertEquals(ColorWhite(), GetPixel(testWindow, 400, 300));
    AssertEquals(ColorWhite(), GetPixel(testWindow, 500, 300));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestDrawEllipseOnWindowWithOptionsIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    ClearWindow(testWindow, ColorWhite());
    DrawEllipseOnWindow(testWindow, ColorBlack(), 400.0, 300.0, 100.0, 50.0, OptionDefaults());
    RefreshScreen();
    AssertEquals(ColorBlack(), GetPixel(testWindow, 450, 300));
    AssertEquals(ColorWhite(), GetPixel(testWindow, 450, 325));
    AssertEquals(ColorWhite(), GetPixel(testWindow, 500, 300));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestFillEllipseWithinRectangleIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    ClearWindow(testWindow, ColorWhite());
    FillEllipse(ColorBlack(), RectangleFrom(100.0, 100.0, 200.0, 100.0));
    RefreshScreen();
    AssertEquals(ColorBlack(), GetPixel(testWindow, 200, 100));
    AssertEquals(ColorBlack(), GetPixel(testWindow, 150, 150));
    AssertEquals(ColorWhite(), GetPixel(testWindow, 50, 50));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestFillEllipseWithinRectangleWithOptionsIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    ClearWindow(testWindow, ColorWhite());
    FillEllipse(ColorBlack(), RectangleFrom(100.0, 100.0, 200.0, 100.0), OptionDefaults());
    RefreshScreen();
    AssertEquals(ColorBlack(), GetPixel(testWindow, 200, 100));
    AssertEquals(ColorBlack(), GetPixel(testWindow, 150, 150));
    AssertEquals(ColorWhite(), GetPixel(testWindow, 50, 50));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestFillEllipseIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    ClearWindow(testWindow, ColorWhite());
    FillEllipse(ColorBlack(), 400.0, 300.0, 100.0, 50.0);
    RefreshScreen();
    AssertEquals(ColorBlack(), GetPixel(testWindow, 450, 300));
    AssertEquals(ColorBlack(), GetPixel(testWindow, 450, 325));
    AssertEquals(ColorWhite(), GetPixel(testWindow, 500, 300));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestFillEllipseWithOptionsIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    ClearWindow(testWindow, ColorWhite());
    FillEllipse(ColorBlack(), 400.0, 300.0, 100.0, 50.0, OptionDefaults());
    RefreshScreen();
    AssertEquals(ColorBlack(), GetPixel(testWindow, 450, 300));
    AssertEquals(ColorBlack(), GetPixel(testWindow, 450, 325));
    AssertEquals(ColorWhite(), GetPixel(testWindow, 300, 300));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestFillEllipseOnBitmapWithinRectangleIntegration;
begin
    testBitmap := CreateBitmap("test_bitmap", 200, 200);
    ClearBitmap(testBitmap, ColorWhite());
    FillEllipseOnBitmap(testBitmap, ColorBlack(), RectangleFrom(50.0, 50.0, 100.0, 100.0));
    AssertEquals(ColorBlack(), GetPixel(testBitmap, 100, 100));
    AssertEquals(ColorBlack(), GetPixel(testBitmap, 75, 75));
    AssertEquals(ColorWhite(), GetPixel(testBitmap, 175, 175));
    FreeBitmap(testBitmap);
end;
procedure TIntegrationTests.TestFillEllipseOnBitmapWithinRectangleWithOptionsIntegration;
begin
    testBitmap := CreateBitmap("test_bitmap", 200, 200);
    ClearBitmap(testBitmap, ColorWhite());
    FillEllipseOnBitmap(testBitmap, ColorBlack(), RectangleFrom(50.0, 50.0, 100.0, 100.0), OptionDefaults());
    AssertEquals(ColorBlack(), GetPixel(testBitmap, 100, 100));
    AssertEquals(ColorBlack(), GetPixel(testBitmap, 75, 75));
    AssertEquals(ColorWhite(), GetPixel(testBitmap, 175, 175));
    FreeBitmap(testBitmap);
end;
procedure TIntegrationTests.TestFillEllipseOnBitmapIntegration;
begin
    testBitmap := CreateBitmap("test_bitmap", 200, 200);
    ClearBitmap(testBitmap, ColorWhite());
    FillEllipseOnBitmap(testBitmap, ColorBlack(), 100.0, 100.0, 50.0, 30.0);
    AssertEquals(ColorBlack(), GetPixel(testBitmap, 125, 100));
    AssertEquals(ColorBlack(), GetPixel(testBitmap, 125, 125));
    AssertEquals(ColorWhite(), GetPixel(testBitmap, 150, 100));
    FreeBitmap(testBitmap);
end;
procedure TIntegrationTests.TestFillEllipseOnBitmapWithOptionsIntegration;
begin
    testBitmap := CreateBitmap("test_bitmap", 200, 200);
    ClearBitmap(testBitmap, ColorWhite());
    FillEllipseOnBitmap(testBitmap, ColorBlack(), 50.0, 50.0, 100.0, 50.0, OptionDefaults());
    AssertEquals(ColorBlack(), GetPixel(testBitmap, 100, 50));
    AssertEquals(ColorBlack(), GetPixel(testBitmap, 100, 75));
    AssertEquals(ColorWhite(), GetPixel(testBitmap, 150, 50));
    FreeBitmap(testBitmap);
end;
procedure TIntegrationTests.TestFillEllipseOnWindowWithinRectangleIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    ClearWindow(testWindow, ColorWhite());
    FillEllipseOnWindow(testWindow, ColorBlack(), RectangleFrom(100.0, 100.0, 200.0, 150.0));
    RefreshScreen();
    AssertEquals(ColorBlack(), GetPixel(testWindow, 200, 175));
    AssertEquals(ColorBlack(), GetPixel(testWindow, 150, 175));
    AssertEquals(ColorWhite(), GetPixel(testWindow, 350, 175));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestFillEllipseOnWindowWithinRectangleWithOptionsIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    ClearWindow(testWindow, ColorWhite());
    FillEllipseOnWindow(testWindow, ColorBlack(), RectangleFrom(100.0, 100.0, 200.0, 150.0), OptionDefaults());
    RefreshScreen();
    AssertEquals(ColorBlack(), GetPixel(testWindow, 200, 175));
    AssertEquals(ColorBlack(), GetPixel(testWindow, 150, 175));
    AssertEquals(ColorWhite(), GetPixel(testWindow, 350, 175));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestFillEllipseOnWindowIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    ClearWindow(testWindow, ColorWhite());
    FillEllipseOnWindow(testWindow, ColorBlack(), 400.0, 300.0, 100.0, 50.0);
    RefreshScreen();
    AssertEquals(ColorBlack(), GetPixel(testWindow, 450, 300));
    AssertEquals(ColorBlack(), GetPixel(testWindow, 450, 325));
    AssertEquals(ColorWhite(), GetPixel(testWindow, 500, 300));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestFillEllipseOnWindowWithOptionsIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    ClearWindow(testWindow, ColorWhite());
    FillEllipseOnWindow(testWindow, ColorBlack(), 400.0, 300.0, 100.0, 50.0, OptionDefaults());
    RefreshScreen();
    AssertEquals(ColorBlack(), GetPixel(testWindow, 450, 300));
    AssertEquals(ColorBlack(), GetPixel(testWindow, 450, 325));
    AssertEquals(ColorWhite(), GetPixel(testWindow, 500, 300));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestClearScreenToWhiteIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    DrawPixel(ColorBlack(), 100.0, 100.0);
    RefreshScreen();
    AssertEquals(ColorBlack(), GetPixel(testWindow, 100, 100));
    ClearScreen();
    RefreshScreen();
    AssertEquals(ColorWhite(), GetPixel(testWindow, 100, 100));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestClearScreenIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    DrawPixel(ColorBlack(), 100.0, 100.0);
    RefreshScreen();
    AssertEquals(ColorBlack(), GetPixel(testWindow, 100, 100));
    ClearScreen(ColorWhite());
    RefreshScreen();
    AssertEquals(ColorWhite(), GetPixel(testWindow, 100, 100));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestDisplayDetailsIntegration;
begin
    displays := NumberOfDisplays();
    AssertTrue(displays > 0);
    display := DisplayDetails(0);
    AssertNotNull(display);
    AssertTrue(DisplayWidth(display) > 0);
    AssertTrue(DisplayHeight(display) > 0);
    AssertNotNull(DisplayName(display));
end;
procedure TIntegrationTests.TestDisplayHeightIntegration;
begin
    display := DisplayDetails(0);
    AssertTrue(DisplayHeight(display) > 0);
end;
procedure TIntegrationTests.TestDisplayNameIntegration;
begin
    display := DisplayDetails(0);
    AssertNotNull(DisplayName(display));
    AssertTrue(Length(DisplayName(display)) > 0);
end;
procedure TIntegrationTests.TestDisplayWidthIntegration;
begin
    display := DisplayDetails(0);
    AssertTrue(DisplayWidth(display) > 0);
end;
procedure TIntegrationTests.TestDisplayXIntegration;
begin
    display := DisplayDetails(0);
    AssertTrue(DisplayX(display) > 0);
end;
procedure TIntegrationTests.TestDisplayYIntegration;
begin
    display := DisplayDetails(0);
    AssertTrue(DisplayY(display) > 0);
end;
procedure TIntegrationTests.TestNumberOfDisplaysIntegration;
begin
    AssertTrue(NumberOfDisplays() > 0);
end;
procedure TIntegrationTests.TestRefreshScreenIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    ClearWindow(testWindow, ColorWhite());
    DrawCircle(ColorBlack(), CircleAt(400.0, 300.0, 50.0));
    RefreshScreen();
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestRefreshScreenWithTargetFpsIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    ClearWindow(testWindow, ColorWhite());
    DrawCircle(ColorBlack(), CircleAt(400.0, 300.0, 50.0));
    RefreshScreen(60);
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestSaveBitmapIntegration;
begin
    testBitmap := CreateBitmap("test_bitmap", 100, 100);
    ClearBitmap(testBitmap, ColorWhite());
    DrawPixelOnBitmap(testBitmap, ColorBlack(), 50, 50);
    SaveBitmap(testBitmap, "test_bitmap");
    FreeBitmap(testBitmap);
end;
procedure TIntegrationTests.TestScreenHeightIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    AssertEquals(600, ScreenHeight());
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestScreenWidthIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    AssertEquals(800, ScreenWidth());
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestTakeScreenshotIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    ClearWindow(testWindow, ColorWhite());
    DrawCircle(ColorBlack(), CircleAt(400, 300, 50));
    RefreshScreen();
    TakeScreenshot("test_screenshot");
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestTakeScreenshotOfWindowIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    ClearWindow(testWindow, ColorWhite());
    DrawCircle(ColorBlack(), CircleAt(400, 300, 50));
    RefreshScreen();
    TakeScreenshot(testWindow, "test_screenshot");
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestBitmapBoundingCircleIntegration;
begin
    testBitmap := CreateBitmap("test_bitmap", 100, 100);
    testPoint := PointAt(50.0, 50.0);
    boundingCircle := BitmapBoundingCircle(testBitmap, testPoint);
    AssertEquals(testPoint, CenterPoint(boundingCircle));
    AssertEquals(100, CircleRadius(boundingCircle));
    FreeBitmap(testBitmap);
end;
procedure TIntegrationTests.TestBitmapBoundingRectangleIntegration;
begin
    testBitmap := CreateBitmap("test_bitmap", 100, 100);
    boundingRect := BitmapBoundingRectangle(testBitmap);
    AssertEquals(0, boundingRect.X);
    AssertEquals(0, boundingRect.Y);
    AssertEquals(100, boundingRect.Width);
    AssertEquals(100, boundingRect.Height);
    FreeBitmap(testBitmap);
end;
procedure TIntegrationTests.TestBitmapBoundingRectangleAtLocationIntegration;
begin
    testBitmap := CreateBitmap("test_bitmap", 100, 100);
    boundingRect := BitmapBoundingRectangle(testBitmap, 50.0, 50.0);
    AssertEquals(50, boundingRect.X);
    AssertEquals(50, boundingRect.Y);
    AssertEquals(100, boundingRect.Width);
    AssertEquals(100, boundingRect.Height);
    FreeBitmap(testBitmap);
end;
procedure TIntegrationTests.TestBitmapCellCenterIntegration;
begin
    testBitmap := CreateBitmap("test_bitmap", 100, 100);
    center := BitmapCellCenter(testBitmap);
    AssertEquals(50.0, center.X);
    AssertEquals(50.0, center.Y);
    FreeBitmap(testBitmap);
end;
procedure TIntegrationTests.TestBitmapCellCircleIntegration;
begin
    testBitmap := CreateBitmap("test_bitmap", 100, 100);
    BitmapSetCellDetails(testBitmap, 50, 50, 2, 2, 4);
    circle := BitmapCellCircle(testBitmap, 50.0, 50.0);
    AssertEquals(50.0, circle.Center.X);
    AssertEquals(50.0, circle.Center.Y);
    AssertEquals(25, circle.Radius);
    FreeBitmap(testBitmap);
end;
procedure TIntegrationTests.TestBitmapCellCircleAtPointIntegration;
begin
    testBitmap := CreateBitmap("test_bitmap", 100, 100);
    BitmapSetCellDetails(testBitmap, 50, 50, 2, 2, 4);
    circle := BitmapCellCircle(testBitmap, PointAt(100, 100));
    AssertEquals(100.0, circle.Center.X);
    AssertEquals(100.0, circle.Center.Y);
    AssertEquals(25, circle.Radius);
    FreeBitmap(testBitmap);
end;
procedure TIntegrationTests.TestBitmapCellCircleAtPointWithScaleIntegration;
begin
    testBitmap := CreateBitmap("test_bitmap", 100, 100);
    BitmapSetCellDetails(testBitmap, 50, 50, 2, 2, 4);
    circle := BitmapCellCircle(testBitmap, PointAt(100.0, 100.0), 2.0);
    AssertEquals(100.0, circle.Center.X);
    AssertEquals(100.0, circle.Center.Y);
    AssertEquals(50, circle.Radius);
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
    offset := BitmapCellOffset(testBitmap, 5);
    AssertEquals(25.0, offset.X);
    AssertEquals(25.0, offset.Y);
    FreeBitmap(testBitmap);
end;
procedure TIntegrationTests.TestBitmapCellRectangleIntegration;
begin
    testBitmap := CreateBitmap("test_bitmap", 100, 100);
    BitmapSetCellDetails(testBitmap, 25, 25, 4, 4, 16);
    rect := BitmapCellRectangle(testBitmap);
    AssertEquals(0, rect.X);
    AssertEquals(0, rect.Y);
    AssertEquals(25, rect.Width);
    AssertEquals(25, rect.Height);
    FreeBitmap(testBitmap);
end;
procedure TIntegrationTests.TestBitmapCellRectangleAtPointIntegration;
begin
    testBitmap := CreateBitmap("test_bitmap", 100, 100);
    BitmapSetCellDetails(testBitmap, 25, 25, 4, 4, 16);
    rect := BitmapCellRectangle(testBitmap, PointAt(50.0, 50.0));
    AssertEquals(50.0, rect.X);
    AssertEquals(50.0, rect.Y);
    AssertEquals(25.0, rect.Width);
    AssertEquals(25.0, rect.Height);
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
    AssertEquals(50.0, testCenter.X);
    AssertEquals(50.0, testCenter.Y);
    FreeBitmap(testBitmap);
end;
procedure TIntegrationTests.TestBitmapFilenameIntegration;
begin
    testBitmap := CreateBitmap("test_bitmap", 100, 100);
    AssertEquals("", BitmapFilename(testBitmap));
    FreeBitmap(testBitmap);
end;
procedure TIntegrationTests.TestBitmapHeightIntegration;
begin
    testBitmap := CreateBitmap("test_bitmap", 100, 100);
    AssertEquals(100, BitmapHeight(testBitmap));
    FreeBitmap(testBitmap);
end;
procedure TIntegrationTests.TestBitmapHeightOfBitmapNamedIntegration;
begin
    testBitmap := CreateBitmap("bitmap_height", 100, 100);
    AssertEquals(100, BitmapHeight("bitmap_height"));
    FreeBitmap(testBitmap);
end;
procedure TIntegrationTests.TestBitmapNameIntegration;
begin
    testBitmap := CreateBitmap("bitmap_name", 100, 100);
    AssertEquals("bitmap_name", BitmapName(testBitmap));
    FreeBitmap(testBitmap);
end;
procedure TIntegrationTests.TestBitmapNamedIntegration;
begin
    testBitmap := CreateBitmap("test_bitmap", 100, 100);
    AssertNotNull(BitmapNamed("test_bitmap"));
    AssertNull(BitmapNamed("nonexistent_bitmap"));
    FreeBitmap(testBitmap);
end;
procedure TIntegrationTests.TestBitmapRectangleOfCellIntegration;
begin
    testBitmap := CreateBitmap("test_bitmap", 100, 100);
    BitmapSetCellDetails(testBitmap, 25, 25, 4, 4, 16);
    rect := BitmapRectangleOfCell(testBitmap, 5);
    AssertEquals(25.0, rect.X);
    AssertEquals(25.0, rect.Y);
    AssertEquals(25.0, rect.Width);
    AssertEquals(25.0, rect.Height);
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
    AssertEquals(100, BitmapWidth(testBitmap));
    FreeBitmap(testBitmap);
end;
procedure TIntegrationTests.TestBitmapWidthOfBitmapNamedIntegration;
begin
    testBitmap := CreateBitmap("bitmap_width", 100, 100);
    AssertEquals(100, BitmapWidth("bitmap_width"));
    FreeBitmap(testBitmap);
end;
procedure TIntegrationTests.TestClearBitmapIntegration;
begin
    testBitmap := CreateBitmap("test_bitmap", 100, 100);
    DrawPixelOnBitmap(testBitmap, ColorBlack(), 50, 50);
    AssertEquals(ColorBlack(), GetPixel(testBitmap, 50, 50));
    ClearBitmap(testBitmap, ColorWhite());
    AssertEquals(ColorWhite(), GetPixel(testBitmap, 50, 50));
    FreeBitmap(testBitmap);
end;
procedure TIntegrationTests.TestClearBitmapNamedIntegration;
begin
    testBitmap := CreateBitmap("bitmap_named", 100, 100);
    FillRectangleOnBitmap(testBitmap, ColorRed(), 0, 0, 100, 100);
    AssertEquals(ColorRed(), GetPixel(testBitmap, 50, 50));
    ClearBitmap("bitmap_named", ColorWhite());
    AssertEquals(ColorWhite(), GetPixel(testBitmap, 50, 50));
    FreeBitmap(testBitmap);
end;
procedure TIntegrationTests.TestCreateBitmapIntegration;
begin
    testBitmap := CreateBitmap("bitmap_name1", 100, 100);
    AssertNotNull(testBitmap);
    AssertEquals(100, BitmapWidth(testBitmap));
    AssertEquals(100, BitmapHeight(testBitmap));
    AssertEquals("bitmap_name1", BitmapName(testBitmap));
    FreeBitmap(testBitmap);
end;
procedure TIntegrationTests.TestDrawBitmapIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    testBitmap := CreateBitmap("test_bitmap", 100, 100);
    ClearWindow(testWindow, ColorWhite());
    FillRectangleOnBitmap(testBitmap, ColorRed(), 0, 0, 50, 50);
    DrawBitmap(testBitmap, 100.0, 100.0);
    RefreshScreen();
    AssertEquals(ColorRed(), GetPixel(testWindow, 125, 125));
    AssertEquals(ColorWhite(), GetPixel(testWindow, 175, 175));
    FreeBitmap(testBitmap);
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestDrawBitmapWithOptionsIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    testBitmap := CreateBitmap("test_bitmap", 100, 100);
    ClearWindow(testWindow, ColorWhite());
    FillRectangleOnBitmap(testBitmap, ColorRed(), 0, 0, 100, 100);
    DrawBitmap(testBitmap, 100.0, 100.0, OptionDefaults());
    RefreshScreen();
    AssertEquals(ColorRed(), GetPixel(testWindow, 125, 125));
    AssertEquals(ColorWhite(), GetPixel(testWindow, 50, 50));
    FreeBitmap(testBitmap);
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestDrawBitmapNamedIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    testBitmap := CreateBitmap("test_bitmap", 100, 100);
    ClearWindow(testWindow, ColorWhite());
    FillRectangleOnBitmap(testBitmap, ColorRed(), 0, 0, 100, 100);
    DrawBitmap("test_bitmap", 100.0, 100.0);
    RefreshScreen();
    AssertEquals(ColorRed(), GetPixel(testWindow, 125, 125));
    AssertEquals(ColorWhite(), GetPixel(testWindow, 50, 50));
    FreeBitmap(testBitmap);
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestDrawBitmapNamedWithOptionsIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    testBitmap := CreateBitmap("test_bitmap", 100, 100);
    ClearWindow(testWindow, ColorWhite());
    FillRectangleOnBitmap(testBitmap, ColorRed(), 0, 0, 100, 100);
    DrawBitmap("test_bitmap", 100.0, 100.0, OptionDefaults());
    RefreshScreen();
    AssertEquals(ColorRed(), GetPixel(testWindow, 125, 125));
    AssertEquals(ColorWhite(), GetPixel(testWindow, 50, 50));
    FreeBitmap(testBitmap);
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestDrawBitmapOnBitmapOnBitmapIntegration;
begin
    destBitmap := CreateBitmap("test_destination", 100, 100);
    sourceBitmap := CreateBitmap("test_source", 50, 50);
    ClearBitmap(destBitmap, ColorWhite());
    FillRectangleOnBitmap(sourceBitmap, ColorRed(), 0, 0, 50, 50);
    DrawBitmapOnBitmap(destBitmap, sourceBitmap, 25.0, 25.0);
    AssertEquals(ColorRed(), GetPixel(destBitmap, 50, 50));
    AssertEquals(ColorWhite(), GetPixel(destBitmap, 10, 10));
    FreeBitmap(destBitmap);
    FreeBitmap(sourceBitmap);
end;
procedure TIntegrationTests.TestDrawBitmapOnBitmapOnBitmapWithOptionsIntegration;
begin
    destBitmap := CreateBitmap("test_destination", 100, 100);
    sourceBitmap := CreateBitmap("test_source", 50, 50);
    ClearBitmap(destBitmap, ColorWhite());
    FillRectangleOnBitmap(sourceBitmap, ColorRed(), 0, 0, 50, 50);
    DrawBitmapOnBitmap(destBitmap, sourceBitmap, 25.0, 25.0, OptionDefaults());
    AssertEquals(ColorRed(), GetPixel(destBitmap, 50, 50));
    AssertEquals(ColorWhite(), GetPixel(destBitmap, 10, 10));
    FreeBitmap(destBitmap);
    FreeBitmap(sourceBitmap);
end;
procedure TIntegrationTests.TestDrawBitmapOnWindowIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    testBitmap := CreateBitmap("test_bitmap", 100, 100);
    ClearWindow(testWindow, ColorWhite());
    FillRectangleOnBitmap(testBitmap, ColorRed(), 0, 0, 100, 100);
    DrawBitmapOnWindow(testWindow, testBitmap, 100.0, 100.0);
    RefreshScreen();
    AssertEquals(ColorRed(), GetPixel(testWindow, 125, 125));
    AssertEquals(ColorWhite(), GetPixel(testWindow, 50, 50));
    FreeBitmap(testBitmap);
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestDrawBitmapOnWindowWithOptionsIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    testBitmap := CreateBitmap("test_bitmap", 100, 100);
    ClearWindow(testWindow, ColorWhite());
    FillRectangleOnBitmap(testBitmap, ColorRed(), 0, 0, 100, 100);
    DrawBitmapOnWindow(testWindow, testBitmap, 100.0, 100.0, OptionDefaults());
    RefreshScreen();
    AssertEquals(ColorRed(), GetPixel(testWindow, 125, 125));
    AssertEquals(ColorWhite(), GetPixel(testWindow, 50, 50));
    FreeBitmap(testBitmap);
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestFreeAllBitmapsIntegration;
begin
    bitmap1 := CreateBitmap("test_bitmap_1", 100, 100);
    bitmap2 := CreateBitmap("test_bitmap_2", 100, 100);
    AssertTrue(BitmapValid(bitmap1));
    AssertTrue(BitmapValid(bitmap2));
    FreeAllBitmaps();
    AssertFalse(BitmapValid(bitmap1));
    AssertFalse(BitmapValid(bitmap2));
end;
procedure TIntegrationTests.TestFreeBitmapIntegration;
begin
    testBitmap := CreateBitmap("test_bitmap", 100, 100);
    AssertTrue(BitmapValid(testBitmap));
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
    loadedBitmap := LoadBitmap("loaded_bitmap", "frog.png");
    AssertEquals(ColorBlack(), GetPixel(loadedBitmap, 50, 50));
    AssertEquals(ColorWhite(), GetPixel(loadedBitmap, 75, 75));
    FreeBitmap(loadedBitmap);
end;
procedure TIntegrationTests.TestPixelDrawnAtPointPtIntegration;
begin
    testBitmap := CreateBitmap("test_bitmap", 100, 100);
    ClearBitmap(testBitmap, ColorWhite());
    DrawPixelOnBitmap(testBitmap, ColorBlack(), PointAt(50.0, 50.0));
    AssertEquals(ColorBlack(), GetPixel(testBitmap, 50, 50));
    AssertEquals(ColorWhite(), GetPixel(testBitmap, 75, 75));
    FreeBitmap(testBitmap);
end;
procedure TIntegrationTests.TestPixelDrawnAtPointIntegration;
begin
    testBitmap := CreateBitmap("test_bitmap", 100, 100);
    ClearBitmap(testBitmap, ColorWhite());
    DrawPixelOnBitmap(testBitmap, ColorBlack(), 50.0, 50.0);
    AssertEquals(ColorBlack(), GetPixel(testBitmap, 50, 50));
    AssertEquals(ColorWhite(), GetPixel(testBitmap, 75, 75));
    FreeBitmap(testBitmap);
end;
procedure TIntegrationTests.TestPixelDrawnAtPointInCellPtIntegration;
begin
    testBitmap := CreateBitmap("test_bitmap", 100, 100);
    ClearBitmap(testBitmap, ColorWhite());
    DrawPixelOnBitmap(testBitmap, ColorBlack(), PointAt(50.0, 50.0));
    BitmapSetCellDetails(testBitmap, 100, 100, 1, 1, 1);
    AssertEquals(ColorBlack(), GetPixel(testBitmap, 50, 50));
    AssertEquals(ColorWhite(), GetPixel(testBitmap, 75, 50));
    FreeBitmap(testBitmap);
end;
procedure TIntegrationTests.TestPixelDrawnAtPointInCellIntegration;
begin
    testBitmap := CreateBitmap("test_bitmap", 100, 100);
    ClearBitmap(testBitmap, ColorWhite());
    DrawPixelOnBitmap(testBitmap, ColorBlack(), PointAt(50.0, 50.0));
    BitmapSetCellDetails(testBitmap, 100, 100, 1, 1, 1);
    AssertEquals(ColorBlack(), GetPixel(testBitmap, 50, 50));
    AssertEquals(ColorWhite(), GetPixel(testBitmap, 75, 75));
    FreeBitmap(testBitmap);
end;
procedure TIntegrationTests.TestSetupCollisionMaskIntegration;
begin
    testBitmap := CreateBitmap("test_bitmap", 100, 100);
    ClearBitmap(testBitmap, ColorWhite());
    SetupCollisionMask(testBitmap);
    AssertEquals(ColorBlack(), GetPixel(testBitmap, 50, 50));
    FreeBitmap(testBitmap);
end;
procedure TIntegrationTests.TestDrawLineRecordIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    ClearWindow(testWindow, ColorWhite());
    DrawLine(ColorBlack(), LineFrom(PointAt(100.0, 100.0), PointAt(200.0, 200.0)));
    RefreshScreen();
    AssertEquals(ColorBlack(), GetPixel(testWindow, 100, 100));
    AssertEquals(ColorWhite(), GetPixel(testWindow, 99, 99));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestDrawLineRecordWithOptionsIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    ClearWindow(testWindow, ColorWhite());
    DrawLine(ColorBlack(), LineFrom(PointAt(100.0, 100.0), PointAt(200.0, 200.0)), OptionLineWidth(3, OptionDefaults()));
    RefreshScreen();
    AssertEquals(ColorBlack(), GetPixel(testWindow, 100, 100));
    AssertEquals(ColorWhite(), GetPixel(testWindow, 99, 99));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestDrawLinePointToPointIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    ClearWindow(testWindow, ColorWhite());
    DrawLine(ColorBlack(), PointAt(100.0, 100.0), PointAt(200.0, 200.0));
    RefreshScreen();
    AssertEquals(ColorBlack(), GetPixel(testWindow, 100, 100));
    AssertEquals(ColorWhite(), GetPixel(testWindow, 99, 99));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestDrawLinePointToPointWithOptionsIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    ClearWindow(testWindow, ColorWhite());
    DrawLine(ColorBlack(), PointAt(100.0, 100.0), PointAt(200.0, 200.0), OptionDefaults());
    RefreshScreen();
    AssertEquals(ColorBlack(), GetPixel(testWindow, 100, 100));
    AssertEquals(ColorWhite(), GetPixel(testWindow, 99, 99));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestDrawLineIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    ClearWindow(testWindow, ColorWhite());
    DrawLine(ColorBlack(), 100.0, 100.0, 200.0, 200.0);
    RefreshScreen();
    AssertEquals(ColorBlack(), GetPixel(testWindow, 100, 100));
    AssertEquals(ColorWhite(), GetPixel(testWindow, 99, 99));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestDrawLineWithOptionsIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    ClearWindow(testWindow, ColorWhite());
    DrawLine(ColorBlack(), 100.0, 100.0, 200.0, 200.0, OptionDefaults());
    RefreshScreen();
    AssertEquals(ColorBlack(), GetPixel(testWindow, 100, 100));
    AssertEquals(ColorWhite(), GetPixel(testWindow, 99, 99));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestDrawLineOnBitmapRecordIntegration;
begin
    testBitmap := CreateBitmap("test_bitmap", 100, 100);
    ClearBitmap(testBitmap, ColorWhite());
    DrawLineOnBitmap(testBitmap, ColorBlack(), LineFrom(PointAt(10.0, 10.0), PointAt(90.0, 90.0)));
    AssertEquals(ColorBlack(), GetPixel(testBitmap, 50, 50));
    AssertEquals(ColorWhite(), GetPixel(testBitmap, 95, 95));
    FreeBitmap(testBitmap);
end;
procedure TIntegrationTests.TestDrawLineOnBitmapRecordWithOptionsIntegration;
begin
    testBitmap := CreateBitmap("test_bitmap", 100, 100);
    ClearBitmap(testBitmap, ColorWhite());
    DrawLineOnBitmap(testBitmap, ColorBlack(), LineFrom(PointAt(10.0, 10.0), PointAt(90.0, 90.0)), OptionDefaults());
    AssertEquals(ColorBlack(), GetPixel(testBitmap, 50, 50));
    AssertEquals(ColorWhite(), GetPixel(testBitmap, 95, 50));
    FreeBitmap(testBitmap);
end;
procedure TIntegrationTests.TestDrawLineOnBitmapPointToPointIntegration;
begin
    testBitmap := CreateBitmap("test_bitmap", 100, 100);
    ClearBitmap(testBitmap, ColorWhite());
    DrawLineOnBitmap(testBitmap, ColorBlack(), PointAt(10.0, 10.0), PointAt(90.0, 90.0));
    AssertEquals(ColorBlack(), GetPixel(testBitmap, 50, 50));
    AssertEquals(ColorWhite(), GetPixel(testBitmap, 0, 0));
    FreeBitmap(testBitmap);
end;
procedure TIntegrationTests.TestDrawLineOnBitmapPointToPointWithOptionsIntegration;
begin
    testBitmap := CreateBitmap("test_bitmap", 100, 100);
    ClearBitmap(testBitmap, ColorWhite());
    DrawLineOnBitmap(testBitmap, ColorBlack(), PointAt(10.0, 10.0), PointAt(90.0, 90.0), OptionDefaults());
    AssertEquals(ColorBlack(), GetPixel(testBitmap, 10, 10));
    AssertEquals(ColorBlack(), GetPixel(testBitmap, 90, 90));
    AssertEquals(ColorWhite(), GetPixel(testBitmap, 5, 5));
    FreeBitmap(testBitmap);
end;
procedure TIntegrationTests.TestDrawLineOnBitmapIntegration;
begin
    testBitmap := CreateBitmap("test_bitmap", 100, 100);
    ClearBitmap(testBitmap, ColorWhite());
    DrawLineOnBitmap(testBitmap, ColorBlack(), 10.0, 10.0, 90.0, 90.0);
    AssertEquals(ColorBlack(), GetPixel(testBitmap, 50, 50));
    AssertEquals(ColorWhite(), GetPixel(testBitmap, 95, 50));
    FreeBitmap(testBitmap);
end;
procedure TIntegrationTests.TestDrawLineOnBitmapWithOptionsIntegration;
begin
    testBitmap := CreateBitmap("test_bitmap", 100, 100);
    ClearBitmap(testBitmap, ColorWhite());
    DrawLineOnBitmap(testBitmap, ColorBlack(), 10.0, 10.0, 90.0, 90.0, OptionDefaults());
    AssertEquals(ColorBlack(), GetPixel(testBitmap, 50, 50));
    AssertEquals(ColorWhite(), GetPixel(testBitmap, 5, 5));
    FreeBitmap(testBitmap);
end;
procedure TIntegrationTests.TestDrawLineOnWindowRecordIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    ClearWindow(testWindow, ColorWhite());
    LineFrom(PointAt(100.0, 100.0), PointAt(150.0, 150.0));
    RefreshScreen();
    AssertEquals(ColorBlack(), GetPixel(testWindow, 100, 100));
    AssertEquals(ColorWhite(), GetPixel(testWindow, 99, 99));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestDrawLineOnWindowRecordWithOptionsIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    ClearWindow(testWindow, ColorWhite());
    OptionDefaults();
    RefreshScreen();
    AssertEquals(ColorBlack(), GetPixel(testWindow, 100, 100));
    AssertEquals(ColorWhite(), GetPixel(testWindow, 99, 99));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestDrawLineOnWindowPointToPointIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    ClearWindow(testWindow, ColorWhite());
    DrawLineOnWindow(testWindow, ColorBlack(), PointAt(100.0, 100.0), PointAt(200.0, 200.0));
    RefreshScreen();
    AssertEquals(ColorBlack(), GetPixel(testWindow, 100, 100));
    AssertEquals(ColorWhite(), GetPixel(testWindow, 99, 99));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestDrawLineOnWindowPointToPointWithOptionsIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    ClearWindow(testWindow, ColorWhite());
    OptionDefaults();
    RefreshScreen();
    AssertEquals(ColorBlack(), GetPixel(testWindow, 100, 100));
    AssertEquals(ColorWhite(), GetPixel(testWindow, 99, 99));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestDrawLineOnWindowIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    ClearWindow(testWindow, ColorWhite());
    DrawLineOnWindow(testWindow, ColorBlack(), 100.0, 100.0, 200.0, 200.0);
    RefreshScreen();
    AssertEquals(ColorBlack(), GetPixel(testWindow, 100, 100));
    AssertEquals(ColorWhite(), GetPixel(testWindow, 99, 99));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestDrawLineOnWindowWithOptionsIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    ClearWindow(testWindow, ColorWhite());
    DrawLineOnWindow(testWindow, ColorBlack(), 100.0, 100.0, 200.0, 200.0, OptionDefaults());
    RefreshScreen();
    AssertEquals(ColorBlack(), GetPixel(testWindow, 100, 100));
    AssertEquals(ColorWhite(), GetPixel(testWindow, 99, 99));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestDrawPixelAtPointIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    ClearWindow(testWindow, ColorWhite());
    DrawPixel(ColorBlack(), PointAt(100.0, 100.0));
    RefreshScreen();
    AssertEquals(ColorBlack(), GetPixel(testWindow, 100, 100));
    AssertEquals(ColorWhite(), GetPixel(testWindow, 99, 99));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestDrawPixelAtPointWithOptionsIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    ClearWindow(testWindow, ColorWhite());
    DrawPixel(ColorBlack(), PointAt(100.0, 100.0), OptionDefaults());
    RefreshScreen();
    AssertEquals(ColorBlack(), GetPixel(testWindow, 100, 100));
    AssertEquals(ColorWhite(), GetPixel(testWindow, 99, 99));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestDrawPixelIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    ClearWindow(testWindow, ColorWhite());
    DrawPixel(ColorBlack(), 100.0, 100.0);
    RefreshScreen();
    AssertEquals(ColorBlack(), GetPixel(testWindow, 100, 100));
    AssertEquals(ColorWhite(), GetPixel(testWindow, 99, 99));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestDrawPixelWithOptionsIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    ClearWindow(testWindow, ColorWhite());
    DrawPixel(ColorBlack(), 100.0, 100.0, OptionDefaults());
    RefreshScreen();
    AssertEquals(ColorBlack(), GetPixel(testWindow, 100, 100));
    AssertEquals(ColorWhite(), GetPixel(testWindow, 99, 99));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestDrawPixelOnBitmapAtPointIntegration;
begin
    testBitmap := CreateBitmap("test_bitmap", 100, 100);
    ClearBitmap(testBitmap, ColorWhite());
    DrawPixelOnBitmap(testBitmap, ColorBlack(), PointAt(50.0, 50.0));
    AssertEquals(ColorBlack(), GetPixel(testBitmap, 50, 50));
    AssertEquals(ColorWhite(), GetPixel(testBitmap, 0, 0));
    FreeBitmap(testBitmap);
end;
procedure TIntegrationTests.TestDrawPixelOnBitmapAtPointWithOptionsIntegration;
begin
    testBitmap := CreateBitmap("test_bitmap", 100, 100);
    ClearBitmap(testBitmap, ColorWhite());
    DrawPixelOnBitmap(testBitmap, ColorBlack(), PointAt(50.0, 50.0), OptionDefaults());
    AssertEquals(ColorBlack(), GetPixel(testBitmap, 50, 50));
    AssertEquals(ColorWhite(), GetPixel(testBitmap, 0, 0));
    FreeBitmap(testBitmap);
end;
procedure TIntegrationTests.TestDrawPixelOnBitmapIntegration;
begin
    testBitmap := CreateBitmap("test_bitmap", 100, 100);
    ClearBitmap(testBitmap, ColorWhite());
    DrawPixelOnBitmap(testBitmap, ColorBlack(), 50.0, 50.0);
    AssertEquals(ColorBlack(), GetPixel(testBitmap, 50, 50));
    AssertEquals(ColorWhite(), GetPixel(testBitmap, 51, 50));
    FreeBitmap(testBitmap);
end;
procedure TIntegrationTests.TestDrawPixelOnBitmapWithOptionsIntegration;
begin
    testBitmap := CreateBitmap("test_bitmap", 100, 100);
    ClearBitmap(testBitmap, ColorWhite());
    DrawPixelOnBitmap(testBitmap, ColorBlack(), 50.0, 50.0, OptionDefaults());
    AssertEquals(ColorBlack(), GetPixel(testBitmap, 50, 50));
    AssertEquals(ColorWhite(), GetPixel(testBitmap, 51, 50));
    FreeBitmap(testBitmap);
end;
procedure TIntegrationTests.TestDrawPixelOnWindowAtPointIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    ClearWindow(testWindow, ColorWhite());
    DrawPixelOnWindow(testWindow, ColorBlack(), PointAt(100.0, 100.0));
    RefreshScreen();
    AssertEquals(ColorBlack(), GetPixel(testWindow, 100, 100));
    AssertEquals(ColorWhite(), GetPixel(testWindow, 99, 99));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestDrawPixelOnWindowAtPointWithOptionsIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    ClearWindow(testWindow, ColorWhite());
    DrawPixelOnWindow(testWindow, ColorBlack(), PointAt(100.0, 100.0), OptionDefaults());
    RefreshScreen();
    AssertEquals(ColorBlack(), GetPixel(testWindow, 100, 100));
    AssertEquals(ColorWhite(), GetPixel(testWindow, 99, 99));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestDrawPixelOnWindowIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    ClearWindow(testWindow, ColorWhite());
    DrawPixelOnWindow(testWindow, ColorBlack(), 100.0, 100.0);
    RefreshScreen();
    AssertEquals(ColorBlack(), GetPixel(testWindow, 100, 100));
    AssertEquals(ColorWhite(), GetPixel(testWindow, 99, 99));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestDrawPixelOnWindowWithOptionsIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    ClearWindow(testWindow, ColorWhite());
    DrawPixelOnWindow(testWindow, ColorBlack(), 100.0, 100.0, OptionDefaults());
    RefreshScreen();
    AssertEquals(ColorBlack(), GetPixel(testWindow, 100, 100));
    AssertEquals(ColorWhite(), GetPixel(testWindow, 99, 99));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestGetPixelFromBitmapAtPointIntegration;
begin
    testBitmap := CreateBitmap("test_bitmap", 100, 100);
    ClearBitmap(testBitmap, ColorWhite());
    DrawPixelOnBitmap(testBitmap, ColorBlack(), PointAt(50.0, 50.0));
    AssertEquals(ColorBlack(), GetPixel(testBitmap, 50, 50));
    AssertEquals(ColorWhite(), GetPixel(testBitmap, 49, 49));
    FreeBitmap(testBitmap);
end;
procedure TIntegrationTests.TestGetPixelFromBitmapIntegration;
begin
    testBitmap := CreateBitmap("test_bitmap", 100, 100);
    ClearBitmap(testBitmap, ColorWhite());
    DrawPixelOnBitmap(testBitmap, ColorBlack(), 50.0, 50.0);
    AssertEquals(ColorBlack(), GetPixel(testBitmap, 50, 50));
    AssertEquals(ColorWhite(), GetPixel(testBitmap, 49, 49));
    FreeBitmap(testBitmap);
end;
procedure TIntegrationTests.TestGetPixelAtPointIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    ClearWindow(testWindow, ColorWhite());
    DrawPixel(ColorBlack(), PointAt(100.0, 100.0));
    RefreshScreen();
    AssertEquals(ColorBlack(), GetPixel(testWindow, 100, 100));
    AssertEquals(ColorWhite(), GetPixel(testWindow, 99, 99));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestGetPixelIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    ClearWindow(testWindow, ColorWhite());
    DrawPixel(ColorBlack(), 100.0, 100.0);
    RefreshScreen();
    AssertEquals(ColorBlack(), GetPixel(testWindow, 100, 100));
    AssertEquals(ColorWhite(), GetPixel(testWindow, 99, 99));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestGetPixelFromWindowAtPointIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    ClearWindow(testWindow, ColorWhite());
    DrawPixel(ColorBlack(), PointAt(100.0, 100.0));
    RefreshScreen();
    AssertEquals(ColorBlack(), GetPixel(testWindow, 100, 100));
    AssertEquals(ColorWhite(), GetPixel(testWindow, 99, 99));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestGetPixelFromWindowIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    ClearWindow(testWindow, ColorWhite());
    DrawPixel(ColorBlack(), 100.0, 100.0);
    RefreshScreen();
    AssertEquals(ColorBlack(), GetPixel(testWindow, 100, 100));
    AssertEquals(ColorWhite(), GetPixel(testWindow, 99, 99));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestGetPixelFromWindowAtPointFromWindowIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    ClearWindow(testWindow, ColorWhite());
    DrawPixel(ColorBlack(), PointAt(100.0, 100.0));
    RefreshScreen();
    AssertEquals(ColorBlack(), GetPixelFromWindow(testWindow, 100, 100));
    AssertEquals(ColorWhite(), GetPixelFromWindow(testWindow, 99, 99));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestGetPixelFromWindowFromWindowIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    ClearWindow(testWindow, ColorWhite());
    DrawPixel(ColorBlack(), 100.0, 100.0);
    RefreshScreen();
    AssertEquals(ColorBlack(), GetPixelFromWindow(testWindow, 100, 100));
    AssertEquals(ColorWhite(), GetPixelFromWindow(testWindow, 99, 99));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestDrawQuadIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    ClearWindow(testWindow, ColorWhite());
    quad := QuadFrom(PointAt(100.0, 100.0), PointAt(200.0, 100.0), PointAt(100.0, 200.0), PointAt(200.0, 200.0));
    DrawQuad(ColorBlack(), quad);
    RefreshScreen();
    AssertEquals(ColorBlack(), GetPixel(testWindow, 100, 100));
    AssertEquals(ColorWhite(), GetPixel(testWindow, 150, 150));
    AssertEquals(ColorWhite(), GetPixel(testWindow, 250, 250));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestDrawQuadWithOptionsIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    ClearWindow(testWindow, ColorWhite());
    quad := QuadFrom(PointAt(100.0, 100.0), PointAt(200.0, 100.0), PointAt(100.0, 200.0), PointAt(200.0, 200.0));
    DrawQuad(ColorBlack(), quad, OptionDefaults());
    RefreshScreen();
    AssertEquals(ColorBlack(), GetPixel(testWindow, 100, 100));
    AssertEquals(ColorWhite(), GetPixel(testWindow, 150, 150));
    AssertEquals(ColorWhite(), GetPixel(testWindow, 250, 250));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestDrawQuadOnBitmapIntegration;
begin
    testBitmap := CreateBitmap("test_bitmap", 100, 100);
    ClearBitmap(testBitmap, ColorWhite());
    quad := QuadFrom(PointAt(10.0, 10.0), PointAt(90.0, 10.0), PointAt(10.0, 90.0), PointAt(90.0, 90.0));
    DrawQuadOnBitmap(testBitmap, ColorBlack(), quad);
    AssertEquals(ColorBlack(), GetPixel(testBitmap, 10, 10));
    AssertEquals(ColorWhite(), GetPixel(testBitmap, 50, 50));
    AssertEquals(ColorWhite(), GetPixel(testBitmap, 5, 5));
    FreeBitmap(testBitmap);
end;
procedure TIntegrationTests.TestDrawQuadOnBitmapWithOptionsIntegration;
begin
    testBitmap := CreateBitmap("test_bitmap", 100, 100);
    ClearBitmap(testBitmap, ColorWhite());
    quad := QuadFrom(PointAt(10.0, 10.0), PointAt(90.0, 10.0), PointAt(90.0, 90.0), PointAt(10.0, 90.0));
    DrawQuadOnBitmap(testBitmap, ColorBlack(), quad, OptionDefaults());
    AssertEquals(ColorBlack(), GetPixel(testBitmap, 10, 10));
    AssertEquals(ColorBlack(), GetPixel(testBitmap, 50, 50));
    AssertEquals(ColorWhite(), GetPixel(testBitmap, 5, 5));
    FreeBitmap(testBitmap);
end;
procedure TIntegrationTests.TestDrawQuadOnWindowIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    ClearWindow(testWindow, ColorWhite());
    quad := QuadFrom(PointAt(100.0, 100.0), PointAt(200.0, 100.0), PointAt(100.0, 200.0), PointAt(200.0, 200.0));
    DrawQuadOnWindow(testWindow, ColorBlack(), quad);
    RefreshScreen();
    AssertEquals(ColorBlack(), GetPixel(testWindow, 100, 100));
    AssertEquals(ColorWhite(), GetPixel(testWindow, 150, 150));
    AssertEquals(ColorWhite(), GetPixel(testWindow, 250, 250));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestDrawQuadOnWindowWithOptionsIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    ClearWindow(testWindow, ColorWhite());
    quad := QuadFrom(PointAt(100.0, 100.0), PointAt(200.0, 100.0), PointAt(100.0, 200.0), PointAt(200.0, 200.0));
    DrawQuadOnWindow(testWindow, ColorBlack(), quad, OptionDefaults());
    RefreshScreen();
    AssertEquals(ColorBlack(), GetPixel(testWindow, 100, 100));
    AssertEquals(ColorWhite(), GetPixel(testWindow, 150, 150));
    AssertEquals(ColorWhite(), GetPixel(testWindow, 250, 250));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestDrawRectangleRecordIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    ClearWindow(testWindow, ColorWhite());
    rectangle := RectangleFrom(100.0, 100.0, 200.0, 150.0);
    DrawRectangle(ColorBlack(), rectangle);
    RefreshScreen();
    AssertEquals(ColorBlack(), GetPixel(testWindow, 100, 100));
    AssertEquals(ColorWhite(), GetPixel(testWindow, 150, 125));
    AssertEquals(ColorWhite(), GetPixel(testWindow, 301, 251));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestDrawRectangleRecordWithOptionsIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    ClearWindow(testWindow, ColorWhite());
    rectangle := RectangleFrom(100.0, 100.0, 200.0, 150.0);
    DrawRectangle(ColorBlack(), rectangle, OptionDefaults());
    RefreshScreen();
    AssertEquals(ColorBlack(), GetPixel(testWindow, 100, 100));
    AssertEquals(ColorWhite(), GetPixel(testWindow, 150, 125));
    AssertEquals(ColorWhite(), GetPixel(testWindow, 350, 300));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestDrawRectangleIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    ClearWindow(testWindow, ColorWhite());
    DrawRectangle(ColorBlack(), 100.0, 100.0, 200.0, 150.0);
    RefreshScreen();
    AssertEquals(ColorBlack(), GetPixel(testWindow, 100, 100));
    AssertEquals(ColorWhite(), GetPixel(testWindow, 301, 251));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestDrawRectangleWithOptionsIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    ClearWindow(testWindow, ColorWhite());
    DrawRectangle(ColorBlack(), 100.0, 100.0, 200.0, 150.0, OptionLineWidth(3, OptionDefaults()));
    RefreshScreen();
    AssertEquals(ColorBlack(), GetPixel(testWindow, 100, 100));
    AssertEquals(ColorBlack(), GetPixel(testWindow, 101, 100));
    AssertEquals(ColorWhite(), GetPixel(testWindow, 150, 125));
    AssertEquals(ColorWhite(), GetPixel(testWindow, 301, 251));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestDrawRectangleOnBitmapRecordIntegration;
begin
    testBitmap := CreateBitmap("test_bitmap", 100, 100);
    ClearBitmap(testBitmap, ColorWhite());
    rectangle := RectangleFrom(50.0, 50.0, 20.0, 30.0);
    DrawRectangleOnBitmap(testBitmap, ColorBlack(), rectangle);
    AssertEquals(ColorBlack(), GetPixel(testBitmap, 50, 50));
    AssertEquals(ColorWhite(), GetPixel(testBitmap, 80, 90));
    FreeBitmap(testBitmap);
end;
procedure TIntegrationTests.TestDrawRectangleOnBitmapRecordWithOptionsIntegration;
begin
    testBitmap := CreateBitmap("test_bitmap", 100, 100);
    ClearBitmap(testBitmap, ColorWhite());
    rectangle := RectangleFrom(50.0, 50.0, 20.0, 20.0);
    DrawRectangleOnBitmap(testBitmap, ColorBlack(), rectangle, OptionDefaults());
    AssertEquals(ColorBlack(), GetPixel(testBitmap, 50, 50));
    AssertEquals(ColorWhite(), GetPixel(testBitmap, 75, 75));
    FreeBitmap(testBitmap);
end;
procedure TIntegrationTests.TestDrawRectangleOnBitmapIntegration;
begin
    testBitmap := CreateBitmap("test_bitmap", 100, 100);
    ClearBitmap(testBitmap, ColorWhite());
    DrawRectangleOnBitmap(testBitmap, ColorBlack(), 50.0, 50.0, 20.0, 20.0);
    AssertEquals(ColorBlack(), GetPixel(testBitmap, 50, 50));
    AssertEquals(ColorWhite(), GetPixel(testBitmap, 75, 75));
    FreeBitmap(testBitmap);
end;
procedure TIntegrationTests.TestDrawRectangleOnBitmapWithOptionsIntegration;
begin
    testBitmap := CreateBitmap("test_bitmap", 100, 100);
    ClearBitmap(testBitmap, ColorWhite());
    DrawRectangleOnBitmap(testBitmap, ColorBlack(), 50.0, 50.0, 20.0, 20.0, OptionDefaults());
    AssertEquals(ColorBlack(), GetPixel(testBitmap, 50, 50));
    AssertEquals(ColorWhite(), GetPixel(testBitmap, 75, 75));
    FreeBitmap(testBitmap);
end;
procedure TIntegrationTests.TestDrawRectangleOnWindowRecordIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    ClearWindow(testWindow, ColorWhite());
    rectangle := RectangleFrom(100.0, 100.0, 50.0, 50.0);
    DrawRectangleOnWindow(testWindow, ColorBlack(), rectangle);
    RefreshScreen();
    AssertEquals(ColorBlack(), GetPixel(testWindow, 100, 100));
    AssertEquals(ColorWhite(), GetPixel(testWindow, 125, 125));
    AssertEquals(ColorWhite(), GetPixel(testWindow, 200, 200));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestDrawRectangleOnWindowRecordWithOptionsIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    ClearWindow(testWindow, ColorWhite());
    rectangle := RectangleFrom(100.0, 100.0, 50.0, 50.0);
    DrawRectangleOnWindow(testWindow, ColorBlack(), rectangle, OptionDefaults());
    RefreshScreen();
    AssertEquals(ColorBlack(), GetPixel(testWindow, 100, 100));
    AssertEquals(ColorWhite(), GetPixel(testWindow, 125, 125));
    AssertEquals(ColorWhite(), GetPixel(testWindow, 175, 175));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestDrawRectangleOnWindowIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    ClearWindow(testWindow, ColorWhite());
    DrawRectangleOnWindow(testWindow, ColorBlack(), 100.0, 100.0, 50.0, 50.0);
    RefreshScreen();
    AssertEquals(ColorBlack(), GetPixel(testWindow, 100, 100));
    AssertEquals(ColorWhite(), GetPixel(testWindow, 200, 200));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestDrawRectangleOnWindowWithOptionsIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    ClearWindow(testWindow, ColorWhite());
    DrawRectangleOnWindow(testWindow, ColorBlack(), 100.0, 100.0, 50.0, 50.0, OptionDefaults());
    RefreshScreen();
    AssertEquals(ColorBlack(), GetPixel(testWindow, 100, 100));
    AssertEquals(ColorWhite(), GetPixel(testWindow, 200, 200));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestFillQuadIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    ClearWindow(testWindow, ColorWhite());
    quad := QuadFrom(PointAt(100.0, 100.0), PointAt(300.0, 100.0), PointAt(100.0, 300.0), PointAt(300.0, 300.0));
    FillQuad(ColorBlack(), quad);
    RefreshScreen();
    AssertEquals(ColorBlack(), GetPixel(testWindow, 200, 200));
    AssertEquals(ColorWhite(), GetPixel(testWindow, 400, 400));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestFillQuadWithOptionsIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    ClearWindow(testWindow, ColorWhite());
    quad := QuadFrom(PointAt(100.0, 100.0), PointAt(300.0, 100.0), PointAt(100.0, 300.0), PointAt(300.0, 300.0));
    FillQuad(ColorBlack(), quad, OptionDefaults());
    RefreshScreen();
    AssertEquals(ColorBlack(), GetPixel(testWindow, 200, 200));
    AssertEquals(ColorWhite(), GetPixel(testWindow, 400, 400));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestFillQuadOnBitmapIntegration;
begin
    testBitmap := CreateBitmap("test_bitmap", 100, 100);
    ClearBitmap(testBitmap, ColorWhite());
    quad := QuadFrom(PointAt(10.0, 10.0), PointAt(90.0, 10.0), PointAt(10.0, 90.0), PointAt(90.0, 90.0));
    FillQuadOnBitmap(testBitmap, ColorBlack(), quad);
    AssertEquals(ColorBlack(), GetPixel(testBitmap, 50, 50));
    AssertEquals(ColorWhite(), GetPixel(testBitmap, 0, 0));
    FreeBitmap(testBitmap);
end;
procedure TIntegrationTests.TestFillQuadOnBitmapWithOptionsIntegration;
begin
    testBitmap := CreateBitmap("test_bitmap", 100, 100);
    ClearBitmap(testBitmap, ColorWhite());
    quad := QuadFrom(PointAt(10.0, 10.0), PointAt(90.0, 10.0), PointAt(90.0, 90.0), PointAt(10.0, 90.0));
    FillQuadOnBitmap(testBitmap, ColorBlack(), quad, OptionDefaults());
    AssertEquals(ColorBlack(), GetPixel(testBitmap, 50, 50));
    AssertEquals(ColorWhite(), GetPixel(testBitmap, 95, 50));
    FreeBitmap(testBitmap);
end;
procedure TIntegrationTests.TestFillQuadOnWindowIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    ClearWindow(testWindow, ColorWhite());
    quad := QuadFrom(PointAt(100.0, 100.0), PointAt(200.0, 100.0), PointAt(100.0, 200.0), PointAt(200.0, 200.0));
    FillQuadOnWindow(testWindow, ColorBlack(), quad);
    RefreshScreen();
    AssertEquals(ColorBlack(), GetPixel(testWindow, 150, 150));
    AssertEquals(ColorWhite(), GetPixel(testWindow, 250, 250));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestFillQuadOnWindowWithOptionsIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    ClearWindow(testWindow, ColorWhite());
    quad := QuadFrom(PointAt(100.0, 100.0), PointAt(200.0, 100.0), PointAt(200.0, 200.0), PointAt(100.0, 200.0));
    FillQuadOnWindow(testWindow, ColorBlack(), quad, OptionDefaults());
    RefreshScreen();
    AssertEquals(ColorBlack(), GetPixel(testWindow, 150, 150));
    AssertEquals(ColorWhite(), GetPixel(testWindow, 250, 150));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestFillRectangleRecordIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    ClearWindow(testWindow, ColorWhite());
    rectangle := RectangleFrom(100.0, 100.0, 200.0, 150.0);
    FillRectangle(ColorBlack(), rectangle);
    RefreshScreen();
    AssertEquals(ColorBlack(), GetPixel(testWindow, 150, 125));
    AssertEquals(ColorWhite(), GetPixel(testWindow, 350, 275));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestFillRectangleRecordWithOptionsIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    ClearWindow(testWindow, ColorWhite());
    rectangle := RectangleFrom(100.0, 100.0, 200.0, 150.0);
    FillRectangle(ColorBlack(), rectangle, OptionDefaults());
    RefreshScreen();
    AssertEquals(ColorBlack(), GetPixel(testWindow, 150, 125));
    AssertEquals(ColorWhite(), GetPixel(testWindow, 350, 275));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestFillRectangleIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    ClearWindow(testWindow, ColorWhite());
    FillRectangle(ColorBlack(), 100.0, 100.0, 200.0, 150.0);
    RefreshScreen();
    AssertEquals(ColorBlack(), GetPixel(testWindow, 150, 125));
    AssertEquals(ColorWhite(), GetPixel(testWindow, 301, 251));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestFillRectangleWithOptionsIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    ClearWindow(testWindow, ColorWhite());
    FillRectangle(ColorBlack(), 100.0, 100.0, 200.0, 150.0, OptionDefaults());
    RefreshScreen();
    AssertEquals(ColorBlack(), GetPixel(testWindow, 150, 125));
    AssertEquals(ColorWhite(), GetPixel(testWindow, 301, 251));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestFillRectangleOnBitmapRecordIntegration;
begin
    testBitmap := CreateBitmap("test_bitmap", 100, 100);
    ClearBitmap(testBitmap, ColorWhite());
    rectangle := RectangleFrom(25.0, 25.0, 50.0, 50.0);
    FillRectangleOnBitmap(testBitmap, ColorBlack(), rectangle);
    AssertEquals(ColorBlack(), GetPixel(testBitmap, 50, 50));
    AssertEquals(ColorWhite(), GetPixel(testBitmap, 10, 10));
    FreeBitmap(testBitmap);
end;
procedure TIntegrationTests.TestFillRectangleOnBitmapRecordWithOptionsIntegration;
begin
    testBitmap := CreateBitmap("test_bitmap", 100, 100);
    ClearBitmap(testBitmap, ColorWhite());
    rectangle := RectangleFrom(25.0, 25.0, 50.0, 50.0);
    FillRectangleOnBitmap(testBitmap, ColorBlack(), rectangle, OptionDefaults());
    AssertEquals(ColorBlack(), GetPixel(testBitmap, 50, 50));
    AssertEquals(ColorWhite(), GetPixel(testBitmap, 10, 10));
    FreeBitmap(testBitmap);
end;
procedure TIntegrationTests.TestFillRectangleOnBitmapIntegration;
begin
    testBitmap := CreateBitmap("test_bitmap", 100, 100);
    ClearBitmap(testBitmap, ColorWhite());
    FillRectangleOnBitmap(testBitmap, ColorBlack(), 25.0, 25.0, 50.0, 50.0);
    AssertEquals(ColorBlack(), GetPixel(testBitmap, 50, 50));
    AssertEquals(ColorWhite(), GetPixel(testBitmap, 75, 75));
    FreeBitmap(testBitmap);
end;
procedure TIntegrationTests.TestFillRectangleOnBitmapWithOptionsIntegration;
begin
    testBitmap := CreateBitmap("test_bitmap", 100, 100);
    ClearBitmap(testBitmap, ColorWhite());
    FillRectangleOnBitmap(testBitmap, ColorBlack(), 25.0, 25.0, 50.0, 50.0, OptionDefaults());
    AssertEquals(ColorBlack(), GetPixel(testBitmap, 50, 50));
    AssertEquals(ColorWhite(), GetPixel(testBitmap, 10, 10));
    FreeBitmap(testBitmap);
end;
procedure TIntegrationTests.TestFillRectangleOnWindowRecordIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    ClearWindow(testWindow, ColorWhite());
    rectangle := RectangleFrom(100.0, 100.0, 200.0, 150.0);
    FillRectangleOnWindow(testWindow, ColorBlack(), rectangle);
    RefreshScreen();
    AssertEquals(ColorBlack(), GetPixel(testWindow, 150, 125));
    AssertEquals(ColorWhite(), GetPixel(testWindow, 350, 275));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestFillRectangleOnWindowRecordWithOptionsIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    ClearWindow(testWindow, ColorWhite());
    rectangle := RectangleFrom(100.0, 100.0, 200.0, 150.0);
    FillRectangleOnWindow(testWindow, ColorBlack(), rectangle, OptionDefaults());
    RefreshScreen();
    AssertEquals(ColorBlack(), GetPixel(testWindow, 150, 125));
    AssertEquals(ColorWhite(), GetPixel(testWindow, 350, 275));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestFillRectangleOnWindowIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    ClearWindow(testWindow, ColorWhite());
    FillRectangleOnWindow(testWindow, ColorBlack(), 100.0, 100.0, 50.0, 50.0);
    RefreshScreen();
    AssertEquals(ColorBlack(), GetPixel(testWindow, 125, 125));
    AssertEquals(ColorWhite(), GetPixel(testWindow, 175, 175));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestFillRectangleOnWindowWithOptionsIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    ClearWindow(testWindow, ColorWhite());
    FillRectangleOnWindow(testWindow, ColorBlack(), 100.0, 100.0, 50.0, 50.0, OptionDefaults());
    RefreshScreen();
    AssertEquals(ColorBlack(), GetPixel(testWindow, 125, 125));
    AssertEquals(ColorWhite(), GetPixel(testWindow, 175, 175));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestDrawTextFontAsStringIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    ClearWindow(testWindow, ColorWhite());
    RefreshScreen();
    LoadFont("hara", "hara.ttf");
    DrawText("Test Text", ColorBlack(), "hara", 24, 100.0, 100.0);
    RefreshScreen();
    AssertEquals(ColorBlack(), GetPixel(testWindow, 120, 110));
    AssertEquals(ColorWhite(), GetPixel(testWindow, 90, 90));
    CloseWindow(testWindow);
    FreeAllFonts();
end;
procedure TIntegrationTests.TestDrawTextWithOptionsFontAsStringIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    ClearWindow(testWindow, ColorWhite());
    LoadFont("hara", "hara.ttf");
    DrawText("Test Text", ColorBlack(), "hara", 24, 100.0, 100.0, OptionDefaults());
    RefreshScreen();
    AssertEquals(ColorBlack(), GetPixel(testWindow, 120, 110));
    AssertEquals(ColorWhite(), GetPixel(testWindow, 90, 90));
    CloseWindow(testWindow);
    FreeAllFonts();
end;
procedure TIntegrationTests.TestDrawTextNoFontNoSizeIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    ClearWindow(testWindow, ColorWhite());
    DrawText("Test Text", ColorBlack(), 100.0, 100.0);
    RefreshScreen();
    AssertEquals(ColorBlack(), GetPixel(testWindow, 105, 100));
    AssertEquals(ColorWhite(), GetPixel(testWindow, 90, 90));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestDrawTextNoFontNoSizeWithOptionsIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    ClearWindow(testWindow, ColorWhite());
    DrawText("Test Text", ColorBlack(), 100.0, 100.0, OptionDefaults());
    RefreshScreen();
    AssertEquals(ColorBlack(), GetPixel(testWindow, 105, 100));
    AssertEquals(ColorWhite(), GetPixel(testWindow, 90, 90));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestDrawTextIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    ClearWindow(testWindow, ColorWhite());
    LoadFont("hara", "hara.ttf");
    DrawText("Test Text", ColorBlack(), FontNamed("hara"), 24, 100.0, 100.0);
    RefreshScreen();
    AssertEquals(ColorBlack(), GetPixel(testWindow, 120, 110));
    AssertEquals(ColorWhite(), GetPixel(testWindow, 90, 90));
    CloseWindow(testWindow);
    FreeAllFonts();
end;
procedure TIntegrationTests.TestDrawTextWithOptionsIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    ClearWindow(testWindow, ColorWhite());
    LoadFont("hara", "hara.ttf");
    DrawText("Test Text", ColorBlack(), FontNamed("hara"), 24, 100.0, 100.0, OptionDefaults());
    RefreshScreen();
    AssertEquals(ColorBlack(), GetPixel(testWindow, 120, 110));
    AssertEquals(ColorWhite(), GetPixel(testWindow, 90, 90));
    CloseWindow(testWindow);
    FreeAllFonts();
end;
procedure TIntegrationTests.TestDrawTextOnBitmapFontAsStringIntegration;
begin
    testBitmap := CreateBitmap("test_bitmap", 200, 200);
    ClearBitmap(testBitmap, ColorWhite());
    LoadFont("hara", "hara.ttf");
    DrawTextOnBitmap(testBitmap, "Test Text", ColorBlack(), "hara", 24, 100.0, 100.0);
    AssertEquals(ColorBlack(), GetPixel(testBitmap, 120, 110));
    AssertEquals(ColorWhite(), GetPixel(testBitmap, 90, 90));
    FreeBitmap(testBitmap);
    FreeAllFonts();
end;
procedure TIntegrationTests.TestDrawTextOnBitmapWithOptionsFontAsStringIntegration;
begin
    testBitmap := CreateBitmap("test_bitmap", 200, 200);
    ClearBitmap(testBitmap, ColorWhite());
    LoadFont("hara", "hara.ttf");
    DrawTextOnBitmap(testBitmap, "Test Text", ColorBlack(), "hara", 24, 100.0, 100.0, OptionDefaults());
    AssertEquals(ColorBlack(), GetPixel(testBitmap, 120, 110));
    AssertEquals(ColorWhite(), GetPixel(testBitmap, 90, 90));
    FreeBitmap(testBitmap);
    FreeAllFonts();
end;
procedure TIntegrationTests.TestDrawTextOnBitmapNoFontNoSizeIntegration;
begin
    testBitmap := CreateBitmap("test_bitmap", 200, 200);
    ClearBitmap(testBitmap, ColorWhite());
    DrawTextOnBitmap(testBitmap, "Test Text", ColorBlack(), 100.0, 100.0);
    AssertEquals(ColorBlack(), GetPixel(testBitmap, 105, 100));
    AssertEquals(ColorWhite(), GetPixel(testBitmap, 90, 90));
    FreeBitmap(testBitmap);
end;
procedure TIntegrationTests.TestDrawTextOnBitmapNoFontNoSizeWithOptionsIntegration;
begin
    testBitmap := CreateBitmap("test_bitmap", 200, 200);
    ClearBitmap(testBitmap, ColorWhite());
    DrawTextOnBitmap(testBitmap, "Test Text", ColorBlack(), 100.0, 100.0, OptionDefaults());
    AssertEquals(ColorBlack(), GetPixel(testBitmap, 105, 100));
    AssertEquals(ColorWhite(), GetPixel(testBitmap, 90, 90));
    FreeBitmap(testBitmap);
end;
procedure TIntegrationTests.TestDrawTextOnBitmapIntegration;
begin
    testBitmap := CreateBitmap("test_bitmap", 200, 200);
    ClearBitmap(testBitmap, ColorWhite());
    LoadFont("hara", "hara.ttf");
    DrawTextOnBitmap(testBitmap, "Test Text", ColorBlack(), FontNamed("hara"), 24, 100.0, 100.0);
    AssertEquals(ColorBlack(), GetPixel(testBitmap, 120, 110));
    AssertEquals(ColorWhite(), GetPixel(testBitmap, 90, 90));
    FreeBitmap(testBitmap);
    FreeAllFonts();
end;
procedure TIntegrationTests.TestDrawTextOnBitmapWithOptionsIntegration;
begin
    testBitmap := CreateBitmap("test_bitmap", 200, 200);
    ClearBitmap(testBitmap, ColorWhite());
    LoadFont("hara", "hara.ttf");
    DrawTextOnBitmap(testBitmap, "Test Text", ColorBlack(), FontNamed("hara"), 24, 100.0, 100.0, OptionDefaults());
    AssertEquals(ColorBlack(), GetPixel(testBitmap, 120, 110));
    AssertEquals(ColorWhite(), GetPixel(testBitmap, 90, 90));
    FreeBitmap(testBitmap);
    FreeAllFonts();
end;
procedure TIntegrationTests.TestDrawTextOnWindowFontAsStringIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    ClearWindow(testWindow, ColorWhite());
    LoadFont("hara", "hara.ttf");
    DrawTextOnWindow(testWindow, "Test Text", ColorBlack(), "hara", 24, 100.0, 100.0);
    RefreshScreen();
    AssertEquals(ColorBlack(), GetPixel(testWindow, 120, 110));
    AssertEquals(ColorWhite(), GetPixel(testWindow, 90, 90));
    CloseWindow(testWindow);
    FreeAllFonts();
end;
procedure TIntegrationTests.TestDrawTextOnWindowWithOptionsFontAsStringIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    ClearWindow(testWindow, ColorWhite());
    LoadFont("hara", "hara.ttf");
    DrawTextOnWindow(testWindow, "Test Text", ColorBlack(), "hara", 24, 100.0, 100.0, OptionDefaults());
    RefreshScreen();
    AssertEquals(ColorBlack(), GetPixel(testWindow, 120, 110));
    AssertEquals(ColorWhite(), GetPixel(testWindow, 90, 90));
    CloseWindow(testWindow);
    FreeAllFonts();
end;
procedure TIntegrationTests.TestDrawTextOnWindowNoFontNoSizeIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    ClearWindow(testWindow, ColorWhite());
    DrawTextOnWindow(testWindow, "Test Text", ColorBlack(), 100.0, 100.0);
    RefreshScreen();
    AssertEquals(ColorBlack(), GetPixel(testWindow, 105, 100));
    AssertEquals(ColorWhite(), GetPixel(testWindow, 90, 90));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestDrawTextOnWindowNoFontNoSizeWithOptionsIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    ClearWindow(testWindow, ColorWhite());
    DrawTextOnWindow(testWindow, "Test Text", ColorBlack(), 100.0, 100.0, OptionDefaults());
    RefreshScreen();
    AssertEquals(ColorBlack(), GetPixel(testWindow, 105, 100));
    AssertEquals(ColorWhite(), GetPixel(testWindow, 90, 90));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestDrawTextOnWindowIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    ClearWindow(testWindow, ColorWhite());
    LoadFont("hara", "hara.ttf");
    testFont := FontNamed("hara");
    FontLoadSize(testFont, 24);
    DrawTextOnWindow(testWindow, "Test Text", ColorBlack(), testFont, 24, 100.0, 100.0);
    RefreshScreen();
    AssertEquals(ColorBlack(), GetPixel(testWindow, 120, 110));
    AssertEquals(ColorWhite(), GetPixel(testWindow, 90, 90));
    CloseWindow(testWindow);
    FreeAllFonts();
end;
procedure TIntegrationTests.TestDrawTextOnWindowWithOptionsIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    ClearWindow(testWindow, ColorWhite());
    testFont := LoadFont("test_font", "hara.ttf");
    DrawTextOnWindow(testWindow, "Test Text", ColorBlack(), testFont, 24, 100.0, 100.0, OptionDefaults());
    RefreshScreen();
    AssertEquals(ColorBlack(), GetPixel(testWindow, 120, 110));
    AssertEquals(ColorWhite(), GetPixel(testWindow, 90, 90));
    CloseWindow(testWindow);
    FreeFont(testFont);
end;
procedure TIntegrationTests.TestFontHasSizeNameAsStringIntegration;
begin
    LoadFont("hara", "hara.ttf");
    FontLoadSize("hara", 12);
    AssertTrue(FontHasSize("hara", 12));
    AssertFalse(FontHasSize("nonexistent_font", 12));
    FreeAllFonts();
end;
procedure TIntegrationTests.TestFontHasSizeIntegration;
begin
    testFont := LoadFont("test_font", "hara.ttf");
    FontLoadSize(testFont, 12);
    AssertTrue(FontHasSize(testFont, 12));
    AssertFalse(FontHasSize(testFont, 999));
    FreeFont(testFont);
end;
procedure TIntegrationTests.TestFontLoadSizeNameAsStringIntegration;
begin
    LoadFont("test_font", "hara.ttf");
    FontLoadSize("test_font", 12);
    AssertTrue(FontHasSize("test_font", 12));
    FreeAllFonts();
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
    testWindow := OpenWindow("Test Window", 800, 600);
    ClearWindow(testWindow, ColorWhite());
    LoadFont("hara", "hara.ttf");
    testFont := FontNamed("hara");
    DrawText("Test Text", ColorBlack(), testFont, 24, 100.0, 100.0);
    RefreshScreen();
    AssertNotNull(testFont);
    AssertEquals(ColorBlack(), GetPixel(testWindow, 120, 110));
    AssertEquals(ColorWhite(), GetPixel(testWindow, 90, 90));
    CloseWindow(testWindow);
    FreeAllFonts();
end;
procedure TIntegrationTests.TestFreeAllFontsIntegration;
begin
    testFont := LoadFont("test_font", "hara.ttf");
    AssertTrue(HasFont("test_font"));
    FreeAllFonts();
    AssertFalse(HasFont("test_font"));
end;
procedure TIntegrationTests.TestFreeFontIntegration;
begin
    testFont := LoadFont("test_font", "hara.ttf");
    AssertTrue(HasFont(testFont));
    FreeFont(testFont);
    AssertFalse(HasFont(testFont));
end;
procedure TIntegrationTests.TestGetFontStyleNameAsStringIntegration;
begin
    testFont := LoadFont("test_font", "hara.ttf");
    style := GetFontStyle("test_font");
    AssertEquals(FontStyle.BOLD_FONT, style);
    FreeFont(testFont);
end;
procedure TIntegrationTests.TestGetFontStyleIntegration;
begin
    testFont := LoadFont("test_font", "hara.ttf");
    style := GetFontStyle(testFont);
    AssertEquals(FontStyle.BOLD_FONT, style);
    FreeFont(testFont);
end;
procedure TIntegrationTests.TestGetSystemFontIntegration;
begin
    systemFont := GetSystemFont();
    AssertNotNull(systemFont);
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
    AssertTrue(HasFont("hara"));
    AssertFalse(HasFont("nonexistent_font"));
end;
procedure TIntegrationTests.TestLoadFontIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    ClearWindow(testWindow, ColorWhite());
    testFont := LoadFont("test_font", "hara.ttf");
    DrawText("Test Text", ColorBlack(), testFont, 24, 100.0, 100.0, OptionDefaults());
    RefreshScreen();
    AssertTrue(HasFont("test_font"));
    AssertEquals(ColorBlack(), GetPixel(testWindow, 105, 105));
    CloseWindow(testWindow);
    FreeFont(testFont);
end;
procedure TIntegrationTests.TestSetFontStyleNameAsStringIntegration;
begin
    testFont := LoadFont("test_font", "hara.ttf");
    SetFontStyle("test_font", FontStyle.BOLD_FONT);
    AssertEquals(FontStyle.BOLD_FONT, GetFontStyle("test_font"));
    FreeFont(testFont);
end;
procedure TIntegrationTests.TestSetFontStyleIntegration;
begin
    testFont := LoadFont("test_font", "hara.ttf");
    SetFontStyle(testFont, FontStyle.BOLD_FONT);
    AssertEquals(FontStyle.BOLD_FONT, GetFontStyle(testFont));
    FreeFont(testFont);
end;
procedure TIntegrationTests.TestTextHeightFontNamedIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    height := TextHeight("Test Text", "hara", 24);
    AssertTrue(height > 0);
    AssertTrue(height >= 24);
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestTextHeightIntegration;
begin
    testFont := LoadFont("test_font", "hara.ttf");
    FontLoadSize(testFont, 24);
    height := TextHeight("Test Text", testFont, 24);
    AssertTrue(height > 0);
    AssertTrue(height >= 24);
    FreeFont(testFont);
end;
procedure TIntegrationTests.TestTextWidthFontNamedIntegration;
begin
    testFont := LoadFont("hara", "hara.ttf");
    FontLoadSize(testFont, 12);
    width := TextWidth("Test Text", "hara", 24);
    AssertTrue(width > 0);
    AssertTrue(width >= TextHeight("Test Text", "hara", 24));
    FreeFont(testFont);
end;
procedure TIntegrationTests.TestTextWidthIntegration;
begin
    testFont := LoadFont("test_font", "hara.ttf");
    FontLoadSize(testFont, 12);
    width := TextWidth("Test Text", testFont, 24);
    AssertTrue(width > 0);
    AssertTrue(width >= TextHeight("Text Height", testFont, 24));
    FreeFont(testFont);
end;
procedure TIntegrationTests.TestDrawTriangleRecordIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    ClearWindow(testWindow, ColorWhite());
    triangle := TriangleFrom(PointAt(100.0, 100.0), PointAt(200.0, 200.0), PointAt(150.0, 300.0));
    DrawTriangle(ColorBlack(), triangle);
    RefreshScreen();
    AssertEquals(ColorBlack(), GetPixel(testWindow, 100, 100));
    AssertEquals(ColorWhite(), GetPixel(testWindow, 150, 200));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestDrawTriangleRecordWithOptionsIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    ClearWindow(testWindow, ColorWhite());
    triangle := TriangleFrom(PointAt(100.0, 100.0), PointAt(200.0, 200.0), PointAt(150.0, 300.0));
    DrawTriangle(ColorBlack(), triangle, OptionDefaults());
    RefreshScreen();
    AssertEquals(ColorBlack(), GetPixel(testWindow, 100, 100));
    AssertEquals(ColorWhite(), GetPixel(testWindow, 150, 200));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestDrawTriangleIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    ClearWindow(testWindow, ColorWhite());
    DrawTriangle(ColorBlack(), 100.0, 100.0, 200.0, 300.0, 300.0, 100.0);
    RefreshScreen();
    AssertEquals(ColorBlack(), GetPixel(testWindow, 100, 100));
    AssertEquals(ColorWhite(), GetPixel(testWindow, 200, 150));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestDrawTriangleWithOptionsIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    ClearWindow(testWindow, ColorWhite());
    DrawTriangle(ColorBlack(), 100.0, 100.0, 200.0, 200.0, 150.0, 300.0, OptionDefaults());
    RefreshScreen();
    AssertEquals(ColorBlack(), GetPixel(testWindow, 100, 100));
    AssertEquals(ColorWhite(), GetPixel(testWindow, 150, 200));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestDrawTriangleOnBitmapRecordIntegration;
begin
    testBitmap := CreateBitmap("test_bitmap", 100, 100);
    ClearBitmap(testBitmap, ColorWhite());
    triangle := TriangleFrom(PointAt(25.0, 25.0), PointAt(75.0, 25.0), PointAt(50.0, 75.0));
    DrawTriangleOnBitmap(testBitmap, ColorBlack(), triangle);
    AssertEquals(ColorBlack(), GetPixel(testBitmap, 25, 25));
    AssertEquals(ColorWhite(), GetPixel(testBitmap, 50, 50));
    FreeBitmap(testBitmap);
end;
procedure TIntegrationTests.TestDrawTriangleOnBitmapRecordWithOptionsIntegration;
begin
    testBitmap := CreateBitmap("test_bitmap", 100, 100);
    ClearBitmap(testBitmap, ColorWhite());
    triangle := TriangleFrom(PointAt(25.0, 25.0), PointAt(75.0, 25.0), PointAt(50.0, 75.0));
    DrawTriangleOnBitmap(testBitmap, ColorBlack(), triangle, OptionDefaults());
    AssertEquals(ColorBlack(), GetPixel(testBitmap, 25, 25));
    AssertEquals(ColorWhite(), GetPixel(testBitmap, 50, 50));
    FreeBitmap(testBitmap);
end;
procedure TIntegrationTests.TestDrawTriangleOnBitmapIntegration;
begin
    testBitmap := CreateBitmap("test_bitmap", 100, 100);
    ClearBitmap(testBitmap, ColorWhite());
    DrawTriangleOnBitmap(testBitmap, ColorBlack(), 25.0, 25.0, 75.0, 25.0, 50.0, 75.0);
    AssertEquals(ColorBlack(), GetPixel(testBitmap, 25, 25));
    AssertEquals(ColorWhite(), GetPixel(testBitmap, 50, 50));
    FreeBitmap(testBitmap);
end;
procedure TIntegrationTests.TestDrawTriangleOnBitmapWithOptionsIntegration;
begin
    testBitmap := CreateBitmap("test_bitmap", 100, 100);
    ClearBitmap(testBitmap, ColorWhite());
    DrawTriangleOnBitmap(testBitmap, ColorBlack(), 25.0, 25.0, 75.0, 25.0, 50.0, 75.0, OptionDefaults());
    AssertEquals(ColorBlack(), GetPixel(testBitmap, 25, 25));
    AssertEquals(ColorWhite(), GetPixel(testBitmap, 50, 50));
    FreeBitmap(testBitmap);
end;
procedure TIntegrationTests.TestDrawTriangleOnWindowRecordIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    ClearWindow(testWindow, ColorWhite());
    triangle := TriangleFrom(PointAt(100.0, 100.0), PointAt(200.0, 200.0), PointAt(150.0, 300.0));
    DrawTriangleOnWindow(testWindow, ColorBlack(), triangle);
    RefreshScreen();
    AssertEquals(ColorBlack(), GetPixel(testWindow, 100, 100));
    AssertEquals(ColorWhite(), GetPixel(testWindow, 50, 50));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestDrawTriangleOnWindowRecordWithOptionsIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    ClearWindow(testWindow, ColorWhite());
    triangle := TriangleFrom(PointAt(100.0, 100.0), PointAt(200.0, 200.0), PointAt(150.0, 250.0));
    DrawTriangleOnWindow(testWindow, ColorBlack(), triangle, OptionDefaults());
    RefreshScreen();
    AssertEquals(ColorBlack(), GetPixel(testWindow, 150, 150));
    AssertEquals(ColorWhite(), GetPixel(testWindow, 50, 50));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestDrawTriangleOnWindowIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    ClearWindow(testWindow, ColorWhite());
    DrawTriangleOnWindow(testWindow, ColorBlack(), 100.0, 100.0, 200.0, 300.0, 300.0, 100.0);
    RefreshScreen();
    AssertEquals(ColorBlack(), GetPixel(testWindow, 100, 100));
    AssertEquals(ColorWhite(), GetPixel(testWindow, 50, 50));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestDrawTriangleOnWindowWithOptionsIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    ClearWindow(testWindow, ColorWhite());
    DrawTriangleOnWindow(testWindow, ColorBlack(), 100.0, 100.0, 200.0, 200.0, 150.0, 300.0, OptionDefaults());
    RefreshScreen();
    AssertEquals(ColorBlack(), GetPixel(testWindow, 100, 100));
    AssertEquals(ColorWhite(), GetPixel(testWindow, 50, 50));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestFillTriangleRecordIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    ClearWindow(testWindow, ColorWhite());
    triangle := TriangleFrom(PointAt(100.0, 100.0), PointAt(200.0, 300.0), PointAt(300.0, 100.0));
    FillTriangle(ColorBlack(), triangle);
    RefreshScreen();
    AssertEquals(ColorBlack(), GetPixel(testWindow, 200, 150));
    AssertEquals(ColorWhite(), GetPixel(testWindow, 50, 50));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestFillTriangleRecordWithOptionsIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    ClearWindow(testWindow, ColorWhite());
    triangle := TriangleFrom(PointAt(100.0, 100.0), PointAt(200.0, 300.0), PointAt(300.0, 100.0));
    FillTriangle(ColorBlack(), triangle, OptionDefaults());
    RefreshScreen();
    AssertEquals(ColorBlack(), GetPixel(testWindow, 200, 150));
    AssertEquals(ColorWhite(), GetPixel(testWindow, 50, 50));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestFillTriangleIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    ClearWindow(testWindow, ColorWhite());
    FillTriangle(ColorBlack(), 100.0, 100.0, 200.0, 300.0, 300.0, 100.0);
    RefreshScreen();
    AssertEquals(ColorBlack(), GetPixel(testWindow, 200, 150));
    AssertEquals(ColorWhite(), GetPixel(testWindow, 50, 50));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestFillTriangleWithOptionsIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    ClearWindow(testWindow, ColorWhite());
    FillTriangle(ColorRed(), 100.0, 100.0, 200.0, 300.0, 300.0, 100.0, OptionDefaults());
    RefreshScreen();
    AssertEquals(ColorRed(), GetPixel(testWindow, 150, 150));
    AssertEquals(ColorWhite(), GetPixel(testWindow, 350, 150));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestFillTriangleOnBitmapRecordIntegration;
begin
    testBitmap := CreateBitmap("test_bitmap", 100, 100);
    ClearBitmap(testBitmap, ColorWhite());
    triangle := TriangleFrom(PointAt(25.0, 25.0), PointAt(75.0, 25.0), PointAt(50.0, 75.0));
    FillTriangleOnBitmap(testBitmap, ColorBlack(), triangle);
    AssertEquals(ColorBlack(), GetPixel(testBitmap, 50, 50));
    AssertEquals(ColorWhite(), GetPixel(testBitmap, 0, 0));
    FreeBitmap(testBitmap);
end;
procedure TIntegrationTests.TestFillTriangleOnBitmapRecordWithOptionsIntegration;
begin
    testBitmap := CreateBitmap("test_bitmap", 100, 100);
    ClearBitmap(testBitmap, ColorWhite());
    triangle := TriangleFrom(PointAt(25.0, 25.0), PointAt(75.0, 25.0), PointAt(50.0, 75.0));
    FillTriangleOnBitmap(testBitmap, ColorBlack(), triangle, OptionDefaults());
    AssertEquals(ColorBlack(), GetPixel(testBitmap, 50, 50));
    AssertEquals(ColorWhite(), GetPixel(testBitmap, 10, 10));
    FreeBitmap(testBitmap);
end;
procedure TIntegrationTests.TestFillTriangleOnBitmapIntegration;
begin
    testBitmap := CreateBitmap("test_bitmap", 100, 100);
    ClearBitmap(testBitmap, ColorWhite());
    FillTriangleOnBitmap(testBitmap, ColorBlack(), 25.0, 25.0, 75.0, 25.0, 50.0, 75.0);
    AssertEquals(ColorBlack(), GetPixel(testBitmap, 50, 50));
    AssertEquals(ColorWhite(), GetPixel(testBitmap, 0, 0));
    FreeBitmap(testBitmap);
end;
procedure TIntegrationTests.TestFillTriangleOnBitmapWithOptionsIntegration;
begin
    testBitmap := CreateBitmap("test_bitmap", 100, 100);
    ClearBitmap(testBitmap, ColorWhite());
    FillTriangleOnBitmap(testBitmap, ColorBlack(), 25.0, 25.0, 75.0, 25.0, 50.0, 75.0, OptionDefaults());
    AssertEquals(ColorBlack(), GetPixel(testBitmap, 50, 50));
    AssertEquals(ColorWhite(), GetPixel(testBitmap, 0, 0));
    FreeBitmap(testBitmap);
end;
procedure TIntegrationTests.TestFillTriangleOnWindowRecordIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    ClearWindow(testWindow, ColorWhite());
    triangle := TriangleFrom(PointAt(100.0, 100.0), PointAt(200.0, 300.0), PointAt(300.0, 100.0));
    FillTriangleOnWindow(testWindow, ColorBlack(), triangle);
    RefreshScreen();
    AssertEquals(ColorBlack(), GetPixel(testWindow, 200, 200));
    AssertEquals(ColorWhite(), GetPixel(testWindow, 50, 50));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestFillTriangleOnWindowRecordWithOptionsIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    ClearWindow(testWindow, ColorWhite());
    triangle := TriangleFrom(PointAt(100.0, 100.0), PointAt(200.0, 300.0), PointAt(300.0, 100.0));
    FillTriangleOnWindow(testWindow, ColorBlack(), triangle, OptionDefaults());
    RefreshScreen();
    AssertEquals(ColorBlack(), GetPixel(testWindow, 200, 200));
    AssertEquals(ColorWhite(), GetPixel(testWindow, 50, 50));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestFillTriangleOnWindowIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    ClearWindow(testWindow, ColorWhite());
    FillTriangleOnWindow(testWindow, ColorBlack(), 100.0, 100.0, 200.0, 300.0, 300.0, 100.0);
    RefreshScreen();
    AssertEquals(ColorBlack(), GetPixel(testWindow, 200, 200));
    AssertEquals(ColorWhite(), GetPixel(testWindow, 50, 50));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestFillTriangleOnWindowWithOptionsIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    ClearWindow(testWindow, ColorWhite());
    FillTriangleOnWindow(testWindow, ColorBlack(), 100.0, 100.0, 200.0, 300.0, 300.0, 100.0, OptionDefaults());
    RefreshScreen();
    AssertEquals(ColorBlack(), GetPixel(testWindow, 150, 150));
    AssertEquals(ColorWhite(), GetPixel(testWindow, 350, 150));
    CloseWindow(testWindow);
end;
end;

procedure RegisterTests;
begin
#<Proc:0x00007f7a8f3c6228 /mnt/c/Users/Noahc/Documents/.Year 2 Semester 3/Team Project (A)/Github Repo/splashkit_test_generator/test_generator/config/languages/pascal_config.rb:117 (lambda)>
end;
