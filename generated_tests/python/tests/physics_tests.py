import pytest
from splashkit import *


def test_BitmapCircleCollisionAtPoint_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_bitmap = CreateBitmap("test_bitmap", 100, 100)
    test_circle = CircleAt(150.0, 150.0, 50.0)
    test_point = PointAt(100.0, 100.0)
    assert BitmapCircleCollisionAtPoint(test_bitmap, test_point, test_circle) is True
    FreeBitmap(test_bitmap)
    CloseWindow(test_window)


def test_BitmapCircleCollision_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_bitmap = CreateBitmap("test_bitmap", 100, 100)
    test_circle = CircleAt(150.0, 150.0, 50.0)
    collision_result = BitmapCircleCollision(test_bitmap, 100.0, 100.0, test_circle)
    assert collision_result is True
    FreeBitmap(test_bitmap)
    CloseWindow(test_window)


def test_BitmapCircleCollisionForCellWithTranslation_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_bitmap = CreateBitmap("test_bitmap", 100, 100)
    ClearBitmap(test_bitmap, ColorBlack())
    test_circle = CircleAt(150.0, 150.0, 50.0)
    test_translation = TranslationMatrix(100.0, 100.0)
    collision_result = BitmapCircleCollisionForCellWithTranslation(test_bitmap, 0, test_translation, test_circle)
    assert collision_result is True
    FreeBitmap(test_bitmap)
    CloseWindow(test_window)


def test_BitmapCircleCollisionForCellAtPoint_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_bitmap = CreateBitmap("test_bitmap", 100, 100)
    test_circle = CircleAt(150.0, 150.0, 50.0)
    test_point = PointAt(100.0, 100.0)
    assert BitmapCircleCollisionForCellAtPoint(test_bitmap, 0, test_point, test_circle) is True
    FreeBitmap(test_bitmap)
    CloseWindow(test_window)


def test_BitmapCircleCollisionForCell_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_bitmap = CreateBitmap("test_bitmap", 100, 100)
    test_circle = CircleAt(150.0, 150.0, 50.0)
    collision_result = BitmapCircleCollisionForCell(test_bitmap, 0, 100.0, 100.0, test_circle)
    assert collision_result is True
    FreeBitmap(test_bitmap)
    CloseWindow(test_window)


def test_BitmapCollision_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_bitmap1 = CreateBitmap("test_bitmap1", 100, 100)
    test_bitmap2 = CreateBitmap("test_bitmap2", 100, 100)
    collision_result = BitmapCollision(test_bitmap1, 0, 0, test_bitmap2, 50, 50)
    assert collision_result is True
    collision_result = BitmapCollision(test_bitmap1, 0, 0, test_bitmap2, 200, 200)
    assert collision_result is False
    FreeAllBitmaps()
    CloseWindow(test_window)


def test_BitmapCollisionAtPoints_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_bitmap1 = CreateBitmap("test_bitmap1", 100, 100)
    test_bitmap2 = CreateBitmap("test_bitmap2", 100, 100)
    test_point1 = PointAt(0, 0)
    test_point2 = PointAt(50, 50)
    collision_result = BitmapCollisionAtPoints(test_bitmap1, test_point1, test_bitmap2, test_point2)
    assert collision_result is True
    FreeAllBitmaps()
    CloseWindow(test_window)


def test_BitmapCollisionForCellsWithTranslations_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_bitmap1 = CreateBitmap("test_bitmap1", 100, 100)
    test_bitmap2 = CreateBitmap("test_bitmap2", 100, 100)
    SetupCollisionMask(test_bitmap1)
    SetupCollisionMask(test_bitmap2)
    matrix1 = TranslationMatrix(0, 0)
    matrix2 = TranslationMatrix(50, 50)
    collision_result = BitmapCollisionForCellsWithTranslations(test_bitmap1, 0, matrix1, test_bitmap2, 0, matrix2)
    assert collision_result is True
    FreeBitmap(test_bitmap1)
    FreeBitmap(test_bitmap2)
    CloseWindow(test_window)


