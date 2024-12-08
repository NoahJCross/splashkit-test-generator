uses SplashKit, TestFramework

type
TIntegrationTests = class(TTestCase)
published
procedure TIntegrationTests.TestContainsIntegration;
begin
    testResult := Contains("SplashKit is awesome", "awesome");
    AssertTrue(testResult);
    testResult := Contains("SplashKit is awesome", "unreal");
    AssertFalse(testResult);
end;
procedure TIntegrationTests.TestConvertToDoubleIntegration;
begin
    testResult := ConvertToDouble("123.456");
    AssertEquals(123.456, testResult);
    testResult := ConvertToDouble("-123.456");
    AssertEquals(-123.456, testResult);
    testResult := ConvertToDouble("invalid");
    AssertNull(testResult);
end;
procedure TIntegrationTests.TestConvertToIntegerIntegration;
begin
    testResult := ConvertToInteger("123");
    AssertEquals(123, testResult);
    testResult := ConvertToInteger("-456");
    AssertEquals(-456, testResult);
    testResult := ConvertToInteger("123.456");
    AssertEquals(123, testResult);
    testResult := ConvertToInteger("abc");
    try
    ConvertToInteger("abc")
    except
    end;
end;
procedure TIntegrationTests.TestIndexOfIntegration;
begin
    testResult := IndexOf("splashkit library", "library");
    AssertEquals(10, testResult);
    testResult := IndexOf("splashkit library", "unreal");
    AssertEquals(-1, testResult);
end;
procedure TIntegrationTests.TestIsDoubleIntegration;
begin
    testResult := IsDouble("123.456");
    AssertTrue(testResult);
    testResult := IsDouble("123");
    AssertTrue(testResult);
    testResult := IsDouble("-123.456");
    AssertTrue(testResult);
    testResult := IsDouble("SplashKit");
    AssertFalse(testResult);
    testResult := IsDouble("");
    AssertFalse(testResult);
end;
procedure TIntegrationTests.TestIsIntegerIntegration;
begin
    testResult := IsInteger("123");
    AssertTrue(testResult);
    testResult := IsInteger("123.456");
    AssertFalse(testResult);
    testResult := IsInteger("-123");
    AssertTrue(testResult);
    testResult := IsInteger("SplashKit");
    AssertFalse(testResult);
    testResult := IsInteger("");
    AssertFalse(testResult);
end;
procedure TIntegrationTests.TestIsNumberIntegration;
begin
    testResult := IsNumber("123.456");
    AssertTrue(testResult);
    testResult := IsNumber("abc");
    AssertFalse(testResult);
end;
procedure TIntegrationTests.TestLengthOfIntegration;
begin
    testLength := LengthOf("SplashKit");
    AssertEquals(9, testLength);
    testLengthEmpty := LengthOf("");
    AssertEquals(0, testLengthEmpty);
end;
procedure TIntegrationTests.TestReplaceAllIntegration;
begin
    testResult := ReplaceAll("hello world", "world", "SplashKit");
    AssertEquals("hello SplashKit", testResult);
    testResult := ReplaceAll("aaaa", "a", "b");
    AssertEquals("bbbb", testResult);
    testResult := ReplaceAll("test", "t", "");
    AssertEquals("es", testResult);
end;
procedure TIntegrationTests.TestSplitIntegration;
begin
    testResult := Split("splashkit library", " ");
    AssertEquals(2, LengthOf(testResult));
    AssertEquals(0, IndexOf(testResult, "splashkit"));
    AssertEquals(0, IndexOf(testResult, "library"));
end;
procedure TIntegrationTests.TestToLowercaseIntegration;
begin
    testLowercase := ToLowercase("SPLASHKIT");
    AssertEquals("splashkit", testLowercase);
    testEmpty := ToLowercase("");
    AssertEquals("", testEmpty);
end;
procedure TIntegrationTests.TestToUppercaseIntegration;
begin
    testUppercase := ToUppercase("hello");
    AssertEquals("HELLO", testUppercase);
end;
procedure TIntegrationTests.TestTrimIntegration;
begin
    testTrimmed := Trim("  Hello, World!  ");
    AssertEquals("Hello, World!", testTrimmed);
    testEmptyTrimmed := Trim(" \t\n  ");
    AssertEquals("", testEmptyTrimmed);
end;
procedure TIntegrationTests.TestRndRangeIntegration;
begin
    testResult := Rnd(1, 10);
    AssertTrue((testResult >= 1) and (testResult <= 10));
end;
procedure TIntegrationTests.TestRndIntegration;
begin
    testRandom := Rnd();
    AssertTrue(testRandom > 0.0);
    AssertTrue(testRandom < 1.0);
end;
procedure TIntegrationTests.TestRndIntIntegration;
begin
    testResult := Rnd(10);
    AssertTrue((testResult >= 0) and (testResult <= 10));
end;
procedure TIntegrationTests.TestCurrentTicksIntegration;
begin
    testTicks := CurrentTicks();
    AssertTrue(testTicks > 0);
end;
procedure TIntegrationTests.TestDelayIntegration;
begin
    testStartTime := CurrentTicks();
    Delay(1000);
    testEndTime := CurrentTicks();
    AssertTrue(CurrentTicks() > testStartTime);
    AssertTrue((CurrentTicks() >= testStartTime) and (CurrentTicks() <= 1100));
end;
procedure TIntegrationTests.TestDisplayDialogIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    testFont := LoadFont("test_font", "path/to/font.ttf");
    DisplayDialog("Test Title", "This is a test message.", testFont, 12);
    FreeFont(testFont);
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestFileAsStringIntegration;
begin
    testFileContent := FileAsString("test_file.txt", ResourceKind.BUNDLE_RESOURCE);
    AssertNotEquals("", testFileContent);
end;
end;

procedure RegisterTests;
begin
TestFramework.RegisterTest(TIntegrationTests.Suite);
end;
