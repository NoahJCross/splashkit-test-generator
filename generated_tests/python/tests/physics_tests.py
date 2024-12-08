import pytest
from splashkit import *


def test_BitmapCircleCollisionAtPoint_integration():
    test_window = open_window("Test Window", 800, 600)
    test_bitmap = create_bitmap("test_bitmap", 100, 100)
    clear_bitmap(test_bitmap, color_black())
    test_circle = circle_at(150.0, 150.0, 50.0)
    test_point = point_at(100.0, 100.0)
    assert bitmap_circle_collision(test_bitmap, test_point, test_circle) is True
    free_bitmap(test_bitmap)
    close_window(test_window)


def test_BitmapCircleCollision_integration():
    test_window = open_window("Test Window", 800, 600)
    test_bitmap = create_bitmap("test_bitmap", 100, 100)
    clear_bitmap(test_bitmap, color_black())
    test_circle = circle_at(150.0, 150.0, 50.0)
    assert bitmap_circle_collision(test_bitmap, 100.0, 100.0, test_circle) is True
    free_bitmap(test_bitmap)
    close_window(test_window)


def test_BitmapCircleCollisionForCellWithTranslation_integration():
    test_window = open_window("Test Window", 800, 600)
    test_bitmap = create_bitmap("test_bitmap", 100, 100)
    clear_bitmap(test_bitmap, color_black())
    test_circle = circle_at(150.0, 150.0, 50.0)
    test_translation = translation_matrix(100.0, 100.0)
    assert bitmap_circle_collision(test_bitmap, 0, test_translation, test_circle) is True
    free_bitmap(test_bitmap)
    close_window(test_window)


def test_BitmapCircleCollisionForCellAtPoint_integration():
    test_window = open_window("Test Window", 800, 600)
    test_bitmap = create_bitmap("test_bitmap", 100, 100)
    clear_bitmap(test_bitmap, color_black())
    test_circle = circle_at(150.0, 150.0, 50.0)
    test_point = point_at(100.0, 100.0)
    assert bitmap_circle_collision(test_bitmap, 0, test_point, test_circle) is True
    free_bitmap(test_bitmap)
    close_window(test_window)


def test_BitmapCircleCollisionForCell_integration():
    test_window = open_window("Test Window", 800, 600)
    test_bitmap = create_bitmap("test_bitmap", 100, 100)
    clear_bitmap(test_bitmap, color_black())
    test_circle = circle_at(150.0, 150.0, 50.0)
    assert bitmap_circle_collision(test_bitmap, 0, 100.0, 100.0, test_circle) is True
    free_bitmap(test_bitmap)
    close_window(test_window)


def test_BitmapCollision_integration():
    test_window = open_window("Test Window", 800, 600)
    test_bitmap1 = create_bitmap("test_bitmap1", 100, 100)
    test_bitmap2 = create_bitmap("test_bitmap2", 100, 100)
    clear_bitmap(test_bitmap1, color_black())
    clear_bitmap(test_bitmap2, color_black())
    assert bitmap_collision(test_bitmap1, 0, 0.0, 0.0, test_bitmap2, 0, 50.0, 50.0) is True
    assert bitmap_collision(test_bitmap1, 0, 0.0, 0.0, test_bitmap2, 0, 200.0, 200.0) is False
    free_all_bitmaps()
    close_window(test_window)


def test_BitmapCollisionAtPoints_integration():
    test_window = open_window("Test Window", 800, 600)
    test_bitmap1 = create_bitmap("test_bitmap1", 100, 100)
    test_bitmap2 = create_bitmap("test_bitmap2", 100, 100)
    clear_bitmap(test_bitmap1, color_black())
    clear_bitmap(test_bitmap2, color_black())
    test_point1 = point_at(0.0, 0.0)
    test_point2 = point_at(50.0, 50.0)
    assert bitmap_collision(test_bitmap1, test_point1, test_bitmap2, test_point2) is True
    free_all_bitmaps()
    close_window(test_window)


def test_BitmapCollisionForCellsWithTranslations_integration():
    test_window = open_window("Test Window", 800, 600)
    test_bitmap1 = create_bitmap("test_bitmap1", 100, 100)
    test_bitmap2 = create_bitmap("test_bitmap2", 100, 100)
    clear_bitmap(test_bitmap1, color_black())
    clear_bitmap(test_bitmap2, color_black())
    matrix1 = translation_matrix(0.0, 0.0)
    matrix2 = translation_matrix(50.0, 50.0)
    assert bitmap_collision(test_bitmap1, 0, matrix1, test_bitmap2, 0, matrix2) is True
    free_all_bitmaps()
    close_window(test_window)


