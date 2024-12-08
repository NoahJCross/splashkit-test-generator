#include "splashkit.h"
#include <catch2/catch.hpp>

TEST_CASE("alpha_of_integration") {
    auto red_color = color_red();
    auto alpha_value = alpha_of(red_color);
    REQUIRE(255 == alpha_value);
    auto transparent_color = color_transparent();
    auto alpha_value_transparent = alpha_of(transparent_color);
    REQUIRE(255 == alpha_value_transparent);
}
TEST_CASE("blue_of_integration") {
    auto blue_color = color_blue();
    auto blue_value = blue_of(blue_color);
    REQUIRE(255 == blue_value);
    auto red_color = color_red();
    auto blue_value_red = blue_of(red_color);
    REQUIRE(0 == blue_value_red);
}
TEST_CASE("brightness_of_integration") {
    auto white_color = color_white();
    auto white_brightness = brightness_of(white_color);
    REQUIRE(1.0 == white_brightness);
    auto black_color = color_black();
    auto black_brightness = brightness_of(black_color);
    REQUIRE(0.0 == black_brightness);
    auto gray_color = color_gray();
    auto gray_brightness = brightness_of(gray_color);
    REQUIRE(gray_brightness >= 0.4 && gray_brightness <= 0.6);
}
TEST_CASE("color_alice_blue_integration") {
    auto alice_blue_color = color_alice_blue();
    REQUIRE(240 == red_of(alice_blue_color));
    REQUIRE(248 == green_of(alice_blue_color));
    REQUIRE(255 == blue_of(alice_blue_color));
    REQUIRE(255 == alpha_of(alice_blue_color));
}
TEST_CASE("color_antique_white_integration") {
    auto antique_white_color = color_antique_white();
    REQUIRE(250 == red_of(antique_white_color));
    REQUIRE(235 == green_of(antique_white_color));
    REQUIRE(215 == blue_of(antique_white_color));
    REQUIRE(255 == alpha_of(antique_white_color));
}
TEST_CASE("color_aqua_integration") {
    auto aqua_color = color_aqua();
    REQUIRE(0 == red_of(aqua_color));
    REQUIRE(255 == green_of(aqua_color));
    REQUIRE(255 == blue_of(aqua_color));
    REQUIRE(255 == alpha_of(aqua_color));
}
TEST_CASE("color_aquamarine_integration") {
    auto aquamarine_color = color_aquamarine();
    REQUIRE(127 == red_of(aquamarine_color));
    REQUIRE(255 == green_of(aquamarine_color));
    REQUIRE(212 == blue_of(aquamarine_color));
    REQUIRE(255 == alpha_of(aquamarine_color));
}
TEST_CASE("color_azure_integration") {
    auto azure_color = color_azure();
    REQUIRE(240 == red_of(azure_color));
    REQUIRE(255 == green_of(azure_color));
    REQUIRE(255 == blue_of(azure_color));
    REQUIRE(255 == alpha_of(azure_color));
}
TEST_CASE("color_beige_integration") {
    auto beige_color = color_beige();
    REQUIRE(245 == red_of(beige_color));
    REQUIRE(245 == green_of(beige_color));
    REQUIRE(220 == blue_of(beige_color));
    REQUIRE(255 == alpha_of(beige_color));
}
TEST_CASE("color_bisque_integration") {
    auto bisque_color = color_bisque();
    REQUIRE(255 == red_of(bisque_color));
    REQUIRE(228 == green_of(bisque_color));
    REQUIRE(196 == blue_of(bisque_color));
    REQUIRE(255 == alpha_of(bisque_color));
}
TEST_CASE("color_black_integration") {
    auto black_color = color_black();
    REQUIRE(0 == red_of(black_color));
    REQUIRE(0 == green_of(black_color));
    REQUIRE(0 == blue_of(black_color));
    REQUIRE(255 == alpha_of(black_color));
}
TEST_CASE("color_blanched_almond_integration") {
    auto blanched_almond_color = color_blanched_almond();
    REQUIRE(255 == red_of(blanched_almond_color));
    REQUIRE(235 == green_of(blanched_almond_color));
    REQUIRE(205 == blue_of(blanched_almond_color));
    REQUIRE(255 == alpha_of(blanched_almond_color));
}
TEST_CASE("color_blue_integration") {
    auto blue_color = color_blue();
    REQUIRE(0 == red_of(blue_color));
    REQUIRE(0 == green_of(blue_color));
    REQUIRE(255 == blue_of(blue_color));
    REQUIRE(255 == alpha_of(blue_color));
}
TEST_CASE("color_blue_violet_integration") {
    auto blue_violet_color = color_blue_violet();
    REQUIRE(138 == red_of(blue_violet_color));
    REQUIRE(43 == green_of(blue_violet_color));
    REQUIRE(226 == blue_of(blue_violet_color));
    REQUIRE(255 == alpha_of(blue_violet_color));
}
TEST_CASE("color_bright_green_integration") {
    auto bright_green_color = color_bright_green();
    REQUIRE(0 == red_of(bright_green_color));
    REQUIRE(255 == green_of(bright_green_color));
    REQUIRE(0 == blue_of(bright_green_color));
    REQUIRE(255 == alpha_of(bright_green_color));
}
TEST_CASE("color_brown_integration") {
    auto brown_color = color_brown();
    REQUIRE(165 == red_of(brown_color));
    REQUIRE(42 == green_of(brown_color));
    REQUIRE(42 == blue_of(brown_color));
    REQUIRE(255 == alpha_of(brown_color));
}
TEST_CASE("color_burly_wood_integration") {
    auto burly_wood_color = color_burly_wood();
    REQUIRE(222 == red_of(burly_wood_color));
    REQUIRE(184 == green_of(burly_wood_color));
    REQUIRE(135 == blue_of(burly_wood_color));
    REQUIRE(255 == alpha_of(burly_wood_color));
}
TEST_CASE("color_cadet_blue_integration") {
    auto cadet_blue_color = color_cadet_blue();
    REQUIRE(95 == red_of(cadet_blue_color));
    REQUIRE(158 == green_of(cadet_blue_color));
    REQUIRE(160 == blue_of(cadet_blue_color));
    REQUIRE(255 == alpha_of(cadet_blue_color));
}
TEST_CASE("color_chartreuse_integration") {
    auto chartreuse_color = color_chartreuse();
    REQUIRE(127 == red_of(chartreuse_color));
    REQUIRE(255 == green_of(chartreuse_color));
    REQUIRE(0 == blue_of(chartreuse_color));
    REQUIRE(255 == alpha_of(chartreuse_color));
}
TEST_CASE("color_chocolate_integration") {
    auto chocolate_color = color_chocolate();
    REQUIRE(210 == red_of(chocolate_color));
    REQUIRE(105 == green_of(chocolate_color));
    REQUIRE(30 == blue_of(chocolate_color));
    REQUIRE(255 == alpha_of(chocolate_color));
}
TEST_CASE("color_coral_integration") {
    auto coral_color = color_coral();
    REQUIRE(255 == red_of(coral_color));
    REQUIRE(127 == green_of(coral_color));
    REQUIRE(80 == blue_of(coral_color));
    REQUIRE(255 == alpha_of(coral_color));
}
TEST_CASE("color_cornflower_blue_integration") {
    auto cornflower_blue_color = color_cornflower_blue();
    REQUIRE(100 == red_of(cornflower_blue_color));
    REQUIRE(149 == green_of(cornflower_blue_color));
    REQUIRE(237 == blue_of(cornflower_blue_color));
    REQUIRE(255 == alpha_of(cornflower_blue_color));
}
TEST_CASE("color_cornsilk_integration") {
    auto cornsilk_color = color_cornsilk();
    REQUIRE(255 == red_of(cornsilk_color));
    REQUIRE(248 == green_of(cornsilk_color));
    REQUIRE(220 == blue_of(cornsilk_color));
    REQUIRE(255 == alpha_of(cornsilk_color));
}
TEST_CASE("color_crimson_integration") {
    auto crimson_color = color_crimson();
    REQUIRE(220 == red_of(crimson_color));
    REQUIRE(20 == green_of(crimson_color));
    REQUIRE(60 == blue_of(crimson_color));
    REQUIRE(255 == alpha_of(crimson_color));
}
TEST_CASE("color_cyan_integration") {
    auto cyan_color = color_cyan();
    REQUIRE(0 == red_of(cyan_color));
    REQUIRE(255 == green_of(cyan_color));
    REQUIRE(255 == blue_of(cyan_color));
    REQUIRE(255 == alpha_of(cyan_color));
}
TEST_CASE("color_dark_blue_integration") {
    auto dark_blue_color = color_dark_blue();
    REQUIRE(0 == red_of(dark_blue_color));
    REQUIRE(0 == green_of(dark_blue_color));
    REQUIRE(139 == blue_of(dark_blue_color));
    REQUIRE(255 == alpha_of(dark_blue_color));
}
TEST_CASE("color_dark_cyan_integration") {
    auto dark_cyan_color = color_dark_cyan();
    REQUIRE(0 == red_of(dark_cyan_color));
    REQUIRE(139 == green_of(dark_cyan_color));
    REQUIRE(139 == blue_of(dark_cyan_color));
    REQUIRE(255 == alpha_of(dark_cyan_color));
}
TEST_CASE("color_dark_goldenrod_integration") {
    auto dark_goldenrod_color = color_dark_goldenrod();
    REQUIRE(184 == red_of(dark_goldenrod_color));
    REQUIRE(134 == green_of(dark_goldenrod_color));
    REQUIRE(11 == blue_of(dark_goldenrod_color));
    REQUIRE(255 == alpha_of(dark_goldenrod_color));
}
TEST_CASE("color_dark_gray_integration") {
    auto dark_gray_color = color_dark_gray();
    REQUIRE(169 == red_of(dark_gray_color));
    REQUIRE(169 == green_of(dark_gray_color));
    REQUIRE(169 == blue_of(dark_gray_color));
    REQUIRE(255 == alpha_of(dark_gray_color));
}
TEST_CASE("color_dark_green_integration") {
    auto dark_green_color = color_dark_green();
    REQUIRE(0 == red_of(dark_green_color));
    REQUIRE(100 == green_of(dark_green_color));
    REQUIRE(0 == blue_of(dark_green_color));
    REQUIRE(255 == alpha_of(dark_green_color));
}
TEST_CASE("color_dark_khaki_integration") {
    auto dark_khaki_color = color_dark_khaki();
    REQUIRE(189 == red_of(dark_khaki_color));
    REQUIRE(183 == green_of(dark_khaki_color));
    REQUIRE(107 == blue_of(dark_khaki_color));
    REQUIRE(255 == alpha_of(dark_khaki_color));
}
TEST_CASE("color_dark_magenta_integration") {
    auto dark_magenta_color = color_dark_magenta();
    REQUIRE(139 == red_of(dark_magenta_color));
    REQUIRE(0 == green_of(dark_magenta_color));
    REQUIRE(139 == blue_of(dark_magenta_color));
    REQUIRE(255 == alpha_of(dark_magenta_color));
}
TEST_CASE("color_dark_olive_green_integration") {
    auto dark_olive_green_color = color_dark_olive_green();
    REQUIRE(85 == red_of(dark_olive_green_color));
    REQUIRE(107 == green_of(dark_olive_green_color));
    REQUIRE(47 == blue_of(dark_olive_green_color));
    REQUIRE(255 == alpha_of(dark_olive_green_color));
}
TEST_CASE("color_dark_orange_integration") {
    auto dark_orange_color = color_dark_orange();
    REQUIRE(255 == red_of(dark_orange_color));
    REQUIRE(140 == green_of(dark_orange_color));
    REQUIRE(0 == blue_of(dark_orange_color));
    REQUIRE(255 == alpha_of(dark_orange_color));
}
TEST_CASE("color_dark_orchid_integration") {
    auto dark_orchid_color = color_dark_orchid();
    REQUIRE(153 == red_of(dark_orchid_color));
    REQUIRE(50 == green_of(dark_orchid_color));
    REQUIRE(204 == blue_of(dark_orchid_color));
    REQUIRE(255 == alpha_of(dark_orchid_color));
}
TEST_CASE("color_dark_red_integration") {
    auto dark_red_color = color_dark_red();
    REQUIRE(139 == red_of(dark_red_color));
    REQUIRE(0 == green_of(dark_red_color));
    REQUIRE(0 == blue_of(dark_red_color));
    REQUIRE(255 == alpha_of(dark_red_color));
}
TEST_CASE("color_dark_salmon_integration") {
    auto dark_salmon_color = color_dark_salmon();
    REQUIRE(233 == red_of(dark_salmon_color));
    REQUIRE(150 == green_of(dark_salmon_color));
    REQUIRE(122 == blue_of(dark_salmon_color));
    REQUIRE(255 == alpha_of(dark_salmon_color));
}
TEST_CASE("color_dark_sea_green_integration") {
    auto dark_sea_green_color = color_dark_sea_green();
    REQUIRE(143 == red_of(dark_sea_green_color));
    REQUIRE(188 == green_of(dark_sea_green_color));
    REQUIRE(139 == blue_of(dark_sea_green_color));
    REQUIRE(255 == alpha_of(dark_sea_green_color));
}
TEST_CASE("color_dark_slate_blue_integration") {
    auto dark_slate_blue_color = color_dark_slate_blue();
    REQUIRE(72 == red_of(dark_slate_blue_color));
    REQUIRE(61 == green_of(dark_slate_blue_color));
    REQUIRE(139 == blue_of(dark_slate_blue_color));
    REQUIRE(255 == alpha_of(dark_slate_blue_color));
}
TEST_CASE("color_dark_slate_gray_integration") {
    auto dark_slate_gray_color = color_dark_slate_gray();
    REQUIRE(47 == red_of(dark_slate_gray_color));
    REQUIRE(79 == green_of(dark_slate_gray_color));
    REQUIRE(79 == blue_of(dark_slate_gray_color));
    REQUIRE(255 == alpha_of(dark_slate_gray_color));
}
TEST_CASE("color_dark_turquoise_integration") {
    auto dark_turquoise_color = color_dark_turquoise();
    REQUIRE(0 == red_of(dark_turquoise_color));
    REQUIRE(206 == green_of(dark_turquoise_color));
    REQUIRE(209 == blue_of(dark_turquoise_color));
    REQUIRE(255 == alpha_of(dark_turquoise_color));
}
TEST_CASE("color_dark_violet_integration") {
    auto dark_violet_color = color_dark_violet();
    REQUIRE(148 == red_of(dark_violet_color));
    REQUIRE(0 == green_of(dark_violet_color));
    REQUIRE(211 == blue_of(dark_violet_color));
    REQUIRE(255 == alpha_of(dark_violet_color));
}
TEST_CASE("color_deep_pink_integration") {
    auto deep_pink_color = color_deep_pink();
    REQUIRE(255 == red_of(deep_pink_color));
    REQUIRE(20 == green_of(deep_pink_color));
    REQUIRE(147 == blue_of(deep_pink_color));
    REQUIRE(255 == alpha_of(deep_pink_color));
}
TEST_CASE("color_deep_sky_blue_integration") {
    auto deep_sky_blue_color = color_deep_sky_blue();
    REQUIRE(0 == red_of(deep_sky_blue_color));
    REQUIRE(191 == green_of(deep_sky_blue_color));
    REQUIRE(255 == blue_of(deep_sky_blue_color));
    REQUIRE(255 == alpha_of(deep_sky_blue_color));
}
TEST_CASE("color_dim_gray_integration") {
    auto dim_gray_color = color_dim_gray();
    REQUIRE(105 == red_of(dim_gray_color));
    REQUIRE(105 == green_of(dim_gray_color));
    REQUIRE(105 == blue_of(dim_gray_color));
    REQUIRE(255 == alpha_of(dim_gray_color));
}
TEST_CASE("color_dodger_blue_integration") {
    auto dodger_blue_color = color_dodger_blue();
    REQUIRE(30 == red_of(dodger_blue_color));
    REQUIRE(144 == green_of(dodger_blue_color));
    REQUIRE(255 == blue_of(dodger_blue_color));
    REQUIRE(255 == alpha_of(dodger_blue_color));
}
TEST_CASE("color_firebrick_integration") {
    auto firebrick_color = color_firebrick();
    REQUIRE(178 == red_of(firebrick_color));
    REQUIRE(34 == green_of(firebrick_color));
    REQUIRE(34 == blue_of(firebrick_color));
    REQUIRE(255 == alpha_of(firebrick_color));
}
TEST_CASE("color_floral_white_integration") {
    auto floral_white_color = color_floral_white();
    REQUIRE(255 == red_of(floral_white_color));
    REQUIRE(250 == green_of(floral_white_color));
    REQUIRE(240 == blue_of(floral_white_color));
    REQUIRE(255 == alpha_of(floral_white_color));
}
TEST_CASE("color_forest_green_integration") {
    auto forest_green_color = color_forest_green();
    REQUIRE(34 == red_of(forest_green_color));
    REQUIRE(139 == green_of(forest_green_color));
    REQUIRE(34 == blue_of(forest_green_color));
    REQUIRE(255 == alpha_of(forest_green_color));
}
TEST_CASE("color_fuchsia_integration") {
    auto fuchsia_color = color_fuchsia();
    REQUIRE(255 == red_of(fuchsia_color));
    REQUIRE(0 == green_of(fuchsia_color));
    REQUIRE(255 == blue_of(fuchsia_color));
    REQUIRE(255 == alpha_of(fuchsia_color));
}
TEST_CASE("color_gainsboro_integration") {
    auto gainsboro_color = color_gainsboro();
    REQUIRE(220 == red_of(gainsboro_color));
    REQUIRE(220 == green_of(gainsboro_color));
    REQUIRE(220 == blue_of(gainsboro_color));
    REQUIRE(255 == alpha_of(gainsboro_color));
}
TEST_CASE("color_ghost_white_integration") {
    auto ghost_white_color = color_ghost_white();
    REQUIRE(248 == red_of(ghost_white_color));
    REQUIRE(248 == green_of(ghost_white_color));
    REQUIRE(255 == blue_of(ghost_white_color));
    REQUIRE(255 == alpha_of(ghost_white_color));
}
TEST_CASE("color_gold_integration") {
    auto gold_color = color_gold();
    REQUIRE(255 == red_of(gold_color));
    REQUIRE(215 == green_of(gold_color));
    REQUIRE(0 == blue_of(gold_color));
    REQUIRE(255 == alpha_of(gold_color));
}
TEST_CASE("color_goldenrod_integration") {
    auto goldenrod_color = color_goldenrod();
    REQUIRE(218 == red_of(goldenrod_color));
    REQUIRE(165 == green_of(goldenrod_color));
    REQUIRE(32 == blue_of(goldenrod_color));
    REQUIRE(255 == alpha_of(goldenrod_color));
}
TEST_CASE("color_gray_integration") {
    auto gray_color = color_gray();
    REQUIRE(127 == red_of(gray_color));
    REQUIRE(127 == green_of(gray_color));
    REQUIRE(127 == blue_of(gray_color));
    REQUIRE(255 == alpha_of(gray_color));
}
TEST_CASE("color_green_integration") {
    auto green_color = color_green();
    REQUIRE(0 == red_of(green_color));
    REQUIRE(127 == green_of(green_color));
    REQUIRE(0 == blue_of(green_color));
    REQUIRE(255 == alpha_of(green_color));
}
TEST_CASE("color_green_yellow_integration") {
    auto green_yellow_color = color_green_yellow();
    REQUIRE(173 == red_of(green_yellow_color));
    REQUIRE(255 == green_of(green_yellow_color));
    REQUIRE(47 == blue_of(green_yellow_color));
    REQUIRE(255 == alpha_of(green_yellow_color));
}
TEST_CASE("color_honeydew_integration") {
    auto honeydew_color = color_honeydew();
    REQUIRE(240 == red_of(honeydew_color));
    REQUIRE(255 == green_of(honeydew_color));
    REQUIRE(240 == blue_of(honeydew_color));
    REQUIRE(255 == alpha_of(honeydew_color));
}
TEST_CASE("color_hot_pink_integration") {
    auto hot_pink_color = color_hot_pink();
    REQUIRE(255 == red_of(hot_pink_color));
    REQUIRE(105 == green_of(hot_pink_color));
    REQUIRE(180 == blue_of(hot_pink_color));
    REQUIRE(255 == alpha_of(hot_pink_color));
}
TEST_CASE("color_indian_red_integration") {
    auto indian_red_color = color_indian_red();
    REQUIRE(205 == red_of(indian_red_color));
    REQUIRE(92 == green_of(indian_red_color));
    REQUIRE(92 == blue_of(indian_red_color));
    REQUIRE(255 == alpha_of(indian_red_color));
}
TEST_CASE("color_indigo_integration") {
    auto indigo_color = color_indigo();
    REQUIRE(75 == red_of(indigo_color));
    REQUIRE(0 == green_of(indigo_color));
    REQUIRE(130 == blue_of(indigo_color));
    REQUIRE(255 == alpha_of(indigo_color));
}
TEST_CASE("color_ivory_integration") {
    auto ivory_color = color_ivory();
    REQUIRE(255 == red_of(ivory_color));
    REQUIRE(255 == green_of(ivory_color));
    REQUIRE(240 == blue_of(ivory_color));
    REQUIRE(255 == alpha_of(ivory_color));
}
TEST_CASE("color_khaki_integration") {
    auto khaki_color = color_khaki();
    REQUIRE(240 == red_of(khaki_color));
    REQUIRE(230 == green_of(khaki_color));
    REQUIRE(140 == blue_of(khaki_color));
    REQUIRE(255 == alpha_of(khaki_color));
}
TEST_CASE("color_lavender_integration") {
    auto lavender_color = color_lavender();
    REQUIRE(230 == red_of(lavender_color));
    REQUIRE(230 == green_of(lavender_color));
    REQUIRE(250 == blue_of(lavender_color));
    REQUIRE(255 == alpha_of(lavender_color));
}
TEST_CASE("color_lavender_blush_integration") {
    auto lavender_blush_color = color_lavender_blush();
    REQUIRE(255 == red_of(lavender_blush_color));
    REQUIRE(240 == green_of(lavender_blush_color));
    REQUIRE(245 == blue_of(lavender_blush_color));
    REQUIRE(255 == alpha_of(lavender_blush_color));
}
TEST_CASE("color_lawn_green_integration") {
    auto lawn_green_color = color_lawn_green();
    REQUIRE(124 == red_of(lawn_green_color));
    REQUIRE(252 == green_of(lawn_green_color));
    REQUIRE(0 == blue_of(lawn_green_color));
    REQUIRE(255 == alpha_of(lawn_green_color));
}
TEST_CASE("color_lemon_chiffon_integration") {
    auto lemon_chiffon_color = color_lemon_chiffon();
    REQUIRE(255 == red_of(lemon_chiffon_color));
    REQUIRE(250 == green_of(lemon_chiffon_color));
    REQUIRE(205 == blue_of(lemon_chiffon_color));
    REQUIRE(255 == alpha_of(lemon_chiffon_color));
}
TEST_CASE("color_light_blue_integration") {
    auto light_blue_color = color_light_blue();
    REQUIRE(173 == red_of(light_blue_color));
    REQUIRE(216 == green_of(light_blue_color));
    REQUIRE(230 == blue_of(light_blue_color));
    REQUIRE(255 == alpha_of(light_blue_color));
}
TEST_CASE("color_light_coral_integration") {
    auto light_coral_color = color_light_coral();
    REQUIRE(240 == red_of(light_coral_color));
    REQUIRE(127 == green_of(light_coral_color));
    REQUIRE(127 == blue_of(light_coral_color));
    REQUIRE(255 == alpha_of(light_coral_color));
}
TEST_CASE("color_light_cyan_integration") {
    auto light_cyan_color = color_light_cyan();
    REQUIRE(224 == red_of(light_cyan_color));
    REQUIRE(255 == green_of(light_cyan_color));
    REQUIRE(255 == blue_of(light_cyan_color));
    REQUIRE(255 == alpha_of(light_cyan_color));
}
TEST_CASE("color_light_goldenrod_yellow_integration") {
    auto light_goldenrod_yellow_color = color_light_goldenrod_yellow();
    REQUIRE(250 == red_of(light_goldenrod_yellow_color));
    REQUIRE(250 == green_of(light_goldenrod_yellow_color));
    REQUIRE(210 == blue_of(light_goldenrod_yellow_color));
    REQUIRE(255 == alpha_of(light_goldenrod_yellow_color));
}
TEST_CASE("color_light_gray_integration") {
    auto light_gray_color = color_light_gray();
    REQUIRE(211 == red_of(light_gray_color));
    REQUIRE(211 == green_of(light_gray_color));
    REQUIRE(211 == blue_of(light_gray_color));
    REQUIRE(255 == alpha_of(light_gray_color));
}
TEST_CASE("color_light_green_integration") {
    auto light_green_color = color_light_green();
    REQUIRE(144 == red_of(light_green_color));
    REQUIRE(238 == green_of(light_green_color));
    REQUIRE(144 == blue_of(light_green_color));
    REQUIRE(255 == alpha_of(light_green_color));
}
TEST_CASE("color_light_pink_integration") {
    auto light_pink_color = color_light_pink();
    REQUIRE(255 == red_of(light_pink_color));
    REQUIRE(182 == green_of(light_pink_color));
    REQUIRE(193 == blue_of(light_pink_color));
    REQUIRE(255 == alpha_of(light_pink_color));
}
TEST_CASE("color_light_salmon_integration") {
    auto light_salmon_color = color_light_salmon();
    REQUIRE(255 == red_of(light_salmon_color));
    REQUIRE(160 == green_of(light_salmon_color));
    REQUIRE(122 == blue_of(light_salmon_color));
    REQUIRE(255 == alpha_of(light_salmon_color));
}
TEST_CASE("color_light_sea_green_integration") {
    auto light_sea_green_color = color_light_sea_green();
    REQUIRE(32 == red_of(light_sea_green_color));
    REQUIRE(178 == green_of(light_sea_green_color));
    REQUIRE(170 == blue_of(light_sea_green_color));
    REQUIRE(255 == alpha_of(light_sea_green_color));
}
TEST_CASE("color_light_sky_blue_integration") {
    auto light_sky_blue_color = color_light_sky_blue();
    REQUIRE(135 == red_of(light_sky_blue_color));
    REQUIRE(206 == green_of(light_sky_blue_color));
    REQUIRE(250 == blue_of(light_sky_blue_color));
    REQUIRE(255 == alpha_of(light_sky_blue_color));
}
TEST_CASE("color_light_slate_gray_integration") {
    auto light_slate_gray_color = color_light_slate_gray();
    REQUIRE(119 == red_of(light_slate_gray_color));
    REQUIRE(136 == green_of(light_slate_gray_color));
    REQUIRE(153 == blue_of(light_slate_gray_color));
    REQUIRE(255 == alpha_of(light_slate_gray_color));
}
TEST_CASE("color_light_steel_blue_integration") {
    auto light_steel_blue_color = color_light_steel_blue();
    REQUIRE(176 == red_of(light_steel_blue_color));
    REQUIRE(196 == green_of(light_steel_blue_color));
    REQUIRE(222 == blue_of(light_steel_blue_color));
    REQUIRE(255 == alpha_of(light_steel_blue_color));
}
TEST_CASE("color_light_yellow_integration") {
    auto light_yellow_color = color_light_yellow();
    REQUIRE(255 == red_of(light_yellow_color));
    REQUIRE(255 == green_of(light_yellow_color));
    REQUIRE(224 == blue_of(light_yellow_color));
    REQUIRE(255 == alpha_of(light_yellow_color));
}
TEST_CASE("color_lime_integration") {
    auto lime_color = color_lime();
    REQUIRE(0 == red_of(lime_color));
    REQUIRE(255 == green_of(lime_color));
    REQUIRE(0 == blue_of(lime_color));
    REQUIRE(255 == alpha_of(lime_color));
}
TEST_CASE("color_lime_green_integration") {
    auto lime_green_color = color_lime_green();
    REQUIRE(50 == red_of(lime_green_color));
    REQUIRE(205 == green_of(lime_green_color));
    REQUIRE(50 == blue_of(lime_green_color));
    REQUIRE(255 == alpha_of(lime_green_color));
}
TEST_CASE("color_linen_integration") {
    auto linen_color = color_linen();
    REQUIRE(250 == red_of(linen_color));
    REQUIRE(240 == green_of(linen_color));
    REQUIRE(230 == blue_of(linen_color));
    REQUIRE(255 == alpha_of(linen_color));
}
TEST_CASE("color_magenta_integration") {
    auto magenta_color = color_magenta();
    REQUIRE(255 == red_of(magenta_color));
    REQUIRE(0 == green_of(magenta_color));
    REQUIRE(255 == blue_of(magenta_color));
    REQUIRE(255 == alpha_of(magenta_color));
}
TEST_CASE("color_maroon_integration") {
    auto maroon_color = color_maroon();
    REQUIRE(127 == red_of(maroon_color));
    REQUIRE(0 == green_of(maroon_color));
    REQUIRE(0 == blue_of(maroon_color));
    REQUIRE(255 == alpha_of(maroon_color));
}
TEST_CASE("color_medium_aquamarine_integration") {
    auto medium_aquamarine_color = color_medium_aquamarine();
    REQUIRE(102 == red_of(medium_aquamarine_color));
    REQUIRE(205 == green_of(medium_aquamarine_color));
    REQUIRE(170 == blue_of(medium_aquamarine_color));
    REQUIRE(255 == alpha_of(medium_aquamarine_color));
}
TEST_CASE("color_medium_blue_integration") {
    auto medium_blue_color = color_medium_blue();
    REQUIRE(0 == red_of(medium_blue_color));
    REQUIRE(0 == green_of(medium_blue_color));
    REQUIRE(205 == blue_of(medium_blue_color));
    REQUIRE(255 == alpha_of(medium_blue_color));
}
TEST_CASE("color_medium_orchid_integration") {
    auto medium_orchid_color = color_medium_orchid();
    REQUIRE(186 == red_of(medium_orchid_color));
    REQUIRE(85 == green_of(medium_orchid_color));
    REQUIRE(211 == blue_of(medium_orchid_color));
    REQUIRE(255 == alpha_of(medium_orchid_color));
}
TEST_CASE("color_medium_purple_integration") {
    auto medium_purple_color = color_medium_purple();
    REQUIRE(147 == red_of(medium_purple_color));
    REQUIRE(112 == green_of(medium_purple_color));
    REQUIRE(219 == blue_of(medium_purple_color));
    REQUIRE(255 == alpha_of(medium_purple_color));
}
TEST_CASE("color_medium_sea_green_integration") {
    auto medium_sea_green_color = color_medium_sea_green();
    REQUIRE(60 == red_of(medium_sea_green_color));
    REQUIRE(179 == green_of(medium_sea_green_color));
    REQUIRE(113 == blue_of(medium_sea_green_color));
    REQUIRE(255 == alpha_of(medium_sea_green_color));
}
TEST_CASE("color_medium_slate_blue_integration") {
    auto medium_slate_blue_color = color_medium_slate_blue();
    REQUIRE(123 == red_of(medium_slate_blue_color));
    REQUIRE(104 == green_of(medium_slate_blue_color));
    REQUIRE(238 == blue_of(medium_slate_blue_color));
    REQUIRE(255 == alpha_of(medium_slate_blue_color));
}
TEST_CASE("color_medium_spring_green_integration") {
    auto medium_spring_green_color = color_medium_spring_green();
    REQUIRE(0 == red_of(medium_spring_green_color));
    REQUIRE(250 == green_of(medium_spring_green_color));
    REQUIRE(154 == blue_of(medium_spring_green_color));
    REQUIRE(255 == alpha_of(medium_spring_green_color));
}
TEST_CASE("color_medium_turquoise_integration") {
    auto medium_turquoise_color = color_medium_turquoise();
    REQUIRE(72 == red_of(medium_turquoise_color));
    REQUIRE(209 == green_of(medium_turquoise_color));
    REQUIRE(204 == blue_of(medium_turquoise_color));
    REQUIRE(255 == alpha_of(medium_turquoise_color));
}
TEST_CASE("color_medium_violet_red_integration") {
    auto medium_violet_red_color = color_medium_violet_red();
    REQUIRE(199 == red_of(medium_violet_red_color));
    REQUIRE(21 == green_of(medium_violet_red_color));
    REQUIRE(133 == blue_of(medium_violet_red_color));
    REQUIRE(255 == alpha_of(medium_violet_red_color));
}
TEST_CASE("color_midnight_blue_integration") {
    auto midnight_blue_color = color_midnight_blue();
    REQUIRE(25 == red_of(midnight_blue_color));
    REQUIRE(25 == green_of(midnight_blue_color));
    REQUIRE(112 == blue_of(midnight_blue_color));
    REQUIRE(255 == alpha_of(midnight_blue_color));
}
TEST_CASE("color_mint_cream_integration") {
    auto mint_cream_color = color_mint_cream();
    REQUIRE(245 == red_of(mint_cream_color));
    REQUIRE(255 == green_of(mint_cream_color));
    REQUIRE(250 == blue_of(mint_cream_color));
    REQUIRE(255 == alpha_of(mint_cream_color));
}
TEST_CASE("color_misty_rose_integration") {
    auto misty_rose_color = color_misty_rose();
    REQUIRE(255 == red_of(misty_rose_color));
    REQUIRE(228 == green_of(misty_rose_color));
    REQUIRE(225 == blue_of(misty_rose_color));
    REQUIRE(255 == alpha_of(misty_rose_color));
}
TEST_CASE("color_moccasin_integration") {
    auto moccasin_color = color_moccasin();
    REQUIRE(255 == red_of(moccasin_color));
    REQUIRE(228 == green_of(moccasin_color));
    REQUIRE(181 == blue_of(moccasin_color));
    REQUIRE(255 == alpha_of(moccasin_color));
}
TEST_CASE("color_navajo_white_integration") {
    auto navajo_white_color = color_navajo_white();
    REQUIRE(255 == red_of(navajo_white_color));
    REQUIRE(222 == green_of(navajo_white_color));
    REQUIRE(173 == blue_of(navajo_white_color));
    REQUIRE(255 == alpha_of(navajo_white_color));
}
TEST_CASE("color_navy_integration") {
    auto navy_color = color_navy();
    REQUIRE(0 == red_of(navy_color));
    REQUIRE(0 == green_of(navy_color));
    REQUIRE(127 == blue_of(navy_color));
    REQUIRE(255 == alpha_of(navy_color));
}
TEST_CASE("color_old_lace_integration") {
    auto old_lace_color = color_old_lace();
    REQUIRE(253 == red_of(old_lace_color));
    REQUIRE(245 == green_of(old_lace_color));
    REQUIRE(230 == blue_of(old_lace_color));
    REQUIRE(255 == alpha_of(old_lace_color));
}
TEST_CASE("color_olive_integration") {
    auto olive_color = color_olive();
    REQUIRE(127 == red_of(olive_color));
    REQUIRE(127 == green_of(olive_color));
    REQUIRE(0 == blue_of(olive_color));
    REQUIRE(255 == alpha_of(olive_color));
}
TEST_CASE("color_olive_drab_integration") {
    auto olive_drab_color = color_olive_drab();
    REQUIRE(107 == red_of(olive_drab_color));
    REQUIRE(142 == green_of(olive_drab_color));
    REQUIRE(35 == blue_of(olive_drab_color));
    REQUIRE(255 == alpha_of(olive_drab_color));
}
TEST_CASE("color_orange_integration") {
    auto orange_color = color_orange();
    REQUIRE(255 == red_of(orange_color));
    REQUIRE(165 == green_of(orange_color));
    REQUIRE(0 == blue_of(orange_color));
    REQUIRE(255 == alpha_of(orange_color));
}
TEST_CASE("color_orange_red_integration") {
    auto orange_red_color = color_orange_red();
    REQUIRE(255 == red_of(orange_red_color));
    REQUIRE(69 == green_of(orange_red_color));
    REQUIRE(0 == blue_of(orange_red_color));
    REQUIRE(255 == alpha_of(orange_red_color));
}
TEST_CASE("color_orchid_integration") {
    auto orchid_color = color_orchid();
    REQUIRE(218 == red_of(orchid_color));
    REQUIRE(112 == green_of(orchid_color));
    REQUIRE(214 == blue_of(orchid_color));
    REQUIRE(255 == alpha_of(orchid_color));
}
TEST_CASE("color_pale_goldenrod_integration") {
    auto pale_goldenrod_color = color_pale_goldenrod();
    REQUIRE(238 == red_of(pale_goldenrod_color));
    REQUIRE(232 == green_of(pale_goldenrod_color));
    REQUIRE(170 == blue_of(pale_goldenrod_color));
    REQUIRE(255 == alpha_of(pale_goldenrod_color));
}
TEST_CASE("color_pale_green_integration") {
    auto pale_green_color = color_pale_green();
    REQUIRE(152 == red_of(pale_green_color));
    REQUIRE(251 == green_of(pale_green_color));
    REQUIRE(152 == blue_of(pale_green_color));
    REQUIRE(255 == alpha_of(pale_green_color));
}
TEST_CASE("color_pale_turquoise_integration") {
    auto pale_turquoise_color = color_pale_turquoise();
    REQUIRE(175 == red_of(pale_turquoise_color));
    REQUIRE(238 == green_of(pale_turquoise_color));
    REQUIRE(238 == blue_of(pale_turquoise_color));
    REQUIRE(255 == alpha_of(pale_turquoise_color));
}
TEST_CASE("color_pale_violet_red_integration") {
    auto pale_violet_red_color = color_pale_violet_red();
    REQUIRE(219 == red_of(pale_violet_red_color));
    REQUIRE(112 == green_of(pale_violet_red_color));
    REQUIRE(147 == blue_of(pale_violet_red_color));
    REQUIRE(255 == alpha_of(pale_violet_red_color));
}
TEST_CASE("color_papaya_whip_integration") {
    auto papaya_whip_color = color_papaya_whip();
    REQUIRE(255 == red_of(papaya_whip_color));
    REQUIRE(239 == green_of(papaya_whip_color));
    REQUIRE(213 == blue_of(papaya_whip_color));
    REQUIRE(255 == alpha_of(papaya_whip_color));
}
TEST_CASE("color_peach_puff_integration") {
    auto peach_puff_color = color_peach_puff();
    REQUIRE(255 == red_of(peach_puff_color));
    REQUIRE(218 == green_of(peach_puff_color));
    REQUIRE(185 == blue_of(peach_puff_color));
    REQUIRE(255 == alpha_of(peach_puff_color));
}
TEST_CASE("color_peru_integration") {
    auto peru_color = color_peru();
    REQUIRE(205 == red_of(peru_color));
    REQUIRE(133 == green_of(peru_color));
    REQUIRE(63 == blue_of(peru_color));
    REQUIRE(255 == alpha_of(peru_color));
}
TEST_CASE("color_pink_integration") {
    auto pink_color = color_pink();
    REQUIRE(255 == red_of(pink_color));
    REQUIRE(192 == green_of(pink_color));
    REQUIRE(203 == blue_of(pink_color));
    REQUIRE(255 == alpha_of(pink_color));
}
TEST_CASE("color_plum_integration") {
    auto plum_color = color_plum();
    REQUIRE(221 == red_of(plum_color));
    REQUIRE(160 == green_of(plum_color));
    REQUIRE(221 == blue_of(plum_color));
    REQUIRE(255 == alpha_of(plum_color));
}
TEST_CASE("color_powder_blue_integration") {
    auto powder_blue_color = color_powder_blue();
    REQUIRE(176 == red_of(powder_blue_color));
    REQUIRE(224 == green_of(powder_blue_color));
    REQUIRE(230 == blue_of(powder_blue_color));
    REQUIRE(255 == alpha_of(powder_blue_color));
}
TEST_CASE("color_purple_integration") {
    auto purple_color = color_purple();
    REQUIRE(127 == red_of(purple_color));
    REQUIRE(0 == green_of(purple_color));
    REQUIRE(127 == blue_of(purple_color));
    REQUIRE(255 == alpha_of(purple_color));
}
TEST_CASE("color_red_integration") {
    auto red_color = color_red();
    REQUIRE(255 == red_of(red_color));
    REQUIRE(0 == green_of(red_color));
    REQUIRE(0 == blue_of(red_color));
    REQUIRE(255 == alpha_of(red_color));
}
TEST_CASE("color_rosy_brown_integration") {
    auto rosy_brown_color = color_rosy_brown();
    REQUIRE(188 == red_of(rosy_brown_color));
    REQUIRE(143 == green_of(rosy_brown_color));
    REQUIRE(143 == blue_of(rosy_brown_color));
    REQUIRE(255 == alpha_of(rosy_brown_color));
}
TEST_CASE("color_royal_blue_integration") {
    auto royal_blue_color = color_royal_blue();
    REQUIRE(65 == red_of(royal_blue_color));
    REQUIRE(105 == green_of(royal_blue_color));
    REQUIRE(225 == blue_of(royal_blue_color));
    REQUIRE(255 == alpha_of(royal_blue_color));
}
TEST_CASE("color_saddle_brown_integration") {
    auto saddle_brown_color = color_saddle_brown();
    REQUIRE(139 == red_of(saddle_brown_color));
    REQUIRE(69 == green_of(saddle_brown_color));
    REQUIRE(19 == blue_of(saddle_brown_color));
    REQUIRE(255 == alpha_of(saddle_brown_color));
}
TEST_CASE("color_salmon_integration") {
    auto salmon_color = color_salmon();
    REQUIRE(250 == red_of(salmon_color));
    REQUIRE(127 == green_of(salmon_color));
    REQUIRE(114 == blue_of(salmon_color));
    REQUIRE(255 == alpha_of(salmon_color));
}
TEST_CASE("color_sandy_brown_integration") {
    auto sandy_brown_color = color_sandy_brown();
    REQUIRE(244 == red_of(sandy_brown_color));
    REQUIRE(164 == green_of(sandy_brown_color));
    REQUIRE(96 == blue_of(sandy_brown_color));
    REQUIRE(255 == alpha_of(sandy_brown_color));
}
TEST_CASE("color_sea_green_integration") {
    auto sea_green_color = color_sea_green();
    REQUIRE(46 == red_of(sea_green_color));
    REQUIRE(139 == green_of(sea_green_color));
    REQUIRE(87 == blue_of(sea_green_color));
    REQUIRE(255 == alpha_of(sea_green_color));
}
TEST_CASE("color_sea_shell_integration") {
    auto sea_shell_color = color_sea_shell();
    REQUIRE(255 == red_of(sea_shell_color));
    REQUIRE(245 == green_of(sea_shell_color));
    REQUIRE(238 == blue_of(sea_shell_color));
    REQUIRE(255 == alpha_of(sea_shell_color));
}
TEST_CASE("color_sienna_integration") {
    auto sienna_color = color_sienna();
    REQUIRE(160 == red_of(sienna_color));
    REQUIRE(82 == green_of(sienna_color));
    REQUIRE(45 == blue_of(sienna_color));
    REQUIRE(255 == alpha_of(sienna_color));
}
TEST_CASE("color_silver_integration") {
    auto silver_color = color_silver();
    REQUIRE(192 == red_of(silver_color));
    REQUIRE(192 == green_of(silver_color));
    REQUIRE(192 == blue_of(silver_color));
    REQUIRE(255 == alpha_of(silver_color));
}
TEST_CASE("color_sky_blue_integration") {
    auto sky_blue_color = color_sky_blue();
    REQUIRE(135 == red_of(sky_blue_color));
    REQUIRE(206 == green_of(sky_blue_color));
    REQUIRE(235 == blue_of(sky_blue_color));
    REQUIRE(255 == alpha_of(sky_blue_color));
}
TEST_CASE("color_slate_blue_integration") {
    auto slate_blue_color = color_slate_blue();
    REQUIRE(106 == red_of(slate_blue_color));
    REQUIRE(90 == green_of(slate_blue_color));
    REQUIRE(205 == blue_of(slate_blue_color));
    REQUIRE(255 == alpha_of(slate_blue_color));
}
TEST_CASE("color_slate_gray_integration") {
    auto slate_gray_color = color_slate_gray();
    REQUIRE(112 == red_of(slate_gray_color));
    REQUIRE(127 == green_of(slate_gray_color));
    REQUIRE(144 == blue_of(slate_gray_color));
    REQUIRE(255 == alpha_of(slate_gray_color));
}
TEST_CASE("color_snow_integration") {
    auto snow_color = color_snow();
    REQUIRE(255 == red_of(snow_color));
    REQUIRE(250 == green_of(snow_color));
    REQUIRE(250 == blue_of(snow_color));
    REQUIRE(255 == alpha_of(snow_color));
}
TEST_CASE("color_spring_green_integration") {
    auto spring_green_color = color_spring_green();
    REQUIRE(0 == red_of(spring_green_color));
    REQUIRE(255 == green_of(spring_green_color));
    REQUIRE(127 == blue_of(spring_green_color));
    REQUIRE(255 == alpha_of(spring_green_color));
}
TEST_CASE("color_steel_blue_integration") {
    auto steel_blue_color = color_steel_blue();
    REQUIRE(70 == red_of(steel_blue_color));
    REQUIRE(130 == green_of(steel_blue_color));
    REQUIRE(180 == blue_of(steel_blue_color));
    REQUIRE(255 == alpha_of(steel_blue_color));
}
TEST_CASE("color_swinburne_red_integration") {
    auto swinburne_red_color = color_swinburne_red();
    REQUIRE(237 == red_of(swinburne_red_color));
    REQUIRE(36 == green_of(swinburne_red_color));
    REQUIRE(25 == blue_of(swinburne_red_color));
    REQUIRE(255 == alpha_of(swinburne_red_color));
}
TEST_CASE("color_tan_integration") {
    auto tan_color = color_tan();
    REQUIRE(210 == red_of(tan_color));
    REQUIRE(180 == green_of(tan_color));
    REQUIRE(140 == blue_of(tan_color));
    REQUIRE(255 == alpha_of(tan_color));
}
TEST_CASE("color_teal_integration") {
    auto teal_color = color_teal();
    REQUIRE(0 == red_of(teal_color));
    REQUIRE(127 == green_of(teal_color));
    REQUIRE(127 == blue_of(teal_color));
    REQUIRE(255 == alpha_of(teal_color));
}
TEST_CASE("color_thistle_integration") {
    auto thistle_color = color_thistle();
    REQUIRE(216 == red_of(thistle_color));
    REQUIRE(191 == green_of(thistle_color));
    REQUIRE(216 == blue_of(thistle_color));
    REQUIRE(255 == alpha_of(thistle_color));
}
TEST_CASE("color_to_string_integration") {
    auto red_color = color_red();
    auto red_color_string = color_to_string(red_color);
    REQUIRE("#ff0000ff" == red_color_string);
    auto transparent_color = color_transparent();
    auto transparent_color_string = color_to_string(transparent_color);
    REQUIRE("#ffffffff" == transparent_color_string);
}
TEST_CASE("color_tomato_integration") {
    auto tomato_color = color_tomato();
    REQUIRE(255 == red_of(tomato_color));
    REQUIRE(99 == green_of(tomato_color));
    REQUIRE(71 == blue_of(tomato_color));
    REQUIRE(255 == alpha_of(tomato_color));
}
TEST_CASE("color_transparent_integration") {
    auto transparent_color = color_transparent();
    REQUIRE(255 == alpha_of(transparent_color));
    REQUIRE(255 == red_of(transparent_color));
    REQUIRE(255 == green_of(transparent_color));
    REQUIRE(255 == blue_of(transparent_color));
}
TEST_CASE("color_turquoise_integration") {
    auto turquoise_color = color_turquoise();
    REQUIRE(64 == red_of(turquoise_color));
    REQUIRE(224 == green_of(turquoise_color));
    REQUIRE(208 == blue_of(turquoise_color));
    REQUIRE(255 == alpha_of(turquoise_color));
}
TEST_CASE("color_violet_integration") {
    auto violet_color = color_violet();
    REQUIRE(238 == red_of(violet_color));
    REQUIRE(130 == green_of(violet_color));
    REQUIRE(238 == blue_of(violet_color));
    REQUIRE(255 == alpha_of(violet_color));
}
TEST_CASE("color_wheat_integration") {
    auto wheat_color = color_wheat();
    REQUIRE(245 == red_of(wheat_color));
    REQUIRE(222 == green_of(wheat_color));
    REQUIRE(179 == blue_of(wheat_color));
    REQUIRE(255 == alpha_of(wheat_color));
}
TEST_CASE("color_white_integration") {
    auto white_color = color_white();
    REQUIRE(255 == red_of(white_color));
    REQUIRE(255 == green_of(white_color));
    REQUIRE(255 == blue_of(white_color));
    REQUIRE(255 == alpha_of(white_color));
}
TEST_CASE("color_white_smoke_integration") {
    auto white_smoke_color = color_white_smoke();
    REQUIRE(245 == red_of(white_smoke_color));
    REQUIRE(245 == green_of(white_smoke_color));
    REQUIRE(245 == blue_of(white_smoke_color));
    REQUIRE(255 == alpha_of(white_smoke_color));
}
TEST_CASE("color_yellow_integration") {
    auto yellow_color = color_yellow();
    REQUIRE(255 == red_of(yellow_color));
    REQUIRE(255 == green_of(yellow_color));
    REQUIRE(0 == blue_of(yellow_color));
    REQUIRE(255 == alpha_of(yellow_color));
}
TEST_CASE("color_yellow_green_integration") {
    auto yellow_green_color = color_yellow_green();
    REQUIRE(154 == red_of(yellow_green_color));
    REQUIRE(205 == green_of(yellow_green_color));
    REQUIRE(50 == blue_of(yellow_green_color));
    REQUIRE(255 == alpha_of(yellow_green_color));
}
TEST_CASE("green_of_integration") {
    auto green_color = color_green();
    auto green_value = green_of(green_color);
    REQUIRE(127 == green_value);
    auto black_color = color_black();
    auto black_green_value = green_of(black_color);
    REQUIRE(0 == black_green_value);
}
TEST_CASE("hsb_color_integration") {
    auto red_color = hsb_color(0.0, 1.0, 1.0);
    REQUIRE(0.0 == hue_of(red_color));
    REQUIRE(1.0 == saturation_of(red_color));
    REQUIRE(1.0 == brightness_of(red_color));
    auto gray_color = hsb_color(0.5, 0.0, 0.5);
    REQUIRE(0.0 == saturation_of(gray_color));
}
TEST_CASE("hue_of_integration") {
    auto red_color = color_red();
    auto hue_value = hue_of(red_color);
    REQUIRE(0.0 == hue_value);
    auto blue_color = color_blue();
    auto hue_value_blue = hue_of(blue_color);
    REQUIRE(0.6666666666666666 == hue_value_blue);
}
TEST_CASE("random_color_integration") {
    auto random_color_result = random_color();
    REQUIRE("#000000FF" != color_to_string(random_color_result));
    REQUIRE(alpha_of(random_color_result) >= 0 && alpha_of(random_color_result) <= 255);
}
TEST_CASE("random_rgb_color_integration") {
    auto random_color = random_rgb_color(255);
    REQUIRE(red_of(random_color) >= 0 && red_of(random_color) <= 255);
    REQUIRE(green_of(random_color) >= 0 && green_of(random_color) <= 255);
    REQUIRE(blue_of(random_color) >= 0 && blue_of(random_color) <= 255);
    REQUIRE(255 == alpha_of(random_color));
}
TEST_CASE("red_of_integration") {
    auto red_color = color_red();
    auto red_value = red_of(red_color);
    REQUIRE(255 == red_value);
    auto blue_color = color_blue();
    auto blue_red_value = red_of(blue_color);
    REQUIRE(0 == blue_red_value);
}
TEST_CASE("rgb_color_from_double_integration") {
    auto red_color = rgb_color(1.0, 0.0, 0.0);
    REQUIRE(255 == red_of(red_color));
    REQUIRE(0 == green_of(red_color));
    REQUIRE(0 == blue_of(red_color));
    auto green_color = rgb_color(0.0, 1.0, 0.0);
    REQUIRE(0 == red_of(green_color));
    REQUIRE(255 == green_of(green_color));
    REQUIRE(0 == blue_of(green_color));
}
TEST_CASE("rgb_color_integration") {
    auto red_color = rgb_color(255, 0, 0);
    REQUIRE(255 == red_of(red_color));
    REQUIRE(0 == green_of(red_color));
    REQUIRE(0 == blue_of(red_color));
    REQUIRE(255 == alpha_of(red_color));
}
TEST_CASE("rgba_color_from_double_integration") {
    auto test_color = rgba_color(1.0, 0.5, 0.0, 0.75);
    REQUIRE(255 == red_of(test_color));
    REQUIRE(127 == green_of(test_color));
    REQUIRE(0 == blue_of(test_color));
    REQUIRE(191 == alpha_of(test_color));
}
TEST_CASE("rgba_color_integration") {
    auto red_color = rgba_color(255, 0, 0, 255);
    REQUIRE(255 == red_of(red_color));
    REQUIRE(0 == green_of(red_color));
    REQUIRE(0 == blue_of(red_color));
    REQUIRE(255 == alpha_of(red_color));
}
TEST_CASE("saturation_of_integration") {
    auto red_color = color_red();
    auto saturation_value = saturation_of(red_color);
    REQUIRE(1.0 == saturation_value);
    auto gray_color = color_gray();
    auto saturation_value_gray = saturation_of(gray_color);
    REQUIRE(0.0 == saturation_value_gray);
}
TEST_CASE("string_to_color_integration") {
    auto red_color = string_to_color("#FF0000FF");
    REQUIRE(255 == red_of(red_color));
    REQUIRE(0 == green_of(red_color));
    REQUIRE(0 == blue_of(red_color));
    REQUIRE(255 == alpha_of(red_color));
    auto green_color = string_to_color("#00FF00FF");
    REQUIRE(0 == red_of(green_color));
    REQUIRE(255 == green_of(green_color));
    REQUIRE(0 == blue_of(green_color));
    REQUIRE(255 == alpha_of(green_color));
}
