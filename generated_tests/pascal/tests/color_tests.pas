uses SplashKit, TestFramework

type
TTestColor = class(TTestCase)
protected
procedure TIntegrationTests.TestAlphaOfIntegration;
begin
    redColor := ColorRed();
    alphaValue := AlphaOf(redColor);
    AssertEquals(255, alphaValue);
    transparentColor := ColorTransparent();
    alphaValueTransparent := AlphaOf(transparentColor);
    AssertEquals(255, alphaValueTransparent);
end;
procedure TIntegrationTests.TestBlueOfIntegration;
begin
    blueColor := ColorBlue();
    blueValue := BlueOf(blueColor);
    AssertEquals(255, blueValue);
    redColor := ColorRed();
    blueValueRed := BlueOf(redColor);
    AssertEquals(0, blueValueRed);
end;
procedure TIntegrationTests.TestBrightnessOfIntegration;
begin
    whiteColor := ColorWhite();
    whiteBrightness := BrightnessOf(whiteColor);
    AssertEquals(1.0, whiteBrightness);
    blackColor := ColorBlack();
    blackBrightness := BrightnessOf(blackColor);
    AssertEquals(0.0, blackBrightness);
    grayColor := ColorGray();
    grayBrightness := BrightnessOf(grayColor);
    AssertTrue((grayBrightness >= 0.4) and (grayBrightness <= 0.6));
end;
procedure TIntegrationTests.TestColorAliceBlueIntegration;
begin
    aliceBlueColor := ColorAliceBlue();
    AssertEquals(240, RedOf(aliceBlueColor));
    AssertEquals(248, GreenOf(aliceBlueColor));
    AssertEquals(255, BlueOf(aliceBlueColor));
    AssertEquals(255, AlphaOf(aliceBlueColor));
end;
procedure TIntegrationTests.TestColorAntiqueWhiteIntegration;
begin
    antiqueWhiteColor := ColorAntiqueWhite();
    AssertEquals(250, RedOf(antiqueWhiteColor));
    AssertEquals(235, GreenOf(antiqueWhiteColor));
    AssertEquals(215, BlueOf(antiqueWhiteColor));
    AssertEquals(255, AlphaOf(antiqueWhiteColor));
end;
procedure TIntegrationTests.TestColorAquaIntegration;
begin
    aquaColor := ColorAqua();
    AssertEquals(0, RedOf(aquaColor));
    AssertEquals(255, GreenOf(aquaColor));
    AssertEquals(255, BlueOf(aquaColor));
    AssertEquals(255, AlphaOf(aquaColor));
end;
procedure TIntegrationTests.TestColorAquamarineIntegration;
begin
    aquamarineColor := ColorAquamarine();
    AssertEquals(127, RedOf(aquamarineColor));
    AssertEquals(255, GreenOf(aquamarineColor));
    AssertEquals(212, BlueOf(aquamarineColor));
    AssertEquals(255, AlphaOf(aquamarineColor));
end;
procedure TIntegrationTests.TestColorAzureIntegration;
begin
    azureColor := ColorAzure();
    AssertEquals(240, RedOf(azureColor));
    AssertEquals(255, GreenOf(azureColor));
    AssertEquals(255, BlueOf(azureColor));
    AssertEquals(255, AlphaOf(azureColor));
end;
procedure TIntegrationTests.TestColorBeigeIntegration;
begin
    beigeColor := ColorBeige();
    AssertEquals(245, RedOf(beigeColor));
    AssertEquals(245, GreenOf(beigeColor));
    AssertEquals(220, BlueOf(beigeColor));
    AssertEquals(255, AlphaOf(beigeColor));
end;
procedure TIntegrationTests.TestColorBisqueIntegration;
begin
    bisqueColor := ColorBisque();
    AssertEquals(255, RedOf(bisqueColor));
    AssertEquals(228, GreenOf(bisqueColor));
    AssertEquals(196, BlueOf(bisqueColor));
    AssertEquals(255, AlphaOf(bisqueColor));
end;
procedure TIntegrationTests.TestColorBlackIntegration;
begin
    blackColor := ColorBlack();
    AssertEquals(0, RedOf(blackColor));
    AssertEquals(0, GreenOf(blackColor));
    AssertEquals(0, BlueOf(blackColor));
    AssertEquals(255, AlphaOf(blackColor));
end;
procedure TIntegrationTests.TestColorBlanchedAlmondIntegration;
begin
    blanchedAlmondColor := ColorBlanchedAlmond();
    AssertEquals(255, RedOf(blanchedAlmondColor));
    AssertEquals(235, GreenOf(blanchedAlmondColor));
    AssertEquals(205, BlueOf(blanchedAlmondColor));
    AssertEquals(255, AlphaOf(blanchedAlmondColor));
end;
procedure TIntegrationTests.TestColorBlueIntegration;
begin
    blueColor := ColorBlue();
    AssertEquals(0, RedOf(blueColor));
    AssertEquals(0, GreenOf(blueColor));
    AssertEquals(255, BlueOf(blueColor));
    AssertEquals(255, AlphaOf(blueColor));
end;
procedure TIntegrationTests.TestColorBlueVioletIntegration;
begin
    blueVioletColor := ColorBlueViolet();
    AssertEquals(138, RedOf(blueVioletColor));
    AssertEquals(43, GreenOf(blueVioletColor));
    AssertEquals(226, BlueOf(blueVioletColor));
    AssertEquals(255, AlphaOf(blueVioletColor));
end;
procedure TIntegrationTests.TestColorBrightGreenIntegration;
begin
    brightGreenColor := ColorBrightGreen();
    AssertEquals(0, RedOf(brightGreenColor));
    AssertEquals(255, GreenOf(brightGreenColor));
    AssertEquals(0, BlueOf(brightGreenColor));
    AssertEquals(255, AlphaOf(brightGreenColor));
end;
procedure TIntegrationTests.TestColorBrownIntegration;
begin
    brownColor := ColorBrown();
    AssertEquals(165, RedOf(brownColor));
    AssertEquals(42, GreenOf(brownColor));
    AssertEquals(42, BlueOf(brownColor));
    AssertEquals(255, AlphaOf(brownColor));
end;
procedure TIntegrationTests.TestColorBurlyWoodIntegration;
begin
    burlyWoodColor := ColorBurlyWood();
    AssertEquals(222, RedOf(burlyWoodColor));
    AssertEquals(184, GreenOf(burlyWoodColor));
    AssertEquals(135, BlueOf(burlyWoodColor));
    AssertEquals(255, AlphaOf(burlyWoodColor));
end;
procedure TIntegrationTests.TestColorCadetBlueIntegration;
begin
    cadetBlueColor := ColorCadetBlue();
    AssertEquals(95, RedOf(cadetBlueColor));
    AssertEquals(158, GreenOf(cadetBlueColor));
    AssertEquals(160, BlueOf(cadetBlueColor));
    AssertEquals(255, AlphaOf(cadetBlueColor));
end;
procedure TIntegrationTests.TestColorChartreuseIntegration;
begin
    chartreuseColor := ColorChartreuse();
    AssertEquals(127, RedOf(chartreuseColor));
    AssertEquals(255, GreenOf(chartreuseColor));
    AssertEquals(0, BlueOf(chartreuseColor));
    AssertEquals(255, AlphaOf(chartreuseColor));
end;
procedure TIntegrationTests.TestColorChocolateIntegration;
begin
    chocolateColor := ColorChocolate();
    AssertEquals(210, RedOf(chocolateColor));
    AssertEquals(105, GreenOf(chocolateColor));
    AssertEquals(30, BlueOf(chocolateColor));
    AssertEquals(255, AlphaOf(chocolateColor));
