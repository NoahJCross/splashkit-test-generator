uses SplashKit, TestFramework

type
TIntegrationTests = class(TTestCase)
published
procedure TIntegrationTests.TestAlphaOfIntegration;
begin
    redColor := ColorRed();
    alphaValue := AlphaOf(redColor);
    AssertEquals(alphaValue, 255);
    transparentColor := ColorTransparent();
    alphaValueTransparent := AlphaOf(transparentColor);
    AssertEquals(alphaValueTransparent, 255);
end;
procedure TIntegrationTests.TestBlueOfIntegration;
begin
    blueColor := ColorBlue();
    blueValue := BlueOf(blueColor);
    AssertEquals(blueValue, 255);
    redColor := ColorRed();
    blueValueRed := BlueOf(redColor);
    AssertEquals(blueValueRed, 0);
end;
procedure TIntegrationTests.TestBrightnessOfIntegration;
begin
    whiteColor := ColorWhite();
    whiteBrightness := BrightnessOf(whiteColor);
    AssertEquals(whiteBrightness, 1.0);
    blackColor := ColorBlack();
    blackBrightness := BrightnessOf(blackColor);
    AssertEquals(blackBrightness, 0.0);
    grayColor := ColorGray();
    grayBrightness := BrightnessOf(grayColor);
    AssertTrue((grayBrightness >= 0.4) and (grayBrightness <= 0.6));
end;
procedure TIntegrationTests.TestColorAliceBlueIntegration;
begin
    aliceBlueColor := ColorAliceBlue();
    AssertEquals(RedOf(aliceBlueColor), 240);
    AssertEquals(GreenOf(aliceBlueColor), 248);
    AssertEquals(BlueOf(aliceBlueColor), 255);
    AssertEquals(AlphaOf(aliceBlueColor), 255);
end;
procedure TIntegrationTests.TestColorAntiqueWhiteIntegration;
begin
    antiqueWhiteColor := ColorAntiqueWhite();
    AssertEquals(RedOf(antiqueWhiteColor), 250);
    AssertEquals(GreenOf(antiqueWhiteColor), 235);
    AssertEquals(BlueOf(antiqueWhiteColor), 215);
    AssertEquals(AlphaOf(antiqueWhiteColor), 255);
end;
procedure TIntegrationTests.TestColorAquaIntegration;
begin
    aquaColor := ColorAqua();
    AssertEquals(RedOf(aquaColor), 0);
    AssertEquals(GreenOf(aquaColor), 255);
    AssertEquals(BlueOf(aquaColor), 255);
    AssertEquals(AlphaOf(aquaColor), 255);
end;
procedure TIntegrationTests.TestColorAquamarineIntegration;
begin
    aquamarineColor := ColorAquamarine();
    AssertEquals(RedOf(aquamarineColor), 127);
    AssertEquals(GreenOf(aquamarineColor), 255);
    AssertEquals(BlueOf(aquamarineColor), 212);
    AssertEquals(AlphaOf(aquamarineColor), 255);
end;
procedure TIntegrationTests.TestColorAzureIntegration;
begin
    azureColor := ColorAzure();
    AssertEquals(RedOf(azureColor), 240);
    AssertEquals(GreenOf(azureColor), 255);
    AssertEquals(BlueOf(azureColor), 255);
    AssertEquals(AlphaOf(azureColor), 255);
end;
procedure TIntegrationTests.TestColorBeigeIntegration;
begin
    beigeColor := ColorBeige();
    AssertEquals(RedOf(beigeColor), 245);
    AssertEquals(GreenOf(beigeColor), 245);
    AssertEquals(BlueOf(beigeColor), 220);
    AssertEquals(AlphaOf(beigeColor), 255);
end;
procedure TIntegrationTests.TestColorBisqueIntegration;
begin
    bisqueColor := ColorBisque();
    AssertEquals(RedOf(bisqueColor), 255);
    AssertEquals(GreenOf(bisqueColor), 228);
    AssertEquals(BlueOf(bisqueColor), 196);
    AssertEquals(AlphaOf(bisqueColor), 255);
end;
procedure TIntegrationTests.TestColorBlackIntegration;
begin
    blackColor := ColorBlack();
    AssertEquals(RedOf(blackColor), 0);
    AssertEquals(GreenOf(blackColor), 0);
    AssertEquals(BlueOf(blackColor), 0);
    AssertEquals(AlphaOf(blackColor), 255);
end;
procedure TIntegrationTests.TestColorBlanchedAlmondIntegration;
begin
    blanchedAlmondColor := ColorBlanchedAlmond();
    AssertEquals(RedOf(blanchedAlmondColor), 255);
    AssertEquals(GreenOf(blanchedAlmondColor), 235);
    AssertEquals(BlueOf(blanchedAlmondColor), 205);
    AssertEquals(AlphaOf(blanchedAlmondColor), 255);
end;
procedure TIntegrationTests.TestColorBlueIntegration;
begin
    blueColor := ColorBlue();
    AssertEquals(RedOf(blueColor), 0);
    AssertEquals(GreenOf(blueColor), 0);
    AssertEquals(BlueOf(blueColor), 255);
    AssertEquals(AlphaOf(blueColor), 255);
end;
procedure TIntegrationTests.TestColorBlueVioletIntegration;
begin
    blueVioletColor := ColorBlueViolet();
    AssertEquals(RedOf(blueVioletColor), 138);
    AssertEquals(GreenOf(blueVioletColor), 43);
    AssertEquals(BlueOf(blueVioletColor), 226);
    AssertEquals(AlphaOf(blueVioletColor), 255);
end;
procedure TIntegrationTests.TestColorBrightGreenIntegration;
begin
    brightGreenColor := ColorBrightGreen();
    AssertEquals(RedOf(brightGreenColor), 0);
    AssertEquals(GreenOf(brightGreenColor), 255);
    AssertEquals(BlueOf(brightGreenColor), 0);
    AssertEquals(AlphaOf(brightGreenColor), 255);
end;
procedure TIntegrationTests.TestColorBrownIntegration;
begin
    brownColor := ColorBrown();
    AssertEquals(RedOf(brownColor), 165);
    AssertEquals(GreenOf(brownColor), 42);
    AssertEquals(BlueOf(brownColor), 42);
    AssertEquals(AlphaOf(brownColor), 255);
end;
procedure TIntegrationTests.TestColorBurlyWoodIntegration;
begin
    burlyWoodColor := ColorBurlyWood();
    AssertEquals(RedOf(burlyWoodColor), 222);
    AssertEquals(GreenOf(burlyWoodColor), 184);
    AssertEquals(BlueOf(burlyWoodColor), 135);
    AssertEquals(AlphaOf(burlyWoodColor), 255);
end;
procedure TIntegrationTests.TestColorCadetBlueIntegration;
begin
    cadetBlueColor := ColorCadetBlue();
    AssertEquals(RedOf(cadetBlueColor), 95);
    AssertEquals(GreenOf(cadetBlueColor), 158);
    AssertEquals(BlueOf(cadetBlueColor), 160);
    AssertEquals(AlphaOf(cadetBlueColor), 255);
end;
procedure TIntegrationTests.TestColorChartreuseIntegration;
begin
    chartreuseColor := ColorChartreuse();
    AssertEquals(RedOf(chartreuseColor), 127);
    AssertEquals(GreenOf(chartreuseColor), 255);
    AssertEquals(BlueOf(chartreuseColor), 0);
    AssertEquals(AlphaOf(chartreuseColor), 255);
end;
procedure TIntegrationTests.TestColorChocolateIntegration;
begin
    chocolateColor := ColorChocolate();
    AssertEquals(RedOf(chocolateColor), 210);
    AssertEquals(GreenOf(chocolateColor), 105);
    AssertEquals(BlueOf(chocolateColor), 30);
    AssertEquals(AlphaOf(chocolateColor), 255);
