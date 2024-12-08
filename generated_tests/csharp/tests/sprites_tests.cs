using Xunit;
using static SplashKitSDK.SplashKit;

namespace SplashKitTests
{
    public class IntegrationTests
    {
        [Fact]
        public void TestCallForAllSpritesWithValueIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testSprite1 = CreateSprite(testBitmap);
            var testSprite2 = CreateSprite(testBitmap);
            SpriteSetX(testSprite1, 100);
            SpriteSetX(testSprite2, 200);
            CallForAllSprites(SpriteSetX(testSprite1, 300), 300);
            Assert.Equal(SpriteX(testSprite1), 300);
            Assert.Equal(SpriteX(testSprite2), 300);
            FreeAllSprites();
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestCallForAllSpritesIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testSprite1 = CreateSprite(testBitmap);
            var testSprite2 = CreateSprite(testBitmap);
            SpriteSetX(testSprite1, 100);
            SpriteSetY(testSprite1, 100);
            SpriteSetX(testSprite2, 200);
            SpriteSetY(testSprite2, 200);
            CallForAllSprites(TestSpriteFunction());
            Assert.True(SpriteAt(testSprite1, PointAt(100, 100)));
            Assert.True(SpriteAt(testSprite2, PointAt(200, 200)));
            FreeAllSprites();
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestCallOnSpriteEventIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testSprite = CreateSprite(testBitmap);
            CallOnSpriteEvent(OnSpriteEvent());
            ProcessEvents();
            SimulateMouseClick(MouseButton.Left);
            ProcessEvents();
            Assert.True(MouseClicked(MouseButton.Left));
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
            var testCenterPoint = CenterPoint(testSprite);
            Assert.Equal(testCenterPoint.X, 150);
            Assert.Equal(testCenterPoint.Y, 150);
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
            var testSprite = CreateSprite("test_bitmap", "test_animation");
            Assert.NotNull(testSprite);
            FreeSprite(testSprite);
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestCreateSpritePackIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            CreateSpritePack("test_pack");
            Assert.True(HasSpritePack("test_pack"));
            FreeSpritePack("test_pack");
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestCurrentSpritePackIntegration()
        {
            CreateSpritePack("test_pack");
            SelectSpritePack("test_pack");
            var currentPack = CurrentSpritePack();
            Assert.Equal(currentPack, "test_pack");
            FreeSpritePack("test_pack");
        }
        [Fact]
        public void TestDrawAllSpritesIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testSprite1 = CreateSprite(testBitmap);
            var testSprite2 = CreateSprite(testBitmap);
            SpriteSetX(testSprite1, 100);
            SpriteSetY(testSprite1, 100);
            SpriteSetX(testSprite2, 200);
            SpriteSetY(testSprite2, 200);
            DrawAllSprites();
            RefreshScreen();
            Assert.NotEqual(GetPixel(100, 100), ColorWhite());
            Assert.NotEqual(GetPixel(200, 200), ColorWhite());
            FreeAllSprites();
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestDrawSpriteOffsetByIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testSprite = CreateSprite(testBitmap);
            SpriteSetPosition(testSprite, PointAt(400, 300));
            DrawSprite(testSprite, VectorTo(50, 50));
            RefreshScreen();
            Assert.NotEqual(GetPixel(PointAt(450, 350)), ColorWhite());
            FreeSprite(testSprite);
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestDrawSpriteIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testSprite = CreateSprite(testBitmap);
            SpriteSetPosition(testSprite, PointAt(400, 300));
            DrawSprite(testSprite);
            RefreshScreen();
            Assert.True(SpriteOnScreenAt(testSprite, PointAt(400, 300)));
            FreeSprite(testSprite);
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestDrawSpriteOffsetXYIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testSprite = CreateSprite(testBitmap);
            SpriteSetPosition(testSprite, PointAt(400, 300));
            DrawSprite(testSprite, 50, 50);
            RefreshScreen();
            Assert.True(PointInCircle(PointAt(450, 350), SpriteCollisionCircle(testSprite)));
            FreeSprite(testSprite);
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestFreeAllSpritesIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testSprite = CreateSprite(testBitmap);
            FreeAllSprites();
            Assert.False(HasSprite("test_sprite"));
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestFreeSpriteIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testSprite = CreateSprite(testBitmap);
            FreeSprite(testSprite);
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestFreeSpritePackIntegration()
        {
            CreateSpritePack("test_pack");
            var testHasPack = HasSpritePack("test_pack");
            Assert.True(testHasPack);
            FreeSpritePack("test_pack");
            var testHasPack = HasSpritePack("test_pack");
            Assert.False(testHasPack);
        }
        [Fact]
        public void TestHasSpriteIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testSprite = CreateSprite(testBitmap);
            Assert.True(HasSprite("test_sprite"));
            FreeSprite(testSprite);
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestHasSpritePackIntegration()
        {
            CreateSpritePack("test_pack");
            Assert.True(HasSpritePack("test_pack"));
            Assert.False(HasSpritePack("non_existent_pack"));
            FreeSpritePack("test_pack");
        }
        [Fact]
        public void TestMoveSpriteIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testSprite = CreateSprite(testBitmap);
            SpriteSetVelocity(testSprite, VectorTo(10.0, 10.0));
            SpriteSetPosition(testSprite, PointAt(100.0, 100.0));
            MoveSprite(testSprite);
            ProcessEvents();
            Assert.NotEqual(SpritePosition(testSprite), PointAt(100.0, 100.0));
            FreeSprite(testSprite);
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestMoveSpriteByVectorIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testSprite = CreateSprite(testBitmap);
            SpriteSetPosition(testSprite, PointAt(100, 100));
            MoveSprite(testSprite, VectorTo(50, 50));
            ProcessEvents();
            Assert.Equal(SpriteX(testSprite), 150);
            Assert.Equal(SpriteY(testSprite), 150);
            FreeSprite(testSprite);
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestMoveSpriteByVectorPercentIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testSprite = CreateSprite(testBitmap);
            SpriteSetPosition(testSprite, PointAt(100.0, 100.0));
            MoveSprite(testSprite, VectorTo(50.0, 50.0), 0.5);
            Assert.Equal(SpriteX(testSprite), 125.0);
            Assert.Equal(SpriteY(testSprite), 125.0);
            FreeSprite(testSprite);
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestMoveSpritePercentIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testSprite = CreateSprite(testBitmap);
            SpriteSetPosition(testSprite, PointAt(100.0, 100.0));
            SpriteSetVelocity(testSprite, VectorTo(10.0, 10.0));
            MoveSprite(testSprite, 0.5);
            ProcessEvents();
            Assert.True(PointInCircle(PointAt(105.0, 105.0), SpriteCircle(testSprite)));
            FreeSprite(testSprite);
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestMoveSpriteToIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testSprite = CreateSprite(testBitmap);
            MoveSpriteTo(testSprite, 400.0, 300.0);
            Assert.Equal(SpriteX(testSprite), 400.0);
            Assert.Equal(SpriteY(testSprite), 300.0);
            FreeSprite(testSprite);
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestSelectSpritePackIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            CreateSpritePack("test_pack");
            var testSprite = CreateSprite("rocket_sprt.png");
            SelectSpritePack("test_pack");
            DrawAllSprites();
            Assert.True(SpriteOnScreenAt(testSprite, PointAt(400, 300)));
            FreeAllSprites();
            FreeSpritePack("test_pack");
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestSpriteAddLayerIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testSprite = CreateSprite(testBitmap);
            var newLayerBitmap = CreateBitmap("new_layer_bitmap", 50, 50);
            var layerIndex = SpriteAddLayer(testSprite, newLayerBitmap, "new_layer");
            Assert.True(layerIndex > -1);
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
            var testSprite = CreateSprite(testBitmap);
            SpriteSetPosition(testSprite, PointAt(400, 300));
            SpriteAddToVelocity(testSprite, VectorTo(10, 10));
            UpdateSprite(testSprite);
            Assert.Equal(SpriteX(testSprite), 410);
            Assert.Equal(SpriteY(testSprite), 310);
            FreeSprite(testSprite);
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestSpriteAddValueIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testSprite = CreateSprite(testBitmap);
            SpriteAddValue(testSprite, "health");
            Assert.True(SpriteHasValue(testSprite, "health"));
            FreeSprite(testSprite);
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestSpriteAddValueWithDefaultIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testSprite = CreateSprite(testBitmap);
            SpriteAddValue(testSprite, "health", 100.0);
            Assert.True(SpriteHasValue(testSprite, "health"));
            Assert.Equal(SpriteValue(testSprite, "health"), 100.0);
            FreeSprite(testSprite);
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestSpriteAnchorPointIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testSprite = CreateSprite(testBitmap);
            var testAnchorPoint = SpriteAnchorPoint(testSprite);
            Assert.Equal(testAnchorPoint.X, 50);
            Assert.Equal(testAnchorPoint.Y, 50);
            FreeSprite(testSprite);
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestSpriteAnchorPositionIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testSprite = CreateSprite(testBitmap);
            SpriteSetPosition(testSprite, PointAt(100, 100));
            var testAnchorPosition = SpriteAnchorPosition(testSprite);
            Assert.Equal(testAnchorPosition.X, 100);
            Assert.Equal(testAnchorPosition.Y, 100);
            FreeSprite(testSprite);
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestSpriteAnimationHasEndedIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testSprite = CreateSprite(testBitmap);
            SpriteStartAnimation(testSprite, "default");
            UpdateSpriteAnimation(testSprite);
            Assert.False(SpriteAnimationHasEnded(testSprite));
            UpdateSpriteAnimation(testSprite);
            Assert.True(SpriteAnimationHasEnded(testSprite));
            FreeSprite(testSprite);
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestSpriteAnimationNameIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testSprite = CreateSprite(testBitmap);
            SpriteStartAnimation(testSprite, "default");
            var testAnimationName = SpriteAnimationName(testSprite);
            Assert.Equal(testAnimationName, "default");
            FreeSprite(testSprite);
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestSpriteAtIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testSprite = CreateSprite(testBitmap);
            SpriteSetPosition(testSprite, PointAt(400, 300));
            ProcessEvents();
            Assert.True(SpriteAt(testSprite, PointAt(400, 300)));
            Assert.False(SpriteAt(testSprite, PointAt(500, 400)));
            FreeSprite(testSprite);
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestSpriteBringLayerForwardIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testSprite = CreateSprite(testBitmap);
            var layerIndex = SpriteAddLayer(testSprite, testBitmap, "layer2");
            var initialLayerPosition = SpriteVisibleIndexOfLayer(testSprite, layerIndex);
            SpriteBringLayerForward(testSprite, layerIndex);
            var newLayerPosition = SpriteVisibleIndexOfLayer(testSprite, layerIndex);
            Assert.True(newLayerPosition > initialLayerPosition);
            FreeSprite(testSprite);
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestSpriteBringLayerToFrontIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testSprite = CreateSprite(testBitmap);
            var layerIndex = SpriteAddLayer(testSprite, testBitmap, "layer2");
            SpriteBringLayerToFront(testSprite, layerIndex);
            Assert.Equal(SpriteVisibleIndexOfLayer(testSprite, layerIndex), SpriteVisibleLayerCount(testSprite));
            FreeSprite(testSprite);
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestSpriteCallOnEventIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testSprite = CreateSprite(testBitmap);
            SpriteCallOnEvent(testSprite, OnSpriteEvent());
            ProcessEvents();
            SimulateMouseClick(MouseButton.Left);
            ProcessEvents();
            Assert.True(SpriteEventOccurred(testSprite));
            FreeSprite(testSprite);
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestSpriteCircleIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testSprite = CreateSprite(testBitmap);
            var testCircle = SpriteCircle(testSprite);
            Assert.True(PointInCircle(PointAt(50, 50), testCircle));
            FreeSprite(testSprite);
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestSpriteCollisionBitmapIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testSprite = CreateSprite(testBitmap);
            var collisionBitmap = SpriteCollisionBitmap(testSprite);
            Assert.Equal(BitmapWidth(collisionBitmap), 100);
            Assert.Equal(BitmapHeight(collisionBitmap), 100);
            FreeSprite(testSprite);
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestSpriteCollisionCircleIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testSprite = CreateSprite(testBitmap);
            var testCircle = SpriteCollisionCircle(testSprite);
            Assert.True(PointInCircle(PointAt(50, 50), testCircle));
            FreeSprite(testSprite);
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestSpriteCollisionKindIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testSprite = CreateSprite(testBitmap);
            SpriteSetCollisionKind(testSprite, CollisionTestKind.PixelCollisions);
            Assert.Equal(SpriteCollisionKind(testSprite), CollisionTestKind.PixelCollisions);
            FreeSprite(testSprite);
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestSpriteCollisionRectangleIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testSprite = CreateSprite(testBitmap);
            var testRectangle = SpriteCollisionRectangle(testSprite);
            Assert.Equal(testRectangle.Width, 100);
            Assert.Equal(testRectangle.Height, 100);
            FreeSprite(testSprite);
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestSpriteCurrentCellIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testSprite = CreateSprite(testBitmap);
            SpriteStartAnimation(testSprite, 0);
            UpdateSprite(testSprite);
            Assert.Equal(SpriteCurrentCell(testSprite), 0);
            FreeSprite(testSprite);
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestSpriteCurrentCellRectangleIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testSprite = CreateSprite(testBitmap);
            var testRectangle = SpriteCurrentCellRectangle(testSprite);
            Assert.Equal(RectangleLeft(testRectangle), 0);
            Assert.Equal(RectangleTop(testRectangle), 0);
            Assert.Equal(RectangleRight(testRectangle), BitmapWidth(testBitmap));
            Assert.Equal(RectangleBottom(testRectangle), BitmapHeight(testBitmap));
            FreeSprite(testSprite);
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestSpriteDxIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testSprite = CreateSprite(testBitmap);
            SpriteSetDx(testSprite, 5.0);
            Assert.Equal(SpriteDx(testSprite), 5.0);
            FreeSprite(testSprite);
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestSpriteDyIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testSprite = CreateSprite(testBitmap);
            SpriteSetDy(testSprite, 5.0);
            Assert.Equal(SpriteDy(testSprite), 5.0);
            FreeSprite(testSprite);
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestSpriteHasValueIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testSprite = CreateSprite(testBitmap);
            SpriteAddValue(testSprite, "health");
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
            var testSprite = CreateSprite(testBitmap);
            SpriteSetVelocity(testSprite, VectorTo(1.0, 1.0));
            var testHeading = SpriteHeading(testSprite);
            Assert.InRange(testHeading, 45.0, 45.01);
            FreeSprite(testSprite);
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestSpriteHeightIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testSprite = CreateSprite(testBitmap);
            Assert.Equal(SpriteHeight(testSprite), 100);
            FreeSprite(testSprite);
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestSpriteHideLayerNamedIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testSprite = CreateSprite(testBitmap);
            var layerIndex = SpriteAddLayer(testSprite, testBitmap, "layer2");
            SpriteHideLayer(testSprite, "layer2");
            Assert.False(SpriteLayerVisible(testSprite, layerIndex));
            FreeSprite(testSprite);
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestSpriteHideLayerIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testSprite = CreateSprite(testBitmap);
            var layerIndex = SpriteAddLayer(testSprite, testBitmap, "layer2");
            SpriteShowLayer(testSprite, layerIndex);
            SpriteHideLayer(testSprite, layerIndex);
            Assert.False(SpriteLayerVisible(testSprite, layerIndex));
            FreeSprite(testSprite);
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestSpriteLayerNamedIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testSprite = CreateSprite(testBitmap);
            SpriteAddLayer(testSprite, testBitmap, "layer2");
            var testLayerBitmap = SpriteLayer(testSprite, "layer2");
            Assert.NotNull(testLayerBitmap);
            FreeSprite(testSprite);
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestSpriteLayerAtIndexIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testSprite = CreateSprite(testBitmap);
            var layerIndex = SpriteAddLayer(testSprite, testBitmap, "layer2");
            var testLayerBitmap = SpriteLayer(testSprite, layerIndex);
            Assert.NotNull(testLayerBitmap);
            FreeSprite(testSprite);
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestSpriteLayerCircleNamedIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testSprite = CreateSprite(testBitmap);
            var testCircle = SpriteLayerCircle(testSprite, "layer1");
            Assert.True(PointInCircle(PointAt(50, 50), testCircle));
            FreeSprite(testSprite);
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestSpriteLayerCircleAtIndexIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testSprite = CreateSprite(testBitmap);
            var testCircle = SpriteLayerCircle(testSprite, 0);
            Assert.True(PointInCircle(PointAt(50, 50), testCircle));
            FreeSprite(testSprite);
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestSpriteLayerCountIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testSprite = CreateSprite(testBitmap);
            Assert.Equal(SpriteLayerCount(testSprite), 1);
            SpriteAddLayer(testSprite, testBitmap, "layer2");
            Assert.Equal(SpriteLayerCount(testSprite), 2);
            FreeSprite(testSprite);
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestSpriteLayerHeightNamedIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testSprite = CreateSprite(testBitmap);
            SpriteAddLayer(testSprite, testBitmap, "layer2");
            Assert.Equal(SpriteLayerHeight(testSprite, "layer2"), 100);
            FreeSprite(testSprite);
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestSpriteLayerHeightIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testSprite = CreateSprite(testBitmap);
            var layerHeight = SpriteLayerHeight(testSprite, 0);
            Assert.Equal(layerHeight, 100);
            FreeSprite(testSprite);
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestSpriteLayerIndexIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testSprite = CreateSprite(testBitmap);
            var layerIndex = SpriteAddLayer(testSprite, testBitmap, "layer2");
            Assert.Equal(SpriteLayerIndex(testSprite, "layer2"), layerIndex);
            FreeSprite(testSprite);
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestSpriteLayerNameIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testSprite = CreateSprite(testBitmap);
            var layerIndex = SpriteAddLayer(testSprite, testBitmap, "layer2");
            Assert.Equal(SpriteLayerName(testSprite, layerIndex), "layer2");
            FreeSprite(testSprite);
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestSpriteLayerOffsetNamedIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testSprite = CreateSprite(testBitmap);
            SpriteSetLayerOffset(testSprite, "layer1", VectorTo(10, 10));
            var layerOffset = SpriteLayerOffset(testSprite, "layer1");
            Assert.Equal(layerOffset.X, 10);
            Assert.Equal(layerOffset.Y, 10);
            FreeSprite(testSprite);
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestSpriteLayerOffsetIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testSprite = CreateSprite(testBitmap);
            var layerIndex = SpriteAddLayer(testSprite, testBitmap, "layer2");
            SpriteSetLayerOffset(testSprite, layerIndex, VectorTo(10, 10));
            Assert.Equal(SpriteLayerOffset(testSprite, layerIndex), VectorTo(10, 10));
            FreeSprite(testSprite);
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestSpriteLayerRectangleNamedIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testSprite = CreateSprite(testBitmap);
            var testRectangle = SpriteLayerRectangle(testSprite, "layer1");
            Assert.Equal(RectangleLeft(testRectangle), 0);
            Assert.Equal(RectangleTop(testRectangle), 0);
            Assert.Equal(RectangleRight(testRectangle), 100);
            Assert.Equal(RectangleBottom(testRectangle), 100);
            FreeSprite(testSprite);
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestSpriteLayerRectangleAtIndexIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testSprite = CreateSprite(testBitmap);
            var testRectangle = SpriteLayerRectangle(testSprite, 0);
            Assert.Equal(testRectangle.Width, BitmapWidth(testBitmap));
            FreeSprite(testSprite);
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestSpriteLayerWidthNamedIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testSprite = CreateSprite(testBitmap);
            SpriteAddLayer(testSprite, testBitmap, "layer2");
            Assert.Equal(SpriteLayerWidth(testSprite, "layer2"), 100);
            FreeSprite(testSprite);
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestSpriteLayerWidthIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testSprite = CreateSprite(testBitmap);
            Assert.Equal(SpriteLayerWidth(testSprite, 0), 100);
            FreeSprite(testSprite);
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestSpriteLocationMatrixIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testSprite = CreateSprite(testBitmap);
            SpriteSetPosition(testSprite, PointAt(100.0, 100.0));
            SpriteSetRotation(testSprite, 45.0);
            var testMatrix = SpriteLocationMatrix(testSprite);
            var testPoint = PointAt(50.0, 50.0);
            var resultPoint = MatrixMultiply(testMatrix, testPoint);
            Assert.InRange(resultPoint.X, 149.0, 150.0);
            Assert.InRange(resultPoint.Y, 149.0, 150.0);
            FreeSprite(testSprite);
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestSpriteMassIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testSprite = CreateSprite(testBitmap);
            SpriteSetMass(testSprite, 10.0);
            Assert.Equal(SpriteMass(testSprite), 10.0);
            FreeSprite(testSprite);
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestSpriteMoveFromAnchorPointIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testSprite = CreateSprite(testBitmap);
            SpriteSetMoveFromAnchorPoint(testSprite, true);
            Assert.True(SpriteMoveFromAnchorPoint(testSprite));
            SpriteSetMoveFromAnchorPoint(testSprite, false);
            Assert.False(SpriteMoveFromAnchorPoint(testSprite));
            FreeSprite(testSprite);
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestSpriteMoveToTakingSecondsIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testSprite = CreateSprite(testBitmap);
            SpriteSetPosition(testSprite, PointAt(100, 100));
            SpriteMoveTo(testSprite, PointAt(400, 300), 2.0);
            ProcessEvents();
            Assert.True(PointInCircle(PointAt(400, 300), SpriteCollisionCircle(testSprite)));
            FreeSprite(testSprite);
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestSpriteNameIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testSprite = CreateSprite(testBitmap);
            Assert.Equal(SpriteName(testSprite), "test_sprite");
            FreeSprite(testSprite);
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestSpriteNamedIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testSprite = CreateSprite(testBitmap);
            var namedSprite = SpriteNamed("test_sprite");
            Assert.NotNull(namedSprite);
            FreeSprite(testSprite);
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestSpriteOffscreenIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testSprite = CreateSprite(testBitmap);
            SpriteSetPosition(testSprite, PointAt(0, 0));
            Assert.False(SpriteOffscreen(testSprite));
            SpriteSetPosition(testSprite, PointAt(-100, -100));
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
            var testSprite = CreateSprite(testBitmap);
            SpriteSetPosition(testSprite, PointAt(100, 100));
            DrawSprite(testSprite);
            RefreshScreen();
            Assert.True(SpriteOnScreenAt(testSprite, PointAt(100, 100)));
            Assert.False(SpriteOnScreenAt(testSprite, PointAt(1000, 1000)));
            FreeSprite(testSprite);
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestSpriteOnScreenAtIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testSprite = CreateSprite(testBitmap);
            SpriteSetPosition(testSprite, PointAt(100, 100));
            Assert.True(SpriteOnScreenAt(testSprite, 100, 100));
            Assert.False(SpriteOnScreenAt(testSprite, 1000, 1000));
            FreeSprite(testSprite);
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestSpritePositionIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testSprite = CreateSprite(testBitmap);
            SpriteSetPosition(testSprite, PointAt(100.0, 100.0));
            var testPosition = SpritePosition(testSprite);
            Assert.Equal(testPosition.X, 100.0);
            Assert.Equal(testPosition.Y, 100.0);
            FreeSprite(testSprite);
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestSpriteReplayAnimationIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testSprite = CreateSprite(testBitmap);
            SpriteStartAnimation(testSprite, 0);
            SpriteReplayAnimation(testSprite);
            Assert.True(SpriteAnimationHasEnded(testSprite));
            FreeSprite(testSprite);
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestSpriteReplayAnimationWithSoundIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testSprite = CreateSprite(testBitmap);
            SpriteReplayAnimation(testSprite, true);
            FreeSprite(testSprite);
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestSpriteRotationIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testSprite = CreateSprite(testBitmap);
            SpriteSetRotation(testSprite, 45.0);
            Assert.Equal(SpriteRotation(testSprite), 45.0);
            FreeSprite(testSprite);
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestSpriteScaleIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testSprite = CreateSprite(testBitmap);
            SpriteSetScale(testSprite, 2.0);
            Assert.Equal(SpriteScale(testSprite), 2.0);
            FreeSprite(testSprite);
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestSpriteScreenRectangleIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testSprite = CreateSprite(testBitmap);
            SpriteSetPosition(testSprite, PointAt(100, 100));
            var testRectangle = SpriteScreenRectangle(testSprite);
            Assert.Equal(RectangleLeft(testRectangle), 100);
            Assert.Equal(RectangleTop(testRectangle), 100);
            FreeSprite(testSprite);
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestSpriteSendLayerBackwardIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testSprite = CreateSprite(testBitmap);
            var layerIndex = SpriteAddLayer(testSprite, testBitmap, "layer2");
            SpriteSendLayerBackward(testSprite, layerIndex);
            Assert.True(SpriteVisibleIndexOfLayer(testSprite, layerIndex) < 1);
            FreeSprite(testSprite);
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestSpriteSendLayerToBackIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testSprite = CreateSprite(testBitmap);
            var layerIndex = SpriteAddLayer(testSprite, testBitmap, "layer2");
            SpriteSendLayerToBack(testSprite, layerIndex);
            Assert.Equal(SpriteVisibleIndexOfLayer(testSprite, layerIndex), 0);
            FreeSprite(testSprite);
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestSpriteSetAnchorPointIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testSprite = CreateSprite(testBitmap);
            SpriteSetAnchorPoint(testSprite, PointAt(50, 50));
            var testAnchorPoint = SpriteAnchorPoint(testSprite);
            Assert.Equal(testAnchorPoint.X, 50);
            Assert.Equal(testAnchorPoint.Y, 50);
            FreeSprite(testSprite);
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestSpriteSetCollisionBitmapIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testSprite = CreateSprite(testBitmap);
            SpriteSetCollisionBitmap(testSprite, testBitmap);
            Assert.Equal(SpriteCollisionBitmap(testSprite), testBitmap);
            FreeSprite(testSprite);
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestSpriteSetCollisionKindIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testSprite = CreateSprite(testBitmap);
            SpriteSetCollisionKind(testSprite, CollisionTestKind.PixelCollisions);
            Assert.Equal(SpriteCollisionKind(testSprite), CollisionTestKind.PixelCollisions);
            FreeSprite(testSprite);
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestSpriteSetDxIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testSprite = CreateSprite(testBitmap);
            SpriteSetDx(testSprite, 5.0);
            Assert.Equal(SpriteDx(testSprite), 5.0);
            FreeSprite(testSprite);
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestSpriteSetDyIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testSprite = CreateSprite(testBitmap);
            SpriteSetDy(testSprite, 5.0);
            Assert.Equal(SpriteDy(testSprite), 5.0);
            FreeSprite(testSprite);
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestSpriteSetHeadingIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testSprite = CreateSprite(testBitmap);
            SpriteSetHeading(testSprite, 45.0);
            Assert.Equal(SpriteHeading(testSprite), 45.0);
            FreeSprite(testSprite);
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestSpriteSetLayerOffsetNamedIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testSprite = CreateSprite(testBitmap);
            SpriteSetLayerOffset(testSprite, "layer1", VectorTo(10.0, 10.0));
            var testOffset = SpriteLayerOffset(testSprite, "layer1");
            Assert.Equal(testOffset.X, 10.0);
            Assert.Equal(testOffset.Y, 10.0);
            FreeSprite(testSprite);
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestSpriteSetLayerOffsetAtIndexIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testSprite = CreateSprite(testBitmap);
            SpriteSetLayerOffset(testSprite, 0, VectorTo(10.0, 10.0));
            Assert.Equal(SpriteLayerOffset(testSprite, 0), VectorTo(10.0, 10.0));
            FreeSprite(testSprite);
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestSpriteSetMassIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testSprite = CreateSprite(testBitmap);
            SpriteSetMass(testSprite, 10.0);
            Assert.Equal(SpriteMass(testSprite), 10.0);
            FreeSprite(testSprite);
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestSpriteSetMoveFromAnchorPointIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testSprite = CreateSprite(testBitmap);
            SpriteSetMoveFromAnchorPoint(testSprite, true);
            Assert.True(SpriteMoveFromAnchorPoint(testSprite));
            SpriteSetMoveFromAnchorPoint(testSprite, false);
            Assert.False(SpriteMoveFromAnchorPoint(testSprite));
            FreeSprite(testSprite);
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestSpriteSetPositionIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testSprite = CreateSprite(testBitmap);
            SpriteSetPosition(testSprite, PointAt(100, 100));
            Assert.Equal(SpriteX(testSprite), 100);
            Assert.Equal(SpriteY(testSprite), 100);
            FreeSprite(testSprite);
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestSpriteSetRotationIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testSprite = CreateSprite(testBitmap);
            SpriteSetRotation(testSprite, 45.0);
            Assert.Equal(SpriteRotation(testSprite), 45.0);
            FreeSprite(testSprite);
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestSpriteSetScaleIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testSprite = CreateSprite(testBitmap);
            SpriteSetScale(testSprite, 2.0);
            Assert.Equal(SpriteScale(testSprite), 2.0);
            FreeSprite(testSprite);
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestSpriteSetSpeedIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testSprite = CreateSprite(testBitmap);
            SpriteSetSpeed(testSprite, 5.0);
            Assert.Equal(SpriteSpeed(testSprite), 5.0);
            FreeSprite(testSprite);
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestSpriteSetValueNamedIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testSprite = CreateSprite(testBitmap);
            SpriteAddValue(testSprite, "test_value");
            SpriteSetValue(testSprite, "test_value", 10.5);
            Assert.Equal(SpriteValue(testSprite, "test_value"), 10.5);
            FreeSprite(testSprite);
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestSpriteSetVelocityIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testSprite = CreateSprite(testBitmap);
            SpriteSetVelocity(testSprite, VectorTo(5.0, 5.0));
            UpdateSprite(testSprite);
            Assert.True(SpriteAt(testSprite, PointAt(5.0, 5.0)));
            FreeSprite(testSprite);
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestSpriteSetXIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testSprite = CreateSprite(testBitmap);
            SpriteSetX(testSprite, 150.0);
            Assert.Equal(SpriteX(testSprite), 150.0);
            FreeSprite(testSprite);
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestSpriteSetYIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testSprite = CreateSprite(testBitmap);
            SpriteSetY(testSprite, 300.0);
            Assert.Equal(SpriteY(testSprite), 300.0);
            FreeSprite(testSprite);
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestSpriteShowLayerNamedIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testSprite = CreateSprite(testBitmap);
            var layerIndex = SpriteAddLayer(testSprite, testBitmap, "layer2");
            var result = SpriteShowLayer(testSprite, "layer2");
            Assert.Equal(result, 1);
            FreeSprite(testSprite);
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestSpriteShowLayerIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testSprite = CreateSprite(testBitmap);
            var layerIndex = SpriteAddLayer(testSprite, testBitmap, "layer2");
            SpriteHideLayer(testSprite, 1);
            var result = SpriteShowLayer(testSprite, 1);
            Assert.Equal(result, 1);
            FreeSprite(testSprite);
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestSpriteSpeedIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testSprite = CreateSprite(testBitmap);
            SpriteSetVelocity(testSprite, VectorTo(5.0, 5.0));
            var testSpeed = SpriteSpeed(testSprite);
            Assert.Equal(testSpeed, 7.0710678118654755);
            FreeSprite(testSprite);
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestSpriteStartAnimationNamedIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testSprite = CreateSprite(testBitmap);
            SpriteStartAnimation(testSprite, "test_animation");
            Assert.True(SpriteAnimationName(testSprite));
            FreeSprite(testSprite);
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestSpriteStartAnimationNamedWithSoundIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testSprite = CreateSprite(testBitmap);
            SpriteStartAnimation(testSprite, "test_animation", true);
            UpdateSprite(testSprite);
            Assert.True(SpriteAnimationHasEnded(testSprite));
            FreeSprite(testSprite);
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestSpriteStartAnimationIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testSprite = CreateSprite(testBitmap);
            SpriteStartAnimation(testSprite, 0);
            UpdateSprite(testSprite);
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
            var testSprite = CreateSprite(testBitmap);
            SpriteStartAnimation(testSprite, 0, true);
            UpdateSprite(testSprite);
            Assert.True(SpriteAnimationHasEnded(testSprite));
            FreeSprite(testSprite);
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestSpriteStopCallingOnEventIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testSprite = CreateSprite(testBitmap);
            SpriteCallOnEvent(testSprite, OnSpriteEvent());
            ProcessEvents();
            SimulateSpriteEvent(testSprite);
            ProcessEvents();
            Assert.True(OnSpriteEventCalled());
            SpriteStopCallingOnEvent(testSprite, OnSpriteEvent());
            ProcessEvents();
            SimulateSpriteEvent(testSprite);
            ProcessEvents();
            Assert.False(OnSpriteEventCalled());
            FreeSprite(testSprite);
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestSpriteToggleLayerVisibleNamedIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testSprite = CreateSprite(testBitmap);
            SpriteAddLayer(testSprite, testBitmap, "layer2");
            SpriteToggleLayerVisible(testSprite, "layer2");
            Assert.False(SpriteVisibleLayerCount(testSprite));
            SpriteToggleLayerVisible(testSprite, "layer2");
            Assert.Equal(SpriteVisibleLayerCount(testSprite), 2);
            FreeSprite(testSprite);
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestSpriteToggleLayerVisibleIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testSprite = CreateSprite(testBitmap);
            var layerIndex = SpriteAddLayer(testSprite, testBitmap, "layer2");
            SpriteHideLayer(testSprite, layerIndex);
            SpriteToggleLayerVisible(testSprite, layerIndex);
            Assert.True(SpriteVisibleLayerCount(testSprite));
            FreeSprite(testSprite);
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestSpriteValueIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testSprite = CreateSprite(testBitmap);
            SpriteAddValue(testSprite, "test_value", 10.0);
            var spriteValueResult = SpriteValue(testSprite, "test_value");
            Assert.Equal(spriteValueResult, 10.0);
            FreeSprite(testSprite);
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestSpriteValueCountIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testSprite = CreateSprite(testBitmap);
            SpriteAddValue(testSprite, "health");
            SpriteAddValue(testSprite, "speed");
            Assert.Equal(SpriteValueCount(testSprite), 2);
            FreeSprite(testSprite);
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestSpriteVelocityIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testSprite = CreateSprite(testBitmap);
            SpriteSetVelocity(testSprite, VectorTo(5.0, 5.0));
            var testVelocity = SpriteVelocity(testSprite);
            Assert.Equal(testVelocity.X, 5.0);
            Assert.Equal(testVelocity.Y, 5.0);
            FreeAllSprites();
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestSpriteVisibleIndexOfLayerNamedIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testSprite = CreateSprite(testBitmap);
            SpriteAddLayer(testSprite, testBitmap, "layer2");
            var layerIndex = SpriteVisibleIndexOfLayer(testSprite, "layer2");
            Assert.Equal(layerIndex, 1);
            FreeSprite(testSprite);
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestSpriteVisibleIndexOfLayerIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testSprite = CreateSprite(testBitmap);
            var layerIndex = SpriteAddLayer(testSprite, testBitmap, "layer2");
            SpriteShowLayer(testSprite, layerIndex);
            Assert.Equal(SpriteVisibleIndexOfLayer(testSprite, layerIndex), 1);
            FreeSprite(testSprite);
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestSpriteVisibleLayerIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testSprite = CreateSprite(testBitmap);
            SpriteAddLayer(testSprite, testBitmap, "layer2");
            SpriteShowLayer(testSprite, "layer2");
            Assert.Equal(SpriteVisibleLayer(testSprite, 1), 1);
            FreeSprite(testSprite);
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestSpriteVisibleLayerCountIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testSprite = CreateSprite(testBitmap);
            Assert.Equal(SpriteVisibleLayerCount(testSprite), 1);
            SpriteAddLayer(testSprite, testBitmap, "layer2");
            SpriteShowLayer(testSprite, "layer2");
            Assert.Equal(SpriteVisibleLayerCount(testSprite), 2);
            FreeSprite(testSprite);
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestSpriteVisibleLayerIdIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testSprite = CreateSprite(testBitmap);
            SpriteAddLayer(testSprite, testBitmap, "layer2");
            SpriteShowLayer(testSprite, "layer2");
            Assert.Equal(SpriteVisibleLayerId(testSprite, 1), 1);
            FreeSprite(testSprite);
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestSpriteWidthIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testSprite = CreateSprite(testBitmap);
            Assert.Equal(SpriteWidth(testSprite), 100);
            FreeSprite(testSprite);
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestSpriteXIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testSprite = CreateSprite(testBitmap);
            SpriteSetX(testSprite, 150.0);
            Assert.Equal(SpriteX(testSprite), 150.0);
            FreeSprite(testSprite);
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestSpriteYIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testSprite = CreateSprite(testBitmap);
            SpriteSetY(testSprite, 200.0);
            Assert.Equal(SpriteY(testSprite), 200.0);
            FreeSprite(testSprite);
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestStopCallingOnSpriteEventIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testSprite = CreateSprite(testBitmap);
            CallOnSpriteEvent(OnSpriteEvent());
            ProcessEvents();
            SimulateSpriteEvent(testSprite);
            ProcessEvents();
            Assert.True(SpriteEventOccurred(testSprite));
            StopCallingOnSpriteEvent(OnSpriteEvent());
            ProcessEvents();
            SimulateSpriteEvent(testSprite);
            ProcessEvents();
            Assert.False(SpriteEventOccurred(testSprite));
            FreeSprite(testSprite);
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestUpdateAllSpritesIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testSprite1 = CreateSprite(testBitmap);
            var testSprite2 = CreateSprite(testBitmap);
            SpriteSetPosition(testSprite1, PointAt(100, 100));
            SpriteSetPosition(testSprite2, PointAt(200, 200));
            SpriteSetVelocity(testSprite1, VectorTo(1, 1));
            SpriteSetVelocity(testSprite2, VectorTo(-1, -1));
            UpdateAllSprites();
            Assert.NotEqual(SpritePosition(testSprite1), PointAt(100, 100));
            Assert.NotEqual(SpritePosition(testSprite2), PointAt(200, 200));
            FreeAllSprites();
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestUpdateAllSpritesPercentIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testSprite1 = CreateSprite(testBitmap);
            var testSprite2 = CreateSprite(testBitmap);
            SpriteSetVelocity(testSprite1, VectorTo(1.0, 1.0));
            SpriteSetVelocity(testSprite2, VectorTo(-1.0, -1.0));
            UpdateAllSprites(0.5);
            Assert.True(SpriteAt(testSprite1, PointAt(50.0, 50.0)));
            Assert.True(SpriteAt(testSprite2, PointAt(50.0, 50.0)));
            FreeAllSprites();
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestUpdateSpriteIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testSprite = CreateSprite(testBitmap);
            SpriteSetVelocity(testSprite, VectorTo(1.0, 1.0));
            UpdateSprite(testSprite);
            Assert.NotEqual(SpriteX(testSprite), 0.0);
            Assert.NotEqual(SpriteY(testSprite), 0.0);
            FreeSprite(testSprite);
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestUpdateSpriteWithSoundIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testSprite = CreateSprite(testBitmap);
            SpriteSetVelocity(testSprite, VectorTo(1.0, 1.0));
            SpriteStartAnimation(testSprite, 0, true);
            UpdateSprite(testSprite, true);
            Assert.NotEqual(SpriteX(testSprite), 0.0);
            Assert.NotEqual(SpriteY(testSprite), 0.0);
            FreeSprite(testSprite);
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestUpdateSpritePercentIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testSprite = CreateSprite(testBitmap);
            SpriteSetPosition(testSprite, PointAt(100.0, 100.0));
            SpriteSetVelocity(testSprite, VectorTo(1.0, 1.0));
            UpdateSprite(testSprite, 0.5);
            Assert.True(PointInCircle(PointAt(100.5, 100.5), SpriteCollisionCircle(testSprite)));
            FreeSprite(testSprite);
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestUpdateSpritePercentWithSoundIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testSprite = CreateSprite(testBitmap);
            SpriteSetPosition(testSprite, PointAt(400, 300));
            UpdateSprite(testSprite, 0.5, true);
            FreeSprite(testSprite);
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestUpdateSpriteAnimationIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testSprite = CreateSprite(testBitmap);
            SpriteStartAnimation(testSprite, 0);
            UpdateSpriteAnimation(testSprite);
            Assert.True(SpriteCurrentCell(testSprite) > 0);
            FreeSprite(testSprite);
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestUpdateSpriteAnimationWithSoundIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testSprite = CreateSprite(testBitmap);
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
            var testSprite = CreateSprite(testBitmap);
            UpdateSpriteAnimation(testSprite, 0.5);
            FreeSprite(testSprite);
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestUpdateSpriteAnimationPercentWithSoundIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testSprite = CreateSprite(testBitmap);
            UpdateSpriteAnimation(testSprite, 0.5, true);
            FreeSprite(testSprite);
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestVectorFromCenterSpriteToPointPointIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testSprite = CreateSprite(testBitmap);
            SpriteSetPosition(testSprite, PointAt(400, 300));
            var testVector = VectorFromCenterSpriteToPoint(testSprite, PointAt(500, 400));
            Assert.Equal(testVector.X, 100);
            Assert.Equal(testVector.Y, 100);
            FreeSprite(testSprite);
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestVectorFromToIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testSprite1 = CreateSprite(testBitmap);
            var testSprite2 = CreateSprite(testBitmap);
            SpriteSetPosition(testSprite1, PointAt(100, 100));
            SpriteSetPosition(testSprite2, PointAt(200, 200));
            var testVector = VectorFromTo(testSprite1, testSprite2);
            Assert.Equal(testVector.X, 100);
            Assert.Equal(testVector.Y, 100);
            FreeAllSprites();
            CloseWindow(testWindow);
        }
    }
}
