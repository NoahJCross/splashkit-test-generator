uses SplashKit, TestFramework

type
TIntegrationTests = class(TTestCase)
published
procedure TIntegrationTests.TestAnimationCountIntegration;
begin
    script := load_animation_script("kermit", "kermit.txt");
    count := animation_count(script);
    AssertTrue(count > 0);
    free_animation_script(script);
end;
procedure TIntegrationTests.TestAnimationCurrentCellIntegration;
begin
    kermitScript := load_animation_script("kermit", "kermit.txt");
    anim := create_animation(kermitScript, "moonwalkback");
    currentCell := animation_current_cell(anim);
    AssertTrue(currentCell > -1);
    free_animation(anim);
    free_animation_script(kermitScript);
end;
procedure TIntegrationTests.TestAnimationCurrentVectorIntegration;
begin
    kermitScript := load_animation_script("kermit", "kermit.txt");
    anim := create_animation(kermitScript, "moonwalkback");
    currentVector := animation_current_vector(anim);
    AssertEquals(currentVector.x, 0);
    AssertEquals(currentVector.y, 0);
    free_animation(anim);
    free_animation_script(kermitScript);
end;
procedure TIntegrationTests.TestAnimationEndedIntegration;
begin
    kermitScript := load_animation_script("kermit", "kermit.txt");
    anim := create_animation(kermitScript, "moonwalkback");
    AssertFalse(animation_ended(anim));
    update_animation(anim);
    AssertFalse(animation_ended(anim));
    update_animation(anim);
    AssertTrue(animation_ended(anim));
    free_animation(anim);
    free_animation_script(kermitScript);
end;
procedure TIntegrationTests.TestAnimationEnteredFrameIntegration;
begin
    kermitScript := load_animation_script("kermit", "kermit.txt");
    anim := create_animation(kermitScript, "walkfront");
    update_animation(anim, 20);
    AssertTrue(animation_entered_frame(anim));
    update_animation(anim);
    AssertFalse(animation_entered_frame(anim));
    free_animation(anim);
    free_animation_script(kermitScript);
end;
procedure TIntegrationTests.TestAnimationFrameTimeIntegration;
begin
    kermitScript := load_animation_script("kermit", "kermit.txt");
    anim := create_animation(kermitScript, "walkfront");
    update_animation(anim);
    frameTime := animation_frame_time(anim);
    AssertTrue(frameTime > 0);
    free_animation(anim);
    free_animation_script(kermitScript);
end;
procedure TIntegrationTests.TestAnimationIndexIntegration;
begin
    script := load_animation_script("kermit", "kermit.txt");
    index := animation_index(script, "walkfront");
    AssertTrue(index > -1);
    nonExistentIndex := animation_index(script, "NonExistentAnimation");
    AssertEquals(nonExistentIndex, -1);
    free_animation_script(script);
end;
procedure TIntegrationTests.TestAnimationNameIntegration;
begin
    kermitScript := load_animation_script("kermit", "kermit.txt");
    anim := create_animation(kermitScript, "moonwalkback");
    animName := animation_name(anim);
    AssertEquals(animName, "moonwalkback");
    free_animation(anim);
    free_animation_script(kermitScript);
end;
procedure TIntegrationTests.TestAnimationScriptNameIntegration;
begin
    kermitScript := load_animation_script("kermit", "kermit.txt");
    scriptName := animation_script_name(kermitScript);
    AssertEquals(scriptName, "kermit");
    free_animation_script(kermitScript);
end;
procedure TIntegrationTests.TestAnimationScriptNamedIntegration;
begin
    kermitScript := load_animation_script("kermit", "kermit.txt");
    loadedScript := animation_script_named("kermit");
    AssertNotNull(loadedScript);
    scriptName := animation_script_name(loadedScript);
    AssertEquals(scriptName, "kermit");
    free_animation_script(kermitScript);
end;
procedure TIntegrationTests.TestAssignAnimationWithScriptIntegration;
begin
    kermitScript := load_animation_script("kermit", "kermit.txt");
    anim := create_animation(kermitScript, "moonwalkback");
    assign_animation(anim, kermitScript, "walkfront");
    AssertEquals(animation_name(anim), "walkfront");
    free_animation_script(kermitScript);
    free_animation(anim);
end;
procedure TIntegrationTests.TestAssignAnimationWithScriptAndSoundIntegration;
begin
    kermitScript := load_animation_script("kermit", "kermit.txt");
    anim := create_animation(kermitScript, "walkfront");
    assign_animation(anim, kermitScript, "walkleft", true);
    AssertEquals(animation_name(anim), "walkleft");
    free_animation(anim);
    free_animation_script(kermitScript);
