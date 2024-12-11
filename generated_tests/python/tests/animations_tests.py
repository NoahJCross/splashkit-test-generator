import pytest
from splashkit import *

class TestAnimations:

def test_animation_count_integration():
    script = load_animation_script("kermit", "kermit.txt")
    count = animation_count(script)
    assert count > 0
    free_animation_script(script)


def test_animation_current_cell_integration():
    kermit_script = load_animation_script("kermit", "kermit.txt")
    anim = create_animation(kermit_script, "moonwalkback")
    current_cell = animation_current_cell(anim)
    assert current_cell > -1
    free_animation(anim)
    free_animation_script(kermit_script)


def test_animation_current_vector_integration():
    kermit_script = load_animation_script("kermit", "kermit.txt")
    anim = create_animation(kermit_script, "moonwalkback")
    current_vector = animation_current_vector(anim)
    assert 0 == current_vector.x
    assert 0 == current_vector.y
    free_animation(anim)
    free_animation_script(kermit_script)


def test_animation_ended_integration():
    kermit_script = load_animation_script("kermit", "kermit.txt")
    anim = create_animation(kermit_script, "moonwalkback")
    assert not animation_ended(anim)
    for _ in range(50):
        update_animation(anim, 100.0)
    
    assert not animation_ended(anim)
    update_animation(anim)
    assert animation_ended(anim)
    free_animation(anim)
    free_animation_script(kermit_script)


def test_animation_entered_frame_integration():
    kermit_script = load_animation_script("kermit", "kermit.txt")
    anim = create_animation(kermit_script, "walkfront")
    update_animation(anim, 20)
    assert animation_entered_frame(anim)
    update_animation(anim)
    assert not animation_entered_frame(anim)
    free_animation(anim)
    free_animation_script(kermit_script)


def test_animation_frame_time_integration():
    kermit_script = load_animation_script("kermit", "kermit.txt")
    anim = create_animation(kermit_script, "walkfront")
    update_animation(anim)
    frame_time = animation_frame_time(anim)
    assert frame_time > 0
    free_animation(anim)
    free_animation_script(kermit_script)


def test_animation_index_integration():
    script = load_animation_script("kermit", "kermit.txt")
    index = animation_index(script, "walkfront")
    assert index > -1
    non_existent_index = animation_index(script, "NonExistentAnimation")
    assert -1 == non_existent_index
    free_animation_script(script)


def test_animation_name_integration():
    kermit_script = load_animation_script("kermit", "kermit.txt")
    anim = create_animation(kermit_script, "moonwalkback")
    anim_name = animation_name(anim)
    assert "moonwalkback" == anim_name
    free_animation(anim)
    free_animation_script(kermit_script)


def test_animation_script_name_integration():
    kermit_script = load_animation_script("kermit", "kermit.txt")
    script_name = animation_script_name(kermit_script)
    assert "kermit" == script_name
    free_animation_script(kermit_script)


def test_animation_script_named_integration():
    kermit_script = load_animation_script("kermit", "kermit.txt")
    loaded_script = animation_script_named("kermit")
    assert loaded_script is not None
    assert loaded_script == loaded_script
    free_animation_script(kermit_script)


def test_assign_animation_with_script_integration():
    kermit_script = load_animation_script("kermit", "kermit.txt")
    anim = create_animation(kermit_script, "moonwalkback")
    assign_animation(anim, kermit_script, "walkfront")
    assert "walkfront" == animation_name(anim)
    free_animation_script(kermit_script)
    free_animation(anim)


def test_assign_animation_with_script_and_sound_integration():
    kermit_script = load_animation_script("kermit", "kermit.txt")
    anim = create_animation(kermit_script, "walkfront")
    assign_animation(anim, kermit_script, "walkleft", true)
    assert "walkleft" == animation_name(anim)
    free_animation(anim)
    free_animation_script(kermit_script)


def test_assign_animation_index_with_script_integration():
    kermit_script = load_animation_script("kermit", "kermit.txt")
    anim = create_animation(kermit_script, "moonwalkback")
    assign_animation(anim, kermit_script, 0)
    assert "walkfront" == animation_name(anim)
    free_animation_script(kermit_script)
    free_animation(anim)


def test_assign_animation_index_with_script_and_sound_integration():
    kermit_script = load_animation_script("kermit", "kermit.txt")
    anim = create_animation(kermit_script, "moonwalkback")
    assign_animation(anim, kermit_script, 0, true)
    assert "walkfront" == animation_name(anim)
    free_animation_script(kermit_script)
    free_animation(anim)


def test_assign_animation_with_script_named_integration():
    kermit_script = load_animation_script("kermit", "kermit.txt")
    anim = create_animation(kermit_script, "moonwalkback")
    assign_animation(anim, "kermit", "walkfront")
    assert "walkfront" == animation_name(anim)
    free_animation_script(kermit_script)
    free_animation(anim)


def test_assign_animation_with_script_named_and_sound_integration():
    kermit_script = load_animation_script("kermit", "kermit.txt")
    anim = create_animation(kermit_script, "walkfront")
    assign_animation(anim, "kermit", "walkfront", true)
    assert "walkfront" == animation_name(anim)
    free_animation(anim)
    free_animation_script(kermit_script)


def test_assign_animation_index_integration():
    kermit_script = load_animation_script("kermit", "kermit.txt")
    anim = create_animation(kermit_script, "moonwalkback")
    assign_animation(anim, 0)
    assert 0 == animation_current_cell(anim)
    free_animation(anim)
    free_animation_script(kermit_script)


def test_assign_animation_index_with_sound_integration():
    kermit_script = load_animation_script("kermit", "kermit.txt")
    anim = create_animation(kermit_script, "moonwalkback", false)
    assign_animation(anim, 0, true)
    assert animation_entered_frame(anim)
    free_animation_script(kermit_script)
    free_animation(anim)


def test_assign_animation_integration():
    kermit_script = load_animation_script("kermit", "kermit.txt")
    anim = create_animation(kermit_script, "moonwalkback")
    assign_animation(anim, "walkfront")
    assert "walkfront" == animation_name(anim)
    free_animation(anim)
    free_animation_script(kermit_script)


def test_assign_animation_with_sound_integration():
    kermit_script = load_animation_script("kermit", "kermit.txt")
    anim = create_animation(kermit_script, "moonwalkback")
    assign_animation(anim, "walkfront", true)
    assert "walkfront" == animation_name(anim)
    free_animation_script(kermit_script)
    free_animation(anim)


def test_create_animation_from_index_with_sound_integration():
    kermit_script = load_animation_script("kermit", "kermit.txt")
    anim = create_animation(kermit_script, 0, true)
    assert anim is not None
    anim_name = animation_name(anim)
    assert "walkfront" == anim_name
    free_animation(anim)
    free_animation_script(kermit_script)


def test_create_animation_integration():
    kermit_script = load_animation_script("kermit", "kermit.txt")
    anim = create_animation(kermit_script, "moonwalkback")
    assert anim is not None
    anim_name = animation_name(anim)
    assert "moonwalkback" == anim_name
    free_animation(anim)
    free_animation_script(kermit_script)


def test_create_animation_with_sound_integration():
    kermit_script = load_animation_script("kermit", "kermit.txt")
    anim = create_animation(kermit_script, "moonwalkback", true)
    assert anim is not None
    anim_name = animation_name(anim)
    assert "moonwalkback" == anim_name
    free_animation_script(kermit_script)
    free_animation(anim)


def test_create_animation_from_script_named_integration():
    kermit_script = load_animation_script("kermit", "kermit.txt")
    anim = create_animation("kermit", "moonwalkback")
    assert anim is not None
    anim_name = animation_name(anim)
    assert "moonwalkback" == anim_name
    free_animation(anim)
    free_animation_script(kermit_script)


def test_create_animation_from_script_named_with_sound_integration():
    kermit_script = load_animation_script("kermit", "kermit.txt")
    anim = create_animation(kermit_script, "moonwalkback", true)
    assert anim is not None
    anim_name = animation_name(anim)
    assert "moonwalkback" == anim_name
    free_animation_script(kermit_script)
    free_animation(anim)


def test_free_all_animation_scripts_integration():
    kermit_script = load_animation_script("kermit", "kermit.txt")
    assert has_animation_script("kermit")
    free_all_animation_scripts()
    assert not has_animation_script("kermit")


def test_free_animation_integration():
    kermit_script = load_animation_script("kermit", "kermit.txt")
    anim = create_animation(kermit_script, "moonwalkback")
    free_animation(anim)
    assert nil == animation_name(anim)
    assert animation_ended(anim)
    free_animation_script(kermit_script)


def test_free_animation_script_integration():
    script = load_animation_script("kermit", "kermit.txt")
    assert script is not None
    free_animation_script(script)
    script_exists = has_animation_script("kermit")
    assert not script_exists


def test_free_animation_script_with_name_integration():
    kermit_script = load_animation_script("kermit", "kermit.txt")
    assert has_animation_script("kermit")
    free_animation_script("kermit")
    assert not has_animation_script("kermit")


def test_has_animation_named_integration():
    kermit_script = load_animation_script("kermit", "kermit.txt")
    has_walkfront = has_animation_named(kermit_script, "walkfront")
    assert has_walkfront
    has_nonexistent = has_animation_named(kermit_script, "NonExistentAnimation")
    assert not has_nonexistent
    free_animation_script(kermit_script)


def test_has_animation_script_integration():
    kermit_script = load_animation_script("kermit", "kermit.txt")
    assert has_animation_script("kermit")
    free_animation_script(kermit_script)
    assert not has_animation_script("kermit")


def test_load_animation_script_integration():
    loaded_script = load_animation_script("test_animation", "kermit.txt")
    assert loaded_script is not None
    script_name = animation_script_name(loaded_script)
    assert "test_animation" == script_name
    free_animation_script(loaded_script)
    script_exists = has_animation_script("test_animation")
    assert not script_exists


def test_restart_animation_integration():
    kermit_script = load_animation_script("kermit", "kermit.txt")
    anim = create_animation(kermit_script, "moonwalkback")
    for _ in range(50):
        update_animation(anim, 100.0)
    
    anim_ended = animation_ended(anim)
    assert anim_ended
    restart_animation(anim)
    anim_ended_after_restart = animation_ended(anim)
    assert not anim_ended_after_restart
    free_animation(anim)
    free_animation_script(kermit_script)


def test_restart_animation_with_sound_integration():
    kermit_script = load_animation_script("kermit", "kermit.txt")
    anim = create_animation(kermit_script, "moonwalkback", true)
    update_animation(anim)
    restart_animation(anim, true)
    assert 3 == animation_current_cell(anim)
    free_animation(anim)
    free_animation_script(kermit_script)


def test_update_animation_percent_with_sound_integration():
    kermit_script = load_animation_script("kermit", "kermit.txt")
    anim = create_animation(kermit_script, "moonwalkback")
    update_animation(anim, 0.5, true)
    assert animation_frame_time(anim) > 0
    free_animation(anim)
    free_animation_script(kermit_script)


