uses SplashKit, TestFramework

type
TIntegrationTests = class(TTestCase)
published
procedure TIntegrationTests.TestCenterPointIntegration;
begin
    testCircle := circle_at(100.0, 100.0, 50.0);
    testCenterPoint := center_point(testCircle);
    AssertEquals(point_at(100.0, 100.0), testCenterPoint);
end;
procedure TIntegrationTests.TestCircleAtIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    testCircle := circle_at(point_at(400.0, 300.0), 50.0);
    draw_circle(color_black(), testCircle);
    refresh_screen();
    AssertTrue(point_in_circle(point_at(400.0, 300.0), testCircle));
    close_window(testWindow);
end;
procedure TIntegrationTests.TestCircleAtFromPointsIntegration;
begin
    testWindow := open_window("Circle Test", 800, 600);
    testCircle := circle_at(400.0, 300.0, 50.0);
    draw_circle(color_black(), testCircle, option_defaults());
    refresh_screen();
    AssertTrue(point_in_circle(point_at(400.0, 300.0), testCircle));
    close_window(testWindow);
end;
procedure TIntegrationTests.TestCircleRadiusIntegration;
begin
    testCircle := circle_at(100.0, 100.0, 50.0);
    testRadius := circle_radius(testCircle);
    AssertEquals(testRadius, 50.0);
end;
procedure TIntegrationTests.TestCircleTriangleIntersectIntegration;
begin
    testCircle := circle_at(100.0, 100.0, 50.0);
    testTriangle := triangle_from(point_at(50.0, 50.0), point_at(150.0, 50.0), point_at(100.0, 150.0));
    testResult := circle_triangle_intersect(testCircle, testTriangle);
    AssertTrue(testResult);
end;
procedure TIntegrationTests.TestCircleTriangleIntersectGetClosestPointIntegration;
begin
    testCircle := circle_at(100.0, 100.0, 50.0);
    testTriangle := triangle_from(point_at(50.0, 50.0), point_at(150.0, 50.0), point_at(100.0, 150.0));
    testResult := circle_triangle_intersect(testCircle, testTriangle, point_at(0.0, 0.0));
    AssertTrue(testResult);
    AssertEquals(point_point_distance(center_point(testCircle), closest_point_on_triangle_from_circle(testCircle, testTriangle)), circle_radius(testCircle));
end;
procedure TIntegrationTests.TestCircleXIntegration;
begin
    testCircle := circle_at(100.0, 100.0, 50.0);
    AssertEquals(circle_x(testCircle), 100.0);
end;
procedure TIntegrationTests.TestCircleYIntegration;
begin
    testCircle := circle_at(100.0, 150.0, 50.0);
    AssertEquals(circle_y(testCircle), 150.0);
end;
procedure TIntegrationTests.TestCirclesIntersectIntegration;
begin
    testCircle1 := circle_at(0.0, 0.0, 50.0);
    testCircle2 := circle_at(100.0, 0.0, 50.0);
    testResult1 := circles_intersect(testCircle1, testCircle2);
    AssertFalse(testResult1);
    testCircle3 := circle_at(50.0, 0.0, 50.0);
    testResult2 := circles_intersect(testCircle1, testCircle3);
    AssertTrue(testResult2);
end;
procedure TIntegrationTests.TestCirclesIntersectUsingValuesIntegration;
begin
    testIntersectResult := circles_intersect(0.0, 0.0, 5.0, 10.0, 0.0, 5.0);
    AssertTrue(testIntersectResult);
    testNotIntersectResult := circles_intersect(0.0, 0.0, 5.0, 11.0, 0.0, 5.0);
    AssertFalse(testNotIntersectResult);
end;
procedure TIntegrationTests.TestClosestPointOnCircleIntegration;
begin
    testCircle := circle_at(100.0, 100.0, 50.0);
    testPoint := point_at(150.0, 100.0);
    testClosestPoint := closest_point_on_circle(testPoint, testCircle);
    AssertEquals(point_point_distance(testClosestPoint, testPoint), circle_radius(testCircle));
end;
procedure TIntegrationTests.TestClosestPointOnLineFromCircleIntegration;
begin
    testCircle := circle_at(100.0, 100.0, 50.0);
    testLine := line_from(50.0, 50.0, 150.0, 150.0);
    testClosestPoint := closest_point_on_line_from_circle(testCircle, testLine);
    AssertTrue(point_on_line(testClosestPoint, testLine));
