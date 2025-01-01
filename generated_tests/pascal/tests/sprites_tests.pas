uses SplashKit, TestFramework, ../Helpers;
type
    TTestSprites = class(TTestCase)
    protected
        procedure Setup; override;
    end;
begin
    inherited;
    SetResourcesPath('/mnt/c/Users/Noahc/Documents/aYear_2_semester_2/TeamProject/GitHubRepo/splashkit_test_generator/resources');
end;
procedure TestCallForAllSpritesWithValueIntegration;
begin
    spriteDelegates := SpriteDelegates.Create();
    testBitmap := CreateBitmap('test_bitmap', 100, 100);
    CleanupBitmap := TBitmapCleanup.Create;
    testSprite1 := CreateSprite(testBitmap);
    CleanupSprite := TSpriteCleanup.Create;
    testSprite2 := CreateSprite(testBitmap);
    CallForAllSprites(spriteDelegates.sprite_float_function, 300);
    AssertEquals(2, spriteDelegates.float_function_call_count);
    AssertTrue(spriteDelegates.event_called);
end;
procedure TestCallForAllSpritesIntegration;
begin
    spriteDelegates := SpriteDelegates.Create();
    testBitmap := CreateBitmap('test_bitmap', 100, 100);
    CleanupBitmap := TBitmapCleanup.Create;
    testSprite1 := CreateSprite(testBitmap);
    CleanupSprite := TSpriteCleanup.Create;
    testSprite2 := CreateSprite(testBitmap);
    CallForAllSprites(spriteDelegates.sprite_function);
    AssertEquals(2, spriteDelegates.function_call_count);
    AssertTrue(spriteDelegates.event_called);
end;
procedure TestCallOnSpriteEventIntegration;
begin
    spriteDelegates := SpriteDelegates.Create();
    testBitmap := CreateBitmap('test_bitmap', 100, 100);
    CleanupBitmap := TBitmapCleanup.Create;
    testAnimation := LoadAnimationScript('test_animation', 'kermit.txt');
    CleanupAnimationScript := TAnimationScriptCleanup.Create;
    testSprite := CreateSprite('test_sprite', testBitmap, testAnimation);
    CleanupSprite := TSpriteCleanup.Create;
    CallOnSpriteEvent(spriteDelegates.sprite_event_handler);
    UpdateSprite(testSprite);
    StopCallingOnSpriteEvent(spriteDelegates.sprite_event_handler);
    AssertTrue(spriteDelegates.event_called);
end;
procedure TestCenterPointOfSpriteIntegration;
begin
    testBitmap := CreateBitmap('test_bitmap', 100, 100);
    CleanupBitmap := TBitmapCleanup.Create;
    testSprite := CreateSprite(testBitmap);
    CleanupSprite := TSpriteCleanup.Create;
    SpriteSetPosition(testSprite, PointAt(100.0, 100.0));
    centerPoint := CenterPoint(testSprite);
    AssertEquals(150.0, centerPoint.x);
    AssertEquals(150.0, centerPoint.y);
end;
procedure TestCreateSpriteIntegration;
begin
    testBitmap := CreateBitmap('test_bitmap', 100, 100);
    CleanupBitmap := TBitmapCleanup.Create;
    testSprite := CreateSprite(testBitmap);
    CleanupSprite := TSpriteCleanup.Create;
    AssertNotNull(testSprite);
    AssertTrue(HasSprite(SpriteName(testSprite)));
end;
procedure TestCreateSpriteWithAnimationIntegration;
begin
    testBitmap := CreateBitmap('test_bitmap', 100, 100);
    CleanupBitmap := TBitmapCleanup.Create;
    testAnimation := LoadAnimationScript('test_animation', 'kermit.txt');
    CleanupAnimationScript := TAnimationScriptCleanup.Create;
    testSprite := CreateSprite(testBitmap, testAnimation);
    CleanupSprite := TSpriteCleanup.Create;
    AssertNotNull(testSprite);
    AssertTrue(HasSprite(SpriteName(testSprite)));
end;
procedure TestCreateSpriteWithBitmapNamedIntegration;
begin
    testBitmap := CreateBitmap('test_bitmap', 100, 100);
    CleanupBitmap := TBitmapCleanup.Create;
    testSprite := CreateSprite('test_bitmap');
    CleanupSprite := TSpriteCleanup.Create;
    AssertNotNull(testSprite);
    AssertTrue(HasSprite(SpriteName(testSprite)));
end;
procedure TestCreateSpriteNamedIntegration;
begin
    testBitmap := CreateBitmap('test_bitmap', 100, 100);
    CleanupBitmap := TBitmapCleanup.Create;
    testSprite := CreateSprite('test_sprite', testBitmap);
    CleanupSprite := TSpriteCleanup.Create;
    AssertNotNull(testSprite);
    AssertEquals('test_sprite', SpriteName(testSprite));
end;
procedure TestCreateSpriteNamedWithAnimationIntegration;
begin
    testBitmap := CreateBitmap('test_bitmap', 100, 100);
    CleanupBitmap := TBitmapCleanup.Create;
    testAnimation := LoadAnimationScript('test_animation', 'kermit.txt');
    CleanupAnimationScript := TAnimationScriptCleanup.Create;
    testSprite := CreateSprite('test_sprite', testBitmap, testAnimation);
    CleanupSprite := TSpriteCleanup.Create;
    AssertNotNull(testSprite);
    AssertEquals('test_sprite', SpriteName(testSprite));
end;
procedure TestCreateSpriteWithBitmapAndAnimationNamedIntegration;
begin
    testBitmap := CreateBitmap('test_bitmap', 100, 100);
    CleanupBitmap := TBitmapCleanup.Create;
    testAnimation := LoadAnimationScript('test_animation', 'kermit.txt');
    CleanupAnimationScript := TAnimationScriptCleanup.Create;
    testSprite := CreateSprite('test_bitmap', 'test_animation');
    CleanupSprite := TSpriteCleanup.Create;
    AssertNotNull(testSprite);
    AssertTrue(HasSprite(SpriteName(testSprite)));
end;
procedure TestCreateSpritePackIntegration;
begin
    AssertFalse(HasSpritePack('test_pack'));
    CreateSpritePack('test_pack');
    CleanupSpritePack := TSpritePackCleanup.Create('test_pack')
    AssertTrue(HasSpritePack('test_pack'));
end;
procedure TestCurrentSpritePackIntegration;
begin
    AssertEquals('default', CurrentSpritePack());
    CreateSpritePack('test_pack');
    CleanupSpritePack := TSpritePackCleanup.Create('test_pack')
    SelectSpritePack('test_pack');
    AssertEquals('test_pack', CurrentSpritePack());
end;
procedure TestDrawAllSpritesIntegration;
begin
    testWindow := OpenWindow('Test Window', 800, 600);
    CleanupWindow := TWindowCleanup.Create;
    testBitmap := CreateBitmap('test_bitmap', 100, 100);
    CleanupBitmap := TBitmapCleanup.Create;
    ClearBitmap(testBitmap, ColorBlack());
    testSprite1 := CreateSprite(testBitmap);
    CleanupSprite := TSpriteCleanup.Create;
    testSprite2 := CreateSprite(testBitmap);
    SpriteSetPosition(testSprite1, PointAt(100.0, 100.0));
    SpriteSetPosition(testSprite2, PointAt(200.0, 200.0));
    ClearScreen(ColorWhite());
    DrawAllSprites();
    RefreshScreen();
    AssertEquals(ColorBlack(), GetPixel(testWindow, 100.0, 100.0));
    AssertEquals(ColorBlack(), GetPixel(testWindow, 200.0, 200.0));
end;
procedure TestDrawSpriteOffsetByIntegration;
begin
    testWindow := OpenWindow('Test Window', 800, 600);
    CleanupWindow := TWindowCleanup.Create;
    testBitmap := CreateBitmap('test_bitmap', 100, 100);
    CleanupBitmap := TBitmapCleanup.Create;
    ClearBitmap(testBitmap, ColorBlack());
    testSprite := CreateSprite(testBitmap);
    CleanupSprite := TSpriteCleanup.Create;
    SpriteSetPosition(testSprite, PointAt(400.0, 300.0));
    ClearScreen(ColorWhite());
    DrawSprite(testSprite, VectorFromAngle(50.0, 50.0));
    RefreshScreen();
    AssertNotEquals(ColorWhite(), GetPixel(testWindow, 450.0, 350.0));
end;
procedure TestDrawSpriteIntegration;
begin
    testWindow := OpenWindow('Test Window', 800, 600);
    CleanupWindow := TWindowCleanup.Create;
    testBitmap := CreateBitmap('test_bitmap', 100, 100);
    CleanupBitmap := TBitmapCleanup.Create;
    ClearBitmap(testBitmap, ColorBlack());
    testSprite := CreateSprite('test_sprite', testBitmap);
    CleanupSprite := TSpriteCleanup.Create;
    SpriteSetPosition(testSprite, PointAt(400.0, 300.0));
    ClearScreen(ColorWhite());
    DrawSprite(testSprite);
    RefreshScreen();
    AssertEquals(ColorBlack(), GetPixel(testWindow, 400.0, 300.0));
end;
procedure TestDrawSpriteOffsetXYIntegration;
begin
    testWindow := OpenWindow('Test Window', 800, 600);
    CleanupWindow := TWindowCleanup.Create;
    testBitmap := CreateBitmap('test_bitmap', 100, 100);
    CleanupBitmap := TBitmapCleanup.Create;
    ClearBitmap(testBitmap, ColorBlack());
    testSprite := CreateSprite(testBitmap);
    CleanupSprite := TSpriteCleanup.Create;
    SpriteSetPosition(testSprite, PointAt(400.0, 300.0));
    ClearScreen(ColorWhite());
    DrawSprite(testSprite, 50.0, 50.0);
    RefreshScreen();
    AssertNotEquals(ColorWhite(), GetPixel(testWindow, 450.0, 350.0));
end;
procedure TestFreeAllSpritesIntegration;
begin
    testBitmap := CreateBitmap('test_bitmap', 100, 100);
    CleanupBitmap := TBitmapCleanup.Create;
    CreateSprite('test_sprite1', testBitmap);
    CleanupSprite := TSpriteCleanup.Create;
    CreateSprite('test_sprite2', testBitmap);
    AssertTrue(HasSprite('test_sprite1'));
    AssertTrue(HasSprite('test_sprite2'));
    FreeAllSprites();
    AssertFalse(HasSprite('test_sprite1'));
    AssertFalse(HasSprite('test_sprite2'));