end;
procedure TIntegrationTests.TestAssignAnimationIndexWithScriptIntegration;
begin
    kermitScript := load_animation_script("kermit", "kermit.txt");
    anim := create_animation(kermitScript, "moonwalkback");
    assign_animation(anim, kermitScript, 0);
    AssertEquals(animation_name(anim), "walkfront");
    free_animation_script(kermitScript);
    free_animation(anim);
end;
procedure TIntegrationTests.TestAssignAnimationIndexWithScriptAndSoundIntegration;
begin
    kermitScript := load_animation_script("kermit", "kermit.txt");
    anim := create_animation(kermitScript, "moonwalkback");
    assign_animation(anim, kermitScript, 0, true);
    AssertEquals(animation_name(anim), "walkfront");
    free_animation_script(kermitScript);
    free_animation(anim);
end;
procedure TIntegrationTests.TestAssignAnimationWithScriptNamedIntegration;
begin
    kermitScript := load_animation_script("kermit", "kermit.txt");
    anim := create_animation(kermitScript, "moonwalkback");
    assign_animation(anim, "kermit", "walkfront");
    AssertEquals(animation_name(anim), "walkfront");
    free_animation_script(kermitScript);
    free_animation(anim);
end;
procedure TIntegrationTests.TestAssignAnimationWithScriptNamedAndSoundIntegration;
begin
    kermitScript := load_animation_script("kermit", "kermit.txt");
    anim := create_animation(kermitScript, "walkfront");
    assign_animation(anim, "kermit", "walkfront", true);
    AssertEquals(animation_name(anim), "walkfront");
    free_animation(anim);
    free_animation_script(kermitScript);
end;
procedure TIntegrationTests.TestAssignAnimationIndexIntegration;
begin
    kermitScript := load_animation_script("kermit", "kermit.txt");
    anim := create_animation(kermitScript, "moonwalkback");
    assign_animation(anim, 0);
    AssertEquals(animation_current_cell(anim), 0);
    free_animation(anim);
    free_animation_script(kermitScript);
end;
procedure TIntegrationTests.TestAssignAnimationIndexWithSoundIntegration;
begin
    kermitScript := load_animation_script("kermit", "kermit.txt");
    anim := create_animation(kermitScript, "moonwalkback", false);
    assign_animation(anim, 0, true);
    AssertTrue(animation_entered_frame(anim));
    free_animation_script(kermitScript);
    free_animation(anim);
end;
procedure TIntegrationTests.TestAssignAnimationIntegration;
begin
    kermitScript := load_animation_script("kermit", "kermit.txt");
    anim := create_animation(kermitScript, "moonwalkback");
    assign_animation(anim, "walkfront");
    AssertEquals(animation_name(anim), "walkfront");
    free_animation(anim);
    free_animation_script(kermitScript);
end;
procedure TIntegrationTests.TestAssignAnimationWithSoundIntegration;
begin
    kermitScript := load_animation_script("kermit", "kermit.txt");
    anim := create_animation(kermitScript, "moonwalkback");
    assign_animation(anim, "walkfront", true);
    AssertEquals(animation_name(anim), "walkfront");
    free_animation_script(kermitScript);
    free_animation(anim);
end;
procedure TIntegrationTests.TestCreateAnimationFromIndexWithSoundIntegration;
begin
    kermitScript := load_animation_script("kermit", "kermit.txt");
    anim := create_animation(kermitScript, 0, true);
    AssertNotNull(anim);
    animName := animation_name(anim);
    AssertEquals(animName, "walkfront");
    free_animation(anim);
    free_animation_script(kermitScript);
end;
procedure TIntegrationTests.TestCreateAnimationIntegration;
begin
    kermitScript := load_animation_script("kermit", "kermit.txt");
    anim := create_animation(kermitScript, "moonwalkback");
    AssertNotNull(anim);
    animName := animation_name(anim);
    AssertEquals(animName, "moonwalkback");
    free_animation(anim);
    free_animation_script(kermitScript);
end;
procedure TIntegrationTests.TestCreateAnimationWithSoundIntegration;
begin
    kermitScript := load_animation_script("kermit", "kermit.txt");
    anim := create_animation(kermitScript, "moonwalkback", true);
    AssertNotNull(anim);
    animName := animation_name(anim);
    AssertEquals(animName, "moonwalkback");
    free_animation_script(kermitScript);
    free_animation(anim);
end;
procedure TIntegrationTests.TestCreateAnimationFromScriptNamedIntegration;
begin
    kermitScript := load_animation_script("kermit", "kermit.txt");
    anim := create_animation("kermit", "moonwalkback");
    AssertNotNull(anim);
    animName := animation_name(anim);
    AssertEquals(animName, "moonwalkback");
    free_animation(anim);
    free_animation_script(kermitScript);
