uses SplashKit, TestFramework

type
TIntegrationTests = class(TTestCase)
published
procedure TIntegrationTests.TestBitmapCircleCollisionAtPointIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    testBitmap := create_bitmap("test_bitmap", 100, 100);
    testCircle := circle_at(150.0, 150.0, 50.0);
    testPoint := point_at(100.0, 100.0);
    AssertTrue(bitmap_circle_collision(testBitmap, testPoint, testCircle));
    free_bitmap(testBitmap);
    close_window(testWindow);
end;
procedure TIntegrationTests.TestBitmapCircleCollisionIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    testBitmap := create_bitmap("test_bitmap", 100, 100);
    testCircle := circle_at(150.0, 150.0, 50.0);
    collisionResult := bitmap_circle_collision(testBitmap, 100.0, 100.0, testCircle);
    AssertTrue(collisionResult);
    free_bitmap(testBitmap);
    close_window(testWindow);
end;
procedure TIntegrationTests.TestBitmapCircleCollisionForCellWithTranslationIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    testBitmap := create_bitmap("test_bitmap", 100, 100);
    clear_bitmap(testBitmap, color_black());
    testCircle := circle_at(150.0, 150.0, 50.0);
    testTranslation := translation_matrix(100.0, 100.0);
    collisionResult := bitmap_circle_collision(testBitmap, 0, testTranslation, testCircle);
    AssertTrue(collisionResult);
    free_bitmap(testBitmap);
    close_window(testWindow);
end;
procedure TIntegrationTests.TestBitmapCircleCollisionForCellAtPointIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    testBitmap := create_bitmap("test_bitmap", 100, 100);
    testCircle := circle_at(150.0, 150.0, 50.0);
    testPoint := point_at(100.0, 100.0);
    AssertTrue(bitmap_circle_collision(testBitmap, 0, testPoint, testCircle));
    free_bitmap(testBitmap);
    close_window(testWindow);
end;
procedure TIntegrationTests.TestBitmapCircleCollisionForCellIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    testBitmap := create_bitmap("test_bitmap", 100, 100);
    testCircle := circle_at(150.0, 150.0, 50.0);
    collisionResult := bitmap_circle_collision(testBitmap, 0, 100.0, 100.0, testCircle);
    AssertTrue(collisionResult);
    free_bitmap(testBitmap);
    close_window(testWindow);
end;
procedure TIntegrationTests.TestBitmapCollisionIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    testBitmap1 := create_bitmap("test_bitmap1", 100, 100);
    testBitmap2 := create_bitmap("test_bitmap2", 100, 100);
    collisionResult := bitmap_collision(testBitmap1, 0, 0, testBitmap2, 50, 50);
    AssertTrue(collisionResult);
    collisionResult := bitmap_collision(testBitmap1, 0, 0, testBitmap2, 200, 200);
    AssertFalse(collisionResult);
    free_all_bitmaps();
    close_window(testWindow);
end;
procedure TIntegrationTests.TestBitmapCollisionAtPointsIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    testBitmap1 := create_bitmap("test_bitmap1", 100, 100);
    testBitmap2 := create_bitmap("test_bitmap2", 100, 100);
    testPoint1 := point_at(0, 0);
    testPoint2 := point_at(50, 50);
    collisionResult := bitmap_collision(testBitmap1, testPoint1, testBitmap2, testPoint2);
    AssertTrue(collisionResult);
    free_all_bitmaps();
    close_window(testWindow);
end;
procedure TIntegrationTests.TestBitmapCollisionForCellsWithTranslationsIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    testBitmap1 := create_bitmap("test_bitmap1", 100, 100);
    testBitmap2 := create_bitmap("test_bitmap2", 100, 100);
    setup_collision_mask(testBitmap1);
    setup_collision_mask(testBitmap2);
    matrix1 := translation_matrix(0, 0);
    matrix2 := translation_matrix(50, 50);
    collisionResult := bitmap_collision(testBitmap1, 0, matrix1, testBitmap2, 0, matrix2);
    AssertTrue(collisionResult);
    free_bitmap(testBitmap1);
    free_bitmap(testBitmap2);
    close_window(testWindow);
