import pytest
from splashkit import *


def test_CenterPoint_integration():
    test_circle = CircleAt(100.0, 100.0, 50.0)
    test_center_point = CenterPoint(test_circle)
    assert PointAt(100.0, 100.0) == test_center_point


def test_CircleAt_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_circle = CircleAt(PointAt(400.0, 300.0), 50.0)
    DrawCircle(ColorBlack(), test_circle)
    RefreshScreen()
    assert PointInCircle(PointAt(400.0, 300.0), test_circle) is True
    CloseWindow(test_window)


def test_CircleAtFromPoints_integration():
    test_window = OpenWindow("Circle Test", 800, 600)
    test_circle = CircleAtFromPoints(400.0, 300.0, 50.0)
    DrawCircle(ColorBlack(), test_circle, OptionDefaults())
    RefreshScreen()
    assert PointInCircle(PointAt(400.0, 300.0), test_circle) is True
    CloseWindow(test_window)


def test_CircleRadius_integration():
    test_circle = CircleAt(100.0, 100.0, 50.0)
    test_radius = CircleRadius(test_circle)
    assert test_radius == 50.0


def test_CircleTriangleIntersect_integration():
    test_circle = CircleAt(100.0, 100.0, 50.0)
    test_triangle = TriangleFrom(PointAt(50.0, 50.0), PointAt(150.0, 50.0), PointAt(100.0, 150.0))
    test_result = CircleTriangleIntersect(test_circle, test_triangle)
    assert test_result is True


def test_CircleTriangleIntersectGetClosestPoint_integration():
    test_circle = CircleAt(100.0, 100.0, 50.0)
    test_triangle = TriangleFrom(PointAt(50.0, 50.0), PointAt(150.0, 50.0), PointAt(100.0, 150.0))
    test_result = CircleTriangleIntersectGetClosestPoint(test_circle, test_triangle, PointAt(0.0, 0.0))
    assert test_result is True
    assert PointPointDistance(CenterPoint(test_circle), ClosestPointOnTriangleFromCircle(test_circle, test_triangle)) == CircleRadius(test_circle)


def test_CircleX_integration():
    test_circle = CircleAt(100.0, 100.0, 50.0)
    assert CircleX(test_circle) == 100.0


def test_CircleY_integration():
    test_circle = CircleAt(100.0, 150.0, 50.0)
    assert CircleY(test_circle) == 150.0


def test_CirclesIntersect_integration():
    test_circle1 = CircleAt(0.0, 0.0, 50.0)
    test_circle2 = CircleAt(100.0, 0.0, 50.0)
    test_result1 = CirclesIntersect(test_circle1, test_circle2)
    assert test_result1 is False
    test_circle3 = CircleAt(50.0, 0.0, 50.0)
    test_result2 = CirclesIntersect(test_circle1, test_circle3)
    assert test_result2 is True


def test_CirclesIntersectUsingValues_integration():
    test_intersect_result = CirclesIntersectUsingValues(0.0, 0.0, 5.0, 10.0, 0.0, 5.0)
    assert test_intersect_result is True
    test_not_intersect_result = CirclesIntersectUsingValues(0.0, 0.0, 5.0, 11.0, 0.0, 5.0)
    assert test_not_intersect_result is False


def test_ClosestPointOnCircle_integration():
    test_circle = CircleAt(100.0, 100.0, 50.0)
    test_point = PointAt(150.0, 100.0)
    test_closest_point = ClosestPointOnCircle(test_point, test_circle)
    assert PointPointDistance(test_closest_point, test_point) == CircleRadius(test_circle)


def test_ClosestPointOnLineFromCircle_integration():
    test_circle = CircleAt(100.0, 100.0, 50.0)
    test_line = LineFrom(50.0, 50.0, 150.0, 150.0)
    test_closest_point = ClosestPointOnLineFromCircle(test_circle, test_line)
    assert PointOnLine(test_closest_point, test_line) is True


def test_ClosestPointOnRectFromCircle_integration():
    test_circle = CircleAt(100.0, 100.0, 50.0)
    test_rectangle = RectangleFrom(150.0, 50.0, 100.0, 100.0)
    test_closest_point = ClosestPointOnRectFromCircle(test_circle, test_rectangle)
    assert PointInRectangle(test_closest_point, test_rectangle) is True
    assert PointPointDistance(CenterPoint(test_circle), test_closest_point) == CircleRadius(test_circle)


