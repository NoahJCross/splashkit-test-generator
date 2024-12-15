use std::*;
use splashkit::*;
#[cfg(test)]
mod test_animations {
use super::*;
#[test]
fn test_animation_count_integration() {
    let script = load_animation_script("kermit".to_string(), "kermit.txt".to_string());
    let count = animation_count(script);
    assert!(count > 0);
    free_animation_script(script);
}
#[test]
fn test_animation_current_cell_integration() {
    let kermit_script = load_animation_script("kermit".to_string(), "kermit.txt".to_string());
    let anim = create_animation(kermit_script, "moonwalkback".to_string());
    let current_cell = animation_current_cell(anim);
    assert!(current_cell > -1);
    free_animation(anim);
    free_animation_script(kermit_script);
}
#[test]
fn test_animation_current_vector_integration() {
    let kermit_script = load_animation_script("kermit".to_string(), "kermit.txt".to_string());
    let anim = create_animation(kermit_script, "moonwalkback".to_string());
    let current_vector = animation_current_vector(anim);
    assert_eq!(0.0, current_vector.x);
    assert_eq!(0.0, current_vector.y);
    free_animation(anim);
    free_animation_script(kermit_script);
}
#[test]
fn test_animation_ended_integration() {
    let kermit_script = load_animation_script("kermit".to_string(), "kermit.txt".to_string());
    let anim = create_animation(kermit_script, "moonwalkback".to_string());
    assert!(!animation_ended(anim));
    for _ in 0..50 {
        update_animation_percent(anim, 100.0 as f32);
    }
    assert!(!animation_ended(anim));
    update_animation(anim);
    assert!(animation_ended(anim));
    free_animation(anim);
    free_animation_script(kermit_script);
}
#[test]
fn test_animation_entered_frame_integration() {
    let kermit_script = load_animation_script("kermit".to_string(), "kermit.txt".to_string());
    let anim = create_animation(kermit_script, "walkfront".to_string());
    update_animation_percent(anim, 20 as f32);
    assert!(animation_entered_frame(anim));
    update_animation(anim);
    assert!(!animation_entered_frame(anim));
    free_animation(anim);
    free_animation_script(kermit_script);
}
#[test]
fn test_animation_frame_time_integration() {
    let kermit_script = load_animation_script("kermit".to_string(), "kermit.txt".to_string());
    let anim = create_animation(kermit_script, "walkfront".to_string());
    update_animation(anim);
    let frame_time = animation_frame_time(anim);
    assert!(frame_time > 0.0 as f32);
    free_animation(anim);
    free_animation_script(kermit_script);
}
#[test]
fn test_animation_index_integration() {
    let script = load_animation_script("kermit".to_string(), "kermit.txt".to_string());
    let index = animation_index(script, "walkfront".to_string());
    assert!(index > -1);
    let non_existent_index = animation_index(script, "NonExistentAnimation".to_string());
    assert_eq!(-1, non_existent_index);
    free_animation_script(script);
}
#[test]
fn test_animation_name_integration() {
    let kermit_script = load_animation_script("kermit".to_string(), "kermit.txt".to_string());
    let anim = create_animation(kermit_script, "moonwalkback".to_string());
    let anim_name = animation_name(anim);
    assert_eq!("moonwalkback".to_string(), anim_name);
    free_animation(anim);
    free_animation_script(kermit_script);
}
#[test]
fn test_animation_script_name_integration() {
    let kermit_script = load_animation_script("kermit".to_string(), "kermit.txt".to_string());
    let script_name = animation_script_name(kermit_script);
    assert_eq!("kermit".to_string(), script_name);
    free_animation_script(kermit_script);
}
#[test]
fn test_animation_script_named_integration() {
    let kermit_script = load_animation_script("kermit".to_string(), "kermit.txt".to_string());
    let loaded_script = animation_script_named("kermit".to_string());
    assert!(!loaded_script.is_null());
    assert_eq!(loaded_script, loaded_script);
    free_animation_script(kermit_script);
}
#[test]
fn test_assign_animation_with_script_integration() {
    let kermit_script = load_animation_script("kermit".to_string(), "kermit.txt".to_string());
    let anim = create_animation(kermit_script, "moonwalkback".to_string());
    assign_animation_with_script(anim, kermit_script, "walkfront".to_string());
    assert_eq!("walkfront".to_string(), animation_name(anim));
    free_animation_script(kermit_script);
    free_animation(anim);
}
#[test]
fn test_assign_animation_with_script_and_sound_integration() {
    let kermit_script = load_animation_script("kermit".to_string(), "kermit.txt".to_string());
    let anim = create_animation(kermit_script, "walkfront".to_string());
    assign_animation_with_script_and_sound(anim, kermit_script, "walkleft".to_string(), true);
    assert_eq!("walkleft".to_string(), animation_name(anim));
    free_animation(anim);
    free_animation_script(kermit_script);
}
#[test]
fn test_assign_animation_index_with_script_integration() {
    let kermit_script = load_animation_script("kermit".to_string(), "kermit.txt".to_string());
    let anim = create_animation(kermit_script, "moonwalkback".to_string());
    assign_animation_index_with_script(anim, kermit_script, 0);
    assert_eq!("walkfront".to_string(), animation_name(anim));
    free_animation_script(kermit_script);
    free_animation(anim);
}
#[test]
fn test_assign_animation_index_with_script_and_sound_integration() {
    let kermit_script = load_animation_script("kermit".to_string(), "kermit.txt".to_string());
    let anim = create_animation(kermit_script, "moonwalkback".to_string());
    assign_animation_index_with_script_and_sound(anim, kermit_script, 0, true);
    assert_eq!("walkfront".to_string(), animation_name(anim));
    free_animation_script(kermit_script);
    free_animation(anim);
}
#[test]
fn test_assign_animation_with_script_named_integration() {
    let kermit_script = load_animation_script("kermit".to_string(), "kermit.txt".to_string());
    let anim = create_animation(kermit_script, "moonwalkback".to_string());
    assign_animation_with_script_named(anim, "kermit".to_string(), "walkfront".to_string());
    assert_eq!("walkfront".to_string(), animation_name(anim));
    free_animation_script(kermit_script);
    free_animation(anim);
}
#[test]
fn test_assign_animation_with_script_named_and_sound_integration() {
    let kermit_script = load_animation_script("kermit".to_string(), "kermit.txt".to_string());
    let anim = create_animation(kermit_script, "walkfront".to_string());
    assign_animation_with_script_named_and_sound(anim, "kermit".to_string(), "walkfront".to_string(), true);
    assert_eq!("walkfront".to_string(), animation_name(anim));
    free_animation(anim);
    free_animation_script(kermit_script);
}
#[test]
fn test_assign_animation_index_integration() {
    let kermit_script = load_animation_script("kermit".to_string(), "kermit.txt".to_string());
    let anim = create_animation(kermit_script, "moonwalkback".to_string());
    assign_animation_index(anim, 0);
    assert_eq!(0, animation_current_cell(anim));
    free_animation(anim);
    free_animation_script(kermit_script);
}
#[test]
fn test_assign_animation_index_with_sound_integration() {
    let kermit_script = load_animation_script("kermit".to_string(), "kermit.txt".to_string());
    let anim = create_animation_with_sound(kermit_script, "moonwalkback".to_string(), false);
    assign_animation_index_with_sound(anim, 0, true);
    assert!(animation_entered_frame(anim));
    free_animation_script(kermit_script);
    free_animation(anim);
}
#[test]
fn test_assign_animation_integration() {
    let kermit_script = load_animation_script("kermit".to_string(), "kermit.txt".to_string());
    let anim = create_animation(kermit_script, "moonwalkback".to_string());
    assign_animation(anim, "walkfront".to_string());
    assert_eq!("walkfront".to_string(), animation_name(anim));
    free_animation(anim);
    free_animation_script(kermit_script);
}
#[test]
fn test_assign_animation_with_sound_integration() {
    let kermit_script = load_animation_script("kermit".to_string(), "kermit.txt".to_string());
    let anim = create_animation(kermit_script, "moonwalkback".to_string());
    assign_animation_with_sound(anim, "walkfront".to_string(), true);
    assert_eq!("walkfront".to_string(), animation_name(anim));
    free_animation_script(kermit_script);
    free_animation(anim);
}
#[test]
fn test_create_animation_from_index_with_sound_integration() {
    let kermit_script = load_animation_script("kermit".to_string(), "kermit.txt".to_string());
    let anim = create_animation_from_index_with_sound(kermit_script, 0, true);
    assert!(!anim.is_null());
    let anim_name = animation_name(anim);
    assert_eq!("walkfront".to_string(), anim_name);
    free_animation(anim);
    free_animation_script(kermit_script);
}
#[test]
fn test_create_animation_integration() {
    let kermit_script = load_animation_script("kermit".to_string(), "kermit.txt".to_string());
    let anim = create_animation(kermit_script, "moonwalkback".to_string());
    assert!(!anim.is_null());
    let anim_name = animation_name(anim);
    assert_eq!("moonwalkback".to_string(), anim_name);
    free_animation(anim);
    free_animation_script(kermit_script);
}
#[test]
fn test_create_animation_with_sound_integration() {
    let kermit_script = load_animation_script("kermit".to_string(), "kermit.txt".to_string());
    let anim = create_animation_with_sound(kermit_script, "moonwalkback".to_string(), true);
    assert!(!anim.is_null());
    let anim_name = animation_name(anim);
    assert_eq!("moonwalkback".to_string(), anim_name);
    free_animation_script(kermit_script);
    free_animation(anim);
}
#[test]
fn test_create_animation_from_script_named_integration() {
    let kermit_script = load_animation_script("kermit".to_string(), "kermit.txt".to_string());
    let anim = create_animation_from_script_named("kermit".to_string(), "moonwalkback".to_string());
    assert!(!anim.is_null());
    let anim_name = animation_name(anim);
    assert_eq!("moonwalkback".to_string(), anim_name);
    free_animation(anim);
    free_animation_script(kermit_script);
}
#[test]
fn test_create_animation_from_script_named_with_sound_integration() {
    let kermit_script = load_animation_script("kermit".to_string(), "kermit.txt".to_string());
    let anim = create_animation_from_script_named_with_sound("".to_string(), "moonwalkback".to_string(), true);
    assert!(!anim.is_null());
    let anim_name = animation_name(anim);
    assert_eq!("moonwalkback".to_string(), anim_name);
    free_animation_script(kermit_script);
    free_animation(anim);
}
#[test]
fn test_free_all_animation_scripts_integration() {
    load_animation_script("kermitq".to_string(), "kermit.txt".to_string());
    load_animation_script("kermit2".to_string(), "kermit.txt".to_string());
    assert!(has_animation_script("kermit1".to_string()));
    assert!(has_animation_script("kermit2".to_string()));
    free_all_animation_scripts();
    assert!(!has_animation_script("kermit1".to_string()));
    assert!(!has_animation_script("kermit2".to_string()));
}
#[test]
fn test_free_animation_integration() {
    let kermit_script = load_animation_script("kermit".to_string(), "kermit.txt".to_string());
    let anim = create_animation(kermit_script, "moonwalkback".to_string());
    free_animation(anim);
    assert_eq!("".to_string(), animation_name(anim));
    assert!(animation_ended(anim));
    free_animation_script(kermit_script);
}
#[test]
fn test_free_animation_script_integration() {
    let script = load_animation_script("kermit".to_string(), "kermit.txt".to_string());
    assert!(!script.is_null());
    free_animation_script(script);
    let script_exists = has_animation_script("kermit".to_string());
    assert!(!script_exists);
}
#[test]
fn test_free_animation_script_with_name_integration() {
    load_animation_script("kermit".to_string(), "kermit.txt".to_string());
    assert!(has_animation_script("kermit".to_string()));
    free_animation_script_with_name("kermit".to_string());
    assert!(!has_animation_script("kermit".to_string()));
}
#[test]
fn test_has_animation_named_integration() {
    let kermit_script = load_animation_script("kermit".to_string(), "kermit.txt".to_string());
    let has_walkfront = has_animation_named(kermit_script, "walkfront".to_string());
    assert!(has_walkfront);
    let has_nonexistent = has_animation_named(kermit_script, "NonExistentAnimation".to_string());
    assert!(!has_nonexistent);
    free_animation_script(kermit_script);
}
#[test]
fn test_has_animation_script_integration() {
    let kermit_script = load_animation_script("kermit".to_string(), "kermit.txt".to_string());
    assert!(has_animation_script("kermit".to_string()));
    free_animation_script(kermit_script);
    assert!(!has_animation_script("kermit".to_string()));
}
#[test]
fn test_load_animation_script_integration() {
    let loaded_script = load_animation_script("test_animation".to_string(), "kermit.txt".to_string());
    assert!(!loaded_script.is_null());
    let script_name = animation_script_name(loaded_script);
    assert_eq!("test_animation".to_string(), script_name);
    free_animation_script(loaded_script);
    let script_exists = has_animation_script("test_animation".to_string());
    assert!(!script_exists);
}
#[test]
fn test_restart_animation_integration() {
    let kermit_script = load_animation_script("kermit".to_string(), "kermit.txt".to_string());
    let anim = create_animation(kermit_script, "moonwalkback".to_string());
    for _ in 0..50 {
        update_animation_percent(anim, 100.0 as f32);
    }
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
    let kermit_script = load_animation_script("kermit".to_string(), "kermit.txt".to_string());
    let anim = create_animation_with_sound(kermit_script, "moonwalkback".to_string(), true);
    update_animation(anim);
    restart_animation_with_sound(anim, true);
    assert_eq!(3, animation_current_cell(anim));
    free_animation(anim);
    free_animation_script(kermit_script);
}
#[test]
fn test_update_animation_percent_with_sound_integration() {
    let kermit_script = load_animation_script("kermit".to_string(), "kermit.txt".to_string());
    let anim = create_animation(kermit_script, "moonwalkback".to_string());
    update_animation_percent_with_sound(anim, 0.5 as f32, true);
    assert!(animation_frame_time(anim) > 0.0 as f32);
    free_animation(anim);
    free_animation_script(kermit_script);
}
#[test]
fn test_update_animation_integration() {
    let kermit_script = load_animation_script("kermit".to_string(), "kermit.txt".to_string());
    let anim = create_animation(kermit_script, "moonwalkback".to_string());
    update_animation(anim);
    assert_ne!(0, animation_current_cell(anim));
    free_animation(anim);
    free_animation_script(kermit_script);
}
#[test]
fn test_update_animation_percent_integration() {
    let kermit_script = load_animation_script("kermit".to_string(), "kermit.txt".to_string());
    let anim = create_animation(kermit_script, "walkfront".to_string());
    update_animation_percent(anim, 0.5 as f32);
    assert!(animation_frame_time(anim) > 0.0 as f32);
    free_animation(anim);
    free_animation_script(kermit_script);
}
}