end;
procedure TIntegrationTests.TestBitmapCollisionForCellsAtPointsIntegration;
begin
    testWindow := open_window("Collision Test", 800, 600);
    testBitmap1 := create_bitmap("test_bitmap1", 50, 50);
    testBitmap2 := create_bitmap("test_bitmap2", 50, 50);
    testPoint1 := point_at(100.0, 100.0);
    testPoint2 := point_at(125.0, 125.0);
    collisionResult := bitmap_collision(testBitmap1, 0, testPoint1, testBitmap2, 0, testPoint2);
    AssertTrue(collisionResult);
    free_all_bitmaps();
    close_window(testWindow);
end;
procedure TIntegrationTests.TestBitmapCollisionForCellsIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    testBitmap1 := create_bitmap("test_bitmap1", 100, 100);
    testBitmap2 := create_bitmap("test_bitmap2", 100, 100);
    collisionResult := bitmap_collision(testBitmap1, 0, 100.0, 100.0, testBitmap2, 0, 150.0, 100.0);
    AssertFalse(collisionResult);
    collisionResult := bitmap_collision(testBitmap1, 0, 100.0, 100.0, testBitmap2, 0, 100.0, 100.0);
    AssertTrue(collisionResult);
    free_all_bitmaps();
    close_window(testWindow);
end;
procedure TIntegrationTests.TestBitmapPointCollisionWithTranslationIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    testBitmap := create_bitmap("test_bitmap", 100, 100);
    clear_bitmap(testBitmap, color_black());
    testTranslation := translation_matrix(100, 100);
    testPoint := point_at(150, 150);
    collisionResult := bitmap_point_collision(testBitmap, testTranslation, testPoint);
    AssertTrue(collisionResult);
    free_bitmap(testBitmap);
    close_window(testWindow);
end;
procedure TIntegrationTests.TestBitmapPointCollisionAtPointIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    testBitmap := create_bitmap("test_bitmap", 100, 100);
    testBmpPt := point_at(50, 50);
    testPt := point_at(50, 50);
    collisionResult := bitmap_point_collision(testBitmap, testBmpPt, testPt);
    AssertTrue(collisionResult);
    free_bitmap(testBitmap);
    close_window(testWindow);
end;
procedure TIntegrationTests.TestBitmapPointCollisionIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    testBitmap := create_bitmap("test_bitmap", 100, 100);
    clear_bitmap(testBitmap, color_black());
    collisionResult := bitmap_point_collision(testBitmap, 0.0, 0.0, 50.0, 50.0);
    AssertTrue(collisionResult);
    collisionResult := bitmap_point_collision(testBitmap, 0.0, 0.0, 150.0, 150.0);
    AssertFalse(collisionResult);
    free_bitmap(testBitmap);
    close_window(testWindow);
end;
procedure TIntegrationTests.TestBitmapPointCollisionForCellWithTranslationIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    testBitmap := create_bitmap("test_bitmap", 100, 100);
    testTranslation := translation_matrix(100.0, 100.0);
    testPoint := point_at(150.0, 150.0);
    collisionResult := bitmap_point_collision(testBitmap, 0, testTranslation, testPoint);
    AssertTrue(collisionResult);
    free_bitmap(testBitmap);
    close_window(testWindow);
end;
procedure TIntegrationTests.TestBitmapPointCollisionForCellAtPointIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    testBitmap := create_bitmap("test_bitmap", 100, 100);
    testPoint := point_at(100, 100);
    collisionResult := bitmap_point_collision(testBitmap, 0, testPoint, testPoint);
    AssertTrue(collisionResult);
    free_bitmap(testBitmap);
    close_window(testWindow);
