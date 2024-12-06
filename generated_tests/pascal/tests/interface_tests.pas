uses SplashKit, TestFramework

type
TIntegrationTests = class(TTestCase)
published
procedure TIntegrationTests.TestAddColumnIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    testPanel := StartPanel("Test Panel", RectangleFrom(0, 0, 800, 600));
    StartCustomLayout();
    AddColumn(100);
    AddColumn(-1);
    Button("Test Button");
    EndPanel("Test Panel");
    DrawInterface();
    RefreshScreen();
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestAddColumnRelativeIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    StartPanel("Test Panel", RectangleFrom(0, 0, 800, 600));
    StartCustomLayout();
    AddColumnRelative(0.5);
    Button("Button 1");
    AddColumnRelative(0.5);
    Button("Button 2");
    EndPanel("Test Panel");
    DrawInterface();
    RefreshScreen();
    AssertTrue(PointInRectangle(PointAt(200, 300), RectangleFrom(0, 0, 400, 600)));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestBitmapButtonIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    testBitmap := CreateBitmap("test_bitmap", 100, 100);
    ProcessEvents();
    SimulateMouseClick(Mousebutton.LEFT);
    ProcessEvents();
    buttonClicked := BitmapButton(testBitmap);
    AssertTrue(buttonClicked);
    FreeBitmap(testBitmap);
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestBitmapButtonAtPositionIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    testBitmap := CreateBitmap("test_bitmap", 100, 100);
    testRectangle := RectangleFrom(100, 100, 100, 100);
    ProcessEvents();
    SimulateMouseClick(Mousebutton.LEFT);
    ProcessEvents();
    buttonClicked := BitmapButton(testBitmap, testRectangle);
    AssertTrue(buttonClicked);
    FreeBitmap(testBitmap);
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestBitmapButtonAtPositionWithOptionsIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    testBitmap := CreateBitmap("test_bitmap", 100, 100);
    testRectangle := RectangleFrom(100, 100, 100, 100);
    testOptions := OptionDefaults();
    buttonClicked := BitmapButton(testBitmap, testRectangle, testOptions);
    ProcessEvents();
    SimulateMouseClick(Mousebutton.LEFT);
    ProcessEvents();
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
    ProcessEvents();
    SimulateMouseClick(Mousebutton.LEFT);
    ProcessEvents();
    buttonClicked := BitmapButton(testBitmap, testOptions2);
    AssertTrue(buttonClicked);
    FreeBitmap(testBitmap);
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestBitmapButtonLabeledIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    testBitmap := CreateBitmap("test_bitmap", 100, 100);
    ProcessEvents();
    buttonClicked1 := BitmapButton("Click Me", testBitmap);
    AssertFalse(buttonClicked1);
    SimulateMouseClick(Mousebutton.LEFT);
    ProcessEvents();
    buttonClicked2 := BitmapButton("Click Me", testBitmap);
    AssertTrue(buttonClicked2);
    FreeBitmap(testBitmap);
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestBitmapButtonLabeledWithOptionsIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    testBitmap := CreateBitmap("test_bitmap", 100, 100);
    testOptions1 := OptionDefaults();
    testOptions2 := OptionScaleBmp(0.5, 0.5, testOptions1);
    ProcessEvents();
    SimulateMouseClick(Mousebutton.LEFT);
    ProcessEvents();
    buttonClicked := BitmapButton("Click Me", testBitmap, testOptions2);
    AssertTrue(buttonClicked);
    FreeBitmap(testBitmap);
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestButtonAtPositionIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    testRectangle := RectangleFrom(100, 100, 200, 50);
    ProcessEvents();
    buttonClicked1 := Button("Click Me", testRectangle);
    AssertFalse(buttonClicked1);
    SimulateMouseClick(Mousebutton.LEFT);
    ProcessEvents();
    buttonClicked2 := Button("Click Me", testRectangle);
    AssertTrue(buttonClicked2);
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestButtonIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    testPanel := StartPanel("Test Panel", RectangleFrom(100, 100, 200, 100));
    ProcessEvents();
    buttonClicked1 := Button("Click Me");
    AssertFalse(buttonClicked1);
    SimulateMouseClick(Mousebutton.LEFT);
    ProcessEvents();
    buttonClicked2 := Button("Click Me");
    AssertTrue(buttonClicked2);
    EndPanel("Test Panel");
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestButtonLabeledIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    ProcessEvents();
    buttonResult1 := Button("Label:", "Click Me");
    AssertFalse(buttonResult1);
    SimulateMouseClick(Mousebutton.LEFT);
    ProcessEvents();
    buttonResult2 := Button("Label:", "Click Me");
    AssertTrue(buttonResult2);
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestCheckboxAtPositionIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    testRect := RectangleFrom(100, 100, 200, 50);
    ProcessEvents();
    testCheckboxResult1 := Checkbox("Test Checkbox", false, testRect);
    AssertFalse(testCheckboxResult1);
    SimulateMouseClick(Mousebutton.LEFT);
    ProcessEvents();
    testCheckboxResult2 := Checkbox("Test Checkbox", testCheckboxResult1, testRect);
    AssertTrue(testCheckboxResult2);
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestCheckboxIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    ProcessEvents();
    testCheckboxResult1 := Checkbox("Test Checkbox", false);
    AssertFalse(testCheckboxResult1);
    SimulateMouseClick(Mousebutton.LEFT);
    ProcessEvents();
    testCheckboxResult2 := Checkbox("Test Checkbox", testCheckboxResult1);
    AssertTrue(testCheckboxResult2);
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestCheckboxLabeledIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    ProcessEvents();
    testCheckboxResult1 := Checkbox("Test Checkbox", "Check me", false);
    AssertFalse(testCheckboxResult1);
    SimulateMouseClick(Mousebutton.LEFT);
    ProcessEvents();
    testCheckboxResult2 := Checkbox("Test Checkbox", "Check me", testCheckboxResult1);
    AssertTrue(testCheckboxResult2);
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestColorSliderAtPositionIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    testColor := ColorBlack();
    testRect := RectangleFrom(100, 100, 200, 100);
    resultColor := ColorSlider(testColor, testRect);
    ProcessEvents();
    SimulateMouseClick(Mousebutton.LEFT);
    ProcessEvents();
    AssertNotEquals(testColor, resultColor);
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestColorSliderIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    testColor := ColorBlack();
    resultColor := ColorSlider(testColor);
    DrawInterface();
    RefreshScreen();
    AssertNotEquals(testColor, resultColor);
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestColorSliderLabeledIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    testColor := ColorBlack();
    resultColor := ColorSlider("Test Color Slider", testColor);
    ProcessEvents();
    AssertNotEquals(resultColor, ColorBlack());
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
    StartPanel("Test Panel", RectangleFrom(100, 100, 200, 200));
    Button("Test Button");
    EndPanel("Test Panel");
    DrawInterface();
    RefreshScreen();
    AssertEquals(GetPixel(PointAt(150, 150)), ColorBlack());
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
    StartInset("Test Inset", 60);
    EndInset("Test Inset");
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestEndPanelIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    testPanel := StartPanel("Test Panel", RectangleFrom(100, 100, 200, 200));
    EndPanel("Test Panel");
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestEndPopupIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    testPopup := StartPopup("Test Popup");
    EndPopup("Test Popup");
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestEndTreenodeIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    StartPanel("Test Panel", RectangleFrom(10, 10, 200, 200));
    testNode := StartTreenode("Test Node");
    EndTreenode("Test Node");
    EndPanel("Test Panel");
    DrawInterface();
    RefreshScreen();
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestEnterColumnIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    testPanel := StartPanel("Test Panel", RectangleFrom(10, 10, 300, 200));
    AddColumn(100);
    EnterColumn();
    Button("Button1");
    LeaveColumn();
    EndPanel("Test Panel");
    DrawInterface();
    RefreshScreen();
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestGetInterfaceLabelWidthIntegration;
begin
    testLabelWidth := GetInterfaceLabelWidth();
    AssertEquals(testLabelWidth, 60);
