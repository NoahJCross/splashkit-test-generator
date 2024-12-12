uses SplashKit, TestFramework

type
TTestAnimations = class(TTestCase)
protected
procedure TIntegrationTests.TestAnimationCountIntegration;
begin
    script := LoadAnimationScript("kermit", "kermit.txt");
    count := AnimationCount(script);
    AssertTrue(count > 0);
    FreeAnimationScript(script);
end;
procedure TIntegrationTests.TestAnimationCurrentCellIntegration;
begin
    kermitScript := LoadAnimationScript("kermit", "kermit.txt");
    anim := CreateAnimation(kermitScript, "moonwalkback");
    currentCell := AnimationCurrentCell(anim);
    AssertTrue(currentCell > -1);
    FreeAnimation(anim);
    FreeAnimationScript(kermitScript);
end;
procedure TIntegrationTests.TestAnimationCurrentVectorIntegration;
begin
    kermitScript := LoadAnimationScript("kermit", "kermit.txt");
    anim := CreateAnimation(kermitScript, "moonwalkback");
    currentVector := AnimationCurrentVector(anim);
    AssertEquals(0, currentVector.x);
    AssertEquals(0, currentVector.y);
    FreeAnimation(anim);
    FreeAnimationScript(kermitScript);
end;
procedure TIntegrationTests.TestAnimationEndedIntegration;
begin
    kermitScript := LoadAnimationScript("kermit", "kermit.txt");
    anim := CreateAnimation(kermitScript, "moonwalkback");
    AssertFalse(AnimationEnded(anim));
    for i := 0 to 49 do
        UpdateAnimation(anim, 100.0);
    end;
    AssertFalse(AnimationEnded(anim));
    UpdateAnimation(anim);
    AssertTrue(AnimationEnded(anim));
    FreeAnimation(anim);
    FreeAnimationScript(kermitScript);
end;
procedure TIntegrationTests.TestAnimationEnteredFrameIntegration;
begin
    kermitScript := LoadAnimationScript("kermit", "kermit.txt");
    anim := CreateAnimation(kermitScript, "walkfront");
    UpdateAnimation(anim, 20);
    AssertTrue(AnimationEnteredFrame(anim));
    UpdateAnimation(anim);
    AssertFalse(AnimationEnteredFrame(anim));
    FreeAnimation(anim);
    FreeAnimationScript(kermitScript);
end;
procedure TIntegrationTests.TestAnimationFrameTimeIntegration;
begin
    kermitScript := LoadAnimationScript("kermit", "kermit.txt");
    anim := CreateAnimation(kermitScript, "walkfront");
    UpdateAnimation(anim);
    frameTime := AnimationFrameTime(anim);
    AssertTrue(frameTime > 0);
    FreeAnimation(anim);
    FreeAnimationScript(kermitScript);
end;
procedure TIntegrationTests.TestAnimationIndexIntegration;
begin
    script := LoadAnimationScript("kermit", "kermit.txt");
    index := AnimationIndex(script, "walkfront");
    AssertTrue(index > -1);
    nonExistentIndex := AnimationIndex(script, "NonExistentAnimation");
    AssertEquals(-1, nonExistentIndex);
    FreeAnimationScript(script);
end;
procedure TIntegrationTests.TestAnimationNameIntegration;
begin
    kermitScript := LoadAnimationScript("kermit", "kermit.txt");
    anim := CreateAnimation(kermitScript, "moonwalkback");
    animName := AnimationName(anim);
    AssertEquals("moonwalkback", animName);
    FreeAnimation(anim);
    FreeAnimationScript(kermitScript);
end;
procedure TIntegrationTests.TestAnimationScriptNameIntegration;
begin
    kermitScript := LoadAnimationScript("kermit", "kermit.txt");
    scriptName := AnimationScriptName(kermitScript);
    AssertEquals("kermit", scriptName);
    FreeAnimationScript(kermitScript);
