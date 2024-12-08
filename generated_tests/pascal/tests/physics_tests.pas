uses SplashKit, TestFramework

type
TIntegrationTests = class(TTestCase)
published
procedure TIntegrationTests.TestBitmapCircleCollisionAtPointIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    testBitmap := CreateBitmap("test_bitmap", 100, 100);
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
    testCircle := CircleAt(150.0, 150.0, 50.0);
    collisionResult := BitmapCircleCollision(testBitmap, 100.0, 100.0, testCircle);
    AssertTrue(collisionResult);
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
    collisionResult := BitmapCircleCollision(testBitmap, 0, testTranslation, testCircle);
    AssertTrue(collisionResult);
    FreeBitmap(testBitmap);
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestBitmapCircleCollisionForCellAtPointIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    testBitmap := CreateBitmap("test_bitmap", 100, 100);
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
    testCircle := CircleAt(150.0, 150.0, 50.0);
    collisionResult := BitmapCircleCollision(testBitmap, 0, 100.0, 100.0, testCircle);
    AssertTrue(collisionResult);
    FreeBitmap(testBitmap);
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestBitmapCollisionIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    testBitmap1 := CreateBitmap("test_bitmap1", 100, 100);
    testBitmap2 := CreateBitmap("test_bitmap2", 100, 100);
    collisionResult := BitmapCollision(testBitmap1, 0, 0, testBitmap2, 50, 50);
    AssertTrue(collisionResult);
    collisionResult := BitmapCollision(testBitmap1, 0, 0, testBitmap2, 200, 200);
    AssertFalse(collisionResult);
    FreeAllBitmaps();
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestBitmapCollisionAtPointsIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    testBitmap1 := CreateBitmap("test_bitmap1", 100, 100);
    testBitmap2 := CreateBitmap("test_bitmap2", 100, 100);
    testPoint1 := PointAt(0, 0);
    testPoint2 := PointAt(50, 50);
    collisionResult := BitmapCollision(testBitmap1, testPoint1, testBitmap2, testPoint2);
    AssertTrue(collisionResult);
    FreeAllBitmaps();
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestBitmapCollisionForCellsWithTranslationsIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    testBitmap1 := CreateBitmap("test_bitmap1", 100, 100);
    testBitmap2 := CreateBitmap("test_bitmap2", 100, 100);
    SetupCollisionMask(testBitmap1);
    SetupCollisionMask(testBitmap2);
    matrix1 := TranslationMatrix(0, 0);
    matrix2 := TranslationMatrix(50, 50);
    collisionResult := BitmapCollision(testBitmap1, 0, matrix1, testBitmap2, 0, matrix2);
    AssertTrue(collisionResult);
    FreeBitmap(testBitmap1);
    FreeBitmap(testBitmap2);
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestBitmapCollisionForCellsAtPointsIntegration;
begin
    testWindow := OpenWindow("Collision Test", 800, 600);
    testBitmap1 := CreateBitmap("test_bitmap1", 50, 50);
    testBitmap2 := CreateBitmap("test_bitmap2", 50, 50);
    testPoint1 := PointAt(100.0, 100.0);
    testPoint2 := PointAt(125.0, 125.0);
    collisionResult := BitmapCollision(testBitmap1, 0, testPoint1, testBitmap2, 0, testPoint2);
    AssertTrue(collisionResult);
    FreeAllBitmaps();
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestBitmapCollisionForCellsIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    testBitmap1 := CreateBitmap("test_bitmap1", 100, 100);
    testBitmap2 := CreateBitmap("test_bitmap2", 100, 100);
    collisionResult := BitmapCollision(testBitmap1, 0, 100.0, 100.0, testBitmap2, 0, 150.0, 100.0);
    AssertFalse(collisionResult);
    collisionResult := BitmapCollision(testBitmap1, 0, 100.0, 100.0, testBitmap2, 0, 100.0, 100.0);
    AssertTrue(collisionResult);
    FreeAllBitmaps();
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestBitmapPointCollisionWithTranslationIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    testBitmap := CreateBitmap("test_bitmap", 100, 100);
    ClearBitmap(testBitmap, ColorBlack());
    testTranslation := TranslationMatrix(100, 100);
    testPoint := PointAt(150, 150);
    collisionResult := BitmapPointCollision(testBitmap, testTranslation, testPoint);
    AssertTrue(collisionResult);
    FreeBitmap(testBitmap);
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestBitmapPointCollisionAtPointIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    testBitmap := CreateBitmap("test_bitmap", 100, 100);
    testBmpPt := PointAt(50, 50);
    testPt := PointAt(50, 50);
    collisionResult := BitmapPointCollision(testBitmap, testBmpPt, testPt);
    AssertTrue(collisionResult);
    FreeBitmap(testBitmap);
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestBitmapPointCollisionIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    testBitmap := CreateBitmap("test_bitmap", 100, 100);
    ClearBitmap(testBitmap, ColorBlack());
    collisionResult := BitmapPointCollision(testBitmap, 0.0, 0.0, 50.0, 50.0);
    AssertTrue(collisionResult);
    collisionResult := BitmapPointCollision(testBitmap, 0.0, 0.0, 150.0, 150.0);
    AssertFalse(collisionResult);
    FreeBitmap(testBitmap);
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestBitmapPointCollisionForCellWithTranslationIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    testBitmap := CreateBitmap("test_bitmap", 100, 100);
    testTranslation := TranslationMatrix(100.0, 100.0);
    testPoint := PointAt(150.0, 150.0);
    collisionResult := BitmapPointCollision(testBitmap, 0, testTranslation, testPoint);
    AssertTrue(collisionResult);
    FreeBitmap(testBitmap);
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestBitmapPointCollisionForCellAtPointIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    testBitmap := CreateBitmap("test_bitmap", 100, 100);
    testPoint := PointAt(100, 100);
    collisionResult := BitmapPointCollision(testBitmap, 0, testPoint, testPoint);
    AssertTrue(collisionResult);
    FreeBitmap(testBitmap);
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestBitmapPointCollisionForCellIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    testBitmap := CreateBitmap("test_bitmap", 100, 100);
    collisionResult := BitmapPointCollision(testBitmap, 0, 100.0, 100.0, 100.0, 100.0);
    AssertTrue(collisionResult);
    FreeBitmap(testBitmap);
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestBitmapRectangleCollisionAtPointIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    testBitmap := CreateBitmap("test_bitmap", 100, 100);
    testRectangle := RectangleFrom(50.0, 50.0, 100.0, 100.0);
    testPoint := PointAt(100.0, 100.0);
    collisionResult := BitmapRectangleCollision(testBitmap, testPoint, testRectangle);
    AssertTrue(collisionResult);
    FreeBitmap(testBitmap);
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestBitmapRectangleCollisionIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    testBitmap := CreateBitmap("test_bitmap", 100, 100);
    testRectangle := RectangleFrom(50.0, 50.0, 100.0, 100.0);
    collisionResult := BitmapRectangleCollision(testBitmap, 0.0, 0.0, testRectangle);
    AssertTrue(collisionResult);
    FreeBitmap(testBitmap);
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestBitmapRectangleCollisionForCellWithTranslationIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    testBitmap := CreateBitmap("test_bitmap", 100, 100);
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
    testRectangle := RectangleFrom(100.0, 100.0, 50.0, 50.0);
    testPoint := PointAt(100.0, 100.0);
    collisionResult := BitmapRectangleCollision(testBitmap, 0, testPoint, testRectangle);
    AssertTrue(collisionResult);
    FreeBitmap(testBitmap);
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestBitmapRectangleCollisionForCellIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    testBitmap := CreateBitmap("test_bitmap", 100, 100);
    testRectangle := RectangleFrom(50.0, 50.0, 100.0, 100.0);
    collisionResult := BitmapRectangleCollision(testBitmap, 0, 50.0, 50.0, testRectangle);
    AssertTrue(collisionResult);
    FreeBitmap(testBitmap);
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestSpriteBitmapCollisionIntegration;
begin
    testWindow := OpenWindow("Collision Test", 800, 600);
    testBitmap := CreateBitmap("test_bitmap", 100, 100);
    testSprite := CreateSprite(testBitmap);
    collisionResult := SpriteBitmapCollision(testSprite, testBitmap, 100.0, 100.0);
    AssertTrue(collisionResult);
    collisionResult := SpriteBitmapCollision(testSprite, testBitmap, 200.0, 200.0);
    AssertFalse(collisionResult);
    FreeAllSprites();
    FreeAllBitmaps();
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestSpriteBitmapCollisionWithCellAtPointIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    testBitmap := CreateBitmap("test_bitmap", 100, 100);
    testSprite := CreateSprite(testBitmap);
    collisionResult := SpriteBitmapCollision(testSprite, testBitmap, 0, PointAt(50, 50));
    AssertTrue(collisionResult);
    FreeAllSprites();
    FreeBitmap(testBitmap);
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestSpriteBitmapCollisionWithCellIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    testBitmap := CreateBitmap("test_bitmap", 100, 100);
    testSprite := CreateSprite(testBitmap);
    collisionResult := SpriteBitmapCollision(testSprite, testBitmap, 0, 50.0, 50.0);
    AssertTrue(collisionResult);
    FreeAllSprites();
    FreeAllBitmaps();
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestSpriteCollisionIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    testBitmap1 := CreateBitmap("test_bitmap_1", 50, 50);
    testBitmap2 := CreateBitmap("test_bitmap_2", 50, 50);
    testSprite1 := CreateSprite(testBitmap1);
    testSprite2 := CreateSprite(testBitmap2);
    SpriteSetPosition(testSprite1, PointAt(100, 100));
    SpriteSetPosition(testSprite2, PointAt(150, 150));
    AssertTrue(SpriteCollision(testSprite1, testSprite2));
    SpriteSetPosition(testSprite2, PointAt(200, 200));
    AssertFalse(SpriteCollision(testSprite1, testSprite2));
    FreeAllSprites();
    FreeAllBitmaps();
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestSpritePointCollisionIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    testBitmap := CreateBitmap("test_bitmap", 100, 100);
    testSprite := CreateSprite(testBitmap);
    collisionResult := SpritePointCollision(testSprite, PointAt(50, 50));
    AssertTrue(collisionResult);
    collisionResult := SpritePointCollision(testSprite, PointAt(200, 200));
    AssertFalse(collisionResult);
    FreeAllSprites();
    FreeBitmap(testBitmap);
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestSpriteRectangleCollisionIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    testBitmap := CreateBitmap("test_bitmap", 100, 100);
    testSprite := CreateSprite(testBitmap);
    testRectangle := RectangleFrom(50.0, 50.0, 150.0, 150.0);
    collisionResult := SpriteRectangleCollision(testSprite, testRectangle);
    AssertTrue(collisionResult);
    FreeAllSprites();
    FreeBitmap(testBitmap);
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestApplyMatrixToQuadIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    testMatrix := IdentityMatrix();
    testQuad := QuadFrom(PointAt(100, 100), PointAt(200, 100), PointAt(200, 200), PointAt(100, 200));
    ApplyMatrix(testMatrix, testQuad);
    AssertEquals(quadPoint, PointAt(100, 100));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestApplyMatrixToTriangleIntegration;
