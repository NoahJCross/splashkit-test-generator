uses SplashKit, TestFramework

type
TTestPhysics = class(TTestCase)
protected
procedure TIntegrationTests.TestBitmapCircleCollisionAtPointIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    testBitmap := CreateBitmap("test_bitmap", 100, 100);
    ClearBitmap(testBitmap, ColorBlack());
    SetupCollisionMask(testBitmap);
    testCircle := CircleAt(150.0, 150.0, 50.0);
    testPoint := PointAt(100.0, 100.0);
    AssertTrue(BitmapCircleCollisionAtPoint(testBitmap, testPoint, testCircle));
    FreeBitmap(testBitmap);
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestBitmapCircleCollisionIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    testBitmap := CreateBitmap("test_bitmap", 100, 100);
    ClearBitmap(testBitmap, ColorBlack());
    SetupCollisionMask(testBitmap);
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
    SetupCollisionMask(testBitmap);
    testCircle := CircleAt(150.0, 150.0, 50.0);
    testTranslation := TranslationMatrix(100.0, 100.0);
    AssertTrue(BitmapCircleCollisionForCellWithTranslation(testBitmap, 0, testTranslation, testCircle));
    FreeBitmap(testBitmap);
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestBitmapCircleCollisionForCellAtPointIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    testBitmap := CreateBitmap("test_bitmap", 100, 100);
    ClearBitmap(testBitmap, ColorBlack());
    SetupCollisionMask(testBitmap);
    testCircle := CircleAt(150.0, 150.0, 50.0);
    testPoint := PointAt(100.0, 100.0);
    AssertTrue(BitmapCircleCollisionForCellAtPoint(testBitmap, 0, testPoint, testCircle));
    FreeBitmap(testBitmap);
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestBitmapCircleCollisionForCellIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    testBitmap := CreateBitmap("test_bitmap", 100, 100);
    ClearBitmap(testBitmap, ColorBlack());
    SetupCollisionMask(testBitmap);
    testCircle := CircleAt(150.0, 150.0, 50.0);
    AssertTrue(BitmapCircleCollisionForCell(testBitmap, 0, 100.0, 100.0, testCircle));
    FreeBitmap(testBitmap);
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestBitmapCollisionIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    testBitmap1 := CreateBitmap("test_bitmap1", 100, 100);
    testBitmap2 := CreateBitmap("test_bitmap2", 100, 100);
    ClearBitmap(testBitmap1, ColorBlack());
    SetupCollisionMask(testBitmap1);
    ClearBitmap(testBitmap2, ColorBlack());
    SetupCollisionMask(testBitmap2);
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
    SetupCollisionMask(testBitmap1);
    ClearBitmap(testBitmap2, ColorBlack());
    SetupCollisionMask(testBitmap2);
    testPoint1 := PointAt(0.0, 0.0);
    testPoint2 := PointAt(50.0, 50.0);
    AssertTrue(BitmapCollisionAtPoints(testBitmap1, testPoint1, testBitmap2, testPoint2));
    FreeAllBitmaps();
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestBitmapCollisionForCellsWithTranslationsIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    testBitmap1 := CreateBitmap("test_bitmap1", 100, 100);
    testBitmap2 := CreateBitmap("test_bitmap2", 100, 100);
    ClearBitmap(testBitmap1, ColorBlack());
    SetupCollisionMask(testBitmap1);
    ClearBitmap(testBitmap2, ColorBlack());
    SetupCollisionMask(testBitmap2);
    matrix1 := TranslationMatrix(0.0, 0.0);
    matrix2 := TranslationMatrix(50.0, 50.0);
    AssertTrue(BitmapCollisionForCellsWithTranslations(testBitmap1, 0, matrix1, testBitmap2, 0, matrix2));
    FreeAllBitmaps();
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestBitmapCollisionForCellsAtPointsIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    testBitmap1 := CreateBitmap("test_bitmap1", 50, 50);
    testBitmap2 := CreateBitmap("test_bitmap2", 50, 50);
    ClearBitmap(testBitmap1, ColorBlack());
    SetupCollisionMask(testBitmap1);
    ClearBitmap(testBitmap2, ColorBlack());
    SetupCollisionMask(testBitmap2);
    testPoint1 := PointAt(100.0, 100.0);
    testPoint2 := PointAt(125.0, 125.0);
    AssertTrue(BitmapCollisionForCellsAtPoints(testBitmap1, 0, testPoint1, testBitmap2, 0, testPoint2));
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
    SetupCollisionMask(testBitmap1);
    SetupCollisionMask(testBitmap2);
    AssertFalse(BitmapCollisionForCells(testBitmap1, 0, 100.0, 100.0, testBitmap2, 0, 200.0, 100.0));
    AssertTrue(BitmapCollisionForCells(testBitmap1, 0, 100.0, 100.0, testBitmap2, 0, 150.0, 100.0));
    FreeAllBitmaps();
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestBitmapPointCollisionWithTranslationIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    testBitmap := CreateBitmap("test_bitmap", 100, 100);
    ClearBitmap(testBitmap, ColorBlack());
    SetupCollisionMask(testBitmap);
    testTranslation := TranslationMatrix(100.0, 100.0);
    testPoint := PointAt(150.0, 150.0);
    AssertTrue(BitmapPointCollisionWithTranslation(testBitmap, testTranslation, testPoint));
    FreeBitmap(testBitmap);
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestBitmapPointCollisionAtPointIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    testBitmap := CreateBitmap("test_bitmap", 100, 100);
    ClearBitmap(testBitmap, ColorBlack());
    SetupCollisionMask(testBitmap);
    testBmpPoint := PointAt(50.0, 50.0);
    testPoint := PointAt(75.0, 75.0);
    AssertTrue(BitmapPointCollisionAtPoint(testBitmap, testBmpPoint, testPoint));
    FreeBitmap(testBitmap);
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestBitmapPointCollisionIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    testBitmap := CreateBitmap("test_bitmap", 100, 100);
    ClearBitmap(testBitmap, ColorBlack());
    SetupCollisionMask(testBitmap);
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
    SetupCollisionMask(testBitmap);
    testTranslation := TranslationMatrix(100.0, 100.0);
    testPoint := PointAt(150.0, 150.0);
    AssertTrue(BitmapPointCollisionForCellWithTranslation(testBitmap, 0, testTranslation, testPoint));
    FreeBitmap(testBitmap);
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestBitmapPointCollisionForCellAtPointIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    testBitmap := CreateBitmap("test_bitmap", 100, 100);
    ClearBitmap(testBitmap, ColorBlack());
    SetupCollisionMask(testBitmap);
    AssertTrue(BitmapPointCollisionForCellAtPoint(testBitmap, 0, 50.0, 50.0, 50.0, 50.0));
    FreeBitmap(testBitmap);
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestBitmapPointCollisionForCellIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    testBitmap := CreateBitmap("test_bitmap", 100, 100);
    ClearBitmap(testBitmap, ColorBlack());
    DrawPixel(ColorWhite(), 50, 50, OptionDrawToBitmap(testBitmap));
    SetupCollisionMask(testBitmap);
    AssertTrue(BitmapPointCollisionForCell(testBitmap, 0, 0.0, 0.0, 50.0, 50.0));
    FreeBitmap(testBitmap);
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestBitmapRectangleCollisionAtPointIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    testBitmap := CreateBitmap("test_bitmap", 100, 100);
    ClearBitmap(testBitmap, ColorBlack());
    SetupCollisionMask(testBitmap);
    testRectangle := RectangleFrom(50.0, 50.0, 100.0, 100.0);
    testPoint := PointAt(100.0, 100.0);
    AssertTrue(BitmapRectangleCollisionAtPoint(testBitmap, testPoint, testRectangle));
    FreeBitmap(testBitmap);
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestBitmapRectangleCollisionIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    testBitmap := CreateBitmap("test_bitmap", 100, 100);
    ClearBitmap(testBitmap, ColorBlack());
    SetupCollisionMask(testBitmap);
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
    SetupCollisionMask(testBitmap);
    testRectangle := RectangleFrom(150.0, 150.0, 50.0, 50.0);
    testTranslation := TranslationMatrix(100.0, 100.0);
    AssertTrue(BitmapRectangleCollisionForCellWithTranslation(testBitmap, 0, testTranslation, testRectangle));
    FreeBitmap(testBitmap);
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestBitmapRectangleCollisionForCellAtPointIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    testBitmap := CreateBitmap("test_bitmap", 100, 100);
    ClearBitmap(testBitmap, ColorBlack());
    SetupCollisionMask(testBitmap);
    testRectangle := RectangleFrom(100.0, 100.0, 50.0, 50.0);
    testPoint := PointAt(100.0, 100.0);
    AssertTrue(BitmapRectangleCollisionForCellAtPoint(testBitmap, 0, testPoint, testRectangle));
    FreeBitmap(testBitmap);
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestBitmapRectangleCollisionForCellIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    testBitmap := CreateBitmap("test_bitmap", 100, 100);
    ClearBitmap(testBitmap, ColorBlack());
    SetupCollisionMask(testBitmap);
    testRectangle := RectangleFrom(50.0, 50.0, 100.0, 100.0);
    AssertTrue(BitmapRectangleCollisionForCell(testBitmap, 0, 50.0, 50.0, testRectangle));
    FreeBitmap(testBitmap);
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestSpriteBitmapCollisionIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    testBitmap := CreateBitmap("test_bitmap", 100, 100);
    ClearBitmap(testBitmap, ColorBlack());
    SetupCollisionMask(testBitmap);
    testSprite := CreateSprite(testBitmap);
    SpriteSetCollisionKind(testSprite, CollisionTestKind.PIXEL_COLLISIONS);
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
    SetupCollisionMask(testBitmap);
    testSprite := CreateSprite(testBitmap);
    SpriteSetCollisionKind(testSprite, CollisionTestKind.PIXEL_COLLISIONS);
    SpriteSetPosition(testSprite, PointAt(50.0, 50.0));
    AssertTrue(SpriteBitmapCollisionWithCellAtPoint(testSprite, testBitmap, 0, PointAt(50.0, 50.0)));
    FreeAllSprites();
    FreeBitmap(testBitmap);
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestSpriteBitmapCollisionWithCellIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    testBitmap := CreateBitmap("test_bitmap", 100, 100);
    ClearBitmap(testBitmap, ColorBlack());
    SetupCollisionMask(testBitmap);
    testSprite := CreateSprite(testBitmap);
    SpriteSetCollisionKind(testSprite, CollisionTestKind.PIXEL_COLLISIONS);
    SpriteSetPosition(testSprite, PointAt(50.0, 50.0));
    AssertTrue(SpriteBitmapCollisionWithCell(testSprite, testBitmap, 0, 50.0, 50.0));
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
    SetupCollisionMask(testBitmap1);
    ClearBitmap(testBitmap2, ColorBlack());
    SetupCollisionMask(testBitmap2);
    testSprite1 := CreateSprite(testBitmap1);
    testSprite2 := CreateSprite(testBitmap2);
    SpriteSetCollisionKind(testSprite1, CollisionTestKind.PIXEL_COLLISIONS);
    SpriteSetCollisionKind(testSprite2, CollisionTestKind.PIXEL_COLLISIONS);
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
    SetupCollisionMask(testBitmap);
    testSprite := CreateSprite(testBitmap);
    SpriteSetCollisionKind(testSprite, CollisionTestKind.PIXEL_COLLISIONS);
    AssertTrue(SpritePointCollision(testSprite, PointAt(75.0, 75.0)));
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
    SetupCollisionMask(testBitmap);
    testSprite := CreateSprite(testBitmap);
    SpriteSetCollisionKind(testSprite, CollisionTestKind.PIXEL_COLLISIONS);
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
    ApplyMatrixToQuad(testMatrix, testQuad);
    AssertEquals(100.0, testQuad.points[0].x);
    AssertEquals(100.0, testQuad.points[0].y);
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestApplyMatrixToTriangleIntegration;
begin
    testTriangle := TriangleFrom(PointAt(0.0, 0.0), PointAt(1.0, 0.0), PointAt(0.0, 1.0));
    testMatrix := TranslationMatrix(1.0, 1.0);
    ApplyMatrixToTriangle(testMatrix, testTriangle);
    AssertEquals(1.0, testTriangle.points[0].x);
    AssertEquals(1.0, testTriangle.points[0].y);
