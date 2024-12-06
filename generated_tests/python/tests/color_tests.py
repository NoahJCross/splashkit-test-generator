import pytest
from splashkit import *


def test_AlphaOf_integration():
    red_color = ColorRed()
    alpha_value = AlphaOf(red_color)
    assert alpha_value == 255
    transparent_color = ColorTransparent()
    alpha_value_transparent = AlphaOf(transparent_color)
    assert alpha_value_transparent == 255


def test_BlueOf_integration():
    blue_color = ColorBlue()
    blue_value = BlueOf(blue_color)
    assert blue_value == 255
    red_color = ColorRed()
    blue_value_red = BlueOf(red_color)
    assert blue_value_red == 0


def test_BrightnessOf_integration():
    white_color = ColorWhite()
    white_brightness = BrightnessOf(white_color)
    assert white_brightness == 1.0
    black_color = ColorBlack()
    black_brightness = BrightnessOf(black_color)
    assert black_brightness == 0.0
    gray_color = ColorGray()
    gray_brightness = BrightnessOf(gray_color)
    assert 0.4 <= gray_brightness <= 0.6


def test_ColorAliceBlue_integration():
    alice_blue_color = ColorAliceBlue()
    assert RedOf(alice_blue_color) == 240
    assert GreenOf(alice_blue_color) == 248
    assert BlueOf(alice_blue_color) == 255
    assert AlphaOf(alice_blue_color) == 255


def test_ColorAntiqueWhite_integration():
    antique_white_color = ColorAntiqueWhite()
    assert RedOf(antique_white_color) == 250
    assert GreenOf(antique_white_color) == 235
    assert BlueOf(antique_white_color) == 215
    assert AlphaOf(antique_white_color) == 255


def test_ColorAqua_integration():
    aqua_color = ColorAqua()
    assert RedOf(aqua_color) == 0
    assert GreenOf(aqua_color) == 255
    assert BlueOf(aqua_color) == 255
    assert AlphaOf(aqua_color) == 255


def test_ColorAquamarine_integration():
    aquamarine_color = ColorAquamarine()
    assert RedOf(aquamarine_color) == 127
    assert GreenOf(aquamarine_color) == 255
    assert BlueOf(aquamarine_color) == 212
    assert AlphaOf(aquamarine_color) == 255


def test_ColorAzure_integration():
    azure_color = ColorAzure()
    assert RedOf(azure_color) == 240
    assert GreenOf(azure_color) == 255
    assert BlueOf(azure_color) == 255
    assert AlphaOf(azure_color) == 255


def test_ColorBeige_integration():
    beige_color = ColorBeige()
    assert RedOf(beige_color) == 245
    assert GreenOf(beige_color) == 245
    assert BlueOf(beige_color) == 220
    assert AlphaOf(beige_color) == 255


def test_ColorBisque_integration():
    bisque_color = ColorBisque()
    assert RedOf(bisque_color) == 255
    assert GreenOf(bisque_color) == 228
    assert BlueOf(bisque_color) == 196
    assert AlphaOf(bisque_color) == 255


def test_ColorBlack_integration():
    black_color = ColorBlack()
    assert RedOf(black_color) == 0
    assert GreenOf(black_color) == 0
    assert BlueOf(black_color) == 0
    assert AlphaOf(black_color) == 255


def test_ColorBlanchedAlmond_integration():
    blanched_almond_color = ColorBlanchedAlmond()
    assert RedOf(blanched_almond_color) == 255
    assert GreenOf(blanched_almond_color) == 235
    assert BlueOf(blanched_almond_color) == 205
    assert AlphaOf(blanched_almond_color) == 255


def test_ColorBlue_integration():
    blue_color = ColorBlue()
    assert RedOf(blue_color) == 0
    assert GreenOf(blue_color) == 0
    assert BlueOf(blue_color) == 255
    assert AlphaOf(blue_color) == 255


def test_ColorBlueViolet_integration():
    blue_violet_color = ColorBlueViolet()
    assert RedOf(blue_violet_color) == 138
    assert GreenOf(blue_violet_color) == 43
    assert BlueOf(blue_violet_color) == 226
    assert AlphaOf(blue_violet_color) == 255


def test_ColorBrightGreen_integration():
    bright_green_color = ColorBrightGreen()
    assert RedOf(bright_green_color) == 0
    assert GreenOf(bright_green_color) == 255
    assert BlueOf(bright_green_color) == 0
    assert AlphaOf(bright_green_color) == 255


def test_ColorBrown_integration():
    brown_color = ColorBrown()
    assert RedOf(brown_color) == 165
    assert GreenOf(brown_color) == 42
    assert BlueOf(brown_color) == 42
    assert AlphaOf(brown_color) == 255


def test_ColorBurlyWood_integration():
    burly_wood_color = ColorBurlyWood()
    assert RedOf(burly_wood_color) == 222
    assert GreenOf(burly_wood_color) == 184
    assert BlueOf(burly_wood_color) == 135
    assert AlphaOf(burly_wood_color) == 255


def test_ColorCadetBlue_integration():
    cadet_blue_color = ColorCadetBlue()
    assert RedOf(cadet_blue_color) == 95
    assert GreenOf(cadet_blue_color) == 158
    assert BlueOf(cadet_blue_color) == 160
    assert AlphaOf(cadet_blue_color) == 255


def test_ColorChartreuse_integration():
    chartreuse_color = ColorChartreuse()
    assert RedOf(chartreuse_color) == 127
    assert GreenOf(chartreuse_color) == 255
    assert BlueOf(chartreuse_color) == 0
    assert AlphaOf(chartreuse_color) == 255


def test_ColorChocolate_integration():
    chocolate_color = ColorChocolate()
    assert RedOf(chocolate_color) == 210
    assert GreenOf(chocolate_color) == 105
    assert BlueOf(chocolate_color) == 30
    assert AlphaOf(chocolate_color) == 255


