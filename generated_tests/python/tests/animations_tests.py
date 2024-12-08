import pytest
from splashkit import *


def test_AnimationCount_integration():
    script = load_animation_script("kermit", "kermit.txt")
    count = animation_count(script)
    assert count > 0
    free_animation_script(script)


def test_AnimationCurrentCell_integration():
    kermit_script = load_animation_script("kermit", "kermit.txt")
    anim = create_animation(kermit_script, "moonwalkback")
    current_cell = animation_current_cell(anim)
    assert current_cell > -1
    free_animation(anim)
    free_animation_script(kermit_script)


def test_AnimationCurrentVector_integration():
    kermit_script = load_animation_script("kermit", "kermit.txt")
    anim = create_animation(kermit_script, "moonwalkback")
    current_vector = animation_current_vector(anim)
    assert 0 == current_vector.x
    assert 0 == current_vector.y
    free_animation(anim)
    free_animation_script(kermit_script)


def test_AnimationEnded_integration():
    kermit_script = load_animation_script("kermit", "kermit.txt")
    anim = create_animation(kermit_script, "moonwalkback")
    assert animation_ended(anim) is False
    update_animation(anim)
    assert animation_ended(anim) is False
    update_animation(anim)
    assert animation_ended(anim) is True
    free_animation(anim)
    free_animation_script(kermit_script)


def test_AnimationEnteredFrame_integration():
    kermit_script = load_animation_script("kermit", "kermit.txt")
    anim = create_animation(kermit_script, "walkfront")
    update_animation_percent(anim, 20)
    assert animation_entered_frame(anim) is True
    update_animation(anim)
    assert animation_entered_frame(anim) is False
    free_animation(anim)
    free_animation_script(kermit_script)


def test_AnimationFrameTime_integration():
    kermit_script = load_animation_script("kermit", "kermit.txt")
    anim = create_animation(kermit_script, "walkfront")
    update_animation(anim)
    frame_time = animation_frame_time(anim)
    assert frame_time > 0
    free_animation(anim)
    free_animation_script(kermit_script)


def test_AnimationIndex_integration():
    script = load_animation_script("kermit", "kermit.txt")
    index = animation_index(script, "walkfront")
    assert index > -1
    non_existent_index = animation_index(script, "NonExistentAnimation")
    assert -1 == non_existent_index
    free_animation_script(script)


def test_AnimationName_integration():
    kermit_script = load_animation_script("kermit", "kermit.txt")
    anim = create_animation(kermit_script, "moonwalkback")
    anim_name = animation_name(anim)
    assert "moonwalkback" == anim_name
    free_animation(anim)
    free_animation_script(kermit_script)


def test_AnimationScriptName_integration():
    kermit_script = load_animation_script("kermit", "kermit.txt")
    script_name = animation_script_name(kermit_script)
    assert "kermit" == script_name
    free_animation_script(kermit_script)


def test_AnimationScriptNamed_integration():
    kermit_script = load_animation_script("kermit", "kermit.txt")
    loaded_script = animation_script_named("kermit")
    assert loaded_script is not None
    script_name = animation_script_name(loaded_script)
    assert "kermit" == script_name
    free_animation_script(kermit_script)


def test_AssignAnimationWithScript_integration():
    kermit_script = load_animation_script("kermit", "kermit.txt")
    anim = create_animation(kermit_script, "moonwalkback")
    assign_animation_with_script(anim, kermit_script, "walkfront")
    assert "walkfront" == animation_name(anim)
    free_animation_script(kermit_script)
    free_animation(anim)


def test_AssignAnimationWithScriptAndSound_integration():
    kermit_script = load_animation_script("kermit", "kermit.txt")
    anim = create_animation(kermit_script, "walkfront")
    assign_animation_with_script_and_sound(anim, kermit_script, "walkleft", true)
    assert "walkleft" == animation_name(anim)
    free_animation(anim)
    free_animation_script(kermit_script)


