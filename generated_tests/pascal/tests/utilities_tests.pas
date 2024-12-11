uses SplashKit, TestFramework

type
TTestUtilities = class(TTestCase)
protected
procedure TIntegrationTests.TestContainsIntegration;
begin
    AssertTrue(Contains("splashkit library", "splashkit"));
    AssertTrue(Contains("splashkit library", "library"));
    AssertTrue(Contains("splashkit library", "it lib"));
    AssertTrue(Contains("splashkit library", ""));
    AssertFalse(Contains("splashkit library", "unreal"));
    AssertFalse(Contains("", "splashkit"));
end;
procedure TIntegrationTests.TestConvertToDoubleIntegration;
begin
    AssertEquals(123.0, ConvertToDouble("123"));
    AssertEquals(123.456, ConvertToDouble("123.456"));
    AssertEquals(-123.0, ConvertToDouble("-123"));
    AssertEquals(-123.456, ConvertToDouble("-123.456"));
    AssertEquals(0.456, ConvertToDouble(".456"));
    AssertEquals(123.0, ConvertToDouble("123."));
    AssertEquals(123.456, ConvertToDouble("000123.456"));
    AssertEquals(123.456, ConvertToDouble("123.456000"));
    AssertEquals(, ConvertToDouble("inf"));
    AssertEquals(, ConvertToDouble("-inf"));
    AssertEquals(123.0, ConvertToDouble("1.23e2"));
end;
procedure TIntegrationTests.TestConvertToIntegerIntegration;
begin
    AssertEquals(123, ConvertToInteger("123"));
    AssertEquals(123, ConvertToInteger("123.456"));
    AssertEquals(-123, ConvertToInteger("-123"));
    AssertEquals(-123, ConvertToInteger("-123.456"));
    AssertEquals(123, ConvertToInteger("123."));
    AssertEquals(123, ConvertToInteger("000123.456"));
    AssertEquals(123, ConvertToInteger("123.456000"));
end;
procedure TIntegrationTests.TestIndexOfIntegration;
begin
    AssertEquals(0, IndexOf("splashkit library", "splashkit"));
    AssertEquals(10, IndexOf("splashkit library", "library"));
    AssertEquals(7, IndexOf("splashkit library", "it lib"));
    AssertEquals(-1, IndexOf("splashkit library", "unreal"));
    AssertEquals(0, IndexOf("splashkit library", "splashkit library"));
    AssertEquals(-1, IndexOf("splashkit library", "splashkit library is the best"));
    AssertEquals(0, IndexOf("splashkit library", ""));
    AssertEquals(-1, IndexOf("", "splashkit"));
    AssertEquals(0, IndexOf("", ""));
end;
procedure TIntegrationTests.TestIsDoubleIntegration;
begin
    AssertTrue(IsDouble("123.456"));
    AssertTrue(IsDouble("123"));
    AssertTrue(IsDouble("-123.456"));
    AssertTrue(IsDouble("-123"));
    AssertTrue(IsDouble("123."));
    AssertTrue(IsDouble("000123.456"));
    AssertTrue(IsDouble("123.456000"));
    AssertFalse(IsDouble(".456"));
    AssertFalse(IsDouble("SplashKit"));
    AssertFalse(IsDouble(""));
end;
procedure TIntegrationTests.TestIsIntegerIntegration;
begin
    AssertTrue(IsInteger("123"));
    AssertTrue(IsInteger("-123"));
    AssertFalse(IsInteger("123.456"));
    AssertFalse(IsInteger("-123.456"));
    AssertFalse(IsInteger(".456"));
    AssertFalse(IsInteger("SplashKit"));
    AssertFalse(IsInteger(""));
end;
procedure TIntegrationTests.TestIsNumberIntegration;
begin
    AssertTrue(IsNumber("123"));
    AssertTrue(IsNumber("123.456"));
    AssertTrue(IsNumber("-123"));
    AssertTrue(IsNumber("-123.456"));
    AssertFalse(IsNumber("SplashKit"));
    AssertFalse(IsNumber(""));
end;
procedure TIntegrationTests.TestLengthOfIntegration;
begin
    AssertEquals(9, LengthOf("splashkit"));
    AssertEquals(0, LengthOf(""));
end;
procedure TIntegrationTests.TestReplaceAllIntegration;
begin
    AssertEquals("SK library", ReplaceAll("splashkit library", "splashkit", "SK"));
    AssertEquals("splashkit lib", ReplaceAll("splashkit library", "library", "lib"));
    AssertEquals("splashkitlibrary", ReplaceAll("splashkit library", "it lib", "itlib"));
    AssertEquals("splashkit library", ReplaceAll("splashkit library", "unreal", "tournament"));
    AssertEquals("SK", ReplaceAll("splashkit library", "splashkit library", "SK"));
    AssertEquals(" library", ReplaceAll("splashkit library", "splashkit", ""));
    AssertEquals("splashkit library", ReplaceAll("splashkit library", "", "SK"));
    AssertEquals("", ReplaceAll("", "", "SK"));