end;
procedure TIntegrationTests.TestHeaderIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    ProcessEvents();
    testHeaderResult := Header("Test Header");
    AssertNotNull(testHeaderResult);
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestHSBColorSliderAtPositionIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    testColor := HSBColor(0.5, 1.0, 0.5);
    testRect := RectangleFrom(100, 100, 200, 100);
    resultColor := HSBColorSlider(testColor, testRect);
    ProcessEvents();
    AssertNotEquals(testColor, resultColor);
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestHSBColorSliderIntegration;
begin
    testWindow := OpenWindow("HSB Slider Test", 800, 600);
    testColor := ColorBlack();
    resultColor := HSBColorSlider(testColor);
    DrawInterface();
    RefreshScreen();
    AssertNotEquals(testColor, resultColor);
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestHSBColorSliderLabeledIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    testColor := ColorBlack();
    testResultColor := HSBColorSlider("Color Slider", testColor);
    ProcessEvents();
    AssertNotEquals(testResultColor, ColorBlack());
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
    InterfaceStylePanel(testRectangle);
    RefreshScreen();
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestLabelElementIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    LabelElement("Test Label");
    DrawInterface();
    RefreshScreen();
    AssertTrue(PixelDrawnAtPoint(PointAt(10, 10)));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestLabelElementAtPositionIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    testRectangle := RectangleFrom(100, 100, 200, 50);
    LabelElement("Test Label", testRectangle);
    RefreshScreen();
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestLastElementChangedIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    ProcessEvents();
    Slider("Test Slider", 0.0, 0.0, 100.0);
    ProcessEvents();
    AssertFalse(LastElementChanged());
    SimulateMouseMove(100, 100);
    SimulateMouseDown(Mousebutton.LEFT);
    SimulateMouseMove(200, 200);
    SimulateMouseUp(Mousebutton.LEFT);
    ProcessEvents();
    AssertTrue(LastElementChanged());
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestLastElementConfirmedIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    testButton := Button("Test Button");
    ProcessEvents();
    AssertFalse(LastElementConfirmed());
    SimulateMouseClick(Mousebutton.LEFT);
    ProcessEvents();
    AssertTrue(LastElementConfirmed());
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestLeaveColumnIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    StartPanel("Test Panel", RectangleFrom(10, 10, 300, 200));
    StartCustomLayout();
    AddColumn(100);
    EnterColumn();
    LeaveColumn();
    buttonResult := Button("Test Button");
    AssertFalse(buttonResult);
    EndPanel("Test Panel");
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestNumberBoxAtPositionIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    testRect := RectangleFrom(100, 100, 200, 30);
    testResult := NumberBox(5.0, 1.0, testRect);
    ProcessEvents();
    AssertTrue((testResult >= 4.0) and (testResult <= 6.0));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestNumberBoxIntegration;
