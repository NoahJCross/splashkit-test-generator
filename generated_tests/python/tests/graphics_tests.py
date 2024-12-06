import pytest
from splashkit import *


def test_DrawCircleRecord_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_circle = CircleAt(400.0, 300.0, 50.0)
    DrawCircle(ColorBlack(), test_circle)
    RefreshScreen()
    assert PointInCircle(PointAt(400.0, 300.0), test_circle) is True
    CloseWindow(test_window)


def test_DrawCircleRecordWithOptions_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_circle = CircleAt(400.0, 300.0, 50.0)
    DrawCircle(ColorBlack(), test_circle, OptionDefaults())
    RefreshScreen()
    assert PointInCircle(PointAt(400.0, 300.0), test_circle) is True
    CloseWindow(test_window)


def test_DrawCircle_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    DrawCircle(ColorBlack(), 400.0, 300.0, 50.0)
    RefreshScreen()
    assert PointInCircle(PointAt(400.0, 300.0), CircleAt(400.0, 300.0, 50.0)) is True
    CloseWindow(test_window)


def test_DrawCircleWithOptions_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    DrawCircle(ColorBlack(), 400.0, 300.0, 50.0, OptionDefaults())
    RefreshScreen()
    assert PointInCircle(PointAt(400.0, 300.0), CircleAt(400.0, 300.0, 50.0)) is True
    CloseWindow(test_window)


def test_DrawCircleOnBitmap_integration():
    test_bitmap = CreateBitmap("test_bitmap", 200, 200)
    DrawCircleOnBitmap(test_bitmap, ColorBlack(), 100.0, 100.0, 50.0)
    assert PixelDrawnAtPoint(test_bitmap, 100.0, 100.0) is True
    FreeBitmap(test_bitmap)


def test_DrawCircleOnBitmapWithOptions_integration():
    test_bitmap = CreateBitmap("test_bitmap", 200, 200)
    DrawCircleOnBitmap(test_bitmap, ColorBlack(), 100.0, 100.0, 50.0, OptionDefaults())
    assert PixelDrawnAtPoint(test_bitmap, 100.0, 100.0) is True
    FreeBitmap(test_bitmap)


def test_DrawCircleOnWindow_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    DrawCircleOnWindow(test_window, ColorBlack(), 400.0, 300.0, 50.0)
    RefreshScreen()
    assert PointInCircle(PointAt(400.0, 300.0), CircleAt(400.0, 300.0, 50.0)) is True
    CloseWindow(test_window)


def test_DrawCircleOnWindowWithOptions_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    DrawCircleOnWindow(test_window, ColorBlack(), 400.0, 300.0, 50.0, OptionDefaults())
    RefreshScreen()
    assert PointInCircle(PointAt(400.0, 300.0), CircleAt(400.0, 300.0, 50.0)) is True
    CloseWindow(test_window)


def test_FillCircleRecord_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_circle = CircleAt(400.0, 300.0, 50.0)
    FillCircle(ColorBlack(), test_circle)
    RefreshScreen()
    assert PointInCircle(PointAt(400.0, 300.0), test_circle) is True
    CloseWindow(test_window)


def test_FillCircleRecordWithOptions_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_circle = CircleAt(400.0, 300.0, 50.0)
    FillCircle(ColorBlack(), test_circle, OptionDefaults())
    RefreshScreen()
    assert PointInCircle(PointAt(400.0, 300.0), test_circle) is True
    CloseWindow(test_window)


def test_FillCircle_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    FillCircle(ColorBlack(), 400.0, 300.0, 50.0)
    RefreshScreen()
    assert PointInCircle(PointAt(400.0, 300.0), CircleAt(400.0, 300.0, 50.0)) is True
    CloseWindow(test_window)


def test_FillCircleWithOptions_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    FillCircle(ColorBlack(), 400.0, 300.0, 50.0, OptionDefaults())
    RefreshScreen()
    assert PointInCircle(PointAt(400.0, 300.0), CircleAt(400.0, 300.0, 50.0)) is True
    CloseWindow(test_window)


def test_FillCircleOnBitmap_integration():
    test_bitmap = CreateBitmap("test_bitmap", 200, 200)
    FillCircleOnBitmap(test_bitmap, ColorRed(), 100.0, 100.0, 50.0)
    assert PixelDrawnAtPoint(test_bitmap, 100.0, 100.0) is True
    assert PixelDrawnAtPoint(test_bitmap, 150.0, 100.0) is True
    assert PixelDrawnAtPoint(test_bitmap, 200.0, 100.0) is False
    FreeBitmap(test_bitmap)


def test_FillCircleOnBitmapWithOptions_integration():
    test_bitmap = CreateBitmap("test_bitmap", 200, 200)
    FillCircleOnBitmap(test_bitmap, ColorBlack(), 100.0, 100.0, 50.0, OptionDefaults())
    assert PixelDrawnAtPoint(test_bitmap, 100.0, 100.0) is True
    assert PixelDrawnAtPoint(test_bitmap, 150.0, 100.0) is True
    assert PixelDrawnAtPoint(test_bitmap, 200.0, 100.0) is False
    FreeBitmap(test_bitmap)


def test_FillCircleOnWindow_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    FillCircleOnWindow(test_window, ColorBlack(), 400.0, 300.0, 50.0)
    RefreshScreen()
    assert PointInCircle(PointAt(400.0, 300.0), CircleAt(400.0, 300.0, 50.0)) is True
    CloseWindow(test_window)


def test_FillCircleOnWindowWithOptions_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    FillCircleOnWindow(test_window, ColorBlack(), 400.0, 300.0, 50.0, OptionDefaults())
    RefreshScreen()
    assert PointInCircle(PointAt(400.0, 300.0), CircleAt(400.0, 300.0, 50.0)) is True
    CloseWindow(test_window)


def test_CurrentClip_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_clip = CurrentClip()
    assert test_clip.width == 800
    assert test_clip.height == 600
    CloseWindow(test_window)


def test_CurrentClipForBitmap_integration():
    test_bitmap = CreateBitmap("test_bitmap", 100, 100)
    test_rectangle = RectangleFrom(10, 10, 50, 50)
    PushClip(test_bitmap, test_rectangle)
    test_clip = CurrentClip(test_bitmap)
    assert RectangleLeft(test_clip) == 10
    assert RectangleTop(test_clip) == 10
    assert test_clip.width == 50
    assert test_clip.height == 50
    FreeBitmap(test_bitmap)


def test_CurrentClipForWindow_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_clip = CurrentClip(test_window)
    assert RectangleFrom(0, 0, 800, 600) == test_clip
    CloseWindow(test_window)


def test_PopClipForWindow_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_rectangle = RectangleFrom(100, 100, 200, 200)
    PushClip(test_window, test_rectangle)
    test_current_clip = CurrentClip(test_window)
    assert test_current_clip == test_rectangle
    PopClip(test_window)
    test_current_clip_after_pop = CurrentClip(test_window)
    assert RectangleFrom(0, 0, 800, 600) == test_current_clip_after_pop
    CloseWindow(test_window)


def test_PopClip_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    PushClip(RectangleFrom(100, 100, 200, 200))
    DrawCircle(ColorBlack(), 150, 150, 50)
    RefreshScreen()
    assert PointInCircle(PointAt(150, 150), CircleAt(150, 150, 50)) is True
    PopClip()
    DrawCircle(ColorRed(), 300, 300, 50)
    RefreshScreen()
    assert PointInCircle(PointAt(300, 300), CircleAt(300, 300, 50)) is True
    CloseWindow(test_window)


def test_PopClipForBitmap_integration():
    test_bitmap = CreateBitmap("test_bitmap", 100, 100)
    PushClip(test_bitmap, RectangleFrom(0, 0, 50, 50))
    PopClip(test_bitmap)
    assert CurrentClip(test_bitmap) == RectangleFrom(0, 0, 100, 100)
    FreeBitmap(test_bitmap)


def test_PushClipForWindow_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_rectangle = RectangleFrom(100.0, 100.0, 200.0, 200.0)
    PushClipForWindow(test_window, test_rectangle)
    test_current_clip = CurrentClipForWindow(test_window)
    assert test_current_clip == test_rectangle
    RefreshScreen()
    CloseWindow(test_window)


def test_PushClipForBitmap_integration():
    test_bitmap = CreateBitmap("test_bitmap", 200, 200)
    test_rectangle = RectangleFrom(50, 50, 100, 100)
    PushClip(test_bitmap, test_rectangle)
    test_current_clip = CurrentClip(test_bitmap)
    assert RectangleLeft(test_current_clip) == 50
    assert RectangleTop(test_current_clip) == 50
    assert test_current_clip.width == 100
    assert test_current_clip.height == 100
    FreeBitmap(test_bitmap)


def test_PushClip_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_rectangle = RectangleFrom(100.0, 100.0, 200.0, 200.0)
    PushClip(test_rectangle)
    test_current_clip = CurrentClip()
    assert test_current_clip == test_rectangle
    CloseWindow(test_window)


def test_ResetClipForBitmap_integration():
    test_bitmap = CreateBitmap("test_bitmap", 100, 100)
    PushClip(test_bitmap, RectangleFrom(10, 10, 50, 50))
    ResetClipForBitmap(test_bitmap)
    assert CurrentClipForBitmap(test_bitmap) == RectangleFrom(0, 0, 100, 100)
    FreeBitmap(test_bitmap)


def test_ResetClip_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    PushClip(RectangleFrom(100, 100, 200, 200))
    ResetClip()
    test_clip_rect = CurrentClip()
    assert RectangleFrom(0, 0, 800, 600) == test_clip_rect
    CloseWindow(test_window)


def test_ResetClipForWindow_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    PushClip(test_window, RectangleFrom(100, 100, 200, 200))
    ResetClipForWindow(test_window)
    test_clip_rect = CurrentClipForWindow(test_window)
    assert RectangleFrom(0, 0, 800, 600) == test_clip_rect
    CloseWindow(test_window)


def test_SetClip_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_rectangle = RectangleFrom(100.0, 100.0, 200.0, 200.0)
    SetClip(test_rectangle)
    test_current_clip = CurrentClip()
    assert test_current_clip == test_rectangle
    CloseWindow(test_window)


def test_SetClipForBitmap_integration():
    test_bitmap = CreateBitmap("test_bitmap", 200, 200)
    test_rectangle = RectangleFrom(50, 50, 100, 100)
    SetClip(test_bitmap, test_rectangle)
    test_current_clip = CurrentClip(test_bitmap)
    assert test_current_clip == test_rectangle
    FreeBitmap(test_bitmap)


def test_SetClipForWindow_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_rectangle = RectangleFrom(100, 100, 200, 200)
    SetClip(test_window, test_rectangle)
    test_current_clip = CurrentClip(test_window)
    assert test_current_clip == test_rectangle
    CloseWindow(test_window)


def test_OptionDefaults_integration():
    test_options = OptionDefaults()
    assert test_options is not None


def test_OptionDrawToBitmap_integration():
    test_bitmap = CreateBitmap("test_bitmap", 100, 100)
    test_options = OptionDrawToBitmap(test_bitmap)
    DrawCircle(ColorBlack(), CircleAt(50.0, 50.0, 25.0), test_options)
    assert PixelDrawnAtPoint(test_bitmap, 50.0, 50.0) is True
    assert PixelDrawnAtPoint(test_bitmap, 100.0, 100.0) is False
    FreeBitmap(test_bitmap)


def test_OptionDrawToBitmapWithOptions_integration():
    test_bitmap = CreateBitmap("test_bitmap", 100, 100)
    test_options = OptionDefaults()
    test_drawing_options = OptionDrawToBitmapWithOptions(test_bitmap, test_options)
    DrawCircle(ColorBlack(), CircleAt(50.0, 50.0, 25.0), test_drawing_options)
    assert PixelDrawnAtPoint(test_bitmap, 50.0, 50.0) is True
    assert PixelDrawnAtPoint(test_bitmap, 100.0, 100.0) is False
    FreeBitmap(test_bitmap)


def test_OptionDrawToWindow_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_circle = CircleAt(400.0, 300.0, 50.0)
    DrawCircle(ColorBlack(), test_circle, OptionDrawToWindow(test_window))
    RefreshScreen()
    assert PointInCircle(PointAt(400.0, 300.0), test_circle) is True
    CloseWindow(test_window)


def test_OptionDrawToWindowWithOptions_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_options = OptionDefaults()
    test_draw_options = OptionDrawToWindowWithOptions(test_window, test_options)
    DrawCircle(ColorBlack(), CircleAt(400.0, 300.0, 50.0), test_draw_options)
    RefreshScreen()
    assert PointInCircle(PointAt(400.0, 300.0), CircleAt(400.0, 300.0, 50.0)) is True
    CloseWindow(test_window)


def test_OptionFlipX_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_bitmap = LoadBitmap("test_bitmap", "test_bitmap.png")
    DrawBitmapWithOptions(test_bitmap, 100.0, 100.0, OptionFlipX())
    RefreshScreen()
    assert PixelDrawnAtPoint(test_bitmap, PointAt(50.0, 100.0)) is True
    assert PixelDrawnAtPoint(test_bitmap, PointAt(150.0, 100.0)) is False
    FreeBitmap(test_bitmap)
    CloseWindow(test_window)


def test_OptionFlipXWithOptions_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_bitmap = LoadBitmap("test_bitmap", "test_bitmap.png")
    DrawBitmapWithOptions(test_bitmap, 400, 300, OptionFlipX(OptionDefaults()))
    RefreshScreen()
    assert PixelDrawnAtPoint(test_bitmap, PointAt(BitmapWidth(test_bitmap), BitmapHeight(test_bitmap))) is True
    assert PixelDrawnAtPoint(test_bitmap, PointAt(0, BitmapHeight(test_bitmap))) is False
    FreeBitmap(test_bitmap)
    CloseWindow(test_window)


def test_OptionFlipXy_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_bitmap = LoadBitmap("test_bitmap", "test_bitmap.png")
    DrawBitmapWithOptions(test_bitmap, 400.0, 300.0, OptionFlipXy())
    RefreshScreen()
    assert PixelDrawnAtPoint(test_bitmap, PointAt(BitmapWidth(test_bitmap), 0.0)) is True
    assert PixelDrawnAtPoint(test_bitmap, PointAt(0.0, BitmapHeight(test_bitmap))) is True
    FreeBitmap(test_bitmap)
    CloseWindow(test_window)


def test_OptionFlipXyWithOptions_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_bitmap = LoadBitmap("test_bitmap", "test_bitmap.png")
    test_options = OptionDefaults()
    test_options_flipped = OptionFlipXy(test_options)
    DrawBitmapWithOptions(test_bitmap, 400, 300, test_options_flipped)
    RefreshScreen()
    assert PixelDrawnAtPoint(test_bitmap, PointAt(BitmapWidth(test_bitmap), 0)) is True
    assert PixelDrawnAtPoint(test_bitmap, PointAt(0, BitmapHeight(test_bitmap))) is False
    FreeBitmap(test_bitmap)
    CloseWindow(test_window)


