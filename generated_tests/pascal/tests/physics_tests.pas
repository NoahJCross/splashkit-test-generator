uses SplashKit, TestFramework, ../Helpers;
type
    TTestPhysics = class(TTestCase)
    protected
        procedure Setup; override;
    end;
    procedure TestBitmapCircleCollisionAtPointIntegration;
begin
    testBitmap := CreateBitmap('test_bitmap', 100, 100);
    CleanupBitmap := TBitmapCleanup.Create;
    ClearBitmap(testBitmap, ColorBlack());
    SetupCollisionMask(testBitmap);
    testCircle := CircleAt(150.0, 150.0, 50.0);
    testPoint := PointAt(100.0, 100.0);
    AssertTrue(BitmapCircleCollision(testBitmap, testPoint, testCircle));
end;
procedure TestBitmapCircleCollisionIntegration;
begin
    testBitmap := CreateBitmap('test_bitmap', 100, 100);
    CleanupBitmap := TBitmapCleanup.Create;
    ClearBitmap(testBitmap, ColorBlack());
    SetupCollisionMask(testBitmap);
    testCircle := CircleAt(150.0, 150.0, 50.0);
    AssertTrue(BitmapCircleCollision(testBitmap, 100.0, 100.0, testCircle));
end;
procedure TestBitmapCircleCollisionForCellWithTranslationIntegration;
begin
    testBitmap := CreateBitmap('test_bitmap', 100, 100);
    CleanupBitmap := TBitmapCleanup.Create;
    ClearBitmap(testBitmap, ColorBlack());
    SetupCollisionMask(testBitmap);
    testCircle := CircleAt(150.0, 150.0, 50.0);
    testTranslation := TranslationMatrix(100.0, 100.0);
    AssertTrue(BitmapCircleCollision(testBitmap, 0, testTranslation, testCircle));
end;
procedure TestBitmapCircleCollisionForCellAtPointIntegration;
begin
    testBitmap := CreateBitmap('test_bitmap', 100, 100);
    CleanupBitmap := TBitmapCleanup.Create;
    ClearBitmap(testBitmap, ColorBlack());
    SetupCollisionMask(testBitmap);
    testCircle := CircleAt(150.0, 150.0, 50.0);
    testPoint := PointAt(100.0, 100.0);
    AssertTrue(BitmapCircleCollision(testBitmap, 0, testPoint, testCircle));
end;
procedure TestBitmapCircleCollisionForCellIntegration;
begin
    testBitmap := CreateBitmap('test_bitmap', 100, 100);
    CleanupBitmap := TBitmapCleanup.Create;
    ClearBitmap(testBitmap, ColorBlack());
    SetupCollisionMask(testBitmap);
    testCircle := CircleAt(150.0, 150.0, 50.0);
    AssertTrue(BitmapCircleCollision(testBitmap, 0, 100.0, 100.0, testCircle));
end;
procedure TestBitmapCollisionIntegration;
begin
    testBitmap1 := CreateBitmap('test_bitmap1', 100, 100);
    CleanupBitmap := TBitmapCleanup.Create;
    testBitmap2 := CreateBitmap('test_bitmap2', 100, 100);
    ClearBitmap(testBitmap1, ColorBlack());
    SetupCollisionMask(testBitmap1);
    ClearBitmap(testBitmap2, ColorBlack());
    SetupCollisionMask(testBitmap2);
    AssertTrue(BitmapCollision(testBitmap1, 0, 0.0, 0.0, testBitmap2, 0, 50.0, 50.0));
    AssertFalse(BitmapCollision(testBitmap1, 0, 0.0, 0.0, testBitmap2, 0, 200.0, 200.0));
end;
procedure TestBitmapCollisionAtPointsIntegration;
begin
    testBitmap1 := CreateBitmap('test_bitmap1', 100, 100);
    CleanupBitmap := TBitmapCleanup.Create;
    testBitmap2 := CreateBitmap('test_bitmap2', 100, 100);
    ClearBitmap(testBitmap1, ColorBlack());
    SetupCollisionMask(testBitmap1);
    ClearBitmap(testBitmap2, ColorBlack());
    SetupCollisionMask(testBitmap2);
    testPoint1 := PointAt(0.0, 0.0);
    testPoint2 := PointAt(50.0, 50.0);
    AssertTrue(BitmapCollision(testBitmap1, testPoint1, testBitmap2, testPoint2));
