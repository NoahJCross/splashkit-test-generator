import pytest
from splashkit import *


def test_AddColumn_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_panel = StartPanel("Test Panel", RectangleFrom(0, 0, 800, 600))
    StartCustomLayout()
    AddColumn(100)
    AddColumn(-1)
    Button("Test Button")
    EndPanel("Test Panel")
    DrawInterface()
    RefreshScreen()
    CloseWindow(test_window)


def test_AddColumnRelative_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    StartPanel("Test Panel", RectangleFrom(0, 0, 800, 600))
    StartCustomLayout()
    AddColumnRelative(0.5)
    Button("Button 1")
    AddColumnRelative(0.5)
    Button("Button 2")
    EndPanel("Test Panel")
    DrawInterface()
    RefreshScreen()
    assert PointInRectangle(PointAt(200, 300), RectangleFrom(0, 0, 400, 600)) is True
    CloseWindow(test_window)


def test_BitmapButton_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_bitmap = CreateBitmap("test_bitmap", 100, 100)
    ProcessEvents()
    SimulateMouseClick(Mousebutton.Left)
    ProcessEvents()
    button_clicked = BitmapButton(test_bitmap)
    assert button_clicked is True
    FreeBitmap(test_bitmap)
    CloseWindow(test_window)


def test_BitmapButtonAtPosition_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_bitmap = CreateBitmap("test_bitmap", 100, 100)
    test_rectangle = RectangleFrom(100, 100, 100, 100)
    ProcessEvents()
    SimulateMouseClick(Mousebutton.Left)
    ProcessEvents()
    button_clicked = BitmapButtonAtPosition(test_bitmap, test_rectangle)
    assert button_clicked is True
    FreeBitmap(test_bitmap)
    CloseWindow(test_window)


def test_BitmapButtonAtPositionWithOptions_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_bitmap = CreateBitmap("test_bitmap", 100, 100)
    test_rectangle = RectangleFrom(100, 100, 100, 100)
    test_options = OptionDefaults()
    button_clicked = BitmapButtonAtPositionWithOptions(test_bitmap, test_rectangle, test_options)
    ProcessEvents()
    SimulateMouseClick(Mousebutton.Left)
    ProcessEvents()
    assert button_clicked is True
    FreeBitmap(test_bitmap)
    CloseWindow(test_window)


def test_BitmapButtonWithOptions_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_bitmap = CreateBitmap("test_bitmap", 100, 100)
    test_options1 = OptionDefaults()
    test_options2 = OptionScaleBmp(0.5, 0.5, test_options1)
    ProcessEvents()
    SimulateMouseClick(Mousebutton.Left)
    ProcessEvents()
    button_clicked = BitmapButtonWithOptions(test_bitmap, test_options2)
    assert button_clicked is True
    FreeBitmap(test_bitmap)
    CloseWindow(test_window)


def test_BitmapButtonLabeled_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_bitmap = CreateBitmap("test_bitmap", 100, 100)
    ProcessEvents()
    button_clicked1 = BitmapButtonLabeled("Click Me", test_bitmap)
    assert button_clicked1 is False
    SimulateMouseClick(Mousebutton.Left)
    ProcessEvents()
    button_clicked2 = BitmapButtonLabeled("Click Me", test_bitmap)
    assert button_clicked2 is True
    FreeBitmap(test_bitmap)
    CloseWindow(test_window)


def test_BitmapButtonLabeledWithOptions_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_bitmap = CreateBitmap("test_bitmap", 100, 100)
    test_options1 = OptionDefaults()
    test_options2 = OptionScaleBmp(0.5, 0.5, test_options1)
    ProcessEvents()
    SimulateMouseClick(Mousebutton.Left)
    ProcessEvents()
    button_clicked = BitmapButtonLabeledWithOptions("Click Me", test_bitmap, test_options2)
    assert button_clicked is True
    FreeBitmap(test_bitmap)
    CloseWindow(test_window)


def test_ButtonAtPosition_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_rectangle = RectangleFrom(100, 100, 200, 50)
    ProcessEvents()
    button_clicked1 = ButtonAtPosition("Click Me", test_rectangle)
    assert button_clicked1 is False
    SimulateMouseClick(Mousebutton.Left)
    ProcessEvents()
    button_clicked2 = ButtonAtPosition("Click Me", test_rectangle)
    assert button_clicked2 is True
    CloseWindow(test_window)


