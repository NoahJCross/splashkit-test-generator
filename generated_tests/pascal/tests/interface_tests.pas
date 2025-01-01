uses SplashKit, TestFramework, ../Helpers;
type
    TTestInterface = class(TTestCase)
    protected
        procedure Setup; override;
    end;
begin
    inherited;
    SetResourcesPath('/mnt/c/Users/Noahc/Documents/aYear_2_semester_2/TeamProject/GitHubRepo/splashkit_test_generator/resources');
end;
procedure TestAddColumnIntegration;
begin
    testWindow := OpenWindow('Test Window', 800, 600);
    CleanupWindow := TWindowCleanup.Create;
    while KeyTyped(KeyCode.SPACE_KEY) = false do
        ProcessEvents();
        ClearScreen();
        DrawText('Test: add_column', ColorBlack(), 10.0, 10.0);
        DrawText('Expected: Two columns - first 100px wide, second fills remaining space', ColorBlack(), 10.0, 30.0);
        DrawText('Press space to end test', ColorBlack(), 10.0, 50.0);
        StartPanel('Test Panel', RectangleFrom(0.0, 70.0, 800.0, 530.0));
        StartCustomLayout();
        AddColumn(100);
        AddColumn(-1);
        Button('Left Column');
        Button('Right Column');
        EndPanel('Test Panel');
        DrawInterface();
        RefreshScreen();
    end;
end;
procedure TestAddColumnRelativeIntegration;
begin
    testWindow := OpenWindow('Test Window', 800, 600);
    CleanupWindow := TWindowCleanup.Create;
    while KeyTyped(KeyCode.SPACE_KEY) = false do
        ProcessEvents();
        ClearScreen();
        DrawText('Test: add_column_relative', ColorBlack(), 10.0, 10.0);
        DrawText('Expected: Two equal-width columns (50% each)', ColorBlack(), 10.0, 30.0);
        DrawText('Press space to end test', ColorBlack(), 10.0, 50.0);
        StartPanel('Test Panel', RectangleFrom(0.0, 70.0, 800.0, 530.0));
        StartCustomLayout();
        AddColumnRelative(0.5);
        AddColumnRelative(0.5);
        Button('Left Column');
        Button('Right Column');
        EndPanel('Test Panel');
        DrawInterface();
        RefreshScreen();
    end;
end;
procedure TestBitmapButtonIntegration;
begin
    testWindow := OpenWindow('Test Window', 800, 600);
    CleanupWindow := TWindowCleanup.Create;
    testBitmap := CreateBitmap('test_bitmap', 100, 100);
    CleanupBitmap := TBitmapCleanup.Create;
    ClearBitmap(testBitmap, ColorRed());
    buttonClicked := false;
    while buttonClicked = false do
        ProcessEvents();
        ClearScreen();
        DrawText('Test: bitmap_button', ColorBlack(), 10.0, 10.0);
        DrawText('Expected: A clickable button with a red bitmap image', ColorBlack(), 10.0, 30.0);
        DrawText('Click the button to end test', ColorBlack(), 10.0, 50.0);
        StartPanel('Test Panel', RectangleFrom(0.0, 70.0, 800.0, 530.0));
        SetLayoutHeight(100);
        buttonClicked = BitmapButton(testBitmap);
        EndPanel('Test Panel');
        DrawInterface();
        RefreshScreen();
    end;
    AssertTrue(buttonClicked);
end;
procedure TestBitmapButtonAtPositionIntegration;
begin
    testWindow := OpenWindow('Test Window', 800, 600);
    CleanupWindow := TWindowCleanup.Create;
    testBitmap := CreateBitmap('test_bitmap', 100, 100);
    ClearBitmap(testBitmap, ColorRed());
    CleanupBitmap := TBitmapCleanup.Create;
    testRectangle := RectangleFrom(100.0, 100.0, 100.0, 100.0);
    buttonClicked := false;
    while buttonClicked = false do
        ProcessEvents();
        ClearScreen();
        DrawText('Test: bitmap_button_at_position', ColorBlack(), 10.0, 10.0);
        DrawText('Expected: A red bitmap button at position (100,100)', ColorBlack(), 10.0, 30.0);
        DrawText('Click the button to end test', ColorBlack(), 10.0, 50.0);
        buttonClicked = BitmapButton(testBitmap, testRectangle);
        DrawInterface();
        RefreshScreen();
    end;
    AssertTrue(buttonClicked);
end;
procedure TestBitmapButtonAtPositionWithOptionsIntegration;
begin
    testWindow := OpenWindow('Test Window', 800, 600);
    CleanupWindow := TWindowCleanup.Create;
    testBitmap := CreateBitmap('test_bitmap', 100, 100);
    ClearBitmap(testBitmap, ColorRed());
    CleanupBitmap := TBitmapCleanup.Create;
    testRectangle := RectangleFrom(100.0, 100.0, 100.0, 100.0);
    buttonClicked := false;
    while buttonClicked = false do
        ProcessEvents();
        ClearScreen();
        DrawText('Test: bitmap_button_at_position_with_options', ColorBlack(), 10.0, 10.0);
        DrawText('Expected: A red bitmap button at position (100,100) with default options', ColorBlack(), 10.0, 30.0);
        DrawText('Click the button to end test', ColorBlack(), 10.0, 50.0);
        buttonClicked = BitmapButton(testBitmap, testRectangle, OptionDefaults());
        DrawInterface();
        RefreshScreen();
    end;
    AssertTrue(buttonClicked);
end;
procedure TestBitmapButtonWithOptionsIntegration;
begin
    testWindow := OpenWindow('Test Window', 800, 600);
    CleanupWindow := TWindowCleanup.Create;
    testBitmap := CreateBitmap('test_bitmap', 100, 100);
    ClearBitmap(testBitmap, ColorRed());
    CleanupBitmap := TBitmapCleanup.Create;
    testOptions1 := OptionDefaults();
    testOptions2 := OptionScaleBmp(0.5, 0.5, testOptions1);
    buttonClicked := false;
    while buttonClicked = false do
        ProcessEvents();
        ClearScreen();
        DrawText('Test: bitmap_button_with_options', ColorBlack(), 10.0, 10.0);
        DrawText('Expected: A red bitmap button scaled to 50% size', ColorBlack(), 10.0, 30.0);
        DrawText('Click the button to end test', ColorBlack(), 10.0, 50.0);
        StartPanel('Test Panel', RectangleFrom(0.0, 70.0, 800.0, 530.0));
        SetLayoutHeight(50);
        buttonClicked = BitmapButton(testBitmap, testOptions2);
        EndPanel('Test Panel');
        DrawInterface();
        RefreshScreen();
    end;
    AssertTrue(buttonClicked);
end;
procedure TestBitmapButtonLabeledIntegration;
begin
    testWindow := OpenWindow('Test Window', 800, 600);
    CleanupWindow := TWindowCleanup.Create;
    testBitmap := CreateBitmap('test_bitmap', 20, 20);
    ClearBitmap(testBitmap, ColorRed());
    CleanupBitmap := TBitmapCleanup.Create;
    buttonClicked := false;
    while buttonClicked = false do
        ProcessEvents();
        ClearScreen();
        DrawText('Test: bitmap_button_labeled', ColorBlack(), 10.0, 10.0);
        DrawText('Expected: A red bitmap button with label 'Click Me'', ColorBlack(), 10.0, 30.0);
        DrawText('Click the button to end test', ColorBlack(), 10.0, 50.0);
        StartPanel('Test Panel', RectangleFrom(0.0, 70.0, 800.0, 530.0));
        buttonClicked = BitmapButton('Click Me', testBitmap);
        EndPanel('Test Panel');
        DrawInterface();
        RefreshScreen();
    end;
    AssertTrue(buttonClicked);
end;
procedure TestBitmapButtonLabeledWithOptionsIntegration;
begin
    testWindow := OpenWindow('Test Window', 800, 600);
    CleanupWindow := TWindowCleanup.Create;
    testBitmap := CreateBitmap('test_bitmap', 20, 20);
    ClearBitmap(testBitmap, ColorRed());
    CleanupBitmap := TBitmapCleanup.Create;
    testOptions1 := OptionDefaults();
    testOptions2 := OptionScaleBmp(0.5, 0.5, testOptions1);
    buttonClicked := false;
    while buttonClicked = false do
        ProcessEvents();
        ClearScreen();
        DrawText('Test: bitmap_button_labeled_with_options', ColorBlack(), 10.0, 10.0);
        DrawText('Expected: A red bitmap button scaled to 50% with label 'Click Me'', ColorBlack(), 10.0, 30.0);
        DrawText('Click the button to end test', ColorBlack(), 10.0, 50.0);
        StartPanel('Test Panel', RectangleFrom(0.0, 70.0, 800.0, 530.0));
        buttonClicked = BitmapButton('Click Me', testBitmap, testOptions2);
        EndPanel('Test Panel');
        DrawInterface();
        RefreshScreen();
    end;
    AssertTrue(buttonClicked);