def test_ColorCoral_integration():
    coral_color = ColorCoral()
    assert RedOf(coral_color) == 255
    assert GreenOf(coral_color) == 127
    assert BlueOf(coral_color) == 80
    assert AlphaOf(coral_color) == 255


def test_ColorCornflowerBlue_integration():
    cornflower_blue_color = ColorCornflowerBlue()
    assert RedOf(cornflower_blue_color) == 100
    assert GreenOf(cornflower_blue_color) == 149
    assert BlueOf(cornflower_blue_color) == 237
    assert AlphaOf(cornflower_blue_color) == 255


def test_ColorCornsilk_integration():
    cornsilk_color = ColorCornsilk()
    assert RedOf(cornsilk_color) == 255
    assert GreenOf(cornsilk_color) == 248
    assert BlueOf(cornsilk_color) == 220
    assert AlphaOf(cornsilk_color) == 255


def test_ColorCrimson_integration():
    crimson_color = ColorCrimson()
    assert RedOf(crimson_color) == 220
    assert GreenOf(crimson_color) == 20
    assert BlueOf(crimson_color) == 60
    assert AlphaOf(crimson_color) == 255


def test_ColorCyan_integration():
    cyan_color = ColorCyan()
    assert RedOf(cyan_color) == 0
    assert GreenOf(cyan_color) == 255
    assert BlueOf(cyan_color) == 255
    assert AlphaOf(cyan_color) == 255


def test_ColorDarkBlue_integration():
    dark_blue_color = ColorDarkBlue()
    assert RedOf(dark_blue_color) == 0
    assert GreenOf(dark_blue_color) == 0
    assert BlueOf(dark_blue_color) == 139
    assert AlphaOf(dark_blue_color) == 255


def test_ColorDarkCyan_integration():
    dark_cyan_color = ColorDarkCyan()
    assert RedOf(dark_cyan_color) == 0
    assert GreenOf(dark_cyan_color) == 139
    assert BlueOf(dark_cyan_color) == 139
    assert AlphaOf(dark_cyan_color) == 255


def test_ColorDarkGoldenrod_integration():
    dark_goldenrod_color = ColorDarkGoldenrod()
    assert RedOf(dark_goldenrod_color) == 184
    assert GreenOf(dark_goldenrod_color) == 134
    assert BlueOf(dark_goldenrod_color) == 11
    assert AlphaOf(dark_goldenrod_color) == 255


def test_ColorDarkGray_integration():
    dark_gray_color = ColorDarkGray()
    assert RedOf(dark_gray_color) == 169
    assert GreenOf(dark_gray_color) == 169
    assert BlueOf(dark_gray_color) == 169
    assert AlphaOf(dark_gray_color) == 255


def test_ColorDarkGreen_integration():
    dark_green_color = ColorDarkGreen()
    assert RedOf(dark_green_color) == 0
    assert GreenOf(dark_green_color) == 100
    assert BlueOf(dark_green_color) == 0
    assert AlphaOf(dark_green_color) == 255


def test_ColorDarkKhaki_integration():
    dark_khaki_color = ColorDarkKhaki()
    assert RedOf(dark_khaki_color) == 189
    assert GreenOf(dark_khaki_color) == 183
    assert BlueOf(dark_khaki_color) == 107
    assert AlphaOf(dark_khaki_color) == 255


def test_ColorDarkMagenta_integration():
    dark_magenta_color = ColorDarkMagenta()
    assert RedOf(dark_magenta_color) == 139
    assert GreenOf(dark_magenta_color) == 0
    assert BlueOf(dark_magenta_color) == 139
    assert AlphaOf(dark_magenta_color) == 255


def test_ColorDarkOliveGreen_integration():
    dark_olive_green_color = ColorDarkOliveGreen()
    assert RedOf(dark_olive_green_color) == 85
    assert GreenOf(dark_olive_green_color) == 107
    assert BlueOf(dark_olive_green_color) == 47
    assert AlphaOf(dark_olive_green_color) == 255


def test_ColorDarkOrange_integration():
    dark_orange_color = ColorDarkOrange()
    assert RedOf(dark_orange_color) == 255
    assert GreenOf(dark_orange_color) == 140
    assert BlueOf(dark_orange_color) == 0
    assert AlphaOf(dark_orange_color) == 255


def test_ColorDarkOrchid_integration():
    dark_orchid_color = ColorDarkOrchid()
    assert RedOf(dark_orchid_color) == 153
    assert GreenOf(dark_orchid_color) == 50
    assert BlueOf(dark_orchid_color) == 204
    assert AlphaOf(dark_orchid_color) == 255


def test_ColorDarkRed_integration():
    dark_red_color = ColorDarkRed()
    assert RedOf(dark_red_color) == 139
    assert GreenOf(dark_red_color) == 0
    assert BlueOf(dark_red_color) == 0
    assert AlphaOf(dark_red_color) == 255


def test_ColorDarkSalmon_integration():
    dark_salmon_color = ColorDarkSalmon()
    assert RedOf(dark_salmon_color) == 233
    assert GreenOf(dark_salmon_color) == 150
    assert BlueOf(dark_salmon_color) == 122
    assert AlphaOf(dark_salmon_color) == 255


def test_ColorDarkSeaGreen_integration():
    dark_sea_green_color = ColorDarkSeaGreen()
    assert RedOf(dark_sea_green_color) == 143
    assert GreenOf(dark_sea_green_color) == 188
    assert BlueOf(dark_sea_green_color) == 139
    assert AlphaOf(dark_sea_green_color) == 255


def test_ColorDarkSlateBlue_integration():
    dark_slate_blue_color = ColorDarkSlateBlue()
    assert RedOf(dark_slate_blue_color) == 72
    assert GreenOf(dark_slate_blue_color) == 61
    assert BlueOf(dark_slate_blue_color) == 139
    assert AlphaOf(dark_slate_blue_color) == 255