def test_ClosestPointOnTriangleFromCircle_integration():
    test_circle = CircleAt(100.0, 100.0, 50.0)
    test_triangle = TriangleFrom(PointAt(50.0, 50.0), PointAt(150.0, 50.0), PointAt(100.0, 150.0))
    test_closest_point = ClosestPointOnTriangleFromCircle(test_circle, test_triangle)
    assert PointInTriangle(test_closest_point, test_triangle) is True


def test_DistantPointOnCircle_integration():
    test_circle = CircleAt(100.0, 100.0, 50.0)
    test_point = PointAt(100.0, 150.0)
    test_distant_point = DistantPointOnCircle(test_point, test_circle)
    assert PointPointDistance(test_point, test_distant_point) == CircleRadius(test_circle)


def test_DistantPointOnCircleHeading_integration():
    test_circle = CircleAt(100.0, 100.0, 50.0)
    test_point1 = PointAt(150.0, 100.0)
    test_heading = VectorFromAngle(180.0, 1.0)
    test_point2todo
    test_result = DistantPointOnCircleHeading(test_point1, test_circle, test_heading, test_point2)
    assert test_result is True
    assert test_point1.x == 50.0
    assert test_point1.y == 100.0


def test_RayCircleIntersectDistance_integration():
    test_circle = CircleAt(100.0, 100.0, 50.0)
    test_ray_origin = PointAt(0.0, 0.0)
    test_ray_heading = VectorFromAngle(45.0, 1.0)
    test_distance = RayCircleIntersectDistance(test_ray_origin, test_ray_heading, test_circle)
    assert 70 <= test_distance <= 71


def test_TangentPoints_integration():
    test_from_pt = PointAt(100.0, 100.0)
    test_circle = CircleAt(150.0, 150.0, 50.0)
    test_point1 = PointAt(0.0, 0.0)
    test_point2 = PointAt(0.0, 0.0)
    test_result = TangentPoints(test_from_pt, test_circle, test_point1, test_point2)
    assert test_result is True
    assert PointAt(0.0, 0.0) != PointAt(0.0, 0.0)


def test_WidestPoints_integration():
    test_circle = CircleAt(100.0, 100.0, 50.0)
    test_vector = VectorFromAngle(45.0)
    test_point1todo
    test_point2todo
    test_points = WidestPoints(test_circle, test_vector, test_point1, test_point2)
    assert PointInCircle(PointAt(CircleX(test_circle), CircleY(test_circle)), test_circle) is True
    assert PointInCircle(PointAt(CircleX(test_circle), CircleY(test_circle)), test_circle) is True


def test_Cosine_integration():
    test_cosine_0 = Cosine(0.0)
    assert test_cosine_0 == 1.0
    test_cosine_90 = Cosine(90.0)
    assert test_cosine_90 == 0.0
    test_cosine_180 = Cosine(180.0)
    assert test_cosine_180 == -1.0


def test_Sine_integration():
    test_sine_0 = Sine(0.0)
    assert test_sine_0 == 0.0
    test_sine_90 = Sine(90.0)
    assert test_sine_90 == 1.0
    test_sine_180 = Sine(180.0)
    assert test_sine_180 == 0.0
    test_sine_270 = Sine(270.0)
    assert test_sine_270 == -1.0


def test_Tangent_integration():
    test_tangent_result = Tangent(45.0)
    assert 1.0 <= test_tangent_result <= 2.0


def test_ClosestPointOnLine_integration():
    test_line = LineFrom(PointAt(0.0, 0.0), PointAt(10.0, 10.0))
    test_closest_point = ClosestPointOnLine(PointAt(5.0, 5.0), test_line)
    assert PointPointDistance(PointAt(5.0, 5.0), test_closest_point) == 0.0


def test_ClosestPointOnLines_integration():
    test_from_pt = PointAt(0.0, 0.0)
    test_line1 = LineFrom(PointAt(-10.0, 0.0), PointAt(10.0, 0.0))
    test_line2 = LineFrom(PointAt(0.0, -10.0), PointAt(0.0, 10.0))
    test_closest_point = ClosestPointOnLines(test_from_pt, {:value_type=>"list", :list_name=>"test_lines", :list_values=>["test_line1", "test_line2"]}, 0)
    assert PointPointDistance(test_from_pt, test_closest_point) == 0.0


