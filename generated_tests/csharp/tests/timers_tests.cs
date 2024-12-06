using Xunit;
using static SplashKitSDK.SplashKit;

namespace SplashKitTests
{
    public class IntegrationTests
    {
        [Fact]
        public void TestCreateTimerIntegration()
        {
            var testTimer = CreateTimer("test_timer");
            Assert.NotNull(testTimer);
            FreeTimer(testTimer);
            Assert.False(HasTimer("test_timer"));
        }
        [Fact]
        public void TestFreeAllTimersIntegration()
        {
            var testTimer1 = CreateTimer("test_timer_1");
            var testTimer2 = CreateTimer("test_timer_2");
            StartTimer(testTimer1);
            StartTimer(testTimer2);
            FreeAllTimers();
            Assert.False(HasTimer("test_timer_1"));
            Assert.False(HasTimer("test_timer_2"));
        }
        [Fact]
        public void TestFreeTimerIntegration()
        {
            var testTimer = CreateTimer("test_timer");
            FreeTimer(testTimer);
            Assert.False(HasTimer("test_timer"));
        }
        [Fact]
        public void TestHasTimerNamedIntegration()
        {
            CreateTimer("test_timer");
            Assert.True(HasTimer("test_timer"));
            FreeAllTimers();
            Assert.False(HasTimer("test_timer"));
        }
        [Fact]
        public void TestPauseTimerNamedIntegration()
        {
            var testTimer = CreateTimer("test_timer");
            StartTimer(testTimer);
            var initialTicks = TimerTicks(testTimer);
            PauseTimer("test_timer");
            var pausedTicks = TimerTicks(testTimer);
            Assert.Equal(pausedTicks, initialTicks);
            FreeAllTimers();
        }
        [Fact]
        public void TestPauseTimerIntegration()
        {
            var testTimer = CreateTimer("test_timer");
            StartTimer(testTimer);
            PauseTimer(testTimer);
            var initialTicks = TimerTicks(testTimer);
            Delay(1000);
            var finalTicks = TimerTicks(testTimer);
            Assert.Equal(finalTicks, initialTicks);
            FreeAllTimers();
        }
        [Fact]
        public void TestResetTimerNamedIntegration()
        {
            var testTimer = CreateTimer("test_timer");
            StartTimer(testTimer);
            ProcessEvents();
            Assert.True(TimerTicks(testTimer) > 0);
            ResetTimer("test_timer");
            ProcessEvents();
            Assert.Equal(0, TimerTicks(testTimer));
            FreeAllTimers();
        }
        [Fact]
        public void TestResetTimerIntegration()
        {
            var testTimer = CreateTimer("test_timer");
            StartTimer(testTimer);
            var initialTicks = TimerTicks(testTimer);
            ResetTimer(testTimer);
            Assert.Equal(0, TimerTicks(testTimer));
            FreeAllTimers();
        }
        [Fact]
        public void TestResumeTimerNamedIntegration()
        {
            var testTimer = CreateTimer("test_timer");
            StartTimer(testTimer);
            PauseTimer(testTimer);
            var initialTicks = TimerTicks(testTimer);
            ProcessEvents();
            ResumeTimer("test_timer");
            ProcessEvents();
            var finalTicks = TimerTicks(testTimer);
            Assert.True(finalTicks > initialTicks);
            FreeAllTimers();
        }
        [Fact]
        public void TestResumeTimerIntegration()
        {
            var testTimer = CreateTimer("test_timer");
            StartTimer(testTimer);
            PauseTimer(testTimer);
            var initialTicks = TimerTicks(testTimer);
            ProcessEvents();
            ResumeTimer(testTimer);
            ProcessEvents();
            var finalTicks = TimerTicks(testTimer);
            Assert.True(finalTicks > initialTicks);
            FreeAllTimers();
        }
        [Fact]
        public void TestStartTimerNamedIntegration()
        {
            var testTimer = CreateTimer("test_timer");
            StartTimer("test_timer");
            var timerState = TimerStarted("test_timer");
            Assert.True(timerState);
            FreeAllTimers();
        }
        [Fact]
        public void TestStartTimerIntegration()
        {
            var testTimer = CreateTimer("test_timer");
            StartTimer(testTimer);
            var timerState = TimerStarted(testTimer);
            Assert.True(timerState);
            FreeTimer(testTimer);
        }
        [Fact]
        public void TestStopTimerNamedIntegration()
        {
            var testTimer = CreateTimer("test_timer");
            StartTimer(testTimer);
            ProcessEvents();
            Assert.True(TimerTicks(testTimer) > 0);
            StopTimer("test_timer");
            ProcessEvents();
            Assert.Equal(0, TimerTicks(testTimer));
            FreeAllTimers();
        }
        [Fact]
        public void TestStopTimerIntegration()
        {
            var testTimer = CreateTimer("test_timer");
            StartTimer(testTimer);
            ProcessEvents();
            Assert.True(TimerStarted(testTimer));
            StopTimer(testTimer);
            ProcessEvents();
            Assert.False(TimerStarted(testTimer));
            FreeAllTimers();
        }
        [Fact]
        public void TestTimerNamedIntegration()
        {
            var testTimer = CreateTimer("test_timer");
            StartTimer(testTimer);
            var fetchedTimer = TimerNamed("test_timer");
            Assert.True(TimerStarted(fetchedTimer));
            FreeAllTimers();
        }
        [Fact]
        public void TestTimerPausedNamedIntegration()
        {
            var testTimer = CreateTimer("test_timer");
            StartTimer(testTimer);
            Assert.False(TimerPaused("test_timer"));
            PauseTimer(testTimer);
            Assert.True(TimerPaused("test_timer"));
            FreeAllTimers();
        }
        [Fact]
        public void TestTimerPausedIntegration()
        {
            var testTimer = CreateTimer("test_timer");
            StartTimer(testTimer);
            Assert.False(TimerPaused(testTimer));
            PauseTimer(testTimer);
            Assert.True(TimerPaused(testTimer));
            FreeAllTimers();
        }
        [Fact]
        public void TestTimerStartedNamedIntegration()
        {
            var testTimer = CreateTimer("test_timer");
            StartTimer(testTimer);
            Assert.True(TimerStarted("test_timer"));
            FreeAllTimers();
        }
        [Fact]
        public void TestTimerStartedIntegration()
        {
            var testTimer = CreateTimer("test_timer");
            Assert.False(TimerStarted(testTimer));
            StartTimer(testTimer);
            Assert.True(TimerStarted(testTimer));
            FreeAllTimers();
        }
        [Fact]
        public void TestTimerTicksNamedIntegration()
        {
            var testTimer = CreateTimer("test_timer");
            StartTimer(testTimer);
            var initialTicks = TimerTicks("test_timer");
            Delay(1000);
            var afterDelayTicks = TimerTicks("test_timer");
            Assert.True(afterDelayTicks > initialTicks);
            FreeAllTimers();
        }
        [Fact]
        public void TestTimerTicksIntegration()
        {
            var testTimer = CreateTimer("test_timer");
            StartTimer(testTimer);
            var initialTicks = TimerTicks(testTimer);
            Delay(1000);
            var afterDelayTicks = TimerTicks(testTimer);
            Assert.True(afterDelayTicks > initialTicks);
            FreeTimer(testTimer);
        }
    }
}
