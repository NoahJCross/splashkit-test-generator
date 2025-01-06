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
    testSpriteDelegates := SpriteDelegates.Create();
    testBitmap := CreateBitmap('Test Bitmap 1', 100, 100);
    CleanupBitmap := TBitmapCleanup.Create;
    CreateSprite(testBitmap);
    CleanupSprite := TSpriteCleanup.Create;
    CreateSprite(testBitmap);
    CallForAllSprites(test_sprite_delegates.sprite_float_function, 300.0);
    AssertEquals(2, test_sprite_delegates.float_function_call_count);
    AssertTrue(test_sprite_delegates.event_called);
end;
procedure TestCallForAllSpritesIntegration;
begin
    testSpriteDelegates := SpriteDelegates.Create();
    testBitmap := CreateBitmap('Test Bitmap 2', 100, 100);
    CleanupBitmap := TBitmapCleanup.Create;
    CreateSprite(testBitmap);
    CleanupSprite := TSpriteCleanup.Create;
    CreateSprite(testBitmap);
    CallForAllSprites(test_sprite_delegates.sprite_function);
    AssertEquals(2, test_sprite_delegates.function_call_count);
    AssertTrue(test_sprite_delegates.event_called);
end;
procedure TestCallOnSpriteEventIntegration;
begin
    testSpriteDelegates := SpriteDelegates.Create();
    testBitmap := CreateBitmap('Test Bitmap 34', 100, 100);
    CleanupBitmap := TBitmapCleanup.Create;
    testAnimation := LoadAnimationScript('Test Script 6', 'kermit.txt');
    CleanupAnimationScript := TAnimationScriptCleanup.Create;
    testSprite := CreateSprite(testBitmap, testAnimation);
    CleanupSprite := TSpriteCleanup.Create;
    CallOnSpriteEvent(test_sprite_delegates.sprite_event_handler);
    UpdateSprite(testSprite);
    StopCallingOnSpriteEvent(test_sprite_delegates.sprite_event_handler);
    AssertTrue(test_sprite_delegates.event_called);
end;
procedure TestCenterPointOfSpriteIntegration;
begin
    testBitmap := CreateBitmap('Test Bitmap 3', 100, 100);
    CleanupBitmap := TBitmapCleanup.Create;
    testSprite := CreateSprite(testBitmap);
    CleanupSprite := TSpriteCleanup.Create;
    SpriteSetPosition(testSprite, PointAt(100.0, 100.0));
    testCenterPoint := CenterPoint(testSprite);
    AssertEquals(150.0, testCenterPoint.x);
    AssertEquals(150.0, testCenterPoint.y);
end;
procedure TestCreateSpriteIntegration;
begin
    testBitmap := CreateBitmap('Test Bitmap 4', 100, 100);
    CleanupBitmap := TBitmapCleanup.Create;
    testSprite := CreateSprite(testBitmap);
    CleanupSprite := TSpriteCleanup.Create;
    AssertNotNull(testSprite);
    AssertTrue(HasSprite(SpriteName(testSprite)));
end;
procedure TestCreateSpriteWithAnimationIntegration;
begin
    testBitmap := CreateBitmap('Test Bitmap 5', 100, 100);
    CleanupBitmap := TBitmapCleanup.Create;
    testAnimation := LoadAnimationScript('Test Script 1', 'kermit.txt');
    CleanupAnimationScript := TAnimationScriptCleanup.Create;
    testSprite := CreateSprite(testBitmap, testAnimation);
    CleanupSprite := TSpriteCleanup.Create;
    AssertNotNull(testSprite);
    AssertTrue(HasSprite(SpriteName(testSprite)));
end;
procedure TestCreateSpriteWithBitmapNamedIntegration;
begin
    CreateBitmap('Test Bitmap 6', 100, 100);
    CleanupBitmap := TBitmapCleanup.Create;
    testSprite := CreateSprite('Test Bitmap 6');
    CleanupSprite := TSpriteCleanup.Create;
    AssertNotNull(testSprite);
    AssertTrue(HasSprite(SpriteName(testSprite)));
end;
procedure TestCreateSpriteNamedIntegration;
begin
    testBitmap := CreateBitmap('Test Bitmap 7', 100, 100);
    CleanupBitmap := TBitmapCleanup.Create;
    testSprite := CreateSprite('Test Sprite 1', testBitmap);
    CleanupSprite := TSpriteCleanup.Create;
    AssertNotNull(testSprite);
    AssertEquals('Test Sprite 1', SpriteName(testSprite));
end;
procedure TestCreateSpriteNamedWithAnimationIntegration;
begin
    testBitmap := CreateBitmap('Test Bitmap 8', 100, 100);
    CleanupBitmap := TBitmapCleanup.Create;
    testAnimation := LoadAnimationScript('Test Script 2', 'kermit.txt');
    CleanupAnimationScript := TAnimationScriptCleanup.Create;
    testSprite := CreateSprite('Test Sprite 2', testBitmap, testAnimation);
    CleanupSprite := TSpriteCleanup.Create;
    AssertNotNull(testSprite);
    AssertEquals('Test Sprite 2', SpriteName(testSprite));
end;
procedure TestCreateSpriteWithBitmapAndAnimationNamedIntegration;
begin
    CreateBitmap('Test Bitmap 9', 100, 100);
    CleanupBitmap := TBitmapCleanup.Create;
    LoadAnimationScript('Test Script 3', 'kermit.txt');
    CleanupAnimationScript := TAnimationScriptCleanup.Create;
    testSprite := CreateSprite('Test Bitmap 9', 'test_animation');
    CleanupSprite := TSpriteCleanup.Create;
    AssertNotNull(testSprite);
    AssertTrue(HasSprite(SpriteName(testSprite)));
end;
procedure TestCreateSpritePackIntegration;
begin
    AssertFalse(HasSpritePack('Test Sprite Pack 1'));
    CreateSpritePack('Test Sprite Pack 1');
    CleanupSpritePack := TSpritePackCleanup.Create('Test Sprite Pack 1')
    AssertTrue(HasSpritePack('Test Sprite Pack 1'));
end;
procedure TestCurrentSpritePackIntegration;
begin
    AssertEquals('default', CurrentSpritePack());
    CreateSpritePack('Test Sprite Pack 2');
    CleanupSpritePack := TSpritePackCleanup.Create('Test Sprite Pack 2')
    SelectSpritePack('Test Sprite Pack 2');
    AssertEquals('Test Sprite Pack 2', CurrentSpritePack());
end;
procedure TestDrawAllSpritesIntegration;
begin
    testWindow := OpenWindow('Test Window 1', 800, 600);
    CleanupWindow := TWindowCleanup.Create;
    testBitmap := CreateBitmap('Test Bitmap 10', 100, 100);
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
    testWindow := OpenWindow('Test Window 3', 800, 600);
    CleanupWindow := TWindowCleanup.Create;
    testBitmap := CreateBitmap('Test Bitmap 12', 100, 100);
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
    testWindow := OpenWindow('Test Window 4', 800, 600);
    CleanupWindow := TWindowCleanup.Create;
    testBitmap := CreateBitmap('Test Bitmap 13', 100, 100);
    CleanupBitmap := TBitmapCleanup.Create;
    ClearBitmap(testBitmap, ColorBlack());
    testSprite := CreateSprite(testBitmap);
    CleanupSprite := TSpriteCleanup.Create;
    SpriteSetPosition(testSprite, PointAt(400.0, 300.0));
    ClearScreen(ColorWhite());
    DrawSprite(testSprite);
    RefreshScreen();
    AssertEquals(ColorBlack(), GetPixel(testWindow, 400.0, 300.0));
end;
procedure TestDrawSpriteOffsetXYIntegration;
begin
    testWindow := OpenWindow('Test Window 2', 800, 600);
    CleanupWindow := TWindowCleanup.Create;
    testBitmap := CreateBitmap('Test Bitmap 11', 100, 100);
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
    testBitmap := CreateBitmap('Test Bitmap 14', 100, 100);
    CleanupBitmap := TBitmapCleanup.Create;
    CreateSprite('Test Sprite 3', testBitmap);
    CleanupSprite := TSpriteCleanup.Create;
    CreateSprite('Test Sprite 4', testBitmap);
    AssertTrue(HasSprite('Test Sprite 3'));
    AssertTrue(HasSprite('Test Sprite 4'));
    FreeAllSprites();
    AssertFalse(HasSprite('Test Sprite 3'));
    AssertFalse(HasSprite('Test Sprite 4'));
end;
procedure TestFreeSpriteIntegration;
begin
    testBitmap := CreateBitmap('Test Bitmap 15', 100, 100);
    CleanupBitmap := TBitmapCleanup.Create;
    testSprite := CreateSprite('Test Sprite 5', testBitmap);
    CleanupSprite := TSpriteCleanup.Create;
    AssertTrue(HasSprite('Test Sprite 5'));
    FreeSprite(testSprite);
    AssertFalse(HasSprite('Test Sprite 5'));
