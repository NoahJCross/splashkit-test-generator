uses SplashKit, TestFramework

type
TTestResources = class(TTestCase)
protected
procedure TIntegrationTests.TestDeregisterFreeNotifierIntegration;
begin
    freeNotifier := NotifierTracker.Create();
    RegisterFreeNotifier(freeNotifier.on_free);
    DeregisterFreeNotifier(freeNotifier.on_free);
    AssertTrue(freeNotifier.WasNotified);
end;
procedure TIntegrationTests.TestPathToResourceIntegration;
begin
    SetResourcesPath("resources");
    imagePath := PathToResource("test_image.png", ResourceKind.IMAGE_RESOURCE);
    AssertNotEquals("", imagePath);
    textPath := PathToResource("nonexistent_file.txt", ResourceKind.ANIMATION_RESOURCE);
    AssertEquals("", textPath);
end;
procedure TIntegrationTests.TestPathToResourcesIntegration;
begin
    resourcePath := PathToResources();
    AssertNotNull(resourcePath);
    SetResourcesPath("/new/resources");
    newResourcePath := PathToResources();
    AssertEquals("/new/resources", newResourcePath);
end;
procedure TIntegrationTests.TestPathToResourcesForKindIntegration;
begin
    SetResourcesPath("resources");
    imagePath := PathToResourcesForKind(ResourceKind.IMAGE_RESOURCE);
    AssertEquals("resources/images", imagePath);
    soundPath := PathToResourcesForKind(ResourceKind.SOUND_RESOURCE);
    AssertEquals("resources/sounds", soundPath);
end;
procedure TIntegrationTests.TestRegisterFreeNotifierIntegration;
begin
    freeNotifier := NotifierTracker.Create();
    RegisterFreeNotifier(freeNotifier.on_free);
    AssertTrue(freeNotifier.WasNotified);
    DeregisterFreeNotifier(freeNotifier.on_free);
    AssertFalse(freeNotifier.WasNotified);
end;
procedure TIntegrationTests.TestSetResourcesPathIntegration;
begin
    SetResourcesPath("/resources");
    AssertEquals("/resources", PathToResources());
    SetResourcesPath("/new/resources");
    AssertEquals("/new/resources", PathToResources());
end;
end;

procedure RegisterTests;
begin
#<Proc:0x00007f8aefd57268 /mnt/c/Users/Noahc/Documents/.Year 2 Semester 3/Team Project (A)/Github Repo/splashkit_test_generator/test_generator/config/languages/pascal_config.rb:113 (lambda)>
end;
