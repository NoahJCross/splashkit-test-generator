using Xunit;
using static SplashKitSDK.SplashKit;

namespace SplashKitTests
{
    public class IntegrationTests
    {
        [Fact]
        public void TestAlphaOfIntegration()
        {
            var redColor = ColorRed();
            var alphaValue = AlphaOf(redColor);
            Assert.Equal(alphaValue, 255);
            var transparentColor = ColorTransparent();
            var alphaValueTransparent = AlphaOf(transparentColor);
            Assert.Equal(alphaValueTransparent, 255);
        }
        [Fact]
        public void TestBlueOfIntegration()
        {
            var blueColor = ColorBlue();
            var blueValue = BlueOf(blueColor);
            Assert.Equal(blueValue, 255);
            var redColor = ColorRed();
            var blueValueRed = BlueOf(redColor);
            Assert.Equal(blueValueRed, 0);
        }
        [Fact]
        public void TestBrightnessOfIntegration()
        {
            var whiteColor = ColorWhite();
            var whiteBrightness = BrightnessOf(whiteColor);
            Assert.Equal(whiteBrightness, 1.0);
            var blackColor = ColorBlack();
            var blackBrightness = BrightnessOf(blackColor);
            Assert.Equal(blackBrightness, 0.0);
            var grayColor = ColorGray();
            var grayBrightness = BrightnessOf(grayColor);
            Assert.InRange(grayBrightness, 0.4, 0.6);
        }
        [Fact]
        public void TestColorAliceBlueIntegration()
        {
            var aliceBlueColor = ColorAliceBlue();
            Assert.Equal(RedOf(aliceBlueColor), 240);
            Assert.Equal(GreenOf(aliceBlueColor), 248);
            Assert.Equal(BlueOf(aliceBlueColor), 255);
            Assert.Equal(AlphaOf(aliceBlueColor), 255);
        }
        [Fact]
        public void TestColorAntiqueWhiteIntegration()
        {
            var antiqueWhiteColor = ColorAntiqueWhite();
            Assert.Equal(RedOf(antiqueWhiteColor), 250);
            Assert.Equal(GreenOf(antiqueWhiteColor), 235);
            Assert.Equal(BlueOf(antiqueWhiteColor), 215);
            Assert.Equal(AlphaOf(antiqueWhiteColor), 255);
        }
        [Fact]
        public void TestColorAquaIntegration()
        {
            var aquaColor = ColorAqua();
            Assert.Equal(RedOf(aquaColor), 0);
            Assert.Equal(GreenOf(aquaColor), 255);
            Assert.Equal(BlueOf(aquaColor), 255);
            Assert.Equal(AlphaOf(aquaColor), 255);
        }
        [Fact]
        public void TestColorAquamarineIntegration()
        {
            var aquamarineColor = ColorAquamarine();
            Assert.Equal(RedOf(aquamarineColor), 127);
            Assert.Equal(GreenOf(aquamarineColor), 255);
            Assert.Equal(BlueOf(aquamarineColor), 212);
            Assert.Equal(AlphaOf(aquamarineColor), 255);
        }
        [Fact]
        public void TestColorAzureIntegration()
        {
            var azureColor = ColorAzure();
            Assert.Equal(RedOf(azureColor), 240);
            Assert.Equal(GreenOf(azureColor), 255);
            Assert.Equal(BlueOf(azureColor), 255);
            Assert.Equal(AlphaOf(azureColor), 255);
        }
        [Fact]
        public void TestColorBeigeIntegration()
        {
            var beigeColor = ColorBeige();
            Assert.Equal(RedOf(beigeColor), 245);
            Assert.Equal(GreenOf(beigeColor), 245);
            Assert.Equal(BlueOf(beigeColor), 220);
            Assert.Equal(AlphaOf(beigeColor), 255);
        }
        [Fact]
        public void TestColorBisqueIntegration()
        {
            var bisqueColor = ColorBisque();
            Assert.Equal(RedOf(bisqueColor), 255);
            Assert.Equal(GreenOf(bisqueColor), 228);
            Assert.Equal(BlueOf(bisqueColor), 196);
            Assert.Equal(AlphaOf(bisqueColor), 255);
        }
        [Fact]
        public void TestColorBlackIntegration()
        {
            var blackColor = ColorBlack();
            Assert.Equal(RedOf(blackColor), 0);
            Assert.Equal(GreenOf(blackColor), 0);
            Assert.Equal(BlueOf(blackColor), 0);
            Assert.Equal(AlphaOf(blackColor), 255);
        }
        [Fact]
        public void TestColorBlanchedAlmondIntegration()
        {
            var blanchedAlmondColor = ColorBlanchedAlmond();
            Assert.Equal(RedOf(blanchedAlmondColor), 255);
            Assert.Equal(GreenOf(blanchedAlmondColor), 235);
            Assert.Equal(BlueOf(blanchedAlmondColor), 205);
            Assert.Equal(AlphaOf(blanchedAlmondColor), 255);
        }
        [Fact]
        public void TestColorBlueIntegration()
        {
            var blueColor = ColorBlue();
            Assert.Equal(RedOf(blueColor), 0);
            Assert.Equal(GreenOf(blueColor), 0);
            Assert.Equal(BlueOf(blueColor), 255);
            Assert.Equal(AlphaOf(blueColor), 255);
        }
        [Fact]
        public void TestColorBlueVioletIntegration()
        {
            var blueVioletColor = ColorBlueViolet();
            Assert.Equal(RedOf(blueVioletColor), 138);
            Assert.Equal(GreenOf(blueVioletColor), 43);
            Assert.Equal(BlueOf(blueVioletColor), 226);
            Assert.Equal(AlphaOf(blueVioletColor), 255);
        }
        [Fact]
        public void TestColorBrightGreenIntegration()
        {
            var brightGreenColor = ColorBrightGreen();
            Assert.Equal(RedOf(brightGreenColor), 0);
            Assert.Equal(GreenOf(brightGreenColor), 255);
            Assert.Equal(BlueOf(brightGreenColor), 0);
            Assert.Equal(AlphaOf(brightGreenColor), 255);
        }
        [Fact]
        public void TestColorBrownIntegration()
        {
            var brownColor = ColorBrown();
            Assert.Equal(RedOf(brownColor), 165);
            Assert.Equal(GreenOf(brownColor), 42);
            Assert.Equal(BlueOf(brownColor), 42);
            Assert.Equal(AlphaOf(brownColor), 255);
        }
        [Fact]
        public void TestColorBurlyWoodIntegration()
        {
            var burlyWoodColor = ColorBurlyWood();
            Assert.Equal(RedOf(burlyWoodColor), 222);
            Assert.Equal(GreenOf(burlyWoodColor), 184);
            Assert.Equal(BlueOf(burlyWoodColor), 135);
            Assert.Equal(AlphaOf(burlyWoodColor), 255);
        }
        [Fact]
        public void TestColorCadetBlueIntegration()
        {
            var cadetBlueColor = ColorCadetBlue();
            Assert.Equal(RedOf(cadetBlueColor), 95);
            Assert.Equal(GreenOf(cadetBlueColor), 158);
            Assert.Equal(BlueOf(cadetBlueColor), 160);
            Assert.Equal(AlphaOf(cadetBlueColor), 255);
        }
        [Fact]
        public void TestColorChartreuseIntegration()
        {
            var chartreuseColor = ColorChartreuse();
            Assert.Equal(RedOf(chartreuseColor), 127);
            Assert.Equal(GreenOf(chartreuseColor), 255);
            Assert.Equal(BlueOf(chartreuseColor), 0);
            Assert.Equal(AlphaOf(chartreuseColor), 255);
        }
        [Fact]
        public void TestColorChocolateIntegration()
        {
            var chocolateColor = ColorChocolate();
            Assert.Equal(RedOf(chocolateColor), 210);
            Assert.Equal(GreenOf(chocolateColor), 105);
            Assert.Equal(BlueOf(chocolateColor), 30);
            Assert.Equal(AlphaOf(chocolateColor), 255);
        }
        [Fact]
        public void TestColorCoralIntegration()
        {
            var coralColor = ColorCoral();
            Assert.Equal(RedOf(coralColor), 255);
            Assert.Equal(GreenOf(coralColor), 127);
            Assert.Equal(BlueOf(coralColor), 80);
            Assert.Equal(AlphaOf(coralColor), 255);
        }
        [Fact]
        public void TestColorCornflowerBlueIntegration()
        {
            var cornflowerBlueColor = ColorCornflowerBlue();
            Assert.Equal(RedOf(cornflowerBlueColor), 100);
            Assert.Equal(GreenOf(cornflowerBlueColor), 149);
            Assert.Equal(BlueOf(cornflowerBlueColor), 237);
            Assert.Equal(AlphaOf(cornflowerBlueColor), 255);
        }
        [Fact]
        public void TestColorCornsilkIntegration()
        {
            var cornsilkColor = ColorCornsilk();
            Assert.Equal(RedOf(cornsilkColor), 255);
            Assert.Equal(GreenOf(cornsilkColor), 248);
            Assert.Equal(BlueOf(cornsilkColor), 220);
            Assert.Equal(AlphaOf(cornsilkColor), 255);
        }
        [Fact]
        public void TestColorCrimsonIntegration()
        {
            var crimsonColor = ColorCrimson();
            Assert.Equal(RedOf(crimsonColor), 220);
            Assert.Equal(GreenOf(crimsonColor), 20);
            Assert.Equal(BlueOf(crimsonColor), 60);
            Assert.Equal(AlphaOf(crimsonColor), 255);
        }
        [Fact]
        public void TestColorCyanIntegration()
        {
            var cyanColor = ColorCyan();
            Assert.Equal(RedOf(cyanColor), 0);
            Assert.Equal(GreenOf(cyanColor), 255);
            Assert.Equal(BlueOf(cyanColor), 255);
            Assert.Equal(AlphaOf(cyanColor), 255);
        }
        [Fact]
        public void TestColorDarkBlueIntegration()
        {
            var darkBlueColor = ColorDarkBlue();
            Assert.Equal(RedOf(darkBlueColor), 0);
            Assert.Equal(GreenOf(darkBlueColor), 0);
            Assert.Equal(BlueOf(darkBlueColor), 139);
            Assert.Equal(AlphaOf(darkBlueColor), 255);
        }
        [Fact]
        public void TestColorDarkCyanIntegration()
        {
            var darkCyanColor = ColorDarkCyan();
            Assert.Equal(RedOf(darkCyanColor), 0);
            Assert.Equal(GreenOf(darkCyanColor), 139);
            Assert.Equal(BlueOf(darkCyanColor), 139);
            Assert.Equal(AlphaOf(darkCyanColor), 255);
        }
        [Fact]
        public void TestColorDarkGoldenrodIntegration()
        {
            var darkGoldenrodColor = ColorDarkGoldenrod();
            Assert.Equal(RedOf(darkGoldenrodColor), 184);
            Assert.Equal(GreenOf(darkGoldenrodColor), 134);
            Assert.Equal(BlueOf(darkGoldenrodColor), 11);
            Assert.Equal(AlphaOf(darkGoldenrodColor), 255);
        }
        [Fact]
        public void TestColorDarkGrayIntegration()
        {
            var darkGrayColor = ColorDarkGray();
            Assert.Equal(RedOf(darkGrayColor), 169);
            Assert.Equal(GreenOf(darkGrayColor), 169);
            Assert.Equal(BlueOf(darkGrayColor), 169);
            Assert.Equal(AlphaOf(darkGrayColor), 255);
        }
        [Fact]
        public void TestColorDarkGreenIntegration()
        {
            var darkGreenColor = ColorDarkGreen();
            Assert.Equal(RedOf(darkGreenColor), 0);
            Assert.Equal(GreenOf(darkGreenColor), 100);
            Assert.Equal(BlueOf(darkGreenColor), 0);
            Assert.Equal(AlphaOf(darkGreenColor), 255);
        }
        [Fact]
        public void TestColorDarkKhakiIntegration()
        {
            var darkKhakiColor = ColorDarkKhaki();
            Assert.Equal(RedOf(darkKhakiColor), 189);
            Assert.Equal(GreenOf(darkKhakiColor), 183);
            Assert.Equal(BlueOf(darkKhakiColor), 107);
            Assert.Equal(AlphaOf(darkKhakiColor), 255);
        }
        [Fact]
        public void TestColorDarkMagentaIntegration()
        {
            var darkMagentaColor = ColorDarkMagenta();
            Assert.Equal(RedOf(darkMagentaColor), 139);
            Assert.Equal(GreenOf(darkMagentaColor), 0);
            Assert.Equal(BlueOf(darkMagentaColor), 139);
            Assert.Equal(AlphaOf(darkMagentaColor), 255);
        }
        [Fact]
        public void TestColorDarkOliveGreenIntegration()
        {
            var darkOliveGreenColor = ColorDarkOliveGreen();
            Assert.Equal(RedOf(darkOliveGreenColor), 85);
            Assert.Equal(GreenOf(darkOliveGreenColor), 107);
            Assert.Equal(BlueOf(darkOliveGreenColor), 47);
            Assert.Equal(AlphaOf(darkOliveGreenColor), 255);
        }
        [Fact]
        public void TestColorDarkOrangeIntegration()
        {
            var darkOrangeColor = ColorDarkOrange();
            Assert.Equal(RedOf(darkOrangeColor), 255);
            Assert.Equal(GreenOf(darkOrangeColor), 140);
            Assert.Equal(BlueOf(darkOrangeColor), 0);
            Assert.Equal(AlphaOf(darkOrangeColor), 255);
        }
        [Fact]
        public void TestColorDarkOrchidIntegration()
        {
            var darkOrchidColor = ColorDarkOrchid();
            Assert.Equal(RedOf(darkOrchidColor), 153);
            Assert.Equal(GreenOf(darkOrchidColor), 50);
            Assert.Equal(BlueOf(darkOrchidColor), 204);
            Assert.Equal(AlphaOf(darkOrchidColor), 255);
        }
        [Fact]
        public void TestColorDarkRedIntegration()
        {
            var darkRedColor = ColorDarkRed();
            Assert.Equal(RedOf(darkRedColor), 139);
            Assert.Equal(GreenOf(darkRedColor), 0);
            Assert.Equal(BlueOf(darkRedColor), 0);
            Assert.Equal(AlphaOf(darkRedColor), 255);
        }
        [Fact]
        public void TestColorDarkSalmonIntegration()
        {
            var darkSalmonColor = ColorDarkSalmon();
            Assert.Equal(RedOf(darkSalmonColor), 233);
            Assert.Equal(GreenOf(darkSalmonColor), 150);
            Assert.Equal(BlueOf(darkSalmonColor), 122);
            Assert.Equal(AlphaOf(darkSalmonColor), 255);
        }
        [Fact]
        public void TestColorDarkSeaGreenIntegration()
        {
            var darkSeaGreenColor = ColorDarkSeaGreen();
            Assert.Equal(RedOf(darkSeaGreenColor), 143);
            Assert.Equal(GreenOf(darkSeaGreenColor), 188);
            Assert.Equal(BlueOf(darkSeaGreenColor), 139);
            Assert.Equal(AlphaOf(darkSeaGreenColor), 255);
        }
        [Fact]
        public void TestColorDarkSlateBlueIntegration()
        {
            var darkSlateBlueColor = ColorDarkSlateBlue();
            Assert.Equal(RedOf(darkSlateBlueColor), 72);
            Assert.Equal(GreenOf(darkSlateBlueColor), 61);
            Assert.Equal(BlueOf(darkSlateBlueColor), 139);
            Assert.Equal(AlphaOf(darkSlateBlueColor), 255);
        }
        [Fact]
        public void TestColorDarkSlateGrayIntegration()
        {
            var darkSlateGrayColor = ColorDarkSlateGray();
            Assert.Equal(RedOf(darkSlateGrayColor), 47);
            Assert.Equal(GreenOf(darkSlateGrayColor), 79);
            Assert.Equal(BlueOf(darkSlateGrayColor), 79);
            Assert.Equal(AlphaOf(darkSlateGrayColor), 255);
        }
        [Fact]
        public void TestColorDarkTurquoiseIntegration()
        {
            var darkTurquoiseColor = ColorDarkTurquoise();
            Assert.Equal(RedOf(darkTurquoiseColor), 0);
            Assert.Equal(GreenOf(darkTurquoiseColor), 206);
            Assert.Equal(BlueOf(darkTurquoiseColor), 209);
            Assert.Equal(AlphaOf(darkTurquoiseColor), 255);
        }
        [Fact]
        public void TestColorDarkVioletIntegration()
        {
            var darkVioletColor = ColorDarkViolet();
            Assert.Equal(RedOf(darkVioletColor), 148);
            Assert.Equal(GreenOf(darkVioletColor), 0);
            Assert.Equal(BlueOf(darkVioletColor), 211);
            Assert.Equal(AlphaOf(darkVioletColor), 255);
        }
        [Fact]
        public void TestColorDeepPinkIntegration()
        {
            var deepPinkColor = ColorDeepPink();
            Assert.Equal(RedOf(deepPinkColor), 255);
            Assert.Equal(GreenOf(deepPinkColor), 20);
            Assert.Equal(BlueOf(deepPinkColor), 147);
            Assert.Equal(AlphaOf(deepPinkColor), 255);
        }
        [Fact]
        public void TestColorDeepSkyBlueIntegration()
        {
            var deepSkyBlueColor = ColorDeepSkyBlue();
            Assert.Equal(RedOf(deepSkyBlueColor), 0);
            Assert.Equal(GreenOf(deepSkyBlueColor), 191);
            Assert.Equal(BlueOf(deepSkyBlueColor), 255);
            Assert.Equal(AlphaOf(deepSkyBlueColor), 255);
        }
        [Fact]
        public void TestColorDimGrayIntegration()
        {
            var dimGrayColor = ColorDimGray();
            Assert.Equal(RedOf(dimGrayColor), 105);
            Assert.Equal(GreenOf(dimGrayColor), 105);
            Assert.Equal(BlueOf(dimGrayColor), 105);
            Assert.Equal(AlphaOf(dimGrayColor), 255);
        }
        [Fact]
        public void TestColorDodgerBlueIntegration()
        {
            var dodgerBlueColor = ColorDodgerBlue();
            Assert.Equal(RedOf(dodgerBlueColor), 30);
            Assert.Equal(GreenOf(dodgerBlueColor), 144);
            Assert.Equal(BlueOf(dodgerBlueColor), 255);
            Assert.Equal(AlphaOf(dodgerBlueColor), 255);
        }
        [Fact]
        public void TestColorFirebrickIntegration()
        {
            var firebrickColor = ColorFirebrick();
            Assert.Equal(RedOf(firebrickColor), 178);
            Assert.Equal(GreenOf(firebrickColor), 34);
            Assert.Equal(BlueOf(firebrickColor), 34);
            Assert.Equal(AlphaOf(firebrickColor), 255);
        }
        [Fact]
        public void TestColorFloralWhiteIntegration()
        {
            var floralWhiteColor = ColorFloralWhite();
            Assert.Equal(RedOf(floralWhiteColor), 255);
            Assert.Equal(GreenOf(floralWhiteColor), 250);
            Assert.Equal(BlueOf(floralWhiteColor), 240);
            Assert.Equal(AlphaOf(floralWhiteColor), 255);
        }
        [Fact]
        public void TestColorForestGreenIntegration()
        {
            var forestGreenColor = ColorForestGreen();
            Assert.Equal(RedOf(forestGreenColor), 34);
            Assert.Equal(GreenOf(forestGreenColor), 139);
            Assert.Equal(BlueOf(forestGreenColor), 34);
            Assert.Equal(AlphaOf(forestGreenColor), 255);
        }
        [Fact]
        public void TestColorFuchsiaIntegration()
        {
            var fuchsiaColor = ColorFuchsia();
            Assert.Equal(RedOf(fuchsiaColor), 255);
            Assert.Equal(GreenOf(fuchsiaColor), 0);
            Assert.Equal(BlueOf(fuchsiaColor), 255);
            Assert.Equal(AlphaOf(fuchsiaColor), 255);
        }
        [Fact]
        public void TestColorGainsboroIntegration()
        {
            var gainsboroColor = ColorGainsboro();
            Assert.Equal(RedOf(gainsboroColor), 220);
            Assert.Equal(GreenOf(gainsboroColor), 220);
            Assert.Equal(BlueOf(gainsboroColor), 220);
            Assert.Equal(AlphaOf(gainsboroColor), 255);
        }
        [Fact]
        public void TestColorGhostWhiteIntegration()
        {
            var ghostWhiteColor = ColorGhostWhite();
            Assert.Equal(RedOf(ghostWhiteColor), 248);
            Assert.Equal(GreenOf(ghostWhiteColor), 248);
            Assert.Equal(BlueOf(ghostWhiteColor), 255);
            Assert.Equal(AlphaOf(ghostWhiteColor), 255);
        }
        [Fact]
        public void TestColorGoldIntegration()
        {
            var goldColor = ColorGold();
            Assert.Equal(RedOf(goldColor), 255);
            Assert.Equal(GreenOf(goldColor), 215);
            Assert.Equal(BlueOf(goldColor), 0);
            Assert.Equal(AlphaOf(goldColor), 255);
        }
        [Fact]
        public void TestColorGoldenrodIntegration()
        {
            var goldenrodColor = ColorGoldenrod();
            Assert.Equal(RedOf(goldenrodColor), 218);
            Assert.Equal(GreenOf(goldenrodColor), 165);
            Assert.Equal(BlueOf(goldenrodColor), 32);
            Assert.Equal(AlphaOf(goldenrodColor), 255);
        }
        [Fact]
        public void TestColorGrayIntegration()
        {
            var grayColor = ColorGray();
            Assert.Equal(RedOf(grayColor), 127);
            Assert.Equal(GreenOf(grayColor), 127);
            Assert.Equal(BlueOf(grayColor), 127);
            Assert.Equal(AlphaOf(grayColor), 255);
        }
        [Fact]
        public void TestColorGreenIntegration()
        {
            var greenColor = ColorGreen();
            Assert.Equal(RedOf(greenColor), 0);
            Assert.Equal(GreenOf(greenColor), 127);
            Assert.Equal(BlueOf(greenColor), 0);
            Assert.Equal(AlphaOf(greenColor), 255);
        }
        [Fact]
        public void TestColorGreenYellowIntegration()
        {
            var greenYellowColor = ColorGreenYellow();
            Assert.Equal(RedOf(greenYellowColor), 173);
            Assert.Equal(GreenOf(greenYellowColor), 255);
            Assert.Equal(BlueOf(greenYellowColor), 47);
            Assert.Equal(AlphaOf(greenYellowColor), 255);
        }
        [Fact]
        public void TestColorHoneydewIntegration()
        {
            var honeydewColor = ColorHoneydew();
            Assert.Equal(RedOf(honeydewColor), 240);
            Assert.Equal(GreenOf(honeydewColor), 255);
            Assert.Equal(BlueOf(honeydewColor), 240);
            Assert.Equal(AlphaOf(honeydewColor), 255);
        }
        [Fact]
        public void TestColorHotPinkIntegration()
        {
            var hotPinkColor = ColorHotPink();
            Assert.Equal(RedOf(hotPinkColor), 255);
            Assert.Equal(GreenOf(hotPinkColor), 105);
            Assert.Equal(BlueOf(hotPinkColor), 180);
            Assert.Equal(AlphaOf(hotPinkColor), 255);
        }
        [Fact]
        public void TestColorIndianRedIntegration()
        {
            var indianRedColor = ColorIndianRed();
            Assert.Equal(RedOf(indianRedColor), 205);
            Assert.Equal(GreenOf(indianRedColor), 92);
            Assert.Equal(BlueOf(indianRedColor), 92);
            Assert.Equal(AlphaOf(indianRedColor), 255);
        }
        [Fact]
        public void TestColorIndigoIntegration()
        {
            var indigoColor = ColorIndigo();
            Assert.Equal(RedOf(indigoColor), 75);
            Assert.Equal(GreenOf(indigoColor), 0);
            Assert.Equal(BlueOf(indigoColor), 130);
            Assert.Equal(AlphaOf(indigoColor), 255);
        }
        [Fact]
        public void TestColorIvoryIntegration()
        {
            var ivoryColor = ColorIvory();
            Assert.Equal(RedOf(ivoryColor), 255);
            Assert.Equal(GreenOf(ivoryColor), 255);
            Assert.Equal(BlueOf(ivoryColor), 240);
            Assert.Equal(AlphaOf(ivoryColor), 255);
        }
        [Fact]
        public void TestColorKhakiIntegration()
        {
            var khakiColor = ColorKhaki();
            Assert.Equal(RedOf(khakiColor), 240);
            Assert.Equal(GreenOf(khakiColor), 230);
            Assert.Equal(BlueOf(khakiColor), 140);
            Assert.Equal(AlphaOf(khakiColor), 255);
        }
        [Fact]
        public void TestColorLavenderIntegration()
        {
            var lavenderColor = ColorLavender();
            Assert.Equal(RedOf(lavenderColor), 230);
            Assert.Equal(GreenOf(lavenderColor), 230);
            Assert.Equal(BlueOf(lavenderColor), 250);
            Assert.Equal(AlphaOf(lavenderColor), 255);
        }
        [Fact]
        public void TestColorLavenderBlushIntegration()
        {
            var lavenderBlushColor = ColorLavenderBlush();
            Assert.Equal(RedOf(lavenderBlushColor), 255);
            Assert.Equal(GreenOf(lavenderBlushColor), 240);
            Assert.Equal(BlueOf(lavenderBlushColor), 245);
            Assert.Equal(AlphaOf(lavenderBlushColor), 255);
        }
        [Fact]
        public void TestColorLawnGreenIntegration()
        {
            var lawnGreenColor = ColorLawnGreen();
            Assert.Equal(RedOf(lawnGreenColor), 124);
            Assert.Equal(GreenOf(lawnGreenColor), 252);
            Assert.Equal(BlueOf(lawnGreenColor), 0);
            Assert.Equal(AlphaOf(lawnGreenColor), 255);
        }
        [Fact]
        public void TestColorLemonChiffonIntegration()
        {
            var lemonChiffonColor = ColorLemonChiffon();
            Assert.Equal(RedOf(lemonChiffonColor), 255);
            Assert.Equal(GreenOf(lemonChiffonColor), 250);
            Assert.Equal(BlueOf(lemonChiffonColor), 205);
            Assert.Equal(AlphaOf(lemonChiffonColor), 255);
        }
        [Fact]
        public void TestColorLightBlueIntegration()
        {
            var lightBlueColor = ColorLightBlue();
            Assert.Equal(RedOf(lightBlueColor), 173);
            Assert.Equal(GreenOf(lightBlueColor), 216);
            Assert.Equal(BlueOf(lightBlueColor), 230);
            Assert.Equal(AlphaOf(lightBlueColor), 255);
        }
        [Fact]
        public void TestColorLightCoralIntegration()
        {
            var lightCoralColor = ColorLightCoral();
            Assert.Equal(RedOf(lightCoralColor), 240);
            Assert.Equal(GreenOf(lightCoralColor), 127);
            Assert.Equal(BlueOf(lightCoralColor), 127);
            Assert.Equal(AlphaOf(lightCoralColor), 255);
        }
        [Fact]
        public void TestColorLightCyanIntegration()
        {
            var lightCyanColor = ColorLightCyan();
            Assert.Equal(RedOf(lightCyanColor), 224);
            Assert.Equal(GreenOf(lightCyanColor), 255);
            Assert.Equal(BlueOf(lightCyanColor), 255);
            Assert.Equal(AlphaOf(lightCyanColor), 255);
        }
        [Fact]
        public void TestColorLightGoldenrodYellowIntegration()
        {
            var lightGoldenrodYellowColor = ColorLightGoldenrodYellow();
            Assert.Equal(RedOf(lightGoldenrodYellowColor), 250);
            Assert.Equal(GreenOf(lightGoldenrodYellowColor), 250);
            Assert.Equal(BlueOf(lightGoldenrodYellowColor), 210);
            Assert.Equal(AlphaOf(lightGoldenrodYellowColor), 255);
        }
        [Fact]
        public void TestColorLightGrayIntegration()
        {
            var lightGrayColor = ColorLightGray();
            Assert.Equal(RedOf(lightGrayColor), 211);
            Assert.Equal(GreenOf(lightGrayColor), 211);
            Assert.Equal(BlueOf(lightGrayColor), 211);
            Assert.Equal(AlphaOf(lightGrayColor), 255);
        }
        [Fact]
        public void TestColorLightGreenIntegration()
        {
            var lightGreenColor = ColorLightGreen();
            Assert.Equal(RedOf(lightGreenColor), 144);
            Assert.Equal(GreenOf(lightGreenColor), 238);
            Assert.Equal(BlueOf(lightGreenColor), 144);
            Assert.Equal(AlphaOf(lightGreenColor), 255);
        }
        [Fact]
        public void TestColorLightPinkIntegration()
        {
            var lightPinkColor = ColorLightPink();
            Assert.Equal(RedOf(lightPinkColor), 255);
            Assert.Equal(GreenOf(lightPinkColor), 182);
            Assert.Equal(BlueOf(lightPinkColor), 193);
            Assert.Equal(AlphaOf(lightPinkColor), 255);
        }
        [Fact]
        public void TestColorLightSalmonIntegration()
        {
            var lightSalmonColor = ColorLightSalmon();
            Assert.Equal(RedOf(lightSalmonColor), 255);
            Assert.Equal(GreenOf(lightSalmonColor), 160);
            Assert.Equal(BlueOf(lightSalmonColor), 122);
            Assert.Equal(AlphaOf(lightSalmonColor), 255);
        }
        [Fact]
        public void TestColorLightSeaGreenIntegration()
        {
            var lightSeaGreenColor = ColorLightSeaGreen();
            Assert.Equal(RedOf(lightSeaGreenColor), 32);
            Assert.Equal(GreenOf(lightSeaGreenColor), 178);
            Assert.Equal(BlueOf(lightSeaGreenColor), 170);
            Assert.Equal(AlphaOf(lightSeaGreenColor), 255);
        }
        [Fact]
        public void TestColorLightSkyBlueIntegration()
        {
            var lightSkyBlueColor = ColorLightSkyBlue();
            Assert.Equal(RedOf(lightSkyBlueColor), 135);
            Assert.Equal(GreenOf(lightSkyBlueColor), 206);
            Assert.Equal(BlueOf(lightSkyBlueColor), 250);
            Assert.Equal(AlphaOf(lightSkyBlueColor), 255);
        }
        [Fact]
        public void TestColorLightSlateGrayIntegration()
        {
            var lightSlateGrayColor = ColorLightSlateGray();
            Assert.Equal(RedOf(lightSlateGrayColor), 119);
            Assert.Equal(GreenOf(lightSlateGrayColor), 136);
            Assert.Equal(BlueOf(lightSlateGrayColor), 153);
            Assert.Equal(AlphaOf(lightSlateGrayColor), 255);
        }
        [Fact]
        public void TestColorLightSteelBlueIntegration()
        {
            var lightSteelBlueColor = ColorLightSteelBlue();
            Assert.Equal(RedOf(lightSteelBlueColor), 176);
            Assert.Equal(GreenOf(lightSteelBlueColor), 196);
            Assert.Equal(BlueOf(lightSteelBlueColor), 222);
            Assert.Equal(AlphaOf(lightSteelBlueColor), 255);
        }
        [Fact]
        public void TestColorLightYellowIntegration()
        {
            var lightYellowColor = ColorLightYellow();
            Assert.Equal(RedOf(lightYellowColor), 255);
            Assert.Equal(GreenOf(lightYellowColor), 255);
            Assert.Equal(BlueOf(lightYellowColor), 224);
            Assert.Equal(AlphaOf(lightYellowColor), 255);
        }
        [Fact]
        public void TestColorLimeIntegration()
        {
            var limeColor = ColorLime();
            Assert.Equal(RedOf(limeColor), 0);
            Assert.Equal(GreenOf(limeColor), 255);
            Assert.Equal(BlueOf(limeColor), 0);
            Assert.Equal(AlphaOf(limeColor), 255);
        }
        [Fact]
        public void TestColorLimeGreenIntegration()
        {
            var limeGreenColor = ColorLimeGreen();
            Assert.Equal(RedOf(limeGreenColor), 50);
            Assert.Equal(GreenOf(limeGreenColor), 205);
            Assert.Equal(BlueOf(limeGreenColor), 50);
            Assert.Equal(AlphaOf(limeGreenColor), 255);
        }
        [Fact]
        public void TestColorLinenIntegration()
        {
            var linenColor = ColorLinen();
            Assert.Equal(RedOf(linenColor), 250);
            Assert.Equal(GreenOf(linenColor), 240);
            Assert.Equal(BlueOf(linenColor), 230);
            Assert.Equal(AlphaOf(linenColor), 255);
        }
        [Fact]
        public void TestColorMagentaIntegration()
        {
            var magentaColor = ColorMagenta();
            Assert.Equal(RedOf(magentaColor), 255);
            Assert.Equal(GreenOf(magentaColor), 0);
            Assert.Equal(BlueOf(magentaColor), 255);
            Assert.Equal(AlphaOf(magentaColor), 255);
        }
        [Fact]
        public void TestColorMaroonIntegration()
        {
            var maroonColor = ColorMaroon();
            Assert.Equal(RedOf(maroonColor), 127);
            Assert.Equal(GreenOf(maroonColor), 0);
            Assert.Equal(BlueOf(maroonColor), 0);
            Assert.Equal(AlphaOf(maroonColor), 255);
        }
        [Fact]
        public void TestColorMediumAquamarineIntegration()
        {
            var mediumAquamarineColor = ColorMediumAquamarine();
            Assert.Equal(RedOf(mediumAquamarineColor), 102);
            Assert.Equal(GreenOf(mediumAquamarineColor), 205);
            Assert.Equal(BlueOf(mediumAquamarineColor), 170);
            Assert.Equal(AlphaOf(mediumAquamarineColor), 255);
        }
        [Fact]
        public void TestColorMediumBlueIntegration()
        {
            var mediumBlueColor = ColorMediumBlue();
            Assert.Equal(RedOf(mediumBlueColor), 0);
            Assert.Equal(GreenOf(mediumBlueColor), 0);
            Assert.Equal(BlueOf(mediumBlueColor), 205);
            Assert.Equal(AlphaOf(mediumBlueColor), 255);
        }
        [Fact]
        public void TestColorMediumOrchidIntegration()
        {
            var mediumOrchidColor = ColorMediumOrchid();
            Assert.Equal(RedOf(mediumOrchidColor), 186);
            Assert.Equal(GreenOf(mediumOrchidColor), 85);
            Assert.Equal(BlueOf(mediumOrchidColor), 211);
            Assert.Equal(AlphaOf(mediumOrchidColor), 255);
        }
        [Fact]
        public void TestColorMediumPurpleIntegration()
        {
            var mediumPurpleColor = ColorMediumPurple();
            Assert.Equal(RedOf(mediumPurpleColor), 147);
            Assert.Equal(GreenOf(mediumPurpleColor), 112);
            Assert.Equal(BlueOf(mediumPurpleColor), 219);
            Assert.Equal(AlphaOf(mediumPurpleColor), 255);
        }
        [Fact]
        public void TestColorMediumSeaGreenIntegration()
        {
            var mediumSeaGreenColor = ColorMediumSeaGreen();
            Assert.Equal(RedOf(mediumSeaGreenColor), 60);
            Assert.Equal(GreenOf(mediumSeaGreenColor), 179);
            Assert.Equal(BlueOf(mediumSeaGreenColor), 113);
            Assert.Equal(AlphaOf(mediumSeaGreenColor), 255);
        }
        [Fact]
        public void TestColorMediumSlateBlueIntegration()
        {
            var mediumSlateBlueColor = ColorMediumSlateBlue();
            Assert.Equal(RedOf(mediumSlateBlueColor), 123);
            Assert.Equal(GreenOf(mediumSlateBlueColor), 104);
            Assert.Equal(BlueOf(mediumSlateBlueColor), 238);
            Assert.Equal(AlphaOf(mediumSlateBlueColor), 255);
        }
        [Fact]
        public void TestColorMediumSpringGreenIntegration()
        {
            var mediumSpringGreenColor = ColorMediumSpringGreen();
            Assert.Equal(RedOf(mediumSpringGreenColor), 0);
            Assert.Equal(GreenOf(mediumSpringGreenColor), 250);
            Assert.Equal(BlueOf(mediumSpringGreenColor), 154);
            Assert.Equal(AlphaOf(mediumSpringGreenColor), 255);
        }
        [Fact]
        public void TestColorMediumTurquoiseIntegration()
        {
            var mediumTurquoiseColor = ColorMediumTurquoise();
            Assert.Equal(RedOf(mediumTurquoiseColor), 72);
            Assert.Equal(GreenOf(mediumTurquoiseColor), 209);
            Assert.Equal(BlueOf(mediumTurquoiseColor), 204);
            Assert.Equal(AlphaOf(mediumTurquoiseColor), 255);
        }
        [Fact]
        public void TestColorMediumVioletRedIntegration()
        {
            var mediumVioletRedColor = ColorMediumVioletRed();
            Assert.Equal(RedOf(mediumVioletRedColor), 199);
            Assert.Equal(GreenOf(mediumVioletRedColor), 21);
            Assert.Equal(BlueOf(mediumVioletRedColor), 133);
            Assert.Equal(AlphaOf(mediumVioletRedColor), 255);
        }
        [Fact]
        public void TestColorMidnightBlueIntegration()
        {
            var midnightBlueColor = ColorMidnightBlue();
            Assert.Equal(RedOf(midnightBlueColor), 25);
            Assert.Equal(GreenOf(midnightBlueColor), 25);
            Assert.Equal(BlueOf(midnightBlueColor), 112);
            Assert.Equal(AlphaOf(midnightBlueColor), 255);
        }
        [Fact]
        public void TestColorMintCreamIntegration()
        {
            var mintCreamColor = ColorMintCream();
            Assert.Equal(RedOf(mintCreamColor), 245);
            Assert.Equal(GreenOf(mintCreamColor), 255);
            Assert.Equal(BlueOf(mintCreamColor), 250);
            Assert.Equal(AlphaOf(mintCreamColor), 255);
        }
        [Fact]
        public void TestColorMistyRoseIntegration()
        {
            var mistyRoseColor = ColorMistyRose();
            Assert.Equal(RedOf(mistyRoseColor), 255);
            Assert.Equal(GreenOf(mistyRoseColor), 228);
            Assert.Equal(BlueOf(mistyRoseColor), 225);
            Assert.Equal(AlphaOf(mistyRoseColor), 255);
        }
        [Fact]
        public void TestColorMoccasinIntegration()
        {
            var moccasinColor = ColorMoccasin();
            Assert.Equal(RedOf(moccasinColor), 255);
            Assert.Equal(GreenOf(moccasinColor), 228);
            Assert.Equal(BlueOf(moccasinColor), 181);
            Assert.Equal(AlphaOf(moccasinColor), 255);
        }
        [Fact]
        public void TestColorNavajoWhiteIntegration()
        {
            var navajoWhiteColor = ColorNavajoWhite();
            Assert.Equal(RedOf(navajoWhiteColor), 255);
            Assert.Equal(GreenOf(navajoWhiteColor), 222);
            Assert.Equal(BlueOf(navajoWhiteColor), 173);
            Assert.Equal(AlphaOf(navajoWhiteColor), 255);
        }
        [Fact]
        public void TestColorNavyIntegration()
        {
            var navyColor = ColorNavy();
            Assert.Equal(RedOf(navyColor), 0);
            Assert.Equal(GreenOf(navyColor), 0);
            Assert.Equal(BlueOf(navyColor), 127);
            Assert.Equal(AlphaOf(navyColor), 255);
        }
        [Fact]
        public void TestColorOldLaceIntegration()
        {
            var oldLaceColor = ColorOldLace();
            Assert.Equal(RedOf(oldLaceColor), 253);
            Assert.Equal(GreenOf(oldLaceColor), 245);
            Assert.Equal(BlueOf(oldLaceColor), 230);
            Assert.Equal(AlphaOf(oldLaceColor), 255);
        }
        [Fact]
        public void TestColorOliveIntegration()
        {
            var oliveColor = ColorOlive();
            Assert.Equal(RedOf(oliveColor), 127);
            Assert.Equal(GreenOf(oliveColor), 127);
            Assert.Equal(BlueOf(oliveColor), 0);
            Assert.Equal(AlphaOf(oliveColor), 255);
        }
        [Fact]
        public void TestColorOliveDrabIntegration()
        {
            var oliveDrabColor = ColorOliveDrab();
            Assert.Equal(RedOf(oliveDrabColor), 107);
            Assert.Equal(GreenOf(oliveDrabColor), 142);
            Assert.Equal(BlueOf(oliveDrabColor), 35);
            Assert.Equal(AlphaOf(oliveDrabColor), 255);
        }
        [Fact]
        public void TestColorOrangeIntegration()
        {
            var orangeColor = ColorOrange();
            Assert.Equal(RedOf(orangeColor), 255);
            Assert.Equal(GreenOf(orangeColor), 165);
            Assert.Equal(BlueOf(orangeColor), 0);
            Assert.Equal(AlphaOf(orangeColor), 255);
        }
        [Fact]
        public void TestColorOrangeRedIntegration()
        {
            var orangeRedColor = ColorOrangeRed();
            Assert.Equal(RedOf(orangeRedColor), 255);
            Assert.Equal(GreenOf(orangeRedColor), 69);
            Assert.Equal(BlueOf(orangeRedColor), 0);
            Assert.Equal(AlphaOf(orangeRedColor), 255);
        }
        [Fact]
        public void TestColorOrchidIntegration()
        {
            var orchidColor = ColorOrchid();
            Assert.Equal(RedOf(orchidColor), 218);
            Assert.Equal(GreenOf(orchidColor), 112);
            Assert.Equal(BlueOf(orchidColor), 214);
            Assert.Equal(AlphaOf(orchidColor), 255);
        }
        [Fact]
        public void TestColorPaleGoldenrodIntegration()
        {
            var paleGoldenrodColor = ColorPaleGoldenrod();
            Assert.Equal(RedOf(paleGoldenrodColor), 238);
            Assert.Equal(GreenOf(paleGoldenrodColor), 232);
            Assert.Equal(BlueOf(paleGoldenrodColor), 170);
            Assert.Equal(AlphaOf(paleGoldenrodColor), 255);
        }
        [Fact]
        public void TestColorPaleGreenIntegration()
        {
            var paleGreenColor = ColorPaleGreen();
            Assert.Equal(RedOf(paleGreenColor), 152);
            Assert.Equal(GreenOf(paleGreenColor), 251);
            Assert.Equal(BlueOf(paleGreenColor), 152);
            Assert.Equal(AlphaOf(paleGreenColor), 255);
        }
        [Fact]
        public void TestColorPaleTurquoiseIntegration()
        {
            var paleTurquoiseColor = ColorPaleTurquoise();
            Assert.Equal(RedOf(paleTurquoiseColor), 175);
            Assert.Equal(GreenOf(paleTurquoiseColor), 238);
            Assert.Equal(BlueOf(paleTurquoiseColor), 238);
            Assert.Equal(AlphaOf(paleTurquoiseColor), 255);
        }
        [Fact]
        public void TestColorPaleVioletRedIntegration()
        {
            var paleVioletRedColor = ColorPaleVioletRed();
            Assert.Equal(RedOf(paleVioletRedColor), 219);
            Assert.Equal(GreenOf(paleVioletRedColor), 112);
            Assert.Equal(BlueOf(paleVioletRedColor), 147);
            Assert.Equal(AlphaOf(paleVioletRedColor), 255);
        }
        [Fact]
        public void TestColorPapayaWhipIntegration()
        {
            var papayaWhipColor = ColorPapayaWhip();
            Assert.Equal(RedOf(papayaWhipColor), 255);
            Assert.Equal(GreenOf(papayaWhipColor), 239);
            Assert.Equal(BlueOf(papayaWhipColor), 213);
            Assert.Equal(AlphaOf(papayaWhipColor), 255);
        }
        [Fact]
        public void TestColorPeachPuffIntegration()
        {
            var peachPuffColor = ColorPeachPuff();
            Assert.Equal(RedOf(peachPuffColor), 255);
            Assert.Equal(GreenOf(peachPuffColor), 218);
            Assert.Equal(BlueOf(peachPuffColor), 185);
            Assert.Equal(AlphaOf(peachPuffColor), 255);
        }
        [Fact]
        public void TestColorPeruIntegration()
        {
            var peruColor = ColorPeru();
            Assert.Equal(RedOf(peruColor), 205);
            Assert.Equal(GreenOf(peruColor), 133);
            Assert.Equal(BlueOf(peruColor), 63);
            Assert.Equal(AlphaOf(peruColor), 255);
        }
        [Fact]
        public void TestColorPinkIntegration()
        {
            var pinkColor = ColorPink();
            Assert.Equal(RedOf(pinkColor), 255);
            Assert.Equal(GreenOf(pinkColor), 192);
            Assert.Equal(BlueOf(pinkColor), 203);
            Assert.Equal(AlphaOf(pinkColor), 255);
        }
        [Fact]
        public void TestColorPlumIntegration()
        {
            var plumColor = ColorPlum();
            Assert.Equal(RedOf(plumColor), 221);
            Assert.Equal(GreenOf(plumColor), 160);
            Assert.Equal(BlueOf(plumColor), 221);
            Assert.Equal(AlphaOf(plumColor), 255);
        }
        [Fact]
        public void TestColorPowderBlueIntegration()
        {
            var powderBlueColor = ColorPowderBlue();
            Assert.Equal(RedOf(powderBlueColor), 176);
            Assert.Equal(GreenOf(powderBlueColor), 224);
            Assert.Equal(BlueOf(powderBlueColor), 230);
            Assert.Equal(AlphaOf(powderBlueColor), 255);
        }
        [Fact]
        public void TestColorPurpleIntegration()
        {
            var purpleColor = ColorPurple();
            Assert.Equal(RedOf(purpleColor), 127);
            Assert.Equal(GreenOf(purpleColor), 0);
            Assert.Equal(BlueOf(purpleColor), 127);
            Assert.Equal(AlphaOf(purpleColor), 255);
        }
        [Fact]
        public void TestColorRedIntegration()
        {
            var redColor = ColorRed();
            Assert.Equal(RedOf(redColor), 255);
            Assert.Equal(GreenOf(redColor), 0);
            Assert.Equal(BlueOf(redColor), 0);
            Assert.Equal(AlphaOf(redColor), 255);
        }
        [Fact]
        public void TestColorRosyBrownIntegration()
        {
            var rosyBrownColor = ColorRosyBrown();
            Assert.Equal(RedOf(rosyBrownColor), 188);
            Assert.Equal(GreenOf(rosyBrownColor), 143);
            Assert.Equal(BlueOf(rosyBrownColor), 143);
            Assert.Equal(AlphaOf(rosyBrownColor), 255);
        }
        [Fact]
        public void TestColorRoyalBlueIntegration()
        {
            var royalBlueColor = ColorRoyalBlue();
            Assert.Equal(RedOf(royalBlueColor), 65);
            Assert.Equal(GreenOf(royalBlueColor), 105);
            Assert.Equal(BlueOf(royalBlueColor), 225);
            Assert.Equal(AlphaOf(royalBlueColor), 255);
        }
        [Fact]
        public void TestColorSaddleBrownIntegration()
        {
            var saddleBrownColor = ColorSaddleBrown();
            Assert.Equal(RedOf(saddleBrownColor), 139);
            Assert.Equal(GreenOf(saddleBrownColor), 69);
            Assert.Equal(BlueOf(saddleBrownColor), 19);
            Assert.Equal(AlphaOf(saddleBrownColor), 255);
        }
        [Fact]
        public void TestColorSalmonIntegration()
        {
            var salmonColor = ColorSalmon();
            Assert.Equal(RedOf(salmonColor), 250);
            Assert.Equal(GreenOf(salmonColor), 127);
            Assert.Equal(BlueOf(salmonColor), 114);
            Assert.Equal(AlphaOf(salmonColor), 255);
        }
        [Fact]
        public void TestColorSandyBrownIntegration()
        {
            var sandyBrownColor = ColorSandyBrown();
            Assert.Equal(RedOf(sandyBrownColor), 244);
            Assert.Equal(GreenOf(sandyBrownColor), 164);
            Assert.Equal(BlueOf(sandyBrownColor), 96);
            Assert.Equal(AlphaOf(sandyBrownColor), 255);
        }
        [Fact]
        public void TestColorSeaGreenIntegration()
        {
            var seaGreenColor = ColorSeaGreen();
            Assert.Equal(RedOf(seaGreenColor), 46);
            Assert.Equal(GreenOf(seaGreenColor), 139);
            Assert.Equal(BlueOf(seaGreenColor), 87);
            Assert.Equal(AlphaOf(seaGreenColor), 255);
        }
        [Fact]
        public void TestColorSeaShellIntegration()
        {
            var seaShellColor = ColorSeaShell();
            Assert.Equal(RedOf(seaShellColor), 255);
            Assert.Equal(GreenOf(seaShellColor), 245);
            Assert.Equal(BlueOf(seaShellColor), 238);
            Assert.Equal(AlphaOf(seaShellColor), 255);
        }
        [Fact]
        public void TestColorSiennaIntegration()
        {
            var siennaColor = ColorSienna();
            Assert.Equal(RedOf(siennaColor), 160);
            Assert.Equal(GreenOf(siennaColor), 82);
            Assert.Equal(BlueOf(siennaColor), 45);
            Assert.Equal(AlphaOf(siennaColor), 255);
        }
        [Fact]
        public void TestColorSilverIntegration()
        {
            var silverColor = ColorSilver();
            Assert.Equal(RedOf(silverColor), 192);
            Assert.Equal(GreenOf(silverColor), 192);
            Assert.Equal(BlueOf(silverColor), 192);
            Assert.Equal(AlphaOf(silverColor), 255);
        }
        [Fact]
        public void TestColorSkyBlueIntegration()
        {
            var skyBlueColor = ColorSkyBlue();
            Assert.Equal(RedOf(skyBlueColor), 135);
            Assert.Equal(GreenOf(skyBlueColor), 206);
            Assert.Equal(BlueOf(skyBlueColor), 235);
            Assert.Equal(AlphaOf(skyBlueColor), 255);
        }
        [Fact]
        public void TestColorSlateBlueIntegration()
        {
            var slateBlueColor = ColorSlateBlue();
            Assert.Equal(RedOf(slateBlueColor), 106);
            Assert.Equal(GreenOf(slateBlueColor), 90);
            Assert.Equal(BlueOf(slateBlueColor), 205);
            Assert.Equal(AlphaOf(slateBlueColor), 255);
        }
        [Fact]
        public void TestColorSlateGrayIntegration()
        {
            var slateGrayColor = ColorSlateGray();
            Assert.Equal(RedOf(slateGrayColor), 112);
            Assert.Equal(GreenOf(slateGrayColor), 127);
            Assert.Equal(BlueOf(slateGrayColor), 144);
            Assert.Equal(AlphaOf(slateGrayColor), 255);
        }
        [Fact]
        public void TestColorSnowIntegration()
        {
            var snowColor = ColorSnow();
            Assert.Equal(RedOf(snowColor), 255);
            Assert.Equal(GreenOf(snowColor), 250);
            Assert.Equal(BlueOf(snowColor), 250);
            Assert.Equal(AlphaOf(snowColor), 255);
        }
        [Fact]
        public void TestColorSpringGreenIntegration()
        {
            var springGreenColor = ColorSpringGreen();
            Assert.Equal(RedOf(springGreenColor), 0);
            Assert.Equal(GreenOf(springGreenColor), 255);
            Assert.Equal(BlueOf(springGreenColor), 127);
            Assert.Equal(AlphaOf(springGreenColor), 255);
        }
        [Fact]
        public void TestColorSteelBlueIntegration()
        {
            var steelBlueColor = ColorSteelBlue();
            Assert.Equal(RedOf(steelBlueColor), 70);
            Assert.Equal(GreenOf(steelBlueColor), 130);
            Assert.Equal(BlueOf(steelBlueColor), 180);
            Assert.Equal(AlphaOf(steelBlueColor), 255);
        }
        [Fact]
        public void TestColorSwinburneRedIntegration()
        {
            var swinburneRedColor = ColorSwinburneRed();
            Assert.Equal(RedOf(swinburneRedColor), 237);
            Assert.Equal(GreenOf(swinburneRedColor), 36);
            Assert.Equal(BlueOf(swinburneRedColor), 25);
            Assert.Equal(AlphaOf(swinburneRedColor), 255);
        }
        [Fact]
        public void TestColorTanIntegration()
        {
            var tanColor = ColorTan();
            Assert.Equal(RedOf(tanColor), 210);
            Assert.Equal(GreenOf(tanColor), 180);
            Assert.Equal(BlueOf(tanColor), 140);
            Assert.Equal(AlphaOf(tanColor), 255);
        }
        [Fact]
        public void TestColorTealIntegration()
        {
            var tealColor = ColorTeal();
            Assert.Equal(RedOf(tealColor), 0);
            Assert.Equal(GreenOf(tealColor), 127);
            Assert.Equal(BlueOf(tealColor), 127);
            Assert.Equal(AlphaOf(tealColor), 255);
        }
        [Fact]
        public void TestColorThistleIntegration()
        {
            var thistleColor = ColorThistle();
            Assert.Equal(RedOf(thistleColor), 216);
            Assert.Equal(GreenOf(thistleColor), 191);
            Assert.Equal(BlueOf(thistleColor), 216);
            Assert.Equal(AlphaOf(thistleColor), 255);
        }
        [Fact]
        public void TestColorToStringIntegration()
        {
            var redColor = ColorRed();
            var redColorString = ColorToString(redColor);
            Assert.Equal(redColorString, "#ff0000ff");
            var transparentColor = ColorTransparent();
            var transparentColorString = ColorToString(transparentColor);
            Assert.Equal(transparentColorString, "#ffffffff");
        }
        [Fact]
        public void TestColorTomatoIntegration()
        {
            var tomatoColor = ColorTomato();
            Assert.Equal(RedOf(tomatoColor), 255);
            Assert.Equal(GreenOf(tomatoColor), 99);
            Assert.Equal(BlueOf(tomatoColor), 71);
            Assert.Equal(AlphaOf(tomatoColor), 255);
        }
        [Fact]
        public void TestColorTransparentIntegration()
        {
            var transparentColor = ColorTransparent();
            Assert.Equal(AlphaOf(transparentColor), 255);
            Assert.Equal(RedOf(transparentColor), 255);
            Assert.Equal(GreenOf(transparentColor), 255);
            Assert.Equal(BlueOf(transparentColor), 255);
        }
        [Fact]
        public void TestColorTurquoiseIntegration()
        {
            var turquoiseColor = ColorTurquoise();
            Assert.Equal(RedOf(turquoiseColor), 64);
            Assert.Equal(GreenOf(turquoiseColor), 224);
            Assert.Equal(BlueOf(turquoiseColor), 208);
            Assert.Equal(AlphaOf(turquoiseColor), 255);
        }
        [Fact]
        public void TestColorVioletIntegration()
        {
            var violetColor = ColorViolet();
            Assert.Equal(RedOf(violetColor), 238);
            Assert.Equal(GreenOf(violetColor), 130);
            Assert.Equal(BlueOf(violetColor), 238);
            Assert.Equal(AlphaOf(violetColor), 255);
        }
        [Fact]
        public void TestColorWheatIntegration()
        {
            var wheatColor = ColorWheat();
            Assert.Equal(RedOf(wheatColor), 245);
            Assert.Equal(GreenOf(wheatColor), 222);
            Assert.Equal(BlueOf(wheatColor), 179);
            Assert.Equal(AlphaOf(wheatColor), 255);
        }
        [Fact]
        public void TestColorWhiteIntegration()
        {
            var whiteColor = ColorWhite();
            Assert.Equal(RedOf(whiteColor), 255);
            Assert.Equal(GreenOf(whiteColor), 255);
            Assert.Equal(BlueOf(whiteColor), 255);
            Assert.Equal(AlphaOf(whiteColor), 255);
        }
        [Fact]
        public void TestColorWhiteSmokeIntegration()
        {
            var whiteSmokeColor = ColorWhiteSmoke();
            Assert.Equal(RedOf(whiteSmokeColor), 245);
            Assert.Equal(GreenOf(whiteSmokeColor), 245);
            Assert.Equal(BlueOf(whiteSmokeColor), 245);
            Assert.Equal(AlphaOf(whiteSmokeColor), 255);
        }
        [Fact]
        public void TestColorYellowIntegration()
        {
            var yellowColor = ColorYellow();
            Assert.Equal(RedOf(yellowColor), 255);
            Assert.Equal(GreenOf(yellowColor), 255);
            Assert.Equal(BlueOf(yellowColor), 0);
            Assert.Equal(AlphaOf(yellowColor), 255);
        }
        [Fact]
        public void TestColorYellowGreenIntegration()
        {
            var yellowGreenColor = ColorYellowGreen();
            Assert.Equal(RedOf(yellowGreenColor), 154);
            Assert.Equal(GreenOf(yellowGreenColor), 205);
            Assert.Equal(BlueOf(yellowGreenColor), 50);
            Assert.Equal(AlphaOf(yellowGreenColor), 255);
        }
        [Fact]
        public void TestGreenOfIntegration()
        {
            var greenColor = ColorGreen();
            var greenValue = GreenOf(greenColor);
            Assert.Equal(greenValue, 127);
            var blackColor = ColorBlack();
            var blackGreenValue = GreenOf(blackColor);
            Assert.Equal(blackGreenValue, 0);
        }
        [Fact]
        public void TestHSBColorIntegration()
        {
            var redColor = HSBColor(0.0, 1.0, 1.0);
            Assert.Equal(HueOf(redColor), 0.0);
            Assert.Equal(SaturationOf(redColor), 1.0);
            Assert.Equal(BrightnessOf(redColor), 1.0);
            var grayColor = HSBColor(0.5, 0.0, 0.5);
            Assert.Equal(SaturationOf(grayColor), 0.0);
        }
        [Fact]
        public void TestHueOfIntegration()
        {
            var redColor = ColorRed();
            var hueValue = HueOf(redColor);
            Assert.Equal(hueValue, 0.0);
            var blueColor = ColorBlue();
            var hueValueBlue = HueOf(blueColor);
            Assert.Equal(hueValueBlue, 0.6666666666666666);
        }
        [Fact]
        public void TestRandomColorIntegration()
        {
            var randomColorResult = RandomColor();
            Assert.NotEqual(ColorToString(randomColorResult), "#000000FF");
            Assert.InRange(AlphaOf(randomColorResult), 0, 255);
        }
        [Fact]
        public void TestRandomRGBColorIntegration()
        {
            var randomColor = RandomRGBColor(255);
            Assert.InRange(RedOf(randomColor), 0, 255);
            Assert.InRange(GreenOf(randomColor), 0, 255);
            Assert.InRange(BlueOf(randomColor), 0, 255);
            Assert.Equal(AlphaOf(randomColor), 255);
        }
        [Fact]
        public void TestRedOfIntegration()
        {
            var redColor = ColorRed();
            var redValue = RedOf(redColor);
            Assert.Equal(redValue, 255);
            var blueColor = ColorBlue();
            var blueRedValue = RedOf(blueColor);
            Assert.Equal(blueRedValue, 0);
        }
        [Fact]
        public void TestRGBColorFromDoubleIntegration()
        {
            var redColor = RGBColor(1.0, 0.0, 0.0);
            Assert.Equal(RedOf(redColor), 255);
            Assert.Equal(GreenOf(redColor), 0);
            Assert.Equal(BlueOf(redColor), 0);
            var greenColor = RGBColor(0.0, 1.0, 0.0);
            Assert.Equal(RedOf(greenColor), 0);
            Assert.Equal(GreenOf(greenColor), 255);
            Assert.Equal(BlueOf(greenColor), 0);
        }
        [Fact]
        public void TestRGBColorIntegration()
        {
            var redColor = RGBColor(255, 0, 0);
            Assert.Equal(RedOf(redColor), 255);
            Assert.Equal(GreenOf(redColor), 0);
            Assert.Equal(BlueOf(redColor), 0);
            Assert.Equal(AlphaOf(redColor), 255);
        }
        [Fact]
        public void TestRGBAColorFromDoubleIntegration()
        {
            var testColor = RGBAColor(1.0, 0.5, 0.0, 0.75);
            Assert.Equal(RedOf(testColor), 255);
            Assert.Equal(GreenOf(testColor), 127);
            Assert.Equal(BlueOf(testColor), 0);
            Assert.Equal(AlphaOf(testColor), 191);
        }
        [Fact]
        public void TestRGBAColorIntegration()
        {
            var redColor = RGBAColor(255, 0, 0, 255);
            Assert.Equal(RedOf(redColor), 255);
            Assert.Equal(GreenOf(redColor), 0);
            Assert.Equal(BlueOf(redColor), 0);
            Assert.Equal(AlphaOf(redColor), 255);
        }
        [Fact]
        public void TestSaturationOfIntegration()
        {
            var redColor = ColorRed();
            var saturationValue = SaturationOf(redColor);
            Assert.Equal(saturationValue, 1.0);
            var grayColor = ColorGray();
            var saturationValueGray = SaturationOf(grayColor);
            Assert.Equal(saturationValueGray, 0.0);
        }
        [Fact]
        public void TestStringToColorIntegration()
        {
            var redColor = StringToColor("#FF0000FF");
            Assert.Equal(RedOf(redColor), 255);
            Assert.Equal(GreenOf(redColor), 0);
            Assert.Equal(BlueOf(redColor), 0);
            Assert.Equal(AlphaOf(redColor), 255);
            var greenColor = StringToColor("#00FF00FF");
            Assert.Equal(RedOf(greenColor), 0);
            Assert.Equal(GreenOf(greenColor), 255);
            Assert.Equal(BlueOf(greenColor), 0);
            Assert.Equal(AlphaOf(greenColor), 255);
        }
    }
}
