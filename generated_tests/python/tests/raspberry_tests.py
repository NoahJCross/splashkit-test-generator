import pytest
from splashkit import *


def test_HasGpio_integration():
    test_gpio_capability = HasGpio()
    assert test_gpio_capability is True
    test_gpio_capability = HasGpio()
    assert test_gpio_capability is False


def test_RaspiCleanup_integration():
    RaspiInit()
    RaspiSetMode(Pins.Pin11, PinModes.GpioOutput)
    RaspiWrite(Pins.Pin11, PinValues.GpioHigh)
    RaspiCleanup()
    assert RaspiGetMode(Pins.Pin11) == PinModes.GpioInput
    assert RaspiRead(Pins.Pin11) == PinValues.GpioLow


def test_RaspiGetMode_integration():
    RaspiInit()
    RaspiSetMode(Pins.Pin11, PinModes.GpioOutput)
    test_mode = RaspiGetMode(Pins.Pin11)
    assert test_mode == PinModes.GpioOutput
    RaspiCleanup()


def test_RaspiInit_integration():
    has_gpio_capability = HasGpio()
if assert has_gpio_capability is True
:
        RaspiInit()
        assert HasGpio() is True
        RaspiCleanup()

    else:
        assert HasGpio() is False



def test_RaspiRead_integration():
    RaspiInit()
    RaspiSetMode(Pins.Pin11, PinModes.GpioOutput)
    RaspiWrite(Pins.Pin11, PinValues.GpioHigh)
    test_read_value = RaspiRead(Pins.Pin11)
    assert test_read_value == PinValues.GpioHigh
    RaspiCleanup()


def test_RaspiSetMode_integration():
    RaspiInit()
    RaspiSetMode(Pins.Pin11, PinModes.GpioOutput)
    assert RaspiGetMode(Pins.Pin11) == PinModes.GpioOutput
    RaspiCleanup()


def test_RaspiSetPullUpDown_integration():
    RaspiInit()
    RaspiSetMode(Pins.Pin11, PinModes.GpioInput)
    RaspiSetPullUpDown(Pins.Pin11, PullUpDown.PudUp)
    test_pin_value = RaspiRead(Pins.Pin11)
    assert test_pin_value == PinValues.GpioHigh
    RaspiSetPullUpDown(Pins.Pin11, PullUpDown.PudDown)
    test_pin_value = RaspiRead(Pins.Pin11)
    assert test_pin_value == PinValues.GpioLow
    RaspiCleanup()


def test_RaspiSetPwmDutycycle_integration():
    RaspiInit()
    RaspiSetMode(Pins.Pin18, PinModes.PwmOutput)
    RaspiSetPwmDutycycle(Pins.Pin18, 50)
    RaspiCleanup()


def test_RaspiSetPwmFrequency_integration():
    RaspiInit()
    RaspiSetMode(Pins.Pin18, PinModes.PwmOutput)
    RaspiSetPwmFrequency(Pins.Pin18, 1000)
    RaspiCleanup()


def test_RaspiSetPwmRange_integration():
    RaspiInit()
    RaspiSetMode(Pins.Pin11, PinModes.GpioPwm)
    RaspiSetPwmRange(Pins.Pin11, 1024)
    RaspiSetPwmDutycycle(Pins.Pin11, 512)
    RaspiCleanup()


def test_RaspiWrite_integration():
    RaspiInit()
    RaspiSetMode(Pins.Pin11, PinModes.GpioOutput)
    RaspiWrite(Pins.Pin11, PinValues.GpioHigh)
    test_pin_value = RaspiRead(Pins.Pin11)
    assert test_pin_value == PinValues.GpioHigh
    RaspiCleanup()

