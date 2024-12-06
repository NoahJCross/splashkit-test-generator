uses SplashKit, TestFramework

type
TIntegrationTests = class(TTestCase)
published
procedure TIntegrationTests.TestAlphaOfIntegration;
begin
    redColor := color_red();
    alphaValue := alpha_of(redColor);
    AssertEquals(alphaValue, 255);
    transparentColor := color_transparent();
    alphaValueTransparent := alpha_of(transparentColor);
    AssertEquals(alphaValueTransparent, 255);
end;
procedure TIntegrationTests.TestBlueOfIntegration;
begin
    blueColor := color_blue();
    blueValue := blue_of(blueColor);
    AssertEquals(blueValue, 255);
    redColor := color_red();
    blueValueRed := blue_of(redColor);
    AssertEquals(blueValueRed, 0);
end;
procedure TIntegrationTests.TestBrightnessOfIntegration;
begin
    whiteColor := color_white();
    whiteBrightness := brightness_of(whiteColor);
    AssertEquals(whiteBrightness, 1.0);
    blackColor := color_black();
    blackBrightness := brightness_of(blackColor);
    AssertEquals(blackBrightness, 0.0);
    grayColor := color_gray();
    grayBrightness := brightness_of(grayColor);
    AssertTrue((grayBrightness >= 0.4) and (grayBrightness <= 0.6));
end;
procedure TIntegrationTests.TestColorAliceBlueIntegration;
begin
    aliceBlueColor := color_alice_blue();
    AssertEquals(red_of(aliceBlueColor), 240);
    AssertEquals(green_of(aliceBlueColor), 248);
    AssertEquals(blue_of(aliceBlueColor), 255);
    AssertEquals(alpha_of(aliceBlueColor), 255);
end;
procedure TIntegrationTests.TestColorAntiqueWhiteIntegration;
begin
    antiqueWhiteColor := color_antique_white();
    AssertEquals(red_of(antiqueWhiteColor), 250);
    AssertEquals(green_of(antiqueWhiteColor), 235);
    AssertEquals(blue_of(antiqueWhiteColor), 215);
    AssertEquals(alpha_of(antiqueWhiteColor), 255);
end;
procedure TIntegrationTests.TestColorAquaIntegration;
begin
    aquaColor := color_aqua();
    AssertEquals(red_of(aquaColor), 0);
    AssertEquals(green_of(aquaColor), 255);
    AssertEquals(blue_of(aquaColor), 255);
    AssertEquals(alpha_of(aquaColor), 255);
end;
procedure TIntegrationTests.TestColorAquamarineIntegration;
begin
    aquamarineColor := color_aquamarine();
    AssertEquals(red_of(aquamarineColor), 127);
    AssertEquals(green_of(aquamarineColor), 255);
    AssertEquals(blue_of(aquamarineColor), 212);
    AssertEquals(alpha_of(aquamarineColor), 255);
end;
procedure TIntegrationTests.TestColorAzureIntegration;
begin
    azureColor := color_azure();
    AssertEquals(red_of(azureColor), 240);
    AssertEquals(green_of(azureColor), 255);
    AssertEquals(blue_of(azureColor), 255);
    AssertEquals(alpha_of(azureColor), 255);
end;
procedure TIntegrationTests.TestColorBeigeIntegration;
begin
    beigeColor := color_beige();
    AssertEquals(red_of(beigeColor), 245);
    AssertEquals(green_of(beigeColor), 245);
    AssertEquals(blue_of(beigeColor), 220);
    AssertEquals(alpha_of(beigeColor), 255);
end;
procedure TIntegrationTests.TestColorBisqueIntegration;
begin
    bisqueColor := color_bisque();
    AssertEquals(red_of(bisqueColor), 255);
    AssertEquals(green_of(bisqueColor), 228);
    AssertEquals(blue_of(bisqueColor), 196);
    AssertEquals(alpha_of(bisqueColor), 255);
end;
procedure TIntegrationTests.TestColorBlackIntegration;
begin
    blackColor := color_black();
    AssertEquals(red_of(blackColor), 0);
    AssertEquals(green_of(blackColor), 0);
    AssertEquals(blue_of(blackColor), 0);
    AssertEquals(alpha_of(blackColor), 255);
end;
procedure TIntegrationTests.TestColorBlanchedAlmondIntegration;
begin
    blanchedAlmondColor := color_blanched_almond();
    AssertEquals(red_of(blanchedAlmondColor), 255);
    AssertEquals(green_of(blanchedAlmondColor), 235);
    AssertEquals(blue_of(blanchedAlmondColor), 205);
    AssertEquals(alpha_of(blanchedAlmondColor), 255);
end;
procedure TIntegrationTests.TestColorBlueIntegration;
begin
    blueColor := color_blue();
    AssertEquals(red_of(blueColor), 0);
    AssertEquals(green_of(blueColor), 0);
    AssertEquals(blue_of(blueColor), 255);
    AssertEquals(alpha_of(blueColor), 255);
end;
procedure TIntegrationTests.TestColorBlueVioletIntegration;
begin
    blueVioletColor := color_blue_violet();
    AssertEquals(red_of(blueVioletColor), 138);
    AssertEquals(green_of(blueVioletColor), 43);
    AssertEquals(blue_of(blueVioletColor), 226);
    AssertEquals(alpha_of(blueVioletColor), 255);
end;
procedure TIntegrationTests.TestColorBrightGreenIntegration;
begin
    brightGreenColor := color_bright_green();
    AssertEquals(red_of(brightGreenColor), 0);
    AssertEquals(green_of(brightGreenColor), 255);
    AssertEquals(blue_of(brightGreenColor), 0);
    AssertEquals(alpha_of(brightGreenColor), 255);
end;
procedure TIntegrationTests.TestColorBrownIntegration;
begin
    brownColor := color_brown();
    AssertEquals(red_of(brownColor), 165);
    AssertEquals(green_of(brownColor), 42);
    AssertEquals(blue_of(brownColor), 42);
    AssertEquals(alpha_of(brownColor), 255);
end;
procedure TIntegrationTests.TestColorBurlyWoodIntegration;
begin
    burlyWoodColor := color_burly_wood();
    AssertEquals(red_of(burlyWoodColor), 222);
    AssertEquals(green_of(burlyWoodColor), 184);
    AssertEquals(blue_of(burlyWoodColor), 135);
    AssertEquals(alpha_of(burlyWoodColor), 255);
end;
procedure TIntegrationTests.TestColorCadetBlueIntegration;
begin
    cadetBlueColor := color_cadet_blue();
    AssertEquals(red_of(cadetBlueColor), 95);
    AssertEquals(green_of(cadetBlueColor), 158);
    AssertEquals(blue_of(cadetBlueColor), 160);
    AssertEquals(alpha_of(cadetBlueColor), 255);
end;
procedure TIntegrationTests.TestColorChartreuseIntegration;
begin
    chartreuseColor := color_chartreuse();
    AssertEquals(red_of(chartreuseColor), 127);
    AssertEquals(green_of(chartreuseColor), 255);
    AssertEquals(blue_of(chartreuseColor), 0);
    AssertEquals(alpha_of(chartreuseColor), 255);
end;
procedure TIntegrationTests.TestColorChocolateIntegration;
begin
    chocolateColor := color_chocolate();
    AssertEquals(red_of(chocolateColor), 210);
    AssertEquals(green_of(chocolateColor), 105);
    AssertEquals(blue_of(chocolateColor), 30);
    AssertEquals(alpha_of(chocolateColor), 255);