end;
procedure TIntegrationTests.TestClosestPointOnRectFromCircleIntegration;
begin
    testCircle := circle_at(100.0, 100.0, 50.0);
    testRectangle := rectangle_from(150.0, 50.0, 100.0, 100.0);
    testClosestPoint := closest_point_on_rect_from_circle(testCircle, testRectangle);
    AssertTrue(point_in_rectangle(testClosestPoint, testRectangle));
    AssertEquals(point_point_distance(center_point(testCircle), testClosestPoint), circle_radius(testCircle));
end;
procedure TIntegrationTests.TestClosestPointOnTriangleFromCircleIntegration;
begin
    testCircle := circle_at(100.0, 100.0, 50.0);
    testTriangle := triangle_from(point_at(50.0, 50.0), point_at(150.0, 50.0), point_at(100.0, 150.0));
    testClosestPoint := closest_point_on_triangle_from_circle(testCircle, testTriangle);
    AssertTrue(point_in_triangle(testClosestPoint, testTriangle));
end;
procedure TIntegrationTests.TestDistantPointOnCircleIntegration;
begin
    testCircle := circle_at(100.0, 100.0, 50.0);
    testPoint := point_at(100.0, 150.0);
    testDistantPoint := distant_point_on_circle(testPoint, testCircle);
    AssertEquals(point_point_distance(testPoint, testDistantPoint), circle_radius(testCircle));
end;
procedure TIntegrationTests.TestDistantPointOnCircleHeadingIntegration;
begin
    testCircle := circle_at(100.0, 100.0, 50.0);
    testPoint1 := point_at(150.0, 100.0);
    testHeading := vector_from_angle(180.0, 1.0);
    testPoint2todo
    testResult := distant_point_on_circle_heading(testPoint1, testCircle, testHeading, testPoint2);
    AssertTrue(testResult);
    AssertEquals(testPoint1.x, 50.0);
    AssertEquals(testPoint1.y, 100.0);
end;
procedure TIntegrationTests.TestRayCircleIntersectDistanceIntegration;
begin
    testCircle := circle_at(100.0, 100.0, 50.0);
    testRayOrigin := point_at(0.0, 0.0);
    testRayHeading := vector_from_angle(45.0, 1.0);
    testDistance := ray_circle_intersect_distance(testRayOrigin, testRayHeading, testCircle);
    AssertTrue((testDistance >= 70) and (testDistance <= 71));
end;
procedure TIntegrationTests.TestTangentPointsIntegration;
begin
    testFromPt := point_at(100.0, 100.0);
    testCircle := circle_at(150.0, 150.0, 50.0);
    testPoint1 := point_at(0.0, 0.0);
    testPoint2 := point_at(0.0, 0.0);
    testResult := tangent_points(testFromPt, testCircle, testPoint1, testPoint2);
    AssertTrue(testResult);
    AssertNotEquals(point_at(0.0, 0.0), point_at(0.0, 0.0));
end;
procedure TIntegrationTests.TestWidestPointsIntegration;
begin
    testCircle := circle_at(100.0, 100.0, 50.0);
    testVector := vector_from_angle(45.0);
    testPoint1todo
    testPoint2todo
    testPoints := widest_points(testCircle, testVector, testPoint1, testPoint2);
    AssertTrue(point_in_circle(point_at(circle_x(testCircle), circle_y(testCircle)), testCircle));
    AssertTrue(point_in_circle(point_at(circle_x(testCircle), circle_y(testCircle)), testCircle));
end;
procedure TIntegrationTests.TestCosineIntegration;
begin
    testCosine0 := cosine(0.0);
    AssertEquals(testCosine0, 1.0);
    testCosine90 := cosine(90.0);
    AssertEquals(testCosine90, 0.0);
    testCosine180 := cosine(180.0);
    AssertEquals(testCosine180, -1.0);
end;
procedure TIntegrationTests.TestSineIntegration;
begin
    testSine0 := sine(0.0);
    AssertEquals(testSine0, 0.0);
    testSine90 := sine(90.0);
    AssertEquals(testSine90, 1.0);
    testSine180 := sine(180.0);
    AssertEquals(testSine180, 0.0);
    testSine270 := sine(270.0);
    AssertEquals(testSine270, -1.0);
end;
procedure TIntegrationTests.TestTangentIntegration;
begin
    testTangentResult := tangent(45.0);
    AssertTrue((testTangentResult >= 1.0) and (testTangentResult <= 2.0));
