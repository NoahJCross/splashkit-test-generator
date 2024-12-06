import pytest
from splashkit import *


def test_CenterPoint_integration():
    test_circle = circle_at(100.0, 100.0, 50.0)
    test_center_point = center_point(test_circle)
    assert point_at(100.0, 100.0) == test_center_point


def test_CircleAt_integration():
    test_window = open_window("Test Window", 800, 600)
    test_circle = circle_at(point_at(400.0, 300.0), 50.0)
    draw_circle(color_black(), test_circle)
    refresh_screen()
    assert point_in_circle(point_at(400.0, 300.0), test_circle) is True
    close_window(test_window)


def test_CircleAtFromPoints_integration():
    test_window = open_window("Circle Test", 800, 600)
    test_circle = circle_at_from_points(400.0, 300.0, 50.0)
    draw_circle(color_black(), test_circle, option_defaults())
    refresh_screen()
    assert point_in_circle(point_at(400.0, 300.0), test_circle) is True
    close_window(test_window)


def test_CircleRadius_integration():
    test_circle = circle_at(100.0, 100.0, 50.0)
    test_radius = circle_radius(test_circle)
    assert test_radius == 50.0


def test_CircleTriangleIntersect_integration():
    test_circle = circle_at(100.0, 100.0, 50.0)
    test_triangle = triangle_from(point_at(50.0, 50.0), point_at(150.0, 50.0), point_at(100.0, 150.0))
    test_result = circle_triangle_intersect(test_circle, test_triangle)
    assert test_result is True


def test_CircleTriangleIntersectGetClosestPoint_integration():
    test_circle = circle_at(100.0, 100.0, 50.0)
    test_triangle = triangle_from(point_at(50.0, 50.0), point_at(150.0, 50.0), point_at(100.0, 150.0))
    test_result = circle_triangle_intersect_get_closest_point(test_circle, test_triangle, point_at(0.0, 0.0))
    assert test_result is True
    assert point_point_distance(center_point(test_circle), closest_point_on_triangle_from_circle(test_circle, test_triangle)) == circle_radius(test_circle)


def test_CircleX_integration():
    test_circle = circle_at(100.0, 100.0, 50.0)
    assert circle_x(test_circle) == 100.0


def test_CircleY_integration():
    test_circle = circle_at(100.0, 150.0, 50.0)
    assert circle_y(test_circle) == 150.0


def test_CirclesIntersect_integration():
    test_circle1 = circle_at(0.0, 0.0, 50.0)
    test_circle2 = circle_at(100.0, 0.0, 50.0)
    test_result1 = circles_intersect(test_circle1, test_circle2)
    assert test_result1 is False
    test_circle3 = circle_at(50.0, 0.0, 50.0)
    test_result2 = circles_intersect(test_circle1, test_circle3)
    assert test_result2 is True


def test_CirclesIntersectUsingValues_integration():
    test_intersect_result = circles_intersect_using_values(0.0, 0.0, 5.0, 10.0, 0.0, 5.0)
    assert test_intersect_result is True
    test_not_intersect_result = circles_intersect_using_values(0.0, 0.0, 5.0, 11.0, 0.0, 5.0)
    assert test_not_intersect_result is False


def test_ClosestPointOnCircle_integration():
    test_circle = circle_at(100.0, 100.0, 50.0)
    test_point = point_at(150.0, 100.0)
    test_closest_point = closest_point_on_circle(test_point, test_circle)
    assert point_point_distance(test_closest_point, test_point) == circle_radius(test_circle)


def test_ClosestPointOnLineFromCircle_integration():
    test_circle = circle_at(100.0, 100.0, 50.0)
    test_line = line_from(50.0, 50.0, 150.0, 150.0)
    test_closest_point = closest_point_on_line_from_circle(test_circle, test_line)
    assert point_on_line(test_closest_point, test_line) is True


def test_ClosestPointOnRectFromCircle_integration():
    test_circle = circle_at(100.0, 100.0, 50.0)
    test_rectangle = rectangle_from(150.0, 50.0, 100.0, 100.0)
    test_closest_point = closest_point_on_rect_from_circle(test_circle, test_rectangle)
    assert point_in_rectangle(test_closest_point, test_rectangle) is True
    assert point_point_distance(center_point(test_circle), test_closest_point) == circle_radius(test_circle)


