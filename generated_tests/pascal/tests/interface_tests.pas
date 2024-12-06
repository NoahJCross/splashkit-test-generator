uses SplashKit, TestFramework

type
TIntegrationTests = class(TTestCase)
published
procedure TIntegrationTests.TestAddColumnIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    testPanel := start_panel("Test Panel", rectangle_from(0, 0, 800, 600));
    start_custom_layout();
    add_column(100);
    add_column(-1);
    button("Test Button");
    end_panel("Test Panel");
    draw_interface();
    refresh_screen();
    close_window(testWindow);
end;
procedure TIntegrationTests.TestAddColumnRelativeIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    start_panel("Test Panel", rectangle_from(0, 0, 800, 600));
    start_custom_layout();
    add_column_relative(0.5);
    button("Button 1");
    add_column_relative(0.5);
    button("Button 2");
    end_panel("Test Panel");
    draw_interface();
    refresh_screen();
    AssertTrue(point_in_rectangle(point_at(200, 300), rectangle_from(0, 0, 400, 600)));
    close_window(testWindow);
end;
procedure TIntegrationTests.TestBitmapButtonIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    testBitmap := create_bitmap("test_bitmap", 100, 100);
    process_events();
    simulate_mouse_click(Mousebutton.LEFT);
    process_events();
    buttonClicked := bitmap_button(testBitmap);
    AssertTrue(buttonClicked);
    free_bitmap(testBitmap);
    close_window(testWindow);
end;
procedure TIntegrationTests.TestBitmapButtonAtPositionIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    testBitmap := create_bitmap("test_bitmap", 100, 100);
    testRectangle := rectangle_from(100, 100, 100, 100);
    process_events();
    simulate_mouse_click(Mousebutton.LEFT);
    process_events();
    buttonClicked := bitmap_button(testBitmap, testRectangle);
    AssertTrue(buttonClicked);
    free_bitmap(testBitmap);
    close_window(testWindow);
end;
procedure TIntegrationTests.TestBitmapButtonAtPositionWithOptionsIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    testBitmap := create_bitmap("test_bitmap", 100, 100);
    testRectangle := rectangle_from(100, 100, 100, 100);
    testOptions := option_defaults();
    buttonClicked := bitmap_button(testBitmap, testRectangle, testOptions);
    process_events();
    simulate_mouse_click(Mousebutton.LEFT);
    process_events();
    AssertTrue(buttonClicked);
    free_bitmap(testBitmap);
    close_window(testWindow);
end;
procedure TIntegrationTests.TestBitmapButtonWithOptionsIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    testBitmap := create_bitmap("test_bitmap", 100, 100);
    testOptions1 := option_defaults();
    testOptions2 := option_scale_bmp(0.5, 0.5, testOptions1);
    process_events();
    simulate_mouse_click(Mousebutton.LEFT);
    process_events();
    buttonClicked := bitmap_button(testBitmap, testOptions2);
    AssertTrue(buttonClicked);
    free_bitmap(testBitmap);
    close_window(testWindow);
end;
procedure TIntegrationTests.TestBitmapButtonLabeledIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    testBitmap := create_bitmap("test_bitmap", 100, 100);
    process_events();
    buttonClicked1 := bitmap_button("Click Me", testBitmap);
    AssertFalse(buttonClicked1);
    simulate_mouse_click(Mousebutton.LEFT);
    process_events();
    buttonClicked2 := bitmap_button("Click Me", testBitmap);
    AssertTrue(buttonClicked2);
    free_bitmap(testBitmap);
    close_window(testWindow);
end;
procedure TIntegrationTests.TestBitmapButtonLabeledWithOptionsIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    testBitmap := create_bitmap("test_bitmap", 100, 100);
    testOptions1 := option_defaults();
    testOptions2 := option_scale_bmp(0.5, 0.5, testOptions1);
    process_events();
    simulate_mouse_click(Mousebutton.LEFT);
    process_events();
    buttonClicked := bitmap_button("Click Me", testBitmap, testOptions2);
    AssertTrue(buttonClicked);
    free_bitmap(testBitmap);
    close_window(testWindow);
end;
procedure TIntegrationTests.TestButtonAtPositionIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    testRectangle := rectangle_from(100, 100, 200, 50);
    process_events();
    buttonClicked1 := button("Click Me", testRectangle);
    AssertFalse(buttonClicked1);
    simulate_mouse_click(Mousebutton.LEFT);
    process_events();
    buttonClicked2 := button("Click Me", testRectangle);
    AssertTrue(buttonClicked2);
    close_window(testWindow);
