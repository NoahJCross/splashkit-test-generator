import pytest
from splashkit import *


def test_AudioReady_integration():
    assert audio_ready() is False
    open_audio()
    assert audio_ready() is True
    close_audio()
    assert audio_ready() is False


def test_CloseAudio_integration():
    open_audio()
    close_audio()
    assert audio_ready() is False


def test_OpenAudio_integration():
    assert audio_ready() is False
    open_audio()
    assert audio_ready() is True
    close_audio()
    assert audio_ready() is False


def test_FadeMusicInNamed_integration():
    open_audio()
    test_music = load_music("test_music", "280.mp3")
    fade_music_in_named("test_music", 1000)
    assert music_volume() > 0.0
    free_music(test_music)
    close_audio()


def test_FadeMusicInNamedWithTimes_integration():
    open_audio()
    test_music = load_music("test_music", "280.mp3")
    fade_music_in_named_with_times("test_music", 2, 1000)
    assert music_volume() > 0.0
    free_music(test_music)
    close_audio()


def test_FadeMusicIn_integration():
    open_audio()
    test_music = load_music("test_music", "280.mp3")
    play_music(test_music)
    fade_music_in(test_music, 1000)
    assert music_volume() > 0.0
    free_music(test_music)
    close_audio()


def test_FadeMusicInWithTimes_integration():
    open_audio()
    test_music = load_music("test_music", "280.mp3")
    fade_music_in_with_times(test_music, 2, 1000)
    assert music_volume() > 0.0
    free_music(test_music)
    close_audio()


def test_FadeMusicOut_integration():
    open_audio()
    test_music = load_music("test_music", "280.mp3")
    play_music(test_music)
    fade_music_out(1000)
    assert music_playing() is False
    free_music(test_music)
    close_audio()


def test_FreeAllMusic_integration():
    open_audio()
    test_music1 = load_music("test_music1", "280.mp3")
    test_music2 = load_music("test_music2", "test.ogg")
    free_all_music()
    assert has_music("test_music1") is False
    assert has_music("test_music2") is False
    close_audio()


def test_FreeMusic_integration():
    open_audio()
    test_music = load_music("test_music", "280.mp3")
    play_music(test_music)
    free_music(test_music)
    assert music_playing() is False
    close_audio()


def test_HasMusic_integration():
    open_audio()
    test_music = load_music("test_music", "280.mp3")
    assert has_music("test_music") is True
    free_music(test_music)
    assert has_music("test_music") is False
    close_audio()


def test_LoadMusic_integration():
    open_audio()
    test_music = load_music("test_music", "280.mp3")
    assert music_valid(test_music) is True
    free_music(test_music)
    close_audio()


def test_MusicFilename_integration():
    test_music = load_music("test_music", "280.mp3")
    filename = music_filename(test_music)
    assert "280.mp3" == filename
    free_music(test_music)


def test_MusicName_integration():
    test_music = load_music("test_music", "280.mp3")
    music_name_result = music_name(test_music)
    assert "test_music" == music_name_result
    free_music(test_music)


def test_MusicNamed_integration():
    test_music = load_music("test_music", "280.mp3")
    retrieved_music = music_named("test_music")
    assert retrieved_music == test_music
    free_music(test_music)


def test_MusicPlaying_integration():
    open_audio()
    test_music = load_music("test_music", "280.mp3")
    play_music(test_music)
    assert music_playing() is True
    pause_music()
    assert music_playing() is False
    free_music(test_music)
    close_audio()


def test_MusicValid_integration():
    open_audio()
    test_music = load_music("test_music", "280.mp3")
    assert music_valid(test_music) is True
    free_music(test_music)
    assert music_valid(test_music) is False
    close_audio()


def test_MusicVolume_integration():
    open_audio()
    test_music = load_music("test_music", "280.mp3")
    play_music(test_music)
    set_music_volume(0.5)
    assert 0.5 == music_volume()
    free_music(test_music)
    close_audio()


def test_PauseMusic_integration():
    open_audio()
    test_music = load_music("test_music", "280.mp3")
    play_music(test_music)
    pause_music()
    assert music_playing() is False
    free_music(test_music)
    close_audio()