def test_OptionFlipY_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_bitmap = LoadBitmap("test_bitmap", "test_bitmap.png")
    DrawBitmapWithOptions(test_bitmap, 400.0, 300.0, OptionFlipY())
    RefreshScreen()
    assert PixelDrawnAtPoint(test_bitmap, 400.0, BitmapHeight(test_bitmap)) is True
    assert PixelDrawnAtPoint(test_bitmap, 400.0, 0.0) is False
    FreeBitmap(test_bitmap)
    CloseWindow(test_window)


def test_OptionFlipYWithOptions_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_bitmap = LoadBitmap("test_bitmap", "test_bitmap.png")
    DrawBitmapWithOptions(test_bitmap, 400.0, 300.0, OptionFlipY(OptionDefaults()))
    RefreshScreen()
    assert PixelDrawnAtPoint(test_bitmap, PointAt(400.0, BitmapHeight(test_bitmap))) is True
    assert PixelDrawnAtPoint(test_bitmap, PointAt(400.0, 0.0)) is False
    FreeBitmap(test_bitmap)
    CloseWindow(test_window)


def test_OptionLineWidth_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    DrawLine(ColorBlack(), 100.0, 100.0, 200.0, 200.0, OptionLineWidth(1))
    RefreshScreen()
    assert GetPixel(PointAt(100.0, 100.0)) == ColorBlack()
    DrawLine(ColorBlack(), 300.0, 300.0, 400.0, 400.0, OptionLineWidth(5))
    RefreshScreen()
    assert GetPixel(PointAt(300.0, 300.0)) == ColorBlack()
    CloseWindow(test_window)


def test_OptionLineWidthWithOptions_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_circle = CircleAt(400.0, 300.0, 50.0)
    DrawCircle(ColorBlack(), test_circle, OptionLineWidth(3, OptionDefaults()))
    RefreshScreen()
    assert PointInCircle(PointAt(400.0, 300.0), test_circle) is True
    CloseWindow(test_window)


def test_OptionPartBmp_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_bitmap = LoadBitmap("test_bitmap", "test_bitmap.png")
    test_options = OptionPartBmp(0.0, 0.0, 50.0, 50.0)
    DrawBitmapWithOptions(test_bitmap, 100.0, 100.0, test_options)
    RefreshScreen()
    assert PixelDrawnAtPoint(test_bitmap, PointAt(25.0, 25.0)) is True
    assert PixelDrawnAtPoint(test_bitmap, PointAt(75.0, 75.0)) is False
    FreeBitmap(test_bitmap)
    CloseWindow(test_window)


def test_OptionPartBmpWithOptions_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_bitmap = LoadBitmap("test_bitmap", "test_bitmap.png")
    test_options = OptionPartBmp(10.0, 10.0, 50.0, 50.0, OptionDefaults())
    DrawBitmapWithOptions(test_bitmap, 100.0, 100.0, test_options)
    RefreshScreen()
    assert PixelDrawnAtPoint(test_bitmap, PointAt(110.0, 110.0)) is True
    assert PixelDrawnAtPoint(test_bitmap, PointAt(160.0, 160.0)) is False
    FreeBitmap(test_bitmap)
    CloseWindow(test_window)


def test_OptionPartBmpFromRectangle_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_bitmap = LoadBitmap("test_bitmap", "test_bitmap.png")
    test_rectangle = RectangleFrom(100, 100, 200, 200)
    test_options = OptionPartBmp(test_rectangle)
    DrawBitmapWithOptions(test_bitmap, 0, 0, test_options)
    RefreshScreen()
    assert PixelDrawnAtPoint(test_bitmap, PointAt(150, 150)) is True
    assert PixelDrawnAtPoint(test_bitmap, PointAt(350, 350)) is False
    FreeBitmap(test_bitmap)
    CloseWindow(test_window)


def test_OptionPartBmpFromRectangleWithOptions_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_bitmap = LoadBitmap("test_bitmap", "test_bitmap.png")
    test_rectangle = RectangleFrom(100.0, 100.0, 200.0, 200.0)
    test_options = OptionPartBmp(test_rectangle, OptionDefaults())
    DrawBitmapWithOptions(test_bitmap, 0.0, 0.0, test_options)
    RefreshScreen()
    assert PixelDrawnAtPoint(test_bitmap, PointAt(150.0, 150.0)) is True
    assert PixelDrawnAtPoint(test_bitmap, PointAt(350.0, 350.0)) is False
    FreeBitmap(test_bitmap)
    CloseWindow(test_window)


def test_OptionRotateBmp_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_bitmap = LoadBitmap("test_bitmap", "test_bitmap.png")
    DrawBitmapWithOptions(test_bitmap, 400.0, 300.0, OptionRotateBmp(45.0))
    RefreshScreen()
    assert PixelDrawnAtPoint(test_bitmap, PointAt(400.0, 300.0)) is True
    assert PixelDrawnAtPoint(test_bitmap, PointAt(BitmapWidth(test_bitmap), 300.0)) is False
    FreeBitmap(test_bitmap)
    CloseWindow(test_window)


def test_OptionRotateBmpWithAnchor_integration():
    test_window = OpenWindow("Rotation Test", 800, 600)
    test_bitmap = LoadBitmap("test_bitmap", "test_bitmap.png")
    test_options = OptionRotateBmp(45.0, 50.0, 50.0)
    DrawBitmapWithOptions(test_bitmap, 400.0, 300.0, test_options)
    RefreshScreen()
    assert PixelDrawnAtPoint(test_bitmap, PointAt(400.0, 300.0)) is True
    assert PixelDrawnAtPoint(test_bitmap, PointAt(BitmapWidth(test_bitmap), BitmapHeight(test_bitmap))) is True
    FreeBitmap(test_bitmap)
    CloseWindow(test_window)


def test_OptionRotateBmpWithAnchorAndOptions_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_bitmap = LoadBitmap("test_bitmap", "test_bitmap.png")
    test_options = OptionRotateBmp(45.0, 50.0, 50.0, OptionDefaults())
    DrawBitmapWithOptions(test_bitmap, 400.0, 300.0, test_options)
    RefreshScreen()
    assert PixelDrawnAtPoint(test_bitmap, PointAt(400.0, 300.0)) is True
    FreeBitmap(test_bitmap)
    CloseWindow(test_window)


def test_OptionRotateBmpWithOptions_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_bitmap = LoadBitmap("test_bitmap", "test_bitmap.png")
    test_options = OptionRotateBmp(45.0, OptionDefaults())
    DrawBitmapWithOptions(test_bitmap, 400.0, 300.0, test_options)
    RefreshScreen()
    assert PixelDrawnAtPoint(test_bitmap, PointAt(400.0, 300.0)) is True
    assert PixelDrawnAtPoint(test_bitmap, PointAt(Cosine(45.0), Sine(45.0))) is True
    FreeBitmap(test_bitmap)
    CloseWindow(test_window)


def test_OptionScaleBmp_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_bitmap = LoadBitmap("test_bitmap", "test_bitmap.png")
    DrawBitmapWithOptions(test_bitmap, 100.0, 100.0, OptionScaleBmp(2.0, 2.0))
    RefreshScreen()
    assert PixelDrawnAtPoint(test_bitmap, PointAt(100.0, 100.0)) is True
    assert PixelDrawnAtPoint(test_bitmap, PointAt(BitmapWidth(test_bitmap), BitmapHeight(test_bitmap))) is True
    FreeBitmap(test_bitmap)
    CloseWindow(test_window)


def test_OptionScaleBmpWithOptions_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_bitmap = LoadBitmap("test_bitmap", "test_bitmap.png")
    test_options = OptionScaleBmp(2.0, 2.0, OptionDefaults())
    DrawBitmapWithOptions(test_bitmap, 100.0, 100.0, test_options)
    RefreshScreen()
    assert PixelDrawnAtPoint(test_bitmap, PointAt(100.0, 100.0)) is True
    assert PixelDrawnAtPoint(test_bitmap, PointAt(BitmapWidth(test_bitmap), BitmapHeight(test_bitmap))) is True
    FreeBitmap(test_bitmap)
    CloseWindow(test_window)


def test_OptionToScreen_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_options = OptionToScreen()
    DrawCircle(ColorBlack(), CircleAt(400.0, 300.0, 50.0), test_options)
    RefreshScreen()
    assert PointInCircle(PointAt(400.0, 300.0), CircleAt(400.0, 300.0, 50.0)) is True
    CloseWindow(test_window)


def test_OptionToScreenWithOptions_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_options = OptionDefaults()
    test_screen_options = OptionToScreen(test_options)
    DrawCircle(ColorBlack(), CircleAt(400.0, 300.0, 50.0), test_screen_options)
    RefreshScreen()
    assert PointInCircle(PointAt(400.0, 300.0), CircleAt(400.0, 300.0, 50.0)) is True
    CloseWindow(test_window)


def test_OptionToWorld_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    MoveCameraTo(100.0, 100.0)
    DrawCircle(ColorBlack(), 100.0, 100.0, 50.0, OptionToWorld())
    RefreshScreen()
    assert PointInCircle(PointAt(0.0, 0.0), CircleAt(100.0, 100.0, 50.0)) is True
    CloseWindow(test_window)


def test_OptionToWorldWithOptions_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_options = OptionDefaults()
    test_world_options = OptionToWorld(test_options)
    DrawCircle(ColorBlack(), CircleAt(100.0, 100.0, 50.0), test_world_options)
    RefreshScreen()
    assert PointInCircle(PointAt(100.0, 100.0), CircleAt(100.0, 100.0, 50.0)) is True
    CloseWindow(test_window)


def test_OptionWithAnimation_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_bitmap = CreateBitmap("test_bitmap", 100, 100)
    test_animation = CreateAnimation("script", "test_animation")
    DrawBitmap(test_bitmap, 100, 100, OptionWithAnimation(test_animation))
    DrawBitmap(test_bitmap, 100.0, 100.0, OptionWithAnimation(test_animation))
    RefreshScreen()
    assert PixelDrawnAtPoint(test_bitmap, PointAt(50.0, 50.0)) is True
    FreeBitmap(test_bitmap)
    FreeAnimation(test_animation)
    CloseWindow(test_window)


def test_OptionWithAnimationWithOptions_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_bitmap = LoadBitmap("test_bitmap", "test_bitmap.png")
    test_animation = CreateAnimation("script", "test_animation")
    DrawBitmap(test_bitmap, 100, 100, OptionWithAnimation(test_animation))
    test_options = OptionWithAnimation(test_animation, OptionDefaults())
    DrawBitmap(test_bitmap, 100.0, 100.0, test_options)
    RefreshScreen()
    assert PixelDrawnAtPoint(test_bitmap, PointAt(100.0, 100.0)) is True
    FreeBitmap(test_bitmap)
    FreeAnimation(test_animation)
    CloseWindow(test_window)


def test_OptionWithBitmapCell_integration():
    test_bitmap = LoadBitmap("test_bitmap", "test_bitmap.png")
    BitmapSetCellDetails(test_bitmap, 32, 32, 4, 4, 16)
    test_window = OpenWindow("Test Window", 800, 600)
    DrawBitmapWithOptions(test_bitmap, 100.0, 100.0, OptionWithBitmapCell(5))
    RefreshScreen()
    assert PixelDrawnAtPoint(test_bitmap, PointAt(116.0, 116.0)) is True
    assert PixelDrawnAtPoint(test_bitmap, PointAt(150.0, 150.0)) is False
    CloseWindow(test_window)
    FreeBitmap(test_bitmap)


def test_OptionWithBitmapCellWithOptions_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_bitmap = LoadBitmap("test_bitmap", "test_bitmap.png")
    BitmapSetCellDetails(test_bitmap, 32, 32, 4, 4, 16)
    test_options = OptionWithBitmapCell(5, OptionDefaults())
    DrawBitmap(test_bitmap, 100.0, 100.0, test_options)
    RefreshScreen()
    assert PixelDrawnAtPoint(test_bitmap, PointAt(116.0, 116.0)) is True
    assert PixelDrawnAtPoint(test_bitmap, PointAt(150.0, 150.0)) is False
    FreeBitmap(test_bitmap)
    CloseWindow(test_window)


def test_DrawEllipseWithinRectangle_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_rectangle = RectangleFrom(100.0, 100.0, 200.0, 150.0)
    DrawEllipse(ColorBlack(), test_rectangle, OptionDefaults())
    RefreshScreen()
    assert PointInCircle(PointAt(200.0, 175.0), CircleAt(RectangleCenter(test_rectangle), test_rectangle.width)) is True
    assert PointInCircle(PointAt(350.0, 175.0), CircleAt(RectangleCenter(test_rectangle), test_rectangle.width)) is False
    CloseWindow(test_window)


def test_DrawEllipseWithinRectangleWithOptions_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_rectangle = RectangleFrom(100.0, 100.0, 200.0, 100.0)
    DrawEllipse(ColorBlack(), test_rectangle, OptionDefaults())
    RefreshScreen()
    assert PointInCircle(PointAt(200.0, 150.0), CircleAt(RectangleCenter(test_rectangle), test_rectangle.width)) is True
    CloseWindow(test_window)


def test_DrawEllipse_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    DrawEllipse(ColorBlack(), 400.0, 300.0, 100.0, 50.0)
    RefreshScreen()
    assert PointInCircle(PointAt(400.0, 300.0), CircleAt(400.0, 300.0, 50.0)) is True
    assert PointInCircle(PointAt(550.0, 300.0), CircleAt(400.0, 300.0, 50.0)) is False
    CloseWindow(test_window)


def test_DrawEllipseWithOptions_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    DrawEllipse(ColorBlack(), 400.0, 300.0, 100.0, 50.0, OptionDefaults())
    RefreshScreen()
    assert PointInCircle(PointAt(400.0, 300.0), CircleAt(400.0, 300.0, 50.0)) is True
    CloseWindow(test_window)


def test_DrawEllipseOnBitmapWithinRectangle_integration():
    test_bitmap = CreateBitmap("test_bitmap", 200, 200)
    test_rectangle = RectangleFrom(50.0, 50.0, 100.0, 100.0)
    DrawEllipseOnBitmap(test_bitmap, ColorBlack(), test_rectangle)
    assert PixelDrawnAtPoint(test_bitmap, PointAt(100.0, 100.0)) is True
    assert PixelDrawnAtPoint(test_bitmap, PointAt(200.0, 200.0)) is False
    FreeBitmap(test_bitmap)


def test_DrawEllipseOnBitmapWithinRectangleWithOptions_integration():
    test_bitmap = CreateBitmap("test_bitmap", 200, 200)
    test_rect = RectangleFrom(50.0, 50.0, 100.0, 100.0)
    DrawEllipseOnBitmap(test_bitmap, ColorBlack(), test_rect, OptionDefaults())
    assert PixelDrawnAtPoint(test_bitmap, PointAt(75.0, 75.0)) is True
    assert PixelDrawnAtPoint(test_bitmap, PointAt(0.0, 0.0)) is False
    FreeBitmap(test_bitmap)


