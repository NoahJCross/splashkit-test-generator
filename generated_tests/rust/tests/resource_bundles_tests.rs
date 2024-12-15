use std::*;
use splashkit::*;
#[cfg(test)]
mod test_resource_bundles {
use super::*;
#[test]
fn test_free_resource_bundle_integration() {
    load_resource_bundle("test".to_string(), "test.txt".to_string());
    assert!(has_resource_bundle("test".to_string()));
    assert!(has_bitmap("FrogBmp".to_string()));
    assert!(has_font_name_as_string("hara".to_string()));
    free_resource_bundle("test".to_string());
    assert!(!has_resource_bundle("test".to_string()));
}
#[test]
fn test_has_resource_bundle_integration() {
    load_resource_bundle("test".to_string(), "test.txt".to_string());
    assert!(has_resource_bundle("test".to_string()));
    free_resource_bundle("test".to_string());
    assert!(!has_resource_bundle("test".to_string()));
    assert!(!has_resource_bundle("nonexistent".to_string()));
}
#[test]
fn test_load_resource_bundle_integration() {
    load_resource_bundle("test".to_string(), "test.txt".to_string());
    assert!(has_resource_bundle("test".to_string()));
    assert!(has_animation_script("WalkingScript".to_string()));
    assert!(has_bitmap("FrogBmp".to_string()));
    assert!(has_font_name_as_string("hara".to_string()));
    assert!(has_sound_effect("error".to_string()));
    assert!(has_timer__named("my timer".to_string()));
    assert!(has_resource_bundle("blah".to_string()));
    free_resource_bundle("test".to_string());
    assert!(!has_resource_bundle("test_bundle".to_string()));
}
}