begin
    testTriangle := TriangleFrom(PointAt(0.0, 0.0), PointAt(1.0, 0.0), PointAt(0.0, 1.0));
    testMatrix := TranslationMatrix(1.0, 1.0);
    ApplyMatrix(testMatrix, testTriangle);
    AssertEquals("Triangle(x1: 1.0, y1: 1.0, x2: 2.0, y2: 1.0, x3: 1.0, y3: 2.0)", TriangleToString(testTriangle));
end;
procedure TIntegrationTests.TestIdentityMatrixIntegration;
begin
    testMatrix := IdentityMatrix();
    AssertEquals(1.0, [testMatrix, 0]);
    AssertEquals(1.0, [testMatrix, 1]);
    AssertEquals(0.0, [testMatrix, 1]);
    AssertEquals(0.0, [testMatrix, 0]);
end;
procedure TIntegrationTests.TestMatrixInverseIntegration;
begin
    testMatrix := IdentityMatrix();
    inverseMatrix := MatrixInverse(testMatrix);
    resultMatrix := MatrixMultiply(testMatrix, inverseMatrix);
    AssertTrue(VectorsEqual(VectorTo(1.0, 0.0), MatrixMultiply(resultMatrix, VectorTo(1.0, 0.0))));
end;
procedure TIntegrationTests.TestMatrixMultiplyPointIntegration;
begin
    testMatrix := IdentityMatrix();
    testPoint := PointAt(10.0, 20.0);
    resultPoint := MatrixMultiply(testMatrix, testPoint);
    AssertEquals(10.0, resultPoint.x);
    AssertEquals(20.0, resultPoint.y);