end;
procedure TIntegrationTests.TestClosestPointOnLineIntegration;
begin
    testLine := line_from(point_at(0.0, 0.0), point_at(10.0, 10.0));
    testClosestPoint := closest_point_on_line(point_at(5.0, 5.0), testLine);
    AssertEquals(point_point_distance(point_at(5.0, 5.0), testClosestPoint), 0.0);
end;
procedure TIntegrationTests.TestClosestPointOnLinesIntegration;
begin
    testFromPt := point_at(0.0, 0.0);
    testLine1 := line_from(point_at(-10.0, 0.0), point_at(10.0, 0.0));
    testLine2 := line_from(point_at(0.0, -10.0), point_at(0.0, 10.0));
    testClosestPoint := closest_point_on_lines(testFromPt, {:value_type=>"list", :list_name=>"test_lines", :list_values=>["test_line1", "test_line2"]}, 0);
    AssertEquals(point_point_distance(testFromPt, testClosestPoint), 0.0);
end;
procedure TIntegrationTests.TestLineFromPointToPointIntegration;
begin
    testStartPoint := point_at(0.0, 0.0);
    testEndPoint := point_at(100.0, 100.0);
    testLine := line_from(testStartPoint, testEndPoint);
    AssertEquals(line_length(testLine), 141.421356);
end;
procedure TIntegrationTests.TestLineFromStartWithOffsetIntegration;
begin
    testStartPoint := point_at(0.0, 0.0);
    testOffsetVector := vector_from_angle(45.0, 10.0);
    testLine := line_from(testStartPoint, testOffsetVector);
    AssertTrue(point_on_line(point_at(0.0, 0.0), testLine));
    AssertTrue(point_on_line(point_offset_by(testStartPoint, testOffsetVector), testLine));
end;
procedure TIntegrationTests.TestLineFromVectorIntegration;
begin
    testVector := vector_from_angle(100.0, 50.0);
    testLine := line_from(testVector);
    AssertEquals(testLine.start_point, point_at_origin());
    AssertEquals(testLine.end_point, point_at(100.0, 50.0));
end;
procedure TIntegrationTests.TestLineFromIntegration;
begin
    testLine := line_from(0.0, 0.0, 10.0, 10.0);
    AssertEquals(line_length(testLine), 14.1421356);
end;
procedure TIntegrationTests.TestLineIntersectionPointIntegration;
begin
    testLine1 := line_from(0.0, 0.0, 10.0, 10.0);
    testLine2 := line_from(10.0, 0.0, 0.0, 10.0);
    testPointtodo
    testIntersectionResult := line_intersection_point(testLine1, testLine2, testPoint);
    AssertTrue(testIntersectionResult);
end;
procedure TIntegrationTests.TestLineIntersectsCircleIntegration;
begin
    testLine := line_from(0.0, 0.0, 10.0, 10.0);
    testCircle := circle_at(5.0, 5.0, 3.0);
    testResult := line_intersects_circle(testLine, testCircle);
    AssertTrue(testResult);
end;
procedure TIntegrationTests.TestLineIntersectsLinesIntegration;
begin
    testLine := line_from(0.0, 0.0, 10.0, 10.0);
    testLine1 := line_from(5.0, 5.0, 15.0, 15.0);
    testLine2 := line_from(20.0, 20.0, 30.0, 30.0);
    testResult := line_intersects_lines(testLine, {:value_type=>"list", :list_name=>"test_lines", :list_values=>["test_line1", "test_line2"]});
    AssertTrue(testResult);
end;
procedure TIntegrationTests.TestLineIntersectsRectIntegration;
begin
    testRect := rectangle_from(0.0, 0.0, 100.0, 100.0);
    testLine := line_from(point_at(-50.0, 50.0), point_at(150.0, 50.0));
    AssertTrue(line_intersects_rect(testLine, testRect));
    testLineOutside := line_from(point_at(-50.0, 150.0), point_at(150.0, 150.0));
    AssertFalse(line_intersects_rect(testLineOutside, testRect));
end;
procedure TIntegrationTests.TestLineLengthIntegration;
begin
    testLine := line_from(point_at(0.0, 0.0), point_at(3.0, 4.0));
    testLength := line_length(testLine);
    AssertEquals(testLength, 5.0);
