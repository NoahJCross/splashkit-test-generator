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
fn test_call_for_all_sprites_with_value_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    let test_sprite1 = create_sprite(test_bitmap);
    let test_sprite2 = create_sprite(test_bitmap);
    sprite_set_x(test_sprite1, 100);
    sprite_set_x(test_sprite2, 200);
    call_for_all_sprites_with_value(sprite_set_x(test_sprite1, 300), 300);
    assert_eq!(300, sprite_x(test_sprite1));
    assert_eq!(300, sprite_x(test_sprite2));
    free_all_sprites();
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_call_for_all_sprites_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    let test_sprite_1 = create_sprite(test_bitmap);
    let test_sprite_2 = create_sprite(test_bitmap);
    sprite_set_x(test_sprite_1, 100);
    sprite_set_y(test_sprite_1, 100);
    sprite_set_x(test_sprite_2, 200);
    sprite_set_y(test_sprite_2, 200);
    call_for_all_sprites(_test_sprite_function());
    assert!(sprite_at(test_sprite_1, point_at(100, 100)));
    assert!(sprite_at(test_sprite_2, point_at(200, 200)));
    free_all_sprites();
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_call_on_sprite_event_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    let test_sprite = create_sprite(test_bitmap);
    call_on_sprite_event(_on_sprite_event());
    process_events();
    simulate_mouse_click(MouseButton::Left);
    process_events();
    assert!(mouse_clicked(MouseButton::Left));
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_center_point_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    let test_sprite = create_sprite(test_bitmap);
    sprite_set_position(test_sprite, point_at(100, 100));
    let test_center_point = center_point(test_sprite);
    assert_eq!(150, test_center_point.x);
    assert_eq!(150, test_center_point.y);
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_create_sprite_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    let test_sprite = create_sprite(test_bitmap);
    assert!(test_sprite.is_some());
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_create_sprite_with_animation_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    let test_animation = load_animation_script("test_animation", "kermit.txt");
    let test_sprite = create_sprite_with_animation(test_bitmap, test_animation);
    assert!(test_sprite.is_some());
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    free_animation_script(test_animation);
    close_window(test_window);
}
#[test]
fn test_create_sprite_with_bitmap_named_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    let test_sprite = create_sprite_with_bitmap_named("test_bitmap");
    assert!(test_sprite.is_some());
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_create_sprite_named_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    let test_sprite = create_sprite_named("test_sprite", test_bitmap);
    assert!(test_sprite.is_some());
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_create_sprite_named_with_animation_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    let test_animation = load_animation_script("test_animation", "kermit.txt");
    let test_sprite = create_sprite_named_with_animation("test_sprite", test_bitmap, test_animation);
    assert!(test_sprite.is_some());
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    free_animation_script(test_animation);
    close_window(test_window);
}
#[test]
fn test_create_sprite_with_bitmap_and_animation_named_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    let test_sprite = create_sprite_with_bitmap_and_animation_named("test_bitmap", "test_animation");
    assert!(test_sprite.is_some());
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_create_sprite_pack_integration() {
    let test_window = open_window("Test Window", 800, 600);
    create_sprite_pack("test_pack");
    assert!(has_sprite_pack("test_pack"));
    free_sprite_pack("test_pack");
    close_window(test_window);
}
#[test]
fn test_current_sprite_pack_integration() {
    create_sprite_pack("test_pack");
    select_sprite_pack("test_pack");
    let current_pack = current_sprite_pack();
    assert_eq!("test_pack", current_pack);
    free_sprite_pack("test_pack");
}
#[test]
fn test_draw_all_sprites_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    let test_sprite1 = create_sprite(test_bitmap);
    let test_sprite2 = create_sprite(test_bitmap);
    sprite_set_x(test_sprite1, 100);
    sprite_set_y(test_sprite1, 100);
    sprite_set_x(test_sprite2, 200);
    sprite_set_y(test_sprite2, 200);
    draw_all_sprites();
    refresh_screen();
    assert_ne!(color_white(), get_pixel(100, 100));
    assert_ne!(color_white(), get_pixel(200, 200));
    free_all_sprites();
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_draw_sprite_offset_by_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    let test_sprite = create_sprite(test_bitmap);
    sprite_set_position(test_sprite, point_at(400, 300));
    draw_sprite_offset_by(test_sprite, vector_to(50, 50));
    refresh_screen();
    assert_ne!(color_white(), get_pixel(point_at(450, 350)));
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_draw_sprite_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    let test_sprite = create_sprite(test_bitmap);
    sprite_set_position(test_sprite, point_at(400, 300));
    draw_sprite(test_sprite);
    refresh_screen();
    assert!(sprite_on_screen_at(test_sprite, point_at(400, 300)));
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_draw_sprite_offset_x_y_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    let test_sprite = create_sprite(test_bitmap);
    sprite_set_position(test_sprite, point_at(400, 300));
    draw_sprite_offset_x_y(test_sprite, 50, 50);
    refresh_screen();
    assert!(point_in_circle(point_at(450, 350), sprite_collision_circle(test_sprite)));
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_free_all_sprites_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    let test_sprite = create_sprite(test_bitmap);
    free_all_sprites();
    assert!(!has_sprite("test_sprite"));
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_free_sprite_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    let test_sprite = create_sprite(test_bitmap);
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_free_sprite_pack_integration() {
    create_sprite_pack("test_pack");
    let test_has_pack = has_sprite_pack("test_pack");
    assert!(test_has_pack);
    free_sprite_pack("test_pack");
    let test_has_pack = has_sprite_pack("test_pack");
    assert!(!test_has_pack);
}
#[test]
fn test_has_sprite_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    let test_sprite = create_sprite(test_bitmap);
    assert!(has_sprite("test_sprite"));
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_has_sprite_pack_integration() {
    create_sprite_pack("test_pack");
    assert!(has_sprite_pack("test_pack"));
    assert!(!has_sprite_pack("non_existent_pack"));
    free_sprite_pack("test_pack");
}
#[test]
fn test_move_sprite_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    let test_sprite = create_sprite(test_bitmap);
    sprite_set_velocity(test_sprite, vector_to(10.0, 10.0));
    sprite_set_position(test_sprite, point_at(100.0, 100.0));
    move_sprite(test_sprite);
    process_events();
    assert_ne!(point_at(100.0, 100.0), sprite_position(test_sprite));
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_move_sprite_by_vector_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    let test_sprite = create_sprite(test_bitmap);
    sprite_set_position(test_sprite, point_at(100, 100));
    move_sprite_by_vector(test_sprite, vector_to(50, 50));
    process_events();
    assert_eq!(150, sprite_x(test_sprite));
    assert_eq!(150, sprite_y(test_sprite));
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_move_sprite_by_vector_percent_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    let test_sprite = create_sprite(test_bitmap);
    sprite_set_position(test_sprite, point_at(100.0, 100.0));
    move_sprite_by_vector_percent(test_sprite, vector_to(50.0, 50.0), 0.5);
    assert_eq!(125.0, sprite_x(test_sprite));
    assert_eq!(125.0, sprite_y(test_sprite));
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_move_sprite_percent_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    let test_sprite = create_sprite(test_bitmap);
    sprite_set_position(test_sprite, point_at(100.0, 100.0));
    sprite_set_velocity(test_sprite, vector_to(10.0, 10.0));
    move_sprite_percent(test_sprite, 0.5);
    process_events();
    assert!(point_in_circle(point_at(105.0, 105.0), sprite_circle(test_sprite)));
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_move_sprite_to_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    let test_sprite = create_sprite(test_bitmap);
    move_sprite_to(test_sprite, 400.0, 300.0);
    assert_eq!(400.0, sprite_x(test_sprite));
    assert_eq!(300.0, sprite_y(test_sprite));
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_select_sprite_pack_integration() {
    let test_window = open_window("Test Window", 800, 600);
    create_sprite_pack("test_pack");
    let test_sprite = create_sprite("rocket_sprt.png");
    select_sprite_pack("test_pack");
    draw_all_sprites();
    assert!(sprite_on_screen_at(test_sprite, point_at(400, 300)));
    free_all_sprites();
    free_sprite_pack("test_pack");
    close_window(test_window);
}
#[test]
fn test_sprite_add_layer_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    let test_sprite = create_sprite(test_bitmap);
    let new_layer_bitmap = create_bitmap("new_layer_bitmap", 50, 50);
    let layer_index = sprite_add_layer(test_sprite, new_layer_bitmap, "new_layer");
    assert!(layer_index > -1);
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    free_bitmap(new_layer_bitmap);
    close_window(test_window);
}
#[test]
fn test_sprite_add_to_velocity_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    let test_sprite = create_sprite(test_bitmap);
    sprite_set_position(test_sprite, point_at(400, 300));
    sprite_add_to_velocity(test_sprite, vector_to(10, 10));
    update_sprite(test_sprite);
    assert_eq!(410, sprite_x(test_sprite));
    assert_eq!(310, sprite_y(test_sprite));
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_sprite_add_value_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    let test_sprite = create_sprite(test_bitmap);
    sprite_add_value(test_sprite, "health");
    assert!(sprite_has_value(test_sprite, "health"));
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_sprite_add_value_with_default_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    let test_sprite = create_sprite(test_bitmap);
    sprite_add_value_with_default(test_sprite, "health", 100.0);
    assert!(sprite_has_value(test_sprite, "health"));
    assert_eq!(100.0, sprite_value(test_sprite, "health"));
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_sprite_anchor_point_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    let test_sprite = create_sprite(test_bitmap);
    let test_anchor_point = sprite_anchor_point(test_sprite);
    assert_eq!(50, test_anchor_point.x);
    assert_eq!(50, test_anchor_point.y);
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_sprite_anchor_position_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    let test_sprite = create_sprite(test_bitmap);
    sprite_set_position(test_sprite, point_at(100, 100));
    let test_anchor_position = sprite_anchor_position(test_sprite);
    assert_eq!(100, test_anchor_position.x);
    assert_eq!(100, test_anchor_position.y);
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_sprite_animation_has_ended_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    let test_sprite = create_sprite(test_bitmap);
    sprite_start_animation(test_sprite, "default");
    update_sprite_animation(test_sprite);
    assert!(!sprite_animation_has_ended(test_sprite));
    update_sprite_animation(test_sprite);
    assert!(sprite_animation_has_ended(test_sprite));
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_sprite_animation_name_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    let test_sprite = create_sprite(test_bitmap);
    sprite_start_animation(test_sprite, "default");
    let test_animation_name = sprite_animation_name(test_sprite);
    assert_eq!("default", test_animation_name);
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_sprite_at_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    let test_sprite = create_sprite(test_bitmap);
    sprite_set_position(test_sprite, point_at(400, 300));
    process_events();
    assert!(sprite_at(test_sprite, point_at(400, 300)));
    assert!(!sprite_at(test_sprite, point_at(500, 400)));
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_sprite_bring_layer_forward_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    let test_sprite = create_sprite(test_bitmap);
    let layer_index = sprite_add_layer(test_sprite, test_bitmap, "layer2");
    let initial_layer_position = sprite_visible_index_of_layer(test_sprite, layer_index);
    sprite_bring_layer_forward(test_sprite, layer_index);
    let new_layer_position = sprite_visible_index_of_layer(test_sprite, layer_index);
    assert!(new_layer_position > initial_layer_position);
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_sprite_bring_layer_to_front_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    let test_sprite = create_sprite(test_bitmap);
    let layer_index = sprite_add_layer(test_sprite, test_bitmap, "layer2");
    sprite_bring_layer_to_front(test_sprite, layer_index);
    assert_eq!(sprite_visible_layer_count(test_sprite), sprite_visible_index_of_layer(test_sprite, layer_index));
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_sprite_call_on_event_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    let test_sprite = create_sprite(test_bitmap);
    sprite_call_on_event(test_sprite, _on_sprite_event());
    process_events();
    simulate_mouse_click(MouseButton::Left);
    process_events();
    assert!(sprite_event_occurred(test_sprite));
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_sprite_circle_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    let test_sprite = create_sprite(test_bitmap);
    let test_circle = sprite_circle(test_sprite);
    assert!(point_in_circle(point_at(50, 50), test_circle));
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_sprite_collision_bitmap_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    let test_sprite = create_sprite(test_bitmap);
    let collision_bitmap = sprite_collision_bitmap(test_sprite);
    assert_eq!(100, bitmap_width(collision_bitmap));
    assert_eq!(100, bitmap_height(collision_bitmap));
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_sprite_collision_circle_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    let test_sprite = create_sprite(test_bitmap);
    let test_circle = sprite_collision_circle(test_sprite);
    assert!(point_in_circle(point_at(50, 50), test_circle));
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_sprite_collision_kind_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    let test_sprite = create_sprite(test_bitmap);
    sprite_set_collision_kind(test_sprite, CollisionTestKind::PixelCollisions);
    assert_eq!(CollisionTestKind::PixelCollisions, sprite_collision_kind(test_sprite));
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_sprite_collision_rectangle_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    let test_sprite = create_sprite(test_bitmap);
    let test_rectangle = sprite_collision_rectangle(test_sprite);
    assert_eq!(100, test_rectangle.width);
    assert_eq!(100, test_rectangle.height);
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_sprite_current_cell_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    let test_sprite = create_sprite(test_bitmap);
    sprite_start_animation(test_sprite, 0);
    update_sprite(test_sprite);
    assert_eq!(0, sprite_current_cell(test_sprite));
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_sprite_current_cell_rectangle_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    let test_sprite = create_sprite(test_bitmap);
    let test_rectangle = sprite_current_cell_rectangle(test_sprite);
    assert_eq!(0, rectangle_left(test_rectangle));
    assert_eq!(0, rectangle_top(test_rectangle));
    assert_eq!(bitmap_width(test_bitmap), rectangle_right(test_rectangle));
    assert_eq!(bitmap_height(test_bitmap), rectangle_bottom(test_rectangle));
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_sprite_dx_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    let test_sprite = create_sprite(test_bitmap);
    sprite_set_dx(test_sprite, 5.0);
    assert_eq!(5.0, sprite_dx(test_sprite));
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_sprite_dy_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    let test_sprite = create_sprite(test_bitmap);
    sprite_set_dy(test_sprite, 5.0);
    assert_eq!(5.0, sprite_dy(test_sprite));
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_sprite_has_value_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    let test_sprite = create_sprite(test_bitmap);
    sprite_add_value(test_sprite, "health");
    assert!(sprite_has_value(test_sprite, "health"));
    assert!(!sprite_has_value(test_sprite, "mana"));
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_sprite_heading_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    let test_sprite = create_sprite(test_bitmap);
    sprite_set_velocity(test_sprite, vector_to(1.0, 1.0));
    let test_heading = sprite_heading(test_sprite);
    assert!((45.0..=45.01).contains(&test_heading));
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_sprite_height_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    let test_sprite = create_sprite(test_bitmap);
    assert_eq!(100, sprite_height(test_sprite));
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_sprite_hide_layer_named_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    let test_sprite = create_sprite(test_bitmap);
    let layer_index = sprite_add_layer(test_sprite, test_bitmap, "layer2");
    sprite_hide_layer_named(test_sprite, "layer2");
    assert!(!sprite_layer_visible(test_sprite, layer_index));
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_sprite_hide_layer_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    let test_sprite = create_sprite(test_bitmap);
    let layer_index = sprite_add_layer(test_sprite, test_bitmap, "layer2");
    sprite_show_layer(test_sprite, layer_index);
    sprite_hide_layer(test_sprite, layer_index);
    assert!(!sprite_layer_visible(test_sprite, layer_index));
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_sprite_layer_named_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    let test_sprite = create_sprite(test_bitmap);
    sprite_add_layer(test_sprite, test_bitmap, "layer2");
    let test_layer_bitmap = sprite_layer_named(test_sprite, "layer2");
    assert!(test_layer_bitmap.is_some());
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_sprite_layer_at_index_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    let test_sprite = create_sprite(test_bitmap);
    let layer_index = sprite_add_layer(test_sprite, test_bitmap, "layer2");
    let test_layer_bitmap = sprite_layer_at_index(test_sprite, layer_index);
    assert!(test_layer_bitmap.is_some());
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_sprite_layer_circle_named_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    let test_sprite = create_sprite(test_bitmap);
    let test_circle = sprite_layer_circle_named(test_sprite, "layer1");
    assert!(point_in_circle(point_at(50, 50), test_circle));
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_sprite_layer_circle_at_index_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    let test_sprite = create_sprite(test_bitmap);
    let test_circle = sprite_layer_circle_at_index(test_sprite, 0);
    assert!(point_in_circle(point_at(50, 50), test_circle));
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_sprite_layer_count_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    let test_sprite = create_sprite(test_bitmap);
    assert_eq!(1, sprite_layer_count(test_sprite));
    sprite_add_layer(test_sprite, test_bitmap, "layer2");
    assert_eq!(2, sprite_layer_count(test_sprite));
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_sprite_layer_height_named_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    let test_sprite = create_sprite(test_bitmap);
    sprite_add_layer(test_sprite, test_bitmap, "layer2");
    assert_eq!(100, sprite_layer_height_named(test_sprite, "layer2"));
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_sprite_layer_height_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    let test_sprite = create_sprite(test_bitmap);
    let layer_height = sprite_layer_height(test_sprite, 0);
    assert_eq!(100, layer_height);
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_sprite_layer_index_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    let test_sprite = create_sprite(test_bitmap);
    let layer_index = sprite_add_layer(test_sprite, test_bitmap, "layer2");
    assert_eq!(layer_index, sprite_layer_index(test_sprite, "layer2"));
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_sprite_layer_name_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    let test_sprite = create_sprite(test_bitmap);
    let layer_index = sprite_add_layer(test_sprite, test_bitmap, "layer2");
    assert_eq!("layer2", sprite_layer_name(test_sprite, layer_index));
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_sprite_layer_offset_named_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    let test_sprite = create_sprite(test_bitmap);
    sprite_set_layer_offset_named(test_sprite, "layer1", vector_to(10, 10));
    let layer_offset = sprite_layer_offset_named(test_sprite, "layer1");
    assert_eq!(10, layer_offset.x);
    assert_eq!(10, layer_offset.y);
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_sprite_layer_offset_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    let test_sprite = create_sprite(test_bitmap);
    let layer_index = sprite_add_layer(test_sprite, test_bitmap, "layer2");
    sprite_set_layer_offset_at_index(test_sprite, layer_index, vector_to(10, 10));
    assert_eq!(vector_to(10, 10), sprite_layer_offset(test_sprite, layer_index));
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_sprite_layer_rectangle_named_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    let test_sprite = create_sprite(test_bitmap);
    let test_rectangle = sprite_layer_rectangle_named(test_sprite, "layer1");
    assert_eq!(0, rectangle_left(test_rectangle));
    assert_eq!(0, rectangle_top(test_rectangle));
    assert_eq!(100, rectangle_right(test_rectangle));
    assert_eq!(100, rectangle_bottom(test_rectangle));
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_sprite_layer_rectangle_at_index_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    let test_sprite = create_sprite(test_bitmap);
    let test_rectangle = sprite_layer_rectangle_at_index(test_sprite, 0);
    assert_eq!(bitmap_width(test_bitmap), test_rectangle.width);
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_sprite_layer_width_named_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    let test_sprite = create_sprite(test_bitmap);
    sprite_add_layer(test_sprite, test_bitmap, "layer2");
    assert_eq!(100, sprite_layer_width_named(test_sprite, "layer2"));
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_sprite_layer_width_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    let test_sprite = create_sprite(test_bitmap);
    assert_eq!(100, sprite_layer_width(test_sprite, 0));
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_sprite_location_matrix_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    let test_sprite = create_sprite(test_bitmap);
    sprite_set_position(test_sprite, point_at(100.0, 100.0));
    sprite_set_rotation(test_sprite, 45.0);
    let test_matrix = sprite_location_matrix(test_sprite);
    let test_point = point_at(50.0, 50.0);
    let result_point = matrix_multiply_point(test_matrix, test_point);
    assert!((149.0..=150.0).contains(&result_point.x));
    assert!((149.0..=150.0).contains(&result_point.y));
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_sprite_mass_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    let test_sprite = create_sprite(test_bitmap);
    sprite_set_mass(test_sprite, 10.0);
    assert_eq!(10.0, sprite_mass(test_sprite));
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_sprite_move_from_anchor_point_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    let test_sprite = create_sprite(test_bitmap);
    sprite_set_move_from_anchor_point(test_sprite, true);
    assert!(sprite_move_from_anchor_point(test_sprite));
    sprite_set_move_from_anchor_point(test_sprite, false);
    assert!(!sprite_move_from_anchor_point(test_sprite));
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_sprite_move_to_taking_seconds_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    let test_sprite = create_sprite(test_bitmap);
    sprite_set_position(test_sprite, point_at(100, 100));
    sprite_move_to_taking_seconds(test_sprite, point_at(400, 300), 2.0);
    process_events();
    assert!(point_in_circle(point_at(400, 300), sprite_collision_circle(test_sprite)));
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_sprite_name_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    let test_sprite = create_sprite(test_bitmap);
    assert_eq!("test_sprite", sprite_name(test_sprite));
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_sprite_named_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    let test_sprite = create_sprite(test_bitmap);
    let named_sprite = sprite_named("test_sprite");
    assert!(named_sprite.is_some());
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_sprite_offscreen_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    let test_sprite = create_sprite(test_bitmap);
    sprite_set_position(test_sprite, point_at(0, 0));
    assert!(!sprite_offscreen(test_sprite));
    sprite_set_position(test_sprite, point_at(-100, -100));
    assert!(sprite_offscreen(test_sprite));
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_sprite_on_screen_at_point_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    let test_sprite = create_sprite(test_bitmap);
    sprite_set_position(test_sprite, point_at(100, 100));
    draw_sprite(test_sprite);
    refresh_screen();
    assert!(sprite_on_screen_at_point(test_sprite, point_at(100, 100)));
    assert!(!sprite_on_screen_at_point(test_sprite, point_at(1000, 1000)));
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_sprite_on_screen_at_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    let test_sprite = create_sprite(test_bitmap);
    sprite_set_position(test_sprite, point_at(100, 100));
    assert!(sprite_on_screen_at(test_sprite, 100, 100));
    assert!(!sprite_on_screen_at(test_sprite, 1000, 1000));
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_sprite_position_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    let test_sprite = create_sprite(test_bitmap);
    sprite_set_position(test_sprite, point_at(100.0, 100.0));
    let test_position = sprite_position(test_sprite);
    assert_eq!(100.0, test_position.x);
    assert_eq!(100.0, test_position.y);
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_sprite_replay_animation_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    let test_sprite = create_sprite(test_bitmap);
    sprite_start_animation(test_sprite, 0);
    sprite_replay_animation(test_sprite);
    assert!(sprite_animation_has_ended(test_sprite));
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_sprite_replay_animation_with_sound_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    let test_sprite = create_sprite(test_bitmap);
    sprite_replay_animation_with_sound(test_sprite, true);
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_sprite_rotation_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    let test_sprite = create_sprite(test_bitmap);
    sprite_set_rotation(test_sprite, 45.0);
    assert_eq!(45.0, sprite_rotation(test_sprite));
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_sprite_scale_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    let test_sprite = create_sprite(test_bitmap);
    sprite_set_scale(test_sprite, 2.0);
    assert_eq!(2.0, sprite_scale(test_sprite));
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_sprite_screen_rectangle_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    let test_sprite = create_sprite(test_bitmap);
    sprite_set_position(test_sprite, point_at(100, 100));
    let test_rectangle = sprite_screen_rectangle(test_sprite);
    assert_eq!(100, rectangle_left(test_rectangle));
    assert_eq!(100, rectangle_top(test_rectangle));
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_sprite_send_layer_backward_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    let test_sprite = create_sprite(test_bitmap);
    let layer_index = sprite_add_layer(test_sprite, test_bitmap, "layer2");
    sprite_send_layer_backward(test_sprite, layer_index);
    assert!(sprite_visible_index_of_layer(test_sprite, layer_index) < 1);
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_sprite_send_layer_to_back_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    let test_sprite = create_sprite(test_bitmap);
    let layer_index = sprite_add_layer(test_sprite, test_bitmap, "layer2");
    sprite_send_layer_to_back(test_sprite, layer_index);
    assert_eq!(0, sprite_visible_index_of_layer(test_sprite, layer_index));
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_sprite_set_anchor_point_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    let test_sprite = create_sprite(test_bitmap);
    sprite_set_anchor_point(test_sprite, point_at(50, 50));
    let test_anchor_point = sprite_anchor_point(test_sprite);
    assert_eq!(50, test_anchor_point.x);
    assert_eq!(50, test_anchor_point.y);
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_sprite_set_collision_bitmap_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    let test_sprite = create_sprite(test_bitmap);
    sprite_set_collision_bitmap(test_sprite, test_bitmap);
    assert_eq!(test_bitmap, sprite_collision_bitmap(test_sprite));
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_sprite_set_collision_kind_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    let test_sprite = create_sprite(test_bitmap);
    sprite_set_collision_kind(test_sprite, CollisionTestKind::PixelCollisions);
    assert_eq!(CollisionTestKind::PixelCollisions, sprite_collision_kind(test_sprite));
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_sprite_set_dx_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    let test_sprite = create_sprite(test_bitmap);
    sprite_set_dx(test_sprite, 5.0);
    assert_eq!(5.0, sprite_dx(test_sprite));
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_sprite_set_dy_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    let test_sprite = create_sprite(test_bitmap);
    sprite_set_dy(test_sprite, 5.0);
    assert_eq!(5.0, sprite_dy(test_sprite));
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_sprite_set_heading_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    let test_sprite = create_sprite(test_bitmap);
    sprite_set_heading(test_sprite, 45.0);
    assert_eq!(45.0, sprite_heading(test_sprite));
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_sprite_set_layer_offset_named_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    let test_sprite = create_sprite(test_bitmap);
    sprite_set_layer_offset_named(test_sprite, "layer1", vector_to(10.0, 10.0));
    let test_offset = sprite_layer_offset_named(test_sprite, "layer1");
    assert_eq!(10.0, test_offset.x);
    assert_eq!(10.0, test_offset.y);
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_sprite_set_layer_offset_at_index_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    let test_sprite = create_sprite(test_bitmap);
    sprite_set_layer_offset_at_index(test_sprite, 0, vector_to(10.0, 10.0));
    assert_eq!(vector_to(10.0, 10.0), sprite_layer_offset(test_sprite, 0));
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_sprite_set_mass_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    let test_sprite = create_sprite(test_bitmap);
    sprite_set_mass(test_sprite, 10.0);
    assert_eq!(10.0, sprite_mass(test_sprite));
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_sprite_set_move_from_anchor_point_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    let test_sprite = create_sprite(test_bitmap);
    sprite_set_move_from_anchor_point(test_sprite, true);
    assert!(sprite_move_from_anchor_point(test_sprite));
    sprite_set_move_from_anchor_point(test_sprite, false);
    assert!(!sprite_move_from_anchor_point(test_sprite));
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_sprite_set_position_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    let test_sprite = create_sprite(test_bitmap);
    sprite_set_position(test_sprite, point_at(100, 100));
    assert_eq!(100, sprite_x(test_sprite));
    assert_eq!(100, sprite_y(test_sprite));
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_sprite_set_rotation_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    let test_sprite = create_sprite(test_bitmap);
    sprite_set_rotation(test_sprite, 45.0);
    assert_eq!(45.0, sprite_rotation(test_sprite));
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_sprite_set_scale_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    let test_sprite = create_sprite(test_bitmap);
    sprite_set_scale(test_sprite, 2.0);
    assert_eq!(2.0, sprite_scale(test_sprite));
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_sprite_set_speed_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    let test_sprite = create_sprite(test_bitmap);
    sprite_set_speed(test_sprite, 5.0);
    assert_eq!(5.0, sprite_speed(test_sprite));
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_sprite_set_value_named_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    let test_sprite = create_sprite(test_bitmap);
    sprite_add_value(test_sprite, "test_value");
    sprite_set_value_named(test_sprite, "test_value", 10.5);
    assert_eq!(10.5, sprite_value(test_sprite, "test_value"));
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_sprite_set_velocity_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    let test_sprite = create_sprite(test_bitmap);
    sprite_set_velocity(test_sprite, vector_to(5.0, 5.0));
    update_sprite(test_sprite);
    assert!(sprite_at(test_sprite, point_at(5.0, 5.0)));
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_sprite_set_x_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    let test_sprite = create_sprite(test_bitmap);
    sprite_set_x(test_sprite, 150.0);
    assert_eq!(150.0, sprite_x(test_sprite));
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_sprite_set_y_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    let test_sprite = create_sprite(test_bitmap);
    sprite_set_y(test_sprite, 300.0);
    assert_eq!(300.0, sprite_y(test_sprite));
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_sprite_show_layer_named_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    let test_sprite = create_sprite(test_bitmap);
    let layer_index = sprite_add_layer(test_sprite, test_bitmap, "layer2");
    let result = sprite_show_layer_named(test_sprite, "layer2");
    assert_eq!(1, result);
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_sprite_show_layer_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    let test_sprite = create_sprite(test_bitmap);
    let layer_index = sprite_add_layer(test_sprite, test_bitmap, "layer2");
    sprite_hide_layer(test_sprite, 1);
    let result = sprite_show_layer(test_sprite, 1);
    assert_eq!(1, result);
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_sprite_speed_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    let test_sprite = create_sprite(test_bitmap);
    sprite_set_velocity(test_sprite, vector_to(5.0, 5.0));
    let test_speed = sprite_speed(test_sprite);
    assert_eq!(7.0710678118654755, test_speed);
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_sprite_start_animation_named_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    let test_sprite = create_sprite(test_bitmap);
    sprite_start_animation_named(test_sprite, "test_animation");
    assert!(sprite_animation_name(test_sprite));
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_sprite_start_animation_named_with_sound_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    let test_sprite = create_sprite(test_bitmap);
    sprite_start_animation_named_with_sound(test_sprite, "test_animation", true);
    update_sprite(test_sprite);
    assert!(sprite_animation_has_ended(test_sprite));
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_sprite_start_animation_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    let test_sprite = create_sprite(test_bitmap);
    sprite_start_animation(test_sprite, 0);
    update_sprite(test_sprite);
    assert!(sprite_animation_has_ended(test_sprite));
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_sprite_start_animation_with_sound_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    let test_sprite = create_sprite(test_bitmap);
    sprite_start_animation_with_sound(test_sprite, 0, true);
    update_sprite(test_sprite);
    assert!(sprite_animation_has_ended(test_sprite));
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_sprite_stop_calling_on_event_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    let test_sprite = create_sprite(test_bitmap);
    sprite_call_on_event(test_sprite, _on_sprite_event());
    process_events();
    simulate_sprite_event(test_sprite);
    process_events();
    assert!(_on_sprite_event_called());
    sprite_stop_calling_on_event(test_sprite, _on_sprite_event());
    process_events();
    simulate_sprite_event(test_sprite);
    process_events();
    assert!(!_on_sprite_event_called());
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_sprite_toggle_layer_visible_named_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    let test_sprite = create_sprite(test_bitmap);
    sprite_add_layer(test_sprite, test_bitmap, "layer2");
    sprite_toggle_layer_visible_named(test_sprite, "layer2");
    assert!(!sprite_visible_layer_count(test_sprite));
    sprite_toggle_layer_visible_named(test_sprite, "layer2");
    assert_eq!(2, sprite_visible_layer_count(test_sprite));
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_sprite_toggle_layer_visible_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    let test_sprite = create_sprite(test_bitmap);
    let layer_index = sprite_add_layer(test_sprite, test_bitmap, "layer2");
    sprite_hide_layer(test_sprite, layer_index);
    sprite_toggle_layer_visible(test_sprite, layer_index);
    assert!(sprite_visible_layer_count(test_sprite));
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_sprite_value_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    let test_sprite = create_sprite(test_bitmap);
    sprite_add_value(test_sprite, "test_value", 10.0);
    let sprite_value_result = sprite_value(test_sprite, "test_value");
    assert_eq!(10.0, sprite_value_result);
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_sprite_value_count_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    let test_sprite = create_sprite(test_bitmap);
    sprite_add_value(test_sprite, "health");
    sprite_add_value(test_sprite, "speed");
    assert_eq!(2, sprite_value_count(test_sprite));
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_sprite_velocity_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    let test_sprite = create_sprite(test_bitmap);
    sprite_set_velocity(test_sprite, vector_to(5.0, 5.0));
    let test_velocity = sprite_velocity(test_sprite);
    assert_eq!(5.0, test_velocity.x);
    assert_eq!(5.0, test_velocity.y);
    free_all_sprites();
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_sprite_visible_index_of_layer_named_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    let test_sprite = create_sprite(test_bitmap);
    sprite_add_layer(test_sprite, test_bitmap, "layer2");
    let layer_index = sprite_visible_index_of_layer_named(test_sprite, "layer2");
    assert_eq!(1, layer_index);
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_sprite_visible_index_of_layer_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    let test_sprite = create_sprite(test_bitmap);
    let layer_index = sprite_add_layer(test_sprite, test_bitmap, "layer2");
    sprite_show_layer(test_sprite, layer_index);
    assert_eq!(1, sprite_visible_index_of_layer(test_sprite, layer_index));
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_sprite_visible_layer_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    let test_sprite = create_sprite(test_bitmap);
    sprite_add_layer(test_sprite, test_bitmap, "layer2");
    sprite_show_layer(test_sprite, "layer2");
    assert_eq!(1, sprite_visible_layer(test_sprite, 1));
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_sprite_visible_layer_count_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    let test_sprite = create_sprite(test_bitmap);
    assert_eq!(1, sprite_visible_layer_count(test_sprite));
    sprite_add_layer(test_sprite, test_bitmap, "layer2");
    sprite_show_layer(test_sprite, "layer2");
    assert_eq!(2, sprite_visible_layer_count(test_sprite));
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_sprite_visible_layer_id_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    let test_sprite = create_sprite(test_bitmap);
    sprite_add_layer(test_sprite, test_bitmap, "layer2");
    sprite_show_layer(test_sprite, "layer2");
    assert_eq!(1, sprite_visible_layer_id(test_sprite, 1));
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_sprite_width_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    let test_sprite = create_sprite(test_bitmap);
    assert_eq!(100, sprite_width(test_sprite));
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_sprite_x_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    let test_sprite = create_sprite(test_bitmap);
    sprite_set_x(test_sprite, 150.0);
    assert_eq!(150.0, sprite_x(test_sprite));
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_sprite_y_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    let test_sprite = create_sprite(test_bitmap);
    sprite_set_y(test_sprite, 200.0);
    assert_eq!(200.0, sprite_y(test_sprite));
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_stop_calling_on_sprite_event_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    let test_sprite = create_sprite(test_bitmap);
    call_on_sprite_event(_on_sprite_event());
    process_events();
    simulate_sprite_event(test_sprite);
    process_events();
    assert!(sprite_event_occurred(test_sprite));
    stop_calling_on_sprite_event(_on_sprite_event());
    process_events();
    simulate_sprite_event(test_sprite);
    process_events();
    assert!(!sprite_event_occurred(test_sprite));
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_update_all_sprites_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    let test_sprite1 = create_sprite(test_bitmap);
    let test_sprite2 = create_sprite(test_bitmap);
    sprite_set_position(test_sprite1, point_at(100, 100));
    sprite_set_position(test_sprite2, point_at(200, 200));
    sprite_set_velocity(test_sprite1, vector_to(1, 1));
    sprite_set_velocity(test_sprite2, vector_to(-1, -1));
    update_all_sprites();
    assert_ne!(point_at(100, 100), sprite_position(test_sprite1));
    assert_ne!(point_at(200, 200), sprite_position(test_sprite2));
    free_all_sprites();
    close_window(test_window);
}
#[test]
fn test_update_all_sprites_percent_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    let test_sprite1 = create_sprite(test_bitmap);
    let test_sprite2 = create_sprite(test_bitmap);
    sprite_set_velocity(test_sprite1, vector_to(1.0, 1.0));
    sprite_set_velocity(test_sprite2, vector_to(-1.0, -1.0));
    update_all_sprites_percent(0.5);
    assert!(sprite_at(test_sprite1, point_at(50.0, 50.0)));
    assert!(sprite_at(test_sprite2, point_at(50.0, 50.0)));
    free_all_sprites();
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_update_sprite_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    let test_sprite = create_sprite(test_bitmap);
    sprite_set_velocity(test_sprite, vector_to(1.0, 1.0));
    update_sprite(test_sprite);
    assert_ne!(0.0, sprite_x(test_sprite));
    assert_ne!(0.0, sprite_y(test_sprite));
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_update_sprite_with_sound_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    let test_sprite = create_sprite(test_bitmap);
    sprite_set_velocity(test_sprite, vector_to(1.0, 1.0));
    sprite_start_animation(test_sprite, 0, true);
    update_sprite_with_sound(test_sprite, true);
    assert_ne!(0.0, sprite_x(test_sprite));
    assert_ne!(0.0, sprite_y(test_sprite));
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_update_sprite_percent_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    let test_sprite = create_sprite(test_bitmap);
    sprite_set_position(test_sprite, point_at(100.0, 100.0));
    sprite_set_velocity(test_sprite, vector_to(1.0, 1.0));
    update_sprite_percent(test_sprite, 0.5);
    assert!(point_in_circle(point_at(100.5, 100.5), sprite_collision_circle(test_sprite)));
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_update_sprite_percent_with_sound_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    let test_sprite = create_sprite(test_bitmap);
    sprite_set_position(test_sprite, point_at(400, 300));
    update_sprite_percent_with_sound(test_sprite, 0.5, true);
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_update_sprite_animation_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    let test_sprite = create_sprite(test_bitmap);
    sprite_start_animation(test_sprite, 0);
    update_sprite_animation(test_sprite);
    assert!(sprite_current_cell(test_sprite) > 0);
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_update_sprite_animation_with_sound_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    let test_sprite = create_sprite(test_bitmap);
    update_sprite_animation_with_sound(test_sprite, true);
    assert!(sprite_animation_has_ended(test_sprite));
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_update_sprite_animation_percent_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    let test_sprite = create_sprite(test_bitmap);
    update_sprite_animation_percent(test_sprite, 0.5);
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_update_sprite_animation_percent_with_sound_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    let test_sprite = create_sprite(test_bitmap);
    update_sprite_animation_percent_with_sound(test_sprite, 0.5, true);
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_vector_from_center_sprite_to_point_point_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    let test_sprite = create_sprite(test_bitmap);
    sprite_set_position(test_sprite, point_at(400, 300));
    let test_vector = vector_from_center_sprite_to_point_point(test_sprite, point_at(500, 400));
    assert_eq!(100, test_vector.x);
    assert_eq!(100, test_vector.y);
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_vector_from_to_integration() {
    let test_window = open_window("Test Window", 800, 600);
    let test_bitmap = create_bitmap("test_bitmap", 100, 100);
    let test_sprite1 = create_sprite(test_bitmap);
    let test_sprite2 = create_sprite(test_bitmap);
    sprite_set_position(test_sprite1, point_at(100, 100));
    sprite_set_position(test_sprite2, point_at(200, 200));
    let test_vector = vector_from_to(test_sprite1, test_sprite2);
    assert_eq!(100, test_vector.x);
    assert_eq!(100, test_vector.y);
    free_all_sprites();
    close_window(test_window);
}
