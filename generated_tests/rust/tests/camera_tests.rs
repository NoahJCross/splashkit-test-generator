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
mod test_camera {
use super::*;
#[test]
fn test_camera_position_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_camera_position = camera_position();
    assert_eq!(0.0, test_camera_position.x);
    assert_eq!(0.0, test_camera_position.y);
    close_window(test_window);
}
#[test]
fn test_camera_x_integration() {
    let test_window = open_window("Test Window", 800, 600);
    set_camera_position(point_at(100.0, 100.0));
    assert_eq!(100.0, camera_x());
    close_window(test_window);
}
#[test]
fn test_camera_y_integration() {
    let test_window = open_window("Test Window", 800, 600);
    set_camera_position(point_at(100.0, 200.0));
    assert_eq!(200.0, camera_y());
    close_window(test_window);
}
#[test]
fn test_center_camera_on_vector_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_sprite = create_sprite("test_sprite");
    sprite_set_position(test_sprite, point_at(100.0, 100.0));
    center_camera_on_vector(test_sprite, vector_from_angle(50.0, 50.0));
    assert_eq!(point_at(-267.8606182336807, -161.69777810573578), camera_position());
    free_sprite(test_sprite);
    close_window(test_window);
}
#[test]
fn test_center_camera_on_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_sprite = create_sprite("test_sprite");
    sprite_set_position(test_sprite, point_at(100.0, 100.0));
    center_camera_on(test_sprite, 0.0, 0.0);
    assert_eq!(point_at(-300, -200), camera_position());
    free_sprite(test_sprite);
    close_window(test_window);
}
#[test]
fn test_move_camera_by_vector_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_vector = vector_from_angle(0.0, 100.0);
    move_camera_by_vector(test_vector);
    assert_eq!(100.0, camera_x());
    assert_eq!(0.0, camera_y());
    close_window(test_window);
}
#[test]
fn test_move_camera_by_integration() {
    let test_window = open_window("Test Window", 800, 600);
    move_camera_by(100.0, 100.0);
    assert_eq!(100.0, camera_x());
    assert_eq!(100.0, camera_y());
    close_window(test_window);
}
#[test]
fn test_move_camera_to_point_integration() {
    let test_window = open_window("Test Window", 800, 600);
    move_camera_to_point(point_at(100.0, 100.0));
    assert_eq!(point_at(100.0, 100.0), camera_position());
    close_window(test_window);
}
#[test]
fn test_move_camera_to_integration() {
    let test_window = open_window("Test Window", 800, 600);
    move_camera_to(100.0, 100.0);
    assert_eq!(100.0, camera_x());
    assert_eq!(100.0, camera_y());
    close_window(test_window);
}
#[test]
fn test_point_in_window_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_point = point_at(400, 300);
    assert!(point_in_window(test_window, test_point));
    let test_point_outside = point_at(1000, 1000);
    assert!(!point_in_window(test_window, test_point_outside));
    close_window(test_window);
}
#[test]
fn test_point_on_screen_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_point = point_at(400.0, 300.0);
    assert!(point_on_screen(test_point));
    let test_point_outside = point_at(1000.0, 1000.0);
    assert!(!point_on_screen(test_point_outside));
    close_window(test_window);
}
#[test]
fn test_rect_in_window_integration() {
    let test_window = open_window("Test Window", 800, 600);
    set_camera_x(0);
    set_camera_y(0);
    let test_rectangle = rectangle_from(0, 0, 100, 100);
    assert!(rect_in_window(test_window, test_rectangle));
    let test_rectangle_outside = rectangle_from(1000, 1000, 100, 100);
    assert!(!rect_in_window(test_window, test_rectangle_outside));
    close_window(test_window);
}
#[test]
fn test_rect_on_screen_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_rectangle = rectangle_from(0, 0, 100, 100);
    assert!(rect_on_screen(test_rectangle));
    move_camera_to(1000, 1000);
    assert!(!rect_on_screen(test_rectangle));
    close_window(test_window);
}
#[test]
fn test_screen_center_integration() {
    let test_window = open_window("Test Window", 800, 600);
    set_camera_x(0);
    set_camera_y(0);
    let test_center = screen_center();
    assert_eq!(400, test_center.x);
    assert_eq!(300, test_center.y);
    close_window(test_window);
}
#[test]
fn test_screen_rectangle_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_rectangle = screen_rectangle();
    assert_eq!(800, test_rectangle.width);
    assert_eq!(600, test_rectangle.height);
    close_window(test_window);
}
#[test]
fn test_set_camera_position_integration() {
    let test_window = open_window("Test Window", 800, 600);
    set_camera_position(point_at(100.0, 100.0));
    assert_eq!(point_at(100.0, 100.0), camera_position());
    close_window(test_window);
}
#[test]
fn test_set_camera_x_integration() {
    let test_window = open_window("Test Window", 800, 600);
    set_camera_x(100.0);
    assert_eq!(100.0, camera_x());
    close_window(test_window);
}
#[test]
fn test_set_camera_y_integration() {
    let test_window = open_window("Test Window", 800, 600);
    set_camera_y(100.0);
    assert_eq!(100.0, camera_y());
    close_window(test_window);
}
#[test]
fn test_to_screen_point_integration() {
    let test_window = open_window("Test Window", 800, 600);
    set_camera_position(point_at(100.0, 100.0));
    let test_screen_point = to_screen_point(point_at(150.0, 150.0));
    assert_eq!(50.0, test_screen_point.x);
    assert_eq!(50.0, test_screen_point.y);
    close_window(test_window);
}
#[test]
fn test_to_screen_rectangle_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_rectangle = rectangle_from(100.0, 100.0, 200.0, 200.0);
    let screen_rectangle = to_screen_rectangle(test_rectangle);
    assert_eq!(to_screen_x(100.0), rectangle_left(screen_rectangle));
    assert_eq!(to_screen_y(100.0), rectangle_top(screen_rectangle));
    close_window(test_window);
}
#[test]
fn test_to_screen_x_integration() {
    set_camera_x(100.0);
    let test_screen_x = to_screen_x(150.0);
    assert_eq!(50.0, test_screen_x);
}
#[test]
fn test_to_screen_y_integration() {
    let test_window = open_window("Test Window", 800, 600);
    set_camera_position(point_at(100.0, 100.0));
    let test_screen_y = to_screen_y(150.0);
    assert_eq!(50.0, test_screen_y);
    close_window(test_window);
}
#[test]
fn test_to_world_integration() {
    let test_window = open_window("Test Window", 800, 600);
    set_camera_position(point_at(100.0, 100.0));
    let test_world_point = to_world(point_at(400.0, 300.0));
    assert_eq!(500.0, test_world_point.x);
    assert_eq!(400.0, test_world_point.y);
    close_window(test_window);
}
#[test]
fn test_to_world_x_integration() {
    let test_window = open_window("Test Window", 800, 600);
    set_camera_position(point_at(100.0, 100.0));
    let test_world_x = to_world_x(400.0);
    assert_eq!(500.0, test_world_x);
    close_window(test_window);
}
#[test]
fn test_to_world_y_integration() {
    let test_window = open_window("Test Window", 800, 600);
    set_camera_position(point_at(100.0, 100.0));
    let test_world_y = to_world_y(300.0);
    assert_eq!(400.0, test_world_y);
    close_window(test_window);
}
#[test]
fn test_vector_world_to_screen_integration() {
    let test_vector = vector_world_to_screen();
    assert_ne!(vector_from_angle(0.0, 0.0), test_vector);
}
#[test]
fn test_window_area_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_area = window_area(test_window);
    assert_eq!(800, test_area.width);
    assert_eq!(600, test_area.height);
    close_window(test_window);
}
}
