#include "splashkit.h"
#include <catch2/catch.hpp>

TEST_CASE("has_gpio_integration") {
    auto test_gpio_capability = has_gpio();
    REQUIRE(test_gpio_capability);
    auto test_gpio_capability = has_gpio();
    REQUIRE_FALSE(test_gpio_capability);
}
TEST_CASE("raspi_cleanup_integration") {
    raspi_init();
    raspi_set_mode(Pins::PIN_11, PinModes::GPIO_OUTPUT);
    raspi_write(Pins::PIN_11, PinValues::GPIO_HIGH);
    raspi_cleanup();
    REQUIRE(raspi_get_mode(Pins::PIN_11) == PinModes::GPIO_INPUT);
    REQUIRE(raspi_read(Pins::PIN_11) == PinValues::GPIO_LOW);
}
TEST_CASE("raspi_get_mode_integration") {
    raspi_init();
    raspi_set_mode(Pins::PIN_11, PinModes::GPIO_OUTPUT);
    auto test_mode = raspi_get_mode(Pins::PIN_11);
    REQUIRE(test_mode == PinModes::GPIO_OUTPUT);
    raspi_cleanup();
}
TEST_CASE("raspi_init_integration") {
    auto has_gpio_capability = has_gpio();
if (REQUIRE(has_gpio_capability);
) {
        raspi_init();
        REQUIRE(has_gpio());
        raspi_cleanup();
}
    else {
        REQUIRE_FALSE(has_gpio());
}
}
TEST_CASE("raspi_read_integration") {
    raspi_init();
    raspi_set_mode(Pins::PIN_11, PinModes::GPIO_OUTPUT);
    raspi_write(Pins::PIN_11, PinValues::GPIO_HIGH);
    auto test_read_value = raspi_read(Pins::PIN_11);
    REQUIRE(test_read_value == PinValues::GPIO_HIGH);
    raspi_cleanup();
}
TEST_CASE("raspi_set_mode_integration") {
    raspi_init();
    raspi_set_mode(Pins::PIN_11, PinModes::GPIO_OUTPUT);
    REQUIRE(raspi_get_mode(Pins::PIN_11) == PinModes::GPIO_OUTPUT);
    raspi_cleanup();
}
TEST_CASE("raspi_set_pull_up_down_integration") {
    raspi_init();
    raspi_set_mode(Pins::PIN_11, PinModes::GPIO_INPUT);
    raspi_set_pull_up_down(Pins::PIN_11, PullUpDown::PUD_UP);
    auto test_pin_value = raspi_read(Pins::PIN_11);
    REQUIRE(test_pin_value == PinValues::GPIO_HIGH);
    raspi_set_pull_up_down(Pins::PIN_11, PullUpDown::PUD_DOWN);
    auto test_pin_value = raspi_read(Pins::PIN_11);
    REQUIRE(test_pin_value == PinValues::GPIO_LOW);
    raspi_cleanup();
}
TEST_CASE("raspi_set_pwm_dutycycle_integration") {
    raspi_init();
    raspi_set_mode(Pins::PIN_18, PinModes::PWM_OUTPUT);
    raspi_set_pwm_dutycycle(Pins::PIN_18, 50);
    raspi_cleanup();
}
TEST_CASE("raspi_set_pwm_frequency_integration") {
    raspi_init();
    raspi_set_mode(Pins::PIN_18, PinModes::PWM_OUTPUT);
    raspi_set_pwm_frequency(Pins::PIN_18, 1000);
    raspi_cleanup();
}
TEST_CASE("raspi_set_pwm_range_integration") {
    raspi_init();
    raspi_set_mode(Pins::PIN_11, PinModes::GPIO_PWM);
    raspi_set_pwm_range(Pins::PIN_11, 1024);
    raspi_set_pwm_dutycycle(Pins::PIN_11, 512);
    raspi_cleanup();
}
TEST_CASE("raspi_write_integration") {
    raspi_init();
    raspi_set_mode(Pins::PIN_11, PinModes::GPIO_OUTPUT);
    raspi_write(Pins::PIN_11, PinValues::GPIO_HIGH);
    auto test_pin_value = raspi_read(Pins::PIN_11);
    REQUIRE(test_pin_value == PinValues::GPIO_HIGH);
    raspi_cleanup();
}