end;
procedure TIntegrationTests.TestIdentityMatrixIntegration;
begin
    testMatrix := IdentityMatrix();
    AssertEquals(1.0, testMatrix.Elements[0, 0]);
    AssertEquals(1.0, testMatrix.Elements[1, 1]);
    AssertEquals(0.0, testMatrix.Elements[0, 1]);
    AssertEquals(0.0, testMatrix.Elements[1, 0]);
end;
procedure TIntegrationTests.TestMatrixInverseIntegration;
begin
    testMatrix := ScaleRotateTranslateMatrix(PointAt(2.0, 2.0), 45.0, PointAt(10.0, 10.0));
    inverseMatrix := MatrixInverse(testMatrix);
    resultMatrix := MatrixMultiplyMatrix(testMatrix, inverseMatrix);
    AssertEquals(1.0, resultMatrix.Elements[0, 0]);
    AssertEquals(1.0, resultMatrix.Elements[1, 1]);
end;
procedure TIntegrationTests.TestMatrixMultiplyPointIntegration;
begin
    testMatrix := TranslationMatrix(10.0, 10.0);
    testPoint := PointAt(10.0, 20.0);
    resultPoint := MatrixMultiplyPoint(testMatrix, testPoint);
    AssertEquals(20.0, resultPoint.X);
    AssertEquals(30.0, resultPoint.Y);