end;
procedure TestBitmapCollisionForCellsWithTranslationsIntegration;
begin
    testBitmap1 := CreateBitmap('test_bitmap1', 100, 100);
    CleanupBitmap := TBitmapCleanup.Create;
    testBitmap2 := CreateBitmap('test_bitmap2', 100, 100);
    ClearBitmap(testBitmap1, ColorBlack());
    SetupCollisionMask(testBitmap1);
    ClearBitmap(testBitmap2, ColorBlack());
    SetupCollisionMask(testBitmap2);
    matrix1 := TranslationMatrix(0.0, 0.0);
    matrix2 := TranslationMatrix(50.0, 50.0);
    AssertTrue(BitmapCollision(testBitmap1, 0, matrix1, testBitmap2, 0, matrix2));
end;
procedure TestBitmapCollisionForCellsAtPointsIntegration;
begin
    testBitmap1 := CreateBitmap('test_bitmap1', 50, 50);
    CleanupBitmap := TBitmapCleanup.Create;
    testBitmap2 := CreateBitmap('test_bitmap2', 50, 50);
    ClearBitmap(testBitmap1, ColorBlack());
    SetupCollisionMask(testBitmap1);
    ClearBitmap(testBitmap2, ColorBlack());
    SetupCollisionMask(testBitmap2);
    testPoint1 := PointAt(100.0, 100.0);
    testPoint2 := PointAt(125.0, 125.0);
    AssertTrue(BitmapCollision(testBitmap1, 0, testPoint1, testBitmap2, 0, testPoint2));
end;
procedure TestBitmapCollisionForCellsIntegration;
begin
    testBitmap1 := CreateBitmap('test_bitmap1', 100, 100);
    CleanupBitmap := TBitmapCleanup.Create;
    testBitmap2 := CreateBitmap('test_bitmap2', 100, 100);
    ClearBitmap(testBitmap1, ColorBlack());
    ClearBitmap(testBitmap2, ColorBlack());
    SetupCollisionMask(testBitmap1);
    SetupCollisionMask(testBitmap2);
    AssertFalse(BitmapCollision(testBitmap1, 0, 100.0, 100.0, testBitmap2, 0, 200.0, 100.0));
    AssertTrue(BitmapCollision(testBitmap1, 0, 100.0, 100.0, testBitmap2, 0, 150.0, 100.0));
end;
procedure TestBitmapPointCollisionWithTranslationIntegration;
begin
    testBitmap := CreateBitmap('test_bitmap', 100, 100);
    CleanupBitmap := TBitmapCleanup.Create;
    ClearBitmap(testBitmap, ColorBlack());
    SetupCollisionMask(testBitmap);
    testTranslation := TranslationMatrix(100.0, 100.0);
    testPoint1 := PointAt(151.0, 150.0);
    testPoint2 := PointAt(201.0, 200.0);
    AssertTrue(BitmapPointCollision(testBitmap, testTranslation, testPoint1));
    AssertFalse(BitmapPointCollision(testBitmap, testTranslation, testPoint2));
end;
procedure TestBitmapPointCollisionAtPointIntegration;
begin
    testBitmap := CreateBitmap('test_bitmap', 100, 100);
    CleanupBitmap := TBitmapCleanup.Create;
    ClearBitmap(testBitmap, ColorBlack());
    SetupCollisionMask(testBitmap);
    testBmpPoint := PointAt(50.0, 50.0);
    testPoint := PointAt(101.0, 100.0);
    AssertTrue(BitmapPointCollision(testBitmap, testBmpPoint, testPoint));
    AssertFalse(BitmapPointCollision(testBitmap, testBmpPoint, PointAt(201.0, 200.0)));
end;
procedure TestBitmapPointCollisionIntegration;
begin
    testBitmap := CreateBitmap('test_bitmap', 100, 100);
    CleanupBitmap := TBitmapCleanup.Create;
    ClearBitmap(testBitmap, ColorBlack());
    SetupCollisionMask(testBitmap);
    AssertTrue(BitmapPointCollision(testBitmap, 0.0, 0.0, 51.0, 50.0));
    AssertFalse(BitmapPointCollision(testBitmap, 0.0, 0.0, 151.0, 150.0));