end;
procedure TIntegrationTests.TestButtonIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    testPanel := start_panel("Test Panel", rectangle_from(100, 100, 200, 100));
    process_events();
    buttonClicked1 := button("Click Me");
    AssertFalse(buttonClicked1);
    simulate_mouse_click(Mousebutton.LEFT);
    process_events();
    buttonClicked2 := button("Click Me");
    AssertTrue(buttonClicked2);
    end_panel("Test Panel");
    close_window(testWindow);
end;
procedure TIntegrationTests.TestButtonLabeledIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    process_events();
    buttonResult1 := button("Label:", "Click Me");
    AssertFalse(buttonResult1);
    simulate_mouse_click(Mousebutton.LEFT);
    process_events();
    buttonResult2 := button("Label:", "Click Me");
    AssertTrue(buttonResult2);
    close_window(testWindow);
end;
procedure TIntegrationTests.TestCheckboxAtPositionIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    testRect := rectangle_from(100, 100, 200, 50);
    process_events();
    testCheckboxResult1 := checkbox("Test Checkbox", false, testRect);
    AssertFalse(testCheckboxResult1);
    simulate_mouse_click(Mousebutton.LEFT);
    process_events();
    testCheckboxResult2 := checkbox("Test Checkbox", testCheckboxResult1, testRect);
    AssertTrue(testCheckboxResult2);
    close_window(testWindow);
end;
procedure TIntegrationTests.TestCheckboxIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    process_events();
    testCheckboxResult1 := checkbox("Test Checkbox", false);
    AssertFalse(testCheckboxResult1);
    simulate_mouse_click(Mousebutton.LEFT);
    process_events();
    testCheckboxResult2 := checkbox("Test Checkbox", testCheckboxResult1);
    AssertTrue(testCheckboxResult2);
    close_window(testWindow);
end;
procedure TIntegrationTests.TestCheckboxLabeledIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    process_events();
    testCheckboxResult1 := checkbox("Test Checkbox", "Check me", false);
    AssertFalse(testCheckboxResult1);
    simulate_mouse_click(Mousebutton.LEFT);
    process_events();
    testCheckboxResult2 := checkbox("Test Checkbox", "Check me", testCheckboxResult1);
    AssertTrue(testCheckboxResult2);
    close_window(testWindow);
end;
procedure TIntegrationTests.TestColorSliderAtPositionIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    testColor := color_black();
    testRect := rectangle_from(100, 100, 200, 100);
    resultColor := color_slider(testColor, testRect);
    process_events();
    simulate_mouse_click(Mousebutton.LEFT);
    process_events();
    AssertNotEquals(testColor, resultColor);
    close_window(testWindow);
end;
procedure TIntegrationTests.TestColorSliderIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    testColor := color_black();
    resultColor := color_slider(testColor);
    draw_interface();
    refresh_screen();
    AssertNotEquals(testColor, resultColor);
    close_window(testWindow);
end;
procedure TIntegrationTests.TestColorSliderLabeledIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    testColor := color_black();
    resultColor := color_slider("Test Color Slider", testColor);
    process_events();
    AssertNotEquals(resultColor, color_black());
    close_window(testWindow);
end;
procedure TIntegrationTests.TestDisableInterfaceIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    testPanel := start_panel("Test Panel", rectangle_from(100, 100, 200, 200));
    testButton := button("Test Button");
    process_events();
    AssertTrue(interface_enabled());
    disable_interface();
    process_events();
    AssertFalse(interface_enabled());
    enable_interface();
    process_events();
    AssertTrue(interface_enabled());
    end_panel("Test Panel");
    close_window(testWindow);
end;
procedure TIntegrationTests.TestDrawInterfaceIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    start_panel("Test Panel", rectangle_from(100, 100, 200, 200));
    button("Test Button");
    end_panel("Test Panel");
    draw_interface();
    refresh_screen();
    AssertEquals(get_pixel(point_at(150, 150)), color_black());
    close_window(testWindow);
end;
procedure TIntegrationTests.TestEnableInterfaceIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    disable_interface();
    process_events();
    AssertFalse(interface_enabled());
    enable_interface();
    process_events();
    AssertTrue(interface_enabled());
    close_window(testWindow);
end;
procedure TIntegrationTests.TestEndInsetIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    start_inset("Test Inset", 60);
    end_inset("Test Inset");
    close_window(testWindow);
