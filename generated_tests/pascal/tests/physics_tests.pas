uses SplashKit, TestFramework

type
TIntegrationTests = class(TTestCase)
published
procedure TIntegrationTests.TestBitmapCircleCollisionAtPointIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    testBitmap := CreateBitmap("test_bitmap", 100, 100);
    ClearBitmap(testBitmap, ColorBlack());
    testCircle := CircleAt(150.0, 150.0, 50.0);
    testPoint := PointAt(100.0, 100.0);
    AssertTrue(BitmapCircleCollision(testBitmap, testPoint, testCircle));
    FreeBitmap(testBitmap);
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestBitmapCircleCollisionIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    testBitmap := CreateBitmap("test_bitmap", 100, 100);
    ClearBitmap(testBitmap, ColorBlack());
    testCircle := CircleAt(150.0, 150.0, 50.0);
    AssertTrue(BitmapCircleCollision(testBitmap, 100.0, 100.0, testCircle));
    FreeBitmap(testBitmap);
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestBitmapCircleCollisionForCellWithTranslationIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    testBitmap := CreateBitmap("test_bitmap", 100, 100);
    ClearBitmap(testBitmap, ColorBlack());
    testCircle := CircleAt(150.0, 150.0, 50.0);
    testTranslation := TranslationMatrix(100.0, 100.0);
    AssertTrue(BitmapCircleCollision(testBitmap, 0, testTranslation, testCircle));
    FreeBitmap(testBitmap);
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestBitmapCircleCollisionForCellAtPointIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    testBitmap := CreateBitmap("test_bitmap", 100, 100);
    ClearBitmap(testBitmap, ColorBlack());
    testCircle := CircleAt(150.0, 150.0, 50.0);
    testPoint := PointAt(100.0, 100.0);
    AssertTrue(BitmapCircleCollision(testBitmap, 0, testPoint, testCircle));
    FreeBitmap(testBitmap);
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestBitmapCircleCollisionForCellIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    testBitmap := CreateBitmap("test_bitmap", 100, 100);
    ClearBitmap(testBitmap, ColorBlack());
    testCircle := CircleAt(150.0, 150.0, 50.0);
    AssertTrue(BitmapCircleCollision(testBitmap, 0, 100.0, 100.0, testCircle));
    FreeBitmap(testBitmap);
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestBitmapCollisionIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    testBitmap1 := CreateBitmap("test_bitmap1", 100, 100);
    testBitmap2 := CreateBitmap("test_bitmap2", 100, 100);
    ClearBitmap(testBitmap1, ColorBlack());
    ClearBitmap(testBitmap2, ColorBlack());
    AssertTrue(BitmapCollision(testBitmap1, 0, 0.0, 0.0, testBitmap2, 0, 50.0, 50.0));
    AssertFalse(BitmapCollision(testBitmap1, 0, 0.0, 0.0, testBitmap2, 0, 200.0, 200.0));
    FreeAllBitmaps();
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestBitmapCollisionAtPointsIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    testBitmap1 := CreateBitmap("test_bitmap1", 100, 100);
    testBitmap2 := CreateBitmap("test_bitmap2", 100, 100);
    ClearBitmap(testBitmap1, ColorBlack());
    ClearBitmap(testBitmap2, ColorBlack());
    testPoint1 := PointAt(0.0, 0.0);
    testPoint2 := PointAt(50.0, 50.0);
    AssertTrue(BitmapCollision(testBitmap1, testPoint1, testBitmap2, testPoint2));
    FreeAllBitmaps();
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestBitmapCollisionForCellsWithTranslationsIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    testBitmap1 := CreateBitmap("test_bitmap1", 100, 100);
    testBitmap2 := CreateBitmap("test_bitmap2", 100, 100);
    ClearBitmap(testBitmap1, ColorBlack());
    ClearBitmap(testBitmap2, ColorBlack());
    matrix1 := TranslationMatrix(0.0, 0.0);
    matrix2 := TranslationMatrix(50.0, 50.0);
    AssertTrue(BitmapCollision(testBitmap1, 0, matrix1, testBitmap2, 0, matrix2));
    FreeAllBitmaps();
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestBitmapCollisionForCellsAtPointsIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    testBitmap1 := CreateBitmap("test_bitmap1", 50, 50);
    testBitmap2 := CreateBitmap("test_bitmap2", 50, 50);
    ClearBitmap(testBitmap1, ColorBlack());
    ClearBitmap(testBitmap2, ColorBlack());
    testPoint1 := PointAt(100.0, 100.0);
    testPoint2 := PointAt(125.0, 125.0);
    AssertTrue(BitmapCollision(testBitmap1, 0, testPoint1, testBitmap2, 0, testPoint2));
    FreeAllBitmaps();
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestBitmapCollisionForCellsIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    testBitmap1 := CreateBitmap("test_bitmap1", 100, 100);
    testBitmap2 := CreateBitmap("test_bitmap2", 100, 100);
    ClearBitmap(testBitmap1, ColorBlack());
    ClearBitmap(testBitmap2, ColorBlack());
    AssertFalse(BitmapCollision(testBitmap1, 0, 100.0, 100.0, testBitmap2, 0, 150.0, 100.0));
    AssertTrue(BitmapCollision(testBitmap1, 0, 100.0, 100.0, testBitmap2, 0, 100.0, 100.0));
    FreeAllBitmaps();
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestBitmapPointCollisionWithTranslationIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    testBitmap := CreateBitmap("test_bitmap", 100, 100);
    ClearBitmap(testBitmap, ColorBlack());
    testTranslation := TranslationMatrix(100.0, 100.0);
    testPoint := PointAt(150.0, 150.0);
    AssertTrue(BitmapPointCollision(testBitmap, testTranslation, testPoint));
    FreeBitmap(testBitmap);
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestBitmapPointCollisionAtPointIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    testBitmap := CreateBitmap("test_bitmap", 100, 100);
    ClearBitmap(testBitmap, ColorBlack());
    testBmpPt := PointAt(50.0, 50.0);
    testPt := PointAt(50.0, 50.0);
    AssertTrue(BitmapPointCollision(testBitmap, testBmpPt, testPt));
    FreeBitmap(testBitmap);
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestBitmapPointCollisionIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    testBitmap := CreateBitmap("test_bitmap", 100, 100);
    ClearBitmap(testBitmap, ColorBlack());
    AssertTrue(BitmapPointCollision(testBitmap, 0.0, 0.0, 50.0, 50.0));
    AssertFalse(BitmapPointCollision(testBitmap, 0.0, 0.0, 150.0, 150.0));
    FreeBitmap(testBitmap);
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestBitmapPointCollisionForCellWithTranslationIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    testBitmap := CreateBitmap("test_bitmap", 100, 100);
    ClearBitmap(testBitmap, ColorBlack());
    testTranslation := TranslationMatrix(100.0, 100.0);
    testPoint := PointAt(150.0, 150.0);
    AssertTrue(BitmapPointCollision(testBitmap, 0, testTranslation, testPoint));
    FreeBitmap(testBitmap);
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestBitmapPointCollisionForCellAtPointIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    testBitmap := CreateBitmap("test_bitmap", 100, 100);
    ClearBitmap(testBitmap, ColorBlack());
    testPoint := PointAt(100.0, 100.0);
    AssertTrue(BitmapPointCollision(testBitmap, 0, testPoint, testPoint));
    FreeBitmap(testBitmap);
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestBitmapPointCollisionForCellIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    testBitmap := CreateBitmap("test_bitmap", 100, 100);
    ClearBitmap(testBitmap, ColorBlack());
    AssertTrue(BitmapPointCollision(testBitmap, 0, 100.0, 100.0, 100.0, 100.0));
    FreeBitmap(testBitmap);
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestBitmapRectangleCollisionAtPointIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    testBitmap := CreateBitmap("test_bitmap", 100, 100);
    ClearBitmap(testBitmap, ColorBlack());
    testRectangle := RectangleFrom(50.0, 50.0, 100.0, 100.0);
    testPoint := PointAt(100.0, 100.0);
    AssertTrue(BitmapRectangleCollision(testBitmap, testPoint, testRectangle));
    FreeBitmap(testBitmap);
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestBitmapRectangleCollisionIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    testBitmap := CreateBitmap("test_bitmap", 100, 100);
    ClearBitmap(testBitmap, ColorBlack());
    testRectangle := RectangleFrom(50.0, 50.0, 100.0, 100.0);
    AssertTrue(BitmapRectangleCollision(testBitmap, 0.0, 0.0, testRectangle));
    FreeBitmap(testBitmap);
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestBitmapRectangleCollisionForCellWithTranslationIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    testBitmap := CreateBitmap("test_bitmap", 100, 100);
    ClearBitmap(testBitmap, ColorBlack());
    testRectangle := RectangleFrom(150.0, 150.0, 50.0, 50.0);
    testTranslation := TranslationMatrix(100.0, 100.0);
    AssertTrue(BitmapRectangleCollision(testBitmap, 0, testTranslation, testRectangle));
    FreeBitmap(testBitmap);
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestBitmapRectangleCollisionForCellAtPointIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    testBitmap := CreateBitmap("test_bitmap", 100, 100);
    ClearBitmap(testBitmap, ColorBlack());
    testRectangle := RectangleFrom(100.0, 100.0, 50.0, 50.0);
    testPoint := PointAt(100.0, 100.0);
    AssertTrue(BitmapRectangleCollision(testBitmap, 0, testPoint, testRectangle));
    FreeBitmap(testBitmap);
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestBitmapRectangleCollisionForCellIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    testBitmap := CreateBitmap("test_bitmap", 100, 100);
    ClearBitmap(testBitmap, ColorBlack());
    testRectangle := RectangleFrom(50.0, 50.0, 100.0, 100.0);
    AssertTrue(BitmapRectangleCollision(testBitmap, 0, 50.0, 50.0, testRectangle));
    FreeBitmap(testBitmap);
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestSpriteBitmapCollisionIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    testBitmap := CreateBitmap("test_bitmap", 100, 100);
    ClearBitmap(testBitmap, ColorBlack());
    testSprite := CreateSprite(testBitmap);
    SpriteSetCollisionKind(testSprite, pixelCollisions);
    SpriteSetPosition(testSprite, PointAt(100.0, 100.0));
    AssertTrue(SpriteBitmapCollision(testSprite, testBitmap, 100.0, 100.0));
    AssertFalse(SpriteBitmapCollision(testSprite, testBitmap, 200.0, 200.0));
    FreeAllSprites();
    FreeAllBitmaps();
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestSpriteBitmapCollisionWithCellAtPointIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    testBitmap := CreateBitmap("test_bitmap", 100, 100);
    ClearBitmap(testBitmap, ColorBlack());
    testSprite := CreateSprite(testBitmap);
    SpriteSetCollisionKind(testSprite, pixelCollisions);
    SpriteSetPosition(testSprite, PointAt(50.0, 50.0));
    AssertTrue(SpriteBitmapCollision(testSprite, testBitmap, 0, PointAt(50.0, 50.0)));
    FreeAllSprites();
    FreeBitmap(testBitmap);
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestSpriteBitmapCollisionWithCellIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    testBitmap := CreateBitmap("test_bitmap", 100, 100);
    ClearBitmap(testBitmap, ColorBlack());
    testSprite := CreateSprite(testBitmap);
    SpriteSetCollisionKind(testSprite, pixelCollisions);
    SpriteSetPosition(testSprite, PointAt(50.0, 50.0));
    AssertTrue(SpriteBitmapCollision(testSprite, testBitmap, 0, 50.0, 50.0));
    FreeAllSprites();
    FreeAllBitmaps();
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestSpriteCollisionIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    testBitmap1 := CreateBitmap("test_bitmap_1", 50, 50);
    testBitmap2 := CreateBitmap("test_bitmap_2", 50, 50);
    ClearBitmap(testBitmap1, ColorBlack());
    ClearBitmap(testBitmap2, ColorBlack());
    testSprite1 := CreateSprite(testBitmap1);
    testSprite2 := CreateSprite(testBitmap2);
    SpriteSetCollisionKind(testSprite1, pixelCollisions);
    SpriteSetCollisionKind(testSprite2, pixelCollisions);
    SpriteSetPosition(testSprite1, PointAt(100.0, 100.0));
    SpriteSetPosition(testSprite2, PointAt(100.0, 100.0));
    AssertTrue(SpriteCollision(testSprite1, testSprite2));
    SpriteSetPosition(testSprite2, PointAt(200.0, 200.0));
    AssertFalse(SpriteCollision(testSprite1, testSprite2));
    FreeAllSprites();
    FreeAllBitmaps();
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestSpritePointCollisionIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    testBitmap := CreateBitmap("test_bitmap", 100, 100);
    ClearBitmap(testBitmap, ColorBlack());
    testSprite := CreateSprite(testBitmap);
    SpriteSetCollisionKind(testSprite, pixelCollisions);
    AssertTrue(SpritePointCollision(testSprite, PointAt(50.0, 50.0)));
    AssertFalse(SpritePointCollision(testSprite, PointAt(200.0, 200.0)));
    FreeAllSprites();
    FreeBitmap(testBitmap);
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestSpriteRectangleCollisionIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    testBitmap := CreateBitmap("test_bitmap", 100, 100);
    ClearBitmap(testBitmap, ColorBlack());
    testSprite := CreateSprite(testBitmap);
    SpriteSetCollisionKind(testSprite, pixelCollisions);
    testRectangle := RectangleFrom(0.0, 0.0, 100.0, 100.0);
    AssertTrue(SpriteRectangleCollision(testSprite, testRectangle));
    FreeAllSprites();
    FreeBitmap(testBitmap);
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestApplyMatrixToQuadIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    testMatrix := IdentityMatrix();
    testQuad := QuadFrom(PointAt(100.0, 100.0), PointAt(200.0, 100.0), PointAt(200.0, 200.0), PointAt(100.0, 200.0));
    ApplyMatrix(testMatrix, testQuad);
    AssertEquals(100.0, {:value_type=>"array_access_field", :variable_name=>"test_quad", :array_name=>"points", :index=>0, :field=>"x"});
    AssertEquals(100.0, {:value_type=>"array_access_field", :variable_name=>"test_quad", :array_name=>"points", :index=>0, :field=>"y"});
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestApplyMatrixToTriangleIntegration;
begin
    testTriangle := TriangleFrom(PointAt(0.0, 0.0), PointAt(1.0, 0.0), PointAt(0.0, 1.0));
    testMatrix := TranslationMatrix(1.0, 1.0);
    ApplyMatrix(testMatrix, testTriangle);
    AssertEquals(1.0, {:value_type=>"array_access_field", :variable_name=>"test_triangle", :array_name=>"points", :index=>0, :field=>"x"});
    AssertEquals(1.0, {:value_type=>"array_access_field", :variable_name=>"test_triangle", :array_name=>"points", :index=>0, :field=>"y"});