end;
procedure TestFreeSpritePackIntegration;
begin
    AssertEquals('default', CurrentSpritePack());
    CreateSpritePack('Test Sprite Pack 3');
    CleanupSpritePack := TSpritePackCleanup.Create('Test Sprite Pack 3')
    SelectSpritePack('Test Sprite Pack 3');
    AssertTrue(HasSpritePack('Test Sprite Pack 3'));
    AssertEquals('Test Sprite Pack 3', CurrentSpritePack());
    FreeSpritePack('Test Sprite Pack 3');
    AssertFalse(HasSpritePack('Test Sprite Pack 3'));
    AssertEquals('default', CurrentSpritePack());
end;
procedure TestHasSpriteIntegration;
begin
    testBitmap := CreateBitmap('Test Bitmap 16', 100, 100);
    CleanupBitmap := TBitmapCleanup.Create;
    AssertFalse(HasSprite('Test Sprite 6'));
    testSprite := CreateSprite('Test Sprite 6', testBitmap);
    CleanupSprite := TSpriteCleanup.Create;
    AssertTrue(HasSprite('Test Sprite 6'));
    FreeSprite(testSprite);
    AssertFalse(HasSprite('Test Sprite 6'));
end;
procedure TestHasSpritePackIntegration;
begin
    AssertFalse(HasSpritePack('Test Sprite Pack 4'));
    CreateSpritePack('Test Sprite Pack 4');
    CleanupSpritePack := TSpritePackCleanup.Create('Test Sprite Pack 4')
    AssertTrue(HasSpritePack('Test Sprite Pack 4'));
    FreeSpritePack('Test Sprite Pack 4');
    AssertFalse(HasSpritePack('Test Sprite Pack 4'));
end;
procedure TestMoveSpriteIntegration;
begin
    testBitmap := CreateBitmap('Test Bitmap 17', 100, 100);
    CleanupBitmap := TBitmapCleanup.Create;
    testSprite := CreateSprite(testBitmap);
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
    testBitmap := CreateBitmap('Test Bitmap 18', 100, 100);
    CleanupBitmap := TBitmapCleanup.Create;
    testSprite := CreateSprite(testBitmap);
    CleanupSprite := TSpriteCleanup.Create;
    SpriteSetPosition(testSprite, PointAt(100.0, 100.0));
    MoveSprite(testSprite, VectorTo(50.0, 50.0));
    AssertEquals(150.0, SpriteX(testSprite));
    AssertEquals(150.0, SpriteY(testSprite));
end;
procedure TestMoveSpriteByVectorPercentIntegration;
begin
    testBitmap := CreateBitmap('Test Bitmap 19', 100, 100);
    CleanupBitmap := TBitmapCleanup.Create;
    testSprite := CreateSprite(testBitmap);
    CleanupSprite := TSpriteCleanup.Create;
    SpriteSetPosition(testSprite, PointAt(100.0, 100.0));
    MoveSprite(testSprite, VectorTo(50.0, 50.0), 0.5);
    AssertEquals(125.0, SpriteX(testSprite));
    AssertEquals(125.0, SpriteY(testSprite));
end;
procedure TestMoveSpritePercentIntegration;
begin
    testBitmap := CreateBitmap('Test Bitmap 20', 100, 100);
    CleanupBitmap := TBitmapCleanup.Create;
    testSprite := CreateSprite(testBitmap);
    CleanupSprite := TSpriteCleanup.Create;
    SpriteSetPosition(testSprite, PointAt(100.0, 100.0));
    SpriteSetVelocity(testSprite, VectorTo(10.0, 10.0));
    MoveSprite(testSprite, 0.5);
    AssertEquals(105.0, SpriteX(testSprite));
    AssertEquals(105.0, SpriteY(testSprite));
end;
procedure TestMoveSpriteToIntegration;
begin
    testBitmap := CreateBitmap('Test Bitmap 21', 100, 100);
    CleanupBitmap := TBitmapCleanup.Create;
    testSprite := CreateSprite(testBitmap);
    CleanupSprite := TSpriteCleanup.Create;
    MoveSpriteTo(testSprite, 400.0, 300.0);
    AssertEquals(400.0, SpriteX(testSprite));
    AssertEquals(300.0, SpriteY(testSprite));
end;
procedure TestSelectSpritePackIntegration;
begin
    CreateSpritePack('Test Sprite Pack 5');
    CleanupSpritePack := TSpritePackCleanup.Create('Test Sprite Pack 5')
    AssertEquals('default', CurrentSpritePack());
    SelectSpritePack('Test Sprite Pack 5');
    AssertEquals('Test Sprite Pack 5', CurrentSpritePack());
end;
procedure TestSpriteAddLayerIntegration;
begin
    testBitmap := CreateBitmap('Test Bitmap 22', 100, 100);
    CleanupBitmap := TBitmapCleanup.Create;
    testSprite := CreateSprite(testBitmap);
    CleanupSprite := TSpriteCleanup.Create;
    newLayerBitmap := CreateBitmap('Test Bitmap 23', 50, 50);
    layerIndex := SpriteAddLayer(testSprite, newLayerBitmap, 'Test Bitmap 23');
    AssertEquals(1, layerIndex);
    AssertEquals(2, SpriteLayerCount(testSprite));
end;
procedure TestSpriteAddToVelocityIntegration;
begin
    testBitmap := CreateBitmap('Test Bitmap 24', 100, 100);
    CleanupBitmap := TBitmapCleanup.Create;
    testSprite := CreateSprite(testBitmap);
    CleanupSprite := TSpriteCleanup.Create;
    SpriteSetVelocity(testSprite, VectorTo(0.0, 0.0));
    SpriteAddToVelocity(testSprite, VectorTo(10.0, 10.0));
    velocity := SpriteVelocity(testSprite);
    AssertEquals(10.0, velocity.x);
    AssertEquals(10.0, velocity.y);
end;
procedure TestSpriteAddValueIntegration;
begin
    testBitmap := CreateBitmap('Test Bitmap 25', 100, 100);
    CleanupBitmap := TBitmapCleanup.Create;
    testSprite := CreateSprite(testBitmap);
    CleanupSprite := TSpriteCleanup.Create;
    SpriteAddValue(testSprite, 'health', 100.0);
    AssertTrue(SpriteHasValue(testSprite, 'health'));
    AssertEquals(100.0, SpriteValue(testSprite, 'health'));
end;
procedure TestSpriteAddValueWithDefaultIntegration;
begin
    testBitmap := CreateBitmap('Test Bitmap 26', 100, 100);
    CleanupBitmap := TBitmapCleanup.Create;
    testSprite := CreateSprite(testBitmap);
    CleanupSprite := TSpriteCleanup.Create;
    SpriteAddValue(testSprite, 'health', 100.0);
    AssertTrue(SpriteHasValue(testSprite, 'health'));
    AssertEquals(100.0, SpriteValue(testSprite, 'health'));
end;
procedure TestSpriteAnchorPointIntegration;
begin
    testBitmap := CreateBitmap('Test Bitmap 27', 100, 100);
    CleanupBitmap := TBitmapCleanup.Create;
    testSprite := CreateSprite(testBitmap);
    CleanupSprite := TSpriteCleanup.Create;
    anchorPoint := SpriteAnchorPoint(testSprite);
    AssertEquals(50.0, anchorPoint.x);
    AssertEquals(50.0, anchorPoint.y);
end;
procedure TestSpriteAnchorPositionIntegration;
begin
    testBitmap := CreateBitmap('Test Bitmap 28', 100, 100);
    CleanupBitmap := TBitmapCleanup.Create;
    testSprite := CreateSprite(testBitmap);
    CleanupSprite := TSpriteCleanup.Create;
    SpriteSetPosition(testSprite, PointAt(100.0, 100.0));
    anchorPosition := SpriteAnchorPosition(testSprite);
    AssertEquals(150.0, anchorPosition.x);
    AssertEquals(150.0, anchorPosition.y);
end;
procedure TestSpriteAnimationHasEndedIntegration;
begin
    testBitmap := CreateBitmap('Test Bitmap 29', 100, 100);
    CleanupBitmap := TBitmapCleanup.Create;
    testAnimation := LoadAnimationScript('Test Script 4', 'kermit.txt');
    CleanupAnimationScript := TAnimationScriptCleanup.Create;
    testSprite := CreateSprite(testBitmap, testAnimation);
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
    testBitmap := CreateBitmap('Test Bitmap 30', 100, 100);
    CleanupBitmap := TBitmapCleanup.Create;
    testAnimation := LoadAnimationScript('Test Script 5', 'kermit.txt');
    CleanupAnimationScript := TAnimationScriptCleanup.Create;
    testSprite := CreateSprite(testBitmap, testAnimation);
    CleanupSprite := TSpriteCleanup.Create;
    SpriteStartAnimation(testSprite, 'walkfront');
    AssertEquals('walkfront', SpriteAnimationName(testSprite));