def test_LineFromPointToPoint_integration():
    test_start_point = PointAt(0.0, 0.0)
    test_end_point = PointAt(100.0, 100.0)
    test_line = LineFromPointToPoint(test_start_point, test_end_point)
    assert LineLength(test_line) == 141.421356


def test_LineFromStartWithOffset_integration():
    test_start_point = PointAt(0.0, 0.0)
    test_offset_vector = VectorFromAngle(45.0, 10.0)
    test_line = LineFromStartWithOffset(test_start_point, test_offset_vector)
    assert PointOnLine(PointAt(0.0, 0.0), test_line) is True
    assert PointOnLine(PointOffsetBy(test_start_point, test_offset_vector), test_line) is True


def test_LineFromVector_integration():
    test_vector = VectorFromAngle(100.0, 50.0)
    test_line = LineFromVector(test_vector)
    assert test_line.start_point == PointAtOrigin()
    assert test_line.end_point == PointAt(100.0, 50.0)


def test_LineFrom_integration():
    test_line = LineFrom(0.0, 0.0, 10.0, 10.0)
    assert LineLength(test_line) == 14.1421356


def test_LineIntersectionPoint_integration():
    test_line1 = LineFrom(0.0, 0.0, 10.0, 10.0)
    test_line2 = LineFrom(10.0, 0.0, 0.0, 10.0)
    test_pointtodo
    test_intersection_result = LineIntersectionPoint(test_line1, test_line2, test_point)
    assert test_intersection_result is True


def test_LineIntersectsCircle_integration():
    test_line = LineFrom(0.0, 0.0, 10.0, 10.0)
    test_circle = CircleAt(5.0, 5.0, 3.0)
    test_result = LineIntersectsCircle(test_line, test_circle)
    assert test_result is True


def test_LineIntersectsLines_integration():
    test_line = LineFrom(0.0, 0.0, 10.0, 10.0)
    test_line1 = LineFrom(5.0, 5.0, 15.0, 15.0)
    test_line2 = LineFrom(20.0, 20.0, 30.0, 30.0)
    test_result = LineIntersectsLines(test_line, {:value_type=>"list", :list_name=>"test_lines", :list_values=>["test_line1", "test_line2"]})
    assert test_result is True


def test_LineIntersectsRect_integration():
    test_rect = RectangleFrom(0.0, 0.0, 100.0, 100.0)
    test_line = LineFrom(PointAt(-50.0, 50.0), PointAt(150.0, 50.0))
    assert LineIntersectsRect(test_line, test_rect) is True
    test_line_outside = LineFrom(PointAt(-50.0, 150.0), PointAt(150.0, 150.0))
    assert LineIntersectsRect(test_line_outside, test_rect) is False


def test_LineLength_integration():
    test_line = LineFrom(PointAt(0.0, 0.0), PointAt(3.0, 4.0))
    test_length = LineLength(test_line)
    assert test_length == 5.0


def test_LineLengthSquared_integration():
    test_line = LineFrom(PointAt(0.0, 0.0), PointAt(3.0, 4.0))
    test_result = LineLengthSquared(test_line)
    assert test_result == 25.0


def test_LineMidPoint_integration():
    test_line = LineFrom(PointAt(0.0, 0.0), PointAt(100.0, 100.0))
    test_mid_point = LineMidPoint(test_line)
    assert PointPointDistance(test_mid_point, PointAt(50.0, 50.0)) == 0.0


def test_LineNormal_integration():
    test_line = LineFrom(0.0, 0.0, 1.0, 1.0)
    test_normal = LineNormal(test_line)
    assert test_normal.x == -1.0
    assert test_normal.y == 1.0


def test_LineToString_integration():
    test_line = LineFrom(PointAt(0.0, 0.0), PointAt(100.0, 100.0))
    test_line_string = LineToString(test_line)
    assert test_line_string != ""


def test_LinesFromRectangle_integration():
    test_rectangle = RectangleFrom(0.0, 0.0, 100.0, 100.0)
    test_lines = LinesFromRectangle(test_rectangle)
    assert Size(test_lines) == 4


def test_LinesFromTriangle_integration():
    test_triangle = TriangleFrom(PointAt(0.0, 0.0), PointAt(100.0, 0.0), PointAt(50.0, 86.6))
    test_lines = LinesFromTriangle(test_triangle)
    assert Size(test_lines) == 3