end;
procedure TIntegrationTests.TestIdentityMatrixIntegration;
begin
    testMatrix := IdentityMatrix();
    AssertEquals(1.0, {:value_type=>"matrix_access", :variable_name=>"test_matrix", :field=>"elements", :row=>0, :col=>0});
    AssertEquals(1.0, {:value_type=>"matrix_access", :variable_name=>"test_matrix", :field=>"elements", :row=>1, :col=>1});
    AssertEquals(0.0, {:value_type=>"matrix_access", :variable_name=>"test_matrix", :field=>"elements", :row=>0, :col=>1});
    AssertEquals(0.0, {:value_type=>"matrix_access", :variable_name=>"test_matrix", :field=>"elements", :row=>1, :col=>0});
end;
procedure TIntegrationTests.TestMatrixInverseIntegration;
begin
    testMatrix := ScaleRotateTranslateMatrix(PointAt(2.0, 2.0), 45.0, PointAt(10.0, 10.0));
    inverseMatrix := MatrixInverse(testMatrix);
    resultMatrix := MatrixMultiply(testMatrix, inverseMatrix);
    AssertEquals(1.0, {:value_type=>"matrix_access", :variable_name=>"result_matrix", :field=>"elements", :row=>0, :col=>0});
    AssertEquals(1.0, {:value_type=>"matrix_access", :variable_name=>"result_matrix", :field=>"elements", :row=>1, :col=>1});