end;
procedure TestFreeSpriteIntegration;
begin
    testBitmap := CreateBitmap('test_bitmap', 100, 100);
    CleanupBitmap := TBitmapCleanup.Create;
    testSprite := CreateSprite('test_sprite', testBitmap);
    CleanupSprite := TSpriteCleanup.Create;
    AssertTrue(HasSprite('test_sprite'));
    FreeSprite(testSprite);
    AssertFalse(HasSprite('test_sprite'));
end;
procedure TestFreeSpritePackIntegration;
begin
    AssertEquals('default', CurrentSpritePack());
    CreateSpritePack('test_pack');
    CleanupSpritePack := TSpritePackCleanup.Create('test_pack')
    SelectSpritePack('test_pack');
    AssertTrue(HasSpritePack('test_pack'));
    AssertEquals('test_pack', CurrentSpritePack());
    FreeSpritePack('test_pack');
    AssertFalse(HasSpritePack('test_pack'));
    AssertEquals('default', CurrentSpritePack());
end;
procedure TestHasSpriteIntegration;
begin
    testBitmap := CreateBitmap('test_bitmap', 100, 100);
    CleanupBitmap := TBitmapCleanup.Create;
    AssertFalse(HasSprite('test_sprite'));
    testSprite := CreateSprite('test_sprite', testBitmap);
    CleanupSprite := TSpriteCleanup.Create;
    AssertTrue(HasSprite('test_sprite'));
    FreeSprite(testSprite);
    AssertFalse(HasSprite('test_sprite'));
end;
procedure TestHasSpritePackIntegration;
begin
    AssertFalse(HasSpritePack('test_pack'));
    CreateSpritePack('test_pack');
    CleanupSpritePack := TSpritePackCleanup.Create('test_pack')
    AssertTrue(HasSpritePack('test_pack'));
    FreeSpritePack('test_pack');
    AssertFalse(HasSpritePack('test_pack'));
end;
procedure TestMoveSpriteIntegration;
begin
    testBitmap := CreateBitmap('test_bitmap', 100, 100);
    CleanupBitmap := TBitmapCleanup.Create;
    testSprite := CreateSprite('test_sprite', testBitmap);
    CleanupSprite := TSpriteCleanup.Create;
    startPosition := PointAt(100.0, 100.0);
    SpriteSetPosition(testSprite, startPosition);
    SpriteSetVelocity(testSprite, VectorTo(10.0, 10.0));
    MoveSprite(testSprite);
    AssertEquals(110.0, SpriteX(testSprite));
    AssertEquals(110.0, SpriteY(testSprite));
end;
procedure TestMoveSpriteByVectorIntegration;
begin
    testBitmap := CreateBitmap('test_bitmap', 100, 100);
    CleanupBitmap := TBitmapCleanup.Create;
    testSprite := CreateSprite('test_sprite', testBitmap);
    CleanupSprite := TSpriteCleanup.Create;
    SpriteSetPosition(testSprite, PointAt(100.0, 100.0));
    MoveSprite(testSprite, VectorTo(50.0, 50.0));
    AssertEquals(150.0, SpriteX(testSprite));
    AssertEquals(150, SpriteY(testSprite));
end;
procedure TestMoveSpriteByVectorPercentIntegration;
begin
    testBitmap := CreateBitmap('test_bitmap', 100, 100);
    CleanupBitmap := TBitmapCleanup.Create;
    testSprite := CreateSprite('test_sprite', testBitmap);
    CleanupSprite := TSpriteCleanup.Create;
    SpriteSetPosition(testSprite, PointAt(100.0, 100.0));
    MoveSprite(testSprite, VectorTo(50.0, 50.0), 0.5);
    AssertEquals(125.0, SpriteX(testSprite));
    AssertEquals(125.0, SpriteY(testSprite));
end;
procedure TestMoveSpritePercentIntegration;
begin
    testBitmap := CreateBitmap('test_bitmap', 100, 100);
    CleanupBitmap := TBitmapCleanup.Create;
    testSprite := CreateSprite('test_sprite', testBitmap);
    CleanupSprite := TSpriteCleanup.Create;
    SpriteSetPosition(testSprite, PointAt(100.0, 100.0));
    SpriteSetVelocity(testSprite, VectorTo(10.0, 10.0));
    MoveSprite(testSprite, 0.5);
    AssertEquals(105.0, SpriteX(testSprite));
    AssertEquals(105.0, SpriteY(testSprite));
end;
procedure TestMoveSpriteToIntegration;
begin
    testBitmap := CreateBitmap('test_bitmap', 100, 100);
    CleanupBitmap := TBitmapCleanup.Create;
    testSprite := CreateSprite('test_sprite', testBitmap);
    CleanupSprite := TSpriteCleanup.Create;
    MoveSpriteTo(testSprite, 400.0, 300.0);
    AssertEquals(400.0, SpriteX(testSprite));
    AssertEquals(300.0, SpriteY(testSprite));
end;
procedure TestSelectSpritePackIntegration;
begin
    CreateSpritePack('test_pack');
    CleanupSpritePack := TSpritePackCleanup.Create('test_pack')
    AssertEquals('default', CurrentSpritePack());
    SelectSpritePack('test_pack');
    AssertEquals('test_pack', CurrentSpritePack());
end;
procedure TestSpriteAddLayerIntegration;
begin
    testBitmap := CreateBitmap('test_bitmap', 100, 100);
    CleanupBitmap := TBitmapCleanup.Create;
    testSprite := CreateSprite('test_sprite', testBitmap);
    CleanupSprite := TSpriteCleanup.Create;
    newLayerBitmap := CreateBitmap('new_layer', 50, 50);
    layerIndex := SpriteAddLayer(testSprite, newLayerBitmap, 'new_layer');
    AssertEquals(1, layerIndex);
    AssertEquals(2, SpriteLayerCount(testSprite));
end;
procedure TestSpriteAddToVelocityIntegration;
begin
    testBitmap := CreateBitmap('test_bitmap', 100, 100);
    CleanupBitmap := TBitmapCleanup.Create;
    testSprite := CreateSprite('test_sprite', testBitmap);
    CleanupSprite := TSpriteCleanup.Create;
    SpriteSetVelocity(testSprite, VectorTo(0.0, 0.0));
    SpriteAddToVelocity(testSprite, VectorTo(10.0, 10.0));
    velocity := SpriteVelocity(testSprite);
    AssertEquals(10.0, velocity.x);
    AssertEquals(10.0, velocity.y);
end;
procedure TestSpriteAddValueIntegration;
begin
    testBitmap := CreateBitmap('test_bitmap', 100, 100);
    CleanupBitmap := TBitmapCleanup.Create;
    testSprite := CreateSprite('test_sprite', testBitmap);
    CleanupSprite := TSpriteCleanup.Create;
    SpriteAddValue(testSprite, 'health', 100.0);
    AssertTrue(SpriteHasValue(testSprite, 'health'));
    AssertEquals(100.0, SpriteValue(testSprite, 'health'));
end;
procedure TestSpriteAddValueWithDefaultIntegration;
begin
    testBitmap := CreateBitmap('test_bitmap', 100, 100);
    CleanupBitmap := TBitmapCleanup.Create;
    testSprite := CreateSprite('test_sprite', testBitmap);
    CleanupSprite := TSpriteCleanup.Create;
    SpriteAddValue(testSprite, 'health', 100.0);
    AssertTrue(SpriteHasValue(testSprite, 'health'));
    AssertEquals(100.0, SpriteValue(testSprite, 'health'));
end;
procedure TestSpriteAnchorPointIntegration;
begin
    testBitmap := CreateBitmap('test_bitmap', 100, 100);
    CleanupBitmap := TBitmapCleanup.Create;
    testSprite := CreateSprite('test_sprite', testBitmap);
    CleanupSprite := TSpriteCleanup.Create;
    anchorPoint := SpriteAnchorPoint(testSprite);
    AssertEquals(50.0, anchorPoint.x);
    AssertEquals(50.0, anchorPoint.y);
end;
procedure TestSpriteAnchorPositionIntegration;
begin
    testBitmap := CreateBitmap('test_bitmap', 100, 100);
    CleanupBitmap := TBitmapCleanup.Create;
    testSprite := CreateSprite('test_sprite', testBitmap);
    CleanupSprite := TSpriteCleanup.Create;
    SpriteSetPosition(testSprite, PointAt(100.0, 100.0));
    anchorPosition := SpriteAnchorPosition(testSprite);
    AssertEquals(150.0, anchorPosition.x);
    AssertEquals(150.0, anchorPosition.y);
end;
procedure TestSpriteAnimationHasEndedIntegration;
begin
    testBitmap := CreateBitmap('test_bitmap', 100, 100);
    CleanupBitmap := TBitmapCleanup.Create;
    testAnimation := LoadAnimationScript('test_animation', 'kermit.txt');
    CleanupAnimationScript := TAnimationScriptCleanup.Create;
    testSprite := CreateSprite('test_sprite', testBitmap, testAnimation);
    CleanupSprite := TSpriteCleanup.Create;
    SpriteStartAnimation(testSprite, 'walkfront');
    AssertFalse(SpriteAnimationHasEnded(testSprite));
    for i := 0 to 4 do
        UpdateSpriteAnimation(testSprite, 100.0);
    end;
    AssertTrue(SpriteAnimationHasEnded(testSprite));
end;
procedure TestSpriteAnimationNameIntegration;
begin
    testBitmap := CreateBitmap('test_bitmap', 100, 100);
    CleanupBitmap := TBitmapCleanup.Create;
    testAnimation := LoadAnimationScript('test_animation', 'kermit.txt');
    CleanupAnimationScript := TAnimationScriptCleanup.Create;
    testSprite := CreateSprite('test_sprite', testBitmap, testAnimation);
    CleanupSprite := TSpriteCleanup.Create;
    SpriteStartAnimation(testSprite, 'walkfront');
    AssertEquals('walkfront', SpriteAnimationName(testSprite));
end;
procedure TestSpriteAtIntegration;
begin
    testBitmap := CreateBitmap('test_bitmap', 100, 100);
    CleanupBitmap := TBitmapCleanup.Create;
    ClearBitmap(testBitmap, ColorRed());
    SetupCollisionMask(testBitmap);
    testSprite := CreateSprite('test_sprite', testBitmap);
    CleanupSprite := TSpriteCleanup.Create;
    SpriteSetX(testSprite, 400);
    SpriteSetY(testSprite, 300);
    AssertTrue(SpriteAt(testSprite, PointAt(451.0, 350.0)));
    AssertFalse(SpriteAt(testSprite, PointAt(600.0, 500.0)));