end;
procedure TestButtonAtPositionIntegration;
begin
    testWindow := OpenWindow('Test Window', 800, 600);
    CleanupWindow := TWindowCleanup.Create;
    testRectangle := RectangleFrom(100.0, 100.0, 200.0, 50.0);
    buttonClicked := false;
    while buttonClicked = false do
        ProcessEvents();
        ClearScreen();
        DrawText('Test: button_at_position', ColorBlack(), 10.0, 10.0);
        DrawText('Expected: A button with text 'Click Me' at position (100,100) with size 200x50', ColorBlack(), 10.0, 30.0);
        DrawText('Click the button to end test', ColorBlack(), 10.0, 50.0);
        buttonClicked = Button('Click Me', testRectangle);
        DrawInterface();
        RefreshScreen();
    end;
    AssertTrue(buttonClicked);
end;
procedure TestButtonIntegration;
begin
    testWindow := OpenWindow('Test Window', 800, 600);
    CleanupWindow := TWindowCleanup.Create;
    buttonClicked := false;
    while buttonClicked = false do
        ProcessEvents();
        ClearScreen();
        DrawText('Test: button', ColorBlack(), 10.0, 10.0);
        DrawText('Expected: A button with text 'Click Me' using default layout', ColorBlack(), 10.0, 30.0);
        DrawText('Click the button to end test', ColorBlack(), 10.0, 50.0);
        StartPanel('Test Panel', RectangleFrom(0.0, 70.0, 800.0, 530.0));
        buttonClicked = Button('Click Me');
        EndPanel('Test Panel');
        DrawInterface();
        RefreshScreen();
    end;
    AssertTrue(buttonClicked);
end;
procedure TestButtonLabeledIntegration;
begin
    testWindow := OpenWindow('Test Window', 800, 600);
    CleanupWindow := TWindowCleanup.Create;
    buttonClicked := false;
    while buttonClicked = false do
        ProcessEvents();
        ClearScreen();
        DrawText('Test: button_labeled', ColorBlack(), 10.0, 10.0);
        DrawText('Expected: A button with text 'Click Me' and label 'Label:' in a two-column layout', ColorBlack(), 10.0, 30.0);
        DrawText('Click the button to end test', ColorBlack(), 10.0, 50.0);
        StartPanel('Test Panel', RectangleFrom(0.0, 70.0, 800.0, 530.0));
        buttonClicked = Button('Label:', 'Click Me');
        EndPanel('Test Panel');
        DrawInterface();
        RefreshScreen();
    end;
    AssertTrue(buttonClicked);
end;
procedure TestCheckboxAtPositionIntegration;
begin
    testWindow := OpenWindow('Test Window', 800, 600);
    CleanupWindow := TWindowCleanup.Create;
    testRect := RectangleFrom(100.0, 100.0, 200.0, 50.0);
    initialCheckboxResult := false;
    currentCheckboxResult := initialCheckboxResult;
    while currentCheckboxResult = false do
        ProcessEvents();
        ClearScreen();
        DrawText('Test: checkbox_at_position', ColorBlack(), 10.0, 10.0);
        DrawText('Expected: A checkbox with text 'Test Checkbox' at position (100,100) with size 200x50', ColorBlack(), 10.0, 30.0);
        DrawText('Click the checkbox to end test', ColorBlack(), 10.0, 50.0);
        currentCheckboxResult = Checkbox('Test Checkbox', currentCheckboxResult, testRect);
        DrawInterface();
        RefreshScreen();
    end;
    AssertTrue(currentCheckboxResult);
end;
procedure TestCheckboxIntegration;
begin
    testWindow := OpenWindow('Test Window', 800, 600);
    CleanupWindow := TWindowCleanup.Create;
    initialCheckboxResult := false;
    currentCheckboxResult := initialCheckboxResult;
    while currentCheckboxResult = false do
        ProcessEvents();
        ClearScreen();
        DrawText('Test: checkbox', ColorBlack(), 10.0, 10.0);
        DrawText('Expected: A checkbox with text 'Test Checkbox' using default layout', ColorBlack(), 10.0, 30.0);
        DrawText('Click the checkbox to end test', ColorBlack(), 10.0, 50.0);
        StartPanel('Test Panel', RectangleFrom(0.0, 70.0, 800.0, 530.0));
        currentCheckboxResult = Checkbox('Test Checkbox', currentCheckboxResult);
        EndPanel('Test Panel');
        DrawInterface();
        RefreshScreen();
    end;
    AssertTrue(currentCheckboxResult);
end;
procedure TestCheckboxLabeledIntegration;
begin
    testWindow := OpenWindow('Test Window', 800, 600);
    CleanupWindow := TWindowCleanup.Create;
    initialCheckboxResult := false;
    currentCheckboxResult := initialCheckboxResult;
    while currentCheckboxResult = false do
        ProcessEvents();
        ClearScreen();
        DrawText('Test: checkbox_labeled', ColorBlack(), 10.0, 10.0);
        DrawText('Expected: A checkbox with text 'Check me' and label 'Test Checkbox' in a two-column layout', ColorBlack(), 10.0, 30.0);
        DrawText('Click the checkbox to end test', ColorBlack(), 10.0, 50.0);
        StartPanel('Test Panel', RectangleFrom(0.0, 70.0, 800.0, 530.0));
        SetInterfaceLabelWidth(110);
        currentCheckboxResult = Checkbox('Test Checkbox', 'Check me', currentCheckboxResult);
        EndPanel('Test Panel');
        DrawInterface();
        RefreshScreen();
    end;
    AssertTrue(currentCheckboxResult);
end;
procedure TestColorSliderAtPositionIntegration;
begin
    testWindow := OpenWindow('Test Window', 800, 600);
    CleanupWindow := TWindowCleanup.Create;
    initialColor := ColorBlack();
    currentColor := initialColor;
    while KeyTyped(KeyCode.SPACE_KEY) = false do
        ProcessEvents();
        ClearScreen();
        DrawText('Test: color_slider_at_position', ColorBlack(), 10.0, 10.0);
        DrawText('Expected: A color slider using RGBA controls at position (100,100) with size 400x24', ColorBlack(), 10.0, 30.0);
        DrawText('Change the color and press space to pass', ColorBlack(), 10.0, 50.0);
        currentColor = ColorSlider(currentColor, RectangleFrom(100.0, 100.0, 400.0, 24.0));
        DrawInterface();
        RefreshScreen();
    end;
    AssertNotEquals(currentColor, initialColor);
end;
procedure TestColorSliderIntegration;
begin
    testWindow := OpenWindow('Test Window', 800, 600);
    CleanupWindow := TWindowCleanup.Create;
    initialColor := ColorBlack();
    currentColor := initialColor;
    while KeyTyped(KeyCode.SPACE_KEY) = false do
        ProcessEvents();
        ClearScreen();
        DrawText('Test: color_slider', ColorBlack(), 10.0, 10.0);
        DrawText('Expected: A color slider with RGBA controls using default layout', ColorBlack(), 10.0, 30.0);
        DrawText('Change the color and press space to pass', ColorBlack(), 10.0, 50.0);
        StartPanel('Test Panel', RectangleFrom(0.0, 70.0, 800.0, 530.0));
        currentColor = ColorSlider(currentColor);
        EndPanel('Test Panel');
        DrawInterface();
        RefreshScreen();
    end;
    AssertFalse(QuitRequested());
end;
procedure TestColorSliderLabeledIntegration;
begin
    testWindow := OpenWindow('Test Window', 800, 600);
    CleanupWindow := TWindowCleanup.Create;
    initialColor := ColorBlack();
    currentColor := initialColor;
    while KeyTyped(KeyCode.SPACE_KEY) = false do
        ProcessEvents();
        ClearScreen();
        DrawText('Test: color_slider_labeled', ColorBlack(), 10.0, 10.0);
        DrawText('Expected: A color slider with label 'Test Color Slider' in a two-column layout', ColorBlack(), 10.0, 30.0);
        DrawText('Change the color and press space to pass', ColorBlack(), 10.0, 50.0);
        SetInterfaceLabelWidth(120);
        StartPanel('Test Panel', RectangleFrom(0.0, 70.0, 800.0, 530.0));
        currentColor = ColorSlider('Test Color Slider', currentColor);
        EndPanel('Test Panel');
        DrawInterface();
        RefreshScreen();
    end;
    AssertNotEquals(initialColor, currentColor);
end;
procedure TestDisableInterfaceIntegration;
begin
    testWindow := OpenWindow('Test Window', 800, 600);
    CleanupWindow := TWindowCleanup.Create;
    buttonClicked := false;
    AssertTrue(InterfaceEnabled());
    DisableInterface();
    while KeyTyped(KeyCode.SPACE_KEY) = false do
        ProcessEvents();
        ClearScreen();
        DrawText('Test: disable_interface', ColorBlack(), 10.0, 10.0);
        DrawText('Expected: A button that is disabled', ColorBlack(), 10.0, 30.0);
        DrawText('Click the button and press space to verify that the button is disabled', ColorBlack(), 10.0, 50.0);
        StartPanel('Test Panel', RectangleFrom(0.0, 70.0, 800.0, 530.0));
        buttonClicked = Button('Try to click me');
        EndPanel('Test Panel');
        DrawInterface();
        RefreshScreen();
    end;
    AssertFalse(InterfaceEnabled());
    AssertFalse(buttonClicked);