end;
procedure TIntegrationTests.TestMatrixMultiplyPointIntegration;
begin
    testMatrix := TranslationMatrix(10.0, 10.0);
    testPoint := PointAt(10.0, 20.0);
    resultPoint := MatrixMultiply(testMatrix, testPoint);
    AssertEquals(20.0, resultPoint.x);
    AssertEquals(30.0, resultPoint.y);
end;
procedure TIntegrationTests.TestMatrixMultiplyMatrixIntegration;
begin
    testMatrix1 := ScaleMatrix(2.0);
    testMatrix2 := TranslationMatrix(10.0, 10.0);
    resultMatrix := MatrixMultiply(testMatrix1, testMatrix2);
    AssertEquals(2.0, {:value_type=>"matrix_access", :variable_name=>"result_matrix", :field=>"elements", :row=>0, :col=>0});
    AssertEquals(20.0, {:value_type=>"matrix_access", :variable_name=>"result_matrix", :field=>"elements", :row=>0, :col=>2});
end;
procedure TIntegrationTests.TestMatrixMultiplyVectorIntegration;
begin
    testVector := VectorTo(2.0, 2.0);
    testMatrix := ScaleMatrix(2.0);
    resultVector := MatrixMultiply(testMatrix, testVector);
    AssertEquals(4.0, resultVector.x);
    AssertEquals(4.0, resultVector.y);