end;
procedure TestSpriteBringLayerForwardIntegration;
begin
    testBitmap := CreateBitmap('test_bitmap', 100, 100);
    CleanupBitmap := TBitmapCleanup.Create;
    testSprite := CreateSprite('test_sprite', testBitmap);
    CleanupSprite := TSpriteCleanup.Create;
    layerIndex := SpriteAddLayer(testSprite, testBitmap, 'layer2');
    SpriteShowLayer(testSprite, layerIndex);
    visibleIndex := SpriteVisibleIndexOfLayer(testSprite, layerIndex);
    SpriteBringLayerForward(testSprite, visibleIndex);
    AssertEquals(0, SpriteVisibleIndexOfLayer(testSprite, layerIndex));
end;
procedure TestSpriteBringLayerToFrontIntegration;
begin
    testBitmap := CreateBitmap('test_bitmap', 100, 100);
    CleanupBitmap := TBitmapCleanup.Create;
    testSprite := CreateSprite('test_sprite', testBitmap);
    CleanupSprite := TSpriteCleanup.Create;
    layerIndex := SpriteAddLayer(testSprite, testBitmap, 'layer2');
    SpriteShowLayer(testSprite, layerIndex);
    visibleIndex := SpriteVisibleIndexOfLayer(testSprite, layerIndex);
    SpriteBringLayerToFront(testSprite, visibleIndex);
    AssertEquals(0, SpriteVisibleIndexOfLayer(testSprite, 'layer2'));
end;
procedure TestSpriteCallOnEventIntegration;
begin
    spriteDelegates := SpriteDelegates.Create();
    testBitmap := CreateBitmap('test_bitmap', 100, 100);
    CleanupBitmap := TBitmapCleanup.Create;
    testSprite := CreateSprite('test_sprite', testBitmap);
    CleanupSprite := TSpriteCleanup.Create;
    SpriteCallOnEvent(testSprite, spriteDelegates.sprite_event_handler);
    UpdateSprite(testSprite);
    StopCallingOnSpriteEvent(spriteDelegates.sprite_event_handler);
    AssertTrue(spriteDelegates.event_called);
end;
procedure TestSpriteCircleIntegration;
begin
    testBitmap := CreateBitmap('test_bitmap', 100, 100);
    CleanupBitmap := TBitmapCleanup.Create;
    testSprite := CreateSprite('test_sprite', testBitmap);
    CleanupSprite := TSpriteCleanup.Create;
    circle := SpriteCircle(testSprite);
    AssertEquals(50.0, circle.center.x);
    AssertEquals(50.0, circle.center.y);
    AssertEquals(50.0, circle.radius);
end;
procedure TestSpriteCollisionBitmapIntegration;
begin
    testBitmap := CreateBitmap('test_bitmap', 100, 100);
    CleanupBitmap := TBitmapCleanup.Create;
    testSprite := CreateSprite('test_sprite', testBitmap);
    CleanupSprite := TSpriteCleanup.Create;
    collisionBitmap := SpriteCollisionBitmap(testSprite);
    AssertEquals(testBitmap, collisionBitmap);
end;
procedure TestSpriteCollisionCircleIntegration;
begin
    testBitmap := CreateBitmap('test_bitmap', 100, 100);
    CleanupBitmap := TBitmapCleanup.Create;
    testSprite := CreateSprite('test_sprite', testBitmap);
    CleanupSprite := TSpriteCleanup.Create;
    circle := SpriteCollisionCircle(testSprite);
    AssertEquals(50.0, circle.center.x);
    AssertEquals(50.0, circle.center.y);
    AssertEquals(50.0, circle.radius);
end;
procedure TestSpriteCollisionKindIntegration;
begin
    testBitmap := CreateBitmap('test_bitmap', 100, 100);
    CleanupBitmap := TBitmapCleanup.Create;
    testSprite := CreateSprite('test_sprite', testBitmap);
    CleanupSprite := TSpriteCleanup.Create;
    AssertEquals(CollisionTestKind.PIXEL_COLLISIONS, SpriteCollisionKind(testSprite));
    SpriteSetCollisionKind(testSprite, CollisionTestKind.AABB_COLLISIONS);
    AssertEquals(CollisionTestKind.AABB_COLLISIONS, SpriteCollisionKind(testSprite));
end;
procedure TestSpriteCollisionRectangleIntegration;
begin
    testBitmap := CreateBitmap('test_bitmap', 100, 100);
    CleanupBitmap := TBitmapCleanup.Create;
    testSprite := CreateSprite('test_sprite', testBitmap);
    CleanupSprite := TSpriteCleanup.Create;
    rect := SpriteCollisionRectangle(testSprite);
    AssertEquals(0.0, rect.x);
    AssertEquals(0.0, rect.y);
    AssertEquals(100.0, rect.width);
    AssertEquals(100.0, rect.height);
end;
procedure TestSpriteCurrentCellIntegration;
begin
    testBitmap := CreateBitmap('test_bitmap', 100, 100);
    CleanupBitmap := TBitmapCleanup.Create;
    testAnimation := LoadAnimationScript('test_animation', 'kermit.txt');
    CleanupAnimationScript := TAnimationScriptCleanup.Create;
    testSprite := CreateSprite('test_sprite', testBitmap, testAnimation);
    CleanupSprite := TSpriteCleanup.Create;
    SpriteStartAnimation(testSprite, 'walkfront');
    AssertEquals(0, SpriteCurrentCell(testSprite));
    UpdateSprite(testSprite, 100.0);
    AssertEquals(1, SpriteCurrentCell(testSprite));
end;
procedure TestSpriteCurrentCellRectangleIntegration;
begin
    testBitmap := CreateBitmap('test_bitmap', 100, 100);
    CleanupBitmap := TBitmapCleanup.Create;
    testSprite := CreateSprite('test_sprite', testBitmap);
    CleanupSprite := TSpriteCleanup.Create;
    rect := SpriteCurrentCellRectangle(testSprite);
    AssertEquals(0.0, rect.x);
    AssertEquals(0.0, rect.y);
    AssertEquals(100.0, rect.width);
    AssertEquals(100.0, rect.height);
end;
procedure TestSpriteDxIntegration;
begin
    testBitmap := CreateBitmap('test_bitmap', 100, 100);
    CleanupBitmap := TBitmapCleanup.Create;
    testSprite := CreateSprite('test_sprite', testBitmap);
    CleanupSprite := TSpriteCleanup.Create;
    AssertEquals(0.0, SpriteDx(testSprite));
    SpriteSetDx(testSprite, 5.0);
    AssertEquals(5.0, SpriteDx(testSprite));
end;
procedure TestSpriteDyIntegration;
begin
    testBitmap := CreateBitmap('test_bitmap', 100, 100);
    CleanupBitmap := TBitmapCleanup.Create;
    testSprite := CreateSprite('test_sprite', testBitmap);
    CleanupSprite := TSpriteCleanup.Create;
    AssertEquals(0.0, SpriteDy(testSprite));
    SpriteSetDy(testSprite, 5.0);
    AssertEquals(5.0, SpriteDy(testSprite));
end;
procedure TestSpriteHasValueIntegration;
begin
    testBitmap := CreateBitmap('test_bitmap', 100, 100);
    CleanupBitmap := TBitmapCleanup.Create;
    testSprite := CreateSprite('test_sprite', testBitmap);
    CleanupSprite := TSpriteCleanup.Create;
    AssertFalse(SpriteHasValue(testSprite, 'health'));
    SpriteAddValue(testSprite, 'health', 100.0);
    AssertTrue(SpriteHasValue(testSprite, 'health'));
    AssertFalse(SpriteHasValue(testSprite, 'mana'));
end;
procedure TestSpriteHeadingIntegration;
begin
    testBitmap := CreateBitmap('test_bitmap', 100, 100);
    CleanupBitmap := TBitmapCleanup.Create;
    testSprite := CreateSprite('test_sprite', testBitmap);
    CleanupSprite := TSpriteCleanup.Create;
    AssertEquals(90.0, SpriteHeading(testSprite));
    SpriteSetVelocity(testSprite, VectorTo(1.0, 1.0));
    AssertEquals(45.0, SpriteHeading(testSprite));
end;
procedure TestSpriteHeightIntegration;
begin
    testBitmap := CreateBitmap('test_bitmap', 100, 100);
    CleanupBitmap := TBitmapCleanup.Create;
    testSprite := CreateSprite('test_sprite', testBitmap);
    CleanupSprite := TSpriteCleanup.Create;
    AssertEquals(100, SpriteHeight(testSprite));
end;
procedure TestSpriteHideLayerNamedIntegration;
begin
    testBitmap := CreateBitmap('test_bitmap', 100, 100);
    CleanupBitmap := TBitmapCleanup.Create;
    testSprite := CreateSprite('test_sprite', testBitmap);
    CleanupSprite := TSpriteCleanup.Create;
    SpriteAddLayer(testSprite, testBitmap, 'layer2');
    SpriteShowLayer(testSprite, 'layer2');
    AssertEquals(2, SpriteVisibleLayerCount(testSprite));
    SpriteHideLayer(testSprite, 'layer2');
    AssertEquals(1, SpriteVisibleLayerCount(testSprite));
end;
procedure TestSpriteHideLayerIntegration;
begin
    testBitmap := CreateBitmap('test_bitmap', 100, 100);
    CleanupBitmap := TBitmapCleanup.Create;
    testSprite := CreateSprite('test_sprite', testBitmap);
    CleanupSprite := TSpriteCleanup.Create;
    layerIdx := SpriteAddLayer(testSprite, testBitmap, 'layer2');
    SpriteShowLayer(testSprite, layerIdx);
    AssertEquals(2, SpriteVisibleLayerCount(testSprite));
    SpriteHideLayer(testSprite, layerIdx);
    AssertEquals(1, SpriteVisibleLayerCount(testSprite));
end;
procedure TestSpriteLayerNamedIntegration;
begin
    testBitmap := CreateBitmap('test_bitmap', 100, 100);
    CleanupBitmap := TBitmapCleanup.Create;
    testSprite := CreateSprite('test_sprite', testBitmap);
    CleanupSprite := TSpriteCleanup.Create;
    SpriteAddLayer(testSprite, testBitmap, 'layer2');
    AssertEquals(testBitmap, SpriteLayer(testSprite, 'layer2'));
end;
procedure TestSpriteLayerAtIndexIntegration;
begin
    testBitmap := CreateBitmap('test_bitmap', 100, 100);
    CleanupBitmap := TBitmapCleanup.Create;
    testSprite := CreateSprite('test_sprite', testBitmap);
    CleanupSprite := TSpriteCleanup.Create;
    layerIdx := SpriteAddLayer(testSprite, testBitmap, 'layer2');
    AssertEquals(testBitmap, SpriteLayer(testSprite, layerIdx));
