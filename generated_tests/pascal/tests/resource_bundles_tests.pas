uses SplashKit, TestFramework

type
TIntegrationTests = class(TTestCase)
published
procedure TIntegrationTests.TestFreeResourceBundleIntegration;
begin
    load_resource_bundle("test", "test.txt");
    AssertTrue(has_resource_bundle("test"));
    free_resource_bundle("test");
    AssertFalse(has_resource_bundle("test"));
end;
procedure TIntegrationTests.TestHasResourceBundleIntegration;
begin
    load_resource_bundle("test", "test.txt");
    AssertTrue(has_resource_bundle("test"));
    free_resource_bundle("test");
    AssertFalse(has_resource_bundle("test"));
    AssertFalse(has_resource_bundle("nonexistent"));
end;
procedure TIntegrationTests.TestLoadResourceBundleIntegration;
begin
    load_resource_bundle("test_bundle", "test_bundle.txt");
    AssertTrue(has_resource_bundle("test_bundle"));
    free_resource_bundle("test_bundle");
    AssertFalse(has_resource_bundle("test_bundle"));
end;
end;

procedure RegisterTests;
begin
TestFramework.RegisterTest(TIntegrationTests.Suite);
end;
