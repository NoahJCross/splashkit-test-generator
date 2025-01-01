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
            var testScript = LoadAnimationScript("kermit", "kermit.txt");
            using var cleanupAnimationScript = new AnimationScriptCleanup();
            var count = AnimationCount(testScript);
            Assert.True(count > 0);
        }
        [Fact]
        public void TestAnimationCurrentCellIntegration() {
            var testScript = LoadAnimationScript("kermit", "kermit.txt");
            using var cleanupAnimationScript = new AnimationScriptCleanup();
            var testAnimation = CreateAnimation(testScript, "moonwalkback");
            using var cleanupAnimation = new AnimationCleanup(testAnimation);
            var currentCell = AnimationCurrentCell(testAnimation);
            Assert.True(currentCell > -1);
        }
        [Fact]
        public void TestAnimationCurrentVectorIntegration() {
            var testScript = LoadAnimationScript("kermit", "kermit.txt");
            using var cleanupAnimationScript = new AnimationScriptCleanup();
            var testAnimation = CreateAnimation(testScript, "moonwalkback");
            using var cleanupAnimation = new AnimationCleanup(testAnimation);
            var currentVector = AnimationCurrentVector(testAnimation);
            Assert.Equal(0.0, currentVector.X);
            Assert.Equal(0.0, currentVector.Y);
        }
        [Fact]
        public void TestAnimationEndedIntegration() {
            var testScript = LoadAnimationScript("kermit", "kermit.txt");
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
            var testScript = LoadAnimationScript("kermit", "kermit.txt");
            using var cleanupAnimationScript = new AnimationScriptCleanup();
            var testAnimation = CreateAnimation(testScript, "walkfront");
            using var cleanupAnimation = new AnimationCleanup(testAnimation);
            UpdateAnimation(testAnimation, 20f);
            Assert.True(AnimationEnteredFrame(testAnimation));
            UpdateAnimation(testAnimation);
            Assert.False(AnimationEnteredFrame(testAnimation));
        }
        [Fact]
        public void TestAnimationFrameTimeIntegration() {
            var testScript = LoadAnimationScript("kermit", "kermit.txt");
            using var cleanupAnimationScript = new AnimationScriptCleanup();
            var testAnimation = CreateAnimation(testScript, "walkfront");
            using var cleanupAnimation = new AnimationCleanup(testAnimation);
            UpdateAnimation(testAnimation);
            var frameTime = AnimationFrameTime(testAnimation);
            Assert.True(frameTime > 0.0f);
        }
        [Fact]
        public void TestAnimationIndexIntegration() {
            var testScript = LoadAnimationScript("kermit", "kermit.txt");
            using var cleanupAnimationScript = new AnimationScriptCleanup();
            var index = AnimationIndex(testScript, "walkfront");
            Assert.True(index > -1);
            var nonExistentIndex = AnimationIndex(testScript, "NonExistentAnimation");
            Assert.Equal(-1, nonExistentIndex);
        }
        [Fact]
        public void TestAnimationNameIntegration() {
            var testScript = LoadAnimationScript("kermit", "kermit.txt");
            using var cleanupAnimationScript = new AnimationScriptCleanup();
            var testAnimation = CreateAnimation(testScript, "moonwalkback");
            using var cleanupAnimation = new AnimationCleanup(testAnimation);
            var animName = AnimationName(testAnimation);
            Assert.Equal("moonwalkback", animName);
        }
        [Fact]
        public void TestAnimationScriptNameIntegration() {
            var testScript = LoadAnimationScript("kermit", "kermit.txt");
            using var cleanupAnimationScript = new AnimationScriptCleanup();
            var scriptName = AnimationScriptName(testScript);
            Assert.Equal("kermit", scriptName);
        }
        [Fact]
        public void TestAnimationScriptNamedIntegration() {
            var testScript = LoadAnimationScript("kermit", "kermit.txt");
            using var cleanupAnimationScript = new AnimationScriptCleanup();
            AnimationScriptNamed("kermit");
            Assert.NotNull(testScript);
            Assert.Equal(testScript, testScript);
        }
        [Fact]
        public void TestAssignAnimationWithScriptIntegration() {
            var testScript = LoadAnimationScript("kermit", "kermit.txt");
            using var cleanupAnimationScript = new AnimationScriptCleanup();
            var testAnimation = CreateAnimation(testScript, "moonwalkback");
            using var cleanupAnimation = new AnimationCleanup(testAnimation);
            AssignAnimation(testAnimation, testScript, "walkfront");
            Assert.Equal("walkfront", AnimationName(testAnimation));
        }
        [Fact]
        public void TestAssignAnimationWithScriptAndSoundIntegration() {
            var testScript = LoadAnimationScript("kermit", "kermit.txt");
            using var cleanupAnimationScript = new AnimationScriptCleanup();
            var testAnimation = CreateAnimation(testScript, "walkfront");
            using var cleanupAnimation = new AnimationCleanup(testAnimation);
            AssignAnimation(testAnimation, testScript, "walkleft", true);
            Assert.Equal("walkleft", AnimationName(testAnimation));
        }
        [Fact]
        public void TestAssignAnimationIndexWithScriptIntegration() {
            var testScript = LoadAnimationScript("kermit", "kermit.txt");
            using var cleanupAnimationScript = new AnimationScriptCleanup();
            var testAnimation = CreateAnimation(testScript, "moonwalkback");
            using var cleanupAnimation = new AnimationCleanup(testAnimation);
            AssignAnimation(testAnimation, testScript, 0);
            Assert.Equal("walkfront", AnimationName(testAnimation));
        }
        [Fact]
        public void TestAssignAnimationIndexWithScriptAndSoundIntegration() {
            var testScript = LoadAnimationScript("kermit", "kermit.txt");
            using var cleanupAnimationScript = new AnimationScriptCleanup();
            var testAnimation = CreateAnimation(testScript, "moonwalkback");
            using var cleanupAnimation = new AnimationCleanup(testAnimation);
            AssignAnimation(testAnimation, testScript, 0, true);
            Assert.Equal("walkfront", AnimationName(testAnimation));
        }
        [Fact]
        public void TestAssignAnimationWithScriptNamedIntegration() {
            var testScript = LoadAnimationScript("kermit", "kermit.txt");
            using var cleanupAnimationScript = new AnimationScriptCleanup();
            var testAnimation = CreateAnimation(testScript, "moonwalkback");
            using var cleanupAnimation = new AnimationCleanup(testAnimation);
            AssignAnimation(testAnimation, "kermit", "walkfront");
            Assert.Equal("walkfront", AnimationName(testAnimation));
        }
        [Fact]
        public void TestAssignAnimationWithScriptNamedAndSoundIntegration() {
            var testScript = LoadAnimationScript("kermit", "kermit.txt");
            using var cleanupAnimationScript = new AnimationScriptCleanup();
            var testAnimation = CreateAnimation(testScript, "walkfront");
            using var cleanupAnimation = new AnimationCleanup(testAnimation);
            AssignAnimation(testAnimation, "kermit", "walkfront", true);
            Assert.Equal("walkfront", AnimationName(testAnimation));
        }
        [Fact]
        public void TestAssignAnimationIndexIntegration() {
            var testScript = LoadAnimationScript("kermit", "kermit.txt");
            using var cleanupAnimationScript = new AnimationScriptCleanup();
            var testAnimation = CreateAnimation(testScript, "moonwalkback");
            using var cleanupAnimation = new AnimationCleanup(testAnimation);
            AssignAnimation(testAnimation, 0);
            Assert.Equal(0, AnimationCurrentCell(testAnimation));
        }
        [Fact]
        public void TestAssignAnimationIndexWithSoundIntegration() {
            var testScript = LoadAnimationScript("kermit", "kermit.txt");
            using var cleanupAnimationScript = new AnimationScriptCleanup();
            var testAnimation = CreateAnimation(testScript, "moonwalkback", false);
            using var cleanupAnimation = new AnimationCleanup(testAnimation);
            AssignAnimation(testAnimation, 0, true);
            Assert.True(AnimationEnteredFrame(testAnimation));
        }
        [Fact]
        public void TestAssignAnimationIntegration() {
            var testScript = LoadAnimationScript("kermit", "kermit.txt");
            using var cleanupAnimationScript = new AnimationScriptCleanup();
            var testAnimation = CreateAnimation(testScript, "moonwalkback");
            using var cleanupAnimation = new AnimationCleanup(testAnimation);
            AssignAnimation(testAnimation, "walkfront");
            Assert.Equal("walkfront", AnimationName(testAnimation));
        }
        [Fact]
        public void TestAssignAnimationWithSoundIntegration() {
            var testScript = LoadAnimationScript("kermit", "kermit.txt");
            using var cleanupAnimationScript = new AnimationScriptCleanup();
            var testAnimation = CreateAnimation(testScript, "moonwalkback");
            using var cleanupAnimation = new AnimationCleanup(testAnimation);
            AssignAnimation(testAnimation, "walkfront", true);
            Assert.Equal("walkfront", AnimationName(testAnimation));
        }
        [Fact]
        public void TestCreateAnimationFromIndexWithSoundIntegration() {
            var testScript = LoadAnimationScript("kermit", "kermit.txt");
            using var cleanupAnimationScript = new AnimationScriptCleanup();
            var testAnimation = CreateAnimation(testScript, 0, true);
            using var cleanupAnimation = new AnimationCleanup(testAnimation);
            Assert.NotNull(testAnimation);
            var animName = AnimationName(testAnimation);
            Assert.Equal("walkfront", animName);
        }
        [Fact]
        public void TestCreateAnimationIntegration() {
            var testScript = LoadAnimationScript("kermit", "kermit.txt");
            using var cleanupAnimationScript = new AnimationScriptCleanup();
            var testAnimation = CreateAnimation(testScript, "moonwalkback");
            using var cleanupAnimation = new AnimationCleanup(testAnimation);
            Assert.NotNull(testAnimation);
            var animName = AnimationName(testAnimation);
            Assert.Equal("moonwalkback", animName);
        }
        [Fact]
        public void TestCreateAnimationWithSoundIntegration() {
            var testScript = LoadAnimationScript("kermit", "kermit.txt");
            using var cleanupAnimationScript = new AnimationScriptCleanup();
            var testAnimation = CreateAnimation(testScript, "moonwalkback", true);
            using var cleanupAnimation = new AnimationCleanup(testAnimation);
            Assert.NotNull(testAnimation);
            var animName = AnimationName(testAnimation);
            Assert.Equal("moonwalkback", animName);
        }
        [Fact]
        public void TestCreateAnimationFromScriptNamedIntegration() {
            LoadAnimationScript("kermit", "kermit.txt");
            using var cleanupAnimationScript = new AnimationScriptCleanup();
            var testAnimation = CreateAnimation("kermit", "moonwalkback");
            using var cleanupAnimation = new AnimationCleanup(testAnimation);
            Assert.NotNull(testAnimation);
            var animName = AnimationName(testAnimation);
            Assert.Equal("moonwalkback", animName);
        }
        [Fact]
        public void TestCreateAnimationFromScriptNamedWithSoundIntegration() {
            LoadAnimationScript("test_script", "kermit.txt");
            using var cleanupAnimationScript = new AnimationScriptCleanup();
            var testAnimation = CreateAnimation("test_script", "moonwalkback", true);
            using var cleanupAnimation = new AnimationCleanup(testAnimation);
            Assert.NotNull(testAnimation);
            var animName = AnimationName(testAnimation);
            Assert.Equal("moonwalkback", animName);
        }
        [Fact]
        public void TestFreeAllAnimationScriptsIntegration() {
            LoadAnimationScript("free_all_kermit1", "kermit.txt");
            using var cleanupAnimationScript = new AnimationScriptCleanup();
            LoadAnimationScript("free_all_kermit2", "kermit.txt");
            Assert.True(HasAnimationScript("free_all_kermit1"));
            Assert.True(HasAnimationScript("free_all_kermit2"));
            FreeAllAnimationScripts();
            Assert.False(HasAnimationScript("free_all_kermit1"));
            Assert.False(HasAnimationScript("free_all_kermit2"));
        }
        [Fact]
        public void TestFreeAnimationIntegration() {
            var testScript = LoadAnimationScript("kermit", "kermit.txt");
            using var cleanupAnimationScript = new AnimationScriptCleanup();
            var testAnimation = CreateAnimation(testScript, "moonwalkback");
            using var cleanupAnimation = new AnimationCleanup(testAnimation);
            FreeAnimation(testAnimation);
            Assert.Equal("", AnimationName(testAnimation));
            Assert.True(AnimationEnded(testAnimation));
        }
        [Fact]
        public void TestFreeAnimationScriptIntegration() {
            var testScript = LoadAnimationScript("kermit", "kermit.txt");
            using var cleanupAnimationScript = new AnimationScriptCleanup();
            Assert.NotNull(testScript);
            FreeAnimationScript(testScript);
            var scriptExists = HasAnimationScript("has_kermit");
            Assert.False(scriptExists);
        }
        [Fact]
        public void TestFreeAnimationScriptWithNameIntegration() {
            LoadAnimationScript("free_kermit", "kermit.txt");
            using var cleanupAnimationScript = new AnimationScriptCleanup();
            Assert.True(HasAnimationScript("free_kermit"));
            FreeAnimationScript("free_kermit");
            Assert.False(HasAnimationScript("free_kermit"));
        }
        [Fact]
        public void TestHasAnimationNamedIntegration() {
            var testScript = LoadAnimationScript("kermit", "kermit.txt");
            using var cleanupAnimationScript = new AnimationScriptCleanup();
            var hasWalkfront = HasAnimationNamed(testScript, "walkfront");
            Assert.True(hasWalkfront);
            var hasNonexistent = HasAnimationNamed(testScript, "NonExistentAnimation");
            Assert.False(hasNonexistent);
        }
        [Fact]
        public void TestHasAnimationScriptIntegration() {
            var testScript = LoadAnimationScript("has_kermit", "kermit.txt");
            using var cleanupAnimationScript = new AnimationScriptCleanup();
            Assert.True(HasAnimationScript("has_kermit"));
            FreeAnimationScript(testScript);
            Assert.False(HasAnimationScript("has_kermit"));
        }
        [Fact]
        public void TestLoadAnimationScriptIntegration() {
            var testScript = LoadAnimationScript("test_animation_name", "kermit.txt");
            using var cleanupAnimationScript = new AnimationScriptCleanup();
            Assert.NotNull(testScript);
            var scriptName = AnimationScriptName(testScript);
            Assert.Equal("test_animation_name", scriptName);
            FreeAnimationScript(testScript);
            var scriptExists = HasAnimationScript("test_animation_name");
            Assert.False(scriptExists);
        }
        [Fact]
        public void TestRestartAnimationIntegration() {
            var testScript = LoadAnimationScript("kermit", "kermit.txt");
            using var cleanupAnimationScript = new AnimationScriptCleanup();
            var testAnimation = CreateAnimation(testScript, "moonwalkback");
            using var cleanupAnimation = new AnimationCleanup(testAnimation);
            for (int i = 0; i < 50; i++) {
                UpdateAnimation(testAnimation, 100.0f);
            }
            var animEnded = AnimationEnded(testAnimation);
            Assert.True(animEnded);
            RestartAnimation(testAnimation);
            var animEndedAfterRestart = AnimationEnded(testAnimation);
            Assert.False(animEndedAfterRestart);
        }
        [Fact]
        public void TestRestartAnimationWithSoundIntegration() {
            var testScript = LoadAnimationScript("kermit", "kermit.txt");
            using var cleanupAnimationScript = new AnimationScriptCleanup();
            var testAnimation = CreateAnimation(testScript, "moonwalkback", true);
            using var cleanupAnimation = new AnimationCleanup(testAnimation);
            UpdateAnimation(testAnimation);
            RestartAnimation(testAnimation, true);
            Assert.Equal(3, AnimationCurrentCell(testAnimation));
        }
        [Fact]
        public void TestUpdateAnimationPercentWithSoundIntegration() {
            var testScript = LoadAnimationScript("kermit", "kermit.txt");
            using var cleanupAnimationScript = new AnimationScriptCleanup();
            var testAnimation = CreateAnimation(testScript, "moonwalkback");
            using var cleanupAnimation = new AnimationCleanup(testAnimation);
            UpdateAnimation(testAnimation, 0.5f, true);
            Assert.True(AnimationFrameTime(testAnimation) > 0.0f);
        }
        [Fact]
        public void TestUpdateAnimationIntegration() {
            var testScript = LoadAnimationScript("kermit", "kermit.txt");
            using var cleanupAnimationScript = new AnimationScriptCleanup();
            var testAnimation = CreateAnimation(testScript, "moonwalkback");
            using var cleanupAnimation = new AnimationCleanup(testAnimation);
            UpdateAnimation(testAnimation);
            Assert.NotEqual(0, AnimationCurrentCell(testAnimation));
        }
        [Fact]
        public void TestUpdateAnimationPercentIntegration() {
            var testScript = LoadAnimationScript("kermit", "kermit.txt");
            using var cleanupAnimationScript = new AnimationScriptCleanup();
            var testAnimation = CreateAnimation(testScript, "walkfront");
            using var cleanupAnimation = new AnimationCleanup(testAnimation);
            UpdateAnimation(testAnimation, 0.5f);
            Assert.True(AnimationFrameTime(testAnimation) > 0.0f);
        }
    }
}
