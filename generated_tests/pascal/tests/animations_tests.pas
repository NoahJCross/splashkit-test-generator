uses SplashKit, TestFramework, ../Helpers;
type
    TTestAnimations = class(TTestCase)
    protected
        procedure Setup; override;
    end;
begin
    inherited;
    SetResourcesPath('/mnt/c/Users/Noahc/Documents/aYear_2_semester_2/TeamProject/GitHubRepo/splashkit_test_generator/resources');
end;
procedure TestAnimationCountIntegration;
begin
    testScript := LoadAnimationScript('kermit', 'kermit.txt');
    CleanupAnimationScript := TAnimationScriptCleanup.Create;
    count := AnimationCount(testScript);
    AssertTrue(count > 0);
end;
procedure TestAnimationCurrentCellIntegration;
begin
    testScript := LoadAnimationScript('kermit', 'kermit.txt');
    CleanupAnimationScript := TAnimationScriptCleanup.Create;
    testAnimation := CreateAnimation(testScript, 'moonwalkback');
    CleanupAnimation := TAnimationCleanup.Create(testAnimation)
    currentCell := AnimationCurrentCell(testAnimation);
    AssertTrue(currentCell > -1);
end;
procedure TestAnimationCurrentVectorIntegration;
begin
    testScript := LoadAnimationScript('kermit', 'kermit.txt');
    CleanupAnimationScript := TAnimationScriptCleanup.Create;
    testAnimation := CreateAnimation(testScript, 'moonwalkback');
    CleanupAnimation := TAnimationCleanup.Create(testAnimation)
    currentVector := AnimationCurrentVector(testAnimation);
    AssertEquals(0.0, currentVector.x);
    AssertEquals(0.0, currentVector.y);
end;
procedure TestAnimationEndedIntegration;
begin
    testScript := LoadAnimationScript('kermit', 'kermit.txt');
    CleanupAnimationScript := TAnimationScriptCleanup.Create;
    testAnimation := CreateAnimation(testScript, 'moonwalkback');
    CleanupAnimation := TAnimationCleanup.Create(testAnimation)
    AssertFalse(AnimationEnded(testAnimation));
    for i := 0 to 49 do
        UpdateAnimation(testAnimation, 100.0);
    end;
    AssertTrue(AnimationEnded(testAnimation));
end;
procedure TestAnimationEnteredFrameIntegration;
begin
    testScript := LoadAnimationScript('kermit', 'kermit.txt');
    CleanupAnimationScript := TAnimationScriptCleanup.Create;
    testAnimation := CreateAnimation(testScript, 'walkfront');
    CleanupAnimation := TAnimationCleanup.Create(testAnimation)
    UpdateAnimation(testAnimation, 20);
    AssertTrue(AnimationEnteredFrame(testAnimation));
    UpdateAnimation(testAnimation);
    AssertFalse(AnimationEnteredFrame(testAnimation));
end;
procedure TestAnimationFrameTimeIntegration;
begin
    testScript := LoadAnimationScript('kermit', 'kermit.txt');
    CleanupAnimationScript := TAnimationScriptCleanup.Create;
    testAnimation := CreateAnimation(testScript, 'walkfront');
    CleanupAnimation := TAnimationCleanup.Create(testAnimation)
    UpdateAnimation(testAnimation);
    frameTime := AnimationFrameTime(testAnimation);
    AssertTrue(frameTime > 0.0);
end;
procedure TestAnimationIndexIntegration;
begin
    testScript := LoadAnimationScript('kermit', 'kermit.txt');
    CleanupAnimationScript := TAnimationScriptCleanup.Create;
    index := AnimationIndex(testScript, 'walkfront');
    AssertTrue(index > -1);
    nonExistentIndex := AnimationIndex(testScript, 'NonExistentAnimation');
    AssertEquals(-1, nonExistentIndex);
end;
procedure TestAnimationNameIntegration;
begin
    testScript := LoadAnimationScript('kermit', 'kermit.txt');
    CleanupAnimationScript := TAnimationScriptCleanup.Create;
    testAnimation := CreateAnimation(testScript, 'moonwalkback');
    CleanupAnimation := TAnimationCleanup.Create(testAnimation)
    animName := AnimationName(testAnimation);
    AssertEquals('moonwalkback', animName);
end;
procedure TestAnimationScriptNameIntegration;
begin
    testScript := LoadAnimationScript('kermit', 'kermit.txt');
    CleanupAnimationScript := TAnimationScriptCleanup.Create;
    scriptName := AnimationScriptName(testScript);
    AssertEquals('kermit', scriptName);
