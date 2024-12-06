uses SplashKit, TestFramework

type
TIntegrationTests = class(TTestCase)
published
procedure TIntegrationTests.TestFreeResourceBundleIntegration;
begin
    LoadResourceBundle("test", "test.txt");
    AssertTrue(HasResourceBundle("test"));
    FreeResourceBundle("test");
    AssertFalse(HasResourceBundle("test"));
end;
procedure TIntegrationTests.TestHasResourceBundleIntegration;
begin
    LoadResourceBundle("test", "test.txt");
    AssertTrue(HasResourceBundle("test"));
    FreeResourceBundle("test");
    AssertFalse(HasResourceBundle("test"));
    AssertFalse(HasResourceBundle("nonexistent"));
end;
procedure TIntegrationTests.TestLoadResourceBundleIntegration;
begin
    LoadResourceBundle("test_bundle", "test_bundle.txt");
    AssertTrue(HasResourceBundle("test_bundle"));
    FreeResourceBundle("test_bundle");
    AssertFalse(HasResourceBundle("test_bundle"));
end;
end;

procedure RegisterTests;
begin
TestFramework.RegisterTest(TIntegrationTests.Suite);
end;