def test_BitmapCollisionForCellsAtPoints_integration():
    test_window = OpenWindow("Collision Test", 800, 600)
    test_bitmap1 = CreateBitmap("test_bitmap1", 50, 50)
    test_bitmap2 = CreateBitmap("test_bitmap2", 50, 50)
    test_point1 = PointAt(100.0, 100.0)
    test_point2 = PointAt(125.0, 125.0)
    collision_result = BitmapCollisionForCellsAtPoints(test_bitmap1, 0, test_point1, test_bitmap2, 0, test_point2)
    assert collision_result is True
    FreeAllBitmaps()
    CloseWindow(test_window)


def test_BitmapCollisionForCells_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_bitmap1 = CreateBitmap("test_bitmap1", 100, 100)
    test_bitmap2 = CreateBitmap("test_bitmap2", 100, 100)
    collision_result = BitmapCollisionForCells(test_bitmap1, 0, 100.0, 100.0, test_bitmap2, 0, 150.0, 100.0)
    assert collision_result is False
    collision_result = BitmapCollisionForCells(test_bitmap1, 0, 100.0, 100.0, test_bitmap2, 0, 100.0, 100.0)
    assert collision_result is True
    FreeAllBitmaps()
    CloseWindow(test_window)


def test_BitmapPointCollisionWithTranslation_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_bitmap = CreateBitmap("test_bitmap", 100, 100)
    ClearBitmap(test_bitmap, ColorBlack())
    test_translation = TranslationMatrix(100, 100)
    test_point = PointAt(150, 150)
    collision_result = BitmapPointCollisionWithTranslation(test_bitmap, test_translation, test_point)
    assert collision_result is True
    FreeBitmap(test_bitmap)
    CloseWindow(test_window)


def test_BitmapPointCollisionAtPoint_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_bitmap = CreateBitmap("test_bitmap", 100, 100)
    test_bmp_pt = PointAt(50, 50)
    test_pt = PointAt(50, 50)
    collision_result = BitmapPointCollisionAtPoint(test_bitmap, test_bmp_pt, test_pt)
    assert collision_result is True
    FreeBitmap(test_bitmap)
    CloseWindow(test_window)


def test_BitmapPointCollision_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_bitmap = CreateBitmap("test_bitmap", 100, 100)
    ClearBitmap(test_bitmap, ColorBlack())
    collision_result = BitmapPointCollision(test_bitmap, 0.0, 0.0, 50.0, 50.0)
    assert collision_result is True
    collision_result = BitmapPointCollision(test_bitmap, 0.0, 0.0, 150.0, 150.0)
    assert collision_result is False
    FreeBitmap(test_bitmap)
    CloseWindow(test_window)


def test_BitmapPointCollisionForCellWithTranslation_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_bitmap = CreateBitmap("test_bitmap", 100, 100)
    test_translation = TranslationMatrix(100.0, 100.0)
    test_point = PointAt(150.0, 150.0)
    collision_result = BitmapPointCollisionForCellWithTranslation(test_bitmap, 0, test_translation, test_point)
    assert collision_result is True
    FreeBitmap(test_bitmap)
    CloseWindow(test_window)


def test_BitmapPointCollisionForCellAtPoint_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_bitmap = CreateBitmap("test_bitmap", 100, 100)
    test_point = PointAt(100, 100)
    collision_result = BitmapPointCollisionForCellAtPoint(test_bitmap, 0, test_point, test_point)
    assert collision_result is True
    FreeBitmap(test_bitmap)
    CloseWindow(test_window)


def test_BitmapPointCollisionForCell_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_bitmap = CreateBitmap("test_bitmap", 100, 100)
    collision_result = BitmapPointCollisionForCell(test_bitmap, 0, 100.0, 100.0, 100.0, 100.0)
    assert collision_result is True
    FreeBitmap(test_bitmap)
    CloseWindow(test_window)


