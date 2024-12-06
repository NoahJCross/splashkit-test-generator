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
    AssertEquals(testResult, 123.456);
    testResult := ConvertToDouble("-123.456");
    AssertEquals(testResult, -123.456);
    testResult := ConvertToDouble("invalid");
    AssertNull(testResult);
end;
procedure TIntegrationTests.TestConvertToIntegerIntegration;
begin
    testResult := ConvertToInteger("123");
    AssertEquals(testResult, 123);
    testResult := ConvertToInteger("-456");
    AssertEquals(testResult, -456);
    testResult := ConvertToInteger("123.456");
    AssertEquals(testResult, 123);
    testResult := ConvertToInteger("abc");
    try
    ConvertToInteger("abc")
    except
    end;
end;
procedure TIntegrationTests.TestIndexOfIntegration;
begin
    testResult := IndexOf("splashkit library", "library");
    AssertEquals(testResult, 10);
    testResult := IndexOf("splashkit library", "unreal");
    AssertEquals(testResult, -1);
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
    AssertEquals(testLength, 9);
    testLengthEmpty := LengthOf("");
    AssertEquals(testLengthEmpty, 0);
end;
procedure TIntegrationTests.TestReplaceAllIntegration;
begin
    testResult := ReplaceAll("hello world", "world", "SplashKit");
    AssertEquals(testResult, "hello SplashKit");
    testResult := ReplaceAll("aaaa", "a", "b");
    AssertEquals(testResult, "bbbb");
    testResult := ReplaceAll("test", "t", "");
    AssertEquals(testResult, "es");
end;
procedure TIntegrationTests.TestSplitIntegration;
begin
    testResult := Split("splashkit library", " ");
    AssertEquals(LengthOf(testResult), 2);
    AssertEquals(IndexOf(testResult, "splashkit"), 0);
    AssertEquals(IndexOf(testResult, "library"), 0);
end;
procedure TIntegrationTests.TestToLowercaseIntegration;
begin
    testLowercase := ToLowercase("SPLASHKIT");
    AssertEquals(testLowercase, "splashkit");
    testEmpty := ToLowercase("");
    AssertEquals(testEmpty, "");
end;
procedure TIntegrationTests.TestToUppercaseIntegration;
begin
    testUppercase := ToUppercase("hello");
    AssertEquals(testUppercase, "HELLO");
end;
procedure TIntegrationTests.TestTrimIntegration;
begin
    testTrimmed := Trim("  Hello, World!  ");
    AssertEquals(testTrimmed, "Hello, World!");
    testEmptyTrimmed := Trim(" \t\n  ");
    AssertEquals(testEmptyTrimmed, "");
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
    AssertNotEquals(testFileContent, "");
end;
end;

procedure RegisterTests;
begin
TestFramework.RegisterTest(TIntegrationTests.Suite);
end;