end;
procedure TIntegrationTests.TestColorCoralIntegration;
begin
    coralColor := ColorCoral();
    AssertEquals(RedOf(coralColor), 255);
    AssertEquals(GreenOf(coralColor), 127);
    AssertEquals(BlueOf(coralColor), 80);
    AssertEquals(AlphaOf(coralColor), 255);
end;
procedure TIntegrationTests.TestColorCornflowerBlueIntegration;
begin
    cornflowerBlueColor := ColorCornflowerBlue();
    AssertEquals(RedOf(cornflowerBlueColor), 100);
    AssertEquals(GreenOf(cornflowerBlueColor), 149);
    AssertEquals(BlueOf(cornflowerBlueColor), 237);
    AssertEquals(AlphaOf(cornflowerBlueColor), 255);
end;
procedure TIntegrationTests.TestColorCornsilkIntegration;
begin
    cornsilkColor := ColorCornsilk();
    AssertEquals(RedOf(cornsilkColor), 255);
    AssertEquals(GreenOf(cornsilkColor), 248);
    AssertEquals(BlueOf(cornsilkColor), 220);
    AssertEquals(AlphaOf(cornsilkColor), 255);
end;
procedure TIntegrationTests.TestColorCrimsonIntegration;
begin
    crimsonColor := ColorCrimson();
    AssertEquals(RedOf(crimsonColor), 220);
    AssertEquals(GreenOf(crimsonColor), 20);
    AssertEquals(BlueOf(crimsonColor), 60);
    AssertEquals(AlphaOf(crimsonColor), 255);
end;
procedure TIntegrationTests.TestColorCyanIntegration;
begin
    cyanColor := ColorCyan();
    AssertEquals(RedOf(cyanColor), 0);
    AssertEquals(GreenOf(cyanColor), 255);
    AssertEquals(BlueOf(cyanColor), 255);
    AssertEquals(AlphaOf(cyanColor), 255);
end;
procedure TIntegrationTests.TestColorDarkBlueIntegration;
begin
    darkBlueColor := ColorDarkBlue();
    AssertEquals(RedOf(darkBlueColor), 0);
    AssertEquals(GreenOf(darkBlueColor), 0);
    AssertEquals(BlueOf(darkBlueColor), 139);
    AssertEquals(AlphaOf(darkBlueColor), 255);
end;
procedure TIntegrationTests.TestColorDarkCyanIntegration;
begin
    darkCyanColor := ColorDarkCyan();
    AssertEquals(RedOf(darkCyanColor), 0);
    AssertEquals(GreenOf(darkCyanColor), 139);
    AssertEquals(BlueOf(darkCyanColor), 139);
    AssertEquals(AlphaOf(darkCyanColor), 255);
end;
procedure TIntegrationTests.TestColorDarkGoldenrodIntegration;
begin
    darkGoldenrodColor := ColorDarkGoldenrod();
    AssertEquals(RedOf(darkGoldenrodColor), 184);
    AssertEquals(GreenOf(darkGoldenrodColor), 134);
    AssertEquals(BlueOf(darkGoldenrodColor), 11);
    AssertEquals(AlphaOf(darkGoldenrodColor), 255);
end;
procedure TIntegrationTests.TestColorDarkGrayIntegration;
begin
    darkGrayColor := ColorDarkGray();
    AssertEquals(RedOf(darkGrayColor), 169);
    AssertEquals(GreenOf(darkGrayColor), 169);
    AssertEquals(BlueOf(darkGrayColor), 169);
    AssertEquals(AlphaOf(darkGrayColor), 255);
end;
procedure TIntegrationTests.TestColorDarkGreenIntegration;
begin
    darkGreenColor := ColorDarkGreen();
    AssertEquals(RedOf(darkGreenColor), 0);
    AssertEquals(GreenOf(darkGreenColor), 100);
    AssertEquals(BlueOf(darkGreenColor), 0);
    AssertEquals(AlphaOf(darkGreenColor), 255);
end;
procedure TIntegrationTests.TestColorDarkKhakiIntegration;
begin
    darkKhakiColor := ColorDarkKhaki();
    AssertEquals(RedOf(darkKhakiColor), 189);
    AssertEquals(GreenOf(darkKhakiColor), 183);
    AssertEquals(BlueOf(darkKhakiColor), 107);
    AssertEquals(AlphaOf(darkKhakiColor), 255);
end;
procedure TIntegrationTests.TestColorDarkMagentaIntegration;
begin
    darkMagentaColor := ColorDarkMagenta();
    AssertEquals(RedOf(darkMagentaColor), 139);
    AssertEquals(GreenOf(darkMagentaColor), 0);
    AssertEquals(BlueOf(darkMagentaColor), 139);
    AssertEquals(AlphaOf(darkMagentaColor), 255);
end;
procedure TIntegrationTests.TestColorDarkOliveGreenIntegration;
begin
    darkOliveGreenColor := ColorDarkOliveGreen();
    AssertEquals(RedOf(darkOliveGreenColor), 85);
    AssertEquals(GreenOf(darkOliveGreenColor), 107);
    AssertEquals(BlueOf(darkOliveGreenColor), 47);
    AssertEquals(AlphaOf(darkOliveGreenColor), 255);
end;
procedure TIntegrationTests.TestColorDarkOrangeIntegration;
begin
    darkOrangeColor := ColorDarkOrange();
    AssertEquals(RedOf(darkOrangeColor), 255);
    AssertEquals(GreenOf(darkOrangeColor), 140);
    AssertEquals(BlueOf(darkOrangeColor), 0);
    AssertEquals(AlphaOf(darkOrangeColor), 255);
end;
procedure TIntegrationTests.TestColorDarkOrchidIntegration;
begin
    darkOrchidColor := ColorDarkOrchid();
    AssertEquals(RedOf(darkOrchidColor), 153);
    AssertEquals(GreenOf(darkOrchidColor), 50);
    AssertEquals(BlueOf(darkOrchidColor), 204);
    AssertEquals(AlphaOf(darkOrchidColor), 255);
end;
procedure TIntegrationTests.TestColorDarkRedIntegration;
begin
    darkRedColor := ColorDarkRed();
    AssertEquals(RedOf(darkRedColor), 139);
    AssertEquals(GreenOf(darkRedColor), 0);
    AssertEquals(BlueOf(darkRedColor), 0);
    AssertEquals(AlphaOf(darkRedColor), 255);
end;
procedure TIntegrationTests.TestColorDarkSalmonIntegration;
begin
    darkSalmonColor := ColorDarkSalmon();
    AssertEquals(RedOf(darkSalmonColor), 233);
    AssertEquals(GreenOf(darkSalmonColor), 150);
    AssertEquals(BlueOf(darkSalmonColor), 122);
    AssertEquals(AlphaOf(darkSalmonColor), 255);
end;
procedure TIntegrationTests.TestColorDarkSeaGreenIntegration;
begin
    darkSeaGreenColor := ColorDarkSeaGreen();
    AssertEquals(RedOf(darkSeaGreenColor), 143);
    AssertEquals(GreenOf(darkSeaGreenColor), 188);
    AssertEquals(BlueOf(darkSeaGreenColor), 139);
    AssertEquals(AlphaOf(darkSeaGreenColor), 255);
end;
procedure TIntegrationTests.TestColorDarkSlateBlueIntegration;
begin
    darkSlateBlueColor := ColorDarkSlateBlue();
    AssertEquals(RedOf(darkSlateBlueColor), 72);
    AssertEquals(GreenOf(darkSlateBlueColor), 61);
    AssertEquals(BlueOf(darkSlateBlueColor), 139);
    AssertEquals(AlphaOf(darkSlateBlueColor), 255);
