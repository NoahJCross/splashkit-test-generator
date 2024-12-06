import pytest
from splashkit import *


def test_AnimationCount_integration():
    script = LoadAnimationScript("kermit", "kermit.txt")
    count = AnimationCount(script)
    assert count > 0
    FreeAnimationScript(script)


def test_AnimationCurrentCell_integration():
    kermit_script = LoadAnimationScript("kermit", "kermit.txt")
    anim = CreateAnimation(kermit_script, "moonwalkback")
    current_cell = AnimationCurrentCell(anim)
    assert current_cell > -1
    FreeAnimation(anim)
    FreeAnimationScript(kermit_script)


def test_AnimationCurrentVector_integration():
    kermit_script = LoadAnimationScript("kermit", "kermit.txt")
    anim = CreateAnimation(kermit_script, "moonwalkback")
    current_vector = AnimationCurrentVector(anim)
    assert current_vector.x == 0
    assert current_vector.y == 0
    FreeAnimation(anim)
    FreeAnimationScript(kermit_script)


def test_AnimationEnded_integration():
    kermit_script = LoadAnimationScript("kermit", "kermit.txt")
    anim = CreateAnimation(kermit_script, "moonwalkback")
    assert AnimationEnded(anim) is False
    UpdateAnimation(anim)
    assert AnimationEnded(anim) is False
    UpdateAnimation(anim)
    assert AnimationEnded(anim) is True
    FreeAnimation(anim)
    FreeAnimationScript(kermit_script)


def test_AnimationEnteredFrame_integration():
    kermit_script = LoadAnimationScript("kermit", "kermit.txt")
    anim = CreateAnimation(kermit_script, "walkfront")
    UpdateAnimationPercent(anim, 20)
    assert AnimationEnteredFrame(anim) is True
    UpdateAnimation(anim)
    assert AnimationEnteredFrame(anim) is False
    FreeAnimation(anim)
    FreeAnimationScript(kermit_script)


def test_AnimationFrameTime_integration():
    kermit_script = LoadAnimationScript("kermit", "kermit.txt")
    anim = CreateAnimation(kermit_script, "walkfront")
    UpdateAnimation(anim)
    frame_time = AnimationFrameTime(anim)
    assert frame_time > 0
    FreeAnimation(anim)
    FreeAnimationScript(kermit_script)


def test_AnimationIndex_integration():
    script = LoadAnimationScript("kermit", "kermit.txt")
    index = AnimationIndex(script, "walkfront")
    assert index > -1
    non_existent_index = AnimationIndex(script, "NonExistentAnimation")
    assert non_existent_index == -1
    FreeAnimationScript(script)


def test_AnimationName_integration():
    kermit_script = LoadAnimationScript("kermit", "kermit.txt")
    anim = CreateAnimation(kermit_script, "moonwalkback")
    anim_name = AnimationName(anim)
    assert anim_name == "moonwalkback"
    FreeAnimation(anim)
    FreeAnimationScript(kermit_script)


def test_AnimationScriptName_integration():
    kermit_script = LoadAnimationScript("kermit", "kermit.txt")
    script_name = AnimationScriptName(kermit_script)
    assert script_name == "kermit"
    FreeAnimationScript(kermit_script)


def test_AnimationScriptNamed_integration():
    kermit_script = LoadAnimationScript("kermit", "kermit.txt")
    loaded_script = AnimationScriptNamed("kermit")
    assert loaded_script is not None
    script_name = AnimationScriptName(loaded_script)
    assert script_name == "kermit"
    FreeAnimationScript(kermit_script)


def test_AssignAnimationWithScript_integration():
    kermit_script = LoadAnimationScript("kermit", "kermit.txt")
    anim = CreateAnimation(kermit_script, "moonwalkback")
    AssignAnimationWithScript(anim, kermit_script, "walkfront")
    assert AnimationName(anim) == "walkfront"
    FreeAnimationScript(kermit_script)
    FreeAnimation(anim)


def test_AssignAnimationWithScriptAndSound_integration():
    kermit_script = LoadAnimationScript("kermit", "kermit.txt")
    anim = CreateAnimation(kermit_script, "walkfront")
    AssignAnimationWithScriptAndSound(anim, kermit_script, "walkleft", true)
    assert AnimationName(anim) == "walkleft"
    FreeAnimation(anim)
    FreeAnimationScript(kermit_script)


