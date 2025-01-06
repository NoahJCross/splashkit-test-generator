uses SplashKit, TestFramework, ../Helpers;
type
    TTestGeometry = class(TTestCase)
    protected
        procedure Setup; override;
    end;
    procedure TestCenterPointOfCircleIntegration;
begin
    testCircle := CircleAt(100.0, 100.0, 50.0);
    testCenterPoint := CenterPoint(testCircle);
    AssertEquals(testCenterPoint, PointAt(100.0, 100.0));
end;
procedure TestCircleAtIntegration;
begin
    OpenWindow('Test Window 1', 800, 600);
    CleanupWindow := TWindowCleanup.Create;
    testCircle := CircleAt(PointAt(400.0, 300.0), 50.0);
    DrawCircle(ColorBlack(), testCircle);
    RefreshScreen();
    AssertTrue(PointInCircle(PointAt(400.0, 300.0), testCircle));
end;
procedure TestCircleAtFromPointsIntegration;
begin
    OpenWindow('Test Window 2', 800, 600);
    CleanupWindow := TWindowCleanup.Create;
    testCircle := CircleAt(400.0, 300.0, 50.0);
    DrawCircle(ColorBlack(), testCircle, OptionDefaults());
    RefreshScreen();
    AssertTrue(PointInCircle(PointAt(400.0, 300.0), testCircle));
end;
procedure TestCircleRadiusIntegration;
begin
    testCircle := CircleAt(100.0, 100.0, 50.0);
    testRadius := CircleRadius(testCircle);
    AssertEquals(50.0, testRadius);
end;
procedure TestCircleTriangleIntersectIntegration;
begin
    testCircle := CircleAt(100.0, 100.0, 50.0);
    testTriangle := TriangleFrom(PointAt(50.0, 50.0), PointAt(150.0, 50.0), PointAt(100.0, 150.0));
    testResult := CircleTriangleIntersect(testCircle, testTriangle);
    AssertTrue(testResult);
end;
procedure TestCircleTriangleIntersectGetClosestPointIntegration;
begin
    testCircle := CircleAt(100.0, 100.0, 50.0);
    testTriangle := TriangleFrom(PointAt(50.0, 50.0), PointAt(150.0, 50.0), PointAt(100.0, 150.0));
    testPoint := PointAt(0.0, 0.0);
    testResult := CircleTriangleIntersect(testCircle, testTriangle, @testPoint);
    AssertTrue(testResult);
end;
procedure TestCircleXIntegration;
begin
    testCircle := CircleAt(100.0, 100.0, 50.0);
    AssertEquals(100.0, CircleX(testCircle));
end;
procedure TestCircleYIntegration;
begin
    testCircle := CircleAt(100.0, 150.0, 50.0);
    AssertEquals(150.0, CircleY(testCircle));
end;
procedure TestCirclesIntersectIntegration;
begin
    testCircle1 := CircleAt(0.0, 0.0, 50.0);
    testCircle2 := CircleAt(100.0, 0.0, 50.0);
    testResult1 := CirclesIntersect(testCircle1, testCircle2);
    AssertFalse(testResult1);
    testCircle3 := CircleAt(50.0, 0.0, 50.0);
    testResult2 := CirclesIntersect(testCircle1, testCircle3);
    AssertTrue(testResult2);
end;
procedure TestCirclesIntersectUsingValuesIntegration;
begin
    testIntersectResult := CirclesIntersect(0.0, 0.0, 5.0, 5.0, 0.0, 5.0);
    AssertTrue(testIntersectResult);
    testNotIntersectResult := CirclesIntersect(0.0, 0.0, 5.0, 11.0, 0.0, 5.0);
    AssertFalse(testNotIntersectResult);
end;
procedure TestClosestPointOnCircleIntegration;
begin
    testCircle := CircleAt(100.0, 100.0, 50.0);
    testPoint := PointAt(200.0, 100.0);
    testClosestPoint := ClosestPointOnCircle(testPoint, testCircle);
    AssertEquals(CircleRadius(testCircle), PointPointDistance(testClosestPoint, testPoint));
end;
procedure TestClosestPointOnLineFromCircleIntegration;
begin
    testCircle := CircleAt(100.0, 100.0, 50.0);
    testLine := LineFrom(50.0, 50.0, 150.0, 150.0);
    testClosestPoint := ClosestPointOnLineFromCircle(testCircle, testLine);
    AssertTrue(PointOnLine(testClosestPoint, testLine));
