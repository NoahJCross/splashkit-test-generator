uses SplashKit, TestFramework

type
TIntegrationTests = class(TTestCase)
published
procedure TIntegrationTests.TestHasGpioIntegration;
begin
    testGpioCapability := has_gpio();
    AssertTrue(testGpioCapability);
    testGpioCapability := has_gpio();
    AssertFalse(testGpioCapability);
end;
procedure TIntegrationTests.TestRaspiCleanupIntegration;
begin
    raspi_init();
    raspi_set_mode(Pins.PIN_11, PinModes.GPIO_OUTPUT);
    raspi_write(Pins.PIN_11, PinValues.GPIO_HIGH);
    raspi_cleanup();
    AssertEquals(raspi_get_mode(Pins.PIN_11), PinModes.GPIO_INPUT);
    AssertEquals(raspi_read(Pins.PIN_11), PinValues.GPIO_LOW);
end;
procedure TIntegrationTests.TestRaspiGetModeIntegration;
begin
    raspi_init();
    raspi_set_mode(Pins.PIN_11, PinModes.GPIO_OUTPUT);
    testMode := raspi_get_mode(Pins.PIN_11);
    AssertEquals(testMode, PinModes.GPIO_OUTPUT);
    raspi_cleanup();
end;
procedure TIntegrationTests.TestRaspiInitIntegration;
begin
    hasGpioCapability := has_gpio();
if AssertTrue(hasGpioCapability);
 then
        raspi_init();
        AssertTrue(has_gpio());
        raspi_cleanup();
end;
    else
        AssertFalse(has_gpio());
end;
end;
procedure TIntegrationTests.TestRaspiReadIntegration;
begin
    raspi_init();
    raspi_set_mode(Pins.PIN_11, PinModes.GPIO_OUTPUT);
    raspi_write(Pins.PIN_11, PinValues.GPIO_HIGH);
    testReadValue := raspi_read(Pins.PIN_11);
    AssertEquals(testReadValue, PinValues.GPIO_HIGH);
    raspi_cleanup();
end;
procedure TIntegrationTests.TestRaspiSetModeIntegration;
begin
    raspi_init();
    raspi_set_mode(Pins.PIN_11, PinModes.GPIO_OUTPUT);
    AssertEquals(raspi_get_mode(Pins.PIN_11), PinModes.GPIO_OUTPUT);
    raspi_cleanup();
end;
procedure TIntegrationTests.TestRaspiSetPullUpDownIntegration;
begin
    raspi_init();
    raspi_set_mode(Pins.PIN_11, PinModes.GPIO_INPUT);
    raspi_set_pull_up_down(Pins.PIN_11, PullUpDown.PUD_UP);
    testPinValue := raspi_read(Pins.PIN_11);
    AssertEquals(testPinValue, PinValues.GPIO_HIGH);
    raspi_set_pull_up_down(Pins.PIN_11, PullUpDown.PUD_DOWN);
    testPinValue := raspi_read(Pins.PIN_11);
    AssertEquals(testPinValue, PinValues.GPIO_LOW);
    raspi_cleanup();
end;
procedure TIntegrationTests.TestRaspiSetPwmDutycycleIntegration;
begin
    raspi_init();
    raspi_set_mode(Pins.PIN_18, PinModes.PWM_OUTPUT);
    raspi_set_pwm_dutycycle(Pins.PIN_18, 50);
    raspi_cleanup();
end;
procedure TIntegrationTests.TestRaspiSetPwmFrequencyIntegration;
begin
    raspi_init();
    raspi_set_mode(Pins.PIN_18, PinModes.PWM_OUTPUT);
    raspi_set_pwm_frequency(Pins.PIN_18, 1000);
    raspi_cleanup();
end;
procedure TIntegrationTests.TestRaspiSetPwmRangeIntegration;
begin
    raspi_init();
    raspi_set_mode(Pins.PIN_11, PinModes.GPIO_PWM);
    raspi_set_pwm_range(Pins.PIN_11, 1024);
    raspi_set_pwm_dutycycle(Pins.PIN_11, 512);
    raspi_cleanup();
end;
procedure TIntegrationTests.TestRaspiWriteIntegration;
begin
    raspi_init();
    raspi_set_mode(Pins.PIN_11, PinModes.GPIO_OUTPUT);
    raspi_write(Pins.PIN_11, PinValues.GPIO_HIGH);
    testPinValue := raspi_read(Pins.PIN_11);
    AssertEquals(testPinValue, PinValues.GPIO_HIGH);
    raspi_cleanup();
end;
end;

procedure RegisterTests;
begin
TestFramework.RegisterTest(TIntegrationTests.Suite);
end;
