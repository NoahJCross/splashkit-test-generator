import pytest
from splashkit import *


def test_AlphaOf_integration():
    red_color = color_red()
    alpha_value = alpha_of(red_color)
    assert alpha_value == 255
    transparent_color = color_transparent()
    alpha_value_transparent = alpha_of(transparent_color)
    assert alpha_value_transparent == 255


def test_BlueOf_integration():
    blue_color = color_blue()
    blue_value = blue_of(blue_color)
    assert blue_value == 255
    red_color = color_red()
    blue_value_red = blue_of(red_color)
    assert blue_value_red == 0


def test_BrightnessOf_integration():
    white_color = color_white()
    white_brightness = brightness_of(white_color)
    assert white_brightness == 1.0
    black_color = color_black()
    black_brightness = brightness_of(black_color)
    assert black_brightness == 0.0
    gray_color = color_gray()
    gray_brightness = brightness_of(gray_color)
    assert 0.4 <= gray_brightness <= 0.6


def test_ColorAliceBlue_integration():
    alice_blue_color = color_alice_blue()
    assert red_of(alice_blue_color) == 240
    assert green_of(alice_blue_color) == 248
    assert blue_of(alice_blue_color) == 255
    assert alpha_of(alice_blue_color) == 255


def test_ColorAntiqueWhite_integration():
    antique_white_color = color_antique_white()
    assert red_of(antique_white_color) == 250
    assert green_of(antique_white_color) == 235
    assert blue_of(antique_white_color) == 215
    assert alpha_of(antique_white_color) == 255


def test_ColorAqua_integration():
    aqua_color = color_aqua()
    assert red_of(aqua_color) == 0
    assert green_of(aqua_color) == 255
    assert blue_of(aqua_color) == 255
    assert alpha_of(aqua_color) == 255


def test_ColorAquamarine_integration():
    aquamarine_color = color_aquamarine()
    assert red_of(aquamarine_color) == 127
    assert green_of(aquamarine_color) == 255
    assert blue_of(aquamarine_color) == 212
    assert alpha_of(aquamarine_color) == 255


def test_ColorAzure_integration():
    azure_color = color_azure()
    assert red_of(azure_color) == 240
    assert green_of(azure_color) == 255
    assert blue_of(azure_color) == 255
    assert alpha_of(azure_color) == 255


def test_ColorBeige_integration():
    beige_color = color_beige()
    assert red_of(beige_color) == 245
    assert green_of(beige_color) == 245
    assert blue_of(beige_color) == 220
    assert alpha_of(beige_color) == 255


def test_ColorBisque_integration():
    bisque_color = color_bisque()
    assert red_of(bisque_color) == 255
    assert green_of(bisque_color) == 228
    assert blue_of(bisque_color) == 196
    assert alpha_of(bisque_color) == 255


def test_ColorBlack_integration():
    black_color = color_black()
    assert red_of(black_color) == 0
    assert green_of(black_color) == 0
    assert blue_of(black_color) == 0
    assert alpha_of(black_color) == 255


def test_ColorBlanchedAlmond_integration():
    blanched_almond_color = color_blanched_almond()
    assert red_of(blanched_almond_color) == 255
    assert green_of(blanched_almond_color) == 235
    assert blue_of(blanched_almond_color) == 205
    assert alpha_of(blanched_almond_color) == 255


def test_ColorBlue_integration():
    blue_color = color_blue()
    assert red_of(blue_color) == 0
    assert green_of(blue_color) == 0
    assert blue_of(blue_color) == 255
    assert alpha_of(blue_color) == 255


def test_ColorBlueViolet_integration():
    blue_violet_color = color_blue_violet()
    assert red_of(blue_violet_color) == 138
    assert green_of(blue_violet_color) == 43
    assert blue_of(blue_violet_color) == 226
    assert alpha_of(blue_violet_color) == 255


def test_ColorBrightGreen_integration():
    bright_green_color = color_bright_green()
    assert red_of(bright_green_color) == 0
    assert green_of(bright_green_color) == 255
    assert blue_of(bright_green_color) == 0
    assert alpha_of(bright_green_color) == 255


def test_ColorBrown_integration():
    brown_color = color_brown()
    assert red_of(brown_color) == 165
    assert green_of(brown_color) == 42
    assert blue_of(brown_color) == 42
    assert alpha_of(brown_color) == 255


def test_ColorBurlyWood_integration():
    burly_wood_color = color_burly_wood()
    assert red_of(burly_wood_color) == 222
    assert green_of(burly_wood_color) == 184
    assert blue_of(burly_wood_color) == 135
    assert alpha_of(burly_wood_color) == 255


def test_ColorCadetBlue_integration():
    cadet_blue_color = color_cadet_blue()
    assert red_of(cadet_blue_color) == 95
    assert green_of(cadet_blue_color) == 158
    assert blue_of(cadet_blue_color) == 160
    assert alpha_of(cadet_blue_color) == 255


def test_ColorChartreuse_integration():
    chartreuse_color = color_chartreuse()
    assert red_of(chartreuse_color) == 127
    assert green_of(chartreuse_color) == 255
    assert blue_of(chartreuse_color) == 0
    assert alpha_of(chartreuse_color) == 255


def test_ColorChocolate_integration():
    chocolate_color = color_chocolate()
    assert red_of(chocolate_color) == 210
    assert green_of(chocolate_color) == 105
    assert blue_of(chocolate_color) == 30
    assert alpha_of(chocolate_color) == 255


