import pytest
from splashkit import *


def test_DrawCircleRecord_integration():
    test_window = open_window("Test Window", 800, 600)
    test_circle = circle_at(400.0, 300.0, 50.0)
    draw_circle(color_black(), test_circle)
    refresh_screen()
    assert point_in_circle(point_at(400.0, 300.0), test_circle) is True
    close_window(test_window)


def test_DrawCircleRecordWithOptions_integration():
    test_window = open_window("Test Window", 800, 600)
    test_circle = circle_at(400.0, 300.0, 50.0)
    draw_circle(color_black(), test_circle, option_defaults())
    refresh_screen()
    assert point_in_circle(point_at(400.0, 300.0), test_circle) is True
    close_window(test_window)


def test_DrawCircle_integration():
    test_window = open_window("Test Window", 800, 600)
    draw_circle(color_black(), 400.0, 300.0, 50.0)
    refresh_screen()
    assert point_in_circle(point_at(400.0, 300.0), circle_at(400.0, 300.0, 50.0)) is True
    close_window(test_window)


def test_DrawCircleWithOptions_integration():
    test_window = open_window("Test Window", 800, 600)
    draw_circle(color_black(), 400.0, 300.0, 50.0, option_defaults())
    refresh_screen()
    assert point_in_circle(point_at(400.0, 300.0), circle_at(400.0, 300.0, 50.0)) is True
    close_window(test_window)


def test_DrawCircleOnBitmap_integration():
    test_bitmap = create_bitmap("test_bitmap", 200, 200)
    draw_circle_on_bitmap(test_bitmap, color_black(), 100.0, 100.0, 50.0)
    assert pixel_drawn_at_point(test_bitmap, 100.0, 100.0) is True
    free_bitmap(test_bitmap)


def test_DrawCircleOnBitmapWithOptions_integration():
    test_bitmap = create_bitmap("test_bitmap", 200, 200)
    draw_circle_on_bitmap(test_bitmap, color_black(), 100.0, 100.0, 50.0, option_defaults())
    assert pixel_drawn_at_point(test_bitmap, 100.0, 100.0) is True
    free_bitmap(test_bitmap)


def test_DrawCircleOnWindow_integration():
    test_window = open_window("Test Window", 800, 600)
    draw_circle_on_window(test_window, color_black(), 400.0, 300.0, 50.0)
    refresh_screen()
    assert point_in_circle(point_at(400.0, 300.0), circle_at(400.0, 300.0, 50.0)) is True
    close_window(test_window)


def test_DrawCircleOnWindowWithOptions_integration():
    test_window = open_window("Test Window", 800, 600)
    draw_circle_on_window(test_window, color_black(), 400.0, 300.0, 50.0, option_defaults())
    refresh_screen()
    assert point_in_circle(point_at(400.0, 300.0), circle_at(400.0, 300.0, 50.0)) is True
    close_window(test_window)


def test_FillCircleRecord_integration():
    test_window = open_window("Test Window", 800, 600)
    test_circle = circle_at(400.0, 300.0, 50.0)
    fill_circle(color_black(), test_circle)
    refresh_screen()
    assert point_in_circle(point_at(400.0, 300.0), test_circle) is True
    close_window(test_window)


def test_FillCircleRecordWithOptions_integration():
    test_window = open_window("Test Window", 800, 600)
    test_circle = circle_at(400.0, 300.0, 50.0)
    fill_circle(color_black(), test_circle, option_defaults())
    refresh_screen()
    assert point_in_circle(point_at(400.0, 300.0), test_circle) is True
    close_window(test_window)


def test_FillCircle_integration():
    test_window = open_window("Test Window", 800, 600)
    fill_circle(color_black(), 400.0, 300.0, 50.0)
    refresh_screen()
    assert point_in_circle(point_at(400.0, 300.0), circle_at(400.0, 300.0, 50.0)) is True
    close_window(test_window)


def test_FillCircleWithOptions_integration():
    test_window = open_window("Test Window", 800, 600)
    fill_circle(color_black(), 400.0, 300.0, 50.0, option_defaults())
    refresh_screen()
    assert point_in_circle(point_at(400.0, 300.0), circle_at(400.0, 300.0, 50.0)) is True
    close_window(test_window)


def test_FillCircleOnBitmap_integration():
    test_bitmap = create_bitmap("test_bitmap", 200, 200)
    fill_circle_on_bitmap(test_bitmap, color_red(), 100.0, 100.0, 50.0)
    assert pixel_drawn_at_point(test_bitmap, 100.0, 100.0) is True
    assert pixel_drawn_at_point(test_bitmap, 150.0, 100.0) is True
    assert pixel_drawn_at_point(test_bitmap, 200.0, 100.0) is False
    free_bitmap(test_bitmap)


def test_FillCircleOnBitmapWithOptions_integration():
    test_bitmap = create_bitmap("test_bitmap", 200, 200)
    fill_circle_on_bitmap(test_bitmap, color_black(), 100.0, 100.0, 50.0, option_defaults())
    assert pixel_drawn_at_point(test_bitmap, 100.0, 100.0) is True
    assert pixel_drawn_at_point(test_bitmap, 150.0, 100.0) is True
    assert pixel_drawn_at_point(test_bitmap, 200.0, 100.0) is False
    free_bitmap(test_bitmap)


def test_FillCircleOnWindow_integration():
    test_window = open_window("Test Window", 800, 600)
    fill_circle_on_window(test_window, color_black(), 400.0, 300.0, 50.0)
    refresh_screen()
    assert point_in_circle(point_at(400.0, 300.0), circle_at(400.0, 300.0, 50.0)) is True
    close_window(test_window)


def test_FillCircleOnWindowWithOptions_integration():
    test_window = open_window("Test Window", 800, 600)
    fill_circle_on_window(test_window, color_black(), 400.0, 300.0, 50.0, option_defaults())
    refresh_screen()
    assert point_in_circle(point_at(400.0, 300.0), circle_at(400.0, 300.0, 50.0)) is True
    close_window(test_window)


def test_CurrentClip_integration():
    test_window = open_window("Test Window", 800, 600)
    test_clip = current_clip()
    assert test_clip.width == 800
    assert test_clip.height == 600
    close_window(test_window)


def test_CurrentClipForBitmap_integration():
    test_bitmap = create_bitmap("test_bitmap", 100, 100)
    test_rectangle = rectangle_from(10, 10, 50, 50)
    push_clip(test_bitmap, test_rectangle)
    test_clip = current_clip(test_bitmap)
    assert rectangle_left(test_clip) == 10
    assert rectangle_top(test_clip) == 10
    assert test_clip.width == 50
    assert test_clip.height == 50
    free_bitmap(test_bitmap)


def test_CurrentClipForWindow_integration():
    test_window = open_window("Test Window", 800, 600)
    test_clip = current_clip(test_window)
    assert rectangle_from(0, 0, 800, 600) == test_clip
    close_window(test_window)


def test_PopClipForWindow_integration():
    test_window = open_window("Test Window", 800, 600)
    test_rectangle = rectangle_from(100, 100, 200, 200)
    push_clip(test_window, test_rectangle)
    test_current_clip = current_clip(test_window)
    assert test_current_clip == test_rectangle
    pop_clip(test_window)
    test_current_clip_after_pop = current_clip(test_window)
    assert rectangle_from(0, 0, 800, 600) == test_current_clip_after_pop
    close_window(test_window)


def test_PopClip_integration():
    test_window = open_window("Test Window", 800, 600)
    push_clip(rectangle_from(100, 100, 200, 200))
    draw_circle(color_black(), 150, 150, 50)
    refresh_screen()
    assert point_in_circle(point_at(150, 150), circle_at(150, 150, 50)) is True
    pop_clip()
    draw_circle(color_red(), 300, 300, 50)
    refresh_screen()
    assert point_in_circle(point_at(300, 300), circle_at(300, 300, 50)) is True
    close_window(test_window)


def test_PopClipForBitmap_integration():
    test_bitmap = create_bitmap("test_bitmap", 100, 100)
    push_clip(test_bitmap, rectangle_from(0, 0, 50, 50))
    pop_clip(test_bitmap)
    assert current_clip(test_bitmap) == rectangle_from(0, 0, 100, 100)
    free_bitmap(test_bitmap)


def test_PushClipForWindow_integration():
    test_window = open_window("Test Window", 800, 600)
    test_rectangle = rectangle_from(100.0, 100.0, 200.0, 200.0)
    push_clip_for_window(test_window, test_rectangle)
    test_current_clip = current_clip_for_window(test_window)
    assert test_current_clip == test_rectangle
    refresh_screen()
    close_window(test_window)


def test_PushClipForBitmap_integration():
    test_bitmap = create_bitmap("test_bitmap", 200, 200)
    test_rectangle = rectangle_from(50, 50, 100, 100)
    push_clip(test_bitmap, test_rectangle)
    test_current_clip = current_clip(test_bitmap)
    assert rectangle_left(test_current_clip) == 50
    assert rectangle_top(test_current_clip) == 50
    assert test_current_clip.width == 100
    assert test_current_clip.height == 100
    free_bitmap(test_bitmap)


def test_PushClip_integration():
    test_window = open_window("Test Window", 800, 600)
    test_rectangle = rectangle_from(100.0, 100.0, 200.0, 200.0)
    push_clip(test_rectangle)
    test_current_clip = current_clip()
    assert test_current_clip == test_rectangle
    close_window(test_window)


def test_ResetClipForBitmap_integration():
    test_bitmap = create_bitmap("test_bitmap", 100, 100)
    push_clip(test_bitmap, rectangle_from(10, 10, 50, 50))
    reset_clip_for_bitmap(test_bitmap)
    assert current_clip_for_bitmap(test_bitmap) == rectangle_from(0, 0, 100, 100)
    free_bitmap(test_bitmap)


def test_ResetClip_integration():
    test_window = open_window("Test Window", 800, 600)
    push_clip(rectangle_from(100, 100, 200, 200))
    reset_clip()
    test_clip_rect = current_clip()
    assert rectangle_from(0, 0, 800, 600) == test_clip_rect
    close_window(test_window)


def test_ResetClipForWindow_integration():
    test_window = open_window("Test Window", 800, 600)
    push_clip(test_window, rectangle_from(100, 100, 200, 200))
    reset_clip_for_window(test_window)
    test_clip_rect = current_clip_for_window(test_window)
    assert rectangle_from(0, 0, 800, 600) == test_clip_rect
    close_window(test_window)


def test_SetClip_integration():
    test_window = open_window("Test Window", 800, 600)
    test_rectangle = rectangle_from(100.0, 100.0, 200.0, 200.0)
    set_clip(test_rectangle)
    test_current_clip = current_clip()
    assert test_current_clip == test_rectangle
    close_window(test_window)


def test_SetClipForBitmap_integration():
    test_bitmap = create_bitmap("test_bitmap", 200, 200)
    test_rectangle = rectangle_from(50, 50, 100, 100)
    set_clip(test_bitmap, test_rectangle)
    test_current_clip = current_clip(test_bitmap)
    assert test_current_clip == test_rectangle
    free_bitmap(test_bitmap)


def test_SetClipForWindow_integration():
    test_window = open_window("Test Window", 800, 600)
    test_rectangle = rectangle_from(100, 100, 200, 200)
    set_clip(test_window, test_rectangle)
    test_current_clip = current_clip(test_window)
    assert test_current_clip == test_rectangle
    close_window(test_window)


def test_OptionDefaults_integration():
    test_options = option_defaults()
    assert test_options is not None


def test_OptionDrawToBitmap_integration():
    test_bitmap = create_bitmap("test_bitmap", 100, 100)
    test_options = option_draw_to_bitmap(test_bitmap)
    draw_circle(color_black(), circle_at(50.0, 50.0, 25.0), test_options)
    assert pixel_drawn_at_point(test_bitmap, 50.0, 50.0) is True
    assert pixel_drawn_at_point(test_bitmap, 100.0, 100.0) is False
    free_bitmap(test_bitmap)


def test_OptionDrawToBitmapWithOptions_integration():
    test_bitmap = create_bitmap("test_bitmap", 100, 100)
    test_options = option_defaults()
    test_drawing_options = option_draw_to_bitmap_with_options(test_bitmap, test_options)
    draw_circle(color_black(), circle_at(50.0, 50.0, 25.0), test_drawing_options)
    assert pixel_drawn_at_point(test_bitmap, 50.0, 50.0) is True
    assert pixel_drawn_at_point(test_bitmap, 100.0, 100.0) is False
    free_bitmap(test_bitmap)


def test_OptionDrawToWindow_integration():
    test_window = open_window("Test Window", 800, 600)
    test_circle = circle_at(400.0, 300.0, 50.0)
    draw_circle(color_black(), test_circle, option_draw_to_window(test_window))
    refresh_screen()
    assert point_in_circle(point_at(400.0, 300.0), test_circle) is True
    close_window(test_window)


def test_OptionDrawToWindowWithOptions_integration():
    test_window = open_window("Test Window", 800, 600)
    test_options = option_defaults()
    test_draw_options = option_draw_to_window_with_options(test_window, test_options)
    draw_circle(color_black(), circle_at(400.0, 300.0, 50.0), test_draw_options)
    refresh_screen()
    assert point_in_circle(point_at(400.0, 300.0), circle_at(400.0, 300.0, 50.0)) is True
    close_window(test_window)


def test_OptionFlipX_integration():
    test_window = open_window("Test Window", 800, 600)
    test_bitmap = load_bitmap("test_bitmap", "test_bitmap.png")
    draw_bitmap_with_options(test_bitmap, 100.0, 100.0, option_flip_x())
    refresh_screen()
    assert pixel_drawn_at_point(test_bitmap, point_at(50.0, 100.0)) is True
    assert pixel_drawn_at_point(test_bitmap, point_at(150.0, 100.0)) is False
    free_bitmap(test_bitmap)
    close_window(test_window)


def test_OptionFlipXWithOptions_integration():
    test_window = open_window("Test Window", 800, 600)
    test_bitmap = load_bitmap("test_bitmap", "test_bitmap.png")
    draw_bitmap_with_options(test_bitmap, 400, 300, option_flip_x(option_defaults()))
    refresh_screen()
    assert pixel_drawn_at_point(test_bitmap, point_at(bitmap_width(test_bitmap), bitmap_height(test_bitmap))) is True
    assert pixel_drawn_at_point(test_bitmap, point_at(0, bitmap_height(test_bitmap))) is False
    free_bitmap(test_bitmap)
    close_window(test_window)


def test_OptionFlipXy_integration():
    test_window = open_window("Test Window", 800, 600)
    test_bitmap = load_bitmap("test_bitmap", "test_bitmap.png")
    draw_bitmap_with_options(test_bitmap, 400.0, 300.0, option_flip_xy())
    refresh_screen()
    assert pixel_drawn_at_point(test_bitmap, point_at(bitmap_width(test_bitmap), 0.0)) is True
    assert pixel_drawn_at_point(test_bitmap, point_at(0.0, bitmap_height(test_bitmap))) is True
    free_bitmap(test_bitmap)
    close_window(test_window)