def test_ColorDarkSlateGray_integration():
    dark_slate_gray_color = ColorDarkSlateGray()
    assert RedOf(dark_slate_gray_color) == 47
    assert GreenOf(dark_slate_gray_color) == 79
    assert BlueOf(dark_slate_gray_color) == 79
    assert AlphaOf(dark_slate_gray_color) == 255


def test_ColorDarkTurquoise_integration():
    dark_turquoise_color = ColorDarkTurquoise()
    assert RedOf(dark_turquoise_color) == 0
    assert GreenOf(dark_turquoise_color) == 206
    assert BlueOf(dark_turquoise_color) == 209
    assert AlphaOf(dark_turquoise_color) == 255


def test_ColorDarkViolet_integration():
    dark_violet_color = ColorDarkViolet()
    assert RedOf(dark_violet_color) == 148
    assert GreenOf(dark_violet_color) == 0
    assert BlueOf(dark_violet_color) == 211
    assert AlphaOf(dark_violet_color) == 255


def test_ColorDeepPink_integration():
    deep_pink_color = ColorDeepPink()
    assert RedOf(deep_pink_color) == 255
    assert GreenOf(deep_pink_color) == 20
    assert BlueOf(deep_pink_color) == 147
    assert AlphaOf(deep_pink_color) == 255


def test_ColorDeepSkyBlue_integration():
    deep_sky_blue_color = ColorDeepSkyBlue()
    assert RedOf(deep_sky_blue_color) == 0
    assert GreenOf(deep_sky_blue_color) == 191
    assert BlueOf(deep_sky_blue_color) == 255
    assert AlphaOf(deep_sky_blue_color) == 255


def test_ColorDimGray_integration():
    dim_gray_color = ColorDimGray()
    assert RedOf(dim_gray_color) == 105
    assert GreenOf(dim_gray_color) == 105
    assert BlueOf(dim_gray_color) == 105
    assert AlphaOf(dim_gray_color) == 255


def test_ColorDodgerBlue_integration():
    dodger_blue_color = ColorDodgerBlue()
    assert RedOf(dodger_blue_color) == 30
    assert GreenOf(dodger_blue_color) == 144
    assert BlueOf(dodger_blue_color) == 255
    assert AlphaOf(dodger_blue_color) == 255


def test_ColorFirebrick_integration():
    firebrick_color = ColorFirebrick()
    assert RedOf(firebrick_color) == 178
    assert GreenOf(firebrick_color) == 34
    assert BlueOf(firebrick_color) == 34
    assert AlphaOf(firebrick_color) == 255


def test_ColorFloralWhite_integration():
    floral_white_color = ColorFloralWhite()
    assert RedOf(floral_white_color) == 255
    assert GreenOf(floral_white_color) == 250
    assert BlueOf(floral_white_color) == 240
    assert AlphaOf(floral_white_color) == 255


def test_ColorForestGreen_integration():
    forest_green_color = ColorForestGreen()
    assert RedOf(forest_green_color) == 34
    assert GreenOf(forest_green_color) == 139
    assert BlueOf(forest_green_color) == 34
    assert AlphaOf(forest_green_color) == 255


def test_ColorFuchsia_integration():
    fuchsia_color = ColorFuchsia()
    assert RedOf(fuchsia_color) == 255
    assert GreenOf(fuchsia_color) == 0
    assert BlueOf(fuchsia_color) == 255
    assert AlphaOf(fuchsia_color) == 255


def test_ColorGainsboro_integration():
    gainsboro_color = ColorGainsboro()
    assert RedOf(gainsboro_color) == 220
    assert GreenOf(gainsboro_color) == 220
    assert BlueOf(gainsboro_color) == 220
    assert AlphaOf(gainsboro_color) == 255


def test_ColorGhostWhite_integration():
    ghost_white_color = ColorGhostWhite()
    assert RedOf(ghost_white_color) == 248
    assert GreenOf(ghost_white_color) == 248
    assert BlueOf(ghost_white_color) == 255
    assert AlphaOf(ghost_white_color) == 255


def test_ColorGold_integration():
    gold_color = ColorGold()
    assert RedOf(gold_color) == 255
    assert GreenOf(gold_color) == 215
    assert BlueOf(gold_color) == 0
    assert AlphaOf(gold_color) == 255


def test_ColorGoldenrod_integration():
    goldenrod_color = ColorGoldenrod()
    assert RedOf(goldenrod_color) == 218
    assert GreenOf(goldenrod_color) == 165
    assert BlueOf(goldenrod_color) == 32
    assert AlphaOf(goldenrod_color) == 255


def test_ColorGray_integration():
    gray_color = ColorGray()
    assert RedOf(gray_color) == 127
    assert GreenOf(gray_color) == 127
    assert BlueOf(gray_color) == 127
    assert AlphaOf(gray_color) == 255


def test_ColorGreen_integration():
    green_color = ColorGreen()
    assert RedOf(green_color) == 0
    assert GreenOf(green_color) == 127
    assert BlueOf(green_color) == 0
    assert AlphaOf(green_color) == 255


def test_ColorGreenYellow_integration():
    green_yellow_color = ColorGreenYellow()
    assert RedOf(green_yellow_color) == 173
    assert GreenOf(green_yellow_color) == 255
    assert BlueOf(green_yellow_color) == 47
    assert AlphaOf(green_yellow_color) == 255


def test_ColorHoneydew_integration():
    honeydew_color = ColorHoneydew()
    assert RedOf(honeydew_color) == 240
    assert GreenOf(honeydew_color) == 255
    assert BlueOf(honeydew_color) == 240
    assert AlphaOf(honeydew_color) == 255


def test_ColorHotPink_integration():
    hot_pink_color = ColorHotPink()
    assert RedOf(hot_pink_color) == 255
    assert GreenOf(hot_pink_color) == 105
    assert BlueOf(hot_pink_color) == 180
    assert AlphaOf(hot_pink_color) == 255