def test_Button_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_panel = StartPanel("Test Panel", RectangleFrom(100, 100, 200, 100))
    ProcessEvents()
    button_clicked1 = Button("Click Me")
    assert button_clicked1 is False
    SimulateMouseClick(Mousebutton.Left)
    ProcessEvents()
    button_clicked2 = Button("Click Me")
    assert button_clicked2 is True
    EndPanel("Test Panel")
    CloseWindow(test_window)


def test_ButtonLabeled_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    ProcessEvents()
    button_result1 = ButtonLabeled("Label:", "Click Me")
    assert button_result1 is False
    SimulateMouseClick(Mousebutton.Left)
    ProcessEvents()
    button_result2 = ButtonLabeled("Label:", "Click Me")
    assert button_result2 is True
    CloseWindow(test_window)


def test_CheckboxAtPosition_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_rect = RectangleFrom(100, 100, 200, 50)
    ProcessEvents()
    test_checkbox_result1 = CheckboxAtPosition("Test Checkbox", false, test_rect)
    assert test_checkbox_result1 is False
    SimulateMouseClick(Mousebutton.Left)
    ProcessEvents()
    test_checkbox_result2 = CheckboxAtPosition("Test Checkbox", test_checkbox_result1, test_rect)
    assert test_checkbox_result2 is True
    CloseWindow(test_window)


def test_Checkbox_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    ProcessEvents()
    test_checkbox_result1 = Checkbox("Test Checkbox", false)
    assert test_checkbox_result1 is False
    SimulateMouseClick(Mousebutton.Left)
    ProcessEvents()
    test_checkbox_result2 = Checkbox("Test Checkbox", test_checkbox_result1)
    assert test_checkbox_result2 is True
    CloseWindow(test_window)


def test_CheckboxLabeled_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    ProcessEvents()
    test_checkbox_result1 = CheckboxLabeled("Test Checkbox", "Check me", false)
    assert test_checkbox_result1 is False
    SimulateMouseClick(Mousebutton.Left)
    ProcessEvents()
    test_checkbox_result2 = CheckboxLabeled("Test Checkbox", "Check me", test_checkbox_result1)
    assert test_checkbox_result2 is True
    CloseWindow(test_window)


def test_ColorSliderAtPosition_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_color = ColorBlack()
    test_rect = RectangleFrom(100, 100, 200, 100)
    result_color = ColorSliderAtPosition(test_color, test_rect)
    ProcessEvents()
    SimulateMouseClick(Mousebutton.Left)
    ProcessEvents()
    assert test_color != result_color
    CloseWindow(test_window)


def test_ColorSlider_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_color = ColorBlack()
    result_color = ColorSlider(test_color)
    DrawInterface()
    RefreshScreen()
    assert test_color != result_color
    CloseWindow(test_window)


def test_ColorSliderLabeled_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_color = ColorBlack()
    result_color = ColorSliderLabeled("Test Color Slider", test_color)
    ProcessEvents()
    assert result_color != ColorBlack()
    CloseWindow(test_window)


def test_DisableInterface_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_panel = StartPanel("Test Panel", RectangleFrom(100, 100, 200, 200))
    test_button = Button("Test Button")
    ProcessEvents()
    assert InterfaceEnabled() is True
    DisableInterface()
    ProcessEvents()
    assert InterfaceEnabled() is False
    EnableInterface()
    ProcessEvents()
    assert InterfaceEnabled() is True
    EndPanel("Test Panel")
    CloseWindow(test_window)


def test_DrawInterface_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    StartPanel("Test Panel", RectangleFrom(100, 100, 200, 200))
    Button("Test Button")
    EndPanel("Test Panel")
    DrawInterface()
    RefreshScreen()
    assert GetPixel(PointAt(150, 150)) == ColorBlack()
    CloseWindow(test_window)


def test_EnableInterface_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    DisableInterface()
    ProcessEvents()
    assert InterfaceEnabled() is False
    EnableInterface()
    ProcessEvents()
    assert InterfaceEnabled() is True
    CloseWindow(test_window)