end;
procedure TIntegrationTests.TestColorCoralIntegration;
begin
    coralColor := color_coral();
    AssertEquals(red_of(coralColor), 255);
    AssertEquals(green_of(coralColor), 127);
    AssertEquals(blue_of(coralColor), 80);
    AssertEquals(alpha_of(coralColor), 255);
end;
procedure TIntegrationTests.TestColorCornflowerBlueIntegration;
begin
    cornflowerBlueColor := color_cornflower_blue();
    AssertEquals(red_of(cornflowerBlueColor), 100);
    AssertEquals(green_of(cornflowerBlueColor), 149);
    AssertEquals(blue_of(cornflowerBlueColor), 237);
    AssertEquals(alpha_of(cornflowerBlueColor), 255);
end;
procedure TIntegrationTests.TestColorCornsilkIntegration;
begin
    cornsilkColor := color_cornsilk();
    AssertEquals(red_of(cornsilkColor), 255);
    AssertEquals(green_of(cornsilkColor), 248);
    AssertEquals(blue_of(cornsilkColor), 220);
    AssertEquals(alpha_of(cornsilkColor), 255);
end;
procedure TIntegrationTests.TestColorCrimsonIntegration;
begin
    crimsonColor := color_crimson();
    AssertEquals(red_of(crimsonColor), 220);
    AssertEquals(green_of(crimsonColor), 20);
    AssertEquals(blue_of(crimsonColor), 60);
    AssertEquals(alpha_of(crimsonColor), 255);
end;
procedure TIntegrationTests.TestColorCyanIntegration;
begin
    cyanColor := color_cyan();
    AssertEquals(red_of(cyanColor), 0);
    AssertEquals(green_of(cyanColor), 255);
    AssertEquals(blue_of(cyanColor), 255);
    AssertEquals(alpha_of(cyanColor), 255);
end;
procedure TIntegrationTests.TestColorDarkBlueIntegration;
begin
    darkBlueColor := color_dark_blue();
    AssertEquals(red_of(darkBlueColor), 0);
    AssertEquals(green_of(darkBlueColor), 0);
    AssertEquals(blue_of(darkBlueColor), 139);
    AssertEquals(alpha_of(darkBlueColor), 255);
end;
procedure TIntegrationTests.TestColorDarkCyanIntegration;
begin
    darkCyanColor := color_dark_cyan();
    AssertEquals(red_of(darkCyanColor), 0);
    AssertEquals(green_of(darkCyanColor), 139);
    AssertEquals(blue_of(darkCyanColor), 139);
    AssertEquals(alpha_of(darkCyanColor), 255);
end;
procedure TIntegrationTests.TestColorDarkGoldenrodIntegration;
begin
    darkGoldenrodColor := color_dark_goldenrod();
    AssertEquals(red_of(darkGoldenrodColor), 184);
    AssertEquals(green_of(darkGoldenrodColor), 134);
    AssertEquals(blue_of(darkGoldenrodColor), 11);
    AssertEquals(alpha_of(darkGoldenrodColor), 255);
end;
procedure TIntegrationTests.TestColorDarkGrayIntegration;
begin
    darkGrayColor := color_dark_gray();
    AssertEquals(red_of(darkGrayColor), 169);
    AssertEquals(green_of(darkGrayColor), 169);
    AssertEquals(blue_of(darkGrayColor), 169);
    AssertEquals(alpha_of(darkGrayColor), 255);
end;
procedure TIntegrationTests.TestColorDarkGreenIntegration;
begin
    darkGreenColor := color_dark_green();
    AssertEquals(red_of(darkGreenColor), 0);
    AssertEquals(green_of(darkGreenColor), 100);
    AssertEquals(blue_of(darkGreenColor), 0);
    AssertEquals(alpha_of(darkGreenColor), 255);
end;
procedure TIntegrationTests.TestColorDarkKhakiIntegration;
begin
    darkKhakiColor := color_dark_khaki();
    AssertEquals(red_of(darkKhakiColor), 189);
    AssertEquals(green_of(darkKhakiColor), 183);
    AssertEquals(blue_of(darkKhakiColor), 107);
    AssertEquals(alpha_of(darkKhakiColor), 255);
end;
procedure TIntegrationTests.TestColorDarkMagentaIntegration;
begin
    darkMagentaColor := color_dark_magenta();
    AssertEquals(red_of(darkMagentaColor), 139);
    AssertEquals(green_of(darkMagentaColor), 0);
    AssertEquals(blue_of(darkMagentaColor), 139);
    AssertEquals(alpha_of(darkMagentaColor), 255);
end;
procedure TIntegrationTests.TestColorDarkOliveGreenIntegration;
begin
    darkOliveGreenColor := color_dark_olive_green();
    AssertEquals(red_of(darkOliveGreenColor), 85);
    AssertEquals(green_of(darkOliveGreenColor), 107);
    AssertEquals(blue_of(darkOliveGreenColor), 47);
    AssertEquals(alpha_of(darkOliveGreenColor), 255);
end;
procedure TIntegrationTests.TestColorDarkOrangeIntegration;
begin
    darkOrangeColor := color_dark_orange();
    AssertEquals(red_of(darkOrangeColor), 255);
    AssertEquals(green_of(darkOrangeColor), 140);
    AssertEquals(blue_of(darkOrangeColor), 0);
    AssertEquals(alpha_of(darkOrangeColor), 255);
end;
procedure TIntegrationTests.TestColorDarkOrchidIntegration;
begin
    darkOrchidColor := color_dark_orchid();
    AssertEquals(red_of(darkOrchidColor), 153);
    AssertEquals(green_of(darkOrchidColor), 50);
    AssertEquals(blue_of(darkOrchidColor), 204);
    AssertEquals(alpha_of(darkOrchidColor), 255);
end;
procedure TIntegrationTests.TestColorDarkRedIntegration;
begin
    darkRedColor := color_dark_red();
    AssertEquals(red_of(darkRedColor), 139);
    AssertEquals(green_of(darkRedColor), 0);
    AssertEquals(blue_of(darkRedColor), 0);
    AssertEquals(alpha_of(darkRedColor), 255);
end;
procedure TIntegrationTests.TestColorDarkSalmonIntegration;
begin
    darkSalmonColor := color_dark_salmon();
    AssertEquals(red_of(darkSalmonColor), 233);
    AssertEquals(green_of(darkSalmonColor), 150);
    AssertEquals(blue_of(darkSalmonColor), 122);
    AssertEquals(alpha_of(darkSalmonColor), 255);
end;
procedure TIntegrationTests.TestColorDarkSeaGreenIntegration;
begin
    darkSeaGreenColor := color_dark_sea_green();
    AssertEquals(red_of(darkSeaGreenColor), 143);
    AssertEquals(green_of(darkSeaGreenColor), 188);
    AssertEquals(blue_of(darkSeaGreenColor), 139);
    AssertEquals(alpha_of(darkSeaGreenColor), 255);
end;
procedure TIntegrationTests.TestColorDarkSlateBlueIntegration;
begin
    darkSlateBlueColor := color_dark_slate_blue();
    AssertEquals(red_of(darkSlateBlueColor), 72);
    AssertEquals(green_of(darkSlateBlueColor), 61);
    AssertEquals(blue_of(darkSlateBlueColor), 139);
    AssertEquals(alpha_of(darkSlateBlueColor), 255);
