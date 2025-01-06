import pytest
from splashkit import *
from ..helpers import *
import contextlib
class TestCamera:
    def test_camera_position_integration():
        open_window("Test Window 1", 800, 600)
        with window_cleanup():
            test_camera_position = camera_position()
            assert 0.0 == test_camera_position.x
            assert 0.0 == test_camera_position.y
            
    def test_camera_x_integration():
        open_window("Test Window 2", 800, 600)
        with window_cleanup():
            set_camera_position(point_at(100.0, 100.0))
            assert 100.0 == camera_x()
            
    def test_camera_y_integration():
        open_window("Test Window 3", 800, 600)
        with window_cleanup():
            set_camera_position(point_at(100.0, 200.0))
            assert 200.0 == camera_y()
            
    def test_center_camera_on_vector_integration():
        open_window("Test Window 4", 800, 600)
        with window_cleanup():
            test_bitmap = create_bitmap("Test Bitmap 1", 100, 100)
            with bitmap_cleanup():
                test_sprite = create_sprite(test_bitmap)
                with sprite_cleanup():
                    sprite_set_position(test_sprite, point_at(100.0, 100.0))
                    center_camera_on_vector(test_sprite, vector_from_angle(50.0, 50.0))
                    assert point_at(-267.8606182336807, -161.69777810573578) == camera_position()
                    
    def test_center_camera_on_integration():
        open_window("Test Window 5", 800, 600)
        with window_cleanup():
            test_bitmap = create_bitmap("Test Bitmap 2", 100, 100)
            with bitmap_cleanup():
                test_sprite = create_sprite(test_bitmap)
                with sprite_cleanup():
                    sprite_set_position(test_sprite, point_at(100.0, 100.0))
                    center_camera_on(test_sprite, 0.0, 0.0)
                    assert point_at(-300.0, -200.0) == camera_position()
                    
    def test_move_camera_by_vector_integration():
        open_window("Test Window 6", 800, 600)
        with window_cleanup():
            test_vector = vector_from_angle(0.0, 100.0)
            move_camera_to(0.0, 0.0)
            move_camera_by_vector(test_vector)
            assert 100.0 == camera_x()
            assert 0.0 == camera_y()
            
    def test_move_camera_by_integration():
        open_window("Test Window 7", 800, 600)
        with window_cleanup():
            move_camera_to(0.0, 0.0)
            move_camera_by(100.0, 100.0)
            assert 100.0 == camera_x()
            assert 100.0 == camera_y()
            
    def test_move_camera_to_point_integration():
        open_window("Test Window 8", 800, 600)
        with window_cleanup():
            move_camera_to_point(point_at(100.0, 100.0))
            assert point_at(100.0, 100.0) == camera_position()
            
    def test_move_camera_to_integration():
        open_window("Test Window 9", 800, 600)
        with window_cleanup():
            move_camera_to(100.0, 100.0)
            assert 100.0 == camera_x()
            assert 100.0 == camera_y()
            
    def test_point_in_window_integration():
        test_window = open_window("Test Window 10", 800, 600)
        with window_cleanup():
            test_point = point_at(400.0, 300.0)
            assert point_in_window(test_window, test_point)
            test_point_outside = point_at(1000.0, 1000.0)
            assert not point_in_window(test_window, test_point_outside)
            
    def test_point_on_screen_integration():
        open_window("Test Window 11", 800, 600)
        with window_cleanup():
            test_point = point_at(400.0, 300.0)
            assert point_on_screen(test_point)
            test_point_outside = point_at(1000.0, 1000.0)
            assert not point_on_screen(test_point_outside)
            
    def test_rect_in_window_integration():
        test_window = open_window("Test Window 12", 800, 600)
        with window_cleanup():
            set_camera_x(0.0)
            set_camera_y(0.0)
            test_rectangle = rectangle_from(0.0, 0.0, 100.0, 100.0)
            assert rect_in_window(test_window, test_rectangle)
            test_rectangle_outside = rectangle_from(1000.0, 1000.0, 100.0, 100.0)
            assert not rect_in_window(test_window, test_rectangle_outside)
            
    def test_rect_on_screen_integration():
        open_window("Test Window 13", 800, 600)
        with window_cleanup():
            test_rectangle = rectangle_from(0.0, 0.0, 100.0, 100.0)
            assert rect_on_screen(test_rectangle)
            move_camera_to(1000.0, 1000.0)
            assert not rect_on_screen(test_rectangle)
            
    def test_screen_center_integration():
        open_window("Test Window 14", 800, 600)
        with window_cleanup():
            set_camera_x(0.0)
            set_camera_y(0.0)
            test_center = screen_center()
            assert 400.0 == test_center.x
            assert 300.0 == test_center.y
            
    def test_screen_rectangle_integration():
        open_window("Test Window 15", 800, 600)
        with window_cleanup():
            test_rectangle = screen_rectangle()
            assert 800.0 == test_rectangle.width
            assert 600.0 == test_rectangle.height
            
    def test_set_camera_position_integration():
        open_window("Test Window 16", 800, 600)
        with window_cleanup():
            set_camera_position(point_at(100.0, 100.0))
            assert point_at(100.0, 100.0) == camera_position()
            
    def test_set_camera_x_integration():
        open_window("Test Window 17", 800, 600)
        with window_cleanup():
            set_camera_x(100.0)
            assert 100.0 == camera_x()
            
    def test_set_camera_y_integration():
        open_window("Test Window 18", 800, 600)
        with window_cleanup():
            set_camera_y(100.0)
            assert 100.0 == camera_y()
            
    def test_to_screen_point_integration():
        open_window("Test Window 19", 800, 600)
        with window_cleanup():
            set_camera_position(point_at(100.0, 100.0))
            test_screen_point = to_screen_point(point_at(150.0, 150.0))
            assert 50.0 == test_screen_point.x
            assert 50.0 == test_screen_point.y
            
    def test_to_screen_rectangle_integration():
        open_window("Test Window 20", 800, 600)
        with window_cleanup():
            test_rectangle = rectangle_from(100.0, 100.0, 200.0, 200.0)
            screen_rectangle = to_screen_rectangle(test_rectangle)
            assert to_screen_x(100.0) == rectangle_left(screen_rectangle)
            assert to_screen_y(100.0) == rectangle_top(screen_rectangle)
            
    def test_to_screen_x_integration():
        open_window("Test Window 21", 800, 600)
        with window_cleanup():
            set_camera_x(100.0)
            test_screen_x = to_screen_x(150.0)
            assert 50.0 == test_screen_x
            
    def test_to_screen_y_integration():
        open_window("Test Window 22", 800, 600)
        with window_cleanup():
            set_camera_y(100.0)
            test_screen_y = to_screen_y(150.0)
            assert 50.0 == test_screen_y
            
    def test_to_world_integration():
        open_window("Test Window 23", 800, 600)
        with window_cleanup():
            set_camera_position(point_at(100.0, 100.0))
            test_world_point = to_world(point_at(400.0, 300.0))
            assert 500.0 == test_world_point.x
            assert 400.0 == test_world_point.y
            
    def test_to_world_x_integration():
        open_window("Test Window 24", 800, 600)
        with window_cleanup():
            set_camera_position(point_at(100.0, 100.0))
            test_world_x = to_world_x(400.0)
            assert 500.0 == test_world_x
            
    def test_to_world_y_integration():
        open_window("Test Window 25", 800, 600)
        with window_cleanup():
            set_camera_position(point_at(100.0, 100.0))
            test_world_y = to_world_y(300.0)
            assert 400.0 == test_world_y
            
    def test_vector_world_to_screen_integration():
        test_vector1 = vector_world_to_screen()
        assert vector_from_angle(0.0, 0.0) == test_vector1
        move_camera_to(100.0, 100.0)
        test_vector2 = vector_world_to_screen()
        test_vector_to = vector_to(-100.0, -100.0)
        assert test_vector_to.x == test_vector2.x
        assert test_vector_to.y == test_vector2.y
        
    def test_window_area_integration():
        test_window = open_window("Test Window 26", 800, 600)
        with window_cleanup():
            test_area = window_area(test_window)
            assert 800.0 == test_area.width
            assert 600.0 == test_area.height
            