end;
procedure TestDrawInterfaceIntegration;
begin
    testWindow := OpenWindow('Test Window', 800, 600);
    CleanupWindow := TWindowCleanup.Create;
    while KeyTyped(KeyCode.SPACE_KEY) = false do
        ProcessEvents();
        ClearScreen();
        DrawText('Test: draw_interface', ColorBlack(), 10.0, 10.0);
        DrawText('Expected: A panel at position (100,100) with size 200x200', ColorBlack(), 10.0, 30.0);
        DrawText('Press space to end test', ColorBlack(), 10.0, 50.0);
        StartPanel('Test Panel', RectangleFrom(100.0, 100.0, 200.0, 200.0));
        Button('Test Button');
        EndPanel('Test Panel');
        DrawInterface();
        RefreshScreen();
    end;
end;
procedure TestEnableInterfaceIntegration;
begin
    testWindow := OpenWindow('Test Window', 800, 600);
    CleanupWindow := TWindowCleanup.Create;
    DisableInterface();
    while KeyTyped(KeyCode.SPACE_KEY) = false do
        ProcessEvents();
        ClearScreen();
        DrawText('Test: enable_interface', ColorBlack(), 10.0, 10.0);
        DrawText('Expected: Button should be disabled', ColorBlack(), 10.0, 30.0);
        DrawText('Press space to continue', ColorBlack(), 10.0, 50.0);
        StartPanel('Test Panel', RectangleFrom(0.0, 70.0, 800.0, 530.0));
        Button('Test Button');
        EndPanel('Test Panel');
        DrawInterface();
        RefreshScreen();
    end;
    AssertFalse(InterfaceEnabled());
    EnableInterface();
    buttonClicked := false;
    while buttonClicked = false do
        ProcessEvents();
        ClearScreen();
        DrawText('Test: enable_interface', ColorBlack(), 10.0, 10.0);
        DrawText('Expected: Button should be enabled', ColorBlack(), 10.0, 30.0);
        DrawText('Click the button to end test', ColorBlack(), 10.0, 50.0);
        StartPanel('Test Panel', RectangleFrom(0.0, 70.0, 800.0, 530.0));
        buttonClicked = Button('Test Button');
        EndPanel('Test Panel');
        DrawInterface();
        RefreshScreen();
    end;
    AssertTrue(InterfaceEnabled());
    AssertTrue(buttonClicked);
end;
procedure TestEndInsetIntegration;
begin
    testWindow := OpenWindow('Test Window', 800, 600);
    CleanupWindow := TWindowCleanup.Create;
    while KeyTyped(KeyCode.SPACE_KEY) = false do
        ProcessEvents();
        ClearScreen();
        DrawText('Test: end_inset', ColorBlack(), 10.0, 10.0);
        DrawText('Expected: An inset with height 60 pixels containing a button', ColorBlack(), 10.0, 30.0);
        DrawText('Press space to end test', ColorBlack(), 10.0, 50.0);
        StartPanel('Test Panel', RectangleFrom(0.0, 70.0, 800.0, 530.0));
        StartInset('Test Inset', 60);
        Button('Test Button');
        EndInset('Test Inset');
        EndPanel('Test Panel');
        DrawInterface();
        RefreshScreen();
    end;
end;
procedure TestEndPanelIntegration;
begin
    testWindow := OpenWindow('Test Window', 800, 600);
    CleanupWindow := TWindowCleanup.Create;
    while KeyTyped(KeyCode.SPACE_KEY) = false do
        ProcessEvents();
        ClearScreen();
        DrawText('Test: end_panel', ColorBlack(), 10.0, 10.0);
        DrawText('Expected: A panel at position (100,100) with size 200x200 containing a button', ColorBlack(), 10.0, 30.0);
        DrawText('Press space to end test', ColorBlack(), 10.0, 50.0);
        StartPanel('Test Panel', RectangleFrom(100.0, 100.0, 200.0, 200.0));
        Button('Test Button');
        EndPanel('Test Panel');
        DrawInterface();
        RefreshScreen();
    end;
end;
procedure TestEndPopupIntegration;
begin
    testWindow := OpenWindow('Test Window', 800, 600);
    CleanupWindow := TWindowCleanup.Create;
    while KeyTyped(KeyCode.SPACE_KEY) = false do
        ProcessEvents();
        ClearScreen();
        DrawText('Test: end_popup', ColorBlack(), 10.0, 10.0);
        DrawText('Expected: Click the button to show a popup with a label', ColorBlack(), 10.0, 30.0);
        DrawText('Press space to end test', ColorBlack(), 10.0, 50.0);
        StartPanel('Test Panel', RectangleFrom(0.0, 70.0, 800.0, 530.0));
        if Button('Open Popup') = true then
        OpenPopup('Test Popup');
    end;
    if StartPopup('Test Popup') = true then
    SingleLineLayout();
    SetInterfaceLabelWidth(200);
    LabelElement('Test Label');
    EndPopup('Test Popup');
end;
EndPanel('Test Panel');
DrawInterface();
RefreshScreen();
end;
end;
procedure TestEndTreenodeIntegration;
begin
    testWindow := OpenWindow('Test Window', 800, 600);
    CleanupWindow := TWindowCleanup.Create;
    while KeyTyped(KeyCode.SPACE_KEY) = false do
        ProcessEvents();
        ClearScreen();
        DrawText('Test: end_treenode', ColorBlack(), 10.0, 10.0);
        DrawText('Expected: A panel containing a collapsible tree node with a button', ColorBlack(), 10.0, 30.0);
        DrawText('Press space to end test', ColorBlack(), 10.0, 50.0);
        StartPanel('Test Panel', RectangleFrom(10.0, 70.0, 200.0, 200.0));
        if StartTreenode('Test Node') = true then
        Button('Test Button');
        EndTreenode('Test Node');
    end;
    EndPanel('Test Panel');
    DrawInterface();
    RefreshScreen();
end;
end;
procedure TestEnterColumnIntegration;
begin
    testWindow := OpenWindow('Test Window', 800, 600);
    CleanupWindow := TWindowCleanup.Create;
    while KeyTyped(KeyCode.SPACE_KEY) = false do
        ProcessEvents();
        ClearScreen();
        DrawText('Test: enter_column', ColorBlack(), 10.0, 10.0);
        DrawText('Expected: A panel with a 100-pixel wide column containing a button', ColorBlack(), 10.0, 30.0);
        DrawText('Press space to end test', ColorBlack(), 10.0, 50.0);
        StartPanel('Test Panel', RectangleFrom(10.0, 70.0, 300.0, 200.0));
        AddColumn(100);
        EnterColumn();
        Button('Click to end test');
        LeaveColumn();
        EndPanel('Test Panel');
        DrawInterface();
        RefreshScreen();
    end;
end;
procedure TestGetInterfaceLabelWidthIntegration;
begin
    testLabelWidth := GetInterfaceLabelWidth();
    AssertEquals(60, testLabelWidth);
end;
procedure TestHeaderIntegration;
begin
    testWindow := OpenWindow('Test Window', 800, 600);
    CleanupWindow := TWindowCleanup.Create;
    while KeyTyped(KeyCode.SPACE_KEY) = false do
        ProcessEvents();
        ClearScreen();
        DrawText('Test: header', ColorBlack(), 10.0, 10.0);
        DrawText('Expected: A collapsible header labeled 'Test Header' with a button', ColorBlack(), 10.0, 30.0);
        DrawText('Press space to end test', ColorBlack(), 10.0, 50.0);
        StartPanel('Test Panel', RectangleFrom(10.0, 70.0, 300.0, 200.0));
        if Header('Test Header') = true then
        Button('Test Button');
    end;
    EndPanel('Test Panel');
    DrawInterface();
    RefreshScreen();
end;
end;
procedure TestHSBColorSliderAtPositionIntegration;
begin
    testWindow := OpenWindow('Test Window', 800, 600);
    CleanupWindow := TWindowCleanup.Create;
    initialColor := ColorBlack();
    testRect := RectangleFrom(100.0, 100.0, 400.0, 24.0);
    currentColor := initialColor;
    while KeyTyped(KeyCode.SPACE_KEY) = false do
        ProcessEvents();
        ClearScreen();
        DrawText('Test: hsb_color_slider_at_position', ColorBlack(), 10.0, 10.0);
        DrawText('Expected: A HSB color slider at position (100,100) with size 400x24', ColorBlack(), 10.0, 30.0);
        DrawText('Change the color and press space to pass', ColorBlack(), 10.0, 50.0);
        currentColor = HSBColorSlider(currentColor, testRect);
        DrawInterface();
        RefreshScreen();
    end;
    AssertNotEquals(currentColor, initialColor);