end;
procedure TestClosestPointOnRectFromCircleIntegration;
begin
    testCircle := CircleAt(100.0, 100.0, 50.0);
    testRectangle := RectangleFrom(100.0, 50.0, 100.0, 100.0);
    testClosestPoint := ClosestPointOnRectFromCircle(testCircle, testRectangle);
    AssertTrue(PointInRectangle(testClosestPoint, testRectangle));
    testDistance := PointPointDistance(CenterPoint(testCircle), testClosestPoint);
    AssertTrue(testDistance <= CircleRadius(testCircle));
end;
procedure TestClosestPointOnTriangleFromCircleIntegration;
begin
    testCircle := CircleAt(100.0, 100.0, 50.0);
    testTriangle := TriangleFrom(PointAt(50.0, 50.0), PointAt(150.0, 50.0), PointAt(100.0, 150.0));
    testClosestPoint := ClosestPointOnTriangleFromCircle(testCircle, testTriangle);
    AssertTrue(PointInTriangle(testClosestPoint, testTriangle));
end;
procedure TestDistantPointOnCircleIntegration;
begin
    testCircle := CircleAt(100.0, 100.0, 50.0);
    testPoint := PointAt(100.0, 150.0);
    testDistantPoint := DistantPointOnCircle(testPoint, testCircle);
    AssertEquals(100.0, PointPointDistance(testPoint, testDistantPoint));
end;
procedure TestDistantPointOnCircleHeadingIntegration;
begin
    testCircle := CircleAt(100.0, 100.0, 50.0);
    testPoint1 := PointAt(150.0, 100.0);
    testHeading := VectorFromAngle(180.0, 1.0);
    testPoint2 := PointAt(0.0, 0.0);
    testResult := DistantPointOnCircleHeading(testPoint1, testCircle, testHeading, @testPoint2);
    AssertTrue(testResult);
    AssertTrue(Abs(50.0 - testPoint2.x) <= 2.0);
    AssertTrue(Abs(100.0 - testPoint2.y) <= 2.0);
end;
procedure TestRayCircleIntersectDistanceIntegration;
begin
    testCircle := CircleAt(100.0, 100.0, 50.0);
    testRayOrigin := PointAt(0.0, 0.0);
    testRayHeading := VectorFromAngle(45.0, 1.0);
    testDistance := RayCircleIntersectDistance(testRayOrigin, testRayHeading, testCircle);
    AssertEquals(91.4213562, testDistance);
end;
procedure TestTangentPointsIntegration;
begin
    testFromPt := PointAt(100.0, 100.0);
    testCircle := CircleAt(150.0, 150.0, 50.0);
    testPoint1 := PointAt(0.0, 0.0);
    testPoint2 := PointAt(0.0, 0.0);
    testResult := TangentPoints(testFromPt, testCircle, @testPoint1, @testPoint2);
    AssertTrue(testResult);
    AssertNotEquals(PointAt(0.0, 0.0), testPoint1);
    AssertNotEquals(PointAt(0.0, 0.0), testPoint2);
end;
procedure TestWidestPointsIntegration;
begin
    testCircle := CircleAt(100.0, 100.0, 50.0);
    testVector := VectorFromAngle(45.0, 45.0);
    testPoint1 := PointAt(0.0, 0.0);
    testPoint2 := PointAt(0.0, 0.0);
    WidestPoints(testCircle, testVector, @testPoint1, @testPoint2);
    AssertTrue(PointInCircle(PointAt(CircleX(testCircle), CircleY(testCircle)), testCircle));
    AssertTrue(PointInCircle(PointAt(CircleX(testCircle), CircleY(testCircle)), testCircle));
end;
procedure TestCosineIntegration;
begin
    testCosine0 := Cosine(0.0);
    AssertTrue(Abs(1.0 - testCosine0) <= 2.0);
    testCosine90 := Cosine(90.0);
    AssertTrue(Abs(0.0 - testCosine90) <= 2.0);
    testCosine180 := Cosine(180.0);
    AssertTrue(Abs(-1.0 - testCosine180) <= 2.0);
end;
procedure TestSineIntegration;
begin
    testSine0 := Sine(0.0);
    AssertTrue(Abs(0.0 - testSine0) <= 2.0);
    testSine90 := Sine(90.0);
    AssertTrue(Abs(1.0 - testSine90) <= 2.0);
    testSine180 := Sine(180.0);
    AssertTrue(Abs(0.0 - testSine180) <= 2.0);
    testSine270 := Sine(270.0);
    AssertEquals(-1.0, testSine270);
