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
fn test_contains_integration() {
    let test_result = contains("SplashKit is awesome", "awesome");
    assert!(test_result);
    let test_result = contains("SplashKit is awesome", "unreal");
    assert!(!test_result);
}
#[test]
fn test_convert_to_double_integration() {
    let test_result = convert_to_double("123.456");
    assert_eq!(test_result, 123.456);
    let test_result = convert_to_double("-123.456");
    assert_eq!(test_result, -123.456);
    let test_result = convert_to_double("invalid");
    assert!(test_result.is_none());
}
#[test]
fn test_convert_to_integer_integration() {
    let test_result = convert_to_integer("123");
    assert_eq!(test_result, 123);
    let test_result = convert_to_integer("-456");
    assert_eq!(test_result, -456);
    let test_result = convert_to_integer("123.456");
    assert_eq!(test_result, 123);
    let test_result = convert_to_integer("abc");
    assert!(std::panic::catch_unwind(|| { convert_to_integer("abc") }).is_err());
}
#[test]
fn test_index_of_integration() {
    let test_result = index_of("splashkit library", "library");
    assert_eq!(test_result, 10);
    let test_result = index_of("splashkit library", "unreal");
    assert_eq!(test_result, -1);
}
#[test]
fn test_is_double_integration() {
    let test_result = is_double("123.456");
    assert!(test_result);
    let test_result = is_double("123");
    assert!(test_result);
    let test_result = is_double("-123.456");
    assert!(test_result);
    let test_result = is_double("SplashKit");
    assert!(!test_result);
    let test_result = is_double("");
    assert!(!test_result);
}
#[test]
fn test_is_integer_integration() {
    let test_result = is_integer("123");
    assert!(test_result);
    let test_result = is_integer("123.456");
    assert!(!test_result);
    let test_result = is_integer("-123");
    assert!(test_result);
    let test_result = is_integer("SplashKit");
    assert!(!test_result);
    let test_result = is_integer("");
    assert!(!test_result);
}
#[test]
fn test_is_number_integration() {
    let test_result = is_number("123.456");
    assert!(test_result);
    let test_result = is_number("abc");
    assert!(!test_result);
}
#[test]
fn test_length_of_integration() {
    let test_length = length_of("SplashKit");
    assert_eq!(test_length, 9);
    let test_length_empty = length_of("");
    assert_eq!(test_length_empty, 0);
}
#[test]
fn test_replace_all_integration() {
    let test_result = replace_all("hello world", "world", "SplashKit");
    assert_eq!(test_result, "hello SplashKit");
    let test_result = replace_all("aaaa", "a", "b");
    assert_eq!(test_result, "bbbb");
    let test_result = replace_all("test", "t", "");
    assert_eq!(test_result, "es");
}
#[test]
fn test_split_integration() {
    let test_result = split("splashkit library", " ");
    assert_eq!(length_of(test_result), 2);
    assert_eq!(index_of(test_result, "splashkit"), 0);
    assert_eq!(index_of(test_result, "library"), 0);
}
#[test]
fn test_to_lowercase_integration() {
    let test_lowercase = to_lowercase("SPLASHKIT");
    assert_eq!(test_lowercase, "splashkit");
    let test_empty = to_lowercase("");
    assert_eq!(test_empty, "");
}
#[test]
fn test_to_uppercase_integration() {
    let test_uppercase = to_uppercase("hello");
    assert_eq!(test_uppercase, "HELLO");
}
#[test]
fn test_trim_integration() {
    let test_trimmed = trim("  Hello, World!  ");
    assert_eq!(test_trimmed, "Hello, World!");
    let test_empty_trimmed = trim(" \t\n  ");
    assert_eq!(test_empty_trimmed, "");
}
#[test]
fn test_rnd_range_integration() {
    let test_result = rnd_range(1, 10);
    assert!((1..=10).contains(&test_result));
}
#[test]
fn test_rnd_integration() {
    let test_random = rnd();
    assert!(test_random > 0.0);
    assert!(test_random < 1.0);
}
#[test]
fn test_rnd_int_integration() {
    let test_result = rnd_int(10);
    assert!((0..=10).contains(&test_result));
}
#[test]
fn test_current_ticks_integration() {
    let test_ticks = current_ticks();
    assert!(test_ticks > 0);
}
#[test]
fn test_delay_integration() {
    let test_start_time = current_ticks();
    delay(1000);
    let test_end_time = current_ticks();
    assert!(current_ticks() > test_start_time);
    assert!((test_start_time..=1100).contains(&current_ticks()));
}
#[test]
fn test_display_dialog_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_font = load_font("test_font", "path/to/font.ttf");
    display_dialog("Test Title", "This is a test message.", test_font, 12);
    free_font(test_font);
    close_window(test_window);
}
#[test]
fn test_file_as_string_integration() {
    let test_file_content = file_as_string("test_file.txt", ResourceKind::BundleResource);
    assert_ne!(test_file_content, "");
}
