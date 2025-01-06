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
    OpenWindow('Test Window 1', 800, 600);
    CleanupWindow := TWindowCleanup.Create;
    ProcessEvents();
    while KeyDown(KeyCode.SPACE_KEY) = false do
        ProcessEvents();
        ClearScreen();
        DrawText('Test: add_column', ColorBlack(), 10.0, 10.0);
        DrawText('Expected: Two columns - first 100px wide, second fills remaining space', ColorBlack(), 10.0, 30.0);
        DrawText('Press space to end test', ColorBlack(), 10.0, 50.0);
        StartPanel('Test Panel 1', RectangleFrom(0.0, 70.0, 800.0, 530.0));
        StartCustomLayout();
        AddColumn(100);
        AddColumn(-1);
        Button('Left Column');
        Button('Right Column');
        EndPanel('Test Panel 1');
        DrawInterface();
        RefreshScreen();
    end;
end;
procedure TestAddColumnRelativeIntegration;
begin
    OpenWindow('Test Window 2', 800, 600);
    CleanupWindow := TWindowCleanup.Create;
    ProcessEvents();
    while KeyDown(KeyCode.SPACE_KEY) = false do
        ProcessEvents();
        ClearScreen();
        DrawText('Test: add_column_relative', ColorBlack(), 10.0, 10.0);
        DrawText('Expected: Two equal-width columns (50% each)', ColorBlack(), 10.0, 30.0);
        DrawText('Press space to end test', ColorBlack(), 10.0, 50.0);
        StartPanel('Test Panel 2', RectangleFrom(0.0, 70.0, 800.0, 530.0));
        StartCustomLayout();
        AddColumnRelative(0.5);
        AddColumnRelative(0.5);
        Button('Left Column');
        Button('Right Column');
        EndPanel('Test Panel 2');
        DrawInterface();
        RefreshScreen();
    end;
end;
procedure TestBitmapButtonIntegration;
begin
    OpenWindow('Test Window 3', 800, 600);
    CleanupWindow := TWindowCleanup.Create;
    testBitmap := CreateBitmap('Test Bitmap 1', 100, 100);
    CleanupBitmap := TBitmapCleanup.Create;
    ClearBitmap(testBitmap, ColorRed());
    buttonClicked := false;
    while buttonClicked = false do
        ProcessEvents();
        ClearScreen();
        DrawText('Test: bitmap_button', ColorBlack(), 10.0, 10.0);
        DrawText('Expected: A clickable button with a red bitmap image', ColorBlack(), 10.0, 30.0);
        DrawText('Click the button to end test', ColorBlack(), 10.0, 50.0);
        StartPanel('Test Panel 3', RectangleFrom(0.0, 70.0, 800.0, 530.0));
        SetLayoutHeight(100);
        buttonClicked = BitmapButton(testBitmap);
        EndPanel('Test Panel 3');
        DrawInterface();
        RefreshScreen();
    end;
    AssertTrue(buttonClicked);
end;
procedure TestBitmapButtonAtPositionIntegration;
begin
    OpenWindow('Test Window 4', 800, 600);
    CleanupWindow := TWindowCleanup.Create;
    testBitmap := CreateBitmap('Test Bitmap 2', 100, 100);
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
    OpenWindow('Test Window 5', 800, 600);
    CleanupWindow := TWindowCleanup.Create;
    testBitmap := CreateBitmap('Test Bitmap 3', 100, 100);
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
    OpenWindow('Test Window 6', 800, 600);
    CleanupWindow := TWindowCleanup.Create;
    testBitmap := CreateBitmap('Test Bitmap 4', 100, 100);
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
        StartPanel('Test Panel 4', RectangleFrom(0.0, 70.0, 800.0, 530.0));
        SetLayoutHeight(50);
        buttonClicked = BitmapButton(testBitmap, testOptions2);
        EndPanel('Test Panel 4');
        DrawInterface();
        RefreshScreen();
    end;
    AssertTrue(buttonClicked);
end;
procedure TestBitmapButtonLabeledIntegration;
begin
    OpenWindow('Test Window 7', 800, 600);
    CleanupWindow := TWindowCleanup.Create;
    testBitmap := CreateBitmap('Test Bitmap 5', 20, 20);
    ClearBitmap(testBitmap, ColorRed());
    CleanupBitmap := TBitmapCleanup.Create;
    buttonClicked := false;
    while buttonClicked = false do
        ProcessEvents();
        ClearScreen();
        DrawText('Test: bitmap_button_labeled', ColorBlack(), 10.0, 10.0);
        DrawText('Expected: A red bitmap button with label 'Click Me'', ColorBlack(), 10.0, 30.0);
        DrawText('Click the button to end test', ColorBlack(), 10.0, 50.0);
        StartPanel('Test Panel 5', RectangleFrom(0.0, 70.0, 800.0, 530.0));
        buttonClicked = BitmapButton('Click Me', testBitmap);
        EndPanel('Test Panel 5');
        DrawInterface();
        RefreshScreen();
    end;
    AssertTrue(buttonClicked);
end;
procedure TestBitmapButtonLabeledWithOptionsIntegration;
begin
    OpenWindow('Test Window 8', 800, 600);
    CleanupWindow := TWindowCleanup.Create;
    testBitmap := CreateBitmap('Test Bitmap 6', 20, 20);
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
        StartPanel('Test Panel 6', RectangleFrom(0.0, 70.0, 800.0, 530.0));
        buttonClicked = BitmapButton('Click Me', testBitmap, testOptions2);
        EndPanel('Test Panel 6');
        DrawInterface();
        RefreshScreen();
    end;
    AssertTrue(buttonClicked);
end;
procedure TestButtonAtPositionIntegration;
begin
    OpenWindow('Test Window 9', 800, 600);
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
    OpenWindow('Test Window 10', 800, 600);
    CleanupWindow := TWindowCleanup.Create;
    buttonClicked := false;
    while buttonClicked = false do
        ProcessEvents();
        ClearScreen();
        DrawText('Test: button', ColorBlack(), 10.0, 10.0);
        DrawText('Expected: A button with text 'Click Me' using default layout', ColorBlack(), 10.0, 30.0);
        DrawText('Click the button to end test', ColorBlack(), 10.0, 50.0);
        StartPanel('Test Panel 7', RectangleFrom(0.0, 70.0, 800.0, 530.0));
        buttonClicked = Button('Click Me');
        EndPanel('Test Panel 7');
        DrawInterface();
        RefreshScreen();
    end;
    AssertTrue(buttonClicked);
end;
procedure TestButtonLabeledIntegration;
begin
    OpenWindow('Test Window 11', 800, 600);
    CleanupWindow := TWindowCleanup.Create;
    buttonClicked := false;
    while buttonClicked = false do
        ProcessEvents();
        ClearScreen();
        DrawText('Test: button_labeled', ColorBlack(), 10.0, 10.0);
        DrawText('Expected: A button with text 'Click Me' and label 'Label:' in a two-column layout', ColorBlack(), 10.0, 30.0);
        DrawText('Click the button to end test', ColorBlack(), 10.0, 50.0);
        StartPanel('Test Panel 8', RectangleFrom(0.0, 70.0, 800.0, 530.0));
        buttonClicked = Button('Label:', 'Click Me');
        EndPanel('Test Panel 8');
        DrawInterface();
        RefreshScreen();
    end;
    AssertTrue(buttonClicked);