def test_EndInset_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    StartInset("Test Inset", 60)
    EndInset("Test Inset")
    CloseWindow(test_window)


def test_EndPanel_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_panel = StartPanel("Test Panel", RectangleFrom(100, 100, 200, 200))
    EndPanel("Test Panel")
    CloseWindow(test_window)


def test_EndPopup_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_popup = StartPopup("Test Popup")
    EndPopup("Test Popup")
    CloseWindow(test_window)


def test_EndTreenode_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    StartPanel("Test Panel", RectangleFrom(10, 10, 200, 200))
    test_node = StartTreenode("Test Node")
    EndTreenode("Test Node")
    EndPanel("Test Panel")
    DrawInterface()
    RefreshScreen()
    CloseWindow(test_window)


def test_EnterColumn_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_panel = StartPanel("Test Panel", RectangleFrom(10, 10, 300, 200))
    AddColumn(100)
    EnterColumn()
    Button("Button1")
    LeaveColumn()
    EndPanel("Test Panel")
    DrawInterface()
    RefreshScreen()
    CloseWindow(test_window)


def test_GetInterfaceLabelWidth_integration():
    test_label_width = GetInterfaceLabelWidth()
    assert test_label_width == 60


def test_Header_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    ProcessEvents()
    test_header_result = Header("Test Header")
    assert test_header_result is not None
    CloseWindow(test_window)


def test_HSBColorSliderAtPosition_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_color = HSBColor(0.5, 1.0, 0.5)
    test_rect = RectangleFrom(100, 100, 200, 100)
    result_color = HSBColorSliderAtPosition(test_color, test_rect)
    ProcessEvents()
    assert test_color != result_color
    CloseWindow(test_window)


def test_HSBColorSlider_integration():
    test_window = OpenWindow("HSB Slider Test", 800, 600)
    test_color = ColorBlack()
    result_color = HSBColorSlider(test_color)
    DrawInterface()
    RefreshScreen()
    assert test_color != result_color
    CloseWindow(test_window)


def test_HSBColorSliderLabeled_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_color = ColorBlack()
    test_result_color = HSBColorSliderLabeled("Color Slider", test_color)
    ProcessEvents()
    assert test_result_color != ColorBlack()
    CloseWindow(test_window)


def test_InterfaceEnabled_integration():
    initial_state = InterfaceEnabled()
    DisableInterface()
    disabled_state = InterfaceEnabled()
    assert disabled_state is False
    EnableInterface()
    enabled_state = InterfaceEnabled()
    assert enabled_state is True


def test_InterfaceStylePanel_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_rectangle = RectangleFrom(0, 0, 200, 200)
    InterfaceStylePanel(test_rectangle)
    RefreshScreen()
    CloseWindow(test_window)


def test_LabelElement_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    LabelElement("Test Label")
    DrawInterface()
    RefreshScreen()
    assert PixelDrawnAtPoint(PointAt(10, 10)) is True
    CloseWindow(test_window)


def test_LabelElementAtPosition_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_rectangle = RectangleFrom(100, 100, 200, 50)
    LabelElementAtPosition("Test Label", test_rectangle)
    RefreshScreen()
    CloseWindow(test_window)


def test_LastElementChanged_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    ProcessEvents()
    Slider("Test Slider", 0.0, 0.0, 100.0)
    ProcessEvents()
    assert LastElementChanged() is False
    SimulateMouseMove(100, 100)
    SimulateMouseDown(Mousebutton.Left)
    SimulateMouseMove(200, 200)
    SimulateMouseUp(Mousebutton.Left)
    ProcessEvents()
    assert LastElementChanged() is True
    CloseWindow(test_window)


def test_LastElementConfirmed_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_button = Button("Test Button")
    ProcessEvents()
    assert LastElementConfirmed() is False
    SimulateMouseClick(Mousebutton.Left)
    ProcessEvents()
    assert LastElementConfirmed() is True
    CloseWindow(test_window)