end;
procedure TIntegrationTests.TestBitmapPointCollisionForCellIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    testBitmap := create_bitmap("test_bitmap", 100, 100);
    collisionResult := bitmap_point_collision(testBitmap, 0, 100.0, 100.0, 100.0, 100.0);
    AssertTrue(collisionResult);
    free_bitmap(testBitmap);
    close_window(testWindow);
end;
procedure TIntegrationTests.TestBitmapRectangleCollisionAtPointIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    testBitmap := create_bitmap("test_bitmap", 100, 100);
    testRectangle := rectangle_from(50.0, 50.0, 100.0, 100.0);
    testPoint := point_at(100.0, 100.0);
    collisionResult := bitmap_rectangle_collision(testBitmap, testPoint, testRectangle);
    AssertTrue(collisionResult);
    free_bitmap(testBitmap);
    close_window(testWindow);
end;
procedure TIntegrationTests.TestBitmapRectangleCollisionIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    testBitmap := create_bitmap("test_bitmap", 100, 100);
    testRectangle := rectangle_from(50.0, 50.0, 100.0, 100.0);
    collisionResult := bitmap_rectangle_collision(testBitmap, 0.0, 0.0, testRectangle);
    AssertTrue(collisionResult);
    free_bitmap(testBitmap);
    close_window(testWindow);
end;
procedure TIntegrationTests.TestBitmapRectangleCollisionForCellWithTranslationIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    testBitmap := create_bitmap("test_bitmap", 100, 100);
    testRectangle := rectangle_from(150.0, 150.0, 50.0, 50.0);
    testTranslation := translation_matrix(100.0, 100.0);
    AssertTrue(bitmap_rectangle_collision(testBitmap, 0, testTranslation, testRectangle));
    free_bitmap(testBitmap);
    close_window(testWindow);
end;
procedure TIntegrationTests.TestBitmapRectangleCollisionForCellAtPointIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    testBitmap := create_bitmap("test_bitmap", 100, 100);
    testRectangle := rectangle_from(100.0, 100.0, 50.0, 50.0);
    testPoint := point_at(100.0, 100.0);
    collisionResult := bitmap_rectangle_collision(testBitmap, 0, testPoint, testRectangle);
    AssertTrue(collisionResult);
    free_bitmap(testBitmap);
    close_window(testWindow);
end;
procedure TIntegrationTests.TestBitmapRectangleCollisionForCellIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    testBitmap := create_bitmap("test_bitmap", 100, 100);
    testRectangle := rectangle_from(50.0, 50.0, 100.0, 100.0);
    collisionResult := bitmap_rectangle_collision(testBitmap, 0, 50.0, 50.0, testRectangle);
    AssertTrue(collisionResult);
    free_bitmap(testBitmap);
    close_window(testWindow);
end;
procedure TIntegrationTests.TestSpriteBitmapCollisionIntegration;
begin
    testWindow := open_window("Collision Test", 800, 600);
    testBitmap := create_bitmap("test_bitmap", 100, 100);
    testSprite := create_sprite(testBitmap);
    collisionResult := sprite_bitmap_collision(testSprite, testBitmap, 100.0, 100.0);
    AssertTrue(collisionResult);
    collisionResult := sprite_bitmap_collision(testSprite, testBitmap, 200.0, 200.0);
    AssertFalse(collisionResult);
    free_all_sprites();
    free_all_bitmaps();
    close_window(testWindow);
end;
procedure TIntegrationTests.TestSpriteBitmapCollisionWithCellAtPointIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    testBitmap := create_bitmap("test_bitmap", 100, 100);
    testSprite := create_sprite(testBitmap);
    collisionResult := sprite_bitmap_collision(testSprite, testBitmap, 0, point_at(50, 50));
    AssertTrue(collisionResult);
    free_all_sprites();
    free_bitmap(testBitmap);
    close_window(testWindow);