def test_PlayMusicNamed_integration():
    open_audio()
    test_music = load_music("test_music", "280.mp3")
    play_music_named("test_music")
    assert music_playing() is True
    free_music(test_music)
    close_audio()


def test_PlayMusicNamedWithTimes_integration():
    open_audio()
    test_music = load_music("test_music", "280.mp3")
    play_music_named_with_times("test_music", 2)
    assert music_playing() is True
    free_music(test_music)
    close_audio()


def test_PlayMusic_integration():
    open_audio()
    test_music = load_music("test_music", "280.mp3")
    play_music(test_music)
    assert music_playing() is True
    free_music(test_music)
    close_audio()


def test_PlayMusicWithTimes_integration():
    open_audio()
    test_music = load_music("test_music", "280.mp3")
    play_music_with_times(test_music, 2)
    assert music_playing() is True
    free_music(test_music)
    close_audio()


def test_PlayMusicWithTimesAndVolume_integration():
    open_audio()
    test_music = load_music("test_music", "280.mp3")
    play_music_with_times_and_volume(test_music, 2, 0.5)
    assert music_playing() is True
    assert 0.45 <= music_volume() <= 0.55
    free_music(test_music)
    close_audio()


def test_ResumeMusic_integration():
    open_audio()
    test_music = load_music("test_music", "280.mp3")
    play_music(test_music)
    pause_music()
    assert music_playing() is False
    resume_music()
    assert music_playing() is True
    free_music(test_music)
    close_audio()


def test_SetMusicVolume_integration():
    open_audio()
    test_music = load_music("test_music", "280.mp3")
    play_music(test_music)
    set_music_volume(0.5)
    assert 0.5 == music_volume()
    free_music(test_music)
    close_audio()


def test_StopMusic_integration():
    open_audio()
    test_music = load_music("test_music", "280.mp3")
    play_music(test_music)
    stop_music()
    assert music_playing() is False
    free_music(test_music)
    close_audio()


def test_FadeAllSoundEffectsOut_integration():
    open_audio()
    test_sound1 = load_sound_effect("test_sound1", "test.ogg")
    test_sound2 = load_sound_effect("test_sound2", "error.wav")
    play_sound_effect(test_sound1)
    play_sound_effect(test_sound2)
    fade_all_sound_effects_out(1000)
    assert sound_effect_playing(test_sound1) is False
    assert sound_effect_playing(test_sound2) is False
    free_all_sound_effects()
    close_audio()


def test_FadeSoundEffectOut_integration():
    open_audio()
    test_sound = load_sound_effect("test_sound", "test.ogg")
    play_sound_effect(test_sound)
    fade_sound_effect_out(test_sound, 1000)
    assert sound_effect_playing(test_sound) is False
    free_sound_effect(test_sound)
    close_audio()


def test_FreeAllSoundEffects_integration():
    open_audio()
    test_sound1 = load_sound_effect("test_sound1", "test.ogg")
    test_sound2 = load_sound_effect("test_sound2", "error.wav")
    free_all_sound_effects()
    assert has_sound_effect("test_sound1") is False
    assert has_sound_effect("test_sound2") is False
    close_audio()


def test_FreeSoundEffect_integration():
    open_audio()
    test_sound = load_sound_effect("test_sound", "test.ogg")
    play_sound_effect(test_sound)
    free_sound_effect(test_sound)
    assert sound_effect_valid(test_sound) is False
    close_audio()


def test_HasSoundEffect_integration():
    open_audio()
    test_sound = load_sound_effect("test_sound", "test.ogg")
    assert has_sound_effect("test_sound") is True
    free_sound_effect(test_sound)
    assert has_sound_effect("test_sound") is False
    close_audio()


def test_LoadSoundEffect_integration():
    open_audio()
    test_sound = load_sound_effect("test_sound", "test.ogg")
    assert sound_effect_valid(test_sound) is True
    free_sound_effect(test_sound)
    close_audio()


def test_PlaySoundEffectNamed_integration():
    open_audio()
    test_sound = load_sound_effect("test_sound", "test.ogg")
    play_sound_effect_named("test_sound")
    assert sound_effect_playing_named("test_sound") is True
    free_sound_effect(test_sound)
    close_audio()


