uses SplashKit, TestFramework, ../Helpers;
type
    TTestUtilities = class(TTestCase)
    protected
        procedure Setup; override;
    end;
begin
    inherited;
    SetResourcesPath('/mnt/c/Users/Noahc/Documents/aYear_2_semester_2/TeamProject/GitHubRepo/splashkit_test_generator/resources');
end;
procedure TestContainsIntegration;
begin
    AssertTrue(Contains('splashkit library', 'splashkit'));
    AssertTrue(Contains('splashkit library', 'library'));
    AssertTrue(Contains('splashkit library', 'it lib'));
    AssertTrue(Contains('splashkit library', ''));
    AssertFalse(Contains('splashkit library', 'unreal'));
    AssertFalse(Contains('', 'splashkit'));
end;
procedure TestConvertToDoubleIntegration;
begin
    AssertEquals(123.0, ConvertToDouble('123'));
    AssertEquals(123.456, ConvertToDouble('123.456'));
    AssertEquals(-123.0, ConvertToDouble('-123'));
    AssertEquals(-123.456, ConvertToDouble('-123.456'));
    AssertEquals(0.456, ConvertToDouble('.456'));
    AssertEquals(123.0, ConvertToDouble('123.'));
    AssertEquals(123.456, ConvertToDouble('000123.456'));
    AssertEquals(123.456, ConvertToDouble('123.456000'));
    AssertEquals(MaxDouble, ConvertToDouble('inf'));
    AssertEquals(-MaxDouble, ConvertToDouble('-inf'));
    AssertEquals(123.0, ConvertToDouble('1.23e2'));
end;
procedure TestConvertToIntegerIntegration;
begin
    AssertEquals(123, ConvertToInteger('123'));
    AssertEquals(123, ConvertToInteger('123.456'));
    AssertEquals(-123, ConvertToInteger('-123'));
    AssertEquals(-123, ConvertToInteger('-123.456'));
    AssertEquals(123, ConvertToInteger('123.'));
    AssertEquals(123, ConvertToInteger('000123.456'));
    AssertEquals(123, ConvertToInteger('123.456000'));
end;
procedure TestIndexOfIntegration;
begin
    AssertEquals(0, IndexOf('splashkit library', 'splashkit'));
    AssertEquals(10, IndexOf('splashkit library', 'library'));
    AssertEquals(7, IndexOf('splashkit library', 'it lib'));
    AssertEquals(-1, IndexOf('splashkit library', 'unreal'));
    AssertEquals(0, IndexOf('splashkit library', 'splashkit library'));
    AssertEquals(-1, IndexOf('splashkit library', 'splashkit library is the best'));
    AssertEquals(0, IndexOf('splashkit library', ''));
    AssertEquals(-1, IndexOf('', 'splashkit'));
    AssertEquals(0, IndexOf('', ''));
end;
procedure TestIsDoubleIntegration;
begin
    AssertTrue(IsDouble('123.456'));
    AssertTrue(IsDouble('123'));
    AssertTrue(IsDouble('-123.456'));
    AssertTrue(IsDouble('-123'));
    AssertTrue(IsDouble('123.'));
    AssertTrue(IsDouble('000123.456'));
    AssertTrue(IsDouble('123.456000'));
    AssertFalse(IsDouble('.456'));
    AssertFalse(IsDouble('SplashKit'));
    AssertFalse(IsDouble(''));
end;
procedure TestIsIntegerIntegration;
begin
    AssertTrue(IsInteger('123'));
    AssertTrue(IsInteger('-123'));
    AssertFalse(IsInteger('123.456'));
    AssertFalse(IsInteger('-123.456'));
    AssertFalse(IsInteger('.456'));
    AssertFalse(IsInteger('SplashKit'));
    AssertFalse(IsInteger(''));
end;
procedure TestIsNumberIntegration;
begin
    AssertTrue(IsNumber('123'));
    AssertTrue(IsNumber('123.456'));
    AssertTrue(IsNumber('-123'));
    AssertTrue(IsNumber('-123.456'));
    AssertFalse(IsNumber('SplashKit'));
    AssertFalse(IsNumber(''));
end;
procedure TestLengthOfIntegration;
begin
    AssertEquals(9, LengthOf('splashkit'));
    AssertEquals(0, LengthOf(''));