def test_ColorCoral_integration():
    coral_color = color_coral()
    assert red_of(coral_color) == 255
    assert green_of(coral_color) == 127
    assert blue_of(coral_color) == 80
    assert alpha_of(coral_color) == 255


def test_ColorCornflowerBlue_integration():
    cornflower_blue_color = color_cornflower_blue()
    assert red_of(cornflower_blue_color) == 100
    assert green_of(cornflower_blue_color) == 149
    assert blue_of(cornflower_blue_color) == 237
    assert alpha_of(cornflower_blue_color) == 255


def test_ColorCornsilk_integration():
    cornsilk_color = color_cornsilk()
    assert red_of(cornsilk_color) == 255
    assert green_of(cornsilk_color) == 248
    assert blue_of(cornsilk_color) == 220
    assert alpha_of(cornsilk_color) == 255


def test_ColorCrimson_integration():
    crimson_color = color_crimson()
    assert red_of(crimson_color) == 220
    assert green_of(crimson_color) == 20
    assert blue_of(crimson_color) == 60
    assert alpha_of(crimson_color) == 255


def test_ColorCyan_integration():
    cyan_color = color_cyan()
    assert red_of(cyan_color) == 0
    assert green_of(cyan_color) == 255
    assert blue_of(cyan_color) == 255
    assert alpha_of(cyan_color) == 255


def test_ColorDarkBlue_integration():
    dark_blue_color = color_dark_blue()
    assert red_of(dark_blue_color) == 0
    assert green_of(dark_blue_color) == 0
    assert blue_of(dark_blue_color) == 139
    assert alpha_of(dark_blue_color) == 255


def test_ColorDarkCyan_integration():
    dark_cyan_color = color_dark_cyan()
    assert red_of(dark_cyan_color) == 0
    assert green_of(dark_cyan_color) == 139
    assert blue_of(dark_cyan_color) == 139
    assert alpha_of(dark_cyan_color) == 255


def test_ColorDarkGoldenrod_integration():
    dark_goldenrod_color = color_dark_goldenrod()
    assert red_of(dark_goldenrod_color) == 184
    assert green_of(dark_goldenrod_color) == 134
    assert blue_of(dark_goldenrod_color) == 11
    assert alpha_of(dark_goldenrod_color) == 255


def test_ColorDarkGray_integration():
    dark_gray_color = color_dark_gray()
    assert red_of(dark_gray_color) == 169
    assert green_of(dark_gray_color) == 169
    assert blue_of(dark_gray_color) == 169
    assert alpha_of(dark_gray_color) == 255


def test_ColorDarkGreen_integration():
    dark_green_color = color_dark_green()
    assert red_of(dark_green_color) == 0
    assert green_of(dark_green_color) == 100
    assert blue_of(dark_green_color) == 0
    assert alpha_of(dark_green_color) == 255


def test_ColorDarkKhaki_integration():
    dark_khaki_color = color_dark_khaki()
    assert red_of(dark_khaki_color) == 189
    assert green_of(dark_khaki_color) == 183
    assert blue_of(dark_khaki_color) == 107
    assert alpha_of(dark_khaki_color) == 255


def test_ColorDarkMagenta_integration():
    dark_magenta_color = color_dark_magenta()
    assert red_of(dark_magenta_color) == 139
    assert green_of(dark_magenta_color) == 0
    assert blue_of(dark_magenta_color) == 139
    assert alpha_of(dark_magenta_color) == 255


def test_ColorDarkOliveGreen_integration():
    dark_olive_green_color = color_dark_olive_green()
    assert red_of(dark_olive_green_color) == 85
    assert green_of(dark_olive_green_color) == 107
    assert blue_of(dark_olive_green_color) == 47
    assert alpha_of(dark_olive_green_color) == 255


def test_ColorDarkOrange_integration():
    dark_orange_color = color_dark_orange()
    assert red_of(dark_orange_color) == 255
    assert green_of(dark_orange_color) == 140
    assert blue_of(dark_orange_color) == 0
    assert alpha_of(dark_orange_color) == 255


def test_ColorDarkOrchid_integration():
    dark_orchid_color = color_dark_orchid()
    assert red_of(dark_orchid_color) == 153
    assert green_of(dark_orchid_color) == 50
    assert blue_of(dark_orchid_color) == 204
    assert alpha_of(dark_orchid_color) == 255


def test_ColorDarkRed_integration():
    dark_red_color = color_dark_red()
    assert red_of(dark_red_color) == 139
    assert green_of(dark_red_color) == 0
    assert blue_of(dark_red_color) == 0
    assert alpha_of(dark_red_color) == 255


def test_ColorDarkSalmon_integration():
    dark_salmon_color = color_dark_salmon()
    assert red_of(dark_salmon_color) == 233
    assert green_of(dark_salmon_color) == 150
    assert blue_of(dark_salmon_color) == 122
    assert alpha_of(dark_salmon_color) == 255


def test_ColorDarkSeaGreen_integration():
    dark_sea_green_color = color_dark_sea_green()
    assert red_of(dark_sea_green_color) == 143
    assert green_of(dark_sea_green_color) == 188
    assert blue_of(dark_sea_green_color) == 139
    assert alpha_of(dark_sea_green_color) == 255


def test_ColorDarkSlateBlue_integration():
    dark_slate_blue_color = color_dark_slate_blue()
    assert red_of(dark_slate_blue_color) == 72
    assert green_of(dark_slate_blue_color) == 61
    assert blue_of(dark_slate_blue_color) == 139
    assert alpha_of(dark_slate_blue_color) == 255