end;
procedure TestAnimationScriptNamedIntegration;
begin
    testScript := LoadAnimationScript('kermit', 'kermit.txt');
    CleanupAnimationScript := TAnimationScriptCleanup.Create;
    AnimationScriptNamed('kermit');
    AssertNotNull(testScript);
    AssertEquals(testScript, testScript);
end;
procedure TestAssignAnimationWithScriptIntegration;
begin
    testScript := LoadAnimationScript('kermit', 'kermit.txt');
    CleanupAnimationScript := TAnimationScriptCleanup.Create;
    testAnimation := CreateAnimation(testScript, 'moonwalkback');
    CleanupAnimation := TAnimationCleanup.Create(testAnimation)
    AssignAnimation(testAnimation, testScript, 'walkfront');
    AssertEquals('walkfront', AnimationName(testAnimation));
end;
procedure TestAssignAnimationWithScriptAndSoundIntegration;
begin
    testScript := LoadAnimationScript('kermit', 'kermit.txt');
    CleanupAnimationScript := TAnimationScriptCleanup.Create;
    testAnimation := CreateAnimation(testScript, 'walkfront');
    CleanupAnimation := TAnimationCleanup.Create(testAnimation)
    AssignAnimation(testAnimation, testScript, 'walkleft', true);
    AssertEquals('walkleft', AnimationName(testAnimation));
end;
procedure TestAssignAnimationIndexWithScriptIntegration;
begin
    testScript := LoadAnimationScript('kermit', 'kermit.txt');
    CleanupAnimationScript := TAnimationScriptCleanup.Create;
    testAnimation := CreateAnimation(testScript, 'moonwalkback');
    CleanupAnimation := TAnimationCleanup.Create(testAnimation)
    AssignAnimation(testAnimation, testScript, 0);
    AssertEquals('walkfront', AnimationName(testAnimation));
end;
procedure TestAssignAnimationIndexWithScriptAndSoundIntegration;
begin
    testScript := LoadAnimationScript('kermit', 'kermit.txt');
    CleanupAnimationScript := TAnimationScriptCleanup.Create;
    testAnimation := CreateAnimation(testScript, 'moonwalkback');
    CleanupAnimation := TAnimationCleanup.Create(testAnimation)
    AssignAnimation(testAnimation, testScript, 0, true);
    AssertEquals('walkfront', AnimationName(testAnimation));
end;
procedure TestAssignAnimationWithScriptNamedIntegration;
begin
    testScript := LoadAnimationScript('kermit', 'kermit.txt');
    CleanupAnimationScript := TAnimationScriptCleanup.Create;
    testAnimation := CreateAnimation(testScript, 'moonwalkback');
    CleanupAnimation := TAnimationCleanup.Create(testAnimation)
    AssignAnimation(testAnimation, 'kermit', 'walkfront');
    AssertEquals('walkfront', AnimationName(testAnimation));
end;
procedure TestAssignAnimationWithScriptNamedAndSoundIntegration;
begin
    testScript := LoadAnimationScript('kermit', 'kermit.txt');
    CleanupAnimationScript := TAnimationScriptCleanup.Create;
    testAnimation := CreateAnimation(testScript, 'walkfront');
    CleanupAnimation := TAnimationCleanup.Create(testAnimation)
    AssignAnimation(testAnimation, 'kermit', 'walkfront', true);
    AssertEquals('walkfront', AnimationName(testAnimation));
end;
procedure TestAssignAnimationIndexIntegration;
begin
    testScript := LoadAnimationScript('kermit', 'kermit.txt');
    CleanupAnimationScript := TAnimationScriptCleanup.Create;
    testAnimation := CreateAnimation(testScript, 'moonwalkback');
    CleanupAnimation := TAnimationCleanup.Create(testAnimation)
    AssignAnimation(testAnimation, 0);
    AssertEquals(0, AnimationCurrentCell(testAnimation));
end;
procedure TestAssignAnimationIndexWithSoundIntegration;
begin
    testScript := LoadAnimationScript('kermit', 'kermit.txt');
    CleanupAnimationScript := TAnimationScriptCleanup.Create;
    testAnimation := CreateAnimation(testScript, 'moonwalkback', false);
    CleanupAnimation := TAnimationCleanup.Create(testAnimation)
    AssignAnimation(testAnimation, 0, true);
    AssertTrue(AnimationEnteredFrame(testAnimation));
end;
procedure TestAssignAnimationIntegration;
begin
    testScript := LoadAnimationScript('kermit', 'kermit.txt');
    CleanupAnimationScript := TAnimationScriptCleanup.Create;
    testAnimation := CreateAnimation(testScript, 'moonwalkback');
    CleanupAnimation := TAnimationCleanup.Create(testAnimation)
    AssignAnimation(testAnimation, 'walkfront');
    AssertEquals('walkfront', AnimationName(testAnimation));