def test_update_animation_integration():
    kermit_script = load_animation_script("kermit", "kermit.txt")
    anim = create_animation(kermit_script, "moonwalkback")
    update_animation(anim)
    assert 0 != animation_current_cell(anim)
    free_animation(anim)
    free_animation_script(kermit_script)


def test_update_animation_percent_integration():
    kermit_script = load_animation_script("kermit", "kermit.txt")
    anim = create_animation(kermit_script, "walkfront")
    update_animation(anim, 0.5)
    assert animation_frame_time(anim) > 0
    free_animation(anim)
    free_animation_script(kermit_script)


def test_audio_ready_integration():
    assert not audio_ready()
    open_audio()
    assert audio_ready()
    close_audio()
    assert not audio_ready()


def test_close_audio_integration():
    open_audio()
    assert audio_ready()
    close_audio()
    assert not audio_ready()


def test_open_audio_integration():
    open_audio()
    assert audio_ready()
    close_audio()
    assert not audio_ready()


def test_fade_music_in_named_integration():
    open_audio()
    test_music = load_music("test_music", "magical_night.ogg")
    fade_music_in("test_music", 1000)
    assert music_playing()
    free_music(test_music)
    close_audio()


def test_fade_music_in_named_with_times_integration():
    open_audio()
    test_music = load_music("test_music", "magical_night.ogg")
    fade_music_in("test_music", 2, 1000)
    assert music_playing()
    free_music(test_music)
    close_audio()


def test_fade_music_in_integration():
    open_audio()
    test_music = load_music("test_music", "magical_night.ogg")
    fade_music_in(test_music, 1000)
    assert music_playing()
    free_music(test_music)
    close_audio()


def test_fade_music_in_with_times_integration():
    open_audio()
    test_music = load_music("test_music", "magical_night.ogg")
    fade_music_in(test_music, 2, 1000)
    assert music_playing()
    free_music(test_music)
    close_audio()


def test_fade_music_out_integration():
    open_audio()
    test_music = load_music("test_music", "magical_night.ogg")
    play_music(test_music)
    fade_music_out(1000)
    delay(3000)
    assert not music_playing()
    free_music(test_music)
    close_audio()


def test_free_all_music_integration():
    open_audio()
    load_music("test_music1", "magical_night.ogg")
    load_music("test_music2", "dancingFrog.wav")
    free_all_music()
    assert not has_music("test_music1")
    assert not has_music("test_music2")
    close_audio()


def test_free_music_integration():
    open_audio()
    test_music = load_music("test_music", "magical_night.ogg")
    play_music(test_music)
    free_music(test_music)
    assert not has_music("test_music")
    close_audio()


def test_has_music_integration():
    open_audio()
    test_music = load_music("test_music", "magical_night.ogg")
    assert has_music("test_music")
    free_music(test_music)
    assert not has_music("test_music")
    close_audio()


def test_load_music_integration():
    open_audio()
    test_music = load_music("test_music", "magical_night.ogg")
    assert test_music is not None
    assert music_valid(test_music)
    free_music(test_music)
    close_audio()


def test_music_filename_integration():
    open_audio()
    test_music = load_music("test_music", "magical_night.ogg")
    assert path_to_resource("magical_night.ogg", ResourceKind.SoundResource) == music_filename(test_music)
    free_music(test_music)
    close_audio()


def test_music_name_integration():
    open_audio()
    test_music = load_music("test_music", "magical_night.ogg")
    assert "test_music" == music_name(test_music)
    free_music(test_music)
    close_audio()


def test_music_named_integration():
    open_audio()
    test_music = load_music("test_music", "magical_night.ogg")
    named_music = music_named("test_music")
    assert test_music == named_music
    free_music(test_music)
    close_audio()


def test_music_playing_integration():
    open_audio()
    test_music = load_music("test_music", "magical_night.ogg")
    assert not music_playing()
    play_music(test_music)
    assert music_playing()
    free_music(test_music)
    close_audio()


def test_music_valid_integration():
    open_audio()
    test_music = load_music("test_music", "magical_night.ogg")
    assert music_valid(test_music)
    free_music(test_music)
    assert not music_valid(test_music)
    close_audio()


def test_music_volume_integration():
    open_audio()
    test_music = load_music("test_music", "magical_night.ogg")
    play_music(test_music)
    set_music_volume(0.5)
    assert 0.5 == music_volume()
    free_music(test_music)
    close_audio()


def test_pause_music_integration():
    open_audio()
    test_music = load_music("test_music", "magical_night.ogg")
    play_music(test_music)
    pause_music()
    assert music_playing()
    free_music(test_music)
    close_audio()


def test_play_music_named_integration():
    open_audio()
    test_music = load_music("test_music", "magical_night.ogg")
    play_music("test_music")
    assert music_playing()
    free_music(test_music)
    close_audio()


def test_play_music_named_with_times_integration():
    open_audio()
    test_music = load_music("test_music", "magical_night.ogg")
    play_music("test_music", 2)
    assert music_playing()
    free_music(test_music)
    close_audio()


def test_play_music_integration():
    open_audio()
    test_music = load_music("test_music", "magical_night.ogg")
    play_music(test_music)
    assert music_playing()
    free_music(test_music)
    close_audio()


def test_play_music_with_times_integration():
    open_audio()
    test_music = load_music("test_music", "magical_night.ogg")
    play_music(test_music, 2)
    assert music_playing()
    free_music(test_music)
    close_audio()


def test_play_music_with_times_and_volume_integration():
    open_audio()
    test_music = load_music("test_music", "magical_night.ogg")
    play_music(test_music, 2, 0.75)
    assert music_playing()
    assert 0.75 == music_volume()
    free_music(test_music)
    close_audio()


def test_resume_music_integration():
    open_audio()
    test_music = load_music("test_music", "magical_night.ogg")
    play_music(test_music)
    pause_music()
    assert music_playing()
    resume_music()
    assert music_playing()
    free_music(test_music)
    close_audio()


def test_set_music_volume_integration():
    open_audio()
    test_music = load_music("test_music", "magical_night.ogg")
    play_music(test_music)
    set_music_volume(0.5)
    assert 0.5 == music_volume()
    free_music(test_music)
    close_audio()


def test_stop_music_integration():
    open_audio()
    test_music = load_music("test_music", "magical_night.ogg")
    play_music(test_music)
    stop_music()
    assert not music_playing()
    free_music(test_music)
    close_audio()


def test_fade_all_sound_effects_out_integration():
    open_audio()
    test_sound1 = load_sound_effect("test_sound1", "breakdance.wav")
    test_sound2 = load_sound_effect("test_sound2", "comedy_boing.ogg")
    play_sound_effect(test_sound1)
    play_sound_effect(test_sound2)
    fade_all_sound_effects_out(1000)
    assert not sound_effect_playing(test_sound1)
    assert not sound_effect_playing(test_sound2)
    free_all_sound_effects()
    close_audio()


def test_fade_sound_effect_out_integration():
    open_audio()
    test_sound = load_sound_effect("test_sound", "breakdance.wav")
    play_sound_effect(test_sound)
    fade_sound_effect_out(test_sound, 1000)
    delay(3000)
    assert not sound_effect_playing(test_sound)
    free_sound_effect(test_sound)
    close_audio()


def test_free_all_sound_effects_integration():
    open_audio()
    load_sound_effect("test_sound1", "breakdance.wav")
    load_sound_effect("test_sound2", "comedy_boing.ogg")
    free_all_sound_effects()
    assert not has_sound_effect("test_sound1")
    assert not has_sound_effect("test_sound2")
    close_audio()


def test_free_sound_effect_integration():
    open_audio()
    test_sound = load_sound_effect("test_sound", "breakdance.wav")
    play_sound_effect(test_sound)
    free_sound_effect(test_sound)
    assert not has_sound_effect("test_sound")
    close_audio()


def test_has_sound_effect_integration():
    open_audio()
    test_sound = load_sound_effect("test_sound", "breakdance.wav")
    assert has_sound_effect("test_sound")
    free_sound_effect(test_sound)
    assert not has_sound_effect("test_sound")
    close_audio()


def test_load_sound_effect_integration():
    open_audio()
    test_sound = load_sound_effect("test_sound", "breakdance.wav")
    assert test_sound is not None
    assert has_sound_effect("test_sound")
    free_sound_effect(test_sound)
    close_audio()


def test_play_sound_effect_named_integration():
    open_audio()
    test_sound = load_sound_effect("test_sound", "breakdance.wav")
    play_sound_effect("test_sound")
    assert sound_effect_playing(test_sound)
    free_sound_effect(test_sound)
    close_audio()


def test_play_sound_effect_named_with_volume_integration():
    open_audio()
    test_sound = load_sound_effect("test_sound", "breakdance.wav")
    play_sound_effect("test_sound", 0.75)
    assert sound_effect_playing(test_sound)
    free_sound_effect(test_sound)
    close_audio()


def test_play_sound_effect_named_with_times_integration():
    open_audio()
    test_sound = load_sound_effect("test_sound", "breakdance.wav")
    play_sound_effect("test_sound", 3)
    assert sound_effect_playing(test_sound)
    free_sound_effect(test_sound)
    close_audio()


def test_play_sound_effect_named_with_times_and_volume_integration():
    open_audio()
    test_sound = load_sound_effect("test_sound", "breakdance.wav")
    play_sound_effect("test_sound", 2, 0.75)
    assert sound_effect_playing(test_sound)
    free_sound_effect(test_sound)
    close_audio()


def test_play_sound_effect_integration():
    open_audio()
    test_sound = load_sound_effect("test_sound", "breakdance.wav")
    play_sound_effect(test_sound)
    assert sound_effect_playing(test_sound)
    free_sound_effect(test_sound)
    close_audio()


def test_play_sound_effect_with_volume_integration():
    open_audio()
    test_sound = load_sound_effect("test_sound", "breakdance.wav")
    play_sound_effect(test_sound, 0.75)
    assert sound_effect_playing(test_sound)
    free_sound_effect(test_sound)
    close_audio()


def test_play_sound_effect_with_times_integration():
    open_audio()
    test_sound = load_sound_effect("test_sound", "SwinGameStart.wav")
    play_sound_effect(test_sound, 3)
    assert sound_effect_playing(test_sound)
    free_sound_effect(test_sound)
    close_audio()


def test_play_sound_effect_with_times_and_volume_integration():
    open_audio()
    test_sound = load_sound_effect("test_sound", "SwinGameStart.wav")
    play_sound_effect(test_sound, 2, 0.75)
    assert sound_effect_playing(test_sound)
    free_sound_effect(test_sound)
    close_audio()


def test_sound_effect_filename_integration():
    open_audio()
    test_sound = load_sound_effect("test_sound", "SwinGameStart.wav")
    assert path_to_resource("SwinGameStart.wav", ResourceKind.SoundResource) == sound_effect_filename(test_sound)
    free_sound_effect(test_sound)
    close_audio()