def test_LeaveColumn_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    StartPanel("Test Panel", RectangleFrom(10, 10, 300, 200))
    StartCustomLayout()
    AddColumn(100)
    EnterColumn()
    LeaveColumn()
    button_result = Button("Test Button")
    assert button_result is False
    EndPanel("Test Panel")
    CloseWindow(test_window)


def test_NumberBoxAtPosition_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_rect = RectangleFrom(100, 100, 200, 30)
    test_result = NumberBoxAtPosition(5.0, 1.0, test_rect)
    ProcessEvents()
    assert 4.0 <= test_result <= 6.0
    CloseWindow(test_window)


def test_NumberBox_integration():
    test_window = OpenWindow("Number Box Test", 800, 600)
    ProcessEvents()
    test_result = NumberBox(5.0, 1.0)
    assert 4.0 <= test_result <= 6.0
    CloseWindow(test_window)


def test_NumberBoxLabeled_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_result = NumberBoxLabeled("Test Value", 5.0, 1.0)
    assert 4.0 <= test_result <= 6.0
    CloseWindow(test_window)


def test_OpenPopup_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_popup = StartPopup("Test Popup")
    ProcessEvents()
    OpenPopup("Test Popup")
    ProcessEvents()
    assert popup_is_open is True
    EndPopup("Test Popup")
    CloseWindow(test_window)


def test_Paragraph_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    SetInterfaceFont(LoadFont("test_font", "arial.ttf"))
    SetInterfaceFontSize(12)
    Paragraph("This is a test paragraph to check if the text wraps correctly.")
    DrawInterface()
    RefreshScreen()
    assert GetPixel(PointAt(10, 10)) == ColorBlack()
    FreeFont(FontNamed("test_font"))
    CloseWindow(test_window)


def test_ParagraphAtPosition_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_rectangle = RectangleFrom(100, 100, 200, 100)
    ParagraphAtPosition("This is a test paragraph.", test_rectangle)
    RefreshScreen()
    assert GetPixel(PointAt(RectangleLeft(test_rectangle), RectangleTop(test_rectangle))) == ColorBlack()
    CloseWindow(test_window)


def test_ResetLayout_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    StartCustomLayout()
    AddColumn(200)
    AddColumn(-1)
    ResetLayout()
    DrawInterface()
    RefreshScreen()
    CloseWindow(test_window)


def test_SetInterfaceAccentColor_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    SetInterfaceAccentColor(ColorRed(), 0.5)
    Button("Test Button")
    DrawInterface()
    RefreshScreen()
    assert GetPixel(PointAt(10, 10)) == ColorRed()
    CloseWindow(test_window)


def test_SetInterfaceBorderColor_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    SetInterfaceBorderColor(ColorRed())
    StartPanel("Test Panel", RectangleFrom(100, 100, 200, 100))
    Button("Test Button")
    EndPanel("Test Panel")
    DrawInterface()
    RefreshScreen()
    assert GetPixel(100, 100) == ColorRed()
    CloseWindow(test_window)


def test_SetInterfaceColorsAuto_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    SetInterfaceColorsAuto(ColorWhite(), ColorBlue(), 0.5, 0.7, 0.3)
    StartPanel("Test Panel", RectangleFrom(100, 100, 200, 200))
    Button("Test Button")
    EndPanel("Test Panel")
    DrawInterface()
    RefreshScreen()
    assert GetPixel(150, 150) == ColorBlue()
    CloseWindow(test_window)


def test_SetInterfaceElementColor_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    SetInterfaceElementColor(ColorBlack(), 0.5)
    StartPanel("Test Panel", RectangleFrom(100, 100, 200, 200))
    Button("Test Button")
    EndPanel("Test Panel")
    DrawInterface()
    RefreshScreen()
    assert GetPixel(150, 150) == ColorBlack()
    CloseWindow(test_window)


def test_SetInterfaceElementShadows_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    SetInterfaceElementShadows(10, ColorBlack(), PointAt(5, 5))
    StartPanel("Test Panel", RectangleFrom(100, 100, 200, 200))
    Button("Test Button")
    EndPanel("Test Panel")
    DrawInterface()
    RefreshScreen()
    assert PixelDrawnAtPoint(PointAt(105, 105)) is True
    CloseWindow(test_window)