end;
procedure TestCheckboxAtPositionIntegration;
begin
    OpenWindow('Test Window 12', 800, 600);
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
    OpenWindow('Test Window 13', 800, 600);
    CleanupWindow := TWindowCleanup.Create;
    initialCheckboxResult := false;
    currentCheckboxResult := initialCheckboxResult;
    while currentCheckboxResult = false do
        ProcessEvents();
        ClearScreen();
        DrawText('Test: checkbox', ColorBlack(), 10.0, 10.0);
        DrawText('Expected: A checkbox with text 'Test Checkbox' using default layout', ColorBlack(), 10.0, 30.0);
        DrawText('Click the checkbox to end test', ColorBlack(), 10.0, 50.0);
        StartPanel('Test Panel 9', RectangleFrom(0.0, 70.0, 800.0, 530.0));
        currentCheckboxResult = Checkbox('Test Checkbox', currentCheckboxResult);
        EndPanel('Test Panel 9');
        DrawInterface();
        RefreshScreen();
    end;
    AssertTrue(currentCheckboxResult);
end;
procedure TestCheckboxLabeledIntegration;
begin
    OpenWindow('Test Window 14', 800, 600);
    CleanupWindow := TWindowCleanup.Create;
    initialCheckboxResult := false;
    currentCheckboxResult := initialCheckboxResult;
    while currentCheckboxResult = false do
        ProcessEvents();
        ClearScreen();
        DrawText('Test: checkbox_labeled', ColorBlack(), 10.0, 10.0);
        DrawText('Expected: A checkbox with text 'Check me' and label 'Test Checkbox' in a two-column layout', ColorBlack(), 10.0, 30.0);
        DrawText('Click the checkbox to end test', ColorBlack(), 10.0, 50.0);
        StartPanel('Test Panel 10', RectangleFrom(0.0, 70.0, 800.0, 530.0));
        SetInterfaceLabelWidth(110);
        currentCheckboxResult = Checkbox('Test Checkbox', 'Check me', currentCheckboxResult);
        EndPanel('Test Panel 10');
        DrawInterface();
        RefreshScreen();
    end;
    AssertTrue(currentCheckboxResult);
end;
procedure TestColorSliderAtPositionIntegration;
begin
    OpenWindow('Test Window 15', 800, 600);
    CleanupWindow := TWindowCleanup.Create;
    initialColor := ColorBlack();
    currentColor := initialColor;
    ProcessEvents();
    while KeyDown(KeyCode.SPACE_KEY) = false do
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
    OpenWindow('Test Window 16', 800, 600);
    CleanupWindow := TWindowCleanup.Create;
    initialColor := ColorBlack();
    currentColor := initialColor;
    ProcessEvents();
    while KeyDown(KeyCode.SPACE_KEY) = false do
        ProcessEvents();
        ClearScreen();
        DrawText('Test: color_slider', ColorBlack(), 10.0, 10.0);
        DrawText('Expected: A color slider with RGBA controls using default layout', ColorBlack(), 10.0, 30.0);
        DrawText('Change the color and press space to pass', ColorBlack(), 10.0, 50.0);
        StartPanel('Test Panel 11', RectangleFrom(0.0, 70.0, 800.0, 530.0));
        currentColor = ColorSlider(currentColor);
        EndPanel('Test Panel 11');
        DrawInterface();
        RefreshScreen();
    end;
    AssertFalse(QuitRequested());
end;
procedure TestColorSliderLabeledIntegration;
begin
    OpenWindow('Test Window 17', 800, 600);
    CleanupWindow := TWindowCleanup.Create;
    initialColor := ColorBlack();
    currentColor := initialColor;
    ProcessEvents();
    while KeyDown(KeyCode.SPACE_KEY) = false do
        ProcessEvents();
        ClearScreen();
        DrawText('Test: color_slider_labeled', ColorBlack(), 10.0, 10.0);
        DrawText('Expected: A color slider with label 'Test Color Slider' in a two-column layout', ColorBlack(), 10.0, 30.0);
        DrawText('Change the color and press space to pass', ColorBlack(), 10.0, 50.0);
        SetInterfaceLabelWidth(120);
        StartPanel('Test Panel 12', RectangleFrom(0.0, 70.0, 800.0, 530.0));
        currentColor = ColorSlider('Test Color Slider', currentColor);
        EndPanel('Test Panel 12');
        DrawInterface();
        RefreshScreen();
    end;
    AssertNotEquals(initialColor, currentColor);
end;
procedure TestDisableInterfaceIntegration;
begin
    OpenWindow('Test Window 18', 800, 600);
    CleanupWindow := TWindowCleanup.Create;
    buttonClicked := false;
    AssertTrue(InterfaceEnabled());
    DisableInterface();
    ProcessEvents();
    while KeyDown(KeyCode.SPACE_KEY) = false do
        ProcessEvents();
        ClearScreen();
        DrawText('Test: disable_interface', ColorBlack(), 10.0, 10.0);
        DrawText('Expected: A button that is disabled', ColorBlack(), 10.0, 30.0);
        DrawText('Click the button and press space to verify that the button is disabled', ColorBlack(), 10.0, 50.0);
        StartPanel('Test Panel 13', RectangleFrom(0.0, 70.0, 800.0, 530.0));
        buttonClicked = Button('Try to click me');
        EndPanel('Test Panel 13');
        DrawInterface();
        RefreshScreen();
    end;
    AssertFalse(InterfaceEnabled());
    AssertFalse(buttonClicked);
    EnableInterface();
end;
procedure TestDrawInterfaceIntegration;
begin
    OpenWindow('Test Window 19', 800, 600);
    CleanupWindow := TWindowCleanup.Create;
    ProcessEvents();
    while KeyDown(KeyCode.SPACE_KEY) = false do
        ProcessEvents();
        ClearScreen();
        DrawText('Test: draw_interface', ColorBlack(), 10.0, 10.0);
        DrawText('Expected: A panel at position (100,100) with size 200x200', ColorBlack(), 10.0, 30.0);
        DrawText('Press space to end test', ColorBlack(), 10.0, 50.0);
        StartPanel('Test Panel 14', RectangleFrom(100.0, 100.0, 200.0, 200.0));
        Button('Test Button');
        EndPanel('Test Panel 14');
        DrawInterface();
        RefreshScreen();
    end;
end;
procedure TestEnableInterfaceIntegration;
begin
    OpenWindow('Test Window 20', 800, 600);
    CleanupWindow := TWindowCleanup.Create;
    DisableInterface();
    ProcessEvents();
    while KeyDown(KeyCode.SPACE_KEY) = false do
        ProcessEvents();
        ClearScreen();
        DrawText('Test: enable_interface', ColorBlack(), 10.0, 10.0);
        DrawText('Expected: Button should be disabled', ColorBlack(), 10.0, 30.0);
        DrawText('Press space to continue', ColorBlack(), 10.0, 50.0);
        StartPanel('Test Panel 15', RectangleFrom(0.0, 70.0, 800.0, 530.0));
        Button('Test Button');
        EndPanel('Test Panel 15');
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
        StartPanel('Test Panel 16', RectangleFrom(0.0, 70.0, 800.0, 530.0));
        buttonClicked = Button('Test Button');
        EndPanel('Test Panel 16');
        DrawInterface();
        RefreshScreen();
    end;
    AssertTrue(InterfaceEnabled());
    AssertTrue(buttonClicked);
end;
procedure TestEndInsetIntegration;
begin
    OpenWindow('Test Window 21', 800, 600);
    CleanupWindow := TWindowCleanup.Create;
    ProcessEvents();
    while KeyDown(KeyCode.SPACE_KEY) = false do
        ProcessEvents();
        ClearScreen();
        DrawText('Test: end_inset', ColorBlack(), 10.0, 10.0);
        DrawText('Expected: An inset with height 60 pixels containing a button', ColorBlack(), 10.0, 30.0);
        DrawText('Press space to end test', ColorBlack(), 10.0, 50.0);
        StartPanel('Test Panel 17', RectangleFrom(0.0, 70.0, 800.0, 530.0));
        StartInset('Test Inset', 60);
        Button('Test Button');
        EndInset('Test Inset');
        EndPanel('Test Panel 17');
        DrawInterface();
        RefreshScreen();
    end;