end;
procedure TIntegrationTests.TestLineLengthSquaredIntegration;
begin
    testLine := line_from(point_at(0.0, 0.0), point_at(3.0, 4.0));
    testResult := line_length_squared(testLine);
    AssertEquals(testResult, 25.0);
end;
procedure TIntegrationTests.TestLineMidPointIntegration;
begin
    testLine := line_from(point_at(0.0, 0.0), point_at(100.0, 100.0));
    testMidPoint := line_mid_point(testLine);
    AssertEquals(point_point_distance(testMidPoint, point_at(50.0, 50.0)), 0.0);
end;
procedure TIntegrationTests.TestLineNormalIntegration;
begin
    testLine := line_from(0.0, 0.0, 1.0, 1.0);
    testNormal := line_normal(testLine);
    AssertEquals(testNormal.x, -1.0);
    AssertEquals(testNormal.y, 1.0);
end;
procedure TIntegrationTests.TestLineToStringIntegration;
begin
    testLine := line_from(point_at(0.0, 0.0), point_at(100.0, 100.0));
    testLineString := line_to_string(testLine);
    AssertNotEquals(testLineString, "");
end;
procedure TIntegrationTests.TestLinesFromRectangleIntegration;
begin
    testRectangle := rectangle_from(0.0, 0.0, 100.0, 100.0);
    testLines := lines_from(testRectangle);
    AssertEquals(size(testLines), 4);
end;
procedure TIntegrationTests.TestLinesFromTriangleIntegration;
begin
    testTriangle := triangle_from(point_at(0.0, 0.0), point_at(100.0, 0.0), point_at(50.0, 86.6));
    testLines := lines_from(testTriangle);
    AssertEquals(size(testLines), 3);
end;
procedure TIntegrationTests.TestLinesIntersectIntegration;
begin
    testLine1 := line_from(point_at(0.0, 0.0), point_at(10.0, 10.0));
    testLine2 := line_from(point_at(5.0, 0.0), point_at(5.0, 10.0));
    testResult := lines_intersect(testLine1, testLine2);
    AssertTrue(testResult);
end;
procedure TIntegrationTests.TestPointAtIntegration;
begin
    testPoint := point_at(10.0, 20.0);
    AssertEquals(testPoint.x, 10.0);
    AssertEquals(testPoint.y, 20.0);
end;
procedure TIntegrationTests.TestPointAtOriginIntegration;
begin
    testPoint := point_at_origin();
    AssertEquals(testPoint.x, 0.0);
    AssertEquals(testPoint.y, 0.0);
end;
procedure TIntegrationTests.TestPointInCircleIntegration;
begin
    testCircle := circle_at(100.0, 100.0, 50.0);
    AssertTrue(point_in_circle(point_at(100.0, 100.0), testCircle));
    AssertTrue(point_in_circle(point_at(150.0, 100.0), testCircle));
    AssertFalse(point_in_circle(point_at(200.0, 100.0), testCircle));
end;
procedure TIntegrationTests.TestPointInCircleWithValuesIntegration;
begin
    testResult1 := point_in_circle(100.0, 100.0, 100.0, 100.0, 50.0);
    AssertTrue(testResult1);
    testResult2 := point_in_circle(200.0, 100.0, 100.0, 100.0, 50.0);
    AssertFalse(testResult2);
end;
procedure TIntegrationTests.TestPointInQuadIntegration;
begin
    testQuad := quad_from(point_at(0.0, 0.0), point_at(100.0, 0.0), point_at(100.0, 100.0), point_at(0.0, 100.0));
    AssertTrue(point_in_quad(point_at(50.0, 50.0), testQuad));
    AssertFalse(point_in_quad(point_at(150.0, 50.0), testQuad));
end;
procedure TIntegrationTests.TestPointInRectangleIntegration;
begin
    testRectangle := rectangle_from(0.0, 0.0, 100.0, 100.0);
    testPointInside := point_at(50.0, 50.0);
    testPointOutside := point_at(150.0, 150.0);
    AssertTrue(point_in_rectangle(testPointInside, testRectangle));
    AssertFalse(point_in_rectangle(testPointOutside, testRectangle));
end;
procedure TIntegrationTests.TestPointInRectangleWithValuesIntegration;
begin
    testResultInside := point_in_rectangle(10.0, 10.0, 0.0, 0.0, 20.0, 20.0);
    AssertTrue(testResultInside);
    testResultOutside := point_in_rectangle(25.0, 25.0, 0.0, 0.0, 20.0, 20.0);
    AssertFalse(testResultOutside);