end;
procedure TIntegrationTests.TestColorDarkSlateGrayIntegration;
begin
    darkSlateGrayColor := ColorDarkSlateGray();
    AssertEquals(RedOf(darkSlateGrayColor), 47);
    AssertEquals(GreenOf(darkSlateGrayColor), 79);
    AssertEquals(BlueOf(darkSlateGrayColor), 79);
    AssertEquals(AlphaOf(darkSlateGrayColor), 255);
end;
procedure TIntegrationTests.TestColorDarkTurquoiseIntegration;
begin
    darkTurquoiseColor := ColorDarkTurquoise();
    AssertEquals(RedOf(darkTurquoiseColor), 0);
    AssertEquals(GreenOf(darkTurquoiseColor), 206);
    AssertEquals(BlueOf(darkTurquoiseColor), 209);
    AssertEquals(AlphaOf(darkTurquoiseColor), 255);
end;
procedure TIntegrationTests.TestColorDarkVioletIntegration;
begin
    darkVioletColor := ColorDarkViolet();
    AssertEquals(RedOf(darkVioletColor), 148);
    AssertEquals(GreenOf(darkVioletColor), 0);
    AssertEquals(BlueOf(darkVioletColor), 211);
    AssertEquals(AlphaOf(darkVioletColor), 255);
end;
procedure TIntegrationTests.TestColorDeepPinkIntegration;
begin
    deepPinkColor := ColorDeepPink();
    AssertEquals(RedOf(deepPinkColor), 255);
    AssertEquals(GreenOf(deepPinkColor), 20);
    AssertEquals(BlueOf(deepPinkColor), 147);
    AssertEquals(AlphaOf(deepPinkColor), 255);
end;
procedure TIntegrationTests.TestColorDeepSkyBlueIntegration;
begin
    deepSkyBlueColor := ColorDeepSkyBlue();
    AssertEquals(RedOf(deepSkyBlueColor), 0);
    AssertEquals(GreenOf(deepSkyBlueColor), 191);
    AssertEquals(BlueOf(deepSkyBlueColor), 255);
    AssertEquals(AlphaOf(deepSkyBlueColor), 255);
end;
procedure TIntegrationTests.TestColorDimGrayIntegration;
begin
    dimGrayColor := ColorDimGray();
    AssertEquals(RedOf(dimGrayColor), 105);
    AssertEquals(GreenOf(dimGrayColor), 105);
    AssertEquals(BlueOf(dimGrayColor), 105);
    AssertEquals(AlphaOf(dimGrayColor), 255);
end;
procedure TIntegrationTests.TestColorDodgerBlueIntegration;
begin
    dodgerBlueColor := ColorDodgerBlue();
    AssertEquals(RedOf(dodgerBlueColor), 30);
    AssertEquals(GreenOf(dodgerBlueColor), 144);
    AssertEquals(BlueOf(dodgerBlueColor), 255);
    AssertEquals(AlphaOf(dodgerBlueColor), 255);
end;
procedure TIntegrationTests.TestColorFirebrickIntegration;
begin
    firebrickColor := ColorFirebrick();
    AssertEquals(RedOf(firebrickColor), 178);
    AssertEquals(GreenOf(firebrickColor), 34);
    AssertEquals(BlueOf(firebrickColor), 34);
    AssertEquals(AlphaOf(firebrickColor), 255);
end;
procedure TIntegrationTests.TestColorFloralWhiteIntegration;
begin
    floralWhiteColor := ColorFloralWhite();
    AssertEquals(RedOf(floralWhiteColor), 255);
    AssertEquals(GreenOf(floralWhiteColor), 250);
    AssertEquals(BlueOf(floralWhiteColor), 240);
    AssertEquals(AlphaOf(floralWhiteColor), 255);
end;
procedure TIntegrationTests.TestColorForestGreenIntegration;
begin
    forestGreenColor := ColorForestGreen();
    AssertEquals(RedOf(forestGreenColor), 34);
    AssertEquals(GreenOf(forestGreenColor), 139);
    AssertEquals(BlueOf(forestGreenColor), 34);
    AssertEquals(AlphaOf(forestGreenColor), 255);
end;
procedure TIntegrationTests.TestColorFuchsiaIntegration;
begin
    fuchsiaColor := ColorFuchsia();
    AssertEquals(RedOf(fuchsiaColor), 255);
    AssertEquals(GreenOf(fuchsiaColor), 0);
    AssertEquals(BlueOf(fuchsiaColor), 255);
    AssertEquals(AlphaOf(fuchsiaColor), 255);
end;
procedure TIntegrationTests.TestColorGainsboroIntegration;
begin
    gainsboroColor := ColorGainsboro();
    AssertEquals(RedOf(gainsboroColor), 220);
    AssertEquals(GreenOf(gainsboroColor), 220);
    AssertEquals(BlueOf(gainsboroColor), 220);
    AssertEquals(AlphaOf(gainsboroColor), 255);
end;
procedure TIntegrationTests.TestColorGhostWhiteIntegration;
begin
    ghostWhiteColor := ColorGhostWhite();
    AssertEquals(RedOf(ghostWhiteColor), 248);
    AssertEquals(GreenOf(ghostWhiteColor), 248);
    AssertEquals(BlueOf(ghostWhiteColor), 255);
    AssertEquals(AlphaOf(ghostWhiteColor), 255);
end;
procedure TIntegrationTests.TestColorGoldIntegration;
begin
    goldColor := ColorGold();
    AssertEquals(RedOf(goldColor), 255);
    AssertEquals(GreenOf(goldColor), 215);
    AssertEquals(BlueOf(goldColor), 0);
    AssertEquals(AlphaOf(goldColor), 255);
end;
procedure TIntegrationTests.TestColorGoldenrodIntegration;
begin
    goldenrodColor := ColorGoldenrod();
    AssertEquals(RedOf(goldenrodColor), 218);
    AssertEquals(GreenOf(goldenrodColor), 165);
    AssertEquals(BlueOf(goldenrodColor), 32);
    AssertEquals(AlphaOf(goldenrodColor), 255);
end;
procedure TIntegrationTests.TestColorGrayIntegration;
begin
    grayColor := ColorGray();
    AssertEquals(RedOf(grayColor), 127);
    AssertEquals(GreenOf(grayColor), 127);
    AssertEquals(BlueOf(grayColor), 127);
    AssertEquals(AlphaOf(grayColor), 255);
end;
procedure TIntegrationTests.TestColorGreenIntegration;
begin
    greenColor := ColorGreen();
    AssertEquals(RedOf(greenColor), 0);
    AssertEquals(GreenOf(greenColor), 127);
    AssertEquals(BlueOf(greenColor), 0);
    AssertEquals(AlphaOf(greenColor), 255);
end;
procedure TIntegrationTests.TestColorGreenYellowIntegration;
begin
    greenYellowColor := ColorGreenYellow();
    AssertEquals(RedOf(greenYellowColor), 173);
    AssertEquals(GreenOf(greenYellowColor), 255);
    AssertEquals(BlueOf(greenYellowColor), 47);
    AssertEquals(AlphaOf(greenYellowColor), 255);
end;
procedure TIntegrationTests.TestColorHoneydewIntegration;
begin
    honeydewColor := ColorHoneydew();
    AssertEquals(RedOf(honeydewColor), 240);
    AssertEquals(GreenOf(honeydewColor), 255);
    AssertEquals(BlueOf(honeydewColor), 240);
    AssertEquals(AlphaOf(honeydewColor), 255);
end;
procedure TIntegrationTests.TestColorHotPinkIntegration;
begin
    hotPinkColor := ColorHotPink();
    AssertEquals(RedOf(hotPinkColor), 255);
    AssertEquals(GreenOf(hotPinkColor), 105);
    AssertEquals(BlueOf(hotPinkColor), 180);
    AssertEquals(AlphaOf(hotPinkColor), 255);