def test_sound_effect_name_integration():
    open_audio()
    test_sound = load_sound_effect("test_sound", "SwinGameStart.wav")
    assert "test_sound" == sound_effect_name(test_sound)
    free_sound_effect(test_sound)
    close_audio()


def test_sound_effect_named_integration():
    open_audio()
    test_sound = load_sound_effect("test_sound", "SwinGameStart.wav")
    named_sound = sound_effect_named("test_sound")
    assert test_sound == named_sound
    free_sound_effect(test_sound)
    close_audio()


def test_sound_effect_playing_named_integration():
    open_audio()
    test_sound = load_sound_effect("test_sound", "SwinGameStart.wav")
    play_sound_effect("test_sound")
    assert sound_effect_playing("test_sound")
    stop_sound_effect("test_sound")
    assert not sound_effect_playing("test_sound")
    free_sound_effect(test_sound)
    close_audio()


def test_sound_effect_playing_integration():
    open_audio()
    test_sound = load_sound_effect("test_sound", "SwinGameStart.wav")
    play_sound_effect(test_sound)
    assert sound_effect_playing(test_sound)
    stop_sound_effect(test_sound)
    assert not sound_effect_playing(test_sound)
    free_sound_effect(test_sound)
    close_audio()


def test_sound_effect_valid_integration():
    open_audio()
    test_sound = load_sound_effect("test_sound", "SwinGameStart.wav")
    assert test_sound is not None
    assert has_sound_effect("test_sound")
    free_sound_effect(test_sound)
    close_audio()


def test_stop_sound_effect_named_integration():
    open_audio()
    test_sound = load_sound_effect("test_sound", "SwinGameStart.wav")
    play_sound_effect("test_sound")
    stop_sound_effect("test_sound")
    assert not sound_effect_playing("test_sound")
    free_sound_effect(test_sound)
    close_audio()


def test_stop_sound_effect_integration():
    open_audio()
    test_sound = load_sound_effect("test_sound", "SwinGameStart.wav")
    play_sound_effect(test_sound)
    stop_sound_effect(test_sound)
    assert not sound_effect_playing(test_sound)
    free_sound_effect(test_sound)
    close_audio()


def test_camera_position_integration():
    test_window = open_window("Test Window", 800, 600)
    test_camera_position = camera_position()
    assert 0.0 == test_camera_position.x
    assert 0.0 == test_camera_position.y
    close_window(test_window)


def test_camera_x_integration():
    test_window = open_window("Test Window", 800, 600)
    set_camera_position(point_at(100.0, 100.0))
    assert 100.0 == camera_x()
    close_window(test_window)


def test_camera_y_integration():
    test_window = open_window("Test Window", 800, 600)
    set_camera_position(point_at(100.0, 200.0))
    assert 200.0 == camera_y()
    close_window(test_window)


def test_center_camera_on_vector_integration():
    test_window = open_window("Test Window", 800, 600)
    test_sprite = create_sprite("test_sprite")
    sprite_set_position(test_sprite, point_at(100.0, 100.0))
    center_camera_on(test_sprite, vector_from_angle(50.0, 50.0))
    assert point_at(-267.8606182336807, -161.69777810573578) == camera_position()
    free_sprite(test_sprite)
    close_window(test_window)


def test_center_camera_on_integration():
    test_window = open_window("Test Window", 800, 600)
    test_sprite = create_sprite("test_sprite")
    sprite_set_position(test_sprite, point_at(100.0, 100.0))
    center_camera_on(test_sprite, 0.0, 0.0)
    assert point_at(-300, -200) == camera_position()
    free_sprite(test_sprite)
    close_window(test_window)


def test_move_camera_by_vector_integration():
    test_window = open_window("Test Window", 800, 600)
    test_vector = vector_from_angle(0.0, 100.0)
    move_camera_by(test_vector)
    assert 100.0 == camera_x()
    assert 0.0 == camera_y()
    close_window(test_window)


def test_move_camera_by_integration():
    test_window = open_window("Test Window", 800, 600)
    move_camera_by(100.0, 100.0)
    assert 100.0 == camera_x()
    assert 100.0 == camera_y()
    close_window(test_window)


def test_move_camera_to_point_integration():
    test_window = open_window("Test Window", 800, 600)
    move_camera_to(point_at(100.0, 100.0))
    assert point_at(100.0, 100.0) == camera_position()
    close_window(test_window)


def test_move_camera_to_integration():
    test_window = open_window("Test Window", 800, 600)
    move_camera_to(100.0, 100.0)
    assert 100.0 == camera_x()
    assert 100.0 == camera_y()
    close_window(test_window)


def test_point_in_window_integration():
    test_window = open_window("Test Window", 800, 600)
    test_point = point_at(400, 300)
    assert point_in_window(test_window, test_point)
    test_point_outside = point_at(1000, 1000)
    assert not point_in_window(test_window, test_point_outside)
    close_window(test_window)


def test_point_on_screen_integration():
    test_window = open_window("Test Window", 800, 600)
    test_point = point_at(400.0, 300.0)
    assert point_on_screen(test_point)
    test_point_outside = point_at(1000.0, 1000.0)
    assert not point_on_screen(test_point_outside)
    close_window(test_window)


def test_rect_in_window_integration():
    test_window = open_window("Test Window", 800, 600)
    set_camera_x(0)
    set_camera_y(0)
    test_rectangle = rectangle_from(0, 0, 100, 100)
    assert rect_in_window(test_window, test_rectangle)
    test_rectangle_outside = rectangle_from(1000, 1000, 100, 100)
    assert not rect_in_window(test_window, test_rectangle_outside)
    close_window(test_window)


def test_rect_on_screen_integration():
    test_window = open_window("Test Window", 800, 600)
    test_rectangle = rectangle_from(0, 0, 100, 100)
    assert rect_on_screen(test_rectangle)
    move_camera_to(1000, 1000)
    assert not rect_on_screen(test_rectangle)
    close_window(test_window)


def test_screen_center_integration():
    test_window = open_window("Test Window", 800, 600)
    set_camera_x(0)
    set_camera_y(0)
    test_center = screen_center()
    assert 400 == test_center.x
    assert 300 == test_center.y
    close_window(test_window)


def test_screen_rectangle_integration():
    test_window = open_window("Test Window", 800, 600)
    test_rectangle = screen_rectangle()
    assert 800 == test_rectangle.width
    assert 600 == test_rectangle.height
    close_window(test_window)


def test_set_camera_position_integration():
    test_window = open_window("Test Window", 800, 600)
    set_camera_position(point_at(100.0, 100.0))
    assert point_at(100.0, 100.0) == camera_position()
    close_window(test_window)


def test_set_camera_x_integration():
    test_window = open_window("Test Window", 800, 600)
    set_camera_x(100.0)
    assert 100.0 == camera_x()
    close_window(test_window)


def test_set_camera_y_integration():
    test_window = open_window("Test Window", 800, 600)
    set_camera_y(100.0)
    assert 100.0 == camera_y()
    close_window(test_window)


def test_to_screen_point_integration():
    test_window = open_window("Test Window", 800, 600)
    set_camera_position(point_at(100.0, 100.0))
    test_screen_point = to_screen(point_at(150.0, 150.0))
    assert 50.0 == test_screen_point.x
    assert 50.0 == test_screen_point.y
    close_window(test_window)


def test_to_screen_rectangle_integration():
    test_window = open_window("Test Window", 800, 600)
    test_rectangle = rectangle_from(100.0, 100.0, 200.0, 200.0)
    screen_rectangle = to_screen(test_rectangle)
    assert to_screen_x(100.0) == rectangle_left(screen_rectangle)
    assert to_screen_y(100.0) == rectangle_top(screen_rectangle)
    close_window(test_window)


def test_to_screen_x_integration():
    set_camera_x(100.0)
    test_screen_x = to_screen_x(150.0)
    assert 50.0 == test_screen_x


def test_to_screen_y_integration():
    test_window = open_window("Test Window", 800, 600)
    set_camera_position(point_at(100.0, 100.0))
    test_screen_y = to_screen_y(150.0)
    assert 50.0 == test_screen_y
    close_window(test_window)


def test_to_world_integration():
    test_window = open_window("Test Window", 800, 600)
    set_camera_position(point_at(100.0, 100.0))
    test_world_point = to_world(point_at(400.0, 300.0))
    assert 500.0 == test_world_point.x
    assert 400.0 == test_world_point.y
    close_window(test_window)


def test_to_world_x_integration():
    test_window = open_window("Test Window", 800, 600)
    set_camera_position(point_at(100.0, 100.0))
    test_world_x = to_world_x(400.0)
    assert 500.0 == test_world_x
    close_window(test_window)


def test_to_world_y_integration():
    test_window = open_window("Test Window", 800, 600)
    set_camera_position(point_at(100.0, 100.0))
    test_world_y = to_world_y(300.0)
    assert 400.0 == test_world_y
    close_window(test_window)


def test_vector_world_to_screen_integration():
    test_vector = vector_world_to_screen()
    assert vector_from_angle(0.0, 0.0) != test_vector


def test_window_area_integration():
    test_window = open_window("Test Window", 800, 600)
    test_area = window_area(test_window)
    assert 800 == test_area.width
    assert 600 == test_area.height
    close_window(test_window)


def test_alpha_of_integration():
    red_color = color_red()
    alpha_value = alpha_of(red_color)
    assert 255 == alpha_value
    transparent_color = color_transparent()
    alpha_value_transparent = alpha_of(transparent_color)
    assert 255 == alpha_value_transparent


def test_blue_of_integration():
    blue_color = color_blue()
    blue_value = blue_of(blue_color)
    assert 255 == blue_value
    red_color = color_red()
    blue_value_red = blue_of(red_color)
    assert 0 == blue_value_red


def test_brightness_of_integration():
    white_color = color_white()
    white_brightness = brightness_of(white_color)
    assert 1.0 == white_brightness
    black_color = color_black()
    black_brightness = brightness_of(black_color)
    assert 0.0 == black_brightness
    gray_color = color_gray()
    gray_brightness = brightness_of(gray_color)
    assert 0.4 <= gray_brightness <= 0.6


def test_color_alice_blue_integration():
    alice_blue_color = color_alice_blue()
    assert 240 == red_of(alice_blue_color)
    assert 248 == green_of(alice_blue_color)
    assert 255 == blue_of(alice_blue_color)
    assert 255 == alpha_of(alice_blue_color)


def test_color_antique_white_integration():
    antique_white_color = color_antique_white()
    assert 250 == red_of(antique_white_color)
    assert 235 == green_of(antique_white_color)
    assert 215 == blue_of(antique_white_color)
    assert 255 == alpha_of(antique_white_color)