end;
procedure TIntegrationTests.TestMatrixMultiplyMatrixIntegration;
begin
    testMatrix1 := ScaleMatrix(2.0);
    testMatrix2 := TranslationMatrix(10.0, 10.0);
    resultMatrix := MatrixMultiplyMatrix(testMatrix2, testMatrix1);
    AssertEquals(2.0, resultMatrix.Elements[0, 0]);
    AssertEquals(20.0, resultMatrix.Elements[0, 2]);
end;
procedure TIntegrationTests.TestMatrixMultiplyVectorIntegration;
begin
    testVector := VectorTo(2.0, 2.0);
    testMatrix := ScaleMatrix(2.0);
    resultVector := MatrixMultiplyVector(testMatrix, testVector);
    AssertEquals(4.0, resultVector.X);
    AssertEquals(4.0, resultVector.Y);
end;
procedure TIntegrationTests.TestMatrixToStringIntegration;
begin
    testMatrix := IdentityMatrix();
    AssertEquals(" ------------------------------\\n|        1         0         0 |\\n|        0         1         0 |\\n|        0         0         1 |\\n ------------------------------", MatrixToString(testMatrix));
end;
procedure TIntegrationTests.TestRotationMatrixIntegration;
begin
    testMatrix := RotationMatrix(90.0);
    testPoint := PointAt(1.0, 0.0);
    resultPoint := MatrixMultiplyPoint(testMatrix, testPoint);
    AssertEquals(0, resultPoint.X);
    AssertEquals(1, resultPoint.Y);