end;
procedure TIntegrationTests.TestAnimationScriptNamedIntegration;
begin
    kermitScript := LoadAnimationScript("kermit", "kermit.txt");
    loadedScript := AnimationScriptNamed("kermit");
    AssertNotNull(loadedScript);
    AssertEquals(loadedScript, loadedScript);
    FreeAnimationScript(kermitScript);
end;
procedure TIntegrationTests.TestAssignAnimationWithScriptIntegration;
begin
    kermitScript := LoadAnimationScript("kermit", "kermit.txt");
    anim := CreateAnimation(kermitScript, "moonwalkback");
    AssignAnimation(anim, kermitScript, "walkfront");
    AssertEquals("walkfront", AnimationName(anim));
    FreeAnimationScript(kermitScript);
    FreeAnimation(anim);
end;
procedure TIntegrationTests.TestAssignAnimationWithScriptAndSoundIntegration;
begin
    kermitScript := LoadAnimationScript("kermit", "kermit.txt");
    anim := CreateAnimation(kermitScript, "walkfront");
    AssignAnimation(anim, kermitScript, "walkleft", true);
    AssertEquals("walkleft", AnimationName(anim));
    FreeAnimation(anim);
    FreeAnimationScript(kermitScript);
end;
procedure TIntegrationTests.TestAssignAnimationIndexWithScriptIntegration;
begin
    kermitScript := LoadAnimationScript("kermit", "kermit.txt");
    anim := CreateAnimation(kermitScript, "moonwalkback");
    AssignAnimation(anim, kermitScript, 0);
    AssertEquals("walkfront", AnimationName(anim));
    FreeAnimationScript(kermitScript);
    FreeAnimation(anim);
end;
procedure TIntegrationTests.TestAssignAnimationIndexWithScriptAndSoundIntegration;
begin
    kermitScript := LoadAnimationScript("kermit", "kermit.txt");
    anim := CreateAnimation(kermitScript, "moonwalkback");
    AssignAnimation(anim, kermitScript, 0, true);
    AssertEquals("walkfront", AnimationName(anim));
    FreeAnimationScript(kermitScript);
    FreeAnimation(anim);
end;
procedure TIntegrationTests.TestAssignAnimationWithScriptNamedIntegration;
begin
    kermitScript := LoadAnimationScript("kermit", "kermit.txt");
    anim := CreateAnimation(kermitScript, "moonwalkback");
    AssignAnimation(anim, "kermit", "walkfront");
    AssertEquals("walkfront", AnimationName(anim));
    FreeAnimationScript(kermitScript);
    FreeAnimation(anim);
end;
procedure TIntegrationTests.TestAssignAnimationWithScriptNamedAndSoundIntegration;
begin
    kermitScript := LoadAnimationScript("kermit", "kermit.txt");
    anim := CreateAnimation(kermitScript, "walkfront");
    AssignAnimation(anim, "kermit", "walkfront", true);
    AssertEquals("walkfront", AnimationName(anim));
    FreeAnimation(anim);
    FreeAnimationScript(kermitScript);
end;
procedure TIntegrationTests.TestAssignAnimationIndexIntegration;
begin
    kermitScript := LoadAnimationScript("kermit", "kermit.txt");
    anim := CreateAnimation(kermitScript, "moonwalkback");
    AssignAnimation(anim, 0);
    AssertEquals(0, AnimationCurrentCell(anim));
    FreeAnimation(anim);
    FreeAnimationScript(kermitScript);
end;
procedure TIntegrationTests.TestAssignAnimationIndexWithSoundIntegration;
begin
    kermitScript := LoadAnimationScript("kermit", "kermit.txt");
    anim := CreateAnimation(kermitScript, "moonwalkback", false);
    AssignAnimation(anim, 0, true);
    AssertTrue(AnimationEnteredFrame(anim));
    FreeAnimationScript(kermitScript);
    FreeAnimation(anim);
end;
procedure TIntegrationTests.TestAssignAnimationIntegration;
begin
    kermitScript := LoadAnimationScript("kermit", "kermit.txt");
    anim := CreateAnimation(kermitScript, "moonwalkback");
    AssignAnimation(anim, "walkfront");
    AssertEquals("walkfront", AnimationName(anim));
    FreeAnimation(anim);
    FreeAnimationScript(kermitScript);
