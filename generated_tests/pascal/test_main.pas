{$mode objfpc}{$H+}
{$UNITPATH tests}

program TestMain;

uses
  SysUtils,
  fpcunit, 
  SplashKit,
  testregistry,
  consoletestrunner,
  animations_tests,
  audio_tests, 
  camera_tests, 
  color_tests, 
  geometry_tests, 
  graphics_tests, 
  input_tests, 
  interface_tests, 
  json_tests, 
  logging_tests, 
  physics_tests, 
  raspberry_tests,
  resource_bundles_tests,
  resources_tests, 
  sprites_tests, 
  terminal_tests,
  timers_tests,
  utilities_tests,
  windows_tests,
  testreport,
  DigestTestReport;

{ Variable declarations section }
var
  FXMLResultsWriter: TXMLResultsWriter;
  FDigestResultsWriter: TDigestResultsWriter;
  testResult: TTestResult;
  groupName: string;
  testName: string;
  i: Integer;
  testSuite: TTestSuite;
  foundTest: TTest;

procedure RegisterTestGroup(const groupName: string);
begin
  case LowerCase(groupName) of
    'ttestanimations': animations_tests.RegisterTests;
    'ttestaudio': audio_tests.RegisterTests;
    'ttestcamera': camera_tests.RegisterTests;
    'ttestcolor': color_tests.RegisterTests;
    'ttestgeometry': geometry_tests.RegisterTests;
    'ttestgraphics': graphics_tests.RegisterTests;
    'ttestinput': input_tests.RegisterTests;
    'ttestinterface': interface_tests.RegisterTests;
    'ttestjson': json_tests.RegisterTests;
    'ttestlogging': logging_tests.RegisterTests;
    'ttestphysics': physics_tests.RegisterTests;
    'ttestraspberry': raspberry_tests.RegisterTests;
    'ttestresourcebundles': resource_bundles_tests.RegisterTests;
    'ttestresources': resources_tests.RegisterTests;
    'ttestsprites': sprites_tests.RegisterTests;
    'ttestterminal': terminal_tests.RegisterTests;
    'ttesttimers': timers_tests.RegisterTests;
    'ttestutilities': utilities_tests.RegisterTests;
    'ttestwindows': windows_tests.RegisterTests;
  end;
end;

{ Main program block }
begin
  groupName := '';
  testName := '';
  
  for i := 1 to ParamCount do
  begin
    if Copy(ParamStr(i), 1, 8) = '--group=' then
    begin
      groupName := 'TTest' + Copy(ParamStr(i), 9, Length(ParamStr(i)));
    end
    else if Copy(ParamStr(i), 1, 7) = '--test=' then
    begin
      testName := Copy(ParamStr(i), 8, Length(ParamStr(i)));
    end;
  end;

  if groupName = '' then
  begin
    WriteLn('Error: Test group not specified');
    Exit;
  end;
  
  RegisterTestGroup(groupName);
  
  testResult := TTestResult.Create;
  FXMLResultsWriter := TXMLResultsWriter.Create;
  FDigestResultsWriter := TDigestResultsWriter.Create(nil);
  testSuite := GetTestRegistry;
  
  try
    testResult.AddListener(FXMLResultsWriter);
    testResult.AddListener(FDigestResultsWriter);
    FDigestResultsWriter.Category := 'DB';
    FDigestResultsWriter.RelSrcDir := 'fcl-db';

    FXMLResultsWriter.WriteHeader;
    
    if testName <> '' then
    begin
      foundTest := testSuite.FindTest(groupName + '.' + testName);
      if foundTest <> nil then
      begin
        WriteLn('Running specific test: ', groupName, '.', testName);
        foundTest.Run(testResult);
      end
      else
        WriteLn('Error: Test "', groupName, '.', testName, '" not found');
    end
    else
    begin
      foundTest := testSuite.FindTest(groupName);
      if foundTest <> nil then
      begin
        WriteLn('Running test group: ', groupName);
        foundTest.Run(testResult);
      end
      else
        WriteLn('Error: Test group "', groupName, '" not found');
    end;
    
    FXMLResultsWriter.WriteResult(testResult);
  finally
    testResult.Free;
    FXMLResultsWriter.Free;
    FDigestResultsWriter.Free;
  end;
end.
