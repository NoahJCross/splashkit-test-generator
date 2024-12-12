using Xunit;
using static SplashKitSDK.SplashKit;

namespace SplashKitTests
{
    public class TestTimers
    {
        [Fact]
        public void TestCreateTimerIntegration()
        {
            var testTimer = CreateTimer("test_timer");
            Assert.NotNull(testTimer);
            Assert.True(HasTimer("test_timer"));
            FreeTimer(testTimer);
        }
        [Fact]
        public void TestFreeAllTimersIntegration()
        {
            var testTimer1 = CreateTimer("test_timer_1");
            var testTimer2 = CreateTimer("test_timer_2");
            Assert.True(HasTimer("test_timer_1"));
            Assert.True(HasTimer("test_timer_2"));
            FreeAllTimers();
            Assert.False(HasTimer("test_timer_1"));
            Assert.False(HasTimer("test_timer_2"));
        }
        [Fact]
        public void TestFreeTimerIntegration()
        {
            var testTimer = CreateTimer("test_timer");
            Assert.True(HasTimer("test_timer"));
            FreeTimer(testTimer);
            Assert.False(HasTimer("test_timer"));
        }
        [Fact]
        public void TestHasTimerNamedIntegration()
        {
            var testTimer = CreateTimer("test_timer");
            Assert.True(HasTimer("test_timer"));
            FreeTimer(testTimer);
            Assert.False(HasTimer("test_timer"));
        }
        [Fact]
        public void TestPauseTimerNamedIntegration()
        {
            var testTimer = CreateTimer("test_timer");
            StartTimer(testTimer);
            var initialTicks = TimerTicks(testTimer);
            PauseTimer("test_timer");
            Assert.True(TimerPaused("test_timer"));
            Assert.Equal(initialTicks, TimerTicks(testTimer));
            FreeTimer(testTimer);
        }
        [Fact]
        public void TestPauseTimerIntegration()
        {
            var testTimer = CreateTimer("test_timer");
            StartTimer(testTimer);
            PauseTimer(testTimer);
            var initialTicks = TimerTicks(testTimer);
            Delay(100);
            Assert.Equal(initialTicks, TimerTicks(testTimer));
            FreeTimer(testTimer);
        }
        [Fact]
        public void TestResetTimerNamedIntegration()
        {
            var testTimer = CreateTimer("test_timer");
            StartTimer(testTimer);
            Delay(100);
            var initialTicks = TimerTicks(testTimer);
            ResetTimer("test_timer");
            Assert.True(TimerTicks(testTimer) < initialTicks);
            FreeTimer(testTimer);
        }
        [Fact]
        public void TestResetTimerIntegration()
        {
            var testTimer = CreateTimer("test_timer");
            StartTimer(testTimer);
            Delay(100);
            var initialTicks = TimerTicks(testTimer);
            ResetTimer(testTimer);
            Assert.True(TimerTicks(testTimer) < initialTicks);
            FreeTimer(testTimer);
        }
        [Fact]
        public void TestResumeTimerNamedIntegration()
        {
            var testTimer = CreateTimer("test_timer");
            StartTimer(testTimer);
            PauseTimer(testTimer);
            var initialTicks = TimerTicks(testTimer);
            ResumeTimer("test_timer");
            Delay(100);
            Assert.True(TimerTicks(testTimer) > initialTicks);
            FreeTimer(testTimer);
        }
        [Fact]
        public void TestResumeTimerIntegration()
        {
            var testTimer = CreateTimer("test_timer");
            StartTimer(testTimer);
            PauseTimer(testTimer);
            var initialTicks = TimerTicks(testTimer);
            ResumeTimer(testTimer);
            Delay(100);
            Assert.True(TimerTicks(testTimer) > initialTicks);
            FreeTimer(testTimer);
        }
        [Fact]
        public void TestStartTimerNamedIntegration()
        {
            var testTimer = CreateTimer("test_timer");
            StartTimer("test_timer");
            Assert.True(TimerStarted("test_timer"));
            FreeTimer(testTimer);
        }
        [Fact]
        public void TestStartTimerIntegration()
        {
            var testTimer = CreateTimer("test_timer");
            StartTimer(testTimer);
            Assert.True(TimerStarted(testTimer));
            FreeTimer(testTimer);
        }
        [Fact]
        public void TestStopTimerNamedIntegration()
        {
            var testTimer = CreateTimer("test_timer");
            StartTimer(testTimer);
            Delay(100);
            Assert.True(TimerTicks(testTimer) > 100u);
            StopTimer("test_timer");
            Assert.Equal(0u, TimerTicks(testTimer));
            FreeTimer(testTimer);
        }
        [Fact]
        public void TestStopTimerIntegration()
        {
            var testTimer = CreateTimer("test_timer");
            StartTimer(testTimer);
            Assert.True(TimerStarted(testTimer));
            StopTimer(testTimer);
            Assert.False(TimerStarted(testTimer));
            FreeTimer(testTimer);
        }
        [Fact]
        public void TestTimerNamedIntegration()
        {
            var testTimer = CreateTimer("test_timer");
            var namedTimer = TimerNamed("test_timer");
            Assert.Equal(testTimer, namedTimer);
            FreeTimer(testTimer);
        }
        [Fact]
        public void TestTimerPausedNamedIntegration()
        {
            var testTimer = CreateTimer("test_timer");
            StartTimer(testTimer);
            Assert.False(TimerPaused("test_timer"));
            PauseTimer("test_timer");
            Assert.True(TimerPaused("test_timer"));
            FreeTimer(testTimer);
        }
        [Fact]
        public void TestTimerPausedIntegration()
        {
            var testTimer = CreateTimer("test_timer");
            StartTimer(testTimer);
            Assert.False(TimerPaused(testTimer));
            PauseTimer(testTimer);
            Assert.True(TimerPaused(testTimer));
            FreeTimer(testTimer);
        }
        [Fact]
        public void TestTimerStartedNamedIntegration()
        {
            var testTimer = CreateTimer("test_timer");
            Assert.False(TimerStarted("test_timer"));
            StartTimer("test_timer");
            Assert.True(TimerStarted("test_timer"));
            FreeTimer(testTimer);
        }
        [Fact]
        public void TestTimerStartedIntegration()
        {
            var testTimer = CreateTimer("test_timer");
            Assert.False(TimerStarted(testTimer));
            StartTimer(testTimer);
            Assert.True(TimerStarted(testTimer));
            FreeTimer(testTimer);
        }
        [Fact]
        public void TestTimerTicksNamedIntegration()
        {
            var testTimer = CreateTimer("test_timer");
            StartTimer(testTimer);
            var initialTicks = TimerTicks("test_timer");
            Delay(100);
            var afterDelayTicks = TimerTicks("test_timer");
            Assert.True(afterDelayTicks > initialTicks);
            FreeTimer(testTimer);
        }
        [Fact]
        public void TestTimerTicksIntegration()
        {
            var testTimer = CreateTimer("test_timer");
            StartTimer(testTimer);
            var initialTicks = TimerTicks(testTimer);
            Delay(100);
            var afterDelayTicks = TimerTicks(testTimer);
            Assert.True(afterDelayTicks > initialTicks);
            FreeTimer(testTimer);
        }
    }
}
