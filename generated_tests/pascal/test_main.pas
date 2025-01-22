{$mode objfpc}{$H+}
{$UNITPATH tests}
{$UNITPATH ../../data/language_files/pascal}
program TestMain;

uses
  SysUtils,
  LibLoader,
  DynLibs, 
  fpcunit,
  testregistry,
  consoletestrunner,
  splashkit_test,
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

{ Custom results writer }
type
  TCustomTestWriter = class(TTestCase, IInterface, ITestListener)
  private
    { IInterface }
    FCurrentTest: TTest;  
    FTestFailed: Boolean; 
    function QueryInterface(constref IID: TGUID; out Obj): HResult; cdecl;
    function _AddRef: Integer; cdecl;
    function _Release: Integer; cdecl;
  public
    procedure WriteHeader; virtual;
    procedure WriteResult(aResult: TTestResult); virtual;
    { ITestListener }
    procedure AddFailure(ATest: TTest; AFailure: TTestFailure); virtual;
    procedure AddError(ATest: TTest; AError: TTestFailure); virtual;
    procedure StartTest(ATest: TTest); virtual;
    procedure EndTest(ATest: TTest); virtual;
    procedure StartTestSuite(ATestSuite: TTestSuite); virtual;
    procedure EndTestSuite(ATestSuite: TTestSuite); virtual;
  end;

{ Variable declarations section }
var
  testResult: TTestResult;
  groupName: string;
  testName: string;
  i: Integer;
  testSuite: TTestSuite;
  foundTest: TTest;
  FCustomWriter: TCustomTestWriter;

{ Implementation of IInterface methods }
function TCustomTestWriter.QueryInterface(constref IID: TGUID; out Obj): HResult; cdecl;
begin
  if GetInterface(IID, Obj) then
    Result := S_OK
  else
    Result := E_NOINTERFACE;
end;

function TCustomTestWriter._AddRef: Integer; cdecl;
begin
  Result := -1; // No reference counting needed
end;

function TCustomTestWriter._Release: Integer; cdecl;
begin
  Result := -1; // No reference counting needed
end;

{ Implementation of custom writer methods }
procedure TCustomTestWriter.WriteHeader;
begin
  // Optional: Add any header text you want
end;

procedure TCustomTestWriter.WriteResult(aResult: TTestResult);
var
    i: Integer;
    failure: TTestFailure;
begin
    writeln;
    writeln('Test Run Summary');
    writeln('----------------');
    writeln('Total Tests Run: ', aResult.RunTests);
    writeln('Failed Tests:    ', aResult.NumberOfFailures);
    writeln('Errors:          ', aResult.NumberOfErrors);
    
    if (aResult.NumberOfFailures > 0) or (aResult.NumberOfErrors > 0) then
    begin
        writeln;
        writeln('Failed Tests Details:');
        writeln('--------------------');
        
        if aResult.NumberOfFailures > 0 then
        begin
            writeln('Failures:');
            for i := 0 to aResult.Failures.Count - 1 do
            begin
                failure := TTestFailure(aResult.Failures[i]);
                if failure.ExceptionMessage <> '' then
                    writeln('Failure: ', failure.ExceptionMessage)
                else if failure.AsString <> '' then
                    writeln('Failure: ', failure.AsString)
                else
                    writeln('Failure: <No message available>');
                writeln('   Message: ', failure.ExceptionClassName);                
                if failure.SourceUnitName <> '' then
                    writeln('   Source Unit: ', failure.SourceUnitName);
                    
                writeln;
            end;
        end;
        
        if aResult.NumberOfErrors > 0 then
        begin
            writeln('Errors:');
            for i := 0 to aResult.Errors.Count - 1 do
            begin
                failure := TTestFailure(aResult.Errors[i]);
                writeln('ERROR: ', failure.ExceptionClassName);
                writeln('  Message: ', failure.ExceptionMessage);
                
                if failure.SourceUnitName <> '' then
                    writeln('  Unit: ', failure.SourceUnitName);
                if failure.FailedMethodName <> '' then
                    writeln('  Method: ', failure.FailedMethodName);
                if failure.LineNumber <> 0 then
                    writeln('  Line: ', failure.LineNumber);
                    
                writeln;
            end;
        end;
    end;
end;

procedure TCustomTestWriter.AddFailure(ATest: TTest; AFailure: TTestFailure);
var
  msg: string;
  locationParts: TStringArray;
  lineStr: string;
begin
  FTestFailed := True;
  msg := AFailure.ExceptionMessage;
  
  AFailure.SourceUnitName := ATest.TestSuiteName;
  AFailure.FailedMethodName := ATest.TestName;
  
  if AFailure.LocationInfo <> '' then
  begin
    locationParts := AFailure.LocationInfo.Split('(');
    if Length(locationParts) > 1 then
    begin
      lineStr := locationParts[1].Split(')')[0];
      AFailure.LineNumber := StrToIntDef(lineStr, 0);
    end;
  end;

  writeln('FAILED: ', ATest.TestSuiteName, '.', ATest.TestName);
  if msg <> '' then
    writeln('  Message: ', msg)
  else
    writeln('  Message: Test assertion failed (no message provided)');
  writeln;
end;

procedure TCustomTestWriter.AddError(ATest: TTest; AError: TTestFailure);
begin
  writeln('ERROR in ', ATest.TestSuiteName, '.', ATest.TestName);
  writeln('  Exception: ', AError.ExceptionClassName);
  writeln('  Message:   ', AError.ExceptionMessage);
  if AError.SourceUnitName <> '' then
    writeln('  Unit:      ', AError.SourceUnitName);
  if AError.FailedMethodName <> '' then
    writeln('  Method:    ', AError.FailedMethodName);
  if AError.LineNumber <> 0 then
    writeln('  Line:      ', AError.LineNumber);
end;

procedure TCustomTestWriter.StartTest(ATest: TTest);
begin
  FCurrentTest := ATest;
  FTestFailed := False; 
  writeln('Running ', ATest.TestSuiteName, '.', ATest.TestName, '... ');
end;

procedure TCustomTestWriter.EndTest(ATest: TTest);
begin
  if not FTestFailed then  
    writeln('PASSED');
  FCurrentTest := nil;
end;

procedure TCustomTestWriter.StartTestSuite(ATestSuite: TTestSuite);
begin
  // Optional: Add any test suite start text
end;

procedure TCustomTestWriter.EndTestSuite(ATestSuite: TTestSuite);
begin
  // Optional: Add any test suite end text
end;

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
  testSuite := GetTestRegistry; // Initialize testSuite
  
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
  FCustomWriter := TCustomTestWriter.Create; 
  
  try
    testResult.AddListener(FCustomWriter);  
    
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
    
    FCustomWriter.WriteResult(testResult);  
  finally
    testResult.Free;
    FCustomWriter.Free;
    FinalizeLibrary
  end;
end.

initialization
begin
  InitializeLibrary
end.
