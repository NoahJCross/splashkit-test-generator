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
    imagePath := PathToResources(ResourceKind.IMAGE_RESOURCE);
    AssertEquals("resources/images", imagePath);
    soundPath := PathToResources(ResourceKind.SOUND_RESOURCE);
    AssertEquals("resources/sounds", soundPath);
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
    AssertEquals("/resources", PathToResources());
    SetResourcesPath("/new/resources");
    AssertEquals("/new/resources", PathToResources());
end;
end;

procedure RegisterTests;
begin
TestFramework.RegisterTest(TIntegrationTests.Suite);
end;
