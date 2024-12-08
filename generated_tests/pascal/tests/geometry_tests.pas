uses SplashKit, TestFramework

type
TIntegrationTests = class(TTestCase)
published
procedure TIntegrationTests.TestCenterPointIntegration;
begin
    testCircle := CircleAt(100.0, 100.0, 50.0);
    testCenterPoint := CenterPoint(testCircle);
    AssertEquals(PointAt(100.0, 100.0), testCenterPoint);
end;
procedure TIntegrationTests.TestCircleAtIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    testCircle := CircleAt(PointAt(400.0, 300.0), 50.0);
    DrawCircle(ColorBlack(), testCircle);
    RefreshScreen();
    AssertTrue(PointInCircle(PointAt(400.0, 300.0), testCircle));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestCircleAtFromPointsIntegration;
begin
    testWindow := OpenWindow("Circle Test", 800, 600);
    testCircle := CircleAt(400.0, 300.0, 50.0);
    DrawCircle(ColorBlack(), testCircle, OptionDefaults());
    RefreshScreen();
    AssertTrue(PointInCircle(PointAt(400.0, 300.0), testCircle));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestCircleRadiusIntegration;
begin
    testCircle := CircleAt(100.0, 100.0, 50.0);
    testRadius := CircleRadius(testCircle);
    AssertEquals(testRadius, 50.0);
end;
procedure TIntegrationTests.TestCircleTriangleIntersectIntegration;
begin
    testCircle := CircleAt(100.0, 100.0, 50.0);
    testTriangle := TriangleFrom(PointAt(50.0, 50.0), PointAt(150.0, 50.0), PointAt(100.0, 150.0));
    testResult := CircleTriangleIntersect(testCircle, testTriangle);
    AssertTrue(testResult);
end;
procedure TIntegrationTests.TestCircleTriangleIntersectGetClosestPointIntegration;
begin
    testCircle := CircleAt(100.0, 100.0, 50.0);
    testTriangle := TriangleFrom(PointAt(50.0, 50.0), PointAt(150.0, 50.0), PointAt(100.0, 150.0));
    testResult := CircleTriangleIntersect(testCircle, testTriangle, PointAt(0.0, 0.0));
    AssertTrue(testResult);
    AssertEquals(PointPointDistance(CenterPoint(testCircle), ClosestPointOnTriangleFromCircle(testCircle, testTriangle)), CircleRadius(testCircle));
end;
procedure TIntegrationTests.TestCircleXIntegration;
begin
    testCircle := CircleAt(100.0, 100.0, 50.0);
    AssertEquals(CircleX(testCircle), 100.0);
end;
procedure TIntegrationTests.TestCircleYIntegration;
begin
    testCircle := CircleAt(100.0, 150.0, 50.0);
    AssertEquals(CircleY(testCircle), 150.0);
end;
procedure TIntegrationTests.TestCirclesIntersectIntegration;
begin
    testCircle1 := CircleAt(0.0, 0.0, 50.0);
    testCircle2 := CircleAt(100.0, 0.0, 50.0);
    testResult1 := CirclesIntersect(testCircle1, testCircle2);
    AssertFalse(testResult1);
    testCircle3 := CircleAt(50.0, 0.0, 50.0);
    testResult2 := CirclesIntersect(testCircle1, testCircle3);
    AssertTrue(testResult2);
end;
procedure TIntegrationTests.TestCirclesIntersectUsingValuesIntegration;
begin
    testIntersectResult := CirclesIntersect(0.0, 0.0, 5.0, 10.0, 0.0, 5.0);
    AssertTrue(testIntersectResult);
    testNotIntersectResult := CirclesIntersect(0.0, 0.0, 5.0, 11.0, 0.0, 5.0);
    AssertFalse(testNotIntersectResult);
end;
procedure TIntegrationTests.TestClosestPointOnCircleIntegration;
begin
    testCircle := CircleAt(100.0, 100.0, 50.0);
    testPoint := PointAt(150.0, 100.0);
    testClosestPoint := ClosestPointOnCircle(testPoint, testCircle);
    AssertEquals(PointPointDistance(testClosestPoint, testPoint), CircleRadius(testCircle));
end;
procedure TIntegrationTests.TestClosestPointOnLineFromCircleIntegration;
begin
    testCircle := CircleAt(100.0, 100.0, 50.0);
    testLine := LineFrom(50.0, 50.0, 150.0, 150.0);
    testClosestPoint := ClosestPointOnLineFromCircle(testCircle, testLine);
    AssertTrue(PointOnLine(testClosestPoint, testLine));