def test_ClosestPointOnTriangleFromCircle_integration():
    test_circle = circle_at(100.0, 100.0, 50.0)
    test_triangle = triangle_from(point_at(50.0, 50.0), point_at(150.0, 50.0), point_at(100.0, 150.0))
    test_closest_point = closest_point_on_triangle_from_circle(test_circle, test_triangle)
    assert point_in_triangle(test_closest_point, test_triangle) is True


def test_DistantPointOnCircle_integration():
    test_circle = circle_at(100.0, 100.0, 50.0)
    test_point = point_at(100.0, 150.0)
    test_distant_point = distant_point_on_circle(test_point, test_circle)
    assert point_point_distance(test_point, test_distant_point) == circle_radius(test_circle)


def test_DistantPointOnCircleHeading_integration():
    test_circle = circle_at(100.0, 100.0, 50.0)
    test_point1 = point_at(150.0, 100.0)
    test_heading = vector_from_angle(180.0, 1.0)
    test_point2todo
    test_result = distant_point_on_circle_heading(test_point1, test_circle, test_heading, test_point2)
    assert test_result is True
    assert test_point1.x == 50.0
    assert test_point1.y == 100.0


def test_RayCircleIntersectDistance_integration():
    test_circle = circle_at(100.0, 100.0, 50.0)
    test_ray_origin = point_at(0.0, 0.0)
    test_ray_heading = vector_from_angle(45.0, 1.0)
    test_distance = ray_circle_intersect_distance(test_ray_origin, test_ray_heading, test_circle)
    assert 70 <= test_distance <= 71


def test_TangentPoints_integration():
    test_from_pt = point_at(100.0, 100.0)
    test_circle = circle_at(150.0, 150.0, 50.0)
    test_point1 = point_at(0.0, 0.0)
    test_point2 = point_at(0.0, 0.0)
    test_result = tangent_points(test_from_pt, test_circle, test_point1, test_point2)
    assert test_result is True
    assert point_at(0.0, 0.0) != point_at(0.0, 0.0)


def test_WidestPoints_integration():
    test_circle = circle_at(100.0, 100.0, 50.0)
    test_vector = vector_from_angle(45.0)
    test_point1todo
    test_point2todo
    test_points = widest_points(test_circle, test_vector, test_point1, test_point2)
    assert point_in_circle(point_at(circle_x(test_circle), circle_y(test_circle)), test_circle) is True
    assert point_in_circle(point_at(circle_x(test_circle), circle_y(test_circle)), test_circle) is True


def test_Cosine_integration():
    test_cosine_0 = cosine(0.0)
    assert test_cosine_0 == 1.0
    test_cosine_90 = cosine(90.0)
    assert test_cosine_90 == 0.0
    test_cosine_180 = cosine(180.0)
    assert test_cosine_180 == -1.0


def test_Sine_integration():
    test_sine_0 = sine(0.0)
    assert test_sine_0 == 0.0
    test_sine_90 = sine(90.0)
    assert test_sine_90 == 1.0
    test_sine_180 = sine(180.0)
    assert test_sine_180 == 0.0
    test_sine_270 = sine(270.0)
    assert test_sine_270 == -1.0


def test_Tangent_integration():
    test_tangent_result = tangent(45.0)
    assert 1.0 <= test_tangent_result <= 2.0


def test_ClosestPointOnLine_integration():
    test_line = line_from(point_at(0.0, 0.0), point_at(10.0, 10.0))
    test_closest_point = closest_point_on_line(point_at(5.0, 5.0), test_line)
    assert point_point_distance(point_at(5.0, 5.0), test_closest_point) == 0.0


def test_ClosestPointOnLines_integration():
    test_from_pt = point_at(0.0, 0.0)
    test_line1 = line_from(point_at(-10.0, 0.0), point_at(10.0, 0.0))
    test_line2 = line_from(point_at(0.0, -10.0), point_at(0.0, 10.0))
    test_closest_point = closest_point_on_lines(test_from_pt, {:value_type=>"list", :list_name=>"test_lines", :list_values=>["test_line1", "test_line2"]}, 0)
    assert point_point_distance(test_from_pt, test_closest_point) == 0.0