def test_ColorDarkSlateGray_integration():
    dark_slate_gray_color = color_dark_slate_gray()
    assert red_of(dark_slate_gray_color) == 47
    assert green_of(dark_slate_gray_color) == 79
    assert blue_of(dark_slate_gray_color) == 79
    assert alpha_of(dark_slate_gray_color) == 255


def test_ColorDarkTurquoise_integration():
    dark_turquoise_color = color_dark_turquoise()
    assert red_of(dark_turquoise_color) == 0
    assert green_of(dark_turquoise_color) == 206
    assert blue_of(dark_turquoise_color) == 209
    assert alpha_of(dark_turquoise_color) == 255


def test_ColorDarkViolet_integration():
    dark_violet_color = color_dark_violet()
    assert red_of(dark_violet_color) == 148
    assert green_of(dark_violet_color) == 0
    assert blue_of(dark_violet_color) == 211
    assert alpha_of(dark_violet_color) == 255


def test_ColorDeepPink_integration():
    deep_pink_color = color_deep_pink()
    assert red_of(deep_pink_color) == 255
    assert green_of(deep_pink_color) == 20
    assert blue_of(deep_pink_color) == 147
    assert alpha_of(deep_pink_color) == 255


def test_ColorDeepSkyBlue_integration():
    deep_sky_blue_color = color_deep_sky_blue()
    assert red_of(deep_sky_blue_color) == 0
    assert green_of(deep_sky_blue_color) == 191
    assert blue_of(deep_sky_blue_color) == 255
    assert alpha_of(deep_sky_blue_color) == 255


def test_ColorDimGray_integration():
    dim_gray_color = color_dim_gray()
    assert red_of(dim_gray_color) == 105
    assert green_of(dim_gray_color) == 105
    assert blue_of(dim_gray_color) == 105
    assert alpha_of(dim_gray_color) == 255


def test_ColorDodgerBlue_integration():
    dodger_blue_color = color_dodger_blue()
    assert red_of(dodger_blue_color) == 30
    assert green_of(dodger_blue_color) == 144
    assert blue_of(dodger_blue_color) == 255
    assert alpha_of(dodger_blue_color) == 255


def test_ColorFirebrick_integration():
    firebrick_color = color_firebrick()
    assert red_of(firebrick_color) == 178
    assert green_of(firebrick_color) == 34
    assert blue_of(firebrick_color) == 34
    assert alpha_of(firebrick_color) == 255


def test_ColorFloralWhite_integration():
    floral_white_color = color_floral_white()
    assert red_of(floral_white_color) == 255
    assert green_of(floral_white_color) == 250
    assert blue_of(floral_white_color) == 240
    assert alpha_of(floral_white_color) == 255


def test_ColorForestGreen_integration():
    forest_green_color = color_forest_green()
    assert red_of(forest_green_color) == 34
    assert green_of(forest_green_color) == 139
    assert blue_of(forest_green_color) == 34
    assert alpha_of(forest_green_color) == 255


def test_ColorFuchsia_integration():
    fuchsia_color = color_fuchsia()
    assert red_of(fuchsia_color) == 255
    assert green_of(fuchsia_color) == 0
    assert blue_of(fuchsia_color) == 255
    assert alpha_of(fuchsia_color) == 255


def test_ColorGainsboro_integration():
    gainsboro_color = color_gainsboro()
    assert red_of(gainsboro_color) == 220
    assert green_of(gainsboro_color) == 220
    assert blue_of(gainsboro_color) == 220
    assert alpha_of(gainsboro_color) == 255


def test_ColorGhostWhite_integration():
    ghost_white_color = color_ghost_white()
    assert red_of(ghost_white_color) == 248
    assert green_of(ghost_white_color) == 248
    assert blue_of(ghost_white_color) == 255
    assert alpha_of(ghost_white_color) == 255


def test_ColorGold_integration():
    gold_color = color_gold()
    assert red_of(gold_color) == 255
    assert green_of(gold_color) == 215
    assert blue_of(gold_color) == 0
    assert alpha_of(gold_color) == 255


def test_ColorGoldenrod_integration():
    goldenrod_color = color_goldenrod()
    assert red_of(goldenrod_color) == 218
    assert green_of(goldenrod_color) == 165
    assert blue_of(goldenrod_color) == 32
    assert alpha_of(goldenrod_color) == 255


def test_ColorGray_integration():
    gray_color = color_gray()
    assert red_of(gray_color) == 127
    assert green_of(gray_color) == 127
    assert blue_of(gray_color) == 127
    assert alpha_of(gray_color) == 255


def test_ColorGreen_integration():
    green_color = color_green()
    assert red_of(green_color) == 0
    assert green_of(green_color) == 127
    assert blue_of(green_color) == 0
    assert alpha_of(green_color) == 255


def test_ColorGreenYellow_integration():
    green_yellow_color = color_green_yellow()
    assert red_of(green_yellow_color) == 173
    assert green_of(green_yellow_color) == 255
    assert blue_of(green_yellow_color) == 47
    assert alpha_of(green_yellow_color) == 255


def test_ColorHoneydew_integration():
    honeydew_color = color_honeydew()
    assert red_of(honeydew_color) == 240
    assert green_of(honeydew_color) == 255
    assert blue_of(honeydew_color) == 240
    assert alpha_of(honeydew_color) == 255


def test_ColorHotPink_integration():
    hot_pink_color = color_hot_pink()
    assert red_of(hot_pink_color) == 255
    assert green_of(hot_pink_color) == 105
    assert blue_of(hot_pink_color) == 180
    assert alpha_of(hot_pink_color) == 255