end;
procedure TestSpriteLayerCircleNamedIntegration;
begin
    testBitmap := CreateBitmap('test_bitmap', 100, 100);
    CleanupBitmap := TBitmapCleanup.Create;
    testSprite := CreateSprite('test_sprite', testBitmap);
    CleanupSprite := TSpriteCleanup.Create;
    circle := SpriteLayerCircle(testSprite, 'base_layer');
    AssertEquals(50.0, circle.center.x);
    AssertEquals(50.0, circle.center.y);
    AssertEquals(50.0, circle.radius);
end;
procedure TestSpriteLayerCircleAtIndexIntegration;
begin
    testBitmap := CreateBitmap('test_bitmap', 100, 100);
    CleanupBitmap := TBitmapCleanup.Create;
    testSprite := CreateSprite('test_sprite', testBitmap);
    CleanupSprite := TSpriteCleanup.Create;
    circle := SpriteLayerCircle(testSprite, 0);
    AssertEquals(50.0, circle.center.x);
    AssertEquals(50.0, circle.center.y);
    AssertEquals(50.0, circle.radius);
end;
procedure TestSpriteLayerCountIntegration;
begin
    testBitmap := CreateBitmap('test_bitmap', 100, 100);
    CleanupBitmap := TBitmapCleanup.Create;
    testSprite := CreateSprite('test_sprite', testBitmap);
    CleanupSprite := TSpriteCleanup.Create;
    AssertEquals(1, SpriteLayerCount(testSprite));
    layerIdx := SpriteAddLayer(testSprite, testBitmap, 'layer2');
    AssertEquals(2, SpriteLayerCount(testSprite));
    AssertEquals(1, layerIdx);
end;
procedure TestSpriteLayerHeightNamedIntegration;
begin
    testBitmap := CreateBitmap('test_bitmap', 100, 100);
    CleanupBitmap := TBitmapCleanup.Create;
    testSprite := CreateSprite('test_sprite', testBitmap);
    CleanupSprite := TSpriteCleanup.Create;
    AssertEquals(100, SpriteLayerHeight(testSprite, 'base_layer'));
    SpriteAddLayer(testSprite, testBitmap, 'layer2');
    AssertEquals(100, SpriteLayerHeight(testSprite, 'layer2'));
end;
procedure TestSpriteLayerHeightIntegration;
begin
    testBitmap := CreateBitmap('test_bitmap', 100, 100);
    CleanupBitmap := TBitmapCleanup.Create;
    testSprite := CreateSprite('test_sprite', testBitmap);
    CleanupSprite := TSpriteCleanup.Create;
    AssertEquals(100, SpriteLayerHeight(testSprite, 0));
    layerIdx := SpriteAddLayer(testSprite, testBitmap, 'layer2');
    AssertEquals(100, SpriteLayerHeight(testSprite, layerIdx));
end;
procedure TestSpriteLayerIndexIntegration;
begin
    testBitmap := CreateBitmap('test_bitmap', 100, 100);
    CleanupBitmap := TBitmapCleanup.Create;
    testSprite := CreateSprite('test_sprite', testBitmap);
    CleanupSprite := TSpriteCleanup.Create;
    AssertEquals(0, SpriteLayerIndex(testSprite, 'base_layer'));
    layerIdx := SpriteAddLayer(testSprite, testBitmap, 'layer2');
    AssertEquals(layerIdx, SpriteLayerIndex(testSprite, 'layer2'));
end;
procedure TestSpriteLayerNameIntegration;
begin
    testBitmap := CreateBitmap('test_bitmap', 100, 100);
    CleanupBitmap := TBitmapCleanup.Create;
    testSprite := CreateSprite('test_sprite', testBitmap);
    CleanupSprite := TSpriteCleanup.Create;
    layerIdx := SpriteAddLayer(testSprite, testBitmap, 'layer2');
    AssertEquals('', SpriteLayerName(testSprite, layerIdx));
end;
procedure TestSpriteLayerOffsetNamedIntegration;
begin
    testBitmap := CreateBitmap('test_bitmap', 100, 100);
    CleanupBitmap := TBitmapCleanup.Create;
    testSprite := CreateSprite('test_sprite', testBitmap);
    CleanupSprite := TSpriteCleanup.Create;
    AssertEquals(VectorTo(0.0, 0.0), SpriteLayerOffset(testSprite, 'base_layer'));
    SpriteSetLayerOffset(testSprite, 'base_layer', VectorTo(10.0, 10.0));
    AssertEquals(VectorTo(10.0, 10.0), SpriteLayerOffset(testSprite, 'base_layer'));
end;
procedure TestSpriteLayerOffsetIntegration;
begin
    testBitmap := CreateBitmap('test_bitmap', 100, 100);
    CleanupBitmap := TBitmapCleanup.Create;
    testSprite := CreateSprite('test_sprite', testBitmap);
    CleanupSprite := TSpriteCleanup.Create;
    AssertEquals(VectorTo(0.0, 0.0), SpriteLayerOffset(testSprite, 0));
    layerIdx := SpriteAddLayer(testSprite, testBitmap, 'layer2');
    SpriteSetLayerOffset(testSprite, layerIdx, VectorTo(10.0, 10.0));
    AssertEquals(VectorTo(10.0, 10.0), SpriteLayerOffset(testSprite, layerIdx));
end;
procedure TestSpriteLayerRectangleNamedIntegration;
begin
    testBitmap := CreateBitmap('test_bitmap', 100, 100);
    CleanupBitmap := TBitmapCleanup.Create;
    testSprite := CreateSprite('test_sprite', testBitmap);
    CleanupSprite := TSpriteCleanup.Create;
    rect := SpriteLayerRectangle(testSprite, 'base_layer');
    AssertEquals(0.0, rect.x);
    AssertEquals(0.0, rect.y);
    AssertEquals(100.0, rect.width);
    AssertEquals(100.0, rect.height);
end;
procedure TestSpriteLayerRectangleAtIndexIntegration;
begin
    testBitmap := CreateBitmap('test_bitmap', 100, 100);
    CleanupBitmap := TBitmapCleanup.Create;
    testSprite := CreateSprite('test_sprite', testBitmap);
    CleanupSprite := TSpriteCleanup.Create;
    rect := SpriteLayerRectangle(testSprite, 0);
    AssertEquals(0.0, rect.x);
    AssertEquals(0.0, rect.y);
    AssertEquals(100.0, rect.width);
    AssertEquals(100.0, rect.height);
end;
procedure TestSpriteLayerWidthNamedIntegration;
begin
    testBitmap := CreateBitmap('test_bitmap', 100, 100);
    CleanupBitmap := TBitmapCleanup.Create;
    testSprite := CreateSprite('test_sprite', testBitmap);
    CleanupSprite := TSpriteCleanup.Create;
    AssertEquals(100, SpriteLayerWidth(testSprite, 'base_layer'));
    SpriteAddLayer(testSprite, testBitmap, 'layer2');
    AssertEquals(100, SpriteLayerWidth(testSprite, 'layer2'));
end;
procedure TestSpriteLayerWidthIntegration;
begin
    testBitmap := CreateBitmap('test_bitmap', 100, 100);
    CleanupBitmap := TBitmapCleanup.Create;
    testSprite := CreateSprite('test_sprite', testBitmap);
    CleanupSprite := TSpriteCleanup.Create;
    AssertEquals(100, SpriteLayerWidth(testSprite, 0));
    layerIdx := SpriteAddLayer(testSprite, testBitmap, 'layer2');
    AssertEquals(100, SpriteLayerWidth(testSprite, layerIdx));
end;
procedure TestSpriteLocationMatrixIntegration;
begin
    testBitmap := CreateBitmap('test_bitmap', 100, 100);
    CleanupBitmap := TBitmapCleanup.Create;
    testSprite := CreateSprite('test_sprite', testBitmap);
    CleanupSprite := TSpriteCleanup.Create;
    SpriteSetPosition(testSprite, PointAt(100.0, 100.0));
    SpriteSetRotation(testSprite, 45);
    matrix := SpriteLocationMatrix(testSprite);
    AssertEquals(150.0, matrix.elements[0, 2]);
    AssertEquals(1.0, matrix.elements[2, 2]);
end;
procedure TestSpriteMassIntegration;
begin
    testBitmap := CreateBitmap('test_bitmap', 100, 100);
    CleanupBitmap := TBitmapCleanup.Create;
    testSprite := CreateSprite('test_sprite', testBitmap);
    CleanupSprite := TSpriteCleanup.Create;
    AssertEquals(1.0, SpriteMass(testSprite));
    SpriteSetMass(testSprite, 10.0);
    AssertEquals(10.0, SpriteMass(testSprite));
end;
procedure TestSpriteMoveFromAnchorPointIntegration;
begin
    testBitmap := CreateBitmap('test_bitmap', 100, 100);
    CleanupBitmap := TBitmapCleanup.Create;
    testSprite := CreateSprite('test_sprite', testBitmap);
    CleanupSprite := TSpriteCleanup.Create;
    AssertFalse(SpriteMoveFromAnchorPoint(testSprite));
    SpriteSetMoveFromAnchorPoint(testSprite, true);
    AssertTrue(SpriteMoveFromAnchorPoint(testSprite));
end;
procedure TestSpriteMoveToTakingSecondsIntegration;
begin
    testBitmap := CreateBitmap('test_bitmap', 100, 100);
    CleanupBitmap := TBitmapCleanup.Create;
    testSprite := CreateSprite('test_sprite', testBitmap);
    CleanupSprite := TSpriteCleanup.Create;
    SpriteSetPosition(testSprite, PointAt(100.0, 100.0));
    SpriteMoveTo(testSprite, PointAt(200.0, 200.0), 1.0);
    for i := 0 to 4 do
        UpdateSprite(testSprite);
        Delay(300);
    end;
    spriteCenter := CenterPoint(testSprite);
    AssertTrue(Abs(200.0 - spriteCenter.x) <= 2.0);
    AssertTrue(Abs(200.0 - spriteCenter.y) <= 2.0);
end;
procedure TestSpriteNameIntegration;
begin
    testBitmap := CreateBitmap('test_bitmap', 100, 100);
    CleanupBitmap := TBitmapCleanup.Create;
    testSprite := CreateSprite('test_sprite', testBitmap);
    CleanupSprite := TSpriteCleanup.Create;
    AssertEquals('test_sprite', SpriteName(testSprite));
end;
procedure TestSpriteNamedIntegration;
begin
    testBitmap := CreateBitmap('test_bitmap', 100, 100);
    CleanupBitmap := TBitmapCleanup.Create;
    testSprite := CreateSprite('test_sprite', testBitmap);
    CleanupSprite := TSpriteCleanup.Create;
    AssertEquals(testSprite, SpriteNamed('test_sprite'));
    AssertNull(SpriteNamed('non_existent_sprite'));
