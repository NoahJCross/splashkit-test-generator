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
fn test_create_timer_integration() {
    let test_timer = create_timer("test_timer");
    assert!(test_timer.is_some());
    free_timer(test_timer);
    assert!(!has_timer_named("test_timer"));
}
#[test]
fn test_free_all_timers_integration() {
    let test_timer_1 = create_timer("test_timer_1");
    let test_timer_2 = create_timer("test_timer_2");
    start_timer(test_timer_1);
    start_timer(test_timer_2);
    free_all_timers();
    assert!(!has_timer_named("test_timer_1"));
    assert!(!has_timer_named("test_timer_2"));
}
#[test]
fn test_free_timer_integration() {
    let test_timer = create_timer("test_timer");
    free_timer(test_timer);
    assert!(!has_timer_named("test_timer"));
}
#[test]
fn test_has_timer_named_integration() {
    create_timer("test_timer");
    assert!(has_timer_named("test_timer"));
    free_all_timers();
    assert!(!has_timer_named("test_timer"));
}
#[test]
fn test_pause_timer__named_integration() {
    let test_timer = create_timer("test_timer");
    start_timer(test_timer);
    let initial_ticks = timer_ticks(test_timer);
    pause_timer("test_timer");
    let paused_ticks = timer_ticks(test_timer);
    assert_eq!(initial_ticks, paused_ticks);
    free_all_timers();
}
#[test]
fn test_pause_timer_integration() {
    let test_timer = create_timer("test_timer");
    start_timer(test_timer);
    pause_timer(test_timer);
    let initial_ticks = timer_ticks(test_timer);
    delay(1000);
    let final_ticks = timer_ticks(test_timer);
    assert_eq!(initial_ticks, final_ticks);
    free_all_timers();
}
#[test]
fn test_reset_timer__named_integration() {
    let test_timer = create_timer("test_timer");
    start_timer(test_timer);
    process_events();
    assert!(timer_ticks(test_timer) > 0);
    reset_timer("test_timer");
    process_events();
    assert_eq!(timer_ticks(test_timer), 0);
    free_all_timers();
}
#[test]
fn test_reset_timer_integration() {
    let test_timer = create_timer("test_timer");
    start_timer(test_timer);
    let initial_ticks = timer_ticks(test_timer);
    reset_timer(test_timer);
    assert_eq!(timer_ticks(test_timer), 0);
    free_all_timers();
}
#[test]
fn test_resume_timer__named_integration() {
    let test_timer = create_timer("test_timer");
    start_timer(test_timer);
    pause_timer(test_timer);
    let initial_ticks = timer_ticks(test_timer);
    process_events();
    resume_timer("test_timer");
    process_events();
    let final_ticks = timer_ticks(test_timer);
    assert!(final_ticks > initial_ticks);
    free_all_timers();
}
#[test]
fn test_resume_timer_integration() {
    let test_timer = create_timer("test_timer");
    start_timer(test_timer);
    pause_timer(test_timer);
    let initial_ticks = timer_ticks(test_timer);
    process_events();
    resume_timer(test_timer);
    process_events();
    let final_ticks = timer_ticks(test_timer);
    assert!(final_ticks > initial_ticks);
    free_all_timers();
}
#[test]
fn test_start_timer__named_integration() {
    let test_timer = create_timer("test_timer");
    start_timer__named("test_timer");
    let timer_state = timer_started__named("test_timer");
    assert!(timer_state);
    free_all_timers();
}
#[test]
fn test_start_timer_integration() {
    let test_timer = create_timer("test_timer");
    start_timer(test_timer);
    let timer_state = timer_started(test_timer);
    assert!(timer_state);
    free_timer(test_timer);
}
#[test]
fn test_stop_timer__named_integration() {
    let test_timer = create_timer("test_timer");
    start_timer(test_timer);
    process_events();
    assert!(timer_ticks(test_timer) > 0);
    stop_timer("test_timer");
    process_events();
    assert_eq!(timer_ticks(test_timer), 0);
    free_all_timers();
}
#[test]
fn test_stop_timer_integration() {
    let test_timer = create_timer("test_timer");
    start_timer(test_timer);
    process_events();
    assert!(timer_started(test_timer));
    stop_timer(test_timer);
    process_events();
    assert!(!timer_started(test_timer));
    free_all_timers();
}
#[test]
fn test_timer_named_integration() {
    let test_timer = create_timer("test_timer");
    start_timer(test_timer);
    let fetched_timer = timer_named("test_timer");
    assert!(timer_started(fetched_timer));
    free_all_timers();
}
#[test]
fn test_timer_paused__named_integration() {
    let test_timer = create_timer("test_timer");
    start_timer(test_timer);
    assert!(!timer_paused__named("test_timer"));
    pause_timer(test_timer);
    assert!(timer_paused__named("test_timer"));
    free_all_timers();
}
#[test]
fn test_timer_paused_integration() {
    let test_timer = create_timer("test_timer");
    start_timer(test_timer);
    assert!(!timer_paused(test_timer));
    pause_timer(test_timer);
    assert!(timer_paused(test_timer));
    free_all_timers();
}
#[test]
fn test_timer_started__named_integration() {
    let test_timer = create_timer("test_timer");
    start_timer(test_timer);
    assert!(timer_started("test_timer"));
    free_all_timers();
}
#[test]
fn test_timer_started_integration() {
    let test_timer = create_timer("test_timer");
    assert!(!timer_started(test_timer));
    start_timer(test_timer);
    assert!(timer_started(test_timer));
    free_all_timers();
}
#[test]
fn test_timer_ticks__named_integration() {
    let test_timer = create_timer("test_timer");
    start_timer(test_timer);
    let initial_ticks = timer_ticks("test_timer");
    delay(1000);
    let after_delay_ticks = timer_ticks("test_timer");
    assert!(after_delay_ticks > initial_ticks);
    free_all_timers();
}
#[test]
fn test_timer_ticks_integration() {
    let test_timer = create_timer("test_timer");
    start_timer(test_timer);
    let initial_ticks = timer_ticks(test_timer);
    delay(1000);
    let after_delay_ticks = timer_ticks(test_timer);
    assert!(after_delay_ticks > initial_ticks);
    free_timer(test_timer);
}