end;
procedure TIntegrationTests.TestSpriteBitmapCollisionWithCellIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    testBitmap := create_bitmap("test_bitmap", 100, 100);
    testSprite := create_sprite(testBitmap);
    collisionResult := sprite_bitmap_collision(testSprite, testBitmap, 0, 50.0, 50.0);
    AssertTrue(collisionResult);
    free_all_sprites();
    free_all_bitmaps();
    close_window(testWindow);
end;
procedure TIntegrationTests.TestSpriteCollisionIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    testBitmap1 := create_bitmap("test_bitmap_1", 50, 50);
    testBitmap2 := create_bitmap("test_bitmap_2", 50, 50);
    testSprite1 := create_sprite(testBitmap1);
    testSprite2 := create_sprite(testBitmap2);
    sprite_set_position(testSprite1, point_at(100, 100));
    sprite_set_position(testSprite2, point_at(150, 150));
    AssertTrue(sprite_collision(testSprite1, testSprite2));
    sprite_set_position(testSprite2, point_at(200, 200));
    AssertFalse(sprite_collision(testSprite1, testSprite2));
    free_all_sprites();
    free_all_bitmaps();
    close_window(testWindow);
end;
procedure TIntegrationTests.TestSpritePointCollisionIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    testBitmap := create_bitmap("test_bitmap", 100, 100);
    testSprite := create_sprite(testBitmap);
    collisionResult := sprite_point_collision(testSprite, point_at(50, 50));
    AssertTrue(collisionResult);
    collisionResult := sprite_point_collision(testSprite, point_at(200, 200));
    AssertFalse(collisionResult);
    free_all_sprites();
    free_bitmap(testBitmap);
    close_window(testWindow);
end;
procedure TIntegrationTests.TestSpriteRectangleCollisionIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    testBitmap := create_bitmap("test_bitmap", 100, 100);
    testSprite := create_sprite(testBitmap);
    testRectangle := rectangle_from(50.0, 50.0, 150.0, 150.0);
    collisionResult := sprite_rectangle_collision(testSprite, testRectangle);
    AssertTrue(collisionResult);
    free_all_sprites();
    free_bitmap(testBitmap);
    close_window(testWindow);
end;
procedure TIntegrationTests.TestApplyMatrixToQuadIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    testMatrix := identity_matrix();
    testQuad := quad_from(point_at(100, 100), point_at(200, 100), point_at(200, 200), point_at(100, 200));
    apply_matrix(testMatrix, testQuad);
    AssertEquals(point_at(100, 100), quadPoint);
    close_window(testWindow);
end;
procedure TIntegrationTests.TestApplyMatrixToTriangleIntegration;
begin
    testTriangle := triangle_from(point_at(0.0, 0.0), point_at(1.0, 0.0), point_at(0.0, 1.0));
    testMatrix := translation_matrix(1.0, 1.0);
    apply_matrix(testMatrix, testTriangle);
    AssertEquals(triangle_to_string(testTriangle), "Triangle(x1: 1.0, y1: 1.0, x2: 2.0, y2: 1.0, x3: 1.0, y3: 2.0)");
end;
procedure TIntegrationTests.TestIdentityMatrixIntegration;
begin
    testMatrix := identity_matrix();
    AssertEquals(testMatrix[0, 0], 1.0);
    AssertEquals(testMatrix[1, 1], 1.0);
    AssertEquals(testMatrix[0, 1], 0.0);
    AssertEquals(testMatrix[1, 0], 0.0);
end;
procedure TIntegrationTests.TestMatrixInverseIntegration;
begin
    testMatrix := identity_matrix();
    inverseMatrix := matrix_inverse(testMatrix);
    resultMatrix := matrix_multiply(testMatrix, inverseMatrix);
    AssertTrue(vectors_equal(vector_to(1.0, 0.0), matrix_multiply(resultMatrix, vector_to(1.0, 0.0))));