end;
procedure TIntegrationTests.TestPointInTriangleIntegration;
begin
    testTriangle := triangle_from(point_at(0.0, 0.0), point_at(100.0, 0.0), point_at(50.0, 100.0));
    AssertTrue(point_in_triangle(point_at(50.0, 50.0), testTriangle));
    AssertFalse(point_in_triangle(point_at(150.0, 50.0), testTriangle));
end;
procedure TIntegrationTests.TestPointLineDistanceIntegration;
begin
    testPoint := point_at(0.0, 0.0);
    testLine := line_from(0.0, 0.0, 10.0, 10.0);
    testDistance := point_line_distance(testPoint, testLine);
    AssertEquals(testDistance, 0.0);
end;
procedure TIntegrationTests.TestPointOffsetByIntegration;
begin
    testStartPoint := point_at(10.0, 20.0);
    testOffset := vector_from_angle(5.0, 10.0);
    testResultPoint := point_offset_by(testStartPoint, testOffset);
    AssertEquals(testStartPoint.x, 15.0);
    AssertEquals(testResultPoint.x, 30.0);
end;
procedure TIntegrationTests.TestPointOffsetFromOriginIntegration;
begin
    testVector := vector_from_angle(10.0, 20.0);
    testPoint := point_offset_from_origin(testVector);
    AssertEquals(testPoint.x, 10.0);
    AssertEquals(testPoint.y, 20.0);
end;
procedure TIntegrationTests.TestPointOnLineIntegration;
begin
    testLine := line_from(0.0, 0.0, 10.0, 10.0);
    testPointOnLine := point_at(5.0, 5.0);
    testPointOffLine := point_at(15.0, 15.0);
    AssertTrue(point_on_line(testPointOnLine, testLine));
    AssertFalse(point_on_line(testPointOffLine, testLine));
end;
procedure TIntegrationTests.TestPointOnLineWithProximityIntegration;
begin
    testLine := line_from(point_at(0.0, 0.0), point_at(10.0, 10.0));
    testPointOnLine := point_at(5.0, 5.0);
    testPointNearLine := point_at(5.1, 5.1);
    testPointFarFromLine := point_at(15.0, 15.0);
    AssertTrue(point_on_line(testPointOnLine, testLine, 0.1));
    AssertTrue(point_on_line(testPointNearLine, testLine, 0.2));
    AssertFalse(point_on_line(testPointFarFromLine, testLine, 0.1));
end;
procedure TIntegrationTests.TestPointPointAngleIntegration;
begin
    testPoint1 := point_at(0.0, 0.0);
    testPoint2 := point_at(1.0, 0.0);
    testAngle := point_point_angle(testPoint1, testPoint2);
    AssertEquals(testAngle, 0.0);
end;
procedure TIntegrationTests.TestPointPointDistanceIntegration;
begin
    testPoint1 := point_at(0.0, 0.0);
    testPoint2 := point_at(3.0, 4.0);
    testDistance := point_point_distance(testPoint1, testPoint2);
    AssertEquals(testDistance, 5.0);
end;
procedure TIntegrationTests.TestPointToStringIntegration;
begin
    testPoint := point_at(10.0, 20.0);
    testString := point_to_string(testPoint);
    AssertEquals(testString, "Point(10, 20)");
end;
procedure TIntegrationTests.TestRandomBitmapPointIntegration;
begin
    testBitmap := create_bitmap("test_bitmap", 100, 100);
    testPoint := random_bitmap_point(testBitmap);
    AssertTrue((testPoint.x >= 0) and (testPoint.x <= bitmap_width(testBitmap)));
    AssertTrue((testPoint.y >= 0) and (testPoint.y <= bitmap_height(testBitmap)));
    free_bitmap(testBitmap);
end;
procedure TIntegrationTests.TestRandomScreenPointIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    testPoint := random_screen_point();
    refresh_screen();
    AssertTrue((testPoint.x >= 0) and (testPoint.x <= window_width(testWindow)));
    AssertTrue((testPoint.y >= 0) and (testPoint.y <= window_height(testWindow)));
    close_window(testWindow);
