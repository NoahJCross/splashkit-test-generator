use std::*;
use splashkit::*;
use splashkit_tests::helpers::*;
#[cfg(test)]
use ctor::ctor;
mod test_animations {
    use super::*;
    #[ctor]
    fn setup()
    {
        set_resources_path("/mnt/c/Users/Noahc/Documents/aYear_2_semester_2/TeamProject/GitHubRepo/splashkit_test_generator/resources".to_string());
    }
    #[test]
    fn test_animation_count_integration() {
        let test_script = load_animation_script("Test Script 1".to_string(), "kermit.txt".to_string());
        let _cleanup_animation_script = AnimationScriptCleanup::new();
        assert!(animation_count(test_script) > 0);
    }
    #[test]
    fn test_animation_current_cell_integration() {
        let test_script = load_animation_script("Test Script 2".to_string(), "kermit.txt".to_string());
        let _cleanup_animation_script = AnimationScriptCleanup::new();
        let test_animation = create_animation(test_script, "moonwalkback".to_string());
        let _cleanup_animation = AnimationCleanup::new(test_animation);
        assert!(animation_current_cell(test_animation) > -1);
    }
    #[test]
    fn test_animation_current_vector_integration() {
        let test_script = load_animation_script("Test Script 3".to_string(), "kermit.txt".to_string());
        let _cleanup_animation_script = AnimationScriptCleanup::new();
        let test_animation = create_animation(test_script, "moonwalkback".to_string());
        let _cleanup_animation = AnimationCleanup::new(test_animation);
        let current_vector = animation_current_vector(test_animation);
        assert_eq!(0.0, current_vector.x);
        assert_eq!(0.0, current_vector.y);
    }
    #[test]
    fn test_animation_ended_integration() {
        let test_script = load_animation_script("Test Script 4".to_string(), "kermit.txt".to_string());
        let _cleanup_animation_script = AnimationScriptCleanup::new();
        let test_animation = create_animation(test_script, "moonwalkback".to_string());
        let _cleanup_animation = AnimationCleanup::new(test_animation);
        assert!(!animation_ended(test_animation));
        for _ in 0..50 {
            update_animation_percent(test_animation, 100.0 as f32);
        }
        assert!(animation_ended(test_animation));
    }
    #[test]
    fn test_animation_entered_frame_integration() {
        let test_script = load_animation_script("Test Script 5".to_string(), "kermit.txt".to_string());
        let _cleanup_animation_script = AnimationScriptCleanup::new();
        let test_animation = create_animation(test_script, "walkfront".to_string());
        let _cleanup_animation = AnimationCleanup::new(test_animation);
        update_animation_percent(test_animation, 20.0 as f32);
        assert!(animation_entered_frame(test_animation));
        update_animation(test_animation);
        assert!(!animation_entered_frame(test_animation));
    }
    #[test]
    fn test_animation_frame_time_integration() {
        let test_script = load_animation_script("Test Script 6".to_string(), "kermit.txt".to_string());
        let _cleanup_animation_script = AnimationScriptCleanup::new();
        let test_animation = create_animation(test_script, "walkfront".to_string());
        let _cleanup_animation = AnimationCleanup::new(test_animation);
        update_animation(test_animation);
        let frame_time = animation_frame_time(test_animation);
        assert!(frame_time > 0.0 as f32);
    }
    #[test]
    fn test_animation_index_integration() {
        let test_script = load_animation_script("Test Script 7".to_string(), "kermit.txt".to_string());
        let _cleanup_animation_script = AnimationScriptCleanup::new();
        assert!(animation_index(test_script, "walkfront".to_string()) > -1);
        assert_eq!(-1, animation_index(test_script, "NonExistentAnimation".to_string()));
    }
    #[test]
    fn test_animation_name_integration() {
        let test_script = load_animation_script("Test Script 8".to_string(), "kermit.txt".to_string());
        let _cleanup_animation_script = AnimationScriptCleanup::new();
        let test_animation = create_animation(test_script, "moonwalkback".to_string());
        let _cleanup_animation = AnimationCleanup::new(test_animation);
        let anim_name = animation_name(test_animation);
        assert_eq!("moonwalkback".to_string(), anim_name);
    }
    #[test]
    fn test_animation_script_name_integration() {
        let test_script = load_animation_script("Test Script 9".to_string(), "kermit.txt".to_string());
        let _cleanup_animation_script = AnimationScriptCleanup::new();
        assert_eq!("Test Script 9".to_string(), animation_script_name(test_script));
    }
    #[test]
    fn test_animation_script_named_integration() {
        let test_script = load_animation_script("Test Script 10".to_string(), "kermit.txt".to_string());
        let _cleanup_animation_script = AnimationScriptCleanup::new();
        animation_script_named("Test Script 10".to_string());
        assert!(!test_script.is_null());
        assert_eq!(test_script, test_script);
    }
    #[test]
    fn test_assign_animation_with_script_integration() {
        let test_script = load_animation_script("Test Script 11".to_string(), "kermit.txt".to_string());
        let _cleanup_animation_script = AnimationScriptCleanup::new();
        let test_animation = create_animation(test_script, "moonwalkback".to_string());
        let _cleanup_animation = AnimationCleanup::new(test_animation);
        assign_animation_with_script(test_animation, test_script, "walkfront".to_string());
        assert_eq!("walkfront".to_string(), animation_name(test_animation));
    }
    #[test]
    fn test_assign_animation_with_script_and_sound_integration() {
        let test_script = load_animation_script("Test Script 12".to_string(), "kermit.txt".to_string());
        let _cleanup_animation_script = AnimationScriptCleanup::new();
        let test_animation = create_animation(test_script, "walkfront".to_string());
        let _cleanup_animation = AnimationCleanup::new(test_animation);
        assign_animation_with_script_and_sound(test_animation, test_script, "walkleft".to_string(), true);
        assert_eq!("walkleft".to_string(), animation_name(test_animation));
    }
    #[test]
    fn test_assign_animation_index_with_script_integration() {
        let test_script = load_animation_script("Test Script 13".to_string(), "kermit.txt".to_string());
        let _cleanup_animation_script = AnimationScriptCleanup::new();
        let test_animation = create_animation(test_script, "moonwalkback".to_string());
        let _cleanup_animation = AnimationCleanup::new(test_animation);
        assign_animation_index_with_script(test_animation, test_script, 0);
        assert_eq!("walkfront".to_string(), animation_name(test_animation));
    }
    #[test]
    fn test_assign_animation_index_with_script_and_sound_integration() {
        let test_script = load_animation_script("Test Script 14".to_string(), "kermit.txt".to_string());
        let _cleanup_animation_script = AnimationScriptCleanup::new();
        let test_animation = create_animation(test_script, "moonwalkback".to_string());
        let _cleanup_animation = AnimationCleanup::new(test_animation);
        assign_animation_index_with_script_and_sound(test_animation, test_script, 0, true);
        assert_eq!("walkfront".to_string(), animation_name(test_animation));
    }
    #[test]
    fn test_assign_animation_with_script_named_integration() {
        let test_script = load_animation_script("Test Script 15".to_string(), "kermit.txt".to_string());
        let _cleanup_animation_script = AnimationScriptCleanup::new();
        let test_animation = create_animation(test_script, "moonwalkback".to_string());
        let _cleanup_animation = AnimationCleanup::new(test_animation);
        assign_animation_with_script_named(test_animation, "Test Script 15".to_string(), "walkfront".to_string());
        assert_eq!("walkfront".to_string(), animation_name(test_animation));
    }
    #[test]
    fn test_assign_animation_with_script_named_and_sound_integration() {
        let test_script = load_animation_script("Test Script 16".to_string(), "kermit.txt".to_string());
        let _cleanup_animation_script = AnimationScriptCleanup::new();
        let test_animation = create_animation(test_script, "walkfront".to_string());
        let _cleanup_animation = AnimationCleanup::new(test_animation);
        assign_animation_with_script_named_and_sound(test_animation, "Test Script 16".to_string(), "walkfront".to_string(), true);
        assert_eq!("walkfront".to_string(), animation_name(test_animation));
    }
    #[test]
    fn test_assign_animation_index_integration() {
        let test_script = load_animation_script("Test Script 17".to_string(), "kermit.txt".to_string());
        let _cleanup_animation_script = AnimationScriptCleanup::new();
        let test_animation = create_animation(test_script, "moonwalkback".to_string());
        let _cleanup_animation = AnimationCleanup::new(test_animation);
        assign_animation_index(test_animation, 0);
        assert_eq!(0, animation_current_cell(test_animation));
    }
    #[test]
    fn test_assign_animation_index_with_sound_integration() {
        let test_script = load_animation_script("Test Script 18".to_string(), "kermit.txt".to_string());
        let _cleanup_animation_script = AnimationScriptCleanup::new();
        let test_animation = create_animation_with_sound(test_script, "moonwalkback".to_string(), false);
        let _cleanup_animation = AnimationCleanup::new(test_animation);
        assign_animation_index_with_sound(test_animation, 0, true);
        assert!(animation_entered_frame(test_animation));
    }
    #[test]
    fn test_assign_animation_integration() {
        let test_script = load_animation_script("Test Script 19".to_string(), "kermit.txt".to_string());
        let _cleanup_animation_script = AnimationScriptCleanup::new();
        let test_animation = create_animation(test_script, "moonwalkback".to_string());
        let _cleanup_animation = AnimationCleanup::new(test_animation);
        assign_animation(test_animation, "walkfront".to_string());
        assert_eq!("walkfront".to_string(), animation_name(test_animation));
    }
    #[test]
    fn test_assign_animation_with_sound_integration() {
        let test_script = load_animation_script("Test Script 20".to_string(), "kermit.txt".to_string());
        let _cleanup_animation_script = AnimationScriptCleanup::new();
        let test_animation = create_animation(test_script, "moonwalkback".to_string());
        let _cleanup_animation = AnimationCleanup::new(test_animation);
        assign_animation_with_sound(test_animation, "walkfront".to_string(), true);
        assert_eq!("walkfront".to_string(), animation_name(test_animation));
    }
    #[test]
    fn test_create_animation_from_index_with_sound_integration() {
        let test_script = load_animation_script("Test Script 21".to_string(), "kermit.txt".to_string());
        let _cleanup_animation_script = AnimationScriptCleanup::new();
        let test_animation = create_animation_from_index_with_sound(test_script, 0, true);
        let _cleanup_animation = AnimationCleanup::new(test_animation);
        assert!(!test_animation.is_null());
        assert_eq!("walkfront".to_string(), animation_name(test_animation));
    }
    #[test]
    fn test_create_animation_integration() {
        let test_script = load_animation_script("Test Script 22".to_string(), "kermit.txt".to_string());
        let _cleanup_animation_script = AnimationScriptCleanup::new();
        let test_animation = create_animation(test_script, "moonwalkback".to_string());
        let _cleanup_animation = AnimationCleanup::new(test_animation);
        assert!(!test_animation.is_null());
        assert_eq!("moonwalkback".to_string(), animation_name(test_animation));
    }
    #[test]
    fn test_create_animation_with_sound_integration() {
        let test_script = load_animation_script("Test Script 23".to_string(), "kermit.txt".to_string());
        let _cleanup_animation_script = AnimationScriptCleanup::new();
        let test_animation = create_animation_with_sound(test_script, "moonwalkback".to_string(), true);
        let _cleanup_animation = AnimationCleanup::new(test_animation);
        assert!(!test_animation.is_null());
        assert_eq!("moonwalkback".to_string(), animation_name(test_animation));
    }
    #[test]
    fn test_create_animation_from_script_named_integration() {
        load_animation_script("Test Script 24".to_string(), "kermit.txt".to_string());
        let _cleanup_animation_script = AnimationScriptCleanup::new();
        let test_animation = create_animation_from_script_named("Test Script 24".to_string(), "moonwalkback".to_string());
        let _cleanup_animation = AnimationCleanup::new(test_animation);
        assert!(!test_animation.is_null());
        assert_eq!("moonwalkback".to_string(), animation_name(test_animation));
    }
    #[test]
    fn test_create_animation_from_script_named_with_sound_integration() {
        load_animation_script("Test Script 25".to_string(), "kermit.txt".to_string());
        let _cleanup_animation_script = AnimationScriptCleanup::new();
        let test_animation = create_animation_from_script_named_with_sound("Test Script 25".to_string(), "moonwalkback".to_string(), true);
        let _cleanup_animation = AnimationCleanup::new(test_animation);
        assert!(!test_animation.is_null());
        assert_eq!("moonwalkback".to_string(), animation_name(test_animation));
    }
    #[test]
    fn test_free_all_animation_scripts_integration() {
        load_animation_script("Test Script 26".to_string(), "kermit.txt".to_string());
        let _cleanup_animation_script = AnimationScriptCleanup::new();
        load_animation_script("Test Script 27".to_string(), "kermit.txt".to_string());
        assert!(has_animation_script("Test Script 26".to_string()));
        assert!(has_animation_script("Test Script 27".to_string()));
        free_all_animation_scripts();
        assert!(!has_animation_script("Test Script 26".to_string()));
        assert!(!has_animation_script("Test Script 27".to_string()));
    }
    #[test]
    fn test_free_animation_integration() {
        let test_script = load_animation_script("Test Script 28".to_string(), "kermit.txt".to_string());
        let _cleanup_animation_script = AnimationScriptCleanup::new();
        let test_animation = create_animation(test_script, "moonwalkback".to_string());
        let _cleanup_animation = AnimationCleanup::new(test_animation);
        free_animation(test_animation);
        assert_eq!("".to_string(), animation_name(test_animation));
        assert!(animation_ended(test_animation));
    }
    #[test]
    fn test_free_animation_script_integration() {
        let test_script = load_animation_script("Test Script 29".to_string(), "kermit.txt".to_string());
        let _cleanup_animation_script = AnimationScriptCleanup::new();
        assert!(!test_script.is_null());
        free_animation_script(test_script);
        assert!(!has_animation_script("Test Script 29".to_string()));
    }
    #[test]
    fn test_free_animation_script_with_name_integration() {
        load_animation_script("Test Script 30".to_string(), "kermit.txt".to_string());
        let _cleanup_animation_script = AnimationScriptCleanup::new();
        assert!(has_animation_script("Test Script 30".to_string()));
        free_animation_script_with_name("Test Script 30".to_string());
        assert!(!has_animation_script("Test Script 30".to_string()));
    }
    #[test]
    fn test_has_animation_named_integration() {
        let test_script = load_animation_script("Test Script 31".to_string(), "kermit.txt".to_string());
        let _cleanup_animation_script = AnimationScriptCleanup::new();
        assert!(has_animation_named(test_script, "walkfront".to_string()));
        assert!(!has_animation_named(test_script, "NonExistentAnimation".to_string()));
    }
    #[test]
    fn test_has_animation_script_integration() {
        let test_script = load_animation_script("Test Script 32".to_string(), "kermit.txt".to_string());
        let _cleanup_animation_script = AnimationScriptCleanup::new();
        assert!(has_animation_script("Test Script 32".to_string()));
        free_animation_script(test_script);
        assert!(!has_animation_script("Test Script 32".to_string()));
    }
    #[test]
    fn test_load_animation_script_integration() {
        let test_script = load_animation_script("Test Script 33".to_string(), "kermit.txt".to_string());
        let _cleanup_animation_script = AnimationScriptCleanup::new();
        assert!(!test_script.is_null());
        let script_name = animation_script_name(test_script);
        assert_eq!("Test Script 33".to_string(), script_name);
        free_animation_script(test_script);
        assert!(!has_animation_script("Test Script 33".to_string()));
    }
    #[test]
    fn test_restart_animation_integration() {
        let test_script = load_animation_script("Test Script 34".to_string(), "kermit.txt".to_string());
        let _cleanup_animation_script = AnimationScriptCleanup::new();
        let test_animation = create_animation(test_script, "moonwalkback".to_string());
        let _cleanup_animation = AnimationCleanup::new(test_animation);
        for _ in 0..50 {
            update_animation_percent(test_animation, 100.0 as f32);
        }
        let anim_ended = animation_ended(test_animation);
        assert!(anim_ended);
        restart_animation(test_animation);
        assert!(!animation_ended(test_animation));
    }
    #[test]
    fn test_restart_animation_with_sound_integration() {
        let test_script = load_animation_script("Test Script 35".to_string(), "kermit.txt".to_string());
        let _cleanup_animation_script = AnimationScriptCleanup::new();
        let test_animation = create_animation_with_sound(test_script, "moonwalkback".to_string(), true);
        let _cleanup_animation = AnimationCleanup::new(test_animation);
        update_animation(test_animation);
        restart_animation_with_sound(test_animation, true);
        assert_eq!(3, animation_current_cell(test_animation));
    }
    #[test]
    fn test_update_animation_percent_with_sound_integration() {
        let test_script = load_animation_script("Test Script 36".to_string(), "kermit.txt".to_string());
        let _cleanup_animation_script = AnimationScriptCleanup::new();
        let test_animation = create_animation(test_script, "moonwalkback".to_string());
        let _cleanup_animation = AnimationCleanup::new(test_animation);
        update_animation_percent_with_sound(test_animation, 0.5 as f32, true);
        assert!(animation_frame_time(test_animation) > 0.0 as f32);
    }
    #[test]
    fn test_update_animation_integration() {
        let test_script = load_animation_script("Test Script 37".to_string(), "kermit.txt".to_string());
        let _cleanup_animation_script = AnimationScriptCleanup::new();
        let test_animation = create_animation(test_script, "moonwalkback".to_string());
        let _cleanup_animation = AnimationCleanup::new(test_animation);
        update_animation(test_animation);
        assert_ne!(0, animation_current_cell(test_animation));
    }
    #[test]
    fn test_update_animation_percent_integration() {
        let test_script = load_animation_script("Test Script 38".to_string(), "kermit.txt".to_string());
        let _cleanup_animation_script = AnimationScriptCleanup::new();
        let test_animation = create_animation(test_script, "walkfront".to_string());
        let _cleanup_animation = AnimationCleanup::new(test_animation);
        update_animation_percent(test_animation, 0.5 as f32);
        assert!(animation_frame_time(test_animation) > 0.0 as f32);
    }
}