end;
procedure TIntegrationTests.TestColorIndianRedIntegration;
begin
    indianRedColor := ColorIndianRed();
    AssertEquals(RedOf(indianRedColor), 205);
    AssertEquals(GreenOf(indianRedColor), 92);
    AssertEquals(BlueOf(indianRedColor), 92);
    AssertEquals(AlphaOf(indianRedColor), 255);
end;
procedure TIntegrationTests.TestColorIndigoIntegration;
begin
    indigoColor := ColorIndigo();
    AssertEquals(RedOf(indigoColor), 75);
    AssertEquals(GreenOf(indigoColor), 0);
    AssertEquals(BlueOf(indigoColor), 130);
    AssertEquals(AlphaOf(indigoColor), 255);
end;
procedure TIntegrationTests.TestColorIvoryIntegration;
begin
    ivoryColor := ColorIvory();
    AssertEquals(RedOf(ivoryColor), 255);
    AssertEquals(GreenOf(ivoryColor), 255);
    AssertEquals(BlueOf(ivoryColor), 240);
    AssertEquals(AlphaOf(ivoryColor), 255);
end;
procedure TIntegrationTests.TestColorKhakiIntegration;
begin
    khakiColor := ColorKhaki();
    AssertEquals(RedOf(khakiColor), 240);
    AssertEquals(GreenOf(khakiColor), 230);
    AssertEquals(BlueOf(khakiColor), 140);
    AssertEquals(AlphaOf(khakiColor), 255);
end;
procedure TIntegrationTests.TestColorLavenderIntegration;
begin
    lavenderColor := ColorLavender();
    AssertEquals(RedOf(lavenderColor), 230);
    AssertEquals(GreenOf(lavenderColor), 230);
    AssertEquals(BlueOf(lavenderColor), 250);
    AssertEquals(AlphaOf(lavenderColor), 255);
end;
procedure TIntegrationTests.TestColorLavenderBlushIntegration;
begin
    lavenderBlushColor := ColorLavenderBlush();
    AssertEquals(RedOf(lavenderBlushColor), 255);
    AssertEquals(GreenOf(lavenderBlushColor), 240);
    AssertEquals(BlueOf(lavenderBlushColor), 245);
    AssertEquals(AlphaOf(lavenderBlushColor), 255);
end;
procedure TIntegrationTests.TestColorLawnGreenIntegration;
begin
    lawnGreenColor := ColorLawnGreen();
    AssertEquals(RedOf(lawnGreenColor), 124);
    AssertEquals(GreenOf(lawnGreenColor), 252);
    AssertEquals(BlueOf(lawnGreenColor), 0);
    AssertEquals(AlphaOf(lawnGreenColor), 255);
end;
procedure TIntegrationTests.TestColorLemonChiffonIntegration;
begin
    lemonChiffonColor := ColorLemonChiffon();
    AssertEquals(RedOf(lemonChiffonColor), 255);
    AssertEquals(GreenOf(lemonChiffonColor), 250);
    AssertEquals(BlueOf(lemonChiffonColor), 205);
    AssertEquals(AlphaOf(lemonChiffonColor), 255);
end;
procedure TIntegrationTests.TestColorLightBlueIntegration;
begin
    lightBlueColor := ColorLightBlue();
    AssertEquals(RedOf(lightBlueColor), 173);
    AssertEquals(GreenOf(lightBlueColor), 216);
    AssertEquals(BlueOf(lightBlueColor), 230);
    AssertEquals(AlphaOf(lightBlueColor), 255);
end;
procedure TIntegrationTests.TestColorLightCoralIntegration;
begin
    lightCoralColor := ColorLightCoral();
    AssertEquals(RedOf(lightCoralColor), 240);
    AssertEquals(GreenOf(lightCoralColor), 127);
    AssertEquals(BlueOf(lightCoralColor), 127);
    AssertEquals(AlphaOf(lightCoralColor), 255);
end;
procedure TIntegrationTests.TestColorLightCyanIntegration;
begin
    lightCyanColor := ColorLightCyan();
    AssertEquals(RedOf(lightCyanColor), 224);
    AssertEquals(GreenOf(lightCyanColor), 255);
    AssertEquals(BlueOf(lightCyanColor), 255);
    AssertEquals(AlphaOf(lightCyanColor), 255);
end;
procedure TIntegrationTests.TestColorLightGoldenrodYellowIntegration;
begin
    lightGoldenrodYellowColor := ColorLightGoldenrodYellow();
    AssertEquals(RedOf(lightGoldenrodYellowColor), 250);
    AssertEquals(GreenOf(lightGoldenrodYellowColor), 250);
    AssertEquals(BlueOf(lightGoldenrodYellowColor), 210);
    AssertEquals(AlphaOf(lightGoldenrodYellowColor), 255);
end;
procedure TIntegrationTests.TestColorLightGrayIntegration;
begin
    lightGrayColor := ColorLightGray();
    AssertEquals(RedOf(lightGrayColor), 211);
    AssertEquals(GreenOf(lightGrayColor), 211);
    AssertEquals(BlueOf(lightGrayColor), 211);
    AssertEquals(AlphaOf(lightGrayColor), 255);
end;
procedure TIntegrationTests.TestColorLightGreenIntegration;
begin
    lightGreenColor := ColorLightGreen();
    AssertEquals(RedOf(lightGreenColor), 144);
    AssertEquals(GreenOf(lightGreenColor), 238);
    AssertEquals(BlueOf(lightGreenColor), 144);
    AssertEquals(AlphaOf(lightGreenColor), 255);
end;
procedure TIntegrationTests.TestColorLightPinkIntegration;
begin
    lightPinkColor := ColorLightPink();
    AssertEquals(RedOf(lightPinkColor), 255);
    AssertEquals(GreenOf(lightPinkColor), 182);
    AssertEquals(BlueOf(lightPinkColor), 193);
    AssertEquals(AlphaOf(lightPinkColor), 255);
end;
procedure TIntegrationTests.TestColorLightSalmonIntegration;
begin
    lightSalmonColor := ColorLightSalmon();
    AssertEquals(RedOf(lightSalmonColor), 255);
    AssertEquals(GreenOf(lightSalmonColor), 160);
    AssertEquals(BlueOf(lightSalmonColor), 122);
    AssertEquals(AlphaOf(lightSalmonColor), 255);
end;
procedure TIntegrationTests.TestColorLightSeaGreenIntegration;
begin
    lightSeaGreenColor := ColorLightSeaGreen();
    AssertEquals(RedOf(lightSeaGreenColor), 32);
    AssertEquals(GreenOf(lightSeaGreenColor), 178);
    AssertEquals(BlueOf(lightSeaGreenColor), 170);
    AssertEquals(AlphaOf(lightSeaGreenColor), 255);
end;
procedure TIntegrationTests.TestColorLightSkyBlueIntegration;
begin
    lightSkyBlueColor := ColorLightSkyBlue();
    AssertEquals(RedOf(lightSkyBlueColor), 135);
    AssertEquals(GreenOf(lightSkyBlueColor), 206);
    AssertEquals(BlueOf(lightSkyBlueColor), 250);
    AssertEquals(AlphaOf(lightSkyBlueColor), 255);
end;
procedure TIntegrationTests.TestColorLightSlateGrayIntegration;
begin
    lightSlateGrayColor := ColorLightSlateGray();
    AssertEquals(RedOf(lightSlateGrayColor), 119);
    AssertEquals(GreenOf(lightSlateGrayColor), 136);
    AssertEquals(BlueOf(lightSlateGrayColor), 153);
    AssertEquals(AlphaOf(lightSlateGrayColor), 255);
end;
procedure TIntegrationTests.TestColorLightSteelBlueIntegration;
begin
    lightSteelBlueColor := ColorLightSteelBlue();
    AssertEquals(RedOf(lightSteelBlueColor), 176);
    AssertEquals(GreenOf(lightSteelBlueColor), 196);
    AssertEquals(BlueOf(lightSteelBlueColor), 222);
    AssertEquals(AlphaOf(lightSteelBlueColor), 255);