end;
procedure TestSpriteOffscreenIntegration;
begin
    testWindow := OpenWindow('Test Window', 800, 600);
    CleanupWindow := TWindowCleanup.Create;
    testBitmap := CreateBitmap('test_bitmap', 100, 100);
    CleanupBitmap := TBitmapCleanup.Create;
    testSprite := CreateSprite('test_sprite', testBitmap);
    CleanupSprite := TSpriteCleanup.Create;
    SpriteSetPosition(testSprite, PointAt(400.0, 300.0));
    AssertFalse(SpriteOffscreen(testSprite));
    SpriteSetPosition(testSprite, PointAt(-200.0, -200.0));
    AssertTrue(SpriteOffscreen(testSprite));
end;
procedure TestSpriteOnScreenAtPointIntegration;
begin
    testWindow := OpenWindow('Test Window', 800, 600);
    CleanupWindow := TWindowCleanup.Create;
    testBitmap := CreateBitmap('test_bitmap', 100, 100);
    CleanupBitmap := TBitmapCleanup.Create;
    ClearBitmap(testBitmap, ColorRed());
    SetupCollisionMask(testBitmap);
    testSprite := CreateSprite('test_sprite', testBitmap);
    CleanupSprite := TSpriteCleanup.Create;
    SpriteSetPosition(testSprite, PointAt(400.0, 300.0));
    DrawSprite(testSprite);
    RefreshScreen();
    AssertTrue(SpriteOnScreenAt(testSprite, PointAt(451.0, 350.0)));
    AssertFalse(SpriteOnScreenAt(testSprite, PointAt(0.0, 0.0)));
end;
procedure TestSpriteOnScreenAtIntegration;
begin
    testWindow := OpenWindow('Test Window', 800, 600);
    CleanupWindow := TWindowCleanup.Create;
    testBitmap := CreateBitmap('test_bitmap', 100, 100);
    CleanupBitmap := TBitmapCleanup.Create;
    ClearBitmap(testBitmap, ColorRed());
    SetupCollisionMask(testBitmap);
    testSprite := CreateSprite('test_sprite', testBitmap);
    CleanupSprite := TSpriteCleanup.Create;
    SpriteSetPosition(testSprite, PointAt(400.0, 300.0));
    DrawSprite(testSprite);
    RefreshScreen();
    AssertTrue(SpriteOnScreenAt(testSprite, 451.0, 350.0));
    AssertFalse(SpriteOnScreenAt(testSprite, 0.0, 0.0));
end;
procedure TestSpritePositionIntegration;
begin
    testBitmap := CreateBitmap('test_bitmap', 100, 100);
    CleanupBitmap := TBitmapCleanup.Create;
    testSprite := CreateSprite('test_sprite', testBitmap);
    CleanupSprite := TSpriteCleanup.Create;
    AssertEquals(PointAt(0.0, 0.0), SpritePosition(testSprite));
    SpriteSetPosition(testSprite, PointAt(400.0, 300.0));
    AssertEquals(PointAt(400.0, 300.0), SpritePosition(testSprite));
end;
procedure TestSpriteReplayAnimationIntegration;
begin
    testBitmap := CreateBitmap('test_bitmap', 100, 100);
    CleanupBitmap := TBitmapCleanup.Create;
    testAnimation := LoadAnimationScript('test_animation', 'kermit.txt');
    CleanupAnimationScript := TAnimationScriptCleanup.Create;
    testSprite := CreateSprite(testBitmap, testAnimation);
    CleanupSprite := TSpriteCleanup.Create;
    SpriteStartAnimation(testSprite, 'walkfront');
    AssertFalse(SpriteAnimationHasEnded(testSprite));
    for i := 0 to 4 do
        UpdateSprite(testSprite, 100.0);
    end;
    AssertTrue(SpriteAnimationHasEnded(testSprite));
    SpriteReplayAnimation(testSprite);
    AssertFalse(SpriteAnimationHasEnded(testSprite));
end;
procedure TestSpriteReplayAnimationWithSoundIntegration;
begin
    testBitmap := CreateBitmap('test_bitmap', 100, 100);
    CleanupBitmap := TBitmapCleanup.Create;
    testAnimation := LoadAnimationScript('test_animation', 'startup.txt');
    CleanupAnimationScript := TAnimationScriptCleanup.Create;
    testSprite := CreateSprite(testBitmap, testAnimation);
    CleanupSprite := TSpriteCleanup.Create;
    SpriteStartAnimation(testSprite, 'splash');
    AssertFalse(SpriteAnimationHasEnded(testSprite));
    for i := 0 to 99 do
        UpdateSpriteAnimation(testSprite, 100.0);
    end;
    AssertTrue(SpriteAnimationHasEnded(testSprite));
    SpriteReplayAnimation(testSprite, true);
    AssertTrue(SoundEffectPlaying('SwinGameStart'));
    AssertFalse(SpriteAnimationHasEnded(testSprite));
end;
procedure TestSpriteRotationIntegration;
begin
    testBitmap := CreateBitmap('test_bitmap', 100, 100);
    CleanupBitmap := TBitmapCleanup.Create;
    testSprite := CreateSprite('test_sprite', testBitmap);
    CleanupSprite := TSpriteCleanup.Create;
    AssertEquals(0.0, SpriteRotation(testSprite));
    SpriteSetRotation(testSprite, 45.0);
    AssertEquals(45.0, SpriteRotation(testSprite));
end;
procedure TestSpriteScaleIntegration;
begin
    testBitmap := CreateBitmap('test_bitmap', 100, 100);
    CleanupBitmap := TBitmapCleanup.Create;
    testSprite := CreateSprite('test_sprite', testBitmap);
    CleanupSprite := TSpriteCleanup.Create;
    AssertEquals(1.0, SpriteScale(testSprite));
    SpriteSetScale(testSprite, 2.0);
    AssertEquals(2.0, SpriteScale(testSprite));
end;
procedure TestSpriteScreenRectangleIntegration;
begin
    testWindow := OpenWindow('Test Window', 800, 600);
    CleanupWindow := TWindowCleanup.Create;
    testBitmap := CreateBitmap('test_bitmap', 100, 100);
    CleanupBitmap := TBitmapCleanup.Create;
    testAnimation := LoadAnimationScript('test_animation', 'kermit.txt');
    CleanupAnimationScript := TAnimationScriptCleanup.Create;
    ClearBitmap(testBitmap, ColorWhite());
    testSprite := CreateSprite(testBitmap, testAnimation);
    CleanupSprite := TSpriteCleanup.Create;
    SpriteStartAnimation(testSprite, 'walkfront');
    SpriteSetPosition(testSprite, PointAt(0.0, 0.0));
    rect := SpriteScreenRectangle(testSprite);
    AssertEquals(0.0, rect.x);
    AssertEquals(0.0, rect.y);
    AssertEquals(100.0, rect.width);
    AssertEquals(100.0, rect.height);
end;
procedure TestSpriteSendLayerBackwardIntegration;
begin
    testBitmap := CreateBitmap('test_bitmap', 100, 100);
    CleanupBitmap := TBitmapCleanup.Create;
    testSprite := CreateSprite('test_sprite', testBitmap);
    CleanupSprite := TSpriteCleanup.Create;
    layer1 := SpriteAddLayer(testSprite, testBitmap, 'layer1');
    SpriteShowLayer(testSprite, layer1);
    layer2 := SpriteAddLayer(testSprite, testBitmap, 'layer2');
    SpriteShowLayer(testSprite, layer2);
    visibleIndex := SpriteVisibleIndexOfLayer(testSprite, layer2);
    SpriteSendLayerBackward(testSprite, visibleIndex);
    AssertEquals(2, SpriteVisibleIndexOfLayer(testSprite, layer2));
end;
procedure TestSpriteSendLayerToBackIntegration;
begin
    testBitmap := CreateBitmap('test_bitmap', 100, 100);
    CleanupBitmap := TBitmapCleanup.Create;
    testSprite := CreateSprite('test_sprite', testBitmap);
    CleanupSprite := TSpriteCleanup.Create;
    layer1 := SpriteAddLayer(testSprite, testBitmap, 'layer1');
    SpriteShowLayer(testSprite, layer1);
    layer2 := SpriteAddLayer(testSprite, testBitmap, 'layer2');
    SpriteShowLayer(testSprite, layer2);
    visibleIndex := SpriteVisibleIndexOfLayer(testSprite, layer2);
    SpriteSendLayerToBack(testSprite, visibleIndex);
    AssertEquals(2, SpriteVisibleIndexOfLayer(testSprite, layer2));
end;
procedure TestSpriteSetAnchorPointIntegration;
begin
    testBitmap := CreateBitmap('test_bitmap', 100, 100);
    CleanupBitmap := TBitmapCleanup.Create;
    testSprite := CreateSprite('test_sprite', testBitmap);
    CleanupSprite := TSpriteCleanup.Create;
    AssertEquals(PointAt(50.0, 50.0), SpriteAnchorPoint(testSprite));
    SpriteSetAnchorPoint(testSprite, PointAt(25.0, 25.0));
    AssertEquals(PointAt(25.0, 25.0), SpriteAnchorPoint(testSprite));
end;
procedure TestSpriteSetCollisionBitmapIntegration;
begin
    testBitmap := CreateBitmap('test_bitmap', 100, 100);
    CleanupBitmap := TBitmapCleanup.Create;
    testSprite := CreateSprite('test_sprite', testBitmap);
    CleanupSprite := TSpriteCleanup.Create;
    AssertEquals(testBitmap, SpriteCollisionBitmap(testSprite));
    newBitmap := CreateBitmap('new_bitmap', 200, 200);
    SpriteSetCollisionBitmap(testSprite, newBitmap);
    AssertEquals(newBitmap, SpriteCollisionBitmap(testSprite));
end;
procedure TestSpriteSetCollisionKindIntegration;
begin
    testBitmap := CreateBitmap('test_bitmap', 100, 100);
    CleanupBitmap := TBitmapCleanup.Create;
    testSprite := CreateSprite('test_sprite', testBitmap);
    CleanupSprite := TSpriteCleanup.Create;
    AssertEquals(CollisionTestKind.PIXEL_COLLISIONS, SpriteCollisionKind(testSprite));
    SpriteSetCollisionKind(testSprite, CollisionTestKind.AABB_COLLISIONS);
    AssertEquals(CollisionTestKind.AABB_COLLISIONS, SpriteCollisionKind(testSprite));
end;
procedure TestSpriteSetDxIntegration;
begin
    testBitmap := CreateBitmap('test_bitmap', 100, 100);
    CleanupBitmap := TBitmapCleanup.Create;
    testSprite := CreateSprite('test_sprite', testBitmap);
    CleanupSprite := TSpriteCleanup.Create;
    AssertEquals(0.0, SpriteDx(testSprite));
    SpriteSetDx(testSprite, 5.0);
    AssertEquals(5.0, SpriteDx(testSprite));
