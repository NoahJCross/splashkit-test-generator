uses SplashKit, TestFramework

type
TTestInterface = class(TTestCase)
protected
procedure TIntegrationTests.TestAddColumnIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    while QuitRequested() = false do
        ProcessEvents();
        ClearScreen();
        StartPanel("Test Panel", RectangleFrom(0, 0, 800, 600));
        StartCustomLayout();
        AddColumn(100);
        AddColumn(-1);
        Button("Test Button");
        EndPanel("Test Panel");
        DrawInterface();
        RefreshScreen();
    end;
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestAddColumnRelativeIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    while QuitRequested() = false do
        ProcessEvents();
        ClearScreen();
        StartPanel("Test Panel", RectangleFrom(0, 0, 800, 600));
        StartCustomLayout();
        AddColumnRelative(0.5);
        Button("Button 1");
        AddColumnRelative(0.5);
        Button("Button 2");
        EndPanel("Test Panel");
        DrawInterface();
        RefreshScreen();
    end;
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestBitmapButtonIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    testBitmap := CreateBitmap("test_bitmap", 100, 100);
    buttonClicked := false;
    while QuitRequested() = false do
        ProcessEvents();
        ClearScreen();
        buttonClicked = BitmapButton(testBitmap);;
        DrawInterface();
        RefreshScreen();
    end;
    AssertTrue(buttonClicked);
    FreeBitmap(testBitmap);
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestBitmapButtonAtPositionIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    testBitmap := CreateBitmap("test_bitmap", 100, 100);
    testRectangle := RectangleFrom(100, 100, 100, 100);
    buttonClicked := false;
    while QuitRequested() = false do
        ProcessEvents();
        ClearScreen();
        buttonClicked = BitmapButton(testBitmap, testRectangle);;
        DrawInterface();
        RefreshScreen();
    end;
    AssertTrue(buttonClicked);
    FreeBitmap(testBitmap);
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestBitmapButtonAtPositionWithOptionsIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    testBitmap := CreateBitmap("test_bitmap", 100, 100);
    testRectangle := RectangleFrom(100, 100, 100, 100);
    buttonClicked := false;
    while QuitRequested() = false do
        ProcessEvents();
        ClearScreen();
        buttonClicked = BitmapButton(testBitmap, testRectangle, OptionDefaults());;
        DrawInterface();
        RefreshScreen();
    end;
    AssertTrue(buttonClicked);
    FreeBitmap(testBitmap);
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestBitmapButtonWithOptionsIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    testBitmap := CreateBitmap("test_bitmap", 100, 100);
    testOptions1 := OptionDefaults();
    testOptions2 := OptionScaleBmp(0.5, 0.5, testOptions1);
    buttonClicked := false;
    while QuitRequested() = false do
        ProcessEvents();
        ClearScreen();
        buttonClicked = BitmapButton(testBitmap, testOptions2);;
        DrawInterface();
        RefreshScreen();
    end;
    AssertTrue(buttonClicked);
    FreeBitmap(testBitmap);
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestBitmapButtonLabeledIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    testBitmap := CreateBitmap("test_bitmap", 100, 100);
    buttonClicked := false;
    while QuitRequested() = false do
        ProcessEvents();
        ClearScreen();
        buttonClicked = BitmapButton("Click Me", testBitmap);;
        DrawInterface();
        RefreshScreen();
    end;
    AssertTrue(buttonClicked);
    FreeBitmap(testBitmap);
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestBitmapButtonLabeledWithOptionsIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    testBitmap := CreateBitmap("test_bitmap", 100, 100);
    testOptions1 := OptionDefaults();
    testOptions2 := OptionScaleBmp(0.5, 0.5, testOptions1);
    buttonClicked := false;
    while QuitRequested() = false do
        ProcessEvents();
        ClearScreen();
        buttonClicked = BitmapButton("Click Me", testBitmap, testOptions2);;
        DrawInterface();
        RefreshScreen();
    end;
    AssertTrue(buttonClicked);
    FreeBitmap(testBitmap);
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestButtonAtPositionIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    testRectangle := RectangleFrom(100, 100, 200, 50);
    buttonClicked := false;
    while QuitRequested() = false do
        ProcessEvents();
        ClearScreen();
        buttonClicked = Button("Click Me", testRectangle);;
        DrawInterface();
        RefreshScreen();
    end;
    AssertTrue(buttonClicked);
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestButtonIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    buttonClicked := false;
    while QuitRequested() = false do
        ProcessEvents();
        ClearScreen();
        buttonClicked = Button("Click Me");;
        DrawInterface();
        RefreshScreen();
    end;
    AssertTrue(buttonClicked);
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestButtonLabeledIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    buttonClicked := false;
    while QuitRequested() = false do
        ProcessEvents();
        ClearScreen();
        buttonClicked = Button("Label:", "Click Me");;
        DrawInterface();
        RefreshScreen();
    end;
    AssertTrue(buttonClicked);
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestCheckboxAtPositionIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    testRect := RectangleFrom(100, 100, 200, 50);
    initialCheckboxResult := false;
    currentCheckboxResult := initialCheckboxResult;
    while QuitRequested() = false do
        ProcessEvents();
        ClearScreen();
        currentCheckboxResult = Checkbox("Test Checkbox", currentCheckboxResult, testRect);;
        DrawInterface();
        RefreshScreen();
    end;
    AssertTrue(currentCheckboxResult);
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestCheckboxIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    initialCheckboxResult := false;
    currentCheckboxResult := initialCheckboxResult;
    while QuitRequested() = false do
        ProcessEvents();
        ClearScreen();
        currentCheckboxResult = Checkbox("Test Checkbox", currentCheckboxResult);;
        DrawInterface();
        RefreshScreen();
    end;
    AssertTrue(currentCheckboxResult);
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestCheckboxLabeledIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    initialCheckboxResult := false;
    currentCheckboxResult := initialCheckboxResult;
    while QuitRequested() = false do
        ProcessEvents();
        ClearScreen();
        currentCheckboxResult = Checkbox("Test Checkbox", "Check me", currentCheckboxResult);;
        DrawInterface();
        RefreshScreen();
    end;
    AssertTrue(currentCheckboxResult);
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestColorSliderAtPositionIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    initialColor := ColorBlack();
    currentColor := initialColor;
    while QuitRequested() = false do
        ProcessEvents();
        ClearScreen();
        currentColor = ColorSlider(currentColor, RectangleFrom(300, 300, 400, 24));;
        DrawInterface();
        RefreshScreen();
    end;
    AssertNotEquals(currentColor, initialColor);
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestColorSliderIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    testColor := ColorBlack();
    currentColor := testColor;
    while QuitRequested() = false do
        ProcessEvents();
        ClearScreen();
        currentColor = ColorSlider(currentColor);;
        DrawInterface();
        RefreshScreen();
    end;
    AssertNotEquals(currentColor, testColor);
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestColorSliderLabeledIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    testColor := ColorBlack();
    currentColor := testColor;
    while QuitRequested() = false do
        ProcessEvents();
        ClearScreen();
        currentColor = ColorSlider("Test Color Slider", currentColor);;
        DrawInterface();
        RefreshScreen();
    end;
    AssertNotEquals(testColor, currentColor);
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestDisableInterfaceIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    testPanel := StartPanel("Test Panel", RectangleFrom(100, 100, 200, 200));
    testButton := Button("Test Button");
    ProcessEvents();
    AssertTrue(InterfaceEnabled());
    DisableInterface();
    ProcessEvents();
    AssertFalse(InterfaceEnabled());
    EnableInterface();
    ProcessEvents();
    AssertTrue(InterfaceEnabled());
    EndPanel("Test Panel");
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestDrawInterfaceIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    while QuitRequested() = false do
        ProcessEvents();
        ClearScreen();
        StartPanel("Test Panel", RectangleFrom(100, 100, 200, 200));
        WriteLine("Test Button clicked!");
        EndPanel("Test Panel");
        DrawInterface();
        RefreshScreen();
    end;
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestEnableInterfaceIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    DisableInterface();
    ProcessEvents();
    AssertFalse(InterfaceEnabled());
    EnableInterface();
    ProcessEvents();
    AssertTrue(InterfaceEnabled());
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestEndInsetIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    while QuitRequested() = false do
        ProcessEvents();
        ClearScreen();
        StartInset("Test Inset", 60);
        EndInset("Test Inset");
        DrawInterface();
        RefreshScreen();
    end;
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestEndPanelIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    while QuitRequested() = false do
        ProcessEvents();
        ClearScreen();
        StartPanel("Test Panel", RectangleFrom(100, 100, 200, 200));
        EndPanel("Test Panel");
        DrawInterface();
        RefreshScreen();
    end;
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestEndPopupIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    while QuitRequested() = false do
        ProcessEvents();
        ClearScreen();
        StartPopup("Test Popup");
        EndPopup("Test Popup");
        DrawInterface();
        RefreshScreen();
    end;
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestEndTreenodeIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    while QuitRequested() = false do
        ProcessEvents();
        ClearScreen();
        StartPanel("Test Panel", RectangleFrom(10, 10, 200, 200));
        StartTreenode("Test Node");
        EndTreenode("Test Node");
        EndPanel("Test Panel");
        DrawInterface();
        RefreshScreen();
    end;
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestEnterColumnIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    while QuitRequested() = false do
        ProcessEvents();
        ClearScreen();
        StartPanel("Test Panel", RectangleFrom(10, 10, 300, 200));
        AddColumn(100);
        EnterColumn();
        WriteLine("Button1 clicked!");
        LeaveColumn();
        EndPanel("Test Panel");
        DrawInterface();
        RefreshScreen();
    end;
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestGetInterfaceLabelWidthIntegration;
begin
    testLabelWidth := GetInterfaceLabelWidth();
    AssertEquals(60, testLabelWidth);
