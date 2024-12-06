uses SplashKit, TestFramework

type
TIntegrationTests = class(TTestCase)
published
procedure TIntegrationTests.TestCreateTimerIntegration;
begin
    testTimer := create_timer("test_timer");
    AssertNotNull(testTimer);
    free_timer(testTimer);
    AssertFalse(has_timer("test_timer"));
end;
procedure TIntegrationTests.TestFreeAllTimersIntegration;
begin
    testTimer1 := create_timer("test_timer_1");
    testTimer2 := create_timer("test_timer_2");
    start_timer(testTimer1);
    start_timer(testTimer2);
    free_all_timers();
    AssertFalse(has_timer("test_timer_1"));
    AssertFalse(has_timer("test_timer_2"));
end;
procedure TIntegrationTests.TestFreeTimerIntegration;
begin
    testTimer := create_timer("test_timer");
    free_timer(testTimer);
    AssertFalse(has_timer("test_timer"));
end;
procedure TIntegrationTests.TestHasTimerNamedIntegration;
begin
    create_timer("test_timer");
    AssertTrue(has_timer("test_timer"));
    free_all_timers();
    AssertFalse(has_timer("test_timer"));
end;
procedure TIntegrationTests.TestPauseTimerNamedIntegration;
begin
    testTimer := create_timer("test_timer");
    start_timer(testTimer);
    initialTicks := timer_ticks(testTimer);
    pause_timer("test_timer");
    pausedTicks := timer_ticks(testTimer);
    AssertEquals(initialTicks, pausedTicks);
    free_all_timers();
end;
procedure TIntegrationTests.TestPauseTimerIntegration;
begin
    testTimer := create_timer("test_timer");
    start_timer(testTimer);
    pause_timer(testTimer);
    initialTicks := timer_ticks(testTimer);
    delay(1000);
    finalTicks := timer_ticks(testTimer);
    AssertEquals(initialTicks, finalTicks);
    free_all_timers();
end;
procedure TIntegrationTests.TestResetTimerNamedIntegration;
begin
    testTimer := create_timer("test_timer");
    start_timer(testTimer);
    process_events();
    AssertTrue(timer_ticks(testTimer) > 0);
    reset_timer("test_timer");
    process_events();
    AssertEquals(timer_ticks(testTimer), 0);
    free_all_timers();
end;
procedure TIntegrationTests.TestResetTimerIntegration;
begin
    testTimer := create_timer("test_timer");
    start_timer(testTimer);
    initialTicks := timer_ticks(testTimer);
    reset_timer(testTimer);
    AssertEquals(timer_ticks(testTimer), 0);
    free_all_timers();
end;
procedure TIntegrationTests.TestResumeTimerNamedIntegration;
begin
    testTimer := create_timer("test_timer");
    start_timer(testTimer);
    pause_timer(testTimer);
    initialTicks := timer_ticks(testTimer);
    process_events();
    resume_timer("test_timer");
    process_events();
    finalTicks := timer_ticks(testTimer);
    AssertTrue(finalTicks > initialTicks);
    free_all_timers();
end;
procedure TIntegrationTests.TestResumeTimerIntegration;
begin
    testTimer := create_timer("test_timer");
    start_timer(testTimer);
    pause_timer(testTimer);
    initialTicks := timer_ticks(testTimer);
    process_events();
    resume_timer(testTimer);
    process_events();
    finalTicks := timer_ticks(testTimer);
    AssertTrue(finalTicks > initialTicks);
    free_all_timers();
end;
procedure TIntegrationTests.TestStartTimerNamedIntegration;
begin
    testTimer := create_timer("test_timer");
    start_timer("test_timer");
    timerState := timer_started("test_timer");
    AssertTrue(timerState);
    free_all_timers();
end;
procedure TIntegrationTests.TestStartTimerIntegration;
begin
    testTimer := create_timer("test_timer");
    start_timer(testTimer);
    timerState := timer_started(testTimer);
    AssertTrue(timerState);
    free_timer(testTimer);
end;
procedure TIntegrationTests.TestStopTimerNamedIntegration;
begin
    testTimer := create_timer("test_timer");
    start_timer(testTimer);
    process_events();
    AssertTrue(timer_ticks(testTimer) > 0);
    stop_timer("test_timer");
    process_events();
    AssertEquals(timer_ticks(testTimer), 0);
    free_all_timers();
end;
procedure TIntegrationTests.TestStopTimerIntegration;
begin
    testTimer := create_timer("test_timer");
    start_timer(testTimer);
    process_events();
    AssertTrue(timer_started(testTimer));
    stop_timer(testTimer);
    process_events();
    AssertFalse(timer_started(testTimer));
    free_all_timers();
end;
procedure TIntegrationTests.TestTimerNamedIntegration;
begin
    testTimer := create_timer("test_timer");
    start_timer(testTimer);
    fetchedTimer := timer_named("test_timer");
    AssertTrue(timer_started(fetchedTimer));
    free_all_timers();
end;
procedure TIntegrationTests.TestTimerPausedNamedIntegration;
begin
    testTimer := create_timer("test_timer");
    start_timer(testTimer);
    AssertFalse(timer_paused("test_timer"));
    pause_timer(testTimer);
    AssertTrue(timer_paused("test_timer"));
    free_all_timers();
end;
procedure TIntegrationTests.TestTimerPausedIntegration;
begin
    testTimer := create_timer("test_timer");
    start_timer(testTimer);
    AssertFalse(timer_paused(testTimer));
    pause_timer(testTimer);
    AssertTrue(timer_paused(testTimer));
    free_all_timers();
end;
procedure TIntegrationTests.TestTimerStartedNamedIntegration;
begin
    testTimer := create_timer("test_timer");
    start_timer(testTimer);
    AssertTrue(timer_started("test_timer"));
    free_all_timers();
end;
procedure TIntegrationTests.TestTimerStartedIntegration;
begin
    testTimer := create_timer("test_timer");
    AssertFalse(timer_started(testTimer));
    start_timer(testTimer);
    AssertTrue(timer_started(testTimer));
    free_all_timers();
end;
procedure TIntegrationTests.TestTimerTicksNamedIntegration;
begin
    testTimer := create_timer("test_timer");
    start_timer(testTimer);
    initialTicks := timer_ticks("test_timer");
    delay(1000);
    afterDelayTicks := timer_ticks("test_timer");
    AssertTrue(afterDelayTicks > initialTicks);
    free_all_timers();
end;
procedure TIntegrationTests.TestTimerTicksIntegration;
begin
    testTimer := create_timer("test_timer");
    start_timer(testTimer);
    initialTicks := timer_ticks(testTimer);
    delay(1000);
    afterDelayTicks := timer_ticks(testTimer);
    AssertTrue(afterDelayTicks > initialTicks);
    free_timer(testTimer);
end;
end;

procedure RegisterTests;
begin
TestFramework.RegisterTest(TIntegrationTests.Suite);
end;