def test_AssignAnimationIndexWithScript_integration():
    kermit_script = load_animation_script("kermit", "kermit.txt")
    anim = create_animation(kermit_script, "moonwalkback")
    assign_animation(anim, kermit_script, 0)
    assert "walkfront" == animation_name(anim)
    free_animation_script(kermit_script)
    free_animation(anim)


def test_AssignAnimationIndexWithScriptAndSound_integration():
    kermit_script = load_animation_script("kermit", "kermit.txt")
    anim = create_animation(kermit_script, "moonwalkback")
    assign_animation_index_with_script_and_sound(anim, kermit_script, 0, true)
    assert "walkfront" == animation_name(anim)
    free_animation_script(kermit_script)
    free_animation(anim)


def test_AssignAnimationWithScriptNamed_integration():
    kermit_script = load_animation_script("kermit", "kermit.txt")
    anim = create_animation(kermit_script, "moonwalkback")
    assign_animation_with_script_named(anim, "kermit", "walkfront")
    assert "walkfront" == animation_name(anim)
    free_animation_script(kermit_script)
    free_animation(anim)


def test_AssignAnimationWithScriptNamedAndSound_integration():
    kermit_script = load_animation_script("kermit", "kermit.txt")
    anim = create_animation(kermit_script, "walkfront")
    assign_animation_with_script_named_and_sound(anim, "kermit", "walkfront", true)
    assert "walkfront" == animation_name(anim)
    free_animation(anim)
    free_animation_script(kermit_script)


def test_AssignAnimationIndex_integration():
    kermit_script = load_animation_script("kermit", "kermit.txt")
    anim = create_animation(kermit_script, "moonwalkback")
    assign_animation(anim, 0)
    assert 0 == animation_current_cell(anim)
    free_animation(anim)
    free_animation_script(kermit_script)


def test_AssignAnimationIndexWithSound_integration():
    kermit_script = load_animation_script("kermit", "kermit.txt")
    anim = create_animation(kermit_script, "moonwalkback", false)
    assign_animation_index_with_sound(anim, 0, true)
    assert animation_entered_frame(anim) is True
    free_animation_script(kermit_script)
    free_animation(anim)


def test_AssignAnimation_integration():
    kermit_script = load_animation_script("kermit", "kermit.txt")
    anim = create_animation(kermit_script, "moonwalkback")
    assign_animation(anim, "walkfront")
    assert "walkfront" == animation_name(anim)
    free_animation(anim)
    free_animation_script(kermit_script)


def test_AssignAnimationWithSound_integration():
    kermit_script = load_animation_script("kermit", "kermit.txt")
    anim = create_animation(kermit_script, "moonwalkback")
    assign_animation_with_sound(anim, "walkfront", true)
    assert "walkfront" == animation_name(anim)
    free_animation_script(kermit_script)
    free_animation(anim)


def test_CreateAnimationFromIndexWithSound_integration():
    kermit_script = load_animation_script("kermit", "kermit.txt")
    anim = create_animation_from_index_with_sound(kermit_script, 0, true)
    assert anim is not None
    anim_name = animation_name(anim)
    assert "walkfront" == anim_name
    free_animation(anim)
    free_animation_script(kermit_script)


def test_CreateAnimation_integration():
    kermit_script = load_animation_script("kermit", "kermit.txt")
    anim = create_animation(kermit_script, "moonwalkback")
    assert anim is not None
    anim_name = animation_name(anim)
    assert "moonwalkback" == anim_name
    free_animation(anim)
    free_animation_script(kermit_script)


def test_CreateAnimationWithSound_integration():
    kermit_script = load_animation_script("kermit", "kermit.txt")
    anim = create_animation_with_sound(kermit_script, "moonwalkback", true)
    assert anim is not None
    anim_name = animation_name(anim)
    assert "moonwalkback" == anim_name
    free_animation_script(kermit_script)
    free_animation(anim)


def test_CreateAnimationFromScriptNamed_integration():
    kermit_script = load_animation_script("kermit", "kermit.txt")
    anim = create_animation_from_script_named("kermit", "moonwalkback")
    assert anim is not None
    anim_name = animation_name(anim)
    assert "moonwalkback" == anim_name
    free_animation(anim)
    free_animation_script(kermit_script)