end;
procedure TestSpriteAtIntegration;
begin
    testBitmap := CreateBitmap('Test Bitmap 31', 100, 100);
    CleanupBitmap := TBitmapCleanup.Create;
    ClearBitmap(testBitmap, ColorRed());
    SetupCollisionMask(testBitmap);
    testSprite := CreateSprite(testBitmap);
    CleanupSprite := TSpriteCleanup.Create;
    SpriteSetX(testSprite, 400.0);
    SpriteSetY(testSprite, 300.0);
    AssertTrue(SpriteAt(testSprite, PointAt(451.0, 350.0)));
    AssertFalse(SpriteAt(testSprite, PointAt(600.0, 500.0)));
end;
procedure TestSpriteBringLayerForwardIntegration;
begin
    testBitmap := CreateBitmap('Test Bitmap 33', 100, 100);
    CleanupBitmap := TBitmapCleanup.Create;
    testSprite := CreateSprite(testBitmap);
    CleanupSprite := TSpriteCleanup.Create;
    layerIndex := SpriteAddLayer(testSprite, testBitmap, 'layer2');
    SpriteShowLayer(testSprite, layerIndex);
    visibleIndex := SpriteVisibleIndexOfLayer(testSprite, layerIndex);
    SpriteBringLayerForward(testSprite, visibleIndex);
    AssertEquals(0, SpriteVisibleIndexOfLayer(testSprite, layerIndex));
end;
procedure TestSpriteBringLayerToFrontIntegration;
begin
    testBitmap := CreateBitmap('Test Bitmap 32', 100, 100);
    CleanupBitmap := TBitmapCleanup.Create;
    testSprite := CreateSprite(testBitmap);
    CleanupSprite := TSpriteCleanup.Create;
    layerIndex := SpriteAddLayer(testSprite, testBitmap, 'layer2');
    SpriteShowLayer(testSprite, layerIndex);
    visibleIndex := SpriteVisibleIndexOfLayer(testSprite, layerIndex);
    SpriteBringLayerToFront(testSprite, visibleIndex);
    AssertEquals(0, SpriteVisibleIndexOfLayer(testSprite, 'layer2'));
end;
procedure TestSpriteCallOnEventIntegration;
begin
    testSpriteDelegates := SpriteDelegates.Create();
    testBitmap := CreateBitmap('Test Bitmap 35', 100, 100);
    CleanupBitmap := TBitmapCleanup.Create;
    testSprite := CreateSprite(testBitmap);
    CleanupSprite := TSpriteCleanup.Create;
    SpriteCallOnEvent(testSprite, test_sprite_delegates.sprite_event_handler);
    UpdateSprite(testSprite);
    StopCallingOnSpriteEvent(test_sprite_delegates.sprite_event_handler);
    AssertTrue(test_sprite_delegates.event_called);
end;
procedure TestSpriteCircleIntegration;
begin
    testBitmap := CreateBitmap('Test Bitmap 36', 100, 100);
    CleanupBitmap := TBitmapCleanup.Create;
    testSprite := CreateSprite(testBitmap);
    CleanupSprite := TSpriteCleanup.Create;
    circle := SpriteCircle(testSprite);
    AssertEquals(50.0, circle.center.x);
    AssertEquals(50.0, circle.center.y);
    AssertEquals(50.0, circle.radius);
end;
procedure TestSpriteCollisionBitmapIntegration;
begin
    testBitmap := CreateBitmap('Test Bitmap 37', 100, 100);
    CleanupBitmap := TBitmapCleanup.Create;
    testSprite := CreateSprite(testBitmap);
    CleanupSprite := TSpriteCleanup.Create;
    collisionBitmap := SpriteCollisionBitmap(testSprite);
    AssertEquals(testBitmap, collisionBitmap);
end;
procedure TestSpriteCollisionCircleIntegration;
begin
    testBitmap := CreateBitmap('Test Bitmap 38', 100, 100);
    CleanupBitmap := TBitmapCleanup.Create;
    testSprite := CreateSprite(testBitmap);
    CleanupSprite := TSpriteCleanup.Create;
    circle := SpriteCollisionCircle(testSprite);
    AssertEquals(50.0, circle.center.x);
    AssertEquals(50.0, circle.center.y);
    AssertEquals(50.0, circle.radius);
end;
procedure TestSpriteCollisionKindIntegration;
begin
    testBitmap := CreateBitmap('Test Bitmap 39', 100, 100);
    CleanupBitmap := TBitmapCleanup.Create;
    testSprite := CreateSprite(testBitmap);
    CleanupSprite := TSpriteCleanup.Create;
    AssertEquals(CollisionTestKind.PIXEL_COLLISIONS, SpriteCollisionKind(testSprite));
    SpriteSetCollisionKind(testSprite, CollisionTestKind.AABB_COLLISIONS);
    AssertEquals(CollisionTestKind.AABB_COLLISIONS, SpriteCollisionKind(testSprite));
end;
procedure TestSpriteCollisionRectangleIntegration;
begin
    testBitmap := CreateBitmap('Test Bitmap 40', 100, 100);
    CleanupBitmap := TBitmapCleanup.Create;
    testSprite := CreateSprite(testBitmap);
    CleanupSprite := TSpriteCleanup.Create;
    rect := SpriteCollisionRectangle(testSprite);
    AssertEquals(0.0, rect.x);
    AssertEquals(0.0, rect.y);
    AssertEquals(100.0, rect.width);
    AssertEquals(100.0, rect.height);
end;
procedure TestSpriteCurrentCellIntegration;
begin
    testBitmap := CreateBitmap('Test Bitmap 41', 100, 100);
    CleanupBitmap := TBitmapCleanup.Create;
    testAnimation := LoadAnimationScript('Test Script 7', 'kermit.txt');
    CleanupAnimationScript := TAnimationScriptCleanup.Create;
    testSprite := CreateSprite(testBitmap, testAnimation);
    CleanupSprite := TSpriteCleanup.Create;
    SpriteStartAnimation(testSprite, 'walkfront');
    AssertEquals(0, SpriteCurrentCell(testSprite));
    UpdateSprite(testSprite, 100.0);
    AssertEquals(1, SpriteCurrentCell(testSprite));
end;
procedure TestSpriteCurrentCellRectangleIntegration;
begin
    testBitmap := CreateBitmap('Test Bitmap 42', 100, 100);
    CleanupBitmap := TBitmapCleanup.Create;
    testSprite := CreateSprite(testBitmap);
    CleanupSprite := TSpriteCleanup.Create;
    rect := SpriteCurrentCellRectangle(testSprite);
    AssertEquals(0.0, rect.x);
    AssertEquals(0.0, rect.y);
    AssertEquals(100.0, rect.width);
    AssertEquals(100.0, rect.height);
end;
procedure TestSpriteDxIntegration;
begin
    testBitmap := CreateBitmap('Test Bitmap 43', 100, 100);
    CleanupBitmap := TBitmapCleanup.Create;
    testSprite := CreateSprite(testBitmap);
    CleanupSprite := TSpriteCleanup.Create;
    AssertEquals(0.0, SpriteDx(testSprite));
    SpriteSetDx(testSprite, 5.0);
    AssertEquals(5.0, SpriteDx(testSprite));
end;
procedure TestSpriteDyIntegration;
begin
    testBitmap := CreateBitmap('Test Bitmap 44', 100, 100);
    CleanupBitmap := TBitmapCleanup.Create;
    testSprite := CreateSprite(testBitmap);
    CleanupSprite := TSpriteCleanup.Create;
    AssertEquals(0.0, SpriteDy(testSprite));
    SpriteSetDy(testSprite, 5.0);
    AssertEquals(5.0, SpriteDy(testSprite));
end;
procedure TestSpriteHasValueIntegration;
begin
    testBitmap := CreateBitmap('Test Bitmap 45', 100, 100);
    CleanupBitmap := TBitmapCleanup.Create;
    testSprite := CreateSprite(testBitmap);
    CleanupSprite := TSpriteCleanup.Create;
    AssertFalse(SpriteHasValue(testSprite, 'health'));
    SpriteAddValue(testSprite, 'health', 100.0);
    AssertTrue(SpriteHasValue(testSprite, 'health'));
    AssertFalse(SpriteHasValue(testSprite, 'mana'));
end;
procedure TestSpriteHeadingIntegration;
begin
    testBitmap := CreateBitmap('Test Bitmap 46', 100, 100);
    CleanupBitmap := TBitmapCleanup.Create;
    testSprite := CreateSprite(testBitmap);
    CleanupSprite := TSpriteCleanup.Create;
    AssertEquals(90.0, SpriteHeading(testSprite));
    SpriteSetVelocity(testSprite, VectorTo(1.0, 1.0));
    AssertEquals(45.0, SpriteHeading(testSprite));