end;
procedure TIntegrationTests.TestMatrixMultiplyPointIntegration;
begin
    testMatrix := identity_matrix();
    testPoint := point_at(10.0, 20.0);
    resultPoint := matrix_multiply(testMatrix, testPoint);
    AssertEquals(resultPoint.x, 10.0);
    AssertEquals(resultPoint.y, 20.0);
end;
procedure TIntegrationTests.TestMatrixMultiplyMatrixIntegration;
begin
    testMatrix1 := identity_matrix();
    testMatrix2 := rotation_matrix(45);
    resultMatrix := matrix_multiply(testMatrix1, testMatrix2);
    AssertEquals(resultMatrix[0, 0], cosine(45));
    AssertEquals(resultMatrix[0, 1], sine(45));
end;
procedure TIntegrationTests.TestMatrixMultiplyVectorIntegration;
begin
    testVector := vector_to(1.0, 1.0);
    testMatrix := scale_matrix(2.0);
    resultVector := matrix_multiply(testMatrix, testVector);
    AssertEquals(resultVector.x, 2.0);
    AssertEquals(resultVector.y, 2.0);
end;
procedure TIntegrationTests.TestMatrixToStringIntegration;
begin
    testMatrix := identity_matrix();
    testMatrixString := matrix_to_string(testMatrix);
    AssertEquals(testMatrixString, "[1, 0, 0, 1, 0, 0]");
end;
procedure TIntegrationTests.TestRotationMatrixIntegration;
begin
    testMatrix := rotation_matrix(45.0);
    testVector := vector_to(1.0, 0.0);
    resultVector := matrix_multiply(testMatrix, testVector);
    AssertTrue((vector_magnitude(resultVector) >= 0.99) and (vector_magnitude(resultVector) <= 1.01));
    AssertTrue((vector_angle(resultVector) >= 44.0) and (vector_angle(resultVector) <= 46.0));
end;
procedure TIntegrationTests.TestScaleMatrixFromPointIntegration;
begin
    testScale := point_at(2.0, 3.0);
    testMatrix := scale_matrix(testScale);
    testVector := vector_to(1.0, 1.0);
    resultVector := matrix_multiply(testMatrix, testVector);
    AssertEquals(resultVector.x, 2.0);
    AssertEquals(resultVector.y, 3.0);
end;
procedure TIntegrationTests.TestScaleMatrixFromVectorIntegration;
begin
    testScaleVector := vector_to(2.0, 3.0);
    testMatrix := scale_matrix(testScaleVector);
    testVector := vector_to(1.0, 1.0);
    resultVector := matrix_multiply(testMatrix, testVector);
    AssertEquals(resultVector.x, 2.0);
    AssertEquals(resultVector.y, 3.0);
end;
procedure TIntegrationTests.TestScaleMatrixIntegration;
begin
    testMatrix := scale_matrix(2.0);
    testVector := vector_to(1.0, 1.0);
    resultVector := matrix_multiply(testMatrix, testVector);
    AssertEquals(resultVector.x, 2.0);
    AssertEquals(resultVector.y, 2.0);
end;
procedure TIntegrationTests.TestScaleRotateTranslateMatrixIntegration;
begin
    testScale := point_at(2.0, 3.0);
    testTranslate := point_at(10.0, 20.0);
    testMatrix := scale_rotate_translate_matrix(testScale, 45.0, testTranslate);
    testPoint := point_at(1.0, 1.0);
    resultPoint := matrix_multiply(testMatrix, testPoint);
    AssertTrue((resultPoint.x >= 10.0) and (resultPoint.x <= 10.1));
    AssertTrue((resultPoint.y >= 23.0) and (resultPoint.y <= 23.1));