end;
procedure TIntegrationTests.TestHeaderIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    while QuitRequested() = false do
        ProcessEvents();
        ClearScreen();
        testHeaderResult := Header("Test Header");
        DrawInterface();
        RefreshScreen();
    end;
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestHSBColorSliderAtPositionIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    testRect := RectangleFrom(100, 100, 200, 100);
    testColor := HSBColorSlider(ColorBlack(), testRect);
    currentColor := testColor;
    while QuitRequested() = false do
        ProcessEvents();
        ClearScreen();
        currentColor = HSBColorSlider(currentColor, testRect);;
        DrawInterface();
        RefreshScreen();
    end;
    AssertNotEquals(currentColor, testColor);
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestHSBColorSliderIntegration;
begin
    testWindow := OpenWindow("HSB Slider Test", 800, 600);
    testColor := ColorBlack();
    currentColor := testColor;
    while QuitRequested() = false do
        ProcessEvents();
        ClearScreen();
        currentColor = HSBColorSlider(currentColor);;
        DrawInterface();
        RefreshScreen();
    end;
    AssertNotEquals(currentColor, testColor);
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestHSBColorSliderLabeledIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    testColor := ColorBlack();
    currentColor := testColor;
    while QuitRequested() = false do
        ProcessEvents();
        ClearScreen();
        currentColor = HSBColorSlider("Color Slider", currentColor);;
        DrawInterface();
        RefreshScreen();
    end;
    AssertNotEquals(testColor, currentColor);
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestInterfaceEnabledIntegration;
begin
    initialState := InterfaceEnabled();
    DisableInterface();
    disabledState := InterfaceEnabled();
    AssertFalse(disabledState);
    EnableInterface();
    enabledState := InterfaceEnabled();
    AssertTrue(enabledState);