end;
procedure TIntegrationTests.TestEndPanelIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    testPanel := start_panel("Test Panel", rectangle_from(100, 100, 200, 200));
    end_panel("Test Panel");
    close_window(testWindow);
end;
procedure TIntegrationTests.TestEndPopupIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    testPopup := start_popup("Test Popup");
    end_popup("Test Popup");
    close_window(testWindow);
end;
procedure TIntegrationTests.TestEndTreenodeIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    start_panel("Test Panel", rectangle_from(10, 10, 200, 200));
    testNode := start_treenode("Test Node");
    end_treenode("Test Node");
    end_panel("Test Panel");
    draw_interface();
    refresh_screen();
    close_window(testWindow);
end;
procedure TIntegrationTests.TestEnterColumnIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    testPanel := start_panel("Test Panel", rectangle_from(10, 10, 300, 200));
    add_column(100);
    enter_column();
    button("Button1");
    leave_column();
    end_panel("Test Panel");
    draw_interface();
    refresh_screen();
    close_window(testWindow);
end;
procedure TIntegrationTests.TestGetInterfaceLabelWidthIntegration;
begin
    testLabelWidth := get_interface_label_width();
    AssertEquals(testLabelWidth, 60);
end;
procedure TIntegrationTests.TestHeaderIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    process_events();
    testHeaderResult := header("Test Header");
    AssertNotNull(testHeaderResult);
    close_window(testWindow);
end;
procedure TIntegrationTests.TestHSBColorSliderAtPositionIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    testColor := hsb_color(0.5, 1.0, 0.5);
    testRect := rectangle_from(100, 100, 200, 100);
    resultColor := hsb_color_slider(testColor, testRect);
    process_events();
    AssertNotEquals(testColor, resultColor);
    close_window(testWindow);
end;
procedure TIntegrationTests.TestHSBColorSliderIntegration;
begin
    testWindow := open_window("HSB Slider Test", 800, 600);
    testColor := color_black();
    resultColor := hsb_color_slider(testColor);
    draw_interface();
    refresh_screen();
    AssertNotEquals(testColor, resultColor);
    close_window(testWindow);
end;
procedure TIntegrationTests.TestHSBColorSliderLabeledIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    testColor := color_black();
    testResultColor := hsb_color_slider("Color Slider", testColor);
    process_events();
    AssertNotEquals(testResultColor, color_black());
    close_window(testWindow);
end;
procedure TIntegrationTests.TestInterfaceEnabledIntegration;
begin
    initialState := interface_enabled();
    disable_interface();
    disabledState := interface_enabled();
    AssertFalse(disabledState);
    enable_interface();
    enabledState := interface_enabled();
    AssertTrue(enabledState);
end;
procedure TIntegrationTests.TestInterfaceStylePanelIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    testRectangle := rectangle_from(0, 0, 200, 200);
    interface_style_panel(testRectangle);
    refresh_screen();
    close_window(testWindow);
end;
procedure TIntegrationTests.TestLabelElementIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    label_element("Test Label");
    draw_interface();
    refresh_screen();
    AssertTrue(pixel_drawn_at_point(point_at(10, 10)));
    close_window(testWindow);
end;
procedure TIntegrationTests.TestLabelElementAtPositionIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    testRectangle := rectangle_from(100, 100, 200, 50);
    label_element("Test Label", testRectangle);
    refresh_screen();
    close_window(testWindow);
end;
procedure TIntegrationTests.TestLastElementChangedIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    process_events();
    slider("Test Slider", 0.0, 0.0, 100.0);
    process_events();
    AssertFalse(last_element_changed());
    simulate_mouse_move(100, 100);
    simulate_mouse_down(Mousebutton.LEFT);
    simulate_mouse_move(200, 200);
    simulate_mouse_up(Mousebutton.LEFT);
    process_events();
    AssertTrue(last_element_changed());
    close_window(testWindow);
end;
procedure TIntegrationTests.TestLastElementConfirmedIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    testButton := button("Test Button");
    process_events();
    AssertFalse(last_element_confirmed());
    simulate_mouse_click(Mousebutton.LEFT);
    process_events();
    AssertTrue(last_element_confirmed());
    close_window(testWindow);
end;
procedure TIntegrationTests.TestLeaveColumnIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    start_panel("Test Panel", rectangle_from(10, 10, 300, 200));
    start_custom_layout();
    add_column(100);
    enter_column();
    leave_column();
    buttonResult := button("Test Button");
    AssertFalse(buttonResult);
    end_panel("Test Panel");
    close_window(testWindow);
