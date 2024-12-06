use splashkit::*;
#[cfg(test)]
mod test_runner {
    pub fn run_tests_sequential(tests: &[&dyn Fn()]) {
        for test in tests {
            test();
        }
    }
}
#![test_runner(test_runner::run_tests_sequential)]
#[test]
fn test_alpha_of_integration() {
    let red_color = color_red();
    let alpha_value = alpha_of(red_color);
    assert_eq!(alpha_value, 255);
    let transparent_color = color_transparent();
    let alpha_value_transparent = alpha_of(transparent_color);
    assert_eq!(alpha_value_transparent, 255);
}
#[test]
fn test_blue_of_integration() {
    let blue_color = color_blue();
    let blue_value = blue_of(blue_color);
    assert_eq!(blue_value, 255);
    let red_color = color_red();
    let blue_value_red = blue_of(red_color);
    assert_eq!(blue_value_red, 0);
}
#[test]
fn test_brightness_of_integration() {
    let white_color = color_white();
    let white_brightness = brightness_of(white_color);
    assert_eq!(white_brightness, 1.0);
    let black_color = color_black();
    let black_brightness = brightness_of(black_color);
    assert_eq!(black_brightness, 0.0);
    let gray_color = color_gray();
    let gray_brightness = brightness_of(gray_color);
    assert!((0.4..=0.6).contains(&gray_brightness));
}
#[test]
fn test_color_alice_blue_integration() {
    let alice_blue_color = color_alice_blue();
    assert_eq!(red_of(alice_blue_color), 240);
    assert_eq!(green_of(alice_blue_color), 248);
    assert_eq!(blue_of(alice_blue_color), 255);
    assert_eq!(alpha_of(alice_blue_color), 255);
}
#[test]
fn test_color_antique_white_integration() {
    let antique_white_color = color_antique_white();
    assert_eq!(red_of(antique_white_color), 250);
    assert_eq!(green_of(antique_white_color), 235);
    assert_eq!(blue_of(antique_white_color), 215);
    assert_eq!(alpha_of(antique_white_color), 255);
}
#[test]
fn test_color_aqua_integration() {
    let aqua_color = color_aqua();
    assert_eq!(red_of(aqua_color), 0);
    assert_eq!(green_of(aqua_color), 255);
    assert_eq!(blue_of(aqua_color), 255);
    assert_eq!(alpha_of(aqua_color), 255);
}
#[test]
fn test_color_aquamarine_integration() {
    let aquamarine_color = color_aquamarine();
    assert_eq!(red_of(aquamarine_color), 127);
    assert_eq!(green_of(aquamarine_color), 255);
    assert_eq!(blue_of(aquamarine_color), 212);
    assert_eq!(alpha_of(aquamarine_color), 255);
}
#[test]
fn test_color_azure_integration() {
    let azure_color = color_azure();
    assert_eq!(red_of(azure_color), 240);
    assert_eq!(green_of(azure_color), 255);
    assert_eq!(blue_of(azure_color), 255);
    assert_eq!(alpha_of(azure_color), 255);
}
#[test]
fn test_color_beige_integration() {
    let beige_color = color_beige();
    assert_eq!(red_of(beige_color), 245);
    assert_eq!(green_of(beige_color), 245);
    assert_eq!(blue_of(beige_color), 220);
    assert_eq!(alpha_of(beige_color), 255);
}
#[test]
fn test_color_bisque_integration() {
    let bisque_color = color_bisque();
    assert_eq!(red_of(bisque_color), 255);
    assert_eq!(green_of(bisque_color), 228);
    assert_eq!(blue_of(bisque_color), 196);
    assert_eq!(alpha_of(bisque_color), 255);
}
#[test]
fn test_color_black_integration() {
    let black_color = color_black();
    assert_eq!(red_of(black_color), 0);
    assert_eq!(green_of(black_color), 0);
    assert_eq!(blue_of(black_color), 0);
    assert_eq!(alpha_of(black_color), 255);
}
#[test]
fn test_color_blanched_almond_integration() {
    let blanched_almond_color = color_blanched_almond();
    assert_eq!(red_of(blanched_almond_color), 255);
    assert_eq!(green_of(blanched_almond_color), 235);
    assert_eq!(blue_of(blanched_almond_color), 205);
    assert_eq!(alpha_of(blanched_almond_color), 255);
}
#[test]
fn test_color_blue_integration() {
    let blue_color = color_blue();
    assert_eq!(red_of(blue_color), 0);
    assert_eq!(green_of(blue_color), 0);
    assert_eq!(blue_of(blue_color), 255);
    assert_eq!(alpha_of(blue_color), 255);
}
#[test]
fn test_color_blue_violet_integration() {
    let blue_violet_color = color_blue_violet();
    assert_eq!(red_of(blue_violet_color), 138);
    assert_eq!(green_of(blue_violet_color), 43);
    assert_eq!(blue_of(blue_violet_color), 226);
    assert_eq!(alpha_of(blue_violet_color), 255);
}
#[test]
fn test_color_bright_green_integration() {
    let bright_green_color = color_bright_green();
    assert_eq!(red_of(bright_green_color), 0);
    assert_eq!(green_of(bright_green_color), 255);
    assert_eq!(blue_of(bright_green_color), 0);
    assert_eq!(alpha_of(bright_green_color), 255);
}
#[test]
fn test_color_brown_integration() {
    let brown_color = color_brown();
    assert_eq!(red_of(brown_color), 165);
    assert_eq!(green_of(brown_color), 42);
    assert_eq!(blue_of(brown_color), 42);
    assert_eq!(alpha_of(brown_color), 255);
}
#[test]
fn test_color_burly_wood_integration() {
    let burly_wood_color = color_burly_wood();
    assert_eq!(red_of(burly_wood_color), 222);
    assert_eq!(green_of(burly_wood_color), 184);
    assert_eq!(blue_of(burly_wood_color), 135);
    assert_eq!(alpha_of(burly_wood_color), 255);
}
#[test]
fn test_color_cadet_blue_integration() {
    let cadet_blue_color = color_cadet_blue();
    assert_eq!(red_of(cadet_blue_color), 95);
    assert_eq!(green_of(cadet_blue_color), 158);
    assert_eq!(blue_of(cadet_blue_color), 160);
    assert_eq!(alpha_of(cadet_blue_color), 255);
}
#[test]
fn test_color_chartreuse_integration() {
    let chartreuse_color = color_chartreuse();
    assert_eq!(red_of(chartreuse_color), 127);
    assert_eq!(green_of(chartreuse_color), 255);
    assert_eq!(blue_of(chartreuse_color), 0);
    assert_eq!(alpha_of(chartreuse_color), 255);
}
#[test]
fn test_color_chocolate_integration() {
    let chocolate_color = color_chocolate();
    assert_eq!(red_of(chocolate_color), 210);
    assert_eq!(green_of(chocolate_color), 105);
    assert_eq!(blue_of(chocolate_color), 30);
    assert_eq!(alpha_of(chocolate_color), 255);
}
#[test]
fn test_color_coral_integration() {
    let coral_color = color_coral();
    assert_eq!(red_of(coral_color), 255);
    assert_eq!(green_of(coral_color), 127);
    assert_eq!(blue_of(coral_color), 80);
    assert_eq!(alpha_of(coral_color), 255);
}
#[test]
fn test_color_cornflower_blue_integration() {
    let cornflower_blue_color = color_cornflower_blue();
    assert_eq!(red_of(cornflower_blue_color), 100);
    assert_eq!(green_of(cornflower_blue_color), 149);
    assert_eq!(blue_of(cornflower_blue_color), 237);
    assert_eq!(alpha_of(cornflower_blue_color), 255);
}
#[test]
fn test_color_cornsilk_integration() {
    let cornsilk_color = color_cornsilk();
    assert_eq!(red_of(cornsilk_color), 255);
    assert_eq!(green_of(cornsilk_color), 248);
    assert_eq!(blue_of(cornsilk_color), 220);
    assert_eq!(alpha_of(cornsilk_color), 255);
}
#[test]
fn test_color_crimson_integration() {
    let crimson_color = color_crimson();
    assert_eq!(red_of(crimson_color), 220);
    assert_eq!(green_of(crimson_color), 20);
    assert_eq!(blue_of(crimson_color), 60);
    assert_eq!(alpha_of(crimson_color), 255);
}
#[test]
fn test_color_cyan_integration() {
    let cyan_color = color_cyan();
    assert_eq!(red_of(cyan_color), 0);
    assert_eq!(green_of(cyan_color), 255);
    assert_eq!(blue_of(cyan_color), 255);
    assert_eq!(alpha_of(cyan_color), 255);
}
#[test]
fn test_color_dark_blue_integration() {
    let dark_blue_color = color_dark_blue();
    assert_eq!(red_of(dark_blue_color), 0);
    assert_eq!(green_of(dark_blue_color), 0);
    assert_eq!(blue_of(dark_blue_color), 139);
    assert_eq!(alpha_of(dark_blue_color), 255);
}
#[test]
fn test_color_dark_cyan_integration() {
    let dark_cyan_color = color_dark_cyan();
    assert_eq!(red_of(dark_cyan_color), 0);
    assert_eq!(green_of(dark_cyan_color), 139);
    assert_eq!(blue_of(dark_cyan_color), 139);
    assert_eq!(alpha_of(dark_cyan_color), 255);
}
#[test]
fn test_color_dark_goldenrod_integration() {
    let dark_goldenrod_color = color_dark_goldenrod();
    assert_eq!(red_of(dark_goldenrod_color), 184);
    assert_eq!(green_of(dark_goldenrod_color), 134);
    assert_eq!(blue_of(dark_goldenrod_color), 11);
    assert_eq!(alpha_of(dark_goldenrod_color), 255);
}
#[test]
fn test_color_dark_gray_integration() {
    let dark_gray_color = color_dark_gray();
    assert_eq!(red_of(dark_gray_color), 169);
    assert_eq!(green_of(dark_gray_color), 169);
    assert_eq!(blue_of(dark_gray_color), 169);
    assert_eq!(alpha_of(dark_gray_color), 255);
}
#[test]
fn test_color_dark_green_integration() {
    let dark_green_color = color_dark_green();
    assert_eq!(red_of(dark_green_color), 0);
    assert_eq!(green_of(dark_green_color), 100);
    assert_eq!(blue_of(dark_green_color), 0);
    assert_eq!(alpha_of(dark_green_color), 255);
}
#[test]
fn test_color_dark_khaki_integration() {
    let dark_khaki_color = color_dark_khaki();
    assert_eq!(red_of(dark_khaki_color), 189);
    assert_eq!(green_of(dark_khaki_color), 183);
    assert_eq!(blue_of(dark_khaki_color), 107);
    assert_eq!(alpha_of(dark_khaki_color), 255);
}
#[test]
fn test_color_dark_magenta_integration() {
    let dark_magenta_color = color_dark_magenta();
    assert_eq!(red_of(dark_magenta_color), 139);
    assert_eq!(green_of(dark_magenta_color), 0);
    assert_eq!(blue_of(dark_magenta_color), 139);
    assert_eq!(alpha_of(dark_magenta_color), 255);
}
#[test]
fn test_color_dark_olive_green_integration() {
    let dark_olive_green_color = color_dark_olive_green();
    assert_eq!(red_of(dark_olive_green_color), 85);
    assert_eq!(green_of(dark_olive_green_color), 107);
    assert_eq!(blue_of(dark_olive_green_color), 47);
    assert_eq!(alpha_of(dark_olive_green_color), 255);
}
#[test]
fn test_color_dark_orange_integration() {
    let dark_orange_color = color_dark_orange();
    assert_eq!(red_of(dark_orange_color), 255);
    assert_eq!(green_of(dark_orange_color), 140);
    assert_eq!(blue_of(dark_orange_color), 0);
    assert_eq!(alpha_of(dark_orange_color), 255);
}
#[test]
fn test_color_dark_orchid_integration() {
    let dark_orchid_color = color_dark_orchid();
    assert_eq!(red_of(dark_orchid_color), 153);
    assert_eq!(green_of(dark_orchid_color), 50);
    assert_eq!(blue_of(dark_orchid_color), 204);
    assert_eq!(alpha_of(dark_orchid_color), 255);
}
#[test]
fn test_color_dark_red_integration() {
    let dark_red_color = color_dark_red();
    assert_eq!(red_of(dark_red_color), 139);
    assert_eq!(green_of(dark_red_color), 0);
    assert_eq!(blue_of(dark_red_color), 0);
    assert_eq!(alpha_of(dark_red_color), 255);
}
#[test]
fn test_color_dark_salmon_integration() {
    let dark_salmon_color = color_dark_salmon();
    assert_eq!(red_of(dark_salmon_color), 233);
    assert_eq!(green_of(dark_salmon_color), 150);
    assert_eq!(blue_of(dark_salmon_color), 122);
    assert_eq!(alpha_of(dark_salmon_color), 255);
}
#[test]
fn test_color_dark_sea_green_integration() {
    let dark_sea_green_color = color_dark_sea_green();
    assert_eq!(red_of(dark_sea_green_color), 143);
    assert_eq!(green_of(dark_sea_green_color), 188);
    assert_eq!(blue_of(dark_sea_green_color), 139);
    assert_eq!(alpha_of(dark_sea_green_color), 255);
}
#[test]
fn test_color_dark_slate_blue_integration() {
    let dark_slate_blue_color = color_dark_slate_blue();
    assert_eq!(red_of(dark_slate_blue_color), 72);
    assert_eq!(green_of(dark_slate_blue_color), 61);
    assert_eq!(blue_of(dark_slate_blue_color), 139);
    assert_eq!(alpha_of(dark_slate_blue_color), 255);
}
#[test]
fn test_color_dark_slate_gray_integration() {
    let dark_slate_gray_color = color_dark_slate_gray();
    assert_eq!(red_of(dark_slate_gray_color), 47);
    assert_eq!(green_of(dark_slate_gray_color), 79);
    assert_eq!(blue_of(dark_slate_gray_color), 79);
    assert_eq!(alpha_of(dark_slate_gray_color), 255);
}
#[test]
fn test_color_dark_turquoise_integration() {
    let dark_turquoise_color = color_dark_turquoise();
    assert_eq!(red_of(dark_turquoise_color), 0);
    assert_eq!(green_of(dark_turquoise_color), 206);
    assert_eq!(blue_of(dark_turquoise_color), 209);
    assert_eq!(alpha_of(dark_turquoise_color), 255);
}
#[test]
fn test_color_dark_violet_integration() {
    let dark_violet_color = color_dark_violet();
    assert_eq!(red_of(dark_violet_color), 148);
    assert_eq!(green_of(dark_violet_color), 0);
    assert_eq!(blue_of(dark_violet_color), 211);
    assert_eq!(alpha_of(dark_violet_color), 255);
}
#[test]
fn test_color_deep_pink_integration() {
    let deep_pink_color = color_deep_pink();
    assert_eq!(red_of(deep_pink_color), 255);
    assert_eq!(green_of(deep_pink_color), 20);
    assert_eq!(blue_of(deep_pink_color), 147);
    assert_eq!(alpha_of(deep_pink_color), 255);
}
#[test]
fn test_color_deep_sky_blue_integration() {
    let deep_sky_blue_color = color_deep_sky_blue();
    assert_eq!(red_of(deep_sky_blue_color), 0);
    assert_eq!(green_of(deep_sky_blue_color), 191);
    assert_eq!(blue_of(deep_sky_blue_color), 255);
    assert_eq!(alpha_of(deep_sky_blue_color), 255);
}
#[test]
fn test_color_dim_gray_integration() {
    let dim_gray_color = color_dim_gray();
    assert_eq!(red_of(dim_gray_color), 105);
    assert_eq!(green_of(dim_gray_color), 105);
    assert_eq!(blue_of(dim_gray_color), 105);
    assert_eq!(alpha_of(dim_gray_color), 255);
}
#[test]
fn test_color_dodger_blue_integration() {
    let dodger_blue_color = color_dodger_blue();
    assert_eq!(red_of(dodger_blue_color), 30);
    assert_eq!(green_of(dodger_blue_color), 144);
    assert_eq!(blue_of(dodger_blue_color), 255);
    assert_eq!(alpha_of(dodger_blue_color), 255);
}
#[test]
fn test_color_firebrick_integration() {
    let firebrick_color = color_firebrick();
    assert_eq!(red_of(firebrick_color), 178);
    assert_eq!(green_of(firebrick_color), 34);
    assert_eq!(blue_of(firebrick_color), 34);
    assert_eq!(alpha_of(firebrick_color), 255);
}
#[test]
fn test_color_floral_white_integration() {
    let floral_white_color = color_floral_white();
    assert_eq!(red_of(floral_white_color), 255);
    assert_eq!(green_of(floral_white_color), 250);
    assert_eq!(blue_of(floral_white_color), 240);
    assert_eq!(alpha_of(floral_white_color), 255);
}
#[test]
fn test_color_forest_green_integration() {
    let forest_green_color = color_forest_green();
    assert_eq!(red_of(forest_green_color), 34);
    assert_eq!(green_of(forest_green_color), 139);
    assert_eq!(blue_of(forest_green_color), 34);
    assert_eq!(alpha_of(forest_green_color), 255);
}
#[test]
fn test_color_fuchsia_integration() {
    let fuchsia_color = color_fuchsia();
    assert_eq!(red_of(fuchsia_color), 255);
    assert_eq!(green_of(fuchsia_color), 0);
    assert_eq!(blue_of(fuchsia_color), 255);
    assert_eq!(alpha_of(fuchsia_color), 255);
}
#[test]
fn test_color_gainsboro_integration() {
    let gainsboro_color = color_gainsboro();
    assert_eq!(red_of(gainsboro_color), 220);
    assert_eq!(green_of(gainsboro_color), 220);
    assert_eq!(blue_of(gainsboro_color), 220);
    assert_eq!(alpha_of(gainsboro_color), 255);
}
#[test]
fn test_color_ghost_white_integration() {
    let ghost_white_color = color_ghost_white();
    assert_eq!(red_of(ghost_white_color), 248);
    assert_eq!(green_of(ghost_white_color), 248);
    assert_eq!(blue_of(ghost_white_color), 255);
    assert_eq!(alpha_of(ghost_white_color), 255);
}
#[test]
fn test_color_gold_integration() {
    let gold_color = color_gold();
    assert_eq!(red_of(gold_color), 255);
    assert_eq!(green_of(gold_color), 215);
    assert_eq!(blue_of(gold_color), 0);
    assert_eq!(alpha_of(gold_color), 255);
}
#[test]
fn test_color_goldenrod_integration() {
    let goldenrod_color = color_goldenrod();
    assert_eq!(red_of(goldenrod_color), 218);
    assert_eq!(green_of(goldenrod_color), 165);
    assert_eq!(blue_of(goldenrod_color), 32);
    assert_eq!(alpha_of(goldenrod_color), 255);
}
#[test]
fn test_color_gray_integration() {
    let gray_color = color_gray();
    assert_eq!(red_of(gray_color), 127);
    assert_eq!(green_of(gray_color), 127);
    assert_eq!(blue_of(gray_color), 127);
    assert_eq!(alpha_of(gray_color), 255);
}
#[test]
fn test_color_green_integration() {
    let green_color = color_green();
    assert_eq!(red_of(green_color), 0);
    assert_eq!(green_of(green_color), 127);
    assert_eq!(blue_of(green_color), 0);
    assert_eq!(alpha_of(green_color), 255);
}
#[test]
fn test_color_green_yellow_integration() {
    let green_yellow_color = color_green_yellow();
    assert_eq!(red_of(green_yellow_color), 173);
    assert_eq!(green_of(green_yellow_color), 255);
    assert_eq!(blue_of(green_yellow_color), 47);
    assert_eq!(alpha_of(green_yellow_color), 255);
}
#[test]
fn test_color_honeydew_integration() {
    let honeydew_color = color_honeydew();
    assert_eq!(red_of(honeydew_color), 240);
    assert_eq!(green_of(honeydew_color), 255);
    assert_eq!(blue_of(honeydew_color), 240);
    assert_eq!(alpha_of(honeydew_color), 255);
}
#[test]
fn test_color_hot_pink_integration() {
    let hot_pink_color = color_hot_pink();
    assert_eq!(red_of(hot_pink_color), 255);
    assert_eq!(green_of(hot_pink_color), 105);
    assert_eq!(blue_of(hot_pink_color), 180);
    assert_eq!(alpha_of(hot_pink_color), 255);
}
#[test]
fn test_color_indian_red_integration() {
    let indian_red_color = color_indian_red();
    assert_eq!(red_of(indian_red_color), 205);
    assert_eq!(green_of(indian_red_color), 92);
    assert_eq!(blue_of(indian_red_color), 92);
    assert_eq!(alpha_of(indian_red_color), 255);
}
#[test]
fn test_color_indigo_integration() {
    let indigo_color = color_indigo();
    assert_eq!(red_of(indigo_color), 75);
    assert_eq!(green_of(indigo_color), 0);
    assert_eq!(blue_of(indigo_color), 130);
    assert_eq!(alpha_of(indigo_color), 255);
}
#[test]
fn test_color_ivory_integration() {
    let ivory_color = color_ivory();
    assert_eq!(red_of(ivory_color), 255);
    assert_eq!(green_of(ivory_color), 255);
    assert_eq!(blue_of(ivory_color), 240);
    assert_eq!(alpha_of(ivory_color), 255);
}
#[test]
fn test_color_khaki_integration() {
    let khaki_color = color_khaki();
    assert_eq!(red_of(khaki_color), 240);
    assert_eq!(green_of(khaki_color), 230);
    assert_eq!(blue_of(khaki_color), 140);
    assert_eq!(alpha_of(khaki_color), 255);
}
#[test]
fn test_color_lavender_integration() {
    let lavender_color = color_lavender();
    assert_eq!(red_of(lavender_color), 230);
    assert_eq!(green_of(lavender_color), 230);
    assert_eq!(blue_of(lavender_color), 250);
    assert_eq!(alpha_of(lavender_color), 255);
}
#[test]
fn test_color_lavender_blush_integration() {
    let lavender_blush_color = color_lavender_blush();
    assert_eq!(red_of(lavender_blush_color), 255);
    assert_eq!(green_of(lavender_blush_color), 240);
    assert_eq!(blue_of(lavender_blush_color), 245);
    assert_eq!(alpha_of(lavender_blush_color), 255);
}
#[test]
fn test_color_lawn_green_integration() {
    let lawn_green_color = color_lawn_green();
    assert_eq!(red_of(lawn_green_color), 124);
    assert_eq!(green_of(lawn_green_color), 252);
    assert_eq!(blue_of(lawn_green_color), 0);
    assert_eq!(alpha_of(lawn_green_color), 255);
}
#[test]
fn test_color_lemon_chiffon_integration() {
    let lemon_chiffon_color = color_lemon_chiffon();
    assert_eq!(red_of(lemon_chiffon_color), 255);
    assert_eq!(green_of(lemon_chiffon_color), 250);
    assert_eq!(blue_of(lemon_chiffon_color), 205);
    assert_eq!(alpha_of(lemon_chiffon_color), 255);
}
#[test]
fn test_color_light_blue_integration() {
    let light_blue_color = color_light_blue();
    assert_eq!(red_of(light_blue_color), 173);
    assert_eq!(green_of(light_blue_color), 216);
    assert_eq!(blue_of(light_blue_color), 230);
    assert_eq!(alpha_of(light_blue_color), 255);
}
#[test]
fn test_color_light_coral_integration() {
    let light_coral_color = color_light_coral();
    assert_eq!(red_of(light_coral_color), 240);
    assert_eq!(green_of(light_coral_color), 127);
    assert_eq!(blue_of(light_coral_color), 127);
    assert_eq!(alpha_of(light_coral_color), 255);
}
#[test]
fn test_color_light_cyan_integration() {
    let light_cyan_color = color_light_cyan();
    assert_eq!(red_of(light_cyan_color), 224);
    assert_eq!(green_of(light_cyan_color), 255);
    assert_eq!(blue_of(light_cyan_color), 255);
    assert_eq!(alpha_of(light_cyan_color), 255);
}
#[test]
fn test_color_light_goldenrod_yellow_integration() {
    let light_goldenrod_yellow_color = color_light_goldenrod_yellow();
    assert_eq!(red_of(light_goldenrod_yellow_color), 250);
    assert_eq!(green_of(light_goldenrod_yellow_color), 250);
    assert_eq!(blue_of(light_goldenrod_yellow_color), 210);
    assert_eq!(alpha_of(light_goldenrod_yellow_color), 255);
}
#[test]
fn test_color_light_gray_integration() {
    let light_gray_color = color_light_gray();
    assert_eq!(red_of(light_gray_color), 211);
    assert_eq!(green_of(light_gray_color), 211);
    assert_eq!(blue_of(light_gray_color), 211);
    assert_eq!(alpha_of(light_gray_color), 255);
}
#[test]
fn test_color_light_green_integration() {
    let light_green_color = color_light_green();
    assert_eq!(red_of(light_green_color), 144);
    assert_eq!(green_of(light_green_color), 238);
    assert_eq!(blue_of(light_green_color), 144);
    assert_eq!(alpha_of(light_green_color), 255);
}
#[test]
fn test_color_light_pink_integration() {
    let light_pink_color = color_light_pink();
    assert_eq!(red_of(light_pink_color), 255);
    assert_eq!(green_of(light_pink_color), 182);
    assert_eq!(blue_of(light_pink_color), 193);
    assert_eq!(alpha_of(light_pink_color), 255);
}
#[test]
fn test_color_light_salmon_integration() {
    let light_salmon_color = color_light_salmon();
    assert_eq!(red_of(light_salmon_color), 255);
    assert_eq!(green_of(light_salmon_color), 160);
    assert_eq!(blue_of(light_salmon_color), 122);
    assert_eq!(alpha_of(light_salmon_color), 255);
}
#[test]
fn test_color_light_sea_green_integration() {
    let light_sea_green_color = color_light_sea_green();
    assert_eq!(red_of(light_sea_green_color), 32);
    assert_eq!(green_of(light_sea_green_color), 178);
    assert_eq!(blue_of(light_sea_green_color), 170);
    assert_eq!(alpha_of(light_sea_green_color), 255);
}
#[test]
fn test_color_light_sky_blue_integration() {
    let light_sky_blue_color = color_light_sky_blue();
    assert_eq!(red_of(light_sky_blue_color), 135);
    assert_eq!(green_of(light_sky_blue_color), 206);
    assert_eq!(blue_of(light_sky_blue_color), 250);
    assert_eq!(alpha_of(light_sky_blue_color), 255);
}
#[test]
fn test_color_light_slate_gray_integration() {
    let light_slate_gray_color = color_light_slate_gray();
    assert_eq!(red_of(light_slate_gray_color), 119);
    assert_eq!(green_of(light_slate_gray_color), 136);
    assert_eq!(blue_of(light_slate_gray_color), 153);
    assert_eq!(alpha_of(light_slate_gray_color), 255);
}
#[test]
fn test_color_light_steel_blue_integration() {
    let light_steel_blue_color = color_light_steel_blue();
    assert_eq!(red_of(light_steel_blue_color), 176);
    assert_eq!(green_of(light_steel_blue_color), 196);
    assert_eq!(blue_of(light_steel_blue_color), 222);
    assert_eq!(alpha_of(light_steel_blue_color), 255);
}
#[test]
fn test_color_light_yellow_integration() {
    let light_yellow_color = color_light_yellow();
    assert_eq!(red_of(light_yellow_color), 255);
    assert_eq!(green_of(light_yellow_color), 255);
    assert_eq!(blue_of(light_yellow_color), 224);
    assert_eq!(alpha_of(light_yellow_color), 255);
}
#[test]
fn test_color_lime_integration() {
    let lime_color = color_lime();
    assert_eq!(red_of(lime_color), 0);
    assert_eq!(green_of(lime_color), 255);
    assert_eq!(blue_of(lime_color), 0);
    assert_eq!(alpha_of(lime_color), 255);
}
#[test]
fn test_color_lime_green_integration() {
    let lime_green_color = color_lime_green();
    assert_eq!(red_of(lime_green_color), 50);
    assert_eq!(green_of(lime_green_color), 205);
    assert_eq!(blue_of(lime_green_color), 50);
    assert_eq!(alpha_of(lime_green_color), 255);
}
#[test]
fn test_color_linen_integration() {
    let linen_color = color_linen();
    assert_eq!(red_of(linen_color), 250);
    assert_eq!(green_of(linen_color), 240);
    assert_eq!(blue_of(linen_color), 230);
    assert_eq!(alpha_of(linen_color), 255);
}
#[test]
fn test_color_magenta_integration() {
    let magenta_color = color_magenta();
    assert_eq!(red_of(magenta_color), 255);
    assert_eq!(green_of(magenta_color), 0);
    assert_eq!(blue_of(magenta_color), 255);
    assert_eq!(alpha_of(magenta_color), 255);
}
#[test]
fn test_color_maroon_integration() {
    let maroon_color = color_maroon();
    assert_eq!(red_of(maroon_color), 127);
    assert_eq!(green_of(maroon_color), 0);
    assert_eq!(blue_of(maroon_color), 0);
    assert_eq!(alpha_of(maroon_color), 255);
}
#[test]
fn test_color_medium_aquamarine_integration() {
    let medium_aquamarine_color = color_medium_aquamarine();
    assert_eq!(red_of(medium_aquamarine_color), 102);
    assert_eq!(green_of(medium_aquamarine_color), 205);
    assert_eq!(blue_of(medium_aquamarine_color), 170);
    assert_eq!(alpha_of(medium_aquamarine_color), 255);
}
#[test]
fn test_color_medium_blue_integration() {
    let medium_blue_color = color_medium_blue();
    assert_eq!(red_of(medium_blue_color), 0);
    assert_eq!(green_of(medium_blue_color), 0);
    assert_eq!(blue_of(medium_blue_color), 205);
    assert_eq!(alpha_of(medium_blue_color), 255);
}
#[test]
fn test_color_medium_orchid_integration() {
    let medium_orchid_color = color_medium_orchid();
    assert_eq!(red_of(medium_orchid_color), 186);
    assert_eq!(green_of(medium_orchid_color), 85);
    assert_eq!(blue_of(medium_orchid_color), 211);
    assert_eq!(alpha_of(medium_orchid_color), 255);
}
#[test]
fn test_color_medium_purple_integration() {
    let medium_purple_color = color_medium_purple();
    assert_eq!(red_of(medium_purple_color), 147);
    assert_eq!(green_of(medium_purple_color), 112);
    assert_eq!(blue_of(medium_purple_color), 219);
    assert_eq!(alpha_of(medium_purple_color), 255);
}
#[test]
fn test_color_medium_sea_green_integration() {
    let medium_sea_green_color = color_medium_sea_green();
    assert_eq!(red_of(medium_sea_green_color), 60);
    assert_eq!(green_of(medium_sea_green_color), 179);
    assert_eq!(blue_of(medium_sea_green_color), 113);
    assert_eq!(alpha_of(medium_sea_green_color), 255);
}
#[test]
fn test_color_medium_slate_blue_integration() {
    let medium_slate_blue_color = color_medium_slate_blue();
    assert_eq!(red_of(medium_slate_blue_color), 123);
    assert_eq!(green_of(medium_slate_blue_color), 104);
    assert_eq!(blue_of(medium_slate_blue_color), 238);
    assert_eq!(alpha_of(medium_slate_blue_color), 255);
}
#[test]
fn test_color_medium_spring_green_integration() {
    let medium_spring_green_color = color_medium_spring_green();
    assert_eq!(red_of(medium_spring_green_color), 0);
    assert_eq!(green_of(medium_spring_green_color), 250);
    assert_eq!(blue_of(medium_spring_green_color), 154);
    assert_eq!(alpha_of(medium_spring_green_color), 255);
}
#[test]
fn test_color_medium_turquoise_integration() {
    let medium_turquoise_color = color_medium_turquoise();
    assert_eq!(red_of(medium_turquoise_color), 72);
    assert_eq!(green_of(medium_turquoise_color), 209);
    assert_eq!(blue_of(medium_turquoise_color), 204);
    assert_eq!(alpha_of(medium_turquoise_color), 255);
}
#[test]
fn test_color_medium_violet_red_integration() {
    let medium_violet_red_color = color_medium_violet_red();
    assert_eq!(red_of(medium_violet_red_color), 199);
    assert_eq!(green_of(medium_violet_red_color), 21);
    assert_eq!(blue_of(medium_violet_red_color), 133);
    assert_eq!(alpha_of(medium_violet_red_color), 255);
}
#[test]
fn test_color_midnight_blue_integration() {
    let midnight_blue_color = color_midnight_blue();
    assert_eq!(red_of(midnight_blue_color), 25);
    assert_eq!(green_of(midnight_blue_color), 25);
    assert_eq!(blue_of(midnight_blue_color), 112);
    assert_eq!(alpha_of(midnight_blue_color), 255);
}
#[test]
fn test_color_mint_cream_integration() {
    let mint_cream_color = color_mint_cream();
    assert_eq!(red_of(mint_cream_color), 245);
    assert_eq!(green_of(mint_cream_color), 255);
    assert_eq!(blue_of(mint_cream_color), 250);
    assert_eq!(alpha_of(mint_cream_color), 255);
}
#[test]
fn test_color_misty_rose_integration() {
    let misty_rose_color = color_misty_rose();
    assert_eq!(red_of(misty_rose_color), 255);
    assert_eq!(green_of(misty_rose_color), 228);
    assert_eq!(blue_of(misty_rose_color), 225);
    assert_eq!(alpha_of(misty_rose_color), 255);
}
#[test]
fn test_color_moccasin_integration() {
    let moccasin_color = color_moccasin();
    assert_eq!(red_of(moccasin_color), 255);
    assert_eq!(green_of(moccasin_color), 228);
    assert_eq!(blue_of(moccasin_color), 181);
    assert_eq!(alpha_of(moccasin_color), 255);
}
#[test]
fn test_color_navajo_white_integration() {
    let navajo_white_color = color_navajo_white();
    assert_eq!(red_of(navajo_white_color), 255);
    assert_eq!(green_of(navajo_white_color), 222);
    assert_eq!(blue_of(navajo_white_color), 173);
    assert_eq!(alpha_of(navajo_white_color), 255);
}
#[test]
fn test_color_navy_integration() {
    let navy_color = color_navy();
    assert_eq!(red_of(navy_color), 0);
    assert_eq!(green_of(navy_color), 0);
    assert_eq!(blue_of(navy_color), 127);
    assert_eq!(alpha_of(navy_color), 255);
}
#[test]
fn test_color_old_lace_integration() {
    let old_lace_color = color_old_lace();
    assert_eq!(red_of(old_lace_color), 253);
    assert_eq!(green_of(old_lace_color), 245);
    assert_eq!(blue_of(old_lace_color), 230);
    assert_eq!(alpha_of(old_lace_color), 255);
}
#[test]
fn test_color_olive_integration() {
    let olive_color = color_olive();
    assert_eq!(red_of(olive_color), 127);
    assert_eq!(green_of(olive_color), 127);
    assert_eq!(blue_of(olive_color), 0);
    assert_eq!(alpha_of(olive_color), 255);
}
#[test]
fn test_color_olive_drab_integration() {
    let olive_drab_color = color_olive_drab();
    assert_eq!(red_of(olive_drab_color), 107);
    assert_eq!(green_of(olive_drab_color), 142);
    assert_eq!(blue_of(olive_drab_color), 35);
    assert_eq!(alpha_of(olive_drab_color), 255);
}
#[test]
fn test_color_orange_integration() {
    let orange_color = color_orange();
    assert_eq!(red_of(orange_color), 255);
    assert_eq!(green_of(orange_color), 165);
    assert_eq!(blue_of(orange_color), 0);
    assert_eq!(alpha_of(orange_color), 255);
}
#[test]
fn test_color_orange_red_integration() {
    let orange_red_color = color_orange_red();
    assert_eq!(red_of(orange_red_color), 255);
    assert_eq!(green_of(orange_red_color), 69);
    assert_eq!(blue_of(orange_red_color), 0);
    assert_eq!(alpha_of(orange_red_color), 255);
}
#[test]
fn test_color_orchid_integration() {
    let orchid_color = color_orchid();
    assert_eq!(red_of(orchid_color), 218);
    assert_eq!(green_of(orchid_color), 112);
    assert_eq!(blue_of(orchid_color), 214);
    assert_eq!(alpha_of(orchid_color), 255);
}
#[test]
fn test_color_pale_goldenrod_integration() {
    let pale_goldenrod_color = color_pale_goldenrod();
    assert_eq!(red_of(pale_goldenrod_color), 238);
    assert_eq!(green_of(pale_goldenrod_color), 232);
    assert_eq!(blue_of(pale_goldenrod_color), 170);
    assert_eq!(alpha_of(pale_goldenrod_color), 255);
}
#[test]
fn test_color_pale_green_integration() {
    let pale_green_color = color_pale_green();
    assert_eq!(red_of(pale_green_color), 152);
    assert_eq!(green_of(pale_green_color), 251);
    assert_eq!(blue_of(pale_green_color), 152);
    assert_eq!(alpha_of(pale_green_color), 255);
}
#[test]
fn test_color_pale_turquoise_integration() {
    let pale_turquoise_color = color_pale_turquoise();
    assert_eq!(red_of(pale_turquoise_color), 175);
    assert_eq!(green_of(pale_turquoise_color), 238);
    assert_eq!(blue_of(pale_turquoise_color), 238);
    assert_eq!(alpha_of(pale_turquoise_color), 255);
}
#[test]
fn test_color_pale_violet_red_integration() {
    let pale_violet_red_color = color_pale_violet_red();
    assert_eq!(red_of(pale_violet_red_color), 219);
    assert_eq!(green_of(pale_violet_red_color), 112);
    assert_eq!(blue_of(pale_violet_red_color), 147);
    assert_eq!(alpha_of(pale_violet_red_color), 255);
}
#[test]
fn test_color_papaya_whip_integration() {
    let papaya_whip_color = color_papaya_whip();
    assert_eq!(red_of(papaya_whip_color), 255);
    assert_eq!(green_of(papaya_whip_color), 239);
    assert_eq!(blue_of(papaya_whip_color), 213);
    assert_eq!(alpha_of(papaya_whip_color), 255);
}
#[test]
fn test_color_peach_puff_integration() {
    let peach_puff_color = color_peach_puff();
    assert_eq!(red_of(peach_puff_color), 255);
    assert_eq!(green_of(peach_puff_color), 218);
    assert_eq!(blue_of(peach_puff_color), 185);
    assert_eq!(alpha_of(peach_puff_color), 255);
}
#[test]
fn test_color_peru_integration() {
    let peru_color = color_peru();
    assert_eq!(red_of(peru_color), 205);
    assert_eq!(green_of(peru_color), 133);
    assert_eq!(blue_of(peru_color), 63);
    assert_eq!(alpha_of(peru_color), 255);
}
#[test]
fn test_color_pink_integration() {
    let pink_color = color_pink();
    assert_eq!(red_of(pink_color), 255);
    assert_eq!(green_of(pink_color), 192);
    assert_eq!(blue_of(pink_color), 203);
    assert_eq!(alpha_of(pink_color), 255);
}
#[test]
fn test_color_plum_integration() {
    let plum_color = color_plum();
    assert_eq!(red_of(plum_color), 221);
    assert_eq!(green_of(plum_color), 160);
    assert_eq!(blue_of(plum_color), 221);
    assert_eq!(alpha_of(plum_color), 255);
}
#[test]
fn test_color_powder_blue_integration() {
    let powder_blue_color = color_powder_blue();
    assert_eq!(red_of(powder_blue_color), 176);
    assert_eq!(green_of(powder_blue_color), 224);
    assert_eq!(blue_of(powder_blue_color), 230);
    assert_eq!(alpha_of(powder_blue_color), 255);
}
#[test]
fn test_color_purple_integration() {
    let purple_color = color_purple();
    assert_eq!(red_of(purple_color), 127);
    assert_eq!(green_of(purple_color), 0);
    assert_eq!(blue_of(purple_color), 127);
    assert_eq!(alpha_of(purple_color), 255);
}
#[test]
fn test_color_red_integration() {
    let red_color = color_red();
    assert_eq!(red_of(red_color), 255);
    assert_eq!(green_of(red_color), 0);
    assert_eq!(blue_of(red_color), 0);
    assert_eq!(alpha_of(red_color), 255);
}
#[test]
fn test_color_rosy_brown_integration() {
    let rosy_brown_color = color_rosy_brown();
    assert_eq!(red_of(rosy_brown_color), 188);
    assert_eq!(green_of(rosy_brown_color), 143);
    assert_eq!(blue_of(rosy_brown_color), 143);
    assert_eq!(alpha_of(rosy_brown_color), 255);
}
#[test]
fn test_color_royal_blue_integration() {
    let royal_blue_color = color_royal_blue();
    assert_eq!(red_of(royal_blue_color), 65);
    assert_eq!(green_of(royal_blue_color), 105);
    assert_eq!(blue_of(royal_blue_color), 225);
    assert_eq!(alpha_of(royal_blue_color), 255);
}
#[test]
fn test_color_saddle_brown_integration() {
    let saddle_brown_color = color_saddle_brown();
    assert_eq!(red_of(saddle_brown_color), 139);
    assert_eq!(green_of(saddle_brown_color), 69);
    assert_eq!(blue_of(saddle_brown_color), 19);
    assert_eq!(alpha_of(saddle_brown_color), 255);
}
#[test]
fn test_color_salmon_integration() {
    let salmon_color = color_salmon();
    assert_eq!(red_of(salmon_color), 250);
    assert_eq!(green_of(salmon_color), 127);
    assert_eq!(blue_of(salmon_color), 114);
    assert_eq!(alpha_of(salmon_color), 255);
}
#[test]
fn test_color_sandy_brown_integration() {
    let sandy_brown_color = color_sandy_brown();
    assert_eq!(red_of(sandy_brown_color), 244);
    assert_eq!(green_of(sandy_brown_color), 164);
    assert_eq!(blue_of(sandy_brown_color), 96);
    assert_eq!(alpha_of(sandy_brown_color), 255);
}
#[test]
fn test_color_sea_green_integration() {
    let sea_green_color = color_sea_green();
    assert_eq!(red_of(sea_green_color), 46);
    assert_eq!(green_of(sea_green_color), 139);
    assert_eq!(blue_of(sea_green_color), 87);
    assert_eq!(alpha_of(sea_green_color), 255);
}
#[test]
fn test_color_sea_shell_integration() {
    let sea_shell_color = color_sea_shell();
    assert_eq!(red_of(sea_shell_color), 255);
    assert_eq!(green_of(sea_shell_color), 245);
    assert_eq!(blue_of(sea_shell_color), 238);
    assert_eq!(alpha_of(sea_shell_color), 255);
}
#[test]
fn test_color_sienna_integration() {
    let sienna_color = color_sienna();
    assert_eq!(red_of(sienna_color), 160);
    assert_eq!(green_of(sienna_color), 82);
    assert_eq!(blue_of(sienna_color), 45);
    assert_eq!(alpha_of(sienna_color), 255);
}
#[test]
fn test_color_silver_integration() {
    let silver_color = color_silver();
    assert_eq!(red_of(silver_color), 192);
    assert_eq!(green_of(silver_color), 192);
    assert_eq!(blue_of(silver_color), 192);
    assert_eq!(alpha_of(silver_color), 255);
}
#[test]
fn test_color_sky_blue_integration() {
    let sky_blue_color = color_sky_blue();
    assert_eq!(red_of(sky_blue_color), 135);
    assert_eq!(green_of(sky_blue_color), 206);
    assert_eq!(blue_of(sky_blue_color), 235);
    assert_eq!(alpha_of(sky_blue_color), 255);
}
#[test]
fn test_color_slate_blue_integration() {
    let slate_blue_color = color_slate_blue();
    assert_eq!(red_of(slate_blue_color), 106);
    assert_eq!(green_of(slate_blue_color), 90);
    assert_eq!(blue_of(slate_blue_color), 205);
    assert_eq!(alpha_of(slate_blue_color), 255);
}
#[test]
fn test_color_slate_gray_integration() {
    let slate_gray_color = color_slate_gray();
    assert_eq!(red_of(slate_gray_color), 112);
    assert_eq!(green_of(slate_gray_color), 127);
    assert_eq!(blue_of(slate_gray_color), 144);
    assert_eq!(alpha_of(slate_gray_color), 255);
}
#[test]
fn test_color_snow_integration() {
    let snow_color = color_snow();
    assert_eq!(red_of(snow_color), 255);
    assert_eq!(green_of(snow_color), 250);
    assert_eq!(blue_of(snow_color), 250);
    assert_eq!(alpha_of(snow_color), 255);
}
#[test]
fn test_color_spring_green_integration() {
    let spring_green_color = color_spring_green();
    assert_eq!(red_of(spring_green_color), 0);
    assert_eq!(green_of(spring_green_color), 255);
    assert_eq!(blue_of(spring_green_color), 127);
    assert_eq!(alpha_of(spring_green_color), 255);
}
#[test]
fn test_color_steel_blue_integration() {
    let steel_blue_color = color_steel_blue();
    assert_eq!(red_of(steel_blue_color), 70);
    assert_eq!(green_of(steel_blue_color), 130);
    assert_eq!(blue_of(steel_blue_color), 180);
    assert_eq!(alpha_of(steel_blue_color), 255);
}
#[test]
fn test_color_swinburne_red_integration() {
    let swinburne_red_color = color_swinburne_red();
    assert_eq!(red_of(swinburne_red_color), 237);
    assert_eq!(green_of(swinburne_red_color), 36);
    assert_eq!(blue_of(swinburne_red_color), 25);
    assert_eq!(alpha_of(swinburne_red_color), 255);
}
#[test]
fn test_color_tan_integration() {
    let tan_color = color_tan();
    assert_eq!(red_of(tan_color), 210);
    assert_eq!(green_of(tan_color), 180);
    assert_eq!(blue_of(tan_color), 140);
    assert_eq!(alpha_of(tan_color), 255);
}
#[test]
fn test_color_teal_integration() {
    let teal_color = color_teal();
    assert_eq!(red_of(teal_color), 0);
    assert_eq!(green_of(teal_color), 127);
    assert_eq!(blue_of(teal_color), 127);
    assert_eq!(alpha_of(teal_color), 255);
}
#[test]
fn test_color_thistle_integration() {
    let thistle_color = color_thistle();
    assert_eq!(red_of(thistle_color), 216);
    assert_eq!(green_of(thistle_color), 191);
    assert_eq!(blue_of(thistle_color), 216);
    assert_eq!(alpha_of(thistle_color), 255);
}
#[test]
fn test_color_to_string_integration() {
    let red_color = color_red();
    let red_color_string = color_to_string(red_color);
    assert_eq!(red_color_string, "#ff0000ff");
    let transparent_color = color_transparent();
    let transparent_color_string = color_to_string(transparent_color);
    assert_eq!(transparent_color_string, "#ffffffff");
}
#[test]
fn test_color_tomato_integration() {
    let tomato_color = color_tomato();
    assert_eq!(red_of(tomato_color), 255);
    assert_eq!(green_of(tomato_color), 99);
    assert_eq!(blue_of(tomato_color), 71);
    assert_eq!(alpha_of(tomato_color), 255);
}
#[test]
fn test_color_transparent_integration() {
    let transparent_color = color_transparent();
    assert_eq!(alpha_of(transparent_color), 255);
    assert_eq!(red_of(transparent_color), 255);
    assert_eq!(green_of(transparent_color), 255);
    assert_eq!(blue_of(transparent_color), 255);
}
#[test]
fn test_color_turquoise_integration() {
    let turquoise_color = color_turquoise();
    assert_eq!(red_of(turquoise_color), 64);
    assert_eq!(green_of(turquoise_color), 224);
    assert_eq!(blue_of(turquoise_color), 208);
    assert_eq!(alpha_of(turquoise_color), 255);
}
#[test]
fn test_color_violet_integration() {
    let violet_color = color_violet();
    assert_eq!(red_of(violet_color), 238);
    assert_eq!(green_of(violet_color), 130);
    assert_eq!(blue_of(violet_color), 238);
    assert_eq!(alpha_of(violet_color), 255);
}
#[test]
fn test_color_wheat_integration() {
    let wheat_color = color_wheat();
    assert_eq!(red_of(wheat_color), 245);
    assert_eq!(green_of(wheat_color), 222);
    assert_eq!(blue_of(wheat_color), 179);
    assert_eq!(alpha_of(wheat_color), 255);
}
#[test]
fn test_color_white_integration() {
    let white_color = color_white();
    assert_eq!(red_of(white_color), 255);
    assert_eq!(green_of(white_color), 255);
    assert_eq!(blue_of(white_color), 255);
    assert_eq!(alpha_of(white_color), 255);
}
#[test]
fn test_color_white_smoke_integration() {
    let white_smoke_color = color_white_smoke();
    assert_eq!(red_of(white_smoke_color), 245);
    assert_eq!(green_of(white_smoke_color), 245);
    assert_eq!(blue_of(white_smoke_color), 245);
    assert_eq!(alpha_of(white_smoke_color), 255);
}
#[test]
fn test_color_yellow_integration() {
    let yellow_color = color_yellow();
    assert_eq!(red_of(yellow_color), 255);
    assert_eq!(green_of(yellow_color), 255);
    assert_eq!(blue_of(yellow_color), 0);
    assert_eq!(alpha_of(yellow_color), 255);
}
#[test]
fn test_color_yellow_green_integration() {
    let yellow_green_color = color_yellow_green();
    assert_eq!(red_of(yellow_green_color), 154);
    assert_eq!(green_of(yellow_green_color), 205);
    assert_eq!(blue_of(yellow_green_color), 50);
    assert_eq!(alpha_of(yellow_green_color), 255);
}
#[test]
fn test_green_of_integration() {
    let green_color = color_green();
    let green_value = green_of(green_color);
    assert_eq!(green_value, 127);
    let black_color = color_black();
    let black_green_value = green_of(black_color);
    assert_eq!(black_green_value, 0);
}
#[test]
fn test_hsb_color_integration() {
    let red_color = hsb_color(0.0, 1.0, 1.0);
    assert_eq!(hue_of(red_color), 0.0);
    assert_eq!(saturation_of(red_color), 1.0);
    assert_eq!(brightness_of(red_color), 1.0);
    let gray_color = hsb_color(0.5, 0.0, 0.5);
    assert_eq!(saturation_of(gray_color), 0.0);
}
#[test]
fn test_hue_of_integration() {
    let red_color = color_red();
    let hue_value = hue_of(red_color);
    assert_eq!(hue_value, 0.0);
    let blue_color = color_blue();
    let hue_value_blue = hue_of(blue_color);
    assert_eq!(hue_value_blue, 0.6666666666666666);
}
#[test]
fn test_random_color_integration() {
    let random_color_result = random_color();
    assert_ne!(color_to_string(random_color_result), "#000000FF");
    assert!((0..=255).contains(&alpha_of(random_color_result)));
}
#[test]
fn test_random_rgb_color_integration() {
    let random_color = random_rgb_color(255);
    assert!((0..=255).contains(&red_of(random_color)));
    assert!((0..=255).contains(&green_of(random_color)));
    assert!((0..=255).contains(&blue_of(random_color)));
    assert_eq!(alpha_of(random_color), 255);
}
#[test]
fn test_red_of_integration() {
    let red_color = color_red();
    let red_value = red_of(red_color);
    assert_eq!(red_value, 255);
    let blue_color = color_blue();
    let blue_red_value = red_of(blue_color);
    assert_eq!(blue_red_value, 0);
}
#[test]
fn test_rgb_color_from_double_integration() {
    let red_color = rgb_color(1.0, 0.0, 0.0);
    assert_eq!(red_of(red_color), 255);
    assert_eq!(green_of(red_color), 0);
    assert_eq!(blue_of(red_color), 0);
    let green_color = rgb_color(0.0, 1.0, 0.0);
    assert_eq!(red_of(green_color), 0);
    assert_eq!(green_of(green_color), 255);
    assert_eq!(blue_of(green_color), 0);
}
#[test]
fn test_rgb_color_integration() {
    let red_color = rgb_color(255, 0, 0);
    assert_eq!(red_of(red_color), 255);
    assert_eq!(green_of(red_color), 0);
    assert_eq!(blue_of(red_color), 0);
    assert_eq!(alpha_of(red_color), 255);
}
#[test]
fn test_rgba_color_from_double_integration() {
    let test_color = rgba_color(1.0, 0.5, 0.0, 0.75);
    assert_eq!(red_of(test_color), 255);
    assert_eq!(green_of(test_color), 127);
    assert_eq!(blue_of(test_color), 0);
    assert_eq!(alpha_of(test_color), 191);
}
#[test]
fn test_rgba_color_integration() {
    let red_color = rgba_color(255, 0, 0, 255);
    assert_eq!(red_of(red_color), 255);
    assert_eq!(green_of(red_color), 0);
    assert_eq!(blue_of(red_color), 0);
    assert_eq!(alpha_of(red_color), 255);
}
#[test]
fn test_saturation_of_integration() {
    let red_color = color_red();
    let saturation_value = saturation_of(red_color);
    assert_eq!(saturation_value, 1.0);
    let gray_color = color_gray();
    let saturation_value_gray = saturation_of(gray_color);
    assert_eq!(saturation_value_gray, 0.0);
}
#[test]
fn test_string_to_color_integration() {
    let red_color = string_to_color("#FF0000FF");
    assert_eq!(red_of(red_color), 255);
    assert_eq!(green_of(red_color), 0);
    assert_eq!(blue_of(red_color), 0);
    assert_eq!(alpha_of(red_color), 255);
    let green_color = string_to_color("#00FF00FF");
    assert_eq!(red_of(green_color), 0);
    assert_eq!(green_of(green_color), 255);
    assert_eq!(blue_of(green_color), 0);
    assert_eq!(alpha_of(green_color), 255);
}