end;
procedure TestSpriteSetDyIntegration;
begin
    testBitmap := CreateBitmap('test_bitmap', 100, 100);
    CleanupBitmap := TBitmapCleanup.Create;
    testSprite := CreateSprite('test_sprite', testBitmap);
    CleanupSprite := TSpriteCleanup.Create;
    AssertEquals(0.0, SpriteDy(testSprite));
    SpriteSetDy(testSprite, 5.0);
    AssertEquals(5.0, SpriteDy(testSprite));
end;
procedure TestSpriteSetHeadingIntegration;
begin
    testBitmap := CreateBitmap('test_bitmap', 100, 100);
    CleanupBitmap := TBitmapCleanup.Create;
    testSprite := CreateSprite('test_sprite', testBitmap);
    CleanupSprite := TSpriteCleanup.Create;
    SpriteSetVelocity(testSprite, VectorFromAngle(90.0, 1.0));
    AssertEquals(90.0, SpriteHeading(testSprite));
    SpriteSetHeading(testSprite, 45.0);
    AssertEquals(45.0, SpriteHeading(testSprite));
end;
procedure TestSpriteSetLayerOffsetNamedIntegration;
begin
    testBitmap := CreateBitmap('test_bitmap', 100, 100);
    CleanupBitmap := TBitmapCleanup.Create;
    testSprite := CreateSprite('test_sprite', testBitmap);
    CleanupSprite := TSpriteCleanup.Create;
    AssertEquals(VectorTo(0.0, 0.0), SpriteLayerOffset(testSprite, 'base_layer'));
    SpriteSetLayerOffset(testSprite, 'base_layer', VectorTo(10.0, 10.0));
    AssertEquals(VectorTo(10.0, 10.0), SpriteLayerOffset(testSprite, 'base_layer'));
end;
procedure TestSpriteSetLayerOffsetAtIndexIntegration;
begin
    testBitmap := CreateBitmap('test_bitmap', 100, 100);
    CleanupBitmap := TBitmapCleanup.Create;
    testSprite := CreateSprite('test_sprite', testBitmap);
    CleanupSprite := TSpriteCleanup.Create;
    AssertEquals(VectorTo(0.0, 0.0), SpriteLayerOffset(testSprite, 0));
    SpriteSetLayerOffset(testSprite, 0, VectorTo(10.0, 10.0));
    AssertEquals(VectorTo(10.0, 10.0), SpriteLayerOffset(testSprite, 0));
end;
procedure TestSpriteSetMassIntegration;
begin
    testBitmap := CreateBitmap('test_bitmap', 100, 100);
    CleanupBitmap := TBitmapCleanup.Create;
    testSprite := CreateSprite('test_sprite', testBitmap);
    CleanupSprite := TSpriteCleanup.Create;
    AssertEquals(1.0, SpriteMass(testSprite));
    SpriteSetMass(testSprite, 10.0);
    AssertEquals(10.0, SpriteMass(testSprite));
end;
procedure TestSpriteSetMoveFromAnchorPointIntegration;
begin
    testBitmap := CreateBitmap('test_bitmap', 100, 100);
    CleanupBitmap := TBitmapCleanup.Create;
    testSprite := CreateSprite('test_sprite', testBitmap);
    CleanupSprite := TSpriteCleanup.Create;
    AssertFalse(SpriteMoveFromAnchorPoint(testSprite));
    SpriteSetMoveFromAnchorPoint(testSprite, true);
    AssertTrue(SpriteMoveFromAnchorPoint(testSprite));
end;
procedure TestSpriteSetPositionIntegration;
begin
    testBitmap := CreateBitmap('test_bitmap', 100, 100);
    CleanupBitmap := TBitmapCleanup.Create;
    testSprite := CreateSprite('test_sprite', testBitmap);
    CleanupSprite := TSpriteCleanup.Create;
    AssertEquals(PointAt(0.0, 0.0), SpritePosition(testSprite));
    SpriteSetPosition(testSprite, PointAt(100.0, 100.0));
    AssertEquals(PointAt(100.0, 100.0), SpritePosition(testSprite));
end;
procedure TestSpriteSetRotationIntegration;
begin
    testBitmap := CreateBitmap('test_bitmap', 100, 100);
    CleanupBitmap := TBitmapCleanup.Create;
    testSprite := CreateSprite('test_sprite', testBitmap);
    CleanupSprite := TSpriteCleanup.Create;
    AssertEquals(0.0, SpriteRotation(testSprite));
    SpriteSetRotation(testSprite, 45.0);
    AssertEquals(45.0, SpriteRotation(testSprite));
end;
procedure TestSpriteSetScaleIntegration;
begin
    testBitmap := CreateBitmap('test_bitmap', 100, 100);
    CleanupBitmap := TBitmapCleanup.Create;
    testSprite := CreateSprite('test_sprite', testBitmap);
    CleanupSprite := TSpriteCleanup.Create;
    AssertEquals(1.0, SpriteScale(testSprite));
    SpriteSetScale(testSprite, 2.0);
    AssertEquals(2.0, SpriteScale(testSprite));
end;
procedure TestSpriteSetSpeedIntegration;
begin
    testBitmap := CreateBitmap('test_bitmap', 100, 100);
    CleanupBitmap := TBitmapCleanup.Create;
    testSprite := CreateSprite('test_sprite', testBitmap);
    CleanupSprite := TSpriteCleanup.Create;
    SpriteSetVelocity(testSprite, VectorFromAngle(0.0, 1.0));
    SpriteSetSpeed(testSprite, 5.0);
    AssertEquals(5.0, SpriteSpeed(testSprite));
end;
procedure TestSpriteSetValueNamedIntegration;
begin
    testBitmap := CreateBitmap('test_bitmap', 100, 100);
    CleanupBitmap := TBitmapCleanup.Create;
    testSprite := CreateSprite('test_sprite', testBitmap);
    CleanupSprite := TSpriteCleanup.Create;
    AssertFalse(SpriteHasValue(testSprite, 'test_value'));
    SpriteAddValue(testSprite, 'test_value', 0.0);
    SpriteSetValue(testSprite, 'test_value', 10.5);
    AssertEquals(10.5, SpriteValue(testSprite, 'test_value'));
end;
procedure TestSpriteSetVelocityIntegration;
begin
    testBitmap := CreateBitmap('test_bitmap', 100, 100);
    CleanupBitmap := TBitmapCleanup.Create;
    testSprite := CreateSprite('test_sprite', testBitmap);
    CleanupSprite := TSpriteCleanup.Create;
    AssertEquals(VectorTo(0.0, 0.0), SpriteVelocity(testSprite));
    SpriteSetVelocity(testSprite, VectorTo(5.0, 5.0));
    AssertEquals(VectorTo(5.0, 5.0), SpriteVelocity(testSprite));
end;
procedure TestSpriteSetXIntegration;
begin
    testBitmap := CreateBitmap('test_bitmap', 100, 100);
    CleanupBitmap := TBitmapCleanup.Create;
    testSprite := CreateSprite('test_sprite', testBitmap);
    CleanupSprite := TSpriteCleanup.Create;
    AssertEquals(0.0, SpriteX(testSprite));
    SpriteSetX(testSprite, 150.0);
    AssertEquals(150.0, SpriteX(testSprite));
end;
procedure TestSpriteSetYIntegration;
begin
    testBitmap := CreateBitmap('test_bitmap', 100, 100);
    CleanupBitmap := TBitmapCleanup.Create;
    testSprite := CreateSprite('test_sprite', testBitmap);
    CleanupSprite := TSpriteCleanup.Create;
    AssertEquals(0.0, SpriteY(testSprite));
    SpriteSetY(testSprite, 300.0);
    AssertEquals(300.0, SpriteY(testSprite));
end;
procedure TestSpriteShowLayerNamedIntegration;
begin
    testBitmap := CreateBitmap('test_bitmap', 100, 100);
    CleanupBitmap := TBitmapCleanup.Create;
    testSprite := CreateSprite('test_sprite', testBitmap);
    CleanupSprite := TSpriteCleanup.Create;
    layerIdx := SpriteAddLayer(testSprite, testBitmap, 'layer2');
    SpriteHideLayer(testSprite, 'layer2');
    AssertEquals(1, SpriteVisibleLayerCount(testSprite));
    AssertEquals(layerIdx, SpriteShowLayer(testSprite, 'layer2'));
    AssertEquals(2, SpriteVisibleLayerCount(testSprite));
end;
procedure TestSpriteShowLayerIntegration;
begin
    testBitmap := CreateBitmap('test_bitmap', 100, 100);
    CleanupBitmap := TBitmapCleanup.Create;
    testSprite := CreateSprite('test_sprite', testBitmap);
    CleanupSprite := TSpriteCleanup.Create;
    layerIdx := SpriteAddLayer(testSprite, testBitmap, 'layer2');
    SpriteHideLayer(testSprite, layerIdx);
    AssertEquals(1, SpriteVisibleLayerCount(testSprite));
    AssertEquals(layerIdx, SpriteShowLayer(testSprite, layerIdx));
    AssertEquals(2, SpriteVisibleLayerCount(testSprite));
end;
procedure TestSpriteSpeedIntegration;
begin
    testBitmap := CreateBitmap('test_bitmap', 100, 100);
    CleanupBitmap := TBitmapCleanup.Create;
    testSprite := CreateSprite('test_sprite', testBitmap);
    CleanupSprite := TSpriteCleanup.Create;
    AssertEquals(0.0, SpriteSpeed(testSprite));
    SpriteSetVelocity(testSprite, VectorTo(3.0, 4.0));
    AssertEquals(5.0, SpriteSpeed(testSprite));
end;
procedure TestSpriteStartAnimationNamedIntegration;
begin
    testBitmap := CreateBitmap('test_bitmap', 100, 100);
    CleanupBitmap := TBitmapCleanup.Create;
    testAnimation := LoadAnimationScript('test_animation', 'kermit.txt');
    CleanupAnimationScript := TAnimationScriptCleanup.Create;
    testSprite := CreateSprite(testBitmap, testAnimation);
    CleanupSprite := TSpriteCleanup.Create;
    SpriteStartAnimation(testSprite, 'walkfront');
    AssertFalse(SpriteAnimationHasEnded(testSprite));
    for i := 0 to 4 do
        UpdateSpriteAnimation(testSprite, 100.0);
    end;
    AssertTrue(SpriteAnimationHasEnded(testSprite));
    AssertEquals('walkfront', SpriteAnimationName(testSprite));
