use std::*;
use splashkit::*;
use splashkit_tests::helpers::*;
#[cfg(test)]
use ctor::ctor;
mod test_graphics {
    use super::*;
    #[ctor]
    fn setup()
    {
        set_resources_path("/mnt/c/Users/Noahc/Documents/aYear_2_semester_2/TeamProject/GitHubRepo/splashkit_test_generator/resources".to_string());
    }
    #[test]
    fn test_draw_circle_record_integration() {
        let test_window = open_window("Test Window 1".to_string(), 800, 600);
        let _cleanup_window = WindowCleanup::new();
        clear_window(test_window, color_white());
        let test_circle = circle_at_from_points(400.0, 300.0, 50.0);
        draw_circle_record(color_black(), test_circle);
        assert_eq!(color_black(), get_pixel_from_window(test_window, 450.0, 300.0));
        assert_eq!(color_white(), get_pixel_from_window(test_window, 400.0, 300.0));
        assert_eq!(color_white(), get_pixel_from_window(test_window, 460.0, 300.0));
    }
    #[test]
    fn test_draw_circle_record_with_options_integration() {
        let test_window = open_window("Test Window 2".to_string(), 800, 600);
        let _cleanup_window = WindowCleanup::new();
        clear_window(test_window, color_white());
        let test_circle = circle_at_from_points(400.0, 300.0, 50.0);
        draw_circle_record_with_options(color_black(), test_circle, option_defaults());
        assert_eq!(color_black(), get_pixel_from_window(test_window, 450.0, 300.0));
        assert_eq!(color_white(), get_pixel_from_window(test_window, 400.0, 300.0));
        assert_eq!(color_white(), get_pixel_from_window(test_window, 460.0, 300.0));
    }
    #[test]
    fn test_draw_circle_integration() {
        let test_window = open_window("Test Window 3".to_string(), 800, 600);
        let _cleanup_window = WindowCleanup::new();
        clear_window(test_window, color_white());
        draw_circle(color_black(), 400.0, 300.0, 50.0);
        refresh_screen();
        assert_eq!(color_black(), get_pixel_from_window(test_window, 450.0, 300.0));
        assert_eq!(color_white(), get_pixel_from_window(test_window, 425.0, 300.0));
        assert_eq!(color_white(), get_pixel_from_window(test_window, 460.0, 300.0));
    }
    #[test]
    fn test_draw_circle_with_options_integration() {
        let test_window = open_window("Test Window 4".to_string(), 800, 600);
        let _cleanup_window = WindowCleanup::new();
        clear_window(test_window, color_white());
        draw_circle_with_options(color_black(), 400.0, 300.0, 50.0, option_defaults());
        assert_eq!(color_black(), get_pixel_from_window(test_window, 450.0, 300.0));
        assert_eq!(color_white(), get_pixel_from_window(test_window, 400.0, 300.0));
        assert_eq!(color_white(), get_pixel_from_window(test_window, 460.0, 300.0));
    }
    #[test]
    fn test_draw_circle_on_bitmap_integration() {
        let test_bitmap = create_bitmap("Test Bitmap 1".to_string(), 200, 200);
        let _cleanup_bitmap = BitmapCleanup::new();
        clear_bitmap(test_bitmap, color_white());
        draw_circle_on_bitmap(test_bitmap, color_black(), 100.0, 100.0, 50.0);
        assert_eq!(color_black(), get_pixel_from_bitmap(test_bitmap, 150.0, 100.0));
        assert_eq!(color_white(), get_pixel_from_bitmap(test_bitmap, 100.0, 100.0));
        assert_eq!(color_white(), get_pixel_from_bitmap(test_bitmap, 160.0, 100.0));
    }
    #[test]
    fn test_draw_circle_on_bitmap_with_options_integration() {
        let test_bitmap = create_bitmap("Test Bitmap 2".to_string(), 200, 200);
        let _cleanup_bitmap = BitmapCleanup::new();
        clear_bitmap(test_bitmap, color_white());
        draw_circle_on_bitmap_with_options(test_bitmap, color_black(), 100.0, 100.0, 50.0, option_defaults());
        assert_eq!(color_black(), get_pixel_from_bitmap(test_bitmap, 150.0, 100.0));
        assert_eq!(color_white(), get_pixel_from_bitmap(test_bitmap, 100.0, 100.0));
        assert_eq!(color_white(), get_pixel_from_bitmap(test_bitmap, 160.0, 100.0));
    }
    #[test]
    fn test_draw_circle_on_window_integration() {
        let test_window = open_window("Test Window 5".to_string(), 800, 600);
        let _cleanup_window = WindowCleanup::new();
        clear_window(test_window, color_white());
        draw_circle_on_window(test_window, color_black(), 400.0, 300.0, 50.0);
        assert_eq!(color_black(), get_pixel_from_window(test_window, 450.0, 300.0));
        assert_eq!(color_white(), get_pixel_from_window(test_window, 400.0, 300.0));
        assert_eq!(color_white(), get_pixel_from_window(test_window, 460.0, 300.0));
    }
    #[test]
    fn test_draw_circle_on_window_with_options_integration() {
        let test_window = open_window("Test Window 6".to_string(), 800, 600);
        let _cleanup_window = WindowCleanup::new();
        clear_window(test_window, color_white());
        draw_circle_on_window_with_options(test_window, color_black(), 400.0, 300.0, 50.0, option_defaults());
        assert_eq!(color_black(), get_pixel_from_window(test_window, 450.0, 300.0));
        assert_eq!(color_black(), get_pixel_from_window(test_window, 350.0, 300.0));
        assert_eq!(color_white(), get_pixel_from_window(test_window, 400.0, 400.0));
    }
    #[test]
    fn test_fill_circle_record_integration() {
        let test_window = open_window("Test Window 7".to_string(), 800, 600);
        let _cleanup_window = WindowCleanup::new();
        clear_window(test_window, color_white());
        let test_circle = circle_at_from_points(400.0, 300.0, 50.0);
        fill_circle_record(color_black(), test_circle);
        assert_eq!(color_black(), get_pixel_from_window(test_window, 400.0, 300.0));
        assert_eq!(color_black(), get_pixel_from_window(test_window, 425.0, 300.0));
        assert_eq!(color_white(), get_pixel_from_window(test_window, 460.0, 300.0));
    }
    #[test]
    fn test_fill_circle_record_with_options_integration() {
        let test_window = open_window("Test Window 8".to_string(), 800, 600);
        let _cleanup_window = WindowCleanup::new();
        clear_window(test_window, color_white());
        let test_circle = circle_at_from_points(400.0, 300.0, 50.0);
        fill_circle_record_with_options(color_black(), test_circle, option_defaults());
        assert_eq!(color_black(), get_pixel_from_window(test_window, 400.0, 300.0));
        assert_eq!(color_black(), get_pixel_from_window(test_window, 425.0, 300.0));
        assert_eq!(color_white(), get_pixel_from_window(test_window, 460.0, 300.0));
    }
    #[test]
    fn test_fill_circle_integration() {
        let test_window = open_window("Test Window 9".to_string(), 800, 600);
        let _cleanup_window = WindowCleanup::new();
        clear_window(test_window, color_white());
        fill_circle(color_black(), 400.0, 300.0, 50.0);
        assert_eq!(color_black(), get_pixel_from_window(test_window, 400.0, 300.0));
        assert_eq!(color_black(), get_pixel_from_window(test_window, 425.0, 300.0));
        assert_eq!(color_white(), get_pixel_from_window(test_window, 460.0, 300.0));
    }
    #[test]
    fn test_fill_circle_with_options_integration() {
        let test_window = open_window("Test Window 10".to_string(), 800, 600);
        let _cleanup_window = WindowCleanup::new();
        clear_window(test_window, color_white());
        fill_circle_with_options(color_black(), 400.0, 300.0, 50.0, option_defaults());
        assert_eq!(color_black(), get_pixel_from_window(test_window, 400.0, 300.0));
        assert_eq!(color_black(), get_pixel_from_window(test_window, 425.0, 300.0));
        assert_eq!(color_white(), get_pixel_from_window(test_window, 460.0, 300.0));
    }
    #[test]
    fn test_fill_circle_on_bitmap_integration() {
        let test_bitmap = create_bitmap("Test Bitmap 3".to_string(), 200, 200);
        let _cleanup_bitmap = BitmapCleanup::new();
        clear_bitmap(test_bitmap, color_white());
        fill_circle_on_bitmap(test_bitmap, color_red(), 100.0, 100.0, 50.0);
        assert_eq!(color_red(), get_pixel_from_bitmap(test_bitmap, 100.0, 100.0));
        assert_eq!(color_red(), get_pixel_from_bitmap(test_bitmap, 125.0, 100.0));
        assert_eq!(color_white(), get_pixel_from_bitmap(test_bitmap, 160.0, 100.0));
    }
    #[test]
    fn test_fill_circle_on_bitmap_with_options_integration() {
        let test_bitmap = create_bitmap("Test Bitmap 4".to_string(), 200, 200);
        let _cleanup_bitmap = BitmapCleanup::new();
        clear_bitmap(test_bitmap, color_white());
        fill_circle_on_bitmap_with_options(test_bitmap, color_black(), 100.0, 100.0, 50.0, option_defaults());
        assert_eq!(color_black(), get_pixel_from_bitmap(test_bitmap, 100.0, 100.0));
        assert_eq!(color_black(), get_pixel_from_bitmap(test_bitmap, 125.0, 100.0));
        assert_eq!(color_white(), get_pixel_from_bitmap(test_bitmap, 160.0, 100.0));
    }
    #[test]
    fn test_fill_circle_on_window_integration() {
        let test_window = open_window("Test Window 11".to_string(), 800, 600);
        let _cleanup_window = WindowCleanup::new();
        clear_window(test_window, color_white());
        fill_circle_on_window(test_window, color_black(), 400.0, 300.0, 50.0);
        assert_eq!(color_black(), get_pixel_from_window(test_window, 400.0, 300.0));
        assert_eq!(color_black(), get_pixel_from_window(test_window, 425.0, 300.0));
        assert_eq!(color_white(), get_pixel_from_window(test_window, 460.0, 300.0));
    }
    #[test]
    fn test_fill_circle_on_window_with_options_integration() {
        let test_window = open_window("Test Window 12".to_string(), 800, 600);
        let _cleanup_window = WindowCleanup::new();
        clear_window(test_window, color_white());
        fill_circle_on_window_with_options(test_window, color_black(), 400.0, 300.0, 50.0, option_defaults());
        assert_eq!(color_black(), get_pixel_from_window(test_window, 400.0, 300.0));
        assert_eq!(color_black(), get_pixel_from_window(test_window, 425.0, 300.0));
        assert_eq!(color_white(), get_pixel_from_window(test_window, 460.0, 300.0));
    }
    #[test]
    fn test_current_clip_integration() {
        open_window("Test Window 13".to_string(), 800, 600);
        let _cleanup_window = WindowCleanup::new();
        let test_clip = current_clip();
        assert_eq!(0.0 as f32, rectangle_left(test_clip));
        assert_eq!(0.0 as f32, rectangle_top(test_clip));
        assert_eq!(800.0, test_clip.width);
        assert_eq!(600.0, test_clip.height);
    }
    #[test]
    fn test_current_clip_for_bitmap_integration() {
        let test_bitmap = create_bitmap("Test Bitmap 5".to_string(), 100, 100);
        let _cleanup_bitmap = BitmapCleanup::new();
        let test_rectangle = rectangle_from(10.0, 10.0, 50.0, 50.0);
        push_clip_for_bitmap(test_bitmap, test_rectangle);
        let test_clip = current_clip_for_bitmap(test_bitmap);
        assert_eq!(10.0 as f32, rectangle_left(test_clip));
        assert_eq!(10.0 as f32, rectangle_top(test_clip));
        assert_eq!(50.0, test_clip.width);
        assert_eq!(50.0, test_clip.height);
    }
    #[test]
    fn test_current_clip_for_window_integration() {
        let test_window = open_window("Test Window 14".to_string(), 800, 600);
        let _cleanup_window = WindowCleanup::new();
        let test_clip = current_clip_for_window(test_window);
        assert_eq!(0.0 as f32, rectangle_left(test_clip));
        assert_eq!(0.0 as f32, rectangle_top(test_clip));
        assert_eq!(800.0, test_clip.width);
        assert_eq!(600.0, test_clip.height);
    }
    #[test]
    fn test_pop_clip_for_window_integration() {
        let test_window = open_window("Test Window 15".to_string(), 800, 600);
        let _cleanup_window = WindowCleanup::new();
        let test_rectangle = rectangle_from(0.0, 0.0, 250.0, 250.0);
        push_clip_for_window(test_window, test_rectangle);
        let test_current_clip = current_clip_for_window(test_window);
        assert_eq!(0.0 as f32, rectangle_left(test_current_clip));
        assert_eq!(0.0 as f32, rectangle_top(test_current_clip));
        assert_eq!(250.0, test_current_clip.width);
        assert_eq!(250.0, test_current_clip.height);
        pop_clip_for_window(test_window);
        let test_current_clip_after_pop = current_clip_for_window(test_window);
        assert_eq!(0.0 as f32, rectangle_left(test_current_clip_after_pop));
        assert_eq!(0.0 as f32, rectangle_top(test_current_clip_after_pop));
        assert_eq!(800.0, test_current_clip_after_pop.width);
        assert_eq!(600.0, test_current_clip_after_pop.height);
    }
    #[test]
    fn test_pop_clip_integration() {
        let test_window = open_window("Test Window 16".to_string(), 800, 600);
        let _cleanup_window = WindowCleanup::new();
        clear_window(test_window, color_white());
        push_clip(rectangle_from(0.0, 0.0, 250.0, 250.0));
        fill_rectangle(color_red(), 0.0, 0.0, 300.0, 300.0);
        refresh_screen();
        assert_eq!(color_red(), get_pixel_from_window(test_window, 125.0, 125.0));
        assert_eq!(color_white(), get_pixel_from_window(test_window, 275.0, 275.0));
        pop_clip();
        fill_rectangle(color_green(), 300.0, 300.0, 100.0, 100.0);
        refresh_screen();
        assert_eq!(color_red(), get_pixel_from_window(test_window, 125.0, 125.0));
        let test_color = color_green();
        let test_pixel = get_pixel_from_window(test_window, 350.0, 350.0);
        assert_eq!(red_of(test_color), red_of(test_pixel));
        assert_eq!(green_of(test_color), green_of(test_pixel));
        assert_eq!(blue_of(test_color), blue_of(test_pixel));
        assert_eq!(alpha_of(test_color), alpha_of(test_pixel));
    }
    #[test]
    fn test_pop_clip_for_bitmap_integration() {
        let test_bitmap = create_bitmap("Test Bitmap 6".to_string(), 100, 100);
        let _cleanup_bitmap = BitmapCleanup::new();
        clear_bitmap(test_bitmap, color_white());
        push_clip_for_bitmap(test_bitmap, rectangle_from(0.0, 0.0, 50.0, 50.0));
        fill_circle_with_options(color_black(), 25.0, 25.0, 20.0, option_draw_to_bitmap(test_bitmap));
        assert_eq!(color_black(), get_pixel_from_bitmap(test_bitmap, 25.0, 25.0));
        assert_eq!(color_white(), get_pixel_from_bitmap(test_bitmap, 75.0, 75.0));
        pop_clip_for_bitmap(test_bitmap);
        let test_clip = current_clip_for_bitmap(test_bitmap);
        assert_eq!(0.0 as f32, rectangle_left(test_clip));
        assert_eq!(0.0 as f32, rectangle_top(test_clip));
        assert_eq!(100.0, test_clip.width);
        assert_eq!(100.0, test_clip.height);
    }
    #[test]
    fn test_push_clip_for_window_integration() {
        let test_window = open_window("Test Window 17".to_string(), 800, 600);
        let _cleanup_window = WindowCleanup::new();
        let test_rectangle = rectangle_from(100.0, 100.0, 200.0, 200.0);
        push_clip_for_window(test_window, test_rectangle);
        let test_current_clip = current_clip_for_window(test_window);
        assert_eq!(100.0 as f32, rectangle_left(test_current_clip));
        assert_eq!(100.0 as f32, rectangle_top(test_current_clip));
        assert_eq!(200.0, test_current_clip.width);
        assert_eq!(200.0, test_current_clip.height);
        refresh_screen();
    }
    #[test]
    fn test_push_clip_for_bitmap_integration() {
        let test_bitmap = create_bitmap("Test Bitmap 7".to_string(), 200, 200);
        let _cleanup_bitmap = BitmapCleanup::new();
        let test_rectangle = rectangle_from(50.0, 50.0, 100.0, 100.0);
        push_clip_for_bitmap(test_bitmap, test_rectangle);
        let test_current_clip = current_clip_for_bitmap(test_bitmap);
        assert_eq!(50.0 as f32, rectangle_left(test_current_clip));
        assert_eq!(50.0 as f32, rectangle_top(test_current_clip));
        assert_eq!(100.0, test_current_clip.width);
        assert_eq!(100.0, test_current_clip.height);
    }
    #[test]
    fn test_push_clip_integration() {
        open_window("Test Window 18".to_string(), 800, 600);
        let _cleanup_window = WindowCleanup::new();
        let test_rectangle = rectangle_from(100.0, 100.0, 200.0, 200.0);
        push_clip(test_rectangle);
        let test_current_clip = current_clip();
        assert_eq!(100.0 as f32, rectangle_left(test_current_clip));
        assert_eq!(100.0 as f32, rectangle_top(test_current_clip));
        assert_eq!(200.0, test_current_clip.width);
        assert_eq!(200.0, test_current_clip.height);
    }
    #[test]
    fn test_reset_clip_for_bitmap_integration() {
        let test_bitmap = create_bitmap("Test Bitmap 8".to_string(), 100, 100);
        let _cleanup_bitmap = BitmapCleanup::new();
        push_clip_for_bitmap(test_bitmap, rectangle_from(10.0, 10.0, 50.0, 50.0));
        reset_clip_for_bitmap(test_bitmap);
        let test_clip = current_clip_for_bitmap(test_bitmap);
        assert_eq!(0.0 as f32, rectangle_left(test_clip));
        assert_eq!(0.0 as f32, rectangle_top(test_clip));
        assert_eq!(100.0, test_clip.width);
        assert_eq!(100.0, test_clip.height);
    }
    #[test]
    fn test_reset_clip_integration() {
        open_window("Test Window 19".to_string(), 800, 600);
        let _cleanup_window = WindowCleanup::new();
        push_clip(rectangle_from(100.0, 100.0, 200.0, 200.0));
        reset_clip();
        let test_clip = current_clip();
        assert_eq!(0.0 as f32, rectangle_left(test_clip));
        assert_eq!(0.0 as f32, rectangle_top(test_clip));
        assert_eq!(800.0, test_clip.width);
        assert_eq!(600.0, test_clip.height);
    }
    #[test]
    fn test_reset_clip_for_window_integration() {
        let test_window = open_window("Test Window 20".to_string(), 800, 600);
        let _cleanup_window = WindowCleanup::new();
        push_clip_for_window(test_window, rectangle_from(100.0, 100.0, 200.0, 200.0));
        reset_clip_for_window(test_window);
        let test_clip = current_clip_for_window(test_window);
        assert_eq!(0.0 as f32, rectangle_left(test_clip));
        assert_eq!(0.0 as f32, rectangle_top(test_clip));
        assert_eq!(800.0, test_clip.width);
        assert_eq!(600.0, test_clip.height);
    }
    #[test]
    fn test_set_clip_integration() {
        open_window("Test Window 21".to_string(), 800, 600);
        let _cleanup_window = WindowCleanup::new();
        let test_rectangle = rectangle_from(100.0, 100.0, 200.0, 200.0);
        set_clip(test_rectangle);
        let test_current_clip = current_clip();
        assert_eq!(100.0 as f32, rectangle_left(test_current_clip));
        assert_eq!(100.0 as f32, rectangle_top(test_current_clip));
        assert_eq!(200.0, test_current_clip.width);
        assert_eq!(200.0, test_current_clip.height);
    }
    #[test]
    fn test_set_clip_for_bitmap_integration() {
        let test_bitmap = create_bitmap("Test Bitmap 9".to_string(), 200, 200);
        let _cleanup_bitmap = BitmapCleanup::new();
        let test_rectangle = rectangle_from(50.0, 50.0, 100.0, 100.0);
        set_clip_for_bitmap(test_bitmap, test_rectangle);
        let test_current_clip = current_clip_for_bitmap(test_bitmap);
        assert_eq!(50.0 as f32, rectangle_left(test_current_clip));
        assert_eq!(50.0 as f32, rectangle_top(test_current_clip));
        assert_eq!(100.0, test_current_clip.width);
        assert_eq!(100.0, test_current_clip.height);
    }
    #[test]
    fn test_set_clip_for_window_integration() {
        let test_window = open_window("Test Window 22".to_string(), 800, 600);
        let _cleanup_window = WindowCleanup::new();
        let test_rectangle = rectangle_from(100.0, 100.0, 200.0, 200.0);
        set_clip_for_window(test_window, test_rectangle);
        let test_current_clip = current_clip_for_window(test_window);
        assert_eq!(100.0 as f32, rectangle_left(test_current_clip));
        assert_eq!(100.0 as f32, rectangle_top(test_current_clip));
        assert_eq!(200.0, test_current_clip.width);
        assert_eq!(200.0, test_current_clip.height);
    }
    #[test]
    fn test_option_defaults_integration() {
        let test_options = option_defaults();
        assert!(!test_options.is_null());
    }
    #[test]
    fn test_option_draw_to_bitmap_integration() {
        let test_bitmap = create_bitmap("Test Bitmap 10".to_string(), 100, 100);
        let _cleanup_bitmap = BitmapCleanup::new();
        clear_bitmap(test_bitmap, color_white());
        let test_options = option_draw_to_bitmap(test_bitmap);
        draw_circle_record_with_options(color_black(), circle_at_from_points(50.0, 50.0, 25.0), test_options);
        assert_eq!(color_black(), get_pixel_from_bitmap(test_bitmap, 75.0, 50.0));
        assert_eq!(color_white(), get_pixel_from_bitmap(test_bitmap, 90.0, 90.0));
    }
    #[test]
    fn test_option_draw_to_bitmap_with_options_integration() {
        let test_bitmap = create_bitmap("Test Bitmap 11".to_string(), 100, 100);
        let _cleanup_bitmap = BitmapCleanup::new();
        clear_bitmap(test_bitmap, color_white());
        let test_options = option_defaults();
        let test_drawing_options = option_draw_to_bitmap_with_options(test_bitmap, test_options);
        draw_circle_record_with_options(color_black(), circle_at_from_points(50.0, 50.0, 25.0), test_drawing_options);
        assert_eq!(color_black(), get_pixel_from_bitmap(test_bitmap, 75.0, 50.0));
        assert_eq!(color_white(), get_pixel_from_bitmap(test_bitmap, 90.0, 90.0));
    }
    #[test]
    fn test_option_draw_to_window_integration() {
        let test_window = open_window("Test Window 23".to_string(), 800, 600);
        let _cleanup_window = WindowCleanup::new();
        clear_window(test_window, color_white());
        draw_circle_record_with_options(color_black(), circle_at_from_points(400.0, 300.0, 50.0), option_draw_to_window(test_window));
        refresh_screen();
        assert_eq!(color_black(), get_pixel_from_window(test_window, 450.0, 300.0));
        assert_eq!(color_white(), get_pixel_from_window(test_window, 460.0, 300.0));
    }
    #[test]
    fn test_option_draw_to_window_with_options_integration() {
        let test_window = open_window("Test Window 24".to_string(), 800, 600);
        let _cleanup_window = WindowCleanup::new();
        clear_window(test_window, color_white());
        let test_options = option_defaults();
        draw_circle_record_with_options(color_black(), circle_at_from_points(400.0, 300.0, 50.0), option_draw_to_window_with_options(test_window, test_options));
        refresh_screen();
        assert_eq!(color_black(), get_pixel_from_window(test_window, 450.0, 300.0));
        assert_eq!(color_white(), get_pixel_from_window(test_window, 460.0, 300.0));
    }
    #[test]
    fn test_option_flip_x_integration() {
        let test_window = open_window("Test Window 25".to_string(), 800, 600);
        let _cleanup_window = WindowCleanup::new();
        clear_window(test_window, color_white());
        let test_bitmap = create_bitmap("Test Bitmap 12".to_string(), 100, 100);
        let _cleanup_bitmap = BitmapCleanup::new();
        clear_bitmap(test_bitmap, color_white());
        fill_rectangle_on_bitmap(test_bitmap, color_black(), 0.0, 0.0, 50.0, 100.0);
        draw_bitmap_with_options(test_bitmap, 100.0, 100.0, option_flip_x());
        refresh_screen();
        assert_eq!(color_black(), get_pixel_from_window(test_window, 125.0, 100.0));
        assert_eq!(color_white(), get_pixel_from_window(test_window, 75.0, 100.0));
        free_bitmap(test_bitmap);
    }
    #[test]
    fn test_option_flip_x_with_options_integration() {
        let test_window = open_window("Test Window 26".to_string(), 800, 600);
        let _cleanup_window = WindowCleanup::new();
        clear_window(test_window, color_white());
        let test_bitmap = create_bitmap("Test Bitmap 13".to_string(), 100, 100);
        let _cleanup_bitmap = BitmapCleanup::new();
        clear_bitmap(test_bitmap, color_white());
        fill_rectangle_on_bitmap(test_bitmap, color_black(), 0.0, 0.0, 50.0, 100.0);
        draw_bitmap_with_options(test_bitmap, 400.0, 300.0, option_flip_x_with_options(option_defaults()));
        refresh_screen();
        assert_eq!(color_black(), get_pixel_from_window(test_window, 425.0, 300.0));
        assert_eq!(color_white(), get_pixel_from_window(test_window, 375.0, 300.0));
        free_bitmap(test_bitmap);
    }
    #[test]
    fn test_option_flip_xy_integration() {
        let test_window = open_window("Test Window 27".to_string(), 800, 600);
        let _cleanup_window = WindowCleanup::new();
        clear_window(test_window, color_white());
        let test_bitmap = create_bitmap("Test Bitmap 14".to_string(), 100, 100);
        let _cleanup_bitmap = BitmapCleanup::new();
        clear_bitmap(test_bitmap, color_white());
        fill_rectangle_on_bitmap(test_bitmap, color_black(), 0.0, 0.0, 50.0, 50.0);
        draw_bitmap_with_options(test_bitmap, 400.0, 300.0, option_flip_xy());
        refresh_screen();
        assert_eq!(color_black(), get_pixel_from_window(test_window, 450.0, 350.0));
        assert_eq!(color_white(), get_pixel_from_window(test_window, 450.0, 250.0));
        free_bitmap(test_bitmap);
    }
    #[test]
    fn test_option_flip_xy_with_options_integration() {
        let test_window = open_window("Test Window 28".to_string(), 800, 600);
        let _cleanup_window = WindowCleanup::new();
        clear_window(test_window, color_white());
        let test_bitmap = create_bitmap("Test Bitmap 15".to_string(), 100, 100);
        let _cleanup_bitmap = BitmapCleanup::new();
        clear_bitmap(test_bitmap, color_white());
        fill_rectangle_on_bitmap(test_bitmap, color_black(), 0.0, 0.0, 50.0, 50.0);
        draw_bitmap_with_options(test_bitmap, 400.0, 300.0, option_flip_xy_with_options(option_defaults()));
        refresh_screen();
        assert_eq!(color_black(), get_pixel_from_window(test_window, 450.0, 350.0));
        assert_eq!(color_white(), get_pixel_from_window(test_window, 450.0, 250.0));
        free_bitmap(test_bitmap);
    }
    #[test]
    fn test_option_flip_y_integration() {
        let test_window = open_window("Test Window 29".to_string(), 800, 600);
        let _cleanup_window = WindowCleanup::new();
        clear_window(test_window, color_white());
        let test_bitmap = create_bitmap("Test Bitmap 16".to_string(), 100, 100);
        let _cleanup_bitmap = BitmapCleanup::new();
        clear_bitmap(test_bitmap, color_white());
        fill_rectangle_on_bitmap(test_bitmap, color_black(), 0.0, 0.0, 100.0, 50.0);
        draw_bitmap_with_options(test_bitmap, 400.0, 300.0, option_flip_y());
        refresh_screen();
        assert_eq!(color_black(), get_pixel_from_window(test_window, 400.0, 325.0));
        assert_eq!(color_white(), get_pixel_from_window(test_window, 400.0, 275.0));
        free_bitmap(test_bitmap);
    }
    #[test]
    fn test_option_flip_y_with_options_integration() {
        let test_window = open_window("Test Window 30".to_string(), 800, 600);
        let _cleanup_window = WindowCleanup::new();
        clear_window(test_window, color_white());
        let test_bitmap = create_bitmap("Test Bitmap 17".to_string(), 100, 100);
        let _cleanup_bitmap = BitmapCleanup::new();
        clear_bitmap(test_bitmap, color_white());
        fill_rectangle_on_bitmap(test_bitmap, color_black(), 0.0, 0.0, 100.0, 50.0);
        draw_bitmap_with_options(test_bitmap, 400.0, 300.0, option_flip_y_with_options(option_defaults()));
        refresh_screen();
        assert_eq!(color_black(), get_pixel_from_window(test_window, 400.0, 325.0));
        assert_eq!(color_white(), get_pixel_from_window(test_window, 400.0, 275.0));
        free_bitmap(test_bitmap);
    }
    #[test]
    fn test_option_line_width_integration() {
        let test_window = open_window("Test Window 31".to_string(), 800, 600);
        let _cleanup_window = WindowCleanup::new();
        clear_window(test_window, color_white());
        draw_line_with_options(color_black(), 100.0, 100.0, 200.0, 200.0, option_line_width(5));
        refresh_screen();
        assert_eq!(color_black(), get_pixel_from_window(test_window, 150.0, 150.0));
        assert_eq!(color_white(), get_pixel_from_window(test_window, 140.0, 150.0));
    }
    #[test]
    fn test_option_line_width_with_options_integration() {
        let test_window = open_window("Test Window 32".to_string(), 800, 600);
        let _cleanup_window = WindowCleanup::new();
        clear_window(test_window, color_white());
        draw_line_with_options(color_black(), 100.0, 100.0, 200.0, 200.0, option_line_width_with_options(5, option_defaults()));
        refresh_screen();
        assert_eq!(color_black(), get_pixel_from_window(test_window, 150.0, 150.0));
        assert_eq!(color_white(), get_pixel_from_window(test_window, 145.0, 150.0));
    }
    #[test]
    fn test_option_part_bmp_integration() {
        let test_window = open_window("Test Window 33".to_string(), 800, 600);
        let _cleanup_window = WindowCleanup::new();
        clear_window(test_window, color_white());
        let test_bitmap = create_bitmap("Test Bitmap 18".to_string(), 100, 100);
        let _cleanup_bitmap = BitmapCleanup::new();
        clear_bitmap(test_bitmap, color_black());
        draw_bitmap_with_options(test_bitmap, 100.0, 100.0, option_part_bmp(0.0, 0.0, 50.0, 50.0));
        refresh_screen();
        assert_eq!(color_black(), get_pixel_from_window(test_window, 125.0, 125.0));
        assert_eq!(color_white(), get_pixel_from_window(test_window, 175.0, 175.0));
        free_bitmap(test_bitmap);
    }
    #[test]
    fn test_option_part_bmp_with_options_integration() {
        let test_window = open_window("Test Window 34".to_string(), 800, 600);
        let _cleanup_window = WindowCleanup::new();
        clear_window(test_window, color_white());
        let test_bitmap = create_bitmap("Test Bitmap 19".to_string(), 100, 100);
        let _cleanup_bitmap = BitmapCleanup::new();
        clear_bitmap(test_bitmap, color_black());
        draw_bitmap_with_options(test_bitmap, 100.0, 100.0, option_part_bmp_with_options(0.0, 0.0, 50.0, 50.0, option_defaults()));
        refresh_screen();
        assert_eq!(color_black(), get_pixel_from_window(test_window, 125.0, 125.0));
        assert_eq!(color_white(), get_pixel_from_window(test_window, 175.0, 175.0));
        free_bitmap(test_bitmap);
    }
    #[test]
    fn test_option_part_bmp_from_rectangle_integration() {
        let test_window = open_window("Test Window 35".to_string(), 800, 600);
        let _cleanup_window = WindowCleanup::new();
        clear_window(test_window, color_white());
        let test_bitmap = create_bitmap("Test Bitmap 20".to_string(), 100, 100);
        let _cleanup_bitmap = BitmapCleanup::new();
        clear_bitmap(test_bitmap, color_black());
        draw_bitmap_with_options(test_bitmap, 0.0, 0.0, option_part_bmp_from_rectangle(rectangle_from(0.0, 0.0, 50.0, 50.0)));
        refresh_screen();
        assert_eq!(color_black(), get_pixel_from_window(test_window, 25.0, 25.0));
        assert_eq!(color_white(), get_pixel_from_window(test_window, 75.0, 75.0));
        free_bitmap(test_bitmap);
    }
    #[test]
    fn test_option_part_bmp_from_rectangle_with_options_integration() {
        let test_window = open_window("Test Window 36".to_string(), 800, 600);
        let _cleanup_window = WindowCleanup::new();
        clear_window(test_window, color_white());
        let test_bitmap = create_bitmap("Test Bitmap 21".to_string(), 100, 100);
        let _cleanup_bitmap = BitmapCleanup::new();
        clear_bitmap(test_bitmap, color_black());
        draw_bitmap_with_options(test_bitmap, 0.0, 0.0, option_part_bmp_from_rectangle_with_options(rectangle_from(0.0, 0.0, 50.0, 50.0), option_defaults()));
        refresh_screen();
        assert_eq!(color_black(), get_pixel_from_window(test_window, 25.0, 25.0));
        assert_eq!(color_white(), get_pixel_from_window(test_window, 75.0, 75.0));
        free_bitmap(test_bitmap);
    }
    #[test]
    fn test_option_rotate_bmp_integration() {
        let test_window = open_window("Test Window 37".to_string(), 800, 600);
        let _cleanup_window = WindowCleanup::new();
        clear_window(test_window, color_white());
        let test_bitmap = create_bitmap("Test Bitmap 22".to_string(), 100, 100);
        let _cleanup_bitmap = BitmapCleanup::new();
        clear_bitmap(test_bitmap, color_white());
        fill_rectangle_on_bitmap(test_bitmap, color_black(), 0.0, 0.0, 50.0, 100.0);
        draw_bitmap_with_options(test_bitmap, 400.0, 300.0, option_rotate_bmp(90.0));
        refresh_screen();
        assert_eq!(color_black(), get_pixel_from_window(test_window, 400.0, 300.0));
        assert_eq!(color_white(), get_pixel_from_window(test_window, 400.0, 350.0));
        free_bitmap(test_bitmap);
    }
    #[test]
    fn test_option_rotate_bmp_with_anchor_integration() {
        let test_window = open_window("Test Window 38".to_string(), 800, 600);
        let _cleanup_window = WindowCleanup::new();
        clear_window(test_window, color_white());
        let test_bitmap = create_bitmap("Test Bitmap 23".to_string(), 100, 100);
        let _cleanup_bitmap = BitmapCleanup::new();
        clear_bitmap(test_bitmap, color_white());
        fill_rectangle_on_bitmap(test_bitmap, color_black(), 0.0, 0.0, 50.0, 100.0);
        draw_bitmap_with_options(test_bitmap, 400.0, 300.0, option_rotate_bmp_with_anchor(90.0, 50.0, 50.0));
        refresh_screen();
        assert_eq!(color_black(), get_pixel_from_window(test_window, 500.0, 300.0));
        assert_eq!(color_white(), get_pixel_from_window(test_window, 450.0, 300.0));
        free_bitmap(test_bitmap);
    }
    #[test]
    fn test_option_rotate_bmp_with_anchor_and_options_integration() {
        let test_window = open_window("Test Window 39".to_string(), 800, 600);
        let _cleanup_window = WindowCleanup::new();
        clear_window(test_window, color_white());
        let test_bitmap = create_bitmap("Test Bitmap 24".to_string(), 100, 100);
        let _cleanup_bitmap = BitmapCleanup::new();
        clear_bitmap(test_bitmap, color_white());
        fill_rectangle_on_bitmap(test_bitmap, color_black(), 0.0, 0.0, 50.0, 100.0);
        draw_bitmap_with_options(test_bitmap, 400.0, 300.0, option_rotate_bmp_with_anchor_and_options(90.0, 50.0, 50.0, option_defaults()));
        refresh_screen();
        assert_eq!(color_black(), get_pixel_from_window(test_window, 500.0, 300.0));
        assert_eq!(color_white(), get_pixel_from_window(test_window, 400.0, 300.0));
        free_bitmap(test_bitmap);
    }
    #[test]
    fn test_option_rotate_bmp_with_options_integration() {
        let test_window = open_window("Test Window 40".to_string(), 800, 600);
        let _cleanup_window = WindowCleanup::new();
        clear_window(test_window, color_white());
        let test_bitmap = create_bitmap("Test Bitmap 25".to_string(), 100, 100);
        let _cleanup_bitmap = BitmapCleanup::new();
        clear_bitmap(test_bitmap, color_white());
        fill_rectangle_on_bitmap(test_bitmap, color_black(), 0.0, 0.0, 50.0, 100.0);
        draw_bitmap_with_options(test_bitmap, 400.0, 300.0, option_rotate_bmp_with_options(90.0, option_defaults()));
        refresh_screen();
        assert_eq!(color_black(), get_pixel_from_window(test_window, 400.0, 300.0));
        assert_eq!(color_white(), get_pixel_from_window(test_window, 400.0, 350.0));
        free_bitmap(test_bitmap);
    }
    #[test]
    fn test_option_scale_bmp_integration() {
        let test_window = open_window("Test Window 41".to_string(), 800, 600);
        let _cleanup_window = WindowCleanup::new();
        clear_window(test_window, color_white());
        let test_bitmap = create_bitmap("Test Bitmap 26".to_string(), 50, 50);
        let _cleanup_bitmap = BitmapCleanup::new();
        clear_bitmap(test_bitmap, color_black());
        draw_bitmap_with_options(test_bitmap, 400.0, 300.0, option_scale_bmp(2.0, 2.0));
        refresh_screen();
        assert_eq!(color_black(), get_pixel_from_window(test_window, 451.0, 300.0));
        assert_eq!(color_white(), get_pixel_from_window(test_window, 500.0, 300.0));
        free_bitmap(test_bitmap);
    }
    #[test]
    fn test_option_scale_bmp_with_options_integration() {
        let test_window = open_window("Test Window 42".to_string(), 800, 600);
        let _cleanup_window = WindowCleanup::new();
        clear_window(test_window, color_white());
        let test_bitmap = create_bitmap("Test Bitmap 27".to_string(), 50, 50);
        let _cleanup_bitmap = BitmapCleanup::new();
        clear_bitmap(test_bitmap, color_black());
        draw_bitmap_with_options(test_bitmap, 400.0, 300.0, option_scale_bmp_with_options(2.0, 2.0, option_defaults()));
        refresh_screen();
        assert_eq!(color_black(), get_pixel_from_window(test_window, 451.0, 300.0));
        assert_eq!(color_white(), get_pixel_from_window(test_window, 500.0, 300.0));
        free_bitmap(test_bitmap);
    }
    #[test]
    fn test_option_to_screen_integration() {
        let test_window = open_window("Test Window 43".to_string(), 800, 600);
        let _cleanup_window = WindowCleanup::new();
        clear_window(test_window, color_white());
        draw_circle_record_with_options(color_black(), circle_at_from_points(400.0, 300.0, 50.0), option_to_screen());
        refresh_screen();
        assert_eq!(color_black(), get_pixel_from_window(test_window, 450.0, 300.0));
        assert_eq!(color_white(), get_pixel_from_window(test_window, 451.0, 300.0));
    }
    #[test]
    fn test_option_to_screen_with_options_integration() {
        let test_window = open_window("Test Window 44".to_string(), 800, 600);
        let _cleanup_window = WindowCleanup::new();
        clear_window(test_window, color_white());
        draw_circle_record_with_options(color_black(), circle_at_from_points(400.0, 300.0, 50.0), option_to_screen_with_options(option_defaults()));
        refresh_screen();
        assert_eq!(color_black(), get_pixel_from_window(test_window, 400.0, 250.0));
        assert_eq!(color_white(), get_pixel_from_window(test_window, 400.0, 300.0));
    }
    #[test]
    fn test_option_to_world_integration() {
        let test_window = open_window("Test Window 45".to_string(), 800, 600);
        let _cleanup_window = WindowCleanup::new();
        clear_window(test_window, color_white());
        move_camera_to(100.0, 100.0);
        draw_circle_record_with_options(color_black(), circle_at_from_points(400.0, 300.0, 50.0), option_to_world());
        refresh_screen();
        assert_eq!(color_black(), get_pixel_from_window(test_window, 350.0, 200.0));
        assert_eq!(color_white(), get_pixel_from_window(test_window, 375.0, 200.0));
    }
    #[test]
    fn test_option_to_world_with_options_integration() {
        let test_window = open_window("Test Window 46".to_string(), 800, 600);
        let _cleanup_window = WindowCleanup::new();
        clear_window(test_window, color_white());
        move_camera_to(100.0, 100.0);
        draw_circle_record_with_options(color_black(), circle_at_from_points(400.0, 300.0, 50.0), option_to_world_with_options(option_defaults()));
        refresh_screen();
        assert_eq!(color_black(), get_pixel_from_window(test_window, 350.0, 200.0));
        assert_eq!(color_white(), get_pixel_from_window(test_window, 375.0, 200.0));
    }
    #[test]
    fn test_option_with_animation_integration() {
        let test_window = open_window("Test Window 47".to_string(), 800, 600);
        let _cleanup_window = WindowCleanup::new();
        let kermit_script = load_animation_script("Test Script 1".to_string(), "kermit.txt".to_string());
        let _cleanup_animation_script = AnimationScriptCleanup::new();
        let test_animation = create_animation(kermit_script, "moonwalkback".to_string());
        let _cleanup_animation = AnimationCleanup::new(test_animation);
        let test_bitmap = load_bitmap("Test Bitmap 28".to_string(), "frog.png".to_string());
        let _cleanup_bitmap = BitmapCleanup::new();
        bitmap_set_cell_details(test_bitmap, 73, 105, 4, 4, 16);
        while window_close_requested(test_window) == false {
            clear_screen_to_white();
            draw_bitmap_with_options(test_bitmap, 100.0, 100.0, option_with_animation(test_animation));
            draw_text_no_font_no_size("Test: option_with_animation. Should be moving. Close when done.".to_string(), color_black(), 10.0, 10.0);
            update_animation(test_animation);
            delay(100);
            refresh_screen();
        }
    }
    #[test]
    fn test_option_with_animation_with_options_integration() {
        let test_window = open_window("Test Window 48".to_string(), 800, 600);
        let _cleanup_window = WindowCleanup::new();
        let kermit_script = load_animation_script("Test Script 2".to_string(), "kermit.txt".to_string());
        let _cleanup_animation_script = AnimationScriptCleanup::new();
        let test_animation = create_animation(kermit_script, "moonwalkback".to_string());
        let _cleanup_animation = AnimationCleanup::new(test_animation);
        let test_bitmap = load_bitmap("Test Bitmap 29".to_string(), "frog.png".to_string());
        let _cleanup_bitmap = BitmapCleanup::new();
        bitmap_set_cell_details(test_bitmap, 73, 105, 4, 4, 16);
        while window_close_requested(test_window) == false {
            clear_screen_to_white();
            draw_bitmap_with_options(test_bitmap, 100.0, 100.0, option_with_animation_with_options(test_animation, option_defaults()));
            draw_text_no_font_no_size("Test: option_with_animation_with_options. Should be moving. Close when done.".to_string(), color_black(), 10.0, 10.0);
            update_animation(test_animation);
            delay(100);
            refresh_screen();
        }
    }
    #[test]
    fn test_option_with_bitmap_cell_integration() {
        let test_window = open_window("Test Window 49".to_string(), 800, 600);
        let _cleanup_window = WindowCleanup::new();
        clear_window(test_window, color_white());
        let test_bitmap = create_bitmap("Test Bitmap 30".to_string(), 64, 64);
        let _cleanup_bitmap = BitmapCleanup::new();
        clear_bitmap(test_bitmap, color_black());
        bitmap_set_cell_details(test_bitmap, 32, 32, 2, 2, 4);
        draw_bitmap_with_options(test_bitmap, 100.0, 100.0, option_with_bitmap_cell(1));
        refresh_screen();
        assert_eq!(color_black(), get_pixel_from_window(test_window, 116.0, 116.0));
        assert_eq!(color_white(), get_pixel_from_window(test_window, 84.0, 84.0));
        free_bitmap(test_bitmap);
    }
    #[test]
    fn test_option_with_bitmap_cell_with_options_integration() {
        let test_window = open_window("Test Window 50".to_string(), 800, 600);
        let _cleanup_window = WindowCleanup::new();
        clear_window(test_window, color_white());
        let test_bitmap = create_bitmap("Test Bitmap 31".to_string(), 64, 64);
        let _cleanup_bitmap = BitmapCleanup::new();
        clear_bitmap(test_bitmap, color_black());
        bitmap_set_cell_details(test_bitmap, 32, 32, 2, 2, 4);
        draw_bitmap_with_options(test_bitmap, 100.0, 100.0, option_with_bitmap_cell_with_options(1, option_defaults()));
        refresh_screen();
        assert_eq!(color_black(), get_pixel_from_window(test_window, 116.0, 116.0));
        assert_eq!(color_white(), get_pixel_from_window(test_window, 84.0, 84.0));
        free_bitmap(test_bitmap);
    }
    #[test]
    fn test_draw_ellipse_within_rectangle_integration() {
        let test_window = open_window("Test Window 51".to_string(), 800, 600);
        let _cleanup_window = WindowCleanup::new();
        clear_window(test_window, color_white());
        draw_ellipse_within_rectangle(color_black(), rectangle_from(100.0, 100.0, 200.0, 150.0));
        refresh_screen();
        assert_eq!(color_black(), get_pixel_from_window(test_window, 300.0, 175.0));
        assert_eq!(color_white(), get_pixel_from_window(test_window, 200.0, 175.0));
        assert_eq!(color_white(), get_pixel_from_window(test_window, 350.0, 175.0));
    }
    #[test]
    fn test_draw_ellipse_within_rectangle_with_options_integration() {
        let test_window = open_window("Test Window 52".to_string(), 800, 600);
        let _cleanup_window = WindowCleanup::new();
        clear_window(test_window, color_white());
        draw_ellipse_within_rectangle_with_options(color_black(), rectangle_from(100.0, 100.0, 200.0, 100.0), option_defaults());
        refresh_screen();
        assert_eq!(color_black(), get_pixel_from_window(test_window, 300.0, 150.0));
        assert_eq!(color_white(), get_pixel_from_window(test_window, 200.0, 150.0));
        assert_eq!(color_white(), get_pixel_from_window(test_window, 350.0, 150.0));
    }
    #[test]
    fn test_draw_ellipse_integration() {
        let test_window = open_window("Test Window 53".to_string(), 800, 600);
        let _cleanup_window = WindowCleanup::new();
        clear_window(test_window, color_white());
        draw_ellipse(color_black(), 400.0, 300.0, 100.0, 50.0);
        refresh_screen();
        assert_eq!(color_black(), get_pixel_from_window(test_window, 450.0, 300.0));
        assert_eq!(color_white(), get_pixel_from_window(test_window, 400.0, 300.0));
        assert_eq!(color_white(), get_pixel_from_window(test_window, 500.0, 300.0));
    }
    #[test]
    fn test_draw_ellipse_with_options_integration() {
        let test_window = open_window("Test Window 54".to_string(), 800, 600);
        let _cleanup_window = WindowCleanup::new();
        clear_window(test_window, color_white());
        draw_ellipse_with_options(color_black(), 400.0, 300.0, 100.0, 50.0, option_defaults());
        refresh_screen();
        assert_eq!(color_black(), get_pixel_from_window(test_window, 450.0, 300.0));
        assert_eq!(color_white(), get_pixel_from_window(test_window, 400.0, 300.0));
        assert_eq!(color_white(), get_pixel_from_window(test_window, 500.0, 300.0));
    }
    #[test]
    fn test_draw_ellipse_on_bitmap_within_rectangle_integration() {
        let test_bitmap = create_bitmap("Test Bitmap 32".to_string(), 200, 200);
        let _cleanup_bitmap = BitmapCleanup::new();
        clear_bitmap(test_bitmap, color_white());
        let rect = rectangle_from(50.0, 50.0, 100.0, 100.0);
        draw_ellipse_on_bitmap_within_rectangle(test_bitmap, color_black(), rect);
        assert_eq!(color_black(), get_pixel_from_bitmap(test_bitmap, 150.0, 100.0));
        assert_eq!(color_white(), get_pixel_from_bitmap(test_bitmap, 125.0, 100.0));
        assert_eq!(color_white(), get_pixel_from_bitmap(test_bitmap, 175.0, 100.0));
    }
    #[test]
    fn test_draw_ellipse_on_bitmap_within_rectangle_with_options_integration() {
        let test_bitmap = create_bitmap("Test Bitmap 33".to_string(), 200, 200);
        let _cleanup_bitmap = BitmapCleanup::new();
        clear_bitmap(test_bitmap, color_white());
        draw_ellipse_on_bitmap_within_rectangle_with_options(test_bitmap, color_black(), rectangle_from(50.0, 50.0, 100.0, 100.0), option_defaults());
        assert_eq!(color_black(), get_pixel_from_bitmap(test_bitmap, 150.0, 100.0));
        assert_eq!(color_white(), get_pixel_from_bitmap(test_bitmap, 125.0, 100.0));
        assert_eq!(color_white(), get_pixel_from_bitmap(test_bitmap, 175.0, 100.0));
    }
    #[test]
    fn test_draw_ellipse_on_bitmap_integration() {
        let test_bitmap = create_bitmap("Test Bitmap 34".to_string(), 200, 200);
        let _cleanup_bitmap = BitmapCleanup::new();
        clear_bitmap(test_bitmap, color_white());
        draw_ellipse_on_bitmap(test_bitmap, color_black(), 100.0, 100.0, 50.0, 30.0);
        assert_eq!(color_black(), get_pixel_from_bitmap(test_bitmap, 125.0, 100.0));
        assert_eq!(color_white(), get_pixel_from_bitmap(test_bitmap, 100.0, 100.0));
        assert_eq!(color_white(), get_pixel_from_bitmap(test_bitmap, 160.0, 100.0));
    }
    #[test]
    fn test_draw_ellipse_on_bitmap_with_options_integration() {
        let test_bitmap = create_bitmap("Test Bitmap 35".to_string(), 200, 200);
        let _cleanup_bitmap = BitmapCleanup::new();
        clear_bitmap(test_bitmap, color_white());
        draw_ellipse_on_bitmap_with_options(test_bitmap, color_black(), 100.0, 100.0, 50.0, 30.0, option_defaults());
        assert_eq!(color_black(), get_pixel_from_bitmap(test_bitmap, 125.0, 100.0));
        assert_eq!(color_white(), get_pixel_from_bitmap(test_bitmap, 100.0, 100.0));
        assert_eq!(color_white(), get_pixel_from_bitmap(test_bitmap, 160.0, 100.0));
    }
    #[test]
    fn test_draw_ellipse_on_window_within_rectangle_integration() {
        let test_window = open_window("Test Window 55".to_string(), 800, 600);
        let _cleanup_window = WindowCleanup::new();
        clear_window(test_window, color_white());
        let rect = rectangle_from(100.0, 100.0, 200.0, 100.0);
        draw_ellipse_on_window_within_rectangle(test_window, color_black(), rect);
        refresh_screen();
        assert_eq!(color_black(), get_pixel_from_window(test_window, 300.0, 150.0));
        assert_eq!(color_white(), get_pixel_from_window(test_window, 250.0, 150.0));
        assert_eq!(color_white(), get_pixel_from_window(test_window, 350.0, 150.0));
    }
    #[test]
    fn test_draw_ellipse_on_window_within_rectangle_with_options_integration() {
        let test_window = open_window("Test Window 56".to_string(), 800, 600);
        let _cleanup_window = WindowCleanup::new();
        clear_window(test_window, color_white());
        let rect = rectangle_from(100.0, 100.0, 200.0, 100.0);
        draw_ellipse_on_window_within_rectangle_with_options(test_window, color_black(), rect, option_defaults());
        refresh_screen();
        assert_eq!(color_black(), get_pixel_from_window(test_window, 300.0, 150.0));
        assert_eq!(color_white(), get_pixel_from_window(test_window, 250.0, 150.0));
        assert_eq!(color_white(), get_pixel_from_window(test_window, 350.0, 150.0));
    }
    #[test]
    fn test_draw_ellipse_on_window_integration() {
        let test_window = open_window("Test Window 57".to_string(), 800, 600);
        let _cleanup_window = WindowCleanup::new();
        clear_window(test_window, color_white());
        draw_ellipse_on_window(test_window, color_black(), 400.0, 300.0, 100.0, 50.0);
        refresh_screen();
        assert_eq!(color_black(), get_pixel_from_window(test_window, 450.0, 300.0));
        assert_eq!(color_white(), get_pixel_from_window(test_window, 400.0, 300.0));
        assert_eq!(color_white(), get_pixel_from_window(test_window, 500.0, 300.0));
    }
    #[test]
    fn test_draw_ellipse_on_window_with_options_integration() {
        let test_window = open_window("Test Window 58".to_string(), 800, 600);
        let _cleanup_window = WindowCleanup::new();
        clear_window(test_window, color_white());
        draw_ellipse_on_window_with_options(test_window, color_black(), 400.0, 300.0, 100.0, 50.0, option_defaults());
        refresh_screen();
        assert_eq!(color_black(), get_pixel_from_window(test_window, 450.0, 300.0));
        assert_eq!(color_white(), get_pixel_from_window(test_window, 450.0, 325.0));
        assert_eq!(color_white(), get_pixel_from_window(test_window, 500.0, 300.0));
    }
    #[test]
    fn test_fill_ellipse_within_rectangle_integration() {
        let test_window = open_window("Test Window 59".to_string(), 800, 600);
        let _cleanup_window = WindowCleanup::new();
        clear_window(test_window, color_white());
        fill_ellipse_within_rectangle(color_black(), rectangle_from(100.0, 100.0, 200.0, 100.0));
        refresh_screen();
        assert_eq!(color_black(), get_pixel_from_window(test_window, 200.0, 100.0));
        assert_eq!(color_black(), get_pixel_from_window(test_window, 150.0, 150.0));
        assert_eq!(color_white(), get_pixel_from_window(test_window, 50.0, 50.0));
    }
    #[test]
    fn test_fill_ellipse_within_rectangle_with_options_integration() {
        let test_window = open_window("Test Window 60".to_string(), 800, 600);
        let _cleanup_window = WindowCleanup::new();
        clear_window(test_window, color_white());
        fill_ellipse_within_rectangle_with_options(color_black(), rectangle_from(100.0, 100.0, 200.0, 100.0), option_defaults());
        refresh_screen();
        assert_eq!(color_black(), get_pixel_from_window(test_window, 200.0, 100.0));
        assert_eq!(color_black(), get_pixel_from_window(test_window, 150.0, 150.0));
        assert_eq!(color_white(), get_pixel_from_window(test_window, 50.0, 50.0));
    }
    #[test]
    fn test_fill_ellipse_integration() {
        let test_window = open_window("Test Window 61".to_string(), 800, 600);
        let _cleanup_window = WindowCleanup::new();
        clear_window(test_window, color_white());
        fill_ellipse(color_black(), 400.0, 300.0, 100.0, 50.0);
        refresh_screen();
        assert_eq!(color_black(), get_pixel_from_window(test_window, 450.0, 300.0));
        assert_eq!(color_black(), get_pixel_from_window(test_window, 450.0, 325.0));
        assert_eq!(color_white(), get_pixel_from_window(test_window, 500.0, 300.0));
    }
    #[test]
    fn test_fill_ellipse_with_options_integration() {
        let test_window = open_window("Test Window 62".to_string(), 800, 600);
        let _cleanup_window = WindowCleanup::new();
        clear_window(test_window, color_white());
        fill_ellipse_with_options(color_black(), 400.0, 300.0, 100.0, 50.0, option_defaults());
        refresh_screen();
        assert_eq!(color_black(), get_pixel_from_window(test_window, 450.0, 300.0));
        assert_eq!(color_black(), get_pixel_from_window(test_window, 450.0, 325.0));
        assert_eq!(color_white(), get_pixel_from_window(test_window, 300.0, 300.0));
    }
    #[test]
    fn test_fill_ellipse_on_bitmap_within_rectangle_integration() {
        let test_bitmap = create_bitmap("Test Bitmap 36".to_string(), 200, 200);
        let _cleanup_bitmap = BitmapCleanup::new();
        clear_bitmap(test_bitmap, color_white());
        fill_ellipse_on_bitmap_within_rectangle(test_bitmap, color_black(), rectangle_from(50.0, 50.0, 100.0, 100.0));
        assert_eq!(color_black(), get_pixel_from_bitmap(test_bitmap, 100.0, 100.0));
        assert_eq!(color_black(), get_pixel_from_bitmap(test_bitmap, 75.0, 75.0));
        assert_eq!(color_white(), get_pixel_from_bitmap(test_bitmap, 175.0, 175.0));
    }
    #[test]
    fn test_fill_ellipse_on_bitmap_within_rectangle_with_options_integration() {
        let test_bitmap = create_bitmap("Test Bitmap 37".to_string(), 200, 200);
        let _cleanup_bitmap = BitmapCleanup::new();
        clear_bitmap(test_bitmap, color_white());
        fill_ellipse_on_bitmap_within_rectangle_with_options(test_bitmap, color_black(), rectangle_from(50.0, 50.0, 100.0, 100.0), option_defaults());
        assert_eq!(color_black(), get_pixel_from_bitmap(test_bitmap, 100.0, 100.0));
        assert_eq!(color_black(), get_pixel_from_bitmap(test_bitmap, 75.0, 75.0));
        assert_eq!(color_white(), get_pixel_from_bitmap(test_bitmap, 175.0, 175.0));
    }
    #[test]
    fn test_fill_ellipse_on_bitmap_integration() {
        let test_bitmap = create_bitmap("Test Bitmap 38".to_string(), 200, 200);
        let _cleanup_bitmap = BitmapCleanup::new();
        clear_bitmap(test_bitmap, color_white());
        fill_ellipse_on_bitmap(test_bitmap, color_black(), 100.0, 100.0, 50.0, 30.0);
        assert_eq!(color_black(), get_pixel_from_bitmap(test_bitmap, 125.0, 100.0));
        assert_eq!(color_black(), get_pixel_from_bitmap(test_bitmap, 125.0, 125.0));
        assert_eq!(color_white(), get_pixel_from_bitmap(test_bitmap, 150.0, 100.0));
    }
    #[test]
    fn test_fill_ellipse_on_bitmap_with_options_integration() {
        let test_bitmap = create_bitmap("Test Bitmap 39".to_string(), 200, 200);
        let _cleanup_bitmap = BitmapCleanup::new();
        clear_bitmap(test_bitmap, color_white());
        fill_ellipse_on_bitmap_with_options(test_bitmap, color_black(), 50.0, 50.0, 100.0, 50.0, option_defaults());
        assert_eq!(color_black(), get_pixel_from_bitmap(test_bitmap, 100.0, 50.0));
        assert_eq!(color_black(), get_pixel_from_bitmap(test_bitmap, 100.0, 75.0));
        assert_eq!(color_white(), get_pixel_from_bitmap(test_bitmap, 150.0, 50.0));
    }
    #[test]
    fn test_fill_ellipse_on_window_within_rectangle_integration() {
        let test_window = open_window("Test Window 63".to_string(), 800, 600);
        let _cleanup_window = WindowCleanup::new();
        clear_window(test_window, color_white());
        fill_ellipse_on_window_within_rectangle(test_window, color_black(), rectangle_from(100.0, 100.0, 200.0, 150.0));
        refresh_screen();
        assert_eq!(color_black(), get_pixel_from_window(test_window, 200.0, 175.0));
        assert_eq!(color_black(), get_pixel_from_window(test_window, 150.0, 175.0));
        assert_eq!(color_white(), get_pixel_from_window(test_window, 350.0, 175.0));
    }
    #[test]
    fn test_fill_ellipse_on_window_within_rectangle_with_options_integration() {
        let test_window = open_window("Test Window 64".to_string(), 800, 600);
        let _cleanup_window = WindowCleanup::new();
        clear_window(test_window, color_white());
        fill_ellipse_on_window_within_rectangle_with_options(test_window, color_black(), rectangle_from(100.0, 100.0, 200.0, 150.0), option_defaults());
        refresh_screen();
        assert_eq!(color_black(), get_pixel_from_window(test_window, 200.0, 175.0));
        assert_eq!(color_black(), get_pixel_from_window(test_window, 150.0, 175.0));
        assert_eq!(color_white(), get_pixel_from_window(test_window, 350.0, 175.0));
    }
    #[test]
    fn test_fill_ellipse_on_window_integration() {
        let test_window = open_window("Test Window 65".to_string(), 800, 600);
        let _cleanup_window = WindowCleanup::new();
        clear_window(test_window, color_white());
        fill_ellipse_on_window(test_window, color_black(), 400.0, 300.0, 100.0, 50.0);
        refresh_screen();
        assert_eq!(color_black(), get_pixel_from_window(test_window, 450.0, 300.0));
        assert_eq!(color_black(), get_pixel_from_window(test_window, 450.0, 325.0));
        assert_eq!(color_white(), get_pixel_from_window(test_window, 500.0, 300.0));
    }
    #[test]
    fn test_fill_ellipse_on_window_with_options_integration() {
        let test_window = open_window("Test Window 66".to_string(), 800, 600);
        let _cleanup_window = WindowCleanup::new();
        clear_window(test_window, color_white());
        fill_ellipse_on_window_with_options(test_window, color_black(), 400.0, 300.0, 100.0, 50.0, option_defaults());
        refresh_screen();
        assert_eq!(color_black(), get_pixel_from_window(test_window, 450.0, 300.0));
        assert_eq!(color_black(), get_pixel_from_window(test_window, 450.0, 325.0));
        assert_eq!(color_white(), get_pixel_from_window(test_window, 500.0, 300.0));
    }
    #[test]
    fn test_clear_screen_to_white_integration() {
        let test_window = open_window("Test Window 67".to_string(), 800, 600);
        let _cleanup_window = WindowCleanup::new();
        draw_pixel(color_black(), 100.0, 100.0);
        refresh_screen();
        assert_eq!(color_black(), get_pixel_from_window(test_window, 100.0, 100.0));
        clear_screen_to_white();
        refresh_screen();
        assert_eq!(color_white(), get_pixel_from_window(test_window, 100.0, 100.0));
    }
    #[test]
    fn test_clear_screen_integration() {
        let test_window = open_window("Test Window 68".to_string(), 800, 600);
        let _cleanup_window = WindowCleanup::new();
        draw_pixel(color_black(), 100.0, 100.0);
        refresh_screen();
        assert_eq!(color_black(), get_pixel_from_window(test_window, 100.0, 100.0));
        clear_screen(color_white());
        refresh_screen();
        assert_eq!(color_white(), get_pixel_from_window(test_window, 100.0, 100.0));
    }
    #[test]
    fn test_display_details_integration() {
        let displays = number_of_displays();
        assert!(displays > 0);
        let display = display_details(0 as u32);
        assert!(!display.is_null());
        assert!(display_width(display) > 0);
        assert!(display_height(display) > 0);
        assert!(!display_name(display).is_empty());
    }
    #[test]
    fn test_display_height_integration() {
        let display = display_details(0 as u32);
        assert!(display_height(display) > 0);
    }
    #[test]
    fn test_display_name_integration() {
        let display = display_details(0 as u32);
        assert!(!display_name(display).is_empty());
        assert!(!display_name(display).is_empty());
    }
    #[test]
    fn test_display_width_integration() {
        let display = display_details(0 as u32);
        assert!(display_width(display) > 0);
    }
    #[test]
    fn test_display_x_integration() {
        let display = display_details(0 as u32);
        assert_eq!(0, display_x(display));
    }
    #[test]
    fn test_display_y_integration() {
        let display = display_details(0 as u32);
        assert_eq!(0, display_y(display));
    }
    #[test]
    fn test_number_of_displays_integration() {
        assert!(number_of_displays() > 0);
    }
    #[test]
    fn test_refresh_screen_integration() {
        let test_window = open_window("Test Window 69".to_string(), 800, 600);
        let _cleanup_window = WindowCleanup::new();
        clear_window(test_window, color_white());
        draw_circle_record(color_black(), circle_at_from_points(400.0, 300.0, 50.0));
        refresh_screen();
    }
    #[test]
    fn test_refresh_screen_with_target_fps_integration() {
        let test_window = open_window("Test Window 70".to_string(), 800, 600);
        let _cleanup_window = WindowCleanup::new();
        clear_window(test_window, color_white());
        draw_circle_record(color_black(), circle_at_from_points(400.0, 300.0, 50.0));
        refresh_screen_with_target_fps(60 as u32);
    }
    #[test]
    fn test_save_bitmap_integration() {
        let test_bitmap = create_bitmap("Test Bitmap 40".to_string(), 100, 100);
        let _cleanup_bitmap = BitmapCleanup::new();
        clear_bitmap(test_bitmap, color_white());
        draw_pixel_on_bitmap(test_bitmap, color_black(), 50.0, 50.0);
        save_bitmap(test_bitmap, "Test Bitmap 40".to_string());
    }
    #[test]
    fn test_screen_height_integration() {
        open_window("Test Window 71".to_string(), 800, 600);
        let _cleanup_window = WindowCleanup::new();
        assert_eq!(600, screen_height());
    }
    #[test]
    fn test_screen_width_integration() {
        open_window("Test Window 72".to_string(), 800, 600);
        let _cleanup_window = WindowCleanup::new();
        assert_eq!(800, screen_width());
    }
    #[test]
    fn test_take_screenshot_integration() {
        let test_window = open_window("Test Window 73".to_string(), 800, 600);
        let _cleanup_window = WindowCleanup::new();
        clear_window(test_window, color_white());
        draw_circle_record(color_black(), circle_at_from_points(400.0, 300.0, 50.0));
        refresh_screen();
        take_screenshot("test_screenshot".to_string());
    }
    #[test]
    fn test_take_screenshot_of_window_integration() {
        let test_window = open_window("Test Window 74".to_string(), 800, 600);
        let _cleanup_window = WindowCleanup::new();
        clear_window(test_window, color_white());
        draw_circle_record(color_black(), circle_at_from_points(400.0, 300.0, 50.0));
        refresh_screen();
        take_screenshot_of_window(test_window, "test_screenshot".to_string());
    }
    #[test]
    fn test_bitmap_bounding_circle_integration() {
        let test_bitmap = create_bitmap("Test Bitmap 41".to_string(), 100, 100);
        let _cleanup_bitmap = BitmapCleanup::new();
        let test_point = point_at(50.0, 50.0);
        let bounding_circle = bitmap_bounding_circle(test_bitmap, test_point);
        assert_eq!(test_point, center_point_of_circle(bounding_circle));
        assert_eq!(100.0 as f32, circle_radius(bounding_circle));
    }
    #[test]
    fn test_bitmap_bounding_rectangle_integration() {
        let test_bitmap = create_bitmap("Test Bitmap 42".to_string(), 100, 100);
        let _cleanup_bitmap = BitmapCleanup::new();
        let bounding_rect = bitmap_bounding_rectangle(test_bitmap);
        assert_eq!(0.0, bounding_rect.x);
        assert_eq!(0.0, bounding_rect.y);
        assert_eq!(100.0, bounding_rect.width);
        assert_eq!(100.0, bounding_rect.height);
    }
    #[test]
    fn test_bitmap_bounding_rectangle_at_location_integration() {
        let test_bitmap = create_bitmap("Test Bitmap 43".to_string(), 100, 100);
        let _cleanup_bitmap = BitmapCleanup::new();
        let bounding_rect = bitmap_bounding_rectangle_at_location(test_bitmap, 50.0, 50.0);
        assert_eq!(50.0, bounding_rect.x);
        assert_eq!(50.0, bounding_rect.y);
        assert_eq!(100.0, bounding_rect.width);
        assert_eq!(100.0, bounding_rect.height);
    }
    #[test]
    fn test_bitmap_cell_center_integration() {
        let test_bitmap = create_bitmap("Test Bitmap 44".to_string(), 100, 100);
        let _cleanup_bitmap = BitmapCleanup::new();
        let center = bitmap_cell_center(test_bitmap);
        assert_eq!(50.0, center.x);
        assert_eq!(50.0, center.y);
    }
    #[test]
    fn test_bitmap_cell_circle_integration() {
        let test_bitmap = create_bitmap("Test Bitmap 45".to_string(), 100, 100);
        let _cleanup_bitmap = BitmapCleanup::new();
        bitmap_set_cell_details(test_bitmap, 50, 50, 2, 2, 4);
        let circle = bitmap_cell_circle(test_bitmap, 50.0, 50.0);
        assert_eq!(50.0, circle.center.x);
        assert_eq!(50.0, circle.center.x);
        assert_eq!(25.0, circle.radius);
    }
    #[test]
    fn test_bitmap_cell_circle_at_point_integration() {
        let test_bitmap = create_bitmap("Test Bitmap 46".to_string(), 100, 100);
        let _cleanup_bitmap = BitmapCleanup::new();
        bitmap_set_cell_details(test_bitmap, 50, 50, 2, 2, 4);
        let circle = bitmap_cell_circle_at_point(test_bitmap, point_at(100.0, 100.0));
        assert_eq!(100.0, circle.center.x);
        assert_eq!(100.0, circle.center.x);
        assert_eq!(25.0, circle.radius);
    }
    #[test]
    fn test_bitmap_cell_circle_at_point_with_scale_integration() {
        let test_bitmap = create_bitmap("Test Bitmap 47".to_string(), 100, 100);
        let _cleanup_bitmap = BitmapCleanup::new();
        bitmap_set_cell_details(test_bitmap, 50, 50, 2, 2, 4);
        let circle = bitmap_cell_circle_at_point_with_scale(test_bitmap, point_at(100.0, 100.0), 2.0);
        assert_eq!(100.0, circle.center.x);
        assert_eq!(100.0, circle.center.x);
        assert_eq!(50.0, circle.radius);
    }
    #[test]
    fn test_bitmap_cell_columns_integration() {
        let test_bitmap = create_bitmap("Test Bitmap 48".to_string(), 100, 100);
        let _cleanup_bitmap = BitmapCleanup::new();
        bitmap_set_cell_details(test_bitmap, 20, 20, 5, 5, 25);
        assert_eq!(5, bitmap_cell_columns(test_bitmap));
    }
    #[test]
    fn test_bitmap_cell_count_integration() {
        let test_bitmap = create_bitmap("Test Bitmap 49".to_string(), 100, 100);
        let _cleanup_bitmap = BitmapCleanup::new();
        bitmap_set_cell_details(test_bitmap, 20, 20, 5, 5, 25);
        assert_eq!(25, bitmap_cell_count(test_bitmap));
    }
    #[test]
    fn test_bitmap_cell_height_integration() {
        let test_bitmap = create_bitmap("Test Bitmap 50".to_string(), 100, 100);
        let _cleanup_bitmap = BitmapCleanup::new();
        bitmap_set_cell_details(test_bitmap, 20, 20, 5, 5, 25);
        assert_eq!(20, bitmap_cell_height(test_bitmap));
    }
    #[test]
    fn test_bitmap_cell_offset_integration() {
        let test_bitmap = create_bitmap("Test Bitmap 51".to_string(), 100, 100);
        let _cleanup_bitmap = BitmapCleanup::new();
        bitmap_set_cell_details(test_bitmap, 25, 25, 4, 4, 16);
        let offset = bitmap_cell_offset(test_bitmap, 5);
        assert_eq!(25.0, offset.x);
        assert_eq!(25.0, offset.y);
    }
    #[test]
    fn test_bitmap_cell_rectangle_integration() {
        let test_bitmap = create_bitmap("Test Bitmap 52".to_string(), 100, 100);
        let _cleanup_bitmap = BitmapCleanup::new();
        bitmap_set_cell_details(test_bitmap, 25, 25, 4, 4, 16);
        let rect = bitmap_cell_rectangle(test_bitmap);
        assert_eq!(0.0, rect.x);
        assert_eq!(0.0, rect.y);
        assert_eq!(25.0, rect.width);
        assert_eq!(25.0, rect.height);
    }
    #[test]
    fn test_bitmap_cell_rectangle_at_point_integration() {
        let test_bitmap = create_bitmap("Test Bitmap 53".to_string(), 100, 100);
        let _cleanup_bitmap = BitmapCleanup::new();
        bitmap_set_cell_details(test_bitmap, 25, 25, 4, 4, 16);
        let rect = bitmap_cell_rectangle_at_point(test_bitmap, point_at(50.0, 50.0));
        assert_eq!(50.0, rect.x);
        assert_eq!(50.0, rect.y);
        assert_eq!(25.0, rect.width);
        assert_eq!(25.0, rect.height);
    }
    #[test]
    fn test_bitmap_cell_rows_integration() {
        let test_bitmap = create_bitmap("Test Bitmap 54".to_string(), 100, 100);
        let _cleanup_bitmap = BitmapCleanup::new();
        bitmap_set_cell_details(test_bitmap, 20, 20, 5, 5, 25);
        assert_eq!(5, bitmap_cell_rows(test_bitmap));
    }
    #[test]
    fn test_bitmap_cell_width_integration() {
        let test_bitmap = create_bitmap("Test Bitmap 55".to_string(), 100, 100);
        let _cleanup_bitmap = BitmapCleanup::new();
        bitmap_set_cell_details(test_bitmap, 25, 25, 4, 4, 16);
        assert_eq!(25, bitmap_cell_width(test_bitmap));
    }
    #[test]
    fn test_bitmap_center_integration() {
        let test_bitmap = create_bitmap("Test Bitmap 56".to_string(), 100, 100);
        let _cleanup_bitmap = BitmapCleanup::new();
        let test_center = bitmap_center(test_bitmap);
        assert_eq!(50.0, test_center.x);
        assert_eq!(50.0, test_center.y);
    }
    #[test]
    fn test_bitmap_filename_integration() {
        let test_bitmap = create_bitmap("Test Bitmap 57".to_string(), 100, 100);
        let _cleanup_bitmap = BitmapCleanup::new();
        assert_eq!("".to_string(), bitmap_filename(test_bitmap));
    }
    #[test]
    fn test_bitmap_height_integration() {
        let test_bitmap = create_bitmap("Test Bitmap 58".to_string(), 100, 100);
        let _cleanup_bitmap = BitmapCleanup::new();
        assert_eq!(100, bitmap_height(test_bitmap));
    }
    #[test]
    fn test_bitmap_height_of_bitmap_named_integration() {
        create_bitmap("Test Bitmap 59".to_string(), 100, 100);
        let _cleanup_bitmap = BitmapCleanup::new();
        assert_eq!(100, bitmap_height_of_bitmap_named("Test Bitmap 59".to_string()));
    }
    #[test]
    fn test_bitmap_name_integration() {
        let test_bitmap = create_bitmap("Test Bitmap 60".to_string(), 100, 100);
        let _cleanup_bitmap = BitmapCleanup::new();
        assert_eq!("Test Bitmap 60".to_string(), bitmap_name(test_bitmap));
    }
    #[test]
    fn test_bitmap_named_integration() {
        create_bitmap("Test Bitmap 61".to_string(), 100, 100);
        let _cleanup_bitmap = BitmapCleanup::new();
        assert!(!bitmap_named("Test Bitmap 61".to_string()).is_null());
        assert!(bitmap_named("nonexistent_bitmap".to_string()).is_null());
    }
    #[test]
    fn test_bitmap_rectangle_of_cell_integration() {
        let test_bitmap = create_bitmap("Test Bitmap 62".to_string(), 100, 100);
        let _cleanup_bitmap = BitmapCleanup::new();
        bitmap_set_cell_details(test_bitmap, 25, 25, 4, 4, 16);
        let rect = bitmap_rectangle_of_cell(test_bitmap, 5);
        assert_eq!(25.0, rect.x);
        assert_eq!(25.0, rect.y);
        assert_eq!(25.0, rect.width);
        assert_eq!(25.0, rect.height);
    }
    #[test]
    fn test_bitmap_set_cell_details_integration() {
        let test_bitmap = create_bitmap("Test Bitmap 63".to_string(), 100, 100);
        let _cleanup_bitmap = BitmapCleanup::new();
        bitmap_set_cell_details(test_bitmap, 20, 20, 5, 5, 25);
        assert_eq!(20, bitmap_cell_width(test_bitmap));
        assert_eq!(20, bitmap_cell_height(test_bitmap));
        assert_eq!(5, bitmap_cell_columns(test_bitmap));
        assert_eq!(5, bitmap_cell_rows(test_bitmap));
        assert_eq!(25, bitmap_cell_count(test_bitmap));
    }
    #[test]
    fn test_bitmap_valid_integration() {
        let test_bitmap = create_bitmap("Test Bitmap 64".to_string(), 100, 100);
        let _cleanup_bitmap = BitmapCleanup::new();
        assert!(bitmap_valid(test_bitmap));
        free_bitmap(test_bitmap);
        assert!(!bitmap_valid(test_bitmap));
    }
    #[test]
    fn test_bitmap_width_integration() {
        let test_bitmap = create_bitmap("Test Bitmap 65".to_string(), 100, 100);
        let _cleanup_bitmap = BitmapCleanup::new();
        assert_eq!(100, bitmap_width(test_bitmap));
    }
    #[test]
    fn test_bitmap_width_of_bitmap_named_integration() {
        create_bitmap("Test Bitmap 66".to_string(), 100, 100);
        let _cleanup_bitmap = BitmapCleanup::new();
        assert_eq!(100, bitmap_width_of_bitmap_named("Test Bitmap 66".to_string()));
    }
    #[test]
    fn test_clear_bitmap_integration() {
        let test_bitmap = create_bitmap("Test Bitmap 67".to_string(), 100, 100);
        let _cleanup_bitmap = BitmapCleanup::new();
        draw_pixel_on_bitmap(test_bitmap, color_black(), 50.0, 50.0);
        assert_eq!(color_black(), get_pixel_from_bitmap(test_bitmap, 50.0, 50.0));
        clear_bitmap(test_bitmap, color_white());
        assert_eq!(color_white(), get_pixel_from_bitmap(test_bitmap, 50.0, 50.0));
    }
    #[test]
    fn test_clear_bitmap_named_integration() {
        let test_bitmap = create_bitmap("Test Bitmap 68".to_string(), 100, 100);
        let _cleanup_bitmap = BitmapCleanup::new();
        fill_rectangle_on_bitmap(test_bitmap, color_red(), 0.0, 0.0, 100.0, 100.0);
        assert_eq!(color_red(), get_pixel_from_bitmap(test_bitmap, 50.0, 50.0));
        clear_bitmap_named("Test Bitmap 68".to_string(), color_white());
        assert_eq!(color_white(), get_pixel_from_bitmap(test_bitmap, 50.0, 50.0));
    }
    #[test]
    fn test_create_bitmap_integration() {
        let test_bitmap = create_bitmap("Test Bitmap 69".to_string(), 100, 100);
        let _cleanup_bitmap = BitmapCleanup::new();
        assert!(!test_bitmap.is_null());
        assert_eq!(100, bitmap_width(test_bitmap));
        assert_eq!(100, bitmap_height(test_bitmap));
        assert_eq!("Test Bitmap 69".to_string(), bitmap_name(test_bitmap));
    }
    #[test]
    fn test_draw_bitmap_integration() {
        let test_window = open_window("Test Window 75".to_string(), 800, 600);
        let _cleanup_window = WindowCleanup::new();
        let test_bitmap = create_bitmap("Test Bitmap 70".to_string(), 100, 100);
        let _cleanup_bitmap = BitmapCleanup::new();
        clear_window(test_window, color_white());
        fill_rectangle_on_bitmap(test_bitmap, color_red(), 0.0, 0.0, 50.0, 50.0);
        draw_bitmap(test_bitmap, 100.0, 100.0);
        refresh_screen();
        assert_eq!(color_red(), get_pixel_from_window(test_window, 125.0, 125.0));
        assert_eq!(color_white(), get_pixel_from_window(test_window, 175.0, 175.0));
        free_bitmap(test_bitmap);
    }
    #[test]
    fn test_draw_bitmap_with_options_integration() {
        let test_window = open_window("Test Window 76".to_string(), 800, 600);
        let _cleanup_window = WindowCleanup::new();
        let test_bitmap = create_bitmap("Test Bitmap 71".to_string(), 100, 100);
        let _cleanup_bitmap = BitmapCleanup::new();
        clear_window(test_window, color_white());
        fill_rectangle_on_bitmap(test_bitmap, color_red(), 0.0, 0.0, 100.0, 100.0);
        draw_bitmap_with_options(test_bitmap, 100.0, 100.0, option_defaults());
        refresh_screen();
        assert_eq!(color_red(), get_pixel_from_window(test_window, 125.0, 125.0));
        assert_eq!(color_white(), get_pixel_from_window(test_window, 50.0, 50.0));
        free_bitmap(test_bitmap);
    }
    #[test]
    fn test_draw_bitmap_named_integration() {
        let test_window = open_window("Test Window 77".to_string(), 800, 600);
        let _cleanup_window = WindowCleanup::new();
        let test_bitmap = create_bitmap("Test Bitmap 72".to_string(), 100, 100);
        let _cleanup_bitmap = BitmapCleanup::new();
        clear_window(test_window, color_white());
        fill_rectangle_on_bitmap(test_bitmap, color_red(), 0.0, 0.0, 100.0, 100.0);
        draw_bitmap_named("Test Bitmap 72".to_string(), 100.0, 100.0);
        refresh_screen();
        assert_eq!(color_red(), get_pixel_from_window(test_window, 125.0, 125.0));
        assert_eq!(color_white(), get_pixel_from_window(test_window, 50.0, 50.0));
        free_bitmap(test_bitmap);
    }
    #[test]
    fn test_draw_bitmap_named_with_options_integration() {
        let test_window = open_window("Test Window 78".to_string(), 800, 600);
        let _cleanup_window = WindowCleanup::new();
        let test_bitmap = create_bitmap("Test Bitmap 73".to_string(), 100, 100);
        let _cleanup_bitmap = BitmapCleanup::new();
        clear_window(test_window, color_white());
        fill_rectangle_on_bitmap(test_bitmap, color_red(), 0.0, 0.0, 100.0, 100.0);
        draw_bitmap_named_with_options("Test Bitmap 73".to_string(), 100.0, 100.0, option_defaults());
        refresh_screen();
        assert_eq!(color_red(), get_pixel_from_window(test_window, 125.0, 125.0));
        assert_eq!(color_white(), get_pixel_from_window(test_window, 50.0, 50.0));
        free_bitmap(test_bitmap);
    }
    #[test]
    fn test_draw_bitmap_on_bitmap_on_bitmap_integration() {
        let dest_bitmap = create_bitmap("Test Bitmap 74".to_string(), 100, 100);
        let _cleanup_bitmap = BitmapCleanup::new();
        let source_bitmap = create_bitmap("Test Bitmap 75".to_string(), 50, 50);
        clear_bitmap(dest_bitmap, color_white());
        fill_rectangle_on_bitmap(source_bitmap, color_red(), 0.0, 0.0, 50.0, 50.0);
        draw_bitmap_on_bitmap_on_bitmap(dest_bitmap, source_bitmap, 25.0, 25.0);
        assert_eq!(color_red(), get_pixel_from_bitmap(dest_bitmap, 50.0, 50.0));
        assert_eq!(color_white(), get_pixel_from_bitmap(dest_bitmap, 10.0, 10.0));
    }
    #[test]
    fn test_draw_bitmap_on_bitmap_on_bitmap_with_options_integration() {
        let dest_bitmap = create_bitmap("Test Bitmap 76".to_string(), 100, 100);
        let _cleanup_bitmap = BitmapCleanup::new();
        let source_bitmap = create_bitmap("Test Bitmap 77".to_string(), 50, 50);
        clear_bitmap(dest_bitmap, color_white());
        fill_rectangle_on_bitmap(source_bitmap, color_red(), 0.0, 0.0, 50.0, 50.0);
        draw_bitmap_on_bitmap_on_bitmap_with_options(dest_bitmap, source_bitmap, 25.0, 25.0, option_defaults());
        assert_eq!(color_red(), get_pixel_from_bitmap(dest_bitmap, 50.0, 50.0));
        assert_eq!(color_white(), get_pixel_from_bitmap(dest_bitmap, 10.0, 10.0));
    }
    #[test]
    fn test_draw_bitmap_on_window_integration() {
        let test_window = open_window("Test Window 79".to_string(), 800, 600);
        let _cleanup_window = WindowCleanup::new();
        let test_bitmap = create_bitmap("Test Bitmap 78".to_string(), 100, 100);
        let _cleanup_bitmap = BitmapCleanup::new();
        clear_window(test_window, color_white());
        fill_rectangle_on_bitmap(test_bitmap, color_red(), 0.0, 0.0, 100.0, 100.0);
        draw_bitmap_on_window(test_window, test_bitmap, 100.0, 100.0);
        refresh_screen();
        assert_eq!(color_red(), get_pixel_from_window(test_window, 125.0, 125.0));
        assert_eq!(color_white(), get_pixel_from_window(test_window, 50.0, 50.0));
        free_bitmap(test_bitmap);
    }
    #[test]
    fn test_draw_bitmap_on_window_with_options_integration() {
        let test_window = open_window("Test Window 80".to_string(), 800, 600);
        let _cleanup_window = WindowCleanup::new();
        let test_bitmap = create_bitmap("Test Bitmap 79".to_string(), 100, 100);
        let _cleanup_bitmap = BitmapCleanup::new();
        clear_window(test_window, color_white());
        fill_rectangle_on_bitmap(test_bitmap, color_red(), 0.0, 0.0, 100.0, 100.0);
        draw_bitmap_on_window_with_options(test_window, test_bitmap, 100.0, 100.0, option_defaults());
        refresh_screen();
        assert_eq!(color_red(), get_pixel_from_window(test_window, 125.0, 125.0));
        assert_eq!(color_white(), get_pixel_from_window(test_window, 50.0, 50.0));
        free_bitmap(test_bitmap);
    }
    #[test]
    fn test_free_all_bitmaps_integration() {
        let bitmap1 = create_bitmap("Test Bitmap 80".to_string(), 100, 100);
        let _cleanup_bitmap = BitmapCleanup::new();
        let bitmap2 = create_bitmap("Test Bitmap 81".to_string(), 100, 100);
        assert!(bitmap_valid(bitmap1));
        assert!(bitmap_valid(bitmap2));
        free_all_bitmaps();
        assert!(!bitmap_valid(bitmap1));
        assert!(!bitmap_valid(bitmap2));
    }
    #[test]
    fn test_free_bitmap_integration() {
        let test_bitmap = create_bitmap("Test Bitmap 82".to_string(), 100, 100);
        let _cleanup_bitmap = BitmapCleanup::new();
        assert!(bitmap_valid(test_bitmap));
        free_bitmap(test_bitmap);
        assert!(!bitmap_valid(test_bitmap));
    }
    #[test]
    fn test_has_bitmap_integration() {
        let test_bitmap = create_bitmap("Test Bitmap 83".to_string(), 100, 100);
        let _cleanup_bitmap = BitmapCleanup::new();
        assert!(has_bitmap("Test Bitmap 83".to_string()));
        free_bitmap(test_bitmap);
        assert!(!has_bitmap("Test Bitmap 83".to_string()));
    }
    #[test]
    fn test_load_bitmap_integration() {
        let loaded_bitmap = load_bitmap("Test Bitmap 84".to_string(), "frog.png".to_string());
        let _cleanup_bitmap = BitmapCleanup::new();
        assert_ne!(color_white(), get_pixel_from_bitmap(loaded_bitmap, 50.0, 50.0));
    }
    #[test]
    fn test_pixel_drawn_at_point_pt_integration() {
        let test_bitmap = create_bitmap("Test Bitmap 85".to_string(), 100, 100);
        let _cleanup_bitmap = BitmapCleanup::new();
        clear_bitmap(test_bitmap, color_white());
        draw_pixel_on_bitmap_at_point(test_bitmap, color_black(), point_at(50.0, 50.0));
        assert_eq!(color_black(), get_pixel_from_bitmap(test_bitmap, 50.0, 50.0));
        assert_eq!(color_white(), get_pixel_from_bitmap(test_bitmap, 75.0, 75.0));
    }
    #[test]
    fn test_pixel_drawn_at_point_integration() {
        let test_bitmap = create_bitmap("Test Bitmap 86".to_string(), 100, 100);
        let _cleanup_bitmap = BitmapCleanup::new();
        clear_bitmap(test_bitmap, color_white());
        draw_pixel_on_bitmap(test_bitmap, color_black(), 50.0, 50.0);
        assert_eq!(color_black(), get_pixel_from_bitmap(test_bitmap, 50.0, 50.0));
        assert_eq!(color_white(), get_pixel_from_bitmap(test_bitmap, 75.0, 75.0));
    }
    #[test]
    fn test_pixel_drawn_at_point_in_cell_pt_integration() {
        let test_bitmap = create_bitmap("Test Bitmap 87".to_string(), 100, 100);
        let _cleanup_bitmap = BitmapCleanup::new();
        clear_bitmap(test_bitmap, color_white());
        draw_pixel_on_bitmap_at_point(test_bitmap, color_black(), point_at(50.0, 50.0));
        bitmap_set_cell_details(test_bitmap, 100, 100, 1, 1, 1);
        assert_eq!(color_black(), get_pixel_from_bitmap(test_bitmap, 50.0, 50.0));
        assert_eq!(color_white(), get_pixel_from_bitmap(test_bitmap, 75.0, 50.0));
    }
    #[test]
    fn test_pixel_drawn_at_point_in_cell_integration() {
        let test_bitmap = create_bitmap("Test Bitmap 88".to_string(), 100, 100);
        let _cleanup_bitmap = BitmapCleanup::new();
        clear_bitmap(test_bitmap, color_white());
        draw_pixel_on_bitmap_at_point(test_bitmap, color_black(), point_at(50.0, 50.0));
        bitmap_set_cell_details(test_bitmap, 100, 100, 1, 1, 1);
        assert_eq!(color_black(), get_pixel_from_bitmap(test_bitmap, 50.0, 50.0));
        assert_eq!(color_white(), get_pixel_from_bitmap(test_bitmap, 75.0, 75.0));
    }
    #[test]
    fn test_setup_collision_mask_integration() {
        open_window("Test Window 81".to_string(), 800, 600);
        let _cleanup_window = WindowCleanup::new();
        let test_bitmap = create_bitmap("Test Bitmap 89".to_string(), 100, 100);
        let _cleanup_bitmap = BitmapCleanup::new();
        clear_bitmap(test_bitmap, color_black());
        let test_circle = circle_at_from_points(120.0, 120.0, 30.0);
        let collision_before_mask = bitmap_circle_collision(test_bitmap, 100.0, 100.0, test_circle);
        setup_collision_mask(test_bitmap);
        let collision_after_mask = bitmap_circle_collision(test_bitmap, 100.0, 100.0, test_circle);
        assert!(!collision_before_mask);
        assert!(collision_after_mask);
    }
    #[test]
    fn test_draw_line_record_integration() {
        let test_window = open_window("Test Window 82".to_string(), 800, 600);
        let _cleanup_window = WindowCleanup::new();
        clear_window(test_window, color_white());
        draw_line_record(color_black(), line_from_point_to_point(point_at(100.0, 100.0), point_at(200.0, 200.0)));
        refresh_screen();
        assert_eq!(color_black(), get_pixel_from_window(test_window, 100.0, 100.0));
        assert_eq!(color_white(), get_pixel_from_window(test_window, 99.0, 99.0));
    }
    #[test]
    fn test_draw_line_record_with_options_integration() {
        let test_window = open_window("Test Window 83".to_string(), 800, 600);
        let _cleanup_window = WindowCleanup::new();
        clear_window(test_window, color_white());
        draw_line_record_with_options(color_black(), line_from_point_to_point(point_at(100.0, 100.0), point_at(200.0, 200.0)), option_line_width_with_options(3, option_defaults()));
        refresh_screen();
        assert_eq!(color_black(), get_pixel_from_window(test_window, 100.0, 100.0));
        assert_eq!(color_white(), get_pixel_from_window(test_window, 99.0, 99.0));
    }
    #[test]
    fn test_draw_line_point_to_point_integration() {
        let test_window = open_window("Test Window 84".to_string(), 800, 600);
        let _cleanup_window = WindowCleanup::new();
        clear_window(test_window, color_white());
        draw_line_point_to_point(color_black(), point_at(100.0, 100.0), point_at(200.0, 200.0));
        refresh_screen();
        assert_eq!(color_black(), get_pixel_from_window(test_window, 100.0, 100.0));
        assert_eq!(color_white(), get_pixel_from_window(test_window, 99.0, 99.0));
    }
    #[test]
    fn test_draw_line_point_to_point_with_options_integration() {
        let test_window = open_window("Test Window 85".to_string(), 800, 600);
        let _cleanup_window = WindowCleanup::new();
        clear_window(test_window, color_white());
        draw_line_point_to_point_with_options(color_black(), point_at(100.0, 100.0), point_at(200.0, 200.0), option_defaults());
        refresh_screen();
        assert_eq!(color_black(), get_pixel_from_window(test_window, 100.0, 100.0));
        assert_eq!(color_white(), get_pixel_from_window(test_window, 99.0, 99.0));
    }
    #[test]
    fn test_draw_line_integration() {
        let test_window = open_window("Test Window 86".to_string(), 800, 600);
        let _cleanup_window = WindowCleanup::new();
        clear_window(test_window, color_white());
        draw_line(color_black(), 100.0, 100.0, 200.0, 200.0);
        refresh_screen();
        assert_eq!(color_black(), get_pixel_from_window(test_window, 100.0, 100.0));
        assert_eq!(color_white(), get_pixel_from_window(test_window, 99.0, 99.0));
    }
    #[test]
    fn test_draw_line_with_options_integration() {
        let test_window = open_window("Test Window 87".to_string(), 800, 600);
        let _cleanup_window = WindowCleanup::new();
        clear_window(test_window, color_white());
        draw_line_with_options(color_black(), 100.0, 100.0, 200.0, 200.0, option_defaults());
        refresh_screen();
        assert_eq!(color_black(), get_pixel_from_window(test_window, 100.0, 100.0));
        assert_eq!(color_white(), get_pixel_from_window(test_window, 99.0, 99.0));
    }
    #[test]
    fn test_draw_line_on_bitmap_record_integration() {
        let test_bitmap = create_bitmap("Test Bitmap 90".to_string(), 100, 100);
        let _cleanup_bitmap = BitmapCleanup::new();
        clear_bitmap(test_bitmap, color_white());
        draw_line_on_bitmap_record(test_bitmap, color_black(), line_from_point_to_point(point_at(10.0, 10.0), point_at(90.0, 90.0)));
        assert_eq!(color_black(), get_pixel_from_bitmap(test_bitmap, 50.0, 50.0));
        assert_eq!(color_white(), get_pixel_from_bitmap(test_bitmap, 95.0, 95.0));
    }
    #[test]
    fn test_draw_line_on_bitmap_record_with_options_integration() {
        let test_bitmap = create_bitmap("Test Bitmap 91".to_string(), 100, 100);
        let _cleanup_bitmap = BitmapCleanup::new();
        clear_bitmap(test_bitmap, color_white());
        draw_line_on_bitmap_record_with_options(test_bitmap, color_black(), line_from_point_to_point(point_at(10.0, 10.0), point_at(90.0, 90.0)), option_defaults());
        assert_eq!(color_black(), get_pixel_from_bitmap(test_bitmap, 50.0, 50.0));
        assert_eq!(color_white(), get_pixel_from_bitmap(test_bitmap, 95.0, 50.0));
    }
    #[test]
    fn test_draw_line_on_bitmap_point_to_point_integration() {
        let test_bitmap = create_bitmap("Test Bitmap 92".to_string(), 100, 100);
        let _cleanup_bitmap = BitmapCleanup::new();
        clear_bitmap(test_bitmap, color_white());
        draw_line_on_bitmap_point_to_point(test_bitmap, color_black(), point_at(10.0, 10.0), point_at(90.0, 90.0));
        assert_eq!(color_black(), get_pixel_from_bitmap(test_bitmap, 50.0, 50.0));
        assert_eq!(color_white(), get_pixel_from_bitmap(test_bitmap, 0.0, 0.0));
    }
    #[test]
    fn test_draw_line_on_bitmap_point_to_point_with_options_integration() {
        let test_bitmap = create_bitmap("Test Bitmap 93".to_string(), 100, 100);
        let _cleanup_bitmap = BitmapCleanup::new();
        clear_bitmap(test_bitmap, color_white());
        draw_line_on_bitmap_point_to_point_with_options(test_bitmap, color_black(), point_at(10.0, 10.0), point_at(90.0, 90.0), option_defaults());
        assert_eq!(color_black(), get_pixel_from_bitmap(test_bitmap, 10.0, 10.0));
        assert_eq!(color_black(), get_pixel_from_bitmap(test_bitmap, 90.0, 90.0));
        assert_eq!(color_white(), get_pixel_from_bitmap(test_bitmap, 5.0, 5.0));
    }
    #[test]
    fn test_draw_line_on_bitmap_integration() {
        let test_bitmap = create_bitmap("Test Bitmap 94".to_string(), 100, 100);
        let _cleanup_bitmap = BitmapCleanup::new();
        clear_bitmap(test_bitmap, color_white());
        draw_line_on_bitmap(test_bitmap, color_black(), 10.0, 10.0, 90.0, 90.0);
        assert_eq!(color_black(), get_pixel_from_bitmap(test_bitmap, 50.0, 50.0));
        assert_eq!(color_white(), get_pixel_from_bitmap(test_bitmap, 95.0, 50.0));
    }
    #[test]
    fn test_draw_line_on_bitmap_with_options_integration() {
        let test_bitmap = create_bitmap("Test Bitmap 95".to_string(), 100, 100);
        let _cleanup_bitmap = BitmapCleanup::new();
        clear_bitmap(test_bitmap, color_white());
        draw_line_on_bitmap_with_options(test_bitmap, color_black(), 10.0, 10.0, 90.0, 90.0, option_defaults());
        assert_eq!(color_black(), get_pixel_from_bitmap(test_bitmap, 50.0, 50.0));
        assert_eq!(color_white(), get_pixel_from_bitmap(test_bitmap, 5.0, 5.0));
    }
    #[test]
    fn test_draw_line_on_window_record_integration() {
        let test_window = open_window("Test Window 88".to_string(), 800, 600);
        let _cleanup_window = WindowCleanup::new();
        clear_window(test_window, color_white());
        let test_line = line_from_point_to_point(point_at(100.0, 100.0), point_at(150.0, 150.0));
        draw_line_on_window_record(test_window, color_black(), test_line);
        refresh_screen();
        assert_eq!(color_black(), get_pixel_from_window(test_window, 100.0, 100.0));
        assert_eq!(color_white(), get_pixel_from_window(test_window, 99.0, 99.0));
    }
    #[test]
    fn test_draw_line_on_window_record_with_options_integration() {
        let test_window = open_window("Test Window 89".to_string(), 800, 600);
        let _cleanup_window = WindowCleanup::new();
        clear_window(test_window, color_white());
        let test_line = line_from_point_to_point(point_at(100.0, 100.0), point_at(150.0, 150.0));
        draw_line_on_window_record_with_options(test_window, color_black(), test_line, option_defaults());
        refresh_screen();
        assert_eq!(color_black(), get_pixel_from_window(test_window, 100.0, 100.0));
        assert_eq!(color_white(), get_pixel_from_window(test_window, 99.0, 99.0));
    }
    #[test]
    fn test_draw_line_on_window_point_to_point_integration() {
        let test_window = open_window("Test Window 90".to_string(), 800, 600);
        let _cleanup_window = WindowCleanup::new();
        clear_window(test_window, color_white());
        draw_line_on_window_point_to_point(test_window, color_black(), point_at(100.0, 100.0), point_at(200.0, 200.0));
        refresh_screen();
        assert_eq!(color_black(), get_pixel_from_window(test_window, 100.0, 100.0));
        assert_eq!(color_white(), get_pixel_from_window(test_window, 99.0, 99.0));
    }
    #[test]
    fn test_draw_line_on_window_point_to_point_with_options_integration() {
        let test_window = open_window("Test Window 91".to_string(), 800, 600);
        let _cleanup_window = WindowCleanup::new();
        clear_window(test_window, color_white());
        draw_line_on_window_point_to_point_with_options(test_window, color_black(), point_at(100.0, 100.0), point_at(200.0, 200.0), option_defaults());
        refresh_screen();
        assert_eq!(color_black(), get_pixel_from_window(test_window, 100.0, 100.0));
        assert_eq!(color_white(), get_pixel_from_window(test_window, 99.0, 99.0));
    }
    #[test]
    fn test_draw_line_on_window_integration() {
        let test_window = open_window("Test Window 92".to_string(), 800, 600);
        let _cleanup_window = WindowCleanup::new();
        clear_window(test_window, color_white());
        draw_line_on_window(test_window, color_black(), 100.0, 100.0, 200.0, 200.0);
        refresh_screen();
        assert_eq!(color_black(), get_pixel_from_window(test_window, 100.0, 100.0));
        assert_eq!(color_white(), get_pixel_from_window(test_window, 99.0, 99.0));
    }
    #[test]
    fn test_draw_line_on_window_with_options_integration() {
        let test_window = open_window("Test Window 93".to_string(), 800, 600);
        let _cleanup_window = WindowCleanup::new();
        clear_window(test_window, color_white());
        draw_line_on_window_with_options(test_window, color_black(), 100.0, 100.0, 200.0, 200.0, option_defaults());
        refresh_screen();
        assert_eq!(color_black(), get_pixel_from_window(test_window, 100.0, 100.0));
        assert_eq!(color_white(), get_pixel_from_window(test_window, 99.0, 99.0));
    }
    #[test]
    fn test_draw_pixel_at_point_integration() {
        let test_window = open_window("Test Window 94".to_string(), 800, 600);
        let _cleanup_window = WindowCleanup::new();
        clear_window(test_window, color_white());
        draw_pixel_at_point(color_black(), point_at(100.0, 100.0));
        refresh_screen();
        assert_eq!(color_black(), get_pixel_from_window(test_window, 100.0, 100.0));
        assert_eq!(color_white(), get_pixel_from_window(test_window, 99.0, 99.0));
    }
    #[test]
    fn test_draw_pixel_at_point_with_options_integration() {
        let test_window = open_window("Test Window 95".to_string(), 800, 600);
        let _cleanup_window = WindowCleanup::new();
        clear_window(test_window, color_white());
        draw_pixel_at_point_with_options(color_black(), point_at(100.0, 100.0), option_defaults());
        refresh_screen();
        assert_eq!(color_black(), get_pixel_from_window(test_window, 100.0, 100.0));
        assert_eq!(color_white(), get_pixel_from_window(test_window, 99.0, 99.0));
    }
    #[test]
    fn test_draw_pixel_integration() {
        let test_window = open_window("Test Window 96".to_string(), 800, 600);
        let _cleanup_window = WindowCleanup::new();
        clear_window(test_window, color_white());
        draw_pixel(color_black(), 100.0, 100.0);
        refresh_screen();
        assert_eq!(color_black(), get_pixel_from_window(test_window, 100.0, 100.0));
        assert_eq!(color_white(), get_pixel_from_window(test_window, 99.0, 99.0));
    }
    #[test]
    fn test_draw_pixel_with_options_integration() {
        let test_window = open_window("Test Window 97".to_string(), 800, 600);
        let _cleanup_window = WindowCleanup::new();
        clear_window(test_window, color_white());
        draw_pixel_with_options(color_black(), 100.0, 100.0, option_defaults());
        refresh_screen();
        assert_eq!(color_black(), get_pixel_from_window(test_window, 100.0, 100.0));
        assert_eq!(color_white(), get_pixel_from_window(test_window, 99.0, 99.0));
    }
    #[test]
    fn test_draw_pixel_on_bitmap_at_point_integration() {
        let test_bitmap = create_bitmap("Test Bitmap 96".to_string(), 100, 100);
        let _cleanup_bitmap = BitmapCleanup::new();
        clear_bitmap(test_bitmap, color_white());
        draw_pixel_on_bitmap_at_point(test_bitmap, color_black(), point_at(50.0, 50.0));
        assert_eq!(color_black(), get_pixel_from_bitmap(test_bitmap, 50.0, 50.0));
        assert_eq!(color_white(), get_pixel_from_bitmap(test_bitmap, 0.0, 0.0));
    }
    #[test]
    fn test_draw_pixel_on_bitmap_at_point_with_options_integration() {
        let test_bitmap = create_bitmap("Test Bitmap 97".to_string(), 100, 100);
        let _cleanup_bitmap = BitmapCleanup::new();
        clear_bitmap(test_bitmap, color_white());
        draw_pixel_on_bitmap_at_point_with_options(test_bitmap, color_black(), point_at(50.0, 50.0), option_defaults());
        assert_eq!(color_black(), get_pixel_from_bitmap(test_bitmap, 50.0, 50.0));
        assert_eq!(color_white(), get_pixel_from_bitmap(test_bitmap, 0.0, 0.0));
    }
    #[test]
    fn test_draw_pixel_on_bitmap_integration() {
        let test_bitmap = create_bitmap("Test Bitmap 98".to_string(), 100, 100);
        let _cleanup_bitmap = BitmapCleanup::new();
        clear_bitmap(test_bitmap, color_white());
        draw_pixel_on_bitmap(test_bitmap, color_black(), 50.0, 50.0);
        assert_eq!(color_black(), get_pixel_from_bitmap(test_bitmap, 50.0, 50.0));
        assert_eq!(color_white(), get_pixel_from_bitmap(test_bitmap, 51.0, 50.0));
    }
    #[test]
    fn test_draw_pixel_on_bitmap_with_options_integration() {
        let test_bitmap = create_bitmap("Test Bitmap 99".to_string(), 100, 100);
        let _cleanup_bitmap = BitmapCleanup::new();
        clear_bitmap(test_bitmap, color_white());
        draw_pixel_on_bitmap_with_options(test_bitmap, color_black(), 50.0, 50.0, option_defaults());
        assert_eq!(color_black(), get_pixel_from_bitmap(test_bitmap, 50.0, 50.0));
        assert_eq!(color_white(), get_pixel_from_bitmap(test_bitmap, 51.0, 50.0));
    }
    #[test]
    fn test_draw_pixel_on_window_at_point_integration() {
        let test_window = open_window("Test Window 98".to_string(), 800, 600);
        let _cleanup_window = WindowCleanup::new();
        clear_window(test_window, color_white());
        draw_pixel_on_window_at_point(test_window, color_black(), point_at(100.0, 100.0));
        refresh_screen();
        assert_eq!(color_black(), get_pixel_from_window(test_window, 100.0, 100.0));
        assert_eq!(color_white(), get_pixel_from_window(test_window, 99.0, 99.0));
    }
    #[test]
    fn test_draw_pixel_on_window_at_point_with_options_integration() {
        let test_window = open_window("Test Window 99".to_string(), 800, 600);
        let _cleanup_window = WindowCleanup::new();
        clear_window(test_window, color_white());
        draw_pixel_on_window_at_point_with_options(test_window, color_black(), point_at(100.0, 100.0), option_defaults());
        refresh_screen();
        assert_eq!(color_black(), get_pixel_from_window(test_window, 100.0, 100.0));
        assert_eq!(color_white(), get_pixel_from_window(test_window, 99.0, 99.0));
    }
    #[test]
    fn test_draw_pixel_on_window_integration() {
        let test_window = open_window("Test Window 100".to_string(), 800, 600);
        let _cleanup_window = WindowCleanup::new();
        clear_window(test_window, color_white());
        draw_pixel_on_window(test_window, color_black(), 100.0, 100.0);
        refresh_screen();
        assert_eq!(color_black(), get_pixel_from_window(test_window, 100.0, 100.0));
        assert_eq!(color_white(), get_pixel_from_window(test_window, 99.0, 99.0));
    }
    #[test]
    fn test_draw_pixel_on_window_with_options_integration() {
        let test_window = open_window("Test Window 101".to_string(), 800, 600);
        let _cleanup_window = WindowCleanup::new();
        clear_window(test_window, color_white());
        draw_pixel_on_window_with_options(test_window, color_black(), 100.0, 100.0, option_defaults());
        refresh_screen();
        assert_eq!(color_black(), get_pixel_from_window(test_window, 100.0, 100.0));
        assert_eq!(color_white(), get_pixel_from_window(test_window, 99.0, 99.0));
    }
    #[test]
    fn test_get_pixel_from_bitmap_at_point_integration() {
        let test_bitmap = create_bitmap("Test Bitmap 100".to_string(), 100, 100);
        let _cleanup_bitmap = BitmapCleanup::new();
        clear_bitmap(test_bitmap, color_white());
        draw_pixel_on_bitmap_at_point(test_bitmap, color_black(), point_at(50.0, 50.0));
        assert_eq!(color_black(), get_pixel_from_bitmap_at_point(test_bitmap, point_at(50.0, 50.0)));
        assert_eq!(color_white(), get_pixel_from_bitmap_at_point(test_bitmap, point_at(49.0, 49.0)));
    }
    #[test]
    fn test_get_pixel_from_bitmap_integration() {
        let test_bitmap = create_bitmap("Test Bitmap 101".to_string(), 100, 100);
        let _cleanup_bitmap = BitmapCleanup::new();
        clear_bitmap(test_bitmap, color_white());
        draw_pixel_on_bitmap(test_bitmap, color_black(), 50.0, 50.0);
        assert_eq!(color_black(), get_pixel_from_bitmap(test_bitmap, 50.0, 50.0));
        assert_eq!(color_white(), get_pixel_from_bitmap(test_bitmap, 49.0, 49.0));
    }
    #[test]
    fn test_get_pixel_at_point_integration() {
        let test_window = open_window("Test Window 102".to_string(), 800, 600);
        let _cleanup_window = WindowCleanup::new();
        clear_window(test_window, color_white());
        draw_pixel_at_point(color_black(), point_at(100.0, 100.0));
        refresh_screen();
        assert_eq!(color_black(), get_pixel_from_window(test_window, 100.0, 100.0));
        assert_eq!(color_white(), get_pixel_from_window(test_window, 99.0, 99.0));
    }
    #[test]
    fn test_get_pixel_integration() {
        let test_window = open_window("Test Window 103".to_string(), 800, 600);
        let _cleanup_window = WindowCleanup::new();
        clear_window(test_window, color_white());
        draw_pixel(color_black(), 100.0, 100.0);
        refresh_screen();
        assert_eq!(color_black(), get_pixel_from_window(test_window, 100.0, 100.0));
        assert_eq!(color_white(), get_pixel_from_window(test_window, 99.0, 99.0));
    }
    #[test]
    fn test_get_pixel_from_window_at_point_integration() {
        let test_window = open_window("Test Window 104".to_string(), 800, 600);
        let _cleanup_window = WindowCleanup::new();
        clear_window(test_window, color_white());
        draw_pixel_at_point(color_black(), point_at(100.0, 100.0));
        refresh_screen();
        assert_eq!(color_black(), get_pixel_from_window_at_point(test_window, point_at(100.0, 100.0)));
        assert_eq!(color_white(), get_pixel_from_window_at_point(test_window, point_at(99.0, 99.0)));
    }
    #[test]
    fn test_get_pixel_from_window_integration() {
        let test_window = open_window("Test Window 105".to_string(), 800, 600);
        let _cleanup_window = WindowCleanup::new();
        clear_window(test_window, color_white());
        draw_pixel(color_black(), 100.0, 100.0);
        refresh_screen();
        assert_eq!(color_black(), get_pixel_from_window(test_window, 100.0, 100.0));
        assert_eq!(color_white(), get_pixel_from_window(test_window, 99.0, 99.0));
    }
    #[test]
    fn test_get_pixel_from_window_at_point_from_window_integration() {
        let test_window = open_window("Test Window 106".to_string(), 800, 600);
        let _cleanup_window = WindowCleanup::new();
        clear_window(test_window, color_white());
        draw_pixel_at_point(color_black(), point_at(100.0, 100.0));
        refresh_screen();
        assert_eq!(color_black(), get_pixel_from_window_at_point_from_window(test_window, point_at(100.0, 100.0)));
        assert_eq!(color_white(), get_pixel_from_window_at_point_from_window(test_window, point_at(99.0, 99.0)));
    }
    #[test]
    fn test_get_pixel_from_window_from_window_integration() {
        let test_window = open_window("Test Window 107".to_string(), 800, 600);
        let _cleanup_window = WindowCleanup::new();
        clear_window(test_window, color_white());
        draw_pixel(color_black(), 100.0, 100.0);
        refresh_screen();
        assert_eq!(color_black(), get_pixel_from_window_from_window(test_window, 100.0, 100.0));
        assert_eq!(color_white(), get_pixel_from_window_from_window(test_window, 99.0, 99.0));
    }
    #[test]
    fn test_draw_quad_integration() {
        let test_window = open_window("Test Window 108".to_string(), 800, 600);
        let _cleanup_window = WindowCleanup::new();
        clear_window(test_window, color_white());
        let quad = quad_from_points(point_at(100.0, 100.0), point_at(200.0, 100.0), point_at(100.0, 200.0), point_at(200.0, 200.0));
        draw_quad(color_black(), quad);
        refresh_screen();
        assert_eq!(color_black(), get_pixel_from_window(test_window, 100.0, 100.0));
        assert_eq!(color_white(), get_pixel_from_window(test_window, 150.0, 150.0));
        assert_eq!(color_white(), get_pixel_from_window(test_window, 250.0, 250.0));
    }
    #[test]
    fn test_draw_quad_with_options_integration() {
        let test_window = open_window("Test Window 109".to_string(), 800, 600);
        let _cleanup_window = WindowCleanup::new();
        clear_window(test_window, color_white());
        let quad = quad_from_points(point_at(100.0, 100.0), point_at(200.0, 100.0), point_at(100.0, 200.0), point_at(200.0, 200.0));
        draw_quad_with_options(color_black(), quad, option_defaults());
        refresh_screen();
        assert_eq!(color_black(), get_pixel_from_window(test_window, 100.0, 100.0));
        assert_eq!(color_white(), get_pixel_from_window(test_window, 150.0, 150.0));
        assert_eq!(color_white(), get_pixel_from_window(test_window, 250.0, 250.0));
    }
    #[test]
    fn test_draw_quad_on_bitmap_integration() {
        let test_bitmap = create_bitmap("Test Bitmap 102".to_string(), 100, 100);
        let _cleanup_bitmap = BitmapCleanup::new();
        clear_bitmap(test_bitmap, color_white());
        let quad = quad_from_points(point_at(10.0, 10.0), point_at(90.0, 10.0), point_at(10.0, 90.0), point_at(90.0, 90.0));
        draw_quad_on_bitmap(test_bitmap, color_black(), quad);
        assert_eq!(color_black(), get_pixel_from_bitmap(test_bitmap, 10.0, 10.0));
        assert_eq!(color_white(), get_pixel_from_bitmap(test_bitmap, 50.0, 50.0));
        assert_eq!(color_white(), get_pixel_from_bitmap(test_bitmap, 5.0, 5.0));
    }
    #[test]
    fn test_draw_quad_on_bitmap_with_options_integration() {
        let test_bitmap = create_bitmap("Test Bitmap 103".to_string(), 100, 100);
        let _cleanup_bitmap = BitmapCleanup::new();
        clear_bitmap(test_bitmap, color_white());
        let quad = quad_from_points(point_at(10.0, 10.0), point_at(90.0, 10.0), point_at(90.0, 90.0), point_at(10.0, 90.0));
        draw_quad_on_bitmap_with_options(test_bitmap, color_black(), quad, option_defaults());
        assert_eq!(color_black(), get_pixel_from_bitmap(test_bitmap, 10.0, 10.0));
        assert_eq!(color_black(), get_pixel_from_bitmap(test_bitmap, 50.0, 50.0));
        assert_eq!(color_white(), get_pixel_from_bitmap(test_bitmap, 5.0, 5.0));
    }
    #[test]
    fn test_draw_quad_on_window_integration() {
        let test_window = open_window("Test Window 110".to_string(), 800, 600);
        let _cleanup_window = WindowCleanup::new();
        clear_window(test_window, color_white());
        let quad = quad_from_points(point_at(100.0, 100.0), point_at(200.0, 100.0), point_at(100.0, 200.0), point_at(200.0, 200.0));
        draw_quad_on_window(test_window, color_black(), quad);
        refresh_screen();
        assert_eq!(color_black(), get_pixel_from_window(test_window, 100.0, 100.0));
        assert_eq!(color_white(), get_pixel_from_window(test_window, 150.0, 150.0));
        assert_eq!(color_white(), get_pixel_from_window(test_window, 250.0, 250.0));
    }
    #[test]
    fn test_draw_quad_on_window_with_options_integration() {
        let test_window = open_window("Test Window 111".to_string(), 800, 600);
        let _cleanup_window = WindowCleanup::new();
        clear_window(test_window, color_white());
        let quad = quad_from_points(point_at(100.0, 100.0), point_at(200.0, 100.0), point_at(100.0, 200.0), point_at(200.0, 200.0));
        draw_quad_on_window_with_options(test_window, color_black(), quad, option_defaults());
        refresh_screen();
        assert_eq!(color_black(), get_pixel_from_window(test_window, 100.0, 100.0));
        assert_eq!(color_white(), get_pixel_from_window(test_window, 150.0, 150.0));
        assert_eq!(color_white(), get_pixel_from_window(test_window, 250.0, 250.0));
    }
    #[test]
    fn test_draw_rectangle_record_integration() {
        let test_window = open_window("Test Window 112".to_string(), 800, 600);
        let _cleanup_window = WindowCleanup::new();
        clear_window(test_window, color_white());
        let rectangle = rectangle_from(100.0, 100.0, 200.0, 150.0);
        draw_rectangle_record(color_black(), rectangle);
        refresh_screen();
        assert_eq!(color_black(), get_pixel_from_window(test_window, 100.0, 100.0));
        assert_eq!(color_white(), get_pixel_from_window(test_window, 150.0, 125.0));
        assert_eq!(color_white(), get_pixel_from_window(test_window, 301.0, 251.0));
    }
    #[test]
    fn test_draw_rectangle_record_with_options_integration() {
        let test_window = open_window("Test Window 113".to_string(), 800, 600);
        let _cleanup_window = WindowCleanup::new();
        clear_window(test_window, color_white());
        let rectangle = rectangle_from(100.0, 100.0, 200.0, 150.0);
        draw_rectangle_record_with_options(color_black(), rectangle, option_defaults());
        refresh_screen();
        assert_eq!(color_black(), get_pixel_from_window(test_window, 100.0, 100.0));
        assert_eq!(color_white(), get_pixel_from_window(test_window, 150.0, 125.0));
        assert_eq!(color_white(), get_pixel_from_window(test_window, 350.0, 300.0));
    }
    #[test]
    fn test_draw_rectangle_integration() {
        let test_window = open_window("Test Window 114".to_string(), 800, 600);
        let _cleanup_window = WindowCleanup::new();
        clear_window(test_window, color_white());
        draw_rectangle(color_black(), 100.0, 100.0, 200.0, 150.0);
        refresh_screen();
        assert_eq!(color_black(), get_pixel_from_window(test_window, 100.0, 100.0));
        assert_eq!(color_white(), get_pixel_from_window(test_window, 301.0, 251.0));
    }
    #[test]
    fn test_draw_rectangle_with_options_integration() {
        let test_window = open_window("Test Window 115".to_string(), 800, 600);
        let _cleanup_window = WindowCleanup::new();
        clear_window(test_window, color_white());
        draw_rectangle_with_options(color_black(), 100.0, 100.0, 200.0, 150.0, option_line_width_with_options(3, option_defaults()));
        refresh_screen();
        assert_eq!(color_black(), get_pixel_from_window(test_window, 100.0, 100.0));
        assert_eq!(color_black(), get_pixel_from_window(test_window, 101.0, 100.0));
        assert_eq!(color_white(), get_pixel_from_window(test_window, 150.0, 125.0));
        assert_eq!(color_white(), get_pixel_from_window(test_window, 301.0, 251.0));
    }
    #[test]
    fn test_draw_rectangle_on_bitmap_record_integration() {
        let test_bitmap = create_bitmap("Test Bitmap 104".to_string(), 100, 100);
        let _cleanup_bitmap = BitmapCleanup::new();
        clear_bitmap(test_bitmap, color_white());
        let rectangle = rectangle_from(50.0, 50.0, 20.0, 30.0);
        draw_rectangle_on_bitmap_record(test_bitmap, color_black(), rectangle);
        assert_eq!(color_black(), get_pixel_from_bitmap(test_bitmap, 50.0, 50.0));
        assert_eq!(color_white(), get_pixel_from_bitmap(test_bitmap, 80.0, 90.0));
    }
    #[test]
    fn test_draw_rectangle_on_bitmap_record_with_options_integration() {
        let test_bitmap = create_bitmap("Test Bitmap 105".to_string(), 100, 100);
        let _cleanup_bitmap = BitmapCleanup::new();
        clear_bitmap(test_bitmap, color_white());
        let rectangle = rectangle_from(50.0, 50.0, 20.0, 20.0);
        draw_rectangle_on_bitmap_record_with_options(test_bitmap, color_black(), rectangle, option_defaults());
        assert_eq!(color_black(), get_pixel_from_bitmap(test_bitmap, 50.0, 50.0));
        assert_eq!(color_white(), get_pixel_from_bitmap(test_bitmap, 75.0, 75.0));
    }
    #[test]
    fn test_draw_rectangle_on_bitmap_integration() {
        let test_bitmap = create_bitmap("Test Bitmap 106".to_string(), 100, 100);
        let _cleanup_bitmap = BitmapCleanup::new();
        clear_bitmap(test_bitmap, color_white());
        draw_rectangle_on_bitmap(test_bitmap, color_black(), 50.0, 50.0, 20.0, 20.0);
        assert_eq!(color_black(), get_pixel_from_bitmap(test_bitmap, 50.0, 50.0));
        assert_eq!(color_white(), get_pixel_from_bitmap(test_bitmap, 75.0, 75.0));
    }
    #[test]
    fn test_draw_rectangle_on_bitmap_with_options_integration() {
        let test_bitmap = create_bitmap("Test Bitmap 107".to_string(), 100, 100);
        let _cleanup_bitmap = BitmapCleanup::new();
        clear_bitmap(test_bitmap, color_white());
        draw_rectangle_on_bitmap_with_options(test_bitmap, color_black(), 50.0, 50.0, 20.0, 20.0, option_defaults());
        assert_eq!(color_black(), get_pixel_from_bitmap(test_bitmap, 50.0, 50.0));
        assert_eq!(color_white(), get_pixel_from_bitmap(test_bitmap, 75.0, 75.0));
    }
    #[test]
    fn test_draw_rectangle_on_window_record_integration() {
        let test_window = open_window("Test Window 116".to_string(), 800, 600);
        let _cleanup_window = WindowCleanup::new();
        clear_window(test_window, color_white());
        let rectangle = rectangle_from(100.0, 100.0, 50.0, 50.0);
        draw_rectangle_on_window_record(test_window, color_black(), rectangle);
        refresh_screen();
        assert_eq!(color_black(), get_pixel_from_window(test_window, 100.0, 100.0));
        assert_eq!(color_white(), get_pixel_from_window(test_window, 125.0, 125.0));
        assert_eq!(color_white(), get_pixel_from_window(test_window, 200.0, 200.0));
    }
    #[test]
    fn test_draw_rectangle_on_window_record_with_options_integration() {
        let test_window = open_window("Test Window 117".to_string(), 800, 600);
        let _cleanup_window = WindowCleanup::new();
        clear_window(test_window, color_white());
        let rectangle = rectangle_from(100.0, 100.0, 50.0, 50.0);
        draw_rectangle_on_window_record_with_options(test_window, color_black(), rectangle, option_defaults());
        refresh_screen();
        assert_eq!(color_black(), get_pixel_from_window(test_window, 100.0, 100.0));
        assert_eq!(color_white(), get_pixel_from_window(test_window, 125.0, 125.0));
        assert_eq!(color_white(), get_pixel_from_window(test_window, 175.0, 175.0));
    }
    #[test]
    fn test_draw_rectangle_on_window_integration() {
        let test_window = open_window("Test Window 118".to_string(), 800, 600);
        let _cleanup_window = WindowCleanup::new();
        clear_window(test_window, color_white());
        draw_rectangle_on_window(test_window, color_black(), 100.0, 100.0, 50.0, 50.0);
        refresh_screen();
        assert_eq!(color_black(), get_pixel_from_window(test_window, 100.0, 100.0));
        assert_eq!(color_white(), get_pixel_from_window(test_window, 200.0, 200.0));
    }
    #[test]
    fn test_draw_rectangle_on_window_with_options_integration() {
        let test_window = open_window("Test Window 119".to_string(), 800, 600);
        let _cleanup_window = WindowCleanup::new();
        clear_window(test_window, color_white());
        draw_rectangle_on_window_with_options(test_window, color_black(), 100.0, 100.0, 50.0, 50.0, option_defaults());
        refresh_screen();
        assert_eq!(color_black(), get_pixel_from_window(test_window, 100.0, 100.0));
        assert_eq!(color_white(), get_pixel_from_window(test_window, 200.0, 200.0));
    }
    #[test]
    fn test_fill_quad_integration() {
        let test_window = open_window("Test Window 120".to_string(), 800, 600);
        let _cleanup_window = WindowCleanup::new();
        clear_window(test_window, color_white());
        let quad = quad_from_points(point_at(100.0, 100.0), point_at(300.0, 100.0), point_at(100.0, 300.0), point_at(300.0, 300.0));
        fill_quad(color_black(), quad);
        refresh_screen();
        assert_eq!(color_black(), get_pixel_from_window(test_window, 200.0, 200.0));
        assert_eq!(color_white(), get_pixel_from_window(test_window, 400.0, 400.0));
    }
    #[test]
    fn test_fill_quad_with_options_integration() {
        let test_window = open_window("Test Window 121".to_string(), 800, 600);
        let _cleanup_window = WindowCleanup::new();
        clear_window(test_window, color_white());
        let quad = quad_from_points(point_at(100.0, 100.0), point_at(300.0, 100.0), point_at(100.0, 300.0), point_at(300.0, 300.0));
        fill_quad_with_options(color_black(), quad, option_defaults());
        refresh_screen();
        assert_eq!(color_black(), get_pixel_from_window(test_window, 200.0, 200.0));
        assert_eq!(color_white(), get_pixel_from_window(test_window, 400.0, 400.0));
    }
    #[test]
    fn test_fill_quad_on_bitmap_integration() {
        let test_bitmap = create_bitmap("Test Bitmap 108".to_string(), 100, 100);
        let _cleanup_bitmap = BitmapCleanup::new();
        clear_bitmap(test_bitmap, color_white());
        let quad = quad_from_points(point_at(10.0, 10.0), point_at(90.0, 10.0), point_at(10.0, 90.0), point_at(90.0, 90.0));
        fill_quad_on_bitmap(test_bitmap, color_black(), quad);
        assert_eq!(color_black(), get_pixel_from_bitmap(test_bitmap, 50.0, 50.0));
        assert_eq!(color_white(), get_pixel_from_bitmap(test_bitmap, 0.0, 0.0));
    }
    #[test]
    fn test_fill_quad_on_bitmap_with_options_integration() {
        let test_bitmap = create_bitmap("Test Bitmap 109".to_string(), 100, 100);
        let _cleanup_bitmap = BitmapCleanup::new();
        clear_bitmap(test_bitmap, color_white());
        let quad = quad_from_points(point_at(10.0, 10.0), point_at(90.0, 10.0), point_at(90.0, 90.0), point_at(10.0, 90.0));
        fill_quad_on_bitmap_with_options(test_bitmap, color_black(), quad, option_defaults());
        assert_eq!(color_black(), get_pixel_from_bitmap(test_bitmap, 50.0, 50.0));
        assert_eq!(color_white(), get_pixel_from_bitmap(test_bitmap, 95.0, 50.0));
    }
    #[test]
    fn test_fill_quad_on_window_integration() {
        let test_window = open_window("Test Window 122".to_string(), 800, 600);
        let _cleanup_window = WindowCleanup::new();
        clear_window(test_window, color_white());
        let quad = quad_from_points(point_at(100.0, 100.0), point_at(200.0, 100.0), point_at(100.0, 200.0), point_at(200.0, 200.0));
        fill_quad_on_window(test_window, color_black(), quad);
        refresh_screen();
        assert_eq!(color_black(), get_pixel_from_window(test_window, 150.0, 150.0));
        assert_eq!(color_white(), get_pixel_from_window(test_window, 250.0, 250.0));
    }
    #[test]
    fn test_fill_quad_on_window_with_options_integration() {
        let test_window = open_window("Test Window 123".to_string(), 800, 600);
        let _cleanup_window = WindowCleanup::new();
        clear_window(test_window, color_white());
        let quad = quad_from_points(point_at(100.0, 100.0), point_at(200.0, 100.0), point_at(200.0, 200.0), point_at(100.0, 200.0));
        fill_quad_on_window_with_options(test_window, color_black(), quad, option_defaults());
        refresh_screen();
        assert_eq!(color_black(), get_pixel_from_window(test_window, 150.0, 150.0));
        assert_eq!(color_white(), get_pixel_from_window(test_window, 250.0, 150.0));
    }
    #[test]
    fn test_fill_rectangle_record_integration() {
        let test_window = open_window("Test Window 124".to_string(), 800, 600);
        let _cleanup_window = WindowCleanup::new();
        clear_window(test_window, color_white());
        let rectangle = rectangle_from(100.0, 100.0, 200.0, 150.0);
        fill_rectangle_record(color_black(), rectangle);
        refresh_screen();
        assert_eq!(color_black(), get_pixel_from_window(test_window, 150.0, 125.0));
        assert_eq!(color_white(), get_pixel_from_window(test_window, 350.0, 275.0));
    }
    #[test]
    fn test_fill_rectangle_record_with_options_integration() {
        let test_window = open_window("Test Window 125".to_string(), 800, 600);
        let _cleanup_window = WindowCleanup::new();
        clear_window(test_window, color_white());
        let rectangle = rectangle_from(100.0, 100.0, 200.0, 150.0);
        fill_rectangle_record_with_options(color_black(), rectangle, option_defaults());
        refresh_screen();
        assert_eq!(color_black(), get_pixel_from_window(test_window, 150.0, 125.0));
        assert_eq!(color_white(), get_pixel_from_window(test_window, 350.0, 275.0));
    }
    #[test]
    fn test_fill_rectangle_integration() {
        let test_window = open_window("Test Window 126".to_string(), 800, 600);
        let _cleanup_window = WindowCleanup::new();
        clear_window(test_window, color_white());
        fill_rectangle(color_black(), 100.0, 100.0, 200.0, 150.0);
        refresh_screen();
        assert_eq!(color_black(), get_pixel_from_window(test_window, 150.0, 125.0));
        assert_eq!(color_white(), get_pixel_from_window(test_window, 301.0, 251.0));
    }
    #[test]
    fn test_fill_rectangle_with_options_integration() {
        let test_window = open_window("Test Window 127".to_string(), 800, 600);
        let _cleanup_window = WindowCleanup::new();
        clear_window(test_window, color_white());
        fill_rectangle_with_options(color_black(), 100.0, 100.0, 200.0, 150.0, option_defaults());
        refresh_screen();
        assert_eq!(color_black(), get_pixel_from_window(test_window, 150.0, 125.0));
        assert_eq!(color_white(), get_pixel_from_window(test_window, 301.0, 251.0));
    }
    #[test]
    fn test_fill_rectangle_on_bitmap_record_integration() {
        let test_bitmap = create_bitmap("Test Bitmap 110".to_string(), 100, 100);
        let _cleanup_bitmap = BitmapCleanup::new();
        clear_bitmap(test_bitmap, color_white());
        let rectangle = rectangle_from(25.0, 25.0, 50.0, 50.0);
        fill_rectangle_on_bitmap_record(test_bitmap, color_black(), rectangle);
        assert_eq!(color_black(), get_pixel_from_bitmap(test_bitmap, 50.0, 50.0));
        assert_eq!(color_white(), get_pixel_from_bitmap(test_bitmap, 10.0, 10.0));
    }
    #[test]
    fn test_fill_rectangle_on_bitmap_record_with_options_integration() {
        let test_bitmap = create_bitmap("Test Bitmap 111".to_string(), 100, 100);
        let _cleanup_bitmap = BitmapCleanup::new();
        clear_bitmap(test_bitmap, color_white());
        let rectangle = rectangle_from(25.0, 25.0, 50.0, 50.0);
        fill_rectangle_on_bitmap_record_with_options(test_bitmap, color_black(), rectangle, option_defaults());
        assert_eq!(color_black(), get_pixel_from_bitmap(test_bitmap, 50.0, 50.0));
        assert_eq!(color_white(), get_pixel_from_bitmap(test_bitmap, 10.0, 10.0));
    }
    #[test]
    fn test_fill_rectangle_on_bitmap_integration() {
        let test_bitmap = create_bitmap("Test Bitmap 112".to_string(), 100, 100);
        let _cleanup_bitmap = BitmapCleanup::new();
        clear_bitmap(test_bitmap, color_white());
        fill_rectangle_on_bitmap(test_bitmap, color_black(), 25.0, 25.0, 50.0, 50.0);
        assert_eq!(color_black(), get_pixel_from_bitmap(test_bitmap, 50.0, 50.0));
        assert_eq!(color_white(), get_pixel_from_bitmap(test_bitmap, 75.0, 75.0));
    }
    #[test]
    fn test_fill_rectangle_on_bitmap_with_options_integration() {
        let test_bitmap = create_bitmap("Test Bitmap 113".to_string(), 100, 100);
        let _cleanup_bitmap = BitmapCleanup::new();
        clear_bitmap(test_bitmap, color_white());
        fill_rectangle_on_bitmap_with_options(test_bitmap, color_black(), 25.0, 25.0, 50.0, 50.0, option_defaults());
        assert_eq!(color_black(), get_pixel_from_bitmap(test_bitmap, 50.0, 50.0));
        assert_eq!(color_white(), get_pixel_from_bitmap(test_bitmap, 10.0, 10.0));
    }
    #[test]
    fn test_fill_rectangle_on_window_record_integration() {
        let test_window = open_window("Test Window 128".to_string(), 800, 600);
        let _cleanup_window = WindowCleanup::new();
        clear_window(test_window, color_white());
        let rectangle = rectangle_from(100.0, 100.0, 200.0, 150.0);
        fill_rectangle_on_window_record(test_window, color_black(), rectangle);
        refresh_screen();
        assert_eq!(color_black(), get_pixel_from_window(test_window, 150.0, 125.0));
        assert_eq!(color_white(), get_pixel_from_window(test_window, 350.0, 275.0));
    }
    #[test]
    fn test_fill_rectangle_on_window_record_with_options_integration() {
        let test_window = open_window("Test Window 129".to_string(), 800, 600);
        let _cleanup_window = WindowCleanup::new();
        clear_window(test_window, color_white());
        let rectangle = rectangle_from(100.0, 100.0, 200.0, 150.0);
        fill_rectangle_on_window_record_with_options(test_window, color_black(), rectangle, option_defaults());
        refresh_screen();
        assert_eq!(color_black(), get_pixel_from_window(test_window, 150.0, 125.0));
        assert_eq!(color_white(), get_pixel_from_window(test_window, 350.0, 275.0));
    }
    #[test]
    fn test_fill_rectangle_on_window_integration() {
        let test_window = open_window("Test Window 130".to_string(), 800, 600);
        let _cleanup_window = WindowCleanup::new();
        clear_window(test_window, color_white());
        fill_rectangle_on_window(test_window, color_black(), 100.0, 100.0, 50.0, 50.0);
        refresh_screen();
        assert_eq!(color_black(), get_pixel_from_window(test_window, 125.0, 125.0));
        assert_eq!(color_white(), get_pixel_from_window(test_window, 175.0, 175.0));
    }
    #[test]
    fn test_fill_rectangle_on_window_with_options_integration() {
        let test_window = open_window("Test Window 131".to_string(), 800, 600);
        let _cleanup_window = WindowCleanup::new();
        clear_window(test_window, color_white());
        fill_rectangle_on_window_with_options(test_window, color_black(), 100.0, 100.0, 50.0, 50.0, option_defaults());
        refresh_screen();
        assert_eq!(color_black(), get_pixel_from_window(test_window, 125.0, 125.0));
        assert_eq!(color_white(), get_pixel_from_window(test_window, 175.0, 175.0));
    }
    #[test]
    fn test_draw_text_font_as_string_integration() {
        let test_window = open_window("Test Window 132".to_string(), 800, 600);
        let _cleanup_window = WindowCleanup::new();
        clear_window(test_window, color_white());
        refresh_screen();
        load_font("hara".to_string(), "hara.ttf".to_string());
        let _cleanup_font = FontCleanup::new();
        draw_text_font_as_string("Test Text".to_string(), color_black(), "hara".to_string(), 24, 100.0, 100.0);
        refresh_screen();
        assert_eq!(color_black(), get_pixel_from_window(test_window, 120.0, 110.0));
        assert_eq!(color_white(), get_pixel_from_window(test_window, 90.0, 90.0));
    }
    #[test]
    fn test_draw_text_with_options_font_as_string_integration() {
        let test_window = open_window("Test Window 133".to_string(), 800, 600);
        let _cleanup_window = WindowCleanup::new();
        clear_window(test_window, color_white());
        load_font("hara".to_string(), "hara.ttf".to_string());
        let _cleanup_font = FontCleanup::new();
        draw_text_with_options_font_as_string("Test Text".to_string(), color_black(), "hara".to_string(), 24, 100.0, 100.0, option_defaults());
        refresh_screen();
        assert_eq!(color_black(), get_pixel_from_window(test_window, 120.0, 110.0));
        assert_eq!(color_white(), get_pixel_from_window(test_window, 90.0, 90.0));
    }
    #[test]
    fn test_draw_text_no_font_no_size_integration() {
        let test_window = open_window("Test Window 134".to_string(), 800, 600);
        let _cleanup_window = WindowCleanup::new();
        clear_window(test_window, color_white());
        draw_text_no_font_no_size("Test Text".to_string(), color_black(), 100.0, 100.0);
        refresh_screen();
        assert_eq!(color_black(), get_pixel_from_window(test_window, 105.0, 100.0));
        assert_eq!(color_white(), get_pixel_from_window(test_window, 90.0, 90.0));
    }
    #[test]
    fn test_draw_text_no_font_no_size_with_options_integration() {
        let test_window = open_window("Test Window 135".to_string(), 800, 600);
        let _cleanup_window = WindowCleanup::new();
        clear_window(test_window, color_white());
        draw_text_no_font_no_size_with_options("Test Text".to_string(), color_black(), 100.0, 100.0, option_defaults());
        refresh_screen();
        assert_eq!(color_black(), get_pixel_from_window(test_window, 105.0, 100.0));
        assert_eq!(color_white(), get_pixel_from_window(test_window, 90.0, 90.0));
    }
    #[test]
    fn test_draw_text_integration() {
        let test_window = open_window("Test Window 136".to_string(), 800, 600);
        let _cleanup_window = WindowCleanup::new();
        clear_window(test_window, color_white());
        load_font("hara".to_string(), "hara.ttf".to_string());
        let _cleanup_font = FontCleanup::new();
        draw_text("Test Text".to_string(), color_black(), font_named("hara".to_string()), 24, 100.0, 100.0);
        refresh_screen();
        assert_eq!(color_black(), get_pixel_from_window(test_window, 120.0, 110.0));
        assert_eq!(color_white(), get_pixel_from_window(test_window, 90.0, 90.0));
    }
    #[test]
    fn test_draw_text_with_options_integration() {
        let test_window = open_window("Test Window 137".to_string(), 800, 600);
        let _cleanup_window = WindowCleanup::new();
        clear_window(test_window, color_white());
        load_font("hara".to_string(), "hara.ttf".to_string());
        let _cleanup_font = FontCleanup::new();
        draw_text_with_options("Test Text".to_string(), color_black(), font_named("hara".to_string()), 24, 100.0, 100.0, option_defaults());
        refresh_screen();
        assert_eq!(color_black(), get_pixel_from_window(test_window, 120.0, 110.0));
        assert_eq!(color_white(), get_pixel_from_window(test_window, 90.0, 90.0));
    }
    #[test]
    fn test_draw_text_on_bitmap_font_as_string_integration() {
        let test_bitmap = create_bitmap("Test Bitmap 114".to_string(), 200, 200);
        let _cleanup_bitmap = BitmapCleanup::new();
        clear_bitmap(test_bitmap, color_white());
        load_font("hara".to_string(), "hara.ttf".to_string());
        let _cleanup_font = FontCleanup::new();
        draw_text_on_bitmap_font_as_string(test_bitmap, "Test Text".to_string(), color_black(), "hara".to_string(), 24, 100.0, 100.0);
        assert_eq!(color_black(), get_pixel_from_bitmap(test_bitmap, 120.0, 110.0));
        assert_eq!(color_white(), get_pixel_from_bitmap(test_bitmap, 90.0, 90.0));
    }
    #[test]
    fn test_draw_text_on_bitmap_with_options_font_as_string_integration() {
        let test_bitmap = create_bitmap("Test Bitmap 115".to_string(), 200, 200);
        let _cleanup_bitmap = BitmapCleanup::new();
        clear_bitmap(test_bitmap, color_white());
        load_font("hara".to_string(), "hara.ttf".to_string());
        let _cleanup_font = FontCleanup::new();
        draw_text_on_bitmap_with_options_font_as_string(test_bitmap, "Test Text".to_string(), color_black(), "hara".to_string(), 24, 100.0, 100.0, option_defaults());
        assert_eq!(color_black(), get_pixel_from_bitmap(test_bitmap, 120.0, 110.0));
        assert_eq!(color_white(), get_pixel_from_bitmap(test_bitmap, 90.0, 90.0));
    }
    #[test]
    fn test_draw_text_on_bitmap_no_font_no_size_integration() {
        let test_bitmap = create_bitmap("Test Bitmap 116".to_string(), 200, 200);
        let _cleanup_bitmap = BitmapCleanup::new();
        clear_bitmap(test_bitmap, color_white());
        draw_text_on_bitmap_no_font_no_size(test_bitmap, "Test Text".to_string(), color_black(), 100.0, 100.0);
        assert_eq!(color_black(), get_pixel_from_bitmap(test_bitmap, 105.0, 100.0));
        assert_eq!(color_white(), get_pixel_from_bitmap(test_bitmap, 90.0, 90.0));
    }
    #[test]
    fn test_draw_text_on_bitmap_no_font_no_size_with_options_integration() {
        let test_bitmap = create_bitmap("Test Bitmap 117".to_string(), 200, 200);
        let _cleanup_bitmap = BitmapCleanup::new();
        clear_bitmap(test_bitmap, color_white());
        draw_text_on_bitmap_no_font_no_size_with_options(test_bitmap, "Test Text".to_string(), color_black(), 100.0, 100.0, option_defaults());
        assert_eq!(color_black(), get_pixel_from_bitmap(test_bitmap, 105.0, 100.0));
        assert_eq!(color_white(), get_pixel_from_bitmap(test_bitmap, 90.0, 90.0));
    }
    #[test]
    fn test_draw_text_on_bitmap_integration() {
        let test_bitmap = create_bitmap("Test Bitmap 118".to_string(), 200, 200);
        let _cleanup_bitmap = BitmapCleanup::new();
        clear_bitmap(test_bitmap, color_white());
        load_font("hara".to_string(), "hara.ttf".to_string());
        let _cleanup_font = FontCleanup::new();
        draw_text_on_bitmap(test_bitmap, "Test Text".to_string(), color_black(), font_named("hara".to_string()), 24, 100.0, 100.0);
        assert_eq!(color_black(), get_pixel_from_bitmap(test_bitmap, 120.0, 110.0));
        assert_eq!(color_white(), get_pixel_from_bitmap(test_bitmap, 90.0, 90.0));
    }
    #[test]
    fn test_draw_text_on_bitmap_with_options_integration() {
        let test_bitmap = create_bitmap("Test Bitmap 119".to_string(), 200, 200);
        let _cleanup_bitmap = BitmapCleanup::new();
        clear_bitmap(test_bitmap, color_white());
        load_font("hara".to_string(), "hara.ttf".to_string());
        let _cleanup_font = FontCleanup::new();
        draw_text_on_bitmap_with_options(test_bitmap, "Test Text".to_string(), color_black(), font_named("hara".to_string()), 24, 100.0, 100.0, option_defaults());
        assert_eq!(color_black(), get_pixel_from_bitmap(test_bitmap, 120.0, 110.0));
        assert_eq!(color_white(), get_pixel_from_bitmap(test_bitmap, 90.0, 90.0));
    }
    #[test]
    fn test_draw_text_on_window_font_as_string_integration() {
        let test_window = open_window("Test Window 138".to_string(), 800, 600);
        let _cleanup_window = WindowCleanup::new();
        clear_window(test_window, color_white());
        load_font("hara".to_string(), "hara.ttf".to_string());
        let _cleanup_font = FontCleanup::new();
        draw_text_on_window_font_as_string(test_window, "Test Text".to_string(), color_black(), "hara".to_string(), 24, 100.0, 100.0);
        refresh_screen();
        assert_eq!(color_black(), get_pixel_from_window(test_window, 120.0, 110.0));
        assert_eq!(color_white(), get_pixel_from_window(test_window, 90.0, 90.0));
    }
    #[test]
    fn test_draw_text_on_window_with_options_font_as_string_integration() {
        let test_window = open_window("Test Window 139".to_string(), 800, 600);
        let _cleanup_window = WindowCleanup::new();
        clear_window(test_window, color_white());
        load_font("hara".to_string(), "hara.ttf".to_string());
        let _cleanup_font = FontCleanup::new();
        draw_text_on_window_with_options_font_as_string(test_window, "Test Text".to_string(), color_black(), "hara".to_string(), 24, 100.0, 100.0, option_defaults());
        refresh_screen();
        assert_eq!(color_black(), get_pixel_from_window(test_window, 120.0, 110.0));
        assert_eq!(color_white(), get_pixel_from_window(test_window, 90.0, 90.0));
    }
    #[test]
    fn test_draw_text_on_window_no_font_no_size_integration() {
        let test_window = open_window("Test Window 140".to_string(), 800, 600);
        let _cleanup_window = WindowCleanup::new();
        clear_window(test_window, color_white());
        draw_text_on_window_no_font_no_size(test_window, "Test Text".to_string(), color_black(), 100.0, 100.0);
        refresh_screen();
        assert_eq!(color_black(), get_pixel_from_window(test_window, 105.0, 100.0));
        assert_eq!(color_white(), get_pixel_from_window(test_window, 90.0, 90.0));
    }
    #[test]
    fn test_draw_text_on_window_no_font_no_size_with_options_integration() {
        let test_window = open_window("Test Window 141".to_string(), 800, 600);
        let _cleanup_window = WindowCleanup::new();
        clear_window(test_window, color_white());
        draw_text_on_window_no_font_no_size_with_options(test_window, "Test Text".to_string(), color_black(), 100.0, 100.0, option_defaults());
        refresh_screen();
        assert_eq!(color_black(), get_pixel_from_window(test_window, 105.0, 100.0));
        assert_eq!(color_white(), get_pixel_from_window(test_window, 90.0, 90.0));
    }
    #[test]
    fn test_draw_text_on_window_integration() {
        let test_window = open_window("Test Window 142".to_string(), 800, 600);
        let _cleanup_window = WindowCleanup::new();
        clear_window(test_window, color_white());
        load_font("hara".to_string(), "hara.ttf".to_string());
        let _cleanup_font = FontCleanup::new();
        let test_font = font_named("hara".to_string());
        font_load_size(test_font, 24);
        draw_text_on_window(test_window, "Test Text".to_string(), color_black(), test_font, 24, 100.0, 100.0);
        refresh_screen();
        assert_eq!(color_black(), get_pixel_from_window(test_window, 120.0, 110.0));
        assert_eq!(color_white(), get_pixel_from_window(test_window, 90.0, 90.0));
    }
    #[test]
    fn test_draw_text_on_window_with_options_integration() {
        let test_window = open_window("Test Window 143".to_string(), 800, 600);
        let _cleanup_window = WindowCleanup::new();
        clear_window(test_window, color_white());
        let test_font = load_font("Test Font".to_string(), "hara.ttf".to_string());
        let _cleanup_font = FontCleanup::new();
        draw_text_on_window_with_options(test_window, "Test Text".to_string(), color_black(), test_font, 24, 100.0, 100.0, option_defaults());
        refresh_screen();
        assert_eq!(color_black(), get_pixel_from_window(test_window, 120.0, 110.0));
        assert_eq!(color_white(), get_pixel_from_window(test_window, 90.0, 90.0));
    }
    #[test]
    fn test_font_has_size_name_as_string_integration() {
        load_font("hara".to_string(), "hara.ttf".to_string());
        let _cleanup_font = FontCleanup::new();
        font_load_size_name_as_string("hara".to_string(), 12);
        assert!(font_has_size_name_as_string("hara".to_string(), 12));
        assert!(!font_has_size_name_as_string("nonexistent_font".to_string(), 12));
    }
    #[test]
    fn test_font_has_size_integration() {
        let test_font = load_font("Test Font".to_string(), "hara.ttf".to_string());
        let _cleanup_font = FontCleanup::new();
        font_load_size(test_font, 12);
        assert!(font_has_size(test_font, 12));
        assert!(!font_has_size(test_font, 999));
    }
    #[test]
    fn test_font_load_size_name_as_string_integration() {
        load_font("Test Font".to_string(), "hara.ttf".to_string());
        let _cleanup_font = FontCleanup::new();
        font_load_size_name_as_string("Test Font".to_string(), 12);
        assert!(font_has_size_name_as_string("Test Font".to_string(), 12));
    }
    #[test]
    fn test_font_load_size_integration() {
        let test_font = load_font("Test Font".to_string(), "hara.ttf".to_string());
        let _cleanup_font = FontCleanup::new();
        font_load_size(test_font, 12);
        assert!(font_has_size(test_font, 12));
    }
    #[test]
    fn test_font_named_integration() {
        let test_window = open_window("Test Window 144".to_string(), 800, 600);
        let _cleanup_window = WindowCleanup::new();
        clear_window(test_window, color_white());
        load_font("hara".to_string(), "hara.ttf".to_string());
        let _cleanup_font = FontCleanup::new();
        let test_font = font_named("hara".to_string());
        draw_text("Test Text".to_string(), color_black(), test_font, 24, 100.0, 100.0);
        refresh_screen();
        assert!(!test_font.is_null());
        assert_eq!(color_black(), get_pixel_from_window(test_window, 120.0, 110.0));
        assert_eq!(color_white(), get_pixel_from_window(test_window, 90.0, 90.0));
    }
    #[test]
    fn test_free_all_fonts_integration() {
        load_font("Test Font".to_string(), "hara.ttf".to_string());
        let _cleanup_font = FontCleanup::new();
        assert!(has_font_name_as_string("Test Font".to_string()));
        free_all_fonts();
        assert!(!has_font_name_as_string("Test Font".to_string()));
    }
    #[test]
    fn test_free_font_integration() {
        let test_font = load_font("Test Font".to_string(), "hara.ttf".to_string());
        let _cleanup_font = FontCleanup::new();
        assert!(has_font(test_font));
        free_font(test_font);
        assert!(!has_font(test_font));
    }
    #[test]
    fn test_get_font_style_name_as_string_integration() {
        load_font("Test Font".to_string(), "hara.ttf".to_string());
        let _cleanup_font = FontCleanup::new();
        let style = get_font_style_name_as_string("Test Font".to_string());
        assert_eq!(FontStyle::BoldFont, style);
    }
    #[test]
    fn test_get_font_style_integration() {
        let test_font = load_font("Test Font".to_string(), "hara.ttf".to_string());
        let _cleanup_font = FontCleanup::new();
        let style = get_font_style(test_font);
        assert_eq!(FontStyle::BoldFont, style);
    }
    #[test]
    fn test_get_system_font_integration() {
        let system_font = get_system_font();
        assert!(!system_font.is_null());
    }
    #[test]
    fn test_has_font_integration() {
        let test_font = load_font("Test Font".to_string(), "hara.ttf".to_string());
        let _cleanup_font = FontCleanup::new();
        assert!(has_font(test_font));
        free_font(test_font);
        assert!(!has_font(test_font));
    }
    #[test]
    fn test_has_font_name_as_string_integration() {
        load_font("Test Font".to_string(), "hara.ttf".to_string());
        let _cleanup_font = FontCleanup::new();
        assert!(has_font_name_as_string("Test Font".to_string()));
        assert!(!has_font_name_as_string("nonexistent_font".to_string()));
    }
    #[test]
    fn test_load_font_integration() {
        let test_window = open_window("Test Window 145".to_string(), 800, 600);
        let _cleanup_window = WindowCleanup::new();
        clear_window(test_window, color_white());
        let test_font = load_font("Test Font".to_string(), "hara.ttf".to_string());
        let _cleanup_font = FontCleanup::new();
        draw_text_with_options("Test Text".to_string(), color_black(), test_font, 24, 100.0, 100.0, option_defaults());
        refresh_screen();
        assert!(has_font_name_as_string("Test Font".to_string()));
        assert_eq!(color_black(), get_pixel_from_window(test_window, 105.0, 105.0));
    }
    #[test]
    fn test_set_font_style_name_as_string_integration() {
        load_font("Test Font".to_string(), "hara.ttf".to_string());
        let _cleanup_font = FontCleanup::new();
        set_font_style_name_as_string("Test Font".to_string(), FontStyle::BoldFont);
        assert_eq!(FontStyle::BoldFont, get_font_style_name_as_string("Test Font".to_string()));
    }
    #[test]
    fn test_set_font_style_integration() {
        let test_font = load_font("Test Font".to_string(), "hara.ttf".to_string());
        let _cleanup_font = FontCleanup::new();
        set_font_style(test_font, FontStyle::BoldFont);
        assert_eq!(FontStyle::BoldFont, get_font_style(test_font));
    }
    #[test]
    fn test_text_height_font_named_integration() {
        load_font("Test Font".to_string(), "hara.ttf".to_string());
        let _cleanup_font = FontCleanup::new();
        font_load_size_name_as_string("Test Font".to_string(), 24);
        let height = text_height_font_named("Test Text".to_string(), "Test Font".to_string(), 24);
        assert!(height > 0);
        assert!(height >= 24);
    }
    #[test]
    fn test_text_height_integration() {
        let test_font = load_font("Test Font".to_string(), "hara.ttf".to_string());
        let _cleanup_font = FontCleanup::new();
        font_load_size(test_font, 24);
        let height = text_height("Test Text".to_string(), test_font, 24);
        assert!(height > 0);
        assert!(height >= 24);
    }
    #[test]
    fn test_text_width_font_named_integration() {
        let test_font = load_font("hara".to_string(), "hara.ttf".to_string());
        let _cleanup_font = FontCleanup::new();
        font_load_size(test_font, 12);
        let width = text_width_font_named("Test Text".to_string(), "hara".to_string(), 24);
        assert!(width > 0);
        assert!(width >= text_height_font_named("Test Text".to_string(), "hara".to_string(), 24));
    }
    #[test]
    fn test_text_width_integration() {
        let test_font = load_font("Test Font".to_string(), "hara.ttf".to_string());
        let _cleanup_font = FontCleanup::new();
        font_load_size(test_font, 12);
        let width = text_width("Test Text".to_string(), test_font, 24);
        assert!(width > 0);
        assert!(width >= text_height("Text Height".to_string(), test_font, 24));
    }
    #[test]
    fn test_draw_triangle_record_integration() {
        let test_window = open_window("Test Window 146".to_string(), 800, 600);
        let _cleanup_window = WindowCleanup::new();
        clear_window(test_window, color_white());
        let triangle = triangle_from(point_at(100.0, 100.0), point_at(200.0, 200.0), point_at(150.0, 300.0));
        draw_triangle_record(color_black(), triangle);
        refresh_screen();
        assert_eq!(color_black(), get_pixel_from_window(test_window, 100.0, 100.0));
        assert_eq!(color_white(), get_pixel_from_window(test_window, 150.0, 200.0));
    }
    #[test]
    fn test_draw_triangle_record_with_options_integration() {
        let test_window = open_window("Test Window 147".to_string(), 800, 600);
        let _cleanup_window = WindowCleanup::new();
        clear_window(test_window, color_white());
        let triangle = triangle_from(point_at(100.0, 100.0), point_at(200.0, 200.0), point_at(150.0, 300.0));
        draw_triangle_record_with_options(color_black(), triangle, option_defaults());
        refresh_screen();
        assert_eq!(color_black(), get_pixel_from_window(test_window, 100.0, 100.0));
        assert_eq!(color_white(), get_pixel_from_window(test_window, 150.0, 200.0));
    }
    #[test]
    fn test_draw_triangle_integration() {
        let test_window = open_window("Test Window 148".to_string(), 800, 600);
        let _cleanup_window = WindowCleanup::new();
        clear_window(test_window, color_white());
        draw_triangle(color_black(), 100.0, 100.0, 200.0, 300.0, 300.0, 100.0);
        refresh_screen();
        assert_eq!(color_black(), get_pixel_from_window(test_window, 100.0, 100.0));
        assert_eq!(color_white(), get_pixel_from_window(test_window, 200.0, 150.0));
    }
    #[test]
    fn test_draw_triangle_with_options_integration() {
        let test_window = open_window("Test Window 149".to_string(), 800, 600);
        let _cleanup_window = WindowCleanup::new();
        clear_window(test_window, color_white());
        draw_triangle_with_options(color_black(), 100.0, 100.0, 200.0, 200.0, 150.0, 300.0, option_defaults());
        refresh_screen();
        assert_eq!(color_black(), get_pixel_from_window(test_window, 100.0, 100.0));
        assert_eq!(color_white(), get_pixel_from_window(test_window, 150.0, 200.0));
    }
    #[test]
    fn test_draw_triangle_on_bitmap_record_integration() {
        let test_bitmap = create_bitmap("Test Bitmap 120".to_string(), 100, 100);
        let _cleanup_bitmap = BitmapCleanup::new();
        clear_bitmap(test_bitmap, color_white());
        let triangle = triangle_from(point_at(25.0, 25.0), point_at(75.0, 25.0), point_at(50.0, 75.0));
        draw_triangle_on_bitmap_record(test_bitmap, color_black(), triangle);
        assert_eq!(color_black(), get_pixel_from_bitmap(test_bitmap, 25.0, 25.0));
        assert_eq!(color_white(), get_pixel_from_bitmap(test_bitmap, 50.0, 50.0));
    }
    #[test]
    fn test_draw_triangle_on_bitmap_record_with_options_integration() {
        let test_bitmap = create_bitmap("Test Bitmap 121".to_string(), 100, 100);
        let _cleanup_bitmap = BitmapCleanup::new();
        clear_bitmap(test_bitmap, color_white());
        let triangle = triangle_from(point_at(25.0, 25.0), point_at(75.0, 25.0), point_at(50.0, 75.0));
        draw_triangle_on_bitmap_record_with_options(test_bitmap, color_black(), triangle, option_defaults());
        assert_eq!(color_black(), get_pixel_from_bitmap(test_bitmap, 25.0, 25.0));
        assert_eq!(color_white(), get_pixel_from_bitmap(test_bitmap, 50.0, 50.0));
    }
    #[test]
    fn test_draw_triangle_on_bitmap_integration() {
        let test_bitmap = create_bitmap("Test Bitmap 122".to_string(), 100, 100);
        let _cleanup_bitmap = BitmapCleanup::new();
        clear_bitmap(test_bitmap, color_white());
        draw_triangle_on_bitmap(test_bitmap, color_black(), 25.0, 25.0, 75.0, 25.0, 50.0, 75.0);
        assert_eq!(color_black(), get_pixel_from_bitmap(test_bitmap, 25.0, 25.0));
        assert_eq!(color_white(), get_pixel_from_bitmap(test_bitmap, 50.0, 50.0));
    }
    #[test]
    fn test_draw_triangle_on_bitmap_with_options_integration() {
        let test_bitmap = create_bitmap("Test Bitmap 123".to_string(), 100, 100);
        let _cleanup_bitmap = BitmapCleanup::new();
        clear_bitmap(test_bitmap, color_white());
        draw_triangle_on_bitmap_with_options(test_bitmap, color_black(), 25.0, 25.0, 75.0, 25.0, 50.0, 75.0, option_defaults());
        assert_eq!(color_black(), get_pixel_from_bitmap(test_bitmap, 25.0, 25.0));
        assert_eq!(color_white(), get_pixel_from_bitmap(test_bitmap, 50.0, 50.0));
    }
    #[test]
    fn test_draw_triangle_on_window_record_integration() {
        let test_window = open_window("Test Window 150".to_string(), 800, 600);
        let _cleanup_window = WindowCleanup::new();
        clear_window(test_window, color_white());
        let triangle = triangle_from(point_at(100.0, 100.0), point_at(200.0, 200.0), point_at(150.0, 300.0));
        draw_triangle_on_window_record(test_window, color_black(), triangle);
        refresh_screen();
        assert_eq!(color_black(), get_pixel_from_window(test_window, 100.0, 100.0));
        assert_eq!(color_white(), get_pixel_from_window(test_window, 50.0, 50.0));
    }
    #[test]
    fn test_draw_triangle_on_window_record_with_options_integration() {
        let test_window = open_window("Test Window 151".to_string(), 800, 600);
        let _cleanup_window = WindowCleanup::new();
        clear_window(test_window, color_white());
        let triangle = triangle_from(point_at(100.0, 100.0), point_at(200.0, 200.0), point_at(150.0, 250.0));
        draw_triangle_on_window_record_with_options(test_window, color_black(), triangle, option_defaults());
        refresh_screen();
        assert_eq!(color_black(), get_pixel_from_window(test_window, 150.0, 150.0));
        assert_eq!(color_white(), get_pixel_from_window(test_window, 50.0, 50.0));
    }
    #[test]
    fn test_draw_triangle_on_window_integration() {
        let test_window = open_window("Test Window 152".to_string(), 800, 600);
        let _cleanup_window = WindowCleanup::new();
        clear_window(test_window, color_white());
        draw_triangle_on_window(test_window, color_black(), 100.0, 100.0, 200.0, 300.0, 300.0, 100.0);
        refresh_screen();
        assert_eq!(color_black(), get_pixel_from_window(test_window, 100.0, 100.0));
        assert_eq!(color_white(), get_pixel_from_window(test_window, 50.0, 50.0));
    }
    #[test]
    fn test_draw_triangle_on_window_with_options_integration() {
        let test_window = open_window("Test Window 153".to_string(), 800, 600);
        let _cleanup_window = WindowCleanup::new();
        clear_window(test_window, color_white());
        draw_triangle_on_window_with_options(test_window, color_black(), 100.0, 100.0, 200.0, 200.0, 150.0, 300.0, option_defaults());
        refresh_screen();
        assert_eq!(color_black(), get_pixel_from_window(test_window, 100.0, 100.0));
        assert_eq!(color_white(), get_pixel_from_window(test_window, 50.0, 50.0));
    }
    #[test]
    fn test_fill_triangle_record_integration() {
        let test_window = open_window("Test Window 154".to_string(), 800, 600);
        let _cleanup_window = WindowCleanup::new();
        clear_window(test_window, color_white());
        let triangle = triangle_from(point_at(100.0, 100.0), point_at(200.0, 300.0), point_at(300.0, 100.0));
        fill_triangle_record(color_black(), triangle);
        refresh_screen();
        assert_eq!(color_black(), get_pixel_from_window(test_window, 200.0, 150.0));
        assert_eq!(color_white(), get_pixel_from_window(test_window, 50.0, 50.0));
    }
    #[test]
    fn test_fill_triangle_record_with_options_integration() {
        let test_window = open_window("Test Window 155".to_string(), 800, 600);
        let _cleanup_window = WindowCleanup::new();
        clear_window(test_window, color_white());
        let triangle = triangle_from(point_at(100.0, 100.0), point_at(200.0, 300.0), point_at(300.0, 100.0));
        fill_triangle_record_with_options(color_black(), triangle, option_defaults());
        refresh_screen();
        assert_eq!(color_black(), get_pixel_from_window(test_window, 200.0, 150.0));
        assert_eq!(color_white(), get_pixel_from_window(test_window, 50.0, 50.0));
    }
    #[test]
    fn test_fill_triangle_integration() {
        let test_window = open_window("Test Window 156".to_string(), 800, 600);
        let _cleanup_window = WindowCleanup::new();
        clear_window(test_window, color_white());
        fill_triangle(color_black(), 100.0, 100.0, 200.0, 300.0, 300.0, 100.0);
        refresh_screen();
        assert_eq!(color_black(), get_pixel_from_window(test_window, 200.0, 150.0));
        assert_eq!(color_white(), get_pixel_from_window(test_window, 50.0, 50.0));
    }
    #[test]
    fn test_fill_triangle_with_options_integration() {
        let test_window = open_window("Test Window 157".to_string(), 800, 600);
        let _cleanup_window = WindowCleanup::new();
        clear_window(test_window, color_white());
        fill_triangle_with_options(color_red(), 100.0, 100.0, 200.0, 300.0, 300.0, 100.0, option_defaults());
        refresh_screen();
        assert_eq!(color_red(), get_pixel_from_window(test_window, 150.0, 150.0));
        assert_eq!(color_white(), get_pixel_from_window(test_window, 350.0, 150.0));
    }
    #[test]
    fn test_fill_triangle_on_bitmap_record_integration() {
        let test_bitmap = create_bitmap("Test Bitmap 124".to_string(), 100, 100);
        let _cleanup_bitmap = BitmapCleanup::new();
        clear_bitmap(test_bitmap, color_white());
        let triangle = triangle_from(point_at(25.0, 25.0), point_at(75.0, 25.0), point_at(50.0, 75.0));
        fill_triangle_on_bitmap_record(test_bitmap, color_black(), triangle);
        assert_eq!(color_black(), get_pixel_from_bitmap(test_bitmap, 50.0, 50.0));
        assert_eq!(color_white(), get_pixel_from_bitmap(test_bitmap, 0.0, 0.0));
    }
    #[test]
    fn test_fill_triangle_on_bitmap_record_with_options_integration() {
        let test_bitmap = create_bitmap("Test Bitmap 125".to_string(), 100, 100);
        let _cleanup_bitmap = BitmapCleanup::new();
        clear_bitmap(test_bitmap, color_white());
        let triangle = triangle_from(point_at(25.0, 25.0), point_at(75.0, 25.0), point_at(50.0, 75.0));
        fill_triangle_on_bitmap_record_with_options(test_bitmap, color_black(), triangle, option_defaults());
        assert_eq!(color_black(), get_pixel_from_bitmap(test_bitmap, 50.0, 50.0));
        assert_eq!(color_white(), get_pixel_from_bitmap(test_bitmap, 10.0, 10.0));
    }
    #[test]
    fn test_fill_triangle_on_bitmap_integration() {
        let test_bitmap = create_bitmap("Test Bitmap 126".to_string(), 100, 100);
        let _cleanup_bitmap = BitmapCleanup::new();
        clear_bitmap(test_bitmap, color_white());
        fill_triangle_on_bitmap(test_bitmap, color_black(), 25.0, 25.0, 75.0, 25.0, 50.0, 75.0);
        assert_eq!(color_black(), get_pixel_from_bitmap(test_bitmap, 50.0, 50.0));
        assert_eq!(color_white(), get_pixel_from_bitmap(test_bitmap, 0.0, 0.0));
    }
    #[test]
    fn test_fill_triangle_on_bitmap_with_options_integration() {
        let test_bitmap = create_bitmap("Test Bitmap 127".to_string(), 100, 100);
        let _cleanup_bitmap = BitmapCleanup::new();
        clear_bitmap(test_bitmap, color_white());
        fill_triangle_on_bitmap_with_options(test_bitmap, color_black(), 25.0, 25.0, 75.0, 25.0, 50.0, 75.0, option_defaults());
        assert_eq!(color_black(), get_pixel_from_bitmap(test_bitmap, 50.0, 50.0));
        assert_eq!(color_white(), get_pixel_from_bitmap(test_bitmap, 0.0, 0.0));
    }
    #[test]
    fn test_fill_triangle_on_window_record_integration() {
        let test_window = open_window("Test Window 158".to_string(), 800, 600);
        let _cleanup_window = WindowCleanup::new();
        clear_window(test_window, color_white());
        let triangle = triangle_from(point_at(100.0, 100.0), point_at(200.0, 300.0), point_at(300.0, 100.0));
        fill_triangle_on_window_record(test_window, color_black(), triangle);
        refresh_screen();
        assert_eq!(color_black(), get_pixel_from_window(test_window, 200.0, 200.0));
        assert_eq!(color_white(), get_pixel_from_window(test_window, 50.0, 50.0));
    }
    #[test]
    fn test_fill_triangle_on_window_record_with_options_integration() {
        let test_window = open_window("Test Window 159".to_string(), 800, 600);
        let _cleanup_window = WindowCleanup::new();
        clear_window(test_window, color_white());
        let triangle = triangle_from(point_at(100.0, 100.0), point_at(200.0, 300.0), point_at(300.0, 100.0));
        fill_triangle_on_window_record_with_options(test_window, color_black(), triangle, option_defaults());
        refresh_screen();
        assert_eq!(color_black(), get_pixel_from_window(test_window, 200.0, 200.0));
        assert_eq!(color_white(), get_pixel_from_window(test_window, 50.0, 50.0));
    }
    #[test]
    fn test_fill_triangle_on_window_integration() {
        let test_window = open_window("Test Window 160".to_string(), 800, 600);
        let _cleanup_window = WindowCleanup::new();
        clear_window(test_window, color_white());
        fill_triangle_on_window(test_window, color_black(), 100.0, 100.0, 200.0, 300.0, 300.0, 100.0);
        refresh_screen();
        assert_eq!(color_black(), get_pixel_from_window(test_window, 200.0, 200.0));
        assert_eq!(color_white(), get_pixel_from_window(test_window, 50.0, 50.0));
    }
    #[test]
    fn test_fill_triangle_on_window_with_options_integration() {
        let test_window = open_window("Test Window 161".to_string(), 800, 600);
        let _cleanup_window = WindowCleanup::new();
        clear_window(test_window, color_white());
        fill_triangle_on_window_with_options(test_window, color_black(), 100.0, 100.0, 200.0, 300.0, 300.0, 100.0, option_defaults());
        refresh_screen();
        assert_eq!(color_black(), get_pixel_from_window(test_window, 150.0, 150.0));
        assert_eq!(color_white(), get_pixel_from_window(test_window, 350.0, 150.0));
    }
}