end;
procedure TIntegrationTests.TestColorLightYellowIntegration;
begin
    lightYellowColor := ColorLightYellow();
    AssertEquals(RedOf(lightYellowColor), 255);
    AssertEquals(GreenOf(lightYellowColor), 255);
    AssertEquals(BlueOf(lightYellowColor), 224);
    AssertEquals(AlphaOf(lightYellowColor), 255);
end;
procedure TIntegrationTests.TestColorLimeIntegration;
begin
    limeColor := ColorLime();
    AssertEquals(RedOf(limeColor), 0);
    AssertEquals(GreenOf(limeColor), 255);
    AssertEquals(BlueOf(limeColor), 0);
    AssertEquals(AlphaOf(limeColor), 255);
end;
procedure TIntegrationTests.TestColorLimeGreenIntegration;
begin
    limeGreenColor := ColorLimeGreen();
    AssertEquals(RedOf(limeGreenColor), 50);
    AssertEquals(GreenOf(limeGreenColor), 205);
    AssertEquals(BlueOf(limeGreenColor), 50);
    AssertEquals(AlphaOf(limeGreenColor), 255);
end;
procedure TIntegrationTests.TestColorLinenIntegration;
begin
    linenColor := ColorLinen();
    AssertEquals(RedOf(linenColor), 250);
    AssertEquals(GreenOf(linenColor), 240);
    AssertEquals(BlueOf(linenColor), 230);
    AssertEquals(AlphaOf(linenColor), 255);
end;
procedure TIntegrationTests.TestColorMagentaIntegration;
begin
    magentaColor := ColorMagenta();
    AssertEquals(RedOf(magentaColor), 255);
    AssertEquals(GreenOf(magentaColor), 0);
    AssertEquals(BlueOf(magentaColor), 255);
    AssertEquals(AlphaOf(magentaColor), 255);
end;
procedure TIntegrationTests.TestColorMaroonIntegration;
begin
    maroonColor := ColorMaroon();
    AssertEquals(RedOf(maroonColor), 127);
    AssertEquals(GreenOf(maroonColor), 0);
    AssertEquals(BlueOf(maroonColor), 0);
    AssertEquals(AlphaOf(maroonColor), 255);
end;
procedure TIntegrationTests.TestColorMediumAquamarineIntegration;
begin
    mediumAquamarineColor := ColorMediumAquamarine();
    AssertEquals(RedOf(mediumAquamarineColor), 102);
    AssertEquals(GreenOf(mediumAquamarineColor), 205);
    AssertEquals(BlueOf(mediumAquamarineColor), 170);
    AssertEquals(AlphaOf(mediumAquamarineColor), 255);
end;
procedure TIntegrationTests.TestColorMediumBlueIntegration;
begin
    mediumBlueColor := ColorMediumBlue();
    AssertEquals(RedOf(mediumBlueColor), 0);
    AssertEquals(GreenOf(mediumBlueColor), 0);
    AssertEquals(BlueOf(mediumBlueColor), 205);
    AssertEquals(AlphaOf(mediumBlueColor), 255);
end;
procedure TIntegrationTests.TestColorMediumOrchidIntegration;
begin
    mediumOrchidColor := ColorMediumOrchid();
    AssertEquals(RedOf(mediumOrchidColor), 186);
    AssertEquals(GreenOf(mediumOrchidColor), 85);
    AssertEquals(BlueOf(mediumOrchidColor), 211);
    AssertEquals(AlphaOf(mediumOrchidColor), 255);
end;
procedure TIntegrationTests.TestColorMediumPurpleIntegration;
begin
    mediumPurpleColor := ColorMediumPurple();
    AssertEquals(RedOf(mediumPurpleColor), 147);
    AssertEquals(GreenOf(mediumPurpleColor), 112);
    AssertEquals(BlueOf(mediumPurpleColor), 219);
    AssertEquals(AlphaOf(mediumPurpleColor), 255);
end;
procedure TIntegrationTests.TestColorMediumSeaGreenIntegration;
begin
    mediumSeaGreenColor := ColorMediumSeaGreen();
    AssertEquals(RedOf(mediumSeaGreenColor), 60);
    AssertEquals(GreenOf(mediumSeaGreenColor), 179);
    AssertEquals(BlueOf(mediumSeaGreenColor), 113);
    AssertEquals(AlphaOf(mediumSeaGreenColor), 255);
end;
procedure TIntegrationTests.TestColorMediumSlateBlueIntegration;
begin
    mediumSlateBlueColor := ColorMediumSlateBlue();
    AssertEquals(RedOf(mediumSlateBlueColor), 123);
    AssertEquals(GreenOf(mediumSlateBlueColor), 104);
    AssertEquals(BlueOf(mediumSlateBlueColor), 238);
    AssertEquals(AlphaOf(mediumSlateBlueColor), 255);
end;
procedure TIntegrationTests.TestColorMediumSpringGreenIntegration;
begin
    mediumSpringGreenColor := ColorMediumSpringGreen();
    AssertEquals(RedOf(mediumSpringGreenColor), 0);
    AssertEquals(GreenOf(mediumSpringGreenColor), 250);
    AssertEquals(BlueOf(mediumSpringGreenColor), 154);
    AssertEquals(AlphaOf(mediumSpringGreenColor), 255);
end;
procedure TIntegrationTests.TestColorMediumTurquoiseIntegration;
begin
    mediumTurquoiseColor := ColorMediumTurquoise();
    AssertEquals(RedOf(mediumTurquoiseColor), 72);
    AssertEquals(GreenOf(mediumTurquoiseColor), 209);
    AssertEquals(BlueOf(mediumTurquoiseColor), 204);
    AssertEquals(AlphaOf(mediumTurquoiseColor), 255);
end;
procedure TIntegrationTests.TestColorMediumVioletRedIntegration;
begin
    mediumVioletRedColor := ColorMediumVioletRed();
    AssertEquals(RedOf(mediumVioletRedColor), 199);
    AssertEquals(GreenOf(mediumVioletRedColor), 21);
    AssertEquals(BlueOf(mediumVioletRedColor), 133);
    AssertEquals(AlphaOf(mediumVioletRedColor), 255);
end;
procedure TIntegrationTests.TestColorMidnightBlueIntegration;
begin
    midnightBlueColor := ColorMidnightBlue();
    AssertEquals(RedOf(midnightBlueColor), 25);
    AssertEquals(GreenOf(midnightBlueColor), 25);
    AssertEquals(BlueOf(midnightBlueColor), 112);
    AssertEquals(AlphaOf(midnightBlueColor), 255);
end;
procedure TIntegrationTests.TestColorMintCreamIntegration;
begin
    mintCreamColor := ColorMintCream();
    AssertEquals(RedOf(mintCreamColor), 245);
    AssertEquals(GreenOf(mintCreamColor), 255);
    AssertEquals(BlueOf(mintCreamColor), 250);
    AssertEquals(AlphaOf(mintCreamColor), 255);
end;
procedure TIntegrationTests.TestColorMistyRoseIntegration;
begin
    mistyRoseColor := ColorMistyRose();
    AssertEquals(RedOf(mistyRoseColor), 255);
    AssertEquals(GreenOf(mistyRoseColor), 228);
    AssertEquals(BlueOf(mistyRoseColor), 225);
    AssertEquals(AlphaOf(mistyRoseColor), 255);
end;
procedure TIntegrationTests.TestColorMoccasinIntegration;
begin
    moccasinColor := ColorMoccasin();
    AssertEquals(RedOf(moccasinColor), 255);
    AssertEquals(GreenOf(moccasinColor), 228);
    AssertEquals(BlueOf(moccasinColor), 181);
    AssertEquals(AlphaOf(moccasinColor), 255);