end;
procedure TIntegrationTests.TestMatrixToStringIntegration;
begin
    testMatrix := IdentityMatrix();
    AssertEquals(expected, MatrixToString(testMatrix));
end;
procedure TIntegrationTests.TestRotationMatrixIntegration;
begin
    testMatrix := RotationMatrix(90.0);
    testPoint := PointAt(1.0, 0.0);
    resultPoint := MatrixMultiply(testMatrix, testPoint);
    AssertTrue((resultPoint.x >= -0.1) and (resultPoint.x <= ));
    AssertTrue((resultPoint.y >= 0.9) and (resultPoint.y <= ));
end;
procedure TIntegrationTests.TestScaleMatrixFromPointIntegration;
begin
    testScale := PointAt(2.0, 3.0);
    testMatrix := ScaleMatrix(testScale);
    testPoint := PointAt(1.0, 1.0);
    resultPoint := MatrixMultiply(testMatrix, testPoint);
    AssertEquals(2.0, resultPoint.x);
    AssertEquals(3.0, resultPoint.y);
end;
procedure TIntegrationTests.TestScaleMatrixFromVectorIntegration;
begin
    testScale := VectorTo(2.0, 3.0);
    testMatrix := ScaleMatrix(testScale);
    testPoint := PointAt(1.0, 1.0);
    resultPoint := MatrixMultiply(testMatrix, testPoint);
    AssertEquals(2.0, resultPoint.x);
    AssertEquals(3.0, resultPoint.y);
