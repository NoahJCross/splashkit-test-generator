import pytest
from splashkit import *
from ..helpers import *
import contextlib
class TestPhysics:
    def test_bitmap_circle_collision_at_point_integration():
        test_bitmap = create_bitmap("test_bitmap", 100, 100)
        with bitmap_cleanup():
            clear_bitmap(test_bitmap, color_black())
            setup_collision_mask(test_bitmap)
            test_circle = circle_at_from_points(150.0, 150.0, 50.0)
            test_point = point_at(100.0, 100.0)
            assert bitmap_circle_collision_at_point(test_bitmap, test_point, test_circle)
            
    def test_bitmap_circle_collision_integration():
        test_bitmap = create_bitmap("test_bitmap", 100, 100)
        with bitmap_cleanup():
            clear_bitmap(test_bitmap, color_black())
            setup_collision_mask(test_bitmap)
            test_circle = circle_at_from_points(150.0, 150.0, 50.0)
            assert bitmap_circle_collision(test_bitmap, 100.0, 100.0, test_circle)
            
    def test_bitmap_circle_collision_for_cell_with_translation_integration():
        test_bitmap = create_bitmap("test_bitmap", 100, 100)
        with bitmap_cleanup():
            clear_bitmap(test_bitmap, color_black())
            setup_collision_mask(test_bitmap)
            test_circle = circle_at_from_points(150.0, 150.0, 50.0)
            test_translation = translation_matrix(100.0, 100.0)
            assert bitmap_circle_collision_for_cell_with_translation(test_bitmap, 0, test_translation, test_circle)
            
    def test_bitmap_circle_collision_for_cell_at_point_integration():
        test_bitmap = create_bitmap("test_bitmap", 100, 100)
        with bitmap_cleanup():
            clear_bitmap(test_bitmap, color_black())
            setup_collision_mask(test_bitmap)
            test_circle = circle_at_from_points(150.0, 150.0, 50.0)
            test_point = point_at(100.0, 100.0)
            assert bitmap_circle_collision_for_cell_at_point(test_bitmap, 0, test_point, test_circle)
            
    def test_bitmap_circle_collision_for_cell_integration():
        test_bitmap = create_bitmap("test_bitmap", 100, 100)
        with bitmap_cleanup():
            clear_bitmap(test_bitmap, color_black())
            setup_collision_mask(test_bitmap)
            test_circle = circle_at_from_points(150.0, 150.0, 50.0)
            assert bitmap_circle_collision_for_cell(test_bitmap, 0, 100.0, 100.0, test_circle)
            
    def test_bitmap_collision_integration():
        test_bitmap1 = create_bitmap("test_bitmap1", 100, 100)
        with bitmap_cleanup():
            test_bitmap2 = create_bitmap("test_bitmap2", 100, 100)
            clear_bitmap(test_bitmap1, color_black())
            setup_collision_mask(test_bitmap1)
            clear_bitmap(test_bitmap2, color_black())
            setup_collision_mask(test_bitmap2)
            assert bitmap_collision_for_cells(test_bitmap1, 0, 0.0, 0.0, test_bitmap2, 0, 50.0, 50.0)
            assert not bitmap_collision_for_cells(test_bitmap1, 0, 0.0, 0.0, test_bitmap2, 0, 200.0, 200.0)
            
    def test_bitmap_collision_at_points_integration():
        test_bitmap1 = create_bitmap("test_bitmap1", 100, 100)
        with bitmap_cleanup():
            test_bitmap2 = create_bitmap("test_bitmap2", 100, 100)
            clear_bitmap(test_bitmap1, color_black())
            setup_collision_mask(test_bitmap1)
            clear_bitmap(test_bitmap2, color_black())
            setup_collision_mask(test_bitmap2)
            test_point1 = point_at(0.0, 0.0)
            test_point2 = point_at(50.0, 50.0)
            assert bitmap_collision_at_points(test_bitmap1, test_point1, test_bitmap2, test_point2)
            
    def test_bitmap_collision_for_cells_with_translations_integration():
        test_bitmap1 = create_bitmap("test_bitmap1", 100, 100)
        with bitmap_cleanup():
            test_bitmap2 = create_bitmap("test_bitmap2", 100, 100)
            clear_bitmap(test_bitmap1, color_black())
            setup_collision_mask(test_bitmap1)
            clear_bitmap(test_bitmap2, color_black())
            setup_collision_mask(test_bitmap2)
            matrix1 = translation_matrix(0.0, 0.0)
            matrix2 = translation_matrix(50.0, 50.0)
            assert bitmap_collision_for_cells_with_translations(test_bitmap1, 0, matrix1, test_bitmap2, 0, matrix2)
            
    def test_bitmap_collision_for_cells_at_points_integration():
        test_bitmap1 = create_bitmap("test_bitmap1", 50, 50)
        with bitmap_cleanup():
            test_bitmap2 = create_bitmap("test_bitmap2", 50, 50)
            clear_bitmap(test_bitmap1, color_black())
            setup_collision_mask(test_bitmap1)
            clear_bitmap(test_bitmap2, color_black())
            setup_collision_mask(test_bitmap2)
            test_point1 = point_at(100.0, 100.0)
            test_point2 = point_at(125.0, 125.0)
            assert bitmap_collision_for_cells_at_points(test_bitmap1, 0, test_point1, test_bitmap2, 0, test_point2)
            
    def test_bitmap_collision_for_cells_integration():
        test_bitmap1 = create_bitmap("test_bitmap1", 100, 100)
        with bitmap_cleanup():
            test_bitmap2 = create_bitmap("test_bitmap2", 100, 100)
            clear_bitmap(test_bitmap1, color_black())
            clear_bitmap(test_bitmap2, color_black())
            setup_collision_mask(test_bitmap1)
            setup_collision_mask(test_bitmap2)
            assert not bitmap_collision_for_cells(test_bitmap1, 0, 100.0, 100.0, test_bitmap2, 0, 200.0, 100.0)
            assert bitmap_collision_for_cells(test_bitmap1, 0, 100.0, 100.0, test_bitmap2, 0, 150.0, 100.0)
            
    def test_bitmap_point_collision_with_translation_integration():
        test_bitmap = create_bitmap("test_bitmap", 100, 100)
        with bitmap_cleanup():
            clear_bitmap(test_bitmap, color_black())
            setup_collision_mask(test_bitmap)
            test_translation = translation_matrix(100.0, 100.0)
            test_point1 = point_at(151.0, 150.0)
            test_point2 = point_at(201.0, 200.0)
            assert bitmap_point_collision_with_translation(test_bitmap, test_translation, test_point1)
            assert not bitmap_point_collision_with_translation(test_bitmap, test_translation, test_point2)
            
    def test_bitmap_point_collision_at_point_integration():
        test_bitmap = create_bitmap("test_bitmap", 100, 100)
        with bitmap_cleanup():
            clear_bitmap(test_bitmap, color_black())
            setup_collision_mask(test_bitmap)
            test_bmp_point = point_at(50.0, 50.0)
            test_point = point_at(101.0, 100.0)
            assert bitmap_point_collision_at_point(test_bitmap, test_bmp_point, test_point)
            assert not bitmap_point_collision_at_point(test_bitmap, test_bmp_point, point_at(201.0, 200.0))
            
    def test_bitmap_point_collision_integration():
        test_bitmap = create_bitmap("test_bitmap", 100, 100)
        with bitmap_cleanup():
            clear_bitmap(test_bitmap, color_black())
            setup_collision_mask(test_bitmap)
            assert bitmap_point_collision(test_bitmap, 0.0, 0.0, 51.0, 50.0)
            assert not bitmap_point_collision(test_bitmap, 0.0, 0.0, 151.0, 150.0)
            
    def test_bitmap_point_collision_for_cell_with_translation_integration():
        test_bitmap = create_bitmap("test_bitmap", 100, 100)
        with bitmap_cleanup():
            clear_bitmap(test_bitmap, color_black())
            setup_collision_mask(test_bitmap)
            test_translation = translation_matrix(100.0, 100.0)
            test_point1 = point_at(151.0, 150.0)
            test_point2 = point_at(201.0, 200.0)
            assert bitmap_point_collision_for_cell_with_translation(test_bitmap, 0, test_translation, test_point1)
            assert not bitmap_point_collision_for_cell_with_translation(test_bitmap, 0, test_translation, test_point2)
            
    def test_bitmap_point_collision_for_cell_at_point_integration():
        test_bitmap = create_bitmap("test_bitmap", 100, 100)
        with bitmap_cleanup():
            clear_bitmap(test_bitmap, color_black())
            setup_collision_mask(test_bitmap)
            assert bitmap_point_collision_for_cell_at_point(test_bitmap, 0, point_at(50.0, 50.0), point_at(101.0, 100.0))
            assert not bitmap_point_collision_for_cell_at_point(test_bitmap, 0, point_at(51.0, 50.0), point_at(201.0, 200.0))
            
    def test_bitmap_point_collision_for_cell_integration():
        test_bitmap = create_bitmap("test_bitmap", 100, 100)
        with bitmap_cleanup():
            clear_bitmap(test_bitmap, color_black())
            draw_pixel_with_options(color_white(), 51.0, 50.0, option_draw_to_bitmap(test_bitmap))
            setup_collision_mask(test_bitmap)
            assert bitmap_point_collision_for_cell(test_bitmap, 0, 0.0, 0.0, 51.0, 50.0)
            assert not bitmap_point_collision_for_cell(test_bitmap, 0, 0.0, 0.0, 50.0, 50.0)
            
    def test_bitmap_rectangle_collision_at_point_integration():
        test_bitmap = create_bitmap("test_bitmap", 100, 100)
        with bitmap_cleanup():
            clear_bitmap(test_bitmap, color_black())
            setup_collision_mask(test_bitmap)
            test_rectangle = rectangle_from(50.0, 50.0, 100.0, 100.0)
            test_point = point_at(100.0, 100.0)
            assert bitmap_rectangle_collision_at_point(test_bitmap, test_point, test_rectangle)
            
    def test_bitmap_rectangle_collision_integration():
        test_bitmap = create_bitmap("test_bitmap", 100, 100)
        with bitmap_cleanup():
            clear_bitmap(test_bitmap, color_black())
            setup_collision_mask(test_bitmap)
            test_rectangle = rectangle_from(50.0, 50.0, 100.0, 100.0)
            assert bitmap_rectangle_collision(test_bitmap, 0.0, 0.0, test_rectangle)
            
    def test_bitmap_rectangle_collision_for_cell_with_translation_integration():
        test_bitmap = create_bitmap("test_bitmap", 100, 100)
        with bitmap_cleanup():
            clear_bitmap(test_bitmap, color_black())
            setup_collision_mask(test_bitmap)
            test_rectangle = rectangle_from(150.0, 150.0, 50.0, 50.0)
            test_translation = translation_matrix(100.0, 100.0)
            assert bitmap_rectangle_collision_for_cell_with_translation(test_bitmap, 0, test_translation, test_rectangle)
            
    def test_bitmap_rectangle_collision_for_cell_at_point_integration():
        test_bitmap = create_bitmap("test_bitmap", 100, 100)
        with bitmap_cleanup():
            clear_bitmap(test_bitmap, color_black())
            setup_collision_mask(test_bitmap)
            test_rectangle = rectangle_from(100.0, 100.0, 50.0, 50.0)
            test_point = point_at(100.0, 100.0)
            assert bitmap_rectangle_collision_for_cell_at_point(test_bitmap, 0, test_point, test_rectangle)
            
    def test_bitmap_rectangle_collision_for_cell_integration():
        test_bitmap = create_bitmap("test_bitmap", 100, 100)
        with bitmap_cleanup():
            clear_bitmap(test_bitmap, color_black())
            setup_collision_mask(test_bitmap)
            test_rectangle = rectangle_from(50.0, 50.0, 100.0, 100.0)
            assert bitmap_rectangle_collision_for_cell(test_bitmap, 0, 50.0, 50.0, test_rectangle)
            
    def test_sprite_bitmap_collision_integration():
        test_bitmap = create_bitmap("test_bitmap", 100, 100)
        with bitmap_cleanup():
            clear_bitmap(test_bitmap, color_black())
            setup_collision_mask(test_bitmap)
            test_sprite = create_sprite(test_bitmap)
            with sprite_cleanup():
                sprite_set_collision_kind(test_sprite, CollisionTestKind.PixelCollisions)
                sprite_set_position(test_sprite, point_at(100.0, 100.0))
                assert sprite_bitmap_collision(test_sprite, test_bitmap, 100.0, 100.0)
                assert not sprite_bitmap_collision(test_sprite, test_bitmap, 200.0, 200.0)
                
    def test_sprite_bitmap_collision_with_cell_at_point_integration():
        test_bitmap = create_bitmap("test_bitmap", 100, 100)
        with bitmap_cleanup():
            clear_bitmap(test_bitmap, color_black())
            setup_collision_mask(test_bitmap)
            test_sprite = create_sprite(test_bitmap)
            with sprite_cleanup():
                sprite_set_collision_kind(test_sprite, CollisionTestKind.PixelCollisions)
                sprite_set_position(test_sprite, point_at(50.0, 50.0))
                assert sprite_bitmap_collision_with_cell_at_point(test_sprite, test_bitmap, 0, point_at(50.0, 50.0))
                
    def test_sprite_bitmap_collision_with_cell_integration():
        test_bitmap = create_bitmap("test_bitmap", 100, 100)
        with bitmap_cleanup():
            clear_bitmap(test_bitmap, color_black())
            setup_collision_mask(test_bitmap)
            test_sprite = create_sprite(test_bitmap)
            with sprite_cleanup():
                sprite_set_collision_kind(test_sprite, CollisionTestKind.PixelCollisions)
                sprite_set_position(test_sprite, point_at(50.0, 50.0))
                assert sprite_bitmap_collision_with_cell(test_sprite, test_bitmap, 0, 50.0, 50.0)
                
    def test_sprite_collision_integration():
        test_bitmap1 = create_bitmap("test_bitmap_1", 50, 50)
        with bitmap_cleanup():
            test_bitmap2 = create_bitmap("test_bitmap_2", 50, 50)
            clear_bitmap(test_bitmap1, color_black())
            setup_collision_mask(test_bitmap1)
            clear_bitmap(test_bitmap2, color_black())
            setup_collision_mask(test_bitmap2)
            test_sprite1 = create_sprite(test_bitmap1)
            with sprite_cleanup():
                test_sprite2 = create_sprite(test_bitmap2)
                sprite_set_collision_kind(test_sprite1, CollisionTestKind.PixelCollisions)
                sprite_set_collision_kind(test_sprite2, CollisionTestKind.PixelCollisions)
                sprite_set_position(test_sprite1, point_at(100.0, 100.0))
                sprite_set_position(test_sprite2, point_at(100.0, 100.0))
                assert sprite_collision(test_sprite1, test_sprite2)
                sprite_set_position(test_sprite2, point_at(200.0, 200.0))
                assert not sprite_collision(test_sprite1, test_sprite2)
                
    def test_sprite_point_collision_integration():
        test_bitmap = create_bitmap("test_bitmap", 100, 100)
        with bitmap_cleanup():
            clear_bitmap(test_bitmap, color_black())
            setup_collision_mask(test_bitmap)
            test_sprite = create_sprite(test_bitmap)
            with sprite_cleanup():
                sprite_set_collision_kind(test_sprite, CollisionTestKind.PixelCollisions)
                assert sprite_point_collision(test_sprite, point_at(76.0, 75.0))
                assert not sprite_point_collision(test_sprite, point_at(200.0, 200.0))
                
    def test_sprite_rectangle_collision_integration():
        test_bitmap = create_bitmap("test_bitmap", 100, 100)
        with bitmap_cleanup():
            clear_bitmap(test_bitmap, color_black())
            setup_collision_mask(test_bitmap)
            test_sprite = create_sprite(test_bitmap)
            with sprite_cleanup():
                sprite_set_collision_kind(test_sprite, CollisionTestKind.PixelCollisions)
                test_rectangle = rectangle_from(0.0, 0.0, 100.0, 100.0)
                assert sprite_rectangle_collision(test_sprite, test_rectangle)
                
    def test_apply_matrix_to_quad_integration():
        test_matrix = identity_matrix()
        test_quad = quad_from_points(point_at(100.0, 100.0), point_at(200.0, 100.0), point_at(200.0, 200.0), point_at(100.0, 200.0))
        apply_matrix_to_quad(test_matrix, test_quad)
        assert 100.0 == test_quad.points[0].x
        assert 100.0 == test_quad.points[0].y
        
    def test_apply_matrix_to_triangle_integration():
        test_triangle = triangle_from(point_at(0.0, 0.0), point_at(1.0, 0.0), point_at(0.0, 1.0))
        test_matrix = translation_matrix(1.0, 1.0)
        apply_matrix_to_triangle(test_matrix, test_triangle)
        assert 1.0 == test_triangle.points[0].x
        assert 1.0 == test_triangle.points[0].y
        
    def test_identity_matrix_integration():
        test_matrix = identity_matrix()
        assert 1.0 == test_matrix.elements[0][0]
        assert 1.0 == test_matrix.elements[1][1]
        assert 0.0 == test_matrix.elements[0][1]
        assert 0.0 == test_matrix.elements[1][0]
        
    def test_matrix_inverse_integration():
        test_matrix = scale_rotate_translate_matrix(point_at(2.0, 2.0), 45.0, point_at(10.0, 10.0))
        inverse_matrix = matrix_inverse(test_matrix)
        result_matrix = matrix_multiply_matrix(test_matrix, inverse_matrix)
        assert abs(1.0 - result_matrix.elements[0][0]) <= 2
        assert abs(1.0 - result_matrix.elements[1][1]) <= 2
        
    def test_matrix_multiply_point_integration():
        test_matrix = translation_matrix(10.0, 10.0)
        test_point = point_at(10.0, 20.0)
        result_point = matrix_multiply_point(test_matrix, test_point)
        assert 20.0 == result_point.x
        assert 30.0 == result_point.y
        
    def test_matrix_multiply_matrix_integration():
        test_matrix1 = scale_matrix(2.0)
        test_matrix2 = translation_matrix(10.0, 10.0)
        result_matrix = matrix_multiply_matrix(test_matrix2, test_matrix1)
        assert 2.0 == result_matrix.elements[0][0]
        assert 20.0 == result_matrix.elements[0][2]
        
    def test_matrix_multiply_vector_integration():
        test_vector = vector_to(2.0, 2.0)
        test_matrix = scale_matrix(2.0)
        result_vector = matrix_multiply_vector(test_matrix, test_vector)
        assert 4.0 == result_vector.x
        assert 4.0 == result_vector.y
        
    def test_matrix_to_string_integration():
        test_matrix = identity_matrix()
        assert " ------------------------------\n|        1         0         0 |\n|        0         1         0 |\n|        0         0         1 |\n ------------------------------" == matrix_to_string(test_matrix)
        
    def test_rotation_matrix_integration():
        test_matrix = rotation_matrix(90.0)
        test_point = point_at(1.0, 0.0)
        result_point = matrix_multiply_point(test_matrix, test_point)
        assert abs(0.0 - result_point.x) <= 2.0
        assert abs(1.0 - result_point.y) <= 2.0
        
    def test_scale_matrix_from_point_integration():
        test_scale = point_at(2.0, 3.0)
        test_matrix = scale_matrix_from_point(test_scale)
        test_point = point_at(1.0, 1.0)
        result_point = matrix_multiply_point(test_matrix, test_point)
        assert 2.0 == result_point.x
        assert 3.0 == result_point.y
        
    def test_scale_matrix_from_vector_integration():
        test_scale = vector_to(2.0, 3.0)
        test_matrix = scale_matrix_from_vector(test_scale)
        test_point = point_at(1.0, 1.0)
        result_point = matrix_multiply_point(test_matrix, test_point)
        assert 2.0 == result_point.x
        assert 3.0 == result_point.y
        
    def test_scale_matrix_integration():
        test_point = point_at(1.0, 1.5)
        test_matrix = scale_matrix(2.0)
        result_point = matrix_multiply_point(test_matrix, test_point)
        assert 2.0 == result_point.x
        assert 3.0 == result_point.y
        
    def test_scale_rotate_translate_matrix_integration():
        test_scale = point_at(2.0, 2.0)
        test_translate = point_at(10.0, 10.0)
        test_matrix = scale_rotate_translate_matrix(test_scale, 90.0, test_translate)
        test_point = point_at(1.0, 0.0)
        result_point = matrix_multiply_point(test_matrix, test_point)
        assert 10.0 == result_point.x
        assert 11.0 == result_point.y
        
    def test_translation_matrix_to_point_integration():
        test_point = point_at(10.0, 20.0)
        test_matrix = translation_matrix_to_point(test_point)
        test_vector = vector_to(5.0, 5.0)
        result_point = matrix_multiply_vector(test_matrix, test_vector)
        assert 15.0 == result_point.x
        assert 25.0 == result_point.y
        
    def test_translation_matrix_from_vector_integration():
        test_vector = vector_to(10.0, 20.0)
        test_matrix = translation_matrix_from_vector(test_vector)
        test_point = point_at(0.0, 0.0)
        result_point = matrix_multiply_point(test_matrix, test_point)
        assert 10.0 == result_point.x
        assert 20.0 == result_point.y
        
    def test_translation_matrix_integration():
        test_matrix = translation_matrix(10.0, 20.0)
        test_point = point_at(0.0, 0.0)
        result_point = matrix_multiply_point(test_matrix, test_point)
        assert 10.0 == result_point.x
        assert 20.0 == result_point.y
        
    def test_angle_between_integration():
        test_vector1 = vector_to(1.0, 0.0)
        test_vector2 = vector_to(0.0, 1.0)
        assert 90.0 == angle_between(test_vector1, test_vector2)
        
    def test_dot_product_integration():
        test_vector1 = vector_to(3.0, 4.0)
        test_vector2 = vector_to(1.0, 2.0)
        assert 11.0 == dot_product(test_vector1, test_vector2)
        
    def test_is_zero_vector_integration():
        test_zero_vector = vector_to(0.0, 0.0)
        test_non_zero_vector = vector_to(1.0, 1.0)
        assert is_zero_vector(test_zero_vector)
        assert not is_zero_vector(test_non_zero_vector)
        
    def test_ray_intersection_point_integration():
        test_from_pt = point_at(0.0, 0.0)
        test_heading = vector_to(1.0, 1.0)
        test_line = line_from_point_to_point(point_at(0.0, 2.0), point_at(2.0, 0.0))
        intersection_point = point_at(0.0, 0.0)
        assert ray_intersection_point(test_from_pt, test_heading, test_line, intersection_point)
        assert 1.0 == intersection_point.x
        assert 1.0 == intersection_point.y
        
    def test_unit_vector_integration():
        test_vector = vector_to(3.0, 4.0)
        test_unit_vector = unit_vector(test_vector)
        assert abs(0.6 - test_unit_vector.x) <= 2.0
        assert 0.8 == test_unit_vector.y
        
    def test_vector_add_integration():
        test_vector1 = vector_to(1.0, 2.0)
        test_vector2 = vector_to(3.0, 4.0)
        result_vector = vector_add(test_vector1, test_vector2)
        assert 4.0 == result_vector.x
        assert 6.0 == result_vector.y
        
    def test_vector_angle_integration():
        test_vector = vector_to(1.0, 1.0)
        assert 45.0 == vector_angle(test_vector)
        
    def test_vector_from_angle_integration():
        test_vector = vector_from_angle(0.0, 1.0)
        assert 1.0 == test_vector.x
        assert 0.0 == test_vector.y
        
    def test_vector_from_line_integration():
        test_line = line_from_point_to_point(point_at(0.0, 0.0), point_at(3.0, 4.0))
        test_vector = vector_from_line(test_line)
        assert 3.0 == test_vector.x
        assert 4.0 == test_vector.y
        
    def test_vector_from_point_to_rect_integration():
        test_rect = rectangle_from(0.0, 0.0, 100.0, 100.0)
        test_point = point_at(50.0, 50.0)
        test_vector = vector_from_point_to_rect(test_point, test_rect)
        assert 0.0 == test_vector.x
        assert 0.0 == test_vector.y
        
    def test_vector_in_rect_integration():
        test_rect = rectangle_from(0.0, 0.0, 100.0, 100.0)
        test_vector_inside = vector_to(50.0, 50.0)
        test_vector_outside = vector_to(150.0, 150.0)
        assert vector_in_rect(test_vector_inside, test_rect)
        assert not vector_in_rect(test_vector_outside, test_rect)
        
    def test_vector_invert_integration():
        test_vector = vector_to(3.0, 4.0)
        inverted_vector = vector_invert(test_vector)
        assert -3.0 == inverted_vector.x
        assert -4.0 == inverted_vector.y
        
    def test_vector_limit_integration():
        test_vector = vector_to(6.0, 8.0)
        limited_vector = vector_limit(test_vector, 5.0)
        assert abs(3.0 - limited_vector.x) <= 2
        assert 4.0 == limited_vector.y
        
    def test_vector_magnitude_integration():
        test_vector = vector_to(3.0, 4.0)
        assert 5.0 == vector_magnitude(test_vector)
        
    def test_vector_magnitude_squared_integration():
        test_vector = vector_to(3.0, 4.0)
        assert 25.0 == vector_magnitude_squared(test_vector)
        
    def test_vector_multiply_integration():
        test_vector = vector_to(3.0, 4.0)
        result_vector = vector_multiply(test_vector, 2.0)
        assert 6.0 == result_vector.x
        assert 8.0 == result_vector.y
        
    def test_vector_normal_integration():
        test_vector = vector_to(3.0, 4.0)
        normal_vector = vector_normal(test_vector)
        assert abs(-0.8 - normal_vector.x) <= 2.0
        assert abs(0.6 - normal_vector.y) <= 2.0
        
    def test_vector_out_of_circle_from_circle_integration():
        test_circle_src = circle_at_from_points(0.0, 0.0, 5.0)
        test_circle_bounds = circle_at_from_points(8.0, 0.0, 5.0)
        test_velocity = vector_to(1.0, 0.0)
        result_vector = vector_out_of_circle_from_circle(test_circle_src, test_circle_bounds, test_velocity)
        assert abs(-3.42 - result_vector.x) <= 2.0
        assert 0.0 == result_vector.y
        
    def test_vector_out_of_circle_from_point_integration():
        test_point = point_at(100.0, 100.0)
        test_circle = circle_at_from_points(100.0, 100.0, 10.0)
        test_velocity = vector_to(1.0, 0.0)
        result_vector = vector_out_of_circle_from_point(test_point, test_circle, test_velocity)
        assert abs(-11.42 - result_vector.x) <= 2.0
        assert 0.0 == result_vector.y
        
    def test_vector_out_of_rect_from_circle_integration():
        test_circle = circle_at_from_points(75.0, 75.0, 25.0)
        test_rect = rectangle_from(0.0, 0.0, 100.0, 100.0)
        test_velocity = vector_to(1.0, 0.0)
        result_vector = vector_out_of_rect_from_circle(test_circle, test_rect, test_velocity)
        assert -101.42 == result_vector.x
        assert 0.0 == result_vector.y
        
    def test_vector_out_of_rect_from_point_integration():
        test_point = point_at(75.0, 75.0)
        test_rect = rectangle_from(0.0, 0.0, 100.0, 100.0)
        test_velocity = vector_to(1.0, 0.0)
        result_vector = vector_out_of_rect_from_point(test_point, test_rect, test_velocity)
        assert abs(-76.4 - result_vector.x) <= 2.0
        assert 0.0 == result_vector.y
        
    def test_vector_out_of_rect_from_rect_integration():
        test_src_rect = rectangle_from(75.0, 75.0, 50.0, 50.0)
        test_bounds_rect = rectangle_from(0.0, 0.0, 100.0, 100.0)
        test_velocity = vector_to(1.0, 0.0)
        result_vector = vector_out_of_rect_from_rect(test_src_rect, test_bounds_rect, test_velocity)
        assert -126.0 == result_vector.x
        assert 0.0 == result_vector.y
        
    def test_vector_point_to_point_integration():
        test_start_point = point_at(0.0, 0.0)
        test_end_point = point_at(3.0, 4.0)
        result_vector = vector_point_to_point(test_start_point, test_end_point)
        assert 3.0 == result_vector.x
        assert 4.0 == result_vector.y
        
    def test_vector_subtract_integration():
        test_vector1 = vector_to(3.0, 4.0)
        test_vector2 = vector_to(1.0, 1.0)
        result_vector = vector_subtract(test_vector1, test_vector2)
        assert 2.0 == result_vector.x
        assert 3.0 == result_vector.y
        
    def test_vector_to_point_integration():
        test_point = point_at(3.0, 4.0)
        result_vector = vector_to_point(test_point)
        assert 3.0 == result_vector.x
        assert 4.0 == result_vector.y
        
    def test_vector_to_integration():
        test_vector = vector_to(3.0, 4.0)
        assert 3.0 == test_vector.x
        assert 4.0 == test_vector.y
        
    def test_vector_to_string_integration():
        test_vector = vector_to(3.0, 4.0)
        assert "Vec -> 3.000000:4.000000" == vector_to_string(test_vector)
        
    def test_vectors_equal_integration():
        test_vector1 = vector_to(3.0, 4.0)
        test_vector2 = vector_to(3.0, 4.0)
        test_vector3 = vector_to(3.0, 5.0)
        assert vectors_equal(test_vector1, test_vector2)
        assert not vectors_equal(test_vector1, test_vector3)
        
    def test_vectors_not_equal_integration():
        test_vector1 = vector_to(3.0, 4.0)
        test_vector2 = vector_to(3.0, 4.0)
        test_vector3 = vector_to(3.0, 5.0)
        assert not vectors_not_equal(test_vector1, test_vector2)
        assert vectors_not_equal(test_vector1, test_vector3)
        
