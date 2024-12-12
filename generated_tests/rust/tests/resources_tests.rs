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
mod test_resources {
use super::*;
#[test]
fn test_deregister_free_notifier_integration() {
    let free_notifier = notifier_tracker::new();
    register_free_notifier(free_notifier.on_free);
    deregister_free_notifier(free_notifier.on_free);
    assert!(free_notifier.was_notified);
}
#[test]
fn test_path_to_resource_integration() {
    set_resources_path("resources");
    let image_path = path_to_resource("test_image.png", ResourceKind::ImageResource);
    assert_ne!("", image_path);
    let text_path = path_to_resource("nonexistent_file.txt", ResourceKind::AnimationResource);
    assert_eq!("", text_path);
}
#[test]
fn test_path_to_resources_integration() {
    let resource_path = path_to_resources();
    assert!(resource_path.is_some());
    set_resources_path("/new/resources");
    let new_resource_path = path_to_resources();
    assert_eq!("/new/resources", new_resource_path);
}
#[test]
fn test_path_to_resources_for_kind_integration() {
    set_resources_path("resources");
    let image_path = path_to_resources_for_kind(ResourceKind::ImageResource);
    assert_eq!("resources/images", image_path);
    let sound_path = path_to_resources_for_kind(ResourceKind::SoundResource);
    assert_eq!("resources/sounds", sound_path);
}
#[test]
fn test_register_free_notifier_integration() {
    let free_notifier = notifier_tracker::new();
    register_free_notifier(free_notifier.on_free);
    assert!(free_notifier.was_notified);
    deregister_free_notifier(free_notifier.on_free);
    assert!(!free_notifier.was_notified);
}
#[test]
fn test_set_resources_path_integration() {
    set_resources_path("/resources");
    assert_eq!("/resources", path_to_resources());
    set_resources_path("/new/resources");
    assert_eq!("/new/resources", path_to_resources());
}
}
