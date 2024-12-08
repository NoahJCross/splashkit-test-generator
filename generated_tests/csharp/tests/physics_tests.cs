using Xunit;
using static SplashKitSDK.SplashKit;

namespace SplashKitTests
{
    public class IntegrationTests
    {
        [Fact]
        public void TestBitmapCircleCollisionAtPointIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testCircle = CircleAt(150.0, 150.0, 50.0);
            var testPoint = PointAt(100.0, 100.0);
            Assert.True(BitmapCircleCollision(testBitmap, testPoint, testCircle));
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestBitmapCircleCollisionIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testCircle = CircleAt(150.0, 150.0, 50.0);
            var collisionResult = BitmapCircleCollision(testBitmap, 100.0, 100.0, testCircle);
            Assert.True(collisionResult);
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestBitmapCircleCollisionForCellWithTranslationIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            ClearBitmap(testBitmap, ColorBlack());
            var testCircle = CircleAt(150.0, 150.0, 50.0);
            var testTranslation = TranslationMatrix(100.0, 100.0);
            var collisionResult = BitmapCircleCollision(testBitmap, 0, testTranslation, testCircle);
            Assert.True(collisionResult);
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestBitmapCircleCollisionForCellAtPointIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testCircle = CircleAt(150.0, 150.0, 50.0);
            var testPoint = PointAt(100.0, 100.0);
            Assert.True(BitmapCircleCollision(testBitmap, 0, testPoint, testCircle));
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestBitmapCircleCollisionForCellIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testCircle = CircleAt(150.0, 150.0, 50.0);
            var collisionResult = BitmapCircleCollision(testBitmap, 0, 100.0, 100.0, testCircle);
            Assert.True(collisionResult);
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestBitmapCollisionIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap1 = CreateBitmap("test_bitmap1", 100, 100);
            var testBitmap2 = CreateBitmap("test_bitmap2", 100, 100);
            var collisionResult = BitmapCollision(testBitmap1, 0, 0, testBitmap2, 50, 50);
            Assert.True(collisionResult);
            var collisionResult = BitmapCollision(testBitmap1, 0, 0, testBitmap2, 200, 200);
            Assert.False(collisionResult);
            FreeAllBitmaps();
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestBitmapCollisionAtPointsIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap1 = CreateBitmap("test_bitmap1", 100, 100);
            var testBitmap2 = CreateBitmap("test_bitmap2", 100, 100);
            var testPoint1 = PointAt(0, 0);
            var testPoint2 = PointAt(50, 50);
            var collisionResult = BitmapCollision(testBitmap1, testPoint1, testBitmap2, testPoint2);
            Assert.True(collisionResult);
            FreeAllBitmaps();
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestBitmapCollisionForCellsWithTranslationsIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap1 = CreateBitmap("test_bitmap1", 100, 100);
            var testBitmap2 = CreateBitmap("test_bitmap2", 100, 100);
            SetupCollisionMask(testBitmap1);
            SetupCollisionMask(testBitmap2);
            var matrix1 = TranslationMatrix(0, 0);
            var matrix2 = TranslationMatrix(50, 50);
            var collisionResult = BitmapCollision(testBitmap1, 0, matrix1, testBitmap2, 0, matrix2);
            Assert.True(collisionResult);
            FreeBitmap(testBitmap1);
            FreeBitmap(testBitmap2);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestBitmapCollisionForCellsAtPointsIntegration()
        {
            var testWindow = OpenWindow("Collision Test", 800, 600);
            var testBitmap1 = CreateBitmap("test_bitmap1", 50, 50);
            var testBitmap2 = CreateBitmap("test_bitmap2", 50, 50);
            var testPoint1 = PointAt(100.0, 100.0);
            var testPoint2 = PointAt(125.0, 125.0);
            var collisionResult = BitmapCollision(testBitmap1, 0, testPoint1, testBitmap2, 0, testPoint2);
            Assert.True(collisionResult);
            FreeAllBitmaps();
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestBitmapCollisionForCellsIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap1 = CreateBitmap("test_bitmap1", 100, 100);
            var testBitmap2 = CreateBitmap("test_bitmap2", 100, 100);
            var collisionResult = BitmapCollision(testBitmap1, 0, 100.0, 100.0, testBitmap2, 0, 150.0, 100.0);
            Assert.False(collisionResult);
            var collisionResult = BitmapCollision(testBitmap1, 0, 100.0, 100.0, testBitmap2, 0, 100.0, 100.0);
            Assert.True(collisionResult);
            FreeAllBitmaps();
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestBitmapPointCollisionWithTranslationIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            ClearBitmap(testBitmap, ColorBlack());
            var testTranslation = TranslationMatrix(100, 100);
            var testPoint = PointAt(150, 150);
            var collisionResult = BitmapPointCollision(testBitmap, testTranslation, testPoint);
            Assert.True(collisionResult);
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestBitmapPointCollisionAtPointIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testBmpPt = PointAt(50, 50);
            var testPt = PointAt(50, 50);
            var collisionResult = BitmapPointCollision(testBitmap, testBmpPt, testPt);
            Assert.True(collisionResult);
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestBitmapPointCollisionIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            ClearBitmap(testBitmap, ColorBlack());
            var collisionResult = BitmapPointCollision(testBitmap, 0.0, 0.0, 50.0, 50.0);
            Assert.True(collisionResult);
            var collisionResult = BitmapPointCollision(testBitmap, 0.0, 0.0, 150.0, 150.0);
            Assert.False(collisionResult);
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestBitmapPointCollisionForCellWithTranslationIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testTranslation = TranslationMatrix(100.0, 100.0);
            var testPoint = PointAt(150.0, 150.0);
            var collisionResult = BitmapPointCollision(testBitmap, 0, testTranslation, testPoint);
            Assert.True(collisionResult);
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestBitmapPointCollisionForCellAtPointIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testPoint = PointAt(100, 100);
            var collisionResult = BitmapPointCollision(testBitmap, 0, testPoint, testPoint);
            Assert.True(collisionResult);
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestBitmapPointCollisionForCellIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var collisionResult = BitmapPointCollision(testBitmap, 0, 100.0, 100.0, 100.0, 100.0);
            Assert.True(collisionResult);
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestBitmapRectangleCollisionAtPointIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testRectangle = RectangleFrom(50.0, 50.0, 100.0, 100.0);
            var testPoint = PointAt(100.0, 100.0);
            var collisionResult = BitmapRectangleCollision(testBitmap, testPoint, testRectangle);
            Assert.True(collisionResult);
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestBitmapRectangleCollisionIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testRectangle = RectangleFrom(50.0, 50.0, 100.0, 100.0);
            var collisionResult = BitmapRectangleCollision(testBitmap, 0.0, 0.0, testRectangle);
            Assert.True(collisionResult);
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestBitmapRectangleCollisionForCellWithTranslationIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testRectangle = RectangleFrom(150.0, 150.0, 50.0, 50.0);
            var testTranslation = TranslationMatrix(100.0, 100.0);
            Assert.True(BitmapRectangleCollision(testBitmap, 0, testTranslation, testRectangle));
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestBitmapRectangleCollisionForCellAtPointIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testRectangle = RectangleFrom(100.0, 100.0, 50.0, 50.0);
            var testPoint = PointAt(100.0, 100.0);
            var collisionResult = BitmapRectangleCollision(testBitmap, 0, testPoint, testRectangle);
            Assert.True(collisionResult);
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestBitmapRectangleCollisionForCellIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testRectangle = RectangleFrom(50.0, 50.0, 100.0, 100.0);
            var collisionResult = BitmapRectangleCollision(testBitmap, 0, 50.0, 50.0, testRectangle);
            Assert.True(collisionResult);
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestSpriteBitmapCollisionIntegration()
        {
            var testWindow = OpenWindow("Collision Test", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testSprite = CreateSprite(testBitmap);
            var collisionResult = SpriteBitmapCollision(testSprite, testBitmap, 100.0, 100.0);
            Assert.True(collisionResult);
            var collisionResult = SpriteBitmapCollision(testSprite, testBitmap, 200.0, 200.0);
            Assert.False(collisionResult);
            FreeAllSprites();
            FreeAllBitmaps();
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestSpriteBitmapCollisionWithCellAtPointIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testSprite = CreateSprite(testBitmap);
            var collisionResult = SpriteBitmapCollision(testSprite, testBitmap, 0, PointAt(50, 50));
            Assert.True(collisionResult);
            FreeAllSprites();
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestSpriteBitmapCollisionWithCellIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testSprite = CreateSprite(testBitmap);
            var collisionResult = SpriteBitmapCollision(testSprite, testBitmap, 0, 50.0, 50.0);
            Assert.True(collisionResult);
            FreeAllSprites();
            FreeAllBitmaps();
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestSpriteCollisionIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap1 = CreateBitmap("test_bitmap_1", 50, 50);
            var testBitmap2 = CreateBitmap("test_bitmap_2", 50, 50);
            var testSprite1 = CreateSprite(testBitmap1);
            var testSprite2 = CreateSprite(testBitmap2);
            SpriteSetPosition(testSprite1, PointAt(100, 100));
            SpriteSetPosition(testSprite2, PointAt(150, 150));
            Assert.True(SpriteCollision(testSprite1, testSprite2));
            SpriteSetPosition(testSprite2, PointAt(200, 200));
            Assert.False(SpriteCollision(testSprite1, testSprite2));
            FreeAllSprites();
            FreeAllBitmaps();
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestSpritePointCollisionIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testSprite = CreateSprite(testBitmap);
            var collisionResult = SpritePointCollision(testSprite, PointAt(50, 50));
            Assert.True(collisionResult);
            var collisionResult = SpritePointCollision(testSprite, PointAt(200, 200));
            Assert.False(collisionResult);
            FreeAllSprites();
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestSpriteRectangleCollisionIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testSprite = CreateSprite(testBitmap);
            var testRectangle = RectangleFrom(50.0, 50.0, 150.0, 150.0);
            var collisionResult = SpriteRectangleCollision(testSprite, testRectangle);
            Assert.True(collisionResult);
            FreeAllSprites();
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestApplyMatrixToQuadIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testMatrix = IdentityMatrix();
            var testQuad = QuadFrom(PointAt(100, 100), PointAt(200, 100), PointAt(200, 200), PointAt(100, 200));
            ApplyMatrix(testMatrix, testQuad);
            Assert.Equal(quadPoint, PointAt(100, 100));
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestApplyMatrixToTriangleIntegration()
        {
            var testTriangle = TriangleFrom(PointAt(0.0, 0.0), PointAt(1.0, 0.0), PointAt(0.0, 1.0));
            var testMatrix = TranslationMatrix(1.0, 1.0);
            ApplyMatrix(testMatrix, testTriangle);
            Assert.Equal("Triangle(x1: 1.0, y1: 1.0, x2: 2.0, y2: 1.0, x3: 1.0, y3: 2.0)", TriangleToString(testTriangle));
        }
        [Fact]
        public void TestIdentityMatrixIntegration()
        {
            var testMatrix = IdentityMatrix();
            Assert.Equal(1.0, [testMatrix, 0]);
            Assert.Equal(1.0, [testMatrix, 1]);
            Assert.Equal(0.0, [testMatrix, 1]);
            Assert.Equal(0.0, [testMatrix, 0]);
        }
        [Fact]
        public void TestMatrixInverseIntegration()
        {
            var testMatrix = IdentityMatrix();
            var inverseMatrix = MatrixInverse(testMatrix);
            var resultMatrix = MatrixMultiply(testMatrix, inverseMatrix);
            Assert.True(VectorsEqual(VectorTo(1.0, 0.0), MatrixMultiply(resultMatrix, VectorTo(1.0, 0.0))));
        }
        [Fact]
        public void TestMatrixMultiplyPointIntegration()
        {
            var testMatrix = IdentityMatrix();
            var testPoint = PointAt(10.0, 20.0);
            var resultPoint = MatrixMultiply(testMatrix, testPoint);
            Assert.Equal(10.0, resultPoint.X);
            Assert.Equal(20.0, resultPoint.Y);
        }
        [Fact]
        public void TestMatrixMultiplyMatrixIntegration()
        {
            var testMatrix1 = IdentityMatrix();
            var testMatrix2 = RotationMatrix(45);
            var resultMatrix = MatrixMultiply(testMatrix1, testMatrix2);
            Assert.Equal(Cosine(45), [resultMatrix, 0]);
            Assert.Equal(Sine(45), [resultMatrix, 1]);
        }
        [Fact]
        public void TestMatrixMultiplyVectorIntegration()
        {
            var testVector = VectorTo(1.0, 1.0);
            var testMatrix = ScaleMatrix(2.0);
            var resultVector = MatrixMultiply(testMatrix, testVector);
            Assert.Equal(2.0, resultVector.X);
            Assert.Equal(2.0, resultVector.Y);
        }
        [Fact]
        public void TestMatrixToStringIntegration()
        {
            var testMatrix = IdentityMatrix();
            var testMatrixString = MatrixToString(testMatrix);
            Assert.Equal("[1, 0, 0, 1, 0, 0]", testMatrixString);
        }
        [Fact]
        public void TestRotationMatrixIntegration()
        {
            var testMatrix = RotationMatrix(45.0);
            var testVector = VectorTo(1.0, 0.0);
            var resultVector = MatrixMultiply(testMatrix, testVector);
            Assert.InRange(VectorMagnitude(resultVector), 0.99, 1.01);
            Assert.InRange(VectorAngle(resultVector), 44.0, 46.0);
        }
        [Fact]
        public void TestScaleMatrixFromPointIntegration()
        {
            var testScale = PointAt(2.0, 3.0);
            var testMatrix = ScaleMatrix(testScale);
            var testVector = VectorTo(1.0, 1.0);
            var resultVector = MatrixMultiply(testMatrix, testVector);
            Assert.Equal(2.0, resultVector.X);
            Assert.Equal(3.0, resultVector.Y);
        }
        [Fact]
        public void TestScaleMatrixFromVectorIntegration()
        {
            var testScaleVector = VectorTo(2.0, 3.0);
            var testMatrix = ScaleMatrix(testScaleVector);
            var testVector = VectorTo(1.0, 1.0);
            var resultVector = MatrixMultiply(testMatrix, testVector);
            Assert.Equal(2.0, resultVector.X);
            Assert.Equal(3.0, resultVector.Y);
        }
        [Fact]
        public void TestScaleMatrixIntegration()
        {
            var testMatrix = ScaleMatrix(2.0);
            var testVector = VectorTo(1.0, 1.0);
            var resultVector = MatrixMultiply(testMatrix, testVector);
            Assert.Equal(2.0, resultVector.X);
            Assert.Equal(2.0, resultVector.Y);
        }
        [Fact]
        public void TestScaleRotateTranslateMatrixIntegration()
        {
            var testScale = PointAt(2.0, 3.0);
            var testTranslate = PointAt(10.0, 20.0);
            var testMatrix = ScaleRotateTranslateMatrix(testScale, 45.0, testTranslate);
            var testPoint = PointAt(1.0, 1.0);
            var resultPoint = MatrixMultiply(testMatrix, testPoint);
            Assert.InRange(resultPoint.X, 10.0, 10.1);
            Assert.InRange(resultPoint.Y, 23.0, 23.1);
        }
        [Fact]
        public void TestTranslationMatrixToPointIntegration()
        {
            var testPoint = PointAt(10.0, 20.0);
            var testMatrix = TranslationMatrix(testPoint);
            var testVector = PointAt(5.0, 5.0);
            var resultPoint = MatrixMultiply(testMatrix, testVector);
            Assert.Equal(15.0, resultPoint.X);
            Assert.Equal(25.0, resultPoint.Y);
        }
        [Fact]
        public void TestTranslationMatrixFromVectorIntegration()
        {
            var testVector = VectorTo(10.0, 20.0);
            var testMatrix = TranslationMatrix(testVector);
            var testPoint = PointAt(0.0, 0.0);
            var resultPoint = MatrixMultiply(testMatrix, testPoint);
            Assert.Equal(10.0, resultPoint.X);
            Assert.Equal(20.0, resultPoint.Y);
        }
        [Fact]
        public void TestTranslationMatrixIntegration()
        {
            var testMatrix = TranslationMatrix(10.0, 20.0);
            var testPoint = PointAt(0.0, 0.0);
            var resultPoint = MatrixMultiply(testMatrix, testPoint);
            Assert.Equal(10.0, resultPoint.X);
            Assert.Equal(20.0, resultPoint.Y);
        }
        [Fact]
        public void TestAngleBetweenIntegration()
        {
            var testVector1 = VectorTo(1.0, 0.0);
            var testVector2 = VectorTo(0.0, 1.0);
            var testAngle = AngleBetween(testVector1, testVector2);
            Assert.InRange(testAngle, 89.9, 90.1);
        }
        [Fact]
        public void TestDotProductIntegration()
        {
            var testVector1 = VectorTo(3.0, 4.0);
            var testVector2 = VectorTo(1.0, 2.0);
            var testResult = DotProduct(testVector1, testVector2);
            Assert.Equal(11.0, testResult);
        }
        [Fact]
        public void TestIsZeroVectorIntegration()
        {
            var testZeroVector = VectorTo(0.0, 0.0);
            var testNonZeroVector = VectorTo(1.0, 1.0);
            Assert.True(IsZeroVector(testZeroVector));
            Assert.False(IsZeroVector(testNonZeroVector));
        }
        [Fact]
        public void TestRayIntersectionPointIntegration()
        {
            var testFromPt = PointAt(0.0, 0.0);
            var testHeading = VectorTo(1.0, 1.0);
            var testLine = LineFrom(PointAt(0.0, 2.0), PointAt(2.0, 0.0));
            var intersectionResult = RayIntersectionPoint(testFromPt, testHeading, testLine, PointAt(0.0, 0.0));
            Assert.True(intersectionResult);
        }
        [Fact]
        public void TestUnitVectorIntegration()
        {
            var testVector = VectorTo(3.0, 4.0);
            var testUnitVector = UnitVector(testVector);
            Assert.Equal(1.0, VectorMagnitude(testUnitVector));
            Assert.Equal(VectorAngle(testVector), VectorAngle(testUnitVector));
        }
        [Fact]
        public void TestVectorAddIntegration()
        {
            var testVector1 = VectorTo(1.0, 2.0);
            var testVector2 = VectorTo(3.0, 4.0);
            var resultVector = VectorAdd(testVector1, testVector2);
            Assert.Equal(4.0, resultVector.X);
            Assert.Equal(6.0, resultVector.Y);
        }
        [Fact]
        public void TestVectorAngleIntegration()
        {
            var testVector = VectorTo(1.0, 1.0);
            var testAngle = VectorAngle(testVector);
            Assert.InRange(testAngle, 45.0, 45.001);
        }
        [Fact]
        public void TestVectorFromAngleIntegration()
        {
            var testVector = VectorFromAngle(45.0, 1.0);
            Assert.InRange(VectorMagnitude(testVector), 0.99, 1.01);
            Assert.InRange(VectorAngle(testVector), 44.0, 46.0);
        }
        [Fact]
        public void TestVectorFromLineIntegration()
        {
            var testLine = LineFrom(PointAt(0.0, 0.0), PointAt(10.0, 10.0));
            var testVector = VectorFromLine(testLine);
            Assert.Equal(10.0, testVector.X);
            Assert.Equal(10.0, testVector.Y);
        }
        [Fact]
        public void TestVectorFromPointToRectIntegration()
        {
            var testRect = RectangleFrom(0.0, 0.0, 100.0, 100.0);
            var testPoint = PointAt(50.0, 50.0);
            var testVector = VectorFromPointToRect(testPoint, testRect);
            Assert.Equal(0.0, VectorMagnitude(testVector));
        }
        [Fact]
        public void TestVectorInRectIntegration()
        {
            var testRect = RectangleFrom(0.0, 0.0, 100.0, 100.0);
            var testVectorInside = VectorTo(50.0, 50.0);
            var testVectorOutside = VectorTo(150.0, 150.0);
            Assert.True(VectorInRect(testVectorInside, testRect));
            Assert.False(VectorInRect(testVectorOutside, testRect));
        }
        [Fact]
        public void TestVectorInvertIntegration()
        {
            var testVector = VectorTo(3.0, 4.0);
            var invertedVector = VectorInvert(testVector);
            Assert.Equal(invertedVector, VectorTo(-3.0, -4.0));
        }
        [Fact]
        public void TestVectorLimitIntegration()
        {
            var testVector = VectorTo(3.0, 4.0);
            var limitedVector = VectorLimit(testVector, 5.0);
            Assert.True(VectorMagnitude(limitedVector) <= 5.0);
            Assert.True(VectorsEqual(testVector, limitedVector));
        }
        [Fact]
        public void TestVectorMagnitudeIntegration()
        {
            var testVector = VectorTo(3.0, 4.0);
            var testMagnitude = VectorMagnitude(testVector);
            Assert.Equal(5.0, testMagnitude);
        }
        [Fact]
        public void TestVectorMagnitudeSquaredIntegration()
        {
            var testVector = VectorTo(3.0, 4.0);
            var result = VectorMagnitudeSquared(testVector);
            Assert.Equal(25.0, result);
        }
        [Fact]
        public void TestVectorMultiplyIntegration()
        {
            var testVector = VectorTo(3.0, 4.0);
            var resultVector = VectorMultiply(testVector, 2.0);
            Assert.Equal(10.0, VectorMagnitude(resultVector));
            Assert.Equal(VectorAngle(testVector), VectorAngle(resultVector));
        }
        [Fact]
        public void TestVectorNormalIntegration()
        {
            var testVector = VectorTo(3.0, 4.0);
            var normalVector = VectorNormal(testVector);
            Assert.Equal(5.0, VectorMagnitude(normalVector));
            Assert.Equal(53.1301, VectorAngle(normalVector));
        }
        [Fact]
        public void TestVectorOutOfCircleFromCircleIntegration()
        {
            var testCircleSrc = CircleAt(100.0, 100.0, 50.0);
            var testCircleBounds = CircleAt(150.0, 150.0, 75.0);
            var testVelocity = VectorTo(10.0, 10.0);
            var testResultVector = VectorOutOfCircleFromCircle(testCircleSrc, testCircleBounds, testVelocity);
            Assert.True(VectorMagnitude(testResultVector) > 0.0);
            Assert.True(CirclesIntersect(CircleAt(PointOffsetBy(CenterPoint(testCircleSrc), testResultVector), CircleRadius(testCircleSrc)), testCircleBounds));
        }
        [Fact]
        public void TestVectorOutOfCircleFromPointIntegration()
        {
            var testPoint = PointAt(100.0, 100.0);
            var testCircle = CircleAt(150.0, 150.0, 50.0);
            var testVelocity = VectorTo(10.0, 10.0);
            var testResult = VectorOutOfCircleFromPoint(testPoint, testCircle, testVelocity);
            Assert.True(VectorMagnitude(testResult) > 0.0);
        }
        [Fact]
        public void TestVectorOutOfRectFromCircleIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testCircle = CircleAt(100.0, 100.0, 50.0);
            var testRectangle = RectangleFrom(50.0, 50.0, 200.0, 200.0);
            var testVelocity = VectorTo(10.0, 0.0);
            var testResultVector = VectorOutOfRectFromCircle(testCircle, testRectangle, testVelocity);
            Assert.NotEqual(0.0, VectorMagnitude(testResultVector));
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestVectorOutOfRectFromPointIntegration()
        {
            var testPoint = PointAt(50.0, 50.0);
            var testRectangle = RectangleFrom(0.0, 0.0, 100.0, 100.0);
            var testVelocity = VectorTo(1.0, 1.0);
            var resultVector = VectorOutOfRectFromPoint(testPoint, testRectangle, testVelocity);
            Assert.True(PointInRectangle(PointOffsetBy(testPoint, resultVector), testRectangle));
        }
        [Fact]
        public void TestVectorOutOfRectFromRectIntegration()
        {
            var testSrcRect = RectangleFrom(50.0, 50.0, 100.0, 100.0);
            var testBoundsRect = RectangleFrom(0.0, 0.0, 200.0, 200.0);
            var testVelocity = VectorTo(10.0, 10.0);
            var testResultVector = VectorOutOfRectFromRect(testSrcRect, testBoundsRect, testVelocity);
            Assert.NotEqual(0.0, VectorMagnitude(testResultVector));
        }
        [Fact]
        public void TestVectorPointToPointIntegration()
        {
            var testStartPoint = PointAt(0.0, 0.0);
            var testEndPoint = PointAt(3.0, 4.0);
            var testVector = VectorPointToPoint(testStartPoint, testEndPoint);
            Assert.Equal(testVector, VectorTo(3.0, 4.0));
        }
        [Fact]
        public void TestVectorSubtractIntegration()
        {
            var testVector1 = VectorTo(3.0, 4.0);
            var testVector2 = VectorTo(1.0, 1.0);
            var resultVector = VectorSubtract(testVector1, testVector2);
            Assert.Equal(3.0, VectorMagnitude(resultVector));
            Assert.Equal(45.0, VectorAngle(resultVector));
        }
        [Fact]
        public void TestVectorToPointIntegration()
        {
            var testPoint = PointAt(3.0, 4.0);
            var testVector = VectorTo(testPoint);
            Assert.Equal(3.0, testVector.X);
            Assert.Equal(4.0, testVector.Y);
        }
        [Fact]
        public void TestVectorToIntegration()
        {
            var testVector = VectorTo(3.0, 4.0);
            Assert.Equal(5.0, VectorMagnitude(testVector));
            Assert.Equal(53.1301, VectorAngle(testVector));
        }
        [Fact]
        public void TestVectorToStringIntegration()
        {
            var testVector = VectorTo(3.0, 4.0);
            var testString = VectorToString(testVector);
            Assert.Equal("Vector(3.0, 4.0)", testString);
        }
        [Fact]
        public void TestVectorsEqualIntegration()
        {
            var testVector1 = VectorTo(1.0, 1.0);
            var testVector2 = VectorTo(1.0, 1.0);
            Assert.True(VectorsEqual(testVector1, testVector2));
            var testVector3 = VectorTo(1.0, 2.0);
            Assert.False(VectorsEqual(testVector1, testVector3));
        }
        [Fact]
        public void TestVectorsNotEqualIntegration()
        {
            var testVector1 = VectorTo(1.0, 1.0);
            var testVector2 = VectorTo(1.0, 1.0);
            Assert.False(VectorsNotEqual(testVector1, testVector2));
            var testVector3 = VectorTo(1.0, 2.0);
            Assert.True(VectorsNotEqual(testVector1, testVector3));
        }
    }
}
