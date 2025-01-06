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
    testScript := LoadAnimationScript('Test Script 1', 'kermit.txt');
    CleanupAnimationScript := TAnimationScriptCleanup.Create;
    AssertTrue(AnimationCount(testScript) > 0);
end;
procedure TestAnimationCurrentCellIntegration;
begin
    testScript := LoadAnimationScript('Test Script 2', 'kermit.txt');
    CleanupAnimationScript := TAnimationScriptCleanup.Create;
    testAnimation := CreateAnimation(testScript, 'moonwalkback');
    CleanupAnimation := TAnimationCleanup.Create(testAnimation)
    AssertTrue(AnimationCurrentCell(testAnimation) > -1);
end;
procedure TestAnimationCurrentVectorIntegration;
begin
    testScript := LoadAnimationScript('Test Script 3', 'kermit.txt');
    CleanupAnimationScript := TAnimationScriptCleanup.Create;
    testAnimation := CreateAnimation(testScript, 'moonwalkback');
    CleanupAnimation := TAnimationCleanup.Create(testAnimation)
    currentVector := AnimationCurrentVector(testAnimation);
    AssertEquals(0.0, currentVector.x);
    AssertEquals(0.0, currentVector.y);
end;
procedure TestAnimationEndedIntegration;
begin
    testScript := LoadAnimationScript('Test Script 4', 'kermit.txt');
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
    testScript := LoadAnimationScript('Test Script 5', 'kermit.txt');
    CleanupAnimationScript := TAnimationScriptCleanup.Create;
    testAnimation := CreateAnimation(testScript, 'walkfront');
    CleanupAnimation := TAnimationCleanup.Create(testAnimation)
    UpdateAnimation(testAnimation, 20.0);
    AssertTrue(AnimationEnteredFrame(testAnimation));
    UpdateAnimation(testAnimation);
    AssertFalse(AnimationEnteredFrame(testAnimation));
end;
procedure TestAnimationFrameTimeIntegration;
begin
    testScript := LoadAnimationScript('Test Script 6', 'kermit.txt');
    CleanupAnimationScript := TAnimationScriptCleanup.Create;
    testAnimation := CreateAnimation(testScript, 'walkfront');
    CleanupAnimation := TAnimationCleanup.Create(testAnimation)
    UpdateAnimation(testAnimation);
    frameTime := AnimationFrameTime(testAnimation);
    AssertTrue(frameTime > 0.0);
end;
procedure TestAnimationIndexIntegration;
begin
    testScript := LoadAnimationScript('Test Script 7', 'kermit.txt');
    CleanupAnimationScript := TAnimationScriptCleanup.Create;
    AssertTrue(AnimationIndex(testScript, 'walkfront') > -1);
    AssertEquals(-1, AnimationIndex(testScript, 'NonExistentAnimation'));
end;
procedure TestAnimationNameIntegration;
begin
    testScript := LoadAnimationScript('Test Script 8', 'kermit.txt');
    CleanupAnimationScript := TAnimationScriptCleanup.Create;
    testAnimation := CreateAnimation(testScript, 'moonwalkback');
    CleanupAnimation := TAnimationCleanup.Create(testAnimation)
    animName := AnimationName(testAnimation);
    AssertEquals('moonwalkback', animName);
end;
procedure TestAnimationScriptNameIntegration;
begin
    testScript := LoadAnimationScript('Test Script 9', 'kermit.txt');
    CleanupAnimationScript := TAnimationScriptCleanup.Create;
    AssertEquals('Test Script 9', AnimationScriptName(testScript));
end;
procedure TestAnimationScriptNamedIntegration;
begin
    testScript := LoadAnimationScript('Test Script 10', 'kermit.txt');
    CleanupAnimationScript := TAnimationScriptCleanup.Create;
    AnimationScriptNamed('Test Script 10');
    AssertNotNull(testScript);
    AssertEquals(testScript, testScript);
end;
procedure TestAssignAnimationWithScriptIntegration;
begin
    testScript := LoadAnimationScript('Test Script 11', 'kermit.txt');
    CleanupAnimationScript := TAnimationScriptCleanup.Create;
    testAnimation := CreateAnimation(testScript, 'moonwalkback');
    CleanupAnimation := TAnimationCleanup.Create(testAnimation)
    AssignAnimation(testAnimation, testScript, 'walkfront');
    AssertEquals('walkfront', AnimationName(testAnimation));