end;
procedure TIntegrationTests.TestNumberBoxAtPositionIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    testRect := rectangle_from(100, 100, 200, 30);
    testResult := number_box(5.0, 1.0, testRect);
    process_events();
    AssertTrue((testResult >= 4.0) and (testResult <= 6.0));
    close_window(testWindow);
end;
procedure TIntegrationTests.TestNumberBoxIntegration;
begin
    testWindow := open_window("Number Box Test", 800, 600);
    process_events();
    testResult := number_box(5.0, 1.0);
    AssertTrue((testResult >= 4.0) and (testResult <= 6.0));
    close_window(testWindow);
end;
procedure TIntegrationTests.TestNumberBoxLabeledIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    testResult := number_box("Test Value", 5.0, 1.0);
    AssertTrue((testResult >= 4.0) and (testResult <= 6.0));
    close_window(testWindow);
end;
procedure TIntegrationTests.TestOpenPopupIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    testPopup := start_popup("Test Popup");
    process_events();
    open_popup("Test Popup");
    process_events();
    AssertTrue(popupIsOpen);
    end_popup("Test Popup");
    close_window(testWindow);
end;
procedure TIntegrationTests.TestParagraphIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    set_interface_font(load_font("test_font", "arial.ttf"));
    set_interface_font_size(12);
    paragraph("This is a test paragraph to check if the text wraps correctly.");
    draw_interface();
    refresh_screen();
    AssertEquals(get_pixel(point_at(10, 10)), color_black());
    free_font(font_named("test_font"));
    close_window(testWindow);
end;
procedure TIntegrationTests.TestParagraphAtPositionIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    testRectangle := rectangle_from(100, 100, 200, 100);
    paragraph("This is a test paragraph.", testRectangle);
    refresh_screen();
    AssertEquals(get_pixel(point_at(rectangle_left(testRectangle), rectangle_top(testRectangle))), color_black());
    close_window(testWindow);
end;
procedure TIntegrationTests.TestResetLayoutIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    start_custom_layout();
    add_column(200);
    add_column(-1);
    reset_layout();
    draw_interface();
    refresh_screen();
    close_window(testWindow);
end;
procedure TIntegrationTests.TestSetInterfaceAccentColorIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    set_interface_accent_color(color_red(), 0.5);
    button("Test Button");
    draw_interface();
    refresh_screen();
    AssertEquals(get_pixel(point_at(10, 10)), color_red());
    close_window(testWindow);
end;
procedure TIntegrationTests.TestSetInterfaceBorderColorIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    set_interface_border_color(color_red());
    start_panel("Test Panel", rectangle_from(100, 100, 200, 100));
    button("Test Button");
    end_panel("Test Panel");
    draw_interface();
    refresh_screen();
    AssertEquals(get_pixel(100, 100), color_red());
    close_window(testWindow);
end;
procedure TIntegrationTests.TestSetInterfaceColorsAutoIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    set_interface_colors_auto(color_white(), color_blue(), 0.5, 0.7, 0.3);
    start_panel("Test Panel", rectangle_from(100, 100, 200, 200));
    button("Test Button");
    end_panel("Test Panel");
    draw_interface();
    refresh_screen();
    AssertEquals(get_pixel(150, 150), color_blue());
    close_window(testWindow);
end;
procedure TIntegrationTests.TestSetInterfaceElementColorIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    set_interface_element_color(color_black(), 0.5);
    start_panel("Test Panel", rectangle_from(100, 100, 200, 200));
    button("Test Button");
    end_panel("Test Panel");
    draw_interface();
    refresh_screen();
    AssertEquals(get_pixel(150, 150), color_black());
    close_window(testWindow);
end;
procedure TIntegrationTests.TestSetInterfaceElementShadowsIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    set_interface_element_shadows(10, color_black(), point_at(5, 5));
    start_panel("Test Panel", rectangle_from(100, 100, 200, 200));
    button("Test Button");
    end_panel("Test Panel");
    draw_interface();
    refresh_screen();
    AssertTrue(pixel_drawn_at_point(point_at(105, 105)));
    close_window(testWindow);
end;
procedure TIntegrationTests.TestSetInterfaceFontFontAsStringIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    set_interface_font("Arial");
    label_element("Test Text");
    draw_interface();
    refresh_screen();
    close_window(testWindow);