def test_ColorIndianRed_integration():
    indian_red_color = ColorIndianRed()
    assert RedOf(indian_red_color) == 205
    assert GreenOf(indian_red_color) == 92
    assert BlueOf(indian_red_color) == 92
    assert AlphaOf(indian_red_color) == 255


def test_ColorIndigo_integration():
    indigo_color = ColorIndigo()
    assert RedOf(indigo_color) == 75
    assert GreenOf(indigo_color) == 0
    assert BlueOf(indigo_color) == 130
    assert AlphaOf(indigo_color) == 255


def test_ColorIvory_integration():
    ivory_color = ColorIvory()
    assert RedOf(ivory_color) == 255
    assert GreenOf(ivory_color) == 255
    assert BlueOf(ivory_color) == 240
    assert AlphaOf(ivory_color) == 255


def test_ColorKhaki_integration():
    khaki_color = ColorKhaki()
    assert RedOf(khaki_color) == 240
    assert GreenOf(khaki_color) == 230
    assert BlueOf(khaki_color) == 140
    assert AlphaOf(khaki_color) == 255


def test_ColorLavender_integration():
    lavender_color = ColorLavender()
    assert RedOf(lavender_color) == 230
    assert GreenOf(lavender_color) == 230
    assert BlueOf(lavender_color) == 250
    assert AlphaOf(lavender_color) == 255


def test_ColorLavenderBlush_integration():
    lavender_blush_color = ColorLavenderBlush()
    assert RedOf(lavender_blush_color) == 255
    assert GreenOf(lavender_blush_color) == 240
    assert BlueOf(lavender_blush_color) == 245
    assert AlphaOf(lavender_blush_color) == 255


def test_ColorLawnGreen_integration():
    lawn_green_color = ColorLawnGreen()
    assert RedOf(lawn_green_color) == 124
    assert GreenOf(lawn_green_color) == 252
    assert BlueOf(lawn_green_color) == 0
    assert AlphaOf(lawn_green_color) == 255


def test_ColorLemonChiffon_integration():
    lemon_chiffon_color = ColorLemonChiffon()
    assert RedOf(lemon_chiffon_color) == 255
    assert GreenOf(lemon_chiffon_color) == 250
    assert BlueOf(lemon_chiffon_color) == 205
    assert AlphaOf(lemon_chiffon_color) == 255


def test_ColorLightBlue_integration():
    light_blue_color = ColorLightBlue()
    assert RedOf(light_blue_color) == 173
    assert GreenOf(light_blue_color) == 216
    assert BlueOf(light_blue_color) == 230
    assert AlphaOf(light_blue_color) == 255


def test_ColorLightCoral_integration():
    light_coral_color = ColorLightCoral()
    assert RedOf(light_coral_color) == 240
    assert GreenOf(light_coral_color) == 127
    assert BlueOf(light_coral_color) == 127
    assert AlphaOf(light_coral_color) == 255


def test_ColorLightCyan_integration():
    light_cyan_color = ColorLightCyan()
    assert RedOf(light_cyan_color) == 224
    assert GreenOf(light_cyan_color) == 255
    assert BlueOf(light_cyan_color) == 255
    assert AlphaOf(light_cyan_color) == 255


def test_ColorLightGoldenrodYellow_integration():
    light_goldenrod_yellow_color = ColorLightGoldenrodYellow()
    assert RedOf(light_goldenrod_yellow_color) == 250
    assert GreenOf(light_goldenrod_yellow_color) == 250
    assert BlueOf(light_goldenrod_yellow_color) == 210
    assert AlphaOf(light_goldenrod_yellow_color) == 255


def test_ColorLightGray_integration():
    light_gray_color = ColorLightGray()
    assert RedOf(light_gray_color) == 211
    assert GreenOf(light_gray_color) == 211
    assert BlueOf(light_gray_color) == 211
    assert AlphaOf(light_gray_color) == 255


def test_ColorLightGreen_integration():
    light_green_color = ColorLightGreen()
    assert RedOf(light_green_color) == 144
    assert GreenOf(light_green_color) == 238
    assert BlueOf(light_green_color) == 144
    assert AlphaOf(light_green_color) == 255


def test_ColorLightPink_integration():
    light_pink_color = ColorLightPink()
    assert RedOf(light_pink_color) == 255
    assert GreenOf(light_pink_color) == 182
    assert BlueOf(light_pink_color) == 193
    assert AlphaOf(light_pink_color) == 255


def test_ColorLightSalmon_integration():
    light_salmon_color = ColorLightSalmon()
    assert RedOf(light_salmon_color) == 255
    assert GreenOf(light_salmon_color) == 160
    assert BlueOf(light_salmon_color) == 122
    assert AlphaOf(light_salmon_color) == 255


def test_ColorLightSeaGreen_integration():
    light_sea_green_color = ColorLightSeaGreen()
    assert RedOf(light_sea_green_color) == 32
    assert GreenOf(light_sea_green_color) == 178
    assert BlueOf(light_sea_green_color) == 170
    assert AlphaOf(light_sea_green_color) == 255


def test_ColorLightSkyBlue_integration():
    light_sky_blue_color = ColorLightSkyBlue()
    assert RedOf(light_sky_blue_color) == 135
    assert GreenOf(light_sky_blue_color) == 206
    assert BlueOf(light_sky_blue_color) == 250
    assert AlphaOf(light_sky_blue_color) == 255


def test_ColorLightSlateGray_integration():
    light_slate_gray_color = ColorLightSlateGray()
    assert RedOf(light_slate_gray_color) == 119
    assert GreenOf(light_slate_gray_color) == 136
    assert BlueOf(light_slate_gray_color) == 153
    assert AlphaOf(light_slate_gray_color) == 255


