import pytest
from splashkit import *


def test_BitmapCircleCollisionAtPoint_integration():
    test_window = open_window("Test Window", 800, 600)
    test_bitmap = create_bitmap("test_bitmap", 100, 100)
    test_circle = circle_at(150.0, 150.0, 50.0)
    test_point = point_at(100.0, 100.0)
    assert bitmap_circle_collision_at_point(test_bitmap, test_point, test_circle) is True
    free_bitmap(test_bitmap)
    close_window(test_window)


def test_BitmapCircleCollision_integration():
    test_window = open_window("Test Window", 800, 600)
    test_bitmap = create_bitmap("test_bitmap", 100, 100)
    test_circle = circle_at(150.0, 150.0, 50.0)
    collision_result = bitmap_circle_collision(test_bitmap, 100.0, 100.0, test_circle)
    assert collision_result is True
    free_bitmap(test_bitmap)
    close_window(test_window)


def test_BitmapCircleCollisionForCellWithTranslation_integration():
    test_window = open_window("Test Window", 800, 600)
    test_bitmap = create_bitmap("test_bitmap", 100, 100)
    clear_bitmap(test_bitmap, color_black())
    test_circle = circle_at(150.0, 150.0, 50.0)
    test_translation = translation_matrix(100.0, 100.0)
    collision_result = bitmap_circle_collision_for_cell_with_translation(test_bitmap, 0, test_translation, test_circle)
    assert collision_result is True
    free_bitmap(test_bitmap)
    close_window(test_window)


def test_BitmapCircleCollisionForCellAtPoint_integration():
    test_window = open_window("Test Window", 800, 600)
    test_bitmap = create_bitmap("test_bitmap", 100, 100)
    test_circle = circle_at(150.0, 150.0, 50.0)
    test_point = point_at(100.0, 100.0)
    assert bitmap_circle_collision_for_cell_at_point(test_bitmap, 0, test_point, test_circle) is True
    free_bitmap(test_bitmap)
    close_window(test_window)


def test_BitmapCircleCollisionForCell_integration():
    test_window = open_window("Test Window", 800, 600)
    test_bitmap = create_bitmap("test_bitmap", 100, 100)
    test_circle = circle_at(150.0, 150.0, 50.0)
    collision_result = bitmap_circle_collision_for_cell(test_bitmap, 0, 100.0, 100.0, test_circle)
    assert collision_result is True
    free_bitmap(test_bitmap)
    close_window(test_window)


def test_BitmapCollision_integration():
    test_window = open_window("Test Window", 800, 600)
    test_bitmap1 = create_bitmap("test_bitmap1", 100, 100)
    test_bitmap2 = create_bitmap("test_bitmap2", 100, 100)
    collision_result = bitmap_collision(test_bitmap1, 0, 0, test_bitmap2, 50, 50)
    assert collision_result is True
    collision_result = bitmap_collision(test_bitmap1, 0, 0, test_bitmap2, 200, 200)
    assert collision_result is False
    free_all_bitmaps()
    close_window(test_window)


def test_BitmapCollisionAtPoints_integration():
    test_window = open_window("Test Window", 800, 600)
    test_bitmap1 = create_bitmap("test_bitmap1", 100, 100)
    test_bitmap2 = create_bitmap("test_bitmap2", 100, 100)
    test_point1 = point_at(0, 0)
    test_point2 = point_at(50, 50)
    collision_result = bitmap_collision_at_points(test_bitmap1, test_point1, test_bitmap2, test_point2)
    assert collision_result is True
    free_all_bitmaps()
    close_window(test_window)


def test_BitmapCollisionForCellsWithTranslations_integration():
    test_window = open_window("Test Window", 800, 600)
    test_bitmap1 = create_bitmap("test_bitmap1", 100, 100)
    test_bitmap2 = create_bitmap("test_bitmap2", 100, 100)
    setup_collision_mask(test_bitmap1)
    setup_collision_mask(test_bitmap2)
    matrix1 = translation_matrix(0, 0)
    matrix2 = translation_matrix(50, 50)
    collision_result = bitmap_collision_for_cells_with_translations(test_bitmap1, 0, matrix1, test_bitmap2, 0, matrix2)
    assert collision_result is True
    free_bitmap(test_bitmap1)
    free_bitmap(test_bitmap2)
    close_window(test_window)