def test_ColorIndianRed_integration():
    indian_red_color = color_indian_red()
    assert red_of(indian_red_color) == 205
    assert green_of(indian_red_color) == 92
    assert blue_of(indian_red_color) == 92
    assert alpha_of(indian_red_color) == 255


def test_ColorIndigo_integration():
    indigo_color = color_indigo()
    assert red_of(indigo_color) == 75
    assert green_of(indigo_color) == 0
    assert blue_of(indigo_color) == 130
    assert alpha_of(indigo_color) == 255


def test_ColorIvory_integration():
    ivory_color = color_ivory()
    assert red_of(ivory_color) == 255
    assert green_of(ivory_color) == 255
    assert blue_of(ivory_color) == 240
    assert alpha_of(ivory_color) == 255


def test_ColorKhaki_integration():
    khaki_color = color_khaki()
    assert red_of(khaki_color) == 240
    assert green_of(khaki_color) == 230
    assert blue_of(khaki_color) == 140
    assert alpha_of(khaki_color) == 255


def test_ColorLavender_integration():
    lavender_color = color_lavender()
    assert red_of(lavender_color) == 230
    assert green_of(lavender_color) == 230
    assert blue_of(lavender_color) == 250
    assert alpha_of(lavender_color) == 255


def test_ColorLavenderBlush_integration():
    lavender_blush_color = color_lavender_blush()
    assert red_of(lavender_blush_color) == 255
    assert green_of(lavender_blush_color) == 240
    assert blue_of(lavender_blush_color) == 245
    assert alpha_of(lavender_blush_color) == 255


def test_ColorLawnGreen_integration():
    lawn_green_color = color_lawn_green()
    assert red_of(lawn_green_color) == 124
    assert green_of(lawn_green_color) == 252
    assert blue_of(lawn_green_color) == 0
    assert alpha_of(lawn_green_color) == 255


def test_ColorLemonChiffon_integration():
    lemon_chiffon_color = color_lemon_chiffon()
    assert red_of(lemon_chiffon_color) == 255
    assert green_of(lemon_chiffon_color) == 250
    assert blue_of(lemon_chiffon_color) == 205
    assert alpha_of(lemon_chiffon_color) == 255


def test_ColorLightBlue_integration():
    light_blue_color = color_light_blue()
    assert red_of(light_blue_color) == 173
    assert green_of(light_blue_color) == 216
    assert blue_of(light_blue_color) == 230
    assert alpha_of(light_blue_color) == 255


def test_ColorLightCoral_integration():
    light_coral_color = color_light_coral()
    assert red_of(light_coral_color) == 240
    assert green_of(light_coral_color) == 127
    assert blue_of(light_coral_color) == 127
    assert alpha_of(light_coral_color) == 255


def test_ColorLightCyan_integration():
    light_cyan_color = color_light_cyan()
    assert red_of(light_cyan_color) == 224
    assert green_of(light_cyan_color) == 255
    assert blue_of(light_cyan_color) == 255
    assert alpha_of(light_cyan_color) == 255


def test_ColorLightGoldenrodYellow_integration():
    light_goldenrod_yellow_color = color_light_goldenrod_yellow()
    assert red_of(light_goldenrod_yellow_color) == 250
    assert green_of(light_goldenrod_yellow_color) == 250
    assert blue_of(light_goldenrod_yellow_color) == 210
    assert alpha_of(light_goldenrod_yellow_color) == 255


def test_ColorLightGray_integration():
    light_gray_color = color_light_gray()
    assert red_of(light_gray_color) == 211
    assert green_of(light_gray_color) == 211
    assert blue_of(light_gray_color) == 211
    assert alpha_of(light_gray_color) == 255


def test_ColorLightGreen_integration():
    light_green_color = color_light_green()
    assert red_of(light_green_color) == 144
    assert green_of(light_green_color) == 238
    assert blue_of(light_green_color) == 144
    assert alpha_of(light_green_color) == 255


def test_ColorLightPink_integration():
    light_pink_color = color_light_pink()
    assert red_of(light_pink_color) == 255
    assert green_of(light_pink_color) == 182
    assert blue_of(light_pink_color) == 193
    assert alpha_of(light_pink_color) == 255


def test_ColorLightSalmon_integration():
    light_salmon_color = color_light_salmon()
    assert red_of(light_salmon_color) == 255
    assert green_of(light_salmon_color) == 160
    assert blue_of(light_salmon_color) == 122
    assert alpha_of(light_salmon_color) == 255


def test_ColorLightSeaGreen_integration():
    light_sea_green_color = color_light_sea_green()
    assert red_of(light_sea_green_color) == 32
    assert green_of(light_sea_green_color) == 178
    assert blue_of(light_sea_green_color) == 170
    assert alpha_of(light_sea_green_color) == 255


def test_ColorLightSkyBlue_integration():
    light_sky_blue_color = color_light_sky_blue()
    assert red_of(light_sky_blue_color) == 135
    assert green_of(light_sky_blue_color) == 206
    assert blue_of(light_sky_blue_color) == 250
    assert alpha_of(light_sky_blue_color) == 255


def test_ColorLightSlateGray_integration():
    light_slate_gray_color = color_light_slate_gray()
    assert red_of(light_slate_gray_color) == 119
    assert green_of(light_slate_gray_color) == 136
    assert blue_of(light_slate_gray_color) == 153
    assert alpha_of(light_slate_gray_color) == 255