def test_OptionFlipXyWithOptions_integration():
    test_window = open_window("Test Window", 800, 600)
    test_bitmap = load_bitmap("test_bitmap", "test_bitmap.png")
    test_options = option_defaults()
    test_options_flipped = option_flip_xy(test_options)
    draw_bitmap_with_options(test_bitmap, 400, 300, test_options_flipped)
    refresh_screen()
    assert pixel_drawn_at_point(test_bitmap, point_at(bitmap_width(test_bitmap), 0)) is True
    assert pixel_drawn_at_point(test_bitmap, point_at(0, bitmap_height(test_bitmap))) is False
    free_bitmap(test_bitmap)
    close_window(test_window)


def test_OptionFlipY_integration():
    test_window = open_window("Test Window", 800, 600)
    test_bitmap = load_bitmap("test_bitmap", "test_bitmap.png")
    draw_bitmap_with_options(test_bitmap, 400.0, 300.0, option_flip_y())
    refresh_screen()
    assert pixel_drawn_at_point(test_bitmap, 400.0, bitmap_height(test_bitmap)) is True
    assert pixel_drawn_at_point(test_bitmap, 400.0, 0.0) is False
    free_bitmap(test_bitmap)
    close_window(test_window)


def test_OptionFlipYWithOptions_integration():
    test_window = open_window("Test Window", 800, 600)
    test_bitmap = load_bitmap("test_bitmap", "test_bitmap.png")
    draw_bitmap_with_options(test_bitmap, 400.0, 300.0, option_flip_y(option_defaults()))
    refresh_screen()
    assert pixel_drawn_at_point(test_bitmap, point_at(400.0, bitmap_height(test_bitmap))) is True
    assert pixel_drawn_at_point(test_bitmap, point_at(400.0, 0.0)) is False
    free_bitmap(test_bitmap)
    close_window(test_window)


def test_OptionLineWidth_integration():
    test_window = open_window("Test Window", 800, 600)
    draw_line(color_black(), 100.0, 100.0, 200.0, 200.0, option_line_width(1))
    refresh_screen()
    assert get_pixel(point_at(100.0, 100.0)) == color_black()
    draw_line(color_black(), 300.0, 300.0, 400.0, 400.0, option_line_width(5))
    refresh_screen()
    assert get_pixel(point_at(300.0, 300.0)) == color_black()
    close_window(test_window)


def test_OptionLineWidthWithOptions_integration():
    test_window = open_window("Test Window", 800, 600)
    test_circle = circle_at(400.0, 300.0, 50.0)
    draw_circle(color_black(), test_circle, option_line_width(3, option_defaults()))
    refresh_screen()
    assert point_in_circle(point_at(400.0, 300.0), test_circle) is True
    close_window(test_window)


def test_OptionPartBmp_integration():
    test_window = open_window("Test Window", 800, 600)
    test_bitmap = load_bitmap("test_bitmap", "test_bitmap.png")
    test_options = option_part_bmp(0.0, 0.0, 50.0, 50.0)
    draw_bitmap_with_options(test_bitmap, 100.0, 100.0, test_options)
    refresh_screen()
    assert pixel_drawn_at_point(test_bitmap, point_at(25.0, 25.0)) is True
    assert pixel_drawn_at_point(test_bitmap, point_at(75.0, 75.0)) is False
    free_bitmap(test_bitmap)
    close_window(test_window)


def test_OptionPartBmpWithOptions_integration():
    test_window = open_window("Test Window", 800, 600)
    test_bitmap = load_bitmap("test_bitmap", "test_bitmap.png")
    test_options = option_part_bmp(10.0, 10.0, 50.0, 50.0, option_defaults())
    draw_bitmap_with_options(test_bitmap, 100.0, 100.0, test_options)
    refresh_screen()
    assert pixel_drawn_at_point(test_bitmap, point_at(110.0, 110.0)) is True
    assert pixel_drawn_at_point(test_bitmap, point_at(160.0, 160.0)) is False
    free_bitmap(test_bitmap)
    close_window(test_window)


def test_OptionPartBmpFromRectangle_integration():
    test_window = open_window("Test Window", 800, 600)
    test_bitmap = load_bitmap("test_bitmap", "test_bitmap.png")
    test_rectangle = rectangle_from(100, 100, 200, 200)
    test_options = option_part_bmp(test_rectangle)
    draw_bitmap_with_options(test_bitmap, 0, 0, test_options)
    refresh_screen()
    assert pixel_drawn_at_point(test_bitmap, point_at(150, 150)) is True
    assert pixel_drawn_at_point(test_bitmap, point_at(350, 350)) is False
    free_bitmap(test_bitmap)
    close_window(test_window)


def test_OptionPartBmpFromRectangleWithOptions_integration():
    test_window = open_window("Test Window", 800, 600)
    test_bitmap = load_bitmap("test_bitmap", "test_bitmap.png")
    test_rectangle = rectangle_from(100.0, 100.0, 200.0, 200.0)
    test_options = option_part_bmp(test_rectangle, option_defaults())
    draw_bitmap_with_options(test_bitmap, 0.0, 0.0, test_options)
    refresh_screen()
    assert pixel_drawn_at_point(test_bitmap, point_at(150.0, 150.0)) is True
    assert pixel_drawn_at_point(test_bitmap, point_at(350.0, 350.0)) is False
    free_bitmap(test_bitmap)
    close_window(test_window)


def test_OptionRotateBmp_integration():
    test_window = open_window("Test Window", 800, 600)
    test_bitmap = load_bitmap("test_bitmap", "test_bitmap.png")
    draw_bitmap_with_options(test_bitmap, 400.0, 300.0, option_rotate_bmp(45.0))
    refresh_screen()
    assert pixel_drawn_at_point(test_bitmap, point_at(400.0, 300.0)) is True
    assert pixel_drawn_at_point(test_bitmap, point_at(bitmap_width(test_bitmap), 300.0)) is False
    free_bitmap(test_bitmap)
    close_window(test_window)


def test_OptionRotateBmpWithAnchor_integration():
    test_window = open_window("Rotation Test", 800, 600)
    test_bitmap = load_bitmap("test_bitmap", "test_bitmap.png")
    test_options = option_rotate_bmp(45.0, 50.0, 50.0)
    draw_bitmap_with_options(test_bitmap, 400.0, 300.0, test_options)
    refresh_screen()
    assert pixel_drawn_at_point(test_bitmap, point_at(400.0, 300.0)) is True
    assert pixel_drawn_at_point(test_bitmap, point_at(bitmap_width(test_bitmap), bitmap_height(test_bitmap))) is True
    free_bitmap(test_bitmap)
    close_window(test_window)


def test_OptionRotateBmpWithAnchorAndOptions_integration():
    test_window = open_window("Test Window", 800, 600)
    test_bitmap = load_bitmap("test_bitmap", "test_bitmap.png")
    test_options = option_rotate_bmp(45.0, 50.0, 50.0, option_defaults())
    draw_bitmap_with_options(test_bitmap, 400.0, 300.0, test_options)
    refresh_screen()
    assert pixel_drawn_at_point(test_bitmap, point_at(400.0, 300.0)) is True
    free_bitmap(test_bitmap)
    close_window(test_window)


def test_OptionRotateBmpWithOptions_integration():
    test_window = open_window("Test Window", 800, 600)
    test_bitmap = load_bitmap("test_bitmap", "test_bitmap.png")
    test_options = option_rotate_bmp(45.0, option_defaults())
    draw_bitmap_with_options(test_bitmap, 400.0, 300.0, test_options)
    refresh_screen()
    assert pixel_drawn_at_point(test_bitmap, point_at(400.0, 300.0)) is True
    assert pixel_drawn_at_point(test_bitmap, point_at(cosine(45.0), sine(45.0))) is True
    free_bitmap(test_bitmap)
    close_window(test_window)


def test_OptionScaleBmp_integration():
    test_window = open_window("Test Window", 800, 600)
    test_bitmap = load_bitmap("test_bitmap", "test_bitmap.png")
    draw_bitmap_with_options(test_bitmap, 100.0, 100.0, option_scale_bmp(2.0, 2.0))
    refresh_screen()
    assert pixel_drawn_at_point(test_bitmap, point_at(100.0, 100.0)) is True
    assert pixel_drawn_at_point(test_bitmap, point_at(bitmap_width(test_bitmap), bitmap_height(test_bitmap))) is True
    free_bitmap(test_bitmap)
    close_window(test_window)


def test_OptionScaleBmpWithOptions_integration():
    test_window = open_window("Test Window", 800, 600)
    test_bitmap = load_bitmap("test_bitmap", "test_bitmap.png")
    test_options = option_scale_bmp(2.0, 2.0, option_defaults())
    draw_bitmap_with_options(test_bitmap, 100.0, 100.0, test_options)
    refresh_screen()
    assert pixel_drawn_at_point(test_bitmap, point_at(100.0, 100.0)) is True
    assert pixel_drawn_at_point(test_bitmap, point_at(bitmap_width(test_bitmap), bitmap_height(test_bitmap))) is True
    free_bitmap(test_bitmap)
    close_window(test_window)


def test_OptionToScreen_integration():
    test_window = open_window("Test Window", 800, 600)
    test_options = option_to_screen()
    draw_circle(color_black(), circle_at(400.0, 300.0, 50.0), test_options)
    refresh_screen()
    assert point_in_circle(point_at(400.0, 300.0), circle_at(400.0, 300.0, 50.0)) is True
    close_window(test_window)


def test_OptionToScreenWithOptions_integration():
    test_window = open_window("Test Window", 800, 600)
    test_options = option_defaults()
    test_screen_options = option_to_screen(test_options)
    draw_circle(color_black(), circle_at(400.0, 300.0, 50.0), test_screen_options)
    refresh_screen()
    assert point_in_circle(point_at(400.0, 300.0), circle_at(400.0, 300.0, 50.0)) is True
    close_window(test_window)


def test_OptionToWorld_integration():
    test_window = open_window("Test Window", 800, 600)
    move_camera_to(100.0, 100.0)
    draw_circle(color_black(), 100.0, 100.0, 50.0, option_to_world())
    refresh_screen()
    assert point_in_circle(point_at(0.0, 0.0), circle_at(100.0, 100.0, 50.0)) is True
    close_window(test_window)


def test_OptionToWorldWithOptions_integration():
    test_window = open_window("Test Window", 800, 600)
    test_options = option_defaults()
    test_world_options = option_to_world(test_options)
    draw_circle(color_black(), circle_at(100.0, 100.0, 50.0), test_world_options)
    refresh_screen()
    assert point_in_circle(point_at(100.0, 100.0), circle_at(100.0, 100.0, 50.0)) is True
    close_window(test_window)


def test_OptionWithAnimation_integration():
    test_window = open_window("Test Window", 800, 600)
    test_bitmap = create_bitmap("test_bitmap", 100, 100)
    test_animation = create_animation("script", "test_animation")
    draw_bitmap(test_bitmap, 100, 100, option_with_animation(test_animation))
    draw_bitmap(test_bitmap, 100.0, 100.0, option_with_animation(test_animation))
    refresh_screen()
    assert pixel_drawn_at_point(test_bitmap, point_at(50.0, 50.0)) is True
    free_bitmap(test_bitmap)
    free_animation(test_animation)
    close_window(test_window)


def test_OptionWithAnimationWithOptions_integration():
    test_window = open_window("Test Window", 800, 600)
    test_bitmap = load_bitmap("test_bitmap", "test_bitmap.png")
    test_animation = create_animation("script", "test_animation")
    draw_bitmap(test_bitmap, 100, 100, option_with_animation(test_animation))
    test_options = option_with_animation(test_animation, option_defaults())
    draw_bitmap(test_bitmap, 100.0, 100.0, test_options)
    refresh_screen()
    assert pixel_drawn_at_point(test_bitmap, point_at(100.0, 100.0)) is True
    free_bitmap(test_bitmap)
    free_animation(test_animation)
    close_window(test_window)


def test_OptionWithBitmapCell_integration():
    test_bitmap = load_bitmap("test_bitmap", "test_bitmap.png")
    bitmap_set_cell_details(test_bitmap, 32, 32, 4, 4, 16)
    test_window = open_window("Test Window", 800, 600)
    draw_bitmap_with_options(test_bitmap, 100.0, 100.0, option_with_bitmap_cell(5))
    refresh_screen()
    assert pixel_drawn_at_point(test_bitmap, point_at(116.0, 116.0)) is True
    assert pixel_drawn_at_point(test_bitmap, point_at(150.0, 150.0)) is False
    close_window(test_window)
    free_bitmap(test_bitmap)


def test_OptionWithBitmapCellWithOptions_integration():
    test_window = open_window("Test Window", 800, 600)
    test_bitmap = load_bitmap("test_bitmap", "test_bitmap.png")
    bitmap_set_cell_details(test_bitmap, 32, 32, 4, 4, 16)
    test_options = option_with_bitmap_cell(5, option_defaults())
    draw_bitmap(test_bitmap, 100.0, 100.0, test_options)
    refresh_screen()
    assert pixel_drawn_at_point(test_bitmap, point_at(116.0, 116.0)) is True
    assert pixel_drawn_at_point(test_bitmap, point_at(150.0, 150.0)) is False
    free_bitmap(test_bitmap)
    close_window(test_window)


def test_DrawEllipseWithinRectangle_integration():
    test_window = open_window("Test Window", 800, 600)
    test_rectangle = rectangle_from(100.0, 100.0, 200.0, 150.0)
    draw_ellipse(color_black(), test_rectangle, option_defaults())
    refresh_screen()
    assert point_in_circle(point_at(200.0, 175.0), circle_at(rectangle_center(test_rectangle), test_rectangle.width)) is True
    assert point_in_circle(point_at(350.0, 175.0), circle_at(rectangle_center(test_rectangle), test_rectangle.width)) is False
    close_window(test_window)


def test_DrawEllipseWithinRectangleWithOptions_integration():
    test_window = open_window("Test Window", 800, 600)
    test_rectangle = rectangle_from(100.0, 100.0, 200.0, 100.0)
    draw_ellipse(color_black(), test_rectangle, option_defaults())
    refresh_screen()
    assert point_in_circle(point_at(200.0, 150.0), circle_at(rectangle_center(test_rectangle), test_rectangle.width)) is True
    close_window(test_window)


def test_DrawEllipse_integration():
    test_window = open_window("Test Window", 800, 600)
    draw_ellipse(color_black(), 400.0, 300.0, 100.0, 50.0)
    refresh_screen()
    assert point_in_circle(point_at(400.0, 300.0), circle_at(400.0, 300.0, 50.0)) is True
    assert point_in_circle(point_at(550.0, 300.0), circle_at(400.0, 300.0, 50.0)) is False
    close_window(test_window)


def test_DrawEllipseWithOptions_integration():
    test_window = open_window("Test Window", 800, 600)
    draw_ellipse(color_black(), 400.0, 300.0, 100.0, 50.0, option_defaults())
    refresh_screen()
    assert point_in_circle(point_at(400.0, 300.0), circle_at(400.0, 300.0, 50.0)) is True
    close_window(test_window)


def test_DrawEllipseOnBitmapWithinRectangle_integration():
    test_bitmap = create_bitmap("test_bitmap", 200, 200)
    test_rectangle = rectangle_from(50.0, 50.0, 100.0, 100.0)
    draw_ellipse_on_bitmap(test_bitmap, color_black(), test_rectangle)
    assert pixel_drawn_at_point(test_bitmap, point_at(100.0, 100.0)) is True
    assert pixel_drawn_at_point(test_bitmap, point_at(200.0, 200.0)) is False
    free_bitmap(test_bitmap)


