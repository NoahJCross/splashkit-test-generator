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
fn test_audio_ready_integration() {
    assert!(!audio_ready());
    open_audio();
    assert!(audio_ready());
    close_audio();
    assert!(!audio_ready());
}
#[test]
fn test_close_audio_integration() {
    open_audio();
    close_audio();
    assert!(!audio_ready());
}
#[test]
fn test_open_audio_integration() {
    assert!(!audio_ready());
    open_audio();
    assert!(audio_ready());
    close_audio();
    assert!(!audio_ready());
}
#[test]
fn test_fade_music_in_named_integration() {
    open_audio();
    let test_music = load_music("test_music", "280.mp3");
    fade_music_in_named("test_music", 1000);
    assert!(music_volume() > 0.0);
    free_music(test_music);
    close_audio();
}
#[test]
fn test_fade_music_in_named_with_times_integration() {
    open_audio();
    let test_music = load_music("test_music", "280.mp3");
    fade_music_in_named_with_times("test_music", 2, 1000);
    assert!(music_volume() > 0.0);
    free_music(test_music);
    close_audio();
}
#[test]
fn test_fade_music_in_integration() {
    open_audio();
    let test_music = load_music("test_music", "280.mp3");
    play_music(test_music);
    fade_music_in(test_music, 1000);
    assert!(music_volume() > 0.0);
    free_music(test_music);
    close_audio();
}
#[test]
fn test_fade_music_in_with_times_integration() {
    open_audio();
    let test_music = load_music("test_music", "280.mp3");
    fade_music_in_with_times(test_music, 2, 1000);
    assert!(music_volume() > 0.0);
    free_music(test_music);
    close_audio();
}
#[test]
fn test_fade_music_out_integration() {
    open_audio();
    let test_music = load_music("test_music", "280.mp3");
    play_music(test_music);
    fade_music_out(1000);
    assert!(!music_playing());
    free_music(test_music);
    close_audio();
}
#[test]
fn test_free_all_music_integration() {
    open_audio();
    let test_music1 = load_music("test_music1", "280.mp3");
    let test_music2 = load_music("test_music2", "test.ogg");
    free_all_music();
    assert!(!has_music("test_music1"));
    assert!(!has_music("test_music2"));
    close_audio();
}
#[test]
fn test_free_music_integration() {
    open_audio();
    let test_music = load_music("test_music", "280.mp3");
    play_music(test_music);
    free_music(test_music);
    assert!(!music_playing());
    close_audio();
}
#[test]
fn test_has_music_integration() {
    open_audio();
    let test_music = load_music("test_music", "280.mp3");
    assert!(has_music("test_music"));
    free_music(test_music);
    assert!(!has_music("test_music"));
    close_audio();
}
#[test]
fn test_load_music_integration() {
    open_audio();
    let test_music = load_music("test_music", "280.mp3");
    assert!(music_valid(test_music));
    free_music(test_music);
    close_audio();
}
#[test]
fn test_music_filename_integration() {
    let test_music = load_music("test_music", "280.mp3");
    let filename = music_filename(test_music);
    assert_eq!(filename, "280.mp3");
    free_music(test_music);
}
#[test]
fn test_music_name_integration() {
    let test_music = load_music("test_music", "280.mp3");
    let music_name_result = music_name(test_music);
    assert_eq!(music_name_result, "test_music");
    free_music(test_music);
}
#[test]
fn test_music_named_integration() {
    let test_music = load_music("test_music", "280.mp3");
    let retrieved_music = music_named("test_music");
    assert_eq!(test_music, retrieved_music);
    free_music(test_music);
}
#[test]
fn test_music_playing_integration() {
    open_audio();
    let test_music = load_music("test_music", "280.mp3");
    play_music(test_music);
    assert!(music_playing());
    pause_music();
    assert!(!music_playing());
    free_music(test_music);
    close_audio();
}
#[test]
fn test_music_valid_integration() {
    open_audio();
    let test_music = load_music("test_music", "280.mp3");
    assert!(music_valid(test_music));
    free_music(test_music);
    assert!(!music_valid(test_music));
    close_audio();
}
#[test]
fn test_music_volume_integration() {
    open_audio();
    let test_music = load_music("test_music", "280.mp3");
    play_music(test_music);
    set_music_volume(0.5);
    assert_eq!(music_volume(), 0.5);
    free_music(test_music);
    close_audio();
}
#[test]
fn test_pause_music_integration() {
    open_audio();
    let test_music = load_music("test_music", "280.mp3");
    play_music(test_music);
    pause_music();
    assert!(!music_playing());
    free_music(test_music);
    close_audio();
}
#[test]
fn test_play_music_named_integration() {
    open_audio();
    let test_music = load_music("test_music", "280.mp3");
    play_music_named("test_music");
    assert!(music_playing());
    free_music(test_music);
    close_audio();
}
#[test]
fn test_play_music_named_with_times_integration() {
    open_audio();
    let test_music = load_music("test_music", "280.mp3");
    play_music_named_with_times("test_music", 2);
    assert!(music_playing());
    free_music(test_music);
    close_audio();
}
#[test]
fn test_play_music_integration() {
    open_audio();
    let test_music = load_music("test_music", "280.mp3");
    play_music(test_music);
    assert!(music_playing());
    free_music(test_music);
    close_audio();
}
#[test]
fn test_play_music_with_times_integration() {
    open_audio();
    let test_music = load_music("test_music", "280.mp3");
    play_music_with_times(test_music, 2);
    assert!(music_playing());
    free_music(test_music);
    close_audio();
}
#[test]
fn test_play_music_with_times_and_volume_integration() {
    open_audio();
    let test_music = load_music("test_music", "280.mp3");
    play_music_with_times_and_volume(test_music, 2, 0.5);
    assert!(music_playing());
    assert!((0.45..=0.55).contains(&music_volume()));
    free_music(test_music);
    close_audio();
}
#[test]
fn test_resume_music_integration() {
    open_audio();
    let test_music = load_music("test_music", "280.mp3");
    play_music(test_music);
    pause_music();
    assert!(!music_playing());
    resume_music();
    assert!(music_playing());
    free_music(test_music);
    close_audio();
}
#[test]
fn test_set_music_volume_integration() {
    open_audio();
    let test_music = load_music("test_music", "280.mp3");
    play_music(test_music);
    set_music_volume(0.5);
    assert_eq!(music_volume(), 0.5);
    free_music(test_music);
    close_audio();
}
#[test]
fn test_stop_music_integration() {
    open_audio();
    let test_music = load_music("test_music", "280.mp3");
    play_music(test_music);
    stop_music();
    assert!(!music_playing());
    free_music(test_music);
    close_audio();
}
#[test]
fn test_fade_all_sound_effects_out_integration() {
    open_audio();
    let test_sound1 = load_sound_effect("test_sound1", "test.ogg");
    let test_sound2 = load_sound_effect("test_sound2", "error.wav");
    play_sound_effect(test_sound1);
    play_sound_effect(test_sound2);
    fade_all_sound_effects_out(1000);
    assert!(!sound_effect_playing(test_sound1));
    assert!(!sound_effect_playing(test_sound2));
    free_all_sound_effects();
    close_audio();
}
#[test]
fn test_fade_sound_effect_out_integration() {
    open_audio();
    let test_sound = load_sound_effect("test_sound", "test.ogg");
    play_sound_effect(test_sound);
    fade_sound_effect_out(test_sound, 1000);
    assert!(!sound_effect_playing(test_sound));
    free_sound_effect(test_sound);
    close_audio();
}
#[test]
fn test_free_all_sound_effects_integration() {
    open_audio();
    let test_sound1 = load_sound_effect("test_sound1", "test.ogg");
    let test_sound2 = load_sound_effect("test_sound2", "error.wav");
    free_all_sound_effects();
    assert!(!has_sound_effect("test_sound1"));
    assert!(!has_sound_effect("test_sound2"));
    close_audio();
}
#[test]
fn test_free_sound_effect_integration() {
    open_audio();
    let test_sound = load_sound_effect("test_sound", "test.ogg");
    play_sound_effect(test_sound);
    free_sound_effect(test_sound);
    assert!(!sound_effect_valid(test_sound));
    close_audio();
}
#[test]
fn test_has_sound_effect_integration() {
    open_audio();
    let test_sound = load_sound_effect("test_sound", "test.ogg");
    assert!(has_sound_effect("test_sound"));
    free_sound_effect(test_sound);
    assert!(!has_sound_effect("test_sound"));
    close_audio();
}
#[test]
fn test_load_sound_effect_integration() {
    open_audio();
    let test_sound = load_sound_effect("test_sound", "test.ogg");
    assert!(sound_effect_valid(test_sound));
    free_sound_effect(test_sound);
    close_audio();
}
#[test]
fn test_play_sound_effect_named_integration() {
    open_audio();
    let test_sound = load_sound_effect("test_sound", "test.ogg");
    play_sound_effect_named("test_sound");
    assert!(sound_effect_playing_named("test_sound"));
    free_sound_effect(test_sound);
    close_audio();
}
#[test]
fn test_play_sound_effect_named_with_volume_integration() {
    open_audio();
    let test_sound = load_sound_effect("test_sound", "test.ogg");
    play_sound_effect_named_with_volume("test_sound", 0.5);
    assert!(sound_effect_playing_named("test_sound"));
    free_sound_effect(test_sound);
    close_audio();
}
#[test]
fn test_play_sound_effect_named_with_times_integration() {
    open_audio();
    let test_sound = load_sound_effect("test_sound", "test.ogg");
    play_sound_effect_named_with_times("test_sound", 3);
    assert!(sound_effect_playing_named("test_sound"));
    free_sound_effect(test_sound);
    close_audio();
}
#[test]
fn test_play_sound_effect_named_with_times_and_volume_integration() {
    open_audio();
    let test_sound = load_sound_effect("test_sound", "test.ogg");
    play_sound_effect_named_with_times_and_volume("test_sound", 2, 0.5);
    assert!(sound_effect_playing_named("test_sound"));
    free_sound_effect(test_sound);
    close_audio();
}
#[test]
fn test_play_sound_effect_integration() {
    open_audio();
    let test_sound = load_sound_effect("test_sound", "test.ogg");
    play_sound_effect(test_sound);
    assert!(sound_effect_playing(test_sound));
    free_sound_effect(test_sound);
    close_audio();
}
#[test]
fn test_play_sound_effect_with_volume_integration() {
    open_audio();
    let test_sound = load_sound_effect("test_sound", "test.ogg");
    play_sound_effect_with_volume(test_sound, 0.5);
    assert!(sound_effect_playing(test_sound));
    free_sound_effect(test_sound);
    close_audio();
}
#[test]
fn test_play_sound_effect_with_times_integration() {
    open_audio();
    let test_sound = load_sound_effect("test_sound", "test.ogg");
    play_sound_effect_with_times(test_sound, 3);
    assert!(sound_effect_playing(test_sound));
    free_sound_effect(test_sound);
    close_audio();
}
#[test]
fn test_play_sound_effect_with_times_and_volume_integration() {
    open_audio();
    let test_sound = load_sound_effect("test_sound", "test.ogg");
    play_sound_effect_with_times_and_volume(test_sound, 2, 0.5);
    assert!(sound_effect_playing(test_sound));
    free_sound_effect(test_sound);
    close_audio();
}
#[test]
fn test_sound_effect_filename_integration() {
    let test_sound = load_sound_effect("test_sound", "test.ogg");
    let test_filename = sound_effect_filename(test_sound);
    assert_eq!(test_filename, "test.ogg");
    free_sound_effect(test_sound);
}
#[test]
fn test_sound_effect_name_integration() {
    let test_sound = load_sound_effect("test_sound", "test.ogg");
    let test_sound_name = sound_effect_name(test_sound);
    assert_eq!(test_sound_name, "test_sound");
    free_sound_effect(test_sound);
}
#[test]
fn test_sound_effect_named_integration() {
    open_audio();
    let test_sound = load_sound_effect("test_sound", "test.ogg");
    let retrieved_sound = sound_effect_named("test_sound");
    assert_eq!(test_sound, retrieved_sound);
    free_sound_effect(test_sound);
    close_audio();
}
#[test]
fn test_sound_effect_playing_named_integration() {
    open_audio();
    let test_sound = load_sound_effect("test_sound", "test.ogg");
    play_sound_effect("test_sound");
    assert!(sound_effect_playing_named("test_sound"));
    stop_sound_effect("test_sound");
    assert!(!sound_effect_playing_named("test_sound"));
    free_sound_effect(test_sound);
    close_audio();
}
#[test]
fn test_sound_effect_playing_integration() {
    open_audio();
    let test_sound = load_sound_effect("test_sound", "test.ogg");
    play_sound_effect(test_sound);
    assert!(sound_effect_playing(test_sound));
    stop_sound_effect(test_sound);
    assert!(!sound_effect_playing(test_sound));
    free_sound_effect(test_sound);
    close_audio();
}
#[test]
fn test_sound_effect_valid_integration() {
    open_audio();
    let test_sound_effect = load_sound_effect("test_sound", "test.ogg");
    assert!(sound_effect_valid(test_sound_effect));
    free_sound_effect(test_sound_effect);
    close_audio();
}
#[test]
fn test_stop_sound_effect_named_integration() {
    open_audio();
    let test_sound = load_sound_effect("test_sound", "test.ogg");
    play_sound_effect("test_sound");
    stop_sound_effect_named("test_sound");
    assert!(!sound_effect_playing_named("test_sound"));
    free_sound_effect(test_sound);
    close_audio();
}
