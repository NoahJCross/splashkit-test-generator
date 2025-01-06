using Xunit;
using SplashKitSDK;
using static SplashKitSDK.SplashKit;
using HttpMethod = SplashKitSDK.HttpMethod;
namespace SplashKitTests
{
    public class TestSprites
    {
        public TestSprites()
        {
            SetResourcesPath("/mnt/c/Users/Noahc/Documents/aYear_2_semester_2/TeamProject/GitHubRepo/splashkit_test_generator/resources");
        }
        [Fact]
        public void TestCallForAllSpritesWithValueIntegration() {
            var testSpriteDelegates = new SpriteDelegates();
            var testBitmap = CreateBitmap("Test Bitmap 1", 100, 100);
            using var cleanupBitmap = new BitmapCleanup();
            CreateSprite(testBitmap);
            using var cleanupSprite = new SpriteCleanup();
            CreateSprite(testBitmap);
            CallForAllSprites(test_sprite_delegates.SpriteFloatFunction(), 300.0f);
            Assert.Equal(2, test_sprite_delegates.FloatFunctionCallCount());
            Assert.True(test_sprite_delegates.EventCalled());
        }
        [Fact]
        public void TestCallForAllSpritesIntegration() {
            var testSpriteDelegates = new SpriteDelegates();
            var testBitmap = CreateBitmap("Test Bitmap 2", 100, 100);
            using var cleanupBitmap = new BitmapCleanup();
            CreateSprite(testBitmap);
            using var cleanupSprite = new SpriteCleanup();
            CreateSprite(testBitmap);
            CallForAllSprites(test_sprite_delegates.SpriteFunction());
            Assert.Equal(2, test_sprite_delegates.FunctionCallCount());
            Assert.True(test_sprite_delegates.EventCalled());
        }
        [Fact]
        public void TestCallOnSpriteEventIntegration() {
            var testSpriteDelegates = new SpriteDelegates();
            var testBitmap = CreateBitmap("Test Bitmap 34", 100, 100);
            using var cleanupBitmap = new BitmapCleanup();
            var testAnimation = LoadAnimationScript("Test Script 6", "kermit.txt");
            using var cleanupAnimationScript = new AnimationScriptCleanup();
            var testSprite = CreateSprite(testBitmap, testAnimation);
            using var cleanupSprite = new SpriteCleanup();
            CallOnSpriteEvent(test_sprite_delegates.SpriteEventHandler());
            UpdateSprite(testSprite);
            StopCallingOnSpriteEvent(test_sprite_delegates.SpriteEventHandler());
            Assert.True(test_sprite_delegates.EventCalled());
        }
        [Fact]
        public void TestCenterPointOfSpriteIntegration() {
            var testBitmap = CreateBitmap("Test Bitmap 3", 100, 100);
            using var cleanupBitmap = new BitmapCleanup();
            var testSprite = CreateSprite(testBitmap);
            using var cleanupSprite = new SpriteCleanup();
            SpriteSetPosition(testSprite, PointAt(100.0, 100.0));
            var testCenterPoint = CenterPoint(testSprite);
            Assert.Equal(150.0, testCenterPoint.X);
            Assert.Equal(150.0, testCenterPoint.Y);
        }
        [Fact]
        public void TestCreateSpriteIntegration() {
            var testBitmap = CreateBitmap("Test Bitmap 4", 100, 100);
            using var cleanupBitmap = new BitmapCleanup();
            var testSprite = CreateSprite(testBitmap);
            using var cleanupSprite = new SpriteCleanup();
            Assert.NotNull(testSprite);
            Assert.True(HasSprite(SpriteName(testSprite)));
        }
        [Fact]
        public void TestCreateSpriteWithAnimationIntegration() {
            var testBitmap = CreateBitmap("Test Bitmap 5", 100, 100);
            using var cleanupBitmap = new BitmapCleanup();
            var testAnimation = LoadAnimationScript("Test Script 1", "kermit.txt");
            using var cleanupAnimationScript = new AnimationScriptCleanup();
            var testSprite = CreateSprite(testBitmap, testAnimation);
            using var cleanupSprite = new SpriteCleanup();
            Assert.NotNull(testSprite);
            Assert.True(HasSprite(SpriteName(testSprite)));
        }
        [Fact]
        public void TestCreateSpriteWithBitmapNamedIntegration() {
            CreateBitmap("Test Bitmap 6", 100, 100);
            using var cleanupBitmap = new BitmapCleanup();
            var testSprite = CreateSprite("Test Bitmap 6");
            using var cleanupSprite = new SpriteCleanup();
            Assert.NotNull(testSprite);
            Assert.True(HasSprite(SpriteName(testSprite)));
        }
        [Fact]
        public void TestCreateSpriteNamedIntegration() {
            var testBitmap = CreateBitmap("Test Bitmap 7", 100, 100);
            using var cleanupBitmap = new BitmapCleanup();
            var testSprite = CreateSprite("Test Sprite 1", testBitmap);
            using var cleanupSprite = new SpriteCleanup();
            Assert.NotNull(testSprite);
            Assert.Equal("Test Sprite 1", SpriteName(testSprite));
        }
        [Fact]
        public void TestCreateSpriteNamedWithAnimationIntegration() {
            var testBitmap = CreateBitmap("Test Bitmap 8", 100, 100);
            using var cleanupBitmap = new BitmapCleanup();
            var testAnimation = LoadAnimationScript("Test Script 2", "kermit.txt");
            using var cleanupAnimationScript = new AnimationScriptCleanup();
            var testSprite = CreateSprite("Test Sprite 2", testBitmap, testAnimation);
            using var cleanupSprite = new SpriteCleanup();
            Assert.NotNull(testSprite);
            Assert.Equal("Test Sprite 2", SpriteName(testSprite));
        }
        [Fact]
        public void TestCreateSpriteWithBitmapAndAnimationNamedIntegration() {
            CreateBitmap("Test Bitmap 9", 100, 100);
            using var cleanupBitmap = new BitmapCleanup();
            LoadAnimationScript("Test Script 3", "kermit.txt");
            using var cleanupAnimationScript = new AnimationScriptCleanup();
            var testSprite = CreateSprite("Test Bitmap 9", "test_animation");
            using var cleanupSprite = new SpriteCleanup();
            Assert.NotNull(testSprite);
            Assert.True(HasSprite(SpriteName(testSprite)));
        }
        [Fact]
        public void TestCreateSpritePackIntegration() {
            Assert.False(HasSpritePack("Test Sprite Pack 1"));
            CreateSpritePack("Test Sprite Pack 1");
            using var cleanupSpritePack = new SpritePackCleanup("Test Sprite Pack 1");
            Assert.True(HasSpritePack("Test Sprite Pack 1"));
        }
        [Fact]
        public void TestCurrentSpritePackIntegration() {
            Assert.Equal("default", CurrentSpritePack());
            CreateSpritePack("Test Sprite Pack 2");
            using var cleanupSpritePack = new SpritePackCleanup("Test Sprite Pack 2");
            SelectSpritePack("Test Sprite Pack 2");
            Assert.Equal("Test Sprite Pack 2", CurrentSpritePack());
        }
        [Fact]
        public void TestDrawAllSpritesIntegration() {
            var testWindow = OpenWindow("Test Window 1", 800, 600);
            using var cleanupWindow = new WindowCleanup();
            var testBitmap = CreateBitmap("Test Bitmap 10", 100, 100);
            using var cleanupBitmap = new BitmapCleanup();
            ClearBitmap(testBitmap, ColorBlack());
            var testSprite1 = CreateSprite(testBitmap);
            using var cleanupSprite = new SpriteCleanup();
            var testSprite2 = CreateSprite(testBitmap);
            SpriteSetPosition(testSprite1, PointAt(100.0, 100.0));
            SpriteSetPosition(testSprite2, PointAt(200.0, 200.0));
            ClearScreen(ColorWhite());
            DrawAllSprites();
            RefreshScreen();
            Assert.Equal(ColorBlack(), GetPixel(testWindow, 100.0, 100.0));
            Assert.Equal(ColorBlack(), GetPixel(testWindow, 200.0, 200.0));
        }
        [Fact]
        public void TestDrawSpriteOffsetByIntegration() {
            var testWindow = OpenWindow("Test Window 3", 800, 600);
            using var cleanupWindow = new WindowCleanup();
            var testBitmap = CreateBitmap("Test Bitmap 12", 100, 100);
            using var cleanupBitmap = new BitmapCleanup();
            ClearBitmap(testBitmap, ColorBlack());
            var testSprite = CreateSprite(testBitmap);
            using var cleanupSprite = new SpriteCleanup();
            SpriteSetPosition(testSprite, PointAt(400.0, 300.0));
            ClearScreen(ColorWhite());
            DrawSprite(testSprite, VectorFromAngle(50.0, 50.0));
            RefreshScreen();
            Assert.NotEqual(ColorWhite(), GetPixel(testWindow, 450.0, 350.0));
        }
        [Fact]
        public void TestDrawSpriteIntegration() {
            var testWindow = OpenWindow("Test Window 4", 800, 600);
            using var cleanupWindow = new WindowCleanup();
            var testBitmap = CreateBitmap("Test Bitmap 13", 100, 100);
            using var cleanupBitmap = new BitmapCleanup();
            ClearBitmap(testBitmap, ColorBlack());
            var testSprite = CreateSprite(testBitmap);
            using var cleanupSprite = new SpriteCleanup();
            SpriteSetPosition(testSprite, PointAt(400.0, 300.0));
            ClearScreen(ColorWhite());
            DrawSprite(testSprite);
            RefreshScreen();
            Assert.Equal(ColorBlack(), GetPixel(testWindow, 400.0, 300.0));
        }
        [Fact]
        public void TestDrawSpriteOffsetXYIntegration() {
            var testWindow = OpenWindow("Test Window 2", 800, 600);
            using var cleanupWindow = new WindowCleanup();
            var testBitmap = CreateBitmap("Test Bitmap 11", 100, 100);
            using var cleanupBitmap = new BitmapCleanup();
            ClearBitmap(testBitmap, ColorBlack());
            var testSprite = CreateSprite(testBitmap);
            using var cleanupSprite = new SpriteCleanup();
            SpriteSetPosition(testSprite, PointAt(400.0, 300.0));
            ClearScreen(ColorWhite());
            DrawSprite(testSprite, 50.0, 50.0);
            RefreshScreen();
            Assert.NotEqual(ColorWhite(), GetPixel(testWindow, 450.0, 350.0));
        }
        [Fact]
        public void TestFreeAllSpritesIntegration() {
            var testBitmap = CreateBitmap("Test Bitmap 14", 100, 100);
            using var cleanupBitmap = new BitmapCleanup();
            CreateSprite("Test Sprite 3", testBitmap);
            using var cleanupSprite = new SpriteCleanup();
            CreateSprite("Test Sprite 4", testBitmap);
            Assert.True(HasSprite("Test Sprite 3"));
            Assert.True(HasSprite("Test Sprite 4"));
            FreeAllSprites();
            Assert.False(HasSprite("Test Sprite 3"));
            Assert.False(HasSprite("Test Sprite 4"));
        }
        [Fact]
        public void TestFreeSpriteIntegration() {
            var testBitmap = CreateBitmap("Test Bitmap 15", 100, 100);
            using var cleanupBitmap = new BitmapCleanup();
            var testSprite = CreateSprite("Test Sprite 5", testBitmap);
            using var cleanupSprite = new SpriteCleanup();
            Assert.True(HasSprite("Test Sprite 5"));
            FreeSprite(testSprite);
            Assert.False(HasSprite("Test Sprite 5"));
        }
        [Fact]
        public void TestFreeSpritePackIntegration() {
            Assert.Equal("default", CurrentSpritePack());
            CreateSpritePack("Test Sprite Pack 3");
            using var cleanupSpritePack = new SpritePackCleanup("Test Sprite Pack 3");
            SelectSpritePack("Test Sprite Pack 3");
            Assert.True(HasSpritePack("Test Sprite Pack 3"));
            Assert.Equal("Test Sprite Pack 3", CurrentSpritePack());
            FreeSpritePack("Test Sprite Pack 3");
            Assert.False(HasSpritePack("Test Sprite Pack 3"));
            Assert.Equal("default", CurrentSpritePack());
        }
        [Fact]
        public void TestHasSpriteIntegration() {
            var testBitmap = CreateBitmap("Test Bitmap 16", 100, 100);
            using var cleanupBitmap = new BitmapCleanup();
            Assert.False(HasSprite("Test Sprite 6"));
            var testSprite = CreateSprite("Test Sprite 6", testBitmap);
            using var cleanupSprite = new SpriteCleanup();
            Assert.True(HasSprite("Test Sprite 6"));
            FreeSprite(testSprite);
            Assert.False(HasSprite("Test Sprite 6"));
        }
        [Fact]
        public void TestHasSpritePackIntegration() {
            Assert.False(HasSpritePack("Test Sprite Pack 4"));
            CreateSpritePack("Test Sprite Pack 4");
            using var cleanupSpritePack = new SpritePackCleanup("Test Sprite Pack 4");
            Assert.True(HasSpritePack("Test Sprite Pack 4"));
            FreeSpritePack("Test Sprite Pack 4");
            Assert.False(HasSpritePack("Test Sprite Pack 4"));
        }
        [Fact]
        public void TestMoveSpriteIntegration() {
            var testBitmap = CreateBitmap("Test Bitmap 17", 100, 100);
            using var cleanupBitmap = new BitmapCleanup();
            var testSprite = CreateSprite(testBitmap);
            using var cleanupSprite = new SpriteCleanup();
            var startPosition = PointAt(100.0, 100.0);
            SpriteSetPosition(testSprite, startPosition);
            SpriteSetVelocity(testSprite, VectorTo(10.0, 10.0));
            MoveSprite(testSprite);
            Assert.Equal(110.0f, SpriteX(testSprite));
            Assert.Equal(110.0f, SpriteY(testSprite));
        }
        [Fact]
        public void TestMoveSpriteByVectorIntegration() {
            var testBitmap = CreateBitmap("Test Bitmap 18", 100, 100);
            using var cleanupBitmap = new BitmapCleanup();
            var testSprite = CreateSprite(testBitmap);
            using var cleanupSprite = new SpriteCleanup();
            SpriteSetPosition(testSprite, PointAt(100.0, 100.0));
            MoveSprite(testSprite, VectorTo(50.0, 50.0));
            Assert.Equal(150.0f, SpriteX(testSprite));
            Assert.Equal(150.0f, SpriteY(testSprite));
        }
        [Fact]
        public void TestMoveSpriteByVectorPercentIntegration() {
            var testBitmap = CreateBitmap("Test Bitmap 19", 100, 100);
            using var cleanupBitmap = new BitmapCleanup();
            var testSprite = CreateSprite(testBitmap);
            using var cleanupSprite = new SpriteCleanup();
            SpriteSetPosition(testSprite, PointAt(100.0, 100.0));
            MoveSprite(testSprite, VectorTo(50.0, 50.0), 0.5f);
            Assert.Equal(125.0f, SpriteX(testSprite));
            Assert.Equal(125.0f, SpriteY(testSprite));
        }
        [Fact]
        public void TestMoveSpritePercentIntegration() {
            var testBitmap = CreateBitmap("Test Bitmap 20", 100, 100);
            using var cleanupBitmap = new BitmapCleanup();
            var testSprite = CreateSprite(testBitmap);
            using var cleanupSprite = new SpriteCleanup();
            SpriteSetPosition(testSprite, PointAt(100.0, 100.0));
            SpriteSetVelocity(testSprite, VectorTo(10.0, 10.0));
            MoveSprite(testSprite, 0.5f);
            Assert.Equal(105.0f, SpriteX(testSprite));
            Assert.Equal(105.0f, SpriteY(testSprite));
        }
        [Fact]
        public void TestMoveSpriteToIntegration() {
            var testBitmap = CreateBitmap("Test Bitmap 21", 100, 100);
            using var cleanupBitmap = new BitmapCleanup();
            var testSprite = CreateSprite(testBitmap);
            using var cleanupSprite = new SpriteCleanup();
            MoveSpriteTo(testSprite, 400.0, 300.0);
            Assert.Equal(400.0f, SpriteX(testSprite));
            Assert.Equal(300.0f, SpriteY(testSprite));
        }
        [Fact]
        public void TestSelectSpritePackIntegration() {
            CreateSpritePack("Test Sprite Pack 5");
            using var cleanupSpritePack = new SpritePackCleanup("Test Sprite Pack 5");
            Assert.Equal("default", CurrentSpritePack());
            SelectSpritePack("Test Sprite Pack 5");
            Assert.Equal("Test Sprite Pack 5", CurrentSpritePack());
        }
        [Fact]
        public void TestSpriteAddLayerIntegration() {
            var testBitmap = CreateBitmap("Test Bitmap 22", 100, 100);
            using var cleanupBitmap = new BitmapCleanup();
            var testSprite = CreateSprite(testBitmap);
            using var cleanupSprite = new SpriteCleanup();
            var newLayerBitmap = CreateBitmap("Test Bitmap 23", 50, 50);
            var layerIndex = SpriteAddLayer(testSprite, newLayerBitmap, "Test Bitmap 23");
            Assert.Equal(1, layerIndex);
            Assert.Equal(2, SpriteLayerCount(testSprite));
        }
        [Fact]
        public void TestSpriteAddToVelocityIntegration() {
            var testBitmap = CreateBitmap("Test Bitmap 24", 100, 100);
            using var cleanupBitmap = new BitmapCleanup();
            var testSprite = CreateSprite(testBitmap);
            using var cleanupSprite = new SpriteCleanup();
            SpriteSetVelocity(testSprite, VectorTo(0.0, 0.0));
            SpriteAddToVelocity(testSprite, VectorTo(10.0, 10.0));
            var velocity = SpriteVelocity(testSprite);
            Assert.Equal(10.0, velocity.X);
            Assert.Equal(10.0, velocity.Y);
        }
        [Fact]
        public void TestSpriteAddValueIntegration() {
            var testBitmap = CreateBitmap("Test Bitmap 25", 100, 100);
            using var cleanupBitmap = new BitmapCleanup();
            var testSprite = CreateSprite(testBitmap);
            using var cleanupSprite = new SpriteCleanup();
            SpriteAddValue(testSprite, "health", 100.0f);
            Assert.True(SpriteHasValue(testSprite, "health"));
            Assert.Equal(100.0f, SpriteValue(testSprite, "health"));
        }
        [Fact]
        public void TestSpriteAddValueWithDefaultIntegration() {
            var testBitmap = CreateBitmap("Test Bitmap 26", 100, 100);
            using var cleanupBitmap = new BitmapCleanup();
            var testSprite = CreateSprite(testBitmap);
            using var cleanupSprite = new SpriteCleanup();
            SpriteAddValue(testSprite, "health", 100.0f);
            Assert.True(SpriteHasValue(testSprite, "health"));
            Assert.Equal(100.0f, SpriteValue(testSprite, "health"));
        }
        [Fact]
        public void TestSpriteAnchorPointIntegration() {
            var testBitmap = CreateBitmap("Test Bitmap 27", 100, 100);
            using var cleanupBitmap = new BitmapCleanup();
            var testSprite = CreateSprite(testBitmap);
            using var cleanupSprite = new SpriteCleanup();
            var anchorPoint = SpriteAnchorPoint(testSprite);
            Assert.Equal(50.0, anchorPoint.X);
            Assert.Equal(50.0, anchorPoint.Y);
        }
        [Fact]
        public void TestSpriteAnchorPositionIntegration() {
            var testBitmap = CreateBitmap("Test Bitmap 28", 100, 100);
            using var cleanupBitmap = new BitmapCleanup();
            var testSprite = CreateSprite(testBitmap);
            using var cleanupSprite = new SpriteCleanup();
            SpriteSetPosition(testSprite, PointAt(100.0, 100.0));
            var anchorPosition = SpriteAnchorPosition(testSprite);
            Assert.Equal(150.0, anchorPosition.X);
            Assert.Equal(150.0, anchorPosition.Y);
        }
        [Fact]
        public void TestSpriteAnimationHasEndedIntegration() {
            var testBitmap = CreateBitmap("Test Bitmap 29", 100, 100);
            using var cleanupBitmap = new BitmapCleanup();
            var testAnimation = LoadAnimationScript("Test Script 4", "kermit.txt");
            using var cleanupAnimationScript = new AnimationScriptCleanup();
            var testSprite = CreateSprite(testBitmap, testAnimation);
            using var cleanupSprite = new SpriteCleanup();
            SpriteStartAnimation(testSprite, "walkfront");
            Assert.False(SpriteAnimationHasEnded(testSprite));
            for (int i = 0; i < 5; i++) {
                UpdateSpriteAnimation(testSprite, 100.0f);
            }
            Assert.True(SpriteAnimationHasEnded(testSprite));
        }
        [Fact]
        public void TestSpriteAnimationNameIntegration() {
            var testBitmap = CreateBitmap("Test Bitmap 30", 100, 100);
            using var cleanupBitmap = new BitmapCleanup();
            var testAnimation = LoadAnimationScript("Test Script 5", "kermit.txt");
            using var cleanupAnimationScript = new AnimationScriptCleanup();
            var testSprite = CreateSprite(testBitmap, testAnimation);
            using var cleanupSprite = new SpriteCleanup();
            SpriteStartAnimation(testSprite, "walkfront");
            Assert.Equal("walkfront", SpriteAnimationName(testSprite));
        }
        [Fact]
        public void TestSpriteAtIntegration() {
            var testBitmap = CreateBitmap("Test Bitmap 31", 100, 100);
            using var cleanupBitmap = new BitmapCleanup();
            ClearBitmap(testBitmap, ColorRed());
            SetupCollisionMask(testBitmap);
            var testSprite = CreateSprite(testBitmap);
            using var cleanupSprite = new SpriteCleanup();
            SpriteSetX(testSprite, 400.0f);
            SpriteSetY(testSprite, 300.0f);
            Assert.True(SpriteAt(testSprite, PointAt(451.0, 350.0)));
            Assert.False(SpriteAt(testSprite, PointAt(600.0, 500.0)));
        }
        [Fact]
        public void TestSpriteBringLayerForwardIntegration() {
            var testBitmap = CreateBitmap("Test Bitmap 33", 100, 100);
            using var cleanupBitmap = new BitmapCleanup();
            var testSprite = CreateSprite(testBitmap);
            using var cleanupSprite = new SpriteCleanup();
            var layerIndex = SpriteAddLayer(testSprite, testBitmap, "layer2");
            SpriteShowLayer(testSprite, layerIndex);
            var visibleIndex = SpriteVisibleIndexOfLayer(testSprite, layerIndex);
            SpriteBringLayerForward(testSprite, visibleIndex);
            Assert.Equal(0, SpriteVisibleIndexOfLayer(testSprite, layerIndex));
        }
        [Fact]
        public void TestSpriteBringLayerToFrontIntegration() {
            var testBitmap = CreateBitmap("Test Bitmap 32", 100, 100);
            using var cleanupBitmap = new BitmapCleanup();
            var testSprite = CreateSprite(testBitmap);
            using var cleanupSprite = new SpriteCleanup();
            var layerIndex = SpriteAddLayer(testSprite, testBitmap, "layer2");
            SpriteShowLayer(testSprite, layerIndex);
            var visibleIndex = SpriteVisibleIndexOfLayer(testSprite, layerIndex);
            SpriteBringLayerToFront(testSprite, visibleIndex);
            Assert.Equal(0, SpriteVisibleIndexOfLayer(testSprite, "layer2"));
        }
        [Fact]
        public void TestSpriteCallOnEventIntegration() {
            var testSpriteDelegates = new SpriteDelegates();
            var testBitmap = CreateBitmap("Test Bitmap 35", 100, 100);
            using var cleanupBitmap = new BitmapCleanup();
            var testSprite = CreateSprite(testBitmap);
            using var cleanupSprite = new SpriteCleanup();
            SpriteCallOnEvent(testSprite, test_sprite_delegates.SpriteEventHandler());
            UpdateSprite(testSprite);
            StopCallingOnSpriteEvent(test_sprite_delegates.SpriteEventHandler());
            Assert.True(test_sprite_delegates.EventCalled());
        }
        [Fact]
        public void TestSpriteCircleIntegration() {
            var testBitmap = CreateBitmap("Test Bitmap 36", 100, 100);
            using var cleanupBitmap = new BitmapCleanup();
            var testSprite = CreateSprite(testBitmap);
            using var cleanupSprite = new SpriteCleanup();
            var circle = SpriteCircle(testSprite);
            Assert.Equal(50.0, circle.Center.X);
            Assert.Equal(50.0, circle.Center.Y);
            Assert.Equal(50.0, circle.Radius);
        }
        [Fact]
        public void TestSpriteCollisionBitmapIntegration() {
            var testBitmap = CreateBitmap("Test Bitmap 37", 100, 100);
            using var cleanupBitmap = new BitmapCleanup();
            var testSprite = CreateSprite(testBitmap);
            using var cleanupSprite = new SpriteCleanup();
            var collisionBitmap = SpriteCollisionBitmap(testSprite);
            Assert.Equal(testBitmap, collisionBitmap);
        }
        [Fact]
        public void TestSpriteCollisionCircleIntegration() {
            var testBitmap = CreateBitmap("Test Bitmap 38", 100, 100);
            using var cleanupBitmap = new BitmapCleanup();
            var testSprite = CreateSprite(testBitmap);
            using var cleanupSprite = new SpriteCleanup();
            var circle = SpriteCollisionCircle(testSprite);
            Assert.Equal(50.0, circle.Center.X);
            Assert.Equal(50.0, circle.Center.Y);
            Assert.Equal(50.0, circle.Radius);
        }
        [Fact]
        public void TestSpriteCollisionKindIntegration() {
            var testBitmap = CreateBitmap("Test Bitmap 39", 100, 100);
            using var cleanupBitmap = new BitmapCleanup();
            var testSprite = CreateSprite(testBitmap);
            using var cleanupSprite = new SpriteCleanup();
            Assert.Equal(CollisionTestKind.PixelCollisions, SpriteCollisionKind(testSprite));
            SpriteSetCollisionKind(testSprite, CollisionTestKind.AabbCollisions);
            Assert.Equal(CollisionTestKind.AabbCollisions, SpriteCollisionKind(testSprite));
        }
        [Fact]
        public void TestSpriteCollisionRectangleIntegration() {
            var testBitmap = CreateBitmap("Test Bitmap 40", 100, 100);
            using var cleanupBitmap = new BitmapCleanup();
            var testSprite = CreateSprite(testBitmap);
            using var cleanupSprite = new SpriteCleanup();
            var rect = SpriteCollisionRectangle(testSprite);
            Assert.Equal(0.0, rect.X);
            Assert.Equal(0.0, rect.Y);
            Assert.Equal(100.0, rect.Width);
            Assert.Equal(100.0, rect.Height);
        }
        [Fact]
        public void TestSpriteCurrentCellIntegration() {
            var testBitmap = CreateBitmap("Test Bitmap 41", 100, 100);
            using var cleanupBitmap = new BitmapCleanup();
            var testAnimation = LoadAnimationScript("Test Script 7", "kermit.txt");
            using var cleanupAnimationScript = new AnimationScriptCleanup();
            var testSprite = CreateSprite(testBitmap, testAnimation);
            using var cleanupSprite = new SpriteCleanup();
            SpriteStartAnimation(testSprite, "walkfront");
            Assert.Equal(0, SpriteCurrentCell(testSprite));
            UpdateSprite(testSprite, 100.0f);
            Assert.Equal(1, SpriteCurrentCell(testSprite));
        }
        [Fact]
        public void TestSpriteCurrentCellRectangleIntegration() {
            var testBitmap = CreateBitmap("Test Bitmap 42", 100, 100);
            using var cleanupBitmap = new BitmapCleanup();
            var testSprite = CreateSprite(testBitmap);
            using var cleanupSprite = new SpriteCleanup();
            var rect = SpriteCurrentCellRectangle(testSprite);
            Assert.Equal(0.0, rect.X);
            Assert.Equal(0.0, rect.Y);
            Assert.Equal(100.0, rect.Width);
            Assert.Equal(100.0, rect.Height);
        }
        [Fact]
        public void TestSpriteDxIntegration() {
            var testBitmap = CreateBitmap("Test Bitmap 43", 100, 100);
            using var cleanupBitmap = new BitmapCleanup();
            var testSprite = CreateSprite(testBitmap);
            using var cleanupSprite = new SpriteCleanup();
            Assert.Equal(0.0, SpriteDx(testSprite));
            SpriteSetDx(testSprite, 5.0f);
            Assert.Equal(5.0, SpriteDx(testSprite));
        }
        [Fact]
        public void TestSpriteDyIntegration() {
            var testBitmap = CreateBitmap("Test Bitmap 44", 100, 100);
            using var cleanupBitmap = new BitmapCleanup();
            var testSprite = CreateSprite(testBitmap);
            using var cleanupSprite = new SpriteCleanup();
            Assert.Equal(0.0, SpriteDy(testSprite));
            SpriteSetDy(testSprite, 5.0f);
            Assert.Equal(5.0, SpriteDy(testSprite));
        }
        [Fact]
        public void TestSpriteHasValueIntegration() {
            var testBitmap = CreateBitmap("Test Bitmap 45", 100, 100);
            using var cleanupBitmap = new BitmapCleanup();
            var testSprite = CreateSprite(testBitmap);
            using var cleanupSprite = new SpriteCleanup();
            Assert.False(SpriteHasValue(testSprite, "health"));
            SpriteAddValue(testSprite, "health", 100.0f);
            Assert.True(SpriteHasValue(testSprite, "health"));
            Assert.False(SpriteHasValue(testSprite, "mana"));
        }
        [Fact]
        public void TestSpriteHeadingIntegration() {
            var testBitmap = CreateBitmap("Test Bitmap 46", 100, 100);
            using var cleanupBitmap = new BitmapCleanup();
            var testSprite = CreateSprite(testBitmap);
            using var cleanupSprite = new SpriteCleanup();
            Assert.Equal(90.0, SpriteHeading(testSprite));
            SpriteSetVelocity(testSprite, VectorTo(1.0, 1.0));
            Assert.Equal(45.0, SpriteHeading(testSprite));
        }
        [Fact]
        public void TestSpriteHeightIntegration() {
            var testBitmap = CreateBitmap("Test Bitmap 47", 100, 100);
            using var cleanupBitmap = new BitmapCleanup();
            var testSprite = CreateSprite(testBitmap);
            using var cleanupSprite = new SpriteCleanup();
            Assert.Equal(100, SpriteHeight(testSprite));
        }
        [Fact]
        public void TestSpriteHideLayerNamedIntegration() {
            var testBitmap = CreateBitmap("Test Bitmap 48", 100, 100);
            using var cleanupBitmap = new BitmapCleanup();
            var testSprite = CreateSprite(testBitmap);
            using var cleanupSprite = new SpriteCleanup();
            SpriteAddLayer(testSprite, testBitmap, "layer2");
            SpriteShowLayer(testSprite, "layer2");
            Assert.Equal(2, SpriteVisibleLayerCount(testSprite));
            SpriteHideLayer(testSprite, "layer2");
            Assert.Equal(1, SpriteVisibleLayerCount(testSprite));
        }
        [Fact]
        public void TestSpriteHideLayerIntegration() {
            var testBitmap = CreateBitmap("Test Bitmap 49", 100, 100);
            using var cleanupBitmap = new BitmapCleanup();
            var testSprite = CreateSprite(testBitmap);
            using var cleanupSprite = new SpriteCleanup();
            var layerIdx = SpriteAddLayer(testSprite, testBitmap, "layer2");
            SpriteShowLayer(testSprite, layerIdx);
            Assert.Equal(2, SpriteVisibleLayerCount(testSprite));
            SpriteHideLayer(testSprite, layerIdx);
            Assert.Equal(1, SpriteVisibleLayerCount(testSprite));
        }
        [Fact]
        public void TestSpriteLayerNamedIntegration() {
            var testBitmap = CreateBitmap("Test Bitmap 50", 100, 100);
            using var cleanupBitmap = new BitmapCleanup();
            var testSprite = CreateSprite(testBitmap);
            using var cleanupSprite = new SpriteCleanup();
            SpriteAddLayer(testSprite, testBitmap, "layer2");
            Assert.Equal(testBitmap, SpriteLayer(testSprite, "layer2"));
        }
        [Fact]
        public void TestSpriteLayerAtIndexIntegration() {
            var testBitmap = CreateBitmap("Test Bitmap 51", 100, 100);
            using var cleanupBitmap = new BitmapCleanup();
            var testSprite = CreateSprite(testBitmap);
            using var cleanupSprite = new SpriteCleanup();
            var layerIdx = SpriteAddLayer(testSprite, testBitmap, "layer2");
            Assert.Equal(testBitmap, SpriteLayer(testSprite, layerIdx));
        }
        [Fact]
        public void TestSpriteLayerCircleNamedIntegration() {
            var testBitmap = CreateBitmap("Test Bitmap 52", 100, 100);
            using var cleanupBitmap = new BitmapCleanup();
            var testSprite = CreateSprite(testBitmap);
            using var cleanupSprite = new SpriteCleanup();
            var circle = SpriteLayerCircle(testSprite, "base_layer");
            Assert.Equal(50.0, circle.Center.X);
            Assert.Equal(50.0, circle.Center.Y);
            Assert.Equal(50.0, circle.Radius);
        }
        [Fact]
        public void TestSpriteLayerCircleAtIndexIntegration() {
            var testBitmap = CreateBitmap("Test Bitmap 53", 100, 100);
            using var cleanupBitmap = new BitmapCleanup();
            var testSprite = CreateSprite(testBitmap);
            using var cleanupSprite = new SpriteCleanup();
            var circle = SpriteLayerCircle(testSprite, 0);
            Assert.Equal(50.0, circle.Center.X);
            Assert.Equal(50.0, circle.Center.Y);
            Assert.Equal(50.0, circle.Radius);
        }
        [Fact]
        public void TestSpriteLayerCountIntegration() {
            var testBitmap = CreateBitmap("Test Bitmap 54", 100, 100);
            using var cleanupBitmap = new BitmapCleanup();
            var testSprite = CreateSprite(testBitmap);
            using var cleanupSprite = new SpriteCleanup();
            Assert.Equal(1, SpriteLayerCount(testSprite));
            var layerIdx = SpriteAddLayer(testSprite, testBitmap, "layer2");
            Assert.Equal(2, SpriteLayerCount(testSprite));
            Assert.Equal(1, layerIdx);
        }
        [Fact]
        public void TestSpriteLayerHeightNamedIntegration() {
            var testBitmap = CreateBitmap("Test Bitmap 55", 100, 100);
            using var cleanupBitmap = new BitmapCleanup();
            var testSprite = CreateSprite(testBitmap);
            using var cleanupSprite = new SpriteCleanup();
            Assert.Equal(100, SpriteLayerHeight(testSprite, "base_layer"));
            SpriteAddLayer(testSprite, testBitmap, "layer2");
            Assert.Equal(100, SpriteLayerHeight(testSprite, "layer2"));
        }
        [Fact]
        public void TestSpriteLayerHeightIntegration() {
            var testBitmap = CreateBitmap("Test Bitmap 56", 100, 100);
            using var cleanupBitmap = new BitmapCleanup();
            var testSprite = CreateSprite(testBitmap);
            using var cleanupSprite = new SpriteCleanup();
            Assert.Equal(100, SpriteLayerHeight(testSprite, 0));
            var layerIdx = SpriteAddLayer(testSprite, testBitmap, "layer2");
            Assert.Equal(100, SpriteLayerHeight(testSprite, layerIdx));
        }
        [Fact]
        public void TestSpriteLayerIndexIntegration() {
            var testBitmap = CreateBitmap("Test Bitmap 57", 100, 100);
            using var cleanupBitmap = new BitmapCleanup();
            var testSprite = CreateSprite(testBitmap);
            using var cleanupSprite = new SpriteCleanup();
            Assert.Equal(0, SpriteLayerIndex(testSprite, "base_layer"));
            var layerIdx = SpriteAddLayer(testSprite, testBitmap, "layer2");
            Assert.Equal(layerIdx, SpriteLayerIndex(testSprite, "layer2"));
        }
        [Fact]
        public void TestSpriteLayerNameIntegration() {
            var testBitmap = CreateBitmap("Test Bitmap 58", 100, 100);
            using var cleanupBitmap = new BitmapCleanup();
            var testSprite = CreateSprite(testBitmap);
            using var cleanupSprite = new SpriteCleanup();
            var layerIdx = SpriteAddLayer(testSprite, testBitmap, "layer2");
            Assert.Equal("", SpriteLayerName(testSprite, layerIdx));
        }
        [Fact]
        public void TestSpriteLayerOffsetNamedIntegration() {
            var testBitmap = CreateBitmap("Test Bitmap 59", 100, 100);
            using var cleanupBitmap = new BitmapCleanup();
            var testSprite = CreateSprite(testBitmap);
            using var cleanupSprite = new SpriteCleanup();
            Assert.Equal(VectorTo(0.0, 0.0), SpriteLayerOffset(testSprite, "base_layer"));
            SpriteSetLayerOffset(testSprite, "base_layer", VectorTo(10.0, 10.0));
            Assert.Equal(VectorTo(10.0, 10.0), SpriteLayerOffset(testSprite, "base_layer"));
        }
        [Fact]
        public void TestSpriteLayerOffsetIntegration() {
            var testBitmap = CreateBitmap("Test Bitmap 60", 100, 100);
            using var cleanupBitmap = new BitmapCleanup();
            var testSprite = CreateSprite(testBitmap);
            using var cleanupSprite = new SpriteCleanup();
            Assert.Equal(VectorTo(0.0, 0.0), SpriteLayerOffset(testSprite, 0));
            var layerIdx = SpriteAddLayer(testSprite, testBitmap, "layer2");
            SpriteSetLayerOffset(testSprite, layerIdx, VectorTo(10.0, 10.0));
            Assert.Equal(VectorTo(10.0, 10.0), SpriteLayerOffset(testSprite, layerIdx));
        }
        [Fact]
        public void TestSpriteLayerRectangleNamedIntegration() {
            var testBitmap = CreateBitmap("Test Bitmap 61", 100, 100);
            using var cleanupBitmap = new BitmapCleanup();
            var testSprite = CreateSprite(testBitmap);
            using var cleanupSprite = new SpriteCleanup();
            var rect = SpriteLayerRectangle(testSprite, "base_layer");
            Assert.Equal(0.0, rect.X);
            Assert.Equal(0.0, rect.Y);
            Assert.Equal(100.0, rect.Width);
            Assert.Equal(100.0, rect.Height);
        }
        [Fact]
        public void TestSpriteLayerRectangleAtIndexIntegration() {
            var testBitmap = CreateBitmap("Test Bitmap 62", 100, 100);
            using var cleanupBitmap = new BitmapCleanup();
            var testSprite = CreateSprite(testBitmap);
            using var cleanupSprite = new SpriteCleanup();
            var rect = SpriteLayerRectangle(testSprite, 0);
            Assert.Equal(0.0, rect.X);
            Assert.Equal(0.0, rect.Y);
            Assert.Equal(100.0, rect.Width);
            Assert.Equal(100.0, rect.Height);
        }
        [Fact]
        public void TestSpriteLayerWidthNamedIntegration() {
            var testBitmap = CreateBitmap("Test Bitmap 63", 100, 100);
            using var cleanupBitmap = new BitmapCleanup();
            var testSprite = CreateSprite(testBitmap);
            using var cleanupSprite = new SpriteCleanup();
            Assert.Equal(100, SpriteLayerWidth(testSprite, "base_layer"));
            SpriteAddLayer(testSprite, testBitmap, "layer2");
            Assert.Equal(100, SpriteLayerWidth(testSprite, "layer2"));
        }
        [Fact]
        public void TestSpriteLayerWidthIntegration() {
            var testBitmap = CreateBitmap("Test Bitmap 64", 100, 100);
            using var cleanupBitmap = new BitmapCleanup();
            var testSprite = CreateSprite(testBitmap);
            using var cleanupSprite = new SpriteCleanup();
            Assert.Equal(100, SpriteLayerWidth(testSprite, 0));
            var layerIdx = SpriteAddLayer(testSprite, testBitmap, "layer2");
            Assert.Equal(100, SpriteLayerWidth(testSprite, layerIdx));
        }
        [Fact]
        public void TestSpriteLocationMatrixIntegration() {
            var testBitmap = CreateBitmap("Test Bitmap 65", 100, 100);
            using var cleanupBitmap = new BitmapCleanup();
            var testSprite = CreateSprite(testBitmap);
            using var cleanupSprite = new SpriteCleanup();
            SpriteSetPosition(testSprite, PointAt(100.0, 100.0));
            SpriteSetRotation(testSprite, 45.0f);
            var matrix = SpriteLocationMatrix(testSprite);
            Assert.Equal(150.0, matrix.Elements[0, 2]);
            Assert.Equal(1.0, matrix.Elements[2, 2]);
        }
        [Fact]
        public void TestSpriteMassIntegration() {
            var testBitmap = CreateBitmap("Test Bitmap 66", 100, 100);
            using var cleanupBitmap = new BitmapCleanup();
            var testSprite = CreateSprite(testBitmap);
            using var cleanupSprite = new SpriteCleanup();
            Assert.Equal(1.0, SpriteMass(testSprite));
            SpriteSetMass(testSprite, 10.0f);
            Assert.Equal(10.0, SpriteMass(testSprite));
        }
        [Fact]
        public void TestSpriteMoveFromAnchorPointIntegration() {
            var testBitmap = CreateBitmap("Test Bitmap 67", 100, 100);
            using var cleanupBitmap = new BitmapCleanup();
            var testSprite = CreateSprite(testBitmap);
            using var cleanupSprite = new SpriteCleanup();
            Assert.False(SpriteMoveFromAnchorPoint(testSprite));
            SpriteSetMoveFromAnchorPoint(testSprite, true);
            Assert.True(SpriteMoveFromAnchorPoint(testSprite));
        }
        [Fact]
        public void TestSpriteMoveToTakingSecondsIntegration() {
            var testBitmap = CreateBitmap("Test Bitmap 68", 100, 100);
            using var cleanupBitmap = new BitmapCleanup();
            var testSprite = CreateSprite(testBitmap);
            using var cleanupSprite = new SpriteCleanup();
            SpriteSetPosition(testSprite, PointAt(100.0, 100.0));
            SpriteMoveTo(testSprite, PointAt(200.0, 200.0), 1.0f);
            for (int i = 0; i < 5; i++) {
                UpdateSprite(testSprite);
                Delay(300);
            }
            var spriteCenter = CenterPoint(testSprite);
            Assert.Equal(200.0, spriteCenter.X, 2.0);
            Assert.Equal(200.0, spriteCenter.Y, 2.0);
        }
        [Fact]
        public void TestSpriteNameIntegration() {
            var testBitmap = CreateBitmap("Test Bitmap 69", 100, 100);
            using var cleanupBitmap = new BitmapCleanup();
            var testSprite = CreateSprite("Test Sprite 7", testBitmap);
            using var cleanupSprite = new SpriteCleanup();
            Assert.Equal("Test Sprite 7", SpriteName(testSprite));
        }
        [Fact]
        public void TestSpriteNamedIntegration() {
            var testBitmap = CreateBitmap("Test Bitmap 70", 100, 100);
            using var cleanupBitmap = new BitmapCleanup();
            var testSprite = CreateSprite("Test Sprite 8", testBitmap);
            using var cleanupSprite = new SpriteCleanup();
            Assert.Equal(testSprite, SpriteNamed("Test Sprite 8"));
            Assert.Null(SpriteNamed("non_existent_sprite"));
        }
        [Fact]
        public void TestSpriteOffscreenIntegration() {
            OpenWindow("Test Window 5", 800, 600);
            using var cleanupWindow = new WindowCleanup();
            var testBitmap = CreateBitmap("Test Bitmap 71", 100, 100);
            using var cleanupBitmap = new BitmapCleanup();
            var testSprite = CreateSprite(testBitmap);
            using var cleanupSprite = new SpriteCleanup();
            SpriteSetPosition(testSprite, PointAt(400.0, 300.0));
            Assert.False(SpriteOffscreen(testSprite));
            SpriteSetPosition(testSprite, PointAt(-200.0, -200.0));
            Assert.True(SpriteOffscreen(testSprite));
        }
        [Fact]
        public void TestSpriteOnScreenAtPointIntegration() {
            OpenWindow("Test Window 6", 800, 600);
            using var cleanupWindow = new WindowCleanup();
            var testBitmap = CreateBitmap("Test Bitmap 72", 100, 100);
            using var cleanupBitmap = new BitmapCleanup();
            ClearBitmap(testBitmap, ColorRed());
            SetupCollisionMask(testBitmap);
            var testSprite = CreateSprite(testBitmap);
            using var cleanupSprite = new SpriteCleanup();
            SpriteSetPosition(testSprite, PointAt(400.0, 300.0));
            DrawSprite(testSprite);
            RefreshScreen();
            Assert.True(SpriteOnScreenAt(testSprite, PointAt(451.0, 350.0)));
            Assert.False(SpriteOnScreenAt(testSprite, PointAt(0.0, 0.0)));
        }
        [Fact]
        public void TestSpriteOnScreenAtIntegration() {
            OpenWindow("Test Window 7", 800, 600);
            using var cleanupWindow = new WindowCleanup();
            var testBitmap = CreateBitmap("Test Bitmap 73", 100, 100);
            using var cleanupBitmap = new BitmapCleanup();
            ClearBitmap(testBitmap, ColorRed());
            SetupCollisionMask(testBitmap);
            var testSprite = CreateSprite(testBitmap);
            using var cleanupSprite = new SpriteCleanup();
            SpriteSetPosition(testSprite, PointAt(400.0, 300.0));
            DrawSprite(testSprite);
            RefreshScreen();
            Assert.True(SpriteOnScreenAt(testSprite, 451.0, 350.0));
            Assert.False(SpriteOnScreenAt(testSprite, 0.0, 0.0));
        }
        [Fact]
        public void TestSpritePositionIntegration() {
            var testBitmap = CreateBitmap("Test Bitmap 74", 100, 100);
            using var cleanupBitmap = new BitmapCleanup();
            var testSprite = CreateSprite(testBitmap);
            using var cleanupSprite = new SpriteCleanup();
            Assert.Equal(PointAt(0.0, 0.0), SpritePosition(testSprite));
            SpriteSetPosition(testSprite, PointAt(400.0, 300.0));
            Assert.Equal(PointAt(400.0, 300.0), SpritePosition(testSprite));
        }
        [Fact]
        public void TestSpriteReplayAnimationIntegration() {
            var testBitmap = CreateBitmap("Test Bitmap 75", 100, 100);
            using var cleanupBitmap = new BitmapCleanup();
            var testAnimation = LoadAnimationScript("Test Script 8", "kermit.txt");
            using var cleanupAnimationScript = new AnimationScriptCleanup();
            var testSprite = CreateSprite(testBitmap, testAnimation);
            using var cleanupSprite = new SpriteCleanup();
            SpriteStartAnimation(testSprite, "walkfront");
            Assert.False(SpriteAnimationHasEnded(testSprite));
            for (int i = 0; i < 5; i++) {
                UpdateSprite(testSprite, 100.0f);
            }
            Assert.True(SpriteAnimationHasEnded(testSprite));
            SpriteReplayAnimation(testSprite);
            Assert.False(SpriteAnimationHasEnded(testSprite));
        }
        [Fact]
        public void TestSpriteReplayAnimationWithSoundIntegration() {
            var testBitmap = CreateBitmap("Test Bitmap 76", 100, 100);
            using var cleanupBitmap = new BitmapCleanup();
            var testAnimation = LoadAnimationScript("Test Script 9", "startup.txt");
            using var cleanupAnimationScript = new AnimationScriptCleanup();
            var testSprite = CreateSprite(testBitmap, testAnimation);
            using var cleanupSprite = new SpriteCleanup();
            SpriteStartAnimation(testSprite, "splash");
            Assert.False(SpriteAnimationHasEnded(testSprite));
            for (int i = 0; i < 100; i++) {
                UpdateSpriteAnimation(testSprite, 100.0f);
            }
            Assert.True(SpriteAnimationHasEnded(testSprite));
            SpriteReplayAnimation(testSprite, true);
            Assert.True(SoundEffectPlaying("SwinGameStart"));
            Assert.False(SpriteAnimationHasEnded(testSprite));
        }
        [Fact]
        public void TestSpriteRotationIntegration() {
            var testBitmap = CreateBitmap("Test Bitmap 77", 100, 100);
            using var cleanupBitmap = new BitmapCleanup();
            var testSprite = CreateSprite(testBitmap);
            using var cleanupSprite = new SpriteCleanup();
            Assert.Equal(0.0, SpriteRotation(testSprite));
            SpriteSetRotation(testSprite, 45.0f);
            Assert.Equal(45.0, SpriteRotation(testSprite));
        }
        [Fact]
        public void TestSpriteScaleIntegration() {
            var testBitmap = CreateBitmap("Test Bitmap 78", 100, 100);
            using var cleanupBitmap = new BitmapCleanup();
            var testSprite = CreateSprite(testBitmap);
            using var cleanupSprite = new SpriteCleanup();
            Assert.Equal(1.0f, SpriteScale(testSprite));
            SpriteSetScale(testSprite, 2.0f);
            Assert.Equal(2.0f, SpriteScale(testSprite));
        }
        [Fact]
        public void TestSpriteScreenRectangleIntegration() {
            OpenWindow("Test Window 8", 800, 600);
            using var cleanupWindow = new WindowCleanup();
            var testBitmap = CreateBitmap("Test Bitmap 79", 100, 100);
            using var cleanupBitmap = new BitmapCleanup();
            var testAnimation = LoadAnimationScript("Test Script 10", "kermit.txt");
            using var cleanupAnimationScript = new AnimationScriptCleanup();
            ClearBitmap(testBitmap, ColorWhite());
            var testSprite = CreateSprite(testBitmap, testAnimation);
            using var cleanupSprite = new SpriteCleanup();
            SpriteStartAnimation(testSprite, "walkfront");
            SpriteSetPosition(testSprite, PointAt(0.0, 0.0));
            var rect = SpriteScreenRectangle(testSprite);
            Assert.Equal(0.0, rect.X);
            Assert.Equal(0.0, rect.Y);
            Assert.Equal(100.0, rect.Width);
            Assert.Equal(100.0, rect.Height);
        }
        [Fact]
        public void TestSpriteSendLayerBackwardIntegration() {
            var testBitmap = CreateBitmap("Test Bitmap 80", 100, 100);
            using var cleanupBitmap = new BitmapCleanup();
            var testSprite = CreateSprite(testBitmap);
            using var cleanupSprite = new SpriteCleanup();
            var layer1 = SpriteAddLayer(testSprite, testBitmap, "layer1");
            SpriteShowLayer(testSprite, layer1);
            var layer2 = SpriteAddLayer(testSprite, testBitmap, "layer2");
            SpriteShowLayer(testSprite, layer2);
            var visibleIndex = SpriteVisibleIndexOfLayer(testSprite, layer2);
            SpriteSendLayerBackward(testSprite, visibleIndex);
            Assert.Equal(2, SpriteVisibleIndexOfLayer(testSprite, layer2));
        }
        [Fact]
        public void TestSpriteSendLayerToBackIntegration() {
            var testBitmap = CreateBitmap("Test Bitmap 81", 100, 100);
            using var cleanupBitmap = new BitmapCleanup();
            var testSprite = CreateSprite(testBitmap);
            using var cleanupSprite = new SpriteCleanup();
            var layer1 = SpriteAddLayer(testSprite, testBitmap, "layer1");
            SpriteShowLayer(testSprite, layer1);
            var layer2 = SpriteAddLayer(testSprite, testBitmap, "layer2");
            SpriteShowLayer(testSprite, layer2);
            var visibleIndex = SpriteVisibleIndexOfLayer(testSprite, layer2);
            SpriteSendLayerToBack(testSprite, visibleIndex);
            Assert.Equal(2, SpriteVisibleIndexOfLayer(testSprite, layer2));
        }
        [Fact]
        public void TestSpriteSetAnchorPointIntegration() {
            var testBitmap = CreateBitmap("Test Bitmap 82", 100, 100);
            using var cleanupBitmap = new BitmapCleanup();
            var testSprite = CreateSprite(testBitmap);
            using var cleanupSprite = new SpriteCleanup();
            Assert.Equal(PointAt(50.0, 50.0), SpriteAnchorPoint(testSprite));
            SpriteSetAnchorPoint(testSprite, PointAt(25.0, 25.0));
            Assert.Equal(PointAt(25.0, 25.0), SpriteAnchorPoint(testSprite));
        }
        [Fact]
        public void TestSpriteSetCollisionBitmapIntegration() {
            var testBitmap = CreateBitmap("Test Bitmap 83", 100, 100);
            using var cleanupBitmap = new BitmapCleanup();
            var testSprite = CreateSprite(testBitmap);
            using var cleanupSprite = new SpriteCleanup();
            Assert.Equal(testBitmap, SpriteCollisionBitmap(testSprite));
            var newBitmap = CreateBitmap("Test Bitmap 84", 200, 200);
            SpriteSetCollisionBitmap(testSprite, newBitmap);
            Assert.Equal(newBitmap, SpriteCollisionBitmap(testSprite));
        }
        [Fact]
        public void TestSpriteSetCollisionKindIntegration() {
            var testBitmap = CreateBitmap("Test Bitmap 85", 100, 100);
            using var cleanupBitmap = new BitmapCleanup();
            var testSprite = CreateSprite(testBitmap);
            using var cleanupSprite = new SpriteCleanup();
            Assert.Equal(CollisionTestKind.PixelCollisions, SpriteCollisionKind(testSprite));
            SpriteSetCollisionKind(testSprite, CollisionTestKind.AabbCollisions);
            Assert.Equal(CollisionTestKind.AabbCollisions, SpriteCollisionKind(testSprite));
        }
        [Fact]
        public void TestSpriteSetDxIntegration() {
            var testBitmap = CreateBitmap("Test Bitmap 86", 100, 100);
            using var cleanupBitmap = new BitmapCleanup();
            var testSprite = CreateSprite(testBitmap);
            using var cleanupSprite = new SpriteCleanup();
            Assert.Equal(0.0, SpriteDx(testSprite));
            SpriteSetDx(testSprite, 5.0f);
            Assert.Equal(5.0, SpriteDx(testSprite));
        }
        [Fact]
        public void TestSpriteSetDyIntegration() {
            var testBitmap = CreateBitmap("Test Bitmap 87", 100, 100);
            using var cleanupBitmap = new BitmapCleanup();
            var testSprite = CreateSprite(testBitmap);
            using var cleanupSprite = new SpriteCleanup();
            Assert.Equal(0.0, SpriteDy(testSprite));
            SpriteSetDy(testSprite, 5.0f);
            Assert.Equal(5.0, SpriteDy(testSprite));
        }
        [Fact]
        public void TestSpriteSetHeadingIntegration() {
            var testBitmap = CreateBitmap("Test Bitmap 88", 100, 100);
            using var cleanupBitmap = new BitmapCleanup();
            var testSprite = CreateSprite(testBitmap);
            using var cleanupSprite = new SpriteCleanup();
            SpriteSetVelocity(testSprite, VectorFromAngle(90.0, 1.0));
            Assert.Equal(90.0, SpriteHeading(testSprite));
            SpriteSetHeading(testSprite, 45.0f);
            Assert.Equal(45.0, SpriteHeading(testSprite));
        }
        [Fact]
        public void TestSpriteSetLayerOffsetNamedIntegration() {
            var testBitmap = CreateBitmap("Test Bitmap 89", 100, 100);
            using var cleanupBitmap = new BitmapCleanup();
            var testSprite = CreateSprite(testBitmap);
            using var cleanupSprite = new SpriteCleanup();
            Assert.Equal(VectorTo(0.0, 0.0), SpriteLayerOffset(testSprite, "base_layer"));
            SpriteSetLayerOffset(testSprite, "base_layer", VectorTo(10.0, 10.0));
            Assert.Equal(VectorTo(10.0, 10.0), SpriteLayerOffset(testSprite, "base_layer"));
        }
        [Fact]
        public void TestSpriteSetLayerOffsetAtIndexIntegration() {
            var testBitmap = CreateBitmap("Test Bitmap 90", 100, 100);
            using var cleanupBitmap = new BitmapCleanup();
            var testSprite = CreateSprite(testBitmap);
            using var cleanupSprite = new SpriteCleanup();
            Assert.Equal(VectorTo(0.0, 0.0), SpriteLayerOffset(testSprite, 0));
            SpriteSetLayerOffset(testSprite, 0, VectorTo(10.0, 10.0));
            Assert.Equal(VectorTo(10.0, 10.0), SpriteLayerOffset(testSprite, 0));
        }
        [Fact]
        public void TestSpriteSetMassIntegration() {
            var testBitmap = CreateBitmap("Test Bitmap 91", 100, 100);
            using var cleanupBitmap = new BitmapCleanup();
            var testSprite = CreateSprite(testBitmap);
            using var cleanupSprite = new SpriteCleanup();
            Assert.Equal(1.0, SpriteMass(testSprite));
            SpriteSetMass(testSprite, 10.0f);
            Assert.Equal(10.0, SpriteMass(testSprite));
        }
        [Fact]
        public void TestSpriteSetMoveFromAnchorPointIntegration() {
            var testBitmap = CreateBitmap("Test Bitmap 92", 100, 100);
            using var cleanupBitmap = new BitmapCleanup();
            var testSprite = CreateSprite(testBitmap);
            using var cleanupSprite = new SpriteCleanup();
            Assert.False(SpriteMoveFromAnchorPoint(testSprite));
            SpriteSetMoveFromAnchorPoint(testSprite, true);
            Assert.True(SpriteMoveFromAnchorPoint(testSprite));
        }
        [Fact]
        public void TestSpriteSetPositionIntegration() {
            var testBitmap = CreateBitmap("Test Bitmap 93", 100, 100);
            using var cleanupBitmap = new BitmapCleanup();
            var testSprite = CreateSprite(testBitmap);
            using var cleanupSprite = new SpriteCleanup();
            Assert.Equal(PointAt(0.0, 0.0), SpritePosition(testSprite));
            SpriteSetPosition(testSprite, PointAt(100.0, 100.0));
            Assert.Equal(PointAt(100.0, 100.0), SpritePosition(testSprite));
        }
        [Fact]
        public void TestSpriteSetRotationIntegration() {
            var testBitmap = CreateBitmap("Test Bitmap 94", 100, 100);
            using var cleanupBitmap = new BitmapCleanup();
            var testSprite = CreateSprite(testBitmap);
            using var cleanupSprite = new SpriteCleanup();
            Assert.Equal(0.0, SpriteRotation(testSprite));
            SpriteSetRotation(testSprite, 45.0f);
            Assert.Equal(45.0, SpriteRotation(testSprite));
        }
        [Fact]
        public void TestSpriteSetScaleIntegration() {
            var testBitmap = CreateBitmap("Test Bitmap 95", 100, 100);
            using var cleanupBitmap = new BitmapCleanup();
            var testSprite = CreateSprite(testBitmap);
            using var cleanupSprite = new SpriteCleanup();
            Assert.Equal(1.0f, SpriteScale(testSprite));
            SpriteSetScale(testSprite, 2.0f);
            Assert.Equal(2.0f, SpriteScale(testSprite));
        }
        [Fact]
        public void TestSpriteSetSpeedIntegration() {
            var testBitmap = CreateBitmap("Test Bitmap 96", 100, 100);
            using var cleanupBitmap = new BitmapCleanup();
            var testSprite = CreateSprite(testBitmap);
            using var cleanupSprite = new SpriteCleanup();
            SpriteSetVelocity(testSprite, VectorFromAngle(0.0, 1.0));
            SpriteSetSpeed(testSprite, 5.0f);
            Assert.Equal(5.0, SpriteSpeed(testSprite));
        }
        [Fact]
        public void TestSpriteSetValueNamedIntegration() {
            var testBitmap = CreateBitmap("Test Bitmap 97", 100, 100);
            using var cleanupBitmap = new BitmapCleanup();
            var testSprite = CreateSprite(testBitmap);
            using var cleanupSprite = new SpriteCleanup();
            Assert.False(SpriteHasValue(testSprite, "test_value"));
            SpriteAddValue(testSprite, "test_value", 0.0f);
            SpriteSetValue(testSprite, "test_value", 10.5f);
            Assert.Equal(10.5f, SpriteValue(testSprite, "test_value"));
        }
        [Fact]
        public void TestSpriteSetVelocityIntegration() {
            var testBitmap = CreateBitmap("Test Bitmap 98", 100, 100);
            using var cleanupBitmap = new BitmapCleanup();
            var testSprite = CreateSprite(testBitmap);
            using var cleanupSprite = new SpriteCleanup();
            Assert.Equal(VectorTo(0.0, 0.0), SpriteVelocity(testSprite));
            SpriteSetVelocity(testSprite, VectorTo(5.0, 5.0));
            Assert.Equal(VectorTo(5.0, 5.0), SpriteVelocity(testSprite));
        }
        [Fact]
        public void TestSpriteSetXIntegration() {
            var testBitmap = CreateBitmap("Test Bitmap 99", 100, 100);
            using var cleanupBitmap = new BitmapCleanup();
            var testSprite = CreateSprite(testBitmap);
            using var cleanupSprite = new SpriteCleanup();
            Assert.Equal(0.0f, SpriteX(testSprite));
            SpriteSetX(testSprite, 150.0f);
            Assert.Equal(150.0f, SpriteX(testSprite));
        }
        [Fact]
        public void TestSpriteSetYIntegration() {
            var testBitmap = CreateBitmap("Test Bitmap 100", 100, 100);
            using var cleanupBitmap = new BitmapCleanup();
            var testSprite = CreateSprite(testBitmap);
            using var cleanupSprite = new SpriteCleanup();
            Assert.Equal(0.0f, SpriteY(testSprite));
            SpriteSetY(testSprite, 300.0f);
            Assert.Equal(300.0f, SpriteY(testSprite));
        }
        [Fact]
        public void TestSpriteShowLayerNamedIntegration() {
            var testBitmap = CreateBitmap("Test Bitmap 101", 100, 100);
            using var cleanupBitmap = new BitmapCleanup();
            var testSprite = CreateSprite(testBitmap);
            using var cleanupSprite = new SpriteCleanup();
            var layerIdx = SpriteAddLayer(testSprite, testBitmap, "layer2");
            SpriteHideLayer(testSprite, "layer2");
            Assert.Equal(1, SpriteVisibleLayerCount(testSprite));
            Assert.Equal(layerIdx, SpriteShowLayer(testSprite, "layer2"));
            Assert.Equal(2, SpriteVisibleLayerCount(testSprite));
        }
        [Fact]
        public void TestSpriteShowLayerIntegration() {
            var testBitmap = CreateBitmap("Test Bitmap 102", 100, 100);
            using var cleanupBitmap = new BitmapCleanup();
            var testSprite = CreateSprite(testBitmap);
            using var cleanupSprite = new SpriteCleanup();
            var layerIdx = SpriteAddLayer(testSprite, testBitmap, "layer2");
            SpriteHideLayer(testSprite, layerIdx);
            Assert.Equal(1, SpriteVisibleLayerCount(testSprite));
            Assert.Equal(layerIdx, SpriteShowLayer(testSprite, layerIdx));
            Assert.Equal(2, SpriteVisibleLayerCount(testSprite));
        }
        [Fact]
        public void TestSpriteSpeedIntegration() {
            var testBitmap = CreateBitmap("Test Bitmap 103", 100, 100);
            using var cleanupBitmap = new BitmapCleanup();
            var testSprite = CreateSprite(testBitmap);
            using var cleanupSprite = new SpriteCleanup();
            Assert.Equal(0.0, SpriteSpeed(testSprite));
            SpriteSetVelocity(testSprite, VectorTo(3.0, 4.0));
            Assert.Equal(5.0, SpriteSpeed(testSprite));
        }
        [Fact]
        public void TestSpriteStartAnimationNamedIntegration() {
            var testBitmap = CreateBitmap("Test Bitmap 104", 100, 100);
            using var cleanupBitmap = new BitmapCleanup();
            var testAnimation = LoadAnimationScript("Test Script 11", "kermit.txt");
            using var cleanupAnimationScript = new AnimationScriptCleanup();
            var testSprite = CreateSprite(testBitmap, testAnimation);
            using var cleanupSprite = new SpriteCleanup();
            SpriteStartAnimation(testSprite, "walkfront");
            Assert.False(SpriteAnimationHasEnded(testSprite));
            for (int i = 0; i < 5; i++) {
                UpdateSpriteAnimation(testSprite, 100.0f);
            }
            Assert.True(SpriteAnimationHasEnded(testSprite));
            Assert.Equal("walkfront", SpriteAnimationName(testSprite));
        }
        [Fact]
        public void TestSpriteStartAnimationNamedWithSoundIntegration() {
            var testBitmap = CreateBitmap("Test Bitmap 105", 100, 100);
            using var cleanupBitmap = new BitmapCleanup();
            var testAnimation = LoadAnimationScript("Test Script 12", "startup.txt");
            using var cleanupAnimationScript = new AnimationScriptCleanup();
            var testSprite = CreateSprite(testBitmap, testAnimation);
            using var cleanupSprite = new SpriteCleanup();
            SpriteStartAnimation(testSprite, "splash", true);
            Assert.False(SpriteAnimationHasEnded(testSprite));
            Assert.True(SoundEffectPlaying("SwinGameStart"));
            for (int i = 0; i < 100; i++) {
                UpdateSpriteAnimation(testSprite, 100.0f);
            }
            Assert.True(SpriteAnimationHasEnded(testSprite));
            Assert.Equal("splash", SpriteAnimationName(testSprite));
        }
        [Fact]
        public void TestSpriteStartAnimationIntegration() {
            var testBitmap = CreateBitmap("Test Bitmap 106", 100, 100);
            using var cleanupBitmap = new BitmapCleanup();
            var testAnimation = LoadAnimationScript("Test Script 13", "kermit.txt");
            using var cleanupAnimationScript = new AnimationScriptCleanup();
            var testSprite = CreateSprite(testBitmap, testAnimation);
            using var cleanupSprite = new SpriteCleanup();
            SpriteStartAnimation(testSprite, 0);
            Assert.False(SpriteAnimationHasEnded(testSprite));
            for (int i = 0; i < 5; i++) {
                UpdateSpriteAnimation(testSprite, 100.0f);
            }
            Assert.True(SpriteAnimationHasEnded(testSprite));
        }
        [Fact]
        public void TestSpriteStartAnimationWithSoundIntegration() {
            var testBitmap = CreateBitmap("Test Bitmap 107", 100, 100);
            using var cleanupBitmap = new BitmapCleanup();
            var testAnimation = LoadAnimationScript("Test Script 14", "startup.txt");
            using var cleanupAnimationScript = new AnimationScriptCleanup();
            var testSprite = CreateSprite(testBitmap, testAnimation);
            using var cleanupSprite = new SpriteCleanup();
            SpriteStartAnimation(testSprite, 0, true);
            Assert.False(SpriteAnimationHasEnded(testSprite));
            Assert.True(SoundEffectPlaying("SwinGameStart"));
            for (int i = 0; i < 100; i++) {
                UpdateSpriteAnimation(testSprite, 100.0f, true);
            }
            Assert.True(SpriteAnimationHasEnded(testSprite));
        }
        [Fact]
        public void TestSpriteStopCallingOnEventIntegration() {
            var testSpriteDelegates = new SpriteDelegates();
            var testBitmap = CreateBitmap("Test Bitmap 109", 100, 100);
            using var cleanupBitmap = new BitmapCleanup();
            var testSprite = CreateSprite(testBitmap);
            using var cleanupSprite = new SpriteCleanup();
            SpriteCallOnEvent(testSprite, test_sprite_delegates.SpriteEventHandler());
            UpdateSprite(testSprite);
            Assert.True(test_sprite_delegates.EventCalled());
            SpriteStopCallingOnEvent(testSprite, test_sprite_delegates.SpriteEventHandler());
            testSpriteDelegates.Reset()
;            UpdateSprite(testSprite);
            Assert.False(test_sprite_delegates.EventCalled());
        }
        [Fact]
        public void TestSpriteToggleLayerVisibleNamedIntegration() {
            var testBitmap = CreateBitmap("Test Bitmap 110", 100, 100);
            using var cleanupBitmap = new BitmapCleanup();
            var testSprite = CreateSprite(testBitmap);
            using var cleanupSprite = new SpriteCleanup();
            SpriteAddLayer(testSprite, testBitmap, "layer2");
            SpriteShowLayer(testSprite, "layer2");
            Assert.Equal(2, SpriteVisibleLayerCount(testSprite));
            SpriteToggleLayerVisible(testSprite, "layer2");
            Assert.Equal(1, SpriteVisibleLayerCount(testSprite));
            SpriteToggleLayerVisible(testSprite, "layer2");
            Assert.Equal(2, SpriteVisibleLayerCount(testSprite));
        }
        [Fact]
        public void TestSpriteToggleLayerVisibleIntegration() {
            var testBitmap = CreateBitmap("Test Bitmap 111", 100, 100);
            using var cleanupBitmap = new BitmapCleanup();
            var testSprite = CreateSprite(testBitmap);
            using var cleanupSprite = new SpriteCleanup();
            var layerIdx = SpriteAddLayer(testSprite, testBitmap, "layer2");
            SpriteShowLayer(testSprite, layerIdx);
            Assert.Equal(2, SpriteVisibleLayerCount(testSprite));
            SpriteToggleLayerVisible(testSprite, layerIdx);
            Assert.Equal(1, SpriteVisibleLayerCount(testSprite));
        }
        [Fact]
        public void TestSpriteValueIntegration() {
            var testBitmap = CreateBitmap("Test Bitmap 112", 100, 100);
            using var cleanupBitmap = new BitmapCleanup();
            var testSprite = CreateSprite(testBitmap);
            using var cleanupSprite = new SpriteCleanup();
            Assert.Equal(3, SpriteValueCount(testSprite));
            SpriteAddValue(testSprite, "test_value", 0.0f);
            Assert.Equal(0.0f, SpriteValue(testSprite, "test_value"));
        }
        [Fact]
        public void TestSpriteValueCountIntegration() {
            var testBitmap = CreateBitmap("Test Bitmap 113", 100, 100);
            using var cleanupBitmap = new BitmapCleanup();
            var testSprite = CreateSprite(testBitmap);
            using var cleanupSprite = new SpriteCleanup();
            Assert.Equal(3, SpriteValueCount(testSprite));
            SpriteAddValue(testSprite, "health", 0.0f);
            SpriteAddValue(testSprite, "speed", 0.0f);
            Assert.Equal(5, SpriteValueCount(testSprite));
        }
        [Fact]
        public void TestSpriteVelocityIntegration() {
            var testBitmap = CreateBitmap("Test Bitmap 114", 100, 100);
            using var cleanupBitmap = new BitmapCleanup();
            var testSprite = CreateSprite(testBitmap);
            using var cleanupSprite = new SpriteCleanup();
            Assert.Equal(VectorTo(0.0, 0.0), SpriteVelocity(testSprite));
            SpriteSetVelocity(testSprite, VectorTo(5.0, 5.0));
            Assert.Equal(VectorTo(5.0, 5.0), SpriteVelocity(testSprite));
        }
        [Fact]
        public void TestSpriteVisibleIndexOfLayerNamedIntegration() {
            var testBitmap = CreateBitmap("Test Bitmap 115", 100, 100);
            using var cleanupBitmap = new BitmapCleanup();
            var testSprite = CreateSprite(testBitmap);
            using var cleanupSprite = new SpriteCleanup();
            Assert.Equal(0, SpriteVisibleIndexOfLayer(testSprite, "base_layer"));
            SpriteAddLayer(testSprite, testBitmap, "layer2");
            SpriteShowLayer(testSprite, "layer2");
            Assert.Equal(1, SpriteVisibleIndexOfLayer(testSprite, "layer2"));
        }
        [Fact]
        public void TestSpriteVisibleIndexOfLayerIntegration() {
            var testBitmap = CreateBitmap("Test Bitmap 116", 100, 100);
            using var cleanupBitmap = new BitmapCleanup();
            var testSprite = CreateSprite(testBitmap);
            using var cleanupSprite = new SpriteCleanup();
            Assert.Equal(0, SpriteVisibleIndexOfLayer(testSprite, 0));
            var layerIdx = SpriteAddLayer(testSprite, testBitmap, "layer2");
            SpriteShowLayer(testSprite, layerIdx);
            Assert.Equal(1, SpriteVisibleIndexOfLayer(testSprite, layerIdx));
        }
        [Fact]
        public void TestSpriteVisibleLayerIntegration() {
            var testBitmap = CreateBitmap("Test Bitmap 117", 100, 100);
            using var cleanupBitmap = new BitmapCleanup();
            var testSprite = CreateSprite(testBitmap);
            using var cleanupSprite = new SpriteCleanup();
            Assert.Equal(0, SpriteVisibleLayer(testSprite, 0));
            SpriteAddLayer(testSprite, testBitmap, "layer2");
            SpriteShowLayer(testSprite, "layer2");
            Assert.Equal(1, SpriteVisibleLayer(testSprite, 1));
        }
        [Fact]
        public void TestSpriteVisibleLayerCountIntegration() {
            var testBitmap = CreateBitmap("Test Bitmap 118", 100, 100);
            using var cleanupBitmap = new BitmapCleanup();
            var testSprite = CreateSprite(testBitmap);
            using var cleanupSprite = new SpriteCleanup();
            Assert.Equal(1, SpriteVisibleLayerCount(testSprite));
            SpriteAddLayer(testSprite, testBitmap, "layer2");
            SpriteShowLayer(testSprite, "layer2");
            Assert.Equal(2, SpriteVisibleLayerCount(testSprite));
            SpriteHideLayer(testSprite, "layer2");
            Assert.Equal(1, SpriteVisibleLayerCount(testSprite));
        }
        [Fact]
        public void TestSpriteVisibleLayerIdIntegration() {
            var testBitmap = CreateBitmap("Test Bitmap 119", 100, 100);
            using var cleanupBitmap = new BitmapCleanup();
            var testSprite = CreateSprite(testBitmap);
            using var cleanupSprite = new SpriteCleanup();
            Assert.Equal(0, SpriteVisibleLayerId(testSprite, 0));
            SpriteAddLayer(testSprite, testBitmap, "layer2");
            SpriteShowLayer(testSprite, "layer2");
            Assert.Equal(1, SpriteVisibleLayerId(testSprite, 1));
        }
        [Fact]
        public void TestSpriteWidthIntegration() {
            var testBitmap = CreateBitmap("Test Bitmap 120", 100, 100);
            using var cleanupBitmap = new BitmapCleanup();
            var testSprite = CreateSprite(testBitmap);
            using var cleanupSprite = new SpriteCleanup();
            Assert.Equal(1.0f, SpriteScale(testSprite));
            SpriteSetScale(testSprite, 2.0f);
            Assert.Equal(2.0f, SpriteScale(testSprite));
        }
        [Fact]
        public void TestSpriteXIntegration() {
            var testBitmap = CreateBitmap("Test Bitmap 121", 100, 100);
            using var cleanupBitmap = new BitmapCleanup();
            var testSprite = CreateSprite(testBitmap);
            using var cleanupSprite = new SpriteCleanup();
            Assert.Equal(0.0f, SpriteX(testSprite));
            SpriteSetX(testSprite, 150.0f);
            Assert.Equal(150.0f, SpriteX(testSprite));
        }
        [Fact]
        public void TestSpriteYIntegration() {
            var testBitmap = CreateBitmap("Test Bitmap 122", 100, 100);
            using var cleanupBitmap = new BitmapCleanup();
            var testSprite = CreateSprite(testBitmap);
            using var cleanupSprite = new SpriteCleanup();
            Assert.Equal(0.0f, SpriteY(testSprite));
            SpriteSetY(testSprite, 200.0f);
            Assert.Equal(200.0f, SpriteY(testSprite));
        }
        [Fact]
        public void TestStopCallingOnSpriteEventIntegration() {
            var testSpriteDelegates = new SpriteDelegates();
            var testBitmap = CreateBitmap("Test Bitmap 108", 100, 100);
            using var cleanupBitmap = new BitmapCleanup();
            var testSprite = CreateSprite(testBitmap);
            using var cleanupSprite = new SpriteCleanup();
            CallOnSpriteEvent(test_sprite_delegates.SpriteEventHandler());
            UpdateSprite(testSprite);
            Assert.True(test_sprite_delegates.EventCalled());
            StopCallingOnSpriteEvent(test_sprite_delegates.SpriteEventHandler());
            testSpriteDelegates.Reset()
;            UpdateSprite(testSprite);
            Assert.False(test_sprite_delegates.EventCalled());
        }
        [Fact]
        public void TestUpdateAllSpritesIntegration() {
            var testBitmap = CreateBitmap("Test Bitmap 123", 100, 100);
            using var cleanupBitmap = new BitmapCleanup();
            var testSprite1 = CreateSprite(testBitmap);
            using var cleanupSprite = new SpriteCleanup();
            var testSprite2 = CreateSprite(testBitmap);
            SpriteSetVelocity(testSprite1, VectorTo(10.0, 10.0));
            SpriteSetVelocity(testSprite2, VectorTo(-10.0, -10.0));
            UpdateAllSprites();
            Assert.Equal(VectorTo(10.0, 10.0), SpriteVelocity(testSprite1));
            Assert.Equal(VectorTo(-10.0, -10.0), SpriteVelocity(testSprite2));
        }
        [Fact]
        public void TestUpdateAllSpritesPercentIntegration() {
            var testBitmap = CreateBitmap("Test Bitmap 124", 100, 100);
            using var cleanupBitmap = new BitmapCleanup();
            var testSprite1 = CreateSprite(testBitmap);
            using var cleanupSprite = new SpriteCleanup();
            var testSprite2 = CreateSprite(testBitmap);
            SpriteSetVelocity(testSprite1, VectorTo(100.0, 100.0));
            SpriteSetVelocity(testSprite2, VectorTo(-100.0, -100.0));
            UpdateAllSprites(0.5f);
            Assert.Equal(50.0f, SpriteX(testSprite1));
            Assert.Equal(50.0f, SpriteY(testSprite1));
            Assert.Equal(-50.0f, SpriteX(testSprite2));
            Assert.Equal(-50.0f, SpriteY(testSprite2));
        }
        [Fact]
        public void TestUpdateSpriteIntegration() {
            var testBitmap = CreateBitmap("Test Bitmap 125", 100, 100);
            using var cleanupBitmap = new BitmapCleanup();
            var testSprite = CreateSprite(testBitmap);
            using var cleanupSprite = new SpriteCleanup();
            SpriteSetVelocity(testSprite, VectorTo(10.0, 10.0));
            var initialPos = SpritePosition(testSprite);
            UpdateSprite(testSprite);
            Assert.NotEqual(initialPos, SpritePosition(testSprite));
        }
        [Fact]
        public void TestUpdateSpriteWithSoundIntegration() {
            var testBitmap = CreateBitmap("Test Bitmap 126", 100, 100);
            using var cleanupBitmap = new BitmapCleanup();
            var testAnimation = LoadAnimationScript("Test Script 15", "startup.txt");
            using var cleanupAnimationScript = new AnimationScriptCleanup();
            var testSprite = CreateSprite(testBitmap, testAnimation);
            using var cleanupSprite = new SpriteCleanup();
            SpriteStartAnimation(testSprite, "splash", true);
            UpdateSprite(testSprite, true);
            Assert.True(SoundEffectPlaying("SwinGameStart"));
            StopSoundEffect("SwinGameStart");
            UpdateSprite(testSprite, false);
            Assert.False(SoundEffectPlaying("SwinGameStart"));
        }
        [Fact]
        public void TestUpdateSpritePercentIntegration() {
            var testBitmap = CreateBitmap("Test Bitmap 127", 100, 100);
            using var cleanupBitmap = new BitmapCleanup();
            var testSprite = CreateSprite(testBitmap);
            using var cleanupSprite = new SpriteCleanup();
            SpriteSetVelocity(testSprite, VectorTo(100.0, 100.0));
            UpdateSprite(testSprite, 0.5f);
            Assert.Equal(50.0f, SpriteX(testSprite));
            Assert.Equal(50.0f, SpriteY(testSprite));
        }
        [Fact]
        public void TestUpdateSpritePercentWithSoundIntegration() {
            var testAnimation = LoadAnimationScript("Test Script 16", "startup.txt");
            using var cleanupAnimationScript = new AnimationScriptCleanup();
            var testBitmap = CreateBitmap("Test Bitmap 128", 100, 100);
            using var cleanupBitmap = new BitmapCleanup();
            var testSprite = CreateSprite(testBitmap, testAnimation);
            using var cleanupSprite = new SpriteCleanup();
            SpriteStartAnimation(testSprite, "splash", true);
            UpdateSprite(testSprite, 0.5f, true);
            Assert.True(SoundEffectPlaying("SwinGameStart"));
            StopSoundEffect("SwinGameStart");
            UpdateSprite(testSprite, 0.5f, false);
            Assert.False(SoundEffectPlaying("SwinGameStart"));
        }
        [Fact]
        public void TestUpdateSpriteAnimationIntegration() {
            var testBitmap = CreateBitmap("Test Bitmap 129", 100, 100);
            using var cleanupBitmap = new BitmapCleanup();
            var testAnimation = LoadAnimationScript("Test Script 17", "kermit.txt");
            using var cleanupAnimationScript = new AnimationScriptCleanup();
            var testSprite = CreateSprite(testBitmap, testAnimation);
            using var cleanupSprite = new SpriteCleanup();
            SpriteStartAnimation(testSprite, "walkfront");
            Assert.False(SpriteAnimationHasEnded(testSprite));
            for (int i = 0; i < 50; i++) {
                UpdateSpriteAnimation(testSprite);
            }
            Assert.True(SpriteAnimationHasEnded(testSprite));
        }
        [Fact]
        public void TestUpdateSpriteAnimationWithSoundIntegration() {
            var testBitmap = CreateBitmap("Test Bitmap 130", 100, 100);
            using var cleanupBitmap = new BitmapCleanup();
            var testAnimation = LoadAnimationScript("Test Script 18", "startup.txt");
            using var cleanupAnimationScript = new AnimationScriptCleanup();
            var testSprite = CreateSprite(testBitmap, testAnimation);
            using var cleanupSprite = new SpriteCleanup();
            SpriteStartAnimation(testSprite, "splash");
            UpdateSpriteAnimation(testSprite, true);
            Assert.True(SoundEffectPlaying("SwinGameStart"));
            StopSoundEffect("SwinGameStart");
            for (int i = 0; i < 100; i++) {
                UpdateSpriteAnimation(testSprite, false);
            }
            Assert.False(SoundEffectPlaying("SwinGameStart"));
        }
        [Fact]
        public void TestUpdateSpriteAnimationPercentIntegration() {
            var testBitmap = CreateBitmap("Test Bitmap 131", 100, 100);
            using var cleanupBitmap = new BitmapCleanup();
            var testAnimation = LoadAnimationScript("Test Script 19", "startup.txt");
            using var cleanupAnimationScript = new AnimationScriptCleanup();
            var testSprite = CreateSprite(testBitmap, testAnimation);
            using var cleanupSprite = new SpriteCleanup();
            SpriteStartAnimation(testSprite, "splash");
            Assert.False(SpriteAnimationHasEnded(testSprite));
            for (int i = 0; i < 100; i++) {
                UpdateSpriteAnimation(testSprite, 100.0f);
            }
            Assert.True(SpriteAnimationHasEnded(testSprite));
        }
        [Fact]
        public void TestUpdateSpriteAnimationPercentWithSoundIntegration() {
            var testBitmap = CreateBitmap("Test Bitmap 132", 100, 100);
            using var cleanupBitmap = new BitmapCleanup();
            var testAnimation = LoadAnimationScript("Test Script 20", "startup.txt");
            using var cleanupAnimationScript = new AnimationScriptCleanup();
            var testSprite = CreateSprite(testBitmap, testAnimation);
            using var cleanupSprite = new SpriteCleanup();
            SpriteStartAnimation(testSprite, "splash");
            Assert.False(SpriteAnimationHasEnded(testSprite));
            UpdateSpriteAnimation(testSprite, 100.0f, true);
            Assert.True(SoundEffectPlaying("SwinGameStart"));
            StopSoundEffect("SwinGameStart");
            for (int i = 0; i < 100; i++) {
                UpdateSpriteAnimation(testSprite, 100.0f, false);
            }
            Assert.False(SoundEffectPlaying("SwinGameStart"));
        }
        [Fact]
        public void TestVectorFromCenterSpriteToPointPointIntegration() {
            var testBitmap = CreateBitmap("Test Bitmap 133", 100, 100);
            using var cleanupBitmap = new BitmapCleanup();
            var testSprite = CreateSprite(testBitmap);
            using var cleanupSprite = new SpriteCleanup();
            SpriteSetPosition(testSprite, PointAt(0.0, 0.0));
            var targetPoint = PointAt(150.0, 150.0);
            var vector = VectorFromCenterSpriteToPoint(testSprite, targetPoint);
            Assert.Equal(100.0, vector.X);
            Assert.Equal(100.0, vector.Y);
        }
        [Fact]
        public void TestVectorFromToIntegration() {
            var testBitmap = CreateBitmap("Test Bitmap 134", 100, 100);
            using var cleanupBitmap = new BitmapCleanup();
            var testSprite1 = CreateSprite(testBitmap);
            using var cleanupSprite = new SpriteCleanup();
            var testSprite2 = CreateSprite(testBitmap);
            SpriteSetPosition(testSprite1, PointAt(0.0, 0.0));
            SpriteSetPosition(testSprite2, PointAt(100.0, 100.0));
            var vector = VectorFromTo(testSprite1, testSprite2);
            Assert.Equal(100.0, vector.X);
            Assert.Equal(100.0, vector.Y);
        }
    }
}
