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
fn test_animation_count_integration() {
    let script = load_animation_script("kermit", "kermit.txt");
    let count = animation_count(script);
    assert!(count > 0);
    free_animation_script(script);
}
#[test]
fn test_animation_current_cell_integration() {
    let kermit_script = load_animation_script("kermit", "kermit.txt");
    let anim = create_animation(kermit_script, "moonwalkback");
    let current_cell = animation_current_cell(anim);
    assert!(current_cell > -1);
    free_animation(anim);
    free_animation_script(kermit_script);
}
#[test]
fn test_animation_current_vector_integration() {
    let kermit_script = load_animation_script("kermit", "kermit.txt");
    let anim = create_animation(kermit_script, "moonwalkback");
    let current_vector = animation_current_vector(anim);
    assert_eq!(0, current_vector.x);
    assert_eq!(0, current_vector.y);
    free_animation(anim);
    free_animation_script(kermit_script);
}
#[test]
fn test_animation_ended_integration() {
    let kermit_script = load_animation_script("kermit", "kermit.txt");
    let anim = create_animation(kermit_script, "moonwalkback");
    assert!(!animation_ended(anim));
    update_animation(anim);
    assert!(!animation_ended(anim));
    update_animation(anim);
    assert!(animation_ended(anim));
    free_animation(anim);
    free_animation_script(kermit_script);
}
#[test]
fn test_animation_entered_frame_integration() {
    let kermit_script = load_animation_script("kermit", "kermit.txt");
    let anim = create_animation(kermit_script, "walkfront");
    update_animation_percent(anim, 20);
    assert!(animation_entered_frame(anim));
    update_animation(anim);
    assert!(!animation_entered_frame(anim));
    free_animation(anim);
    free_animation_script(kermit_script);
}
#[test]
fn test_animation_frame_time_integration() {
    let kermit_script = load_animation_script("kermit", "kermit.txt");
    let anim = create_animation(kermit_script, "walkfront");
    update_animation(anim);
    let frame_time = animation_frame_time(anim);
    assert!(frame_time > 0);
    free_animation(anim);
    free_animation_script(kermit_script);
}
#[test]
fn test_animation_index_integration() {
    let script = load_animation_script("kermit", "kermit.txt");
    let index = animation_index(script, "walkfront");
    assert!(index > -1);
    let non_existent_index = animation_index(script, "NonExistentAnimation");
    assert_eq!(-1, non_existent_index);
    free_animation_script(script);
}
#[test]
fn test_animation_name_integration() {
    let kermit_script = load_animation_script("kermit", "kermit.txt");
    let anim = create_animation(kermit_script, "moonwalkback");
    let anim_name = animation_name(anim);
    assert_eq!("moonwalkback", anim_name);
    free_animation(anim);
    free_animation_script(kermit_script);
}
#[test]
fn test_animation_script_name_integration() {
    let kermit_script = load_animation_script("kermit", "kermit.txt");
    let script_name = animation_script_name(kermit_script);
    assert_eq!("kermit", script_name);
    free_animation_script(kermit_script);
}
#[test]
fn test_animation_script_named_integration() {
    let kermit_script = load_animation_script("kermit", "kermit.txt");
    let loaded_script = animation_script_named("kermit");
    assert!(loaded_script.is_some());
    let script_name = animation_script_name(loaded_script);
    assert_eq!("kermit", script_name);
    free_animation_script(kermit_script);
}
#[test]
fn test_assign_animation_with_script_integration() {
    let kermit_script = load_animation_script("kermit", "kermit.txt");
    let anim = create_animation(kermit_script, "moonwalkback");
    assign_animation_with_script(anim, kermit_script, "walkfront");
    assert_eq!("walkfront", animation_name(anim));
    free_animation_script(kermit_script);
    free_animation(anim);
}
#[test]
fn test_assign_animation_with_script_and_sound_integration() {
    let kermit_script = load_animation_script("kermit", "kermit.txt");
    let anim = create_animation(kermit_script, "walkfront");
    assign_animation_with_script_and_sound(anim, kermit_script, "walkleft", true);
    assert_eq!("walkleft", animation_name(anim));
    free_animation(anim);
    free_animation_script(kermit_script);
}
#[test]
fn test_assign_animation_index_with_script_integration() {
    let kermit_script = load_animation_script("kermit", "kermit.txt");
    let anim = create_animation(kermit_script, "moonwalkback");
    assign_animation(anim, kermit_script, 0);
    assert_eq!("walkfront", animation_name(anim));
    free_animation_script(kermit_script);
    free_animation(anim);
}
#[test]
fn test_assign_animation_index_with_script_and_sound_integration() {
    let kermit_script = load_animation_script("kermit", "kermit.txt");
    let anim = create_animation(kermit_script, "moonwalkback");
    assign_animation_index_with_script_and_sound(anim, kermit_script, 0, true);
    assert_eq!("walkfront", animation_name(anim));
    free_animation_script(kermit_script);
    free_animation(anim);
}
#[test]
fn test_assign_animation_with_script_named_integration() {
    let kermit_script = load_animation_script("kermit", "kermit.txt");
    let anim = create_animation(kermit_script, "moonwalkback");
    assign_animation_with_script_named(anim, "kermit", "walkfront");
    assert_eq!("walkfront", animation_name(anim));
    free_animation_script(kermit_script);
    free_animation(anim);
}
#[test]
fn test_assign_animation_with_script_named_and_sound_integration() {
    let kermit_script = load_animation_script("kermit", "kermit.txt");
    let anim = create_animation(kermit_script, "walkfront");
    assign_animation_with_script_named_and_sound(anim, "kermit", "walkfront", true);
    assert_eq!("walkfront", animation_name(anim));
    free_animation(anim);
    free_animation_script(kermit_script);
}
#[test]
fn test_assign_animation_index_integration() {
    let kermit_script = load_animation_script("kermit", "kermit.txt");
    let anim = create_animation(kermit_script, "moonwalkback");
    assign_animation(anim, 0);
    assert_eq!(0, animation_current_cell(anim));
    free_animation(anim);
    free_animation_script(kermit_script);
}
#[test]
fn test_assign_animation_index_with_sound_integration() {
    let kermit_script = load_animation_script("kermit", "kermit.txt");
    let anim = create_animation(kermit_script, "moonwalkback", false);
    assign_animation_index_with_sound(anim, 0, true);
    assert!(animation_entered_frame(anim));
    free_animation_script(kermit_script);
    free_animation(anim);
}
#[test]
fn test_assign_animation_integration() {
    let kermit_script = load_animation_script("kermit", "kermit.txt");
    let anim = create_animation(kermit_script, "moonwalkback");
    assign_animation(anim, "walkfront");
    assert_eq!("walkfront", animation_name(anim));
    free_animation(anim);
    free_animation_script(kermit_script);
}
#[test]
fn test_assign_animation_with_sound_integration() {
    let kermit_script = load_animation_script("kermit", "kermit.txt");
    let anim = create_animation(kermit_script, "moonwalkback");
    assign_animation_with_sound(anim, "walkfront", true);
    assert_eq!("walkfront", animation_name(anim));
    free_animation_script(kermit_script);
    free_animation(anim);
}
#[test]
fn test_create_animation_from_index_with_sound_integration() {
    let kermit_script = load_animation_script("kermit", "kermit.txt");
    let anim = create_animation_from_index_with_sound(kermit_script, 0, true);
    assert!(anim.is_some());
    let anim_name = animation_name(anim);
    assert_eq!("walkfront", anim_name);
    free_animation(anim);
    free_animation_script(kermit_script);
}
#[test]
fn test_create_animation_integration() {
    let kermit_script = load_animation_script("kermit", "kermit.txt");
    let anim = create_animation(kermit_script, "moonwalkback");
    assert!(anim.is_some());
    let anim_name = animation_name(anim);
    assert_eq!("moonwalkback", anim_name);
    free_animation(anim);
    free_animation_script(kermit_script);
}
#[test]
fn test_create_animation_with_sound_integration() {
    let kermit_script = load_animation_script("kermit", "kermit.txt");
    let anim = create_animation_with_sound(kermit_script, "moonwalkback", true);
    assert!(anim.is_some());
    let anim_name = animation_name(anim);
    assert_eq!("moonwalkback", anim_name);
    free_animation_script(kermit_script);
    free_animation(anim);
}
#[test]
fn test_create_animation_from_script_named_integration() {
    let kermit_script = load_animation_script("kermit", "kermit.txt");
    let anim = create_animation_from_script_named("kermit", "moonwalkback");
    assert!(anim.is_some());
    let anim_name = animation_name(anim);
    assert_eq!("moonwalkback", anim_name);
    free_animation(anim);
    free_animation_script(kermit_script);
}
#[test]
fn test_create_animation_from_script_named_with_sound_integration() {
    let kermit_script = load_animation_script("kermit", "kermit.txt");
    let anim = create_animation_from_script_named_with_sound(kermit_script, "moonwalkback", true);
    assert!(anim.is_some());
    let anim_name = animation_name(anim);
    assert_eq!("moonwalkback", anim_name);
    free_animation_script(kermit_script);
    free_animation(anim);
}
#[test]
fn test_free_all_animation_scripts_integration() {
    let kermit_script = load_animation_script("kermit", "kermit.txt");
    assert!(has_animation_script("kermit"));
    free_all_animation_scripts();
    assert!(!has_animation_script("kermit"));
}
#[test]
fn test_free_animation_integration() {
    let kermit_script = load_animation_script("kermit", "kermit.txt");
    let anim = create_animation(kermit_script, "moonwalkback");
    free_animation(anim);
    assert!(anim.is_none());
    free_animation_script(kermit_script);
}
#[test]
fn test_free_animation_script_integration() {
    let script = load_animation_script("kermit", "kermit.txt");
    assert!(script.is_some());
    free_animation_script(script);
    let script_exists = has_animation_script("kermit");
    assert!(!script_exists);
}
#[test]
fn test_free_animation_script_with_name_integration() {
    let kermit_script = load_animation_script("kermit", "kermit.txt");
    assert!(has_animation_script("kermit"));
    free_animation_script_with_name("kermit");
    assert!(!has_animation_script("kermit"));
}
#[test]
fn test_has_animation_named_integration() {
    let kermit_script = load_animation_script("kermit", "kermit.txt");
    let has_walkfront = has_animation_named(kermit_script, "walkfront");
    assert!(has_walkfront);
    let has_nonexistent = has_animation_named(kermit_script, "NonExistentAnimation");
    assert!(!has_nonexistent);
    free_animation_script(kermit_script);
}
#[test]
fn test_has_animation_script_integration() {
    let kermit_script = load_animation_script("kermit", "kermit.txt");
    assert!(has_animation_script("kermit"));
    free_animation_script(kermit_script);
    assert!(!has_animation_script("kermit"));
}
#[test]
fn test_load_animation_script_integration() {
    let loaded_script = load_animation_script("test_animation", "kermit.txt");
    assert!(loaded_script.is_some());
    let script_name = animation_script_name(loaded_script);
    assert_eq!("test_animation", script_name);
    free_animation_script(loaded_script);
    let script_exists = has_animation_script("test_animation");
    assert!(!script_exists);
}
#[test]
fn test_restart_animation_integration() {
    let kermit_script = load_animation_script("kermit", "kermit.txt");
    let anim = create_animation(kermit_script, "moonwalkback");
    update_animation(anim);
    let anim_ended = animation_ended(anim);
    assert!(anim_ended);
    restart_animation(anim);
    let anim_ended_after_restart = animation_ended(anim);
    assert!(!anim_ended_after_restart);
    free_animation(anim);
    free_animation_script(kermit_script);
}
#[test]
fn test_restart_animation_with_sound_integration() {
    let kermit_script = load_animation_script("kermit", "kermit.txt");
    let anim = create_animation(kermit_script, "moonwalkback", true);
    update_animation(anim);
    restart_animation_with_sound(anim, true);
    assert_eq!(3, animation_current_cell(anim));
    free_animation(anim);
    free_animation_script(kermit_script);
}
#[test]
fn test_update_animation_percent_with_sound_integration() {
    let kermit_script = load_animation_script("kermit", "kermit.txt");
    let anim = create_animation(kermit_script, "moonwalkback");
    update_animation_percent_with_sound(anim, 0.5, true);
    assert!(animation_frame_time(anim) > 0);
    free_animation(anim);
    free_animation_script(kermit_script);
}
#[test]
fn test_update_animation_integration() {
    let kermit_script = load_animation_script("kermit", "kermit.txt");
    let anim = create_animation(kermit_script, "moonwalkback");
    update_animation(anim);
    assert_ne!(animation_current_cell(anim), 0);
    free_animation(anim);
    free_animation_script(kermit_script);
}
#[test]
fn test_update_animation_percent_integration() {
    let kermit_script = load_animation_script("kermit", "kermit.txt");
    let anim = create_animation(kermit_script, "walkfront");
    update_animation_percent(anim, 0.5);
    assert!(animation_frame_time(anim) > 0);
    free_animation(anim);
    free_animation_script(kermit_script);
}