end;
procedure TestBitmapPointCollisionForCellWithTranslationIntegration;
begin
    testBitmap := CreateBitmap('test_bitmap', 100, 100);
    CleanupBitmap := TBitmapCleanup.Create;
    ClearBitmap(testBitmap, ColorBlack());
    SetupCollisionMask(testBitmap);
    testTranslation := TranslationMatrix(100.0, 100.0);
    testPoint1 := PointAt(151.0, 150.0);
    testPoint2 := PointAt(201.0, 200.0);
    AssertTrue(BitmapPointCollision(testBitmap, 0, testTranslation, testPoint1));
    AssertFalse(BitmapPointCollision(testBitmap, 0, testTranslation, testPoint2));
end;
procedure TestBitmapPointCollisionForCellAtPointIntegration;
begin
    testBitmap := CreateBitmap('test_bitmap', 100, 100);
    CleanupBitmap := TBitmapCleanup.Create;
    ClearBitmap(testBitmap, ColorBlack());
    SetupCollisionMask(testBitmap);
    AssertTrue(BitmapPointCollision(testBitmap, 0, PointAt(50.0, 50.0), PointAt(101.0, 100.0)));
    AssertFalse(BitmapPointCollision(testBitmap, 0, PointAt(51.0, 50.0), PointAt(201.0, 200.0)));
end;
procedure TestBitmapPointCollisionForCellIntegration;
begin
    testBitmap := CreateBitmap('test_bitmap', 100, 100);
    CleanupBitmap := TBitmapCleanup.Create;
    ClearBitmap(testBitmap, ColorBlack());
    DrawPixel(ColorWhite(), 51.0, 50.0, OptionDrawTo(testBitmap));
    SetupCollisionMask(testBitmap);
    AssertTrue(BitmapPointCollision(testBitmap, 0, 0.0, 0.0, 51.0, 50.0));
    AssertFalse(BitmapPointCollision(testBitmap, 0, 0.0, 0.0, 50.0, 50.0));
end;
procedure TestBitmapRectangleCollisionAtPointIntegration;
begin
    testBitmap := CreateBitmap('test_bitmap', 100, 100);
    CleanupBitmap := TBitmapCleanup.Create;
    ClearBitmap(testBitmap, ColorBlack());
    SetupCollisionMask(testBitmap);
    testRectangle := RectangleFrom(50.0, 50.0, 100.0, 100.0);
    testPoint := PointAt(100.0, 100.0);
    AssertTrue(BitmapRectangleCollision(testBitmap, testPoint, testRectangle));
end;
procedure TestBitmapRectangleCollisionIntegration;
begin
    testBitmap := CreateBitmap('test_bitmap', 100, 100);
    CleanupBitmap := TBitmapCleanup.Create;
    ClearBitmap(testBitmap, ColorBlack());
    SetupCollisionMask(testBitmap);
    testRectangle := RectangleFrom(50.0, 50.0, 100.0, 100.0);
    AssertTrue(BitmapRectangleCollision(testBitmap, 0.0, 0.0, testRectangle));
end;
procedure TestBitmapRectangleCollisionForCellWithTranslationIntegration;
begin
    testBitmap := CreateBitmap('test_bitmap', 100, 100);
    CleanupBitmap := TBitmapCleanup.Create;
    ClearBitmap(testBitmap, ColorBlack());
    SetupCollisionMask(testBitmap);
    testRectangle := RectangleFrom(150.0, 150.0, 50.0, 50.0);
    testTranslation := TranslationMatrix(100.0, 100.0);
    AssertTrue(BitmapRectangleCollision(testBitmap, 0, testTranslation, testRectangle));
end;
procedure TestBitmapRectangleCollisionForCellAtPointIntegration;
begin
    testBitmap := CreateBitmap('test_bitmap', 100, 100);
    CleanupBitmap := TBitmapCleanup.Create;
    ClearBitmap(testBitmap, ColorBlack());
    SetupCollisionMask(testBitmap);
    testRectangle := RectangleFrom(100.0, 100.0, 50.0, 50.0);
    testPoint := PointAt(100.0, 100.0);
    AssertTrue(BitmapRectangleCollision(testBitmap, 0, testPoint, testRectangle));