end;
procedure TestAssignAnimationWithSoundIntegration;
begin
    testScript := LoadAnimationScript('kermit', 'kermit.txt');
    CleanupAnimationScript := TAnimationScriptCleanup.Create;
    testAnimation := CreateAnimation(testScript, 'moonwalkback');
    CleanupAnimation := TAnimationCleanup.Create(testAnimation)
    AssignAnimation(testAnimation, 'walkfront', true);
    AssertEquals('walkfront', AnimationName(testAnimation));
end;
procedure TestCreateAnimationFromIndexWithSoundIntegration;
begin
    testScript := LoadAnimationScript('kermit', 'kermit.txt');
    CleanupAnimationScript := TAnimationScriptCleanup.Create;
    testAnimation := CreateAnimation(testScript, 0, true);
    CleanupAnimation := TAnimationCleanup.Create(testAnimation)
    AssertNotNull(testAnimation);
    animName := AnimationName(testAnimation);
    AssertEquals('walkfront', animName);
end;
procedure TestCreateAnimationIntegration;
begin
    testScript := LoadAnimationScript('kermit', 'kermit.txt');
    CleanupAnimationScript := TAnimationScriptCleanup.Create;
    testAnimation := CreateAnimation(testScript, 'moonwalkback');
    CleanupAnimation := TAnimationCleanup.Create(testAnimation)
    AssertNotNull(testAnimation);
    animName := AnimationName(testAnimation);
    AssertEquals('moonwalkback', animName);
end;
procedure TestCreateAnimationWithSoundIntegration;
begin
    testScript := LoadAnimationScript('kermit', 'kermit.txt');
    CleanupAnimationScript := TAnimationScriptCleanup.Create;
    testAnimation := CreateAnimation(testScript, 'moonwalkback', true);
    CleanupAnimation := TAnimationCleanup.Create(testAnimation)
    AssertNotNull(testAnimation);
    animName := AnimationName(testAnimation);
    AssertEquals('moonwalkback', animName);
end;
procedure TestCreateAnimationFromScriptNamedIntegration;
begin
    LoadAnimationScript('kermit', 'kermit.txt');
    CleanupAnimationScript := TAnimationScriptCleanup.Create;
    testAnimation := CreateAnimation('kermit', 'moonwalkback');
    CleanupAnimation := TAnimationCleanup.Create(testAnimation)
    AssertNotNull(testAnimation);
    animName := AnimationName(testAnimation);
    AssertEquals('moonwalkback', animName);
end;
procedure TestCreateAnimationFromScriptNamedWithSoundIntegration;
begin
    LoadAnimationScript('test_script', 'kermit.txt');
    CleanupAnimationScript := TAnimationScriptCleanup.Create;
    testAnimation := CreateAnimation('test_script', 'moonwalkback', true);
    CleanupAnimation := TAnimationCleanup.Create(testAnimation)
    AssertNotNull(testAnimation);
    animName := AnimationName(testAnimation);
    AssertEquals('moonwalkback', animName);
end;
procedure TestFreeAllAnimationScriptsIntegration;
begin
    LoadAnimationScript('free_all_kermit1', 'kermit.txt');
    CleanupAnimationScript := TAnimationScriptCleanup.Create;
    LoadAnimationScript('free_all_kermit2', 'kermit.txt');
    AssertTrue(HasAnimationScript('free_all_kermit1'));
    AssertTrue(HasAnimationScript('free_all_kermit2'));
    FreeAllAnimationScripts();
    AssertFalse(HasAnimationScript('free_all_kermit1'));
    AssertFalse(HasAnimationScript('free_all_kermit2'));
end;
procedure TestFreeAnimationIntegration;
begin
    testScript := LoadAnimationScript('kermit', 'kermit.txt');
    CleanupAnimationScript := TAnimationScriptCleanup.Create;
    testAnimation := CreateAnimation(testScript, 'moonwalkback');
    CleanupAnimation := TAnimationCleanup.Create(testAnimation)
    FreeAnimation(testAnimation);
    AssertEquals('', AnimationName(testAnimation));
    AssertTrue(AnimationEnded(testAnimation));
end;
procedure TestFreeAnimationScriptIntegration;
begin
    testScript := LoadAnimationScript('kermit', 'kermit.txt');
    CleanupAnimationScript := TAnimationScriptCleanup.Create;
    AssertNotNull(testScript);
    FreeAnimationScript(testScript);
    scriptExists := HasAnimationScript('has_kermit');
    AssertFalse(scriptExists);