end;
procedure TestSpriteHeightIntegration;
begin
    testBitmap := CreateBitmap('Test Bitmap 47', 100, 100);
    CleanupBitmap := TBitmapCleanup.Create;
    testSprite := CreateSprite(testBitmap);
    CleanupSprite := TSpriteCleanup.Create;
    AssertEquals(100, SpriteHeight(testSprite));
end;
procedure TestSpriteHideLayerNamedIntegration;
begin
    testBitmap := CreateBitmap('Test Bitmap 48', 100, 100);
    CleanupBitmap := TBitmapCleanup.Create;
    testSprite := CreateSprite(testBitmap);
    CleanupSprite := TSpriteCleanup.Create;
    SpriteAddLayer(testSprite, testBitmap, 'layer2');
    SpriteShowLayer(testSprite, 'layer2');
    AssertEquals(2, SpriteVisibleLayerCount(testSprite));
    SpriteHideLayer(testSprite, 'layer2');
    AssertEquals(1, SpriteVisibleLayerCount(testSprite));
end;
procedure TestSpriteHideLayerIntegration;
begin
    testBitmap := CreateBitmap('Test Bitmap 49', 100, 100);
    CleanupBitmap := TBitmapCleanup.Create;
    testSprite := CreateSprite(testBitmap);
    CleanupSprite := TSpriteCleanup.Create;
    layerIdx := SpriteAddLayer(testSprite, testBitmap, 'layer2');
    SpriteShowLayer(testSprite, layerIdx);
    AssertEquals(2, SpriteVisibleLayerCount(testSprite));
    SpriteHideLayer(testSprite, layerIdx);
    AssertEquals(1, SpriteVisibleLayerCount(testSprite));
end;
procedure TestSpriteLayerNamedIntegration;
begin
    testBitmap := CreateBitmap('Test Bitmap 50', 100, 100);
    CleanupBitmap := TBitmapCleanup.Create;
    testSprite := CreateSprite(testBitmap);
    CleanupSprite := TSpriteCleanup.Create;
    SpriteAddLayer(testSprite, testBitmap, 'layer2');
    AssertEquals(testBitmap, SpriteLayer(testSprite, 'layer2'));
end;
procedure TestSpriteLayerAtIndexIntegration;
begin
    testBitmap := CreateBitmap('Test Bitmap 51', 100, 100);
    CleanupBitmap := TBitmapCleanup.Create;
    testSprite := CreateSprite(testBitmap);
    CleanupSprite := TSpriteCleanup.Create;
    layerIdx := SpriteAddLayer(testSprite, testBitmap, 'layer2');
    AssertEquals(testBitmap, SpriteLayer(testSprite, layerIdx));
end;
procedure TestSpriteLayerCircleNamedIntegration;
begin
    testBitmap := CreateBitmap('Test Bitmap 52', 100, 100);
    CleanupBitmap := TBitmapCleanup.Create;
    testSprite := CreateSprite(testBitmap);
    CleanupSprite := TSpriteCleanup.Create;
    circle := SpriteLayerCircle(testSprite, 'base_layer');
    AssertEquals(50.0, circle.center.x);
    AssertEquals(50.0, circle.center.y);
    AssertEquals(50.0, circle.radius);
end;
procedure TestSpriteLayerCircleAtIndexIntegration;
begin
    testBitmap := CreateBitmap('Test Bitmap 53', 100, 100);
    CleanupBitmap := TBitmapCleanup.Create;
    testSprite := CreateSprite(testBitmap);
    CleanupSprite := TSpriteCleanup.Create;
    circle := SpriteLayerCircle(testSprite, 0);
    AssertEquals(50.0, circle.center.x);
    AssertEquals(50.0, circle.center.y);
    AssertEquals(50.0, circle.radius);
end;
procedure TestSpriteLayerCountIntegration;
begin
    testBitmap := CreateBitmap('Test Bitmap 54', 100, 100);
    CleanupBitmap := TBitmapCleanup.Create;
    testSprite := CreateSprite(testBitmap);
    CleanupSprite := TSpriteCleanup.Create;
    AssertEquals(1, SpriteLayerCount(testSprite));
    layerIdx := SpriteAddLayer(testSprite, testBitmap, 'layer2');
    AssertEquals(2, SpriteLayerCount(testSprite));
    AssertEquals(1, layerIdx);
end;
procedure TestSpriteLayerHeightNamedIntegration;
begin
    testBitmap := CreateBitmap('Test Bitmap 55', 100, 100);
    CleanupBitmap := TBitmapCleanup.Create;
    testSprite := CreateSprite(testBitmap);
    CleanupSprite := TSpriteCleanup.Create;
    AssertEquals(100, SpriteLayerHeight(testSprite, 'base_layer'));
    SpriteAddLayer(testSprite, testBitmap, 'layer2');
    AssertEquals(100, SpriteLayerHeight(testSprite, 'layer2'));
end;
procedure TestSpriteLayerHeightIntegration;
begin
    testBitmap := CreateBitmap('Test Bitmap 56', 100, 100);
    CleanupBitmap := TBitmapCleanup.Create;
    testSprite := CreateSprite(testBitmap);
    CleanupSprite := TSpriteCleanup.Create;
    AssertEquals(100, SpriteLayerHeight(testSprite, 0));
    layerIdx := SpriteAddLayer(testSprite, testBitmap, 'layer2');
    AssertEquals(100, SpriteLayerHeight(testSprite, layerIdx));
end;
procedure TestSpriteLayerIndexIntegration;
begin
    testBitmap := CreateBitmap('Test Bitmap 57', 100, 100);
    CleanupBitmap := TBitmapCleanup.Create;
    testSprite := CreateSprite(testBitmap);
    CleanupSprite := TSpriteCleanup.Create;
    AssertEquals(0, SpriteLayerIndex(testSprite, 'base_layer'));
    layerIdx := SpriteAddLayer(testSprite, testBitmap, 'layer2');
    AssertEquals(layerIdx, SpriteLayerIndex(testSprite, 'layer2'));
end;
procedure TestSpriteLayerNameIntegration;
begin
    testBitmap := CreateBitmap('Test Bitmap 58', 100, 100);
    CleanupBitmap := TBitmapCleanup.Create;
    testSprite := CreateSprite(testBitmap);
    CleanupSprite := TSpriteCleanup.Create;
    layerIdx := SpriteAddLayer(testSprite, testBitmap, 'layer2');
    AssertEquals('', SpriteLayerName(testSprite, layerIdx));
end;
procedure TestSpriteLayerOffsetNamedIntegration;
begin
    testBitmap := CreateBitmap('Test Bitmap 59', 100, 100);
    CleanupBitmap := TBitmapCleanup.Create;
    testSprite := CreateSprite(testBitmap);
    CleanupSprite := TSpriteCleanup.Create;
    AssertEquals(VectorTo(0.0, 0.0), SpriteLayerOffset(testSprite, 'base_layer'));
    SpriteSetLayerOffset(testSprite, 'base_layer', VectorTo(10.0, 10.0));
    AssertEquals(VectorTo(10.0, 10.0), SpriteLayerOffset(testSprite, 'base_layer'));
end;
procedure TestSpriteLayerOffsetIntegration;
begin
    testBitmap := CreateBitmap('Test Bitmap 60', 100, 100);
    CleanupBitmap := TBitmapCleanup.Create;
    testSprite := CreateSprite(testBitmap);
    CleanupSprite := TSpriteCleanup.Create;
    AssertEquals(VectorTo(0.0, 0.0), SpriteLayerOffset(testSprite, 0));
    layerIdx := SpriteAddLayer(testSprite, testBitmap, 'layer2');
    SpriteSetLayerOffset(testSprite, layerIdx, VectorTo(10.0, 10.0));
    AssertEquals(VectorTo(10.0, 10.0), SpriteLayerOffset(testSprite, layerIdx));
end;
procedure TestSpriteLayerRectangleNamedIntegration;
begin
    testBitmap := CreateBitmap('Test Bitmap 61', 100, 100);
    CleanupBitmap := TBitmapCleanup.Create;
    testSprite := CreateSprite(testBitmap);
    CleanupSprite := TSpriteCleanup.Create;
    rect := SpriteLayerRectangle(testSprite, 'base_layer');
    AssertEquals(0.0, rect.x);
    AssertEquals(0.0, rect.y);
    AssertEquals(100.0, rect.width);
    AssertEquals(100.0, rect.height);
end;
procedure TestSpriteLayerRectangleAtIndexIntegration;
begin
    testBitmap := CreateBitmap('Test Bitmap 62', 100, 100);
    CleanupBitmap := TBitmapCleanup.Create;
    testSprite := CreateSprite(testBitmap);
    CleanupSprite := TSpriteCleanup.Create;
    rect := SpriteLayerRectangle(testSprite, 0);
    AssertEquals(0.0, rect.x);
    AssertEquals(0.0, rect.y);
    AssertEquals(100.0, rect.width);
    AssertEquals(100.0, rect.height);