end;
procedure TIntegrationTests.TestRandomWindowPointIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    testPoint := random_window_point(testWindow);
    AssertTrue((testPoint.x >= 0) and (testPoint.x <= window_width(testWindow)));
    AssertTrue((testPoint.y >= 0) and (testPoint.y <= window_height(testWindow)));
    close_window(testWindow);
end;
procedure TIntegrationTests.TestSamePointIntegration;
begin
    testPoint1 := point_at(10.0, 20.0);
    testPoint2 := point_at(10.0, 20.0);
    testPoint3 := point_at(10.0, 21.0);
    AssertTrue(same_point(testPoint1, testPoint2));
    AssertFalse(same_point(testPoint1, testPoint3));
end;
procedure TIntegrationTests.TestQuadFromPointsIntegration;
begin
    testP1 := point_at(0.0, 0.0);
    testP2 := point_at(100.0, 0.0);
    testP3 := point_at(0.0, 100.0);
    testP4 := point_at(100.0, 100.0);
    testQuad := quad_from(testP1, testP2, testP3, testP4);
    AssertTrue(point_in_quad(point_at(50.0, 50.0), testQuad));
end;
procedure TIntegrationTests.TestQuadFromRectangleIntegration;
begin
    testRectangle := rectangle_from(0.0, 0.0, 100.0, 100.0);
    testQuad := quad_from(testRectangle);
    AssertTrue(point_in_quad(point_at(50.0, 50.0), testQuad));
    AssertFalse(point_in_quad(point_at(150.0, 150.0), testQuad));
end;
procedure TIntegrationTests.TestQuadFromRectangleWithTransformationIntegration;
begin
    testRectangle := rectangle_from(0.0, 0.0, 100.0, 100.0);
    testTransform := rotation_matrix(45.0);
    testQuad := quad_from(testRectangle, testTransform);
    AssertTrue(point_in_quad(point_at(50.0, 50.0), testQuad));
    AssertFalse(point_in_quad(point_at(150.0, 150.0), testQuad));
end;
procedure TIntegrationTests.TestQuadFromIntegration;
begin
    testQuad := quad_from(0.0, 0.0, 100.0, 0.0, 0.0, 100.0, 100.0, 100.0);
    AssertTrue(point_in_quad(point_at(50.0, 50.0), testQuad));
    AssertFalse(point_in_quad(point_at(150.0, 150.0), testQuad));
end;
procedure TIntegrationTests.TestQuadsIntersectIntegration;
begin
    testQuad1 := quad_from(point_at(0.0, 0.0), point_at(100.0, 0.0), point_at(0.0, 100.0), point_at(100.0, 100.0));
    testQuad2 := quad_from(point_at(50.0, 50.0), point_at(150.0, 50.0), point_at(50.0, 150.0), point_at(150.0, 150.0));
    testResult := quads_intersect(testQuad1, testQuad2);
    AssertTrue(testResult);
end;
procedure TIntegrationTests.TestSetQuadPointIntegration;
begin
    testQuad := quad_from(point_at(0.0, 0.0), point_at(100.0, 0.0), point_at(0.0, 100.0), point_at(100.0, 100.0));
    set_quad_point(testQuad, 2, point_at(50.0, 150.0));
    AssertTrue(point_in_quad(point_at(50.0, 150.0), testQuad));
end;
procedure TIntegrationTests.TestTrianglesFromIntegration;
begin
    testQuad := quad_from(point_at(0.0, 0.0), point_at(100.0, 0.0), point_at(0.0, 100.0), point_at(100.0, 100.0));
    testTriangles := triangles_from(testQuad);
    AssertEquals(size(testTriangles), 2);
end;
procedure TIntegrationTests.TestInsetRectangleIntegration;
begin
    testRectangle := rectangle_from(0.0, 0.0, 100.0, 100.0);
    testInsetRectangle := inset_rectangle(testRectangle, 10.0);
    AssertEquals(rectangle_left(testInsetRectangle), 10.0);
    AssertEquals(rectangle_top(testInsetRectangle), 10.0);
    AssertEquals(rectangle_right(testInsetRectangle), 90.0);
    AssertEquals(rectangle_bottom(testInsetRectangle), 90.0);
end;
procedure TIntegrationTests.TestIntersectionIntegration;
begin
    testRect1 := rectangle_from(0.0, 0.0, 10.0, 10.0);
    testRect2 := rectangle_from(5.0, 5.0, 10.0, 10.0);
    testIntersection := intersection(testRect1, testRect2);
    AssertEquals(rectangle_left(testIntersection), 5.0);
    AssertEquals(rectangle_top(testIntersection), 5.0);
    AssertEquals(rectangle_right(testIntersection), 10.0);
    AssertEquals(rectangle_bottom(testIntersection), 10.0);