def test_ColorLightSteelBlue_integration():
    light_steel_blue_color = ColorLightSteelBlue()
    assert RedOf(light_steel_blue_color) == 176
    assert GreenOf(light_steel_blue_color) == 196
    assert BlueOf(light_steel_blue_color) == 222
    assert AlphaOf(light_steel_blue_color) == 255


def test_ColorLightYellow_integration():
    light_yellow_color = ColorLightYellow()
    assert RedOf(light_yellow_color) == 255
    assert GreenOf(light_yellow_color) == 255
    assert BlueOf(light_yellow_color) == 224
    assert AlphaOf(light_yellow_color) == 255


def test_ColorLime_integration():
    lime_color = ColorLime()
    assert RedOf(lime_color) == 0
    assert GreenOf(lime_color) == 255
    assert BlueOf(lime_color) == 0
    assert AlphaOf(lime_color) == 255


def test_ColorLimeGreen_integration():
    lime_green_color = ColorLimeGreen()
    assert RedOf(lime_green_color) == 50
    assert GreenOf(lime_green_color) == 205
    assert BlueOf(lime_green_color) == 50
    assert AlphaOf(lime_green_color) == 255


def test_ColorLinen_integration():
    linen_color = ColorLinen()
    assert RedOf(linen_color) == 250
    assert GreenOf(linen_color) == 240
    assert BlueOf(linen_color) == 230
    assert AlphaOf(linen_color) == 255


def test_ColorMagenta_integration():
    magenta_color = ColorMagenta()
    assert RedOf(magenta_color) == 255
    assert GreenOf(magenta_color) == 0
    assert BlueOf(magenta_color) == 255
    assert AlphaOf(magenta_color) == 255


def test_ColorMaroon_integration():
    maroon_color = ColorMaroon()
    assert RedOf(maroon_color) == 127
    assert GreenOf(maroon_color) == 0
    assert BlueOf(maroon_color) == 0
    assert AlphaOf(maroon_color) == 255


def test_ColorMediumAquamarine_integration():
    medium_aquamarine_color = ColorMediumAquamarine()
    assert RedOf(medium_aquamarine_color) == 102
    assert GreenOf(medium_aquamarine_color) == 205
    assert BlueOf(medium_aquamarine_color) == 170
    assert AlphaOf(medium_aquamarine_color) == 255


def test_ColorMediumBlue_integration():
    medium_blue_color = ColorMediumBlue()
    assert RedOf(medium_blue_color) == 0
    assert GreenOf(medium_blue_color) == 0
    assert BlueOf(medium_blue_color) == 205
    assert AlphaOf(medium_blue_color) == 255


def test_ColorMediumOrchid_integration():
    medium_orchid_color = ColorMediumOrchid()
    assert RedOf(medium_orchid_color) == 186
    assert GreenOf(medium_orchid_color) == 85
    assert BlueOf(medium_orchid_color) == 211
    assert AlphaOf(medium_orchid_color) == 255


def test_ColorMediumPurple_integration():
    medium_purple_color = ColorMediumPurple()
    assert RedOf(medium_purple_color) == 147
    assert GreenOf(medium_purple_color) == 112
    assert BlueOf(medium_purple_color) == 219
    assert AlphaOf(medium_purple_color) == 255


def test_ColorMediumSeaGreen_integration():
    medium_sea_green_color = ColorMediumSeaGreen()
    assert RedOf(medium_sea_green_color) == 60
    assert GreenOf(medium_sea_green_color) == 179
    assert BlueOf(medium_sea_green_color) == 113
    assert AlphaOf(medium_sea_green_color) == 255


def test_ColorMediumSlateBlue_integration():
    medium_slate_blue_color = ColorMediumSlateBlue()
    assert RedOf(medium_slate_blue_color) == 123
    assert GreenOf(medium_slate_blue_color) == 104
    assert BlueOf(medium_slate_blue_color) == 238
    assert AlphaOf(medium_slate_blue_color) == 255


def test_ColorMediumSpringGreen_integration():
    medium_spring_green_color = ColorMediumSpringGreen()
    assert RedOf(medium_spring_green_color) == 0
    assert GreenOf(medium_spring_green_color) == 250
    assert BlueOf(medium_spring_green_color) == 154
    assert AlphaOf(medium_spring_green_color) == 255


def test_ColorMediumTurquoise_integration():
    medium_turquoise_color = ColorMediumTurquoise()
    assert RedOf(medium_turquoise_color) == 72
    assert GreenOf(medium_turquoise_color) == 209
    assert BlueOf(medium_turquoise_color) == 204
    assert AlphaOf(medium_turquoise_color) == 255


def test_ColorMediumVioletRed_integration():
    medium_violet_red_color = ColorMediumVioletRed()
    assert RedOf(medium_violet_red_color) == 199
    assert GreenOf(medium_violet_red_color) == 21
    assert BlueOf(medium_violet_red_color) == 133
    assert AlphaOf(medium_violet_red_color) == 255


def test_ColorMidnightBlue_integration():
    midnight_blue_color = ColorMidnightBlue()
    assert RedOf(midnight_blue_color) == 25
    assert GreenOf(midnight_blue_color) == 25
    assert BlueOf(midnight_blue_color) == 112
    assert AlphaOf(midnight_blue_color) == 255


def test_ColorMintCream_integration():
    mint_cream_color = ColorMintCream()
    assert RedOf(mint_cream_color) == 245
    assert GreenOf(mint_cream_color) == 255
    assert BlueOf(mint_cream_color) == 250
    assert AlphaOf(mint_cream_color) == 255


def test_ColorMistyRose_integration():
    misty_rose_color = ColorMistyRose()
    assert RedOf(misty_rose_color) == 255
    assert GreenOf(misty_rose_color) == 228
    assert BlueOf(misty_rose_color) == 225
    assert AlphaOf(misty_rose_color) == 255