end;
procedure TestTangentIntegration;
begin
    testTangentResult := Tangent(45.0);
    AssertTrue((testTangentResult >= 1.0) and (testTangentResult <= 2.0));
end;
procedure TestClosestPointOnLineIntegration;
begin
    testLine := LineFrom(PointAt(0.0, 0.0), PointAt(10.0, 10.0));
    testClosestPoint := ClosestPointOnLine(PointAt(5.0, 5.0), testLine);
    AssertEquals(0.0, PointPointDistance(PointAt(5.0, 5.0), testClosestPoint));
end;
procedure TestClosestPointOnLinesIntegration;
begin
    testFromPt := PointAt(0.0, 0.0);
    testLine1 := LineFrom(PointAt(-10.0, 0.0), PointAt(10.0, 0.0));
    testLine2 := LineFrom(PointAt(0.0, -10.0), PointAt(0.0, 10.0));
    testIndex := 0;
    testLines := TArray<Line>.Create(testLine1, testLine2);
    testClosestPoint := ClosestPointOnLines(testFromPt, testLines, @testIndex);
    AssertEquals(0.0, PointPointDistance(testFromPt, testClosestPoint));
end;
procedure TestLineFromPointToPointIntegration;
begin
    testStartPoint := PointAt(0.0, 0.0);
    testEndPoint := PointAt(100.0, 100.0);
    testLine := LineFrom(testStartPoint, testEndPoint);
    AssertTrue(Abs(141.421356 - LineLength(testLine)) <= 2.0);
end;
procedure TestLineFromStartWithOffsetIntegration;
begin
    testStartPoint := PointAt(0.0, 0.0);
    testOffsetVector := VectorFromAngle(45.0, 10.0);
    testLine := LineFrom(testStartPoint, testOffsetVector);
    AssertTrue(PointOnLine(PointAt(0.0, 0.0), testLine));
    AssertTrue(PointOnLine(PointOffsetBy(testStartPoint, testOffsetVector), testLine));
end;
procedure TestLineFromVectorIntegration;
begin
    testVector := VectorFromAngle(100.0, 50.0);
    testLine := LineFrom(testVector);
    AssertEquals(PointAtOrigin(), testLine.start_point);
    AssertEquals(-8.682409286499023, testLine.end_point.x);
    AssertEquals(49.240386962890625, testLine.end_point.y);
end;
procedure TestLineFromIntegration;
begin
    testLine := LineFrom(0.0, 0.0, 10.0, 10.0);
    AssertTrue(Abs(14.1421356 - LineLength(testLine)) <= 2.0);
end;
procedure TestLineIntersectionPointIntegration;
begin
    testLine1 := LineFrom(0.0, 0.0, 10.0, 10.0);
    testLine2 := LineFrom(10.0, 0.0, 0.0, 10.0);
    testPoint := PointAt(0.0, 0.0);
    testIntersectionResult := LineIntersectionPoint(testLine1, testLine2, @testPoint);
    AssertTrue(testIntersectionResult);
end;
procedure TestLineIntersectsCircleIntegration;
begin
    testLine := LineFrom(0.0, 0.0, 10.0, 10.0);
    testCircle := CircleAt(5.0, 5.0, 3.0);
    testResult := LineIntersectsCircle(testLine, testCircle);
    AssertTrue(testResult);
end;
procedure TestLineIntersectsLinesIntegration;
begin
    testLine := LineFrom(0.0, 0.0, 10.0, 10.0);
    testLine1 := LineFrom(0.0, 10.0, 10.0, 0.0);
    testLine2 := LineFrom(20.0, 20.0, 30.0, 30.0);
    testLines := TArray<Line>.Create(testLine1, testLine2);
    testResult := LineIntersectsLines(testLine, testLines);
    AssertTrue(testResult);
end;
procedure TestLineIntersectsRectIntegration;
begin
    testRect := RectangleFrom(0.0, 0.0, 100.0, 100.0);
    testLine := LineFrom(PointAt(-50.0, 50.0), PointAt(150.0, 50.0));
    AssertTrue(LineIntersectsRect(testLine, testRect));
    testLineOutside := LineFrom(PointAt(-50.0, 150.0), PointAt(150.0, 150.0));
    AssertFalse(LineIntersectsRect(testLineOutside, testRect));