begin
    testWindow := OpenWindow("Number Box Test", 800, 600);
    ProcessEvents();
    testResult := NumberBox(5.0, 1.0);
    AssertTrue((testResult >= 4.0) and (testResult <= 6.0));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestNumberBoxLabeledIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    testResult := NumberBox("Test Value", 5.0, 1.0);
    AssertTrue((testResult >= 4.0) and (testResult <= 6.0));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestOpenPopupIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    testPopup := StartPopup("Test Popup");
    ProcessEvents();
    OpenPopup("Test Popup");
    ProcessEvents();
    AssertTrue(popupIsOpen);
    EndPopup("Test Popup");
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestParagraphIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    SetInterfaceFont(LoadFont("test_font", "arial.ttf"));
    SetInterfaceFontSize(12);
    Paragraph("This is a test paragraph to check if the text wraps correctly.");
    DrawInterface();
    RefreshScreen();
    AssertEquals(GetPixel(PointAt(10, 10)), ColorBlack());
    FreeFont(FontNamed("test_font"));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestParagraphAtPositionIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    testRectangle := RectangleFrom(100, 100, 200, 100);
    Paragraph("This is a test paragraph.", testRectangle);
    RefreshScreen();
    AssertEquals(GetPixel(PointAt(RectangleLeft(testRectangle), RectangleTop(testRectangle))), ColorBlack());
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestResetLayoutIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    StartCustomLayout();
    AddColumn(200);
    AddColumn(-1);
    ResetLayout();
    DrawInterface();
    RefreshScreen();
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestSetInterfaceAccentColorIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    SetInterfaceAccentColor(ColorRed(), 0.5);
    Button("Test Button");
    DrawInterface();
    RefreshScreen();
    AssertEquals(GetPixel(PointAt(10, 10)), ColorRed());
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestSetInterfaceBorderColorIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    SetInterfaceBorderColor(ColorRed());
    StartPanel("Test Panel", RectangleFrom(100, 100, 200, 100));
    Button("Test Button");
    EndPanel("Test Panel");
    DrawInterface();
    RefreshScreen();
    AssertEquals(GetPixel(100, 100), ColorRed());
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestSetInterfaceColorsAutoIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    SetInterfaceColorsAuto(ColorWhite(), ColorBlue(), 0.5, 0.7, 0.3);
    StartPanel("Test Panel", RectangleFrom(100, 100, 200, 200));
    Button("Test Button");
    EndPanel("Test Panel");
    DrawInterface();
    RefreshScreen();
    AssertEquals(GetPixel(150, 150), ColorBlue());
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestSetInterfaceElementColorIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    SetInterfaceElementColor(ColorBlack(), 0.5);
    StartPanel("Test Panel", RectangleFrom(100, 100, 200, 200));
    Button("Test Button");
    EndPanel("Test Panel");
    DrawInterface();
    RefreshScreen();
    AssertEquals(GetPixel(150, 150), ColorBlack());
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestSetInterfaceElementShadowsIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    SetInterfaceElementShadows(10, ColorBlack(), PointAt(5, 5));
    StartPanel("Test Panel", RectangleFrom(100, 100, 200, 200));
    Button("Test Button");
    EndPanel("Test Panel");
    DrawInterface();
    RefreshScreen();
    AssertTrue(PixelDrawnAtPoint(PointAt(105, 105)));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestSetInterfaceFontFontAsStringIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    SetInterfaceFont("Arial");
    LabelElement("Test Text");
    DrawInterface();
    RefreshScreen();
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestSetInterfaceFontIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    testFont := LoadFont("test_font", "arial.ttf");
    SetInterfaceFont(testFont);
    LabelElement("Test Text");
    DrawInterface();
    RefreshScreen();
    FreeFont(testFont);
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestSetInterfaceFontSizeIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    SetInterfaceFontSize(16);
    LabelElement("Test Text");
    DrawInterface();
    AssertTrue(PixelDrawnAtPoint(PointAt(10, 20)));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestSetInterfaceLabelWidthIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    SetInterfaceLabelWidth(100);
    testWidth := GetInterfaceLabelWidth();
    AssertEquals(testWidth, 100);
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestSetInterfacePanelShadowsIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    SetInterfacePanelShadows(10, RGBAColor(0, 0, 0, 128), PointAt(5, 5));
    panelVisible := StartPanel("Test Panel", RectangleFrom(100, 100, 200, 150));
    EndPanel("Test Panel");
    DrawInterface();
    RefreshScreen();
    AssertEquals(GetPixel(PointAt(105, 105)), RGBAColor(0, 0, 0, 128));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestSetInterfaceRootTextColorIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    SetInterfaceRootTextColor(ColorRed());
    LabelElement("Test Text", RectangleFrom(100, 100, 200, 50));
    RefreshScreen();
    AssertTrue(PixelDrawnAtPoint(ColorRed(), 105, 105));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestSetInterfaceShadowsIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    SetInterfaceShadows(10, RGBAColor(0, 0, 0, 128), PointAt(5, 5));
    panelVisible := StartPanel("Test Panel", RectangleFrom(100, 100, 200, 200));
