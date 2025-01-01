using Xunit;
using SplashKitSDK;
using static SplashKitSDK.SplashKit;
using HttpMethod = SplashKitSDK.HttpMethod;
namespace SplashKitTests
{
    public class TestColor
    {
        [Fact]
        public void TestAlphaOfIntegration() {
            var redColor = ColorRed();
            var alphaValue = AlphaOf(redColor);
            Assert.Equal(255, alphaValue);
            var transparentColor = ColorTransparent();
            var alphaValueTransparent = AlphaOf(transparentColor);
            Assert.Equal(255, alphaValueTransparent);
        }
        [Fact]
        public void TestBlueOfIntegration() {
            var blueColor = ColorBlue();
            var blueValue = BlueOf(blueColor);
            Assert.Equal(255, blueValue);
            var redColor = ColorRed();
            var blueValueRed = BlueOf(redColor);
            Assert.Equal(0, blueValueRed);
        }
        [Fact]
        public void TestBrightnessOfIntegration() {
            var whiteColor = ColorWhite();
            var whiteBrightness = BrightnessOf(whiteColor);
            Assert.Equal(1.0, whiteBrightness);
            var blackColor = ColorBlack();
            var blackBrightness = BrightnessOf(blackColor);
            Assert.Equal(0.0, blackBrightness);
            var grayColor = ColorGray();
            var grayBrightness = BrightnessOf(grayColor);
            Assert.InRange(grayBrightness, 0.4, 0.6);
        }
        [Fact]
        public void TestColorAliceBlueIntegration() {
            var aliceBlueColor = ColorAliceBlue();
            Assert.Equal(240, RedOf(aliceBlueColor));
            Assert.Equal(248, GreenOf(aliceBlueColor));
            Assert.Equal(255, BlueOf(aliceBlueColor));
            Assert.Equal(255, AlphaOf(aliceBlueColor));
        }
        [Fact]
        public void TestColorAntiqueWhiteIntegration() {
            var antiqueWhiteColor = ColorAntiqueWhite();
            Assert.Equal(250, RedOf(antiqueWhiteColor));
            Assert.Equal(235, GreenOf(antiqueWhiteColor));
            Assert.Equal(215, BlueOf(antiqueWhiteColor));
            Assert.Equal(255, AlphaOf(antiqueWhiteColor));
        }
        [Fact]
        public void TestColorAquaIntegration() {
            var aquaColor = ColorAqua();
            Assert.Equal(0, RedOf(aquaColor));
            Assert.Equal(255, GreenOf(aquaColor));
            Assert.Equal(255, BlueOf(aquaColor));
            Assert.Equal(255, AlphaOf(aquaColor));
        }
        [Fact]
        public void TestColorAquamarineIntegration() {
            var aquamarineColor = ColorAquamarine();
            Assert.Equal(127, RedOf(aquamarineColor));
            Assert.Equal(255, GreenOf(aquamarineColor));
            Assert.Equal(212, BlueOf(aquamarineColor));
            Assert.Equal(255, AlphaOf(aquamarineColor));
        }
        [Fact]
        public void TestColorAzureIntegration() {
            var azureColor = ColorAzure();
            Assert.Equal(240, RedOf(azureColor));
            Assert.Equal(255, GreenOf(azureColor));
            Assert.Equal(255, BlueOf(azureColor));
            Assert.Equal(255, AlphaOf(azureColor));
        }
        [Fact]
        public void TestColorBeigeIntegration() {
            var beigeColor = ColorBeige();
            Assert.Equal(245, RedOf(beigeColor));
            Assert.Equal(245, GreenOf(beigeColor));
            Assert.Equal(220, BlueOf(beigeColor));
            Assert.Equal(255, AlphaOf(beigeColor));
        }
        [Fact]
        public void TestColorBisqueIntegration() {
            var bisqueColor = ColorBisque();
            Assert.Equal(255, RedOf(bisqueColor));
            Assert.Equal(228, GreenOf(bisqueColor));
            Assert.Equal(196, BlueOf(bisqueColor));
            Assert.Equal(255, AlphaOf(bisqueColor));
        }
        [Fact]
        public void TestColorBlackIntegration() {
            var blackColor = ColorBlack();
            Assert.Equal(0, RedOf(blackColor));
            Assert.Equal(0, GreenOf(blackColor));
            Assert.Equal(0, BlueOf(blackColor));
            Assert.Equal(255, AlphaOf(blackColor));
        }
        [Fact]
        public void TestColorBlanchedAlmondIntegration() {
            var blanchedAlmondColor = ColorBlanchedAlmond();
            Assert.Equal(255, RedOf(blanchedAlmondColor));
            Assert.Equal(235, GreenOf(blanchedAlmondColor));
            Assert.Equal(205, BlueOf(blanchedAlmondColor));
            Assert.Equal(255, AlphaOf(blanchedAlmondColor));
        }
        [Fact]
        public void TestColorBlueIntegration() {
            var blueColor = ColorBlue();
            Assert.Equal(0, RedOf(blueColor));
            Assert.Equal(0, GreenOf(blueColor));
            Assert.Equal(255, BlueOf(blueColor));
            Assert.Equal(255, AlphaOf(blueColor));
        }
        [Fact]
        public void TestColorBlueVioletIntegration() {
            var blueVioletColor = ColorBlueViolet();
            Assert.Equal(138, RedOf(blueVioletColor));
            Assert.Equal(43, GreenOf(blueVioletColor));
            Assert.Equal(226, BlueOf(blueVioletColor));
            Assert.Equal(255, AlphaOf(blueVioletColor));
        }
        [Fact]
        public void TestColorBrightGreenIntegration() {
            var brightGreenColor = ColorBrightGreen();
            Assert.Equal(0, RedOf(brightGreenColor));
            Assert.Equal(255, GreenOf(brightGreenColor));
            Assert.Equal(0, BlueOf(brightGreenColor));
            Assert.Equal(255, AlphaOf(brightGreenColor));
        }
        [Fact]
        public void TestColorBrownIntegration() {
            var brownColor = ColorBrown();
            Assert.Equal(165, RedOf(brownColor));
            Assert.Equal(42, GreenOf(brownColor));
            Assert.Equal(42, BlueOf(brownColor));
            Assert.Equal(255, AlphaOf(brownColor));
        }
        [Fact]
        public void TestColorBurlyWoodIntegration() {
            var burlyWoodColor = ColorBurlyWood();
            Assert.Equal(222, RedOf(burlyWoodColor));
            Assert.Equal(184, GreenOf(burlyWoodColor));
            Assert.Equal(135, BlueOf(burlyWoodColor));
            Assert.Equal(255, AlphaOf(burlyWoodColor));
        }
        [Fact]
        public void TestColorCadetBlueIntegration() {
            var cadetBlueColor = ColorCadetBlue();
            Assert.Equal(95, RedOf(cadetBlueColor));
            Assert.Equal(158, GreenOf(cadetBlueColor));
            Assert.Equal(160, BlueOf(cadetBlueColor));
            Assert.Equal(255, AlphaOf(cadetBlueColor));
        }
        [Fact]
        public void TestColorChartreuseIntegration() {
            var chartreuseColor = ColorChartreuse();
            Assert.Equal(127, RedOf(chartreuseColor));
            Assert.Equal(255, GreenOf(chartreuseColor));
            Assert.Equal(0, BlueOf(chartreuseColor));
            Assert.Equal(255, AlphaOf(chartreuseColor));
        }
        [Fact]
        public void TestColorChocolateIntegration() {
            var chocolateColor = ColorChocolate();
            Assert.Equal(210, RedOf(chocolateColor));
            Assert.Equal(105, GreenOf(chocolateColor));
            Assert.Equal(30, BlueOf(chocolateColor));
            Assert.Equal(255, AlphaOf(chocolateColor));
        }
        [Fact]
        public void TestColorCoralIntegration() {
            var coralColor = ColorCoral();
            Assert.Equal(255, RedOf(coralColor));
            Assert.Equal(127, GreenOf(coralColor));
            Assert.Equal(80, BlueOf(coralColor));
            Assert.Equal(255, AlphaOf(coralColor));
        }
        [Fact]
        public void TestColorCornflowerBlueIntegration() {
            var cornflowerBlueColor = ColorCornflowerBlue();
            Assert.Equal(100, RedOf(cornflowerBlueColor));
            Assert.Equal(149, GreenOf(cornflowerBlueColor));
            Assert.Equal(237, BlueOf(cornflowerBlueColor));
            Assert.Equal(255, AlphaOf(cornflowerBlueColor));
        }
        [Fact]
        public void TestColorCornsilkIntegration() {
            var cornsilkColor = ColorCornsilk();
            Assert.Equal(255, RedOf(cornsilkColor));
            Assert.Equal(248, GreenOf(cornsilkColor));
            Assert.Equal(220, BlueOf(cornsilkColor));
            Assert.Equal(255, AlphaOf(cornsilkColor));
        }
        [Fact]
        public void TestColorCrimsonIntegration() {
            var crimsonColor = ColorCrimson();
            Assert.Equal(220, RedOf(crimsonColor));
            Assert.Equal(20, GreenOf(crimsonColor));
            Assert.Equal(60, BlueOf(crimsonColor));
            Assert.Equal(255, AlphaOf(crimsonColor));
        }
        [Fact]
        public void TestColorCyanIntegration() {
            var cyanColor = ColorCyan();
            Assert.Equal(0, RedOf(cyanColor));
            Assert.Equal(255, GreenOf(cyanColor));
            Assert.Equal(255, BlueOf(cyanColor));
            Assert.Equal(255, AlphaOf(cyanColor));
        }
        [Fact]
        public void TestColorDarkBlueIntegration() {
            var darkBlueColor = ColorDarkBlue();
            Assert.Equal(0, RedOf(darkBlueColor));
            Assert.Equal(0, GreenOf(darkBlueColor));
            Assert.Equal(139, BlueOf(darkBlueColor));
            Assert.Equal(255, AlphaOf(darkBlueColor));
        }
        [Fact]
        public void TestColorDarkCyanIntegration() {
            var darkCyanColor = ColorDarkCyan();
            Assert.Equal(0, RedOf(darkCyanColor));
            Assert.Equal(139, GreenOf(darkCyanColor));
            Assert.Equal(139, BlueOf(darkCyanColor));
            Assert.Equal(255, AlphaOf(darkCyanColor));
        }
        [Fact]
        public void TestColorDarkGoldenrodIntegration() {
            var darkGoldenrodColor = ColorDarkGoldenrod();
            Assert.Equal(184, RedOf(darkGoldenrodColor));
            Assert.Equal(134, GreenOf(darkGoldenrodColor));
            Assert.Equal(11, BlueOf(darkGoldenrodColor));
            Assert.Equal(255, AlphaOf(darkGoldenrodColor));
        }
        [Fact]
        public void TestColorDarkGrayIntegration() {
            var darkGrayColor = ColorDarkGray();
            Assert.Equal(169, RedOf(darkGrayColor));
            Assert.Equal(169, GreenOf(darkGrayColor));
            Assert.Equal(169, BlueOf(darkGrayColor));
            Assert.Equal(255, AlphaOf(darkGrayColor));
        }
        [Fact]
        public void TestColorDarkGreenIntegration() {
            var darkGreenColor = ColorDarkGreen();
            Assert.Equal(0, RedOf(darkGreenColor));
            Assert.Equal(100, GreenOf(darkGreenColor));
            Assert.Equal(0, BlueOf(darkGreenColor));
            Assert.Equal(255, AlphaOf(darkGreenColor));
        }
        [Fact]
        public void TestColorDarkKhakiIntegration() {
            var darkKhakiColor = ColorDarkKhaki();
            Assert.Equal(189, RedOf(darkKhakiColor));
            Assert.Equal(183, GreenOf(darkKhakiColor));
            Assert.Equal(107, BlueOf(darkKhakiColor));
            Assert.Equal(255, AlphaOf(darkKhakiColor));
        }
        [Fact]
        public void TestColorDarkMagentaIntegration() {
            var darkMagentaColor = ColorDarkMagenta();
            Assert.Equal(139, RedOf(darkMagentaColor));
            Assert.Equal(0, GreenOf(darkMagentaColor));
            Assert.Equal(139, BlueOf(darkMagentaColor));
            Assert.Equal(255, AlphaOf(darkMagentaColor));
        }
        [Fact]
        public void TestColorDarkOliveGreenIntegration() {
            var darkOliveGreenColor = ColorDarkOliveGreen();
            Assert.Equal(85, RedOf(darkOliveGreenColor));
            Assert.Equal(107, GreenOf(darkOliveGreenColor));
            Assert.Equal(47, BlueOf(darkOliveGreenColor));
            Assert.Equal(255, AlphaOf(darkOliveGreenColor));
        }
        [Fact]
        public void TestColorDarkOrangeIntegration() {
            var darkOrangeColor = ColorDarkOrange();
            Assert.Equal(255, RedOf(darkOrangeColor));
            Assert.Equal(140, GreenOf(darkOrangeColor));
            Assert.Equal(0, BlueOf(darkOrangeColor));
            Assert.Equal(255, AlphaOf(darkOrangeColor));
        }
        [Fact]
        public void TestColorDarkOrchidIntegration() {
            var darkOrchidColor = ColorDarkOrchid();
            Assert.Equal(153, RedOf(darkOrchidColor));
            Assert.Equal(50, GreenOf(darkOrchidColor));
            Assert.Equal(204, BlueOf(darkOrchidColor));
            Assert.Equal(255, AlphaOf(darkOrchidColor));
        }
        [Fact]
        public void TestColorDarkRedIntegration() {
            var darkRedColor = ColorDarkRed();
            Assert.Equal(139, RedOf(darkRedColor));
            Assert.Equal(0, GreenOf(darkRedColor));
            Assert.Equal(0, BlueOf(darkRedColor));
            Assert.Equal(255, AlphaOf(darkRedColor));
        }
        [Fact]
        public void TestColorDarkSalmonIntegration() {
            var darkSalmonColor = ColorDarkSalmon();
            Assert.Equal(233, RedOf(darkSalmonColor));
            Assert.Equal(150, GreenOf(darkSalmonColor));
            Assert.Equal(122, BlueOf(darkSalmonColor));
            Assert.Equal(255, AlphaOf(darkSalmonColor));
        }
        [Fact]
        public void TestColorDarkSeaGreenIntegration() {
            var darkSeaGreenColor = ColorDarkSeaGreen();
            Assert.Equal(143, RedOf(darkSeaGreenColor));
            Assert.Equal(188, GreenOf(darkSeaGreenColor));
            Assert.Equal(139, BlueOf(darkSeaGreenColor));
            Assert.Equal(255, AlphaOf(darkSeaGreenColor));
        }
        [Fact]
        public void TestColorDarkSlateBlueIntegration() {
            var darkSlateBlueColor = ColorDarkSlateBlue();
            Assert.Equal(72, RedOf(darkSlateBlueColor));
            Assert.Equal(61, GreenOf(darkSlateBlueColor));
            Assert.Equal(139, BlueOf(darkSlateBlueColor));
            Assert.Equal(255, AlphaOf(darkSlateBlueColor));
        }
        [Fact]
        public void TestColorDarkSlateGrayIntegration() {
            var darkSlateGrayColor = ColorDarkSlateGray();
            Assert.Equal(47, RedOf(darkSlateGrayColor));
            Assert.Equal(79, GreenOf(darkSlateGrayColor));
            Assert.Equal(79, BlueOf(darkSlateGrayColor));
            Assert.Equal(255, AlphaOf(darkSlateGrayColor));
        }
        [Fact]
        public void TestColorDarkTurquoiseIntegration() {
            var darkTurquoiseColor = ColorDarkTurquoise();
            Assert.Equal(0, RedOf(darkTurquoiseColor));
            Assert.Equal(206, GreenOf(darkTurquoiseColor));
            Assert.Equal(209, BlueOf(darkTurquoiseColor));
            Assert.Equal(255, AlphaOf(darkTurquoiseColor));
        }
        [Fact]
        public void TestColorDarkVioletIntegration() {
            var darkVioletColor = ColorDarkViolet();
            Assert.Equal(148, RedOf(darkVioletColor));
            Assert.Equal(0, GreenOf(darkVioletColor));
            Assert.Equal(211, BlueOf(darkVioletColor));
            Assert.Equal(255, AlphaOf(darkVioletColor));
        }
        [Fact]
        public void TestColorDeepPinkIntegration() {
            var deepPinkColor = ColorDeepPink();
            Assert.Equal(255, RedOf(deepPinkColor));
            Assert.Equal(20, GreenOf(deepPinkColor));
            Assert.Equal(147, BlueOf(deepPinkColor));
            Assert.Equal(255, AlphaOf(deepPinkColor));
        }
        [Fact]
        public void TestColorDeepSkyBlueIntegration() {
            var deepSkyBlueColor = ColorDeepSkyBlue();
            Assert.Equal(0, RedOf(deepSkyBlueColor));
            Assert.Equal(191, GreenOf(deepSkyBlueColor));
            Assert.Equal(255, BlueOf(deepSkyBlueColor));
            Assert.Equal(255, AlphaOf(deepSkyBlueColor));
        }
        [Fact]
        public void TestColorDimGrayIntegration() {
            var dimGrayColor = ColorDimGray();
            Assert.Equal(105, RedOf(dimGrayColor));
            Assert.Equal(105, GreenOf(dimGrayColor));
            Assert.Equal(105, BlueOf(dimGrayColor));
            Assert.Equal(255, AlphaOf(dimGrayColor));
        }
        [Fact]
        public void TestColorDodgerBlueIntegration() {
            var dodgerBlueColor = ColorDodgerBlue();
            Assert.Equal(30, RedOf(dodgerBlueColor));
            Assert.Equal(144, GreenOf(dodgerBlueColor));
            Assert.Equal(255, BlueOf(dodgerBlueColor));
            Assert.Equal(255, AlphaOf(dodgerBlueColor));
        }
        [Fact]
        public void TestColorFirebrickIntegration() {
            var firebrickColor = ColorFirebrick();
            Assert.Equal(178, RedOf(firebrickColor));
            Assert.Equal(34, GreenOf(firebrickColor));
            Assert.Equal(34, BlueOf(firebrickColor));
            Assert.Equal(255, AlphaOf(firebrickColor));
        }
        [Fact]
        public void TestColorFloralWhiteIntegration() {
            var floralWhiteColor = ColorFloralWhite();
            Assert.Equal(255, RedOf(floralWhiteColor));
            Assert.Equal(250, GreenOf(floralWhiteColor));
            Assert.Equal(240, BlueOf(floralWhiteColor));
            Assert.Equal(255, AlphaOf(floralWhiteColor));
        }
        [Fact]
        public void TestColorForestGreenIntegration() {
            var forestGreenColor = ColorForestGreen();
            Assert.Equal(34, RedOf(forestGreenColor));
            Assert.Equal(139, GreenOf(forestGreenColor));
            Assert.Equal(34, BlueOf(forestGreenColor));
            Assert.Equal(255, AlphaOf(forestGreenColor));
        }
        [Fact]
        public void TestColorFuchsiaIntegration() {
            var fuchsiaColor = ColorFuchsia();
            Assert.Equal(255, RedOf(fuchsiaColor));
            Assert.Equal(0, GreenOf(fuchsiaColor));
            Assert.Equal(255, BlueOf(fuchsiaColor));
            Assert.Equal(255, AlphaOf(fuchsiaColor));
        }
        [Fact]
        public void TestColorGainsboroIntegration() {
            var gainsboroColor = ColorGainsboro();
            Assert.Equal(220, RedOf(gainsboroColor));
            Assert.Equal(220, GreenOf(gainsboroColor));
            Assert.Equal(220, BlueOf(gainsboroColor));
            Assert.Equal(255, AlphaOf(gainsboroColor));
        }
        [Fact]
        public void TestColorGhostWhiteIntegration() {
            var ghostWhiteColor = ColorGhostWhite();
            Assert.Equal(248, RedOf(ghostWhiteColor));
            Assert.Equal(248, GreenOf(ghostWhiteColor));
            Assert.Equal(255, BlueOf(ghostWhiteColor));
            Assert.Equal(255, AlphaOf(ghostWhiteColor));
        }
        [Fact]
        public void TestColorGoldIntegration() {
            var goldColor = ColorGold();
            Assert.Equal(255, RedOf(goldColor));
            Assert.Equal(215, GreenOf(goldColor));
            Assert.Equal(0, BlueOf(goldColor));
            Assert.Equal(255, AlphaOf(goldColor));
        }
        [Fact]
        public void TestColorGoldenrodIntegration() {
            var goldenrodColor = ColorGoldenrod();
            Assert.Equal(218, RedOf(goldenrodColor));
            Assert.Equal(165, GreenOf(goldenrodColor));
            Assert.Equal(32, BlueOf(goldenrodColor));
            Assert.Equal(255, AlphaOf(goldenrodColor));
        }
        [Fact]
        public void TestColorGrayIntegration() {
            var grayColor = ColorGray();
            Assert.Equal(127, RedOf(grayColor));
            Assert.Equal(127, GreenOf(grayColor));
            Assert.Equal(127, BlueOf(grayColor));
            Assert.Equal(255, AlphaOf(grayColor));
        }
        [Fact]
        public void TestColorGreenIntegration() {
            var greenColor = ColorGreen();
            Assert.Equal(0, RedOf(greenColor));
            Assert.Equal(127, GreenOf(greenColor));
            Assert.Equal(0, BlueOf(greenColor));
            Assert.Equal(255, AlphaOf(greenColor));
        }
        [Fact]
        public void TestColorGreenYellowIntegration() {
            var greenYellowColor = ColorGreenYellow();
            Assert.Equal(173, RedOf(greenYellowColor));
            Assert.Equal(255, GreenOf(greenYellowColor));
            Assert.Equal(47, BlueOf(greenYellowColor));
            Assert.Equal(255, AlphaOf(greenYellowColor));
        }
        [Fact]
        public void TestColorHoneydewIntegration() {
            var honeydewColor = ColorHoneydew();
            Assert.Equal(240, RedOf(honeydewColor));
            Assert.Equal(255, GreenOf(honeydewColor));
            Assert.Equal(240, BlueOf(honeydewColor));
            Assert.Equal(255, AlphaOf(honeydewColor));
        }
        [Fact]
        public void TestColorHotPinkIntegration() {
            var hotPinkColor = ColorHotPink();
            Assert.Equal(255, RedOf(hotPinkColor));
            Assert.Equal(105, GreenOf(hotPinkColor));
            Assert.Equal(180, BlueOf(hotPinkColor));
            Assert.Equal(255, AlphaOf(hotPinkColor));
        }
        [Fact]
        public void TestColorIndianRedIntegration() {
            var indianRedColor = ColorIndianRed();
            Assert.Equal(205, RedOf(indianRedColor));
            Assert.Equal(92, GreenOf(indianRedColor));
            Assert.Equal(92, BlueOf(indianRedColor));
            Assert.Equal(255, AlphaOf(indianRedColor));
        }
        [Fact]
        public void TestColorIndigoIntegration() {
            var indigoColor = ColorIndigo();
            Assert.Equal(75, RedOf(indigoColor));
            Assert.Equal(0, GreenOf(indigoColor));
            Assert.Equal(130, BlueOf(indigoColor));
            Assert.Equal(255, AlphaOf(indigoColor));
        }
        [Fact]
        public void TestColorIvoryIntegration() {
            var ivoryColor = ColorIvory();
            Assert.Equal(255, RedOf(ivoryColor));
            Assert.Equal(255, GreenOf(ivoryColor));
            Assert.Equal(240, BlueOf(ivoryColor));
            Assert.Equal(255, AlphaOf(ivoryColor));
        }
        [Fact]
        public void TestColorKhakiIntegration() {
            var khakiColor = ColorKhaki();
            Assert.Equal(240, RedOf(khakiColor));
            Assert.Equal(230, GreenOf(khakiColor));
            Assert.Equal(140, BlueOf(khakiColor));
            Assert.Equal(255, AlphaOf(khakiColor));
        }
        [Fact]
        public void TestColorLavenderIntegration() {
            var lavenderColor = ColorLavender();
            Assert.Equal(230, RedOf(lavenderColor));
            Assert.Equal(230, GreenOf(lavenderColor));
            Assert.Equal(250, BlueOf(lavenderColor));
            Assert.Equal(255, AlphaOf(lavenderColor));
        }
        [Fact]
        public void TestColorLavenderBlushIntegration() {
            var lavenderBlushColor = ColorLavenderBlush();
            Assert.Equal(255, RedOf(lavenderBlushColor));
            Assert.Equal(240, GreenOf(lavenderBlushColor));
            Assert.Equal(245, BlueOf(lavenderBlushColor));
            Assert.Equal(255, AlphaOf(lavenderBlushColor));
        }
        [Fact]
        public void TestColorLawnGreenIntegration() {
            var lawnGreenColor = ColorLawnGreen();
            Assert.Equal(124, RedOf(lawnGreenColor));
            Assert.Equal(252, GreenOf(lawnGreenColor));
            Assert.Equal(0, BlueOf(lawnGreenColor));
            Assert.Equal(255, AlphaOf(lawnGreenColor));
        }
        [Fact]
        public void TestColorLemonChiffonIntegration() {
            var lemonChiffonColor = ColorLemonChiffon();
            Assert.Equal(255, RedOf(lemonChiffonColor));
            Assert.Equal(250, GreenOf(lemonChiffonColor));
            Assert.Equal(205, BlueOf(lemonChiffonColor));
            Assert.Equal(255, AlphaOf(lemonChiffonColor));
        }
        [Fact]
        public void TestColorLightBlueIntegration() {
            var lightBlueColor = ColorLightBlue();
            Assert.Equal(173, RedOf(lightBlueColor));
            Assert.Equal(216, GreenOf(lightBlueColor));
            Assert.Equal(230, BlueOf(lightBlueColor));
            Assert.Equal(255, AlphaOf(lightBlueColor));
        }
        [Fact]
        public void TestColorLightCoralIntegration() {
            var lightCoralColor = ColorLightCoral();
            Assert.Equal(240, RedOf(lightCoralColor));
            Assert.Equal(127, GreenOf(lightCoralColor));
            Assert.Equal(127, BlueOf(lightCoralColor));
            Assert.Equal(255, AlphaOf(lightCoralColor));
        }
        [Fact]
        public void TestColorLightCyanIntegration() {
            var lightCyanColor = ColorLightCyan();
            Assert.Equal(224, RedOf(lightCyanColor));
            Assert.Equal(255, GreenOf(lightCyanColor));
            Assert.Equal(255, BlueOf(lightCyanColor));
            Assert.Equal(255, AlphaOf(lightCyanColor));
        }
        [Fact]
        public void TestColorLightGoldenrodYellowIntegration() {
            var lightGoldenrodYellowColor = ColorLightGoldenrodYellow();
            Assert.Equal(250, RedOf(lightGoldenrodYellowColor));
            Assert.Equal(250, GreenOf(lightGoldenrodYellowColor));
            Assert.Equal(210, BlueOf(lightGoldenrodYellowColor));
            Assert.Equal(255, AlphaOf(lightGoldenrodYellowColor));
        }
        [Fact]
        public void TestColorLightGrayIntegration() {
            var lightGrayColor = ColorLightGray();
            Assert.Equal(211, RedOf(lightGrayColor));
            Assert.Equal(211, GreenOf(lightGrayColor));
            Assert.Equal(211, BlueOf(lightGrayColor));
            Assert.Equal(255, AlphaOf(lightGrayColor));
        }
        [Fact]
        public void TestColorLightGreenIntegration() {
            var lightGreenColor = ColorLightGreen();
            Assert.Equal(144, RedOf(lightGreenColor));
            Assert.Equal(238, GreenOf(lightGreenColor));
            Assert.Equal(144, BlueOf(lightGreenColor));
            Assert.Equal(255, AlphaOf(lightGreenColor));
        }
        [Fact]
        public void TestColorLightPinkIntegration() {
            var lightPinkColor = ColorLightPink();
            Assert.Equal(255, RedOf(lightPinkColor));
            Assert.Equal(182, GreenOf(lightPinkColor));
            Assert.Equal(193, BlueOf(lightPinkColor));
            Assert.Equal(255, AlphaOf(lightPinkColor));
        }
        [Fact]
        public void TestColorLightSalmonIntegration() {
            var lightSalmonColor = ColorLightSalmon();
            Assert.Equal(255, RedOf(lightSalmonColor));
            Assert.Equal(160, GreenOf(lightSalmonColor));
            Assert.Equal(122, BlueOf(lightSalmonColor));
            Assert.Equal(255, AlphaOf(lightSalmonColor));
        }
        [Fact]
        public void TestColorLightSeaGreenIntegration() {
            var lightSeaGreenColor = ColorLightSeaGreen();
            Assert.Equal(32, RedOf(lightSeaGreenColor));
            Assert.Equal(178, GreenOf(lightSeaGreenColor));
            Assert.Equal(170, BlueOf(lightSeaGreenColor));
            Assert.Equal(255, AlphaOf(lightSeaGreenColor));
        }
        [Fact]
        public void TestColorLightSkyBlueIntegration() {
            var lightSkyBlueColor = ColorLightSkyBlue();
            Assert.Equal(135, RedOf(lightSkyBlueColor));
            Assert.Equal(206, GreenOf(lightSkyBlueColor));
            Assert.Equal(250, BlueOf(lightSkyBlueColor));
            Assert.Equal(255, AlphaOf(lightSkyBlueColor));
        }
        [Fact]
        public void TestColorLightSlateGrayIntegration() {
            var lightSlateGrayColor = ColorLightSlateGray();
            Assert.Equal(119, RedOf(lightSlateGrayColor));
            Assert.Equal(136, GreenOf(lightSlateGrayColor));
            Assert.Equal(153, BlueOf(lightSlateGrayColor));
            Assert.Equal(255, AlphaOf(lightSlateGrayColor));
        }
        [Fact]
        public void TestColorLightSteelBlueIntegration() {
            var lightSteelBlueColor = ColorLightSteelBlue();
            Assert.Equal(176, RedOf(lightSteelBlueColor));
            Assert.Equal(196, GreenOf(lightSteelBlueColor));
            Assert.Equal(222, BlueOf(lightSteelBlueColor));
            Assert.Equal(255, AlphaOf(lightSteelBlueColor));
        }
        [Fact]
        public void TestColorLightYellowIntegration() {
            var lightYellowColor = ColorLightYellow();
            Assert.Equal(255, RedOf(lightYellowColor));
            Assert.Equal(255, GreenOf(lightYellowColor));
            Assert.Equal(224, BlueOf(lightYellowColor));
            Assert.Equal(255, AlphaOf(lightYellowColor));
        }
        [Fact]
        public void TestColorLimeIntegration() {
            var limeColor = ColorLime();
            Assert.Equal(0, RedOf(limeColor));
            Assert.Equal(255, GreenOf(limeColor));
            Assert.Equal(0, BlueOf(limeColor));
            Assert.Equal(255, AlphaOf(limeColor));
        }
        [Fact]
        public void TestColorLimeGreenIntegration() {
            var limeGreenColor = ColorLimeGreen();
            Assert.Equal(50, RedOf(limeGreenColor));
            Assert.Equal(205, GreenOf(limeGreenColor));
            Assert.Equal(50, BlueOf(limeGreenColor));
            Assert.Equal(255, AlphaOf(limeGreenColor));
        }
        [Fact]
        public void TestColorLinenIntegration() {
            var linenColor = ColorLinen();
            Assert.Equal(250, RedOf(linenColor));
            Assert.Equal(240, GreenOf(linenColor));
            Assert.Equal(230, BlueOf(linenColor));
            Assert.Equal(255, AlphaOf(linenColor));
        }
        [Fact]
        public void TestColorMagentaIntegration() {
            var magentaColor = ColorMagenta();
            Assert.Equal(255, RedOf(magentaColor));
            Assert.Equal(0, GreenOf(magentaColor));
            Assert.Equal(255, BlueOf(magentaColor));
            Assert.Equal(255, AlphaOf(magentaColor));
        }
        [Fact]
        public void TestColorMaroonIntegration() {
            var maroonColor = ColorMaroon();
            Assert.Equal(127, RedOf(maroonColor));
            Assert.Equal(0, GreenOf(maroonColor));
            Assert.Equal(0, BlueOf(maroonColor));
            Assert.Equal(255, AlphaOf(maroonColor));
        }
        [Fact]
        public void TestColorMediumAquamarineIntegration() {
            var mediumAquamarineColor = ColorMediumAquamarine();
            Assert.Equal(102, RedOf(mediumAquamarineColor));
            Assert.Equal(205, GreenOf(mediumAquamarineColor));
            Assert.Equal(170, BlueOf(mediumAquamarineColor));
            Assert.Equal(255, AlphaOf(mediumAquamarineColor));
        }
        [Fact]
        public void TestColorMediumBlueIntegration() {
            var mediumBlueColor = ColorMediumBlue();
            Assert.Equal(0, RedOf(mediumBlueColor));
            Assert.Equal(0, GreenOf(mediumBlueColor));
            Assert.Equal(205, BlueOf(mediumBlueColor));
            Assert.Equal(255, AlphaOf(mediumBlueColor));
        }
        [Fact]
        public void TestColorMediumOrchidIntegration() {
            var mediumOrchidColor = ColorMediumOrchid();
            Assert.Equal(186, RedOf(mediumOrchidColor));
            Assert.Equal(85, GreenOf(mediumOrchidColor));
            Assert.Equal(211, BlueOf(mediumOrchidColor));
            Assert.Equal(255, AlphaOf(mediumOrchidColor));
        }
        [Fact]
        public void TestColorMediumPurpleIntegration() {
            var mediumPurpleColor = ColorMediumPurple();
            Assert.Equal(147, RedOf(mediumPurpleColor));
            Assert.Equal(112, GreenOf(mediumPurpleColor));
            Assert.Equal(219, BlueOf(mediumPurpleColor));
            Assert.Equal(255, AlphaOf(mediumPurpleColor));
        }
        [Fact]
        public void TestColorMediumSeaGreenIntegration() {
            var mediumSeaGreenColor = ColorMediumSeaGreen();
            Assert.Equal(60, RedOf(mediumSeaGreenColor));
            Assert.Equal(179, GreenOf(mediumSeaGreenColor));
            Assert.Equal(113, BlueOf(mediumSeaGreenColor));
            Assert.Equal(255, AlphaOf(mediumSeaGreenColor));
        }
        [Fact]
        public void TestColorMediumSlateBlueIntegration() {
            var mediumSlateBlueColor = ColorMediumSlateBlue();
            Assert.Equal(123, RedOf(mediumSlateBlueColor));
            Assert.Equal(104, GreenOf(mediumSlateBlueColor));
            Assert.Equal(238, BlueOf(mediumSlateBlueColor));
            Assert.Equal(255, AlphaOf(mediumSlateBlueColor));
        }
        [Fact]
        public void TestColorMediumSpringGreenIntegration() {
            var mediumSpringGreenColor = ColorMediumSpringGreen();
            Assert.Equal(0, RedOf(mediumSpringGreenColor));
            Assert.Equal(250, GreenOf(mediumSpringGreenColor));
            Assert.Equal(154, BlueOf(mediumSpringGreenColor));
            Assert.Equal(255, AlphaOf(mediumSpringGreenColor));
        }
        [Fact]
        public void TestColorMediumTurquoiseIntegration() {
            var mediumTurquoiseColor = ColorMediumTurquoise();
            Assert.Equal(72, RedOf(mediumTurquoiseColor));
            Assert.Equal(209, GreenOf(mediumTurquoiseColor));
            Assert.Equal(204, BlueOf(mediumTurquoiseColor));
            Assert.Equal(255, AlphaOf(mediumTurquoiseColor));
        }
        [Fact]
        public void TestColorMediumVioletRedIntegration() {
            var mediumVioletRedColor = ColorMediumVioletRed();
            Assert.Equal(199, RedOf(mediumVioletRedColor));
            Assert.Equal(21, GreenOf(mediumVioletRedColor));
            Assert.Equal(133, BlueOf(mediumVioletRedColor));
            Assert.Equal(255, AlphaOf(mediumVioletRedColor));
        }
        [Fact]
        public void TestColorMidnightBlueIntegration() {
            var midnightBlueColor = ColorMidnightBlue();
            Assert.Equal(25, RedOf(midnightBlueColor));
            Assert.Equal(25, GreenOf(midnightBlueColor));
            Assert.Equal(112, BlueOf(midnightBlueColor));
            Assert.Equal(255, AlphaOf(midnightBlueColor));
        }
        [Fact]
        public void TestColorMintCreamIntegration() {
            var mintCreamColor = ColorMintCream();
            Assert.Equal(245, RedOf(mintCreamColor));
            Assert.Equal(255, GreenOf(mintCreamColor));
            Assert.Equal(250, BlueOf(mintCreamColor));
            Assert.Equal(255, AlphaOf(mintCreamColor));
        }
        [Fact]
        public void TestColorMistyRoseIntegration() {
            var mistyRoseColor = ColorMistyRose();
            Assert.Equal(255, RedOf(mistyRoseColor));
            Assert.Equal(228, GreenOf(mistyRoseColor));
            Assert.Equal(225, BlueOf(mistyRoseColor));
            Assert.Equal(255, AlphaOf(mistyRoseColor));
        }
        [Fact]
        public void TestColorMoccasinIntegration() {
            var moccasinColor = ColorMoccasin();
            Assert.Equal(255, RedOf(moccasinColor));
            Assert.Equal(228, GreenOf(moccasinColor));
            Assert.Equal(181, BlueOf(moccasinColor));
            Assert.Equal(255, AlphaOf(moccasinColor));
        }
        [Fact]
        public void TestColorNavajoWhiteIntegration() {
            var navajoWhiteColor = ColorNavajoWhite();
            Assert.Equal(255, RedOf(navajoWhiteColor));
            Assert.Equal(222, GreenOf(navajoWhiteColor));
            Assert.Equal(173, BlueOf(navajoWhiteColor));
            Assert.Equal(255, AlphaOf(navajoWhiteColor));
        }
        [Fact]
        public void TestColorNavyIntegration() {
            var navyColor = ColorNavy();
            Assert.Equal(0, RedOf(navyColor));
            Assert.Equal(0, GreenOf(navyColor));
            Assert.Equal(127, BlueOf(navyColor));
            Assert.Equal(255, AlphaOf(navyColor));
        }
        [Fact]
        public void TestColorOldLaceIntegration() {
            var oldLaceColor = ColorOldLace();
            Assert.Equal(253, RedOf(oldLaceColor));
            Assert.Equal(245, GreenOf(oldLaceColor));
            Assert.Equal(230, BlueOf(oldLaceColor));
            Assert.Equal(255, AlphaOf(oldLaceColor));
        }
        [Fact]
        public void TestColorOliveIntegration() {
            var oliveColor = ColorOlive();
            Assert.Equal(127, RedOf(oliveColor));
            Assert.Equal(127, GreenOf(oliveColor));
            Assert.Equal(0, BlueOf(oliveColor));
            Assert.Equal(255, AlphaOf(oliveColor));
        }
        [Fact]
        public void TestColorOliveDrabIntegration() {
            var oliveDrabColor = ColorOliveDrab();
            Assert.Equal(107, RedOf(oliveDrabColor));
            Assert.Equal(142, GreenOf(oliveDrabColor));
            Assert.Equal(35, BlueOf(oliveDrabColor));
            Assert.Equal(255, AlphaOf(oliveDrabColor));
        }
        [Fact]
        public void TestColorOrangeIntegration() {
            var orangeColor = ColorOrange();
            Assert.Equal(255, RedOf(orangeColor));
            Assert.Equal(165, GreenOf(orangeColor));
            Assert.Equal(0, BlueOf(orangeColor));
            Assert.Equal(255, AlphaOf(orangeColor));
        }
        [Fact]
        public void TestColorOrangeRedIntegration() {
            var orangeRedColor = ColorOrangeRed();
            Assert.Equal(255, RedOf(orangeRedColor));
            Assert.Equal(69, GreenOf(orangeRedColor));
            Assert.Equal(0, BlueOf(orangeRedColor));
            Assert.Equal(255, AlphaOf(orangeRedColor));
        }
        [Fact]
        public void TestColorOrchidIntegration() {
            var orchidColor = ColorOrchid();
            Assert.Equal(218, RedOf(orchidColor));
            Assert.Equal(112, GreenOf(orchidColor));
            Assert.Equal(214, BlueOf(orchidColor));
            Assert.Equal(255, AlphaOf(orchidColor));
        }
        [Fact]
        public void TestColorPaleGoldenrodIntegration() {
            var paleGoldenrodColor = ColorPaleGoldenrod();
            Assert.Equal(238, RedOf(paleGoldenrodColor));
            Assert.Equal(232, GreenOf(paleGoldenrodColor));
            Assert.Equal(170, BlueOf(paleGoldenrodColor));
            Assert.Equal(255, AlphaOf(paleGoldenrodColor));
        }
        [Fact]
        public void TestColorPaleGreenIntegration() {
            var paleGreenColor = ColorPaleGreen();
            Assert.Equal(152, RedOf(paleGreenColor));
            Assert.Equal(251, GreenOf(paleGreenColor));
            Assert.Equal(152, BlueOf(paleGreenColor));
            Assert.Equal(255, AlphaOf(paleGreenColor));
        }
        [Fact]
        public void TestColorPaleTurquoiseIntegration() {
            var paleTurquoiseColor = ColorPaleTurquoise();
            Assert.Equal(175, RedOf(paleTurquoiseColor));
            Assert.Equal(238, GreenOf(paleTurquoiseColor));
            Assert.Equal(238, BlueOf(paleTurquoiseColor));
            Assert.Equal(255, AlphaOf(paleTurquoiseColor));
        }
        [Fact]
        public void TestColorPaleVioletRedIntegration() {
            var paleVioletRedColor = ColorPaleVioletRed();
            Assert.Equal(219, RedOf(paleVioletRedColor));
            Assert.Equal(112, GreenOf(paleVioletRedColor));
            Assert.Equal(147, BlueOf(paleVioletRedColor));
            Assert.Equal(255, AlphaOf(paleVioletRedColor));
        }
        [Fact]
        public void TestColorPapayaWhipIntegration() {
            var papayaWhipColor = ColorPapayaWhip();
            Assert.Equal(255, RedOf(papayaWhipColor));
            Assert.Equal(239, GreenOf(papayaWhipColor));
            Assert.Equal(213, BlueOf(papayaWhipColor));
            Assert.Equal(255, AlphaOf(papayaWhipColor));
        }
        [Fact]
        public void TestColorPeachPuffIntegration() {
            var peachPuffColor = ColorPeachPuff();
            Assert.Equal(255, RedOf(peachPuffColor));
            Assert.Equal(218, GreenOf(peachPuffColor));
            Assert.Equal(185, BlueOf(peachPuffColor));
            Assert.Equal(255, AlphaOf(peachPuffColor));
        }
        [Fact]
        public void TestColorPeruIntegration() {
            var peruColor = ColorPeru();
            Assert.Equal(205, RedOf(peruColor));
            Assert.Equal(133, GreenOf(peruColor));
            Assert.Equal(63, BlueOf(peruColor));
            Assert.Equal(255, AlphaOf(peruColor));
        }
        [Fact]
        public void TestColorPinkIntegration() {
            var pinkColor = ColorPink();
            Assert.Equal(255, RedOf(pinkColor));
            Assert.Equal(192, GreenOf(pinkColor));
            Assert.Equal(203, BlueOf(pinkColor));
            Assert.Equal(255, AlphaOf(pinkColor));
        }
        [Fact]
        public void TestColorPlumIntegration() {
            var plumColor = ColorPlum();
            Assert.Equal(221, RedOf(plumColor));
            Assert.Equal(160, GreenOf(plumColor));
            Assert.Equal(221, BlueOf(plumColor));
            Assert.Equal(255, AlphaOf(plumColor));
        }
        [Fact]
        public void TestColorPowderBlueIntegration() {
            var powderBlueColor = ColorPowderBlue();
            Assert.Equal(176, RedOf(powderBlueColor));
            Assert.Equal(224, GreenOf(powderBlueColor));
            Assert.Equal(230, BlueOf(powderBlueColor));
            Assert.Equal(255, AlphaOf(powderBlueColor));
        }
        [Fact]
        public void TestColorPurpleIntegration() {
            var purpleColor = ColorPurple();
            Assert.Equal(127, RedOf(purpleColor));
            Assert.Equal(0, GreenOf(purpleColor));
            Assert.Equal(127, BlueOf(purpleColor));
            Assert.Equal(255, AlphaOf(purpleColor));
        }
        [Fact]
        public void TestColorRedIntegration() {
            var redColor = ColorRed();
            Assert.Equal(255, RedOf(redColor));
            Assert.Equal(0, GreenOf(redColor));
            Assert.Equal(0, BlueOf(redColor));
            Assert.Equal(255, AlphaOf(redColor));
        }
        [Fact]
        public void TestColorRosyBrownIntegration() {
            var rosyBrownColor = ColorRosyBrown();
            Assert.Equal(188, RedOf(rosyBrownColor));
            Assert.Equal(143, GreenOf(rosyBrownColor));
            Assert.Equal(143, BlueOf(rosyBrownColor));
            Assert.Equal(255, AlphaOf(rosyBrownColor));
        }
        [Fact]
        public void TestColorRoyalBlueIntegration() {
            var royalBlueColor = ColorRoyalBlue();
            Assert.Equal(65, RedOf(royalBlueColor));
            Assert.Equal(105, GreenOf(royalBlueColor));
            Assert.Equal(225, BlueOf(royalBlueColor));
            Assert.Equal(255, AlphaOf(royalBlueColor));
        }
        [Fact]
        public void TestColorSaddleBrownIntegration() {
            var saddleBrownColor = ColorSaddleBrown();
            Assert.Equal(139, RedOf(saddleBrownColor));
            Assert.Equal(69, GreenOf(saddleBrownColor));
            Assert.Equal(19, BlueOf(saddleBrownColor));
            Assert.Equal(255, AlphaOf(saddleBrownColor));
        }
        [Fact]
        public void TestColorSalmonIntegration() {
            var salmonColor = ColorSalmon();
            Assert.Equal(250, RedOf(salmonColor));
            Assert.Equal(127, GreenOf(salmonColor));
            Assert.Equal(114, BlueOf(salmonColor));
            Assert.Equal(255, AlphaOf(salmonColor));
        }
        [Fact]
        public void TestColorSandyBrownIntegration() {
            var sandyBrownColor = ColorSandyBrown();
            Assert.Equal(244, RedOf(sandyBrownColor));
            Assert.Equal(164, GreenOf(sandyBrownColor));
            Assert.Equal(96, BlueOf(sandyBrownColor));
            Assert.Equal(255, AlphaOf(sandyBrownColor));
        }
        [Fact]
        public void TestColorSeaGreenIntegration() {
            var seaGreenColor = ColorSeaGreen();
            Assert.Equal(46, RedOf(seaGreenColor));
            Assert.Equal(139, GreenOf(seaGreenColor));
            Assert.Equal(87, BlueOf(seaGreenColor));
            Assert.Equal(255, AlphaOf(seaGreenColor));
        }
        [Fact]
        public void TestColorSeaShellIntegration() {
            var seaShellColor = ColorSeaShell();
            Assert.Equal(255, RedOf(seaShellColor));
            Assert.Equal(245, GreenOf(seaShellColor));
            Assert.Equal(238, BlueOf(seaShellColor));
            Assert.Equal(255, AlphaOf(seaShellColor));
        }
        [Fact]
        public void TestColorSiennaIntegration() {
            var siennaColor = ColorSienna();
            Assert.Equal(160, RedOf(siennaColor));
            Assert.Equal(82, GreenOf(siennaColor));
            Assert.Equal(45, BlueOf(siennaColor));
            Assert.Equal(255, AlphaOf(siennaColor));
        }
        [Fact]
        public void TestColorSilverIntegration() {
            var silverColor = ColorSilver();
            Assert.Equal(192, RedOf(silverColor));
            Assert.Equal(192, GreenOf(silverColor));
            Assert.Equal(192, BlueOf(silverColor));
            Assert.Equal(255, AlphaOf(silverColor));
        }
        [Fact]
        public void TestColorSkyBlueIntegration() {
            var skyBlueColor = ColorSkyBlue();
            Assert.Equal(135, RedOf(skyBlueColor));
            Assert.Equal(206, GreenOf(skyBlueColor));
            Assert.Equal(235, BlueOf(skyBlueColor));
            Assert.Equal(255, AlphaOf(skyBlueColor));
        }
        [Fact]
        public void TestColorSlateBlueIntegration() {
            var slateBlueColor = ColorSlateBlue();
            Assert.Equal(106, RedOf(slateBlueColor));
            Assert.Equal(90, GreenOf(slateBlueColor));
            Assert.Equal(205, BlueOf(slateBlueColor));
            Assert.Equal(255, AlphaOf(slateBlueColor));
        }
        [Fact]
        public void TestColorSlateGrayIntegration() {
            var slateGrayColor = ColorSlateGray();
            Assert.Equal(112, RedOf(slateGrayColor));
            Assert.Equal(127, GreenOf(slateGrayColor));
            Assert.Equal(144, BlueOf(slateGrayColor));
            Assert.Equal(255, AlphaOf(slateGrayColor));
        }
        [Fact]
        public void TestColorSnowIntegration() {
            var snowColor = ColorSnow();
            Assert.Equal(255, RedOf(snowColor));
            Assert.Equal(250, GreenOf(snowColor));
            Assert.Equal(250, BlueOf(snowColor));
            Assert.Equal(255, AlphaOf(snowColor));
        }
        [Fact]
        public void TestColorSpringGreenIntegration() {
            var springGreenColor = ColorSpringGreen();
            Assert.Equal(0, RedOf(springGreenColor));
            Assert.Equal(255, GreenOf(springGreenColor));
            Assert.Equal(127, BlueOf(springGreenColor));
            Assert.Equal(255, AlphaOf(springGreenColor));
        }
        [Fact]
        public void TestColorSteelBlueIntegration() {
            var steelBlueColor = ColorSteelBlue();
            Assert.Equal(70, RedOf(steelBlueColor));
            Assert.Equal(130, GreenOf(steelBlueColor));
            Assert.Equal(180, BlueOf(steelBlueColor));
            Assert.Equal(255, AlphaOf(steelBlueColor));
        }
        [Fact]
        public void TestColorSwinburneRedIntegration() {
            var swinburneRedColor = ColorSwinburneRed();
            Assert.Equal(237, RedOf(swinburneRedColor));
            Assert.Equal(36, GreenOf(swinburneRedColor));
            Assert.Equal(25, BlueOf(swinburneRedColor));
            Assert.Equal(255, AlphaOf(swinburneRedColor));
        }
        [Fact]
        public void TestColorTanIntegration() {
            var tanColor = ColorTan();
            Assert.Equal(210, RedOf(tanColor));
            Assert.Equal(180, GreenOf(tanColor));
            Assert.Equal(140, BlueOf(tanColor));
            Assert.Equal(255, AlphaOf(tanColor));
        }
        [Fact]
        public void TestColorTealIntegration() {
            var tealColor = ColorTeal();
            Assert.Equal(0, RedOf(tealColor));
            Assert.Equal(127, GreenOf(tealColor));
            Assert.Equal(127, BlueOf(tealColor));
            Assert.Equal(255, AlphaOf(tealColor));
        }
        [Fact]
        public void TestColorThistleIntegration() {
            var thistleColor = ColorThistle();
            Assert.Equal(216, RedOf(thistleColor));
            Assert.Equal(191, GreenOf(thistleColor));
            Assert.Equal(216, BlueOf(thistleColor));
            Assert.Equal(255, AlphaOf(thistleColor));
        }
        [Fact]
        public void TestColorToStringIntegration() {
            var redColor = ColorRed();
            var redColorString = ColorToString(redColor);
            Assert.Equal("#ff0000ff", redColorString);
            var transparentColor = ColorTransparent();
            var transparentColorString = ColorToString(transparentColor);
            Assert.Equal("#ffffffff", transparentColorString);
        }
        [Fact]
        public void TestColorTomatoIntegration() {
            var tomatoColor = ColorTomato();
            Assert.Equal(255, RedOf(tomatoColor));
            Assert.Equal(99, GreenOf(tomatoColor));
            Assert.Equal(71, BlueOf(tomatoColor));
            Assert.Equal(255, AlphaOf(tomatoColor));
        }
        [Fact]
        public void TestColorTransparentIntegration() {
            var transparentColor = ColorTransparent();
            Assert.Equal(255, AlphaOf(transparentColor));
            Assert.Equal(255, RedOf(transparentColor));
            Assert.Equal(255, GreenOf(transparentColor));
            Assert.Equal(255, BlueOf(transparentColor));
        }
        [Fact]
        public void TestColorTurquoiseIntegration() {
            var turquoiseColor = ColorTurquoise();
            Assert.Equal(64, RedOf(turquoiseColor));
            Assert.Equal(224, GreenOf(turquoiseColor));
            Assert.Equal(208, BlueOf(turquoiseColor));
            Assert.Equal(255, AlphaOf(turquoiseColor));
        }
        [Fact]
        public void TestColorVioletIntegration() {
            var violetColor = ColorViolet();
            Assert.Equal(238, RedOf(violetColor));
            Assert.Equal(130, GreenOf(violetColor));
            Assert.Equal(238, BlueOf(violetColor));
            Assert.Equal(255, AlphaOf(violetColor));
        }
        [Fact]
        public void TestColorWheatIntegration() {
            var wheatColor = ColorWheat();
            Assert.Equal(245, RedOf(wheatColor));
            Assert.Equal(222, GreenOf(wheatColor));
            Assert.Equal(179, BlueOf(wheatColor));
            Assert.Equal(255, AlphaOf(wheatColor));
        }
        [Fact]
        public void TestColorWhiteIntegration() {
            var whiteColor = ColorWhite();
            Assert.Equal(255, RedOf(whiteColor));
            Assert.Equal(255, GreenOf(whiteColor));
            Assert.Equal(255, BlueOf(whiteColor));
            Assert.Equal(255, AlphaOf(whiteColor));
        }
        [Fact]
        public void TestColorWhiteSmokeIntegration() {
            var whiteSmokeColor = ColorWhiteSmoke();
            Assert.Equal(245, RedOf(whiteSmokeColor));
            Assert.Equal(245, GreenOf(whiteSmokeColor));
            Assert.Equal(245, BlueOf(whiteSmokeColor));
            Assert.Equal(255, AlphaOf(whiteSmokeColor));
        }
        [Fact]
        public void TestColorYellowIntegration() {
            var yellowColor = ColorYellow();
            Assert.Equal(255, RedOf(yellowColor));
            Assert.Equal(255, GreenOf(yellowColor));
            Assert.Equal(0, BlueOf(yellowColor));
            Assert.Equal(255, AlphaOf(yellowColor));
        }
        [Fact]
        public void TestColorYellowGreenIntegration() {
            var yellowGreenColor = ColorYellowGreen();
            Assert.Equal(154, RedOf(yellowGreenColor));
            Assert.Equal(205, GreenOf(yellowGreenColor));
            Assert.Equal(50, BlueOf(yellowGreenColor));
            Assert.Equal(255, AlphaOf(yellowGreenColor));
        }
        [Fact]
        public void TestGreenOfIntegration() {
            var greenColor = ColorGreen();
            var greenValue = GreenOf(greenColor);
            Assert.Equal(127, greenValue);
            var blackColor = ColorBlack();
            var blackGreenValue = GreenOf(blackColor);
            Assert.Equal(0, blackGreenValue);
        }
        [Fact]
        public void TestHSBColorIntegration() {
            var redColor = HSBColor(0.0, 1.0, 1.0);
            Assert.Equal(0.0, HueOf(redColor));
            Assert.Equal(1.0, SaturationOf(redColor));
            Assert.Equal(1.0, BrightnessOf(redColor));
            var grayColor = HSBColor(0.5, 0.0, 0.5);
            Assert.Equal(0.0, SaturationOf(grayColor));
        }
        [Fact]
        public void TestHueOfIntegration() {
            var redColor = ColorRed();
            var hueValue = HueOf(redColor);
            Assert.Equal(0.0, hueValue);
            var blueColor = ColorBlue();
            var hueValueBlue = HueOf(blueColor);
            Assert.Equal(0.6666666666666666, hueValueBlue);
        }
        [Fact]
        public void TestRandomColorIntegration() {
            var randomColorResult = RandomColor();
            Assert.NotEqual("#000000FF", ColorToString(randomColorResult));
            Assert.InRange(AlphaOf(randomColorResult), 0, 255);
        }
        [Fact]
        public void TestRandomRGBColorIntegration() {
            var randomColor = RandomRGBColor(255);
            Assert.InRange(RedOf(randomColor), 0, 255);
            Assert.InRange(GreenOf(randomColor), 0, 255);
            Assert.InRange(BlueOf(randomColor), 0, 255);
            Assert.Equal(255, AlphaOf(randomColor));
        }
        [Fact]
        public void TestRedOfIntegration() {
            var redColor = ColorRed();
            var redValue = RedOf(redColor);
            Assert.Equal(255, redValue);
            var blueColor = ColorBlue();
            var blueRedValue = RedOf(blueColor);
            Assert.Equal(0, blueRedValue);
        }
        [Fact]
        public void TestRGBColorFromDoubleIntegration() {
            var redColor = RGBColor(1.0, 0.0, 0.0);
            Assert.Equal(255, RedOf(redColor));
            Assert.Equal(0, GreenOf(redColor));
            Assert.Equal(0, BlueOf(redColor));
            var greenColor = RGBColor(0.0, 1.0, 0.0);
            Assert.Equal(0, RedOf(greenColor));
            Assert.Equal(255, GreenOf(greenColor));
            Assert.Equal(0, BlueOf(greenColor));
        }
        [Fact]
        public void TestRGBColorIntegration() {
            var redColor = RGBColor(255, 0, 0);
            Assert.Equal(255, RedOf(redColor));
            Assert.Equal(0, GreenOf(redColor));
            Assert.Equal(0, BlueOf(redColor));
            Assert.Equal(255, AlphaOf(redColor));
        }
        [Fact]
        public void TestRGBAColorFromDoubleIntegration() {
            var testColor = RGBAColor(1.0, 0.5, 0.0, 0.75);
            Assert.Equal(255, RedOf(testColor));
            Assert.Equal(127, GreenOf(testColor));
            Assert.Equal(0, BlueOf(testColor));
            Assert.Equal(191, AlphaOf(testColor));
        }
        [Fact]
        public void TestRGBAColorIntegration() {
            var redColor = RGBAColor(255, 0, 0, 255);
            Assert.Equal(255, RedOf(redColor));
            Assert.Equal(0, GreenOf(redColor));
            Assert.Equal(0, BlueOf(redColor));
            Assert.Equal(255, AlphaOf(redColor));
        }
        [Fact]
        public void TestSaturationOfIntegration() {
            var redColor = ColorRed();
            var saturationValue = SaturationOf(redColor);
            Assert.Equal(1.0, saturationValue);
            var grayColor = ColorGray();
            var saturationValueGray = SaturationOf(grayColor);
            Assert.Equal(0.0, saturationValueGray);
        }
        [Fact]
        public void TestStringToColorIntegration() {
            var redColor = StringToColor("#FF0000FF");
            Assert.Equal(255, RedOf(redColor));
            Assert.Equal(0, GreenOf(redColor));
            Assert.Equal(0, BlueOf(redColor));
            Assert.Equal(255, AlphaOf(redColor));
            var greenColor = StringToColor("#00FF00FF");
            Assert.Equal(0, RedOf(greenColor));
            Assert.Equal(255, GreenOf(greenColor));
            Assert.Equal(0, BlueOf(greenColor));
            Assert.Equal(255, AlphaOf(greenColor));
        }
    }
}