end;
procedure TIntegrationTests.TestSetInterfaceFontIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    testFont := load_font("test_font", "arial.ttf");
    set_interface_font(testFont);
    label_element("Test Text");
    draw_interface();
    refresh_screen();
    free_font(testFont);
    close_window(testWindow);
end;
procedure TIntegrationTests.TestSetInterfaceFontSizeIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    set_interface_font_size(16);
    label_element("Test Text");
    draw_interface();
    AssertTrue(pixel_drawn_at_point(point_at(10, 20)));
    close_window(testWindow);
end;
procedure TIntegrationTests.TestSetInterfaceLabelWidthIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    set_interface_label_width(100);
    testWidth := get_interface_label_width();
    AssertEquals(testWidth, 100);
    close_window(testWindow);
end;
procedure TIntegrationTests.TestSetInterfacePanelShadowsIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    set_interface_panel_shadows(10, rgba_color(0, 0, 0, 128), point_at(5, 5));
    panelVisible := start_panel("Test Panel", rectangle_from(100, 100, 200, 150));
    end_panel("Test Panel");
    draw_interface();
    refresh_screen();
    AssertEquals(get_pixel(point_at(105, 105)), rgba_color(0, 0, 0, 128));
    close_window(testWindow);
end;
procedure TIntegrationTests.TestSetInterfaceRootTextColorIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    set_interface_root_text_color(color_red());
    label_element("Test Text", rectangle_from(100, 100, 200, 50));
    refresh_screen();
    AssertTrue(pixel_drawn_at_point(color_red(), 105, 105));
    close_window(testWindow);
end;
procedure TIntegrationTests.TestSetInterfaceShadowsIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    set_interface_shadows(10, rgba_color(0, 0, 0, 128), point_at(5, 5));
    panelVisible := start_panel("Test Panel", rectangle_from(100, 100, 200, 200));
if AssertTrue(panelVisible);
 then
        button("Test Button");
        end_panel("Test Panel");
        draw_interface();
        refresh_screen();
        AssertTrue(pixel_drawn_at_point(point_at(105, 105)));
end;
end;
    close_window(testWindow);
end;
procedure TIntegrationTests.TestSetInterfaceSpacingIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    set_interface_spacing(10, 5);
    testPanel := start_panel("Test Panel", rectangle_from(100, 100, 200, 200));
    button("Button 1");
    button("Button 2");
    end_panel("Test Panel");
    draw_interface();
    refresh_screen();
    AssertTrue(pixel_drawn_at_point(point_at(110, 110)));
    close_window(testWindow);
end;
procedure TIntegrationTests.TestSetInterfaceStyleIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    set_interface_style(InterfaceStyle.DARK);
    button("Test Button");
    draw_interface();
    refresh_screen();
    close_window(testWindow);
end;
procedure TIntegrationTests.TestSetInterfaceStyleWithColorIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    set_interface_style(InterfaceStyle.DARK, color_blue());
    testPanel := start_panel("Test Panel", rectangle_from(100, 100, 200, 200));
    button("Test Button");
    draw_interface();
    refresh_screen();
    AssertEquals(get_pixel(point_at(150, 150)), color_blue());
    close_window(testWindow);
end;
procedure TIntegrationTests.TestSetInterfaceTextColorIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    set_interface_text_color(color_red());
    label_element("Test Text");
    draw_interface();
    refresh_screen();
    AssertEquals(get_pixel(point_at(10, 10)), color_red());
    close_window(testWindow);
end;
procedure TIntegrationTests.TestSetLayoutHeightIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    testPanel := start_panel("Test Panel", rectangle_from(0, 0, 800, 600));
    set_layout_height(50);
    button("Test Button");
    end_panel("Test Panel");
    draw_interface();
    refresh_screen();
    close_window(testWindow);
end;
procedure TIntegrationTests.TestSingleLineLayoutIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    single_line_layout();
    testButton1 := button("Button1");
    testButton2 := button("Button2");
    reset_layout();
    close_window(testWindow);
end;
procedure TIntegrationTests.TestSliderAtPositionIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    testRect := rectangle_from(100, 100, 200, 20);
    process_events();
    sliderResult := slider(50.0, 0.0, 100.0, testRect);
    AssertTrue((sliderResult >= 0.0) and (sliderResult <= 100.0));
    close_window(testWindow);