end;
procedure TIntegrationTests.TestTranslationMatrixToPointIntegration;
begin
    testPoint := point_at(10.0, 20.0);
    testMatrix := translation_matrix(testPoint);
    testVector := point_at(5.0, 5.0);
    resultPoint := matrix_multiply(testMatrix, testVector);
    AssertEquals(resultPoint.x, 15.0);
    AssertEquals(resultPoint.y, 25.0);
end;
procedure TIntegrationTests.TestTranslationMatrixFromVectorIntegration;
begin
    testVector := vector_to(10.0, 20.0);
    testMatrix := translation_matrix(testVector);
    testPoint := point_at(0.0, 0.0);
    resultPoint := matrix_multiply(testMatrix, testPoint);
    AssertEquals(resultPoint.x, 10.0);
    AssertEquals(resultPoint.y, 20.0);
end;
procedure TIntegrationTests.TestTranslationMatrixIntegration;
begin
    testMatrix := translation_matrix(10.0, 20.0);
    testPoint := point_at(0.0, 0.0);
    resultPoint := matrix_multiply(testMatrix, testPoint);
    AssertEquals(resultPoint.x, 10.0);
    AssertEquals(resultPoint.y, 20.0);
end;
procedure TIntegrationTests.TestAngleBetweenIntegration;
begin
    testVector1 := vector_to(1.0, 0.0);
    testVector2 := vector_to(0.0, 1.0);
    testAngle := angle_between(testVector1, testVector2);
    AssertTrue((testAngle >= 89.9) and (testAngle <= 90.1));
end;
procedure TIntegrationTests.TestDotProductIntegration;
begin
    testVector1 := vector_to(3.0, 4.0);
    testVector2 := vector_to(1.0, 2.0);
    testResult := dot_product(testVector1, testVector2);
    AssertEquals(testResult, 11.0);
end;
procedure TIntegrationTests.TestIsZeroVectorIntegration;
begin
    testZeroVector := vector_to(0.0, 0.0);
    testNonZeroVector := vector_to(1.0, 1.0);
    AssertTrue(is_zero_vector(testZeroVector));
    AssertFalse(is_zero_vector(testNonZeroVector));
end;
procedure TIntegrationTests.TestRayIntersectionPointIntegration;
begin
    testFromPt := point_at(0.0, 0.0);
    testHeading := vector_to(1.0, 1.0);
    testLine := line_from(point_at(0.0, 2.0), point_at(2.0, 0.0));
    intersectionResult := ray_intersection_point(testFromPt, testHeading, testLine, point_at(0.0, 0.0));
    AssertTrue(intersectionResult);
end;
procedure TIntegrationTests.TestUnitVectorIntegration;
begin
    testVector := vector_to(3.0, 4.0);
    testUnitVector := unit_vector(testVector);
    AssertEquals(vector_magnitude(testUnitVector), 1.0);
    AssertEquals(vector_angle(testUnitVector), vector_angle(testVector));
end;
procedure TIntegrationTests.TestVectorAddIntegration;
begin
    testVector1 := vector_to(1.0, 2.0);
    testVector2 := vector_to(3.0, 4.0);
    resultVector := vector_add(testVector1, testVector2);
    AssertEquals(resultVector.x, 4.0);
    AssertEquals(resultVector.y, 6.0);
end;
procedure TIntegrationTests.TestVectorAngleIntegration;
begin
    testVector := vector_to(1.0, 1.0);
    testAngle := vector_angle(testVector);
    AssertTrue((testAngle >= 45.0) and (testAngle <= 45.001));
end;
procedure TIntegrationTests.TestVectorFromAngleIntegration;
begin
    testVector := vector_from_angle(45.0, 1.0);
    AssertTrue((vector_magnitude(testVector) >= 0.99) and (vector_magnitude(testVector) <= 1.01));
    AssertTrue((vector_angle(testVector) >= 44.0) and (vector_angle(testVector) <= 46.0));