def test_BitmapRectangleCollisionAtPoint_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_bitmap = CreateBitmap("test_bitmap", 100, 100)
    test_rectangle = RectangleFrom(50.0, 50.0, 100.0, 100.0)
    test_point = PointAt(100.0, 100.0)
    collision_result = BitmapRectangleCollisionAtPoint(test_bitmap, test_point, test_rectangle)
    assert collision_result is True
    FreeBitmap(test_bitmap)
    CloseWindow(test_window)


def test_BitmapRectangleCollision_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_bitmap = CreateBitmap("test_bitmap", 100, 100)
    test_rectangle = RectangleFrom(50.0, 50.0, 100.0, 100.0)
    collision_result = BitmapRectangleCollision(test_bitmap, 0.0, 0.0, test_rectangle)
    assert collision_result is True
    FreeBitmap(test_bitmap)
    CloseWindow(test_window)


def test_BitmapRectangleCollisionForCellWithTranslation_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_bitmap = CreateBitmap("test_bitmap", 100, 100)
    test_rectangle = RectangleFrom(150.0, 150.0, 50.0, 50.0)
    test_translation = TranslationMatrix(100.0, 100.0)
    assert BitmapRectangleCollisionForCellWithTranslation(test_bitmap, 0, test_translation, test_rectangle) is True
    FreeBitmap(test_bitmap)
    CloseWindow(test_window)


def test_BitmapRectangleCollisionForCellAtPoint_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_bitmap = CreateBitmap("test_bitmap", 100, 100)
    test_rectangle = RectangleFrom(100.0, 100.0, 50.0, 50.0)
    test_point = PointAt(100.0, 100.0)
    collision_result = BitmapRectangleCollisionForCellAtPoint(test_bitmap, 0, test_point, test_rectangle)
    assert collision_result is True
    FreeBitmap(test_bitmap)
    CloseWindow(test_window)


def test_BitmapRectangleCollisionForCell_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_bitmap = CreateBitmap("test_bitmap", 100, 100)
    test_rectangle = RectangleFrom(50.0, 50.0, 100.0, 100.0)
    collision_result = BitmapRectangleCollisionForCell(test_bitmap, 0, 50.0, 50.0, test_rectangle)
    assert collision_result is True
    FreeBitmap(test_bitmap)
    CloseWindow(test_window)


def test_SpriteBitmapCollision_integration():
    test_window = OpenWindow("Collision Test", 800, 600)
    test_bitmap = CreateBitmap("test_bitmap", 100, 100)
    test_sprite = CreateSprite(test_bitmap)
    collision_result = SpriteBitmapCollision(test_sprite, test_bitmap, 100.0, 100.0)
    assert collision_result is True
    collision_result = SpriteBitmapCollision(test_sprite, test_bitmap, 200.0, 200.0)
    assert collision_result is False
    FreeAllSprites()
    FreeAllBitmaps()
    CloseWindow(test_window)


def test_SpriteBitmapCollisionWithCellAtPoint_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_bitmap = CreateBitmap("test_bitmap", 100, 100)
    test_sprite = CreateSprite(test_bitmap)
    collision_result = SpriteBitmapCollisionWithCellAtPoint(test_sprite, test_bitmap, 0, PointAt(50, 50))
    assert collision_result is True
    FreeAllSprites()
    FreeBitmap(test_bitmap)
    CloseWindow(test_window)


def test_SpriteBitmapCollisionWithCell_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_bitmap = CreateBitmap("test_bitmap", 100, 100)
    test_sprite = CreateSprite(test_bitmap)
    collision_result = SpriteBitmapCollisionWithCell(test_sprite, test_bitmap, 0, 50.0, 50.0)
    assert collision_result is True
    FreeAllSprites()
    FreeAllBitmaps()
    CloseWindow(test_window)


