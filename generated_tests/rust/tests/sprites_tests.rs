use std::*;
use splashkit::*;
#[cfg(test)]
mod test_sprites {
use super::*;
// #[test]
// fn test_call_for_all_sprites_with_value_integration() {
//     let helper = helper::new();
//     let test_window = open_window("Test Window".to_string(), 800, 600);
//     let test_bitmap = create_bitmap("test_bitmap".to_string(), 100, 100);
//     let test_sprite1 = create_sprite(test_bitmap);
//     let test_sprite2 = create_sprite(test_bitmap);
//     sprite_set_x(test_sprite1, 100 as f32);
//     sprite_set_x(test_sprite2, 200 as f32);
//     call_for_all_sprites_with_value(helper.SpriteFloatFunction, 300 as f32);
//     assert_eq!(300.0 as f32, sprite_x(test_sprite1));
//     assert_eq!(300.0 as f32, sprite_x(test_sprite2));
//     free_all_sprites();
//     free_bitmap(test_bitmap);
//     close_window(test_window);
// }
// #[test]
// fn test_call_for_all_sprites_integration() {
//     let helper = helper::new();
//     let test_window = open_window("Test Window".to_string(), 800, 600);
//     let test_bitmap = create_bitmap("test_bitmap".to_string(), 100, 100);
//     let test_sprite1 = create_sprite(test_bitmap);
//     let test_sprite2 = create_sprite(test_bitmap);
//     sprite_set_position(test_sprite1, point_at(100.0, 100.0));
//     sprite_set_position(test_sprite2, point_at(200.0, 200.0));
//     call_for_all_sprites(helper.SpriteFunction);
//     assert_eq!(300.0 as f32, sprite_x(test_sprite1));
//     assert_eq!(300.0 as f32, sprite_x(test_sprite2));
//     free_all_sprites();
//     free_bitmap(test_bitmap);
//     close_window(test_window);
// }
// #[test]
// fn test_call_on_sprite_event_integration() {
//     let helper = helper::new();
//     let test_window = open_window("Test Window".to_string(), 800, 600);
//     let test_bitmap = create_bitmap("test_bitmap".to_string(), 100, 100);
//     let test_sprite = create_sprite_named("test_sprite".to_string(), test_bitmap);
//     call_on_sprite_event(helper.sprite_event_handler);
//     sprite_start_animation_named(test_sprite, "test".to_string());
//     update_sprite(test_sprite);
//     assert!(helper.event_called);
//     free_sprite(test_sprite);
//     free_bitmap(test_bitmap);
//     close_window(test_window);
// }
#[test]
fn test_center_point_of_sprite_integration() {
    let test_window = open_window("Test Window".to_string(), 800, 600);
    let test_bitmap = create_bitmap("test_bitmap".to_string(), 100, 100);
    let test_sprite = create_sprite(test_bitmap);
    sprite_set_position(test_sprite, point_at(100.0, 100.0));
    let center_point = center_point_of_sprite(test_sprite);
    assert_eq!(150.0, center_point.x);
    assert_eq!(150.0, center_point.y);
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_create_sprite_integration() {
    let test_window = open_window("Test Window".to_string(), 800, 600);
    let test_bitmap = create_bitmap("test_bitmap".to_string(), 100, 100);
    let test_sprite = create_sprite(test_bitmap);
    assert!(!test_sprite.is_null());
    assert!(has_sprite(sprite_name(test_sprite)));
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_create_sprite_with_animation_integration() {
    let test_window = open_window("Test Window".to_string(), 800, 600);
    let test_bitmap = create_bitmap("test_bitmap".to_string(), 100, 100);
    let test_animation = load_animation_script("test_animation".to_string(), "kermit.txt".to_string());
    let test_sprite = create_sprite_with_animation(test_bitmap, test_animation);
    assert!(!test_sprite.is_null());
    assert!(has_sprite(sprite_name(test_sprite)));
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    free_animation_script(test_animation);
    close_window(test_window);
}
#[test]
fn test_create_sprite_with_bitmap_named_integration() {
    let test_window = open_window("Test Window".to_string(), 800, 600);
    let test_bitmap = create_bitmap("test_bitmap".to_string(), 100, 100);
    let test_sprite = create_sprite_with_bitmap_named("test_bitmap".to_string());
    assert!(!test_sprite.is_null());
    assert!(has_sprite(sprite_name(test_sprite)));
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_create_sprite_named_integration() {
    let test_window = open_window("Test Window".to_string(), 800, 600);
    let test_bitmap = create_bitmap("test_bitmap".to_string(), 100, 100);
    let test_sprite = create_sprite_named("test_sprite".to_string(), test_bitmap);
    assert!(!test_sprite.is_null());
    assert_eq!("test_sprite".to_string(), sprite_name(test_sprite));
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_create_sprite_named_with_animation_integration() {
    let test_window = open_window("Test Window".to_string(), 800, 600);
    let test_bitmap = create_bitmap("test_bitmap".to_string(), 100, 100);
    let test_animation = load_animation_script("test_animation".to_string(), "kermit.txt".to_string());
    let test_sprite = create_sprite_named_with_animation("test_sprite".to_string(), test_bitmap, test_animation);
    assert!(!test_sprite.is_null());
    assert_eq!("test_sprite".to_string(), sprite_name(test_sprite));
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    free_animation_script(test_animation);
    close_window(test_window);
}
#[test]
fn test_create_sprite_with_bitmap_and_animation_named_integration() {
    let test_window = open_window("Test Window".to_string(), 800, 600);
    let test_bitmap = create_bitmap("test_bitmap".to_string(), 100, 100);
    let test_animation = load_animation_script("test_animation".to_string(), "kermit.txt".to_string());
    let test_sprite = create_sprite_with_bitmap_and_animation_named("test_bitmap".to_string(), "test_animation".to_string());
    assert!(!test_sprite.is_null());
    assert!(has_sprite(sprite_name(test_sprite)));
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    free_animation_script(test_animation);
    close_window(test_window);
}
#[test]
fn test_create_sprite_pack_integration() {
    let test_window = open_window("Test Window".to_string(), 800, 600);
    assert!(!has_sprite_pack("test_pack".to_string()));
    create_sprite_pack("test_pack".to_string());
    assert!(has_sprite_pack("test_pack".to_string()));
    free_sprite_pack("test_pack".to_string());
    close_window(test_window);
}
#[test]
fn test_current_sprite_pack_integration() {
    assert_eq!("default".to_string(), current_sprite_pack());
    create_sprite_pack("test_pack".to_string());
    select_sprite_pack("test_pack".to_string());
    assert_eq!("test_pack".to_string(), current_sprite_pack());
    select_sprite_pack("default".to_string());
    assert_eq!("default".to_string(), current_sprite_pack());
    free_sprite_pack("test_pack".to_string());
}
#[test]
fn test_draw_all_sprites_integration() {
    let test_window = open_window("Test Window".to_string(), 800, 600);
    let test_bitmap = create_bitmap("test_bitmap".to_string(), 100, 100);
    clear_bitmap(test_bitmap, color_black());
    let test_sprite1 = create_sprite(test_bitmap);
    let test_sprite2 = create_sprite(test_bitmap);
    sprite_set_position(test_sprite1, point_at(100.0, 100.0));
    sprite_set_position(test_sprite2, point_at(200.0, 200.0));
    clear_screen(color_white());
    draw_all_sprites();
    refresh_screen();
    assert_eq!(color_black(), get_pixel_from_window(test_window, 100.0, 100.0));
    assert_eq!(color_black(), get_pixel_from_window(test_window, 200.0, 200.0));
    free_all_sprites();
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_draw_sprite_offset_by_integration() {
    let test_window = open_window("Test Window".to_string(), 800, 600);
    let test_bitmap = create_bitmap("test_bitmap".to_string(), 100, 100);
    clear_bitmap(test_bitmap, color_black());
    let test_sprite = create_sprite(test_bitmap);
    sprite_set_position(test_sprite, point_at(400.0, 300.0));
    clear_screen(color_white());
    draw_sprite_offset_by(test_sprite, vector_from_angle(50.0, 50.0));
    refresh_screen();
    assert_ne!(color_white(), get_pixel_from_window(test_window, 450.0, 350.0));
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_draw_sprite_integration() {
    let test_window = open_window("Test Window".to_string(), 800, 600);
    let test_bitmap = create_bitmap("test_bitmap".to_string(), 100, 100);
    clear_bitmap(test_bitmap, color_black());
    let test_sprite = create_sprite_named("test_sprite".to_string(), test_bitmap);
    sprite_set_position(test_sprite, point_at(400.0, 300.0));
    clear_screen(color_white());
    draw_sprite(test_sprite);
    refresh_screen();
    assert_eq!(color_black(), get_pixel_from_window(test_window, 400.0, 300.0));
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_draw_sprite_offset_x_y_integration() {
    let test_window = open_window("Test Window".to_string(), 800, 600);
    let test_bitmap = create_bitmap("test_bitmap".to_string(), 100, 100);
    clear_bitmap(test_bitmap, color_black());
    let test_sprite = create_sprite(test_bitmap);
    sprite_set_position(test_sprite, point_at(400.0, 300.0));
    clear_screen(color_white());
    draw_sprite_offset_x_y(test_sprite, 50.0, 50.0);
    refresh_screen();
    assert_ne!(color_white(), get_pixel_from_window(test_window, 450.0, 350.0));
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_free_all_sprites_integration() {
    let test_window = open_window("Test Window".to_string(), 800, 600);
    let test_bitmap = create_bitmap("test_bitmap".to_string(), 100, 100);
    create_sprite_named("test_sprite1".to_string(), test_bitmap);
    create_sprite_named("test_sprite2".to_string(), test_bitmap);
    assert!(has_sprite("test_sprite1".to_string()));
    assert!(has_sprite("test_sprite2".to_string()));
    free_all_sprites();
    assert!(!has_sprite("test_sprite1".to_string()));
    assert!(!has_sprite("test_sprite2".to_string()));
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_free_sprite_integration() {
    let test_window = open_window("Test Window".to_string(), 800, 600);
    let test_bitmap = create_bitmap("test_bitmap".to_string(), 100, 100);
    let test_sprite = create_sprite_named("test_sprite".to_string(), test_bitmap);
    assert!(has_sprite("test_sprite".to_string()));
    free_sprite(test_sprite);
    assert!(!has_sprite("test_sprite".to_string()));
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_free_sprite_pack_integration() {
    assert!(has_sprite_pack("default".to_string()));
    create_sprite_pack("test_pack".to_string());
    assert!(has_sprite_pack("test_pack".to_string()));
    free_sprite_pack("test_pack".to_string());
    assert!(!has_sprite_pack("test_pack".to_string()));
    assert!(has_sprite_pack("default".to_string()));
}
#[test]
fn test_has_sprite_integration() {
    let test_window = open_window("Test Window".to_string(), 800, 600);
    let test_bitmap = create_bitmap("test_bitmap".to_string(), 100, 100);
    assert!(!has_sprite("test_sprite".to_string()));
    let test_sprite = create_sprite_named("test_sprite".to_string(), test_bitmap);
    assert!(has_sprite("test_sprite".to_string()));
    free_sprite(test_sprite);
    assert!(!has_sprite("test_sprite".to_string()));
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_has_sprite_pack_integration() {
    assert!(!has_sprite_pack("test_pack".to_string()));
    create_sprite_pack("test_pack".to_string());
    assert!(has_sprite_pack("test_pack".to_string()));
    free_sprite_pack("test_pack".to_string());
    assert!(!has_sprite_pack("test_pack".to_string()));
}
#[test]
fn test_move_sprite_integration() {
    let test_window = open_window("Test Window".to_string(), 800, 600);
    let test_bitmap = create_bitmap("test_bitmap".to_string(), 100, 100);
    let test_sprite = create_sprite_named("test_sprite".to_string(), test_bitmap);
    let start_position = point_at(100.0, 100.0);
    sprite_set_position(test_sprite, start_position);
    sprite_set_velocity(test_sprite, vector_to(10.0, 10.0));
    move_sprite(test_sprite);
    assert_eq!(110.0 as f32, sprite_x(test_sprite));
    assert_eq!(110.0 as f32, sprite_y(test_sprite));
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_move_sprite_by_vector_integration() {
    let test_window = open_window("Test Window".to_string(), 800, 600);
    let test_bitmap = create_bitmap("test_bitmap".to_string(), 100, 100);
    let test_sprite = create_sprite_named("test_sprite".to_string(), test_bitmap);
    sprite_set_position(test_sprite, point_at(100.0, 100.0));
    move_sprite_by_vector(test_sprite, vector_to(50.0, 50.0));
    assert_eq!(150.0 as f32, sprite_x(test_sprite));
    assert_eq!(150 as f32, sprite_y(test_sprite));
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_move_sprite_by_vector_percent_integration() {
    let test_window = open_window("Test Window".to_string(), 800, 600);
    let test_bitmap = create_bitmap("test_bitmap".to_string(), 100, 100);
    let test_sprite = create_sprite_named("test_sprite".to_string(), test_bitmap);
    sprite_set_position(test_sprite, point_at(100.0, 100.0));
    move_sprite_by_vector_percent(test_sprite, vector_to(50.0, 50.0), 0.5 as f32);
    assert_eq!(125.0 as f32, sprite_x(test_sprite));
    assert_eq!(125.0 as f32, sprite_y(test_sprite));
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_move_sprite_percent_integration() {
    let test_window = open_window("Test Window".to_string(), 800, 600);
    let test_bitmap = create_bitmap("test_bitmap".to_string(), 100, 100);
    let test_sprite = create_sprite_named("test_sprite".to_string(), test_bitmap);
    sprite_set_position(test_sprite, point_at(100.0, 100.0));
    sprite_set_velocity(test_sprite, vector_to(10.0, 10.0));
    move_sprite_percent(test_sprite, 0.5 as f32);
    assert_eq!(105.0 as f32, sprite_x(test_sprite));
    assert_eq!(105.0 as f32, sprite_y(test_sprite));
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_move_sprite_to_integration() {
    let test_window = open_window("Test Window".to_string(), 800, 600);
    let test_bitmap = create_bitmap("test_bitmap".to_string(), 100, 100);
    let test_sprite = create_sprite_named("test_sprite".to_string(), test_bitmap);
    move_sprite_to(test_sprite, 400.0, 300.0);
    assert_eq!(400.0 as f32, sprite_x(test_sprite));
    assert_eq!(300.0 as f32, sprite_y(test_sprite));
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_select_sprite_pack_integration() {
    let test_window = open_window("Test Window".to_string(), 800, 600);
    create_sprite_pack("test_pack".to_string());
    let test_bitmap = create_bitmap("test_bitmap".to_string(), 100, 100);
    let test_sprite = create_sprite_named("test_sprite".to_string(), test_bitmap);
    assert_eq!("default".to_string(), current_sprite_pack());
    select_sprite_pack("test_pack".to_string());
    assert_eq!("test_pack".to_string(), current_sprite_pack());
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    free_sprite_pack("test_pack".to_string());
    close_window(test_window);
}
#[test]
fn test_sprite_add_layer_integration() {
    let test_window = open_window("Test Window".to_string(), 800, 600);
    let test_bitmap = create_bitmap("test_bitmap".to_string(), 100, 100);
    let test_sprite = create_sprite_named("test_sprite".to_string(), test_bitmap);
    let new_layer_bitmap = create_bitmap("new_layer".to_string(), 50, 50);
    let layer_index = sprite_add_layer(test_sprite, new_layer_bitmap, "new_layer".to_string());
    assert_eq!(1, layer_index);
    assert_eq!(2, sprite_layer_count(test_sprite));
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    free_bitmap(new_layer_bitmap);
    close_window(test_window);
}
#[test]
fn test_sprite_add_to_velocity_integration() {
    let test_window = open_window("Test Window".to_string(), 800, 600);
    let test_bitmap = create_bitmap("test_bitmap".to_string(), 100, 100);
    let test_sprite = create_sprite_named("test_sprite".to_string(), test_bitmap);
    sprite_set_velocity(test_sprite, vector_to(0.0, 0.0));
    sprite_add_to_velocity(test_sprite, vector_to(10.0, 10.0));
    let velocity = sprite_velocity(test_sprite);
    assert_eq!(10.0, velocity.x);
    assert_eq!(10.0, velocity.y);
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_sprite_add_value_integration() {
    let test_window = open_window("Test Window".to_string(), 800, 600);
    let test_bitmap = create_bitmap("test_bitmap".to_string(), 100, 100);
    let test_sprite = create_sprite_named("test_sprite".to_string(), test_bitmap);
    sprite_add_value_with_default(test_sprite, "health".to_string(), 100.0 as f32);
    assert!(sprite_has_value(test_sprite, "health".to_string()));
    assert_eq!(100.0 as f32, sprite_value(test_sprite, "health".to_string()));
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_sprite_add_value_with_default_integration() {
    let test_window = open_window("Test Window".to_string(), 800, 600);
    let test_bitmap = create_bitmap("test_bitmap".to_string(), 100, 100);
    let test_sprite = create_sprite_named("test_sprite".to_string(), test_bitmap);
    sprite_add_value_with_default(test_sprite, "health".to_string(), 100.0 as f32);
    assert!(sprite_has_value(test_sprite, "health".to_string()));
    assert_eq!(100.0 as f32, sprite_value(test_sprite, "health".to_string()));
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_sprite_anchor_point_integration() {
    let test_window = open_window("Test Window".to_string(), 800, 600);
    let test_bitmap = create_bitmap("test_bitmap".to_string(), 100, 100);
    let test_sprite = create_sprite_named("test_sprite".to_string(), test_bitmap);
    let anchor_point = sprite_anchor_point(test_sprite);
    assert_eq!(50.0, anchor_point.x);
    assert_eq!(50.0, anchor_point.y);
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_sprite_anchor_position_integration() {
    let test_window = open_window("Test Window".to_string(), 800, 600);
    let test_bitmap = create_bitmap("test_bitmap".to_string(), 100, 100);
    let test_sprite = create_sprite_named("test_sprite".to_string(), test_bitmap);
    sprite_set_position(test_sprite, point_at(100.0, 100.0));
    let anchor_position = sprite_anchor_position(test_sprite);
    assert_eq!(150.0, anchor_position.x);
    assert_eq!(150.0, anchor_position.y);
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_sprite_animation_has_ended_integration() {
    let test_window = open_window("Test Window".to_string(), 800, 600);
    let test_bitmap = create_bitmap("test_bitmap".to_string(), 100, 100);
    let test_animation = load_animation_script("test_animation".to_string(), "kermit.txt".to_string());
    let test_sprite = create_sprite_named_with_animation("test_sprite".to_string(), test_bitmap, test_animation);
    sprite_start_animation_named(test_sprite, "walkfront".to_string());
    assert!(!sprite_animation_has_ended(test_sprite));
    update_sprite_animation_percent(test_sprite, 100.0 as f32);
    assert!(sprite_animation_has_ended(test_sprite));
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    free_animation_script(test_animation);
    close_window(test_window);
}
#[test]
fn test_sprite_animation_name_integration() {
    let test_window = open_window("Test Window".to_string(), 800, 600);
    let test_bitmap = create_bitmap("test_bitmap".to_string(), 100, 100);
    let test_animation = load_animation_script("test_animation".to_string(), "kermit.txt".to_string());
    let test_sprite = create_sprite_named_with_animation("test_sprite".to_string(), test_bitmap, test_animation);
    sprite_start_animation_named(test_sprite, "walkfront".to_string());
    assert_eq!("walkfront".to_string(), sprite_animation_name(test_sprite));
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    free_animation_script(test_animation);
    close_window(test_window);
}
#[test]
fn test_sprite_at_integration() {
    let test_window = open_window("Test Window".to_string(), 800, 600);
    let test_bitmap = create_bitmap("test_bitmap".to_string(), 100, 100);
    clear_bitmap(test_bitmap, color_red());
    let test_sprite = create_sprite_named("test_sprite".to_string(), test_bitmap);
    sprite_set_x(test_sprite, 400 as f32);
    sprite_set_y(test_sprite, 300 as f32);
    draw_sprite(test_sprite);
    assert!(sprite_at(test_sprite, point_at(400.0, 300.0)));
    assert!(!sprite_at(test_sprite, point_at(600.0, 500.0)));
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_sprite_bring_layer_forward_integration() {
    let test_window = open_window("Test Window".to_string(), 800, 600);
    let test_bitmap = create_bitmap("test_bitmap".to_string(), 100, 100);
    let test_sprite = create_sprite_named("test_sprite".to_string(), test_bitmap);
    let layer_index = sprite_add_layer(test_sprite, test_bitmap, "layer2".to_string());
    sprite_show_layer(test_sprite, layer_index);
    let visible_index = sprite_visible_index_of_layer(test_sprite, layer_index);
    sprite_bring_layer_forward(test_sprite, visible_index);
    assert_eq!(0, sprite_visible_index_of_layer(test_sprite, layer_index));
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_sprite_bring_layer_to_front_integration() {
    let test_window = open_window("Test Window".to_string(), 800, 600);
    let test_bitmap = create_bitmap("test_bitmap".to_string(), 100, 100);
    let test_sprite = create_sprite_named("test_sprite".to_string(), test_bitmap);
    let layer_index = sprite_add_layer(test_sprite, test_bitmap, "layer2".to_string());
    sprite_show_layer(test_sprite, layer_index);
    let visible_index = sprite_visible_index_of_layer(test_sprite, layer_index);
    sprite_bring_layer_to_front(test_sprite, visible_index);
    assert_eq!(0, sprite_visible_index_of_layer_named(test_sprite, "layer2".to_string()));
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
// #[test]
// fn test_sprite_call_on_event_integration() {
//     let helper = helper::new();
//     let test_window = open_window("Test Window".to_string(), 800, 600);
//     let test_bitmap = create_bitmap("test_bitmap".to_string(), 100, 100);
//     let test_sprite = create_sprite_named("test_sprite".to_string(), test_bitmap);
//     sprite_call_on_event(test_sprite, helper.sprite_event_handler);
//     sprite_start_animation_named(test_sprite, "test".to_string());
//     update_sprite(test_sprite);
//     assert!(helper.event_called);
//     free_sprite(test_sprite);
//     free_bitmap(test_bitmap);
//     close_window(test_window);
// }
#[test]
fn test_sprite_circle_integration() {
    let test_window = open_window("Test Window".to_string(), 800, 600);
    let test_bitmap = create_bitmap("test_bitmap".to_string(), 100, 100);
    let test_sprite = create_sprite_named("test_sprite".to_string(), test_bitmap);
    let circle = sprite_circle(test_sprite);
    assert_eq!(50.0, circle.center.x);
    assert_eq!(50.0, circle.center.y);
    assert_eq!(50.0, circle.radius);
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_sprite_collision_bitmap_integration() {
    let test_window = open_window("Test Window".to_string(), 800, 600);
    let test_bitmap = create_bitmap("test_bitmap".to_string(), 100, 100);
    let test_sprite = create_sprite_named("test_sprite".to_string(), test_bitmap);
    let collision_bitmap = sprite_collision_bitmap(test_sprite);
    assert_eq!(test_bitmap, collision_bitmap);
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_sprite_collision_circle_integration() {
    let test_window = open_window("Test Window".to_string(), 800, 600);
    let test_bitmap = create_bitmap("test_bitmap".to_string(), 100, 100);
    let test_sprite = create_sprite_named("test_sprite".to_string(), test_bitmap);
    let circle = sprite_collision_circle(test_sprite);
    assert_eq!(50.0, circle.center.x);
    assert_eq!(50.0, circle.center.y);
    assert_eq!(50.0, circle.radius);
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_sprite_collision_kind_integration() {
    let test_window = open_window("Test Window".to_string(), 800, 600);
    let test_bitmap = create_bitmap("test_bitmap".to_string(), 100, 100);
    let test_sprite = create_sprite_named("test_sprite".to_string(), test_bitmap);
    assert_eq!(CollisionTestKind::PixelCollisions, sprite_collision_kind(test_sprite));
    sprite_set_collision_kind(test_sprite, CollisionTestKind::AabbCollisions);
    assert_eq!(CollisionTestKind::AabbCollisions, sprite_collision_kind(test_sprite));
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_sprite_collision_rectangle_integration() {
    let test_window = open_window("Test Window".to_string(), 800, 600);
    let test_bitmap = create_bitmap("test_bitmap".to_string(), 100, 100);
    let test_sprite = create_sprite_named("test_sprite".to_string(), test_bitmap);
    let rect = sprite_collision_rectangle(test_sprite);
    assert_eq!(0.0, rect.x);
    assert_eq!(0.0, rect.y);
    assert_eq!(100.0, rect.width);
    assert_eq!(100.0, rect.height);
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_sprite_current_cell_integration() {
    let test_window = open_window("Test Window".to_string(), 800, 600);
    let test_bitmap = create_bitmap("test_bitmap".to_string(), 100, 100);
    let test_animation = load_animation_script("test_animation".to_string(), "kermit.txt".to_string());
    let test_sprite = create_sprite_named_with_animation("test_sprite".to_string(), test_bitmap, test_animation);
    sprite_start_animation_named(test_sprite, "test_animation".to_string());
    assert_eq!(0, sprite_current_cell(test_sprite));
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    free_animation_script(test_animation);
    close_window(test_window);
}
#[test]
fn test_sprite_current_cell_rectangle_integration() {
    let test_window = open_window("Test Window".to_string(), 800, 600);
    let test_bitmap = create_bitmap("test_bitmap".to_string(), 100, 100);
    let test_sprite = create_sprite_named("test_sprite".to_string(), test_bitmap);
    let rect = sprite_current_cell_rectangle(test_sprite);
    assert_eq!(0.0, rect.x);
    assert_eq!(0.0, rect.y);
    assert_eq!(100.0, rect.width);
    assert_eq!(100.0, rect.height);
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_sprite_dx_integration() {
    let test_window = open_window("Test Window".to_string(), 800, 600);
    let test_bitmap = create_bitmap("test_bitmap".to_string(), 100, 100);
    let test_sprite = create_sprite_named("test_sprite".to_string(), test_bitmap);
    assert_eq!(0.0, sprite_dx(test_sprite));
    sprite_set_dx(test_sprite, 5.0 as f32);
    assert_eq!(5.0, sprite_dx(test_sprite));
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_sprite_dy_integration() {
    let test_window = open_window("Test Window".to_string(), 800, 600);
    let test_bitmap = create_bitmap("test_bitmap".to_string(), 100, 100);
    let test_sprite = create_sprite_named("test_sprite".to_string(), test_bitmap);
    assert_eq!(0.0, sprite_dy(test_sprite));
    sprite_set_dy(test_sprite, 5.0 as f32);
    assert_eq!(5.0, sprite_dy(test_sprite));
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_sprite_has_value_integration() {
    let test_window = open_window("Test Window".to_string(), 800, 600);
    let test_bitmap = create_bitmap("test_bitmap".to_string(), 100, 100);
    let test_sprite = create_sprite_named("test_sprite".to_string(), test_bitmap);
    assert!(!sprite_has_value(test_sprite, "health".to_string()));
    sprite_add_value_with_default(test_sprite, "health".to_string(), 100.0 as f32);
    assert!(sprite_has_value(test_sprite, "health".to_string()));
    assert!(!sprite_has_value(test_sprite, "mana".to_string()));
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_sprite_heading_integration() {
    let test_window = open_window("Test Window".to_string(), 800, 600);
    let test_bitmap = create_bitmap("test_bitmap".to_string(), 100, 100);
    let test_sprite = create_sprite_named("test_sprite".to_string(), test_bitmap);
    assert_eq!(90.0, sprite_heading(test_sprite));
    sprite_set_velocity(test_sprite, vector_to(1.0, 1.0));
    assert_eq!(45.0, sprite_heading(test_sprite));
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_sprite_height_integration() {
    let test_window = open_window("Test Window".to_string(), 800, 600);
    let test_bitmap = create_bitmap("test_bitmap".to_string(), 100, 100);
    let test_sprite = create_sprite_named("test_sprite".to_string(), test_bitmap);
    assert_eq!(100, sprite_height(test_sprite));
    sprite_set_scale(test_sprite, 2.0 as f32);
    assert_eq!(100, sprite_height(test_sprite));
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_sprite_hide_layer_named_integration() {
    let test_window = open_window("Test Window".to_string(), 800, 600);
    let test_bitmap = create_bitmap("test_bitmap".to_string(), 100, 100);
    let test_sprite = create_sprite_named("test_sprite".to_string(), test_bitmap);
    sprite_add_layer(test_sprite, test_bitmap, "layer2".to_string());
    sprite_show_layer_named(test_sprite, "layer2".to_string());
    assert_eq!(2, sprite_visible_layer_count(test_sprite));
    sprite_hide_layer_named(test_sprite, "layer2".to_string());
    assert_eq!(1, sprite_visible_layer_count(test_sprite));
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_sprite_hide_layer_integration() {
    let test_window = open_window("Test Window".to_string(), 800, 600);
    let test_bitmap = create_bitmap("test_bitmap".to_string(), 100, 100);
    let test_sprite = create_sprite_named("test_sprite".to_string(), test_bitmap);
    let layer_idx = sprite_add_layer(test_sprite, test_bitmap, "layer2".to_string());
    sprite_show_layer(test_sprite, layer_idx);
    assert_eq!(2, sprite_visible_layer_count(test_sprite));
    sprite_hide_layer(test_sprite, layer_idx);
    assert_eq!(1, sprite_visible_layer_count(test_sprite));
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_sprite_layer_named_integration() {
    let test_window = open_window("Test Window".to_string(), 800, 600);
    let test_bitmap = create_bitmap("test_bitmap".to_string(), 100, 100);
    let test_sprite = create_sprite_named("test_sprite".to_string(), test_bitmap);
    sprite_add_layer(test_sprite, test_bitmap, "layer2".to_string());
    assert_eq!(test_bitmap, sprite_layer_named(test_sprite, "layer2".to_string()));
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_sprite_layer_at_index_integration() {
    let test_window = open_window("Test Window".to_string(), 800, 600);
    let test_bitmap = create_bitmap("test_bitmap".to_string(), 100, 100);
    let test_sprite = create_sprite_named("test_sprite".to_string(), test_bitmap);
    let layer_idx = sprite_add_layer(test_sprite, test_bitmap, "layer2".to_string());
    assert_eq!(test_bitmap, sprite_layer_at_index(test_sprite, layer_idx));
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_sprite_layer_circle_named_integration() {
    let test_window = open_window("Test Window".to_string(), 800, 600);
    let test_bitmap = create_bitmap("test_bitmap".to_string(), 100, 100);
    let test_sprite = create_sprite_named("test_sprite".to_string(), test_bitmap);
    let circle = sprite_layer_circle_named(test_sprite, "base_layer".to_string());
    assert_eq!(50.0, circle.center.x);
    assert_eq!(50.0, circle.center.y);
    assert_eq!(50.0, circle.radius);
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_sprite_layer_circle_at_index_integration() {
    let test_window = open_window("Test Window".to_string(), 800, 600);
    let test_bitmap = create_bitmap("test_bitmap".to_string(), 100, 100);
    let test_sprite = create_sprite_named("test_sprite".to_string(), test_bitmap);
    let circle = sprite_layer_circle_at_index(test_sprite, 0);
    assert_eq!(50.0, circle.center.x);
    assert_eq!(50.0, circle.center.y);
    assert_eq!(50.0, circle.radius);
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_sprite_layer_count_integration() {
    let test_window = open_window("Test Window".to_string(), 800, 600);
    let test_bitmap = create_bitmap("test_bitmap".to_string(), 100, 100);
    let test_sprite = create_sprite_named("test_sprite".to_string(), test_bitmap);
    assert_eq!(1, sprite_layer_count(test_sprite));
    let layer_idx = sprite_add_layer(test_sprite, test_bitmap, "layer2".to_string());
    assert_eq!(2, sprite_layer_count(test_sprite));
    assert_eq!(1, layer_idx);
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_sprite_layer_height_named_integration() {
    let test_window = open_window("Test Window".to_string(), 800, 600);
    let test_bitmap = create_bitmap("test_bitmap".to_string(), 100, 100);
    let test_sprite = create_sprite_named("test_sprite".to_string(), test_bitmap);
    assert_eq!(100, sprite_layer_height_named(test_sprite, "base_layer".to_string()));
    sprite_add_layer(test_sprite, test_bitmap, "layer2".to_string());
    assert_eq!(100, sprite_layer_height_named(test_sprite, "layer2".to_string()));
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_sprite_layer_height_integration() {
    let test_window = open_window("Test Window".to_string(), 800, 600);
    let test_bitmap = create_bitmap("test_bitmap".to_string(), 100, 100);
    let test_sprite = create_sprite_named("test_sprite".to_string(), test_bitmap);
    assert_eq!(100, sprite_layer_height(test_sprite, 0));
    let layer_idx = sprite_add_layer(test_sprite, test_bitmap, "layer2".to_string());
    assert_eq!(100, sprite_layer_height(test_sprite, layer_idx));
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_sprite_layer_index_integration() {
    let test_window = open_window("Test Window".to_string(), 800, 600);
    let test_bitmap = create_bitmap("test_bitmap".to_string(), 100, 100);
    let test_sprite = create_sprite_named("test_sprite".to_string(), test_bitmap);
    assert_eq!(0, sprite_layer_index(test_sprite, "base_layer".to_string()));
    let layer_idx = sprite_add_layer(test_sprite, test_bitmap, "layer2".to_string());
    assert_eq!(layer_idx, sprite_layer_index(test_sprite, "layer2".to_string()));
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_sprite_layer_name_integration() {
    let test_window = open_window("Test Window".to_string(), 800, 600);
    let test_bitmap = create_bitmap("test_bitmap".to_string(), 100, 100);
    let test_sprite = create_sprite_named("test_sprite".to_string(), test_bitmap);
    let layer_idx = sprite_add_layer(test_sprite, test_bitmap, "layer2".to_string());
    assert_eq!("".to_string(), sprite_layer_name(test_sprite, layer_idx));
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_sprite_layer_offset_named_integration() {
    let test_window = open_window("Test Window".to_string(), 800, 600);
    let test_bitmap = create_bitmap("test_bitmap".to_string(), 100, 100);
    let test_sprite = create_sprite_named("test_sprite".to_string(), test_bitmap);
    assert_eq!(vector_to(0.0, 0.0), sprite_layer_offset_named(test_sprite, "base_layer".to_string()));
    sprite_set_layer_offset_named(test_sprite, "base_layer".to_string(), vector_to(10.0, 10.0));
    assert_eq!(vector_to(10.0, 10.0), sprite_layer_offset_named(test_sprite, "base_layer".to_string()));
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_sprite_layer_offset_integration() {
    let test_window = open_window("Test Window".to_string(), 800, 600);
    let test_bitmap = create_bitmap("test_bitmap".to_string(), 100, 100);
    let test_sprite = create_sprite_named("test_sprite".to_string(), test_bitmap);
    assert_eq!(vector_to(0.0, 0.0), sprite_layer_offset(test_sprite, 0));
    let layer_idx = sprite_add_layer(test_sprite, test_bitmap, "layer2".to_string());
    sprite_set_layer_offset_at_index(test_sprite, layer_idx, vector_to(10.0, 10.0));
    assert_eq!(vector_to(10.0, 10.0), sprite_layer_offset(test_sprite, layer_idx));
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_sprite_layer_rectangle_named_integration() {
    let test_window = open_window("Test Window".to_string(), 800, 600);
    let test_bitmap = create_bitmap("test_bitmap".to_string(), 100, 100);
    let test_sprite = create_sprite_named("test_sprite".to_string(), test_bitmap);
    let rect = sprite_layer_rectangle_named(test_sprite, "base_layer".to_string());
    assert_eq!(0.0, rect.x);
    assert_eq!(0.0, rect.y);
    assert_eq!(100.0, rect.width);
    assert_eq!(100.0, rect.height);
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_sprite_layer_rectangle_at_index_integration() {
    let test_window = open_window("Test Window".to_string(), 800, 600);
    let test_bitmap = create_bitmap("test_bitmap".to_string(), 100, 100);
    let test_sprite = create_sprite_named("test_sprite".to_string(), test_bitmap);
    let rect = sprite_layer_rectangle_at_index(test_sprite, 0);
    assert_eq!(0.0, rect.x);
    assert_eq!(0.0, rect.y);
    assert_eq!(100.0, rect.width);
    assert_eq!(100.0, rect.height);
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_sprite_layer_width_named_integration() {
    let test_window = open_window("Test Window".to_string(), 800, 600);
    let test_bitmap = create_bitmap("test_bitmap".to_string(), 100, 100);
    let test_sprite = create_sprite_named("test_sprite".to_string(), test_bitmap);
    assert_eq!(100, sprite_layer_width_named(test_sprite, "base_layer".to_string()));
    sprite_add_layer(test_sprite, test_bitmap, "layer2".to_string());
    assert_eq!(100, sprite_layer_width_named(test_sprite, "layer2".to_string()));
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_sprite_layer_width_integration() {
    let test_window = open_window("Test Window".to_string(), 800, 600);
    let test_bitmap = create_bitmap("test_bitmap".to_string(), 100, 100);
    let test_sprite = create_sprite_named("test_sprite".to_string(), test_bitmap);
    assert_eq!(100, sprite_layer_width(test_sprite, 0));
    let layer_idx = sprite_add_layer(test_sprite, test_bitmap, "layer2".to_string());
    assert_eq!(100, sprite_layer_width(test_sprite, layer_idx));
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_sprite_location_matrix_integration() {
    let test_window = open_window("Test Window".to_string(), 800, 600);
    let test_bitmap = create_bitmap("test_bitmap".to_string(), 100, 100);
    let test_sprite = create_sprite_named("test_sprite".to_string(), test_bitmap);
    sprite_set_position(test_sprite, point_at(100.0, 100.0));
    sprite_set_rotation(test_sprite, 45 as f32);
    let matrix = sprite_location_matrix(test_sprite);
    assert_eq!(150.0, matrix.elements[0][2]);
    assert_eq!(1.0, matrix.elements[2][2]);
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_sprite_mass_integration() {
    let test_window = open_window("Test Window".to_string(), 800, 600);
    let test_bitmap = create_bitmap("test_bitmap".to_string(), 100, 100);
    let test_sprite = create_sprite_named("test_sprite".to_string(), test_bitmap);
    assert_eq!(1.0, sprite_mass(test_sprite));
    sprite_set_mass(test_sprite, 10.0 as f32);
    assert_eq!(10.0, sprite_mass(test_sprite));
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_sprite_move_from_anchor_point_integration() {
    let test_window = open_window("Test Window".to_string(), 800, 600);
    let test_bitmap = create_bitmap("test_bitmap".to_string(), 100, 100);
    let test_sprite = create_sprite_named("test_sprite".to_string(), test_bitmap);
    assert!(!sprite_move_from_anchor_point(test_sprite));
    sprite_set_move_from_anchor_point(test_sprite, true);
    assert!(sprite_move_from_anchor_point(test_sprite));
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_sprite_move_to_taking_seconds_integration() {
    let test_window = open_window("Test Window".to_string(), 800, 600);
    let test_bitmap = create_bitmap("test_bitmap".to_string(), 100, 100);
    let test_sprite = create_sprite_named("test_sprite".to_string(), test_bitmap);
    sprite_set_position(test_sprite, point_at(100.0, 100.0));
    sprite_move_to_taking_seconds(test_sprite, point_at(200.0, 200.0), 1.0 as f32);
    update_sprite(test_sprite);
    let position = sprite_position(test_sprite);
    assert_eq!(200.0, position.x);
    assert_eq!(200.0, position.y);
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_sprite_name_integration() {
    let test_window = open_window("Test Window".to_string(), 800, 600);
    let test_bitmap = create_bitmap("test_bitmap".to_string(), 100, 100);
    let test_sprite = create_sprite_named("test_sprite".to_string(), test_bitmap);
    assert_eq!("test_sprite".to_string(), sprite_name(test_sprite));
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_sprite_named_integration() {
    let test_window = open_window("Test Window".to_string(), 800, 600);
    let test_bitmap = create_bitmap("test_bitmap".to_string(), 100, 100);
    let test_sprite = create_sprite_named("test_sprite".to_string(), test_bitmap);
    assert_eq!(test_sprite, sprite_named("test_sprite".to_string()));
    assert!(sprite_named("non_existent_sprite".to_string()).is_null());
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_sprite_offscreen_integration() {
    let test_window = open_window("Test Window".to_string(), 800, 600);
    let test_bitmap = create_bitmap("test_bitmap".to_string(), 100, 100);
    let test_sprite = create_sprite_named("test_sprite".to_string(), test_bitmap);
    sprite_set_position(test_sprite, point_at(400.0, 300.0));
    assert!(!sprite_offscreen(test_sprite));
    sprite_set_position(test_sprite, point_at(-200.0, -200.0));
    assert!(sprite_offscreen(test_sprite));
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_sprite_on_screen_at_point_integration() {
    let test_window = open_window("Test Window".to_string(), 800, 600);
    let test_bitmap = create_bitmap("test_bitmap".to_string(), 100, 100);
    let test_sprite = create_sprite_named("test_sprite".to_string(), test_bitmap);
    sprite_set_position(test_sprite, point_at(400.0, 300.0));
    assert!(sprite_on_screen_at_point(test_sprite, point_at(400.0, 300.0)));
    assert!(!sprite_on_screen_at_point(test_sprite, point_at(0.0, 0.0)));
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_sprite_on_screen_at_integration() {
    let test_window = open_window("Test Window".to_string(), 800, 600);
    let test_bitmap = create_bitmap("test_bitmap".to_string(), 100, 100);
    let test_sprite = create_sprite_named("test_sprite".to_string(), test_bitmap);
    sprite_set_position(test_sprite, point_at(400.0, 300.0));
    assert!(sprite_on_screen_at(test_sprite, 400.0, 300.0));
    assert!(!sprite_on_screen_at(test_sprite, 0.0, 0.0));
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_sprite_position_integration() {
    let test_window = open_window("Test Window".to_string(), 800, 600);
    let test_bitmap = create_bitmap("test_bitmap".to_string(), 100, 100);
    let test_sprite = create_sprite_named("test_sprite".to_string(), test_bitmap);
    assert_eq!(point_at(0.0, 0.0), sprite_position(test_sprite));
    sprite_set_position(test_sprite, point_at(400.0, 300.0));
    assert_eq!(point_at(400.0, 300.0), sprite_position(test_sprite));
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_sprite_replay_animation_integration() {
    let test_window = open_window("Test Window".to_string(), 800, 600);
    let test_bitmap = create_bitmap("test_bitmap".to_string(), 100, 100);
    let test_animation = load_animation_script("test_animation".to_string(), "kermit.txt".to_string());
    let test_sprite = create_sprite_with_animation(test_bitmap, test_animation);
    sprite_start_animation_named(test_sprite, "walkfront".to_string());
    assert!(!sprite_animation_has_ended(test_sprite));
    update_sprite_percent(test_sprite, 100.0 as f32);
    sprite_replay_animation(test_sprite);
    assert!(!sprite_animation_has_ended(test_sprite));
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_sprite_replay_animation_with_sound_integration() {
    let test_window = open_window("Test Window".to_string(), 800, 600);
    let test_bitmap = create_bitmap("test_bitmap".to_string(), 100, 100);
    let test_animation = load_animation_script("test_animation".to_string(), "kermit.txt".to_string());
    let test_sprite = create_sprite_with_animation(test_bitmap, test_animation);
    sprite_start_animation_named(test_sprite, "walkfront".to_string());
    assert!(!sprite_animation_has_ended(test_sprite));
    update_sprite_percent(test_sprite, 100.0 as f32);
    sprite_replay_animation_with_sound(test_sprite, true);
    assert!(!sprite_animation_has_ended(test_sprite));
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_sprite_rotation_integration() {
    let test_window = open_window("Test Window".to_string(), 800, 600);
    let test_bitmap = create_bitmap("test_bitmap".to_string(), 100, 100);
    let test_sprite = create_sprite_named("test_sprite".to_string(), test_bitmap);
    assert_eq!(0.0, sprite_rotation(test_sprite));
    sprite_set_rotation(test_sprite, 45.0 as f32);
    assert_eq!(45.0, sprite_rotation(test_sprite));
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_sprite_scale_integration() {
    let test_window = open_window("Test Window".to_string(), 800, 600);
    let test_bitmap = create_bitmap("test_bitmap".to_string(), 100, 100);
    let test_sprite = create_sprite_named("test_sprite".to_string(), test_bitmap);
    assert_eq!(1.0 as f32, sprite_scale(test_sprite));
    sprite_set_scale(test_sprite, 2.0 as f32);
    assert_eq!(2.0 as f32, sprite_scale(test_sprite));
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_sprite_screen_rectangle_integration() {
    let test_window = open_window("Test Window".to_string(), 800, 600);
    let test_bitmap = create_bitmap("test_bitmap".to_string(), 100, 100);
    let test_animation = load_animation_script("test_animation".to_string(), "kermit.txt".to_string());
    clear_bitmap(test_bitmap, color_white());
    let test_sprite = create_sprite_with_animation(test_bitmap, test_animation);
    sprite_start_animation_named(test_sprite, "walkfront".to_string());
    sprite_set_position(test_sprite, point_at(0.0, 0.0));
    let rect = sprite_screen_rectangle(test_sprite);
    assert_eq!(0.0, rect.x);
    assert_eq!(0.0, rect.y);
    assert_eq!(100.0, rect.width);
    assert_eq!(100.0, rect.height);
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_sprite_send_layer_backward_integration() {
    let test_window = open_window("Test Window".to_string(), 800, 600);
    let test_bitmap = create_bitmap("test_bitmap".to_string(), 100, 100);
    let test_sprite = create_sprite_named("test_sprite".to_string(), test_bitmap);
    let layer1 = sprite_add_layer(test_sprite, test_bitmap, "layer1".to_string());
    sprite_show_layer(test_sprite, layer1);
    let layer2 = sprite_add_layer(test_sprite, test_bitmap, "layer2".to_string());
    sprite_show_layer(test_sprite, layer2);
    let visible_index = sprite_visible_index_of_layer(test_sprite, layer2);
    sprite_send_layer_backward(test_sprite, visible_index);
    assert_eq!(2, sprite_visible_index_of_layer(test_sprite, layer2));
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_sprite_send_layer_to_back_integration() {
    let test_window = open_window("Test Window".to_string(), 800, 600);
    let test_bitmap = create_bitmap("test_bitmap".to_string(), 100, 100);
    let test_sprite = create_sprite_named("test_sprite".to_string(), test_bitmap);
    let layer1 = sprite_add_layer(test_sprite, test_bitmap, "layer1".to_string());
    sprite_show_layer(test_sprite, layer1);
    let layer2 = sprite_add_layer(test_sprite, test_bitmap, "layer2".to_string());
    sprite_show_layer(test_sprite, layer2);
    let visible_index = sprite_visible_index_of_layer(test_sprite, layer2);
    sprite_send_layer_to_back(test_sprite, visible_index);
    assert_eq!(2, sprite_visible_index_of_layer(test_sprite, layer2));
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_sprite_set_anchor_point_integration() {
    let test_window = open_window("Test Window".to_string(), 800, 600);
    let test_bitmap = create_bitmap("test_bitmap".to_string(), 100, 100);
    let test_sprite = create_sprite_named("test_sprite".to_string(), test_bitmap);
    assert_eq!(point_at(50.0, 50.0), sprite_anchor_point(test_sprite));
    sprite_set_anchor_point(test_sprite, point_at(25.0, 25.0));
    assert_eq!(point_at(25.0, 25.0), sprite_anchor_point(test_sprite));
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_sprite_set_collision_bitmap_integration() {
    let test_window = open_window("Test Window".to_string(), 800, 600);
    let test_bitmap = create_bitmap("test_bitmap".to_string(), 100, 100);
    let test_sprite = create_sprite_named("test_sprite".to_string(), test_bitmap);
    assert_eq!(test_bitmap, sprite_collision_bitmap(test_sprite));
    let new_bitmap = create_bitmap("new_bitmap".to_string(), 200, 200);
    sprite_set_collision_bitmap(test_sprite, new_bitmap);
    assert_eq!(new_bitmap, sprite_collision_bitmap(test_sprite));
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    free_bitmap(new_bitmap);
    close_window(test_window);
}
#[test]
fn test_sprite_set_collision_kind_integration() {
    let test_window = open_window("Test Window".to_string(), 800, 600);
    let test_bitmap = create_bitmap("test_bitmap".to_string(), 100, 100);
    let test_sprite = create_sprite_named("test_sprite".to_string(), test_bitmap);
    assert_eq!(CollisionTestKind::PixelCollisions, sprite_collision_kind(test_sprite));
    sprite_set_collision_kind(test_sprite, CollisionTestKind::AabbCollisions);
    assert_eq!(CollisionTestKind::AabbCollisions, sprite_collision_kind(test_sprite));
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_sprite_set_dx_integration() {
    let test_window = open_window("Test Window".to_string(), 800, 600);
    let test_bitmap = create_bitmap("test_bitmap".to_string(), 100, 100);
    let test_sprite = create_sprite_named("test_sprite".to_string(), test_bitmap);
    assert_eq!(0.0, sprite_dx(test_sprite));
    sprite_set_dx(test_sprite, 5.0 as f32);
    assert_eq!(5.0, sprite_dx(test_sprite));
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_sprite_set_dy_integration() {
    let test_window = open_window("Test Window".to_string(), 800, 600);
    let test_bitmap = create_bitmap("test_bitmap".to_string(), 100, 100);
    let test_sprite = create_sprite_named("test_sprite".to_string(), test_bitmap);
    assert_eq!(0.0, sprite_dy(test_sprite));
    sprite_set_dy(test_sprite, 5.0 as f32);
    assert_eq!(5.0, sprite_dy(test_sprite));
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_sprite_set_heading_integration() {
    let test_window = open_window("Test Window".to_string(), 800, 600);
    let test_bitmap = create_bitmap("test_bitmap".to_string(), 100, 100);
    let test_sprite = create_sprite_named("test_sprite".to_string(), test_bitmap);
    sprite_set_velocity(test_sprite, vector_from_angle(90.0, 1.0));
    assert_eq!(90.0, sprite_heading(test_sprite));
    sprite_set_heading(test_sprite, 45.0 as f32);
    assert_eq!(45.0, sprite_heading(test_sprite));
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_sprite_set_layer_offset_named_integration() {
    let test_window = open_window("Test Window".to_string(), 800, 600);
    let test_bitmap = create_bitmap("test_bitmap".to_string(), 100, 100);
    let test_sprite = create_sprite_named("test_sprite".to_string(), test_bitmap);
    assert_eq!(vector_to(0.0, 0.0), sprite_layer_offset_named(test_sprite, "base_layer".to_string()));
    sprite_set_layer_offset_named(test_sprite, "base_layer".to_string(), vector_to(10.0, 10.0));
    assert_eq!(vector_to(10.0, 10.0), sprite_layer_offset_named(test_sprite, "base_layer".to_string()));
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_sprite_set_layer_offset_at_index_integration() {
    let test_window = open_window("Test Window".to_string(), 800, 600);
    let test_bitmap = create_bitmap("test_bitmap".to_string(), 100, 100);
    let test_sprite = create_sprite_named("test_sprite".to_string(), test_bitmap);
    assert_eq!(vector_to(0.0, 0.0), sprite_layer_offset(test_sprite, 0));
    sprite_set_layer_offset_at_index(test_sprite, 0, vector_to(10.0, 10.0));
    assert_eq!(vector_to(10.0, 10.0), sprite_layer_offset(test_sprite, 0));
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_sprite_set_mass_integration() {
    let test_window = open_window("Test Window".to_string(), 800, 600);
    let test_bitmap = create_bitmap("test_bitmap".to_string(), 100, 100);
    let test_sprite = create_sprite_named("test_sprite".to_string(), test_bitmap);
    assert_eq!(1.0, sprite_mass(test_sprite));
    sprite_set_mass(test_sprite, 10.0 as f32);
    assert_eq!(10.0, sprite_mass(test_sprite));
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_sprite_set_move_from_anchor_point_integration() {
    let test_window = open_window("Test Window".to_string(), 800, 600);
    let test_bitmap = create_bitmap("test_bitmap".to_string(), 100, 100);
    let test_sprite = create_sprite_named("test_sprite".to_string(), test_bitmap);
    assert!(!sprite_move_from_anchor_point(test_sprite));
    sprite_set_move_from_anchor_point(test_sprite, true);
    assert!(sprite_move_from_anchor_point(test_sprite));
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_sprite_set_position_integration() {
    let test_window = open_window("Test Window".to_string(), 800, 600);
    let test_bitmap = create_bitmap("test_bitmap".to_string(), 100, 100);
    let test_sprite = create_sprite_named("test_sprite".to_string(), test_bitmap);
    assert_eq!(point_at(0.0, 0.0), sprite_position(test_sprite));
    sprite_set_position(test_sprite, point_at(100.0, 100.0));
    assert_eq!(point_at(100.0, 100.0), sprite_position(test_sprite));
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_sprite_set_rotation_integration() {
    let test_window = open_window("Test Window".to_string(), 800, 600);
    let test_bitmap = create_bitmap("test_bitmap".to_string(), 100, 100);
    let test_sprite = create_sprite_named("test_sprite".to_string(), test_bitmap);
    assert_eq!(0.0, sprite_rotation(test_sprite));
    sprite_set_rotation(test_sprite, 45.0 as f32);
    assert_eq!(45.0, sprite_rotation(test_sprite));
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_sprite_set_scale_integration() {
    let test_window = open_window("Test Window".to_string(), 800, 600);
    let test_bitmap = create_bitmap("test_bitmap".to_string(), 100, 100);
    let test_sprite = create_sprite_named("test_sprite".to_string(), test_bitmap);
    assert_eq!(1.0 as f32, sprite_scale(test_sprite));
    sprite_set_scale(test_sprite, 2.0 as f32);
    assert_eq!(2.0 as f32, sprite_scale(test_sprite));
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_sprite_set_speed_integration() {
    let test_window = open_window("Test Window".to_string(), 800, 600);
    let test_bitmap = create_bitmap("test_bitmap".to_string(), 100, 100);
    let test_sprite = create_sprite_named("test_sprite".to_string(), test_bitmap);
    sprite_set_velocity(test_sprite, vector_from_angle(0.0, 1.0));
    sprite_set_speed(test_sprite, 5.0 as f32);
    assert_eq!(5.0, sprite_speed(test_sprite));
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_sprite_set_value_named_integration() {
    let test_window = open_window("Test Window".to_string(), 800, 600);
    let test_bitmap = create_bitmap("test_bitmap".to_string(), 100, 100);
    let test_sprite = create_sprite_named("test_sprite".to_string(), test_bitmap);
    assert!(!sprite_has_value(test_sprite, "test_value".to_string()));
    sprite_add_value_with_default(test_sprite, "test_value".to_string(), 0.0 as f32);
    sprite_set_value_named(test_sprite, "test_value".to_string(), 10.5 as f32);
    assert_eq!(10.5 as f32, sprite_value(test_sprite, "test_value".to_string()));
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_sprite_set_velocity_integration() {
    let test_window = open_window("Test Window".to_string(), 800, 600);
    let test_bitmap = create_bitmap("test_bitmap".to_string(), 100, 100);
    let test_sprite = create_sprite_named("test_sprite".to_string(), test_bitmap);
    assert_eq!(vector_to(0.0, 0.0), sprite_velocity(test_sprite));
    sprite_set_velocity(test_sprite, vector_to(5.0, 5.0));
    assert_eq!(vector_to(5.0, 5.0), sprite_velocity(test_sprite));
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_sprite_set_x_integration() {
    let test_window = open_window("Test Window".to_string(), 800, 600);
    let test_bitmap = create_bitmap("test_bitmap".to_string(), 100, 100);
    let test_sprite = create_sprite_named("test_sprite".to_string(), test_bitmap);
    assert_eq!(0.0 as f32, sprite_x(test_sprite));
    sprite_set_x(test_sprite, 150.0 as f32);
    assert_eq!(150.0 as f32, sprite_x(test_sprite));
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_sprite_set_y_integration() {
    let test_window = open_window("Test Window".to_string(), 800, 600);
    let test_bitmap = create_bitmap("test_bitmap".to_string(), 100, 100);
    let test_sprite = create_sprite_named("test_sprite".to_string(), test_bitmap);
    assert_eq!(0.0 as f32, sprite_y(test_sprite));
    sprite_set_y(test_sprite, 300.0 as f32);
    assert_eq!(300.0 as f32, sprite_y(test_sprite));
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_sprite_show_layer_named_integration() {
    let test_window = open_window("Test Window".to_string(), 800, 600);
    let test_bitmap = create_bitmap("test_bitmap".to_string(), 100, 100);
    let test_sprite = create_sprite_named("test_sprite".to_string(), test_bitmap);
    let layer_idx = sprite_add_layer(test_sprite, test_bitmap, "layer2".to_string());
    sprite_hide_layer_named(test_sprite, "layer2".to_string());
    assert_eq!(1, sprite_visible_layer_count(test_sprite));
    assert_eq!(layer_idx, sprite_show_layer_named(test_sprite, "layer2".to_string()));
    assert_eq!(2, sprite_visible_layer_count(test_sprite));
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_sprite_show_layer_integration() {
    let test_window = open_window("Test Window".to_string(), 800, 600);
    let test_bitmap = create_bitmap("test_bitmap".to_string(), 100, 100);
    let test_sprite = create_sprite_named("test_sprite".to_string(), test_bitmap);
    let layer_idx = sprite_add_layer(test_sprite, test_bitmap, "layer2".to_string());
    sprite_hide_layer(test_sprite, layer_idx);
    assert_eq!(1, sprite_visible_layer_count(test_sprite));
    assert_eq!(layer_idx, sprite_show_layer(test_sprite, layer_idx));
    assert_eq!(2, sprite_visible_layer_count(test_sprite));
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_sprite_speed_integration() {
    let test_window = open_window("Test Window".to_string(), 800, 600);
    let test_bitmap = create_bitmap("test_bitmap".to_string(), 100, 100);
    let test_sprite = create_sprite_named("test_sprite".to_string(), test_bitmap);
    assert_eq!(0.0, sprite_speed(test_sprite));
    sprite_set_velocity(test_sprite, vector_to(3.0, 4.0));
    assert_eq!(5.0, sprite_speed(test_sprite));
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_sprite_start_animation_named_integration() {
    let test_window = open_window("Test Window".to_string(), 800, 600);
    let test_bitmap = create_bitmap("test_bitmap".to_string(), 100, 100);
    let test_animation = load_animation_script("test_animation".to_string(), "kermit.txt".to_string());
    let test_sprite = create_sprite_with_animation(test_bitmap, test_animation);
    sprite_start_animation_named(test_sprite, "walkfront".to_string());
    assert!(!sprite_animation_has_ended(test_sprite));
    update_sprite_animation_percent(test_sprite, 100.0 as f32);
    assert!(sprite_animation_has_ended(test_sprite));
    assert_eq!("walkfront".to_string(), sprite_animation_name(test_sprite));
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_sprite_start_animation_named_with_sound_integration() {
    let test_window = open_window("Test Window".to_string(), 800, 600);
    let test_bitmap = create_bitmap("test_bitmap".to_string(), 100, 100);
    let test_animation = load_animation_script("test_animation".to_string(), "kermit.txt".to_string());
    let test_sprite = create_sprite_with_animation(test_bitmap, test_animation);
    sprite_start_animation_named_with_sound(test_sprite, "walkfront".to_string(), true);
    assert!(!sprite_animation_has_ended(test_sprite));
    update_sprite_animation_percent(test_sprite, 100.0 as f32);
    assert!(sprite_animation_has_ended(test_sprite));
    assert_eq!("walkfront".to_string(), sprite_animation_name(test_sprite));
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_sprite_start_animation_integration() {
    let test_window = open_window("Test Window".to_string(), 800, 600);
    let test_bitmap = create_bitmap("test_bitmap".to_string(), 100, 100);
    let test_animation = load_animation_script("test_animation".to_string(), "kermit.txt".to_string());
    let test_sprite = create_sprite_with_animation(test_bitmap, test_animation);
    sprite_start_animation_named(test_sprite, "0".to_string());
    assert!(!sprite_animation_has_ended(test_sprite));
    update_sprite_animation_percent(test_sprite, 100.0 as f32);
    assert!(sprite_animation_has_ended(test_sprite));
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_sprite_start_animation_with_sound_integration() {
    let test_window = open_window("Test Window".to_string(), 800, 600);
    let test_bitmap = create_bitmap("test_bitmap".to_string(), 100, 100);
    let test_animation = load_animation_script("test_animation".to_string(), "kermit.txt".to_string());
    let test_sprite = create_sprite_with_animation(test_bitmap, test_animation);
    sprite_start_animation_with_sound(test_sprite, 0, true);
    assert!(!sprite_animation_has_ended(test_sprite));
    update_sprite_animation_percent(test_sprite, 100.0 as f32);
    update_sprite_animation_with_sound(test_sprite, true);
    assert!(sprite_animation_has_ended(test_sprite));
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
// #[test]
// fn test_sprite_stop_calling_on_event_integration() {
//     let helper = helper::new();
//     let test_window = open_window("Test Window".to_string(), 800, 600);
//     let test_bitmap = create_bitmap("test_bitmap".to_string(), 100, 100);
//     let test_sprite = create_sprite_named("test_sprite".to_string(), test_bitmap);
//     sprite_set_x(test_sprite, 100 as f32);
//     sprite_call_on_event(test_sprite, helper.sprite_event_handler);
//     update_sprite(test_sprite);
//     assert_eq!(200 as f32, sprite_x(test_sprite));
//     sprite_set_x(test_sprite, 100 as f32);
//     sprite_stop_calling_on_event(test_sprite, helper.sprite_event_handler);
//     update_sprite(test_sprite);
//     assert_eq!(100.0 as f32, sprite_x(test_sprite));
//     free_sprite(test_sprite);
//     free_bitmap(test_bitmap);
//     close_window(test_window);
// }
#[test]
fn test_sprite_toggle_layer_visible_named_integration() {
    let test_window = open_window("Test Window".to_string(), 800, 600);
    let test_bitmap = create_bitmap("test_bitmap".to_string(), 100, 100);
    let test_sprite = create_sprite_named("test_sprite".to_string(), test_bitmap);
    sprite_add_layer(test_sprite, test_bitmap, "layer2".to_string());
    sprite_show_layer_named(test_sprite, "layer2".to_string());
    assert_eq!(2, sprite_visible_layer_count(test_sprite));
    sprite_toggle_layer_visible_named(test_sprite, "layer2".to_string());
    assert_eq!(1, sprite_visible_layer_count(test_sprite));
    sprite_toggle_layer_visible_named(test_sprite, "layer2".to_string());
    assert_eq!(2, sprite_visible_layer_count(test_sprite));
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_sprite_toggle_layer_visible_integration() {
    let test_window = open_window("Test Window".to_string(), 800, 600);
    let test_bitmap = create_bitmap("test_bitmap".to_string(), 100, 100);
    let test_sprite = create_sprite_named("test_sprite".to_string(), test_bitmap);
    let layer_idx = sprite_add_layer(test_sprite, test_bitmap, "layer2".to_string());
    sprite_show_layer(test_sprite, layer_idx);
    assert_eq!(2, sprite_visible_layer_count(test_sprite));
    sprite_toggle_layer_visible(test_sprite, layer_idx);
    assert_eq!(1, sprite_visible_layer_count(test_sprite));
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_sprite_value_integration() {
    let test_window = open_window("Test Window".to_string(), 800, 600);
    let test_bitmap = create_bitmap("test_bitmap".to_string(), 100, 100);
    let test_sprite = create_sprite_named("test_sprite".to_string(), test_bitmap);
    assert_eq!(3, sprite_value_count(test_sprite));
    sprite_add_value_with_default(test_sprite, "test_value".to_string(), 0.0 as f32);
    assert_eq!(10.0 as f32, sprite_value(test_sprite, "test_value".to_string()));
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_sprite_value_count_integration() {
    let test_window = open_window("Test Window".to_string(), 800, 600);
    let test_bitmap = create_bitmap("test_bitmap".to_string(), 100, 100);
    let test_sprite = create_sprite_named("test_sprite".to_string(), test_bitmap);
    assert_eq!(3, sprite_value_count(test_sprite));
    sprite_add_value_with_default(test_sprite, "health".to_string(), 0.0 as f32);
    sprite_add_value_with_default(test_sprite, "speed".to_string(), 0.0 as f32);
    assert_eq!(5, sprite_value_count(test_sprite));
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_sprite_velocity_integration() {
    let test_window = open_window("Test Window".to_string(), 800, 600);
    let test_bitmap = create_bitmap("test_bitmap".to_string(), 100, 100);
    let test_sprite = create_sprite_named("test_sprite".to_string(), test_bitmap);
    assert_eq!(vector_to(0.0, 0.0), sprite_velocity(test_sprite));
    sprite_set_velocity(test_sprite, vector_to(5.0, 5.0));
    assert_eq!(vector_to(5.0, 5.0), sprite_velocity(test_sprite));
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_sprite_visible_index_of_layer_named_integration() {
    let test_window = open_window("Test Window".to_string(), 800, 600);
    let test_bitmap = create_bitmap("test_bitmap".to_string(), 100, 100);
    let test_sprite = create_sprite_named("test_sprite".to_string(), test_bitmap);
    assert_eq!(0, sprite_visible_index_of_layer_named(test_sprite, "base_layer".to_string()));
    sprite_add_layer(test_sprite, test_bitmap, "layer2".to_string());
    sprite_show_layer_named(test_sprite, "layer2".to_string());
    assert_eq!(1, sprite_visible_index_of_layer_named(test_sprite, "layer2".to_string()));
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_sprite_visible_index_of_layer_integration() {
    let test_window = open_window("Test Window".to_string(), 800, 600);
    let test_bitmap = create_bitmap("test_bitmap".to_string(), 100, 100);
    let test_sprite = create_sprite_named("test_sprite".to_string(), test_bitmap);
    assert_eq!(0, sprite_visible_index_of_layer(test_sprite, 0));
    let layer_idx = sprite_add_layer(test_sprite, test_bitmap, "layer2".to_string());
    sprite_show_layer(test_sprite, layer_idx);
    assert_eq!(1, sprite_visible_index_of_layer(test_sprite, layer_idx));
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_sprite_visible_layer_integration() {
    let test_window = open_window("Test Window".to_string(), 800, 600);
    let test_bitmap = create_bitmap("test_bitmap".to_string(), 100, 100);
    let test_sprite = create_sprite_named("test_sprite".to_string(), test_bitmap);
    assert_eq!(0, sprite_visible_layer(test_sprite, 0));
    sprite_add_layer(test_sprite, test_bitmap, "layer2".to_string());
    sprite_show_layer_named(test_sprite, "layer2".to_string());
    assert_eq!(1, sprite_visible_layer(test_sprite, 1));
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_sprite_visible_layer_count_integration() {
    let test_window = open_window("Test Window".to_string(), 800, 600);
    let test_bitmap = create_bitmap("test_bitmap".to_string(), 100, 100);
    let test_sprite = create_sprite_named("test_sprite".to_string(), test_bitmap);
    assert_eq!(1, sprite_visible_layer_count(test_sprite));
    sprite_add_layer(test_sprite, test_bitmap, "layer2".to_string());
    sprite_show_layer_named(test_sprite, "layer2".to_string());
    assert_eq!(2, sprite_visible_layer_count(test_sprite));
    sprite_hide_layer_named(test_sprite, "layer2".to_string());
    assert_eq!(1, sprite_visible_layer_count(test_sprite));
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_sprite_visible_layer_id_integration() {
    let test_window = open_window("Test Window".to_string(), 800, 600);
    let test_bitmap = create_bitmap("test_bitmap".to_string(), 100, 100);
    let test_sprite = create_sprite_named("test_sprite".to_string(), test_bitmap);
    assert_eq!(0, sprite_visible_layer_id(test_sprite, 0));
    sprite_add_layer(test_sprite, test_bitmap, "layer2".to_string());
    sprite_show_layer_named(test_sprite, "layer2".to_string());
    assert_eq!(1, sprite_visible_layer_id(test_sprite, 1));
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_sprite_width_integration() {
    let test_window = open_window("Test Window".to_string(), 800, 600);
    let test_bitmap = create_bitmap("test_bitmap".to_string(), 100, 100);
    let test_sprite = create_sprite_named("test_sprite".to_string(), test_bitmap);
    assert_eq!(1.0 as f32, sprite_scale(test_sprite));
    sprite_set_scale(test_sprite, 2.0 as f32);
    assert_eq!(2.0 as f32, sprite_scale(test_sprite));
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_sprite_x_integration() {
    let test_window = open_window("Test Window".to_string(), 800, 600);
    let test_bitmap = create_bitmap("test_bitmap".to_string(), 100, 100);
    let test_sprite = create_sprite_named("test_sprite".to_string(), test_bitmap);
    assert_eq!(0.0 as f32, sprite_x(test_sprite));
    sprite_set_x(test_sprite, 150.0 as f32);
    assert_eq!(150.0 as f32, sprite_x(test_sprite));
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_sprite_y_integration() {
    let test_window = open_window("Test Window".to_string(), 800, 600);
    let test_bitmap = create_bitmap("test_bitmap".to_string(), 100, 100);
    let test_sprite = create_sprite_named("test_sprite".to_string(), test_bitmap);
    assert_eq!(0.0 as f32, sprite_y(test_sprite));
    sprite_set_y(test_sprite, 200.0 as f32);
    assert_eq!(200.0 as f32, sprite_y(test_sprite));
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
// #[test]
// fn test_stop_calling_on_sprite_event_integration() {
//     let helper = helper::new();
//     let test_window = open_window("Test Window".to_string(), 800, 600);
//     let test_bitmap = create_bitmap("test_bitmap".to_string(), 100, 100);
//     let test_sprite = create_sprite_named("test_sprite".to_string(), test_bitmap);
//     call_on_sprite_event(helper.sprite_event_handler);
//     sprite_start_animation_named(test_sprite, "test".to_string());
//     update_sprite(test_sprite);
//     assert!(helper.event_called);
//     stop_calling_on_sprite_event(helper.sprite_event_handler);
//     update_sprite(test_sprite);
//     assert!(!helper.event_called);
//     free_sprite(test_sprite);
//     free_bitmap(test_bitmap);
//     close_window(test_window);
// }
#[test]
fn test_update_all_sprites_integration() {
    let test_window = open_window("Test Window".to_string(), 800, 600);
    let test_bitmap = create_bitmap("test_bitmap".to_string(), 100, 100);
    let test_sprite1 = create_sprite_named("test_sprite1".to_string(), test_bitmap);
    let test_sprite2 = create_sprite_named("test_sprite2".to_string(), test_bitmap);
    sprite_set_velocity(test_sprite1, vector_to(10.0, 10.0));
    sprite_set_velocity(test_sprite2, vector_to(-10.0, -10.0));
    update_all_sprites();
    assert_eq!(vector_to(10.0, 10.0), sprite_velocity(test_sprite1));
    assert_eq!(vector_to(-10.0, -10.0), sprite_velocity(test_sprite2));
    free_all_sprites();
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_update_all_sprites_percent_integration() {
    let test_window = open_window("Test Window".to_string(), 800, 600);
    let test_bitmap = create_bitmap("test_bitmap".to_string(), 100, 100);
    let test_sprite1 = create_sprite_named("test_sprite1".to_string(), test_bitmap);
    let test_sprite2 = create_sprite_named("test_sprite2".to_string(), test_bitmap);
    sprite_set_velocity(test_sprite1, vector_to(100.0, 100.0));
    sprite_set_velocity(test_sprite2, vector_to(-100.0, -100.0));
    update_all_sprites_percent(0.5 as f32);
    assert_eq!(50.0 as f32, sprite_x(test_sprite1));
    assert_eq!(50.0 as f32, sprite_y(test_sprite1));
    assert_eq!(-50.0 as f32, sprite_x(test_sprite2));
    assert_eq!(-50.0 as f32, sprite_y(test_sprite2));
    free_all_sprites();
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_update_sprite_integration() {
    let test_window = open_window("Test Window".to_string(), 800, 600);
    let test_bitmap = create_bitmap("test_bitmap".to_string(), 100, 100);
    let test_sprite = create_sprite_named("test_sprite".to_string(), test_bitmap);
    sprite_set_velocity(test_sprite, vector_to(10.0, 10.0));
    let initial_pos = sprite_position(test_sprite);
    update_sprite(test_sprite);
    assert_ne!(initial_pos, sprite_position(test_sprite));
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_update_sprite_with_sound_integration() {
    let test_window = open_window("Test Window".to_string(), 800, 600);
    let test_bitmap = create_bitmap("test_bitmap".to_string(), 100, 100);
    let test_animation = load_animation_script("test_animation".to_string(), "kermit.txt".to_string());
    let test_sprite = create_sprite_with_animation(test_bitmap, test_animation);
    sprite_start_animation_named_with_sound(test_sprite, "default".to_string(), true);
    update_sprite_with_sound(test_sprite, true);
    assert!(sprite_animation_has_ended(test_sprite));
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_update_sprite_percent_integration() {
    let test_window = open_window("Test Window".to_string(), 800, 600);
    let test_bitmap = create_bitmap("test_bitmap".to_string(), 100, 100);
    let test_sprite = create_sprite_named("test_sprite".to_string(), test_bitmap);
    sprite_set_velocity(test_sprite, vector_to(100.0, 100.0));
    update_sprite_percent(test_sprite, 0.5 as f32);
    assert_eq!(50.0 as f32, sprite_x(test_sprite));
    assert_eq!(50.0 as f32, sprite_y(test_sprite));
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
// #[test]
// fn test_update_sprite_percent_with_sound_integration() {
//     let helper = helper::new();
//     let test_window = open_window("Test Window".to_string(), 800, 600);
//     let test_bitmap = create_bitmap("test_bitmap".to_string(), 100, 100);
//     let test_sprite = create_sprite(test_bitmap);
//     sprite_set_velocity(test_sprite, vector_to(100.0, 100.0));
//     update_sprite_percent_with_sound(test_sprite, 0.5 as f32, true);
//     assert_eq!(50.0 as f32, sprite_x(test_sprite));
//     assert_eq!(50.0 as f32, sprite_y(test_sprite));
//     assert!(sound_effect_playing_named("test_sound.wav".to_string()));
//     update_sprite_percent_with_sound(test_sprite, 0.5 as f32, false);
//     assert!(!sound_effect_playing_named("test_sound.wav".to_string()));
//     free_sprite(test_sprite);
//     free_bitmap(test_bitmap);
//     close_window(test_window);
// }
#[test]
fn test_update_sprite_animation_integration() {
    let test_window = open_window("Test Window".to_string(), 800, 600);
    let test_bitmap = create_bitmap("test_bitmap".to_string(), 100, 100);
    let test_animation = load_animation_script("test_animation".to_string(), "kermit.txt".to_string());
    let test_sprite = create_sprite_named_with_animation("test_sprite".to_string(), test_bitmap, test_animation);
    sprite_start_animation_named(test_sprite, "walkfront".to_string());
    assert!(!sprite_animation_has_ended(test_sprite));
    update_sprite_animation(test_sprite);
    assert!(sprite_animation_has_ended(test_sprite));
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_update_sprite_animation_with_sound_integration() {
    let test_window = open_window("Test Window".to_string(), 800, 600);
    let test_bitmap = create_bitmap("test_bitmap".to_string(), 100, 100);
    let test_sprite = create_sprite_named("test_sprite".to_string(), test_bitmap);
    sprite_start_animation_named(test_sprite, "default".to_string());
    update_sprite_animation_with_sound(test_sprite, true);
    assert!(sprite_animation_has_ended(test_sprite));
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_update_sprite_animation_percent_integration() {
    let test_window = open_window("Test Window".to_string(), 800, 600);
    let test_bitmap = create_bitmap("test_bitmap".to_string(), 100, 100);
    let test_animation = load_animation_script("test_animation".to_string(), "kermit.txt".to_string());
    let test_sprite = create_sprite_named_with_animation("test_sprite".to_string(), test_bitmap, test_animation);
    sprite_start_animation_named(test_sprite, "walkfront".to_string());
    assert!(!sprite_animation_has_ended(test_sprite));
    update_sprite_animation_percent(test_sprite, 100.0 as f32);
    assert!(sprite_animation_has_ended(test_sprite));
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_update_sprite_animation_percent_with_sound_integration() {
    let test_window = open_window("Test Window".to_string(), 800, 600);
    let test_bitmap = create_bitmap("test_bitmap".to_string(), 100, 100);
    let test_animation = load_animation_script("test_animation".to_string(), "kermit.txt".to_string());
    let test_sprite = create_sprite_named_with_animation("test_sprite".to_string(), test_bitmap, test_animation);
    sprite_start_animation_named(test_sprite, "walkfront".to_string());
    assert!(!sprite_animation_has_ended(test_sprite));
    update_sprite_animation_percent_with_sound(test_sprite, 100.0 as f32, true);
    assert!(sprite_animation_has_ended(test_sprite));
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_vector_from_center_sprite_to_point_point_integration() {
    let test_window = open_window("Test Window".to_string(), 800, 600);
    let test_bitmap = create_bitmap("test_bitmap".to_string(), 100, 100);
    let test_sprite = create_sprite_named("test_sprite".to_string(), test_bitmap);
    sprite_set_position(test_sprite, point_at(0.0, 0.0));
    let target_point = point_at(150.0, 150.0);
    let vector = vector_from_center_sprite_to_point_point(test_sprite, target_point);
    assert_eq!(100.0, vector.x);
    assert_eq!(100.0, vector.y);
    free_sprite(test_sprite);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
#[test]
fn test_vector_from_to_integration() {
    let test_window = open_window("Test Window".to_string(), 800, 600);
    let test_bitmap = create_bitmap("test_bitmap".to_string(), 100, 100);
    let sprite1 = create_sprite_named("sprite1".to_string(), test_bitmap);
    let sprite2 = create_sprite_named("sprite2".to_string(), test_bitmap);
    sprite_set_position(sprite1, point_at(0.0, 0.0));
    sprite_set_position(sprite2, point_at(100.0, 100.0));
    let vector = vector_from_to(sprite1, sprite2);
    assert_eq!(100.0, vector.x);
    assert_eq!(100.0, vector.y);
    free_sprite(sprite1);
    free_sprite(sprite2);
    free_bitmap(test_bitmap);
    close_window(test_window);
}
}
