unit Helpers;

interface

type
  TSpriteDelegates = class
  private
    FEventCalled: Boolean;
    FFloatFunctionCallCount: Integer;
    FFunctionCallCount: Integer;
  public
    constructor Create;
    procedure SpriteFloatCallback(Ptr: Pointer; Value: Single);
    procedure SpriteCallback(Ptr: Pointer);
    procedure SpriteEventCallback(Ptr: Pointer; Evt: Integer);
    procedure Reset;
    property EventCalled: Boolean read FEventCalled;
    property FloatFunctionCallCount: Integer read FFloatFunctionCallCount;
    property FunctionCallCount: Integer read FFunctionCallCount;
  end;

  TKeyCallbacks = class
  private
    FKeyTyped: Integer;
    FKeyDown: Integer;
    FKeyUp: Integer;
  public
    constructor Create;
    procedure OnKeyTyped(Key: Integer);
    procedure OnKeyDown(Key: Integer);
    procedure OnKeyUp(Key: Integer);
    procedure Reset;
    property KeyTyped: Integer read FKeyTyped;
    property KeyDown: Integer read FKeyDown;
    property KeyUp: Integer read FKeyUp;
  end;

  TNotifierTracker = class
  private
    FWasNotified: Boolean;
  public
    constructor Create;
    procedure OnFree(Resource: Pointer);
    procedure Reset;
    property WasNotified: Boolean read FWasNotified;
  end;

  AnimationScriptCleanup = class(TInterfacedObject, IDisposable)
  public
    constructor Create;
    destructor Destroy; override;
  end;

  AnimationCleanup = class(TInterfacedObject, IDisposable)
  private
    FAnimation: Animation;
  public
    constructor Create(animation: Animation);
    destructor Destroy; override;
  end;

  AudioCleanup = class(TInterfacedObject, IDisposable)
  public
    constructor Create;
    destructor Destroy; override;
  end;

  SoundEffectCleanup = class(TInterfacedObject, IDisposable)
  public
    constructor Create;
    destructor Destroy; override;
  end;

  MusicCleanup = class(TInterfacedObject, IDisposable)
  public
    constructor Create;
    destructor Destroy; override;
  end;

  WindowCleanup = class(TInterfacedObject, IDisposable)
  public
    constructor Create;
    destructor Destroy; override;
  end;

  BitmapCleanup = class(TInterfacedObject, IDisposable)
  public
    constructor Create;
    destructor Destroy; override;
  end;

  SpriteCleanup = class(TInterfacedObject, IDisposable)
  public
    constructor Create;
    destructor Destroy; override;
  end;

  FontCleanup = class(TInterfacedObject, IDisposable)
  public
    constructor Create;
    destructor Destroy; override;
  end;

  RaspiCleanup = class(TInterfacedObject, IDisposable)
  public
    constructor Create;
    destructor Destroy; override;
  end;

  JsonCleanup = class(TInterfacedObject, IDisposable)
  public
    constructor Create;
    destructor Destroy; override;
  end;

  ServerCleanup = class(TInterfacedObject, IDisposable)
  public
    constructor Create;
    destructor Destroy; override;
  end;

  ConnectionCleanup = class(TInterfacedObject, IDisposable)
  public
    constructor Create;
    destructor Destroy; override;
  end;

  ResourceCleanup = class(TInterfacedObject, IDisposable)
  private
    FBundleName: String;
  public
    constructor Create(bundleName: String);
    destructor Destroy; override;
  end;

  SpritePackCleanup = class(TInterfacedObject, IDisposable)
  private
    FPackName: String;
  public
    constructor Create(packName: String);
    destructor Destroy; override;
  end;

  TimerCleanup = class(TInterfacedObject, IDisposable)
  public
    constructor Create;
    destructor Destroy; override;
  end;

  LoggerCleanup = class(TInterfacedObject, IDisposable)
  public
    constructor Create;
    destructor Destroy; override;
  end;

implementation

{ TSpriteDelegates }

constructor TSpriteDelegates.Create;
begin
  inherited;
  Reset;
end;

procedure TSpriteDelegates.SpriteFloatCallback(Ptr: Pointer; Value: Single);
begin
  Inc(FFloatFunctionCallCount);
  FEventCalled := True;
end;

procedure TSpriteDelegates.SpriteCallback(Ptr: Pointer);
begin
  Inc(FFunctionCallCount);
  FEventCalled := True;
end;

procedure TSpriteDelegates.SpriteEventCallback(Ptr: Pointer; Evt: Integer);
begin
  FEventCalled := True;