def test_SpriteCollision_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_bitmap_1 = CreateBitmap("test_bitmap_1", 50, 50)
    test_bitmap_2 = CreateBitmap("test_bitmap_2", 50, 50)
    test_sprite_1 = CreateSprite(test_bitmap_1)
    test_sprite_2 = CreateSprite(test_bitmap_2)
    SpriteSetPosition(test_sprite_1, PointAt(100, 100))
    SpriteSetPosition(test_sprite_2, PointAt(150, 150))
    assert SpriteCollision(test_sprite_1, test_sprite_2) is True
    SpriteSetPosition(test_sprite_2, PointAt(200, 200))
    assert SpriteCollision(test_sprite_1, test_sprite_2) is False
    FreeAllSprites()
    FreeAllBitmaps()
    CloseWindow(test_window)


def test_SpritePointCollision_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_bitmap = CreateBitmap("test_bitmap", 100, 100)
    test_sprite = CreateSprite(test_bitmap)
    collision_result = SpritePointCollision(test_sprite, PointAt(50, 50))
    assert collision_result is True
    collision_result = SpritePointCollision(test_sprite, PointAt(200, 200))
    assert collision_result is False
    FreeAllSprites()
    FreeBitmap(test_bitmap)
    CloseWindow(test_window)


def test_SpriteRectangleCollision_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_bitmap = CreateBitmap("test_bitmap", 100, 100)
    test_sprite = CreateSprite(test_bitmap)
    test_rectangle = RectangleFrom(50.0, 50.0, 150.0, 150.0)
    collision_result = SpriteRectangleCollision(test_sprite, test_rectangle)
    assert collision_result is True
    FreeAllSprites()
    FreeBitmap(test_bitmap)
    CloseWindow(test_window)


def test_ApplyMatrixToQuad_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_matrix = IdentityMatrix()
    test_quad = QuadFrom(PointAt(100, 100), PointAt(200, 100), PointAt(200, 200), PointAt(100, 200))
    ApplyMatrixToQuad(test_matrix, test_quad)
    assert PointAt(100, 100) == quad_point
    CloseWindow(test_window)


def test_ApplyMatrixToTriangle_integration():
    test_triangle = TriangleFrom(PointAt(0.0, 0.0), PointAt(1.0, 0.0), PointAt(0.0, 1.0))
    test_matrix = TranslationMatrix(1.0, 1.0)
    ApplyMatrixToTriangle(test_matrix, test_triangle)
    assert TriangleToString(test_triangle) == "Triangle(x1: 1.0, y1: 1.0, x2: 2.0, y2: 1.0, x3: 1.0, y3: 2.0)"


def test_IdentityMatrix_integration():
    test_matrix = IdentityMatrix()
    assert test_matrix[0, 0] == 1.0
    assert test_matrix[1, 1] == 1.0
    assert test_matrix[0, 1] == 0.0
    assert test_matrix[1, 0] == 0.0


def test_MatrixInverse_integration():
    test_matrix = IdentityMatrix()
    inverse_matrix = MatrixInverse(test_matrix)
    result_matrix = MatrixMultiplyMatrix(test_matrix, inverse_matrix)
    assert VectorsEqual(VectorTo(1.0, 0.0), MatrixMultiplyPoint(result_matrix, VectorTo(1.0, 0.0))) is True


def test_MatrixMultiplyPoint_integration():
    test_matrix = IdentityMatrix()
    test_point = PointAt(10.0, 20.0)
    result_point = MatrixMultiplyPoint(test_matrix, test_point)
    assert result_point.x == 10.0
    assert result_point.y == 20.0


def test_MatrixMultiplyMatrix_integration():
    test_matrix1 = IdentityMatrix()
    test_matrix2 = RotationMatrix(45)
    result_matrix = MatrixMultiplyMatrix(test_matrix1, test_matrix2)
    assert result_matrix[0, 0] == Cosine(45)
    assert result_matrix[0, 1] == Sine(45)


def test_MatrixMultiplyVector_integration():
    test_vector = VectorTo(1.0, 1.0)
    test_matrix = ScaleMatrix(2.0)
    result_vector = MatrixMultiplyVector(test_matrix, test_vector)
    assert result_vector.x == 2.0
    assert result_vector.y == 2.0


