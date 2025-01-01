using Xunit;
using SplashKitSDK;
using static SplashKitSDK.SplashKit;
using HttpMethod = SplashKitSDK.HttpMethod;
namespace SplashKitTests
{
    public class TestPhysics
    {
        [Fact]
        public void TestBitmapCircleCollisionAtPointIntegration() {
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            using var cleanupBitmap = new BitmapCleanup();
            ClearBitmap(testBitmap, ColorBlack());
            SetupCollisionMask(testBitmap);
            var testCircle = CircleAt(150.0, 150.0, 50.0);
            var testPoint = PointAt(100.0, 100.0);
            Assert.True(BitmapCircleCollision(testBitmap, testPoint, testCircle));
        }
        [Fact]
        public void TestBitmapCircleCollisionIntegration() {
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            using var cleanupBitmap = new BitmapCleanup();
            ClearBitmap(testBitmap, ColorBlack());
            SetupCollisionMask(testBitmap);
            var testCircle = CircleAt(150.0, 150.0, 50.0);
            Assert.True(BitmapCircleCollision(testBitmap, 100.0, 100.0, testCircle));
        }
        [Fact]
        public void TestBitmapCircleCollisionForCellWithTranslationIntegration() {
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            using var cleanupBitmap = new BitmapCleanup();
            ClearBitmap(testBitmap, ColorBlack());
            SetupCollisionMask(testBitmap);
            var testCircle = CircleAt(150.0, 150.0, 50.0);
            var testTranslation = TranslationMatrix(100.0, 100.0);
            Assert.True(BitmapCircleCollision(testBitmap, 0, testTranslation, testCircle));
        }
        [Fact]
        public void TestBitmapCircleCollisionForCellAtPointIntegration() {
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            using var cleanupBitmap = new BitmapCleanup();
            ClearBitmap(testBitmap, ColorBlack());
            SetupCollisionMask(testBitmap);
            var testCircle = CircleAt(150.0, 150.0, 50.0);
            var testPoint = PointAt(100.0, 100.0);
            Assert.True(BitmapCircleCollision(testBitmap, 0, testPoint, testCircle));
        }
        [Fact]
        public void TestBitmapCircleCollisionForCellIntegration() {
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            using var cleanupBitmap = new BitmapCleanup();
            ClearBitmap(testBitmap, ColorBlack());
            SetupCollisionMask(testBitmap);
            var testCircle = CircleAt(150.0, 150.0, 50.0);
            Assert.True(BitmapCircleCollision(testBitmap, 0, 100.0, 100.0, testCircle));
        }
        [Fact]
        public void TestBitmapCollisionIntegration() {
            var testBitmap1 = CreateBitmap("test_bitmap1", 100, 100);
            using var cleanupBitmap = new BitmapCleanup();
            var testBitmap2 = CreateBitmap("test_bitmap2", 100, 100);
            ClearBitmap(testBitmap1, ColorBlack());
            SetupCollisionMask(testBitmap1);
            ClearBitmap(testBitmap2, ColorBlack());
            SetupCollisionMask(testBitmap2);
            Assert.True(BitmapCollision(testBitmap1, 0, 0.0, 0.0, testBitmap2, 0, 50.0, 50.0));
            Assert.False(BitmapCollision(testBitmap1, 0, 0.0, 0.0, testBitmap2, 0, 200.0, 200.0));
        }
        [Fact]
        public void TestBitmapCollisionAtPointsIntegration() {
            var testBitmap1 = CreateBitmap("test_bitmap1", 100, 100);
            using var cleanupBitmap = new BitmapCleanup();
            var testBitmap2 = CreateBitmap("test_bitmap2", 100, 100);
            ClearBitmap(testBitmap1, ColorBlack());
            SetupCollisionMask(testBitmap1);
            ClearBitmap(testBitmap2, ColorBlack());
            SetupCollisionMask(testBitmap2);
            var testPoint1 = PointAt(0.0, 0.0);
            var testPoint2 = PointAt(50.0, 50.0);
            Assert.True(BitmapCollision(testBitmap1, testPoint1, testBitmap2, testPoint2));
        }
        [Fact]
        public void TestBitmapCollisionForCellsWithTranslationsIntegration() {
            var testBitmap1 = CreateBitmap("test_bitmap1", 100, 100);
            using var cleanupBitmap = new BitmapCleanup();
            var testBitmap2 = CreateBitmap("test_bitmap2", 100, 100);
            ClearBitmap(testBitmap1, ColorBlack());
            SetupCollisionMask(testBitmap1);
            ClearBitmap(testBitmap2, ColorBlack());
            SetupCollisionMask(testBitmap2);
            var matrix1 = TranslationMatrix(0.0, 0.0);
            var matrix2 = TranslationMatrix(50.0, 50.0);
            Assert.True(BitmapCollision(testBitmap1, 0, matrix1, testBitmap2, 0, matrix2));
        }
        [Fact]
        public void TestBitmapCollisionForCellsAtPointsIntegration() {
            var testBitmap1 = CreateBitmap("test_bitmap1", 50, 50);
            using var cleanupBitmap = new BitmapCleanup();
            var testBitmap2 = CreateBitmap("test_bitmap2", 50, 50);
            ClearBitmap(testBitmap1, ColorBlack());
            SetupCollisionMask(testBitmap1);
            ClearBitmap(testBitmap2, ColorBlack());
            SetupCollisionMask(testBitmap2);
            var testPoint1 = PointAt(100.0, 100.0);
            var testPoint2 = PointAt(125.0, 125.0);
            Assert.True(BitmapCollision(testBitmap1, 0, testPoint1, testBitmap2, 0, testPoint2));
        }
        [Fact]
        public void TestBitmapCollisionForCellsIntegration() {
            var testBitmap1 = CreateBitmap("test_bitmap1", 100, 100);
            using var cleanupBitmap = new BitmapCleanup();
            var testBitmap2 = CreateBitmap("test_bitmap2", 100, 100);
            ClearBitmap(testBitmap1, ColorBlack());
            ClearBitmap(testBitmap2, ColorBlack());
            SetupCollisionMask(testBitmap1);
            SetupCollisionMask(testBitmap2);
            Assert.False(BitmapCollision(testBitmap1, 0, 100.0, 100.0, testBitmap2, 0, 200.0, 100.0));
            Assert.True(BitmapCollision(testBitmap1, 0, 100.0, 100.0, testBitmap2, 0, 150.0, 100.0));
        }
        [Fact]
        public void TestBitmapPointCollisionWithTranslationIntegration() {
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            using var cleanupBitmap = new BitmapCleanup();
            ClearBitmap(testBitmap, ColorBlack());
            SetupCollisionMask(testBitmap);
            var testTranslation = TranslationMatrix(100.0, 100.0);
            var testPoint1 = PointAt(151.0, 150.0);
            var testPoint2 = PointAt(201.0, 200.0);
            Assert.True(BitmapPointCollision(testBitmap, testTranslation, testPoint1));
            Assert.False(BitmapPointCollision(testBitmap, testTranslation, testPoint2));
        }
        [Fact]
        public void TestBitmapPointCollisionAtPointIntegration() {
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            using var cleanupBitmap = new BitmapCleanup();
            ClearBitmap(testBitmap, ColorBlack());
            SetupCollisionMask(testBitmap);
            var testBmpPoint = PointAt(50.0, 50.0);
            var testPoint = PointAt(101.0, 100.0);
            Assert.True(BitmapPointCollision(testBitmap, testBmpPoint, testPoint));
            Assert.False(BitmapPointCollision(testBitmap, testBmpPoint, PointAt(201.0, 200.0)));
        }
        [Fact]
        public void TestBitmapPointCollisionIntegration() {
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            using var cleanupBitmap = new BitmapCleanup();
            ClearBitmap(testBitmap, ColorBlack());
            SetupCollisionMask(testBitmap);
            Assert.True(BitmapPointCollision(testBitmap, 0.0, 0.0, 51.0, 50.0));
            Assert.False(BitmapPointCollision(testBitmap, 0.0, 0.0, 151.0, 150.0));
        }
        [Fact]
        public void TestBitmapPointCollisionForCellWithTranslationIntegration() {
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            using var cleanupBitmap = new BitmapCleanup();
            ClearBitmap(testBitmap, ColorBlack());
            SetupCollisionMask(testBitmap);
            var testTranslation = TranslationMatrix(100.0, 100.0);
            var testPoint1 = PointAt(151.0, 150.0);
            var testPoint2 = PointAt(201.0, 200.0);
            Assert.True(BitmapPointCollision(testBitmap, 0, testTranslation, testPoint1));
            Assert.False(BitmapPointCollision(testBitmap, 0, testTranslation, testPoint2));
        }
        [Fact]
        public void TestBitmapPointCollisionForCellAtPointIntegration() {
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            using var cleanupBitmap = new BitmapCleanup();
            ClearBitmap(testBitmap, ColorBlack());
            SetupCollisionMask(testBitmap);
            Assert.True(BitmapPointCollision(testBitmap, 0, PointAt(50.0, 50.0), PointAt(101.0, 100.0)));
            Assert.False(BitmapPointCollision(testBitmap, 0, PointAt(51.0, 50.0), PointAt(201.0, 200.0)));
        }
        [Fact]
        public void TestBitmapPointCollisionForCellIntegration() {
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            using var cleanupBitmap = new BitmapCleanup();
            ClearBitmap(testBitmap, ColorBlack());
            DrawPixel(ColorWhite(), 51.0, 50.0, OptionDrawTo(testBitmap));
            SetupCollisionMask(testBitmap);
            Assert.True(BitmapPointCollision(testBitmap, 0, 0.0, 0.0, 51.0, 50.0));
            Assert.False(BitmapPointCollision(testBitmap, 0, 0.0, 0.0, 50.0, 50.0));
        }
        [Fact]
        public void TestBitmapRectangleCollisionAtPointIntegration() {
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            using var cleanupBitmap = new BitmapCleanup();
            ClearBitmap(testBitmap, ColorBlack());
            SetupCollisionMask(testBitmap);
            var testRectangle = RectangleFrom(50.0, 50.0, 100.0, 100.0);
            var testPoint = PointAt(100.0, 100.0);
            Assert.True(BitmapRectangleCollision(testBitmap, testPoint, testRectangle));
        }
        [Fact]
        public void TestBitmapRectangleCollisionIntegration() {
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            using var cleanupBitmap = new BitmapCleanup();
            ClearBitmap(testBitmap, ColorBlack());
            SetupCollisionMask(testBitmap);
            var testRectangle = RectangleFrom(50.0, 50.0, 100.0, 100.0);
            Assert.True(BitmapRectangleCollision(testBitmap, 0.0, 0.0, testRectangle));
        }
        [Fact]
        public void TestBitmapRectangleCollisionForCellWithTranslationIntegration() {
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            using var cleanupBitmap = new BitmapCleanup();
            ClearBitmap(testBitmap, ColorBlack());
            SetupCollisionMask(testBitmap);
            var testRectangle = RectangleFrom(150.0, 150.0, 50.0, 50.0);
            var testTranslation = TranslationMatrix(100.0, 100.0);
            Assert.True(BitmapRectangleCollision(testBitmap, 0, testTranslation, testRectangle));
        }
        [Fact]
        public void TestBitmapRectangleCollisionForCellAtPointIntegration() {
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            using var cleanupBitmap = new BitmapCleanup();
            ClearBitmap(testBitmap, ColorBlack());
            SetupCollisionMask(testBitmap);
            var testRectangle = RectangleFrom(100.0, 100.0, 50.0, 50.0);
            var testPoint = PointAt(100.0, 100.0);
            Assert.True(BitmapRectangleCollision(testBitmap, 0, testPoint, testRectangle));
        }
        [Fact]
        public void TestBitmapRectangleCollisionForCellIntegration() {
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            using var cleanupBitmap = new BitmapCleanup();
            ClearBitmap(testBitmap, ColorBlack());
            SetupCollisionMask(testBitmap);
            var testRectangle = RectangleFrom(50.0, 50.0, 100.0, 100.0);
            Assert.True(BitmapRectangleCollision(testBitmap, 0, 50.0, 50.0, testRectangle));
        }
        [Fact]
        public void TestSpriteBitmapCollisionIntegration() {
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            using var cleanupBitmap = new BitmapCleanup();
            ClearBitmap(testBitmap, ColorBlack());
            SetupCollisionMask(testBitmap);
            var testSprite = CreateSprite(testBitmap);
            using var cleanupSprite = new SpriteCleanup();
            SpriteSetCollisionKind(testSprite, CollisionTestKind.PixelCollisions);
            SpriteSetPosition(testSprite, PointAt(100.0, 100.0));
            Assert.True(SpriteBitmapCollision(testSprite, testBitmap, 100.0, 100.0));
            Assert.False(SpriteBitmapCollision(testSprite, testBitmap, 200.0, 200.0));
        }
        [Fact]
        public void TestSpriteBitmapCollisionWithCellAtPointIntegration() {
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            using var cleanupBitmap = new BitmapCleanup();
            ClearBitmap(testBitmap, ColorBlack());
            SetupCollisionMask(testBitmap);
            var testSprite = CreateSprite(testBitmap);
            using var cleanupSprite = new SpriteCleanup();
            SpriteSetCollisionKind(testSprite, CollisionTestKind.PixelCollisions);
            SpriteSetPosition(testSprite, PointAt(50.0, 50.0));
            Assert.True(SpriteBitmapCollision(testSprite, testBitmap, 0, PointAt(50.0, 50.0)));
        }
        [Fact]
        public void TestSpriteBitmapCollisionWithCellIntegration() {
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            using var cleanupBitmap = new BitmapCleanup();
            ClearBitmap(testBitmap, ColorBlack());
            SetupCollisionMask(testBitmap);
            var testSprite = CreateSprite(testBitmap);
            using var cleanupSprite = new SpriteCleanup();
            SpriteSetCollisionKind(testSprite, CollisionTestKind.PixelCollisions);
            SpriteSetPosition(testSprite, PointAt(50.0, 50.0));
            Assert.True(SpriteBitmapCollision(testSprite, testBitmap, 0, 50.0, 50.0));
        }
        [Fact]
        public void TestSpriteCollisionIntegration() {
            var testBitmap1 = CreateBitmap("test_bitmap_1", 50, 50);
            using var cleanupBitmap = new BitmapCleanup();
            var testBitmap2 = CreateBitmap("test_bitmap_2", 50, 50);
            ClearBitmap(testBitmap1, ColorBlack());
            SetupCollisionMask(testBitmap1);
            ClearBitmap(testBitmap2, ColorBlack());
            SetupCollisionMask(testBitmap2);
            var testSprite1 = CreateSprite(testBitmap1);
            using var cleanupSprite = new SpriteCleanup();
            var testSprite2 = CreateSprite(testBitmap2);
            SpriteSetCollisionKind(testSprite1, CollisionTestKind.PixelCollisions);
            SpriteSetCollisionKind(testSprite2, CollisionTestKind.PixelCollisions);
            SpriteSetPosition(testSprite1, PointAt(100.0, 100.0));
            SpriteSetPosition(testSprite2, PointAt(100.0, 100.0));
            Assert.True(SpriteCollision(testSprite1, testSprite2));
            SpriteSetPosition(testSprite2, PointAt(200.0, 200.0));
            Assert.False(SpriteCollision(testSprite1, testSprite2));
        }
        [Fact]
        public void TestSpritePointCollisionIntegration() {
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            using var cleanupBitmap = new BitmapCleanup();
            ClearBitmap(testBitmap, ColorBlack());
            SetupCollisionMask(testBitmap);
            var testSprite = CreateSprite(testBitmap);
            using var cleanupSprite = new SpriteCleanup();
            SpriteSetCollisionKind(testSprite, CollisionTestKind.PixelCollisions);
            Assert.True(SpritePointCollision(testSprite, PointAt(76.0, 75.0)));
            Assert.False(SpritePointCollision(testSprite, PointAt(200.0, 200.0)));
        }
        [Fact]
        public void TestSpriteRectangleCollisionIntegration() {
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            using var cleanupBitmap = new BitmapCleanup();
            ClearBitmap(testBitmap, ColorBlack());
            SetupCollisionMask(testBitmap);
            var testSprite = CreateSprite(testBitmap);
            using var cleanupSprite = new SpriteCleanup();
            SpriteSetCollisionKind(testSprite, CollisionTestKind.PixelCollisions);
            var testRectangle = RectangleFrom(0.0, 0.0, 100.0, 100.0);
            Assert.True(SpriteRectangleCollision(testSprite, testRectangle));
        }
        [Fact]
        public void TestApplyMatrixToQuadIntegration() {
            var testMatrix = IdentityMatrix();
            var testQuad = QuadFrom(PointAt(100.0, 100.0), PointAt(200.0, 100.0), PointAt(200.0, 200.0), PointAt(100.0, 200.0));
            ApplyMatrix(testMatrix, ref testQuad);
            Assert.Equal(100.0, testQuad.Points[0].X);
            Assert.Equal(100.0, testQuad.Points[0].Y);
        }
        [Fact]
        public void TestApplyMatrixToTriangleIntegration() {
            var testTriangle = TriangleFrom(PointAt(0.0, 0.0), PointAt(1.0, 0.0), PointAt(0.0, 1.0));
            var testMatrix = TranslationMatrix(1.0, 1.0);
            ApplyMatrix(testMatrix, ref testTriangle);
            Assert.Equal(1.0, testTriangle.Points[0].X);
            Assert.Equal(1.0, testTriangle.Points[0].Y);
        }
        [Fact]
        public void TestIdentityMatrixIntegration() {
            var testMatrix = IdentityMatrix();
            Assert.Equal(1.0, testMatrix.Elements[0, 0]);
            Assert.Equal(1.0, testMatrix.Elements[1, 1]);
            Assert.Equal(0.0, testMatrix.Elements[0, 1]);
            Assert.Equal(0.0, testMatrix.Elements[1, 0]);
        }
        [Fact]
        public void TestMatrixInverseIntegration() {
            var testMatrix = ScaleRotateTranslateMatrix(PointAt(2.0, 2.0), 45.0, PointAt(10.0, 10.0));
            var inverseMatrix = MatrixInverse(testMatrix);
            var resultMatrix = MatrixMultiply(testMatrix, inverseMatrix);
            Assert.Equal(1.0, resultMatrix.Elements[0, 0], 2);
            Assert.Equal(1.0, resultMatrix.Elements[1, 1], 2);
        }
        [Fact]
        public void TestMatrixMultiplyPointIntegration() {
            var testMatrix = TranslationMatrix(10.0, 10.0);
            var testPoint = PointAt(10.0, 20.0);
            var resultPoint = MatrixMultiply(testMatrix, testPoint);
            Assert.Equal(20.0, resultPoint.X);
            Assert.Equal(30.0, resultPoint.Y);
        }
        [Fact]
        public void TestMatrixMultiplyMatrixIntegration() {
            var testMatrix1 = ScaleMatrix(2.0);
            var testMatrix2 = TranslationMatrix(10.0, 10.0);
            var resultMatrix = MatrixMultiply(testMatrix2, testMatrix1);
            Assert.Equal(2.0, resultMatrix.Elements[0, 0]);
            Assert.Equal(20.0, resultMatrix.Elements[0, 2]);
        }
        [Fact]
        public void TestMatrixMultiplyVectorIntegration() {
            var testVector = VectorTo(2.0, 2.0);
            var testMatrix = ScaleMatrix(2.0);
            var resultVector = MatrixMultiply(testMatrix, testVector);
            Assert.Equal(4.0, resultVector.X);
            Assert.Equal(4.0, resultVector.Y);
        }
        [Fact]
        public void TestMatrixToStringIntegration() {
            var testMatrix = IdentityMatrix();
            Assert.Equal(" ------------------------------\n|        1         0         0 |\n|        0         1         0 |\n|        0         0         1 |\n ------------------------------", MatrixToString(testMatrix));
        }
        [Fact]
        public void TestRotationMatrixIntegration() {
            var testMatrix = RotationMatrix(90.0);
            var testPoint = PointAt(1.0, 0.0);
            var resultPoint = MatrixMultiply(testMatrix, testPoint);
            Assert.Equal(0.0, resultPoint.X, 2.0);
            Assert.Equal(1.0, resultPoint.Y, 2.0);
        }
        [Fact]
        public void TestScaleMatrixFromPointIntegration() {
            var testScale = PointAt(2.0, 3.0);
            var testMatrix = ScaleMatrix(testScale);
            var testPoint = PointAt(1.0, 1.0);
            var resultPoint = MatrixMultiply(testMatrix, testPoint);
            Assert.Equal(2.0, resultPoint.X);
            Assert.Equal(3.0, resultPoint.Y);
        }
        [Fact]
        public void TestScaleMatrixFromVectorIntegration() {
            var testScale = VectorTo(2.0, 3.0);
            var testMatrix = ScaleMatrix(testScale);
            var testPoint = PointAt(1.0, 1.0);
            var resultPoint = MatrixMultiply(testMatrix, testPoint);
            Assert.Equal(2.0, resultPoint.X);
            Assert.Equal(3.0, resultPoint.Y);
        }
        [Fact]
        public void TestScaleMatrixIntegration() {
            var testPoint = PointAt(1.0, 1.5);
            var testMatrix = ScaleMatrix(2.0);
            var resultPoint = MatrixMultiply(testMatrix, testPoint);
            Assert.Equal(2.0, resultPoint.X);
            Assert.Equal(3.0, resultPoint.Y);
        }
        [Fact]
        public void TestScaleRotateTranslateMatrixIntegration() {
            var testScale = PointAt(2.0, 2.0);
            var testTranslate = PointAt(10.0, 10.0);
            var testMatrix = ScaleRotateTranslateMatrix(testScale, 90.0, testTranslate);
            var testPoint = PointAt(1.0, 0.0);
            var resultPoint = MatrixMultiply(testMatrix, testPoint);
            Assert.Equal(10.0, resultPoint.X);
            Assert.Equal(11.0, resultPoint.Y);
        }
        [Fact]
        public void TestTranslationMatrixToPointIntegration() {
            var testPoint = PointAt(10.0, 20.0);
            var testMatrix = TranslationMatrix(testPoint);
            var testVector = VectorTo(5.0, 5.0);
            var resultPoint = MatrixMultiply(testMatrix, testVector);
            Assert.Equal(15.0, resultPoint.X);
            Assert.Equal(25.0, resultPoint.Y);
        }
        [Fact]
        public void TestTranslationMatrixFromVectorIntegration() {
            var testVector = VectorTo(10.0, 20.0);
            var testMatrix = TranslationMatrix(testVector);
            var testPoint = PointAt(0.0, 0.0);
            var resultPoint = MatrixMultiply(testMatrix, testPoint);
            Assert.Equal(10.0, resultPoint.X);
            Assert.Equal(20.0, resultPoint.Y);
        }
        [Fact]
        public void TestTranslationMatrixIntegration() {
            var testMatrix = TranslationMatrix(10.0, 20.0);
            var testPoint = PointAt(0.0, 0.0);
            var resultPoint = MatrixMultiply(testMatrix, testPoint);
            Assert.Equal(10.0, resultPoint.X);
            Assert.Equal(20.0, resultPoint.Y);
        }
        [Fact]
        public void TestAngleBetweenIntegration() {
            var testVector1 = VectorTo(1.0, 0.0);
            var testVector2 = VectorTo(0.0, 1.0);
            Assert.Equal(90.0, AngleBetween(testVector1, testVector2));
        }
        [Fact]
        public void TestDotProductIntegration() {
            var testVector1 = VectorTo(3.0, 4.0);
            var testVector2 = VectorTo(1.0, 2.0);
            Assert.Equal(11.0, DotProduct(testVector1, testVector2));
        }
        [Fact]
        public void TestIsZeroVectorIntegration() {
            var testZeroVector = VectorTo(0.0, 0.0);
            var testNonZeroVector = VectorTo(1.0, 1.0);
            Assert.True(IsZeroVector(testZeroVector));
            Assert.False(IsZeroVector(testNonZeroVector));
        }
        [Fact]
        public void TestRayIntersectionPointIntegration() {
            var testFromPt = PointAt(0.0, 0.0);
            var testHeading = VectorTo(1.0, 1.0);
            var testLine = LineFrom(PointAt(0.0, 2.0), PointAt(2.0, 0.0));
            var intersectionPoint = PointAt(0.0, 0.0);
            Assert.True(RayIntersectionPoint(testFromPt, testHeading, testLine, ref intersectionPoint));
            Assert.Equal(1.0, intersectionPoint.X);
            Assert.Equal(1.0, intersectionPoint.Y);
        }
        [Fact]
        public void TestUnitVectorIntegration() {
            var testVector = VectorTo(3.0, 4.0);
            var testUnitVector = UnitVector(testVector);
            Assert.Equal(0.6, testUnitVector.X, 2.0);
            Assert.Equal(0.8, testUnitVector.Y);
        }
        [Fact]
        public void TestVectorAddIntegration() {
            var testVector1 = VectorTo(1.0, 2.0);
            var testVector2 = VectorTo(3.0, 4.0);
            var resultVector = VectorAdd(testVector1, testVector2);
            Assert.Equal(4.0, resultVector.X);
            Assert.Equal(6.0, resultVector.Y);
        }
        [Fact]
        public void TestVectorAngleIntegration() {
            var testVector = VectorTo(1.0, 1.0);
            Assert.Equal(45.0, VectorAngle(testVector));
        }
        [Fact]
        public void TestVectorFromAngleIntegration() {
            var testVector = VectorFromAngle(0.0, 1.0);
            Assert.Equal(1.0, testVector.X);
            Assert.Equal(0.0, testVector.Y);
        }
        [Fact]
        public void TestVectorFromLineIntegration() {
            var testLine = LineFrom(PointAt(0.0, 0.0), PointAt(3.0, 4.0));
            var testVector = VectorFromLine(testLine);
            Assert.Equal(3.0, testVector.X);
            Assert.Equal(4.0, testVector.Y);
        }
        [Fact]
        public void TestVectorFromPointToRectIntegration() {
            var testRect = RectangleFrom(0.0, 0.0, 100.0, 100.0);
            var testPoint = PointAt(50.0, 50.0);
            var testVector = VectorFromPointToRect(testPoint, testRect);
            Assert.Equal(0.0, testVector.X);
            Assert.Equal(0.0, testVector.Y);
        }
        [Fact]
        public void TestVectorInRectIntegration() {
            var testRect = RectangleFrom(0.0, 0.0, 100.0, 100.0);
            var testVectorInside = VectorTo(50.0, 50.0);
            var testVectorOutside = VectorTo(150.0, 150.0);
            Assert.True(VectorInRect(testVectorInside, testRect));
            Assert.False(VectorInRect(testVectorOutside, testRect));
        }
        [Fact]
        public void TestVectorInvertIntegration() {
            var testVector = VectorTo(3.0, 4.0);
            var invertedVector = VectorInvert(testVector);
            Assert.Equal(-3.0, invertedVector.X);
            Assert.Equal(-4.0, invertedVector.Y);
        }
        [Fact]
        public void TestVectorLimitIntegration() {
            var testVector = VectorTo(6.0, 8.0);
            var limitedVector = VectorLimit(testVector, 5.0);
            Assert.Equal(3.0, limitedVector.X, 2);
            Assert.Equal(4.0, limitedVector.Y);
        }
        [Fact]
        public void TestVectorMagnitudeIntegration() {
            var testVector = VectorTo(3.0, 4.0);
            Assert.Equal(5.0, VectorMagnitude(testVector));
        }
        [Fact]
        public void TestVectorMagnitudeSquaredIntegration() {
            var testVector = VectorTo(3.0, 4.0);
            Assert.Equal(25.0, VectorMagnitudeSquared(testVector));
        }
        [Fact]
        public void TestVectorMultiplyIntegration() {
            var testVector = VectorTo(3.0, 4.0);
            var resultVector = VectorMultiply(testVector, 2.0);
            Assert.Equal(6.0, resultVector.X);
            Assert.Equal(8.0, resultVector.Y);
        }
        [Fact]
        public void TestVectorNormalIntegration() {
            var testVector = VectorTo(3.0, 4.0);
            var normalVector = VectorNormal(testVector);
            Assert.Equal(-0.8, normalVector.X, 2.0);
            Assert.Equal(0.6, normalVector.Y, 2.0);
        }
        [Fact]
        public void TestVectorOutOfCircleFromCircleIntegration() {
            var testCircleSrc = CircleAt(0.0, 0.0, 5.0);
            var testCircleBounds = CircleAt(8.0, 0.0, 5.0);
            var testVelocity = VectorTo(1.0, 0.0);
            var resultVector = VectorOutOfCircleFromCircle(testCircleSrc, testCircleBounds, testVelocity);
            Assert.Equal(-3.42, resultVector.X, 2.0);
            Assert.Equal(0.0, resultVector.Y);
        }
        [Fact]
        public void TestVectorOutOfCircleFromPointIntegration() {
            var testPoint = PointAt(100.0, 100.0);
            var testCircle = CircleAt(100.0, 100.0, 10.0);
            var testVelocity = VectorTo(1.0, 0.0);
            var resultVector = VectorOutOfCircleFromPoint(testPoint, testCircle, testVelocity);
            Assert.Equal(-11.42, resultVector.X, 2.0);
            Assert.Equal(0.0, resultVector.Y);
        }
        [Fact]
        public void TestVectorOutOfRectFromCircleIntegration() {
            var testCircle = CircleAt(75.0, 75.0, 25.0);
            var testRect = RectangleFrom(0.0, 0.0, 100.0, 100.0);
            var testVelocity = VectorTo(1.0, 0.0);
            var resultVector = VectorOutOfRectFromCircle(testCircle, testRect, testVelocity);
            Assert.Equal(-101.42, resultVector.X);
            Assert.Equal(0.0, resultVector.Y);
        }
        [Fact]
        public void TestVectorOutOfRectFromPointIntegration() {
            var testPoint = PointAt(75.0, 75.0);
            var testRect = RectangleFrom(0.0, 0.0, 100.0, 100.0);
            var testVelocity = VectorTo(1.0, 0.0);
            var resultVector = VectorOutOfRectFromPoint(testPoint, testRect, testVelocity);
            Assert.Equal(-76.4, resultVector.X, 2.0);
            Assert.Equal(0.0, resultVector.Y);
        }
        [Fact]
        public void TestVectorOutOfRectFromRectIntegration() {
            var testSrcRect = RectangleFrom(75.0, 75.0, 50.0, 50.0);
            var testBoundsRect = RectangleFrom(0.0, 0.0, 100.0, 100.0);
            var testVelocity = VectorTo(1.0, 0.0);
            var resultVector = VectorOutOfRectFromRect(testSrcRect, testBoundsRect, testVelocity);
            Assert.Equal(-126.0, resultVector.X);
            Assert.Equal(0.0, resultVector.Y);
        }
        [Fact]
        public void TestVectorPointToPointIntegration() {
            var testStartPoint = PointAt(0.0, 0.0);
            var testEndPoint = PointAt(3.0, 4.0);
            var resultVector = VectorPointToPoint(testStartPoint, testEndPoint);
            Assert.Equal(3.0, resultVector.X);
            Assert.Equal(4.0, resultVector.Y);
        }
        [Fact]
        public void TestVectorSubtractIntegration() {
            var testVector1 = VectorTo(3.0, 4.0);
            var testVector2 = VectorTo(1.0, 1.0);
            var resultVector = VectorSubtract(testVector1, testVector2);
            Assert.Equal(2.0, resultVector.X);
            Assert.Equal(3.0, resultVector.Y);
        }
        [Fact]
        public void TestVectorToPointIntegration() {
            var testPoint = PointAt(3.0, 4.0);
            var resultVector = VectorTo(testPoint);
            Assert.Equal(3.0, resultVector.X);
            Assert.Equal(4.0, resultVector.Y);
        }
        [Fact]
        public void TestVectorToIntegration() {
            var testVector = VectorTo(3.0, 4.0);
            Assert.Equal(3.0, testVector.X);
            Assert.Equal(4.0, testVector.Y);
        }
        [Fact]
        public void TestVectorToStringIntegration() {
            var testVector = VectorTo(3.0, 4.0);
            Assert.Equal("Vec -> 3.000000:4.000000", VectorToString(testVector));
        }
        [Fact]
        public void TestVectorsEqualIntegration() {
            var testVector1 = VectorTo(3.0, 4.0);
            var testVector2 = VectorTo(3.0, 4.0);
            var testVector3 = VectorTo(3.0, 5.0);
            Assert.True(VectorsEqual(testVector1, testVector2));
            Assert.False(VectorsEqual(testVector1, testVector3));
        }
        [Fact]
        public void TestVectorsNotEqualIntegration() {
            var testVector1 = VectorTo(3.0, 4.0);
            var testVector2 = VectorTo(3.0, 4.0);
            var testVector3 = VectorTo(3.0, 5.0);
            Assert.False(VectorsNotEqual(testVector1, testVector2));
            Assert.True(VectorsNotEqual(testVector1, testVector3));
        }
    }
}