end;
procedure TIntegrationTests.TestClosestPointOnRectFromCircleIntegration;
begin
    testCircle := CircleAt(100.0, 100.0, 50.0);
    testRectangle := RectangleFrom(150.0, 50.0, 100.0, 100.0);
    testClosestPoint := ClosestPointOnRectFromCircle(testCircle, testRectangle);
    AssertTrue(PointInRectangle(testClosestPoint, testRectangle));
    AssertEquals(PointPointDistance(CenterPoint(testCircle), testClosestPoint), CircleRadius(testCircle));
end;
procedure TIntegrationTests.TestClosestPointOnTriangleFromCircleIntegration;
begin
    testCircle := CircleAt(100.0, 100.0, 50.0);
    testTriangle := TriangleFrom(PointAt(50.0, 50.0), PointAt(150.0, 50.0), PointAt(100.0, 150.0));
    testClosestPoint := ClosestPointOnTriangleFromCircle(testCircle, testTriangle);
    AssertTrue(PointInTriangle(testClosestPoint, testTriangle));
end;
procedure TIntegrationTests.TestDistantPointOnCircleIntegration;
begin
    testCircle := CircleAt(100.0, 100.0, 50.0);
    testPoint := PointAt(100.0, 150.0);
    testDistantPoint := DistantPointOnCircle(testPoint, testCircle);
    AssertEquals(PointPointDistance(testPoint, testDistantPoint), CircleRadius(testCircle));
end;
procedure TIntegrationTests.TestDistantPointOnCircleHeadingIntegration;
begin
    testCircle := CircleAt(100.0, 100.0, 50.0);
    testPoint1 := PointAt(150.0, 100.0);
    testHeading := VectorFromAngle(180.0, 1.0);
    testPoint2 := PointAt(0.0);
    testResult := DistantPointOnCircleHeading(testPoint1, testCircle, testHeading, testPoint2);
    AssertTrue(testResult);
    AssertEquals(testPoint1.x, 50.0);
    AssertEquals(testPoint1.y, 100.0);
end;
procedure TIntegrationTests.TestRayCircleIntersectDistanceIntegration;
begin
    testCircle := CircleAt(100.0, 100.0, 50.0);
    testRayOrigin := PointAt(0.0, 0.0);
    testRayHeading := VectorFromAngle(45.0, 1.0);
    testDistance := RayCircleIntersectDistance(testRayOrigin, testRayHeading, testCircle);
    AssertTrue((testDistance >= 70) and (testDistance <= 71));
end;
procedure TIntegrationTests.TestTangentPointsIntegration;
begin
    testFromPt := PointAt(100.0, 100.0);
    testCircle := CircleAt(150.0, 150.0, 50.0);
    testPoint1 := PointAt(0.0, 0.0);
    testPoint2 := PointAt(0.0, 0.0);
    testResult := TangentPoints(testFromPt, testCircle, testPoint1, testPoint2);
    AssertTrue(testResult);
    AssertNotEquals(PointAt(0.0, 0.0), PointAt(0.0, 0.0));
end;
procedure TIntegrationTests.TestWidestPointsIntegration;
begin
    testCircle := CircleAt(100.0, 100.0, 50.0);
    testVector := VectorFromAngle(45.0);
    testPoint1 := PointAt(0.0, 0.0);
    testPoint2 := PointAt(0.0, 0.0);
    testPoints := WidestPoints(testCircle, testVector, testPoint1, testPoint2);
    AssertTrue(PointInCircle(PointAt(CircleX(testCircle), CircleY(testCircle)), testCircle));
    AssertTrue(PointInCircle(PointAt(CircleX(testCircle), CircleY(testCircle)), testCircle));
end;
procedure TIntegrationTests.TestCosineIntegration;
begin
    testCosine0 := Cosine(0.0);
    AssertEquals(testCosine0, 1.0);
    testCosine90 := Cosine(90.0);
    AssertEquals(testCosine90, 0.0);
    testCosine180 := Cosine(180.0);
    AssertEquals(testCosine180, -1.0);
end;
procedure TIntegrationTests.TestSineIntegration;
begin
    testSine0 := Sine(0.0);
    AssertEquals(testSine0, 0.0);
    testSine90 := Sine(90.0);
    AssertEquals(testSine90, 1.0);
    testSine180 := Sine(180.0);
    AssertEquals(testSine180, 0.0);
    testSine270 := Sine(270.0);
    AssertEquals(testSine270, -1.0);