def test_DrawEllipseOnBitmap_integration():
    test_bitmap = CreateBitmap("test_bitmap", 200, 200)
    test_color = ColorBlack()
    DrawEllipseOnBitmap(test_bitmap, test_color, 100.0, 100.0, 50.0, 30.0)
    assert PixelDrawnAtPoint(test_bitmap, 100.0, 100.0) is True
    assert PixelDrawnAtPoint(test_bitmap, 160.0, 100.0) is False
    FreeBitmap(test_bitmap)


def test_DrawEllipseOnBitmapWithOptions_integration():
    test_bitmap = CreateBitmap("test_bitmap", 200, 200)
    DrawEllipseOnBitmap(test_bitmap, ColorBlack(), 100.0, 100.0, 50.0, 30.0, OptionDefaults())
    assert PixelDrawnAtPoint(test_bitmap, PointAt(100.0, 100.0)) is True
    assert PixelDrawnAtPoint(test_bitmap, PointAt(150.0, 100.0)) is False
    FreeBitmap(test_bitmap)


def test_DrawEllipseOnWindowWithinRectangle_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_rectangle = RectangleFrom(100.0, 100.0, 200.0, 100.0)
    DrawEllipseOnWindow(test_window, ColorBlack(), test_rectangle)
    RefreshScreen()
    assert PointInCircle(PointAt(200.0, 150.0), CircleAt(RectangleCenter(test_rectangle), test_rectangle.width)) is True
    CloseWindow(test_window)


def test_DrawEllipseOnWindowWithinRectangleWithOptions_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_rect = RectangleFrom(100.0, 100.0, 200.0, 100.0)
    DrawEllipseOnWindow(test_window, ColorBlack(), test_rect, OptionDefaults())
    RefreshScreen()
    assert PointInCircle(PointAt(200.0, 150.0), CircleAt(PointAt(200.0, 150.0), 100.0)) is True
    CloseWindow(test_window)


def test_DrawEllipseOnWindow_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    DrawEllipseOnWindow(test_window, ColorBlack(), 400.0, 300.0, 100.0, 50.0)
    RefreshScreen()
    assert PointInCircle(PointAt(400.0, 300.0), CircleAt(400.0, 300.0, 50.0)) is True
    CloseWindow(test_window)


def test_DrawEllipseOnWindowWithOptions_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    DrawEllipseOnWindow(test_window, ColorBlack(), 400.0, 300.0, 100.0, 50.0, OptionDefaults())
    RefreshScreen()
    assert PointInCircle(PointAt(400.0, 300.0), CircleAt(400.0, 300.0, 50.0)) is True
    CloseWindow(test_window)


def test_FillEllipseWithinRectangle_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_rectangle = RectangleFrom(100.0, 100.0, 200.0, 100.0)
    FillEllipse(ColorBlack(), test_rectangle)
    RefreshScreen()
    assert PointInCircle(PointAt(200.0, 150.0), CircleAt(RectangleCenter(test_rectangle), test_rectangle.width)) is True
    assert PointInCircle(PointAt(350.0, 150.0), CircleAt(RectangleCenter(test_rectangle), test_rectangle.width)) is False
    CloseWindow(test_window)


def test_FillEllipseWithinRectangleWithOptions_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_rectangle = RectangleFrom(100.0, 100.0, 200.0, 100.0)
    FillEllipse(ColorBlack(), test_rectangle, OptionDefaults())
    RefreshScreen()
    assert PointInCircle(PointAt(200.0, 150.0), CircleAt(RectangleCenter(test_rectangle), test_rectangle.width)) is True
    CloseWindow(test_window)


def test_FillEllipse_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    FillEllipse(ColorBlack(), 400.0, 300.0, 100.0, 50.0)
    RefreshScreen()
    assert PointInCircle(PointAt(400.0, 300.0), CircleAt(400.0, 300.0, 50.0)) is True
    assert PointInCircle(PointAt(550.0, 300.0), CircleAt(400.0, 300.0, 50.0)) is False
    CloseWindow(test_window)


def test_FillEllipseWithOptions_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    FillEllipse(ColorBlack(), 400.0, 300.0, 100.0, 50.0, OptionDefaults())
    RefreshScreen()
    assert PointInCircle(PointAt(400.0, 300.0), CircleAt(400.0, 300.0, 50.0)) is True
    CloseWindow(test_window)


def test_FillEllipseOnBitmapWithinRectangle_integration():
    test_bitmap = CreateBitmap("test_bitmap", 200, 200)
    test_rectangle = RectangleFrom(50.0, 50.0, 100.0, 100.0)
    FillEllipseOnBitmap(test_bitmap, ColorBlack(), test_rectangle)
    assert PixelDrawnAtPoint(test_bitmap, PointAt(100.0, 100.0)) is True
    assert PixelDrawnAtPoint(test_bitmap, PointAt(200.0, 200.0)) is False
    FreeBitmap(test_bitmap)


def test_FillEllipseOnBitmapWithinRectangleWithOptions_integration():
    test_bitmap = CreateBitmap("test_bitmap", 200, 200)
    test_rect = RectangleFrom(50.0, 50.0, 100.0, 100.0)
    FillEllipseOnBitmap(test_bitmap, ColorBlack(), test_rect, OptionDefaults())
    assert PixelDrawnAtPoint(test_bitmap, PointAt(100.0, 100.0)) is True
    assert PixelDrawnAtPoint(test_bitmap, PointAt(200.0, 100.0)) is False
    FreeBitmap(test_bitmap)


def test_FillEllipseOnBitmap_integration():
    test_bitmap = CreateBitmap("test_bitmap", 200, 200)
    FillEllipseOnBitmap(test_bitmap, ColorBlack(), 100.0, 100.0, 50.0, 30.0)
    assert PixelDrawnAtPoint(test_bitmap, 100.0, 100.0) is True
    assert PixelDrawnAtPoint(test_bitmap, 125.0, 100.0) is True
    assert PixelDrawnAtPoint(test_bitmap, 150.0, 100.0) is False
    FreeBitmap(test_bitmap)


def test_FillEllipseOnBitmapWithOptions_integration():
    test_bitmap = CreateBitmap("test_bitmap", 200, 200)
    FillEllipseOnBitmap(test_bitmap, ColorBlack(), 50.0, 50.0, 100.0, 50.0, OptionDefaults())
    assert PixelDrawnAtPoint(test_bitmap, 50.0, 50.0) is True
    assert PixelDrawnAtPoint(test_bitmap, 150.0, 50.0) is False
    FreeBitmap(test_bitmap)


def test_FillEllipseOnWindowWithinRectangle_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_rectangle = RectangleFrom(100.0, 100.0, 200.0, 150.0)
    FillEllipseOnWindow(test_window, ColorBlack(), test_rectangle)
    RefreshScreen()
    assert PointInCircle(PointAt(200.0, 175.0), CircleAt(RectangleCenter(test_rectangle), test_rectangle.width)) is True
    CloseWindow(test_window)


def test_FillEllipseOnWindowWithinRectangleWithOptions_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_rectangle = RectangleFrom(100.0, 100.0, 200.0, 150.0)
    FillEllipseOnWindow(test_window, ColorBlack(), test_rectangle, OptionDefaults())
    RefreshScreen()
    assert PointInCircle(PointAt(200.0, 175.0), CircleAt(200.0, 175.0, 100.0)) is True
    CloseWindow(test_window)


def test_FillEllipseOnWindow_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    FillEllipseOnWindow(test_window, ColorBlack(), 400.0, 300.0, 100.0, 50.0)
    RefreshScreen()
    assert PointInCircle(PointAt(400.0, 300.0), CircleAt(400.0, 300.0, 50.0)) is True
    CloseWindow(test_window)


def test_FillEllipseOnWindowWithOptions_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    FillEllipseOnWindow(test_window, ColorBlack(), 400.0, 300.0, 100.0, 50.0, OptionDefaults())
    RefreshScreen()
    assert PointInCircle(PointAt(400.0, 300.0), CircleAt(400.0, 300.0, 50.0)) is True
    CloseWindow(test_window)


def test_ClearScreenToWhite_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    DrawPixel(ColorBlack(), 100.0, 100.0)
    RefreshScreen()
    assert GetPixel(PointAt(100.0, 100.0)) == ColorBlack()
    ClearScreen()
    RefreshScreen()
    assert GetPixel(PointAt(100.0, 100.0)) != ColorBlack()
    CloseWindow(test_window)


def test_ClearScreen_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    DrawPixel(ColorBlack(), 100.0, 100.0)
    RefreshScreen()
    assert GetPixel(PointAt(400.0, 300.0)) == ColorBlack()
    ClearScreen(ColorWhite())
    RefreshScreen()
    assert GetPixel(PointAt(400.0, 300.0)) != ColorBlack()
    CloseWindow(test_window)


def test_DisplayDetails_integration():
    test_number_of_displays = NumberOfDisplays()
if assert test_number_of_displays > 0
:
        test_display = DisplayDetails(0)
        assert test_display is not None
        assert DisplayWidth(test_display) > 0
        assert DisplayHeight(test_display) > 0

    else:
        assert test_number_of_displays == 0



def test_DisplayHeight_integration():
    test_display = DisplayDetails(0)
    test_height = DisplayHeight(test_display)
    assert test_height > 0


def test_DisplayName_integration():
    test_display = DisplayDetails(0)
    test_display_name = DisplayName(test_display)
    assert test_display_name is not None


def test_DisplayWidth_integration():
    test_display = DisplayDetails(0)
    test_width = DisplayWidth(test_display)
    assert test_width > 0


def test_DisplayX_integration():
    test_display = DisplayDetails(0)
    test_x = DisplayX(test_display)
    assert test_x > -1


def test_DisplayY_integration():
    test_display = DisplayDetails(0)
    test_y = DisplayY(test_display)
    assert test_y != -1


def test_NumberOfDisplays_integration():
    test_display_count = NumberOfDisplays()
    assert test_display_count > 0


def test_RefreshScreen_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    DrawCircle(ColorBlack(), CircleAt(400.0, 300.0, 50.0))
    RefreshScreen()
    assert PointInCircle(PointAt(400.0, 300.0), CircleAt(400.0, 300.0, 50.0)) is True
    CloseWindow(test_window)


def test_RefreshScreenWithTargetFps_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    RefreshScreen(60)
    assert WindowCloseRequested(test_window) is True
    CloseWindow(test_window)


def test_SaveBitmap_integration():
    test_bitmap = CreateBitmap("test_bitmap", 100, 100)
    DrawPixelOnBitmap(test_bitmap, ColorBlack(), 50, 50)
    SaveBitmap(test_bitmap, "test_save")
    FreeBitmap(test_bitmap)


def test_ScreenHeight_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_height = ScreenHeight()
    assert test_height == 600
    CloseWindow(test_window)


def test_ScreenWidth_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_width = ScreenWidth()
    assert test_width == 800
    CloseWindow(test_window)


def test_TakeScreenshot_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    DrawCircle(ColorBlack(), 400, 300, 50)
    RefreshScreen()
    TakeScreenshot("screenshot_test")
    CloseWindow(test_window)


def test_TakeScreenshotOfWindow_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    DrawCircle(ColorBlack(), 400, 300, 50)
    RefreshScreen()
    TakeScreenshot(test_window, "screenshot_test")
    CloseWindow(test_window)


def test_BitmapBoundingCircle_integration():
    test_bitmap = CreateBitmap("test_bitmap", 100, 100)
    test_point = PointAt(50.0, 50.0)
    test_circle = BitmapBoundingCircle(test_bitmap, test_point)
    assert CircleRadius(test_circle) == 50.0
    assert CenterPoint(test_circle) == test_point
    FreeBitmap(test_bitmap)


def test_BitmapBoundingRectangle_integration():
    test_bitmap = CreateBitmap("test_bitmap", 100, 100)
    test_rectangle = BitmapBoundingRectangle(test_bitmap)
    assert test_rectangle.width == BitmapWidth(test_bitmap)
    assert test_rectangle.height == BitmapHeight(test_bitmap)
    FreeBitmap(test_bitmap)


def test_BitmapBoundingRectangleAtLocation_integration():
    test_bitmap = CreateBitmap("test_bitmap", 100, 100)
    test_rectangle = BitmapBoundingRectangleAtLocation(test_bitmap, 50.0, 50.0)
    assert RectangleLeft(test_rectangle) == 50.0
    assert RectangleTop(test_rectangle) == 50.0
    assert RectangleRight(test_rectangle) == 150.0
    assert RectangleBottom(test_rectangle) == 150.0
    FreeBitmap(test_bitmap)


def test_BitmapCellCenter_integration():
    test_bitmap = CreateBitmap("test_bitmap", 100, 100)
    test_center = BitmapCellCenter(test_bitmap)
    assert test_center.x == 50.0
    assert test_center.y == 50.0
    FreeBitmap(test_bitmap)


def test_BitmapCellCircle_integration():
    test_bitmap = CreateBitmap("test_bitmap", 100, 100)
    test_circle = BitmapCellCircle(test_bitmap, 50.0, 50.0)
    assert CircleRadius(test_circle) == 50.0
    assert CircleX(test_circle) == 50.0
    assert CircleY(test_circle) == 50.0
    FreeBitmap(test_bitmap)


def test_BitmapCellCircleAtPoint_integration():
    test_bitmap = CreateBitmap("test_bitmap", 100, 100)
    BitmapSetCellDetails(test_bitmap, 50, 50, 2, 2, 4)
    test_circle = BitmapCellCircleAtPoint(test_bitmap, PointAt(100, 100))
    assert CircleX(test_circle) == 125
    assert CircleY(test_circle) == 125
    assert CircleRadius(test_circle) == 25
    FreeBitmap(test_bitmap)


def test_BitmapCellCircleAtPointWithScale_integration():
    test_bitmap = CreateBitmap("test_bitmap", 100, 100)
    BitmapSetCellDetails(test_bitmap, 50, 50, 2, 2, 4)
    test_circle = BitmapCellCircleAtPointWithScale(test_bitmap, PointAt(100.0, 100.0), 2.0)
    assert CircleRadius(test_circle) == 50.0
    FreeBitmap(test_bitmap)


def test_BitmapCellColumns_integration():
    test_bitmap = CreateBitmap("test_bitmap", 100, 100)
    BitmapSetCellDetails(test_bitmap, 20, 20, 5, 5, 25)
    assert BitmapCellColumns(test_bitmap) == 5
    FreeBitmap(test_bitmap)


def test_BitmapCellCount_integration():
    test_bitmap = CreateBitmap("test_bitmap", 100, 100)
    BitmapSetCellDetails(test_bitmap, 20, 20, 5, 5, 25)
    assert BitmapCellCount(test_bitmap) == 25
    FreeBitmap(test_bitmap)


def test_BitmapCellHeight_integration():
    test_bitmap = CreateBitmap("test_bitmap", 100, 100)
    BitmapSetCellDetails(test_bitmap, 20, 20, 5, 5, 25)
    assert BitmapCellHeight(test_bitmap) == 20
    FreeBitmap(test_bitmap)


