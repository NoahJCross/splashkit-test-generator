using Xunit;
using static SplashKitSDK.SplashKit;

namespace SplashKitTests
{
    public class TestResources
    {
        [Fact]
        public void TestDeregisterFreeNotifierIntegration()
        {
            var freeNotifier = new NotifierTracker();
            RegisterFreeNotifier(freeNotifier.On_free);
            DeregisterFreeNotifier(freeNotifier.On_free);
            Assert.True(freeNotifier.Wasnotified);
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
            var imagePath = PathToResourcesForKind(ResourceKind.ImageResource);
            Assert.Equal("resources/images", imagePath);
            var soundPath = PathToResourcesForKind(ResourceKind.SoundResource);
            Assert.Equal("resources/sounds", soundPath);
        }
        [Fact]
        public void TestRegisterFreeNotifierIntegration()
        {
            var freeNotifier = new NotifierTracker();
            RegisterFreeNotifier(freeNotifier.On_free);
            Assert.True(freeNotifier.Wasnotified);
            DeregisterFreeNotifier(freeNotifier.On_free);
            Assert.False(freeNotifier.Wasnotified);
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