end;
procedure TIntegrationTests.TestInterfaceStylePanelIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    testRectangle := RectangleFrom(0, 0, 200, 200);
    while QuitRequested() = false do
        ProcessEvents();
        ClearScreen();
        InterfaceStylePanel(testRectangle);
        DrawInterface();
        RefreshScreen();
    end;
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestLabelElementIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    while QuitRequested() = false do
        ProcessEvents();
        ClearScreen();
        LabelElement("Test Label");
        DrawInterface();
        RefreshScreen();
    end;
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestLabelElementAtPositionIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    testRectangle := RectangleFrom(100, 100, 200, 50);
    while QuitRequested() = false do
        ProcessEvents();
        ClearScreen();
        LabelElement("Test Label", testRectangle);
        DrawInterface();
        RefreshScreen();
    end;
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestLastElementChangedIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    while QuitRequested() = false do
        ProcessEvents();
        ClearScreen();
        Slider("Test Slider", 0.0, 0.0, 100.0);
        DrawInterface();
        RefreshScreen();
    end;
    AssertTrue(LastElementChanged());
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestLastElementConfirmedIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    while QuitRequested() = false do
        ProcessEvents();
        ClearScreen();
        testButton := Button("Test Button");
        DrawInterface();
        RefreshScreen();
    end;
    AssertTrue(LastElementConfirmed());
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestLeaveColumnIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    buttonResult := false;
    while QuitRequested() = false do
        ProcessEvents();
        ClearScreen();
        StartPanel("Test Panel", RectangleFrom(10, 10, 300, 200));
        StartCustomLayout();
        AddColumn(100);
        EnterColumn();
        LeaveColumn();
        buttonResult = Button("Test Button");;
        EndPanel("Test Panel");
        DrawInterface();
        RefreshScreen();
    end;
    AssertTrue(buttonResult);
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestNumberBoxAtPositionIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    testRect := RectangleFrom(100, 100, 200, 30);
    testResult := 5.0;
    while QuitRequested() = false do
        ProcessEvents();
        ClearScreen();
        testResult = NumberBox(testResult, 1.0, testRect);;
        DrawInterface();
        RefreshScreen();
    end;
    AssertTrue((testResult >= 1.0) and (testResult <= 5.0));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestNumberBoxIntegration;