end;
procedure TIntegrationTests.TestColorCoralIntegration;
begin
    coralColor := ColorCoral();
    AssertEquals(255, RedOf(coralColor));
    AssertEquals(127, GreenOf(coralColor));
    AssertEquals(80, BlueOf(coralColor));
    AssertEquals(255, AlphaOf(coralColor));
end;
procedure TIntegrationTests.TestColorCornflowerBlueIntegration;
begin
    cornflowerBlueColor := ColorCornflowerBlue();
    AssertEquals(100, RedOf(cornflowerBlueColor));
    AssertEquals(149, GreenOf(cornflowerBlueColor));
    AssertEquals(237, BlueOf(cornflowerBlueColor));
    AssertEquals(255, AlphaOf(cornflowerBlueColor));
end;
procedure TIntegrationTests.TestColorCornsilkIntegration;
begin
    cornsilkColor := ColorCornsilk();
    AssertEquals(255, RedOf(cornsilkColor));
    AssertEquals(248, GreenOf(cornsilkColor));
    AssertEquals(220, BlueOf(cornsilkColor));
    AssertEquals(255, AlphaOf(cornsilkColor));
end;
procedure TIntegrationTests.TestColorCrimsonIntegration;
begin
    crimsonColor := ColorCrimson();
    AssertEquals(220, RedOf(crimsonColor));
    AssertEquals(20, GreenOf(crimsonColor));
    AssertEquals(60, BlueOf(crimsonColor));
    AssertEquals(255, AlphaOf(crimsonColor));
end;
procedure TIntegrationTests.TestColorCyanIntegration;
begin
    cyanColor := ColorCyan();
    AssertEquals(0, RedOf(cyanColor));
    AssertEquals(255, GreenOf(cyanColor));
    AssertEquals(255, BlueOf(cyanColor));
    AssertEquals(255, AlphaOf(cyanColor));
end;
procedure TIntegrationTests.TestColorDarkBlueIntegration;
begin
    darkBlueColor := ColorDarkBlue();
    AssertEquals(0, RedOf(darkBlueColor));
    AssertEquals(0, GreenOf(darkBlueColor));
    AssertEquals(139, BlueOf(darkBlueColor));
    AssertEquals(255, AlphaOf(darkBlueColor));
end;
procedure TIntegrationTests.TestColorDarkCyanIntegration;
begin
    darkCyanColor := ColorDarkCyan();
    AssertEquals(0, RedOf(darkCyanColor));
    AssertEquals(139, GreenOf(darkCyanColor));
    AssertEquals(139, BlueOf(darkCyanColor));
    AssertEquals(255, AlphaOf(darkCyanColor));
end;
procedure TIntegrationTests.TestColorDarkGoldenrodIntegration;
begin
    darkGoldenrodColor := ColorDarkGoldenrod();
    AssertEquals(184, RedOf(darkGoldenrodColor));
    AssertEquals(134, GreenOf(darkGoldenrodColor));
    AssertEquals(11, BlueOf(darkGoldenrodColor));
    AssertEquals(255, AlphaOf(darkGoldenrodColor));
end;
procedure TIntegrationTests.TestColorDarkGrayIntegration;
begin
    darkGrayColor := ColorDarkGray();
    AssertEquals(169, RedOf(darkGrayColor));
    AssertEquals(169, GreenOf(darkGrayColor));
    AssertEquals(169, BlueOf(darkGrayColor));
    AssertEquals(255, AlphaOf(darkGrayColor));
end;
procedure TIntegrationTests.TestColorDarkGreenIntegration;
begin
    darkGreenColor := ColorDarkGreen();
    AssertEquals(0, RedOf(darkGreenColor));
    AssertEquals(100, GreenOf(darkGreenColor));
    AssertEquals(0, BlueOf(darkGreenColor));
    AssertEquals(255, AlphaOf(darkGreenColor));
end;
procedure TIntegrationTests.TestColorDarkKhakiIntegration;
begin
    darkKhakiColor := ColorDarkKhaki();
    AssertEquals(189, RedOf(darkKhakiColor));
    AssertEquals(183, GreenOf(darkKhakiColor));
    AssertEquals(107, BlueOf(darkKhakiColor));
    AssertEquals(255, AlphaOf(darkKhakiColor));
end;
procedure TIntegrationTests.TestColorDarkMagentaIntegration;
begin
    darkMagentaColor := ColorDarkMagenta();
    AssertEquals(139, RedOf(darkMagentaColor));
    AssertEquals(0, GreenOf(darkMagentaColor));
    AssertEquals(139, BlueOf(darkMagentaColor));
    AssertEquals(255, AlphaOf(darkMagentaColor));
end;
procedure TIntegrationTests.TestColorDarkOliveGreenIntegration;
begin
    darkOliveGreenColor := ColorDarkOliveGreen();
    AssertEquals(85, RedOf(darkOliveGreenColor));
    AssertEquals(107, GreenOf(darkOliveGreenColor));
    AssertEquals(47, BlueOf(darkOliveGreenColor));
    AssertEquals(255, AlphaOf(darkOliveGreenColor));
end;
procedure TIntegrationTests.TestColorDarkOrangeIntegration;
begin
    darkOrangeColor := ColorDarkOrange();
    AssertEquals(255, RedOf(darkOrangeColor));
    AssertEquals(140, GreenOf(darkOrangeColor));
    AssertEquals(0, BlueOf(darkOrangeColor));
    AssertEquals(255, AlphaOf(darkOrangeColor));
end;
procedure TIntegrationTests.TestColorDarkOrchidIntegration;
begin
    darkOrchidColor := ColorDarkOrchid();
    AssertEquals(153, RedOf(darkOrchidColor));
    AssertEquals(50, GreenOf(darkOrchidColor));
    AssertEquals(204, BlueOf(darkOrchidColor));
    AssertEquals(255, AlphaOf(darkOrchidColor));
end;
procedure TIntegrationTests.TestColorDarkRedIntegration;
begin
    darkRedColor := ColorDarkRed();
    AssertEquals(139, RedOf(darkRedColor));
    AssertEquals(0, GreenOf(darkRedColor));
    AssertEquals(0, BlueOf(darkRedColor));
    AssertEquals(255, AlphaOf(darkRedColor));
end;
procedure TIntegrationTests.TestColorDarkSalmonIntegration;
begin
    darkSalmonColor := ColorDarkSalmon();
    AssertEquals(233, RedOf(darkSalmonColor));
    AssertEquals(150, GreenOf(darkSalmonColor));
    AssertEquals(122, BlueOf(darkSalmonColor));
    AssertEquals(255, AlphaOf(darkSalmonColor));
end;
procedure TIntegrationTests.TestColorDarkSeaGreenIntegration;
begin
    darkSeaGreenColor := ColorDarkSeaGreen();
    AssertEquals(143, RedOf(darkSeaGreenColor));
    AssertEquals(188, GreenOf(darkSeaGreenColor));
    AssertEquals(139, BlueOf(darkSeaGreenColor));
    AssertEquals(255, AlphaOf(darkSeaGreenColor));
end;
procedure TIntegrationTests.TestColorDarkSlateBlueIntegration;
begin
    darkSlateBlueColor := ColorDarkSlateBlue();
    AssertEquals(72, RedOf(darkSlateBlueColor));
    AssertEquals(61, GreenOf(darkSlateBlueColor));
    AssertEquals(139, BlueOf(darkSlateBlueColor));
    AssertEquals(255, AlphaOf(darkSlateBlueColor));