end;
procedure TIntegrationTests.TestScaleRotateTranslateMatrixIntegration;
begin
    testScale := PointAt(2.0, 2.0);
    testTranslate := PointAt(10.0, 10.0);
    testMatrix := ScaleRotateTranslateMatrix(testScale, 90.0, testTranslate);
    testPoint := PointAt(1.0, 0.0);
    resultPoint := MatrixMultiply(testMatrix, testPoint);
    AssertTrue((resultPoint.x >= 9.9) and (resultPoint.x <= ));
    AssertTrue((resultPoint.y >= 11.9) and (resultPoint.y <= ));
end;
procedure TIntegrationTests.TestTranslationMatrixToPointIntegration;
begin
    testPoint := PointAt(10.0, 20.0);
    testMatrix := TranslationMatrix(testPoint);
    testVector := PointAt(5.0, 5.0);
    resultPoint := MatrixMultiply(testMatrix, testVector);
    AssertEquals(15.0, resultPoint.x);
    AssertEquals(25.0, resultPoint.y);
end;
procedure TIntegrationTests.TestTranslationMatrixFromVectorIntegration;
begin
    testVector := VectorTo(10.0, 20.0);
    testMatrix := TranslationMatrix(testVector);
    testPoint := PointAt(0.0, 0.0);
    resultPoint := MatrixMultiply(testMatrix, testPoint);
    AssertEquals(10.0, resultPoint.x);
    AssertEquals(20.0, resultPoint.y);