def test_PlaySoundEffectNamedWithVolume_integration():
    open_audio()
    test_sound = load_sound_effect("test_sound", "test.ogg")
    play_sound_effect_named_with_volume("test_sound", 0.5)
    assert sound_effect_playing_named("test_sound") is True
    free_sound_effect(test_sound)
    close_audio()


def test_PlaySoundEffectNamedWithTimes_integration():
    open_audio()
    test_sound = load_sound_effect("test_sound", "test.ogg")
    play_sound_effect_named_with_times("test_sound", 3)
    assert sound_effect_playing_named("test_sound") is True
    free_sound_effect(test_sound)
    close_audio()


def test_PlaySoundEffectNamedWithTimesAndVolume_integration():
    open_audio()
    test_sound = load_sound_effect("test_sound", "test.ogg")
    play_sound_effect_named_with_times_and_volume("test_sound", 2, 0.5)
    assert sound_effect_playing_named("test_sound") is True
    free_sound_effect(test_sound)
    close_audio()


def test_PlaySoundEffect_integration():
    open_audio()
    test_sound = load_sound_effect("test_sound", "test.ogg")
    play_sound_effect(test_sound)
    assert sound_effect_playing(test_sound) is True
    free_sound_effect(test_sound)
    close_audio()


def test_PlaySoundEffectWithVolume_integration():
    open_audio()
    test_sound = load_sound_effect("test_sound", "test.ogg")
    play_sound_effect_with_volume(test_sound, 0.5)
    assert sound_effect_playing(test_sound) is True
    free_sound_effect(test_sound)
    close_audio()


def test_PlaySoundEffectWithTimes_integration():
    open_audio()
    test_sound = load_sound_effect("test_sound", "test.ogg")
    play_sound_effect_with_times(test_sound, 3)
    assert sound_effect_playing(test_sound) is True
    free_sound_effect(test_sound)
    close_audio()


def test_PlaySoundEffectWithTimesAndVolume_integration():
    open_audio()
    test_sound = load_sound_effect("test_sound", "test.ogg")
    play_sound_effect_with_times_and_volume(test_sound, 2, 0.5)
    assert sound_effect_playing(test_sound) is True
    free_sound_effect(test_sound)
    close_audio()


def test_SoundEffectFilename_integration():
    test_sound = load_sound_effect("test_sound", "test.ogg")
    test_filename = sound_effect_filename(test_sound)
    assert "test.ogg" == test_filename
    free_sound_effect(test_sound)


def test_SoundEffectName_integration():
    test_sound = load_sound_effect("test_sound", "test.ogg")
    test_sound_name = sound_effect_name(test_sound)
    assert "test_sound" == test_sound_name
    free_sound_effect(test_sound)


def test_SoundEffectNamed_integration():
    open_audio()
    test_sound = load_sound_effect("test_sound", "test.ogg")
    retrieved_sound = sound_effect_named("test_sound")
    assert retrieved_sound == test_sound
    free_sound_effect(test_sound)
    close_audio()


def test_SoundEffectPlayingNamed_integration():
    open_audio()
    test_sound = load_sound_effect("test_sound", "test.ogg")
    play_sound_effect("test_sound")
    assert sound_effect_playing_named("test_sound") is True
    stop_sound_effect("test_sound")
    assert sound_effect_playing_named("test_sound") is False
    free_sound_effect(test_sound)
    close_audio()


def test_SoundEffectPlaying_integration():
    open_audio()
    test_sound = load_sound_effect("test_sound", "test.ogg")
    play_sound_effect(test_sound)
    assert sound_effect_playing(test_sound) is True
    stop_sound_effect(test_sound)
    assert sound_effect_playing(test_sound) is False
    free_sound_effect(test_sound)
    close_audio()


def test_SoundEffectValid_integration():
    open_audio()
    test_sound_effect = load_sound_effect("test_sound", "test.ogg")
    assert sound_effect_valid(test_sound_effect) is True
    free_sound_effect(test_sound_effect)
    close_audio()


def test_StopSoundEffectNamed_integration():
    open_audio()
    test_sound = load_sound_effect("test_sound", "test.ogg")
    play_sound_effect("test_sound")
    stop_sound_effect_named("test_sound")
    assert sound_effect_playing_named("test_sound") is False
    free_sound_effect(test_sound)
    close_audio()