def test_MatrixToString_integration():
    test_matrix = IdentityMatrix()
    test_matrix_string = MatrixToString(test_matrix)
    assert test_matrix_string == "[1, 0, 0, 1, 0, 0]"


def test_RotationMatrix_integration():
    test_matrix = RotationMatrix(45.0)
    test_vector = VectorTo(1.0, 0.0)
    result_vector = MatrixMultiplyVector(test_matrix, test_vector)
    assert 0.99 <= VectorMagnitude(result_vector) <= 1.01
    assert 44.0 <= VectorAngle(result_vector) <= 46.0


def test_ScaleMatrixFromPoint_integration():
    test_scale = PointAt(2.0, 3.0)
    test_matrix = ScaleMatrixFromPoint(test_scale)
    test_vector = VectorTo(1.0, 1.0)
    result_vector = MatrixMultiplyVector(test_matrix, test_vector)
    assert result_vector.x == 2.0
    assert result_vector.y == 3.0


def test_ScaleMatrixFromVector_integration():
    test_scale_vector = VectorTo(2.0, 3.0)
    test_matrix = ScaleMatrixFromVector(test_scale_vector)
    test_vector = VectorTo(1.0, 1.0)
    result_vector = MatrixMultiplyVector(test_matrix, test_vector)
    assert result_vector.x == 2.0
    assert result_vector.y == 3.0


def test_ScaleMatrix_integration():
    test_matrix = ScaleMatrix(2.0)
    test_vector = VectorTo(1.0, 1.0)
    result_vector = MatrixMultiplyVector(test_matrix, test_vector)
    assert result_vector.x == 2.0
    assert result_vector.y == 2.0


def test_ScaleRotateTranslateMatrix_integration():
    test_scale = PointAt(2.0, 3.0)
    test_translate = PointAt(10.0, 20.0)
    test_matrix = ScaleRotateTranslateMatrix(test_scale, 45.0, test_translate)
    test_point = PointAt(1.0, 1.0)
    result_point = MatrixMultiplyPoint(test_matrix, test_point)
    assert 10.0 <= result_point.x <= 10.1
    assert 23.0 <= result_point.y <= 23.1


def test_TranslationMatrixToPoint_integration():
    test_point = PointAt(10.0, 20.0)
    test_matrix = TranslationMatrixToPoint(test_point)
    test_vector = PointAt(5.0, 5.0)
    result_point = MatrixMultiplyVector(test_matrix, test_vector)
    assert result_point.x == 15.0
    assert result_point.y == 25.0


def test_TranslationMatrixFromVector_integration():
    test_vector = VectorTo(10.0, 20.0)
    test_matrix = TranslationMatrixFromVector(test_vector)
    test_point = PointAt(0.0, 0.0)
    result_point = MatrixMultiplyPoint(test_matrix, test_point)
    assert result_point.x == 10.0
    assert result_point.y == 20.0


def test_TranslationMatrix_integration():
    test_matrix = TranslationMatrix(10.0, 20.0)
    test_point = PointAt(0.0, 0.0)
    result_point = MatrixMultiplyPoint(test_matrix, test_point)
    assert result_point.x == 10.0
    assert result_point.y == 20.0


def test_AngleBetween_integration():
    test_vector1 = VectorTo(1.0, 0.0)
    test_vector2 = VectorTo(0.0, 1.0)
    test_angle = AngleBetween(test_vector1, test_vector2)
    assert 89.9 <= test_angle <= 90.1


def test_DotProduct_integration():
    test_vector1 = VectorTo(3.0, 4.0)
    test_vector2 = VectorTo(1.0, 2.0)
    test_result = DotProduct(test_vector1, test_vector2)
    assert test_result == 11.0


def test_IsZeroVector_integration():
    test_zero_vector = VectorTo(0.0, 0.0)
    test_non_zero_vector = VectorTo(1.0, 1.0)
    assert IsZeroVector(test_zero_vector) is True
    assert IsZeroVector(test_non_zero_vector) is False