end;
procedure TIntegrationTests.TestColorDarkSlateGrayIntegration;
begin
    darkSlateGrayColor := color_dark_slate_gray();
    AssertEquals(red_of(darkSlateGrayColor), 47);
    AssertEquals(green_of(darkSlateGrayColor), 79);
    AssertEquals(blue_of(darkSlateGrayColor), 79);
    AssertEquals(alpha_of(darkSlateGrayColor), 255);
end;
procedure TIntegrationTests.TestColorDarkTurquoiseIntegration;
begin
    darkTurquoiseColor := color_dark_turquoise();
    AssertEquals(red_of(darkTurquoiseColor), 0);
    AssertEquals(green_of(darkTurquoiseColor), 206);
    AssertEquals(blue_of(darkTurquoiseColor), 209);
    AssertEquals(alpha_of(darkTurquoiseColor), 255);
end;
procedure TIntegrationTests.TestColorDarkVioletIntegration;
begin
    darkVioletColor := color_dark_violet();
    AssertEquals(red_of(darkVioletColor), 148);
    AssertEquals(green_of(darkVioletColor), 0);
    AssertEquals(blue_of(darkVioletColor), 211);
    AssertEquals(alpha_of(darkVioletColor), 255);
end;
procedure TIntegrationTests.TestColorDeepPinkIntegration;
begin
    deepPinkColor := color_deep_pink();
    AssertEquals(red_of(deepPinkColor), 255);
    AssertEquals(green_of(deepPinkColor), 20);
    AssertEquals(blue_of(deepPinkColor), 147);
    AssertEquals(alpha_of(deepPinkColor), 255);
end;
procedure TIntegrationTests.TestColorDeepSkyBlueIntegration;
begin
    deepSkyBlueColor := color_deep_sky_blue();
    AssertEquals(red_of(deepSkyBlueColor), 0);
    AssertEquals(green_of(deepSkyBlueColor), 191);
    AssertEquals(blue_of(deepSkyBlueColor), 255);
    AssertEquals(alpha_of(deepSkyBlueColor), 255);
end;
procedure TIntegrationTests.TestColorDimGrayIntegration;
begin
    dimGrayColor := color_dim_gray();
    AssertEquals(red_of(dimGrayColor), 105);
    AssertEquals(green_of(dimGrayColor), 105);
    AssertEquals(blue_of(dimGrayColor), 105);
    AssertEquals(alpha_of(dimGrayColor), 255);
end;
procedure TIntegrationTests.TestColorDodgerBlueIntegration;
begin
    dodgerBlueColor := color_dodger_blue();
    AssertEquals(red_of(dodgerBlueColor), 30);
    AssertEquals(green_of(dodgerBlueColor), 144);
    AssertEquals(blue_of(dodgerBlueColor), 255);
    AssertEquals(alpha_of(dodgerBlueColor), 255);
end;
procedure TIntegrationTests.TestColorFirebrickIntegration;
begin
    firebrickColor := color_firebrick();
    AssertEquals(red_of(firebrickColor), 178);
    AssertEquals(green_of(firebrickColor), 34);
    AssertEquals(blue_of(firebrickColor), 34);
    AssertEquals(alpha_of(firebrickColor), 255);
end;
procedure TIntegrationTests.TestColorFloralWhiteIntegration;
begin
    floralWhiteColor := color_floral_white();
    AssertEquals(red_of(floralWhiteColor), 255);
    AssertEquals(green_of(floralWhiteColor), 250);
    AssertEquals(blue_of(floralWhiteColor), 240);
    AssertEquals(alpha_of(floralWhiteColor), 255);
end;
procedure TIntegrationTests.TestColorForestGreenIntegration;
begin
    forestGreenColor := color_forest_green();
    AssertEquals(red_of(forestGreenColor), 34);
    AssertEquals(green_of(forestGreenColor), 139);
    AssertEquals(blue_of(forestGreenColor), 34);
    AssertEquals(alpha_of(forestGreenColor), 255);
end;
procedure TIntegrationTests.TestColorFuchsiaIntegration;
begin
    fuchsiaColor := color_fuchsia();
    AssertEquals(red_of(fuchsiaColor), 255);
    AssertEquals(green_of(fuchsiaColor), 0);
    AssertEquals(blue_of(fuchsiaColor), 255);
    AssertEquals(alpha_of(fuchsiaColor), 255);
end;
procedure TIntegrationTests.TestColorGainsboroIntegration;
begin
    gainsboroColor := color_gainsboro();
    AssertEquals(red_of(gainsboroColor), 220);
    AssertEquals(green_of(gainsboroColor), 220);
    AssertEquals(blue_of(gainsboroColor), 220);
    AssertEquals(alpha_of(gainsboroColor), 255);
end;
procedure TIntegrationTests.TestColorGhostWhiteIntegration;
begin
    ghostWhiteColor := color_ghost_white();
    AssertEquals(red_of(ghostWhiteColor), 248);
    AssertEquals(green_of(ghostWhiteColor), 248);
    AssertEquals(blue_of(ghostWhiteColor), 255);
    AssertEquals(alpha_of(ghostWhiteColor), 255);
end;
procedure TIntegrationTests.TestColorGoldIntegration;
begin
    goldColor := color_gold();
    AssertEquals(red_of(goldColor), 255);
    AssertEquals(green_of(goldColor), 215);
    AssertEquals(blue_of(goldColor), 0);
    AssertEquals(alpha_of(goldColor), 255);
end;
procedure TIntegrationTests.TestColorGoldenrodIntegration;
begin
    goldenrodColor := color_goldenrod();
    AssertEquals(red_of(goldenrodColor), 218);
    AssertEquals(green_of(goldenrodColor), 165);
    AssertEquals(blue_of(goldenrodColor), 32);
    AssertEquals(alpha_of(goldenrodColor), 255);
end;
procedure TIntegrationTests.TestColorGrayIntegration;
begin
    grayColor := color_gray();
    AssertEquals(red_of(grayColor), 127);
    AssertEquals(green_of(grayColor), 127);
    AssertEquals(blue_of(grayColor), 127);
    AssertEquals(alpha_of(grayColor), 255);
end;
procedure TIntegrationTests.TestColorGreenIntegration;
begin
    greenColor := color_green();
    AssertEquals(red_of(greenColor), 0);
    AssertEquals(green_of(greenColor), 127);
    AssertEquals(blue_of(greenColor), 0);
    AssertEquals(alpha_of(greenColor), 255);
end;
procedure TIntegrationTests.TestColorGreenYellowIntegration;
begin
    greenYellowColor := color_green_yellow();
    AssertEquals(red_of(greenYellowColor), 173);
    AssertEquals(green_of(greenYellowColor), 255);
    AssertEquals(blue_of(greenYellowColor), 47);
    AssertEquals(alpha_of(greenYellowColor), 255);
end;
procedure TIntegrationTests.TestColorHoneydewIntegration;
begin
    honeydewColor := color_honeydew();
    AssertEquals(red_of(honeydewColor), 240);
    AssertEquals(green_of(honeydewColor), 255);
    AssertEquals(blue_of(honeydewColor), 240);
    AssertEquals(alpha_of(honeydewColor), 255);
end;
procedure TIntegrationTests.TestColorHotPinkIntegration;
begin
    hotPinkColor := color_hot_pink();
    AssertEquals(red_of(hotPinkColor), 255);
    AssertEquals(green_of(hotPinkColor), 105);
    AssertEquals(blue_of(hotPinkColor), 180);
    AssertEquals(alpha_of(hotPinkColor), 255);