end;
procedure TIntegrationTests.TestScaleMatrixFromPointIntegration;
begin
    testScale := PointAt(2.0, 3.0);
    testMatrix := ScaleMatrixFromPoint(testScale);
    testPoint := PointAt(1.0, 1.0);
    resultPoint := MatrixMultiplyPoint(testMatrix, testPoint);
    AssertEquals(2.0, resultPoint.X);
    AssertEquals(3.0, resultPoint.Y);
end;
procedure TIntegrationTests.TestScaleMatrixFromVectorIntegration;
begin
    testScale := VectorTo(2.0, 3.0);
    testMatrix := ScaleMatrixFromVector(testScale);
    testPoint := PointAt(1.0, 1.0);
    resultPoint := MatrixMultiplyPoint(testMatrix, testPoint);
    AssertEquals(2.0, resultPoint.X);
    AssertEquals(3.0, resultPoint.Y);
end;
procedure TIntegrationTests.TestScaleMatrixIntegration;
begin
    testPoint := PointAt(1.0, 1.5);
    testMatrix := ScaleMatrix(2.0);
    resultPoint := MatrixMultiplyPoint(testMatrix, testPoint);
    AssertEquals(2.0, resultPoint.x);
    AssertEquals(3.0, resultPoint.y);
end;
procedure TIntegrationTests.TestScaleRotateTranslateMatrixIntegration;
begin
    testScale := PointAt(2.0, 2.0);
    testTranslate := PointAt(10.0, 10.0);
    testMatrix := ScaleRotateTranslateMatrix(testScale, 90.0, testTranslate);
    testPoint := PointAt(1.0, 0.0);
    resultPoint := MatrixMultiplyPoint(testMatrix, testPoint);
    AssertEquals(10, resultPoint.X);
    AssertEquals(11, resultPoint.Y);
