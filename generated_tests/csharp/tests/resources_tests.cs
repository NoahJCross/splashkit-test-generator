using Xunit;
using static SplashKitSDK.SplashKit;

namespace SplashKitTests
{
    public class IntegrationTests
    {
        [Fact]
        public void TestDeregisterFreeNotifierIntegration()
        {
            RegisterFreeNotifier(testNotifier);
            DeregisterFreeNotifier(testNotifier);
            Assert.Null(testNotifier);
        }
        [Fact]
        public void TestPathToResourceIntegration()
        {
            SetResourcesPath("resources");
            var imagePath = PathToResource("test_image.png", ResourceKind.ImageResource);
            Assert.NotEqual("", imagePath);
            var textPath = PathToResource("nonexistent_file.txt", ResourceKind.AnimationResource);
            Assert.Equal("", textPath);
        }
        [Fact]
        public void TestPathToResourcesIntegration()
        {
            var resourcePath = PathToResources();
            Assert.NotNull(resourcePath);
            SetResourcesPath("/new/resources");
            var newResourcePath = PathToResources();
            Assert.Equal("/new/resources", newResourcePath);
        }
        [Fact]
        public void TestPathToResourcesForKindIntegration()
        {
            SetResourcesPath("resources");
            var imagePath = PathToResources(ResourceKind.ImageResource);
            Assert.Equal("resources/images", imagePath);
            var soundPath = PathToResources(ResourceKind.SoundResource);
            Assert.Equal("resources/sounds", soundPath);
        }
        [Fact]
        public void TestRegisterFreeNotifierIntegration()
        {
            RegisterFreeNotifier(FreeNotifier());
            Assert.True(notifierCalled);
            DeregisterFreeNotifier(FreeNotifier());
            Assert.False(notifierCalled);
        }
        [Fact]
        public void TestSetResourcesPathIntegration()
        {
            SetResourcesPath("/resources");
            Assert.Equal("/resources", PathToResources());
            SetResourcesPath("/new/resources");
            Assert.Equal("/new/resources", PathToResources());
        }
    }
}