end;
procedure TestBitmapRectangleCollisionForCellIntegration;
begin
    testBitmap := CreateBitmap('test_bitmap', 100, 100);
    CleanupBitmap := TBitmapCleanup.Create;
    ClearBitmap(testBitmap, ColorBlack());
    SetupCollisionMask(testBitmap);
    testRectangle := RectangleFrom(50.0, 50.0, 100.0, 100.0);
    AssertTrue(BitmapRectangleCollision(testBitmap, 0, 50.0, 50.0, testRectangle));
end;
procedure TestSpriteBitmapCollisionIntegration;
begin
    testBitmap := CreateBitmap('test_bitmap', 100, 100);
    CleanupBitmap := TBitmapCleanup.Create;
    ClearBitmap(testBitmap, ColorBlack());
    SetupCollisionMask(testBitmap);
    testSprite := CreateSprite(testBitmap);
    CleanupSprite := TSpriteCleanup.Create;
    SpriteSetCollisionKind(testSprite, CollisionTestKind.PIXEL_COLLISIONS);
    SpriteSetPosition(testSprite, PointAt(100.0, 100.0));
    AssertTrue(SpriteBitmapCollision(testSprite, testBitmap, 100.0, 100.0));
    AssertFalse(SpriteBitmapCollision(testSprite, testBitmap, 200.0, 200.0));
end;
procedure TestSpriteBitmapCollisionWithCellAtPointIntegration;
begin
    testBitmap := CreateBitmap('test_bitmap', 100, 100);
    CleanupBitmap := TBitmapCleanup.Create;
    ClearBitmap(testBitmap, ColorBlack());
    SetupCollisionMask(testBitmap);
    testSprite := CreateSprite(testBitmap);
    CleanupSprite := TSpriteCleanup.Create;
    SpriteSetCollisionKind(testSprite, CollisionTestKind.PIXEL_COLLISIONS);
    SpriteSetPosition(testSprite, PointAt(50.0, 50.0));
    AssertTrue(SpriteBitmapCollision(testSprite, testBitmap, 0, PointAt(50.0, 50.0)));
end;
procedure TestSpriteBitmapCollisionWithCellIntegration;
begin
    testBitmap := CreateBitmap('test_bitmap', 100, 100);
    CleanupBitmap := TBitmapCleanup.Create;
    ClearBitmap(testBitmap, ColorBlack());
    SetupCollisionMask(testBitmap);
    testSprite := CreateSprite(testBitmap);
    CleanupSprite := TSpriteCleanup.Create;
    SpriteSetCollisionKind(testSprite, CollisionTestKind.PIXEL_COLLISIONS);
    SpriteSetPosition(testSprite, PointAt(50.0, 50.0));
    AssertTrue(SpriteBitmapCollision(testSprite, testBitmap, 0, 50.0, 50.0));
end;
procedure TestSpriteCollisionIntegration;
begin
    testBitmap1 := CreateBitmap('test_bitmap_1', 50, 50);
    CleanupBitmap := TBitmapCleanup.Create;
    testBitmap2 := CreateBitmap('test_bitmap_2', 50, 50);
    ClearBitmap(testBitmap1, ColorBlack());
    SetupCollisionMask(testBitmap1);
    ClearBitmap(testBitmap2, ColorBlack());
    SetupCollisionMask(testBitmap2);
    testSprite1 := CreateSprite(testBitmap1);
    CleanupSprite := TSpriteCleanup.Create;
    testSprite2 := CreateSprite(testBitmap2);
    SpriteSetCollisionKind(testSprite1, CollisionTestKind.PIXEL_COLLISIONS);
    SpriteSetCollisionKind(testSprite2, CollisionTestKind.PIXEL_COLLISIONS);
    SpriteSetPosition(testSprite1, PointAt(100.0, 100.0));
    SpriteSetPosition(testSprite2, PointAt(100.0, 100.0));
    AssertTrue(SpriteCollision(testSprite1, testSprite2));
    SpriteSetPosition(testSprite2, PointAt(200.0, 200.0));
    AssertFalse(SpriteCollision(testSprite1, testSprite2));