def test_BitmapCollisionForCellsAtPoints_integration():
    test_window = open_window("Test Window", 800, 600)
    test_bitmap1 = create_bitmap("test_bitmap1", 50, 50)
    test_bitmap2 = create_bitmap("test_bitmap2", 50, 50)
    clear_bitmap(test_bitmap1, color_black())
    clear_bitmap(test_bitmap2, color_black())
    test_point1 = point_at(100.0, 100.0)
    test_point2 = point_at(125.0, 125.0)
    assert bitmap_collision(test_bitmap1, 0, test_point1, test_bitmap2, 0, test_point2) is True
    free_all_bitmaps()
    close_window(test_window)


def test_BitmapCollisionForCells_integration():
    test_window = open_window("Test Window", 800, 600)
    test_bitmap1 = create_bitmap("test_bitmap1", 100, 100)
    test_bitmap2 = create_bitmap("test_bitmap2", 100, 100)
    clear_bitmap(test_bitmap1, color_black())
    clear_bitmap(test_bitmap2, color_black())
    assert bitmap_collision(test_bitmap1, 0, 100.0, 100.0, test_bitmap2, 0, 150.0, 100.0) is False
    assert bitmap_collision(test_bitmap1, 0, 100.0, 100.0, test_bitmap2, 0, 100.0, 100.0) is True
    free_all_bitmaps()
    close_window(test_window)


def test_BitmapPointCollisionWithTranslation_integration():
    test_window = open_window("Test Window", 800, 600)
    test_bitmap = create_bitmap("test_bitmap", 100, 100)
    clear_bitmap(test_bitmap, color_black())
    test_translation = translation_matrix(100.0, 100.0)
    test_point = point_at(150.0, 150.0)
    assert bitmap_point_collision(test_bitmap, test_translation, test_point) is True
    free_bitmap(test_bitmap)
    close_window(test_window)


def test_BitmapPointCollisionAtPoint_integration():
    test_window = open_window("Test Window", 800, 600)
    test_bitmap = create_bitmap("test_bitmap", 100, 100)
    clear_bitmap(test_bitmap, color_black())
    test_bmp_pt = point_at(50.0, 50.0)
    test_pt = point_at(50.0, 50.0)
    assert bitmap_point_collision(test_bitmap, test_bmp_pt, test_pt) is True
    free_bitmap(test_bitmap)
    close_window(test_window)


def test_BitmapPointCollision_integration():
    test_window = open_window("Test Window", 800, 600)
    test_bitmap = create_bitmap("test_bitmap", 100, 100)
    clear_bitmap(test_bitmap, color_black())
    assert bitmap_point_collision(test_bitmap, 0.0, 0.0, 50.0, 50.0) is True
    assert bitmap_point_collision(test_bitmap, 0.0, 0.0, 150.0, 150.0) is False
    free_bitmap(test_bitmap)
    close_window(test_window)


def test_BitmapPointCollisionForCellWithTranslation_integration():
    test_window = open_window("Test Window", 800, 600)
    test_bitmap = create_bitmap("test_bitmap", 100, 100)
    clear_bitmap(test_bitmap, color_black())
    test_translation = translation_matrix(100.0, 100.0)
    test_point = point_at(150.0, 150.0)
    assert bitmap_point_collision(test_bitmap, 0, test_translation, test_point) is True
    free_bitmap(test_bitmap)
    close_window(test_window)


def test_BitmapPointCollisionForCellAtPoint_integration():
    test_window = open_window("Test Window", 800, 600)
    test_bitmap = create_bitmap("test_bitmap", 100, 100)
    clear_bitmap(test_bitmap, color_black())
    test_point = point_at(100.0, 100.0)
    assert bitmap_point_collision(test_bitmap, 0, test_point, test_point) is True
    free_bitmap(test_bitmap)
    close_window(test_window)


