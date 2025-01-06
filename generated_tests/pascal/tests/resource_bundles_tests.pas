uses SplashKit, TestFramework, ../Helpers;
type
    TTestResourceBundles = class(TTestCase)
    protected
        procedure Setup; override;
    end;
begin
    inherited;
    SetResourcesPath('/mnt/c/Users/Noahc/Documents/aYear_2_semester_2/TeamProject/GitHubRepo/splashkit_test_generator/resources');
end;
procedure TestFreeResourceBundleIntegration;
begin
    LoadResourceBundle('Test Resource Bundle', 'test.txt');
    CleanupResource := TResourceCleanup.Create('Test Resource Bundle')
    AssertTrue(HasResourceBundle('Test Resource Bundle'));
    AssertTrue(HasBitmap('FrogBmp'));
    AssertTrue(HasFont('hara'));
    FreeResourceBundle('Test Resource Bundle');
    AssertFalse(HasResourceBundle('Test Resource Bundle'));
end;
procedure TestHasResourceBundleIntegration;
begin
    LoadResourceBundle('Test Resource Bundle', 'test.txt');
    CleanupResource := TResourceCleanup.Create('Test Resource Bundle')
    AssertTrue(HasResourceBundle('Test Resource Bundle'));
    FreeResourceBundle('Test Resource Bundle');
    AssertFalse(HasResourceBundle('Test Resource Bundle'));
    AssertFalse(HasResourceBundle('nonexistent'));
end;
procedure TestLoadResourceBundleIntegration;
begin
    LoadResourceBundle('Test Resource Bundle', 'test.txt');
    CleanupResource := TResourceCleanup.Create('Test Resource Bundle')
    AssertTrue(HasResourceBundle('Test Resource Bundle'));
    AssertTrue(HasAnimationScript('WalkingScript'));
    AssertTrue(HasBitmap('FrogBmp'));
    AssertTrue(HasFont('hara'));
    AssertTrue(HasSoundEffect('error'));
    AssertTrue(HasTimer('my timer'));
    AssertTrue(HasResourceBundle('blah'));
    FreeResourceBundle('Test Resource Bundle');
    AssertFalse(HasResourceBundle('test_bundle'));
end;
end;

procedure RegisterTests;
begin
    #<Proc:0x00007faa116e2450 /mnt/c/Users/Noahc/Documents/aYear_2_semester_2/TeamProject/GitHubRepo/splashkit_test_generator/test_generator/config/languages/pascal_config.rb:138 (lambda)>
end;