def test_color_aqua_integration():
    aqua_color = color_aqua()
    assert 0 == red_of(aqua_color)
    assert 255 == green_of(aqua_color)
    assert 255 == blue_of(aqua_color)
    assert 255 == alpha_of(aqua_color)


def test_color_aquamarine_integration():
    aquamarine_color = color_aquamarine()
    assert 127 == red_of(aquamarine_color)
    assert 255 == green_of(aquamarine_color)
    assert 212 == blue_of(aquamarine_color)
    assert 255 == alpha_of(aquamarine_color)


def test_color_azure_integration():
    azure_color = color_azure()
    assert 240 == red_of(azure_color)
    assert 255 == green_of(azure_color)
    assert 255 == blue_of(azure_color)
    assert 255 == alpha_of(azure_color)


def test_color_beige_integration():
    beige_color = color_beige()
    assert 245 == red_of(beige_color)
    assert 245 == green_of(beige_color)
    assert 220 == blue_of(beige_color)
    assert 255 == alpha_of(beige_color)


def test_color_bisque_integration():
    bisque_color = color_bisque()
    assert 255 == red_of(bisque_color)
    assert 228 == green_of(bisque_color)
    assert 196 == blue_of(bisque_color)
    assert 255 == alpha_of(bisque_color)


def test_color_black_integration():
    black_color = color_black()
    assert 0 == red_of(black_color)
    assert 0 == green_of(black_color)
    assert 0 == blue_of(black_color)
    assert 255 == alpha_of(black_color)


def test_color_blanched_almond_integration():
    blanched_almond_color = color_blanched_almond()
    assert 255 == red_of(blanched_almond_color)
    assert 235 == green_of(blanched_almond_color)
    assert 205 == blue_of(blanched_almond_color)
    assert 255 == alpha_of(blanched_almond_color)


def test_color_blue_integration():
    blue_color = color_blue()
    assert 0 == red_of(blue_color)
    assert 0 == green_of(blue_color)
    assert 255 == blue_of(blue_color)
    assert 255 == alpha_of(blue_color)


def test_color_blue_violet_integration():
    blue_violet_color = color_blue_violet()
    assert 138 == red_of(blue_violet_color)
    assert 43 == green_of(blue_violet_color)
    assert 226 == blue_of(blue_violet_color)
    assert 255 == alpha_of(blue_violet_color)


def test_color_bright_green_integration():
    bright_green_color = color_bright_green()
    assert 0 == red_of(bright_green_color)
    assert 255 == green_of(bright_green_color)
    assert 0 == blue_of(bright_green_color)
    assert 255 == alpha_of(bright_green_color)


def test_color_brown_integration():
    brown_color = color_brown()
    assert 165 == red_of(brown_color)
    assert 42 == green_of(brown_color)
    assert 42 == blue_of(brown_color)
    assert 255 == alpha_of(brown_color)


def test_color_burly_wood_integration():
    burly_wood_color = color_burly_wood()
    assert 222 == red_of(burly_wood_color)
    assert 184 == green_of(burly_wood_color)
    assert 135 == blue_of(burly_wood_color)
    assert 255 == alpha_of(burly_wood_color)


def test_color_cadet_blue_integration():
    cadet_blue_color = color_cadet_blue()
    assert 95 == red_of(cadet_blue_color)
    assert 158 == green_of(cadet_blue_color)
    assert 160 == blue_of(cadet_blue_color)
    assert 255 == alpha_of(cadet_blue_color)


def test_color_chartreuse_integration():
    chartreuse_color = color_chartreuse()
    assert 127 == red_of(chartreuse_color)
    assert 255 == green_of(chartreuse_color)
    assert 0 == blue_of(chartreuse_color)
    assert 255 == alpha_of(chartreuse_color)


def test_color_chocolate_integration():
    chocolate_color = color_chocolate()
    assert 210 == red_of(chocolate_color)
    assert 105 == green_of(chocolate_color)
    assert 30 == blue_of(chocolate_color)
    assert 255 == alpha_of(chocolate_color)


def test_color_coral_integration():
    coral_color = color_coral()
    assert 255 == red_of(coral_color)
    assert 127 == green_of(coral_color)
    assert 80 == blue_of(coral_color)
    assert 255 == alpha_of(coral_color)


def test_color_cornflower_blue_integration():
    cornflower_blue_color = color_cornflower_blue()
    assert 100 == red_of(cornflower_blue_color)
    assert 149 == green_of(cornflower_blue_color)
    assert 237 == blue_of(cornflower_blue_color)
    assert 255 == alpha_of(cornflower_blue_color)


def test_color_cornsilk_integration():
    cornsilk_color = color_cornsilk()
    assert 255 == red_of(cornsilk_color)
    assert 248 == green_of(cornsilk_color)
    assert 220 == blue_of(cornsilk_color)
    assert 255 == alpha_of(cornsilk_color)


def test_color_crimson_integration():
    crimson_color = color_crimson()
    assert 220 == red_of(crimson_color)
    assert 20 == green_of(crimson_color)
    assert 60 == blue_of(crimson_color)
    assert 255 == alpha_of(crimson_color)


def test_color_cyan_integration():
    cyan_color = color_cyan()
    assert 0 == red_of(cyan_color)
    assert 255 == green_of(cyan_color)
    assert 255 == blue_of(cyan_color)
    assert 255 == alpha_of(cyan_color)


def test_color_dark_blue_integration():
    dark_blue_color = color_dark_blue()
    assert 0 == red_of(dark_blue_color)
    assert 0 == green_of(dark_blue_color)
    assert 139 == blue_of(dark_blue_color)
    assert 255 == alpha_of(dark_blue_color)


def test_color_dark_cyan_integration():
    dark_cyan_color = color_dark_cyan()
    assert 0 == red_of(dark_cyan_color)
    assert 139 == green_of(dark_cyan_color)
    assert 139 == blue_of(dark_cyan_color)
    assert 255 == alpha_of(dark_cyan_color)


def test_color_dark_goldenrod_integration():
    dark_goldenrod_color = color_dark_goldenrod()
    assert 184 == red_of(dark_goldenrod_color)
    assert 134 == green_of(dark_goldenrod_color)
    assert 11 == blue_of(dark_goldenrod_color)
    assert 255 == alpha_of(dark_goldenrod_color)


def test_color_dark_gray_integration():
    dark_gray_color = color_dark_gray()
    assert 169 == red_of(dark_gray_color)
    assert 169 == green_of(dark_gray_color)
    assert 169 == blue_of(dark_gray_color)
    assert 255 == alpha_of(dark_gray_color)


def test_color_dark_green_integration():
    dark_green_color = color_dark_green()
    assert 0 == red_of(dark_green_color)
    assert 100 == green_of(dark_green_color)
    assert 0 == blue_of(dark_green_color)
    assert 255 == alpha_of(dark_green_color)


def test_color_dark_khaki_integration():
    dark_khaki_color = color_dark_khaki()
    assert 189 == red_of(dark_khaki_color)
    assert 183 == green_of(dark_khaki_color)
    assert 107 == blue_of(dark_khaki_color)
    assert 255 == alpha_of(dark_khaki_color)


def test_color_dark_magenta_integration():
    dark_magenta_color = color_dark_magenta()
    assert 139 == red_of(dark_magenta_color)
    assert 0 == green_of(dark_magenta_color)
    assert 139 == blue_of(dark_magenta_color)
    assert 255 == alpha_of(dark_magenta_color)


def test_color_dark_olive_green_integration():
    dark_olive_green_color = color_dark_olive_green()
    assert 85 == red_of(dark_olive_green_color)
    assert 107 == green_of(dark_olive_green_color)
    assert 47 == blue_of(dark_olive_green_color)
    assert 255 == alpha_of(dark_olive_green_color)


def test_color_dark_orange_integration():
    dark_orange_color = color_dark_orange()
    assert 255 == red_of(dark_orange_color)
    assert 140 == green_of(dark_orange_color)
    assert 0 == blue_of(dark_orange_color)
    assert 255 == alpha_of(dark_orange_color)


def test_color_dark_orchid_integration():
    dark_orchid_color = color_dark_orchid()
    assert 153 == red_of(dark_orchid_color)
    assert 50 == green_of(dark_orchid_color)
    assert 204 == blue_of(dark_orchid_color)
    assert 255 == alpha_of(dark_orchid_color)


def test_color_dark_red_integration():
    dark_red_color = color_dark_red()
    assert 139 == red_of(dark_red_color)
    assert 0 == green_of(dark_red_color)
    assert 0 == blue_of(dark_red_color)
    assert 255 == alpha_of(dark_red_color)


def test_color_dark_salmon_integration():
    dark_salmon_color = color_dark_salmon()
    assert 233 == red_of(dark_salmon_color)
    assert 150 == green_of(dark_salmon_color)
    assert 122 == blue_of(dark_salmon_color)
    assert 255 == alpha_of(dark_salmon_color)


def test_color_dark_sea_green_integration():
    dark_sea_green_color = color_dark_sea_green()
    assert 143 == red_of(dark_sea_green_color)
    assert 188 == green_of(dark_sea_green_color)
    assert 139 == blue_of(dark_sea_green_color)
    assert 255 == alpha_of(dark_sea_green_color)


def test_color_dark_slate_blue_integration():
    dark_slate_blue_color = color_dark_slate_blue()
    assert 72 == red_of(dark_slate_blue_color)
    assert 61 == green_of(dark_slate_blue_color)
    assert 139 == blue_of(dark_slate_blue_color)
    assert 255 == alpha_of(dark_slate_blue_color)


def test_color_dark_slate_gray_integration():
    dark_slate_gray_color = color_dark_slate_gray()
    assert 47 == red_of(dark_slate_gray_color)
    assert 79 == green_of(dark_slate_gray_color)
    assert 79 == blue_of(dark_slate_gray_color)
    assert 255 == alpha_of(dark_slate_gray_color)


def test_color_dark_turquoise_integration():
    dark_turquoise_color = color_dark_turquoise()
    assert 0 == red_of(dark_turquoise_color)
    assert 206 == green_of(dark_turquoise_color)
    assert 209 == blue_of(dark_turquoise_color)
    assert 255 == alpha_of(dark_turquoise_color)


def test_color_dark_violet_integration():
    dark_violet_color = color_dark_violet()
    assert 148 == red_of(dark_violet_color)
    assert 0 == green_of(dark_violet_color)
    assert 211 == blue_of(dark_violet_color)
    assert 255 == alpha_of(dark_violet_color)


def test_color_deep_pink_integration():
    deep_pink_color = color_deep_pink()
    assert 255 == red_of(deep_pink_color)
    assert 20 == green_of(deep_pink_color)
    assert 147 == blue_of(deep_pink_color)
    assert 255 == alpha_of(deep_pink_color)


def test_color_deep_sky_blue_integration():
    deep_sky_blue_color = color_deep_sky_blue()
    assert 0 == red_of(deep_sky_blue_color)
    assert 191 == green_of(deep_sky_blue_color)
    assert 255 == blue_of(deep_sky_blue_color)
    assert 255 == alpha_of(deep_sky_blue_color)