def test_DrawEllipseOnBitmapWithinRectangleWithOptions_integration():
    test_bitmap = create_bitmap("test_bitmap", 200, 200)
    test_rect = rectangle_from(50.0, 50.0, 100.0, 100.0)
    draw_ellipse_on_bitmap(test_bitmap, color_black(), test_rect, option_defaults())
    assert pixel_drawn_at_point(test_bitmap, point_at(75.0, 75.0)) is True
    assert pixel_drawn_at_point(test_bitmap, point_at(0.0, 0.0)) is False
    free_bitmap(test_bitmap)


def test_DrawEllipseOnBitmap_integration():
    test_bitmap = create_bitmap("test_bitmap", 200, 200)
    test_color = color_black()
    draw_ellipse_on_bitmap(test_bitmap, test_color, 100.0, 100.0, 50.0, 30.0)
    assert pixel_drawn_at_point(test_bitmap, 100.0, 100.0) is True
    assert pixel_drawn_at_point(test_bitmap, 160.0, 100.0) is False
    free_bitmap(test_bitmap)


def test_DrawEllipseOnBitmapWithOptions_integration():
    test_bitmap = create_bitmap("test_bitmap", 200, 200)
    draw_ellipse_on_bitmap(test_bitmap, color_black(), 100.0, 100.0, 50.0, 30.0, option_defaults())
    assert pixel_drawn_at_point(test_bitmap, point_at(100.0, 100.0)) is True
    assert pixel_drawn_at_point(test_bitmap, point_at(150.0, 100.0)) is False
    free_bitmap(test_bitmap)


def test_DrawEllipseOnWindowWithinRectangle_integration():
    test_window = open_window("Test Window", 800, 600)
    test_rectangle = rectangle_from(100.0, 100.0, 200.0, 100.0)
    draw_ellipse_on_window(test_window, color_black(), test_rectangle)
    refresh_screen()
    assert point_in_circle(point_at(200.0, 150.0), circle_at(rectangle_center(test_rectangle), test_rectangle.width)) is True
    close_window(test_window)


def test_DrawEllipseOnWindowWithinRectangleWithOptions_integration():
    test_window = open_window("Test Window", 800, 600)
    test_rect = rectangle_from(100.0, 100.0, 200.0, 100.0)
    draw_ellipse_on_window(test_window, color_black(), test_rect, option_defaults())
    refresh_screen()
    assert point_in_circle(point_at(200.0, 150.0), circle_at(point_at(200.0, 150.0), 100.0)) is True
    close_window(test_window)


def test_DrawEllipseOnWindow_integration():
    test_window = open_window("Test Window", 800, 600)
    draw_ellipse_on_window(test_window, color_black(), 400.0, 300.0, 100.0, 50.0)
    refresh_screen()
    assert point_in_circle(point_at(400.0, 300.0), circle_at(400.0, 300.0, 50.0)) is True
    close_window(test_window)


def test_DrawEllipseOnWindowWithOptions_integration():
    test_window = open_window("Test Window", 800, 600)
    draw_ellipse_on_window(test_window, color_black(), 400.0, 300.0, 100.0, 50.0, option_defaults())
    refresh_screen()
    assert point_in_circle(point_at(400.0, 300.0), circle_at(400.0, 300.0, 50.0)) is True
    close_window(test_window)


def test_FillEllipseWithinRectangle_integration():
    test_window = open_window("Test Window", 800, 600)
    test_rectangle = rectangle_from(100.0, 100.0, 200.0, 100.0)
    fill_ellipse(color_black(), test_rectangle)
    refresh_screen()
    assert point_in_circle(point_at(200.0, 150.0), circle_at(rectangle_center(test_rectangle), test_rectangle.width)) is True
    assert point_in_circle(point_at(350.0, 150.0), circle_at(rectangle_center(test_rectangle), test_rectangle.width)) is False
    close_window(test_window)


def test_FillEllipseWithinRectangleWithOptions_integration():
    test_window = open_window("Test Window", 800, 600)
    test_rectangle = rectangle_from(100.0, 100.0, 200.0, 100.0)
    fill_ellipse(color_black(), test_rectangle, option_defaults())
    refresh_screen()
    assert point_in_circle(point_at(200.0, 150.0), circle_at(rectangle_center(test_rectangle), test_rectangle.width)) is True
    close_window(test_window)


def test_FillEllipse_integration():
    test_window = open_window("Test Window", 800, 600)
    fill_ellipse(color_black(), 400.0, 300.0, 100.0, 50.0)
    refresh_screen()
    assert point_in_circle(point_at(400.0, 300.0), circle_at(400.0, 300.0, 50.0)) is True
    assert point_in_circle(point_at(550.0, 300.0), circle_at(400.0, 300.0, 50.0)) is False
    close_window(test_window)


def test_FillEllipseWithOptions_integration():
    test_window = open_window("Test Window", 800, 600)
    fill_ellipse(color_black(), 400.0, 300.0, 100.0, 50.0, option_defaults())
    refresh_screen()
    assert point_in_circle(point_at(400.0, 300.0), circle_at(400.0, 300.0, 50.0)) is True
    close_window(test_window)


def test_FillEllipseOnBitmapWithinRectangle_integration():
    test_bitmap = create_bitmap("test_bitmap", 200, 200)
    test_rectangle = rectangle_from(50.0, 50.0, 100.0, 100.0)
    fill_ellipse_on_bitmap(test_bitmap, color_black(), test_rectangle)
    assert pixel_drawn_at_point(test_bitmap, point_at(100.0, 100.0)) is True
    assert pixel_drawn_at_point(test_bitmap, point_at(200.0, 200.0)) is False
    free_bitmap(test_bitmap)


def test_FillEllipseOnBitmapWithinRectangleWithOptions_integration():
    test_bitmap = create_bitmap("test_bitmap", 200, 200)
    test_rect = rectangle_from(50.0, 50.0, 100.0, 100.0)
    fill_ellipse_on_bitmap(test_bitmap, color_black(), test_rect, option_defaults())
    assert pixel_drawn_at_point(test_bitmap, point_at(100.0, 100.0)) is True
    assert pixel_drawn_at_point(test_bitmap, point_at(200.0, 100.0)) is False
    free_bitmap(test_bitmap)


def test_FillEllipseOnBitmap_integration():
    test_bitmap = create_bitmap("test_bitmap", 200, 200)
    fill_ellipse_on_bitmap(test_bitmap, color_black(), 100.0, 100.0, 50.0, 30.0)
    assert pixel_drawn_at_point(test_bitmap, 100.0, 100.0) is True
    assert pixel_drawn_at_point(test_bitmap, 125.0, 100.0) is True
    assert pixel_drawn_at_point(test_bitmap, 150.0, 100.0) is False
    free_bitmap(test_bitmap)


def test_FillEllipseOnBitmapWithOptions_integration():
    test_bitmap = create_bitmap("test_bitmap", 200, 200)
    fill_ellipse_on_bitmap(test_bitmap, color_black(), 50.0, 50.0, 100.0, 50.0, option_defaults())
    assert pixel_drawn_at_point(test_bitmap, 50.0, 50.0) is True
    assert pixel_drawn_at_point(test_bitmap, 150.0, 50.0) is False
    free_bitmap(test_bitmap)


def test_FillEllipseOnWindowWithinRectangle_integration():
    test_window = open_window("Test Window", 800, 600)
    test_rectangle = rectangle_from(100.0, 100.0, 200.0, 150.0)
    fill_ellipse_on_window(test_window, color_black(), test_rectangle)
    refresh_screen()
    assert point_in_circle(point_at(200.0, 175.0), circle_at(rectangle_center(test_rectangle), test_rectangle.width)) is True
    close_window(test_window)


def test_FillEllipseOnWindowWithinRectangleWithOptions_integration():
    test_window = open_window("Test Window", 800, 600)
    test_rectangle = rectangle_from(100.0, 100.0, 200.0, 150.0)
    fill_ellipse_on_window(test_window, color_black(), test_rectangle, option_defaults())
    refresh_screen()
    assert point_in_circle(point_at(200.0, 175.0), circle_at(200.0, 175.0, 100.0)) is True
    close_window(test_window)


def test_FillEllipseOnWindow_integration():
    test_window = open_window("Test Window", 800, 600)
    fill_ellipse_on_window(test_window, color_black(), 400.0, 300.0, 100.0, 50.0)
    refresh_screen()
    assert point_in_circle(point_at(400.0, 300.0), circle_at(400.0, 300.0, 50.0)) is True
    close_window(test_window)


def test_FillEllipseOnWindowWithOptions_integration():
    test_window = open_window("Test Window", 800, 600)
    fill_ellipse_on_window(test_window, color_black(), 400.0, 300.0, 100.0, 50.0, option_defaults())
    refresh_screen()
    assert point_in_circle(point_at(400.0, 300.0), circle_at(400.0, 300.0, 50.0)) is True
    close_window(test_window)


def test_ClearScreenToWhite_integration():
    test_window = open_window("Test Window", 800, 600)
    draw_pixel(color_black(), 100.0, 100.0)
    refresh_screen()
    assert get_pixel(point_at(100.0, 100.0)) == color_black()
    clear_screen()
    refresh_screen()
    assert get_pixel(point_at(100.0, 100.0)) != color_black()
    close_window(test_window)


def test_ClearScreen_integration():
    test_window = open_window("Test Window", 800, 600)
    draw_pixel(color_black(), 100.0, 100.0)
    refresh_screen()
    assert get_pixel(point_at(400.0, 300.0)) == color_black()
    clear_screen(color_white())
    refresh_screen()
    assert get_pixel(point_at(400.0, 300.0)) != color_black()
    close_window(test_window)


def test_DisplayDetails_integration():
    test_number_of_displays = number_of_displays()
    assert test_number_of_displays > 0
    test_display = display_details(0)
    assert test_display is not None
    assert display_width(test_display) > 0
    assert display_height(test_display) > 0
    assert test_number_of_displays == 0


def test_DisplayHeight_integration():
    test_display = display_details(0)
    test_height = display_height(test_display)
    assert test_height > 0


def test_DisplayName_integration():
    test_display = display_details(0)
    test_display_name = display_name(test_display)
    assert test_display_name is not None


def test_DisplayWidth_integration():
    test_display = display_details(0)
    test_width = display_width(test_display)
    assert test_width > 0


def test_DisplayX_integration():
    test_display = display_details(0)
    test_x = display_x(test_display)
    assert test_x > -1


def test_DisplayY_integration():
    test_display = display_details(0)
    test_y = display_y(test_display)
    assert test_y != -1


def test_NumberOfDisplays_integration():
    test_display_count = number_of_displays()
    assert test_display_count > 0


def test_RefreshScreen_integration():
    test_window = open_window("Test Window", 800, 600)
    draw_circle(color_black(), circle_at(400.0, 300.0, 50.0))
    refresh_screen()
    assert point_in_circle(point_at(400.0, 300.0), circle_at(400.0, 300.0, 50.0)) is True
    close_window(test_window)


def test_RefreshScreenWithTargetFps_integration():
    test_window = open_window("Test Window", 800, 600)
    refresh_screen(60)
    assert window_close_requested(test_window) is True
    close_window(test_window)


def test_SaveBitmap_integration():
    test_bitmap = create_bitmap("test_bitmap", 100, 100)
    draw_pixel_on_bitmap(test_bitmap, color_black(), 50, 50)
    save_bitmap(test_bitmap, "test_save")
    free_bitmap(test_bitmap)


def test_ScreenHeight_integration():
    test_window = open_window("Test Window", 800, 600)
    test_height = screen_height()
    assert test_height == 600
    close_window(test_window)


def test_ScreenWidth_integration():
    test_window = open_window("Test Window", 800, 600)
    test_width = screen_width()
    assert test_width == 800
    close_window(test_window)


def test_TakeScreenshot_integration():
    test_window = open_window("Test Window", 800, 600)
    draw_circle(color_black(), 400, 300, 50)
    refresh_screen()
    take_screenshot("screenshot_test")
    close_window(test_window)


def test_TakeScreenshotOfWindow_integration():
    test_window = open_window("Test Window", 800, 600)
    draw_circle(color_black(), 400, 300, 50)
    refresh_screen()
    take_screenshot(test_window, "screenshot_test")
    close_window(test_window)


def test_BitmapBoundingCircle_integration():
    test_bitmap = create_bitmap("test_bitmap", 100, 100)
    test_point = point_at(50.0, 50.0)
    test_circle = bitmap_bounding_circle(test_bitmap, test_point)
    assert circle_radius(test_circle) == 50.0
    assert center_point(test_circle) == test_point
    free_bitmap(test_bitmap)


def test_BitmapBoundingRectangle_integration():
    test_bitmap = create_bitmap("test_bitmap", 100, 100)
    test_rectangle = bitmap_bounding_rectangle(test_bitmap)
    assert test_rectangle.width == bitmap_width(test_bitmap)
    assert test_rectangle.height == bitmap_height(test_bitmap)
    free_bitmap(test_bitmap)


def test_BitmapBoundingRectangleAtLocation_integration():
    test_bitmap = create_bitmap("test_bitmap", 100, 100)
    test_rectangle = bitmap_bounding_rectangle_at_location(test_bitmap, 50.0, 50.0)
    assert rectangle_left(test_rectangle) == 50.0
    assert rectangle_top(test_rectangle) == 50.0
    assert rectangle_right(test_rectangle) == 150.0
    assert rectangle_bottom(test_rectangle) == 150.0
    free_bitmap(test_bitmap)


def test_BitmapCellCenter_integration():
    test_bitmap = create_bitmap("test_bitmap", 100, 100)
    test_center = bitmap_cell_center(test_bitmap)
    assert test_center.x == 50.0
    assert test_center.y == 50.0
    free_bitmap(test_bitmap)


def test_BitmapCellCircle_integration():
    test_bitmap = create_bitmap("test_bitmap", 100, 100)
    test_circle = bitmap_cell_circle(test_bitmap, 50.0, 50.0)
    assert circle_radius(test_circle) == 50.0
    assert circle_x(test_circle) == 50.0
    assert circle_y(test_circle) == 50.0
    free_bitmap(test_bitmap)


def test_BitmapCellCircleAtPoint_integration():
    test_bitmap = create_bitmap("test_bitmap", 100, 100)
    bitmap_set_cell_details(test_bitmap, 50, 50, 2, 2, 4)
    test_circle = bitmap_cell_circle_at_point(test_bitmap, point_at(100, 100))
    assert circle_x(test_circle) == 125
    assert circle_y(test_circle) == 125
    assert circle_radius(test_circle) == 25
    free_bitmap(test_bitmap)


def test_BitmapCellCircleAtPointWithScale_integration():
    test_bitmap = create_bitmap("test_bitmap", 100, 100)
    bitmap_set_cell_details(test_bitmap, 50, 50, 2, 2, 4)
    test_circle = bitmap_cell_circle_at_point_with_scale(test_bitmap, point_at(100.0, 100.0), 2.0)
    assert circle_radius(test_circle) == 50.0
    free_bitmap(test_bitmap)


