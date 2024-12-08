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
            ClearBitmap(testBitmap, ColorBlack());
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
            ClearBitmap(testBitmap, ColorBlack());
            var testCircle = CircleAt(150.0, 150.0, 50.0);
            Assert.True(BitmapCircleCollision(testBitmap, 100.0, 100.0, testCircle));
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
            Assert.True(BitmapCircleCollision(testBitmap, 0, testTranslation, testCircle));
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestBitmapCircleCollisionForCellAtPointIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            ClearBitmap(testBitmap, ColorBlack());
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
            ClearBitmap(testBitmap, ColorBlack());
            var testCircle = CircleAt(150.0, 150.0, 50.0);
            Assert.True(BitmapCircleCollision(testBitmap, 0, 100.0, 100.0, testCircle));
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestBitmapCollisionIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap1 = CreateBitmap("test_bitmap1", 100, 100);
            var testBitmap2 = CreateBitmap("test_bitmap2", 100, 100);
            ClearBitmap(testBitmap1, ColorBlack());
            ClearBitmap(testBitmap2, ColorBlack());
            Assert.True(BitmapCollision(testBitmap1, 0, 0.0, 0.0, testBitmap2, 0, 50.0, 50.0));
            Assert.False(BitmapCollision(testBitmap1, 0, 0.0, 0.0, testBitmap2, 0, 200.0, 200.0));
            FreeAllBitmaps();
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestBitmapCollisionAtPointsIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap1 = CreateBitmap("test_bitmap1", 100, 100);
            var testBitmap2 = CreateBitmap("test_bitmap2", 100, 100);
            ClearBitmap(testBitmap1, ColorBlack());
            ClearBitmap(testBitmap2, ColorBlack());
            var testPoint1 = PointAt(0.0, 0.0);
            var testPoint2 = PointAt(50.0, 50.0);
            Assert.True(BitmapCollision(testBitmap1, testPoint1, testBitmap2, testPoint2));
            FreeAllBitmaps();
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestBitmapCollisionForCellsWithTranslationsIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap1 = CreateBitmap("test_bitmap1", 100, 100);
            var testBitmap2 = CreateBitmap("test_bitmap2", 100, 100);
            ClearBitmap(testBitmap1, ColorBlack());
            ClearBitmap(testBitmap2, ColorBlack());
            var matrix1 = TranslationMatrix(0.0, 0.0);
            var matrix2 = TranslationMatrix(50.0, 50.0);
            Assert.True(BitmapCollision(testBitmap1, 0, matrix1, testBitmap2, 0, matrix2));
            FreeAllBitmaps();
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestBitmapCollisionForCellsAtPointsIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap1 = CreateBitmap("test_bitmap1", 50, 50);
            var testBitmap2 = CreateBitmap("test_bitmap2", 50, 50);
            ClearBitmap(testBitmap1, ColorBlack());
            ClearBitmap(testBitmap2, ColorBlack());
            var testPoint1 = PointAt(100.0, 100.0);
            var testPoint2 = PointAt(125.0, 125.0);
            Assert.True(BitmapCollision(testBitmap1, 0, testPoint1, testBitmap2, 0, testPoint2));
            FreeAllBitmaps();
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestBitmapCollisionForCellsIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap1 = CreateBitmap("test_bitmap1", 100, 100);
            var testBitmap2 = CreateBitmap("test_bitmap2", 100, 100);
            ClearBitmap(testBitmap1, ColorBlack());
            ClearBitmap(testBitmap2, ColorBlack());
            Assert.False(BitmapCollision(testBitmap1, 0, 100.0, 100.0, testBitmap2, 0, 150.0, 100.0));
            Assert.True(BitmapCollision(testBitmap1, 0, 100.0, 100.0, testBitmap2, 0, 100.0, 100.0));
            FreeAllBitmaps();
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestBitmapPointCollisionWithTranslationIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            ClearBitmap(testBitmap, ColorBlack());
            var testTranslation = TranslationMatrix(100.0, 100.0);
            var testPoint = PointAt(150.0, 150.0);
            Assert.True(BitmapPointCollision(testBitmap, testTranslation, testPoint));
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestBitmapPointCollisionAtPointIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            ClearBitmap(testBitmap, ColorBlack());
            var testBmpPt = PointAt(50.0, 50.0);
            var testPt = PointAt(50.0, 50.0);
            Assert.True(BitmapPointCollision(testBitmap, testBmpPt, testPt));
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestBitmapPointCollisionIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            ClearBitmap(testBitmap, ColorBlack());
            Assert.True(BitmapPointCollision(testBitmap, 0.0, 0.0, 50.0, 50.0));
            Assert.False(BitmapPointCollision(testBitmap, 0.0, 0.0, 150.0, 150.0));
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestBitmapPointCollisionForCellWithTranslationIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            ClearBitmap(testBitmap, ColorBlack());
            var testTranslation = TranslationMatrix(100.0, 100.0);
            var testPoint = PointAt(150.0, 150.0);
            Assert.True(BitmapPointCollision(testBitmap, 0, testTranslation, testPoint));
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestBitmapPointCollisionForCellAtPointIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            ClearBitmap(testBitmap, ColorBlack());
            var testPoint = PointAt(100.0, 100.0);
            Assert.True(BitmapPointCollision(testBitmap, 0, testPoint, testPoint));
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestBitmapPointCollisionForCellIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            ClearBitmap(testBitmap, ColorBlack());
            Assert.True(BitmapPointCollision(testBitmap, 0, 100.0, 100.0, 100.0, 100.0));
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestBitmapRectangleCollisionAtPointIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            ClearBitmap(testBitmap, ColorBlack());
            var testRectangle = RectangleFrom(50.0, 50.0, 100.0, 100.0);
            var testPoint = PointAt(100.0, 100.0);
            Assert.True(BitmapRectangleCollision(testBitmap, testPoint, testRectangle));
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestBitmapRectangleCollisionIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            ClearBitmap(testBitmap, ColorBlack());
            var testRectangle = RectangleFrom(50.0, 50.0, 100.0, 100.0);
            Assert.True(BitmapRectangleCollision(testBitmap, 0.0, 0.0, testRectangle));
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestBitmapRectangleCollisionForCellWithTranslationIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            ClearBitmap(testBitmap, ColorBlack());
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
            ClearBitmap(testBitmap, ColorBlack());
            var testRectangle = RectangleFrom(100.0, 100.0, 50.0, 50.0);
            var testPoint = PointAt(100.0, 100.0);
            Assert.True(BitmapRectangleCollision(testBitmap, 0, testPoint, testRectangle));
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestBitmapRectangleCollisionForCellIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            ClearBitmap(testBitmap, ColorBlack());
            var testRectangle = RectangleFrom(50.0, 50.0, 100.0, 100.0);
            Assert.True(BitmapRectangleCollision(testBitmap, 0, 50.0, 50.0, testRectangle));
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestSpriteBitmapCollisionIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            ClearBitmap(testBitmap, ColorBlack());
            var testSprite = CreateSprite(testBitmap);
            SpriteSetCollisionKind(testSprite, pixelCollisions);
            SpriteSetPosition(testSprite, PointAt(100.0, 100.0));
            Assert.True(SpriteBitmapCollision(testSprite, testBitmap, 100.0, 100.0));
            Assert.False(SpriteBitmapCollision(testSprite, testBitmap, 200.0, 200.0));
            FreeAllSprites();
            FreeAllBitmaps();
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestSpriteBitmapCollisionWithCellAtPointIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            ClearBitmap(testBitmap, ColorBlack());
            var testSprite = CreateSprite(testBitmap);
            SpriteSetCollisionKind(testSprite, pixelCollisions);
            SpriteSetPosition(testSprite, PointAt(50.0, 50.0));
            Assert.True(SpriteBitmapCollision(testSprite, testBitmap, 0, PointAt(50.0, 50.0)));
            FreeAllSprites();
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestSpriteBitmapCollisionWithCellIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            ClearBitmap(testBitmap, ColorBlack());
            var testSprite = CreateSprite(testBitmap);
            SpriteSetCollisionKind(testSprite, pixelCollisions);
            SpriteSetPosition(testSprite, PointAt(50.0, 50.0));
            Assert.True(SpriteBitmapCollision(testSprite, testBitmap, 0, 50.0, 50.0));
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
            ClearBitmap(testBitmap1, ColorBlack());
            ClearBitmap(testBitmap2, ColorBlack());
            var testSprite1 = CreateSprite(testBitmap1);
            var testSprite2 = CreateSprite(testBitmap2);
            SpriteSetCollisionKind(testSprite1, pixelCollisions);
            SpriteSetCollisionKind(testSprite2, pixelCollisions);
            SpriteSetPosition(testSprite1, PointAt(100.0, 100.0));
            SpriteSetPosition(testSprite2, PointAt(100.0, 100.0));
            Assert.True(SpriteCollision(testSprite1, testSprite2));
            SpriteSetPosition(testSprite2, PointAt(200.0, 200.0));
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
            ClearBitmap(testBitmap, ColorBlack());
            var testSprite = CreateSprite(testBitmap);
            SpriteSetCollisionKind(testSprite, pixelCollisions);
            Assert.True(SpritePointCollision(testSprite, PointAt(50.0, 50.0)));
            Assert.False(SpritePointCollision(testSprite, PointAt(200.0, 200.0)));
            FreeAllSprites();
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestSpriteRectangleCollisionIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            ClearBitmap(testBitmap, ColorBlack());
            var testSprite = CreateSprite(testBitmap);
            SpriteSetCollisionKind(testSprite, pixelCollisions);
            var testRectangle = RectangleFrom(0.0, 0.0, 100.0, 100.0);
            Assert.True(SpriteRectangleCollision(testSprite, testRectangle));
            FreeAllSprites();
            FreeBitmap(testBitmap);
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestApplyMatrixToQuadIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testMatrix = IdentityMatrix();
            var testQuad = QuadFrom(PointAt(100.0, 100.0), PointAt(200.0, 100.0), PointAt(200.0, 200.0), PointAt(100.0, 200.0));
            ApplyMatrix(testMatrix, testQuad);
            Assert.Equal(100.0, {:value_type=>"array_access_field", :variable_name=>"test_quad", :array_name=>"points", :index=>0, :field=>"x"});
            Assert.Equal(100.0, {:value_type=>"array_access_field", :variable_name=>"test_quad", :array_name=>"points", :index=>0, :field=>"y"});
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestApplyMatrixToTriangleIntegration()
        {
            var testTriangle = TriangleFrom(PointAt(0.0, 0.0), PointAt(1.0, 0.0), PointAt(0.0, 1.0));
            var testMatrix = TranslationMatrix(1.0, 1.0);
            ApplyMatrix(testMatrix, testTriangle);
            Assert.Equal(1.0, {:value_type=>"array_access_field", :variable_name=>"test_triangle", :array_name=>"points", :index=>0, :field=>"x"});
            Assert.Equal(1.0, {:value_type=>"array_access_field", :variable_name=>"test_triangle", :array_name=>"points", :index=>0, :field=>"y"});
        }
        [Fact]
        public void TestIdentityMatrixIntegration()
        {
            var testMatrix = IdentityMatrix();
            Assert.Equal(1.0, {:value_type=>"matrix_access", :variable_name=>"test_matrix", :field=>"elements", :row=>0, :col=>0});
            Assert.Equal(1.0, {:value_type=>"matrix_access", :variable_name=>"test_matrix", :field=>"elements", :row=>1, :col=>1});
            Assert.Equal(0.0, {:value_type=>"matrix_access", :variable_name=>"test_matrix", :field=>"elements", :row=>0, :col=>1});
            Assert.Equal(0.0, {:value_type=>"matrix_access", :variable_name=>"test_matrix", :field=>"elements", :row=>1, :col=>0});
        }
        [Fact]
        public void TestMatrixInverseIntegration()
        {
            var testMatrix = ScaleRotateTranslateMatrix(PointAt(2.0, 2.0), 45.0, PointAt(10.0, 10.0));
            var inverseMatrix = MatrixInverse(testMatrix);
            var resultMatrix = MatrixMultiply(testMatrix, inverseMatrix);
            Assert.Equal(1.0, {:value_type=>"matrix_access", :variable_name=>"result_matrix", :field=>"elements", :row=>0, :col=>0});
            Assert.Equal(1.0, {:value_type=>"matrix_access", :variable_name=>"result_matrix", :field=>"elements", :row=>1, :col=>1});
        }
        [Fact]
        public void TestMatrixMultiplyPointIntegration()
        {
            var testMatrix = TranslationMatrix(10.0, 10.0);
            var testPoint = PointAt(10.0, 20.0);
            var resultPoint = MatrixMultiply(testMatrix, testPoint);
            Assert.Equal(20.0, resultPoint.X);
            Assert.Equal(30.0, resultPoint.Y);
        }
        [Fact]
        public void TestMatrixMultiplyMatrixIntegration()
        {
            var testMatrix1 = ScaleMatrix(2.0);
            var testMatrix2 = TranslationMatrix(10.0, 10.0);
            var resultMatrix = MatrixMultiply(testMatrix1, testMatrix2);
            Assert.Equal(2.0, {:value_type=>"matrix_access", :variable_name=>"result_matrix", :field=>"elements", :row=>0, :col=>0});
            Assert.Equal(20.0, {:value_type=>"matrix_access", :variable_name=>"result_matrix", :field=>"elements", :row=>0, :col=>2});
        }
        [Fact]
        public void TestMatrixMultiplyVectorIntegration()
        {
            var testVector = VectorTo(2.0, 2.0);
            var testMatrix = ScaleMatrix(2.0);
            var resultVector = MatrixMultiply(testMatrix, testVector);
            Assert.Equal(4.0, resultVector.X);
            Assert.Equal(4.0, resultVector.Y);
        }
        [Fact]
        public void TestMatrixToStringIntegration()
        {
            var testMatrix = IdentityMatrix();
            Assert.Equal(expected, MatrixToString(testMatrix));
        }
        [Fact]
        public void TestRotationMatrixIntegration()
        {
            var testMatrix = RotationMatrix(90.0);
            var testPoint = PointAt(1.0, 0.0);
            var resultPoint = MatrixMultiply(testMatrix, testPoint);
            Assert.InRange(resultPoint.X, -0.1, );
            Assert.InRange(resultPoint.Y, 0.9, );
        }
        [Fact]
        public void TestScaleMatrixFromPointIntegration()
        {
            var testScale = PointAt(2.0, 3.0);
            var testMatrix = ScaleMatrix(testScale);
            var testPoint = PointAt(1.0, 1.0);
            var resultPoint = MatrixMultiply(testMatrix, testPoint);
            Assert.Equal(2.0, resultPoint.X);
            Assert.Equal(3.0, resultPoint.Y);
        }
        [Fact]
        public void TestScaleMatrixFromVectorIntegration()
        {
            var testScale = VectorTo(2.0, 3.0);
            var testMatrix = ScaleMatrix(testScale);
            var testPoint = PointAt(1.0, 1.0);
            var resultPoint = MatrixMultiply(testMatrix, testPoint);
            Assert.Equal(2.0, resultPoint.X);
            Assert.Equal(3.0, resultPoint.Y);
        }
        [Fact]
        public void TestScaleRotateTranslateMatrixIntegration()
        {
            var testScale = PointAt(2.0, 2.0);
            var testTranslate = PointAt(10.0, 10.0);
            var testMatrix = ScaleRotateTranslateMatrix(testScale, 90.0, testTranslate);
            var testPoint = PointAt(1.0, 0.0);
            var resultPoint = MatrixMultiply(testMatrix, testPoint);
            Assert.InRange(resultPoint.X, 9.9, );
            Assert.InRange(resultPoint.Y, 11.9, );
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
            Assert.Equal(90.0, AngleBetween(testVector1, testVector2));
        }
        [Fact]
        public void TestDotProductIntegration()
        {
            var testVector1 = VectorTo(3.0, 4.0);
            var testVector2 = VectorTo(1.0, 2.0);
            Assert.Equal(11.0, DotProduct(testVector1, testVector2));
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
            var intersectionPoint = PointAt(0.0, 0.0);
            Assert.True(RayIntersectionPoint(testFromPt, testHeading, testLine, intersectionPoint));
            Assert.Equal(1.0, intersectionPoint.X);
            Assert.Equal(1.0, intersectionPoint.Y);
        }
        [Fact]
        public void TestUnitVectorIntegration()
        {
            var testVector = VectorTo(3.0, 4.0);
            var testUnitVector = UnitVector(testVector);
            Assert.Equal(0.6, testUnitVector.X);
            Assert.Equal(0.8, testUnitVector.Y);
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
            Assert.Equal(45.0, VectorAngle(testVector));
        }
        [Fact]
        public void TestVectorFromAngleIntegration()
        {
            var testVector = VectorFromAngle(45.0, 1.0);
            Assert.Equal(0.7071, testVector.X);
            Assert.Equal(0.7071, testVector.Y);
        }
        [Fact]
        public void TestVectorFromLineIntegration()
        {
            var testLine = LineFrom(PointAt(0.0, 0.0), PointAt(3.0, 4.0));
            var testVector = VectorFromLine(testLine);
            Assert.Equal(3.0, testVector.X);
            Assert.Equal(4.0, testVector.Y);
        }
        [Fact]
        public void TestVectorFromPointToRectIntegration()
        {
            var testRect = RectangleFrom(0.0, 0.0, 100.0, 100.0);
            var testPoint = PointAt(50.0, 50.0);
            var testVector = VectorFromPointToRect(testPoint, testRect);
            Assert.Equal(0.0, testVector.X);
            Assert.Equal(0.0, testVector.Y);
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
            Assert.Equal(-3.0, invertedVector.X);
            Assert.Equal(-4.0, invertedVector.Y);
        }
        [Fact]
        public void TestVectorLimitIntegration()
        {
            var testVector = VectorTo(6.0, 8.0);
            var limitedVector = VectorLimit(testVector, 5.0);
            Assert.Equal(3.0, limitedVector.X);
            Assert.Equal(4.0, limitedVector.Y);
        }
        [Fact]
        public void TestVectorMagnitudeIntegration()
        {
            var testVector = VectorTo(3.0, 4.0);
            Assert.Equal(5.0, VectorMagnitude(testVector));
        }
        [Fact]
        public void TestVectorMagnitudeSquaredIntegration()
        {
            var testVector = VectorTo(3.0, 4.0);
            Assert.Equal(25.0, VectorMagnitudeSquared(testVector));
        }
        [Fact]
        public void TestVectorMultiplyIntegration()
        {
            var testVector = VectorTo(3.0, 4.0);
            var resultVector = VectorMultiply(testVector, 2.0);
            Assert.Equal(6.0, resultVector.X);
            Assert.Equal(8.0, resultVector.Y);
        }
        [Fact]
        public void TestVectorNormalIntegration()
        {
            var testVector = VectorTo(3.0, 4.0);
            var normalVector = VectorNormal(testVector);
            Assert.Equal(-4.0, normalVector.X);
            Assert.Equal(3.0, normalVector.Y);
        }
        [Fact]
        public void TestVectorOutOfCircleFromCircleIntegration()
        {
            var testCircleSrc = CircleAt(0.0, 0.0, 10.0);
            var testCircleBounds = CircleAt(15.0, 0.0, 10.0);
            var testVelocity = VectorTo(1.0, 0.0);
            var resultVector = VectorOutOfCircleFromCircle(testCircleSrc, testCircleBounds, testVelocity);
            Assert.Equal(-5.0, resultVector.X);
            Assert.Equal(0.0, resultVector.Y);
        }
        [Fact]
        public void TestVectorOutOfCircleFromPointIntegration()
        {
            var testPoint = PointAt(100.0, 100.0);
            var testCircle = CircleAt(150.0, 150.0, 50.0);
            var testVelocity = VectorTo(1.0, 1.0);
            var resultVector = VectorOutOfCircleFromPoint(testPoint, testCircle, testVelocity);
            Assert.Equal(-50.0, resultVector.X);
            Assert.Equal(-50.0, resultVector.Y);
        }
        [Fact]
        public void TestVectorOutOfRectFromCircleIntegration()
        {
            var testCircle = CircleAt(75.0, 75.0, 25.0);
            var testRect = RectangleFrom(0.0, 0.0, 100.0, 100.0);
            var testVelocity = VectorTo(1.0, 0.0);
            var resultVector = VectorOutOfRectFromCircle(testCircle, testRect, testVelocity);
            Assert.Equal(-25.0, resultVector.X);
            Assert.Equal(0.0, resultVector.Y);
        }
        [Fact]
        public void TestVectorOutOfRectFromPointIntegration()
        {
            var testPoint = PointAt(75.0, 75.0);
            var testRect = RectangleFrom(0.0, 0.0, 100.0, 100.0);
            var testVelocity = VectorTo(1.0, 0.0);
            var resultVector = VectorOutOfRectFromPoint(testPoint, testRect, testVelocity);
            Assert.Equal(-25.0, resultVector.X);
            Assert.Equal(0.0, resultVector.Y);
        }
        [Fact]
        public void TestVectorOutOfRectFromRectIntegration()
        {
            var testSrcRect = RectangleFrom(75.0, 75.0, 50.0, 50.0);
            var testBoundsRect = RectangleFrom(0.0, 0.0, 100.0, 100.0);
            var testVelocity = VectorTo(1.0, 0.0);
            var resultVector = VectorOutOfRectFromRect(testSrcRect, testBoundsRect, testVelocity);
            Assert.Equal(-25.0, resultVector.X);
            Assert.Equal(0.0, resultVector.Y);
        }
        [Fact]
        public void TestVectorPointToPointIntegration()
        {
            var testStartPoint = PointAt(0.0, 0.0);
            var testEndPoint = PointAt(3.0, 4.0);
            var resultVector = VectorPointToPoint(testStartPoint, testEndPoint);
            Assert.Equal(3.0, resultVector.X);
            Assert.Equal(4.0, resultVector.Y);
        }
        [Fact]
        public void TestVectorSubtractIntegration()
        {
            var testVector1 = VectorTo(3.0, 4.0);
            var testVector2 = VectorTo(1.0, 1.0);
            var resultVector = VectorSubtract(testVector1, testVector2);
            Assert.Equal(2.0, resultVector.X);
            Assert.Equal(3.0, resultVector.Y);
        }
        [Fact]
        public void TestVectorToPointIntegration()
        {
            var testPoint = PointAt(3.0, 4.0);
            var resultVector = VectorTo(testPoint);
            Assert.Equal(3.0, resultVector.X);
            Assert.Equal(4.0, resultVector.Y);
        }
        [Fact]
        public void TestVectorToIntegration()
        {
            var testVector = VectorTo(3.0, 4.0);
            Assert.Equal(3.0, testVector.X);
            Assert.Equal(4.0, testVector.Y);
        }
        [Fact]
        public void TestVectorToStringIntegration()
        {
            var testVector = VectorTo(3.0, 4.0);
            Assert.Equal("Vec -> 3:4", VectorToString(testVector));
        }
        [Fact]
        public void TestVectorsEqualIntegration()
        {
            var testVector1 = VectorTo(3.0, 4.0);
            var testVector2 = VectorTo(3.0, 4.0);
            var testVector3 = VectorTo(3.0, 5.0);
            Assert.True(VectorsEqual(testVector1, testVector2));
            Assert.False(VectorsEqual(testVector1, testVector3));
        }
        [Fact]
        public void TestVectorsNotEqualIntegration()
        {
            var testVector1 = VectorTo(3.0, 4.0);
            var testVector2 = VectorTo(3.0, 4.0);
            var testVector3 = VectorTo(3.0, 5.0);
            Assert.False(VectorsNotEqual(testVector1, testVector2));
            Assert.True(VectorsNotEqual(testVector1, testVector3));
        }
    }
}