end;
procedure TIntegrationTests.TestTangentIntegration;
begin
    testTangentResult := Tangent(45.0);
    AssertTrue((testTangentResult >= 1.0) and (testTangentResult <= 2.0));
end;
procedure TIntegrationTests.TestClosestPointOnLineIntegration;
begin
    testLine := LineFrom(PointAt(0.0, 0.0), PointAt(10.0, 10.0));
    testClosestPoint := ClosestPointOnLine(PointAt(5.0, 5.0), testLine);
    AssertEquals(PointPointDistance(PointAt(5.0, 5.0), testClosestPoint), 0.0);
end;
procedure TIntegrationTests.TestClosestPointOnLinesIntegration;
begin
    testFromPt := PointAt(0.0, 0.0);
    testLine1 := LineFrom(PointAt(-10.0, 0.0), PointAt(10.0, 0.0));
    testLine2 := LineFrom(PointAt(0.0, -10.0), PointAt(0.0, 10.0));
    testIndex := {:step_type=>"variable", :variable_type=>"primitive", :variable_name=>"test_index", :value=>0}
    testLines := {:step_type=>"variable", :variable_type=>"list", :target_type=>"line", :variable_name=>"test_lines", :value=>[{:value_type=>"variable", :variable_name=>"test_line1"}, {:value_type=>"variable", :variable_name=>"test_line2"}]}
    testClosestPoint := ClosestPointOnLines(testFromPt, testLines, testIndex);
    AssertEquals(PointPointDistance(testFromPt, testClosestPoint), 0.0);
end;
procedure TIntegrationTests.TestLineFromPointToPointIntegration;
begin
    testStartPoint := PointAt(0.0, 0.0);
    testEndPoint := PointAt(100.0, 100.0);
    testLine := LineFrom(testStartPoint, testEndPoint);
    AssertEquals(LineLength(testLine), 141.421356);
end;
procedure TIntegrationTests.TestLineFromStartWithOffsetIntegration;
begin
    testStartPoint := PointAt(0.0, 0.0);
    testOffsetVector := VectorFromAngle(45.0, 10.0);
    testLine := LineFrom(testStartPoint, testOffsetVector);
    AssertTrue(PointOnLine(PointAt(0.0, 0.0), testLine));
    AssertTrue(PointOnLine(PointOffsetBy(testStartPoint, testOffsetVector), testLine));
end;
procedure TIntegrationTests.TestLineFromVectorIntegration;
begin
    testVector := VectorFromAngle(100.0, 50.0);
    testLine := LineFrom(testVector);
    AssertEquals(testLine.start_point, PointAtOrigin());
    AssertEquals(testLine.end_point, PointAt(100.0, 50.0));
end;
procedure TIntegrationTests.TestLineFromIntegration;
begin
    testLine := LineFrom(0.0, 0.0, 10.0, 10.0);
    AssertEquals(LineLength(testLine), 14.1421356);
end;
procedure TIntegrationTests.TestLineIntersectionPointIntegration;
begin
    testLine1 := LineFrom(0.0, 0.0, 10.0, 10.0);
    testLine2 := LineFrom(10.0, 0.0, 0.0, 10.0);
    testPoint := PointAt(0.0, 0.0);
    testIntersectionResult := LineIntersectionPoint(testLine1, testLine2, testPoint);
    AssertTrue(testIntersectionResult);
end;
procedure TIntegrationTests.TestLineIntersectsCircleIntegration;
begin
    testLine := LineFrom(0.0, 0.0, 10.0, 10.0);
    testCircle := CircleAt(5.0, 5.0, 3.0);
    testResult := LineIntersectsCircle(testLine, testCircle);
    AssertTrue(testResult);
end;
procedure TIntegrationTests.TestLineIntersectsLinesIntegration;
begin
    testLine := LineFrom(0.0, 0.0, 10.0, 10.0);
    testLine1 := LineFrom(5.0, 5.0, 15.0, 15.0);
    testLine2 := LineFrom(20.0, 20.0, 30.0, 30.0);
    testLines := TArray<line>.Create(testLine1, testLine2);
    testResult := LineIntersectsLines(testLine, testLines);
    AssertTrue(testResult);
end;
procedure TIntegrationTests.TestLineIntersectsRectIntegration;
begin
    testRect := RectangleFrom(0.0, 0.0, 100.0, 100.0);
    testLine := LineFrom(PointAt(-50.0, 50.0), PointAt(150.0, 50.0));
    AssertTrue(LineIntersectsRect(testLine, testRect));
    testLineOutside := LineFrom(PointAt(-50.0, 150.0), PointAt(150.0, 150.0));
    AssertFalse(LineIntersectsRect(testLineOutside, testRect));