def test_LinesIntersect_integration():
    test_line1 = LineFrom(PointAt(0.0, 0.0), PointAt(10.0, 10.0))
    test_line2 = LineFrom(PointAt(5.0, 0.0), PointAt(5.0, 10.0))
    test_result = LinesIntersect(test_line1, test_line2)
    assert test_result is True


def test_PointAt_integration():
    test_point = PointAt(10.0, 20.0)
    assert test_point.x == 10.0
    assert test_point.y == 20.0


def test_PointAtOrigin_integration():
    test_point = PointAtOrigin()
    assert test_point.x == 0.0
    assert test_point.y == 0.0


def test_PointInCircle_integration():
    test_circle = CircleAt(100.0, 100.0, 50.0)
    assert PointInCircle(PointAt(100.0, 100.0), test_circle) is True
    assert PointInCircle(PointAt(150.0, 100.0), test_circle) is True
    assert PointInCircle(PointAt(200.0, 100.0), test_circle) is False


def test_PointInCircleWithValues_integration():
    test_result1 = PointInCircleWithValues(100.0, 100.0, 100.0, 100.0, 50.0)
    assert test_result1 is True
    test_result2 = PointInCircleWithValues(200.0, 100.0, 100.0, 100.0, 50.0)
    assert test_result2 is False


def test_PointInQuad_integration():
    test_quad = QuadFrom(PointAt(0.0, 0.0), PointAt(100.0, 0.0), PointAt(100.0, 100.0), PointAt(0.0, 100.0))
    assert PointInQuad(PointAt(50.0, 50.0), test_quad) is True
    assert PointInQuad(PointAt(150.0, 50.0), test_quad) is False


def test_PointInRectangle_integration():
    test_rectangle = RectangleFrom(0.0, 0.0, 100.0, 100.0)
    test_point_inside = PointAt(50.0, 50.0)
    test_point_outside = PointAt(150.0, 150.0)
    assert PointInRectangle(test_point_inside, test_rectangle) is True
    assert PointInRectangle(test_point_outside, test_rectangle) is False


def test_PointInRectangleWithValues_integration():
    test_result_inside = PointInRectangleWithValues(10.0, 10.0, 0.0, 0.0, 20.0, 20.0)
    assert test_result_inside is True
    test_result_outside = PointInRectangleWithValues(25.0, 25.0, 0.0, 0.0, 20.0, 20.0)
    assert test_result_outside is False


def test_PointInTriangle_integration():
    test_triangle = TriangleFrom(PointAt(0.0, 0.0), PointAt(100.0, 0.0), PointAt(50.0, 100.0))
    assert PointInTriangle(PointAt(50.0, 50.0), test_triangle) is True
    assert PointInTriangle(PointAt(150.0, 50.0), test_triangle) is False


def test_PointLineDistance_integration():
    test_point = PointAt(0.0, 0.0)
    test_line = LineFrom(0.0, 0.0, 10.0, 10.0)
    test_distance = PointLineDistance(test_point, test_line)
    assert test_distance == 0.0


def test_PointOffsetBy_integration():
    test_start_point = PointAt(10.0, 20.0)
    test_offset = VectorFromAngle(5.0, 10.0)
    test_result_point = PointOffsetBy(test_start_point, test_offset)
    assert test_start_point.x == 15.0
    assert test_result_point.x == 30.0


def test_PointOffsetFromOrigin_integration():
    test_vector = VectorFromAngle(10.0, 20.0)
    test_point = PointOffsetFromOrigin(test_vector)
    assert test_point.x == 10.0
    assert test_point.y == 20.0


def test_PointOnLine_integration():
    test_line = LineFrom(0.0, 0.0, 10.0, 10.0)
    test_point_on_line = PointAt(5.0, 5.0)
    test_point_off_line = PointAt(15.0, 15.0)
    assert PointOnLine(test_point_on_line, test_line) is True
    assert PointOnLine(test_point_off_line, test_line) is False


def test_PointOnLineWithProximity_integration():
    test_line = LineFrom(PointAt(0.0, 0.0), PointAt(10.0, 10.0))
    test_point_on_line = PointAt(5.0, 5.0)
    test_point_near_line = PointAt(5.1, 5.1)
    test_point_far_from_line = PointAt(15.0, 15.0)
    assert PointOnLineWithProximity(test_point_on_line, test_line, 0.1) is True
    assert PointOnLineWithProximity(test_point_near_line, test_line, 0.2) is True
    assert PointOnLineWithProximity(test_point_far_from_line, test_line, 0.1) is False