end;
procedure TIntegrationTests.TestSplitIntegration;
begin
    result := Split("splashkit library", ' ');
    AssertEquals(TArray<String>.Create("splashkit", "library"), result);
    AssertEquals(TArray<String>.Create(""), Split("", ' '));
    AssertEquals(TArray<String>.Create("splashkit library"), Split("splashkit library", ','));
    AssertEquals(TArray<String>.Create("", "splashkit library"), Split(",splashkit library", ','));
    AssertEquals(TArray<String>.Create("splashkit library", ""), Split("splashkit library,", ','));
    AssertEquals(TArray<String>.Create("", "splashkit library", ""), Split(",splashkit library,", ','));
    AssertEquals(TArray<String>.Create("splashkit", "", "library"), Split("splashkit,,library", ','));
end;
procedure TIntegrationTests.TestToLowercaseIntegration;
begin
    AssertEquals("splashkit", ToLowercase("SPLASHKIT"));
    AssertEquals("", ToLowercase(""));
    AssertEquals("splashkit", ToLowercase("splashkit"));
    AssertEquals("splashkit", ToLowercase("SpLaShKiT"));
end;
procedure TIntegrationTests.TestToUppercaseIntegration;
begin
    AssertEquals("SPLASHKIT", ToUppercase("splashkit"));
    AssertEquals("", ToUppercase(""));
    AssertEquals("SPLASHKIT", ToUppercase("SPLASHKIT"));
    AssertEquals("SPLASHKIT", ToUppercase("SpLaShKiT"));
end;
procedure TIntegrationTests.TestTrimIntegration;
begin
    AssertEquals("splashkit", Trim("  splashkit"));
    AssertEquals("splashkit", Trim("splashkit  "));
    AssertEquals("splashkit", Trim("  splashkit  "));
    AssertEquals("splashkit", Trim("splashkit"));
    AssertEquals("", Trim(""));
end;
procedure TIntegrationTests.TestRndRangeIntegration;
begin
    AssertTrue((RndRange(-1, 5) >= -1) and (RndRange(-1, 5) <= 5));
    AssertEquals(1, RndRange(1, 1));
    AssertTrue((RndRange(5, 1) >= 1) and (RndRange(5, 1) <= 5));
end;
procedure TIntegrationTests.TestRndIntegration;
begin
    AssertTrue((Rnd() >= 0.0) and (Rnd() <= ));
end;
procedure TIntegrationTests.TestRndIntIntegration;
begin
    AssertTrue((RndInt(1) >= 0) and (RndInt(1) <= 1));
    AssertTrue((RndInt(10) >= 0) and (RndInt(10) <= 10));
    AssertEquals(0, RndInt(-1));
    AssertEquals(0, RndInt(0));
end;
procedure TIntegrationTests.TestCurrentTicksIntegration;
begin
    testTicks := CurrentTicks();
    AssertTrue(testTicks > 0);
end;
procedure TIntegrationTests.TestDelayIntegration;
begin
    testTimer := CreateTimer("test_timer");
    StartTimer(testTimer);
    initialTicks := TimerTicks(testTimer);
    Delay(200);
    AssertTrue(initialTicks + 200 < TimerTicks(testTimer));
end;
procedure TIntegrationTests.TestDisplayDialogIntegration;
begin
    testWindow := OpenWindow("Test Window", 800, 600);
    testFont := LoadFont("test_font", "hara.ttf");
    DisplayDialog("Test Dialog", "This is a test message", testFont, 20);
    FreeFont(testFont);
    CloseWindow(testWindow);
end;
procedure TIntegrationTests.TestFileAsStringIntegration;
begin
    AssertEquals("BITMAP,ufo,ufo.png\n", FileAsString("blah.txt", ResourceKind.BUNDLE_RESOURCE));
    AssertEquals("", FileAsString("", ResourceKind.BUNDLE_RESOURCE));
    AssertEquals("", FileAsString("invalid.txt", ResourceKind.BUNDLE_RESOURCE));
end;
end;

procedure RegisterTests;
begin
#<Proc:0x00007f8aefd57268 /mnt/c/Users/Noahc/Documents/.Year 2 Semester 3/Team Project (A)/Github Repo/splashkit_test_generator/test_generator/config/languages/pascal_config.rb:113 (lambda)>
end;
