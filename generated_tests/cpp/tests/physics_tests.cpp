#include "splashkit.h"
#include <catch2/catch.hpp>

TEST_CASE("bitmap_circle_collision_at_point_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
    auto test_circle = circle_at(150.0, 150.0, 50.0);
    auto test_point = point_at(100.0, 100.0);
    REQUIRE(bitmap_circle_collision(test_bitmap, test_point, test_circle));
    free_bitmap(test_bitmap);
    close_window(test_window);
}
TEST_CASE("bitmap_circle_collision_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
    auto test_circle = circle_at(150.0, 150.0, 50.0);
    auto collision_result = bitmap_circle_collision(test_bitmap, 100.0, 100.0, test_circle);
    REQUIRE(collision_result);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
TEST_CASE("bitmap_circle_collision_for_cell_with_translation_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
    clear_bitmap(test_bitmap, color_black());
    auto test_circle = circle_at(150.0, 150.0, 50.0);
    auto test_translation = translation_matrix(100.0, 100.0);
    auto collision_result = bitmap_circle_collision(test_bitmap, 0, test_translation, test_circle);
    REQUIRE(collision_result);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
TEST_CASE("bitmap_circle_collision_for_cell_at_point_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
    auto test_circle = circle_at(150.0, 150.0, 50.0);
    auto test_point = point_at(100.0, 100.0);
    REQUIRE(bitmap_circle_collision(test_bitmap, 0, test_point, test_circle));
    free_bitmap(test_bitmap);
    close_window(test_window);
}
TEST_CASE("bitmap_circle_collision_for_cell_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
    auto test_circle = circle_at(150.0, 150.0, 50.0);
    auto collision_result = bitmap_circle_collision(test_bitmap, 0, 100.0, 100.0, test_circle);
    REQUIRE(collision_result);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
TEST_CASE("bitmap_collision_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_bitmap1 = create_bitmap("test_bitmap1", 100, 100);
    auto test_bitmap2 = create_bitmap("test_bitmap2", 100, 100);
    auto collision_result = bitmap_collision(test_bitmap1, 0, 0, test_bitmap2, 50, 50);
    REQUIRE(collision_result);
    auto collision_result = bitmap_collision(test_bitmap1, 0, 0, test_bitmap2, 200, 200);
    REQUIRE_FALSE(collision_result);
    free_all_bitmaps();
    close_window(test_window);
}
TEST_CASE("bitmap_collision_at_points_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_bitmap1 = create_bitmap("test_bitmap1", 100, 100);
    auto test_bitmap2 = create_bitmap("test_bitmap2", 100, 100);
    auto test_point1 = point_at(0, 0);
    auto test_point2 = point_at(50, 50);
    auto collision_result = bitmap_collision(test_bitmap1, test_point1, test_bitmap2, test_point2);
    REQUIRE(collision_result);
    free_all_bitmaps();
    close_window(test_window);
}
TEST_CASE("bitmap_collision_for_cells_with_translations_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_bitmap1 = create_bitmap("test_bitmap1", 100, 100);
    auto test_bitmap2 = create_bitmap("test_bitmap2", 100, 100);
    setup_collision_mask(test_bitmap1);
    setup_collision_mask(test_bitmap2);
    auto matrix1 = translation_matrix(0, 0);
    auto matrix2 = translation_matrix(50, 50);
    auto collision_result = bitmap_collision(test_bitmap1, 0, matrix1, test_bitmap2, 0, matrix2);
    REQUIRE(collision_result);
    free_bitmap(test_bitmap1);
    free_bitmap(test_bitmap2);
    close_window(test_window);
}
TEST_CASE("bitmap_collision_for_cells_at_points_integration") {
    auto test_window = open_window("Collision Test", 800, 600);
    auto test_bitmap1 = create_bitmap("test_bitmap1", 50, 50);
    auto test_bitmap2 = create_bitmap("test_bitmap2", 50, 50);
    auto test_point1 = point_at(100.0, 100.0);
    auto test_point2 = point_at(125.0, 125.0);
    auto collision_result = bitmap_collision(test_bitmap1, 0, test_point1, test_bitmap2, 0, test_point2);
    REQUIRE(collision_result);
    free_all_bitmaps();
    close_window(test_window);
}
TEST_CASE("bitmap_collision_for_cells_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_bitmap1 = create_bitmap("test_bitmap1", 100, 100);
    auto test_bitmap2 = create_bitmap("test_bitmap2", 100, 100);
    auto collision_result = bitmap_collision(test_bitmap1, 0, 100.0, 100.0, test_bitmap2, 0, 150.0, 100.0);
    REQUIRE_FALSE(collision_result);
    auto collision_result = bitmap_collision(test_bitmap1, 0, 100.0, 100.0, test_bitmap2, 0, 100.0, 100.0);
    REQUIRE(collision_result);
    free_all_bitmaps();
    close_window(test_window);
}
TEST_CASE("bitmap_point_collision_with_translation_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
    clear_bitmap(test_bitmap, color_black());
    auto test_translation = translation_matrix(100, 100);
    auto test_point = point_at(150, 150);
    auto collision_result = bitmap_point_collision(test_bitmap, test_translation, test_point);
    REQUIRE(collision_result);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
TEST_CASE("bitmap_point_collision_at_point_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
    auto test_bmp_pt = point_at(50, 50);
    auto test_pt = point_at(50, 50);
    auto collision_result = bitmap_point_collision(test_bitmap, test_bmp_pt, test_pt);
    REQUIRE(collision_result);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
TEST_CASE("bitmap_point_collision_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
    clear_bitmap(test_bitmap, color_black());
    auto collision_result = bitmap_point_collision(test_bitmap, 0.0, 0.0, 50.0, 50.0);
    REQUIRE(collision_result);
    auto collision_result = bitmap_point_collision(test_bitmap, 0.0, 0.0, 150.0, 150.0);
    REQUIRE_FALSE(collision_result);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
TEST_CASE("bitmap_point_collision_for_cell_with_translation_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
    auto test_translation = translation_matrix(100.0, 100.0);
    auto test_point = point_at(150.0, 150.0);
    auto collision_result = bitmap_point_collision(test_bitmap, 0, test_translation, test_point);
    REQUIRE(collision_result);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
TEST_CASE("bitmap_point_collision_for_cell_at_point_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
    auto test_point = point_at(100, 100);
    auto collision_result = bitmap_point_collision(test_bitmap, 0, test_point, test_point);
    REQUIRE(collision_result);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
TEST_CASE("bitmap_point_collision_for_cell_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
    auto collision_result = bitmap_point_collision(test_bitmap, 0, 100.0, 100.0, 100.0, 100.0);
    REQUIRE(collision_result);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
TEST_CASE("bitmap_rectangle_collision_at_point_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
    auto test_rectangle = rectangle_from(50.0, 50.0, 100.0, 100.0);
    auto test_point = point_at(100.0, 100.0);
    auto collision_result = bitmap_rectangle_collision(test_bitmap, test_point, test_rectangle);
    REQUIRE(collision_result);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
TEST_CASE("bitmap_rectangle_collision_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
    auto test_rectangle = rectangle_from(50.0, 50.0, 100.0, 100.0);
    auto collision_result = bitmap_rectangle_collision(test_bitmap, 0.0, 0.0, test_rectangle);
    REQUIRE(collision_result);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
TEST_CASE("bitmap_rectangle_collision_for_cell_with_translation_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
    auto test_rectangle = rectangle_from(150.0, 150.0, 50.0, 50.0);
    auto test_translation = translation_matrix(100.0, 100.0);
    REQUIRE(bitmap_rectangle_collision(test_bitmap, 0, test_translation, test_rectangle));
    free_bitmap(test_bitmap);
    close_window(test_window);
}
TEST_CASE("bitmap_rectangle_collision_for_cell_at_point_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
    auto test_rectangle = rectangle_from(100.0, 100.0, 50.0, 50.0);
    auto test_point = point_at(100.0, 100.0);
    auto collision_result = bitmap_rectangle_collision(test_bitmap, 0, test_point, test_rectangle);
    REQUIRE(collision_result);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
TEST_CASE("bitmap_rectangle_collision_for_cell_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
    auto test_rectangle = rectangle_from(50.0, 50.0, 100.0, 100.0);
    auto collision_result = bitmap_rectangle_collision(test_bitmap, 0, 50.0, 50.0, test_rectangle);
    REQUIRE(collision_result);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
TEST_CASE("sprite_bitmap_collision_integration") {
    auto test_window = open_window("Collision Test", 800, 600);
    auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
    auto test_sprite = create_sprite(test_bitmap);
    auto collision_result = sprite_bitmap_collision(test_sprite, test_bitmap, 100.0, 100.0);
    REQUIRE(collision_result);
    auto collision_result = sprite_bitmap_collision(test_sprite, test_bitmap, 200.0, 200.0);
    REQUIRE_FALSE(collision_result);
    free_all_sprites();
    free_all_bitmaps();
    close_window(test_window);
}
TEST_CASE("sprite_bitmap_collision_with_cell_at_point_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
    auto test_sprite = create_sprite(test_bitmap);
    auto collision_result = sprite_bitmap_collision(test_sprite, test_bitmap, 0, point_at(50, 50));
    REQUIRE(collision_result);
    free_all_sprites();
    free_bitmap(test_bitmap);
    close_window(test_window);
}
TEST_CASE("sprite_bitmap_collision_with_cell_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
    auto test_sprite = create_sprite(test_bitmap);
    auto collision_result = sprite_bitmap_collision(test_sprite, test_bitmap, 0, 50.0, 50.0);
    REQUIRE(collision_result);
    free_all_sprites();
    free_all_bitmaps();
    close_window(test_window);
}
TEST_CASE("sprite_collision_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_bitmap_1 = create_bitmap("test_bitmap_1", 50, 50);
    auto test_bitmap_2 = create_bitmap("test_bitmap_2", 50, 50);
    auto test_sprite_1 = create_sprite(test_bitmap_1);
    auto test_sprite_2 = create_sprite(test_bitmap_2);
    sprite_set_position(test_sprite_1, point_at(100, 100));
    sprite_set_position(test_sprite_2, point_at(150, 150));
    REQUIRE(sprite_collision(test_sprite_1, test_sprite_2));
    sprite_set_position(test_sprite_2, point_at(200, 200));
    REQUIRE_FALSE(sprite_collision(test_sprite_1, test_sprite_2));
    free_all_sprites();
    free_all_bitmaps();
    close_window(test_window);
}
TEST_CASE("sprite_point_collision_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
    auto test_sprite = create_sprite(test_bitmap);
    auto collision_result = sprite_point_collision(test_sprite, point_at(50, 50));
    REQUIRE(collision_result);
    auto collision_result = sprite_point_collision(test_sprite, point_at(200, 200));
    REQUIRE_FALSE(collision_result);
    free_all_sprites();
    free_bitmap(test_bitmap);
    close_window(test_window);
}
TEST_CASE("sprite_rectangle_collision_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
    auto test_sprite = create_sprite(test_bitmap);
    auto test_rectangle = rectangle_from(50.0, 50.0, 150.0, 150.0);
    auto collision_result = sprite_rectangle_collision(test_sprite, test_rectangle);
    REQUIRE(collision_result);
    free_all_sprites();
    free_bitmap(test_bitmap);
    close_window(test_window);
}
TEST_CASE("apply_matrix_to_quad_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_matrix = identity_matrix();
    auto test_quad = quad_from(point_at(100, 100), point_at(200, 100), point_at(200, 200), point_at(100, 200));
    apply_matrix(test_matrix, test_quad);
    REQUIRE(quad_point == point_at(100, 100));
    close_window(test_window);
}
TEST_CASE("apply_matrix_to_triangle_integration") {
    auto test_triangle = triangle_from(point_at(0.0, 0.0), point_at(1.0, 0.0), point_at(0.0, 1.0));
    auto test_matrix = translation_matrix(1.0, 1.0);
    apply_matrix(test_matrix, test_triangle);
    REQUIRE("Triangle(x1: 1.0, y1: 1.0, x2: 2.0, y2: 1.0, x3: 1.0, y3: 2.0)" == triangle_to_string(test_triangle));
}
TEST_CASE("identity_matrix_integration") {
    auto test_matrix = identity_matrix();
    REQUIRE(1.0 == [test_matrix][0]);
    REQUIRE(1.0 == [test_matrix][1]);
    REQUIRE(0.0 == [test_matrix][1]);
    REQUIRE(0.0 == [test_matrix][0]);
}
TEST_CASE("matrix_inverse_integration") {
    auto test_matrix = identity_matrix();
    auto inverse_matrix = matrix_inverse(test_matrix);
    auto result_matrix = matrix_multiply(test_matrix, inverse_matrix);
    REQUIRE(vectors_equal(vector_to(1.0, 0.0), matrix_multiply(result_matrix, vector_to(1.0, 0.0))));
}
TEST_CASE("matrix_multiply_point_integration") {
    auto test_matrix = identity_matrix();
    auto test_point = point_at(10.0, 20.0);
    auto result_point = matrix_multiply(test_matrix, test_point);
    REQUIRE(10.0 == result_point->x);
    REQUIRE(20.0 == result_point->y);
}
TEST_CASE("matrix_multiply_matrix_integration") {
    auto test_matrix1 = identity_matrix();
    auto test_matrix2 = rotation_matrix(45);
    auto result_matrix = matrix_multiply(test_matrix1, test_matrix2);
    REQUIRE(cosine(45) == [result_matrix][0]);
    REQUIRE(sine(45) == [result_matrix][1]);
}
TEST_CASE("matrix_multiply_vector_integration") {
    auto test_vector = vector_to(1.0, 1.0);
    auto test_matrix = scale_matrix(2.0);
    auto result_vector = matrix_multiply(test_matrix, test_vector);
    REQUIRE(2.0 == result_vector->x);
    REQUIRE(2.0 == result_vector->y);
}
TEST_CASE("matrix_to_string_integration") {
    auto test_matrix = identity_matrix();
    auto test_matrix_string = matrix_to_string(test_matrix);
    REQUIRE("[1, 0, 0, 1, 0, 0]" == test_matrix_string);
}
TEST_CASE("rotation_matrix_integration") {
    auto test_matrix = rotation_matrix(45.0);
    auto test_vector = vector_to(1.0, 0.0);
    auto result_vector = matrix_multiply(test_matrix, test_vector);
    REQUIRE(vector_magnitude(result_vector) >= 0.99 && vector_magnitude(result_vector) <= 1.01);
    REQUIRE(vector_angle(result_vector) >= 44.0 && vector_angle(result_vector) <= 46.0);
}
TEST_CASE("scale_matrix_from_point_integration") {
    auto test_scale = point_at(2.0, 3.0);
    auto test_matrix = scale_matrix(test_scale);
    auto test_vector = vector_to(1.0, 1.0);
    auto result_vector = matrix_multiply(test_matrix, test_vector);
    REQUIRE(2.0 == result_vector->x);
    REQUIRE(3.0 == result_vector->y);
}
TEST_CASE("scale_matrix_from_vector_integration") {
    auto test_scale_vector = vector_to(2.0, 3.0);
    auto test_matrix = scale_matrix(test_scale_vector);
    auto test_vector = vector_to(1.0, 1.0);
    auto result_vector = matrix_multiply(test_matrix, test_vector);
    REQUIRE(2.0 == result_vector->x);
    REQUIRE(3.0 == result_vector->y);
}
TEST_CASE("scale_matrix_integration") {
    auto test_matrix = scale_matrix(2.0);
    auto test_vector = vector_to(1.0, 1.0);
    auto result_vector = matrix_multiply(test_matrix, test_vector);
    REQUIRE(2.0 == result_vector->x);
    REQUIRE(2.0 == result_vector->y);
}
TEST_CASE("scale_rotate_translate_matrix_integration") {
    auto test_scale = point_at(2.0, 3.0);
    auto test_translate = point_at(10.0, 20.0);
    auto test_matrix = scale_rotate_translate_matrix(test_scale, 45.0, test_translate);
    auto test_point = point_at(1.0, 1.0);
    auto result_point = matrix_multiply(test_matrix, test_point);
    REQUIRE(result_point->x >= 10.0 && result_point->x <= 10.1);
    REQUIRE(result_point->y >= 23.0 && result_point->y <= 23.1);
}
TEST_CASE("translation_matrix_to_point_integration") {
    auto test_point = point_at(10.0, 20.0);
    auto test_matrix = translation_matrix(test_point);
    auto test_vector = point_at(5.0, 5.0);
    auto result_point = matrix_multiply(test_matrix, test_vector);
    REQUIRE(15.0 == result_point->x);
    REQUIRE(25.0 == result_point->y);
}
TEST_CASE("translation_matrix_from_vector_integration") {
    auto test_vector = vector_to(10.0, 20.0);
    auto test_matrix = translation_matrix(test_vector);
    auto test_point = point_at(0.0, 0.0);
    auto result_point = matrix_multiply(test_matrix, test_point);
    REQUIRE(10.0 == result_point->x);
    REQUIRE(20.0 == result_point->y);
}
TEST_CASE("translation_matrix_integration") {
    auto test_matrix = translation_matrix(10.0, 20.0);
    auto test_point = point_at(0.0, 0.0);
    auto result_point = matrix_multiply(test_matrix, test_point);
    REQUIRE(10.0 == result_point->x);
    REQUIRE(20.0 == result_point->y);
}
TEST_CASE("angle_between_integration") {
    auto test_vector1 = vector_to(1.0, 0.0);
    auto test_vector2 = vector_to(0.0, 1.0);
    auto test_angle = angle_between(test_vector1, test_vector2);
    REQUIRE(test_angle >= 89.9 && test_angle <= 90.1);
}
TEST_CASE("dot_product_integration") {
    auto test_vector1 = vector_to(3.0, 4.0);
    auto test_vector2 = vector_to(1.0, 2.0);
    auto test_result = dot_product(test_vector1, test_vector2);
    REQUIRE(11.0 == test_result);
}
TEST_CASE("is_zero_vector_integration") {
    auto test_zero_vector = vector_to(0.0, 0.0);
    auto test_non_zero_vector = vector_to(1.0, 1.0);
    REQUIRE(is_zero_vector(test_zero_vector));
    REQUIRE_FALSE(is_zero_vector(test_non_zero_vector));
}
TEST_CASE("ray_intersection_point_integration") {
    auto test_from_pt = point_at(0.0, 0.0);
    auto test_heading = vector_to(1.0, 1.0);
    auto test_line = line_from(point_at(0.0, 2.0), point_at(2.0, 0.0));
    auto intersection_result = ray_intersection_point(test_from_pt, test_heading, test_line, point_at(0.0, 0.0));
    REQUIRE(intersection_result);
}
TEST_CASE("unit_vector_integration") {
    auto test_vector = vector_to(3.0, 4.0);
    auto test_unit_vector = unit_vector(test_vector);
    REQUIRE(1.0 == vector_magnitude(test_unit_vector));
    REQUIRE(vector_angle(test_vector) == vector_angle(test_unit_vector));
}
TEST_CASE("vector_add_integration") {
    auto test_vector1 = vector_to(1.0, 2.0);
    auto test_vector2 = vector_to(3.0, 4.0);
    auto result_vector = vector_add(test_vector1, test_vector2);
    REQUIRE(4.0 == result_vector->x);
    REQUIRE(6.0 == result_vector->y);
}
TEST_CASE("vector_angle_integration") {
    auto test_vector = vector_to(1.0, 1.0);
    auto test_angle = vector_angle(test_vector);
    REQUIRE(test_angle >= 45.0 && test_angle <= 45.001);
}
TEST_CASE("vector_from_angle_integration") {
    auto test_vector = vector_from_angle(45.0, 1.0);
    REQUIRE(vector_magnitude(test_vector) >= 0.99 && vector_magnitude(test_vector) <= 1.01);
    REQUIRE(vector_angle(test_vector) >= 44.0 && vector_angle(test_vector) <= 46.0);
}
TEST_CASE("vector_from_line_integration") {
    auto test_line = line_from(point_at(0.0, 0.0), point_at(10.0, 10.0));
    auto test_vector = vector_from_line(test_line);
    REQUIRE(10.0 == test_vector->x);
    REQUIRE(10.0 == test_vector->y);
}
TEST_CASE("vector_from_point_to_rect_integration") {
    auto test_rect = rectangle_from(0.0, 0.0, 100.0, 100.0);
    auto test_point = point_at(50.0, 50.0);
    auto test_vector = vector_from_point_to_rect(test_point, test_rect);
    REQUIRE(0.0 == vector_magnitude(test_vector));
}
TEST_CASE("vector_in_rect_integration") {
    auto test_rect = rectangle_from(0.0, 0.0, 100.0, 100.0);
    auto test_vector_inside = vector_to(50.0, 50.0);
    auto test_vector_outside = vector_to(150.0, 150.0);
    REQUIRE(vector_in_rect(test_vector_inside, test_rect));
    REQUIRE_FALSE(vector_in_rect(test_vector_outside, test_rect));
}
TEST_CASE("vector_invert_integration") {
    auto test_vector = vector_to(3.0, 4.0);
    auto inverted_vector = vector_invert(test_vector);
    REQUIRE(inverted_vector == vector_to(-3.0, -4.0));
}
TEST_CASE("vector_limit_integration") {
    auto test_vector = vector_to(3.0, 4.0);
    auto limited_vector = vector_limit(test_vector, 5.0);
    REQUIRE(vector_magnitude(limited_vector) <= 5.0);
    REQUIRE(vectors_equal(test_vector, limited_vector));
}
TEST_CASE("vector_magnitude_integration") {
    auto test_vector = vector_to(3.0, 4.0);
    auto test_magnitude = vector_magnitude(test_vector);
    REQUIRE(5.0 == test_magnitude);
}
TEST_CASE("vector_magnitude_squared_integration") {
    auto test_vector = vector_to(3.0, 4.0);
    auto result = vector_magnitude_squared(test_vector);
    REQUIRE(25.0 == result);
}
TEST_CASE("vector_multiply_integration") {
    auto test_vector = vector_to(3.0, 4.0);
    auto result_vector = vector_multiply(test_vector, 2.0);
    REQUIRE(10.0 == vector_magnitude(result_vector));
    REQUIRE(vector_angle(test_vector) == vector_angle(result_vector));
}
TEST_CASE("vector_normal_integration") {
    auto test_vector = vector_to(3.0, 4.0);
    auto normal_vector = vector_normal(test_vector);
    REQUIRE(5.0 == vector_magnitude(normal_vector));
    REQUIRE(53.1301 == vector_angle(normal_vector));
}
TEST_CASE("vector_out_of_circle_from_circle_integration") {
    auto test_circle_src = circle_at(100.0, 100.0, 50.0);
    auto test_circle_bounds = circle_at(150.0, 150.0, 75.0);
    auto test_velocity = vector_to(10.0, 10.0);
    auto test_result_vector = vector_out_of_circle_from_circle(test_circle_src, test_circle_bounds, test_velocity);
    REQUIRE(vector_magnitude(test_result_vector) > 0.0);
    REQUIRE(circles_intersect(circle_at(point_offset_by(center_point(test_circle_src), test_result_vector), circle_radius(test_circle_src)), test_circle_bounds));
}
TEST_CASE("vector_out_of_circle_from_point_integration") {
    auto test_point = point_at(100.0, 100.0);
    auto test_circle = circle_at(150.0, 150.0, 50.0);
    auto test_velocity = vector_to(10.0, 10.0);
    auto test_result = vector_out_of_circle_from_point(test_point, test_circle, test_velocity);
    REQUIRE(vector_magnitude(test_result) > 0.0);
}
TEST_CASE("vector_out_of_rect_from_circle_integration") {
    auto test_window = open_window("Test Window", 800, 600);
    auto test_circle = circle_at(100.0, 100.0, 50.0);
    auto test_rectangle = rectangle_from(50.0, 50.0, 200.0, 200.0);
    auto test_velocity = vector_to(10.0, 0.0);
    auto test_result_vector = vector_out_of_rect_from_circle(test_circle, test_rectangle, test_velocity);
    REQUIRE(0.0 != vector_magnitude(test_result_vector));
    close_window(test_window);
}
TEST_CASE("vector_out_of_rect_from_point_integration") {
    auto test_point = point_at(50.0, 50.0);
    auto test_rectangle = rectangle_from(0.0, 0.0, 100.0, 100.0);
    auto test_velocity = vector_to(1.0, 1.0);
    auto result_vector = vector_out_of_rect_from_point(test_point, test_rectangle, test_velocity);
    REQUIRE(point_in_rectangle(point_offset_by(test_point, result_vector), test_rectangle));
}
TEST_CASE("vector_out_of_rect_from_rect_integration") {
    auto test_src_rect = rectangle_from(50.0, 50.0, 100.0, 100.0);
    auto test_bounds_rect = rectangle_from(0.0, 0.0, 200.0, 200.0);
    auto test_velocity = vector_to(10.0, 10.0);
    auto test_result_vector = vector_out_of_rect_from_rect(test_src_rect, test_bounds_rect, test_velocity);
    REQUIRE(0.0 != vector_magnitude(test_result_vector));
}
TEST_CASE("vector_point_to_point_integration") {
    auto test_start_point = point_at(0.0, 0.0);
    auto test_end_point = point_at(3.0, 4.0);
    auto test_vector = vector_point_to_point(test_start_point, test_end_point);
    REQUIRE(test_vector == vector_to(3.0, 4.0));
}
TEST_CASE("vector_subtract_integration") {
    auto test_vector1 = vector_to(3.0, 4.0);
    auto test_vector2 = vector_to(1.0, 1.0);
    auto result_vector = vector_subtract(test_vector1, test_vector2);
    REQUIRE(3.0 == vector_magnitude(result_vector));
    REQUIRE(45.0 == vector_angle(result_vector));
}
TEST_CASE("vector_to_point_integration") {
    auto test_point = point_at(3.0, 4.0);
    auto test_vector = vector_to(test_point);
    REQUIRE(3.0 == test_vector->x);
    REQUIRE(4.0 == test_vector->y);
}
TEST_CASE("vector_to_integration") {
    auto test_vector = vector_to(3.0, 4.0);
    REQUIRE(5.0 == vector_magnitude(test_vector));
    REQUIRE(53.1301 == vector_angle(test_vector));
}
TEST_CASE("vector_to_string_integration") {
    auto test_vector = vector_to(3.0, 4.0);
    auto test_string = vector_to_string(test_vector);
    REQUIRE("Vector(3.0, 4.0)" == test_string);
}
TEST_CASE("vectors_equal_integration") {
    auto test_vector1 = vector_to(1.0, 1.0);
    auto test_vector2 = vector_to(1.0, 1.0);
    REQUIRE(vectors_equal(test_vector1, test_vector2));
    auto test_vector3 = vector_to(1.0, 2.0);
    REQUIRE_FALSE(vectors_equal(test_vector1, test_vector3));
}
TEST_CASE("vectors_not_equal_integration") {
    auto test_vector1 = vector_to(1.0, 1.0);
    auto test_vector2 = vector_to(1.0, 1.0);
    REQUIRE_FALSE(vectors_not_equal(test_vector1, test_vector2));
    auto test_vector3 = vector_to(1.0, 2.0);
    REQUIRE(vectors_not_equal(test_vector1, test_vector3));
}