end;
procedure TIntegrationTests.TestColorNavajoWhiteIntegration;
begin
    navajoWhiteColor := ColorNavajoWhite();
    AssertEquals(RedOf(navajoWhiteColor), 255);
    AssertEquals(GreenOf(navajoWhiteColor), 222);
    AssertEquals(BlueOf(navajoWhiteColor), 173);
    AssertEquals(AlphaOf(navajoWhiteColor), 255);
end;
procedure TIntegrationTests.TestColorNavyIntegration;
begin
    navyColor := ColorNavy();
    AssertEquals(RedOf(navyColor), 0);
    AssertEquals(GreenOf(navyColor), 0);
    AssertEquals(BlueOf(navyColor), 127);
    AssertEquals(AlphaOf(navyColor), 255);
end;
procedure TIntegrationTests.TestColorOldLaceIntegration;
begin
    oldLaceColor := ColorOldLace();
    AssertEquals(RedOf(oldLaceColor), 253);
    AssertEquals(GreenOf(oldLaceColor), 245);
    AssertEquals(BlueOf(oldLaceColor), 230);
    AssertEquals(AlphaOf(oldLaceColor), 255);
end;
procedure TIntegrationTests.TestColorOliveIntegration;
begin
    oliveColor := ColorOlive();
    AssertEquals(RedOf(oliveColor), 127);
    AssertEquals(GreenOf(oliveColor), 127);
    AssertEquals(BlueOf(oliveColor), 0);
    AssertEquals(AlphaOf(oliveColor), 255);
end;
procedure TIntegrationTests.TestColorOliveDrabIntegration;
begin
    oliveDrabColor := ColorOliveDrab();
    AssertEquals(RedOf(oliveDrabColor), 107);
    AssertEquals(GreenOf(oliveDrabColor), 142);
    AssertEquals(BlueOf(oliveDrabColor), 35);
    AssertEquals(AlphaOf(oliveDrabColor), 255);
end;
procedure TIntegrationTests.TestColorOrangeIntegration;
begin
    orangeColor := ColorOrange();
    AssertEquals(RedOf(orangeColor), 255);
    AssertEquals(GreenOf(orangeColor), 165);
    AssertEquals(BlueOf(orangeColor), 0);
    AssertEquals(AlphaOf(orangeColor), 255);
end;
procedure TIntegrationTests.TestColorOrangeRedIntegration;
begin
    orangeRedColor := ColorOrangeRed();
    AssertEquals(RedOf(orangeRedColor), 255);
    AssertEquals(GreenOf(orangeRedColor), 69);
    AssertEquals(BlueOf(orangeRedColor), 0);
    AssertEquals(AlphaOf(orangeRedColor), 255);
end;
procedure TIntegrationTests.TestColorOrchidIntegration;
begin
    orchidColor := ColorOrchid();
    AssertEquals(RedOf(orchidColor), 218);
    AssertEquals(GreenOf(orchidColor), 112);
    AssertEquals(BlueOf(orchidColor), 214);
    AssertEquals(AlphaOf(orchidColor), 255);
end;
procedure TIntegrationTests.TestColorPaleGoldenrodIntegration;
begin
    paleGoldenrodColor := ColorPaleGoldenrod();
    AssertEquals(RedOf(paleGoldenrodColor), 238);
    AssertEquals(GreenOf(paleGoldenrodColor), 232);
    AssertEquals(BlueOf(paleGoldenrodColor), 170);
    AssertEquals(AlphaOf(paleGoldenrodColor), 255);
end;
procedure TIntegrationTests.TestColorPaleGreenIntegration;
begin
    paleGreenColor := ColorPaleGreen();
    AssertEquals(RedOf(paleGreenColor), 152);
    AssertEquals(GreenOf(paleGreenColor), 251);
    AssertEquals(BlueOf(paleGreenColor), 152);
    AssertEquals(AlphaOf(paleGreenColor), 255);
end;
procedure TIntegrationTests.TestColorPaleTurquoiseIntegration;
begin
    paleTurquoiseColor := ColorPaleTurquoise();
    AssertEquals(RedOf(paleTurquoiseColor), 175);
    AssertEquals(GreenOf(paleTurquoiseColor), 238);
    AssertEquals(BlueOf(paleTurquoiseColor), 238);
    AssertEquals(AlphaOf(paleTurquoiseColor), 255);
end;
procedure TIntegrationTests.TestColorPaleVioletRedIntegration;
begin
    paleVioletRedColor := ColorPaleVioletRed();
    AssertEquals(RedOf(paleVioletRedColor), 219);
    AssertEquals(GreenOf(paleVioletRedColor), 112);
    AssertEquals(BlueOf(paleVioletRedColor), 147);
    AssertEquals(AlphaOf(paleVioletRedColor), 255);
end;
procedure TIntegrationTests.TestColorPapayaWhipIntegration;
begin
    papayaWhipColor := ColorPapayaWhip();
    AssertEquals(RedOf(papayaWhipColor), 255);
    AssertEquals(GreenOf(papayaWhipColor), 239);
    AssertEquals(BlueOf(papayaWhipColor), 213);
    AssertEquals(AlphaOf(papayaWhipColor), 255);
end;
procedure TIntegrationTests.TestColorPeachPuffIntegration;
begin
    peachPuffColor := ColorPeachPuff();
    AssertEquals(RedOf(peachPuffColor), 255);
    AssertEquals(GreenOf(peachPuffColor), 218);
    AssertEquals(BlueOf(peachPuffColor), 185);
    AssertEquals(AlphaOf(peachPuffColor), 255);
end;
procedure TIntegrationTests.TestColorPeruIntegration;
begin
    peruColor := ColorPeru();
    AssertEquals(RedOf(peruColor), 205);
    AssertEquals(GreenOf(peruColor), 133);
    AssertEquals(BlueOf(peruColor), 63);
    AssertEquals(AlphaOf(peruColor), 255);
end;
procedure TIntegrationTests.TestColorPinkIntegration;
begin
    pinkColor := ColorPink();
    AssertEquals(RedOf(pinkColor), 255);
    AssertEquals(GreenOf(pinkColor), 192);
    AssertEquals(BlueOf(pinkColor), 203);
    AssertEquals(AlphaOf(pinkColor), 255);
end;
procedure TIntegrationTests.TestColorPlumIntegration;
begin
    plumColor := ColorPlum();
    AssertEquals(RedOf(plumColor), 221);
    AssertEquals(GreenOf(plumColor), 160);
    AssertEquals(BlueOf(plumColor), 221);
    AssertEquals(AlphaOf(plumColor), 255);
end;
procedure TIntegrationTests.TestColorPowderBlueIntegration;
begin
    powderBlueColor := ColorPowderBlue();
    AssertEquals(RedOf(powderBlueColor), 176);
    AssertEquals(GreenOf(powderBlueColor), 224);
    AssertEquals(BlueOf(powderBlueColor), 230);
    AssertEquals(AlphaOf(powderBlueColor), 255);
end;
procedure TIntegrationTests.TestColorPurpleIntegration;
begin
    purpleColor := ColorPurple();
    AssertEquals(RedOf(purpleColor), 127);
    AssertEquals(GreenOf(purpleColor), 0);
    AssertEquals(BlueOf(purpleColor), 127);
    AssertEquals(AlphaOf(purpleColor), 255);
end;
procedure TIntegrationTests.TestColorRedIntegration;
begin
    redColor := ColorRed();
    AssertEquals(RedOf(redColor), 255);
    AssertEquals(GreenOf(redColor), 0);
    AssertEquals(BlueOf(redColor), 0);
    AssertEquals(AlphaOf(redColor), 255);
end;
procedure TIntegrationTests.TestColorRosyBrownIntegration;
begin
    rosyBrownColor := ColorRosyBrown();
    AssertEquals(RedOf(rosyBrownColor), 188);
    AssertEquals(GreenOf(rosyBrownColor), 143);
    AssertEquals(BlueOf(rosyBrownColor), 143);
    AssertEquals(AlphaOf(rosyBrownColor), 255);