def test_BitmapCellOffset_integration():
    test_bitmap = CreateBitmap("test_bitmap", 100, 100)
    BitmapSetCellDetails(test_bitmap, 25, 25, 4, 4, 16)
    test_offset = BitmapCellOffset(test_bitmap, 5)
    assert test_offset.x == 75
    assert test_offset.y == 0
    FreeBitmap(test_bitmap)


def test_BitmapCellRectangle_integration():
    test_bitmap = CreateBitmap("test_bitmap", 100, 100)
    BitmapSetCellDetails(test_bitmap, 25, 25, 4, 4, 16)
    test_rectangle = BitmapCellRectangle(test_bitmap)
    assert test_rectangle.width == 25
    assert test_rectangle.height == 25
    FreeBitmap(test_bitmap)


def test_BitmapCellRectangleAtPoint_integration():
    test_bitmap = CreateBitmap("test_bitmap", 100, 100)
    BitmapSetCellDetails(test_bitmap, 25, 25, 4, 4, 16)
    test_rectangle = BitmapCellRectangleAtPoint(test_bitmap, PointAt(50.0, 50.0))
    assert RectangleLeft(test_rectangle) == 50.0
    assert RectangleTop(test_rectangle) == 50.0
    assert RectangleRight(test_rectangle) == 75.0
    assert RectangleBottom(test_rectangle) == 75.0
    FreeBitmap(test_bitmap)


def test_BitmapCellRows_integration():
    test_bitmap = CreateBitmap("test_bitmap", 100, 100)
    BitmapSetCellDetails(test_bitmap, 20, 20, 5, 5, 25)
    assert BitmapCellRows(test_bitmap) == 5
    FreeBitmap(test_bitmap)


def test_BitmapCellWidth_integration():
    test_bitmap = CreateBitmap("test_bitmap", 100, 100)
    BitmapSetCellDetails(test_bitmap, 25, 25, 4, 4, 16)
    assert BitmapCellWidth(test_bitmap) == 25
    FreeBitmap(test_bitmap)


def test_BitmapCenter_integration():
    test_bitmap = CreateBitmap("test_bitmap", 100, 100)
    test_center = BitmapCenter(test_bitmap)
    assert test_center.x == 50.0
    assert test_center.y == 50.0
    FreeBitmap(test_bitmap)


def test_BitmapFilename_integration():
    test_bitmap = CreateBitmap("test_bitmap", 100, 100)
    test_filename = BitmapFilename(test_bitmap)
    assert test_filename == ""
    FreeBitmap(test_bitmap)


def test_BitmapHeight_integration():
    test_bitmap = CreateBitmap("test_bitmap", 100, 100)
    test_height = BitmapHeight(test_bitmap)
    assert test_height == 100
    FreeBitmap(test_bitmap)


def test_BitmapHeightOfBitmapNamed_integration():
    test_bitmap = CreateBitmap("test_bitmap", 100, 100)
    assert BitmapHeightOfBitmapNamed("test_bitmap") == 100
    FreeBitmap(test_bitmap)


def test_BitmapName_integration():
    test_bitmap = CreateBitmap("test_bitmap", 100, 100)
    test_bitmap_name = BitmapName(test_bitmap)
    assert test_bitmap_name == "test_bitmap"
    FreeBitmap(test_bitmap)


def test_BitmapNamed_integration():
    test_bitmap = LoadBitmap("test_bitmap", "test_bitmap.png")
    test_named_bitmap = BitmapNamed("test_bitmap")
    assert test_named_bitmap is not None
    test_nonexistent_bitmap = BitmapNamed("nonexistent_bitmap")
    assert test_nonexistent_bitmap is None
    FreeAllBitmaps()


def test_BitmapRectangleOfCell_integration():
    test_bitmap = CreateBitmap("test_bitmap", 100, 100)
    BitmapSetCellDetails(test_bitmap, 25, 25, 4, 4, 16)
    test_rectangle = BitmapRectangleOfCell(test_bitmap, 5)
    assert RectangleLeft(test_rectangle) == 0
    assert RectangleTop(test_rectangle) == 75
    assert RectangleRight(test_rectangle) == 25
    assert RectangleBottom(test_rectangle) == 100
    FreeBitmap(test_bitmap)


def test_BitmapSetCellDetails_integration():
    test_bitmap = CreateBitmap("test_bitmap", 100, 100)
    BitmapSetCellDetails(test_bitmap, 20, 20, 5, 5, 25)
    assert BitmapCellWidth(test_bitmap) == 20
    assert BitmapCellHeight(test_bitmap) == 20
    assert BitmapCellColumns(test_bitmap) == 5
    assert BitmapCellRows(test_bitmap) == 5
    assert BitmapCellCount(test_bitmap) == 25
    FreeBitmap(test_bitmap)


def test_BitmapValid_integration():
    test_bitmap = CreateBitmap("test_bitmap", 100, 100)
    assert BitmapValid(test_bitmap) is True
    FreeBitmap(test_bitmap)
    assert BitmapValid(test_bitmap) is False


def test_BitmapWidth_integration():
    test_bitmap = CreateBitmap("test_bitmap", 100, 100)
    test_width = BitmapWidth(test_bitmap)
    assert test_width == 100
    FreeBitmap(test_bitmap)


def test_BitmapWidthOfBitmapNamed_integration():
    test_bitmap = CreateBitmap("test_bitmap", 100, 100)
    test_window = OpenWindow("Test Window", 800, 600)
    DrawBitmap(BitmapNamed("test_bitmap"), 100, 100)
    RefreshScreen()
    assert BitmapWidthOfBitmapNamed("test_bitmap") == 100
    FreeBitmap(test_bitmap)
    CloseWindow(test_window)


def test_ClearBitmap_integration():
    test_bitmap = CreateBitmap("test_bitmap", 100, 100)
    DrawPixelOnBitmap(test_bitmap, ColorBlack(), 50, 50)
    ClearBitmap(test_bitmap, ColorWhite())
    assert PixelDrawnAtPoint(test_bitmap, 50, 50) is False
    FreeBitmap(test_bitmap)


def test_ClearBitmapNamed_integration():
    test_bitmap = CreateBitmap("test_bitmap", 100, 100)
    test_window = OpenWindow("Test Window", 800, 600)
    DrawBitmap(test_bitmap, 100.0, 100.0)
    RefreshScreen()
    assert PixelDrawnAtPoint(test_bitmap, 50.0, 50.0) is True
    ClearBitmapNamed("test_bitmap", ColorWhite())
    RefreshScreen()
    assert PixelDrawnAtPoint(test_bitmap, 50.0, 50.0) is False
    CloseWindow(test_window)
    FreeBitmap(test_bitmap)


def test_CreateBitmap_integration():
    test_bitmap = CreateBitmap("test_bitmap", 100, 100)
    assert test_bitmap is not None
    assert BitmapWidth(test_bitmap) == 100
    assert BitmapHeight(test_bitmap) == 100
    FreeBitmap(test_bitmap)


def test_DrawBitmap_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_bitmap = CreateBitmap("test_bitmap", 100, 100)
    DrawBitmap(test_bitmap, 100.0, 100.0)
    RefreshScreen()
    assert PixelDrawnAtPoint(test_bitmap, PointAt(50.0, 50.0)) is True
    assert PixelDrawnAtPoint(test_bitmap, PointAt(BitmapWidth(test_bitmap), BitmapHeight(test_bitmap))) is False
    FreeBitmap(test_bitmap)
    CloseWindow(test_window)


def test_DrawBitmapWithOptions_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_bitmap = CreateBitmap("test_bitmap", 100, 100)
    DrawBitmapWithOptions(test_bitmap, 100.0, 100.0, OptionDefaults())
    RefreshScreen()
    assert PixelDrawnAtPoint(test_bitmap, PointAt(50.0, 50.0)) is True
    assert PixelDrawnAtPoint(test_bitmap, PointAt(150.0, 100.0)) is False
    FreeBitmap(test_bitmap)
    CloseWindow(test_window)


def test_DrawBitmapNamed_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_bitmap = CreateBitmap("test_bitmap", 100, 100)
    DrawBitmapNamed("test_bitmap", 100.0, 100.0)
    RefreshScreen()
    assert PixelDrawnAtPoint(BitmapNamed("test_bitmap"), 50.0, 50.0) is True
    assert PixelDrawnAtPoint(BitmapNamed("test_bitmap"), BitmapWidth(BitmapNamed("test_bitmap")), BitmapHeight(BitmapNamed("test_bitmap"))) is False
    FreeAllBitmaps()
    CloseWindow(test_window)


def test_DrawBitmapNamedWithOptions_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_bitmap = CreateBitmap("test_bitmap", 100, 100)
    DrawBitmap("test_bitmap", 100.0, 100.0, OptionDefaults())
    RefreshScreen()
    assert PixelDrawnAtPoint(test_bitmap, PointAt(50.0, 50.0)) is True
    assert PixelDrawnAtPoint(test_bitmap, PointAt(150.0, 150.0)) is False
    FreeBitmap(test_bitmap)
    CloseWindow(test_window)


def test_DrawBitmapOnBitmapOnBitmap_integration():
    test_destination = CreateBitmap("test_destination", 100, 100)
    test_source = CreateBitmap("test_source", 50, 50)
    DrawBitmapOnBitmapOnBitmap(test_destination, test_source, 25.0, 25.0)
    assert PixelDrawnAtPoint(test_destination, PointAt(50.0, 50.0)) is True
    assert PixelDrawnAtPoint(test_destination, PointAt(75.0, 75.0)) is False
    FreeBitmap(test_destination)
    FreeBitmap(test_source)


def test_DrawBitmapOnBitmapOnBitmapWithOptions_integration():
    test_destination = CreateBitmap("test_destination", 100, 100)
    test_source = CreateBitmap("test_source", 50, 50)
    DrawPixelOnBitmap(test_source, ColorBlack(), PointAt(25.0, 25.0))
    DrawBitmapOnBitmapOnBitmapWithOptions(test_destination, test_source, 25.0, 25.0, OptionDefaults())
    assert PixelDrawnAtPoint(test_destination, PointAt(25.0, 25.0)) is True
    assert PixelDrawnAtPoint(test_destination, PointAt(75.0, 75.0)) is False
    FreeBitmap(test_destination)
    FreeBitmap(test_source)


def test_DrawBitmapOnWindow_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_bitmap = CreateBitmap("test_bitmap", 100, 100)
    DrawBitmapOnWindow(test_window, test_bitmap, 100.0, 100.0)
    RefreshScreen()
    assert PixelDrawnAtPoint(test_bitmap, PointAt(50.0, 50.0)) is True
    assert PixelDrawnAtPoint(test_bitmap, PointAt(150.0, 150.0)) is False
    FreeBitmap(test_bitmap)
    CloseWindow(test_window)


def test_DrawBitmapOnWindowWithOptions_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_bitmap = CreateBitmap("test_bitmap", 100, 100)
    DrawBitmapOnWindowWithOptions(test_window, test_bitmap, 100.0, 100.0, OptionDefaults())
    RefreshScreen()
    assert PixelDrawnAtPoint(test_bitmap, PointAt(50.0, 50.0)) is True
    assert PixelDrawnAtPoint(test_bitmap, PointAt(150.0, 100.0)) is False
    FreeBitmap(test_bitmap)
    CloseWindow(test_window)


def test_FreeAllBitmaps_integration():
    test_bitmap_1 = CreateBitmap("test_bitmap_1", 100, 100)
    test_bitmap_2 = CreateBitmap("test_bitmap_2", 100, 100)
    FreeAllBitmaps()
    assert BitmapValid(test_bitmap_1) is False
    assert BitmapValid(test_bitmap_2) is False


def test_FreeBitmap_integration():
    test_bitmap = CreateBitmap("test_bitmap", 100, 100)
    FreeBitmap(test_bitmap)
    assert BitmapValid(test_bitmap) is False


def test_HasBitmap_integration():
    test_bitmap = CreateBitmap("test_bitmap", 100, 100)
    assert HasBitmap("test_bitmap") is True
    FreeBitmap(test_bitmap)
    assert HasBitmap("test_bitmap") is False


def test_LoadBitmap_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_bitmap = LoadBitmap("test_bitmap", "test_bitmap.png")
    DrawBitmap(test_bitmap, 100.0, 100.0)
    RefreshScreen()
    assert PixelDrawnAtPoint(test_bitmap, PointAt(100.0, 100.0)) is True
    assert PixelDrawnAtPoint(test_bitmap, PointAt(BitmapWidth(test_bitmap), BitmapHeight(test_bitmap))) is False
    FreeBitmap(test_bitmap)
    CloseWindow(test_window)


def test_PixelDrawnAtPointPt_integration():
    test_bitmap = CreateBitmap("test_bitmap", 100, 100)
    DrawPixelOnBitmap(test_bitmap, ColorBlack(), PointAt(50.0, 50.0))
    assert PixelDrawnAtPointPt(test_bitmap, PointAt(50.0, 50.0)) is True
    assert PixelDrawnAtPointPt(test_bitmap, PointAt(75.0, 75.0)) is False
    FreeBitmap(test_bitmap)


def test_PixelDrawnAtPoint_integration():
    test_bitmap = CreateBitmap("test_bitmap", 100, 100)
    DrawPixelOnBitmap(test_bitmap, ColorBlack(), 50.0, 50.0)
    assert PixelDrawnAtPoint(test_bitmap, 50.0, 50.0) is True
    assert PixelDrawnAtPoint(test_bitmap, 75.0, 75.0) is False
    FreeBitmap(test_bitmap)


def test_PixelDrawnAtPointInCellPt_integration():
    test_bitmap = CreateBitmap("test_bitmap", 100, 100)
    DrawPixelOnBitmap(test_bitmap, ColorBlack(), PointAt(50.0, 50.0))
    BitmapSetCellDetails(test_bitmap, 100, 100, 1, 1, 1)
    assert PixelDrawnAtPoint(test_bitmap, 0, PointAt(50.0, 50.0)) is True
    assert PixelDrawnAtPoint(test_bitmap, 0, PointAt(75.0, 50.0)) is False
    FreeBitmap(test_bitmap)


def test_PixelDrawnAtPointInCell_integration():
    test_bitmap = CreateBitmap("test_bitmap", 100, 100)
    DrawPixel(ColorBlack(), PointAt(50.0, 50.0))
    test_window = OpenWindow("Test Window", 800, 600)
    DrawBitmap(test_bitmap, 100.0, 100.0)
    RefreshScreen()
    assert PixelDrawnAtPointInCell(test_bitmap, 0, PointAt(50.0, 50.0)) is True
    assert PixelDrawnAtPointInCell(test_bitmap, 0, PointAt(75.0, 75.0)) is False
    FreeBitmap(test_bitmap)
    CloseWindow(test_window)