def test_BitmapPointCollisionForCell_integration():
    test_window = open_window("Test Window", 800, 600)
    test_bitmap = create_bitmap("test_bitmap", 100, 100)
    clear_bitmap(test_bitmap, color_black())
    assert bitmap_point_collision(test_bitmap, 0, 100.0, 100.0, 100.0, 100.0) is True
    free_bitmap(test_bitmap)
    close_window(test_window)


def test_BitmapRectangleCollisionAtPoint_integration():
    test_window = open_window("Test Window", 800, 600)
    test_bitmap = create_bitmap("test_bitmap", 100, 100)
    clear_bitmap(test_bitmap, color_black())
    test_rectangle = rectangle_from(50.0, 50.0, 100.0, 100.0)
    test_point = point_at(100.0, 100.0)
    assert bitmap_rectangle_collision(test_bitmap, test_point, test_rectangle) is True
    free_bitmap(test_bitmap)
    close_window(test_window)


def test_BitmapRectangleCollision_integration():
    test_window = open_window("Test Window", 800, 600)
    test_bitmap = create_bitmap("test_bitmap", 100, 100)
    clear_bitmap(test_bitmap, color_black())
    test_rectangle = rectangle_from(50.0, 50.0, 100.0, 100.0)
    assert bitmap_rectangle_collision(test_bitmap, 0.0, 0.0, test_rectangle) is True
    free_bitmap(test_bitmap)
    close_window(test_window)


def test_BitmapRectangleCollisionForCellWithTranslation_integration():
    test_window = open_window("Test Window", 800, 600)
    test_bitmap = create_bitmap("test_bitmap", 100, 100)
    clear_bitmap(test_bitmap, color_black())
    test_rectangle = rectangle_from(150.0, 150.0, 50.0, 50.0)
    test_translation = translation_matrix(100.0, 100.0)
    assert bitmap_rectangle_collision(test_bitmap, 0, test_translation, test_rectangle) is True
    free_bitmap(test_bitmap)
    close_window(test_window)


def test_BitmapRectangleCollisionForCellAtPoint_integration():
    test_window = open_window("Test Window", 800, 600)
    test_bitmap = create_bitmap("test_bitmap", 100, 100)
    clear_bitmap(test_bitmap, color_black())
    test_rectangle = rectangle_from(100.0, 100.0, 50.0, 50.0)
    test_point = point_at(100.0, 100.0)
    assert bitmap_rectangle_collision(test_bitmap, 0, test_point, test_rectangle) is True
    free_bitmap(test_bitmap)
    close_window(test_window)


def test_BitmapRectangleCollisionForCell_integration():
    test_window = open_window("Test Window", 800, 600)
    test_bitmap = create_bitmap("test_bitmap", 100, 100)
    clear_bitmap(test_bitmap, color_black())
    test_rectangle = rectangle_from(50.0, 50.0, 100.0, 100.0)
    assert bitmap_rectangle_collision(test_bitmap, 0, 50.0, 50.0, test_rectangle) is True
    free_bitmap(test_bitmap)
    close_window(test_window)


def test_SpriteBitmapCollision_integration():
    test_window = open_window("Test Window", 800, 600)
    test_bitmap = create_bitmap("test_bitmap", 100, 100)
    clear_bitmap(test_bitmap, color_black())
    test_sprite = create_sprite(test_bitmap)
    sprite_set_collision_kind(test_sprite, pixel_collisions)
    sprite_set_position(test_sprite, point_at(100.0, 100.0))
    assert sprite_bitmap_collision(test_sprite, test_bitmap, 100.0, 100.0) is True
    assert sprite_bitmap_collision(test_sprite, test_bitmap, 200.0, 200.0) is False
    free_all_sprites()
    free_all_bitmaps()
    close_window(test_window)


def test_SpriteBitmapCollisionWithCellAtPoint_integration():
    test_window = open_window("Test Window", 800, 600)
    test_bitmap = create_bitmap("test_bitmap", 100, 100)
    clear_bitmap(test_bitmap, color_black())
    test_sprite = create_sprite(test_bitmap)
    sprite_set_collision_kind(test_sprite, pixel_collisions)
    sprite_set_position(test_sprite, point_at(50.0, 50.0))
    assert sprite_bitmap_collision(test_sprite, test_bitmap, 0, point_at(50.0, 50.0)) is True
    free_all_sprites()
    free_bitmap(test_bitmap)
    close_window(test_window)


