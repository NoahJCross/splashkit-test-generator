using Xunit;
using SplashKitSDK;
using static SplashKitSDK.SplashKit;
using HttpMethod = SplashKitSDK.HttpMethod;
namespace SplashKitTests
{
    public class TestResourceBundles
    {
        public TestResourceBundles()
        {
            SetResourcesPath("/mnt/c/Users/Noahc/Documents/aYear_2_semester_2/TeamProject/GitHubRepo/splashkit_test_generator/resources");
        }
        [Fact]
        public void TestFreeResourceBundleIntegration() {
            LoadResourceBundle("Test Resource Bundle", "test.txt");
            using var cleanupResource = new ResourceCleanup("Test Resource Bundle");
            Assert.True(HasResourceBundle("Test Resource Bundle"));
            Assert.True(HasBitmap("FrogBmp"));
            Assert.True(HasFont("hara"));
            FreeResourceBundle("Test Resource Bundle");
            Assert.False(HasResourceBundle("Test Resource Bundle"));
        }
        [Fact]
        public void TestHasResourceBundleIntegration() {
            LoadResourceBundle("Test Resource Bundle", "test.txt");
            using var cleanupResource = new ResourceCleanup("Test Resource Bundle");
            Assert.True(HasResourceBundle("Test Resource Bundle"));
            FreeResourceBundle("Test Resource Bundle");
            Assert.False(HasResourceBundle("Test Resource Bundle"));
            Assert.False(HasResourceBundle("nonexistent"));
        }
        [Fact]
        public void TestLoadResourceBundleIntegration() {
            LoadResourceBundle("Test Resource Bundle", "test.txt");
            using var cleanupResource = new ResourceCleanup("Test Resource Bundle");
            Assert.True(HasResourceBundle("Test Resource Bundle"));
            Assert.True(HasAnimationScript("WalkingScript"));
            Assert.True(HasBitmap("FrogBmp"));
            Assert.True(HasFont("hara"));
            Assert.True(HasSoundEffect("error"));
            Assert.True(HasTimer("my timer"));
            Assert.True(HasResourceBundle("blah"));
            FreeResourceBundle("Test Resource Bundle");
            Assert.False(HasResourceBundle("test_bundle"));
        }
    }
}
