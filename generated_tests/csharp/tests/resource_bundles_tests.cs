using System;
using System.IO;
using Xunit;
using static SplashKitSDK.SplashKit;

namespace SplashKitTests
{
    public class TestResourceBundles
    {
        [Fact]
        public void TestFreeResourceBundleIntegration()
        {
            LoadResourceBundle("test", "test.txt");
            Assert.True(HasResourceBundle("test"));
            Assert.True(HasBitmap("FrogBmp"));
            Assert.True(HasFont("hara"));
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
            LoadResourceBundle("test", "test.txt");
            Assert.True(HasResourceBundle("test"));
            Assert.True(HasAnimationScript("WalkingScript"));
            Assert.True(HasBitmap("FrogBmp"));
            Assert.True(HasFont("hara"));
            Assert.True(HasSoundEffect("error"));
            Assert.True(HasTimer("my timer"));
            Assert.True(HasResourceBundle("blah"));
            FreeResourceBundle("test");
            Assert.False(HasResourceBundle("test_bundle"));
        }
    }
}
