unit LibLoader;

interface

procedure InitializeLibrary;
procedure FinalizeLibrary;

implementation

uses
  SysUtils, DynLibs;

var
  LibHandle: TLibHandle;
  IsLibraryLoaded: Boolean;

procedure InitializeLibrary;
var
  LibPath: string;
  AbsPath: string;
begin
  if IsLibraryLoaded then Exit; 
  
  {$IFDEF WINDOWS}
    LibPath := '../../data/language_files/cpp/lib/win64/SplashKitBackend.dll';
  {$ENDIF}
  {$IFDEF DARWIN}
    LibPath := '../../data/language_files/cpp/lib/macos/libSplashKitBackend.dylib';
  {$ENDIF}
  {$IFDEF LINUX}
    LibPath := '../../data/language_files/cpp/lib/linux/libSplashKitBackend.so';
  {$ENDIF}

  AbsPath := ExpandFileName(LibPath);
  WriteLn('Loading library from: ', AbsPath);
  
  try
    LibHandle := LoadLibrary(PChar(AbsPath));
    if LibHandle = NilHandle then
    begin
      WriteLn('Error: Failed to load SplashKit backend library');
      WriteLn('Error code: ', GetLoadErrorStr);
      IsLibraryLoaded := False;
      Halt(1);
    end;
    
    IsLibraryLoaded := True;
    WriteLn('Library loaded successfully. Handle: ', LibHandle);
  except
    on E: Exception do
    begin
      WriteLn('Exception loading library: ', E.Message);
      LibHandle := NilHandle;
      IsLibraryLoaded := False;
      Halt(1);
    end;
  end;
end;

procedure FinalizeLibrary;
begin
  if IsLibraryLoaded and (LibHandle <> NilHandle) then
  begin
    WriteLn('Unloading library...');
    try
      UnloadLibrary(LibHandle);
    except
      on E: Exception do
        WriteLn('Exception unloading library: ', E.Message);
    end;
    LibHandle := NilHandle;
    IsLibraryLoaded := False;
  end;
end;

initialization
  LibHandle := NilHandle;
  IsLibraryLoaded := False;
  WriteLn('LibLoader initialization');

finalization
  if IsLibraryLoaded then
    FinalizeLibrary;
  WriteLn('LibLoader finalization');

end.