end;
procedure TestSpritePointCollisionIntegration;
begin
    testBitmap := CreateBitmap('test_bitmap', 100, 100);
    CleanupBitmap := TBitmapCleanup.Create;
    ClearBitmap(testBitmap, ColorBlack());
    SetupCollisionMask(testBitmap);
    testSprite := CreateSprite(testBitmap);
    CleanupSprite := TSpriteCleanup.Create;
    SpriteSetCollisionKind(testSprite, CollisionTestKind.PIXEL_COLLISIONS);
    AssertTrue(SpritePointCollision(testSprite, PointAt(76.0, 75.0)));
    AssertFalse(SpritePointCollision(testSprite, PointAt(200.0, 200.0)));
end;
procedure TestSpriteRectangleCollisionIntegration;
begin
    testBitmap := CreateBitmap('test_bitmap', 100, 100);
    CleanupBitmap := TBitmapCleanup.Create;
    ClearBitmap(testBitmap, ColorBlack());
    SetupCollisionMask(testBitmap);
    testSprite := CreateSprite(testBitmap);
    CleanupSprite := TSpriteCleanup.Create;
    SpriteSetCollisionKind(testSprite, CollisionTestKind.PIXEL_COLLISIONS);
    testRectangle := RectangleFrom(0.0, 0.0, 100.0, 100.0);
    AssertTrue(SpriteRectangleCollision(testSprite, testRectangle));
end;
procedure TestApplyMatrixToQuadIntegration;
begin
    testMatrix := IdentityMatrix();
    testQuad := QuadFrom(PointAt(100.0, 100.0), PointAt(200.0, 100.0), PointAt(200.0, 200.0), PointAt(100.0, 200.0));
    ApplyMatrix(testMatrix, @testQuad);
    AssertEquals(100.0, testQuad.points[0].x);
    AssertEquals(100.0, testQuad.points[0].y);
end;
procedure TestApplyMatrixToTriangleIntegration;
begin
    testTriangle := TriangleFrom(PointAt(0.0, 0.0), PointAt(1.0, 0.0), PointAt(0.0, 1.0));
    testMatrix := TranslationMatrix(1.0, 1.0);
    ApplyMatrix(testMatrix, @testTriangle);
    AssertEquals(1.0, testTriangle.points[0].x);
    AssertEquals(1.0, testTriangle.points[0].y);
end;
procedure TestIdentityMatrixIntegration;
begin
    testMatrix := IdentityMatrix();
    AssertEquals(1.0, testMatrix.elements[0, 0]);
    AssertEquals(1.0, testMatrix.elements[1, 1]);
    AssertEquals(0.0, testMatrix.elements[0, 1]);
    AssertEquals(0.0, testMatrix.elements[1, 0]);
end;
procedure TestMatrixInverseIntegration;
begin
    testMatrix := ScaleRotateTranslateMatrix(PointAt(2.0, 2.0), 45.0, PointAt(10.0, 10.0));
    inverseMatrix := MatrixInverse(testMatrix);
    resultMatrix := MatrixMultiply(testMatrix, inverseMatrix);
    AssertTrue(Abs(1.0 - resultMatrix.elements[0, 0]) <= 2);
    AssertTrue(Abs(1.0 - resultMatrix.elements[1, 1]) <= 2);
end;
procedure TestMatrixMultiplyPointIntegration;
begin
    testMatrix := TranslationMatrix(10.0, 10.0);
    testPoint := PointAt(10.0, 20.0);
    resultPoint := MatrixMultiply(testMatrix, testPoint);
    AssertEquals(20.0, resultPoint.x);
    AssertEquals(30.0, resultPoint.y);
end;
procedure TestMatrixMultiplyMatrixIntegration;
begin
    testMatrix1 := ScaleMatrix(2.0);
    testMatrix2 := TranslationMatrix(10.0, 10.0);
    resultMatrix := MatrixMultiply(testMatrix2, testMatrix1);
    AssertEquals(2.0, resultMatrix.elements[0, 0]);
    AssertEquals(20.0, resultMatrix.elements[0, 2]);
end;
procedure TestMatrixMultiplyVectorIntegration;
begin
    testVector := VectorTo(2.0, 2.0);
    testMatrix := ScaleMatrix(2.0);
    resultVector := MatrixMultiply(testMatrix, testVector);
    AssertEquals(4.0, resultVector.x);
    AssertEquals(4.0, resultVector.y);
end;
procedure TestMatrixToStringIntegration;
begin
    testMatrix := IdentityMatrix();
    AssertEquals(' ------------------------------\n|        1         0         0 |\n|        0         1         0 |\n|        0         0         1 |\n ------------------------------', MatrixToString(testMatrix));