def test_LineFromPointToPoint_integration():
    test_start_point = point_at(0.0, 0.0)
    test_end_point = point_at(100.0, 100.0)
    test_line = line_from_point_to_point(test_start_point, test_end_point)
    assert line_length(test_line) == 141.421356


def test_LineFromStartWithOffset_integration():
    test_start_point = point_at(0.0, 0.0)
    test_offset_vector = vector_from_angle(45.0, 10.0)
    test_line = line_from_start_with_offset(test_start_point, test_offset_vector)
    assert point_on_line(point_at(0.0, 0.0), test_line) is True
    assert point_on_line(point_offset_by(test_start_point, test_offset_vector), test_line) is True


def test_LineFromVector_integration():
    test_vector = vector_from_angle(100.0, 50.0)
    test_line = line_from_vector(test_vector)
    assert test_line.start_point == point_at_origin()
    assert test_line.end_point == point_at(100.0, 50.0)


def test_LineFrom_integration():
    test_line = line_from(0.0, 0.0, 10.0, 10.0)
    assert line_length(test_line) == 14.1421356


def test_LineIntersectionPoint_integration():
    test_line1 = line_from(0.0, 0.0, 10.0, 10.0)
    test_line2 = line_from(10.0, 0.0, 0.0, 10.0)
    test_pointtodo
    test_intersection_result = line_intersection_point(test_line1, test_line2, test_point)
    assert test_intersection_result is True


def test_LineIntersectsCircle_integration():
    test_line = line_from(0.0, 0.0, 10.0, 10.0)
    test_circle = circle_at(5.0, 5.0, 3.0)
    test_result = line_intersects_circle(test_line, test_circle)
    assert test_result is True


def test_LineIntersectsLines_integration():
    test_line = line_from(0.0, 0.0, 10.0, 10.0)
    test_line1 = line_from(5.0, 5.0, 15.0, 15.0)
    test_line2 = line_from(20.0, 20.0, 30.0, 30.0)
    test_result = line_intersects_lines(test_line, {:value_type=>"list", :list_name=>"test_lines", :list_values=>["test_line1", "test_line2"]})
    assert test_result is True


def test_LineIntersectsRect_integration():
    test_rect = rectangle_from(0.0, 0.0, 100.0, 100.0)
    test_line = line_from(point_at(-50.0, 50.0), point_at(150.0, 50.0))
    assert line_intersects_rect(test_line, test_rect) is True
    test_line_outside = line_from(point_at(-50.0, 150.0), point_at(150.0, 150.0))
    assert line_intersects_rect(test_line_outside, test_rect) is False


def test_LineLength_integration():
    test_line = line_from(point_at(0.0, 0.0), point_at(3.0, 4.0))
    test_length = line_length(test_line)
    assert test_length == 5.0


def test_LineLengthSquared_integration():
    test_line = line_from(point_at(0.0, 0.0), point_at(3.0, 4.0))
    test_result = line_length_squared(test_line)
    assert test_result == 25.0


def test_LineMidPoint_integration():
    test_line = line_from(point_at(0.0, 0.0), point_at(100.0, 100.0))
    test_mid_point = line_mid_point(test_line)
    assert point_point_distance(test_mid_point, point_at(50.0, 50.0)) == 0.0


def test_LineNormal_integration():
    test_line = line_from(0.0, 0.0, 1.0, 1.0)
    test_normal = line_normal(test_line)
    assert test_normal.x == -1.0
    assert test_normal.y == 1.0


def test_LineToString_integration():
    test_line = line_from(point_at(0.0, 0.0), point_at(100.0, 100.0))
    test_line_string = line_to_string(test_line)
    assert test_line_string != ""


def test_LinesFromRectangle_integration():
    test_rectangle = rectangle_from(0.0, 0.0, 100.0, 100.0)
    test_lines = lines_from_rectangle(test_rectangle)
    assert size(test_lines) == 4


def test_LinesFromTriangle_integration():
    test_triangle = triangle_from(point_at(0.0, 0.0), point_at(100.0, 0.0), point_at(50.0, 86.6))
    test_lines = lines_from_triangle(test_triangle)
    assert size(test_lines) == 3