end;
procedure TIntegrationTests.TestColorIndianRedIntegration;
begin
    indianRedColor := color_indian_red();
    AssertEquals(red_of(indianRedColor), 205);
    AssertEquals(green_of(indianRedColor), 92);
    AssertEquals(blue_of(indianRedColor), 92);
    AssertEquals(alpha_of(indianRedColor), 255);
end;
procedure TIntegrationTests.TestColorIndigoIntegration;
begin
    indigoColor := color_indigo();
    AssertEquals(red_of(indigoColor), 75);
    AssertEquals(green_of(indigoColor), 0);
    AssertEquals(blue_of(indigoColor), 130);
    AssertEquals(alpha_of(indigoColor), 255);
end;
procedure TIntegrationTests.TestColorIvoryIntegration;
begin
    ivoryColor := color_ivory();
    AssertEquals(red_of(ivoryColor), 255);
    AssertEquals(green_of(ivoryColor), 255);
    AssertEquals(blue_of(ivoryColor), 240);
    AssertEquals(alpha_of(ivoryColor), 255);
end;
procedure TIntegrationTests.TestColorKhakiIntegration;
begin
    khakiColor := color_khaki();
    AssertEquals(red_of(khakiColor), 240);
    AssertEquals(green_of(khakiColor), 230);
    AssertEquals(blue_of(khakiColor), 140);
    AssertEquals(alpha_of(khakiColor), 255);
end;
procedure TIntegrationTests.TestColorLavenderIntegration;
begin
    lavenderColor := color_lavender();
    AssertEquals(red_of(lavenderColor), 230);
    AssertEquals(green_of(lavenderColor), 230);
    AssertEquals(blue_of(lavenderColor), 250);
    AssertEquals(alpha_of(lavenderColor), 255);
end;
procedure TIntegrationTests.TestColorLavenderBlushIntegration;
begin
    lavenderBlushColor := color_lavender_blush();
    AssertEquals(red_of(lavenderBlushColor), 255);
    AssertEquals(green_of(lavenderBlushColor), 240);
    AssertEquals(blue_of(lavenderBlushColor), 245);
    AssertEquals(alpha_of(lavenderBlushColor), 255);
end;
procedure TIntegrationTests.TestColorLawnGreenIntegration;
begin
    lawnGreenColor := color_lawn_green();
    AssertEquals(red_of(lawnGreenColor), 124);
    AssertEquals(green_of(lawnGreenColor), 252);
    AssertEquals(blue_of(lawnGreenColor), 0);
    AssertEquals(alpha_of(lawnGreenColor), 255);
end;
procedure TIntegrationTests.TestColorLemonChiffonIntegration;
begin
    lemonChiffonColor := color_lemon_chiffon();
    AssertEquals(red_of(lemonChiffonColor), 255);
    AssertEquals(green_of(lemonChiffonColor), 250);
    AssertEquals(blue_of(lemonChiffonColor), 205);
    AssertEquals(alpha_of(lemonChiffonColor), 255);
end;
procedure TIntegrationTests.TestColorLightBlueIntegration;
begin
    lightBlueColor := color_light_blue();
    AssertEquals(red_of(lightBlueColor), 173);
    AssertEquals(green_of(lightBlueColor), 216);
    AssertEquals(blue_of(lightBlueColor), 230);
    AssertEquals(alpha_of(lightBlueColor), 255);
end;
procedure TIntegrationTests.TestColorLightCoralIntegration;
begin
    lightCoralColor := color_light_coral();
    AssertEquals(red_of(lightCoralColor), 240);
    AssertEquals(green_of(lightCoralColor), 127);
    AssertEquals(blue_of(lightCoralColor), 127);
    AssertEquals(alpha_of(lightCoralColor), 255);
end;
procedure TIntegrationTests.TestColorLightCyanIntegration;
begin
    lightCyanColor := color_light_cyan();
    AssertEquals(red_of(lightCyanColor), 224);
    AssertEquals(green_of(lightCyanColor), 255);
    AssertEquals(blue_of(lightCyanColor), 255);
    AssertEquals(alpha_of(lightCyanColor), 255);
end;
procedure TIntegrationTests.TestColorLightGoldenrodYellowIntegration;
begin
    lightGoldenrodYellowColor := color_light_goldenrod_yellow();
    AssertEquals(red_of(lightGoldenrodYellowColor), 250);
    AssertEquals(green_of(lightGoldenrodYellowColor), 250);
    AssertEquals(blue_of(lightGoldenrodYellowColor), 210);
    AssertEquals(alpha_of(lightGoldenrodYellowColor), 255);
end;
procedure TIntegrationTests.TestColorLightGrayIntegration;
begin
    lightGrayColor := color_light_gray();
    AssertEquals(red_of(lightGrayColor), 211);
    AssertEquals(green_of(lightGrayColor), 211);
    AssertEquals(blue_of(lightGrayColor), 211);
    AssertEquals(alpha_of(lightGrayColor), 255);
end;
procedure TIntegrationTests.TestColorLightGreenIntegration;
begin
    lightGreenColor := color_light_green();
    AssertEquals(red_of(lightGreenColor), 144);
    AssertEquals(green_of(lightGreenColor), 238);
    AssertEquals(blue_of(lightGreenColor), 144);
    AssertEquals(alpha_of(lightGreenColor), 255);
end;
procedure TIntegrationTests.TestColorLightPinkIntegration;
begin
    lightPinkColor := color_light_pink();
    AssertEquals(red_of(lightPinkColor), 255);
    AssertEquals(green_of(lightPinkColor), 182);
    AssertEquals(blue_of(lightPinkColor), 193);
    AssertEquals(alpha_of(lightPinkColor), 255);
end;
procedure TIntegrationTests.TestColorLightSalmonIntegration;
begin
    lightSalmonColor := color_light_salmon();
    AssertEquals(red_of(lightSalmonColor), 255);
    AssertEquals(green_of(lightSalmonColor), 160);
    AssertEquals(blue_of(lightSalmonColor), 122);
    AssertEquals(alpha_of(lightSalmonColor), 255);
end;
procedure TIntegrationTests.TestColorLightSeaGreenIntegration;
begin
    lightSeaGreenColor := color_light_sea_green();
    AssertEquals(red_of(lightSeaGreenColor), 32);
    AssertEquals(green_of(lightSeaGreenColor), 178);
    AssertEquals(blue_of(lightSeaGreenColor), 170);
    AssertEquals(alpha_of(lightSeaGreenColor), 255);
end;
procedure TIntegrationTests.TestColorLightSkyBlueIntegration;
begin
    lightSkyBlueColor := color_light_sky_blue();
    AssertEquals(red_of(lightSkyBlueColor), 135);
    AssertEquals(green_of(lightSkyBlueColor), 206);
    AssertEquals(blue_of(lightSkyBlueColor), 250);
    AssertEquals(alpha_of(lightSkyBlueColor), 255);
end;
procedure TIntegrationTests.TestColorLightSlateGrayIntegration;
begin
    lightSlateGrayColor := color_light_slate_gray();
    AssertEquals(red_of(lightSlateGrayColor), 119);
    AssertEquals(green_of(lightSlateGrayColor), 136);
    AssertEquals(blue_of(lightSlateGrayColor), 153);
    AssertEquals(alpha_of(lightSlateGrayColor), 255);
end;
procedure TIntegrationTests.TestColorLightSteelBlueIntegration;
begin
    lightSteelBlueColor := color_light_steel_blue();
    AssertEquals(red_of(lightSteelBlueColor), 176);
    AssertEquals(green_of(lightSteelBlueColor), 196);
    AssertEquals(blue_of(lightSteelBlueColor), 222);
    AssertEquals(alpha_of(lightSteelBlueColor), 255);