end;
procedure TIntegrationTests.TestTranslationMatrixIntegration;
begin
    testMatrix := TranslationMatrix(10.0, 20.0);
    testPoint := PointAt(0.0, 0.0);
    resultPoint := MatrixMultiply(testMatrix, testPoint);
    AssertEquals(10.0, resultPoint.x);
    AssertEquals(20.0, resultPoint.y);
end;
procedure TIntegrationTests.TestAngleBetweenIntegration;
begin
    testVector1 := VectorTo(1.0, 0.0);
    testVector2 := VectorTo(0.0, 1.0);
    AssertEquals(90.0, AngleBetween(testVector1, testVector2));
end;
procedure TIntegrationTests.TestDotProductIntegration;
begin
    testVector1 := VectorTo(3.0, 4.0);
    testVector2 := VectorTo(1.0, 2.0);
    AssertEquals(11.0, DotProduct(testVector1, testVector2));
end;
procedure TIntegrationTests.TestIsZeroVectorIntegration;
begin
    testZeroVector := VectorTo(0.0, 0.0);
    testNonZeroVector := VectorTo(1.0, 1.0);
    AssertTrue(IsZeroVector(testZeroVector));
    AssertFalse(IsZeroVector(testNonZeroVector));
end;
procedure TIntegrationTests.TestRayIntersectionPointIntegration;
begin
    testFromPt := PointAt(0.0, 0.0);
    testHeading := VectorTo(1.0, 1.0);
    testLine := LineFrom(PointAt(0.0, 2.0), PointAt(2.0, 0.0));
    intersectionPoint := PointAt(0.0, 0.0);
    AssertTrue(RayIntersectionPoint(testFromPt, testHeading, testLine, intersectionPoint));
    AssertEquals(1.0, intersectionPoint.x);
    AssertEquals(1.0, intersectionPoint.y);
end;
procedure TIntegrationTests.TestUnitVectorIntegration;
begin
    testVector := VectorTo(3.0, 4.0);
    testUnitVector := UnitVector(testVector);
    AssertEquals(0.6, testUnitVector.x);
    AssertEquals(0.8, testUnitVector.y);
end;
procedure TIntegrationTests.TestVectorAddIntegration;
begin
    testVector1 := VectorTo(1.0, 2.0);
    testVector2 := VectorTo(3.0, 4.0);
    resultVector := VectorAdd(testVector1, testVector2);
    AssertEquals(4.0, resultVector.x);
    AssertEquals(6.0, resultVector.y);
end;
procedure TIntegrationTests.TestVectorAngleIntegration;
begin
    testVector := VectorTo(1.0, 1.0);
    AssertEquals(45.0, VectorAngle(testVector));
