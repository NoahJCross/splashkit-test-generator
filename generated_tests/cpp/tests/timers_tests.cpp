#include "splashkit.h"
#include <catch2/catch.hpp>
#include "../helpers.hpp"
class TestTimers {
public:
    TEST_CASE("create_timer_integration") {
        auto test_timer = create_timer(string("test_timer"));
        TimerCleanup cleanup_timer;
        REQUIRE(test_timer != nullptr);
        REQUIRE(has_timer(string("test_timer")));
    }
    TEST_CASE("free_all_timers_integration") {
        create_timer(string("test_timer_1"));
        TimerCleanup cleanup_timer;
        create_timer(string("test_timer_2"));
        REQUIRE(has_timer(string("test_timer_1")));
        REQUIRE(has_timer(string("test_timer_2")));
        free_all_timers();
        REQUIRE_FALSE(has_timer(string("test_timer_1")));
        REQUIRE_FALSE(has_timer(string("test_timer_2")));
    }
    TEST_CASE("free_timer_integration") {
        auto test_timer = create_timer(string("test_timer"));
        TimerCleanup cleanup_timer;
        REQUIRE(has_timer(string("test_timer")));
        free_timer(test_timer);
        REQUIRE_FALSE(has_timer(string("test_timer")));
    }
    TEST_CASE("has_timer__named_integration") {
        auto test_timer = create_timer(string("test_timer"));
        TimerCleanup cleanup_timer;
        REQUIRE(has_timer(string("test_timer")));
        free_timer(test_timer);
        REQUIRE_FALSE(has_timer(string("test_timer")));
    }
    TEST_CASE("pause_timer__named_integration") {
        auto test_timer = create_timer(string("test_timer"));
        TimerCleanup cleanup_timer;
        start_timer(test_timer);
        auto initial_ticks = timer_ticks(test_timer);
        pause_timer(string("test_timer"));
        REQUIRE(timer_paused(string("test_timer")));
        REQUIRE(initial_ticks == timer_ticks(test_timer));
    }
    TEST_CASE("pause_timer_integration") {
        auto test_timer = create_timer(string("test_timer"));
        TimerCleanup cleanup_timer;
        start_timer(test_timer);
        pause_timer(test_timer);
        auto initial_ticks = timer_ticks(test_timer);
        delay(100);
        REQUIRE(initial_ticks == timer_ticks(test_timer));
    }
    TEST_CASE("reset_timer__named_integration") {
        auto test_timer = create_timer(string("test_timer"));
        TimerCleanup cleanup_timer;
        start_timer(test_timer);
        delay(100);
        auto initial_ticks = timer_ticks(test_timer);
        reset_timer(string("test_timer"));
        REQUIRE(timer_ticks(test_timer) < initial_ticks);
    }
    TEST_CASE("reset_timer_integration") {
        auto test_timer = create_timer(string("test_timer"));
        TimerCleanup cleanup_timer;
        start_timer(test_timer);
        delay(100);
        auto initial_ticks = timer_ticks(test_timer);
        reset_timer(test_timer);
        REQUIRE(timer_ticks(test_timer) < initial_ticks);
    }
    TEST_CASE("resume_timer__named_integration") {
        auto test_timer = create_timer(string("test_timer"));
        TimerCleanup cleanup_timer;
        start_timer(test_timer);
        pause_timer(test_timer);
        auto initial_ticks = timer_ticks(test_timer);
        resume_timer(string("test_timer"));
        delay(100);
        REQUIRE(timer_ticks(test_timer) > initial_ticks);
    }
    TEST_CASE("resume_timer_integration") {
        auto test_timer = create_timer(string("test_timer"));
        TimerCleanup cleanup_timer;
        start_timer(test_timer);
        pause_timer(test_timer);
        auto initial_ticks = timer_ticks(test_timer);
        resume_timer(test_timer);
        delay(100);
        REQUIRE(timer_ticks(test_timer) > initial_ticks);
    }
    TEST_CASE("start_timer__named_integration") {
        auto test_timer = create_timer(string("test_timer"));
        TimerCleanup cleanup_timer;
        start_timer(string("test_timer"));
        REQUIRE(timer_started(string("test_timer")));
    }
    TEST_CASE("start_timer_integration") {
        auto test_timer = create_timer(string("test_timer"));
        TimerCleanup cleanup_timer;
        start_timer(test_timer);
        REQUIRE(timer_started(test_timer));
    }
    TEST_CASE("stop_timer__named_integration") {
        auto test_timer = create_timer(string("test_timer"));
        TimerCleanup cleanup_timer;
        start_timer(test_timer);
        delay(100);
        REQUIRE(timer_ticks(test_timer) > 40u);
        stop_timer(string("test_timer"));
        REQUIRE(0u == timer_ticks(test_timer));
    }
    TEST_CASE("stop_timer_integration") {
        auto test_timer = create_timer(string("test_timer"));
        TimerCleanup cleanup_timer;
        start_timer(test_timer);
        REQUIRE(timer_started(test_timer));
        stop_timer(test_timer);
        REQUIRE_FALSE(timer_started(test_timer));
    }
    TEST_CASE("timer_named_integration") {
        auto test_timer = create_timer(string("test_timer"));
        TimerCleanup cleanup_timer;
        auto named_timer = timer_named(string("test_timer"));
        REQUIRE(test_timer == named_timer);
    }
    TEST_CASE("timer_paused__named_integration") {
        auto test_timer = create_timer(string("test_timer"));
        TimerCleanup cleanup_timer;
        start_timer(test_timer);
        REQUIRE_FALSE(timer_paused(string("test_timer")));
        pause_timer(string("test_timer"));
        REQUIRE(timer_paused(string("test_timer")));
    }
    TEST_CASE("timer_paused_integration") {
        auto test_timer = create_timer(string("test_timer"));
        TimerCleanup cleanup_timer;
        start_timer(test_timer);
        REQUIRE_FALSE(timer_paused(test_timer));
        pause_timer(test_timer);
        REQUIRE(timer_paused(test_timer));
    }
    TEST_CASE("timer_started__named_integration") {
        auto test_timer = create_timer(string("test_timer"));
        TimerCleanup cleanup_timer;
        REQUIRE_FALSE(timer_started(string("test_timer")));
        start_timer(string("test_timer"));
        REQUIRE(timer_started(string("test_timer")));
    }
    TEST_CASE("timer_started_integration") {
        auto test_timer = create_timer(string("test_timer"));
        TimerCleanup cleanup_timer;
        REQUIRE_FALSE(timer_started(test_timer));
        start_timer(test_timer);
        REQUIRE(timer_started(test_timer));
    }
    TEST_CASE("timer_ticks__named_integration") {
        auto test_timer = create_timer(string("test_timer"));
        TimerCleanup cleanup_timer;
        start_timer(test_timer);
        auto initial_ticks = timer_ticks(string("test_timer"));
        delay(100);
        auto after_delay_ticks = timer_ticks(string("test_timer"));
        REQUIRE(after_delay_ticks > initial_ticks);
    }
    TEST_CASE("timer_ticks_integration") {
        auto test_timer = create_timer(string("test_timer"));
        TimerCleanup cleanup_timer;
        start_timer(test_timer);
        auto initial_ticks = timer_ticks(test_timer);
        delay(100);
        auto after_delay_ticks = timer_ticks(test_timer);
        REQUIRE(after_delay_ticks > initial_ticks);
    }
};