def test_BitmapCollisionForCellsAtPoints_integration():
    test_window = open_window("Collision Test", 800, 600)
    test_bitmap1 = create_bitmap("test_bitmap1", 50, 50)
    test_bitmap2 = create_bitmap("test_bitmap2", 50, 50)
    test_point1 = point_at(100.0, 100.0)
    test_point2 = point_at(125.0, 125.0)
    collision_result = bitmap_collision_for_cells_at_points(test_bitmap1, 0, test_point1, test_bitmap2, 0, test_point2)
    assert collision_result is True
    free_all_bitmaps()
    close_window(test_window)


def test_BitmapCollisionForCells_integration():
    test_window = open_window("Test Window", 800, 600)
    test_bitmap1 = create_bitmap("test_bitmap1", 100, 100)
    test_bitmap2 = create_bitmap("test_bitmap2", 100, 100)
    collision_result = bitmap_collision_for_cells(test_bitmap1, 0, 100.0, 100.0, test_bitmap2, 0, 150.0, 100.0)
    assert collision_result is False
    collision_result = bitmap_collision_for_cells(test_bitmap1, 0, 100.0, 100.0, test_bitmap2, 0, 100.0, 100.0)
    assert collision_result is True
    free_all_bitmaps()
    close_window(test_window)


def test_BitmapPointCollisionWithTranslation_integration():
    test_window = open_window("Test Window", 800, 600)
    test_bitmap = create_bitmap("test_bitmap", 100, 100)
    clear_bitmap(test_bitmap, color_black())
    test_translation = translation_matrix(100, 100)
    test_point = point_at(150, 150)
    collision_result = bitmap_point_collision_with_translation(test_bitmap, test_translation, test_point)
    assert collision_result is True
    free_bitmap(test_bitmap)
    close_window(test_window)


def test_BitmapPointCollisionAtPoint_integration():
    test_window = open_window("Test Window", 800, 600)
    test_bitmap = create_bitmap("test_bitmap", 100, 100)
    test_bmp_pt = point_at(50, 50)
    test_pt = point_at(50, 50)
    collision_result = bitmap_point_collision_at_point(test_bitmap, test_bmp_pt, test_pt)
    assert collision_result is True
    free_bitmap(test_bitmap)
    close_window(test_window)


def test_BitmapPointCollision_integration():
    test_window = open_window("Test Window", 800, 600)
    test_bitmap = create_bitmap("test_bitmap", 100, 100)
    clear_bitmap(test_bitmap, color_black())
    collision_result = bitmap_point_collision(test_bitmap, 0.0, 0.0, 50.0, 50.0)
    assert collision_result is True
    collision_result = bitmap_point_collision(test_bitmap, 0.0, 0.0, 150.0, 150.0)
    assert collision_result is False
    free_bitmap(test_bitmap)
    close_window(test_window)


def test_BitmapPointCollisionForCellWithTranslation_integration():
    test_window = open_window("Test Window", 800, 600)
    test_bitmap = create_bitmap("test_bitmap", 100, 100)
    test_translation = translation_matrix(100.0, 100.0)
    test_point = point_at(150.0, 150.0)
    collision_result = bitmap_point_collision_for_cell_with_translation(test_bitmap, 0, test_translation, test_point)
    assert collision_result is True
    free_bitmap(test_bitmap)
    close_window(test_window)


def test_BitmapPointCollisionForCellAtPoint_integration():
    test_window = open_window("Test Window", 800, 600)
    test_bitmap = create_bitmap("test_bitmap", 100, 100)
    test_point = point_at(100, 100)
    collision_result = bitmap_point_collision_for_cell_at_point(test_bitmap, 0, test_point, test_point)
    assert collision_result is True
    free_bitmap(test_bitmap)
    close_window(test_window)