end;
procedure TIntegrationTests.TestColorDarkSlateGrayIntegration;
begin
    darkSlateGrayColor := ColorDarkSlateGray();
    AssertEquals(47, RedOf(darkSlateGrayColor));
    AssertEquals(79, GreenOf(darkSlateGrayColor));
    AssertEquals(79, BlueOf(darkSlateGrayColor));
    AssertEquals(255, AlphaOf(darkSlateGrayColor));
end;
procedure TIntegrationTests.TestColorDarkTurquoiseIntegration;
begin
    darkTurquoiseColor := ColorDarkTurquoise();
    AssertEquals(0, RedOf(darkTurquoiseColor));
    AssertEquals(206, GreenOf(darkTurquoiseColor));
    AssertEquals(209, BlueOf(darkTurquoiseColor));
    AssertEquals(255, AlphaOf(darkTurquoiseColor));
end;
procedure TIntegrationTests.TestColorDarkVioletIntegration;
begin
    darkVioletColor := ColorDarkViolet();
    AssertEquals(148, RedOf(darkVioletColor));
    AssertEquals(0, GreenOf(darkVioletColor));
    AssertEquals(211, BlueOf(darkVioletColor));
    AssertEquals(255, AlphaOf(darkVioletColor));
end;
procedure TIntegrationTests.TestColorDeepPinkIntegration;
begin
    deepPinkColor := ColorDeepPink();
    AssertEquals(255, RedOf(deepPinkColor));
    AssertEquals(20, GreenOf(deepPinkColor));
    AssertEquals(147, BlueOf(deepPinkColor));
    AssertEquals(255, AlphaOf(deepPinkColor));
end;
procedure TIntegrationTests.TestColorDeepSkyBlueIntegration;
begin
    deepSkyBlueColor := ColorDeepSkyBlue();
    AssertEquals(0, RedOf(deepSkyBlueColor));
    AssertEquals(191, GreenOf(deepSkyBlueColor));
    AssertEquals(255, BlueOf(deepSkyBlueColor));
    AssertEquals(255, AlphaOf(deepSkyBlueColor));
end;
procedure TIntegrationTests.TestColorDimGrayIntegration;
begin
    dimGrayColor := ColorDimGray();
    AssertEquals(105, RedOf(dimGrayColor));
    AssertEquals(105, GreenOf(dimGrayColor));
    AssertEquals(105, BlueOf(dimGrayColor));
    AssertEquals(255, AlphaOf(dimGrayColor));
end;
procedure TIntegrationTests.TestColorDodgerBlueIntegration;
begin
    dodgerBlueColor := ColorDodgerBlue();
    AssertEquals(30, RedOf(dodgerBlueColor));
    AssertEquals(144, GreenOf(dodgerBlueColor));
    AssertEquals(255, BlueOf(dodgerBlueColor));
    AssertEquals(255, AlphaOf(dodgerBlueColor));
end;
procedure TIntegrationTests.TestColorFirebrickIntegration;
begin
    firebrickColor := ColorFirebrick();
    AssertEquals(178, RedOf(firebrickColor));
    AssertEquals(34, GreenOf(firebrickColor));
    AssertEquals(34, BlueOf(firebrickColor));
    AssertEquals(255, AlphaOf(firebrickColor));
end;
procedure TIntegrationTests.TestColorFloralWhiteIntegration;
begin
    floralWhiteColor := ColorFloralWhite();
    AssertEquals(255, RedOf(floralWhiteColor));
    AssertEquals(250, GreenOf(floralWhiteColor));
    AssertEquals(240, BlueOf(floralWhiteColor));
    AssertEquals(255, AlphaOf(floralWhiteColor));
end;
procedure TIntegrationTests.TestColorForestGreenIntegration;
begin
    forestGreenColor := ColorForestGreen();
    AssertEquals(34, RedOf(forestGreenColor));
    AssertEquals(139, GreenOf(forestGreenColor));
    AssertEquals(34, BlueOf(forestGreenColor));
    AssertEquals(255, AlphaOf(forestGreenColor));
end;
procedure TIntegrationTests.TestColorFuchsiaIntegration;
begin
    fuchsiaColor := ColorFuchsia();
    AssertEquals(255, RedOf(fuchsiaColor));
    AssertEquals(0, GreenOf(fuchsiaColor));
    AssertEquals(255, BlueOf(fuchsiaColor));
    AssertEquals(255, AlphaOf(fuchsiaColor));
end;
procedure TIntegrationTests.TestColorGainsboroIntegration;
begin
    gainsboroColor := ColorGainsboro();
    AssertEquals(220, RedOf(gainsboroColor));
    AssertEquals(220, GreenOf(gainsboroColor));
    AssertEquals(220, BlueOf(gainsboroColor));
    AssertEquals(255, AlphaOf(gainsboroColor));
end;
procedure TIntegrationTests.TestColorGhostWhiteIntegration;
begin
    ghostWhiteColor := ColorGhostWhite();
    AssertEquals(248, RedOf(ghostWhiteColor));
    AssertEquals(248, GreenOf(ghostWhiteColor));
    AssertEquals(255, BlueOf(ghostWhiteColor));
    AssertEquals(255, AlphaOf(ghostWhiteColor));
end;
procedure TIntegrationTests.TestColorGoldIntegration;
begin
    goldColor := ColorGold();
    AssertEquals(255, RedOf(goldColor));
    AssertEquals(215, GreenOf(goldColor));
    AssertEquals(0, BlueOf(goldColor));
    AssertEquals(255, AlphaOf(goldColor));
end;
procedure TIntegrationTests.TestColorGoldenrodIntegration;
begin
    goldenrodColor := ColorGoldenrod();
    AssertEquals(218, RedOf(goldenrodColor));
    AssertEquals(165, GreenOf(goldenrodColor));
    AssertEquals(32, BlueOf(goldenrodColor));
    AssertEquals(255, AlphaOf(goldenrodColor));
end;
procedure TIntegrationTests.TestColorGrayIntegration;
begin
    grayColor := ColorGray();
    AssertEquals(127, RedOf(grayColor));
    AssertEquals(127, GreenOf(grayColor));
    AssertEquals(127, BlueOf(grayColor));
    AssertEquals(255, AlphaOf(grayColor));
end;
procedure TIntegrationTests.TestColorGreenIntegration;
begin
    greenColor := ColorGreen();
    AssertEquals(0, RedOf(greenColor));
    AssertEquals(127, GreenOf(greenColor));
    AssertEquals(0, BlueOf(greenColor));
    AssertEquals(255, AlphaOf(greenColor));
end;
procedure TIntegrationTests.TestColorGreenYellowIntegration;
begin
    greenYellowColor := ColorGreenYellow();
    AssertEquals(173, RedOf(greenYellowColor));
    AssertEquals(255, GreenOf(greenYellowColor));
    AssertEquals(47, BlueOf(greenYellowColor));
    AssertEquals(255, AlphaOf(greenYellowColor));
end;
procedure TIntegrationTests.TestColorHoneydewIntegration;
begin
    honeydewColor := ColorHoneydew();
    AssertEquals(240, RedOf(honeydewColor));
    AssertEquals(255, GreenOf(honeydewColor));
    AssertEquals(240, BlueOf(honeydewColor));
    AssertEquals(255, AlphaOf(honeydewColor));
end;
procedure TIntegrationTests.TestColorHotPinkIntegration;
begin
    hotPinkColor := ColorHotPink();
    AssertEquals(255, RedOf(hotPinkColor));
    AssertEquals(105, GreenOf(hotPinkColor));
    AssertEquals(180, BlueOf(hotPinkColor));
    AssertEquals(255, AlphaOf(hotPinkColor));
