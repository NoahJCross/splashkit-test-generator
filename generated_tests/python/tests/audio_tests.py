import pytest
from splashkit import *
from ..helpers import *
import contextlib
class TestAudio:
    def setup_method(self):
        set_resources_path("/mnt/c/Users/Noahc/Documents/aYear_2_semester_2/TeamProject/GitHubRepo/splashkit_test_generator/resources")

    def test_audio_ready_integration():
        assert not audio_ready()
        open_audio()
        with audio_cleanup():
            assert audio_ready()
            close_audio()
            assert not audio_ready()
            
    def test_close_audio_integration():
        open_audio()
        with audio_cleanup():
            assert audio_ready()
            close_audio()
            assert not audio_ready()
            
    def test_open_audio_integration():
        open_audio()
        with audio_cleanup():
            assert audio_ready()
            close_audio()
            assert not audio_ready()
            
    def test_fade_music_in_named_integration():
        open_audio()
        with audio_cleanup():
            load_music("test_music", "magical_night.ogg")
            with music_cleanup():
                fade_music_in_named("test_music", 1000)
                assert music_playing()
                
    def test_fade_music_in_named_with_times_integration():
        open_audio()
        with audio_cleanup():
            load_music("test_music", "magical_night.ogg")
            with music_cleanup():
                fade_music_in_named_with_times("test_music", 2, 1000)
                assert music_playing()
                
    def test_fade_music_in_integration():
        open_audio()
        with audio_cleanup():
            test_music = load_music("test_music", "magical_night.ogg")
            with music_cleanup():
                fade_music_in(test_music, 1000)
                assert music_playing()
                
    def test_fade_music_in_with_times_integration():
        open_audio()
        with audio_cleanup():
            test_music = load_music("test_music", "magical_night.ogg")
            with music_cleanup():
                fade_music_in_with_times(test_music, 2, 1000)
                assert music_playing()
                
    def test_fade_music_out_integration():
        open_audio()
        with audio_cleanup():
            test_music = load_music("test_music", "magical_night.ogg")
            with music_cleanup():
                play_music(test_music)
                fade_music_out(1000)
                delay(3000)
                assert not music_playing()
                
    def test_free_all_music_integration():
        open_audio()
        with audio_cleanup():
            load_music("test_music1", "magical_night.ogg")
            with music_cleanup():
                load_music("test_music2", "dancingFrog.wav")
                free_all_music()
                assert not has_music("test_music1")
                assert not has_music("test_music2")
                
    def test_free_music_integration():
        open_audio()
        with audio_cleanup():
            test_music = load_music("test_music", "magical_night.ogg")
            with music_cleanup():
                play_music(test_music)
                free_music(test_music)
                assert not has_music("test_music")
                
    def test_has_music_integration():
        open_audio()
        with audio_cleanup():
            test_music = load_music("test_music", "magical_night.ogg")
            with music_cleanup():
                assert has_music("test_music")
                free_music(test_music)
                assert not has_music("test_music")
                
    def test_load_music_integration():
        open_audio()
        with audio_cleanup():
            test_music = load_music("test_music", "magical_night.ogg")
            with music_cleanup():
                assert test_music is not None
                assert music_valid(test_music)
                
    def test_music_filename_integration():
        open_audio()
        with audio_cleanup():
            test_music = load_music("test_music", "magical_night.ogg")
            with music_cleanup():
                assert path_to_resource("magical_night.ogg", ResourceKind.SoundResource) == music_filename(test_music)
                
    def test_music_name_integration():
        open_audio()
        with audio_cleanup():
            test_music = load_music("test_music", "magical_night.ogg")
            with music_cleanup():
                assert "test_music" == music_name(test_music)
                
    def test_music_named_integration():
        open_audio()
        with audio_cleanup():
            test_music = load_music("test_music", "magical_night.ogg")
            with music_cleanup():
                named_music = music_named("test_music")
                assert test_music == named_music
                
    def test_music_playing_integration():
        open_audio()
        with audio_cleanup():
            test_music = load_music("test_music", "magical_night.ogg")
            with music_cleanup():
                assert not music_playing()
                play_music(test_music)
                assert music_playing()
                
    def test_music_valid_integration():
        open_audio()
        with audio_cleanup():
            test_music = load_music("test_music", "magical_night.ogg")
            with music_cleanup():
                assert music_valid(test_music)
                free_music(test_music)
                assert not music_valid(test_music)
                
    def test_music_volume_integration():
        open_audio()
        with audio_cleanup():
            test_music = load_music("test_music", "magical_night.ogg")
            with music_cleanup():
                play_music(test_music)
                set_music_volume(0.5)
                assert 0.5 == music_volume()
                
    def test_pause_music_integration():
        open_audio()
        with audio_cleanup():
            test_music = load_music("test_music", "magical_night.ogg")
            with music_cleanup():
                play_music(test_music)
                pause_music()
                assert music_playing()
                
    def test_play_music_named_integration():
        open_audio()
        with audio_cleanup():
            load_music("test_music", "magical_night.ogg")
            with music_cleanup():
                play_music_named("test_music")
                assert music_playing()
                
    def test_play_music_named_with_times_integration():
        open_audio()
        with audio_cleanup():
            load_music("test_music", "magical_night.ogg")
            with music_cleanup():
                play_music_named_with_times("test_music", 2)
                assert music_playing()
                
    def test_play_music_integration():
        open_audio()
        with audio_cleanup():
            test_music = load_music("test_music", "magical_night.ogg")
            with music_cleanup():
                play_music(test_music)
                assert music_playing()
                
    def test_play_music_with_times_integration():
        open_audio()
        with audio_cleanup():
            test_music = load_music("test_music", "magical_night.ogg")
            with music_cleanup():
                play_music_with_times(test_music, 2)
                assert music_playing()
                
    def test_play_music_with_times_and_volume_integration():
        open_audio()
        with audio_cleanup():
            test_music = load_music("test_music", "magical_night.ogg")
            with music_cleanup():
                play_music_with_times_and_volume(test_music, 2, 0.75)
                assert music_playing()
                assert 0.75 == music_volume()
                
    def test_resume_music_integration():
        open_audio()
        with audio_cleanup():
            test_music = load_music("test_music", "magical_night.ogg")
            with music_cleanup():
                play_music(test_music)
                pause_music()
                assert music_playing()
                resume_music()
                assert music_playing()
                
    def test_set_music_volume_integration():
        open_audio()
        with audio_cleanup():
            test_music = load_music("test_music", "magical_night.ogg")
            with music_cleanup():
                play_music(test_music)
                set_music_volume(0.5)
                assert 0.5 == music_volume()
                
    def test_stop_music_integration():
        open_audio()
        with audio_cleanup():
            test_music = load_music("test_music", "magical_night.ogg")
            with music_cleanup():
                play_music(test_music)
                stop_music()
                assert not music_playing()
                
    def test_fade_all_sound_effects_out_integration():
        open_audio()
        with audio_cleanup():
            test_sound1 = load_sound_effect("test_sound1", "comedy_boing.wav")
            with sound_effect_cleanup():
                test_sound2 = load_sound_effect("test_sound2", "comedy_boing.ogg")
                play_sound_effect(test_sound1)
                play_sound_effect(test_sound2)
                fade_all_sound_effects_out(1000)
                delay(1100)
                assert not sound_effect_playing(test_sound1)
                assert not sound_effect_playing(test_sound2)
                
    def test_fade_sound_effect_out_integration():
        open_audio()
        with audio_cleanup():
            test_sound = load_sound_effect("test_sound", "breakdance.wav")
            with sound_effect_cleanup():
                play_sound_effect(test_sound)
                fade_sound_effect_out(test_sound, 1000)
                delay(3000)
                assert not sound_effect_playing(test_sound)
                
    def test_free_all_sound_effects_integration():
        open_audio()
        with audio_cleanup():
            load_sound_effect("test_sound1", "breakdance.wav")
            with sound_effect_cleanup():
                load_sound_effect("test_sound2", "comedy_boing.ogg")
                free_all_sound_effects()
                assert not has_sound_effect("test_sound1")
                assert not has_sound_effect("test_sound2")
                
    def test_free_sound_effect_integration():
        open_audio()
        with audio_cleanup():
            test_sound = load_sound_effect("test_sound", "breakdance.wav")
            with sound_effect_cleanup():
                play_sound_effect(test_sound)
                free_sound_effect(test_sound)
                assert not has_sound_effect("test_sound")
                
    def test_has_sound_effect_integration():
        open_audio()
        with audio_cleanup():
            test_sound = load_sound_effect("test_sound", "breakdance.wav")
            with sound_effect_cleanup():
                assert has_sound_effect("test_sound")
                free_sound_effect(test_sound)
                assert not has_sound_effect("test_sound")
                
    def test_load_sound_effect_integration():
        open_audio()
        with audio_cleanup():
            test_sound = load_sound_effect("test_sound", "breakdance.wav")
            with sound_effect_cleanup():
                assert test_sound is not None
                assert has_sound_effect("test_sound")
                
    def test_play_sound_effect_named_integration():
        open_audio()
        with audio_cleanup():
            test_sound = load_sound_effect("test_sound", "breakdance.wav")
            with sound_effect_cleanup():
                play_sound_effect_named("test_sound")
                assert sound_effect_playing(test_sound)
                
    def test_play_sound_effect_named_with_volume_integration():
        open_audio()
        with audio_cleanup():
            test_sound = load_sound_effect("test_sound", "breakdance.wav")
            with sound_effect_cleanup():
                play_sound_effect_named_with_volume("test_sound", 0.75)
                assert sound_effect_playing(test_sound)
                
    def test_play_sound_effect_named_with_times_integration():
        open_audio()
        with audio_cleanup():
            test_sound = load_sound_effect("test_sound", "breakdance.wav")
            with sound_effect_cleanup():
                play_sound_effect_named_with_times("test_sound", 3)
                assert sound_effect_playing(test_sound)
                
    def test_play_sound_effect_named_with_times_and_volume_integration():
        open_audio()
        with audio_cleanup():
            test_sound = load_sound_effect("test_sound", "breakdance.wav")
            with sound_effect_cleanup():
                play_sound_effect_named_with_times_and_volume("test_sound", 2, 0.75)
                assert sound_effect_playing(test_sound)
                
    def test_play_sound_effect_integration():
        open_audio()
        with audio_cleanup():
            test_sound = load_sound_effect("test_sound", "breakdance.wav")
            with sound_effect_cleanup():
                play_sound_effect(test_sound)
                assert sound_effect_playing(test_sound)
                
    def test_play_sound_effect_with_volume_integration():
        open_audio()
        with audio_cleanup():
            test_sound = load_sound_effect("test_sound", "breakdance.wav")
            with sound_effect_cleanup():
                play_sound_effect_with_volume(test_sound, 0.75)
                assert sound_effect_playing(test_sound)
                
    def test_play_sound_effect_with_times_integration():
        open_audio()
        with audio_cleanup():
            test_sound = load_sound_effect("test_sound", "SwinGameStart.wav")
            with sound_effect_cleanup():
                play_sound_effect_with_times(test_sound, 3)
                assert sound_effect_playing(test_sound)
                
    def test_play_sound_effect_with_times_and_volume_integration():
        open_audio()
        with audio_cleanup():
            test_sound = load_sound_effect("test_sound", "SwinGameStart.wav")
            with sound_effect_cleanup():
                play_sound_effect_with_times_and_volume(test_sound, 2, 0.75)
                assert sound_effect_playing(test_sound)
                
    def test_sound_effect_filename_integration():
        open_audio()
        with audio_cleanup():
            test_sound = load_sound_effect("test_sound", "SwinGameStart.wav")
            with sound_effect_cleanup():
                assert path_to_resource("SwinGameStart.wav", ResourceKind.SoundResource) == sound_effect_filename(test_sound)
                
    def test_sound_effect_name_integration():
        open_audio()
        with audio_cleanup():
            test_sound = load_sound_effect("test_sound", "SwinGameStart.wav")
            with sound_effect_cleanup():
                assert "test_sound" == sound_effect_name(test_sound)
                
    def test_sound_effect_named_integration():
        open_audio()
        with audio_cleanup():
            test_sound = load_sound_effect("test_sound", "SwinGameStart.wav")
            with sound_effect_cleanup():
                named_sound = sound_effect_named("test_sound")
                assert test_sound == named_sound
                
    def test_sound_effect_playing_named_integration():
        open_audio()
        with audio_cleanup():
            load_sound_effect("test_sound", "SwinGameStart.wav")
            with sound_effect_cleanup():
                play_sound_effect_named("test_sound")
                assert sound_effect_playing_named("test_sound")
                stop_sound_effect_named("test_sound")
                assert not sound_effect_playing_named("test_sound")
                
    def test_sound_effect_playing_integration():
        open_audio()
        with audio_cleanup():
            test_sound = load_sound_effect("test_sound", "SwinGameStart.wav")
            with sound_effect_cleanup():
                play_sound_effect(test_sound)
                assert sound_effect_playing(test_sound)
                stop_sound_effect(test_sound)
                assert not sound_effect_playing(test_sound)
                
    def test_sound_effect_valid_integration():
        open_audio()
        with audio_cleanup():
            test_sound = load_sound_effect("test_sound", "SwinGameStart.wav")
            with sound_effect_cleanup():
                assert test_sound is not None
                assert has_sound_effect("test_sound")
                
    def test_stop_sound_effect_named_integration():
        open_audio()
        with audio_cleanup():
            load_sound_effect("test_sound", "SwinGameStart.wav")
            with sound_effect_cleanup():
                play_sound_effect_named("test_sound")
                stop_sound_effect_named("test_sound")
                assert not sound_effect_playing_named("test_sound")
                
    def test_stop_sound_effect_integration():
        open_audio()
        with audio_cleanup():
            test_sound = load_sound_effect("test_sound", "SwinGameStart.wav")
            with sound_effect_cleanup():
                play_sound_effect(test_sound)
                stop_sound_effect(test_sound)
                assert not sound_effect_playing(test_sound)
                