end;
procedure TIntegrationTests.TestLineLengthIntegration;
begin
    testLine := LineFrom(PointAt(0.0, 0.0), PointAt(3.0, 4.0));
    testLength := LineLength(testLine);
    AssertEquals(testLength, 5.0);
end;
procedure TIntegrationTests.TestLineLengthSquaredIntegration;
begin
    testLine := LineFrom(PointAt(0.0, 0.0), PointAt(3.0, 4.0));
    testResult := LineLengthSquared(testLine);
    AssertEquals(testResult, 25.0);
end;
procedure TIntegrationTests.TestLineMidPointIntegration;
begin
    testLine := LineFrom(PointAt(0.0, 0.0), PointAt(100.0, 100.0));
    testMidPoint := LineMidPoint(testLine);
    AssertEquals(PointPointDistance(testMidPoint, PointAt(50.0, 50.0)), 0.0);
end;
procedure TIntegrationTests.TestLineNormalIntegration;
begin
    testLine := LineFrom(0.0, 0.0, 1.0, 1.0);
    testNormal := LineNormal(testLine);
    AssertEquals(testNormal.x, -1.0);
    AssertEquals(testNormal.y, 1.0);
end;
procedure TIntegrationTests.TestLineToStringIntegration;
begin
    testLine := LineFrom(PointAt(0.0, 0.0), PointAt(100.0, 100.0));
    testLineString := LineToString(testLine);
    AssertNotEquals(testLineString, "");
end;
procedure TIntegrationTests.TestLinesFromRectangleIntegration;
begin
    testRectangle := RectangleFrom(0.0, 0.0, 100.0, 100.0);
    testLines := LinesFrom(testRectangle);
    AssertEquals(Size(testLines), 4);
end;
procedure TIntegrationTests.TestLinesFromTriangleIntegration;
begin
    testTriangle := TriangleFrom(PointAt(0.0, 0.0), PointAt(100.0, 0.0), PointAt(50.0, 86.6));
    testLines := LinesFrom(testTriangle);
    AssertEquals(Size(testLines), 3);
end;
procedure TIntegrationTests.TestLinesIntersectIntegration;
begin
    testLine1 := LineFrom(PointAt(0.0, 0.0), PointAt(10.0, 10.0));
    testLine2 := LineFrom(PointAt(5.0, 0.0), PointAt(5.0, 10.0));
    testResult := LinesIntersect(testLine1, testLine2);
    AssertTrue(testResult);
end;
procedure TIntegrationTests.TestPointAtIntegration;
begin
    testPoint := PointAt(10.0, 20.0);
    AssertEquals(testPoint.x, 10.0);
    AssertEquals(testPoint.y, 20.0);
end;
procedure TIntegrationTests.TestPointAtOriginIntegration;
begin
    testPoint := PointAtOrigin();
    AssertEquals(testPoint.x, 0.0);
    AssertEquals(testPoint.y, 0.0);
end;
procedure TIntegrationTests.TestPointInCircleIntegration;
begin
    testCircle := CircleAt(100.0, 100.0, 50.0);
    AssertTrue(PointInCircle(PointAt(100.0, 100.0), testCircle));
    AssertTrue(PointInCircle(PointAt(150.0, 100.0), testCircle));
    AssertFalse(PointInCircle(PointAt(200.0, 100.0), testCircle));
end;
procedure TIntegrationTests.TestPointInCircleWithValuesIntegration;
begin
    testResult1 := PointInCircle(100.0, 100.0, 100.0, 100.0, 50.0);
    AssertTrue(testResult1);
    testResult2 := PointInCircle(200.0, 100.0, 100.0, 100.0, 50.0);
    AssertFalse(testResult2);
end;
procedure TIntegrationTests.TestPointInQuadIntegration;
begin
    testQuad := QuadFrom(PointAt(0.0, 0.0), PointAt(100.0, 0.0), PointAt(100.0, 100.0), PointAt(0.0, 100.0));
    AssertTrue(PointInQuad(PointAt(50.0, 50.0), testQuad));
    AssertFalse(PointInQuad(PointAt(150.0, 50.0), testQuad));
end;
procedure TIntegrationTests.TestPointInRectangleIntegration;
begin
    testRectangle := RectangleFrom(0.0, 0.0, 100.0, 100.0);
    testPointInside := PointAt(50.0, 50.0);
    testPointOutside := PointAt(150.0, 150.0);
    AssertTrue(PointInRectangle(testPointInside, testRectangle));
    AssertFalse(PointInRectangle(testPointOutside, testRectangle));