end;
procedure TIntegrationTests.TestTranslationMatrixToPointIntegration;
begin
    testPoint := PointAt(10.0, 20.0);
    testMatrix := TranslationMatrixToPoint(testPoint);
    testVector := PointAt(5.0, 5.0);
    resultPoint := MatrixMultiplyVector(testMatrix, testVector);
    AssertEquals(15.0, resultPoint.X);
    AssertEquals(25.0, resultPoint.Y);
end;
procedure TIntegrationTests.TestTranslationMatrixFromVectorIntegration;
begin
    testVector := VectorTo(10.0, 20.0);
    testMatrix := TranslationMatrixFromVector(testVector);
    testPoint := PointAt(0.0, 0.0);
    resultPoint := MatrixMultiplyPoint(testMatrix, testPoint);
    AssertEquals(10.0, resultPoint.X);
    AssertEquals(20.0, resultPoint.Y);
end;
procedure TIntegrationTests.TestTranslationMatrixIntegration;
begin
    testMatrix := TranslationMatrix(10.0, 20.0);
    testPoint := PointAt(0.0, 0.0);
    resultPoint := MatrixMultiplyPoint(testMatrix, testPoint);
    AssertEquals(10.0, resultPoint.X);
    AssertEquals(20.0, resultPoint.Y);
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
    AssertEquals(1.0, intersectionPoint.X);
    AssertEquals(1.0, intersectionPoint.Y);
end;
procedure TIntegrationTests.TestUnitVectorIntegration;
begin
    testVector := VectorTo(3.0, 4.0);
    testUnitVector := UnitVector(testVector);
    AssertEquals(0.6, testUnitVector.X);
    AssertEquals(0.8, testUnitVector.Y);
end;
procedure TIntegrationTests.TestVectorAddIntegration;
begin
    testVector1 := VectorTo(1.0, 2.0);
    testVector2 := VectorTo(3.0, 4.0);
    resultVector := VectorAdd(testVector1, testVector2);
    AssertEquals(4.0, resultVector.X);
    AssertEquals(6.0, resultVector.Y);
end;
procedure TIntegrationTests.TestVectorAngleIntegration;
begin
    testVector := VectorTo(1.0, 1.0);
    AssertEquals(45.0, VectorAngle(testVector));
end;
procedure TIntegrationTests.TestVectorFromAngleIntegration;
begin
    testVector := VectorFromAngle(0.0, 1.0);
    AssertEquals(1.0, testVector.X);
    AssertEquals(0.0, testVector.Y);
end;
procedure TIntegrationTests.TestVectorFromLineIntegration;
begin
    testLine := LineFrom(PointAt(0.0, 0.0), PointAt(3.0, 4.0));
    testVector := VectorFromLine(testLine);
    AssertEquals(3.0, testVector.X);
    AssertEquals(4.0, testVector.Y);
end;
procedure TIntegrationTests.TestVectorFromPointToRectIntegration;
begin
    testRect := RectangleFrom(0.0, 0.0, 100.0, 100.0);
    testPoint := PointAt(50.0, 50.0);
    testVector := VectorFromPointToRect(testPoint, testRect);
    AssertEquals(0.0, testVector.X);
    AssertEquals(0.0, testVector.Y);
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
    AssertEquals(-3.0, invertedVector.X);
    AssertEquals(-4.0, invertedVector.Y);
end;
procedure TIntegrationTests.TestVectorLimitIntegration;
begin
    testVector := VectorTo(6.0, 8.0);
    limitedVector := VectorLimit(testVector, 5.0);
    AssertEquals(3.0, limitedVector.X);
    AssertEquals(4.0, limitedVector.Y);
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
    AssertEquals(6.0, resultVector.X);
    AssertEquals(8.0, resultVector.Y);
end;
procedure TIntegrationTests.TestVectorNormalIntegration;
begin
    testVector := VectorTo(3.0, 4.0);
    normalVector := VectorNormal(testVector);
    AssertEquals(-0.8, normalVector.X);
    AssertEquals(0.6, normalVector.Y);
