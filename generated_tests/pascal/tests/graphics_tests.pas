uses SplashKit, TestFramework

type
TIntegrationTests = class(TTestCase)
published
procedure TIntegrationTests.TestDrawCircleRecordIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    testCircle := circle_at(400.0, 300.0, 50.0);
    draw_circle(color_black(), testCircle);
    refresh_screen();
    AssertTrue(point_in_circle(point_at(400.0, 300.0), testCircle));
    close_window(testWindow);
end;
procedure TIntegrationTests.TestDrawCircleRecordWithOptionsIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    testCircle := circle_at(400.0, 300.0, 50.0);
    draw_circle(color_black(), testCircle, option_defaults());
    refresh_screen();
    AssertTrue(point_in_circle(point_at(400.0, 300.0), testCircle));
    close_window(testWindow);
end;
procedure TIntegrationTests.TestDrawCircleIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    draw_circle(color_black(), 400.0, 300.0, 50.0);
    refresh_screen();
    AssertTrue(point_in_circle(point_at(400.0, 300.0), circle_at(400.0, 300.0, 50.0)));
    close_window(testWindow);
end;
procedure TIntegrationTests.TestDrawCircleWithOptionsIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    draw_circle(color_black(), 400.0, 300.0, 50.0, option_defaults());
    refresh_screen();
    AssertTrue(point_in_circle(point_at(400.0, 300.0), circle_at(400.0, 300.0, 50.0)));
    close_window(testWindow);
end;
procedure TIntegrationTests.TestDrawCircleOnBitmapIntegration;
begin
    testBitmap := create_bitmap("test_bitmap", 200, 200);
    draw_circle_on_bitmap(testBitmap, color_black(), 100.0, 100.0, 50.0);
    AssertTrue(pixel_drawn_at_point(testBitmap, 100.0, 100.0));
    free_bitmap(testBitmap);
end;
procedure TIntegrationTests.TestDrawCircleOnBitmapWithOptionsIntegration;
begin
    testBitmap := create_bitmap("test_bitmap", 200, 200);
    draw_circle_on_bitmap(testBitmap, color_black(), 100.0, 100.0, 50.0, option_defaults());
    AssertTrue(pixel_drawn_at_point(testBitmap, 100.0, 100.0));
    free_bitmap(testBitmap);
end;
procedure TIntegrationTests.TestDrawCircleOnWindowIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    draw_circle_on_window(testWindow, color_black(), 400.0, 300.0, 50.0);
    refresh_screen();
    AssertTrue(point_in_circle(point_at(400.0, 300.0), circle_at(400.0, 300.0, 50.0)));
    close_window(testWindow);
end;
procedure TIntegrationTests.TestDrawCircleOnWindowWithOptionsIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    draw_circle_on_window(testWindow, color_black(), 400.0, 300.0, 50.0, option_defaults());
    refresh_screen();
    AssertTrue(point_in_circle(point_at(400.0, 300.0), circle_at(400.0, 300.0, 50.0)));
    close_window(testWindow);
end;
procedure TIntegrationTests.TestFillCircleRecordIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    testCircle := circle_at(400.0, 300.0, 50.0);
    fill_circle(color_black(), testCircle);
    refresh_screen();
    AssertTrue(point_in_circle(point_at(400.0, 300.0), testCircle));
    close_window(testWindow);
end;
procedure TIntegrationTests.TestFillCircleRecordWithOptionsIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    testCircle := circle_at(400.0, 300.0, 50.0);
    fill_circle(color_black(), testCircle, option_defaults());
    refresh_screen();
    AssertTrue(point_in_circle(point_at(400.0, 300.0), testCircle));
    close_window(testWindow);
end;
procedure TIntegrationTests.TestFillCircleIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    fill_circle(color_black(), 400.0, 300.0, 50.0);
    refresh_screen();
    AssertTrue(point_in_circle(point_at(400.0, 300.0), circle_at(400.0, 300.0, 50.0)));
    close_window(testWindow);
end;
procedure TIntegrationTests.TestFillCircleWithOptionsIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    fill_circle(color_black(), 400.0, 300.0, 50.0, option_defaults());
    refresh_screen();
    AssertTrue(point_in_circle(point_at(400.0, 300.0), circle_at(400.0, 300.0, 50.0)));
    close_window(testWindow);
end;
procedure TIntegrationTests.TestFillCircleOnBitmapIntegration;
begin
    testBitmap := create_bitmap("test_bitmap", 200, 200);
    fill_circle_on_bitmap(testBitmap, color_red(), 100.0, 100.0, 50.0);
    AssertTrue(pixel_drawn_at_point(testBitmap, 100.0, 100.0));
    AssertTrue(pixel_drawn_at_point(testBitmap, 150.0, 100.0));
    AssertFalse(pixel_drawn_at_point(testBitmap, 200.0, 100.0));
    free_bitmap(testBitmap);
end;
procedure TIntegrationTests.TestFillCircleOnBitmapWithOptionsIntegration;
begin
    testBitmap := create_bitmap("test_bitmap", 200, 200);
    fill_circle_on_bitmap(testBitmap, color_black(), 100.0, 100.0, 50.0, option_defaults());
    AssertTrue(pixel_drawn_at_point(testBitmap, 100.0, 100.0));
    AssertTrue(pixel_drawn_at_point(testBitmap, 150.0, 100.0));
    AssertFalse(pixel_drawn_at_point(testBitmap, 200.0, 100.0));
    free_bitmap(testBitmap);
end;
procedure TIntegrationTests.TestFillCircleOnWindowIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    fill_circle_on_window(testWindow, color_black(), 400.0, 300.0, 50.0);
    refresh_screen();
    AssertTrue(point_in_circle(point_at(400.0, 300.0), circle_at(400.0, 300.0, 50.0)));
    close_window(testWindow);
end;
procedure TIntegrationTests.TestFillCircleOnWindowWithOptionsIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    fill_circle_on_window(testWindow, color_black(), 400.0, 300.0, 50.0, option_defaults());
    refresh_screen();
    AssertTrue(point_in_circle(point_at(400.0, 300.0), circle_at(400.0, 300.0, 50.0)));
    close_window(testWindow);
end;
procedure TIntegrationTests.TestCurrentClipIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    testClip := current_clip();
    AssertEquals(testClip.width, 800);
    AssertEquals(testClip.height, 600);
    close_window(testWindow);
end;
procedure TIntegrationTests.TestCurrentClipForBitmapIntegration;
begin
    testBitmap := create_bitmap("test_bitmap", 100, 100);
    testRectangle := rectangle_from(10, 10, 50, 50);
    push_clip(testBitmap, testRectangle);
    testClip := current_clip(testBitmap);
    AssertEquals(rectangle_left(testClip), 10);
    AssertEquals(rectangle_top(testClip), 10);
    AssertEquals(testClip.width, 50);
    AssertEquals(testClip.height, 50);
    free_bitmap(testBitmap);
end;
procedure TIntegrationTests.TestCurrentClipForWindowIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    testClip := current_clip(testWindow);
    AssertEquals(rectangle_from(0, 0, 800, 600), testClip);
    close_window(testWindow);
end;
procedure TIntegrationTests.TestPopClipForWindowIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    testRectangle := rectangle_from(100, 100, 200, 200);
    push_clip(testWindow, testRectangle);
    testCurrentClip := current_clip(testWindow);
    AssertEquals(testCurrentClip, testRectangle);
    pop_clip(testWindow);
    testCurrentClipAfterPop := current_clip(testWindow);
    AssertEquals(rectangle_from(0, 0, 800, 600), testCurrentClipAfterPop);
    close_window(testWindow);
end;
procedure TIntegrationTests.TestPopClipIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    push_clip(rectangle_from(100, 100, 200, 200));
    draw_circle(color_black(), 150, 150, 50);
    refresh_screen();
    AssertTrue(point_in_circle(point_at(150, 150), circle_at(150, 150, 50)));
    pop_clip();
    draw_circle(color_red(), 300, 300, 50);
    refresh_screen();
    AssertTrue(point_in_circle(point_at(300, 300), circle_at(300, 300, 50)));
    close_window(testWindow);
end;
procedure TIntegrationTests.TestPopClipForBitmapIntegration;
begin
    testBitmap := create_bitmap("test_bitmap", 100, 100);
    push_clip(testBitmap, rectangle_from(0, 0, 50, 50));
    pop_clip(testBitmap);
    AssertEquals(current_clip(testBitmap), rectangle_from(0, 0, 100, 100));
    free_bitmap(testBitmap);
end;
procedure TIntegrationTests.TestPushClipForWindowIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    testRectangle := rectangle_from(100.0, 100.0, 200.0, 200.0);
    push_clip(testWindow, testRectangle);
    testCurrentClip := current_clip(testWindow);
    AssertEquals(testCurrentClip, testRectangle);
    refresh_screen();
    close_window(testWindow);
end;
procedure TIntegrationTests.TestPushClipForBitmapIntegration;
begin
    testBitmap := create_bitmap("test_bitmap", 200, 200);
    testRectangle := rectangle_from(50, 50, 100, 100);
    push_clip(testBitmap, testRectangle);
    testCurrentClip := current_clip(testBitmap);
    AssertEquals(rectangle_left(testCurrentClip), 50);
    AssertEquals(rectangle_top(testCurrentClip), 50);
    AssertEquals(testCurrentClip.width, 100);
    AssertEquals(testCurrentClip.height, 100);
    free_bitmap(testBitmap);
end;
procedure TIntegrationTests.TestPushClipIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    testRectangle := rectangle_from(100.0, 100.0, 200.0, 200.0);
    push_clip(testRectangle);
    testCurrentClip := current_clip();
    AssertEquals(testCurrentClip, testRectangle);
    close_window(testWindow);
end;
procedure TIntegrationTests.TestResetClipForBitmapIntegration;
begin
    testBitmap := create_bitmap("test_bitmap", 100, 100);
    push_clip(testBitmap, rectangle_from(10, 10, 50, 50));
    reset_clip(testBitmap);
    AssertEquals(current_clip(testBitmap), rectangle_from(0, 0, 100, 100));
    free_bitmap(testBitmap);
end;
procedure TIntegrationTests.TestResetClipIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    push_clip(rectangle_from(100, 100, 200, 200));
    reset_clip();
    testClipRect := current_clip();
    AssertEquals(rectangle_from(0, 0, 800, 600), testClipRect);
    close_window(testWindow);
end;
procedure TIntegrationTests.TestResetClipForWindowIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    push_clip(testWindow, rectangle_from(100, 100, 200, 200));
    reset_clip(testWindow);
    testClipRect := current_clip(testWindow);
    AssertEquals(rectangle_from(0, 0, 800, 600), testClipRect);
    close_window(testWindow);
end;
procedure TIntegrationTests.TestSetClipIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    testRectangle := rectangle_from(100.0, 100.0, 200.0, 200.0);
    set_clip(testRectangle);
    testCurrentClip := current_clip();
    AssertEquals(testCurrentClip, testRectangle);
    close_window(testWindow);
end;
procedure TIntegrationTests.TestSetClipForBitmapIntegration;
begin
    testBitmap := create_bitmap("test_bitmap", 200, 200);
    testRectangle := rectangle_from(50, 50, 100, 100);
    set_clip(testBitmap, testRectangle);
    testCurrentClip := current_clip(testBitmap);
    AssertEquals(testCurrentClip, testRectangle);
    free_bitmap(testBitmap);
end;
procedure TIntegrationTests.TestSetClipForWindowIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    testRectangle := rectangle_from(100, 100, 200, 200);
    set_clip(testWindow, testRectangle);
    testCurrentClip := current_clip(testWindow);
    AssertEquals(testCurrentClip, testRectangle);
    close_window(testWindow);
end;
procedure TIntegrationTests.TestOptionDefaultsIntegration;
begin
    testOptions := option_defaults();
    AssertNotNull(testOptions);
end;
procedure TIntegrationTests.TestOptionDrawToBitmapIntegration;
begin
    testBitmap := create_bitmap("test_bitmap", 100, 100);
    testOptions := option_draw_to(testBitmap);
    draw_circle(color_black(), circle_at(50.0, 50.0, 25.0), testOptions);
    AssertTrue(pixel_drawn_at_point(testBitmap, 50.0, 50.0));
    AssertFalse(pixel_drawn_at_point(testBitmap, 100.0, 100.0));
    free_bitmap(testBitmap);
end;
procedure TIntegrationTests.TestOptionDrawToBitmapWithOptionsIntegration;
begin
    testBitmap := create_bitmap("test_bitmap", 100, 100);
    testOptions := option_defaults();
    testDrawingOptions := option_draw_to(testBitmap, testOptions);
    draw_circle(color_black(), circle_at(50.0, 50.0, 25.0), testDrawingOptions);
    AssertTrue(pixel_drawn_at_point(testBitmap, 50.0, 50.0));
    AssertFalse(pixel_drawn_at_point(testBitmap, 100.0, 100.0));
    free_bitmap(testBitmap);
end;
procedure TIntegrationTests.TestOptionDrawToWindowIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    testCircle := circle_at(400.0, 300.0, 50.0);
    draw_circle(color_black(), testCircle, option_draw_to(testWindow));
    refresh_screen();
    AssertTrue(point_in_circle(point_at(400.0, 300.0), testCircle));
    close_window(testWindow);
end;
procedure TIntegrationTests.TestOptionDrawToWindowWithOptionsIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    testOptions := option_defaults();
    testDrawOptions := option_draw_to(testWindow, testOptions);
    draw_circle(color_black(), circle_at(400.0, 300.0, 50.0), testDrawOptions);
    refresh_screen();
    AssertTrue(point_in_circle(point_at(400.0, 300.0), circle_at(400.0, 300.0, 50.0)));
    close_window(testWindow);
end;
procedure TIntegrationTests.TestOptionFlipXIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    testBitmap := load_bitmap("test_bitmap", "test_bitmap.png");
    draw_bitmap(testBitmap, 100.0, 100.0, option_flip_x());
    refresh_screen();
    AssertTrue(pixel_drawn_at_point(testBitmap, point_at(50.0, 100.0)));
    AssertFalse(pixel_drawn_at_point(testBitmap, point_at(150.0, 100.0)));
    free_bitmap(testBitmap);
    close_window(testWindow);
end;
procedure TIntegrationTests.TestOptionFlipXWithOptionsIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    testBitmap := load_bitmap("test_bitmap", "test_bitmap.png");
    draw_bitmap(testBitmap, 400, 300, option_flip_x(option_defaults()));
    refresh_screen();
    AssertTrue(pixel_drawn_at_point(testBitmap, point_at(bitmap_width(testBitmap), bitmap_height(testBitmap))));
    AssertFalse(pixel_drawn_at_point(testBitmap, point_at(0, bitmap_height(testBitmap))));
    free_bitmap(testBitmap);
    close_window(testWindow);
end;
procedure TIntegrationTests.TestOptionFlipXyIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    testBitmap := load_bitmap("test_bitmap", "test_bitmap.png");
    draw_bitmap(testBitmap, 400.0, 300.0, option_flip_xy());
    refresh_screen();
    AssertTrue(pixel_drawn_at_point(testBitmap, point_at(bitmap_width(testBitmap), 0.0)));
    AssertTrue(pixel_drawn_at_point(testBitmap, point_at(0.0, bitmap_height(testBitmap))));
    free_bitmap(testBitmap);
    close_window(testWindow);
end;
procedure TIntegrationTests.TestOptionFlipXyWithOptionsIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    testBitmap := load_bitmap("test_bitmap", "test_bitmap.png");
    testOptions := option_defaults();
    testOptionsFlipped := option_flip_xy(testOptions);
    draw_bitmap(testBitmap, 400, 300, testOptionsFlipped);
    refresh_screen();
    AssertTrue(pixel_drawn_at_point(testBitmap, point_at(bitmap_width(testBitmap), 0)));
    AssertFalse(pixel_drawn_at_point(testBitmap, point_at(0, bitmap_height(testBitmap))));
    free_bitmap(testBitmap);
    close_window(testWindow);