end;
procedure TestLineLengthIntegration;
begin
    testLine := LineFrom(PointAt(0.0, 0.0), PointAt(3.0, 4.0));
    testLength := LineLength(testLine);
    AssertEquals(5.0, testLength);
end;
procedure TestLineLengthSquaredIntegration;
begin
    testLine := LineFrom(PointAt(0.0, 0.0), PointAt(3.0, 4.0));
    testResult := LineLengthSquared(testLine);
    AssertEquals(25.0, testResult);
end;
procedure TestLineMidPointIntegration;
begin
    testLine := LineFrom(PointAt(0.0, 0.0), PointAt(100.0, 100.0));
    testMidPoint := LineMidPoint(testLine);
    AssertEquals(0.0, PointPointDistance(testMidPoint, PointAt(50.0, 50.0)));
end;
procedure TestLineNormalIntegration;
begin
    testLine := LineFrom(0.0, 0.0, 1.0, 1.0);
    testNormal := LineNormal(testLine);
    AssertEquals(-0.7071067811865475, testNormal.x);
    AssertEquals(0.7071067811865475, testNormal.y);
end;
procedure TestLineToStringIntegration;
begin
    testLine := LineFrom(PointAt(0.0, 0.0), PointAt(100.0, 100.0));
    testLineString := LineToString(testLine);
    AssertNotEquals('Line from Pt @0:0 to Pt @100:100', testLineString);
end;
procedure TestLinesFromRectangleIntegration;
begin
    testRectangle := RectangleFrom(0.0, 0.0, 100.0, 100.0);
    testLines := LinesFrom(testRectangle);
    AssertEquals(4, Length(testLines));
end;
procedure TestLinesFromTriangleIntegration;
begin
    testTriangle := TriangleFrom(PointAt(0.0, 0.0), PointAt(100.0, 0.0), PointAt(50.0, 86.6));
    testLines := LinesFrom(testTriangle);
    AssertEquals(3, Length(testLines));
end;
procedure TestLinesIntersectIntegration;
begin
    testLine1 := LineFrom(PointAt(0.0, 0.0), PointAt(10.0, 10.0));
    testLine2 := LineFrom(PointAt(5.0, 0.0), PointAt(5.0, 10.0));
    testResult := LinesIntersect(testLine1, testLine2);
    AssertTrue(testResult);
end;
procedure TestPointAtIntegration;
begin
    testPoint := PointAt(10.0, 20.0);
    AssertEquals(10.0, testPoint.x);
    AssertEquals(20.0, testPoint.y);
end;
procedure TestPointAtOriginIntegration;
begin
    testPoint := PointAtOrigin();
    AssertEquals(0.0, testPoint.x);
    AssertEquals(0.0, testPoint.y);
end;
procedure TestPointInCircleIntegration;
begin
    testCircle := CircleAt(100.0, 100.0, 50.0);
    AssertTrue(PointInCircle(PointAt(100.0, 100.0), testCircle));
    AssertTrue(PointInCircle(PointAt(150.0, 100.0), testCircle));
    AssertFalse(PointInCircle(PointAt(200.0, 100.0), testCircle));
end;
procedure TestPointInCircleWithValuesIntegration;
begin
    testResult1 := PointInCircle(100.0, 100.0, 100.0, 100.0, 50.0);
    AssertTrue(testResult1);
    testResult2 := PointInCircle(200.0, 100.0, 100.0, 100.0, 50.0);
    AssertFalse(testResult2);
end;
procedure TestPointInQuadIntegration;
begin
    testQuad := QuadFrom(PointAt(0.0, 0.0), PointAt(100.0, 0.0), PointAt(100.0, 100.0), PointAt(0.0, 100.0));
    AssertTrue(PointInQuad(PointAt(50.0, 51.0), testQuad));
    AssertFalse(PointInQuad(PointAt(150.0, 50.0), testQuad));
end;
procedure TestPointInRectangleIntegration;
begin
    testRectangle := RectangleFrom(0.0, 0.0, 100.0, 100.0);
    testPointInside := PointAt(50.0, 50.0);
    testPointOutside := PointAt(150.0, 150.0);
    AssertTrue(PointInRectangle(testPointInside, testRectangle));
    AssertFalse(PointInRectangle(testPointOutside, testRectangle));