def test_ColorLightSteelBlue_integration():
    light_steel_blue_color = color_light_steel_blue()
    assert red_of(light_steel_blue_color) == 176
    assert green_of(light_steel_blue_color) == 196
    assert blue_of(light_steel_blue_color) == 222
    assert alpha_of(light_steel_blue_color) == 255


def test_ColorLightYellow_integration():
    light_yellow_color = color_light_yellow()
    assert red_of(light_yellow_color) == 255
    assert green_of(light_yellow_color) == 255
    assert blue_of(light_yellow_color) == 224
    assert alpha_of(light_yellow_color) == 255


def test_ColorLime_integration():
    lime_color = color_lime()
    assert red_of(lime_color) == 0
    assert green_of(lime_color) == 255
    assert blue_of(lime_color) == 0
    assert alpha_of(lime_color) == 255


def test_ColorLimeGreen_integration():
    lime_green_color = color_lime_green()
    assert red_of(lime_green_color) == 50
    assert green_of(lime_green_color) == 205
    assert blue_of(lime_green_color) == 50
    assert alpha_of(lime_green_color) == 255


def test_ColorLinen_integration():
    linen_color = color_linen()
    assert red_of(linen_color) == 250
    assert green_of(linen_color) == 240
    assert blue_of(linen_color) == 230
    assert alpha_of(linen_color) == 255


def test_ColorMagenta_integration():
    magenta_color = color_magenta()
    assert red_of(magenta_color) == 255
    assert green_of(magenta_color) == 0
    assert blue_of(magenta_color) == 255
    assert alpha_of(magenta_color) == 255


def test_ColorMaroon_integration():
    maroon_color = color_maroon()
    assert red_of(maroon_color) == 127
    assert green_of(maroon_color) == 0
    assert blue_of(maroon_color) == 0
    assert alpha_of(maroon_color) == 255


def test_ColorMediumAquamarine_integration():
    medium_aquamarine_color = color_medium_aquamarine()
    assert red_of(medium_aquamarine_color) == 102
    assert green_of(medium_aquamarine_color) == 205
    assert blue_of(medium_aquamarine_color) == 170
    assert alpha_of(medium_aquamarine_color) == 255


def test_ColorMediumBlue_integration():
    medium_blue_color = color_medium_blue()
    assert red_of(medium_blue_color) == 0
    assert green_of(medium_blue_color) == 0
    assert blue_of(medium_blue_color) == 205
    assert alpha_of(medium_blue_color) == 255


def test_ColorMediumOrchid_integration():
    medium_orchid_color = color_medium_orchid()
    assert red_of(medium_orchid_color) == 186
    assert green_of(medium_orchid_color) == 85
    assert blue_of(medium_orchid_color) == 211
    assert alpha_of(medium_orchid_color) == 255


def test_ColorMediumPurple_integration():
    medium_purple_color = color_medium_purple()
    assert red_of(medium_purple_color) == 147
    assert green_of(medium_purple_color) == 112
    assert blue_of(medium_purple_color) == 219
    assert alpha_of(medium_purple_color) == 255


def test_ColorMediumSeaGreen_integration():
    medium_sea_green_color = color_medium_sea_green()
    assert red_of(medium_sea_green_color) == 60
    assert green_of(medium_sea_green_color) == 179
    assert blue_of(medium_sea_green_color) == 113
    assert alpha_of(medium_sea_green_color) == 255


def test_ColorMediumSlateBlue_integration():
    medium_slate_blue_color = color_medium_slate_blue()
    assert red_of(medium_slate_blue_color) == 123
    assert green_of(medium_slate_blue_color) == 104
    assert blue_of(medium_slate_blue_color) == 238
    assert alpha_of(medium_slate_blue_color) == 255


def test_ColorMediumSpringGreen_integration():
    medium_spring_green_color = color_medium_spring_green()
    assert red_of(medium_spring_green_color) == 0
    assert green_of(medium_spring_green_color) == 250
    assert blue_of(medium_spring_green_color) == 154
    assert alpha_of(medium_spring_green_color) == 255


def test_ColorMediumTurquoise_integration():
    medium_turquoise_color = color_medium_turquoise()
    assert red_of(medium_turquoise_color) == 72
    assert green_of(medium_turquoise_color) == 209
    assert blue_of(medium_turquoise_color) == 204
    assert alpha_of(medium_turquoise_color) == 255


def test_ColorMediumVioletRed_integration():
    medium_violet_red_color = color_medium_violet_red()
    assert red_of(medium_violet_red_color) == 199
    assert green_of(medium_violet_red_color) == 21
    assert blue_of(medium_violet_red_color) == 133
    assert alpha_of(medium_violet_red_color) == 255


def test_ColorMidnightBlue_integration():
    midnight_blue_color = color_midnight_blue()
    assert red_of(midnight_blue_color) == 25
    assert green_of(midnight_blue_color) == 25
    assert blue_of(midnight_blue_color) == 112
    assert alpha_of(midnight_blue_color) == 255


def test_ColorMintCream_integration():
    mint_cream_color = color_mint_cream()
    assert red_of(mint_cream_color) == 245
    assert green_of(mint_cream_color) == 255
    assert blue_of(mint_cream_color) == 250
    assert alpha_of(mint_cream_color) == 255


def test_ColorMistyRose_integration():
    misty_rose_color = color_misty_rose()
    assert red_of(misty_rose_color) == 255
    assert green_of(misty_rose_color) == 228
    assert blue_of(misty_rose_color) == 225
    assert alpha_of(misty_rose_color) == 255


