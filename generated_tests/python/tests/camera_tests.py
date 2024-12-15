import pytest
from splashkit import *

class TestCamera:

def test_camera_position_integration():
    test_window = open_window("Test Window", 800, 600)
    test_camera_position = camera_position()
    assert 0.0 == test_camera_position.x
    assert 0.0 == test_camera_position.y
    close_window(test_window)


def test_camera_x_integration():
    test_window = open_window("Test Window", 800, 600)
    set_camera_position(point_at(100.0, 100.0))
    assert 100.0 == camera_x()
    close_window(test_window)


def test_camera_y_integration():
    test_window = open_window("Test Window", 800, 600)
    set_camera_position(point_at(100.0, 200.0))
    assert 200.0 == camera_y()
    close_window(test_window)


def test_center_camera_on_vector_integration():
    test_window = open_window("Test Window", 800, 600)
    test_sprite = create_sprite_with_bitmap_named("test_sprite")
    sprite_set_position(test_sprite, point_at(100.0, 100.0))
    center_camera_on_vector(test_sprite, vector_from_angle(50.0, 50.0))
    assert point_at(-267.8606182336807, -161.69777810573578) == camera_position()
    free_sprite(test_sprite)
    close_window(test_window)


def test_center_camera_on_integration():
    test_window = open_window("Test Window", 800, 600)
    test_sprite = create_sprite_with_bitmap_named("test_sprite")
    sprite_set_position(test_sprite, point_at(100.0, 100.0))
    center_camera_on(test_sprite, 0.0, 0.0)
    assert point_at(-300.0, -200.0) == camera_position()
    free_sprite(test_sprite)
    close_window(test_window)


def test_move_camera_by_vector_integration():
    test_window = open_window("Test Window", 800, 600)
    test_vector = vector_from_angle(0.0, 100.0)
    move_camera_by_vector(test_vector)
    assert 100.0 == camera_x()
    assert 0.0 == camera_y()
    close_window(test_window)


def test_move_camera_by_integration():
    test_window = open_window("Test Window", 800, 600)
    move_camera_by(100.0, 100.0)
    assert 100.0 == camera_x()
    assert 100.0 == camera_y()
    close_window(test_window)


def test_move_camera_to_point_integration():
    test_window = open_window("Test Window", 800, 600)
    move_camera_to_point(point_at(100.0, 100.0))
    assert point_at(100.0, 100.0) == camera_position()
    close_window(test_window)


def test_move_camera_to_integration():
    test_window = open_window("Test Window", 800, 600)
    move_camera_to(100.0, 100.0)
    assert 100.0 == camera_x()
    assert 100.0 == camera_y()
    close_window(test_window)


def test_point_in_window_integration():
    test_window = open_window("Test Window", 800, 600)
    test_point = point_at(400.0, 300.0)
    assert point_in_window(test_window, test_point)
    test_point_outside = point_at(1000.0, 1000.0)
    assert not point_in_window(test_window, test_point_outside)
    close_window(test_window)


def test_point_on_screen_integration():
    test_window = open_window("Test Window", 800, 600)
    test_point = point_at(400.0, 300.0)
    assert point_on_screen(test_point)
    test_point_outside = point_at(1000.0, 1000.0)
    assert not point_on_screen(test_point_outside)
    close_window(test_window)


def test_rect_in_window_integration():
    test_window = open_window("Test Window", 800, 600)
    set_camera_x(0.0)
    set_camera_y(0.0)
    test_rectangle = rectangle_from(0.0, 0.0, 100.0, 100.0)
    assert rect_in_window(test_window, test_rectangle)
    test_rectangle_outside = rectangle_from(1000.0, 1000.0, 100.0, 100.0)
    assert not rect_in_window(test_window, test_rectangle_outside)
    close_window(test_window)


def test_rect_on_screen_integration():
    test_window = open_window("Test Window", 800, 600)
    test_rectangle = rectangle_from(0.0, 0.0, 100.0, 100.0)
    assert rect_on_screen(test_rectangle)
    move_camera_to(1000.0, 1000.0)
    assert not rect_on_screen(test_rectangle)
    close_window(test_window)


def test_screen_center_integration():
    test_window = open_window("Test Window", 800, 600)
    set_camera_x(0.0)
    set_camera_y(0.0)
    test_center = screen_center()
    assert 400.0 == test_center.x
    assert 300.0 == test_center.y
    close_window(test_window)


def test_screen_rectangle_integration():
    test_window = open_window("Test Window", 800, 600)
    test_rectangle = screen_rectangle()
    assert 800.0 == test_rectangle.width
    assert 600.0 == test_rectangle.height
    close_window(test_window)


def test_set_camera_position_integration():
    test_window = open_window("Test Window", 800, 600)
    set_camera_position(point_at(100.0, 100.0))
    assert point_at(100.0, 100.0) == camera_position()
    close_window(test_window)


def test_set_camera_x_integration():
    test_window = open_window("Test Window", 800, 600)
    set_camera_x(100.0)
    assert 100.0 == camera_x()
    close_window(test_window)


def test_set_camera_y_integration():
    test_window = open_window("Test Window", 800, 600)
    set_camera_y(100.0)
    assert 100.0 == camera_y()
    close_window(test_window)


def test_to_screen_point_integration():
    test_window = open_window("Test Window", 800, 600)
    set_camera_position(point_at(100.0, 100.0))
    test_screen_point = to_screen_point(point_at(150.0, 150.0))
    assert 50.0 == test_screen_point.x
    assert 50.0 == test_screen_point.y
    close_window(test_window)


def test_to_screen_rectangle_integration():
    test_window = open_window("Test Window", 800, 600)
    test_rectangle = rectangle_from(100.0, 100.0, 200.0, 200.0)
    screen_rectangle = to_screen_rectangle(test_rectangle)
    assert to_screen_x(100.0) == rectangle_left(screen_rectangle)
    assert to_screen_y(100.0) == rectangle_top(screen_rectangle)
    close_window(test_window)


def test_to_screen_x_integration():
    set_camera_x(100.0)
    test_screen_x = to_screen_x(150.0)
    assert 50.0 == test_screen_x


def test_to_screen_y_integration():
    test_window = open_window("Test Window", 800, 600)
    set_camera_position(point_at(100.0, 100.0))
    test_screen_y = to_screen_y(150.0)
    assert 50.0 == test_screen_y
    close_window(test_window)


def test_to_world_integration():
    test_window = open_window("Test Window", 800, 600)
    set_camera_position(point_at(100.0, 100.0))
    test_world_point = to_world(point_at(400.0, 300.0))
    assert 500.0 == test_world_point.x
    assert 400.0 == test_world_point.y
    close_window(test_window)


def test_to_world_x_integration():
    test_window = open_window("Test Window", 800, 600)
    set_camera_position(point_at(100.0, 100.0))
    test_world_x = to_world_x(400.0)
    assert 500.0 == test_world_x
    close_window(test_window)


def test_to_world_y_integration():
    test_window = open_window("Test Window", 800, 600)
    set_camera_position(point_at(100.0, 100.0))
    test_world_y = to_world_y(300.0)
    assert 400.0 == test_world_y
    close_window(test_window)


def test_vector_world_to_screen_integration():
    test_vector = vector_world_to_screen()
    assert vector_from_angle(0.0, 0.0) != test_vector


def test_window_area_integration():
    test_window = open_window("Test Window", 800, 600)
    test_area = window_area(test_window)
    assert 800.0 == test_area.width
    assert 600.0 == test_area.height
    close_window(test_window)