end;
procedure TestHSBColorSliderIntegration;
begin
    testWindow := OpenWindow('Test Window', 800, 600);
    CleanupWindow := TWindowCleanup.Create;
    initialColor := ColorBlack();
    currentColor := initialColor;
    while KeyTyped(KeyCode.SPACE_KEY) = false do
        ProcessEvents();
        ClearScreen();
        DrawText('Test: hsb_color_slider', ColorBlack(), 10.0, 10.0);
        DrawText('Expected: A HSB color slider using default layout', ColorBlack(), 10.0, 30.0);
        DrawText('Change the color and press space to pass', ColorBlack(), 10.0, 50.0);
        StartPanel('Test Panel', RectangleFrom(0.0, 70.0, 800.0, 530.0));
        currentColor = HSBColorSlider(currentColor);
        EndPanel('Test Panel');
        DrawInterface();
        RefreshScreen();
    end;
    AssertNotEquals(currentColor, initialColor);
end;
procedure TestHSBColorSliderLabeledIntegration;
begin
    testWindow := OpenWindow('Test Window', 800, 600);
    CleanupWindow := TWindowCleanup.Create;
    initialColor := ColorBlack();
    currentColor := initialColor;
    while KeyTyped(KeyCode.SPACE_KEY) = false do
        ProcessEvents();
        ClearScreen();
        DrawText('Test: hsb_color_slider_labeled', ColorBlack(), 10.0, 10.0);
        DrawText('Expected: A HSB color slider with label 'Color Slider' in a two-column layout', ColorBlack(), 10.0, 30.0);
        DrawText('Change the color and press space to pass', ColorBlack(), 10.0, 50.0);
        StartPanel('Test Panel', RectangleFrom(0.0, 70.0, 800.0, 530.0));
        SetInterfaceLabelWidth(100);
        currentColor = HSBColorSlider('Color Slider', currentColor);
        EndPanel('Test Panel');
        DrawInterface();
        RefreshScreen();
    end;
    AssertNotEquals(currentColor, initialColor);
end;
procedure TestInterfaceEnabledIntegration;
begin
    OpenWindow('Test Window', 800, 600);
    CleanupWindow := TWindowCleanup.Create;
    initialState := InterfaceEnabled();
    AssertTrue(initialState);
    DisableInterface();
    disabledState := InterfaceEnabled();
    AssertFalse(disabledState);
    EnableInterface();
    enabledState := InterfaceEnabled();
    AssertTrue(enabledState);
end;
procedure TestInterfaceStylePanelIntegration;
begin
    testWindow := OpenWindow('Test Window', 800, 600);
    CleanupWindow := TWindowCleanup.Create;
    panelRectangle := RectangleFrom(0.0, 70.0, 800.0, 530.0);
    while KeyTyped(KeyCode.SPACE_KEY) = false do
        ProcessEvents();
        ClearScreen();
        DrawText('Test: interface_style_panel', ColorBlack(), 10.0, 10.0);
        DrawText('Expected: A panel with controls to adjust the interface style', ColorBlack(), 10.0, 30.0);
        DrawText('Adjust the style and press space to end test', ColorBlack(), 10.0, 50.0);
        InterfaceStylePanel(panelRectangle);
        DrawInterface();
        RefreshScreen();
    end;
end;
procedure TestLabelElementIntegration;
begin
    testWindow := OpenWindow('Test Window', 800, 600);
    CleanupWindow := TWindowCleanup.Create;
    while KeyTyped(KeyCode.SPACE_KEY) = false do
        ProcessEvents();
        ClearScreen();
        DrawText('Test: label_element', ColorBlack(), 10.0, 10.0);
        DrawText('Expected: A label with text 'Test Label' using default layout', ColorBlack(), 10.0, 30.0);
        DrawText('Press space to end test', ColorBlack(), 10.0, 50.0);
        StartPanel('Test Panel', RectangleFrom(0.0, 70.0, 800.0, 530.0));
        LabelElement('Test Label');
        EndPanel('Test Panel');
        DrawInterface();
        RefreshScreen();
    end;
end;
procedure TestLabelElementAtPositionIntegration;
begin
    testWindow := OpenWindow('Test Window', 800, 600);
    CleanupWindow := TWindowCleanup.Create;
    testRectangle := RectangleFrom(100.0, 100.0, 200.0, 50.0);
    while KeyTyped(KeyCode.SPACE_KEY) = false do
        ProcessEvents();
        ClearScreen();
        DrawText('Test: label_element_at_position', ColorBlack(), 10.0, 10.0);
        DrawText('Expected: A label with text 'Test Label' at position (100,100)', ColorBlack(), 10.0, 30.0);
        DrawText('Press space to end test', ColorBlack(), 10.0, 50.0);
        LabelElement('Test Label', testRectangle);
        DrawInterface();
        RefreshScreen();
    end;
end;
procedure TestLastElementChangedIntegration;
begin
    testWindow := OpenWindow('Test Window', 800, 600);
    CleanupWindow := TWindowCleanup.Create;
    initialValue := 0.0;
    currentValue := 0.0;
    elementChanged := false;
    while KeyTyped(KeyCode.SPACE_KEY) = false do
        ProcessEvents();
        ClearScreen();
        DrawText('Test: last_element_changed', ColorBlack(), 10.0, 10.0);
        DrawText('Expected: A slider that detects value changes', ColorBlack(), 10.0, 30.0);
        DrawText('Move the slider and press space to pass', ColorBlack(), 10.0, 50.0);
        StartPanel('Test Panel', RectangleFrom(0.0, 70.0, 800.0, 530.0));
        currentValue = Slider('Test Slider', currentValue, 0.0, 100.0);
        if LastElementChanged() = true then
        elementChanged = true;
    end;
    EndPanel('Test Panel');
    DrawInterface();
    RefreshScreen();
end;
AssertNotEquals(currentValue, initialValue);
AssertTrue(elementChanged);
end;
procedure TestLastElementConfirmedIntegration;
begin
    testWindow := OpenWindow('Test Window', 800, 600);
    CleanupWindow := TWindowCleanup.Create;
    buttonClicked := false;
    while KeyTyped(KeyCode.SPACE_KEY) = false do
        ProcessEvents();
        ClearScreen();
        DrawText('Test: last_element_confirmed', ColorBlack(), 10.0, 10.0);
        DrawText('Expected: A button that detects when clicked', ColorBlack(), 10.0, 30.0);
        DrawText('Click the button and press space to pass', ColorBlack(), 10.0, 50.0);
        StartPanel('Test Panel', RectangleFrom(0.0, 70.0, 800.0, 530.0));
        Button('Test Button');
        if LastElementConfirmed() = true then
        buttonClicked = true;
    end;
    EndPanel('Test Panel');
    DrawInterface();
    RefreshScreen();
end;
AssertTrue(buttonClicked);
end;
procedure TestLeaveColumnIntegration;
begin
    testWindow := OpenWindow('Test Window', 800, 600);
    CleanupWindow := TWindowCleanup.Create;
    while KeyTyped(KeyCode.SPACE_KEY) = false do
        ProcessEvents();
        ClearScreen();
        DrawText('Test: leave_column', ColorBlack(), 10.0, 10.0);
        DrawText('Expected: A button that appears after leaving a column with a width of 100', ColorBlack(), 10.0, 30.0);
        DrawText('Press space to end test', ColorBlack(), 10.0, 50.0);
        StartPanel('Test Panel', RectangleFrom(10.0, 70.0, 300.0, 200.0));
        StartCustomLayout();
        AddColumn(100);
        AddColumn(-1);
        EnterColumn();
        LeaveColumn();
        Button('Test Button');
        EndPanel('Test Panel');
        DrawInterface();
        RefreshScreen();
    end;
end;
procedure TestNumberBoxAtPositionIntegration;
begin
    testWindow := OpenWindow('Test Window', 800, 600);
    CleanupWindow := TWindowCleanup.Create;
    testRect := RectangleFrom(100.0, 100.0, 200.0, 30.0);
    testResult := 5.0;
    while KeyTyped(KeyCode.SPACE_KEY) = false do
        ProcessEvents();
        ClearScreen();
        DrawText('Test: number_box_at_position', ColorBlack(), 10.0, 10.0);
        DrawText('Expected: A number box at position (100,100) with size 200x30', ColorBlack(), 10.0, 30.0);
        DrawText('Change the number and press space to pass', ColorBlack(), 10.0, 50.0);
        testResult = NumberBox(testResult, 1.0, testRect);
        DrawInterface();
        RefreshScreen();
    end;
    AssertNotEquals(5.0, testResult);
