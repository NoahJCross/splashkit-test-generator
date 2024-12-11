#include "splashkit.h"
#include <catch2/catch.hpp>

class TestRaspberry {
public:
    TEST_CASE("has_gpio_integration") {
        auto test_gpio_capability = has_gpio();
        REQUIRE(test_gpio_capability);
    }
    TEST_CASE("raspi_cleanup_integration") {
        raspi_init();
        raspi_set_mode(Pins::PIN11, PinModes::GPIO_OUTPUT);
        raspi_write(Pins::PIN11, PinValues::GPIO_HIGH);
        raspi_cleanup();
        REQUIRE(PinModes::GPIO_INPUT == raspi_get_mode(Pins::PIN11));
        REQUIRE(PinValues::GPIO_LOW == raspi_read(Pins::PIN11));
    }
    TEST_CASE("raspi_get_mode_integration") {
        raspi_init();
        raspi_set_mode(Pins::PIN11, PinModes::GPIO_OUTPUT);
        auto test_mode = raspi_get_mode(Pins::PIN11);
        REQUIRE(PinModes::GPIO_OUTPUT == test_mode);
        raspi_cleanup();
    }
    TEST_CASE("raspi_init_integration") {
        auto has_gpio_capability = has_gpio();
        raspi_init();
        REQUIRE(has_gpio());
        raspi_cleanup();
        REQUIRE_FALSE(has_gpio());
    }
    TEST_CASE("raspi_read_integration") {
        raspi_init();
        raspi_set_mode(Pins::PIN11, PinModes::GPIO_OUTPUT);
        raspi_write(Pins::PIN11, PinValues::GPIO_HIGH);
        auto test_read_value = raspi_read(Pins::PIN11);
        REQUIRE(PinValues::GPIO_HIGH == test_read_value);
        raspi_cleanup();
    }
    TEST_CASE("raspi_set_mode_integration") {
        raspi_init();
        raspi_set_mode(Pins::PIN11, PinModes::GPIO_OUTPUT);
        REQUIRE(PinModes::GPIO_OUTPUT == raspi_get_mode(Pins::PIN11));
        raspi_cleanup();
    }
    TEST_CASE("raspi_set_pull_up_down_integration") {
        raspi_init();
        raspi_set_mode(Pins::PIN11, PinModes::GPIO_INPUT);
        raspi_set_pull_up_down(Pins::PIN11, PullUpDown::PUD_UP);
        auto test_pin_value_up = raspi_read(Pins::PIN11);
        REQUIRE(PinValues::GPIO_HIGH == test_pin_value_up);
        raspi_set_pull_up_down(Pins::PIN11, PullUpDown::PUD_DOWN);
        auto test_pin_value_down = raspi_read(Pins::PIN11);
        REQUIRE(PinValues::GPIO_LOW == test_pin_value_down);
        raspi_cleanup();
    }
    TEST_CASE("raspi_set_pwm_dutycycle_integration") {
        raspi_init();
        raspi_set_mode(Pins::PIN18, PinModes::GPIO_OUTPUT);
        raspi_set_pwm_dutycycle(Pins::PIN18, 50);
        auto mode = raspi_get_mode(Pins::PIN18);
        REQUIRE(PinModes::GPIO_OUTPUT == mode);
        raspi_cleanup();
    }
    TEST_CASE("raspi_set_pwm_frequency_integration") {
        raspi_init();
        raspi_set_mode(Pins::PIN18, PinModes::GPIO_OUTPUT);
        raspi_set_pwm_frequency(Pins::PIN18, 1000);
        auto mode = raspi_get_mode(Pins::PIN18);
        REQUIRE(PinModes::GPIO_OUTPUT == mode);
        raspi_cleanup();
    }
    TEST_CASE("raspi_set_pwm_range_integration") {
        raspi_init();
        raspi_set_mode(Pins::PIN11, PinModes::GPIO_OUTPUT);
        raspi_set_pwm_range(Pins::PIN11, 1024);
        raspi_set_pwm_dutycycle(Pins::PIN11, 512);
        auto mode = raspi_get_mode(Pins::PIN11);
        REQUIRE(PinModes::GPIO_OUTPUT == mode);
        raspi_cleanup();
    }
    TEST_CASE("raspi_write_integration") {
        raspi_init();
        raspi_set_mode(Pins::PIN11, PinModes::GPIO_OUTPUT);
        raspi_write(Pins::PIN11, PinValues::GPIO_HIGH);
        auto test_pin_value = raspi_read(Pins::PIN11);
        REQUIRE(PinValues::GPIO_HIGH == test_pin_value);
        raspi_cleanup();
    }
};