end;
procedure TestEndPanelIntegration;
begin
    OpenWindow('Test Window 22', 800, 600);
    CleanupWindow := TWindowCleanup.Create;
    ProcessEvents();
    while KeyDown(KeyCode.SPACE_KEY) = false do
        ProcessEvents();
        ClearScreen();
        DrawText('Test: end_panel', ColorBlack(), 10.0, 10.0);
        DrawText('Expected: A panel at position (100,100) with size 200x200 containing a button', ColorBlack(), 10.0, 30.0);
        DrawText('Press space to end test', ColorBlack(), 10.0, 50.0);
        StartPanel('Test Panel 18', RectangleFrom(100.0, 100.0, 200.0, 200.0));
        Button('Test Button');
        EndPanel('Test Panel 18');
        DrawInterface();
        RefreshScreen();
    end;
end;
procedure TestEndPopupIntegration;
begin
    OpenWindow('Test Window 23', 800, 600);
    CleanupWindow := TWindowCleanup.Create;
    ProcessEvents();
    while KeyDown(KeyCode.SPACE_KEY) = false do
        ProcessEvents();
        ClearScreen();
        DrawText('Test: end_popup', ColorBlack(), 10.0, 10.0);
        DrawText('Expected: Click the button to show a popup with a label', ColorBlack(), 10.0, 30.0);
        DrawText('Press space to end test', ColorBlack(), 10.0, 50.0);
        StartPanel('Test Panel 19', RectangleFrom(0.0, 70.0, 800.0, 530.0));
        if Button('Open Popup') = true then
        OpenPopup('Test Popup');
    end;
    if StartPopup('Test Popup') = true then
    SingleLineLayout();
    SetInterfaceLabelWidth(200);
    LabelElement('Test Label');
    EndPopup('Test Popup');
end;
EndPanel('Test Panel 19');
DrawInterface();
RefreshScreen();
end;
end;
procedure TestEndTreenodeIntegration;
begin
    OpenWindow('Test Window 24', 800, 600);
    CleanupWindow := TWindowCleanup.Create;
    ProcessEvents();
    while KeyDown(KeyCode.SPACE_KEY) = false do
        ProcessEvents();
        ClearScreen();
        DrawText('Test: end_treenode', ColorBlack(), 10.0, 10.0);
        DrawText('Expected: A panel containing a collapsible tree node with a button', ColorBlack(), 10.0, 30.0);
        DrawText('Press space to end test', ColorBlack(), 10.0, 50.0);
        StartPanel('Test Panel 20', RectangleFrom(10.0, 70.0, 200.0, 200.0));
        if StartTreenode('Test Node') = true then
        Button('Test Button');
        EndTreenode('Test Node');
    end;
    EndPanel('Test Panel 20');
    DrawInterface();
    RefreshScreen();
end;
end;
procedure TestEnterColumnIntegration;
begin
    OpenWindow('Test Window 25', 800, 600);
    CleanupWindow := TWindowCleanup.Create;
    ProcessEvents();
    while KeyDown(KeyCode.SPACE_KEY) = false do
        ProcessEvents();
        ClearScreen();
        DrawText('Test: enter_column', ColorBlack(), 10.0, 10.0);
        DrawText('Expected: A panel with a 100-pixel wide column containing a button', ColorBlack(), 10.0, 30.0);
        DrawText('Test Button', ColorBlack(), 10.0, 50.0);
        StartPanel('Test Panel 21', RectangleFrom(10.0, 70.0, 300.0, 200.0));
        AddColumn(100);
        EnterColumn();
        Button('Test Button');
        LeaveColumn();
        EndPanel('Test Panel 21');
        DrawInterface();
        RefreshScreen();
    end;
end;
procedure TestGetInterfaceLabelWidthIntegration;
begin
    ProcessEvents();
    SetInterfaceLabelWidth(100);
    testLabelWidth := GetInterfaceLabelWidth();
    AssertEquals(100, testLabelWidth);
end;
procedure TestHeaderIntegration;
begin
    OpenWindow('Test Window 26', 800, 600);
    CleanupWindow := TWindowCleanup.Create;
    ProcessEvents();
    while KeyDown(KeyCode.SPACE_KEY) = false do
        ProcessEvents();
        ClearScreen();
        DrawText('Test: header', ColorBlack(), 10.0, 10.0);
        DrawText('Expected: A collapsible header labeled 'Test Header' with a button', ColorBlack(), 10.0, 30.0);
        DrawText('Press space to end test', ColorBlack(), 10.0, 50.0);
        StartPanel('Test Panel 22', RectangleFrom(10.0, 70.0, 300.0, 200.0));
        if Header('Test Header') = true then
        Button('Test Button');
    end;
    EndPanel('Test Panel 22');
    DrawInterface();
    RefreshScreen();
end;
end;
procedure TestHSBColorSliderAtPositionIntegration;
begin
    OpenWindow('Test Window 27', 800, 600);
    CleanupWindow := TWindowCleanup.Create;
    initialColor := ColorBlack();
    testRect := RectangleFrom(100.0, 100.0, 400.0, 24.0);
    currentColor := initialColor;
    ProcessEvents();
    while KeyDown(KeyCode.SPACE_KEY) = false do
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
    OpenWindow('Test Window 28', 800, 600);
    CleanupWindow := TWindowCleanup.Create;
    initialColor := ColorBlack();
    currentColor := initialColor;
    ProcessEvents();
    while KeyDown(KeyCode.SPACE_KEY) = false do
        ProcessEvents();
        ClearScreen();
        DrawText('Test: hsb_color_slider', ColorBlack(), 10.0, 10.0);
        DrawText('Expected: A HSB color slider using default layout', ColorBlack(), 10.0, 30.0);
        DrawText('Change the color and press space to pass', ColorBlack(), 10.0, 50.0);
        StartPanel('Test Panel 23', RectangleFrom(0.0, 70.0, 800.0, 530.0));
        currentColor = HSBColorSlider(currentColor);
        EndPanel('Test Panel 23');
        DrawInterface();
        RefreshScreen();
    end;
    AssertNotEquals(currentColor, initialColor);
end;
procedure TestHSBColorSliderLabeledIntegration;
begin
    OpenWindow('Test Window 29', 800, 600);
    CleanupWindow := TWindowCleanup.Create;
    initialColor := ColorBlack();
    currentColor := initialColor;
    ProcessEvents();
    while KeyDown(KeyCode.SPACE_KEY) = false do
        ProcessEvents();
        ClearScreen();
        DrawText('Test: hsb_color_slider_labeled', ColorBlack(), 10.0, 10.0);
        DrawText('Expected: A HSB color slider with label 'Color Slider' in a two-column layout', ColorBlack(), 10.0, 30.0);
        DrawText('Change the color and press space to pass', ColorBlack(), 10.0, 50.0);
        StartPanel('Test Panel 24', RectangleFrom(0.0, 70.0, 800.0, 530.0));
        SetInterfaceLabelWidth(100);
        currentColor = HSBColorSlider('Color Slider', currentColor);
        EndPanel('Test Panel 24');
        DrawInterface();
        RefreshScreen();
    end;
    AssertNotEquals(currentColor, initialColor);
end;
procedure TestInterfaceEnabledIntegration;
begin
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
    LayoutCleanup := TLayoutCleanup.Create;
    OpenWindow('Test Window 30', 800, 600);
    CleanupWindow := TWindowCleanup.Create;
    panelRectangle := RectangleFrom(0.0, 70.0, 800.0, 530.0);
    ProcessEvents();
    while KeyDown(KeyCode.SPACE_KEY) = false do
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
    OpenWindow('Test Window 31', 800, 600);
    CleanupWindow := TWindowCleanup.Create;
    ProcessEvents();
    while KeyDown(KeyCode.SPACE_KEY) = false do
        ProcessEvents();
        ClearScreen();
        DrawText('Test: label_element', ColorBlack(), 10.0, 10.0);
        DrawText('Expected: A label with text 'Test Label' using default layout', ColorBlack(), 10.0, 30.0);
        DrawText('Press space to end test', ColorBlack(), 10.0, 50.0);
        StartPanel('Test Panel 25', RectangleFrom(0.0, 70.0, 800.0, 530.0));
        LabelElement('Test Label');
        EndPanel('Test Panel 25');
        DrawInterface();
        RefreshScreen();
    end;