end;
procedure TIntegrationTests.TestOptionFlipYIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    testBitmap := load_bitmap("test_bitmap", "test_bitmap.png");
    draw_bitmap(testBitmap, 400.0, 300.0, option_flip_y());
    refresh_screen();
    AssertTrue(pixel_drawn_at_point(testBitmap, 400.0, bitmap_height(testBitmap)));
    AssertFalse(pixel_drawn_at_point(testBitmap, 400.0, 0.0));
    free_bitmap(testBitmap);
    close_window(testWindow);
end;
procedure TIntegrationTests.TestOptionFlipYWithOptionsIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    testBitmap := load_bitmap("test_bitmap", "test_bitmap.png");
    draw_bitmap(testBitmap, 400.0, 300.0, option_flip_y(option_defaults()));
    refresh_screen();
    AssertTrue(pixel_drawn_at_point(testBitmap, point_at(400.0, bitmap_height(testBitmap))));
    AssertFalse(pixel_drawn_at_point(testBitmap, point_at(400.0, 0.0)));
    free_bitmap(testBitmap);
    close_window(testWindow);
end;
procedure TIntegrationTests.TestOptionLineWidthIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    draw_line(color_black(), 100.0, 100.0, 200.0, 200.0, option_line_width(1));
    refresh_screen();
    AssertEquals(get_pixel(point_at(100.0, 100.0)), color_black());
    draw_line(color_black(), 300.0, 300.0, 400.0, 400.0, option_line_width(5));
    refresh_screen();
    AssertEquals(get_pixel(point_at(300.0, 300.0)), color_black());
    close_window(testWindow);
end;
procedure TIntegrationTests.TestOptionLineWidthWithOptionsIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    testCircle := circle_at(400.0, 300.0, 50.0);
    draw_circle(color_black(), testCircle, option_line_width(3, option_defaults()));
    refresh_screen();
    AssertTrue(point_in_circle(point_at(400.0, 300.0), testCircle));
    close_window(testWindow);
end;
procedure TIntegrationTests.TestOptionPartBmpIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    testBitmap := load_bitmap("test_bitmap", "test_bitmap.png");
    testOptions := option_part_bmp(0.0, 0.0, 50.0, 50.0);
    draw_bitmap(testBitmap, 100.0, 100.0, testOptions);
    refresh_screen();
    AssertTrue(pixel_drawn_at_point(testBitmap, point_at(25.0, 25.0)));
    AssertFalse(pixel_drawn_at_point(testBitmap, point_at(75.0, 75.0)));
    free_bitmap(testBitmap);
    close_window(testWindow);
end;
procedure TIntegrationTests.TestOptionPartBmpWithOptionsIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    testBitmap := load_bitmap("test_bitmap", "test_bitmap.png");
    testOptions := option_part_bmp(10.0, 10.0, 50.0, 50.0, option_defaults());
    draw_bitmap(testBitmap, 100.0, 100.0, testOptions);
    refresh_screen();
    AssertTrue(pixel_drawn_at_point(testBitmap, point_at(110.0, 110.0)));
    AssertFalse(pixel_drawn_at_point(testBitmap, point_at(160.0, 160.0)));
    free_bitmap(testBitmap);
    close_window(testWindow);
end;
procedure TIntegrationTests.TestOptionPartBmpFromRectangleIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    testBitmap := load_bitmap("test_bitmap", "test_bitmap.png");
    testRectangle := rectangle_from(100, 100, 200, 200);
    testOptions := option_part_bmp(testRectangle);
    draw_bitmap(testBitmap, 0, 0, testOptions);
    refresh_screen();
    AssertTrue(pixel_drawn_at_point(testBitmap, point_at(150, 150)));
    AssertFalse(pixel_drawn_at_point(testBitmap, point_at(350, 350)));
    free_bitmap(testBitmap);
    close_window(testWindow);
end;
procedure TIntegrationTests.TestOptionPartBmpFromRectangleWithOptionsIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    testBitmap := load_bitmap("test_bitmap", "test_bitmap.png");
    testRectangle := rectangle_from(100.0, 100.0, 200.0, 200.0);
    testOptions := option_part_bmp(testRectangle, option_defaults());
    draw_bitmap(testBitmap, 0.0, 0.0, testOptions);
    refresh_screen();
    AssertTrue(pixel_drawn_at_point(testBitmap, point_at(150.0, 150.0)));
    AssertFalse(pixel_drawn_at_point(testBitmap, point_at(350.0, 350.0)));
    free_bitmap(testBitmap);
    close_window(testWindow);
end;
procedure TIntegrationTests.TestOptionRotateBmpIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    testBitmap := load_bitmap("test_bitmap", "test_bitmap.png");
    draw_bitmap(testBitmap, 400.0, 300.0, option_rotate_bmp(45.0));
    refresh_screen();
    AssertTrue(pixel_drawn_at_point(testBitmap, point_at(400.0, 300.0)));
    AssertFalse(pixel_drawn_at_point(testBitmap, point_at(bitmap_width(testBitmap), 300.0)));
    free_bitmap(testBitmap);
    close_window(testWindow);
end;
procedure TIntegrationTests.TestOptionRotateBmpWithAnchorIntegration;
begin
    testWindow := open_window("Rotation Test", 800, 600);
    testBitmap := load_bitmap("test_bitmap", "test_bitmap.png");
    testOptions := option_rotate_bmp(45.0, 50.0, 50.0);
    draw_bitmap(testBitmap, 400.0, 300.0, testOptions);
    refresh_screen();
    AssertTrue(pixel_drawn_at_point(testBitmap, point_at(400.0, 300.0)));
    AssertTrue(pixel_drawn_at_point(testBitmap, point_at(bitmap_width(testBitmap), bitmap_height(testBitmap))));
    free_bitmap(testBitmap);
    close_window(testWindow);
end;
procedure TIntegrationTests.TestOptionRotateBmpWithAnchorAndOptionsIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    testBitmap := load_bitmap("test_bitmap", "test_bitmap.png");
    testOptions := option_rotate_bmp(45.0, 50.0, 50.0, option_defaults());
    draw_bitmap(testBitmap, 400.0, 300.0, testOptions);
    refresh_screen();
    AssertTrue(pixel_drawn_at_point(testBitmap, point_at(400.0, 300.0)));
    free_bitmap(testBitmap);
    close_window(testWindow);
end;
procedure TIntegrationTests.TestOptionRotateBmpWithOptionsIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    testBitmap := load_bitmap("test_bitmap", "test_bitmap.png");
    testOptions := option_rotate_bmp(45.0, option_defaults());
    draw_bitmap(testBitmap, 400.0, 300.0, testOptions);
    refresh_screen();
    AssertTrue(pixel_drawn_at_point(testBitmap, point_at(400.0, 300.0)));
    AssertTrue(pixel_drawn_at_point(testBitmap, point_at(cosine(45.0), sine(45.0))));
    free_bitmap(testBitmap);
    close_window(testWindow);
end;
procedure TIntegrationTests.TestOptionScaleBmpIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    testBitmap := load_bitmap("test_bitmap", "test_bitmap.png");
    draw_bitmap(testBitmap, 100.0, 100.0, option_scale_bmp(2.0, 2.0));
    refresh_screen();
    AssertTrue(pixel_drawn_at_point(testBitmap, point_at(100.0, 100.0)));
    AssertTrue(pixel_drawn_at_point(testBitmap, point_at(bitmap_width(testBitmap), bitmap_height(testBitmap))));
    free_bitmap(testBitmap);
    close_window(testWindow);
end;
procedure TIntegrationTests.TestOptionScaleBmpWithOptionsIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    testBitmap := load_bitmap("test_bitmap", "test_bitmap.png");
    testOptions := option_scale_bmp(2.0, 2.0, option_defaults());
    draw_bitmap(testBitmap, 100.0, 100.0, testOptions);
    refresh_screen();
    AssertTrue(pixel_drawn_at_point(testBitmap, point_at(100.0, 100.0)));
    AssertTrue(pixel_drawn_at_point(testBitmap, point_at(bitmap_width(testBitmap), bitmap_height(testBitmap))));
    free_bitmap(testBitmap);
    close_window(testWindow);
end;
procedure TIntegrationTests.TestOptionToScreenIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    testOptions := option_to_screen();
    draw_circle(color_black(), circle_at(400.0, 300.0, 50.0), testOptions);
    refresh_screen();
    AssertTrue(point_in_circle(point_at(400.0, 300.0), circle_at(400.0, 300.0, 50.0)));
    close_window(testWindow);
end;
procedure TIntegrationTests.TestOptionToScreenWithOptionsIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    testOptions := option_defaults();
    testScreenOptions := option_to_screen(testOptions);
    draw_circle(color_black(), circle_at(400.0, 300.0, 50.0), testScreenOptions);
    refresh_screen();
    AssertTrue(point_in_circle(point_at(400.0, 300.0), circle_at(400.0, 300.0, 50.0)));
    close_window(testWindow);
end;
procedure TIntegrationTests.TestOptionToWorldIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    move_camera_to(100.0, 100.0);
    draw_circle(color_black(), 100.0, 100.0, 50.0, option_to_world());
    refresh_screen();
    AssertTrue(point_in_circle(point_at(0.0, 0.0), circle_at(100.0, 100.0, 50.0)));
    close_window(testWindow);
end;
procedure TIntegrationTests.TestOptionToWorldWithOptionsIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    testOptions := option_defaults();
    testWorldOptions := option_to_world(testOptions);
    draw_circle(color_black(), circle_at(100.0, 100.0, 50.0), testWorldOptions);
    refresh_screen();
    AssertTrue(point_in_circle(point_at(100.0, 100.0), circle_at(100.0, 100.0, 50.0)));
    close_window(testWindow);
end;
procedure TIntegrationTests.TestOptionWithAnimationIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    testBitmap := create_bitmap("test_bitmap", 100, 100);
    testAnimation := create_animation("script", "test_animation");
    draw_bitmap(testBitmap, 100, 100, option_with_animation(testAnimation));
    draw_bitmap(testBitmap, 100.0, 100.0, option_with_animation(testAnimation));
    refresh_screen();
    AssertTrue(pixel_drawn_at_point(testBitmap, point_at(50.0, 50.0)));
    free_bitmap(testBitmap);
    free_animation(testAnimation);
    close_window(testWindow);
end;
procedure TIntegrationTests.TestOptionWithAnimationWithOptionsIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    testBitmap := load_bitmap("test_bitmap", "test_bitmap.png");
    testAnimation := create_animation("script", "test_animation");
    draw_bitmap(testBitmap, 100, 100, option_with_animation(testAnimation));
    testOptions := option_with_animation(testAnimation, option_defaults());
    draw_bitmap(testBitmap, 100.0, 100.0, testOptions);
    refresh_screen();
    AssertTrue(pixel_drawn_at_point(testBitmap, point_at(100.0, 100.0)));
    free_bitmap(testBitmap);
    free_animation(testAnimation);
    close_window(testWindow);
end;
procedure TIntegrationTests.TestOptionWithBitmapCellIntegration;
begin
    testBitmap := load_bitmap("test_bitmap", "test_bitmap.png");
    bitmap_set_cell_details(testBitmap, 32, 32, 4, 4, 16);
    testWindow := open_window("Test Window", 800, 600);
    draw_bitmap(testBitmap, 100.0, 100.0, option_with_bitmap_cell(5));
    refresh_screen();
    AssertTrue(pixel_drawn_at_point(testBitmap, point_at(116.0, 116.0)));
    AssertFalse(pixel_drawn_at_point(testBitmap, point_at(150.0, 150.0)));
    close_window(testWindow);
    free_bitmap(testBitmap);
end;
procedure TIntegrationTests.TestOptionWithBitmapCellWithOptionsIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    testBitmap := load_bitmap("test_bitmap", "test_bitmap.png");
    bitmap_set_cell_details(testBitmap, 32, 32, 4, 4, 16);
    testOptions := option_with_bitmap_cell(5, option_defaults());
    draw_bitmap(testBitmap, 100.0, 100.0, testOptions);
    refresh_screen();
    AssertTrue(pixel_drawn_at_point(testBitmap, point_at(116.0, 116.0)));
    AssertFalse(pixel_drawn_at_point(testBitmap, point_at(150.0, 150.0)));
    free_bitmap(testBitmap);
    close_window(testWindow);
end;
procedure TIntegrationTests.TestDrawEllipseWithinRectangleIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    testRectangle := rectangle_from(100.0, 100.0, 200.0, 150.0);
    draw_ellipse(color_black(), testRectangle, option_defaults());
    refresh_screen();
    AssertTrue(point_in_circle(point_at(200.0, 175.0), circle_at(rectangle_center(testRectangle), testRectangle.width)));
    AssertFalse(point_in_circle(point_at(350.0, 175.0), circle_at(rectangle_center(testRectangle), testRectangle.width)));
    close_window(testWindow);
end;
procedure TIntegrationTests.TestDrawEllipseWithinRectangleWithOptionsIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    testRectangle := rectangle_from(100.0, 100.0, 200.0, 100.0);
    draw_ellipse(color_black(), testRectangle, option_defaults());
    refresh_screen();
    AssertTrue(point_in_circle(point_at(200.0, 150.0), circle_at(rectangle_center(testRectangle), testRectangle.width)));
    close_window(testWindow);
end;
procedure TIntegrationTests.TestDrawEllipseIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    draw_ellipse(color_black(), 400.0, 300.0, 100.0, 50.0);
    refresh_screen();
    AssertTrue(point_in_circle(point_at(400.0, 300.0), circle_at(400.0, 300.0, 50.0)));
    AssertFalse(point_in_circle(point_at(550.0, 300.0), circle_at(400.0, 300.0, 50.0)));
    close_window(testWindow);
end;
procedure TIntegrationTests.TestDrawEllipseWithOptionsIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    draw_ellipse(color_black(), 400.0, 300.0, 100.0, 50.0, option_defaults());
    refresh_screen();
    AssertTrue(point_in_circle(point_at(400.0, 300.0), circle_at(400.0, 300.0, 50.0)));
    close_window(testWindow);
end;
procedure TIntegrationTests.TestDrawEllipseOnBitmapWithinRectangleIntegration;
begin
    testBitmap := create_bitmap("test_bitmap", 200, 200);
    testRectangle := rectangle_from(50.0, 50.0, 100.0, 100.0);
    draw_ellipse_on_bitmap(testBitmap, color_black(), testRectangle);
    AssertTrue(pixel_drawn_at_point(testBitmap, point_at(100.0, 100.0)));
    AssertFalse(pixel_drawn_at_point(testBitmap, point_at(200.0, 200.0)));
    free_bitmap(testBitmap);
end;
procedure TIntegrationTests.TestDrawEllipseOnBitmapWithinRectangleWithOptionsIntegration;
begin
    testBitmap := create_bitmap("test_bitmap", 200, 200);
    testRect := rectangle_from(50.0, 50.0, 100.0, 100.0);
    draw_ellipse_on_bitmap(testBitmap, color_black(), testRect, option_defaults());
    AssertTrue(pixel_drawn_at_point(testBitmap, point_at(75.0, 75.0)));
    AssertFalse(pixel_drawn_at_point(testBitmap, point_at(0.0, 0.0)));
    free_bitmap(testBitmap);
end;
procedure TIntegrationTests.TestDrawEllipseOnBitmapIntegration;
begin
    testBitmap := create_bitmap("test_bitmap", 200, 200);
    testColor := color_black();
    draw_ellipse_on_bitmap(testBitmap, testColor, 100.0, 100.0, 50.0, 30.0);
    AssertTrue(pixel_drawn_at_point(testBitmap, 100.0, 100.0));
    AssertFalse(pixel_drawn_at_point(testBitmap, 160.0, 100.0));
    free_bitmap(testBitmap);