end;
procedure TestPointInRectangleWithValuesIntegration;
begin
    testResultInside := PointInRectangle(10.0, 10.0, 0.0, 0.0, 20.0, 20.0);
    AssertTrue(testResultInside);
    testResultOutside := PointInRectangle(25.0, 25.0, 0.0, 0.0, 20.0, 20.0);
    AssertFalse(testResultOutside);
end;
procedure TestPointInTriangleIntegration;
begin
    testTriangle := TriangleFrom(PointAt(0.0, 0.0), PointAt(100.0, 0.0), PointAt(50.0, 100.0));
    AssertTrue(PointInTriangle(PointAt(50.0, 50.0), testTriangle));
    AssertFalse(PointInTriangle(PointAt(150.0, 50.0), testTriangle));
end;
procedure TestPointLineDistanceIntegration;
begin
    testPoint := PointAt(0.0, 0.0);
    testLine := LineFrom(0.0, 0.0, 10.0, 10.0);
    testDistance := PointLineDistance(testPoint, testLine);
    AssertEquals(0.0, testDistance);
end;
procedure TestPointOffsetByIntegration;
begin
    testStartPoint := PointAt(10.0, 20.0);
    testOffset := VectorFromAngle(5.0, 10.0);
    testResultPoint := PointOffsetBy(testStartPoint, testOffset);
    AssertEquals(19.961947202682495, testResultPoint.x);
    AssertEquals(20.87155744433403, testResultPoint.y);
end;
procedure TestPointOffsetFromOriginIntegration;
begin
    testVector := VectorFromAngle(10.0, 20.0);
    testPoint := PointOffsetFromOrigin(testVector);
    AssertEquals(19.696154594421387, testPoint.x);
    AssertEquals(3.472963571548462, testPoint.y);
end;
procedure TestPointOnLineIntegration;
begin
    testLine := LineFrom(0.0, 0.0, 10.0, 10.0);
    testPointOnLine := PointAt(5.0, 5.0);
    testPointOffLine := PointAt(15.0, 15.0);
    AssertTrue(PointOnLine(testPointOnLine, testLine));
    AssertFalse(PointOnLine(testPointOffLine, testLine));
end;
procedure TestPointOnLineWithProximityIntegration;
begin
    testLine := LineFrom(PointAt(0.0, 0.0), PointAt(10.0, 10.0));
    testPointOnLine := PointAt(5.0, 5.0);
    testPointNearLine := PointAt(5.1, 5.1);
    testPointFarFromLine := PointAt(15.0, 15.0);
    AssertTrue(PointOnLine(testPointOnLine, testLine, 0.1));
    AssertTrue(PointOnLine(testPointNearLine, testLine, 0.2));
    AssertFalse(PointOnLine(testPointFarFromLine, testLine, 0.1));
end;
procedure TestPointPointAngleIntegration;
begin
    testPoint1 := PointAt(0.0, 0.0);
    testPoint2 := PointAt(1.0, 0.0);
    testAngle := PointPointAngle(testPoint1, testPoint2);
    AssertEquals(0.0, testAngle);
end;
procedure TestPointPointDistanceIntegration;
begin
    testPoint1 := PointAt(0.0, 0.0);
    testPoint2 := PointAt(3.0, 4.0);
    testDistance := PointPointDistance(testPoint1, testPoint2);
    AssertEquals(5.0, testDistance);
end;
procedure TestPointToStringIntegration;
begin
    testPoint := PointAt(10.0, 20.0);
    testString := PointToString(testPoint);
    AssertEquals('Pt @10.000000:20.000000', testString);
end;
procedure TestRandomBitmapPointIntegration;
begin
    testBitmap := CreateBitmap('Test Bitmap 1', 100, 100);
    CleanupBitmap := TBitmapCleanup.Create;
    testPoint := RandomBitmapPoint(testBitmap);
    AssertTrue((testPoint.x >= 0.0) and (testPoint.x <= BitmapWidth(testBitmap)));
    AssertTrue((testPoint.y >= 0.0) and (testPoint.y <= BitmapHeight(testBitmap)));
end;
procedure TestRandomScreenPointIntegration;
begin
    testWindow := OpenWindow('Test Window 3', 800, 600);
    CleanupWindow := TWindowCleanup.Create;
    testPoint := RandomScreenPoint();
    RefreshScreen();
    AssertTrue((testPoint.x >= 0.0) and (testPoint.x <= WindowWidth(testWindow)));
    AssertTrue((testPoint.y >= 0.0) and (testPoint.y <= WindowHeight(testWindow)));
