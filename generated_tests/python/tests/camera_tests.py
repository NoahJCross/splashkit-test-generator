import pytest
from splashkit import *


def test_CameraPosition_integration():
    test_window = open_window("Test Window", 800, 600)
    test_camera_position = camera_position()
    assert test_camera_position.x == 0.0
    assert test_camera_position.y == 0.0
    close_window(test_window)


def test_CameraX_integration():
    test_window = open_window("Test Window", 800, 600)
    set_camera_position(point_at(100.0, 100.0))
    assert 100.0 == camera_x()
    close_window(test_window)


def test_CameraY_integration():
    test_window = open_window("Test Window", 800, 600)
    set_camera_position(point_at(100.0, 200.0))
    assert 200.0 == camera_y()
    close_window(test_window)


def test_CenterCameraOnVector_integration():
    test_window = open_window("Test Window", 800, 600)
    test_sprite = create_sprite("test_sprite")
    sprite_set_position(test_sprite, point_at(100.0, 100.0))
    center_camera_on_vector(test_sprite, vector_from_angle(50.0, 50.0))
    assert point_at(50.0, 50.0) == camera_position()
    free_sprite(test_sprite)
    close_window(test_window)


def test_CenterCameraOn_integration():
    test_window = open_window("Test Window", 800, 600)
    test_sprite = create_sprite("test_sprite")
    sprite_set_position(test_sprite, point_at(100.0, 100.0))
    center_camera_on(test_sprite, 0.0, 0.0)
    assert point_at(50.0, 50.0) == camera_position()
    free_sprite(test_sprite)
    close_window(test_window)


def test_MoveCameraByVector_integration():
    test_window = open_window("Test Window", 800, 600)
    test_vector = vector_from_angle(0.0, 100.0)
    move_camera_by_vector(test_vector)
    assert 100.0 == camera_x()
    assert 100.0 == camera_y()
    close_window(test_window)


def test_MoveCameraBy_integration():
    test_window = open_window("Test Window", 800, 600)
    move_camera_by(100.0, 100.0)
    assert 100.0 == camera_x()
    assert 100.0 == camera_y()
    close_window(test_window)


def test_MoveCameraToPoint_integration():
    test_window = open_window("Test Window", 800, 600)
    move_camera_to_point(point_at(100.0, 100.0))
    assert point_at(100.0, 100.0) == camera_position()
    close_window(test_window)


def test_MoveCameraTo_integration():
    test_window = open_window("Test Window", 800, 600)
    move_camera_to(100.0, 100.0)
    assert 100.0 == camera_x()
    assert 100.0 == camera_y()
    close_window(test_window)


def test_PointInWindow_integration():
    test_window = open_window("Test Window", 800, 600)
    test_point = point_at(400, 300)
    assert point_in_window(test_window, test_point) is True
    test_point_outside = point_at(1000, 1000)
    assert point_in_window(test_window, test_point_outside) is False
    close_window(test_window)


def test_PointOnScreen_integration():
    test_window = open_window("Test Window", 800, 600)
    test_point = point_at(400.0, 300.0)
    assert point_on_screen(test_point) is True
    test_point_outside = point_at(1000.0, 1000.0)
    assert point_on_screen(test_point_outside) is False
    close_window(test_window)


def test_RectInWindow_integration():
    test_window = open_window("Test Window", 800, 600)
    test_rectangle = rectangle_from(0, 0, 100, 100)
    assert rect_in_window(test_window, test_rectangle) is True
    test_rectangle_outside = rectangle_from(1000, 1000, 100, 100)
    assert rect_in_window(test_window, test_rectangle_outside) is False
    close_window(test_window)


def test_RectOnScreen_integration():
    test_window = open_window("Test Window", 800, 600)
    test_rectangle = rectangle_from(0, 0, 100, 100)
    assert rect_on_screen(test_rectangle) is True
    move_camera_to(1000, 1000)
    assert rect_on_screen(test_rectangle) is False
    close_window(test_window)


def test_ScreenCenter_integration():
    test_window = open_window("Test Window", 800, 600)
    test_center = screen_center()
    assert test_center == todo()
    assert test_center == todo()
    close_window(test_window)


def test_ScreenRectangle_integration():
    test_window = open_window("Test Window", 800, 600)
    test_rectangle = screen_rectangle()
    assert 800 == test_rectangle.width
    assert 600 == test_rectangle.height
    close_window(test_window)


def test_SetCameraPosition_integration():
    test_window = open_window("Test Window", 800, 600)
    set_camera_position(point_at(100.0, 100.0))
    assert point_at(100.0, 100.0) == camera_position()
    close_window(test_window)


def test_SetCameraX_integration():
    test_window = open_window("Test Window", 800, 600)
    set_camera_x(100.0)
    assert 100.0 == camera_x()
    close_window(test_window)


def test_SetCameraY_integration():
    test_window = open_window("Test Window", 800, 600)
    set_camera_y(100.0)
    assert 100.0 == camera_y()
    close_window(test_window)


def test_ToScreenPoint_integration():
    test_window = open_window("Test Window", 800, 600)
    set_camera_position(point_at(100.0, 100.0))
    test_screen_point = to_screen_point(point_at(150.0, 150.0))
    assert test_screen_point == todo()
    assert test_screen_point == todo()
    close_window(test_window)


def test_ToScreenRectangle_integration():
    test_window = open_window("Test Window", 800, 600)
    test_rectangle = rectangle_from(100.0, 100.0, 200.0, 200.0)
    screen_rectangle = to_screen_rectangle(test_rectangle)
    assert to_screen_x(100.0) == rectangle_left(screen_rectangle)
    assert to_screen_y(100.0) == rectangle_top(screen_rectangle)
    close_window(test_window)


def test_ToScreenX_integration():
    set_camera_x(100.0)
    test_screen_x = to_screen_x(150.0)
    assert 50.0 == test_screen_x


def test_ToScreenY_integration():
    test_window = open_window("Test Window", 800, 600)
    set_camera_position(point_at(100.0, 100.0))
    test_screen_y = to_screen_y(150.0)
    assert 50.0 == test_screen_y
    close_window(test_window)


def test_ToWorld_integration():
    test_window = open_window("Test Window", 800, 600)
    set_camera_position(point_at(100.0, 100.0))
    test_world_point = to_world(point_at(400.0, 300.0))
    assert test_world_point == todo()
    assert test_world_point == todo()
    close_window(test_window)


def test_ToWorldX_integration():
    test_window = open_window("Test Window", 800, 600)
    set_camera_position(point_at(100.0, 100.0))
    test_world_x = to_world_x(400.0)
    assert camera_x() == test_world_x
    close_window(test_window)


def test_ToWorldY_integration():
    test_window = open_window("Test Window", 800, 600)
    set_camera_position(point_at(100.0, 100.0))
    test_world_y = to_world_y(300.0)
    assert 400.0 == test_world_y
    close_window(test_window)


def test_VectorWorldToScreen_integration():
    test_vector = vector_world_to_screen()
    assert vector_from_angle(0.0, 0.0) != test_vector


def test_WindowArea_integration():
    test_window = open_window("Test Window", 800, 600)
    test_area = window_area(test_window)
    assert 800 == test_area.width
    assert 600 == test_area.height
    close_window(test_window)

