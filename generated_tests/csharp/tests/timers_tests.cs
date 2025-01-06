using Xunit;
using SplashKitSDK;
using static SplashKitSDK.SplashKit;
using HttpMethod = SplashKitSDK.HttpMethod;
namespace SplashKitTests
{
    public class TestTimers
    {
        [Fact]
        public void TestCreateTimerIntegration() {
            var testTimer = CreateTimer("Test Timer 1");
            using var cleanupTimer = new TimerCleanup();
            Assert.NotNull(testTimer);
            Assert.True(HasTimer("Test Timer 1"));
        }
        [Fact]
        public void TestFreeAllTimersIntegration() {
            CreateTimer("Test Timer 2");
            using var cleanupTimer = new TimerCleanup();
            CreateTimer("Test Timer 3");
            Assert.True(HasTimer("Test Timer 2"));
            Assert.True(HasTimer("Test Timer 3"));
            FreeAllTimers();
            Assert.False(HasTimer("Test Timer 2"));
            Assert.False(HasTimer("Test Timer 3"));
        }
        [Fact]
        public void TestFreeTimerIntegration() {
            var testTimer = CreateTimer("Test Timer 4");
            using var cleanupTimer = new TimerCleanup();
            Assert.True(HasTimer("Test Timer 4"));
            FreeTimer(testTimer);
            Assert.False(HasTimer("Test Timer 4"));
        }
        [Fact]
        public void TestHasTimerNamedIntegration() {
            var testTimer = CreateTimer("Test Timer 5");
            using var cleanupTimer = new TimerCleanup();
            Assert.True(HasTimer("Test Timer 5"));
            FreeTimer(testTimer);
            Assert.False(HasTimer("Test Timer 5"));
        }
        [Fact]
        public void TestPauseTimerNamedIntegration() {
            var testTimer = CreateTimer("Test Timer 6");
            using var cleanupTimer = new TimerCleanup();
            StartTimer(testTimer);
            var initialTicks = TimerTicks(testTimer);
            PauseTimer("Test Timer 6");
            Assert.True(TimerPaused("Test Timer 6"));
            Assert.Equal(initialTicks, TimerTicks(testTimer));
        }
        [Fact]
        public void TestPauseTimerIntegration() {
            var testTimer = CreateTimer("Test Timer 7");
            using var cleanupTimer = new TimerCleanup();
            StartTimer(testTimer);
            PauseTimer(testTimer);
            var initialTicks = TimerTicks(testTimer);
            Delay(100);
            Assert.Equal(initialTicks, TimerTicks(testTimer));
        }
        [Fact]
        public void TestResetTimerNamedIntegration() {
            var testTimer = CreateTimer("Test Timer 8");
            using var cleanupTimer = new TimerCleanup();
            StartTimer(testTimer);
            Delay(100);
            var initialTicks = TimerTicks(testTimer);
            ResetTimer("Test Timer 8");
            Assert.True(TimerTicks(testTimer) < initialTicks);
        }
        [Fact]
        public void TestResetTimerIntegration() {
            var testTimer = CreateTimer("Test Timer 9");
            using var cleanupTimer = new TimerCleanup();
            StartTimer(testTimer);
            Delay(100);
            var initialTicks = TimerTicks(testTimer);
            ResetTimer(testTimer);
            Assert.True(TimerTicks(testTimer) < initialTicks);
        }
        [Fact]
        public void TestResumeTimerNamedIntegration() {
            var testTimer = CreateTimer("Test Timer 10");
            using var cleanupTimer = new TimerCleanup();
            StartTimer(testTimer);
            PauseTimer(testTimer);
            var initialTicks = TimerTicks(testTimer);
            ResumeTimer("Test Timer 10");
            Delay(100);
            Assert.True(TimerTicks(testTimer) > initialTicks);
        }
        [Fact]
        public void TestResumeTimerIntegration() {
            var testTimer = CreateTimer("Test Timer 11");
            using var cleanupTimer = new TimerCleanup();
            StartTimer(testTimer);
            PauseTimer(testTimer);
            var initialTicks = TimerTicks(testTimer);
            ResumeTimer(testTimer);
            Delay(100);
            Assert.True(TimerTicks(testTimer) > initialTicks);
        }
        [Fact]
        public void TestStartTimerNamedIntegration() {
            var testTimer = CreateTimer("Test Timer 12");
            using var cleanupTimer = new TimerCleanup();
            StartTimer("Test Timer 12");
            Assert.True(TimerStarted("Test Timer 12"));
        }
        [Fact]
        public void TestStartTimerIntegration() {
            var testTimer = CreateTimer("Test Timer 13");
            using var cleanupTimer = new TimerCleanup();
            StartTimer(testTimer);
            Assert.True(TimerStarted(testTimer));
        }
        [Fact]
        public void TestStopTimerNamedIntegration() {
            var testTimer = CreateTimer("Test Timer 14");
            using var cleanupTimer = new TimerCleanup();
            StartTimer(testTimer);
            Delay(100);
            Assert.True(TimerTicks(testTimer) > 40u);
            StopTimer("Test Timer 14");
            Assert.Equal(0u, TimerTicks(testTimer));
        }
        [Fact]
        public void TestStopTimerIntegration() {
            var testTimer = CreateTimer("Test Timer 15");
            using var cleanupTimer = new TimerCleanup();
            StartTimer(testTimer);
            Assert.True(TimerStarted(testTimer));
            StopTimer(testTimer);
            Assert.False(TimerStarted(testTimer));
        }
        [Fact]
        public void TestTimerNamedIntegration() {
            var testTimer = CreateTimer("Test Timer 16");
            using var cleanupTimer = new TimerCleanup();
            var namedTimer = TimerNamed("Test Timer 16");
            Assert.Equal(testTimer, namedTimer);
        }
        [Fact]
        public void TestTimerPausedNamedIntegration() {
            var testTimer = CreateTimer("Test Timer 17");
            using var cleanupTimer = new TimerCleanup();
            StartTimer(testTimer);
            Assert.False(TimerPaused("Test Timer 17"));
            PauseTimer("Test Timer 17");
            Assert.True(TimerPaused("Test Timer 17"));
        }
        [Fact]
        public void TestTimerPausedIntegration() {
            var testTimer = CreateTimer("Test Timer 18");
            using var cleanupTimer = new TimerCleanup();
            StartTimer(testTimer);
            Assert.False(TimerPaused(testTimer));
            PauseTimer(testTimer);
            Assert.True(TimerPaused(testTimer));
        }
        [Fact]
        public void TestTimerStartedNamedIntegration() {
            var testTimer = CreateTimer("Test Timer 19");
            using var cleanupTimer = new TimerCleanup();
            Assert.False(TimerStarted("Test Timer 19"));
            StartTimer("Test Timer 19");
            Assert.True(TimerStarted("Test Timer 19"));
        }
        [Fact]
        public void TestTimerStartedIntegration() {
            var testTimer = CreateTimer("Test Timer 20");
            using var cleanupTimer = new TimerCleanup();
            Assert.False(TimerStarted(testTimer));
            StartTimer(testTimer);
            Assert.True(TimerStarted(testTimer));
        }
        [Fact]
        public void TestTimerTicksNamedIntegration() {
            var testTimer = CreateTimer("Test Timer 21");
            using var cleanupTimer = new TimerCleanup();
            StartTimer(testTimer);
            var initialTicks = TimerTicks("Test Timer 21");
            Delay(100);
            var afterDelayTicks = TimerTicks("Test Timer 21");
            Assert.True(afterDelayTicks > initialTicks);
        }
        [Fact]
        public void TestTimerTicksIntegration() {
            var testTimer = CreateTimer("Test Timer 22");
            using var cleanupTimer = new TimerCleanup();
            StartTimer(testTimer);
            var initialTicks = TimerTicks(testTimer);
            Delay(100);
            var afterDelayTicks = TimerTicks(testTimer);
            Assert.True(afterDelayTicks > initialTicks);
        }
    }
}