end;
procedure TIntegrationTests.TestVectorFromAngleIntegration;
begin
    testVector := VectorFromAngle(45.0, 1.0);
    AssertEquals(0.7071, testVector.x);
    AssertEquals(0.7071, testVector.y);
end;
procedure TIntegrationTests.TestVectorFromLineIntegration;
begin
    testLine := LineFrom(PointAt(0.0, 0.0), PointAt(3.0, 4.0));
    testVector := VectorFromLine(testLine);
    AssertEquals(3.0, testVector.x);
    AssertEquals(4.0, testVector.y);
end;
procedure TIntegrationTests.TestVectorFromPointToRectIntegration;
begin
    testRect := RectangleFrom(0.0, 0.0, 100.0, 100.0);
    testPoint := PointAt(50.0, 50.0);
    testVector := VectorFromPointToRect(testPoint, testRect);
    AssertEquals(0.0, testVector.x);
    AssertEquals(0.0, testVector.y);
end;
procedure TIntegrationTests.TestVectorInRectIntegration;
begin
    testRect := RectangleFrom(0.0, 0.0, 100.0, 100.0);
    testVectorInside := VectorTo(50.0, 50.0);
    testVectorOutside := VectorTo(150.0, 150.0);
    AssertTrue(VectorInRect(testVectorInside, testRect));
    AssertFalse(VectorInRect(testVectorOutside, testRect));
end;
procedure TIntegrationTests.TestVectorInvertIntegration;
begin
    testVector := VectorTo(3.0, 4.0);
    invertedVector := VectorInvert(testVector);
    AssertEquals(-3.0, invertedVector.x);
    AssertEquals(-4.0, invertedVector.y);
end;
procedure TIntegrationTests.TestVectorLimitIntegration;
begin
    testVector := VectorTo(6.0, 8.0);
    limitedVector := VectorLimit(testVector, 5.0);
    AssertEquals(3.0, limitedVector.x);
    AssertEquals(4.0, limitedVector.y);
end;
procedure TIntegrationTests.TestVectorMagnitudeIntegration;
begin
    testVector := VectorTo(3.0, 4.0);
    AssertEquals(5.0, VectorMagnitude(testVector));
end;
procedure TIntegrationTests.TestVectorMagnitudeSquaredIntegration;
begin
    testVector := VectorTo(3.0, 4.0);
    AssertEquals(25.0, VectorMagnitudeSquared(testVector));
end;
procedure TIntegrationTests.TestVectorMultiplyIntegration;
begin
    testVector := VectorTo(3.0, 4.0);
    resultVector := VectorMultiply(testVector, 2.0);
    AssertEquals(6.0, resultVector.x);
    AssertEquals(8.0, resultVector.y);
end;
procedure TIntegrationTests.TestVectorNormalIntegration;
begin
    testVector := VectorTo(3.0, 4.0);
    normalVector := VectorNormal(testVector);
    AssertEquals(-4.0, normalVector.x);
    AssertEquals(3.0, normalVector.y);
end;
procedure TIntegrationTests.TestVectorOutOfCircleFromCircleIntegration;
begin
    testCircleSrc := CircleAt(0.0, 0.0, 10.0);
    testCircleBounds := CircleAt(15.0, 0.0, 10.0);
    testVelocity := VectorTo(1.0, 0.0);
    resultVector := VectorOutOfCircleFromCircle(testCircleSrc, testCircleBounds, testVelocity);
    AssertEquals(-5.0, resultVector.x);
    AssertEquals(0.0, resultVector.y);
end;
procedure TIntegrationTests.TestVectorOutOfCircleFromPointIntegration;
begin
    testPoint := PointAt(100.0, 100.0);
    testCircle := CircleAt(150.0, 150.0, 50.0);
    testVelocity := VectorTo(1.0, 1.0);
    resultVector := VectorOutOfCircleFromPoint(testPoint, testCircle, testVelocity);
    AssertEquals(-50.0, resultVector.x);
    AssertEquals(-50.0, resultVector.y);
