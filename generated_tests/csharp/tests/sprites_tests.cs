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
            var spriteDelegates = new SpriteDelegates();
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            using var cleanupBitmap = new BitmapCleanup();
            var testSprite1 = CreateSprite(testBitmap);
            using var cleanupSprite = new SpriteCleanup();
            var testSprite2 = CreateSprite(testBitmap);
            CallForAllSprites(spriteDelegates.SpriteFloatFunction, 300f);
            Assert.Equal(2, spriteDelegates.FloatFunctionCallCount);
            Assert.True(spriteDelegates.EventCalled);
        }
        [Fact]
        public void TestCallForAllSpritesIntegration() {
            var spriteDelegates = new SpriteDelegates();
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            using var cleanupBitmap = new BitmapCleanup();
            var testSprite1 = CreateSprite(testBitmap);
            using var cleanupSprite = new SpriteCleanup();
            var testSprite2 = CreateSprite(testBitmap);
            CallForAllSprites(spriteDelegates.SpriteFunction);
            Assert.Equal(2, spriteDelegates.FunctionCallCount);
            Assert.True(spriteDelegates.EventCalled);
        }
        [Fact]
        public void TestCallOnSpriteEventIntegration() {
            var spriteDelegates = new SpriteDelegates();
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            using var cleanupBitmap = new BitmapCleanup();
            var testAnimation = LoadAnimationScript("test_animation", "kermit.txt");
            using var cleanupAnimationScript = new AnimationScriptCleanup();
            var testSprite = CreateSprite("test_sprite", testBitmap, testAnimation);
            using var cleanupSprite = new SpriteCleanup();
            CallOnSpriteEvent(spriteDelegates.SpriteEventHandler);
            UpdateSprite(testSprite);
            StopCallingOnSpriteEvent(spriteDelegates.SpriteEventHandler);
            Assert.True(spriteDelegates.EventCalled);
        }
        [Fact]
        public void TestCenterPointOfSpriteIntegration() {
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            using var cleanupBitmap = new BitmapCleanup();
            var testSprite = CreateSprite(testBitmap);
            using var cleanupSprite = new SpriteCleanup();
            SpriteSetPosition(testSprite, PointAt(100.0, 100.0));
            var centerPoint = CenterPoint(testSprite);
            Assert.Equal(150.0, centerPoint.X);
            Assert.Equal(150.0, centerPoint.Y);
        }
        [Fact]
        public void TestCreateSpriteIntegration() {
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            using var cleanupBitmap = new BitmapCleanup();
            var testSprite = CreateSprite(testBitmap);
            using var cleanupSprite = new SpriteCleanup();
            Assert.NotNull(testSprite);
            Assert.True(HasSprite(SpriteName(testSprite)));
        }
        [Fact]
        public void TestCreateSpriteWithAnimationIntegration() {
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            using var cleanupBitmap = new BitmapCleanup();
            var testAnimation = LoadAnimationScript("test_animation", "kermit.txt");
            using var cleanupAnimationScript = new AnimationScriptCleanup();
            var testSprite = CreateSprite(testBitmap, testAnimation);
            using var cleanupSprite = new SpriteCleanup();
            Assert.NotNull(testSprite);
            Assert.True(HasSprite(SpriteName(testSprite)));
        }
        [Fact]
        public void TestCreateSpriteWithBitmapNamedIntegration() {
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            using var cleanupBitmap = new BitmapCleanup();
            var testSprite = CreateSprite("test_bitmap");
            using var cleanupSprite = new SpriteCleanup();
            Assert.NotNull(testSprite);
            Assert.True(HasSprite(SpriteName(testSprite)));
        }
        [Fact]
        public void TestCreateSpriteNamedIntegration() {
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            using var cleanupBitmap = new BitmapCleanup();
            var testSprite = CreateSprite("test_sprite", testBitmap);
            using var cleanupSprite = new SpriteCleanup();
            Assert.NotNull(testSprite);
            Assert.Equal("test_sprite", SpriteName(testSprite));
        }
        [Fact]
        public void TestCreateSpriteNamedWithAnimationIntegration() {
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            using var cleanupBitmap = new BitmapCleanup();
            var testAnimation = LoadAnimationScript("test_animation", "kermit.txt");
            using var cleanupAnimationScript = new AnimationScriptCleanup();
            var testSprite = CreateSprite("test_sprite", testBitmap, testAnimation);
            using var cleanupSprite = new SpriteCleanup();
            Assert.NotNull(testSprite);
            Assert.Equal("test_sprite", SpriteName(testSprite));
        }
        [Fact]
        public void TestCreateSpriteWithBitmapAndAnimationNamedIntegration() {
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            using var cleanupBitmap = new BitmapCleanup();
            var testAnimation = LoadAnimationScript("test_animation", "kermit.txt");
            using var cleanupAnimationScript = new AnimationScriptCleanup();
            var testSprite = CreateSprite("test_bitmap", "test_animation");
            using var cleanupSprite = new SpriteCleanup();
            Assert.NotNull(testSprite);
            Assert.True(HasSprite(SpriteName(testSprite)));
        }
        [Fact]
        public void TestCreateSpritePackIntegration() {
            Assert.False(HasSpritePack("test_pack"));
            CreateSpritePack("test_pack");
            using var cleanupSpritePack = new SpritePackCleanup("test_pack");
            Assert.True(HasSpritePack("test_pack"));
        }
        [Fact]
        public void TestCurrentSpritePackIntegration() {
            Assert.Equal("default", CurrentSpritePack());
            CreateSpritePack("test_pack");
            using var cleanupSpritePack = new SpritePackCleanup("test_pack");
            SelectSpritePack("test_pack");
            Assert.Equal("test_pack", CurrentSpritePack());
        }
        [Fact]
        public void TestDrawAllSpritesIntegration() {
            var testWindow = OpenWindow("Test Window", 800, 600);
            using var cleanupWindow = new WindowCleanup();
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
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
            var testWindow = OpenWindow("Test Window", 800, 600);
            using var cleanupWindow = new WindowCleanup();
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
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
            var testWindow = OpenWindow("Test Window", 800, 600);
            using var cleanupWindow = new WindowCleanup();
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            using var cleanupBitmap = new BitmapCleanup();
            ClearBitmap(testBitmap, ColorBlack());
            var testSprite = CreateSprite("test_sprite", testBitmap);
            using var cleanupSprite = new SpriteCleanup();
            SpriteSetPosition(testSprite, PointAt(400.0, 300.0));
            ClearScreen(ColorWhite());
            DrawSprite(testSprite);
            RefreshScreen();
            Assert.Equal(ColorBlack(), GetPixel(testWindow, 400.0, 300.0));
        }
        [Fact]
        public void TestDrawSpriteOffsetXYIntegration() {
            var testWindow = OpenWindow("Test Window", 800, 600);
            using var cleanupWindow = new WindowCleanup();
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
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
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            using var cleanupBitmap = new BitmapCleanup();
            CreateSprite("test_sprite1", testBitmap);
            using var cleanupSprite = new SpriteCleanup();
            CreateSprite("test_sprite2", testBitmap);
            Assert.True(HasSprite("test_sprite1"));
            Assert.True(HasSprite("test_sprite2"));
            FreeAllSprites();
            Assert.False(HasSprite("test_sprite1"));
            Assert.False(HasSprite("test_sprite2"));
        }
        [Fact]
        public void TestFreeSpriteIntegration() {
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            using var cleanupBitmap = new BitmapCleanup();
            var testSprite = CreateSprite("test_sprite", testBitmap);
            using var cleanupSprite = new SpriteCleanup();
            Assert.True(HasSprite("test_sprite"));
            FreeSprite(testSprite);
            Assert.False(HasSprite("test_sprite"));
        }
        [Fact]
        public void TestFreeSpritePackIntegration() {
            Assert.Equal("default", CurrentSpritePack());
            CreateSpritePack("test_pack");
            using var cleanupSpritePack = new SpritePackCleanup("test_pack");
            SelectSpritePack("test_pack");
            Assert.True(HasSpritePack("test_pack"));
            Assert.Equal("test_pack", CurrentSpritePack());
            FreeSpritePack("test_pack");
            Assert.False(HasSpritePack("test_pack"));
            Assert.Equal("default", CurrentSpritePack());
        }
        [Fact]
        public void TestHasSpriteIntegration() {
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            using var cleanupBitmap = new BitmapCleanup();
            Assert.False(HasSprite("test_sprite"));
            var testSprite = CreateSprite("test_sprite", testBitmap);
            using var cleanupSprite = new SpriteCleanup();
            Assert.True(HasSprite("test_sprite"));
            FreeSprite(testSprite);
            Assert.False(HasSprite("test_sprite"));
        }
        [Fact]
        public void TestHasSpritePackIntegration() {
            Assert.False(HasSpritePack("test_pack"));
            CreateSpritePack("test_pack");
            using var cleanupSpritePack = new SpritePackCleanup("test_pack");
            Assert.True(HasSpritePack("test_pack"));
            FreeSpritePack("test_pack");
            Assert.False(HasSpritePack("test_pack"));
        }
        [Fact]
        public void TestMoveSpriteIntegration() {
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            using var cleanupBitmap = new BitmapCleanup();
            var testSprite = CreateSprite("test_sprite", testBitmap);
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
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            using var cleanupBitmap = new BitmapCleanup();
            var testSprite = CreateSprite("test_sprite", testBitmap);
            using var cleanupSprite = new SpriteCleanup();
            SpriteSetPosition(testSprite, PointAt(100.0, 100.0));
            MoveSprite(testSprite, VectorTo(50.0, 50.0));
            Assert.Equal(150.0f, SpriteX(testSprite));
            Assert.Equal(150f, SpriteY(testSprite));
        }
        [Fact]
        public void TestMoveSpriteByVectorPercentIntegration() {
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            using var cleanupBitmap = new BitmapCleanup();
            var testSprite = CreateSprite("test_sprite", testBitmap);
            using var cleanupSprite = new SpriteCleanup();
            SpriteSetPosition(testSprite, PointAt(100.0, 100.0));
            MoveSprite(testSprite, VectorTo(50.0, 50.0), 0.5f);
            Assert.Equal(125.0f, SpriteX(testSprite));
            Assert.Equal(125.0f, SpriteY(testSprite));
        }
        [Fact]
        public void TestMoveSpritePercentIntegration() {
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            using var cleanupBitmap = new BitmapCleanup();
            var testSprite = CreateSprite("test_sprite", testBitmap);
            using var cleanupSprite = new SpriteCleanup();
            SpriteSetPosition(testSprite, PointAt(100.0, 100.0));
            SpriteSetVelocity(testSprite, VectorTo(10.0, 10.0));
            MoveSprite(testSprite, 0.5f);
            Assert.Equal(105.0f, SpriteX(testSprite));
            Assert.Equal(105.0f, SpriteY(testSprite));
        }
        [Fact]
        public void TestMoveSpriteToIntegration() {
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            using var cleanupBitmap = new BitmapCleanup();
            var testSprite = CreateSprite("test_sprite", testBitmap);
            using var cleanupSprite = new SpriteCleanup();
            MoveSpriteTo(testSprite, 400.0, 300.0);
            Assert.Equal(400.0f, SpriteX(testSprite));
            Assert.Equal(300.0f, SpriteY(testSprite));
        }
        [Fact]
        public void TestSelectSpritePackIntegration() {
            CreateSpritePack("test_pack");
            using var cleanupSpritePack = new SpritePackCleanup("test_pack");
            Assert.Equal("default", CurrentSpritePack());
            SelectSpritePack("test_pack");
            Assert.Equal("test_pack", CurrentSpritePack());
        }
        [Fact]
        public void TestSpriteAddLayerIntegration() {
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            using var cleanupBitmap = new BitmapCleanup();
            var testSprite = CreateSprite("test_sprite", testBitmap);
            using var cleanupSprite = new SpriteCleanup();
            var newLayerBitmap = CreateBitmap("new_layer", 50, 50);
            var layerIndex = SpriteAddLayer(testSprite, newLayerBitmap, "new_layer");
            Assert.Equal(1, layerIndex);
            Assert.Equal(2, SpriteLayerCount(testSprite));
        }
        [Fact]
        public void TestSpriteAddToVelocityIntegration() {
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            using var cleanupBitmap = new BitmapCleanup();
            var testSprite = CreateSprite("test_sprite", testBitmap);
            using var cleanupSprite = new SpriteCleanup();
            SpriteSetVelocity(testSprite, VectorTo(0.0, 0.0));
            SpriteAddToVelocity(testSprite, VectorTo(10.0, 10.0));
            var velocity = SpriteVelocity(testSprite);
            Assert.Equal(10.0, velocity.X);
            Assert.Equal(10.0, velocity.Y);
        }
        [Fact]
        public void TestSpriteAddValueIntegration() {
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            using var cleanupBitmap = new BitmapCleanup();
            var testSprite = CreateSprite("test_sprite", testBitmap);
            using var cleanupSprite = new SpriteCleanup();
            SpriteAddValue(testSprite, "health", 100.0f);
            Assert.True(SpriteHasValue(testSprite, "health"));
            Assert.Equal(100.0f, SpriteValue(testSprite, "health"));
        }
        [Fact]
        public void TestSpriteAddValueWithDefaultIntegration() {
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            using var cleanupBitmap = new BitmapCleanup();
            var testSprite = CreateSprite("test_sprite", testBitmap);
            using var cleanupSprite = new SpriteCleanup();
            SpriteAddValue(testSprite, "health", 100.0f);
            Assert.True(SpriteHasValue(testSprite, "health"));
            Assert.Equal(100.0f, SpriteValue(testSprite, "health"));
        }
        [Fact]
        public void TestSpriteAnchorPointIntegration() {
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            using var cleanupBitmap = new BitmapCleanup();
            var testSprite = CreateSprite("test_sprite", testBitmap);
            using var cleanupSprite = new SpriteCleanup();
            var anchorPoint = SpriteAnchorPoint(testSprite);
            Assert.Equal(50.0, anchorPoint.X);
            Assert.Equal(50.0, anchorPoint.Y);
        }
        [Fact]
        public void TestSpriteAnchorPositionIntegration() {
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            using var cleanupBitmap = new BitmapCleanup();
            var testSprite = CreateSprite("test_sprite", testBitmap);
            using var cleanupSprite = new SpriteCleanup();
            SpriteSetPosition(testSprite, PointAt(100.0, 100.0));
            var anchorPosition = SpriteAnchorPosition(testSprite);
            Assert.Equal(150.0, anchorPosition.X);
            Assert.Equal(150.0, anchorPosition.Y);
        }
        [Fact]
        public void TestSpriteAnimationHasEndedIntegration() {
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            using var cleanupBitmap = new BitmapCleanup();
            var testAnimation = LoadAnimationScript("test_animation", "kermit.txt");
            using var cleanupAnimationScript = new AnimationScriptCleanup();
            var testSprite = CreateSprite("test_sprite", testBitmap, testAnimation);
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
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            using var cleanupBitmap = new BitmapCleanup();
            var testAnimation = LoadAnimationScript("test_animation", "kermit.txt");
            using var cleanupAnimationScript = new AnimationScriptCleanup();
            var testSprite = CreateSprite("test_sprite", testBitmap, testAnimation);
            using var cleanupSprite = new SpriteCleanup();
            SpriteStartAnimation(testSprite, "walkfront");
            Assert.Equal("walkfront", SpriteAnimationName(testSprite));
        }
        [Fact]
        public void TestSpriteAtIntegration() {
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            using var cleanupBitmap = new BitmapCleanup();
            ClearBitmap(testBitmap, ColorRed());
            SetupCollisionMask(testBitmap);
            var testSprite = CreateSprite("test_sprite", testBitmap);
            using var cleanupSprite = new SpriteCleanup();
            SpriteSetX(testSprite, 400f);
            SpriteSetY(testSprite, 300f);
            Assert.True(SpriteAt(testSprite, PointAt(451.0, 350.0)));
            Assert.False(SpriteAt(testSprite, PointAt(600.0, 500.0)));
        }
        [Fact]
        public void TestSpriteBringLayerForwardIntegration() {
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            using var cleanupBitmap = new BitmapCleanup();
            var testSprite = CreateSprite("test_sprite", testBitmap);
            using var cleanupSprite = new SpriteCleanup();
            var layerIndex = SpriteAddLayer(testSprite, testBitmap, "layer2");
            SpriteShowLayer(testSprite, layerIndex);
            var visibleIndex = SpriteVisibleIndexOfLayer(testSprite, layerIndex);
            SpriteBringLayerForward(testSprite, visibleIndex);
            Assert.Equal(0, SpriteVisibleIndexOfLayer(testSprite, layerIndex));
        }
        [Fact]
        public void TestSpriteBringLayerToFrontIntegration() {
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            using var cleanupBitmap = new BitmapCleanup();
            var testSprite = CreateSprite("test_sprite", testBitmap);
            using var cleanupSprite = new SpriteCleanup();
            var layerIndex = SpriteAddLayer(testSprite, testBitmap, "layer2");
            SpriteShowLayer(testSprite, layerIndex);
            var visibleIndex = SpriteVisibleIndexOfLayer(testSprite, layerIndex);
            SpriteBringLayerToFront(testSprite, visibleIndex);
            Assert.Equal(0, SpriteVisibleIndexOfLayer(testSprite, "layer2"));
        }
        [Fact]
        public void TestSpriteCallOnEventIntegration() {
            var spriteDelegates = new SpriteDelegates();
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            using var cleanupBitmap = new BitmapCleanup();
            var testSprite = CreateSprite("test_sprite", testBitmap);
            using var cleanupSprite = new SpriteCleanup();
            SpriteCallOnEvent(testSprite, spriteDelegates.SpriteEventHandler);
            UpdateSprite(testSprite);
            StopCallingOnSpriteEvent(spriteDelegates.SpriteEventHandler);
            Assert.True(spriteDelegates.EventCalled);
        }
        [Fact]
        public void TestSpriteCircleIntegration() {
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            using var cleanupBitmap = new BitmapCleanup();
            var testSprite = CreateSprite("test_sprite", testBitmap);
            using var cleanupSprite = new SpriteCleanup();
            var circle = SpriteCircle(testSprite);
            Assert.Equal(50.0, circle.Center.X);
            Assert.Equal(50.0, circle.Center.Y);
            Assert.Equal(50.0, circle.Radius);
        }
        [Fact]
        public void TestSpriteCollisionBitmapIntegration() {
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            using var cleanupBitmap = new BitmapCleanup();
            var testSprite = CreateSprite("test_sprite", testBitmap);
            using var cleanupSprite = new SpriteCleanup();
            var collisionBitmap = SpriteCollisionBitmap(testSprite);
            Assert.Equal(testBitmap, collisionBitmap);
        }
        [Fact]
        public void TestSpriteCollisionCircleIntegration() {
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            using var cleanupBitmap = new BitmapCleanup();
            var testSprite = CreateSprite("test_sprite", testBitmap);
            using var cleanupSprite = new SpriteCleanup();
            var circle = SpriteCollisionCircle(testSprite);
            Assert.Equal(50.0, circle.Center.X);
            Assert.Equal(50.0, circle.Center.Y);
            Assert.Equal(50.0, circle.Radius);
        }
        [Fact]
        public void TestSpriteCollisionKindIntegration() {
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            using var cleanupBitmap = new BitmapCleanup();
            var testSprite = CreateSprite("test_sprite", testBitmap);
            using var cleanupSprite = new SpriteCleanup();
            Assert.Equal(CollisionTestKind.PixelCollisions, SpriteCollisionKind(testSprite));
            SpriteSetCollisionKind(testSprite, CollisionTestKind.AabbCollisions);
            Assert.Equal(CollisionTestKind.AabbCollisions, SpriteCollisionKind(testSprite));
        }
        [Fact]
        public void TestSpriteCollisionRectangleIntegration() {
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            using var cleanupBitmap = new BitmapCleanup();
            var testSprite = CreateSprite("test_sprite", testBitmap);
            using var cleanupSprite = new SpriteCleanup();
            var rect = SpriteCollisionRectangle(testSprite);
            Assert.Equal(0.0, rect.X);
            Assert.Equal(0.0, rect.Y);
            Assert.Equal(100.0, rect.Width);
            Assert.Equal(100.0, rect.Height);
        }
        [Fact]
        public void TestSpriteCurrentCellIntegration() {
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            using var cleanupBitmap = new BitmapCleanup();
            var testAnimation = LoadAnimationScript("test_animation", "kermit.txt");
            using var cleanupAnimationScript = new AnimationScriptCleanup();
            var testSprite = CreateSprite("test_sprite", testBitmap, testAnimation);
            using var cleanupSprite = new SpriteCleanup();
            SpriteStartAnimation(testSprite, "walkfront");
            Assert.Equal(0, SpriteCurrentCell(testSprite));
            UpdateSprite(testSprite, 100.0f);
            Assert.Equal(1, SpriteCurrentCell(testSprite));
        }
        [Fact]
        public void TestSpriteCurrentCellRectangleIntegration() {
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            using var cleanupBitmap = new BitmapCleanup();
            var testSprite = CreateSprite("test_sprite", testBitmap);
            using var cleanupSprite = new SpriteCleanup();
            var rect = SpriteCurrentCellRectangle(testSprite);
            Assert.Equal(0.0, rect.X);
            Assert.Equal(0.0, rect.Y);
            Assert.Equal(100.0, rect.Width);
            Assert.Equal(100.0, rect.Height);
        }
        [Fact]
        public void TestSpriteDxIntegration() {
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            using var cleanupBitmap = new BitmapCleanup();
            var testSprite = CreateSprite("test_sprite", testBitmap);
            using var cleanupSprite = new SpriteCleanup();
            Assert.Equal(0.0, SpriteDx(testSprite));
            SpriteSetDx(testSprite, 5.0f);
            Assert.Equal(5.0, SpriteDx(testSprite));
        }
        [Fact]
        public void TestSpriteDyIntegration() {
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            using var cleanupBitmap = new BitmapCleanup();
            var testSprite = CreateSprite("test_sprite", testBitmap);
            using var cleanupSprite = new SpriteCleanup();
            Assert.Equal(0.0, SpriteDy(testSprite));
            SpriteSetDy(testSprite, 5.0f);
            Assert.Equal(5.0, SpriteDy(testSprite));
        }
        [Fact]
        public void TestSpriteHasValueIntegration() {
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            using var cleanupBitmap = new BitmapCleanup();
            var testSprite = CreateSprite("test_sprite", testBitmap);
            using var cleanupSprite = new SpriteCleanup();
            Assert.False(SpriteHasValue(testSprite, "health"));
            SpriteAddValue(testSprite, "health", 100.0f);
            Assert.True(SpriteHasValue(testSprite, "health"));
            Assert.False(SpriteHasValue(testSprite, "mana"));
        }
        [Fact]
        public void TestSpriteHeadingIntegration() {
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            using var cleanupBitmap = new BitmapCleanup();
            var testSprite = CreateSprite("test_sprite", testBitmap);
            using var cleanupSprite = new SpriteCleanup();
            Assert.Equal(90.0, SpriteHeading(testSprite));
            SpriteSetVelocity(testSprite, VectorTo(1.0, 1.0));
            Assert.Equal(45.0, SpriteHeading(testSprite));
        }
        [Fact]
        public void TestSpriteHeightIntegration() {
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            using var cleanupBitmap = new BitmapCleanup();
            var testSprite = CreateSprite("test_sprite", testBitmap);
            using var cleanupSprite = new SpriteCleanup();
            Assert.Equal(100, SpriteHeight(testSprite));
        }
        [Fact]
        public void TestSpriteHideLayerNamedIntegration() {
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            using var cleanupBitmap = new BitmapCleanup();
            var testSprite = CreateSprite("test_sprite", testBitmap);
            using var cleanupSprite = new SpriteCleanup();
            SpriteAddLayer(testSprite, testBitmap, "layer2");
            SpriteShowLayer(testSprite, "layer2");
            Assert.Equal(2, SpriteVisibleLayerCount(testSprite));
            SpriteHideLayer(testSprite, "layer2");
            Assert.Equal(1, SpriteVisibleLayerCount(testSprite));
        }
        [Fact]
        public void TestSpriteHideLayerIntegration() {
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            using var cleanupBitmap = new BitmapCleanup();
            var testSprite = CreateSprite("test_sprite", testBitmap);
            using var cleanupSprite = new SpriteCleanup();
            var layerIdx = SpriteAddLayer(testSprite, testBitmap, "layer2");
            SpriteShowLayer(testSprite, layerIdx);
            Assert.Equal(2, SpriteVisibleLayerCount(testSprite));
            SpriteHideLayer(testSprite, layerIdx);
            Assert.Equal(1, SpriteVisibleLayerCount(testSprite));
        }
        [Fact]
        public void TestSpriteLayerNamedIntegration() {
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            using var cleanupBitmap = new BitmapCleanup();
            var testSprite = CreateSprite("test_sprite", testBitmap);
            using var cleanupSprite = new SpriteCleanup();
            SpriteAddLayer(testSprite, testBitmap, "layer2");
            Assert.Equal(testBitmap, SpriteLayer(testSprite, "layer2"));
        }
        [Fact]
        public void TestSpriteLayerAtIndexIntegration() {
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            using var cleanupBitmap = new BitmapCleanup();
            var testSprite = CreateSprite("test_sprite", testBitmap);
            using var cleanupSprite = new SpriteCleanup();
            var layerIdx = SpriteAddLayer(testSprite, testBitmap, "layer2");
            Assert.Equal(testBitmap, SpriteLayer(testSprite, layerIdx));
        }
        [Fact]
        public void TestSpriteLayerCircleNamedIntegration() {
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            using var cleanupBitmap = new BitmapCleanup();
            var testSprite = CreateSprite("test_sprite", testBitmap);
            using var cleanupSprite = new SpriteCleanup();
            var circle = SpriteLayerCircle(testSprite, "base_layer");
            Assert.Equal(50.0, circle.Center.X);
            Assert.Equal(50.0, circle.Center.Y);
            Assert.Equal(50.0, circle.Radius);
        }
        [Fact]
        public void TestSpriteLayerCircleAtIndexIntegration() {
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            using var cleanupBitmap = new BitmapCleanup();
            var testSprite = CreateSprite("test_sprite", testBitmap);
            using var cleanupSprite = new SpriteCleanup();
            var circle = SpriteLayerCircle(testSprite, 0);
            Assert.Equal(50.0, circle.Center.X);
            Assert.Equal(50.0, circle.Center.Y);
            Assert.Equal(50.0, circle.Radius);
        }
        [Fact]
        public void TestSpriteLayerCountIntegration() {
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            using var cleanupBitmap = new BitmapCleanup();
            var testSprite = CreateSprite("test_sprite", testBitmap);
            using var cleanupSprite = new SpriteCleanup();
            Assert.Equal(1, SpriteLayerCount(testSprite));
            var layerIdx = SpriteAddLayer(testSprite, testBitmap, "layer2");
            Assert.Equal(2, SpriteLayerCount(testSprite));
            Assert.Equal(1, layerIdx);
        }
        [Fact]
        public void TestSpriteLayerHeightNamedIntegration() {
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            using var cleanupBitmap = new BitmapCleanup();
            var testSprite = CreateSprite("test_sprite", testBitmap);
            using var cleanupSprite = new SpriteCleanup();
            Assert.Equal(100, SpriteLayerHeight(testSprite, "base_layer"));
            SpriteAddLayer(testSprite, testBitmap, "layer2");
            Assert.Equal(100, SpriteLayerHeight(testSprite, "layer2"));
        }
        [Fact]
        public void TestSpriteLayerHeightIntegration() {
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            using var cleanupBitmap = new BitmapCleanup();
            var testSprite = CreateSprite("test_sprite", testBitmap);
            using var cleanupSprite = new SpriteCleanup();
            Assert.Equal(100, SpriteLayerHeight(testSprite, 0));
            var layerIdx = SpriteAddLayer(testSprite, testBitmap, "layer2");
            Assert.Equal(100, SpriteLayerHeight(testSprite, layerIdx));
        }
        [Fact]
        public void TestSpriteLayerIndexIntegration() {
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            using var cleanupBitmap = new BitmapCleanup();
            var testSprite = CreateSprite("test_sprite", testBitmap);
            using var cleanupSprite = new SpriteCleanup();
            Assert.Equal(0, SpriteLayerIndex(testSprite, "base_layer"));
            var layerIdx = SpriteAddLayer(testSprite, testBitmap, "layer2");
            Assert.Equal(layerIdx, SpriteLayerIndex(testSprite, "layer2"));
        }
        [Fact]
        public void TestSpriteLayerNameIntegration() {
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            using var cleanupBitmap = new BitmapCleanup();
            var testSprite = CreateSprite("test_sprite", testBitmap);
            using var cleanupSprite = new SpriteCleanup();
            var layerIdx = SpriteAddLayer(testSprite, testBitmap, "layer2");
            Assert.Equal("", SpriteLayerName(testSprite, layerIdx));
        }
        [Fact]
        public void TestSpriteLayerOffsetNamedIntegration() {
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            using var cleanupBitmap = new BitmapCleanup();
            var testSprite = CreateSprite("test_sprite", testBitmap);
            using var cleanupSprite = new SpriteCleanup();
            Assert.Equal(VectorTo(0.0, 0.0), SpriteLayerOffset(testSprite, "base_layer"));
            SpriteSetLayerOffset(testSprite, "base_layer", VectorTo(10.0, 10.0));
            Assert.Equal(VectorTo(10.0, 10.0), SpriteLayerOffset(testSprite, "base_layer"));
        }
        [Fact]
        public void TestSpriteLayerOffsetIntegration() {
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            using var cleanupBitmap = new BitmapCleanup();
            var testSprite = CreateSprite("test_sprite", testBitmap);
            using var cleanupSprite = new SpriteCleanup();
            Assert.Equal(VectorTo(0.0, 0.0), SpriteLayerOffset(testSprite, 0));
            var layerIdx = SpriteAddLayer(testSprite, testBitmap, "layer2");
            SpriteSetLayerOffset(testSprite, layerIdx, VectorTo(10.0, 10.0));
            Assert.Equal(VectorTo(10.0, 10.0), SpriteLayerOffset(testSprite, layerIdx));
        }
        [Fact]
        public void TestSpriteLayerRectangleNamedIntegration() {
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            using var cleanupBitmap = new BitmapCleanup();
            var testSprite = CreateSprite("test_sprite", testBitmap);
            using var cleanupSprite = new SpriteCleanup();
            var rect = SpriteLayerRectangle(testSprite, "base_layer");
            Assert.Equal(0.0, rect.X);
            Assert.Equal(0.0, rect.Y);
            Assert.Equal(100.0, rect.Width);
            Assert.Equal(100.0, rect.Height);
        }
        [Fact]
        public void TestSpriteLayerRectangleAtIndexIntegration() {
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            using var cleanupBitmap = new BitmapCleanup();
            var testSprite = CreateSprite("test_sprite", testBitmap);
            using var cleanupSprite = new SpriteCleanup();
            var rect = SpriteLayerRectangle(testSprite, 0);
            Assert.Equal(0.0, rect.X);
            Assert.Equal(0.0, rect.Y);
            Assert.Equal(100.0, rect.Width);
            Assert.Equal(100.0, rect.Height);
        }
        [Fact]
        public void TestSpriteLayerWidthNamedIntegration() {
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            using var cleanupBitmap = new BitmapCleanup();
            var testSprite = CreateSprite("test_sprite", testBitmap);
            using var cleanupSprite = new SpriteCleanup();
            Assert.Equal(100, SpriteLayerWidth(testSprite, "base_layer"));
            SpriteAddLayer(testSprite, testBitmap, "layer2");
            Assert.Equal(100, SpriteLayerWidth(testSprite, "layer2"));
        }
        [Fact]
        public void TestSpriteLayerWidthIntegration() {
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            using var cleanupBitmap = new BitmapCleanup();
            var testSprite = CreateSprite("test_sprite", testBitmap);
            using var cleanupSprite = new SpriteCleanup();
            Assert.Equal(100, SpriteLayerWidth(testSprite, 0));
            var layerIdx = SpriteAddLayer(testSprite, testBitmap, "layer2");
            Assert.Equal(100, SpriteLayerWidth(testSprite, layerIdx));
        }
        [Fact]
        public void TestSpriteLocationMatrixIntegration() {
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            using var cleanupBitmap = new BitmapCleanup();
            var testSprite = CreateSprite("test_sprite", testBitmap);
            using var cleanupSprite = new SpriteCleanup();
            SpriteSetPosition(testSprite, PointAt(100.0, 100.0));
            SpriteSetRotation(testSprite, 45f);
            var matrix = SpriteLocationMatrix(testSprite);
            Assert.Equal(150.0, matrix.Elements[0, 2]);
            Assert.Equal(1.0, matrix.Elements[2, 2]);
        }
        [Fact]
        public void TestSpriteMassIntegration() {
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            using var cleanupBitmap = new BitmapCleanup();
            var testSprite = CreateSprite("test_sprite", testBitmap);
            using var cleanupSprite = new SpriteCleanup();
            Assert.Equal(1.0, SpriteMass(testSprite));
            SpriteSetMass(testSprite, 10.0f);
            Assert.Equal(10.0, SpriteMass(testSprite));
        }
        [Fact]
        public void TestSpriteMoveFromAnchorPointIntegration() {
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            using var cleanupBitmap = new BitmapCleanup();
            var testSprite = CreateSprite("test_sprite", testBitmap);
            using var cleanupSprite = new SpriteCleanup();
            Assert.False(SpriteMoveFromAnchorPoint(testSprite));
            SpriteSetMoveFromAnchorPoint(testSprite, true);
            Assert.True(SpriteMoveFromAnchorPoint(testSprite));
        }
        [Fact]
        public void TestSpriteMoveToTakingSecondsIntegration() {
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            using var cleanupBitmap = new BitmapCleanup();
            var testSprite = CreateSprite("test_sprite", testBitmap);
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
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            using var cleanupBitmap = new BitmapCleanup();
            var testSprite = CreateSprite("test_sprite", testBitmap);
            using var cleanupSprite = new SpriteCleanup();
            Assert.Equal("test_sprite", SpriteName(testSprite));
        }
        [Fact]
        public void TestSpriteNamedIntegration() {
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            using var cleanupBitmap = new BitmapCleanup();
            var testSprite = CreateSprite("test_sprite", testBitmap);
            using var cleanupSprite = new SpriteCleanup();
            Assert.Equal(testSprite, SpriteNamed("test_sprite"));
            Assert.Null(SpriteNamed("non_existent_sprite"));
        }
        [Fact]
        public void TestSpriteOffscreenIntegration() {
            var testWindow = OpenWindow("Test Window", 800, 600);
            using var cleanupWindow = new WindowCleanup();
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            using var cleanupBitmap = new BitmapCleanup();
            var testSprite = CreateSprite("test_sprite", testBitmap);
            using var cleanupSprite = new SpriteCleanup();
            SpriteSetPosition(testSprite, PointAt(400.0, 300.0));
            Assert.False(SpriteOffscreen(testSprite));
            SpriteSetPosition(testSprite, PointAt(-200.0, -200.0));
            Assert.True(SpriteOffscreen(testSprite));
        }
        [Fact]
        public void TestSpriteOnScreenAtPointIntegration() {
            var testWindow = OpenWindow("Test Window", 800, 600);
            using var cleanupWindow = new WindowCleanup();
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            using var cleanupBitmap = new BitmapCleanup();
            ClearBitmap(testBitmap, ColorRed());
            SetupCollisionMask(testBitmap);
            var testSprite = CreateSprite("test_sprite", testBitmap);
            using var cleanupSprite = new SpriteCleanup();
            SpriteSetPosition(testSprite, PointAt(400.0, 300.0));
            DrawSprite(testSprite);
            RefreshScreen();
            Assert.True(SpriteOnScreenAt(testSprite, PointAt(451.0, 350.0)));
            Assert.False(SpriteOnScreenAt(testSprite, PointAt(0.0, 0.0)));
        }
        [Fact]
        public void TestSpriteOnScreenAtIntegration() {
            var testWindow = OpenWindow("Test Window", 800, 600);
            using var cleanupWindow = new WindowCleanup();
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            using var cleanupBitmap = new BitmapCleanup();
            ClearBitmap(testBitmap, ColorRed());
            SetupCollisionMask(testBitmap);
            var testSprite = CreateSprite("test_sprite", testBitmap);
            using var cleanupSprite = new SpriteCleanup();
            SpriteSetPosition(testSprite, PointAt(400.0, 300.0));
            DrawSprite(testSprite);
            RefreshScreen();
            Assert.True(SpriteOnScreenAt(testSprite, 451.0, 350.0));
            Assert.False(SpriteOnScreenAt(testSprite, 0.0, 0.0));
        }
        [Fact]
        public void TestSpritePositionIntegration() {
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            using var cleanupBitmap = new BitmapCleanup();
            var testSprite = CreateSprite("test_sprite", testBitmap);
            using var cleanupSprite = new SpriteCleanup();
            Assert.Equal(PointAt(0.0, 0.0), SpritePosition(testSprite));
            SpriteSetPosition(testSprite, PointAt(400.0, 300.0));
            Assert.Equal(PointAt(400.0, 300.0), SpritePosition(testSprite));
        }
        [Fact]
        public void TestSpriteReplayAnimationIntegration() {
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            using var cleanupBitmap = new BitmapCleanup();
            var testAnimation = LoadAnimationScript("test_animation", "kermit.txt");
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
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            using var cleanupBitmap = new BitmapCleanup();
            var testAnimation = LoadAnimationScript("test_animation", "startup.txt");
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
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            using var cleanupBitmap = new BitmapCleanup();
            var testSprite = CreateSprite("test_sprite", testBitmap);
            using var cleanupSprite = new SpriteCleanup();
            Assert.Equal(0.0, SpriteRotation(testSprite));
            SpriteSetRotation(testSprite, 45.0f);
            Assert.Equal(45.0, SpriteRotation(testSprite));
        }
        [Fact]
        public void TestSpriteScaleIntegration() {
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            using var cleanupBitmap = new BitmapCleanup();
            var testSprite = CreateSprite("test_sprite", testBitmap);
            using var cleanupSprite = new SpriteCleanup();
            Assert.Equal(1.0f, SpriteScale(testSprite));
            SpriteSetScale(testSprite, 2.0f);
            Assert.Equal(2.0f, SpriteScale(testSprite));
        }
        [Fact]
        public void TestSpriteScreenRectangleIntegration() {
            var testWindow = OpenWindow("Test Window", 800, 600);
            using var cleanupWindow = new WindowCleanup();
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            using var cleanupBitmap = new BitmapCleanup();
            var testAnimation = LoadAnimationScript("test_animation", "kermit.txt");
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
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            using var cleanupBitmap = new BitmapCleanup();
            var testSprite = CreateSprite("test_sprite", testBitmap);
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
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            using var cleanupBitmap = new BitmapCleanup();
            var testSprite = CreateSprite("test_sprite", testBitmap);
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
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            using var cleanupBitmap = new BitmapCleanup();
            var testSprite = CreateSprite("test_sprite", testBitmap);
            using var cleanupSprite = new SpriteCleanup();
            Assert.Equal(PointAt(50.0, 50.0), SpriteAnchorPoint(testSprite));
            SpriteSetAnchorPoint(testSprite, PointAt(25.0, 25.0));
            Assert.Equal(PointAt(25.0, 25.0), SpriteAnchorPoint(testSprite));
        }
        [Fact]
        public void TestSpriteSetCollisionBitmapIntegration() {
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            using var cleanupBitmap = new BitmapCleanup();
            var testSprite = CreateSprite("test_sprite", testBitmap);
            using var cleanupSprite = new SpriteCleanup();
            Assert.Equal(testBitmap, SpriteCollisionBitmap(testSprite));
            var newBitmap = CreateBitmap("new_bitmap", 200, 200);
            SpriteSetCollisionBitmap(testSprite, newBitmap);
            Assert.Equal(newBitmap, SpriteCollisionBitmap(testSprite));
        }
        [Fact]
        public void TestSpriteSetCollisionKindIntegration() {
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            using var cleanupBitmap = new BitmapCleanup();
            var testSprite = CreateSprite("test_sprite", testBitmap);
            using var cleanupSprite = new SpriteCleanup();
            Assert.Equal(CollisionTestKind.PixelCollisions, SpriteCollisionKind(testSprite));
            SpriteSetCollisionKind(testSprite, CollisionTestKind.AabbCollisions);
            Assert.Equal(CollisionTestKind.AabbCollisions, SpriteCollisionKind(testSprite));
        }
        [Fact]
        public void TestSpriteSetDxIntegration() {
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            using var cleanupBitmap = new BitmapCleanup();
            var testSprite = CreateSprite("test_sprite", testBitmap);
            using var cleanupSprite = new SpriteCleanup();
            Assert.Equal(0.0, SpriteDx(testSprite));
            SpriteSetDx(testSprite, 5.0f);
            Assert.Equal(5.0, SpriteDx(testSprite));
        }
        [Fact]
        public void TestSpriteSetDyIntegration() {
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            using var cleanupBitmap = new BitmapCleanup();
            var testSprite = CreateSprite("test_sprite", testBitmap);
            using var cleanupSprite = new SpriteCleanup();
            Assert.Equal(0.0, SpriteDy(testSprite));
            SpriteSetDy(testSprite, 5.0f);
            Assert.Equal(5.0, SpriteDy(testSprite));
        }
        [Fact]
        public void TestSpriteSetHeadingIntegration() {
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            using var cleanupBitmap = new BitmapCleanup();
            var testSprite = CreateSprite("test_sprite", testBitmap);
            using var cleanupSprite = new SpriteCleanup();
            SpriteSetVelocity(testSprite, VectorFromAngle(90.0, 1.0));
            Assert.Equal(90.0, SpriteHeading(testSprite));
            SpriteSetHeading(testSprite, 45.0f);
            Assert.Equal(45.0, SpriteHeading(testSprite));
        }
        [Fact]
        public void TestSpriteSetLayerOffsetNamedIntegration() {
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            using var cleanupBitmap = new BitmapCleanup();
            var testSprite = CreateSprite("test_sprite", testBitmap);
            using var cleanupSprite = new SpriteCleanup();
            Assert.Equal(VectorTo(0.0, 0.0), SpriteLayerOffset(testSprite, "base_layer"));
            SpriteSetLayerOffset(testSprite, "base_layer", VectorTo(10.0, 10.0));
            Assert.Equal(VectorTo(10.0, 10.0), SpriteLayerOffset(testSprite, "base_layer"));
        }
        [Fact]
        public void TestSpriteSetLayerOffsetAtIndexIntegration() {
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            using var cleanupBitmap = new BitmapCleanup();
            var testSprite = CreateSprite("test_sprite", testBitmap);
            using var cleanupSprite = new SpriteCleanup();
            Assert.Equal(VectorTo(0.0, 0.0), SpriteLayerOffset(testSprite, 0));
            SpriteSetLayerOffset(testSprite, 0, VectorTo(10.0, 10.0));
            Assert.Equal(VectorTo(10.0, 10.0), SpriteLayerOffset(testSprite, 0));
        }
        [Fact]
        public void TestSpriteSetMassIntegration() {
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            using var cleanupBitmap = new BitmapCleanup();
            var testSprite = CreateSprite("test_sprite", testBitmap);
            using var cleanupSprite = new SpriteCleanup();
            Assert.Equal(1.0, SpriteMass(testSprite));
            SpriteSetMass(testSprite, 10.0f);
            Assert.Equal(10.0, SpriteMass(testSprite));
        }
        [Fact]
        public void TestSpriteSetMoveFromAnchorPointIntegration() {
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            using var cleanupBitmap = new BitmapCleanup();
            var testSprite = CreateSprite("test_sprite", testBitmap);
            using var cleanupSprite = new SpriteCleanup();
            Assert.False(SpriteMoveFromAnchorPoint(testSprite));
            SpriteSetMoveFromAnchorPoint(testSprite, true);
            Assert.True(SpriteMoveFromAnchorPoint(testSprite));
        }
        [Fact]
        public void TestSpriteSetPositionIntegration() {
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            using var cleanupBitmap = new BitmapCleanup();
            var testSprite = CreateSprite("test_sprite", testBitmap);
            using var cleanupSprite = new SpriteCleanup();
            Assert.Equal(PointAt(0.0, 0.0), SpritePosition(testSprite));
            SpriteSetPosition(testSprite, PointAt(100.0, 100.0));
            Assert.Equal(PointAt(100.0, 100.0), SpritePosition(testSprite));
        }
        [Fact]
        public void TestSpriteSetRotationIntegration() {
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            using var cleanupBitmap = new BitmapCleanup();
            var testSprite = CreateSprite("test_sprite", testBitmap);
            using var cleanupSprite = new SpriteCleanup();
            Assert.Equal(0.0, SpriteRotation(testSprite));
            SpriteSetRotation(testSprite, 45.0f);
            Assert.Equal(45.0, SpriteRotation(testSprite));
        }
        [Fact]
        public void TestSpriteSetScaleIntegration() {
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            using var cleanupBitmap = new BitmapCleanup();
            var testSprite = CreateSprite("test_sprite", testBitmap);
            using var cleanupSprite = new SpriteCleanup();
            Assert.Equal(1.0f, SpriteScale(testSprite));
            SpriteSetScale(testSprite, 2.0f);
            Assert.Equal(2.0f, SpriteScale(testSprite));
        }
        [Fact]
        public void TestSpriteSetSpeedIntegration() {
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            using var cleanupBitmap = new BitmapCleanup();
            var testSprite = CreateSprite("test_sprite", testBitmap);
            using var cleanupSprite = new SpriteCleanup();
            SpriteSetVelocity(testSprite, VectorFromAngle(0.0, 1.0));
            SpriteSetSpeed(testSprite, 5.0f);
            Assert.Equal(5.0, SpriteSpeed(testSprite));
        }
        [Fact]
        public void TestSpriteSetValueNamedIntegration() {
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            using var cleanupBitmap = new BitmapCleanup();
            var testSprite = CreateSprite("test_sprite", testBitmap);
            using var cleanupSprite = new SpriteCleanup();
            Assert.False(SpriteHasValue(testSprite, "test_value"));
            SpriteAddValue(testSprite, "test_value", 0.0f);
            SpriteSetValue(testSprite, "test_value", 10.5f);
            Assert.Equal(10.5f, SpriteValue(testSprite, "test_value"));
        }
        [Fact]
        public void TestSpriteSetVelocityIntegration() {
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            using var cleanupBitmap = new BitmapCleanup();
            var testSprite = CreateSprite("test_sprite", testBitmap);
            using var cleanupSprite = new SpriteCleanup();
            Assert.Equal(VectorTo(0.0, 0.0), SpriteVelocity(testSprite));
            SpriteSetVelocity(testSprite, VectorTo(5.0, 5.0));
            Assert.Equal(VectorTo(5.0, 5.0), SpriteVelocity(testSprite));
        }
        [Fact]
        public void TestSpriteSetXIntegration() {
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            using var cleanupBitmap = new BitmapCleanup();
            var testSprite = CreateSprite("test_sprite", testBitmap);
            using var cleanupSprite = new SpriteCleanup();
            Assert.Equal(0.0f, SpriteX(testSprite));
            SpriteSetX(testSprite, 150.0f);
            Assert.Equal(150.0f, SpriteX(testSprite));
        }
        [Fact]
        public void TestSpriteSetYIntegration() {
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            using var cleanupBitmap = new BitmapCleanup();
            var testSprite = CreateSprite("test_sprite", testBitmap);
            using var cleanupSprite = new SpriteCleanup();
            Assert.Equal(0.0f, SpriteY(testSprite));
            SpriteSetY(testSprite, 300.0f);
            Assert.Equal(300.0f, SpriteY(testSprite));
        }
        [Fact]
        public void TestSpriteShowLayerNamedIntegration() {
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            using var cleanupBitmap = new BitmapCleanup();
            var testSprite = CreateSprite("test_sprite", testBitmap);
            using var cleanupSprite = new SpriteCleanup();
            var layerIdx = SpriteAddLayer(testSprite, testBitmap, "layer2");
            SpriteHideLayer(testSprite, "layer2");
            Assert.Equal(1, SpriteVisibleLayerCount(testSprite));
            Assert.Equal(layerIdx, SpriteShowLayer(testSprite, "layer2"));
            Assert.Equal(2, SpriteVisibleLayerCount(testSprite));
        }
        [Fact]
        public void TestSpriteShowLayerIntegration() {
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            using var cleanupBitmap = new BitmapCleanup();
            var testSprite = CreateSprite("test_sprite", testBitmap);
            using var cleanupSprite = new SpriteCleanup();
            var layerIdx = SpriteAddLayer(testSprite, testBitmap, "layer2");
            SpriteHideLayer(testSprite, layerIdx);
            Assert.Equal(1, SpriteVisibleLayerCount(testSprite));
            Assert.Equal(layerIdx, SpriteShowLayer(testSprite, layerIdx));
            Assert.Equal(2, SpriteVisibleLayerCount(testSprite));
        }
        [Fact]
        public void TestSpriteSpeedIntegration() {
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            using var cleanupBitmap = new BitmapCleanup();
            var testSprite = CreateSprite("test_sprite", testBitmap);
            using var cleanupSprite = new SpriteCleanup();
            Assert.Equal(0.0, SpriteSpeed(testSprite));
            SpriteSetVelocity(testSprite, VectorTo(3.0, 4.0));
            Assert.Equal(5.0, SpriteSpeed(testSprite));
        }
        [Fact]
        public void TestSpriteStartAnimationNamedIntegration() {
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            using var cleanupBitmap = new BitmapCleanup();
            var testAnimation = LoadAnimationScript("test_animation", "kermit.txt");
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
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            using var cleanupBitmap = new BitmapCleanup();
            var testAnimation = LoadAnimationScript("test_animation", "startup.txt");
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
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            using var cleanupBitmap = new BitmapCleanup();
            var testAnimation = LoadAnimationScript("test_animation", "kermit.txt");
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
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            using var cleanupBitmap = new BitmapCleanup();
            var testAnimation = LoadAnimationScript("test_animation", "startup.txt");
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
            var spriteDelegates = new SpriteDelegates();
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            using var cleanupBitmap = new BitmapCleanup();
            var testSprite = CreateSprite("test_sprite", testBitmap);
            using var cleanupSprite = new SpriteCleanup();
            SpriteCallOnEvent(testSprite, spriteDelegates.SpriteEventHandler);
            UpdateSprite(testSprite);
            Assert.True(spriteDelegates.EventCalled);
            SpriteStopCallingOnEvent(testSprite, spriteDelegates.SpriteEventHandler);
            spriteDelegates.Reset();
            UpdateSprite(testSprite);
            Assert.False(spriteDelegates.EventCalled);
        }
        [Fact]
        public void TestSpriteToggleLayerVisibleNamedIntegration() {
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            using var cleanupBitmap = new BitmapCleanup();
            var testSprite = CreateSprite("test_sprite", testBitmap);
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
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            using var cleanupBitmap = new BitmapCleanup();
            var testSprite = CreateSprite("test_sprite", testBitmap);
            using var cleanupSprite = new SpriteCleanup();
            var layerIdx = SpriteAddLayer(testSprite, testBitmap, "layer2");
            SpriteShowLayer(testSprite, layerIdx);
            Assert.Equal(2, SpriteVisibleLayerCount(testSprite));
            SpriteToggleLayerVisible(testSprite, layerIdx);
            Assert.Equal(1, SpriteVisibleLayerCount(testSprite));
        }
        [Fact]
        public void TestSpriteValueIntegration() {
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            using var cleanupBitmap = new BitmapCleanup();
            var testSprite = CreateSprite("test_sprite", testBitmap);
            using var cleanupSprite = new SpriteCleanup();
            Assert.Equal(3, SpriteValueCount(testSprite));
            SpriteAddValue(testSprite, "test_value", 0.0f);
            Assert.Equal(0.0f, SpriteValue(testSprite, "test_value"));
        }
        [Fact]
        public void TestSpriteValueCountIntegration() {
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            using var cleanupBitmap = new BitmapCleanup();
            var testSprite = CreateSprite("test_sprite", testBitmap);
            using var cleanupSprite = new SpriteCleanup();
            Assert.Equal(3, SpriteValueCount(testSprite));
            SpriteAddValue(testSprite, "health", 0.0f);
            SpriteAddValue(testSprite, "speed", 0.0f);
            Assert.Equal(5, SpriteValueCount(testSprite));
        }
        [Fact]
        public void TestSpriteVelocityIntegration() {
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            using var cleanupBitmap = new BitmapCleanup();
            var testSprite = CreateSprite("test_sprite", testBitmap);
            using var cleanupSprite = new SpriteCleanup();
            Assert.Equal(VectorTo(0.0, 0.0), SpriteVelocity(testSprite));
            SpriteSetVelocity(testSprite, VectorTo(5.0, 5.0));
            Assert.Equal(VectorTo(5.0, 5.0), SpriteVelocity(testSprite));
        }
        [Fact]
        public void TestSpriteVisibleIndexOfLayerNamedIntegration() {
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            using var cleanupBitmap = new BitmapCleanup();
            var testSprite = CreateSprite("test_sprite", testBitmap);
            using var cleanupSprite = new SpriteCleanup();
            Assert.Equal(0, SpriteVisibleIndexOfLayer(testSprite, "base_layer"));
            SpriteAddLayer(testSprite, testBitmap, "layer2");
            SpriteShowLayer(testSprite, "layer2");
            Assert.Equal(1, SpriteVisibleIndexOfLayer(testSprite, "layer2"));
        }
        [Fact]
        public void TestSpriteVisibleIndexOfLayerIntegration() {
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            using var cleanupBitmap = new BitmapCleanup();
            var testSprite = CreateSprite("test_sprite", testBitmap);
            using var cleanupSprite = new SpriteCleanup();
            Assert.Equal(0, SpriteVisibleIndexOfLayer(testSprite, 0));
            var layerIdx = SpriteAddLayer(testSprite, testBitmap, "layer2");
            SpriteShowLayer(testSprite, layerIdx);
            Assert.Equal(1, SpriteVisibleIndexOfLayer(testSprite, layerIdx));
        }
        [Fact]
        public void TestSpriteVisibleLayerIntegration() {
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            using var cleanupBitmap = new BitmapCleanup();
            var testSprite = CreateSprite("test_sprite", testBitmap);
            using var cleanupSprite = new SpriteCleanup();
            Assert.Equal(0, SpriteVisibleLayer(testSprite, 0));
            SpriteAddLayer(testSprite, testBitmap, "layer2");
            SpriteShowLayer(testSprite, "layer2");
            Assert.Equal(1, SpriteVisibleLayer(testSprite, 1));
        }
        [Fact]
        public void TestSpriteVisibleLayerCountIntegration() {
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            using var cleanupBitmap = new BitmapCleanup();
            var testSprite = CreateSprite("test_sprite", testBitmap);
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
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            using var cleanupBitmap = new BitmapCleanup();
            var testSprite = CreateSprite("test_sprite", testBitmap);
            using var cleanupSprite = new SpriteCleanup();
            Assert.Equal(0, SpriteVisibleLayerId(testSprite, 0));
            SpriteAddLayer(testSprite, testBitmap, "layer2");
            SpriteShowLayer(testSprite, "layer2");
            Assert.Equal(1, SpriteVisibleLayerId(testSprite, 1));
        }
        [Fact]
        public void TestSpriteWidthIntegration() {
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            using var cleanupBitmap = new BitmapCleanup();
            var testSprite = CreateSprite("test_sprite", testBitmap);
            using var cleanupSprite = new SpriteCleanup();
            Assert.Equal(1.0f, SpriteScale(testSprite));
            SpriteSetScale(testSprite, 2.0f);
            Assert.Equal(2.0f, SpriteScale(testSprite));
        }
        [Fact]
        public void TestSpriteXIntegration() {
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            using var cleanupBitmap = new BitmapCleanup();
            var testSprite = CreateSprite("test_sprite", testBitmap);
            using var cleanupSprite = new SpriteCleanup();
            Assert.Equal(0.0f, SpriteX(testSprite));
            SpriteSetX(testSprite, 150.0f);
            Assert.Equal(150.0f, SpriteX(testSprite));
        }
        [Fact]
        public void TestSpriteYIntegration() {
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            using var cleanupBitmap = new BitmapCleanup();
            var testSprite = CreateSprite("test_sprite", testBitmap);
            using var cleanupSprite = new SpriteCleanup();
            Assert.Equal(0.0f, SpriteY(testSprite));
            SpriteSetY(testSprite, 200.0f);
            Assert.Equal(200.0f, SpriteY(testSprite));
        }
        [Fact]
        public void TestStopCallingOnSpriteEventIntegration() {
            var spriteDelegates = new SpriteDelegates();
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            using var cleanupBitmap = new BitmapCleanup();
            var testSprite = CreateSprite("test_sprite", testBitmap);
            using var cleanupSprite = new SpriteCleanup();
            CallOnSpriteEvent(spriteDelegates.SpriteEventHandler);
            UpdateSprite(testSprite);
            Assert.True(spriteDelegates.EventCalled);
            StopCallingOnSpriteEvent(spriteDelegates.SpriteEventHandler);
            spriteDelegates.Reset();
            UpdateSprite(testSprite);
            Assert.False(spriteDelegates.EventCalled);
        }
        [Fact]
        public void TestUpdateAllSpritesIntegration() {
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            using var cleanupBitmap = new BitmapCleanup();
            var testSprite1 = CreateSprite("test_sprite1", testBitmap);
            using var cleanupSprite = new SpriteCleanup();
            var testSprite2 = CreateSprite("test_sprite2", testBitmap);
            SpriteSetVelocity(testSprite1, VectorTo(10.0, 10.0));
            SpriteSetVelocity(testSprite2, VectorTo(-10.0, -10.0));
            UpdateAllSprites();
            Assert.Equal(VectorTo(10.0, 10.0), SpriteVelocity(testSprite1));
            Assert.Equal(VectorTo(-10.0, -10.0), SpriteVelocity(testSprite2));
        }
        [Fact]
        public void TestUpdateAllSpritesPercentIntegration() {
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            using var cleanupBitmap = new BitmapCleanup();
            var testSprite1 = CreateSprite("test_sprite1", testBitmap);
            using var cleanupSprite = new SpriteCleanup();
            var testSprite2 = CreateSprite("test_sprite2", testBitmap);
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
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            using var cleanupBitmap = new BitmapCleanup();
            var testSprite = CreateSprite("test_sprite", testBitmap);
            using var cleanupSprite = new SpriteCleanup();
            SpriteSetVelocity(testSprite, VectorTo(10.0, 10.0));
            var initialPos = SpritePosition(testSprite);
            UpdateSprite(testSprite);
            Assert.NotEqual(initialPos, SpritePosition(testSprite));
        }
        [Fact]
        public void TestUpdateSpriteWithSoundIntegration() {
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            using var cleanupBitmap = new BitmapCleanup();
            var testAnimation = LoadAnimationScript("test_animation", "startup.txt");
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
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            using var cleanupBitmap = new BitmapCleanup();
            var testSprite = CreateSprite("test_sprite", testBitmap);
            using var cleanupSprite = new SpriteCleanup();
            SpriteSetVelocity(testSprite, VectorTo(100.0, 100.0));
            UpdateSprite(testSprite, 0.5f);
            Assert.Equal(50.0f, SpriteX(testSprite));
            Assert.Equal(50.0f, SpriteY(testSprite));
        }
        [Fact]
        public void TestUpdateSpritePercentWithSoundIntegration() {
            var testAnimation = LoadAnimationScript("startup", "startup.txt");
            using var cleanupAnimationScript = new AnimationScriptCleanup();
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
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
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            using var cleanupBitmap = new BitmapCleanup();
            var testAnimation = LoadAnimationScript("test_animation", "kermit.txt");
            using var cleanupAnimationScript = new AnimationScriptCleanup();
            var testSprite = CreateSprite("test_sprite", testBitmap, testAnimation);
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
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            using var cleanupBitmap = new BitmapCleanup();
            var testAnimation = LoadAnimationScript("test_animation", "startup.txt");
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
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            using var cleanupBitmap = new BitmapCleanup();
            var testAnimation = LoadAnimationScript("test_animation", "startup.txt");
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
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            using var cleanupBitmap = new BitmapCleanup();
            var testAnimation = LoadAnimationScript("test_animation", "startup.txt");
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
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            using var cleanupBitmap = new BitmapCleanup();
            var testSprite = CreateSprite("test_sprite", testBitmap);
            using var cleanupSprite = new SpriteCleanup();
            SpriteSetPosition(testSprite, PointAt(0.0, 0.0));
            var targetPoint = PointAt(150.0, 150.0);
            var vector = VectorFromCenterSpriteToPoint(testSprite, targetPoint);
            Assert.Equal(100.0, vector.X);
            Assert.Equal(100.0, vector.Y);
        }
        [Fact]
        public void TestVectorFromToIntegration() {
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            using var cleanupBitmap = new BitmapCleanup();
            var testSprite1 = CreateSprite("test_sprite1", testBitmap);
            using var cleanupSprite = new SpriteCleanup();
            var testSprite2 = CreateSprite("test_sprite2", testBitmap);
            SpriteSetPosition(testSprite1, PointAt(0.0, 0.0));
            SpriteSetPosition(testSprite2, PointAt(100.0, 100.0));
            var vector = VectorFromTo(testSprite1, testSprite2);
            Assert.Equal(100.0, vector.X);
            Assert.Equal(100.0, vector.Y);
        }
    }
}