end;
procedure TIntegrationTests.TestVectorFromLineIntegration;
begin
    testLine := line_from(point_at(0.0, 0.0), point_at(10.0, 10.0));
    testVector := vector_from_line(testLine);
    AssertEquals(testVector.x, 10.0);
    AssertEquals(testVector.y, 10.0);
end;
procedure TIntegrationTests.TestVectorFromPointToRectIntegration;
begin
    testRect := rectangle_from(0.0, 0.0, 100.0, 100.0);
    testPoint := point_at(50.0, 50.0);
    testVector := vector_from_point_to_rect(testPoint, testRect);
    AssertEquals(vector_magnitude(testVector), 0.0);
end;
procedure TIntegrationTests.TestVectorInRectIntegration;
begin
    testRect := rectangle_from(0.0, 0.0, 100.0, 100.0);
    testVectorInside := vector_to(50.0, 50.0);
    testVectorOutside := vector_to(150.0, 150.0);
    AssertTrue(vector_in_rect(testVectorInside, testRect));
    AssertFalse(vector_in_rect(testVectorOutside, testRect));
end;
procedure TIntegrationTests.TestVectorInvertIntegration;
begin
    testVector := vector_to(3.0, 4.0);
    invertedVector := vector_invert(testVector);
    AssertEquals(vector_to(-3.0, -4.0), invertedVector);
end;
procedure TIntegrationTests.TestVectorLimitIntegration;
begin
    testVector := vector_to(3.0, 4.0);
    limitedVector := vector_limit(testVector, 5.0);
    AssertTrue(vector_magnitude(limitedVector) <= 5.0);
    AssertTrue(vectors_equal(testVector, limitedVector));
end;
procedure TIntegrationTests.TestVectorMagnitudeIntegration;
begin
    testVector := vector_to(3.0, 4.0);
    testMagnitude := vector_magnitude(testVector);
    AssertEquals(testMagnitude, 5.0);
end;
procedure TIntegrationTests.TestVectorMagnitudeSquaredIntegration;
begin
    testVector := vector_to(3.0, 4.0);
    result := vector_magnitude_squared(testVector);
    AssertEquals(result, 25.0);
end;
procedure TIntegrationTests.TestVectorMultiplyIntegration;
begin
    testVector := vector_to(3.0, 4.0);
    resultVector := vector_multiply(testVector, 2.0);
    AssertEquals(vector_magnitude(resultVector), 10.0);
    AssertEquals(vector_angle(resultVector), vector_angle(testVector));
end;
procedure TIntegrationTests.TestVectorNormalIntegration;
begin
    testVector := vector_to(3.0, 4.0);
    normalVector := vector_normal(testVector);
    AssertEquals(vector_magnitude(normalVector), 5.0);
    AssertEquals(vector_angle(normalVector), 53.1301);
end;
procedure TIntegrationTests.TestVectorOutOfCircleFromCircleIntegration;
begin
    testCircleSrc := circle_at(100.0, 100.0, 50.0);
    testCircleBounds := circle_at(150.0, 150.0, 75.0);
    testVelocity := vector_to(10.0, 10.0);
    testResultVector := vector_out_of_circle_from_circle(testCircleSrc, testCircleBounds, testVelocity);
    AssertTrue(vector_magnitude(testResultVector) > 0.0);
    AssertTrue(circles_intersect(circle_at(point_offset_by(center_point(testCircleSrc), testResultVector), circle_radius(testCircleSrc)), testCircleBounds));
end;
procedure TIntegrationTests.TestVectorOutOfCircleFromPointIntegration;
begin
    testPoint := point_at(100.0, 100.0);
    testCircle := circle_at(150.0, 150.0, 50.0);
    testVelocity := vector_to(10.0, 10.0);
    testResult := vector_out_of_circle_from_point(testPoint, testCircle, testVelocity);
    AssertTrue(vector_magnitude(testResult) > 0.0);