end;
procedure TIntegrationTests.TestColorIndianRedIntegration;
begin
    indianRedColor := ColorIndianRed();
    AssertEquals(205, RedOf(indianRedColor));
    AssertEquals(92, GreenOf(indianRedColor));
    AssertEquals(92, BlueOf(indianRedColor));
    AssertEquals(255, AlphaOf(indianRedColor));
end;
procedure TIntegrationTests.TestColorIndigoIntegration;
begin
    indigoColor := ColorIndigo();
    AssertEquals(75, RedOf(indigoColor));
    AssertEquals(0, GreenOf(indigoColor));
    AssertEquals(130, BlueOf(indigoColor));
    AssertEquals(255, AlphaOf(indigoColor));
end;
procedure TIntegrationTests.TestColorIvoryIntegration;
begin
    ivoryColor := ColorIvory();
    AssertEquals(255, RedOf(ivoryColor));
    AssertEquals(255, GreenOf(ivoryColor));
    AssertEquals(240, BlueOf(ivoryColor));
    AssertEquals(255, AlphaOf(ivoryColor));
end;
procedure TIntegrationTests.TestColorKhakiIntegration;
begin
    khakiColor := ColorKhaki();
    AssertEquals(240, RedOf(khakiColor));
    AssertEquals(230, GreenOf(khakiColor));
    AssertEquals(140, BlueOf(khakiColor));
    AssertEquals(255, AlphaOf(khakiColor));
end;
procedure TIntegrationTests.TestColorLavenderIntegration;
begin
    lavenderColor := ColorLavender();
    AssertEquals(230, RedOf(lavenderColor));
    AssertEquals(230, GreenOf(lavenderColor));
    AssertEquals(250, BlueOf(lavenderColor));
    AssertEquals(255, AlphaOf(lavenderColor));
end;
procedure TIntegrationTests.TestColorLavenderBlushIntegration;
begin
    lavenderBlushColor := ColorLavenderBlush();
    AssertEquals(255, RedOf(lavenderBlushColor));
    AssertEquals(240, GreenOf(lavenderBlushColor));
    AssertEquals(245, BlueOf(lavenderBlushColor));
    AssertEquals(255, AlphaOf(lavenderBlushColor));
end;
procedure TIntegrationTests.TestColorLawnGreenIntegration;
begin
    lawnGreenColor := ColorLawnGreen();
    AssertEquals(124, RedOf(lawnGreenColor));
    AssertEquals(252, GreenOf(lawnGreenColor));
    AssertEquals(0, BlueOf(lawnGreenColor));
    AssertEquals(255, AlphaOf(lawnGreenColor));
end;
procedure TIntegrationTests.TestColorLemonChiffonIntegration;
begin
    lemonChiffonColor := ColorLemonChiffon();
    AssertEquals(255, RedOf(lemonChiffonColor));
    AssertEquals(250, GreenOf(lemonChiffonColor));
    AssertEquals(205, BlueOf(lemonChiffonColor));
    AssertEquals(255, AlphaOf(lemonChiffonColor));
end;
procedure TIntegrationTests.TestColorLightBlueIntegration;
begin
    lightBlueColor := ColorLightBlue();
    AssertEquals(173, RedOf(lightBlueColor));
    AssertEquals(216, GreenOf(lightBlueColor));
    AssertEquals(230, BlueOf(lightBlueColor));
    AssertEquals(255, AlphaOf(lightBlueColor));
end;
procedure TIntegrationTests.TestColorLightCoralIntegration;
begin
    lightCoralColor := ColorLightCoral();
    AssertEquals(240, RedOf(lightCoralColor));
    AssertEquals(127, GreenOf(lightCoralColor));
    AssertEquals(127, BlueOf(lightCoralColor));
    AssertEquals(255, AlphaOf(lightCoralColor));
end;
procedure TIntegrationTests.TestColorLightCyanIntegration;
begin
    lightCyanColor := ColorLightCyan();
    AssertEquals(224, RedOf(lightCyanColor));
    AssertEquals(255, GreenOf(lightCyanColor));
    AssertEquals(255, BlueOf(lightCyanColor));
    AssertEquals(255, AlphaOf(lightCyanColor));
end;
procedure TIntegrationTests.TestColorLightGoldenrodYellowIntegration;
begin
    lightGoldenrodYellowColor := ColorLightGoldenrodYellow();
    AssertEquals(250, RedOf(lightGoldenrodYellowColor));
    AssertEquals(250, GreenOf(lightGoldenrodYellowColor));
    AssertEquals(210, BlueOf(lightGoldenrodYellowColor));
    AssertEquals(255, AlphaOf(lightGoldenrodYellowColor));
end;
procedure TIntegrationTests.TestColorLightGrayIntegration;
begin
    lightGrayColor := ColorLightGray();
    AssertEquals(211, RedOf(lightGrayColor));
    AssertEquals(211, GreenOf(lightGrayColor));
    AssertEquals(211, BlueOf(lightGrayColor));
    AssertEquals(255, AlphaOf(lightGrayColor));
end;
procedure TIntegrationTests.TestColorLightGreenIntegration;
begin
    lightGreenColor := ColorLightGreen();
    AssertEquals(144, RedOf(lightGreenColor));
    AssertEquals(238, GreenOf(lightGreenColor));
    AssertEquals(144, BlueOf(lightGreenColor));
    AssertEquals(255, AlphaOf(lightGreenColor));
end;
procedure TIntegrationTests.TestColorLightPinkIntegration;
begin
    lightPinkColor := ColorLightPink();
    AssertEquals(255, RedOf(lightPinkColor));
    AssertEquals(182, GreenOf(lightPinkColor));
    AssertEquals(193, BlueOf(lightPinkColor));
    AssertEquals(255, AlphaOf(lightPinkColor));
end;
procedure TIntegrationTests.TestColorLightSalmonIntegration;
begin
    lightSalmonColor := ColorLightSalmon();
    AssertEquals(255, RedOf(lightSalmonColor));
    AssertEquals(160, GreenOf(lightSalmonColor));
    AssertEquals(122, BlueOf(lightSalmonColor));
    AssertEquals(255, AlphaOf(lightSalmonColor));
end;
procedure TIntegrationTests.TestColorLightSeaGreenIntegration;
begin
    lightSeaGreenColor := ColorLightSeaGreen();
    AssertEquals(32, RedOf(lightSeaGreenColor));
    AssertEquals(178, GreenOf(lightSeaGreenColor));
    AssertEquals(170, BlueOf(lightSeaGreenColor));
    AssertEquals(255, AlphaOf(lightSeaGreenColor));
end;
procedure TIntegrationTests.TestColorLightSkyBlueIntegration;
begin
    lightSkyBlueColor := ColorLightSkyBlue();
    AssertEquals(135, RedOf(lightSkyBlueColor));
    AssertEquals(206, GreenOf(lightSkyBlueColor));
    AssertEquals(250, BlueOf(lightSkyBlueColor));
    AssertEquals(255, AlphaOf(lightSkyBlueColor));
end;
procedure TIntegrationTests.TestColorLightSlateGrayIntegration;
begin
    lightSlateGrayColor := ColorLightSlateGray();
    AssertEquals(119, RedOf(lightSlateGrayColor));
    AssertEquals(136, GreenOf(lightSlateGrayColor));
    AssertEquals(153, BlueOf(lightSlateGrayColor));
    AssertEquals(255, AlphaOf(lightSlateGrayColor));
end;
procedure TIntegrationTests.TestColorLightSteelBlueIntegration;
begin
    lightSteelBlueColor := ColorLightSteelBlue();
    AssertEquals(176, RedOf(lightSteelBlueColor));
    AssertEquals(196, GreenOf(lightSteelBlueColor));
    AssertEquals(222, BlueOf(lightSteelBlueColor));
    AssertEquals(255, AlphaOf(lightSteelBlueColor));