end;
procedure TIntegrationTests.TestCreateAnimationFromScriptNamedWithSoundIntegration;
begin
    kermitScript := load_animation_script("kermit", "kermit.txt");
    anim := create_animation(kermitScript, "moonwalkback", true);
    AssertNotNull(anim);
    animName := animation_name(anim);
    AssertEquals(animName, "moonwalkback");
    free_animation_script(kermitScript);
    free_animation(anim);
end;
procedure TIntegrationTests.TestFreeAllAnimationScriptsIntegration;
begin
    kermitScript := load_animation_script("kermit", "kermit.txt");
    AssertTrue(has_animation_script("kermit"));
    free_all_animation_scripts();
    AssertFalse(has_animation_script("kermit"));
end;
procedure TIntegrationTests.TestFreeAnimationIntegration;
begin
    kermitScript := load_animation_script("kermit", "kermit.txt");
    anim := create_animation(kermitScript, "moonwalkback");
    free_animation(anim);
    AssertNull(anim);
    free_animation_script(kermitScript);
end;
procedure TIntegrationTests.TestFreeAnimationScriptIntegration;
begin
    script := load_animation_script("kermit", "kermit.txt");
    AssertNotNull(script);
    free_animation_script(script);
    scriptExists := has_animation_script("kermit");
    AssertFalse(scriptExists);
end;
procedure TIntegrationTests.TestFreeAnimationScriptWithNameIntegration;
begin
    kermitScript := load_animation_script("kermit", "kermit.txt");
    AssertTrue(has_animation_script("kermit"));
    free_animation_script("kermit");
    AssertFalse(has_animation_script("kermit"));
end;
procedure TIntegrationTests.TestHasAnimationNamedIntegration;
begin
    kermitScript := load_animation_script("kermit", "kermit.txt");
    hasWalkfront := has_animation_named(kermitScript, "walkfront");
    AssertTrue(hasWalkfront);
    hasNonexistent := has_animation_named(kermitScript, "NonExistentAnimation");
    AssertFalse(hasNonexistent);
    free_animation_script(kermitScript);
end;
procedure TIntegrationTests.TestHasAnimationScriptIntegration;
begin
    kermitScript := load_animation_script("kermit", "kermit.txt");
    AssertTrue(has_animation_script("kermit"));
    free_animation_script(kermitScript);
    AssertFalse(has_animation_script("kermit"));
end;
procedure TIntegrationTests.TestLoadAnimationScriptIntegration;
begin
    loadedScript := load_animation_script("test_animation", "kermit.txt");
    AssertNotNull(loadedScript);
    scriptName := animation_script_name(loadedScript);
    AssertEquals(scriptName, "test_animation");
    free_animation_script(loadedScript);
    scriptExists := has_animation_script("test_animation");
    AssertFalse(scriptExists);
end;
procedure TIntegrationTests.TestRestartAnimationIntegration;
begin
    kermitScript := load_animation_script("kermit", "kermit.txt");
    anim := create_animation(kermitScript, "moonwalkback");
    update_animation(anim);
    animEnded := animation_ended(anim);
    AssertTrue(animEnded);
    restart_animation(anim);
    animEndedAfterRestart := animation_ended(anim);
    AssertFalse(animEndedAfterRestart);
    free_animation(anim);
    free_animation_script(kermitScript);
end;
procedure TIntegrationTests.TestRestartAnimationWithSoundIntegration;
begin
    kermitScript := load_animation_script("kermit", "kermit.txt");
    anim := create_animation(kermitScript, "moonwalkback", true);
    update_animation(anim);
    restart_animation(anim, true);
    AssertEquals(animation_current_cell(anim), 3);
    free_animation(anim);
    free_animation_script(kermitScript);
end;
procedure TIntegrationTests.TestUpdateAnimationPercentWithSoundIntegration;
begin
    kermitScript := load_animation_script("kermit", "kermit.txt");
    anim := create_animation(kermitScript, "moonwalkback");
    update_animation(anim, 0.5, true);
    AssertTrue(animation_frame_time(anim) > 0);
    free_animation(anim);
    free_animation_script(kermitScript);
end;
procedure TIntegrationTests.TestUpdateAnimationIntegration;
begin
    kermitScript := load_animation_script("kermit", "kermit.txt");
    anim := create_animation(kermitScript, "moonwalkback");
    update_animation(anim);
    AssertNotEquals(animation_current_cell(anim), 0);
    free_animation(anim);
    free_animation_script(kermitScript);
end;
procedure TIntegrationTests.TestUpdateAnimationPercentIntegration;
begin
    kermitScript := load_animation_script("kermit", "kermit.txt");
    anim := create_animation(kermitScript, "walkfront");
    update_animation(anim, 0.5);
    AssertTrue(animation_frame_time(anim) > 0);
    free_animation(anim);
    free_animation_script(kermitScript);
end;
end;

procedure RegisterTests;
begin
TestFramework.RegisterTest(TIntegrationTests.Suite);
end;