end;
procedure TIntegrationTests.TestColorLightYellowIntegration;
begin
    lightYellowColor := color_light_yellow();
    AssertEquals(red_of(lightYellowColor), 255);
    AssertEquals(green_of(lightYellowColor), 255);
    AssertEquals(blue_of(lightYellowColor), 224);
    AssertEquals(alpha_of(lightYellowColor), 255);
end;
procedure TIntegrationTests.TestColorLimeIntegration;
begin
    limeColor := color_lime();
    AssertEquals(red_of(limeColor), 0);
    AssertEquals(green_of(limeColor), 255);
    AssertEquals(blue_of(limeColor), 0);
    AssertEquals(alpha_of(limeColor), 255);
end;
procedure TIntegrationTests.TestColorLimeGreenIntegration;
begin
    limeGreenColor := color_lime_green();
    AssertEquals(red_of(limeGreenColor), 50);
    AssertEquals(green_of(limeGreenColor), 205);
    AssertEquals(blue_of(limeGreenColor), 50);
    AssertEquals(alpha_of(limeGreenColor), 255);
end;
procedure TIntegrationTests.TestColorLinenIntegration;
begin
    linenColor := color_linen();
    AssertEquals(red_of(linenColor), 250);
    AssertEquals(green_of(linenColor), 240);
    AssertEquals(blue_of(linenColor), 230);
    AssertEquals(alpha_of(linenColor), 255);
end;
procedure TIntegrationTests.TestColorMagentaIntegration;
begin
    magentaColor := color_magenta();
    AssertEquals(red_of(magentaColor), 255);
    AssertEquals(green_of(magentaColor), 0);
    AssertEquals(blue_of(magentaColor), 255);
    AssertEquals(alpha_of(magentaColor), 255);
end;
procedure TIntegrationTests.TestColorMaroonIntegration;
begin
    maroonColor := color_maroon();
    AssertEquals(red_of(maroonColor), 127);
    AssertEquals(green_of(maroonColor), 0);
    AssertEquals(blue_of(maroonColor), 0);
    AssertEquals(alpha_of(maroonColor), 255);
end;
procedure TIntegrationTests.TestColorMediumAquamarineIntegration;
begin
    mediumAquamarineColor := color_medium_aquamarine();
    AssertEquals(red_of(mediumAquamarineColor), 102);
    AssertEquals(green_of(mediumAquamarineColor), 205);
    AssertEquals(blue_of(mediumAquamarineColor), 170);
    AssertEquals(alpha_of(mediumAquamarineColor), 255);
end;
procedure TIntegrationTests.TestColorMediumBlueIntegration;
begin
    mediumBlueColor := color_medium_blue();
    AssertEquals(red_of(mediumBlueColor), 0);
    AssertEquals(green_of(mediumBlueColor), 0);
    AssertEquals(blue_of(mediumBlueColor), 205);
    AssertEquals(alpha_of(mediumBlueColor), 255);
end;
procedure TIntegrationTests.TestColorMediumOrchidIntegration;
begin
    mediumOrchidColor := color_medium_orchid();
    AssertEquals(red_of(mediumOrchidColor), 186);
    AssertEquals(green_of(mediumOrchidColor), 85);
    AssertEquals(blue_of(mediumOrchidColor), 211);
    AssertEquals(alpha_of(mediumOrchidColor), 255);
end;
procedure TIntegrationTests.TestColorMediumPurpleIntegration;
begin
    mediumPurpleColor := color_medium_purple();
    AssertEquals(red_of(mediumPurpleColor), 147);
    AssertEquals(green_of(mediumPurpleColor), 112);
    AssertEquals(blue_of(mediumPurpleColor), 219);
    AssertEquals(alpha_of(mediumPurpleColor), 255);
end;
procedure TIntegrationTests.TestColorMediumSeaGreenIntegration;
begin
    mediumSeaGreenColor := color_medium_sea_green();
    AssertEquals(red_of(mediumSeaGreenColor), 60);
    AssertEquals(green_of(mediumSeaGreenColor), 179);
    AssertEquals(blue_of(mediumSeaGreenColor), 113);
    AssertEquals(alpha_of(mediumSeaGreenColor), 255);
end;
procedure TIntegrationTests.TestColorMediumSlateBlueIntegration;
begin
    mediumSlateBlueColor := color_medium_slate_blue();
    AssertEquals(red_of(mediumSlateBlueColor), 123);
    AssertEquals(green_of(mediumSlateBlueColor), 104);
    AssertEquals(blue_of(mediumSlateBlueColor), 238);
    AssertEquals(alpha_of(mediumSlateBlueColor), 255);
end;
procedure TIntegrationTests.TestColorMediumSpringGreenIntegration;
begin
    mediumSpringGreenColor := color_medium_spring_green();
    AssertEquals(red_of(mediumSpringGreenColor), 0);
    AssertEquals(green_of(mediumSpringGreenColor), 250);
    AssertEquals(blue_of(mediumSpringGreenColor), 154);
    AssertEquals(alpha_of(mediumSpringGreenColor), 255);
end;
procedure TIntegrationTests.TestColorMediumTurquoiseIntegration;
begin
    mediumTurquoiseColor := color_medium_turquoise();
    AssertEquals(red_of(mediumTurquoiseColor), 72);
    AssertEquals(green_of(mediumTurquoiseColor), 209);
    AssertEquals(blue_of(mediumTurquoiseColor), 204);
    AssertEquals(alpha_of(mediumTurquoiseColor), 255);
end;
procedure TIntegrationTests.TestColorMediumVioletRedIntegration;
begin
    mediumVioletRedColor := color_medium_violet_red();
    AssertEquals(red_of(mediumVioletRedColor), 199);
    AssertEquals(green_of(mediumVioletRedColor), 21);
    AssertEquals(blue_of(mediumVioletRedColor), 133);
    AssertEquals(alpha_of(mediumVioletRedColor), 255);
end;
procedure TIntegrationTests.TestColorMidnightBlueIntegration;
begin
    midnightBlueColor := color_midnight_blue();
    AssertEquals(red_of(midnightBlueColor), 25);
    AssertEquals(green_of(midnightBlueColor), 25);
    AssertEquals(blue_of(midnightBlueColor), 112);
    AssertEquals(alpha_of(midnightBlueColor), 255);
end;
procedure TIntegrationTests.TestColorMintCreamIntegration;
begin
    mintCreamColor := color_mint_cream();
    AssertEquals(red_of(mintCreamColor), 245);
    AssertEquals(green_of(mintCreamColor), 255);
    AssertEquals(blue_of(mintCreamColor), 250);
    AssertEquals(alpha_of(mintCreamColor), 255);
end;
procedure TIntegrationTests.TestColorMistyRoseIntegration;
begin
    mistyRoseColor := color_misty_rose();
    AssertEquals(red_of(mistyRoseColor), 255);
    AssertEquals(green_of(mistyRoseColor), 228);
    AssertEquals(blue_of(mistyRoseColor), 225);
    AssertEquals(alpha_of(mistyRoseColor), 255);
end;
procedure TIntegrationTests.TestColorMoccasinIntegration;
begin
    moccasinColor := color_moccasin();
    AssertEquals(red_of(moccasinColor), 255);
    AssertEquals(green_of(moccasinColor), 228);
    AssertEquals(blue_of(moccasinColor), 181);
    AssertEquals(alpha_of(moccasinColor), 255);