def test_PointPointAngle_integration():
    test_point1 = PointAt(0.0, 0.0)
    test_point2 = PointAt(1.0, 0.0)
    test_angle = PointPointAngle(test_point1, test_point2)
    assert test_angle == 0.0


def test_PointPointDistance_integration():
    test_point1 = PointAt(0.0, 0.0)
    test_point2 = PointAt(3.0, 4.0)
    test_distance = PointPointDistance(test_point1, test_point2)
    assert test_distance == 5.0


def test_PointToString_integration():
    test_point = PointAt(10.0, 20.0)
    test_string = PointToString(test_point)
    assert test_string == "Point(10, 20)"


def test_RandomBitmapPoint_integration():
    test_bitmap = CreateBitmap("test_bitmap", 100, 100)
    test_point = RandomBitmapPoint(test_bitmap)
    assert 0 <= test_point.x <= BitmapWidth(test_bitmap)
    assert 0 <= test_point.y <= BitmapHeight(test_bitmap)
    FreeBitmap(test_bitmap)


def test_RandomScreenPoint_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_point = RandomScreenPoint()
    RefreshScreen()
    assert 0 <= test_point.x <= WindowWidth(test_window)
    assert 0 <= test_point.y <= WindowHeight(test_window)
    CloseWindow(test_window)


def test_RandomWindowPoint_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_point = RandomWindowPoint(test_window)
    assert 0 <= test_point.x <= WindowWidth(test_window)
    assert 0 <= test_point.y <= WindowHeight(test_window)
    CloseWindow(test_window)


def test_SamePoint_integration():
    test_point1 = PointAt(10.0, 20.0)
    test_point2 = PointAt(10.0, 20.0)
    test_point3 = PointAt(10.0, 21.0)
    assert SamePoint(test_point1, test_point2) is True
    assert SamePoint(test_point1, test_point3) is False


def test_QuadFromPoints_integration():
    test_p1 = PointAt(0.0, 0.0)
    test_p2 = PointAt(100.0, 0.0)
    test_p3 = PointAt(0.0, 100.0)
    test_p4 = PointAt(100.0, 100.0)
    test_quad = QuadFromPoints(test_p1, test_p2, test_p3, test_p4)
    assert PointInQuad(PointAt(50.0, 50.0), test_quad) is True


def test_QuadFromRectangle_integration():
    test_rectangle = RectangleFrom(0.0, 0.0, 100.0, 100.0)
    test_quad = QuadFrom(test_rectangle)
    assert PointInQuad(PointAt(50.0, 50.0), test_quad) is True
    assert PointInQuad(PointAt(150.0, 150.0), test_quad) is False


def test_QuadFromRectangleWithTransformation_integration():
    test_rectangle = RectangleFrom(0.0, 0.0, 100.0, 100.0)
    test_transform = RotationMatrix(45.0)
    test_quad = QuadFromRectangleWithTransformation(test_rectangle, test_transform)
    assert PointInQuad(PointAt(50.0, 50.0), test_quad) is True
    assert PointInQuad(PointAt(150.0, 150.0), test_quad) is False


def test_QuadFrom_integration():
    test_quad = QuadFrom(0.0, 0.0, 100.0, 0.0, 0.0, 100.0, 100.0, 100.0)
    assert PointInQuad(PointAt(50.0, 50.0), test_quad) is True
    assert PointInQuad(PointAt(150.0, 150.0), test_quad) is False


def test_QuadsIntersect_integration():
    test_quad1 = QuadFrom(PointAt(0.0, 0.0), PointAt(100.0, 0.0), PointAt(0.0, 100.0), PointAt(100.0, 100.0))
    test_quad2 = QuadFrom(PointAt(50.0, 50.0), PointAt(150.0, 50.0), PointAt(50.0, 150.0), PointAt(150.0, 150.0))
    test_result = QuadsIntersect(test_quad1, test_quad2)
    assert test_result is True


def test_SetQuadPoint_integration():
    test_quad = QuadFrom(PointAt(0.0, 0.0), PointAt(100.0, 0.0), PointAt(0.0, 100.0), PointAt(100.0, 100.0))
    SetQuadPoint(test_quad, 2, PointAt(50.0, 150.0))
    assert PointInQuad(PointAt(50.0, 150.0), test_quad) is True