def test_SetupCollisionMask_integration():
    test_bitmap = CreateBitmap("test_bitmap", 100, 100)
    SetupCollisionMask(test_bitmap)
    test_pixel_drawn = PixelDrawnAtPoint(test_bitmap, PointAt(50, 50))
    assert test_pixel_drawn is True
    FreeBitmap(test_bitmap)


def test_DrawLineRecord_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_line = LineFrom(PointAt(100.0, 100.0), PointAt(200.0, 200.0))
    DrawLine(ColorBlack(), test_line)
    RefreshScreen()
    assert GetPixel(PointAt(100.0, 100.0)) == ColorBlack()
    assert GetPixel(PointAt(99.0, 99.0)) != ColorBlack()
    CloseWindow(test_window)


def test_DrawLineRecordWithOptions_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_line = LineFrom(PointAt(100.0, 100.0), PointAt(200.0, 200.0))
    DrawLineRecordWithOptions(ColorBlack(), test_line, OptionLineWidth(3, OptionDefaults()))
    RefreshScreen()
    assert GetPixel(PointAt(100.0, 100.0)) == ColorBlack()
    assert GetPixel(PointAt(99.0, 99.0)) != ColorBlack()
    CloseWindow(test_window)


def test_DrawLinePointToPoint_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    DrawLinePointToPoint(ColorBlack(), PointAt(100.0, 100.0), PointAt(200.0, 200.0))
    RefreshScreen()
    assert GetPixel(PointAt(100.0, 100.0)) == ColorBlack()
    assert GetPixel(PointAt(99.0, 99.0)) != ColorBlack()
    CloseWindow(test_window)


def test_DrawLinePointToPointWithOptions_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    DrawLinePointToPointWithOptions(ColorBlack(), PointAt(100.0, 100.0), PointAt(200.0, 200.0), OptionDefaults())
    RefreshScreen()
    assert GetPixel(PointAt(100.0, 100.0)) == ColorBlack()
    assert GetPixel(PointAt(99.0, 99.0)) != ColorBlack()
    CloseWindow(test_window)


def test_DrawLine_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    DrawLine(ColorBlack(), 100.0, 100.0, 200.0, 200.0)
    RefreshScreen()
    assert GetPixel(PointAt(100.0, 100.0)) == ColorBlack()
    assert GetPixel(PointAt(99.0, 99.0)) != ColorBlack()
    CloseWindow(test_window)


def test_DrawLineWithOptions_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    DrawLineWithOptions(ColorBlack(), 100.0, 100.0, 200.0, 200.0, OptionDefaults())
    RefreshScreen()
    assert GetPixel(PointAt(100.0, 100.0)) == ColorBlack()
    assert GetPixel(PointAt(99.0, 99.0)) != ColorBlack()
    CloseWindow(test_window)


def test_DrawLineOnBitmapRecord_integration():
    test_bitmap = CreateBitmap("test_bitmap", 100, 100)
    test_line = LineFrom(PointAt(10.0, 10.0), PointAt(90.0, 90.0))
    DrawLineOnBitmap(test_bitmap, ColorBlack(), test_line)
    assert PixelDrawnAtPoint(test_bitmap, PointAt(50.0, 50.0)) is True
    assert PixelDrawnAtPoint(test_bitmap, PointAt(100.0, 100.0)) is False
    FreeBitmap(test_bitmap)


def test_DrawLineOnBitmapRecordWithOptions_integration():
    test_bitmap = CreateBitmap("test_bitmap", 100, 100)
    test_line = LineFrom(PointAt(10.0, 10.0), PointAt(90.0, 90.0))
    DrawLineOnBitmap(test_bitmap, ColorBlack(), test_line, OptionDefaults())
    assert PixelDrawnAtPoint(test_bitmap, PointAt(50.0, 50.0)) is True
    assert PixelDrawnAtPoint(test_bitmap, PointAt(95.0, 50.0)) is False
    FreeBitmap(test_bitmap)


def test_DrawLineOnBitmapPointToPoint_integration():
    test_bitmap = CreateBitmap("test_bitmap", 100, 100)
    DrawLineOnBitmap(test_bitmap, ColorBlack(), PointAt(10.0, 10.0), PointAt(90.0, 90.0))
    assert PixelDrawnAtPoint(test_bitmap, 50.0, 50.0) is True
    assert PixelDrawnAtPoint(test_bitmap, 0.0, 0.0) is False
    FreeBitmap(test_bitmap)


def test_DrawLineOnBitmapPointToPointWithOptions_integration():
    test_bitmap = CreateBitmap("test_bitmap", 100, 100)
    test_from_pt = PointAt(10.0, 10.0)
    test_to_pt = PointAt(90.0, 90.0)
    DrawLineOnBitmapPointToPointWithOptions(test_bitmap, ColorBlack(), test_from_pt, test_to_pt, OptionDefaults())
    assert PixelDrawnAtPoint(test_bitmap, 10.0, 10.0) is True
    assert PixelDrawnAtPoint(test_bitmap, 90.0, 90.0) is True
    assert PixelDrawnAtPoint(test_bitmap, 5.0, 5.0) is False
    FreeBitmap(test_bitmap)


def test_DrawLineOnBitmap_integration():
    test_bitmap = CreateBitmap("test_bitmap", 100, 100)
    test_color = ColorBlack()
    DrawLineOnBitmap(test_bitmap, test_color, 10.0, 10.0, 90.0, 90.0)
    assert PixelDrawnAtPoint(test_bitmap, 50.0, 50.0) is True
    assert PixelDrawnAtPoint(test_bitmap, 95.0, 50.0) is False
    FreeBitmap(test_bitmap)


def test_DrawLineOnBitmapWithOptions_integration():
    test_bitmap = CreateBitmap("test_bitmap", 100, 100)
    DrawLineOnBitmapWithOptions(test_bitmap, ColorBlack(), 10.0, 10.0, 90.0, 90.0, OptionDefaults())
    assert PixelDrawnAtPoint(test_bitmap, PointAt(50.0, 50.0)) is True
    assert PixelDrawnAtPoint(test_bitmap, PointAt(5.0, 5.0)) is False
    FreeBitmap(test_bitmap)


def test_DrawLineOnWindowRecord_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_line = LineFrom(PointAt(100.0, 100.0), PointAt(700.0, 500.0))
    DrawLineOnWindow(test_window, ColorBlack(), test_line)
    RefreshScreen()
    assert GetPixel(test_window, PointAt(100.0, 100.0)) == ColorBlack()
    assert GetPixel(test_window, PointAt(99.0, 99.0)) != ColorBlack()
    CloseWindow(test_window)


def test_DrawLineOnWindowRecordWithOptions_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_line = LineFrom(PointAt(100.0, 100.0), PointAt(200.0, 200.0))
    DrawLineOnWindow(test_window, ColorBlack(), test_line, OptionDefaults())
    RefreshScreen()
    assert GetPixel(test_window, PointAt(100.0, 100.0)) == ColorBlack()
    assert GetPixel(test_window, PointAt(99.0, 99.0)) != ColorBlack()
    CloseWindow(test_window)


def test_DrawLineOnWindowPointToPoint_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    DrawLineOnWindow(test_window, ColorBlack(), PointAt(100.0, 100.0), PointAt(200.0, 200.0))
    RefreshScreen()
    assert GetPixel(test_window, 100.0, 100.0) == ColorBlack()
    assert GetPixel(test_window, 99.0, 99.0) != ColorBlack()
    CloseWindow(test_window)


def test_DrawLineOnWindowPointToPointWithOptions_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    DrawLineOnWindow(test_window, ColorBlack(), PointAt(100.0, 100.0), PointAt(200.0, 200.0), OptionDefaults())
    RefreshScreen()
    assert GetPixel(test_window, 100.0, 100.0) == ColorBlack()
    assert GetPixel(test_window, 99.0, 99.0) != ColorBlack()
    CloseWindow(test_window)


def test_DrawLineOnWindow_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    DrawLineOnWindow(test_window, ColorBlack(), 100.0, 100.0, 200.0, 200.0)
    RefreshScreen()
    assert GetPixel(test_window, 100.0, 100.0) == ColorBlack()
    assert GetPixel(test_window, 99.0, 99.0) != ColorBlack()
    CloseWindow(test_window)


def test_DrawLineOnWindowWithOptions_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    DrawLineOnWindow(test_window, ColorBlack(), 100.0, 100.0, 200.0, 200.0, OptionDefaults())
    RefreshScreen()
    assert GetPixel(test_window, 100.0, 100.0) == ColorBlack()
    assert GetPixel(test_window, 99.0, 99.0) != ColorBlack()
    CloseWindow(test_window)


def test_DrawPixelAtPoint_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    DrawPixel(ColorBlack(), PointAt(100.0, 100.0))
    RefreshScreen()
    assert GetPixel(PointAt(100.0, 100.0)) == ColorBlack()
    assert GetPixel(PointAt(99.0, 99.0)) != ColorBlack()
    CloseWindow(test_window)


def test_DrawPixelAtPointWithOptions_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    DrawPixelAtPointWithOptions(ColorBlack(), PointAt(100.0, 100.0), OptionDefaults())
    RefreshScreen()
    assert GetPixel(PointAt(100.0, 100.0)) == ColorBlack()
    assert GetPixel(PointAt(100.0, 100.0)) == ColorBlack()
    assert GetPixel(PointAt(99.0, 99.0)) != ColorBlack()
    CloseWindow(test_window)


def test_DrawPixel_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    DrawPixel(ColorBlack(), 100.0, 100.0)
    RefreshScreen()
    assert GetPixel(PointAt(100.0, 100.0)) == ColorBlack()
    assert GetPixel(PointAt(99.0, 99.0)) != ColorBlack()
    CloseWindow(test_window)


def test_DrawPixelWithOptions_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    DrawPixel(ColorBlack(), 100.0, 100.0, OptionDefaults())
    RefreshScreen()
    assert GetPixel(PointAt(100.0, 100.0)) == ColorBlack()
    assert GetPixel(PointAt(99.0, 99.0)) != ColorBlack()
    CloseWindow(test_window)


def test_DrawPixelOnBitmapAtPoint_integration():
    test_bitmap = CreateBitmap("test_bitmap", 100, 100)
    test_color = ColorBlack()
    test_point = PointAt(50.0, 50.0)
    DrawPixelOnBitmap(test_bitmap, test_color, test_point)
    assert PixelDrawnAtPoint(test_bitmap, test_point) is True
    assert PixelDrawnAtPoint(test_bitmap, PointAt(0.0, 0.0)) is False
    FreeBitmap(test_bitmap)


def test_DrawPixelOnBitmapAtPointWithOptions_integration():
    test_bitmap = CreateBitmap("test_bitmap", 100, 100)
    test_color = ColorBlack()
    test_point = PointAt(50.0, 50.0)
    DrawPixelOnBitmap(test_bitmap, test_color, test_point, OptionDefaults())
    assert PixelDrawnAtPoint(test_bitmap, test_point) is True
    assert PixelDrawnAtPoint(test_bitmap, PointAt(0.0, 0.0)) is False
    FreeBitmap(test_bitmap)


def test_DrawPixelOnBitmap_integration():
    test_bitmap = CreateBitmap("test_bitmap", 100, 100)
    test_color = ColorBlack()
    DrawPixelOnBitmap(test_bitmap, test_color, 50.0, 50.0)
    assert PixelDrawnAtPoint(test_bitmap, 50.0, 50.0) is True
    assert PixelDrawnAtPoint(test_bitmap, 51.0, 50.0) is False
    FreeBitmap(test_bitmap)


def test_DrawPixelOnBitmapWithOptions_integration():
    test_bitmap = CreateBitmap("test_bitmap", 100, 100)
    test_color = ColorBlack()
    DrawPixelOnBitmap(test_bitmap, test_color, 50.0, 50.0, OptionDefaults())
    assert PixelDrawnAtPoint(test_bitmap, 50.0, 50.0) is True
    assert PixelDrawnAtPoint(test_bitmap, 51.0, 50.0) is False
    FreeBitmap(test_bitmap)


def test_DrawPixelOnWindowAtPoint_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_color = ColorBlack()
    test_point = PointAt(100.0, 100.0)
    DrawPixelOnWindow(test_window, test_color, test_point)
    RefreshScreen()
    assert GetPixel(PointAt(100.0, 100.0)) == ColorBlack()
    assert GetPixel(PointAt(99.0, 99.0)) != ColorBlack()
    CloseWindow(test_window)


def test_DrawPixelOnWindowAtPointWithOptions_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_point = PointAt(100.0, 100.0)
    DrawPixelOnWindow(test_window, ColorBlack(), test_point, OptionDefaults())
    RefreshScreen()
    assert GetPixel(PointAt(100.0, 100.0)) == ColorBlack()
    assert GetPixel(PointAt(99.0, 99.0)) != ColorBlack()
    CloseWindow(test_window)


def test_DrawPixelOnWindow_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    DrawPixelOnWindow(test_window, ColorBlack(), 100.0, 100.0)
    RefreshScreen()
    assert GetPixel(PointAt(100.0, 100.0)) == ColorBlack()
    assert GetPixel(PointAt(99.0, 99.0)) != ColorBlack()
    CloseWindow(test_window)


def test_DrawPixelOnWindowWithOptions_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    DrawPixelOnWindow(test_window, ColorBlack(), 100.0, 100.0, OptionDefaults())
    RefreshScreen()
    assert GetPixel(PointAt(100.0, 100.0)) == ColorBlack()
    assert GetPixel(PointAt(99.0, 99.0)) != ColorBlack()
    CloseWindow(test_window)


def test_GetPixelFromBitmapAtPoint_integration():
    test_bitmap = CreateBitmap("test_bitmap", 100, 100)
    DrawPixelOnBitmap(test_bitmap, ColorBlack(), PointAt(50.0, 50.0))
    test_color = GetPixelFromBitmapAtPoint(test_bitmap, PointAt(50.0, 50.0))
    assert ColorBlack() == test_color
    FreeBitmap(test_bitmap)


def test_GetPixelFromBitmap_integration():
    test_bitmap = CreateBitmap("test_bitmap", 100, 100)
    DrawPixelOnBitmap(test_bitmap, ColorBlack(), 50.0, 50.0)
    test_pixel_color = GetPixelFromBitmap(test_bitmap, 50.0, 50.0)
    assert test_pixel_color == ColorBlack()
    FreeBitmap(test_bitmap)


def test_GetPixelAtPoint_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    DrawPixel(ColorBlack(), PointAt(100.0, 100.0))
    RefreshScreen()
    assert GetPixelAtPoint(PointAt(100.0, 100.0)) == ColorBlack()
    CloseWindow(test_window)


def test_GetPixel_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    DrawPixel(ColorBlack(), 100.0, 100.0)
    RefreshScreen()
    assert GetPixel(100.0, 100.0) == ColorBlack()
    CloseWindow(test_window)


def test_GetPixelFromWindowAtPoint_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    DrawPixel(ColorBlack(), PointAt(100.0, 100.0))
    RefreshScreen()
    assert GetPixelFromWindowAtPoint(test_window, PointAt(100.0, 100.0)) == ColorBlack()
    CloseWindow(test_window)


