import pytest
from splashkit import *
from ..helpers import *
import contextlib
class TestRaspberry:
    def test_has_gpio_integration():
        test_gpio_capability = has_gpio()
        assert test_gpio_capability
        
    def test_raspi_cleanup_integration():
        raspi_init()
        with raspi_cleanup():
            raspi_set_mode(Pins.Pin11, PinModes.GpioOutput)
            raspi_write(Pins.Pin11, PinValues.GpioHigh)
            raspi_cleanup()
            assert PinModes.GpioInput == raspi_get_mode(Pins.Pin11)
            assert PinValues.GpioLow == raspi_read(Pins.Pin11)
            
    def test_raspi_get_mode_integration():
        raspi_init()
        with raspi_cleanup():
            raspi_set_mode(Pins.Pin11, PinModes.GpioOutput)
            test_mode = raspi_get_mode(Pins.Pin11)
            assert PinModes.GpioOutput == test_mode
            
    def test_raspi_init_integration():
        has_gpio_capability = has_gpio()
        raspi_init()
        with raspi_cleanup():
            assert has_gpio()
            raspi_cleanup()
            assert not has_gpio()
            
    def test_raspi_read_integration():
        raspi_init()
        with raspi_cleanup():
            raspi_set_mode(Pins.Pin11, PinModes.GpioOutput)
            raspi_write(Pins.Pin11, PinValues.GpioHigh)
            test_read_value = raspi_read(Pins.Pin11)
            assert PinValues.GpioHigh == test_read_value
            
    def test_raspi_set_mode_integration():
        raspi_init()
        with raspi_cleanup():
            raspi_set_mode(Pins.Pin11, PinModes.GpioOutput)
            assert PinModes.GpioOutput == raspi_get_mode(Pins.Pin11)
            
    def test_raspi_set_pull_up_down_integration():
        raspi_init()
        with raspi_cleanup():
            raspi_set_mode(Pins.Pin11, PinModes.GpioInput)
            raspi_set_pull_up_down(Pins.Pin11, PullUpDown.PudUp)
            test_pin_value_up = raspi_read(Pins.Pin11)
            assert PinValues.GpioHigh == test_pin_value_up
            raspi_set_pull_up_down(Pins.Pin11, PullUpDown.PudDown)
            test_pin_value_down = raspi_read(Pins.Pin11)
            assert PinValues.GpioLow == test_pin_value_down
            
    def test_raspi_set_pwm_dutycycle_integration():
        raspi_init()
        with raspi_cleanup():
            raspi_set_mode(Pins.Pin18, PinModes.GpioOutput)
            raspi_set_pwm_dutycycle(Pins.Pin18, 50)
            mode = raspi_get_mode(Pins.Pin18)
            assert PinModes.GpioOutput == mode
            
    def test_raspi_set_pwm_frequency_integration():
        raspi_init()
        with raspi_cleanup():
            raspi_set_mode(Pins.Pin18, PinModes.GpioOutput)
            raspi_set_pwm_frequency(Pins.Pin18, 1000)
            mode = raspi_get_mode(Pins.Pin18)
            assert PinModes.GpioOutput == mode
            
    def test_raspi_set_pwm_range_integration():
        raspi_init()
        with raspi_cleanup():
            raspi_set_mode(Pins.Pin11, PinModes.GpioOutput)
            raspi_set_pwm_range(Pins.Pin11, 1024)
            raspi_set_pwm_dutycycle(Pins.Pin11, 512)
            mode = raspi_get_mode(Pins.Pin11)
            assert PinModes.GpioOutput == mode
            
    def test_raspi_write_integration():
        raspi_init()
        with raspi_cleanup():
            raspi_set_mode(Pins.Pin11, PinModes.GpioOutput)
            raspi_write(Pins.Pin11, PinValues.GpioHigh)
            test_pin_value = raspi_read(Pins.Pin11)
            assert PinValues.GpioHigh == test_pin_value
            