end;
procedure TIntegrationTests.TestColorRoyalBlueIntegration;
begin
    royalBlueColor := ColorRoyalBlue();
    AssertEquals(RedOf(royalBlueColor), 65);
    AssertEquals(GreenOf(royalBlueColor), 105);
    AssertEquals(BlueOf(royalBlueColor), 225);
    AssertEquals(AlphaOf(royalBlueColor), 255);
end;
procedure TIntegrationTests.TestColorSaddleBrownIntegration;
begin
    saddleBrownColor := ColorSaddleBrown();
    AssertEquals(RedOf(saddleBrownColor), 139);
    AssertEquals(GreenOf(saddleBrownColor), 69);
    AssertEquals(BlueOf(saddleBrownColor), 19);
    AssertEquals(AlphaOf(saddleBrownColor), 255);
end;
procedure TIntegrationTests.TestColorSalmonIntegration;
begin
    salmonColor := ColorSalmon();
    AssertEquals(RedOf(salmonColor), 250);
    AssertEquals(GreenOf(salmonColor), 127);
    AssertEquals(BlueOf(salmonColor), 114);
    AssertEquals(AlphaOf(salmonColor), 255);
end;
procedure TIntegrationTests.TestColorSandyBrownIntegration;
begin
    sandyBrownColor := ColorSandyBrown();
    AssertEquals(RedOf(sandyBrownColor), 244);
    AssertEquals(GreenOf(sandyBrownColor), 164);
    AssertEquals(BlueOf(sandyBrownColor), 96);
    AssertEquals(AlphaOf(sandyBrownColor), 255);
end;
procedure TIntegrationTests.TestColorSeaGreenIntegration;
begin
    seaGreenColor := ColorSeaGreen();
    AssertEquals(RedOf(seaGreenColor), 46);
    AssertEquals(GreenOf(seaGreenColor), 139);
    AssertEquals(BlueOf(seaGreenColor), 87);
    AssertEquals(AlphaOf(seaGreenColor), 255);
end;
procedure TIntegrationTests.TestColorSeaShellIntegration;
begin
    seaShellColor := ColorSeaShell();
    AssertEquals(RedOf(seaShellColor), 255);
    AssertEquals(GreenOf(seaShellColor), 245);
    AssertEquals(BlueOf(seaShellColor), 238);
    AssertEquals(AlphaOf(seaShellColor), 255);
end;
procedure TIntegrationTests.TestColorSiennaIntegration;
begin
    siennaColor := ColorSienna();
    AssertEquals(RedOf(siennaColor), 160);
    AssertEquals(GreenOf(siennaColor), 82);
    AssertEquals(BlueOf(siennaColor), 45);
    AssertEquals(AlphaOf(siennaColor), 255);
end;
procedure TIntegrationTests.TestColorSilverIntegration;
begin
    silverColor := ColorSilver();
    AssertEquals(RedOf(silverColor), 192);
    AssertEquals(GreenOf(silverColor), 192);
    AssertEquals(BlueOf(silverColor), 192);
    AssertEquals(AlphaOf(silverColor), 255);
end;
procedure TIntegrationTests.TestColorSkyBlueIntegration;
begin
    skyBlueColor := ColorSkyBlue();
    AssertEquals(RedOf(skyBlueColor), 135);
    AssertEquals(GreenOf(skyBlueColor), 206);
    AssertEquals(BlueOf(skyBlueColor), 235);
    AssertEquals(AlphaOf(skyBlueColor), 255);
end;
procedure TIntegrationTests.TestColorSlateBlueIntegration;
begin
    slateBlueColor := ColorSlateBlue();
    AssertEquals(RedOf(slateBlueColor), 106);
    AssertEquals(GreenOf(slateBlueColor), 90);
    AssertEquals(BlueOf(slateBlueColor), 205);
    AssertEquals(AlphaOf(slateBlueColor), 255);
end;
procedure TIntegrationTests.TestColorSlateGrayIntegration;
begin
    slateGrayColor := ColorSlateGray();
    AssertEquals(RedOf(slateGrayColor), 112);
    AssertEquals(GreenOf(slateGrayColor), 127);
    AssertEquals(BlueOf(slateGrayColor), 144);
    AssertEquals(AlphaOf(slateGrayColor), 255);
end;
procedure TIntegrationTests.TestColorSnowIntegration;
begin
    snowColor := ColorSnow();
    AssertEquals(RedOf(snowColor), 255);
    AssertEquals(GreenOf(snowColor), 250);
    AssertEquals(BlueOf(snowColor), 250);
    AssertEquals(AlphaOf(snowColor), 255);
end;
procedure TIntegrationTests.TestColorSpringGreenIntegration;
begin
    springGreenColor := ColorSpringGreen();
    AssertEquals(RedOf(springGreenColor), 0);
    AssertEquals(GreenOf(springGreenColor), 255);
    AssertEquals(BlueOf(springGreenColor), 127);
    AssertEquals(AlphaOf(springGreenColor), 255);
end;
procedure TIntegrationTests.TestColorSteelBlueIntegration;
begin
    steelBlueColor := ColorSteelBlue();
    AssertEquals(RedOf(steelBlueColor), 70);
    AssertEquals(GreenOf(steelBlueColor), 130);
    AssertEquals(BlueOf(steelBlueColor), 180);
    AssertEquals(AlphaOf(steelBlueColor), 255);
end;
procedure TIntegrationTests.TestColorSwinburneRedIntegration;
begin
    swinburneRedColor := ColorSwinburneRed();
    AssertEquals(RedOf(swinburneRedColor), 237);
    AssertEquals(GreenOf(swinburneRedColor), 36);
    AssertEquals(BlueOf(swinburneRedColor), 25);
    AssertEquals(AlphaOf(swinburneRedColor), 255);
end;
procedure TIntegrationTests.TestColorTanIntegration;
begin
    tanColor := ColorTan();
    AssertEquals(RedOf(tanColor), 210);
    AssertEquals(GreenOf(tanColor), 180);
    AssertEquals(BlueOf(tanColor), 140);
    AssertEquals(AlphaOf(tanColor), 255);
end;
procedure TIntegrationTests.TestColorTealIntegration;
begin
    tealColor := ColorTeal();
    AssertEquals(RedOf(tealColor), 0);
    AssertEquals(GreenOf(tealColor), 127);
    AssertEquals(BlueOf(tealColor), 127);
    AssertEquals(AlphaOf(tealColor), 255);
end;
procedure TIntegrationTests.TestColorThistleIntegration;
begin
    thistleColor := ColorThistle();
    AssertEquals(RedOf(thistleColor), 216);
    AssertEquals(GreenOf(thistleColor), 191);
    AssertEquals(BlueOf(thistleColor), 216);
    AssertEquals(AlphaOf(thistleColor), 255);
end;
procedure TIntegrationTests.TestColorToStringIntegration;
begin
    redColor := ColorRed();
    redColorString := ColorToString(redColor);
    AssertEquals(redColorString, "#ff0000ff");
    transparentColor := ColorTransparent();
    transparentColorString := ColorToString(transparentColor);
    AssertEquals(transparentColorString, "#ffffffff");
end;
procedure TIntegrationTests.TestColorTomatoIntegration;
begin
    tomatoColor := ColorTomato();
    AssertEquals(RedOf(tomatoColor), 255);
    AssertEquals(GreenOf(tomatoColor), 99);
    AssertEquals(BlueOf(tomatoColor), 71);
    AssertEquals(AlphaOf(tomatoColor), 255);