def test_LinesIntersect_integration():
    test_line1 = line_from(point_at(0.0, 0.0), point_at(10.0, 10.0))
    test_line2 = line_from(point_at(5.0, 0.0), point_at(5.0, 10.0))
    test_result = lines_intersect(test_line1, test_line2)
    assert test_result is True


def test_PointAt_integration():
    test_point = point_at(10.0, 20.0)
    assert test_point.x == 10.0
    assert test_point.y == 20.0


def test_PointAtOrigin_integration():
    test_point = point_at_origin()
    assert test_point.x == 0.0
    assert test_point.y == 0.0


def test_PointInCircle_integration():
    test_circle = circle_at(100.0, 100.0, 50.0)
    assert point_in_circle(point_at(100.0, 100.0), test_circle) is True
    assert point_in_circle(point_at(150.0, 100.0), test_circle) is True
    assert point_in_circle(point_at(200.0, 100.0), test_circle) is False


def test_PointInCircleWithValues_integration():
    test_result1 = point_in_circle_with_values(100.0, 100.0, 100.0, 100.0, 50.0)
    assert test_result1 is True
    test_result2 = point_in_circle_with_values(200.0, 100.0, 100.0, 100.0, 50.0)
    assert test_result2 is False


def test_PointInQuad_integration():
    test_quad = quad_from(point_at(0.0, 0.0), point_at(100.0, 0.0), point_at(100.0, 100.0), point_at(0.0, 100.0))
    assert point_in_quad(point_at(50.0, 50.0), test_quad) is True
    assert point_in_quad(point_at(150.0, 50.0), test_quad) is False


def test_PointInRectangle_integration():
    test_rectangle = rectangle_from(0.0, 0.0, 100.0, 100.0)
    test_point_inside = point_at(50.0, 50.0)
    test_point_outside = point_at(150.0, 150.0)
    assert point_in_rectangle(test_point_inside, test_rectangle) is True
    assert point_in_rectangle(test_point_outside, test_rectangle) is False


def test_PointInRectangleWithValues_integration():
    test_result_inside = point_in_rectangle_with_values(10.0, 10.0, 0.0, 0.0, 20.0, 20.0)
    assert test_result_inside is True
    test_result_outside = point_in_rectangle_with_values(25.0, 25.0, 0.0, 0.0, 20.0, 20.0)
    assert test_result_outside is False


def test_PointInTriangle_integration():
    test_triangle = triangle_from(point_at(0.0, 0.0), point_at(100.0, 0.0), point_at(50.0, 100.0))
    assert point_in_triangle(point_at(50.0, 50.0), test_triangle) is True
    assert point_in_triangle(point_at(150.0, 50.0), test_triangle) is False


def test_PointLineDistance_integration():
    test_point = point_at(0.0, 0.0)
    test_line = line_from(0.0, 0.0, 10.0, 10.0)
    test_distance = point_line_distance(test_point, test_line)
    assert test_distance == 0.0


def test_PointOffsetBy_integration():
    test_start_point = point_at(10.0, 20.0)
    test_offset = vector_from_angle(5.0, 10.0)
    test_result_point = point_offset_by(test_start_point, test_offset)
    assert test_start_point.x == 15.0
    assert test_result_point.x == 30.0


def test_PointOffsetFromOrigin_integration():
    test_vector = vector_from_angle(10.0, 20.0)
    test_point = point_offset_from_origin(test_vector)
    assert test_point.x == 10.0
    assert test_point.y == 20.0


def test_PointOnLine_integration():
    test_line = line_from(0.0, 0.0, 10.0, 10.0)
    test_point_on_line = point_at(5.0, 5.0)
    test_point_off_line = point_at(15.0, 15.0)
    assert point_on_line(test_point_on_line, test_line) is True
    assert point_on_line(test_point_off_line, test_line) is False


def test_PointOnLineWithProximity_integration():
    test_line = line_from(point_at(0.0, 0.0), point_at(10.0, 10.0))
    test_point_on_line = point_at(5.0, 5.0)
    test_point_near_line = point_at(5.1, 5.1)
    test_point_far_from_line = point_at(15.0, 15.0)
    assert point_on_line_with_proximity(test_point_on_line, test_line, 0.1) is True
    assert point_on_line_with_proximity(test_point_near_line, test_line, 0.2) is True
    assert point_on_line_with_proximity(test_point_far_from_line, test_line, 0.1) is False


