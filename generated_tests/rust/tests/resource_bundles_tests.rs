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
fn test_free_resource_bundle_integration() {
    load_resource_bundle("test", "test.txt");
    assert!(has_resource_bundle("test"));
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
    load_resource_bundle("test_bundle", "test_bundle.txt");
    assert!(has_resource_bundle("test_bundle"));
    free_resource_bundle("test_bundle");
    assert!(!has_resource_bundle("test_bundle"));
}