def test_ColorMoccasin_integration():
    moccasin_color = ColorMoccasin()
    assert RedOf(moccasin_color) == 255
    assert GreenOf(moccasin_color) == 228
    assert BlueOf(moccasin_color) == 181
    assert AlphaOf(moccasin_color) == 255


def test_ColorNavajoWhite_integration():
    navajo_white_color = ColorNavajoWhite()
    assert RedOf(navajo_white_color) == 255
    assert GreenOf(navajo_white_color) == 222
    assert BlueOf(navajo_white_color) == 173
    assert AlphaOf(navajo_white_color) == 255


def test_ColorNavy_integration():
    navy_color = ColorNavy()
    assert RedOf(navy_color) == 0
    assert GreenOf(navy_color) == 0
    assert BlueOf(navy_color) == 127
    assert AlphaOf(navy_color) == 255


def test_ColorOldLace_integration():
    old_lace_color = ColorOldLace()
    assert RedOf(old_lace_color) == 253
    assert GreenOf(old_lace_color) == 245
    assert BlueOf(old_lace_color) == 230
    assert AlphaOf(old_lace_color) == 255


def test_ColorOlive_integration():
    olive_color = ColorOlive()
    assert RedOf(olive_color) == 127
    assert GreenOf(olive_color) == 127
    assert BlueOf(olive_color) == 0
    assert AlphaOf(olive_color) == 255


def test_ColorOliveDrab_integration():
    olive_drab_color = ColorOliveDrab()
    assert RedOf(olive_drab_color) == 107
    assert GreenOf(olive_drab_color) == 142
    assert BlueOf(olive_drab_color) == 35
    assert AlphaOf(olive_drab_color) == 255


def test_ColorOrange_integration():
    orange_color = ColorOrange()
    assert RedOf(orange_color) == 255
    assert GreenOf(orange_color) == 165
    assert BlueOf(orange_color) == 0
    assert AlphaOf(orange_color) == 255


def test_ColorOrangeRed_integration():
    orange_red_color = ColorOrangeRed()
    assert RedOf(orange_red_color) == 255
    assert GreenOf(orange_red_color) == 69
    assert BlueOf(orange_red_color) == 0
    assert AlphaOf(orange_red_color) == 255


def test_ColorOrchid_integration():
    orchid_color = ColorOrchid()
    assert RedOf(orchid_color) == 218
    assert GreenOf(orchid_color) == 112
    assert BlueOf(orchid_color) == 214
    assert AlphaOf(orchid_color) == 255


def test_ColorPaleGoldenrod_integration():
    pale_goldenrod_color = ColorPaleGoldenrod()
    assert RedOf(pale_goldenrod_color) == 238
    assert GreenOf(pale_goldenrod_color) == 232
    assert BlueOf(pale_goldenrod_color) == 170
    assert AlphaOf(pale_goldenrod_color) == 255


def test_ColorPaleGreen_integration():
    pale_green_color = ColorPaleGreen()
    assert RedOf(pale_green_color) == 152
    assert GreenOf(pale_green_color) == 251
    assert BlueOf(pale_green_color) == 152
    assert AlphaOf(pale_green_color) == 255


def test_ColorPaleTurquoise_integration():
    pale_turquoise_color = ColorPaleTurquoise()
    assert RedOf(pale_turquoise_color) == 175
    assert GreenOf(pale_turquoise_color) == 238
    assert BlueOf(pale_turquoise_color) == 238
    assert AlphaOf(pale_turquoise_color) == 255


def test_ColorPaleVioletRed_integration():
    pale_violet_red_color = ColorPaleVioletRed()
    assert RedOf(pale_violet_red_color) == 219
    assert GreenOf(pale_violet_red_color) == 112
    assert BlueOf(pale_violet_red_color) == 147
    assert AlphaOf(pale_violet_red_color) == 255


def test_ColorPapayaWhip_integration():
    papaya_whip_color = ColorPapayaWhip()
    assert RedOf(papaya_whip_color) == 255
    assert GreenOf(papaya_whip_color) == 239
    assert BlueOf(papaya_whip_color) == 213
    assert AlphaOf(papaya_whip_color) == 255


def test_ColorPeachPuff_integration():
    peach_puff_color = ColorPeachPuff()
    assert RedOf(peach_puff_color) == 255
    assert GreenOf(peach_puff_color) == 218
    assert BlueOf(peach_puff_color) == 185
    assert AlphaOf(peach_puff_color) == 255


def test_ColorPeru_integration():
    peru_color = ColorPeru()
    assert RedOf(peru_color) == 205
    assert GreenOf(peru_color) == 133
    assert BlueOf(peru_color) == 63
    assert AlphaOf(peru_color) == 255


def test_ColorPink_integration():
    pink_color = ColorPink()
    assert RedOf(pink_color) == 255
    assert GreenOf(pink_color) == 192
    assert BlueOf(pink_color) == 203
    assert AlphaOf(pink_color) == 255


def test_ColorPlum_integration():
    plum_color = ColorPlum()
    assert RedOf(plum_color) == 221
    assert GreenOf(plum_color) == 160
    assert BlueOf(plum_color) == 221
    assert AlphaOf(plum_color) == 255


def test_ColorPowderBlue_integration():
    powder_blue_color = ColorPowderBlue()
    assert RedOf(powder_blue_color) == 176
    assert GreenOf(powder_blue_color) == 224
    assert BlueOf(powder_blue_color) == 230
    assert AlphaOf(powder_blue_color) == 255


def test_ColorPurple_integration():
    purple_color = ColorPurple()
    assert RedOf(purple_color) == 127
    assert GreenOf(purple_color) == 0
    assert BlueOf(purple_color) == 127
    assert AlphaOf(purple_color) == 255


def test_ColorRed_integration():
    red_color = ColorRed()
    assert RedOf(red_color) == 255
    assert GreenOf(red_color) == 0
    assert BlueOf(red_color) == 0
    assert AlphaOf(red_color) == 255