end;
procedure TestRandomWindowPointIntegration;
begin
    testWindow := OpenWindow('Test Window 4', 800, 600);
    CleanupWindow := TWindowCleanup.Create;
    testPoint := RandomWindowPoint(testWindow);
    AssertTrue((testPoint.x >= 0.0) and (testPoint.x <= WindowWidth(testWindow)));
    AssertTrue((testPoint.y >= 0.0) and (testPoint.y <= WindowHeight(testWindow)));
end;
procedure TestSamePointIntegration;
begin
    testPoint1 := PointAt(10.0, 20.0);
    testPoint2 := PointAt(10.0, 20.0);
    testPoint3 := PointAt(10.0, 21.0);
    AssertTrue(SamePoint(testPoint1, testPoint2));
    AssertFalse(SamePoint(testPoint1, testPoint3));
end;
procedure TestQuadFromPointsIntegration;
begin
    testP1 := PointAt(0.0, 0.0);
    testP2 := PointAt(100.0, 0.0);
    testP3 := PointAt(0.0, 100.0);
    testP4 := PointAt(100.0, 100.0);
    testQuad := QuadFrom(testP1, testP2, testP3, testP4);
    AssertTrue(PointInQuad(PointAt(50.0, 51.0), testQuad));
end;
procedure TestQuadFromRectangleIntegration;
begin
    testRectangle := RectangleFrom(0.0, 0.0, 100.0, 100.0);
    testQuad := QuadFrom(testRectangle);
    AssertTrue(PointInQuad(PointAt(50.0, 51.0), testQuad));
    AssertFalse(PointInQuad(PointAt(150.0, 150.0), testQuad));
end;
procedure TestQuadFromRectangleWithTransformationIntegration;
begin
    testRectangle := RectangleFrom(0.0, 0.0, 100.0, 100.0);
    testTransform := RotationMatrix(45.0);
    testQuad := QuadFrom(testRectangle, testTransform);
    AssertTrue(PointInQuad(PointAt(50.0, 51.0), testQuad));
    AssertFalse(PointInQuad(PointAt(150.0, 150.0), testQuad));
end;
procedure TestQuadFromIntegration;
begin
    testQuad := QuadFrom(0.0, 0.0, 100.0, 0.0, 0.0, 100.0, 100.0, 100.0);
    AssertTrue(PointInQuad(PointAt(50.0, 51.0), testQuad));
    AssertFalse(PointInQuad(PointAt(150.0, 150.0), testQuad));
end;
procedure TestQuadsIntersectIntegration;
begin
    testQuad1 := QuadFrom(PointAt(0.0, 0.0), PointAt(100.0, 0.0), PointAt(0.0, 100.0), PointAt(100.0, 100.0));
    testQuad2 := QuadFrom(PointAt(50.0, 50.0), PointAt(150.0, 50.0), PointAt(50.0, 150.0), PointAt(150.0, 150.0));
    testResult := QuadsIntersect(testQuad1, testQuad2);
    AssertTrue(testResult);
end;
procedure TestSetQuadPointIntegration;
begin
    testQuad := QuadFrom(PointAt(0.0, 0.0), PointAt(100.0, 0.0), PointAt(0.0, 100.0), PointAt(100.0, 100.0));
    AssertFalse(PointInQuad(PointAt(50.0, 150.0), testQuad));
    SetQuadPoint(@testQuad, 2, PointAt(50.0, 150.0));
    AssertTrue(PointInQuad(PointAt(50.0, 150.0), testQuad));
end;
procedure TestTrianglesFromIntegration;
begin
    testQuad := QuadFrom(PointAt(0.0, 0.0), PointAt(100.0, 0.0), PointAt(0.0, 100.0), PointAt(100.0, 100.0));
    testTriangles := TrianglesFrom(testQuad);
    AssertEquals(2, Length(testTriangles));
end;
procedure TestInsetRectangleIntegration;
begin
    testRectangle := RectangleFrom(0.0, 0.0, 100.0, 100.0);
    testInsetRectangle := InsetRectangle(testRectangle, 10.0);
    AssertEquals(10.0, RectangleLeft(testInsetRectangle));
    AssertEquals(10.0, RectangleTop(testInsetRectangle));
    AssertEquals(90.0, RectangleRight(testInsetRectangle));
    AssertEquals(90.0, RectangleBottom(testInsetRectangle));
