using System;
using System.IO;
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
            SpriteSetX(testSprite1, 100f);
            SpriteSetX(testSprite2, 200f);
            CallForAllSprites(helper.Spritefloatfunction, 300f);
            Assert.Equal(300.0f, SpriteX(testSprite1));
            Assert.Equal(300.0f, SpriteX(testSprite2));
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
            SpriteSetPosition(testSprite1, PointAt(100.0, 100.0));
            SpriteSetPosition(testSprite2, PointAt(200.0, 200.0));
            CallForAllSprites(helper.Spritefunction);
            Assert.Equal(300.0f, SpriteX(testSprite1));
            Assert.Equal(300.0f, SpriteX(testSprite2));
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
            CallOnSpriteEvent(helper.SpriteEventHandler);
            SpriteStartAnimation(testSprite, "test");
            UpdateSprite(testSprite);
            Assert.True(helper.EventCalled);
            FreeSprite(testSprite);
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestCenterPointOfSpriteIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testSprite = CreateSprite(testBitmap);
            SpriteSetPosition(testSprite, PointAt(100.0, 100.0));
            var centerPoint = CenterPoint(testSprite);
            Assert.Equal(150.0, centerPoint.X);
            Assert.Equal(150.0, centerPoint.Y);
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
            var testSprite = CreateSprite(testBitmap, testAnimation);
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
            var testSprite = CreateSprite("test_bitmap");
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
            var testSprite = CreateSprite("test_sprite", testBitmap);
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
            var testSprite = CreateSprite("test_sprite", testBitmap, testAnimation);
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
            var testSprite = CreateSprite("test_bitmap", "test_animation");
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
            SpriteSetPosition(testSprite1, PointAt(100.0, 100.0));
            SpriteSetPosition(testSprite2, PointAt(200.0, 200.0));
            ClearScreen(ColorWhite());
            DrawAllSprites();
            RefreshScreen();
            Assert.Equal(ColorBlack(), GetPixel(testWindow, 100.0, 100.0));
            Assert.Equal(ColorBlack(), GetPixel(testWindow, 200.0, 200.0));
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
            SpriteSetPosition(testSprite, PointAt(400.0, 300.0));
            ClearScreen(ColorWhite());
            DrawSprite(testSprite, VectorFromAngle(50.0, 50.0));
            RefreshScreen();
            Assert.NotEqual(ColorWhite(), GetPixel(testWindow, 450.0, 350.0));
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
            SpriteSetPosition(testSprite, PointAt(400.0, 300.0));
            ClearScreen(ColorWhite());
            DrawSprite(testSprite);
            RefreshScreen();
            Assert.Equal(ColorBlack(), GetPixel(testWindow, 400.0, 300.0));
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
            SpriteSetPosition(testSprite, PointAt(400.0, 300.0));
            ClearScreen(ColorWhite());
            DrawSprite(testSprite, 50.0, 50.0);
            RefreshScreen();
            Assert.NotEqual(ColorWhite(), GetPixel(testWindow, 450.0, 350.0));
            FreeSprite(testSprite);
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestFreeAllSpritesIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            CreateSprite("test_sprite1", testBitmap);
            CreateSprite("test_sprite2", testBitmap);
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
            MoveSprite(testSprite);
            Assert.Equal(110.0f, SpriteX(testSprite));
            Assert.Equal(110.0f, SpriteY(testSprite));
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
            SpriteSetPosition(testSprite, PointAt(100.0, 100.0));
            MoveSprite(testSprite, VectorTo(50.0, 50.0));
            Assert.Equal(150.0f, SpriteX(testSprite));
            Assert.Equal(150f, SpriteY(testSprite));
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
            MoveSprite(testSprite, VectorTo(50.0, 50.0), 0.5f);
            Assert.Equal(125.0f, SpriteX(testSprite));
            Assert.Equal(125.0f, SpriteY(testSprite));
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
            MoveSprite(testSprite, 0.5f);
            Assert.Equal(105.0f, SpriteX(testSprite));
            Assert.Equal(105.0f, SpriteY(testSprite));
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
            Assert.Equal(400.0f, SpriteX(testSprite));
            Assert.Equal(300.0f, SpriteY(testSprite));
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
            SpriteSetVelocity(testSprite, VectorTo(0.0, 0.0));
            SpriteAddToVelocity(testSprite, VectorTo(10.0, 10.0));
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
            SpriteAddValue(testSprite, "health", 100.0f);
            Assert.True(SpriteHasValue(testSprite, "health"));
            Assert.Equal(100.0f, SpriteValue(testSprite, "health"));
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
            SpriteAddValue(testSprite, "health", 100.0f);
            Assert.True(SpriteHasValue(testSprite, "health"));
            Assert.Equal(100.0f, SpriteValue(testSprite, "health"));
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
            Assert.Equal(50.0, anchorPoint.X);
            Assert.Equal(50.0, anchorPoint.Y);
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
            SpriteSetPosition(testSprite, PointAt(100.0, 100.0));
            var anchorPosition = SpriteAnchorPosition(testSprite);
            Assert.Equal(150.0, anchorPosition.X);
            Assert.Equal(150.0, anchorPosition.Y);
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
            UpdateSpriteAnimation(testSprite, 100.0f);
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
            SpriteSetX(testSprite, 400f);
            SpriteSetY(testSprite, 300f);
            DrawSprite(testSprite);
            Assert.True(SpriteAt(testSprite, PointAt(400.0, 300.0)));
            Assert.False(SpriteAt(testSprite, PointAt(600.0, 500.0)));
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
            SpriteCallOnEvent(testSprite, helper.SpriteEventHandler);
            SpriteStartAnimation(testSprite, "test");
            UpdateSprite(testSprite);
            Assert.True(helper.EventCalled);
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
            Assert.Equal(50.0, circle.Center.X);
            Assert.Equal(50.0, circle.Center.Y);
            Assert.Equal(50.0, circle.Radius);
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
            Assert.Equal(50.0, circle.Center.X);
            Assert.Equal(50.0, circle.Center.Y);
            Assert.Equal(50.0, circle.Radius);
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
            Assert.Equal(0.0, rect.X);
            Assert.Equal(0.0, rect.Y);
            Assert.Equal(100.0, rect.Width);
            Assert.Equal(100.0, rect.Height);
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
            Assert.Equal(0.0, rect.X);
            Assert.Equal(0.0, rect.Y);
            Assert.Equal(100.0, rect.Width);
            Assert.Equal(100.0, rect.Height);
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
            SpriteSetDx(testSprite, 5.0f);
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
            SpriteSetDy(testSprite, 5.0f);
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
            SpriteAddValue(testSprite, "health", 100.0f);
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
            SpriteSetScale(testSprite, 2.0f);
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
            SpriteHideLayer(testSprite, "layer2");
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
            Assert.Equal(testBitmap, SpriteLayer(testSprite, "layer2"));
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
            Assert.Equal(testBitmap, SpriteLayer(testSprite, layerIdx));
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
            var circle = SpriteLayerCircle(testSprite, "base_layer");
            Assert.Equal(50.0, circle.Center.X);
            Assert.Equal(50.0, circle.Center.Y);
            Assert.Equal(50.0, circle.Radius);
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
            var circle = SpriteLayerCircle(testSprite, 0);
            Assert.Equal(50.0, circle.Center.X);
            Assert.Equal(50.0, circle.Center.Y);
            Assert.Equal(50.0, circle.Radius);
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
            Assert.Equal(100, SpriteLayerHeight(testSprite, "base_layer"));
            SpriteAddLayer(testSprite, testBitmap, "layer2");
            Assert.Equal(100, SpriteLayerHeight(testSprite, "layer2"));
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
            Assert.Equal("", SpriteLayerName(testSprite, layerIdx));
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
            Assert.Equal(VectorTo(0.0, 0.0), SpriteLayerOffset(testSprite, "base_layer"));
            SpriteSetLayerOffset(testSprite, "base_layer", VectorTo(10.0, 10.0));
            Assert.Equal(VectorTo(10.0, 10.0), SpriteLayerOffset(testSprite, "base_layer"));
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
            Assert.Equal(VectorTo(0.0, 0.0), SpriteLayerOffset(testSprite, 0));
            var layerIdx = SpriteAddLayer(testSprite, testBitmap, "layer2");
            SpriteSetLayerOffset(testSprite, layerIdx, VectorTo(10.0, 10.0));
            Assert.Equal(VectorTo(10.0, 10.0), SpriteLayerOffset(testSprite, layerIdx));
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
            var rect = SpriteLayerRectangle(testSprite, "base_layer");
            Assert.Equal(0.0, rect.X);
            Assert.Equal(0.0, rect.Y);
            Assert.Equal(100.0, rect.Width);
            Assert.Equal(100.0, rect.Height);
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
            var rect = SpriteLayerRectangle(testSprite, 0);
            Assert.Equal(0.0, rect.X);
            Assert.Equal(0.0, rect.Y);
            Assert.Equal(100.0, rect.Width);
            Assert.Equal(100.0, rect.Height);
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
            Assert.Equal(100, SpriteLayerWidth(testSprite, "base_layer"));
            SpriteAddLayer(testSprite, testBitmap, "layer2");
            Assert.Equal(100, SpriteLayerWidth(testSprite, "layer2"));
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
            SpriteSetPosition(testSprite, PointAt(100.0, 100.0));
            SpriteSetRotation(testSprite, 45f);
            var matrix = SpriteLocationMatrix(testSprite);
            Assert.Equal(150.0, matrix.Elements[0, 2]);
            Assert.Equal(1.0, matrix.Elements[2, 2]);
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
            SpriteSetMass(testSprite, 10.0f);
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
            SpriteSetPosition(testSprite, PointAt(100.0, 100.0));
            SpriteMoveTo(testSprite, PointAt(200.0, 200.0), 1.0f);
            UpdateSprite(testSprite);
            var position = SpritePosition(testSprite);
            Assert.Equal(200.0, position.X);
            Assert.Equal(200.0, position.Y);
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
            SpriteSetPosition(testSprite, PointAt(400.0, 300.0));
            Assert.False(SpriteOffscreen(testSprite));
            SpriteSetPosition(testSprite, PointAt(-200.0, -200.0));
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
            SpriteSetPosition(testSprite, PointAt(400.0, 300.0));
            Assert.True(SpriteOnScreenAt(testSprite, PointAt(400.0, 300.0)));
            Assert.False(SpriteOnScreenAt(testSprite, PointAt(0.0, 0.0)));
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
            SpriteSetPosition(testSprite, PointAt(400.0, 300.0));
            Assert.True(SpriteOnScreenAt(testSprite, 400.0, 300.0));
            Assert.False(SpriteOnScreenAt(testSprite, 0.0, 0.0));
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
            Assert.Equal(PointAt(0.0, 0.0), SpritePosition(testSprite));
            SpriteSetPosition(testSprite, PointAt(400.0, 300.0));
            Assert.Equal(PointAt(400.0, 300.0), SpritePosition(testSprite));
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
            UpdateSprite(testSprite, 100.0f);
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
            UpdateSprite(testSprite, 100.0f);
            SpriteReplayAnimation(testSprite, true);
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
            SpriteSetRotation(testSprite, 45.0f);
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
            Assert.Equal(1.0f, SpriteScale(testSprite));
            SpriteSetScale(testSprite, 2.0f);
            Assert.Equal(2.0f, SpriteScale(testSprite));
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
            SpriteSetPosition(testSprite, PointAt(0.0, 0.0));
            var rect = SpriteScreenRectangle(testSprite);
            Assert.Equal(0.0, rect.X);
            Assert.Equal(0.0, rect.Y);
            Assert.Equal(100.0, rect.Width);
            Assert.Equal(100.0, rect.Height);
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
            var visibleIndex = SpriteVisibleIndexOfLayer(testSprite, layer2);
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
            var visibleIndex = SpriteVisibleIndexOfLayer(testSprite, layer2);
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
            Assert.Equal(PointAt(50.0, 50.0), SpriteAnchorPoint(testSprite));
            SpriteSetAnchorPoint(testSprite, PointAt(25.0, 25.0));
            Assert.Equal(PointAt(25.0, 25.0), SpriteAnchorPoint(testSprite));
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
            SpriteSetDx(testSprite, 5.0f);
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
            SpriteSetDy(testSprite, 5.0f);
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
            SpriteSetVelocity(testSprite, VectorFromAngle(90.0, 1.0));
            Assert.Equal(90.0, SpriteHeading(testSprite));
            SpriteSetHeading(testSprite, 45.0f);
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
            Assert.Equal(VectorTo(0.0, 0.0), SpriteLayerOffset(testSprite, "base_layer"));
            SpriteSetLayerOffset(testSprite, "base_layer", VectorTo(10.0, 10.0));
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
            Assert.Equal(VectorTo(0.0, 0.0), SpriteLayerOffset(testSprite, 0));
            SpriteSetLayerOffset(testSprite, 0, VectorTo(10.0, 10.0));
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
            SpriteSetMass(testSprite, 10.0f);
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
            Assert.Equal(PointAt(0.0, 0.0), SpritePosition(testSprite));
            SpriteSetPosition(testSprite, PointAt(100.0, 100.0));
            Assert.Equal(PointAt(100.0, 100.0), SpritePosition(testSprite));
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
            SpriteSetRotation(testSprite, 45.0f);
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
            Assert.Equal(1.0f, SpriteScale(testSprite));
            SpriteSetScale(testSprite, 2.0f);
            Assert.Equal(2.0f, SpriteScale(testSprite));
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
            SpriteSetVelocity(testSprite, VectorFromAngle(0.0, 1.0));
            SpriteSetSpeed(testSprite, 5.0f);
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
            SpriteAddValue(testSprite, "test_value", 0.0f);
            SpriteSetValue(testSprite, "test_value", 10.5f);
            Assert.Equal(10.5f, SpriteValue(testSprite, "test_value"));
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
            Assert.Equal(VectorTo(0.0, 0.0), SpriteVelocity(testSprite));
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
            Assert.Equal(0.0f, SpriteX(testSprite));
            SpriteSetX(testSprite, 150.0f);
            Assert.Equal(150.0f, SpriteX(testSprite));
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
            Assert.Equal(0.0f, SpriteY(testSprite));
            SpriteSetY(testSprite, 300.0f);
            Assert.Equal(300.0f, SpriteY(testSprite));
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
            Assert.Equal(layerIdx, SpriteShowLayer(testSprite, "layer2"));
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
            SpriteStartAnimation(testSprite, "walkfront");
            Assert.False(SpriteAnimationHasEnded(testSprite));
            UpdateSpriteAnimation(testSprite, 100.0f);
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
            SpriteStartAnimation(testSprite, "walkfront", true);
            Assert.False(SpriteAnimationHasEnded(testSprite));
            UpdateSpriteAnimation(testSprite, 100.0f);
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
            SpriteStartAnimation(testSprite, "0");
            Assert.False(SpriteAnimationHasEnded(testSprite));
            UpdateSpriteAnimation(testSprite, 100.0f);
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
            SpriteStartAnimation(testSprite, 0, true);
            Assert.False(SpriteAnimationHasEnded(testSprite));
            UpdateSpriteAnimation(testSprite, 100.0f);
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
            SpriteSetX(testSprite, 100f);
            SpriteCallOnEvent(testSprite, helper.SpriteEventHandler);
            UpdateSprite(testSprite);
            Assert.Equal(200f, SpriteX(testSprite));
            SpriteSetX(testSprite, 100f);
            SpriteStopCallingOnEvent(testSprite, helper.SpriteEventHandler);
            UpdateSprite(testSprite);
            Assert.Equal(100.0f, SpriteX(testSprite));
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
            SpriteToggleLayerVisible(testSprite, "layer2");
            Assert.Equal(1, SpriteVisibleLayerCount(testSprite));
            SpriteToggleLayerVisible(testSprite, "layer2");
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
            SpriteAddValue(testSprite, "test_value", 0.0f);
            Assert.Equal(10.0f, SpriteValue(testSprite, "test_value"));
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
            SpriteAddValue(testSprite, "health", 0.0f);
            SpriteAddValue(testSprite, "speed", 0.0f);
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
            Assert.Equal(VectorTo(0.0, 0.0), SpriteVelocity(testSprite));
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
            Assert.Equal(0, SpriteVisibleIndexOfLayer(testSprite, "base_layer"));
            SpriteAddLayer(testSprite, testBitmap, "layer2");
            SpriteShowLayer(testSprite, "layer2");
            Assert.Equal(1, SpriteVisibleIndexOfLayer(testSprite, "layer2"));
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
            Assert.Equal(1.0f, SpriteScale(testSprite));
            SpriteSetScale(testSprite, 2.0f);
            Assert.Equal(2.0f, SpriteScale(testSprite));
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
            Assert.Equal(0.0f, SpriteX(testSprite));
            SpriteSetX(testSprite, 150.0f);
            Assert.Equal(150.0f, SpriteX(testSprite));
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
            Assert.Equal(0.0f, SpriteY(testSprite));
            SpriteSetY(testSprite, 200.0f);
            Assert.Equal(200.0f, SpriteY(testSprite));
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
            CallOnSpriteEvent(helper.SpriteEventHandler);
            SpriteStartAnimation(testSprite, "test");
            UpdateSprite(testSprite);
            Assert.True(helper.EventCalled);
            StopCallingOnSpriteEvent(helper.SpriteEventHandler);
            UpdateSprite(testSprite);
            Assert.False(helper.EventCalled);
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
            SpriteSetVelocity(testSprite1, VectorTo(10.0, 10.0));
            SpriteSetVelocity(testSprite2, VectorTo(-10.0, -10.0));
            UpdateAllSprites();
            Assert.Equal(VectorTo(10.0, 10.0), SpriteVelocity(testSprite1));
            Assert.Equal(VectorTo(-10.0, -10.0), SpriteVelocity(testSprite2));
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
            UpdateAllSprites(0.5f);
            Assert.Equal(50.0f, SpriteX(testSprite1));
            Assert.Equal(50.0f, SpriteY(testSprite1));
            Assert.Equal(-50.0f, SpriteX(testSprite2));
            Assert.Equal(-50.0f, SpriteY(testSprite2));
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
            UpdateSprite(testSprite, true);
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
            UpdateSprite(testSprite, 0.5f);
            Assert.Equal(50.0f, SpriteX(testSprite));
            Assert.Equal(50.0f, SpriteY(testSprite));
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
            var testSprite = CreateSprite(testBitmap);
            SpriteSetVelocity(testSprite, VectorTo(100.0, 100.0));
            UpdateSprite(testSprite, 0.5f, true);
            Assert.Equal(50.0f, SpriteX(testSprite));
            Assert.Equal(50.0f, SpriteY(testSprite));
            Assert.True(SoundEffectPlaying("test_sound.wav"));
            UpdateSprite(testSprite, 0.5f, false);
            Assert.False(SoundEffectPlaying("test_sound.wav"));
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
            UpdateSpriteAnimation(testSprite, true);
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
            UpdateSpriteAnimation(testSprite, 100.0f);
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
            UpdateSpriteAnimation(testSprite, 100.0f, true);
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
            SpriteSetPosition(testSprite, PointAt(0.0, 0.0));
            var targetPoint = PointAt(150.0, 150.0);
            var vector = VectorFromCenterSpriteToPoint(testSprite, targetPoint);
            Assert.Equal(100.0, vector.X);
            Assert.Equal(100.0, vector.Y);
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
            SpriteSetPosition(sprite1, PointAt(0.0, 0.0));
            SpriteSetPosition(sprite2, PointAt(100.0, 100.0));
            var vector = VectorFromTo(sprite1, sprite2);
            Assert.Equal(100.0, vector.X);
            Assert.Equal(100.0, vector.Y);
            FreeSprite(sprite1);
            FreeSprite(sprite2);
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
    }
}
