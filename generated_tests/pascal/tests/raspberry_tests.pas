uses SplashKit, TestFramework

type
TTestRaspberry = class(TTestCase)
protected
procedure TIntegrationTests.TestHasGpioIntegration;
begin
    testGpioCapability := HasGpio();
    AssertTrue(testGpioCapability);
end;
procedure TIntegrationTests.TestRaspiCleanupIntegration;
begin
    RaspiInit();
    RaspiSetMode(Pins.PIN11, PinModes.GPIO_OUTPUT);
    RaspiWrite(Pins.PIN11, PinValues.GPIO_HIGH);
    RaspiCleanup();
    AssertEquals(PinModes.GPIO_INPUT, RaspiGetMode(Pins.PIN11));
    AssertEquals(PinValues.GPIO_LOW, RaspiRead(Pins.PIN11));
end;
procedure TIntegrationTests.TestRaspiGetModeIntegration;
begin
    RaspiInit();
    RaspiSetMode(Pins.PIN11, PinModes.GPIO_OUTPUT);
    testMode := RaspiGetMode(Pins.PIN11);
    AssertEquals(PinModes.GPIO_OUTPUT, testMode);
    RaspiCleanup();
end;
procedure TIntegrationTests.TestRaspiInitIntegration;
begin
    hasGpioCapability := HasGpio();
    RaspiInit();
    AssertTrue(HasGpio());
    RaspiCleanup();
    AssertFalse(HasGpio());
end;
procedure TIntegrationTests.TestRaspiReadIntegration;
begin
    RaspiInit();
    RaspiSetMode(Pins.PIN11, PinModes.GPIO_OUTPUT);
    RaspiWrite(Pins.PIN11, PinValues.GPIO_HIGH);
    testReadValue := RaspiRead(Pins.PIN11);
    AssertEquals(PinValues.GPIO_HIGH, testReadValue);
    RaspiCleanup();
end;
procedure TIntegrationTests.TestRaspiSetModeIntegration;
begin
    RaspiInit();
    RaspiSetMode(Pins.PIN11, PinModes.GPIO_OUTPUT);
    AssertEquals(PinModes.GPIO_OUTPUT, RaspiGetMode(Pins.PIN11));
    RaspiCleanup();
end;
procedure TIntegrationTests.TestRaspiSetPullUpDownIntegration;
begin
    RaspiInit();
    RaspiSetMode(Pins.PIN11, PinModes.GPIO_INPUT);
    RaspiSetPullUpDown(Pins.PIN11, PullUpDown.PUD_UP);
    testPinValueUp := RaspiRead(Pins.PIN11);
    AssertEquals(PinValues.GPIO_HIGH, testPinValueUp);
    RaspiSetPullUpDown(Pins.PIN11, PullUpDown.PUD_DOWN);
    testPinValueDown := RaspiRead(Pins.PIN11);
    AssertEquals(PinValues.GPIO_LOW, testPinValueDown);
    RaspiCleanup();
end;
procedure TIntegrationTests.TestRaspiSetPwmDutycycleIntegration;
begin
    RaspiInit();
    RaspiSetMode(Pins.PIN18, PinModes.GPIO_OUTPUT);
    RaspiSetPwmDutycycle(Pins.PIN18, 50);
    mode := RaspiGetMode(Pins.PIN18);
    AssertEquals(PinModes.GPIO_OUTPUT, mode);
    RaspiCleanup();
end;
procedure TIntegrationTests.TestRaspiSetPwmFrequencyIntegration;
begin
    RaspiInit();
    RaspiSetMode(Pins.PIN18, PinModes.GPIO_OUTPUT);
    RaspiSetPwmFrequency(Pins.PIN18, 1000);
    mode := RaspiGetMode(Pins.PIN18);
    AssertEquals(PinModes.GPIO_OUTPUT, mode);
    RaspiCleanup();
end;
procedure TIntegrationTests.TestRaspiSetPwmRangeIntegration;
begin
    RaspiInit();
    RaspiSetMode(Pins.PIN11, PinModes.GPIO_OUTPUT);
    RaspiSetPwmRange(Pins.PIN11, 1024);
    RaspiSetPwmDutycycle(Pins.PIN11, 512);
    mode := RaspiGetMode(Pins.PIN11);
    AssertEquals(PinModes.GPIO_OUTPUT, mode);
    RaspiCleanup();
end;
procedure TIntegrationTests.TestRaspiWriteIntegration;
begin
    RaspiInit();
    RaspiSetMode(Pins.PIN11, PinModes.GPIO_OUTPUT);
    RaspiWrite(Pins.PIN11, PinValues.GPIO_HIGH);
    testPinValue := RaspiRead(Pins.PIN11);
    AssertEquals(PinValues.GPIO_HIGH, testPinValue);
    RaspiCleanup();
end;
end;

procedure RegisterTests;
begin
#<Proc:0x00007f7a8f3c6228 /mnt/c/Users/Noahc/Documents/.Year 2 Semester 3/Team Project (A)/Github Repo/splashkit_test_generator/test_generator/config/languages/pascal_config.rb:117 (lambda)>
end;
