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
    LoadResourceBundle('test_resource_bundle', 'test.txt');
    CleanupResource := TResourceCleanup.Create('test_resource_bundle')
    AssertTrue(HasResourceBundle('test_resource_bundle'));
    AssertTrue(HasBitmap('FrogBmp'));
    AssertTrue(HasFont('hara'));
    FreeResourceBundle('test_resource_bundle');
    AssertFalse(HasResourceBundle('test_resource_bundle'));
end;
procedure TestHasResourceBundleIntegration;
begin
    LoadResourceBundle('test_resource_bundle', 'test.txt');
    CleanupResource := TResourceCleanup.Create('test_resource_bundle')
    AssertTrue(HasResourceBundle('test_resource_bundle'));
    FreeResourceBundle('test_resource_bundle');
    AssertFalse(HasResourceBundle('test_resource_bundle'));
    AssertFalse(HasResourceBundle('nonexistent'));
end;
procedure TestLoadResourceBundleIntegration;
begin
    LoadResourceBundle('test_resource_bundle', 'test.txt');
    CleanupResource := TResourceCleanup.Create('test_resource_bundle')
    AssertTrue(HasResourceBundle('test_resource_bundle'));
    AssertTrue(HasAnimationScript('WalkingScript'));
    AssertTrue(HasBitmap('FrogBmp'));
    AssertTrue(HasFont('hara'));
    AssertTrue(HasSoundEffect('error'));
    AssertTrue(HasTimer('my timer'));
    AssertTrue(HasResourceBundle('blah'));
    FreeResourceBundle('test_resource_bundle');
    AssertFalse(HasResourceBundle('test_bundle'));
end;
end;

procedure RegisterTests;
begin
    #<Proc:0x00007fbbcab52da8 /mnt/c/Users/Noahc/Documents/aYear_2_semester_2/TeamProject/GitHubRepo/splashkit_test_generator/test_generator/config/languages/pascal_config.rb:138 (lambda)>
end;