def test_TrianglesFrom_integration():
    test_quad = QuadFrom(PointAt(0.0, 0.0), PointAt(100.0, 0.0), PointAt(0.0, 100.0), PointAt(100.0, 100.0))
    test_triangles = TrianglesFrom(test_quad)
    assert Size(test_triangles) == 2


def test_InsetRectangle_integration():
    test_rectangle = RectangleFrom(0.0, 0.0, 100.0, 100.0)
    test_inset_rectangle = InsetRectangle(test_rectangle, 10.0)
    assert RectangleLeft(test_inset_rectangle) == 10.0
    assert RectangleTop(test_inset_rectangle) == 10.0
    assert RectangleRight(test_inset_rectangle) == 90.0
    assert RectangleBottom(test_inset_rectangle) == 90.0


def test_Intersection_integration():
    test_rect1 = RectangleFrom(0.0, 0.0, 10.0, 10.0)
    test_rect2 = RectangleFrom(5.0, 5.0, 10.0, 10.0)
    test_intersection = Intersection(test_rect1, test_rect2)
    assert RectangleLeft(test_intersection) == 5.0
    assert RectangleTop(test_intersection) == 5.0
    assert RectangleRight(test_intersection) == 10.0
    assert RectangleBottom(test_intersection) == 10.0


def test_RectangleAroundCircle_integration():
    test_circle = CircleAt(100.0, 100.0, 50.0)
    test_rectangle = RectangleAroundCircle(test_circle)
    assert RectangleLeft(test_rectangle) == 50.0
    assert RectangleTop(test_rectangle) == 50.0
    assert RectangleRight(test_rectangle) == 150.0
    assert RectangleBottom(test_rectangle) == 150.0


def test_RectangleAroundLine_integration():
    test_line = LineFrom(PointAt(10.0, 10.0), PointAt(50.0, 50.0))
    test_rectangle = RectangleAroundLine(test_line)
    assert PointInRectangle(PointAt(10.0, 10.0), test_rectangle) is True
    assert PointInRectangle(PointAt(50.0, 50.0), test_rectangle) is True


def test_RectangleAroundQuad_integration():
    test_quad = QuadFrom(PointAt(0.0, 0.0), PointAt(100.0, 0.0), PointAt(0.0, 100.0), PointAt(100.0, 100.0))
    test_rectangle = RectangleAroundQuad(test_quad)
    assert RectangleLeft(test_rectangle) == 0.0
    assert RectangleTop(test_rectangle) == 0.0
    assert RectangleRight(test_rectangle) == 100.0
    assert RectangleBottom(test_rectangle) == 100.0


def test_RectangleAroundTriangle_integration():
    test_triangle = TriangleFrom(PointAt(0.0, 0.0), PointAt(100.0, 0.0), PointAt(50.0, 100.0))
    test_rectangle = RectangleAroundTriangle(test_triangle)
    assert RectangleLeft(test_rectangle) == 0.0
    assert RectangleTop(test_rectangle) == 0.0
    assert RectangleRight(test_rectangle) == 100.0
    assert RectangleBottom(test_rectangle) == 100.0


def test_RectangleBottom_integration():
    test_rectangle = RectangleFrom(10.0, 20.0, 50.0, 60.0)
    assert RectangleBottom(test_rectangle) == 80.0


def test_RectangleCenter_integration():
    test_rectangle = RectangleFrom(PointAt(0.0, 0.0), 100.0, 100.0)
    test_center_point = RectangleCenter(test_rectangle)
    assert PointPointDistance(PointAt(50.0, 50.0), test_center_point) == 0.0


def test_RectangleFromPointAndSize_integration():
    test_point = PointAt(10.0, 20.0)
    test_rectangle = RectangleFromPointAndSize(test_point, 50.0, 30.0)
    assert RectangleLeft(test_rectangle) == 10.0
    assert RectangleTop(test_rectangle) == 20.0
    assert RectangleRight(test_rectangle) == 60.0
    assert RectangleBottom(test_rectangle) == 50.0


