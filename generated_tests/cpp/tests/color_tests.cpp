#include "splashkit.h"
#include <catch2/catch.hpp>

TEST_CASE("alpha_of_integration") {
    auto red_color = color_red();
    auto alpha_value = alpha_of(red_color);
    REQUIRE(alpha_value == 255);
    auto transparent_color = color_transparent();
    auto alpha_value_transparent = alpha_of(transparent_color);
    REQUIRE(alpha_value_transparent == 255);
}
TEST_CASE("blue_of_integration") {
    auto blue_color = color_blue();
    auto blue_value = blue_of(blue_color);
    REQUIRE(blue_value == 255);
    auto red_color = color_red();
    auto blue_value_red = blue_of(red_color);
    REQUIRE(blue_value_red == 0);
}
TEST_CASE("brightness_of_integration") {
    auto white_color = color_white();
    auto white_brightness = brightness_of(white_color);
    REQUIRE(white_brightness == 1.0);
    auto black_color = color_black();
    auto black_brightness = brightness_of(black_color);
    REQUIRE(black_brightness == 0.0);
    auto gray_color = color_gray();
    auto gray_brightness = brightness_of(gray_color);
    REQUIRE(gray_brightness >= 0.4 && gray_brightness <= 0.6);
}
TEST_CASE("color_alice_blue_integration") {
    auto alice_blue_color = color_alice_blue();
    REQUIRE(red_of(alice_blue_color) == 240);
    REQUIRE(green_of(alice_blue_color) == 248);
    REQUIRE(blue_of(alice_blue_color) == 255);
    REQUIRE(alpha_of(alice_blue_color) == 255);
}
TEST_CASE("color_antique_white_integration") {
    auto antique_white_color = color_antique_white();
    REQUIRE(red_of(antique_white_color) == 250);
    REQUIRE(green_of(antique_white_color) == 235);
    REQUIRE(blue_of(antique_white_color) == 215);
    REQUIRE(alpha_of(antique_white_color) == 255);
}
TEST_CASE("color_aqua_integration") {
    auto aqua_color = color_aqua();
    REQUIRE(red_of(aqua_color) == 0);
    REQUIRE(green_of(aqua_color) == 255);
    REQUIRE(blue_of(aqua_color) == 255);
    REQUIRE(alpha_of(aqua_color) == 255);
}
TEST_CASE("color_aquamarine_integration") {
    auto aquamarine_color = color_aquamarine();
    REQUIRE(red_of(aquamarine_color) == 127);
    REQUIRE(green_of(aquamarine_color) == 255);
    REQUIRE(blue_of(aquamarine_color) == 212);
    REQUIRE(alpha_of(aquamarine_color) == 255);
}
TEST_CASE("color_azure_integration") {
    auto azure_color = color_azure();
    REQUIRE(red_of(azure_color) == 240);
    REQUIRE(green_of(azure_color) == 255);
    REQUIRE(blue_of(azure_color) == 255);
    REQUIRE(alpha_of(azure_color) == 255);
}
TEST_CASE("color_beige_integration") {
    auto beige_color = color_beige();
    REQUIRE(red_of(beige_color) == 245);
    REQUIRE(green_of(beige_color) == 245);
    REQUIRE(blue_of(beige_color) == 220);
    REQUIRE(alpha_of(beige_color) == 255);
}
TEST_CASE("color_bisque_integration") {
    auto bisque_color = color_bisque();
    REQUIRE(red_of(bisque_color) == 255);
    REQUIRE(green_of(bisque_color) == 228);
    REQUIRE(blue_of(bisque_color) == 196);
    REQUIRE(alpha_of(bisque_color) == 255);
}
TEST_CASE("color_black_integration") {
    auto black_color = color_black();
    REQUIRE(red_of(black_color) == 0);
    REQUIRE(green_of(black_color) == 0);
    REQUIRE(blue_of(black_color) == 0);
    REQUIRE(alpha_of(black_color) == 255);
}
TEST_CASE("color_blanched_almond_integration") {
    auto blanched_almond_color = color_blanched_almond();
    REQUIRE(red_of(blanched_almond_color) == 255);
    REQUIRE(green_of(blanched_almond_color) == 235);
    REQUIRE(blue_of(blanched_almond_color) == 205);
    REQUIRE(alpha_of(blanched_almond_color) == 255);
}
TEST_CASE("color_blue_integration") {
    auto blue_color = color_blue();
    REQUIRE(red_of(blue_color) == 0);
    REQUIRE(green_of(blue_color) == 0);
    REQUIRE(blue_of(blue_color) == 255);
    REQUIRE(alpha_of(blue_color) == 255);
}
TEST_CASE("color_blue_violet_integration") {
    auto blue_violet_color = color_blue_violet();
    REQUIRE(red_of(blue_violet_color) == 138);
    REQUIRE(green_of(blue_violet_color) == 43);
    REQUIRE(blue_of(blue_violet_color) == 226);
    REQUIRE(alpha_of(blue_violet_color) == 255);
}
TEST_CASE("color_bright_green_integration") {
    auto bright_green_color = color_bright_green();
    REQUIRE(red_of(bright_green_color) == 0);
    REQUIRE(green_of(bright_green_color) == 255);
    REQUIRE(blue_of(bright_green_color) == 0);
    REQUIRE(alpha_of(bright_green_color) == 255);
}
TEST_CASE("color_brown_integration") {
    auto brown_color = color_brown();
    REQUIRE(red_of(brown_color) == 165);
    REQUIRE(green_of(brown_color) == 42);
    REQUIRE(blue_of(brown_color) == 42);
    REQUIRE(alpha_of(brown_color) == 255);
}
TEST_CASE("color_burly_wood_integration") {
    auto burly_wood_color = color_burly_wood();
    REQUIRE(red_of(burly_wood_color) == 222);
    REQUIRE(green_of(burly_wood_color) == 184);
    REQUIRE(blue_of(burly_wood_color) == 135);
    REQUIRE(alpha_of(burly_wood_color) == 255);
}
TEST_CASE("color_cadet_blue_integration") {
    auto cadet_blue_color = color_cadet_blue();
    REQUIRE(red_of(cadet_blue_color) == 95);
    REQUIRE(green_of(cadet_blue_color) == 158);
    REQUIRE(blue_of(cadet_blue_color) == 160);
    REQUIRE(alpha_of(cadet_blue_color) == 255);
}
TEST_CASE("color_chartreuse_integration") {
    auto chartreuse_color = color_chartreuse();
    REQUIRE(red_of(chartreuse_color) == 127);
    REQUIRE(green_of(chartreuse_color) == 255);
    REQUIRE(blue_of(chartreuse_color) == 0);
    REQUIRE(alpha_of(chartreuse_color) == 255);
}
TEST_CASE("color_chocolate_integration") {
    auto chocolate_color = color_chocolate();
    REQUIRE(red_of(chocolate_color) == 210);
    REQUIRE(green_of(chocolate_color) == 105);
    REQUIRE(blue_of(chocolate_color) == 30);
    REQUIRE(alpha_of(chocolate_color) == 255);
}
TEST_CASE("color_coral_integration") {
    auto coral_color = color_coral();
    REQUIRE(red_of(coral_color) == 255);
    REQUIRE(green_of(coral_color) == 127);
    REQUIRE(blue_of(coral_color) == 80);
    REQUIRE(alpha_of(coral_color) == 255);
}
TEST_CASE("color_cornflower_blue_integration") {
    auto cornflower_blue_color = color_cornflower_blue();
    REQUIRE(red_of(cornflower_blue_color) == 100);
    REQUIRE(green_of(cornflower_blue_color) == 149);
    REQUIRE(blue_of(cornflower_blue_color) == 237);
    REQUIRE(alpha_of(cornflower_blue_color) == 255);
}
TEST_CASE("color_cornsilk_integration") {
    auto cornsilk_color = color_cornsilk();
    REQUIRE(red_of(cornsilk_color) == 255);
    REQUIRE(green_of(cornsilk_color) == 248);
    REQUIRE(blue_of(cornsilk_color) == 220);
    REQUIRE(alpha_of(cornsilk_color) == 255);
}
TEST_CASE("color_crimson_integration") {
    auto crimson_color = color_crimson();
    REQUIRE(red_of(crimson_color) == 220);
    REQUIRE(green_of(crimson_color) == 20);
    REQUIRE(blue_of(crimson_color) == 60);
    REQUIRE(alpha_of(crimson_color) == 255);
}
TEST_CASE("color_cyan_integration") {
    auto cyan_color = color_cyan();
    REQUIRE(red_of(cyan_color) == 0);
    REQUIRE(green_of(cyan_color) == 255);
    REQUIRE(blue_of(cyan_color) == 255);
    REQUIRE(alpha_of(cyan_color) == 255);
}
TEST_CASE("color_dark_blue_integration") {
    auto dark_blue_color = color_dark_blue();
    REQUIRE(red_of(dark_blue_color) == 0);
    REQUIRE(green_of(dark_blue_color) == 0);
    REQUIRE(blue_of(dark_blue_color) == 139);
    REQUIRE(alpha_of(dark_blue_color) == 255);
}
TEST_CASE("color_dark_cyan_integration") {
    auto dark_cyan_color = color_dark_cyan();
    REQUIRE(red_of(dark_cyan_color) == 0);
    REQUIRE(green_of(dark_cyan_color) == 139);
    REQUIRE(blue_of(dark_cyan_color) == 139);
    REQUIRE(alpha_of(dark_cyan_color) == 255);
}
TEST_CASE("color_dark_goldenrod_integration") {
    auto dark_goldenrod_color = color_dark_goldenrod();
    REQUIRE(red_of(dark_goldenrod_color) == 184);
    REQUIRE(green_of(dark_goldenrod_color) == 134);
    REQUIRE(blue_of(dark_goldenrod_color) == 11);
    REQUIRE(alpha_of(dark_goldenrod_color) == 255);
}
TEST_CASE("color_dark_gray_integration") {
    auto dark_gray_color = color_dark_gray();
    REQUIRE(red_of(dark_gray_color) == 169);
    REQUIRE(green_of(dark_gray_color) == 169);
    REQUIRE(blue_of(dark_gray_color) == 169);
    REQUIRE(alpha_of(dark_gray_color) == 255);
}
TEST_CASE("color_dark_green_integration") {
    auto dark_green_color = color_dark_green();
    REQUIRE(red_of(dark_green_color) == 0);
    REQUIRE(green_of(dark_green_color) == 100);
    REQUIRE(blue_of(dark_green_color) == 0);
    REQUIRE(alpha_of(dark_green_color) == 255);
}
TEST_CASE("color_dark_khaki_integration") {
    auto dark_khaki_color = color_dark_khaki();
    REQUIRE(red_of(dark_khaki_color) == 189);
    REQUIRE(green_of(dark_khaki_color) == 183);
    REQUIRE(blue_of(dark_khaki_color) == 107);
    REQUIRE(alpha_of(dark_khaki_color) == 255);
}
TEST_CASE("color_dark_magenta_integration") {
    auto dark_magenta_color = color_dark_magenta();
    REQUIRE(red_of(dark_magenta_color) == 139);
    REQUIRE(green_of(dark_magenta_color) == 0);
    REQUIRE(blue_of(dark_magenta_color) == 139);
    REQUIRE(alpha_of(dark_magenta_color) == 255);
}
TEST_CASE("color_dark_olive_green_integration") {
    auto dark_olive_green_color = color_dark_olive_green();
    REQUIRE(red_of(dark_olive_green_color) == 85);
    REQUIRE(green_of(dark_olive_green_color) == 107);
    REQUIRE(blue_of(dark_olive_green_color) == 47);
    REQUIRE(alpha_of(dark_olive_green_color) == 255);
}
TEST_CASE("color_dark_orange_integration") {
    auto dark_orange_color = color_dark_orange();
    REQUIRE(red_of(dark_orange_color) == 255);
    REQUIRE(green_of(dark_orange_color) == 140);
    REQUIRE(blue_of(dark_orange_color) == 0);
    REQUIRE(alpha_of(dark_orange_color) == 255);
}
TEST_CASE("color_dark_orchid_integration") {
    auto dark_orchid_color = color_dark_orchid();
    REQUIRE(red_of(dark_orchid_color) == 153);
    REQUIRE(green_of(dark_orchid_color) == 50);
    REQUIRE(blue_of(dark_orchid_color) == 204);
    REQUIRE(alpha_of(dark_orchid_color) == 255);
}
TEST_CASE("color_dark_red_integration") {
    auto dark_red_color = color_dark_red();
    REQUIRE(red_of(dark_red_color) == 139);
    REQUIRE(green_of(dark_red_color) == 0);
    REQUIRE(blue_of(dark_red_color) == 0);
    REQUIRE(alpha_of(dark_red_color) == 255);
}
TEST_CASE("color_dark_salmon_integration") {
    auto dark_salmon_color = color_dark_salmon();
    REQUIRE(red_of(dark_salmon_color) == 233);
    REQUIRE(green_of(dark_salmon_color) == 150);
    REQUIRE(blue_of(dark_salmon_color) == 122);
    REQUIRE(alpha_of(dark_salmon_color) == 255);
}
TEST_CASE("color_dark_sea_green_integration") {
    auto dark_sea_green_color = color_dark_sea_green();
    REQUIRE(red_of(dark_sea_green_color) == 143);
    REQUIRE(green_of(dark_sea_green_color) == 188);
    REQUIRE(blue_of(dark_sea_green_color) == 139);
    REQUIRE(alpha_of(dark_sea_green_color) == 255);
}
TEST_CASE("color_dark_slate_blue_integration") {
    auto dark_slate_blue_color = color_dark_slate_blue();
    REQUIRE(red_of(dark_slate_blue_color) == 72);
    REQUIRE(green_of(dark_slate_blue_color) == 61);
    REQUIRE(blue_of(dark_slate_blue_color) == 139);
    REQUIRE(alpha_of(dark_slate_blue_color) == 255);
}
TEST_CASE("color_dark_slate_gray_integration") {
    auto dark_slate_gray_color = color_dark_slate_gray();
    REQUIRE(red_of(dark_slate_gray_color) == 47);
    REQUIRE(green_of(dark_slate_gray_color) == 79);
    REQUIRE(blue_of(dark_slate_gray_color) == 79);
    REQUIRE(alpha_of(dark_slate_gray_color) == 255);
}
TEST_CASE("color_dark_turquoise_integration") {
    auto dark_turquoise_color = color_dark_turquoise();
    REQUIRE(red_of(dark_turquoise_color) == 0);
    REQUIRE(green_of(dark_turquoise_color) == 206);
    REQUIRE(blue_of(dark_turquoise_color) == 209);
    REQUIRE(alpha_of(dark_turquoise_color) == 255);
}
TEST_CASE("color_dark_violet_integration") {
    auto dark_violet_color = color_dark_violet();
    REQUIRE(red_of(dark_violet_color) == 148);
    REQUIRE(green_of(dark_violet_color) == 0);
    REQUIRE(blue_of(dark_violet_color) == 211);
    REQUIRE(alpha_of(dark_violet_color) == 255);
}
TEST_CASE("color_deep_pink_integration") {
    auto deep_pink_color = color_deep_pink();
    REQUIRE(red_of(deep_pink_color) == 255);
    REQUIRE(green_of(deep_pink_color) == 20);
    REQUIRE(blue_of(deep_pink_color) == 147);
    REQUIRE(alpha_of(deep_pink_color) == 255);
}
TEST_CASE("color_deep_sky_blue_integration") {
    auto deep_sky_blue_color = color_deep_sky_blue();
    REQUIRE(red_of(deep_sky_blue_color) == 0);
    REQUIRE(green_of(deep_sky_blue_color) == 191);
    REQUIRE(blue_of(deep_sky_blue_color) == 255);
    REQUIRE(alpha_of(deep_sky_blue_color) == 255);
}
TEST_CASE("color_dim_gray_integration") {
    auto dim_gray_color = color_dim_gray();
    REQUIRE(red_of(dim_gray_color) == 105);
    REQUIRE(green_of(dim_gray_color) == 105);
    REQUIRE(blue_of(dim_gray_color) == 105);
    REQUIRE(alpha_of(dim_gray_color) == 255);
}
TEST_CASE("color_dodger_blue_integration") {
    auto dodger_blue_color = color_dodger_blue();
    REQUIRE(red_of(dodger_blue_color) == 30);
    REQUIRE(green_of(dodger_blue_color) == 144);
    REQUIRE(blue_of(dodger_blue_color) == 255);
    REQUIRE(alpha_of(dodger_blue_color) == 255);
}
TEST_CASE("color_firebrick_integration") {
    auto firebrick_color = color_firebrick();
    REQUIRE(red_of(firebrick_color) == 178);
    REQUIRE(green_of(firebrick_color) == 34);
    REQUIRE(blue_of(firebrick_color) == 34);
    REQUIRE(alpha_of(firebrick_color) == 255);
}
TEST_CASE("color_floral_white_integration") {
    auto floral_white_color = color_floral_white();
    REQUIRE(red_of(floral_white_color) == 255);
    REQUIRE(green_of(floral_white_color) == 250);
    REQUIRE(blue_of(floral_white_color) == 240);
    REQUIRE(alpha_of(floral_white_color) == 255);
}
TEST_CASE("color_forest_green_integration") {
    auto forest_green_color = color_forest_green();
    REQUIRE(red_of(forest_green_color) == 34);
    REQUIRE(green_of(forest_green_color) == 139);
    REQUIRE(blue_of(forest_green_color) == 34);
    REQUIRE(alpha_of(forest_green_color) == 255);
}
TEST_CASE("color_fuchsia_integration") {
    auto fuchsia_color = color_fuchsia();
    REQUIRE(red_of(fuchsia_color) == 255);
    REQUIRE(green_of(fuchsia_color) == 0);
    REQUIRE(blue_of(fuchsia_color) == 255);
    REQUIRE(alpha_of(fuchsia_color) == 255);
}
TEST_CASE("color_gainsboro_integration") {
    auto gainsboro_color = color_gainsboro();
    REQUIRE(red_of(gainsboro_color) == 220);
    REQUIRE(green_of(gainsboro_color) == 220);
    REQUIRE(blue_of(gainsboro_color) == 220);
    REQUIRE(alpha_of(gainsboro_color) == 255);
}
TEST_CASE("color_ghost_white_integration") {
    auto ghost_white_color = color_ghost_white();
    REQUIRE(red_of(ghost_white_color) == 248);
    REQUIRE(green_of(ghost_white_color) == 248);
    REQUIRE(blue_of(ghost_white_color) == 255);
    REQUIRE(alpha_of(ghost_white_color) == 255);
}
TEST_CASE("color_gold_integration") {
    auto gold_color = color_gold();
    REQUIRE(red_of(gold_color) == 255);
    REQUIRE(green_of(gold_color) == 215);
    REQUIRE(blue_of(gold_color) == 0);
    REQUIRE(alpha_of(gold_color) == 255);
}
TEST_CASE("color_goldenrod_integration") {
    auto goldenrod_color = color_goldenrod();
    REQUIRE(red_of(goldenrod_color) == 218);
    REQUIRE(green_of(goldenrod_color) == 165);
    REQUIRE(blue_of(goldenrod_color) == 32);
    REQUIRE(alpha_of(goldenrod_color) == 255);
}
TEST_CASE("color_gray_integration") {
    auto gray_color = color_gray();
    REQUIRE(red_of(gray_color) == 127);
    REQUIRE(green_of(gray_color) == 127);
    REQUIRE(blue_of(gray_color) == 127);
    REQUIRE(alpha_of(gray_color) == 255);
}
TEST_CASE("color_green_integration") {
    auto green_color = color_green();
    REQUIRE(red_of(green_color) == 0);
    REQUIRE(green_of(green_color) == 127);
    REQUIRE(blue_of(green_color) == 0);
    REQUIRE(alpha_of(green_color) == 255);
}
TEST_CASE("color_green_yellow_integration") {
    auto green_yellow_color = color_green_yellow();
    REQUIRE(red_of(green_yellow_color) == 173);
    REQUIRE(green_of(green_yellow_color) == 255);
    REQUIRE(blue_of(green_yellow_color) == 47);
    REQUIRE(alpha_of(green_yellow_color) == 255);
}
TEST_CASE("color_honeydew_integration") {
    auto honeydew_color = color_honeydew();
    REQUIRE(red_of(honeydew_color) == 240);
    REQUIRE(green_of(honeydew_color) == 255);
    REQUIRE(blue_of(honeydew_color) == 240);
    REQUIRE(alpha_of(honeydew_color) == 255);
}
TEST_CASE("color_hot_pink_integration") {
    auto hot_pink_color = color_hot_pink();
    REQUIRE(red_of(hot_pink_color) == 255);
    REQUIRE(green_of(hot_pink_color) == 105);
    REQUIRE(blue_of(hot_pink_color) == 180);
    REQUIRE(alpha_of(hot_pink_color) == 255);
}
TEST_CASE("color_indian_red_integration") {
    auto indian_red_color = color_indian_red();
    REQUIRE(red_of(indian_red_color) == 205);
    REQUIRE(green_of(indian_red_color) == 92);
    REQUIRE(blue_of(indian_red_color) == 92);
    REQUIRE(alpha_of(indian_red_color) == 255);
}
TEST_CASE("color_indigo_integration") {
    auto indigo_color = color_indigo();
    REQUIRE(red_of(indigo_color) == 75);
    REQUIRE(green_of(indigo_color) == 0);
    REQUIRE(blue_of(indigo_color) == 130);
    REQUIRE(alpha_of(indigo_color) == 255);
}
TEST_CASE("color_ivory_integration") {
    auto ivory_color = color_ivory();
    REQUIRE(red_of(ivory_color) == 255);
    REQUIRE(green_of(ivory_color) == 255);
    REQUIRE(blue_of(ivory_color) == 240);
    REQUIRE(alpha_of(ivory_color) == 255);
}
TEST_CASE("color_khaki_integration") {
    auto khaki_color = color_khaki();
    REQUIRE(red_of(khaki_color) == 240);
    REQUIRE(green_of(khaki_color) == 230);
    REQUIRE(blue_of(khaki_color) == 140);
    REQUIRE(alpha_of(khaki_color) == 255);
}
TEST_CASE("color_lavender_integration") {
    auto lavender_color = color_lavender();
    REQUIRE(red_of(lavender_color) == 230);
    REQUIRE(green_of(lavender_color) == 230);
    REQUIRE(blue_of(lavender_color) == 250);
    REQUIRE(alpha_of(lavender_color) == 255);
}
TEST_CASE("color_lavender_blush_integration") {
    auto lavender_blush_color = color_lavender_blush();
    REQUIRE(red_of(lavender_blush_color) == 255);
    REQUIRE(green_of(lavender_blush_color) == 240);
    REQUIRE(blue_of(lavender_blush_color) == 245);
    REQUIRE(alpha_of(lavender_blush_color) == 255);
}
TEST_CASE("color_lawn_green_integration") {
    auto lawn_green_color = color_lawn_green();
    REQUIRE(red_of(lawn_green_color) == 124);
    REQUIRE(green_of(lawn_green_color) == 252);
    REQUIRE(blue_of(lawn_green_color) == 0);
    REQUIRE(alpha_of(lawn_green_color) == 255);
}
TEST_CASE("color_lemon_chiffon_integration") {
    auto lemon_chiffon_color = color_lemon_chiffon();
    REQUIRE(red_of(lemon_chiffon_color) == 255);
    REQUIRE(green_of(lemon_chiffon_color) == 250);
    REQUIRE(blue_of(lemon_chiffon_color) == 205);
    REQUIRE(alpha_of(lemon_chiffon_color) == 255);
}
TEST_CASE("color_light_blue_integration") {
    auto light_blue_color = color_light_blue();
    REQUIRE(red_of(light_blue_color) == 173);
    REQUIRE(green_of(light_blue_color) == 216);
    REQUIRE(blue_of(light_blue_color) == 230);
    REQUIRE(alpha_of(light_blue_color) == 255);
}
TEST_CASE("color_light_coral_integration") {
    auto light_coral_color = color_light_coral();
    REQUIRE(red_of(light_coral_color) == 240);
    REQUIRE(green_of(light_coral_color) == 127);
    REQUIRE(blue_of(light_coral_color) == 127);
    REQUIRE(alpha_of(light_coral_color) == 255);
}
TEST_CASE("color_light_cyan_integration") {
    auto light_cyan_color = color_light_cyan();
    REQUIRE(red_of(light_cyan_color) == 224);
    REQUIRE(green_of(light_cyan_color) == 255);
    REQUIRE(blue_of(light_cyan_color) == 255);
    REQUIRE(alpha_of(light_cyan_color) == 255);
}
TEST_CASE("color_light_goldenrod_yellow_integration") {
    auto light_goldenrod_yellow_color = color_light_goldenrod_yellow();
    REQUIRE(red_of(light_goldenrod_yellow_color) == 250);
    REQUIRE(green_of(light_goldenrod_yellow_color) == 250);
    REQUIRE(blue_of(light_goldenrod_yellow_color) == 210);
    REQUIRE(alpha_of(light_goldenrod_yellow_color) == 255);
}
TEST_CASE("color_light_gray_integration") {
    auto light_gray_color = color_light_gray();
    REQUIRE(red_of(light_gray_color) == 211);
    REQUIRE(green_of(light_gray_color) == 211);
    REQUIRE(blue_of(light_gray_color) == 211);
    REQUIRE(alpha_of(light_gray_color) == 255);
}
TEST_CASE("color_light_green_integration") {
    auto light_green_color = color_light_green();
    REQUIRE(red_of(light_green_color) == 144);
    REQUIRE(green_of(light_green_color) == 238);
    REQUIRE(blue_of(light_green_color) == 144);
    REQUIRE(alpha_of(light_green_color) == 255);
}
TEST_CASE("color_light_pink_integration") {
    auto light_pink_color = color_light_pink();
    REQUIRE(red_of(light_pink_color) == 255);
    REQUIRE(green_of(light_pink_color) == 182);
    REQUIRE(blue_of(light_pink_color) == 193);
    REQUIRE(alpha_of(light_pink_color) == 255);
}
TEST_CASE("color_light_salmon_integration") {
    auto light_salmon_color = color_light_salmon();
    REQUIRE(red_of(light_salmon_color) == 255);
    REQUIRE(green_of(light_salmon_color) == 160);
    REQUIRE(blue_of(light_salmon_color) == 122);
    REQUIRE(alpha_of(light_salmon_color) == 255);
}
TEST_CASE("color_light_sea_green_integration") {
    auto light_sea_green_color = color_light_sea_green();
    REQUIRE(red_of(light_sea_green_color) == 32);
    REQUIRE(green_of(light_sea_green_color) == 178);
    REQUIRE(blue_of(light_sea_green_color) == 170);
    REQUIRE(alpha_of(light_sea_green_color) == 255);
}
TEST_CASE("color_light_sky_blue_integration") {
    auto light_sky_blue_color = color_light_sky_blue();
    REQUIRE(red_of(light_sky_blue_color) == 135);
    REQUIRE(green_of(light_sky_blue_color) == 206);
    REQUIRE(blue_of(light_sky_blue_color) == 250);
    REQUIRE(alpha_of(light_sky_blue_color) == 255);
}
TEST_CASE("color_light_slate_gray_integration") {
    auto light_slate_gray_color = color_light_slate_gray();
    REQUIRE(red_of(light_slate_gray_color) == 119);
    REQUIRE(green_of(light_slate_gray_color) == 136);
    REQUIRE(blue_of(light_slate_gray_color) == 153);
    REQUIRE(alpha_of(light_slate_gray_color) == 255);
}
TEST_CASE("color_light_steel_blue_integration") {
    auto light_steel_blue_color = color_light_steel_blue();
    REQUIRE(red_of(light_steel_blue_color) == 176);
    REQUIRE(green_of(light_steel_blue_color) == 196);
    REQUIRE(blue_of(light_steel_blue_color) == 222);
    REQUIRE(alpha_of(light_steel_blue_color) == 255);
}
TEST_CASE("color_light_yellow_integration") {
    auto light_yellow_color = color_light_yellow();
    REQUIRE(red_of(light_yellow_color) == 255);
    REQUIRE(green_of(light_yellow_color) == 255);
    REQUIRE(blue_of(light_yellow_color) == 224);
    REQUIRE(alpha_of(light_yellow_color) == 255);
}
TEST_CASE("color_lime_integration") {
    auto lime_color = color_lime();
    REQUIRE(red_of(lime_color) == 0);
    REQUIRE(green_of(lime_color) == 255);
    REQUIRE(blue_of(lime_color) == 0);
    REQUIRE(alpha_of(lime_color) == 255);
}
TEST_CASE("color_lime_green_integration") {
    auto lime_green_color = color_lime_green();
    REQUIRE(red_of(lime_green_color) == 50);
    REQUIRE(green_of(lime_green_color) == 205);
    REQUIRE(blue_of(lime_green_color) == 50);
    REQUIRE(alpha_of(lime_green_color) == 255);
}
TEST_CASE("color_linen_integration") {
    auto linen_color = color_linen();
    REQUIRE(red_of(linen_color) == 250);
    REQUIRE(green_of(linen_color) == 240);
    REQUIRE(blue_of(linen_color) == 230);
    REQUIRE(alpha_of(linen_color) == 255);
}
TEST_CASE("color_magenta_integration") {
    auto magenta_color = color_magenta();
    REQUIRE(red_of(magenta_color) == 255);
    REQUIRE(green_of(magenta_color) == 0);
    REQUIRE(blue_of(magenta_color) == 255);
    REQUIRE(alpha_of(magenta_color) == 255);
}
TEST_CASE("color_maroon_integration") {
    auto maroon_color = color_maroon();
    REQUIRE(red_of(maroon_color) == 127);
    REQUIRE(green_of(maroon_color) == 0);
    REQUIRE(blue_of(maroon_color) == 0);
    REQUIRE(alpha_of(maroon_color) == 255);
}
TEST_CASE("color_medium_aquamarine_integration") {
    auto medium_aquamarine_color = color_medium_aquamarine();
    REQUIRE(red_of(medium_aquamarine_color) == 102);
    REQUIRE(green_of(medium_aquamarine_color) == 205);
    REQUIRE(blue_of(medium_aquamarine_color) == 170);
    REQUIRE(alpha_of(medium_aquamarine_color) == 255);
}
TEST_CASE("color_medium_blue_integration") {
    auto medium_blue_color = color_medium_blue();
    REQUIRE(red_of(medium_blue_color) == 0);
    REQUIRE(green_of(medium_blue_color) == 0);
    REQUIRE(blue_of(medium_blue_color) == 205);
    REQUIRE(alpha_of(medium_blue_color) == 255);
}
TEST_CASE("color_medium_orchid_integration") {
    auto medium_orchid_color = color_medium_orchid();
    REQUIRE(red_of(medium_orchid_color) == 186);
    REQUIRE(green_of(medium_orchid_color) == 85);
    REQUIRE(blue_of(medium_orchid_color) == 211);
    REQUIRE(alpha_of(medium_orchid_color) == 255);
}
TEST_CASE("color_medium_purple_integration") {
    auto medium_purple_color = color_medium_purple();
    REQUIRE(red_of(medium_purple_color) == 147);
    REQUIRE(green_of(medium_purple_color) == 112);
    REQUIRE(blue_of(medium_purple_color) == 219);
    REQUIRE(alpha_of(medium_purple_color) == 255);
}
TEST_CASE("color_medium_sea_green_integration") {
    auto medium_sea_green_color = color_medium_sea_green();
    REQUIRE(red_of(medium_sea_green_color) == 60);
    REQUIRE(green_of(medium_sea_green_color) == 179);
    REQUIRE(blue_of(medium_sea_green_color) == 113);
    REQUIRE(alpha_of(medium_sea_green_color) == 255);
}
TEST_CASE("color_medium_slate_blue_integration") {
    auto medium_slate_blue_color = color_medium_slate_blue();
    REQUIRE(red_of(medium_slate_blue_color) == 123);
    REQUIRE(green_of(medium_slate_blue_color) == 104);
    REQUIRE(blue_of(medium_slate_blue_color) == 238);
    REQUIRE(alpha_of(medium_slate_blue_color) == 255);
}
TEST_CASE("color_medium_spring_green_integration") {
    auto medium_spring_green_color = color_medium_spring_green();
    REQUIRE(red_of(medium_spring_green_color) == 0);
    REQUIRE(green_of(medium_spring_green_color) == 250);
    REQUIRE(blue_of(medium_spring_green_color) == 154);
    REQUIRE(alpha_of(medium_spring_green_color) == 255);
}
TEST_CASE("color_medium_turquoise_integration") {
    auto medium_turquoise_color = color_medium_turquoise();
    REQUIRE(red_of(medium_turquoise_color) == 72);
    REQUIRE(green_of(medium_turquoise_color) == 209);
    REQUIRE(blue_of(medium_turquoise_color) == 204);
    REQUIRE(alpha_of(medium_turquoise_color) == 255);
}
TEST_CASE("color_medium_violet_red_integration") {
    auto medium_violet_red_color = color_medium_violet_red();
    REQUIRE(red_of(medium_violet_red_color) == 199);
    REQUIRE(green_of(medium_violet_red_color) == 21);
    REQUIRE(blue_of(medium_violet_red_color) == 133);
    REQUIRE(alpha_of(medium_violet_red_color) == 255);
}
TEST_CASE("color_midnight_blue_integration") {
    auto midnight_blue_color = color_midnight_blue();
    REQUIRE(red_of(midnight_blue_color) == 25);
    REQUIRE(green_of(midnight_blue_color) == 25);
    REQUIRE(blue_of(midnight_blue_color) == 112);
    REQUIRE(alpha_of(midnight_blue_color) == 255);
}
TEST_CASE("color_mint_cream_integration") {
    auto mint_cream_color = color_mint_cream();
    REQUIRE(red_of(mint_cream_color) == 245);
    REQUIRE(green_of(mint_cream_color) == 255);
    REQUIRE(blue_of(mint_cream_color) == 250);
    REQUIRE(alpha_of(mint_cream_color) == 255);
}
TEST_CASE("color_misty_rose_integration") {
    auto misty_rose_color = color_misty_rose();
    REQUIRE(red_of(misty_rose_color) == 255);
    REQUIRE(green_of(misty_rose_color) == 228);
    REQUIRE(blue_of(misty_rose_color) == 225);
    REQUIRE(alpha_of(misty_rose_color) == 255);
}
TEST_CASE("color_moccasin_integration") {
    auto moccasin_color = color_moccasin();
    REQUIRE(red_of(moccasin_color) == 255);
    REQUIRE(green_of(moccasin_color) == 228);
    REQUIRE(blue_of(moccasin_color) == 181);
    REQUIRE(alpha_of(moccasin_color) == 255);
}
TEST_CASE("color_navajo_white_integration") {
    auto navajo_white_color = color_navajo_white();
    REQUIRE(red_of(navajo_white_color) == 255);
    REQUIRE(green_of(navajo_white_color) == 222);
    REQUIRE(blue_of(navajo_white_color) == 173);
    REQUIRE(alpha_of(navajo_white_color) == 255);
}
TEST_CASE("color_navy_integration") {
    auto navy_color = color_navy();
    REQUIRE(red_of(navy_color) == 0);
    REQUIRE(green_of(navy_color) == 0);
    REQUIRE(blue_of(navy_color) == 127);
    REQUIRE(alpha_of(navy_color) == 255);
}
TEST_CASE("color_old_lace_integration") {
    auto old_lace_color = color_old_lace();
    REQUIRE(red_of(old_lace_color) == 253);
    REQUIRE(green_of(old_lace_color) == 245);
    REQUIRE(blue_of(old_lace_color) == 230);
    REQUIRE(alpha_of(old_lace_color) == 255);
}
TEST_CASE("color_olive_integration") {
    auto olive_color = color_olive();
    REQUIRE(red_of(olive_color) == 127);
    REQUIRE(green_of(olive_color) == 127);
    REQUIRE(blue_of(olive_color) == 0);
    REQUIRE(alpha_of(olive_color) == 255);
}
TEST_CASE("color_olive_drab_integration") {
    auto olive_drab_color = color_olive_drab();
    REQUIRE(red_of(olive_drab_color) == 107);
    REQUIRE(green_of(olive_drab_color) == 142);
    REQUIRE(blue_of(olive_drab_color) == 35);
    REQUIRE(alpha_of(olive_drab_color) == 255);
}
TEST_CASE("color_orange_integration") {
    auto orange_color = color_orange();
    REQUIRE(red_of(orange_color) == 255);
    REQUIRE(green_of(orange_color) == 165);
    REQUIRE(blue_of(orange_color) == 0);
    REQUIRE(alpha_of(orange_color) == 255);
}
TEST_CASE("color_orange_red_integration") {
    auto orange_red_color = color_orange_red();
    REQUIRE(red_of(orange_red_color) == 255);
    REQUIRE(green_of(orange_red_color) == 69);
    REQUIRE(blue_of(orange_red_color) == 0);
    REQUIRE(alpha_of(orange_red_color) == 255);
}
TEST_CASE("color_orchid_integration") {
    auto orchid_color = color_orchid();
    REQUIRE(red_of(orchid_color) == 218);
    REQUIRE(green_of(orchid_color) == 112);
    REQUIRE(blue_of(orchid_color) == 214);
    REQUIRE(alpha_of(orchid_color) == 255);
}
TEST_CASE("color_pale_goldenrod_integration") {
    auto pale_goldenrod_color = color_pale_goldenrod();
    REQUIRE(red_of(pale_goldenrod_color) == 238);
    REQUIRE(green_of(pale_goldenrod_color) == 232);
    REQUIRE(blue_of(pale_goldenrod_color) == 170);
    REQUIRE(alpha_of(pale_goldenrod_color) == 255);
}
TEST_CASE("color_pale_green_integration") {
    auto pale_green_color = color_pale_green();
    REQUIRE(red_of(pale_green_color) == 152);
    REQUIRE(green_of(pale_green_color) == 251);
    REQUIRE(blue_of(pale_green_color) == 152);
    REQUIRE(alpha_of(pale_green_color) == 255);
}
TEST_CASE("color_pale_turquoise_integration") {
    auto pale_turquoise_color = color_pale_turquoise();
    REQUIRE(red_of(pale_turquoise_color) == 175);
    REQUIRE(green_of(pale_turquoise_color) == 238);
    REQUIRE(blue_of(pale_turquoise_color) == 238);
    REQUIRE(alpha_of(pale_turquoise_color) == 255);
}
TEST_CASE("color_pale_violet_red_integration") {
    auto pale_violet_red_color = color_pale_violet_red();
    REQUIRE(red_of(pale_violet_red_color) == 219);
    REQUIRE(green_of(pale_violet_red_color) == 112);
    REQUIRE(blue_of(pale_violet_red_color) == 147);
    REQUIRE(alpha_of(pale_violet_red_color) == 255);
}
TEST_CASE("color_papaya_whip_integration") {
    auto papaya_whip_color = color_papaya_whip();
    REQUIRE(red_of(papaya_whip_color) == 255);
    REQUIRE(green_of(papaya_whip_color) == 239);
    REQUIRE(blue_of(papaya_whip_color) == 213);
    REQUIRE(alpha_of(papaya_whip_color) == 255);
}
TEST_CASE("color_peach_puff_integration") {
    auto peach_puff_color = color_peach_puff();
    REQUIRE(red_of(peach_puff_color) == 255);
    REQUIRE(green_of(peach_puff_color) == 218);
    REQUIRE(blue_of(peach_puff_color) == 185);
    REQUIRE(alpha_of(peach_puff_color) == 255);
}
TEST_CASE("color_peru_integration") {
    auto peru_color = color_peru();
    REQUIRE(red_of(peru_color) == 205);
    REQUIRE(green_of(peru_color) == 133);
    REQUIRE(blue_of(peru_color) == 63);
    REQUIRE(alpha_of(peru_color) == 255);
}
TEST_CASE("color_pink_integration") {
    auto pink_color = color_pink();
    REQUIRE(red_of(pink_color) == 255);
    REQUIRE(green_of(pink_color) == 192);
    REQUIRE(blue_of(pink_color) == 203);
    REQUIRE(alpha_of(pink_color) == 255);
}
TEST_CASE("color_plum_integration") {
    auto plum_color = color_plum();
    REQUIRE(red_of(plum_color) == 221);
    REQUIRE(green_of(plum_color) == 160);
    REQUIRE(blue_of(plum_color) == 221);
    REQUIRE(alpha_of(plum_color) == 255);
}
TEST_CASE("color_powder_blue_integration") {
    auto powder_blue_color = color_powder_blue();
    REQUIRE(red_of(powder_blue_color) == 176);
    REQUIRE(green_of(powder_blue_color) == 224);
    REQUIRE(blue_of(powder_blue_color) == 230);
    REQUIRE(alpha_of(powder_blue_color) == 255);
}
TEST_CASE("color_purple_integration") {
    auto purple_color = color_purple();
    REQUIRE(red_of(purple_color) == 127);
    REQUIRE(green_of(purple_color) == 0);
    REQUIRE(blue_of(purple_color) == 127);
    REQUIRE(alpha_of(purple_color) == 255);
}
TEST_CASE("color_red_integration") {
    auto red_color = color_red();
    REQUIRE(red_of(red_color) == 255);
    REQUIRE(green_of(red_color) == 0);
    REQUIRE(blue_of(red_color) == 0);
    REQUIRE(alpha_of(red_color) == 255);
}
TEST_CASE("color_rosy_brown_integration") {
    auto rosy_brown_color = color_rosy_brown();
    REQUIRE(red_of(rosy_brown_color) == 188);
    REQUIRE(green_of(rosy_brown_color) == 143);
    REQUIRE(blue_of(rosy_brown_color) == 143);
    REQUIRE(alpha_of(rosy_brown_color) == 255);
}
TEST_CASE("color_royal_blue_integration") {
    auto royal_blue_color = color_royal_blue();
    REQUIRE(red_of(royal_blue_color) == 65);
    REQUIRE(green_of(royal_blue_color) == 105);
    REQUIRE(blue_of(royal_blue_color) == 225);
    REQUIRE(alpha_of(royal_blue_color) == 255);
}
TEST_CASE("color_saddle_brown_integration") {
    auto saddle_brown_color = color_saddle_brown();
    REQUIRE(red_of(saddle_brown_color) == 139);
    REQUIRE(green_of(saddle_brown_color) == 69);
    REQUIRE(blue_of(saddle_brown_color) == 19);
    REQUIRE(alpha_of(saddle_brown_color) == 255);
}
TEST_CASE("color_salmon_integration") {
    auto salmon_color = color_salmon();
    REQUIRE(red_of(salmon_color) == 250);
    REQUIRE(green_of(salmon_color) == 127);
    REQUIRE(blue_of(salmon_color) == 114);
    REQUIRE(alpha_of(salmon_color) == 255);
}
TEST_CASE("color_sandy_brown_integration") {
    auto sandy_brown_color = color_sandy_brown();
    REQUIRE(red_of(sandy_brown_color) == 244);
    REQUIRE(green_of(sandy_brown_color) == 164);
    REQUIRE(blue_of(sandy_brown_color) == 96);
    REQUIRE(alpha_of(sandy_brown_color) == 255);
}
TEST_CASE("color_sea_green_integration") {
    auto sea_green_color = color_sea_green();
    REQUIRE(red_of(sea_green_color) == 46);
    REQUIRE(green_of(sea_green_color) == 139);
    REQUIRE(blue_of(sea_green_color) == 87);
    REQUIRE(alpha_of(sea_green_color) == 255);
}
TEST_CASE("color_sea_shell_integration") {
    auto sea_shell_color = color_sea_shell();
    REQUIRE(red_of(sea_shell_color) == 255);
    REQUIRE(green_of(sea_shell_color) == 245);
    REQUIRE(blue_of(sea_shell_color) == 238);
    REQUIRE(alpha_of(sea_shell_color) == 255);
}
TEST_CASE("color_sienna_integration") {
    auto sienna_color = color_sienna();
    REQUIRE(red_of(sienna_color) == 160);
    REQUIRE(green_of(sienna_color) == 82);
    REQUIRE(blue_of(sienna_color) == 45);
    REQUIRE(alpha_of(sienna_color) == 255);
}
TEST_CASE("color_silver_integration") {
    auto silver_color = color_silver();
    REQUIRE(red_of(silver_color) == 192);
    REQUIRE(green_of(silver_color) == 192);
    REQUIRE(blue_of(silver_color) == 192);
    REQUIRE(alpha_of(silver_color) == 255);
}
TEST_CASE("color_sky_blue_integration") {
    auto sky_blue_color = color_sky_blue();
    REQUIRE(red_of(sky_blue_color) == 135);
    REQUIRE(green_of(sky_blue_color) == 206);
    REQUIRE(blue_of(sky_blue_color) == 235);
    REQUIRE(alpha_of(sky_blue_color) == 255);
}
TEST_CASE("color_slate_blue_integration") {
    auto slate_blue_color = color_slate_blue();
    REQUIRE(red_of(slate_blue_color) == 106);
    REQUIRE(green_of(slate_blue_color) == 90);
    REQUIRE(blue_of(slate_blue_color) == 205);
    REQUIRE(alpha_of(slate_blue_color) == 255);
}
TEST_CASE("color_slate_gray_integration") {
    auto slate_gray_color = color_slate_gray();
    REQUIRE(red_of(slate_gray_color) == 112);
    REQUIRE(green_of(slate_gray_color) == 127);
    REQUIRE(blue_of(slate_gray_color) == 144);
    REQUIRE(alpha_of(slate_gray_color) == 255);
}
TEST_CASE("color_snow_integration") {
    auto snow_color = color_snow();
    REQUIRE(red_of(snow_color) == 255);
    REQUIRE(green_of(snow_color) == 250);
    REQUIRE(blue_of(snow_color) == 250);
    REQUIRE(alpha_of(snow_color) == 255);
}
TEST_CASE("color_spring_green_integration") {
    auto spring_green_color = color_spring_green();
    REQUIRE(red_of(spring_green_color) == 0);
    REQUIRE(green_of(spring_green_color) == 255);
    REQUIRE(blue_of(spring_green_color) == 127);
    REQUIRE(alpha_of(spring_green_color) == 255);
}
TEST_CASE("color_steel_blue_integration") {
    auto steel_blue_color = color_steel_blue();
    REQUIRE(red_of(steel_blue_color) == 70);
    REQUIRE(green_of(steel_blue_color) == 130);
    REQUIRE(blue_of(steel_blue_color) == 180);
    REQUIRE(alpha_of(steel_blue_color) == 255);
}
TEST_CASE("color_swinburne_red_integration") {
    auto swinburne_red_color = color_swinburne_red();
    REQUIRE(red_of(swinburne_red_color) == 237);
    REQUIRE(green_of(swinburne_red_color) == 36);
    REQUIRE(blue_of(swinburne_red_color) == 25);
    REQUIRE(alpha_of(swinburne_red_color) == 255);
}
TEST_CASE("color_tan_integration") {
    auto tan_color = color_tan();
    REQUIRE(red_of(tan_color) == 210);
    REQUIRE(green_of(tan_color) == 180);
    REQUIRE(blue_of(tan_color) == 140);
    REQUIRE(alpha_of(tan_color) == 255);
}
TEST_CASE("color_teal_integration") {
    auto teal_color = color_teal();
    REQUIRE(red_of(teal_color) == 0);
    REQUIRE(green_of(teal_color) == 127);
    REQUIRE(blue_of(teal_color) == 127);
    REQUIRE(alpha_of(teal_color) == 255);
}
TEST_CASE("color_thistle_integration") {
    auto thistle_color = color_thistle();
    REQUIRE(red_of(thistle_color) == 216);
    REQUIRE(green_of(thistle_color) == 191);
    REQUIRE(blue_of(thistle_color) == 216);
    REQUIRE(alpha_of(thistle_color) == 255);
}
TEST_CASE("color_to_string_integration") {
    auto red_color = color_red();
    auto red_color_string = color_to_string(red_color);
    REQUIRE(red_color_string == "#ff0000ff");
    auto transparent_color = color_transparent();
    auto transparent_color_string = color_to_string(transparent_color);
    REQUIRE(transparent_color_string == "#ffffffff");
}
TEST_CASE("color_tomato_integration") {
    auto tomato_color = color_tomato();
    REQUIRE(red_of(tomato_color) == 255);
    REQUIRE(green_of(tomato_color) == 99);
    REQUIRE(blue_of(tomato_color) == 71);
    REQUIRE(alpha_of(tomato_color) == 255);
}
TEST_CASE("color_transparent_integration") {
    auto transparent_color = color_transparent();
    REQUIRE(alpha_of(transparent_color) == 255);
    REQUIRE(red_of(transparent_color) == 255);
    REQUIRE(green_of(transparent_color) == 255);
    REQUIRE(blue_of(transparent_color) == 255);
}
TEST_CASE("color_turquoise_integration") {
    auto turquoise_color = color_turquoise();
    REQUIRE(red_of(turquoise_color) == 64);
    REQUIRE(green_of(turquoise_color) == 224);
    REQUIRE(blue_of(turquoise_color) == 208);
    REQUIRE(alpha_of(turquoise_color) == 255);
}
TEST_CASE("color_violet_integration") {
    auto violet_color = color_violet();
    REQUIRE(red_of(violet_color) == 238);
    REQUIRE(green_of(violet_color) == 130);
    REQUIRE(blue_of(violet_color) == 238);
    REQUIRE(alpha_of(violet_color) == 255);
}
TEST_CASE("color_wheat_integration") {
    auto wheat_color = color_wheat();
    REQUIRE(red_of(wheat_color) == 245);
    REQUIRE(green_of(wheat_color) == 222);
    REQUIRE(blue_of(wheat_color) == 179);
    REQUIRE(alpha_of(wheat_color) == 255);
}
TEST_CASE("color_white_integration") {
    auto white_color = color_white();
    REQUIRE(red_of(white_color) == 255);
    REQUIRE(green_of(white_color) == 255);
    REQUIRE(blue_of(white_color) == 255);
    REQUIRE(alpha_of(white_color) == 255);
}
TEST_CASE("color_white_smoke_integration") {
    auto white_smoke_color = color_white_smoke();
    REQUIRE(red_of(white_smoke_color) == 245);
    REQUIRE(green_of(white_smoke_color) == 245);
    REQUIRE(blue_of(white_smoke_color) == 245);
    REQUIRE(alpha_of(white_smoke_color) == 255);
}
TEST_CASE("color_yellow_integration") {
    auto yellow_color = color_yellow();
    REQUIRE(red_of(yellow_color) == 255);
    REQUIRE(green_of(yellow_color) == 255);
    REQUIRE(blue_of(yellow_color) == 0);
    REQUIRE(alpha_of(yellow_color) == 255);
}
TEST_CASE("color_yellow_green_integration") {
    auto yellow_green_color = color_yellow_green();
    REQUIRE(red_of(yellow_green_color) == 154);
    REQUIRE(green_of(yellow_green_color) == 205);
    REQUIRE(blue_of(yellow_green_color) == 50);
    REQUIRE(alpha_of(yellow_green_color) == 255);
}
TEST_CASE("green_of_integration") {
    auto green_color = color_green();
    auto green_value = green_of(green_color);
    REQUIRE(green_value == 127);
    auto black_color = color_black();
    auto black_green_value = green_of(black_color);
    REQUIRE(black_green_value == 0);
}
TEST_CASE("hsb_color_integration") {
    auto red_color = hsb_color(0.0, 1.0, 1.0);
    REQUIRE(hue_of(red_color) == 0.0);
    REQUIRE(saturation_of(red_color) == 1.0);
    REQUIRE(brightness_of(red_color) == 1.0);
    auto gray_color = hsb_color(0.5, 0.0, 0.5);
    REQUIRE(saturation_of(gray_color) == 0.0);
}
TEST_CASE("hue_of_integration") {
    auto red_color = color_red();
    auto hue_value = hue_of(red_color);
    REQUIRE(hue_value == 0.0);
    auto blue_color = color_blue();
    auto hue_value_blue = hue_of(blue_color);
    REQUIRE(hue_value_blue == 0.6666666666666666);
}
TEST_CASE("random_color_integration") {
    auto random_color_result = random_color();
    REQUIRE(color_to_string(random_color_result) != "#000000FF");
    REQUIRE(alpha_of(random_color_result) >= 0 && alpha_of(random_color_result) <= 255);
}
TEST_CASE("random_rgb_color_integration") {
    auto random_color = random_rgb_color(255);
    REQUIRE(red_of(random_color) >= 0 && red_of(random_color) <= 255);
    REQUIRE(green_of(random_color) >= 0 && green_of(random_color) <= 255);
    REQUIRE(blue_of(random_color) >= 0 && blue_of(random_color) <= 255);
    REQUIRE(alpha_of(random_color) == 255);
}
TEST_CASE("red_of_integration") {
    auto red_color = color_red();
    auto red_value = red_of(red_color);
    REQUIRE(red_value == 255);
    auto blue_color = color_blue();
    auto blue_red_value = red_of(blue_color);
    REQUIRE(blue_red_value == 0);
}
TEST_CASE("rgb_color_from_double_integration") {
    auto red_color = rgb_color(1.0, 0.0, 0.0);
    REQUIRE(red_of(red_color) == 255);
    REQUIRE(green_of(red_color) == 0);
    REQUIRE(blue_of(red_color) == 0);
    auto green_color = rgb_color(0.0, 1.0, 0.0);
    REQUIRE(red_of(green_color) == 0);
    REQUIRE(green_of(green_color) == 255);
    REQUIRE(blue_of(green_color) == 0);
}
TEST_CASE("rgb_color_integration") {
    auto red_color = rgb_color(255, 0, 0);
    REQUIRE(red_of(red_color) == 255);
    REQUIRE(green_of(red_color) == 0);
    REQUIRE(blue_of(red_color) == 0);
    REQUIRE(alpha_of(red_color) == 255);
}
TEST_CASE("rgba_color_from_double_integration") {
    auto test_color = rgba_color(1.0, 0.5, 0.0, 0.75);
    REQUIRE(red_of(test_color) == 255);
    REQUIRE(green_of(test_color) == 127);
    REQUIRE(blue_of(test_color) == 0);
    REQUIRE(alpha_of(test_color) == 191);
}
TEST_CASE("rgba_color_integration") {
    auto red_color = rgba_color(255, 0, 0, 255);
    REQUIRE(red_of(red_color) == 255);
    REQUIRE(green_of(red_color) == 0);
    REQUIRE(blue_of(red_color) == 0);
    REQUIRE(alpha_of(red_color) == 255);
}
TEST_CASE("saturation_of_integration") {
    auto red_color = color_red();
    auto saturation_value = saturation_of(red_color);
    REQUIRE(saturation_value == 1.0);
    auto gray_color = color_gray();
    auto saturation_value_gray = saturation_of(gray_color);
    REQUIRE(saturation_value_gray == 0.0);
}
TEST_CASE("string_to_color_integration") {
    auto red_color = string_to_color("#FF0000FF");
    REQUIRE(red_of(red_color) == 255);
    REQUIRE(green_of(red_color) == 0);
    REQUIRE(blue_of(red_color) == 0);
    REQUIRE(alpha_of(red_color) == 255);
    auto green_color = string_to_color("#00FF00FF");
    REQUIRE(red_of(green_color) == 0);
    REQUIRE(green_of(green_color) == 255);
    REQUIRE(blue_of(green_color) == 0);
    REQUIRE(alpha_of(green_color) == 255);
}
