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
            RegisterFreeNotifier(free_notifier.OnFree());
            var testBitmap1 = CreateBitmap("Test Bitmap 1", 100, 100);
            using var cleanupBitmap = new BitmapCleanup();
            FreeBitmap(testBitmap1);
            Assert.True(free_notifier.WasNotified());
            DeregisterFreeNotifier(free_notifier.OnFree());
            freeNotifier.Reset()
;            var testBitmap2 = CreateBitmap("Test Bitmap 2", 100, 100);
            FreeBitmap(testBitmap2);
            Assert.False(free_notifier.WasNotified());
        }
        [Fact]
        public void TestPathToResourceIntegration() {
            SetResourcesPath("resources");
            var imagePath = PathToResource("test_image.png", ResourceKind.ImageResource);
            Assert.Equal("resources/images/test_image.png", imagePath);
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
            Assert.Equal("resources/images/", imagePath);
            var soundPath = PathToResources(ResourceKind.SoundResource);
            Assert.Equal("resources/sounds/", soundPath);
        }
        [Fact]
        public void TestRegisterFreeNotifierIntegration() {
            var freeNotifier = new NotifierTracker();
            RegisterFreeNotifier(free_notifier.OnFree());
            var testBitmap = CreateBitmap("Test Bitmap 3", 100, 100);
            using var cleanupBitmap = new BitmapCleanup();
            FreeBitmap(testBitmap);
            Assert.True(free_notifier.WasNotified());
            DeregisterFreeNotifier(free_notifier.OnFree());
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