end;
procedure TestLabelElementAtPositionIntegration;
begin
    OpenWindow('Test Window 32', 800, 600);
    CleanupWindow := TWindowCleanup.Create;
    testRectangle := RectangleFrom(100.0, 100.0, 200.0, 50.0);
    ProcessEvents();
    while KeyDown(KeyCode.SPACE_KEY) = false do
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
    OpenWindow('Test Window 33', 800, 600);
    CleanupWindow := TWindowCleanup.Create;
    initialValue := 0.0;
    currentValue := 0.0;
    elementChanged := false;
    ProcessEvents();
    while KeyDown(KeyCode.SPACE_KEY) = false do
        ProcessEvents();
        ClearScreen();
        DrawText('Test: last_element_changed', ColorBlack(), 10.0, 10.0);
        DrawText('Expected: A slider that detects value changes', ColorBlack(), 10.0, 30.0);
        DrawText('Move the slider and press space to pass', ColorBlack(), 10.0, 50.0);
        StartPanel('Test Panel 26', RectangleFrom(0.0, 70.0, 800.0, 530.0));
        currentValue = Slider('Test Slider', currentValue, 0.0, 100.0);
        if LastElementChanged() = true then
        elementChanged = true;
    end;
    EndPanel('Test Panel 26');
    DrawInterface();
    RefreshScreen();
end;
AssertNotEquals(currentValue, initialValue);
AssertTrue(elementChanged);
end;
procedure TestLastElementConfirmedIntegration;
begin
    OpenWindow('Test Window 34', 800, 600);
    CleanupWindow := TWindowCleanup.Create;
    buttonClicked := false;
    ProcessEvents();
    while KeyDown(KeyCode.SPACE_KEY) = false do
        ProcessEvents();
        ClearScreen();
        DrawText('Test: last_element_confirmed', ColorBlack(), 10.0, 10.0);
        DrawText('Expected: A button that detects when clicked', ColorBlack(), 10.0, 30.0);
        DrawText('Click the button and press space to pass', ColorBlack(), 10.0, 50.0);
        StartPanel('Test Panel 27', RectangleFrom(0.0, 70.0, 800.0, 530.0));
        Button('Test Button');
        if LastElementConfirmed() = true then
        buttonClicked = true;
    end;
    EndPanel('Test Panel 27');
    DrawInterface();
    RefreshScreen();
end;
AssertTrue(buttonClicked);
end;
procedure TestLeaveColumnIntegration;
begin
    OpenWindow('Test Window 35', 800, 600);
    CleanupWindow := TWindowCleanup.Create;
    ProcessEvents();
    while KeyDown(KeyCode.SPACE_KEY) = false do
        ProcessEvents();
        ClearScreen();
        DrawText('Test: leave_column', ColorBlack(), 10.0, 10.0);
        DrawText('Expected: A button that appears after leaving a column with a width of 100', ColorBlack(), 10.0, 30.0);
        DrawText('Press space to end test', ColorBlack(), 10.0, 50.0);
        StartPanel('Test Panel 28', RectangleFrom(10.0, 70.0, 300.0, 200.0));
        StartCustomLayout();
        AddColumn(100);
        AddColumn(-1);
        EnterColumn();
        LeaveColumn();
        Button('Test Button');
        EndPanel('Test Panel 28');
        DrawInterface();
        RefreshScreen();
    end;
end;
procedure TestNumberBoxAtPositionIntegration;
begin
    OpenWindow('Test Window 36', 800, 600);
    CleanupWindow := TWindowCleanup.Create;
    testRect := RectangleFrom(100.0, 100.0, 200.0, 30.0);
    testResult := 5.0;
    ProcessEvents();
    while KeyDown(KeyCode.SPACE_KEY) = false do
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
    OpenWindow('Test Window 37', 800, 600);
    CleanupWindow := TWindowCleanup.Create;
    testResult := 5.0;
    ProcessEvents();
    while KeyDown(KeyCode.SPACE_KEY) = false do
        ProcessEvents();
        ClearScreen();
        DrawText('Test: number_box', ColorBlack(), 10.0, 10.0);
        DrawText('Expected: A number box with step size 1.0 using the default layout', ColorBlack(), 10.0, 30.0);
        DrawText('Change the number and press space to pass', ColorBlack(), 10.0, 50.0);
        StartPanel('Test Panel 29', RectangleFrom(10.0, 70.0, 300.0, 200.0));
        testResult = NumberBox(testResult, 1.0);
        EndPanel('Test Panel 29');
        DrawInterface();
        RefreshScreen();
    end;
    AssertNotEquals(5.0, testResult);
end;
procedure TestNumberBoxLabeledIntegration;
begin
    OpenWindow('Test Window 38', 800, 600);
    CleanupWindow := TWindowCleanup.Create;
    testResult := 5.0;
    ProcessEvents();
    while KeyDown(KeyCode.SPACE_KEY) = false do
        ProcessEvents();
        ClearScreen();
        DrawText('Test: number_box_labeled', ColorBlack(), 10.0, 10.0);
        DrawText('Expected: A labeled number box with step size 1.0 using the default layout', ColorBlack(), 10.0, 30.0);
        DrawText('Change the number and press space to pass', ColorBlack(), 10.0, 50.0);
        StartPanel('Test Panel 30', RectangleFrom(10.0, 70.0, 300.0, 200.0));
        SetInterfaceLabelWidth(100);
        testResult = NumberBox('Test Value', testResult, 1.0);
        EndPanel('Test Panel 30');
        DrawInterface();
        RefreshScreen();
    end;
    AssertNotEquals(5.0, testResult);
end;
procedure TestOpenPopupIntegration;
begin
    OpenWindow('Test Window 39', 800, 600);
    CleanupWindow := TWindowCleanup.Create;
    ProcessEvents();
    while KeyDown(KeyCode.SPACE_KEY) = false do
        ProcessEvents();
        ClearScreen();
        DrawText('Test: open_popup', ColorBlack(), 10.0, 10.0);
        DrawText('Expected: Click the button to show a popup with a label', ColorBlack(), 10.0, 30.0);
        DrawText('Press space to end test', ColorBlack(), 10.0, 50.0);
        StartPanel('Test Panel 31', RectangleFrom(0.0, 70.0, 800.0, 530.0));
        if Button('Open Popup') = true then
        OpenPopup('Test Popup');
    end;
    if StartPopup('Test Popup') = true then
    SingleLineLayout();
    SetInterfaceLabelWidth(200);
    LabelElement('Test Label');
    EndPopup('Test Popup');
end;
EndPanel('Test Panel 31');
DrawInterface();
RefreshScreen();
end;
end;
procedure TestParagraphIntegration;
begin
    LayoutCleanup := TLayoutCleanup.Create;
    OpenWindow('Test Window 40', 800, 600);
    CleanupWindow := TWindowCleanup.Create;
    ProcessEvents();
    SetInterfaceFont(LoadFont('hara', 'hara.ttf'));
    CleanupInterfaceFont := TInterfaceFontCleanup.Create;
    CleanupFont := TFontCleanup.Create;
    SetInterfaceFontSize(12);
    while KeyDown(KeyCode.SPACE_KEY) = false do
        ProcessEvents();
        ClearScreen();
        DrawText('Test: paragraph', ColorBlack(), 10.0, 10.0);
        DrawText('Expected: A paragraph of text that wraps correctly within the panel', ColorBlack(), 10.0, 30.0);
        DrawText('Press space to end test', ColorBlack(), 10.0, 50.0);
        StartPanel('Test Panel 32', RectangleFrom(10.0, 70.0, 300.0, 200.0));
        Paragraph('This is a test paragraph to check if the text wraps correctly. weguy YGWE FYw eiuofhWEOF wue fuhwbeuf WUEFU wue');
        EndPanel('Test Panel 32');
        DrawInterface();
        RefreshScreen();
    end;
    SetInterfaceFontSize(13);