end;
procedure TestIntersectionIntegration;
begin
    testRect1 := RectangleFrom(0.0, 0.0, 10.0, 10.0);
    testRect2 := RectangleFrom(5.0, 5.0, 10.0, 10.0);
    testIntersection := Intersection(testRect1, testRect2);
    AssertEquals(5.0, RectangleLeft(testIntersection));
    AssertEquals(5.0, RectangleTop(testIntersection));
    AssertEquals(10.0, RectangleRight(testIntersection));
    AssertEquals(10.0, RectangleBottom(testIntersection));
end;
procedure TestRectangleAroundCircleIntegration;
begin
    testCircle := CircleAt(100.0, 100.0, 50.0);
    testRectangle := RectangleAround(testCircle);
    AssertEquals(50.0, RectangleLeft(testRectangle));
    AssertEquals(50.0, RectangleTop(testRectangle));
    AssertEquals(150.0, RectangleRight(testRectangle));
    AssertEquals(150.0, RectangleBottom(testRectangle));
end;
procedure TestRectangleAroundLineIntegration;
begin
    testLine := LineFrom(PointAt(10.0, 10.0), PointAt(50.0, 50.0));
    testRectangle := RectangleAround(testLine);
    AssertTrue(PointInRectangle(PointAt(10.0, 10.0), testRectangle));
    AssertTrue(PointInRectangle(PointAt(50.0, 50.0), testRectangle));
end;
procedure TestRectangleAroundQuadIntegration;
begin
    testQuad := QuadFrom(PointAt(0.0, 0.0), PointAt(100.0, 0.0), PointAt(0.0, 100.0), PointAt(100.0, 100.0));
    testRectangle := RectangleAround(testQuad);
    AssertEquals(0.0, RectangleLeft(testRectangle));
    AssertEquals(0.0, RectangleTop(testRectangle));
    AssertEquals(100.0, RectangleRight(testRectangle));
    AssertEquals(100.0, RectangleBottom(testRectangle));
end;
procedure TestRectangleAroundTriangleIntegration;
begin
    testTriangle := TriangleFrom(PointAt(0.0, 0.0), PointAt(100.0, 0.0), PointAt(50.0, 100.0));
    testRectangle := RectangleAround(testTriangle);
    AssertEquals(0.0, RectangleLeft(testRectangle));
    AssertEquals(0.0, RectangleTop(testRectangle));
    AssertEquals(100.0, RectangleRight(testRectangle));
    AssertEquals(100.0, RectangleBottom(testRectangle));
end;
procedure TestRectangleBottomIntegration;
begin
    testRectangle := RectangleFrom(10.0, 20.0, 50.0, 60.0);
    AssertEquals(80.0, RectangleBottom(testRectangle));
end;
procedure TestRectangleCenterIntegration;
begin
    testRectangle := RectangleFrom(PointAt(0.0, 0.0), 100.0, 100.0);
    testCenterPoint := RectangleCenter(testRectangle);
    AssertEquals(0.0, PointPointDistance(PointAt(50.0, 50.0), testCenterPoint));
end;
procedure TestRectangleFromPointAndSizeIntegration;
begin
    testPoint := PointAt(10.0, 20.0);
    testRectangle := RectangleFrom(testPoint, 50.0, 30.0);
    AssertEquals(10.0, RectangleLeft(testRectangle));
    AssertEquals(20.0, RectangleTop(testRectangle));
    AssertEquals(60.0, RectangleRight(testRectangle));
    AssertEquals(50.0, RectangleBottom(testRectangle));
end;
procedure TestRectangleFromPointsIntegration;
begin
    testPoint1 := PointAt(0.0, 0.0);
    testPoint2 := PointAt(100.0, 100.0);
    testRectangle := RectangleFrom(testPoint1, testPoint2);
    AssertEquals(0.0, RectangleLeft(testRectangle));
    AssertEquals(0.0, RectangleTop(testRectangle));
    AssertEquals(100.0, RectangleRight(testRectangle));
    AssertEquals(100.0, RectangleBottom(testRectangle));
end;
procedure TestRectangleFromIntegration;
begin
    testRectangle := RectangleFrom(10.0, 20.0, 50.0, 30.0);
    AssertEquals(10.0, RectangleLeft(testRectangle));
    AssertEquals(20.0, RectangleTop(testRectangle));
    AssertEquals(60.0, RectangleRight(testRectangle));
    AssertEquals(50.0, RectangleBottom(testRectangle));
