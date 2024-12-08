import pytest
from splashkit import *


def test_CameraPosition_integration():
    test_window = open_window("Test Window", 800, 600)
    test_camera_position = camera_position()
    assert 0.0 == test_camera_position.x
    assert 0.0 == test_camera_position.y
    close_window(test_window)


def test_CameraX_integration():
    test_window = open_window("Test Window", 800, 600)
    set_camera_position(point_at(100.0, 100.0))
    assert camera_x() == 100.0
    close_window(test_window)


def test_CameraY_integration():
    test_window = open_window("Test Window", 800, 600)
    set_camera_position(point_at(100.0, 200.0))
    assert camera_y() == 200.0
    close_window(test_window)


def test_CenterCameraOnVector_integration():
    test_window = open_window("Test Window", 800, 600)
    test_sprite = create_sprite("test_sprite")
    sprite_set_position(test_sprite, point_at(100.0, 100.0))
    center_camera_on_vector(test_sprite, vector_from_angle(50.0, 50.0))
    assert camera_position() == point_at(50.0, 50.0)
    free_sprite(test_sprite)
    close_window(test_window)


def test_CenterCameraOn_integration():
    test_window = open_window("Test Window", 800, 600)
    test_sprite = create_sprite("test_sprite")
    sprite_set_position(test_sprite, point_at(100.0, 100.0))
    center_camera_on(test_sprite, 0.0, 0.0)
    assert camera_position() == point_at(50.0, 50.0)
    free_sprite(test_sprite)
    close_window(test_window)


def test_MoveCameraByVector_integration():
    test_window = open_window("Test Window", 800, 600)
    test_vector = vector_from_angle(0.0, 100.0)
    move_camera_by_vector(test_vector)
    assert camera_x() == 100.0
    assert camera_y() == 100.0
    close_window(test_window)


def test_MoveCameraBy_integration():
    test_window = open_window("Test Window", 800, 600)
    move_camera_by(100.0, 100.0)
    assert camera_x() == 100.0
    assert camera_y() == 100.0
    close_window(test_window)


def test_MoveCameraToPoint_integration():
    test_window = open_window("Test Window", 800, 600)
    move_camera_to_point(point_at(100.0, 100.0))
    assert camera_position() == point_at(100.0, 100.0)
    close_window(test_window)


def test_MoveCameraTo_integration():
    test_window = open_window("Test Window", 800, 600)
    move_camera_to(100.0, 100.0)
    assert camera_x() == 100.0
    assert camera_y() == 100.0
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
    assert todo() == test_center
    assert todo() == test_center
    close_window(test_window)


def test_ScreenRectangle_integration():
    test_window = open_window("Test Window", 800, 600)
    test_rectangle = screen_rectangle()
    assert test_rectangle.width == 800
    assert test_rectangle.height == 600
    close_window(test_window)


def test_SetCameraPosition_integration():
    test_window = open_window("Test Window", 800, 600)
    set_camera_position(point_at(100.0, 100.0))
    assert camera_position() == point_at(100.0, 100.0)
    close_window(test_window)


def test_SetCameraX_integration():
    test_window = open_window("Test Window", 800, 600)
    set_camera_x(100.0)
    assert camera_x() == 100.0
    close_window(test_window)


def test_SetCameraY_integration():
    test_window = open_window("Test Window", 800, 600)
    set_camera_y(100.0)
    assert camera_y() == 100.0
    close_window(test_window)


def test_ToScreenPoint_integration():
    test_window = open_window("Test Window", 800, 600)
    set_camera_position(point_at(100.0, 100.0))
    test_screen_point = to_screen_point(point_at(150.0, 150.0))
    assert todo() == test_screen_point
    assert todo() == test_screen_point
    close_window(test_window)


def test_ToScreenRectangle_integration():
    test_window = open_window("Test Window", 800, 600)
    test_rectangle = rectangle_from(100.0, 100.0, 200.0, 200.0)
    screen_rectangle = to_screen_rectangle(test_rectangle)
    assert rectangle_left(screen_rectangle) == to_screen_x(100.0)
    assert rectangle_top(screen_rectangle) == to_screen_y(100.0)
    close_window(test_window)


def test_ToScreenX_integration():
    set_camera_x(100.0)
    test_screen_x = to_screen_x(150.0)
    assert test_screen_x == 50.0


def test_ToScreenY_integration():
    test_window = open_window("Test Window", 800, 600)
    set_camera_position(point_at(100.0, 100.0))
    test_screen_y = to_screen_y(150.0)
    assert test_screen_y == 50.0
    close_window(test_window)


def test_ToWorld_integration():
    test_window = open_window("Test Window", 800, 600)
    set_camera_position(point_at(100.0, 100.0))
    test_world_point = to_world(point_at(400.0, 300.0))
    assert todo() == test_world_point
    assert todo() == test_world_point
    close_window(test_window)


def test_ToWorldX_integration():
    test_window = open_window("Test Window", 800, 600)
    set_camera_position(point_at(100.0, 100.0))
    test_world_x = to_world_x(400.0)
    assert test_world_x == camera_x()
    close_window(test_window)


def test_ToWorldY_integration():
    test_window = open_window("Test Window", 800, 600)
    set_camera_position(point_at(100.0, 100.0))
    test_world_y = to_world_y(300.0)
    assert test_world_y == 400.0
    close_window(test_window)


def test_VectorWorldToScreen_integration():
    test_vector = vector_world_to_screen()
    assert test_vector != vector_from_angle(0.0, 0.0)


def test_WindowArea_integration():
    test_window = open_window("Test Window", 800, 600)
    test_area = window_area(test_window)
    assert test_area.width == 800
    assert test_area.height == 600
    close_window(test_window)