end;
procedure TIntegrationTests.TestDrawEllipseOnBitmapWithOptionsIntegration;
begin
    testBitmap := create_bitmap("test_bitmap", 200, 200);
    draw_ellipse_on_bitmap(testBitmap, color_black(), 100.0, 100.0, 50.0, 30.0, option_defaults());
    AssertTrue(pixel_drawn_at_point(testBitmap, point_at(100.0, 100.0)));
    AssertFalse(pixel_drawn_at_point(testBitmap, point_at(150.0, 100.0)));
    free_bitmap(testBitmap);
end;
procedure TIntegrationTests.TestDrawEllipseOnWindowWithinRectangleIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    testRectangle := rectangle_from(100.0, 100.0, 200.0, 100.0);
    draw_ellipse_on_window(testWindow, color_black(), testRectangle);
    refresh_screen();
    AssertTrue(point_in_circle(point_at(200.0, 150.0), circle_at(rectangle_center(testRectangle), testRectangle.width)));
    close_window(testWindow);
end;
procedure TIntegrationTests.TestDrawEllipseOnWindowWithinRectangleWithOptionsIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    testRect := rectangle_from(100.0, 100.0, 200.0, 100.0);
    draw_ellipse_on_window(testWindow, color_black(), testRect, option_defaults());
    refresh_screen();
    AssertTrue(point_in_circle(point_at(200.0, 150.0), circle_at(point_at(200.0, 150.0), 100.0)));
    close_window(testWindow);
end;
procedure TIntegrationTests.TestDrawEllipseOnWindowIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    draw_ellipse_on_window(testWindow, color_black(), 400.0, 300.0, 100.0, 50.0);
    refresh_screen();
    AssertTrue(point_in_circle(point_at(400.0, 300.0), circle_at(400.0, 300.0, 50.0)));
    close_window(testWindow);
end;
procedure TIntegrationTests.TestDrawEllipseOnWindowWithOptionsIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    draw_ellipse_on_window(testWindow, color_black(), 400.0, 300.0, 100.0, 50.0, option_defaults());
    refresh_screen();
    AssertTrue(point_in_circle(point_at(400.0, 300.0), circle_at(400.0, 300.0, 50.0)));
    close_window(testWindow);
end;
procedure TIntegrationTests.TestFillEllipseWithinRectangleIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    testRectangle := rectangle_from(100.0, 100.0, 200.0, 100.0);
    fill_ellipse(color_black(), testRectangle);
    refresh_screen();
    AssertTrue(point_in_circle(point_at(200.0, 150.0), circle_at(rectangle_center(testRectangle), testRectangle.width)));
    AssertFalse(point_in_circle(point_at(350.0, 150.0), circle_at(rectangle_center(testRectangle), testRectangle.width)));
    close_window(testWindow);
end;
procedure TIntegrationTests.TestFillEllipseWithinRectangleWithOptionsIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    testRectangle := rectangle_from(100.0, 100.0, 200.0, 100.0);
    fill_ellipse(color_black(), testRectangle, option_defaults());
    refresh_screen();
    AssertTrue(point_in_circle(point_at(200.0, 150.0), circle_at(rectangle_center(testRectangle), testRectangle.width)));
    close_window(testWindow);
end;
procedure TIntegrationTests.TestFillEllipseIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    fill_ellipse(color_black(), 400.0, 300.0, 100.0, 50.0);
    refresh_screen();
    AssertTrue(point_in_circle(point_at(400.0, 300.0), circle_at(400.0, 300.0, 50.0)));
    AssertFalse(point_in_circle(point_at(550.0, 300.0), circle_at(400.0, 300.0, 50.0)));
    close_window(testWindow);
end;
procedure TIntegrationTests.TestFillEllipseWithOptionsIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    fill_ellipse(color_black(), 400.0, 300.0, 100.0, 50.0, option_defaults());
    refresh_screen();
    AssertTrue(point_in_circle(point_at(400.0, 300.0), circle_at(400.0, 300.0, 50.0)));
    close_window(testWindow);
end;
procedure TIntegrationTests.TestFillEllipseOnBitmapWithinRectangleIntegration;
begin
    testBitmap := create_bitmap("test_bitmap", 200, 200);
    testRectangle := rectangle_from(50.0, 50.0, 100.0, 100.0);
    fill_ellipse_on_bitmap(testBitmap, color_black(), testRectangle);
    AssertTrue(pixel_drawn_at_point(testBitmap, point_at(100.0, 100.0)));
    AssertFalse(pixel_drawn_at_point(testBitmap, point_at(200.0, 200.0)));
    free_bitmap(testBitmap);
end;
procedure TIntegrationTests.TestFillEllipseOnBitmapWithinRectangleWithOptionsIntegration;
begin
    testBitmap := create_bitmap("test_bitmap", 200, 200);
    testRect := rectangle_from(50.0, 50.0, 100.0, 100.0);
    fill_ellipse_on_bitmap(testBitmap, color_black(), testRect, option_defaults());
    AssertTrue(pixel_drawn_at_point(testBitmap, point_at(100.0, 100.0)));
    AssertFalse(pixel_drawn_at_point(testBitmap, point_at(200.0, 100.0)));
    free_bitmap(testBitmap);
end;
procedure TIntegrationTests.TestFillEllipseOnBitmapIntegration;
begin
    testBitmap := create_bitmap("test_bitmap", 200, 200);
    fill_ellipse_on_bitmap(testBitmap, color_black(), 100.0, 100.0, 50.0, 30.0);
    AssertTrue(pixel_drawn_at_point(testBitmap, 100.0, 100.0));
    AssertTrue(pixel_drawn_at_point(testBitmap, 125.0, 100.0));
    AssertFalse(pixel_drawn_at_point(testBitmap, 150.0, 100.0));
    free_bitmap(testBitmap);
end;
procedure TIntegrationTests.TestFillEllipseOnBitmapWithOptionsIntegration;
begin
    testBitmap := create_bitmap("test_bitmap", 200, 200);
    fill_ellipse_on_bitmap(testBitmap, color_black(), 50.0, 50.0, 100.0, 50.0, option_defaults());
    AssertTrue(pixel_drawn_at_point(testBitmap, 50.0, 50.0));
    AssertFalse(pixel_drawn_at_point(testBitmap, 150.0, 50.0));
    free_bitmap(testBitmap);
end;
procedure TIntegrationTests.TestFillEllipseOnWindowWithinRectangleIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    testRectangle := rectangle_from(100.0, 100.0, 200.0, 150.0);
    fill_ellipse_on_window(testWindow, color_black(), testRectangle);
    refresh_screen();
    AssertTrue(point_in_circle(point_at(200.0, 175.0), circle_at(rectangle_center(testRectangle), testRectangle.width)));
    close_window(testWindow);
end;
procedure TIntegrationTests.TestFillEllipseOnWindowWithinRectangleWithOptionsIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    testRectangle := rectangle_from(100.0, 100.0, 200.0, 150.0);
    fill_ellipse_on_window(testWindow, color_black(), testRectangle, option_defaults());
    refresh_screen();
    AssertTrue(point_in_circle(point_at(200.0, 175.0), circle_at(200.0, 175.0, 100.0)));
    close_window(testWindow);
end;
procedure TIntegrationTests.TestFillEllipseOnWindowIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    fill_ellipse_on_window(testWindow, color_black(), 400.0, 300.0, 100.0, 50.0);
    refresh_screen();
    AssertTrue(point_in_circle(point_at(400.0, 300.0), circle_at(400.0, 300.0, 50.0)));
    close_window(testWindow);
end;
procedure TIntegrationTests.TestFillEllipseOnWindowWithOptionsIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    fill_ellipse_on_window(testWindow, color_black(), 400.0, 300.0, 100.0, 50.0, option_defaults());
    refresh_screen();
    AssertTrue(point_in_circle(point_at(400.0, 300.0), circle_at(400.0, 300.0, 50.0)));
    close_window(testWindow);
end;
procedure TIntegrationTests.TestClearScreenToWhiteIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    draw_pixel(color_black(), 100.0, 100.0);
    refresh_screen();
    AssertEquals(get_pixel(point_at(100.0, 100.0)), color_black());
    clear_screen();
    refresh_screen();
    AssertNotEquals(get_pixel(point_at(100.0, 100.0)), color_black());
    close_window(testWindow);
end;
procedure TIntegrationTests.TestClearScreenIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    draw_pixel(color_black(), 100.0, 100.0);
    refresh_screen();
    AssertEquals(get_pixel(point_at(400.0, 300.0)), color_black());
    clear_screen(color_white());
    refresh_screen();
    AssertNotEquals(get_pixel(point_at(400.0, 300.0)), color_black());
    close_window(testWindow);
end;
procedure TIntegrationTests.TestDisplayDetailsIntegration;
begin
    testNumberOfDisplays := number_of_displays();
if AssertTrue(testNumberOfDisplays > 0);
 then
        testDisplay := display_details(0);
        AssertNotNull(testDisplay);
        AssertTrue(display_width(testDisplay) > 0);
        AssertTrue(display_height(testDisplay) > 0);
end;
    else
        AssertEquals(testNumberOfDisplays, 0);
end;
end;
procedure TIntegrationTests.TestDisplayHeightIntegration;
begin
    testDisplay := display_details(0);
    testHeight := display_height(testDisplay);
    AssertTrue(testHeight > 0);
end;
procedure TIntegrationTests.TestDisplayNameIntegration;
begin
    testDisplay := display_details(0);
    testDisplayName := display_name(testDisplay);
    AssertNotNull(testDisplayName);
end;
procedure TIntegrationTests.TestDisplayWidthIntegration;
begin
    testDisplay := display_details(0);
    testWidth := display_width(testDisplay);
    AssertTrue(testWidth > 0);
end;
procedure TIntegrationTests.TestDisplayXIntegration;
begin
    testDisplay := display_details(0);
    testX := display_x(testDisplay);
    AssertTrue(testX > -1);
end;
procedure TIntegrationTests.TestDisplayYIntegration;
begin
    testDisplay := display_details(0);
    testY := display_y(testDisplay);
    AssertNotEquals(testY, -1);
end;
procedure TIntegrationTests.TestNumberOfDisplaysIntegration;
begin
    testDisplayCount := number_of_displays();
    AssertTrue(testDisplayCount > 0);
end;
procedure TIntegrationTests.TestRefreshScreenIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    draw_circle(color_black(), circle_at(400.0, 300.0, 50.0));
    refresh_screen();
    AssertTrue(point_in_circle(point_at(400.0, 300.0), circle_at(400.0, 300.0, 50.0)));
    close_window(testWindow);
end;
procedure TIntegrationTests.TestRefreshScreenWithTargetFpsIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    refresh_screen(60);
    AssertTrue(window_close_requested(testWindow));
    close_window(testWindow);
end;
procedure TIntegrationTests.TestSaveBitmapIntegration;
begin
    testBitmap := create_bitmap("test_bitmap", 100, 100);
    draw_pixel_on_bitmap(testBitmap, color_black(), 50, 50);
    save_bitmap(testBitmap, "test_save");
    free_bitmap(testBitmap);
end;
procedure TIntegrationTests.TestScreenHeightIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    testHeight := screen_height();
    AssertEquals(testHeight, 600);
    close_window(testWindow);
end;
procedure TIntegrationTests.TestScreenWidthIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    testWidth := screen_width();
    AssertEquals(testWidth, 800);
    close_window(testWindow);
end;
procedure TIntegrationTests.TestTakeScreenshotIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    draw_circle(color_black(), 400, 300, 50);
    refresh_screen();
    take_screenshot("screenshot_test");
    close_window(testWindow);
end;
procedure TIntegrationTests.TestTakeScreenshotOfWindowIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    draw_circle(color_black(), 400, 300, 50);
    refresh_screen();
    take_screenshot(testWindow, "screenshot_test");
    close_window(testWindow);
end;
procedure TIntegrationTests.TestBitmapBoundingCircleIntegration;
begin
    testBitmap := create_bitmap("test_bitmap", 100, 100);
    testPoint := point_at(50.0, 50.0);
    testCircle := bitmap_bounding_circle(testBitmap, testPoint);
    AssertEquals(circle_radius(testCircle), 50.0);
    AssertEquals(center_point(testCircle), testPoint);
    free_bitmap(testBitmap);
end;
procedure TIntegrationTests.TestBitmapBoundingRectangleIntegration;
begin
    testBitmap := create_bitmap("test_bitmap", 100, 100);
    testRectangle := bitmap_bounding_rectangle(testBitmap);
    AssertEquals(testRectangle.width, bitmap_width(testBitmap));
    AssertEquals(testRectangle.height, bitmap_height(testBitmap));
    free_bitmap(testBitmap);
end;
procedure TIntegrationTests.TestBitmapBoundingRectangleAtLocationIntegration;
begin
    testBitmap := create_bitmap("test_bitmap", 100, 100);
    testRectangle := bitmap_bounding_rectangle(testBitmap, 50.0, 50.0);
    AssertEquals(rectangle_left(testRectangle), 50.0);
    AssertEquals(rectangle_top(testRectangle), 50.0);
    AssertEquals(rectangle_right(testRectangle), 150.0);
    AssertEquals(rectangle_bottom(testRectangle), 150.0);
    free_bitmap(testBitmap);
end;
procedure TIntegrationTests.TestBitmapCellCenterIntegration;
begin
    testBitmap := create_bitmap("test_bitmap", 100, 100);
    testCenter := bitmap_cell_center(testBitmap);
    AssertEquals(testCenter.x, 50.0);
    AssertEquals(testCenter.y, 50.0);
    free_bitmap(testBitmap);
end;
procedure TIntegrationTests.TestBitmapCellCircleIntegration;
begin
    testBitmap := create_bitmap("test_bitmap", 100, 100);
    testCircle := bitmap_cell_circle(testBitmap, 50.0, 50.0);
    AssertEquals(circle_radius(testCircle), 50.0);
    AssertEquals(circle_x(testCircle), 50.0);
    AssertEquals(circle_y(testCircle), 50.0);
    free_bitmap(testBitmap);
end;
procedure TIntegrationTests.TestBitmapCellCircleAtPointIntegration;
begin
    testBitmap := create_bitmap("test_bitmap", 100, 100);
    bitmap_set_cell_details(testBitmap, 50, 50, 2, 2, 4);
    testCircle := bitmap_cell_circle(testBitmap, point_at(100, 100));
    AssertEquals(circle_x(testCircle), 125);
    AssertEquals(circle_y(testCircle), 125);
    AssertEquals(circle_radius(testCircle), 25);
    free_bitmap(testBitmap);
end;
procedure TIntegrationTests.TestBitmapCellCircleAtPointWithScaleIntegration;
begin
    testBitmap := create_bitmap("test_bitmap", 100, 100);
    bitmap_set_cell_details(testBitmap, 50, 50, 2, 2, 4);
    testCircle := bitmap_cell_circle(testBitmap, point_at(100.0, 100.0), 2.0);
    AssertEquals(circle_radius(testCircle), 50.0);
    free_bitmap(testBitmap);
end;
procedure TIntegrationTests.TestBitmapCellColumnsIntegration;
begin
    testBitmap := create_bitmap("test_bitmap", 100, 100);
    bitmap_set_cell_details(testBitmap, 20, 20, 5, 5, 25);
    AssertEquals(bitmap_cell_columns(testBitmap), 5);
    free_bitmap(testBitmap);
end;
procedure TIntegrationTests.TestBitmapCellCountIntegration;
begin
    testBitmap := create_bitmap("test_bitmap", 100, 100);
    bitmap_set_cell_details(testBitmap, 20, 20, 5, 5, 25);
    AssertEquals(bitmap_cell_count(testBitmap), 25);
    free_bitmap(testBitmap);
