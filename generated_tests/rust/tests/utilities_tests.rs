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
mod test_utilities {
use super::*;
#[test]
fn test_contains_integration() {
    assert!(contains("splashkit library", "splashkit"));
    assert!(contains("splashkit library", "library"));
    assert!(contains("splashkit library", "it lib"));
    assert!(contains("splashkit library", ""));
    assert!(!contains("splashkit library", "unreal"));
    assert!(!contains("", "splashkit"));
}
#[test]
fn test_convert_to_double_integration() {
    assert_eq!(123.0, convert_to_double("123"));
    assert_eq!(123.456, convert_to_double("123.456"));
    assert_eq!(-123.0, convert_to_double("-123"));
    assert_eq!(-123.456, convert_to_double("-123.456"));
    assert_eq!(0.456, convert_to_double(".456"));
    assert_eq!(123.0, convert_to_double("123."));
    assert_eq!(123.456, convert_to_double("000123.456"));
    assert_eq!(123.456, convert_to_double("123.456000"));
    assert_eq!(, convert_to_double("inf"));
    assert_eq!(, convert_to_double("-inf"));
    assert_eq!(123.0, convert_to_double("1.23e2"));
}
#[test]
fn test_convert_to_integer_integration() {
    assert_eq!(123, convert_to_integer("123"));
    assert_eq!(123, convert_to_integer("123.456"));
    assert_eq!(-123, convert_to_integer("-123"));
    assert_eq!(-123, convert_to_integer("-123.456"));
    assert_eq!(123, convert_to_integer("123."));
    assert_eq!(123, convert_to_integer("000123.456"));
    assert_eq!(123, convert_to_integer("123.456000"));
}
#[test]
fn test_index_of_integration() {
    assert_eq!(0, index_of("splashkit library", "splashkit"));
    assert_eq!(10, index_of("splashkit library", "library"));
    assert_eq!(7, index_of("splashkit library", "it lib"));
    assert_eq!(-1, index_of("splashkit library", "unreal"));
    assert_eq!(0, index_of("splashkit library", "splashkit library"));
    assert_eq!(-1, index_of("splashkit library", "splashkit library is the best"));
    assert_eq!(0, index_of("splashkit library", ""));
    assert_eq!(-1, index_of("", "splashkit"));
    assert_eq!(0, index_of("", ""));
}
#[test]
fn test_is_double_integration() {
    assert!(is_double("123.456"));
    assert!(is_double("123"));
    assert!(is_double("-123.456"));
    assert!(is_double("-123"));
    assert!(is_double("123."));
    assert!(is_double("000123.456"));
    assert!(is_double("123.456000"));
    assert!(!is_double(".456"));
    assert!(!is_double("SplashKit"));
    assert!(!is_double(""));
}
#[test]
fn test_is_integer_integration() {
    assert!(is_integer("123"));
    assert!(is_integer("-123"));
    assert!(!is_integer("123.456"));
    assert!(!is_integer("-123.456"));
    assert!(!is_integer(".456"));
    assert!(!is_integer("SplashKit"));
    assert!(!is_integer(""));
}
#[test]
fn test_is_number_integration() {
    assert!(is_number("123"));
    assert!(is_number("123.456"));
    assert!(is_number("-123"));
    assert!(is_number("-123.456"));
    assert!(!is_number("SplashKit"));
    assert!(!is_number(""));
}
#[test]
fn test_length_of_integration() {
    assert_eq!(9, length_of("splashkit"));
    assert_eq!(0, length_of(""));
}
#[test]
fn test_replace_all_integration() {
    assert_eq!("SK library", replace_all("splashkit library", "splashkit", "SK"));
    assert_eq!("splashkit lib", replace_all("splashkit library", "library", "lib"));
    assert_eq!("splashkitlibrary", replace_all("splashkit library", "it lib", "itlib"));
    assert_eq!("splashkit library", replace_all("splashkit library", "unreal", "tournament"));
    assert_eq!("SK", replace_all("splashkit library", "splashkit library", "SK"));
    assert_eq!(" library", replace_all("splashkit library", "splashkit", ""));
    assert_eq!("splashkit library", replace_all("splashkit library", "", "SK"));
    assert_eq!("", replace_all("", "", "SK"));
}
#[test]
fn test_split_integration() {
    let result = split("splashkit library", ' ');
    assert_eq!(vec!["splashkit", "library"], result);
    assert_eq!(vec![""], split("", ' '));
    assert_eq!(vec!["splashkit library"], split("splashkit library", ','));
    assert_eq!(vec!["", "splashkit library"], split(",splashkit library", ','));
    assert_eq!(vec!["splashkit library", ""], split("splashkit library,", ','));
    assert_eq!(vec!["", "splashkit library", ""], split(",splashkit library,", ','));
    assert_eq!(vec!["splashkit", "", "library"], split("splashkit,,library", ','));
}
#[test]
fn test_to_lowercase_integration() {
    assert_eq!("splashkit", to_lowercase("SPLASHKIT"));
    assert_eq!("", to_lowercase(""));
    assert_eq!("splashkit", to_lowercase("splashkit"));
    assert_eq!("splashkit", to_lowercase("SpLaShKiT"));
}
#[test]
fn test_to_uppercase_integration() {
    assert_eq!("SPLASHKIT", to_uppercase("splashkit"));
    assert_eq!("", to_uppercase(""));
    assert_eq!("SPLASHKIT", to_uppercase("SPLASHKIT"));
    assert_eq!("SPLASHKIT", to_uppercase("SpLaShKiT"));
}
#[test]
fn test_trim_integration() {
    assert_eq!("splashkit", trim("  splashkit"));
    assert_eq!("splashkit", trim("splashkit  "));
    assert_eq!("splashkit", trim("  splashkit  "));
    assert_eq!("splashkit", trim("splashkit"));
    assert_eq!("", trim(""));
}
#[test]
fn test_rnd_range_integration() {
    assert!((-1..=5).contains(&rnd_range(-1, 5)));
    assert_eq!(1, rnd_range(1, 1));
    assert!((1..=5).contains(&rnd_range(5, 1)));
}
#[test]
fn test_rnd_integration() {
    assert!((0.0..=).contains(&rnd()));
}
#[test]
fn test_rnd_int_integration() {
    assert!((0..=1).contains(&rnd_int(1)));
    assert!((0..=10).contains(&rnd_int(10)));
    assert_eq!(0, rnd_int(-1));
    assert_eq!(0, rnd_int(0));
}
#[test]
fn test_current_ticks_integration() {
    let test_ticks = current_ticks();
    assert!(test_ticks > 0);
}
#[test]
fn test_delay_integration() {
    let test_timer = create_timer("test_timer");
    start_timer(test_timer);
    let initial_ticks = timer_ticks(test_timer);
    delay(200);
    assert!(initial_ticks + 200 < timer_ticks(test_timer));
}
#[test]
fn test_display_dialog_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_font = load_font("test_font", "hara.ttf");
    display_dialog("Test Dialog", "This is a test message", test_font, 20);
    free_font(test_font);
    close_window(test_window);
}
#[test]
fn test_file_as_string_integration() {
    assert_eq!("BITMAP,ufo,ufo.png\n", file_as_string("blah.txt", ResourceKind::BundleResource));
    assert_eq!("", file_as_string("", ResourceKind::BundleResource));
    assert_eq!("", file_as_string("invalid.txt", ResourceKind::BundleResource));
}
}