end;
procedure TIntegrationTests.TestVectorOutOfRectFromCircleIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    testCircle := circle_at(100.0, 100.0, 50.0);
    testRectangle := rectangle_from(50.0, 50.0, 200.0, 200.0);
    testVelocity := vector_to(10.0, 0.0);
    testResultVector := vector_out_of_rect_from_circle(testCircle, testRectangle, testVelocity);
    AssertNotEquals(vector_magnitude(testResultVector), 0.0);
    close_window(testWindow);
end;
procedure TIntegrationTests.TestVectorOutOfRectFromPointIntegration;
begin
    testPoint := point_at(50.0, 50.0);
    testRectangle := rectangle_from(0.0, 0.0, 100.0, 100.0);
    testVelocity := vector_to(1.0, 1.0);
    resultVector := vector_out_of_rect_from_point(testPoint, testRectangle, testVelocity);
    AssertTrue(point_in_rectangle(point_offset_by(testPoint, resultVector), testRectangle));
end;
procedure TIntegrationTests.TestVectorOutOfRectFromRectIntegration;
begin
    testSrcRect := rectangle_from(50.0, 50.0, 100.0, 100.0);
    testBoundsRect := rectangle_from(0.0, 0.0, 200.0, 200.0);
    testVelocity := vector_to(10.0, 10.0);
    testResultVector := vector_out_of_rect_from_rect(testSrcRect, testBoundsRect, testVelocity);
    AssertNotEquals(vector_magnitude(testResultVector), 0.0);
end;
procedure TIntegrationTests.TestVectorPointToPointIntegration;
begin
    testStartPoint := point_at(0.0, 0.0);
    testEndPoint := point_at(3.0, 4.0);
    testVector := vector_point_to_point(testStartPoint, testEndPoint);
    AssertEquals(vector_to(3.0, 4.0), testVector);
end;
procedure TIntegrationTests.TestVectorSubtractIntegration;
begin
    testVector1 := vector_to(3.0, 4.0);
    testVector2 := vector_to(1.0, 1.0);
    resultVector := vector_subtract(testVector1, testVector2);
    AssertEquals(vector_magnitude(resultVector), 3.0);
    AssertEquals(vector_angle(resultVector), 45.0);
end;
procedure TIntegrationTests.TestVectorToPointIntegration;
begin
    testPoint := point_at(3.0, 4.0);
    testVector := vector_to(testPoint);
    AssertEquals(testVector.x, 3.0);
    AssertEquals(testVector.y, 4.0);
end;
procedure TIntegrationTests.TestVectorToIntegration;
begin
    testVector := vector_to(3.0, 4.0);
    AssertEquals(vector_magnitude(testVector), 5.0);
    AssertEquals(vector_angle(testVector), 53.1301);
end;
procedure TIntegrationTests.TestVectorToStringIntegration;
begin
    testVector := vector_to(3.0, 4.0);
    testString := vector_to_string(testVector);
    AssertEquals(testString, "Vector(3.0, 4.0)");
end;
procedure TIntegrationTests.TestVectorsEqualIntegration;
begin
    testVector1 := vector_to(1.0, 1.0);
    testVector2 := vector_to(1.0, 1.0);
    AssertTrue(vectors_equal(testVector1, testVector2));
    testVector3 := vector_to(1.0, 2.0);
    AssertFalse(vectors_equal(testVector1, testVector3));
end;
procedure TIntegrationTests.TestVectorsNotEqualIntegration;
begin
    testVector1 := vector_to(1.0, 1.0);
    testVector2 := vector_to(1.0, 1.0);
    AssertFalse(vectors_not_equal(testVector1, testVector2));
    testVector3 := vector_to(1.0, 2.0);
    AssertTrue(vectors_not_equal(testVector1, testVector3));
end;
end;

procedure RegisterTests;
begin
TestFramework.RegisterTest(TIntegrationTests.Suite);
end;