end;
procedure TIntegrationTests.TestBitmapCellHeightIntegration;
begin
    testBitmap := create_bitmap("test_bitmap", 100, 100);
    bitmap_set_cell_details(testBitmap, 20, 20, 5, 5, 25);
    AssertEquals(bitmap_cell_height(testBitmap), 20);
    free_bitmap(testBitmap);
end;
procedure TIntegrationTests.TestBitmapCellOffsetIntegration;
begin
    testBitmap := create_bitmap("test_bitmap", 100, 100);
    bitmap_set_cell_details(testBitmap, 25, 25, 4, 4, 16);
    testOffset := bitmap_cell_offset(testBitmap, 5);
    AssertEquals(testOffset.x, 75);
    AssertEquals(testOffset.y, 0);
    free_bitmap(testBitmap);
end;
procedure TIntegrationTests.TestBitmapCellRectangleIntegration;
begin
    testBitmap := create_bitmap("test_bitmap", 100, 100);
    bitmap_set_cell_details(testBitmap, 25, 25, 4, 4, 16);
    testRectangle := bitmap_cell_rectangle(testBitmap);
    AssertEquals(testRectangle.width, 25);
    AssertEquals(testRectangle.height, 25);
    free_bitmap(testBitmap);
end;
procedure TIntegrationTests.TestBitmapCellRectangleAtPointIntegration;
begin
    testBitmap := create_bitmap("test_bitmap", 100, 100);
    bitmap_set_cell_details(testBitmap, 25, 25, 4, 4, 16);
    testRectangle := bitmap_cell_rectangle(testBitmap, point_at(50.0, 50.0));
    AssertEquals(rectangle_left(testRectangle), 50.0);
    AssertEquals(rectangle_top(testRectangle), 50.0);
    AssertEquals(rectangle_right(testRectangle), 75.0);
    AssertEquals(rectangle_bottom(testRectangle), 75.0);
    free_bitmap(testBitmap);
end;
procedure TIntegrationTests.TestBitmapCellRowsIntegration;
begin
    testBitmap := create_bitmap("test_bitmap", 100, 100);
    bitmap_set_cell_details(testBitmap, 20, 20, 5, 5, 25);
    AssertEquals(bitmap_cell_rows(testBitmap), 5);
    free_bitmap(testBitmap);
end;
procedure TIntegrationTests.TestBitmapCellWidthIntegration;
begin
    testBitmap := create_bitmap("test_bitmap", 100, 100);
    bitmap_set_cell_details(testBitmap, 25, 25, 4, 4, 16);
    AssertEquals(bitmap_cell_width(testBitmap), 25);
    free_bitmap(testBitmap);
end;
procedure TIntegrationTests.TestBitmapCenterIntegration;
begin
    testBitmap := create_bitmap("test_bitmap", 100, 100);
    testCenter := bitmap_center(testBitmap);
    AssertEquals(testCenter.x, 50.0);
    AssertEquals(testCenter.y, 50.0);
    free_bitmap(testBitmap);
end;
procedure TIntegrationTests.TestBitmapFilenameIntegration;
begin
    testBitmap := create_bitmap("test_bitmap", 100, 100);
    testFilename := bitmap_filename(testBitmap);
    AssertEquals(testFilename, "");
    free_bitmap(testBitmap);
end;
procedure TIntegrationTests.TestBitmapHeightIntegration;
begin
    testBitmap := create_bitmap("test_bitmap", 100, 100);
    testHeight := bitmap_height(testBitmap);
    AssertEquals(testHeight, 100);
    free_bitmap(testBitmap);
end;
procedure TIntegrationTests.TestBitmapHeightOfBitmapNamedIntegration;
begin
    testBitmap := create_bitmap("test_bitmap", 100, 100);
    AssertEquals(bitmap_height("test_bitmap"), 100);
    free_bitmap(testBitmap);
end;
procedure TIntegrationTests.TestBitmapNameIntegration;
begin
    testBitmap := create_bitmap("test_bitmap", 100, 100);
    testBitmapName := bitmap_name(testBitmap);
    AssertEquals(testBitmapName, "test_bitmap");
    free_bitmap(testBitmap);
end;
procedure TIntegrationTests.TestBitmapNamedIntegration;
begin
    testBitmap := load_bitmap("test_bitmap", "test_bitmap.png");
    testNamedBitmap := bitmap_named("test_bitmap");
    AssertNotNull(testNamedBitmap);
    testNonexistentBitmap := bitmap_named("nonexistent_bitmap");
    AssertNull(testNonexistentBitmap);
    free_all_bitmaps();
end;
procedure TIntegrationTests.TestBitmapRectangleOfCellIntegration;
begin
    testBitmap := create_bitmap("test_bitmap", 100, 100);
    bitmap_set_cell_details(testBitmap, 25, 25, 4, 4, 16);
    testRectangle := bitmap_rectangle_of_cell(testBitmap, 5);
    AssertEquals(rectangle_left(testRectangle), 0);
    AssertEquals(rectangle_top(testRectangle), 75);
    AssertEquals(rectangle_right(testRectangle), 25);
    AssertEquals(rectangle_bottom(testRectangle), 100);
    free_bitmap(testBitmap);
end;
procedure TIntegrationTests.TestBitmapSetCellDetailsIntegration;
begin
    testBitmap := create_bitmap("test_bitmap", 100, 100);
    bitmap_set_cell_details(testBitmap, 20, 20, 5, 5, 25);
    AssertEquals(bitmap_cell_width(testBitmap), 20);
    AssertEquals(bitmap_cell_height(testBitmap), 20);
    AssertEquals(bitmap_cell_columns(testBitmap), 5);
    AssertEquals(bitmap_cell_rows(testBitmap), 5);
    AssertEquals(bitmap_cell_count(testBitmap), 25);
    free_bitmap(testBitmap);
end;
procedure TIntegrationTests.TestBitmapValidIntegration;
begin
    testBitmap := create_bitmap("test_bitmap", 100, 100);
    AssertTrue(bitmap_valid(testBitmap));
    free_bitmap(testBitmap);
    AssertFalse(bitmap_valid(testBitmap));
end;
procedure TIntegrationTests.TestBitmapWidthIntegration;
begin
    testBitmap := create_bitmap("test_bitmap", 100, 100);
    testWidth := bitmap_width(testBitmap);
    AssertEquals(testWidth, 100);
    free_bitmap(testBitmap);
end;
procedure TIntegrationTests.TestBitmapWidthOfBitmapNamedIntegration;
begin
    testBitmap := create_bitmap("test_bitmap", 100, 100);
    testWindow := open_window("Test Window", 800, 600);
    draw_bitmap(bitmap_named("test_bitmap"), 100, 100);
    refresh_screen();
    AssertEquals(bitmap_width("test_bitmap"), 100);
    free_bitmap(testBitmap);
    close_window(testWindow);
end;
procedure TIntegrationTests.TestClearBitmapIntegration;
begin
    testBitmap := create_bitmap("test_bitmap", 100, 100);
    draw_pixel_on_bitmap(testBitmap, color_black(), 50, 50);
    clear_bitmap(testBitmap, color_white());
    AssertFalse(pixel_drawn_at_point(testBitmap, 50, 50));
    free_bitmap(testBitmap);
end;
procedure TIntegrationTests.TestClearBitmapNamedIntegration;
begin
    testBitmap := create_bitmap("test_bitmap", 100, 100);
    testWindow := open_window("Test Window", 800, 600);
    draw_bitmap(testBitmap, 100.0, 100.0);
    refresh_screen();
    AssertTrue(pixel_drawn_at_point(testBitmap, 50.0, 50.0));
    clear_bitmap("test_bitmap", color_white());
    refresh_screen();
    AssertFalse(pixel_drawn_at_point(testBitmap, 50.0, 50.0));
    close_window(testWindow);
    free_bitmap(testBitmap);
end;
procedure TIntegrationTests.TestCreateBitmapIntegration;
begin
    testBitmap := create_bitmap("test_bitmap", 100, 100);
    AssertNotNull(testBitmap);
    AssertEquals(bitmap_width(testBitmap), 100);
    AssertEquals(bitmap_height(testBitmap), 100);
    free_bitmap(testBitmap);
end;
procedure TIntegrationTests.TestDrawBitmapIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    testBitmap := create_bitmap("test_bitmap", 100, 100);
    draw_bitmap(testBitmap, 100.0, 100.0);
    refresh_screen();
    AssertTrue(pixel_drawn_at_point(testBitmap, point_at(50.0, 50.0)));
    AssertFalse(pixel_drawn_at_point(testBitmap, point_at(bitmap_width(testBitmap), bitmap_height(testBitmap))));
    free_bitmap(testBitmap);
    close_window(testWindow);
end;
procedure TIntegrationTests.TestDrawBitmapWithOptionsIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    testBitmap := create_bitmap("test_bitmap", 100, 100);
    draw_bitmap(testBitmap, 100.0, 100.0, option_defaults());
    refresh_screen();
    AssertTrue(pixel_drawn_at_point(testBitmap, point_at(50.0, 50.0)));
    AssertFalse(pixel_drawn_at_point(testBitmap, point_at(150.0, 100.0)));
    free_bitmap(testBitmap);
    close_window(testWindow);
end;
procedure TIntegrationTests.TestDrawBitmapNamedIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    testBitmap := create_bitmap("test_bitmap", 100, 100);
    draw_bitmap("test_bitmap", 100.0, 100.0);
    refresh_screen();
    AssertTrue(pixel_drawn_at_point(bitmap_named("test_bitmap"), 50.0, 50.0));
    AssertFalse(pixel_drawn_at_point(bitmap_named("test_bitmap"), bitmap_width(bitmap_named("test_bitmap")), bitmap_height(bitmap_named("test_bitmap"))));
    free_all_bitmaps();
    close_window(testWindow);
end;
procedure TIntegrationTests.TestDrawBitmapNamedWithOptionsIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    testBitmap := create_bitmap("test_bitmap", 100, 100);
    draw_bitmap("test_bitmap", 100.0, 100.0, option_defaults());
    refresh_screen();
    AssertTrue(pixel_drawn_at_point(testBitmap, point_at(50.0, 50.0)));
    AssertFalse(pixel_drawn_at_point(testBitmap, point_at(150.0, 150.0)));
    free_bitmap(testBitmap);
    close_window(testWindow);
end;
procedure TIntegrationTests.TestDrawBitmapOnBitmapOnBitmapIntegration;
begin
    testDestination := create_bitmap("test_destination", 100, 100);
    testSource := create_bitmap("test_source", 50, 50);
    draw_bitmap_on_bitmap(testDestination, testSource, 25.0, 25.0);
    AssertTrue(pixel_drawn_at_point(testDestination, point_at(50.0, 50.0)));
    AssertFalse(pixel_drawn_at_point(testDestination, point_at(75.0, 75.0)));
    free_bitmap(testDestination);
    free_bitmap(testSource);
end;
procedure TIntegrationTests.TestDrawBitmapOnBitmapOnBitmapWithOptionsIntegration;
begin
    testDestination := create_bitmap("test_destination", 100, 100);
    testSource := create_bitmap("test_source", 50, 50);
    draw_pixel_on_bitmap(testSource, color_black(), point_at(25.0, 25.0));
    draw_bitmap_on_bitmap(testDestination, testSource, 25.0, 25.0, option_defaults());
    AssertTrue(pixel_drawn_at_point(testDestination, point_at(25.0, 25.0)));
    AssertFalse(pixel_drawn_at_point(testDestination, point_at(75.0, 75.0)));
    free_bitmap(testDestination);
    free_bitmap(testSource);
end;
procedure TIntegrationTests.TestDrawBitmapOnWindowIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    testBitmap := create_bitmap("test_bitmap", 100, 100);
    draw_bitmap_on_window(testWindow, testBitmap, 100.0, 100.0);
    refresh_screen();
    AssertTrue(pixel_drawn_at_point(testBitmap, point_at(50.0, 50.0)));
    AssertFalse(pixel_drawn_at_point(testBitmap, point_at(150.0, 150.0)));
    free_bitmap(testBitmap);
    close_window(testWindow);
end;
procedure TIntegrationTests.TestDrawBitmapOnWindowWithOptionsIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    testBitmap := create_bitmap("test_bitmap", 100, 100);
    draw_bitmap_on_window(testWindow, testBitmap, 100.0, 100.0, option_defaults());
    refresh_screen();
    AssertTrue(pixel_drawn_at_point(testBitmap, point_at(50.0, 50.0)));
    AssertFalse(pixel_drawn_at_point(testBitmap, point_at(150.0, 100.0)));
    free_bitmap(testBitmap);
    close_window(testWindow);
end;
procedure TIntegrationTests.TestFreeAllBitmapsIntegration;
begin
    testBitmap1 := create_bitmap("test_bitmap_1", 100, 100);
    testBitmap2 := create_bitmap("test_bitmap_2", 100, 100);
    free_all_bitmaps();
    AssertFalse(bitmap_valid(testBitmap1));
    AssertFalse(bitmap_valid(testBitmap2));
end;
procedure TIntegrationTests.TestFreeBitmapIntegration;
begin
    testBitmap := create_bitmap("test_bitmap", 100, 100);
    free_bitmap(testBitmap);
    AssertFalse(bitmap_valid(testBitmap));
end;
procedure TIntegrationTests.TestHasBitmapIntegration;
begin
    testBitmap := create_bitmap("test_bitmap", 100, 100);
    AssertTrue(has_bitmap("test_bitmap"));
    free_bitmap(testBitmap);
    AssertFalse(has_bitmap("test_bitmap"));
end;
procedure TIntegrationTests.TestLoadBitmapIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    testBitmap := load_bitmap("test_bitmap", "test_bitmap.png");
    draw_bitmap(testBitmap, 100.0, 100.0);
    refresh_screen();
    AssertTrue(pixel_drawn_at_point(testBitmap, point_at(100.0, 100.0)));
    AssertFalse(pixel_drawn_at_point(testBitmap, point_at(bitmap_width(testBitmap), bitmap_height(testBitmap))));
    free_bitmap(testBitmap);
    close_window(testWindow);
end;
procedure TIntegrationTests.TestPixelDrawnAtPointPtIntegration;
begin
    testBitmap := create_bitmap("test_bitmap", 100, 100);
    draw_pixel_on_bitmap(testBitmap, color_black(), point_at(50.0, 50.0));
    AssertTrue(pixel_drawn_at_point(testBitmap, point_at(50.0, 50.0)));
    AssertFalse(pixel_drawn_at_point(testBitmap, point_at(75.0, 75.0)));
    free_bitmap(testBitmap);
end;
procedure TIntegrationTests.TestPixelDrawnAtPointIntegration;
begin
    testBitmap := create_bitmap("test_bitmap", 100, 100);
    draw_pixel_on_bitmap(testBitmap, color_black(), 50.0, 50.0);
    AssertTrue(pixel_drawn_at_point(testBitmap, 50.0, 50.0));
    AssertFalse(pixel_drawn_at_point(testBitmap, 75.0, 75.0));
    free_bitmap(testBitmap);
end;
procedure TIntegrationTests.TestPixelDrawnAtPointInCellPtIntegration;
begin
    testBitmap := create_bitmap("test_bitmap", 100, 100);
    draw_pixel_on_bitmap(testBitmap, color_black(), point_at(50.0, 50.0));
    bitmap_set_cell_details(testBitmap, 100, 100, 1, 1, 1);
    AssertTrue(pixel_drawn_at_point(testBitmap, 0, point_at(50.0, 50.0)));
    AssertFalse(pixel_drawn_at_point(testBitmap, 0, point_at(75.0, 50.0)));
    free_bitmap(testBitmap);