end;
procedure TestRectangleLeftIntegration;
begin
    testRectangle := RectangleFrom(10.0, 20.0, 50.0, 60.0);
    testLeft := RectangleLeft(testRectangle);
    AssertEquals(10.0, testLeft);
end;
procedure TestRectangleOffsetByIntegration;
begin
    testRectangle := RectangleFrom(10.0, 10.0, 50.0, 50.0);
    testOffsetRectangle := RectangleOffsetBy(testRectangle, VectorTo(20.0, 30.0));
    AssertEquals(30.0, RectangleLeft(testOffsetRectangle));
    AssertEquals(40.0, RectangleTop(testOffsetRectangle));
end;
procedure TestRectangleRightIntegration;
begin
    testRectangle := RectangleFrom(10.0, 20.0, 50.0, 60.0);
    AssertEquals(60.0, RectangleRight(testRectangle));
end;
procedure TestRectangleToStringIntegration;
begin
    testRectangle := RectangleFrom(10.0, 20.0, 30.0, 40.0);
    testString := RectangleToString(testRectangle);
    AssertEquals('Rect @10,20 30x40', testString);
end;
procedure TestRectangleTopIntegration;
begin
    testRectangle := RectangleFrom(10.0, 20.0, 50.0, 60.0);
    testTop := RectangleTop(testRectangle);
    AssertEquals(20.0, testTop);
end;
procedure TestRectanglesIntersectIntegration;
begin
    testRect1 := RectangleFrom(0.0, 0.0, 10.0, 10.0);
    testRect2 := RectangleFrom(5.0, 5.0, 10.0, 10.0);
    testResult := RectanglesIntersect(testRect1, testRect2);
    AssertTrue(testResult);
end;
procedure TestTriangleBarycenterIntegration;
begin
    testTriangle := TriangleFrom(PointAt(0.0, 0.0), PointAt(100.0, 0.0), PointAt(50.0, 50.0));
    testBarycenter := TriangleBarycenter(testTriangle);
    AssertEquals(50.0, testBarycenter.x);
    AssertTrue(Abs(16.67 - testBarycenter.y) <= 2.0);
end;
procedure TestTriangleFromIntegration;
begin
    testPoint1 := PointAt(0.0, 0.0);
    testPoint2 := PointAt(100.0, 0.0);
    testPoint3 := PointAt(50.0, 100.0);
    testTriangle := TriangleFrom(testPoint1, testPoint2, testPoint3);
    AssertTrue(PointInTriangle(PointAt(50.0, 50.0), testTriangle));
end;
procedure TestTriangleFromFromCoordinatesIntegration;
begin
    testTriangle := TriangleFrom(0.0, 0.0, 100.0, 0.0, 50.0, 100.0);
    AssertTrue(PointInTriangle(PointAt(50.0, 50.0), testTriangle));
    AssertFalse(PointInTriangle(PointAt(150.0, 150.0), testTriangle));
end;
procedure TestTriangleRectangleIntersectIntegration;
begin
    testTriangle := TriangleFrom(PointAt(0.0, 0.0), PointAt(100.0, 0.0), PointAt(50.0, 100.0));
    testRectangle := RectangleFrom(PointAt(40.0, 40.0), 60.0, 60.0);
    testResult := TriangleRectangleIntersect(testTriangle, testRectangle);
    AssertTrue(testResult);
end;
procedure TestTriangleToStringIntegration;
begin
    testTriangle := TriangleFrom(PointAt(0.0, 0.0), PointAt(100.0, 0.0), PointAt(50.0, 100.0));
    testTriangleString := TriangleToString(testTriangle);
    AssertNotEquals('Triangle @Pt @0:0 - Pt @100:0 - Pt @50:100', testTriangleString);
end;
procedure TestTrianglesIntersectIntegration;
begin
    testTriangle1 := TriangleFrom(PointAt(0.0, 0.0), PointAt(2.0, 0.0), PointAt(1.0, 2.0));
    testTriangle2 := TriangleFrom(PointAt(1.0, 0.0), PointAt(3.0, 0.0), PointAt(2.0, 2.0));
    testResult := TrianglesIntersect(testTriangle1, testTriangle2);
    AssertTrue(testResult);
end;
end;

procedure RegisterTests;
begin
    #<Proc:0x00007faa116e2450 /mnt/c/Users/Noahc/Documents/aYear_2_semester_2/TeamProject/GitHubRepo/splashkit_test_generator/test_generator/config/languages/pascal_config.rb:138 (lambda)>
end;