def test_BitmapCellColumns_integration():
    test_bitmap = create_bitmap("test_bitmap", 100, 100)
    bitmap_set_cell_details(test_bitmap, 20, 20, 5, 5, 25)
    assert bitmap_cell_columns(test_bitmap) == 5
    free_bitmap(test_bitmap)


def test_BitmapCellCount_integration():
    test_bitmap = create_bitmap("test_bitmap", 100, 100)
    bitmap_set_cell_details(test_bitmap, 20, 20, 5, 5, 25)
    assert bitmap_cell_count(test_bitmap) == 25
    free_bitmap(test_bitmap)


def test_BitmapCellHeight_integration():
    test_bitmap = create_bitmap("test_bitmap", 100, 100)
    bitmap_set_cell_details(test_bitmap, 20, 20, 5, 5, 25)
    assert bitmap_cell_height(test_bitmap) == 20
    free_bitmap(test_bitmap)


def test_BitmapCellOffset_integration():
    test_bitmap = create_bitmap("test_bitmap", 100, 100)
    bitmap_set_cell_details(test_bitmap, 25, 25, 4, 4, 16)
    test_offset = bitmap_cell_offset(test_bitmap, 5)
    assert test_offset.x == 75
    assert test_offset.y == 0
    free_bitmap(test_bitmap)


def test_BitmapCellRectangle_integration():
    test_bitmap = create_bitmap("test_bitmap", 100, 100)
    bitmap_set_cell_details(test_bitmap, 25, 25, 4, 4, 16)
    test_rectangle = bitmap_cell_rectangle(test_bitmap)
    assert test_rectangle.width == 25
    assert test_rectangle.height == 25
    free_bitmap(test_bitmap)


def test_BitmapCellRectangleAtPoint_integration():
    test_bitmap = create_bitmap("test_bitmap", 100, 100)
    bitmap_set_cell_details(test_bitmap, 25, 25, 4, 4, 16)
    test_rectangle = bitmap_cell_rectangle_at_point(test_bitmap, point_at(50.0, 50.0))
    assert rectangle_left(test_rectangle) == 50.0
    assert rectangle_top(test_rectangle) == 50.0
    assert rectangle_right(test_rectangle) == 75.0
    assert rectangle_bottom(test_rectangle) == 75.0
    free_bitmap(test_bitmap)


def test_BitmapCellRows_integration():
    test_bitmap = create_bitmap("test_bitmap", 100, 100)
    bitmap_set_cell_details(test_bitmap, 20, 20, 5, 5, 25)
    assert bitmap_cell_rows(test_bitmap) == 5
    free_bitmap(test_bitmap)


def test_BitmapCellWidth_integration():
    test_bitmap = create_bitmap("test_bitmap", 100, 100)
    bitmap_set_cell_details(test_bitmap, 25, 25, 4, 4, 16)
    assert bitmap_cell_width(test_bitmap) == 25
    free_bitmap(test_bitmap)


def test_BitmapCenter_integration():
    test_bitmap = create_bitmap("test_bitmap", 100, 100)
    test_center = bitmap_center(test_bitmap)
    assert test_center.x == 50.0
    assert test_center.y == 50.0
    free_bitmap(test_bitmap)


def test_BitmapFilename_integration():
    test_bitmap = create_bitmap("test_bitmap", 100, 100)
    test_filename = bitmap_filename(test_bitmap)
    assert test_filename == ""
    free_bitmap(test_bitmap)


def test_BitmapHeight_integration():
    test_bitmap = create_bitmap("test_bitmap", 100, 100)
    test_height = bitmap_height(test_bitmap)
    assert test_height == 100
    free_bitmap(test_bitmap)


def test_BitmapHeightOfBitmapNamed_integration():
    test_bitmap = create_bitmap("test_bitmap", 100, 100)
    assert bitmap_height_of_bitmap_named("test_bitmap") == 100
    free_bitmap(test_bitmap)


def test_BitmapName_integration():
    test_bitmap = create_bitmap("test_bitmap", 100, 100)
    test_bitmap_name = bitmap_name(test_bitmap)
    assert test_bitmap_name == "test_bitmap"
    free_bitmap(test_bitmap)


def test_BitmapNamed_integration():
    test_bitmap = load_bitmap("test_bitmap", "test_bitmap.png")
    test_named_bitmap = bitmap_named("test_bitmap")
    assert test_named_bitmap is not None
    test_nonexistent_bitmap = bitmap_named("nonexistent_bitmap")
    assert test_nonexistent_bitmap is None
    free_all_bitmaps()


def test_BitmapRectangleOfCell_integration():
    test_bitmap = create_bitmap("test_bitmap", 100, 100)
    bitmap_set_cell_details(test_bitmap, 25, 25, 4, 4, 16)
    test_rectangle = bitmap_rectangle_of_cell(test_bitmap, 5)
    assert rectangle_left(test_rectangle) == 0
    assert rectangle_top(test_rectangle) == 75
    assert rectangle_right(test_rectangle) == 25
    assert rectangle_bottom(test_rectangle) == 100
    free_bitmap(test_bitmap)


def test_BitmapSetCellDetails_integration():
    test_bitmap = create_bitmap("test_bitmap", 100, 100)
    bitmap_set_cell_details(test_bitmap, 20, 20, 5, 5, 25)
    assert bitmap_cell_width(test_bitmap) == 20
    assert bitmap_cell_height(test_bitmap) == 20
    assert bitmap_cell_columns(test_bitmap) == 5
    assert bitmap_cell_rows(test_bitmap) == 5
    assert bitmap_cell_count(test_bitmap) == 25
    free_bitmap(test_bitmap)


def test_BitmapValid_integration():
    test_bitmap = create_bitmap("test_bitmap", 100, 100)
    assert bitmap_valid(test_bitmap) is True
    free_bitmap(test_bitmap)
    assert bitmap_valid(test_bitmap) is False


def test_BitmapWidth_integration():
    test_bitmap = create_bitmap("test_bitmap", 100, 100)
    test_width = bitmap_width(test_bitmap)
    assert test_width == 100
    free_bitmap(test_bitmap)


def test_BitmapWidthOfBitmapNamed_integration():
    test_bitmap = create_bitmap("test_bitmap", 100, 100)
    test_window = open_window("Test Window", 800, 600)
    draw_bitmap(bitmap_named("test_bitmap"), 100, 100)
    refresh_screen()
    assert bitmap_width_of_bitmap_named("test_bitmap") == 100
    free_bitmap(test_bitmap)
    close_window(test_window)


def test_ClearBitmap_integration():
    test_bitmap = create_bitmap("test_bitmap", 100, 100)
    draw_pixel_on_bitmap(test_bitmap, color_black(), 50, 50)
    clear_bitmap(test_bitmap, color_white())
    assert pixel_drawn_at_point(test_bitmap, 50, 50) is False
    free_bitmap(test_bitmap)


def test_ClearBitmapNamed_integration():
    test_bitmap = create_bitmap("test_bitmap", 100, 100)
    test_window = open_window("Test Window", 800, 600)
    draw_bitmap(test_bitmap, 100.0, 100.0)
    refresh_screen()
    assert pixel_drawn_at_point(test_bitmap, 50.0, 50.0) is True
    clear_bitmap_named("test_bitmap", color_white())
    refresh_screen()
    assert pixel_drawn_at_point(test_bitmap, 50.0, 50.0) is False
    close_window(test_window)
    free_bitmap(test_bitmap)


def test_CreateBitmap_integration():
    test_bitmap = create_bitmap("test_bitmap", 100, 100)
    assert test_bitmap is not None
    assert bitmap_width(test_bitmap) == 100
    assert bitmap_height(test_bitmap) == 100
    free_bitmap(test_bitmap)


def test_DrawBitmap_integration():
    test_window = open_window("Test Window", 800, 600)
    test_bitmap = create_bitmap("test_bitmap", 100, 100)
    draw_bitmap(test_bitmap, 100.0, 100.0)
    refresh_screen()
    assert pixel_drawn_at_point(test_bitmap, point_at(50.0, 50.0)) is True
    assert pixel_drawn_at_point(test_bitmap, point_at(bitmap_width(test_bitmap), bitmap_height(test_bitmap))) is False
    free_bitmap(test_bitmap)
    close_window(test_window)


def test_DrawBitmapWithOptions_integration():
    test_window = open_window("Test Window", 800, 600)
    test_bitmap = create_bitmap("test_bitmap", 100, 100)
    draw_bitmap_with_options(test_bitmap, 100.0, 100.0, option_defaults())
    refresh_screen()
    assert pixel_drawn_at_point(test_bitmap, point_at(50.0, 50.0)) is True
    assert pixel_drawn_at_point(test_bitmap, point_at(150.0, 100.0)) is False
    free_bitmap(test_bitmap)
    close_window(test_window)


def test_DrawBitmapNamed_integration():
    test_window = open_window("Test Window", 800, 600)
    test_bitmap = create_bitmap("test_bitmap", 100, 100)
    draw_bitmap_named("test_bitmap", 100.0, 100.0)
    refresh_screen()
    assert pixel_drawn_at_point(bitmap_named("test_bitmap"), 50.0, 50.0) is True
    assert pixel_drawn_at_point(bitmap_named("test_bitmap"), bitmap_width(bitmap_named("test_bitmap")), bitmap_height(bitmap_named("test_bitmap"))) is False
    free_all_bitmaps()
    close_window(test_window)


def test_DrawBitmapNamedWithOptions_integration():
    test_window = open_window("Test Window", 800, 600)
    test_bitmap = create_bitmap("test_bitmap", 100, 100)
    draw_bitmap("test_bitmap", 100.0, 100.0, option_defaults())
    refresh_screen()
    assert pixel_drawn_at_point(test_bitmap, point_at(50.0, 50.0)) is True
    assert pixel_drawn_at_point(test_bitmap, point_at(150.0, 150.0)) is False
    free_bitmap(test_bitmap)
    close_window(test_window)


def test_DrawBitmapOnBitmapOnBitmap_integration():
    test_destination = create_bitmap("test_destination", 100, 100)
    test_source = create_bitmap("test_source", 50, 50)
    draw_bitmap_on_bitmap_on_bitmap(test_destination, test_source, 25.0, 25.0)
    assert pixel_drawn_at_point(test_destination, point_at(50.0, 50.0)) is True
    assert pixel_drawn_at_point(test_destination, point_at(75.0, 75.0)) is False
    free_bitmap(test_destination)
    free_bitmap(test_source)


def test_DrawBitmapOnBitmapOnBitmapWithOptions_integration():
    test_destination = create_bitmap("test_destination", 100, 100)
    test_source = create_bitmap("test_source", 50, 50)
    draw_pixel_on_bitmap(test_source, color_black(), point_at(25.0, 25.0))
    draw_bitmap_on_bitmap_on_bitmap_with_options(test_destination, test_source, 25.0, 25.0, option_defaults())
    assert pixel_drawn_at_point(test_destination, point_at(25.0, 25.0)) is True
    assert pixel_drawn_at_point(test_destination, point_at(75.0, 75.0)) is False
    free_bitmap(test_destination)
    free_bitmap(test_source)


def test_DrawBitmapOnWindow_integration():
    test_window = open_window("Test Window", 800, 600)
    test_bitmap = create_bitmap("test_bitmap", 100, 100)
    draw_bitmap_on_window(test_window, test_bitmap, 100.0, 100.0)
    refresh_screen()
    assert pixel_drawn_at_point(test_bitmap, point_at(50.0, 50.0)) is True
    assert pixel_drawn_at_point(test_bitmap, point_at(150.0, 150.0)) is False
    free_bitmap(test_bitmap)
    close_window(test_window)


def test_DrawBitmapOnWindowWithOptions_integration():
    test_window = open_window("Test Window", 800, 600)
    test_bitmap = create_bitmap("test_bitmap", 100, 100)
    draw_bitmap_on_window_with_options(test_window, test_bitmap, 100.0, 100.0, option_defaults())
    refresh_screen()
    assert pixel_drawn_at_point(test_bitmap, point_at(50.0, 50.0)) is True
    assert pixel_drawn_at_point(test_bitmap, point_at(150.0, 100.0)) is False
    free_bitmap(test_bitmap)
    close_window(test_window)


def test_FreeAllBitmaps_integration():
    test_bitmap_1 = create_bitmap("test_bitmap_1", 100, 100)
    test_bitmap_2 = create_bitmap("test_bitmap_2", 100, 100)
    free_all_bitmaps()
    assert bitmap_valid(test_bitmap_1) is False
    assert bitmap_valid(test_bitmap_2) is False


def test_FreeBitmap_integration():
    test_bitmap = create_bitmap("test_bitmap", 100, 100)
    free_bitmap(test_bitmap)
    assert bitmap_valid(test_bitmap) is False


def test_HasBitmap_integration():
    test_bitmap = create_bitmap("test_bitmap", 100, 100)
    assert has_bitmap("test_bitmap") is True
    free_bitmap(test_bitmap)
    assert has_bitmap("test_bitmap") is False


def test_LoadBitmap_integration():
    test_window = open_window("Test Window", 800, 600)
    test_bitmap = load_bitmap("test_bitmap", "test_bitmap.png")
    draw_bitmap(test_bitmap, 100.0, 100.0)
    refresh_screen()
    assert pixel_drawn_at_point(test_bitmap, point_at(100.0, 100.0)) is True
    assert pixel_drawn_at_point(test_bitmap, point_at(bitmap_width(test_bitmap), bitmap_height(test_bitmap))) is False
    free_bitmap(test_bitmap)
    close_window(test_window)


def test_PixelDrawnAtPointPt_integration():
    test_bitmap = create_bitmap("test_bitmap", 100, 100)
    draw_pixel_on_bitmap(test_bitmap, color_black(), point_at(50.0, 50.0))
    assert pixel_drawn_at_point_pt(test_bitmap, point_at(50.0, 50.0)) is True
    assert pixel_drawn_at_point_pt(test_bitmap, point_at(75.0, 75.0)) is False
    free_bitmap(test_bitmap)


def test_PixelDrawnAtPoint_integration():
    test_bitmap = create_bitmap("test_bitmap", 100, 100)
    draw_pixel_on_bitmap(test_bitmap, color_black(), 50.0, 50.0)
    assert pixel_drawn_at_point(test_bitmap, 50.0, 50.0) is True
    assert pixel_drawn_at_point(test_bitmap, 75.0, 75.0) is False
    free_bitmap(test_bitmap)


def test_PixelDrawnAtPointInCellPt_integration():
    test_bitmap = create_bitmap("test_bitmap", 100, 100)
    draw_pixel_on_bitmap(test_bitmap, color_black(), point_at(50.0, 50.0))
    bitmap_set_cell_details(test_bitmap, 100, 100, 1, 1, 1)
    assert pixel_drawn_at_point(test_bitmap, 0, point_at(50.0, 50.0)) is True
    assert pixel_drawn_at_point(test_bitmap, 0, point_at(75.0, 50.0)) is False
    free_bitmap(test_bitmap)