def test_SetInterfaceFontFontAsString_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    SetInterfaceFontFontAsString("Arial")
    LabelElement("Test Text")
    DrawInterface()
    RefreshScreen()
    CloseWindow(test_window)


def test_SetInterfaceFont_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_font = LoadFont("test_font", "arial.ttf")
    SetInterfaceFont(test_font)
    LabelElement("Test Text")
    DrawInterface()
    RefreshScreen()
    FreeFont(test_font)
    CloseWindow(test_window)


def test_SetInterfaceFontSize_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    SetInterfaceFontSize(16)
    LabelElement("Test Text")
    DrawInterface()
    assert PixelDrawnAtPoint(PointAt(10, 20)) is True
    CloseWindow(test_window)


def test_SetInterfaceLabelWidth_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    SetInterfaceLabelWidth(100)
    test_width = GetInterfaceLabelWidth()
    assert test_width == 100
    CloseWindow(test_window)


def test_SetInterfacePanelShadows_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    SetInterfacePanelShadows(10, RGBAColor(0, 0, 0, 128), PointAt(5, 5))
    panel_visible = StartPanel("Test Panel", RectangleFrom(100, 100, 200, 150))
    EndPanel("Test Panel")
    DrawInterface()
    RefreshScreen()
    assert GetPixel(PointAt(105, 105)) == RGBAColor(0, 0, 0, 128)
    CloseWindow(test_window)


def test_SetInterfaceRootTextColor_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    SetInterfaceRootTextColor(ColorRed())
    LabelElement("Test Text", RectangleFrom(100, 100, 200, 50))
    RefreshScreen()
    assert PixelDrawnAtPoint(ColorRed(), 105, 105) is True
    CloseWindow(test_window)


def test_SetInterfaceShadows_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    SetInterfaceShadows(10, RGBAColor(0, 0, 0, 128), PointAt(5, 5))
    panel_visible = StartPanel("Test Panel", RectangleFrom(100, 100, 200, 200))
if assert panel_visible is True
:
        Button("Test Button")
        EndPanel("Test Panel")
        DrawInterface()
        RefreshScreen()
        assert PixelDrawnAtPoint(PointAt(105, 105)) is True


    CloseWindow(test_window)


def test_SetInterfaceSpacing_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    SetInterfaceSpacing(10, 5)
    test_panel = StartPanel("Test Panel", RectangleFrom(100, 100, 200, 200))
    Button("Button 1")
    Button("Button 2")
    EndPanel("Test Panel")
    DrawInterface()
    RefreshScreen()
    assert PixelDrawnAtPoint(PointAt(110, 110)) is True
    CloseWindow(test_window)


def test_SetInterfaceStyle_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    SetInterfaceStyle(InterfaceStyle.Dark)
    Button("Test Button")
    DrawInterface()
    RefreshScreen()
    CloseWindow(test_window)


def test_SetInterfaceStyleWithColor_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    SetInterfaceStyleWithColor(InterfaceStyle.Dark, ColorBlue())
    test_panel = StartPanel("Test Panel", RectangleFrom(100, 100, 200, 200))
    Button("Test Button")
    DrawInterface()
    RefreshScreen()
    assert GetPixel(PointAt(150, 150)) == ColorBlue()
    CloseWindow(test_window)


def test_SetInterfaceTextColor_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    SetInterfaceTextColor(ColorRed())
    LabelElement("Test Text")
    DrawInterface()
    RefreshScreen()
    assert GetPixel(PointAt(10, 10)) == ColorRed()
    CloseWindow(test_window)


def test_SetLayoutHeight_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_panel = StartPanel("Test Panel", RectangleFrom(0, 0, 800, 600))
    SetLayoutHeight(50)
    Button("Test Button")
    EndPanel("Test Panel")
    DrawInterface()
    RefreshScreen()
    CloseWindow(test_window)


def test_SingleLineLayout_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    SingleLineLayout()
    test_button1 = Button("Button1")
    test_button2 = Button("Button2")
    ResetLayout()
    CloseWindow(test_window)


def test_SliderAtPosition_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_rect = RectangleFrom(100, 100, 200, 20)
    ProcessEvents()
    slider_result = SliderAtPosition(50.0, 0.0, 100.0, test_rect)
    assert 0.0 <= slider_result <= 100.0
    CloseWindow(test_window)