end;
procedure TestSpriteLayerWidthNamedIntegration;
begin
    testBitmap := CreateBitmap('Test Bitmap 63', 100, 100);
    CleanupBitmap := TBitmapCleanup.Create;
    testSprite := CreateSprite(testBitmap);
    CleanupSprite := TSpriteCleanup.Create;
    AssertEquals(100, SpriteLayerWidth(testSprite, 'base_layer'));
    SpriteAddLayer(testSprite, testBitmap, 'layer2');
    AssertEquals(100, SpriteLayerWidth(testSprite, 'layer2'));
end;
procedure TestSpriteLayerWidthIntegration;
begin
    testBitmap := CreateBitmap('Test Bitmap 64', 100, 100);
    CleanupBitmap := TBitmapCleanup.Create;
    testSprite := CreateSprite(testBitmap);
    CleanupSprite := TSpriteCleanup.Create;
    AssertEquals(100, SpriteLayerWidth(testSprite, 0));
    layerIdx := SpriteAddLayer(testSprite, testBitmap, 'layer2');
    AssertEquals(100, SpriteLayerWidth(testSprite, layerIdx));
end;
procedure TestSpriteLocationMatrixIntegration;
begin
    testBitmap := CreateBitmap('Test Bitmap 65', 100, 100);
    CleanupBitmap := TBitmapCleanup.Create;
    testSprite := CreateSprite(testBitmap);
    CleanupSprite := TSpriteCleanup.Create;
    SpriteSetPosition(testSprite, PointAt(100.0, 100.0));
    SpriteSetRotation(testSprite, 45.0);
    matrix := SpriteLocationMatrix(testSprite);
    AssertEquals(150.0, matrix.elements[0, 2]);
    AssertEquals(1.0, matrix.elements[2, 2]);
end;
procedure TestSpriteMassIntegration;
begin
    testBitmap := CreateBitmap('Test Bitmap 66', 100, 100);
    CleanupBitmap := TBitmapCleanup.Create;
    testSprite := CreateSprite(testBitmap);
    CleanupSprite := TSpriteCleanup.Create;
    AssertEquals(1.0, SpriteMass(testSprite));
    SpriteSetMass(testSprite, 10.0);
    AssertEquals(10.0, SpriteMass(testSprite));
end;
procedure TestSpriteMoveFromAnchorPointIntegration;
begin
    testBitmap := CreateBitmap('Test Bitmap 67', 100, 100);
    CleanupBitmap := TBitmapCleanup.Create;
    testSprite := CreateSprite(testBitmap);
    CleanupSprite := TSpriteCleanup.Create;
    AssertFalse(SpriteMoveFromAnchorPoint(testSprite));
    SpriteSetMoveFromAnchorPoint(testSprite, true);
    AssertTrue(SpriteMoveFromAnchorPoint(testSprite));
end;
procedure TestSpriteMoveToTakingSecondsIntegration;
begin
    testBitmap := CreateBitmap('Test Bitmap 68', 100, 100);
    CleanupBitmap := TBitmapCleanup.Create;
    testSprite := CreateSprite(testBitmap);
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
    testBitmap := CreateBitmap('Test Bitmap 69', 100, 100);
    CleanupBitmap := TBitmapCleanup.Create;
    testSprite := CreateSprite('Test Sprite 7', testBitmap);
    CleanupSprite := TSpriteCleanup.Create;
    AssertEquals('Test Sprite 7', SpriteName(testSprite));
end;
procedure TestSpriteNamedIntegration;
begin
    testBitmap := CreateBitmap('Test Bitmap 70', 100, 100);
    CleanupBitmap := TBitmapCleanup.Create;
    testSprite := CreateSprite('Test Sprite 8', testBitmap);
    CleanupSprite := TSpriteCleanup.Create;
    AssertEquals(testSprite, SpriteNamed('Test Sprite 8'));
    AssertNull(SpriteNamed('non_existent_sprite'));
end;
procedure TestSpriteOffscreenIntegration;
begin
    OpenWindow('Test Window 5', 800, 600);
    CleanupWindow := TWindowCleanup.Create;
    testBitmap := CreateBitmap('Test Bitmap 71', 100, 100);
    CleanupBitmap := TBitmapCleanup.Create;
    testSprite := CreateSprite(testBitmap);
    CleanupSprite := TSpriteCleanup.Create;
    SpriteSetPosition(testSprite, PointAt(400.0, 300.0));
    AssertFalse(SpriteOffscreen(testSprite));
    SpriteSetPosition(testSprite, PointAt(-200.0, -200.0));
    AssertTrue(SpriteOffscreen(testSprite));
end;
procedure TestSpriteOnScreenAtPointIntegration;
begin
    OpenWindow('Test Window 6', 800, 600);
    CleanupWindow := TWindowCleanup.Create;
    testBitmap := CreateBitmap('Test Bitmap 72', 100, 100);
    CleanupBitmap := TBitmapCleanup.Create;
    ClearBitmap(testBitmap, ColorRed());
    SetupCollisionMask(testBitmap);
    testSprite := CreateSprite(testBitmap);
    CleanupSprite := TSpriteCleanup.Create;
    SpriteSetPosition(testSprite, PointAt(400.0, 300.0));
    DrawSprite(testSprite);
    RefreshScreen();
    AssertTrue(SpriteOnScreenAt(testSprite, PointAt(451.0, 350.0)));
    AssertFalse(SpriteOnScreenAt(testSprite, PointAt(0.0, 0.0)));
end;
procedure TestSpriteOnScreenAtIntegration;
begin
    OpenWindow('Test Window 7', 800, 600);
    CleanupWindow := TWindowCleanup.Create;
    testBitmap := CreateBitmap('Test Bitmap 73', 100, 100);
    CleanupBitmap := TBitmapCleanup.Create;
    ClearBitmap(testBitmap, ColorRed());
    SetupCollisionMask(testBitmap);
    testSprite := CreateSprite(testBitmap);
    CleanupSprite := TSpriteCleanup.Create;
    SpriteSetPosition(testSprite, PointAt(400.0, 300.0));
    DrawSprite(testSprite);
    RefreshScreen();
    AssertTrue(SpriteOnScreenAt(testSprite, 451.0, 350.0));
    AssertFalse(SpriteOnScreenAt(testSprite, 0.0, 0.0));
end;
procedure TestSpritePositionIntegration;
begin
    testBitmap := CreateBitmap('Test Bitmap 74', 100, 100);
    CleanupBitmap := TBitmapCleanup.Create;
    testSprite := CreateSprite(testBitmap);
    CleanupSprite := TSpriteCleanup.Create;
    AssertEquals(PointAt(0.0, 0.0), SpritePosition(testSprite));
    SpriteSetPosition(testSprite, PointAt(400.0, 300.0));
    AssertEquals(PointAt(400.0, 300.0), SpritePosition(testSprite));
end;
procedure TestSpriteReplayAnimationIntegration;
begin
    testBitmap := CreateBitmap('Test Bitmap 75', 100, 100);
    CleanupBitmap := TBitmapCleanup.Create;
    testAnimation := LoadAnimationScript('Test Script 8', 'kermit.txt');
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
    testBitmap := CreateBitmap('Test Bitmap 76', 100, 100);
    CleanupBitmap := TBitmapCleanup.Create;
    testAnimation := LoadAnimationScript('Test Script 9', 'startup.txt');
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
    testBitmap := CreateBitmap('Test Bitmap 77', 100, 100);
    CleanupBitmap := TBitmapCleanup.Create;
    testSprite := CreateSprite(testBitmap);
    CleanupSprite := TSpriteCleanup.Create;
    AssertEquals(0.0, SpriteRotation(testSprite));
    SpriteSetRotation(testSprite, 45.0);
    AssertEquals(45.0, SpriteRotation(testSprite));
end;
procedure TestSpriteScaleIntegration;
begin
    testBitmap := CreateBitmap('Test Bitmap 78', 100, 100);
    CleanupBitmap := TBitmapCleanup.Create;
    testSprite := CreateSprite(testBitmap);
    CleanupSprite := TSpriteCleanup.Create;
    AssertEquals(1.0, SpriteScale(testSprite));
    SpriteSetScale(testSprite, 2.0);
    AssertEquals(2.0, SpriteScale(testSprite));
