uses SplashKit, TestFramework, ../Helpers;
type
    TTestRaspberry = class(TTestCase)
    protected
        procedure Setup; override;
    end;
    procedure TestHasGpioIntegration;
begin
    testGpioCapability := HasGpio();
    AssertTrue(testGpioCapability);
end;
procedure TestRaspiCleanupIntegration;
begin
    RaspiInit();
    CleanupRaspi := TRaspiCleanup.Create;
    RaspiSetMode(Pins.PIN11, PinModes.GPIO_OUTPUT);
    RaspiWrite(Pins.PIN11, PinValues.GPIO_HIGH);
    RaspiCleanup();
    RaspiInit();
    AssertEquals(PinModes.GPIO_INPUT, RaspiGetMode(Pins.PIN11));
    AssertEquals(PinValues.GPIO_LOW, RaspiRead(Pins.PIN11));
end;
procedure TestRaspiGetModeIntegration;
begin
    RaspiInit();
    CleanupRaspi := TRaspiCleanup.Create;
    RaspiSetMode(Pins.PIN11, PinModes.GPIO_OUTPUT);
    testMode := RaspiGetMode(Pins.PIN11);
    AssertEquals(PinModes.GPIO_OUTPUT, testMode);
end;
procedure TestRaspiInitIntegration;
begin
    RaspiInit();
    CleanupRaspi := TRaspiCleanup.Create;
    AssertTrue(HasGpio());
end;
procedure TestRaspiReadIntegration;
begin
    RaspiInit();
    CleanupRaspi := TRaspiCleanup.Create;
    RaspiSetMode(Pins.PIN11, PinModes.GPIO_OUTPUT);
    RaspiWrite(Pins.PIN11, PinValues.GPIO_HIGH);
    testReadValue := RaspiRead(Pins.PIN11);
    AssertEquals(PinValues.GPIO_HIGH, testReadValue);
end;
procedure TestRaspiSetModeIntegration;
begin
    RaspiInit();
    CleanupRaspi := TRaspiCleanup.Create;
    RaspiSetMode(Pins.PIN11, PinModes.GPIO_OUTPUT);
    AssertEquals(PinModes.GPIO_OUTPUT, RaspiGetMode(Pins.PIN11));
end;
procedure TestRaspiSetPullUpDownIntegration;
begin
    RaspiInit();
    CleanupRaspi := TRaspiCleanup.Create;
    RaspiSetMode(Pins.PIN11, PinModes.GPIO_INPUT);
    RaspiSetPullUpDown(Pins.PIN11, PullUpDown.PUD_UP);
    testPinValueUp := RaspiRead(Pins.PIN11);
    AssertEquals(PinValues.GPIO_HIGH, testPinValueUp);
    RaspiSetPullUpDown(Pins.PIN11, PullUpDown.PUD_DOWN);
    testPinValueDown := RaspiRead(Pins.PIN11);
    AssertEquals(PinValues.GPIO_LOW, testPinValueDown);
end;
procedure TestRaspiSetPwmDutycycleIntegration;
begin
    RaspiInit();
    CleanupRaspi := TRaspiCleanup.Create;
    RaspiSetMode(Pins.PIN18, PinModes.GPIO_OUTPUT);
    RaspiSetPwmDutycycle(Pins.PIN18, 50);
    mode := RaspiGetMode(Pins.PIN18);
    AssertEquals(PinModes.GPIO_OUTPUT, mode);
end;
procedure TestRaspiSetPwmFrequencyIntegration;
begin
    RaspiInit();
    CleanupRaspi := TRaspiCleanup.Create;
    RaspiSetMode(Pins.PIN18, PinModes.GPIO_PWM);
    RaspiSetPwmFrequency(Pins.PIN18, 1000);
    mode := RaspiGetMode(Pins.PIN18);
    AssertEquals(PinModes.GPIO_PWM, mode);
end;
procedure TestRaspiSetPwmRangeIntegration;
begin
    RaspiInit();
    CleanupRaspi := TRaspiCleanup.Create;
    RaspiSetMode(Pins.PIN11, PinModes.GPIO_OUTPUT);
    RaspiSetPwmRange(Pins.PIN11, 1024);
    RaspiSetPwmDutycycle(Pins.PIN11, 512);
    mode := RaspiGetMode(Pins.PIN11);
    AssertEquals(PinModes.GPIO_OUTPUT, mode);
end;
procedure TestRaspiWriteIntegration;
begin
    RaspiInit();
    CleanupRaspi := TRaspiCleanup.Create;
    RaspiSetMode(Pins.PIN11, PinModes.GPIO_OUTPUT);
    RaspiWrite(Pins.PIN11, PinValues.GPIO_HIGH);
    testPinValue := RaspiRead(Pins.PIN11);
    AssertEquals(PinValues.GPIO_HIGH, testPinValue);
end;
end;

procedure RegisterTests;
begin
    #<Proc:0x00007faa116e2450 /mnt/c/Users/Noahc/Documents/aYear_2_semester_2/TeamProject/GitHubRepo/splashkit_test_generator/test_generator/config/languages/pascal_config.rb:138 (lambda)>
end;
