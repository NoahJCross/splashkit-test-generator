use std::*;
use splashkit::*;
use splashkit_tests::helpers::*;
#[cfg(test)]
use ctor::ctor;
mod test_resources {
    use super::*;
    #[test]
    fn test_deregister_free_notifier_integration() {
        let free_notifier = NotifierTracker::new();
        register_free_notifier(free_notifier.on_free);
        let test_bitmap1 = create_bitmap("test_bitmap".to_string(), 100, 100);
        let _cleanup_bitmap = BitmapCleanup::new();
        free_bitmap(test_bitmap1);
        assert!(free_notifier.was_notified);
        deregister_free_notifier(free_notifier.on_free);
        free_notifier.reset();
        let test_bitmap2 = create_bitmap("test_bitmap".to_string(), 100, 100);
        free_bitmap(test_bitmap2);
        assert!(!free_notifier.was_notified);
    }
    #[test]
    fn test_path_to_resource_integration() {
        set_resources_path("resources".to_string());
        let image_path = path_to_resource("test_image.png".to_string(), ResourceKind::ImageResource);
        assert_ne!("".to_string(), image_path);
    }
    #[test]
    fn test_path_to_resources_integration() {
        let resource_path = path_to_resources();
        assert!(!resource_path.is_empty());
        set_resources_path("/new/resources".to_string());
        let new_resource_path = path_to_resources();
        assert_eq!("/new/resources".to_string(), new_resource_path);
    }
    #[test]
    fn test_path_to_resources_for_kind_integration() {
        set_resources_path("resources".to_string());
        let image_path = path_to_resources_for_kind(ResourceKind::ImageResource);
        assert_eq!("resources/images".to_string(), image_path);
        let sound_path = path_to_resources_for_kind(ResourceKind::SoundResource);
        assert_eq!("resources/sounds".to_string(), sound_path);
    }
    #[test]
    fn test_register_free_notifier_integration() {
        let free_notifier = NotifierTracker::new();
        register_free_notifier(free_notifier.on_free);
        let test_bitmap = create_bitmap("test_bitmap".to_string(), 100, 100);
        let _cleanup_bitmap = BitmapCleanup::new();
        free_bitmap(test_bitmap);
        assert!(free_notifier.was_notified);
        deregister_free_notifier(free_notifier.on_free);
    }
    #[test]
    fn test_set_resources_path_integration() {
        set_resources_path("/resources".to_string());
        assert_eq!("/resources".to_string(), path_to_resources());
        set_resources_path("/new/resources".to_string());
        assert_eq!("/new/resources".to_string(), path_to_resources());
    }
}
