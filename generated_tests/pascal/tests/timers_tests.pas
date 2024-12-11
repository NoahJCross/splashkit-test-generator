uses SplashKit, TestFramework

type
TTestTimers = class(TTestCase)
protected
procedure TIntegrationTests.TestCreateTimerIntegration;
begin
    testTimer := CreateTimer("test_timer");
    AssertNotNull(testTimer);
    AssertTrue(HasTimerNamed("test_timer"));
    FreeTimer(testTimer);
end;
procedure TIntegrationTests.TestFreeAllTimersIntegration;
begin
    testTimer1 := CreateTimer("test_timer_1");
    testTimer2 := CreateTimer("test_timer_2");
    AssertTrue(HasTimerNamed("test_timer_1"));
    AssertTrue(HasTimerNamed("test_timer_2"));
    FreeAllTimers();
    AssertFalse(HasTimerNamed("test_timer_1"));
    AssertFalse(HasTimerNamed("test_timer_2"));
end;
procedure TIntegrationTests.TestFreeTimerIntegration;
begin
    testTimer := CreateTimer("test_timer");
    AssertTrue(HasTimerNamed("test_timer"));
    FreeTimer(testTimer);
    AssertFalse(HasTimerNamed("test_timer"));
end;
procedure TIntegrationTests.TestHasTimerNamedIntegration;
begin
    testTimer := CreateTimer("test_timer");
    AssertTrue(HasTimerNamed("test_timer"));
    FreeTimer(testTimer);
    AssertFalse(HasTimerNamed("test_timer"));
end;
procedure TIntegrationTests.TestPauseTimerNamedIntegration;
begin
    testTimer := CreateTimer("test_timer");
    StartTimer(testTimer);
    initialTicks := TimerTicks(testTimer);
    PauseTimerNamed("test_timer");
    AssertTrue(TimerPaused("test_timer"));
    AssertEquals(initialTicks, TimerTicks(testTimer));
    FreeTimer(testTimer);
end;
procedure TIntegrationTests.TestPauseTimerIntegration;
begin
    testTimer := CreateTimer("test_timer");
    StartTimer(testTimer);
    PauseTimer(testTimer);
    initialTicks := TimerTicks(testTimer);
    Delay(100);
    AssertEquals(initialTicks, TimerTicks(testTimer));
    FreeTimer(testTimer);
end;
procedure TIntegrationTests.TestResetTimerNamedIntegration;
begin
    testTimer := CreateTimer("test_timer");
    StartTimer(testTimer);
    Delay(100);
    initialTicks := TimerTicks(testTimer);
    ResetTimerNamed("test_timer");
    AssertTrue(TimerTicks(testTimer) < initialTicks);
    FreeTimer(testTimer);
end;
procedure TIntegrationTests.TestResetTimerIntegration;
begin
    testTimer := CreateTimer("test_timer");
    StartTimer(testTimer);
    Delay(100);
    initialTicks := TimerTicks(testTimer);
    ResetTimer(testTimer);
    AssertTrue(TimerTicks(testTimer) < initialTicks);
    FreeTimer(testTimer);
end;
procedure TIntegrationTests.TestResumeTimerNamedIntegration;
begin
    testTimer := CreateTimer("test_timer");
    StartTimer(testTimer);
    PauseTimer(testTimer);
    initialTicks := TimerTicks(testTimer);
    ResumeTimerNamed("test_timer");
    Delay(100);
    AssertTrue(TimerTicks(testTimer) > initialTicks);
    FreeTimer(testTimer);
end;
procedure TIntegrationTests.TestResumeTimerIntegration;
begin
    testTimer := CreateTimer("test_timer");
    StartTimer(testTimer);
    PauseTimer(testTimer);
    initialTicks := TimerTicks(testTimer);
    ResumeTimer(testTimer);
    Delay(100);
    AssertTrue(TimerTicks(testTimer) > initialTicks);
    FreeTimer(testTimer);
