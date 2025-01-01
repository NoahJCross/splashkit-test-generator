uses SplashKit, TestFramework, ../Helpers;
type
    TTestResources = class(TTestCase)
    protected
        procedure Setup; override;
    end;
    procedure TestDeregisterFreeNotifierIntegration;
begin
    freeNotifier := NotifierTracker.Create();
    RegisterFreeNotifier(freeNotifier.on_free);
    testBitmap1 := CreateBitmap('test_bitmap', 100, 100);
    CleanupBitmap := TBitmapCleanup.Create;
    FreeBitmap(testBitmap1);
    AssertTrue(freeNotifier.was_notified);
    DeregisterFreeNotifier(freeNotifier.on_free);
    freeNotifier.reset;
    testBitmap2 := CreateBitmap('test_bitmap', 100, 100);
    FreeBitmap(testBitmap2);
    AssertFalse(freeNotifier.was_notified);
end;
procedure TestPathToResourceIntegration;
begin
    SetResourcesPath('resources');
    imagePath := PathToResource('test_image.png', ResourceKind.IMAGE_RESOURCE);
    AssertNotEquals('', imagePath);
end;
procedure TestPathToResourcesIntegration;
begin
    resourcePath := PathToResources();
    AssertTrue(Length(resourcePath) > 0);
    SetResourcesPath('/new/resources');
    newResourcePath := PathToResources();
    AssertEquals('/new/resources', newResourcePath);
end;
procedure TestPathToResourcesForKindIntegration;
begin
    SetResourcesPath('resources');
    imagePath := PathToResources(ResourceKind.IMAGE_RESOURCE);
    AssertEquals('resources/images', imagePath);
    soundPath := PathToResources(ResourceKind.SOUND_RESOURCE);
    AssertEquals('resources/sounds', soundPath);
end;
procedure TestRegisterFreeNotifierIntegration;
begin
    freeNotifier := NotifierTracker.Create();
    RegisterFreeNotifier(freeNotifier.on_free);
    testBitmap := CreateBitmap('test_bitmap', 100, 100);
    CleanupBitmap := TBitmapCleanup.Create;
    FreeBitmap(testBitmap);
    AssertTrue(freeNotifier.was_notified);
    DeregisterFreeNotifier(freeNotifier.on_free);
end;
procedure TestSetResourcesPathIntegration;
begin
    SetResourcesPath('/resources');
    AssertEquals('/resources', PathToResources());
    SetResourcesPath('/new/resources');
    AssertEquals('/new/resources', PathToResources());
end;
end;

procedure RegisterTests;
begin
    #<Proc:0x00007fbbcab52da8 /mnt/c/Users/Noahc/Documents/aYear_2_semester_2/TeamProject/GitHubRepo/splashkit_test_generator/test_generator/config/languages/pascal_config.rb:138 (lambda)>
end;