end;
procedure TIntegrationTests.TestMatrixMultiplyMatrixIntegration;
begin
    testMatrix1 := IdentityMatrix();
    testMatrix2 := RotationMatrix(45);
    resultMatrix := MatrixMultiply(testMatrix1, testMatrix2);
    AssertEquals(Cosine(45), [resultMatrix, 0]);
    AssertEquals(Sine(45), [resultMatrix, 1]);
end;
procedure TIntegrationTests.TestMatrixMultiplyVectorIntegration;
begin
    testVector := VectorTo(1.0, 1.0);
    testMatrix := ScaleMatrix(2.0);
    resultVector := MatrixMultiply(testMatrix, testVector);
    AssertEquals(2.0, resultVector.x);
    AssertEquals(2.0, resultVector.y);
end;
procedure TIntegrationTests.TestMatrixToStringIntegration;
begin
    testMatrix := IdentityMatrix();
    testMatrixString := MatrixToString(testMatrix);
    AssertEquals("[1, 0, 0, 1, 0, 0]", testMatrixString);
end;
procedure TIntegrationTests.TestRotationMatrixIntegration;
begin
    testMatrix := RotationMatrix(45.0);
    testVector := VectorTo(1.0, 0.0);
    resultVector := MatrixMultiply(testMatrix, testVector);
    AssertTrue((VectorMagnitude(resultVector) >= 0.99) and (VectorMagnitude(resultVector) <= 1.01));
    AssertTrue((VectorAngle(resultVector) >= 44.0) and (VectorAngle(resultVector) <= 46.0));