end;
procedure TIntegrationTests.TestRectangleAroundCircleIntegration;
begin
    testCircle := circle_at(100.0, 100.0, 50.0);
    testRectangle := rectangle_around(testCircle);
    AssertEquals(rectangle_left(testRectangle), 50.0);
    AssertEquals(rectangle_top(testRectangle), 50.0);
    AssertEquals(rectangle_right(testRectangle), 150.0);
    AssertEquals(rectangle_bottom(testRectangle), 150.0);
end;
procedure TIntegrationTests.TestRectangleAroundLineIntegration;
begin
    testLine := line_from(point_at(10.0, 10.0), point_at(50.0, 50.0));
    testRectangle := rectangle_around(testLine);
    AssertTrue(point_in_rectangle(point_at(10.0, 10.0), testRectangle));
    AssertTrue(point_in_rectangle(point_at(50.0, 50.0), testRectangle));
end;
procedure TIntegrationTests.TestRectangleAroundQuadIntegration;
begin
    testQuad := quad_from(point_at(0.0, 0.0), point_at(100.0, 0.0), point_at(0.0, 100.0), point_at(100.0, 100.0));
    testRectangle := rectangle_around(testQuad);
    AssertEquals(rectangle_left(testRectangle), 0.0);
    AssertEquals(rectangle_top(testRectangle), 0.0);
    AssertEquals(rectangle_right(testRectangle), 100.0);
    AssertEquals(rectangle_bottom(testRectangle), 100.0);
end;
procedure TIntegrationTests.TestRectangleAroundTriangleIntegration;
begin
    testTriangle := triangle_from(point_at(0.0, 0.0), point_at(100.0, 0.0), point_at(50.0, 100.0));
    testRectangle := rectangle_around(testTriangle);
    AssertEquals(rectangle_left(testRectangle), 0.0);
    AssertEquals(rectangle_top(testRectangle), 0.0);
    AssertEquals(rectangle_right(testRectangle), 100.0);
    AssertEquals(rectangle_bottom(testRectangle), 100.0);
end;
procedure TIntegrationTests.TestRectangleBottomIntegration;
begin
    testRectangle := rectangle_from(10.0, 20.0, 50.0, 60.0);
    AssertEquals(rectangle_bottom(testRectangle), 80.0);
end;
procedure TIntegrationTests.TestRectangleCenterIntegration;
begin
    testRectangle := rectangle_from(point_at(0.0, 0.0), 100.0, 100.0);
    testCenterPoint := rectangle_center(testRectangle);
    AssertEquals(point_point_distance(point_at(50.0, 50.0), testCenterPoint), 0.0);
end;
procedure TIntegrationTests.TestRectangleFromPointAndSizeIntegration;
begin
    testPoint := point_at(10.0, 20.0);
    testRectangle := rectangle_from(testPoint, 50.0, 30.0);
    AssertEquals(rectangle_left(testRectangle), 10.0);
    AssertEquals(rectangle_top(testRectangle), 20.0);
    AssertEquals(rectangle_right(testRectangle), 60.0);
    AssertEquals(rectangle_bottom(testRectangle), 50.0);
end;
procedure TIntegrationTests.TestRectangleFromPointsIntegration;
begin
    testPoint1 := point_at(0.0, 0.0);
    testPoint2 := point_at(100.0, 100.0);
    testRectangle := rectangle_from(testPoint1, testPoint2);
    AssertEquals(rectangle_left(testRectangle), 0.0);
    AssertEquals(rectangle_top(testRectangle), 0.0);
    AssertEquals(rectangle_right(testRectangle), 100.0);
    AssertEquals(rectangle_bottom(testRectangle), 100.0);
end;
procedure TIntegrationTests.TestRectangleFromIntegration;
begin
    testRectangle := rectangle_from(10.0, 20.0, 50.0, 30.0);
    AssertEquals(rectangle_left(testRectangle), 10.0);
    AssertEquals(rectangle_top(testRectangle), 20.0);
    AssertEquals(rectangle_right(testRectangle), 60.0);
    AssertEquals(rectangle_bottom(testRectangle), 50.0);