def test_color_dim_gray_integration():
    dim_gray_color = color_dim_gray()
    assert 105 == red_of(dim_gray_color)
    assert 105 == green_of(dim_gray_color)
    assert 105 == blue_of(dim_gray_color)
    assert 255 == alpha_of(dim_gray_color)


def test_color_dodger_blue_integration():
    dodger_blue_color = color_dodger_blue()
    assert 30 == red_of(dodger_blue_color)
    assert 144 == green_of(dodger_blue_color)
    assert 255 == blue_of(dodger_blue_color)
    assert 255 == alpha_of(dodger_blue_color)


def test_color_firebrick_integration():
    firebrick_color = color_firebrick()
    assert 178 == red_of(firebrick_color)
    assert 34 == green_of(firebrick_color)
    assert 34 == blue_of(firebrick_color)
    assert 255 == alpha_of(firebrick_color)


def test_color_floral_white_integration():
    floral_white_color = color_floral_white()
    assert 255 == red_of(floral_white_color)
    assert 250 == green_of(floral_white_color)
    assert 240 == blue_of(floral_white_color)
    assert 255 == alpha_of(floral_white_color)


def test_color_forest_green_integration():
    forest_green_color = color_forest_green()
    assert 34 == red_of(forest_green_color)
    assert 139 == green_of(forest_green_color)
    assert 34 == blue_of(forest_green_color)
    assert 255 == alpha_of(forest_green_color)


def test_color_fuchsia_integration():
    fuchsia_color = color_fuchsia()
    assert 255 == red_of(fuchsia_color)
    assert 0 == green_of(fuchsia_color)
    assert 255 == blue_of(fuchsia_color)
    assert 255 == alpha_of(fuchsia_color)


def test_color_gainsboro_integration():
    gainsboro_color = color_gainsboro()
    assert 220 == red_of(gainsboro_color)
    assert 220 == green_of(gainsboro_color)
    assert 220 == blue_of(gainsboro_color)
    assert 255 == alpha_of(gainsboro_color)


def test_color_ghost_white_integration():
    ghost_white_color = color_ghost_white()
    assert 248 == red_of(ghost_white_color)
    assert 248 == green_of(ghost_white_color)
    assert 255 == blue_of(ghost_white_color)
    assert 255 == alpha_of(ghost_white_color)


def test_color_gold_integration():
    gold_color = color_gold()
    assert 255 == red_of(gold_color)
    assert 215 == green_of(gold_color)
    assert 0 == blue_of(gold_color)
    assert 255 == alpha_of(gold_color)


def test_color_goldenrod_integration():
    goldenrod_color = color_goldenrod()
    assert 218 == red_of(goldenrod_color)
    assert 165 == green_of(goldenrod_color)
    assert 32 == blue_of(goldenrod_color)
    assert 255 == alpha_of(goldenrod_color)


def test_color_gray_integration():
    gray_color = color_gray()
    assert 127 == red_of(gray_color)
    assert 127 == green_of(gray_color)
    assert 127 == blue_of(gray_color)
    assert 255 == alpha_of(gray_color)


def test_color_green_integration():
    green_color = color_green()
    assert 0 == red_of(green_color)
    assert 127 == green_of(green_color)
    assert 0 == blue_of(green_color)
    assert 255 == alpha_of(green_color)


def test_color_green_yellow_integration():
    green_yellow_color = color_green_yellow()
    assert 173 == red_of(green_yellow_color)
    assert 255 == green_of(green_yellow_color)
    assert 47 == blue_of(green_yellow_color)
    assert 255 == alpha_of(green_yellow_color)


def test_color_honeydew_integration():
    honeydew_color = color_honeydew()
    assert 240 == red_of(honeydew_color)
    assert 255 == green_of(honeydew_color)
    assert 240 == blue_of(honeydew_color)
    assert 255 == alpha_of(honeydew_color)


def test_color_hot_pink_integration():
    hot_pink_color = color_hot_pink()
    assert 255 == red_of(hot_pink_color)
    assert 105 == green_of(hot_pink_color)
    assert 180 == blue_of(hot_pink_color)
    assert 255 == alpha_of(hot_pink_color)


def test_color_indian_red_integration():
    indian_red_color = color_indian_red()
    assert 205 == red_of(indian_red_color)
    assert 92 == green_of(indian_red_color)
    assert 92 == blue_of(indian_red_color)
    assert 255 == alpha_of(indian_red_color)


def test_color_indigo_integration():
    indigo_color = color_indigo()
    assert 75 == red_of(indigo_color)
    assert 0 == green_of(indigo_color)
    assert 130 == blue_of(indigo_color)
    assert 255 == alpha_of(indigo_color)


def test_color_ivory_integration():
    ivory_color = color_ivory()
    assert 255 == red_of(ivory_color)
    assert 255 == green_of(ivory_color)
    assert 240 == blue_of(ivory_color)
    assert 255 == alpha_of(ivory_color)


def test_color_khaki_integration():
    khaki_color = color_khaki()
    assert 240 == red_of(khaki_color)
    assert 230 == green_of(khaki_color)
    assert 140 == blue_of(khaki_color)
    assert 255 == alpha_of(khaki_color)


def test_color_lavender_integration():
    lavender_color = color_lavender()
    assert 230 == red_of(lavender_color)
    assert 230 == green_of(lavender_color)
    assert 250 == blue_of(lavender_color)
    assert 255 == alpha_of(lavender_color)


def test_color_lavender_blush_integration():
    lavender_blush_color = color_lavender_blush()
    assert 255 == red_of(lavender_blush_color)
    assert 240 == green_of(lavender_blush_color)
    assert 245 == blue_of(lavender_blush_color)
    assert 255 == alpha_of(lavender_blush_color)


def test_color_lawn_green_integration():
    lawn_green_color = color_lawn_green()
    assert 124 == red_of(lawn_green_color)
    assert 252 == green_of(lawn_green_color)
    assert 0 == blue_of(lawn_green_color)
    assert 255 == alpha_of(lawn_green_color)


def test_color_lemon_chiffon_integration():
    lemon_chiffon_color = color_lemon_chiffon()
    assert 255 == red_of(lemon_chiffon_color)
    assert 250 == green_of(lemon_chiffon_color)
    assert 205 == blue_of(lemon_chiffon_color)
    assert 255 == alpha_of(lemon_chiffon_color)


def test_color_light_blue_integration():
    light_blue_color = color_light_blue()
    assert 173 == red_of(light_blue_color)
    assert 216 == green_of(light_blue_color)
    assert 230 == blue_of(light_blue_color)
    assert 255 == alpha_of(light_blue_color)


def test_color_light_coral_integration():
    light_coral_color = color_light_coral()
    assert 240 == red_of(light_coral_color)
    assert 127 == green_of(light_coral_color)
    assert 127 == blue_of(light_coral_color)
    assert 255 == alpha_of(light_coral_color)


def test_color_light_cyan_integration():
    light_cyan_color = color_light_cyan()
    assert 224 == red_of(light_cyan_color)
    assert 255 == green_of(light_cyan_color)
    assert 255 == blue_of(light_cyan_color)
    assert 255 == alpha_of(light_cyan_color)


def test_color_light_goldenrod_yellow_integration():
    light_goldenrod_yellow_color = color_light_goldenrod_yellow()
    assert 250 == red_of(light_goldenrod_yellow_color)
    assert 250 == green_of(light_goldenrod_yellow_color)
    assert 210 == blue_of(light_goldenrod_yellow_color)
    assert 255 == alpha_of(light_goldenrod_yellow_color)


def test_color_light_gray_integration():
    light_gray_color = color_light_gray()
    assert 211 == red_of(light_gray_color)
    assert 211 == green_of(light_gray_color)
    assert 211 == blue_of(light_gray_color)
    assert 255 == alpha_of(light_gray_color)


def test_color_light_green_integration():
    light_green_color = color_light_green()
    assert 144 == red_of(light_green_color)
    assert 238 == green_of(light_green_color)
    assert 144 == blue_of(light_green_color)
    assert 255 == alpha_of(light_green_color)


def test_color_light_pink_integration():
    light_pink_color = color_light_pink()
    assert 255 == red_of(light_pink_color)
    assert 182 == green_of(light_pink_color)
    assert 193 == blue_of(light_pink_color)
    assert 255 == alpha_of(light_pink_color)


def test_color_light_salmon_integration():
    light_salmon_color = color_light_salmon()
    assert 255 == red_of(light_salmon_color)
    assert 160 == green_of(light_salmon_color)
    assert 122 == blue_of(light_salmon_color)
    assert 255 == alpha_of(light_salmon_color)


def test_color_light_sea_green_integration():
    light_sea_green_color = color_light_sea_green()
    assert 32 == red_of(light_sea_green_color)
    assert 178 == green_of(light_sea_green_color)
    assert 170 == blue_of(light_sea_green_color)
    assert 255 == alpha_of(light_sea_green_color)


def test_color_light_sky_blue_integration():
    light_sky_blue_color = color_light_sky_blue()
    assert 135 == red_of(light_sky_blue_color)
    assert 206 == green_of(light_sky_blue_color)
    assert 250 == blue_of(light_sky_blue_color)
    assert 255 == alpha_of(light_sky_blue_color)


def test_color_light_slate_gray_integration():
    light_slate_gray_color = color_light_slate_gray()
    assert 119 == red_of(light_slate_gray_color)
    assert 136 == green_of(light_slate_gray_color)
    assert 153 == blue_of(light_slate_gray_color)
    assert 255 == alpha_of(light_slate_gray_color)


def test_color_light_steel_blue_integration():
    light_steel_blue_color = color_light_steel_blue()
    assert 176 == red_of(light_steel_blue_color)
    assert 196 == green_of(light_steel_blue_color)
    assert 222 == blue_of(light_steel_blue_color)
    assert 255 == alpha_of(light_steel_blue_color)


def test_color_light_yellow_integration():
    light_yellow_color = color_light_yellow()
    assert 255 == red_of(light_yellow_color)
    assert 255 == green_of(light_yellow_color)
    assert 224 == blue_of(light_yellow_color)
    assert 255 == alpha_of(light_yellow_color)


def test_color_lime_integration():
    lime_color = color_lime()
    assert 0 == red_of(lime_color)
    assert 255 == green_of(lime_color)
    assert 0 == blue_of(lime_color)
    assert 255 == alpha_of(lime_color)


def test_color_lime_green_integration():
    lime_green_color = color_lime_green()
    assert 50 == red_of(lime_green_color)
    assert 205 == green_of(lime_green_color)
    assert 50 == blue_of(lime_green_color)
    assert 255 == alpha_of(lime_green_color)


def test_color_linen_integration():
    linen_color = color_linen()
    assert 250 == red_of(linen_color)
    assert 240 == green_of(linen_color)
    assert 230 == blue_of(linen_color)
    assert 255 == alpha_of(linen_color)


