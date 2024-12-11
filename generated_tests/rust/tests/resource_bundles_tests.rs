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
mod test_resource_bundles {
use super::*;
#[test]
fn test_free_resource_bundle_integration() {
    load_resource_bundle("test", "test.txt");
    assert!(has_resource_bundle("test"));
    assert!(has_bitmap("FrogBmp"));
    assert!(has_font("hara"));
    free_resource_bundle("test");
    assert!(!has_resource_bundle("test"));
}
#[test]
fn test_has_resource_bundle_integration() {
    load_resource_bundle("test", "test.txt");
    assert!(has_resource_bundle("test"));
    free_resource_bundle("test");
    assert!(!has_resource_bundle("test"));
    assert!(!has_resource_bundle("nonexistent"));
}
#[test]
fn test_load_resource_bundle_integration() {
    load_resource_bundle("test", "test.txt");
    assert!(has_resource_bundle("test"));
    assert!(has_animation_script("WalkingScript"));
    assert!(has_bitmap("FrogBmp"));
    assert!(has_font("hara"));
    assert!(has_sound_effect("error"));
    assert!(has_timer_named("my timer"));
    assert!(has_resource_bundle("blah"));
    free_resource_bundle("test");
    assert!(!has_resource_bundle("test_bundle"));
}
}