def test_Slider_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    ProcessEvents()
    test_slider_result = Slider(50.0, 0.0, 100.0)
    assert 0.0 <= test_slider_result <= 100.0
    CloseWindow(test_window)


def test_SliderLabeled_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_slider_value = SliderLabeled("Test Slider", 50.0, 0.0, 100.0)
    assert 0.0 <= test_slider_value <= 100.0
    CloseWindow(test_window)


def test_SplitIntoColumns_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    StartPanel("Test Panel", RectangleFrom(0, 0, 800, 600))
    SplitIntoColumns(3)
    EndPanel("Test Panel")
    CloseWindow(test_window)


def test_SplitIntoColumnsWithLastWidth_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_panel = StartPanel("Test Panel", RectangleFrom(0, 0, 800, 600))
    SplitIntoColumnsWithLastWidth(3, 200)
    Button("Button 1")
    Button("Button 2")
    Button("Button 3")
    EndPanel("Test Panel")
    CloseWindow(test_window)


def test_SplitIntoColumnsRelativeWithLastWidth_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_panel = StartPanel("Test Panel", RectangleFrom(0, 0, 800, 600))
    SplitIntoColumnsRelativeWithLastWidth(3, 0.5)
    Button("Button 1")
    Button("Button 2")
    Button("Button 3")
    EndPanel("Test Panel")
    DrawInterface()
    RefreshScreen()
    assert PointInRectangle(PointAt(200, 300), RectangleFrom(0, 0, 200, 600)) is True
    assert PointInRectangle(PointAt(600, 300), RectangleFrom(400, 0, 400, 600)) is True
    CloseWindow(test_window)


def test_StartCustomLayout_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    StartCustomLayout()
    AddColumn(200)
    button_result = Button("Test Button")
    ResetLayout()
    CloseWindow(test_window)
    assert button_result is True


def test_StartInsetAtPosition_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_rect = RectangleFrom(100, 100, 200, 200)
    StartInsetAtPosition("test_inset", test_rect)
    EndInset("test_inset")
    CloseWindow(test_window)


def test_StartInset_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    StartPanel("Test Panel", RectangleFrom(100, 100, 300, 300))
    StartInset("Test Inset", 100)
    Button("Test Button")
    EndInset("Test Inset")
    EndPanel("Test Panel")
    CloseWindow(test_window)


def test_StartPanel_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_rectangle = RectangleFrom(100, 100, 200, 150)
    panel_visible = StartPanel("Test Panel", test_rectangle)
    assert panel_visible is True
    EndPanel("Test Panel")
    CloseWindow(test_window)


def test_StartPopup_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    popup_visible = StartPopup("Test Popup")
    assert popup_visible is True
    EndPopup("Test Popup")
    CloseWindow(test_window)


def test_StartTreenode_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    StartPanel("Test Panel", RectangleFrom(0, 0, 800, 600))
    test_node_expanded = StartTreenode("Test Node")
    assert test_node_expanded is True
    EndTreenode("Test Node")
    EndPanel("Test Panel")
    CloseWindow(test_window)


def test_TextBox_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_text_box_result = TextBox("Initial Text")
    ProcessEvents()
    assert test_text_box_result == "Initial Text"
    SimulateKeyPress(Keycode.A)
    ProcessEvents()
    test_text_box_result_updated = TextBox(test_text_box_result)
    assert test_text_box_result_updated == "Initial TextA"
    CloseWindow(test_window)


def test_TextBoxAtPosition_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_rect = RectangleFrom(100, 100, 200, 30)
    ProcessEvents()
    test_result1 = TextBoxAtPosition("Initial Text", test_rect)
    assert test_result2 == "Initial Text"
    SimulateKeyPress(Keycode.A)
    ProcessEvents()
    test_result2 = TextBoxAtPosition(test_result1, test_rect)
    assert test_result1 == "Initial TextA"
    CloseWindow(test_window)


def test_TextBoxLabeled_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_text_box_result = TextBoxLabeled("Enter Name", "John")
    ProcessEvents()
    assert test_text_box_result == "John"
    CloseWindow(test_window)