def test_BitmapPointCollisionForCell_integration():
    test_window = open_window("Test Window", 800, 600)
    test_bitmap = create_bitmap("test_bitmap", 100, 100)
    collision_result = bitmap_point_collision_for_cell(test_bitmap, 0, 100.0, 100.0, 100.0, 100.0)
    assert collision_result is True
    free_bitmap(test_bitmap)
    close_window(test_window)


def test_BitmapRectangleCollisionAtPoint_integration():
    test_window = open_window("Test Window", 800, 600)
    test_bitmap = create_bitmap("test_bitmap", 100, 100)
    test_rectangle = rectangle_from(50.0, 50.0, 100.0, 100.0)
    test_point = point_at(100.0, 100.0)
    collision_result = bitmap_rectangle_collision_at_point(test_bitmap, test_point, test_rectangle)
    assert collision_result is True
    free_bitmap(test_bitmap)
    close_window(test_window)


def test_BitmapRectangleCollision_integration():
    test_window = open_window("Test Window", 800, 600)
    test_bitmap = create_bitmap("test_bitmap", 100, 100)
    test_rectangle = rectangle_from(50.0, 50.0, 100.0, 100.0)
    collision_result = bitmap_rectangle_collision(test_bitmap, 0.0, 0.0, test_rectangle)
    assert collision_result is True
    free_bitmap(test_bitmap)
    close_window(test_window)


def test_BitmapRectangleCollisionForCellWithTranslation_integration():
    test_window = open_window("Test Window", 800, 600)
    test_bitmap = create_bitmap("test_bitmap", 100, 100)
    test_rectangle = rectangle_from(150.0, 150.0, 50.0, 50.0)
    test_translation = translation_matrix(100.0, 100.0)
    assert bitmap_rectangle_collision_for_cell_with_translation(test_bitmap, 0, test_translation, test_rectangle) is True
    free_bitmap(test_bitmap)
    close_window(test_window)


def test_BitmapRectangleCollisionForCellAtPoint_integration():
    test_window = open_window("Test Window", 800, 600)
    test_bitmap = create_bitmap("test_bitmap", 100, 100)
    test_rectangle = rectangle_from(100.0, 100.0, 50.0, 50.0)
    test_point = point_at(100.0, 100.0)
    collision_result = bitmap_rectangle_collision_for_cell_at_point(test_bitmap, 0, test_point, test_rectangle)
    assert collision_result is True
    free_bitmap(test_bitmap)
    close_window(test_window)


def test_BitmapRectangleCollisionForCell_integration():
    test_window = open_window("Test Window", 800, 600)
    test_bitmap = create_bitmap("test_bitmap", 100, 100)
    test_rectangle = rectangle_from(50.0, 50.0, 100.0, 100.0)
    collision_result = bitmap_rectangle_collision_for_cell(test_bitmap, 0, 50.0, 50.0, test_rectangle)
    assert collision_result is True
    free_bitmap(test_bitmap)
    close_window(test_window)


def test_SpriteBitmapCollision_integration():
    test_window = open_window("Collision Test", 800, 600)
    test_bitmap = create_bitmap("test_bitmap", 100, 100)
    test_sprite = create_sprite(test_bitmap)
    collision_result = sprite_bitmap_collision(test_sprite, test_bitmap, 100.0, 100.0)
    assert collision_result is True
    collision_result = sprite_bitmap_collision(test_sprite, test_bitmap, 200.0, 200.0)
    assert collision_result is False
    free_all_sprites()
    free_all_bitmaps()
    close_window(test_window)


def test_SpriteBitmapCollisionWithCellAtPoint_integration():
    test_window = open_window("Test Window", 800, 600)
    test_bitmap = create_bitmap("test_bitmap", 100, 100)
    test_sprite = create_sprite(test_bitmap)
    collision_result = sprite_bitmap_collision_with_cell_at_point(test_sprite, test_bitmap, 0, point_at(50, 50))
    assert collision_result is True
    free_all_sprites()
    free_bitmap(test_bitmap)
    close_window(test_window)