end;
procedure TIntegrationTests.TestScaleMatrixFromPointIntegration;
begin
    testScale := PointAt(2.0, 3.0);
    testMatrix := ScaleMatrix(testScale);
    testVector := VectorTo(1.0, 1.0);
    resultVector := MatrixMultiply(testMatrix, testVector);
    AssertEquals(2.0, resultVector.x);
    AssertEquals(3.0, resultVector.y);
end;
procedure TIntegrationTests.TestScaleMatrixFromVectorIntegration;
begin
    testScaleVector := VectorTo(2.0, 3.0);
    testMatrix := ScaleMatrix(testScaleVector);
    testVector := VectorTo(1.0, 1.0);
    resultVector := MatrixMultiply(testMatrix, testVector);
    AssertEquals(2.0, resultVector.x);
    AssertEquals(3.0, resultVector.y);
end;
procedure TIntegrationTests.TestScaleMatrixIntegration;
begin
    testMatrix := ScaleMatrix(2.0);
    testVector := VectorTo(1.0, 1.0);
    resultVector := MatrixMultiply(testMatrix, testVector);
    AssertEquals(2.0, resultVector.x);
    AssertEquals(2.0, resultVector.y);
end;
procedure TIntegrationTests.TestScaleRotateTranslateMatrixIntegration;
begin
    testScale := PointAt(2.0, 3.0);
    testTranslate := PointAt(10.0, 20.0);
    testMatrix := ScaleRotateTranslateMatrix(testScale, 45.0, testTranslate);
    testPoint := PointAt(1.0, 1.0);
    resultPoint := MatrixMultiply(testMatrix, testPoint);
    AssertTrue((resultPoint.x >= 10.0) and (resultPoint.x <= 10.1));
    AssertTrue((resultPoint.y >= 23.0) and (resultPoint.y <= 23.1));
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
    testAngle := AngleBetween(testVector1, testVector2);
    AssertTrue((testAngle >= 89.9) and (testAngle <= 90.1));