end;
procedure TIntegrationTests.TestPixelDrawnAtPointInCellIntegration;
begin
    testBitmap := create_bitmap("test_bitmap", 100, 100);
    draw_pixel(color_black(), point_at(50.0, 50.0));
    testWindow := open_window("Test Window", 800, 600);
    draw_bitmap(testBitmap, 100.0, 100.0);
    refresh_screen();
    AssertTrue(pixel_drawn_at_point(testBitmap, 0, point_at(50.0, 50.0)));
    AssertFalse(pixel_drawn_at_point(testBitmap, 0, point_at(75.0, 75.0)));
    free_bitmap(testBitmap);
    close_window(testWindow);
end;
procedure TIntegrationTests.TestSetupCollisionMaskIntegration;
begin
    testBitmap := create_bitmap("test_bitmap", 100, 100);
    setup_collision_mask(testBitmap);
    testPixelDrawn := pixel_drawn_at_point(testBitmap, point_at(50, 50));
    AssertTrue(testPixelDrawn);
    free_bitmap(testBitmap);
end;
procedure TIntegrationTests.TestDrawLineRecordIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    testLine := line_from(point_at(100.0, 100.0), point_at(200.0, 200.0));
    draw_line(color_black(), testLine);
    refresh_screen();
    AssertEquals(get_pixel(point_at(100.0, 100.0)), color_black());
    AssertNotEquals(get_pixel(point_at(99.0, 99.0)), color_black());
    close_window(testWindow);
end;
procedure TIntegrationTests.TestDrawLineRecordWithOptionsIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    testLine := line_from(point_at(100.0, 100.0), point_at(200.0, 200.0));
    draw_line(color_black(), testLine, option_line_width(3, option_defaults()));
    refresh_screen();
    AssertEquals(get_pixel(point_at(100.0, 100.0)), color_black());
    AssertNotEquals(get_pixel(point_at(99.0, 99.0)), color_black());
    close_window(testWindow);
end;
procedure TIntegrationTests.TestDrawLinePointToPointIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    draw_line(color_black(), point_at(100.0, 100.0), point_at(200.0, 200.0));
    refresh_screen();
    AssertEquals(get_pixel(point_at(100.0, 100.0)), color_black());
    AssertNotEquals(get_pixel(point_at(99.0, 99.0)), color_black());
    close_window(testWindow);
end;
procedure TIntegrationTests.TestDrawLinePointToPointWithOptionsIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    draw_line(color_black(), point_at(100.0, 100.0), point_at(200.0, 200.0), option_defaults());
    refresh_screen();
    AssertEquals(get_pixel(point_at(100.0, 100.0)), color_black());
    AssertNotEquals(get_pixel(point_at(99.0, 99.0)), color_black());
    close_window(testWindow);
end;
procedure TIntegrationTests.TestDrawLineIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    draw_line(color_black(), 100.0, 100.0, 200.0, 200.0);
    refresh_screen();
    AssertEquals(get_pixel(point_at(100.0, 100.0)), color_black());
    AssertNotEquals(get_pixel(point_at(99.0, 99.0)), color_black());
    close_window(testWindow);
end;
procedure TIntegrationTests.TestDrawLineWithOptionsIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    draw_line(color_black(), 100.0, 100.0, 200.0, 200.0, option_defaults());
    refresh_screen();
    AssertEquals(get_pixel(point_at(100.0, 100.0)), color_black());
    AssertNotEquals(get_pixel(point_at(99.0, 99.0)), color_black());
    close_window(testWindow);
end;
procedure TIntegrationTests.TestDrawLineOnBitmapRecordIntegration;
begin
    testBitmap := create_bitmap("test_bitmap", 100, 100);
    testLine := line_from(point_at(10.0, 10.0), point_at(90.0, 90.0));
    draw_line_on_bitmap(testBitmap, color_black(), testLine);
    AssertTrue(pixel_drawn_at_point(testBitmap, point_at(50.0, 50.0)));
    AssertFalse(pixel_drawn_at_point(testBitmap, point_at(100.0, 100.0)));
    free_bitmap(testBitmap);
end;
procedure TIntegrationTests.TestDrawLineOnBitmapRecordWithOptionsIntegration;
begin
    testBitmap := create_bitmap("test_bitmap", 100, 100);
    testLine := line_from(point_at(10.0, 10.0), point_at(90.0, 90.0));
    draw_line_on_bitmap(testBitmap, color_black(), testLine, option_defaults());
    AssertTrue(pixel_drawn_at_point(testBitmap, point_at(50.0, 50.0)));
    AssertFalse(pixel_drawn_at_point(testBitmap, point_at(95.0, 50.0)));
    free_bitmap(testBitmap);
end;
procedure TIntegrationTests.TestDrawLineOnBitmapPointToPointIntegration;
begin
    testBitmap := create_bitmap("test_bitmap", 100, 100);
    draw_line_on_bitmap(testBitmap, color_black(), point_at(10.0, 10.0), point_at(90.0, 90.0));
    AssertTrue(pixel_drawn_at_point(testBitmap, 50.0, 50.0));
    AssertFalse(pixel_drawn_at_point(testBitmap, 0.0, 0.0));
    free_bitmap(testBitmap);
end;
procedure TIntegrationTests.TestDrawLineOnBitmapPointToPointWithOptionsIntegration;
begin
    testBitmap := create_bitmap("test_bitmap", 100, 100);
    testFromPt := point_at(10.0, 10.0);
    testToPt := point_at(90.0, 90.0);
    draw_line_on_bitmap(testBitmap, color_black(), testFromPt, testToPt, option_defaults());
    AssertTrue(pixel_drawn_at_point(testBitmap, 10.0, 10.0));
    AssertTrue(pixel_drawn_at_point(testBitmap, 90.0, 90.0));
    AssertFalse(pixel_drawn_at_point(testBitmap, 5.0, 5.0));
    free_bitmap(testBitmap);
end;
procedure TIntegrationTests.TestDrawLineOnBitmapIntegration;
begin
    testBitmap := create_bitmap("test_bitmap", 100, 100);
    testColor := color_black();
    draw_line_on_bitmap(testBitmap, testColor, 10.0, 10.0, 90.0, 90.0);
    AssertTrue(pixel_drawn_at_point(testBitmap, 50.0, 50.0));
    AssertFalse(pixel_drawn_at_point(testBitmap, 95.0, 50.0));
    free_bitmap(testBitmap);
end;
procedure TIntegrationTests.TestDrawLineOnBitmapWithOptionsIntegration;
begin
    testBitmap := create_bitmap("test_bitmap", 100, 100);
    draw_line_on_bitmap(testBitmap, color_black(), 10.0, 10.0, 90.0, 90.0, option_defaults());
    AssertTrue(pixel_drawn_at_point(testBitmap, point_at(50.0, 50.0)));
    AssertFalse(pixel_drawn_at_point(testBitmap, point_at(5.0, 5.0)));
    free_bitmap(testBitmap);
end;
procedure TIntegrationTests.TestDrawLineOnWindowRecordIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    testLine := line_from(point_at(100.0, 100.0), point_at(700.0, 500.0));
    draw_line_on_window(testWindow, color_black(), testLine);
    refresh_screen();
    AssertEquals(get_pixel(testWindow, point_at(100.0, 100.0)), color_black());
    AssertNotEquals(get_pixel(testWindow, point_at(99.0, 99.0)), color_black());
    close_window(testWindow);
end;
procedure TIntegrationTests.TestDrawLineOnWindowRecordWithOptionsIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    testLine := line_from(point_at(100.0, 100.0), point_at(200.0, 200.0));
    draw_line_on_window(testWindow, color_black(), testLine, option_defaults());
    refresh_screen();
    AssertEquals(get_pixel(testWindow, point_at(100.0, 100.0)), color_black());
    AssertNotEquals(get_pixel(testWindow, point_at(99.0, 99.0)), color_black());
    close_window(testWindow);
end;
procedure TIntegrationTests.TestDrawLineOnWindowPointToPointIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    draw_line_on_window(testWindow, color_black(), point_at(100.0, 100.0), point_at(200.0, 200.0));
    refresh_screen();
    AssertEquals(get_pixel(testWindow, 100.0, 100.0), color_black());
    AssertNotEquals(get_pixel(testWindow, 99.0, 99.0), color_black());
    close_window(testWindow);
end;
procedure TIntegrationTests.TestDrawLineOnWindowPointToPointWithOptionsIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    draw_line_on_window(testWindow, color_black(), point_at(100.0, 100.0), point_at(200.0, 200.0), option_defaults());
    refresh_screen();
    AssertEquals(get_pixel(testWindow, 100.0, 100.0), color_black());
    AssertNotEquals(get_pixel(testWindow, 99.0, 99.0), color_black());
    close_window(testWindow);
end;
procedure TIntegrationTests.TestDrawLineOnWindowIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    draw_line_on_window(testWindow, color_black(), 100.0, 100.0, 200.0, 200.0);
    refresh_screen();
    AssertEquals(get_pixel(testWindow, 100.0, 100.0), color_black());
    AssertNotEquals(get_pixel(testWindow, 99.0, 99.0), color_black());
    close_window(testWindow);
end;
procedure TIntegrationTests.TestDrawLineOnWindowWithOptionsIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    draw_line_on_window(testWindow, color_black(), 100.0, 100.0, 200.0, 200.0, option_defaults());
    refresh_screen();
    AssertEquals(get_pixel(testWindow, 100.0, 100.0), color_black());
    AssertNotEquals(get_pixel(testWindow, 99.0, 99.0), color_black());
    close_window(testWindow);
end;
procedure TIntegrationTests.TestDrawPixelAtPointIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    draw_pixel(color_black(), point_at(100.0, 100.0));
    refresh_screen();
    AssertEquals(get_pixel(point_at(100.0, 100.0)), color_black());
    AssertNotEquals(get_pixel(point_at(99.0, 99.0)), color_black());
    close_window(testWindow);
end;
procedure TIntegrationTests.TestDrawPixelAtPointWithOptionsIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    draw_pixel(color_black(), point_at(100.0, 100.0), option_defaults());
    refresh_screen();
    AssertEquals(get_pixel(point_at(100.0, 100.0)), color_black());
    AssertEquals(get_pixel(point_at(100.0, 100.0)), color_black());
    AssertNotEquals(get_pixel(point_at(99.0, 99.0)), color_black());
    close_window(testWindow);
end;
procedure TIntegrationTests.TestDrawPixelIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    draw_pixel(color_black(), 100.0, 100.0);
    refresh_screen();
    AssertEquals(get_pixel(point_at(100.0, 100.0)), color_black());
    AssertNotEquals(get_pixel(point_at(99.0, 99.0)), color_black());
    close_window(testWindow);
end;
procedure TIntegrationTests.TestDrawPixelWithOptionsIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    draw_pixel(color_black(), 100.0, 100.0, option_defaults());
    refresh_screen();
    AssertEquals(get_pixel(point_at(100.0, 100.0)), color_black());
    AssertNotEquals(get_pixel(point_at(99.0, 99.0)), color_black());
    close_window(testWindow);
end;
procedure TIntegrationTests.TestDrawPixelOnBitmapAtPointIntegration;
begin
    testBitmap := create_bitmap("test_bitmap", 100, 100);
    testColor := color_black();
    testPoint := point_at(50.0, 50.0);
    draw_pixel_on_bitmap(testBitmap, testColor, testPoint);
    AssertTrue(pixel_drawn_at_point(testBitmap, testPoint));
    AssertFalse(pixel_drawn_at_point(testBitmap, point_at(0.0, 0.0)));
    free_bitmap(testBitmap);
end;
procedure TIntegrationTests.TestDrawPixelOnBitmapAtPointWithOptionsIntegration;
begin
    testBitmap := create_bitmap("test_bitmap", 100, 100);
    testColor := color_black();
    testPoint := point_at(50.0, 50.0);
    draw_pixel_on_bitmap(testBitmap, testColor, testPoint, option_defaults());
    AssertTrue(pixel_drawn_at_point(testBitmap, testPoint));
    AssertFalse(pixel_drawn_at_point(testBitmap, point_at(0.0, 0.0)));
    free_bitmap(testBitmap);
end;
procedure TIntegrationTests.TestDrawPixelOnBitmapIntegration;
begin
    testBitmap := create_bitmap("test_bitmap", 100, 100);
    testColor := color_black();
    draw_pixel_on_bitmap(testBitmap, testColor, 50.0, 50.0);
    AssertTrue(pixel_drawn_at_point(testBitmap, 50.0, 50.0));
    AssertFalse(pixel_drawn_at_point(testBitmap, 51.0, 50.0));
    free_bitmap(testBitmap);
end;
procedure TIntegrationTests.TestDrawPixelOnBitmapWithOptionsIntegration;
begin
    testBitmap := create_bitmap("test_bitmap", 100, 100);
    testColor := color_black();
    draw_pixel_on_bitmap(testBitmap, testColor, 50.0, 50.0, option_defaults());
    AssertTrue(pixel_drawn_at_point(testBitmap, 50.0, 50.0));
    AssertFalse(pixel_drawn_at_point(testBitmap, 51.0, 50.0));
    free_bitmap(testBitmap);
end;
procedure TIntegrationTests.TestDrawPixelOnWindowAtPointIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    testColor := color_black();
    testPoint := point_at(100.0, 100.0);
    draw_pixel_on_window(testWindow, testColor, testPoint);
    refresh_screen();
    AssertEquals(get_pixel(point_at(100.0, 100.0)), color_black());
    AssertNotEquals(get_pixel(point_at(99.0, 99.0)), color_black());
    close_window(testWindow);
end;
procedure TIntegrationTests.TestDrawPixelOnWindowAtPointWithOptionsIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    testPoint := point_at(100.0, 100.0);
    draw_pixel_on_window(testWindow, color_black(), testPoint, option_defaults());
    refresh_screen();
    AssertEquals(get_pixel(point_at(100.0, 100.0)), color_black());
    AssertNotEquals(get_pixel(point_at(99.0, 99.0)), color_black());
    close_window(testWindow);
end;
procedure TIntegrationTests.TestDrawPixelOnWindowIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    draw_pixel_on_window(testWindow, color_black(), 100.0, 100.0);
    refresh_screen();
    AssertEquals(get_pixel(point_at(100.0, 100.0)), color_black());
    AssertNotEquals(get_pixel(point_at(99.0, 99.0)), color_black());
    close_window(testWindow);
end;
procedure TIntegrationTests.TestDrawPixelOnWindowWithOptionsIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    draw_pixel_on_window(testWindow, color_black(), 100.0, 100.0, option_defaults());
    refresh_screen();
    AssertEquals(get_pixel(point_at(100.0, 100.0)), color_black());
    AssertNotEquals(get_pixel(point_at(99.0, 99.0)), color_black());
    close_window(testWindow);
end;
procedure TIntegrationTests.TestGetPixelFromBitmapAtPointIntegration;
begin
    testBitmap := create_bitmap("test_bitmap", 100, 100);
    draw_pixel_on_bitmap(testBitmap, color_black(), point_at(50.0, 50.0));
    testColor := get_pixel(testBitmap, point_at(50.0, 50.0));
    AssertEquals(color_black(), testColor);
    free_bitmap(testBitmap);
end;
procedure TIntegrationTests.TestGetPixelFromBitmapIntegration;
begin
    testBitmap := create_bitmap("test_bitmap", 100, 100);
    draw_pixel_on_bitmap(testBitmap, color_black(), 50.0, 50.0);
    testPixelColor := get_pixel(testBitmap, 50.0, 50.0);
    AssertEquals(testPixelColor, color_black());
    free_bitmap(testBitmap);
end;
procedure TIntegrationTests.TestGetPixelAtPointIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    draw_pixel(color_black(), point_at(100.0, 100.0));
    refresh_screen();
    AssertEquals(get_pixel(point_at(100.0, 100.0)), color_black());
    close_window(testWindow);