def test_ColorMoccasin_integration():
    moccasin_color = color_moccasin()
    assert red_of(moccasin_color) == 255
    assert green_of(moccasin_color) == 228
    assert blue_of(moccasin_color) == 181
    assert alpha_of(moccasin_color) == 255


def test_ColorNavajoWhite_integration():
    navajo_white_color = color_navajo_white()
    assert red_of(navajo_white_color) == 255
    assert green_of(navajo_white_color) == 222
    assert blue_of(navajo_white_color) == 173
    assert alpha_of(navajo_white_color) == 255


def test_ColorNavy_integration():
    navy_color = color_navy()
    assert red_of(navy_color) == 0
    assert green_of(navy_color) == 0
    assert blue_of(navy_color) == 127
    assert alpha_of(navy_color) == 255


def test_ColorOldLace_integration():
    old_lace_color = color_old_lace()
    assert red_of(old_lace_color) == 253
    assert green_of(old_lace_color) == 245
    assert blue_of(old_lace_color) == 230
    assert alpha_of(old_lace_color) == 255


def test_ColorOlive_integration():
    olive_color = color_olive()
    assert red_of(olive_color) == 127
    assert green_of(olive_color) == 127
    assert blue_of(olive_color) == 0
    assert alpha_of(olive_color) == 255


def test_ColorOliveDrab_integration():
    olive_drab_color = color_olive_drab()
    assert red_of(olive_drab_color) == 107
    assert green_of(olive_drab_color) == 142
    assert blue_of(olive_drab_color) == 35
    assert alpha_of(olive_drab_color) == 255


def test_ColorOrange_integration():
    orange_color = color_orange()
    assert red_of(orange_color) == 255
    assert green_of(orange_color) == 165
    assert blue_of(orange_color) == 0
    assert alpha_of(orange_color) == 255


def test_ColorOrangeRed_integration():
    orange_red_color = color_orange_red()
    assert red_of(orange_red_color) == 255
    assert green_of(orange_red_color) == 69
    assert blue_of(orange_red_color) == 0
    assert alpha_of(orange_red_color) == 255


def test_ColorOrchid_integration():
    orchid_color = color_orchid()
    assert red_of(orchid_color) == 218
    assert green_of(orchid_color) == 112
    assert blue_of(orchid_color) == 214
    assert alpha_of(orchid_color) == 255


def test_ColorPaleGoldenrod_integration():
    pale_goldenrod_color = color_pale_goldenrod()
    assert red_of(pale_goldenrod_color) == 238
    assert green_of(pale_goldenrod_color) == 232
    assert blue_of(pale_goldenrod_color) == 170
    assert alpha_of(pale_goldenrod_color) == 255


def test_ColorPaleGreen_integration():
    pale_green_color = color_pale_green()
    assert red_of(pale_green_color) == 152
    assert green_of(pale_green_color) == 251
    assert blue_of(pale_green_color) == 152
    assert alpha_of(pale_green_color) == 255


def test_ColorPaleTurquoise_integration():
    pale_turquoise_color = color_pale_turquoise()
    assert red_of(pale_turquoise_color) == 175
    assert green_of(pale_turquoise_color) == 238
    assert blue_of(pale_turquoise_color) == 238
    assert alpha_of(pale_turquoise_color) == 255


def test_ColorPaleVioletRed_integration():
    pale_violet_red_color = color_pale_violet_red()
    assert red_of(pale_violet_red_color) == 219
    assert green_of(pale_violet_red_color) == 112
    assert blue_of(pale_violet_red_color) == 147
    assert alpha_of(pale_violet_red_color) == 255


def test_ColorPapayaWhip_integration():
    papaya_whip_color = color_papaya_whip()
    assert red_of(papaya_whip_color) == 255
    assert green_of(papaya_whip_color) == 239
    assert blue_of(papaya_whip_color) == 213
    assert alpha_of(papaya_whip_color) == 255


def test_ColorPeachPuff_integration():
    peach_puff_color = color_peach_puff()
    assert red_of(peach_puff_color) == 255
    assert green_of(peach_puff_color) == 218
    assert blue_of(peach_puff_color) == 185
    assert alpha_of(peach_puff_color) == 255


def test_ColorPeru_integration():
    peru_color = color_peru()
    assert red_of(peru_color) == 205
    assert green_of(peru_color) == 133
    assert blue_of(peru_color) == 63
    assert alpha_of(peru_color) == 255


def test_ColorPink_integration():
    pink_color = color_pink()
    assert red_of(pink_color) == 255
    assert green_of(pink_color) == 192
    assert blue_of(pink_color) == 203
    assert alpha_of(pink_color) == 255


def test_ColorPlum_integration():
    plum_color = color_plum()
    assert red_of(plum_color) == 221
    assert green_of(plum_color) == 160
    assert blue_of(plum_color) == 221
    assert alpha_of(plum_color) == 255


def test_ColorPowderBlue_integration():
    powder_blue_color = color_powder_blue()
    assert red_of(powder_blue_color) == 176
    assert green_of(powder_blue_color) == 224
    assert blue_of(powder_blue_color) == 230
    assert alpha_of(powder_blue_color) == 255


def test_ColorPurple_integration():
    purple_color = color_purple()
    assert red_of(purple_color) == 127
    assert green_of(purple_color) == 0
    assert blue_of(purple_color) == 127
    assert alpha_of(purple_color) == 255


def test_ColorRed_integration():
    red_color = color_red()
    assert red_of(red_color) == 255
    assert green_of(red_color) == 0
    assert blue_of(red_color) == 0
    assert alpha_of(red_color) == 255