end;
procedure TestParagraphAtPositionIntegration;
begin
    OpenWindow('Test Window 41', 800, 600);
    CleanupWindow := TWindowCleanup.Create;
    testRectangle := RectangleFrom(100.0, 100.0, 200.0, 100.0);
    ProcessEvents();
    while KeyDown(KeyCode.SPACE_KEY) = false do
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
    OpenWindow('Test Window 42', 800, 600);
    CleanupWindow := TWindowCleanup.Create;
    ProcessEvents();
    while KeyDown(KeyCode.SPACE_KEY) = false do
        ProcessEvents();
        ClearScreen();
        DrawText('Test: reset_layout', ColorBlack(), 10.0, 10.0);
        DrawText('Expected: The second button should not be confined to the created columns after reset', ColorBlack(), 10.0, 30.0);
        DrawText('Press space to end test', ColorBlack(), 10.0, 50.0);
        StartPanel('Test Panel 33', RectangleFrom(10.0, 70.0, 300.0, 200.0));
        StartCustomLayout();
        AddColumn(200);
        AddColumn(-1);
        Button('Button 1');
        ResetLayout();
        Button('Button 2');
        EndPanel('Test Panel 33');
        DrawInterface();
        RefreshScreen();
    end;
end;
procedure TestSetInterfaceAccentColorIntegration;
begin
    LayoutCleanup := TLayoutCleanup.Create;
    OpenWindow('Test Window 43', 800, 600);
    CleanupWindow := TWindowCleanup.Create;
    ProcessEvents();
    SetInterfaceAccentColor(ColorRed(), 0.5);
    while KeyDown(KeyCode.SPACE_KEY) = false do
        ProcessEvents();
        ClearScreen();
        DrawText('Test: set_interface_accent_color', ColorBlack(), 10.0, 10.0);
        DrawText('Expected: A button with red accent color at 50% contrast', ColorBlack(), 10.0, 30.0);
        DrawText('Press space to end test', ColorBlack(), 10.0, 50.0);
        StartPanel('Test Panel 34', RectangleFrom(10.0, 70.0, 300.0, 200.0));
        Button('Test Button');
        EndPanel('Test Panel 34');
        DrawInterface();
        RefreshScreen();
    end;
end;
procedure TestSetInterfaceBorderColorIntegration;
begin
    LayoutCleanup := TLayoutCleanup.Create;
    OpenWindow('Test Window 44', 800, 600);
    CleanupWindow := TWindowCleanup.Create;
    ProcessEvents();
    SetInterfaceBorderColor(ColorRed());
    while KeyDown(KeyCode.SPACE_KEY) = false do
        ProcessEvents();
        ClearScreen();
        DrawText('Test: set_interface_border_color', ColorBlack(), 10.0, 10.0);
        DrawText('Expected: A panel and button with red borders', ColorBlack(), 10.0, 30.0);
        DrawText('Press space to end test', ColorBlack(), 10.0, 50.0);
        StartPanel('Test Panel 35', RectangleFrom(10.0, 70.0, 300.0, 200.0));
        Button('Test Button');
        EndPanel('Test Panel 35');
        DrawInterface();
        RefreshScreen();
    end;
end;
procedure TestSetInterfaceColorsAutoIntegration;
begin
    LayoutCleanup := TLayoutCleanup.Create;
    OpenWindow('Test Window 45', 800, 600);
    CleanupWindow := TWindowCleanup.Create;
    ProcessEvents();
    SetInterfaceColorsAuto(ColorWhite(), ColorBlue(), 0.5, 0.7, 0.3);
    while KeyDown(KeyCode.SPACE_KEY) = false do
        ProcessEvents();
        ClearScreen();
        DrawText('Test: set_interface_colors_auto', ColorBlack(), 10.0, 10.0);
        DrawText('Expected: A panel with white main color and blue accent color', ColorBlack(), 10.0, 30.0);
        DrawText('Press space to end test', ColorBlack(), 10.0, 70.0);
        StartPanel('Test Panel 36', RectangleFrom(10.0, 90.0, 300.0, 200.0));
        Button('Test Button');
        EndPanel('Test Panel 36');
        DrawInterface();
        RefreshScreen();
    end;
end;
procedure TestSetInterfaceElementColorIntegration;
begin
    LayoutCleanup := TLayoutCleanup.Create;
    OpenWindow('Test Window 46', 800, 600);
    CleanupWindow := TWindowCleanup.Create;
    ProcessEvents();
    SetInterfaceElementColor(ColorBlack(), 0.5);
    while KeyDown(KeyCode.SPACE_KEY) = false do
        ProcessEvents();
        ClearScreen();
        DrawText('Test: set_interface_element_color', ColorBlack(), 10.0, 10.0);
        DrawText('Expected: A panel with black element color at 50% contrast', ColorBlack(), 10.0, 30.0);
        DrawText('Press space to end test', ColorBlack(), 10.0, 50.0);
        StartPanel('Test Panel 37', RectangleFrom(10.0, 70.0, 300.0, 200.0));
        Button('Test Button');
        EndPanel('Test Panel 37');
        DrawInterface();
        RefreshScreen();
    end;
end;
procedure TestSetInterfaceElementShadowsIntegration;
begin
    LayoutCleanup := TLayoutCleanup.Create;
    OpenWindow('Test Window 47', 800, 600);
    CleanupWindow := TWindowCleanup.Create;
    ProcessEvents();
    SetInterfaceElementShadows(10, ColorBlue(), PointAt(5.0, 5.0));
    while KeyDown(KeyCode.SPACE_KEY) = false do
        ProcessEvents();
        ClearScreen();
        DrawText('Test: set_interface_element_shadows', ColorBlack(), 10.0, 10.0);
        DrawText('Expected: Elements with blue shadow (radius: 10, offset: 5,5)', ColorBlack(), 10.0, 30.0);
        DrawText('Press space to end test', ColorBlack(), 10.0, 50.0);
        StartPanel('Test Panel 38', RectangleFrom(10.0, 70.0, 300.0, 200.0));
        Button('Test Button');
        EndPanel('Test Panel 38');
        DrawInterface();
        RefreshScreen();
    end;
end;
procedure TestSetInterfaceFontFontAsStringIntegration;
begin
    LayoutCleanup := TLayoutCleanup.Create;
    OpenWindow('Test Window 48', 800, 600);
    CleanupWindow := TWindowCleanup.Create;
    LoadFont('hara', 'hara.ttf');
    CleanupInterfaceFont := TInterfaceFontCleanup.Create;
    CleanupFont := TFontCleanup.Create;
    LoadFont('demolition', 'demolition.otf');
    ProcessEvents();
    while KeyDown(KeyCode.SPACE_KEY) = false do
        ProcessEvents();
        ClearScreen();
        DrawText('Test: set_interface_font_font_as_string', ColorBlack(), 10.0, 10.0);
        DrawText('Press space to end test', ColorBlack(), 10.0, 30.0);
        SetInterfaceFont('hara');
        StartPanel('Hara Font', RectangleFrom(10.0, 70.0, 300.0, 100.0));
        LabelElement('This text uses Hara font');
        EndPanel('Hara Font');
        SetInterfaceFont('demolition');
        StartPanel('Demolition Font', RectangleFrom(10.0, 180.0, 300.0, 100.0));
        LabelElement('This text uses Demolition font');
        EndPanel('Demolition Font');
        DrawInterface();
        RefreshScreen();
    end;