end;
procedure TestAssignAnimationWithScriptAndSoundIntegration;
begin
    testScript := LoadAnimationScript('Test Script 12', 'kermit.txt');
    CleanupAnimationScript := TAnimationScriptCleanup.Create;
    testAnimation := CreateAnimation(testScript, 'walkfront');
    CleanupAnimation := TAnimationCleanup.Create(testAnimation)
    AssignAnimation(testAnimation, testScript, 'walkleft', true);
    AssertEquals('walkleft', AnimationName(testAnimation));
end;
procedure TestAssignAnimationIndexWithScriptIntegration;
begin
    testScript := LoadAnimationScript('Test Script 13', 'kermit.txt');
    CleanupAnimationScript := TAnimationScriptCleanup.Create;
    testAnimation := CreateAnimation(testScript, 'moonwalkback');
    CleanupAnimation := TAnimationCleanup.Create(testAnimation)
    AssignAnimation(testAnimation, testScript, 0);
    AssertEquals('walkfront', AnimationName(testAnimation));
end;
procedure TestAssignAnimationIndexWithScriptAndSoundIntegration;
begin
    testScript := LoadAnimationScript('Test Script 14', 'kermit.txt');
    CleanupAnimationScript := TAnimationScriptCleanup.Create;
    testAnimation := CreateAnimation(testScript, 'moonwalkback');
    CleanupAnimation := TAnimationCleanup.Create(testAnimation)
    AssignAnimation(testAnimation, testScript, 0, true);
    AssertEquals('walkfront', AnimationName(testAnimation));
end;
procedure TestAssignAnimationWithScriptNamedIntegration;
begin
    testScript := LoadAnimationScript('Test Script 15', 'kermit.txt');
    CleanupAnimationScript := TAnimationScriptCleanup.Create;
    testAnimation := CreateAnimation(testScript, 'moonwalkback');
    CleanupAnimation := TAnimationCleanup.Create(testAnimation)
    AssignAnimation(testAnimation, 'Test Script 15', 'walkfront');
    AssertEquals('walkfront', AnimationName(testAnimation));
end;
procedure TestAssignAnimationWithScriptNamedAndSoundIntegration;
begin
    testScript := LoadAnimationScript('Test Script 16', 'kermit.txt');
    CleanupAnimationScript := TAnimationScriptCleanup.Create;
    testAnimation := CreateAnimation(testScript, 'walkfront');
    CleanupAnimation := TAnimationCleanup.Create(testAnimation)
    AssignAnimation(testAnimation, 'Test Script 16', 'walkfront', true);
    AssertEquals('walkfront', AnimationName(testAnimation));
end;
procedure TestAssignAnimationIndexIntegration;
begin
    testScript := LoadAnimationScript('Test Script 17', 'kermit.txt');
    CleanupAnimationScript := TAnimationScriptCleanup.Create;
    testAnimation := CreateAnimation(testScript, 'moonwalkback');
    CleanupAnimation := TAnimationCleanup.Create(testAnimation)
    AssignAnimation(testAnimation, 0);
    AssertEquals(0, AnimationCurrentCell(testAnimation));
end;
procedure TestAssignAnimationIndexWithSoundIntegration;
begin
    testScript := LoadAnimationScript('Test Script 18', 'kermit.txt');
    CleanupAnimationScript := TAnimationScriptCleanup.Create;
    testAnimation := CreateAnimation(testScript, 'moonwalkback', false);
    CleanupAnimation := TAnimationCleanup.Create(testAnimation)
    AssignAnimation(testAnimation, 0, true);
    AssertTrue(AnimationEnteredFrame(testAnimation));
end;
procedure TestAssignAnimationIntegration;
begin
    testScript := LoadAnimationScript('Test Script 19', 'kermit.txt');
    CleanupAnimationScript := TAnimationScriptCleanup.Create;
    testAnimation := CreateAnimation(testScript, 'moonwalkback');
    CleanupAnimation := TAnimationCleanup.Create(testAnimation)
    AssignAnimation(testAnimation, 'walkfront');
    AssertEquals('walkfront', AnimationName(testAnimation));
end;
procedure TestAssignAnimationWithSoundIntegration;
begin
    testScript := LoadAnimationScript('Test Script 20', 'kermit.txt');
    CleanupAnimationScript := TAnimationScriptCleanup.Create;
    testAnimation := CreateAnimation(testScript, 'moonwalkback');
    CleanupAnimation := TAnimationCleanup.Create(testAnimation)
    AssignAnimation(testAnimation, 'walkfront', true);
    AssertEquals('walkfront', AnimationName(testAnimation));