def test_PixelDrawnAtPointInCell_integration():
    test_bitmap = create_bitmap("test_bitmap", 100, 100)
    draw_pixel(color_black(), point_at(50.0, 50.0))
    test_window = open_window("Test Window", 800, 600)
    draw_bitmap(test_bitmap, 100.0, 100.0)
    refresh_screen()
    assert pixel_drawn_at_point_in_cell(test_bitmap, 0, point_at(50.0, 50.0)) is True
    assert pixel_drawn_at_point_in_cell(test_bitmap, 0, point_at(75.0, 75.0)) is False
    free_bitmap(test_bitmap)
    close_window(test_window)


def test_SetupCollisionMask_integration():
    test_bitmap = create_bitmap("test_bitmap", 100, 100)
    setup_collision_mask(test_bitmap)
    test_pixel_drawn = pixel_drawn_at_point(test_bitmap, point_at(50, 50))
    assert test_pixel_drawn is True
    free_bitmap(test_bitmap)


def test_DrawLineRecord_integration():
    test_window = open_window("Test Window", 800, 600)
    test_line = line_from(point_at(100.0, 100.0), point_at(200.0, 200.0))
    draw_line(color_black(), test_line)
    refresh_screen()
    assert get_pixel(point_at(100.0, 100.0)) == color_black()
    assert get_pixel(point_at(99.0, 99.0)) != color_black()
    close_window(test_window)


def test_DrawLineRecordWithOptions_integration():
    test_window = open_window("Test Window", 800, 600)
    test_line = line_from(point_at(100.0, 100.0), point_at(200.0, 200.0))
    draw_line_record_with_options(color_black(), test_line, option_line_width(3, option_defaults()))
    refresh_screen()
    assert get_pixel(point_at(100.0, 100.0)) == color_black()
    assert get_pixel(point_at(99.0, 99.0)) != color_black()
    close_window(test_window)


def test_DrawLinePointToPoint_integration():
    test_window = open_window("Test Window", 800, 600)
    draw_line_point_to_point(color_black(), point_at(100.0, 100.0), point_at(200.0, 200.0))
    refresh_screen()
    assert get_pixel(point_at(100.0, 100.0)) == color_black()
    assert get_pixel(point_at(99.0, 99.0)) != color_black()
    close_window(test_window)


def test_DrawLinePointToPointWithOptions_integration():
    test_window = open_window("Test Window", 800, 600)
    draw_line_point_to_point_with_options(color_black(), point_at(100.0, 100.0), point_at(200.0, 200.0), option_defaults())
    refresh_screen()
    assert get_pixel(point_at(100.0, 100.0)) == color_black()
    assert get_pixel(point_at(99.0, 99.0)) != color_black()
    close_window(test_window)


def test_DrawLine_integration():
    test_window = open_window("Test Window", 800, 600)
    draw_line(color_black(), 100.0, 100.0, 200.0, 200.0)
    refresh_screen()
    assert get_pixel(point_at(100.0, 100.0)) == color_black()
    assert get_pixel(point_at(99.0, 99.0)) != color_black()
    close_window(test_window)


def test_DrawLineWithOptions_integration():
    test_window = open_window("Test Window", 800, 600)
    draw_line_with_options(color_black(), 100.0, 100.0, 200.0, 200.0, option_defaults())
    refresh_screen()
    assert get_pixel(point_at(100.0, 100.0)) == color_black()
    assert get_pixel(point_at(99.0, 99.0)) != color_black()
    close_window(test_window)


def test_DrawLineOnBitmapRecord_integration():
    test_bitmap = create_bitmap("test_bitmap", 100, 100)
    test_line = line_from(point_at(10.0, 10.0), point_at(90.0, 90.0))
    draw_line_on_bitmap(test_bitmap, color_black(), test_line)
    assert pixel_drawn_at_point(test_bitmap, point_at(50.0, 50.0)) is True
    assert pixel_drawn_at_point(test_bitmap, point_at(100.0, 100.0)) is False
    free_bitmap(test_bitmap)


def test_DrawLineOnBitmapRecordWithOptions_integration():
    test_bitmap = create_bitmap("test_bitmap", 100, 100)
    test_line = line_from(point_at(10.0, 10.0), point_at(90.0, 90.0))
    draw_line_on_bitmap(test_bitmap, color_black(), test_line, option_defaults())
    assert pixel_drawn_at_point(test_bitmap, point_at(50.0, 50.0)) is True
    assert pixel_drawn_at_point(test_bitmap, point_at(95.0, 50.0)) is False
    free_bitmap(test_bitmap)


def test_DrawLineOnBitmapPointToPoint_integration():
    test_bitmap = create_bitmap("test_bitmap", 100, 100)
    draw_line_on_bitmap(test_bitmap, color_black(), point_at(10.0, 10.0), point_at(90.0, 90.0))
    assert pixel_drawn_at_point(test_bitmap, 50.0, 50.0) is True
    assert pixel_drawn_at_point(test_bitmap, 0.0, 0.0) is False
    free_bitmap(test_bitmap)


def test_DrawLineOnBitmapPointToPointWithOptions_integration():
    test_bitmap = create_bitmap("test_bitmap", 100, 100)
    test_from_pt = point_at(10.0, 10.0)
    test_to_pt = point_at(90.0, 90.0)
    draw_line_on_bitmap_point_to_point_with_options(test_bitmap, color_black(), test_from_pt, test_to_pt, option_defaults())
    assert pixel_drawn_at_point(test_bitmap, 10.0, 10.0) is True
    assert pixel_drawn_at_point(test_bitmap, 90.0, 90.0) is True
    assert pixel_drawn_at_point(test_bitmap, 5.0, 5.0) is False
    free_bitmap(test_bitmap)


def test_DrawLineOnBitmap_integration():
    test_bitmap = create_bitmap("test_bitmap", 100, 100)
    test_color = color_black()
    draw_line_on_bitmap(test_bitmap, test_color, 10.0, 10.0, 90.0, 90.0)
    assert pixel_drawn_at_point(test_bitmap, 50.0, 50.0) is True
    assert pixel_drawn_at_point(test_bitmap, 95.0, 50.0) is False
    free_bitmap(test_bitmap)


def test_DrawLineOnBitmapWithOptions_integration():
    test_bitmap = create_bitmap("test_bitmap", 100, 100)
    draw_line_on_bitmap_with_options(test_bitmap, color_black(), 10.0, 10.0, 90.0, 90.0, option_defaults())
    assert pixel_drawn_at_point(test_bitmap, point_at(50.0, 50.0)) is True
    assert pixel_drawn_at_point(test_bitmap, point_at(5.0, 5.0)) is False
    free_bitmap(test_bitmap)


def test_DrawLineOnWindowRecord_integration():
    test_window = open_window("Test Window", 800, 600)
    test_line = line_from(point_at(100.0, 100.0), point_at(700.0, 500.0))
    draw_line_on_window(test_window, color_black(), test_line)
    refresh_screen()
    assert get_pixel(test_window, point_at(100.0, 100.0)) == color_black()
    assert get_pixel(test_window, point_at(99.0, 99.0)) != color_black()
    close_window(test_window)


def test_DrawLineOnWindowRecordWithOptions_integration():
    test_window = open_window("Test Window", 800, 600)
    test_line = line_from(point_at(100.0, 100.0), point_at(200.0, 200.0))
    draw_line_on_window(test_window, color_black(), test_line, option_defaults())
    refresh_screen()
    assert get_pixel(test_window, point_at(100.0, 100.0)) == color_black()
    assert get_pixel(test_window, point_at(99.0, 99.0)) != color_black()
    close_window(test_window)


def test_DrawLineOnWindowPointToPoint_integration():
    test_window = open_window("Test Window", 800, 600)
    draw_line_on_window(test_window, color_black(), point_at(100.0, 100.0), point_at(200.0, 200.0))
    refresh_screen()
    assert get_pixel(test_window, 100.0, 100.0) == color_black()
    assert get_pixel(test_window, 99.0, 99.0) != color_black()
    close_window(test_window)


def test_DrawLineOnWindowPointToPointWithOptions_integration():
    test_window = open_window("Test Window", 800, 600)
    draw_line_on_window(test_window, color_black(), point_at(100.0, 100.0), point_at(200.0, 200.0), option_defaults())
    refresh_screen()
    assert get_pixel(test_window, 100.0, 100.0) == color_black()
    assert get_pixel(test_window, 99.0, 99.0) != color_black()
    close_window(test_window)


def test_DrawLineOnWindow_integration():
    test_window = open_window("Test Window", 800, 600)
    draw_line_on_window(test_window, color_black(), 100.0, 100.0, 200.0, 200.0)
    refresh_screen()
    assert get_pixel(test_window, 100.0, 100.0) == color_black()
    assert get_pixel(test_window, 99.0, 99.0) != color_black()
    close_window(test_window)


def test_DrawLineOnWindowWithOptions_integration():
    test_window = open_window("Test Window", 800, 600)
    draw_line_on_window(test_window, color_black(), 100.0, 100.0, 200.0, 200.0, option_defaults())
    refresh_screen()
    assert get_pixel(test_window, 100.0, 100.0) == color_black()
    assert get_pixel(test_window, 99.0, 99.0) != color_black()
    close_window(test_window)


def test_DrawPixelAtPoint_integration():
    test_window = open_window("Test Window", 800, 600)
    draw_pixel(color_black(), point_at(100.0, 100.0))
    refresh_screen()
    assert get_pixel(point_at(100.0, 100.0)) == color_black()
    assert get_pixel(point_at(99.0, 99.0)) != color_black()
    close_window(test_window)


def test_DrawPixelAtPointWithOptions_integration():
    test_window = open_window("Test Window", 800, 600)
    draw_pixel_at_point_with_options(color_black(), point_at(100.0, 100.0), option_defaults())
    refresh_screen()
    assert get_pixel(point_at(100.0, 100.0)) == color_black()
    assert get_pixel(point_at(100.0, 100.0)) == color_black()
    assert get_pixel(point_at(99.0, 99.0)) != color_black()
    close_window(test_window)


def test_DrawPixel_integration():
    test_window = open_window("Test Window", 800, 600)
    draw_pixel(color_black(), 100.0, 100.0)
    refresh_screen()
    assert get_pixel(point_at(100.0, 100.0)) == color_black()
    assert get_pixel(point_at(99.0, 99.0)) != color_black()
    close_window(test_window)


def test_DrawPixelWithOptions_integration():
    test_window = open_window("Test Window", 800, 600)
    draw_pixel(color_black(), 100.0, 100.0, option_defaults())
    refresh_screen()
    assert get_pixel(point_at(100.0, 100.0)) == color_black()
    assert get_pixel(point_at(99.0, 99.0)) != color_black()
    close_window(test_window)


def test_DrawPixelOnBitmapAtPoint_integration():
    test_bitmap = create_bitmap("test_bitmap", 100, 100)
    test_color = color_black()
    test_point = point_at(50.0, 50.0)
    draw_pixel_on_bitmap(test_bitmap, test_color, test_point)
    assert pixel_drawn_at_point(test_bitmap, test_point) is True
    assert pixel_drawn_at_point(test_bitmap, point_at(0.0, 0.0)) is False
    free_bitmap(test_bitmap)


def test_DrawPixelOnBitmapAtPointWithOptions_integration():
    test_bitmap = create_bitmap("test_bitmap", 100, 100)
    test_color = color_black()
    test_point = point_at(50.0, 50.0)
    draw_pixel_on_bitmap(test_bitmap, test_color, test_point, option_defaults())
    assert pixel_drawn_at_point(test_bitmap, test_point) is True
    assert pixel_drawn_at_point(test_bitmap, point_at(0.0, 0.0)) is False
    free_bitmap(test_bitmap)


def test_DrawPixelOnBitmap_integration():
    test_bitmap = create_bitmap("test_bitmap", 100, 100)
    test_color = color_black()
    draw_pixel_on_bitmap(test_bitmap, test_color, 50.0, 50.0)
    assert pixel_drawn_at_point(test_bitmap, 50.0, 50.0) is True
    assert pixel_drawn_at_point(test_bitmap, 51.0, 50.0) is False
    free_bitmap(test_bitmap)


def test_DrawPixelOnBitmapWithOptions_integration():
    test_bitmap = create_bitmap("test_bitmap", 100, 100)
    test_color = color_black()
    draw_pixel_on_bitmap(test_bitmap, test_color, 50.0, 50.0, option_defaults())
    assert pixel_drawn_at_point(test_bitmap, 50.0, 50.0) is True
    assert pixel_drawn_at_point(test_bitmap, 51.0, 50.0) is False
    free_bitmap(test_bitmap)


def test_DrawPixelOnWindowAtPoint_integration():
    test_window = open_window("Test Window", 800, 600)
    test_color = color_black()
    test_point = point_at(100.0, 100.0)
    draw_pixel_on_window(test_window, test_color, test_point)
    refresh_screen()
    assert get_pixel(point_at(100.0, 100.0)) == color_black()
    assert get_pixel(point_at(99.0, 99.0)) != color_black()
    close_window(test_window)


def test_DrawPixelOnWindowAtPointWithOptions_integration():
    test_window = open_window("Test Window", 800, 600)
    test_point = point_at(100.0, 100.0)
    draw_pixel_on_window(test_window, color_black(), test_point, option_defaults())
    refresh_screen()
    assert get_pixel(point_at(100.0, 100.0)) == color_black()
    assert get_pixel(point_at(99.0, 99.0)) != color_black()
    close_window(test_window)


def test_DrawPixelOnWindow_integration():
    test_window = open_window("Test Window", 800, 600)
    draw_pixel_on_window(test_window, color_black(), 100.0, 100.0)
    refresh_screen()
    assert get_pixel(point_at(100.0, 100.0)) == color_black()
    assert get_pixel(point_at(99.0, 99.0)) != color_black()
    close_window(test_window)


def test_DrawPixelOnWindowWithOptions_integration():
    test_window = open_window("Test Window", 800, 600)
    draw_pixel_on_window(test_window, color_black(), 100.0, 100.0, option_defaults())
    refresh_screen()
    assert get_pixel(point_at(100.0, 100.0)) == color_black()
    assert get_pixel(point_at(99.0, 99.0)) != color_black()
    close_window(test_window)


def test_GetPixelFromBitmapAtPoint_integration():
    test_bitmap = create_bitmap("test_bitmap", 100, 100)
    draw_pixel_on_bitmap(test_bitmap, color_black(), point_at(50.0, 50.0))
    test_color = get_pixel_from_bitmap_at_point(test_bitmap, point_at(50.0, 50.0))
    assert color_black() == test_color
    free_bitmap(test_bitmap)


def test_GetPixelFromBitmap_integration():
    test_bitmap = create_bitmap("test_bitmap", 100, 100)
    draw_pixel_on_bitmap(test_bitmap, color_black(), 50.0, 50.0)
    test_pixel_color = get_pixel_from_bitmap(test_bitmap, 50.0, 50.0)
    assert test_pixel_color == color_black()
    free_bitmap(test_bitmap)


def test_GetPixelAtPoint_integration():
    test_window = open_window("Test Window", 800, 600)
    draw_pixel(color_black(), point_at(100.0, 100.0))
    refresh_screen()
    assert get_pixel_at_point(point_at(100.0, 100.0)) == color_black()
    close_window(test_window)