def test_RayIntersectionPoint_integration():
    test_from_pt = PointAt(0.0, 0.0)
    test_heading = VectorTo(1.0, 1.0)
    test_line = LineFrom(PointAt(0.0, 2.0), PointAt(2.0, 0.0))
    intersection_result = RayIntersectionPoint(test_from_pt, test_heading, test_line, PointAt(0.0, 0.0))
    assert intersection_result is True


def test_UnitVector_integration():
    test_vector = VectorTo(3.0, 4.0)
    test_unit_vector = UnitVector(test_vector)
    assert VectorMagnitude(test_unit_vector) == 1.0
    assert VectorAngle(test_unit_vector) == VectorAngle(test_vector)


def test_VectorAdd_integration():
    test_vector1 = VectorTo(1.0, 2.0)
    test_vector2 = VectorTo(3.0, 4.0)
    result_vector = VectorAdd(test_vector1, test_vector2)
    assert result_vector.x == 4.0
    assert result_vector.y == 6.0


def test_VectorAngle_integration():
    test_vector = VectorTo(1.0, 1.0)
    test_angle = VectorAngle(test_vector)
    assert 45.0 <= test_angle <= 45.001


def test_VectorFromAngle_integration():
    test_vector = VectorFromAngle(45.0, 1.0)
    assert 0.99 <= VectorMagnitude(test_vector) <= 1.01
    assert 44.0 <= VectorAngle(test_vector) <= 46.0


def test_VectorFromLine_integration():
    test_line = LineFrom(PointAt(0.0, 0.0), PointAt(10.0, 10.0))
    test_vector = VectorFromLine(test_line)
    assert test_vector.x == 10.0
    assert test_vector.y == 10.0


def test_VectorFromPointToRect_integration():
    test_rect = RectangleFrom(0.0, 0.0, 100.0, 100.0)
    test_point = PointAt(50.0, 50.0)
    test_vector = VectorFromPointToRect(test_point, test_rect)
    assert VectorMagnitude(test_vector) == 0.0


def test_VectorInRect_integration():
    test_rect = RectangleFrom(0.0, 0.0, 100.0, 100.0)
    test_vector_inside = VectorTo(50.0, 50.0)
    test_vector_outside = VectorTo(150.0, 150.0)
    assert VectorInRect(test_vector_inside, test_rect) is True
    assert VectorInRect(test_vector_outside, test_rect) is False


def test_VectorInvert_integration():
    test_vector = VectorTo(3.0, 4.0)
    inverted_vector = VectorInvert(test_vector)
    assert VectorTo(-3.0, -4.0) == inverted_vector


def test_VectorLimit_integration():
    test_vector = VectorTo(3.0, 4.0)
    limited_vector = VectorLimit(test_vector, 5.0)
    assert VectorMagnitude(limited_vector) <= 5.0
    assert VectorsEqual(test_vector, limited_vector) is True


def test_VectorMagnitude_integration():
    test_vector = VectorTo(3.0, 4.0)
    test_magnitude = VectorMagnitude(test_vector)
    assert test_magnitude == 5.0


def test_VectorMagnitudeSquared_integration():
    test_vector = VectorTo(3.0, 4.0)
    result = VectorMagnitudeSquared(test_vector)
    assert result == 25.0


def test_VectorMultiply_integration():
    test_vector = VectorTo(3.0, 4.0)
    result_vector = VectorMultiply(test_vector, 2.0)
    assert VectorMagnitude(result_vector) == 10.0
    assert VectorAngle(result_vector) == VectorAngle(test_vector)


def test_VectorNormal_integration():
    test_vector = VectorTo(3.0, 4.0)
    normal_vector = VectorNormal(test_vector)
    assert VectorMagnitude(normal_vector) == 5.0
    assert VectorAngle(normal_vector) == 53.1301


def test_VectorOutOfCircleFromCircle_integration():
    test_circle_src = CircleAt(100.0, 100.0, 50.0)
    test_circle_bounds = CircleAt(150.0, 150.0, 75.0)
    test_velocity = VectorTo(10.0, 10.0)
    test_result_vector = VectorOutOfCircleFromCircle(test_circle_src, test_circle_bounds, test_velocity)
    assert VectorMagnitude(test_result_vector) > 0.0
    assert CirclesIntersect(CircleAt(PointOffsetBy(CenterPoint(test_circle_src), test_result_vector), CircleRadius(test_circle_src)), test_circle_bounds) is True