end;
procedure TIntegrationTests.TestSliderIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    process_events();
    testSliderResult := slider(50.0, 0.0, 100.0);
    AssertTrue((testSliderResult >= 0.0) and (testSliderResult <= 100.0));
    close_window(testWindow);
end;
procedure TIntegrationTests.TestSliderLabeledIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    testSliderValue := slider("Test Slider", 50.0, 0.0, 100.0);
    AssertTrue((testSliderValue >= 0.0) and (testSliderValue <= 100.0));
    close_window(testWindow);
end;
procedure TIntegrationTests.TestSplitIntoColumnsIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    start_panel("Test Panel", rectangle_from(0, 0, 800, 600));
    split_into_columns(3);
    end_panel("Test Panel");
    close_window(testWindow);
end;
procedure TIntegrationTests.TestSplitIntoColumnsWithLastWidthIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    testPanel := start_panel("Test Panel", rectangle_from(0, 0, 800, 600));
    split_into_columns(3, 200);
    button("Button 1");
    button("Button 2");
    button("Button 3");
    end_panel("Test Panel");
    close_window(testWindow);
end;
procedure TIntegrationTests.TestSplitIntoColumnsRelativeWithLastWidthIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    testPanel := start_panel("Test Panel", rectangle_from(0, 0, 800, 600));
    split_into_columns_relative(3, 0.5);
    button("Button 1");
    button("Button 2");
    button("Button 3");
    end_panel("Test Panel");
    draw_interface();
    refresh_screen();
    AssertTrue(point_in_rectangle(point_at(200, 300), rectangle_from(0, 0, 200, 600)));
    AssertTrue(point_in_rectangle(point_at(600, 300), rectangle_from(400, 0, 400, 600)));
    close_window(testWindow);
end;
procedure TIntegrationTests.TestStartCustomLayoutIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    start_custom_layout();
    add_column(200);
    buttonResult := button("Test Button");
    reset_layout();
    close_window(testWindow);
    AssertTrue(buttonResult);
end;
procedure TIntegrationTests.TestStartInsetAtPositionIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    testRect := rectangle_from(100, 100, 200, 200);
    start_inset("test_inset", testRect);
    end_inset("test_inset");
    close_window(testWindow);
end;
procedure TIntegrationTests.TestStartInsetIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    start_panel("Test Panel", rectangle_from(100, 100, 300, 300));
    start_inset("Test Inset", 100);
    button("Test Button");
    end_inset("Test Inset");
    end_panel("Test Panel");
    close_window(testWindow);
end;
procedure TIntegrationTests.TestStartPanelIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    testRectangle := rectangle_from(100, 100, 200, 150);
    panelVisible := start_panel("Test Panel", testRectangle);
    AssertTrue(panelVisible);
    end_panel("Test Panel");
    close_window(testWindow);
end;
procedure TIntegrationTests.TestStartPopupIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    popupVisible := start_popup("Test Popup");
    AssertTrue(popupVisible);
    end_popup("Test Popup");
    close_window(testWindow);
end;
procedure TIntegrationTests.TestStartTreenodeIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    start_panel("Test Panel", rectangle_from(0, 0, 800, 600));
    testNodeExpanded := start_treenode("Test Node");
    AssertTrue(testNodeExpanded);
    end_treenode("Test Node");
    end_panel("Test Panel");
    close_window(testWindow);
end;
procedure TIntegrationTests.TestTextBoxIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    testTextBoxResult := text_box("Initial Text");
    process_events();
    AssertEquals(testTextBoxResult, "Initial Text");
    simulate_key_press(Keycode.A);
    process_events();
    testTextBoxResultUpdated := text_box(testTextBoxResult);
    AssertEquals(testTextBoxResultUpdated, "Initial TextA");
    close_window(testWindow);
end;
procedure TIntegrationTests.TestTextBoxAtPositionIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    testRect := rectangle_from(100, 100, 200, 30);
    process_events();
    testResult1 := text_box("Initial Text", testRect);
    AssertEquals(testResult2, "Initial Text");
    simulate_key_press(Keycode.A);
    process_events();
    testResult2 := text_box(testResult1, testRect);
    AssertEquals(testResult1, "Initial TextA");
    close_window(testWindow);
end;
procedure TIntegrationTests.TestTextBoxLabeledIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    testTextBoxResult := text_box("Enter Name", "John");
    process_events();
    AssertEquals(testTextBoxResult, "John");
    close_window(testWindow);
end;
end;

procedure RegisterTests;
begin
TestFramework.RegisterTest(TIntegrationTests.Suite);
end;
