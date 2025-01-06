#include <catch2/catch_all.hpp>
#include <limits>
#include "splashkit.h"
#include "../helpers.hpp"
struct TestRaspberryFixture
{
};
TEST_CASE_METHOD(TestRaspberryFixture, "has_gpio_integration") {
    auto test_gpio_capability = has_gpio();
    REQUIRE(test_gpio_capability);
}
TEST_CASE_METHOD(TestRaspberryFixture, "raspi_cleanup_integration") {
    raspi_init();
    raspi_cleanup cleanup_raspi;
    raspi_set_mode(pins::PIN11, pin_modes::GPIO_OUTPUT);
    raspi_write(pins::PIN11, pin_values::GPIO_HIGH);
    raspi_cleanup();
    raspi_init();
    REQUIRE(pin_modes::GPIO_INPUT == raspi_get_mode(pins::PIN11));
    REQUIRE(pin_values::GPIO_LOW == raspi_read(pins::PIN11));
}
TEST_CASE_METHOD(TestRaspberryFixture, "raspi_get_mode_integration") {
    raspi_init();
    raspi_cleanup cleanup_raspi;
    raspi_set_mode(pins::PIN11, pin_modes::GPIO_OUTPUT);
    auto test_mode = raspi_get_mode(pins::PIN11);
    REQUIRE(pin_modes::GPIO_OUTPUT == test_mode);
}
TEST_CASE_METHOD(TestRaspberryFixture, "raspi_init_integration") {
    raspi_init();
    raspi_cleanup cleanup_raspi;
    REQUIRE(has_gpio());
}
TEST_CASE_METHOD(TestRaspberryFixture, "raspi_read_integration") {
    raspi_init();
    raspi_cleanup cleanup_raspi;
    raspi_set_mode(pins::PIN11, pin_modes::GPIO_OUTPUT);
    raspi_write(pins::PIN11, pin_values::GPIO_HIGH);
    auto test_read_value = raspi_read(pins::PIN11);
    REQUIRE(pin_values::GPIO_HIGH == test_read_value);
}
TEST_CASE_METHOD(TestRaspberryFixture, "raspi_set_mode_integration") {
    raspi_init();
    raspi_cleanup cleanup_raspi;
    raspi_set_mode(pins::PIN11, pin_modes::GPIO_OUTPUT);
    REQUIRE(pin_modes::GPIO_OUTPUT == raspi_get_mode(pins::PIN11));
}
TEST_CASE_METHOD(TestRaspberryFixture, "raspi_set_pull_up_down_integration") {
    raspi_init();
    raspi_cleanup cleanup_raspi;
    raspi_set_mode(pins::PIN11, pin_modes::GPIO_INPUT);
    raspi_set_pull_up_down(pins::PIN11, pull_up_down::PUD_UP);
    auto test_pin_value_up = raspi_read(pins::PIN11);
    REQUIRE(pin_values::GPIO_HIGH == test_pin_value_up);
    raspi_set_pull_up_down(pins::PIN11, pull_up_down::PUD_DOWN);
    auto test_pin_value_down = raspi_read(pins::PIN11);
    REQUIRE(pin_values::GPIO_LOW == test_pin_value_down);
}
TEST_CASE_METHOD(TestRaspberryFixture, "raspi_set_pwm_dutycycle_integration") {
    raspi_init();
    raspi_cleanup cleanup_raspi;
    raspi_set_mode(pins::PIN18, pin_modes::GPIO_OUTPUT);
    raspi_set_pwm_dutycycle(pins::PIN18, 50);
    auto mode = raspi_get_mode(pins::PIN18);
    REQUIRE(pin_modes::GPIO_OUTPUT == mode);
}
TEST_CASE_METHOD(TestRaspberryFixture, "raspi_set_pwm_frequency_integration") {
    raspi_init();
    raspi_cleanup cleanup_raspi;
    raspi_set_mode(pins::PIN18, pin_modes::GPIO_PWM);
    raspi_set_pwm_frequency(pins::PIN18, 1000);
    auto mode = raspi_get_mode(pins::PIN18);
    REQUIRE(pin_modes::GPIO_PWM == mode);
}
TEST_CASE_METHOD(TestRaspberryFixture, "raspi_set_pwm_range_integration") {
    raspi_init();
    raspi_cleanup cleanup_raspi;
    raspi_set_mode(pins::PIN11, pin_modes::GPIO_OUTPUT);
    raspi_set_pwm_range(pins::PIN11, 1024);
    raspi_set_pwm_dutycycle(pins::PIN11, 512);
    auto mode = raspi_get_mode(pins::PIN11);
    REQUIRE(pin_modes::GPIO_OUTPUT == mode);
}
TEST_CASE_METHOD(TestRaspberryFixture, "raspi_write_integration") {
    raspi_init();
    raspi_cleanup cleanup_raspi;
    raspi_set_mode(pins::PIN11, pin_modes::GPIO_OUTPUT);
    raspi_write(pins::PIN11, pin_values::GPIO_HIGH);
    auto test_pin_value = raspi_read(pins::PIN11);
    REQUIRE(pin_values::GPIO_HIGH == test_pin_value);
}