def test_VectorOutOfCircleFromPoint_integration():
    test_point = PointAt(100.0, 100.0)
    test_circle = CircleAt(150.0, 150.0, 50.0)
    test_velocity = VectorTo(10.0, 10.0)
    test_result = VectorOutOfCircleFromPoint(test_point, test_circle, test_velocity)
    assert VectorMagnitude(test_result) > 0.0


def test_VectorOutOfRectFromCircle_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_circle = CircleAt(100.0, 100.0, 50.0)
    test_rectangle = RectangleFrom(50.0, 50.0, 200.0, 200.0)
    test_velocity = VectorTo(10.0, 0.0)
    test_result_vector = VectorOutOfRectFromCircle(test_circle, test_rectangle, test_velocity)
    assert VectorMagnitude(test_result_vector) != 0.0
    CloseWindow(test_window)


def test_VectorOutOfRectFromPoint_integration():
    test_point = PointAt(50.0, 50.0)
    test_rectangle = RectangleFrom(0.0, 0.0, 100.0, 100.0)
    test_velocity = VectorTo(1.0, 1.0)
    result_vector = VectorOutOfRectFromPoint(test_point, test_rectangle, test_velocity)
    assert PointInRectangle(PointOffsetBy(test_point, result_vector), test_rectangle) is True


def test_VectorOutOfRectFromRect_integration():
    test_src_rect = RectangleFrom(50.0, 50.0, 100.0, 100.0)
    test_bounds_rect = RectangleFrom(0.0, 0.0, 200.0, 200.0)
    test_velocity = VectorTo(10.0, 10.0)
    test_result_vector = VectorOutOfRectFromRect(test_src_rect, test_bounds_rect, test_velocity)
    assert VectorMagnitude(test_result_vector) != 0.0


def test_VectorPointToPoint_integration():
    test_start_point = PointAt(0.0, 0.0)
    test_end_point = PointAt(3.0, 4.0)
    test_vector = VectorPointToPoint(test_start_point, test_end_point)
    assert VectorTo(3.0, 4.0) == test_vector


def test_VectorSubtract_integration():
    test_vector1 = VectorTo(3.0, 4.0)
    test_vector2 = VectorTo(1.0, 1.0)
    result_vector = VectorSubtract(test_vector1, test_vector2)
    assert VectorMagnitude(result_vector) == 3.0
    assert VectorAngle(result_vector) == 45.0


def test_VectorToPoint_integration():
    test_point = PointAt(3.0, 4.0)
    test_vector = VectorToPoint(test_point)
    assert test_vector.x == 3.0
    assert test_vector.y == 4.0


def test_VectorTo_integration():
    test_vector = VectorTo(3.0, 4.0)
    assert VectorMagnitude(test_vector) == 5.0
    assert VectorAngle(test_vector) == 53.1301


def test_VectorToString_integration():
    test_vector = VectorTo(3.0, 4.0)
    test_string = VectorToString(test_vector)
    assert test_string == "Vector(3.0, 4.0)"


def test_VectorsEqual_integration():
    test_vector1 = VectorTo(1.0, 1.0)
    test_vector2 = VectorTo(1.0, 1.0)
    assert VectorsEqual(test_vector1, test_vector2) is True
    test_vector3 = VectorTo(1.0, 2.0)
    assert VectorsEqual(test_vector1, test_vector3) is False


def test_VectorsNotEqual_integration():
    test_vector1 = VectorTo(1.0, 1.0)
    test_vector2 = VectorTo(1.0, 1.0)
    assert VectorsNotEqual(test_vector1, test_vector2) is False
    test_vector3 = VectorTo(1.0, 2.0)
    assert VectorsNotEqual(test_vector1, test_vector3) is True

