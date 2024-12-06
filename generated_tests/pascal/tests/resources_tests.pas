uses SplashKit, TestFramework

type
TIntegrationTests = class(TTestCase)
published
procedure TIntegrationTests.TestDeregisterFreeNotifierIntegration;
begin
    RegisterFreeNotifier(testNotifier);
    DeregisterFreeNotifier(testNotifier);
    AssertNull(testNotifier);
end;
procedure TIntegrationTests.TestPathToResourceIntegration;
begin
    SetResourcesPath("resources");
    imagePath := PathToResource("test_image.png", ResourceKind.IMAGE_RESOURCE);
    AssertNotEquals(imagePath, "");
    textPath := PathToResource("nonexistent_file.txt", ResourceKind.ANIMATION_RESOURCE);
    AssertEquals(textPath, "");
end;
procedure TIntegrationTests.TestPathToResourcesIntegration;
begin
    resourcePath := PathToResources();
    AssertNotNull(resourcePath);
    SetResourcesPath("/new/resources");
    newResourcePath := PathToResources();
    AssertEquals(newResourcePath, "/new/resources");
end;
procedure TIntegrationTests.TestPathToResourcesForKindIntegration;
begin
    SetResourcesPath("resources");
    imagePath := PathToResources(ResourceKind.IMAGE_RESOURCE);
    AssertEquals(imagePath, "resources/images");
    soundPath := PathToResources(ResourceKind.SOUND_RESOURCE);
    AssertEquals(soundPath, "resources/sounds");
end;
procedure TIntegrationTests.TestRegisterFreeNotifierIntegration;
begin
    RegisterFreeNotifier(FreeNotifier());
    AssertTrue(notifierCalled);
    DeregisterFreeNotifier(FreeNotifier());
    AssertFalse(notifierCalled);
end;
procedure TIntegrationTests.TestSetResourcesPathIntegration;
begin
    SetResourcesPath("/resources");
    AssertEquals(PathToResources(), "/resources");
    SetResourcesPath("/new/resources");
    AssertEquals(PathToResources(), "/new/resources");
end;
end;

procedure RegisterTests;
begin
TestFramework.RegisterTest(TIntegrationTests.Suite);
end;