end;
procedure TestSetInterfaceFontIntegration;
begin
    LayoutCleanup := TLayoutCleanup.Create;
    OpenWindow('Test Window 49', 800, 600);
    CleanupWindow := TWindowCleanup.Create;
    haraFont := LoadFont('hara', 'hara.ttf');
    CleanupInterfaceFont := TInterfaceFontCleanup.Create;
    CleanupFont := TFontCleanup.Create;
    demolitionFont := LoadFont('demolition', 'demolition.otf');
    ProcessEvents();
    while KeyDown(KeyCode.SPACE_KEY) = false do
        ProcessEvents();
        ClearScreen();
        DrawText('Test: set_interface_font', ColorBlack(), 10.0, 10.0);
        DrawText('Press space to end test', ColorBlack(), 10.0, 30.0);
        SetInterfaceFont(haraFont);
        StartPanel('Hara Font', RectangleFrom(10.0, 70.0, 300.0, 100.0));
        LabelElement('This text uses Hara font');
        EndPanel('Hara Font');
        SetInterfaceFont(demolitionFont);
        StartPanel('Demolition Font', RectangleFrom(10.0, 180.0, 300.0, 100.0));
        LabelElement('This text uses Demolition font');
        EndPanel('Demolition Font');
        DrawInterface();
        RefreshScreen();
    end;
end;
procedure TestSetInterfaceFontSizeIntegration;
begin
    LayoutCleanup := TLayoutCleanup.Create;
    OpenWindow('Test Window 50', 800, 600);
    CleanupWindow := TWindowCleanup.Create;
    ProcessEvents();
    while KeyDown(KeyCode.SPACE_KEY) = false do
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
    SetInterfaceFontSize(13);
end;
procedure TestSetInterfaceLabelWidthIntegration;
begin
    OpenWindow('Test Window 51', 800, 600);
    CleanupWindow := TWindowCleanup.Create;
    SetInterfaceLabelWidth(100);
    AssertEquals(100, GetInterfaceLabelWidth());
end;
procedure TestSetInterfacePanelShadowsIntegration;
begin
    LayoutCleanup := TLayoutCleanup.Create;
    OpenWindow('Test Window 52', 800, 600);
    CleanupWindow := TWindowCleanup.Create;
    ProcessEvents();
    SetInterfacePanelShadows(10, ColorBlue(), PointAt(5.0, 5.0));
    while KeyDown(KeyCode.SPACE_KEY) = false do
        ProcessEvents();
        ClearScreen();
        DrawText('Test: set_interface_panel_shadows', ColorBlack(), 10.0, 10.0);
        DrawText('Expected: A panel with blue shadow (10px radius, 5px offset)', ColorBlack(), 10.0, 30.0);
        DrawText('Press space to end test', ColorBlack(), 10.0, 50.0);
        StartPanel('Test Panel 39', RectangleFrom(10.0, 70.0, 300.0, 200.0));
        Button('Test Button');
        EndPanel('Test Panel 39');
        DrawInterface();
        RefreshScreen();
    end;
end;
procedure TestSetInterfaceRootTextColorIntegration;
begin
    LayoutCleanup := TLayoutCleanup.Create;
    OpenWindow('Test Window 53', 800, 600);
    CleanupWindow := TWindowCleanup.Create;
    ProcessEvents();
    SetInterfaceRootTextColor(ColorRed());
    while KeyDown(KeyCode.SPACE_KEY) = false do
        ProcessEvents();
        ClearScreen();
        DrawText('Test: set_interface_root_text_color', ColorBlack(), 10.0, 10.0);
        DrawText('Expected: Text outside panels should be red, text inside panels unchanged', ColorBlack(), 10.0, 30.0);
        DrawText('Press space to end test', ColorBlack(), 10.0, 50.0);
        LabelElement('This text should be red (outside panel)', RectangleFrom(10.0, 90.0, 300.0, 20.0));
        StartPanel('Test Panel 40', RectangleFrom(10.0, 120.0, 300.0, 200.0));
        LabelElement('This text should be normal (inside panel)');
        EndPanel('Test Panel 40');
        DrawInterface();
        RefreshScreen();
    end;
end;
procedure TestSetInterfaceShadowsIntegration;
begin
    LayoutCleanup := TLayoutCleanup.Create;
    OpenWindow('Test Window 54', 800, 600);
    CleanupWindow := TWindowCleanup.Create;
    ProcessEvents();
    SetInterfaceShadows(10, ColorBlue(), PointAt(5.0, 5.0));
    while KeyDown(KeyCode.SPACE_KEY) = false do
        ProcessEvents();
        ClearScreen();
        DrawText('Test: set_interface_shadows', ColorBlack(), 10.0, 10.0);
        DrawText('Expected: Panel and button with blue shadows (10px radius, 5px offset)', ColorBlack(), 10.0, 30.0);
        DrawText('Press space to end test', ColorBlack(), 10.0, 50.0);
        StartPanel('Test Panel 41', RectangleFrom(10.0, 70.0, 300.0, 200.0));
        Button('Test Button');
        EndPanel('Test Panel 41');
        DrawInterface();
        RefreshScreen();
    end;
end;
procedure TestSetInterfaceSpacingIntegration;
begin
    LayoutCleanup := TLayoutCleanup.Create;
    OpenWindow('Test Window 55', 800, 600);
    CleanupWindow := TWindowCleanup.Create;
    SetInterfaceSpacing(10, 5);
    ProcessEvents();
    while KeyDown(KeyCode.SPACE_KEY) = false do
        ProcessEvents();
        ClearScreen();
        DrawText('Test: set_interface_spacing', ColorBlack(), 10.0, 10.0);
        DrawText('Expected: Panel with buttons spaced 10px apart and 5px padding', ColorBlack(), 10.0, 30.0);
        DrawText('Press space to end test', ColorBlack(), 10.0, 50.0);
        StartPanel('Test Panel 42', RectangleFrom(10.0, 70.0, 300.0, 200.0));
        Button('Button 1');
        Button('Button 2');
        EndPanel('Test Panel 42');
        DrawInterface();
        RefreshScreen();
    end;
end;
procedure TestSetInterfaceStyleIntegration;
begin
    LayoutCleanup := TLayoutCleanup.Create;
    OpenWindow('Test Window 56', 800, 600);
    CleanupWindow := TWindowCleanup.Create;
    ProcessEvents();
    SetInterfaceStyle(InterfaceStyle.BUBBLE_MULTICOLORED);
    while KeyDown(KeyCode.SPACE_KEY) = false do
        ProcessEvents();
        ClearScreen();
        DrawText('Test: set_interface_style', ColorBlack(), 10.0, 10.0);
        DrawText('Expected: Panel and button with bubble multicolored style theme', ColorBlack(), 10.0, 30.0);
        DrawText('Press space to end test', ColorBlack(), 10.0, 50.0);
        StartPanel('Test Panel 43', RectangleFrom(10.0, 70.0, 300.0, 200.0));
        Button('Test Button');
        EndPanel('Test Panel 43');
        DrawInterface();
        RefreshScreen();
    end;
end;
procedure TestSetInterfaceStyleWithColorIntegration;
begin
    LayoutCleanup := TLayoutCleanup.Create;
    OpenWindow('Test Window 57', 800, 600);
    CleanupWindow := TWindowCleanup.Create;
    ProcessEvents();
    SetInterfaceStyle(InterfaceStyle.SHADED_DARK_STYLE, ColorBlue());
    while KeyDown(KeyCode.SPACE_KEY) = false do
        ProcessEvents();
        ClearScreen();
        DrawText('Test: set_interface_style_with_color', ColorBlack(), 10.0, 10.0);
        DrawText('Expected: Panel and button with shaded dark style theme in blue', ColorBlack(), 10.0, 30.0);
        DrawText('Press space to end test', ColorBlack(), 10.0, 50.0);
        StartPanel('Test Panel 44', RectangleFrom(10.0, 70.0, 300.0, 200.0));
        Button('Test Button');
        EndPanel('Test Panel 44');
        DrawInterface();
        RefreshScreen();
    end;
