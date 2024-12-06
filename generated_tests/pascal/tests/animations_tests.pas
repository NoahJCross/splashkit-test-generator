uses SplashKit, TestFramework

type
TIntegrationTests = class(TTestCase)
published
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
    AssertEquals(currentVector.x, 0);
    AssertEquals(currentVector.y, 0);
    FreeAnimation(anim);
    FreeAnimationScript(kermitScript);
end;
procedure TIntegrationTests.TestAnimationEndedIntegration;
begin
    kermitScript := LoadAnimationScript("kermit", "kermit.txt");
    anim := CreateAnimation(kermitScript, "moonwalkback");
    AssertFalse(AnimationEnded(anim));
    UpdateAnimation(anim);
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
    AssertEquals(nonExistentIndex, -1);
    FreeAnimationScript(script);
end;
procedure TIntegrationTests.TestAnimationNameIntegration;
begin
    kermitScript := LoadAnimationScript("kermit", "kermit.txt");
    anim := CreateAnimation(kermitScript, "moonwalkback");
    animName := AnimationName(anim);
    AssertEquals(animName, "moonwalkback");
    FreeAnimation(anim);
    FreeAnimationScript(kermitScript);
end;
procedure TIntegrationTests.TestAnimationScriptNameIntegration;
begin
    kermitScript := LoadAnimationScript("kermit", "kermit.txt");
    scriptName := AnimationScriptName(kermitScript);
    AssertEquals(scriptName, "kermit");
    FreeAnimationScript(kermitScript);
end;
procedure TIntegrationTests.TestAnimationScriptNamedIntegration;
begin
    kermitScript := LoadAnimationScript("kermit", "kermit.txt");
    loadedScript := AnimationScriptNamed("kermit");
    AssertNotNull(loadedScript);
    scriptName := AnimationScriptName(loadedScript);
    AssertEquals(scriptName, "kermit");
    FreeAnimationScript(kermitScript);
end;
procedure TIntegrationTests.TestAssignAnimationWithScriptIntegration;
begin
    kermitScript := LoadAnimationScript("kermit", "kermit.txt");
    anim := CreateAnimation(kermitScript, "moonwalkback");
    AssignAnimation(anim, kermitScript, "walkfront");
    AssertEquals(AnimationName(anim), "walkfront");
    FreeAnimationScript(kermitScript);
    FreeAnimation(anim);
end;
procedure TIntegrationTests.TestAssignAnimationWithScriptAndSoundIntegration;
begin
    kermitScript := LoadAnimationScript("kermit", "kermit.txt");
    anim := CreateAnimation(kermitScript, "walkfront");
    AssignAnimation(anim, kermitScript, "walkleft", true);
    AssertEquals(AnimationName(anim), "walkleft");
    FreeAnimation(anim);
    FreeAnimationScript(kermitScript);
end;
procedure TIntegrationTests.TestAssignAnimationIndexWithScriptIntegration;
begin
    kermitScript := LoadAnimationScript("kermit", "kermit.txt");
    anim := CreateAnimation(kermitScript, "moonwalkback");
    AssignAnimation(anim, kermitScript, 0);
    AssertEquals(AnimationName(anim), "walkfront");
    FreeAnimationScript(kermitScript);
    FreeAnimation(anim);
end;
procedure TIntegrationTests.TestAssignAnimationIndexWithScriptAndSoundIntegration;
begin
    kermitScript := LoadAnimationScript("kermit", "kermit.txt");
    anim := CreateAnimation(kermitScript, "moonwalkback");
    AssignAnimation(anim, kermitScript, 0, true);
    AssertEquals(AnimationName(anim), "walkfront");
    FreeAnimationScript(kermitScript);
    FreeAnimation(anim);
end;
procedure TIntegrationTests.TestAssignAnimationWithScriptNamedIntegration;
begin
    kermitScript := LoadAnimationScript("kermit", "kermit.txt");
    anim := CreateAnimation(kermitScript, "moonwalkback");
    AssignAnimation(anim, "kermit", "walkfront");
    AssertEquals(AnimationName(anim), "walkfront");
    FreeAnimationScript(kermitScript);
    FreeAnimation(anim);
