using Xunit;
using static SplashKitSDK.SplashKit;

namespace SplashKitTests
{
    public class IntegrationTests
    {
        [Fact]
        public void TestAddColumnIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testPanel = StartPanel("Test Panel", RectangleFrom(0, 0, 800, 600));
            StartCustomLayout();
            AddColumn(100);
            AddColumn(-1);
            Button("Test Button");
            EndPanel("Test Panel");
            DrawInterface();
            RefreshScreen();
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestAddColumnRelativeIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            StartPanel("Test Panel", RectangleFrom(0, 0, 800, 600));
            StartCustomLayout();
            AddColumnRelative(0.5);
            Button("Button 1");
            AddColumnRelative(0.5);
            Button("Button 2");
            EndPanel("Test Panel");
            DrawInterface();
            RefreshScreen();
            Assert.True(PointInRectangle(PointAt(200, 300), RectangleFrom(0, 0, 400, 600)));
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestBitmapButtonIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            ProcessEvents();
            SimulateMouseClick(Mousebutton.Left);
            ProcessEvents();
            var buttonClicked = BitmapButton(testBitmap);
            Assert.True(buttonClicked);
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestBitmapButtonAtPositionIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testRectangle = RectangleFrom(100, 100, 100, 100);
            ProcessEvents();
            SimulateMouseClick(Mousebutton.Left);
            ProcessEvents();
            var buttonClicked = BitmapButton(testBitmap, testRectangle);
            Assert.True(buttonClicked);
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestBitmapButtonAtPositionWithOptionsIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testRectangle = RectangleFrom(100, 100, 100, 100);
            var testOptions = OptionDefaults();
            var buttonClicked = BitmapButton(testBitmap, testRectangle, testOptions);
            ProcessEvents();
            SimulateMouseClick(Mousebutton.Left);
            ProcessEvents();
            Assert.True(buttonClicked);
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestBitmapButtonWithOptionsIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testOptions1 = OptionDefaults();
            var testOptions2 = OptionScaleBmp(0.5, 0.5, testOptions1);
            ProcessEvents();
            SimulateMouseClick(Mousebutton.Left);
            ProcessEvents();
            var buttonClicked = BitmapButton(testBitmap, testOptions2);
            Assert.True(buttonClicked);
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestBitmapButtonLabeledIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            ProcessEvents();
            var buttonClicked1 = BitmapButton("Click Me", testBitmap);
            Assert.False(buttonClicked1);
            SimulateMouseClick(Mousebutton.Left);
            ProcessEvents();
            var buttonClicked2 = BitmapButton("Click Me", testBitmap);
            Assert.True(buttonClicked2);
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestBitmapButtonLabeledWithOptionsIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testOptions1 = OptionDefaults();
            var testOptions2 = OptionScaleBmp(0.5, 0.5, testOptions1);
            ProcessEvents();
            SimulateMouseClick(Mousebutton.Left);
            ProcessEvents();
            var buttonClicked = BitmapButton("Click Me", testBitmap, testOptions2);
            Assert.True(buttonClicked);
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestButtonAtPositionIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testRectangle = RectangleFrom(100, 100, 200, 50);
            ProcessEvents();
            var buttonClicked1 = Button("Click Me", testRectangle);
            Assert.False(buttonClicked1);
            SimulateMouseClick(Mousebutton.Left);
            ProcessEvents();
            var buttonClicked2 = Button("Click Me", testRectangle);
            Assert.True(buttonClicked2);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestButtonIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testPanel = StartPanel("Test Panel", RectangleFrom(100, 100, 200, 100));
            ProcessEvents();
            var buttonClicked1 = Button("Click Me");
            Assert.False(buttonClicked1);
            SimulateMouseClick(Mousebutton.Left);
            ProcessEvents();
            var buttonClicked2 = Button("Click Me");
            Assert.True(buttonClicked2);
            EndPanel("Test Panel");
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestButtonLabeledIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            ProcessEvents();
            var buttonResult1 = Button("Label:", "Click Me");
            Assert.False(buttonResult1);
            SimulateMouseClick(Mousebutton.Left);
            ProcessEvents();
            var buttonResult2 = Button("Label:", "Click Me");
            Assert.True(buttonResult2);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestCheckboxAtPositionIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testRect = RectangleFrom(100, 100, 200, 50);
            ProcessEvents();
            var testCheckboxResult1 = Checkbox("Test Checkbox", false, testRect);
            Assert.False(testCheckboxResult1);
            SimulateMouseClick(Mousebutton.Left);
            ProcessEvents();
            var testCheckboxResult2 = Checkbox("Test Checkbox", testCheckboxResult1, testRect);
            Assert.True(testCheckboxResult2);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestCheckboxIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            ProcessEvents();
            var testCheckboxResult1 = Checkbox("Test Checkbox", false);
            Assert.False(testCheckboxResult1);
            SimulateMouseClick(Mousebutton.Left);
            ProcessEvents();
            var testCheckboxResult2 = Checkbox("Test Checkbox", testCheckboxResult1);
            Assert.True(testCheckboxResult2);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestCheckboxLabeledIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            ProcessEvents();
            var testCheckboxResult1 = Checkbox("Test Checkbox", "Check me", false);
            Assert.False(testCheckboxResult1);
            SimulateMouseClick(Mousebutton.Left);
            ProcessEvents();
            var testCheckboxResult2 = Checkbox("Test Checkbox", "Check me", testCheckboxResult1);
            Assert.True(testCheckboxResult2);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestColorSliderAtPositionIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testColor = ColorBlack();
            var testRect = RectangleFrom(100, 100, 200, 100);
            var resultColor = ColorSlider(testColor, testRect);
            ProcessEvents();
            SimulateMouseClick(Mousebutton.Left);
            ProcessEvents();
            Assert.NotEqual(resultColor, testColor);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestColorSliderIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testColor = ColorBlack();
            var resultColor = ColorSlider(testColor);
            DrawInterface();
            RefreshScreen();
            Assert.NotEqual(resultColor, testColor);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestColorSliderLabeledIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testColor = ColorBlack();
            var resultColor = ColorSlider("Test Color Slider", testColor);
            ProcessEvents();
            Assert.NotEqual(ColorBlack(), resultColor);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestDisableInterfaceIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testPanel = StartPanel("Test Panel", RectangleFrom(100, 100, 200, 200));
            var testButton = Button("Test Button");
            ProcessEvents();
            Assert.True(InterfaceEnabled());
            DisableInterface();
            ProcessEvents();
            Assert.False(InterfaceEnabled());
            EnableInterface();
            ProcessEvents();
            Assert.True(InterfaceEnabled());
            EndPanel("Test Panel");
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestDrawInterfaceIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            StartPanel("Test Panel", RectangleFrom(100, 100, 200, 200));
            Button("Test Button");
            EndPanel("Test Panel");
            DrawInterface();
            RefreshScreen();
            Assert.Equal(ColorBlack(), GetPixel(PointAt(150, 150)));
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestEnableInterfaceIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            DisableInterface();
            ProcessEvents();
            Assert.False(InterfaceEnabled());
            EnableInterface();
            ProcessEvents();
            Assert.True(InterfaceEnabled());
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestEndInsetIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            StartInset("Test Inset", 60);
            EndInset("Test Inset");
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestEndPanelIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testPanel = StartPanel("Test Panel", RectangleFrom(100, 100, 200, 200));
            EndPanel("Test Panel");
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestEndPopupIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testPopup = StartPopup("Test Popup");
            EndPopup("Test Popup");
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestEndTreenodeIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            StartPanel("Test Panel", RectangleFrom(10, 10, 200, 200));
            var testNode = StartTreenode("Test Node");
            EndTreenode("Test Node");
            EndPanel("Test Panel");
            DrawInterface();
            RefreshScreen();
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestEnterColumnIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testPanel = StartPanel("Test Panel", RectangleFrom(10, 10, 300, 200));
            AddColumn(100);
            EnterColumn();
            Button("Button1");
            LeaveColumn();
            EndPanel("Test Panel");
            DrawInterface();
            RefreshScreen();
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestGetInterfaceLabelWidthIntegration()
        {
            var testLabelWidth = GetInterfaceLabelWidth();
            Assert.Equal(60, testLabelWidth);
        }
        [Fact]
        public void TestHeaderIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            ProcessEvents();
            var testHeaderResult = Header("Test Header");
            Assert.NotNull(testHeaderResult);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestHSBColorSliderAtPositionIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testColor = HSBColor(0.5, 1.0, 0.5);
            var testRect = RectangleFrom(100, 100, 200, 100);
            var resultColor = HSBColorSlider(testColor, testRect);
            ProcessEvents();
            Assert.NotEqual(resultColor, testColor);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestHSBColorSliderIntegration()
        {
            var testWindow = OpenWindow("HSB Slider Test", 800, 600);
            var testColor = ColorBlack();
            var resultColor = HSBColorSlider(testColor);
            DrawInterface();
            RefreshScreen();
            Assert.NotEqual(resultColor, testColor);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestHSBColorSliderLabeledIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testColor = ColorBlack();
            var testResultColor = HSBColorSlider("Color Slider", testColor);
            ProcessEvents();
            Assert.NotEqual(ColorBlack(), testResultColor);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestInterfaceEnabledIntegration()
        {
            var initialState = InterfaceEnabled();
            DisableInterface();
            var disabledState = InterfaceEnabled();
            Assert.False(disabledState);
            EnableInterface();
            var enabledState = InterfaceEnabled();
            Assert.True(enabledState);
        }
        [Fact]
        public void TestInterfaceStylePanelIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testRectangle = RectangleFrom(0, 0, 200, 200);
            InterfaceStylePanel(testRectangle);
            RefreshScreen();
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestLabelElementIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            LabelElement("Test Label");
            DrawInterface();
            RefreshScreen();
            Assert.True(PixelDrawnAtPoint(PointAt(10, 10)));
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestLabelElementAtPositionIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testRectangle = RectangleFrom(100, 100, 200, 50);
            LabelElement("Test Label", testRectangle);
            RefreshScreen();
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestLastElementChangedIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            ProcessEvents();
            Slider("Test Slider", 0.0, 0.0, 100.0);
            ProcessEvents();
            Assert.False(LastElementChanged());
            SimulateMouseMove(100, 100);
            SimulateMouseDown(Mousebutton.Left);
            SimulateMouseMove(200, 200);
            SimulateMouseUp(Mousebutton.Left);
            ProcessEvents();
            Assert.True(LastElementChanged());
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestLastElementConfirmedIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testButton = Button("Test Button");
            ProcessEvents();
            Assert.False(LastElementConfirmed());
            SimulateMouseClick(Mousebutton.Left);
            ProcessEvents();
            Assert.True(LastElementConfirmed());
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestLeaveColumnIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            StartPanel("Test Panel", RectangleFrom(10, 10, 300, 200));
            StartCustomLayout();
            AddColumn(100);
            EnterColumn();
            LeaveColumn();
            var buttonResult = Button("Test Button");
            Assert.False(buttonResult);
            EndPanel("Test Panel");
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestNumberBoxAtPositionIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testRect = RectangleFrom(100, 100, 200, 30);
            var testResult = NumberBox(5.0, 1.0, testRect);
            ProcessEvents();
            Assert.InRange(testResult, 4.0, 6.0);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestNumberBoxIntegration()
        {
            var testWindow = OpenWindow("Number Box Test", 800, 600);
            ProcessEvents();
            var testResult = NumberBox(5.0, 1.0);
            Assert.InRange(testResult, 4.0, 6.0);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestNumberBoxLabeledIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testResult = NumberBox("Test Value", 5.0, 1.0);
            Assert.InRange(testResult, 4.0, 6.0);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestOpenPopupIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testPopup = StartPopup("Test Popup");
            ProcessEvents();
            OpenPopup("Test Popup");
            ProcessEvents();
            Assert.True(popupIsOpen);
            EndPopup("Test Popup");
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestParagraphIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            SetInterfaceFont(LoadFont("test_font", "arial.ttf"));
            SetInterfaceFontSize(12);
            Paragraph("This is a test paragraph to check if the text wraps correctly.");
            DrawInterface();
            RefreshScreen();
            Assert.Equal(ColorBlack(), GetPixel(PointAt(10, 10)));
            FreeFont(FontNamed("test_font"));
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestParagraphAtPositionIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testRectangle = RectangleFrom(100, 100, 200, 100);
            Paragraph("This is a test paragraph.", testRectangle);
            RefreshScreen();
            Assert.Equal(ColorBlack(), GetPixel(PointAt(RectangleLeft(testRectangle), RectangleTop(testRectangle))));
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestResetLayoutIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            StartCustomLayout();
            AddColumn(200);
            AddColumn(-1);
            ResetLayout();
            DrawInterface();
            RefreshScreen();
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestSetInterfaceAccentColorIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            SetInterfaceAccentColor(ColorRed(), 0.5);
            Button("Test Button");
            DrawInterface();
            RefreshScreen();
            Assert.Equal(ColorRed(), GetPixel(PointAt(10, 10)));
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestSetInterfaceBorderColorIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            SetInterfaceBorderColor(ColorRed());
            StartPanel("Test Panel", RectangleFrom(100, 100, 200, 100));
            Button("Test Button");
            EndPanel("Test Panel");
            DrawInterface();
            RefreshScreen();
            Assert.Equal(ColorRed(), GetPixel(100, 100));
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestSetInterfaceColorsAutoIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            SetInterfaceColorsAuto(ColorWhite(), ColorBlue(), 0.5, 0.7, 0.3);
            StartPanel("Test Panel", RectangleFrom(100, 100, 200, 200));
            Button("Test Button");
            EndPanel("Test Panel");
            DrawInterface();
            RefreshScreen();
            Assert.Equal(ColorBlue(), GetPixel(150, 150));
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestSetInterfaceElementColorIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            SetInterfaceElementColor(ColorBlack(), 0.5);
            StartPanel("Test Panel", RectangleFrom(100, 100, 200, 200));
            Button("Test Button");
            EndPanel("Test Panel");
            DrawInterface();
            RefreshScreen();
            Assert.Equal(ColorBlack(), GetPixel(150, 150));
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestSetInterfaceElementShadowsIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            SetInterfaceElementShadows(10, ColorBlack(), PointAt(5, 5));
            StartPanel("Test Panel", RectangleFrom(100, 100, 200, 200));
            Button("Test Button");
            EndPanel("Test Panel");
            DrawInterface();
            RefreshScreen();
            Assert.True(PixelDrawnAtPoint(PointAt(105, 105)));
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestSetInterfaceFontFontAsStringIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            SetInterfaceFont("Arial");
            LabelElement("Test Text");
            DrawInterface();
            RefreshScreen();
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestSetInterfaceFontIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testFont = LoadFont("test_font", "arial.ttf");
            SetInterfaceFont(testFont);
            LabelElement("Test Text");
            DrawInterface();
            RefreshScreen();
            FreeFont(testFont);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestSetInterfaceFontSizeIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            SetInterfaceFontSize(16);
            LabelElement("Test Text");
            DrawInterface();
            Assert.True(PixelDrawnAtPoint(PointAt(10, 20)));
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestSetInterfaceLabelWidthIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            SetInterfaceLabelWidth(100);
            var testWidth = GetInterfaceLabelWidth();
            Assert.Equal(100, testWidth);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestSetInterfacePanelShadowsIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            SetInterfacePanelShadows(10, RGBAColor(0, 0, 0, 128), PointAt(5, 5));
            var panelVisible = StartPanel("Test Panel", RectangleFrom(100, 100, 200, 150));
            EndPanel("Test Panel");
            DrawInterface();
            RefreshScreen();
            Assert.Equal(RGBAColor(0, 0, 0, 128), GetPixel(PointAt(105, 105)));
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestSetInterfaceRootTextColorIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            SetInterfaceRootTextColor(ColorRed());
            LabelElement("Test Text", RectangleFrom(100, 100, 200, 50));
            RefreshScreen();
            Assert.True(PixelDrawnAtPoint(ColorRed(), 105, 105));
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestSetInterfaceShadowsIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            SetInterfaceShadows(10, RGBAColor(0, 0, 0, 128), PointAt(5, 5));
            var panelVisible = StartPanel("Test Panel", RectangleFrom(100, 100, 200, 200));
if (Assert.True(panelVisible);
) {
                Button("Test Button");
                EndPanel("Test Panel");
                DrawInterface();
                RefreshScreen();
                Assert.True(PixelDrawnAtPoint(PointAt(105, 105)));
}
}
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestSetInterfaceSpacingIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            SetInterfaceSpacing(10, 5);
            var testPanel = StartPanel("Test Panel", RectangleFrom(100, 100, 200, 200));
            Button("Button 1");
            Button("Button 2");
            EndPanel("Test Panel");
            DrawInterface();
            RefreshScreen();
            Assert.True(PixelDrawnAtPoint(PointAt(110, 110)));
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestSetInterfaceStyleIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            SetInterfaceStyle(InterfaceStyle.Dark);
            Button("Test Button");
            DrawInterface();
            RefreshScreen();
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestSetInterfaceStyleWithColorIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            SetInterfaceStyle(InterfaceStyle.Dark, ColorBlue());
            var testPanel = StartPanel("Test Panel", RectangleFrom(100, 100, 200, 200));
            Button("Test Button");
            DrawInterface();
            RefreshScreen();
            Assert.Equal(ColorBlue(), GetPixel(PointAt(150, 150)));
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestSetInterfaceTextColorIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            SetInterfaceTextColor(ColorRed());
            LabelElement("Test Text");
            DrawInterface();
            RefreshScreen();
            Assert.Equal(ColorRed(), GetPixel(PointAt(10, 10)));
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestSetLayoutHeightIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testPanel = StartPanel("Test Panel", RectangleFrom(0, 0, 800, 600));
            SetLayoutHeight(50);
            Button("Test Button");
            EndPanel("Test Panel");
            DrawInterface();
            RefreshScreen();
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestSingleLineLayoutIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            SingleLineLayout();
            var testButton1 = Button("Button1");
            var testButton2 = Button("Button2");
            ResetLayout();
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestSliderAtPositionIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testRect = RectangleFrom(100, 100, 200, 20);
            ProcessEvents();
            var sliderResult = Slider(50.0, 0.0, 100.0, testRect);
            Assert.InRange(sliderResult, 0.0, 100.0);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestSliderIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            ProcessEvents();
            var testSliderResult = Slider(50.0, 0.0, 100.0);
            Assert.InRange(testSliderResult, 0.0, 100.0);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestSliderLabeledIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testSliderValue = Slider("Test Slider", 50.0, 0.0, 100.0);
            Assert.InRange(testSliderValue, 0.0, 100.0);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestSplitIntoColumnsIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            StartPanel("Test Panel", RectangleFrom(0, 0, 800, 600));
            SplitIntoColumns(3);
            EndPanel("Test Panel");
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestSplitIntoColumnsWithLastWidthIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testPanel = StartPanel("Test Panel", RectangleFrom(0, 0, 800, 600));
            SplitIntoColumns(3, 200);
            Button("Button 1");
            Button("Button 2");
            Button("Button 3");
            EndPanel("Test Panel");
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestSplitIntoColumnsRelativeWithLastWidthIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testPanel = StartPanel("Test Panel", RectangleFrom(0, 0, 800, 600));
            SplitIntoColumnsRelative(3, 0.5);
            Button("Button 1");
            Button("Button 2");
            Button("Button 3");
            EndPanel("Test Panel");
            DrawInterface();
            RefreshScreen();
            Assert.True(PointInRectangle(PointAt(200, 300), RectangleFrom(0, 0, 200, 600)));
            Assert.True(PointInRectangle(PointAt(600, 300), RectangleFrom(400, 0, 400, 600)));
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestStartCustomLayoutIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            StartCustomLayout();
            AddColumn(200);
            var buttonResult = Button("Test Button");
            ResetLayout();
            CloseWindow(testWindow);
            Assert.True(buttonResult);
        }
        [Fact]
        public void TestStartInsetAtPositionIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testRect = RectangleFrom(100, 100, 200, 200);
            StartInset("test_inset", testRect);
            EndInset("test_inset");
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestStartInsetIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            StartPanel("Test Panel", RectangleFrom(100, 100, 300, 300));
            StartInset("Test Inset", 100);
            Button("Test Button");
            EndInset("Test Inset");
            EndPanel("Test Panel");
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestStartPanelIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testRectangle = RectangleFrom(100, 100, 200, 150);
            var panelVisible = StartPanel("Test Panel", testRectangle);
            Assert.True(panelVisible);
            EndPanel("Test Panel");
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestStartPopupIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var popupVisible = StartPopup("Test Popup");
            Assert.True(popupVisible);
            EndPopup("Test Popup");
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestStartTreenodeIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            StartPanel("Test Panel", RectangleFrom(0, 0, 800, 600));
            var testNodeExpanded = StartTreenode("Test Node");
            Assert.True(testNodeExpanded);
            EndTreenode("Test Node");
            EndPanel("Test Panel");
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestTextBoxIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testTextBoxResult = TextBox("Initial Text");
            ProcessEvents();
            Assert.Equal("Initial Text", testTextBoxResult);
            SimulateKeyPress(Keycode.A);
            ProcessEvents();
            var testTextBoxResultUpdated = TextBox(testTextBoxResult);
            Assert.Equal("Initial TextA", testTextBoxResultUpdated);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestTextBoxAtPositionIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testRect = RectangleFrom(100, 100, 200, 30);
            ProcessEvents();
            var testResult1 = TextBox("Initial Text", testRect);
            Assert.Equal("Initial Text", testResult2);
            SimulateKeyPress(Keycode.A);
            ProcessEvents();
            var testResult2 = TextBox(testResult1, testRect);
            Assert.Equal("Initial TextA", testResult1);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestTextBoxLabeledIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testTextBoxResult = TextBox("Enter Name", "John");
            ProcessEvents();
            Assert.Equal("John", testTextBoxResult);
            CloseWindow(testWindow);
        }
    }
}
