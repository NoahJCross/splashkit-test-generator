using Xunit;
using static SplashKitSDK.SplashKit;

namespace SplashKitTests
{
    public class TestInterface
    {
        [Fact]
        public void TestAddColumnIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            while (!QuitRequested()) {
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
            }
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestAddColumnRelativeIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            while (!QuitRequested()) {
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
            }
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestBitmapButtonIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var buttonClicked = false;
            while (!QuitRequested()) {
                ProcessEvents();
                ClearScreen();
                buttonClicked = BitmapButton(testBitmap);;
                DrawInterface();
                RefreshScreen();
            }
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
            var buttonClicked = false;
            while (!QuitRequested()) {
                ProcessEvents();
                ClearScreen();
                buttonClicked = BitmapButton(testBitmap, testRectangle);;
                DrawInterface();
                RefreshScreen();
            }
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
            var buttonClicked = false;
            while (!QuitRequested()) {
                ProcessEvents();
                ClearScreen();
                buttonClicked = BitmapButton(testBitmap, testRectangle, OptionDefaults());;
                DrawInterface();
                RefreshScreen();
            }
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
            var buttonClicked = false;
            while (!QuitRequested()) {
                ProcessEvents();
                ClearScreen();
                buttonClicked = BitmapButton(testBitmap, testOptions2);;
                DrawInterface();
                RefreshScreen();
            }
            Assert.True(buttonClicked);
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestBitmapButtonLabeledIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var buttonClicked = false;
            while (!QuitRequested()) {
                ProcessEvents();
                ClearScreen();
                buttonClicked = BitmapButton("Click Me", testBitmap);;
                DrawInterface();
                RefreshScreen();
            }
            Assert.True(buttonClicked);
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
            var buttonClicked = false;
            while (!QuitRequested()) {
                ProcessEvents();
                ClearScreen();
                buttonClicked = BitmapButton("Click Me", testBitmap, testOptions2);;
                DrawInterface();
                RefreshScreen();
            }
            Assert.True(buttonClicked);
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestButtonAtPositionIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testRectangle = RectangleFrom(100, 100, 200, 50);
            var buttonClicked = false;
            while (!QuitRequested()) {
                ProcessEvents();
                ClearScreen();
                buttonClicked = Button("Click Me", testRectangle);;
                DrawInterface();
                RefreshScreen();
            }
            Assert.True(buttonClicked);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestButtonIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var buttonClicked = false;
            while (!QuitRequested()) {
                ProcessEvents();
                ClearScreen();
                buttonClicked = Button("Click Me");;
                DrawInterface();
                RefreshScreen();
            }
            Assert.True(buttonClicked);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestButtonLabeledIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var buttonClicked = false;
            while (!QuitRequested()) {
                ProcessEvents();
                ClearScreen();
                buttonClicked = Button("Label:", "Click Me");;
                DrawInterface();
                RefreshScreen();
            }
            Assert.True(buttonClicked);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestCheckboxAtPositionIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testRect = RectangleFrom(100, 100, 200, 50);
            var initialCheckboxResult = false;
            var currentCheckboxResult = initialCheckboxResult;
            while (!QuitRequested()) {
                ProcessEvents();
                ClearScreen();
                currentCheckboxResult = Checkbox("Test Checkbox", currentCheckboxResult, testRect);;
                DrawInterface();
                RefreshScreen();
            }
            Assert.True(currentCheckboxResult);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestCheckboxIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var initialCheckboxResult = false;
            var currentCheckboxResult = initialCheckboxResult;
            while (!QuitRequested()) {
                ProcessEvents();
                ClearScreen();
                currentCheckboxResult = Checkbox("Test Checkbox", currentCheckboxResult);;
                DrawInterface();
                RefreshScreen();
            }
            Assert.True(currentCheckboxResult);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestCheckboxLabeledIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var initialCheckboxResult = false;
            var currentCheckboxResult = initialCheckboxResult;
            while (!QuitRequested()) {
                ProcessEvents();
                ClearScreen();
                currentCheckboxResult = Checkbox("Test Checkbox", "Check me", currentCheckboxResult);;
                DrawInterface();
                RefreshScreen();
            }
            Assert.True(currentCheckboxResult);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestColorSliderAtPositionIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var initialColor = ColorBlack();
            var currentColor = initialColor;
            while (!QuitRequested()) {
                ProcessEvents();
                ClearScreen();
                currentColor = ColorSlider(currentColor, RectangleFrom(300, 300, 400, 24));;
                DrawInterface();
                RefreshScreen();
            }
            Assert.NotEqual(currentColor, initialColor);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestColorSliderIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testColor = ColorBlack();
            var currentColor = testColor;
            while (!QuitRequested()) {
                ProcessEvents();
                ClearScreen();
                currentColor = ColorSlider(currentColor);;
                DrawInterface();
                RefreshScreen();
            }
            Assert.NotEqual(currentColor, testColor);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestColorSliderLabeledIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testColor = ColorBlack();
            var currentColor = testColor;
            while (!QuitRequested()) {
                ProcessEvents();
                ClearScreen();
                currentColor = ColorSlider("Test Color Slider", currentColor);;
                DrawInterface();
                RefreshScreen();
            }
            Assert.NotEqual(testColor, currentColor);
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
            while (!QuitRequested()) {
                ProcessEvents();
                ClearScreen();
                StartPanel("Test Panel", RectangleFrom(100, 100, 200, 200));
                WriteLine("Test Button clicked!");
                EndPanel("Test Panel");
                DrawInterface();
                RefreshScreen();
            }
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
            while (!QuitRequested()) {
                ProcessEvents();
                ClearScreen();
                StartInset("Test Inset", 60);
                EndInset("Test Inset");
                DrawInterface();
                RefreshScreen();
            }
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestEndPanelIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            while (!QuitRequested()) {
                ProcessEvents();
                ClearScreen();
                StartPanel("Test Panel", RectangleFrom(100, 100, 200, 200));
                EndPanel("Test Panel");
                DrawInterface();
                RefreshScreen();
            }
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestEndPopupIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            while (!QuitRequested()) {
                ProcessEvents();
                ClearScreen();
                StartPopup("Test Popup");
                EndPopup("Test Popup");
                DrawInterface();
                RefreshScreen();
            }
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestEndTreenodeIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            while (!QuitRequested()) {
                ProcessEvents();
                ClearScreen();
                StartPanel("Test Panel", RectangleFrom(10, 10, 200, 200));
                StartTreenode("Test Node");
                EndTreenode("Test Node");
                EndPanel("Test Panel");
                DrawInterface();
                RefreshScreen();
            }
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestEnterColumnIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            while (!QuitRequested()) {
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
            }
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
            while (!QuitRequested()) {
                ProcessEvents();
                ClearScreen();
                var testHeaderResult = Header("Test Header");
                DrawInterface();
                RefreshScreen();
            }
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestHSBColorSliderAtPositionIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testRect = RectangleFrom(100, 100, 200, 100);
            var testColor = HSBColorSliderAtPosition(0.5, 1.0, 0.5);
            var currentColor = testColor;
            while (!QuitRequested()) {
                ProcessEvents();
                ClearScreen();
                currentColor = HSBColorSlider(currentColor, testRect);;
                DrawInterface();
                RefreshScreen();
            }
            Assert.NotEqual(currentColor, testColor);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestHSBColorSliderIntegration()
        {
            var testWindow = OpenWindow("HSB Slider Test", 800, 600);
            var testColor = ColorBlack();
            var currentColor = testColor;
            while (!QuitRequested()) {
                ProcessEvents();
                ClearScreen();
                currentColor = HSBColorSlider(currentColor);;
                DrawInterface();
                RefreshScreen();
            }
            Assert.NotEqual(currentColor, testColor);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestHSBColorSliderLabeledIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testColor = ColorBlack();
            var currentColor = testColor;
            while (!QuitRequested()) {
                ProcessEvents();
                ClearScreen();
                currentColor = HSBColorSlider("Color Slider", currentColor);;
                DrawInterface();
                RefreshScreen();
            }
            Assert.NotEqual(testColor, currentColor);
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
            while (!QuitRequested()) {
                ProcessEvents();
                ClearScreen();
                InterfaceStylePanel(testRectangle);
                DrawInterface();
                RefreshScreen();
            }
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestLabelElementIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            while (!QuitRequested()) {
                ProcessEvents();
                ClearScreen();
                LabelElement("Test Label");
                DrawInterface();
                RefreshScreen();
            }
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestLabelElementAtPositionIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testRectangle = RectangleFrom(100, 100, 200, 50);
            while (!QuitRequested()) {
                ProcessEvents();
                ClearScreen();
                LabelElementAtPosition("Test Label", testRectangle);
                DrawInterface();
                RefreshScreen();
            }
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestLastElementChangedIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            while (!QuitRequested()) {
                ProcessEvents();
                ClearScreen();
                Slider("Test Slider", 0.0, 0.0, 100.0);
                DrawInterface();
                RefreshScreen();
            }
            Assert.True(LastElementChanged());
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestLastElementConfirmedIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            while (!QuitRequested()) {
                ProcessEvents();
                ClearScreen();
                var testButton = Button("Test Button");
                DrawInterface();
                RefreshScreen();
            }
            Assert.True(LastElementConfirmed());
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestLeaveColumnIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var buttonResult = false;
            while (!QuitRequested()) {
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
            }
            Assert.True(buttonResult);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestNumberBoxAtPositionIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testRect = RectangleFrom(100, 100, 200, 30);
            var testResult = 5.0;
            while (!QuitRequested()) {
                ProcessEvents();
                ClearScreen();
                testResult = NumberBox(testResult, 1.0, testRect);;
                DrawInterface();
                RefreshScreen();
            }
            Assert.InRange(testResult, 4.0, );
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestNumberBoxIntegration()
        {
            var testWindow = OpenWindow("Number Box Test", 800, 600);
            var testResult = 5.0;
            while (!QuitRequested()) {
                ProcessEvents();
                ClearScreen();
                testResult = NumberBox(testResult, 1.0);;
                DrawInterface();
                RefreshScreen();
            }
            Assert.InRange(testResult, 4.0, );
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestNumberBoxLabeledIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testResult = 5.0;
            while (!QuitRequested()) {
                ProcessEvents();
                ClearScreen();
                testResult = NumberBox("Test Value", testResult, 1.0);;
                DrawInterface();
                RefreshScreen();
            }
            Assert.InRange(testResult, 4.0, );
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestOpenPopupIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            while (!QuitRequested()) {
                ProcessEvents();
                ClearScreen();
                StartPopup("Test Popup");
                EndPopup("Test Popup");
                DrawInterface();
                RefreshScreen();
            }
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestParagraphIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            SetInterfaceFont(LoadFont("hara", "hara.ttf"));
            SetInterfaceFontSize(12);
            while (!QuitRequested()) {
                ProcessEvents();
                ClearScreen();
                Paragraph("This is a test paragraph to check if the text wraps correctly.");
                DrawInterface();
                RefreshScreen();
            }
            FreeFont(FontNamed("hara"));
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestParagraphAtPositionIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testRectangle = RectangleFrom(100, 100, 200, 100);
            while (!QuitRequested()) {
                ProcessEvents();
                ClearScreen();
                ParagraphAtPosition("This is a test paragraph.", testRectangle);
                DrawInterface();
                RefreshScreen();
            }
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestResetLayoutIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            while (!QuitRequested()) {
                ProcessEvents();
                ClearScreen();
                StartCustomLayout();
                AddColumn(200);
                AddColumn(-1);
                ResetLayout();
                DrawInterface();
                RefreshScreen();
            }
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestSetInterfaceAccentColorIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            SetInterfaceAccentColor(ColorRed(), 0.5);
            while (!QuitRequested()) {
                ProcessEvents();
                ClearScreen();
                Button("Test Button");
                DrawInterface();
                RefreshScreen();
            }
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestSetInterfaceBorderColorIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            SetInterfaceBorderColor(ColorRed());
            while (!QuitRequested()) {
                ProcessEvents();
                ClearScreen();
                StartPanel("Test Panel", RectangleFrom(100, 100, 200, 100));
                Button("Test Button");
                EndPanel("Test Panel");
                DrawInterface();
                RefreshScreen();
            }
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestSetInterfaceColorsAutoIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            SetInterfaceColorsAuto(ColorWhite(), ColorBlue(), 0.5, 0.7, 0.3);
            while (!QuitRequested()) {
                ProcessEvents();
                ClearScreen();
                StartPanel("Test Panel", RectangleFrom(100, 100, 200, 200));
                Button("Test Button");
                EndPanel("Test Panel");
                DrawInterface();
                RefreshScreen();
            }
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestSetInterfaceElementColorIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            while (!QuitRequested()) {
                ProcessEvents();
                ClearScreen();
                SetInterfaceElementColor(ColorBlack(), 0.5);
                StartPanel("Test Panel", RectangleFrom(100, 100, 200, 200));
                Button("Test Button");
                EndPanel("Test Panel");
                DrawInterface();
                RefreshScreen();
            }
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestSetInterfaceElementShadowsIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            while (!QuitRequested()) {
                ProcessEvents();
                ClearScreen();
                StartPanel("Test Panel", RectangleFrom(100, 100, 200, 200));
                Button("Test Button");
                EndPanel("Test Panel");
                DrawInterface();
                RefreshScreen();
            }
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestSetInterfaceFontFontAsStringIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testFont = LoadFont("hara", "hara.ttf");
            SetInterfaceFontFontAsString("hara");
            while (!QuitRequested()) {
                ProcessEvents();
                ClearScreen();
                LabelElement("Test Text");
                DrawInterface();
                RefreshScreen();
            }
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestSetInterfaceFontIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testFont = LoadFont("hara", "hara.ttf");
            SetInterfaceFont(testFont);
            while (!QuitRequested()) {
                ProcessEvents();
                ClearScreen();
                LabelElement("Test Text");
                DrawInterface();
                RefreshScreen();
            }
            FreeFont(testFont);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestSetInterfaceFontSizeIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            SetInterfaceFontSize(16);
            while (!QuitRequested()) {
                ProcessEvents();
                ClearScreen();
                LabelElement("Test Text");
                DrawInterface();
                RefreshScreen();
            }
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestSetInterfaceLabelWidthIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            SetInterfaceLabelWidth(100);
            while (!QuitRequested()) {
                ProcessEvents();
                ClearScreen();
                var testWidth = GetInterfaceLabelWidth();
                DrawInterface();
                RefreshScreen();
            }
            Assert.Equal(100, GetInterfaceLabelWidth());
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestSetInterfacePanelShadowsIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            SetInterfacePanelShadows(10, RGBAColor(0, 0, 0, 128), PointAt(5, 5));
            while (!QuitRequested()) {
                ProcessEvents();
                ClearScreen();
                StartPanel("Test Panel", RectangleFrom(100, 100, 200, 150));
                EndPanel("Test Panel");
                DrawInterface();
                RefreshScreen();
            }
            Assert.Equal(RGBAColor(0, 0, 0, 128), GetPixel(PointAt(105, 105)));
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestSetInterfaceRootTextColorIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            SetInterfaceRootTextColor(ColorRed());
            while (!QuitRequested()) {
                ProcessEvents();
                ClearScreen();
                LabelElement("Test Text", RectangleFrom(100, 100, 200, 50));
                DrawInterface();
                RefreshScreen();
            }
            Assert.Equal(ColorRed(), GetPixel(PointAt(105, 105)));
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestSetInterfaceShadowsIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            SetInterfaceShadows(10, RGBAColor(0, 0, 0, 128), PointAt(5, 5));
            while (!QuitRequested()) {
                ProcessEvents();
                ClearScreen();
                StartPanel("Test Panel", RectangleFrom(100, 100, 200, 200));
                Button("Test Button");
                EndPanel("Test Panel");
                DrawInterface();
                RefreshScreen();
            }
            Assert.Equal(RGBAColor(0, 0, 0, 128), GetPixel(PointAt(105, 105)));
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestSetInterfaceSpacingIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            SetInterfaceSpacing(10, 5);
            while (!QuitRequested()) {
                ProcessEvents();
                ClearScreen();
                StartPanel("Test Panel", RectangleFrom(100, 100, 200, 200));
                Button("Button 1");
                Button("Button 2");
                EndPanel("Test Panel");
                DrawInterface();
                RefreshScreen();
            }
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestSetInterfaceStyleIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            SetInterfaceStyle(InterfaceStyle.ShadedDarkStyle);
            while (!QuitRequested()) {
                ProcessEvents();
                ClearScreen();
                StartPanel("Test Panel", RectangleFrom(100, 100, 200, 200));
                Button("Test Button");
                EndPanel("Test Panel");
                DrawInterface();
                RefreshScreen();
            }
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestSetInterfaceStyleWithColorIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            SetInterfaceStyleWithColor(InterfaceStyle.ShadedDarkStyle, ColorBlue());
            while (!QuitRequested()) {
                ProcessEvents();
                ClearScreen();
                var testPanel = StartPanel("Test Panel", RectangleFrom(100, 100, 200, 200));
                Button("Test Button");
                EndPanel("Test Panel");
                DrawInterface();
                RefreshScreen();
            }
            Assert.Equal(ColorBlue(), GetPixel(PointAt(150, 150)));
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestSetInterfaceTextColorIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            SetInterfaceTextColor(ColorRed());
            while (!QuitRequested()) {
                ProcessEvents();
                ClearScreen();
                LabelElement("Test Text");
                DrawInterface();
                RefreshScreen();
            }
            Assert.Equal(ColorRed(), GetPixel(PointAt(10, 10)));
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestSetLayoutHeightIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            SetLayoutHeight(50);
            while (!QuitRequested()) {
                ProcessEvents();
                ClearScreen();
                StartPanel("Test Panel", RectangleFrom(0, 0, 800, 600));
                Button("Test Button");
                EndPanel("Test Panel");
                DrawInterface();
                RefreshScreen();
            }
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestSingleLineLayoutIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            SingleLineLayout();
            while (!QuitRequested()) {
                ProcessEvents();
                ClearScreen();
                var testButton1 = Button("Button1");
                var testButton2 = Button("Button2");
                ResetLayout();
                DrawInterface();
                RefreshScreen();
            }
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestSliderAtPositionIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testRect = RectangleFrom(100, 100, 200, 20);
            var initialValue = 50.0;
            var sliderResult = initialValue;
            while (!QuitRequested()) {
                ProcessEvents();
                ClearScreen();
                sliderResult = Slider(sliderResult, 0.0, 100.0, testRect);;
                DrawInterface();
                RefreshScreen();
            }
            Assert.NotEqual(initialValue, sliderResult);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestSliderIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var initialValue = 50.0;
            var sliderResult = initialValue;
            while (!QuitRequested()) {
                ProcessEvents();
                ClearScreen();
                sliderResult = Slider(sliderResult, 0.0, 100.0);;
                DrawInterface();
                RefreshScreen();
            }
            Assert.NotEqual(initialValue, sliderResult);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestSliderLabeledIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var initialValue = 50.0;
            var sliderResult = initialValue;
            while (!QuitRequested()) {
                ProcessEvents();
                ClearScreen();
                sliderResult = Slider("Test Slider", sliderResult, 0.0, 100.0);;
                DrawInterface();
                RefreshScreen();
            }
            Assert.NotEqual(initialValue, sliderResult);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestSplitIntoColumnsIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            while (!QuitRequested()) {
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
            }
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestSplitIntoColumnsWithLastWidthIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            while (!QuitRequested()) {
                ProcessEvents();
                ClearScreen();
                StartPanel("Test Panel", RectangleFrom(0, 0, 800, 600));
                SplitIntoColumnsWithLastWidth(3, 200);
                Button("Button 1");
                Button("Button 2");
                Button("Button 3");
                EndPanel("Test Panel");
                DrawInterface();
                RefreshScreen();
            }
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestSplitIntoColumnsRelativeWithLastWidthIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            while (!QuitRequested()) {
                ProcessEvents();
                ClearScreen();
                StartPanel("Test Panel", RectangleFrom(0, 0, 800, 600));
                SplitIntoColumnsRelativeWithLastWidth(3, 0.5);
                Button("Button 1");
                Button("Button 2");
                Button("Button 3");
                EndPanel("Test Panel");
                DrawInterface();
                RefreshScreen();
            }
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestStartCustomLayoutIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var buttonResult = false;
            while (!QuitRequested()) {
                ProcessEvents();
                ClearScreen();
                StartCustomLayout();
                AddColumn(200);
                buttonResult = Button("Test Button");;
                ResetLayout();
                DrawInterface();
                RefreshScreen();
            }
            CloseWindow(testWindow);
            Assert.True(buttonResult);
        }
        [Fact]
        public void TestStartInsetAtPositionIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testRect = RectangleFrom(100, 100, 200, 200);
            while (!QuitRequested()) {
                ProcessEvents();
                ClearScreen();
                StartInsetAtPosition("test_inset", testRect);
                Button("Test Button");
                EndInset("test_inset");
                DrawInterface();
                RefreshScreen();
            }
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestStartInsetIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            while (!QuitRequested()) {
                ProcessEvents();
                ClearScreen();
                StartInset("Test Inset", 100);
                Button("Test Button");
                EndInset("Test Inset");
                DrawInterface();
                RefreshScreen();
            }
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestStartPanelIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testRectangle = RectangleFrom(100, 100, 200, 150);
            while (!QuitRequested()) {
                ProcessEvents();
                ClearScreen();
                StartPanel("Test Panel", testRectangle);
                Button("Test Button");
                EndPanel("Test Panel");
                DrawInterface();
                RefreshScreen();
            }
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestStartPopupIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            while (!QuitRequested()) {
                ProcessEvents();
                ClearScreen();
                StartPopup("Test Popup");
                Button("Test Button");
                EndPopup("Test Popup");
                DrawInterface();
                RefreshScreen();
            }
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestStartTreenodeIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            while (!QuitRequested()) {
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
            }
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestTextBoxIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var initialText = "Initial Text";
            var textResult = initialText;
            while (!QuitRequested()) {
                ProcessEvents();
                ClearScreen();
                textResult = TextBox(textResult);;
                DrawInterface();
                RefreshScreen();
            }
            Assert.NotEqual(initialText, textResult);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestTextBoxAtPositionIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testRect = RectangleFrom(100, 100, 200, 30);
            var initialText = "Initial Text";
            var textResult = initialText;
            while (!QuitRequested()) {
                ProcessEvents();
                ClearScreen();
                textResult = TextBox(textResult, testRect);;
                DrawInterface();
                RefreshScreen();
            }
            Assert.NotEqual(initialText, textResult);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestTextBoxLabeledIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var initialText = "Initial Text";
            var textResult = initialText;
            while (!QuitRequested()) {
                ProcessEvents();
                ClearScreen();
                textResult = TextBox("Enter Name", textResult);;
                DrawInterface();
                RefreshScreen();
            }
            Assert.NotEqual(initialText, textResult);
            CloseWindow(testWindow);
        }
    }
}