end;
procedure TestNumberBoxIntegration;
begin
    testWindow := OpenWindow('Number Box Test', 800, 600);
    CleanupWindow := TWindowCleanup.Create;
    testResult := 5.0;
    while KeyTyped(KeyCode.SPACE_KEY) = false do
        ProcessEvents();
        ClearScreen();
        DrawText('Test: number_box', ColorBlack(), 10.0, 10.0);
        DrawText('Expected: A number box with step size 1.0 using the default layout', ColorBlack(), 10.0, 30.0);
        DrawText('Change the number and press space to pass', ColorBlack(), 10.0, 50.0);
        StartPanel('Test Panel', RectangleFrom(10.0, 70.0, 300.0, 200.0));
        testResult = NumberBox(testResult, 1.0);
        EndPanel('Test Panel');
        DrawInterface();
        RefreshScreen();
    end;
    AssertNotEquals(5.0, testResult);
end;
procedure TestNumberBoxLabeledIntegration;
begin
    testWindow := OpenWindow('Test Window', 800, 600);
    CleanupWindow := TWindowCleanup.Create;
    testResult := 5.0;
    while KeyTyped(KeyCode.SPACE_KEY) = false do
        ProcessEvents();
        ClearScreen();
        DrawText('Test: number_box_labeled', ColorBlack(), 10.0, 10.0);
        DrawText('Expected: A labeled number box with step size 1.0 using the default layout', ColorBlack(), 10.0, 30.0);
        DrawText('Change the number and press space to pass', ColorBlack(), 10.0, 50.0);
        StartPanel('Test Panel', RectangleFrom(10.0, 70.0, 300.0, 200.0));
        SetInterfaceLabelWidth(100);
        testResult = NumberBox('Test Value', testResult, 1.0);
        EndPanel('Test Panel');
        DrawInterface();
        RefreshScreen();
    end;
    AssertNotEquals(5.0, testResult);
end;
procedure TestOpenPopupIntegration;
begin
    testWindow := OpenWindow('Test Window', 800, 600);
    CleanupWindow := TWindowCleanup.Create;
    while KeyTyped(KeyCode.SPACE_KEY) = false do
        ProcessEvents();
        ClearScreen();
        DrawText('Test: open_popup', ColorBlack(), 10.0, 10.0);
        DrawText('Expected: Click the button to show a popup with a label', ColorBlack(), 10.0, 30.0);
        DrawText('Press space to end test', ColorBlack(), 10.0, 50.0);
        StartPanel('Test Panel', RectangleFrom(0.0, 70.0, 800.0, 530.0));
        if Button('Open Popup') = true then
        OpenPopup('Test Popup');
    end;
    if StartPopup('Test Popup') = true then
    SingleLineLayout();
    SetInterfaceLabelWidth(200);
    LabelElement('Test Label');
    EndPopup('Test Popup');
end;
EndPanel('Test Panel');
DrawInterface();
RefreshScreen();
end;
end;
procedure TestParagraphIntegration;
begin
    testWindow := OpenWindow('Test Window', 800, 600);
    CleanupWindow := TWindowCleanup.Create;
    SetInterfaceFont(LoadFont('hara', 'hara.ttf'));
    CleanupFont := TFontCleanup.Create;
    SetInterfaceFontSize(12);
    while KeyTyped(KeyCode.SPACE_KEY) = false do
        ProcessEvents();
        ClearScreen();
        DrawText('Test: paragraph', ColorBlack(), 10.0, 10.0);
        DrawText('Expected: A paragraph of text that wraps correctly within the panel', ColorBlack(), 10.0, 30.0);
        DrawText('Press space to end test', ColorBlack(), 10.0, 50.0);
        StartPanel('Test Panel', RectangleFrom(10.0, 70.0, 300.0, 200.0));
        Paragraph('This is a test paragraph to check if the text wraps correctly. weguy YGWE FYw eiuofhWEOF wue fuhwbeuf WUEFU wue');
        EndPanel('Test Panel');
        DrawInterface();
        RefreshScreen();
    end;
end;
procedure TestParagraphAtPositionIntegration;
begin
    testWindow := OpenWindow('Test Window', 800, 600);
    CleanupWindow := TWindowCleanup.Create;
    testRectangle := RectangleFrom(100.0, 100.0, 200.0, 100.0);
    while KeyTyped(KeyCode.SPACE_KEY) = false do
        ProcessEvents();
        ClearScreen();
        DrawText('Test: paragraph_at_position', ColorBlack(), 10.0, 10.0);
        DrawText('Expected: A paragraph at position (100,100) with size 200x100', ColorBlack(), 10.0, 30.0);
        DrawText('Press space to end test', ColorBlack(), 10.0, 50.0);
        Paragraph('This is a test paragraph to check if the text wraps correctly. weguy YGWE FYw eiuofhWEOF wue fuhwbeuf WUEFU wue', testRectangle);
        DrawInterface();
        RefreshScreen();
    end;
end;
procedure TestResetLayoutIntegration;
begin
    testWindow := OpenWindow('Test Window', 800, 600);
    CleanupWindow := TWindowCleanup.Create;
    while KeyTyped(KeyCode.SPACE_KEY) = false do
        ProcessEvents();
        ClearScreen();
        DrawText('Test: reset_layout', ColorBlack(), 10.0, 10.0);
        DrawText('Expected: The second button should not be confined to the created columns after reset', ColorBlack(), 10.0, 30.0);
        DrawText('Press space to end test', ColorBlack(), 10.0, 50.0);
        StartPanel('Test Panel', RectangleFrom(10.0, 70.0, 300.0, 200.0));
        StartCustomLayout();
        AddColumn(200);
        AddColumn(-1);
        Button('Button 1');
        ResetLayout();
        Button('Button 2');
        EndPanel('Test Panel');
        DrawInterface();
        RefreshScreen();
    end;
end;
procedure TestSetInterfaceAccentColorIntegration;
begin
    testWindow := OpenWindow('Test Window', 800, 600);
    CleanupWindow := TWindowCleanup.Create;
    SetInterfaceAccentColor(ColorRed(), 0.5);
    while KeyTyped(KeyCode.SPACE_KEY) = false do
        ProcessEvents();
        ClearScreen();
        DrawText('Test: set_interface_accent_color', ColorBlack(), 10.0, 10.0);
        DrawText('Expected: A button with red accent color at 50% contrast', ColorBlack(), 10.0, 30.0);
        DrawText('Press space to end test', ColorBlack(), 10.0, 50.0);
        StartPanel('Test Panel', RectangleFrom(10.0, 70.0, 300.0, 200.0));
        Button('Test Button');
        EndPanel('Test Panel');
        DrawInterface();
        RefreshScreen();
    end;
end;
procedure TestSetInterfaceBorderColorIntegration;
begin
    testWindow := OpenWindow('Test Window', 800, 600);
    CleanupWindow := TWindowCleanup.Create;
    SetInterfaceBorderColor(ColorRed());
    while KeyTyped(KeyCode.SPACE_KEY) = false do
        ProcessEvents();
        ClearScreen();
        DrawText('Test: set_interface_border_color', ColorBlack(), 10.0, 10.0);
        DrawText('Expected: A panel and button with red borders', ColorBlack(), 10.0, 30.0);
        DrawText('Press space to end test', ColorBlack(), 10.0, 50.0);
        StartPanel('Test Panel', RectangleFrom(10.0, 70.0, 300.0, 200.0));
        Button('Test Button');
        EndPanel('Test Panel');
        DrawInterface();
        RefreshScreen();
    end;
end;
procedure TestSetInterfaceColorsAutoIntegration;
begin
    testWindow := OpenWindow('Test Window', 800, 600);
    CleanupWindow := TWindowCleanup.Create;
    SetInterfaceColorsAuto(ColorWhite(), ColorBlue(), 0.5, 0.7, 0.3);
    while KeyTyped(KeyCode.SPACE_KEY) = false do
        ProcessEvents();
        ClearScreen();
        DrawText('Test: set_interface_colors_auto', ColorBlack(), 10.0, 10.0);
        DrawText('Expected: A panel with white main color and blue accent color', ColorBlack(), 10.0, 30.0);
        DrawText('Press space to end test', ColorBlack(), 10.0, 70.0);
        StartPanel('Test Panel', RectangleFrom(10.0, 90.0, 300.0, 200.0));
        Button('Test Button');
        EndPanel('Test Panel');
        DrawInterface();
        RefreshScreen();
    end;
end;
procedure TestSetInterfaceElementColorIntegration;
begin
    testWindow := OpenWindow('Test Window', 800, 600);
    CleanupWindow := TWindowCleanup.Create;
    SetInterfaceElementColor(ColorBlack(), 0.5);
    while KeyTyped(KeyCode.SPACE_KEY) = false do
        ProcessEvents();
        ClearScreen();
        DrawText('Test: set_interface_element_color', ColorBlack(), 10.0, 10.0);
        DrawText('Expected: A panel with black element color at 50% contrast', ColorBlack(), 10.0, 30.0);
        DrawText('Press space to end test', ColorBlack(), 10.0, 50.0);
        StartPanel('Test Panel', RectangleFrom(10.0, 70.0, 300.0, 200.0));
        Button('Test Button');
        EndPanel('Test Panel');
        DrawInterface();
        RefreshScreen();
    end;