def test_SpriteBitmapCollisionWithCell_integration():
    test_window = open_window("Test Window", 800, 600)
    test_bitmap = create_bitmap("test_bitmap", 100, 100)
    clear_bitmap(test_bitmap, color_black())
    test_sprite = create_sprite(test_bitmap)
    sprite_set_collision_kind(test_sprite, pixel_collisions)
    sprite_set_position(test_sprite, point_at(50.0, 50.0))
    assert sprite_bitmap_collision(test_sprite, test_bitmap, 0, 50.0, 50.0) is True
    free_all_sprites()
    free_all_bitmaps()
    close_window(test_window)


def test_SpriteCollision_integration():
    test_window = open_window("Test Window", 800, 600)
    test_bitmap1 = create_bitmap("test_bitmap_1", 50, 50)
    test_bitmap2 = create_bitmap("test_bitmap_2", 50, 50)
    clear_bitmap(test_bitmap1, color_black())
    clear_bitmap(test_bitmap2, color_black())
    test_sprite1 = create_sprite(test_bitmap1)
    test_sprite2 = create_sprite(test_bitmap2)
    sprite_set_collision_kind(test_sprite1, pixel_collisions)
    sprite_set_collision_kind(test_sprite2, pixel_collisions)
    sprite_set_position(test_sprite1, point_at(100.0, 100.0))
    sprite_set_position(test_sprite2, point_at(100.0, 100.0))
    assert sprite_collision(test_sprite1, test_sprite2) is True
    sprite_set_position(test_sprite2, point_at(200.0, 200.0))
    assert sprite_collision(test_sprite1, test_sprite2) is False
    free_all_sprites()
    free_all_bitmaps()
    close_window(test_window)


def test_SpritePointCollision_integration():
    test_window = open_window("Test Window", 800, 600)
    test_bitmap = create_bitmap("test_bitmap", 100, 100)
    clear_bitmap(test_bitmap, color_black())
    test_sprite = create_sprite(test_bitmap)
    sprite_set_collision_kind(test_sprite, pixel_collisions)
    assert sprite_point_collision(test_sprite, point_at(50.0, 50.0)) is True
    assert sprite_point_collision(test_sprite, point_at(200.0, 200.0)) is False
    free_all_sprites()
    free_bitmap(test_bitmap)
    close_window(test_window)


def test_SpriteRectangleCollision_integration():
    test_window = open_window("Test Window", 800, 600)
    test_bitmap = create_bitmap("test_bitmap", 100, 100)
    clear_bitmap(test_bitmap, color_black())
    test_sprite = create_sprite(test_bitmap)
    sprite_set_collision_kind(test_sprite, pixel_collisions)
    test_rectangle = rectangle_from(0.0, 0.0, 100.0, 100.0)
    assert sprite_rectangle_collision(test_sprite, test_rectangle) is True
    free_all_sprites()
    free_bitmap(test_bitmap)
    close_window(test_window)


def test_ApplyMatrixToQuad_integration():
    test_window = open_window("Test Window", 800, 600)
    test_matrix = identity_matrix()
    test_quad = quad_from(point_at(100.0, 100.0), point_at(200.0, 100.0), point_at(200.0, 200.0), point_at(100.0, 200.0))
    apply_matrix_to_quad(test_matrix, test_quad)
    assert 100.0 == {:value_type=>"array_access_field", :variable_name=>"test_quad", :array_name=>"points", :index=>0, :field=>"x"}
    assert 100.0 == {:value_type=>"array_access_field", :variable_name=>"test_quad", :array_name=>"points", :index=>0, :field=>"y"}
    close_window(test_window)


def test_ApplyMatrixToTriangle_integration():
    test_triangle = triangle_from(point_at(0.0, 0.0), point_at(1.0, 0.0), point_at(0.0, 1.0))
    test_matrix = translation_matrix(1.0, 1.0)
    apply_matrix_to_triangle(test_matrix, test_triangle)
    assert 1.0 == {:value_type=>"array_access_field", :variable_name=>"test_triangle", :array_name=>"points", :index=>0, :field=>"x"}
    assert 1.0 == {:value_type=>"array_access_field", :variable_name=>"test_triangle", :array_name=>"points", :index=>0, :field=>"y"}