end;
procedure TIntegrationTests.TestPointInRectangleWithValuesIntegration;
begin
    testResultInside := PointInRectangle(10.0, 10.0, 0.0, 0.0, 20.0, 20.0);
    AssertTrue(testResultInside);
    testResultOutside := PointInRectangle(25.0, 25.0, 0.0, 0.0, 20.0, 20.0);
    AssertFalse(testResultOutside);
end;
procedure TIntegrationTests.TestPointInTriangleIntegration;
begin
    testTriangle := TriangleFrom(PointAt(0.0, 0.0), PointAt(100.0, 0.0), PointAt(50.0, 100.0));
    AssertTrue(PointInTriangle(PointAt(50.0, 50.0), testTriangle));
    AssertFalse(PointInTriangle(PointAt(150.0, 50.0), testTriangle));
end;
procedure TIntegrationTests.TestPointLineDistanceIntegration;
begin
    testPoint := PointAt(0.0, 0.0);
    testLine := LineFrom(0.0, 0.0, 10.0, 10.0);
    testDistance := PointLineDistance(testPoint, testLine);
    AssertEquals(testDistance, 0.0);
end;
procedure TIntegrationTests.TestPointOffsetByIntegration;
begin
    testStartPoint := PointAt(10.0, 20.0);
    testOffset := VectorFromAngle(5.0, 10.0);
    testResultPoint := PointOffsetBy(testStartPoint, testOffset);
    AssertEquals(testStartPoint.x, 15.0);
    AssertEquals(testResultPoint.x, 30.0);
end;
procedure TIntegrationTests.TestPointOffsetFromOriginIntegration;
begin
    testVector := VectorFromAngle(10.0, 20.0);
    testPoint := PointOffsetFromOrigin(testVector);
    AssertEquals(testPoint.x, 10.0);
    AssertEquals(testPoint.y, 20.0);
end;
procedure TIntegrationTests.TestPointOnLineIntegration;
begin
    testLine := LineFrom(0.0, 0.0, 10.0, 10.0);
    testPointOnLine := PointAt(5.0, 5.0);
    testPointOffLine := PointAt(15.0, 15.0);
    AssertTrue(PointOnLine(testPointOnLine, testLine));
    AssertFalse(PointOnLine(testPointOffLine, testLine));
end;
procedure TIntegrationTests.TestPointOnLineWithProximityIntegration;
begin
    testLine := LineFrom(PointAt(0.0, 0.0), PointAt(10.0, 10.0));
    testPointOnLine := PointAt(5.0, 5.0);
    testPointNearLine := PointAt(5.1, 5.1);
    testPointFarFromLine := PointAt(15.0, 15.0);
    AssertTrue(PointOnLine(testPointOnLine, testLine, 0.1));
    AssertTrue(PointOnLine(testPointNearLine, testLine, 0.2));
    AssertFalse(PointOnLine(testPointFarFromLine, testLine, 0.1));
end;
procedure TIntegrationTests.TestPointPointAngleIntegration;
begin
    testPoint1 := PointAt(0.0, 0.0);
    testPoint2 := PointAt(1.0, 0.0);
    testAngle := PointPointAngle(testPoint1, testPoint2);
    AssertEquals(testAngle, 0.0);
end;
procedure TIntegrationTests.TestPointPointDistanceIntegration;
begin
    testPoint1 := PointAt(0.0, 0.0);
    testPoint2 := PointAt(3.0, 4.0);
    testDistance := PointPointDistance(testPoint1, testPoint2);
    AssertEquals(testDistance, 5.0);
end;
procedure TIntegrationTests.TestPointToStringIntegration;
begin
    testPoint := PointAt(10.0, 20.0);
    testString := PointToString(testPoint);
    AssertEquals(testString, "Point(10, 20)");
end;
procedure TIntegrationTests.TestRandomBitmapPointIntegration;
begin
    testBitmap := CreateBitmap("test_bitmap", 100, 100);
    testPoint := RandomBitmapPoint(testBitmap);
    AssertTrue((testPoint.x >= 0) and (testPoint.x <= BitmapWidth(testBitmap)));
    AssertTrue((testPoint.y >= 0) and (testPoint.y <= BitmapHeight(testBitmap)));
    FreeBitmap(testBitmap);
