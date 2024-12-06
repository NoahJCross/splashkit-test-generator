#include "splashkit.h"
#include <catch2/catch.hpp>

TEST_CASE("create_timer_integration") {
    auto test_timer = create_timer("test_timer");
    REQUIRE(test_timer != nullptr);
    free_timer(test_timer);
    REQUIRE_FALSE(has_timer("test_timer"));
}
TEST_CASE("free_all_timers_integration") {
    auto test_timer_1 = create_timer("test_timer_1");
    auto test_timer_2 = create_timer("test_timer_2");
    start_timer(test_timer_1);
    start_timer(test_timer_2);
    free_all_timers();
    REQUIRE_FALSE(has_timer("test_timer_1"));
    REQUIRE_FALSE(has_timer("test_timer_2"));
}
TEST_CASE("free_timer_integration") {
    auto test_timer = create_timer("test_timer");
    free_timer(test_timer);
    REQUIRE_FALSE(has_timer("test_timer"));
}
TEST_CASE("has_timer_named_integration") {
    create_timer("test_timer");
    REQUIRE(has_timer("test_timer"));
    free_all_timers();
    REQUIRE_FALSE(has_timer("test_timer"));
}
TEST_CASE("pause_timer__named_integration") {
    auto test_timer = create_timer("test_timer");
    start_timer(test_timer);
    auto initial_ticks = timer_ticks(test_timer);
    pause_timer("test_timer");
    auto paused_ticks = timer_ticks(test_timer);
    REQUIRE(initial_ticks == paused_ticks);
    free_all_timers();
}
TEST_CASE("pause_timer_integration") {
    auto test_timer = create_timer("test_timer");
    start_timer(test_timer);
    pause_timer(test_timer);
    auto initial_ticks = timer_ticks(test_timer);
    delay(1000);
    auto final_ticks = timer_ticks(test_timer);
    REQUIRE(initial_ticks == final_ticks);
    free_all_timers();
}
TEST_CASE("reset_timer__named_integration") {
    auto test_timer = create_timer("test_timer");
    start_timer(test_timer);
    process_events();
    REQUIRE(timer_ticks(test_timer) > 0);
    reset_timer("test_timer");
    process_events();
    REQUIRE(timer_ticks(test_timer) == 0);
    free_all_timers();
}
TEST_CASE("reset_timer_integration") {
    auto test_timer = create_timer("test_timer");
    start_timer(test_timer);
    auto initial_ticks = timer_ticks(test_timer);
    reset_timer(test_timer);
    REQUIRE(timer_ticks(test_timer) == 0);
    free_all_timers();
}
TEST_CASE("resume_timer__named_integration") {
    auto test_timer = create_timer("test_timer");
    start_timer(test_timer);
    pause_timer(test_timer);
    auto initial_ticks = timer_ticks(test_timer);
    process_events();
    resume_timer("test_timer");
    process_events();
    auto final_ticks = timer_ticks(test_timer);
    REQUIRE(final_ticks > initial_ticks);
    free_all_timers();
}
TEST_CASE("resume_timer_integration") {
    auto test_timer = create_timer("test_timer");
    start_timer(test_timer);
    pause_timer(test_timer);
    auto initial_ticks = timer_ticks(test_timer);
    process_events();
    resume_timer(test_timer);
    process_events();
    auto final_ticks = timer_ticks(test_timer);
    REQUIRE(final_ticks > initial_ticks);
    free_all_timers();
}
TEST_CASE("start_timer__named_integration") {
    auto test_timer = create_timer("test_timer");
    start_timer("test_timer");
    auto timer_state = timer_started("test_timer");
    REQUIRE(timer_state);
    free_all_timers();
}
TEST_CASE("start_timer_integration") {
    auto test_timer = create_timer("test_timer");
    start_timer(test_timer);
    auto timer_state = timer_started(test_timer);
    REQUIRE(timer_state);
    free_timer(test_timer);
}
TEST_CASE("stop_timer__named_integration") {
    auto test_timer = create_timer("test_timer");
    start_timer(test_timer);
    process_events();
    REQUIRE(timer_ticks(test_timer) > 0);
    stop_timer("test_timer");
    process_events();
    REQUIRE(timer_ticks(test_timer) == 0);
    free_all_timers();
}
TEST_CASE("stop_timer_integration") {
    auto test_timer = create_timer("test_timer");
    start_timer(test_timer);
    process_events();
    REQUIRE(timer_started(test_timer));
    stop_timer(test_timer);
    process_events();
    REQUIRE_FALSE(timer_started(test_timer));
    free_all_timers();
}
TEST_CASE("timer_named_integration") {
    auto test_timer = create_timer("test_timer");
    start_timer(test_timer);
    auto fetched_timer = timer_named("test_timer");
    REQUIRE(timer_started(fetched_timer));
    free_all_timers();
}
TEST_CASE("timer_paused__named_integration") {
    auto test_timer = create_timer("test_timer");
    start_timer(test_timer);
    REQUIRE_FALSE(timer_paused("test_timer"));
    pause_timer(test_timer);
    REQUIRE(timer_paused("test_timer"));
    free_all_timers();
}
TEST_CASE("timer_paused_integration") {
    auto test_timer = create_timer("test_timer");
    start_timer(test_timer);
    REQUIRE_FALSE(timer_paused(test_timer));
    pause_timer(test_timer);
    REQUIRE(timer_paused(test_timer));
    free_all_timers();
}
TEST_CASE("timer_started__named_integration") {
    auto test_timer = create_timer("test_timer");
    start_timer(test_timer);
    REQUIRE(timer_started("test_timer"));
    free_all_timers();
}
TEST_CASE("timer_started_integration") {
    auto test_timer = create_timer("test_timer");
    REQUIRE_FALSE(timer_started(test_timer));
    start_timer(test_timer);
    REQUIRE(timer_started(test_timer));
    free_all_timers();
}
TEST_CASE("timer_ticks__named_integration") {
    auto test_timer = create_timer("test_timer");
    start_timer(test_timer);
    auto initial_ticks = timer_ticks("test_timer");
    delay(1000);
    auto after_delay_ticks = timer_ticks("test_timer");
    REQUIRE(after_delay_ticks > initial_ticks);
    free_all_timers();
}
TEST_CASE("timer_ticks_integration") {
    auto test_timer = create_timer("test_timer");
    start_timer(test_timer);
    auto initial_ticks = timer_ticks(test_timer);
    delay(1000);
    auto after_delay_ticks = timer_ticks(test_timer);
    REQUIRE(after_delay_ticks > initial_ticks);
    free_timer(test_timer);
}