if AssertTrue(panelVisible);
 then
        Button("Test Button");
        EndPanel("Test Panel");
        DrawInterface();
        RefreshScreen();
        AssertTrue(PixelDrawnAtPoint(PointAt(105, 105)));
end;
end;
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestSetInterfaceSpacingIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    SetInterfaceSpacing(10, 5);
    testPanel := StartPanel("Test Panel", RectangleFrom(100, 100, 200, 200));
    Button("Button 1");
    Button("Button 2");
    EndPanel("Test Panel");
    DrawInterface();
    RefreshScreen();
    AssertTrue(PixelDrawnAtPoint(PointAt(110, 110)));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestSetInterfaceStyleIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    SetInterfaceStyle(InterfaceStyle.DARK);
    Button("Test Button");
    DrawInterface();
    RefreshScreen();
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestSetInterfaceStyleWithColorIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    SetInterfaceStyle(InterfaceStyle.DARK, ColorBlue());
    testPanel := StartPanel("Test Panel", RectangleFrom(100, 100, 200, 200));
    Button("Test Button");
    DrawInterface();
    RefreshScreen();
    AssertEquals(GetPixel(PointAt(150, 150)), ColorBlue());
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestSetInterfaceTextColorIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    SetInterfaceTextColor(ColorRed());
    LabelElement("Test Text");
    DrawInterface();
    RefreshScreen();
    AssertEquals(GetPixel(PointAt(10, 10)), ColorRed());
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestSetLayoutHeightIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    testPanel := StartPanel("Test Panel", RectangleFrom(0, 0, 800, 600));
    SetLayoutHeight(50);
    Button("Test Button");
    EndPanel("Test Panel");
    DrawInterface();
    RefreshScreen();
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestSingleLineLayoutIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    SingleLineLayout();
    testButton1 := Button("Button1");
    testButton2 := Button("Button2");
    ResetLayout();
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestSliderAtPositionIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    testRect := RectangleFrom(100, 100, 200, 20);
    ProcessEvents();
    sliderResult := Slider(50.0, 0.0, 100.0, testRect);
    AssertTrue((sliderResult >= 0.0) and (sliderResult <= 100.0));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestSliderIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    ProcessEvents();
    testSliderResult := Slider(50.0, 0.0, 100.0);
    AssertTrue((testSliderResult >= 0.0) and (testSliderResult <= 100.0));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestSliderLabeledIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    testSliderValue := Slider("Test Slider", 50.0, 0.0, 100.0);
    AssertTrue((testSliderValue >= 0.0) and (testSliderValue <= 100.0));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestSplitIntoColumnsIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    StartPanel("Test Panel", RectangleFrom(0, 0, 800, 600));
    SplitIntoColumns(3);
    EndPanel("Test Panel");
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestSplitIntoColumnsWithLastWidthIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    testPanel := StartPanel("Test Panel", RectangleFrom(0, 0, 800, 600));
    SplitIntoColumns(3, 200);
    Button("Button 1");
    Button("Button 2");
    Button("Button 3");
    EndPanel("Test Panel");
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestSplitIntoColumnsRelativeWithLastWidthIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    testPanel := StartPanel("Test Panel", RectangleFrom(0, 0, 800, 600));
    SplitIntoColumnsRelative(3, 0.5);
    Button("Button 1");
    Button("Button 2");
    Button("Button 3");
    EndPanel("Test Panel");
    DrawInterface();
    RefreshScreen();
    AssertTrue(PointInRectangle(PointAt(200, 300), RectangleFrom(0, 0, 200, 600)));
    AssertTrue(PointInRectangle(PointAt(600, 300), RectangleFrom(400, 0, 400, 600)));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestStartCustomLayoutIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    StartCustomLayout();
    AddColumn(200);
    buttonResult := Button("Test Button");
    ResetLayout();
    CloseWindow(testWindow);
    AssertTrue(buttonResult);