end;
procedure TestRotationMatrixIntegration;
begin
    testMatrix := RotationMatrix(90.0);
    testPoint := PointAt(1.0, 0.0);
    resultPoint := MatrixMultiply(testMatrix, testPoint);
    AssertTrue(Abs(0.0 - resultPoint.x) <= 2.0);
    AssertTrue(Abs(1.0 - resultPoint.y) <= 2.0);
end;
procedure TestScaleMatrixFromPointIntegration;
begin
    testScale := PointAt(2.0, 3.0);
    testMatrix := ScaleMatrix(testScale);
    testPoint := PointAt(1.0, 1.0);
    resultPoint := MatrixMultiply(testMatrix, testPoint);
    AssertEquals(2.0, resultPoint.x);
    AssertEquals(3.0, resultPoint.y);
end;
procedure TestScaleMatrixFromVectorIntegration;
begin
    testScale := VectorTo(2.0, 3.0);
    testMatrix := ScaleMatrix(testScale);
    testPoint := PointAt(1.0, 1.0);
    resultPoint := MatrixMultiply(testMatrix, testPoint);
    AssertEquals(2.0, resultPoint.x);
    AssertEquals(3.0, resultPoint.y);
end;
procedure TestScaleMatrixIntegration;
begin
    testPoint := PointAt(1.0, 1.5);
    testMatrix := ScaleMatrix(2.0);
    resultPoint := MatrixMultiply(testMatrix, testPoint);
    AssertEquals(2.0, resultPoint.x);
    AssertEquals(3.0, resultPoint.y);
end;
procedure TestScaleRotateTranslateMatrixIntegration;
begin
    testScale := PointAt(2.0, 2.0);
    testTranslate := PointAt(10.0, 10.0);
    testMatrix := ScaleRotateTranslateMatrix(testScale, 90.0, testTranslate);
    testPoint := PointAt(1.0, 0.0);
    resultPoint := MatrixMultiply(testMatrix, testPoint);
    AssertEquals(10.0, resultPoint.x);
    AssertEquals(11.0, resultPoint.y);
end;
procedure TestTranslationMatrixToPointIntegration;
begin
    testPoint := PointAt(10.0, 20.0);
    testMatrix := TranslationMatrix(testPoint);
    testVector := VectorTo(5.0, 5.0);
    resultPoint := MatrixMultiply(testMatrix, testVector);
    AssertEquals(15.0, resultPoint.x);
    AssertEquals(25.0, resultPoint.y);
end;
procedure TestTranslationMatrixFromVectorIntegration;
begin
    testVector := VectorTo(10.0, 20.0);
    testMatrix := TranslationMatrix(testVector);
    testPoint := PointAt(0.0, 0.0);
    resultPoint := MatrixMultiply(testMatrix, testPoint);
    AssertEquals(10.0, resultPoint.x);
    AssertEquals(20.0, resultPoint.y);
end;
procedure TestTranslationMatrixIntegration;
begin
    testMatrix := TranslationMatrix(10.0, 20.0);
    testPoint := PointAt(0.0, 0.0);
    resultPoint := MatrixMultiply(testMatrix, testPoint);
    AssertEquals(10.0, resultPoint.x);
    AssertEquals(20.0, resultPoint.y);
end;
procedure TestAngleBetweenIntegration;
begin
    testVector1 := VectorTo(1.0, 0.0);
    testVector2 := VectorTo(0.0, 1.0);
    AssertEquals(90.0, AngleBetween(testVector1, testVector2));
end;
procedure TestDotProductIntegration;
begin
    testVector1 := VectorTo(3.0, 4.0);
    testVector2 := VectorTo(1.0, 2.0);
    AssertEquals(11.0, DotProduct(testVector1, testVector2));
end;
procedure TestIsZeroVectorIntegration;
begin
    testZeroVector := VectorTo(0.0, 0.0);
    testNonZeroVector := VectorTo(1.0, 1.0);
    AssertTrue(IsZeroVector(testZeroVector));
    AssertFalse(IsZeroVector(testNonZeroVector));