end;
procedure TestSpriteScreenRectangleIntegration;
begin
    OpenWindow('Test Window 8', 800, 600);
    CleanupWindow := TWindowCleanup.Create;
    testBitmap := CreateBitmap('Test Bitmap 79', 100, 100);
    CleanupBitmap := TBitmapCleanup.Create;
    testAnimation := LoadAnimationScript('Test Script 10', 'kermit.txt');
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
    testBitmap := CreateBitmap('Test Bitmap 80', 100, 100);
    CleanupBitmap := TBitmapCleanup.Create;
    testSprite := CreateSprite(testBitmap);
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
    testBitmap := CreateBitmap('Test Bitmap 81', 100, 100);
    CleanupBitmap := TBitmapCleanup.Create;
    testSprite := CreateSprite(testBitmap);
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
    testBitmap := CreateBitmap('Test Bitmap 82', 100, 100);
    CleanupBitmap := TBitmapCleanup.Create;
    testSprite := CreateSprite(testBitmap);
    CleanupSprite := TSpriteCleanup.Create;
    AssertEquals(PointAt(50.0, 50.0), SpriteAnchorPoint(testSprite));
    SpriteSetAnchorPoint(testSprite, PointAt(25.0, 25.0));
    AssertEquals(PointAt(25.0, 25.0), SpriteAnchorPoint(testSprite));
end;
procedure TestSpriteSetCollisionBitmapIntegration;
begin
    testBitmap := CreateBitmap('Test Bitmap 83', 100, 100);
    CleanupBitmap := TBitmapCleanup.Create;
    testSprite := CreateSprite(testBitmap);
    CleanupSprite := TSpriteCleanup.Create;
    AssertEquals(testBitmap, SpriteCollisionBitmap(testSprite));
    newBitmap := CreateBitmap('Test Bitmap 84', 200, 200);
    SpriteSetCollisionBitmap(testSprite, newBitmap);
    AssertEquals(newBitmap, SpriteCollisionBitmap(testSprite));
end;
procedure TestSpriteSetCollisionKindIntegration;
begin
    testBitmap := CreateBitmap('Test Bitmap 85', 100, 100);
    CleanupBitmap := TBitmapCleanup.Create;
    testSprite := CreateSprite(testBitmap);
    CleanupSprite := TSpriteCleanup.Create;
    AssertEquals(CollisionTestKind.PIXEL_COLLISIONS, SpriteCollisionKind(testSprite));
    SpriteSetCollisionKind(testSprite, CollisionTestKind.AABB_COLLISIONS);
    AssertEquals(CollisionTestKind.AABB_COLLISIONS, SpriteCollisionKind(testSprite));
end;
procedure TestSpriteSetDxIntegration;
begin
    testBitmap := CreateBitmap('Test Bitmap 86', 100, 100);
    CleanupBitmap := TBitmapCleanup.Create;
    testSprite := CreateSprite(testBitmap);
    CleanupSprite := TSpriteCleanup.Create;
    AssertEquals(0.0, SpriteDx(testSprite));
    SpriteSetDx(testSprite, 5.0);
    AssertEquals(5.0, SpriteDx(testSprite));
end;
procedure TestSpriteSetDyIntegration;
begin
    testBitmap := CreateBitmap('Test Bitmap 87', 100, 100);
    CleanupBitmap := TBitmapCleanup.Create;
    testSprite := CreateSprite(testBitmap);
    CleanupSprite := TSpriteCleanup.Create;
    AssertEquals(0.0, SpriteDy(testSprite));
    SpriteSetDy(testSprite, 5.0);
    AssertEquals(5.0, SpriteDy(testSprite));
end;
procedure TestSpriteSetHeadingIntegration;
begin
    testBitmap := CreateBitmap('Test Bitmap 88', 100, 100);
    CleanupBitmap := TBitmapCleanup.Create;
    testSprite := CreateSprite(testBitmap);
    CleanupSprite := TSpriteCleanup.Create;
    SpriteSetVelocity(testSprite, VectorFromAngle(90.0, 1.0));
    AssertEquals(90.0, SpriteHeading(testSprite));
    SpriteSetHeading(testSprite, 45.0);
    AssertEquals(45.0, SpriteHeading(testSprite));
end;
procedure TestSpriteSetLayerOffsetNamedIntegration;
begin
    testBitmap := CreateBitmap('Test Bitmap 89', 100, 100);
    CleanupBitmap := TBitmapCleanup.Create;
    testSprite := CreateSprite(testBitmap);
    CleanupSprite := TSpriteCleanup.Create;
    AssertEquals(VectorTo(0.0, 0.0), SpriteLayerOffset(testSprite, 'base_layer'));
    SpriteSetLayerOffset(testSprite, 'base_layer', VectorTo(10.0, 10.0));
    AssertEquals(VectorTo(10.0, 10.0), SpriteLayerOffset(testSprite, 'base_layer'));
end;
procedure TestSpriteSetLayerOffsetAtIndexIntegration;
begin
    testBitmap := CreateBitmap('Test Bitmap 90', 100, 100);
    CleanupBitmap := TBitmapCleanup.Create;
    testSprite := CreateSprite(testBitmap);
    CleanupSprite := TSpriteCleanup.Create;
    AssertEquals(VectorTo(0.0, 0.0), SpriteLayerOffset(testSprite, 0));
    SpriteSetLayerOffset(testSprite, 0, VectorTo(10.0, 10.0));
    AssertEquals(VectorTo(10.0, 10.0), SpriteLayerOffset(testSprite, 0));
end;
procedure TestSpriteSetMassIntegration;
begin
    testBitmap := CreateBitmap('Test Bitmap 91', 100, 100);
    CleanupBitmap := TBitmapCleanup.Create;
    testSprite := CreateSprite(testBitmap);
    CleanupSprite := TSpriteCleanup.Create;
    AssertEquals(1.0, SpriteMass(testSprite));
    SpriteSetMass(testSprite, 10.0);
    AssertEquals(10.0, SpriteMass(testSprite));
end;
procedure TestSpriteSetMoveFromAnchorPointIntegration;
begin
    testBitmap := CreateBitmap('Test Bitmap 92', 100, 100);
    CleanupBitmap := TBitmapCleanup.Create;
    testSprite := CreateSprite(testBitmap);
    CleanupSprite := TSpriteCleanup.Create;
    AssertFalse(SpriteMoveFromAnchorPoint(testSprite));
    SpriteSetMoveFromAnchorPoint(testSprite, true);
    AssertTrue(SpriteMoveFromAnchorPoint(testSprite));
end;
procedure TestSpriteSetPositionIntegration;
begin
    testBitmap := CreateBitmap('Test Bitmap 93', 100, 100);
    CleanupBitmap := TBitmapCleanup.Create;
    testSprite := CreateSprite(testBitmap);
    CleanupSprite := TSpriteCleanup.Create;
    AssertEquals(PointAt(0.0, 0.0), SpritePosition(testSprite));
    SpriteSetPosition(testSprite, PointAt(100.0, 100.0));
    AssertEquals(PointAt(100.0, 100.0), SpritePosition(testSprite));
end;
procedure TestSpriteSetRotationIntegration;
begin
    testBitmap := CreateBitmap('Test Bitmap 94', 100, 100);
    CleanupBitmap := TBitmapCleanup.Create;
    testSprite := CreateSprite(testBitmap);
    CleanupSprite := TSpriteCleanup.Create;
    AssertEquals(0.0, SpriteRotation(testSprite));
    SpriteSetRotation(testSprite, 45.0);
    AssertEquals(45.0, SpriteRotation(testSprite));
end;
procedure TestSpriteSetScaleIntegration;
begin
    testBitmap := CreateBitmap('Test Bitmap 95', 100, 100);
    CleanupBitmap := TBitmapCleanup.Create;
    testSprite := CreateSprite(testBitmap);
    CleanupSprite := TSpriteCleanup.Create;
    AssertEquals(1.0, SpriteScale(testSprite));
    SpriteSetScale(testSprite, 2.0);
    AssertEquals(2.0, SpriteScale(testSprite));
end;
procedure TestSpriteSetSpeedIntegration;
begin
    testBitmap := CreateBitmap('Test Bitmap 96', 100, 100);
    CleanupBitmap := TBitmapCleanup.Create;
    testSprite := CreateSprite(testBitmap);
    CleanupSprite := TSpriteCleanup.Create;
    SpriteSetVelocity(testSprite, VectorFromAngle(0.0, 1.0));
    SpriteSetSpeed(testSprite, 5.0);
    AssertEquals(5.0, SpriteSpeed(testSprite));
end;
procedure TestSpriteSetValueNamedIntegration;
begin
    testBitmap := CreateBitmap('Test Bitmap 97', 100, 100);
    CleanupBitmap := TBitmapCleanup.Create;
    testSprite := CreateSprite(testBitmap);
    CleanupSprite := TSpriteCleanup.Create;
    AssertFalse(SpriteHasValue(testSprite, 'test_value'));
    SpriteAddValue(testSprite, 'test_value', 0.0);
    SpriteSetValue(testSprite, 'test_value', 10.5);
    AssertEquals(10.5, SpriteValue(testSprite, 'test_value'));
