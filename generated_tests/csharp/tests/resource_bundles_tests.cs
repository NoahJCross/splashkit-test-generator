using Xunit;
using static SplashKitSDK.SplashKit;

namespace SplashKitTests
{
    public class IntegrationTests
    {
        [Fact]
        public void TestFreeResourceBundleIntegration()
        {
            LoadResourceBundle("test", "test.txt");
            Assert.True(HasResourceBundle("test"));
            FreeResourceBundle("test");
            Assert.False(HasResourceBundle("test"));
        }
        [Fact]
        public void TestHasResourceBundleIntegration()
        {
            LoadResourceBundle("test", "test.txt");
            Assert.True(HasResourceBundle("test"));
            FreeResourceBundle("test");
            Assert.False(HasResourceBundle("test"));
            Assert.False(HasResourceBundle("nonexistent"));
        }
        [Fact]
        public void TestLoadResourceBundleIntegration()
        {
            LoadResourceBundle("test_bundle", "test_bundle.txt");
            Assert.True(HasResourceBundle("test_bundle"));
            FreeResourceBundle("test_bundle");
            Assert.False(HasResourceBundle("test_bundle"));
        }
    }
}
