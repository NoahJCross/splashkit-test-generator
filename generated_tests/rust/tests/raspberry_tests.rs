use splashkit::*;
#[cfg(test)]
mod test_runner {
    pub fn run_tests_sequential(tests: &[&dyn Fn()]) {
        for test in tests {
            test();
        }
    }
}
#![test_runner(test_runner::run_tests_sequential)]
#[test]
fn test_has_gpio_integration() {
    let test_gpio_capability = has_gpio();
    assert!(test_gpio_capability);
    let test_gpio_capability = has_gpio();
    assert!(!test_gpio_capability);
}
#[test]
fn test_raspi_cleanup_integration() {
    raspi_init();
    raspi_set_mode(Pins::Pin11, PinModes::GpioOutput);
    raspi_write(Pins::Pin11, PinValues::GpioHigh);
    raspi_cleanup();
    assert_eq!(raspi_get_mode(Pins::Pin11), PinModes::GpioInput);
    assert_eq!(raspi_read(Pins::Pin11), PinValues::GpioLow);
}
#[test]
fn test_raspi_get_mode_integration() {
    raspi_init();
    raspi_set_mode(Pins::Pin11, PinModes::GpioOutput);
    let test_mode = raspi_get_mode(Pins::Pin11);
    assert_eq!(test_mode, PinModes::GpioOutput);
    raspi_cleanup();
}
#[test]
fn test_raspi_init_integration() {
    let has_gpio_capability = has_gpio();
if assert!(has_gpio_capability);
 {
        raspi_init();
        assert!(has_gpio());
        raspi_cleanup();
}
    else {
        assert!(!has_gpio());
}
}
#[test]
fn test_raspi_read_integration() {
    raspi_init();
    raspi_set_mode(Pins::Pin11, PinModes::GpioOutput);
    raspi_write(Pins::Pin11, PinValues::GpioHigh);
    let test_read_value = raspi_read(Pins::Pin11);
    assert_eq!(test_read_value, PinValues::GpioHigh);
    raspi_cleanup();
}
#[test]
fn test_raspi_set_mode_integration() {
    raspi_init();
    raspi_set_mode(Pins::Pin11, PinModes::GpioOutput);
    assert_eq!(raspi_get_mode(Pins::Pin11), PinModes::GpioOutput);
    raspi_cleanup();
}
#[test]
fn test_raspi_set_pull_up_down_integration() {
    raspi_init();
    raspi_set_mode(Pins::Pin11, PinModes::GpioInput);
    raspi_set_pull_up_down(Pins::Pin11, PullUpDown::PudUp);
    let test_pin_value = raspi_read(Pins::Pin11);
    assert_eq!(test_pin_value, PinValues::GpioHigh);
    raspi_set_pull_up_down(Pins::Pin11, PullUpDown::PudDown);
    let test_pin_value = raspi_read(Pins::Pin11);
    assert_eq!(test_pin_value, PinValues::GpioLow);
    raspi_cleanup();
}
#[test]
fn test_raspi_set_pwm_dutycycle_integration() {
    raspi_init();
    raspi_set_mode(Pins::Pin18, PinModes::PwmOutput);
    raspi_set_pwm_dutycycle(Pins::Pin18, 50);
    raspi_cleanup();
}
#[test]
fn test_raspi_set_pwm_frequency_integration() {
    raspi_init();
    raspi_set_mode(Pins::Pin18, PinModes::PwmOutput);
    raspi_set_pwm_frequency(Pins::Pin18, 1000);
    raspi_cleanup();
}
#[test]
fn test_raspi_set_pwm_range_integration() {
    raspi_init();
    raspi_set_mode(Pins::Pin11, PinModes::GpioPwm);
    raspi_set_pwm_range(Pins::Pin11, 1024);
    raspi_set_pwm_dutycycle(Pins::Pin11, 512);
    raspi_cleanup();
}
#[test]
fn test_raspi_write_integration() {
    raspi_init();
    raspi_set_mode(Pins::Pin11, PinModes::GpioOutput);
    raspi_write(Pins::Pin11, PinValues::GpioHigh);
    let test_pin_value = raspi_read(Pins::Pin11);
    assert_eq!(test_pin_value, PinValues::GpioHigh);
    raspi_cleanup();
}
