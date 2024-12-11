using Xunit;
using static SplashKitSDK.SplashKit;

namespace SplashKitTests
{
    public class TestSprites
    {
        [Fact]
        public void TestCallForAllSpritesWithValueIntegration()
        {
            var helper = new Helper();
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testSprite1 = CreateSprite(testBitmap);
            var testSprite2 = CreateSprite(testBitmap);
            SpriteSetX(testSprite1, 100);
            SpriteSetX(testSprite2, 200);
            CallForAllSpritesWithValue(helper.Spritefloatfunction, 300);
            Assert.Equal(300, SpriteX(testSprite1));
            Assert.Equal(300, SpriteX(testSprite2));
            FreeAllSprites();
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestCallForAllSpritesIntegration()
        {
            var helper = new Helper();
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testSprite1 = CreateSprite(testBitmap);
            var testSprite2 = CreateSprite(testBitmap);
            SpriteSetPosition(testSprite1, PointAt(100, 100));
            SpriteSetPosition(testSprite2, PointAt(200, 200));
            CallForAllSprites(helper.Spritefunction);
            Assert.Equal(300, SpriteX(testSprite1));
            Assert.Equal(300, SpriteX(testSprite2));
            FreeAllSprites();
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestCallOnSpriteEventIntegration()
        {
            var helper = new Helper();
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testSprite = CreateSprite("test_sprite", testBitmap);
            CallOnSpriteEvent(helper.Sprite_event_handler);
            SpriteStartAnimation(testSprite, "test");
            UpdateSprite(testSprite);
            Assert.True(helper.Event_called);
            FreeSprite(testSprite);
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestCenterPointIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testSprite = CreateSprite(testBitmap);
            SpriteSetPosition(testSprite, PointAt(100, 100));
            var centerPoint = CenterPoint(testSprite);
            Assert.Equal(150, centerpoint.X);
            Assert.Equal(150, centerpoint.Y);
            FreeSprite(testSprite);
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestCreateSpriteIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testSprite = CreateSprite(testBitmap);
            Assert.NotNull(testSprite);
            Assert.True(HasSprite(SpriteName(testSprite)));
            FreeSprite(testSprite);
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestCreateSpriteWithAnimationIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testAnimation = LoadAnimationScript("test_animation", "kermit.txt");
            var testSprite = CreateSpriteWithAnimation(testBitmap, testAnimation);
            Assert.NotNull(testSprite);
            Assert.True(HasSprite(SpriteName(testSprite)));
            FreeSprite(testSprite);
            FreeBitmap(testBitmap);
            FreeAnimationScript(testAnimation);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestCreateSpriteWithBitmapNamedIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testSprite = CreateSpriteWithBitmapNamed("test_bitmap");
            Assert.NotNull(testSprite);
            Assert.True(HasSprite(SpriteName(testSprite)));
            FreeSprite(testSprite);
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestCreateSpriteNamedIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testSprite = CreateSpriteNamed("test_sprite", testBitmap);
            Assert.NotNull(testSprite);
            Assert.Equal("test_sprite", SpriteName(testSprite));
            FreeSprite(testSprite);
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestCreateSpriteNamedWithAnimationIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testAnimation = LoadAnimationScript("test_animation", "kermit.txt");
            var testSprite = CreateSpriteNamedWithAnimation("test_sprite", testBitmap, testAnimation);
            Assert.NotNull(testSprite);
            Assert.Equal("test_sprite", SpriteName(testSprite));
            FreeSprite(testSprite);
            FreeBitmap(testBitmap);
            FreeAnimationScript(testAnimation);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestCreateSpriteWithBitmapAndAnimationNamedIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testAnimation = LoadAnimationScript("test_animation", "kermit.txt");
            var testSprite = CreateSpriteWithBitmapAndAnimationNamed("test_bitmap", "test_animation");
            Assert.NotNull(testSprite);
            Assert.True(HasSprite(SpriteName(testSprite)));
            FreeSprite(testSprite);
            FreeBitmap(testBitmap);
            FreeAnimationScript(testAnimation);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestCreateSpritePackIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            Assert.False(HasSpritePack("test_pack"));
            CreateSpritePack("test_pack");
            Assert.True(HasSpritePack("test_pack"));
            FreeSpritePack("test_pack");
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestCurrentSpritePackIntegration()
        {
            Assert.Equal("default", CurrentSpritePack());
            CreateSpritePack("test_pack");
            SelectSpritePack("test_pack");
            Assert.Equal("test_pack", CurrentSpritePack());
            SelectSpritePack("default");
            Assert.Equal("default", CurrentSpritePack());
            FreeSpritePack("test_pack");
        }
        [Fact]
        public void TestDrawAllSpritesIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            ClearBitmap(testBitmap, ColorBlack());
            var testSprite1 = CreateSprite(testBitmap);
            var testSprite2 = CreateSprite(testBitmap);
            SpriteSetPosition(testSprite1, PointAt(100, 100));
            SpriteSetPosition(testSprite2, PointAt(200, 200));
            ClearScreen(ColorWhite());
            DrawAllSprites();
            RefreshScreen();
            Assert.Equal(ColorBlack(), GetPixel(testWindow, 100, 100));
            Assert.Equal(ColorBlack(), GetPixel(testWindow, 200, 200));
            FreeAllSprites();
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestDrawSpriteOffsetByIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            ClearBitmap(testBitmap, ColorBlack());
            var testSprite = CreateSprite(testBitmap);
            SpriteSetPosition(testSprite, PointAt(400, 300));
            ClearScreen(ColorWhite());
            DrawSpriteOffsetBy(testSprite, VectorFromAngle(50, 50));
            RefreshScreen();
            Assert.NotEqual(ColorWhite(), GetPixel(testWindow, 450, 350));
            FreeSprite(testSprite);
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestDrawSpriteIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            ClearBitmap(testBitmap, ColorBlack());
            var testSprite = CreateSprite("test_sprite", testBitmap);
            SpriteSetPosition(testSprite, PointAt(400, 300));
            ClearScreen(ColorWhite());
            DrawSprite(testSprite);
            RefreshScreen();
            Assert.Equal(ColorBlack(), GetPixel(testWindow, 400, 300));
            FreeSprite(testSprite);
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestDrawSpriteOffsetXYIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            ClearBitmap(testBitmap, ColorBlack());
            var testSprite = CreateSprite(testBitmap);
            SpriteSetPosition(testSprite, PointAt(400, 300));
            ClearScreen(ColorWhite());
            DrawSpriteOffsetXY(testSprite, 50.0, 50.0);
            RefreshScreen();
            Assert.NotEqual(ColorWhite(), GetPixel(testWindow, 450, 350));
            FreeSprite(testSprite);
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestFreeAllSpritesIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testSprite1 = CreateSprite("test_sprite1", testBitmap);
            var testSprite2 = CreateSprite("test_sprite2", testBitmap);
            Assert.True(HasSprite("test_sprite1"));
            Assert.True(HasSprite("test_sprite2"));
            FreeAllSprites();
            Assert.False(HasSprite("test_sprite1"));
            Assert.False(HasSprite("test_sprite2"));
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestFreeSpriteIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testSprite = CreateSprite("test_sprite", testBitmap);
            Assert.True(HasSprite("test_sprite"));
            FreeSprite(testSprite);
            Assert.False(HasSprite("test_sprite"));
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestFreeSpritePackIntegration()
        {
            Assert.True(HasSpritePack("default"));
            CreateSpritePack("test_pack");
            Assert.True(HasSpritePack("test_pack"));
            FreeSpritePack("test_pack");
            Assert.False(HasSpritePack("test_pack"));
            Assert.True(HasSpritePack("default"));
        }
        [Fact]
        public void TestHasSpriteIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            Assert.False(HasSprite("test_sprite"));
            var testSprite = CreateSprite("test_sprite", testBitmap);
            Assert.True(HasSprite("test_sprite"));
            FreeSprite(testSprite);
            Assert.False(HasSprite("test_sprite"));
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestHasSpritePackIntegration()
        {
            Assert.False(HasSpritePack("test_pack"));
            CreateSpritePack("test_pack");
            Assert.True(HasSpritePack("test_pack"));
            FreeSpritePack("test_pack");
            Assert.False(HasSpritePack("test_pack"));
        }
        [Fact]
        public void TestMoveSpriteIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testSprite = CreateSprite("test_sprite", testBitmap);
            var startPosition = PointAt(100.0, 100.0);
            SpriteSetPosition(testSprite, startPosition);
            SpriteSetVelocity(testSprite, VectorTo(10.0, 10.0));
            MoveSprite(testSprite, 1.0);
            Assert.Equal(110.0, SpriteX(testSprite));
            Assert.Equal(110.0, SpriteY(testSprite));
            FreeSprite(testSprite);
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestMoveSpriteByVectorIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testSprite = CreateSprite("test_sprite", testBitmap);
            SpriteSetPosition(testSprite, PointAt(100, 100));
            MoveSpriteByVector(testSprite, VectorTo(50, 50), 1.0);
            Assert.Equal(150, SpriteX(testSprite));
            Assert.Equal(150, SpriteY(testSprite));
            FreeSprite(testSprite);
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestMoveSpriteByVectorPercentIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testSprite = CreateSprite("test_sprite", testBitmap);
            SpriteSetPosition(testSprite, PointAt(100.0, 100.0));
            MoveSpriteByVectorPercent(testSprite, VectorTo(50.0, 50.0), 0.5);
            Assert.Equal(125.0, SpriteX(testSprite));
            Assert.Equal(125.0, SpriteY(testSprite));
            FreeSprite(testSprite);
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestMoveSpritePercentIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testSprite = CreateSprite("test_sprite", testBitmap);
            SpriteSetPosition(testSprite, PointAt(100.0, 100.0));
            SpriteSetVelocity(testSprite, VectorTo(10.0, 10.0));
            MoveSpritePercent(testSprite, 0.5);
            Assert.Equal(105.0, SpriteX(testSprite));
            Assert.Equal(105.0, SpriteY(testSprite));
            FreeSprite(testSprite);
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestMoveSpriteToIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testSprite = CreateSprite("test_sprite", testBitmap);
            MoveSpriteTo(testSprite, 400.0, 300.0);
            Assert.Equal(400.0, SpriteX(testSprite));
            Assert.Equal(300.0, SpriteY(testSprite));
            FreeSprite(testSprite);
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestSelectSpritePackIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            CreateSpritePack("test_pack");
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testSprite = CreateSprite("test_sprite", testBitmap);
            Assert.Equal("default", CurrentSpritePack());
            SelectSpritePack("test_pack");
            Assert.Equal("test_pack", CurrentSpritePack());
            FreeSprite(testSprite);
            FreeBitmap(testBitmap);
            FreeSpritePack("test_pack");
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestSpriteAddLayerIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testSprite = CreateSprite("test_sprite", testBitmap);
            var newLayerBitmap = CreateBitmap("new_layer", 50, 50);
            var layerIndex = SpriteAddLayer(testSprite, newLayerBitmap, "new_layer");
            Assert.Equal(1, layerIndex);
            Assert.Equal(2, SpriteLayerCount(testSprite));
            FreeSprite(testSprite);
            FreeBitmap(testBitmap);
            FreeBitmap(newLayerBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestSpriteAddToVelocityIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testSprite = CreateSprite("test_sprite", testBitmap);
            SpriteSetVelocity(testSprite, VectorTo(0, 0));
            SpriteAddToVelocity(testSprite, VectorTo(10, 10));
            var velocity = SpriteVelocity(testSprite);
            Assert.Equal(10.0, velocity.X);
            Assert.Equal(10.0, velocity.Y);
            FreeSprite(testSprite);
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestSpriteAddValueIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testSprite = CreateSprite("test_sprite", testBitmap);
            SpriteAddValue(testSprite, "health", 100);
            Assert.True(SpriteHasValue(testSprite, "health"));
            Assert.Equal(100, SpriteValue(testSprite, "health"));
            FreeSprite(testSprite);
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestSpriteAddValueWithDefaultIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testSprite = CreateSprite("test_sprite", testBitmap);
            SpriteAddValueWithDefault(testSprite, "health", 100.0);
            Assert.True(SpriteHasValue(testSprite, "health"));
            Assert.Equal(100.0, SpriteValue(testSprite, "health"));
            FreeSprite(testSprite);
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestSpriteAnchorPointIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testSprite = CreateSprite("test_sprite", testBitmap);
            var anchorPoint = SpriteAnchorPoint(testSprite);
            Assert.Equal(50, anchorpoint.X);
            Assert.Equal(50, anchorpoint.Y);
            FreeSprite(testSprite);
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestSpriteAnchorPositionIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testSprite = CreateSprite("test_sprite", testBitmap);
            SpriteSetPosition(testSprite, PointAt(100, 100));
            var anchorPosition = SpriteAnchorPosition(testSprite);
            Assert.Equal(150, anchorposition.X);
            Assert.Equal(150, anchorposition.Y);
            FreeSprite(testSprite);
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestSpriteAnimationHasEndedIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testAnimation = LoadAnimationScript("test_animation", "kermit.txt");
            var testSprite = CreateSprite("test_sprite", testBitmap, testAnimation);
            SpriteStartAnimation(testSprite, "walkfront");
            Assert.False(SpriteAnimationHasEnded(testSprite));
            UpdateSpriteAnimation(testSprite, 100);
            Assert.True(SpriteAnimationHasEnded(testSprite));
            FreeSprite(testSprite);
            FreeBitmap(testBitmap);
            FreeAnimationScript(testAnimation);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestSpriteAnimationNameIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testAnimation = LoadAnimationScript("test_animation", "kermit.txt");
            var testSprite = CreateSprite("test_sprite", testBitmap, testAnimation);
            SpriteStartAnimation(testSprite, "walkfront");
            Assert.Equal("walkfront", SpriteAnimationName(testSprite));
            FreeSprite(testSprite);
            FreeBitmap(testBitmap);
            FreeAnimationScript(testAnimation);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestSpriteAtIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            ClearBitmap(testBitmap, ColorRed());
            var testSprite = CreateSprite("test_sprite", testBitmap);
            SpriteSetX(testSprite, 400);
            SpriteSetY(testSprite, 300);
            DrawSprite(testSprite);
            Assert.True(SpriteAt(testSprite, PointAt(400, 300)));
            Assert.False(SpriteAt(testSprite, PointAt(600, 500)));
            FreeSprite(testSprite);
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestSpriteBringLayerForwardIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testSprite = CreateSprite("test_sprite", testBitmap);
            var layerIndex = SpriteAddLayer(testSprite, testBitmap, "layer2");
            SpriteShowLayer(testSprite, layerIndex);
            var visibleIndex = SpriteVisibleIndexOfLayer(testSprite, layerIndex);
            SpriteBringLayerForward(testSprite, visibleIndex);
            Assert.Equal(0, SpriteVisibleIndexOfLayer(testSprite, layerIndex));
            FreeSprite(testSprite);
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestSpriteBringLayerToFrontIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testSprite = CreateSprite("test_sprite", testBitmap);
            var layerIndex = SpriteAddLayer(testSprite, testBitmap, "layer2");
            SpriteShowLayer(testSprite, layerIndex);
            var visibleIndex = SpriteVisibleIndexOfLayer(testSprite, layerIndex);
            SpriteBringLayerToFront(testSprite, visibleIndex);
            Assert.Equal(0, SpriteVisibleIndexOfLayer(testSprite, "layer2"));
            FreeSprite(testSprite);
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestSpriteCallOnEventIntegration()
        {
            var helper = new Helper();
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testSprite = CreateSprite("test_sprite", testBitmap);
            SpriteCallOnEvent(testSprite, helper.Sprite_event_handler);
            SpriteStartAnimation(testSprite, "test");
            UpdateSprite(testSprite);
            Assert.True(helper.Event_called);
            FreeSprite(testSprite);
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestSpriteCircleIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testSprite = CreateSprite("test_sprite", testBitmap);
            var circle = SpriteCircle(testSprite);
            Assert.Equal(50, circle.Center.x);
            Assert.Equal(50, circle.Center.y);
            Assert.Equal(50, circle.Radius);
            FreeSprite(testSprite);
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestSpriteCollisionBitmapIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testSprite = CreateSprite("test_sprite", testBitmap);
            var collisionBitmap = SpriteCollisionBitmap(testSprite);
            Assert.Equal(testBitmap, collisionBitmap);
            FreeSprite(testSprite);
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestSpriteCollisionCircleIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testSprite = CreateSprite("test_sprite", testBitmap);
            var circle = SpriteCollisionCircle(testSprite);
            Assert.Equal(50, circle.Center.x);
            Assert.Equal(50, circle.Center.y);
            Assert.Equal(50, circle.Radius);
            FreeSprite(testSprite);
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestSpriteCollisionKindIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testSprite = CreateSprite("test_sprite", testBitmap);
            Assert.Equal(CollisionTestKind.PixelCollisions, SpriteCollisionKind(testSprite));
            SpriteSetCollisionKind(testSprite, CollisionTestKind.AabbCollisions);
            Assert.Equal(CollisionTestKind.AabbCollisions, SpriteCollisionKind(testSprite));
            FreeSprite(testSprite);
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestSpriteCollisionRectangleIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testSprite = CreateSprite("test_sprite", testBitmap);
            var rect = SpriteCollisionRectangle(testSprite);
            Assert.Equal(0, rect.X);
            Assert.Equal(0, rect.Y);
            Assert.Equal(100, rect.Width);
            Assert.Equal(100, rect.Height);
            FreeSprite(testSprite);
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestSpriteCurrentCellIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testAnimation = LoadAnimationScript("test_animation", "kermit.txt");
            var testSprite = CreateSprite("test_sprite", testBitmap, testAnimation);
            SpriteStartAnimation(testSprite, "test_animation");
            Assert.Equal(0, SpriteCurrentCell(testSprite));
            FreeSprite(testSprite);
            FreeBitmap(testBitmap);
            FreeAnimationScript(testAnimation);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestSpriteCurrentCellRectangleIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testSprite = CreateSprite("test_sprite", testBitmap);
            var rect = SpriteCurrentCellRectangle(testSprite);
            Assert.Equal(0, rect.X);
            Assert.Equal(0, rect.Y);
            Assert.Equal(100, rect.Width);
            Assert.Equal(100, rect.Height);
            FreeSprite(testSprite);
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestSpriteDxIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testSprite = CreateSprite("test_sprite", testBitmap);
            Assert.Equal(0.0, SpriteDx(testSprite));
            SpriteSetDx(testSprite, 5.0);
            Assert.Equal(5.0, SpriteDx(testSprite));
            FreeSprite(testSprite);
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestSpriteDyIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testSprite = CreateSprite("test_sprite", testBitmap);
            Assert.Equal(0.0, SpriteDy(testSprite));
            SpriteSetDy(testSprite, 5.0);
            Assert.Equal(5.0, SpriteDy(testSprite));
            FreeSprite(testSprite);
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestSpriteHasValueIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testSprite = CreateSprite("test_sprite", testBitmap);
            Assert.False(SpriteHasValue(testSprite, "health"));
            SpriteAddValue(testSprite, "health", 100);
            Assert.True(SpriteHasValue(testSprite, "health"));
            Assert.False(SpriteHasValue(testSprite, "mana"));
            FreeSprite(testSprite);
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestSpriteHeadingIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testSprite = CreateSprite("test_sprite", testBitmap);
            Assert.Equal(90.0, SpriteHeading(testSprite));
            SpriteSetVelocity(testSprite, VectorTo(1.0, 1.0));
            Assert.Equal(45.0, SpriteHeading(testSprite));
            FreeSprite(testSprite);
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestSpriteHeightIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testSprite = CreateSprite("test_sprite", testBitmap);
            Assert.Equal(100, SpriteHeight(testSprite));
            SpriteSetScale(testSprite, 2.0);
            Assert.Equal(100, SpriteHeight(testSprite));
            FreeSprite(testSprite);
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestSpriteHideLayerNamedIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testSprite = CreateSprite("test_sprite", testBitmap);
            SpriteAddLayer(testSprite, testBitmap, "layer2");
            SpriteShowLayer(testSprite, "layer2");
            Assert.Equal(2, SpriteVisibleLayerCount(testSprite));
            SpriteHideLayerNamed(testSprite, "layer2");
            Assert.Equal(1, SpriteVisibleLayerCount(testSprite));
            FreeSprite(testSprite);
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestSpriteHideLayerIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testSprite = CreateSprite("test_sprite", testBitmap);
            var layerIdx = SpriteAddLayer(testSprite, testBitmap, "layer2");
            SpriteShowLayer(testSprite, layerIdx);
            Assert.Equal(2, SpriteVisibleLayerCount(testSprite));
            SpriteHideLayer(testSprite, layerIdx);
            Assert.Equal(1, SpriteVisibleLayerCount(testSprite));
            FreeSprite(testSprite);
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestSpriteLayerNamedIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testSprite = CreateSprite("test_sprite", testBitmap);
            SpriteAddLayer(testSprite, testBitmap, "layer2");
            Assert.Equal(testBitmap, SpriteLayerNamed(testSprite, "layer2"));
            FreeSprite(testSprite);
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestSpriteLayerAtIndexIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testSprite = CreateSprite("test_sprite", testBitmap);
            var layerIdx = SpriteAddLayer(testSprite, testBitmap, "layer2");
            Assert.Equal(testBitmap, SpriteLayerAtIndex(testSprite, layerIdx));
            FreeSprite(testSprite);
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestSpriteLayerCircleNamedIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testSprite = CreateSprite("test_sprite", testBitmap);
            var circle = SpriteLayerCircleNamed(testSprite, "base_layer");
            Assert.Equal(50, circle.Center.x);
            Assert.Equal(50, circle.Center.y);
            Assert.Equal(50, circle.Radius);
            FreeSprite(testSprite);
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestSpriteLayerCircleAtIndexIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testSprite = CreateSprite("test_sprite", testBitmap);
            var circle = SpriteLayerCircleAtIndex(testSprite, 0);
            Assert.Equal(50, circle.Center.x);
            Assert.Equal(50, circle.Center.y);
            Assert.Equal(50, circle.Radius);
            FreeSprite(testSprite);
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestSpriteLayerCountIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testSprite = CreateSprite("test_sprite", testBitmap);
            Assert.Equal(1, SpriteLayerCount(testSprite));
            var layerIdx = SpriteAddLayer(testSprite, testBitmap, "layer2");
            Assert.Equal(2, SpriteLayerCount(testSprite));
            Assert.Equal(1, layerIdx);
            FreeSprite(testSprite);
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestSpriteLayerHeightNamedIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testSprite = CreateSprite("test_sprite", testBitmap);
            Assert.Equal(100, SpriteLayerHeightNamed(testSprite, "base_layer"));
            var layerIdx = SpriteAddLayer(testSprite, testBitmap, "layer2");
            Assert.Equal(100, SpriteLayerHeightNamed(testSprite, "layer2"));
            FreeSprite(testSprite);
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestSpriteLayerHeightIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testSprite = CreateSprite("test_sprite", testBitmap);
            Assert.Equal(100, SpriteLayerHeight(testSprite, 0));
            var layerIdx = SpriteAddLayer(testSprite, testBitmap, "layer2");
            Assert.Equal(100, SpriteLayerHeight(testSprite, layerIdx));
            FreeSprite(testSprite);
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestSpriteLayerIndexIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testSprite = CreateSprite("test_sprite", testBitmap);
            Assert.Equal(0, SpriteLayerIndex(testSprite, "base_layer"));
            var layerIdx = SpriteAddLayer(testSprite, testBitmap, "layer2");
            Assert.Equal(layerIdx, SpriteLayerIndex(testSprite, "layer2"));
            FreeSprite(testSprite);
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestSpriteLayerNameIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testSprite = CreateSprite("test_sprite", testBitmap);
            var layerIdx = SpriteAddLayer(testSprite, testBitmap, "layer2");
            Assert.Equal("layer2", SpriteLayerName(testSprite, layerIdx));
            FreeSprite(testSprite);
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestSpriteLayerOffsetNamedIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testSprite = CreateSprite("test_sprite", testBitmap);
            Assert.Equal(VectorTo(0, 0), SpriteLayerOffsetNamed(testSprite, "base_layer"));
            SpriteSetLayerOffsetNamed(testSprite, "base_layer", VectorTo(10, 10));
            Assert.Equal(VectorTo(10, 10), SpriteLayerOffsetNamed(testSprite, "base_layer"));
            FreeSprite(testSprite);
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestSpriteLayerOffsetIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testSprite = CreateSprite("test_sprite", testBitmap);
            Assert.Equal(VectorTo(0, 0), SpriteLayerOffset(testSprite, 0));
            var layerIdx = SpriteAddLayer(testSprite, testBitmap, "layer2");
            SpriteSetLayerOffsetAtIndex(testSprite, layerIdx, VectorTo(10, 10));
            Assert.Equal(VectorTo(10, 10), SpriteLayerOffset(testSprite, layerIdx));
            FreeSprite(testSprite);
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestSpriteLayerRectangleNamedIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testSprite = CreateSprite("test_sprite", testBitmap);
            var rect = SpriteLayerRectangleNamed(testSprite, "base_layer");
            Assert.Equal(0, rect.X);
            Assert.Equal(0, rect.Y);
            Assert.Equal(100, rect.Width);
            Assert.Equal(100, rect.Height);
            FreeSprite(testSprite);
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestSpriteLayerRectangleAtIndexIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testSprite = CreateSprite("test_sprite", testBitmap);
            var rect = SpriteLayerRectangleAtIndex(testSprite, 0);
            Assert.Equal(0, rect.X);
            Assert.Equal(0, rect.Y);
            Assert.Equal(100, rect.Width);
            Assert.Equal(100, rect.Height);
            FreeSprite(testSprite);
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestSpriteLayerWidthNamedIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testSprite = CreateSprite("test_sprite", testBitmap);
            Assert.Equal(100, SpriteLayerWidthNamed(testSprite, "base_layer"));
            var layerIdx = SpriteAddLayer(testSprite, testBitmap, "layer2");
            Assert.Equal(100, SpriteLayerWidthNamed(testSprite, "layer2"));
            FreeSprite(testSprite);
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestSpriteLayerWidthIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testSprite = CreateSprite("test_sprite", testBitmap);
            Assert.Equal(100, SpriteLayerWidth(testSprite, 0));
            var layerIdx = SpriteAddLayer(testSprite, testBitmap, "layer2");
            Assert.Equal(100, SpriteLayerWidth(testSprite, layerIdx));
            FreeSprite(testSprite);
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestSpriteLocationMatrixIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testSprite = CreateSprite("test_sprite", testBitmap);
            SpriteSetPosition(testSprite, PointAt(100, 100));
            SpriteSetRotation(testSprite, 45);
            var matrix = SpriteLocationMatrix(testSprite);
            Assert.Equal(150.0, {:value_type=>"matrix_access", :variable_name=>"matrix", :field=>"elements", :row=>0, :col=>2});
            Assert.Equal(1, {:value_type=>"matrix_access", :variable_name=>"matrix", :field=>"elements", :row=>2, :col=>2});
            FreeSprite(testSprite);
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestSpriteMassIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testSprite = CreateSprite("test_sprite", testBitmap);
            Assert.Equal(1.0, SpriteMass(testSprite));
            SpriteSetMass(testSprite, 10.0);
            Assert.Equal(10.0, SpriteMass(testSprite));
            FreeSprite(testSprite);
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestSpriteMoveFromAnchorPointIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testSprite = CreateSprite("test_sprite", testBitmap);
            Assert.False(SpriteMoveFromAnchorPoint(testSprite));
            SpriteSetMoveFromAnchorPoint(testSprite, true);
            Assert.True(SpriteMoveFromAnchorPoint(testSprite));
            FreeSprite(testSprite);
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestSpriteMoveToTakingSecondsIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testSprite = CreateSprite("test_sprite", testBitmap);
            SpriteSetPosition(testSprite, PointAt(100, 100));
            SpriteMoveToTakingSeconds(testSprite, PointAt(200, 200), 1.0);
            UpdateSprite(testSprite);
            var position = SpritePosition(testSprite);
            FreeSprite(testSprite);
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestSpriteNameIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testSprite = CreateSprite("test_sprite", testBitmap);
            Assert.Equal("test_sprite", SpriteName(testSprite));
            FreeSprite(testSprite);
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestSpriteNamedIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testSprite = CreateSprite("test_sprite", testBitmap);
            Assert.Equal(testSprite, SpriteNamed("test_sprite"));
            Assert.Null(SpriteNamed("non_existent_sprite"));
            FreeSprite(testSprite);
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestSpriteOffscreenIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testSprite = CreateSprite("test_sprite", testBitmap);
            SpriteSetPosition(testSprite, PointAt(400, 300));
            Assert.False(SpriteOffscreen(testSprite));
            SpriteSetPosition(testSprite, PointAt(-200, -200));
            Assert.True(SpriteOffscreen(testSprite));
            FreeSprite(testSprite);
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestSpriteOnScreenAtPointIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testSprite = CreateSprite("test_sprite", testBitmap);
            SpriteSetPosition(testSprite, PointAt(400, 300));
            Assert.True(SpriteOnScreenAtPoint(testSprite, PointAt(400, 300)));
            Assert.False(SpriteOnScreenAtPoint(testSprite, PointAt(0, 0)));
            FreeSprite(testSprite);
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestSpriteOnScreenAtIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testSprite = CreateSprite("test_sprite", testBitmap);
            SpriteSetPosition(testSprite, PointAt(400, 300));
            Assert.True(SpriteOnScreenAt(testSprite, 400, 300));
            Assert.False(SpriteOnScreenAt(testSprite, 0, 0));
            FreeSprite(testSprite);
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestSpritePositionIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testSprite = CreateSprite("test_sprite", testBitmap);
            Assert.Equal(PointAt(0, 0), SpritePosition(testSprite));
            SpriteSetPosition(testSprite, PointAt(400, 300));
            Assert.Equal(PointAt(400, 300), SpritePosition(testSprite));
            FreeSprite(testSprite);
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestSpriteReplayAnimationIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testAnimation = LoadAnimationScript("test_animation", "kermit.txt");
            var testSprite = CreateSprite(testBitmap, testAnimation);
            SpriteStartAnimation(testSprite, "walkfront");
            Assert.False(SpriteAnimationHasEnded(testSprite));
            UpdateSprite(testSprite, 100);
            SpriteReplayAnimation(testSprite);
            Assert.False(SpriteAnimationHasEnded(testSprite));
            FreeSprite(testSprite);
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestSpriteReplayAnimationWithSoundIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testAnimation = LoadAnimationScript("test_animation", "kermit.txt");
            var testSprite = CreateSprite(testBitmap, testAnimation);
            SpriteStartAnimation(testSprite, "walkfront");
            Assert.False(SpriteAnimationHasEnded(testSprite));
            UpdateSprite(testSprite, 100);
            SpriteReplayAnimationWithSound(testSprite, true);
            Assert.False(SpriteAnimationHasEnded(testSprite));
            FreeSprite(testSprite);
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestSpriteRotationIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testSprite = CreateSprite("test_sprite", testBitmap);
            Assert.Equal(0.0, SpriteRotation(testSprite));
            SpriteSetRotation(testSprite, 45.0);
            Assert.Equal(45.0, SpriteRotation(testSprite));
            FreeSprite(testSprite);
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestSpriteScaleIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testSprite = CreateSprite("test_sprite", testBitmap);
            Assert.Equal(1.0, SpriteScale(testSprite));
            SpriteSetScale(testSprite, 2.0);
            Assert.Equal(2.0, SpriteScale(testSprite));
            FreeSprite(testSprite);
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestSpriteScreenRectangleIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testAnimation = LoadAnimationScript("test_animation", "kermit.txt");
            ClearBitmap(testBitmap, ColorWhite());
            var testSprite = CreateSprite(testBitmap, testAnimation);
            SpriteStartAnimation(testSprite, "walkfront");
            SpriteSetPosition(testSprite, PointAt(0, 0));
            var rect = SpriteScreenRectangle(testSprite);
            Assert.Equal(0, rect.X);
            Assert.Equal(0, rect.Y);
            Assert.Equal(100, rect.Width);
            Assert.Equal(100, rect.Height);
            FreeSprite(testSprite);
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestSpriteSendLayerBackwardIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testSprite = CreateSprite("test_sprite", testBitmap);
            var layer1 = SpriteAddLayer(testSprite, testBitmap, "layer1");
            SpriteShowLayer(testSprite, layer1);
            var layer2 = SpriteAddLayer(testSprite, testBitmap, "layer2");
            SpriteShowLayer(testSprite, layer2);
            SpriteSendLayerBackward(testSprite, visibleIndex);
            Assert.Equal(2, SpriteVisibleIndexOfLayer(testSprite, layer2));
            FreeSprite(testSprite);
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestSpriteSendLayerToBackIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testSprite = CreateSprite("test_sprite", testBitmap);
            var layer1 = SpriteAddLayer(testSprite, testBitmap, "layer1");
            SpriteShowLayer(testSprite, layer1);
            var layer2 = SpriteAddLayer(testSprite, testBitmap, "layer2");
            SpriteShowLayer(testSprite, layer2);
            SpriteSendLayerToBack(testSprite, visibleIndex);
            Assert.Equal(2, SpriteVisibleIndexOfLayer(testSprite, layer2));
            FreeSprite(testSprite);
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestSpriteSetAnchorPointIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testSprite = CreateSprite("test_sprite", testBitmap);
            Assert.Equal(PointAt(50, 50), SpriteAnchorPoint(testSprite));
            SpriteSetAnchorPoint(testSprite, PointAt(25, 25));
            Assert.Equal(PointAt(25, 25), SpriteAnchorPoint(testSprite));
            FreeSprite(testSprite);
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestSpriteSetCollisionBitmapIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testSprite = CreateSprite("test_sprite", testBitmap);
            Assert.Equal(testBitmap, SpriteCollisionBitmap(testSprite));
            var newBitmap = CreateBitmap("new_bitmap", 200, 200);
            SpriteSetCollisionBitmap(testSprite, newBitmap);
            Assert.Equal(newBitmap, SpriteCollisionBitmap(testSprite));
            FreeSprite(testSprite);
            FreeBitmap(testBitmap);
            FreeBitmap(newBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestSpriteSetCollisionKindIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testSprite = CreateSprite("test_sprite", testBitmap);
            Assert.Equal(CollisionTestKind.PixelCollisions, SpriteCollisionKind(testSprite));
            SpriteSetCollisionKind(testSprite, CollisionTestKind.AabbCollisions);
            Assert.Equal(CollisionTestKind.AabbCollisions, SpriteCollisionKind(testSprite));
            FreeSprite(testSprite);
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestSpriteSetDxIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testSprite = CreateSprite("test_sprite", testBitmap);
            Assert.Equal(0.0, SpriteDx(testSprite));
            SpriteSetDx(testSprite, 5.0);
            Assert.Equal(5.0, SpriteDx(testSprite));
            FreeSprite(testSprite);
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestSpriteSetDyIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testSprite = CreateSprite("test_sprite", testBitmap);
            Assert.Equal(0.0, SpriteDy(testSprite));
            SpriteSetDy(testSprite, 5.0);
            Assert.Equal(5.0, SpriteDy(testSprite));
            FreeSprite(testSprite);
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestSpriteSetHeadingIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testSprite = CreateSprite("test_sprite", testBitmap);
            SpriteSetVelocity(testSprite, VectorFromAngle(90, 1));
            Assert.Equal(90.0, SpriteHeading(testSprite));
            SpriteSetHeading(testSprite, 45.0);
            Assert.Equal(45.0, SpriteHeading(testSprite));
            FreeSprite(testSprite);
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestSpriteSetLayerOffsetNamedIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testSprite = CreateSprite("test_sprite", testBitmap);
            Assert.Equal(VectorTo(0, 0), SpriteLayerOffset(testSprite, "base_layer"));
            SpriteSetLayerOffsetNamed(testSprite, "base_layer", VectorTo(10.0, 10.0));
            Assert.Equal(VectorTo(10.0, 10.0), SpriteLayerOffset(testSprite, "base_layer"));
            FreeSprite(testSprite);
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestSpriteSetLayerOffsetAtIndexIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testSprite = CreateSprite("test_sprite", testBitmap);
            Assert.Equal(VectorTo(0, 0), SpriteLayerOffset(testSprite, 0));
            SpriteSetLayerOffsetAtIndex(testSprite, 0, VectorTo(10.0, 10.0));
            Assert.Equal(VectorTo(10.0, 10.0), SpriteLayerOffset(testSprite, 0));
            FreeSprite(testSprite);
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestSpriteSetMassIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testSprite = CreateSprite("test_sprite", testBitmap);
            Assert.Equal(1.0, SpriteMass(testSprite));
            SpriteSetMass(testSprite, 10.0);
            Assert.Equal(10.0, SpriteMass(testSprite));
            FreeSprite(testSprite);
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestSpriteSetMoveFromAnchorPointIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testSprite = CreateSprite("test_sprite", testBitmap);
            Assert.False(SpriteMoveFromAnchorPoint(testSprite));
            SpriteSetMoveFromAnchorPoint(testSprite, true);
            Assert.True(SpriteMoveFromAnchorPoint(testSprite));
            FreeSprite(testSprite);
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestSpriteSetPositionIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testSprite = CreateSprite("test_sprite", testBitmap);
            Assert.Equal(PointAt(0, 0), SpritePosition(testSprite));
            SpriteSetPosition(testSprite, PointAt(100, 100));
            Assert.Equal(PointAt(100, 100), SpritePosition(testSprite));
            FreeSprite(testSprite);
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestSpriteSetRotationIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testSprite = CreateSprite("test_sprite", testBitmap);
            Assert.Equal(0.0, SpriteRotation(testSprite));
            SpriteSetRotation(testSprite, 45.0);
            Assert.Equal(45.0, SpriteRotation(testSprite));
            FreeSprite(testSprite);
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestSpriteSetScaleIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testSprite = CreateSprite("test_sprite", testBitmap);
            Assert.Equal(1.0, SpriteScale(testSprite));
            SpriteSetScale(testSprite, 2.0);
            Assert.Equal(2.0, SpriteScale(testSprite));
            FreeSprite(testSprite);
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestSpriteSetSpeedIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testSprite = CreateSprite("test_sprite", testBitmap);
            SpriteSetVelocity(testSprite, VectorFromAngle(0, 1));
            SpriteSetSpeed(testSprite, 5.0);
            Assert.Equal(5.0, SpriteSpeed(testSprite));
            FreeSprite(testSprite);
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestSpriteSetValueNamedIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testSprite = CreateSprite("test_sprite", testBitmap);
            Assert.False(SpriteHasValue(testSprite, "test_value"));
            SpriteAddValue(testSprite, "test_value", 0.0);
            SpriteSetValueNamed(testSprite, "test_value", 10.5);
            Assert.Equal(10.5, SpriteValue(testSprite, "test_value"));
            FreeSprite(testSprite);
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestSpriteSetVelocityIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testSprite = CreateSprite("test_sprite", testBitmap);
            Assert.Equal(VectorTo(0, 0), SpriteVelocity(testSprite));
            SpriteSetVelocity(testSprite, VectorTo(5.0, 5.0));
            Assert.Equal(VectorTo(5.0, 5.0), SpriteVelocity(testSprite));
            FreeSprite(testSprite);
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestSpriteSetXIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testSprite = CreateSprite("test_sprite", testBitmap);
            Assert.Equal(0.0, SpriteX(testSprite));
            SpriteSetX(testSprite, 150.0);
            Assert.Equal(150.0, SpriteX(testSprite));
            FreeSprite(testSprite);
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestSpriteSetYIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testSprite = CreateSprite("test_sprite", testBitmap);
            Assert.Equal(0.0, SpriteY(testSprite));
            SpriteSetY(testSprite, 300.0);
            Assert.Equal(300.0, SpriteY(testSprite));
            FreeSprite(testSprite);
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestSpriteShowLayerNamedIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testSprite = CreateSprite("test_sprite", testBitmap);
            var layerIdx = SpriteAddLayer(testSprite, testBitmap, "layer2");
            SpriteHideLayer(testSprite, "layer2");
            Assert.Equal(1, SpriteVisibleLayerCount(testSprite));
            Assert.Equal(layerIdx, SpriteShowLayerNamed(testSprite, "layer2"));
            Assert.Equal(2, SpriteVisibleLayerCount(testSprite));
            FreeSprite(testSprite);
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestSpriteShowLayerIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testSprite = CreateSprite("test_sprite", testBitmap);
            var layerIdx = SpriteAddLayer(testSprite, testBitmap, "layer2");
            SpriteHideLayer(testSprite, layerIdx);
            Assert.Equal(1, SpriteVisibleLayerCount(testSprite));
            Assert.Equal(layerIdx, SpriteShowLayer(testSprite, layerIdx));
            Assert.Equal(2, SpriteVisibleLayerCount(testSprite));
            FreeSprite(testSprite);
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestSpriteSpeedIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testSprite = CreateSprite("test_sprite", testBitmap);
            Assert.Equal(0.0, SpriteSpeed(testSprite));
            SpriteSetVelocity(testSprite, VectorTo(3.0, 4.0));
            Assert.Equal(5.0, SpriteSpeed(testSprite));
            FreeSprite(testSprite);
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestSpriteStartAnimationNamedIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testAnimation = LoadAnimationScript("test_animation", "kermit.txt");
            var testSprite = CreateSprite(testBitmap, testAnimation);
            SpriteStartAnimationNamed(testSprite, "walkfront");
            Assert.False(SpriteAnimationHasEnded(testSprite));
            UpdateSpriteAnimation(testSprite, 100);
            Assert.True(SpriteAnimationHasEnded(testSprite));
            Assert.Equal("walkfront", SpriteAnimationName(testSprite));
            FreeSprite(testSprite);
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestSpriteStartAnimationNamedWithSoundIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testAnimation = LoadAnimationScript("test_animation", "kermit.txt");
            var testSprite = CreateSprite(testBitmap, testAnimation);
            SpriteStartAnimationNamedWithSound(testSprite, "walkfront", true);
            Assert.False(SpriteAnimationHasEnded(testSprite));
            UpdateSpriteAnimation(testSprite, 100);
            Assert.True(SpriteAnimationHasEnded(testSprite));
            Assert.Equal("walkfront", SpriteAnimationName(testSprite));
            FreeSprite(testSprite);
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestSpriteStartAnimationIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testAnimation = LoadAnimationScript("test_animation", "kermit.txt");
            var testSprite = CreateSprite(testBitmap, testAnimation);
            SpriteStartAnimation(testSprite, 0);
            Assert.False(SpriteAnimationHasEnded(testSprite));
            UpdateSpriteAnimation(testSprite, 100);
            Assert.True(SpriteAnimationHasEnded(testSprite));
            FreeSprite(testSprite);
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestSpriteStartAnimationWithSoundIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testAnimation = LoadAnimationScript("test_animation", "kermit.txt");
            var testSprite = CreateSprite(testBitmap, testAnimation);
            SpriteStartAnimationWithSound(testSprite, 0, true);
            Assert.False(SpriteAnimationHasEnded(testSprite));
            UpdateSpriteAnimation(testSprite, 100);
            UpdateSpriteAnimation(testSprite, true);
            Assert.True(SpriteAnimationHasEnded(testSprite));
            FreeSprite(testSprite);
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestSpriteStopCallingOnEventIntegration()
        {
            var helper = new Helper();
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testSprite = CreateSprite("test_sprite", testBitmap);
            SpriteSetX(testSprite, 100);
            SpriteCallOnEvent(testSprite, helper.Sprite_event_handler);
            UpdateSprite(testSprite);
            Assert.Equal(200, SpriteX(testSprite));
            SpriteSetX(testSprite, 100);
            SpriteStopCallingOnEvent(testSprite, helper.Sprite_event_handler);
            UpdateSprite(testSprite);
            Assert.Equal(100, SpriteX(testSprite));
            FreeSprite(testSprite);
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestSpriteToggleLayerVisibleNamedIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testSprite = CreateSprite("test_sprite", testBitmap);
            SpriteAddLayer(testSprite, testBitmap, "layer2");
            SpriteShowLayer(testSprite, "layer2");
            Assert.Equal(2, SpriteVisibleLayerCount(testSprite));
            SpriteToggleLayerVisibleNamed(testSprite, "layer2");
            Assert.Equal(1, SpriteVisibleLayerCount(testSprite));
            SpriteToggleLayerVisibleNamed(testSprite, "layer2");
            Assert.Equal(2, SpriteVisibleLayerCount(testSprite));
            FreeSprite(testSprite);
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestSpriteToggleLayerVisibleIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testSprite = CreateSprite("test_sprite", testBitmap);
            var layerIdx = SpriteAddLayer(testSprite, testBitmap, "layer2");
            SpriteShowLayer(testSprite, layerIdx);
            Assert.Equal(2, SpriteVisibleLayerCount(testSprite));
            SpriteToggleLayerVisible(testSprite, layerIdx);
            Assert.Equal(1, SpriteVisibleLayerCount(testSprite));
            FreeSprite(testSprite);
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestSpriteValueIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testSprite = CreateSprite("test_sprite", testBitmap);
            Assert.Equal(3, SpriteValueCount(testSprite));
            SpriteAddValue(testSprite, "test_value", 10.0);
            Assert.Equal(10.0, SpriteValue(testSprite, "test_value"));
            FreeSprite(testSprite);
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestSpriteValueCountIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testSprite = CreateSprite("test_sprite", testBitmap);
            Assert.Equal(3, SpriteValueCount(testSprite));
            SpriteAddValue(testSprite, "health", 0.0);
            SpriteAddValue(testSprite, "speed", 0.0);
            Assert.Equal(5, SpriteValueCount(testSprite));
            FreeSprite(testSprite);
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestSpriteVelocityIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testSprite = CreateSprite("test_sprite", testBitmap);
            Assert.Equal(VectorTo(0, 0), SpriteVelocity(testSprite));
            SpriteSetVelocity(testSprite, VectorTo(5.0, 5.0));
            Assert.Equal(VectorTo(5.0, 5.0), SpriteVelocity(testSprite));
            FreeSprite(testSprite);
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestSpriteVisibleIndexOfLayerNamedIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testSprite = CreateSprite("test_sprite", testBitmap);
            Assert.Equal(0, SpriteVisibleIndexOfLayerNamed(testSprite, "base_layer"));
            SpriteAddLayer(testSprite, testBitmap, "layer2");
            SpriteShowLayer(testSprite, "layer2");
            Assert.Equal(1, SpriteVisibleIndexOfLayerNamed(testSprite, "layer2"));
            FreeSprite(testSprite);
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestSpriteVisibleIndexOfLayerIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testSprite = CreateSprite("test_sprite", testBitmap);
            Assert.Equal(0, SpriteVisibleIndexOfLayer(testSprite, 0));
            var layerIdx = SpriteAddLayer(testSprite, testBitmap, "layer2");
            SpriteShowLayer(testSprite, layerIdx);
            Assert.Equal(1, SpriteVisibleIndexOfLayer(testSprite, layerIdx));
            FreeSprite(testSprite);
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestSpriteVisibleLayerIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testSprite = CreateSprite("test_sprite", testBitmap);
            Assert.Equal(0, SpriteVisibleLayer(testSprite, 0));
            SpriteAddLayer(testSprite, testBitmap, "layer2");
            SpriteShowLayer(testSprite, "layer2");
            Assert.Equal(1, SpriteVisibleLayer(testSprite, 1));
            FreeSprite(testSprite);
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestSpriteVisibleLayerCountIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testSprite = CreateSprite("test_sprite", testBitmap);
            Assert.Equal(1, SpriteVisibleLayerCount(testSprite));
            SpriteAddLayer(testSprite, testBitmap, "layer2");
            SpriteShowLayer(testSprite, "layer2");
            Assert.Equal(2, SpriteVisibleLayerCount(testSprite));
            SpriteHideLayer(testSprite, "layer2");
            Assert.Equal(1, SpriteVisibleLayerCount(testSprite));
            FreeSprite(testSprite);
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestSpriteVisibleLayerIdIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testSprite = CreateSprite("test_sprite", testBitmap);
            Assert.Equal(0, SpriteVisibleLayerId(testSprite, 0));
            SpriteAddLayer(testSprite, testBitmap, "layer2");
            SpriteShowLayer(testSprite, "layer2");
            Assert.Equal(1, SpriteVisibleLayerId(testSprite, 1));
            FreeSprite(testSprite);
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestSpriteWidthIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testSprite = CreateSprite("test_sprite", testBitmap);
            Assert.Equal(1, SpriteScale(testSprite));
            SpriteSetScale(testSprite, 2.0);
            Assert.Equal(2, SpriteScale(testSprite));
            FreeSprite(testSprite);
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestSpriteXIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testSprite = CreateSprite("test_sprite", testBitmap);
            Assert.Equal(0.0, SpriteX(testSprite));
            SpriteSetX(testSprite, 150.0);
            Assert.Equal(150.0, SpriteX(testSprite));
            FreeSprite(testSprite);
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestSpriteYIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testSprite = CreateSprite("test_sprite", testBitmap);
            Assert.Equal(0.0, SpriteY(testSprite));
            SpriteSetY(testSprite, 200.0);
            Assert.Equal(200.0, SpriteY(testSprite));
            FreeSprite(testSprite);
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestStopCallingOnSpriteEventIntegration()
        {
            var helper = new Helper();
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testSprite = CreateSprite("test_sprite", testBitmap);
            CallOnSpriteEvent(helper.Sprite_event_handler);
            SpriteStartAnimation(testSprite, "test");
            UpdateSprite(testSprite);
            Assert.True(helper.Eventcalled);
            StopCallingOnSpriteEvent(helper.Sprite_event_handler);
            var helper = new Helper();
            UpdateSprite(testSprite);
            Assert.False(helper.Eventcalled);
            FreeSprite(testSprite);
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestUpdateAllSpritesIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testSprite1 = CreateSprite("test_sprite1", testBitmap);
            var testSprite2 = CreateSprite("test_sprite2", testBitmap);
            SpriteSetVelocity(testSprite1, VectorTo(10, 10));
            SpriteSetVelocity(testSprite2, VectorTo(-10, -10));
            UpdateAllSprites();
            Assert.Equal(VectorTo(10, 10), SpriteVelocity(testSprite1));
            Assert.Equal(VectorTo(-10, -10), SpriteVelocity(testSprite2));
            FreeAllSprites();
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestUpdateAllSpritesPercentIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testSprite1 = CreateSprite("test_sprite1", testBitmap);
            var testSprite2 = CreateSprite("test_sprite2", testBitmap);
            SpriteSetVelocity(testSprite1, VectorTo(100.0, 100.0));
            SpriteSetVelocity(testSprite2, VectorTo(-100.0, -100.0));
            UpdateAllSpritesPercent(0.5);
            Assert.Equal(50.0, SpriteX(testSprite1));
            Assert.Equal(50.0, SpriteY(testSprite1));
            Assert.Equal(-50.0, SpriteX(testSprite2));
            Assert.Equal(-50.0, SpriteY(testSprite2));
            FreeAllSprites();
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestUpdateSpriteIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testSprite = CreateSprite("test_sprite", testBitmap);
            SpriteSetVelocity(testSprite, VectorTo(10.0, 10.0));
            var initialPos = SpritePosition(testSprite);
            UpdateSprite(testSprite);
            Assert.NotEqual(initialPos, SpritePosition(testSprite));
            FreeSprite(testSprite);
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestUpdateSpriteWithSoundIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testAnimation = LoadAnimationScript("test_animation", "kermit.txt");
            var testSprite = CreateSprite(testBitmap, testAnimation);
            SpriteStartAnimation(testSprite, "default", true);
            UpdateSpriteWithSound(testSprite, true);
            Assert.True(SpriteAnimationHasEnded(testSprite));
            FreeSprite(testSprite);
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestUpdateSpritePercentIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testSprite = CreateSprite("test_sprite", testBitmap);
            SpriteSetVelocity(testSprite, VectorTo(100.0, 100.0));
            UpdateSpritePercent(testSprite, 0.5);
            Assert.Equal(50.0, SpriteX(testSprite));
            Assert.Equal(50.0, SpriteY(testSprite));
            FreeSprite(testSprite);
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestUpdateSpritePercentWithSoundIntegration()
        {
            var helper = new Helper();
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testSprite = CreateSprite("test_sprite", testBitmap);
            SpriteSetVelocity(testSprite, VectorTo(100.0, 100.0));
            SpriteAddToAnimationScript(testSprite, "test_sound.wav");
            UpdateSpritePercentWithSound(testSprite, 0.5, true);
            Assert.Equal(50.0, SpriteX(testSprite));
            Assert.Equal(50.0, SpriteY(testSprite));
            Assert.True(SoundPlaying("test_sound.wav"));
            UpdateSpritePercentWithSound(testSprite, 0.5, false);
            Assert.False(SoundPlaying("test_sound.wav"));
            FreeSprite(testSprite);
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestUpdateSpriteAnimationIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testAnimation = LoadAnimationScript("test_animation", "kermit.txt");
            var testSprite = CreateSprite("test_sprite", testBitmap, testAnimation);
            SpriteStartAnimation(testSprite, "walkfront");
            Assert.False(SpriteAnimationHasEnded(testSprite));
            UpdateSpriteAnimation(testSprite);
            Assert.True(SpriteAnimationHasEnded(testSprite));
            FreeSprite(testSprite);
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestUpdateSpriteAnimationWithSoundIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testSprite = CreateSprite("test_sprite", testBitmap);
            SpriteStartAnimation(testSprite, "default");
            UpdateSpriteAnimationWithSound(testSprite, true);
            Assert.True(SpriteAnimationHasEnded(testSprite));
            FreeSprite(testSprite);
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestUpdateSpriteAnimationPercentIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testAnimation = LoadAnimationScript("test_animation", "kermit.txt");
            var testSprite = CreateSprite("test_sprite", testBitmap, testAnimation);
            SpriteStartAnimation(testSprite, "walkfront");
            Assert.False(SpriteAnimationHasEnded(testSprite));
            UpdateSpriteAnimationPercent(testSprite, 100);
            Assert.True(SpriteAnimationHasEnded(testSprite));
            FreeSprite(testSprite);
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestUpdateSpriteAnimationPercentWithSoundIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testAnimation = LoadAnimationScript("test_animation", "kermit.txt");
            var testSprite = CreateSprite("test_sprite", testBitmap, testAnimation);
            SpriteStartAnimation(testSprite, "walkfront");
            Assert.False(SpriteAnimationHasEnded(testSprite));
            UpdateSpriteAnimationPercentWithSound(testSprite, 100, true);
            Assert.True(SpriteAnimationHasEnded(testSprite));
            FreeSprite(testSprite);
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestVectorFromCenterSpriteToPointPointIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testSprite = CreateSprite("test_sprite", testBitmap);
            SpriteSetPosition(testSprite, PointAt(0, 0));
            var centerPoint = PointAt(50, 50);
            var targetPoint = PointAt(150, 150);
            var vector = VectorFromCenterSpriteToPointPoint(testSprite, targetPoint);
            Assert.Equal(100, vector.X);
            Assert.Equal(100, vector.Y);
            FreeSprite(testSprite);
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestVectorFromToIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var sprite1 = CreateSprite("sprite1", testBitmap);
            var sprite2 = CreateSprite("sprite2", testBitmap);
            SpriteSetPosition(sprite1, PointAt(0, 0));
            SpriteSetPosition(sprite2, PointAt(100, 100));
            var vector = VectorFromTo(sprite1, sprite2);
            Assert.Equal(100, vector.X);
            Assert.Equal(100, vector.Y);
            FreeSprite(sprite1);
            FreeSprite(sprite2);
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
    }
}