end;
procedure TestSetInterfaceTextColorIntegration;
begin
    LayoutCleanup := TLayoutCleanup.Create;
    OpenWindow('Test Window 58', 800, 600);
    CleanupWindow := TWindowCleanup.Create;
    ProcessEvents();
    SetInterfaceTextColor(ColorRed());
    while KeyDown(KeyCode.SPACE_KEY) = false do
        ProcessEvents();
        ClearScreen();
        DrawText('Test: set_interface_text_color', ColorBlack(), 10.0, 10.0);
        DrawText('Expected: Panel with red text inside', ColorBlack(), 10.0, 30.0);
        DrawText('Press space to end test', ColorBlack(), 10.0, 50.0);
        StartPanel('Test Panel 45', RectangleFrom(10.0, 70.0, 300.0, 200.0));
        LabelElement('This text should be red');
        EndPanel('Test Panel 45');
        DrawInterface();
        RefreshScreen();
    end;
end;
procedure TestSetLayoutHeightIntegration;
begin
    LayoutCleanup := TLayoutCleanup.Create;
    OpenWindow('Test Window 59', 800, 600);
    CleanupWindow := TWindowCleanup.Create;
    ProcessEvents();
    while KeyDown(KeyCode.SPACE_KEY) = false do
        ProcessEvents();
        ClearScreen();
        DrawText('Test: set_layout_height', ColorBlack(), 10.0, 10.0);
        DrawText('Expected: Button with 100px height', ColorBlack(), 10.0, 30.0);
        DrawText('Press space to end test', ColorBlack(), 10.0, 50.0);
        StartPanel('Test Panel 46', RectangleFrom(10.0, 70.0, 300.0, 200.0));
        SetLayoutHeight(100);
        Button('Test Button');
        EndPanel('Test Panel 46');
        DrawInterface();
        RefreshScreen();
    end;
end;
procedure TestSingleLineLayoutIntegration;
begin
    OpenWindow('Test Window 60', 800, 600);
    CleanupWindow := TWindowCleanup.Create;
    ProcessEvents();
    while KeyDown(KeyCode.SPACE_KEY) = false do
        ProcessEvents();
        ClearScreen();
        DrawText('Test: single_line_layout', ColorBlack(), 10.0, 10.0);
        DrawText('Expected: Two buttons arranged horizontally in a single line', ColorBlack(), 10.0, 30.0);
        DrawText('Press space to end test', ColorBlack(), 10.0, 50.0);
        StartPanel('Test Panel 47', RectangleFrom(10.0, 70.0, 300.0, 200.0));
        SingleLineLayout();
        Button('Button 1');
        Button('Button 2');
        EndPanel('Test Panel 47');
        DrawInterface();
        RefreshScreen();
    end;
end;
procedure TestSliderAtPositionIntegration;
begin
    OpenWindow('Test Window 61', 800, 600);
    CleanupWindow := TWindowCleanup.Create;
    testRect := RectangleFrom(100.0, 100.0, 200.0, 20.0);
    initialValue := 50.0;
    sliderResult := initialValue;
    ProcessEvents();
    while KeyDown(KeyCode.SPACE_KEY) = false do
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
    OpenWindow('Test Window 62', 800, 600);
    CleanupWindow := TWindowCleanup.Create;
    initialValue := 50.0;
    sliderResult := initialValue;
    ProcessEvents();
    while KeyDown(KeyCode.SPACE_KEY) = false do
        ProcessEvents();
        ClearScreen();
        DrawText('Test: slider', ColorBlack(), 10.0, 10.0);
        DrawText('Expected: Slider with initial value 50, range 0-100 using default layout', ColorBlack(), 10.0, 30.0);
        DrawText('Change the value and press space to pass', ColorBlack(), 10.0, 50.0);
        StartPanel('Test Panel 48', RectangleFrom(10.0, 70.0, 300.0, 200.0));
        sliderResult = Slider(sliderResult, 0.0, 100.0);
        EndPanel('Test Panel 48');
        DrawInterface();
        RefreshScreen();
    end;
    AssertNotEquals(initialValue, sliderResult);
end;
procedure TestSliderLabeledIntegration;
begin
    OpenWindow('Test Window 63', 800, 600);
    CleanupWindow := TWindowCleanup.Create;
    initialValue := 50.0;
    sliderResult := initialValue;
    ProcessEvents();
    while KeyDown(KeyCode.SPACE_KEY) = false do
        ProcessEvents();
        ClearScreen();
        DrawText('Test: slider_labeled', ColorBlack(), 10.0, 10.0);
        DrawText('Expected: Labeled slider with initial value 50, range 0-100 using default layout', ColorBlack(), 10.0, 30.0);
        DrawText('Change the value and press space to pass', ColorBlack(), 10.0, 50.0);
        StartPanel('Test Panel 49', RectangleFrom(10.0, 70.0, 300.0, 200.0));
        SetInterfaceLabelWidth(100);
        sliderResult = Slider('Test Slider', sliderResult, 0.0, 100.0);
        EndPanel('Test Panel 49');
        DrawInterface();
        RefreshScreen();
    end;
    AssertNotEquals(initialValue, sliderResult);
end;
procedure TestSplitIntoColumnsIntegration;
begin
    OpenWindow('Test Window 64', 800, 600);
    CleanupWindow := TWindowCleanup.Create;
    ProcessEvents();
    while KeyDown(KeyCode.SPACE_KEY) = false do
        ProcessEvents();
        ClearScreen();
        DrawText('Test: split_into_columns', ColorBlack(), 10.0, 10.0);
        DrawText('Expected: Three buttons arranged in equal columns', ColorBlack(), 10.0, 30.0);
        DrawText('Press space to end test', ColorBlack(), 10.0, 50.0);
        StartPanel('Test Panel 50', RectangleFrom(10.0, 70.0, 300.0, 200.0));
        StartCustomLayout();
        SplitIntoColumns(3);
        Button('Button 1');
        Button('Button 2');
        Button('Button 3');
        EndPanel('Test Panel 50');
        DrawInterface();
        RefreshScreen();
    end;
end;
procedure TestSplitIntoColumnsWithLastWidthIntegration;
begin
    OpenWindow('Test Window 65', 800, 600);
    CleanupWindow := TWindowCleanup.Create;
    ProcessEvents();
    while KeyDown(KeyCode.SPACE_KEY) = false do
        ProcessEvents();
        ClearScreen();
        DrawText('Test: split_into_columns_with_last_width', ColorBlack(), 10.0, 10.0);
        DrawText('Expected: Three buttons with last column width 200px', ColorBlack(), 10.0, 30.0);
        DrawText('Press space to end test', ColorBlack(), 10.0, 50.0);
        StartPanel('Test Panel 51', RectangleFrom(10.0, 70.0, 300.0, 200.0));
        StartCustomLayout();
        SplitIntoColumns(3, 200);
        Button('Button 1');
        Button('Button 2');
        Button('Button 3');
        EndPanel('Test Panel 51');
        DrawInterface();
        RefreshScreen();
    end;
end;
procedure TestSplitIntoColumnsRelativeWithLastWidthIntegration;
begin
    OpenWindow('Test Window 66', 800, 600);
    CleanupWindow := TWindowCleanup.Create;
    ProcessEvents();
    while KeyDown(KeyCode.SPACE_KEY) = false do
        ProcessEvents();
        ClearScreen();
        DrawText('Test: split_into_columns_relative_with_last_width', ColorBlack(), 10.0, 10.0);
        DrawText('Expected: Three buttons with last column 50% of panel width', ColorBlack(), 10.0, 30.0);
        DrawText('Press space to end test', ColorBlack(), 10.0, 50.0);
        StartPanel('Test Panel 52', RectangleFrom(10.0, 70.0, 300.0, 200.0));
        StartCustomLayout();
        SplitIntoColumnsRelative(3, 0.5);
        Button('Button 1');
        Button('Button 2');
        Button('Button 3');
        ResetLayout();
        EndPanel('Test Panel 52');
        DrawInterface();
        RefreshScreen();
    end;