end;
procedure TIntegrationTests.TestAssignAnimationWithSoundIntegration;
begin
    kermitScript := LoadAnimationScript("kermit", "kermit.txt");
    anim := CreateAnimation(kermitScript, "moonwalkback");
    AssignAnimation(anim, "walkfront", true);
    AssertEquals("walkfront", AnimationName(anim));
    FreeAnimationScript(kermitScript);
    FreeAnimation(anim);
end;
procedure TIntegrationTests.TestCreateAnimationFromIndexWithSoundIntegration;
begin
    kermitScript := LoadAnimationScript("kermit", "kermit.txt");
    anim := CreateAnimation(kermitScript, 0, true);
    AssertNotNull(anim);
    animName := AnimationName(anim);
    AssertEquals("walkfront", animName);
    FreeAnimation(anim);
    FreeAnimationScript(kermitScript);
end;
procedure TIntegrationTests.TestCreateAnimationIntegration;
begin
    kermitScript := LoadAnimationScript("kermit", "kermit.txt");
    anim := CreateAnimation(kermitScript, "moonwalkback");
    AssertNotNull(anim);
    animName := AnimationName(anim);
    AssertEquals("moonwalkback", animName);
    FreeAnimation(anim);
    FreeAnimationScript(kermitScript);
end;
procedure TIntegrationTests.TestCreateAnimationWithSoundIntegration;
begin
    kermitScript := LoadAnimationScript("kermit", "kermit.txt");
    anim := CreateAnimation(kermitScript, "moonwalkback", true);
    AssertNotNull(anim);
    animName := AnimationName(anim);
    AssertEquals("moonwalkback", animName);
    FreeAnimationScript(kermitScript);
    FreeAnimation(anim);
end;
procedure TIntegrationTests.TestCreateAnimationFromScriptNamedIntegration;
begin
    kermitScript := LoadAnimationScript("kermit", "kermit.txt");
    anim := CreateAnimation("kermit", "moonwalkback");
    AssertNotNull(anim);
    animName := AnimationName(anim);
    AssertEquals("moonwalkback", animName);
    FreeAnimation(anim);
    FreeAnimationScript(kermitScript);
end;
procedure TIntegrationTests.TestCreateAnimationFromScriptNamedWithSoundIntegration;
begin
    kermitScript := LoadAnimationScript("kermit", "kermit.txt");
    anim := CreateAnimation(kermitScript, "moonwalkback", true);
    AssertNotNull(anim);
    animName := AnimationName(anim);
    AssertEquals("moonwalkback", animName);
    FreeAnimationScript(kermitScript);
    FreeAnimation(anim);
end;
procedure TIntegrationTests.TestFreeAllAnimationScriptsIntegration;
begin
    kermitScript := LoadAnimationScript("kermit", "kermit.txt");
    AssertTrue(HasAnimationScript("kermit"));
    FreeAllAnimationScripts();
    AssertFalse(HasAnimationScript("kermit"));
end;
procedure TIntegrationTests.TestFreeAnimationIntegration;
begin
    kermitScript := LoadAnimationScript("kermit", "kermit.txt");
    anim := CreateAnimation(kermitScript, "moonwalkback");
    FreeAnimation(anim);
    AssertEquals(nil, AnimationName(anim));
    AssertTrue(AnimationEnded(anim));
    FreeAnimationScript(kermitScript);
end;
procedure TIntegrationTests.TestFreeAnimationScriptIntegration;
begin
    script := LoadAnimationScript("kermit", "kermit.txt");
    AssertNotNull(script);
    FreeAnimationScript(script);
    scriptExists := HasAnimationScript("kermit");
    AssertFalse(scriptExists);
end;
procedure TIntegrationTests.TestFreeAnimationScriptWithNameIntegration;
begin
    kermitScript := LoadAnimationScript("kermit", "kermit.txt");
    AssertTrue(HasAnimationScript("kermit"));
    FreeAnimationScript("kermit");
    AssertFalse(HasAnimationScript("kermit"));