end;
procedure TestSpriteStartAnimationNamedWithSoundIntegration;
begin
    testBitmap := CreateBitmap('test_bitmap', 100, 100);
    CleanupBitmap := TBitmapCleanup.Create;
    testAnimation := LoadAnimationScript('test_animation', 'startup.txt');
    CleanupAnimationScript := TAnimationScriptCleanup.Create;
    testSprite := CreateSprite(testBitmap, testAnimation);
    CleanupSprite := TSpriteCleanup.Create;
    SpriteStartAnimation(testSprite, 'splash', true);
    AssertFalse(SpriteAnimationHasEnded(testSprite));
    AssertTrue(SoundEffectPlaying('SwinGameStart'));
    for i := 0 to 99 do
        UpdateSpriteAnimation(testSprite, 100.0);
    end;
    AssertTrue(SpriteAnimationHasEnded(testSprite));
    AssertEquals('splash', SpriteAnimationName(testSprite));
end;
procedure TestSpriteStartAnimationIntegration;
begin
    testBitmap := CreateBitmap('test_bitmap', 100, 100);
    CleanupBitmap := TBitmapCleanup.Create;
    testAnimation := LoadAnimationScript('test_animation', 'kermit.txt');
    CleanupAnimationScript := TAnimationScriptCleanup.Create;
    testSprite := CreateSprite(testBitmap, testAnimation);
    CleanupSprite := TSpriteCleanup.Create;
    SpriteStartAnimation(testSprite, 0);
    AssertFalse(SpriteAnimationHasEnded(testSprite));
    for i := 0 to 4 do
        UpdateSpriteAnimation(testSprite, 100.0);
    end;
    AssertTrue(SpriteAnimationHasEnded(testSprite));
end;
procedure TestSpriteStartAnimationWithSoundIntegration;
begin
    testBitmap := CreateBitmap('test_bitmap', 100, 100);
    CleanupBitmap := TBitmapCleanup.Create;
    testAnimation := LoadAnimationScript('test_animation', 'startup.txt');
    CleanupAnimationScript := TAnimationScriptCleanup.Create;
    testSprite := CreateSprite(testBitmap, testAnimation);
    CleanupSprite := TSpriteCleanup.Create;
    SpriteStartAnimation(testSprite, 0, true);
    AssertFalse(SpriteAnimationHasEnded(testSprite));
    AssertTrue(SoundEffectPlaying('SwinGameStart'));
    for i := 0 to 99 do
        UpdateSpriteAnimation(testSprite, 100.0, true);
    end;
    AssertTrue(SpriteAnimationHasEnded(testSprite));
end;
procedure TestSpriteStopCallingOnEventIntegration;
begin
    spriteDelegates := SpriteDelegates.Create();
    testBitmap := CreateBitmap('test_bitmap', 100, 100);
    CleanupBitmap := TBitmapCleanup.Create;
    testSprite := CreateSprite('test_sprite', testBitmap);
    CleanupSprite := TSpriteCleanup.Create;
    SpriteCallOnEvent(testSprite, spriteDelegates.sprite_event_handler);
    UpdateSprite(testSprite);
    AssertTrue(spriteDelegates.event_called);
    SpriteStopCallingOnEvent(testSprite, spriteDelegates.sprite_event_handler);
    spriteDelegates.reset;
    UpdateSprite(testSprite);
    AssertFalse(spriteDelegates.event_called);
end;
procedure TestSpriteToggleLayerVisibleNamedIntegration;
begin
    testBitmap := CreateBitmap('test_bitmap', 100, 100);
    CleanupBitmap := TBitmapCleanup.Create;
    testSprite := CreateSprite('test_sprite', testBitmap);
    CleanupSprite := TSpriteCleanup.Create;
    SpriteAddLayer(testSprite, testBitmap, 'layer2');
    SpriteShowLayer(testSprite, 'layer2');
    AssertEquals(2, SpriteVisibleLayerCount(testSprite));
    SpriteToggleLayerVisible(testSprite, 'layer2');
    AssertEquals(1, SpriteVisibleLayerCount(testSprite));
    SpriteToggleLayerVisible(testSprite, 'layer2');
    AssertEquals(2, SpriteVisibleLayerCount(testSprite));
end;
procedure TestSpriteToggleLayerVisibleIntegration;
begin
    testBitmap := CreateBitmap('test_bitmap', 100, 100);
    CleanupBitmap := TBitmapCleanup.Create;
    testSprite := CreateSprite('test_sprite', testBitmap);
    CleanupSprite := TSpriteCleanup.Create;
    layerIdx := SpriteAddLayer(testSprite, testBitmap, 'layer2');
    SpriteShowLayer(testSprite, layerIdx);
    AssertEquals(2, SpriteVisibleLayerCount(testSprite));
    SpriteToggleLayerVisible(testSprite, layerIdx);
    AssertEquals(1, SpriteVisibleLayerCount(testSprite));
end;
procedure TestSpriteValueIntegration;
begin
    testBitmap := CreateBitmap('test_bitmap', 100, 100);
    CleanupBitmap := TBitmapCleanup.Create;
    testSprite := CreateSprite('test_sprite', testBitmap);
    CleanupSprite := TSpriteCleanup.Create;
    AssertEquals(3, SpriteValueCount(testSprite));
    SpriteAddValue(testSprite, 'test_value', 0.0);
    AssertEquals(0.0, SpriteValue(testSprite, 'test_value'));
end;
procedure TestSpriteValueCountIntegration;
begin
    testBitmap := CreateBitmap('test_bitmap', 100, 100);
    CleanupBitmap := TBitmapCleanup.Create;
    testSprite := CreateSprite('test_sprite', testBitmap);
    CleanupSprite := TSpriteCleanup.Create;
    AssertEquals(3, SpriteValueCount(testSprite));
    SpriteAddValue(testSprite, 'health', 0.0);
    SpriteAddValue(testSprite, 'speed', 0.0);
    AssertEquals(5, SpriteValueCount(testSprite));
end;
procedure TestSpriteVelocityIntegration;
begin
    testBitmap := CreateBitmap('test_bitmap', 100, 100);
    CleanupBitmap := TBitmapCleanup.Create;
    testSprite := CreateSprite('test_sprite', testBitmap);
    CleanupSprite := TSpriteCleanup.Create;
    AssertEquals(VectorTo(0.0, 0.0), SpriteVelocity(testSprite));
    SpriteSetVelocity(testSprite, VectorTo(5.0, 5.0));
    AssertEquals(VectorTo(5.0, 5.0), SpriteVelocity(testSprite));
end;
procedure TestSpriteVisibleIndexOfLayerNamedIntegration;
begin
    testBitmap := CreateBitmap('test_bitmap', 100, 100);
    CleanupBitmap := TBitmapCleanup.Create;
    testSprite := CreateSprite('test_sprite', testBitmap);
    CleanupSprite := TSpriteCleanup.Create;
    AssertEquals(0, SpriteVisibleIndexOfLayer(testSprite, 'base_layer'));
    SpriteAddLayer(testSprite, testBitmap, 'layer2');
    SpriteShowLayer(testSprite, 'layer2');
    AssertEquals(1, SpriteVisibleIndexOfLayer(testSprite, 'layer2'));
end;
procedure TestSpriteVisibleIndexOfLayerIntegration;
begin
    testBitmap := CreateBitmap('test_bitmap', 100, 100);
    CleanupBitmap := TBitmapCleanup.Create;
    testSprite := CreateSprite('test_sprite', testBitmap);
    CleanupSprite := TSpriteCleanup.Create;
    AssertEquals(0, SpriteVisibleIndexOfLayer(testSprite, 0));
    layerIdx := SpriteAddLayer(testSprite, testBitmap, 'layer2');
    SpriteShowLayer(testSprite, layerIdx);
    AssertEquals(1, SpriteVisibleIndexOfLayer(testSprite, layerIdx));
end;
procedure TestSpriteVisibleLayerIntegration;
begin
    testBitmap := CreateBitmap('test_bitmap', 100, 100);
    CleanupBitmap := TBitmapCleanup.Create;
    testSprite := CreateSprite('test_sprite', testBitmap);
    CleanupSprite := TSpriteCleanup.Create;
    AssertEquals(0, SpriteVisibleLayer(testSprite, 0));
    SpriteAddLayer(testSprite, testBitmap, 'layer2');
    SpriteShowLayer(testSprite, 'layer2');
    AssertEquals(1, SpriteVisibleLayer(testSprite, 1));
end;
procedure TestSpriteVisibleLayerCountIntegration;
begin
    testBitmap := CreateBitmap('test_bitmap', 100, 100);
    CleanupBitmap := TBitmapCleanup.Create;
    testSprite := CreateSprite('test_sprite', testBitmap);
    CleanupSprite := TSpriteCleanup.Create;
    AssertEquals(1, SpriteVisibleLayerCount(testSprite));
    SpriteAddLayer(testSprite, testBitmap, 'layer2');
    SpriteShowLayer(testSprite, 'layer2');
    AssertEquals(2, SpriteVisibleLayerCount(testSprite));
    SpriteHideLayer(testSprite, 'layer2');
    AssertEquals(1, SpriteVisibleLayerCount(testSprite));
end;
procedure TestSpriteVisibleLayerIdIntegration;
begin
    testBitmap := CreateBitmap('test_bitmap', 100, 100);
    CleanupBitmap := TBitmapCleanup.Create;
    testSprite := CreateSprite('test_sprite', testBitmap);
    CleanupSprite := TSpriteCleanup.Create;
    AssertEquals(0, SpriteVisibleLayerId(testSprite, 0));
    SpriteAddLayer(testSprite, testBitmap, 'layer2');
    SpriteShowLayer(testSprite, 'layer2');
    AssertEquals(1, SpriteVisibleLayerId(testSprite, 1));
end;
procedure TestSpriteWidthIntegration;
begin
    testBitmap := CreateBitmap('test_bitmap', 100, 100);
    CleanupBitmap := TBitmapCleanup.Create;
    testSprite := CreateSprite('test_sprite', testBitmap);
    CleanupSprite := TSpriteCleanup.Create;
    AssertEquals(1.0, SpriteScale(testSprite));
    SpriteSetScale(testSprite, 2.0);
    AssertEquals(2.0, SpriteScale(testSprite));
end;
procedure TestSpriteXIntegration;
begin
    testBitmap := CreateBitmap('test_bitmap', 100, 100);
    CleanupBitmap := TBitmapCleanup.Create;
    testSprite := CreateSprite('test_sprite', testBitmap);
    CleanupSprite := TSpriteCleanup.Create;
    AssertEquals(0.0, SpriteX(testSprite));
    SpriteSetX(testSprite, 150.0);
    AssertEquals(150.0, SpriteX(testSprite));
