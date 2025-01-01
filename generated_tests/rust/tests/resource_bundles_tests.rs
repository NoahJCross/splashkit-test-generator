use std::*;
use splashkit::*;
use splashkit_tests::helpers::*;
#[cfg(test)]
use ctor::ctor;
mod test_resource_bundles {
    use super::*;
    #[ctor]
    fn setup()
    {
        set_resources_path("/mnt/c/Users/Noahc/Documents/aYear_2_semester_2/TeamProject/GitHubRepo/splashkit_test_generator/resources".to_string());
    }
    #[test]
    fn test_free_resource_bundle_integration() {
        load_resource_bundle("test_resource_bundle".to_string(), "test.txt".to_string());
        let _cleanup_resource = ResourceCleanup::new("test_resource_bundle".to_string());
        assert!(has_resource_bundle("test_resource_bundle".to_string()));
        assert!(has_bitmap("FrogBmp".to_string()));
        assert!(has_font_name_as_string("hara".to_string()));
        free_resource_bundle("test_resource_bundle".to_string());
        assert!(!has_resource_bundle("test_resource_bundle".to_string()));
    }
    #[test]
    fn test_has_resource_bundle_integration() {
        load_resource_bundle("test_resource_bundle".to_string(), "test.txt".to_string());
        let _cleanup_resource = ResourceCleanup::new("test_resource_bundle".to_string());
        assert!(has_resource_bundle("test_resource_bundle".to_string()));
        free_resource_bundle("test_resource_bundle".to_string());
        assert!(!has_resource_bundle("test_resource_bundle".to_string()));
        assert!(!has_resource_bundle("nonexistent".to_string()));
    }
    #[test]
    fn test_load_resource_bundle_integration() {
        load_resource_bundle("test_resource_bundle".to_string(), "test.txt".to_string());
        let _cleanup_resource = ResourceCleanup::new("test_resource_bundle".to_string());
        assert!(has_resource_bundle("test_resource_bundle".to_string()));
        assert!(has_animation_script("WalkingScript".to_string()));
        assert!(has_bitmap("FrogBmp".to_string()));
        assert!(has_font_name_as_string("hara".to_string()));
        assert!(has_sound_effect("error".to_string()));
        assert!(has_timer__named("my timer".to_string()));
        assert!(has_resource_bundle("blah".to_string()));
        free_resource_bundle("test_resource_bundle".to_string());
        assert!(!has_resource_bundle("test_bundle".to_string()));
    }
}
