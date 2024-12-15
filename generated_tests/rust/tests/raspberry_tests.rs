use std::*;
use splashkit::*;
#[cfg(test)]
mod test_raspberry {
use super::*;
#[test]
fn test_has_gpio_integration() {
    let test_gpio_capability = has_gpio();
    assert!(test_gpio_capability);
}
#[test]
fn test_raspi_cleanup_integration() {
    raspi_init();
    raspi_set_mode(Pins::Pin11, PinModes::GpioOutput);
    raspi_write(Pins::Pin11, PinValues::GpioHigh);
    raspi_cleanup();
    assert_eq!(PinModes::GpioInput, raspi_get_mode(Pins::Pin11));
    assert_eq!(PinValues::GpioLow, raspi_read(Pins::Pin11));
}
#[test]
fn test_raspi_get_mode_integration() {
    raspi_init();
    raspi_set_mode(Pins::Pin11, PinModes::GpioOutput);
    let test_mode = raspi_get_mode(Pins::Pin11);
    assert_eq!(PinModes::GpioOutput, test_mode);
    raspi_cleanup();
}
#[test]
fn test_raspi_init_integration() {
    let has_gpio_capability = has_gpio();
    raspi_init();
    assert!(has_gpio());
    raspi_cleanup();
    assert!(!has_gpio());
}
#[test]
fn test_raspi_read_integration() {
    raspi_init();
    raspi_set_mode(Pins::Pin11, PinModes::GpioOutput);
    raspi_write(Pins::Pin11, PinValues::GpioHigh);
    let test_read_value = raspi_read(Pins::Pin11);
    assert_eq!(PinValues::GpioHigh, test_read_value);
    raspi_cleanup();
}
#[test]
fn test_raspi_set_mode_integration() {
    raspi_init();
    raspi_set_mode(Pins::Pin11, PinModes::GpioOutput);
    assert_eq!(PinModes::GpioOutput, raspi_get_mode(Pins::Pin11));
    raspi_cleanup();
}
#[test]
fn test_raspi_set_pull_up_down_integration() {
    raspi_init();
    raspi_set_mode(Pins::Pin11, PinModes::GpioInput);
    raspi_set_pull_up_down(Pins::Pin11, PullUpDown::PudUp);
    let test_pin_value_up = raspi_read(Pins::Pin11);
    assert_eq!(PinValues::GpioHigh, test_pin_value_up);
    raspi_set_pull_up_down(Pins::Pin11, PullUpDown::PudDown);
    let test_pin_value_down = raspi_read(Pins::Pin11);
    assert_eq!(PinValues::GpioLow, test_pin_value_down);
    raspi_cleanup();
}
#[test]
fn test_raspi_set_pwm_dutycycle_integration() {
    raspi_init();
    raspi_set_mode(Pins::Pin18, PinModes::GpioOutput);
    raspi_set_pwm_dutycycle(Pins::Pin18, 50);
    let mode = raspi_get_mode(Pins::Pin18);
    assert_eq!(PinModes::GpioOutput, mode);
    raspi_cleanup();
}
#[test]
fn test_raspi_set_pwm_frequency_integration() {
    raspi_init();
    raspi_set_mode(Pins::Pin18, PinModes::GpioOutput);
    raspi_set_pwm_frequency(Pins::Pin18, 1000);
    let mode = raspi_get_mode(Pins::Pin18);
    assert_eq!(PinModes::GpioOutput, mode);
    raspi_cleanup();
}
#[test]
fn test_raspi_set_pwm_range_integration() {
    raspi_init();
    raspi_set_mode(Pins::Pin11, PinModes::GpioOutput);
    raspi_set_pwm_range(Pins::Pin11, 1024);
    raspi_set_pwm_dutycycle(Pins::Pin11, 512);
    let mode = raspi_get_mode(Pins::Pin11);
    assert_eq!(PinModes::GpioOutput, mode);
    raspi_cleanup();
}
#[test]
fn test_raspi_write_integration() {
    raspi_init();
    raspi_set_mode(Pins::Pin11, PinModes::GpioOutput);
    raspi_write(Pins::Pin11, PinValues::GpioHigh);
    let test_pin_value = raspi_read(Pins::Pin11);
    assert_eq!(PinValues::GpioHigh, test_pin_value);
    raspi_cleanup();
}
}