end;
procedure TIntegrationTests.TestGetPixelIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    draw_pixel(color_black(), 100.0, 100.0);
    refresh_screen();
    AssertEquals(get_pixel(100.0, 100.0), color_black());
    close_window(testWindow);
end;
procedure TIntegrationTests.TestGetPixelFromWindowAtPointIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    draw_pixel(color_black(), point_at(100.0, 100.0));
    refresh_screen();
    AssertEquals(get_pixel(testWindow, point_at(100.0, 100.0)), color_black());
    close_window(testWindow);
end;
procedure TIntegrationTests.TestGetPixelFromWindowIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    draw_pixel(color_black(), 100.0, 100.0);
    refresh_screen();
    AssertEquals(get_pixel(testWindow, 100.0, 100.0), color_black());
    close_window(testWindow);
end;
procedure TIntegrationTests.TestGetPixelFromWindowAtPointFromWindowIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    draw_pixel(color_black(), point_at(100.0, 100.0));
    refresh_screen();
    testPixel := get_pixel_from_window(testWindow, point_at(100.0, 100.0));
    AssertEquals(color_black(), testPixel);
    close_window(testWindow);
end;
procedure TIntegrationTests.TestGetPixelFromWindowFromWindowIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    draw_pixel(color_black(), 100.0, 100.0);
    refresh_screen();
    testPixelColor := get_pixel(testWindow, 100.0, 100.0);
    AssertEquals(color_black(), testPixelColor);
    close_window(testWindow);
end;
procedure TIntegrationTests.TestDrawQuadIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    testQuad := quad_from(point_at(100.0, 100.0), point_at(200.0, 100.0), point_at(100.0, 200.0), point_at(200.0, 200.0));
    draw_quad(color_black(), testQuad);
    refresh_screen();
    AssertTrue(point_in_quad(point_at(150.0, 150.0), testQuad));
    AssertFalse(point_in_quad(point_at(250.0, 250.0), testQuad));
    close_window(testWindow);
end;
procedure TIntegrationTests.TestDrawQuadWithOptionsIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    testQuad := quad_from(point_at(100.0, 100.0), point_at(200.0, 100.0), point_at(100.0, 200.0), point_at(200.0, 200.0));
    draw_quad(color_black(), testQuad, option_defaults());
    refresh_screen();
    AssertTrue(point_in_quad(point_at(150.0, 150.0), testQuad));
    close_window(testWindow);
end;
procedure TIntegrationTests.TestDrawQuadOnBitmapIntegration;
begin
    testBitmap := create_bitmap("test_bitmap", 100, 100);
    testQuad := quad_from(point_at(10.0, 10.0), point_at(90.0, 10.0), point_at(10.0, 90.0), point_at(90.0, 90.0));
    draw_quad_on_bitmap(testBitmap, color_black(), testQuad);
    AssertTrue(pixel_drawn_at_point(testBitmap, point_at(50.0, 50.0)));
    AssertFalse(pixel_drawn_at_point(testBitmap, point_at(100.0, 100.0)));
    free_bitmap(testBitmap);
end;
procedure TIntegrationTests.TestDrawQuadOnBitmapWithOptionsIntegration;
begin
    testBitmap := create_bitmap("test_bitmap", 100, 100);
    testQuad := quad_from(point_at(10.0, 10.0), point_at(90.0, 10.0), point_at(90.0, 90.0), point_at(10.0, 90.0));
    draw_quad_on_bitmap(testBitmap, color_black(), testQuad, option_defaults());
    AssertTrue(pixel_drawn_at_point(testBitmap, point_at(50.0, 50.0)));
    AssertFalse(pixel_drawn_at_point(testBitmap, point_at(101.0, 50.0)));
    free_bitmap(testBitmap);
end;
procedure TIntegrationTests.TestDrawQuadOnWindowIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    testQuad := quad_from(point_at(100.0, 100.0), point_at(200.0, 100.0), point_at(100.0, 200.0), point_at(200.0, 200.0));
    draw_quad_on_window(testWindow, color_black(), testQuad);
    refresh_screen();
    AssertTrue(point_in_quad(point_at(150.0, 150.0), testQuad));
    close_window(testWindow);
end;
procedure TIntegrationTests.TestDrawQuadOnWindowWithOptionsIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    testQuad := quad_from(point_at(100.0, 100.0), point_at(200.0, 100.0), point_at(100.0, 200.0), point_at(200.0, 200.0));
    draw_quad_on_window(testWindow, color_black(), testQuad, option_defaults());
    refresh_screen();
    AssertTrue(point_in_quad(point_at(150.0, 150.0), testQuad));
    close_window(testWindow);
end;
procedure TIntegrationTests.TestDrawRectangleRecordIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    testRectangle := rectangle_from(100.0, 100.0, 200.0, 150.0);
    draw_rectangle(color_black(), testRectangle);
    refresh_screen();
    AssertTrue(point_in_rectangle(point_at(150.0, 125.0), testRectangle));
    AssertFalse(point_in_rectangle(point_at(301.0, 251.0), testRectangle));
    close_window(testWindow);
end;
procedure TIntegrationTests.TestDrawRectangleRecordWithOptionsIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    testRectangle := rectangle_from(100.0, 100.0, 200.0, 150.0);
    draw_rectangle(color_black(), testRectangle, option_defaults());
    refresh_screen();
    AssertTrue(point_in_rectangle(point_at(150.0, 125.0), testRectangle));
    AssertFalse(point_in_rectangle(point_at(350.0, 300.0), testRectangle));
    close_window(testWindow);
end;
procedure TIntegrationTests.TestDrawRectangleIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    draw_rectangle(color_black(), 100.0, 100.0, 200.0, 150.0);
    refresh_screen();
    AssertTrue(point_in_rectangle(point_at(150.0, 125.0), rectangle_from(100.0, 100.0, 200.0, 150.0)));
    AssertFalse(point_in_rectangle(point_at(301.0, 251.0), rectangle_from(100.0, 100.0, 200.0, 150.0)));
    close_window(testWindow);
end;
procedure TIntegrationTests.TestDrawRectangleWithOptionsIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    draw_rectangle(color_black(), 100.0, 100.0, 200.0, 150.0, option_line_width(3, option_defaults()));
    refresh_screen();
    AssertTrue(point_in_rectangle(point_at(150.0, 125.0), rectangle_from(100.0, 100.0, 200.0, 150.0)));
    AssertFalse(point_in_rectangle(point_at(301.0, 251.0), rectangle_from(100.0, 100.0, 200.0, 150.0)));
    close_window(testWindow);
end;
procedure TIntegrationTests.TestDrawRectangleOnBitmapRecordIntegration;
begin
    testBitmap := create_bitmap("test_bitmap", 100, 100);
    testRectangle := rectangle_from(50.0, 50.0, 20.0, 30.0);
    draw_rectangle_on_bitmap(testBitmap, color_black(), testRectangle);
    AssertTrue(pixel_drawn_at_point(testBitmap, point_at(50.0, 50.0)));
    AssertFalse(pixel_drawn_at_point(testBitmap, point_at(80.0, 90.0)));
    free_bitmap(testBitmap);
end;
procedure TIntegrationTests.TestDrawRectangleOnBitmapRecordWithOptionsIntegration;
begin
    testBitmap := create_bitmap("test_bitmap", 100, 100);
    testRectangle := rectangle_from(50.0, 50.0, 20.0, 20.0);
    draw_rectangle_on_bitmap(testBitmap, color_black(), testRectangle, option_defaults());
    AssertTrue(pixel_drawn_at_point(testBitmap, point_at(50.0, 50.0)));
    AssertFalse(pixel_drawn_at_point(testBitmap, point_at(75.0, 75.0)));
    free_bitmap(testBitmap);
end;
procedure TIntegrationTests.TestDrawRectangleOnBitmapIntegration;
begin
    testBitmap := create_bitmap("test_bitmap", 100, 100);
    draw_rectangle_on_bitmap(testBitmap, color_black(), 50.0, 50.0, 20.0, 20.0);
    AssertTrue(pixel_drawn_at_point(testBitmap, 50.0, 50.0));
    AssertFalse(pixel_drawn_at_point(testBitmap, 75.0, 75.0));
    free_bitmap(testBitmap);
end;
procedure TIntegrationTests.TestDrawRectangleOnBitmapWithOptionsIntegration;
begin
    testBitmap := create_bitmap("test_bitmap", 100, 100);
    draw_rectangle_on_bitmap(testBitmap, color_black(), 50.0, 50.0, 20.0, 20.0, option_defaults());
    AssertTrue(pixel_drawn_at_point(testBitmap, 50.0, 50.0));
    AssertFalse(pixel_drawn_at_point(testBitmap, 75.0, 75.0));
    free_bitmap(testBitmap);
end;
procedure TIntegrationTests.TestDrawRectangleOnWindowRecordIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    testRectangle := rectangle_from(100.0, 100.0, 50.0, 50.0);
    draw_rectangle_on_window(testWindow, color_black(), testRectangle);
    refresh_screen();
    AssertTrue(point_in_rectangle(point_at(125.0, 125.0), testRectangle));
    AssertFalse(point_in_rectangle(point_at(200.0, 200.0), testRectangle));
    close_window(testWindow);
end;
procedure TIntegrationTests.TestDrawRectangleOnWindowRecordWithOptionsIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    testRectangle := rectangle_from(100.0, 100.0, 50.0, 50.0);
    draw_rectangle_on_window(testWindow, color_black(), testRectangle, option_defaults());
    refresh_screen();
    AssertTrue(point_in_rectangle(point_at(125.0, 125.0), testRectangle));
    AssertFalse(point_in_rectangle(point_at(175.0, 175.0), testRectangle));
    close_window(testWindow);
end;
procedure TIntegrationTests.TestDrawRectangleOnWindowIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    draw_rectangle_on_window(testWindow, color_black(), 100.0, 100.0, 50.0, 50.0);
    refresh_screen();
    AssertTrue(point_in_rectangle(point_at(100.0, 100.0), rectangle_from(100.0, 100.0, 50.0, 50.0)));
    AssertFalse(point_in_rectangle(point_at(200.0, 200.0), rectangle_from(100.0, 100.0, 50.0, 50.0)));
    close_window(testWindow);
end;
procedure TIntegrationTests.TestDrawRectangleOnWindowWithOptionsIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    testRectangle := rectangle_from(100.0, 100.0, 50.0, 50.0);
    draw_rectangle_on_window(testWindow, color_black(), testRectangle, option_defaults());
    refresh_screen();
    AssertTrue(point_in_rectangle(point_at(125.0, 125.0), testRectangle));
    AssertFalse(point_in_rectangle(point_at(200.0, 200.0), testRectangle));
    close_window(testWindow);
end;
procedure TIntegrationTests.TestFillQuadIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    testQuad := quad_from(point_at(100.0, 100.0), point_at(300.0, 100.0), point_at(100.0, 300.0), point_at(300.0, 300.0));
    fill_quad(color_black(), testQuad);
    refresh_screen();
    AssertTrue(point_in_quad(point_at(200.0, 200.0), testQuad));
    AssertFalse(point_in_quad(point_at(400.0, 400.0), testQuad));
    close_window(testWindow);
end;
procedure TIntegrationTests.TestFillQuadWithOptionsIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    testQuad := quad_from(point_at(100.0, 100.0), point_at(300.0, 100.0), point_at(100.0, 300.0), point_at(300.0, 300.0));
    fill_quad(color_black(), testQuad, option_defaults());
    refresh_screen();
    AssertTrue(point_in_quad(point_at(200.0, 200.0), testQuad));
    AssertFalse(point_in_quad(point_at(400.0, 400.0), testQuad));
    close_window(testWindow);
end;
procedure TIntegrationTests.TestFillQuadOnBitmapIntegration;
begin
    testBitmap := create_bitmap("test_bitmap", 100, 100);
    testQuad := quad_from(point_at(10.0, 10.0), point_at(90.0, 10.0), point_at(10.0, 90.0), point_at(90.0, 90.0));
    fill_quad_on_bitmap(testBitmap, color_black(), testQuad);
    AssertTrue(pixel_drawn_at_point(testBitmap, point_at(50.0, 50.0)));
    AssertFalse(pixel_drawn_at_point(testBitmap, point_at(0.0, 0.0)));
    free_bitmap(testBitmap);
end;
procedure TIntegrationTests.TestFillQuadOnBitmapWithOptionsIntegration;
begin
    testBitmap := create_bitmap("test_bitmap", 100, 100);
    testQuad := quad_from(point_at(10.0, 10.0), point_at(90.0, 10.0), point_at(90.0, 90.0), point_at(10.0, 90.0));
    fill_quad_on_bitmap(testBitmap, color_black(), testQuad, option_defaults());
    AssertTrue(pixel_drawn_at_point(testBitmap, point_at(50.0, 50.0)));
    AssertFalse(pixel_drawn_at_point(testBitmap, point_at(101.0, 50.0)));
    free_bitmap(testBitmap);
end;
procedure TIntegrationTests.TestFillQuadOnWindowIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    testQuad := quad_from(point_at(100.0, 100.0), point_at(200.0, 100.0), point_at(100.0, 200.0), point_at(200.0, 200.0));
    fill_quad_on_window(testWindow, color_black(), testQuad);
    refresh_screen();
    AssertTrue(point_in_quad(point_at(150.0, 150.0), testQuad));
    close_window(testWindow);
end;
procedure TIntegrationTests.TestFillQuadOnWindowWithOptionsIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    testQuad := quad_from(point_at(100.0, 100.0), point_at(200.0, 100.0), point_at(200.0, 200.0), point_at(100.0, 200.0));
    fill_quad_on_window(testWindow, color_black(), testQuad, option_defaults());
    refresh_screen();
    AssertTrue(point_in_quad(point_at(150.0, 150.0), testQuad));
    AssertFalse(point_in_quad(point_at(250.0, 150.0), testQuad));
    close_window(testWindow);
end;
procedure TIntegrationTests.TestFillRectangleRecordIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    testRectangle := rectangle_from(100.0, 100.0, 200.0, 150.0);
    fill_rectangle(color_black(), testRectangle);
    refresh_screen();
    AssertTrue(point_in_rectangle(point_at(150.0, 125.0), testRectangle));
    AssertFalse(point_in_rectangle(point_at(350.0, 275.0), testRectangle));
    close_window(testWindow);
end;
procedure TIntegrationTests.TestFillRectangleRecordWithOptionsIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    testRectangle := rectangle_from(100.0, 100.0, 200.0, 150.0);
    fill_rectangle(color_black(), testRectangle, option_defaults());
    refresh_screen();
    AssertTrue(point_in_rectangle(point_at(150.0, 125.0), testRectangle));
    AssertFalse(point_in_rectangle(point_at(350.0, 275.0), testRectangle));
    close_window(testWindow);
end;
procedure TIntegrationTests.TestFillRectangleIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    fill_rectangle(color_black(), 100.0, 100.0, 200.0, 150.0);
    refresh_screen();
    AssertTrue(point_in_rectangle(point_at(150.0, 125.0), rectangle_from(100.0, 100.0, 200.0, 150.0)));
    AssertFalse(point_in_rectangle(point_at(301.0, 251.0), rectangle_from(100.0, 100.0, 200.0, 150.0)));
    close_window(testWindow);
end;
procedure TIntegrationTests.TestFillRectangleWithOptionsIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    fill_rectangle(color_black(), 100.0, 100.0, 200.0, 150.0, option_defaults());
    refresh_screen();
    AssertTrue(point_in_rectangle(point_at(150.0, 125.0), rectangle_from(100.0, 100.0, 200.0, 150.0)));
    AssertFalse(point_in_rectangle(point_at(301.0, 251.0), rectangle_from(100.0, 100.0, 200.0, 150.0)));
    close_window(testWindow);