end;
procedure TIntegrationTests.TestColorTransparentIntegration;
begin
    transparentColor := ColorTransparent();
    AssertEquals(AlphaOf(transparentColor), 255);
    AssertEquals(RedOf(transparentColor), 255);
    AssertEquals(GreenOf(transparentColor), 255);
    AssertEquals(BlueOf(transparentColor), 255);
end;
procedure TIntegrationTests.TestColorTurquoiseIntegration;
begin
    turquoiseColor := ColorTurquoise();
    AssertEquals(RedOf(turquoiseColor), 64);
    AssertEquals(GreenOf(turquoiseColor), 224);
    AssertEquals(BlueOf(turquoiseColor), 208);
    AssertEquals(AlphaOf(turquoiseColor), 255);
end;
procedure TIntegrationTests.TestColorVioletIntegration;
begin
    violetColor := ColorViolet();
    AssertEquals(RedOf(violetColor), 238);
    AssertEquals(GreenOf(violetColor), 130);
    AssertEquals(BlueOf(violetColor), 238);
    AssertEquals(AlphaOf(violetColor), 255);
end;
procedure TIntegrationTests.TestColorWheatIntegration;
begin
    wheatColor := ColorWheat();
    AssertEquals(RedOf(wheatColor), 245);
    AssertEquals(GreenOf(wheatColor), 222);
    AssertEquals(BlueOf(wheatColor), 179);
    AssertEquals(AlphaOf(wheatColor), 255);
end;
procedure TIntegrationTests.TestColorWhiteIntegration;
begin
    whiteColor := ColorWhite();
    AssertEquals(RedOf(whiteColor), 255);
    AssertEquals(GreenOf(whiteColor), 255);
    AssertEquals(BlueOf(whiteColor), 255);
    AssertEquals(AlphaOf(whiteColor), 255);
end;
procedure TIntegrationTests.TestColorWhiteSmokeIntegration;
begin
    whiteSmokeColor := ColorWhiteSmoke();
    AssertEquals(RedOf(whiteSmokeColor), 245);
    AssertEquals(GreenOf(whiteSmokeColor), 245);
    AssertEquals(BlueOf(whiteSmokeColor), 245);
    AssertEquals(AlphaOf(whiteSmokeColor), 255);
end;
procedure TIntegrationTests.TestColorYellowIntegration;
begin
    yellowColor := ColorYellow();
    AssertEquals(RedOf(yellowColor), 255);
    AssertEquals(GreenOf(yellowColor), 255);
    AssertEquals(BlueOf(yellowColor), 0);
    AssertEquals(AlphaOf(yellowColor), 255);
end;
procedure TIntegrationTests.TestColorYellowGreenIntegration;
begin
    yellowGreenColor := ColorYellowGreen();
    AssertEquals(RedOf(yellowGreenColor), 154);
    AssertEquals(GreenOf(yellowGreenColor), 205);
    AssertEquals(BlueOf(yellowGreenColor), 50);
    AssertEquals(AlphaOf(yellowGreenColor), 255);
end;
procedure TIntegrationTests.TestGreenOfIntegration;
begin
    greenColor := ColorGreen();
    greenValue := GreenOf(greenColor);
    AssertEquals(greenValue, 127);
    blackColor := ColorBlack();
    blackGreenValue := GreenOf(blackColor);
    AssertEquals(blackGreenValue, 0);
end;
procedure TIntegrationTests.TestHSBColorIntegration;
begin
    redColor := HSBColor(0.0, 1.0, 1.0);
    AssertEquals(HueOf(redColor), 0.0);
    AssertEquals(SaturationOf(redColor), 1.0);
    AssertEquals(BrightnessOf(redColor), 1.0);
    grayColor := HSBColor(0.5, 0.0, 0.5);
    AssertEquals(SaturationOf(grayColor), 0.0);
end;
procedure TIntegrationTests.TestHueOfIntegration;
begin
    redColor := ColorRed();
    hueValue := HueOf(redColor);
    AssertEquals(hueValue, 0.0);
    blueColor := ColorBlue();
    hueValueBlue := HueOf(blueColor);
    AssertEquals(hueValueBlue, 0.6666666666666666);
end;
procedure TIntegrationTests.TestRandomColorIntegration;
begin
    randomColorResult := RandomColor();
    AssertNotEquals(ColorToString(randomColorResult), "#000000FF");
    AssertTrue((AlphaOf(randomColorResult) >= 0) and (AlphaOf(randomColorResult) <= 255));
end;
procedure TIntegrationTests.TestRandomRGBColorIntegration;
begin
    randomColor := RandomRGBColor(255);
    AssertTrue((RedOf(randomColor) >= 0) and (RedOf(randomColor) <= 255));
    AssertTrue((GreenOf(randomColor) >= 0) and (GreenOf(randomColor) <= 255));
    AssertTrue((BlueOf(randomColor) >= 0) and (BlueOf(randomColor) <= 255));
    AssertEquals(AlphaOf(randomColor), 255);
end;
procedure TIntegrationTests.TestRedOfIntegration;
begin
    redColor := ColorRed();
    redValue := RedOf(redColor);
    AssertEquals(redValue, 255);
    blueColor := ColorBlue();
    blueRedValue := RedOf(blueColor);
    AssertEquals(blueRedValue, 0);
end;
procedure TIntegrationTests.TestRGBColorFromDoubleIntegration;
begin
    redColor := RGBColor(1.0, 0.0, 0.0);
    AssertEquals(RedOf(redColor), 255);
    AssertEquals(GreenOf(redColor), 0);
    AssertEquals(BlueOf(redColor), 0);
    greenColor := RGBColor(0.0, 1.0, 0.0);
    AssertEquals(RedOf(greenColor), 0);
    AssertEquals(GreenOf(greenColor), 255);
    AssertEquals(BlueOf(greenColor), 0);
end;
procedure TIntegrationTests.TestRGBColorIntegration;
begin
    redColor := RGBColor(255, 0, 0);
    AssertEquals(RedOf(redColor), 255);
    AssertEquals(GreenOf(redColor), 0);
    AssertEquals(BlueOf(redColor), 0);
    AssertEquals(AlphaOf(redColor), 255);
end;
procedure TIntegrationTests.TestRGBAColorFromDoubleIntegration;
begin
    testColor := RGBAColor(1.0, 0.5, 0.0, 0.75);
    AssertEquals(RedOf(testColor), 255);
    AssertEquals(GreenOf(testColor), 127);
    AssertEquals(BlueOf(testColor), 0);
    AssertEquals(AlphaOf(testColor), 191);
end;
procedure TIntegrationTests.TestRGBAColorIntegration;
begin
    redColor := RGBAColor(255, 0, 0, 255);
    AssertEquals(RedOf(redColor), 255);
    AssertEquals(GreenOf(redColor), 0);
    AssertEquals(BlueOf(redColor), 0);
    AssertEquals(AlphaOf(redColor), 255);
end;
procedure TIntegrationTests.TestSaturationOfIntegration;
begin
    redColor := ColorRed();
    saturationValue := SaturationOf(redColor);
    AssertEquals(saturationValue, 1.0);
    grayColor := ColorGray();
    saturationValueGray := SaturationOf(grayColor);
    AssertEquals(saturationValueGray, 0.0);
end;
procedure TIntegrationTests.TestStringToColorIntegration;
begin
    redColor := StringToColor("#FF0000FF");
    AssertEquals(RedOf(redColor), 255);
    AssertEquals(GreenOf(redColor), 0);
    AssertEquals(BlueOf(redColor), 0);
    AssertEquals(AlphaOf(redColor), 255);
    greenColor := StringToColor("#00FF00FF");
    AssertEquals(RedOf(greenColor), 0);
    AssertEquals(GreenOf(greenColor), 255);
    AssertEquals(BlueOf(greenColor), 0);
    AssertEquals(AlphaOf(greenColor), 255);
end;
end;

procedure RegisterTests;
begin
TestFramework.RegisterTest(TIntegrationTests.Suite);
end;