end;
procedure TIntegrationTests.TestColorNavajoWhiteIntegration;
begin
    navajoWhiteColor := color_navajo_white();
    AssertEquals(red_of(navajoWhiteColor), 255);
    AssertEquals(green_of(navajoWhiteColor), 222);
    AssertEquals(blue_of(navajoWhiteColor), 173);
    AssertEquals(alpha_of(navajoWhiteColor), 255);
end;
procedure TIntegrationTests.TestColorNavyIntegration;
begin
    navyColor := color_navy();
    AssertEquals(red_of(navyColor), 0);
    AssertEquals(green_of(navyColor), 0);
    AssertEquals(blue_of(navyColor), 127);
    AssertEquals(alpha_of(navyColor), 255);
end;
procedure TIntegrationTests.TestColorOldLaceIntegration;
begin
    oldLaceColor := color_old_lace();
    AssertEquals(red_of(oldLaceColor), 253);
    AssertEquals(green_of(oldLaceColor), 245);
    AssertEquals(blue_of(oldLaceColor), 230);
    AssertEquals(alpha_of(oldLaceColor), 255);
end;
procedure TIntegrationTests.TestColorOliveIntegration;
begin
    oliveColor := color_olive();
    AssertEquals(red_of(oliveColor), 127);
    AssertEquals(green_of(oliveColor), 127);
    AssertEquals(blue_of(oliveColor), 0);
    AssertEquals(alpha_of(oliveColor), 255);
end;
procedure TIntegrationTests.TestColorOliveDrabIntegration;
begin
    oliveDrabColor := color_olive_drab();
    AssertEquals(red_of(oliveDrabColor), 107);
    AssertEquals(green_of(oliveDrabColor), 142);
    AssertEquals(blue_of(oliveDrabColor), 35);
    AssertEquals(alpha_of(oliveDrabColor), 255);
end;
procedure TIntegrationTests.TestColorOrangeIntegration;
begin
    orangeColor := color_orange();
    AssertEquals(red_of(orangeColor), 255);
    AssertEquals(green_of(orangeColor), 165);
    AssertEquals(blue_of(orangeColor), 0);
    AssertEquals(alpha_of(orangeColor), 255);
end;
procedure TIntegrationTests.TestColorOrangeRedIntegration;
begin
    orangeRedColor := color_orange_red();
    AssertEquals(red_of(orangeRedColor), 255);
    AssertEquals(green_of(orangeRedColor), 69);
    AssertEquals(blue_of(orangeRedColor), 0);
    AssertEquals(alpha_of(orangeRedColor), 255);
end;
procedure TIntegrationTests.TestColorOrchidIntegration;
begin
    orchidColor := color_orchid();
    AssertEquals(red_of(orchidColor), 218);
    AssertEquals(green_of(orchidColor), 112);
    AssertEquals(blue_of(orchidColor), 214);
    AssertEquals(alpha_of(orchidColor), 255);
end;
procedure TIntegrationTests.TestColorPaleGoldenrodIntegration;
begin
    paleGoldenrodColor := color_pale_goldenrod();
    AssertEquals(red_of(paleGoldenrodColor), 238);
    AssertEquals(green_of(paleGoldenrodColor), 232);
    AssertEquals(blue_of(paleGoldenrodColor), 170);
    AssertEquals(alpha_of(paleGoldenrodColor), 255);
end;
procedure TIntegrationTests.TestColorPaleGreenIntegration;
begin
    paleGreenColor := color_pale_green();
    AssertEquals(red_of(paleGreenColor), 152);
    AssertEquals(green_of(paleGreenColor), 251);
    AssertEquals(blue_of(paleGreenColor), 152);
    AssertEquals(alpha_of(paleGreenColor), 255);
end;
procedure TIntegrationTests.TestColorPaleTurquoiseIntegration;
begin
    paleTurquoiseColor := color_pale_turquoise();
    AssertEquals(red_of(paleTurquoiseColor), 175);
    AssertEquals(green_of(paleTurquoiseColor), 238);
    AssertEquals(blue_of(paleTurquoiseColor), 238);
    AssertEquals(alpha_of(paleTurquoiseColor), 255);
end;
procedure TIntegrationTests.TestColorPaleVioletRedIntegration;
begin
    paleVioletRedColor := color_pale_violet_red();
    AssertEquals(red_of(paleVioletRedColor), 219);
    AssertEquals(green_of(paleVioletRedColor), 112);
    AssertEquals(blue_of(paleVioletRedColor), 147);
    AssertEquals(alpha_of(paleVioletRedColor), 255);
end;
procedure TIntegrationTests.TestColorPapayaWhipIntegration;
begin
    papayaWhipColor := color_papaya_whip();
    AssertEquals(red_of(papayaWhipColor), 255);
    AssertEquals(green_of(papayaWhipColor), 239);
    AssertEquals(blue_of(papayaWhipColor), 213);
    AssertEquals(alpha_of(papayaWhipColor), 255);
end;
procedure TIntegrationTests.TestColorPeachPuffIntegration;
begin
    peachPuffColor := color_peach_puff();
    AssertEquals(red_of(peachPuffColor), 255);
    AssertEquals(green_of(peachPuffColor), 218);
    AssertEquals(blue_of(peachPuffColor), 185);
    AssertEquals(alpha_of(peachPuffColor), 255);
end;
procedure TIntegrationTests.TestColorPeruIntegration;
begin
    peruColor := color_peru();
    AssertEquals(red_of(peruColor), 205);
    AssertEquals(green_of(peruColor), 133);
    AssertEquals(blue_of(peruColor), 63);
    AssertEquals(alpha_of(peruColor), 255);
end;
procedure TIntegrationTests.TestColorPinkIntegration;
begin
    pinkColor := color_pink();
    AssertEquals(red_of(pinkColor), 255);
    AssertEquals(green_of(pinkColor), 192);
    AssertEquals(blue_of(pinkColor), 203);
    AssertEquals(alpha_of(pinkColor), 255);
end;
procedure TIntegrationTests.TestColorPlumIntegration;
begin
    plumColor := color_plum();
    AssertEquals(red_of(plumColor), 221);
    AssertEquals(green_of(plumColor), 160);
    AssertEquals(blue_of(plumColor), 221);
    AssertEquals(alpha_of(plumColor), 255);
end;
procedure TIntegrationTests.TestColorPowderBlueIntegration;
begin
    powderBlueColor := color_powder_blue();
    AssertEquals(red_of(powderBlueColor), 176);
    AssertEquals(green_of(powderBlueColor), 224);
    AssertEquals(blue_of(powderBlueColor), 230);
    AssertEquals(alpha_of(powderBlueColor), 255);
end;
procedure TIntegrationTests.TestColorPurpleIntegration;
begin
    purpleColor := color_purple();
    AssertEquals(red_of(purpleColor), 127);
    AssertEquals(green_of(purpleColor), 0);
    AssertEquals(blue_of(purpleColor), 127);
    AssertEquals(alpha_of(purpleColor), 255);
end;
procedure TIntegrationTests.TestColorRedIntegration;
begin
    redColor := color_red();
    AssertEquals(red_of(redColor), 255);
    AssertEquals(green_of(redColor), 0);
    AssertEquals(blue_of(redColor), 0);
    AssertEquals(alpha_of(redColor), 255);
end;
procedure TIntegrationTests.TestColorRosyBrownIntegration;
begin
    rosyBrownColor := color_rosy_brown();
    AssertEquals(red_of(rosyBrownColor), 188);
    AssertEquals(green_of(rosyBrownColor), 143);
    AssertEquals(blue_of(rosyBrownColor), 143);
    AssertEquals(alpha_of(rosyBrownColor), 255);
