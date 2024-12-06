uses SplashKit, TestFramework

type
TIntegrationTests = class(TTestCase)
published
procedure TIntegrationTests.TestDeregisterFreeNotifierIntegration;
begin
    register_free_notifier(testNotifier);
    deregister_free_notifier(testNotifier);
    AssertNull(testNotifier);
end;
procedure TIntegrationTests.TestPathToResourceIntegration;
begin
    set_resources_path("resources");
    imagePath := path_to_resource("test_image.png", ResourceKind.IMAGE_RESOURCE);
    AssertNotEquals(imagePath, "");
    textPath := path_to_resource("nonexistent_file.txt", ResourceKind.ANIMATION_RESOURCE);
    AssertEquals(textPath, "");
end;
procedure TIntegrationTests.TestPathToResourcesIntegration;
begin
    resourcePath := path_to_resources();
    AssertNotNull(resourcePath);
    set_resources_path("/new/resources");
    newResourcePath := path_to_resources();
    AssertEquals(newResourcePath, "/new/resources");
end;
procedure TIntegrationTests.TestPathToResourcesForKindIntegration;
begin
    set_resources_path("resources");
    imagePath := path_to_resources(ResourceKind.IMAGE_RESOURCE);
    AssertEquals(imagePath, "resources/images");
    soundPath := path_to_resources(ResourceKind.SOUND_RESOURCE);
    AssertEquals(soundPath, "resources/sounds");
end;
procedure TIntegrationTests.TestRegisterFreeNotifierIntegration;
begin
    register_free_notifier(free_notifier());
    AssertTrue(notifierCalled);
    deregister_free_notifier(free_notifier());
    AssertFalse(notifierCalled);
end;
procedure TIntegrationTests.TestSetResourcesPathIntegration;
begin
    set_resources_path("/resources");
    AssertEquals(path_to_resources(), "/resources");
    set_resources_path("/new/resources");
    AssertEquals(path_to_resources(), "/new/resources");
end;
end;

procedure RegisterTests;
begin
TestFramework.RegisterTest(TIntegrationTests.Suite);
end;