end;
procedure TIntegrationTests.TestHasAnimationNamedIntegration;
begin
    kermitScript := LoadAnimationScript("kermit", "kermit.txt");
    hasWalkfront := HasAnimationNamed(kermitScript, "walkfront");
    AssertTrue(hasWalkfront);
    hasNonexistent := HasAnimationNamed(kermitScript, "NonExistentAnimation");
    AssertFalse(hasNonexistent);
    FreeAnimationScript(kermitScript);
end;
procedure TIntegrationTests.TestHasAnimationScriptIntegration;
begin
    kermitScript := LoadAnimationScript("kermit", "kermit.txt");
    AssertTrue(HasAnimationScript("kermit"));
    FreeAnimationScript(kermitScript);
    AssertFalse(HasAnimationScript("kermit"));
end;
procedure TIntegrationTests.TestLoadAnimationScriptIntegration;
begin
    loadedScript := LoadAnimationScript("test_animation", "kermit.txt");
    AssertNotNull(loadedScript);
    scriptName := AnimationScriptName(loadedScript);
    AssertEquals("test_animation", scriptName);
    FreeAnimationScript(loadedScript);
    scriptExists := HasAnimationScript("test_animation");
    AssertFalse(scriptExists);
end;
procedure TIntegrationTests.TestRestartAnimationIntegration;
begin
    kermitScript := LoadAnimationScript("kermit", "kermit.txt");
    anim := CreateAnimation(kermitScript, "moonwalkback");
    for i := 0 to 49 do
        UpdateAnimation(anim, 100.0);
    end;
    animEnded := AnimationEnded(anim);
    AssertTrue(animEnded);
    RestartAnimation(anim);
    animEndedAfterRestart := AnimationEnded(anim);
    AssertFalse(animEndedAfterRestart);
    FreeAnimation(anim);
    FreeAnimationScript(kermitScript);
end;
procedure TIntegrationTests.TestRestartAnimationWithSoundIntegration;
begin
    kermitScript := LoadAnimationScript("kermit", "kermit.txt");
    anim := CreateAnimation(kermitScript, "moonwalkback", true);
    UpdateAnimation(anim);
    RestartAnimation(anim, true);
    AssertEquals(3, AnimationCurrentCell(anim));
    FreeAnimation(anim);
    FreeAnimationScript(kermitScript);
end;
procedure TIntegrationTests.TestUpdateAnimationPercentWithSoundIntegration;
begin
    kermitScript := LoadAnimationScript("kermit", "kermit.txt");
    anim := CreateAnimation(kermitScript, "moonwalkback");
    UpdateAnimation(anim, 0.5, true);
    AssertTrue(AnimationFrameTime(anim) > 0);
    FreeAnimation(anim);
    FreeAnimationScript(kermitScript);
end;
procedure TIntegrationTests.TestUpdateAnimationIntegration;
begin
    kermitScript := LoadAnimationScript("kermit", "kermit.txt");
    anim := CreateAnimation(kermitScript, "moonwalkback");
    UpdateAnimation(anim);
    AssertNotEquals(0, AnimationCurrentCell(anim));
    FreeAnimation(anim);
    FreeAnimationScript(kermitScript);
end;
procedure TIntegrationTests.TestUpdateAnimationPercentIntegration;
begin
    kermitScript := LoadAnimationScript("kermit", "kermit.txt");
    anim := CreateAnimation(kermitScript, "walkfront");
    UpdateAnimation(anim, 0.5);
    AssertTrue(AnimationFrameTime(anim) > 0);
    FreeAnimation(anim);
    FreeAnimationScript(kermitScript);
end;
end;

procedure RegisterTests;
begin
#<Proc:0x00007f7a8f3c6228 /mnt/c/Users/Noahc/Documents/.Year 2 Semester 3/Team Project (A)/Github Repo/splashkit_test_generator/test_generator/config/languages/pascal_config.rb:117 (lambda)>
end;