end;
procedure TIntegrationTests.TestColorLightYellowIntegration;
begin
    lightYellowColor := ColorLightYellow();
    AssertEquals(255, RedOf(lightYellowColor));
    AssertEquals(255, GreenOf(lightYellowColor));
    AssertEquals(224, BlueOf(lightYellowColor));
    AssertEquals(255, AlphaOf(lightYellowColor));
end;
procedure TIntegrationTests.TestColorLimeIntegration;
begin
    limeColor := ColorLime();
    AssertEquals(0, RedOf(limeColor));
    AssertEquals(255, GreenOf(limeColor));
    AssertEquals(0, BlueOf(limeColor));
    AssertEquals(255, AlphaOf(limeColor));
end;
procedure TIntegrationTests.TestColorLimeGreenIntegration;
begin
    limeGreenColor := ColorLimeGreen();
    AssertEquals(50, RedOf(limeGreenColor));
    AssertEquals(205, GreenOf(limeGreenColor));
    AssertEquals(50, BlueOf(limeGreenColor));
    AssertEquals(255, AlphaOf(limeGreenColor));
end;
procedure TIntegrationTests.TestColorLinenIntegration;
begin
    linenColor := ColorLinen();
    AssertEquals(250, RedOf(linenColor));
    AssertEquals(240, GreenOf(linenColor));
    AssertEquals(230, BlueOf(linenColor));
    AssertEquals(255, AlphaOf(linenColor));
end;
procedure TIntegrationTests.TestColorMagentaIntegration;
begin
    magentaColor := ColorMagenta();
    AssertEquals(255, RedOf(magentaColor));
    AssertEquals(0, GreenOf(magentaColor));
    AssertEquals(255, BlueOf(magentaColor));
    AssertEquals(255, AlphaOf(magentaColor));
end;
procedure TIntegrationTests.TestColorMaroonIntegration;
begin
    maroonColor := ColorMaroon();
    AssertEquals(127, RedOf(maroonColor));
    AssertEquals(0, GreenOf(maroonColor));
    AssertEquals(0, BlueOf(maroonColor));
    AssertEquals(255, AlphaOf(maroonColor));
end;
procedure TIntegrationTests.TestColorMediumAquamarineIntegration;
begin
    mediumAquamarineColor := ColorMediumAquamarine();
    AssertEquals(102, RedOf(mediumAquamarineColor));
    AssertEquals(205, GreenOf(mediumAquamarineColor));
    AssertEquals(170, BlueOf(mediumAquamarineColor));
    AssertEquals(255, AlphaOf(mediumAquamarineColor));
end;
procedure TIntegrationTests.TestColorMediumBlueIntegration;
begin
    mediumBlueColor := ColorMediumBlue();
    AssertEquals(0, RedOf(mediumBlueColor));
    AssertEquals(0, GreenOf(mediumBlueColor));
    AssertEquals(205, BlueOf(mediumBlueColor));
    AssertEquals(255, AlphaOf(mediumBlueColor));
end;
procedure TIntegrationTests.TestColorMediumOrchidIntegration;
begin
    mediumOrchidColor := ColorMediumOrchid();
    AssertEquals(186, RedOf(mediumOrchidColor));
    AssertEquals(85, GreenOf(mediumOrchidColor));
    AssertEquals(211, BlueOf(mediumOrchidColor));
    AssertEquals(255, AlphaOf(mediumOrchidColor));
end;
procedure TIntegrationTests.TestColorMediumPurpleIntegration;
begin
    mediumPurpleColor := ColorMediumPurple();
    AssertEquals(147, RedOf(mediumPurpleColor));
    AssertEquals(112, GreenOf(mediumPurpleColor));
    AssertEquals(219, BlueOf(mediumPurpleColor));
    AssertEquals(255, AlphaOf(mediumPurpleColor));
end;
procedure TIntegrationTests.TestColorMediumSeaGreenIntegration;
begin
    mediumSeaGreenColor := ColorMediumSeaGreen();
    AssertEquals(60, RedOf(mediumSeaGreenColor));
    AssertEquals(179, GreenOf(mediumSeaGreenColor));
    AssertEquals(113, BlueOf(mediumSeaGreenColor));
    AssertEquals(255, AlphaOf(mediumSeaGreenColor));
end;
procedure TIntegrationTests.TestColorMediumSlateBlueIntegration;
begin
    mediumSlateBlueColor := ColorMediumSlateBlue();
    AssertEquals(123, RedOf(mediumSlateBlueColor));
    AssertEquals(104, GreenOf(mediumSlateBlueColor));
    AssertEquals(238, BlueOf(mediumSlateBlueColor));
    AssertEquals(255, AlphaOf(mediumSlateBlueColor));
end;
procedure TIntegrationTests.TestColorMediumSpringGreenIntegration;
begin
    mediumSpringGreenColor := ColorMediumSpringGreen();
    AssertEquals(0, RedOf(mediumSpringGreenColor));
    AssertEquals(250, GreenOf(mediumSpringGreenColor));
    AssertEquals(154, BlueOf(mediumSpringGreenColor));
    AssertEquals(255, AlphaOf(mediumSpringGreenColor));
end;
procedure TIntegrationTests.TestColorMediumTurquoiseIntegration;
begin
    mediumTurquoiseColor := ColorMediumTurquoise();
    AssertEquals(72, RedOf(mediumTurquoiseColor));
    AssertEquals(209, GreenOf(mediumTurquoiseColor));
    AssertEquals(204, BlueOf(mediumTurquoiseColor));
    AssertEquals(255, AlphaOf(mediumTurquoiseColor));
end;
procedure TIntegrationTests.TestColorMediumVioletRedIntegration;
begin
    mediumVioletRedColor := ColorMediumVioletRed();
    AssertEquals(199, RedOf(mediumVioletRedColor));
    AssertEquals(21, GreenOf(mediumVioletRedColor));
    AssertEquals(133, BlueOf(mediumVioletRedColor));
    AssertEquals(255, AlphaOf(mediumVioletRedColor));
end;
procedure TIntegrationTests.TestColorMidnightBlueIntegration;
begin
    midnightBlueColor := ColorMidnightBlue();
    AssertEquals(25, RedOf(midnightBlueColor));
    AssertEquals(25, GreenOf(midnightBlueColor));
    AssertEquals(112, BlueOf(midnightBlueColor));
    AssertEquals(255, AlphaOf(midnightBlueColor));
end;
procedure TIntegrationTests.TestColorMintCreamIntegration;
begin
    mintCreamColor := ColorMintCream();
    AssertEquals(245, RedOf(mintCreamColor));
    AssertEquals(255, GreenOf(mintCreamColor));
    AssertEquals(250, BlueOf(mintCreamColor));
    AssertEquals(255, AlphaOf(mintCreamColor));
end;
procedure TIntegrationTests.TestColorMistyRoseIntegration;
begin
    mistyRoseColor := ColorMistyRose();
    AssertEquals(255, RedOf(mistyRoseColor));
    AssertEquals(228, GreenOf(mistyRoseColor));
    AssertEquals(225, BlueOf(mistyRoseColor));
    AssertEquals(255, AlphaOf(mistyRoseColor));
end;
procedure TIntegrationTests.TestColorMoccasinIntegration;
begin
    moccasinColor := ColorMoccasin();
    AssertEquals(255, RedOf(moccasinColor));
    AssertEquals(228, GreenOf(moccasinColor));
    AssertEquals(181, BlueOf(moccasinColor));
    AssertEquals(255, AlphaOf(moccasinColor));