end;
procedure TIntegrationTests.TestColorRoyalBlueIntegration;
begin
    royalBlueColor := color_royal_blue();
    AssertEquals(red_of(royalBlueColor), 65);
    AssertEquals(green_of(royalBlueColor), 105);
    AssertEquals(blue_of(royalBlueColor), 225);
    AssertEquals(alpha_of(royalBlueColor), 255);
end;
procedure TIntegrationTests.TestColorSaddleBrownIntegration;
begin
    saddleBrownColor := color_saddle_brown();
    AssertEquals(red_of(saddleBrownColor), 139);
    AssertEquals(green_of(saddleBrownColor), 69);
    AssertEquals(blue_of(saddleBrownColor), 19);
    AssertEquals(alpha_of(saddleBrownColor), 255);
end;
procedure TIntegrationTests.TestColorSalmonIntegration;
begin
    salmonColor := color_salmon();
    AssertEquals(red_of(salmonColor), 250);
    AssertEquals(green_of(salmonColor), 127);
    AssertEquals(blue_of(salmonColor), 114);
    AssertEquals(alpha_of(salmonColor), 255);
end;
procedure TIntegrationTests.TestColorSandyBrownIntegration;
begin
    sandyBrownColor := color_sandy_brown();
    AssertEquals(red_of(sandyBrownColor), 244);
    AssertEquals(green_of(sandyBrownColor), 164);
    AssertEquals(blue_of(sandyBrownColor), 96);
    AssertEquals(alpha_of(sandyBrownColor), 255);
end;
procedure TIntegrationTests.TestColorSeaGreenIntegration;
begin
    seaGreenColor := color_sea_green();
    AssertEquals(red_of(seaGreenColor), 46);
    AssertEquals(green_of(seaGreenColor), 139);
    AssertEquals(blue_of(seaGreenColor), 87);
    AssertEquals(alpha_of(seaGreenColor), 255);
end;
procedure TIntegrationTests.TestColorSeaShellIntegration;
begin
    seaShellColor := color_sea_shell();
    AssertEquals(red_of(seaShellColor), 255);
    AssertEquals(green_of(seaShellColor), 245);
    AssertEquals(blue_of(seaShellColor), 238);
    AssertEquals(alpha_of(seaShellColor), 255);
end;
procedure TIntegrationTests.TestColorSiennaIntegration;
begin
    siennaColor := color_sienna();
    AssertEquals(red_of(siennaColor), 160);
    AssertEquals(green_of(siennaColor), 82);
    AssertEquals(blue_of(siennaColor), 45);
    AssertEquals(alpha_of(siennaColor), 255);
end;
procedure TIntegrationTests.TestColorSilverIntegration;
begin
    silverColor := color_silver();
    AssertEquals(red_of(silverColor), 192);
    AssertEquals(green_of(silverColor), 192);
    AssertEquals(blue_of(silverColor), 192);
    AssertEquals(alpha_of(silverColor), 255);
end;
procedure TIntegrationTests.TestColorSkyBlueIntegration;
begin
    skyBlueColor := color_sky_blue();
    AssertEquals(red_of(skyBlueColor), 135);
    AssertEquals(green_of(skyBlueColor), 206);
    AssertEquals(blue_of(skyBlueColor), 235);
    AssertEquals(alpha_of(skyBlueColor), 255);
end;
procedure TIntegrationTests.TestColorSlateBlueIntegration;
begin
    slateBlueColor := color_slate_blue();
    AssertEquals(red_of(slateBlueColor), 106);
    AssertEquals(green_of(slateBlueColor), 90);
    AssertEquals(blue_of(slateBlueColor), 205);
    AssertEquals(alpha_of(slateBlueColor), 255);
end;
procedure TIntegrationTests.TestColorSlateGrayIntegration;
begin
    slateGrayColor := color_slate_gray();
    AssertEquals(red_of(slateGrayColor), 112);
    AssertEquals(green_of(slateGrayColor), 127);
    AssertEquals(blue_of(slateGrayColor), 144);
    AssertEquals(alpha_of(slateGrayColor), 255);
end;
procedure TIntegrationTests.TestColorSnowIntegration;
begin
    snowColor := color_snow();
    AssertEquals(red_of(snowColor), 255);
    AssertEquals(green_of(snowColor), 250);
    AssertEquals(blue_of(snowColor), 250);
    AssertEquals(alpha_of(snowColor), 255);
end;
procedure TIntegrationTests.TestColorSpringGreenIntegration;
begin
    springGreenColor := color_spring_green();
    AssertEquals(red_of(springGreenColor), 0);
    AssertEquals(green_of(springGreenColor), 255);
    AssertEquals(blue_of(springGreenColor), 127);
    AssertEquals(alpha_of(springGreenColor), 255);
end;
procedure TIntegrationTests.TestColorSteelBlueIntegration;
begin
    steelBlueColor := color_steel_blue();
    AssertEquals(red_of(steelBlueColor), 70);
    AssertEquals(green_of(steelBlueColor), 130);
    AssertEquals(blue_of(steelBlueColor), 180);
    AssertEquals(alpha_of(steelBlueColor), 255);
end;
procedure TIntegrationTests.TestColorSwinburneRedIntegration;
begin
    swinburneRedColor := color_swinburne_red();
    AssertEquals(red_of(swinburneRedColor), 237);
    AssertEquals(green_of(swinburneRedColor), 36);
    AssertEquals(blue_of(swinburneRedColor), 25);
    AssertEquals(alpha_of(swinburneRedColor), 255);
end;
procedure TIntegrationTests.TestColorTanIntegration;
begin
    tanColor := color_tan();
    AssertEquals(red_of(tanColor), 210);
    AssertEquals(green_of(tanColor), 180);
    AssertEquals(blue_of(tanColor), 140);
    AssertEquals(alpha_of(tanColor), 255);
end;
procedure TIntegrationTests.TestColorTealIntegration;
begin
    tealColor := color_teal();
    AssertEquals(red_of(tealColor), 0);
    AssertEquals(green_of(tealColor), 127);
    AssertEquals(blue_of(tealColor), 127);
    AssertEquals(alpha_of(tealColor), 255);
end;
procedure TIntegrationTests.TestColorThistleIntegration;
begin
    thistleColor := color_thistle();
    AssertEquals(red_of(thistleColor), 216);
    AssertEquals(green_of(thistleColor), 191);
    AssertEquals(blue_of(thistleColor), 216);
    AssertEquals(alpha_of(thistleColor), 255);
end;
procedure TIntegrationTests.TestColorToStringIntegration;
begin
    redColor := color_red();
    redColorString := color_to_string(redColor);
    AssertEquals(redColorString, "#ff0000ff");
    transparentColor := color_transparent();
    transparentColorString := color_to_string(transparentColor);
    AssertEquals(transparentColorString, "#ffffffff");
end;
procedure TIntegrationTests.TestColorTomatoIntegration;
begin
    tomatoColor := color_tomato();
    AssertEquals(red_of(tomatoColor), 255);
    AssertEquals(green_of(tomatoColor), 99);
    AssertEquals(blue_of(tomatoColor), 71);
    AssertEquals(alpha_of(tomatoColor), 255);