def test_ColorRosyBrown_integration():
    rosy_brown_color = ColorRosyBrown()
    assert RedOf(rosy_brown_color) == 188
    assert GreenOf(rosy_brown_color) == 143
    assert BlueOf(rosy_brown_color) == 143
    assert AlphaOf(rosy_brown_color) == 255


def test_ColorRoyalBlue_integration():
    royal_blue_color = ColorRoyalBlue()
    assert RedOf(royal_blue_color) == 65
    assert GreenOf(royal_blue_color) == 105
    assert BlueOf(royal_blue_color) == 225
    assert AlphaOf(royal_blue_color) == 255


def test_ColorSaddleBrown_integration():
    saddle_brown_color = ColorSaddleBrown()
    assert RedOf(saddle_brown_color) == 139
    assert GreenOf(saddle_brown_color) == 69
    assert BlueOf(saddle_brown_color) == 19
    assert AlphaOf(saddle_brown_color) == 255


def test_ColorSalmon_integration():
    salmon_color = ColorSalmon()
    assert RedOf(salmon_color) == 250
    assert GreenOf(salmon_color) == 127
    assert BlueOf(salmon_color) == 114
    assert AlphaOf(salmon_color) == 255


def test_ColorSandyBrown_integration():
    sandy_brown_color = ColorSandyBrown()
    assert RedOf(sandy_brown_color) == 244
    assert GreenOf(sandy_brown_color) == 164
    assert BlueOf(sandy_brown_color) == 96
    assert AlphaOf(sandy_brown_color) == 255


def test_ColorSeaGreen_integration():
    sea_green_color = ColorSeaGreen()
    assert RedOf(sea_green_color) == 46
    assert GreenOf(sea_green_color) == 139
    assert BlueOf(sea_green_color) == 87
    assert AlphaOf(sea_green_color) == 255


def test_ColorSeaShell_integration():
    sea_shell_color = ColorSeaShell()
    assert RedOf(sea_shell_color) == 255
    assert GreenOf(sea_shell_color) == 245
    assert BlueOf(sea_shell_color) == 238
    assert AlphaOf(sea_shell_color) == 255


def test_ColorSienna_integration():
    sienna_color = ColorSienna()
    assert RedOf(sienna_color) == 160
    assert GreenOf(sienna_color) == 82
    assert BlueOf(sienna_color) == 45
    assert AlphaOf(sienna_color) == 255


def test_ColorSilver_integration():
    silver_color = ColorSilver()
    assert RedOf(silver_color) == 192
    assert GreenOf(silver_color) == 192
    assert BlueOf(silver_color) == 192
    assert AlphaOf(silver_color) == 255


def test_ColorSkyBlue_integration():
    sky_blue_color = ColorSkyBlue()
    assert RedOf(sky_blue_color) == 135
    assert GreenOf(sky_blue_color) == 206
    assert BlueOf(sky_blue_color) == 235
    assert AlphaOf(sky_blue_color) == 255


def test_ColorSlateBlue_integration():
    slate_blue_color = ColorSlateBlue()
    assert RedOf(slate_blue_color) == 106
    assert GreenOf(slate_blue_color) == 90
    assert BlueOf(slate_blue_color) == 205
    assert AlphaOf(slate_blue_color) == 255


def test_ColorSlateGray_integration():
    slate_gray_color = ColorSlateGray()
    assert RedOf(slate_gray_color) == 112
    assert GreenOf(slate_gray_color) == 127
    assert BlueOf(slate_gray_color) == 144
    assert AlphaOf(slate_gray_color) == 255


def test_ColorSnow_integration():
    snow_color = ColorSnow()
    assert RedOf(snow_color) == 255
    assert GreenOf(snow_color) == 250
    assert BlueOf(snow_color) == 250
    assert AlphaOf(snow_color) == 255


def test_ColorSpringGreen_integration():
    spring_green_color = ColorSpringGreen()
    assert RedOf(spring_green_color) == 0
    assert GreenOf(spring_green_color) == 255
    assert BlueOf(spring_green_color) == 127
    assert AlphaOf(spring_green_color) == 255


def test_ColorSteelBlue_integration():
    steel_blue_color = ColorSteelBlue()
    assert RedOf(steel_blue_color) == 70
    assert GreenOf(steel_blue_color) == 130
    assert BlueOf(steel_blue_color) == 180
    assert AlphaOf(steel_blue_color) == 255


def test_ColorSwinburneRed_integration():
    swinburne_red_color = ColorSwinburneRed()
    assert RedOf(swinburne_red_color) == 237
    assert GreenOf(swinburne_red_color) == 36
    assert BlueOf(swinburne_red_color) == 25
    assert AlphaOf(swinburne_red_color) == 255


def test_ColorTan_integration():
    tan_color = ColorTan()
    assert RedOf(tan_color) == 210
    assert GreenOf(tan_color) == 180
    assert BlueOf(tan_color) == 140
    assert AlphaOf(tan_color) == 255


def test_ColorTeal_integration():
    teal_color = ColorTeal()
    assert RedOf(teal_color) == 0
    assert GreenOf(teal_color) == 127
    assert BlueOf(teal_color) == 127
    assert AlphaOf(teal_color) == 255


def test_ColorThistle_integration():
    thistle_color = ColorThistle()
    assert RedOf(thistle_color) == 216
    assert GreenOf(thistle_color) == 191
    assert BlueOf(thistle_color) == 216
    assert AlphaOf(thistle_color) == 255


def test_ColorToString_integration():
    red_color = ColorRed()
    red_color_string = ColorToString(red_color)
    assert red_color_string == "#ff0000ff"
    transparent_color = ColorTransparent()
    transparent_color_string = ColorToString(transparent_color)
    assert transparent_color_string == "#ffffffff"


def test_ColorTomato_integration():
    tomato_color = ColorTomato()
    assert RedOf(tomato_color) == 255
    assert GreenOf(tomato_color) == 99
    assert BlueOf(tomato_color) == 71
    assert AlphaOf(tomato_color) == 255