end;
procedure TestSetInterfaceElementShadowsIntegration;
begin
    testWindow := OpenWindow('Test Window', 800, 600);
    CleanupWindow := TWindowCleanup.Create;
    SetInterfaceElementShadows(10, ColorBlue(), PointAt(5.0, 5.0));
    while KeyTyped(KeyCode.SPACE_KEY) = false do
        ProcessEvents();
        ClearScreen();
        DrawText('Test: set_interface_element_shadows', ColorBlack(), 10.0, 10.0);
        DrawText('Expected: Elements with blue shadow (radius: 10, offset: 5,5)', ColorBlack(), 10.0, 30.0);
        DrawText('Press space to end test', ColorBlack(), 10.0, 50.0);
        StartPanel('Test Panel', RectangleFrom(10.0, 70.0, 300.0, 200.0));
        Button('Test Button');
        EndPanel('Test Panel');
        DrawInterface();
        RefreshScreen();
    end;
end;
procedure TestSetInterfaceFontFontAsStringIntegration;
begin
    testWindow := OpenWindow('Test Window', 800, 600);
    CleanupWindow := TWindowCleanup.Create;
    LoadFont('hara', 'hara.ttf');
    CleanupFont := TFontCleanup.Create;
    LoadFont('demolition', 'demolition.ttf');
    while KeyTyped(KeyCode.SPACE_KEY) = false do
        ProcessEvents();
        ClearScreen();
        DrawText('Test: set_interface_font_font_as_string', ColorBlack(), 10.0, 10.0);
        DrawText('Press space to end test', ColorBlack(), 10.0, 30.0);
        StartPanel('Hara Font', RectangleFrom(10.0, 70.0, 300.0, 100.0));
        SetInterfaceFont('hara');
        LabelElement('This text uses Hara font');
        EndPanel('Hara Font');
        StartPanel('Demolition Font', RectangleFrom(10.0, 180.0, 300.0, 100.0));
        SetInterfaceFont('demolition');
        LabelElement('This text uses Demolition font');
        EndPanel('Demolition Font');
        DrawInterface();
        RefreshScreen();
    end;
end;
procedure TestSetInterfaceFontIntegration;
begin
    testWindow := OpenWindow('Test Window', 800, 600);
    CleanupWindow := TWindowCleanup.Create;
    haraFont := LoadFont('hara', 'hara.ttf');
    CleanupFont := TFontCleanup.Create;
    demolitionFont := LoadFont('demolition', 'demolition.ttf');
    while KeyTyped(KeyCode.SPACE_KEY) = false do
        ProcessEvents();
        ClearScreen();
        DrawText('Test: set_interface_font', ColorBlack(), 10.0, 10.0);
        DrawText('Press space to end test', ColorBlack(), 10.0, 30.0);
        StartPanel('Hara Font', RectangleFrom(10.0, 70.0, 300.0, 100.0));
        SetInterfaceFont(haraFont);
        LabelElement('This text uses Hara font');
        EndPanel('Hara Font');
        StartPanel('Demolition Font', RectangleFrom(10.0, 180.0, 300.0, 100.0));
        SetInterfaceFont(demolitionFont);
        LabelElement('This text uses Demolition font');
        EndPanel('Demolition Font');
        DrawInterface();
        RefreshScreen();
    end;
end;
procedure TestSetInterfaceFontSizeIntegration;
begin
    testWindow := OpenWindow('Test Window', 800, 600);
    CleanupWindow := TWindowCleanup.Create;
    while KeyTyped(KeyCode.SPACE_KEY) = false do
        ProcessEvents();
        ClearScreen();
        DrawText('Test: set_interface_font_size', ColorBlack(), 10.0, 10.0);
        DrawText('Press space to end test', ColorBlack(), 10.0, 30.0);
        SetInterfaceFontSize(12);
        StartPanel('Small Font', RectangleFrom(10.0, 70.0, 300.0, 100.0));
        LabelElement('This text uses 12pt font size');
        EndPanel('Small Font');
        SetInterfaceFontSize(16);
        StartPanel('Medium Font', RectangleFrom(10.0, 180.0, 300.0, 100.0));
        LabelElement('This text uses 16pt font size');
        EndPanel('Medium Font');
        SetInterfaceFontSize(24);
        StartPanel('Large Font', RectangleFrom(10.0, 290.0, 300.0, 100.0));
        LabelElement('This text uses 24pt font size');
        EndPanel('Large Font');
        DrawInterface();
        RefreshScreen();
    end;
end;
procedure TestSetInterfaceLabelWidthIntegration;
begin
    testWindow := OpenWindow('Test Window', 800, 600);
    CleanupWindow := TWindowCleanup.Create;
    SetInterfaceLabelWidth(100);
    AssertEquals(100, GetInterfaceLabelWidth());
end;
procedure TestSetInterfacePanelShadowsIntegration;
begin
    testWindow := OpenWindow('Test Window', 800, 600);
    CleanupWindow := TWindowCleanup.Create;
    SetInterfacePanelShadows(10, ColorBlue(), PointAt(5.0, 5.0));
    while KeyTyped(KeyCode.SPACE_KEY) = false do
        ProcessEvents();
        ClearScreen();
        DrawText('Test: set_interface_panel_shadows', ColorBlack(), 10.0, 10.0);
        DrawText('Expected: A panel with blue shadow (10px radius, 5px offset)', ColorBlack(), 10.0, 30.0);
        DrawText('Press space to end test', ColorBlack(), 10.0, 50.0);
        StartPanel('Test Panel', RectangleFrom(10.0, 70.0, 300.0, 200.0));
        Button('Test Button');
        EndPanel('Test Panel');
        DrawInterface();
        RefreshScreen();
    end;
end;
procedure TestSetInterfaceRootTextColorIntegration;
begin
    testWindow := OpenWindow('Test Window', 800, 600);
    CleanupWindow := TWindowCleanup.Create;
    SetInterfaceRootTextColor(ColorRed());
    while KeyTyped(KeyCode.SPACE_KEY) = false do
        ProcessEvents();
        ClearScreen();
        DrawText('Test: set_interface_root_text_color', ColorBlack(), 10.0, 10.0);
        DrawText('Expected: Text outside panels should be red, text inside panels unchanged', ColorBlack(), 10.0, 30.0);
        DrawText('Press space to end test', ColorBlack(), 10.0, 50.0);
        LabelElement('This text should be red (outside panel)', RectangleFrom(10.0, 90.0, 300.0, 20.0));
        StartPanel('Test Panel', RectangleFrom(10.0, 120.0, 300.0, 200.0));
        LabelElement('This text should be normal (inside panel)');
        EndPanel('Test Panel');
        DrawInterface();
        RefreshScreen();
    end;
end;
procedure TestSetInterfaceShadowsIntegration;
begin
    testWindow := OpenWindow('Test Window', 800, 600);
    CleanupWindow := TWindowCleanup.Create;
    SetInterfaceShadows(10, ColorBlue(), PointAt(5.0, 5.0));
    while KeyTyped(KeyCode.SPACE_KEY) = false do
        ProcessEvents();
        ClearScreen();
        DrawText('Test: set_interface_shadows', ColorBlack(), 10.0, 10.0);
        DrawText('Expected: Panel and button with blue shadows (10px radius, 5px offset)', ColorBlack(), 10.0, 30.0);
        DrawText('Press space to end test', ColorBlack(), 10.0, 50.0);
        StartPanel('Test Panel', RectangleFrom(10.0, 70.0, 300.0, 200.0));
        Button('Test Button');
        EndPanel('Test Panel');
        DrawInterface();
        RefreshScreen();
    end;
end;
procedure TestSetInterfaceSpacingIntegration;
begin
    testWindow := OpenWindow('Test Window', 800, 600);
    CleanupWindow := TWindowCleanup.Create;
    SetInterfaceSpacing(10, 5);
    while KeyTyped(KeyCode.SPACE_KEY) = false do
        ProcessEvents();
        ClearScreen();
        DrawText('Test: set_interface_spacing', ColorBlack(), 10.0, 10.0);
        DrawText('Expected: Panel with buttons spaced 10px apart and 5px padding', ColorBlack(), 10.0, 30.0);
        DrawText('Press space to end test', ColorBlack(), 10.0, 50.0);
        StartPanel('Test Panel', RectangleFrom(10.0, 70.0, 300.0, 200.0));
        Button('Button 1');
        Button('Button 2');
        EndPanel('Test Panel');
        DrawInterface();
        RefreshScreen();
    end;