def test_GetPixelFromWindow_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    DrawPixel(ColorBlack(), 100.0, 100.0)
    RefreshScreen()
    assert GetPixelFromWindow(test_window, 100.0, 100.0) == ColorBlack()
    CloseWindow(test_window)


def test_GetPixelFromWindowAtPointFromWindow_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    DrawPixel(ColorBlack(), PointAt(100.0, 100.0))
    RefreshScreen()
    test_pixel = GetPixelFromWindowAtPointFromWindow(test_window, PointAt(100.0, 100.0))
    assert ColorBlack() == test_pixel
    CloseWindow(test_window)


def test_GetPixelFromWindowFromWindow_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    DrawPixel(ColorBlack(), 100.0, 100.0)
    RefreshScreen()
    test_pixel_color = GetPixelFromWindow(test_window, 100.0, 100.0)
    assert ColorBlack() == test_pixel_color
    CloseWindow(test_window)


def test_DrawQuad_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_quad = QuadFrom(PointAt(100.0, 100.0), PointAt(200.0, 100.0), PointAt(100.0, 200.0), PointAt(200.0, 200.0))
    DrawQuad(ColorBlack(), test_quad)
    RefreshScreen()
    assert PointInQuad(PointAt(150.0, 150.0), test_quad) is True
    assert PointInQuad(PointAt(250.0, 250.0), test_quad) is False
    CloseWindow(test_window)


def test_DrawQuadWithOptions_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_quad = QuadFrom(PointAt(100.0, 100.0), PointAt(200.0, 100.0), PointAt(100.0, 200.0), PointAt(200.0, 200.0))
    DrawQuadWithOptions(ColorBlack(), test_quad, OptionDefaults())
    RefreshScreen()
    assert PointInQuad(PointAt(150.0, 150.0), test_quad) is True
    CloseWindow(test_window)


def test_DrawQuadOnBitmap_integration():
    test_bitmap = CreateBitmap("test_bitmap", 100, 100)
    test_quad = QuadFrom(PointAt(10.0, 10.0), PointAt(90.0, 10.0), PointAt(10.0, 90.0), PointAt(90.0, 90.0))
    DrawQuadOnBitmap(test_bitmap, ColorBlack(), test_quad)
    assert PixelDrawnAtPoint(test_bitmap, PointAt(50.0, 50.0)) is True
    assert PixelDrawnAtPoint(test_bitmap, PointAt(100.0, 100.0)) is False
    FreeBitmap(test_bitmap)


def test_DrawQuadOnBitmapWithOptions_integration():
    test_bitmap = CreateBitmap("test_bitmap", 100, 100)
    test_quad = QuadFrom(PointAt(10.0, 10.0), PointAt(90.0, 10.0), PointAt(90.0, 90.0), PointAt(10.0, 90.0))
    DrawQuadOnBitmapWithOptions(test_bitmap, ColorBlack(), test_quad, OptionDefaults())
    assert PixelDrawnAtPoint(test_bitmap, PointAt(50.0, 50.0)) is True
    assert PixelDrawnAtPoint(test_bitmap, PointAt(101.0, 50.0)) is False
    FreeBitmap(test_bitmap)


def test_DrawQuadOnWindow_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_quad = QuadFrom(PointAt(100.0, 100.0), PointAt(200.0, 100.0), PointAt(100.0, 200.0), PointAt(200.0, 200.0))
    DrawQuadOnWindow(test_window, ColorBlack(), test_quad)
    RefreshScreen()
    assert PointInQuad(PointAt(150.0, 150.0), test_quad) is True
    CloseWindow(test_window)


def test_DrawQuadOnWindowWithOptions_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_quad = QuadFrom(PointAt(100.0, 100.0), PointAt(200.0, 100.0), PointAt(100.0, 200.0), PointAt(200.0, 200.0))
    DrawQuadOnWindow(test_window, ColorBlack(), test_quad, OptionDefaults())
    RefreshScreen()
    assert PointInQuad(PointAt(150.0, 150.0), test_quad) is True
    CloseWindow(test_window)


def test_DrawRectangleRecord_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_rectangle = RectangleFrom(100.0, 100.0, 200.0, 150.0)
    DrawRectangle(ColorBlack(), test_rectangle)
    RefreshScreen()
    assert PointInRectangle(PointAt(150.0, 125.0), test_rectangle) is True
    assert PointInRectangle(PointAt(301.0, 251.0), test_rectangle) is False
    CloseWindow(test_window)


def test_DrawRectangleRecordWithOptions_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_rectangle = RectangleFrom(100.0, 100.0, 200.0, 150.0)
    DrawRectangle(ColorBlack(), test_rectangle, OptionDefaults())
    RefreshScreen()
    assert PointInRectangle(PointAt(150.0, 125.0), test_rectangle) is True
    assert PointInRectangle(PointAt(350.0, 300.0), test_rectangle) is False
    CloseWindow(test_window)


def test_DrawRectangle_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    DrawRectangle(ColorBlack(), 100.0, 100.0, 200.0, 150.0)
    RefreshScreen()
    assert PointInRectangle(PointAt(150.0, 125.0), RectangleFrom(100.0, 100.0, 200.0, 150.0)) is True
    assert PointInRectangle(PointAt(301.0, 251.0), RectangleFrom(100.0, 100.0, 200.0, 150.0)) is False
    CloseWindow(test_window)


def test_DrawRectangleWithOptions_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    DrawRectangleWithOptions(ColorBlack(), 100.0, 100.0, 200.0, 150.0, OptionLineWidth(3, OptionDefaults()))
    RefreshScreen()
    assert PointInRectangle(PointAt(150.0, 125.0), RectangleFrom(100.0, 100.0, 200.0, 150.0)) is True
    assert PointInRectangle(PointAt(301.0, 251.0), RectangleFrom(100.0, 100.0, 200.0, 150.0)) is False
    CloseWindow(test_window)


def test_DrawRectangleOnBitmapRecord_integration():
    test_bitmap = CreateBitmap("test_bitmap", 100, 100)
    test_rectangle = RectangleFrom(50.0, 50.0, 20.0, 30.0)
    DrawRectangleOnBitmap(test_bitmap, ColorBlack(), test_rectangle)
    assert PixelDrawnAtPoint(test_bitmap, PointAt(50.0, 50.0)) is True
    assert PixelDrawnAtPoint(test_bitmap, PointAt(80.0, 90.0)) is False
    FreeBitmap(test_bitmap)


def test_DrawRectangleOnBitmapRecordWithOptions_integration():
    test_bitmap = CreateBitmap("test_bitmap", 100, 100)
    test_rectangle = RectangleFrom(50.0, 50.0, 20.0, 20.0)
    DrawRectangleOnBitmap(test_bitmap, ColorBlack(), test_rectangle, OptionDefaults())
    assert PixelDrawnAtPoint(test_bitmap, PointAt(50.0, 50.0)) is True
    assert PixelDrawnAtPoint(test_bitmap, PointAt(75.0, 75.0)) is False
    FreeBitmap(test_bitmap)


def test_DrawRectangleOnBitmap_integration():
    test_bitmap = CreateBitmap("test_bitmap", 100, 100)
    DrawRectangleOnBitmap(test_bitmap, ColorBlack(), 50.0, 50.0, 20.0, 20.0)
    assert PixelDrawnAtPoint(test_bitmap, 50.0, 50.0) is True
    assert PixelDrawnAtPoint(test_bitmap, 75.0, 75.0) is False
    FreeBitmap(test_bitmap)


def test_DrawRectangleOnBitmapWithOptions_integration():
    test_bitmap = CreateBitmap("test_bitmap", 100, 100)
    DrawRectangleOnBitmapWithOptions(test_bitmap, ColorBlack(), 50.0, 50.0, 20.0, 20.0, OptionDefaults())
    assert PixelDrawnAtPoint(test_bitmap, 50.0, 50.0) is True
    assert PixelDrawnAtPoint(test_bitmap, 75.0, 75.0) is False
    FreeBitmap(test_bitmap)


def test_DrawRectangleOnWindowRecord_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_rectangle = RectangleFrom(100.0, 100.0, 50.0, 50.0)
    DrawRectangleOnWindow(test_window, ColorBlack(), test_rectangle)
    RefreshScreen()
    assert PointInRectangle(PointAt(125.0, 125.0), test_rectangle) is True
    assert PointInRectangle(PointAt(200.0, 200.0), test_rectangle) is False
    CloseWindow(test_window)


def test_DrawRectangleOnWindowRecordWithOptions_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_rectangle = RectangleFrom(100.0, 100.0, 50.0, 50.0)
    DrawRectangleOnWindow(test_window, ColorBlack(), test_rectangle, OptionDefaults())
    RefreshScreen()
    assert PointInRectangle(PointAt(125.0, 125.0), test_rectangle) is True
    assert PointInRectangle(PointAt(175.0, 175.0), test_rectangle) is False
    CloseWindow(test_window)


def test_DrawRectangleOnWindow_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    DrawRectangleOnWindow(test_window, ColorBlack(), 100.0, 100.0, 50.0, 50.0)
    RefreshScreen()
    assert PointInRectangle(PointAt(100.0, 100.0), RectangleFrom(100.0, 100.0, 50.0, 50.0)) is True
    assert PointInRectangle(PointAt(200.0, 200.0), RectangleFrom(100.0, 100.0, 50.0, 50.0)) is False
    CloseWindow(test_window)


def test_DrawRectangleOnWindowWithOptions_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_rectangle = RectangleFrom(100.0, 100.0, 50.0, 50.0)
    DrawRectangleOnWindow(test_window, ColorBlack(), test_rectangle, OptionDefaults())
    RefreshScreen()
    assert PointInRectangle(PointAt(125.0, 125.0), test_rectangle) is True
    assert PointInRectangle(PointAt(200.0, 200.0), test_rectangle) is False
    CloseWindow(test_window)


def test_FillQuad_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_quad = QuadFrom(PointAt(100.0, 100.0), PointAt(300.0, 100.0), PointAt(100.0, 300.0), PointAt(300.0, 300.0))
    FillQuad(ColorBlack(), test_quad)
    RefreshScreen()
    assert PointInQuad(PointAt(200.0, 200.0), test_quad) is True
    assert PointInQuad(PointAt(400.0, 400.0), test_quad) is False
    CloseWindow(test_window)


def test_FillQuadWithOptions_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_quad = QuadFrom(PointAt(100.0, 100.0), PointAt(300.0, 100.0), PointAt(100.0, 300.0), PointAt(300.0, 300.0))
    FillQuadWithOptions(ColorBlack(), test_quad, OptionDefaults())
    RefreshScreen()
    assert PointInQuad(PointAt(200.0, 200.0), test_quad) is True
    assert PointInQuad(PointAt(400.0, 400.0), test_quad) is False
    CloseWindow(test_window)


def test_FillQuadOnBitmap_integration():
    test_bitmap = CreateBitmap("test_bitmap", 100, 100)
    test_quad = QuadFrom(PointAt(10.0, 10.0), PointAt(90.0, 10.0), PointAt(10.0, 90.0), PointAt(90.0, 90.0))
    FillQuadOnBitmap(test_bitmap, ColorBlack(), test_quad)
    assert PixelDrawnAtPoint(test_bitmap, PointAt(50.0, 50.0)) is True
    assert PixelDrawnAtPoint(test_bitmap, PointAt(0.0, 0.0)) is False
    FreeBitmap(test_bitmap)


def test_FillQuadOnBitmapWithOptions_integration():
    test_bitmap = CreateBitmap("test_bitmap", 100, 100)
    test_quad = QuadFrom(PointAt(10.0, 10.0), PointAt(90.0, 10.0), PointAt(90.0, 90.0), PointAt(10.0, 90.0))
    FillQuadOnBitmapWithOptions(test_bitmap, ColorBlack(), test_quad, OptionDefaults())
    assert PixelDrawnAtPoint(test_bitmap, PointAt(50.0, 50.0)) is True
    assert PixelDrawnAtPoint(test_bitmap, PointAt(101.0, 50.0)) is False
    FreeBitmap(test_bitmap)


def test_FillQuadOnWindow_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_quad = QuadFrom(PointAt(100.0, 100.0), PointAt(200.0, 100.0), PointAt(100.0, 200.0), PointAt(200.0, 200.0))
    FillQuadOnWindow(test_window, ColorBlack(), test_quad)
    RefreshScreen()
    assert PointInQuad(PointAt(150.0, 150.0), test_quad) is True
    CloseWindow(test_window)


def test_FillQuadOnWindowWithOptions_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_quad = QuadFrom(PointAt(100.0, 100.0), PointAt(200.0, 100.0), PointAt(200.0, 200.0), PointAt(100.0, 200.0))
    FillQuadOnWindow(test_window, ColorBlack(), test_quad, OptionDefaults())
    RefreshScreen()
    assert PointInQuad(PointAt(150.0, 150.0), test_quad) is True
    assert PointInQuad(PointAt(250.0, 150.0), test_quad) is False
    CloseWindow(test_window)


def test_FillRectangleRecord_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_rectangle = RectangleFrom(100.0, 100.0, 200.0, 150.0)
    FillRectangle(ColorBlack(), test_rectangle)
    RefreshScreen()
    assert PointInRectangle(PointAt(150.0, 125.0), test_rectangle) is True
    assert PointInRectangle(PointAt(350.0, 275.0), test_rectangle) is False
    CloseWindow(test_window)


def test_FillRectangleRecordWithOptions_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_rectangle = RectangleFrom(100.0, 100.0, 200.0, 150.0)
    FillRectangleRecordWithOptions(ColorBlack(), test_rectangle, OptionDefaults())
    RefreshScreen()
    assert PointInRectangle(PointAt(150.0, 125.0), test_rectangle) is True
    assert PointInRectangle(PointAt(350.0, 275.0), test_rectangle) is False
    CloseWindow(test_window)


def test_FillRectangle_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    FillRectangle(ColorBlack(), 100.0, 100.0, 200.0, 150.0)
    RefreshScreen()
    assert PointInRectangle(PointAt(150.0, 125.0), RectangleFrom(100.0, 100.0, 200.0, 150.0)) is True
    assert PointInRectangle(PointAt(301.0, 251.0), RectangleFrom(100.0, 100.0, 200.0, 150.0)) is False
    CloseWindow(test_window)


def test_FillRectangleWithOptions_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    FillRectangle(ColorBlack(), 100.0, 100.0, 200.0, 150.0, OptionDefaults())
    RefreshScreen()
    assert PointInRectangle(PointAt(150.0, 125.0), RectangleFrom(100.0, 100.0, 200.0, 150.0)) is True
    assert PointInRectangle(PointAt(301.0, 251.0), RectangleFrom(100.0, 100.0, 200.0, 150.0)) is False
    CloseWindow(test_window)