end;
procedure TIntegrationTests.TestColorNavajoWhiteIntegration;
begin
    navajoWhiteColor := ColorNavajoWhite();
    AssertEquals(255, RedOf(navajoWhiteColor));
    AssertEquals(222, GreenOf(navajoWhiteColor));
    AssertEquals(173, BlueOf(navajoWhiteColor));
    AssertEquals(255, AlphaOf(navajoWhiteColor));
end;
procedure TIntegrationTests.TestColorNavyIntegration;
begin
    navyColor := ColorNavy();
    AssertEquals(0, RedOf(navyColor));
    AssertEquals(0, GreenOf(navyColor));
    AssertEquals(127, BlueOf(navyColor));
    AssertEquals(255, AlphaOf(navyColor));
end;
procedure TIntegrationTests.TestColorOldLaceIntegration;
begin
    oldLaceColor := ColorOldLace();
    AssertEquals(253, RedOf(oldLaceColor));
    AssertEquals(245, GreenOf(oldLaceColor));
    AssertEquals(230, BlueOf(oldLaceColor));
    AssertEquals(255, AlphaOf(oldLaceColor));
end;
procedure TIntegrationTests.TestColorOliveIntegration;
begin
    oliveColor := ColorOlive();
    AssertEquals(127, RedOf(oliveColor));
    AssertEquals(127, GreenOf(oliveColor));
    AssertEquals(0, BlueOf(oliveColor));
    AssertEquals(255, AlphaOf(oliveColor));
end;
procedure TIntegrationTests.TestColorOliveDrabIntegration;
begin
    oliveDrabColor := ColorOliveDrab();
    AssertEquals(107, RedOf(oliveDrabColor));
    AssertEquals(142, GreenOf(oliveDrabColor));
    AssertEquals(35, BlueOf(oliveDrabColor));
    AssertEquals(255, AlphaOf(oliveDrabColor));
end;
procedure TIntegrationTests.TestColorOrangeIntegration;
begin
    orangeColor := ColorOrange();
    AssertEquals(255, RedOf(orangeColor));
    AssertEquals(165, GreenOf(orangeColor));
    AssertEquals(0, BlueOf(orangeColor));
    AssertEquals(255, AlphaOf(orangeColor));
end;
procedure TIntegrationTests.TestColorOrangeRedIntegration;
begin
    orangeRedColor := ColorOrangeRed();
    AssertEquals(255, RedOf(orangeRedColor));
    AssertEquals(69, GreenOf(orangeRedColor));
    AssertEquals(0, BlueOf(orangeRedColor));
    AssertEquals(255, AlphaOf(orangeRedColor));
end;
procedure TIntegrationTests.TestColorOrchidIntegration;
begin
    orchidColor := ColorOrchid();
    AssertEquals(218, RedOf(orchidColor));
    AssertEquals(112, GreenOf(orchidColor));
    AssertEquals(214, BlueOf(orchidColor));
    AssertEquals(255, AlphaOf(orchidColor));
end;
procedure TIntegrationTests.TestColorPaleGoldenrodIntegration;
begin
    paleGoldenrodColor := ColorPaleGoldenrod();
    AssertEquals(238, RedOf(paleGoldenrodColor));
    AssertEquals(232, GreenOf(paleGoldenrodColor));
    AssertEquals(170, BlueOf(paleGoldenrodColor));
    AssertEquals(255, AlphaOf(paleGoldenrodColor));
end;
procedure TIntegrationTests.TestColorPaleGreenIntegration;
begin
    paleGreenColor := ColorPaleGreen();
    AssertEquals(152, RedOf(paleGreenColor));
    AssertEquals(251, GreenOf(paleGreenColor));
    AssertEquals(152, BlueOf(paleGreenColor));
    AssertEquals(255, AlphaOf(paleGreenColor));
end;
procedure TIntegrationTests.TestColorPaleTurquoiseIntegration;
begin
    paleTurquoiseColor := ColorPaleTurquoise();
    AssertEquals(175, RedOf(paleTurquoiseColor));
    AssertEquals(238, GreenOf(paleTurquoiseColor));
    AssertEquals(238, BlueOf(paleTurquoiseColor));
    AssertEquals(255, AlphaOf(paleTurquoiseColor));
end;
procedure TIntegrationTests.TestColorPaleVioletRedIntegration;
begin
    paleVioletRedColor := ColorPaleVioletRed();
    AssertEquals(219, RedOf(paleVioletRedColor));
    AssertEquals(112, GreenOf(paleVioletRedColor));
    AssertEquals(147, BlueOf(paleVioletRedColor));
    AssertEquals(255, AlphaOf(paleVioletRedColor));
end;
procedure TIntegrationTests.TestColorPapayaWhipIntegration;
begin
    papayaWhipColor := ColorPapayaWhip();
    AssertEquals(255, RedOf(papayaWhipColor));
    AssertEquals(239, GreenOf(papayaWhipColor));
    AssertEquals(213, BlueOf(papayaWhipColor));
    AssertEquals(255, AlphaOf(papayaWhipColor));
end;
procedure TIntegrationTests.TestColorPeachPuffIntegration;
begin
    peachPuffColor := ColorPeachPuff();
    AssertEquals(255, RedOf(peachPuffColor));
    AssertEquals(218, GreenOf(peachPuffColor));
    AssertEquals(185, BlueOf(peachPuffColor));
    AssertEquals(255, AlphaOf(peachPuffColor));
end;
procedure TIntegrationTests.TestColorPeruIntegration;
begin
    peruColor := ColorPeru();
    AssertEquals(205, RedOf(peruColor));
    AssertEquals(133, GreenOf(peruColor));
    AssertEquals(63, BlueOf(peruColor));
    AssertEquals(255, AlphaOf(peruColor));
end;
procedure TIntegrationTests.TestColorPinkIntegration;
begin
    pinkColor := ColorPink();
    AssertEquals(255, RedOf(pinkColor));
    AssertEquals(192, GreenOf(pinkColor));
    AssertEquals(203, BlueOf(pinkColor));
    AssertEquals(255, AlphaOf(pinkColor));
end;
procedure TIntegrationTests.TestColorPlumIntegration;
begin
    plumColor := ColorPlum();
    AssertEquals(221, RedOf(plumColor));
    AssertEquals(160, GreenOf(plumColor));
    AssertEquals(221, BlueOf(plumColor));
    AssertEquals(255, AlphaOf(plumColor));
end;
procedure TIntegrationTests.TestColorPowderBlueIntegration;
begin
    powderBlueColor := ColorPowderBlue();
    AssertEquals(176, RedOf(powderBlueColor));
    AssertEquals(224, GreenOf(powderBlueColor));
    AssertEquals(230, BlueOf(powderBlueColor));
    AssertEquals(255, AlphaOf(powderBlueColor));
end;
procedure TIntegrationTests.TestColorPurpleIntegration;
begin
    purpleColor := ColorPurple();
    AssertEquals(127, RedOf(purpleColor));
    AssertEquals(0, GreenOf(purpleColor));
    AssertEquals(127, BlueOf(purpleColor));
    AssertEquals(255, AlphaOf(purpleColor));
end;
procedure TIntegrationTests.TestColorRedIntegration;
begin
    redColor := ColorRed();
    AssertEquals(255, RedOf(redColor));
    AssertEquals(0, GreenOf(redColor));
    AssertEquals(0, BlueOf(redColor));
    AssertEquals(255, AlphaOf(redColor));
end;
procedure TIntegrationTests.TestColorRosyBrownIntegration;
begin
    rosyBrownColor := ColorRosyBrown();
    AssertEquals(188, RedOf(rosyBrownColor));
    AssertEquals(143, GreenOf(rosyBrownColor));
    AssertEquals(143, BlueOf(rosyBrownColor));
    AssertEquals(255, AlphaOf(rosyBrownColor));