def test_ColorRosyBrown_integration():
    rosy_brown_color = color_rosy_brown()
    assert red_of(rosy_brown_color) == 188
    assert green_of(rosy_brown_color) == 143
    assert blue_of(rosy_brown_color) == 143
    assert alpha_of(rosy_brown_color) == 255


def test_ColorRoyalBlue_integration():
    royal_blue_color = color_royal_blue()
    assert red_of(royal_blue_color) == 65
    assert green_of(royal_blue_color) == 105
    assert blue_of(royal_blue_color) == 225
    assert alpha_of(royal_blue_color) == 255


def test_ColorSaddleBrown_integration():
    saddle_brown_color = color_saddle_brown()
    assert red_of(saddle_brown_color) == 139
    assert green_of(saddle_brown_color) == 69
    assert blue_of(saddle_brown_color) == 19
    assert alpha_of(saddle_brown_color) == 255


def test_ColorSalmon_integration():
    salmon_color = color_salmon()
    assert red_of(salmon_color) == 250
    assert green_of(salmon_color) == 127
    assert blue_of(salmon_color) == 114
    assert alpha_of(salmon_color) == 255


def test_ColorSandyBrown_integration():
    sandy_brown_color = color_sandy_brown()
    assert red_of(sandy_brown_color) == 244
    assert green_of(sandy_brown_color) == 164
    assert blue_of(sandy_brown_color) == 96
    assert alpha_of(sandy_brown_color) == 255


def test_ColorSeaGreen_integration():
    sea_green_color = color_sea_green()
    assert red_of(sea_green_color) == 46
    assert green_of(sea_green_color) == 139
    assert blue_of(sea_green_color) == 87
    assert alpha_of(sea_green_color) == 255


def test_ColorSeaShell_integration():
    sea_shell_color = color_sea_shell()
    assert red_of(sea_shell_color) == 255
    assert green_of(sea_shell_color) == 245
    assert blue_of(sea_shell_color) == 238
    assert alpha_of(sea_shell_color) == 255


def test_ColorSienna_integration():
    sienna_color = color_sienna()
    assert red_of(sienna_color) == 160
    assert green_of(sienna_color) == 82
    assert blue_of(sienna_color) == 45
    assert alpha_of(sienna_color) == 255


def test_ColorSilver_integration():
    silver_color = color_silver()
    assert red_of(silver_color) == 192
    assert green_of(silver_color) == 192
    assert blue_of(silver_color) == 192
    assert alpha_of(silver_color) == 255


def test_ColorSkyBlue_integration():
    sky_blue_color = color_sky_blue()
    assert red_of(sky_blue_color) == 135
    assert green_of(sky_blue_color) == 206
    assert blue_of(sky_blue_color) == 235
    assert alpha_of(sky_blue_color) == 255


def test_ColorSlateBlue_integration():
    slate_blue_color = color_slate_blue()
    assert red_of(slate_blue_color) == 106
    assert green_of(slate_blue_color) == 90
    assert blue_of(slate_blue_color) == 205
    assert alpha_of(slate_blue_color) == 255


def test_ColorSlateGray_integration():
    slate_gray_color = color_slate_gray()
    assert red_of(slate_gray_color) == 112
    assert green_of(slate_gray_color) == 127
    assert blue_of(slate_gray_color) == 144
    assert alpha_of(slate_gray_color) == 255


def test_ColorSnow_integration():
    snow_color = color_snow()
    assert red_of(snow_color) == 255
    assert green_of(snow_color) == 250
    assert blue_of(snow_color) == 250
    assert alpha_of(snow_color) == 255


def test_ColorSpringGreen_integration():
    spring_green_color = color_spring_green()
    assert red_of(spring_green_color) == 0
    assert green_of(spring_green_color) == 255
    assert blue_of(spring_green_color) == 127
    assert alpha_of(spring_green_color) == 255


def test_ColorSteelBlue_integration():
    steel_blue_color = color_steel_blue()
    assert red_of(steel_blue_color) == 70
    assert green_of(steel_blue_color) == 130
    assert blue_of(steel_blue_color) == 180
    assert alpha_of(steel_blue_color) == 255


def test_ColorSwinburneRed_integration():
    swinburne_red_color = color_swinburne_red()
    assert red_of(swinburne_red_color) == 237
    assert green_of(swinburne_red_color) == 36
    assert blue_of(swinburne_red_color) == 25
    assert alpha_of(swinburne_red_color) == 255


def test_ColorTan_integration():
    tan_color = color_tan()
    assert red_of(tan_color) == 210
    assert green_of(tan_color) == 180
    assert blue_of(tan_color) == 140
    assert alpha_of(tan_color) == 255


def test_ColorTeal_integration():
    teal_color = color_teal()
    assert red_of(teal_color) == 0
    assert green_of(teal_color) == 127
    assert blue_of(teal_color) == 127
    assert alpha_of(teal_color) == 255


def test_ColorThistle_integration():
    thistle_color = color_thistle()
    assert red_of(thistle_color) == 216
    assert green_of(thistle_color) == 191
    assert blue_of(thistle_color) == 216
    assert alpha_of(thistle_color) == 255


def test_ColorToString_integration():
    red_color = color_red()
    red_color_string = color_to_string(red_color)
    assert red_color_string == "#ff0000ff"
    transparent_color = color_transparent()
    transparent_color_string = color_to_string(transparent_color)
    assert transparent_color_string == "#ffffffff"


def test_ColorTomato_integration():
    tomato_color = color_tomato()
    assert red_of(tomato_color) == 255
    assert green_of(tomato_color) == 99
    assert blue_of(tomato_color) == 71
    assert alpha_of(tomato_color) == 255