end;
procedure TIntegrationTests.TestRandomScreenPointIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    testPoint := RandomScreenPoint();
    RefreshScreen();
    AssertTrue((testPoint.x >= 0) and (testPoint.x <= WindowWidth(testWindow)));
    AssertTrue((testPoint.y >= 0) and (testPoint.y <= WindowHeight(testWindow)));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestRandomWindowPointIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    testPoint := RandomWindowPoint(testWindow);
    AssertTrue((testPoint.x >= 0) and (testPoint.x <= WindowWidth(testWindow)));
    AssertTrue((testPoint.y >= 0) and (testPoint.y <= WindowHeight(testWindow)));
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestSamePointIntegration;
begin
    testPoint1 := PointAt(10.0, 20.0);
    testPoint2 := PointAt(10.0, 20.0);
    testPoint3 := PointAt(10.0, 21.0);
    AssertTrue(SamePoint(testPoint1, testPoint2));
    AssertFalse(SamePoint(testPoint1, testPoint3));
end;
procedure TIntegrationTests.TestQuadFromPointsIntegration;
begin
    testP1 := PointAt(0.0, 0.0);
    testP2 := PointAt(100.0, 0.0);
    testP3 := PointAt(0.0, 100.0);
    testP4 := PointAt(100.0, 100.0);
    testQuad := QuadFrom(testP1, testP2, testP3, testP4);
    AssertTrue(PointInQuad(PointAt(50.0, 50.0), testQuad));
end;
procedure TIntegrationTests.TestQuadFromRectangleIntegration;
begin
    testRectangle := RectangleFrom(0.0, 0.0, 100.0, 100.0);
    testQuad := QuadFrom(testRectangle);
    AssertTrue(PointInQuad(PointAt(50.0, 50.0), testQuad));
    AssertFalse(PointInQuad(PointAt(150.0, 150.0), testQuad));
end;
procedure TIntegrationTests.TestQuadFromRectangleWithTransformationIntegration;
begin
    testRectangle := RectangleFrom(0.0, 0.0, 100.0, 100.0);
    testTransform := RotationMatrix(45.0);
    testQuad := QuadFrom(testRectangle, testTransform);
    AssertTrue(PointInQuad(PointAt(50.0, 50.0), testQuad));
    AssertFalse(PointInQuad(PointAt(150.0, 150.0), testQuad));
end;
procedure TIntegrationTests.TestQuadFromIntegration;
begin
    testQuad := QuadFrom(0.0, 0.0, 100.0, 0.0, 0.0, 100.0, 100.0, 100.0);
    AssertTrue(PointInQuad(PointAt(50.0, 50.0), testQuad));
    AssertFalse(PointInQuad(PointAt(150.0, 150.0), testQuad));
end;
procedure TIntegrationTests.TestQuadsIntersectIntegration;
begin
    testQuad1 := QuadFrom(PointAt(0.0, 0.0), PointAt(100.0, 0.0), PointAt(0.0, 100.0), PointAt(100.0, 100.0));
    testQuad2 := QuadFrom(PointAt(50.0, 50.0), PointAt(150.0, 50.0), PointAt(50.0, 150.0), PointAt(150.0, 150.0));
    testResult := QuadsIntersect(testQuad1, testQuad2);
    AssertTrue(testResult);
end;
procedure TIntegrationTests.TestSetQuadPointIntegration;
begin
    testQuad := QuadFrom(PointAt(0.0, 0.0), PointAt(100.0, 0.0), PointAt(0.0, 100.0), PointAt(100.0, 100.0));
    SetQuadPoint(testQuad, 2, PointAt(50.0, 150.0));
    AssertTrue(PointInQuad(PointAt(50.0, 150.0), testQuad));
end;
procedure TIntegrationTests.TestTrianglesFromIntegration;
begin
    testQuad := QuadFrom(PointAt(0.0, 0.0), PointAt(100.0, 0.0), PointAt(0.0, 100.0), PointAt(100.0, 100.0));
    testTriangles := TrianglesFrom(testQuad);
    AssertEquals(Size(testTriangles), 2);
end;
procedure TIntegrationTests.TestInsetRectangleIntegration;
begin
    testRectangle := RectangleFrom(0.0, 0.0, 100.0, 100.0);
    testInsetRectangle := InsetRectangle(testRectangle, 10.0);
    AssertEquals(RectangleLeft(testInsetRectangle), 10.0);
    AssertEquals(RectangleTop(testInsetRectangle), 10.0);
    AssertEquals(RectangleRight(testInsetRectangle), 90.0);
    AssertEquals(RectangleBottom(testInsetRectangle), 90.0);
