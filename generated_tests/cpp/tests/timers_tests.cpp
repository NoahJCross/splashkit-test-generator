#include <catch2/catch_all.hpp>
#include <limits>
#include "splashkit.h"
#include "../helpers.hpp"
struct TestTimersFixture
{
};
TEST_CASE_METHOD(TestTimersFixture, "create_timer_integration") {
    auto test_timer = create_timer("Test Timer 1");
    timer_cleanup cleanup_timer;
    REQUIRE(test_timer != nullptr);
    REQUIRE(has_timer("Test Timer 1"));
}
TEST_CASE_METHOD(TestTimersFixture, "free_all_timers_integration") {
    create_timer("Test Timer 2");
    timer_cleanup cleanup_timer;
    create_timer("Test Timer 3");
    REQUIRE(has_timer("Test Timer 2"));
    REQUIRE(has_timer("Test Timer 3"));
    free_all_timers();
    REQUIRE_FALSE(has_timer("Test Timer 2"));
    REQUIRE_FALSE(has_timer("Test Timer 3"));
}
TEST_CASE_METHOD(TestTimersFixture, "free_timer_integration") {
    auto test_timer = create_timer("Test Timer 4");
    timer_cleanup cleanup_timer;
    REQUIRE(has_timer("Test Timer 4"));
    free_timer(test_timer);
    REQUIRE_FALSE(has_timer("Test Timer 4"));
}
TEST_CASE_METHOD(TestTimersFixture, "has_timer__named_integration") {
    auto test_timer = create_timer("Test Timer 5");
    timer_cleanup cleanup_timer;
    REQUIRE(has_timer("Test Timer 5"));
    free_timer(test_timer);
    REQUIRE_FALSE(has_timer("Test Timer 5"));
}
TEST_CASE_METHOD(TestTimersFixture, "pause_timer__named_integration") {
    auto test_timer = create_timer("Test Timer 6");
    timer_cleanup cleanup_timer;
    start_timer(test_timer);
    auto initial_ticks = timer_ticks(test_timer);
    pause_timer("Test Timer 6");
    REQUIRE(timer_paused("Test Timer 6"));
    REQUIRE(initial_ticks == timer_ticks(test_timer));
}
TEST_CASE_METHOD(TestTimersFixture, "pause_timer_integration") {
    auto test_timer = create_timer("Test Timer 7");
    timer_cleanup cleanup_timer;
    start_timer(test_timer);
    pause_timer(test_timer);
    auto initial_ticks = timer_ticks(test_timer);
    delay(100);
    REQUIRE(initial_ticks == timer_ticks(test_timer));
}
TEST_CASE_METHOD(TestTimersFixture, "reset_timer__named_integration") {
    auto test_timer = create_timer("Test Timer 8");
    timer_cleanup cleanup_timer;
    start_timer(test_timer);
    delay(100);
    auto initial_ticks = timer_ticks(test_timer);
    reset_timer("Test Timer 8");
    REQUIRE(timer_ticks(test_timer) < initial_ticks);
}
TEST_CASE_METHOD(TestTimersFixture, "reset_timer_integration") {
    auto test_timer = create_timer("Test Timer 9");
    timer_cleanup cleanup_timer;
    start_timer(test_timer);
    delay(100);
    auto initial_ticks = timer_ticks(test_timer);
    reset_timer(test_timer);
    REQUIRE(timer_ticks(test_timer) < initial_ticks);
}
TEST_CASE_METHOD(TestTimersFixture, "resume_timer__named_integration") {
    auto test_timer = create_timer("Test Timer 10");
    timer_cleanup cleanup_timer;
    start_timer(test_timer);
    pause_timer(test_timer);
    auto initial_ticks = timer_ticks(test_timer);
    resume_timer("Test Timer 10");
    delay(100);
    REQUIRE(timer_ticks(test_timer) > initial_ticks);
}
TEST_CASE_METHOD(TestTimersFixture, "resume_timer_integration") {
    auto test_timer = create_timer("Test Timer 11");
    timer_cleanup cleanup_timer;
    start_timer(test_timer);
    pause_timer(test_timer);
    auto initial_ticks = timer_ticks(test_timer);
    resume_timer(test_timer);
    delay(100);
    REQUIRE(timer_ticks(test_timer) > initial_ticks);
}
TEST_CASE_METHOD(TestTimersFixture, "start_timer__named_integration") {
    auto test_timer = create_timer("Test Timer 12");
    timer_cleanup cleanup_timer;
    start_timer("Test Timer 12");
    REQUIRE(timer_started("Test Timer 12"));
}
TEST_CASE_METHOD(TestTimersFixture, "start_timer_integration") {
    auto test_timer = create_timer("Test Timer 13");
    timer_cleanup cleanup_timer;
    start_timer(test_timer);
    REQUIRE(timer_started(test_timer));
}
TEST_CASE_METHOD(TestTimersFixture, "stop_timer__named_integration") {
    auto test_timer = create_timer("Test Timer 14");
    timer_cleanup cleanup_timer;
    start_timer(test_timer);
    delay(100);
    REQUIRE(timer_ticks(test_timer) > 40u);
    stop_timer("Test Timer 14");
    REQUIRE(0u == timer_ticks(test_timer));
}
TEST_CASE_METHOD(TestTimersFixture, "stop_timer_integration") {
    auto test_timer = create_timer("Test Timer 15");
    timer_cleanup cleanup_timer;
    start_timer(test_timer);
    REQUIRE(timer_started(test_timer));
    stop_timer(test_timer);
    REQUIRE_FALSE(timer_started(test_timer));
}
TEST_CASE_METHOD(TestTimersFixture, "timer_named_integration") {
    auto test_timer = create_timer("Test Timer 16");
    timer_cleanup cleanup_timer;
    auto named_timer = timer_named("Test Timer 16");
    REQUIRE(test_timer == named_timer);
}
TEST_CASE_METHOD(TestTimersFixture, "timer_paused__named_integration") {
    auto test_timer = create_timer("Test Timer 17");
    timer_cleanup cleanup_timer;
    start_timer(test_timer);
    REQUIRE_FALSE(timer_paused("Test Timer 17"));
    pause_timer("Test Timer 17");
    REQUIRE(timer_paused("Test Timer 17"));
}
TEST_CASE_METHOD(TestTimersFixture, "timer_paused_integration") {
    auto test_timer = create_timer("Test Timer 18");
    timer_cleanup cleanup_timer;
    start_timer(test_timer);
    REQUIRE_FALSE(timer_paused(test_timer));
    pause_timer(test_timer);
    REQUIRE(timer_paused(test_timer));
}
TEST_CASE_METHOD(TestTimersFixture, "timer_started__named_integration") {
    auto test_timer = create_timer("Test Timer 19");
    timer_cleanup cleanup_timer;
    REQUIRE_FALSE(timer_started("Test Timer 19"));
    start_timer("Test Timer 19");
    REQUIRE(timer_started("Test Timer 19"));
}
TEST_CASE_METHOD(TestTimersFixture, "timer_started_integration") {
    auto test_timer = create_timer("Test Timer 20");
    timer_cleanup cleanup_timer;
    REQUIRE_FALSE(timer_started(test_timer));
    start_timer(test_timer);
    REQUIRE(timer_started(test_timer));
}
TEST_CASE_METHOD(TestTimersFixture, "timer_ticks__named_integration") {
    auto test_timer = create_timer("Test Timer 21");
    timer_cleanup cleanup_timer;
    start_timer(test_timer);
    auto initial_ticks = timer_ticks("Test Timer 21");
    delay(100);
    auto after_delay_ticks = timer_ticks("Test Timer 21");
    REQUIRE(after_delay_ticks > initial_ticks);
}
TEST_CASE_METHOD(TestTimersFixture, "timer_ticks_integration") {
    auto test_timer = create_timer("Test Timer 22");
    timer_cleanup cleanup_timer;
    start_timer(test_timer);
    auto initial_ticks = timer_ticks(test_timer);
    delay(100);
    auto after_delay_ticks = timer_ticks(test_timer);
    REQUIRE(after_delay_ticks > initial_ticks);
}