def test_color_magenta_integration():
    magenta_color = color_magenta()
    assert 255 == red_of(magenta_color)
    assert 0 == green_of(magenta_color)
    assert 255 == blue_of(magenta_color)
    assert 255 == alpha_of(magenta_color)


def test_color_maroon_integration():
    maroon_color = color_maroon()
    assert 127 == red_of(maroon_color)
    assert 0 == green_of(maroon_color)
    assert 0 == blue_of(maroon_color)
    assert 255 == alpha_of(maroon_color)


def test_color_medium_aquamarine_integration():
    medium_aquamarine_color = color_medium_aquamarine()
    assert 102 == red_of(medium_aquamarine_color)
    assert 205 == green_of(medium_aquamarine_color)
    assert 170 == blue_of(medium_aquamarine_color)
    assert 255 == alpha_of(medium_aquamarine_color)


def test_color_medium_blue_integration():
    medium_blue_color = color_medium_blue()
    assert 0 == red_of(medium_blue_color)
    assert 0 == green_of(medium_blue_color)
    assert 205 == blue_of(medium_blue_color)
    assert 255 == alpha_of(medium_blue_color)


def test_color_medium_orchid_integration():
    medium_orchid_color = color_medium_orchid()
    assert 186 == red_of(medium_orchid_color)
    assert 85 == green_of(medium_orchid_color)
    assert 211 == blue_of(medium_orchid_color)
    assert 255 == alpha_of(medium_orchid_color)


def test_color_medium_purple_integration():
    medium_purple_color = color_medium_purple()
    assert 147 == red_of(medium_purple_color)
    assert 112 == green_of(medium_purple_color)
    assert 219 == blue_of(medium_purple_color)
    assert 255 == alpha_of(medium_purple_color)


def test_color_medium_sea_green_integration():
    medium_sea_green_color = color_medium_sea_green()
    assert 60 == red_of(medium_sea_green_color)
    assert 179 == green_of(medium_sea_green_color)
    assert 113 == blue_of(medium_sea_green_color)
    assert 255 == alpha_of(medium_sea_green_color)


def test_color_medium_slate_blue_integration():
    medium_slate_blue_color = color_medium_slate_blue()
    assert 123 == red_of(medium_slate_blue_color)
    assert 104 == green_of(medium_slate_blue_color)
    assert 238 == blue_of(medium_slate_blue_color)
    assert 255 == alpha_of(medium_slate_blue_color)


def test_color_medium_spring_green_integration():
    medium_spring_green_color = color_medium_spring_green()
    assert 0 == red_of(medium_spring_green_color)
    assert 250 == green_of(medium_spring_green_color)
    assert 154 == blue_of(medium_spring_green_color)
    assert 255 == alpha_of(medium_spring_green_color)


def test_color_medium_turquoise_integration():
    medium_turquoise_color = color_medium_turquoise()
    assert 72 == red_of(medium_turquoise_color)
    assert 209 == green_of(medium_turquoise_color)
    assert 204 == blue_of(medium_turquoise_color)
    assert 255 == alpha_of(medium_turquoise_color)


def test_color_medium_violet_red_integration():
    medium_violet_red_color = color_medium_violet_red()
    assert 199 == red_of(medium_violet_red_color)
    assert 21 == green_of(medium_violet_red_color)
    assert 133 == blue_of(medium_violet_red_color)
    assert 255 == alpha_of(medium_violet_red_color)


def test_color_midnight_blue_integration():
    midnight_blue_color = color_midnight_blue()
    assert 25 == red_of(midnight_blue_color)
    assert 25 == green_of(midnight_blue_color)
    assert 112 == blue_of(midnight_blue_color)
    assert 255 == alpha_of(midnight_blue_color)


def test_color_mint_cream_integration():
    mint_cream_color = color_mint_cream()
    assert 245 == red_of(mint_cream_color)
    assert 255 == green_of(mint_cream_color)
    assert 250 == blue_of(mint_cream_color)
    assert 255 == alpha_of(mint_cream_color)


def test_color_misty_rose_integration():
    misty_rose_color = color_misty_rose()
    assert 255 == red_of(misty_rose_color)
    assert 228 == green_of(misty_rose_color)
    assert 225 == blue_of(misty_rose_color)
    assert 255 == alpha_of(misty_rose_color)


def test_color_moccasin_integration():
    moccasin_color = color_moccasin()
    assert 255 == red_of(moccasin_color)
    assert 228 == green_of(moccasin_color)
    assert 181 == blue_of(moccasin_color)
    assert 255 == alpha_of(moccasin_color)


def test_color_navajo_white_integration():
    navajo_white_color = color_navajo_white()
    assert 255 == red_of(navajo_white_color)
    assert 222 == green_of(navajo_white_color)
    assert 173 == blue_of(navajo_white_color)
    assert 255 == alpha_of(navajo_white_color)


def test_color_navy_integration():
    navy_color = color_navy()
    assert 0 == red_of(navy_color)
    assert 0 == green_of(navy_color)
    assert 127 == blue_of(navy_color)
    assert 255 == alpha_of(navy_color)


def test_color_old_lace_integration():
    old_lace_color = color_old_lace()
    assert 253 == red_of(old_lace_color)
    assert 245 == green_of(old_lace_color)
    assert 230 == blue_of(old_lace_color)
    assert 255 == alpha_of(old_lace_color)


def test_color_olive_integration():
    olive_color = color_olive()
    assert 127 == red_of(olive_color)
    assert 127 == green_of(olive_color)
    assert 0 == blue_of(olive_color)
    assert 255 == alpha_of(olive_color)


def test_color_olive_drab_integration():
    olive_drab_color = color_olive_drab()
    assert 107 == red_of(olive_drab_color)
    assert 142 == green_of(olive_drab_color)
    assert 35 == blue_of(olive_drab_color)
    assert 255 == alpha_of(olive_drab_color)


def test_color_orange_integration():
    orange_color = color_orange()
    assert 255 == red_of(orange_color)
    assert 165 == green_of(orange_color)
    assert 0 == blue_of(orange_color)
    assert 255 == alpha_of(orange_color)


def test_color_orange_red_integration():
    orange_red_color = color_orange_red()
    assert 255 == red_of(orange_red_color)
    assert 69 == green_of(orange_red_color)
    assert 0 == blue_of(orange_red_color)
    assert 255 == alpha_of(orange_red_color)


def test_color_orchid_integration():
    orchid_color = color_orchid()
    assert 218 == red_of(orchid_color)
    assert 112 == green_of(orchid_color)
    assert 214 == blue_of(orchid_color)
    assert 255 == alpha_of(orchid_color)


def test_color_pale_goldenrod_integration():
    pale_goldenrod_color = color_pale_goldenrod()
    assert 238 == red_of(pale_goldenrod_color)
    assert 232 == green_of(pale_goldenrod_color)
    assert 170 == blue_of(pale_goldenrod_color)
    assert 255 == alpha_of(pale_goldenrod_color)


def test_color_pale_green_integration():
    pale_green_color = color_pale_green()
    assert 152 == red_of(pale_green_color)
    assert 251 == green_of(pale_green_color)
    assert 152 == blue_of(pale_green_color)
    assert 255 == alpha_of(pale_green_color)


def test_color_pale_turquoise_integration():
    pale_turquoise_color = color_pale_turquoise()
    assert 175 == red_of(pale_turquoise_color)
    assert 238 == green_of(pale_turquoise_color)
    assert 238 == blue_of(pale_turquoise_color)
    assert 255 == alpha_of(pale_turquoise_color)


def test_color_pale_violet_red_integration():
    pale_violet_red_color = color_pale_violet_red()
    assert 219 == red_of(pale_violet_red_color)
    assert 112 == green_of(pale_violet_red_color)
    assert 147 == blue_of(pale_violet_red_color)
    assert 255 == alpha_of(pale_violet_red_color)


def test_color_papaya_whip_integration():
    papaya_whip_color = color_papaya_whip()
    assert 255 == red_of(papaya_whip_color)
    assert 239 == green_of(papaya_whip_color)
    assert 213 == blue_of(papaya_whip_color)
    assert 255 == alpha_of(papaya_whip_color)


def test_color_peach_puff_integration():
    peach_puff_color = color_peach_puff()
    assert 255 == red_of(peach_puff_color)
    assert 218 == green_of(peach_puff_color)
    assert 185 == blue_of(peach_puff_color)
    assert 255 == alpha_of(peach_puff_color)


def test_color_peru_integration():
    peru_color = color_peru()
    assert 205 == red_of(peru_color)
    assert 133 == green_of(peru_color)
    assert 63 == blue_of(peru_color)
    assert 255 == alpha_of(peru_color)


def test_color_pink_integration():
    pink_color = color_pink()
    assert 255 == red_of(pink_color)
    assert 192 == green_of(pink_color)
    assert 203 == blue_of(pink_color)
    assert 255 == alpha_of(pink_color)


def test_color_plum_integration():
    plum_color = color_plum()
    assert 221 == red_of(plum_color)
    assert 160 == green_of(plum_color)
    assert 221 == blue_of(plum_color)
    assert 255 == alpha_of(plum_color)


def test_color_powder_blue_integration():
    powder_blue_color = color_powder_blue()
    assert 176 == red_of(powder_blue_color)
    assert 224 == green_of(powder_blue_color)
    assert 230 == blue_of(powder_blue_color)
    assert 255 == alpha_of(powder_blue_color)


def test_color_purple_integration():
    purple_color = color_purple()
    assert 127 == red_of(purple_color)
    assert 0 == green_of(purple_color)
    assert 127 == blue_of(purple_color)
    assert 255 == alpha_of(purple_color)


def test_color_red_integration():
    red_color = color_red()
    assert 255 == red_of(red_color)
    assert 0 == green_of(red_color)
    assert 0 == blue_of(red_color)
    assert 255 == alpha_of(red_color)


def test_color_rosy_brown_integration():
    rosy_brown_color = color_rosy_brown()
    assert 188 == red_of(rosy_brown_color)
    assert 143 == green_of(rosy_brown_color)
    assert 143 == blue_of(rosy_brown_color)
    assert 255 == alpha_of(rosy_brown_color)


def test_color_royal_blue_integration():
    royal_blue_color = color_royal_blue()
    assert 65 == red_of(royal_blue_color)
    assert 105 == green_of(royal_blue_color)
    assert 225 == blue_of(royal_blue_color)
    assert 255 == alpha_of(royal_blue_color)


def test_color_saddle_brown_integration():
    saddle_brown_color = color_saddle_brown()
    assert 139 == red_of(saddle_brown_color)
    assert 69 == green_of(saddle_brown_color)
    assert 19 == blue_of(saddle_brown_color)
    assert 255 == alpha_of(saddle_brown_color)