end;
procedure TIntegrationTests.TestDotProductIntegration;
begin
    testVector1 := VectorTo(3.0, 4.0);
    testVector2 := VectorTo(1.0, 2.0);
    testResult := DotProduct(testVector1, testVector2);
    AssertEquals(11.0, testResult);
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
    intersectionResult := RayIntersectionPoint(testFromPt, testHeading, testLine, PointAt(0.0, 0.0));
    AssertTrue(intersectionResult);
end;
procedure TIntegrationTests.TestUnitVectorIntegration;
begin
    testVector := VectorTo(3.0, 4.0);
    testUnitVector := UnitVector(testVector);
    AssertEquals(1.0, VectorMagnitude(testUnitVector));
    AssertEquals(VectorAngle(testVector), VectorAngle(testUnitVector));
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
    testAngle := VectorAngle(testVector);
    AssertTrue((testAngle >= 45.0) and (testAngle <= 45.001));
end;
procedure TIntegrationTests.TestVectorFromAngleIntegration;
begin
    testVector := VectorFromAngle(45.0, 1.0);
    AssertTrue((VectorMagnitude(testVector) >= 0.99) and (VectorMagnitude(testVector) <= 1.01));
    AssertTrue((VectorAngle(testVector) >= 44.0) and (VectorAngle(testVector) <= 46.0));
end;
procedure TIntegrationTests.TestVectorFromLineIntegration;
begin
    testLine := LineFrom(PointAt(0.0, 0.0), PointAt(10.0, 10.0));
    testVector := VectorFromLine(testLine);
    AssertEquals(10.0, testVector.x);
    AssertEquals(10.0, testVector.y);
end;
procedure TIntegrationTests.TestVectorFromPointToRectIntegration;
begin
    testRect := RectangleFrom(0.0, 0.0, 100.0, 100.0);
    testPoint := PointAt(50.0, 50.0);
    testVector := VectorFromPointToRect(testPoint, testRect);
    AssertEquals(0.0, VectorMagnitude(testVector));
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
    AssertEquals(invertedVector, VectorTo(-3.0, -4.0));
end;
procedure TIntegrationTests.TestVectorLimitIntegration;
begin
    testVector := VectorTo(3.0, 4.0);
    limitedVector := VectorLimit(testVector, 5.0);
    AssertTrue(VectorMagnitude(limitedVector) <= 5.0);
    AssertTrue(VectorsEqual(testVector, limitedVector));
end;
procedure TIntegrationTests.TestVectorMagnitudeIntegration;
begin
    testVector := VectorTo(3.0, 4.0);
    testMagnitude := VectorMagnitude(testVector);
    AssertEquals(5.0, testMagnitude);
end;
procedure TIntegrationTests.TestVectorMagnitudeSquaredIntegration;
begin
    testVector := VectorTo(3.0, 4.0);
    result := VectorMagnitudeSquared(testVector);
    AssertEquals(25.0, result);
end;
procedure TIntegrationTests.TestVectorMultiplyIntegration;
begin
    testVector := VectorTo(3.0, 4.0);
    resultVector := VectorMultiply(testVector, 2.0);
    AssertEquals(10.0, VectorMagnitude(resultVector));
    AssertEquals(VectorAngle(testVector), VectorAngle(resultVector));
end;
procedure TIntegrationTests.TestVectorNormalIntegration;
begin
    testVector := VectorTo(3.0, 4.0);
    normalVector := VectorNormal(testVector);
    AssertEquals(5.0, VectorMagnitude(normalVector));
    AssertEquals(53.1301, VectorAngle(normalVector));
end;
procedure TIntegrationTests.TestVectorOutOfCircleFromCircleIntegration;
begin
    testCircleSrc := CircleAt(100.0, 100.0, 50.0);
    testCircleBounds := CircleAt(150.0, 150.0, 75.0);
    testVelocity := VectorTo(10.0, 10.0);
    testResultVector := VectorOutOfCircleFromCircle(testCircleSrc, testCircleBounds, testVelocity);
    AssertTrue(VectorMagnitude(testResultVector) > 0.0);
    AssertTrue(CirclesIntersect(CircleAt(PointOffsetBy(CenterPoint(testCircleSrc), testResultVector), CircleRadius(testCircleSrc)), testCircleBounds));