def test_AssignAnimationIndexWithScript_integration():
    kermit_script = LoadAnimationScript("kermit", "kermit.txt")
    anim = CreateAnimation(kermit_script, "moonwalkback")
    AssignAnimation(anim, kermit_script, 0)
    assert AnimationName(anim) == "walkfront"
    FreeAnimationScript(kermit_script)
    FreeAnimation(anim)


def test_AssignAnimationIndexWithScriptAndSound_integration():
    kermit_script = LoadAnimationScript("kermit", "kermit.txt")
    anim = CreateAnimation(kermit_script, "moonwalkback")
    AssignAnimationIndexWithScriptAndSound(anim, kermit_script, 0, true)
    assert AnimationName(anim) == "walkfront"
    FreeAnimationScript(kermit_script)
    FreeAnimation(anim)


def test_AssignAnimationWithScriptNamed_integration():
    kermit_script = LoadAnimationScript("kermit", "kermit.txt")
    anim = CreateAnimation(kermit_script, "moonwalkback")
    AssignAnimationWithScriptNamed(anim, "kermit", "walkfront")
    assert AnimationName(anim) == "walkfront"
    FreeAnimationScript(kermit_script)
    FreeAnimation(anim)


def test_AssignAnimationWithScriptNamedAndSound_integration():
    kermit_script = LoadAnimationScript("kermit", "kermit.txt")
    anim = CreateAnimation(kermit_script, "walkfront")
    AssignAnimationWithScriptNamedAndSound(anim, "kermit", "walkfront", true)
    assert AnimationName(anim) == "walkfront"
    FreeAnimation(anim)
    FreeAnimationScript(kermit_script)


def test_AssignAnimationIndex_integration():
    kermit_script = LoadAnimationScript("kermit", "kermit.txt")
    anim = CreateAnimation(kermit_script, "moonwalkback")
    AssignAnimation(anim, 0)
    assert AnimationCurrentCell(anim) == 0
    FreeAnimation(anim)
    FreeAnimationScript(kermit_script)


def test_AssignAnimationIndexWithSound_integration():
    kermit_script = LoadAnimationScript("kermit", "kermit.txt")
    anim = CreateAnimation(kermit_script, "moonwalkback", false)
    AssignAnimationIndexWithSound(anim, 0, true)
    assert AnimationEnteredFrame(anim) is True
    FreeAnimationScript(kermit_script)
    FreeAnimation(anim)


def test_AssignAnimation_integration():
    kermit_script = LoadAnimationScript("kermit", "kermit.txt")
    anim = CreateAnimation(kermit_script, "moonwalkback")
    AssignAnimation(anim, "walkfront")
    assert AnimationName(anim) == "walkfront"
    FreeAnimation(anim)
    FreeAnimationScript(kermit_script)


def test_AssignAnimationWithSound_integration():
    kermit_script = LoadAnimationScript("kermit", "kermit.txt")
    anim = CreateAnimation(kermit_script, "moonwalkback")
    AssignAnimationWithSound(anim, "walkfront", true)
    assert AnimationName(anim) == "walkfront"
    FreeAnimationScript(kermit_script)
    FreeAnimation(anim)


def test_CreateAnimationFromIndexWithSound_integration():
    kermit_script = LoadAnimationScript("kermit", "kermit.txt")
    anim = CreateAnimationFromIndexWithSound(kermit_script, 0, true)
    assert anim is not None
    anim_name = AnimationName(anim)
    assert anim_name == "walkfront"
    FreeAnimation(anim)
    FreeAnimationScript(kermit_script)


def test_CreateAnimation_integration():
    kermit_script = LoadAnimationScript("kermit", "kermit.txt")
    anim = CreateAnimation(kermit_script, "moonwalkback")
    assert anim is not None
    anim_name = AnimationName(anim)
    assert anim_name == "moonwalkback"
    FreeAnimation(anim)
    FreeAnimationScript(kermit_script)


def test_CreateAnimationWithSound_integration():
    kermit_script = LoadAnimationScript("kermit", "kermit.txt")
    anim = CreateAnimationWithSound(kermit_script, "moonwalkback", true)
    assert anim is not None
    anim_name = AnimationName(anim)
    assert anim_name == "moonwalkback"
    FreeAnimationScript(kermit_script)
    FreeAnimation(anim)


def test_CreateAnimationFromScriptNamed_integration():
    kermit_script = LoadAnimationScript("kermit", "kermit.txt")
    anim = CreateAnimationFromScriptNamed("kermit", "moonwalkback")
    assert anim is not None
    anim_name = AnimationName(anim)
    assert anim_name == "moonwalkback"
    FreeAnimation(anim)
    FreeAnimationScript(kermit_script)