end;
procedure TIntegrationTests.TestFillRectangleOnBitmapRecordIntegration;
begin
    testBitmap := create_bitmap("test_bitmap", 100, 100);
    testRectangle := rectangle_from(25.0, 25.0, 50.0, 50.0);
    fill_rectangle_on_bitmap(testBitmap, color_black(), testRectangle);
    AssertTrue(pixel_drawn_at_point(testBitmap, point_at(50.0, 50.0)));
    AssertFalse(pixel_drawn_at_point(testBitmap, point_at(10.0, 10.0)));
    free_bitmap(testBitmap);
end;
procedure TIntegrationTests.TestFillRectangleOnBitmapRecordWithOptionsIntegration;
begin
    testBitmap := create_bitmap("test_bitmap", 100, 100);
    testRectangle := rectangle_from(25.0, 25.0, 50.0, 50.0);
    fill_rectangle_on_bitmap(testBitmap, color_black(), testRectangle, option_defaults());
    AssertTrue(pixel_drawn_at_point(testBitmap, point_at(50.0, 50.0)));
    AssertFalse(pixel_drawn_at_point(testBitmap, point_at(10.0, 10.0)));
    free_bitmap(testBitmap);
end;
procedure TIntegrationTests.TestFillRectangleOnBitmapIntegration;
begin
    testBitmap := create_bitmap("test_bitmap", 100, 100);
    fill_rectangle_on_bitmap(testBitmap, color_black(), 25.0, 25.0, 50.0, 50.0);
    AssertTrue(pixel_drawn_at_point(testBitmap, 50.0, 50.0));
    AssertFalse(pixel_drawn_at_point(testBitmap, 75.0, 75.0));
    free_bitmap(testBitmap);
end;
procedure TIntegrationTests.TestFillRectangleOnBitmapWithOptionsIntegration;
begin
    testBitmap := create_bitmap("test_bitmap", 100, 100);
    fill_rectangle_on_bitmap(testBitmap, color_black(), 25.0, 25.0, 50.0, 50.0, option_defaults());
    AssertTrue(pixel_drawn_at_point(testBitmap, point_at(50.0, 50.0)));
    AssertFalse(pixel_drawn_at_point(testBitmap, point_at(10.0, 10.0)));
    free_bitmap(testBitmap);
end;
procedure TIntegrationTests.TestFillRectangleOnWindowRecordIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    testRectangle := rectangle_from(100.0, 100.0, 200.0, 150.0);
    fill_rectangle_on_window(testWindow, color_black(), testRectangle);
    refresh_screen();
    AssertTrue(point_in_rectangle(point_at(150.0, 125.0), testRectangle));
    AssertFalse(point_in_rectangle(point_at(350.0, 275.0), testRectangle));
    close_window(testWindow);
end;
procedure TIntegrationTests.TestFillRectangleOnWindowRecordWithOptionsIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    testRectangle := rectangle_from(100.0, 100.0, 200.0, 150.0);
    fill_rectangle_on_window(testWindow, color_black(), testRectangle, option_defaults());
    refresh_screen();
    AssertTrue(point_in_rectangle(point_at(150.0, 125.0), testRectangle));
    AssertFalse(point_in_rectangle(point_at(350.0, 275.0), testRectangle));
    close_window(testWindow);
end;
procedure TIntegrationTests.TestFillRectangleOnWindowIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    fill_rectangle_on_window(testWindow, color_black(), 100.0, 100.0, 50.0, 50.0);
    refresh_screen();
    AssertTrue(point_in_rectangle(point_at(125.0, 125.0), rectangle_from(100.0, 100.0, 50.0, 50.0)));
    AssertFalse(point_in_rectangle(point_at(175.0, 175.0), rectangle_from(100.0, 100.0, 50.0, 50.0)));
    close_window(testWindow);
end;
procedure TIntegrationTests.TestFillRectangleOnWindowWithOptionsIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    fill_rectangle_on_window(testWindow, color_black(), 100.0, 100.0, 50.0, 50.0, option_defaults());
    refresh_screen();
    AssertTrue(point_in_rectangle(point_at(125.0, 125.0), rectangle_from(100.0, 100.0, 50.0, 50.0)));
    AssertFalse(point_in_rectangle(point_at(175.0, 175.0), rectangle_from(100.0, 100.0, 50.0, 50.0)));
    close_window(testWindow);
end;
procedure TIntegrationTests.TestDrawTextFontAsStringIntegration;
begin
    testWindow := open_window("Text Drawing Test", 800, 600);
    draw_text("Hello, World!", color_black(), "hara", 24, 100.0, 100.0);
    refresh_screen();
    testRectangle := rectangle_from(100.0, 100.0, text_width("Hello, World!", get_system_font(), 12), text_height("Hello, World!", get_system_font(), 12));
    AssertTrue(point_in_rectangle(point_at(100.0, 100.0), testRectangle));
    close_window(testWindow);
end;
procedure TIntegrationTests.TestDrawTextWithOptionsFontAsStringIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    draw_text("Hello, World!", color_black(), "leaguegothic", 24, 100.0, 100.0, option_defaults());
    refresh_screen();
    testRectangle := rectangle_from(100.0, 100.0, text_width("Hello, World!", get_system_font(), 12), text_height("Hello, World!", get_system_font(), 12));
    AssertTrue(point_in_rectangle(point_at(100.0, 100.0), testRectangle));
    close_window(testWindow);
end;
procedure TIntegrationTests.TestDrawTextNoFontNoSizeIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    draw_text("Hello, World!", color_black(), 100.0, 100.0);
    refresh_screen();
    testRectangle := rectangle_from(100.0, 100.0, text_width("Hello, World!", get_system_font(), 12), text_height("Hello, World!", get_system_font(), 12));
    AssertTrue(point_in_rectangle(point_at(100.0, 100.0), testRectangle));
    close_window(testWindow);
end;
procedure TIntegrationTests.TestDrawTextNoFontNoSizeWithOptionsIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    draw_text("Hello, World!", color_black(), 100.0, 100.0, option_defaults());
    refresh_screen();
    testRectangle := rectangle_from(100.0, 100.0, text_width("Hello, World!", get_system_font(), 12), text_height("Hello, World!", get_system_font(), 12));
    AssertTrue(point_in_rectangle(point_at(100.0, 100.0), testRectangle));
    close_window(testWindow);
end;
procedure TIntegrationTests.TestDrawTextIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    draw_text("Hello, World!", color_black(), font_named("hara"), 24, 100.0, 100.0);
    refresh_screen();
    testRectangle := rectangle_from(100.0, 100.0, text_width("Hello, World!", get_system_font(), 12), text_height("Hello, World!", get_system_font(), 12));
    AssertTrue(point_in_rectangle(point_at(100.0, 100.0), testRectangle));
    close_window(testWindow);
end;
procedure TIntegrationTests.TestDrawTextWithOptionsIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    draw_text("Hello, World!", color_black(), font_named("hara"), 24, 100.0, 100.0, option_defaults());
    refresh_screen();
    testRectangle := rectangle_from(100.0, 100.0, text_width("Hello, World!", get_system_font(), 12), text_height("Hello, World!", get_system_font(), 12));
    AssertTrue(point_in_rectangle(point_at(100.0, 100.0), testRectangle));
    close_window(testWindow);
end;
procedure TIntegrationTests.TestDrawTextOnBitmapFontAsStringIntegration;
begin
    testBitmap := create_bitmap("test_bitmap", 100, 100);
    draw_text_on_bitmap(testBitmap, "Hello", color_black(), "hara", 12, 10.0, 10.0);
    AssertTrue(pixel_drawn_at_point(testBitmap, 10.0, 10.0));
    AssertFalse(pixel_drawn_at_point(testBitmap, 90.0, 90.0));
    free_bitmap(testBitmap);
end;
procedure TIntegrationTests.TestDrawTextOnBitmapWithOptionsFontAsStringIntegration;
begin
    testBitmap := create_bitmap("test_bitmap", 100, 100);
    draw_text_on_bitmap(testBitmap, "Hello", color_black(), "hara", 12, 10.0, 10.0, option_defaults());
    AssertTrue(pixel_drawn_at_point(testBitmap, 10.0, 10.0));
    AssertFalse(pixel_drawn_at_point(testBitmap, 90.0, 90.0));
    free_bitmap(testBitmap);
end;
procedure TIntegrationTests.TestDrawTextOnBitmapNoFontNoSizeIntegration;
begin
    testBitmap := create_bitmap("test_bitmap", 100, 100);
    draw_text_on_bitmap(testBitmap, "Test", color_black(), 10.0, 10.0);
    AssertTrue(pixel_drawn_at_point(testBitmap, 10.0, 10.0));
    AssertFalse(pixel_drawn_at_point(testBitmap, 90.0, 90.0));
    free_bitmap(testBitmap);
end;
procedure TIntegrationTests.TestDrawTextOnBitmapNoFontNoSizeWithOptionsIntegration;
begin
    testBitmap := create_bitmap("test_bitmap", 100, 100);
    draw_text_on_bitmap(testBitmap, "Test", color_black(), 10.0, 10.0, option_defaults());
    AssertTrue(pixel_drawn_at_point(testBitmap, 10.0, 10.0));
    AssertFalse(pixel_drawn_at_point(testBitmap, 90.0, 90.0));
    free_bitmap(testBitmap);
end;
procedure TIntegrationTests.TestDrawTextOnBitmapIntegration;
begin
    testBitmap := create_bitmap("test_bitmap", 100, 100);
    draw_text_on_bitmap(testBitmap, "Hello", color_black(), font_named("hara"), 12, 10.0, 10.0);
    AssertTrue(pixel_drawn_at_point(testBitmap, 10.0, 10.0));
    AssertFalse(pixel_drawn_at_point(testBitmap, 90.0, 90.0));
    free_bitmap(testBitmap);
end;
procedure TIntegrationTests.TestDrawTextOnBitmapWithOptionsIntegration;
begin
    testBitmap := create_bitmap("test_bitmap", 100, 100);
    draw_text_on_bitmap(testBitmap, "Test", color_black(), font_named("hara"), 24, 10.0, 10.0, option_defaults());
    AssertTrue(pixel_drawn_at_point(testBitmap, 10.0, 10.0));
    AssertFalse(pixel_drawn_at_point(testBitmap, 90.0, 90.0));
    free_bitmap(testBitmap);
end;
procedure TIntegrationTests.TestDrawTextOnWindowFontAsStringIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    draw_text_on_window(testWindow, "Hello, World!", color_black(), "hara", 24, 10.0, 10.0);
    refresh_screen();
    testRectangle := rectangle_from(100.0, 100.0, text_width("Hello, World!", get_system_font(), 12), text_height("Hello, World!", get_system_font(), 12));
    AssertTrue(point_in_rectangle(point_at(100.0, 100.0), testRectangle));
    close_window(testWindow);
end;
procedure TIntegrationTests.TestDrawTextOnWindowWithOptionsFontAsStringIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    draw_text_on_window(testWindow, "Hello, World!", color_black(), "hara", 24, 10.0, 10.0, option_defaults());
    refresh_screen();
    testRectangle := rectangle_from(100.0, 100.0, text_width("Hello, World!", get_system_font(), 12), text_height("Hello, World!", get_system_font(), 12));
    AssertTrue(point_in_rectangle(point_at(100.0, 100.0), testRectangle));
    close_window(testWindow);
end;
procedure TIntegrationTests.TestDrawTextOnWindowNoFontNoSizeIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    draw_text_on_window(testWindow, "Hello, World!", color_black(), 10.0, 10.0);
    refresh_screen();
    testRectangle := rectangle_from(100.0, 100.0, text_width("Hello, World!", get_system_font(), 12), text_height("Hello, World!", get_system_font(), 12));
    AssertTrue(point_in_rectangle(point_at(100.0, 100.0), testRectangle));
    close_window(testWindow);
end;
procedure TIntegrationTests.TestDrawTextOnWindowNoFontNoSizeWithOptionsIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    draw_text_on_window(testWindow, "Hello, World!", color_black(), 10.0, 10.0, option_defaults());
    refresh_screen();
    testRectangle := rectangle_from(100.0, 100.0, text_width("Hello, World!", get_system_font(), 12), text_height("Hello, World!", get_system_font(), 12));
    AssertTrue(point_in_rectangle(point_at(100.0, 100.0), testRectangle));
    close_window(testWindow);
end;
procedure TIntegrationTests.TestDrawTextOnWindowIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    testFont := load_font("test_font", "hara.ttf");
    font_load_size(testFont, 24);
    draw_text_on_window(testWindow, "Hello, World!", color_black(), testFont, 24, 10.0, 10.0);
    refresh_screen();
    testRectangle := rectangle_from(100.0, 100.0, text_width("Hello, World!", get_system_font(), 12), text_height("Hello, World!", get_system_font(), 12));
    AssertTrue(point_in_rectangle(point_at(100.0, 100.0), testRectangle));
    close_window(testWindow);
    free_font(testFont);
end;
procedure TIntegrationTests.TestDrawTextOnWindowWithOptionsIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    testFont := load_font("test_font", "hara.ttf");
    draw_text_on_window(testWindow, "Hello, World!", color_black(), testFont, 24, 10.0, 10.0, option_defaults());
    refresh_screen();
    testRectangle := rectangle_from(100.0, 100.0, text_width("Hello, World!", get_system_font(), 12), text_height("Hello, World!", get_system_font(), 12));
    AssertTrue(point_in_rectangle(point_at(100.0, 100.0), testRectangle));
    close_window(testWindow);
    free_font(testFont);
end;
procedure TIntegrationTests.TestFontHasSizeNameAsStringIntegration;
begin
    testResult1 := font_has_size("hara", 12);
    AssertTrue(testResult1);
    testResult2 := font_has_size("nonexistent_font", 12);
    AssertFalse(testResult2);
end;
procedure TIntegrationTests.TestFontHasSizeIntegration;
begin
    testFont := load_font("test_font", "hara.ttf");
    hasSize12 := font_has_size(testFont, 12);
    AssertTrue(hasSize12);
    hasSize999 := font_has_size(testFont, 999);
    AssertFalse(hasSize999);
    free_font(testFont);
end;
procedure TIntegrationTests.TestFontLoadSizeNameAsStringIntegration;
begin
    font_load_size("test_font", 12);
    testFontSizeCheck := font_has_size("test_font", 12);
    AssertTrue(testFontSizeCheck);
end;
procedure TIntegrationTests.TestFontLoadSizeIntegration;
begin
    testFont := load_font("test_font", "hara.ttf");
    font_load_size(testFont, 12);
    AssertTrue(font_has_size(testFont, 12));
    free_font(testFont);
end;
procedure TIntegrationTests.TestFontNamedIntegration;
begin
    testWindow := open_window("Font Test", 800, 600);
    testFont := font_named("hara");
    draw_text("Test Text", color_black(), testFont, 24, 100.0, 100.0);
    refresh_screen();
    AssertNotNull(testFont);
    close_window(testWindow);
end;
procedure TIntegrationTests.TestFreeAllFontsIntegration;
begin
    testFont := load_font("test_font", "hara.ttf");
    testFontNamed := font_named("test_font");
    AssertNotNull(testFontNamed);
    free_all_fonts();
    testHasFont := has_font("test_font");
    AssertFalse(testHasFont);
end;
procedure TIntegrationTests.TestFreeFontIntegration;
begin
    testFont := load_font("test_font", "hara.ttf");
    free_font(testFont);
    AssertFalse(has_font(testFont));
end;
procedure TIntegrationTests.TestGetFontStyleNameAsStringIntegration;
begin
    testFont := load_font("test_font", "hara.ttf");
    testStyle := get_font_style("test_font");
    AssertNotNull(testStyle);
    free_font(testFont);