begin
    testWindow := OpenWindow("Number Box Test", 800, 600);
    testResult := 5.0;
    while QuitRequested() = false do
        ProcessEvents();
        ClearScreen();
        testResult = NumberBox(testResult, 1.0);;
        DrawInterface();
        RefreshScreen();
    end;
    AssertTrue((testResult >= 1.0) and (testResult <= 5.0));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestNumberBoxLabeledIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    testResult := 5.0;
    while QuitRequested() = false do
        ProcessEvents();
        ClearScreen();
        testResult = NumberBox("Test Value", testResult, 1.0);;
        DrawInterface();
        RefreshScreen();
    end;
    AssertTrue((testResult >= 1.0) and (testResult <= 5.0));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestOpenPopupIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    while QuitRequested() = false do
        ProcessEvents();
        ClearScreen();
        StartPopup("Test Popup");
        EndPopup("Test Popup");
        DrawInterface();
        RefreshScreen();
    end;
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestParagraphIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    SetInterfaceFont(LoadFont("hara", "hara.ttf"));
    SetInterfaceFontSize(12);
    while QuitRequested() = false do
        ProcessEvents();
        ClearScreen();
        Paragraph("This is a test paragraph to check if the text wraps correctly.");
        DrawInterface();
        RefreshScreen();
    end;
    FreeFont(FontNamed("hara"));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestParagraphAtPositionIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    testRectangle := RectangleFrom(100, 100, 200, 100);
    while QuitRequested() = false do
        ProcessEvents();
        ClearScreen();
        Paragraph("This is a test paragraph.", testRectangle);
        DrawInterface();
        RefreshScreen();
    end;
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestResetLayoutIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    while QuitRequested() = false do
        ProcessEvents();
        ClearScreen();
        StartCustomLayout();
        AddColumn(200);
        AddColumn(-1);
        ResetLayout();
        DrawInterface();
        RefreshScreen();
    end;
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestSetInterfaceAccentColorIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    SetInterfaceAccentColor(ColorRed(), 0.5);
    while QuitRequested() = false do
        ProcessEvents();
        ClearScreen();
        Button("Test Button");
        DrawInterface();
        RefreshScreen();
    end;
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestSetInterfaceBorderColorIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    SetInterfaceBorderColor(ColorRed());
    while QuitRequested() = false do
        ProcessEvents();
        ClearScreen();
        StartPanel("Test Panel", RectangleFrom(100, 100, 200, 100));
        Button("Test Button");
        EndPanel("Test Panel");
        DrawInterface();
        RefreshScreen();
    end;
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestSetInterfaceColorsAutoIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    SetInterfaceColorsAuto(ColorWhite(), ColorBlue(), 0.5, 0.7, 0.3);
    while QuitRequested() = false do
        ProcessEvents();
        ClearScreen();
        StartPanel("Test Panel", RectangleFrom(100, 100, 200, 200));
        Button("Test Button");
        EndPanel("Test Panel");
        DrawInterface();
        RefreshScreen();
    end;
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestSetInterfaceElementColorIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    while QuitRequested() = false do
        ProcessEvents();
        ClearScreen();
        SetInterfaceElementColor(ColorBlack(), 0.5);
        StartPanel("Test Panel", RectangleFrom(100, 100, 200, 200));
        Button("Test Button");
        EndPanel("Test Panel");
        DrawInterface();
        RefreshScreen();
    end;
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestSetInterfaceElementShadowsIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    while QuitRequested() = false do
        ProcessEvents();
        ClearScreen();
        StartPanel("Test Panel", RectangleFrom(100, 100, 200, 200));
        Button("Test Button");
        EndPanel("Test Panel");
        DrawInterface();
        RefreshScreen();
    end;
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestSetInterfaceFontFontAsStringIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    testFont := LoadFont("hara", "hara.ttf");
    SetInterfaceFont("hara");
    while QuitRequested() = false do
        ProcessEvents();
        ClearScreen();
        LabelElement("Test Text");
        DrawInterface();
        RefreshScreen();
    end;
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestSetInterfaceFontIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    testFont := LoadFont("hara", "hara.ttf");
    SetInterfaceFont(testFont);
    while QuitRequested() = false do
        ProcessEvents();
        ClearScreen();
        LabelElement("Test Text");
        DrawInterface();
        RefreshScreen();
    end;
    FreeFont(testFont);
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestSetInterfaceFontSizeIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    SetInterfaceFontSize(16);
    while QuitRequested() = false do
        ProcessEvents();
        ClearScreen();
        LabelElement("Test Text");
        DrawInterface();
        RefreshScreen();
    end;
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestSetInterfaceLabelWidthIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    SetInterfaceLabelWidth(100);
    while QuitRequested() = false do
        ProcessEvents();
        ClearScreen();
        testWidth := GetInterfaceLabelWidth();
        DrawInterface();
        RefreshScreen();
    end;
    AssertEquals(100, GetInterfaceLabelWidth());
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestSetInterfacePanelShadowsIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    SetInterfacePanelShadows(10, RGBAColor(0, 0, 0, 128), PointAt(5, 5));
    while QuitRequested() = false do
        ProcessEvents();
        ClearScreen();
        StartPanel("Test Panel", RectangleFrom(100, 100, 200, 150));
        EndPanel("Test Panel");
        DrawInterface();
        RefreshScreen();
    end;
    AssertEquals(RGBAColor(0, 0, 0, 128), GetPixel(PointAt(105, 105)));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestSetInterfaceRootTextColorIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    SetInterfaceRootTextColor(ColorRed());
    while QuitRequested() = false do
        ProcessEvents();
        ClearScreen();
        LabelElement("Test Text", RectangleFrom(100, 100, 200, 50));
        DrawInterface();
        RefreshScreen();
    end;
    AssertEquals(ColorRed(), GetPixel(PointAt(105, 105)));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestSetInterfaceShadowsIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    SetInterfaceShadows(10, RGBAColor(0, 0, 0, 128), PointAt(5, 5));
    while QuitRequested() = false do
        ProcessEvents();
        ClearScreen();
        StartPanel("Test Panel", RectangleFrom(100, 100, 200, 200));
        Button("Test Button");
        EndPanel("Test Panel");
        DrawInterface();
        RefreshScreen();
    end;
    AssertEquals(RGBAColor(0, 0, 0, 128), GetPixel(PointAt(105, 105)));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestSetInterfaceSpacingIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    SetInterfaceSpacing(10, 5);
    while QuitRequested() = false do
        ProcessEvents();
        ClearScreen();
        StartPanel("Test Panel", RectangleFrom(100, 100, 200, 200));
        Button("Button 1");
        Button("Button 2");
        EndPanel("Test Panel");
        DrawInterface();
        RefreshScreen();
    end;
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestSetInterfaceStyleIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    SetInterfaceStyle(InterfaceStyle.SHADED_DARK_STYLE);
    while QuitRequested() = false do
        ProcessEvents();
        ClearScreen();
        StartPanel("Test Panel", RectangleFrom(100, 100, 200, 200));
        Button("Test Button");
        EndPanel("Test Panel");
        DrawInterface();
        RefreshScreen();
    end;
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestSetInterfaceStyleWithColorIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    SetInterfaceStyle(InterfaceStyle.SHADED_DARK_STYLE, ColorBlue());
    while QuitRequested() = false do
        ProcessEvents();
        ClearScreen();
        testPanel := StartPanel("Test Panel", RectangleFrom(100, 100, 200, 200));
        Button("Test Button");
        EndPanel("Test Panel");
        DrawInterface();
        RefreshScreen();
    end;
    AssertEquals(ColorBlue(), GetPixel(PointAt(150, 150)));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestSetInterfaceTextColorIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    SetInterfaceTextColor(ColorRed());
    while QuitRequested() = false do
        ProcessEvents();
        ClearScreen();
        LabelElement("Test Text");
        DrawInterface();
        RefreshScreen();
    end;
    AssertEquals(ColorRed(), GetPixel(PointAt(10, 10)));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestSetLayoutHeightIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    SetLayoutHeight(50);
    while QuitRequested() = false do
        ProcessEvents();
        ClearScreen();
        StartPanel("Test Panel", RectangleFrom(0, 0, 800, 600));
        Button("Test Button");
        EndPanel("Test Panel");
        DrawInterface();
        RefreshScreen();
    end;
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestSingleLineLayoutIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    SingleLineLayout();
    while QuitRequested() = false do
        ProcessEvents();
        ClearScreen();
        testButton1 := Button("Button1");
        testButton2 := Button("Button2");
        ResetLayout();
        DrawInterface();
        RefreshScreen();
    end;
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestSliderAtPositionIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    testRect := RectangleFrom(100, 100, 200, 20);
    initialValue := 50.0;
    sliderResult := initialValue;
    while QuitRequested() = false do
        ProcessEvents();
        ClearScreen();
        sliderResult = Slider(sliderResult, 0.0, 100.0, testRect);;
        DrawInterface();
        RefreshScreen();
    end;
    AssertNotEquals(initialValue, sliderResult);
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestSliderIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    initialValue := 50.0;
    sliderResult := initialValue;
    while QuitRequested() = false do
        ProcessEvents();
        ClearScreen();
        sliderResult = Slider(sliderResult, 0.0, 100.0);;
        DrawInterface();
        RefreshScreen();
    end;
    AssertNotEquals(initialValue, sliderResult);
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestSliderLabeledIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    initialValue := 50.0;
    sliderResult := initialValue;
    while QuitRequested() = false do
        ProcessEvents();
        ClearScreen();
        sliderResult = Slider("Test Slider", sliderResult, 0.0, 100.0);;
        DrawInterface();
        RefreshScreen();
    end;
    AssertNotEquals(initialValue, sliderResult);
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestSplitIntoColumnsIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    while QuitRequested() = false do
        ProcessEvents();
        ClearScreen();
        StartPanel("Test Panel", RectangleFrom(0, 0, 800, 600));
        SplitIntoColumns(3);
        Button("Button 1");
        Button("Button 2");
        Button("Button 3");
        EndPanel("Test Panel");
        DrawInterface();
        RefreshScreen();
    end;
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestSplitIntoColumnsWithLastWidthIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    while QuitRequested() = false do
        ProcessEvents();
        ClearScreen();
        StartPanel("Test Panel", RectangleFrom(0, 0, 800, 600));
        SplitIntoColumns(3, 200);
        Button("Button 1");
        Button("Button 2");
        Button("Button 3");
        EndPanel("Test Panel");
        DrawInterface();
        RefreshScreen();
    end;
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestSplitIntoColumnsRelativeWithLastWidthIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    while QuitRequested() = false do
        ProcessEvents();
        ClearScreen();
        StartPanel("Test Panel", RectangleFrom(0, 0, 800, 600));
        SplitIntoColumnsRelative(3, 0.5);
        Button("Button 1");
        Button("Button 2");
        Button("Button 3");
        EndPanel("Test Panel");
        DrawInterface();
        RefreshScreen();
    end;
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestStartCustomLayoutIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    buttonResult := false;
    while QuitRequested() = false do
        ProcessEvents();
        ClearScreen();
        StartCustomLayout();
        AddColumn(200);
        buttonResult = Button("Test Button");;
        ResetLayout();
        DrawInterface();
        RefreshScreen();
    end;
    CloseWindow(testWindow);
    AssertTrue(buttonResult);
