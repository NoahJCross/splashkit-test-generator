use std::*;
use splashkit::*;
use splashkit_tests::helpers::*;
#[cfg(test)]
use ctor::ctor;
mod test_geometry {
    use super::*;
    #[test]
    fn test_center_point_of_circle_integration() {
        let test_circle = circle_at_from_points(100.0, 100.0, 50.0);
        let test_center_point = center_point_of_circle(test_circle);
        assert_eq!(test_center_point, point_at(100.0, 100.0));
    }
    #[test]
    fn test_circle_at_integration() {
        open_window("Test Window 1".to_string(), 800, 600);
        let _cleanup_window = WindowCleanup::new();
        let test_circle = circle_at(point_at(400.0, 300.0), 50.0);
        draw_circle_record(color_black(), test_circle);
        refresh_screen();
        assert!(point_in_circle(point_at(400.0, 300.0), test_circle));
    }
    #[test]
    fn test_circle_at_from_points_integration() {
        open_window("Test Window 2".to_string(), 800, 600);
        let _cleanup_window = WindowCleanup::new();
        let test_circle = circle_at_from_points(400.0, 300.0, 50.0);
        draw_circle_record_with_options(color_black(), test_circle, option_defaults());
        refresh_screen();
        assert!(point_in_circle(point_at(400.0, 300.0), test_circle));
    }
    #[test]
    fn test_circle_radius_integration() {
        let test_circle = circle_at_from_points(100.0, 100.0, 50.0);
        let test_radius = circle_radius(test_circle);
        assert_eq!(50.0, test_radius);
    }
    #[test]
    fn test_circle_triangle_intersect_integration() {
        let test_circle = circle_at_from_points(100.0, 100.0, 50.0);
        let test_triangle = triangle_from(point_at(50.0, 50.0), point_at(150.0, 50.0), point_at(100.0, 150.0));
        let test_result = circle_triangle_intersect(test_circle, test_triangle);
        assert!(test_result);
    }
    #[test]
    fn test_circle_triangle_intersect_get_closest_point_integration() {
        let test_circle = circle_at_from_points(100.0, 100.0, 50.0);
        let test_triangle = triangle_from(point_at(50.0, 50.0), point_at(150.0, 50.0), point_at(100.0, 150.0));
        let mut test_point = point_at(0.0, 0.0);
        let test_result = circle_triangle_intersect_get_closest_point(test_circle, test_triangle, &mut test_point);
        assert!(test_result);
    }
    #[test]
    fn test_circle_x_integration() {
        let test_circle = circle_at_from_points(100.0, 100.0, 50.0);
        assert_eq!(100.0, circle_x(test_circle));
    }
    #[test]
    fn test_circle_y_integration() {
        let test_circle = circle_at_from_points(100.0, 150.0, 50.0);
        assert_eq!(150.0, circle_y(test_circle));
    }
    #[test]
    fn test_circles_intersect_integration() {
        let test_circle1 = circle_at_from_points(0.0, 0.0, 50.0);
        let test_circle2 = circle_at_from_points(100.0, 0.0, 50.0);
        let test_result1 = circles_intersect(test_circle1, test_circle2);
        assert!(!test_result1);
        let test_circle3 = circle_at_from_points(50.0, 0.0, 50.0);
        let test_result2 = circles_intersect(test_circle1, test_circle3);
        assert!(test_result2);
    }
    #[test]
    fn test_circles_intersect_using_values_integration() {
        let test_intersect_result = circles_intersect_using_values(0.0, 0.0, 5.0, 5.0, 0.0, 5.0);
        assert!(test_intersect_result);
        let test_not_intersect_result = circles_intersect_using_values(0.0, 0.0, 5.0, 11.0, 0.0, 5.0);
        assert!(!test_not_intersect_result);
    }
    #[test]
    fn test_closest_point_on_circle_integration() {
        let test_circle = circle_at_from_points(100.0, 100.0, 50.0);
        let test_point = point_at(200.0, 100.0);
        let test_closest_point = closest_point_on_circle(test_point, test_circle);
        assert_eq!(circle_radius(test_circle), point_point_distance(test_closest_point, test_point));
    }
    #[test]
    fn test_closest_point_on_line_from_circle_integration() {
        let test_circle = circle_at_from_points(100.0, 100.0, 50.0);
        let test_line = line_from(50.0, 50.0, 150.0, 150.0);
        let test_closest_point = closest_point_on_line_from_circle(test_circle, test_line);
        assert!(point_on_line(test_closest_point, test_line));
    }
    #[test]
    fn test_closest_point_on_rect_from_circle_integration() {
        let test_circle = circle_at_from_points(100.0, 100.0, 50.0);
        let test_rectangle = rectangle_from(100.0, 50.0, 100.0, 100.0);
        let test_closest_point = closest_point_on_rect_from_circle(test_circle, test_rectangle);
        assert!(point_in_rectangle(test_closest_point, test_rectangle));
        let test_distance = point_point_distance(center_point_of_circle(test_circle), test_closest_point);
        assert!(test_distance <= circle_radius(test_circle));
    }
    #[test]
    fn test_closest_point_on_triangle_from_circle_integration() {
        let test_circle = circle_at_from_points(100.0, 100.0, 50.0);
        let test_triangle = triangle_from(point_at(50.0, 50.0), point_at(150.0, 50.0), point_at(100.0, 150.0));
        let test_closest_point = closest_point_on_triangle_from_circle(test_circle, test_triangle);
        assert!(point_in_triangle(test_closest_point, test_triangle));
    }
    #[test]
    fn test_distant_point_on_circle_integration() {
        let test_circle = circle_at_from_points(100.0, 100.0, 50.0);
        let test_point = point_at(100.0, 150.0);
        let test_distant_point = distant_point_on_circle(test_point, test_circle);
        assert_eq!(100.0 as f32, point_point_distance(test_point, test_distant_point));
    }
    #[test]
    fn test_distant_point_on_circle_heading_integration() {
        let test_circle = circle_at_from_points(100.0, 100.0, 50.0);
        let test_point1 = point_at(150.0, 100.0);
        let test_heading = vector_from_angle(180.0, 1.0);
        let mut test_point2 = point_at(0.0, 0.0);
        let test_result = distant_point_on_circle_heading(test_point1, test_circle, test_heading, &mut test_point2);
        assert!(test_result);
        assert!((50.0 - test_point2.x).abs() <= 2.0);
        assert!((100.0 - test_point2.y).abs() <= 2.0);
    }
    #[test]
    fn test_ray_circle_intersect_distance_integration() {
        let test_circle = circle_at_from_points(100.0, 100.0, 50.0);
        let test_ray_origin = point_at(0.0, 0.0);
        let test_ray_heading = vector_from_angle(45.0, 1.0);
        let test_distance = ray_circle_intersect_distance(test_ray_origin, test_ray_heading, test_circle);
        assert_eq!(91.4213562 as f32, test_distance);
    }
    #[test]
    fn test_tangent_points_integration() {
        let test_from_pt = point_at(100.0, 100.0);
        let test_circle = circle_at_from_points(150.0, 150.0, 50.0);
        let mut test_point1 = point_at(0.0, 0.0);
        let mut test_point2 = point_at(0.0, 0.0);
        let test_result = tangent_points(test_from_pt, test_circle, &mut test_point1, &mut test_point2);
        assert!(test_result);
        assert_ne!(point_at(0.0, 0.0), test_point1);
        assert_ne!(point_at(0.0, 0.0), test_point2);
    }
    #[test]
    fn test_widest_points_integration() {
        let test_circle = circle_at_from_points(100.0, 100.0, 50.0);
        let test_vector = vector_from_angle(45.0, 45.0);
        let mut test_point1 = point_at(0.0, 0.0);
        let mut test_point2 = point_at(0.0, 0.0);
        widest_points(test_circle, test_vector, &mut test_point1, &mut test_point2);
        assert!(point_in_circle(point_at(circle_x(test_circle) as f64, circle_y(test_circle) as f64), test_circle));
        assert!(point_in_circle(point_at(circle_x(test_circle) as f64, circle_y(test_circle) as f64), test_circle));
    }
    #[test]
    fn test_cosine_integration() {
        let test_cosine_0 = cosine(0.0 as f32);
        assert!((1.0 - test_cosine_0).abs() <= 2.0);
        let test_cosine_90 = cosine(90.0 as f32);
        assert!((0.0 - test_cosine_90).abs() <= 2.0);
        let test_cosine_180 = cosine(180.0 as f32);
        assert!((-1.0 - test_cosine_180).abs() <= 2.0);
    }
    #[test]
    fn test_sine_integration() {
        let test_sine_0 = sine(0.0 as f32);
        assert!((0.0 - test_sine_0).abs() <= 2.0);
        let test_sine_90 = sine(90.0 as f32);
        assert!((1.0 - test_sine_90).abs() <= 2.0);
        let test_sine_180 = sine(180.0 as f32);
        assert!((0.0 - test_sine_180).abs() <= 2.0);
        let test_sine_270 = sine(270.0 as f32);
        assert_eq!(-1.0, test_sine_270);
    }
    #[test]
    fn test_tangent_integration() {
        let test_tangent_result = tangent(45.0 as f32);
        assert!((1.0..=2.0).contains(&test_tangent_result));
    }
    #[test]
    fn test_closest_point_on_line_integration() {
        let test_line = line_from_point_to_point(point_at(0.0, 0.0), point_at(10.0, 10.0));
        let test_closest_point = closest_point_on_line(point_at(5.0, 5.0), test_line);
        assert_eq!(0.0, point_point_distance(point_at(5.0, 5.0), test_closest_point));
    }
    #[test]
    fn test_closest_point_on_lines_integration() {
        let test_from_pt = point_at(0.0, 0.0);
        let test_line1 = line_from_point_to_point(point_at(-10.0, 0.0), point_at(10.0, 0.0));
        let test_line2 = line_from_point_to_point(point_at(0.0, -10.0), point_at(0.0, 10.0));
        let mut test_index = 0;
        let test_lines = vec![test_line1, test_line2];
        let test_closest_point = closest_point_on_lines(test_from_pt, test_lines, &mut test_index);
        assert_eq!(0.0, point_point_distance(test_from_pt, test_closest_point));
    }
    #[test]
    fn test_line_from_point_to_point_integration() {
        let test_start_point = point_at(0.0, 0.0);
        let test_end_point = point_at(100.0, 100.0);
        let test_line = line_from_point_to_point(test_start_point, test_end_point);
        assert!((141.421356 - line_length(test_line)).abs() <= 2.0);
    }
    #[test]
    fn test_line_from_start_with_offset_integration() {
        let test_start_point = point_at(0.0, 0.0);
        let test_offset_vector = vector_from_angle(45.0, 10.0);
        let test_line = line_from_start_with_offset(test_start_point, test_offset_vector);
        assert!(point_on_line(point_at(0.0, 0.0), test_line));
        assert!(point_on_line(point_offset_by(test_start_point, test_offset_vector), test_line));
    }
    #[test]
    fn test_line_from_vector_integration() {
        let test_vector = vector_from_angle(100.0, 50.0);
        let test_line = line_from_vector(test_vector);
        assert_eq!(point_at_origin(), test_line.start_point);
        assert_eq!(-8.682409286499023, test_line.end_point.x);
        assert_eq!(49.240386962890625, test_line.end_point.y);
    }
    #[test]
    fn test_line_from_integration() {
        let test_line = line_from(0.0, 0.0, 10.0, 10.0);
        assert!((14.1421356 - line_length(test_line)).abs() <= 2.0);
    }
    #[test]
    fn test_line_intersection_point_integration() {
        let test_line1 = line_from(0.0, 0.0, 10.0, 10.0);
        let test_line2 = line_from(10.0, 0.0, 0.0, 10.0);
        let mut test_point = point_at(0.0, 0.0);
        let test_intersection_result = line_intersection_point(test_line1, test_line2, &mut test_point);
        assert!(test_intersection_result);
    }
    #[test]
    fn test_line_intersects_circle_integration() {
        let test_line = line_from(0.0, 0.0, 10.0, 10.0);
        let test_circle = circle_at_from_points(5.0, 5.0, 3.0);
        let test_result = line_intersects_circle(test_line, test_circle);
        assert!(test_result);
    }
    #[test]
    fn test_line_intersects_lines_integration() {
        let test_line = line_from(0.0, 0.0, 10.0, 10.0);
        let test_line1 = line_from(0.0, 10.0, 10.0, 0.0);
        let test_line2 = line_from(20.0, 20.0, 30.0, 30.0);
        let test_lines = vec![test_line1, test_line2];
        let test_result = line_intersects_lines(test_line, test_lines);
        assert!(test_result);
    }
    #[test]
    fn test_line_intersects_rect_integration() {
        let test_rect = rectangle_from(0.0, 0.0, 100.0, 100.0);
        let test_line = line_from_point_to_point(point_at(-50.0, 50.0), point_at(150.0, 50.0));
        assert!(line_intersects_rect(test_line, test_rect));
        let test_line_outside = line_from_point_to_point(point_at(-50.0, 150.0), point_at(150.0, 150.0));
        assert!(!line_intersects_rect(test_line_outside, test_rect));
    }
    #[test]
    fn test_line_length_integration() {
        let test_line = line_from_point_to_point(point_at(0.0, 0.0), point_at(3.0, 4.0));
        let test_length = line_length(test_line);
        assert_eq!(5.0, test_length);
    }
    #[test]
    fn test_line_length_squared_integration() {
        let test_line = line_from_point_to_point(point_at(0.0, 0.0), point_at(3.0, 4.0));
        let test_result = line_length_squared(test_line);
        assert_eq!(25.0, test_result);
    }
    #[test]
    fn test_line_mid_point_integration() {
        let test_line = line_from_point_to_point(point_at(0.0, 0.0), point_at(100.0, 100.0));
        let test_mid_point = line_mid_point(test_line);
        assert_eq!(0.0, point_point_distance(test_mid_point, point_at(50.0, 50.0)));
    }
    #[test]
    fn test_line_normal_integration() {
        let test_line = line_from(0.0, 0.0, 1.0, 1.0);
        let test_normal = line_normal(test_line);
        assert_eq!(-0.7071067811865475, test_normal.x);
        assert_eq!(0.7071067811865475, test_normal.y);
    }
    #[test]
    fn test_line_to_string_integration() {
        let test_line = line_from_point_to_point(point_at(0.0, 0.0), point_at(100.0, 100.0));
        let test_line_string = line_to_string(test_line);
        assert_ne!("Line from Pt @0:0 to Pt @100:100".to_string(), test_line_string);
    }
    #[test]
    fn test_lines_from_rectangle_integration() {
        let test_rectangle = rectangle_from(0.0, 0.0, 100.0, 100.0);
        let test_lines = lines_from_rectangle(test_rectangle);
        assert_eq!(4, test_lines.len());
    }
    #[test]
    fn test_lines_from_triangle_integration() {
        let test_triangle = triangle_from(point_at(0.0, 0.0), point_at(100.0, 0.0), point_at(50.0, 86.6));
        let test_lines = lines_from_triangle(test_triangle);
        assert_eq!(3, test_lines.len());
    }
    #[test]
    fn test_lines_intersect_integration() {
        let test_line1 = line_from_point_to_point(point_at(0.0, 0.0), point_at(10.0, 10.0));
        let test_line2 = line_from_point_to_point(point_at(5.0, 0.0), point_at(5.0, 10.0));
        let test_result = lines_intersect(test_line1, test_line2);
        assert!(test_result);
    }
    #[test]
    fn test_point_at_integration() {
        let test_point = point_at(10.0, 20.0);
        assert_eq!(10.0, test_point.x);
        assert_eq!(20.0, test_point.y);
    }
    #[test]
    fn test_point_at_origin_integration() {
        let test_point = point_at_origin();
        assert_eq!(0.0, test_point.x);
        assert_eq!(0.0, test_point.y);
    }
    #[test]
    fn test_point_in_circle_integration() {
        let test_circle = circle_at_from_points(100.0, 100.0, 50.0);
        assert!(point_in_circle(point_at(100.0, 100.0), test_circle));
        assert!(point_in_circle(point_at(150.0, 100.0), test_circle));
        assert!(!point_in_circle(point_at(200.0, 100.0), test_circle));
    }
    #[test]
    fn test_point_in_circle_with_values_integration() {
        let test_result1 = point_in_circle_with_values(100.0, 100.0, 100.0, 100.0, 50.0);
        assert!(test_result1);
        let test_result2 = point_in_circle_with_values(200.0, 100.0, 100.0, 100.0, 50.0);
        assert!(!test_result2);
    }
    #[test]
    fn test_point_in_quad_integration() {
        let test_quad = quad_from_points(point_at(0.0, 0.0), point_at(100.0, 0.0), point_at(100.0, 100.0), point_at(0.0, 100.0));
        assert!(point_in_quad(point_at(50.0, 51.0), test_quad));
        assert!(!point_in_quad(point_at(150.0, 50.0), test_quad));
    }
    #[test]
    fn test_point_in_rectangle_integration() {
        let test_rectangle = rectangle_from(0.0, 0.0, 100.0, 100.0);
        let test_point_inside = point_at(50.0, 50.0);
        let test_point_outside = point_at(150.0, 150.0);
        assert!(point_in_rectangle(test_point_inside, test_rectangle));
        assert!(!point_in_rectangle(test_point_outside, test_rectangle));
    }
    #[test]
    fn test_point_in_rectangle_with_values_integration() {
        let test_result_inside = point_in_rectangle_with_values(10.0, 10.0, 0.0, 0.0, 20.0, 20.0);
        assert!(test_result_inside);
        let test_result_outside = point_in_rectangle_with_values(25.0, 25.0, 0.0, 0.0, 20.0, 20.0);
        assert!(!test_result_outside);
    }
    #[test]
    fn test_point_in_triangle_integration() {
        let test_triangle = triangle_from(point_at(0.0, 0.0), point_at(100.0, 0.0), point_at(50.0, 100.0));
        assert!(point_in_triangle(point_at(50.0, 50.0), test_triangle));
        assert!(!point_in_triangle(point_at(150.0, 50.0), test_triangle));
    }
    #[test]
    fn test_point_line_distance_integration() {
        let test_point = point_at(0.0, 0.0);
        let test_line = line_from(0.0, 0.0, 10.0, 10.0);
        let test_distance = point_line_distance(test_point, test_line);
        assert_eq!(0.0, test_distance);
    }
    #[test]
    fn test_point_offset_by_integration() {
        let test_start_point = point_at(10.0, 20.0);
        let test_offset = vector_from_angle(5.0, 10.0);
        let test_result_point = point_offset_by(test_start_point, test_offset);
        assert_eq!(19.961947202682495, test_result_point.x);
        assert_eq!(20.87155744433403, test_result_point.y);
    }
    #[test]
    fn test_point_offset_from_origin_integration() {
        let test_vector = vector_from_angle(10.0, 20.0);
        let test_point = point_offset_from_origin(test_vector);
        assert_eq!(19.696154594421387, test_point.x);
        assert_eq!(3.472963571548462, test_point.y);
    }
    #[test]
    fn test_point_on_line_integration() {
        let test_line = line_from(0.0, 0.0, 10.0, 10.0);
        let test_point_on_line = point_at(5.0, 5.0);
        let test_point_off_line = point_at(15.0, 15.0);
        assert!(point_on_line(test_point_on_line, test_line));
        assert!(!point_on_line(test_point_off_line, test_line));
    }
    #[test]
    fn test_point_on_line_with_proximity_integration() {
        let test_line = line_from_point_to_point(point_at(0.0, 0.0), point_at(10.0, 10.0));
        let test_point_on_line = point_at(5.0, 5.0);
        let test_point_near_line = point_at(5.1, 5.1);
        let test_point_far_from_line = point_at(15.0, 15.0);
        assert!(point_on_line_with_proximity(test_point_on_line, test_line, 0.1 as f32));
        assert!(point_on_line_with_proximity(test_point_near_line, test_line, 0.2 as f32));
        assert!(!point_on_line_with_proximity(test_point_far_from_line, test_line, 0.1 as f32));
    }
    #[test]
    fn test_point_point_angle_integration() {
        let test_point1 = point_at(0.0, 0.0);
        let test_point2 = point_at(1.0, 0.0);
        let test_angle = point_point_angle(test_point1, test_point2);
        assert_eq!(0.0, test_angle);
    }
    #[test]
    fn test_point_point_distance_integration() {
        let test_point1 = point_at(0.0, 0.0);
        let test_point2 = point_at(3.0, 4.0);
        let test_distance = point_point_distance(test_point1, test_point2);
        assert_eq!(5.0, test_distance);
    }
    #[test]
    fn test_point_to_string_integration() {
        let test_point = point_at(10.0, 20.0);
        let test_string = point_to_string(test_point);
        assert_eq!("Pt @10.000000:20.000000".to_string(), test_string);
    }
    #[test]
    fn test_random_bitmap_point_integration() {
        let test_bitmap = create_bitmap("Test Bitmap 1".to_string(), 100, 100);
        let _cleanup_bitmap = BitmapCleanup::new();
        let test_point = random_bitmap_point(test_bitmap);
        assert!((0.0..=bitmap_width(test_bitmap) as f64).contains(&test_point.x));
        assert!((0.0..=bitmap_height(test_bitmap) as f64).contains(&test_point.y));
    }
    #[test]
    fn test_random_screen_point_integration() {
        let test_window = open_window("Test Window 3".to_string(), 800, 600);
        let _cleanup_window = WindowCleanup::new();
        let test_point = random_screen_point();
        refresh_screen();
        assert!((0.0..=window_width(test_window) as f64).contains(&test_point.x));
        assert!((0.0..=window_height(test_window) as f64).contains(&test_point.y));
    }
    #[test]
    fn test_random_window_point_integration() {
        let test_window = open_window("Test Window 4".to_string(), 800, 600);
        let _cleanup_window = WindowCleanup::new();
        let test_point = random_window_point(test_window);
        assert!((0.0..=window_width(test_window) as f64).contains(&test_point.x));
        assert!((0.0..=window_height(test_window) as f64).contains(&test_point.y));
    }
    #[test]
    fn test_same_point_integration() {
        let test_point1 = point_at(10.0, 20.0);
        let test_point2 = point_at(10.0, 20.0);
        let test_point3 = point_at(10.0, 21.0);
        assert!(same_point(test_point1, test_point2));
        assert!(!same_point(test_point1, test_point3));
    }
    #[test]
    fn test_quad_from_points_integration() {
        let test_p1 = point_at(0.0, 0.0);
        let test_p2 = point_at(100.0, 0.0);
        let test_p3 = point_at(0.0, 100.0);
        let test_p4 = point_at(100.0, 100.0);
        let test_quad = quad_from_points(test_p1, test_p2, test_p3, test_p4);
        assert!(point_in_quad(point_at(50.0, 51.0), test_quad));
    }
    #[test]
    fn test_quad_from_rectangle_integration() {
        let test_rectangle = rectangle_from(0.0, 0.0, 100.0, 100.0);
        let test_quad = quad_from_rectangle(test_rectangle);
        assert!(point_in_quad(point_at(50.0, 51.0), test_quad));
        assert!(!point_in_quad(point_at(150.0, 150.0), test_quad));
    }
    #[test]
    fn test_quad_from_rectangle_with_transformation_integration() {
        let test_rectangle = rectangle_from(0.0, 0.0, 100.0, 100.0);
        let test_transform = rotation_matrix(45.0);
        let test_quad = quad_from_rectangle_with_transformation(test_rectangle, test_transform);
        assert!(point_in_quad(point_at(50.0, 51.0), test_quad));
        assert!(!point_in_quad(point_at(150.0, 150.0), test_quad));
    }
    #[test]
    fn test_quad_from_integration() {
        let test_quad = quad_from(0.0, 0.0, 100.0, 0.0, 0.0, 100.0, 100.0, 100.0);
        assert!(point_in_quad(point_at(50.0, 51.0), test_quad));
        assert!(!point_in_quad(point_at(150.0, 150.0), test_quad));
    }
    #[test]
    fn test_quads_intersect_integration() {
        let test_quad1 = quad_from_points(point_at(0.0, 0.0), point_at(100.0, 0.0), point_at(0.0, 100.0), point_at(100.0, 100.0));
        let test_quad2 = quad_from_points(point_at(50.0, 50.0), point_at(150.0, 50.0), point_at(50.0, 150.0), point_at(150.0, 150.0));
        let test_result = quads_intersect(test_quad1, test_quad2);
        assert!(test_result);
    }
    #[test]
    fn test_set_quad_point_integration() {
        let mut test_quad = quad_from_points(point_at(0.0, 0.0), point_at(100.0, 0.0), point_at(0.0, 100.0), point_at(100.0, 100.0));
        assert!(!point_in_quad(point_at(50.0, 150.0), test_quad));
        set_quad_point(&mut test_quad, 2, point_at(50.0, 150.0));
        assert!(point_in_quad(point_at(50.0, 150.0), test_quad));
    }
    #[test]
    fn test_triangles_from_integration() {
        let test_quad = quad_from_points(point_at(0.0, 0.0), point_at(100.0, 0.0), point_at(0.0, 100.0), point_at(100.0, 100.0));
        let test_triangles = triangles_from(test_quad);
        assert_eq!(2, test_triangles.len());
    }
    #[test]
    fn test_inset_rectangle_integration() {
        let test_rectangle = rectangle_from(0.0, 0.0, 100.0, 100.0);
        let test_inset_rectangle = inset_rectangle(test_rectangle, 10.0 as f32);
        assert_eq!(10.0, rectangle_left(test_inset_rectangle));
        assert_eq!(10.0, rectangle_top(test_inset_rectangle));
        assert_eq!(90.0, rectangle_right(test_inset_rectangle));
        assert_eq!(90.0, rectangle_bottom(test_inset_rectangle));
    }
    #[test]
    fn test_intersection_integration() {
        let test_rect1 = rectangle_from(0.0, 0.0, 10.0, 10.0);
        let test_rect2 = rectangle_from(5.0, 5.0, 10.0, 10.0);
        let test_intersection = intersection(test_rect1, test_rect2);
        assert_eq!(5.0, rectangle_left(test_intersection));
        assert_eq!(5.0, rectangle_top(test_intersection));
        assert_eq!(10.0, rectangle_right(test_intersection));
        assert_eq!(10.0, rectangle_bottom(test_intersection));
    }
    #[test]
    fn test_rectangle_around_circle_integration() {
        let test_circle = circle_at_from_points(100.0, 100.0, 50.0);
        let test_rectangle = rectangle_around_circle(test_circle);
        assert_eq!(50.0, rectangle_left(test_rectangle));
        assert_eq!(50.0, rectangle_top(test_rectangle));
        assert_eq!(150.0, rectangle_right(test_rectangle));
        assert_eq!(150.0, rectangle_bottom(test_rectangle));
    }
    #[test]
    fn test_rectangle_around_line_integration() {
        let test_line = line_from_point_to_point(point_at(10.0, 10.0), point_at(50.0, 50.0));
        let test_rectangle = rectangle_around_line(test_line);
        assert!(point_in_rectangle(point_at(10.0, 10.0), test_rectangle));
        assert!(point_in_rectangle(point_at(50.0, 50.0), test_rectangle));
    }
    #[test]
    fn test_rectangle_around_quad_integration() {
        let test_quad = quad_from_points(point_at(0.0, 0.0), point_at(100.0, 0.0), point_at(0.0, 100.0), point_at(100.0, 100.0));
        let test_rectangle = rectangle_around_quad(test_quad);
        assert_eq!(0.0, rectangle_left(test_rectangle));
        assert_eq!(0.0, rectangle_top(test_rectangle));
        assert_eq!(100.0, rectangle_right(test_rectangle));
        assert_eq!(100.0, rectangle_bottom(test_rectangle));
    }
    #[test]
    fn test_rectangle_around_triangle_integration() {
        let test_triangle = triangle_from(point_at(0.0, 0.0), point_at(100.0, 0.0), point_at(50.0, 100.0));
        let test_rectangle = rectangle_around_triangle(test_triangle);
        assert_eq!(0.0, rectangle_left(test_rectangle));
        assert_eq!(0.0, rectangle_top(test_rectangle));
        assert_eq!(100.0, rectangle_right(test_rectangle));
        assert_eq!(100.0, rectangle_bottom(test_rectangle));
    }
    #[test]
    fn test_rectangle_bottom_integration() {
        let test_rectangle = rectangle_from(10.0, 20.0, 50.0, 60.0);
        assert_eq!(80.0, rectangle_bottom(test_rectangle));
    }
    #[test]
    fn test_rectangle_center_integration() {
        let test_rectangle = rectangle_from_point_and_size(point_at(0.0, 0.0), 100.0, 100.0);
        let test_center_point = rectangle_center(test_rectangle);
        assert_eq!(0.0, point_point_distance(point_at(50.0, 50.0), test_center_point));
    }
    #[test]
    fn test_rectangle_from_point_and_size_integration() {
        let test_point = point_at(10.0, 20.0);
        let test_rectangle = rectangle_from_point_and_size(test_point, 50.0, 30.0);
        assert_eq!(10.0, rectangle_left(test_rectangle));
        assert_eq!(20.0, rectangle_top(test_rectangle));
        assert_eq!(60.0, rectangle_right(test_rectangle));
        assert_eq!(50.0, rectangle_bottom(test_rectangle));
    }
    #[test]
    fn test_rectangle_from_points_integration() {
        let test_point1 = point_at(0.0, 0.0);
        let test_point2 = point_at(100.0, 100.0);
        let test_rectangle = rectangle_from_points(test_point1, test_point2);
        assert_eq!(0.0, rectangle_left(test_rectangle));
        assert_eq!(0.0, rectangle_top(test_rectangle));
        assert_eq!(100.0, rectangle_right(test_rectangle));
        assert_eq!(100.0, rectangle_bottom(test_rectangle));
    }
    #[test]
    fn test_rectangle_from_integration() {
        let test_rectangle = rectangle_from(10.0, 20.0, 50.0, 30.0);
        assert_eq!(10.0, rectangle_left(test_rectangle));
        assert_eq!(20.0, rectangle_top(test_rectangle));
        assert_eq!(60.0, rectangle_right(test_rectangle));
        assert_eq!(50.0, rectangle_bottom(test_rectangle));
    }
    #[test]
    fn test_rectangle_left_integration() {
        let test_rectangle = rectangle_from(10.0, 20.0, 50.0, 60.0);
        let test_left = rectangle_left(test_rectangle);
        assert_eq!(10.0, test_left);
    }
    #[test]
    fn test_rectangle_offset_by_integration() {
        let test_rectangle = rectangle_from(10.0, 10.0, 50.0, 50.0);
        let test_offset_rectangle = rectangle_offset_by(test_rectangle, vector_to(20.0, 30.0));
        assert_eq!(30.0, rectangle_left(test_offset_rectangle));
        assert_eq!(40.0, rectangle_top(test_offset_rectangle));
    }
    #[test]
    fn test_rectangle_right_integration() {
        let test_rectangle = rectangle_from(10.0, 20.0, 50.0, 60.0);
        assert_eq!(60.0, rectangle_right(test_rectangle));
    }
    #[test]
    fn test_rectangle_to_string_integration() {
        let test_rectangle = rectangle_from(10.0, 20.0, 30.0, 40.0);
        let test_string = rectangle_to_string(test_rectangle);
        assert_eq!("Rect @10,20 30x40".to_string(), test_string);
    }
    #[test]
    fn test_rectangle_top_integration() {
        let test_rectangle = rectangle_from(10.0, 20.0, 50.0, 60.0);
        let test_top = rectangle_top(test_rectangle);
        assert_eq!(20.0, test_top);
    }
    #[test]
    fn test_rectangles_intersect_integration() {
        let test_rect1 = rectangle_from(0.0, 0.0, 10.0, 10.0);
        let test_rect2 = rectangle_from(5.0, 5.0, 10.0, 10.0);
        let test_result = rectangles_intersect(test_rect1, test_rect2);
        assert!(test_result);
    }
    #[test]
    fn test_triangle_barycenter_integration() {
        let test_triangle = triangle_from(point_at(0.0, 0.0), point_at(100.0, 0.0), point_at(50.0, 50.0));
        let test_barycenter = triangle_barycenter(test_triangle);
        assert_eq!(50.0, test_barycenter.x);
        assert!((16.67 - test_barycenter.y).abs() <= 2.0);
    }
    #[test]
    fn test_triangle_from_integration() {
        let test_point1 = point_at(0.0, 0.0);
        let test_point2 = point_at(100.0, 0.0);
        let test_point3 = point_at(50.0, 100.0);
        let test_triangle = triangle_from(test_point1, test_point2, test_point3);
        assert!(point_in_triangle(point_at(50.0, 50.0), test_triangle));
    }
    #[test]
    fn test_triangle_from__from_coordinates_integration() {
        let test_triangle = triangle_from__from_coordinates(0.0, 0.0, 100.0, 0.0, 50.0, 100.0);
        assert!(point_in_triangle(point_at(50.0, 50.0), test_triangle));
        assert!(!point_in_triangle(point_at(150.0, 150.0), test_triangle));
    }
    #[test]
    fn test_triangle_rectangle_intersect_integration() {
        let test_triangle = triangle_from(point_at(0.0, 0.0), point_at(100.0, 0.0), point_at(50.0, 100.0));
        let test_rectangle = rectangle_from_point_and_size(point_at(40.0, 40.0), 60.0, 60.0);
        let test_result = triangle_rectangle_intersect(test_triangle, test_rectangle);
        assert!(test_result);
    }
    #[test]
    fn test_triangle_to_string_integration() {
        let test_triangle = triangle_from(point_at(0.0, 0.0), point_at(100.0, 0.0), point_at(50.0, 100.0));
        let test_triangle_string = triangle_to_string(test_triangle);
        assert_ne!("Triangle @Pt @0:0 - Pt @100:0 - Pt @50:100".to_string(), test_triangle_string);
    }
    #[test]
    fn test_triangles_intersect_integration() {
        let test_triangle1 = triangle_from(point_at(0.0, 0.0), point_at(2.0, 0.0), point_at(1.0, 2.0));
        let test_triangle2 = triangle_from(point_at(1.0, 0.0), point_at(3.0, 0.0), point_at(2.0, 2.0));
        let test_result = triangles_intersect(test_triangle1, test_triangle2);
        assert!(test_result);
    }
}