end;
procedure TestSetInterfaceStyleIntegration;
begin
    testWindow := OpenWindow('Test Window', 800, 600);
    CleanupWindow := TWindowCleanup.Create;
    SetInterfaceStyle(InterfaceStyle.BUBBLE_MULTICOLORED);
    while KeyTyped(KeyCode.SPACE_KEY) = false do
        ProcessEvents();
        ClearScreen();
        DrawText('Test: set_interface_style', ColorBlack(), 10.0, 10.0);
        DrawText('Expected: Panel and button with bubble multicolored style theme', ColorBlack(), 10.0, 30.0);
        DrawText('Press space to end test', ColorBlack(), 10.0, 50.0);
        StartPanel('Test Panel', RectangleFrom(10.0, 70.0, 300.0, 200.0));
        Button('Test Button');
        EndPanel('Test Panel');
        DrawInterface();
        RefreshScreen();
    end;
end;
procedure TestSetInterfaceStyleWithColorIntegration;
begin
    testWindow := OpenWindow('Test Window', 800, 600);
    CleanupWindow := TWindowCleanup.Create;
    SetInterfaceStyle(InterfaceStyle.SHADED_DARK_STYLE, ColorBlue());
    while KeyTyped(KeyCode.SPACE_KEY) = false do
        ProcessEvents();
        ClearScreen();
        DrawText('Test: set_interface_style_with_color', ColorBlack(), 10.0, 10.0);
        DrawText('Expected: Panel and button with shaded dark style theme in blue', ColorBlack(), 10.0, 30.0);
        DrawText('Press space to end test', ColorBlack(), 10.0, 50.0);
        StartPanel('Test Panel', RectangleFrom(10.0, 70.0, 300.0, 200.0));
        Button('Test Button');
        EndPanel('Test Panel');
        DrawInterface();
        RefreshScreen();
    end;
end;
procedure TestSetInterfaceTextColorIntegration;
begin
    testWindow := OpenWindow('Test Window', 800, 600);
    CleanupWindow := TWindowCleanup.Create;
    SetInterfaceTextColor(ColorRed());
    while KeyTyped(KeyCode.SPACE_KEY) = false do
        ProcessEvents();
        ClearScreen();
        DrawText('Test: set_interface_text_color', ColorBlack(), 10.0, 10.0);
        DrawText('Expected: Panel with red text inside', ColorBlack(), 10.0, 30.0);
        DrawText('Press space to end test', ColorBlack(), 10.0, 50.0);
        StartPanel('Test Panel', RectangleFrom(10.0, 70.0, 300.0, 200.0));
        LabelElement('This text should be red');
        EndPanel('Test Panel');
        DrawInterface();
        RefreshScreen();
    end;
end;
procedure TestSetLayoutHeightIntegration;
begin
    testWindow := OpenWindow('Test Window', 800, 600);
    CleanupWindow := TWindowCleanup.Create;
    while KeyTyped(KeyCode.SPACE_KEY) = false do
        ProcessEvents();
        ClearScreen();
        DrawText('Test: set_layout_height', ColorBlack(), 10.0, 10.0);
        DrawText('Expected: Button with 100px height', ColorBlack(), 10.0, 30.0);
        DrawText('Press space to end test', ColorBlack(), 10.0, 50.0);
        StartPanel('Test Panel', RectangleFrom(10.0, 70.0, 300.0, 200.0));
        SetLayoutHeight(100);
        Button('Test Button');
        EndPanel('Test Panel');
        DrawInterface();
        RefreshScreen();
    end;
end;
procedure TestSingleLineLayoutIntegration;
begin
    testWindow := OpenWindow('Test Window', 800, 600);
    CleanupWindow := TWindowCleanup.Create;
    while KeyTyped(KeyCode.SPACE_KEY) = false do
        ProcessEvents();
        ClearScreen();
        DrawText('Test: single_line_layout', ColorBlack(), 10.0, 10.0);
        DrawText('Expected: Two buttons arranged horizontally in a single line', ColorBlack(), 10.0, 30.0);
        DrawText('Press space to end test', ColorBlack(), 10.0, 50.0);
        StartPanel('Test Panel', RectangleFrom(10.0, 70.0, 300.0, 200.0));
        SingleLineLayout();
        Button('Button 1');
        Button('Button 2');
        EndPanel('Test Panel');
        DrawInterface();
        RefreshScreen();
    end;
end;
procedure TestSliderAtPositionIntegration;
begin
    testWindow := OpenWindow('Test Window', 800, 600);
    CleanupWindow := TWindowCleanup.Create;
    testRect := RectangleFrom(100.0, 100.0, 200.0, 20.0);
    initialValue := 50.0;
    sliderResult := initialValue;
    while KeyTyped(KeyCode.SPACE_KEY) = false do
        ProcessEvents();
        ClearScreen();
        DrawText('Test: slider_at_position', ColorBlack(), 10.0, 10.0);
        DrawText('Expected: Slider with initial value 50, range 0-100 at position (100,100)', ColorBlack(), 10.0, 30.0);
        DrawText('Change the value and press space to pass', ColorBlack(), 10.0, 50.0);
        sliderResult = Slider(sliderResult, 0.0, 100.0, testRect);
        DrawInterface();
        RefreshScreen();
    end;
    AssertNotEquals(initialValue, sliderResult);
end;
procedure TestSliderIntegration;
begin
    testWindow := OpenWindow('Test Window', 800, 600);
    CleanupWindow := TWindowCleanup.Create;
    initialValue := 50.0;
    sliderResult := initialValue;
    while KeyTyped(KeyCode.SPACE_KEY) = false do
        ProcessEvents();
        ClearScreen();
        DrawText('Test: slider', ColorBlack(), 10.0, 10.0);
        DrawText('Expected: Slider with initial value 50, range 0-100 using default layout', ColorBlack(), 10.0, 30.0);
        DrawText('Change the value and press space to pass', ColorBlack(), 10.0, 50.0);
        StartPanel('Test Panel', RectangleFrom(10.0, 70.0, 300.0, 200.0));
        sliderResult = Slider(sliderResult, 0.0, 100.0);
        EndPanel('Test Panel');
        DrawInterface();
        RefreshScreen();
    end;
    AssertNotEquals(initialValue, sliderResult);
end;
procedure TestSliderLabeledIntegration;
begin
    testWindow := OpenWindow('Test Window', 800, 600);
    CleanupWindow := TWindowCleanup.Create;
    initialValue := 50.0;
    sliderResult := initialValue;
    while KeyTyped(KeyCode.SPACE_KEY) = false do
        ProcessEvents();
        ClearScreen();
        DrawText('Test: slider_labeled', ColorBlack(), 10.0, 10.0);
        DrawText('Expected: Labeled slider with initial value 50, range 0-100 using default layout', ColorBlack(), 10.0, 30.0);
        DrawText('Change the value and press space to pass', ColorBlack(), 10.0, 50.0);
        StartPanel('Test Panel', RectangleFrom(10.0, 70.0, 300.0, 200.0));
        SetInterfaceLabelWidth(100);
        sliderResult = Slider('Test Slider', sliderResult, 0.0, 100.0);
        EndPanel('Test Panel');
        DrawInterface();
        RefreshScreen();
    end;
    AssertNotEquals(initialValue, sliderResult);
end;
procedure TestSplitIntoColumnsIntegration;
begin
    testWindow := OpenWindow('Test Window', 800, 600);
    CleanupWindow := TWindowCleanup.Create;
    while KeyTyped(KeyCode.SPACE_KEY) = false do
        ProcessEvents();
        ClearScreen();
        DrawText('Test: split_into_columns', ColorBlack(), 10.0, 10.0);
        DrawText('Expected: Three buttons arranged in equal columns', ColorBlack(), 10.0, 30.0);
        DrawText('Press space to end test', ColorBlack(), 10.0, 50.0);
        StartPanel('Test Panel', RectangleFrom(10.0, 70.0, 300.0, 200.0));
        StartCustomLayout();
        SplitIntoColumns(3);
        Button('Button 1');
        Button('Button 2');
        Button('Button 3');
        EndPanel('Test Panel');
        DrawInterface();
        RefreshScreen();
    end;
end;
procedure TestSplitIntoColumnsWithLastWidthIntegration;
begin
    testWindow := OpenWindow('Test Window', 800, 600);
    CleanupWindow := TWindowCleanup.Create;
    while KeyTyped(KeyCode.SPACE_KEY) = false do
        ProcessEvents();
        ClearScreen();
        DrawText('Test: split_into_columns_with_last_width', ColorBlack(), 10.0, 10.0);
        DrawText('Expected: Three buttons with last column width 200px', ColorBlack(), 10.0, 30.0);
        DrawText('Press space to end test', ColorBlack(), 10.0, 50.0);
        StartPanel('Test Panel', RectangleFrom(10.0, 70.0, 300.0, 200.0));
        StartCustomLayout();
        SplitIntoColumns(3, 200);
        Button('Button 1');
        Button('Button 2');
        Button('Button 3');
        EndPanel('Test Panel');
        DrawInterface();
        RefreshScreen();
    end;
