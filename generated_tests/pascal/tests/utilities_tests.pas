uses SplashKit, TestFramework

type
TIntegrationTests = class(TTestCase)
published
procedure TIntegrationTests.TestContainsIntegration;
begin
    testResult := contains("SplashKit is awesome", "awesome");
    AssertTrue(testResult);
    testResult := contains("SplashKit is awesome", "unreal");
    AssertFalse(testResult);
end;
procedure TIntegrationTests.TestConvertToDoubleIntegration;
begin
    testResult := convert_to_double("123.456");
    AssertEquals(testResult, 123.456);
    testResult := convert_to_double("-123.456");
    AssertEquals(testResult, -123.456);
    testResult := convert_to_double("invalid");
    AssertNull(testResult);
end;
procedure TIntegrationTests.TestConvertToIntegerIntegration;
begin
    testResult := convert_to_integer("123");
    AssertEquals(testResult, 123);
    testResult := convert_to_integer("-456");
    AssertEquals(testResult, -456);
    testResult := convert_to_integer("123.456");
    AssertEquals(testResult, 123);
    testResult := convert_to_integer("abc");
    try
    convert_to_integer("abc")
    except
    end;
end;
procedure TIntegrationTests.TestIndexOfIntegration;
begin
    testResult := index_of("splashkit library", "library");
    AssertEquals(testResult, 10);
    testResult := index_of("splashkit library", "unreal");
    AssertEquals(testResult, -1);
end;
procedure TIntegrationTests.TestIsDoubleIntegration;
begin
    testResult := is_double("123.456");
    AssertTrue(testResult);
    testResult := is_double("123");
    AssertTrue(testResult);
    testResult := is_double("-123.456");
    AssertTrue(testResult);
    testResult := is_double("SplashKit");
    AssertFalse(testResult);
    testResult := is_double("");
    AssertFalse(testResult);
end;
procedure TIntegrationTests.TestIsIntegerIntegration;
begin
    testResult := is_integer("123");
    AssertTrue(testResult);
    testResult := is_integer("123.456");
    AssertFalse(testResult);
    testResult := is_integer("-123");
    AssertTrue(testResult);
    testResult := is_integer("SplashKit");
    AssertFalse(testResult);
    testResult := is_integer("");
    AssertFalse(testResult);
end;
procedure TIntegrationTests.TestIsNumberIntegration;
begin
    testResult := is_number("123.456");
    AssertTrue(testResult);
    testResult := is_number("abc");
    AssertFalse(testResult);
end;
procedure TIntegrationTests.TestLengthOfIntegration;
begin
    testLength := length_of("SplashKit");
    AssertEquals(testLength, 9);
    testLengthEmpty := length_of("");
    AssertEquals(testLengthEmpty, 0);
end;
procedure TIntegrationTests.TestReplaceAllIntegration;
begin
    testResult := replace_all("hello world", "world", "SplashKit");
    AssertEquals(testResult, "hello SplashKit");
    testResult := replace_all("aaaa", "a", "b");
    AssertEquals(testResult, "bbbb");
    testResult := replace_all("test", "t", "");
    AssertEquals(testResult, "es");
end;
procedure TIntegrationTests.TestSplitIntegration;
begin
    testResult := split("splashkit library", " ");
    AssertEquals(length_of(testResult), 2);
    AssertEquals(index_of(testResult, "splashkit"), 0);
    AssertEquals(index_of(testResult, "library"), 0);
end;
procedure TIntegrationTests.TestToLowercaseIntegration;
begin
    testLowercase := to_lowercase("SPLASHKIT");
    AssertEquals(testLowercase, "splashkit");
    testEmpty := to_lowercase("");
    AssertEquals(testEmpty, "");
end;
procedure TIntegrationTests.TestToUppercaseIntegration;
begin
    testUppercase := to_uppercase("hello");
    AssertEquals(testUppercase, "HELLO");
end;
procedure TIntegrationTests.TestTrimIntegration;
begin
    testTrimmed := trim("  Hello, World!  ");
    AssertEquals(testTrimmed, "Hello, World!");
    testEmptyTrimmed := trim(" \t\n  ");
    AssertEquals(testEmptyTrimmed, "");
end;
procedure TIntegrationTests.TestRndRangeIntegration;
begin
    testResult := rnd(1, 10);
    AssertTrue((testResult >= 1) and (testResult <= 10));
end;
procedure TIntegrationTests.TestRndIntegration;
begin
    testRandom := rnd();
    AssertTrue(testRandom > 0.0);
    AssertTrue(testRandom < 1.0);
end;
procedure TIntegrationTests.TestRndIntIntegration;
begin
    testResult := rnd(10);
    AssertTrue((testResult >= 0) and (testResult <= 10));
end;
procedure TIntegrationTests.TestCurrentTicksIntegration;
begin
    testTicks := current_ticks();
    AssertTrue(testTicks > 0);
end;
procedure TIntegrationTests.TestDelayIntegration;
begin
    testStartTime := current_ticks();
    delay(1000);
    testEndTime := current_ticks();
    AssertTrue(current_ticks() > testStartTime);
    AssertTrue((current_ticks() >= testStartTime) and (current_ticks() <= 1100));
end;
procedure TIntegrationTests.TestDisplayDialogIntegration;
begin
    testWindow := open_window("Test Window", 800, 600);
    testFont := load_font("test_font", "path/to/font.ttf");
    display_dialog("Test Title", "This is a test message.", testFont, 12);
    free_font(testFont);
    close_window(testWindow);
end;
procedure TIntegrationTests.TestFileAsStringIntegration;
begin
    testFileContent := file_as_string("test_file.txt", ResourceKind.BUNDLE_RESOURCE);
    AssertNotEquals(testFileContent, "");
end;
end;

procedure RegisterTests;
begin
TestFramework.RegisterTest(TIntegrationTests.Suite);
end;