def test_color_salmon_integration():
    salmon_color = color_salmon()
    assert 250 == red_of(salmon_color)
    assert 127 == green_of(salmon_color)
    assert 114 == blue_of(salmon_color)
    assert 255 == alpha_of(salmon_color)


def test_color_sandy_brown_integration():
    sandy_brown_color = color_sandy_brown()
    assert 244 == red_of(sandy_brown_color)
    assert 164 == green_of(sandy_brown_color)
    assert 96 == blue_of(sandy_brown_color)
    assert 255 == alpha_of(sandy_brown_color)


def test_color_sea_green_integration():
    sea_green_color = color_sea_green()
    assert 46 == red_of(sea_green_color)
    assert 139 == green_of(sea_green_color)
    assert 87 == blue_of(sea_green_color)
    assert 255 == alpha_of(sea_green_color)


def test_color_sea_shell_integration():
    sea_shell_color = color_sea_shell()
    assert 255 == red_of(sea_shell_color)
    assert 245 == green_of(sea_shell_color)
    assert 238 == blue_of(sea_shell_color)
    assert 255 == alpha_of(sea_shell_color)


def test_color_sienna_integration():
    sienna_color = color_sienna()
    assert 160 == red_of(sienna_color)
    assert 82 == green_of(sienna_color)
    assert 45 == blue_of(sienna_color)
    assert 255 == alpha_of(sienna_color)


def test_color_silver_integration():
    silver_color = color_silver()
    assert 192 == red_of(silver_color)
    assert 192 == green_of(silver_color)
    assert 192 == blue_of(silver_color)
    assert 255 == alpha_of(silver_color)


def test_color_sky_blue_integration():
    sky_blue_color = color_sky_blue()
    assert 135 == red_of(sky_blue_color)
    assert 206 == green_of(sky_blue_color)
    assert 235 == blue_of(sky_blue_color)
    assert 255 == alpha_of(sky_blue_color)


def test_color_slate_blue_integration():
    slate_blue_color = color_slate_blue()
    assert 106 == red_of(slate_blue_color)
    assert 90 == green_of(slate_blue_color)
    assert 205 == blue_of(slate_blue_color)
    assert 255 == alpha_of(slate_blue_color)


def test_color_slate_gray_integration():
    slate_gray_color = color_slate_gray()
    assert 112 == red_of(slate_gray_color)
    assert 127 == green_of(slate_gray_color)
    assert 144 == blue_of(slate_gray_color)
    assert 255 == alpha_of(slate_gray_color)


def test_color_snow_integration():
    snow_color = color_snow()
    assert 255 == red_of(snow_color)
    assert 250 == green_of(snow_color)
    assert 250 == blue_of(snow_color)
    assert 255 == alpha_of(snow_color)


def test_color_spring_green_integration():
    spring_green_color = color_spring_green()
    assert 0 == red_of(spring_green_color)
    assert 255 == green_of(spring_green_color)
    assert 127 == blue_of(spring_green_color)
    assert 255 == alpha_of(spring_green_color)


def test_color_steel_blue_integration():
    steel_blue_color = color_steel_blue()
    assert 70 == red_of(steel_blue_color)
    assert 130 == green_of(steel_blue_color)
    assert 180 == blue_of(steel_blue_color)
    assert 255 == alpha_of(steel_blue_color)


def test_color_swinburne_red_integration():
    swinburne_red_color = color_swinburne_red()
    assert 237 == red_of(swinburne_red_color)
    assert 36 == green_of(swinburne_red_color)
    assert 25 == blue_of(swinburne_red_color)
    assert 255 == alpha_of(swinburne_red_color)


def test_color_tan_integration():
    tan_color = color_tan()
    assert 210 == red_of(tan_color)
    assert 180 == green_of(tan_color)
    assert 140 == blue_of(tan_color)
    assert 255 == alpha_of(tan_color)


def test_color_teal_integration():
    teal_color = color_teal()
    assert 0 == red_of(teal_color)
    assert 127 == green_of(teal_color)
    assert 127 == blue_of(teal_color)
    assert 255 == alpha_of(teal_color)


def test_color_thistle_integration():
    thistle_color = color_thistle()
    assert 216 == red_of(thistle_color)
    assert 191 == green_of(thistle_color)
    assert 216 == blue_of(thistle_color)
    assert 255 == alpha_of(thistle_color)


def test_color_to_string_integration():
    red_color = color_red()
    red_color_string = color_to_string(red_color)
    assert "#ff0000ff" == red_color_string
    transparent_color = color_transparent()
    transparent_color_string = color_to_string(transparent_color)
    assert "#ffffffff" == transparent_color_string


def test_color_tomato_integration():
    tomato_color = color_tomato()
    assert 255 == red_of(tomato_color)
    assert 99 == green_of(tomato_color)
    assert 71 == blue_of(tomato_color)
    assert 255 == alpha_of(tomato_color)


def test_color_transparent_integration():
    transparent_color = color_transparent()
    assert 255 == alpha_of(transparent_color)
    assert 255 == red_of(transparent_color)
    assert 255 == green_of(transparent_color)
    assert 255 == blue_of(transparent_color)


def test_color_turquoise_integration():
    turquoise_color = color_turquoise()
    assert 64 == red_of(turquoise_color)
    assert 224 == green_of(turquoise_color)
    assert 208 == blue_of(turquoise_color)
    assert 255 == alpha_of(turquoise_color)


def test_color_violet_integration():
    violet_color = color_violet()
    assert 238 == red_of(violet_color)
    assert 130 == green_of(violet_color)
    assert 238 == blue_of(violet_color)
    assert 255 == alpha_of(violet_color)


def test_color_wheat_integration():
    wheat_color = color_wheat()
    assert 245 == red_of(wheat_color)
    assert 222 == green_of(wheat_color)
    assert 179 == blue_of(wheat_color)
    assert 255 == alpha_of(wheat_color)


def test_color_white_integration():
    white_color = color_white()
    assert 255 == red_of(white_color)
    assert 255 == green_of(white_color)
    assert 255 == blue_of(white_color)
    assert 255 == alpha_of(white_color)


def test_color_white_smoke_integration():
    white_smoke_color = color_white_smoke()
    assert 245 == red_of(white_smoke_color)
    assert 245 == green_of(white_smoke_color)
    assert 245 == blue_of(white_smoke_color)
    assert 255 == alpha_of(white_smoke_color)


def test_color_yellow_integration():
    yellow_color = color_yellow()
    assert 255 == red_of(yellow_color)
    assert 255 == green_of(yellow_color)
    assert 0 == blue_of(yellow_color)
    assert 255 == alpha_of(yellow_color)


def test_color_yellow_green_integration():
    yellow_green_color = color_yellow_green()
    assert 154 == red_of(yellow_green_color)
    assert 205 == green_of(yellow_green_color)
    assert 50 == blue_of(yellow_green_color)
    assert 255 == alpha_of(yellow_green_color)


def test_green_of_integration():
    green_color = color_green()
    green_value = green_of(green_color)
    assert 127 == green_value
    black_color = color_black()
    black_green_value = green_of(black_color)
    assert 0 == black_green_value


def test_hsb_color_integration():
    red_color = hsb_color(0.0, 1.0, 1.0)
    assert 0.0 == hue_of(red_color)
    assert 1.0 == saturation_of(red_color)
    assert 1.0 == brightness_of(red_color)
    gray_color = hsb_color(0.5, 0.0, 0.5)
    assert 0.0 == saturation_of(gray_color)


def test_hue_of_integration():
    red_color = color_red()
    hue_value = hue_of(red_color)
    assert 0.0 == hue_value
    blue_color = color_blue()
    hue_value_blue = hue_of(blue_color)
    assert 0.6666666666666666 == hue_value_blue


def test_random_color_integration():
    random_color_result = random_color()
    assert "#000000FF" != color_to_string(random_color_result)
    assert 0 <= alpha_of(random_color_result) <= 255


def test_random_rgb_color_integration():
    random_color = random_rgb_color(255)
    assert 0 <= red_of(random_color) <= 255
    assert 0 <= green_of(random_color) <= 255
    assert 0 <= blue_of(random_color) <= 255
    assert 255 == alpha_of(random_color)


def test_red_of_integration():
    red_color = color_red()
    red_value = red_of(red_color)
    assert 255 == red_value
    blue_color = color_blue()
    blue_red_value = red_of(blue_color)
    assert 0 == blue_red_value


def test_rgb_color_from_double_integration():
    red_color = rgb_color(1.0, 0.0, 0.0)
    assert 255 == red_of(red_color)
    assert 0 == green_of(red_color)
    assert 0 == blue_of(red_color)
    green_color = rgb_color(0.0, 1.0, 0.0)
    assert 0 == red_of(green_color)
    assert 255 == green_of(green_color)
    assert 0 == blue_of(green_color)


def test_rgb_color_integration():
    red_color = rgb_color(255, 0, 0)
    assert 255 == red_of(red_color)
    assert 0 == green_of(red_color)
    assert 0 == blue_of(red_color)
    assert 255 == alpha_of(red_color)


def test_rgba_color_from_double_integration():
    test_color = rgba_color(1.0, 0.5, 0.0, 0.75)
    assert 255 == red_of(test_color)
    assert 127 == green_of(test_color)
    assert 0 == blue_of(test_color)
    assert 191 == alpha_of(test_color)


def test_rgba_color_integration():
    red_color = rgba_color(255, 0, 0, 255)
    assert 255 == red_of(red_color)
    assert 0 == green_of(red_color)
    assert 0 == blue_of(red_color)
    assert 255 == alpha_of(red_color)


def test_saturation_of_integration():
    red_color = color_red()
    saturation_value = saturation_of(red_color)
    assert 1.0 == saturation_value
    gray_color = color_gray()
    saturation_value_gray = saturation_of(gray_color)
    assert 0.0 == saturation_value_gray


def test_string_to_color_integration():
    red_color = string_to_color("#FF0000FF")
    assert 255 == red_of(red_color)
    assert 0 == green_of(red_color)
    assert 0 == blue_of(red_color)
    assert 255 == alpha_of(red_color)
    green_color = string_to_color("#00FF00FF")
    assert 0 == red_of(green_color)
    assert 255 == green_of(green_color)
    assert 0 == blue_of(green_color)
    assert 255 == alpha_of(green_color)


def test_center_point_integration():
    test_circle = circle_at(100.0, 100.0, 50.0)
    test_center_point = center_point(test_circle)
    assert test_center_point == point_at(100.0, 100.0)


def test_circle_at_integration():
    test_window = open_window("Test Window", 800, 600)
    test_circle = circle_at(point_at(400.0, 300.0), 50.0)
    draw_circle(color_black(), test_circle)
    refresh_screen()
    assert point_in_circle(point_at(400.0, 300.0), test_circle)
    close_window(test_window)


def test_circle_at_from_points_integration():
    test_window = open_window("Circle Test", 800, 600)
    test_circle = circle_at(400.0, 300.0, 50.0)
    draw_circle(color_black(), test_circle, option_defaults())
    refresh_screen()
    assert point_in_circle(point_at(400.0, 300.0), test_circle)
    close_window(test_window)