end;
procedure TestCreateAnimationFromIndexWithSoundIntegration;
begin
    testScript := LoadAnimationScript('Test Script 21', 'kermit.txt');
    CleanupAnimationScript := TAnimationScriptCleanup.Create;
    testAnimation := CreateAnimation(testScript, 0, true);
    CleanupAnimation := TAnimationCleanup.Create(testAnimation)
    AssertNotNull(testAnimation);
    AssertEquals('walkfront', AnimationName(testAnimation));
end;
procedure TestCreateAnimationIntegration;
begin
    testScript := LoadAnimationScript('Test Script 22', 'kermit.txt');
    CleanupAnimationScript := TAnimationScriptCleanup.Create;
    testAnimation := CreateAnimation(testScript, 'moonwalkback');
    CleanupAnimation := TAnimationCleanup.Create(testAnimation)
    AssertNotNull(testAnimation);
    AssertEquals('moonwalkback', AnimationName(testAnimation));
end;
procedure TestCreateAnimationWithSoundIntegration;
begin
    testScript := LoadAnimationScript('Test Script 23', 'kermit.txt');
    CleanupAnimationScript := TAnimationScriptCleanup.Create;
    testAnimation := CreateAnimation(testScript, 'moonwalkback', true);
    CleanupAnimation := TAnimationCleanup.Create(testAnimation)
    AssertNotNull(testAnimation);
    AssertEquals('moonwalkback', AnimationName(testAnimation));
end;
procedure TestCreateAnimationFromScriptNamedIntegration;
begin
    LoadAnimationScript('Test Script 24', 'kermit.txt');
    CleanupAnimationScript := TAnimationScriptCleanup.Create;
    testAnimation := CreateAnimation('Test Script 24', 'moonwalkback');
    CleanupAnimation := TAnimationCleanup.Create(testAnimation)
    AssertNotNull(testAnimation);
    AssertEquals('moonwalkback', AnimationName(testAnimation));
end;
procedure TestCreateAnimationFromScriptNamedWithSoundIntegration;
begin
    LoadAnimationScript('Test Script 25', 'kermit.txt');
    CleanupAnimationScript := TAnimationScriptCleanup.Create;
    testAnimation := CreateAnimation('Test Script 25', 'moonwalkback', true);
    CleanupAnimation := TAnimationCleanup.Create(testAnimation)
    AssertNotNull(testAnimation);
    AssertEquals('moonwalkback', AnimationName(testAnimation));
end;
procedure TestFreeAllAnimationScriptsIntegration;
begin
    LoadAnimationScript('Test Script 26', 'kermit.txt');
    CleanupAnimationScript := TAnimationScriptCleanup.Create;
    LoadAnimationScript('Test Script 27', 'kermit.txt');
    AssertTrue(HasAnimationScript('Test Script 26'));
    AssertTrue(HasAnimationScript('Test Script 27'));
    FreeAllAnimationScripts();
    AssertFalse(HasAnimationScript('Test Script 26'));
    AssertFalse(HasAnimationScript('Test Script 27'));
end;
procedure TestFreeAnimationIntegration;
begin
    testScript := LoadAnimationScript('Test Script 28', 'kermit.txt');
    CleanupAnimationScript := TAnimationScriptCleanup.Create;
    testAnimation := CreateAnimation(testScript, 'moonwalkback');
    CleanupAnimation := TAnimationCleanup.Create(testAnimation)
    FreeAnimation(testAnimation);
    AssertEquals('', AnimationName(testAnimation));
    AssertTrue(AnimationEnded(testAnimation));
end;
procedure TestFreeAnimationScriptIntegration;
begin
    testScript := LoadAnimationScript('Test Script 29', 'kermit.txt');
    CleanupAnimationScript := TAnimationScriptCleanup.Create;
    AssertNotNull(testScript);
    FreeAnimationScript(testScript);
    AssertFalse(HasAnimationScript('Test Script 29'));
end;
procedure TestFreeAnimationScriptWithNameIntegration;
begin
    LoadAnimationScript('Test Script 30', 'kermit.txt');
    CleanupAnimationScript := TAnimationScriptCleanup.Create;
    AssertTrue(HasAnimationScript('Test Script 30'));
    FreeAnimationScript('Test Script 30');
    AssertFalse(HasAnimationScript('Test Script 30'));