def test_GetPixel_integration():
    test_window = open_window("Test Window", 800, 600)
    draw_pixel(color_black(), 100.0, 100.0)
    refresh_screen()
    assert get_pixel(100.0, 100.0) == color_black()
    close_window(test_window)


def test_GetPixelFromWindowAtPoint_integration():
    test_window = open_window("Test Window", 800, 600)
    draw_pixel(color_black(), point_at(100.0, 100.0))
    refresh_screen()
    assert get_pixel_from_window_at_point(test_window, point_at(100.0, 100.0)) == color_black()
    close_window(test_window)


def test_GetPixelFromWindow_integration():
    test_window = open_window("Test Window", 800, 600)
    draw_pixel(color_black(), 100.0, 100.0)
    refresh_screen()
    assert get_pixel_from_window(test_window, 100.0, 100.0) == color_black()
    close_window(test_window)


def test_GetPixelFromWindowAtPointFromWindow_integration():
    test_window = open_window("Test Window", 800, 600)
    draw_pixel(color_black(), point_at(100.0, 100.0))
    refresh_screen()
    test_pixel = get_pixel_from_window_at_point_from_window(test_window, point_at(100.0, 100.0))
    assert color_black() == test_pixel
    close_window(test_window)


def test_GetPixelFromWindowFromWindow_integration():
    test_window = open_window("Test Window", 800, 600)
    draw_pixel(color_black(), 100.0, 100.0)
    refresh_screen()
    test_pixel_color = get_pixel_from_window(test_window, 100.0, 100.0)
    assert color_black() == test_pixel_color
    close_window(test_window)


def test_DrawQuad_integration():
    test_window = open_window("Test Window", 800, 600)
    test_quad = quad_from(point_at(100.0, 100.0), point_at(200.0, 100.0), point_at(100.0, 200.0), point_at(200.0, 200.0))
    draw_quad(color_black(), test_quad)
    refresh_screen()
    assert point_in_quad(point_at(150.0, 150.0), test_quad) is True
    assert point_in_quad(point_at(250.0, 250.0), test_quad) is False
    close_window(test_window)


def test_DrawQuadWithOptions_integration():
    test_window = open_window("Test Window", 800, 600)
    test_quad = quad_from(point_at(100.0, 100.0), point_at(200.0, 100.0), point_at(100.0, 200.0), point_at(200.0, 200.0))
    draw_quad_with_options(color_black(), test_quad, option_defaults())
    refresh_screen()
    assert point_in_quad(point_at(150.0, 150.0), test_quad) is True
    close_window(test_window)


def test_DrawQuadOnBitmap_integration():
    test_bitmap = create_bitmap("test_bitmap", 100, 100)
    test_quad = quad_from(point_at(10.0, 10.0), point_at(90.0, 10.0), point_at(10.0, 90.0), point_at(90.0, 90.0))
    draw_quad_on_bitmap(test_bitmap, color_black(), test_quad)
    assert pixel_drawn_at_point(test_bitmap, point_at(50.0, 50.0)) is True
    assert pixel_drawn_at_point(test_bitmap, point_at(100.0, 100.0)) is False
    free_bitmap(test_bitmap)


def test_DrawQuadOnBitmapWithOptions_integration():
    test_bitmap = create_bitmap("test_bitmap", 100, 100)
    test_quad = quad_from(point_at(10.0, 10.0), point_at(90.0, 10.0), point_at(90.0, 90.0), point_at(10.0, 90.0))
    draw_quad_on_bitmap_with_options(test_bitmap, color_black(), test_quad, option_defaults())
    assert pixel_drawn_at_point(test_bitmap, point_at(50.0, 50.0)) is True
    assert pixel_drawn_at_point(test_bitmap, point_at(101.0, 50.0)) is False
    free_bitmap(test_bitmap)


def test_DrawQuadOnWindow_integration():
    test_window = open_window("Test Window", 800, 600)
    test_quad = quad_from(point_at(100.0, 100.0), point_at(200.0, 100.0), point_at(100.0, 200.0), point_at(200.0, 200.0))
    draw_quad_on_window(test_window, color_black(), test_quad)
    refresh_screen()
    assert point_in_quad(point_at(150.0, 150.0), test_quad) is True
    close_window(test_window)


def test_DrawQuadOnWindowWithOptions_integration():
    test_window = open_window("Test Window", 800, 600)
    test_quad = quad_from(point_at(100.0, 100.0), point_at(200.0, 100.0), point_at(100.0, 200.0), point_at(200.0, 200.0))
    draw_quad_on_window(test_window, color_black(), test_quad, option_defaults())
    refresh_screen()
    assert point_in_quad(point_at(150.0, 150.0), test_quad) is True
    close_window(test_window)


def test_DrawRectangleRecord_integration():
    test_window = open_window("Test Window", 800, 600)
    test_rectangle = rectangle_from(100.0, 100.0, 200.0, 150.0)
    draw_rectangle(color_black(), test_rectangle)
    refresh_screen()
    assert point_in_rectangle(point_at(150.0, 125.0), test_rectangle) is True
    assert point_in_rectangle(point_at(301.0, 251.0), test_rectangle) is False
    close_window(test_window)


def test_DrawRectangleRecordWithOptions_integration():
    test_window = open_window("Test Window", 800, 600)
    test_rectangle = rectangle_from(100.0, 100.0, 200.0, 150.0)
    draw_rectangle(color_black(), test_rectangle, option_defaults())
    refresh_screen()
    assert point_in_rectangle(point_at(150.0, 125.0), test_rectangle) is True
    assert point_in_rectangle(point_at(350.0, 300.0), test_rectangle) is False
    close_window(test_window)


def test_DrawRectangle_integration():
    test_window = open_window("Test Window", 800, 600)
    draw_rectangle(color_black(), 100.0, 100.0, 200.0, 150.0)
    refresh_screen()
    assert point_in_rectangle(point_at(150.0, 125.0), rectangle_from(100.0, 100.0, 200.0, 150.0)) is True
    assert point_in_rectangle(point_at(301.0, 251.0), rectangle_from(100.0, 100.0, 200.0, 150.0)) is False
    close_window(test_window)


def test_DrawRectangleWithOptions_integration():
    test_window = open_window("Test Window", 800, 600)
    draw_rectangle_with_options(color_black(), 100.0, 100.0, 200.0, 150.0, option_line_width(3, option_defaults()))
    refresh_screen()
    assert point_in_rectangle(point_at(150.0, 125.0), rectangle_from(100.0, 100.0, 200.0, 150.0)) is True
    assert point_in_rectangle(point_at(301.0, 251.0), rectangle_from(100.0, 100.0, 200.0, 150.0)) is False
    close_window(test_window)


def test_DrawRectangleOnBitmapRecord_integration():
    test_bitmap = create_bitmap("test_bitmap", 100, 100)
    test_rectangle = rectangle_from(50.0, 50.0, 20.0, 30.0)
    draw_rectangle_on_bitmap(test_bitmap, color_black(), test_rectangle)
    assert pixel_drawn_at_point(test_bitmap, point_at(50.0, 50.0)) is True
    assert pixel_drawn_at_point(test_bitmap, point_at(80.0, 90.0)) is False
    free_bitmap(test_bitmap)


def test_DrawRectangleOnBitmapRecordWithOptions_integration():
    test_bitmap = create_bitmap("test_bitmap", 100, 100)
    test_rectangle = rectangle_from(50.0, 50.0, 20.0, 20.0)
    draw_rectangle_on_bitmap(test_bitmap, color_black(), test_rectangle, option_defaults())
    assert pixel_drawn_at_point(test_bitmap, point_at(50.0, 50.0)) is True
    assert pixel_drawn_at_point(test_bitmap, point_at(75.0, 75.0)) is False
    free_bitmap(test_bitmap)


def test_DrawRectangleOnBitmap_integration():
    test_bitmap = create_bitmap("test_bitmap", 100, 100)
    draw_rectangle_on_bitmap(test_bitmap, color_black(), 50.0, 50.0, 20.0, 20.0)
    assert pixel_drawn_at_point(test_bitmap, 50.0, 50.0) is True
    assert pixel_drawn_at_point(test_bitmap, 75.0, 75.0) is False
    free_bitmap(test_bitmap)


def test_DrawRectangleOnBitmapWithOptions_integration():
    test_bitmap = create_bitmap("test_bitmap", 100, 100)
    draw_rectangle_on_bitmap_with_options(test_bitmap, color_black(), 50.0, 50.0, 20.0, 20.0, option_defaults())
    assert pixel_drawn_at_point(test_bitmap, 50.0, 50.0) is True
    assert pixel_drawn_at_point(test_bitmap, 75.0, 75.0) is False
    free_bitmap(test_bitmap)


def test_DrawRectangleOnWindowRecord_integration():
    test_window = open_window("Test Window", 800, 600)
    test_rectangle = rectangle_from(100.0, 100.0, 50.0, 50.0)
    draw_rectangle_on_window(test_window, color_black(), test_rectangle)
    refresh_screen()
    assert point_in_rectangle(point_at(125.0, 125.0), test_rectangle) is True
    assert point_in_rectangle(point_at(200.0, 200.0), test_rectangle) is False
    close_window(test_window)


def test_DrawRectangleOnWindowRecordWithOptions_integration():
    test_window = open_window("Test Window", 800, 600)
    test_rectangle = rectangle_from(100.0, 100.0, 50.0, 50.0)
    draw_rectangle_on_window(test_window, color_black(), test_rectangle, option_defaults())
    refresh_screen()
    assert point_in_rectangle(point_at(125.0, 125.0), test_rectangle) is True
    assert point_in_rectangle(point_at(175.0, 175.0), test_rectangle) is False
    close_window(test_window)


def test_DrawRectangleOnWindow_integration():
    test_window = open_window("Test Window", 800, 600)
    draw_rectangle_on_window(test_window, color_black(), 100.0, 100.0, 50.0, 50.0)
    refresh_screen()
    assert point_in_rectangle(point_at(100.0, 100.0), rectangle_from(100.0, 100.0, 50.0, 50.0)) is True
    assert point_in_rectangle(point_at(200.0, 200.0), rectangle_from(100.0, 100.0, 50.0, 50.0)) is False
    close_window(test_window)


def test_DrawRectangleOnWindowWithOptions_integration():
    test_window = open_window("Test Window", 800, 600)
    test_rectangle = rectangle_from(100.0, 100.0, 50.0, 50.0)
    draw_rectangle_on_window(test_window, color_black(), test_rectangle, option_defaults())
    refresh_screen()
    assert point_in_rectangle(point_at(125.0, 125.0), test_rectangle) is True
    assert point_in_rectangle(point_at(200.0, 200.0), test_rectangle) is False
    close_window(test_window)


def test_FillQuad_integration():
    test_window = open_window("Test Window", 800, 600)
    test_quad = quad_from(point_at(100.0, 100.0), point_at(300.0, 100.0), point_at(100.0, 300.0), point_at(300.0, 300.0))
    fill_quad(color_black(), test_quad)
    refresh_screen()
    assert point_in_quad(point_at(200.0, 200.0), test_quad) is True
    assert point_in_quad(point_at(400.0, 400.0), test_quad) is False
    close_window(test_window)


def test_FillQuadWithOptions_integration():
    test_window = open_window("Test Window", 800, 600)
    test_quad = quad_from(point_at(100.0, 100.0), point_at(300.0, 100.0), point_at(100.0, 300.0), point_at(300.0, 300.0))
    fill_quad_with_options(color_black(), test_quad, option_defaults())
    refresh_screen()
    assert point_in_quad(point_at(200.0, 200.0), test_quad) is True
    assert point_in_quad(point_at(400.0, 400.0), test_quad) is False
    close_window(test_window)


def test_FillQuadOnBitmap_integration():
    test_bitmap = create_bitmap("test_bitmap", 100, 100)
    test_quad = quad_from(point_at(10.0, 10.0), point_at(90.0, 10.0), point_at(10.0, 90.0), point_at(90.0, 90.0))
    fill_quad_on_bitmap(test_bitmap, color_black(), test_quad)
    assert pixel_drawn_at_point(test_bitmap, point_at(50.0, 50.0)) is True
    assert pixel_drawn_at_point(test_bitmap, point_at(0.0, 0.0)) is False
    free_bitmap(test_bitmap)


def test_FillQuadOnBitmapWithOptions_integration():
    test_bitmap = create_bitmap("test_bitmap", 100, 100)
    test_quad = quad_from(point_at(10.0, 10.0), point_at(90.0, 10.0), point_at(90.0, 90.0), point_at(10.0, 90.0))
    fill_quad_on_bitmap_with_options(test_bitmap, color_black(), test_quad, option_defaults())
    assert pixel_drawn_at_point(test_bitmap, point_at(50.0, 50.0)) is True
    assert pixel_drawn_at_point(test_bitmap, point_at(101.0, 50.0)) is False
    free_bitmap(test_bitmap)


def test_FillQuadOnWindow_integration():
    test_window = open_window("Test Window", 800, 600)
    test_quad = quad_from(point_at(100.0, 100.0), point_at(200.0, 100.0), point_at(100.0, 200.0), point_at(200.0, 200.0))
    fill_quad_on_window(test_window, color_black(), test_quad)
    refresh_screen()
    assert point_in_quad(point_at(150.0, 150.0), test_quad) is True
    close_window(test_window)


def test_FillQuadOnWindowWithOptions_integration():
    test_window = open_window("Test Window", 800, 600)
    test_quad = quad_from(point_at(100.0, 100.0), point_at(200.0, 100.0), point_at(200.0, 200.0), point_at(100.0, 200.0))
    fill_quad_on_window(test_window, color_black(), test_quad, option_defaults())
    refresh_screen()
    assert point_in_quad(point_at(150.0, 150.0), test_quad) is True
    assert point_in_quad(point_at(250.0, 150.0), test_quad) is False
    close_window(test_window)


def test_FillRectangleRecord_integration():
    test_window = open_window("Test Window", 800, 600)
    test_rectangle = rectangle_from(100.0, 100.0, 200.0, 150.0)
    fill_rectangle(color_black(), test_rectangle)
    refresh_screen()
    assert point_in_rectangle(point_at(150.0, 125.0), test_rectangle) is True
    assert point_in_rectangle(point_at(350.0, 275.0), test_rectangle) is False
    close_window(test_window)


def test_FillRectangleRecordWithOptions_integration():
    test_window = open_window("Test Window", 800, 600)
    test_rectangle = rectangle_from(100.0, 100.0, 200.0, 150.0)
    fill_rectangle_record_with_options(color_black(), test_rectangle, option_defaults())
    refresh_screen()
    assert point_in_rectangle(point_at(150.0, 125.0), test_rectangle) is True
    assert point_in_rectangle(point_at(350.0, 275.0), test_rectangle) is False
    close_window(test_window)


def test_FillRectangle_integration():
    test_window = open_window("Test Window", 800, 600)
    fill_rectangle(color_black(), 100.0, 100.0, 200.0, 150.0)
    refresh_screen()
    assert point_in_rectangle(point_at(150.0, 125.0), rectangle_from(100.0, 100.0, 200.0, 150.0)) is True
    assert point_in_rectangle(point_at(301.0, 251.0), rectangle_from(100.0, 100.0, 200.0, 150.0)) is False
    close_window(test_window)