def test_SpriteBitmapCollisionWithCell_integration():
    test_window = open_window("Test Window", 800, 600)
    test_bitmap = create_bitmap("test_bitmap", 100, 100)
    test_sprite = create_sprite(test_bitmap)
    collision_result = sprite_bitmap_collision_with_cell(test_sprite, test_bitmap, 0, 50.0, 50.0)
    assert collision_result is True
    free_all_sprites()
    free_all_bitmaps()
    close_window(test_window)


def test_SpriteCollision_integration():
    test_window = open_window("Test Window", 800, 600)
    test_bitmap_1 = create_bitmap("test_bitmap_1", 50, 50)
    test_bitmap_2 = create_bitmap("test_bitmap_2", 50, 50)
    test_sprite_1 = create_sprite(test_bitmap_1)
    test_sprite_2 = create_sprite(test_bitmap_2)
    sprite_set_position(test_sprite_1, point_at(100, 100))
    sprite_set_position(test_sprite_2, point_at(150, 150))
    assert sprite_collision(test_sprite_1, test_sprite_2) is True
    sprite_set_position(test_sprite_2, point_at(200, 200))
    assert sprite_collision(test_sprite_1, test_sprite_2) is False
    free_all_sprites()
    free_all_bitmaps()
    close_window(test_window)


def test_SpritePointCollision_integration():
    test_window = open_window("Test Window", 800, 600)
    test_bitmap = create_bitmap("test_bitmap", 100, 100)
    test_sprite = create_sprite(test_bitmap)
    collision_result = sprite_point_collision(test_sprite, point_at(50, 50))
    assert collision_result is True
    collision_result = sprite_point_collision(test_sprite, point_at(200, 200))
    assert collision_result is False
    free_all_sprites()
    free_bitmap(test_bitmap)
    close_window(test_window)


def test_SpriteRectangleCollision_integration():
    test_window = open_window("Test Window", 800, 600)
    test_bitmap = create_bitmap("test_bitmap", 100, 100)
    test_sprite = create_sprite(test_bitmap)
    test_rectangle = rectangle_from(50.0, 50.0, 150.0, 150.0)
    collision_result = sprite_rectangle_collision(test_sprite, test_rectangle)
    assert collision_result is True
    free_all_sprites()
    free_bitmap(test_bitmap)
    close_window(test_window)


def test_ApplyMatrixToQuad_integration():
    test_window = open_window("Test Window", 800, 600)
    test_matrix = identity_matrix()
    test_quad = quad_from(point_at(100, 100), point_at(200, 100), point_at(200, 200), point_at(100, 200))
    apply_matrix_to_quad(test_matrix, test_quad)
    assert point_at(100, 100) == quad_point
    close_window(test_window)


def test_ApplyMatrixToTriangle_integration():
    test_triangle = triangle_from(point_at(0.0, 0.0), point_at(1.0, 0.0), point_at(0.0, 1.0))
    test_matrix = translation_matrix(1.0, 1.0)
    apply_matrix_to_triangle(test_matrix, test_triangle)
    assert triangle_to_string(test_triangle) == "Triangle(x1: 1.0, y1: 1.0, x2: 2.0, y2: 1.0, x3: 1.0, y3: 2.0)"


def test_IdentityMatrix_integration():
    test_matrix = identity_matrix()
    assert test_matrix[0, 0] == 1.0
    assert test_matrix[1, 1] == 1.0
    assert test_matrix[0, 1] == 0.0
    assert test_matrix[1, 0] == 0.0


def test_MatrixInverse_integration():
    test_matrix = identity_matrix()
    inverse_matrix = matrix_inverse(test_matrix)
    result_matrix = matrix_multiply_matrix(test_matrix, inverse_matrix)
    assert vectors_equal(vector_to(1.0, 0.0), matrix_multiply_point(result_matrix, vector_to(1.0, 0.0))) is True


def test_MatrixMultiplyPoint_integration():
    test_matrix = identity_matrix()
    test_point = point_at(10.0, 20.0)
    result_point = matrix_multiply_point(test_matrix, test_point)
    assert result_point.x == 10.0
    assert result_point.y == 20.0


