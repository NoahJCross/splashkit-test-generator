using Xunit;
using SplashKitSDK;
using static SplashKitSDK.SplashKit;
using HttpMethod = SplashKitSDK.HttpMethod;
namespace SplashKitTests
{
    public class TestAnimations
    {
        public TestAnimations()
        {
            SetResourcesPath("/mnt/c/Users/Noahc/Documents/aYear_2_semester_2/TeamProject/GitHubRepo/splashkit_test_generator/resources");
        }
        [Fact]
        public void TestAnimationCountIntegration() {
            var testScript = LoadAnimationScript("Test Script 1", "kermit.txt");
            using var cleanupAnimationScript = new AnimationScriptCleanup();
            Assert.True(AnimationCount(testScript) > 0);
        }
        [Fact]
        public void TestAnimationCurrentCellIntegration() {
            var testScript = LoadAnimationScript("Test Script 2", "kermit.txt");
            using var cleanupAnimationScript = new AnimationScriptCleanup();
            var testAnimation = CreateAnimation(testScript, "moonwalkback");
            using var cleanupAnimation = new AnimationCleanup(testAnimation);
            Assert.True(AnimationCurrentCell(testAnimation) > -1);
        }
        [Fact]
        public void TestAnimationCurrentVectorIntegration() {
            var testScript = LoadAnimationScript("Test Script 3", "kermit.txt");
            using var cleanupAnimationScript = new AnimationScriptCleanup();
            var testAnimation = CreateAnimation(testScript, "moonwalkback");
            using var cleanupAnimation = new AnimationCleanup(testAnimation);
            var currentVector = AnimationCurrentVector(testAnimation);
            Assert.Equal(0.0, currentVector.X);
            Assert.Equal(0.0, currentVector.Y);
        }
        [Fact]
        public void TestAnimationEndedIntegration() {
            var testScript = LoadAnimationScript("Test Script 4", "kermit.txt");
            using var cleanupAnimationScript = new AnimationScriptCleanup();
            var testAnimation = CreateAnimation(testScript, "moonwalkback");
            using var cleanupAnimation = new AnimationCleanup(testAnimation);
            Assert.False(AnimationEnded(testAnimation));
            for (int i = 0; i < 50; i++) {
                UpdateAnimation(testAnimation, 100.0f);
            }
            Assert.True(AnimationEnded(testAnimation));
        }
        [Fact]
        public void TestAnimationEnteredFrameIntegration() {
            var testScript = LoadAnimationScript("Test Script 5", "kermit.txt");
            using var cleanupAnimationScript = new AnimationScriptCleanup();
            var testAnimation = CreateAnimation(testScript, "walkfront");
            using var cleanupAnimation = new AnimationCleanup(testAnimation);
            UpdateAnimation(testAnimation, 20.0f);
            Assert.True(AnimationEnteredFrame(testAnimation));
            UpdateAnimation(testAnimation);
            Assert.False(AnimationEnteredFrame(testAnimation));
        }
        [Fact]
        public void TestAnimationFrameTimeIntegration() {
            var testScript = LoadAnimationScript("Test Script 6", "kermit.txt");
            using var cleanupAnimationScript = new AnimationScriptCleanup();
            var testAnimation = CreateAnimation(testScript, "walkfront");
            using var cleanupAnimation = new AnimationCleanup(testAnimation);
            UpdateAnimation(testAnimation);
            var frameTime = AnimationFrameTime(testAnimation);
            Assert.True(frameTime > 0.0f);
        }
        [Fact]
        public void TestAnimationIndexIntegration() {
            var testScript = LoadAnimationScript("Test Script 7", "kermit.txt");
            using var cleanupAnimationScript = new AnimationScriptCleanup();
            Assert.True(AnimationIndex(testScript, "walkfront") > -1);
            Assert.Equal(-1, AnimationIndex(testScript, "NonExistentAnimation"));
        }
        [Fact]
        public void TestAnimationNameIntegration() {
            var testScript = LoadAnimationScript("Test Script 8", "kermit.txt");
            using var cleanupAnimationScript = new AnimationScriptCleanup();
            var testAnimation = CreateAnimation(testScript, "moonwalkback");
            using var cleanupAnimation = new AnimationCleanup(testAnimation);
            var animName = AnimationName(testAnimation);
            Assert.Equal("moonwalkback", animName);
        }
        [Fact]
        public void TestAnimationScriptNameIntegration() {
            var testScript = LoadAnimationScript("Test Script 9", "kermit.txt");
            using var cleanupAnimationScript = new AnimationScriptCleanup();
            Assert.Equal("Test Script 9", AnimationScriptName(testScript));
        }
        [Fact]
        public void TestAnimationScriptNamedIntegration() {
            var testScript = LoadAnimationScript("Test Script 10", "kermit.txt");
            using var cleanupAnimationScript = new AnimationScriptCleanup();
            AnimationScriptNamed("Test Script 10");
            Assert.NotNull(testScript);
            Assert.Equal(testScript, testScript);
        }
        [Fact]
        public void TestAssignAnimationWithScriptIntegration() {
            var testScript = LoadAnimationScript("Test Script 11", "kermit.txt");
            using var cleanupAnimationScript = new AnimationScriptCleanup();
            var testAnimation = CreateAnimation(testScript, "moonwalkback");
            using var cleanupAnimation = new AnimationCleanup(testAnimation);
            AssignAnimation(testAnimation, testScript, "walkfront");
            Assert.Equal("walkfront", AnimationName(testAnimation));
        }
        [Fact]
        public void TestAssignAnimationWithScriptAndSoundIntegration() {
            var testScript = LoadAnimationScript("Test Script 12", "kermit.txt");
            using var cleanupAnimationScript = new AnimationScriptCleanup();
            var testAnimation = CreateAnimation(testScript, "walkfront");
            using var cleanupAnimation = new AnimationCleanup(testAnimation);
            AssignAnimation(testAnimation, testScript, "walkleft", true);
            Assert.Equal("walkleft", AnimationName(testAnimation));
        }
        [Fact]
        public void TestAssignAnimationIndexWithScriptIntegration() {
            var testScript = LoadAnimationScript("Test Script 13", "kermit.txt");
            using var cleanupAnimationScript = new AnimationScriptCleanup();
            var testAnimation = CreateAnimation(testScript, "moonwalkback");
            using var cleanupAnimation = new AnimationCleanup(testAnimation);
            AssignAnimation(testAnimation, testScript, 0);
            Assert.Equal("walkfront", AnimationName(testAnimation));
        }
        [Fact]
        public void TestAssignAnimationIndexWithScriptAndSoundIntegration() {
            var testScript = LoadAnimationScript("Test Script 14", "kermit.txt");
            using var cleanupAnimationScript = new AnimationScriptCleanup();
            var testAnimation = CreateAnimation(testScript, "moonwalkback");
            using var cleanupAnimation = new AnimationCleanup(testAnimation);
            AssignAnimation(testAnimation, testScript, 0, true);
            Assert.Equal("walkfront", AnimationName(testAnimation));
        }
        [Fact]
        public void TestAssignAnimationWithScriptNamedIntegration() {
            var testScript = LoadAnimationScript("Test Script 15", "kermit.txt");
            using var cleanupAnimationScript = new AnimationScriptCleanup();
            var testAnimation = CreateAnimation(testScript, "moonwalkback");
            using var cleanupAnimation = new AnimationCleanup(testAnimation);
            AssignAnimation(testAnimation, "Test Script 15", "walkfront");
            Assert.Equal("walkfront", AnimationName(testAnimation));
        }
        [Fact]
        public void TestAssignAnimationWithScriptNamedAndSoundIntegration() {
            var testScript = LoadAnimationScript("Test Script 16", "kermit.txt");
            using var cleanupAnimationScript = new AnimationScriptCleanup();
            var testAnimation = CreateAnimation(testScript, "walkfront");
            using var cleanupAnimation = new AnimationCleanup(testAnimation);
            AssignAnimation(testAnimation, "Test Script 16", "walkfront", true);
            Assert.Equal("walkfront", AnimationName(testAnimation));
        }
        [Fact]
        public void TestAssignAnimationIndexIntegration() {
            var testScript = LoadAnimationScript("Test Script 17", "kermit.txt");
            using var cleanupAnimationScript = new AnimationScriptCleanup();
            var testAnimation = CreateAnimation(testScript, "moonwalkback");
            using var cleanupAnimation = new AnimationCleanup(testAnimation);
            AssignAnimation(testAnimation, 0);
            Assert.Equal(0, AnimationCurrentCell(testAnimation));
        }
        [Fact]
        public void TestAssignAnimationIndexWithSoundIntegration() {
            var testScript = LoadAnimationScript("Test Script 18", "kermit.txt");
            using var cleanupAnimationScript = new AnimationScriptCleanup();
            var testAnimation = CreateAnimation(testScript, "moonwalkback", false);
            using var cleanupAnimation = new AnimationCleanup(testAnimation);
            AssignAnimation(testAnimation, 0, true);
            Assert.True(AnimationEnteredFrame(testAnimation));
        }
        [Fact]
        public void TestAssignAnimationIntegration() {
            var testScript = LoadAnimationScript("Test Script 19", "kermit.txt");
            using var cleanupAnimationScript = new AnimationScriptCleanup();
            var testAnimation = CreateAnimation(testScript, "moonwalkback");
            using var cleanupAnimation = new AnimationCleanup(testAnimation);
            AssignAnimation(testAnimation, "walkfront");
            Assert.Equal("walkfront", AnimationName(testAnimation));
        }
        [Fact]
        public void TestAssignAnimationWithSoundIntegration() {
            var testScript = LoadAnimationScript("Test Script 20", "kermit.txt");
            using var cleanupAnimationScript = new AnimationScriptCleanup();
            var testAnimation = CreateAnimation(testScript, "moonwalkback");
            using var cleanupAnimation = new AnimationCleanup(testAnimation);
            AssignAnimation(testAnimation, "walkfront", true);
            Assert.Equal("walkfront", AnimationName(testAnimation));
        }
        [Fact]
        public void TestCreateAnimationFromIndexWithSoundIntegration() {
            var testScript = LoadAnimationScript("Test Script 21", "kermit.txt");
            using var cleanupAnimationScript = new AnimationScriptCleanup();
            var testAnimation = CreateAnimation(testScript, 0, true);
            using var cleanupAnimation = new AnimationCleanup(testAnimation);
            Assert.NotNull(testAnimation);
            Assert.Equal("walkfront", AnimationName(testAnimation));
        }
        [Fact]
        public void TestCreateAnimationIntegration() {
            var testScript = LoadAnimationScript("Test Script 22", "kermit.txt");
            using var cleanupAnimationScript = new AnimationScriptCleanup();
            var testAnimation = CreateAnimation(testScript, "moonwalkback");
            using var cleanupAnimation = new AnimationCleanup(testAnimation);
            Assert.NotNull(testAnimation);
            Assert.Equal("moonwalkback", AnimationName(testAnimation));
        }
        [Fact]
        public void TestCreateAnimationWithSoundIntegration() {
            var testScript = LoadAnimationScript("Test Script 23", "kermit.txt");
            using var cleanupAnimationScript = new AnimationScriptCleanup();
            var testAnimation = CreateAnimation(testScript, "moonwalkback", true);
            using var cleanupAnimation = new AnimationCleanup(testAnimation);
            Assert.NotNull(testAnimation);
            Assert.Equal("moonwalkback", AnimationName(testAnimation));
        }
        [Fact]
        public void TestCreateAnimationFromScriptNamedIntegration() {
            LoadAnimationScript("Test Script 24", "kermit.txt");
            using var cleanupAnimationScript = new AnimationScriptCleanup();
            var testAnimation = CreateAnimation("Test Script 24", "moonwalkback");
            using var cleanupAnimation = new AnimationCleanup(testAnimation);
            Assert.NotNull(testAnimation);
            Assert.Equal("moonwalkback", AnimationName(testAnimation));
        }
        [Fact]
        public void TestCreateAnimationFromScriptNamedWithSoundIntegration() {
            LoadAnimationScript("Test Script 25", "kermit.txt");
            using var cleanupAnimationScript = new AnimationScriptCleanup();
            var testAnimation = CreateAnimation("Test Script 25", "moonwalkback", true);
            using var cleanupAnimation = new AnimationCleanup(testAnimation);
            Assert.NotNull(testAnimation);
            Assert.Equal("moonwalkback", AnimationName(testAnimation));
        }
        [Fact]
        public void TestFreeAllAnimationScriptsIntegration() {
            LoadAnimationScript("Test Script 26", "kermit.txt");
            using var cleanupAnimationScript = new AnimationScriptCleanup();
            LoadAnimationScript("Test Script 27", "kermit.txt");
            Assert.True(HasAnimationScript("Test Script 26"));
            Assert.True(HasAnimationScript("Test Script 27"));
            FreeAllAnimationScripts();
            Assert.False(HasAnimationScript("Test Script 26"));
            Assert.False(HasAnimationScript("Test Script 27"));
        }
        [Fact]
        public void TestFreeAnimationIntegration() {
            var testScript = LoadAnimationScript("Test Script 28", "kermit.txt");
            using var cleanupAnimationScript = new AnimationScriptCleanup();
            var testAnimation = CreateAnimation(testScript, "moonwalkback");
            using var cleanupAnimation = new AnimationCleanup(testAnimation);
            FreeAnimation(testAnimation);
            Assert.Equal("", AnimationName(testAnimation));
            Assert.True(AnimationEnded(testAnimation));
        }
        [Fact]
        public void TestFreeAnimationScriptIntegration() {
            var testScript = LoadAnimationScript("Test Script 29", "kermit.txt");
            using var cleanupAnimationScript = new AnimationScriptCleanup();
            Assert.NotNull(testScript);
            FreeAnimationScript(testScript);
            Assert.False(HasAnimationScript("Test Script 29"));
        }
        [Fact]
        public void TestFreeAnimationScriptWithNameIntegration() {
            LoadAnimationScript("Test Script 30", "kermit.txt");
            using var cleanupAnimationScript = new AnimationScriptCleanup();
            Assert.True(HasAnimationScript("Test Script 30"));
            FreeAnimationScript("Test Script 30");
            Assert.False(HasAnimationScript("Test Script 30"));
        }
        [Fact]
        public void TestHasAnimationNamedIntegration() {
            var testScript = LoadAnimationScript("Test Script 31", "kermit.txt");
            using var cleanupAnimationScript = new AnimationScriptCleanup();
            Assert.True(HasAnimationNamed(testScript, "walkfront"));
            Assert.False(HasAnimationNamed(testScript, "NonExistentAnimation"));
        }
        [Fact]
        public void TestHasAnimationScriptIntegration() {
            var testScript = LoadAnimationScript("Test Script 32", "kermit.txt");
            using var cleanupAnimationScript = new AnimationScriptCleanup();
            Assert.True(HasAnimationScript("Test Script 32"));
            FreeAnimationScript(testScript);
            Assert.False(HasAnimationScript("Test Script 32"));
        }
        [Fact]
        public void TestLoadAnimationScriptIntegration() {
            var testScript = LoadAnimationScript("Test Script 33", "kermit.txt");
            using var cleanupAnimationScript = new AnimationScriptCleanup();
            Assert.NotNull(testScript);
            var scriptName = AnimationScriptName(testScript);
            Assert.Equal("Test Script 33", scriptName);
            FreeAnimationScript(testScript);
            Assert.False(HasAnimationScript("Test Script 33"));
        }
        [Fact]
        public void TestRestartAnimationIntegration() {
            var testScript = LoadAnimationScript("Test Script 34", "kermit.txt");
            using var cleanupAnimationScript = new AnimationScriptCleanup();
            var testAnimation = CreateAnimation(testScript, "moonwalkback");
            using var cleanupAnimation = new AnimationCleanup(testAnimation);
            for (int i = 0; i < 50; i++) {
                UpdateAnimation(testAnimation, 100.0f);
            }
            var animEnded = AnimationEnded(testAnimation);
            Assert.True(animEnded);
            RestartAnimation(testAnimation);
            Assert.False(AnimationEnded(testAnimation));
        }
        [Fact]
        public void TestRestartAnimationWithSoundIntegration() {
            var testScript = LoadAnimationScript("Test Script 35", "kermit.txt");
            using var cleanupAnimationScript = new AnimationScriptCleanup();
            var testAnimation = CreateAnimation(testScript, "moonwalkback", true);
            using var cleanupAnimation = new AnimationCleanup(testAnimation);
            UpdateAnimation(testAnimation);
            RestartAnimation(testAnimation, true);
            Assert.Equal(3, AnimationCurrentCell(testAnimation));
        }
        [Fact]
        public void TestUpdateAnimationPercentWithSoundIntegration() {
            var testScript = LoadAnimationScript("Test Script 36", "kermit.txt");
            using var cleanupAnimationScript = new AnimationScriptCleanup();
            var testAnimation = CreateAnimation(testScript, "moonwalkback");
            using var cleanupAnimation = new AnimationCleanup(testAnimation);
            UpdateAnimation(testAnimation, 0.5f, true);
            Assert.True(AnimationFrameTime(testAnimation) > 0.0f);
        }
        [Fact]
        public void TestUpdateAnimationIntegration() {
            var testScript = LoadAnimationScript("Test Script 37", "kermit.txt");
            using var cleanupAnimationScript = new AnimationScriptCleanup();
            var testAnimation = CreateAnimation(testScript, "moonwalkback");
            using var cleanupAnimation = new AnimationCleanup(testAnimation);
            UpdateAnimation(testAnimation);
            Assert.NotEqual(0, AnimationCurrentCell(testAnimation));
        }
        [Fact]
        public void TestUpdateAnimationPercentIntegration() {
            var testScript = LoadAnimationScript("Test Script 38", "kermit.txt");
            using var cleanupAnimationScript = new AnimationScriptCleanup();
            var testAnimation = CreateAnimation(testScript, "walkfront");
            using var cleanupAnimation = new AnimationCleanup(testAnimation);
            UpdateAnimation(testAnimation, 0.5f);
            Assert.True(AnimationFrameTime(testAnimation) > 0.0f);
        }
    }
}