end;
procedure TIntegrationTests.TestRectangleLeftIntegration;
begin
    testRectangle := rectangle_from(10.0, 20.0, 50.0, 60.0);
    testLeft := rectangle_left(testRectangle);
    AssertEquals(testLeft, 10.0);
end;
procedure TIntegrationTests.TestRectangleOffsetByIntegration;
begin
    testRectangle := rectangle_from(10.0, 10.0, 50.0, 50.0);
    testOffsetRectangle := rectangle_offset_by(testRectangle, vector_from_angle(20.0, 30.0));
    AssertEquals(rectangle_left(testOffsetRectangle), 30.0);
    AssertEquals(rectangle_top(testOffsetRectangle), 40.0);
end;
procedure TIntegrationTests.TestRectangleRightIntegration;
begin
    testRectangle := rectangle_from(10.0, 20.0, 50.0, 60.0);
    AssertEquals(rectangle_right(testRectangle), 60.0);
end;
procedure TIntegrationTests.TestRectangleToStringIntegration;
begin
    testRectangle := rectangle_from(10.0, 20.0, 30.0, 40.0);
    testString := rectangle_to_string(testRectangle);
    AssertEquals(testString, "Rectangle(x: 10, y: 20, width: 30, height: 40)");
end;
procedure TIntegrationTests.TestRectangleTopIntegration;
begin
    testRectangle := rectangle_from(10.0, 20.0, 50.0, 60.0);
    testTop := rectangle_top(testRectangle);
    AssertEquals(testTop, 20.0);
end;
procedure TIntegrationTests.TestRectanglesIntersectIntegration;
begin
    testRect1 := rectangle_from(0.0, 0.0, 10.0, 10.0);
    testRect2 := rectangle_from(5.0, 5.0, 10.0, 10.0);
    testResult := rectangles_intersect(testRect1, testRect2);
    AssertTrue(testResult);
end;
procedure TIntegrationTests.TestTriangleBarycenterIntegration;
begin
    testTriangle := triangle_from(point_at(0.0, 0.0), point_at(100.0, 0.0), point_at(50.0, 86.6));
    testBarycenter := triangle_barycenter(testTriangle);
    AssertEquals(testBarycenter.x, 50.0);
    AssertEquals(testBarycenter.y, 28.866666666666667);
end;
procedure TIntegrationTests.TestTriangleFromIntegration;
begin
    testPoint1 := point_at(0.0, 0.0);
    testPoint2 := point_at(100.0, 0.0);
    testPoint3 := point_at(50.0, 100.0);
    testTriangle := triangle_from(testPoint1, testPoint2, testPoint3);
    AssertTrue(point_in_triangle(point_at(50.0, 50.0), testTriangle));
end;
procedure TIntegrationTests.TestTriangleFromFromCoordinatesIntegration;
begin
    testTriangle := triangle_from(0.0, 0.0, 100.0, 0.0, 50.0, 100.0);
    AssertTrue(point_in_triangle(point_at(50.0, 50.0), testTriangle));
    AssertFalse(point_in_triangle(point_at(150.0, 150.0), testTriangle));
end;
procedure TIntegrationTests.TestTriangleRectangleIntersectIntegration;
begin
    testTriangle := triangle_from(point_at(0.0, 0.0), point_at(100.0, 0.0), point_at(50.0, 100.0));
    testRectangle := rectangle_from(point_at(40.0, 40.0), 60.0, 60.0);
    testResult := triangle_rectangle_intersect(testTriangle, testRectangle);
    AssertTrue(testResult);
end;
procedure TIntegrationTests.TestTriangleToStringIntegration;
begin
    testTriangle := triangle_from(point_at(0.0, 0.0), point_at(100.0, 0.0), point_at(50.0, 100.0));
    testTriangleString := triangle_to_string(testTriangle);
    AssertNotEquals(testTriangleString, "");
end;
procedure TIntegrationTests.TestTrianglesIntersectIntegration;
begin
    testTriangle1 := triangle_from(point_at(0.0, 0.0), point_at(2.0, 0.0), point_at(1.0, 2.0));
    testTriangle2 := triangle_from(point_at(1.0, 0.0), point_at(3.0, 0.0), point_at(2.0, 2.0));
    testResult := triangles_intersect(testTriangle1, testTriangle2);
    AssertTrue(testResult);
end;
end;

procedure RegisterTests;
begin
TestFramework.RegisterTest(TIntegrationTests.Suite);
end;