end;
procedure TIntegrationTests.TestGetFontStyleIntegration;
begin
    testFont := load_font("test_font", "hara.ttf");
    testStyle := get_font_style(testFont);
    AssertNotEquals(testStyle, FontStyle.BOLD_FONT);
    free_font(testFont);
end;
procedure TIntegrationTests.TestGetSystemFontIntegration;
begin
    testFont := get_system_font();
    AssertNotNull(testFont);
    testHasSize := font_has_size(testFont, 12);
    AssertTrue(testHasSize);
end;
procedure TIntegrationTests.TestHasFontIntegration;
begin
    testFont := load_font("test_font", "hara.ttf");
    AssertTrue(has_font(testFont));
    free_font(testFont);
    AssertFalse(has_font(testFont));
end;
procedure TIntegrationTests.TestHasFontNameAsStringIntegration;
begin
    testResultHara := has_font("hara");
    AssertTrue(testResultHara);
    testResultNonexistent := has_font("nonexistent_font");
    AssertFalse(testResultNonexistent);
end;
procedure TIntegrationTests.TestLoadFontIntegration;
begin
    testWindow := open_window("Font Test", 800, 600);
    testFont := load_font("test_font", "hara.ttf");
    draw_text("Hello, World!", color_black(), testFont, 24, 100.0, 100.0, option_defaults());
    refresh_screen();
    AssertTrue(has_font("test_font"));
    close_window(testWindow);
    free_font(testFont);
end;
procedure TIntegrationTests.TestSetFontStyleNameAsStringIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    testFont := load_font("test_font", "hara.ttf");
    font_load_size("test_font", 24);
    set_font_style("test_font", FontStyle.BOLD_FONT);
    draw_text("Bold Text", color_black(), "test_font", 24, 100.0, 100.0);
    refresh_screen();
    AssertEquals(get_font_style("test_font"), FontStyle.BOLD_FONT);
    close_window(testWindow);
    free_font(testFont);
end;
procedure TIntegrationTests.TestSetFontStyleIntegration;
begin
    testFont := font_named("hara");
    set_font_style(testFont, FontStyle.BOLD_FONT);
    testStyle := get_font_style(testFont);
    AssertEquals(testStyle, FontStyle.BOLD_FONT);
    free_font(testFont);
end;
procedure TIntegrationTests.TestTextHeightFontNamedIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    testHeight := text_height("Hello, World!", "hara", 24);
    AssertTrue(testHeight > 0);
    close_window(testWindow);
end;
procedure TIntegrationTests.TestTextHeightIntegration;
begin
    testFont := load_font("test_font", "hara.ttf");
    font_load_size(testFont, 24);
    testHeight := text_height("Hello, World!", testFont, 24);
    AssertTrue(testHeight > 0);
    free_font(testFont);
end;
procedure TIntegrationTests.TestTextWidthFontNamedIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    testWidth := text_width("Hello, World!", "hara", 24);
    draw_text("Hello, World!", color_black(), "hara", 24, 100.0, 100.0);
    refresh_screen();
    AssertTrue(testWidth > 0);
    close_window(testWindow);
end;
procedure TIntegrationTests.TestTextWidthIntegration;
begin
    testFont := load_font("test_font", "hara.ttf");
    font_load_size(testFont, 12);
    testWidth := text_width("Hello, World!", testFont, 12);
    AssertTrue(testWidth > 0);
    free_font(testFont);
end;
procedure TIntegrationTests.TestDrawTriangleRecordIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    testTriangle := triangle_from(point_at(100.0, 100.0), point_at(200.0, 200.0), point_at(150.0, 300.0));
    draw_triangle(color_black(), testTriangle);
    refresh_screen();
    AssertTrue(point_in_triangle(point_at(150.0, 200.0), testTriangle));
    AssertFalse(point_in_triangle(point_at(300.0, 300.0), testTriangle));
    close_window(testWindow);
end;
procedure TIntegrationTests.TestDrawTriangleRecordWithOptionsIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    testTriangle := triangle_from(point_at(100.0, 100.0), point_at(200.0, 200.0), point_at(150.0, 300.0));
    draw_triangle(color_black(), testTriangle, option_defaults());
    refresh_screen();
    AssertTrue(point_in_triangle(point_at(150.0, 150.0), testTriangle));
    AssertFalse(point_in_triangle(point_at(300.0, 300.0), testTriangle));
    close_window(testWindow);
end;
procedure TIntegrationTests.TestDrawTriangleIntegration;
begin
    testWindow := open_window("Triangle Test", 800, 600);
    draw_triangle(color_black(), 100.0, 100.0, 200.0, 300.0, 300.0, 100.0);
    refresh_screen();
    AssertTrue(point_in_triangle(point_at(150.0, 150.0), triangle_from(point_at(100.0, 100.0), point_at(200.0, 300.0), point_at(300.0, 100.0))));
    close_window(testWindow);
end;
procedure TIntegrationTests.TestDrawTriangleWithOptionsIntegration;
begin
    testWindow := open_window("Triangle Test", 800, 600);
    draw_triangle(color_black(), 100.0, 100.0, 200.0, 200.0, 150.0, 300.0, option_defaults());
    refresh_screen();
    AssertTrue(point_in_triangle(point_at(150.0, 150.0), triangle_from(point_at(100.0, 100.0), point_at(200.0, 200.0), point_at(150.0, 300.0))));
    close_window(testWindow);
end;
procedure TIntegrationTests.TestDrawTriangleOnBitmapRecordIntegration;
begin
    testBitmap := create_bitmap("test_bitmap", 100, 100);
    testTriangle := triangle_from(point_at(25.0, 25.0), point_at(75.0, 25.0), point_at(50.0, 75.0));
    draw_triangle_on_bitmap(testBitmap, color_black(), testTriangle);
    AssertTrue(pixel_drawn_at_point(testBitmap, point_at(50.0, 50.0)));
    AssertFalse(pixel_drawn_at_point(testBitmap, point_at(10.0, 10.0)));
    free_bitmap(testBitmap);
end;
procedure TIntegrationTests.TestDrawTriangleOnBitmapRecordWithOptionsIntegration;
begin
    testBitmap := create_bitmap("test_bitmap", 100, 100);
    testTriangle := triangle_from(point_at(25.0, 25.0), point_at(75.0, 25.0), point_at(50.0, 75.0));
    draw_triangle_on_bitmap(testBitmap, color_black(), testTriangle, option_defaults());
    AssertTrue(pixel_drawn_at_point(testBitmap, point_at(50.0, 50.0)));
    AssertFalse(pixel_drawn_at_point(testBitmap, point_at(10.0, 10.0)));
    free_bitmap(testBitmap);
end;
procedure TIntegrationTests.TestDrawTriangleOnBitmapIntegration;
begin
    testBitmap := create_bitmap("test_bitmap", 100, 100);
    draw_triangle_on_bitmap(testBitmap, color_black(), 25.0, 25.0, 75.0, 25.0, 50.0, 75.0);
    AssertTrue(pixel_drawn_at_point(testBitmap, point_at(50.0, 50.0)));
    AssertFalse(pixel_drawn_at_point(testBitmap, point_at(10.0, 10.0)));
    free_bitmap(testBitmap);
end;
procedure TIntegrationTests.TestDrawTriangleOnBitmapWithOptionsIntegration;
begin
    testBitmap := create_bitmap("test_bitmap", 100, 100);
    draw_triangle_on_bitmap(testBitmap, color_black(), 10.0, 10.0, 50.0, 90.0, 90.0, 10.0, option_defaults());
    AssertTrue(pixel_drawn_at_point(testBitmap, point_at(50.0, 50.0)));
    AssertFalse(pixel_drawn_at_point(testBitmap, point_at(100.0, 100.0)));
    free_bitmap(testBitmap);
end;
procedure TIntegrationTests.TestDrawTriangleOnWindowRecordIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    testTriangle := triangle_from(point_at(100.0, 100.0), point_at(200.0, 200.0), point_at(150.0, 300.0));
    draw_triangle_on_window(testWindow, color_black(), testTriangle);
    refresh_screen();
    AssertTrue(point_in_triangle(point_at(150.0, 200.0), testTriangle));
    close_window(testWindow);
end;
procedure TIntegrationTests.TestDrawTriangleOnWindowRecordWithOptionsIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    testTriangle := triangle_from(point_at(100.0, 100.0), point_at(200.0, 200.0), point_at(150.0, 250.0));
    draw_triangle_on_window(testWindow, color_black(), testTriangle, option_defaults());
    refresh_screen();
    AssertTrue(point_in_triangle(point_at(150.0, 150.0), testTriangle));
    close_window(testWindow);
end;
procedure TIntegrationTests.TestDrawTriangleOnWindowIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    draw_triangle_on_window(testWindow, color_black(), 100.0, 100.0, 200.0, 300.0, 300.0, 100.0);
    refresh_screen();
    AssertTrue(point_in_triangle(point_at(200.0, 200.0), triangle_from(point_at(100.0, 100.0), point_at(200.0, 300.0), point_at(300.0, 100.0))));
    close_window(testWindow);
end;
procedure TIntegrationTests.TestDrawTriangleOnWindowWithOptionsIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    draw_triangle_on_window(testWindow, color_black(), 100.0, 100.0, 200.0, 200.0, 150.0, 300.0, option_defaults());
    refresh_screen();
    AssertTrue(point_in_triangle(point_at(150.0, 200.0), triangle_from(100.0, 100.0, 200.0, 200.0, 150.0, 300.0)));
    close_window(testWindow);
end;
procedure TIntegrationTests.TestFillTriangleRecordIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    testTriangle := triangle_from(point_at(100.0, 100.0), point_at(200.0, 300.0), point_at(300.0, 100.0));
    fill_triangle(color_black(), testTriangle);
    refresh_screen();
    AssertTrue(point_in_triangle(point_at(200.0, 200.0), testTriangle));
    AssertFalse(point_in_triangle(point_at(400.0, 400.0), testTriangle));
    close_window(testWindow);
end;
procedure TIntegrationTests.TestFillTriangleRecordWithOptionsIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    testTriangle := triangle_from(point_at(100.0, 100.0), point_at(200.0, 300.0), point_at(300.0, 100.0));
    fill_triangle(color_black(), testTriangle, option_defaults());
    refresh_screen();
    AssertTrue(point_in_triangle(point_at(200.0, 200.0), testTriangle));
    AssertFalse(point_in_triangle(point_at(400.0, 400.0), testTriangle));
    close_window(testWindow);
end;
procedure TIntegrationTests.TestFillTriangleIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    fill_triangle(color_black(), 100.0, 100.0, 200.0, 300.0, 300.0, 100.0);
    refresh_screen();
    AssertTrue(point_in_triangle(point_at(150.0, 150.0), triangle_from(point_at(100.0, 100.0), point_at(200.0, 300.0), point_at(300.0, 100.0))));
    close_window(testWindow);
end;
procedure TIntegrationTests.TestFillTriangleWithOptionsIntegration;
begin
    testWindow := open_window("Triangle Test", 800, 600);
    fill_triangle(color_red(), 100.0, 100.0, 200.0, 300.0, 300.0, 100.0, option_defaults());
    refresh_screen();
    AssertTrue(point_in_triangle(point_at(150.0, 150.0), triangle_from(point_at(100.0, 100.0), point_at(200.0, 300.0), point_at(300.0, 100.0))));
    AssertFalse(point_in_triangle(point_at(350.0, 150.0), triangle_from(point_at(100.0, 100.0), point_at(200.0, 300.0), point_at(300.0, 100.0))));
    close_window(testWindow);
end;
procedure TIntegrationTests.TestFillTriangleOnBitmapRecordIntegration;
begin
    testBitmap := create_bitmap("test_bitmap", 100, 100);
    testTriangle := triangle_from(point_at(25.0, 25.0), point_at(75.0, 25.0), point_at(50.0, 75.0));
    fill_triangle_on_bitmap(testBitmap, color_black(), testTriangle);
    AssertTrue(pixel_drawn_at_point(testBitmap, point_at(50.0, 50.0)));
    AssertFalse(pixel_drawn_at_point(testBitmap, point_at(0.0, 0.0)));
    free_bitmap(testBitmap);
end;
procedure TIntegrationTests.TestFillTriangleOnBitmapRecordWithOptionsIntegration;
begin
    testBitmap := create_bitmap("test_bitmap", 100, 100);
    testTriangle := triangle_from(point_at(25.0, 25.0), point_at(75.0, 25.0), point_at(50.0, 75.0));
    fill_triangle_on_bitmap(testBitmap, color_black(), testTriangle, option_defaults());
    AssertTrue(pixel_drawn_at_point(testBitmap, point_at(50.0, 50.0)));
    AssertFalse(pixel_drawn_at_point(testBitmap, point_at(10.0, 10.0)));
    free_bitmap(testBitmap);
end;
procedure TIntegrationTests.TestFillTriangleOnBitmapIntegration;
begin
    testBitmap := create_bitmap("test_bitmap", 100, 100);
    fill_triangle_on_bitmap(testBitmap, color_black(), 25.0, 25.0, 75.0, 25.0, 50.0, 75.0);
    AssertTrue(pixel_drawn_at_point(testBitmap, 50.0, 50.0));
    AssertFalse(pixel_drawn_at_point(testBitmap, 0.0, 0.0));
    free_bitmap(testBitmap);
end;
procedure TIntegrationTests.TestFillTriangleOnBitmapWithOptionsIntegration;
begin
    testBitmap := create_bitmap("test_bitmap", 100, 100);
    fill_triangle_on_bitmap(testBitmap, color_black(), 25.0, 25.0, 75.0, 25.0, 50.0, 75.0, option_defaults());
    AssertTrue(pixel_drawn_at_point(testBitmap, 50.0, 50.0));
    AssertFalse(pixel_drawn_at_point(testBitmap, 0.0, 0.0));
    free_bitmap(testBitmap);
end;
procedure TIntegrationTests.TestFillTriangleOnWindowRecordIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    testTriangle := triangle_from(point_at(100.0, 100.0), point_at(200.0, 300.0), point_at(300.0, 100.0));
    fill_triangle_on_window(testWindow, color_black(), testTriangle);
    refresh_screen();
    AssertTrue(point_in_triangle(point_at(200.0, 200.0), testTriangle));
    close_window(testWindow);
end;
procedure TIntegrationTests.TestFillTriangleOnWindowRecordWithOptionsIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    testTriangle := triangle_from(point_at(100.0, 100.0), point_at(200.0, 300.0), point_at(300.0, 100.0));
    fill_triangle_on_window(testWindow, color_black(), testTriangle, option_defaults());
    refresh_screen();
    AssertTrue(point_in_triangle(point_at(200.0, 200.0), testTriangle));
    close_window(testWindow);
end;
procedure TIntegrationTests.TestFillTriangleOnWindowIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    fill_triangle_on_window(testWindow, color_black(), 100.0, 100.0, 200.0, 300.0, 300.0, 100.0);
    refresh_screen();
    AssertTrue(point_in_triangle(point_at(200.0, 200.0), triangle_from(point_at(100.0, 100.0), point_at(200.0, 300.0), point_at(300.0, 100.0))));
    close_window(testWindow);
end;
procedure TIntegrationTests.TestFillTriangleOnWindowWithOptionsIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    fill_triangle_on_window(testWindow, color_black(), 100.0, 100.0, 200.0, 300.0, 300.0, 100.0, option_defaults());
    refresh_screen();
    AssertTrue(point_in_triangle(point_at(150.0, 150.0), triangle_from(point_at(100.0, 100.0), point_at(200.0, 300.0), point_at(300.0, 100.0))));
    AssertFalse(point_in_triangle(point_at(350.0, 150.0), triangle_from(point_at(100.0, 100.0), point_at(200.0, 300.0), point_at(300.0, 100.0))));
    close_window(testWindow);
end;
end;

procedure RegisterTests;
begin
TestFramework.RegisterTest(TIntegrationTests.Suite);
end;
