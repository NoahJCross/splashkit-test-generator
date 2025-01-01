import pytest
from splashkit import *
from ..helpers import *
import contextlib
class TestGraphics:
    def setup_method(self):
        set_resources_path("/mnt/c/Users/Noahc/Documents/aYear_2_semester_2/TeamProject/GitHubRepo/splashkit_test_generator/resources")

    def test_draw_circle_record_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
            clear_window(test_window, color_white())
            test_circle = circle_at_from_points(400.0, 300.0, 50.0)
            draw_circle_record(color_black(), test_circle)
            assert color_black() == get_pixel_from_window(test_window, 450.0, 300.0)
            assert color_white() == get_pixel_from_window(test_window, 400.0, 300.0)
            assert color_white() == get_pixel_from_window(test_window, 460.0, 300.0)
            
    def test_draw_circle_record_with_options_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
            clear_window(test_window, color_white())
            test_circle = circle_at_from_points(400.0, 300.0, 50.0)
            draw_circle_record_with_options(color_black(), test_circle, option_defaults())
            assert color_black() == get_pixel_from_window(test_window, 450.0, 300.0)
            assert color_white() == get_pixel_from_window(test_window, 400.0, 300.0)
            assert color_white() == get_pixel_from_window(test_window, 460.0, 300.0)
            
    def test_draw_circle_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
            clear_window(test_window, color_white())
            draw_circle(color_black(), 400.0, 300.0, 50.0)
            refresh_screen()
            assert color_black() == get_pixel_from_window(test_window, 450.0, 300.0)
            assert color_white() == get_pixel_from_window(test_window, 425.0, 300.0)
            assert color_white() == get_pixel_from_window(test_window, 460.0, 300.0)
            
    def test_draw_circle_with_options_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
            clear_window(test_window, color_white())
            draw_circle_with_options(color_black(), 400.0, 300.0, 50.0, option_defaults())
            assert color_black() == get_pixel_from_window(test_window, 450.0, 300.0)
            assert color_white() == get_pixel_from_window(test_window, 400.0, 300.0)
            assert color_white() == get_pixel_from_window(test_window, 460.0, 300.0)
            
    def test_draw_circle_on_bitmap_integration():
        test_bitmap = create_bitmap("test_bitmap", 200, 200)
        with bitmap_cleanup():
            clear_bitmap(test_bitmap, color_white())
            draw_circle_on_bitmap(test_bitmap, color_black(), 100.0, 100.0, 50.0)
            assert color_black() == get_pixel_from_bitmap(test_bitmap, 150.0, 100.0)
            assert color_white() == get_pixel_from_bitmap(test_bitmap, 100.0, 100.0)
            assert color_white() == get_pixel_from_bitmap(test_bitmap, 160.0, 100.0)
            
    def test_draw_circle_on_bitmap_with_options_integration():
        test_bitmap = create_bitmap("test_bitmap", 200, 200)
        with bitmap_cleanup():
            clear_bitmap(test_bitmap, color_white())
            draw_circle_on_bitmap_with_options(test_bitmap, color_black(), 100.0, 100.0, 50.0, option_defaults())
            assert color_black() == get_pixel_from_bitmap(test_bitmap, 150.0, 100.0)
            assert color_white() == get_pixel_from_bitmap(test_bitmap, 100.0, 100.0)
            assert color_white() == get_pixel_from_bitmap(test_bitmap, 160.0, 100.0)
            
    def test_draw_circle_on_window_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
            clear_window(test_window, color_white())
            draw_circle_on_window(test_window, color_black(), 400.0, 300.0, 50.0)
            assert color_black() == get_pixel_from_window(test_window, 450.0, 300.0)
            assert color_white() == get_pixel_from_window(test_window, 400.0, 300.0)
            assert color_white() == get_pixel_from_window(test_window, 460.0, 300.0)
            
    def test_draw_circle_on_window_with_options_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
            clear_window(test_window, color_white())
            draw_circle_on_window_with_options(test_window, color_black(), 400.0, 300.0, 50.0, option_defaults())
            assert color_black() == get_pixel_from_window(test_window, 450.0, 300.0)
            assert color_black() == get_pixel_from_window(test_window, 350.0, 300.0)
            assert color_white() == get_pixel_from_window(test_window, 400.0, 400.0)
            
    def test_fill_circle_record_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
            clear_window(test_window, color_white())
            test_circle = circle_at_from_points(400.0, 300.0, 50.0)
            fill_circle_record(color_black(), test_circle)
            assert color_black() == get_pixel_from_window(test_window, 400.0, 300.0)
            assert color_black() == get_pixel_from_window(test_window, 425.0, 300.0)
            assert color_white() == get_pixel_from_window(test_window, 460.0, 300.0)
            
    def test_fill_circle_record_with_options_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
            clear_window(test_window, color_white())
            test_circle = circle_at_from_points(400.0, 300.0, 50.0)
            fill_circle_record_with_options(color_black(), test_circle, option_defaults())
            assert color_black() == get_pixel_from_window(test_window, 400.0, 300.0)
            assert color_black() == get_pixel_from_window(test_window, 425.0, 300.0)
            assert color_white() == get_pixel_from_window(test_window, 460.0, 300.0)
            
    def test_fill_circle_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
            clear_window(test_window, color_white())
            fill_circle(color_black(), 400.0, 300.0, 50.0)
            assert color_black() == get_pixel_from_window(test_window, 400.0, 300.0)
            assert color_black() == get_pixel_from_window(test_window, 425.0, 300.0)
            assert color_white() == get_pixel_from_window(test_window, 460.0, 300.0)
            
    def test_fill_circle_with_options_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
            clear_window(test_window, color_white())
            fill_circle_with_options(color_black(), 400.0, 300.0, 50.0, option_defaults())
            assert color_black() == get_pixel_from_window(test_window, 400.0, 300.0)
            assert color_black() == get_pixel_from_window(test_window, 425.0, 300.0)
            assert color_white() == get_pixel_from_window(test_window, 460.0, 300.0)
            
    def test_fill_circle_on_bitmap_integration():
        test_bitmap = create_bitmap("test_bitmap", 200, 200)
        with bitmap_cleanup():
            clear_bitmap(test_bitmap, color_white())
            fill_circle_on_bitmap(test_bitmap, color_red(), 100.0, 100.0, 50.0)
            assert color_red() == get_pixel_from_bitmap(test_bitmap, 100.0, 100.0)
            assert color_red() == get_pixel_from_bitmap(test_bitmap, 125.0, 100.0)
            assert color_white() == get_pixel_from_bitmap(test_bitmap, 160.0, 100.0)
            
    def test_fill_circle_on_bitmap_with_options_integration():
        test_bitmap = create_bitmap("test_bitmap", 200, 200)
        with bitmap_cleanup():
            clear_bitmap(test_bitmap, color_white())
            fill_circle_on_bitmap_with_options(test_bitmap, color_black(), 100.0, 100.0, 50.0, option_defaults())
            assert color_black() == get_pixel_from_bitmap(test_bitmap, 100.0, 100.0)
            assert color_black() == get_pixel_from_bitmap(test_bitmap, 125.0, 100.0)
            assert color_white() == get_pixel_from_bitmap(test_bitmap, 160.0, 100.0)
            
    def test_fill_circle_on_window_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
            clear_window(test_window, color_white())
            fill_circle_on_window(test_window, color_black(), 400.0, 300.0, 50.0)
            assert color_black() == get_pixel_from_window(test_window, 400.0, 300.0)
            assert color_black() == get_pixel_from_window(test_window, 425.0, 300.0)
            assert color_white() == get_pixel_from_window(test_window, 460.0, 300.0)
            
    def test_fill_circle_on_window_with_options_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
            clear_window(test_window, color_white())
            fill_circle_on_window_with_options(test_window, color_black(), 400.0, 300.0, 50.0, option_defaults())
            assert color_black() == get_pixel_from_window(test_window, 400.0, 300.0)
            assert color_black() == get_pixel_from_window(test_window, 425.0, 300.0)
            assert color_white() == get_pixel_from_window(test_window, 460.0, 300.0)
            
    def test_current_clip_integration():
        open_window("Test Window", 800, 600)
        with window_cleanup():
            test_clip = current_clip()
            assert 0.0 == rectangle_left(test_clip)
            assert 0.0 == rectangle_top(test_clip)
            assert 800.0 == test_clip.width
            assert 600.0 == test_clip.height
            
    def test_current_clip_for_bitmap_integration():
        test_bitmap = create_bitmap("test_bitmap", 100, 100)
        with bitmap_cleanup():
            test_rectangle = rectangle_from(10.0, 10.0, 50.0, 50.0)
            push_clip_for_bitmap(test_bitmap, test_rectangle)
            test_clip = current_clip_for_bitmap(test_bitmap)
            assert 10.0 == rectangle_left(test_clip)
            assert 10.0 == rectangle_top(test_clip)
            assert 50.0 == test_clip.width
            assert 50.0 == test_clip.height
            
    def test_current_clip_for_window_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
            test_clip = current_clip_for_window(test_window)
            assert 0.0 == rectangle_left(test_clip)
            assert 0.0 == rectangle_top(test_clip)
            assert 800.0 == test_clip.width
            assert 600.0 == test_clip.height
            
    def test_pop_clip_for_window_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
            test_rectangle = rectangle_from(0.0, 0.0, 250.0, 250.0)
            push_clip_for_window(test_window, test_rectangle)
            test_current_clip = current_clip_for_window(test_window)
            assert 0.0 == rectangle_left(test_current_clip)
            assert 0.0 == rectangle_top(test_current_clip)
            assert 250.0 == test_current_clip.width
            assert 250.0 == test_current_clip.height
            pop_clip_for_window(test_window)
            test_current_clip_after_pop = current_clip_for_window(test_window)
            assert 0.0 == rectangle_left(test_current_clip_after_pop)
            assert 0.0 == rectangle_top(test_current_clip_after_pop)
            assert 800.0 == test_current_clip_after_pop.width
            assert 600.0 == test_current_clip_after_pop.height
            
    def test_pop_clip_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
            clear_window(test_window, color_white())
            push_clip(rectangle_from(0.0, 0.0, 250.0, 250.0))
            fill_rectangle(color_red(), 0.0, 0.0, 300.0, 300.0)
            refresh_screen()
            assert color_red() == get_pixel_from_window(test_window, 125.0, 125.0)
            assert color_white() == get_pixel_from_window(test_window, 275.0, 275.0)
            pop_clip()
            fill_rectangle(color_green(), 300.0, 300.0, 100.0, 100.0)
            refresh_screen()
            assert color_red() == get_pixel_from_window(test_window, 125.0, 125.0)
            test_color = color_green()
            test_pixel = get_pixel_from_window(test_window, 350.0, 350.0)
            assert red_of(test_color) == red_of(test_pixel)
            assert green_of(test_color) == green_of(test_pixel)
            assert blue_of(test_color) == blue_of(test_pixel)
            assert alpha_of(test_color) == alpha_of(test_pixel)
            
    def test_pop_clip_for_bitmap_integration():
        test_bitmap = create_bitmap("test_bitmap", 100, 100)
        with bitmap_cleanup():
            clear_bitmap(test_bitmap, color_white())
            push_clip_for_bitmap(test_bitmap, rectangle_from(0.0, 0.0, 50.0, 50.0))
            fill_circle_with_options(color_black(), 25.0, 25.0, 20.0, option_draw_to_bitmap(test_bitmap))
            assert color_black() == get_pixel_from_bitmap(test_bitmap, 25.0, 25.0)
            assert color_white() == get_pixel_from_bitmap(test_bitmap, 75.0, 75.0)
            pop_clip_for_bitmap(test_bitmap)
            test_clip = current_clip_for_bitmap(test_bitmap)
            assert 0.0 == rectangle_left(test_clip)
            assert 0.0 == rectangle_top(test_clip)
            assert 100.0 == test_clip.width
            assert 100.0 == test_clip.height
            
    def test_push_clip_for_window_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
            test_rectangle = rectangle_from(100.0, 100.0, 200.0, 200.0)
            push_clip_for_window(test_window, test_rectangle)
            test_current_clip = current_clip_for_window(test_window)
            assert 100.0 == rectangle_left(test_current_clip)
            assert 100.0 == rectangle_top(test_current_clip)
            assert 200.0 == test_current_clip.width
            assert 200.0 == test_current_clip.height
            refresh_screen()
            
    def test_push_clip_for_bitmap_integration():
        test_bitmap = create_bitmap("test_bitmap", 200, 200)
        with bitmap_cleanup():
            test_rectangle = rectangle_from(50.0, 50.0, 100.0, 100.0)
            push_clip_for_bitmap(test_bitmap, test_rectangle)
            test_current_clip = current_clip_for_bitmap(test_bitmap)
            assert 50.0 == rectangle_left(test_current_clip)
            assert 50.0 == rectangle_top(test_current_clip)
            assert 100.0 == test_current_clip.width
            assert 100.0 == test_current_clip.height
            
    def test_push_clip_integration():
        open_window("Test Window", 800, 600)
        with window_cleanup():
            test_rectangle = rectangle_from(100.0, 100.0, 200.0, 200.0)
            push_clip(test_rectangle)
            test_current_clip = current_clip()
            assert 100.0 == rectangle_left(test_current_clip)
            assert 100.0 == rectangle_top(test_current_clip)
            assert 200.0 == test_current_clip.width
            assert 200.0 == test_current_clip.height
            
    def test_reset_clip_for_bitmap_integration():
        test_bitmap = create_bitmap("test_bitmap", 100, 100)
        with bitmap_cleanup():
            push_clip_for_bitmap(test_bitmap, rectangle_from(10.0, 10.0, 50.0, 50.0))
            reset_clip_for_bitmap(test_bitmap)
            test_clip = current_clip_for_bitmap(test_bitmap)
            assert 0.0 == rectangle_left(test_clip)
            assert 0.0 == rectangle_top(test_clip)
            assert 100.0 == test_clip.width
            assert 100.0 == test_clip.height
            
    def test_reset_clip_integration():
        open_window("Test Window", 800, 600)
        with window_cleanup():
            push_clip(rectangle_from(100.0, 100.0, 200.0, 200.0))
            reset_clip()
            test_clip = current_clip()
            assert 0.0 == rectangle_left(test_clip)
            assert 0.0 == rectangle_top(test_clip)
            assert 800.0 == test_clip.width
            assert 600.0 == test_clip.height
            
    def test_reset_clip_for_window_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
            push_clip_for_window(test_window, rectangle_from(100.0, 100.0, 200.0, 200.0))
            reset_clip_for_window(test_window)
            test_clip = current_clip_for_window(test_window)
            assert 0.0 == rectangle_left(test_clip)
            assert 0.0 == rectangle_top(test_clip)
            assert 800.0 == test_clip.width
            assert 600.0 == test_clip.height
            
    def test_set_clip_integration():
        open_window("Test Window", 800, 600)
        with window_cleanup():
            test_rectangle = rectangle_from(100.0, 100.0, 200.0, 200.0)
            set_clip(test_rectangle)
            test_current_clip = current_clip()
            assert 100.0 == rectangle_left(test_current_clip)
            assert 100.0 == rectangle_top(test_current_clip)
            assert 200.0 == test_current_clip.width
            assert 200.0 == test_current_clip.height
            
    def test_set_clip_for_bitmap_integration():
        test_bitmap = create_bitmap("test_bitmap", 200, 200)
        with bitmap_cleanup():
            test_rectangle = rectangle_from(50.0, 50.0, 100.0, 100.0)
            set_clip_for_bitmap(test_bitmap, test_rectangle)
            test_current_clip = current_clip_for_bitmap(test_bitmap)
            assert 50.0 == rectangle_left(test_current_clip)
            assert 50.0 == rectangle_top(test_current_clip)
            assert 100.0 == test_current_clip.width
            assert 100.0 == test_current_clip.height
            
    def test_set_clip_for_window_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
            test_rectangle = rectangle_from(100.0, 100.0, 200.0, 200.0)
            set_clip_for_window(test_window, test_rectangle)
            test_current_clip = current_clip_for_window(test_window)
            assert 100.0 == rectangle_left(test_current_clip)
            assert 100.0 == rectangle_top(test_current_clip)
            assert 200.0 == test_current_clip.width
            assert 200.0 == test_current_clip.height
            
    def test_option_defaults_integration():
        test_options = option_defaults()
        assert test_options is not None
        
    def test_option_draw_to_bitmap_integration():
        test_bitmap = create_bitmap("test_bitmap", 100, 100)
        with bitmap_cleanup():
            clear_bitmap(test_bitmap, color_white())
            test_options = option_draw_to_bitmap(test_bitmap)
            draw_circle_record_with_options(color_black(), circle_at_from_points(50.0, 50.0, 25.0), test_options)
            assert color_black() == get_pixel_from_bitmap(test_bitmap, 75.0, 50.0)
            assert color_white() == get_pixel_from_bitmap(test_bitmap, 90.0, 90.0)
            
    def test_option_draw_to_bitmap_with_options_integration():
        test_bitmap = create_bitmap("test_bitmap", 100, 100)
        with bitmap_cleanup():
            clear_bitmap(test_bitmap, color_white())
            test_options = option_defaults()
            test_drawing_options = option_draw_to_bitmap_with_options(test_bitmap, test_options)
            draw_circle_record_with_options(color_black(), circle_at_from_points(50.0, 50.0, 25.0), test_drawing_options)
            assert color_black() == get_pixel_from_bitmap(test_bitmap, 75.0, 50.0)
            assert color_white() == get_pixel_from_bitmap(test_bitmap, 90.0, 90.0)
            
    def test_option_draw_to_window_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
            clear_window(test_window, color_white())
            draw_circle_record_with_options(color_black(), circle_at_from_points(400.0, 300.0, 50.0), option_draw_to_window(test_window))
            refresh_screen()
            assert color_black() == get_pixel_from_window(test_window, 450.0, 300.0)
            assert color_white() == get_pixel_from_window(test_window, 460.0, 300.0)
            
    def test_option_draw_to_window_with_options_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
            clear_window(test_window, color_white())
            test_options = option_defaults()
            draw_circle_record_with_options(color_black(), circle_at_from_points(400.0, 300.0, 50.0), option_draw_to_window_with_options(test_window, test_options))
            refresh_screen()
            assert color_black() == get_pixel_from_window(test_window, 450.0, 300.0)
            assert color_white() == get_pixel_from_window(test_window, 460.0, 300.0)
            
    def test_option_flip_x_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
            clear_window(test_window, color_white())
            test_bitmap = create_bitmap("test_bitmap", 100, 100)
            with bitmap_cleanup():
                clear_bitmap(test_bitmap, color_white())
                fill_rectangle_on_bitmap(test_bitmap, color_black(), 0.0, 0.0, 50.0, 100.0)
                draw_bitmap_with_options(test_bitmap, 100.0, 100.0, option_flip_x())
                refresh_screen()
                assert color_black() == get_pixel_from_window(test_window, 125.0, 100.0)
                assert color_white() == get_pixel_from_window(test_window, 75.0, 100.0)
                free_bitmap(test_bitmap)
                
    def test_option_flip_x_with_options_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
            clear_window(test_window, color_white())
            test_bitmap = create_bitmap("test_bitmap", 100, 100)
            with bitmap_cleanup():
                clear_bitmap(test_bitmap, color_white())
                fill_rectangle_on_bitmap(test_bitmap, color_black(), 0.0, 0.0, 50.0, 100.0)
                draw_bitmap_with_options(test_bitmap, 400.0, 300.0, option_flip_x_with_options(option_defaults()))
                refresh_screen()
                assert color_black() == get_pixel_from_window(test_window, 425.0, 300.0)
                assert color_white() == get_pixel_from_window(test_window, 375.0, 300.0)
                free_bitmap(test_bitmap)
                
    def test_option_flip_xy_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
            clear_window(test_window, color_white())
            test_bitmap = create_bitmap("test_bitmap", 100, 100)
            with bitmap_cleanup():
                clear_bitmap(test_bitmap, color_white())
                fill_rectangle_on_bitmap(test_bitmap, color_black(), 0.0, 0.0, 50.0, 50.0)
                draw_bitmap_with_options(test_bitmap, 400.0, 300.0, option_flip_xy())
                refresh_screen()
                assert color_black() == get_pixel_from_window(test_window, 450.0, 350.0)
                assert color_white() == get_pixel_from_window(test_window, 450.0, 250.0)
                free_bitmap(test_bitmap)
                
    def test_option_flip_xy_with_options_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
            clear_window(test_window, color_white())
            test_bitmap = create_bitmap("test_bitmap", 100, 100)
            with bitmap_cleanup():
                clear_bitmap(test_bitmap, color_white())
                fill_rectangle_on_bitmap(test_bitmap, color_black(), 0.0, 0.0, 50.0, 50.0)
                draw_bitmap_with_options(test_bitmap, 400.0, 300.0, option_flip_xy_with_options(option_defaults()))
                refresh_screen()
                assert color_black() == get_pixel_from_window(test_window, 450.0, 350.0)
                assert color_white() == get_pixel_from_window(test_window, 450.0, 250.0)
                free_bitmap(test_bitmap)
                
    def test_option_flip_y_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
            clear_window(test_window, color_white())
            test_bitmap = create_bitmap("test_bitmap", 100, 100)
            with bitmap_cleanup():
                clear_bitmap(test_bitmap, color_white())
                fill_rectangle_on_bitmap(test_bitmap, color_black(), 0.0, 0.0, 100.0, 50.0)
                draw_bitmap_with_options(test_bitmap, 400.0, 300.0, option_flip_y())
                refresh_screen()
                assert color_black() == get_pixel_from_window(test_window, 400.0, 325.0)
                assert color_white() == get_pixel_from_window(test_window, 400.0, 275.0)
                free_bitmap(test_bitmap)
                
    def test_option_flip_y_with_options_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
            clear_window(test_window, color_white())
            test_bitmap = create_bitmap("test_bitmap", 100, 100)
            with bitmap_cleanup():
                clear_bitmap(test_bitmap, color_white())
                fill_rectangle_on_bitmap(test_bitmap, color_black(), 0.0, 0.0, 100.0, 50.0)
                draw_bitmap_with_options(test_bitmap, 400.0, 300.0, option_flip_y_with_options(option_defaults()))
                refresh_screen()
                assert color_black() == get_pixel_from_window(test_window, 400.0, 325.0)
                assert color_white() == get_pixel_from_window(test_window, 400.0, 275.0)
                free_bitmap(test_bitmap)
                
    def test_option_line_width_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
            clear_window(test_window, color_white())
            draw_line_with_options(color_black(), 100.0, 100.0, 200.0, 200.0, option_line_width(5))
            refresh_screen()
            assert color_black() == get_pixel_from_window(test_window, 150.0, 150.0)
            assert color_white() == get_pixel_from_window(test_window, 140.0, 150.0)
            
    def test_option_line_width_with_options_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
            clear_window(test_window, color_white())
            draw_line_with_options(color_black(), 100.0, 100.0, 200.0, 200.0, option_line_width_with_options(5, option_defaults()))
            refresh_screen()
            assert color_black() == get_pixel_from_window(test_window, 150.0, 150.0)
            assert color_white() == get_pixel_from_window(test_window, 145.0, 150.0)
            
    def test_option_part_bmp_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
            clear_window(test_window, color_white())
            test_bitmap = create_bitmap("test_bitmap", 100, 100)
            with bitmap_cleanup():
                clear_bitmap(test_bitmap, color_black())
                draw_bitmap_with_options(test_bitmap, 100.0, 100.0, option_part_bmp(0.0, 0.0, 50.0, 50.0))
                refresh_screen()
                assert color_black() == get_pixel_from_window(test_window, 125.0, 125.0)
                assert color_white() == get_pixel_from_window(test_window, 175.0, 175.0)
                free_bitmap(test_bitmap)
                
    def test_option_part_bmp_with_options_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
            clear_window(test_window, color_white())
            test_bitmap = create_bitmap("test_bitmap", 100, 100)
            with bitmap_cleanup():
                clear_bitmap(test_bitmap, color_black())
                draw_bitmap_with_options(test_bitmap, 100.0, 100.0, option_part_bmp_with_options(0.0, 0.0, 50.0, 50.0, option_defaults()))
                refresh_screen()
                assert color_black() == get_pixel_from_window(test_window, 125.0, 125.0)
                assert color_white() == get_pixel_from_window(test_window, 175.0, 175.0)
                free_bitmap(test_bitmap)
                
    def test_option_part_bmp_from_rectangle_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
            clear_window(test_window, color_white())
            test_bitmap = create_bitmap("test_bitmap", 100, 100)
            with bitmap_cleanup():
                clear_bitmap(test_bitmap, color_black())
                draw_bitmap_with_options(test_bitmap, 0.0, 0.0, option_part_bmp_from_rectangle(rectangle_from(0.0, 0.0, 50.0, 50.0)))
                refresh_screen()
                assert color_black() == get_pixel_from_window(test_window, 25.0, 25.0)
                assert color_white() == get_pixel_from_window(test_window, 75.0, 75.0)
                free_bitmap(test_bitmap)
                
    def test_option_part_bmp_from_rectangle_with_options_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
            clear_window(test_window, color_white())
            test_bitmap = create_bitmap("test_bitmap", 100, 100)
            with bitmap_cleanup():
                clear_bitmap(test_bitmap, color_black())
                draw_bitmap_with_options(test_bitmap, 0.0, 0.0, option_part_bmp_from_rectangle_with_options(rectangle_from(0.0, 0.0, 50.0, 50.0), option_defaults()))
                refresh_screen()
                assert color_black() == get_pixel_from_window(test_window, 25.0, 25.0)
                assert color_white() == get_pixel_from_window(test_window, 75.0, 75.0)
                free_bitmap(test_bitmap)
                
    def test_option_rotate_bmp_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
            clear_window(test_window, color_white())
            test_bitmap = create_bitmap("test_bitmap", 100, 100)
            with bitmap_cleanup():
                clear_bitmap(test_bitmap, color_white())
                fill_rectangle_on_bitmap(test_bitmap, color_black(), 0.0, 0.0, 50.0, 100.0)
                draw_bitmap_with_options(test_bitmap, 400.0, 300.0, option_rotate_bmp(90.0))
                refresh_screen()
                assert color_black() == get_pixel_from_window(test_window, 400.0, 300.0)
                assert color_white() == get_pixel_from_window(test_window, 400.0, 350.0)
                free_bitmap(test_bitmap)
                
    def test_option_rotate_bmp_with_anchor_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
            clear_window(test_window, color_white())
            test_bitmap = create_bitmap("test_bitmap", 100, 100)
            with bitmap_cleanup():
                clear_bitmap(test_bitmap, color_white())
                fill_rectangle_on_bitmap(test_bitmap, color_black(), 0.0, 0.0, 50.0, 100.0)
                draw_bitmap_with_options(test_bitmap, 400.0, 300.0, option_rotate_bmp_with_anchor(90.0, 50.0, 50.0))
                refresh_screen()
                assert color_black() == get_pixel_from_window(test_window, 500.0, 300.0)
                assert color_white() == get_pixel_from_window(test_window, 450.0, 300.0)
                free_bitmap(test_bitmap)
                
    def test_option_rotate_bmp_with_anchor_and_options_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
            clear_window(test_window, color_white())
            test_bitmap = create_bitmap("test_bitmap", 100, 100)
            with bitmap_cleanup():
                clear_bitmap(test_bitmap, color_white())
                fill_rectangle_on_bitmap(test_bitmap, color_black(), 0.0, 0.0, 50.0, 100.0)
                draw_bitmap_with_options(test_bitmap, 400.0, 300.0, option_rotate_bmp_with_anchor_and_options(90.0, 50.0, 50.0, option_defaults()))
                refresh_screen()
                assert color_black() == get_pixel_from_window(test_window, 500.0, 300.0)
                assert color_white() == get_pixel_from_window(test_window, 400.0, 300.0)
                free_bitmap(test_bitmap)
                
    def test_option_rotate_bmp_with_options_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
            clear_window(test_window, color_white())
            test_bitmap = create_bitmap("test_bitmap", 100, 100)
            with bitmap_cleanup():
                clear_bitmap(test_bitmap, color_white())
                fill_rectangle_on_bitmap(test_bitmap, color_black(), 0.0, 0.0, 50.0, 100.0)
                draw_bitmap_with_options(test_bitmap, 400.0, 300.0, option_rotate_bmp_with_options(90.0, option_defaults()))
                refresh_screen()
                assert color_black() == get_pixel_from_window(test_window, 400.0, 300.0)
                assert color_white() == get_pixel_from_window(test_window, 400.0, 350.0)
                free_bitmap(test_bitmap)
                
    def test_option_scale_bmp_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
            clear_window(test_window, color_white())
            test_bitmap = create_bitmap("test_bitmap", 50, 50)
            with bitmap_cleanup():
                clear_bitmap(test_bitmap, color_black())
                draw_bitmap_with_options(test_bitmap, 400.0, 300.0, option_scale_bmp(2.0, 2.0))
                refresh_screen()
                assert color_black() == get_pixel_from_window(test_window, 451.0, 300.0)
                assert color_white() == get_pixel_from_window(test_window, 500.0, 300.0)
                free_bitmap(test_bitmap)
                
    def test_option_scale_bmp_with_options_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
            clear_window(test_window, color_white())
            test_bitmap = create_bitmap("test_bitmap", 50, 50)
            with bitmap_cleanup():
                clear_bitmap(test_bitmap, color_black())
                draw_bitmap_with_options(test_bitmap, 400.0, 300.0, option_scale_bmp_with_options(2.0, 2.0, option_defaults()))
                refresh_screen()
                assert color_black() == get_pixel_from_window(test_window, 451.0, 300.0)
                assert color_white() == get_pixel_from_window(test_window, 500.0, 300.0)
                free_bitmap(test_bitmap)
                
    def test_option_to_screen_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
            clear_window(test_window, color_white())
            draw_circle_record_with_options(color_black(), circle_at_from_points(400.0, 300.0, 50.0), option_to_screen())
            refresh_screen()
            assert color_black() == get_pixel_from_window(test_window, 450.0, 300.0)
            assert color_white() == get_pixel_from_window(test_window, 451.0, 300.0)
            
    def test_option_to_screen_with_options_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
            clear_window(test_window, color_white())
            draw_circle_record_with_options(color_black(), circle_at_from_points(400.0, 300.0, 50.0), option_to_screen_with_options(option_defaults()))
            refresh_screen()
            assert color_black() == get_pixel_from_window(test_window, 400.0, 250.0)
            assert color_white() == get_pixel_from_window(test_window, 400.0, 300.0)
            
    def test_option_to_world_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
            clear_window(test_window, color_white())
            move_camera_to(100.0, 100.0)
            draw_circle_record_with_options(color_black(), circle_at_from_points(400.0, 300.0, 50.0), option_to_world())
            refresh_screen()
            assert color_black() == get_pixel_from_window(test_window, 350.0, 200.0)
            assert color_white() == get_pixel_from_window(test_window, 375.0, 200.0)
            
    def test_option_to_world_with_options_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
            clear_window(test_window, color_white())
            move_camera_to(100.0, 100.0)
            draw_circle_record_with_options(color_black(), circle_at_from_points(400.0, 300.0, 50.0), option_to_world_with_options(option_defaults()))
            refresh_screen()
            assert color_black() == get_pixel_from_window(test_window, 350.0, 200.0)
            assert color_white() == get_pixel_from_window(test_window, 375.0, 200.0)
            
    def test_option_with_animation_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
            kermit_script = load_animation_script("kermit", "kermit.txt")
            with animation_script_cleanup():
                test_animation = create_animation(kermit_script, "moonwalkback")
                with animation_cleanup(test_animation):
                    test_bitmap = load_bitmap("frog", "frog.png")
                    with bitmap_cleanup():
                        bitmap_set_cell_details(test_bitmap, 73, 105, 4, 4, 16)
        while window_close_requested(test_window) is False:
            clear_screen_to_white()
            draw_bitmap_with_options(test_bitmap, 100.0, 100.0, option_with_animation(test_animation))
            draw_text_no_font_no_size("Test: option_with_animation. Should be moving. Close when done.", color_black(), 10.0, 10.0)
            update_animation(test_animation)
            delay(100)
            refresh_screen()
            
            
    def test_option_with_animation_with_options_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
            kermit_script = load_animation_script("kermit", "kermit.txt")
            with animation_script_cleanup():
                test_animation = create_animation(kermit_script, "moonwalkback")
                with animation_cleanup(test_animation):
                    test_bitmap = load_bitmap("frog", "frog.png")
                    with bitmap_cleanup():
                        bitmap_set_cell_details(test_bitmap, 73, 105, 4, 4, 16)
        while window_close_requested(test_window) is False:
            clear_screen_to_white()
            draw_bitmap_with_options(test_bitmap, 100.0, 100.0, option_with_animation_with_options(test_animation, option_defaults()))
            draw_text_no_font_no_size("Test: option_with_animation_with_options. Should be moving. Close when done.", color_black(), 10.0, 10.0)
            update_animation(test_animation)
            delay(100)
            refresh_screen()
            
            
    def test_option_with_bitmap_cell_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
            clear_window(test_window, color_white())
            test_bitmap = create_bitmap("test_bitmap", 64, 64)
            with bitmap_cleanup():
                clear_bitmap(test_bitmap, color_black())
                bitmap_set_cell_details(test_bitmap, 32, 32, 2, 2, 4)
                draw_bitmap_with_options(test_bitmap, 100.0, 100.0, option_with_bitmap_cell(1))
                refresh_screen()
                assert color_black() == get_pixel_from_window(test_window, 116.0, 116.0)
                assert color_white() == get_pixel_from_window(test_window, 84.0, 84.0)
                free_bitmap(test_bitmap)
                
    def test_option_with_bitmap_cell_with_options_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
            clear_window(test_window, color_white())
            test_bitmap = create_bitmap("test_bitmap", 64, 64)
            with bitmap_cleanup():
                clear_bitmap(test_bitmap, color_black())
                bitmap_set_cell_details(test_bitmap, 32, 32, 2, 2, 4)
                draw_bitmap_with_options(test_bitmap, 100.0, 100.0, option_with_bitmap_cell_with_options(1, option_defaults()))
                refresh_screen()
                assert color_black() == get_pixel_from_window(test_window, 116.0, 116.0)
                assert color_white() == get_pixel_from_window(test_window, 84.0, 84.0)
                free_bitmap(test_bitmap)
                
    def test_draw_ellipse_within_rectangle_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
            clear_window(test_window, color_white())
            draw_ellipse_within_rectangle(color_black(), rectangle_from(100.0, 100.0, 200.0, 150.0))
            refresh_screen()
            assert color_black() == get_pixel_from_window(test_window, 300.0, 175.0)
            assert color_white() == get_pixel_from_window(test_window, 200.0, 175.0)
            assert color_white() == get_pixel_from_window(test_window, 350.0, 175.0)
            
    def test_draw_ellipse_within_rectangle_with_options_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
            clear_window(test_window, color_white())
            draw_ellipse_within_rectangle_with_options(color_black(), rectangle_from(100.0, 100.0, 200.0, 100.0), option_defaults())
            refresh_screen()
            assert color_black() == get_pixel_from_window(test_window, 300.0, 150.0)
            assert color_white() == get_pixel_from_window(test_window, 200.0, 150.0)
            assert color_white() == get_pixel_from_window(test_window, 350.0, 150.0)
            
    def test_draw_ellipse_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
            clear_window(test_window, color_white())
            draw_ellipse(color_black(), 400.0, 300.0, 100.0, 50.0)
            refresh_screen()
            assert color_black() == get_pixel_from_window(test_window, 450.0, 300.0)
            assert color_white() == get_pixel_from_window(test_window, 400.0, 300.0)
            assert color_white() == get_pixel_from_window(test_window, 500.0, 300.0)
            
    def test_draw_ellipse_with_options_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
            clear_window(test_window, color_white())
            draw_ellipse_with_options(color_black(), 400.0, 300.0, 100.0, 50.0, option_defaults())
            refresh_screen()
            assert color_black() == get_pixel_from_window(test_window, 450.0, 300.0)
            assert color_white() == get_pixel_from_window(test_window, 400.0, 300.0)
            assert color_white() == get_pixel_from_window(test_window, 500.0, 300.0)
            
    def test_draw_ellipse_on_bitmap_within_rectangle_integration():
        test_bitmap = create_bitmap("test_bitmap", 200, 200)
        with bitmap_cleanup():
            clear_bitmap(test_bitmap, color_white())
            rect = rectangle_from(50.0, 50.0, 100.0, 100.0)
            draw_ellipse_on_bitmap_within_rectangle(test_bitmap, color_black(), rect)
            assert color_black() == get_pixel_from_bitmap(test_bitmap, 150.0, 100.0)
            assert color_white() == get_pixel_from_bitmap(test_bitmap, 125.0, 100.0)
            assert color_white() == get_pixel_from_bitmap(test_bitmap, 175.0, 100.0)
            
    def test_draw_ellipse_on_bitmap_within_rectangle_with_options_integration():
        test_bitmap = create_bitmap("test_bitmap", 200, 200)
        with bitmap_cleanup():
            clear_bitmap(test_bitmap, color_white())
            draw_ellipse_on_bitmap_within_rectangle_with_options(test_bitmap, color_black(), rectangle_from(50.0, 50.0, 100.0, 100.0), option_defaults())
            assert color_black() == get_pixel_from_bitmap(test_bitmap, 150.0, 100.0)
            assert color_white() == get_pixel_from_bitmap(test_bitmap, 125.0, 100.0)
            assert color_white() == get_pixel_from_bitmap(test_bitmap, 175.0, 100.0)
            
    def test_draw_ellipse_on_bitmap_integration():
        test_bitmap = create_bitmap("test_bitmap", 200, 200)
        with bitmap_cleanup():
            clear_bitmap(test_bitmap, color_white())
            draw_ellipse_on_bitmap(test_bitmap, color_black(), 100.0, 100.0, 50.0, 30.0)
            assert color_black() == get_pixel_from_bitmap(test_bitmap, 125.0, 100.0)
            assert color_white() == get_pixel_from_bitmap(test_bitmap, 100.0, 100.0)
            assert color_white() == get_pixel_from_bitmap(test_bitmap, 160.0, 100.0)
            
    def test_draw_ellipse_on_bitmap_with_options_integration():
        test_bitmap = create_bitmap("test_bitmap", 200, 200)
        with bitmap_cleanup():
            clear_bitmap(test_bitmap, color_white())
            draw_ellipse_on_bitmap_with_options(test_bitmap, color_black(), 100.0, 100.0, 50.0, 30.0, option_defaults())
            assert color_black() == get_pixel_from_bitmap(test_bitmap, 125.0, 100.0)
            assert color_white() == get_pixel_from_bitmap(test_bitmap, 100.0, 100.0)
            assert color_white() == get_pixel_from_bitmap(test_bitmap, 160.0, 100.0)
            
    def test_draw_ellipse_on_window_within_rectangle_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
            clear_window(test_window, color_white())
            rect = rectangle_from(100.0, 100.0, 200.0, 100.0)
            draw_ellipse_on_window_within_rectangle(test_window, color_black(), rect)
            refresh_screen()
            assert color_black() == get_pixel_from_window(test_window, 300.0, 150.0)
            assert color_white() == get_pixel_from_window(test_window, 250.0, 150.0)
            assert color_white() == get_pixel_from_window(test_window, 350.0, 150.0)
            
    def test_draw_ellipse_on_window_within_rectangle_with_options_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
            clear_window(test_window, color_white())
            rect = rectangle_from(100.0, 100.0, 200.0, 100.0)
            draw_ellipse_on_window_within_rectangle_with_options(test_window, color_black(), rect, option_defaults())
            refresh_screen()
            assert color_black() == get_pixel_from_window(test_window, 300.0, 150.0)
            assert color_white() == get_pixel_from_window(test_window, 250.0, 150.0)
            assert color_white() == get_pixel_from_window(test_window, 350.0, 150.0)
            
    def test_draw_ellipse_on_window_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
            clear_window(test_window, color_white())
            draw_ellipse_on_window(test_window, color_black(), 400.0, 300.0, 100.0, 50.0)
            refresh_screen()
            assert color_black() == get_pixel_from_window(test_window, 450.0, 300.0)
            assert color_white() == get_pixel_from_window(test_window, 400.0, 300.0)
            assert color_white() == get_pixel_from_window(test_window, 500.0, 300.0)
            
    def test_draw_ellipse_on_window_with_options_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
            clear_window(test_window, color_white())
            draw_ellipse_on_window_with_options(test_window, color_black(), 400.0, 300.0, 100.0, 50.0, option_defaults())
            refresh_screen()
            assert color_black() == get_pixel_from_window(test_window, 450.0, 300.0)
            assert color_white() == get_pixel_from_window(test_window, 450.0, 325.0)
            assert color_white() == get_pixel_from_window(test_window, 500.0, 300.0)
            
    def test_fill_ellipse_within_rectangle_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
            clear_window(test_window, color_white())
            fill_ellipse_within_rectangle(color_black(), rectangle_from(100.0, 100.0, 200.0, 100.0))
            refresh_screen()
            assert color_black() == get_pixel_from_window(test_window, 200.0, 100.0)
            assert color_black() == get_pixel_from_window(test_window, 150.0, 150.0)
            assert color_white() == get_pixel_from_window(test_window, 50.0, 50.0)
            
    def test_fill_ellipse_within_rectangle_with_options_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
            clear_window(test_window, color_white())
            fill_ellipse_within_rectangle_with_options(color_black(), rectangle_from(100.0, 100.0, 200.0, 100.0), option_defaults())
            refresh_screen()
            assert color_black() == get_pixel_from_window(test_window, 200.0, 100.0)
            assert color_black() == get_pixel_from_window(test_window, 150.0, 150.0)
            assert color_white() == get_pixel_from_window(test_window, 50.0, 50.0)
            
    def test_fill_ellipse_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
            clear_window(test_window, color_white())
            fill_ellipse(color_black(), 400.0, 300.0, 100.0, 50.0)
            refresh_screen()
            assert color_black() == get_pixel_from_window(test_window, 450.0, 300.0)
            assert color_black() == get_pixel_from_window(test_window, 450.0, 325.0)
            assert color_white() == get_pixel_from_window(test_window, 500.0, 300.0)
            
    def test_fill_ellipse_with_options_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
            clear_window(test_window, color_white())
            fill_ellipse_with_options(color_black(), 400.0, 300.0, 100.0, 50.0, option_defaults())
            refresh_screen()
            assert color_black() == get_pixel_from_window(test_window, 450.0, 300.0)
            assert color_black() == get_pixel_from_window(test_window, 450.0, 325.0)
            assert color_white() == get_pixel_from_window(test_window, 300.0, 300.0)
            
    def test_fill_ellipse_on_bitmap_within_rectangle_integration():
        test_bitmap = create_bitmap("test_bitmap", 200, 200)
        with bitmap_cleanup():
            clear_bitmap(test_bitmap, color_white())
            fill_ellipse_on_bitmap_within_rectangle(test_bitmap, color_black(), rectangle_from(50.0, 50.0, 100.0, 100.0))
            assert color_black() == get_pixel_from_bitmap(test_bitmap, 100.0, 100.0)
            assert color_black() == get_pixel_from_bitmap(test_bitmap, 75.0, 75.0)
            assert color_white() == get_pixel_from_bitmap(test_bitmap, 175.0, 175.0)
            
    def test_fill_ellipse_on_bitmap_within_rectangle_with_options_integration():
        test_bitmap = create_bitmap("test_bitmap", 200, 200)
        with bitmap_cleanup():
            clear_bitmap(test_bitmap, color_white())
            fill_ellipse_on_bitmap_within_rectangle_with_options(test_bitmap, color_black(), rectangle_from(50.0, 50.0, 100.0, 100.0), option_defaults())
            assert color_black() == get_pixel_from_bitmap(test_bitmap, 100.0, 100.0)
            assert color_black() == get_pixel_from_bitmap(test_bitmap, 75.0, 75.0)
            assert color_white() == get_pixel_from_bitmap(test_bitmap, 175.0, 175.0)
            
    def test_fill_ellipse_on_bitmap_integration():
        test_bitmap = create_bitmap("test_bitmap", 200, 200)
        with bitmap_cleanup():
            clear_bitmap(test_bitmap, color_white())
            fill_ellipse_on_bitmap(test_bitmap, color_black(), 100.0, 100.0, 50.0, 30.0)
            assert color_black() == get_pixel_from_bitmap(test_bitmap, 125.0, 100.0)
            assert color_black() == get_pixel_from_bitmap(test_bitmap, 125.0, 125.0)
            assert color_white() == get_pixel_from_bitmap(test_bitmap, 150.0, 100.0)
            
    def test_fill_ellipse_on_bitmap_with_options_integration():
        test_bitmap = create_bitmap("test_bitmap", 200, 200)
        with bitmap_cleanup():
            clear_bitmap(test_bitmap, color_white())
            fill_ellipse_on_bitmap_with_options(test_bitmap, color_black(), 50.0, 50.0, 100.0, 50.0, option_defaults())
            assert color_black() == get_pixel_from_bitmap(test_bitmap, 100.0, 50.0)
            assert color_black() == get_pixel_from_bitmap(test_bitmap, 100.0, 75.0)
            assert color_white() == get_pixel_from_bitmap(test_bitmap, 150.0, 50.0)
            
    def test_fill_ellipse_on_window_within_rectangle_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
            clear_window(test_window, color_white())
            fill_ellipse_on_window_within_rectangle(test_window, color_black(), rectangle_from(100.0, 100.0, 200.0, 150.0))
            refresh_screen()
            assert color_black() == get_pixel_from_window(test_window, 200.0, 175.0)
            assert color_black() == get_pixel_from_window(test_window, 150.0, 175.0)
            assert color_white() == get_pixel_from_window(test_window, 350.0, 175.0)
            
    def test_fill_ellipse_on_window_within_rectangle_with_options_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
            clear_window(test_window, color_white())
            fill_ellipse_on_window_within_rectangle_with_options(test_window, color_black(), rectangle_from(100.0, 100.0, 200.0, 150.0), option_defaults())
            refresh_screen()
            assert color_black() == get_pixel_from_window(test_window, 200.0, 175.0)
            assert color_black() == get_pixel_from_window(test_window, 150.0, 175.0)
            assert color_white() == get_pixel_from_window(test_window, 350.0, 175.0)
            
    def test_fill_ellipse_on_window_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
            clear_window(test_window, color_white())
            fill_ellipse_on_window(test_window, color_black(), 400.0, 300.0, 100.0, 50.0)
            refresh_screen()
            assert color_black() == get_pixel_from_window(test_window, 450.0, 300.0)
            assert color_black() == get_pixel_from_window(test_window, 450.0, 325.0)
            assert color_white() == get_pixel_from_window(test_window, 500.0, 300.0)
            
    def test_fill_ellipse_on_window_with_options_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
            clear_window(test_window, color_white())
            fill_ellipse_on_window_with_options(test_window, color_black(), 400.0, 300.0, 100.0, 50.0, option_defaults())
            refresh_screen()
            assert color_black() == get_pixel_from_window(test_window, 450.0, 300.0)
            assert color_black() == get_pixel_from_window(test_window, 450.0, 325.0)
            assert color_white() == get_pixel_from_window(test_window, 500.0, 300.0)
            
    def test_clear_screen_to_white_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
            draw_pixel(color_black(), 100.0, 100.0)
            refresh_screen()
            assert color_black() == get_pixel_from_window(test_window, 100.0, 100.0)
            clear_screen_to_white()
            refresh_screen()
            assert color_white() == get_pixel_from_window(test_window, 100.0, 100.0)
            
    def test_clear_screen_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
            draw_pixel(color_black(), 100.0, 100.0)
            refresh_screen()
            assert color_black() == get_pixel_from_window(test_window, 100.0, 100.0)
            clear_screen(color_white())
            refresh_screen()
            assert color_white() == get_pixel_from_window(test_window, 100.0, 100.0)
            
    def test_display_details_integration():
        displays = number_of_displays()
        assert displays > 0
        display = display_details(0)
        assert display is not None
        assert display_width(display) > 0
        assert display_height(display) > 0
        assert len(display_name(display)) > 0
        
    def test_display_height_integration():
        display = display_details(0)
        assert display_height(display) > 0
        
    def test_display_name_integration():
        display = display_details(0)
        assert len(display_name(display)) > 0
        assert len(display_name(display)) > 0
        
    def test_display_width_integration():
        display = display_details(0)
        assert display_width(display) > 0
        
    def test_display_x_integration():
        display = display_details(0)
        assert 0 == display_x(display)
        
    def test_display_y_integration():
        display = display_details(0)
        assert 0 == display_y(display)
        
    def test_number_of_displays_integration():
        assert number_of_displays() > 0
        
    def test_refresh_screen_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
            clear_window(test_window, color_white())
            draw_circle_record(color_black(), circle_at_from_points(400.0, 300.0, 50.0))
            refresh_screen()
            
    def test_refresh_screen_with_target_fps_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
            clear_window(test_window, color_white())
            draw_circle_record(color_black(), circle_at_from_points(400.0, 300.0, 50.0))
            refresh_screen_with_target_fps(60)
            
    def test_save_bitmap_integration():
        test_bitmap = create_bitmap("test_bitmap", 100, 100)
        with bitmap_cleanup():
            clear_bitmap(test_bitmap, color_white())
            draw_pixel_on_bitmap(test_bitmap, color_black(), 50.0, 50.0)
            save_bitmap(test_bitmap, "test_bitmap")
            
    def test_screen_height_integration():
        open_window("Test Window", 800, 600)
        with window_cleanup():
            assert 600 == screen_height()
            
    def test_screen_width_integration():
        open_window("Test Window", 800, 600)
        with window_cleanup():
            assert 800 == screen_width()
            
    def test_take_screenshot_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
            clear_window(test_window, color_white())
            draw_circle_record(color_black(), circle_at_from_points(400.0, 300.0, 50.0))
            refresh_screen()
            take_screenshot("test_screenshot")
            
    def test_take_screenshot_of_window_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
            clear_window(test_window, color_white())
            draw_circle_record(color_black(), circle_at_from_points(400.0, 300.0, 50.0))
            refresh_screen()
            take_screenshot_of_window(test_window, "test_screenshot")
            
    def test_bitmap_bounding_circle_integration():
        test_bitmap = create_bitmap("test_bitmap", 100, 100)
        with bitmap_cleanup():
            test_point = point_at(50.0, 50.0)
            bounding_circle = bitmap_bounding_circle(test_bitmap, test_point)
            assert test_point == center_point_of_circle(bounding_circle)
            assert 100.0 == circle_radius(bounding_circle)
            
    def test_bitmap_bounding_rectangle_integration():
        test_bitmap = create_bitmap("test_bitmap", 100, 100)
        with bitmap_cleanup():
            bounding_rect = bitmap_bounding_rectangle(test_bitmap)
            assert 0.0 == bounding_rect.x
            assert 0.0 == bounding_rect.y
            assert 100.0 == bounding_rect.width
            assert 100.0 == bounding_rect.height
            
    def test_bitmap_bounding_rectangle_at_location_integration():
        test_bitmap = create_bitmap("test_bitmap", 100, 100)
        with bitmap_cleanup():
            bounding_rect = bitmap_bounding_rectangle_at_location(test_bitmap, 50.0, 50.0)
            assert 50.0 == bounding_rect.x
            assert 50.0 == bounding_rect.y
            assert 100.0 == bounding_rect.width
            assert 100.0 == bounding_rect.height
            
    def test_bitmap_cell_center_integration():
        test_bitmap = create_bitmap("test_bitmap", 100, 100)
        with bitmap_cleanup():
            center = bitmap_cell_center(test_bitmap)
            assert 50.0 == center.x
            assert 50.0 == center.y
            
    def test_bitmap_cell_circle_integration():
        test_bitmap = create_bitmap("test_bitmap", 100, 100)
        with bitmap_cleanup():
            bitmap_set_cell_details(test_bitmap, 50, 50, 2, 2, 4)
            circle = bitmap_cell_circle(test_bitmap, 50.0, 50.0)
            assert 50.0 == circle.center.x
            assert 50.0 == circle.center.x
            assert 25.0 == circle.radius
            
    def test_bitmap_cell_circle_at_point_integration():
        test_bitmap = create_bitmap("test_bitmap", 100, 100)
        with bitmap_cleanup():
            bitmap_set_cell_details(test_bitmap, 50, 50, 2, 2, 4)
            circle = bitmap_cell_circle_at_point(test_bitmap, point_at(100.0, 100.0))
            assert 100.0 == circle.center.x
            assert 100.0 == circle.center.x
            assert 25.0 == circle.radius
            
    def test_bitmap_cell_circle_at_point_with_scale_integration():
        test_bitmap = create_bitmap("test_bitmap", 100, 100)
        with bitmap_cleanup():
            bitmap_set_cell_details(test_bitmap, 50, 50, 2, 2, 4)
            circle = bitmap_cell_circle_at_point_with_scale(test_bitmap, point_at(100.0, 100.0), 2.0)
            assert 100.0 == circle.center.x
            assert 100.0 == circle.center.x
            assert 50.0 == circle.radius
            
    def test_bitmap_cell_columns_integration():
        test_bitmap = create_bitmap("test_bitmap", 100, 100)
        with bitmap_cleanup():
            bitmap_set_cell_details(test_bitmap, 20, 20, 5, 5, 25)
            assert 5 == bitmap_cell_columns(test_bitmap)
            
    def test_bitmap_cell_count_integration():
        test_bitmap = create_bitmap("test_bitmap", 100, 100)
        with bitmap_cleanup():
            bitmap_set_cell_details(test_bitmap, 20, 20, 5, 5, 25)
            assert 25 == bitmap_cell_count(test_bitmap)
            
    def test_bitmap_cell_height_integration():
        test_bitmap = create_bitmap("test_bitmap", 100, 100)
        with bitmap_cleanup():
            bitmap_set_cell_details(test_bitmap, 20, 20, 5, 5, 25)
            assert 20 == bitmap_cell_height(test_bitmap)
            
    def test_bitmap_cell_offset_integration():
        test_bitmap = create_bitmap("test_bitmap", 100, 100)
        with bitmap_cleanup():
            bitmap_set_cell_details(test_bitmap, 25, 25, 4, 4, 16)
            offset = bitmap_cell_offset(test_bitmap, 5)
            assert 25.0 == offset.x
            assert 25.0 == offset.y
            
    def test_bitmap_cell_rectangle_integration():
        test_bitmap = create_bitmap("test_bitmap", 100, 100)
        with bitmap_cleanup():
            bitmap_set_cell_details(test_bitmap, 25, 25, 4, 4, 16)
            rect = bitmap_cell_rectangle(test_bitmap)
            assert 0.0 == rect.x
            assert 0.0 == rect.y
            assert 25.0 == rect.width
            assert 25.0 == rect.height
            
    def test_bitmap_cell_rectangle_at_point_integration():
        test_bitmap = create_bitmap("test_bitmap", 100, 100)
        with bitmap_cleanup():
            bitmap_set_cell_details(test_bitmap, 25, 25, 4, 4, 16)
            rect = bitmap_cell_rectangle_at_point(test_bitmap, point_at(50.0, 50.0))
            assert 50.0 == rect.x
            assert 50.0 == rect.y
            assert 25.0 == rect.width
            assert 25.0 == rect.height
            
    def test_bitmap_cell_rows_integration():
        test_bitmap = create_bitmap("test_bitmap", 100, 100)
        with bitmap_cleanup():
            bitmap_set_cell_details(test_bitmap, 20, 20, 5, 5, 25)
            assert 5 == bitmap_cell_rows(test_bitmap)
            
    def test_bitmap_cell_width_integration():
        test_bitmap = create_bitmap("test_bitmap", 100, 100)
        with bitmap_cleanup():
            bitmap_set_cell_details(test_bitmap, 25, 25, 4, 4, 16)
            assert 25 == bitmap_cell_width(test_bitmap)
            
    def test_bitmap_center_integration():
        test_bitmap = create_bitmap("test_bitmap", 100, 100)
        with bitmap_cleanup():
            test_center = bitmap_center(test_bitmap)
            assert 50.0 == test_center.x
            assert 50.0 == test_center.y
            
    def test_bitmap_filename_integration():
        test_bitmap = create_bitmap("test_bitmap", 100, 100)
        with bitmap_cleanup():
            assert "" == bitmap_filename(test_bitmap)
            
    def test_bitmap_height_integration():
        test_bitmap = create_bitmap("test_bitmap", 100, 100)
        with bitmap_cleanup():
            assert 100 == bitmap_height(test_bitmap)
            
    def test_bitmap_height_of_bitmap_named_integration():
        create_bitmap("bitmap_height", 100, 100)
        with bitmap_cleanup():
            assert 100 == bitmap_height_of_bitmap_named("bitmap_height")
            
    def test_bitmap_name_integration():
        test_bitmap = create_bitmap("bitmap_name", 100, 100)
        with bitmap_cleanup():
            assert "bitmap_name" == bitmap_name(test_bitmap)
            
    def test_bitmap_named_integration():
        create_bitmap("test_bitmap", 100, 100)
        with bitmap_cleanup():
            assert bitmap_named("test_bitmap") is not None
            assert bitmap_named("nonexistent_bitmap") is None
            
    def test_bitmap_rectangle_of_cell_integration():
        test_bitmap = create_bitmap("test_bitmap", 100, 100)
        with bitmap_cleanup():
            bitmap_set_cell_details(test_bitmap, 25, 25, 4, 4, 16)
            rect = bitmap_rectangle_of_cell(test_bitmap, 5)
            assert 25.0 == rect.x
            assert 25.0 == rect.y
            assert 25.0 == rect.width
            assert 25.0 == rect.height
            
    def test_bitmap_set_cell_details_integration():
        test_bitmap = create_bitmap("test_bitmap", 100, 100)
        with bitmap_cleanup():
            bitmap_set_cell_details(test_bitmap, 20, 20, 5, 5, 25)
            assert 20 == bitmap_cell_width(test_bitmap)
            assert 20 == bitmap_cell_height(test_bitmap)
            assert 5 == bitmap_cell_columns(test_bitmap)
            assert 5 == bitmap_cell_rows(test_bitmap)
            assert 25 == bitmap_cell_count(test_bitmap)
            
    def test_bitmap_valid_integration():
        test_bitmap = create_bitmap("test_bitmap", 100, 100)
        with bitmap_cleanup():
            assert bitmap_valid(test_bitmap)
            free_bitmap(test_bitmap)
            assert not bitmap_valid(test_bitmap)
            
    def test_bitmap_width_integration():
        test_bitmap = create_bitmap("test_bitmap", 100, 100)
        with bitmap_cleanup():
            assert 100 == bitmap_width(test_bitmap)
            
    def test_bitmap_width_of_bitmap_named_integration():
        create_bitmap("bitmap_width", 100, 100)
        with bitmap_cleanup():
            assert 100 == bitmap_width_of_bitmap_named("bitmap_width")
            
    def test_clear_bitmap_integration():
        test_bitmap = create_bitmap("test_bitmap", 100, 100)
        with bitmap_cleanup():
            draw_pixel_on_bitmap(test_bitmap, color_black(), 50.0, 50.0)
            assert color_black() == get_pixel_from_bitmap(test_bitmap, 50.0, 50.0)
            clear_bitmap(test_bitmap, color_white())
            assert color_white() == get_pixel_from_bitmap(test_bitmap, 50.0, 50.0)
            
    def test_clear_bitmap_named_integration():
        test_bitmap = create_bitmap("bitmap_named", 100, 100)
        with bitmap_cleanup():
            fill_rectangle_on_bitmap(test_bitmap, color_red(), 0.0, 0.0, 100.0, 100.0)
            assert color_red() == get_pixel_from_bitmap(test_bitmap, 50.0, 50.0)
            clear_bitmap_named("bitmap_named", color_white())
            assert color_white() == get_pixel_from_bitmap(test_bitmap, 50.0, 50.0)
            
    def test_create_bitmap_integration():
        test_bitmap = create_bitmap("bitmap_name1", 100, 100)
        with bitmap_cleanup():
            assert test_bitmap is not None
            assert 100 == bitmap_width(test_bitmap)
            assert 100 == bitmap_height(test_bitmap)
            assert "bitmap_name1" == bitmap_name(test_bitmap)
            
    def test_draw_bitmap_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
            test_bitmap = create_bitmap("test_bitmap", 100, 100)
            with bitmap_cleanup():
                clear_window(test_window, color_white())
                fill_rectangle_on_bitmap(test_bitmap, color_red(), 0.0, 0.0, 50.0, 50.0)
                draw_bitmap(test_bitmap, 100.0, 100.0)
                refresh_screen()
                assert color_red() == get_pixel_from_window(test_window, 125.0, 125.0)
                assert color_white() == get_pixel_from_window(test_window, 175.0, 175.0)
                free_bitmap(test_bitmap)
                
    def test_draw_bitmap_with_options_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
            test_bitmap = create_bitmap("test_bitmap", 100, 100)
            with bitmap_cleanup():
                clear_window(test_window, color_white())
                fill_rectangle_on_bitmap(test_bitmap, color_red(), 0.0, 0.0, 100.0, 100.0)
                draw_bitmap_with_options(test_bitmap, 100.0, 100.0, option_defaults())
                refresh_screen()
                assert color_red() == get_pixel_from_window(test_window, 125.0, 125.0)
                assert color_white() == get_pixel_from_window(test_window, 50.0, 50.0)
                free_bitmap(test_bitmap)
                
    def test_draw_bitmap_named_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
            test_bitmap = create_bitmap("test_bitmap", 100, 100)
            with bitmap_cleanup():
                clear_window(test_window, color_white())
                fill_rectangle_on_bitmap(test_bitmap, color_red(), 0.0, 0.0, 100.0, 100.0)
                draw_bitmap_named("test_bitmap", 100.0, 100.0)
                refresh_screen()
                assert color_red() == get_pixel_from_window(test_window, 125.0, 125.0)
                assert color_white() == get_pixel_from_window(test_window, 50.0, 50.0)
                free_bitmap(test_bitmap)
                
    def test_draw_bitmap_named_with_options_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
            test_bitmap = create_bitmap("test_bitmap", 100, 100)
            with bitmap_cleanup():
                clear_window(test_window, color_white())
                fill_rectangle_on_bitmap(test_bitmap, color_red(), 0.0, 0.0, 100.0, 100.0)
                draw_bitmap_named_with_options("test_bitmap", 100.0, 100.0, option_defaults())
                refresh_screen()
                assert color_red() == get_pixel_from_window(test_window, 125.0, 125.0)
                assert color_white() == get_pixel_from_window(test_window, 50.0, 50.0)
                free_bitmap(test_bitmap)
                
    def test_draw_bitmap_on_bitmap_on_bitmap_integration():
        dest_bitmap = create_bitmap("test_destination", 100, 100)
        with bitmap_cleanup():
            source_bitmap = create_bitmap("test_source", 50, 50)
            clear_bitmap(dest_bitmap, color_white())
            fill_rectangle_on_bitmap(source_bitmap, color_red(), 0.0, 0.0, 50.0, 50.0)
            draw_bitmap_on_bitmap_on_bitmap(dest_bitmap, source_bitmap, 25.0, 25.0)
            assert color_red() == get_pixel_from_bitmap(dest_bitmap, 50.0, 50.0)
            assert color_white() == get_pixel_from_bitmap(dest_bitmap, 10.0, 10.0)
            
    def test_draw_bitmap_on_bitmap_on_bitmap_with_options_integration():
        dest_bitmap = create_bitmap("test_destination", 100, 100)
        with bitmap_cleanup():
            source_bitmap = create_bitmap("test_source", 50, 50)
            clear_bitmap(dest_bitmap, color_white())
            fill_rectangle_on_bitmap(source_bitmap, color_red(), 0.0, 0.0, 50.0, 50.0)
            draw_bitmap_on_bitmap_on_bitmap_with_options(dest_bitmap, source_bitmap, 25.0, 25.0, option_defaults())
            assert color_red() == get_pixel_from_bitmap(dest_bitmap, 50.0, 50.0)
            assert color_white() == get_pixel_from_bitmap(dest_bitmap, 10.0, 10.0)
            
    def test_draw_bitmap_on_window_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
            test_bitmap = create_bitmap("test_bitmap", 100, 100)
            with bitmap_cleanup():
                clear_window(test_window, color_white())
                fill_rectangle_on_bitmap(test_bitmap, color_red(), 0.0, 0.0, 100.0, 100.0)
                draw_bitmap_on_window(test_window, test_bitmap, 100.0, 100.0)
                refresh_screen()
                assert color_red() == get_pixel_from_window(test_window, 125.0, 125.0)
                assert color_white() == get_pixel_from_window(test_window, 50.0, 50.0)
                free_bitmap(test_bitmap)
                
    def test_draw_bitmap_on_window_with_options_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
            test_bitmap = create_bitmap("test_bitmap", 100, 100)
            with bitmap_cleanup():
                clear_window(test_window, color_white())
                fill_rectangle_on_bitmap(test_bitmap, color_red(), 0.0, 0.0, 100.0, 100.0)
                draw_bitmap_on_window_with_options(test_window, test_bitmap, 100.0, 100.0, option_defaults())
                refresh_screen()
                assert color_red() == get_pixel_from_window(test_window, 125.0, 125.0)
                assert color_white() == get_pixel_from_window(test_window, 50.0, 50.0)
                free_bitmap(test_bitmap)
                
    def test_free_all_bitmaps_integration():
        bitmap1 = create_bitmap("test_bitmap_1", 100, 100)
        with bitmap_cleanup():
            bitmap2 = create_bitmap("test_bitmap_2", 100, 100)
            assert bitmap_valid(bitmap1)
            assert bitmap_valid(bitmap2)
            free_all_bitmaps()
            assert not bitmap_valid(bitmap1)
            assert not bitmap_valid(bitmap2)
            
    def test_free_bitmap_integration():
        test_bitmap = create_bitmap("test_bitmap", 100, 100)
        with bitmap_cleanup():
            assert bitmap_valid(test_bitmap)
            free_bitmap(test_bitmap)
            assert not bitmap_valid(test_bitmap)
            
    def test_has_bitmap_integration():
        test_bitmap = create_bitmap("test_bitmap", 100, 100)
        with bitmap_cleanup():
            assert has_bitmap("test_bitmap")
            free_bitmap(test_bitmap)
            assert not has_bitmap("test_bitmap")
            
    def test_load_bitmap_integration():
        loaded_bitmap = load_bitmap("loaded_bitmap", "frog.png")
        with bitmap_cleanup():
            assert color_white() != get_pixel_from_bitmap(loaded_bitmap, 50.0, 50.0)
            
    def test_pixel_drawn_at_point_pt_integration():
        test_bitmap = create_bitmap("test_bitmap", 100, 100)
        with bitmap_cleanup():
            clear_bitmap(test_bitmap, color_white())
            draw_pixel_on_bitmap_at_point(test_bitmap, color_black(), point_at(50.0, 50.0))
            assert color_black() == get_pixel_from_bitmap(test_bitmap, 50.0, 50.0)
            assert color_white() == get_pixel_from_bitmap(test_bitmap, 75.0, 75.0)
            
    def test_pixel_drawn_at_point_integration():
        test_bitmap = create_bitmap("test_bitmap", 100, 100)
        with bitmap_cleanup():
            clear_bitmap(test_bitmap, color_white())
            draw_pixel_on_bitmap(test_bitmap, color_black(), 50.0, 50.0)
            assert color_black() == get_pixel_from_bitmap(test_bitmap, 50.0, 50.0)
            assert color_white() == get_pixel_from_bitmap(test_bitmap, 75.0, 75.0)
            
    def test_pixel_drawn_at_point_in_cell_pt_integration():
        test_bitmap = create_bitmap("test_bitmap", 100, 100)
        with bitmap_cleanup():
            clear_bitmap(test_bitmap, color_white())
            draw_pixel_on_bitmap_at_point(test_bitmap, color_black(), point_at(50.0, 50.0))
            bitmap_set_cell_details(test_bitmap, 100, 100, 1, 1, 1)
            assert color_black() == get_pixel_from_bitmap(test_bitmap, 50.0, 50.0)
            assert color_white() == get_pixel_from_bitmap(test_bitmap, 75.0, 50.0)
            
    def test_pixel_drawn_at_point_in_cell_integration():
        test_bitmap = create_bitmap("test_bitmap", 100, 100)
        with bitmap_cleanup():
            clear_bitmap(test_bitmap, color_white())
            draw_pixel_on_bitmap_at_point(test_bitmap, color_black(), point_at(50.0, 50.0))
            bitmap_set_cell_details(test_bitmap, 100, 100, 1, 1, 1)
            assert color_black() == get_pixel_from_bitmap(test_bitmap, 50.0, 50.0)
            assert color_white() == get_pixel_from_bitmap(test_bitmap, 75.0, 75.0)
            
    def test_setup_collision_mask_integration():
        open_window("Test Window", 800, 600)
        with window_cleanup():
            test_bitmap = create_bitmap("test_bitmap", 100, 100)
            with bitmap_cleanup():
                clear_bitmap(test_bitmap, color_black())
                test_circle = circle_at_from_points(120.0, 120.0, 30.0)
                collision_before_mask = bitmap_circle_collision(test_bitmap, 100.0, 100.0, test_circle)
                setup_collision_mask(test_bitmap)
                collision_after_mask = bitmap_circle_collision(test_bitmap, 100.0, 100.0, test_circle)
                assert not collision_before_mask
                assert collision_after_mask
                
    def test_draw_line_record_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
            clear_window(test_window, color_white())
            draw_line_record(color_black(), line_from_point_to_point(point_at(100.0, 100.0), point_at(200.0, 200.0)))
            refresh_screen()
            assert color_black() == get_pixel_from_window(test_window, 100.0, 100.0)
            assert color_white() == get_pixel_from_window(test_window, 99.0, 99.0)
            
    def test_draw_line_record_with_options_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
            clear_window(test_window, color_white())
            draw_line_record_with_options(color_black(), line_from_point_to_point(point_at(100.0, 100.0), point_at(200.0, 200.0)), option_line_width_with_options(3, option_defaults()))
            refresh_screen()
            assert color_black() == get_pixel_from_window(test_window, 100.0, 100.0)
            assert color_white() == get_pixel_from_window(test_window, 99.0, 99.0)
            
    def test_draw_line_point_to_point_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
            clear_window(test_window, color_white())
            draw_line_point_to_point(color_black(), point_at(100.0, 100.0), point_at(200.0, 200.0))
            refresh_screen()
            assert color_black() == get_pixel_from_window(test_window, 100.0, 100.0)
            assert color_white() == get_pixel_from_window(test_window, 99.0, 99.0)
            
    def test_draw_line_point_to_point_with_options_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
            clear_window(test_window, color_white())
            draw_line_point_to_point_with_options(color_black(), point_at(100.0, 100.0), point_at(200.0, 200.0), option_defaults())
            refresh_screen()
            assert color_black() == get_pixel_from_window(test_window, 100.0, 100.0)
            assert color_white() == get_pixel_from_window(test_window, 99.0, 99.0)
            
    def test_draw_line_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
            clear_window(test_window, color_white())
            draw_line(color_black(), 100.0, 100.0, 200.0, 200.0)
            refresh_screen()
            assert color_black() == get_pixel_from_window(test_window, 100.0, 100.0)
            assert color_white() == get_pixel_from_window(test_window, 99.0, 99.0)
            
    def test_draw_line_with_options_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
            clear_window(test_window, color_white())
            draw_line_with_options(color_black(), 100.0, 100.0, 200.0, 200.0, option_defaults())
            refresh_screen()
            assert color_black() == get_pixel_from_window(test_window, 100.0, 100.0)
            assert color_white() == get_pixel_from_window(test_window, 99.0, 99.0)
            
    def test_draw_line_on_bitmap_record_integration():
        test_bitmap = create_bitmap("test_bitmap", 100, 100)
        with bitmap_cleanup():
            clear_bitmap(test_bitmap, color_white())
            draw_line_on_bitmap_record(test_bitmap, color_black(), line_from_point_to_point(point_at(10.0, 10.0), point_at(90.0, 90.0)))
            assert color_black() == get_pixel_from_bitmap(test_bitmap, 50.0, 50.0)
            assert color_white() == get_pixel_from_bitmap(test_bitmap, 95.0, 95.0)
            
    def test_draw_line_on_bitmap_record_with_options_integration():
        test_bitmap = create_bitmap("test_bitmap", 100, 100)
        with bitmap_cleanup():
            clear_bitmap(test_bitmap, color_white())
            draw_line_on_bitmap_record_with_options(test_bitmap, color_black(), line_from_point_to_point(point_at(10.0, 10.0), point_at(90.0, 90.0)), option_defaults())
            assert color_black() == get_pixel_from_bitmap(test_bitmap, 50.0, 50.0)
            assert color_white() == get_pixel_from_bitmap(test_bitmap, 95.0, 50.0)
            
    def test_draw_line_on_bitmap_point_to_point_integration():
        test_bitmap = create_bitmap("test_bitmap", 100, 100)
        with bitmap_cleanup():
            clear_bitmap(test_bitmap, color_white())
            draw_line_on_bitmap_point_to_point(test_bitmap, color_black(), point_at(10.0, 10.0), point_at(90.0, 90.0))
            assert color_black() == get_pixel_from_bitmap(test_bitmap, 50.0, 50.0)
            assert color_white() == get_pixel_from_bitmap(test_bitmap, 0.0, 0.0)
            
    def test_draw_line_on_bitmap_point_to_point_with_options_integration():
        test_bitmap = create_bitmap("test_bitmap", 100, 100)
        with bitmap_cleanup():
            clear_bitmap(test_bitmap, color_white())
            draw_line_on_bitmap_point_to_point_with_options(test_bitmap, color_black(), point_at(10.0, 10.0), point_at(90.0, 90.0), option_defaults())
            assert color_black() == get_pixel_from_bitmap(test_bitmap, 10.0, 10.0)
            assert color_black() == get_pixel_from_bitmap(test_bitmap, 90.0, 90.0)
            assert color_white() == get_pixel_from_bitmap(test_bitmap, 5.0, 5.0)
            
    def test_draw_line_on_bitmap_integration():
        test_bitmap = create_bitmap("test_bitmap", 100, 100)
        with bitmap_cleanup():
            clear_bitmap(test_bitmap, color_white())
            draw_line_on_bitmap(test_bitmap, color_black(), 10.0, 10.0, 90.0, 90.0)
            assert color_black() == get_pixel_from_bitmap(test_bitmap, 50.0, 50.0)
            assert color_white() == get_pixel_from_bitmap(test_bitmap, 95.0, 50.0)
            
    def test_draw_line_on_bitmap_with_options_integration():
        test_bitmap = create_bitmap("test_bitmap", 100, 100)
        with bitmap_cleanup():
            clear_bitmap(test_bitmap, color_white())
            draw_line_on_bitmap_with_options(test_bitmap, color_black(), 10.0, 10.0, 90.0, 90.0, option_defaults())
            assert color_black() == get_pixel_from_bitmap(test_bitmap, 50.0, 50.0)
            assert color_white() == get_pixel_from_bitmap(test_bitmap, 5.0, 5.0)
            
    def test_draw_line_on_window_record_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
            clear_window(test_window, color_white())
            test_line = line_from_point_to_point(point_at(100.0, 100.0), point_at(150.0, 150.0))
            draw_line_on_window_record(test_window, color_black(), test_line)
            refresh_screen()
            assert color_black() == get_pixel_from_window(test_window, 100.0, 100.0)
            assert color_white() == get_pixel_from_window(test_window, 99.0, 99.0)
            
    def test_draw_line_on_window_record_with_options_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
            clear_window(test_window, color_white())
            test_line = line_from_point_to_point(point_at(100.0, 100.0), point_at(150.0, 150.0))
            draw_line_on_window_record_with_options(test_window, color_black(), test_line, option_defaults())
            refresh_screen()
            assert color_black() == get_pixel_from_window(test_window, 100.0, 100.0)
            assert color_white() == get_pixel_from_window(test_window, 99.0, 99.0)
            
    def test_draw_line_on_window_point_to_point_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
            clear_window(test_window, color_white())
            draw_line_on_window_point_to_point(test_window, color_black(), point_at(100.0, 100.0), point_at(200.0, 200.0))
            refresh_screen()
            assert color_black() == get_pixel_from_window(test_window, 100.0, 100.0)
            assert color_white() == get_pixel_from_window(test_window, 99.0, 99.0)
            
    def test_draw_line_on_window_point_to_point_with_options_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
            clear_window(test_window, color_white())
            draw_line_on_window_point_to_point_with_options(test_window, color_black(), point_at(100.0, 100.0), point_at(200.0, 200.0), option_defaults())
            refresh_screen()
            assert color_black() == get_pixel_from_window(test_window, 100.0, 100.0)
            assert color_white() == get_pixel_from_window(test_window, 99.0, 99.0)
            
    def test_draw_line_on_window_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
            clear_window(test_window, color_white())
            draw_line_on_window(test_window, color_black(), 100.0, 100.0, 200.0, 200.0)
            refresh_screen()
            assert color_black() == get_pixel_from_window(test_window, 100.0, 100.0)
            assert color_white() == get_pixel_from_window(test_window, 99.0, 99.0)
            
    def test_draw_line_on_window_with_options_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
            clear_window(test_window, color_white())
            draw_line_on_window_with_options(test_window, color_black(), 100.0, 100.0, 200.0, 200.0, option_defaults())
            refresh_screen()
            assert color_black() == get_pixel_from_window(test_window, 100.0, 100.0)
            assert color_white() == get_pixel_from_window(test_window, 99.0, 99.0)
            
    def test_draw_pixel_at_point_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
            clear_window(test_window, color_white())
            draw_pixel_at_point(color_black(), point_at(100.0, 100.0))
            refresh_screen()
            assert color_black() == get_pixel_from_window(test_window, 100.0, 100.0)
            assert color_white() == get_pixel_from_window(test_window, 99.0, 99.0)
            
    def test_draw_pixel_at_point_with_options_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
            clear_window(test_window, color_white())
            draw_pixel_at_point_with_options(color_black(), point_at(100.0, 100.0), option_defaults())
            refresh_screen()
            assert color_black() == get_pixel_from_window(test_window, 100.0, 100.0)
            assert color_white() == get_pixel_from_window(test_window, 99.0, 99.0)
            
    def test_draw_pixel_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
            clear_window(test_window, color_white())
            draw_pixel(color_black(), 100.0, 100.0)
            refresh_screen()
            assert color_black() == get_pixel_from_window(test_window, 100.0, 100.0)
            assert color_white() == get_pixel_from_window(test_window, 99.0, 99.0)
            
    def test_draw_pixel_with_options_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
            clear_window(test_window, color_white())
            draw_pixel_with_options(color_black(), 100.0, 100.0, option_defaults())
            refresh_screen()
            assert color_black() == get_pixel_from_window(test_window, 100.0, 100.0)
            assert color_white() == get_pixel_from_window(test_window, 99.0, 99.0)
            
    def test_draw_pixel_on_bitmap_at_point_integration():
        test_bitmap = create_bitmap("test_bitmap", 100, 100)
        with bitmap_cleanup():
            clear_bitmap(test_bitmap, color_white())
            draw_pixel_on_bitmap_at_point(test_bitmap, color_black(), point_at(50.0, 50.0))
            assert color_black() == get_pixel_from_bitmap(test_bitmap, 50.0, 50.0)
            assert color_white() == get_pixel_from_bitmap(test_bitmap, 0.0, 0.0)
            
    def test_draw_pixel_on_bitmap_at_point_with_options_integration():
        test_bitmap = create_bitmap("test_bitmap", 100, 100)
        with bitmap_cleanup():
            clear_bitmap(test_bitmap, color_white())
            draw_pixel_on_bitmap_at_point_with_options(test_bitmap, color_black(), point_at(50.0, 50.0), option_defaults())
            assert color_black() == get_pixel_from_bitmap(test_bitmap, 50.0, 50.0)
            assert color_white() == get_pixel_from_bitmap(test_bitmap, 0.0, 0.0)
            
    def test_draw_pixel_on_bitmap_integration():
        test_bitmap = create_bitmap("test_bitmap", 100, 100)
        with bitmap_cleanup():
            clear_bitmap(test_bitmap, color_white())
            draw_pixel_on_bitmap(test_bitmap, color_black(), 50.0, 50.0)
            assert color_black() == get_pixel_from_bitmap(test_bitmap, 50.0, 50.0)
            assert color_white() == get_pixel_from_bitmap(test_bitmap, 51.0, 50.0)
            
    def test_draw_pixel_on_bitmap_with_options_integration():
        test_bitmap = create_bitmap("test_bitmap", 100, 100)
        with bitmap_cleanup():
            clear_bitmap(test_bitmap, color_white())
            draw_pixel_on_bitmap_with_options(test_bitmap, color_black(), 50.0, 50.0, option_defaults())
            assert color_black() == get_pixel_from_bitmap(test_bitmap, 50.0, 50.0)
            assert color_white() == get_pixel_from_bitmap(test_bitmap, 51.0, 50.0)
            
    def test_draw_pixel_on_window_at_point_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
            clear_window(test_window, color_white())
            draw_pixel_on_window_at_point(test_window, color_black(), point_at(100.0, 100.0))
            refresh_screen()
            assert color_black() == get_pixel_from_window(test_window, 100.0, 100.0)
            assert color_white() == get_pixel_from_window(test_window, 99.0, 99.0)
            
    def test_draw_pixel_on_window_at_point_with_options_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
            clear_window(test_window, color_white())
            draw_pixel_on_window_at_point_with_options(test_window, color_black(), point_at(100.0, 100.0), option_defaults())
            refresh_screen()
            assert color_black() == get_pixel_from_window(test_window, 100.0, 100.0)
            assert color_white() == get_pixel_from_window(test_window, 99.0, 99.0)
            
    def test_draw_pixel_on_window_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
            clear_window(test_window, color_white())
            draw_pixel_on_window(test_window, color_black(), 100.0, 100.0)
            refresh_screen()
            assert color_black() == get_pixel_from_window(test_window, 100.0, 100.0)
            assert color_white() == get_pixel_from_window(test_window, 99.0, 99.0)
            
    def test_draw_pixel_on_window_with_options_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
            clear_window(test_window, color_white())
            draw_pixel_on_window_with_options(test_window, color_black(), 100.0, 100.0, option_defaults())
            refresh_screen()
            assert color_black() == get_pixel_from_window(test_window, 100.0, 100.0)
            assert color_white() == get_pixel_from_window(test_window, 99.0, 99.0)
            
    def test_get_pixel_from_bitmap_at_point_integration():
        test_bitmap = create_bitmap("test_bitmap", 100, 100)
        with bitmap_cleanup():
            clear_bitmap(test_bitmap, color_white())
            draw_pixel_on_bitmap_at_point(test_bitmap, color_black(), point_at(50.0, 50.0))
            assert color_black() == get_pixel_from_bitmap_at_point(test_bitmap, point_at(50.0, 50.0))
            assert color_white() == get_pixel_from_bitmap_at_point(test_bitmap, point_at(49.0, 49.0))
            
    def test_get_pixel_from_bitmap_integration():
        test_bitmap = create_bitmap("test_bitmap", 100, 100)
        with bitmap_cleanup():
            clear_bitmap(test_bitmap, color_white())
            draw_pixel_on_bitmap(test_bitmap, color_black(), 50.0, 50.0)
            assert color_black() == get_pixel_from_bitmap(test_bitmap, 50.0, 50.0)
            assert color_white() == get_pixel_from_bitmap(test_bitmap, 49.0, 49.0)
            
    def test_get_pixel_at_point_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
            clear_window(test_window, color_white())
            draw_pixel_at_point(color_black(), point_at(100.0, 100.0))
            refresh_screen()
            assert color_black() == get_pixel_from_window(test_window, 100.0, 100.0)
            assert color_white() == get_pixel_from_window(test_window, 99.0, 99.0)
            
    def test_get_pixel_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
            clear_window(test_window, color_white())
            draw_pixel(color_black(), 100.0, 100.0)
            refresh_screen()
            assert color_black() == get_pixel_from_window(test_window, 100.0, 100.0)
            assert color_white() == get_pixel_from_window(test_window, 99.0, 99.0)
            
    def test_get_pixel_from_window_at_point_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
            clear_window(test_window, color_white())
            draw_pixel_at_point(color_black(), point_at(100.0, 100.0))
            refresh_screen()
            assert color_black() == get_pixel_from_window_at_point(test_window, point_at(100.0, 100.0))
            assert color_white() == get_pixel_from_window_at_point(test_window, point_at(99.0, 99.0))
            
    def test_get_pixel_from_window_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
            clear_window(test_window, color_white())
            draw_pixel(color_black(), 100.0, 100.0)
            refresh_screen()
            assert color_black() == get_pixel_from_window(test_window, 100.0, 100.0)
            assert color_white() == get_pixel_from_window(test_window, 99.0, 99.0)
            
    def test_get_pixel_from_window_at_point_from_window_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
            clear_window(test_window, color_white())
            draw_pixel_at_point(color_black(), point_at(100.0, 100.0))
            refresh_screen()
            assert color_black() == get_pixel_from_window_at_point_from_window(test_window, point_at(100.0, 100.0))
            assert color_white() == get_pixel_from_window_at_point_from_window(test_window, point_at(99.0, 99.0))
            
    def test_get_pixel_from_window_from_window_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
            clear_window(test_window, color_white())
            draw_pixel(color_black(), 100.0, 100.0)
            refresh_screen()
            assert color_black() == get_pixel_from_window_from_window(test_window, 100.0, 100.0)
            assert color_white() == get_pixel_from_window_from_window(test_window, 99.0, 99.0)
            
    def test_draw_quad_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
            clear_window(test_window, color_white())
            quad = quad_from_points(point_at(100.0, 100.0), point_at(200.0, 100.0), point_at(100.0, 200.0), point_at(200.0, 200.0))
            draw_quad(color_black(), quad)
            refresh_screen()
            assert color_black() == get_pixel_from_window(test_window, 100.0, 100.0)
            assert color_white() == get_pixel_from_window(test_window, 150.0, 150.0)
            assert color_white() == get_pixel_from_window(test_window, 250.0, 250.0)
            
    def test_draw_quad_with_options_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
            clear_window(test_window, color_white())
            quad = quad_from_points(point_at(100.0, 100.0), point_at(200.0, 100.0), point_at(100.0, 200.0), point_at(200.0, 200.0))
            draw_quad_with_options(color_black(), quad, option_defaults())
            refresh_screen()
            assert color_black() == get_pixel_from_window(test_window, 100.0, 100.0)
            assert color_white() == get_pixel_from_window(test_window, 150.0, 150.0)
            assert color_white() == get_pixel_from_window(test_window, 250.0, 250.0)
            
    def test_draw_quad_on_bitmap_integration():
        test_bitmap = create_bitmap("test_bitmap", 100, 100)
        with bitmap_cleanup():
            clear_bitmap(test_bitmap, color_white())
            quad = quad_from_points(point_at(10.0, 10.0), point_at(90.0, 10.0), point_at(10.0, 90.0), point_at(90.0, 90.0))
            draw_quad_on_bitmap(test_bitmap, color_black(), quad)
            assert color_black() == get_pixel_from_bitmap(test_bitmap, 10.0, 10.0)
            assert color_white() == get_pixel_from_bitmap(test_bitmap, 50.0, 50.0)
            assert color_white() == get_pixel_from_bitmap(test_bitmap, 5.0, 5.0)
            
    def test_draw_quad_on_bitmap_with_options_integration():
        test_bitmap = create_bitmap("test_bitmap", 100, 100)
        with bitmap_cleanup():
            clear_bitmap(test_bitmap, color_white())
            quad = quad_from_points(point_at(10.0, 10.0), point_at(90.0, 10.0), point_at(90.0, 90.0), point_at(10.0, 90.0))
            draw_quad_on_bitmap_with_options(test_bitmap, color_black(), quad, option_defaults())
            assert color_black() == get_pixel_from_bitmap(test_bitmap, 10.0, 10.0)
            assert color_black() == get_pixel_from_bitmap(test_bitmap, 50.0, 50.0)
            assert color_white() == get_pixel_from_bitmap(test_bitmap, 5.0, 5.0)
            
    def test_draw_quad_on_window_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
            clear_window(test_window, color_white())
            quad = quad_from_points(point_at(100.0, 100.0), point_at(200.0, 100.0), point_at(100.0, 200.0), point_at(200.0, 200.0))
            draw_quad_on_window(test_window, color_black(), quad)
            refresh_screen()
            assert color_black() == get_pixel_from_window(test_window, 100.0, 100.0)
            assert color_white() == get_pixel_from_window(test_window, 150.0, 150.0)
            assert color_white() == get_pixel_from_window(test_window, 250.0, 250.0)
            
    def test_draw_quad_on_window_with_options_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
            clear_window(test_window, color_white())
            quad = quad_from_points(point_at(100.0, 100.0), point_at(200.0, 100.0), point_at(100.0, 200.0), point_at(200.0, 200.0))
            draw_quad_on_window_with_options(test_window, color_black(), quad, option_defaults())
            refresh_screen()
            assert color_black() == get_pixel_from_window(test_window, 100.0, 100.0)
            assert color_white() == get_pixel_from_window(test_window, 150.0, 150.0)
            assert color_white() == get_pixel_from_window(test_window, 250.0, 250.0)
            
    def test_draw_rectangle_record_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
            clear_window(test_window, color_white())
            rectangle = rectangle_from(100.0, 100.0, 200.0, 150.0)
            draw_rectangle_record(color_black(), rectangle)
            refresh_screen()
            assert color_black() == get_pixel_from_window(test_window, 100.0, 100.0)
            assert color_white() == get_pixel_from_window(test_window, 150.0, 125.0)
            assert color_white() == get_pixel_from_window(test_window, 301.0, 251.0)
            
    def test_draw_rectangle_record_with_options_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
            clear_window(test_window, color_white())
            rectangle = rectangle_from(100.0, 100.0, 200.0, 150.0)
            draw_rectangle_record_with_options(color_black(), rectangle, option_defaults())
            refresh_screen()
            assert color_black() == get_pixel_from_window(test_window, 100.0, 100.0)
            assert color_white() == get_pixel_from_window(test_window, 150.0, 125.0)
            assert color_white() == get_pixel_from_window(test_window, 350.0, 300.0)
            
    def test_draw_rectangle_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
            clear_window(test_window, color_white())
            draw_rectangle(color_black(), 100.0, 100.0, 200.0, 150.0)
            refresh_screen()
            assert color_black() == get_pixel_from_window(test_window, 100.0, 100.0)
            assert color_white() == get_pixel_from_window(test_window, 301.0, 251.0)
            
    def test_draw_rectangle_with_options_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
            clear_window(test_window, color_white())
            draw_rectangle_with_options(color_black(), 100.0, 100.0, 200.0, 150.0, option_line_width_with_options(3, option_defaults()))
            refresh_screen()
            assert color_black() == get_pixel_from_window(test_window, 100.0, 100.0)
            assert color_black() == get_pixel_from_window(test_window, 101.0, 100.0)
            assert color_white() == get_pixel_from_window(test_window, 150.0, 125.0)
            assert color_white() == get_pixel_from_window(test_window, 301.0, 251.0)
            
    def test_draw_rectangle_on_bitmap_record_integration():
        test_bitmap = create_bitmap("test_bitmap", 100, 100)
        with bitmap_cleanup():
            clear_bitmap(test_bitmap, color_white())
            rectangle = rectangle_from(50.0, 50.0, 20.0, 30.0)
            draw_rectangle_on_bitmap_record(test_bitmap, color_black(), rectangle)
            assert color_black() == get_pixel_from_bitmap(test_bitmap, 50.0, 50.0)
            assert color_white() == get_pixel_from_bitmap(test_bitmap, 80.0, 90.0)
            
    def test_draw_rectangle_on_bitmap_record_with_options_integration():
        test_bitmap = create_bitmap("test_bitmap", 100, 100)
        with bitmap_cleanup():
            clear_bitmap(test_bitmap, color_white())
            rectangle = rectangle_from(50.0, 50.0, 20.0, 20.0)
            draw_rectangle_on_bitmap_record_with_options(test_bitmap, color_black(), rectangle, option_defaults())
            assert color_black() == get_pixel_from_bitmap(test_bitmap, 50.0, 50.0)
            assert color_white() == get_pixel_from_bitmap(test_bitmap, 75.0, 75.0)
            
    def test_draw_rectangle_on_bitmap_integration():
        test_bitmap = create_bitmap("test_bitmap", 100, 100)
        with bitmap_cleanup():
            clear_bitmap(test_bitmap, color_white())
            draw_rectangle_on_bitmap(test_bitmap, color_black(), 50.0, 50.0, 20.0, 20.0)
            assert color_black() == get_pixel_from_bitmap(test_bitmap, 50.0, 50.0)
            assert color_white() == get_pixel_from_bitmap(test_bitmap, 75.0, 75.0)
            
    def test_draw_rectangle_on_bitmap_with_options_integration():
        test_bitmap = create_bitmap("test_bitmap", 100, 100)
        with bitmap_cleanup():
            clear_bitmap(test_bitmap, color_white())
            draw_rectangle_on_bitmap_with_options(test_bitmap, color_black(), 50.0, 50.0, 20.0, 20.0, option_defaults())
            assert color_black() == get_pixel_from_bitmap(test_bitmap, 50.0, 50.0)
            assert color_white() == get_pixel_from_bitmap(test_bitmap, 75.0, 75.0)
            
    def test_draw_rectangle_on_window_record_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
            clear_window(test_window, color_white())
            rectangle = rectangle_from(100.0, 100.0, 50.0, 50.0)
            draw_rectangle_on_window_record(test_window, color_black(), rectangle)
            refresh_screen()
            assert color_black() == get_pixel_from_window(test_window, 100.0, 100.0)
            assert color_white() == get_pixel_from_window(test_window, 125.0, 125.0)
            assert color_white() == get_pixel_from_window(test_window, 200.0, 200.0)
            
    def test_draw_rectangle_on_window_record_with_options_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
            clear_window(test_window, color_white())
            rectangle = rectangle_from(100.0, 100.0, 50.0, 50.0)
            draw_rectangle_on_window_record_with_options(test_window, color_black(), rectangle, option_defaults())
            refresh_screen()
            assert color_black() == get_pixel_from_window(test_window, 100.0, 100.0)
            assert color_white() == get_pixel_from_window(test_window, 125.0, 125.0)
            assert color_white() == get_pixel_from_window(test_window, 175.0, 175.0)
            
    def test_draw_rectangle_on_window_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
            clear_window(test_window, color_white())
            draw_rectangle_on_window(test_window, color_black(), 100.0, 100.0, 50.0, 50.0)
            refresh_screen()
            assert color_black() == get_pixel_from_window(test_window, 100.0, 100.0)
            assert color_white() == get_pixel_from_window(test_window, 200.0, 200.0)
            
    def test_draw_rectangle_on_window_with_options_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
            clear_window(test_window, color_white())
            draw_rectangle_on_window_with_options(test_window, color_black(), 100.0, 100.0, 50.0, 50.0, option_defaults())
            refresh_screen()
            assert color_black() == get_pixel_from_window(test_window, 100.0, 100.0)
            assert color_white() == get_pixel_from_window(test_window, 200.0, 200.0)
            
    def test_fill_quad_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
            clear_window(test_window, color_white())
            quad = quad_from_points(point_at(100.0, 100.0), point_at(300.0, 100.0), point_at(100.0, 300.0), point_at(300.0, 300.0))
            fill_quad(color_black(), quad)
            refresh_screen()
            assert color_black() == get_pixel_from_window(test_window, 200.0, 200.0)
            assert color_white() == get_pixel_from_window(test_window, 400.0, 400.0)
            
    def test_fill_quad_with_options_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
            clear_window(test_window, color_white())
            quad = quad_from_points(point_at(100.0, 100.0), point_at(300.0, 100.0), point_at(100.0, 300.0), point_at(300.0, 300.0))
            fill_quad_with_options(color_black(), quad, option_defaults())
            refresh_screen()
            assert color_black() == get_pixel_from_window(test_window, 200.0, 200.0)
            assert color_white() == get_pixel_from_window(test_window, 400.0, 400.0)
            
    def test_fill_quad_on_bitmap_integration():
        test_bitmap = create_bitmap("test_bitmap", 100, 100)
        with bitmap_cleanup():
            clear_bitmap(test_bitmap, color_white())
            quad = quad_from_points(point_at(10.0, 10.0), point_at(90.0, 10.0), point_at(10.0, 90.0), point_at(90.0, 90.0))
            fill_quad_on_bitmap(test_bitmap, color_black(), quad)
            assert color_black() == get_pixel_from_bitmap(test_bitmap, 50.0, 50.0)
            assert color_white() == get_pixel_from_bitmap(test_bitmap, 0.0, 0.0)
            
    def test_fill_quad_on_bitmap_with_options_integration():
        test_bitmap = create_bitmap("test_bitmap", 100, 100)
        with bitmap_cleanup():
            clear_bitmap(test_bitmap, color_white())
            quad = quad_from_points(point_at(10.0, 10.0), point_at(90.0, 10.0), point_at(90.0, 90.0), point_at(10.0, 90.0))
            fill_quad_on_bitmap_with_options(test_bitmap, color_black(), quad, option_defaults())
            assert color_black() == get_pixel_from_bitmap(test_bitmap, 50.0, 50.0)
            assert color_white() == get_pixel_from_bitmap(test_bitmap, 95.0, 50.0)
            
    def test_fill_quad_on_window_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
            clear_window(test_window, color_white())
            quad = quad_from_points(point_at(100.0, 100.0), point_at(200.0, 100.0), point_at(100.0, 200.0), point_at(200.0, 200.0))
            fill_quad_on_window(test_window, color_black(), quad)
            refresh_screen()
            assert color_black() == get_pixel_from_window(test_window, 150.0, 150.0)
            assert color_white() == get_pixel_from_window(test_window, 250.0, 250.0)
            
    def test_fill_quad_on_window_with_options_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
            clear_window(test_window, color_white())
            quad = quad_from_points(point_at(100.0, 100.0), point_at(200.0, 100.0), point_at(200.0, 200.0), point_at(100.0, 200.0))
            fill_quad_on_window_with_options(test_window, color_black(), quad, option_defaults())
            refresh_screen()
            assert color_black() == get_pixel_from_window(test_window, 150.0, 150.0)
            assert color_white() == get_pixel_from_window(test_window, 250.0, 150.0)
            
    def test_fill_rectangle_record_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
            clear_window(test_window, color_white())
            rectangle = rectangle_from(100.0, 100.0, 200.0, 150.0)
            fill_rectangle_record(color_black(), rectangle)
            refresh_screen()
            assert color_black() == get_pixel_from_window(test_window, 150.0, 125.0)
            assert color_white() == get_pixel_from_window(test_window, 350.0, 275.0)
            
    def test_fill_rectangle_record_with_options_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
            clear_window(test_window, color_white())
            rectangle = rectangle_from(100.0, 100.0, 200.0, 150.0)
            fill_rectangle_record_with_options(color_black(), rectangle, option_defaults())
            refresh_screen()
            assert color_black() == get_pixel_from_window(test_window, 150.0, 125.0)
            assert color_white() == get_pixel_from_window(test_window, 350.0, 275.0)
            
    def test_fill_rectangle_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
            clear_window(test_window, color_white())
            fill_rectangle(color_black(), 100.0, 100.0, 200.0, 150.0)
            refresh_screen()
            assert color_black() == get_pixel_from_window(test_window, 150.0, 125.0)
            assert color_white() == get_pixel_from_window(test_window, 301.0, 251.0)
            
    def test_fill_rectangle_with_options_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
            clear_window(test_window, color_white())
            fill_rectangle_with_options(color_black(), 100.0, 100.0, 200.0, 150.0, option_defaults())
            refresh_screen()
            assert color_black() == get_pixel_from_window(test_window, 150.0, 125.0)
            assert color_white() == get_pixel_from_window(test_window, 301.0, 251.0)
            
    def test_fill_rectangle_on_bitmap_record_integration():
        test_bitmap = create_bitmap("test_bitmap", 100, 100)
        with bitmap_cleanup():
            clear_bitmap(test_bitmap, color_white())
            rectangle = rectangle_from(25.0, 25.0, 50.0, 50.0)
            fill_rectangle_on_bitmap_record(test_bitmap, color_black(), rectangle)
            assert color_black() == get_pixel_from_bitmap(test_bitmap, 50.0, 50.0)
            assert color_white() == get_pixel_from_bitmap(test_bitmap, 10.0, 10.0)
            
    def test_fill_rectangle_on_bitmap_record_with_options_integration():
        test_bitmap = create_bitmap("test_bitmap", 100, 100)
        with bitmap_cleanup():
            clear_bitmap(test_bitmap, color_white())
            rectangle = rectangle_from(25.0, 25.0, 50.0, 50.0)
            fill_rectangle_on_bitmap_record_with_options(test_bitmap, color_black(), rectangle, option_defaults())
            assert color_black() == get_pixel_from_bitmap(test_bitmap, 50.0, 50.0)
            assert color_white() == get_pixel_from_bitmap(test_bitmap, 10.0, 10.0)
            
    def test_fill_rectangle_on_bitmap_integration():
        test_bitmap = create_bitmap("test_bitmap", 100, 100)
        with bitmap_cleanup():
            clear_bitmap(test_bitmap, color_white())
            fill_rectangle_on_bitmap(test_bitmap, color_black(), 25.0, 25.0, 50.0, 50.0)
            assert color_black() == get_pixel_from_bitmap(test_bitmap, 50.0, 50.0)
            assert color_white() == get_pixel_from_bitmap(test_bitmap, 75.0, 75.0)
            
    def test_fill_rectangle_on_bitmap_with_options_integration():
        test_bitmap = create_bitmap("test_bitmap", 100, 100)
        with bitmap_cleanup():
            clear_bitmap(test_bitmap, color_white())
            fill_rectangle_on_bitmap_with_options(test_bitmap, color_black(), 25.0, 25.0, 50.0, 50.0, option_defaults())
            assert color_black() == get_pixel_from_bitmap(test_bitmap, 50.0, 50.0)
            assert color_white() == get_pixel_from_bitmap(test_bitmap, 10.0, 10.0)
            
    def test_fill_rectangle_on_window_record_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
            clear_window(test_window, color_white())
            rectangle = rectangle_from(100.0, 100.0, 200.0, 150.0)
            fill_rectangle_on_window_record(test_window, color_black(), rectangle)
            refresh_screen()
            assert color_black() == get_pixel_from_window(test_window, 150.0, 125.0)
            assert color_white() == get_pixel_from_window(test_window, 350.0, 275.0)
            
    def test_fill_rectangle_on_window_record_with_options_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
            clear_window(test_window, color_white())
            rectangle = rectangle_from(100.0, 100.0, 200.0, 150.0)
            fill_rectangle_on_window_record_with_options(test_window, color_black(), rectangle, option_defaults())
            refresh_screen()
            assert color_black() == get_pixel_from_window(test_window, 150.0, 125.0)
            assert color_white() == get_pixel_from_window(test_window, 350.0, 275.0)
            
    def test_fill_rectangle_on_window_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
            clear_window(test_window, color_white())
            fill_rectangle_on_window(test_window, color_black(), 100.0, 100.0, 50.0, 50.0)
            refresh_screen()
            assert color_black() == get_pixel_from_window(test_window, 125.0, 125.0)
            assert color_white() == get_pixel_from_window(test_window, 175.0, 175.0)
            
    def test_fill_rectangle_on_window_with_options_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
            clear_window(test_window, color_white())
            fill_rectangle_on_window_with_options(test_window, color_black(), 100.0, 100.0, 50.0, 50.0, option_defaults())
            refresh_screen()
            assert color_black() == get_pixel_from_window(test_window, 125.0, 125.0)
            assert color_white() == get_pixel_from_window(test_window, 175.0, 175.0)
            
    def test_draw_text_font_as_string_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
            clear_window(test_window, color_white())
            refresh_screen()
            load_font("hara", "hara.ttf")
            with font_cleanup():
                draw_text_font_as_string("Test Text", color_black(), "hara", 24, 100.0, 100.0)
                refresh_screen()
                assert color_black() == get_pixel_from_window(test_window, 120.0, 110.0)
                assert color_white() == get_pixel_from_window(test_window, 90.0, 90.0)
                
    def test_draw_text_with_options_font_as_string_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
            clear_window(test_window, color_white())
            load_font("hara", "hara.ttf")
            with font_cleanup():
                draw_text_with_options_font_as_string("Test Text", color_black(), "hara", 24, 100.0, 100.0, option_defaults())
                refresh_screen()
                assert color_black() == get_pixel_from_window(test_window, 120.0, 110.0)
                assert color_white() == get_pixel_from_window(test_window, 90.0, 90.0)
                
    def test_draw_text_no_font_no_size_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
            clear_window(test_window, color_white())
            draw_text_no_font_no_size("Test Text", color_black(), 100.0, 100.0)
            refresh_screen()
            assert color_black() == get_pixel_from_window(test_window, 105.0, 100.0)
            assert color_white() == get_pixel_from_window(test_window, 90.0, 90.0)
            
    def test_draw_text_no_font_no_size_with_options_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
            clear_window(test_window, color_white())
            draw_text_no_font_no_size_with_options("Test Text", color_black(), 100.0, 100.0, option_defaults())
            refresh_screen()
            assert color_black() == get_pixel_from_window(test_window, 105.0, 100.0)
            assert color_white() == get_pixel_from_window(test_window, 90.0, 90.0)
            
    def test_draw_text_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
            clear_window(test_window, color_white())
            load_font("hara", "hara.ttf")
            with font_cleanup():
                draw_text("Test Text", color_black(), font_named("hara"), 24, 100.0, 100.0)
                refresh_screen()
                assert color_black() == get_pixel_from_window(test_window, 120.0, 110.0)
                assert color_white() == get_pixel_from_window(test_window, 90.0, 90.0)
                
    def test_draw_text_with_options_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
            clear_window(test_window, color_white())
            load_font("hara", "hara.ttf")
            with font_cleanup():
                draw_text_with_options("Test Text", color_black(), font_named("hara"), 24, 100.0, 100.0, option_defaults())
                refresh_screen()
                assert color_black() == get_pixel_from_window(test_window, 120.0, 110.0)
                assert color_white() == get_pixel_from_window(test_window, 90.0, 90.0)
                
    def test_draw_text_on_bitmap_font_as_string_integration():
        test_bitmap = create_bitmap("test_bitmap", 200, 200)
        with bitmap_cleanup():
            clear_bitmap(test_bitmap, color_white())
            load_font("hara", "hara.ttf")
            with font_cleanup():
                draw_text_on_bitmap_font_as_string(test_bitmap, "Test Text", color_black(), "hara", 24, 100.0, 100.0)
                assert color_black() == get_pixel_from_bitmap(test_bitmap, 120.0, 110.0)
                assert color_white() == get_pixel_from_bitmap(test_bitmap, 90.0, 90.0)
                
    def test_draw_text_on_bitmap_with_options_font_as_string_integration():
        test_bitmap = create_bitmap("test_bitmap", 200, 200)
        with bitmap_cleanup():
            clear_bitmap(test_bitmap, color_white())
            load_font("hara", "hara.ttf")
            with font_cleanup():
                draw_text_on_bitmap_with_options_font_as_string(test_bitmap, "Test Text", color_black(), "hara", 24, 100.0, 100.0, option_defaults())
                assert color_black() == get_pixel_from_bitmap(test_bitmap, 120.0, 110.0)
                assert color_white() == get_pixel_from_bitmap(test_bitmap, 90.0, 90.0)
                
    def test_draw_text_on_bitmap_no_font_no_size_integration():
        test_bitmap = create_bitmap("test_bitmap", 200, 200)
        with bitmap_cleanup():
            clear_bitmap(test_bitmap, color_white())
            draw_text_on_bitmap_no_font_no_size(test_bitmap, "Test Text", color_black(), 100.0, 100.0)
            assert color_black() == get_pixel_from_bitmap(test_bitmap, 105.0, 100.0)
            assert color_white() == get_pixel_from_bitmap(test_bitmap, 90.0, 90.0)
            
    def test_draw_text_on_bitmap_no_font_no_size_with_options_integration():
        test_bitmap = create_bitmap("test_bitmap", 200, 200)
        with bitmap_cleanup():
            clear_bitmap(test_bitmap, color_white())
            draw_text_on_bitmap_no_font_no_size_with_options(test_bitmap, "Test Text", color_black(), 100.0, 100.0, option_defaults())
            assert color_black() == get_pixel_from_bitmap(test_bitmap, 105.0, 100.0)
            assert color_white() == get_pixel_from_bitmap(test_bitmap, 90.0, 90.0)
            
    def test_draw_text_on_bitmap_integration():
        test_bitmap = create_bitmap("test_bitmap", 200, 200)
        with bitmap_cleanup():
            clear_bitmap(test_bitmap, color_white())
            load_font("hara", "hara.ttf")
            with font_cleanup():
                draw_text_on_bitmap(test_bitmap, "Test Text", color_black(), font_named("hara"), 24, 100.0, 100.0)
                assert color_black() == get_pixel_from_bitmap(test_bitmap, 120.0, 110.0)
                assert color_white() == get_pixel_from_bitmap(test_bitmap, 90.0, 90.0)
                
    def test_draw_text_on_bitmap_with_options_integration():
        test_bitmap = create_bitmap("test_bitmap", 200, 200)
        with bitmap_cleanup():
            clear_bitmap(test_bitmap, color_white())
            load_font("hara", "hara.ttf")
            with font_cleanup():
                draw_text_on_bitmap_with_options(test_bitmap, "Test Text", color_black(), font_named("hara"), 24, 100.0, 100.0, option_defaults())
                assert color_black() == get_pixel_from_bitmap(test_bitmap, 120.0, 110.0)
                assert color_white() == get_pixel_from_bitmap(test_bitmap, 90.0, 90.0)
                
    def test_draw_text_on_window_font_as_string_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
            clear_window(test_window, color_white())
            load_font("hara", "hara.ttf")
            with font_cleanup():
                draw_text_on_window_font_as_string(test_window, "Test Text", color_black(), "hara", 24, 100.0, 100.0)
                refresh_screen()
                assert color_black() == get_pixel_from_window(test_window, 120.0, 110.0)
                assert color_white() == get_pixel_from_window(test_window, 90.0, 90.0)
                
    def test_draw_text_on_window_with_options_font_as_string_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
            clear_window(test_window, color_white())
            load_font("hara", "hara.ttf")
            with font_cleanup():
                draw_text_on_window_with_options_font_as_string(test_window, "Test Text", color_black(), "hara", 24, 100.0, 100.0, option_defaults())
                refresh_screen()
                assert color_black() == get_pixel_from_window(test_window, 120.0, 110.0)
                assert color_white() == get_pixel_from_window(test_window, 90.0, 90.0)
                
    def test_draw_text_on_window_no_font_no_size_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
            clear_window(test_window, color_white())
            draw_text_on_window_no_font_no_size(test_window, "Test Text", color_black(), 100.0, 100.0)
            refresh_screen()
            assert color_black() == get_pixel_from_window(test_window, 105.0, 100.0)
            assert color_white() == get_pixel_from_window(test_window, 90.0, 90.0)
            
    def test_draw_text_on_window_no_font_no_size_with_options_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
            clear_window(test_window, color_white())
            draw_text_on_window_no_font_no_size_with_options(test_window, "Test Text", color_black(), 100.0, 100.0, option_defaults())
            refresh_screen()
            assert color_black() == get_pixel_from_window(test_window, 105.0, 100.0)
            assert color_white() == get_pixel_from_window(test_window, 90.0, 90.0)
            
    def test_draw_text_on_window_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
            clear_window(test_window, color_white())
            load_font("hara", "hara.ttf")
            with font_cleanup():
                test_font = font_named("hara")
                font_load_size(test_font, 24)
                draw_text_on_window(test_window, "Test Text", color_black(), test_font, 24, 100.0, 100.0)
                refresh_screen()
                assert color_black() == get_pixel_from_window(test_window, 120.0, 110.0)
                assert color_white() == get_pixel_from_window(test_window, 90.0, 90.0)
                
    def test_draw_text_on_window_with_options_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
            clear_window(test_window, color_white())
            test_font = load_font("test_font", "hara.ttf")
            with font_cleanup():
                draw_text_on_window_with_options(test_window, "Test Text", color_black(), test_font, 24, 100.0, 100.0, option_defaults())
                refresh_screen()
                assert color_black() == get_pixel_from_window(test_window, 120.0, 110.0)
                assert color_white() == get_pixel_from_window(test_window, 90.0, 90.0)
                
    def test_font_has_size_name_as_string_integration():
        load_font("hara", "hara.ttf")
        with font_cleanup():
            font_load_size_name_as_string("hara", 12)
            assert font_has_size_name_as_string("hara", 12)
            assert not font_has_size_name_as_string("nonexistent_font", 12)
            
    def test_font_has_size_integration():
        test_font = load_font("test_font", "hara.ttf")
        with font_cleanup():
            font_load_size(test_font, 12)
            assert font_has_size(test_font, 12)
            assert not font_has_size(test_font, 999)
            
    def test_font_load_size_name_as_string_integration():
        load_font("test_font", "hara.ttf")
        with font_cleanup():
            font_load_size_name_as_string("test_font", 12)
            assert font_has_size_name_as_string("test_font", 12)
            
    def test_font_load_size_integration():
        test_font = load_font("test_font", "hara.ttf")
        with font_cleanup():
            font_load_size(test_font, 12)
            assert font_has_size(test_font, 12)
            
    def test_font_named_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
            clear_window(test_window, color_white())
            load_font("hara", "hara.ttf")
            with font_cleanup():
                test_font = font_named("hara")
                draw_text("Test Text", color_black(), test_font, 24, 100.0, 100.0)
                refresh_screen()
                assert test_font is not None
                assert color_black() == get_pixel_from_window(test_window, 120.0, 110.0)
                assert color_white() == get_pixel_from_window(test_window, 90.0, 90.0)
                
    def test_free_all_fonts_integration():
        load_font("test_font", "hara.ttf")
        with font_cleanup():
            assert has_font_name_as_string("test_font")
            free_all_fonts()
            assert not has_font_name_as_string("test_font")
            
    def test_free_font_integration():
        test_font = load_font("test_font", "hara.ttf")
        with font_cleanup():
            assert has_font(test_font)
            free_font(test_font)
            assert not has_font(test_font)
            
    def test_get_font_style_name_as_string_integration():
        load_font("test_font", "hara.ttf")
        with font_cleanup():
            style = get_font_style_name_as_string("test_font")
            assert FontStyle.BoldFont == style
            
    def test_get_font_style_integration():
        test_font = load_font("test_font", "hara.ttf")
        with font_cleanup():
            style = get_font_style(test_font)
            assert FontStyle.BoldFont == style
            
    def test_get_system_font_integration():
        system_font = get_system_font()
        assert system_font is not None
        
    def test_has_font_integration():
        test_font = load_font("test_font", "hara.ttf")
        with font_cleanup():
            assert has_font(test_font)
            free_font(test_font)
            assert not has_font(test_font)
            
    def test_has_font_name_as_string_integration():
        load_font("test_font", "hara.ttf")
        with font_cleanup():
            assert has_font_name_as_string("test_font")
            assert not has_font_name_as_string("nonexistent_font")
            
    def test_load_font_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
            clear_window(test_window, color_white())
            test_font = load_font("test_font", "hara.ttf")
            with font_cleanup():
                draw_text_with_options("Test Text", color_black(), test_font, 24, 100.0, 100.0, option_defaults())
                refresh_screen()
                assert has_font_name_as_string("test_font")
                assert color_black() == get_pixel_from_window(test_window, 105.0, 105.0)
                
    def test_set_font_style_name_as_string_integration():
        load_font("test_font", "hara.ttf")
        with font_cleanup():
            set_font_style_name_as_string("test_font", FontStyle.BoldFont)
            assert FontStyle.BoldFont == get_font_style_name_as_string("test_font")
            
    def test_set_font_style_integration():
        test_font = load_font("test_font", "hara.ttf")
        with font_cleanup():
            set_font_style(test_font, FontStyle.BoldFont)
            assert FontStyle.BoldFont == get_font_style(test_font)
            
    def test_text_height_font_named_integration():
        load_font("test_font", "hara.ttf")
        with font_cleanup():
            font_load_size_name_as_string("test_font", 24)
            height = text_height_font_named("Test Text", "test_font", 24)
            assert height > 0
            assert height >= 24
            
    def test_text_height_integration():
        test_font = load_font("test_font", "hara.ttf")
        with font_cleanup():
            font_load_size(test_font, 24)
            height = text_height("Test Text", test_font, 24)
            assert height > 0
            assert height >= 24
            
    def test_text_width_font_named_integration():
        test_font = load_font("hara", "hara.ttf")
        with font_cleanup():
            font_load_size(test_font, 12)
            width = text_width_font_named("Test Text", "hara", 24)
            assert width > 0
            assert width >= text_height_font_named("Test Text", "hara", 24)
            
    def test_text_width_integration():
        test_font = load_font("test_font", "hara.ttf")
        with font_cleanup():
            font_load_size(test_font, 12)
            width = text_width("Test Text", test_font, 24)
            assert width > 0
            assert width >= text_height("Text Height", test_font, 24)
            
    def test_draw_triangle_record_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
            clear_window(test_window, color_white())
            triangle = triangle_from(point_at(100.0, 100.0), point_at(200.0, 200.0), point_at(150.0, 300.0))
            draw_triangle_record(color_black(), triangle)
            refresh_screen()
            assert color_black() == get_pixel_from_window(test_window, 100.0, 100.0)
            assert color_white() == get_pixel_from_window(test_window, 150.0, 200.0)
            
    def test_draw_triangle_record_with_options_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
            clear_window(test_window, color_white())
            triangle = triangle_from(point_at(100.0, 100.0), point_at(200.0, 200.0), point_at(150.0, 300.0))
            draw_triangle_record_with_options(color_black(), triangle, option_defaults())
            refresh_screen()
            assert color_black() == get_pixel_from_window(test_window, 100.0, 100.0)
            assert color_white() == get_pixel_from_window(test_window, 150.0, 200.0)
            
    def test_draw_triangle_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
            clear_window(test_window, color_white())
            draw_triangle(color_black(), 100.0, 100.0, 200.0, 300.0, 300.0, 100.0)
            refresh_screen()
            assert color_black() == get_pixel_from_window(test_window, 100.0, 100.0)
            assert color_white() == get_pixel_from_window(test_window, 200.0, 150.0)
            
    def test_draw_triangle_with_options_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
            clear_window(test_window, color_white())
            draw_triangle_with_options(color_black(), 100.0, 100.0, 200.0, 200.0, 150.0, 300.0, option_defaults())
            refresh_screen()
            assert color_black() == get_pixel_from_window(test_window, 100.0, 100.0)
            assert color_white() == get_pixel_from_window(test_window, 150.0, 200.0)
            
    def test_draw_triangle_on_bitmap_record_integration():
        test_bitmap = create_bitmap("test_bitmap", 100, 100)
        with bitmap_cleanup():
            clear_bitmap(test_bitmap, color_white())
            triangle = triangle_from(point_at(25.0, 25.0), point_at(75.0, 25.0), point_at(50.0, 75.0))
            draw_triangle_on_bitmap_record(test_bitmap, color_black(), triangle)
            assert color_black() == get_pixel_from_bitmap(test_bitmap, 25.0, 25.0)
            assert color_white() == get_pixel_from_bitmap(test_bitmap, 50.0, 50.0)
            
    def test_draw_triangle_on_bitmap_record_with_options_integration():
        test_bitmap = create_bitmap("test_bitmap", 100, 100)
        with bitmap_cleanup():
            clear_bitmap(test_bitmap, color_white())
            triangle = triangle_from(point_at(25.0, 25.0), point_at(75.0, 25.0), point_at(50.0, 75.0))
            draw_triangle_on_bitmap_record_with_options(test_bitmap, color_black(), triangle, option_defaults())
            assert color_black() == get_pixel_from_bitmap(test_bitmap, 25.0, 25.0)
            assert color_white() == get_pixel_from_bitmap(test_bitmap, 50.0, 50.0)
            
    def test_draw_triangle_on_bitmap_integration():
        test_bitmap = create_bitmap("test_bitmap", 100, 100)
        with bitmap_cleanup():
            clear_bitmap(test_bitmap, color_white())
            draw_triangle_on_bitmap(test_bitmap, color_black(), 25.0, 25.0, 75.0, 25.0, 50.0, 75.0)
            assert color_black() == get_pixel_from_bitmap(test_bitmap, 25.0, 25.0)
            assert color_white() == get_pixel_from_bitmap(test_bitmap, 50.0, 50.0)
            
    def test_draw_triangle_on_bitmap_with_options_integration():
        test_bitmap = create_bitmap("test_bitmap", 100, 100)
        with bitmap_cleanup():
            clear_bitmap(test_bitmap, color_white())
            draw_triangle_on_bitmap_with_options(test_bitmap, color_black(), 25.0, 25.0, 75.0, 25.0, 50.0, 75.0, option_defaults())
            assert color_black() == get_pixel_from_bitmap(test_bitmap, 25.0, 25.0)
            assert color_white() == get_pixel_from_bitmap(test_bitmap, 50.0, 50.0)
            
    def test_draw_triangle_on_window_record_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
            clear_window(test_window, color_white())
            triangle = triangle_from(point_at(100.0, 100.0), point_at(200.0, 200.0), point_at(150.0, 300.0))
            draw_triangle_on_window_record(test_window, color_black(), triangle)
            refresh_screen()
            assert color_black() == get_pixel_from_window(test_window, 100.0, 100.0)
            assert color_white() == get_pixel_from_window(test_window, 50.0, 50.0)
            
    def test_draw_triangle_on_window_record_with_options_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
            clear_window(test_window, color_white())
            triangle = triangle_from(point_at(100.0, 100.0), point_at(200.0, 200.0), point_at(150.0, 250.0))
            draw_triangle_on_window_record_with_options(test_window, color_black(), triangle, option_defaults())
            refresh_screen()
            assert color_black() == get_pixel_from_window(test_window, 150.0, 150.0)
            assert color_white() == get_pixel_from_window(test_window, 50.0, 50.0)
            
    def test_draw_triangle_on_window_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
            clear_window(test_window, color_white())
            draw_triangle_on_window(test_window, color_black(), 100.0, 100.0, 200.0, 300.0, 300.0, 100.0)
            refresh_screen()
            assert color_black() == get_pixel_from_window(test_window, 100.0, 100.0)
            assert color_white() == get_pixel_from_window(test_window, 50.0, 50.0)
            
    def test_draw_triangle_on_window_with_options_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
            clear_window(test_window, color_white())
            draw_triangle_on_window_with_options(test_window, color_black(), 100.0, 100.0, 200.0, 200.0, 150.0, 300.0, option_defaults())
            refresh_screen()
            assert color_black() == get_pixel_from_window(test_window, 100.0, 100.0)
            assert color_white() == get_pixel_from_window(test_window, 50.0, 50.0)
            
    def test_fill_triangle_record_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
            clear_window(test_window, color_white())
            triangle = triangle_from(point_at(100.0, 100.0), point_at(200.0, 300.0), point_at(300.0, 100.0))
            fill_triangle_record(color_black(), triangle)
            refresh_screen()
            assert color_black() == get_pixel_from_window(test_window, 200.0, 150.0)
            assert color_white() == get_pixel_from_window(test_window, 50.0, 50.0)
            
    def test_fill_triangle_record_with_options_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
            clear_window(test_window, color_white())
            triangle = triangle_from(point_at(100.0, 100.0), point_at(200.0, 300.0), point_at(300.0, 100.0))
            fill_triangle_record_with_options(color_black(), triangle, option_defaults())
            refresh_screen()
            assert color_black() == get_pixel_from_window(test_window, 200.0, 150.0)
            assert color_white() == get_pixel_from_window(test_window, 50.0, 50.0)
            
    def test_fill_triangle_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
            clear_window(test_window, color_white())
            fill_triangle(color_black(), 100.0, 100.0, 200.0, 300.0, 300.0, 100.0)
            refresh_screen()
            assert color_black() == get_pixel_from_window(test_window, 200.0, 150.0)
            assert color_white() == get_pixel_from_window(test_window, 50.0, 50.0)
            
    def test_fill_triangle_with_options_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
            clear_window(test_window, color_white())
            fill_triangle_with_options(color_red(), 100.0, 100.0, 200.0, 300.0, 300.0, 100.0, option_defaults())
            refresh_screen()
            assert color_red() == get_pixel_from_window(test_window, 150.0, 150.0)
            assert color_white() == get_pixel_from_window(test_window, 350.0, 150.0)
            
    def test_fill_triangle_on_bitmap_record_integration():
        test_bitmap = create_bitmap("test_bitmap", 100, 100)
        with bitmap_cleanup():
            clear_bitmap(test_bitmap, color_white())
            triangle = triangle_from(point_at(25.0, 25.0), point_at(75.0, 25.0), point_at(50.0, 75.0))
            fill_triangle_on_bitmap_record(test_bitmap, color_black(), triangle)
            assert color_black() == get_pixel_from_bitmap(test_bitmap, 50.0, 50.0)
            assert color_white() == get_pixel_from_bitmap(test_bitmap, 0.0, 0.0)
            
    def test_fill_triangle_on_bitmap_record_with_options_integration():
        test_bitmap = create_bitmap("test_bitmap", 100, 100)
        with bitmap_cleanup():
            clear_bitmap(test_bitmap, color_white())
            triangle = triangle_from(point_at(25.0, 25.0), point_at(75.0, 25.0), point_at(50.0, 75.0))
            fill_triangle_on_bitmap_record_with_options(test_bitmap, color_black(), triangle, option_defaults())
            assert color_black() == get_pixel_from_bitmap(test_bitmap, 50.0, 50.0)
            assert color_white() == get_pixel_from_bitmap(test_bitmap, 10.0, 10.0)
            
    def test_fill_triangle_on_bitmap_integration():
        test_bitmap = create_bitmap("test_bitmap", 100, 100)
        with bitmap_cleanup():
            clear_bitmap(test_bitmap, color_white())
            fill_triangle_on_bitmap(test_bitmap, color_black(), 25.0, 25.0, 75.0, 25.0, 50.0, 75.0)
            assert color_black() == get_pixel_from_bitmap(test_bitmap, 50.0, 50.0)
            assert color_white() == get_pixel_from_bitmap(test_bitmap, 0.0, 0.0)
            
    def test_fill_triangle_on_bitmap_with_options_integration():
        test_bitmap = create_bitmap("test_bitmap", 100, 100)
        with bitmap_cleanup():
            clear_bitmap(test_bitmap, color_white())
            fill_triangle_on_bitmap_with_options(test_bitmap, color_black(), 25.0, 25.0, 75.0, 25.0, 50.0, 75.0, option_defaults())
            assert color_black() == get_pixel_from_bitmap(test_bitmap, 50.0, 50.0)
            assert color_white() == get_pixel_from_bitmap(test_bitmap, 0.0, 0.0)
            
    def test_fill_triangle_on_window_record_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
            clear_window(test_window, color_white())
            triangle = triangle_from(point_at(100.0, 100.0), point_at(200.0, 300.0), point_at(300.0, 100.0))
            fill_triangle_on_window_record(test_window, color_black(), triangle)
            refresh_screen()
            assert color_black() == get_pixel_from_window(test_window, 200.0, 200.0)
            assert color_white() == get_pixel_from_window(test_window, 50.0, 50.0)
            
    def test_fill_triangle_on_window_record_with_options_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
            clear_window(test_window, color_white())
            triangle = triangle_from(point_at(100.0, 100.0), point_at(200.0, 300.0), point_at(300.0, 100.0))
            fill_triangle_on_window_record_with_options(test_window, color_black(), triangle, option_defaults())
            refresh_screen()
            assert color_black() == get_pixel_from_window(test_window, 200.0, 200.0)
            assert color_white() == get_pixel_from_window(test_window, 50.0, 50.0)
            
    def test_fill_triangle_on_window_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
            clear_window(test_window, color_white())
            fill_triangle_on_window(test_window, color_black(), 100.0, 100.0, 200.0, 300.0, 300.0, 100.0)
            refresh_screen()
            assert color_black() == get_pixel_from_window(test_window, 200.0, 200.0)
            assert color_white() == get_pixel_from_window(test_window, 50.0, 50.0)
            
    def test_fill_triangle_on_window_with_options_integration():
        test_window = open_window("Test Window", 800, 600)
        with window_cleanup():
            clear_window(test_window, color_white())
            fill_triangle_on_window_with_options(test_window, color_black(), 100.0, 100.0, 200.0, 300.0, 300.0, 100.0, option_defaults())
            refresh_screen()
            assert color_black() == get_pixel_from_window(test_window, 150.0, 150.0)
            assert color_white() == get_pixel_from_window(test_window, 350.0, 150.0)
            