def test_FillRectangleOnBitmapRecord_integration():
    test_bitmap = CreateBitmap("test_bitmap", 100, 100)
    test_rectangle = RectangleFrom(25.0, 25.0, 50.0, 50.0)
    FillRectangleOnBitmap(test_bitmap, ColorBlack(), test_rectangle)
    assert PixelDrawnAtPoint(test_bitmap, PointAt(50.0, 50.0)) is True
    assert PixelDrawnAtPoint(test_bitmap, PointAt(10.0, 10.0)) is False
    FreeBitmap(test_bitmap)


def test_FillRectangleOnBitmapRecordWithOptions_integration():
    test_bitmap = CreateBitmap("test_bitmap", 100, 100)
    test_rectangle = RectangleFrom(25.0, 25.0, 50.0, 50.0)
    FillRectangleOnBitmap(test_bitmap, ColorBlack(), test_rectangle, OptionDefaults())
    assert PixelDrawnAtPoint(test_bitmap, PointAt(50.0, 50.0)) is True
    assert PixelDrawnAtPoint(test_bitmap, PointAt(10.0, 10.0)) is False
    FreeBitmap(test_bitmap)


def test_FillRectangleOnBitmap_integration():
    test_bitmap = CreateBitmap("test_bitmap", 100, 100)
    FillRectangleOnBitmap(test_bitmap, ColorBlack(), 25.0, 25.0, 50.0, 50.0)
    assert PixelDrawnAtPoint(test_bitmap, 50.0, 50.0) is True
    assert PixelDrawnAtPoint(test_bitmap, 75.0, 75.0) is False
    FreeBitmap(test_bitmap)


def test_FillRectangleOnBitmapWithOptions_integration():
    test_bitmap = CreateBitmap("test_bitmap", 100, 100)
    FillRectangleOnBitmap(test_bitmap, ColorBlack(), 25.0, 25.0, 50.0, 50.0, OptionDefaults())
    assert PixelDrawnAtPoint(test_bitmap, PointAt(50.0, 50.0)) is True
    assert PixelDrawnAtPoint(test_bitmap, PointAt(10.0, 10.0)) is False
    FreeBitmap(test_bitmap)


def test_FillRectangleOnWindowRecord_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_rectangle = RectangleFrom(100.0, 100.0, 200.0, 150.0)
    FillRectangleOnWindow(test_window, ColorBlack(), test_rectangle)
    RefreshScreen()
    assert PointInRectangle(PointAt(150.0, 125.0), test_rectangle) is True
    assert PointInRectangle(PointAt(350.0, 275.0), test_rectangle) is False
    CloseWindow(test_window)


def test_FillRectangleOnWindowRecordWithOptions_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_rectangle = RectangleFrom(100.0, 100.0, 200.0, 150.0)
    FillRectangleOnWindow(test_window, ColorBlack(), test_rectangle, OptionDefaults())
    RefreshScreen()
    assert PointInRectangle(PointAt(150.0, 125.0), test_rectangle) is True
    assert PointInRectangle(PointAt(350.0, 275.0), test_rectangle) is False
    CloseWindow(test_window)


def test_FillRectangleOnWindow_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    FillRectangleOnWindow(test_window, ColorBlack(), 100.0, 100.0, 50.0, 50.0)
    RefreshScreen()
    assert PointInRectangle(PointAt(125.0, 125.0), RectangleFrom(100.0, 100.0, 50.0, 50.0)) is True
    assert PointInRectangle(PointAt(175.0, 175.0), RectangleFrom(100.0, 100.0, 50.0, 50.0)) is False
    CloseWindow(test_window)


def test_FillRectangleOnWindowWithOptions_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    FillRectangleOnWindow(test_window, ColorBlack(), 100.0, 100.0, 50.0, 50.0, OptionDefaults())
    RefreshScreen()
    assert PointInRectangle(PointAt(125.0, 125.0), RectangleFrom(100.0, 100.0, 50.0, 50.0)) is True
    assert PointInRectangle(PointAt(175.0, 175.0), RectangleFrom(100.0, 100.0, 50.0, 50.0)) is False
    CloseWindow(test_window)


def test_DrawTextFontAsString_integration():
    test_window = OpenWindow("Text Drawing Test", 800, 600)
    DrawTextFontAsString("Hello, World!", ColorBlack(), "hara", 24, 100.0, 100.0)
    RefreshScreen()
    test_rectangle = RectangleFrom(100.0, 100.0, TextWidth("Hello, World!", GetSystemFont(), 12), TextHeight("Hello, World!", GetSystemFont(), 12))
    assert PointInRectangle(PointAt(100.0, 100.0), test_rectangle) is True
    CloseWindow(test_window)


def test_DrawTextWithOptionsFontAsString_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    DrawText("Hello, World!", ColorBlack(), "leaguegothic", 24, 100.0, 100.0, OptionDefaults())
    RefreshScreen()
    test_rectangle = RectangleFrom(100.0, 100.0, TextWidth("Hello, World!", GetSystemFont(), 12), TextHeight("Hello, World!", GetSystemFont(), 12))
    assert PointInRectangle(PointAt(100.0, 100.0), test_rectangle) is True
    CloseWindow(test_window)


def test_DrawTextNoFontNoSize_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    DrawTextNoFontNoSize("Hello, World!", ColorBlack(), 100.0, 100.0)
    RefreshScreen()
    test_rectangle = RectangleFrom(100.0, 100.0, TextWidth("Hello, World!", GetSystemFont(), 12), TextHeight("Hello, World!", GetSystemFont(), 12))
    assert PointInRectangle(PointAt(100.0, 100.0), test_rectangle) is True
    CloseWindow(test_window)


def test_DrawTextNoFontNoSizeWithOptions_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    DrawTextNoFontNoSizeWithOptions("Hello, World!", ColorBlack(), 100.0, 100.0, OptionDefaults())
    RefreshScreen()
    test_rectangle = RectangleFrom(100.0, 100.0, TextWidth("Hello, World!", GetSystemFont(), 12), TextHeight("Hello, World!", GetSystemFont(), 12))
    assert PointInRectangle(PointAt(100.0, 100.0), test_rectangle) is True
    CloseWindow(test_window)


def test_DrawText_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    DrawText("Hello, World!", ColorBlack(), FontNamed("hara"), 24, 100.0, 100.0)
    RefreshScreen()
    test_rectangle = RectangleFrom(100.0, 100.0, TextWidth("Hello, World!", GetSystemFont(), 12), TextHeight("Hello, World!", GetSystemFont(), 12))
    assert PointInRectangle(PointAt(100.0, 100.0), test_rectangle) is True
    CloseWindow(test_window)


def test_DrawTextWithOptions_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    DrawTextWithOptions("Hello, World!", ColorBlack(), FontNamed("hara"), 24, 100.0, 100.0, OptionDefaults())
    RefreshScreen()
    test_rectangle = RectangleFrom(100.0, 100.0, TextWidth("Hello, World!", GetSystemFont(), 12), TextHeight("Hello, World!", GetSystemFont(), 12))
    assert PointInRectangle(PointAt(100.0, 100.0), test_rectangle) is True
    CloseWindow(test_window)


def test_DrawTextOnBitmapFontAsString_integration():
    test_bitmap = CreateBitmap("test_bitmap", 100, 100)
    DrawTextOnBitmap(test_bitmap, "Hello", ColorBlack(), "hara", 12, 10.0, 10.0)
    assert PixelDrawnAtPoint(test_bitmap, 10.0, 10.0) is True
    assert PixelDrawnAtPoint(test_bitmap, 90.0, 90.0) is False
    FreeBitmap(test_bitmap)


def test_DrawTextOnBitmapWithOptionsFontAsString_integration():
    test_bitmap = CreateBitmap("test_bitmap", 100, 100)
    DrawTextOnBitmap(test_bitmap, "Hello", ColorBlack(), "hara", 12, 10.0, 10.0, OptionDefaults())
    assert PixelDrawnAtPoint(test_bitmap, 10.0, 10.0) is True
    assert PixelDrawnAtPoint(test_bitmap, 90.0, 90.0) is False
    FreeBitmap(test_bitmap)


def test_DrawTextOnBitmapNoFontNoSize_integration():
    test_bitmap = CreateBitmap("test_bitmap", 100, 100)
    DrawTextOnBitmap(test_bitmap, "Test", ColorBlack(), 10.0, 10.0)
    assert PixelDrawnAtPoint(test_bitmap, 10.0, 10.0) is True
    assert PixelDrawnAtPoint(test_bitmap, 90.0, 90.0) is False
    FreeBitmap(test_bitmap)


def test_DrawTextOnBitmapNoFontNoSizeWithOptions_integration():
    test_bitmap = CreateBitmap("test_bitmap", 100, 100)
    DrawTextOnBitmap(test_bitmap, "Test", ColorBlack(), 10.0, 10.0, OptionDefaults())
    assert PixelDrawnAtPoint(test_bitmap, 10.0, 10.0) is True
    assert PixelDrawnAtPoint(test_bitmap, 90.0, 90.0) is False
    FreeBitmap(test_bitmap)


def test_DrawTextOnBitmap_integration():
    test_bitmap = CreateBitmap("test_bitmap", 100, 100)
    DrawTextOnBitmap(test_bitmap, "Hello", ColorBlack(), FontNamed("hara"), 12, 10.0, 10.0)
    assert PixelDrawnAtPoint(test_bitmap, 10.0, 10.0) is True
    assert PixelDrawnAtPoint(test_bitmap, 90.0, 90.0) is False
    FreeBitmap(test_bitmap)


def test_DrawTextOnBitmapWithOptions_integration():
    test_bitmap = CreateBitmap("test_bitmap", 100, 100)
    DrawTextOnBitmap(test_bitmap, "Test", ColorBlack(), FontNamed("hara"), 24, 10.0, 10.0, OptionDefaults())
    assert PixelDrawnAtPoint(test_bitmap, 10.0, 10.0) is True
    assert PixelDrawnAtPoint(test_bitmap, 90.0, 90.0) is False
    FreeBitmap(test_bitmap)


def test_DrawTextOnWindowFontAsString_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    DrawTextOnWindow(test_window, "Hello, World!", ColorBlack(), "hara", 24, 10.0, 10.0)
    RefreshScreen()
    test_rectangle = RectangleFrom(100.0, 100.0, TextWidth("Hello, World!", GetSystemFont(), 12), TextHeight("Hello, World!", GetSystemFont(), 12))
    assert PointInRectangle(PointAt(100.0, 100.0), test_rectangle) is True
    CloseWindow(test_window)


def test_DrawTextOnWindowWithOptionsFontAsString_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    DrawTextOnWindow(test_window, "Hello, World!", ColorBlack(), "hara", 24, 10.0, 10.0, OptionDefaults())
    RefreshScreen()
    test_rectangle = RectangleFrom(100.0, 100.0, TextWidth("Hello, World!", GetSystemFont(), 12), TextHeight("Hello, World!", GetSystemFont(), 12))
    assert PointInRectangle(PointAt(100.0, 100.0), test_rectangle) is True
    CloseWindow(test_window)


def test_DrawTextOnWindowNoFontNoSize_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    DrawTextOnWindow(test_window, "Hello, World!", ColorBlack(), 10.0, 10.0)
    RefreshScreen()
    test_rectangle = RectangleFrom(100.0, 100.0, TextWidth("Hello, World!", GetSystemFont(), 12), TextHeight("Hello, World!", GetSystemFont(), 12))
    assert PointInRectangle(PointAt(100.0, 100.0), test_rectangle) is True
    CloseWindow(test_window)


def test_DrawTextOnWindowNoFontNoSizeWithOptions_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    DrawTextOnWindow(test_window, "Hello, World!", ColorBlack(), 10.0, 10.0, OptionDefaults())
    RefreshScreen()
    test_rectangle = RectangleFrom(100.0, 100.0, TextWidth("Hello, World!", GetSystemFont(), 12), TextHeight("Hello, World!", GetSystemFont(), 12))
    assert PointInRectangle(PointAt(100.0, 100.0), test_rectangle) is True
    CloseWindow(test_window)


def test_DrawTextOnWindow_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_font = LoadFont("test_font", "hara.ttf")
    FontLoadSize(test_font, 24)
    DrawTextOnWindow(test_window, "Hello, World!", ColorBlack(), test_font, 24, 10.0, 10.0)
    RefreshScreen()
    test_rectangle = RectangleFrom(100.0, 100.0, TextWidth("Hello, World!", GetSystemFont(), 12), TextHeight("Hello, World!", GetSystemFont(), 12))
    assert PointInRectangle(PointAt(100.0, 100.0), test_rectangle) is True
    CloseWindow(test_window)
    FreeFont(test_font)


def test_DrawTextOnWindowWithOptions_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_font = LoadFont("test_font", "hara.ttf")
    DrawTextOnWindow(test_window, "Hello, World!", ColorBlack(), test_font, 24, 10.0, 10.0, OptionDefaults())
    RefreshScreen()
    test_rectangle = RectangleFrom(100.0, 100.0, TextWidth("Hello, World!", GetSystemFont(), 12), TextHeight("Hello, World!", GetSystemFont(), 12))
    assert PointInRectangle(PointAt(100.0, 100.0), test_rectangle) is True
    CloseWindow(test_window)
    FreeFont(test_font)


def test_FontHasSizeNameAsString_integration():
    test_result1 = FontHasSizeNameAsString("hara", 12)
    assert test_result1 is True
    test_result2 = FontHasSizeNameAsString("nonexistent_font", 12)
    assert test_result2 is False


def test_FontHasSize_integration():
    test_font = LoadFont("test_font", "hara.ttf")
    has_size_12 = FontHasSize(test_font, 12)
    assert has_size_12 is True
    has_size_999 = FontHasSize(test_font, 999)
    assert has_size_999 is False
    FreeFont(test_font)


def test_FontLoadSizeNameAsString_integration():
    FontLoadSize("test_font", 12)
    test_font_size_check = FontHasSize("test_font", 12)
    assert test_font_size_check is True


def test_FontLoadSize_integration():
    test_font = LoadFont("test_font", "hara.ttf")
    FontLoadSize(test_font, 12)
    assert FontHasSize(test_font, 12) is True
    FreeFont(test_font)


def test_FontNamed_integration():
    test_window = OpenWindow("Font Test", 800, 600)
    test_font = FontNamed("hara")
    DrawText("Test Text", ColorBlack(), test_font, 24, 100.0, 100.0)
    RefreshScreen()
    assert test_font is not None
    CloseWindow(test_window)


def test_FreeAllFonts_integration():
    test_font = LoadFont("test_font", "hara.ttf")
    test_font_named = FontNamed("test_font")
    assert test_font_named is not None
    FreeAllFonts()
    test_has_font = HasFont("test_font")
    assert test_has_font is False


def test_FreeFont_integration():
    test_font = LoadFont("test_font", "hara.ttf")
    FreeFont(test_font)
    assert HasFont(test_font) is False


def test_GetFontStyleNameAsString_integration():
    test_font = LoadFont("test_font", "hara.ttf")
    test_style = GetFontStyle("test_font")
    assert test_style is not None
    FreeFont(test_font)