def test_MatrixMultiplyMatrix_integration():
    test_matrix1 = identity_matrix()
    test_matrix2 = rotation_matrix(45)
    result_matrix = matrix_multiply_matrix(test_matrix1, test_matrix2)
    assert result_matrix[0, 0] == cosine(45)
    assert result_matrix[0, 1] == sine(45)


def test_MatrixMultiplyVector_integration():
    test_vector = vector_to(1.0, 1.0)
    test_matrix = scale_matrix(2.0)
    result_vector = matrix_multiply_vector(test_matrix, test_vector)
    assert result_vector.x == 2.0
    assert result_vector.y == 2.0


def test_MatrixToString_integration():
    test_matrix = identity_matrix()
    test_matrix_string = matrix_to_string(test_matrix)
    assert test_matrix_string == "[1, 0, 0, 1, 0, 0]"


def test_RotationMatrix_integration():
    test_matrix = rotation_matrix(45.0)
    test_vector = vector_to(1.0, 0.0)
    result_vector = matrix_multiply_vector(test_matrix, test_vector)
    assert 0.99 <= vector_magnitude(result_vector) <= 1.01
    assert 44.0 <= vector_angle(result_vector) <= 46.0


def test_ScaleMatrixFromPoint_integration():
    test_scale = point_at(2.0, 3.0)
    test_matrix = scale_matrix_from_point(test_scale)
    test_vector = vector_to(1.0, 1.0)
    result_vector = matrix_multiply_vector(test_matrix, test_vector)
    assert result_vector.x == 2.0
    assert result_vector.y == 3.0


def test_ScaleMatrixFromVector_integration():
    test_scale_vector = vector_to(2.0, 3.0)
    test_matrix = scale_matrix_from_vector(test_scale_vector)
    test_vector = vector_to(1.0, 1.0)
    result_vector = matrix_multiply_vector(test_matrix, test_vector)
    assert result_vector.x == 2.0
    assert result_vector.y == 3.0


def test_ScaleMatrix_integration():
    test_matrix = scale_matrix(2.0)
    test_vector = vector_to(1.0, 1.0)
    result_vector = matrix_multiply_vector(test_matrix, test_vector)
    assert result_vector.x == 2.0
    assert result_vector.y == 2.0


def test_ScaleRotateTranslateMatrix_integration():
    test_scale = point_at(2.0, 3.0)
    test_translate = point_at(10.0, 20.0)
    test_matrix = scale_rotate_translate_matrix(test_scale, 45.0, test_translate)
    test_point = point_at(1.0, 1.0)
    result_point = matrix_multiply_point(test_matrix, test_point)
    assert 10.0 <= result_point.x <= 10.1
    assert 23.0 <= result_point.y <= 23.1


def test_TranslationMatrixToPoint_integration():
    test_point = point_at(10.0, 20.0)
    test_matrix = translation_matrix_to_point(test_point)
    test_vector = point_at(5.0, 5.0)
    result_point = matrix_multiply_vector(test_matrix, test_vector)
    assert result_point.x == 15.0
    assert result_point.y == 25.0


def test_TranslationMatrixFromVector_integration():
    test_vector = vector_to(10.0, 20.0)
    test_matrix = translation_matrix_from_vector(test_vector)
    test_point = point_at(0.0, 0.0)
    result_point = matrix_multiply_point(test_matrix, test_point)
    assert result_point.x == 10.0
    assert result_point.y == 20.0


def test_TranslationMatrix_integration():
    test_matrix = translation_matrix(10.0, 20.0)
    test_point = point_at(0.0, 0.0)
    result_point = matrix_multiply_point(test_matrix, test_point)
    assert result_point.x == 10.0
    assert result_point.y == 20.0


def test_AngleBetween_integration():
    test_vector1 = vector_to(1.0, 0.0)
    test_vector2 = vector_to(0.0, 1.0)
    test_angle = angle_between(test_vector1, test_vector2)
    assert 89.9 <= test_angle <= 90.1


def test_DotProduct_integration():
    test_vector1 = vector_to(3.0, 4.0)
    test_vector2 = vector_to(1.0, 2.0)
    test_result = dot_product(test_vector1, test_vector2)
    assert test_result == 11.0


