uses SplashKit, TestFramework

type
TTestResourceBundles = class(TTestCase)
protected
procedure TIntegrationTests.TestFreeResourceBundleIntegration;
begin
    LoadResourceBundle("test", "test.txt");
    AssertTrue(HasResourceBundle("test"));
    AssertTrue(HasBitmap("FrogBmp"));
    AssertTrue(HasFont("hara"));
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
    LoadResourceBundle("test", "test.txt");
    AssertTrue(HasResourceBundle("test"));
    AssertTrue(HasAnimationScript("WalkingScript"));
    AssertTrue(HasBitmap("FrogBmp"));
    AssertTrue(HasFont("hara"));
    AssertTrue(HasSoundEffect("error"));
    AssertTrue(HasTimer("my timer"));
    AssertTrue(HasResourceBundle("blah"));
    FreeResourceBundle("test");
    AssertFalse(HasResourceBundle("test_bundle"));
end;
end;

procedure RegisterTests;
begin
#<Proc:0x00007f7a8f3c6228 /mnt/c/Users/Noahc/Documents/.Year 2 Semester 3/Team Project (A)/Github Repo/splashkit_test_generator/test_generator/config/languages/pascal_config.rb:117 (lambda)>
end;