def test_IdentityMatrix_integration():
    test_matrix = identity_matrix()
    assert 1.0 == {:value_type=>"matrix_access", :variable_name=>"test_matrix", :field=>"elements", :row=>0, :col=>0}
    assert 1.0 == {:value_type=>"matrix_access", :variable_name=>"test_matrix", :field=>"elements", :row=>1, :col=>1}
    assert 0.0 == {:value_type=>"matrix_access", :variable_name=>"test_matrix", :field=>"elements", :row=>0, :col=>1}
    assert 0.0 == {:value_type=>"matrix_access", :variable_name=>"test_matrix", :field=>"elements", :row=>1, :col=>0}


def test_MatrixInverse_integration():
    test_matrix = scale_rotate_translate_matrix(point_at(2.0, 2.0), 45.0, point_at(10.0, 10.0))
    inverse_matrix = matrix_inverse(test_matrix)
    result_matrix = matrix_multiply_matrix(test_matrix, inverse_matrix)
    assert 1.0 == {:value_type=>"matrix_access", :variable_name=>"result_matrix", :field=>"elements", :row=>0, :col=>0}
    assert 1.0 == {:value_type=>"matrix_access", :variable_name=>"result_matrix", :field=>"elements", :row=>1, :col=>1}


def test_MatrixMultiplyPoint_integration():
    test_matrix = translation_matrix(10.0, 10.0)
    test_point = point_at(10.0, 20.0)
    result_point = matrix_multiply_point(test_matrix, test_point)
    assert 20.0 == result_point.x
    assert 30.0 == result_point.y


def test_MatrixMultiplyMatrix_integration():
    test_matrix1 = scale_matrix(2.0)
    test_matrix2 = translation_matrix(10.0, 10.0)
    result_matrix = matrix_multiply_matrix(test_matrix1, test_matrix2)
    assert 2.0 == {:value_type=>"matrix_access", :variable_name=>"result_matrix", :field=>"elements", :row=>0, :col=>0}
    assert 20.0 == {:value_type=>"matrix_access", :variable_name=>"result_matrix", :field=>"elements", :row=>0, :col=>2}


def test_MatrixMultiplyVector_integration():
    test_vector = vector_to(2.0, 2.0)
    test_matrix = scale_matrix(2.0)
    result_vector = matrix_multiply_vector(test_matrix, test_vector)
    assert 4.0 == result_vector.x
    assert 4.0 == result_vector.y


def test_MatrixToString_integration():
    test_matrix = identity_matrix()
    assert expected == matrix_to_string(test_matrix)


def test_RotationMatrix_integration():
    test_matrix = rotation_matrix(90.0)
    test_point = point_at(1.0, 0.0)
    result_point = matrix_multiply_point(test_matrix, test_point)
    assert -0.1 <= result_point.x <= 
    assert 0.9 <= result_point.y <= 


def test_ScaleMatrixFromPoint_integration():
    test_scale = point_at(2.0, 3.0)
    test_matrix = scale_matrix(test_scale)
    test_point = point_at(1.0, 1.0)
    result_point = matrix_multiply_point(test_matrix, test_point)
    assert 2.0 == result_point.x
    assert 3.0 == result_point.y


def test_ScaleMatrixFromVector_integration():
    test_scale = vector_to(2.0, 3.0)
    test_matrix = scale_matrix(test_scale)
    test_point = point_at(1.0, 1.0)
    result_point = matrix_multiply_point(test_matrix, test_point)
    assert 2.0 == result_point.x
    assert 3.0 == result_point.y


def test_ScaleRotateTranslateMatrix_integration():
    test_scale = point_at(2.0, 2.0)
    test_translate = point_at(10.0, 10.0)
    test_matrix = scale_rotate_translate_matrix(test_scale, 90.0, test_translate)
    test_point = point_at(1.0, 0.0)
    result_point = matrix_multiply_point(test_matrix, test_point)
    assert 9.9 <= result_point.x <= 
    assert 11.9 <= result_point.y <= 


def test_TranslationMatrixToPoint_integration():
    test_point = point_at(10.0, 20.0)
    test_matrix = translation_matrix(test_point)
    test_vector = point_at(5.0, 5.0)
    result_point = matrix_multiply_vector(test_matrix, test_vector)
    assert 15.0 == result_point.x
    assert 25.0 == result_point.y


def test_TranslationMatrixFromVector_integration():
    test_vector = vector_to(10.0, 20.0)
    test_matrix = translation_matrix(test_vector)
    test_point = point_at(0.0, 0.0)
    result_point = matrix_multiply_point(test_matrix, test_point)
    assert 10.0 == result_point.x
    assert 20.0 == result_point.y