end;
procedure TIntegrationTests.TestColorTransparentIntegration;
begin
    transparentColor := color_transparent();
    AssertEquals(alpha_of(transparentColor), 255);
    AssertEquals(red_of(transparentColor), 255);
    AssertEquals(green_of(transparentColor), 255);
    AssertEquals(blue_of(transparentColor), 255);
end;
procedure TIntegrationTests.TestColorTurquoiseIntegration;
begin
    turquoiseColor := color_turquoise();
    AssertEquals(red_of(turquoiseColor), 64);
    AssertEquals(green_of(turquoiseColor), 224);
    AssertEquals(blue_of(turquoiseColor), 208);
    AssertEquals(alpha_of(turquoiseColor), 255);
end;
procedure TIntegrationTests.TestColorVioletIntegration;
begin
    violetColor := color_violet();
    AssertEquals(red_of(violetColor), 238);
    AssertEquals(green_of(violetColor), 130);
    AssertEquals(blue_of(violetColor), 238);
    AssertEquals(alpha_of(violetColor), 255);
end;
procedure TIntegrationTests.TestColorWheatIntegration;
begin
    wheatColor := color_wheat();
    AssertEquals(red_of(wheatColor), 245);
    AssertEquals(green_of(wheatColor), 222);
    AssertEquals(blue_of(wheatColor), 179);
    AssertEquals(alpha_of(wheatColor), 255);
end;
procedure TIntegrationTests.TestColorWhiteIntegration;
begin
    whiteColor := color_white();
    AssertEquals(red_of(whiteColor), 255);
    AssertEquals(green_of(whiteColor), 255);
    AssertEquals(blue_of(whiteColor), 255);
    AssertEquals(alpha_of(whiteColor), 255);
end;
procedure TIntegrationTests.TestColorWhiteSmokeIntegration;
begin
    whiteSmokeColor := color_white_smoke();
    AssertEquals(red_of(whiteSmokeColor), 245);
    AssertEquals(green_of(whiteSmokeColor), 245);
    AssertEquals(blue_of(whiteSmokeColor), 245);
    AssertEquals(alpha_of(whiteSmokeColor), 255);
end;
procedure TIntegrationTests.TestColorYellowIntegration;
begin
    yellowColor := color_yellow();
    AssertEquals(red_of(yellowColor), 255);
    AssertEquals(green_of(yellowColor), 255);
    AssertEquals(blue_of(yellowColor), 0);
    AssertEquals(alpha_of(yellowColor), 255);
end;
procedure TIntegrationTests.TestColorYellowGreenIntegration;
begin
    yellowGreenColor := color_yellow_green();
    AssertEquals(red_of(yellowGreenColor), 154);
    AssertEquals(green_of(yellowGreenColor), 205);
    AssertEquals(blue_of(yellowGreenColor), 50);
    AssertEquals(alpha_of(yellowGreenColor), 255);
end;
procedure TIntegrationTests.TestGreenOfIntegration;
begin
    greenColor := color_green();
    greenValue := green_of(greenColor);
    AssertEquals(greenValue, 127);
    blackColor := color_black();
    blackGreenValue := green_of(blackColor);
    AssertEquals(blackGreenValue, 0);
end;
procedure TIntegrationTests.TestHSBColorIntegration;
begin
    redColor := hsb_color(0.0, 1.0, 1.0);
    AssertEquals(hue_of(redColor), 0.0);
    AssertEquals(saturation_of(redColor), 1.0);
    AssertEquals(brightness_of(redColor), 1.0);
    grayColor := hsb_color(0.5, 0.0, 0.5);
    AssertEquals(saturation_of(grayColor), 0.0);
end;
procedure TIntegrationTests.TestHueOfIntegration;
begin
    redColor := color_red();
    hueValue := hue_of(redColor);
    AssertEquals(hueValue, 0.0);
    blueColor := color_blue();
    hueValueBlue := hue_of(blueColor);
    AssertEquals(hueValueBlue, 0.6666666666666666);
end;
procedure TIntegrationTests.TestRandomColorIntegration;
begin
    randomColorResult := random_color();
    AssertNotEquals(color_to_string(randomColorResult), "#000000FF");
    AssertTrue((alpha_of(randomColorResult) >= 0) and (alpha_of(randomColorResult) <= 255));
end;
procedure TIntegrationTests.TestRandomRGBColorIntegration;
begin
    randomColor := random_rgb_color(255);
    AssertTrue((red_of(randomColor) >= 0) and (red_of(randomColor) <= 255));
    AssertTrue((green_of(randomColor) >= 0) and (green_of(randomColor) <= 255));
    AssertTrue((blue_of(randomColor) >= 0) and (blue_of(randomColor) <= 255));
    AssertEquals(alpha_of(randomColor), 255);
end;
procedure TIntegrationTests.TestRedOfIntegration;
begin
    redColor := color_red();
    redValue := red_of(redColor);
    AssertEquals(redValue, 255);
    blueColor := color_blue();
    blueRedValue := red_of(blueColor);
    AssertEquals(blueRedValue, 0);
end;
procedure TIntegrationTests.TestRGBColorFromDoubleIntegration;
begin
    redColor := rgb_color(1.0, 0.0, 0.0);
    AssertEquals(red_of(redColor), 255);
    AssertEquals(green_of(redColor), 0);
    AssertEquals(blue_of(redColor), 0);
    greenColor := rgb_color(0.0, 1.0, 0.0);
    AssertEquals(red_of(greenColor), 0);
    AssertEquals(green_of(greenColor), 255);
    AssertEquals(blue_of(greenColor), 0);
end;
procedure TIntegrationTests.TestRGBColorIntegration;
begin
    redColor := rgb_color(255, 0, 0);
    AssertEquals(red_of(redColor), 255);
    AssertEquals(green_of(redColor), 0);
    AssertEquals(blue_of(redColor), 0);
    AssertEquals(alpha_of(redColor), 255);
end;
procedure TIntegrationTests.TestRGBAColorFromDoubleIntegration;
begin
    testColor := rgba_color(1.0, 0.5, 0.0, 0.75);
    AssertEquals(red_of(testColor), 255);
    AssertEquals(green_of(testColor), 127);
    AssertEquals(blue_of(testColor), 0);
    AssertEquals(alpha_of(testColor), 191);
end;
procedure TIntegrationTests.TestRGBAColorIntegration;
begin
    redColor := rgba_color(255, 0, 0, 255);
    AssertEquals(red_of(redColor), 255);
    AssertEquals(green_of(redColor), 0);
    AssertEquals(blue_of(redColor), 0);
    AssertEquals(alpha_of(redColor), 255);
end;
procedure TIntegrationTests.TestSaturationOfIntegration;
begin
    redColor := color_red();
    saturationValue := saturation_of(redColor);
    AssertEquals(saturationValue, 1.0);
    grayColor := color_gray();
    saturationValueGray := saturation_of(grayColor);
    AssertEquals(saturationValueGray, 0.0);
end;
procedure TIntegrationTests.TestStringToColorIntegration;
begin
    redColor := string_to_color("#FF0000FF");
    AssertEquals(red_of(redColor), 255);
    AssertEquals(green_of(redColor), 0);
    AssertEquals(blue_of(redColor), 0);
    AssertEquals(alpha_of(redColor), 255);
    greenColor := string_to_color("#00FF00FF");
    AssertEquals(red_of(greenColor), 0);
    AssertEquals(green_of(greenColor), 255);
    AssertEquals(blue_of(greenColor), 0);
    AssertEquals(alpha_of(greenColor), 255);
end;
end;

procedure RegisterTests;
begin
TestFramework.RegisterTest(TIntegrationTests.Suite);
end;