end;
procedure TIntegrationTests.TestStartTimerNamedIntegration;
begin
    testTimer := CreateTimer("test_timer");
    StartTimerNamed("test_timer");
    AssertTrue(TimerStarted("test_timer"));
    FreeTimer(testTimer);
end;
procedure TIntegrationTests.TestStartTimerIntegration;
begin
    testTimer := CreateTimer("test_timer");
    StartTimer(testTimer);
    AssertTrue(TimerStarted(testTimer));
    FreeTimer(testTimer);
end;
procedure TIntegrationTests.TestStopTimerNamedIntegration;
begin
    testTimer := CreateTimer("test_timer");
    StartTimer(testTimer);
    Delay(100);
    AssertTrue(TimerTicks(testTimer));
    StopTimerNamed("test_timer");
    AssertEquals(0, TimerTicks(testTimer));
    FreeTimer(testTimer);
end;
procedure TIntegrationTests.TestStopTimerIntegration;
begin
    testTimer := CreateTimer("test_timer");
    StartTimer(testTimer);
    AssertTrue(TimerStarted(testTimer));
    StopTimer(testTimer);
    AssertFalse(TimerStarted(testTimer));
    FreeTimer(testTimer);
end;
procedure TIntegrationTests.TestTimerNamedIntegration;
begin
    testTimer := CreateTimer("test_timer");
    namedTimer := TimerNamed("test_timer");
    AssertEquals(testTimer, namedTimer);
    FreeTimer(testTimer);
end;
procedure TIntegrationTests.TestTimerPausedNamedIntegration;
begin
    testTimer := CreateTimer("test_timer");
    StartTimer(testTimer);
    AssertFalse(TimerPausedNamed("test_timer"));
    PauseTimer("test_timer");
    AssertTrue(TimerPausedNamed("test_timer"));
    FreeTimer(testTimer);
end;
procedure TIntegrationTests.TestTimerPausedIntegration;
begin
    testTimer := CreateTimer("test_timer");
    StartTimer(testTimer);
    AssertFalse(TimerPaused(testTimer));
    PauseTimer(testTimer);
    AssertTrue(TimerPaused(testTimer));
    FreeTimer(testTimer);
end;
procedure TIntegrationTests.TestTimerStartedNamedIntegration;
begin
    testTimer := CreateTimer("test_timer");
    AssertFalse(TimerStartedNamed("test_timer"));
    StartTimer("test_timer");
    AssertTrue(TimerStartedNamed("test_timer"));
    FreeTimer(testTimer);
end;
procedure TIntegrationTests.TestTimerStartedIntegration;
begin
    testTimer := CreateTimer("test_timer");
    AssertFalse(TimerStarted(testTimer));
    StartTimer(testTimer);
    AssertTrue(TimerStarted(testTimer));
    FreeTimer(testTimer);
end;
procedure TIntegrationTests.TestTimerTicksNamedIntegration;
begin
    testTimer := CreateTimer("test_timer");
    StartTimer(testTimer);
    initialTicks := TimerTicksNamed("test_timer");
    Delay(100);
    afterDelayTicks := TimerTicksNamed("test_timer");
    AssertTrue(afterDelayTicks > initialTicks);
    FreeTimer(testTimer);
end;
procedure TIntegrationTests.TestTimerTicksIntegration;
begin
    testTimer := CreateTimer("test_timer");
    StartTimer(testTimer);
    initialTicks := TimerTicks(testTimer);
    Delay(100);
    afterDelayTicks := TimerTicks(testTimer);
    AssertTrue(afterDelayTicks > initialTicks);
    FreeTimer(testTimer);
end;
end;

procedure RegisterTests;
begin
#<Proc:0x00007f8aefd57268 /mnt/c/Users/Noahc/Documents/.Year 2 Semester 3/Team Project (A)/Github Repo/splashkit_test_generator/test_generator/config/languages/pascal_config.rb:113 (lambda)>
end;