def test_TranslationMatrix_integration():
    test_matrix = translation_matrix(10.0, 20.0)
    test_point = point_at(0.0, 0.0)
    result_point = matrix_multiply_point(test_matrix, test_point)
    assert 10.0 == result_point.x
    assert 20.0 == result_point.y


def test_AngleBetween_integration():
    test_vector1 = vector_to(1.0, 0.0)
    test_vector2 = vector_to(0.0, 1.0)
    assert 90.0 == angle_between(test_vector1, test_vector2)


def test_DotProduct_integration():
    test_vector1 = vector_to(3.0, 4.0)
    test_vector2 = vector_to(1.0, 2.0)
    assert 11.0 == dot_product(test_vector1, test_vector2)


def test_IsZeroVector_integration():
    test_zero_vector = vector_to(0.0, 0.0)
    test_non_zero_vector = vector_to(1.0, 1.0)
    assert is_zero_vector(test_zero_vector) is True
    assert is_zero_vector(test_non_zero_vector) is False


def test_RayIntersectionPoint_integration():
    test_from_pt = point_at(0.0, 0.0)
    test_heading = vector_to(1.0, 1.0)
    test_line = line_from(point_at(0.0, 2.0), point_at(2.0, 0.0))
    intersection_point = point_at(0.0, 0.0)
    assert ray_intersection_point(test_from_pt, test_heading, test_line, intersection_point) is True
    assert 1.0 == intersection_point.x
    assert 1.0 == intersection_point.y


def test_UnitVector_integration():
    test_vector = vector_to(3.0, 4.0)
    test_unit_vector = unit_vector(test_vector)
    assert 0.6 == test_unit_vector.x
    assert 0.8 == test_unit_vector.y


def test_VectorAdd_integration():
    test_vector1 = vector_to(1.0, 2.0)
    test_vector2 = vector_to(3.0, 4.0)
    result_vector = vector_add(test_vector1, test_vector2)
    assert 4.0 == result_vector.x
    assert 6.0 == result_vector.y


def test_VectorAngle_integration():
    test_vector = vector_to(1.0, 1.0)
    assert 45.0 == vector_angle(test_vector)


def test_VectorFromAngle_integration():
    test_vector = vector_from_angle(45.0, 1.0)
    assert 0.7071 == test_vector.x
    assert 0.7071 == test_vector.y


def test_VectorFromLine_integration():
    test_line = line_from(point_at(0.0, 0.0), point_at(3.0, 4.0))
    test_vector = vector_from_line(test_line)
    assert 3.0 == test_vector.x
    assert 4.0 == test_vector.y


def test_VectorFromPointToRect_integration():
    test_rect = rectangle_from(0.0, 0.0, 100.0, 100.0)
    test_point = point_at(50.0, 50.0)
    test_vector = vector_from_point_to_rect(test_point, test_rect)
    assert 0.0 == test_vector.x
    assert 0.0 == test_vector.y


def test_VectorInRect_integration():
    test_rect = rectangle_from(0.0, 0.0, 100.0, 100.0)
    test_vector_inside = vector_to(50.0, 50.0)
    test_vector_outside = vector_to(150.0, 150.0)
    assert vector_in_rect(test_vector_inside, test_rect) is True
    assert vector_in_rect(test_vector_outside, test_rect) is False


def test_VectorInvert_integration():
    test_vector = vector_to(3.0, 4.0)
    inverted_vector = vector_invert(test_vector)
    assert -3.0 == inverted_vector.x
    assert -4.0 == inverted_vector.y


def test_VectorLimit_integration():
    test_vector = vector_to(6.0, 8.0)
    limited_vector = vector_limit(test_vector, 5.0)
    assert 3.0 == limited_vector.x
    assert 4.0 == limited_vector.y


def test_VectorMagnitude_integration():
    test_vector = vector_to(3.0, 4.0)
    assert 5.0 == vector_magnitude(test_vector)


def test_VectorMagnitudeSquared_integration():
    test_vector = vector_to(3.0, 4.0)
    assert 25.0 == vector_magnitude_squared(test_vector)