end;
procedure TestRayIntersectionPointIntegration;
begin
    testFromPt := PointAt(0.0, 0.0);
    testHeading := VectorTo(1.0, 1.0);
    testLine := LineFrom(PointAt(0.0, 2.0), PointAt(2.0, 0.0));
    intersectionPoint := PointAt(0.0, 0.0);
    AssertTrue(RayIntersectionPoint(testFromPt, testHeading, testLine, @intersectionPoint));
    AssertEquals(1.0, intersectionPoint.x);
    AssertEquals(1.0, intersectionPoint.y);
end;
procedure TestUnitVectorIntegration;
begin
    testVector := VectorTo(3.0, 4.0);
    testUnitVector := UnitVector(testVector);
    AssertTrue(Abs(0.6 - testUnitVector.x) <= 2.0);
    AssertEquals(0.8, testUnitVector.y);
end;
procedure TestVectorAddIntegration;
begin
    testVector1 := VectorTo(1.0, 2.0);
    testVector2 := VectorTo(3.0, 4.0);
    resultVector := VectorAdd(testVector1, testVector2);
    AssertEquals(4.0, resultVector.x);
    AssertEquals(6.0, resultVector.y);
end;
procedure TestVectorAngleIntegration;
begin
    testVector := VectorTo(1.0, 1.0);
    AssertEquals(45.0, VectorAngle(testVector));
end;
procedure TestVectorFromAngleIntegration;
begin
    testVector := VectorFromAngle(0.0, 1.0);
    AssertEquals(1.0, testVector.x);
    AssertEquals(0.0, testVector.y);
end;
procedure TestVectorFromLineIntegration;
begin
    testLine := LineFrom(PointAt(0.0, 0.0), PointAt(3.0, 4.0));
    testVector := VectorFromLine(testLine);
    AssertEquals(3.0, testVector.x);
    AssertEquals(4.0, testVector.y);
end;
procedure TestVectorFromPointToRectIntegration;
begin
    testRect := RectangleFrom(0.0, 0.0, 100.0, 100.0);
    testPoint := PointAt(50.0, 50.0);
    testVector := VectorFromPointToRect(testPoint, testRect);
    AssertEquals(0.0, testVector.x);
    AssertEquals(0.0, testVector.y);
end;
procedure TestVectorInRectIntegration;
begin
    testRect := RectangleFrom(0.0, 0.0, 100.0, 100.0);
    testVectorInside := VectorTo(50.0, 50.0);
    testVectorOutside := VectorTo(150.0, 150.0);
    AssertTrue(VectorInRect(testVectorInside, testRect));
    AssertFalse(VectorInRect(testVectorOutside, testRect));
end;
procedure TestVectorInvertIntegration;
begin
    testVector := VectorTo(3.0, 4.0);
    invertedVector := VectorInvert(testVector);
    AssertEquals(-3.0, invertedVector.x);
    AssertEquals(-4.0, invertedVector.y);
end;
procedure TestVectorLimitIntegration;
begin
    testVector := VectorTo(6.0, 8.0);
    limitedVector := VectorLimit(testVector, 5.0);
    AssertTrue(Abs(3.0 - limitedVector.x) <= 2);
    AssertEquals(4.0, limitedVector.y);
end;
procedure TestVectorMagnitudeIntegration;
begin
    testVector := VectorTo(3.0, 4.0);
    AssertEquals(5.0, VectorMagnitude(testVector));
end;
procedure TestVectorMagnitudeSquaredIntegration;
begin
    testVector := VectorTo(3.0, 4.0);
    AssertEquals(25.0, VectorMagnitudeSquared(testVector));
end;
procedure TestVectorMultiplyIntegration;
begin
    testVector := VectorTo(3.0, 4.0);
    resultVector := VectorMultiply(testVector, 2.0);
    AssertEquals(6.0, resultVector.x);
    AssertEquals(8.0, resultVector.y);
end;
procedure TestVectorNormalIntegration;
begin
    testVector := VectorTo(3.0, 4.0);
    normalVector := VectorNormal(testVector);
    AssertTrue(Abs(-0.8 - normalVector.x) <= 2.0);
    AssertTrue(Abs(0.6 - normalVector.y) <= 2.0);
end;
procedure TestVectorOutOfCircleFromCircleIntegration;
begin
    testCircleSrc := CircleAt(0.0, 0.0, 5.0);
    testCircleBounds := CircleAt(8.0, 0.0, 5.0);
    testVelocity := VectorTo(1.0, 0.0);
    resultVector := VectorOutOfCircleFromCircle(testCircleSrc, testCircleBounds, testVelocity);
    AssertTrue(Abs(-3.42 - resultVector.x) <= 2.0);
    AssertEquals(0.0, resultVector.y);