end;
procedure TIntegrationTests.TestIntersectionIntegration;
begin
    testRect1 := RectangleFrom(0.0, 0.0, 10.0, 10.0);
    testRect2 := RectangleFrom(5.0, 5.0, 10.0, 10.0);
    testIntersection := Intersection(testRect1, testRect2);
    AssertEquals(RectangleLeft(testIntersection), 5.0);
    AssertEquals(RectangleTop(testIntersection), 5.0);
    AssertEquals(RectangleRight(testIntersection), 10.0);
    AssertEquals(RectangleBottom(testIntersection), 10.0);
end;
procedure TIntegrationTests.TestRectangleAroundCircleIntegration;
begin
    testCircle := CircleAt(100.0, 100.0, 50.0);
    testRectangle := RectangleAround(testCircle);
    AssertEquals(RectangleLeft(testRectangle), 50.0);
    AssertEquals(RectangleTop(testRectangle), 50.0);
    AssertEquals(RectangleRight(testRectangle), 150.0);
    AssertEquals(RectangleBottom(testRectangle), 150.0);
end;
procedure TIntegrationTests.TestRectangleAroundLineIntegration;
begin
    testLine := LineFrom(PointAt(10.0, 10.0), PointAt(50.0, 50.0));
    testRectangle := RectangleAround(testLine);
    AssertTrue(PointInRectangle(PointAt(10.0, 10.0), testRectangle));
    AssertTrue(PointInRectangle(PointAt(50.0, 50.0), testRectangle));
end;
procedure TIntegrationTests.TestRectangleAroundQuadIntegration;
begin
    testQuad := QuadFrom(PointAt(0.0, 0.0), PointAt(100.0, 0.0), PointAt(0.0, 100.0), PointAt(100.0, 100.0));
    testRectangle := RectangleAround(testQuad);
    AssertEquals(RectangleLeft(testRectangle), 0.0);
    AssertEquals(RectangleTop(testRectangle), 0.0);
    AssertEquals(RectangleRight(testRectangle), 100.0);
    AssertEquals(RectangleBottom(testRectangle), 100.0);
end;
procedure TIntegrationTests.TestRectangleAroundTriangleIntegration;
begin
    testTriangle := TriangleFrom(PointAt(0.0, 0.0), PointAt(100.0, 0.0), PointAt(50.0, 100.0));
    testRectangle := RectangleAround(testTriangle);
    AssertEquals(RectangleLeft(testRectangle), 0.0);
    AssertEquals(RectangleTop(testRectangle), 0.0);
    AssertEquals(RectangleRight(testRectangle), 100.0);
    AssertEquals(RectangleBottom(testRectangle), 100.0);
end;
procedure TIntegrationTests.TestRectangleBottomIntegration;
begin
    testRectangle := RectangleFrom(10.0, 20.0, 50.0, 60.0);
    AssertEquals(RectangleBottom(testRectangle), 80.0);
end;
procedure TIntegrationTests.TestRectangleCenterIntegration;
begin
    testRectangle := RectangleFrom(PointAt(0.0, 0.0), 100.0, 100.0);
    testCenterPoint := RectangleCenter(testRectangle);
    AssertEquals(PointPointDistance(PointAt(50.0, 50.0), testCenterPoint), 0.0);
end;
procedure TIntegrationTests.TestRectangleFromPointAndSizeIntegration;
begin
    testPoint := PointAt(10.0, 20.0);
    testRectangle := RectangleFrom(testPoint, 50.0, 30.0);
    AssertEquals(RectangleLeft(testRectangle), 10.0);
    AssertEquals(RectangleTop(testRectangle), 20.0);
    AssertEquals(RectangleRight(testRectangle), 60.0);
    AssertEquals(RectangleBottom(testRectangle), 50.0);
end;
procedure TIntegrationTests.TestRectangleFromPointsIntegration;
begin
    testPoint1 := PointAt(0.0, 0.0);
    testPoint2 := PointAt(100.0, 100.0);
    testRectangle := RectangleFrom(testPoint1, testPoint2);
    AssertEquals(RectangleLeft(testRectangle), 0.0);
    AssertEquals(RectangleTop(testRectangle), 0.0);
    AssertEquals(RectangleRight(testRectangle), 100.0);
    AssertEquals(RectangleBottom(testRectangle), 100.0);
end;
procedure TIntegrationTests.TestRectangleFromIntegration;
begin
    testRectangle := RectangleFrom(10.0, 20.0, 50.0, 30.0);
    AssertEquals(RectangleLeft(testRectangle), 10.0);
    AssertEquals(RectangleTop(testRectangle), 20.0);
    AssertEquals(RectangleRight(testRectangle), 60.0);
    AssertEquals(RectangleBottom(testRectangle), 50.0);