def test_PointPointAngle_integration():
    test_point1 = point_at(0.0, 0.0)
    test_point2 = point_at(1.0, 0.0)
    test_angle = point_point_angle(test_point1, test_point2)
    assert test_angle == 0.0


def test_PointPointDistance_integration():
    test_point1 = point_at(0.0, 0.0)
    test_point2 = point_at(3.0, 4.0)
    test_distance = point_point_distance(test_point1, test_point2)
    assert test_distance == 5.0


def test_PointToString_integration():
    test_point = point_at(10.0, 20.0)
    test_string = point_to_string(test_point)
    assert test_string == "Point(10, 20)"


def test_RandomBitmapPoint_integration():
    test_bitmap = create_bitmap("test_bitmap", 100, 100)
    test_point = random_bitmap_point(test_bitmap)
    assert 0 <= test_point.x <= bitmap_width(test_bitmap)
    assert 0 <= test_point.y <= bitmap_height(test_bitmap)
    free_bitmap(test_bitmap)


def test_RandomScreenPoint_integration():
    test_window = open_window("Test Window", 800, 600)
    test_point = random_screen_point()
    refresh_screen()
    assert 0 <= test_point.x <= window_width(test_window)
    assert 0 <= test_point.y <= window_height(test_window)
    close_window(test_window)


def test_RandomWindowPoint_integration():
    test_window = open_window("Test Window", 800, 600)
    test_point = random_window_point(test_window)
    assert 0 <= test_point.x <= window_width(test_window)
    assert 0 <= test_point.y <= window_height(test_window)
    close_window(test_window)


def test_SamePoint_integration():
    test_point1 = point_at(10.0, 20.0)
    test_point2 = point_at(10.0, 20.0)
    test_point3 = point_at(10.0, 21.0)
    assert same_point(test_point1, test_point2) is True
    assert same_point(test_point1, test_point3) is False


def test_QuadFromPoints_integration():
    test_p1 = point_at(0.0, 0.0)
    test_p2 = point_at(100.0, 0.0)
    test_p3 = point_at(0.0, 100.0)
    test_p4 = point_at(100.0, 100.0)
    test_quad = quad_from_points(test_p1, test_p2, test_p3, test_p4)
    assert point_in_quad(point_at(50.0, 50.0), test_quad) is True


def test_QuadFromRectangle_integration():
    test_rectangle = rectangle_from(0.0, 0.0, 100.0, 100.0)
    test_quad = quad_from(test_rectangle)
    assert point_in_quad(point_at(50.0, 50.0), test_quad) is True
    assert point_in_quad(point_at(150.0, 150.0), test_quad) is False


def test_QuadFromRectangleWithTransformation_integration():
    test_rectangle = rectangle_from(0.0, 0.0, 100.0, 100.0)
    test_transform = rotation_matrix(45.0)
    test_quad = quad_from_rectangle_with_transformation(test_rectangle, test_transform)
    assert point_in_quad(point_at(50.0, 50.0), test_quad) is True
    assert point_in_quad(point_at(150.0, 150.0), test_quad) is False


def test_QuadFrom_integration():
    test_quad = quad_from(0.0, 0.0, 100.0, 0.0, 0.0, 100.0, 100.0, 100.0)
    assert point_in_quad(point_at(50.0, 50.0), test_quad) is True
    assert point_in_quad(point_at(150.0, 150.0), test_quad) is False


def test_QuadsIntersect_integration():
    test_quad1 = quad_from(point_at(0.0, 0.0), point_at(100.0, 0.0), point_at(0.0, 100.0), point_at(100.0, 100.0))
    test_quad2 = quad_from(point_at(50.0, 50.0), point_at(150.0, 50.0), point_at(50.0, 150.0), point_at(150.0, 150.0))
    test_result = quads_intersect(test_quad1, test_quad2)
    assert test_result is True


def test_SetQuadPoint_integration():
    test_quad = quad_from(point_at(0.0, 0.0), point_at(100.0, 0.0), point_at(0.0, 100.0), point_at(100.0, 100.0))
    set_quad_point(test_quad, 2, point_at(50.0, 150.0))
    assert point_in_quad(point_at(50.0, 150.0), test_quad) is True