end;
procedure TestFreeAnimationScriptWithNameIntegration;
begin
    LoadAnimationScript('free_kermit', 'kermit.txt');
    CleanupAnimationScript := TAnimationScriptCleanup.Create;
    AssertTrue(HasAnimationScript('free_kermit'));
    FreeAnimationScript('free_kermit');
    AssertFalse(HasAnimationScript('free_kermit'));
end;
procedure TestHasAnimationNamedIntegration;
begin
    testScript := LoadAnimationScript('kermit', 'kermit.txt');
    CleanupAnimationScript := TAnimationScriptCleanup.Create;
    hasWalkfront := HasAnimationNamed(testScript, 'walkfront');
    AssertTrue(hasWalkfront);
    hasNonexistent := HasAnimationNamed(testScript, 'NonExistentAnimation');
    AssertFalse(hasNonexistent);
end;
procedure TestHasAnimationScriptIntegration;
begin
    testScript := LoadAnimationScript('has_kermit', 'kermit.txt');
    CleanupAnimationScript := TAnimationScriptCleanup.Create;
    AssertTrue(HasAnimationScript('has_kermit'));
    FreeAnimationScript(testScript);
    AssertFalse(HasAnimationScript('has_kermit'));
end;
procedure TestLoadAnimationScriptIntegration;
begin
    testScript := LoadAnimationScript('test_animation_name', 'kermit.txt');
    CleanupAnimationScript := TAnimationScriptCleanup.Create;
    AssertNotNull(testScript);
    scriptName := AnimationScriptName(testScript);
    AssertEquals('test_animation_name', scriptName);
    FreeAnimationScript(testScript);
    scriptExists := HasAnimationScript('test_animation_name');
    AssertFalse(scriptExists);
end;
procedure TestRestartAnimationIntegration;
begin
    testScript := LoadAnimationScript('kermit', 'kermit.txt');
    CleanupAnimationScript := TAnimationScriptCleanup.Create;
    testAnimation := CreateAnimation(testScript, 'moonwalkback');
    CleanupAnimation := TAnimationCleanup.Create(testAnimation)
    for i := 0 to 49 do
        UpdateAnimation(testAnimation, 100.0);
    end;
    animEnded := AnimationEnded(testAnimation);
    AssertTrue(animEnded);
    RestartAnimation(testAnimation);
    animEndedAfterRestart := AnimationEnded(testAnimation);
    AssertFalse(animEndedAfterRestart);
end;
procedure TestRestartAnimationWithSoundIntegration;
begin
    testScript := LoadAnimationScript('kermit', 'kermit.txt');
    CleanupAnimationScript := TAnimationScriptCleanup.Create;
    testAnimation := CreateAnimation(testScript, 'moonwalkback', true);
    CleanupAnimation := TAnimationCleanup.Create(testAnimation)
    UpdateAnimation(testAnimation);
    RestartAnimation(testAnimation, true);
    AssertEquals(3, AnimationCurrentCell(testAnimation));
end;
procedure TestUpdateAnimationPercentWithSoundIntegration;
begin
    testScript := LoadAnimationScript('kermit', 'kermit.txt');
    CleanupAnimationScript := TAnimationScriptCleanup.Create;
    testAnimation := CreateAnimation(testScript, 'moonwalkback');
    CleanupAnimation := TAnimationCleanup.Create(testAnimation)
    UpdateAnimation(testAnimation, 0.5, true);
    AssertTrue(AnimationFrameTime(testAnimation) > 0.0);
end;
procedure TestUpdateAnimationIntegration;
begin
    testScript := LoadAnimationScript('kermit', 'kermit.txt');
    CleanupAnimationScript := TAnimationScriptCleanup.Create;
    testAnimation := CreateAnimation(testScript, 'moonwalkback');
    CleanupAnimation := TAnimationCleanup.Create(testAnimation)
    UpdateAnimation(testAnimation);
    AssertNotEquals(0, AnimationCurrentCell(testAnimation));
end;
procedure TestUpdateAnimationPercentIntegration;
begin
    testScript := LoadAnimationScript('kermit', 'kermit.txt');
    CleanupAnimationScript := TAnimationScriptCleanup.Create;
    testAnimation := CreateAnimation(testScript, 'walkfront');
    CleanupAnimation := TAnimationCleanup.Create(testAnimation)
    UpdateAnimation(testAnimation, 0.5);
    AssertTrue(AnimationFrameTime(testAnimation) > 0.0);
end;
end;

procedure RegisterTests;
begin
    #<Proc:0x00007fbbcab52da8 /mnt/c/Users/Noahc/Documents/aYear_2_semester_2/TeamProject/GitHubRepo/splashkit_test_generator/test_generator/config/languages/pascal_config.rb:138 (lambda)>
end;