def test_IsZeroVector_integration():
    test_zero_vector = vector_to(0.0, 0.0)
    test_non_zero_vector = vector_to(1.0, 1.0)
    assert is_zero_vector(test_zero_vector) is True
    assert is_zero_vector(test_non_zero_vector) is False


def test_RayIntersectionPoint_integration():
    test_from_pt = point_at(0.0, 0.0)
    test_heading = vector_to(1.0, 1.0)
    test_line = line_from(point_at(0.0, 2.0), point_at(2.0, 0.0))
    intersection_result = ray_intersection_point(test_from_pt, test_heading, test_line, point_at(0.0, 0.0))
    assert intersection_result is True


def test_UnitVector_integration():
    test_vector = vector_to(3.0, 4.0)
    test_unit_vector = unit_vector(test_vector)
    assert vector_magnitude(test_unit_vector) == 1.0
    assert vector_angle(test_unit_vector) == vector_angle(test_vector)


def test_VectorAdd_integration():
    test_vector1 = vector_to(1.0, 2.0)
    test_vector2 = vector_to(3.0, 4.0)
    result_vector = vector_add(test_vector1, test_vector2)
    assert result_vector.x == 4.0
    assert result_vector.y == 6.0


def test_VectorAngle_integration():
    test_vector = vector_to(1.0, 1.0)
    test_angle = vector_angle(test_vector)
    assert 45.0 <= test_angle <= 45.001


def test_VectorFromAngle_integration():
    test_vector = vector_from_angle(45.0, 1.0)
    assert 0.99 <= vector_magnitude(test_vector) <= 1.01
    assert 44.0 <= vector_angle(test_vector) <= 46.0


def test_VectorFromLine_integration():
    test_line = line_from(point_at(0.0, 0.0), point_at(10.0, 10.0))
    test_vector = vector_from_line(test_line)
    assert test_vector.x == 10.0
    assert test_vector.y == 10.0


def test_VectorFromPointToRect_integration():
    test_rect = rectangle_from(0.0, 0.0, 100.0, 100.0)
    test_point = point_at(50.0, 50.0)
    test_vector = vector_from_point_to_rect(test_point, test_rect)
    assert vector_magnitude(test_vector) == 0.0


def test_VectorInRect_integration():
    test_rect = rectangle_from(0.0, 0.0, 100.0, 100.0)
    test_vector_inside = vector_to(50.0, 50.0)
    test_vector_outside = vector_to(150.0, 150.0)
    assert vector_in_rect(test_vector_inside, test_rect) is True
    assert vector_in_rect(test_vector_outside, test_rect) is False


def test_VectorInvert_integration():
    test_vector = vector_to(3.0, 4.0)
    inverted_vector = vector_invert(test_vector)
    assert vector_to(-3.0, -4.0) == inverted_vector


def test_VectorLimit_integration():
    test_vector = vector_to(3.0, 4.0)
    limited_vector = vector_limit(test_vector, 5.0)
    assert vector_magnitude(limited_vector) <= 5.0
    assert vectors_equal(test_vector, limited_vector) is True


def test_VectorMagnitude_integration():
    test_vector = vector_to(3.0, 4.0)
    test_magnitude = vector_magnitude(test_vector)
    assert test_magnitude == 5.0


def test_VectorMagnitudeSquared_integration():
    test_vector = vector_to(3.0, 4.0)
    result = vector_magnitude_squared(test_vector)
    assert result == 25.0


def test_VectorMultiply_integration():
    test_vector = vector_to(3.0, 4.0)
    result_vector = vector_multiply(test_vector, 2.0)
    assert vector_magnitude(result_vector) == 10.0
    assert vector_angle(result_vector) == vector_angle(test_vector)


def test_VectorNormal_integration():
    test_vector = vector_to(3.0, 4.0)
    normal_vector = vector_normal(test_vector)
    assert vector_magnitude(normal_vector) == 5.0
    assert vector_angle(normal_vector) == 53.1301