def test_FillRectangleWithOptions_integration():
    test_window = open_window("Test Window", 800, 600)
    fill_rectangle(color_black(), 100.0, 100.0, 200.0, 150.0, option_defaults())
    refresh_screen()
    assert point_in_rectangle(point_at(150.0, 125.0), rectangle_from(100.0, 100.0, 200.0, 150.0)) is True
    assert point_in_rectangle(point_at(301.0, 251.0), rectangle_from(100.0, 100.0, 200.0, 150.0)) is False
    close_window(test_window)


def test_FillRectangleOnBitmapRecord_integration():
    test_bitmap = create_bitmap("test_bitmap", 100, 100)
    test_rectangle = rectangle_from(25.0, 25.0, 50.0, 50.0)
    fill_rectangle_on_bitmap(test_bitmap, color_black(), test_rectangle)
    assert pixel_drawn_at_point(test_bitmap, point_at(50.0, 50.0)) is True
    assert pixel_drawn_at_point(test_bitmap, point_at(10.0, 10.0)) is False
    free_bitmap(test_bitmap)


def test_FillRectangleOnBitmapRecordWithOptions_integration():
    test_bitmap = create_bitmap("test_bitmap", 100, 100)
    test_rectangle = rectangle_from(25.0, 25.0, 50.0, 50.0)
    fill_rectangle_on_bitmap(test_bitmap, color_black(), test_rectangle, option_defaults())
    assert pixel_drawn_at_point(test_bitmap, point_at(50.0, 50.0)) is True
    assert pixel_drawn_at_point(test_bitmap, point_at(10.0, 10.0)) is False
    free_bitmap(test_bitmap)


def test_FillRectangleOnBitmap_integration():
    test_bitmap = create_bitmap("test_bitmap", 100, 100)
    fill_rectangle_on_bitmap(test_bitmap, color_black(), 25.0, 25.0, 50.0, 50.0)
    assert pixel_drawn_at_point(test_bitmap, 50.0, 50.0) is True
    assert pixel_drawn_at_point(test_bitmap, 75.0, 75.0) is False
    free_bitmap(test_bitmap)


def test_FillRectangleOnBitmapWithOptions_integration():
    test_bitmap = create_bitmap("test_bitmap", 100, 100)
    fill_rectangle_on_bitmap(test_bitmap, color_black(), 25.0, 25.0, 50.0, 50.0, option_defaults())
    assert pixel_drawn_at_point(test_bitmap, point_at(50.0, 50.0)) is True
    assert pixel_drawn_at_point(test_bitmap, point_at(10.0, 10.0)) is False
    free_bitmap(test_bitmap)


def test_FillRectangleOnWindowRecord_integration():
    test_window = open_window("Test Window", 800, 600)
    test_rectangle = rectangle_from(100.0, 100.0, 200.0, 150.0)
    fill_rectangle_on_window(test_window, color_black(), test_rectangle)
    refresh_screen()
    assert point_in_rectangle(point_at(150.0, 125.0), test_rectangle) is True
    assert point_in_rectangle(point_at(350.0, 275.0), test_rectangle) is False
    close_window(test_window)


def test_FillRectangleOnWindowRecordWithOptions_integration():
    test_window = open_window("Test Window", 800, 600)
    test_rectangle = rectangle_from(100.0, 100.0, 200.0, 150.0)
    fill_rectangle_on_window(test_window, color_black(), test_rectangle, option_defaults())
    refresh_screen()
    assert point_in_rectangle(point_at(150.0, 125.0), test_rectangle) is True
    assert point_in_rectangle(point_at(350.0, 275.0), test_rectangle) is False
    close_window(test_window)


def test_FillRectangleOnWindow_integration():
    test_window = open_window("Test Window", 800, 600)
    fill_rectangle_on_window(test_window, color_black(), 100.0, 100.0, 50.0, 50.0)
    refresh_screen()
    assert point_in_rectangle(point_at(125.0, 125.0), rectangle_from(100.0, 100.0, 50.0, 50.0)) is True
    assert point_in_rectangle(point_at(175.0, 175.0), rectangle_from(100.0, 100.0, 50.0, 50.0)) is False
    close_window(test_window)


def test_FillRectangleOnWindowWithOptions_integration():
    test_window = open_window("Test Window", 800, 600)
    fill_rectangle_on_window(test_window, color_black(), 100.0, 100.0, 50.0, 50.0, option_defaults())
    refresh_screen()
    assert point_in_rectangle(point_at(125.0, 125.0), rectangle_from(100.0, 100.0, 50.0, 50.0)) is True
    assert point_in_rectangle(point_at(175.0, 175.0), rectangle_from(100.0, 100.0, 50.0, 50.0)) is False
    close_window(test_window)


def test_DrawTextFontAsString_integration():
    test_window = open_window("Text Drawing Test", 800, 600)
    draw_text_font_as_string("Hello, World!", color_black(), "hara", 24, 100.0, 100.0)
    refresh_screen()
    test_rectangle = rectangle_from(100.0, 100.0, text_width("Hello, World!", get_system_font(), 12), text_height("Hello, World!", get_system_font(), 12))
    assert point_in_rectangle(point_at(100.0, 100.0), test_rectangle) is True
    close_window(test_window)


def test_DrawTextWithOptionsFontAsString_integration():
    test_window = open_window("Test Window", 800, 600)
    draw_text("Hello, World!", color_black(), "leaguegothic", 24, 100.0, 100.0, option_defaults())
    refresh_screen()
    test_rectangle = rectangle_from(100.0, 100.0, text_width("Hello, World!", get_system_font(), 12), text_height("Hello, World!", get_system_font(), 12))
    assert point_in_rectangle(point_at(100.0, 100.0), test_rectangle) is True
    close_window(test_window)


def test_DrawTextNoFontNoSize_integration():
    test_window = open_window("Test Window", 800, 600)
    draw_text_no_font_no_size("Hello, World!", color_black(), 100.0, 100.0)
    refresh_screen()
    test_rectangle = rectangle_from(100.0, 100.0, text_width("Hello, World!", get_system_font(), 12), text_height("Hello, World!", get_system_font(), 12))
    assert point_in_rectangle(point_at(100.0, 100.0), test_rectangle) is True
    close_window(test_window)


def test_DrawTextNoFontNoSizeWithOptions_integration():
    test_window = open_window("Test Window", 800, 600)
    draw_text_no_font_no_size_with_options("Hello, World!", color_black(), 100.0, 100.0, option_defaults())
    refresh_screen()
    test_rectangle = rectangle_from(100.0, 100.0, text_width("Hello, World!", get_system_font(), 12), text_height("Hello, World!", get_system_font(), 12))
    assert point_in_rectangle(point_at(100.0, 100.0), test_rectangle) is True
    close_window(test_window)


def test_DrawText_integration():
    test_window = open_window("Test Window", 800, 600)
    draw_text("Hello, World!", color_black(), font_named("hara"), 24, 100.0, 100.0)
    refresh_screen()
    test_rectangle = rectangle_from(100.0, 100.0, text_width("Hello, World!", get_system_font(), 12), text_height("Hello, World!", get_system_font(), 12))
    assert point_in_rectangle(point_at(100.0, 100.0), test_rectangle) is True
    close_window(test_window)


def test_DrawTextWithOptions_integration():
    test_window = open_window("Test Window", 800, 600)
    draw_text_with_options("Hello, World!", color_black(), font_named("hara"), 24, 100.0, 100.0, option_defaults())
    refresh_screen()
    test_rectangle = rectangle_from(100.0, 100.0, text_width("Hello, World!", get_system_font(), 12), text_height("Hello, World!", get_system_font(), 12))
    assert point_in_rectangle(point_at(100.0, 100.0), test_rectangle) is True
    close_window(test_window)


def test_DrawTextOnBitmapFontAsString_integration():
    test_bitmap = create_bitmap("test_bitmap", 100, 100)
    draw_text_on_bitmap(test_bitmap, "Hello", color_black(), "hara", 12, 10.0, 10.0)
    assert pixel_drawn_at_point(test_bitmap, 10.0, 10.0) is True
    assert pixel_drawn_at_point(test_bitmap, 90.0, 90.0) is False
    free_bitmap(test_bitmap)


def test_DrawTextOnBitmapWithOptionsFontAsString_integration():
    test_bitmap = create_bitmap("test_bitmap", 100, 100)
    draw_text_on_bitmap(test_bitmap, "Hello", color_black(), "hara", 12, 10.0, 10.0, option_defaults())
    assert pixel_drawn_at_point(test_bitmap, 10.0, 10.0) is True
    assert pixel_drawn_at_point(test_bitmap, 90.0, 90.0) is False
    free_bitmap(test_bitmap)


def test_DrawTextOnBitmapNoFontNoSize_integration():
    test_bitmap = create_bitmap("test_bitmap", 100, 100)
    draw_text_on_bitmap(test_bitmap, "Test", color_black(), 10.0, 10.0)
    assert pixel_drawn_at_point(test_bitmap, 10.0, 10.0) is True
    assert pixel_drawn_at_point(test_bitmap, 90.0, 90.0) is False
    free_bitmap(test_bitmap)


def test_DrawTextOnBitmapNoFontNoSizeWithOptions_integration():
    test_bitmap = create_bitmap("test_bitmap", 100, 100)
    draw_text_on_bitmap(test_bitmap, "Test", color_black(), 10.0, 10.0, option_defaults())
    assert pixel_drawn_at_point(test_bitmap, 10.0, 10.0) is True
    assert pixel_drawn_at_point(test_bitmap, 90.0, 90.0) is False
    free_bitmap(test_bitmap)


def test_DrawTextOnBitmap_integration():
    test_bitmap = create_bitmap("test_bitmap", 100, 100)
    draw_text_on_bitmap(test_bitmap, "Hello", color_black(), font_named("hara"), 12, 10.0, 10.0)
    assert pixel_drawn_at_point(test_bitmap, 10.0, 10.0) is True
    assert pixel_drawn_at_point(test_bitmap, 90.0, 90.0) is False
    free_bitmap(test_bitmap)


def test_DrawTextOnBitmapWithOptions_integration():
    test_bitmap = create_bitmap("test_bitmap", 100, 100)
    draw_text_on_bitmap(test_bitmap, "Test", color_black(), font_named("hara"), 24, 10.0, 10.0, option_defaults())
    assert pixel_drawn_at_point(test_bitmap, 10.0, 10.0) is True
    assert pixel_drawn_at_point(test_bitmap, 90.0, 90.0) is False
    free_bitmap(test_bitmap)


def test_DrawTextOnWindowFontAsString_integration():
    test_window = open_window("Test Window", 800, 600)
    draw_text_on_window(test_window, "Hello, World!", color_black(), "hara", 24, 10.0, 10.0)
    refresh_screen()
    test_rectangle = rectangle_from(100.0, 100.0, text_width("Hello, World!", get_system_font(), 12), text_height("Hello, World!", get_system_font(), 12))
    assert point_in_rectangle(point_at(100.0, 100.0), test_rectangle) is True
    close_window(test_window)


def test_DrawTextOnWindowWithOptionsFontAsString_integration():
    test_window = open_window("Test Window", 800, 600)
    draw_text_on_window(test_window, "Hello, World!", color_black(), "hara", 24, 10.0, 10.0, option_defaults())
    refresh_screen()
    test_rectangle = rectangle_from(100.0, 100.0, text_width("Hello, World!", get_system_font(), 12), text_height("Hello, World!", get_system_font(), 12))
    assert point_in_rectangle(point_at(100.0, 100.0), test_rectangle) is True
    close_window(test_window)


def test_DrawTextOnWindowNoFontNoSize_integration():
    test_window = open_window("Test Window", 800, 600)
    draw_text_on_window(test_window, "Hello, World!", color_black(), 10.0, 10.0)
    refresh_screen()
    test_rectangle = rectangle_from(100.0, 100.0, text_width("Hello, World!", get_system_font(), 12), text_height("Hello, World!", get_system_font(), 12))
    assert point_in_rectangle(point_at(100.0, 100.0), test_rectangle) is True
    close_window(test_window)


def test_DrawTextOnWindowNoFontNoSizeWithOptions_integration():
    test_window = open_window("Test Window", 800, 600)
    draw_text_on_window(test_window, "Hello, World!", color_black(), 10.0, 10.0, option_defaults())
    refresh_screen()
    test_rectangle = rectangle_from(100.0, 100.0, text_width("Hello, World!", get_system_font(), 12), text_height("Hello, World!", get_system_font(), 12))
    assert point_in_rectangle(point_at(100.0, 100.0), test_rectangle) is True
    close_window(test_window)


def test_DrawTextOnWindow_integration():
    test_window = open_window("Test Window", 800, 600)
    test_font = load_font("test_font", "hara.ttf")
    font_load_size(test_font, 24)
    draw_text_on_window(test_window, "Hello, World!", color_black(), test_font, 24, 10.0, 10.0)
    refresh_screen()
    test_rectangle = rectangle_from(100.0, 100.0, text_width("Hello, World!", get_system_font(), 12), text_height("Hello, World!", get_system_font(), 12))
    assert point_in_rectangle(point_at(100.0, 100.0), test_rectangle) is True
    close_window(test_window)
    free_font(test_font)


def test_DrawTextOnWindowWithOptions_integration():
    test_window = open_window("Test Window", 800, 600)
    test_font = load_font("test_font", "hara.ttf")
    draw_text_on_window(test_window, "Hello, World!", color_black(), test_font, 24, 10.0, 10.0, option_defaults())
    refresh_screen()
    test_rectangle = rectangle_from(100.0, 100.0, text_width("Hello, World!", get_system_font(), 12), text_height("Hello, World!", get_system_font(), 12))
    assert point_in_rectangle(point_at(100.0, 100.0), test_rectangle) is True
    close_window(test_window)
    free_font(test_font)


def test_FontHasSizeNameAsString_integration():
    test_result1 = font_has_size_name_as_string("hara", 12)
    assert test_result1 is True
    test_result2 = font_has_size_name_as_string("nonexistent_font", 12)
    assert test_result2 is False


def test_FontHasSize_integration():
    test_font = load_font("test_font", "hara.ttf")
    has_size_12 = font_has_size(test_font, 12)
    assert has_size_12 is True
    has_size_999 = font_has_size(test_font, 999)
    assert has_size_999 is False
    free_font(test_font)


def test_FontLoadSizeNameAsString_integration():
    font_load_size("test_font", 12)
    test_font_size_check = font_has_size("test_font", 12)
    assert test_font_size_check is True


def test_FontLoadSize_integration():
    test_font = load_font("test_font", "hara.ttf")
    font_load_size(test_font, 12)
    assert font_has_size(test_font, 12) is True
    free_font(test_font)


def test_FontNamed_integration():
    test_window = open_window("Font Test", 800, 600)
    test_font = font_named("hara")
    draw_text("Test Text", color_black(), test_font, 24, 100.0, 100.0)
    refresh_screen()
    assert test_font is not None
    close_window(test_window)


def test_FreeAllFonts_integration():
    test_font = load_font("test_font", "hara.ttf")
    test_font_named = font_named("test_font")
    assert test_font_named is not None
    free_all_fonts()
    test_has_font = has_font("test_font")
    assert test_has_font is False