end;
procedure TIntegrationTests.TestRectangleLeftIntegration;
begin
    testRectangle := RectangleFrom(10.0, 20.0, 50.0, 60.0);
    testLeft := RectangleLeft(testRectangle);
    AssertEquals(testLeft, 10.0);
end;
procedure TIntegrationTests.TestRectangleOffsetByIntegration;
begin
    testRectangle := RectangleFrom(10.0, 10.0, 50.0, 50.0);
    testOffsetRectangle := RectangleOffsetBy(testRectangle, VectorFromAngle(20.0, 30.0));
    AssertEquals(RectangleLeft(testOffsetRectangle), 30.0);
    AssertEquals(RectangleTop(testOffsetRectangle), 40.0);
end;
procedure TIntegrationTests.TestRectangleRightIntegration;
begin
    testRectangle := RectangleFrom(10.0, 20.0, 50.0, 60.0);
    AssertEquals(RectangleRight(testRectangle), 60.0);
end;
procedure TIntegrationTests.TestRectangleToStringIntegration;
begin
    testRectangle := RectangleFrom(10.0, 20.0, 30.0, 40.0);
    testString := RectangleToString(testRectangle);
    AssertEquals(testString, "Rectangle(x: 10, y: 20, width: 30, height: 40)");
end;
procedure TIntegrationTests.TestRectangleTopIntegration;
begin
    testRectangle := RectangleFrom(10.0, 20.0, 50.0, 60.0);
    testTop := RectangleTop(testRectangle);
    AssertEquals(testTop, 20.0);
end;
procedure TIntegrationTests.TestRectanglesIntersectIntegration;
begin
    testRect1 := RectangleFrom(0.0, 0.0, 10.0, 10.0);
    testRect2 := RectangleFrom(5.0, 5.0, 10.0, 10.0);
    testResult := RectanglesIntersect(testRect1, testRect2);
    AssertTrue(testResult);
end;
procedure TIntegrationTests.TestTriangleBarycenterIntegration;
begin
    testTriangle := TriangleFrom(PointAt(0.0, 0.0), PointAt(100.0, 0.0), PointAt(50.0, 86.6));
    testBarycenter := TriangleBarycenter(testTriangle);
    AssertEquals(testBarycenter.x, 50.0);
    AssertEquals(testBarycenter.y, 28.866666666666667);
end;
procedure TIntegrationTests.TestTriangleFromIntegration;
begin
    testPoint1 := PointAt(0.0, 0.0);
    testPoint2 := PointAt(100.0, 0.0);
    testPoint3 := PointAt(50.0, 100.0);
    testTriangle := TriangleFrom(testPoint1, testPoint2, testPoint3);
    AssertTrue(PointInTriangle(PointAt(50.0, 50.0), testTriangle));
end;
procedure TIntegrationTests.TestTriangleFromFromCoordinatesIntegration;
begin
    testTriangle := TriangleFrom(0.0, 0.0, 100.0, 0.0, 50.0, 100.0);
    AssertTrue(PointInTriangle(PointAt(50.0, 50.0), testTriangle));
    AssertFalse(PointInTriangle(PointAt(150.0, 150.0), testTriangle));
end;
procedure TIntegrationTests.TestTriangleRectangleIntersectIntegration;
begin
    testTriangle := TriangleFrom(PointAt(0.0, 0.0), PointAt(100.0, 0.0), PointAt(50.0, 100.0));
    testRectangle := RectangleFrom(PointAt(40.0, 40.0), 60.0, 60.0);
    testResult := TriangleRectangleIntersect(testTriangle, testRectangle);
    AssertTrue(testResult);
end;
procedure TIntegrationTests.TestTriangleToStringIntegration;
begin
    testTriangle := TriangleFrom(PointAt(0.0, 0.0), PointAt(100.0, 0.0), PointAt(50.0, 100.0));
    testTriangleString := TriangleToString(testTriangle);
    AssertNotEquals(testTriangleString, "");
end;
procedure TIntegrationTests.TestTrianglesIntersectIntegration;
begin
    testTriangle1 := TriangleFrom(PointAt(0.0, 0.0), PointAt(2.0, 0.0), PointAt(1.0, 2.0));
    testTriangle2 := TriangleFrom(PointAt(1.0, 0.0), PointAt(3.0, 0.0), PointAt(2.0, 2.0));
    testResult := TrianglesIntersect(testTriangle1, testTriangle2);
    AssertTrue(testResult);
end;
end;

procedure RegisterTests;
begin
TestFramework.RegisterTest(TIntegrationTests.Suite);
end;