def test_TrianglesFrom_integration():
    test_quad = quad_from(point_at(0.0, 0.0), point_at(100.0, 0.0), point_at(0.0, 100.0), point_at(100.0, 100.0))
    test_triangles = triangles_from(test_quad)
    assert size(test_triangles) == 2


def test_InsetRectangle_integration():
    test_rectangle = rectangle_from(0.0, 0.0, 100.0, 100.0)
    test_inset_rectangle = inset_rectangle(test_rectangle, 10.0)
    assert rectangle_left(test_inset_rectangle) == 10.0
    assert rectangle_top(test_inset_rectangle) == 10.0
    assert rectangle_right(test_inset_rectangle) == 90.0
    assert rectangle_bottom(test_inset_rectangle) == 90.0


def test_Intersection_integration():
    test_rect1 = rectangle_from(0.0, 0.0, 10.0, 10.0)
    test_rect2 = rectangle_from(5.0, 5.0, 10.0, 10.0)
    test_intersection = intersection(test_rect1, test_rect2)
    assert rectangle_left(test_intersection) == 5.0
    assert rectangle_top(test_intersection) == 5.0
    assert rectangle_right(test_intersection) == 10.0
    assert rectangle_bottom(test_intersection) == 10.0


def test_RectangleAroundCircle_integration():
    test_circle = circle_at(100.0, 100.0, 50.0)
    test_rectangle = rectangle_around_circle(test_circle)
    assert rectangle_left(test_rectangle) == 50.0
    assert rectangle_top(test_rectangle) == 50.0
    assert rectangle_right(test_rectangle) == 150.0
    assert rectangle_bottom(test_rectangle) == 150.0


def test_RectangleAroundLine_integration():
    test_line = line_from(point_at(10.0, 10.0), point_at(50.0, 50.0))
    test_rectangle = rectangle_around_line(test_line)
    assert point_in_rectangle(point_at(10.0, 10.0), test_rectangle) is True
    assert point_in_rectangle(point_at(50.0, 50.0), test_rectangle) is True


def test_RectangleAroundQuad_integration():
    test_quad = quad_from(point_at(0.0, 0.0), point_at(100.0, 0.0), point_at(0.0, 100.0), point_at(100.0, 100.0))
    test_rectangle = rectangle_around_quad(test_quad)
    assert rectangle_left(test_rectangle) == 0.0
    assert rectangle_top(test_rectangle) == 0.0
    assert rectangle_right(test_rectangle) == 100.0
    assert rectangle_bottom(test_rectangle) == 100.0


def test_RectangleAroundTriangle_integration():
    test_triangle = triangle_from(point_at(0.0, 0.0), point_at(100.0, 0.0), point_at(50.0, 100.0))
    test_rectangle = rectangle_around_triangle(test_triangle)
    assert rectangle_left(test_rectangle) == 0.0
    assert rectangle_top(test_rectangle) == 0.0
    assert rectangle_right(test_rectangle) == 100.0
    assert rectangle_bottom(test_rectangle) == 100.0


def test_RectangleBottom_integration():
    test_rectangle = rectangle_from(10.0, 20.0, 50.0, 60.0)
    assert rectangle_bottom(test_rectangle) == 80.0


def test_RectangleCenter_integration():
    test_rectangle = rectangle_from(point_at(0.0, 0.0), 100.0, 100.0)
    test_center_point = rectangle_center(test_rectangle)
    assert point_point_distance(point_at(50.0, 50.0), test_center_point) == 0.0


def test_RectangleFromPointAndSize_integration():
    test_point = point_at(10.0, 20.0)
    test_rectangle = rectangle_from_point_and_size(test_point, 50.0, 30.0)
    assert rectangle_left(test_rectangle) == 10.0
    assert rectangle_top(test_rectangle) == 20.0
    assert rectangle_right(test_rectangle) == 60.0
    assert rectangle_bottom(test_rectangle) == 50.0


def test_RectangleFromPoints_integration():
    test_point1 = point_at(0.0, 0.0)
    test_point2 = point_at(100.0, 100.0)
    test_rectangle = rectangle_from(test_point1, test_point2)
    assert rectangle_left(test_rectangle) == 0.0
    assert rectangle_top(test_rectangle) == 0.0
    assert rectangle_right(test_rectangle) == 100.0
    assert rectangle_bottom(test_rectangle) == 100.0