end;
procedure TestSpriteYIntegration;
begin
    testBitmap := CreateBitmap('test_bitmap', 100, 100);
    CleanupBitmap := TBitmapCleanup.Create;
    testSprite := CreateSprite('test_sprite', testBitmap);
    CleanupSprite := TSpriteCleanup.Create;
    AssertEquals(0.0, SpriteY(testSprite));
    SpriteSetY(testSprite, 200.0);
    AssertEquals(200.0, SpriteY(testSprite));
end;
procedure TestStopCallingOnSpriteEventIntegration;
begin
    spriteDelegates := SpriteDelegates.Create();
    testBitmap := CreateBitmap('test_bitmap', 100, 100);
    CleanupBitmap := TBitmapCleanup.Create;
    testSprite := CreateSprite('test_sprite', testBitmap);
    CleanupSprite := TSpriteCleanup.Create;
    CallOnSpriteEvent(spriteDelegates.sprite_event_handler);
    UpdateSprite(testSprite);
    AssertTrue(spriteDelegates.event_called);
    StopCallingOnSpriteEvent(spriteDelegates.sprite_event_handler);
    spriteDelegates.reset;
    UpdateSprite(testSprite);
    AssertFalse(spriteDelegates.event_called);
end;
procedure TestUpdateAllSpritesIntegration;
begin
    testBitmap := CreateBitmap('test_bitmap', 100, 100);
    CleanupBitmap := TBitmapCleanup.Create;
    testSprite1 := CreateSprite('test_sprite1', testBitmap);
    CleanupSprite := TSpriteCleanup.Create;
    testSprite2 := CreateSprite('test_sprite2', testBitmap);
    SpriteSetVelocity(testSprite1, VectorTo(10.0, 10.0));
    SpriteSetVelocity(testSprite2, VectorTo(-10.0, -10.0));
    UpdateAllSprites();
    AssertEquals(VectorTo(10.0, 10.0), SpriteVelocity(testSprite1));
    AssertEquals(VectorTo(-10.0, -10.0), SpriteVelocity(testSprite2));
end;
procedure TestUpdateAllSpritesPercentIntegration;
begin
    testBitmap := CreateBitmap('test_bitmap', 100, 100);
    CleanupBitmap := TBitmapCleanup.Create;
    testSprite1 := CreateSprite('test_sprite1', testBitmap);
    CleanupSprite := TSpriteCleanup.Create;
    testSprite2 := CreateSprite('test_sprite2', testBitmap);
    SpriteSetVelocity(testSprite1, VectorTo(100.0, 100.0));
    SpriteSetVelocity(testSprite2, VectorTo(-100.0, -100.0));
    UpdateAllSprites(0.5);
    AssertEquals(50.0, SpriteX(testSprite1));
    AssertEquals(50.0, SpriteY(testSprite1));
    AssertEquals(-50.0, SpriteX(testSprite2));
    AssertEquals(-50.0, SpriteY(testSprite2));
end;
procedure TestUpdateSpriteIntegration;
begin
    testBitmap := CreateBitmap('test_bitmap', 100, 100);
    CleanupBitmap := TBitmapCleanup.Create;
    testSprite := CreateSprite('test_sprite', testBitmap);
    CleanupSprite := TSpriteCleanup.Create;
    SpriteSetVelocity(testSprite, VectorTo(10.0, 10.0));
    initialPos := SpritePosition(testSprite);
    UpdateSprite(testSprite);
    AssertNotEquals(initialPos, SpritePosition(testSprite));
end;
procedure TestUpdateSpriteWithSoundIntegration;
begin
    testBitmap := CreateBitmap('test_bitmap', 100, 100);
    CleanupBitmap := TBitmapCleanup.Create;
    testAnimation := LoadAnimationScript('test_animation', 'startup.txt');
    CleanupAnimationScript := TAnimationScriptCleanup.Create;
    testSprite := CreateSprite(testBitmap, testAnimation);
    CleanupSprite := TSpriteCleanup.Create;
    SpriteStartAnimation(testSprite, 'splash', true);
    UpdateSprite(testSprite, true);
    AssertTrue(SoundEffectPlaying('SwinGameStart'));
    StopSoundEffect('SwinGameStart');
    UpdateSprite(testSprite, false);
    AssertFalse(SoundEffectPlaying('SwinGameStart'));
end;
procedure TestUpdateSpritePercentIntegration;
begin
    testBitmap := CreateBitmap('test_bitmap', 100, 100);
    CleanupBitmap := TBitmapCleanup.Create;
    testSprite := CreateSprite('test_sprite', testBitmap);
    CleanupSprite := TSpriteCleanup.Create;
    SpriteSetVelocity(testSprite, VectorTo(100.0, 100.0));
    UpdateSprite(testSprite, 0.5);
    AssertEquals(50.0, SpriteX(testSprite));
    AssertEquals(50.0, SpriteY(testSprite));
end;
procedure TestUpdateSpritePercentWithSoundIntegration;
begin
    testAnimation := LoadAnimationScript('startup', 'startup.txt');
    CleanupAnimationScript := TAnimationScriptCleanup.Create;
    testBitmap := CreateBitmap('test_bitmap', 100, 100);
    CleanupBitmap := TBitmapCleanup.Create;
    testSprite := CreateSprite(testBitmap, testAnimation);
    CleanupSprite := TSpriteCleanup.Create;
    SpriteStartAnimation(testSprite, 'splash', true);
    UpdateSprite(testSprite, 0.5, true);
    AssertTrue(SoundEffectPlaying('SwinGameStart'));
    StopSoundEffect('SwinGameStart');
    UpdateSprite(testSprite, 0.5, false);
    AssertFalse(SoundEffectPlaying('SwinGameStart'));
end;
procedure TestUpdateSpriteAnimationIntegration;
begin
    testBitmap := CreateBitmap('test_bitmap', 100, 100);
    CleanupBitmap := TBitmapCleanup.Create;
    testAnimation := LoadAnimationScript('test_animation', 'kermit.txt');
    CleanupAnimationScript := TAnimationScriptCleanup.Create;
    testSprite := CreateSprite('test_sprite', testBitmap, testAnimation);
    CleanupSprite := TSpriteCleanup.Create;
    SpriteStartAnimation(testSprite, 'walkfront');
    AssertFalse(SpriteAnimationHasEnded(testSprite));
    for i := 0 to 49 do
        UpdateSpriteAnimation(testSprite);
    end;
    AssertTrue(SpriteAnimationHasEnded(testSprite));
end;
procedure TestUpdateSpriteAnimationWithSoundIntegration;
begin
    testBitmap := CreateBitmap('test_bitmap', 100, 100);
    CleanupBitmap := TBitmapCleanup.Create;
    testAnimation := LoadAnimationScript('test_animation', 'startup.txt');
    CleanupAnimationScript := TAnimationScriptCleanup.Create;
    testSprite := CreateSprite(testBitmap, testAnimation);
    CleanupSprite := TSpriteCleanup.Create;
    SpriteStartAnimation(testSprite, 'splash');
    UpdateSpriteAnimation(testSprite, true);
    AssertTrue(SoundEffectPlaying('SwinGameStart'));
    StopSoundEffect('SwinGameStart');
    for i := 0 to 99 do
        UpdateSpriteAnimation(testSprite, false);
    end;
    AssertFalse(SoundEffectPlaying('SwinGameStart'));
end;
procedure TestUpdateSpriteAnimationPercentIntegration;
begin
    testBitmap := CreateBitmap('test_bitmap', 100, 100);
    CleanupBitmap := TBitmapCleanup.Create;
    testAnimation := LoadAnimationScript('test_animation', 'startup.txt');
    CleanupAnimationScript := TAnimationScriptCleanup.Create;
    testSprite := CreateSprite(testBitmap, testAnimation);
    CleanupSprite := TSpriteCleanup.Create;
    SpriteStartAnimation(testSprite, 'splash');
    AssertFalse(SpriteAnimationHasEnded(testSprite));
    for i := 0 to 99 do
        UpdateSpriteAnimation(testSprite, 100.0);
    end;
    AssertTrue(SpriteAnimationHasEnded(testSprite));
end;
procedure TestUpdateSpriteAnimationPercentWithSoundIntegration;
begin
    testBitmap := CreateBitmap('test_bitmap', 100, 100);
    CleanupBitmap := TBitmapCleanup.Create;
    testAnimation := LoadAnimationScript('test_animation', 'startup.txt');
    CleanupAnimationScript := TAnimationScriptCleanup.Create;
    testSprite := CreateSprite(testBitmap, testAnimation);
    CleanupSprite := TSpriteCleanup.Create;
    SpriteStartAnimation(testSprite, 'splash');
    AssertFalse(SpriteAnimationHasEnded(testSprite));
    UpdateSpriteAnimation(testSprite, 100.0, true);
    AssertTrue(SoundEffectPlaying('SwinGameStart'));
    StopSoundEffect('SwinGameStart');
    for i := 0 to 99 do
        UpdateSpriteAnimation(testSprite, 100.0, false);
    end;
    AssertFalse(SoundEffectPlaying('SwinGameStart'));
end;
procedure TestVectorFromCenterSpriteToPointPointIntegration;
begin
    testBitmap := CreateBitmap('test_bitmap', 100, 100);
    CleanupBitmap := TBitmapCleanup.Create;
    testSprite := CreateSprite('test_sprite', testBitmap);
    CleanupSprite := TSpriteCleanup.Create;
    SpriteSetPosition(testSprite, PointAt(0.0, 0.0));
    targetPoint := PointAt(150.0, 150.0);
    vector := VectorFromCenterSpriteToPoint(testSprite, targetPoint);
    AssertEquals(100.0, vector.x);
    AssertEquals(100.0, vector.y);
end;
procedure TestVectorFromToIntegration;
begin
    testBitmap := CreateBitmap('test_bitmap', 100, 100);
    CleanupBitmap := TBitmapCleanup.Create;
    testSprite1 := CreateSprite('test_sprite1', testBitmap);
    CleanupSprite := TSpriteCleanup.Create;
    testSprite2 := CreateSprite('test_sprite2', testBitmap);
    SpriteSetPosition(testSprite1, PointAt(0.0, 0.0));
    SpriteSetPosition(testSprite2, PointAt(100.0, 100.0));
    vector := VectorFromTo(testSprite1, testSprite2);
    AssertEquals(100.0, vector.x);
    AssertEquals(100.0, vector.y);
end;
end;

procedure RegisterTests;
begin
    #<Proc:0x00007fbbcab52da8 /mnt/c/Users/Noahc/Documents/aYear_2_semester_2/TeamProject/GitHubRepo/splashkit_test_generator/test_generator/config/languages/pascal_config.rb:138 (lambda)>
end;