end;
procedure TestSplitIntoColumnsRelativeWithLastWidthIntegration;
begin
    testWindow := OpenWindow('Test Window', 800, 600);
    CleanupWindow := TWindowCleanup.Create;
    while KeyTyped(KeyCode.SPACE_KEY) = false do
        ProcessEvents();
        ClearScreen();
        DrawText('Test: split_into_columns_relative_with_last_width', ColorBlack(), 10.0, 10.0);
        DrawText('Expected: Three buttons with last column 50% of panel width', ColorBlack(), 10.0, 30.0);
        DrawText('Press space to end test', ColorBlack(), 10.0, 50.0);
        StartPanel('Test Panel', RectangleFrom(10.0, 70.0, 300.0, 200.0));
        StartCustomLayout();
        SplitIntoColumnsRelative(3, 0.5);
        Button('Button 1');
        Button('Button 2');
        Button('Button 3');
        ResetLayout();
        EndPanel('Test Panel');
        DrawInterface();
        RefreshScreen();
    end;
end;
procedure TestStartCustomLayoutIntegration;
begin
    testWindow := OpenWindow('Test Window', 800, 600);
    CleanupWindow := TWindowCleanup.Create;
    while KeyTyped(KeyCode.SPACE_KEY) = false do
        ProcessEvents();
        ClearScreen();
        DrawText('Test: start_custom_layout', ColorBlack(), 10.0, 10.0);
        DrawText('Expected: Button in 200px wide column', ColorBlack(), 10.0, 30.0);
        DrawText('Press space to end test', ColorBlack(), 10.0, 50.0);
        StartPanel('Test Panel', RectangleFrom(10.0, 70.0, 300.0, 200.0));
        StartCustomLayout();
        AddColumn(200);
        Button('Test Button');
        EndPanel('Test Panel');
        DrawInterface();
        RefreshScreen();
    end;
end;
procedure TestStartInsetAtPositionIntegration;
begin
    testWindow := OpenWindow('Test Window', 800, 600);
    CleanupWindow := TWindowCleanup.Create;
    testRect := RectangleFrom(10.0, 70.0, 300.0, 200.0);
    while KeyTyped(KeyCode.SPACE_KEY) = false do
        ProcessEvents();
        ClearScreen();
        DrawText('Test: start_inset_at_position', ColorBlack(), 10.0, 10.0);
        DrawText('Expected: An inset at position (10,70) containing a button using default layout', ColorBlack(), 10.0, 30.0);
        DrawText('Press space to end test', ColorBlack(), 10.0, 50.0);
        StartInset('test_inset', testRect);
        Button('Test Button');
        EndInset('test_inset');
        DrawInterface();
        RefreshScreen();
    end;
end;
procedure TestStartInsetIntegration;
begin
    testWindow := OpenWindow('Test Window', 800, 600);
    CleanupWindow := TWindowCleanup.Create;
    while KeyTyped(KeyCode.SPACE_KEY) = false do
        ProcessEvents();
        ClearScreen();
        DrawText('Test: start_inset', ColorBlack(), 10.0, 10.0);
        DrawText('Expected: An inset with height 60 pixels containing a button', ColorBlack(), 10.0, 30.0);
        DrawText('Press space to end test', ColorBlack(), 10.0, 50.0);
        StartPanel('Test Panel', RectangleFrom(0.0, 70.0, 800.0, 530.0));
        StartInset('Test Inset', 60);
        Button('Test Button');
        EndInset('Test Inset');
        EndPanel('Test Panel');
        DrawInterface();
        RefreshScreen();
    end;
end;
procedure TestStartPanelIntegration;
begin
    testWindow := OpenWindow('Test Window', 800, 600);
    CleanupWindow := TWindowCleanup.Create;
    testRectangle := RectangleFrom(10.0, 70.0, 300.0, 200.0);
    while KeyTyped(KeyCode.SPACE_KEY) = false do
        ProcessEvents();
        ClearScreen();
        DrawText('Test: start_panel', ColorBlack(), 10.0, 10.0);
        DrawText('Expected: Panel with button', ColorBlack(), 10.0, 30.0);
        DrawText('Press space to end test', ColorBlack(), 10.0, 50.0);
        StartPanel('Test Panel', testRectangle);
        Button('Test Button');
        EndPanel('Test Panel');
        DrawInterface();
        RefreshScreen();
    end;
end;
procedure TestStartPopupIntegration;
begin
    testWindow := OpenWindow('Test Window', 800, 600);
    CleanupWindow := TWindowCleanup.Create;
    while KeyTyped(KeyCode.SPACE_KEY) = false do
        ProcessEvents();
        ClearScreen();
        DrawText('Test: start_popup', ColorBlack(), 10.0, 10.0);
        DrawText('Expected: Click the button to show a popup with a label', ColorBlack(), 10.0, 30.0);
        DrawText('Press space to end test', ColorBlack(), 10.0, 50.0);
        StartPanel('Test Panel', RectangleFrom(0.0, 70.0, 800.0, 530.0));
        if Button('Open Popup') = true then
        OpenPopup('Test Popup');
    end;
    if StartPopup('Test Popup') = true then
    SingleLineLayout();
    SetInterfaceLabelWidth(200);
    LabelElement('Test Label');
    EndPopup('Test Popup');
end;
EndPanel('Test Panel');
DrawInterface();
RefreshScreen();
end;
end;
procedure TestStartTreenodeIntegration;
begin
    testWindow := OpenWindow('Test Window', 800, 600);
    CleanupWindow := TWindowCleanup.Create;
    while KeyTyped(KeyCode.SPACE_KEY) = false do
        ProcessEvents();
        ClearScreen();
        DrawText('Test: start_treenode', ColorBlack(), 10.0, 10.0);
        DrawText('Expected: A panel containing a collapsible tree node with a button', ColorBlack(), 10.0, 30.0);
        DrawText('Press space to end test', ColorBlack(), 10.0, 50.0);
        StartPanel('Test Panel', RectangleFrom(10.0, 70.0, 200.0, 200.0));
        if StartTreenode('Test Node') = true then
        Button('Test Button');
        EndTreenode('Test Node');
    end;
    EndPanel('Test Panel');
    DrawInterface();
    RefreshScreen();
end;
end;
procedure TestTextBoxIntegration;
begin
    testWindow := OpenWindow('Test Window', 800, 600);
    CleanupWindow := TWindowCleanup.Create;
    initialText := 'Initial Text';
    textResult := initialText;
    while KeyTyped(KeyCode.SPACE_KEY) = false do
        ProcessEvents();
        ClearScreen();
        DrawText('Test: text_box', ColorBlack(), 10.0, 10.0);
        DrawText('Expected: Text box with editable text', ColorBlack(), 10.0, 30.0);
        DrawText('Change the text and press space to pass', ColorBlack(), 10.0, 50.0);
        StartPanel('Test Panel', RectangleFrom(10.0, 70.0, 300.0, 200.0));
        textResult = TextBox(textResult);
        EndPanel('Test Panel');
        DrawInterface();
        RefreshScreen();
    end;
    AssertNotEquals(initialText, textResult);
end;
procedure TestTextBoxAtPositionIntegration;
begin
    testWindow := OpenWindow('Test Window', 800, 600);
    CleanupWindow := TWindowCleanup.Create;
    testRect := RectangleFrom(10.0, 70.0, 300.0, 30.0);
    initialText := 'Initial Text';
    textResult := initialText;
    while KeyTyped(KeyCode.SPACE_KEY) = false do
        ProcessEvents();
        ClearScreen();
        DrawText('Test: text_box_at_position', ColorBlack(), 10.0, 10.0);
        DrawText('Expected: Text box at position (10,70) with size 300x30', ColorBlack(), 10.0, 30.0);
        DrawText('Change the text and press space to pass', ColorBlack(), 10.0, 50.0);
        textResult = TextBox(textResult, testRect);
        DrawInterface();
        RefreshScreen();
    end;
    AssertNotEquals(initialText, textResult);
end;
procedure TestTextBoxLabeledIntegration;
begin
    testWindow := OpenWindow('Test Window', 800, 600);
    CleanupWindow := TWindowCleanup.Create;
    initialText := 'Initial Text';
    textResult := initialText;
    while KeyTyped(KeyCode.SPACE_KEY) = false do
        ProcessEvents();
        ClearScreen();
        DrawText('Test: text_box_labeled', ColorBlack(), 10.0, 10.0);
        DrawText('Expected: Labeled text box with editable text', ColorBlack(), 10.0, 30.0);
        DrawText('Change the text and press space to pass', ColorBlack(), 10.0, 50.0);
        StartPanel('Test Panel', RectangleFrom(10.0, 70.0, 300.0, 200.0));
        SetInterfaceLabelWidth(100);
        textResult = TextBox('Test Text Box', textResult);
        EndPanel('Test Panel');
        DrawInterface();
        RefreshScreen();
    end;
    AssertNotEquals(initialText, textResult);
end;
end;

procedure RegisterTests;
begin
    #<Proc:0x00007fbbcab52da8 /mnt/c/Users/Noahc/Documents/aYear_2_semester_2/TeamProject/GitHubRepo/splashkit_test_generator/test_generator/config/languages/pascal_config.rb:138 (lambda)>
end;
