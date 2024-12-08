using Xunit;
using static SplashKitSDK.SplashKit;

namespace SplashKitTests
{
    public class IntegrationTests
    {
        [Fact]
        public void TestCenterPointIntegration()
        {
            var testCircle = CircleAt(100.0, 100.0, 50.0);
            var testCenterPoint = CenterPoint(testCircle);
            Assert.Equal(PointAt(100.0, 100.0), testCenterPoint);
        }
        [Fact]
        public void TestCircleAtIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testCircle = CircleAt(PointAt(400.0, 300.0), 50.0);
            DrawCircle(ColorBlack(), testCircle);
            RefreshScreen();
            Assert.True(PointInCircle(PointAt(400.0, 300.0), testCircle));
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestCircleAtFromPointsIntegration()
        {
            var testWindow = OpenWindow("Circle Test", 800, 600);
            var testCircle = CircleAt(400.0, 300.0, 50.0);
            DrawCircle(ColorBlack(), testCircle, OptionDefaults());
            RefreshScreen();
            Assert.True(PointInCircle(PointAt(400.0, 300.0), testCircle));
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestCircleRadiusIntegration()
        {
            var testCircle = CircleAt(100.0, 100.0, 50.0);
            var testRadius = CircleRadius(testCircle);
            Assert.Equal(testRadius, 50.0);
        }
        [Fact]
        public void TestCircleTriangleIntersectIntegration()
        {
            var testCircle = CircleAt(100.0, 100.0, 50.0);
            var testTriangle = TriangleFrom(PointAt(50.0, 50.0), PointAt(150.0, 50.0), PointAt(100.0, 150.0));
            var testResult = CircleTriangleIntersect(testCircle, testTriangle);
            Assert.True(testResult);
        }
        [Fact]
        public void TestCircleTriangleIntersectGetClosestPointIntegration()
        {
            var testCircle = CircleAt(100.0, 100.0, 50.0);
            var testTriangle = TriangleFrom(PointAt(50.0, 50.0), PointAt(150.0, 50.0), PointAt(100.0, 150.0));
            var testResult = CircleTriangleIntersect(testCircle, testTriangle, PointAt(0.0, 0.0));
            Assert.True(testResult);
            Assert.Equal(PointPointDistance(CenterPoint(testCircle), ClosestPointOnTriangleFromCircle(testCircle, testTriangle)), CircleRadius(testCircle));
        }
        [Fact]
        public void TestCircleXIntegration()
        {
            var testCircle = CircleAt(100.0, 100.0, 50.0);
            Assert.Equal(CircleX(testCircle), 100.0);
        }
        [Fact]
        public void TestCircleYIntegration()
        {
            var testCircle = CircleAt(100.0, 150.0, 50.0);
            Assert.Equal(CircleY(testCircle), 150.0);
        }
        [Fact]
        public void TestCirclesIntersectIntegration()
        {
            var testCircle1 = CircleAt(0.0, 0.0, 50.0);
            var testCircle2 = CircleAt(100.0, 0.0, 50.0);
            var testResult1 = CirclesIntersect(testCircle1, testCircle2);
            Assert.False(testResult1);
            var testCircle3 = CircleAt(50.0, 0.0, 50.0);
            var testResult2 = CirclesIntersect(testCircle1, testCircle3);
            Assert.True(testResult2);
        }
        [Fact]
        public void TestCirclesIntersectUsingValuesIntegration()
        {
            var testIntersectResult = CirclesIntersect(0.0, 0.0, 5.0, 10.0, 0.0, 5.0);
            Assert.True(testIntersectResult);
            var testNotIntersectResult = CirclesIntersect(0.0, 0.0, 5.0, 11.0, 0.0, 5.0);
            Assert.False(testNotIntersectResult);
        }
        [Fact]
        public void TestClosestPointOnCircleIntegration()
        {
            var testCircle = CircleAt(100.0, 100.0, 50.0);
            var testPoint = PointAt(150.0, 100.0);
            var testClosestPoint = ClosestPointOnCircle(testPoint, testCircle);
            Assert.Equal(PointPointDistance(testClosestPoint, testPoint), CircleRadius(testCircle));
        }
        [Fact]
        public void TestClosestPointOnLineFromCircleIntegration()
        {
            var testCircle = CircleAt(100.0, 100.0, 50.0);
            var testLine = LineFrom(50.0, 50.0, 150.0, 150.0);
            var testClosestPoint = ClosestPointOnLineFromCircle(testCircle, testLine);
            Assert.True(PointOnLine(testClosestPoint, testLine));
        }
        [Fact]
        public void TestClosestPointOnRectFromCircleIntegration()
        {
            var testCircle = CircleAt(100.0, 100.0, 50.0);
            var testRectangle = RectangleFrom(150.0, 50.0, 100.0, 100.0);
            var testClosestPoint = ClosestPointOnRectFromCircle(testCircle, testRectangle);
            Assert.True(PointInRectangle(testClosestPoint, testRectangle));
            Assert.Equal(PointPointDistance(CenterPoint(testCircle), testClosestPoint), CircleRadius(testCircle));
        }
        [Fact]
        public void TestClosestPointOnTriangleFromCircleIntegration()
        {
            var testCircle = CircleAt(100.0, 100.0, 50.0);
            var testTriangle = TriangleFrom(PointAt(50.0, 50.0), PointAt(150.0, 50.0), PointAt(100.0, 150.0));
            var testClosestPoint = ClosestPointOnTriangleFromCircle(testCircle, testTriangle);
            Assert.True(PointInTriangle(testClosestPoint, testTriangle));
        }
        [Fact]
        public void TestDistantPointOnCircleIntegration()
        {
            var testCircle = CircleAt(100.0, 100.0, 50.0);
            var testPoint = PointAt(100.0, 150.0);
            var testDistantPoint = DistantPointOnCircle(testPoint, testCircle);
            Assert.Equal(PointPointDistance(testPoint, testDistantPoint), CircleRadius(testCircle));
        }
        [Fact]
        public void TestDistantPointOnCircleHeadingIntegration()
        {
            var testCircle = CircleAt(100.0, 100.0, 50.0);
            var testPoint1 = PointAt(150.0, 100.0);
            var testHeading = VectorFromAngle(180.0, 1.0);
            var testPoint2 = PointAt(0.0);
            var testResult = DistantPointOnCircleHeading(testPoint1, testCircle, testHeading, testPoint2);
            Assert.True(testResult);
            Assert.Equal(testPoint1.X, 50.0);
            Assert.Equal(testPoint1.Y, 100.0);
        }
        [Fact]
        public void TestRayCircleIntersectDistanceIntegration()
        {
            var testCircle = CircleAt(100.0, 100.0, 50.0);
            var testRayOrigin = PointAt(0.0, 0.0);
            var testRayHeading = VectorFromAngle(45.0, 1.0);
            var testDistance = RayCircleIntersectDistance(testRayOrigin, testRayHeading, testCircle);
            Assert.InRange(testDistance, 70, 71);
        }
        [Fact]
        public void TestTangentPointsIntegration()
        {
            var testFromPt = PointAt(100.0, 100.0);
            var testCircle = CircleAt(150.0, 150.0, 50.0);
            var testPoint1 = PointAt(0.0, 0.0);
            var testPoint2 = PointAt(0.0, 0.0);
            var testResult = TangentPoints(testFromPt, testCircle, testPoint1, testPoint2);
            Assert.True(testResult);
            Assert.NotEqual(PointAt(0.0, 0.0), PointAt(0.0, 0.0));
        }
        [Fact]
        public void TestWidestPointsIntegration()
        {
            var testCircle = CircleAt(100.0, 100.0, 50.0);
            var testVector = VectorFromAngle(45.0);
            var testPoint1 = PointAt(0.0, 0.0);
            var testPoint2 = PointAt(0.0, 0.0);
            var testPoints = WidestPoints(testCircle, testVector, testPoint1, testPoint2);
            Assert.True(PointInCircle(PointAt(CircleX(testCircle), CircleY(testCircle)), testCircle));
            Assert.True(PointInCircle(PointAt(CircleX(testCircle), CircleY(testCircle)), testCircle));
        }
        [Fact]
        public void TestCosineIntegration()
        {
            var testCosine0 = Cosine(0.0);
            Assert.Equal(testCosine0, 1.0);
            var testCosine90 = Cosine(90.0);
            Assert.Equal(testCosine90, 0.0);
            var testCosine180 = Cosine(180.0);
            Assert.Equal(testCosine180, -1.0);
        }
        [Fact]
        public void TestSineIntegration()
        {
            var testSine0 = Sine(0.0);
            Assert.Equal(testSine0, 0.0);
            var testSine90 = Sine(90.0);
            Assert.Equal(testSine90, 1.0);
            var testSine180 = Sine(180.0);
            Assert.Equal(testSine180, 0.0);
            var testSine270 = Sine(270.0);
            Assert.Equal(testSine270, -1.0);
        }
        [Fact]
        public void TestTangentIntegration()
        {
            var testTangentResult = Tangent(45.0);
            Assert.InRange(testTangentResult, 1.0, 2.0);
        }
        [Fact]
        public void TestClosestPointOnLineIntegration()
        {
            var testLine = LineFrom(PointAt(0.0, 0.0), PointAt(10.0, 10.0));
            var testClosestPoint = ClosestPointOnLine(PointAt(5.0, 5.0), testLine);
            Assert.Equal(PointPointDistance(PointAt(5.0, 5.0), testClosestPoint), 0.0);
        }
        [Fact]
        public void TestClosestPointOnLinesIntegration()
        {
            var testFromPt = PointAt(0.0, 0.0);
            var testLine1 = LineFrom(PointAt(-10.0, 0.0), PointAt(10.0, 0.0));
            var testLine2 = LineFrom(PointAt(0.0, -10.0), PointAt(0.0, 10.0));
            var testIndex = {:step_type=>"variable", :variable_type=>"primitive", :variable_name=>"test_index", :value=>0}
            var testLines = {:step_type=>"variable", :variable_type=>"list", :target_type=>"line", :variable_name=>"test_lines", :value=>[{:value_type=>"variable", :variable_name=>"test_line1"}, {:value_type=>"variable", :variable_name=>"test_line2"}]}
            var testClosestPoint = ClosestPointOnLines(testFromPt, testLines, testIndex);
            Assert.Equal(PointPointDistance(testFromPt, testClosestPoint), 0.0);
        }
        [Fact]
        public void TestLineFromPointToPointIntegration()
        {
            var testStartPoint = PointAt(0.0, 0.0);
            var testEndPoint = PointAt(100.0, 100.0);
            var testLine = LineFrom(testStartPoint, testEndPoint);
            Assert.Equal(LineLength(testLine), 141.421356);
        }
        [Fact]
        public void TestLineFromStartWithOffsetIntegration()
        {
            var testStartPoint = PointAt(0.0, 0.0);
            var testOffsetVector = VectorFromAngle(45.0, 10.0);
            var testLine = LineFrom(testStartPoint, testOffsetVector);
            Assert.True(PointOnLine(PointAt(0.0, 0.0), testLine));
            Assert.True(PointOnLine(PointOffsetBy(testStartPoint, testOffsetVector), testLine));
        }
        [Fact]
        public void TestLineFromVectorIntegration()
        {
            var testVector = VectorFromAngle(100.0, 50.0);
            var testLine = LineFrom(testVector);
            Assert.Equal(testLine.Start_point, PointAtOrigin());
            Assert.Equal(testLine.End_point, PointAt(100.0, 50.0));
        }
        [Fact]
        public void TestLineFromIntegration()
        {
            var testLine = LineFrom(0.0, 0.0, 10.0, 10.0);
            Assert.Equal(LineLength(testLine), 14.1421356);
        }
        [Fact]
        public void TestLineIntersectionPointIntegration()
        {
            var testLine1 = LineFrom(0.0, 0.0, 10.0, 10.0);
            var testLine2 = LineFrom(10.0, 0.0, 0.0, 10.0);
            var testPoint = PointAt(0.0, 0.0);
            var testIntersectionResult = LineIntersectionPoint(testLine1, testLine2, testPoint);
            Assert.True(testIntersectionResult);
        }
        [Fact]
        public void TestLineIntersectsCircleIntegration()
        {
            var testLine = LineFrom(0.0, 0.0, 10.0, 10.0);
            var testCircle = CircleAt(5.0, 5.0, 3.0);
            var testResult = LineIntersectsCircle(testLine, testCircle);
            Assert.True(testResult);
        }
        [Fact]
        public void TestLineIntersectsLinesIntegration()
        {
            var testLine = LineFrom(0.0, 0.0, 10.0, 10.0);
            var testLine1 = LineFrom(5.0, 5.0, 15.0, 15.0);
            var testLine2 = LineFrom(20.0, 20.0, 30.0, 30.0);
            var testLines = new List<line> { testLine1, testLine2 };
            var testResult = LineIntersectsLines(testLine, testLines);
            Assert.True(testResult);
        }
        [Fact]
        public void TestLineIntersectsRectIntegration()
        {
            var testRect = RectangleFrom(0.0, 0.0, 100.0, 100.0);
            var testLine = LineFrom(PointAt(-50.0, 50.0), PointAt(150.0, 50.0));
            Assert.True(LineIntersectsRect(testLine, testRect));
            var testLineOutside = LineFrom(PointAt(-50.0, 150.0), PointAt(150.0, 150.0));
            Assert.False(LineIntersectsRect(testLineOutside, testRect));
        }
        [Fact]
        public void TestLineLengthIntegration()
        {
            var testLine = LineFrom(PointAt(0.0, 0.0), PointAt(3.0, 4.0));
            var testLength = LineLength(testLine);
            Assert.Equal(testLength, 5.0);
        }
        [Fact]
        public void TestLineLengthSquaredIntegration()
        {
            var testLine = LineFrom(PointAt(0.0, 0.0), PointAt(3.0, 4.0));
            var testResult = LineLengthSquared(testLine);
            Assert.Equal(testResult, 25.0);
        }
        [Fact]
        public void TestLineMidPointIntegration()
        {
            var testLine = LineFrom(PointAt(0.0, 0.0), PointAt(100.0, 100.0));
            var testMidPoint = LineMidPoint(testLine);
            Assert.Equal(PointPointDistance(testMidPoint, PointAt(50.0, 50.0)), 0.0);
        }
        [Fact]
        public void TestLineNormalIntegration()
        {
            var testLine = LineFrom(0.0, 0.0, 1.0, 1.0);
            var testNormal = LineNormal(testLine);
            Assert.Equal(testNormal.X, -1.0);
            Assert.Equal(testNormal.Y, 1.0);
        }
        [Fact]
        public void TestLineToStringIntegration()
        {
            var testLine = LineFrom(PointAt(0.0, 0.0), PointAt(100.0, 100.0));
            var testLineString = LineToString(testLine);
            Assert.NotEqual(testLineString, "");
        }
        [Fact]
        public void TestLinesFromRectangleIntegration()
        {
            var testRectangle = RectangleFrom(0.0, 0.0, 100.0, 100.0);
            var testLines = LinesFrom(testRectangle);
            Assert.Equal(Size(testLines), 4);
        }
        [Fact]
        public void TestLinesFromTriangleIntegration()
        {
            var testTriangle = TriangleFrom(PointAt(0.0, 0.0), PointAt(100.0, 0.0), PointAt(50.0, 86.6));
            var testLines = LinesFrom(testTriangle);
            Assert.Equal(Size(testLines), 3);
        }
        [Fact]
        public void TestLinesIntersectIntegration()
        {
            var testLine1 = LineFrom(PointAt(0.0, 0.0), PointAt(10.0, 10.0));
            var testLine2 = LineFrom(PointAt(5.0, 0.0), PointAt(5.0, 10.0));
            var testResult = LinesIntersect(testLine1, testLine2);
            Assert.True(testResult);
        }
        [Fact]
        public void TestPointAtIntegration()
        {
            var testPoint = PointAt(10.0, 20.0);
            Assert.Equal(testPoint.X, 10.0);
            Assert.Equal(testPoint.Y, 20.0);
        }
        [Fact]
        public void TestPointAtOriginIntegration()
        {
            var testPoint = PointAtOrigin();
            Assert.Equal(testPoint.X, 0.0);
            Assert.Equal(testPoint.Y, 0.0);
        }
        [Fact]
        public void TestPointInCircleIntegration()
        {
            var testCircle = CircleAt(100.0, 100.0, 50.0);
            Assert.True(PointInCircle(PointAt(100.0, 100.0), testCircle));
            Assert.True(PointInCircle(PointAt(150.0, 100.0), testCircle));
            Assert.False(PointInCircle(PointAt(200.0, 100.0), testCircle));
        }
        [Fact]
        public void TestPointInCircleWithValuesIntegration()
        {
            var testResult1 = PointInCircle(100.0, 100.0, 100.0, 100.0, 50.0);
            Assert.True(testResult1);
            var testResult2 = PointInCircle(200.0, 100.0, 100.0, 100.0, 50.0);
            Assert.False(testResult2);
        }
        [Fact]
        public void TestPointInQuadIntegration()
        {
            var testQuad = QuadFrom(PointAt(0.0, 0.0), PointAt(100.0, 0.0), PointAt(100.0, 100.0), PointAt(0.0, 100.0));
            Assert.True(PointInQuad(PointAt(50.0, 50.0), testQuad));
            Assert.False(PointInQuad(PointAt(150.0, 50.0), testQuad));
        }
        [Fact]
        public void TestPointInRectangleIntegration()
        {
            var testRectangle = RectangleFrom(0.0, 0.0, 100.0, 100.0);
            var testPointInside = PointAt(50.0, 50.0);
            var testPointOutside = PointAt(150.0, 150.0);
            Assert.True(PointInRectangle(testPointInside, testRectangle));
            Assert.False(PointInRectangle(testPointOutside, testRectangle));
        }
        [Fact]
        public void TestPointInRectangleWithValuesIntegration()
        {
            var testResultInside = PointInRectangle(10.0, 10.0, 0.0, 0.0, 20.0, 20.0);
            Assert.True(testResultInside);
            var testResultOutside = PointInRectangle(25.0, 25.0, 0.0, 0.0, 20.0, 20.0);
            Assert.False(testResultOutside);
        }
        [Fact]
        public void TestPointInTriangleIntegration()
        {
            var testTriangle = TriangleFrom(PointAt(0.0, 0.0), PointAt(100.0, 0.0), PointAt(50.0, 100.0));
            Assert.True(PointInTriangle(PointAt(50.0, 50.0), testTriangle));
            Assert.False(PointInTriangle(PointAt(150.0, 50.0), testTriangle));
        }
        [Fact]
        public void TestPointLineDistanceIntegration()
        {
            var testPoint = PointAt(0.0, 0.0);
            var testLine = LineFrom(0.0, 0.0, 10.0, 10.0);
            var testDistance = PointLineDistance(testPoint, testLine);
            Assert.Equal(testDistance, 0.0);
        }
        [Fact]
        public void TestPointOffsetByIntegration()
        {
            var testStartPoint = PointAt(10.0, 20.0);
            var testOffset = VectorFromAngle(5.0, 10.0);
            var testResultPoint = PointOffsetBy(testStartPoint, testOffset);
            Assert.Equal(testStartPoint.X, 15.0);
            Assert.Equal(testResultPoint.X, 30.0);
        }
        [Fact]
        public void TestPointOffsetFromOriginIntegration()
        {
            var testVector = VectorFromAngle(10.0, 20.0);
            var testPoint = PointOffsetFromOrigin(testVector);
            Assert.Equal(testPoint.X, 10.0);
            Assert.Equal(testPoint.Y, 20.0);
        }
        [Fact]
        public void TestPointOnLineIntegration()
        {
            var testLine = LineFrom(0.0, 0.0, 10.0, 10.0);
            var testPointOnLine = PointAt(5.0, 5.0);
            var testPointOffLine = PointAt(15.0, 15.0);
            Assert.True(PointOnLine(testPointOnLine, testLine));
            Assert.False(PointOnLine(testPointOffLine, testLine));
        }
        [Fact]
        public void TestPointOnLineWithProximityIntegration()
        {
            var testLine = LineFrom(PointAt(0.0, 0.0), PointAt(10.0, 10.0));
            var testPointOnLine = PointAt(5.0, 5.0);
            var testPointNearLine = PointAt(5.1, 5.1);
            var testPointFarFromLine = PointAt(15.0, 15.0);
            Assert.True(PointOnLine(testPointOnLine, testLine, 0.1));
            Assert.True(PointOnLine(testPointNearLine, testLine, 0.2));
            Assert.False(PointOnLine(testPointFarFromLine, testLine, 0.1));
        }
        [Fact]
        public void TestPointPointAngleIntegration()
        {
            var testPoint1 = PointAt(0.0, 0.0);
            var testPoint2 = PointAt(1.0, 0.0);
            var testAngle = PointPointAngle(testPoint1, testPoint2);
            Assert.Equal(testAngle, 0.0);
        }
        [Fact]
        public void TestPointPointDistanceIntegration()
        {
            var testPoint1 = PointAt(0.0, 0.0);
            var testPoint2 = PointAt(3.0, 4.0);
            var testDistance = PointPointDistance(testPoint1, testPoint2);
            Assert.Equal(testDistance, 5.0);
        }
        [Fact]
        public void TestPointToStringIntegration()
        {
            var testPoint = PointAt(10.0, 20.0);
            var testString = PointToString(testPoint);
            Assert.Equal(testString, "Point(10, 20)");
        }
        [Fact]
        public void TestRandomBitmapPointIntegration()
        {
            var testBitmap = CreateBitmap("test_bitmap", 100, 100);
            var testPoint = RandomBitmapPoint(testBitmap);
            Assert.InRange(testPoint.X, 0, BitmapWidth(testBitmap));
            Assert.InRange(testPoint.Y, 0, BitmapHeight(testBitmap));
            FreeBitmap(testBitmap);
        }
        [Fact]
        public void TestRandomScreenPointIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testPoint = RandomScreenPoint();
            RefreshScreen();
            Assert.InRange(testPoint.X, 0, WindowWidth(testWindow));
            Assert.InRange(testPoint.Y, 0, WindowHeight(testWindow));
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestRandomWindowPointIntegration()
        {
            var testWindow = OpenWindow("Test Window", 800, 600);
            var testPoint = RandomWindowPoint(testWindow);
            Assert.InRange(testPoint.X, 0, WindowWidth(testWindow));
            Assert.InRange(testPoint.Y, 0, WindowHeight(testWindow));
            CloseWindow(testWindow);
        }
        [Fact]
        public void TestSamePointIntegration()
        {
            var testPoint1 = PointAt(10.0, 20.0);
            var testPoint2 = PointAt(10.0, 20.0);
            var testPoint3 = PointAt(10.0, 21.0);
            Assert.True(SamePoint(testPoint1, testPoint2));
            Assert.False(SamePoint(testPoint1, testPoint3));
        }
        [Fact]
        public void TestQuadFromPointsIntegration()
        {
            var testP1 = PointAt(0.0, 0.0);
            var testP2 = PointAt(100.0, 0.0);
            var testP3 = PointAt(0.0, 100.0);
            var testP4 = PointAt(100.0, 100.0);
            var testQuad = QuadFrom(testP1, testP2, testP3, testP4);
            Assert.True(PointInQuad(PointAt(50.0, 50.0), testQuad));
        }
        [Fact]
        public void TestQuadFromRectangleIntegration()
        {
            var testRectangle = RectangleFrom(0.0, 0.0, 100.0, 100.0);
            var testQuad = QuadFrom(testRectangle);
            Assert.True(PointInQuad(PointAt(50.0, 50.0), testQuad));
            Assert.False(PointInQuad(PointAt(150.0, 150.0), testQuad));
        }
        [Fact]
        public void TestQuadFromRectangleWithTransformationIntegration()
        {
            var testRectangle = RectangleFrom(0.0, 0.0, 100.0, 100.0);
            var testTransform = RotationMatrix(45.0);
            var testQuad = QuadFrom(testRectangle, testTransform);
            Assert.True(PointInQuad(PointAt(50.0, 50.0), testQuad));
            Assert.False(PointInQuad(PointAt(150.0, 150.0), testQuad));
        }
        [Fact]
        public void TestQuadFromIntegration()
        {
            var testQuad = QuadFrom(0.0, 0.0, 100.0, 0.0, 0.0, 100.0, 100.0, 100.0);
            Assert.True(PointInQuad(PointAt(50.0, 50.0), testQuad));
            Assert.False(PointInQuad(PointAt(150.0, 150.0), testQuad));
        }
        [Fact]
        public void TestQuadsIntersectIntegration()
        {
            var testQuad1 = QuadFrom(PointAt(0.0, 0.0), PointAt(100.0, 0.0), PointAt(0.0, 100.0), PointAt(100.0, 100.0));
            var testQuad2 = QuadFrom(PointAt(50.0, 50.0), PointAt(150.0, 50.0), PointAt(50.0, 150.0), PointAt(150.0, 150.0));
            var testResult = QuadsIntersect(testQuad1, testQuad2);
            Assert.True(testResult);
        }
        [Fact]
        public void TestSetQuadPointIntegration()
        {
            var testQuad = QuadFrom(PointAt(0.0, 0.0), PointAt(100.0, 0.0), PointAt(0.0, 100.0), PointAt(100.0, 100.0));
            SetQuadPoint(testQuad, 2, PointAt(50.0, 150.0));
            Assert.True(PointInQuad(PointAt(50.0, 150.0), testQuad));
        }
        [Fact]
        public void TestTrianglesFromIntegration()
        {
            var testQuad = QuadFrom(PointAt(0.0, 0.0), PointAt(100.0, 0.0), PointAt(0.0, 100.0), PointAt(100.0, 100.0));
            var testTriangles = TrianglesFrom(testQuad);
            Assert.Equal(Size(testTriangles), 2);
        }
        [Fact]
        public void TestInsetRectangleIntegration()
        {
            var testRectangle = RectangleFrom(0.0, 0.0, 100.0, 100.0);
            var testInsetRectangle = InsetRectangle(testRectangle, 10.0);
            Assert.Equal(RectangleLeft(testInsetRectangle), 10.0);
            Assert.Equal(RectangleTop(testInsetRectangle), 10.0);
            Assert.Equal(RectangleRight(testInsetRectangle), 90.0);
            Assert.Equal(RectangleBottom(testInsetRectangle), 90.0);
        }
        [Fact]
        public void TestIntersectionIntegration()
        {
            var testRect1 = RectangleFrom(0.0, 0.0, 10.0, 10.0);
            var testRect2 = RectangleFrom(5.0, 5.0, 10.0, 10.0);
            var testIntersection = Intersection(testRect1, testRect2);
            Assert.Equal(RectangleLeft(testIntersection), 5.0);
            Assert.Equal(RectangleTop(testIntersection), 5.0);
            Assert.Equal(RectangleRight(testIntersection), 10.0);
            Assert.Equal(RectangleBottom(testIntersection), 10.0);
        }
        [Fact]
        public void TestRectangleAroundCircleIntegration()
        {
            var testCircle = CircleAt(100.0, 100.0, 50.0);
            var testRectangle = RectangleAround(testCircle);
            Assert.Equal(RectangleLeft(testRectangle), 50.0);
            Assert.Equal(RectangleTop(testRectangle), 50.0);
            Assert.Equal(RectangleRight(testRectangle), 150.0);
            Assert.Equal(RectangleBottom(testRectangle), 150.0);
        }
        [Fact]
        public void TestRectangleAroundLineIntegration()
        {
            var testLine = LineFrom(PointAt(10.0, 10.0), PointAt(50.0, 50.0));
            var testRectangle = RectangleAround(testLine);
            Assert.True(PointInRectangle(PointAt(10.0, 10.0), testRectangle));
            Assert.True(PointInRectangle(PointAt(50.0, 50.0), testRectangle));
        }
        [Fact]
        public void TestRectangleAroundQuadIntegration()
        {
            var testQuad = QuadFrom(PointAt(0.0, 0.0), PointAt(100.0, 0.0), PointAt(0.0, 100.0), PointAt(100.0, 100.0));
            var testRectangle = RectangleAround(testQuad);
            Assert.Equal(RectangleLeft(testRectangle), 0.0);
            Assert.Equal(RectangleTop(testRectangle), 0.0);
            Assert.Equal(RectangleRight(testRectangle), 100.0);
            Assert.Equal(RectangleBottom(testRectangle), 100.0);
        }
        [Fact]
        public void TestRectangleAroundTriangleIntegration()
        {
            var testTriangle = TriangleFrom(PointAt(0.0, 0.0), PointAt(100.0, 0.0), PointAt(50.0, 100.0));
            var testRectangle = RectangleAround(testTriangle);
            Assert.Equal(RectangleLeft(testRectangle), 0.0);
            Assert.Equal(RectangleTop(testRectangle), 0.0);
            Assert.Equal(RectangleRight(testRectangle), 100.0);
            Assert.Equal(RectangleBottom(testRectangle), 100.0);
        }
        [Fact]
        public void TestRectangleBottomIntegration()
        {
            var testRectangle = RectangleFrom(10.0, 20.0, 50.0, 60.0);
            Assert.Equal(RectangleBottom(testRectangle), 80.0);
        }
        [Fact]
        public void TestRectangleCenterIntegration()
        {
            var testRectangle = RectangleFrom(PointAt(0.0, 0.0), 100.0, 100.0);
            var testCenterPoint = RectangleCenter(testRectangle);
            Assert.Equal(PointPointDistance(PointAt(50.0, 50.0), testCenterPoint), 0.0);
        }
        [Fact]
        public void TestRectangleFromPointAndSizeIntegration()
        {
            var testPoint = PointAt(10.0, 20.0);
            var testRectangle = RectangleFrom(testPoint, 50.0, 30.0);
            Assert.Equal(RectangleLeft(testRectangle), 10.0);
            Assert.Equal(RectangleTop(testRectangle), 20.0);
            Assert.Equal(RectangleRight(testRectangle), 60.0);
            Assert.Equal(RectangleBottom(testRectangle), 50.0);
        }
        [Fact]
        public void TestRectangleFromPointsIntegration()
        {
            var testPoint1 = PointAt(0.0, 0.0);
            var testPoint2 = PointAt(100.0, 100.0);
            var testRectangle = RectangleFrom(testPoint1, testPoint2);
            Assert.Equal(RectangleLeft(testRectangle), 0.0);
            Assert.Equal(RectangleTop(testRectangle), 0.0);
            Assert.Equal(RectangleRight(testRectangle), 100.0);
            Assert.Equal(RectangleBottom(testRectangle), 100.0);
        }
        [Fact]
        public void TestRectangleFromIntegration()
        {
            var testRectangle = RectangleFrom(10.0, 20.0, 50.0, 30.0);
            Assert.Equal(RectangleLeft(testRectangle), 10.0);
            Assert.Equal(RectangleTop(testRectangle), 20.0);
            Assert.Equal(RectangleRight(testRectangle), 60.0);
            Assert.Equal(RectangleBottom(testRectangle), 50.0);
        }
        [Fact]
        public void TestRectangleLeftIntegration()
        {
            var testRectangle = RectangleFrom(10.0, 20.0, 50.0, 60.0);
            var testLeft = RectangleLeft(testRectangle);
            Assert.Equal(testLeft, 10.0);
        }
        [Fact]
        public void TestRectangleOffsetByIntegration()
        {
            var testRectangle = RectangleFrom(10.0, 10.0, 50.0, 50.0);
            var testOffsetRectangle = RectangleOffsetBy(testRectangle, VectorFromAngle(20.0, 30.0));
            Assert.Equal(RectangleLeft(testOffsetRectangle), 30.0);
            Assert.Equal(RectangleTop(testOffsetRectangle), 40.0);
        }
        [Fact]
        public void TestRectangleRightIntegration()
        {
            var testRectangle = RectangleFrom(10.0, 20.0, 50.0, 60.0);
            Assert.Equal(RectangleRight(testRectangle), 60.0);
        }
        [Fact]
        public void TestRectangleToStringIntegration()
        {
            var testRectangle = RectangleFrom(10.0, 20.0, 30.0, 40.0);
            var testString = RectangleToString(testRectangle);
            Assert.Equal(testString, "Rectangle(x: 10, y: 20, width: 30, height: 40)");
        }
        [Fact]
        public void TestRectangleTopIntegration()
        {
            var testRectangle = RectangleFrom(10.0, 20.0, 50.0, 60.0);
            var testTop = RectangleTop(testRectangle);
            Assert.Equal(testTop, 20.0);
        }
        [Fact]
        public void TestRectanglesIntersectIntegration()
        {
            var testRect1 = RectangleFrom(0.0, 0.0, 10.0, 10.0);
            var testRect2 = RectangleFrom(5.0, 5.0, 10.0, 10.0);
            var testResult = RectanglesIntersect(testRect1, testRect2);
            Assert.True(testResult);
        }
        [Fact]
        public void TestTriangleBarycenterIntegration()
        {
            var testTriangle = TriangleFrom(PointAt(0.0, 0.0), PointAt(100.0, 0.0), PointAt(50.0, 86.6));
            var testBarycenter = TriangleBarycenter(testTriangle);
            Assert.Equal(testBarycenter.X, 50.0);
            Assert.Equal(testBarycenter.Y, 28.866666666666667);
        }
        [Fact]
        public void TestTriangleFromIntegration()
        {
            var testPoint1 = PointAt(0.0, 0.0);
            var testPoint2 = PointAt(100.0, 0.0);
            var testPoint3 = PointAt(50.0, 100.0);
            var testTriangle = TriangleFrom(testPoint1, testPoint2, testPoint3);
            Assert.True(PointInTriangle(PointAt(50.0, 50.0), testTriangle));
        }
        [Fact]
        public void TestTriangleFromFromCoordinatesIntegration()
        {
            var testTriangle = TriangleFrom(0.0, 0.0, 100.0, 0.0, 50.0, 100.0);
            Assert.True(PointInTriangle(PointAt(50.0, 50.0), testTriangle));
            Assert.False(PointInTriangle(PointAt(150.0, 150.0), testTriangle));
        }
        [Fact]
        public void TestTriangleRectangleIntersectIntegration()
        {
            var testTriangle = TriangleFrom(PointAt(0.0, 0.0), PointAt(100.0, 0.0), PointAt(50.0, 100.0));
            var testRectangle = RectangleFrom(PointAt(40.0, 40.0), 60.0, 60.0);
            var testResult = TriangleRectangleIntersect(testTriangle, testRectangle);
            Assert.True(testResult);
        }
        [Fact]
        public void TestTriangleToStringIntegration()
        {
            var testTriangle = TriangleFrom(PointAt(0.0, 0.0), PointAt(100.0, 0.0), PointAt(50.0, 100.0));
            var testTriangleString = TriangleToString(testTriangle);
            Assert.NotEqual(testTriangleString, "");
        }
        [Fact]
        public void TestTrianglesIntersectIntegration()
        {
            var testTriangle1 = TriangleFrom(PointAt(0.0, 0.0), PointAt(2.0, 0.0), PointAt(1.0, 2.0));
            var testTriangle2 = TriangleFrom(PointAt(1.0, 0.0), PointAt(3.0, 0.0), PointAt(2.0, 2.0));
            var testResult = TrianglesIntersect(testTriangle1, testTriangle2);
            Assert.True(testResult);
        }
    }
}