end;
procedure TIntegrationTests.TestVectorOutOfRectFromCircleIntegration;
begin
    testCircle := CircleAt(75.0, 75.0, 25.0);
    testRect := RectangleFrom(0.0, 0.0, 100.0, 100.0);
    testVelocity := VectorTo(1.0, 0.0);
    resultVector := VectorOutOfRectFromCircle(testCircle, testRect, testVelocity);
    AssertEquals(-25.0, resultVector.x);
    AssertEquals(0.0, resultVector.y);
end;
procedure TIntegrationTests.TestVectorOutOfRectFromPointIntegration;
begin
    testPoint := PointAt(75.0, 75.0);
    testRect := RectangleFrom(0.0, 0.0, 100.0, 100.0);
    testVelocity := VectorTo(1.0, 0.0);
    resultVector := VectorOutOfRectFromPoint(testPoint, testRect, testVelocity);
    AssertEquals(-25.0, resultVector.x);
    AssertEquals(0.0, resultVector.y);
end;
procedure TIntegrationTests.TestVectorOutOfRectFromRectIntegration;
begin
    testSrcRect := RectangleFrom(75.0, 75.0, 50.0, 50.0);
    testBoundsRect := RectangleFrom(0.0, 0.0, 100.0, 100.0);
    testVelocity := VectorTo(1.0, 0.0);
    resultVector := VectorOutOfRectFromRect(testSrcRect, testBoundsRect, testVelocity);
    AssertEquals(-25.0, resultVector.x);
    AssertEquals(0.0, resultVector.y);
end;
procedure TIntegrationTests.TestVectorPointToPointIntegration;
begin
    testStartPoint := PointAt(0.0, 0.0);
    testEndPoint := PointAt(3.0, 4.0);
    resultVector := VectorPointToPoint(testStartPoint, testEndPoint);
    AssertEquals(3.0, resultVector.x);
    AssertEquals(4.0, resultVector.y);
end;
procedure TIntegrationTests.TestVectorSubtractIntegration;
begin
    testVector1 := VectorTo(3.0, 4.0);
    testVector2 := VectorTo(1.0, 1.0);
    resultVector := VectorSubtract(testVector1, testVector2);
    AssertEquals(2.0, resultVector.x);
    AssertEquals(3.0, resultVector.y);
end;
procedure TIntegrationTests.TestVectorToPointIntegration;
begin
    testPoint := PointAt(3.0, 4.0);
    resultVector := VectorTo(testPoint);
    AssertEquals(3.0, resultVector.x);
    AssertEquals(4.0, resultVector.y);
end;
procedure TIntegrationTests.TestVectorToIntegration;
begin
    testVector := VectorTo(3.0, 4.0);
    AssertEquals(3.0, testVector.x);
    AssertEquals(4.0, testVector.y);
end;
procedure TIntegrationTests.TestVectorToStringIntegration;
begin
    testVector := VectorTo(3.0, 4.0);
    AssertEquals("Vec -> 3:4", VectorToString(testVector));
end;
procedure TIntegrationTests.TestVectorsEqualIntegration;
begin
    testVector1 := VectorTo(3.0, 4.0);
    testVector2 := VectorTo(3.0, 4.0);
    testVector3 := VectorTo(3.0, 5.0);
    AssertTrue(VectorsEqual(testVector1, testVector2));
    AssertFalse(VectorsEqual(testVector1, testVector3));
end;
procedure TIntegrationTests.TestVectorsNotEqualIntegration;
begin
    testVector1 := VectorTo(3.0, 4.0);
    testVector2 := VectorTo(3.0, 4.0);
    testVector3 := VectorTo(3.0, 5.0);
    AssertFalse(VectorsNotEqual(testVector1, testVector2));
    AssertTrue(VectorsNotEqual(testVector1, testVector3));
end;
end;

procedure RegisterTests;
begin
TestFramework.RegisterTest(TIntegrationTests.Suite);
end;
