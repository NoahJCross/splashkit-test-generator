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
mod test_timers {
use super::*;
#[test]
fn test_create_timer_integration() {
    let test_timer = create_timer("test_timer");
    assert!(test_timer.is_some());
    assert!(has_timer_named("test_timer"));
    free_timer(test_timer);
}
#[test]
fn test_free_all_timers_integration() {
    let test_timer1 = create_timer("test_timer_1");
    let test_timer2 = create_timer("test_timer_2");
    assert!(has_timer_named("test_timer_1"));
    assert!(has_timer_named("test_timer_2"));
    free_all_timers();
    assert!(!has_timer_named("test_timer_1"));
    assert!(!has_timer_named("test_timer_2"));
}
#[test]
fn test_free_timer_integration() {
    let test_timer = create_timer("test_timer");
    assert!(has_timer_named("test_timer"));
    free_timer(test_timer);
    assert!(!has_timer_named("test_timer"));
}
#[test]
fn test_has_timer_named_integration() {
    let test_timer = create_timer("test_timer");
    assert!(has_timer_named("test_timer"));
    free_timer(test_timer);
    assert!(!has_timer_named("test_timer"));
}
#[test]
fn test_pause_timer__named_integration() {
    let test_timer = create_timer("test_timer");
    start_timer(test_timer);
    let initial_ticks = timer_ticks(test_timer);
    pause_timer_named("test_timer");
    assert!(timer_paused("test_timer"));
    assert_eq!(initial_ticks, timer_ticks(test_timer));
    free_timer(test_timer);
}
#[test]
fn test_pause_timer_integration() {
    let test_timer = create_timer("test_timer");
    start_timer(test_timer);
    pause_timer(test_timer);
    let initial_ticks = timer_ticks(test_timer);
    delay(100);
    assert_eq!(initial_ticks, timer_ticks(test_timer));
    free_timer(test_timer);
}
#[test]
fn test_reset_timer__named_integration() {
    let test_timer = create_timer("test_timer");
    start_timer(test_timer);
    delay(100);
    let initial_ticks = timer_ticks(test_timer);
    reset_timer_named("test_timer");
    assert!(timer_ticks(test_timer) < initial_ticks);
    free_timer(test_timer);
}
#[test]
fn test_reset_timer_integration() {
    let test_timer = create_timer("test_timer");
    start_timer(test_timer);
    delay(100);
    let initial_ticks = timer_ticks(test_timer);
    reset_timer(test_timer);
    assert!(timer_ticks(test_timer) < initial_ticks);
    free_timer(test_timer);
}
#[test]
fn test_resume_timer__named_integration() {
    let test_timer = create_timer("test_timer");
    start_timer(test_timer);
    pause_timer(test_timer);
    let initial_ticks = timer_ticks(test_timer);
    resume_timer_named("test_timer");
    delay(100);
    assert!(timer_ticks(test_timer) > initial_ticks);
    free_timer(test_timer);
}
#[test]
fn test_resume_timer_integration() {
    let test_timer = create_timer("test_timer");
    start_timer(test_timer);
    pause_timer(test_timer);
    let initial_ticks = timer_ticks(test_timer);
    resume_timer(test_timer);
    delay(100);
    assert!(timer_ticks(test_timer) > initial_ticks);
    free_timer(test_timer);
}
#[test]
fn test_start_timer__named_integration() {
    let test_timer = create_timer("test_timer");
    start_timer_named("test_timer");
    assert!(timer_started("test_timer"));
    free_timer(test_timer);
}
#[test]
fn test_start_timer_integration() {
    let test_timer = create_timer("test_timer");
    start_timer(test_timer);
    assert!(timer_started(test_timer));
    free_timer(test_timer);
}
#[test]
fn test_stop_timer__named_integration() {
    let test_timer = create_timer("test_timer");
    start_timer(test_timer);
    delay(100);
    assert!(timer_ticks(test_timer));
    stop_timer_named("test_timer");
    assert_eq!(0, timer_ticks(test_timer));
    free_timer(test_timer);
}
#[test]
fn test_stop_timer_integration() {
    let test_timer = create_timer("test_timer");
    start_timer(test_timer);
    assert!(timer_started(test_timer));
    stop_timer(test_timer);
    assert!(!timer_started(test_timer));
    free_timer(test_timer);
}
#[test]
fn test_timer_named_integration() {
    let test_timer = create_timer("test_timer");
    let named_timer = timer_named("test_timer");
    assert_eq!(test_timer, named_timer);
    free_timer(test_timer);
}
#[test]
fn test_timer_paused__named_integration() {
    let test_timer = create_timer("test_timer");
    start_timer(test_timer);
    assert!(!timer_paused_named("test_timer"));
    pause_timer("test_timer");
    assert!(timer_paused_named("test_timer"));
    free_timer(test_timer);
}
#[test]
fn test_timer_paused_integration() {
    let test_timer = create_timer("test_timer");
    start_timer(test_timer);
    assert!(!timer_paused(test_timer));
    pause_timer(test_timer);
    assert!(timer_paused(test_timer));
    free_timer(test_timer);
}
#[test]
fn test_timer_started__named_integration() {
    let test_timer = create_timer("test_timer");
    assert!(!timer_started_named("test_timer"));
    start_timer("test_timer");
    assert!(timer_started_named("test_timer"));
    free_timer(test_timer);
}
#[test]
fn test_timer_started_integration() {
    let test_timer = create_timer("test_timer");
    assert!(!timer_started(test_timer));
    start_timer(test_timer);
    assert!(timer_started(test_timer));
    free_timer(test_timer);
}
#[test]
fn test_timer_ticks__named_integration() {
    let test_timer = create_timer("test_timer");
    start_timer(test_timer);
    let initial_ticks = timer_ticks_named("test_timer");
    delay(100);
    let after_delay_ticks = timer_ticks_named("test_timer");
    assert!(after_delay_ticks > initial_ticks);
    free_timer(test_timer);
}
#[test]
fn test_timer_ticks_integration() {
    let test_timer = create_timer("test_timer");
    start_timer(test_timer);
    let initial_ticks = timer_ticks(test_timer);
    delay(100);
    let after_delay_ticks = timer_ticks(test_timer);
    assert!(after_delay_ticks > initial_ticks);
    free_timer(test_timer);
}
}