end;
procedure TestStartCustomLayoutIntegration;
begin
    LayoutCleanup := TLayoutCleanup.Create;
    OpenWindow('Test Window 67', 800, 600);
    CleanupWindow := TWindowCleanup.Create;
    ProcessEvents();
    while KeyDown(KeyCode.SPACE_KEY) = false do
        ProcessEvents();
        ClearScreen();
        DrawText('Test: start_custom_layout', ColorBlack(), 10.0, 10.0);
        DrawText('Expected: Button in 200px wide column', ColorBlack(), 10.0, 30.0);
        DrawText('Press space to end test', ColorBlack(), 10.0, 50.0);
        StartPanel('Test Panel 53', RectangleFrom(10.0, 70.0, 300.0, 200.0));
        StartCustomLayout();
        AddColumn(200);
        Button('Test Button');
        EndPanel('Test Panel 53');
        DrawInterface();
        RefreshScreen();
    end;
end;
procedure TestStartInsetAtPositionIntegration;
begin
    OpenWindow('Test Window 68', 800, 600);
    CleanupWindow := TWindowCleanup.Create;
    testRect := RectangleFrom(10.0, 70.0, 300.0, 200.0);
    ProcessEvents();
    while KeyDown(KeyCode.SPACE_KEY) = false do
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
    OpenWindow('Test Window 69', 800, 600);
    CleanupWindow := TWindowCleanup.Create;
    ProcessEvents();
    while KeyDown(KeyCode.SPACE_KEY) = false do
        ProcessEvents();
        ClearScreen();
        DrawText('Test: start_inset', ColorBlack(), 10.0, 10.0);
        DrawText('Expected: An inset with height 60 pixels containing a button', ColorBlack(), 10.0, 30.0);
        DrawText('Press space to end test', ColorBlack(), 10.0, 50.0);
        StartPanel('Test Panel 54', RectangleFrom(0.0, 70.0, 800.0, 530.0));
        StartInset('Test Inset', 60);
        Button('Test Button');
        EndInset('Test Inset');
        EndPanel('Test Panel 54');
        DrawInterface();
        RefreshScreen();
    end;
end;
procedure TestStartPanelIntegration;
begin
    OpenWindow('Test Window 70', 800, 600);
    CleanupWindow := TWindowCleanup.Create;
    testRectangle := RectangleFrom(10.0, 70.0, 300.0, 200.0);
    ProcessEvents();
    while KeyDown(KeyCode.SPACE_KEY) = false do
        ProcessEvents();
        ClearScreen();
        DrawText('Test: start_panel', ColorBlack(), 10.0, 10.0);
        DrawText('Expected: Panel with button', ColorBlack(), 10.0, 30.0);
        DrawText('Press space to end test', ColorBlack(), 10.0, 50.0);
        StartPanel('Test Panel 55', testRectangle);
        Button('Test Button');
        EndPanel('Test Panel 55');
        DrawInterface();
        RefreshScreen();
    end;
end;
procedure TestStartPopupIntegration;
begin
    OpenWindow('Test Window 71', 800, 600);
    CleanupWindow := TWindowCleanup.Create;
    ProcessEvents();
    while KeyDown(KeyCode.SPACE_KEY) = false do
        ProcessEvents();
        ClearScreen();
        DrawText('Test: start_popup', ColorBlack(), 10.0, 10.0);
        DrawText('Expected: Click the button to show a popup with a label', ColorBlack(), 10.0, 30.0);
        DrawText('Press space to end test', ColorBlack(), 10.0, 50.0);
        StartPanel('Test Panel 56', RectangleFrom(0.0, 70.0, 800.0, 530.0));
        if Button('Open Popup') = true then
        OpenPopup('Test Popup');
    end;
    if StartPopup('Test Popup') = true then
    SingleLineLayout();
    SetInterfaceLabelWidth(200);
    LabelElement('Test Label');
    EndPopup('Test Popup');
end;
EndPanel('Test Panel 56');
DrawInterface();
RefreshScreen();
end;
end;
procedure TestStartTreenodeIntegration;
begin
    OpenWindow('Test Window 72', 800, 600);
    CleanupWindow := TWindowCleanup.Create;
    ProcessEvents();
    while KeyDown(KeyCode.SPACE_KEY) = false do
        ProcessEvents();
        ClearScreen();
        DrawText('Test: start_treenode', ColorBlack(), 10.0, 10.0);
        DrawText('Expected: A panel containing a collapsible tree node with a button', ColorBlack(), 10.0, 30.0);
        DrawText('Press space to end test', ColorBlack(), 10.0, 50.0);
        StartPanel('Test Panel 57', RectangleFrom(10.0, 70.0, 200.0, 200.0));
        if StartTreenode('Test Node') = true then
        Button('Test Button');
        EndTreenode('Test Node');
    end;
    EndPanel('Test Panel 57');
    DrawInterface();
    RefreshScreen();
end;
end;
procedure TestTextBoxIntegration;
begin
    OpenWindow('Test Window 73', 800, 600);
    CleanupWindow := TWindowCleanup.Create;
    initialText := 'Initial Text';
    textResult := initial_text;
    ProcessEvents();
    while KeyDown(KeyCode.SPACE_KEY) = false do
        ProcessEvents();
        ClearScreen();
        DrawText('Test: text_box', ColorBlack(), 10.0, 10.0);
        DrawText('Expected: Text box with editable text', ColorBlack(), 10.0, 30.0);
        DrawText('Change the text and press space to pass', ColorBlack(), 10.0, 50.0);
        StartPanel('Test Panel 58', RectangleFrom(10.0, 70.0, 300.0, 200.0));
        textResult = TextBox(textResult);
        EndPanel('Test Panel 58');
        DrawInterface();
        RefreshScreen();
    end;
    AssertNotEquals(initialText, textResult);
end;
procedure TestTextBoxAtPositionIntegration;
begin
    OpenWindow('Test Window 74', 800, 600);
    CleanupWindow := TWindowCleanup.Create;
    testRect := RectangleFrom(10.0, 70.0, 300.0, 30.0);
    initialText := 'Initial Text';
    textResult := initial_text;
    ProcessEvents();
    while KeyDown(KeyCode.SPACE_KEY) = false do
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
    OpenWindow('Test Window 75', 800, 600);
    CleanupWindow := TWindowCleanup.Create;
    initialText := 'Initial Text';
    textResult := initial_text;
    ProcessEvents();
    while KeyDown(KeyCode.SPACE_KEY) = false do
        ProcessEvents();
        ClearScreen();
        DrawText('Test: text_box_labeled', ColorBlack(), 10.0, 10.0);
        DrawText('Expected: Labeled text box with editable text', ColorBlack(), 10.0, 30.0);
        DrawText('Change the text and press space to pass', ColorBlack(), 10.0, 50.0);
        StartPanel('Test Panel 59', RectangleFrom(10.0, 70.0, 300.0, 200.0));
        SetInterfaceLabelWidth(100);
        textResult = TextBox('Test Text Box', textResult);
        EndPanel('Test Panel 59');
        DrawInterface();
        RefreshScreen();
    end;
    AssertNotEquals(initialText, textResult);
end;
end;

procedure RegisterTests;
begin
    #<Proc:0x00007faa116e2450 /mnt/c/Users/Noahc/Documents/aYear_2_semester_2/TeamProject/GitHubRepo/splashkit_test_generator/test_generator/config/languages/pascal_config.rb:138 (lambda)>
end;