end;
procedure TestSpriteSetVelocityIntegration;
begin
    testBitmap := CreateBitmap('Test Bitmap 98', 100, 100);
    CleanupBitmap := TBitmapCleanup.Create;
    testSprite := CreateSprite(testBitmap);
    CleanupSprite := TSpriteCleanup.Create;
    AssertEquals(VectorTo(0.0, 0.0), SpriteVelocity(testSprite));
    SpriteSetVelocity(testSprite, VectorTo(5.0, 5.0));
    AssertEquals(VectorTo(5.0, 5.0), SpriteVelocity(testSprite));
end;
procedure TestSpriteSetXIntegration;
begin
    testBitmap := CreateBitmap('Test Bitmap 99', 100, 100);
    CleanupBitmap := TBitmapCleanup.Create;
    testSprite := CreateSprite(testBitmap);
    CleanupSprite := TSpriteCleanup.Create;
    AssertEquals(0.0, SpriteX(testSprite));
    SpriteSetX(testSprite, 150.0);
    AssertEquals(150.0, SpriteX(testSprite));
end;
procedure TestSpriteSetYIntegration;
begin
    testBitmap := CreateBitmap('Test Bitmap 100', 100, 100);
    CleanupBitmap := TBitmapCleanup.Create;
    testSprite := CreateSprite(testBitmap);
    CleanupSprite := TSpriteCleanup.Create;
    AssertEquals(0.0, SpriteY(testSprite));
    SpriteSetY(testSprite, 300.0);
    AssertEquals(300.0, SpriteY(testSprite));
end;
procedure TestSpriteShowLayerNamedIntegration;
begin
    testBitmap := CreateBitmap('Test Bitmap 101', 100, 100);
    CleanupBitmap := TBitmapCleanup.Create;
    testSprite := CreateSprite(testBitmap);
    CleanupSprite := TSpriteCleanup.Create;
    layerIdx := SpriteAddLayer(testSprite, testBitmap, 'layer2');
    SpriteHideLayer(testSprite, 'layer2');
    AssertEquals(1, SpriteVisibleLayerCount(testSprite));
    AssertEquals(layerIdx, SpriteShowLayer(testSprite, 'layer2'));
    AssertEquals(2, SpriteVisibleLayerCount(testSprite));
end;
procedure TestSpriteShowLayerIntegration;
begin
    testBitmap := CreateBitmap('Test Bitmap 102', 100, 100);
    CleanupBitmap := TBitmapCleanup.Create;
    testSprite := CreateSprite(testBitmap);
    CleanupSprite := TSpriteCleanup.Create;
    layerIdx := SpriteAddLayer(testSprite, testBitmap, 'layer2');
    SpriteHideLayer(testSprite, layerIdx);
    AssertEquals(1, SpriteVisibleLayerCount(testSprite));
    AssertEquals(layerIdx, SpriteShowLayer(testSprite, layerIdx));
    AssertEquals(2, SpriteVisibleLayerCount(testSprite));
end;
procedure TestSpriteSpeedIntegration;
begin
    testBitmap := CreateBitmap('Test Bitmap 103', 100, 100);
    CleanupBitmap := TBitmapCleanup.Create;
    testSprite := CreateSprite(testBitmap);
    CleanupSprite := TSpriteCleanup.Create;
    AssertEquals(0.0, SpriteSpeed(testSprite));
    SpriteSetVelocity(testSprite, VectorTo(3.0, 4.0));
    AssertEquals(5.0, SpriteSpeed(testSprite));
end;
procedure TestSpriteStartAnimationNamedIntegration;
begin
    testBitmap := CreateBitmap('Test Bitmap 104', 100, 100);
    CleanupBitmap := TBitmapCleanup.Create;
    testAnimation := LoadAnimationScript('Test Script 11', 'kermit.txt');
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
    testBitmap := CreateBitmap('Test Bitmap 105', 100, 100);
    CleanupBitmap := TBitmapCleanup.Create;
    testAnimation := LoadAnimationScript('Test Script 12', 'startup.txt');
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
    testBitmap := CreateBitmap('Test Bitmap 106', 100, 100);
    CleanupBitmap := TBitmapCleanup.Create;
    testAnimation := LoadAnimationScript('Test Script 13', 'kermit.txt');
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
    testBitmap := CreateBitmap('Test Bitmap 107', 100, 100);
    CleanupBitmap := TBitmapCleanup.Create;
    testAnimation := LoadAnimationScript('Test Script 14', 'startup.txt');
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
    testSpriteDelegates := SpriteDelegates.Create();
    testBitmap := CreateBitmap('Test Bitmap 109', 100, 100);
    CleanupBitmap := TBitmapCleanup.Create;
    testSprite := CreateSprite(testBitmap);
    CleanupSprite := TSpriteCleanup.Create;
    SpriteCallOnEvent(testSprite, test_sprite_delegates.sprite_event_handler);
    UpdateSprite(testSprite);
    AssertTrue(test_sprite_delegates.event_called);
    SpriteStopCallingOnEvent(testSprite, test_sprite_delegates.sprite_event_handler);
    testSpriteDelegates.reset
;    UpdateSprite(testSprite);
    AssertFalse(test_sprite_delegates.event_called);
end;
procedure TestSpriteToggleLayerVisibleNamedIntegration;
begin
    testBitmap := CreateBitmap('Test Bitmap 110', 100, 100);
    CleanupBitmap := TBitmapCleanup.Create;
    testSprite := CreateSprite(testBitmap);
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
    testBitmap := CreateBitmap('Test Bitmap 111', 100, 100);
    CleanupBitmap := TBitmapCleanup.Create;
    testSprite := CreateSprite(testBitmap);
    CleanupSprite := TSpriteCleanup.Create;
    layerIdx := SpriteAddLayer(testSprite, testBitmap, 'layer2');
    SpriteShowLayer(testSprite, layerIdx);
    AssertEquals(2, SpriteVisibleLayerCount(testSprite));
    SpriteToggleLayerVisible(testSprite, layerIdx);
    AssertEquals(1, SpriteVisibleLayerCount(testSprite));
end;
procedure TestSpriteValueIntegration;
begin
    testBitmap := CreateBitmap('Test Bitmap 112', 100, 100);
    CleanupBitmap := TBitmapCleanup.Create;
    testSprite := CreateSprite(testBitmap);
    CleanupSprite := TSpriteCleanup.Create;
    AssertEquals(3, SpriteValueCount(testSprite));
    SpriteAddValue(testSprite, 'test_value', 0.0);
    AssertEquals(0.0, SpriteValue(testSprite, 'test_value'));
end;
procedure TestSpriteValueCountIntegration;
begin
    testBitmap := CreateBitmap('Test Bitmap 113', 100, 100);
    CleanupBitmap := TBitmapCleanup.Create;
    testSprite := CreateSprite(testBitmap);
    CleanupSprite := TSpriteCleanup.Create;
    AssertEquals(3, SpriteValueCount(testSprite));
    SpriteAddValue(testSprite, 'health', 0.0);
    SpriteAddValue(testSprite, 'speed', 0.0);
    AssertEquals(5, SpriteValueCount(testSprite));
end;
procedure TestSpriteVelocityIntegration;
begin
    testBitmap := CreateBitmap('Test Bitmap 114', 100, 100);
    CleanupBitmap := TBitmapCleanup.Create;
    testSprite := CreateSprite(testBitmap);
    CleanupSprite := TSpriteCleanup.Create;
    AssertEquals(VectorTo(0.0, 0.0), SpriteVelocity(testSprite));
    SpriteSetVelocity(testSprite, VectorTo(5.0, 5.0));
    AssertEquals(VectorTo(5.0, 5.0), SpriteVelocity(testSprite));
end;
procedure TestSpriteVisibleIndexOfLayerNamedIntegration;
begin
    testBitmap := CreateBitmap('Test Bitmap 115', 100, 100);
    CleanupBitmap := TBitmapCleanup.Create;
    testSprite := CreateSprite(testBitmap);
    CleanupSprite := TSpriteCleanup.Create;
    AssertEquals(0, SpriteVisibleIndexOfLayer(testSprite, 'base_layer'));
    SpriteAddLayer(testSprite, testBitmap, 'layer2');
    SpriteShowLayer(testSprite, 'layer2');
    AssertEquals(1, SpriteVisibleIndexOfLayer(testSprite, 'layer2'));
end;
procedure TestSpriteVisibleIndexOfLayerIntegration;
begin
    testBitmap := CreateBitmap('Test Bitmap 116', 100, 100);
    CleanupBitmap := TBitmapCleanup.Create;
    testSprite := CreateSprite(testBitmap);
    CleanupSprite := TSpriteCleanup.Create;
    AssertEquals(0, SpriteVisibleIndexOfLayer(testSprite, 0));
    layerIdx := SpriteAddLayer(testSprite, testBitmap, 'layer2');
    SpriteShowLayer(testSprite, layerIdx);
    AssertEquals(1, SpriteVisibleIndexOfLayer(testSprite, layerIdx));