end;
procedure TestVectorOutOfCircleFromPointIntegration;
begin
    testPoint := PointAt(100.0, 100.0);
    testCircle := CircleAt(100.0, 100.0, 10.0);
    testVelocity := VectorTo(1.0, 0.0);
    resultVector := VectorOutOfCircleFromPoint(testPoint, testCircle, testVelocity);
    AssertTrue(Abs(-11.42 - resultVector.x) <= 2.0);
    AssertEquals(0.0, resultVector.y);
end;
procedure TestVectorOutOfRectFromCircleIntegration;
begin
    testCircle := CircleAt(75.0, 75.0, 25.0);
    testRect := RectangleFrom(0.0, 0.0, 100.0, 100.0);
    testVelocity := VectorTo(1.0, 0.0);
    resultVector := VectorOutOfRectFromCircle(testCircle, testRect, testVelocity);
    AssertEquals(-101.42, resultVector.x);
    AssertEquals(0.0, resultVector.y);
end;
procedure TestVectorOutOfRectFromPointIntegration;
begin
    testPoint := PointAt(75.0, 75.0);
    testRect := RectangleFrom(0.0, 0.0, 100.0, 100.0);
    testVelocity := VectorTo(1.0, 0.0);
    resultVector := VectorOutOfRectFromPoint(testPoint, testRect, testVelocity);
    AssertTrue(Abs(-76.4 - resultVector.x) <= 2.0);
    AssertEquals(0.0, resultVector.y);
end;
procedure TestVectorOutOfRectFromRectIntegration;
begin
    testSrcRect := RectangleFrom(75.0, 75.0, 50.0, 50.0);
    testBoundsRect := RectangleFrom(0.0, 0.0, 100.0, 100.0);
    testVelocity := VectorTo(1.0, 0.0);
    resultVector := VectorOutOfRectFromRect(testSrcRect, testBoundsRect, testVelocity);
    AssertEquals(-126.0, resultVector.x);
    AssertEquals(0.0, resultVector.y);
end;
procedure TestVectorPointToPointIntegration;
begin
    testStartPoint := PointAt(0.0, 0.0);
    testEndPoint := PointAt(3.0, 4.0);
    resultVector := VectorPointToPoint(testStartPoint, testEndPoint);
    AssertEquals(3.0, resultVector.x);
    AssertEquals(4.0, resultVector.y);
end;
procedure TestVectorSubtractIntegration;
begin
    testVector1 := VectorTo(3.0, 4.0);
    testVector2 := VectorTo(1.0, 1.0);
    resultVector := VectorSubtract(testVector1, testVector2);
    AssertEquals(2.0, resultVector.x);
    AssertEquals(3.0, resultVector.y);
end;
procedure TestVectorToPointIntegration;
begin
    testPoint := PointAt(3.0, 4.0);
    resultVector := VectorTo(testPoint);
    AssertEquals(3.0, resultVector.x);
    AssertEquals(4.0, resultVector.y);
end;
procedure TestVectorToIntegration;
begin
    testVector := VectorTo(3.0, 4.0);
    AssertEquals(3.0, testVector.x);
    AssertEquals(4.0, testVector.y);
end;
procedure TestVectorToStringIntegration;
begin
    testVector := VectorTo(3.0, 4.0);
    AssertEquals('Vec -> 3.000000:4.000000', VectorToString(testVector));
end;
procedure TestVectorsEqualIntegration;
begin
    testVector1 := VectorTo(3.0, 4.0);
    testVector2 := VectorTo(3.0, 4.0);
    testVector3 := VectorTo(3.0, 5.0);
    AssertTrue(VectorsEqual(testVector1, testVector2));
    AssertFalse(VectorsEqual(testVector1, testVector3));
end;
procedure TestVectorsNotEqualIntegration;
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
    #<Proc:0x00007fbbcab52da8 /mnt/c/Users/Noahc/Documents/aYear_2_semester_2/TeamProject/GitHubRepo/splashkit_test_generator/test_generator/config/languages/pascal_config.rb:138 (lambda)>
end;