def test_FreeFont_integration():
    test_font = load_font("test_font", "hara.ttf")
    free_font(test_font)
    assert has_font(test_font) is False


def test_GetFontStyleNameAsString_integration():
    test_font = load_font("test_font", "hara.ttf")
    test_style = get_font_style("test_font")
    assert test_style is not None
    free_font(test_font)


def test_GetFontStyle_integration():
    test_font = load_font("test_font", "hara.ttf")
    test_style = get_font_style(test_font)
    assert test_style != FontStyle.BoldFont
    free_font(test_font)


def test_GetSystemFont_integration():
    test_font = get_system_font()
    assert test_font is not None
    test_has_size = font_has_size(test_font, 12)
    assert test_has_size is True


def test_HasFont_integration():
    test_font = load_font("test_font", "hara.ttf")
    assert has_font(test_font) is True
    free_font(test_font)
    assert has_font(test_font) is False


def test_HasFontNameAsString_integration():
    test_result_hara = has_font("hara")
    assert test_result_hara is True
    test_result_nonexistent = has_font("nonexistent_font")
    assert test_result_nonexistent is False


def test_LoadFont_integration():
    test_window = open_window("Font Test", 800, 600)
    test_font = load_font("test_font", "hara.ttf")
    draw_text("Hello, World!", color_black(), test_font, 24, 100.0, 100.0, option_defaults())
    refresh_screen()
    assert has_font("test_font") is True
    close_window(test_window)
    free_font(test_font)


def test_SetFontStyleNameAsString_integration():
    test_window = open_window("Test Window", 800, 600)
    test_font = load_font("test_font", "hara.ttf")
    font_load_size("test_font", 24)
    set_font_style_name_as_string("test_font", FontStyle.BoldFont)
    draw_text("Bold Text", color_black(), "test_font", 24, 100.0, 100.0)
    refresh_screen()
    assert get_font_style_name_as_string("test_font") == FontStyle.BoldFont
    close_window(test_window)
    free_font(test_font)


def test_SetFontStyle_integration():
    test_font = font_named("hara")
    set_font_style(test_font, FontStyle.BoldFont)
    test_style = get_font_style(test_font)
    assert test_style == FontStyle.BoldFont
    free_font(test_font)


def test_TextHeightFontNamed_integration():
    test_window = open_window("Test Window", 800, 600)
    test_height = text_height_font_named("Hello, World!", "hara", 24)
    assert test_height > 0
    close_window(test_window)


def test_TextHeight_integration():
    test_font = load_font("test_font", "hara.ttf")
    font_load_size(test_font, 24)
    test_height = text_height("Hello, World!", test_font, 24)
    assert test_height > 0
    free_font(test_font)


def test_TextWidthFontNamed_integration():
    test_window = open_window("Test Window", 800, 600)
    test_width = text_width_font_named("Hello, World!", "hara", 24)
    draw_text("Hello, World!", color_black(), "hara", 24, 100.0, 100.0)
    refresh_screen()
    assert test_width > 0
    close_window(test_window)


def test_TextWidth_integration():
    test_font = load_font("test_font", "hara.ttf")
    font_load_size(test_font, 12)
    test_width = text_width("Hello, World!", test_font, 12)
    assert test_width > 0
    free_font(test_font)


def test_DrawTriangleRecord_integration():
    test_window = open_window("Test Window", 800, 600)
    test_triangle = triangle_from(point_at(100.0, 100.0), point_at(200.0, 200.0), point_at(150.0, 300.0))
    draw_triangle(color_black(), test_triangle)
    refresh_screen()
    assert point_in_triangle(point_at(150.0, 200.0), test_triangle) is True
    assert point_in_triangle(point_at(300.0, 300.0), test_triangle) is False
    close_window(test_window)


def test_DrawTriangleRecordWithOptions_integration():
    test_window = open_window("Test Window", 800, 600)
    test_triangle = triangle_from(point_at(100.0, 100.0), point_at(200.0, 200.0), point_at(150.0, 300.0))
    draw_triangle(color_black(), test_triangle, option_defaults())
    refresh_screen()
    assert point_in_triangle(point_at(150.0, 150.0), test_triangle) is True
    assert point_in_triangle(point_at(300.0, 300.0), test_triangle) is False
    close_window(test_window)


def test_DrawTriangle_integration():
    test_window = open_window("Triangle Test", 800, 600)
    draw_triangle(color_black(), 100.0, 100.0, 200.0, 300.0, 300.0, 100.0)
    refresh_screen()
    assert point_in_triangle(point_at(150.0, 150.0), triangle_from(point_at(100.0, 100.0), point_at(200.0, 300.0), point_at(300.0, 100.0))) is True
    close_window(test_window)


def test_DrawTriangleWithOptions_integration():
    test_window = open_window("Triangle Test", 800, 600)
    draw_triangle_with_options(color_black(), 100.0, 100.0, 200.0, 200.0, 150.0, 300.0, option_defaults())
    refresh_screen()
    assert point_in_triangle(point_at(150.0, 150.0), triangle_from(point_at(100.0, 100.0), point_at(200.0, 200.0), point_at(150.0, 300.0))) is True
    close_window(test_window)


def test_DrawTriangleOnBitmapRecord_integration():
    test_bitmap = create_bitmap("test_bitmap", 100, 100)
    test_triangle = triangle_from(point_at(25.0, 25.0), point_at(75.0, 25.0), point_at(50.0, 75.0))
    draw_triangle_on_bitmap(test_bitmap, color_black(), test_triangle)
    assert pixel_drawn_at_point(test_bitmap, point_at(50.0, 50.0)) is True
    assert pixel_drawn_at_point(test_bitmap, point_at(10.0, 10.0)) is False
    free_bitmap(test_bitmap)


def test_DrawTriangleOnBitmapRecordWithOptions_integration():
    test_bitmap = create_bitmap("test_bitmap", 100, 100)
    test_triangle = triangle_from(point_at(25.0, 25.0), point_at(75.0, 25.0), point_at(50.0, 75.0))
    draw_triangle_on_bitmap(test_bitmap, color_black(), test_triangle, option_defaults())
    assert pixel_drawn_at_point(test_bitmap, point_at(50.0, 50.0)) is True
    assert pixel_drawn_at_point(test_bitmap, point_at(10.0, 10.0)) is False
    free_bitmap(test_bitmap)


def test_DrawTriangleOnBitmap_integration():
    test_bitmap = create_bitmap("test_bitmap", 100, 100)
    draw_triangle_on_bitmap(test_bitmap, color_black(), 25.0, 25.0, 75.0, 25.0, 50.0, 75.0)
    assert pixel_drawn_at_point(test_bitmap, point_at(50.0, 50.0)) is True
    assert pixel_drawn_at_point(test_bitmap, point_at(10.0, 10.0)) is False
    free_bitmap(test_bitmap)


def test_DrawTriangleOnBitmapWithOptions_integration():
    test_bitmap = create_bitmap("test_bitmap", 100, 100)
    draw_triangle_on_bitmap(test_bitmap, color_black(), 10.0, 10.0, 50.0, 90.0, 90.0, 10.0, option_defaults())
    assert pixel_drawn_at_point(test_bitmap, point_at(50.0, 50.0)) is True
    assert pixel_drawn_at_point(test_bitmap, point_at(100.0, 100.0)) is False
    free_bitmap(test_bitmap)


def test_DrawTriangleOnWindowRecord_integration():
    test_window = open_window("Test Window", 800, 600)
    test_triangle = triangle_from(point_at(100.0, 100.0), point_at(200.0, 200.0), point_at(150.0, 300.0))
    draw_triangle_on_window(test_window, color_black(), test_triangle)
    refresh_screen()
    assert point_in_triangle(point_at(150.0, 200.0), test_triangle) is True
    close_window(test_window)


def test_DrawTriangleOnWindowRecordWithOptions_integration():
    test_window = open_window("Test Window", 800, 600)
    test_triangle = triangle_from(point_at(100.0, 100.0), point_at(200.0, 200.0), point_at(150.0, 250.0))
    draw_triangle_on_window(test_window, color_black(), test_triangle, option_defaults())
    refresh_screen()
    assert point_in_triangle(point_at(150.0, 150.0), test_triangle) is True
    close_window(test_window)


def test_DrawTriangleOnWindow_integration():
    test_window = open_window("Test Window", 800, 600)
    draw_triangle_on_window(test_window, color_black(), 100.0, 100.0, 200.0, 300.0, 300.0, 100.0)
    refresh_screen()
    assert point_in_triangle(point_at(200.0, 200.0), triangle_from(point_at(100.0, 100.0), point_at(200.0, 300.0), point_at(300.0, 100.0))) is True
    close_window(test_window)


def test_DrawTriangleOnWindowWithOptions_integration():
    test_window = open_window("Test Window", 800, 600)
    draw_triangle_on_window_with_options(test_window, color_black(), 100.0, 100.0, 200.0, 200.0, 150.0, 300.0, option_defaults())
    refresh_screen()
    assert point_in_triangle(point_at(150.0, 200.0), triangle_from(100.0, 100.0, 200.0, 200.0, 150.0, 300.0)) is True
    close_window(test_window)


def test_FillTriangleRecord_integration():
    test_window = open_window("Test Window", 800, 600)
    test_triangle = triangle_from(point_at(100.0, 100.0), point_at(200.0, 300.0), point_at(300.0, 100.0))
    fill_triangle(color_black(), test_triangle)
    refresh_screen()
    assert point_in_triangle(point_at(200.0, 200.0), test_triangle) is True
    assert point_in_triangle(point_at(400.0, 400.0), test_triangle) is False
    close_window(test_window)


def test_FillTriangleRecordWithOptions_integration():
    test_window = open_window("Test Window", 800, 600)
    test_triangle = triangle_from(point_at(100.0, 100.0), point_at(200.0, 300.0), point_at(300.0, 100.0))
    fill_triangle(color_black(), test_triangle, option_defaults())
    refresh_screen()
    assert point_in_triangle(point_at(200.0, 200.0), test_triangle) is True
    assert point_in_triangle(point_at(400.0, 400.0), test_triangle) is False
    close_window(test_window)


def test_FillTriangle_integration():
    test_window = open_window("Test Window", 800, 600)
    fill_triangle(color_black(), 100.0, 100.0, 200.0, 300.0, 300.0, 100.0)
    refresh_screen()
    assert point_in_triangle(point_at(150.0, 150.0), triangle_from(point_at(100.0, 100.0), point_at(200.0, 300.0), point_at(300.0, 100.0))) is True
    close_window(test_window)


def test_FillTriangleWithOptions_integration():
    test_window = open_window("Triangle Test", 800, 600)
    fill_triangle_with_options(color_red(), 100.0, 100.0, 200.0, 300.0, 300.0, 100.0, option_defaults())
    refresh_screen()
    assert point_in_triangle(point_at(150.0, 150.0), triangle_from(point_at(100.0, 100.0), point_at(200.0, 300.0), point_at(300.0, 100.0))) is True
    assert point_in_triangle(point_at(350.0, 150.0), triangle_from(point_at(100.0, 100.0), point_at(200.0, 300.0), point_at(300.0, 100.0))) is False
    close_window(test_window)


def test_FillTriangleOnBitmapRecord_integration():
    test_bitmap = create_bitmap("test_bitmap", 100, 100)
    test_triangle = triangle_from(point_at(25.0, 25.0), point_at(75.0, 25.0), point_at(50.0, 75.0))
    fill_triangle_on_bitmap(test_bitmap, color_black(), test_triangle)
    assert pixel_drawn_at_point(test_bitmap, point_at(50.0, 50.0)) is True
    assert pixel_drawn_at_point(test_bitmap, point_at(0.0, 0.0)) is False
    free_bitmap(test_bitmap)


def test_FillTriangleOnBitmapRecordWithOptions_integration():
    test_bitmap = create_bitmap("test_bitmap", 100, 100)
    test_triangle = triangle_from(point_at(25.0, 25.0), point_at(75.0, 25.0), point_at(50.0, 75.0))
    fill_triangle_on_bitmap(test_bitmap, color_black(), test_triangle, option_defaults())
    assert pixel_drawn_at_point(test_bitmap, point_at(50.0, 50.0)) is True
    assert pixel_drawn_at_point(test_bitmap, point_at(10.0, 10.0)) is False
    free_bitmap(test_bitmap)


def test_FillTriangleOnBitmap_integration():
    test_bitmap = create_bitmap("test_bitmap", 100, 100)
    fill_triangle_on_bitmap(test_bitmap, color_black(), 25.0, 25.0, 75.0, 25.0, 50.0, 75.0)
    assert pixel_drawn_at_point(test_bitmap, 50.0, 50.0) is True
    assert pixel_drawn_at_point(test_bitmap, 0.0, 0.0) is False
    free_bitmap(test_bitmap)


def test_FillTriangleOnBitmapWithOptions_integration():
    test_bitmap = create_bitmap("test_bitmap", 100, 100)
    fill_triangle_on_bitmap_with_options(test_bitmap, color_black(), 25.0, 25.0, 75.0, 25.0, 50.0, 75.0, option_defaults())
    assert pixel_drawn_at_point(test_bitmap, 50.0, 50.0) is True
    assert pixel_drawn_at_point(test_bitmap, 0.0, 0.0) is False
    free_bitmap(test_bitmap)


def test_FillTriangleOnWindowRecord_integration():
    test_window = open_window("Test Window", 800, 600)
    test_triangle = triangle_from(point_at(100.0, 100.0), point_at(200.0, 300.0), point_at(300.0, 100.0))
    fill_triangle_on_window(test_window, color_black(), test_triangle)
    refresh_screen()
    assert point_in_triangle(point_at(200.0, 200.0), test_triangle) is True
    close_window(test_window)


def test_FillTriangleOnWindowRecordWithOptions_integration():
    test_window = open_window("Test Window", 800, 600)
    test_triangle = triangle_from(point_at(100.0, 100.0), point_at(200.0, 300.0), point_at(300.0, 100.0))
    fill_triangle_on_window(test_window, color_black(), test_triangle, option_defaults())
    refresh_screen()
    assert point_in_triangle(point_at(200.0, 200.0), test_triangle) is True
    close_window(test_window)


def test_FillTriangleOnWindow_integration():
    test_window = open_window("Test Window", 800, 600)
    fill_triangle_on_window(test_window, color_black(), 100.0, 100.0, 200.0, 300.0, 300.0, 100.0)
    refresh_screen()
    assert point_in_triangle(point_at(200.0, 200.0), triangle_from(point_at(100.0, 100.0), point_at(200.0, 300.0), point_at(300.0, 100.0))) is True
    close_window(test_window)


def test_FillTriangleOnWindowWithOptions_integration():
    test_window = open_window("Test Window", 800, 600)
    fill_triangle_on_window(test_window, color_black(), 100.0, 100.0, 200.0, 300.0, 300.0, 100.0, option_defaults())
    refresh_screen()
    assert point_in_triangle(point_at(150.0, 150.0), triangle_from(point_at(100.0, 100.0), point_at(200.0, 300.0), point_at(300.0, 100.0))) is True
    assert point_in_triangle(point_at(350.0, 150.0), triangle_from(point_at(100.0, 100.0), point_at(200.0, 300.0), point_at(300.0, 100.0))) is False
    close_window(test_window)