end;
procedure TestSpriteVisibleLayerIntegration;
begin
    testBitmap := CreateBitmap('Test Bitmap 117', 100, 100);
    CleanupBitmap := TBitmapCleanup.Create;
    testSprite := CreateSprite(testBitmap);
    CleanupSprite := TSpriteCleanup.Create;
    AssertEquals(0, SpriteVisibleLayer(testSprite, 0));
    SpriteAddLayer(testSprite, testBitmap, 'layer2');
    SpriteShowLayer(testSprite, 'layer2');
    AssertEquals(1, SpriteVisibleLayer(testSprite, 1));
end;
procedure TestSpriteVisibleLayerCountIntegration;
begin
    testBitmap := CreateBitmap('Test Bitmap 118', 100, 100);
    CleanupBitmap := TBitmapCleanup.Create;
    testSprite := CreateSprite(testBitmap);
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
    testBitmap := CreateBitmap('Test Bitmap 119', 100, 100);
    CleanupBitmap := TBitmapCleanup.Create;
    testSprite := CreateSprite(testBitmap);
    CleanupSprite := TSpriteCleanup.Create;
    AssertEquals(0, SpriteVisibleLayerId(testSprite, 0));
    SpriteAddLayer(testSprite, testBitmap, 'layer2');
    SpriteShowLayer(testSprite, 'layer2');
    AssertEquals(1, SpriteVisibleLayerId(testSprite, 1));
end;
procedure TestSpriteWidthIntegration;
begin
    testBitmap := CreateBitmap('Test Bitmap 120', 100, 100);
    CleanupBitmap := TBitmapCleanup.Create;
    testSprite := CreateSprite(testBitmap);
    CleanupSprite := TSpriteCleanup.Create;
    AssertEquals(1.0, SpriteScale(testSprite));
    SpriteSetScale(testSprite, 2.0);
    AssertEquals(2.0, SpriteScale(testSprite));
end;
procedure TestSpriteXIntegration;
begin
    testBitmap := CreateBitmap('Test Bitmap 121', 100, 100);
    CleanupBitmap := TBitmapCleanup.Create;
    testSprite := CreateSprite(testBitmap);
    CleanupSprite := TSpriteCleanup.Create;
    AssertEquals(0.0, SpriteX(testSprite));
    SpriteSetX(testSprite, 150.0);
    AssertEquals(150.0, SpriteX(testSprite));
end;
procedure TestSpriteYIntegration;
begin
    testBitmap := CreateBitmap('Test Bitmap 122', 100, 100);
    CleanupBitmap := TBitmapCleanup.Create;
    testSprite := CreateSprite(testBitmap);
    CleanupSprite := TSpriteCleanup.Create;
    AssertEquals(0.0, SpriteY(testSprite));
    SpriteSetY(testSprite, 200.0);
    AssertEquals(200.0, SpriteY(testSprite));
end;
procedure TestStopCallingOnSpriteEventIntegration;
begin
    testSpriteDelegates := SpriteDelegates.Create();
    testBitmap := CreateBitmap('Test Bitmap 108', 100, 100);
    CleanupBitmap := TBitmapCleanup.Create;
    testSprite := CreateSprite(testBitmap);
    CleanupSprite := TSpriteCleanup.Create;
    CallOnSpriteEvent(test_sprite_delegates.sprite_event_handler);
    UpdateSprite(testSprite);
    AssertTrue(test_sprite_delegates.event_called);
    StopCallingOnSpriteEvent(test_sprite_delegates.sprite_event_handler);
    testSpriteDelegates.reset
;    UpdateSprite(testSprite);
    AssertFalse(test_sprite_delegates.event_called);
end;
procedure TestUpdateAllSpritesIntegration;
begin
    testBitmap := CreateBitmap('Test Bitmap 123', 100, 100);
    CleanupBitmap := TBitmapCleanup.Create;
    testSprite1 := CreateSprite(testBitmap);
    CleanupSprite := TSpriteCleanup.Create;
    testSprite2 := CreateSprite(testBitmap);
    SpriteSetVelocity(testSprite1, VectorTo(10.0, 10.0));
    SpriteSetVelocity(testSprite2, VectorTo(-10.0, -10.0));
    UpdateAllSprites();
    AssertEquals(VectorTo(10.0, 10.0), SpriteVelocity(testSprite1));
    AssertEquals(VectorTo(-10.0, -10.0), SpriteVelocity(testSprite2));
end;
procedure TestUpdateAllSpritesPercentIntegration;
begin
    testBitmap := CreateBitmap('Test Bitmap 124', 100, 100);
    CleanupBitmap := TBitmapCleanup.Create;
    testSprite1 := CreateSprite(testBitmap);
    CleanupSprite := TSpriteCleanup.Create;
    testSprite2 := CreateSprite(testBitmap);
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
    testBitmap := CreateBitmap('Test Bitmap 125', 100, 100);
    CleanupBitmap := TBitmapCleanup.Create;
    testSprite := CreateSprite(testBitmap);
    CleanupSprite := TSpriteCleanup.Create;
    SpriteSetVelocity(testSprite, VectorTo(10.0, 10.0));
    initialPos := SpritePosition(testSprite);
    UpdateSprite(testSprite);
    AssertNotEquals(initialPos, SpritePosition(testSprite));
end;
procedure TestUpdateSpriteWithSoundIntegration;
begin
    testBitmap := CreateBitmap('Test Bitmap 126', 100, 100);
    CleanupBitmap := TBitmapCleanup.Create;
    testAnimation := LoadAnimationScript('Test Script 15', 'startup.txt');
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
    testBitmap := CreateBitmap('Test Bitmap 127', 100, 100);
    CleanupBitmap := TBitmapCleanup.Create;
    testSprite := CreateSprite(testBitmap);
    CleanupSprite := TSpriteCleanup.Create;
    SpriteSetVelocity(testSprite, VectorTo(100.0, 100.0));
    UpdateSprite(testSprite, 0.5);
    AssertEquals(50.0, SpriteX(testSprite));
    AssertEquals(50.0, SpriteY(testSprite));
end;
procedure TestUpdateSpritePercentWithSoundIntegration;
begin
    testAnimation := LoadAnimationScript('Test Script 16', 'startup.txt');
    CleanupAnimationScript := TAnimationScriptCleanup.Create;
    testBitmap := CreateBitmap('Test Bitmap 128', 100, 100);
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
    testBitmap := CreateBitmap('Test Bitmap 129', 100, 100);
    CleanupBitmap := TBitmapCleanup.Create;
    testAnimation := LoadAnimationScript('Test Script 17', 'kermit.txt');
    CleanupAnimationScript := TAnimationScriptCleanup.Create;
    testSprite := CreateSprite(testBitmap, testAnimation);
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
    testBitmap := CreateBitmap('Test Bitmap 130', 100, 100);
    CleanupBitmap := TBitmapCleanup.Create;
    testAnimation := LoadAnimationScript('Test Script 18', 'startup.txt');
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
    testBitmap := CreateBitmap('Test Bitmap 131', 100, 100);
    CleanupBitmap := TBitmapCleanup.Create;
    testAnimation := LoadAnimationScript('Test Script 19', 'startup.txt');
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
    testBitmap := CreateBitmap('Test Bitmap 132', 100, 100);
    CleanupBitmap := TBitmapCleanup.Create;
    testAnimation := LoadAnimationScript('Test Script 20', 'startup.txt');
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
    testBitmap := CreateBitmap('Test Bitmap 133', 100, 100);
    CleanupBitmap := TBitmapCleanup.Create;
    testSprite := CreateSprite(testBitmap);
    CleanupSprite := TSpriteCleanup.Create;
    SpriteSetPosition(testSprite, PointAt(0.0, 0.0));
    targetPoint := PointAt(150.0, 150.0);
    vector := VectorFromCenterSpriteToPoint(testSprite, targetPoint);
    AssertEquals(100.0, vector.x);
    AssertEquals(100.0, vector.y);
end;
procedure TestVectorFromToIntegration;
begin
    testBitmap := CreateBitmap('Test Bitmap 134', 100, 100);
    CleanupBitmap := TBitmapCleanup.Create;
    testSprite1 := CreateSprite(testBitmap);
    CleanupSprite := TSpriteCleanup.Create;
    testSprite2 := CreateSprite(testBitmap);
    SpriteSetPosition(testSprite1, PointAt(0.0, 0.0));
    SpriteSetPosition(testSprite2, PointAt(100.0, 100.0));
    vector := VectorFromTo(testSprite1, testSprite2);
    AssertEquals(100.0, vector.x);
    AssertEquals(100.0, vector.y);
end;
end;

procedure RegisterTests;
begin
    #<Proc:0x00007faa116e2450 /mnt/c/Users/Noahc/Documents/aYear_2_semester_2/TeamProject/GitHubRepo/splashkit_test_generator/test_generator/config/languages/pascal_config.rb:138 (lambda)>
end;