end;
procedure TIntegrationTests.TestStartInsetAtPositionIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    testRect := RectangleFrom(100, 100, 200, 200);
    while QuitRequested() = false do
        ProcessEvents();
        ClearScreen();
        StartInset("test_inset", testRect);
        Button("Test Button");
        EndInset("test_inset");
        DrawInterface();
        RefreshScreen();
    end;
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestStartInsetIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    while QuitRequested() = false do
        ProcessEvents();
        ClearScreen();
        StartInset("Test Inset", 100);
        Button("Test Button");
        EndInset("Test Inset");
        DrawInterface();
        RefreshScreen();
    end;
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestStartPanelIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    testRectangle := RectangleFrom(100, 100, 200, 150);
    while QuitRequested() = false do
        ProcessEvents();
        ClearScreen();
        StartPanel("Test Panel", testRectangle);
        Button("Test Button");
        EndPanel("Test Panel");
        DrawInterface();
        RefreshScreen();
    end;
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestStartPopupIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    while QuitRequested() = false do
        ProcessEvents();
        ClearScreen();
        StartPopup("Test Popup");
        Button("Test Button");
        EndPopup("Test Popup");
        DrawInterface();
        RefreshScreen();
    end;
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestStartTreenodeIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    while QuitRequested() = false do
        ProcessEvents();
        ClearScreen();
        StartPanel("Test Panel", RectangleFrom(0, 0, 800, 600));
        StartTreenode("Test Node");
        Button("Test Button1");
        Button("Test Button2");
        Button("Test Button3");
        EndTreenode("Test Node");
        EndPanel("Test Panel");
        DrawInterface();
        RefreshScreen();
    end;
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestTextBoxIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    initialText := "Initial Text";
    textResult := initialText;
    while QuitRequested() = false do
        ProcessEvents();
        ClearScreen();
        textResult = TextBox(textResult);;
        DrawInterface();
        RefreshScreen();
    end;
    AssertNotEquals(initialText, textResult);
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestTextBoxAtPositionIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    testRect := RectangleFrom(100, 100, 200, 30);
    initialText := "Initial Text";
    textResult := initialText;
    while QuitRequested() = false do
        ProcessEvents();
        ClearScreen();
        textResult = TextBox(textResult, testRect);;
        DrawInterface();
        RefreshScreen();
    end;
    AssertNotEquals(initialText, textResult);
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestTextBoxLabeledIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    initialText := "Initial Text";
    textResult := initialText;
    while QuitRequested() = false do
        ProcessEvents();
        ClearScreen();
        textResult = TextBox("Enter Name", textResult);;
        DrawInterface();
        RefreshScreen();
    end;
    AssertNotEquals(initialText, textResult);
    CloseWindow(testWindow);
end;
end;

procedure RegisterTests;
begin
#<Proc:0x00007f7a8f3c6228 /mnt/c/Users/Noahc/Documents/.Year 2 Semester 3/Team Project (A)/Github Repo/splashkit_test_generator/test_generator/config/languages/pascal_config.rb:117 (lambda)>
end;