end;
procedure TIntegrationTests.TestVectorOutOfCircleFromPointIntegration;
begin
    testPoint := PointAt(100.0, 100.0);
    testCircle := CircleAt(150.0, 150.0, 50.0);
    testVelocity := VectorTo(10.0, 10.0);
    testResult := VectorOutOfCircleFromPoint(testPoint, testCircle, testVelocity);
    AssertTrue(VectorMagnitude(testResult) > 0.0);
end;
procedure TIntegrationTests.TestVectorOutOfRectFromCircleIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    testCircle := CircleAt(100.0, 100.0, 50.0);
    testRectangle := RectangleFrom(50.0, 50.0, 200.0, 200.0);
    testVelocity := VectorTo(10.0, 0.0);
    testResultVector := VectorOutOfRectFromCircle(testCircle, testRectangle, testVelocity);
    AssertNotEquals(0.0, VectorMagnitude(testResultVector));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestVectorOutOfRectFromPointIntegration;
begin
    testPoint := PointAt(50.0, 50.0);
    testRectangle := RectangleFrom(0.0, 0.0, 100.0, 100.0);
    testVelocity := VectorTo(1.0, 1.0);
    resultVector := VectorOutOfRectFromPoint(testPoint, testRectangle, testVelocity);
    AssertTrue(PointInRectangle(PointOffsetBy(testPoint, resultVector), testRectangle));
end;
procedure TIntegrationTests.TestVectorOutOfRectFromRectIntegration;
begin
    testSrcRect := RectangleFrom(50.0, 50.0, 100.0, 100.0);
    testBoundsRect := RectangleFrom(0.0, 0.0, 200.0, 200.0);
    testVelocity := VectorTo(10.0, 10.0);
    testResultVector := VectorOutOfRectFromRect(testSrcRect, testBoundsRect, testVelocity);
    AssertNotEquals(0.0, VectorMagnitude(testResultVector));
end;
procedure TIntegrationTests.TestVectorPointToPointIntegration;
begin
    testStartPoint := PointAt(0.0, 0.0);
    testEndPoint := PointAt(3.0, 4.0);
    testVector := VectorPointToPoint(testStartPoint, testEndPoint);
    AssertEquals(testVector, VectorTo(3.0, 4.0));
end;
procedure TIntegrationTests.TestVectorSubtractIntegration;
begin
    testVector1 := VectorTo(3.0, 4.0);
    testVector2 := VectorTo(1.0, 1.0);
    resultVector := VectorSubtract(testVector1, testVector2);
    AssertEquals(3.0, VectorMagnitude(resultVector));
    AssertEquals(45.0, VectorAngle(resultVector));
end;
procedure TIntegrationTests.TestVectorToPointIntegration;
begin
    testPoint := PointAt(3.0, 4.0);
    testVector := VectorTo(testPoint);
    AssertEquals(3.0, testVector.x);
    AssertEquals(4.0, testVector.y);
end;
procedure TIntegrationTests.TestVectorToIntegration;
begin
    testVector := VectorTo(3.0, 4.0);
    AssertEquals(5.0, VectorMagnitude(testVector));
    AssertEquals(53.1301, VectorAngle(testVector));
end;
procedure TIntegrationTests.TestVectorToStringIntegration;
begin
    testVector := VectorTo(3.0, 4.0);
    testString := VectorToString(testVector);
    AssertEquals("Vector(3.0, 4.0)", testString);
end;
procedure TIntegrationTests.TestVectorsEqualIntegration;
begin
    testVector1 := VectorTo(1.0, 1.0);
    testVector2 := VectorTo(1.0, 1.0);
    AssertTrue(VectorsEqual(testVector1, testVector2));
    testVector3 := VectorTo(1.0, 2.0);
    AssertFalse(VectorsEqual(testVector1, testVector3));
end;
procedure TIntegrationTests.TestVectorsNotEqualIntegration;
begin
    testVector1 := VectorTo(1.0, 1.0);
    testVector2 := VectorTo(1.0, 1.0);
    AssertFalse(VectorsNotEqual(testVector1, testVector2));
    testVector3 := VectorTo(1.0, 2.0);
    AssertTrue(VectorsNotEqual(testVector1, testVector3));
end;
end;

procedure RegisterTests;
begin
TestFramework.RegisterTest(TIntegrationTests.Suite);
end;