def test_VectorMultiply_integration():
    test_vector = vector_to(3.0, 4.0)
    result_vector = vector_multiply(test_vector, 2.0)
    assert 6.0 == result_vector.x
    assert 8.0 == result_vector.y


def test_VectorNormal_integration():
    test_vector = vector_to(3.0, 4.0)
    normal_vector = vector_normal(test_vector)
    assert -4.0 == normal_vector.x
    assert 3.0 == normal_vector.y


def test_VectorOutOfCircleFromCircle_integration():
    test_circle_src = circle_at(0.0, 0.0, 10.0)
    test_circle_bounds = circle_at(15.0, 0.0, 10.0)
    test_velocity = vector_to(1.0, 0.0)
    result_vector = vector_out_of_circle_from_circle(test_circle_src, test_circle_bounds, test_velocity)
    assert -5.0 == result_vector.x
    assert 0.0 == result_vector.y


def test_VectorOutOfCircleFromPoint_integration():
    test_point = point_at(100.0, 100.0)
    test_circle = circle_at(150.0, 150.0, 50.0)
    test_velocity = vector_to(1.0, 1.0)
    result_vector = vector_out_of_circle_from_point(test_point, test_circle, test_velocity)
    assert -50.0 == result_vector.x
    assert -50.0 == result_vector.y


def test_VectorOutOfRectFromCircle_integration():
    test_circle = circle_at(75.0, 75.0, 25.0)
    test_rect = rectangle_from(0.0, 0.0, 100.0, 100.0)
    test_velocity = vector_to(1.0, 0.0)
    result_vector = vector_out_of_rect_from_circle(test_circle, test_rect, test_velocity)
    assert -25.0 == result_vector.x
    assert 0.0 == result_vector.y


def test_VectorOutOfRectFromPoint_integration():
    test_point = point_at(75.0, 75.0)
    test_rect = rectangle_from(0.0, 0.0, 100.0, 100.0)
    test_velocity = vector_to(1.0, 0.0)
    result_vector = vector_out_of_rect_from_point(test_point, test_rect, test_velocity)
    assert -25.0 == result_vector.x
    assert 0.0 == result_vector.y


def test_VectorOutOfRectFromRect_integration():
    test_src_rect = rectangle_from(75.0, 75.0, 50.0, 50.0)
    test_bounds_rect = rectangle_from(0.0, 0.0, 100.0, 100.0)
    test_velocity = vector_to(1.0, 0.0)
    result_vector = vector_out_of_rect_from_rect(test_src_rect, test_bounds_rect, test_velocity)
    assert -25.0 == result_vector.x
    assert 0.0 == result_vector.y


def test_VectorPointToPoint_integration():
    test_start_point = point_at(0.0, 0.0)
    test_end_point = point_at(3.0, 4.0)
    result_vector = vector_point_to_point(test_start_point, test_end_point)
    assert 3.0 == result_vector.x
    assert 4.0 == result_vector.y


def test_VectorSubtract_integration():
    test_vector1 = vector_to(3.0, 4.0)
    test_vector2 = vector_to(1.0, 1.0)
    result_vector = vector_subtract(test_vector1, test_vector2)
    assert 2.0 == result_vector.x
    assert 3.0 == result_vector.y


def test_VectorToPoint_integration():
    test_point = point_at(3.0, 4.0)
    result_vector = vector_to(test_point)
    assert 3.0 == result_vector.x
    assert 4.0 == result_vector.y


def test_VectorTo_integration():
    test_vector = vector_to(3.0, 4.0)
    assert 3.0 == test_vector.x
    assert 4.0 == test_vector.y


def test_VectorToString_integration():
    test_vector = vector_to(3.0, 4.0)
    assert "Vec -> 3:4" == vector_to_string(test_vector)


def test_VectorsEqual_integration():
    test_vector1 = vector_to(3.0, 4.0)
    test_vector2 = vector_to(3.0, 4.0)
    test_vector3 = vector_to(3.0, 5.0)
    assert vectors_equal(test_vector1, test_vector2) is True
    assert vectors_equal(test_vector1, test_vector3) is False


def test_VectorsNotEqual_integration():
    test_vector1 = vector_to(3.0, 4.0)
    test_vector2 = vector_to(3.0, 4.0)
    test_vector3 = vector_to(3.0, 5.0)
    assert vectors_not_equal(test_vector1, test_vector2) is False
    assert vectors_not_equal(test_vector1, test_vector3) is True