end;

procedure TSpriteDelegates.Reset;
begin
  FFloatFunctionCallCount := 0;
  FFunctionCallCount := 0;
  FEventCalled := False;
end;

{ TKeyCallbacks }

constructor TKeyCallbacks.Create;
begin
  inherited;
  Reset;
end;

procedure TKeyCallbacks.OnKeyTyped(Key: Integer);
begin
  FKeyTyped := Key;
end;

procedure TKeyCallbacks.OnKeyDown(Key: Integer);
begin
  FKeyDown := Key;
end;

procedure TKeyCallbacks.OnKeyUp(Key: Integer);
begin
  FKeyUp := Key;
end;

procedure TKeyCallbacks.Reset;
begin
  FKeyTyped := 0;
  FKeyDown := 0;
  FKeyUp := 0;
end;

{ TNotifierTracker }

constructor TNotifierTracker.Create;
begin
  inherited;
  Reset;
end;

procedure TNotifierTracker.OnFree(Resource: Pointer);
begin
  FWasNotified := True;
end;

procedure TNotifierTracker.Reset;
begin
  FWasNotified := False;
end;

{ AnimationScriptCleanup }

constructor AnimationScriptCleanup.Create;
begin
end;

destructor AnimationScriptCleanup.Destroy;
begin
    free_all_animation_scripts;
    inherited;
end;

{ AnimationCleanup }

constructor AnimationCleanup.Create(animation: Animation);
begin
    FAnimation := animation;
end;

destructor AnimationCleanup.Destroy;
begin
    free_animation(FAnimation);
    inherited;
end;

{ AudioCleanup }

constructor AudioCleanup.Create;
begin
end;

destructor AudioCleanup.Destroy;
begin
    close_audio;
    inherited;
end;

{ SoundEffectCleanup }

constructor SoundEffectCleanup.Create;
begin
end;

destructor SoundEffectCleanup.Destroy;
begin
    free_all_sound_effects;
    inherited;
end;

{ MusicCleanup }

constructor MusicCleanup.Create;
begin
end;

destructor MusicCleanup.Destroy;
begin
    free_all_music;
    inherited;
end;

{ WindowCleanup }

constructor WindowCleanup.Create;
begin
end;

destructor WindowCleanup.Destroy;
begin
    close_all_windows;
    set_camera_position(point_at(0, 0));
    inherited;
end;

{ BitmapCleanup }

constructor BitmapCleanup.Create;
begin
end;

destructor BitmapCleanup.Destroy;
begin
    free_all_bitmaps;
    inherited;
end;

{ SpriteCleanup }

constructor SpriteCleanup.Create;
begin
end;

destructor SpriteCleanup.Destroy;
begin
    free_all_sprites;
    inherited;
end;

{ FontCleanup }

constructor FontCleanup.Create;
begin
end;

destructor FontCleanup.Destroy;
begin
    free_all_fonts;
    inherited;
end;

{ RaspiCleanup }

constructor RaspiCleanup.Create;
begin
end;

destructor RaspiCleanup.Destroy;
begin
    raspi_cleanup;
    inherited;
end;

{ JsonCleanup }

constructor JsonCleanup.Create;
begin
end;

destructor JsonCleanup.Destroy;
begin
    free_all_json;
    inherited;
end;

{ ServerCleanup }

constructor ServerCleanup.Create;
begin
end;

destructor ServerCleanup.Destroy;
begin
    close_all_servers;
    inherited;
end;

{ ConnectionCleanup }

constructor ConnectionCleanup.Create;
begin
end;

destructor ConnectionCleanup.Destroy;
begin
    close_all_connections;
    inherited;
end;

{ ResourceCleanup }

constructor ResourceCleanup.Create(bundleName: String);
begin
    FBundleName := bundleName;
end;

destructor ResourceCleanup.Destroy;
begin
    free_resource_bundle(FBundleName);
    inherited;
end;

{ SpritePackCleanup }

constructor SpritePackCleanup.Create(packName: String);
begin
    FPackName := packName;
end;

destructor SpritePackCleanup.Destroy;
begin
    free_sprite_pack(FPackName);
    inherited;
end;

{ TimerCleanup }

constructor TimerCleanup.Create;
begin
end;

destructor TimerCleanup.Destroy;
begin
    free_all_timers;
    inherited;
end;

{ LoggerCleanup }

constructor LoggerCleanup.Create;
begin
end;

destructor LoggerCleanup.Destroy;
begin
    close_log_process;
    inherited;
end;

end. 