def test_CreateAnimationFromScriptNamedWithSound_integration():
    kermit_script = load_animation_script("kermit", "kermit.txt")
    anim = create_animation_from_script_named_with_sound(kermit_script, "moonwalkback", true)
    assert anim is not None
    anim_name = animation_name(anim)
    assert "moonwalkback" == anim_name
    free_animation_script(kermit_script)
    free_animation(anim)


def test_FreeAllAnimationScripts_integration():
    kermit_script = load_animation_script("kermit", "kermit.txt")
    assert has_animation_script("kermit") is True
    free_all_animation_scripts()
    assert has_animation_script("kermit") is False


def test_FreeAnimation_integration():
    kermit_script = load_animation_script("kermit", "kermit.txt")
    anim = create_animation(kermit_script, "moonwalkback")
    free_animation(anim)
    assert anim is None
    free_animation_script(kermit_script)


def test_FreeAnimationScript_integration():
    script = load_animation_script("kermit", "kermit.txt")
    assert script is not None
    free_animation_script(script)
    script_exists = has_animation_script("kermit")
    assert script_exists is False


def test_FreeAnimationScriptWithName_integration():
    kermit_script = load_animation_script("kermit", "kermit.txt")
    assert has_animation_script("kermit") is True
    free_animation_script_with_name("kermit")
    assert has_animation_script("kermit") is False


def test_HasAnimationNamed_integration():
    kermit_script = load_animation_script("kermit", "kermit.txt")
    has_walkfront = has_animation_named(kermit_script, "walkfront")
    assert has_walkfront is True
    has_nonexistent = has_animation_named(kermit_script, "NonExistentAnimation")
    assert has_nonexistent is False
    free_animation_script(kermit_script)


def test_HasAnimationScript_integration():
    kermit_script = load_animation_script("kermit", "kermit.txt")
    assert has_animation_script("kermit") is True
    free_animation_script(kermit_script)
    assert has_animation_script("kermit") is False


def test_LoadAnimationScript_integration():
    loaded_script = load_animation_script("test_animation", "kermit.txt")
    assert loaded_script is not None
    script_name = animation_script_name(loaded_script)
    assert "test_animation" == script_name
    free_animation_script(loaded_script)
    script_exists = has_animation_script("test_animation")
    assert script_exists is False


def test_RestartAnimation_integration():
    kermit_script = load_animation_script("kermit", "kermit.txt")
    anim = create_animation(kermit_script, "moonwalkback")
    update_animation(anim)
    anim_ended = animation_ended(anim)
    assert anim_ended is True
    restart_animation(anim)
    anim_ended_after_restart = animation_ended(anim)
    assert anim_ended_after_restart is False
    free_animation(anim)
    free_animation_script(kermit_script)


def test_RestartAnimationWithSound_integration():
    kermit_script = load_animation_script("kermit", "kermit.txt")
    anim = create_animation(kermit_script, "moonwalkback", true)
    update_animation(anim)
    restart_animation_with_sound(anim, true)
    assert 3 == animation_current_cell(anim)
    free_animation(anim)
    free_animation_script(kermit_script)


def test_UpdateAnimationPercentWithSound_integration():
    kermit_script = load_animation_script("kermit", "kermit.txt")
    anim = create_animation(kermit_script, "moonwalkback")
    update_animation_percent_with_sound(anim, 0.5, true)
    assert animation_frame_time(anim) > 0
    free_animation(anim)
    free_animation_script(kermit_script)


def test_UpdateAnimation_integration():
    kermit_script = load_animation_script("kermit", "kermit.txt")
    anim = create_animation(kermit_script, "moonwalkback")
    update_animation(anim)
    assert animation_current_cell(anim) != 0
    free_animation(anim)
    free_animation_script(kermit_script)


def test_UpdateAnimationPercent_integration():
    kermit_script = load_animation_script("kermit", "kermit.txt")
    anim = create_animation(kermit_script, "walkfront")
    update_animation_percent(anim, 0.5)
    assert animation_frame_time(anim) > 0
    free_animation(anim)
    free_animation_script(kermit_script)

