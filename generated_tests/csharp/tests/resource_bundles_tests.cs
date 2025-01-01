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
            LoadResourceBundle("test_resource_bundle", "test.txt");
            using var cleanupResource = new ResourceCleanup("test_resource_bundle");
            Assert.True(HasResourceBundle("test_resource_bundle"));
            Assert.True(HasBitmap("FrogBmp"));
            Assert.True(HasFont("hara"));
            FreeResourceBundle("test_resource_bundle");
            Assert.False(HasResourceBundle("test_resource_bundle"));
        }
        [Fact]
        public void TestHasResourceBundleIntegration() {
            LoadResourceBundle("test_resource_bundle", "test.txt");
            using var cleanupResource = new ResourceCleanup("test_resource_bundle");
            Assert.True(HasResourceBundle("test_resource_bundle"));
            FreeResourceBundle("test_resource_bundle");
            Assert.False(HasResourceBundle("test_resource_bundle"));
            Assert.False(HasResourceBundle("nonexistent"));
        }
        [Fact]
        public void TestLoadResourceBundleIntegration() {
            LoadResourceBundle("test_resource_bundle", "test.txt");
            using var cleanupResource = new ResourceCleanup("test_resource_bundle");
            Assert.True(HasResourceBundle("test_resource_bundle"));
            Assert.True(HasAnimationScript("WalkingScript"));
            Assert.True(HasBitmap("FrogBmp"));
            Assert.True(HasFont("hara"));
            Assert.True(HasSoundEffect("error"));
            Assert.True(HasTimer("my timer"));
            Assert.True(HasResourceBundle("blah"));
            FreeResourceBundle("test_resource_bundle");
            Assert.False(HasResourceBundle("test_bundle"));
        }
    }
}