def test_VectorOutOfCircleFromCircle_integration():
    test_circle_src = circle_at(100.0, 100.0, 50.0)
    test_circle_bounds = circle_at(150.0, 150.0, 75.0)
    test_velocity = vector_to(10.0, 10.0)
    test_result_vector = vector_out_of_circle_from_circle(test_circle_src, test_circle_bounds, test_velocity)
    assert vector_magnitude(test_result_vector) > 0.0
    assert circles_intersect(circle_at(point_offset_by(center_point(test_circle_src), test_result_vector), circle_radius(test_circle_src)), test_circle_bounds) is True


def test_VectorOutOfCircleFromPoint_integration():
    test_point = point_at(100.0, 100.0)
    test_circle = circle_at(150.0, 150.0, 50.0)
    test_velocity = vector_to(10.0, 10.0)
    test_result = vector_out_of_circle_from_point(test_point, test_circle, test_velocity)
    assert vector_magnitude(test_result) > 0.0


def test_VectorOutOfRectFromCircle_integration():
    test_window = open_window("Test Window", 800, 600)
    test_circle = circle_at(100.0, 100.0, 50.0)
    test_rectangle = rectangle_from(50.0, 50.0, 200.0, 200.0)
    test_velocity = vector_to(10.0, 0.0)
    test_result_vector = vector_out_of_rect_from_circle(test_circle, test_rectangle, test_velocity)
    assert vector_magnitude(test_result_vector) != 0.0
    close_window(test_window)


def test_VectorOutOfRectFromPoint_integration():
    test_point = point_at(50.0, 50.0)
    test_rectangle = rectangle_from(0.0, 0.0, 100.0, 100.0)
    test_velocity = vector_to(1.0, 1.0)
    result_vector = vector_out_of_rect_from_point(test_point, test_rectangle, test_velocity)
    assert point_in_rectangle(point_offset_by(test_point, result_vector), test_rectangle) is True


def test_VectorOutOfRectFromRect_integration():
    test_src_rect = rectangle_from(50.0, 50.0, 100.0, 100.0)
    test_bounds_rect = rectangle_from(0.0, 0.0, 200.0, 200.0)
    test_velocity = vector_to(10.0, 10.0)
    test_result_vector = vector_out_of_rect_from_rect(test_src_rect, test_bounds_rect, test_velocity)
    assert vector_magnitude(test_result_vector) != 0.0


def test_VectorPointToPoint_integration():
    test_start_point = point_at(0.0, 0.0)
    test_end_point = point_at(3.0, 4.0)
    test_vector = vector_point_to_point(test_start_point, test_end_point)
    assert vector_to(3.0, 4.0) == test_vector


def test_VectorSubtract_integration():
    test_vector1 = vector_to(3.0, 4.0)
    test_vector2 = vector_to(1.0, 1.0)
    result_vector = vector_subtract(test_vector1, test_vector2)
    assert vector_magnitude(result_vector) == 3.0
    assert vector_angle(result_vector) == 45.0


def test_VectorToPoint_integration():
    test_point = point_at(3.0, 4.0)
    test_vector = vector_to_point(test_point)
    assert test_vector.x == 3.0
    assert test_vector.y == 4.0


def test_VectorTo_integration():
    test_vector = vector_to(3.0, 4.0)
    assert vector_magnitude(test_vector) == 5.0
    assert vector_angle(test_vector) == 53.1301


def test_VectorToString_integration():
    test_vector = vector_to(3.0, 4.0)
    test_string = vector_to_string(test_vector)
    assert test_string == "Vector(3.0, 4.0)"


def test_VectorsEqual_integration():
    test_vector1 = vector_to(1.0, 1.0)
    test_vector2 = vector_to(1.0, 1.0)
    assert vectors_equal(test_vector1, test_vector2) is True
    test_vector3 = vector_to(1.0, 2.0)
    assert vectors_equal(test_vector1, test_vector3) is False


def test_VectorsNotEqual_integration():
    test_vector1 = vector_to(1.0, 1.0)
    test_vector2 = vector_to(1.0, 1.0)
    assert vectors_not_equal(test_vector1, test_vector2) is False
    test_vector3 = vector_to(1.0, 2.0)
    assert vectors_not_equal(test_vector1, test_vector3) is True

