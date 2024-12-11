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
mod test_color {
use super::*;
#[test]
fn test_alpha_of_integration() {
    let red_color = color_red();
    let alpha_value = alpha_of(red_color);
    assert_eq!(255, alpha_value);
    let transparent_color = color_transparent();
    let alpha_value_transparent = alpha_of(transparent_color);
    assert_eq!(255, alpha_value_transparent);
}
#[test]
fn test_blue_of_integration() {
    let blue_color = color_blue();
    let blue_value = blue_of(blue_color);
    assert_eq!(255, blue_value);
    let red_color = color_red();
    let blue_value_red = blue_of(red_color);
    assert_eq!(0, blue_value_red);
}
#[test]
fn test_brightness_of_integration() {
    let white_color = color_white();
    let white_brightness = brightness_of(white_color);
    assert_eq!(1.0, white_brightness);
    let black_color = color_black();
    let black_brightness = brightness_of(black_color);
    assert_eq!(0.0, black_brightness);
    let gray_color = color_gray();
    let gray_brightness = brightness_of(gray_color);
    assert!((0.4..=0.6).contains(&gray_brightness));
}
#[test]
fn test_color_alice_blue_integration() {
    let alice_blue_color = color_alice_blue();
    assert_eq!(240, red_of(alice_blue_color));
    assert_eq!(248, green_of(alice_blue_color));
    assert_eq!(255, blue_of(alice_blue_color));
    assert_eq!(255, alpha_of(alice_blue_color));
}
#[test]
fn test_color_antique_white_integration() {
    let antique_white_color = color_antique_white();
    assert_eq!(250, red_of(antique_white_color));
    assert_eq!(235, green_of(antique_white_color));
    assert_eq!(215, blue_of(antique_white_color));
    assert_eq!(255, alpha_of(antique_white_color));
}
#[test]
fn test_color_aqua_integration() {
    let aqua_color = color_aqua();
    assert_eq!(0, red_of(aqua_color));
    assert_eq!(255, green_of(aqua_color));
    assert_eq!(255, blue_of(aqua_color));
    assert_eq!(255, alpha_of(aqua_color));
}
#[test]
fn test_color_aquamarine_integration() {
    let aquamarine_color = color_aquamarine();
    assert_eq!(127, red_of(aquamarine_color));
    assert_eq!(255, green_of(aquamarine_color));
    assert_eq!(212, blue_of(aquamarine_color));
    assert_eq!(255, alpha_of(aquamarine_color));
}
#[test]
fn test_color_azure_integration() {
    let azure_color = color_azure();
    assert_eq!(240, red_of(azure_color));
    assert_eq!(255, green_of(azure_color));
    assert_eq!(255, blue_of(azure_color));
    assert_eq!(255, alpha_of(azure_color));
}
#[test]
fn test_color_beige_integration() {
    let beige_color = color_beige();
    assert_eq!(245, red_of(beige_color));
    assert_eq!(245, green_of(beige_color));
    assert_eq!(220, blue_of(beige_color));
    assert_eq!(255, alpha_of(beige_color));
}
#[test]
fn test_color_bisque_integration() {
    let bisque_color = color_bisque();
    assert_eq!(255, red_of(bisque_color));
    assert_eq!(228, green_of(bisque_color));
    assert_eq!(196, blue_of(bisque_color));
    assert_eq!(255, alpha_of(bisque_color));
}
#[test]
fn test_color_black_integration() {
    let black_color = color_black();
    assert_eq!(0, red_of(black_color));
    assert_eq!(0, green_of(black_color));
    assert_eq!(0, blue_of(black_color));
    assert_eq!(255, alpha_of(black_color));
}
#[test]
fn test_color_blanched_almond_integration() {
    let blanched_almond_color = color_blanched_almond();
    assert_eq!(255, red_of(blanched_almond_color));
    assert_eq!(235, green_of(blanched_almond_color));
    assert_eq!(205, blue_of(blanched_almond_color));
    assert_eq!(255, alpha_of(blanched_almond_color));
}
#[test]
fn test_color_blue_integration() {
    let blue_color = color_blue();
    assert_eq!(0, red_of(blue_color));
    assert_eq!(0, green_of(blue_color));
    assert_eq!(255, blue_of(blue_color));
    assert_eq!(255, alpha_of(blue_color));
}
#[test]
fn test_color_blue_violet_integration() {
    let blue_violet_color = color_blue_violet();
    assert_eq!(138, red_of(blue_violet_color));
    assert_eq!(43, green_of(blue_violet_color));
    assert_eq!(226, blue_of(blue_violet_color));
    assert_eq!(255, alpha_of(blue_violet_color));
}
#[test]
fn test_color_bright_green_integration() {
    let bright_green_color = color_bright_green();
    assert_eq!(0, red_of(bright_green_color));
    assert_eq!(255, green_of(bright_green_color));
    assert_eq!(0, blue_of(bright_green_color));
    assert_eq!(255, alpha_of(bright_green_color));
}
#[test]
fn test_color_brown_integration() {
    let brown_color = color_brown();
    assert_eq!(165, red_of(brown_color));
    assert_eq!(42, green_of(brown_color));
    assert_eq!(42, blue_of(brown_color));
    assert_eq!(255, alpha_of(brown_color));
}
#[test]
fn test_color_burly_wood_integration() {
    let burly_wood_color = color_burly_wood();
    assert_eq!(222, red_of(burly_wood_color));
    assert_eq!(184, green_of(burly_wood_color));
    assert_eq!(135, blue_of(burly_wood_color));
    assert_eq!(255, alpha_of(burly_wood_color));
}
#[test]
fn test_color_cadet_blue_integration() {
    let cadet_blue_color = color_cadet_blue();
    assert_eq!(95, red_of(cadet_blue_color));
    assert_eq!(158, green_of(cadet_blue_color));
    assert_eq!(160, blue_of(cadet_blue_color));
    assert_eq!(255, alpha_of(cadet_blue_color));
}
#[test]
fn test_color_chartreuse_integration() {
    let chartreuse_color = color_chartreuse();
    assert_eq!(127, red_of(chartreuse_color));
    assert_eq!(255, green_of(chartreuse_color));
    assert_eq!(0, blue_of(chartreuse_color));
    assert_eq!(255, alpha_of(chartreuse_color));
}
#[test]
fn test_color_chocolate_integration() {
    let chocolate_color = color_chocolate();
    assert_eq!(210, red_of(chocolate_color));
    assert_eq!(105, green_of(chocolate_color));
    assert_eq!(30, blue_of(chocolate_color));
    assert_eq!(255, alpha_of(chocolate_color));
}
#[test]
fn test_color_coral_integration() {
    let coral_color = color_coral();
    assert_eq!(255, red_of(coral_color));
    assert_eq!(127, green_of(coral_color));
    assert_eq!(80, blue_of(coral_color));
    assert_eq!(255, alpha_of(coral_color));
}
#[test]
fn test_color_cornflower_blue_integration() {
    let cornflower_blue_color = color_cornflower_blue();
    assert_eq!(100, red_of(cornflower_blue_color));
    assert_eq!(149, green_of(cornflower_blue_color));
    assert_eq!(237, blue_of(cornflower_blue_color));
    assert_eq!(255, alpha_of(cornflower_blue_color));
}
#[test]
fn test_color_cornsilk_integration() {
    let cornsilk_color = color_cornsilk();
    assert_eq!(255, red_of(cornsilk_color));
    assert_eq!(248, green_of(cornsilk_color));
    assert_eq!(220, blue_of(cornsilk_color));
    assert_eq!(255, alpha_of(cornsilk_color));
}
#[test]
fn test_color_crimson_integration() {
    let crimson_color = color_crimson();
    assert_eq!(220, red_of(crimson_color));
    assert_eq!(20, green_of(crimson_color));
    assert_eq!(60, blue_of(crimson_color));
    assert_eq!(255, alpha_of(crimson_color));
}
#[test]
fn test_color_cyan_integration() {
    let cyan_color = color_cyan();
    assert_eq!(0, red_of(cyan_color));
    assert_eq!(255, green_of(cyan_color));
    assert_eq!(255, blue_of(cyan_color));
    assert_eq!(255, alpha_of(cyan_color));
}
#[test]
fn test_color_dark_blue_integration() {
    let dark_blue_color = color_dark_blue();
    assert_eq!(0, red_of(dark_blue_color));
    assert_eq!(0, green_of(dark_blue_color));
    assert_eq!(139, blue_of(dark_blue_color));
    assert_eq!(255, alpha_of(dark_blue_color));
}
#[test]
fn test_color_dark_cyan_integration() {
    let dark_cyan_color = color_dark_cyan();
    assert_eq!(0, red_of(dark_cyan_color));
    assert_eq!(139, green_of(dark_cyan_color));
    assert_eq!(139, blue_of(dark_cyan_color));
    assert_eq!(255, alpha_of(dark_cyan_color));
}
#[test]
fn test_color_dark_goldenrod_integration() {
    let dark_goldenrod_color = color_dark_goldenrod();
    assert_eq!(184, red_of(dark_goldenrod_color));
    assert_eq!(134, green_of(dark_goldenrod_color));
    assert_eq!(11, blue_of(dark_goldenrod_color));
    assert_eq!(255, alpha_of(dark_goldenrod_color));
}
#[test]
fn test_color_dark_gray_integration() {
    let dark_gray_color = color_dark_gray();
    assert_eq!(169, red_of(dark_gray_color));
    assert_eq!(169, green_of(dark_gray_color));
    assert_eq!(169, blue_of(dark_gray_color));
    assert_eq!(255, alpha_of(dark_gray_color));
}
#[test]
fn test_color_dark_green_integration() {
    let dark_green_color = color_dark_green();
    assert_eq!(0, red_of(dark_green_color));
    assert_eq!(100, green_of(dark_green_color));
    assert_eq!(0, blue_of(dark_green_color));
    assert_eq!(255, alpha_of(dark_green_color));
}
#[test]
fn test_color_dark_khaki_integration() {
    let dark_khaki_color = color_dark_khaki();
    assert_eq!(189, red_of(dark_khaki_color));
    assert_eq!(183, green_of(dark_khaki_color));
    assert_eq!(107, blue_of(dark_khaki_color));
    assert_eq!(255, alpha_of(dark_khaki_color));
}
#[test]
fn test_color_dark_magenta_integration() {
    let dark_magenta_color = color_dark_magenta();
    assert_eq!(139, red_of(dark_magenta_color));
    assert_eq!(0, green_of(dark_magenta_color));
    assert_eq!(139, blue_of(dark_magenta_color));
    assert_eq!(255, alpha_of(dark_magenta_color));
}
#[test]
fn test_color_dark_olive_green_integration() {
    let dark_olive_green_color = color_dark_olive_green();
    assert_eq!(85, red_of(dark_olive_green_color));
    assert_eq!(107, green_of(dark_olive_green_color));
    assert_eq!(47, blue_of(dark_olive_green_color));
    assert_eq!(255, alpha_of(dark_olive_green_color));
}
#[test]
fn test_color_dark_orange_integration() {
    let dark_orange_color = color_dark_orange();
    assert_eq!(255, red_of(dark_orange_color));
    assert_eq!(140, green_of(dark_orange_color));
    assert_eq!(0, blue_of(dark_orange_color));
    assert_eq!(255, alpha_of(dark_orange_color));
}
#[test]
fn test_color_dark_orchid_integration() {
    let dark_orchid_color = color_dark_orchid();
    assert_eq!(153, red_of(dark_orchid_color));
    assert_eq!(50, green_of(dark_orchid_color));
    assert_eq!(204, blue_of(dark_orchid_color));
    assert_eq!(255, alpha_of(dark_orchid_color));
}
#[test]
fn test_color_dark_red_integration() {
    let dark_red_color = color_dark_red();
    assert_eq!(139, red_of(dark_red_color));
    assert_eq!(0, green_of(dark_red_color));
    assert_eq!(0, blue_of(dark_red_color));
    assert_eq!(255, alpha_of(dark_red_color));
}
#[test]
fn test_color_dark_salmon_integration() {
    let dark_salmon_color = color_dark_salmon();
    assert_eq!(233, red_of(dark_salmon_color));
    assert_eq!(150, green_of(dark_salmon_color));
    assert_eq!(122, blue_of(dark_salmon_color));
    assert_eq!(255, alpha_of(dark_salmon_color));
}
#[test]
fn test_color_dark_sea_green_integration() {
    let dark_sea_green_color = color_dark_sea_green();
    assert_eq!(143, red_of(dark_sea_green_color));
    assert_eq!(188, green_of(dark_sea_green_color));
    assert_eq!(139, blue_of(dark_sea_green_color));
    assert_eq!(255, alpha_of(dark_sea_green_color));
}
#[test]
fn test_color_dark_slate_blue_integration() {
    let dark_slate_blue_color = color_dark_slate_blue();
    assert_eq!(72, red_of(dark_slate_blue_color));
    assert_eq!(61, green_of(dark_slate_blue_color));
    assert_eq!(139, blue_of(dark_slate_blue_color));
    assert_eq!(255, alpha_of(dark_slate_blue_color));
}
#[test]
fn test_color_dark_slate_gray_integration() {
    let dark_slate_gray_color = color_dark_slate_gray();
    assert_eq!(47, red_of(dark_slate_gray_color));
    assert_eq!(79, green_of(dark_slate_gray_color));
    assert_eq!(79, blue_of(dark_slate_gray_color));
    assert_eq!(255, alpha_of(dark_slate_gray_color));
}
#[test]
fn test_color_dark_turquoise_integration() {
    let dark_turquoise_color = color_dark_turquoise();
    assert_eq!(0, red_of(dark_turquoise_color));
    assert_eq!(206, green_of(dark_turquoise_color));
    assert_eq!(209, blue_of(dark_turquoise_color));
    assert_eq!(255, alpha_of(dark_turquoise_color));
}
#[test]
fn test_color_dark_violet_integration() {
    let dark_violet_color = color_dark_violet();
    assert_eq!(148, red_of(dark_violet_color));
    assert_eq!(0, green_of(dark_violet_color));
    assert_eq!(211, blue_of(dark_violet_color));
    assert_eq!(255, alpha_of(dark_violet_color));
}
#[test]
fn test_color_deep_pink_integration() {
    let deep_pink_color = color_deep_pink();
    assert_eq!(255, red_of(deep_pink_color));
    assert_eq!(20, green_of(deep_pink_color));
    assert_eq!(147, blue_of(deep_pink_color));
    assert_eq!(255, alpha_of(deep_pink_color));
}
#[test]
fn test_color_deep_sky_blue_integration() {
    let deep_sky_blue_color = color_deep_sky_blue();
    assert_eq!(0, red_of(deep_sky_blue_color));
    assert_eq!(191, green_of(deep_sky_blue_color));
    assert_eq!(255, blue_of(deep_sky_blue_color));
    assert_eq!(255, alpha_of(deep_sky_blue_color));
}
#[test]
fn test_color_dim_gray_integration() {
    let dim_gray_color = color_dim_gray();
    assert_eq!(105, red_of(dim_gray_color));
    assert_eq!(105, green_of(dim_gray_color));
    assert_eq!(105, blue_of(dim_gray_color));
    assert_eq!(255, alpha_of(dim_gray_color));
}
#[test]
fn test_color_dodger_blue_integration() {
    let dodger_blue_color = color_dodger_blue();
    assert_eq!(30, red_of(dodger_blue_color));
    assert_eq!(144, green_of(dodger_blue_color));
    assert_eq!(255, blue_of(dodger_blue_color));
    assert_eq!(255, alpha_of(dodger_blue_color));
}
#[test]
fn test_color_firebrick_integration() {
    let firebrick_color = color_firebrick();
    assert_eq!(178, red_of(firebrick_color));
    assert_eq!(34, green_of(firebrick_color));
    assert_eq!(34, blue_of(firebrick_color));
    assert_eq!(255, alpha_of(firebrick_color));
}
#[test]
fn test_color_floral_white_integration() {
    let floral_white_color = color_floral_white();
    assert_eq!(255, red_of(floral_white_color));
    assert_eq!(250, green_of(floral_white_color));
    assert_eq!(240, blue_of(floral_white_color));
    assert_eq!(255, alpha_of(floral_white_color));
}
#[test]
fn test_color_forest_green_integration() {
    let forest_green_color = color_forest_green();
    assert_eq!(34, red_of(forest_green_color));
    assert_eq!(139, green_of(forest_green_color));
    assert_eq!(34, blue_of(forest_green_color));
    assert_eq!(255, alpha_of(forest_green_color));
}
#[test]
fn test_color_fuchsia_integration() {
    let fuchsia_color = color_fuchsia();
    assert_eq!(255, red_of(fuchsia_color));
    assert_eq!(0, green_of(fuchsia_color));
    assert_eq!(255, blue_of(fuchsia_color));
    assert_eq!(255, alpha_of(fuchsia_color));
}
#[test]
fn test_color_gainsboro_integration() {
    let gainsboro_color = color_gainsboro();
    assert_eq!(220, red_of(gainsboro_color));
    assert_eq!(220, green_of(gainsboro_color));
    assert_eq!(220, blue_of(gainsboro_color));
    assert_eq!(255, alpha_of(gainsboro_color));
}
#[test]
fn test_color_ghost_white_integration() {
    let ghost_white_color = color_ghost_white();
    assert_eq!(248, red_of(ghost_white_color));
    assert_eq!(248, green_of(ghost_white_color));
    assert_eq!(255, blue_of(ghost_white_color));
    assert_eq!(255, alpha_of(ghost_white_color));
}
#[test]
fn test_color_gold_integration() {
    let gold_color = color_gold();
    assert_eq!(255, red_of(gold_color));
    assert_eq!(215, green_of(gold_color));
    assert_eq!(0, blue_of(gold_color));
    assert_eq!(255, alpha_of(gold_color));
}
#[test]
fn test_color_goldenrod_integration() {
    let goldenrod_color = color_goldenrod();
    assert_eq!(218, red_of(goldenrod_color));
    assert_eq!(165, green_of(goldenrod_color));
    assert_eq!(32, blue_of(goldenrod_color));
    assert_eq!(255, alpha_of(goldenrod_color));
}
#[test]
fn test_color_gray_integration() {
    let gray_color = color_gray();
    assert_eq!(127, red_of(gray_color));
    assert_eq!(127, green_of(gray_color));
    assert_eq!(127, blue_of(gray_color));
    assert_eq!(255, alpha_of(gray_color));
}
#[test]
fn test_color_green_integration() {
    let green_color = color_green();
    assert_eq!(0, red_of(green_color));
    assert_eq!(127, green_of(green_color));
    assert_eq!(0, blue_of(green_color));
    assert_eq!(255, alpha_of(green_color));
}
#[test]
fn test_color_green_yellow_integration() {
    let green_yellow_color = color_green_yellow();
    assert_eq!(173, red_of(green_yellow_color));
    assert_eq!(255, green_of(green_yellow_color));
    assert_eq!(47, blue_of(green_yellow_color));
    assert_eq!(255, alpha_of(green_yellow_color));
}
#[test]
fn test_color_honeydew_integration() {
    let honeydew_color = color_honeydew();
    assert_eq!(240, red_of(honeydew_color));
    assert_eq!(255, green_of(honeydew_color));
    assert_eq!(240, blue_of(honeydew_color));
    assert_eq!(255, alpha_of(honeydew_color));
}
#[test]
fn test_color_hot_pink_integration() {
    let hot_pink_color = color_hot_pink();
    assert_eq!(255, red_of(hot_pink_color));
    assert_eq!(105, green_of(hot_pink_color));
    assert_eq!(180, blue_of(hot_pink_color));
    assert_eq!(255, alpha_of(hot_pink_color));
}
#[test]
fn test_color_indian_red_integration() {
    let indian_red_color = color_indian_red();
    assert_eq!(205, red_of(indian_red_color));
    assert_eq!(92, green_of(indian_red_color));
    assert_eq!(92, blue_of(indian_red_color));
    assert_eq!(255, alpha_of(indian_red_color));
}
#[test]
fn test_color_indigo_integration() {
    let indigo_color = color_indigo();
    assert_eq!(75, red_of(indigo_color));
    assert_eq!(0, green_of(indigo_color));
    assert_eq!(130, blue_of(indigo_color));
    assert_eq!(255, alpha_of(indigo_color));
}
#[test]
fn test_color_ivory_integration() {
    let ivory_color = color_ivory();
    assert_eq!(255, red_of(ivory_color));
    assert_eq!(255, green_of(ivory_color));
    assert_eq!(240, blue_of(ivory_color));
    assert_eq!(255, alpha_of(ivory_color));
}
#[test]
fn test_color_khaki_integration() {
    let khaki_color = color_khaki();
    assert_eq!(240, red_of(khaki_color));
    assert_eq!(230, green_of(khaki_color));
    assert_eq!(140, blue_of(khaki_color));
    assert_eq!(255, alpha_of(khaki_color));
}
#[test]
fn test_color_lavender_integration() {
    let lavender_color = color_lavender();
    assert_eq!(230, red_of(lavender_color));
    assert_eq!(230, green_of(lavender_color));
    assert_eq!(250, blue_of(lavender_color));
    assert_eq!(255, alpha_of(lavender_color));
}
#[test]
fn test_color_lavender_blush_integration() {
    let lavender_blush_color = color_lavender_blush();
    assert_eq!(255, red_of(lavender_blush_color));
    assert_eq!(240, green_of(lavender_blush_color));
    assert_eq!(245, blue_of(lavender_blush_color));
    assert_eq!(255, alpha_of(lavender_blush_color));
}
#[test]
fn test_color_lawn_green_integration() {
    let lawn_green_color = color_lawn_green();
    assert_eq!(124, red_of(lawn_green_color));
    assert_eq!(252, green_of(lawn_green_color));
    assert_eq!(0, blue_of(lawn_green_color));
    assert_eq!(255, alpha_of(lawn_green_color));
}
#[test]
fn test_color_lemon_chiffon_integration() {
    let lemon_chiffon_color = color_lemon_chiffon();
    assert_eq!(255, red_of(lemon_chiffon_color));
    assert_eq!(250, green_of(lemon_chiffon_color));
    assert_eq!(205, blue_of(lemon_chiffon_color));
    assert_eq!(255, alpha_of(lemon_chiffon_color));
}
#[test]
fn test_color_light_blue_integration() {
    let light_blue_color = color_light_blue();
    assert_eq!(173, red_of(light_blue_color));
    assert_eq!(216, green_of(light_blue_color));
    assert_eq!(230, blue_of(light_blue_color));
    assert_eq!(255, alpha_of(light_blue_color));
}
#[test]
fn test_color_light_coral_integration() {
    let light_coral_color = color_light_coral();
    assert_eq!(240, red_of(light_coral_color));
    assert_eq!(127, green_of(light_coral_color));
    assert_eq!(127, blue_of(light_coral_color));
    assert_eq!(255, alpha_of(light_coral_color));
}
#[test]
fn test_color_light_cyan_integration() {
    let light_cyan_color = color_light_cyan();
    assert_eq!(224, red_of(light_cyan_color));
    assert_eq!(255, green_of(light_cyan_color));
    assert_eq!(255, blue_of(light_cyan_color));
    assert_eq!(255, alpha_of(light_cyan_color));
}
#[test]
fn test_color_light_goldenrod_yellow_integration() {
    let light_goldenrod_yellow_color = color_light_goldenrod_yellow();
    assert_eq!(250, red_of(light_goldenrod_yellow_color));
    assert_eq!(250, green_of(light_goldenrod_yellow_color));
    assert_eq!(210, blue_of(light_goldenrod_yellow_color));
    assert_eq!(255, alpha_of(light_goldenrod_yellow_color));
}
#[test]
fn test_color_light_gray_integration() {
    let light_gray_color = color_light_gray();
    assert_eq!(211, red_of(light_gray_color));
    assert_eq!(211, green_of(light_gray_color));
    assert_eq!(211, blue_of(light_gray_color));
    assert_eq!(255, alpha_of(light_gray_color));
}
#[test]
fn test_color_light_green_integration() {
    let light_green_color = color_light_green();
    assert_eq!(144, red_of(light_green_color));
    assert_eq!(238, green_of(light_green_color));
    assert_eq!(144, blue_of(light_green_color));
    assert_eq!(255, alpha_of(light_green_color));
}
#[test]
fn test_color_light_pink_integration() {
    let light_pink_color = color_light_pink();
    assert_eq!(255, red_of(light_pink_color));
    assert_eq!(182, green_of(light_pink_color));
    assert_eq!(193, blue_of(light_pink_color));
    assert_eq!(255, alpha_of(light_pink_color));
}
#[test]
fn test_color_light_salmon_integration() {
    let light_salmon_color = color_light_salmon();
    assert_eq!(255, red_of(light_salmon_color));
    assert_eq!(160, green_of(light_salmon_color));
    assert_eq!(122, blue_of(light_salmon_color));
    assert_eq!(255, alpha_of(light_salmon_color));
}
#[test]
fn test_color_light_sea_green_integration() {
    let light_sea_green_color = color_light_sea_green();
    assert_eq!(32, red_of(light_sea_green_color));
    assert_eq!(178, green_of(light_sea_green_color));
    assert_eq!(170, blue_of(light_sea_green_color));
    assert_eq!(255, alpha_of(light_sea_green_color));
}
#[test]
fn test_color_light_sky_blue_integration() {
    let light_sky_blue_color = color_light_sky_blue();
    assert_eq!(135, red_of(light_sky_blue_color));
    assert_eq!(206, green_of(light_sky_blue_color));
    assert_eq!(250, blue_of(light_sky_blue_color));
    assert_eq!(255, alpha_of(light_sky_blue_color));
}
#[test]
fn test_color_light_slate_gray_integration() {
    let light_slate_gray_color = color_light_slate_gray();
    assert_eq!(119, red_of(light_slate_gray_color));
    assert_eq!(136, green_of(light_slate_gray_color));
    assert_eq!(153, blue_of(light_slate_gray_color));
    assert_eq!(255, alpha_of(light_slate_gray_color));
}
#[test]
fn test_color_light_steel_blue_integration() {
    let light_steel_blue_color = color_light_steel_blue();
    assert_eq!(176, red_of(light_steel_blue_color));
    assert_eq!(196, green_of(light_steel_blue_color));
    assert_eq!(222, blue_of(light_steel_blue_color));
    assert_eq!(255, alpha_of(light_steel_blue_color));
}
#[test]
fn test_color_light_yellow_integration() {
    let light_yellow_color = color_light_yellow();
    assert_eq!(255, red_of(light_yellow_color));
    assert_eq!(255, green_of(light_yellow_color));
    assert_eq!(224, blue_of(light_yellow_color));
    assert_eq!(255, alpha_of(light_yellow_color));
}
#[test]
fn test_color_lime_integration() {
    let lime_color = color_lime();
    assert_eq!(0, red_of(lime_color));
    assert_eq!(255, green_of(lime_color));
    assert_eq!(0, blue_of(lime_color));
    assert_eq!(255, alpha_of(lime_color));
}
#[test]
fn test_color_lime_green_integration() {
    let lime_green_color = color_lime_green();
    assert_eq!(50, red_of(lime_green_color));
    assert_eq!(205, green_of(lime_green_color));
    assert_eq!(50, blue_of(lime_green_color));
    assert_eq!(255, alpha_of(lime_green_color));
}
#[test]
fn test_color_linen_integration() {
    let linen_color = color_linen();
    assert_eq!(250, red_of(linen_color));
    assert_eq!(240, green_of(linen_color));
    assert_eq!(230, blue_of(linen_color));
    assert_eq!(255, alpha_of(linen_color));
}
#[test]
fn test_color_magenta_integration() {
    let magenta_color = color_magenta();
    assert_eq!(255, red_of(magenta_color));
    assert_eq!(0, green_of(magenta_color));
    assert_eq!(255, blue_of(magenta_color));
    assert_eq!(255, alpha_of(magenta_color));
}
#[test]
fn test_color_maroon_integration() {
    let maroon_color = color_maroon();
    assert_eq!(127, red_of(maroon_color));
    assert_eq!(0, green_of(maroon_color));
    assert_eq!(0, blue_of(maroon_color));
    assert_eq!(255, alpha_of(maroon_color));
}
#[test]
fn test_color_medium_aquamarine_integration() {
    let medium_aquamarine_color = color_medium_aquamarine();
    assert_eq!(102, red_of(medium_aquamarine_color));
    assert_eq!(205, green_of(medium_aquamarine_color));
    assert_eq!(170, blue_of(medium_aquamarine_color));
    assert_eq!(255, alpha_of(medium_aquamarine_color));
}
#[test]
fn test_color_medium_blue_integration() {
    let medium_blue_color = color_medium_blue();
    assert_eq!(0, red_of(medium_blue_color));
    assert_eq!(0, green_of(medium_blue_color));
    assert_eq!(205, blue_of(medium_blue_color));
    assert_eq!(255, alpha_of(medium_blue_color));
}
#[test]
fn test_color_medium_orchid_integration() {
    let medium_orchid_color = color_medium_orchid();
    assert_eq!(186, red_of(medium_orchid_color));
    assert_eq!(85, green_of(medium_orchid_color));
    assert_eq!(211, blue_of(medium_orchid_color));
    assert_eq!(255, alpha_of(medium_orchid_color));
}
#[test]
fn test_color_medium_purple_integration() {
    let medium_purple_color = color_medium_purple();
    assert_eq!(147, red_of(medium_purple_color));
    assert_eq!(112, green_of(medium_purple_color));
    assert_eq!(219, blue_of(medium_purple_color));
    assert_eq!(255, alpha_of(medium_purple_color));
}
#[test]
fn test_color_medium_sea_green_integration() {
    let medium_sea_green_color = color_medium_sea_green();
    assert_eq!(60, red_of(medium_sea_green_color));
    assert_eq!(179, green_of(medium_sea_green_color));
    assert_eq!(113, blue_of(medium_sea_green_color));
    assert_eq!(255, alpha_of(medium_sea_green_color));
}
#[test]
fn test_color_medium_slate_blue_integration() {
    let medium_slate_blue_color = color_medium_slate_blue();
    assert_eq!(123, red_of(medium_slate_blue_color));
    assert_eq!(104, green_of(medium_slate_blue_color));
    assert_eq!(238, blue_of(medium_slate_blue_color));
    assert_eq!(255, alpha_of(medium_slate_blue_color));
}
#[test]
fn test_color_medium_spring_green_integration() {
    let medium_spring_green_color = color_medium_spring_green();
    assert_eq!(0, red_of(medium_spring_green_color));
    assert_eq!(250, green_of(medium_spring_green_color));
    assert_eq!(154, blue_of(medium_spring_green_color));
    assert_eq!(255, alpha_of(medium_spring_green_color));
}
#[test]
fn test_color_medium_turquoise_integration() {
    let medium_turquoise_color = color_medium_turquoise();
    assert_eq!(72, red_of(medium_turquoise_color));
    assert_eq!(209, green_of(medium_turquoise_color));
    assert_eq!(204, blue_of(medium_turquoise_color));
    assert_eq!(255, alpha_of(medium_turquoise_color));
}
#[test]
fn test_color_medium_violet_red_integration() {
    let medium_violet_red_color = color_medium_violet_red();
    assert_eq!(199, red_of(medium_violet_red_color));
    assert_eq!(21, green_of(medium_violet_red_color));
    assert_eq!(133, blue_of(medium_violet_red_color));
    assert_eq!(255, alpha_of(medium_violet_red_color));
}
#[test]
fn test_color_midnight_blue_integration() {
    let midnight_blue_color = color_midnight_blue();
    assert_eq!(25, red_of(midnight_blue_color));
    assert_eq!(25, green_of(midnight_blue_color));
    assert_eq!(112, blue_of(midnight_blue_color));
    assert_eq!(255, alpha_of(midnight_blue_color));
}
#[test]
fn test_color_mint_cream_integration() {
    let mint_cream_color = color_mint_cream();
    assert_eq!(245, red_of(mint_cream_color));
    assert_eq!(255, green_of(mint_cream_color));
    assert_eq!(250, blue_of(mint_cream_color));
    assert_eq!(255, alpha_of(mint_cream_color));
}
#[test]
fn test_color_misty_rose_integration() {
    let misty_rose_color = color_misty_rose();
    assert_eq!(255, red_of(misty_rose_color));
    assert_eq!(228, green_of(misty_rose_color));
    assert_eq!(225, blue_of(misty_rose_color));
    assert_eq!(255, alpha_of(misty_rose_color));
}
#[test]
fn test_color_moccasin_integration() {
    let moccasin_color = color_moccasin();
    assert_eq!(255, red_of(moccasin_color));
    assert_eq!(228, green_of(moccasin_color));
    assert_eq!(181, blue_of(moccasin_color));
    assert_eq!(255, alpha_of(moccasin_color));
}
#[test]
fn test_color_navajo_white_integration() {
    let navajo_white_color = color_navajo_white();
    assert_eq!(255, red_of(navajo_white_color));
    assert_eq!(222, green_of(navajo_white_color));
    assert_eq!(173, blue_of(navajo_white_color));
    assert_eq!(255, alpha_of(navajo_white_color));
}
#[test]
fn test_color_navy_integration() {
    let navy_color = color_navy();
    assert_eq!(0, red_of(navy_color));
    assert_eq!(0, green_of(navy_color));
    assert_eq!(127, blue_of(navy_color));
    assert_eq!(255, alpha_of(navy_color));
}
#[test]
fn test_color_old_lace_integration() {
    let old_lace_color = color_old_lace();
    assert_eq!(253, red_of(old_lace_color));
    assert_eq!(245, green_of(old_lace_color));
    assert_eq!(230, blue_of(old_lace_color));
    assert_eq!(255, alpha_of(old_lace_color));
}
#[test]
fn test_color_olive_integration() {
    let olive_color = color_olive();
    assert_eq!(127, red_of(olive_color));
    assert_eq!(127, green_of(olive_color));
    assert_eq!(0, blue_of(olive_color));
    assert_eq!(255, alpha_of(olive_color));
}
#[test]
fn test_color_olive_drab_integration() {
    let olive_drab_color = color_olive_drab();
    assert_eq!(107, red_of(olive_drab_color));
    assert_eq!(142, green_of(olive_drab_color));
    assert_eq!(35, blue_of(olive_drab_color));
    assert_eq!(255, alpha_of(olive_drab_color));
}
#[test]
fn test_color_orange_integration() {
    let orange_color = color_orange();
    assert_eq!(255, red_of(orange_color));
    assert_eq!(165, green_of(orange_color));
    assert_eq!(0, blue_of(orange_color));
    assert_eq!(255, alpha_of(orange_color));
}
#[test]
fn test_color_orange_red_integration() {
    let orange_red_color = color_orange_red();
    assert_eq!(255, red_of(orange_red_color));
    assert_eq!(69, green_of(orange_red_color));
    assert_eq!(0, blue_of(orange_red_color));
    assert_eq!(255, alpha_of(orange_red_color));
}
#[test]
fn test_color_orchid_integration() {
    let orchid_color = color_orchid();
    assert_eq!(218, red_of(orchid_color));
    assert_eq!(112, green_of(orchid_color));
    assert_eq!(214, blue_of(orchid_color));
    assert_eq!(255, alpha_of(orchid_color));
}
#[test]
fn test_color_pale_goldenrod_integration() {
    let pale_goldenrod_color = color_pale_goldenrod();
    assert_eq!(238, red_of(pale_goldenrod_color));
    assert_eq!(232, green_of(pale_goldenrod_color));
    assert_eq!(170, blue_of(pale_goldenrod_color));
    assert_eq!(255, alpha_of(pale_goldenrod_color));
}
#[test]
fn test_color_pale_green_integration() {
    let pale_green_color = color_pale_green();
    assert_eq!(152, red_of(pale_green_color));
    assert_eq!(251, green_of(pale_green_color));
    assert_eq!(152, blue_of(pale_green_color));
    assert_eq!(255, alpha_of(pale_green_color));
}
#[test]
fn test_color_pale_turquoise_integration() {
    let pale_turquoise_color = color_pale_turquoise();
    assert_eq!(175, red_of(pale_turquoise_color));
    assert_eq!(238, green_of(pale_turquoise_color));
    assert_eq!(238, blue_of(pale_turquoise_color));
    assert_eq!(255, alpha_of(pale_turquoise_color));
}
#[test]
fn test_color_pale_violet_red_integration() {
    let pale_violet_red_color = color_pale_violet_red();
    assert_eq!(219, red_of(pale_violet_red_color));
    assert_eq!(112, green_of(pale_violet_red_color));
    assert_eq!(147, blue_of(pale_violet_red_color));
    assert_eq!(255, alpha_of(pale_violet_red_color));
}
#[test]
fn test_color_papaya_whip_integration() {
    let papaya_whip_color = color_papaya_whip();
    assert_eq!(255, red_of(papaya_whip_color));
    assert_eq!(239, green_of(papaya_whip_color));
    assert_eq!(213, blue_of(papaya_whip_color));
    assert_eq!(255, alpha_of(papaya_whip_color));
}
#[test]
fn test_color_peach_puff_integration() {
    let peach_puff_color = color_peach_puff();
    assert_eq!(255, red_of(peach_puff_color));
    assert_eq!(218, green_of(peach_puff_color));
    assert_eq!(185, blue_of(peach_puff_color));
    assert_eq!(255, alpha_of(peach_puff_color));
}
#[test]
fn test_color_peru_integration() {
    let peru_color = color_peru();
    assert_eq!(205, red_of(peru_color));
    assert_eq!(133, green_of(peru_color));
    assert_eq!(63, blue_of(peru_color));
    assert_eq!(255, alpha_of(peru_color));
}
#[test]
fn test_color_pink_integration() {
    let pink_color = color_pink();
    assert_eq!(255, red_of(pink_color));
    assert_eq!(192, green_of(pink_color));
    assert_eq!(203, blue_of(pink_color));
    assert_eq!(255, alpha_of(pink_color));
}
#[test]
fn test_color_plum_integration() {
    let plum_color = color_plum();
    assert_eq!(221, red_of(plum_color));
    assert_eq!(160, green_of(plum_color));
    assert_eq!(221, blue_of(plum_color));
    assert_eq!(255, alpha_of(plum_color));
}
#[test]
fn test_color_powder_blue_integration() {
    let powder_blue_color = color_powder_blue();
    assert_eq!(176, red_of(powder_blue_color));
    assert_eq!(224, green_of(powder_blue_color));
    assert_eq!(230, blue_of(powder_blue_color));
    assert_eq!(255, alpha_of(powder_blue_color));
}
#[test]
fn test_color_purple_integration() {
    let purple_color = color_purple();
    assert_eq!(127, red_of(purple_color));
    assert_eq!(0, green_of(purple_color));
    assert_eq!(127, blue_of(purple_color));
    assert_eq!(255, alpha_of(purple_color));
}
#[test]
fn test_color_red_integration() {
    let red_color = color_red();
    assert_eq!(255, red_of(red_color));
    assert_eq!(0, green_of(red_color));
    assert_eq!(0, blue_of(red_color));
    assert_eq!(255, alpha_of(red_color));
}
#[test]
fn test_color_rosy_brown_integration() {
    let rosy_brown_color = color_rosy_brown();
    assert_eq!(188, red_of(rosy_brown_color));
    assert_eq!(143, green_of(rosy_brown_color));
    assert_eq!(143, blue_of(rosy_brown_color));
    assert_eq!(255, alpha_of(rosy_brown_color));
}
#[test]
fn test_color_royal_blue_integration() {
    let royal_blue_color = color_royal_blue();
    assert_eq!(65, red_of(royal_blue_color));
    assert_eq!(105, green_of(royal_blue_color));
    assert_eq!(225, blue_of(royal_blue_color));
    assert_eq!(255, alpha_of(royal_blue_color));
}
#[test]
fn test_color_saddle_brown_integration() {
    let saddle_brown_color = color_saddle_brown();
    assert_eq!(139, red_of(saddle_brown_color));
    assert_eq!(69, green_of(saddle_brown_color));
    assert_eq!(19, blue_of(saddle_brown_color));
    assert_eq!(255, alpha_of(saddle_brown_color));
}
#[test]
fn test_color_salmon_integration() {
    let salmon_color = color_salmon();
    assert_eq!(250, red_of(salmon_color));
    assert_eq!(127, green_of(salmon_color));
    assert_eq!(114, blue_of(salmon_color));
    assert_eq!(255, alpha_of(salmon_color));
}
#[test]
fn test_color_sandy_brown_integration() {
    let sandy_brown_color = color_sandy_brown();
    assert_eq!(244, red_of(sandy_brown_color));
    assert_eq!(164, green_of(sandy_brown_color));
    assert_eq!(96, blue_of(sandy_brown_color));
    assert_eq!(255, alpha_of(sandy_brown_color));
}
#[test]
fn test_color_sea_green_integration() {
    let sea_green_color = color_sea_green();
    assert_eq!(46, red_of(sea_green_color));
    assert_eq!(139, green_of(sea_green_color));
    assert_eq!(87, blue_of(sea_green_color));
    assert_eq!(255, alpha_of(sea_green_color));
}
#[test]
fn test_color_sea_shell_integration() {
    let sea_shell_color = color_sea_shell();
    assert_eq!(255, red_of(sea_shell_color));
    assert_eq!(245, green_of(sea_shell_color));
    assert_eq!(238, blue_of(sea_shell_color));
    assert_eq!(255, alpha_of(sea_shell_color));
}
#[test]
fn test_color_sienna_integration() {
    let sienna_color = color_sienna();
    assert_eq!(160, red_of(sienna_color));
    assert_eq!(82, green_of(sienna_color));
    assert_eq!(45, blue_of(sienna_color));
    assert_eq!(255, alpha_of(sienna_color));
}
#[test]
fn test_color_silver_integration() {
    let silver_color = color_silver();
    assert_eq!(192, red_of(silver_color));
    assert_eq!(192, green_of(silver_color));
    assert_eq!(192, blue_of(silver_color));
    assert_eq!(255, alpha_of(silver_color));
}
#[test]
fn test_color_sky_blue_integration() {
    let sky_blue_color = color_sky_blue();
    assert_eq!(135, red_of(sky_blue_color));
    assert_eq!(206, green_of(sky_blue_color));
    assert_eq!(235, blue_of(sky_blue_color));
    assert_eq!(255, alpha_of(sky_blue_color));
}
#[test]
fn test_color_slate_blue_integration() {
    let slate_blue_color = color_slate_blue();
    assert_eq!(106, red_of(slate_blue_color));
    assert_eq!(90, green_of(slate_blue_color));
    assert_eq!(205, blue_of(slate_blue_color));
    assert_eq!(255, alpha_of(slate_blue_color));
}
#[test]
fn test_color_slate_gray_integration() {
    let slate_gray_color = color_slate_gray();
    assert_eq!(112, red_of(slate_gray_color));
    assert_eq!(127, green_of(slate_gray_color));
    assert_eq!(144, blue_of(slate_gray_color));
    assert_eq!(255, alpha_of(slate_gray_color));
}
#[test]
fn test_color_snow_integration() {
    let snow_color = color_snow();
    assert_eq!(255, red_of(snow_color));
    assert_eq!(250, green_of(snow_color));
    assert_eq!(250, blue_of(snow_color));
    assert_eq!(255, alpha_of(snow_color));
}
#[test]
fn test_color_spring_green_integration() {
    let spring_green_color = color_spring_green();
    assert_eq!(0, red_of(spring_green_color));
    assert_eq!(255, green_of(spring_green_color));
    assert_eq!(127, blue_of(spring_green_color));
    assert_eq!(255, alpha_of(spring_green_color));
}
#[test]
fn test_color_steel_blue_integration() {
    let steel_blue_color = color_steel_blue();
    assert_eq!(70, red_of(steel_blue_color));
    assert_eq!(130, green_of(steel_blue_color));
    assert_eq!(180, blue_of(steel_blue_color));
    assert_eq!(255, alpha_of(steel_blue_color));
}
#[test]
fn test_color_swinburne_red_integration() {
    let swinburne_red_color = color_swinburne_red();
    assert_eq!(237, red_of(swinburne_red_color));
    assert_eq!(36, green_of(swinburne_red_color));
    assert_eq!(25, blue_of(swinburne_red_color));
    assert_eq!(255, alpha_of(swinburne_red_color));
}
#[test]
fn test_color_tan_integration() {
    let tan_color = color_tan();
    assert_eq!(210, red_of(tan_color));
    assert_eq!(180, green_of(tan_color));
    assert_eq!(140, blue_of(tan_color));
    assert_eq!(255, alpha_of(tan_color));
}
#[test]
fn test_color_teal_integration() {
    let teal_color = color_teal();
    assert_eq!(0, red_of(teal_color));
    assert_eq!(127, green_of(teal_color));
    assert_eq!(127, blue_of(teal_color));
    assert_eq!(255, alpha_of(teal_color));
}
#[test]
fn test_color_thistle_integration() {
    let thistle_color = color_thistle();
    assert_eq!(216, red_of(thistle_color));
    assert_eq!(191, green_of(thistle_color));
    assert_eq!(216, blue_of(thistle_color));
    assert_eq!(255, alpha_of(thistle_color));
}
#[test]
fn test_color_to_string_integration() {
    let red_color = color_red();
    let red_color_string = color_to_string(red_color);
    assert_eq!("#ff0000ff", red_color_string);
    let transparent_color = color_transparent();
    let transparent_color_string = color_to_string(transparent_color);
    assert_eq!("#ffffffff", transparent_color_string);
}
#[test]
fn test_color_tomato_integration() {
    let tomato_color = color_tomato();
    assert_eq!(255, red_of(tomato_color));
    assert_eq!(99, green_of(tomato_color));
    assert_eq!(71, blue_of(tomato_color));
    assert_eq!(255, alpha_of(tomato_color));
}
#[test]
fn test_color_transparent_integration() {
    let transparent_color = color_transparent();
    assert_eq!(255, alpha_of(transparent_color));
    assert_eq!(255, red_of(transparent_color));
    assert_eq!(255, green_of(transparent_color));
    assert_eq!(255, blue_of(transparent_color));
}
#[test]
fn test_color_turquoise_integration() {
    let turquoise_color = color_turquoise();
    assert_eq!(64, red_of(turquoise_color));
    assert_eq!(224, green_of(turquoise_color));
    assert_eq!(208, blue_of(turquoise_color));
    assert_eq!(255, alpha_of(turquoise_color));
}
#[test]
fn test_color_violet_integration() {
    let violet_color = color_violet();
    assert_eq!(238, red_of(violet_color));
    assert_eq!(130, green_of(violet_color));
    assert_eq!(238, blue_of(violet_color));
    assert_eq!(255, alpha_of(violet_color));
}
#[test]
fn test_color_wheat_integration() {
    let wheat_color = color_wheat();
    assert_eq!(245, red_of(wheat_color));
    assert_eq!(222, green_of(wheat_color));
    assert_eq!(179, blue_of(wheat_color));
    assert_eq!(255, alpha_of(wheat_color));
}
#[test]
fn test_color_white_integration() {
    let white_color = color_white();
    assert_eq!(255, red_of(white_color));
    assert_eq!(255, green_of(white_color));
    assert_eq!(255, blue_of(white_color));
    assert_eq!(255, alpha_of(white_color));
}
#[test]
fn test_color_white_smoke_integration() {
    let white_smoke_color = color_white_smoke();
    assert_eq!(245, red_of(white_smoke_color));
    assert_eq!(245, green_of(white_smoke_color));
    assert_eq!(245, blue_of(white_smoke_color));
    assert_eq!(255, alpha_of(white_smoke_color));
}
#[test]
fn test_color_yellow_integration() {
    let yellow_color = color_yellow();
    assert_eq!(255, red_of(yellow_color));
    assert_eq!(255, green_of(yellow_color));
    assert_eq!(0, blue_of(yellow_color));
    assert_eq!(255, alpha_of(yellow_color));
}
#[test]
fn test_color_yellow_green_integration() {
    let yellow_green_color = color_yellow_green();
    assert_eq!(154, red_of(yellow_green_color));
    assert_eq!(205, green_of(yellow_green_color));
    assert_eq!(50, blue_of(yellow_green_color));
    assert_eq!(255, alpha_of(yellow_green_color));
}
#[test]
fn test_green_of_integration() {
    let green_color = color_green();
    let green_value = green_of(green_color);
    assert_eq!(127, green_value);
    let black_color = color_black();
    let black_green_value = green_of(black_color);
    assert_eq!(0, black_green_value);
}
#[test]
fn test_hsb_color_integration() {
    let red_color = hsb_color(0.0, 1.0, 1.0);
    assert_eq!(0.0, hue_of(red_color));
    assert_eq!(1.0, saturation_of(red_color));
    assert_eq!(1.0, brightness_of(red_color));
    let gray_color = hsb_color(0.5, 0.0, 0.5);
    assert_eq!(0.0, saturation_of(gray_color));
}
#[test]
fn test_hue_of_integration() {
    let red_color = color_red();
    let hue_value = hue_of(red_color);
    assert_eq!(0.0, hue_value);
    let blue_color = color_blue();
    let hue_value_blue = hue_of(blue_color);
    assert_eq!(0.6666666666666666, hue_value_blue);
}
#[test]
fn test_random_color_integration() {
    let random_color_result = random_color();
    assert_ne!("#000000FF", color_to_string(random_color_result));
    assert!((0..=255).contains(&alpha_of(random_color_result)));
}
#[test]
fn test_random_rgb_color_integration() {
    let random_color = random_rgb_color(255);
    assert!((0..=255).contains(&red_of(random_color)));
    assert!((0..=255).contains(&green_of(random_color)));
    assert!((0..=255).contains(&blue_of(random_color)));
    assert_eq!(255, alpha_of(random_color));
}
#[test]
fn test_red_of_integration() {
    let red_color = color_red();
    let red_value = red_of(red_color);
    assert_eq!(255, red_value);
    let blue_color = color_blue();
    let blue_red_value = red_of(blue_color);
    assert_eq!(0, blue_red_value);
}
#[test]
fn test_rgb_color_from_double_integration() {
    let red_color = rgb_color(1.0, 0.0, 0.0);
    assert_eq!(255, red_of(red_color));
    assert_eq!(0, green_of(red_color));
    assert_eq!(0, blue_of(red_color));
    let green_color = rgb_color(0.0, 1.0, 0.0);
    assert_eq!(0, red_of(green_color));
    assert_eq!(255, green_of(green_color));
    assert_eq!(0, blue_of(green_color));
}
#[test]
fn test_rgb_color_integration() {
    let red_color = rgb_color(255, 0, 0);
    assert_eq!(255, red_of(red_color));
    assert_eq!(0, green_of(red_color));
    assert_eq!(0, blue_of(red_color));
    assert_eq!(255, alpha_of(red_color));
}
#[test]
fn test_rgba_color_from_double_integration() {
    let test_color = rgba_color(1.0, 0.5, 0.0, 0.75);
    assert_eq!(255, red_of(test_color));
    assert_eq!(127, green_of(test_color));
    assert_eq!(0, blue_of(test_color));
    assert_eq!(191, alpha_of(test_color));
}
#[test]
fn test_rgba_color_integration() {
    let red_color = rgba_color(255, 0, 0, 255);
    assert_eq!(255, red_of(red_color));
    assert_eq!(0, green_of(red_color));
    assert_eq!(0, blue_of(red_color));
    assert_eq!(255, alpha_of(red_color));
}
#[test]
fn test_saturation_of_integration() {
    let red_color = color_red();
    let saturation_value = saturation_of(red_color);
    assert_eq!(1.0, saturation_value);
    let gray_color = color_gray();
    let saturation_value_gray = saturation_of(gray_color);
    assert_eq!(0.0, saturation_value_gray);
}
#[test]
fn test_string_to_color_integration() {
    let red_color = string_to_color("#FF0000FF");
    assert_eq!(255, red_of(red_color));
    assert_eq!(0, green_of(red_color));
    assert_eq!(0, blue_of(red_color));
    assert_eq!(255, alpha_of(red_color));
    let green_color = string_to_color("#00FF00FF");
    assert_eq!(0, red_of(green_color));
    assert_eq!(255, green_of(green_color));
    assert_eq!(0, blue_of(green_color));
    assert_eq!(255, alpha_of(green_color));
}
}
