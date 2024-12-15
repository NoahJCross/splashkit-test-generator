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
    assert 0.0 == current_vector.x
    assert 0.0 == current_vector.y
    free_animation(anim)
    free_animation_script(kermit_script)


def test_animation_ended_integration():
    kermit_script = load_animation_script("kermit", "kermit.txt")
    anim = create_animation(kermit_script, "moonwalkback")
    assert not animation_ended(anim)
    for _ in range(50):
        update_animation_percent(anim, 100.0)
    
    assert not animation_ended(anim)
    update_animation(anim)
    assert animation_ended(anim)
    free_animation(anim)
    free_animation_script(kermit_script)


def test_animation_entered_frame_integration():
    kermit_script = load_animation_script("kermit", "kermit.txt")
    anim = create_animation(kermit_script, "walkfront")
    update_animation_percent(anim, 20)
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
    assert frame_time > 0.0
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
    assign_animation_with_script(anim, kermit_script, "walkfront")
    assert "walkfront" == animation_name(anim)
    free_animation_script(kermit_script)
    free_animation(anim)


def test_assign_animation_with_script_and_sound_integration():
    kermit_script = load_animation_script("kermit", "kermit.txt")
    anim = create_animation(kermit_script, "walkfront")
    assign_animation_with_script_and_sound(anim, kermit_script, "walkleft", true)
    assert "walkleft" == animation_name(anim)
    free_animation(anim)
    free_animation_script(kermit_script)


def test_assign_animation_index_with_script_integration():
    kermit_script = load_animation_script("kermit", "kermit.txt")
    anim = create_animation(kermit_script, "moonwalkback")
    assign_animation_index_with_script(anim, kermit_script, 0)
    assert "walkfront" == animation_name(anim)
    free_animation_script(kermit_script)
    free_animation(anim)


def test_assign_animation_index_with_script_and_sound_integration():
    kermit_script = load_animation_script("kermit", "kermit.txt")
    anim = create_animation(kermit_script, "moonwalkback")
    assign_animation_index_with_script_and_sound(anim, kermit_script, 0, true)
    assert "walkfront" == animation_name(anim)
    free_animation_script(kermit_script)
    free_animation(anim)


def test_assign_animation_with_script_named_integration():
    kermit_script = load_animation_script("kermit", "kermit.txt")
    anim = create_animation(kermit_script, "moonwalkback")
    assign_animation_with_script_named(anim, "kermit", "walkfront")
    assert "walkfront" == animation_name(anim)
    free_animation_script(kermit_script)
    free_animation(anim)


def test_assign_animation_with_script_named_and_sound_integration():
    kermit_script = load_animation_script("kermit", "kermit.txt")
    anim = create_animation(kermit_script, "walkfront")
    assign_animation_with_script_named_and_sound(anim, "kermit", "walkfront", true)
    assert "walkfront" == animation_name(anim)
    free_animation(anim)
    free_animation_script(kermit_script)


def test_assign_animation_index_integration():
    kermit_script = load_animation_script("kermit", "kermit.txt")
    anim = create_animation(kermit_script, "moonwalkback")
    assign_animation_index(anim, 0)
    assert 0 == animation_current_cell(anim)
    free_animation(anim)
    free_animation_script(kermit_script)


def test_assign_animation_index_with_sound_integration():
    kermit_script = load_animation_script("kermit", "kermit.txt")
    anim = create_animation_with_sound(kermit_script, "moonwalkback", false)
    assign_animation_index_with_sound(anim, 0, true)
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
    assign_animation_with_sound(anim, "walkfront", true)
    assert "walkfront" == animation_name(anim)
    free_animation_script(kermit_script)
    free_animation(anim)


def test_create_animation_from_index_with_sound_integration():
    kermit_script = load_animation_script("kermit", "kermit.txt")
    anim = create_animation_from_index_with_sound(kermit_script, 0, true)
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
    anim = create_animation_with_sound(kermit_script, "moonwalkback", true)
    assert anim is not None
    anim_name = animation_name(anim)
    assert "moonwalkback" == anim_name
    free_animation_script(kermit_script)
    free_animation(anim)


def test_create_animation_from_script_named_integration():
    kermit_script = load_animation_script("kermit", "kermit.txt")
    anim = create_animation_from_script_named("kermit", "moonwalkback")
    assert anim is not None
    anim_name = animation_name(anim)
    assert "moonwalkback" == anim_name
    free_animation(anim)
    free_animation_script(kermit_script)


def test_create_animation_from_script_named_with_sound_integration():
    kermit_script = load_animation_script("kermit", "kermit.txt")
    anim = create_animation_from_script_named_with_sound("", "moonwalkback", true)
    assert anim is not None
    anim_name = animation_name(anim)
    assert "moonwalkback" == anim_name
    free_animation_script(kermit_script)
    free_animation(anim)


def test_free_all_animation_scripts_integration():
    load_animation_script("kermitq", "kermit.txt")
    load_animation_script("kermit2", "kermit.txt")
    assert has_animation_script("kermit1")
    assert has_animation_script("kermit2")
    free_all_animation_scripts()
    assert not has_animation_script("kermit1")
    assert not has_animation_script("kermit2")


def test_free_animation_integration():
    kermit_script = load_animation_script("kermit", "kermit.txt")
    anim = create_animation(kermit_script, "moonwalkback")
    free_animation(anim)
    assert "" == animation_name(anim)
    assert animation_ended(anim)
    free_animation_script(kermit_script)


def test_free_animation_script_integration():
    script = load_animation_script("kermit", "kermit.txt")
    assert script is not None
    free_animation_script(script)
    script_exists = has_animation_script("kermit")
    assert not script_exists


def test_free_animation_script_with_name_integration():
    load_animation_script("kermit", "kermit.txt")
    assert has_animation_script("kermit")
    free_animation_script_with_name("kermit")
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
        update_animation_percent(anim, 100.0)
    
    anim_ended = animation_ended(anim)
    assert anim_ended
    restart_animation(anim)
    anim_ended_after_restart = animation_ended(anim)
    assert not anim_ended_after_restart
    free_animation(anim)
    free_animation_script(kermit_script)


def test_restart_animation_with_sound_integration():
    kermit_script = load_animation_script("kermit", "kermit.txt")
    anim = create_animation_with_sound(kermit_script, "moonwalkback", true)
    update_animation(anim)
    restart_animation_with_sound(anim, true)
    assert 3 == animation_current_cell(anim)
    free_animation(anim)
    free_animation_script(kermit_script)


def test_update_animation_percent_with_sound_integration():
    kermit_script = load_animation_script("kermit", "kermit.txt")
    anim = create_animation(kermit_script, "moonwalkback")
    update_animation_percent_with_sound(anim, 0.5, true)
    assert animation_frame_time(anim) > 0.0
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
    update_animation_percent(anim, 0.5)
    assert animation_frame_time(anim) > 0.0
    free_animation(anim)
    free_animation_script(kermit_script)

