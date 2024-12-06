use splashkit::*;
#[cfg(test)]
mod test_runner {
    pub fn run_tests_sequential(tests: &[&dyn Fn()]) {
        for test in tests {
            test();
        }
    }
}
#![test_runner(test_runner::run_tests_sequential)]
#[test]
fn test_bitmap_circle_collision_at_point_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    let test_circle = circle_at(150.0, 150.0, 50.0);
    let test_point = point_at(100.0, 100.0);
    assert!(bitmap_circle_collision_at_point(test_bitmap, test_point, test_circle));
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_bitmap_circle_collision_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    let test_circle = circle_at(150.0, 150.0, 50.0);
    let collision_result = bitmap_circle_collision(test_bitmap, 100.0, 100.0, test_circle);
    assert!(collision_result);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_bitmap_circle_collision_for_cell_with_translation_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    clear_bitmap(test_bitmap, color_black());
    let test_circle = circle_at(150.0, 150.0, 50.0);
    let test_translation = translation_matrix(100.0, 100.0);
    let collision_result = bitmap_circle_collision_for_cell_with_translation(test_bitmap, 0, test_translation, test_circle);
    assert!(collision_result);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_bitmap_circle_collision_for_cell_at_point_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    let test_circle = circle_at(150.0, 150.0, 50.0);
    let test_point = point_at(100.0, 100.0);
    assert!(bitmap_circle_collision_for_cell_at_point(test_bitmap, 0, test_point, test_circle));
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_bitmap_circle_collision_for_cell_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    let test_circle = circle_at(150.0, 150.0, 50.0);
    let collision_result = bitmap_circle_collision_for_cell(test_bitmap, 0, 100.0, 100.0, test_circle);
    assert!(collision_result);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_bitmap_collision_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_bitmap1 = create_bitmap("test_bitmap1", 100, 100);
    let test_bitmap2 = create_bitmap("test_bitmap2", 100, 100);
    let collision_result = bitmap_collision(test_bitmap1, 0, 0, test_bitmap2, 50, 50);
    assert!(collision_result);
    let collision_result = bitmap_collision(test_bitmap1, 0, 0, test_bitmap2, 200, 200);
    assert!(!collision_result);
    free_all_bitmaps();
    close_window(test_window);
}
#[test]
fn test_bitmap_collision_at_points_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_bitmap1 = create_bitmap("test_bitmap1", 100, 100);
    let test_bitmap2 = create_bitmap("test_bitmap2", 100, 100);
    let test_point1 = point_at(0, 0);
    let test_point2 = point_at(50, 50);
    let collision_result = bitmap_collision_at_points(test_bitmap1, test_point1, test_bitmap2, test_point2);
    assert!(collision_result);
    free_all_bitmaps();
    close_window(test_window);
}
#[test]
fn test_bitmap_collision_for_cells_with_translations_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_bitmap1 = create_bitmap("test_bitmap1", 100, 100);
    let test_bitmap2 = create_bitmap("test_bitmap2", 100, 100);
    setup_collision_mask(test_bitmap1);
    setup_collision_mask(test_bitmap2);
    let matrix1 = translation_matrix(0, 0);
    let matrix2 = translation_matrix(50, 50);
    let collision_result = bitmap_collision_for_cells_with_translations(test_bitmap1, 0, matrix1, test_bitmap2, 0, matrix2);
    assert!(collision_result);
    free_bitmap(test_bitmap1);
    free_bitmap(test_bitmap2);
    close_window(test_window);
}
#[test]
fn test_bitmap_collision_for_cells_at_points_integration() {
    let test_window = open_window("Collision Test", 800, 600);
    let test_bitmap1 = create_bitmap("test_bitmap1", 50, 50);
    let test_bitmap2 = create_bitmap("test_bitmap2", 50, 50);
    let test_point1 = point_at(100.0, 100.0);
    let test_point2 = point_at(125.0, 125.0);
    let collision_result = bitmap_collision_for_cells_at_points(test_bitmap1, 0, test_point1, test_bitmap2, 0, test_point2);
    assert!(collision_result);
    free_all_bitmaps();
    close_window(test_window);
}
#[test]
fn test_bitmap_collision_for_cells_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_bitmap1 = create_bitmap("test_bitmap1", 100, 100);
    let test_bitmap2 = create_bitmap("test_bitmap2", 100, 100);
    let collision_result = bitmap_collision_for_cells(test_bitmap1, 0, 100.0, 100.0, test_bitmap2, 0, 150.0, 100.0);
    assert!(!collision_result);
    let collision_result = bitmap_collision_for_cells(test_bitmap1, 0, 100.0, 100.0, test_bitmap2, 0, 100.0, 100.0);
    assert!(collision_result);
    free_all_bitmaps();
    close_window(test_window);
}
#[test]
fn test_bitmap_point_collision_with_translation_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    clear_bitmap(test_bitmap, color_black());
    let test_translation = translation_matrix(100, 100);
    let test_point = point_at(150, 150);
    let collision_result = bitmap_point_collision_with_translation(test_bitmap, test_translation, test_point);
    assert!(collision_result);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_bitmap_point_collision_at_point_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    let test_bmp_pt = point_at(50, 50);
    let test_pt = point_at(50, 50);
    let collision_result = bitmap_point_collision_at_point(test_bitmap, test_bmp_pt, test_pt);
    assert!(collision_result);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_bitmap_point_collision_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    clear_bitmap(test_bitmap, color_black());
    let collision_result = bitmap_point_collision(test_bitmap, 0.0, 0.0, 50.0, 50.0);
    assert!(collision_result);
    let collision_result = bitmap_point_collision(test_bitmap, 0.0, 0.0, 150.0, 150.0);
    assert!(!collision_result);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_bitmap_point_collision_for_cell_with_translation_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    let test_translation = translation_matrix(100.0, 100.0);
    let test_point = point_at(150.0, 150.0);
    let collision_result = bitmap_point_collision_for_cell_with_translation(test_bitmap, 0, test_translation, test_point);
    assert!(collision_result);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_bitmap_point_collision_for_cell_at_point_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    let test_point = point_at(100, 100);
    let collision_result = bitmap_point_collision_for_cell_at_point(test_bitmap, 0, test_point, test_point);
    assert!(collision_result);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_bitmap_point_collision_for_cell_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    let collision_result = bitmap_point_collision_for_cell(test_bitmap, 0, 100.0, 100.0, 100.0, 100.0);
    assert!(collision_result);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_bitmap_rectangle_collision_at_point_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    let test_rectangle = rectangle_from(50.0, 50.0, 100.0, 100.0);
    let test_point = point_at(100.0, 100.0);
    let collision_result = bitmap_rectangle_collision_at_point(test_bitmap, test_point, test_rectangle);
    assert!(collision_result);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_bitmap_rectangle_collision_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    let test_rectangle = rectangle_from(50.0, 50.0, 100.0, 100.0);
    let collision_result = bitmap_rectangle_collision(test_bitmap, 0.0, 0.0, test_rectangle);
    assert!(collision_result);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_bitmap_rectangle_collision_for_cell_with_translation_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    let test_rectangle = rectangle_from(150.0, 150.0, 50.0, 50.0);
    let test_translation = translation_matrix(100.0, 100.0);
    assert!(bitmap_rectangle_collision_for_cell_with_translation(test_bitmap, 0, test_translation, test_rectangle));
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_bitmap_rectangle_collision_for_cell_at_point_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    let test_rectangle = rectangle_from(100.0, 100.0, 50.0, 50.0);
    let test_point = point_at(100.0, 100.0);
    let collision_result = bitmap_rectangle_collision_for_cell_at_point(test_bitmap, 0, test_point, test_rectangle);
    assert!(collision_result);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_bitmap_rectangle_collision_for_cell_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    let test_rectangle = rectangle_from(50.0, 50.0, 100.0, 100.0);
    let collision_result = bitmap_rectangle_collision_for_cell(test_bitmap, 0, 50.0, 50.0, test_rectangle);
    assert!(collision_result);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_sprite_bitmap_collision_integration() {
    let test_window = open_window("Collision Test", 800, 600);
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    let test_sprite = create_sprite(test_bitmap);
    let collision_result = sprite_bitmap_collision(test_sprite, test_bitmap, 100.0, 100.0);
    assert!(collision_result);
    let collision_result = sprite_bitmap_collision(test_sprite, test_bitmap, 200.0, 200.0);
    assert!(!collision_result);
    free_all_sprites();
    free_all_bitmaps();
    close_window(test_window);
}
#[test]
fn test_sprite_bitmap_collision_with_cell_at_point_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    let test_sprite = create_sprite(test_bitmap);
    let collision_result = sprite_bitmap_collision_with_cell_at_point(test_sprite, test_bitmap, 0, point_at(50, 50));
    assert!(collision_result);
    free_all_sprites();
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_sprite_bitmap_collision_with_cell_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    let test_sprite = create_sprite(test_bitmap);
    let collision_result = sprite_bitmap_collision_with_cell(test_sprite, test_bitmap, 0, 50.0, 50.0);
    assert!(collision_result);
    free_all_sprites();
    free_all_bitmaps();
    close_window(test_window);
}
#[test]
fn test_sprite_collision_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_bitmap_1 = create_bitmap("test_bitmap_1", 50, 50);
    let test_bitmap_2 = create_bitmap("test_bitmap_2", 50, 50);
    let test_sprite_1 = create_sprite(test_bitmap_1);
    let test_sprite_2 = create_sprite(test_bitmap_2);
    sprite_set_position(test_sprite_1, point_at(100, 100));
    sprite_set_position(test_sprite_2, point_at(150, 150));
    assert!(sprite_collision(test_sprite_1, test_sprite_2));
    sprite_set_position(test_sprite_2, point_at(200, 200));
    assert!(!sprite_collision(test_sprite_1, test_sprite_2));
    free_all_sprites();
    free_all_bitmaps();
    close_window(test_window);
}
#[test]
fn test_sprite_point_collision_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    let test_sprite = create_sprite(test_bitmap);
    let collision_result = sprite_point_collision(test_sprite, point_at(50, 50));
    assert!(collision_result);
    let collision_result = sprite_point_collision(test_sprite, point_at(200, 200));
    assert!(!collision_result);
    free_all_sprites();
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_sprite_rectangle_collision_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    let test_sprite = create_sprite(test_bitmap);
    let test_rectangle = rectangle_from(50.0, 50.0, 150.0, 150.0);
    let collision_result = sprite_rectangle_collision(test_sprite, test_rectangle);
    assert!(collision_result);
    free_all_sprites();
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_apply_matrix_to_quad_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_matrix = identity_matrix();
    let test_quad = quad_from(point_at(100, 100), point_at(200, 100), point_at(200, 200), point_at(100, 200));
    apply_matrix_to_quad(test_matrix, test_quad);
    assert_eq!(point_at(100, 100), quad_point);
    close_window(test_window);
}
#[test]
fn test_apply_matrix_to_triangle_integration() {
    let test_triangle = triangle_from(point_at(0.0, 0.0), point_at(1.0, 0.0), point_at(0.0, 1.0));
    let test_matrix = translation_matrix(1.0, 1.0);
    apply_matrix_to_triangle(test_matrix, test_triangle);
    assert_eq!(triangle_to_string(test_triangle), "Triangle(x1: 1.0, y1: 1.0, x2: 2.0, y2: 1.0, x3: 1.0, y3: 2.0)");
}
#[test]
fn test_identity_matrix_integration() {
    let test_matrix = identity_matrix();
    assert_eq!(test_matrix[0, 0], 1.0);
    assert_eq!(test_matrix[1, 1], 1.0);
    assert_eq!(test_matrix[0, 1], 0.0);
    assert_eq!(test_matrix[1, 0], 0.0);
}
#[test]
fn test_matrix_inverse_integration() {
    let test_matrix = identity_matrix();
    let inverse_matrix = matrix_inverse(test_matrix);
    let result_matrix = matrix_multiply_matrix(test_matrix, inverse_matrix);
    assert!(vectors_equal(vector_to(1.0, 0.0), matrix_multiply_point(result_matrix, vector_to(1.0, 0.0))));
}
#[test]
fn test_matrix_multiply_point_integration() {
    let test_matrix = identity_matrix();
    let test_point = point_at(10.0, 20.0);
    let result_point = matrix_multiply_point(test_matrix, test_point);
    assert_eq!(result_point.x, 10.0);
    assert_eq!(result_point.y, 20.0);
}
#[test]
fn test_matrix_multiply_matrix_integration() {
    let test_matrix1 = identity_matrix();
    let test_matrix2 = rotation_matrix(45);
    let result_matrix = matrix_multiply_matrix(test_matrix1, test_matrix2);
    assert_eq!(result_matrix[0, 0], cosine(45));
    assert_eq!(result_matrix[0, 1], sine(45));
}
#[test]
fn test_matrix_multiply_vector_integration() {
    let test_vector = vector_to(1.0, 1.0);
    let test_matrix = scale_matrix(2.0);
    let result_vector = matrix_multiply_vector(test_matrix, test_vector);
    assert_eq!(result_vector.x, 2.0);
    assert_eq!(result_vector.y, 2.0);
}
#[test]
fn test_matrix_to_string_integration() {
    let test_matrix = identity_matrix();
    let test_matrix_string = matrix_to_string(test_matrix);
    assert_eq!(test_matrix_string, "[1, 0, 0, 1, 0, 0]");
}
#[test]
fn test_rotation_matrix_integration() {
    let test_matrix = rotation_matrix(45.0);
    let test_vector = vector_to(1.0, 0.0);
    let result_vector = matrix_multiply_vector(test_matrix, test_vector);
    assert!((0.99..=1.01).contains(&vector_magnitude(result_vector)));
    assert!((44.0..=46.0).contains(&vector_angle(result_vector)));
}
#[test]
fn test_scale_matrix_from_point_integration() {
    let test_scale = point_at(2.0, 3.0);
    let test_matrix = scale_matrix_from_point(test_scale);
    let test_vector = vector_to(1.0, 1.0);
    let result_vector = matrix_multiply_vector(test_matrix, test_vector);
    assert_eq!(result_vector.x, 2.0);
    assert_eq!(result_vector.y, 3.0);
}
#[test]
fn test_scale_matrix_from_vector_integration() {
    let test_scale_vector = vector_to(2.0, 3.0);
    let test_matrix = scale_matrix_from_vector(test_scale_vector);
    let test_vector = vector_to(1.0, 1.0);
    let result_vector = matrix_multiply_vector(test_matrix, test_vector);
    assert_eq!(result_vector.x, 2.0);
    assert_eq!(result_vector.y, 3.0);
}
#[test]
fn test_scale_matrix_integration() {
    let test_matrix = scale_matrix(2.0);
    let test_vector = vector_to(1.0, 1.0);
    let result_vector = matrix_multiply_vector(test_matrix, test_vector);
    assert_eq!(result_vector.x, 2.0);
    assert_eq!(result_vector.y, 2.0);
}
#[test]
fn test_scale_rotate_translate_matrix_integration() {
    let test_scale = point_at(2.0, 3.0);
    let test_translate = point_at(10.0, 20.0);
    let test_matrix = scale_rotate_translate_matrix(test_scale, 45.0, test_translate);
    let test_point = point_at(1.0, 1.0);
    let result_point = matrix_multiply_point(test_matrix, test_point);
    assert!((10.0..=10.1).contains(&result_point.x));
    assert!((23.0..=23.1).contains(&result_point.y));
}
#[test]
fn test_translation_matrix_to_point_integration() {
    let test_point = point_at(10.0, 20.0);
    let test_matrix = translation_matrix_to_point(test_point);
    let test_vector = point_at(5.0, 5.0);
    let result_point = matrix_multiply_vector(test_matrix, test_vector);
    assert_eq!(result_point.x, 15.0);
    assert_eq!(result_point.y, 25.0);
}
#[test]
fn test_translation_matrix_from_vector_integration() {
    let test_vector = vector_to(10.0, 20.0);
    let test_matrix = translation_matrix_from_vector(test_vector);
    let test_point = point_at(0.0, 0.0);
    let result_point = matrix_multiply_point(test_matrix, test_point);
    assert_eq!(result_point.x, 10.0);
    assert_eq!(result_point.y, 20.0);
}
#[test]
fn test_translation_matrix_integration() {
    let test_matrix = translation_matrix(10.0, 20.0);
    let test_point = point_at(0.0, 0.0);
    let result_point = matrix_multiply_point(test_matrix, test_point);
    assert_eq!(result_point.x, 10.0);
    assert_eq!(result_point.y, 20.0);
}
#[test]
fn test_angle_between_integration() {
    let test_vector1 = vector_to(1.0, 0.0);
    let test_vector2 = vector_to(0.0, 1.0);
    let test_angle = angle_between(test_vector1, test_vector2);
    assert!((89.9..=90.1).contains(&test_angle));
}
#[test]
fn test_dot_product_integration() {
    let test_vector1 = vector_to(3.0, 4.0);
    let test_vector2 = vector_to(1.0, 2.0);
    let test_result = dot_product(test_vector1, test_vector2);
    assert_eq!(test_result, 11.0);
}
#[test]
fn test_is_zero_vector_integration() {
    let test_zero_vector = vector_to(0.0, 0.0);
    let test_non_zero_vector = vector_to(1.0, 1.0);
    assert!(is_zero_vector(test_zero_vector));
    assert!(!is_zero_vector(test_non_zero_vector));
}
#[test]
fn test_ray_intersection_point_integration() {
    let test_from_pt = point_at(0.0, 0.0);
    let test_heading = vector_to(1.0, 1.0);
    let test_line = line_from(point_at(0.0, 2.0), point_at(2.0, 0.0));
    let intersection_result = ray_intersection_point(test_from_pt, test_heading, test_line, point_at(0.0, 0.0));
    assert!(intersection_result);
}
#[test]
fn test_unit_vector_integration() {
    let test_vector = vector_to(3.0, 4.0);
    let test_unit_vector = unit_vector(test_vector);
    assert_eq!(vector_magnitude(test_unit_vector), 1.0);
    assert_eq!(vector_angle(test_unit_vector), vector_angle(test_vector));
}
#[test]
fn test_vector_add_integration() {
    let test_vector1 = vector_to(1.0, 2.0);
    let test_vector2 = vector_to(3.0, 4.0);
    let result_vector = vector_add(test_vector1, test_vector2);
    assert_eq!(result_vector.x, 4.0);
    assert_eq!(result_vector.y, 6.0);
}
#[test]
fn test_vector_angle_integration() {
    let test_vector = vector_to(1.0, 1.0);
    let test_angle = vector_angle(test_vector);
    assert!((45.0..=45.001).contains(&test_angle));
}
#[test]
fn test_vector_from_angle_integration() {
    let test_vector = vector_from_angle(45.0, 1.0);
    assert!((0.99..=1.01).contains(&vector_magnitude(test_vector)));
    assert!((44.0..=46.0).contains(&vector_angle(test_vector)));
}
#[test]
fn test_vector_from_line_integration() {
    let test_line = line_from(point_at(0.0, 0.0), point_at(10.0, 10.0));
    let test_vector = vector_from_line(test_line);
    assert_eq!(test_vector.x, 10.0);
    assert_eq!(test_vector.y, 10.0);
}
#[test]
fn test_vector_from_point_to_rect_integration() {
    let test_rect = rectangle_from(0.0, 0.0, 100.0, 100.0);
    let test_point = point_at(50.0, 50.0);
    let test_vector = vector_from_point_to_rect(test_point, test_rect);
    assert_eq!(vector_magnitude(test_vector), 0.0);
}
#[test]
fn test_vector_in_rect_integration() {
    let test_rect = rectangle_from(0.0, 0.0, 100.0, 100.0);
    let test_vector_inside = vector_to(50.0, 50.0);
    let test_vector_outside = vector_to(150.0, 150.0);
    assert!(vector_in_rect(test_vector_inside, test_rect));
    assert!(!vector_in_rect(test_vector_outside, test_rect));
}
#[test]
fn test_vector_invert_integration() {
    let test_vector = vector_to(3.0, 4.0);
    let inverted_vector = vector_invert(test_vector);
    assert_eq!(vector_to(-3.0, -4.0), inverted_vector);
}
#[test]
fn test_vector_limit_integration() {
    let test_vector = vector_to(3.0, 4.0);
    let limited_vector = vector_limit(test_vector, 5.0);
    assert!(vector_magnitude(limited_vector) <= 5.0);
    assert!(vectors_equal(test_vector, limited_vector));
}
#[test]
fn test_vector_magnitude_integration() {
    let test_vector = vector_to(3.0, 4.0);
    let test_magnitude = vector_magnitude(test_vector);
    assert_eq!(test_magnitude, 5.0);
}
#[test]
fn test_vector_magnitude_squared_integration() {
    let test_vector = vector_to(3.0, 4.0);
    let result = vector_magnitude_squared(test_vector);
    assert_eq!(result, 25.0);
}
#[test]
fn test_vector_multiply_integration() {
    let test_vector = vector_to(3.0, 4.0);
    let result_vector = vector_multiply(test_vector, 2.0);
    assert_eq!(vector_magnitude(result_vector), 10.0);
    assert_eq!(vector_angle(result_vector), vector_angle(test_vector));
}
#[test]
fn test_vector_normal_integration() {
    let test_vector = vector_to(3.0, 4.0);
    let normal_vector = vector_normal(test_vector);
    assert_eq!(vector_magnitude(normal_vector), 5.0);
    assert_eq!(vector_angle(normal_vector), 53.1301);
}
#[test]
fn test_vector_out_of_circle_from_circle_integration() {
    let test_circle_src = circle_at(100.0, 100.0, 50.0);
    let test_circle_bounds = circle_at(150.0, 150.0, 75.0);
    let test_velocity = vector_to(10.0, 10.0);
    let test_result_vector = vector_out_of_circle_from_circle(test_circle_src, test_circle_bounds, test_velocity);
    assert!(vector_magnitude(test_result_vector) > 0.0);
    assert!(circles_intersect(circle_at(point_offset_by(center_point(test_circle_src), test_result_vector), circle_radius(test_circle_src)), test_circle_bounds));
}
#[test]
fn test_vector_out_of_circle_from_point_integration() {
    let test_point = point_at(100.0, 100.0);
    let test_circle = circle_at(150.0, 150.0, 50.0);
    let test_velocity = vector_to(10.0, 10.0);
    let test_result = vector_out_of_circle_from_point(test_point, test_circle, test_velocity);
    assert!(vector_magnitude(test_result) > 0.0);
}
#[test]
fn test_vector_out_of_rect_from_circle_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_circle = circle_at(100.0, 100.0, 50.0);
    let test_rectangle = rectangle_from(50.0, 50.0, 200.0, 200.0);
    let test_velocity = vector_to(10.0, 0.0);
    let test_result_vector = vector_out_of_rect_from_circle(test_circle, test_rectangle, test_velocity);
    assert_ne!(vector_magnitude(test_result_vector), 0.0);
    close_window(test_window);
}
#[test]
fn test_vector_out_of_rect_from_point_integration() {
    let test_point = point_at(50.0, 50.0);
    let test_rectangle = rectangle_from(0.0, 0.0, 100.0, 100.0);
    let test_velocity = vector_to(1.0, 1.0);
    let result_vector = vector_out_of_rect_from_point(test_point, test_rectangle, test_velocity);
    assert!(point_in_rectangle(point_offset_by(test_point, result_vector), test_rectangle));
}
#[test]
fn test_vector_out_of_rect_from_rect_integration() {
    let test_src_rect = rectangle_from(50.0, 50.0, 100.0, 100.0);
    let test_bounds_rect = rectangle_from(0.0, 0.0, 200.0, 200.0);
    let test_velocity = vector_to(10.0, 10.0);
    let test_result_vector = vector_out_of_rect_from_rect(test_src_rect, test_bounds_rect, test_velocity);
    assert_ne!(vector_magnitude(test_result_vector), 0.0);
}
#[test]
fn test_vector_point_to_point_integration() {
    let test_start_point = point_at(0.0, 0.0);
    let test_end_point = point_at(3.0, 4.0);
    let test_vector = vector_point_to_point(test_start_point, test_end_point);
    assert_eq!(vector_to(3.0, 4.0), test_vector);
}
#[test]
fn test_vector_subtract_integration() {
    let test_vector1 = vector_to(3.0, 4.0);
    let test_vector2 = vector_to(1.0, 1.0);
    let result_vector = vector_subtract(test_vector1, test_vector2);
    assert_eq!(vector_magnitude(result_vector), 3.0);
    assert_eq!(vector_angle(result_vector), 45.0);
}
#[test]
fn test_vector_to_point_integration() {
    let test_point = point_at(3.0, 4.0);
    let test_vector = vector_to_point(test_point);
    assert_eq!(test_vector.x, 3.0);
    assert_eq!(test_vector.y, 4.0);
}
#[test]
fn test_vector_to_integration() {
    let test_vector = vector_to(3.0, 4.0);
    assert_eq!(vector_magnitude(test_vector), 5.0);
    assert_eq!(vector_angle(test_vector), 53.1301);
}
#[test]
fn test_vector_to_string_integration() {
    let test_vector = vector_to(3.0, 4.0);
    let test_string = vector_to_string(test_vector);
    assert_eq!(test_string, "Vector(3.0, 4.0)");
}
#[test]
fn test_vectors_equal_integration() {
    let test_vector1 = vector_to(1.0, 1.0);
    let test_vector2 = vector_to(1.0, 1.0);
    assert!(vectors_equal(test_vector1, test_vector2));
    let test_vector3 = vector_to(1.0, 2.0);
    assert!(!vectors_equal(test_vector1, test_vector3));
}
#[test]
fn test_vectors_not_equal_integration() {
    let test_vector1 = vector_to(1.0, 1.0);
    let test_vector2 = vector_to(1.0, 1.0);
    assert!(!vectors_not_equal(test_vector1, test_vector2));
    let test_vector3 = vector_to(1.0, 2.0);
    assert!(vectors_not_equal(test_vector1, test_vector3));
}