def test_ColorTransparent_integration():
    transparent_color = color_transparent()
    assert alpha_of(transparent_color) == 255
    assert red_of(transparent_color) == 255
    assert green_of(transparent_color) == 255
    assert blue_of(transparent_color) == 255


def test_ColorTurquoise_integration():
    turquoise_color = color_turquoise()
    assert red_of(turquoise_color) == 64
    assert green_of(turquoise_color) == 224
    assert blue_of(turquoise_color) == 208
    assert alpha_of(turquoise_color) == 255


def test_ColorViolet_integration():
    violet_color = color_violet()
    assert red_of(violet_color) == 238
    assert green_of(violet_color) == 130
    assert blue_of(violet_color) == 238
    assert alpha_of(violet_color) == 255


def test_ColorWheat_integration():
    wheat_color = color_wheat()
    assert red_of(wheat_color) == 245
    assert green_of(wheat_color) == 222
    assert blue_of(wheat_color) == 179
    assert alpha_of(wheat_color) == 255


def test_ColorWhite_integration():
    white_color = color_white()
    assert red_of(white_color) == 255
    assert green_of(white_color) == 255
    assert blue_of(white_color) == 255
    assert alpha_of(white_color) == 255


def test_ColorWhiteSmoke_integration():
    white_smoke_color = color_white_smoke()
    assert red_of(white_smoke_color) == 245
    assert green_of(white_smoke_color) == 245
    assert blue_of(white_smoke_color) == 245
    assert alpha_of(white_smoke_color) == 255


def test_ColorYellow_integration():
    yellow_color = color_yellow()
    assert red_of(yellow_color) == 255
    assert green_of(yellow_color) == 255
    assert blue_of(yellow_color) == 0
    assert alpha_of(yellow_color) == 255


def test_ColorYellowGreen_integration():
    yellow_green_color = color_yellow_green()
    assert red_of(yellow_green_color) == 154
    assert green_of(yellow_green_color) == 205
    assert blue_of(yellow_green_color) == 50
    assert alpha_of(yellow_green_color) == 255


def test_GreenOf_integration():
    green_color = color_green()
    green_value = green_of(green_color)
    assert green_value == 127
    black_color = color_black()
    black_green_value = green_of(black_color)
    assert black_green_value == 0


def test_HSBColor_integration():
    red_color = hsb_color(0.0, 1.0, 1.0)
    assert hue_of(red_color) == 0.0
    assert saturation_of(red_color) == 1.0
    assert brightness_of(red_color) == 1.0
    gray_color = hsb_color(0.5, 0.0, 0.5)
    assert saturation_of(gray_color) == 0.0


def test_HueOf_integration():
    red_color = color_red()
    hue_value = hue_of(red_color)
    assert hue_value == 0.0
    blue_color = color_blue()
    hue_value_blue = hue_of(blue_color)
    assert hue_value_blue == 0.6666666666666666


def test_RandomColor_integration():
    random_color_result = random_color()
    assert color_to_string(random_color_result) != "#000000FF"
    assert 0 <= alpha_of(random_color_result) <= 255


def test_RandomRGBColor_integration():
    random_color = random_rgb_color(255)
    assert 0 <= red_of(random_color) <= 255
    assert 0 <= green_of(random_color) <= 255
    assert 0 <= blue_of(random_color) <= 255
    assert alpha_of(random_color) == 255


def test_RedOf_integration():
    red_color = color_red()
    red_value = red_of(red_color)
    assert red_value == 255
    blue_color = color_blue()
    blue_red_value = red_of(blue_color)
    assert blue_red_value == 0


def test_RGBColorFromDouble_integration():
    red_color = rgb_color(1.0, 0.0, 0.0)
    assert red_of(red_color) == 255
    assert green_of(red_color) == 0
    assert blue_of(red_color) == 0
    green_color = rgb_color(0.0, 1.0, 0.0)
    assert red_of(green_color) == 0
    assert green_of(green_color) == 255
    assert blue_of(green_color) == 0


def test_RGBColor_integration():
    red_color = rgb_color(255, 0, 0)
    assert red_of(red_color) == 255
    assert green_of(red_color) == 0
    assert blue_of(red_color) == 0
    assert alpha_of(red_color) == 255


def test_RGBAColorFromDouble_integration():
    test_color = rgba_color(1.0, 0.5, 0.0, 0.75)
    assert red_of(test_color) == 255
    assert green_of(test_color) == 127
    assert blue_of(test_color) == 0
    assert alpha_of(test_color) == 191


def test_RGBAColor_integration():
    red_color = rgba_color(255, 0, 0, 255)
    assert red_of(red_color) == 255
    assert green_of(red_color) == 0
    assert blue_of(red_color) == 0
    assert alpha_of(red_color) == 255


def test_SaturationOf_integration():
    red_color = color_red()
    saturation_value = saturation_of(red_color)
    assert saturation_value == 1.0
    gray_color = color_gray()
    saturation_value_gray = saturation_of(gray_color)
    assert saturation_value_gray == 0.0


def test_StringToColor_integration():
    red_color = string_to_color("#FF0000FF")
    assert red_of(red_color) == 255
    assert green_of(red_color) == 0
    assert blue_of(red_color) == 0
    assert alpha_of(red_color) == 255
    green_color = string_to_color("#00FF00FF")
    assert red_of(green_color) == 0
    assert green_of(green_color) == 255
    assert blue_of(green_color) == 0
    assert alpha_of(green_color) == 255

