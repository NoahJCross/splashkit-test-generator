#include "splashkit.h"
#include <catch2/catch.hpp>

class TestPhysics {
public:
    TEST_CASE("bitmap_circle_collision_at_point_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
        clear_bitmap(test_bitmap, color_black());
        setup_collision_mask(test_bitmap);
        auto test_circle = circle_at(150.0, 150.0, 50.0);
        auto test_point = point_at(100.0, 100.0);
        REQUIRE(bitmap_circle_collision(test_bitmap, test_point, test_circle));
        free_bitmap(test_bitmap);
        close_window(test_window);
    }
    TEST_CASE("bitmap_circle_collision_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
        clear_bitmap(test_bitmap, color_black());
        setup_collision_mask(test_bitmap);
        auto test_circle = circle_at(150.0, 150.0, 50.0);
        REQUIRE(bitmap_circle_collision(test_bitmap, 100.0, 100.0, test_circle));
        free_bitmap(test_bitmap);
        close_window(test_window);
    }
    TEST_CASE("bitmap_circle_collision_for_cell_with_translation_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
        clear_bitmap(test_bitmap, color_black());
        setup_collision_mask(test_bitmap);
        auto test_circle = circle_at(150.0, 150.0, 50.0);
        auto test_translation = translation_matrix(100.0, 100.0);
        REQUIRE(bitmap_circle_collision(test_bitmap, 0, test_translation, test_circle));
        free_bitmap(test_bitmap);
        close_window(test_window);
    }
    TEST_CASE("bitmap_circle_collision_for_cell_at_point_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
        clear_bitmap(test_bitmap, color_black());
        setup_collision_mask(test_bitmap);
        auto test_circle = circle_at(150.0, 150.0, 50.0);
        auto test_point = point_at(100.0, 100.0);
        REQUIRE(bitmap_circle_collision(test_bitmap, 0, test_point, test_circle));
        free_bitmap(test_bitmap);
        close_window(test_window);
    }
    TEST_CASE("bitmap_circle_collision_for_cell_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
        clear_bitmap(test_bitmap, color_black());
        setup_collision_mask(test_bitmap);
        auto test_circle = circle_at(150.0, 150.0, 50.0);
        REQUIRE(bitmap_circle_collision(test_bitmap, 0, 100.0, 100.0, test_circle));
        free_bitmap(test_bitmap);
        close_window(test_window);
    }
    TEST_CASE("bitmap_collision_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        auto test_bitmap1 = create_bitmap("test_bitmap1", 100, 100);
        auto test_bitmap2 = create_bitmap("test_bitmap2", 100, 100);
        clear_bitmap(test_bitmap1, color_black());
        setup_collision_mask(test_bitmap1);
        clear_bitmap(test_bitmap2, color_black());
        setup_collision_mask(test_bitmap2);
        REQUIRE(bitmap_collision(test_bitmap1, 0, 0.0, 0.0, test_bitmap2, 0, 50.0, 50.0));
        REQUIRE_FALSE(bitmap_collision(test_bitmap1, 0, 0.0, 0.0, test_bitmap2, 0, 200.0, 200.0));
        free_all_bitmaps();
        close_window(test_window);
    }
    TEST_CASE("bitmap_collision_at_points_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        auto test_bitmap1 = create_bitmap("test_bitmap1", 100, 100);
        auto test_bitmap2 = create_bitmap("test_bitmap2", 100, 100);
        clear_bitmap(test_bitmap1, color_black());
        setup_collision_mask(test_bitmap1);
        clear_bitmap(test_bitmap2, color_black());
        setup_collision_mask(test_bitmap2);
        auto test_point1 = point_at(0.0, 0.0);
        auto test_point2 = point_at(50.0, 50.0);
        REQUIRE(bitmap_collision(test_bitmap1, test_point1, test_bitmap2, test_point2));
        free_all_bitmaps();
        close_window(test_window);
    }
    TEST_CASE("bitmap_collision_for_cells_with_translations_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        auto test_bitmap1 = create_bitmap("test_bitmap1", 100, 100);
        auto test_bitmap2 = create_bitmap("test_bitmap2", 100, 100);
        clear_bitmap(test_bitmap1, color_black());
        setup_collision_mask(test_bitmap1);
        clear_bitmap(test_bitmap2, color_black());
        setup_collision_mask(test_bitmap2);
        auto matrix1 = translation_matrix(0.0, 0.0);
        auto matrix2 = translation_matrix(50.0, 50.0);
        REQUIRE(bitmap_collision(test_bitmap1, 0, matrix1, test_bitmap2, 0, matrix2));
        free_all_bitmaps();
        close_window(test_window);
    }
    TEST_CASE("bitmap_collision_for_cells_at_points_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        auto test_bitmap1 = create_bitmap("test_bitmap1", 50, 50);
        auto test_bitmap2 = create_bitmap("test_bitmap2", 50, 50);
        clear_bitmap(test_bitmap1, color_black());
        setup_collision_mask(test_bitmap1);
        clear_bitmap(test_bitmap2, color_black());
        setup_collision_mask(test_bitmap2);
        auto test_point1 = point_at(100.0, 100.0);
        auto test_point2 = point_at(125.0, 125.0);
        REQUIRE(bitmap_collision(test_bitmap1, 0, test_point1, test_bitmap2, 0, test_point2));
        free_all_bitmaps();
        close_window(test_window);
    }
    TEST_CASE("bitmap_collision_for_cells_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        auto test_bitmap1 = create_bitmap("test_bitmap1", 100, 100);
        auto test_bitmap2 = create_bitmap("test_bitmap2", 100, 100);
        clear_bitmap(test_bitmap1, color_black());
        clear_bitmap(test_bitmap2, color_black());
        setup_collision_mask(test_bitmap1);
        setup_collision_mask(test_bitmap2);
        REQUIRE_FALSE(bitmap_collision(test_bitmap1, 0, 100.0, 100.0, test_bitmap2, 0, 200.0, 100.0));
        REQUIRE(bitmap_collision(test_bitmap1, 0, 100.0, 100.0, test_bitmap2, 0, 150.0, 100.0));
        free_all_bitmaps();
        close_window(test_window);
    }
    TEST_CASE("bitmap_point_collision_with_translation_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
        clear_bitmap(test_bitmap, color_black());
        setup_collision_mask(test_bitmap);
        auto test_translation = translation_matrix(100.0, 100.0);
        auto test_point = point_at(150.0, 150.0);
        REQUIRE(bitmap_point_collision(test_bitmap, test_translation, test_point));
        free_bitmap(test_bitmap);
        close_window(test_window);
    }
    TEST_CASE("bitmap_point_collision_at_point_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
        clear_bitmap(test_bitmap, color_black());
        setup_collision_mask(test_bitmap);
        auto test_bmp_point = point_at(50.0, 50.0);
        auto test_point = point_at(75.0, 75.0);
        REQUIRE(bitmap_point_collision(test_bitmap, test_bmp_point, test_point));
        free_bitmap(test_bitmap);
        close_window(test_window);
    }
    TEST_CASE("bitmap_point_collision_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
        clear_bitmap(test_bitmap, color_black());
        setup_collision_mask(test_bitmap);
        REQUIRE(bitmap_point_collision(test_bitmap, 0.0, 0.0, 50.0, 50.0));
        REQUIRE_FALSE(bitmap_point_collision(test_bitmap, 0.0, 0.0, 150.0, 150.0));
        free_bitmap(test_bitmap);
        close_window(test_window);
    }
    TEST_CASE("bitmap_point_collision_for_cell_with_translation_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
        clear_bitmap(test_bitmap, color_black());
        setup_collision_mask(test_bitmap);
        auto test_translation = translation_matrix(100.0, 100.0);
        auto test_point = point_at(150.0, 150.0);
        REQUIRE(bitmap_point_collision(test_bitmap, 0, test_translation, test_point));
        free_bitmap(test_bitmap);
        close_window(test_window);
    }
    TEST_CASE("bitmap_point_collision_for_cell_at_point_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
        clear_bitmap(test_bitmap, color_black());
        setup_collision_mask(test_bitmap);
        REQUIRE(bitmap_point_collision(test_bitmap, 0, 50.0, 50.0, 50.0, 50.0));
        free_bitmap(test_bitmap);
        close_window(test_window);
    }
    TEST_CASE("bitmap_point_collision_for_cell_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
        clear_bitmap(test_bitmap, color_black());
        draw_pixel(color_white(), 50, 50, option_draw_to(test_bitmap));
        setup_collision_mask(test_bitmap);
        REQUIRE(bitmap_point_collision(test_bitmap, 0, 0.0, 0.0, 50.0, 50.0));
        free_bitmap(test_bitmap);
        close_window(test_window);
    }
    TEST_CASE("bitmap_rectangle_collision_at_point_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
        clear_bitmap(test_bitmap, color_black());
        setup_collision_mask(test_bitmap);
        auto test_rectangle = rectangle_from(50.0, 50.0, 100.0, 100.0);
        auto test_point = point_at(100.0, 100.0);
        REQUIRE(bitmap_rectangle_collision(test_bitmap, test_point, test_rectangle));
        free_bitmap(test_bitmap);
        close_window(test_window);
    }
    TEST_CASE("bitmap_rectangle_collision_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
        clear_bitmap(test_bitmap, color_black());
        setup_collision_mask(test_bitmap);
        auto test_rectangle = rectangle_from(50.0, 50.0, 100.0, 100.0);
        REQUIRE(bitmap_rectangle_collision(test_bitmap, 0.0, 0.0, test_rectangle));
        free_bitmap(test_bitmap);
        close_window(test_window);
    }
    TEST_CASE("bitmap_rectangle_collision_for_cell_with_translation_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
        clear_bitmap(test_bitmap, color_black());
        setup_collision_mask(test_bitmap);
        auto test_rectangle = rectangle_from(150.0, 150.0, 50.0, 50.0);
        auto test_translation = translation_matrix(100.0, 100.0);
        REQUIRE(bitmap_rectangle_collision(test_bitmap, 0, test_translation, test_rectangle));
        free_bitmap(test_bitmap);
        close_window(test_window);
    }
    TEST_CASE("bitmap_rectangle_collision_for_cell_at_point_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
        clear_bitmap(test_bitmap, color_black());
        setup_collision_mask(test_bitmap);
        auto test_rectangle = rectangle_from(100.0, 100.0, 50.0, 50.0);
        auto test_point = point_at(100.0, 100.0);
        REQUIRE(bitmap_rectangle_collision(test_bitmap, 0, test_point, test_rectangle));
        free_bitmap(test_bitmap);
        close_window(test_window);
    }
    TEST_CASE("bitmap_rectangle_collision_for_cell_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
        clear_bitmap(test_bitmap, color_black());
        setup_collision_mask(test_bitmap);
        auto test_rectangle = rectangle_from(50.0, 50.0, 100.0, 100.0);
        REQUIRE(bitmap_rectangle_collision(test_bitmap, 0, 50.0, 50.0, test_rectangle));
        free_bitmap(test_bitmap);
        close_window(test_window);
    }
    TEST_CASE("sprite_bitmap_collision_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
        clear_bitmap(test_bitmap, color_black());
        setup_collision_mask(test_bitmap);
        auto test_sprite = create_sprite(test_bitmap);
        sprite_set_collision_kind(test_sprite, CollisionTestKind::PIXEL_COLLISIONS);
        sprite_set_position(test_sprite, point_at(100.0, 100.0));
        REQUIRE(sprite_bitmap_collision(test_sprite, test_bitmap, 100.0, 100.0));
        REQUIRE_FALSE(sprite_bitmap_collision(test_sprite, test_bitmap, 200.0, 200.0));
        free_all_sprites();
        free_all_bitmaps();
        close_window(test_window);
    }
    TEST_CASE("sprite_bitmap_collision_with_cell_at_point_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
        clear_bitmap(test_bitmap, color_black());
        setup_collision_mask(test_bitmap);
        auto test_sprite = create_sprite(test_bitmap);
        sprite_set_collision_kind(test_sprite, CollisionTestKind::PIXEL_COLLISIONS);
        sprite_set_position(test_sprite, point_at(50.0, 50.0));
        REQUIRE(sprite_bitmap_collision(test_sprite, test_bitmap, 0, point_at(50.0, 50.0)));
        free_all_sprites();
        free_bitmap(test_bitmap);
        close_window(test_window);
    }
    TEST_CASE("sprite_bitmap_collision_with_cell_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
        clear_bitmap(test_bitmap, color_black());
        setup_collision_mask(test_bitmap);
        auto test_sprite = create_sprite(test_bitmap);
        sprite_set_collision_kind(test_sprite, CollisionTestKind::PIXEL_COLLISIONS);
        sprite_set_position(test_sprite, point_at(50.0, 50.0));
        REQUIRE(sprite_bitmap_collision(test_sprite, test_bitmap, 0, 50.0, 50.0));
        free_all_sprites();
        free_all_bitmaps();
        close_window(test_window);
    }
    TEST_CASE("sprite_collision_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        auto test_bitmap1 = create_bitmap("test_bitmap_1", 50, 50);
        auto test_bitmap2 = create_bitmap("test_bitmap_2", 50, 50);
        clear_bitmap(test_bitmap1, color_black());
        setup_collision_mask(test_bitmap1);
        clear_bitmap(test_bitmap2, color_black());
        setup_collision_mask(test_bitmap2);
        auto test_sprite1 = create_sprite(test_bitmap1);
        auto test_sprite2 = create_sprite(test_bitmap2);
        sprite_set_collision_kind(test_sprite1, CollisionTestKind::PIXEL_COLLISIONS);
        sprite_set_collision_kind(test_sprite2, CollisionTestKind::PIXEL_COLLISIONS);
        sprite_set_position(test_sprite1, point_at(100.0, 100.0));
        sprite_set_position(test_sprite2, point_at(100.0, 100.0));
        REQUIRE(sprite_collision(test_sprite1, test_sprite2));
        sprite_set_position(test_sprite2, point_at(200.0, 200.0));
        REQUIRE_FALSE(sprite_collision(test_sprite1, test_sprite2));
        free_all_sprites();
        free_all_bitmaps();
        close_window(test_window);
    }
    TEST_CASE("sprite_point_collision_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
        clear_bitmap(test_bitmap, color_black());
        setup_collision_mask(test_bitmap);
        auto test_sprite = create_sprite(test_bitmap);
        sprite_set_collision_kind(test_sprite, CollisionTestKind::PIXEL_COLLISIONS);
        REQUIRE(sprite_point_collision(test_sprite, point_at(75.0, 75.0)));
        REQUIRE_FALSE(sprite_point_collision(test_sprite, point_at(200.0, 200.0)));
        free_all_sprites();
        free_bitmap(test_bitmap);
        close_window(test_window);
    }
    TEST_CASE("sprite_rectangle_collision_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        auto test_bitmap = create_bitmap("test_bitmap", 100, 100);
        clear_bitmap(test_bitmap, color_black());
        setup_collision_mask(test_bitmap);
        auto test_sprite = create_sprite(test_bitmap);
        sprite_set_collision_kind(test_sprite, CollisionTestKind::PIXEL_COLLISIONS);
        auto test_rectangle = rectangle_from(0.0, 0.0, 100.0, 100.0);
        REQUIRE(sprite_rectangle_collision(test_sprite, test_rectangle));
        free_all_sprites();
        free_bitmap(test_bitmap);
        close_window(test_window);
    }
    TEST_CASE("apply_matrix_to_quad_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        auto test_matrix = identity_matrix();
        auto test_quad = quad_from(point_at(100.0, 100.0), point_at(200.0, 100.0), point_at(200.0, 200.0), point_at(100.0, 200.0));
        apply_matrix(test_matrix, &test_quad);
        REQUIRE(100.0 == test_quad->points[0]->x);
        REQUIRE(100.0 == test_quad->points[0]->y);
        close_window(test_window);
    }
    TEST_CASE("apply_matrix_to_triangle_integration") {
        auto test_triangle = triangle_from(point_at(0.0, 0.0), point_at(1.0, 0.0), point_at(0.0, 1.0));
        auto test_matrix = translation_matrix(1.0, 1.0);
        apply_matrix(test_matrix, &test_triangle);
        REQUIRE(1.0 == test_triangle->points[0]->x);
        REQUIRE(1.0 == test_triangle->points[0]->y);
    }
    TEST_CASE("identity_matrix_integration") {
        auto test_matrix = identity_matrix();
        REQUIRE(1.0 == test_matrix->Elements[0][0]);
        REQUIRE(1.0 == test_matrix->Elements[1][1]);
        REQUIRE(0.0 == test_matrix->Elements[0][1]);
        REQUIRE(0.0 == test_matrix->Elements[1][0]);
    }
    TEST_CASE("matrix_inverse_integration") {
        auto test_matrix = scale_rotate_translate_matrix(point_at(2.0, 2.0), 45.0, point_at(10.0, 10.0));
        auto inverse_matrix = matrix_inverse(test_matrix);
        auto result_matrix = matrix_multiply(test_matrix, inverse_matrix);
        REQUIRE(1.0 == result_matrix->Elements[0][0]);
        REQUIRE(1.0 == result_matrix->Elements[1][1]);
    }
    TEST_CASE("matrix_multiply_point_integration") {
        auto test_matrix = translation_matrix(10.0, 10.0);
        auto test_point = point_at(10.0, 20.0);
        auto result_point = matrix_multiply(test_matrix, test_point);
        REQUIRE(20.0 == result_point->X);
        REQUIRE(30.0 == result_point->Y);
    }
    TEST_CASE("matrix_multiply_matrix_integration") {
        auto test_matrix1 = scale_matrix(2.0);
        auto test_matrix2 = translation_matrix(10.0, 10.0);
        auto result_matrix = matrix_multiply(test_matrix2, test_matrix1);
        REQUIRE(2.0 == result_matrix->Elements[0][0]);
        REQUIRE(20.0 == result_matrix->Elements[0][2]);
    }
    TEST_CASE("matrix_multiply_vector_integration") {
        auto test_vector = vector_to(2.0, 2.0);
        auto test_matrix = scale_matrix(2.0);
        auto result_vector = matrix_multiply(test_matrix, test_vector);
        REQUIRE(4.0 == result_vector->X);
        REQUIRE(4.0 == result_vector->Y);
    }
    TEST_CASE("matrix_to_string_integration") {
        auto test_matrix = identity_matrix();
        REQUIRE(" ------------------------------\\n|        1         0         0 |\\n|        0         1         0 |\\n|        0         0         1 |\\n ------------------------------" == matrix_to_string(test_matrix));
    }
    TEST_CASE("rotation_matrix_integration") {
        auto test_matrix = rotation_matrix(90.0);
        auto test_point = point_at(1.0, 0.0);
        auto result_point = matrix_multiply(test_matrix, test_point);
        REQUIRE(0 == result_point->X);
        REQUIRE(1 == result_point->Y);
    }
    TEST_CASE("scale_matrix_from_point_integration") {
        auto test_scale = point_at(2.0, 3.0);
        auto test_matrix = scale_matrix(test_scale);
        auto test_point = point_at(1.0, 1.0);
        auto result_point = matrix_multiply(test_matrix, test_point);
        REQUIRE(2.0 == result_point->X);
        REQUIRE(3.0 == result_point->Y);
    }
    TEST_CASE("scale_matrix_from_vector_integration") {
        auto test_scale = vector_to(2.0, 3.0);
        auto test_matrix = scale_matrix(test_scale);
        auto test_point = point_at(1.0, 1.0);
        auto result_point = matrix_multiply(test_matrix, test_point);
        REQUIRE(2.0 == result_point->X);
        REQUIRE(3.0 == result_point->Y);
    }
    TEST_CASE("scale_matrix_integration") {
        auto test_point = point_at(1.0, 1.5);
        auto test_matrix = scale_matrix(2.0);
        auto result_point = matrix_multiply(test_matrix, test_point);
        REQUIRE(2.0 == result_point->x);
        REQUIRE(3.0 == result_point->y);
    }
    TEST_CASE("scale_rotate_translate_matrix_integration") {
        auto test_scale = point_at(2.0, 2.0);
        auto test_translate = point_at(10.0, 10.0);
        auto test_matrix = scale_rotate_translate_matrix(test_scale, 90.0, test_translate);
        auto test_point = point_at(1.0, 0.0);
        auto result_point = matrix_multiply(test_matrix, test_point);
        REQUIRE(10 == result_point->X);
        REQUIRE(11 == result_point->Y);
    }
    TEST_CASE("translation_matrix_to_point_integration") {
        auto test_point = point_at(10.0, 20.0);
        auto test_matrix = translation_matrix(test_point);
        auto test_vector = point_at(5.0, 5.0);
        auto result_point = matrix_multiply(test_matrix, test_vector);
        REQUIRE(15.0 == result_point->X);
        REQUIRE(25.0 == result_point->Y);
    }
    TEST_CASE("translation_matrix_from_vector_integration") {
        auto test_vector = vector_to(10.0, 20.0);
        auto test_matrix = translation_matrix(test_vector);
        auto test_point = point_at(0.0, 0.0);
        auto result_point = matrix_multiply(test_matrix, test_point);
        REQUIRE(10.0 == result_point->X);
        REQUIRE(20.0 == result_point->Y);
    }
    TEST_CASE("translation_matrix_integration") {
        auto test_matrix = translation_matrix(10.0, 20.0);
        auto test_point = point_at(0.0, 0.0);
        auto result_point = matrix_multiply(test_matrix, test_point);
        REQUIRE(10.0 == result_point->X);
        REQUIRE(20.0 == result_point->Y);
    }
    TEST_CASE("angle_between_integration") {
        auto test_vector1 = vector_to(1.0, 0.0);
        auto test_vector2 = vector_to(0.0, 1.0);
        REQUIRE(90.0 == angle_between(test_vector1, test_vector2));
    }
    TEST_CASE("dot_product_integration") {
        auto test_vector1 = vector_to(3.0, 4.0);
        auto test_vector2 = vector_to(1.0, 2.0);
        REQUIRE(11.0 == dot_product(test_vector1, test_vector2));
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
        auto intersection_point = point_at(0.0, 0.0);
        REQUIRE(ray_intersection_point(test_from_pt, test_heading, test_line, &intersection_point));
        REQUIRE(1.0 == intersection_point->X);
        REQUIRE(1.0 == intersection_point->Y);
    }
    TEST_CASE("unit_vector_integration") {
        auto test_vector = vector_to(3.0, 4.0);
        auto test_unit_vector = unit_vector(test_vector);
        REQUIRE(0.6 == test_unit_vector->X);
        REQUIRE(0.8 == test_unit_vector->Y);
    }
    TEST_CASE("vector_add_integration") {
        auto test_vector1 = vector_to(1.0, 2.0);
        auto test_vector2 = vector_to(3.0, 4.0);
        auto result_vector = vector_add(test_vector1, test_vector2);
        REQUIRE(4.0 == result_vector->X);
        REQUIRE(6.0 == result_vector->Y);
    }
    TEST_CASE("vector_angle_integration") {
        auto test_vector = vector_to(1.0, 1.0);
        REQUIRE(45.0 == vector_angle(test_vector));
    }
    TEST_CASE("vector_from_angle_integration") {
        auto test_vector = vector_from_angle(0.0, 1.0);
        REQUIRE(1.0 == test_vector->X);
        REQUIRE(0.0 == test_vector->Y);
    }
    TEST_CASE("vector_from_line_integration") {
        auto test_line = line_from(point_at(0.0, 0.0), point_at(3.0, 4.0));
        auto test_vector = vector_from_line(test_line);
        REQUIRE(3.0 == test_vector->X);
        REQUIRE(4.0 == test_vector->Y);
    }
    TEST_CASE("vector_from_point_to_rect_integration") {
        auto test_rect = rectangle_from(0.0, 0.0, 100.0, 100.0);
        auto test_point = point_at(50.0, 50.0);
        auto test_vector = vector_from_point_to_rect(test_point, test_rect);
        REQUIRE(0.0 == test_vector->X);
        REQUIRE(0.0 == test_vector->Y);
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
        REQUIRE(-3.0 == inverted_vector->X);
        REQUIRE(-4.0 == inverted_vector->Y);
    }
    TEST_CASE("vector_limit_integration") {
        auto test_vector = vector_to(6.0, 8.0);
        auto limited_vector = vector_limit(test_vector, 5.0);
        REQUIRE(3.0 == limited_vector->X);
        REQUIRE(4.0 == limited_vector->Y);
    }
    TEST_CASE("vector_magnitude_integration") {
        auto test_vector = vector_to(3.0, 4.0);
        REQUIRE(5.0 == vector_magnitude(test_vector));
    }
    TEST_CASE("vector_magnitude_squared_integration") {
        auto test_vector = vector_to(3.0, 4.0);
        REQUIRE(25.0 == vector_magnitude_squared(test_vector));
    }
    TEST_CASE("vector_multiply_integration") {
        auto test_vector = vector_to(3.0, 4.0);
        auto result_vector = vector_multiply(test_vector, 2.0);
        REQUIRE(6.0 == result_vector->X);
        REQUIRE(8.0 == result_vector->Y);
    }
    TEST_CASE("vector_normal_integration") {
        auto test_vector = vector_to(3.0, 4.0);
        auto normal_vector = vector_normal(test_vector);
        REQUIRE(-0.8 == normal_vector->X);
        REQUIRE(0.6 == normal_vector->Y);
    }
    TEST_CASE("vector_out_of_circle_from_circle_integration") {
        auto test_circle_src = circle_at(0.0, 0.0, 5.0);
        auto test_circle_bounds = circle_at(8.0, 0.0, 5.0);
        auto test_velocity = vector_to(1.0, 0.0);
        auto result_vector = vector_out_of_circle_from_circle(test_circle_src, test_circle_bounds, test_velocity);
        REQUIRE(-3.42 == result_vector->X);
        REQUIRE(0.0 == result_vector->Y);
    }
    TEST_CASE("vector_out_of_circle_from_point_integration") {
        auto test_point = point_at(100.0, 100.0);
        auto test_circle = circle_at(100.0, 100.0, 10.0);
        auto test_velocity = vector_to(1.0, 0.0);
        auto result_vector = vector_out_of_circle_from_point(test_point, test_circle, test_velocity);
        REQUIRE(-11.42 == result_vector->X);
        REQUIRE(0.0 == result_vector->Y);
    }
    TEST_CASE("vector_out_of_rect_from_circle_integration") {
        auto test_circle = circle_at(75.0, 75.0, 25.0);
        auto test_rect = rectangle_from(0.0, 0.0, 100.0, 100.0);
        auto test_velocity = vector_to(1.0, 0.0);
        auto result_vector = vector_out_of_rect_from_circle(test_circle, test_rect, test_velocity);
        REQUIRE(-101.42 == result_vector->X);
        REQUIRE(0.0 == result_vector->Y);
    }
    TEST_CASE("vector_out_of_rect_from_point_integration") {
        auto test_point = point_at(75.0, 75.0);
        auto test_rect = rectangle_from(0.0, 0.0, 100.0, 100.0);
        auto test_velocity = vector_to(1.0, 0.0);
        auto result_vector = vector_out_of_rect_from_point(test_point, test_rect, test_velocity);
        REQUIRE(-76.4 == result_vector->X);
        REQUIRE(0.0 == result_vector->Y);
    }
    TEST_CASE("vector_out_of_rect_from_rect_integration") {
        auto test_src_rect = rectangle_from(75.0, 75.0, 50.0, 50.0);
        auto test_bounds_rect = rectangle_from(0.0, 0.0, 100.0, 100.0);
        auto test_velocity = vector_to(1.0, 0.0);
        auto result_vector = vector_out_of_rect_from_rect(test_src_rect, test_bounds_rect, test_velocity);
        REQUIRE(-126.0 == result_vector->X);
        REQUIRE(0.0 == result_vector->Y);
    }
    TEST_CASE("vector_point_to_point_integration") {
        auto test_start_point = point_at(0.0, 0.0);
        auto test_end_point = point_at(3.0, 4.0);
        auto result_vector = vector_point_to_point(test_start_point, test_end_point);
        REQUIRE(3.0 == result_vector->X);
        REQUIRE(4.0 == result_vector->Y);
    }
    TEST_CASE("vector_subtract_integration") {
        auto test_vector1 = vector_to(3.0, 4.0);
        auto test_vector2 = vector_to(1.0, 1.0);
        auto result_vector = vector_subtract(test_vector1, test_vector2);
        REQUIRE(2.0 == result_vector->X);
        REQUIRE(3.0 == result_vector->Y);
    }
    TEST_CASE("vector_to_point_integration") {
        auto test_point = point_at(3.0, 4.0);
        auto result_vector = vector_to(test_point);
        REQUIRE(3.0 == result_vector->X);
        REQUIRE(4.0 == result_vector->Y);
    }
    TEST_CASE("vector_to_integration") {
        auto test_vector = vector_to(3.0, 4.0);
        REQUIRE(3.0 == test_vector->X);
        REQUIRE(4.0 == test_vector->Y);
    }
    TEST_CASE("vector_to_string_integration") {
        auto test_vector = vector_from_angle(3.0, 4.0);
        REQUIRE("Vec -> 3.000000:4.000000" == vector_to_string(test_vector));
    }
    TEST_CASE("vectors_equal_integration") {
        auto test_vector1 = vector_to(3.0, 4.0);
        auto test_vector2 = vector_to(3.0, 4.0);
        auto test_vector3 = vector_to(3.0, 5.0);
        REQUIRE(vectors_equal(test_vector1, test_vector2));
        REQUIRE_FALSE(vectors_equal(test_vector1, test_vector3));
    }
    TEST_CASE("vectors_not_equal_integration") {
        auto test_vector1 = vector_to(3.0, 4.0);
        auto test_vector2 = vector_to(3.0, 4.0);
        auto test_vector3 = vector_to(3.0, 5.0);
        REQUIRE_FALSE(vectors_not_equal(test_vector1, test_vector2));
        REQUIRE(vectors_not_equal(test_vector1, test_vector3));
    }
};
