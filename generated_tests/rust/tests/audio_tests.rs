use std::*;
use splashkit::*;
use splashkit_tests::helpers::*;
#[cfg(test)]
use ctor::ctor;
mod test_audio {
    use super::*;
    #[ctor]
    fn setup()
    {
        set_resources_path("/mnt/c/Users/Noahc/Documents/aYear_2_semester_2/TeamProject/GitHubRepo/splashkit_test_generator/resources".to_string());
    }
    #[test]
    fn test_audio_ready_integration() {
        assert!(!audio_ready());
        open_audio();
        let _cleanup_audio = AudioCleanup::new();
        assert!(audio_ready());
        close_audio();
        assert!(!audio_ready());
    }
    #[test]
    fn test_close_audio_integration() {
        open_audio();
        let _cleanup_audio = AudioCleanup::new();
        assert!(audio_ready());
        close_audio();
        assert!(!audio_ready());
    }
    #[test]
    fn test_open_audio_integration() {
        open_audio();
        let _cleanup_audio = AudioCleanup::new();
        assert!(audio_ready());
        close_audio();
        assert!(!audio_ready());
    }
    #[test]
    fn test_fade_music_in_named_integration() {
        open_audio();
        let _cleanup_audio = AudioCleanup::new();
        load_music("test_music".to_string(), "magical_night.ogg".to_string());
        let _cleanup_music = MusicCleanup::new();
        fade_music_in_named("test_music".to_string(), 1000);
        assert!(music_playing());
    }
    #[test]
    fn test_fade_music_in_named_with_times_integration() {
        open_audio();
        let _cleanup_audio = AudioCleanup::new();
        load_music("test_music".to_string(), "magical_night.ogg".to_string());
        let _cleanup_music = MusicCleanup::new();
        fade_music_in_named_with_times("test_music".to_string(), 2, 1000);
        assert!(music_playing());
    }
    #[test]
    fn test_fade_music_in_integration() {
        open_audio();
        let _cleanup_audio = AudioCleanup::new();
        let test_music = load_music("test_music".to_string(), "magical_night.ogg".to_string());
        let _cleanup_music = MusicCleanup::new();
        fade_music_in(test_music, 1000);
        assert!(music_playing());
    }
    #[test]
    fn test_fade_music_in_with_times_integration() {
        open_audio();
        let _cleanup_audio = AudioCleanup::new();
        let test_music = load_music("test_music".to_string(), "magical_night.ogg".to_string());
        let _cleanup_music = MusicCleanup::new();
        fade_music_in_with_times(test_music, 2, 1000);
        assert!(music_playing());
    }
    #[test]
    fn test_fade_music_out_integration() {
        open_audio();
        let _cleanup_audio = AudioCleanup::new();
        let test_music = load_music("test_music".to_string(), "magical_night.ogg".to_string());
        let _cleanup_music = MusicCleanup::new();
        play_music(test_music);
        fade_music_out(1000);
        delay(3000);
        assert!(!music_playing());
    }
    #[test]
    fn test_free_all_music_integration() {
        open_audio();
        let _cleanup_audio = AudioCleanup::new();
        load_music("test_music1".to_string(), "magical_night.ogg".to_string());
        let _cleanup_music = MusicCleanup::new();
        load_music("test_music2".to_string(), "dancingFrog.wav".to_string());
        free_all_music();
        assert!(!has_music("test_music1".to_string()));
        assert!(!has_music("test_music2".to_string()));
    }
    #[test]
    fn test_free_music_integration() {
        open_audio();
        let _cleanup_audio = AudioCleanup::new();
        let test_music = load_music("test_music".to_string(), "magical_night.ogg".to_string());
        let _cleanup_music = MusicCleanup::new();
        play_music(test_music);
        free_music(test_music);
        assert!(!has_music("test_music".to_string()));
    }
    #[test]
    fn test_has_music_integration() {
        open_audio();
        let _cleanup_audio = AudioCleanup::new();
        let test_music = load_music("test_music".to_string(), "magical_night.ogg".to_string());
        let _cleanup_music = MusicCleanup::new();
        assert!(has_music("test_music".to_string()));
        free_music(test_music);
        assert!(!has_music("test_music".to_string()));
    }
    #[test]
    fn test_load_music_integration() {
        open_audio();
        let _cleanup_audio = AudioCleanup::new();
        let test_music = load_music("test_music".to_string(), "magical_night.ogg".to_string());
        let _cleanup_music = MusicCleanup::new();
        assert!(!test_music.is_null());
        assert!(music_valid(test_music));
    }
    #[test]
    fn test_music_filename_integration() {
        open_audio();
        let _cleanup_audio = AudioCleanup::new();
        let test_music = load_music("test_music".to_string(), "magical_night.ogg".to_string());
        let _cleanup_music = MusicCleanup::new();
        assert_eq!(path_to_resource("magical_night.ogg".to_string(), ResourceKind::SoundResource), music_filename(test_music));
    }
    #[test]
    fn test_music_name_integration() {
        open_audio();
        let _cleanup_audio = AudioCleanup::new();
        let test_music = load_music("test_music".to_string(), "magical_night.ogg".to_string());
        let _cleanup_music = MusicCleanup::new();
        assert_eq!("test_music".to_string(), music_name(test_music));
    }
    #[test]
    fn test_music_named_integration() {
        open_audio();
        let _cleanup_audio = AudioCleanup::new();
        let test_music = load_music("test_music".to_string(), "magical_night.ogg".to_string());
        let _cleanup_music = MusicCleanup::new();
        let named_music = music_named("test_music".to_string());
        assert_eq!(test_music, named_music);
    }
    #[test]
    fn test_music_playing_integration() {
        open_audio();
        let _cleanup_audio = AudioCleanup::new();
        let test_music = load_music("test_music".to_string(), "magical_night.ogg".to_string());
        let _cleanup_music = MusicCleanup::new();
        assert!(!music_playing());
        play_music(test_music);
        assert!(music_playing());
    }
    #[test]
    fn test_music_valid_integration() {
        open_audio();
        let _cleanup_audio = AudioCleanup::new();
        let test_music = load_music("test_music".to_string(), "magical_night.ogg".to_string());
        let _cleanup_music = MusicCleanup::new();
        assert!(music_valid(test_music));
        free_music(test_music);
        assert!(!music_valid(test_music));
    }
    #[test]
    fn test_music_volume_integration() {
        open_audio();
        let _cleanup_audio = AudioCleanup::new();
        let test_music = load_music("test_music".to_string(), "magical_night.ogg".to_string());
        let _cleanup_music = MusicCleanup::new();
        play_music(test_music);
        set_music_volume(0.5);
        assert_eq!(0.5, music_volume());
    }
    #[test]
    fn test_pause_music_integration() {
        open_audio();
        let _cleanup_audio = AudioCleanup::new();
        let test_music = load_music("test_music".to_string(), "magical_night.ogg".to_string());
        let _cleanup_music = MusicCleanup::new();
        play_music(test_music);
        pause_music();
        assert!(music_playing());
    }
    #[test]
    fn test_play_music_named_integration() {
        open_audio();
        let _cleanup_audio = AudioCleanup::new();
        load_music("test_music".to_string(), "magical_night.ogg".to_string());
        let _cleanup_music = MusicCleanup::new();
        play_music_named("test_music".to_string());
        assert!(music_playing());
    }
    #[test]
    fn test_play_music_named_with_times_integration() {
        open_audio();
        let _cleanup_audio = AudioCleanup::new();
        load_music("test_music".to_string(), "magical_night.ogg".to_string());
        let _cleanup_music = MusicCleanup::new();
        play_music_named_with_times("test_music".to_string(), 2);
        assert!(music_playing());
    }
    #[test]
    fn test_play_music_integration() {
        open_audio();
        let _cleanup_audio = AudioCleanup::new();
        let test_music = load_music("test_music".to_string(), "magical_night.ogg".to_string());
        let _cleanup_music = MusicCleanup::new();
        play_music(test_music);
        assert!(music_playing());
    }
    #[test]
    fn test_play_music_with_times_integration() {
        open_audio();
        let _cleanup_audio = AudioCleanup::new();
        let test_music = load_music("test_music".to_string(), "magical_night.ogg".to_string());
        let _cleanup_music = MusicCleanup::new();
        play_music_with_times(test_music, 2);
        assert!(music_playing());
    }
    #[test]
    fn test_play_music_with_times_and_volume_integration() {
        open_audio();
        let _cleanup_audio = AudioCleanup::new();
        let test_music = load_music("test_music".to_string(), "magical_night.ogg".to_string());
        let _cleanup_music = MusicCleanup::new();
        play_music_with_times_and_volume(test_music, 2, 0.75);
        assert!(music_playing());
        assert_eq!(0.75, music_volume());
    }
    #[test]
    fn test_resume_music_integration() {
        open_audio();
        let _cleanup_audio = AudioCleanup::new();
        let test_music = load_music("test_music".to_string(), "magical_night.ogg".to_string());
        let _cleanup_music = MusicCleanup::new();
        play_music(test_music);
        pause_music();
        assert!(music_playing());
        resume_music();
        assert!(music_playing());
    }
    #[test]
    fn test_set_music_volume_integration() {
        open_audio();
        let _cleanup_audio = AudioCleanup::new();
        let test_music = load_music("test_music".to_string(), "magical_night.ogg".to_string());
        let _cleanup_music = MusicCleanup::new();
        play_music(test_music);
        set_music_volume(0.5);
        assert_eq!(0.5, music_volume());
    }
    #[test]
    fn test_stop_music_integration() {
        open_audio();
        let _cleanup_audio = AudioCleanup::new();
        let test_music = load_music("test_music".to_string(), "magical_night.ogg".to_string());
        let _cleanup_music = MusicCleanup::new();
        play_music(test_music);
        stop_music();
        assert!(!music_playing());
    }
    #[test]
    fn test_fade_all_sound_effects_out_integration() {
        open_audio();
        let _cleanup_audio = AudioCleanup::new();
        let test_sound1 = load_sound_effect("test_sound1".to_string(), "comedy_boing.wav".to_string());
        let _cleanup_sound_effect = SoundEffectCleanup::new();
        let test_sound2 = load_sound_effect("test_sound2".to_string(), "comedy_boing.ogg".to_string());
        play_sound_effect(test_sound1);
        play_sound_effect(test_sound2);
        fade_all_sound_effects_out(1000);
        delay(1100);
        assert!(!sound_effect_playing(test_sound1));
        assert!(!sound_effect_playing(test_sound2));
    }
    #[test]
    fn test_fade_sound_effect_out_integration() {
        open_audio();
        let _cleanup_audio = AudioCleanup::new();
        let test_sound = load_sound_effect("test_sound".to_string(), "breakdance.wav".to_string());
        let _cleanup_sound_effect = SoundEffectCleanup::new();
        play_sound_effect(test_sound);
        fade_sound_effect_out(test_sound, 1000);
        delay(3000);
        assert!(!sound_effect_playing(test_sound));
    }
    #[test]
    fn test_free_all_sound_effects_integration() {
        open_audio();
        let _cleanup_audio = AudioCleanup::new();
        load_sound_effect("test_sound1".to_string(), "breakdance.wav".to_string());
        let _cleanup_sound_effect = SoundEffectCleanup::new();
        load_sound_effect("test_sound2".to_string(), "comedy_boing.ogg".to_string());
        free_all_sound_effects();
        assert!(!has_sound_effect("test_sound1".to_string()));
        assert!(!has_sound_effect("test_sound2".to_string()));
    }
    #[test]
    fn test_free_sound_effect_integration() {
        open_audio();
        let _cleanup_audio = AudioCleanup::new();
        let test_sound = load_sound_effect("test_sound".to_string(), "breakdance.wav".to_string());
        let _cleanup_sound_effect = SoundEffectCleanup::new();
        play_sound_effect(test_sound);
        free_sound_effect(test_sound);
        assert!(!has_sound_effect("test_sound".to_string()));
    }
    #[test]
    fn test_has_sound_effect_integration() {
        open_audio();
        let _cleanup_audio = AudioCleanup::new();
        let test_sound = load_sound_effect("test_sound".to_string(), "breakdance.wav".to_string());
        let _cleanup_sound_effect = SoundEffectCleanup::new();
        assert!(has_sound_effect("test_sound".to_string()));
        free_sound_effect(test_sound);
        assert!(!has_sound_effect("test_sound".to_string()));
    }
    #[test]
    fn test_load_sound_effect_integration() {
        open_audio();
        let _cleanup_audio = AudioCleanup::new();
        let test_sound = load_sound_effect("test_sound".to_string(), "breakdance.wav".to_string());
        let _cleanup_sound_effect = SoundEffectCleanup::new();
        assert!(!test_sound.is_null());
        assert!(has_sound_effect("test_sound".to_string()));
    }
    #[test]
    fn test_play_sound_effect_named_integration() {
        open_audio();
        let _cleanup_audio = AudioCleanup::new();
        let test_sound = load_sound_effect("test_sound".to_string(), "breakdance.wav".to_string());
        let _cleanup_sound_effect = SoundEffectCleanup::new();
        play_sound_effect_named("test_sound".to_string());
        assert!(sound_effect_playing(test_sound));
    }
    #[test]
    fn test_play_sound_effect_named_with_volume_integration() {
        open_audio();
        let _cleanup_audio = AudioCleanup::new();
        let test_sound = load_sound_effect("test_sound".to_string(), "breakdance.wav".to_string());
        let _cleanup_sound_effect = SoundEffectCleanup::new();
        play_sound_effect_named_with_volume("test_sound".to_string(), 0.75);
        assert!(sound_effect_playing(test_sound));
    }
    #[test]
    fn test_play_sound_effect_named_with_times_integration() {
        open_audio();
        let _cleanup_audio = AudioCleanup::new();
        let test_sound = load_sound_effect("test_sound".to_string(), "breakdance.wav".to_string());
        let _cleanup_sound_effect = SoundEffectCleanup::new();
        play_sound_effect_named_with_times("test_sound".to_string(), 3);
        assert!(sound_effect_playing(test_sound));
    }
    #[test]
    fn test_play_sound_effect_named_with_times_and_volume_integration() {
        open_audio();
        let _cleanup_audio = AudioCleanup::new();
        let test_sound = load_sound_effect("test_sound".to_string(), "breakdance.wav".to_string());
        let _cleanup_sound_effect = SoundEffectCleanup::new();
        play_sound_effect_named_with_times_and_volume("test_sound".to_string(), 2, 0.75);
        assert!(sound_effect_playing(test_sound));
    }
    #[test]
    fn test_play_sound_effect_integration() {
        open_audio();
        let _cleanup_audio = AudioCleanup::new();
        let test_sound = load_sound_effect("test_sound".to_string(), "breakdance.wav".to_string());
        let _cleanup_sound_effect = SoundEffectCleanup::new();
        play_sound_effect(test_sound);
        assert!(sound_effect_playing(test_sound));
    }
    #[test]
    fn test_play_sound_effect_with_volume_integration() {
        open_audio();
        let _cleanup_audio = AudioCleanup::new();
        let test_sound = load_sound_effect("test_sound".to_string(), "breakdance.wav".to_string());
        let _cleanup_sound_effect = SoundEffectCleanup::new();
        play_sound_effect_with_volume(test_sound, 0.75);
        assert!(sound_effect_playing(test_sound));
    }
    #[test]
    fn test_play_sound_effect_with_times_integration() {
        open_audio();
        let _cleanup_audio = AudioCleanup::new();
        let test_sound = load_sound_effect("test_sound".to_string(), "SwinGameStart.wav".to_string());
        let _cleanup_sound_effect = SoundEffectCleanup::new();
        play_sound_effect_with_times(test_sound, 3);
        assert!(sound_effect_playing(test_sound));
    }
    #[test]
    fn test_play_sound_effect_with_times_and_volume_integration() {
        open_audio();
        let _cleanup_audio = AudioCleanup::new();
        let test_sound = load_sound_effect("test_sound".to_string(), "SwinGameStart.wav".to_string());
        let _cleanup_sound_effect = SoundEffectCleanup::new();
        play_sound_effect_with_times_and_volume(test_sound, 2, 0.75);
        assert!(sound_effect_playing(test_sound));
    }
    #[test]
    fn test_sound_effect_filename_integration() {
        open_audio();
        let _cleanup_audio = AudioCleanup::new();
        let test_sound = load_sound_effect("test_sound".to_string(), "SwinGameStart.wav".to_string());
        let _cleanup_sound_effect = SoundEffectCleanup::new();
        assert_eq!(path_to_resource("SwinGameStart.wav".to_string(), ResourceKind::SoundResource), sound_effect_filename(test_sound));
    }
    #[test]
    fn test_sound_effect_name_integration() {
        open_audio();
        let _cleanup_audio = AudioCleanup::new();
        let test_sound = load_sound_effect("test_sound".to_string(), "SwinGameStart.wav".to_string());
        let _cleanup_sound_effect = SoundEffectCleanup::new();
        assert_eq!("test_sound".to_string(), sound_effect_name(test_sound));
    }
    #[test]
    fn test_sound_effect_named_integration() {
        open_audio();
        let _cleanup_audio = AudioCleanup::new();
        let test_sound = load_sound_effect("test_sound".to_string(), "SwinGameStart.wav".to_string());
        let _cleanup_sound_effect = SoundEffectCleanup::new();
        let named_sound = sound_effect_named("test_sound".to_string());
        assert_eq!(test_sound, named_sound);
    }
    #[test]
    fn test_sound_effect_playing_named_integration() {
        open_audio();
        let _cleanup_audio = AudioCleanup::new();
        load_sound_effect("test_sound".to_string(), "SwinGameStart.wav".to_string());
        let _cleanup_sound_effect = SoundEffectCleanup::new();
        play_sound_effect_named("test_sound".to_string());
        assert!(sound_effect_playing_named("test_sound".to_string()));
        stop_sound_effect_named("test_sound".to_string());
        assert!(!sound_effect_playing_named("test_sound".to_string()));
    }
    #[test]
    fn test_sound_effect_playing_integration() {
        open_audio();
        let _cleanup_audio = AudioCleanup::new();
        let test_sound = load_sound_effect("test_sound".to_string(), "SwinGameStart.wav".to_string());
        let _cleanup_sound_effect = SoundEffectCleanup::new();
        play_sound_effect(test_sound);
        assert!(sound_effect_playing(test_sound));
        stop_sound_effect(test_sound);
        assert!(!sound_effect_playing(test_sound));
    }
    #[test]
    fn test_sound_effect_valid_integration() {
        open_audio();
        let _cleanup_audio = AudioCleanup::new();
        let test_sound = load_sound_effect("test_sound".to_string(), "SwinGameStart.wav".to_string());
        let _cleanup_sound_effect = SoundEffectCleanup::new();
        assert!(!test_sound.is_null());
        assert!(has_sound_effect("test_sound".to_string()));
    }
    #[test]
    fn test_stop_sound_effect_named_integration() {
        open_audio();
        let _cleanup_audio = AudioCleanup::new();
        load_sound_effect("test_sound".to_string(), "SwinGameStart.wav".to_string());
        let _cleanup_sound_effect = SoundEffectCleanup::new();
        play_sound_effect_named("test_sound".to_string());
        stop_sound_effect_named("test_sound".to_string());
        assert!(!sound_effect_playing_named("test_sound".to_string()));
    }
    #[test]
    fn test_stop_sound_effect_integration() {
        open_audio();
        let _cleanup_audio = AudioCleanup::new();
        let test_sound = load_sound_effect("test_sound".to_string(), "SwinGameStart.wav".to_string());
        let _cleanup_sound_effect = SoundEffectCleanup::new();
        play_sound_effect(test_sound);
        stop_sound_effect(test_sound);
        assert!(!sound_effect_playing(test_sound));
    }
}