def test_circle_radius_integration():
    test_circle = circle_at(100.0, 100.0, 50.0)
    test_radius = circle_radius(test_circle)
    assert 50.0 == test_radius


def test_circle_triangle_intersect_integration():
    test_circle = circle_at(100.0, 100.0, 50.0)
    test_triangle = triangle_from(point_at(50.0, 50.0), point_at(150.0, 50.0), point_at(100.0, 150.0))
    test_result = circle_triangle_intersect(test_circle, test_triangle)
    assert test_result


def test_circle_triangle_intersect_get_closest_point_integration():
    test_circle = circle_at(100.0, 100.0, 50.0)
    test_triangle = triangle_from(point_at(50.0, 50.0), point_at(150.0, 50.0), point_at(100.0, 150.0))
    test_result = circle_triangle_intersect(test_circle, test_triangle, point_at(0.0, 0.0))
    assert test_result
    assert circle_radius(test_circle) == point_point_distance(center_point(test_circle), closest_point_on_triangle_from_circle(test_circle, test_triangle))


def test_circle_x_integration():
    test_circle = circle_at(100.0, 100.0, 50.0)
    assert 100.0 == circle_x(test_circle)


def test_circle_y_integration():
    test_circle = circle_at(100.0, 150.0, 50.0)
    assert 150.0 == circle_y(test_circle)


def test_circles_intersect_integration():
    test_circle1 = circle_at(0.0, 0.0, 50.0)
    test_circle2 = circle_at(100.0, 0.0, 50.0)
    test_result1 = circles_intersect(test_circle1, test_circle2)
    assert not test_result1
    test_circle3 = circle_at(50.0, 0.0, 50.0)
    test_result2 = circles_intersect(test_circle1, test_circle3)
    assert test_result2


def test_circles_intersect_using_values_integration():
    test_intersect_result = circles_intersect(0.0, 0.0, 5.0, 10.0, 0.0, 5.0)
    assert test_intersect_result
    test_not_intersect_result = circles_intersect(0.0, 0.0, 5.0, 11.0, 0.0, 5.0)
    assert not test_not_intersect_result


def test_closest_point_on_circle_integration():
    test_circle = circle_at(100.0, 100.0, 50.0)
    test_point = point_at(150.0, 100.0)
    test_closest_point = closest_point_on_circle(test_point, test_circle)
    assert circle_radius(test_circle) == point_point_distance(test_closest_point, test_point)


def test_closest_point_on_line_from_circle_integration():
    test_circle = circle_at(100.0, 100.0, 50.0)
    test_line = line_from(50.0, 50.0, 150.0, 150.0)
    test_closest_point = closest_point_on_line_from_circle(test_circle, test_line)
    assert point_on_line(test_closest_point, test_line)


def test_closest_point_on_rect_from_circle_integration():
    test_circle = circle_at(100.0, 100.0, 50.0)
    test_rectangle = rectangle_from(150.0, 50.0, 100.0, 100.0)
    test_closest_point = closest_point_on_rect_from_circle(test_circle, test_rectangle)
    assert point_in_rectangle(test_closest_point, test_rectangle)
    assert circle_radius(test_circle) == point_point_distance(center_point(test_circle), test_closest_point)


def test_closest_point_on_triangle_from_circle_integration():
    test_circle = circle_at(100.0, 100.0, 50.0)
    test_triangle = triangle_from(point_at(50.0, 50.0), point_at(150.0, 50.0), point_at(100.0, 150.0))
    test_closest_point = closest_point_on_triangle_from_circle(test_circle, test_triangle)
    assert point_in_triangle(test_closest_point, test_triangle)


def test_distant_point_on_circle_integration():
    test_circle = circle_at(100.0, 100.0, 50.0)
    test_point = point_at(100.0, 150.0)
    test_distant_point = distant_point_on_circle(test_point, test_circle)
    assert circle_radius(test_circle) == point_point_distance(test_point, test_distant_point)


def test_distant_point_on_circle_heading_integration():
    test_circle = circle_at(100.0, 100.0, 50.0)
    test_point1 = point_at(150.0, 100.0)
    test_heading = vector_from_angle(180.0, 1.0)
    test_point2 = point_at(0.0, 0.0)
    test_result = distant_point_on_circle_heading(test_point1, test_circle, test_heading, test_point2)
    assert test_result
    assert 50.0 == test_point1.x
    assert 100.0 == test_point1.y


def test_ray_circle_intersect_distance_integration():
    test_circle = circle_at(100.0, 100.0, 50.0)
    test_ray_origin = point_at(0.0, 0.0)
    test_ray_heading = vector_from_angle(45.0, 1.0)
    test_distance = ray_circle_intersect_distance(test_ray_origin, test_ray_heading, test_circle)
    assert 70 <= test_distance <= 71


def test_tangent_points_integration():
    test_from_pt = point_at(100.0, 100.0)
    test_circle = circle_at(150.0, 150.0, 50.0)
    test_point1 = point_at(0.0, 0.0)
    test_point2 = point_at(0.0, 0.0)
    test_result = tangent_points(test_from_pt, test_circle, test_point1, test_point2)
    assert test_result
    assert point_at(0.0, 0.0) != point_at(0.0, 0.0)


def test_widest_points_integration():
    test_circle = circle_at(100.0, 100.0, 50.0)
    test_vector = vector_from_angle(45.0, 45.0)
    test_point1 = point_at(0.0, 0.0)
    test_point2 = point_at(0.0, 0.0)
    widest_points(test_circle, test_vector, test_point1, test_point2)
    assert point_in_circle(point_at(circle_x(test_circle), circle_y(test_circle)), test_circle)
    assert point_in_circle(point_at(circle_x(test_circle), circle_y(test_circle)), test_circle)


def test_cosine_integration():
    test_cosine_0 = cosine(0.0)
    assert 1.0 == test_cosine_0
    test_cosine_90 = cosine(90.0)
    assert 0.0 == test_cosine_90
    test_cosine_180 = cosine(180.0)
    assert -1.0 == test_cosine_180


def test_sine_integration():
    test_sine_0 = sine(0.0)
    assert 0.0 == test_sine_0
    test_sine_90 = sine(90.0)
    assert 1.0 == test_sine_90
    test_sine_180 = sine(180.0)
    assert 0.0 == test_sine_180
    test_sine_270 = sine(270.0)
    assert -1.0 == test_sine_270


def test_tangent_integration():
    test_tangent_result = tangent(45.0)
    assert 1.0 <= test_tangent_result <= 2.0


def test_closest_point_on_line_integration():
    test_line = line_from(point_at(0.0, 0.0), point_at(10.0, 10.0))
    test_closest_point = closest_point_on_line(point_at(5.0, 5.0), test_line)
    assert 0.0 == point_point_distance(point_at(5.0, 5.0), test_closest_point)


def test_closest_point_on_lines_integration():
    test_from_pt = point_at(0.0, 0.0)
    test_line1 = line_from(point_at(-10.0, 0.0), point_at(10.0, 0.0))
    test_line2 = line_from(point_at(0.0, -10.0), point_at(0.0, 10.0))
    test_index = 0;
    test_lines = [test_line1, test_line2];
    test_closest_point = closest_point_on_lines(test_from_pt, test_lines, test_index)
    assert 0.0 == point_point_distance(test_from_pt, test_closest_point)


def test_line_from_point_to_point_integration():
    test_start_point = point_at(0.0, 0.0)
    test_end_point = point_at(100.0, 100.0)
    test_line = line_from(test_start_point, test_end_point)
    assert 141.421356 == line_length(test_line)


def test_line_from_start_with_offset_integration():
    test_start_point = point_at(0.0, 0.0)
    test_offset_vector = vector_from_angle(45.0, 10.0)
    test_line = line_from(test_start_point, test_offset_vector)
    assert point_on_line(point_at(0.0, 0.0), test_line)
    assert point_on_line(point_offset_by(test_start_point, test_offset_vector), test_line)


def test_line_from_vector_integration():
    test_vector = vector_from_angle(100.0, 50.0)
    test_line = line_from(test_vector)
    assert point_at_origin() == test_line.start_point
    assert point_at(100.0, 50.0) == test_line.end_point


def test_line_from_integration():
    test_line = line_from(0.0, 0.0, 10.0, 10.0)
    assert 14.1421356 == line_length(test_line)


def test_line_intersection_point_integration():
    test_line1 = line_from(0.0, 0.0, 10.0, 10.0)
    test_line2 = line_from(10.0, 0.0, 0.0, 10.0)
    test_point = point_at(0.0, 0.0)
    test_intersection_result = line_intersection_point(test_line1, test_line2, test_point)
    assert test_intersection_result


def test_line_intersects_circle_integration():
    test_line = line_from(0.0, 0.0, 10.0, 10.0)
    test_circle = circle_at(5.0, 5.0, 3.0)
    test_result = line_intersects_circle(test_line, test_circle)
    assert test_result


def test_line_intersects_lines_integration():
    test_line = line_from(0.0, 0.0, 10.0, 10.0)
    test_line1 = line_from(5.0, 5.0, 15.0, 15.0)
    test_line2 = line_from(20.0, 20.0, 30.0, 30.0)
    test_lines = [test_line1, test_line2];
    test_result = line_intersects_lines(test_line, test_lines)
    assert test_result


def test_line_intersects_rect_integration():
    test_rect = rectangle_from(0.0, 0.0, 100.0, 100.0)
    test_line = line_from(point_at(-50.0, 50.0), point_at(150.0, 50.0))
    assert line_intersects_rect(test_line, test_rect)
    test_line_outside = line_from(point_at(-50.0, 150.0), point_at(150.0, 150.0))
    assert not line_intersects_rect(test_line_outside, test_rect)


def test_line_length_integration():
    test_line = line_from(point_at(0.0, 0.0), point_at(3.0, 4.0))
    test_length = line_length(test_line)
    assert 5.0 == test_length


def test_line_length_squared_integration():
    test_line = line_from(point_at(0.0, 0.0), point_at(3.0, 4.0))
    test_result = line_length_squared(test_line)
    assert 25.0 == test_result


def test_line_mid_point_integration():
    test_line = line_from(point_at(0.0, 0.0), point_at(100.0, 100.0))
    test_mid_point = line_mid_point(test_line)
    assert 0.0 == point_point_distance(test_mid_point, point_at(50.0, 50.0))


def test_line_normal_integration():
    test_line = line_from(0.0, 0.0, 1.0, 1.0)
    test_normal = line_normal(test_line)
    assert -1.0 == test_normal.x
    assert 1.0 == test_normal.y


def test_line_to_string_integration():
    test_line = line_from(point_at(0.0, 0.0), point_at(100.0, 100.0))
    test_line_string = line_to_string(test_line)
    assert "" != test_line_string

