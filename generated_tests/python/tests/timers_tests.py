import pytest
from splashkit import *

class TestTimers:

def test_create_timer_integration():
    test_timer = create_timer("test_timer")
    assert test_timer is not None
    assert has_timer_named("test_timer")
    free_timer(test_timer)


def test_free_all_timers_integration():
    test_timer1 = create_timer("test_timer_1")
    test_timer2 = create_timer("test_timer_2")
    assert has_timer_named("test_timer_1")
    assert has_timer_named("test_timer_2")
    free_all_timers()
    assert not has_timer_named("test_timer_1")
    assert not has_timer_named("test_timer_2")


def test_free_timer_integration():
    test_timer = create_timer("test_timer")
    assert has_timer_named("test_timer")
    free_timer(test_timer)
    assert not has_timer_named("test_timer")


def test_has_timer_named_integration():
    test_timer = create_timer("test_timer")
    assert has_timer_named("test_timer")
    free_timer(test_timer)
    assert not has_timer_named("test_timer")


def test_pause_timer__named_integration():
    test_timer = create_timer("test_timer")
    start_timer(test_timer)
    initial_ticks = timer_ticks(test_timer)
    pause_timer__named("test_timer")
    assert timer_paused("test_timer")
    assert initial_ticks == timer_ticks(test_timer)
    free_timer(test_timer)


def test_pause_timer_integration():
    test_timer = create_timer("test_timer")
    start_timer(test_timer)
    pause_timer(test_timer)
    initial_ticks = timer_ticks(test_timer)
    delay(100)
    assert initial_ticks == timer_ticks(test_timer)
    free_timer(test_timer)


def test_reset_timer__named_integration():
    test_timer = create_timer("test_timer")
    start_timer(test_timer)
    delay(100)
    initial_ticks = timer_ticks(test_timer)
    reset_timer__named("test_timer")
    assert timer_ticks(test_timer) < initial_ticks
    free_timer(test_timer)


def test_reset_timer_integration():
    test_timer = create_timer("test_timer")
    start_timer(test_timer)
    delay(100)
    initial_ticks = timer_ticks(test_timer)
    reset_timer(test_timer)
    assert timer_ticks(test_timer) < initial_ticks
    free_timer(test_timer)


def test_resume_timer__named_integration():
    test_timer = create_timer("test_timer")
    start_timer(test_timer)
    pause_timer(test_timer)
    initial_ticks = timer_ticks(test_timer)
    resume_timer__named("test_timer")
    delay(100)
    assert timer_ticks(test_timer) > initial_ticks
    free_timer(test_timer)


def test_resume_timer_integration():
    test_timer = create_timer("test_timer")
    start_timer(test_timer)
    pause_timer(test_timer)
    initial_ticks = timer_ticks(test_timer)
    resume_timer(test_timer)
    delay(100)
    assert timer_ticks(test_timer) > initial_ticks
    free_timer(test_timer)


def test_start_timer__named_integration():
    test_timer = create_timer("test_timer")
    start_timer__named("test_timer")
    assert timer_started("test_timer")
    free_timer(test_timer)


def test_start_timer_integration():
    test_timer = create_timer("test_timer")
    start_timer(test_timer)
    assert timer_started(test_timer)
    free_timer(test_timer)


def test_stop_timer__named_integration():
    test_timer = create_timer("test_timer")
    start_timer(test_timer)
    delay(100)
    assert timer_ticks(test_timer) > 100
    stop_timer__named("test_timer")
    assert 0 == timer_ticks(test_timer)
    free_timer(test_timer)


def test_stop_timer_integration():
    test_timer = create_timer("test_timer")
    start_timer(test_timer)
    assert timer_started(test_timer)
    stop_timer(test_timer)
    assert not timer_started(test_timer)
    free_timer(test_timer)


def test_timer_named_integration():
    test_timer = create_timer("test_timer")
    named_timer = timer_named("test_timer")
    assert test_timer == named_timer
    free_timer(test_timer)


def test_timer_paused__named_integration():
    test_timer = create_timer("test_timer")
    start_timer(test_timer)
    assert not timer_paused__named("test_timer")
    pause_timer("test_timer")
    assert timer_paused__named("test_timer")
    free_timer(test_timer)


def test_timer_paused_integration():
    test_timer = create_timer("test_timer")
    start_timer(test_timer)
    assert not timer_paused(test_timer)
    pause_timer(test_timer)
    assert timer_paused(test_timer)
    free_timer(test_timer)


def test_timer_started__named_integration():
    test_timer = create_timer("test_timer")
    assert not timer_started__named("test_timer")
    start_timer("test_timer")
    assert timer_started__named("test_timer")
    free_timer(test_timer)


def test_timer_started_integration():
    test_timer = create_timer("test_timer")
    assert not timer_started(test_timer)
    start_timer(test_timer)
    assert timer_started(test_timer)
    free_timer(test_timer)


def test_timer_ticks__named_integration():
    test_timer = create_timer("test_timer")
    start_timer(test_timer)
    initial_ticks = timer_ticks__named("test_timer")
    delay(100)
    after_delay_ticks = timer_ticks__named("test_timer")
    assert after_delay_ticks > initial_ticks
    free_timer(test_timer)


def test_timer_ticks_integration():
    test_timer = create_timer("test_timer")
    start_timer(test_timer)
    initial_ticks = timer_ticks(test_timer)
    delay(100)
    after_delay_ticks = timer_ticks(test_timer)
    assert after_delay_ticks > initial_ticks
    free_timer(test_timer)

