uses SplashKit, TestFramework

type
TIntegrationTests = class(TTestCase)
published
procedure TIntegrationTests.TestCreateTimerIntegration;
begin
    testTimer := CreateTimer("test_timer");
    AssertNotNull(testTimer);
    FreeTimer(testTimer);
    AssertFalse(HasTimer("test_timer"));
end;
procedure TIntegrationTests.TestFreeAllTimersIntegration;
begin
    testTimer1 := CreateTimer("test_timer_1");
    testTimer2 := CreateTimer("test_timer_2");
    StartTimer(testTimer1);
    StartTimer(testTimer2);
    FreeAllTimers();
    AssertFalse(HasTimer("test_timer_1"));
    AssertFalse(HasTimer("test_timer_2"));
end;
procedure TIntegrationTests.TestFreeTimerIntegration;
begin
    testTimer := CreateTimer("test_timer");
    FreeTimer(testTimer);
    AssertFalse(HasTimer("test_timer"));
end;
procedure TIntegrationTests.TestHasTimerNamedIntegration;
begin
    CreateTimer("test_timer");
    AssertTrue(HasTimer("test_timer"));
    FreeAllTimers();
    AssertFalse(HasTimer("test_timer"));
end;
procedure TIntegrationTests.TestPauseTimerNamedIntegration;
begin
    testTimer := CreateTimer("test_timer");
    StartTimer(testTimer);
    initialTicks := TimerTicks(testTimer);
    PauseTimer("test_timer");
    pausedTicks := TimerTicks(testTimer);
    AssertEquals(initialTicks, pausedTicks);
    FreeAllTimers();
end;
procedure TIntegrationTests.TestPauseTimerIntegration;
begin
    testTimer := CreateTimer("test_timer");
    StartTimer(testTimer);
    PauseTimer(testTimer);
    initialTicks := TimerTicks(testTimer);
    Delay(1000);
    finalTicks := TimerTicks(testTimer);
    AssertEquals(initialTicks, finalTicks);
    FreeAllTimers();
end;
procedure TIntegrationTests.TestResetTimerNamedIntegration;
begin
    testTimer := CreateTimer("test_timer");
    StartTimer(testTimer);
    ProcessEvents();
    AssertTrue(TimerTicks(testTimer) > 0);
    ResetTimer("test_timer");
    ProcessEvents();
    AssertEquals(TimerTicks(testTimer), 0);
    FreeAllTimers();
end;
procedure TIntegrationTests.TestResetTimerIntegration;
begin
    testTimer := CreateTimer("test_timer");
    StartTimer(testTimer);
    initialTicks := TimerTicks(testTimer);
    ResetTimer(testTimer);
    AssertEquals(TimerTicks(testTimer), 0);
    FreeAllTimers();
end;
procedure TIntegrationTests.TestResumeTimerNamedIntegration;
begin
    testTimer := CreateTimer("test_timer");
    StartTimer(testTimer);
    PauseTimer(testTimer);
    initialTicks := TimerTicks(testTimer);
    ProcessEvents();
    ResumeTimer("test_timer");
    ProcessEvents();
    finalTicks := TimerTicks(testTimer);
    AssertTrue(finalTicks > initialTicks);
    FreeAllTimers();
end;
procedure TIntegrationTests.TestResumeTimerIntegration;
begin
    testTimer := CreateTimer("test_timer");
    StartTimer(testTimer);
    PauseTimer(testTimer);
    initialTicks := TimerTicks(testTimer);
    ProcessEvents();
    ResumeTimer(testTimer);
    ProcessEvents();
    finalTicks := TimerTicks(testTimer);
    AssertTrue(finalTicks > initialTicks);
    FreeAllTimers();
end;
procedure TIntegrationTests.TestStartTimerNamedIntegration;
begin
    testTimer := CreateTimer("test_timer");
    StartTimer("test_timer");
    timerState := TimerStarted("test_timer");
    AssertTrue(timerState);
    FreeAllTimers();
end;
procedure TIntegrationTests.TestStartTimerIntegration;
begin
    testTimer := CreateTimer("test_timer");
    StartTimer(testTimer);
    timerState := TimerStarted(testTimer);
    AssertTrue(timerState);
    FreeTimer(testTimer);
end;
procedure TIntegrationTests.TestStopTimerNamedIntegration;
begin
    testTimer := CreateTimer("test_timer");
    StartTimer(testTimer);
    ProcessEvents();
    AssertTrue(TimerTicks(testTimer) > 0);
    StopTimer("test_timer");
    ProcessEvents();
    AssertEquals(TimerTicks(testTimer), 0);
    FreeAllTimers();
end;
procedure TIntegrationTests.TestStopTimerIntegration;
begin
    testTimer := CreateTimer("test_timer");
    StartTimer(testTimer);
    ProcessEvents();
    AssertTrue(TimerStarted(testTimer));
    StopTimer(testTimer);
    ProcessEvents();
    AssertFalse(TimerStarted(testTimer));
    FreeAllTimers();
end;
procedure TIntegrationTests.TestTimerNamedIntegration;
begin
    testTimer := CreateTimer("test_timer");
    StartTimer(testTimer);
    fetchedTimer := TimerNamed("test_timer");
    AssertTrue(TimerStarted(fetchedTimer));
    FreeAllTimers();
end;
procedure TIntegrationTests.TestTimerPausedNamedIntegration;
begin
    testTimer := CreateTimer("test_timer");
    StartTimer(testTimer);
    AssertFalse(TimerPaused("test_timer"));
    PauseTimer(testTimer);
    AssertTrue(TimerPaused("test_timer"));
    FreeAllTimers();
end;
procedure TIntegrationTests.TestTimerPausedIntegration;
begin
    testTimer := CreateTimer("test_timer");
    StartTimer(testTimer);
    AssertFalse(TimerPaused(testTimer));
    PauseTimer(testTimer);
    AssertTrue(TimerPaused(testTimer));
    FreeAllTimers();
end;
procedure TIntegrationTests.TestTimerStartedNamedIntegration;
begin
    testTimer := CreateTimer("test_timer");
    StartTimer(testTimer);
    AssertTrue(TimerStarted("test_timer"));
    FreeAllTimers();
end;
procedure TIntegrationTests.TestTimerStartedIntegration;
begin
    testTimer := CreateTimer("test_timer");
    AssertFalse(TimerStarted(testTimer));
    StartTimer(testTimer);
    AssertTrue(TimerStarted(testTimer));
    FreeAllTimers();
end;
procedure TIntegrationTests.TestTimerTicksNamedIntegration;
begin
    testTimer := CreateTimer("test_timer");
    StartTimer(testTimer);
    initialTicks := TimerTicks("test_timer");
    Delay(1000);
    afterDelayTicks := TimerTicks("test_timer");
    AssertTrue(afterDelayTicks > initialTicks);
    FreeAllTimers();
end;
procedure TIntegrationTests.TestTimerTicksIntegration;
begin
    testTimer := CreateTimer("test_timer");
    StartTimer(testTimer);
    initialTicks := TimerTicks(testTimer);
    Delay(1000);
    afterDelayTicks := TimerTicks(testTimer);
    AssertTrue(afterDelayTicks > initialTicks);
    FreeTimer(testTimer);
end;
end;

procedure RegisterTests;
begin
TestFramework.RegisterTest(TIntegrationTests.Suite);
end;
