uses SplashKit, TestFramework, ../Helpers;
type
    TTestResources = class(TTestCase)
    protected
        procedure Setup; override;
    end;
    procedure TestDeregisterFreeNotifierIntegration;
begin
    freeNotifier := NotifierTracker.Create();
    RegisterFreeNotifier(free_notifier.on_free);
    testBitmap1 := CreateBitmap('Test Bitmap 1', 100, 100);
    CleanupBitmap := TBitmapCleanup.Create;
    FreeBitmap(testBitmap1);
    AssertTrue(free_notifier.was_notified);
    DeregisterFreeNotifier(free_notifier.on_free);
    freeNotifier.reset
;    testBitmap2 := CreateBitmap('Test Bitmap 2', 100, 100);
    FreeBitmap(testBitmap2);
    AssertFalse(free_notifier.was_notified);
end;
procedure TestPathToResourceIntegration;
begin
    SetResourcesPath('resources');
    imagePath := PathToResource('test_image.png', ResourceKind.IMAGE_RESOURCE);
    AssertEquals('resources/images/test_image.png', imagePath);
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
    AssertEquals('resources/images/', imagePath);
    soundPath := PathToResources(ResourceKind.SOUND_RESOURCE);
    AssertEquals('resources/sounds/', soundPath);
end;
procedure TestRegisterFreeNotifierIntegration;
begin
    freeNotifier := NotifierTracker.Create();
    RegisterFreeNotifier(free_notifier.on_free);
    testBitmap := CreateBitmap('Test Bitmap 3', 100, 100);
    CleanupBitmap := TBitmapCleanup.Create;
    FreeBitmap(testBitmap);
    AssertTrue(free_notifier.was_notified);
    DeregisterFreeNotifier(free_notifier.on_free);
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
    #<Proc:0x00007faa116e2450 /mnt/c/Users/Noahc/Documents/aYear_2_semester_2/TeamProject/GitHubRepo/splashkit_test_generator/test_generator/config/languages/pascal_config.rb:138 (lambda)>
end;