end;
procedure TIntegrationTests.TestVectorOutOfCircleFromCircleIntegration;
begin
    testCircleSrc := CircleAt(0.0, 0.0, 5.0);
    testCircleBounds := CircleAt(8.0, 0.0, 5.0);
    testVelocity := VectorTo(1.0, 0.0);
    resultVector := VectorOutOfCircleFromCircle(testCircleSrc, testCircleBounds, testVelocity);
    AssertEquals(-3.42, resultVector.X);
    AssertEquals(0.0, resultVector.Y);
end;
procedure TIntegrationTests.TestVectorOutOfCircleFromPointIntegration;
begin
    testPoint := PointAt(100.0, 100.0);
    testCircle := CircleAt(100.0, 100.0, 10.0);
    testVelocity := VectorTo(1.0, 0.0);
    resultVector := VectorOutOfCircleFromPoint(testPoint, testCircle, testVelocity);
    AssertEquals(-11.42, resultVector.X);
    AssertEquals(0.0, resultVector.Y);
end;
procedure TIntegrationTests.TestVectorOutOfRectFromCircleIntegration;
begin
    testCircle := CircleAt(75.0, 75.0, 25.0);
    testRect := RectangleFrom(0.0, 0.0, 100.0, 100.0);
    testVelocity := VectorTo(1.0, 0.0);
    resultVector := VectorOutOfRectFromCircle(testCircle, testRect, testVelocity);
    AssertEquals(-101.42, resultVector.X);
    AssertEquals(0.0, resultVector.Y);
end;
procedure TIntegrationTests.TestVectorOutOfRectFromPointIntegration;
begin
    testPoint := PointAt(75.0, 75.0);
    testRect := RectangleFrom(0.0, 0.0, 100.0, 100.0);
    testVelocity := VectorTo(1.0, 0.0);
    resultVector := VectorOutOfRectFromPoint(testPoint, testRect, testVelocity);
    AssertEquals(-76.4, resultVector.X);
    AssertEquals(0.0, resultVector.Y);
end;
procedure TIntegrationTests.TestVectorOutOfRectFromRectIntegration;
begin
    testSrcRect := RectangleFrom(75.0, 75.0, 50.0, 50.0);
    testBoundsRect := RectangleFrom(0.0, 0.0, 100.0, 100.0);
    testVelocity := VectorTo(1.0, 0.0);
    resultVector := VectorOutOfRectFromRect(testSrcRect, testBoundsRect, testVelocity);
    AssertEquals(-126.0, resultVector.X);
    AssertEquals(0.0, resultVector.Y);
end;
procedure TIntegrationTests.TestVectorPointToPointIntegration;
begin
    testStartPoint := PointAt(0.0, 0.0);
    testEndPoint := PointAt(3.0, 4.0);
    resultVector := VectorPointToPoint(testStartPoint, testEndPoint);
    AssertEquals(3.0, resultVector.X);
    AssertEquals(4.0, resultVector.Y);
end;
procedure TIntegrationTests.TestVectorSubtractIntegration;
begin
    testVector1 := VectorTo(3.0, 4.0);
    testVector2 := VectorTo(1.0, 1.0);
    resultVector := VectorSubtract(testVector1, testVector2);
    AssertEquals(2.0, resultVector.X);
    AssertEquals(3.0, resultVector.Y);
end;
procedure TIntegrationTests.TestVectorToPointIntegration;
begin
    testPoint := PointAt(3.0, 4.0);
    resultVector := VectorToPoint(testPoint);
    AssertEquals(3.0, resultVector.X);
    AssertEquals(4.0, resultVector.Y);
end;
procedure TIntegrationTests.TestVectorToIntegration;
begin
    testVector := VectorTo(3.0, 4.0);
    AssertEquals(3.0, testVector.X);
    AssertEquals(4.0, testVector.Y);
end;
procedure TIntegrationTests.TestVectorToStringIntegration;
begin
    testVector := VectorFromAngle(3.0, 4.0);
    AssertEquals("Vec -> 3.000000:4.000000", VectorToString(testVector));
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
#<Proc:0x00007f8aefd57268 /mnt/c/Users/Noahc/Documents/.Year 2 Semester 3/Team Project (A)/Github Repo/splashkit_test_generator/test_generator/config/languages/pascal_config.rb:113 (lambda)>
end;
