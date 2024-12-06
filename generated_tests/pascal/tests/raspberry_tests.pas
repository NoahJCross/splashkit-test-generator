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
    AssertEquals(RaspiGetMode(Pins.PIN_11), PinModes.GPIO_INPUT);
    AssertEquals(RaspiRead(Pins.PIN_11), PinValues.GPIO_LOW);
end;
procedure TIntegrationTests.TestRaspiGetModeIntegration;
begin
    RaspiInit();
    RaspiSetMode(Pins.PIN_11, PinModes.GPIO_OUTPUT);
    testMode := RaspiGetMode(Pins.PIN_11);
    AssertEquals(testMode, PinModes.GPIO_OUTPUT);
    RaspiCleanup();
end;
procedure TIntegrationTests.TestRaspiInitIntegration;
begin
    hasGpioCapability := HasGpio();
if AssertTrue(hasGpioCapability);
 then
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
    AssertEquals(testReadValue, PinValues.GPIO_HIGH);
    RaspiCleanup();
end;
procedure TIntegrationTests.TestRaspiSetModeIntegration;
begin
    RaspiInit();
    RaspiSetMode(Pins.PIN_11, PinModes.GPIO_OUTPUT);
    AssertEquals(RaspiGetMode(Pins.PIN_11), PinModes.GPIO_OUTPUT);
    RaspiCleanup();
end;
procedure TIntegrationTests.TestRaspiSetPullUpDownIntegration;
begin
    RaspiInit();
    RaspiSetMode(Pins.PIN_11, PinModes.GPIO_INPUT);
    RaspiSetPullUpDown(Pins.PIN_11, PullUpDown.PUD_UP);
    testPinValue := RaspiRead(Pins.PIN_11);
    AssertEquals(testPinValue, PinValues.GPIO_HIGH);
    RaspiSetPullUpDown(Pins.PIN_11, PullUpDown.PUD_DOWN);
    testPinValue := RaspiRead(Pins.PIN_11);
    AssertEquals(testPinValue, PinValues.GPIO_LOW);
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
    AssertEquals(testPinValue, PinValues.GPIO_HIGH);
    RaspiCleanup();
end;
end;

procedure RegisterTests;
begin
TestFramework.RegisterTest(TIntegrationTests.Suite);
end;