def test_GetFontStyle_integration():
    test_font = LoadFont("test_font", "hara.ttf")
    test_style = GetFontStyle(test_font)
    assert test_style != FontStyle.BoldFont
    FreeFont(test_font)


def test_GetSystemFont_integration():
    test_font = GetSystemFont()
    assert test_font is not None
    test_has_size = FontHasSize(test_font, 12)
    assert test_has_size is True


def test_HasFont_integration():
    test_font = LoadFont("test_font", "hara.ttf")
    assert HasFont(test_font) is True
    FreeFont(test_font)
    assert HasFont(test_font) is False


def test_HasFontNameAsString_integration():
    test_result_hara = HasFont("hara")
    assert test_result_hara is True
    test_result_nonexistent = HasFont("nonexistent_font")
    assert test_result_nonexistent is False


def test_LoadFont_integration():
    test_window = OpenWindow("Font Test", 800, 600)
    test_font = LoadFont("test_font", "hara.ttf")
    DrawText("Hello, World!", ColorBlack(), test_font, 24, 100.0, 100.0, OptionDefaults())
    RefreshScreen()
    assert HasFont("test_font") is True
    CloseWindow(test_window)
    FreeFont(test_font)


def test_SetFontStyleNameAsString_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_font = LoadFont("test_font", "hara.ttf")
    FontLoadSize("test_font", 24)
    SetFontStyleNameAsString("test_font", FontStyle.BoldFont)
    DrawText("Bold Text", ColorBlack(), "test_font", 24, 100.0, 100.0)
    RefreshScreen()
    assert GetFontStyleNameAsString("test_font") == FontStyle.BoldFont
    CloseWindow(test_window)
    FreeFont(test_font)


def test_SetFontStyle_integration():
    test_font = FontNamed("hara")
    SetFontStyle(test_font, FontStyle.BoldFont)
    test_style = GetFontStyle(test_font)
    assert test_style == FontStyle.BoldFont
    FreeFont(test_font)


def test_TextHeightFontNamed_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_height = TextHeightFontNamed("Hello, World!", "hara", 24)
    assert test_height > 0
    CloseWindow(test_window)


def test_TextHeight_integration():
    test_font = LoadFont("test_font", "hara.ttf")
    FontLoadSize(test_font, 24)
    test_height = TextHeight("Hello, World!", test_font, 24)
    assert test_height > 0
    FreeFont(test_font)


def test_TextWidthFontNamed_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_width = TextWidthFontNamed("Hello, World!", "hara", 24)
    DrawText("Hello, World!", ColorBlack(), "hara", 24, 100.0, 100.0)
    RefreshScreen()
    assert test_width > 0
    CloseWindow(test_window)


def test_TextWidth_integration():
    test_font = LoadFont("test_font", "hara.ttf")
    FontLoadSize(test_font, 12)
    test_width = TextWidth("Hello, World!", test_font, 12)
    assert test_width > 0
    FreeFont(test_font)


def test_DrawTriangleRecord_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_triangle = TriangleFrom(PointAt(100.0, 100.0), PointAt(200.0, 200.0), PointAt(150.0, 300.0))
    DrawTriangle(ColorBlack(), test_triangle)
    RefreshScreen()
    assert PointInTriangle(PointAt(150.0, 200.0), test_triangle) is True
    assert PointInTriangle(PointAt(300.0, 300.0), test_triangle) is False
    CloseWindow(test_window)


def test_DrawTriangleRecordWithOptions_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_triangle = TriangleFrom(PointAt(100.0, 100.0), PointAt(200.0, 200.0), PointAt(150.0, 300.0))
    DrawTriangle(ColorBlack(), test_triangle, OptionDefaults())
    RefreshScreen()
    assert PointInTriangle(PointAt(150.0, 150.0), test_triangle) is True
    assert PointInTriangle(PointAt(300.0, 300.0), test_triangle) is False
    CloseWindow(test_window)


def test_DrawTriangle_integration():
    test_window = OpenWindow("Triangle Test", 800, 600)
    DrawTriangle(ColorBlack(), 100.0, 100.0, 200.0, 300.0, 300.0, 100.0)
    RefreshScreen()
    assert PointInTriangle(PointAt(150.0, 150.0), TriangleFrom(PointAt(100.0, 100.0), PointAt(200.0, 300.0), PointAt(300.0, 100.0))) is True
    CloseWindow(test_window)


def test_DrawTriangleWithOptions_integration():
    test_window = OpenWindow("Triangle Test", 800, 600)
    DrawTriangleWithOptions(ColorBlack(), 100.0, 100.0, 200.0, 200.0, 150.0, 300.0, OptionDefaults())
    RefreshScreen()
    assert PointInTriangle(PointAt(150.0, 150.0), TriangleFrom(PointAt(100.0, 100.0), PointAt(200.0, 200.0), PointAt(150.0, 300.0))) is True
    CloseWindow(test_window)


def test_DrawTriangleOnBitmapRecord_integration():
    test_bitmap = CreateBitmap("test_bitmap", 100, 100)
    test_triangle = TriangleFrom(PointAt(25.0, 25.0), PointAt(75.0, 25.0), PointAt(50.0, 75.0))
    DrawTriangleOnBitmap(test_bitmap, ColorBlack(), test_triangle)
    assert PixelDrawnAtPoint(test_bitmap, PointAt(50.0, 50.0)) is True
    assert PixelDrawnAtPoint(test_bitmap, PointAt(10.0, 10.0)) is False
    FreeBitmap(test_bitmap)


def test_DrawTriangleOnBitmapRecordWithOptions_integration():
    test_bitmap = CreateBitmap("test_bitmap", 100, 100)
    test_triangle = TriangleFrom(PointAt(25.0, 25.0), PointAt(75.0, 25.0), PointAt(50.0, 75.0))
    DrawTriangleOnBitmap(test_bitmap, ColorBlack(), test_triangle, OptionDefaults())
    assert PixelDrawnAtPoint(test_bitmap, PointAt(50.0, 50.0)) is True
    assert PixelDrawnAtPoint(test_bitmap, PointAt(10.0, 10.0)) is False
    FreeBitmap(test_bitmap)


def test_DrawTriangleOnBitmap_integration():
    test_bitmap = CreateBitmap("test_bitmap", 100, 100)
    DrawTriangleOnBitmap(test_bitmap, ColorBlack(), 25.0, 25.0, 75.0, 25.0, 50.0, 75.0)
    assert PixelDrawnAtPoint(test_bitmap, PointAt(50.0, 50.0)) is True
    assert PixelDrawnAtPoint(test_bitmap, PointAt(10.0, 10.0)) is False
    FreeBitmap(test_bitmap)


def test_DrawTriangleOnBitmapWithOptions_integration():
    test_bitmap = CreateBitmap("test_bitmap", 100, 100)
    DrawTriangleOnBitmap(test_bitmap, ColorBlack(), 10.0, 10.0, 50.0, 90.0, 90.0, 10.0, OptionDefaults())
    assert PixelDrawnAtPoint(test_bitmap, PointAt(50.0, 50.0)) is True
    assert PixelDrawnAtPoint(test_bitmap, PointAt(100.0, 100.0)) is False
    FreeBitmap(test_bitmap)


def test_DrawTriangleOnWindowRecord_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_triangle = TriangleFrom(PointAt(100.0, 100.0), PointAt(200.0, 200.0), PointAt(150.0, 300.0))
    DrawTriangleOnWindow(test_window, ColorBlack(), test_triangle)
    RefreshScreen()
    assert PointInTriangle(PointAt(150.0, 200.0), test_triangle) is True
    CloseWindow(test_window)


def test_DrawTriangleOnWindowRecordWithOptions_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_triangle = TriangleFrom(PointAt(100.0, 100.0), PointAt(200.0, 200.0), PointAt(150.0, 250.0))
    DrawTriangleOnWindow(test_window, ColorBlack(), test_triangle, OptionDefaults())
    RefreshScreen()
    assert PointInTriangle(PointAt(150.0, 150.0), test_triangle) is True
    CloseWindow(test_window)


def test_DrawTriangleOnWindow_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    DrawTriangleOnWindow(test_window, ColorBlack(), 100.0, 100.0, 200.0, 300.0, 300.0, 100.0)
    RefreshScreen()
    assert PointInTriangle(PointAt(200.0, 200.0), TriangleFrom(PointAt(100.0, 100.0), PointAt(200.0, 300.0), PointAt(300.0, 100.0))) is True
    CloseWindow(test_window)


def test_DrawTriangleOnWindowWithOptions_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    DrawTriangleOnWindowWithOptions(test_window, ColorBlack(), 100.0, 100.0, 200.0, 200.0, 150.0, 300.0, OptionDefaults())
    RefreshScreen()
    assert PointInTriangle(PointAt(150.0, 200.0), TriangleFrom(100.0, 100.0, 200.0, 200.0, 150.0, 300.0)) is True
    CloseWindow(test_window)


def test_FillTriangleRecord_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_triangle = TriangleFrom(PointAt(100.0, 100.0), PointAt(200.0, 300.0), PointAt(300.0, 100.0))
    FillTriangle(ColorBlack(), test_triangle)
    RefreshScreen()
    assert PointInTriangle(PointAt(200.0, 200.0), test_triangle) is True
    assert PointInTriangle(PointAt(400.0, 400.0), test_triangle) is False
    CloseWindow(test_window)


def test_FillTriangleRecordWithOptions_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_triangle = TriangleFrom(PointAt(100.0, 100.0), PointAt(200.0, 300.0), PointAt(300.0, 100.0))
    FillTriangle(ColorBlack(), test_triangle, OptionDefaults())
    RefreshScreen()
    assert PointInTriangle(PointAt(200.0, 200.0), test_triangle) is True
    assert PointInTriangle(PointAt(400.0, 400.0), test_triangle) is False
    CloseWindow(test_window)


def test_FillTriangle_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    FillTriangle(ColorBlack(), 100.0, 100.0, 200.0, 300.0, 300.0, 100.0)
    RefreshScreen()
    assert PointInTriangle(PointAt(150.0, 150.0), TriangleFrom(PointAt(100.0, 100.0), PointAt(200.0, 300.0), PointAt(300.0, 100.0))) is True
    CloseWindow(test_window)


def test_FillTriangleWithOptions_integration():
    test_window = OpenWindow("Triangle Test", 800, 600)
    FillTriangleWithOptions(ColorRed(), 100.0, 100.0, 200.0, 300.0, 300.0, 100.0, OptionDefaults())
    RefreshScreen()
    assert PointInTriangle(PointAt(150.0, 150.0), TriangleFrom(PointAt(100.0, 100.0), PointAt(200.0, 300.0), PointAt(300.0, 100.0))) is True
    assert PointInTriangle(PointAt(350.0, 150.0), TriangleFrom(PointAt(100.0, 100.0), PointAt(200.0, 300.0), PointAt(300.0, 100.0))) is False
    CloseWindow(test_window)


def test_FillTriangleOnBitmapRecord_integration():
    test_bitmap = CreateBitmap("test_bitmap", 100, 100)
    test_triangle = TriangleFrom(PointAt(25.0, 25.0), PointAt(75.0, 25.0), PointAt(50.0, 75.0))
    FillTriangleOnBitmap(test_bitmap, ColorBlack(), test_triangle)
    assert PixelDrawnAtPoint(test_bitmap, PointAt(50.0, 50.0)) is True
    assert PixelDrawnAtPoint(test_bitmap, PointAt(0.0, 0.0)) is False
    FreeBitmap(test_bitmap)


def test_FillTriangleOnBitmapRecordWithOptions_integration():
    test_bitmap = CreateBitmap("test_bitmap", 100, 100)
    test_triangle = TriangleFrom(PointAt(25.0, 25.0), PointAt(75.0, 25.0), PointAt(50.0, 75.0))
    FillTriangleOnBitmap(test_bitmap, ColorBlack(), test_triangle, OptionDefaults())
    assert PixelDrawnAtPoint(test_bitmap, PointAt(50.0, 50.0)) is True
    assert PixelDrawnAtPoint(test_bitmap, PointAt(10.0, 10.0)) is False
    FreeBitmap(test_bitmap)


def test_FillTriangleOnBitmap_integration():
    test_bitmap = CreateBitmap("test_bitmap", 100, 100)
    FillTriangleOnBitmap(test_bitmap, ColorBlack(), 25.0, 25.0, 75.0, 25.0, 50.0, 75.0)
    assert PixelDrawnAtPoint(test_bitmap, 50.0, 50.0) is True
    assert PixelDrawnAtPoint(test_bitmap, 0.0, 0.0) is False
    FreeBitmap(test_bitmap)


def test_FillTriangleOnBitmapWithOptions_integration():
    test_bitmap = CreateBitmap("test_bitmap", 100, 100)
    FillTriangleOnBitmapWithOptions(test_bitmap, ColorBlack(), 25.0, 25.0, 75.0, 25.0, 50.0, 75.0, OptionDefaults())
    assert PixelDrawnAtPoint(test_bitmap, 50.0, 50.0) is True
    assert PixelDrawnAtPoint(test_bitmap, 0.0, 0.0) is False
    FreeBitmap(test_bitmap)


def test_FillTriangleOnWindowRecord_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_triangle = TriangleFrom(PointAt(100.0, 100.0), PointAt(200.0, 300.0), PointAt(300.0, 100.0))
    FillTriangleOnWindow(test_window, ColorBlack(), test_triangle)
    RefreshScreen()
    assert PointInTriangle(PointAt(200.0, 200.0), test_triangle) is True
    CloseWindow(test_window)


def test_FillTriangleOnWindowRecordWithOptions_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_triangle = TriangleFrom(PointAt(100.0, 100.0), PointAt(200.0, 300.0), PointAt(300.0, 100.0))
    FillTriangleOnWindow(test_window, ColorBlack(), test_triangle, OptionDefaults())
    RefreshScreen()
    assert PointInTriangle(PointAt(200.0, 200.0), test_triangle) is True
    CloseWindow(test_window)


def test_FillTriangleOnWindow_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    FillTriangleOnWindow(test_window, ColorBlack(), 100.0, 100.0, 200.0, 300.0, 300.0, 100.0)
    RefreshScreen()
    assert PointInTriangle(PointAt(200.0, 200.0), TriangleFrom(PointAt(100.0, 100.0), PointAt(200.0, 300.0), PointAt(300.0, 100.0))) is True
    CloseWindow(test_window)


def test_FillTriangleOnWindowWithOptions_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    FillTriangleOnWindow(test_window, ColorBlack(), 100.0, 100.0, 200.0, 300.0, 300.0, 100.0, OptionDefaults())
    RefreshScreen()
    assert PointInTriangle(PointAt(150.0, 150.0), TriangleFrom(PointAt(100.0, 100.0), PointAt(200.0, 300.0), PointAt(300.0, 100.0))) is True
    assert PointInTriangle(PointAt(350.0, 150.0), TriangleFrom(PointAt(100.0, 100.0), PointAt(200.0, 300.0), PointAt(300.0, 100.0))) is False
    CloseWindow(test_window)

