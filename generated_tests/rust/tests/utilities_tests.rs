use std::*;
use splashkit::*;
use splashkit_tests::helpers::*;
#[cfg(test)]
use ctor::ctor;
mod test_utilities {
    use super::*;
    #[ctor]
    fn setup()
    {
        set_resources_path("/mnt/c/Users/Noahc/Documents/aYear_2_semester_2/TeamProject/GitHubRepo/splashkit_test_generator/resources".to_string());
    }
    #[test]
    fn test_contains_integration() {
        assert!(contains("splashkit library".to_string(), "splashkit".to_string()));
        assert!(contains("splashkit library".to_string(), "library".to_string()));
        assert!(contains("splashkit library".to_string(), "it lib".to_string()));
        assert!(contains("splashkit library".to_string(), "".to_string()));
        assert!(!contains("splashkit library".to_string(), "unreal".to_string()));
        assert!(!contains("".to_string(), "splashkit".to_string()));
    }
    #[test]
    fn test_convert_to_double_integration() {
        assert_eq!(123.0, convert_to_double("123".to_string()));
        assert_eq!(123.456, convert_to_double("123.456".to_string()));
        assert_eq!(-123.0, convert_to_double("-123".to_string()));
        assert_eq!(-123.456, convert_to_double("-123.456".to_string()));
        assert_eq!(0.456, convert_to_double(".456".to_string()));
        assert_eq!(123.0, convert_to_double("123.".to_string()));
        assert_eq!(123.456, convert_to_double("000123.456".to_string()));
        assert_eq!(123.456, convert_to_double("123.456000".to_string()));
        assert_eq!(f64::INFINITY, convert_to_double("inf".to_string()));
        assert_eq!(f64::NEG_INFINITY, convert_to_double("-inf".to_string()));
        assert_eq!(123.0, convert_to_double("1.23e2".to_string()));
    }
    #[test]
    fn test_convert_to_integer_integration() {
        assert_eq!(123, convert_to_integer("123".to_string()));
        assert_eq!(123, convert_to_integer("123.456".to_string()));
        assert_eq!(-123, convert_to_integer("-123".to_string()));
        assert_eq!(-123, convert_to_integer("-123.456".to_string()));
        assert_eq!(123, convert_to_integer("123.".to_string()));
        assert_eq!(123, convert_to_integer("000123.456".to_string()));
        assert_eq!(123, convert_to_integer("123.456000".to_string()));
    }
    #[test]
    fn test_index_of_integration() {
        assert_eq!(0, index_of("splashkit library".to_string(), "splashkit".to_string()));
        assert_eq!(10, index_of("splashkit library".to_string(), "library".to_string()));
        assert_eq!(7, index_of("splashkit library".to_string(), "it lib".to_string()));
        assert_eq!(-1, index_of("splashkit library".to_string(), "unreal".to_string()));
        assert_eq!(0, index_of("splashkit library".to_string(), "splashkit library".to_string()));
        assert_eq!(-1, index_of("splashkit library".to_string(), "splashkit library is the best".to_string()));
        assert_eq!(0, index_of("splashkit library".to_string(), "".to_string()));
        assert_eq!(-1, index_of("".to_string(), "splashkit".to_string()));
        assert_eq!(0, index_of("".to_string(), "".to_string()));
    }
    #[test]
    fn test_is_double_integration() {
        assert!(is_double("123.456".to_string()));
        assert!(is_double("123".to_string()));
        assert!(is_double("-123.456".to_string()));
        assert!(is_double("-123".to_string()));
        assert!(is_double("123.".to_string()));
        assert!(is_double("000123.456".to_string()));
        assert!(is_double("123.456000".to_string()));
        assert!(!is_double(".456".to_string()));
        assert!(!is_double("SplashKit".to_string()));
        assert!(!is_double("".to_string()));
    }
    #[test]
    fn test_is_integer_integration() {
        assert!(is_integer("123".to_string()));
        assert!(is_integer("-123".to_string()));
        assert!(!is_integer("123.456".to_string()));
        assert!(!is_integer("-123.456".to_string()));
        assert!(!is_integer(".456".to_string()));
        assert!(!is_integer("SplashKit".to_string()));
        assert!(!is_integer("".to_string()));
    }
    #[test]
    fn test_is_number_integration() {
        assert!(is_number("123".to_string()));
        assert!(is_number("123.456".to_string()));
        assert!(is_number("-123".to_string()));
        assert!(is_number("-123.456".to_string()));
        assert!(!is_number("SplashKit".to_string()));
        assert!(!is_number("".to_string()));
    }
    #[test]
    fn test_length_of_integration() {
        assert_eq!(9, length_of("splashkit".to_string()));
        assert_eq!(0, length_of("".to_string()));
    }
    #[test]
    fn test_replace_all_integration() {
        assert_eq!("SK library".to_string(), replace_all("splashkit library".to_string(), "splashkit".to_string(), "SK".to_string()));
        assert_eq!("splashkit lib".to_string(), replace_all("splashkit library".to_string(), "library".to_string(), "lib".to_string()));
        assert_eq!("splashkitlibrary".to_string(), replace_all("splashkit library".to_string(), "it lib".to_string(), "itlib".to_string()));
        assert_eq!("splashkit library".to_string(), replace_all("splashkit library".to_string(), "unreal".to_string(), "tournament".to_string()));
        assert_eq!("SK".to_string(), replace_all("splashkit library".to_string(), "splashkit library".to_string(), "SK".to_string()));
        assert_eq!(" library".to_string(), replace_all("splashkit library".to_string(), "splashkit".to_string(), "".to_string()));
        assert_eq!("splashkit library".to_string(), replace_all("splashkit library".to_string(), "".to_string(), "SK".to_string()));
        assert_eq!("".to_string(), replace_all("".to_string(), "".to_string(), "SK".to_string()));
    }
    #[test]
    fn test_split_integration() {
        let result = split("splashkit library".to_string(), ' ');
        assert_eq!(vec!["splashkit".to_string(), "library".to_string()], result);
        assert_eq!(vec!["".to_string()], split("".to_string(), ' '));
        assert_eq!(vec!["splashkit library".to_string()], split("splashkit library".to_string(), ','));
        assert_eq!(vec!["".to_string(), "splashkit library".to_string()], split(",splashkit library".to_string(), ','));
        assert_eq!(vec!["splashkit library".to_string(), "".to_string()], split("splashkit library,".to_string(), ','));
        assert_eq!(vec!["".to_string(), "splashkit library".to_string(), "".to_string()], split(",splashkit library,".to_string(), ','));
        assert_eq!(vec!["splashkit".to_string(), "".to_string(), "library".to_string()], split("splashkit,,library".to_string(), ','));
    }
    #[test]
    fn test_to_lowercase_integration() {
        assert_eq!("splashkit".to_string(), to_lowercase("SPLASHKIT".to_string()));
        assert_eq!("".to_string(), to_lowercase("".to_string()));
        assert_eq!("splashkit".to_string(), to_lowercase("splashkit".to_string()));
        assert_eq!("splashkit".to_string(), to_lowercase("SpLaShKiT".to_string()));
    }
    #[test]
    fn test_to_uppercase_integration() {
        assert_eq!("SPLASHKIT".to_string(), to_uppercase("splashkit".to_string()));
        assert_eq!("".to_string(), to_uppercase("".to_string()));
        assert_eq!("SPLASHKIT".to_string(), to_uppercase("SPLASHKIT".to_string()));
        assert_eq!("SPLASHKIT".to_string(), to_uppercase("SpLaShKiT".to_string()));
    }
    #[test]
    fn test_trim_integration() {
        assert_eq!("splashkit".to_string(), trim("  splashkit".to_string()));
        assert_eq!("splashkit".to_string(), trim("splashkit  ".to_string()));
        assert_eq!("splashkit".to_string(), trim("  splashkit  ".to_string()));
        assert_eq!("splashkit".to_string(), trim("splashkit".to_string()));
        assert_eq!("".to_string(), trim("".to_string()));
    }
    #[test]
    fn test_rnd_range_integration() {
        assert!((-1..=5).contains(&rnd_range(-1, 5)));
        assert_eq!(1, rnd_range(1, 1));
        assert!((1..=5).contains(&rnd_range(5, 1)));
    }
    #[test]
    fn test_rnd_integration() {
        assert!((0.0..=f32::MAX).contains(&rnd()));
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
        let test_timer = create_timer("test_timer".to_string());
        let _cleanup_timer = TimerCleanup::new();
        start_timer(test_timer);
        let initial_ticks = timer_ticks(test_timer);
        delay(200);
        assert!(initial_ticks + 200 < timer_ticks(test_timer));
    }
    #[test]
    fn test_display_dialog_integration() {
        let test_window = open_window("Test Window".to_string(), 800, 600);
        let _cleanup_window = WindowCleanup::new();
        let test_font = load_font("test_font".to_string(), "hara.ttf".to_string());
        let _cleanup_font = FontCleanup::new();
        display_dialog("Test Dialog".to_string(), "This is a test message".to_string(), test_font, 20);
        free_font(test_font);
    }
    #[test]
    fn test_file_as_string_integration() {
        assert_eq!("BITMAP,ufo,ufo.png\n".to_string(), file_as_string("blah.txt".to_string(), ResourceKind::BundleResource));
        assert_eq!("".to_string(), file_as_string("".to_string(), ResourceKind::BundleResource));
        assert_eq!("".to_string(), file_as_string("invalid.txt".to_string(), ResourceKind::BundleResource));
    }
}