def test_RectangleFromPoints_integration():
    test_point1 = PointAt(0.0, 0.0)
    test_point2 = PointAt(100.0, 100.0)
    test_rectangle = RectangleFrom(test_point1, test_point2)
    assert RectangleLeft(test_rectangle) == 0.0
    assert RectangleTop(test_rectangle) == 0.0
    assert RectangleRight(test_rectangle) == 100.0
    assert RectangleBottom(test_rectangle) == 100.0


def test_RectangleFrom_integration():
    test_rectangle = RectangleFrom(10.0, 20.0, 50.0, 30.0)
    assert RectangleLeft(test_rectangle) == 10.0
    assert RectangleTop(test_rectangle) == 20.0
    assert RectangleRight(test_rectangle) == 60.0
    assert RectangleBottom(test_rectangle) == 50.0


def test_RectangleLeft_integration():
    test_rectangle = RectangleFrom(10.0, 20.0, 50.0, 60.0)
    test_left = RectangleLeft(test_rectangle)
    assert test_left == 10.0


def test_RectangleOffsetBy_integration():
    test_rectangle = RectangleFrom(10.0, 10.0, 50.0, 50.0)
    test_offset_rectangle = RectangleOffsetBy(test_rectangle, VectorFromAngle(20.0, 30.0))
    assert RectangleLeft(test_offset_rectangle) == 30.0
    assert RectangleTop(test_offset_rectangle) == 40.0


def test_RectangleRight_integration():
    test_rectangle = RectangleFrom(10.0, 20.0, 50.0, 60.0)
    assert RectangleRight(test_rectangle) == 60.0


def test_RectangleToString_integration():
    test_rectangle = RectangleFrom(10.0, 20.0, 30.0, 40.0)
    test_string = RectangleToString(test_rectangle)
    assert test_string == "Rectangle(x: 10, y: 20, width: 30, height: 40)"


def test_RectangleTop_integration():
    test_rectangle = RectangleFrom(10.0, 20.0, 50.0, 60.0)
    test_top = RectangleTop(test_rectangle)
    assert test_top == 20.0


def test_RectanglesIntersect_integration():
    test_rect1 = RectangleFrom(0.0, 0.0, 10.0, 10.0)
    test_rect2 = RectangleFrom(5.0, 5.0, 10.0, 10.0)
    test_result = RectanglesIntersect(test_rect1, test_rect2)
    assert test_result is True


def test_TriangleBarycenter_integration():
    test_triangle = TriangleFrom(PointAt(0.0, 0.0), PointAt(100.0, 0.0), PointAt(50.0, 86.6))
    test_barycenter = TriangleBarycenter(test_triangle)
    assert test_barycenter.x == 50.0
    assert test_barycenter.y == 28.866666666666667


def test_TriangleFrom_integration():
    test_point1 = PointAt(0.0, 0.0)
    test_point2 = PointAt(100.0, 0.0)
    test_point3 = PointAt(50.0, 100.0)
    test_triangle = TriangleFrom(test_point1, test_point2, test_point3)
    assert PointInTriangle(PointAt(50.0, 50.0), test_triangle) is True


def test_TriangleFromFromCoordinates_integration():
    test_triangle = TriangleFromFromCoordinates(0.0, 0.0, 100.0, 0.0, 50.0, 100.0)
    assert PointInTriangle(PointAt(50.0, 50.0), test_triangle) is True
    assert PointInTriangle(PointAt(150.0, 150.0), test_triangle) is False


def test_TriangleRectangleIntersect_integration():
    test_triangle = TriangleFrom(PointAt(0.0, 0.0), PointAt(100.0, 0.0), PointAt(50.0, 100.0))
    test_rectangle = RectangleFrom(PointAt(40.0, 40.0), 60.0, 60.0)
    test_result = TriangleRectangleIntersect(test_triangle, test_rectangle)
    assert test_result is True


def test_TriangleToString_integration():
    test_triangle = TriangleFrom(PointAt(0.0, 0.0), PointAt(100.0, 0.0), PointAt(50.0, 100.0))
    test_triangle_string = TriangleToString(test_triangle)
    assert test_triangle_string != ""


def test_TrianglesIntersect_integration():
    test_triangle1 = TriangleFrom(PointAt(0.0, 0.0), PointAt(2.0, 0.0), PointAt(1.0, 2.0))
    test_triangle2 = TriangleFrom(PointAt(1.0, 0.0), PointAt(3.0, 0.0), PointAt(2.0, 2.0))
    test_result = TrianglesIntersect(test_triangle1, test_triangle2)
    assert test_result is True

