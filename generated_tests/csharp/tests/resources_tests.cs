using Xunit;
using SplashKitSDK;
using static SplashKitSDK.SplashKit;
using HttpMethod = SplashKitSDK.HttpMethod;
namespace SplashKitTests
{
    public class TestResources
    {
        [Fact]
        public void TestDeregisterFreeNotifierIntegration() {
            var freeNotifier = new NotifierTracker();
            RegisterFreeNotifier(freeNotifier.OnFree);
            var testBitmap1 = CreateBitmap("test_bitmap", 100, 100);
            using var cleanupBitmap = new BitmapCleanup();
            FreeBitmap(testBitmap1);
            Assert.True(freeNotifier.WasNotified);
            DeregisterFreeNotifier(freeNotifier.OnFree);
            freeNotifier.Reset();
            var testBitmap2 = CreateBitmap("test_bitmap", 100, 100);
            FreeBitmap(testBitmap2);
            Assert.False(freeNotifier.WasNotified);
        }
        [Fact]
        public void TestPathToResourceIntegration() {
            SetResourcesPath("resources");
            var imagePath = PathToResource("test_image.png", ResourceKind.ImageResource);
            Assert.NotEqual("", imagePath);
        }
        [Fact]
        public void TestPathToResourcesIntegration() {
            var resourcePath = PathToResources();
            Assert.NotEmpty(resourcePath);
            SetResourcesPath("/new/resources");
            var newResourcePath = PathToResources();
            Assert.Equal("/new/resources", newResourcePath);
        }
        [Fact]
        public void TestPathToResourcesForKindIntegration() {
            SetResourcesPath("resources");
            var imagePath = PathToResources(ResourceKind.ImageResource);
            Assert.Equal("resources/images", imagePath);
            var soundPath = PathToResources(ResourceKind.SoundResource);
            Assert.Equal("resources/sounds", soundPath);
        }
        [Fact]
        public void TestRegisterFreeNotifierIntegration() {
            var freeNotifier = new NotifierTracker();
            RegisterFreeNotifier(freeNotifier.OnFree);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            using var cleanupBitmap = new BitmapCleanup();
            FreeBitmap(testBitmap);
            Assert.True(freeNotifier.WasNotified);
            DeregisterFreeNotifier(freeNotifier.OnFree);
        }
        [Fact]
        public void TestSetResourcesPathIntegration() {
            SetResourcesPath("/resources");
            Assert.Equal("/resources", PathToResources());
            SetResourcesPath("/new/resources");
            Assert.Equal("/new/resources", PathToResources());
        }
    }
}