end;
procedure TIntegrationTests.TestColorRoyalBlueIntegration;
begin
    royalBlueColor := ColorRoyalBlue();
    AssertEquals(65, RedOf(royalBlueColor));
    AssertEquals(105, GreenOf(royalBlueColor));
    AssertEquals(225, BlueOf(royalBlueColor));
    AssertEquals(255, AlphaOf(royalBlueColor));
end;
procedure TIntegrationTests.TestColorSaddleBrownIntegration;
begin
    saddleBrownColor := ColorSaddleBrown();
    AssertEquals(139, RedOf(saddleBrownColor));
    AssertEquals(69, GreenOf(saddleBrownColor));
    AssertEquals(19, BlueOf(saddleBrownColor));
    AssertEquals(255, AlphaOf(saddleBrownColor));
end;
procedure TIntegrationTests.TestColorSalmonIntegration;
begin
    salmonColor := ColorSalmon();
    AssertEquals(250, RedOf(salmonColor));
    AssertEquals(127, GreenOf(salmonColor));
    AssertEquals(114, BlueOf(salmonColor));
    AssertEquals(255, AlphaOf(salmonColor));
end;
procedure TIntegrationTests.TestColorSandyBrownIntegration;
begin
    sandyBrownColor := ColorSandyBrown();
    AssertEquals(244, RedOf(sandyBrownColor));
    AssertEquals(164, GreenOf(sandyBrownColor));
    AssertEquals(96, BlueOf(sandyBrownColor));
    AssertEquals(255, AlphaOf(sandyBrownColor));
end;
procedure TIntegrationTests.TestColorSeaGreenIntegration;
begin
    seaGreenColor := ColorSeaGreen();
    AssertEquals(46, RedOf(seaGreenColor));
    AssertEquals(139, GreenOf(seaGreenColor));
    AssertEquals(87, BlueOf(seaGreenColor));
    AssertEquals(255, AlphaOf(seaGreenColor));
end;
procedure TIntegrationTests.TestColorSeaShellIntegration;
begin
    seaShellColor := ColorSeaShell();
    AssertEquals(255, RedOf(seaShellColor));
    AssertEquals(245, GreenOf(seaShellColor));
    AssertEquals(238, BlueOf(seaShellColor));
    AssertEquals(255, AlphaOf(seaShellColor));
end;
procedure TIntegrationTests.TestColorSiennaIntegration;
begin
    siennaColor := ColorSienna();
    AssertEquals(160, RedOf(siennaColor));
    AssertEquals(82, GreenOf(siennaColor));
    AssertEquals(45, BlueOf(siennaColor));
    AssertEquals(255, AlphaOf(siennaColor));
end;
procedure TIntegrationTests.TestColorSilverIntegration;
begin
    silverColor := ColorSilver();
    AssertEquals(192, RedOf(silverColor));
    AssertEquals(192, GreenOf(silverColor));
    AssertEquals(192, BlueOf(silverColor));
    AssertEquals(255, AlphaOf(silverColor));
end;
procedure TIntegrationTests.TestColorSkyBlueIntegration;
begin
    skyBlueColor := ColorSkyBlue();
    AssertEquals(135, RedOf(skyBlueColor));
    AssertEquals(206, GreenOf(skyBlueColor));
    AssertEquals(235, BlueOf(skyBlueColor));
    AssertEquals(255, AlphaOf(skyBlueColor));
end;
procedure TIntegrationTests.TestColorSlateBlueIntegration;
begin
    slateBlueColor := ColorSlateBlue();
    AssertEquals(106, RedOf(slateBlueColor));
    AssertEquals(90, GreenOf(slateBlueColor));
    AssertEquals(205, BlueOf(slateBlueColor));
    AssertEquals(255, AlphaOf(slateBlueColor));
end;
procedure TIntegrationTests.TestColorSlateGrayIntegration;
begin
    slateGrayColor := ColorSlateGray();
    AssertEquals(112, RedOf(slateGrayColor));
    AssertEquals(127, GreenOf(slateGrayColor));
    AssertEquals(144, BlueOf(slateGrayColor));
    AssertEquals(255, AlphaOf(slateGrayColor));
end;
procedure TIntegrationTests.TestColorSnowIntegration;
begin
    snowColor := ColorSnow();
    AssertEquals(255, RedOf(snowColor));
    AssertEquals(250, GreenOf(snowColor));
    AssertEquals(250, BlueOf(snowColor));
    AssertEquals(255, AlphaOf(snowColor));
end;
procedure TIntegrationTests.TestColorSpringGreenIntegration;
begin
    springGreenColor := ColorSpringGreen();
    AssertEquals(0, RedOf(springGreenColor));
    AssertEquals(255, GreenOf(springGreenColor));
    AssertEquals(127, BlueOf(springGreenColor));
    AssertEquals(255, AlphaOf(springGreenColor));
end;
procedure TIntegrationTests.TestColorSteelBlueIntegration;
begin
    steelBlueColor := ColorSteelBlue();
    AssertEquals(70, RedOf(steelBlueColor));
    AssertEquals(130, GreenOf(steelBlueColor));
    AssertEquals(180, BlueOf(steelBlueColor));
    AssertEquals(255, AlphaOf(steelBlueColor));
end;
procedure TIntegrationTests.TestColorSwinburneRedIntegration;
begin
    swinburneRedColor := ColorSwinburneRed();
    AssertEquals(237, RedOf(swinburneRedColor));
    AssertEquals(36, GreenOf(swinburneRedColor));
    AssertEquals(25, BlueOf(swinburneRedColor));
    AssertEquals(255, AlphaOf(swinburneRedColor));
end;
procedure TIntegrationTests.TestColorTanIntegration;
begin
    tanColor := ColorTan();
    AssertEquals(210, RedOf(tanColor));
    AssertEquals(180, GreenOf(tanColor));
    AssertEquals(140, BlueOf(tanColor));
    AssertEquals(255, AlphaOf(tanColor));
end;
procedure TIntegrationTests.TestColorTealIntegration;
begin
    tealColor := ColorTeal();
    AssertEquals(0, RedOf(tealColor));
    AssertEquals(127, GreenOf(tealColor));
    AssertEquals(127, BlueOf(tealColor));
    AssertEquals(255, AlphaOf(tealColor));
end;
procedure TIntegrationTests.TestColorThistleIntegration;
begin
    thistleColor := ColorThistle();
    AssertEquals(216, RedOf(thistleColor));
    AssertEquals(191, GreenOf(thistleColor));
    AssertEquals(216, BlueOf(thistleColor));
    AssertEquals(255, AlphaOf(thistleColor));
end;
procedure TIntegrationTests.TestColorToStringIntegration;
begin
    redColor := ColorRed();
    redColorString := ColorToString(redColor);
    AssertEquals('#ff0000ff', redColorString);
    transparentColor := ColorTransparent();
    transparentColorString := ColorToString(transparentColor);
    AssertEquals('#ffffffff', transparentColorString);
end;
procedure TIntegrationTests.TestColorTomatoIntegration;
begin
    tomatoColor := ColorTomato();
    AssertEquals(255, RedOf(tomatoColor));
    AssertEquals(99, GreenOf(tomatoColor));
    AssertEquals(71, BlueOf(tomatoColor));
    AssertEquals(255, AlphaOf(tomatoColor));
end;
procedure TIntegrationTests.TestColorTransparentIntegration;
begin
    transparentColor := ColorTransparent();
    AssertEquals(255, AlphaOf(transparentColor));
    AssertEquals(255, RedOf(transparentColor));
    AssertEquals(255, GreenOf(transparentColor));
    AssertEquals(255, BlueOf(transparentColor));
