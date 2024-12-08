uses SplashKit, TestFramework

type
TIntegrationTests = class(TTestCase)
published
procedure TIntegrationTests.TestHasGpioIntegration;
begin
    testGpioCapability := HasGpio();
    AssertTrue(testGpioCapability);
    testGpioCapability := HasGpio();
    AssertFalse(testGpioCapability);
end;
procedure TIntegrationTests.TestRaspiCleanupIntegration;
begin
    RaspiInit();
    RaspiSetMode(Pins.PIN_11, PinModes.GPIO_OUTPUT);
    RaspiWrite(Pins.PIN_11, PinValues.GPIO_HIGH);
    RaspiCleanup();
    AssertEquals(PinModes.GPIO_INPUT, RaspiGetMode(Pins.PIN_11));
    AssertEquals(PinValues.GPIO_LOW, RaspiRead(Pins.PIN_11));
end;
procedure TIntegrationTests.TestRaspiGetModeIntegration;
begin
    RaspiInit();
    RaspiSetMode(Pins.PIN_11, PinModes.GPIO_OUTPUT);
    testMode := RaspiGetMode(Pins.PIN_11);
    AssertEquals(PinModes.GPIO_OUTPUT, testMode);
    RaspiCleanup();
end;
procedure TIntegrationTests.TestRaspiInitIntegration;
begin
    hasGpioCapability := HasGpio();
if hasGpioCapability = true then
        RaspiInit();
        AssertTrue(HasGpio());
        RaspiCleanup();
end;
    else
        AssertFalse(HasGpio());
end;
end;
procedure TIntegrationTests.TestRaspiReadIntegration;
begin
    RaspiInit();
    RaspiSetMode(Pins.PIN_11, PinModes.GPIO_OUTPUT);
    RaspiWrite(Pins.PIN_11, PinValues.GPIO_HIGH);
    testReadValue := RaspiRead(Pins.PIN_11);
    AssertEquals(PinValues.GPIO_HIGH, testReadValue);
    RaspiCleanup();
end;
procedure TIntegrationTests.TestRaspiSetModeIntegration;
begin
    RaspiInit();
    RaspiSetMode(Pins.PIN_11, PinModes.GPIO_OUTPUT);
    AssertEquals(PinModes.GPIO_OUTPUT, RaspiGetMode(Pins.PIN_11));
    RaspiCleanup();
end;
procedure TIntegrationTests.TestRaspiSetPullUpDownIntegration;
begin
    RaspiInit();
    RaspiSetMode(Pins.PIN_11, PinModes.GPIO_INPUT);
    RaspiSetPullUpDown(Pins.PIN_11, PullUpDown.PUD_UP);
    testPinValue := RaspiRead(Pins.PIN_11);
    AssertEquals(PinValues.GPIO_HIGH, testPinValue);
    RaspiSetPullUpDown(Pins.PIN_11, PullUpDown.PUD_DOWN);
    testPinValue := RaspiRead(Pins.PIN_11);
    AssertEquals(PinValues.GPIO_LOW, testPinValue);
    RaspiCleanup();
end;
procedure TIntegrationTests.TestRaspiSetPwmDutycycleIntegration;
begin
    RaspiInit();
    RaspiSetMode(Pins.PIN_18, PinModes.PWM_OUTPUT);
    RaspiSetPwmDutycycle(Pins.PIN_18, 50);
    RaspiCleanup();
end;
procedure TIntegrationTests.TestRaspiSetPwmFrequencyIntegration;
begin
    RaspiInit();
    RaspiSetMode(Pins.PIN_18, PinModes.PWM_OUTPUT);
    RaspiSetPwmFrequency(Pins.PIN_18, 1000);
    RaspiCleanup();
end;
procedure TIntegrationTests.TestRaspiSetPwmRangeIntegration;
begin
    RaspiInit();
    RaspiSetMode(Pins.PIN_11, PinModes.GPIO_PWM);
    RaspiSetPwmRange(Pins.PIN_11, 1024);
    RaspiSetPwmDutycycle(Pins.PIN_11, 512);
    RaspiCleanup();
end;
procedure TIntegrationTests.TestRaspiWriteIntegration;
begin
    RaspiInit();
    RaspiSetMode(Pins.PIN_11, PinModes.GPIO_OUTPUT);
    RaspiWrite(Pins.PIN_11, PinValues.GPIO_HIGH);
    testPinValue := RaspiRead(Pins.PIN_11);
    AssertEquals(PinValues.GPIO_HIGH, testPinValue);
    RaspiCleanup();
end;
end;

procedure RegisterTests;
begin
TestFramework.RegisterTest(TIntegrationTests.Suite);
end;