end;
procedure TIntegrationTests.TestAssignAnimationWithScriptNamedAndSoundIntegration;
begin
    kermitScript := LoadAnimationScript("kermit", "kermit.txt");
    anim := CreateAnimation(kermitScript, "walkfront");
    AssignAnimation(anim, "kermit", "walkfront", true);
    AssertEquals(AnimationName(anim), "walkfront");
    FreeAnimation(anim);
    FreeAnimationScript(kermitScript);
end;
procedure TIntegrationTests.TestAssignAnimationIndexIntegration;
begin
    kermitScript := LoadAnimationScript("kermit", "kermit.txt");
    anim := CreateAnimation(kermitScript, "moonwalkback");
    AssignAnimation(anim, 0);
    AssertEquals(AnimationCurrentCell(anim), 0);
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
    AssertEquals(AnimationName(anim), "walkfront");
    FreeAnimation(anim);
    FreeAnimationScript(kermitScript);
end;
procedure TIntegrationTests.TestAssignAnimationWithSoundIntegration;
begin
    kermitScript := LoadAnimationScript("kermit", "kermit.txt");
    anim := CreateAnimation(kermitScript, "moonwalkback");
    AssignAnimation(anim, "walkfront", true);
    AssertEquals(AnimationName(anim), "walkfront");
    FreeAnimationScript(kermitScript);
    FreeAnimation(anim);
end;
procedure TIntegrationTests.TestCreateAnimationFromIndexWithSoundIntegration;
begin
    kermitScript := LoadAnimationScript("kermit", "kermit.txt");
    anim := CreateAnimation(kermitScript, 0, true);
    AssertNotNull(anim);
    animName := AnimationName(anim);
    AssertEquals(animName, "walkfront");
    FreeAnimation(anim);
    FreeAnimationScript(kermitScript);
end;
procedure TIntegrationTests.TestCreateAnimationIntegration;
begin
    kermitScript := LoadAnimationScript("kermit", "kermit.txt");
    anim := CreateAnimation(kermitScript, "moonwalkback");
    AssertNotNull(anim);
    animName := AnimationName(anim);
    AssertEquals(animName, "moonwalkback");
    FreeAnimation(anim);
    FreeAnimationScript(kermitScript);
end;
procedure TIntegrationTests.TestCreateAnimationWithSoundIntegration;
begin
    kermitScript := LoadAnimationScript("kermit", "kermit.txt");
    anim := CreateAnimation(kermitScript, "moonwalkback", true);
    AssertNotNull(anim);
    animName := AnimationName(anim);
    AssertEquals(animName, "moonwalkback");
    FreeAnimationScript(kermitScript);
    FreeAnimation(anim);
end;
procedure TIntegrationTests.TestCreateAnimationFromScriptNamedIntegration;
begin
    kermitScript := LoadAnimationScript("kermit", "kermit.txt");
    anim := CreateAnimation("kermit", "moonwalkback");
    AssertNotNull(anim);
    animName := AnimationName(anim);
    AssertEquals(animName, "moonwalkback");
    FreeAnimation(anim);
    FreeAnimationScript(kermitScript);
end;
procedure TIntegrationTests.TestCreateAnimationFromScriptNamedWithSoundIntegration;
begin
    kermitScript := LoadAnimationScript("kermit", "kermit.txt");
    anim := CreateAnimation(kermitScript, "moonwalkback", true);
    AssertNotNull(anim);
    animName := AnimationName(anim);
    AssertEquals(animName, "moonwalkback");
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
    AssertNull(anim);
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
    AssertEquals(scriptName, "test_animation");
    FreeAnimationScript(loadedScript);
    scriptExists := HasAnimationScript("test_animation");
    AssertFalse(scriptExists);
end;
procedure TIntegrationTests.TestRestartAnimationIntegration;
begin
    kermitScript := LoadAnimationScript("kermit", "kermit.txt");
    anim := CreateAnimation(kermitScript, "moonwalkback");
    UpdateAnimation(anim);
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
    AssertEquals(AnimationCurrentCell(anim), 3);
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
    AssertNotEquals(AnimationCurrentCell(anim), 0);
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
TestFramework.RegisterTest(TIntegrationTests.Suite);
end;