end;
procedure TIntegrationTests.TestColorTurquoiseIntegration;
begin
    turquoiseColor := ColorTurquoise();
    AssertEquals(64, RedOf(turquoiseColor));
    AssertEquals(224, GreenOf(turquoiseColor));
    AssertEquals(208, BlueOf(turquoiseColor));
    AssertEquals(255, AlphaOf(turquoiseColor));
end;
procedure TIntegrationTests.TestColorVioletIntegration;
begin
    violetColor := ColorViolet();
    AssertEquals(238, RedOf(violetColor));
    AssertEquals(130, GreenOf(violetColor));
    AssertEquals(238, BlueOf(violetColor));
    AssertEquals(255, AlphaOf(violetColor));
end;
procedure TIntegrationTests.TestColorWheatIntegration;
begin
    wheatColor := ColorWheat();
    AssertEquals(245, RedOf(wheatColor));
    AssertEquals(222, GreenOf(wheatColor));
    AssertEquals(179, BlueOf(wheatColor));
    AssertEquals(255, AlphaOf(wheatColor));
end;
procedure TIntegrationTests.TestColorWhiteIntegration;
begin
    whiteColor := ColorWhite();
    AssertEquals(255, RedOf(whiteColor));
    AssertEquals(255, GreenOf(whiteColor));
    AssertEquals(255, BlueOf(whiteColor));
    AssertEquals(255, AlphaOf(whiteColor));
end;
procedure TIntegrationTests.TestColorWhiteSmokeIntegration;
begin
    whiteSmokeColor := ColorWhiteSmoke();
    AssertEquals(245, RedOf(whiteSmokeColor));
    AssertEquals(245, GreenOf(whiteSmokeColor));
    AssertEquals(245, BlueOf(whiteSmokeColor));
    AssertEquals(255, AlphaOf(whiteSmokeColor));
end;
procedure TIntegrationTests.TestColorYellowIntegration;
begin
    yellowColor := ColorYellow();
    AssertEquals(255, RedOf(yellowColor));
    AssertEquals(255, GreenOf(yellowColor));
    AssertEquals(0, BlueOf(yellowColor));
    AssertEquals(255, AlphaOf(yellowColor));
end;
procedure TIntegrationTests.TestColorYellowGreenIntegration;
begin
    yellowGreenColor := ColorYellowGreen();
    AssertEquals(154, RedOf(yellowGreenColor));
    AssertEquals(205, GreenOf(yellowGreenColor));
    AssertEquals(50, BlueOf(yellowGreenColor));
    AssertEquals(255, AlphaOf(yellowGreenColor));
end;
procedure TIntegrationTests.TestGreenOfIntegration;
begin
    greenColor := ColorGreen();
    greenValue := GreenOf(greenColor);
    AssertEquals(127, greenValue);
    blackColor := ColorBlack();
    blackGreenValue := GreenOf(blackColor);
    AssertEquals(0, blackGreenValue);
end;
procedure TIntegrationTests.TestHSBColorIntegration;
begin
    redColor := HSBColor(0.0, 1.0, 1.0);
    AssertEquals(0.0, HueOf(redColor));
    AssertEquals(1.0, SaturationOf(redColor));
    AssertEquals(1.0, BrightnessOf(redColor));
    grayColor := HSBColor(0.5, 0.0, 0.5);
    AssertEquals(0.0, SaturationOf(grayColor));
end;
procedure TIntegrationTests.TestHueOfIntegration;
begin
    redColor := ColorRed();
    hueValue := HueOf(redColor);
    AssertEquals(0.0, hueValue);
    blueColor := ColorBlue();
    hueValueBlue := HueOf(blueColor);
    AssertEquals(0.6666666666666666, hueValueBlue);
end;
procedure TIntegrationTests.TestRandomColorIntegration;
begin
    randomColorResult := RandomColor();
    AssertNotEquals('#000000FF', ColorToString(randomColorResult));
    AssertTrue((AlphaOf(randomColorResult) >= 0) and (AlphaOf(randomColorResult) <= 255));
end;
procedure TIntegrationTests.TestRandomRGBColorIntegration;
begin
    randomColor := RandomRGBColor(255);
    AssertTrue((RedOf(randomColor) >= 0) and (RedOf(randomColor) <= 255));
    AssertTrue((GreenOf(randomColor) >= 0) and (GreenOf(randomColor) <= 255));
    AssertTrue((BlueOf(randomColor) >= 0) and (BlueOf(randomColor) <= 255));
    AssertEquals(255, AlphaOf(randomColor));
end;
procedure TIntegrationTests.TestRedOfIntegration;
begin
    redColor := ColorRed();
    redValue := RedOf(redColor);
    AssertEquals(255, redValue);
    blueColor := ColorBlue();
    blueRedValue := RedOf(blueColor);
    AssertEquals(0, blueRedValue);
end;
procedure TIntegrationTests.TestRGBColorFromDoubleIntegration;
begin
    redColor := RGBColor(1.0, 0.0, 0.0);
    AssertEquals(255, RedOf(redColor));
    AssertEquals(0, GreenOf(redColor));
    AssertEquals(0, BlueOf(redColor));
    greenColor := RGBColor(0.0, 1.0, 0.0);
    AssertEquals(0, RedOf(greenColor));
    AssertEquals(255, GreenOf(greenColor));
    AssertEquals(0, BlueOf(greenColor));
end;
procedure TIntegrationTests.TestRGBColorIntegration;
begin
    redColor := RGBColor(255, 0, 0);
    AssertEquals(255, RedOf(redColor));
    AssertEquals(0, GreenOf(redColor));
    AssertEquals(0, BlueOf(redColor));
    AssertEquals(255, AlphaOf(redColor));
end;
procedure TIntegrationTests.TestRGBAColorFromDoubleIntegration;
begin
    testColor := RGBAColor(1.0, 0.5, 0.0, 0.75);
    AssertEquals(255, RedOf(testColor));
    AssertEquals(127, GreenOf(testColor));
    AssertEquals(0, BlueOf(testColor));
    AssertEquals(191, AlphaOf(testColor));
end;
procedure TIntegrationTests.TestRGBAColorIntegration;
begin
    redColor := RGBAColor(255, 0, 0, 255);
    AssertEquals(255, RedOf(redColor));
    AssertEquals(0, GreenOf(redColor));
    AssertEquals(0, BlueOf(redColor));
    AssertEquals(255, AlphaOf(redColor));
end;
procedure TIntegrationTests.TestSaturationOfIntegration;
begin
    redColor := ColorRed();
    saturationValue := SaturationOf(redColor);
    AssertEquals(1.0, saturationValue);
    grayColor := ColorGray();
    saturationValueGray := SaturationOf(grayColor);
    AssertEquals(0.0, saturationValueGray);
end;
procedure TIntegrationTests.TestStringToColorIntegration;
begin
    redColor := StringToColor('#FF0000FF');
    AssertEquals(255, RedOf(redColor));
    AssertEquals(0, GreenOf(redColor));
    AssertEquals(0, BlueOf(redColor));
    AssertEquals(255, AlphaOf(redColor));
    greenColor := StringToColor('#00FF00FF');
    AssertEquals(0, RedOf(greenColor));
    AssertEquals(255, GreenOf(greenColor));
    AssertEquals(0, BlueOf(greenColor));
    AssertEquals(255, AlphaOf(greenColor));
end;
end;

procedure RegisterTests;
begin
#<Proc:0x00007f20a9d04780 /mnt/c/Users/Noahc/Documents/.Year 2 Semester 3/Team Project (A)/Github Repo/splashkit_test_generator/test_generator/config/languages/pascal_config.rb:128 (lambda)>
end;