def test_RectangleFrom_integration():
    test_rectangle = rectangle_from(10.0, 20.0, 50.0, 30.0)
    assert rectangle_left(test_rectangle) == 10.0
    assert rectangle_top(test_rectangle) == 20.0
    assert rectangle_right(test_rectangle) == 60.0
    assert rectangle_bottom(test_rectangle) == 50.0


def test_RectangleLeft_integration():
    test_rectangle = rectangle_from(10.0, 20.0, 50.0, 60.0)
    test_left = rectangle_left(test_rectangle)
    assert test_left == 10.0


def test_RectangleOffsetBy_integration():
    test_rectangle = rectangle_from(10.0, 10.0, 50.0, 50.0)
    test_offset_rectangle = rectangle_offset_by(test_rectangle, vector_from_angle(20.0, 30.0))
    assert rectangle_left(test_offset_rectangle) == 30.0
    assert rectangle_top(test_offset_rectangle) == 40.0


def test_RectangleRight_integration():
    test_rectangle = rectangle_from(10.0, 20.0, 50.0, 60.0)
    assert rectangle_right(test_rectangle) == 60.0


def test_RectangleToString_integration():
    test_rectangle = rectangle_from(10.0, 20.0, 30.0, 40.0)
    test_string = rectangle_to_string(test_rectangle)
    assert test_string == "Rectangle(x: 10, y: 20, width: 30, height: 40)"


def test_RectangleTop_integration():
    test_rectangle = rectangle_from(10.0, 20.0, 50.0, 60.0)
    test_top = rectangle_top(test_rectangle)
    assert test_top == 20.0


def test_RectanglesIntersect_integration():
    test_rect1 = rectangle_from(0.0, 0.0, 10.0, 10.0)
    test_rect2 = rectangle_from(5.0, 5.0, 10.0, 10.0)
    test_result = rectangles_intersect(test_rect1, test_rect2)
    assert test_result is True


def test_TriangleBarycenter_integration():
    test_triangle = triangle_from(point_at(0.0, 0.0), point_at(100.0, 0.0), point_at(50.0, 86.6))
    test_barycenter = triangle_barycenter(test_triangle)
    assert test_barycenter.x == 50.0
    assert test_barycenter.y == 28.866666666666667


def test_TriangleFrom_integration():
    test_point1 = point_at(0.0, 0.0)
    test_point2 = point_at(100.0, 0.0)
    test_point3 = point_at(50.0, 100.0)
    test_triangle = triangle_from(test_point1, test_point2, test_point3)
    assert point_in_triangle(point_at(50.0, 50.0), test_triangle) is True


def test_TriangleFromFromCoordinates_integration():
    test_triangle = triangle_from__from_coordinates(0.0, 0.0, 100.0, 0.0, 50.0, 100.0)
    assert point_in_triangle(point_at(50.0, 50.0), test_triangle) is True
    assert point_in_triangle(point_at(150.0, 150.0), test_triangle) is False


def test_TriangleRectangleIntersect_integration():
    test_triangle = triangle_from(point_at(0.0, 0.0), point_at(100.0, 0.0), point_at(50.0, 100.0))
    test_rectangle = rectangle_from(point_at(40.0, 40.0), 60.0, 60.0)
    test_result = triangle_rectangle_intersect(test_triangle, test_rectangle)
    assert test_result is True


def test_TriangleToString_integration():
    test_triangle = triangle_from(point_at(0.0, 0.0), point_at(100.0, 0.0), point_at(50.0, 100.0))
    test_triangle_string = triangle_to_string(test_triangle)
    assert test_triangle_string != ""


def test_TrianglesIntersect_integration():
    test_triangle1 = triangle_from(point_at(0.0, 0.0), point_at(2.0, 0.0), point_at(1.0, 2.0))
    test_triangle2 = triangle_from(point_at(1.0, 0.0), point_at(3.0, 0.0), point_at(2.0, 2.0))
    test_result = triangles_intersect(test_triangle1, test_triangle2)
    assert test_result is True