end;
procedure TIntegrationTests.TestStartInsetAtPositionIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    testRect := RectangleFrom(100, 100, 200, 200);
    StartInset("test_inset", testRect);
    EndInset("test_inset");
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestStartInsetIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    StartPanel("Test Panel", RectangleFrom(100, 100, 300, 300));
    StartInset("Test Inset", 100);
    Button("Test Button");
    EndInset("Test Inset");
    EndPanel("Test Panel");
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestStartPanelIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    testRectangle := RectangleFrom(100, 100, 200, 150);
    panelVisible := StartPanel("Test Panel", testRectangle);
    AssertTrue(panelVisible);
    EndPanel("Test Panel");
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestStartPopupIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    popupVisible := StartPopup("Test Popup");
    AssertTrue(popupVisible);
    EndPopup("Test Popup");
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestStartTreenodeIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    StartPanel("Test Panel", RectangleFrom(0, 0, 800, 600));
    testNodeExpanded := StartTreenode("Test Node");
    AssertTrue(testNodeExpanded);
    EndTreenode("Test Node");
    EndPanel("Test Panel");
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestTextBoxIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    testTextBoxResult := TextBox("Initial Text");
    ProcessEvents();
    AssertEquals(testTextBoxResult, "Initial Text");
    SimulateKeyPress(Keycode.A);
    ProcessEvents();
    testTextBoxResultUpdated := TextBox(testTextBoxResult);
    AssertEquals(testTextBoxResultUpdated, "Initial TextA");
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestTextBoxAtPositionIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    testRect := RectangleFrom(100, 100, 200, 30);
    ProcessEvents();
    testResult1 := TextBox("Initial Text", testRect);
    AssertEquals(testResult2, "Initial Text");
    SimulateKeyPress(Keycode.A);
    ProcessEvents();
    testResult2 := TextBox(testResult1, testRect);
    AssertEquals(testResult1, "Initial TextA");
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestTextBoxLabeledIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    testTextBoxResult := TextBox("Enter Name", "John");
    ProcessEvents();
    AssertEquals(testTextBoxResult, "John");
    CloseWindow(testWindow);
end;
end;

procedure RegisterTests;
begin
TestFramework.RegisterTest(TIntegrationTests.Suite);
end;
