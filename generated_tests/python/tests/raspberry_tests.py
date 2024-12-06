import pytest
from splashkit import *


def test_HasGpio_integration():
    test_gpio_capability = has_gpio()
    assert test_gpio_capability is True
    test_gpio_capability = has_gpio()
    assert test_gpio_capability is False


def test_RaspiCleanup_integration():
    raspi_init()
    raspi_set_mode(Pins.Pin11, PinModes.GpioOutput)
    raspi_write(Pins.Pin11, PinValues.GpioHigh)
    raspi_cleanup()
    assert raspi_get_mode(Pins.Pin11) == PinModes.GpioInput
    assert raspi_read(Pins.Pin11) == PinValues.GpioLow


def test_RaspiGetMode_integration():
    raspi_init()
    raspi_set_mode(Pins.Pin11, PinModes.GpioOutput)
    test_mode = raspi_get_mode(Pins.Pin11)
    assert test_mode == PinModes.GpioOutput
    raspi_cleanup()


def test_RaspiInit_integration():
    has_gpio_capability = has_gpio()
if assert has_gpio_capability is True
:
        raspi_init()
        assert has_gpio() is True
        raspi_cleanup()

    else:
        assert has_gpio() is False



def test_RaspiRead_integration():
    raspi_init()
    raspi_set_mode(Pins.Pin11, PinModes.GpioOutput)
    raspi_write(Pins.Pin11, PinValues.GpioHigh)
    test_read_value = raspi_read(Pins.Pin11)
    assert test_read_value == PinValues.GpioHigh
    raspi_cleanup()


def test_RaspiSetMode_integration():
    raspi_init()
    raspi_set_mode(Pins.Pin11, PinModes.GpioOutput)
    assert raspi_get_mode(Pins.Pin11) == PinModes.GpioOutput
    raspi_cleanup()


def test_RaspiSetPullUpDown_integration():
    raspi_init()
    raspi_set_mode(Pins.Pin11, PinModes.GpioInput)
    raspi_set_pull_up_down(Pins.Pin11, PullUpDown.PudUp)
    test_pin_value = raspi_read(Pins.Pin11)
    assert test_pin_value == PinValues.GpioHigh
    raspi_set_pull_up_down(Pins.Pin11, PullUpDown.PudDown)
    test_pin_value = raspi_read(Pins.Pin11)
    assert test_pin_value == PinValues.GpioLow
    raspi_cleanup()


def test_RaspiSetPwmDutycycle_integration():
    raspi_init()
    raspi_set_mode(Pins.Pin18, PinModes.PwmOutput)
    raspi_set_pwm_dutycycle(Pins.Pin18, 50)
    raspi_cleanup()


def test_RaspiSetPwmFrequency_integration():
    raspi_init()
    raspi_set_mode(Pins.Pin18, PinModes.PwmOutput)
    raspi_set_pwm_frequency(Pins.Pin18, 1000)
    raspi_cleanup()


def test_RaspiSetPwmRange_integration():
    raspi_init()
    raspi_set_mode(Pins.Pin11, PinModes.GpioPwm)
    raspi_set_pwm_range(Pins.Pin11, 1024)
    raspi_set_pwm_dutycycle(Pins.Pin11, 512)
    raspi_cleanup()


def test_RaspiWrite_integration():
    raspi_init()
    raspi_set_mode(Pins.Pin11, PinModes.GpioOutput)
    raspi_write(Pins.Pin11, PinValues.GpioHigh)
    test_pin_value = raspi_read(Pins.Pin11)
    assert test_pin_value == PinValues.GpioHigh
    raspi_cleanup()