end;
procedure TestHasAnimationNamedIntegration;
begin
    testScript := LoadAnimationScript('Test Script 31', 'kermit.txt');
    CleanupAnimationScript := TAnimationScriptCleanup.Create;
    AssertTrue(HasAnimationNamed(testScript, 'walkfront'));
    AssertFalse(HasAnimationNamed(testScript, 'NonExistentAnimation'));
end;
procedure TestHasAnimationScriptIntegration;
begin
    testScript := LoadAnimationScript('Test Script 32', 'kermit.txt');
    CleanupAnimationScript := TAnimationScriptCleanup.Create;
    AssertTrue(HasAnimationScript('Test Script 32'));
    FreeAnimationScript(testScript);
    AssertFalse(HasAnimationScript('Test Script 32'));
end;
procedure TestLoadAnimationScriptIntegration;
begin
    testScript := LoadAnimationScript('Test Script 33', 'kermit.txt');
    CleanupAnimationScript := TAnimationScriptCleanup.Create;
    AssertNotNull(testScript);
    scriptName := AnimationScriptName(testScript);
    AssertEquals('Test Script 33', scriptName);
    FreeAnimationScript(testScript);
    AssertFalse(HasAnimationScript('Test Script 33'));
end;
procedure TestRestartAnimationIntegration;
begin
    testScript := LoadAnimationScript('Test Script 34', 'kermit.txt');
    CleanupAnimationScript := TAnimationScriptCleanup.Create;
    testAnimation := CreateAnimation(testScript, 'moonwalkback');
    CleanupAnimation := TAnimationCleanup.Create(testAnimation)
    for i := 0 to 49 do
        UpdateAnimation(testAnimation, 100.0);
    end;
    animEnded := AnimationEnded(testAnimation);
    AssertTrue(animEnded);
    RestartAnimation(testAnimation);
    AssertFalse(AnimationEnded(testAnimation));
end;
procedure TestRestartAnimationWithSoundIntegration;
begin
    testScript := LoadAnimationScript('Test Script 35', 'kermit.txt');
    CleanupAnimationScript := TAnimationScriptCleanup.Create;
    testAnimation := CreateAnimation(testScript, 'moonwalkback', true);
    CleanupAnimation := TAnimationCleanup.Create(testAnimation)
    UpdateAnimation(testAnimation);
    RestartAnimation(testAnimation, true);
    AssertEquals(3, AnimationCurrentCell(testAnimation));
end;
procedure TestUpdateAnimationPercentWithSoundIntegration;
begin
    testScript := LoadAnimationScript('Test Script 36', 'kermit.txt');
    CleanupAnimationScript := TAnimationScriptCleanup.Create;
    testAnimation := CreateAnimation(testScript, 'moonwalkback');
    CleanupAnimation := TAnimationCleanup.Create(testAnimation)
    UpdateAnimation(testAnimation, 0.5, true);
    AssertTrue(AnimationFrameTime(testAnimation) > 0.0);
end;
procedure TestUpdateAnimationIntegration;
begin
    testScript := LoadAnimationScript('Test Script 37', 'kermit.txt');
    CleanupAnimationScript := TAnimationScriptCleanup.Create;
    testAnimation := CreateAnimation(testScript, 'moonwalkback');
    CleanupAnimation := TAnimationCleanup.Create(testAnimation)
    UpdateAnimation(testAnimation);
    AssertNotEquals(0, AnimationCurrentCell(testAnimation));
end;
procedure TestUpdateAnimationPercentIntegration;
begin
    testScript := LoadAnimationScript('Test Script 38', 'kermit.txt');
    CleanupAnimationScript := TAnimationScriptCleanup.Create;
    testAnimation := CreateAnimation(testScript, 'walkfront');
    CleanupAnimation := TAnimationCleanup.Create(testAnimation)
    UpdateAnimation(testAnimation, 0.5);
    AssertTrue(AnimationFrameTime(testAnimation) > 0.0);
end;
end;

procedure RegisterTests;
begin
    #<Proc:0x00007faa116e2450 /mnt/c/Users/Noahc/Documents/aYear_2_semester_2/TeamProject/GitHubRepo/splashkit_test_generator/test_generator/config/languages/pascal_config.rb:138 (lambda)>
end;