def test_ColorTransparent_integration():
    transparent_color = ColorTransparent()
    assert AlphaOf(transparent_color) == 255
    assert RedOf(transparent_color) == 255
    assert GreenOf(transparent_color) == 255
    assert BlueOf(transparent_color) == 255


def test_ColorTurquoise_integration():
    turquoise_color = ColorTurquoise()
    assert RedOf(turquoise_color) == 64
    assert GreenOf(turquoise_color) == 224
    assert BlueOf(turquoise_color) == 208
    assert AlphaOf(turquoise_color) == 255


def test_ColorViolet_integration():
    violet_color = ColorViolet()
    assert RedOf(violet_color) == 238
    assert GreenOf(violet_color) == 130
    assert BlueOf(violet_color) == 238
    assert AlphaOf(violet_color) == 255


def test_ColorWheat_integration():
    wheat_color = ColorWheat()
    assert RedOf(wheat_color) == 245
    assert GreenOf(wheat_color) == 222
    assert BlueOf(wheat_color) == 179
    assert AlphaOf(wheat_color) == 255


def test_ColorWhite_integration():
    white_color = ColorWhite()
    assert RedOf(white_color) == 255
    assert GreenOf(white_color) == 255
    assert BlueOf(white_color) == 255
    assert AlphaOf(white_color) == 255


def test_ColorWhiteSmoke_integration():
    white_smoke_color = ColorWhiteSmoke()
    assert RedOf(white_smoke_color) == 245
    assert GreenOf(white_smoke_color) == 245
    assert BlueOf(white_smoke_color) == 245
    assert AlphaOf(white_smoke_color) == 255


def test_ColorYellow_integration():
    yellow_color = ColorYellow()
    assert RedOf(yellow_color) == 255
    assert GreenOf(yellow_color) == 255
    assert BlueOf(yellow_color) == 0
    assert AlphaOf(yellow_color) == 255


def test_ColorYellowGreen_integration():
    yellow_green_color = ColorYellowGreen()
    assert RedOf(yellow_green_color) == 154
    assert GreenOf(yellow_green_color) == 205
    assert BlueOf(yellow_green_color) == 50
    assert AlphaOf(yellow_green_color) == 255


def test_GreenOf_integration():
    green_color = ColorGreen()
    green_value = GreenOf(green_color)
    assert green_value == 127
    black_color = ColorBlack()
    black_green_value = GreenOf(black_color)
    assert black_green_value == 0


def test_HSBColor_integration():
    red_color = HSBColor(0.0, 1.0, 1.0)
    assert HueOf(red_color) == 0.0
    assert SaturationOf(red_color) == 1.0
    assert BrightnessOf(red_color) == 1.0
    gray_color = HSBColor(0.5, 0.0, 0.5)
    assert SaturationOf(gray_color) == 0.0


def test_HueOf_integration():
    red_color = ColorRed()
    hue_value = HueOf(red_color)
    assert hue_value == 0.0
    blue_color = ColorBlue()
    hue_value_blue = HueOf(blue_color)
    assert hue_value_blue == 0.6666666666666666


def test_RandomColor_integration():
    random_color_result = RandomColor()
    assert ColorToString(random_color_result) != "#000000FF"
    assert 0 <= AlphaOf(random_color_result) <= 255


def test_RandomRGBColor_integration():
    random_color = RandomRGBColor(255)
    assert 0 <= RedOf(random_color) <= 255
    assert 0 <= GreenOf(random_color) <= 255
    assert 0 <= BlueOf(random_color) <= 255
    assert AlphaOf(random_color) == 255


def test_RedOf_integration():
    red_color = ColorRed()
    red_value = RedOf(red_color)
    assert red_value == 255
    blue_color = ColorBlue()
    blue_red_value = RedOf(blue_color)
    assert blue_red_value == 0


def test_RGBColorFromDouble_integration():
    red_color = RGBColor(1.0, 0.0, 0.0)
    assert RedOf(red_color) == 255
    assert GreenOf(red_color) == 0
    assert BlueOf(red_color) == 0
    green_color = RGBColor(0.0, 1.0, 0.0)
    assert RedOf(green_color) == 0
    assert GreenOf(green_color) == 255
    assert BlueOf(green_color) == 0


def test_RGBColor_integration():
    red_color = RGBColor(255, 0, 0)
    assert RedOf(red_color) == 255
    assert GreenOf(red_color) == 0
    assert BlueOf(red_color) == 0
    assert AlphaOf(red_color) == 255


def test_RGBAColorFromDouble_integration():
    test_color = RGBAColor(1.0, 0.5, 0.0, 0.75)
    assert RedOf(test_color) == 255
    assert GreenOf(test_color) == 127
    assert BlueOf(test_color) == 0
    assert AlphaOf(test_color) == 191


def test_RGBAColor_integration():
    red_color = RGBAColor(255, 0, 0, 255)
    assert RedOf(red_color) == 255
    assert GreenOf(red_color) == 0
    assert BlueOf(red_color) == 0
    assert AlphaOf(red_color) == 255


def test_SaturationOf_integration():
    red_color = ColorRed()
    saturation_value = SaturationOf(red_color)
    assert saturation_value == 1.0
    gray_color = ColorGray()
    saturation_value_gray = SaturationOf(gray_color)
    assert saturation_value_gray == 0.0


def test_StringToColor_integration():
    red_color = StringToColor("#FF0000FF")
    assert RedOf(red_color) == 255
    assert GreenOf(red_color) == 0
    assert BlueOf(red_color) == 0
    assert AlphaOf(red_color) == 255
    green_color = StringToColor("#00FF00FF")
    assert RedOf(green_color) == 0
    assert GreenOf(green_color) == 255
    assert BlueOf(green_color) == 0
    assert AlphaOf(green_color) == 255