def test_CreateAnimationFromScriptNamedWithSound_integration():
    kermit_script = LoadAnimationScript("kermit", "kermit.txt")
    anim = CreateAnimationFromScriptNamedWithSound(kermit_script, "moonwalkback", true)
    assert anim is not None
    anim_name = AnimationName(anim)
    assert anim_name == "moonwalkback"
    FreeAnimationScript(kermit_script)
    FreeAnimation(anim)


def test_FreeAllAnimationScripts_integration():
    kermit_script = LoadAnimationScript("kermit", "kermit.txt")
    assert HasAnimationScript("kermit") is True
    FreeAllAnimationScripts()
    assert HasAnimationScript("kermit") is False


def test_FreeAnimation_integration():
    kermit_script = LoadAnimationScript("kermit", "kermit.txt")
    anim = CreateAnimation(kermit_script, "moonwalkback")
    FreeAnimation(anim)
    assert anim is None
    FreeAnimationScript(kermit_script)


def test_FreeAnimationScript_integration():
    script = LoadAnimationScript("kermit", "kermit.txt")
    assert script is not None
    FreeAnimationScript(script)
    script_exists = HasAnimationScript("kermit")
    assert script_exists is False


def test_FreeAnimationScriptWithName_integration():
    kermit_script = LoadAnimationScript("kermit", "kermit.txt")
    assert HasAnimationScript("kermit") is True
    FreeAnimationScriptWithName("kermit")
    assert HasAnimationScript("kermit") is False


def test_HasAnimationNamed_integration():
    kermit_script = LoadAnimationScript("kermit", "kermit.txt")
    has_walkfront = HasAnimationNamed(kermit_script, "walkfront")
    assert has_walkfront is True
    has_nonexistent = HasAnimationNamed(kermit_script, "NonExistentAnimation")
    assert has_nonexistent is False
    FreeAnimationScript(kermit_script)


def test_HasAnimationScript_integration():
    kermit_script = LoadAnimationScript("kermit", "kermit.txt")
    assert HasAnimationScript("kermit") is True
    FreeAnimationScript(kermit_script)
    assert HasAnimationScript("kermit") is False


def test_LoadAnimationScript_integration():
    loaded_script = LoadAnimationScript("test_animation", "kermit.txt")
    assert loaded_script is not None
    script_name = AnimationScriptName(loaded_script)
    assert script_name == "test_animation"
    FreeAnimationScript(loaded_script)
    script_exists = HasAnimationScript("test_animation")
    assert script_exists is False


def test_RestartAnimation_integration():
    kermit_script = LoadAnimationScript("kermit", "kermit.txt")
    anim = CreateAnimation(kermit_script, "moonwalkback")
    UpdateAnimation(anim)
    anim_ended = AnimationEnded(anim)
    assert anim_ended is True
    RestartAnimation(anim)
    anim_ended_after_restart = AnimationEnded(anim)
    assert anim_ended_after_restart is False
    FreeAnimation(anim)
    FreeAnimationScript(kermit_script)


def test_RestartAnimationWithSound_integration():
    kermit_script = LoadAnimationScript("kermit", "kermit.txt")
    anim = CreateAnimation(kermit_script, "moonwalkback", true)
    UpdateAnimation(anim)
    RestartAnimationWithSound(anim, true)
    assert AnimationCurrentCell(anim) == 3
    FreeAnimation(anim)
    FreeAnimationScript(kermit_script)


def test_UpdateAnimationPercentWithSound_integration():
    kermit_script = LoadAnimationScript("kermit", "kermit.txt")
    anim = CreateAnimation(kermit_script, "moonwalkback")
    UpdateAnimationPercentWithSound(anim, 0.5, true)
    assert AnimationFrameTime(anim) > 0
    FreeAnimation(anim)
    FreeAnimationScript(kermit_script)


def test_UpdateAnimation_integration():
    kermit_script = LoadAnimationScript("kermit", "kermit.txt")
    anim = CreateAnimation(kermit_script, "moonwalkback")
    UpdateAnimation(anim)
    assert AnimationCurrentCell(anim) != 0
    FreeAnimation(anim)
    FreeAnimationScript(kermit_script)


def test_UpdateAnimationPercent_integration():
    kermit_script = LoadAnimationScript("kermit", "kermit.txt")
    anim = CreateAnimation(kermit_script, "walkfront")
    UpdateAnimationPercent(anim, 0.5)
    assert AnimationFrameTime(anim) > 0
    FreeAnimation(anim)
    FreeAnimationScript(kermit_script)