end;
procedure TestReplaceAllIntegration;
begin
    AssertEquals('SK library', ReplaceAll('splashkit library', 'splashkit', 'SK'));
    AssertEquals('splashkit lib', ReplaceAll('splashkit library', 'library', 'lib'));
    AssertEquals('splashkitlibrary', ReplaceAll('splashkit library', 'it lib', 'itlib'));
    AssertEquals('splashkit library', ReplaceAll('splashkit library', 'unreal', 'tournament'));
    AssertEquals('SK', ReplaceAll('splashkit library', 'splashkit library', 'SK'));
    AssertEquals(' library', ReplaceAll('splashkit library', 'splashkit', ''));
    AssertEquals('splashkit library', ReplaceAll('splashkit library', '', 'SK'));
    AssertEquals('', ReplaceAll('', '', 'SK'));
end;
procedure TestSplitIntegration;
begin
    result := Split('splashkit library', ' ');
    AssertEquals(TArray<String>.Create('splashkit', 'library'), result);
    AssertEquals(TArray<String>.Create(''), Split('', ' '));
    AssertEquals(TArray<String>.Create('splashkit library'), Split('splashkit library', ','));
    AssertEquals(TArray<String>.Create('', 'splashkit library'), Split(',splashkit library', ','));
    AssertEquals(TArray<String>.Create('splashkit library', ''), Split('splashkit library,', ','));
    AssertEquals(TArray<String>.Create('', 'splashkit library', ''), Split(',splashkit library,', ','));
    AssertEquals(TArray<String>.Create('splashkit', '', 'library'), Split('splashkit,,library', ','));
end;
procedure TestToLowercaseIntegration;
begin
    AssertEquals('splashkit', ToLowercase('SPLASHKIT'));
    AssertEquals('', ToLowercase(''));
    AssertEquals('splashkit', ToLowercase('splashkit'));
    AssertEquals('splashkit', ToLowercase('SpLaShKiT'));
end;
procedure TestToUppercaseIntegration;
begin
    AssertEquals('SPLASHKIT', ToUppercase('splashkit'));
    AssertEquals('', ToUppercase(''));
    AssertEquals('SPLASHKIT', ToUppercase('SPLASHKIT'));
    AssertEquals('SPLASHKIT', ToUppercase('SpLaShKiT'));
end;
procedure TestTrimIntegration;
begin
    AssertEquals('splashkit', Trim('  splashkit'));
    AssertEquals('splashkit', Trim('splashkit  '));
    AssertEquals('splashkit', Trim('  splashkit  '));
    AssertEquals('splashkit', Trim('splashkit'));
    AssertEquals('', Trim(''));
end;
procedure TestRndRangeIntegration;
begin
    AssertTrue((Rnd(-1, 5) >= -1) and (Rnd(-1, 5) <= 5));
    AssertEquals(1, Rnd(1, 1));
    AssertTrue((Rnd(5, 1) >= 1) and (Rnd(5, 1) <= 5));
end;
procedure TestRndIntegration;
begin
    AssertTrue((Rnd() >= 0.0) and (Rnd() <= MaxSingle));
end;
procedure TestRndIntIntegration;
begin
    AssertTrue((Rnd(1) >= 0) and (Rnd(1) <= 1));
    AssertTrue((Rnd(10) >= 0) and (Rnd(10) <= 10));
    AssertEquals(0, Rnd(-1));
    AssertEquals(0, Rnd(0));
end;
procedure TestCurrentTicksIntegration;
begin
    testTicks := CurrentTicks();
    AssertTrue(testTicks > 0);
end;
procedure TestDelayIntegration;
begin
    testTimer := CreateTimer('test_timer');
    CleanupTimer := TTimerCleanup.Create;
    StartTimer(testTimer);
    initialTicks := TimerTicks(testTimer);
    Delay(200);
    AssertTrue(initialTicks + 200 < TimerTicks(testTimer));
end;
procedure TestDisplayDialogIntegration;
begin
    testWindow := OpenWindow('Test Window', 800, 600);
    CleanupWindow := TWindowCleanup.Create;
    testFont := LoadFont('test_font', 'hara.ttf');
    CleanupFont := TFontCleanup.Create;
    DisplayDialog('Test Dialog', 'This is a test message', testFont, 20);
    FreeFont(testFont);
end;
procedure TestFileAsStringIntegration;
begin
    AssertEquals('BITMAP,ufo,ufo.png\n', FileAsString('blah.txt', ResourceKind.BUNDLE_RESOURCE));
    AssertEquals('', FileAsString('', ResourceKind.BUNDLE_RESOURCE));
    AssertEquals('', FileAsString('invalid.txt', ResourceKind.BUNDLE_RESOURCE));
end;
end;

procedure RegisterTests;
begin
    #<Proc:0x00007fbbcab52da8 /mnt/c/Users/Noahc/Documents/aYear_2_semester_2/TeamProject/GitHubRepo/splashkit_test_generator/test_generator/config/languages/pascal_config.rb:138 (lambda)>
end;
