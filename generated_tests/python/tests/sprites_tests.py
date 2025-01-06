import pytest
from splashkit import *
from ..helpers import *
import contextlib
class TestSprites:
    def setup_method(self):
        set_resources_path("/mnt/c/Users/Noahc/Documents/aYear_2_semester_2/TeamProject/GitHubRepo/splashkit_test_generator/resources")

    def test_call_for_all_sprites_with_value_integration():
        test_sprite_delegates = sprite_delegates();
        test_bitmap = create_bitmap("Test Bitmap 1", 100, 100)
        with bitmap_cleanup():
            create_sprite(test_bitmap)
            with sprite_cleanup():
                create_sprite(test_bitmap)
                call_for_all_sprites_with_value(test_sprite_delegates.sprite_float_function(), 300.0)
                assert 2 == test_sprite_delegates.float_function_call_count()
                assert test_sprite_delegates.event_called()
                
    def test_call_for_all_sprites_integration():
        test_sprite_delegates = sprite_delegates();
        test_bitmap = create_bitmap("Test Bitmap 2", 100, 100)
        with bitmap_cleanup():
            create_sprite(test_bitmap)
            with sprite_cleanup():
                create_sprite(test_bitmap)
                call_for_all_sprites(test_sprite_delegates.sprite_function())
                assert 2 == test_sprite_delegates.function_call_count()
                assert test_sprite_delegates.event_called()
                
    def test_call_on_sprite_event_integration():
        test_sprite_delegates = sprite_delegates();
        test_bitmap = create_bitmap("Test Bitmap 34", 100, 100)
        with bitmap_cleanup():
            test_animation = load_animation_script("Test Script 6", "kermit.txt")
            with animation_script_cleanup():
                test_sprite = create_sprite_with_animation(test_bitmap, test_animation)
                with sprite_cleanup():
                    call_on_sprite_event(test_sprite_delegates.sprite_event_handler())
                    update_sprite(test_sprite)
                    stop_calling_on_sprite_event(test_sprite_delegates.sprite_event_handler())
                    assert test_sprite_delegates.event_called()
                    
    def test_center_point_of_sprite_integration():
        test_bitmap = create_bitmap("Test Bitmap 3", 100, 100)
        with bitmap_cleanup():
            test_sprite = create_sprite(test_bitmap)
            with sprite_cleanup():
                sprite_set_position(test_sprite, point_at(100.0, 100.0))
                test_center_point = center_point_of_sprite(test_sprite)
                assert 150.0 == test_center_point.x
                assert 150.0 == test_center_point.y
                
    def test_create_sprite_integration():
        test_bitmap = create_bitmap("Test Bitmap 4", 100, 100)
        with bitmap_cleanup():
            test_sprite = create_sprite(test_bitmap)
            with sprite_cleanup():
                assert test_sprite is not None
                assert has_sprite(sprite_name(test_sprite))
                
    def test_create_sprite_with_animation_integration():
        test_bitmap = create_bitmap("Test Bitmap 5", 100, 100)
        with bitmap_cleanup():
            test_animation = load_animation_script("Test Script 1", "kermit.txt")
            with animation_script_cleanup():
                test_sprite = create_sprite_with_animation(test_bitmap, test_animation)
                with sprite_cleanup():
                    assert test_sprite is not None
                    assert has_sprite(sprite_name(test_sprite))
                    
    def test_create_sprite_with_bitmap_named_integration():
        create_bitmap("Test Bitmap 6", 100, 100)
        with bitmap_cleanup():
            test_sprite = create_sprite_with_bitmap_named("Test Bitmap 6")
            with sprite_cleanup():
                assert test_sprite is not None
                assert has_sprite(sprite_name(test_sprite))
                
    def test_create_sprite_named_integration():
        test_bitmap = create_bitmap("Test Bitmap 7", 100, 100)
        with bitmap_cleanup():
            test_sprite = create_sprite_named("Test Sprite 1", test_bitmap)
            with sprite_cleanup():
                assert test_sprite is not None
                assert "Test Sprite 1" == sprite_name(test_sprite)
                
    def test_create_sprite_named_with_animation_integration():
        test_bitmap = create_bitmap("Test Bitmap 8", 100, 100)
        with bitmap_cleanup():
            test_animation = load_animation_script("Test Script 2", "kermit.txt")
            with animation_script_cleanup():
                test_sprite = create_sprite_named_with_animation("Test Sprite 2", test_bitmap, test_animation)
                with sprite_cleanup():
                    assert test_sprite is not None
                    assert "Test Sprite 2" == sprite_name(test_sprite)
                    
    def test_create_sprite_with_bitmap_and_animation_named_integration():
        create_bitmap("Test Bitmap 9", 100, 100)
        with bitmap_cleanup():
            load_animation_script("Test Script 3", "kermit.txt")
            with animation_script_cleanup():
                test_sprite = create_sprite_with_bitmap_and_animation_named("Test Bitmap 9", "test_animation")
                with sprite_cleanup():
                    assert test_sprite is not None
                    assert has_sprite(sprite_name(test_sprite))
                    
    def test_create_sprite_pack_integration():
        assert not has_sprite_pack("Test Sprite Pack 1")
        create_sprite_pack("Test Sprite Pack 1")
        with sprite_pack_cleanup("Test Sprite Pack 1"):
            assert has_sprite_pack("Test Sprite Pack 1")
            
    def test_current_sprite_pack_integration():
        assert "default" == current_sprite_pack()
        create_sprite_pack("Test Sprite Pack 2")
        with sprite_pack_cleanup("Test Sprite Pack 2"):
            select_sprite_pack("Test Sprite Pack 2")
            assert "Test Sprite Pack 2" == current_sprite_pack()
            
    def test_draw_all_sprites_integration():
        test_window = open_window("Test Window 1", 800, 600)
        with window_cleanup():
            test_bitmap = create_bitmap("Test Bitmap 10", 100, 100)
            with bitmap_cleanup():
                clear_bitmap(test_bitmap, color_black())
                test_sprite1 = create_sprite(test_bitmap)
                with sprite_cleanup():
                    test_sprite2 = create_sprite(test_bitmap)
                    sprite_set_position(test_sprite1, point_at(100.0, 100.0))
                    sprite_set_position(test_sprite2, point_at(200.0, 200.0))
                    clear_screen(color_white())
                    draw_all_sprites()
                    refresh_screen()
                    assert color_black() == get_pixel_from_window(test_window, 100.0, 100.0)
                    assert color_black() == get_pixel_from_window(test_window, 200.0, 200.0)
                    
    def test_draw_sprite_offset_by_integration():
        test_window = open_window("Test Window 3", 800, 600)
        with window_cleanup():
            test_bitmap = create_bitmap("Test Bitmap 12", 100, 100)
            with bitmap_cleanup():
                clear_bitmap(test_bitmap, color_black())
                test_sprite = create_sprite(test_bitmap)
                with sprite_cleanup():
                    sprite_set_position(test_sprite, point_at(400.0, 300.0))
                    clear_screen(color_white())
                    draw_sprite_offset_by(test_sprite, vector_from_angle(50.0, 50.0))
                    refresh_screen()
                    assert color_white() != get_pixel_from_window(test_window, 450.0, 350.0)
                    
    def test_draw_sprite_integration():
        test_window = open_window("Test Window 4", 800, 600)
        with window_cleanup():
            test_bitmap = create_bitmap("Test Bitmap 13", 100, 100)
            with bitmap_cleanup():
                clear_bitmap(test_bitmap, color_black())
                test_sprite = create_sprite(test_bitmap)
                with sprite_cleanup():
                    sprite_set_position(test_sprite, point_at(400.0, 300.0))
                    clear_screen(color_white())
                    draw_sprite(test_sprite)
                    refresh_screen()
                    assert color_black() == get_pixel_from_window(test_window, 400.0, 300.0)
                    
    def test_draw_sprite_offset_x_y_integration():
        test_window = open_window("Test Window 2", 800, 600)
        with window_cleanup():
            test_bitmap = create_bitmap("Test Bitmap 11", 100, 100)
            with bitmap_cleanup():
                clear_bitmap(test_bitmap, color_black())
                test_sprite = create_sprite(test_bitmap)
                with sprite_cleanup():
                    sprite_set_position(test_sprite, point_at(400.0, 300.0))
                    clear_screen(color_white())
                    draw_sprite_offset_x_y(test_sprite, 50.0, 50.0)
                    refresh_screen()
                    assert color_white() != get_pixel_from_window(test_window, 450.0, 350.0)
                    
    def test_free_all_sprites_integration():
        test_bitmap = create_bitmap("Test Bitmap 14", 100, 100)
        with bitmap_cleanup():
            create_sprite_named("Test Sprite 3", test_bitmap)
            with sprite_cleanup():
                create_sprite_named("Test Sprite 4", test_bitmap)
                assert has_sprite("Test Sprite 3")
                assert has_sprite("Test Sprite 4")
                free_all_sprites()
                assert not has_sprite("Test Sprite 3")
                assert not has_sprite("Test Sprite 4")
                
    def test_free_sprite_integration():
        test_bitmap = create_bitmap("Test Bitmap 15", 100, 100)
        with bitmap_cleanup():
            test_sprite = create_sprite_named("Test Sprite 5", test_bitmap)
            with sprite_cleanup():
                assert has_sprite("Test Sprite 5")
                free_sprite(test_sprite)
                assert not has_sprite("Test Sprite 5")
                
    def test_free_sprite_pack_integration():
        assert "default" == current_sprite_pack()
        create_sprite_pack("Test Sprite Pack 3")
        with sprite_pack_cleanup("Test Sprite Pack 3"):
            select_sprite_pack("Test Sprite Pack 3")
            assert has_sprite_pack("Test Sprite Pack 3")
            assert "Test Sprite Pack 3" == current_sprite_pack()
            free_sprite_pack("Test Sprite Pack 3")
            assert not has_sprite_pack("Test Sprite Pack 3")
            assert "default" == current_sprite_pack()
            
    def test_has_sprite_integration():
        test_bitmap = create_bitmap("Test Bitmap 16", 100, 100)
        with bitmap_cleanup():
            assert not has_sprite("Test Sprite 6")
            test_sprite = create_sprite_named("Test Sprite 6", test_bitmap)
            with sprite_cleanup():
                assert has_sprite("Test Sprite 6")
                free_sprite(test_sprite)
                assert not has_sprite("Test Sprite 6")
                
    def test_has_sprite_pack_integration():
        assert not has_sprite_pack("Test Sprite Pack 4")
        create_sprite_pack("Test Sprite Pack 4")
        with sprite_pack_cleanup("Test Sprite Pack 4"):
            assert has_sprite_pack("Test Sprite Pack 4")
            free_sprite_pack("Test Sprite Pack 4")
            assert not has_sprite_pack("Test Sprite Pack 4")
            
    def test_move_sprite_integration():
        test_bitmap = create_bitmap("Test Bitmap 17", 100, 100)
        with bitmap_cleanup():
            test_sprite = create_sprite(test_bitmap)
            with sprite_cleanup():
                start_position = point_at(100.0, 100.0)
                sprite_set_position(test_sprite, start_position)
                sprite_set_velocity(test_sprite, vector_to(10.0, 10.0))
                move_sprite(test_sprite)
                assert 110.0 == sprite_x(test_sprite)
                assert 110.0 == sprite_y(test_sprite)
                
    def test_move_sprite_by_vector_integration():
        test_bitmap = create_bitmap("Test Bitmap 18", 100, 100)
        with bitmap_cleanup():
            test_sprite = create_sprite(test_bitmap)
            with sprite_cleanup():
                sprite_set_position(test_sprite, point_at(100.0, 100.0))
                move_sprite_by_vector(test_sprite, vector_to(50.0, 50.0))
                assert 150.0 == sprite_x(test_sprite)
                assert 150.0 == sprite_y(test_sprite)
                
    def test_move_sprite_by_vector_percent_integration():
        test_bitmap = create_bitmap("Test Bitmap 19", 100, 100)
        with bitmap_cleanup():
            test_sprite = create_sprite(test_bitmap)
            with sprite_cleanup():
                sprite_set_position(test_sprite, point_at(100.0, 100.0))
                move_sprite_by_vector_percent(test_sprite, vector_to(50.0, 50.0), 0.5)
                assert 125.0 == sprite_x(test_sprite)
                assert 125.0 == sprite_y(test_sprite)
                
    def test_move_sprite_percent_integration():
        test_bitmap = create_bitmap("Test Bitmap 20", 100, 100)
        with bitmap_cleanup():
            test_sprite = create_sprite(test_bitmap)
            with sprite_cleanup():
                sprite_set_position(test_sprite, point_at(100.0, 100.0))
                sprite_set_velocity(test_sprite, vector_to(10.0, 10.0))
                move_sprite_percent(test_sprite, 0.5)
                assert 105.0 == sprite_x(test_sprite)
                assert 105.0 == sprite_y(test_sprite)
                
    def test_move_sprite_to_integration():
        test_bitmap = create_bitmap("Test Bitmap 21", 100, 100)
        with bitmap_cleanup():
            test_sprite = create_sprite(test_bitmap)
            with sprite_cleanup():
                move_sprite_to(test_sprite, 400.0, 300.0)
                assert 400.0 == sprite_x(test_sprite)
                assert 300.0 == sprite_y(test_sprite)
                
    def test_select_sprite_pack_integration():
        create_sprite_pack("Test Sprite Pack 5")
        with sprite_pack_cleanup("Test Sprite Pack 5"):
            assert "default" == current_sprite_pack()
            select_sprite_pack("Test Sprite Pack 5")
            assert "Test Sprite Pack 5" == current_sprite_pack()
            
    def test_sprite_add_layer_integration():
        test_bitmap = create_bitmap("Test Bitmap 22", 100, 100)
        with bitmap_cleanup():
            test_sprite = create_sprite(test_bitmap)
            with sprite_cleanup():
                new_layer_bitmap = create_bitmap("Test Bitmap 23", 50, 50)
                layer_index = sprite_add_layer(test_sprite, new_layer_bitmap, "Test Bitmap 23")
                assert 1 == layer_index
                assert 2 == sprite_layer_count(test_sprite)
                
    def test_sprite_add_to_velocity_integration():
        test_bitmap = create_bitmap("Test Bitmap 24", 100, 100)
        with bitmap_cleanup():
            test_sprite = create_sprite(test_bitmap)
            with sprite_cleanup():
                sprite_set_velocity(test_sprite, vector_to(0.0, 0.0))
                sprite_add_to_velocity(test_sprite, vector_to(10.0, 10.0))
                velocity = sprite_velocity(test_sprite)
                assert 10.0 == velocity.x
                assert 10.0 == velocity.y
                
    def test_sprite_add_value_integration():
        test_bitmap = create_bitmap("Test Bitmap 25", 100, 100)
        with bitmap_cleanup():
            test_sprite = create_sprite(test_bitmap)
            with sprite_cleanup():
                sprite_add_value_with_default(test_sprite, "health", 100.0)
                assert sprite_has_value(test_sprite, "health")
                assert 100.0 == sprite_value(test_sprite, "health")
                
    def test_sprite_add_value_with_default_integration():
        test_bitmap = create_bitmap("Test Bitmap 26", 100, 100)
        with bitmap_cleanup():
            test_sprite = create_sprite(test_bitmap)
            with sprite_cleanup():
                sprite_add_value_with_default(test_sprite, "health", 100.0)
                assert sprite_has_value(test_sprite, "health")
                assert 100.0 == sprite_value(test_sprite, "health")
                
    def test_sprite_anchor_point_integration():
        test_bitmap = create_bitmap("Test Bitmap 27", 100, 100)
        with bitmap_cleanup():
            test_sprite = create_sprite(test_bitmap)
            with sprite_cleanup():
                anchor_point = sprite_anchor_point(test_sprite)
                assert 50.0 == anchor_point.x
                assert 50.0 == anchor_point.y
                
    def test_sprite_anchor_position_integration():
        test_bitmap = create_bitmap("Test Bitmap 28", 100, 100)
        with bitmap_cleanup():
            test_sprite = create_sprite(test_bitmap)
            with sprite_cleanup():
                sprite_set_position(test_sprite, point_at(100.0, 100.0))
                anchor_position = sprite_anchor_position(test_sprite)
                assert 150.0 == anchor_position.x
                assert 150.0 == anchor_position.y
                
    def test_sprite_animation_has_ended_integration():
        test_bitmap = create_bitmap("Test Bitmap 29", 100, 100)
        with bitmap_cleanup():
            test_animation = load_animation_script("Test Script 4", "kermit.txt")
            with animation_script_cleanup():
                test_sprite = create_sprite_with_animation(test_bitmap, test_animation)
                with sprite_cleanup():
                    sprite_start_animation_named(test_sprite, "walkfront")
                    assert not sprite_animation_has_ended(test_sprite)
                    for _ in range(5):
                        update_sprite_animation_percent(test_sprite, 100.0)
                        
                        assert sprite_animation_has_ended(test_sprite)
                        
    def test_sprite_animation_name_integration():
        test_bitmap = create_bitmap("Test Bitmap 30", 100, 100)
        with bitmap_cleanup():
            test_animation = load_animation_script("Test Script 5", "kermit.txt")
            with animation_script_cleanup():
                test_sprite = create_sprite_with_animation(test_bitmap, test_animation)
                with sprite_cleanup():
                    sprite_start_animation_named(test_sprite, "walkfront")
                    assert "walkfront" == sprite_animation_name(test_sprite)
                    
    def test_sprite_at_integration():
        test_bitmap = create_bitmap("Test Bitmap 31", 100, 100)
        with bitmap_cleanup():
            clear_bitmap(test_bitmap, color_red())
            setup_collision_mask(test_bitmap)
            test_sprite = create_sprite(test_bitmap)
            with sprite_cleanup():
                sprite_set_x(test_sprite, 400.0)
                sprite_set_y(test_sprite, 300.0)
                assert sprite_at(test_sprite, point_at(451.0, 350.0))
                assert not sprite_at(test_sprite, point_at(600.0, 500.0))
                
    def test_sprite_bring_layer_forward_integration():
        test_bitmap = create_bitmap("Test Bitmap 33", 100, 100)
        with bitmap_cleanup():
            test_sprite = create_sprite(test_bitmap)
            with sprite_cleanup():
                layer_index = sprite_add_layer(test_sprite, test_bitmap, "layer2")
                sprite_show_layer(test_sprite, layer_index)
                visible_index = sprite_visible_index_of_layer(test_sprite, layer_index)
                sprite_bring_layer_forward(test_sprite, visible_index)
                assert 0 == sprite_visible_index_of_layer(test_sprite, layer_index)
                
    def test_sprite_bring_layer_to_front_integration():
        test_bitmap = create_bitmap("Test Bitmap 32", 100, 100)
        with bitmap_cleanup():
            test_sprite = create_sprite(test_bitmap)
            with sprite_cleanup():
                layer_index = sprite_add_layer(test_sprite, test_bitmap, "layer2")
                sprite_show_layer(test_sprite, layer_index)
                visible_index = sprite_visible_index_of_layer(test_sprite, layer_index)
                sprite_bring_layer_to_front(test_sprite, visible_index)
                assert 0 == sprite_visible_index_of_layer_named(test_sprite, "layer2")
                
    def test_sprite_call_on_event_integration():
        test_sprite_delegates = sprite_delegates();
        test_bitmap = create_bitmap("Test Bitmap 35", 100, 100)
        with bitmap_cleanup():
            test_sprite = create_sprite(test_bitmap)
            with sprite_cleanup():
                sprite_call_on_event(test_sprite, test_sprite_delegates.sprite_event_handler())
                update_sprite(test_sprite)
                stop_calling_on_sprite_event(test_sprite_delegates.sprite_event_handler())
                assert test_sprite_delegates.event_called()
                
    def test_sprite_circle_integration():
        test_bitmap = create_bitmap("Test Bitmap 36", 100, 100)
        with bitmap_cleanup():
            test_sprite = create_sprite(test_bitmap)
            with sprite_cleanup():
                circle = sprite_circle(test_sprite)
                assert 50.0 == circle.center.x
                assert 50.0 == circle.center.y
                assert 50.0 == circle.radius
                
    def test_sprite_collision_bitmap_integration():
        test_bitmap = create_bitmap("Test Bitmap 37", 100, 100)
        with bitmap_cleanup():
            test_sprite = create_sprite(test_bitmap)
            with sprite_cleanup():
                collision_bitmap = sprite_collision_bitmap(test_sprite)
                assert test_bitmap == collision_bitmap
                
    def test_sprite_collision_circle_integration():
        test_bitmap = create_bitmap("Test Bitmap 38", 100, 100)
        with bitmap_cleanup():
            test_sprite = create_sprite(test_bitmap)
            with sprite_cleanup():
                circle = sprite_collision_circle(test_sprite)
                assert 50.0 == circle.center.x
                assert 50.0 == circle.center.y
                assert 50.0 == circle.radius
                
    def test_sprite_collision_kind_integration():
        test_bitmap = create_bitmap("Test Bitmap 39", 100, 100)
        with bitmap_cleanup():
            test_sprite = create_sprite(test_bitmap)
            with sprite_cleanup():
                assert CollisionTestKind.PixelCollisions == sprite_collision_kind(test_sprite)
                sprite_set_collision_kind(test_sprite, CollisionTestKind.AabbCollisions)
                assert CollisionTestKind.AabbCollisions == sprite_collision_kind(test_sprite)
                
    def test_sprite_collision_rectangle_integration():
        test_bitmap = create_bitmap("Test Bitmap 40", 100, 100)
        with bitmap_cleanup():
            test_sprite = create_sprite(test_bitmap)
            with sprite_cleanup():
                rect = sprite_collision_rectangle(test_sprite)
                assert 0.0 == rect.x
                assert 0.0 == rect.y
                assert 100.0 == rect.width
                assert 100.0 == rect.height
                
    def test_sprite_current_cell_integration():
        test_bitmap = create_bitmap("Test Bitmap 41", 100, 100)
        with bitmap_cleanup():
            test_animation = load_animation_script("Test Script 7", "kermit.txt")
            with animation_script_cleanup():
                test_sprite = create_sprite_with_animation(test_bitmap, test_animation)
                with sprite_cleanup():
                    sprite_start_animation_named(test_sprite, "walkfront")
                    assert 0 == sprite_current_cell(test_sprite)
                    update_sprite_percent(test_sprite, 100.0)
                    assert 1 == sprite_current_cell(test_sprite)
                    
    def test_sprite_current_cell_rectangle_integration():
        test_bitmap = create_bitmap("Test Bitmap 42", 100, 100)
        with bitmap_cleanup():
            test_sprite = create_sprite(test_bitmap)
            with sprite_cleanup():
                rect = sprite_current_cell_rectangle(test_sprite)
                assert 0.0 == rect.x
                assert 0.0 == rect.y
                assert 100.0 == rect.width
                assert 100.0 == rect.height
                
    def test_sprite_dx_integration():
        test_bitmap = create_bitmap("Test Bitmap 43", 100, 100)
        with bitmap_cleanup():
            test_sprite = create_sprite(test_bitmap)
            with sprite_cleanup():
                assert 0.0 == sprite_dx(test_sprite)
                sprite_set_dx(test_sprite, 5.0)
                assert 5.0 == sprite_dx(test_sprite)
                
    def test_sprite_dy_integration():
        test_bitmap = create_bitmap("Test Bitmap 44", 100, 100)
        with bitmap_cleanup():
            test_sprite = create_sprite(test_bitmap)
            with sprite_cleanup():
                assert 0.0 == sprite_dy(test_sprite)
                sprite_set_dy(test_sprite, 5.0)
                assert 5.0 == sprite_dy(test_sprite)
                
    def test_sprite_has_value_integration():
        test_bitmap = create_bitmap("Test Bitmap 45", 100, 100)
        with bitmap_cleanup():
            test_sprite = create_sprite(test_bitmap)
            with sprite_cleanup():
                assert not sprite_has_value(test_sprite, "health")
                sprite_add_value_with_default(test_sprite, "health", 100.0)
                assert sprite_has_value(test_sprite, "health")
                assert not sprite_has_value(test_sprite, "mana")
                
    def test_sprite_heading_integration():
        test_bitmap = create_bitmap("Test Bitmap 46", 100, 100)
        with bitmap_cleanup():
            test_sprite = create_sprite(test_bitmap)
            with sprite_cleanup():
                assert 90.0 == sprite_heading(test_sprite)
                sprite_set_velocity(test_sprite, vector_to(1.0, 1.0))
                assert 45.0 == sprite_heading(test_sprite)
                
    def test_sprite_height_integration():
        test_bitmap = create_bitmap("Test Bitmap 47", 100, 100)
        with bitmap_cleanup():
            test_sprite = create_sprite(test_bitmap)
            with sprite_cleanup():
                assert 100 == sprite_height(test_sprite)
                
    def test_sprite_hide_layer_named_integration():
        test_bitmap = create_bitmap("Test Bitmap 48", 100, 100)
        with bitmap_cleanup():
            test_sprite = create_sprite(test_bitmap)
            with sprite_cleanup():
                sprite_add_layer(test_sprite, test_bitmap, "layer2")
                sprite_show_layer_named(test_sprite, "layer2")
                assert 2 == sprite_visible_layer_count(test_sprite)
                sprite_hide_layer_named(test_sprite, "layer2")
                assert 1 == sprite_visible_layer_count(test_sprite)
                
    def test_sprite_hide_layer_integration():
        test_bitmap = create_bitmap("Test Bitmap 49", 100, 100)
        with bitmap_cleanup():
            test_sprite = create_sprite(test_bitmap)
            with sprite_cleanup():
                layer_idx = sprite_add_layer(test_sprite, test_bitmap, "layer2")
                sprite_show_layer(test_sprite, layer_idx)
                assert 2 == sprite_visible_layer_count(test_sprite)
                sprite_hide_layer(test_sprite, layer_idx)
                assert 1 == sprite_visible_layer_count(test_sprite)
                
    def test_sprite_layer_named_integration():
        test_bitmap = create_bitmap("Test Bitmap 50", 100, 100)
        with bitmap_cleanup():
            test_sprite = create_sprite(test_bitmap)
            with sprite_cleanup():
                sprite_add_layer(test_sprite, test_bitmap, "layer2")
                assert test_bitmap == sprite_layer_named(test_sprite, "layer2")
                
    def test_sprite_layer_at_index_integration():
        test_bitmap = create_bitmap("Test Bitmap 51", 100, 100)
        with bitmap_cleanup():
            test_sprite = create_sprite(test_bitmap)
            with sprite_cleanup():
                layer_idx = sprite_add_layer(test_sprite, test_bitmap, "layer2")
                assert test_bitmap == sprite_layer_at_index(test_sprite, layer_idx)
                
    def test_sprite_layer_circle_named_integration():
        test_bitmap = create_bitmap("Test Bitmap 52", 100, 100)
        with bitmap_cleanup():
            test_sprite = create_sprite(test_bitmap)
            with sprite_cleanup():
                circle = sprite_layer_circle_named(test_sprite, "base_layer")
                assert 50.0 == circle.center.x
                assert 50.0 == circle.center.y
                assert 50.0 == circle.radius
                
    def test_sprite_layer_circle_at_index_integration():
        test_bitmap = create_bitmap("Test Bitmap 53", 100, 100)
        with bitmap_cleanup():
            test_sprite = create_sprite(test_bitmap)
            with sprite_cleanup():
                circle = sprite_layer_circle_at_index(test_sprite, 0)
                assert 50.0 == circle.center.x
                assert 50.0 == circle.center.y
                assert 50.0 == circle.radius
                
    def test_sprite_layer_count_integration():
        test_bitmap = create_bitmap("Test Bitmap 54", 100, 100)
        with bitmap_cleanup():
            test_sprite = create_sprite(test_bitmap)
            with sprite_cleanup():
                assert 1 == sprite_layer_count(test_sprite)
                layer_idx = sprite_add_layer(test_sprite, test_bitmap, "layer2")
                assert 2 == sprite_layer_count(test_sprite)
                assert 1 == layer_idx
                
    def test_sprite_layer_height_named_integration():
        test_bitmap = create_bitmap("Test Bitmap 55", 100, 100)
        with bitmap_cleanup():
            test_sprite = create_sprite(test_bitmap)
            with sprite_cleanup():
                assert 100 == sprite_layer_height_named(test_sprite, "base_layer")
                sprite_add_layer(test_sprite, test_bitmap, "layer2")
                assert 100 == sprite_layer_height_named(test_sprite, "layer2")
                
    def test_sprite_layer_height_integration():
        test_bitmap = create_bitmap("Test Bitmap 56", 100, 100)
        with bitmap_cleanup():
            test_sprite = create_sprite(test_bitmap)
            with sprite_cleanup():
                assert 100 == sprite_layer_height(test_sprite, 0)
                layer_idx = sprite_add_layer(test_sprite, test_bitmap, "layer2")
                assert 100 == sprite_layer_height(test_sprite, layer_idx)
                
    def test_sprite_layer_index_integration():
        test_bitmap = create_bitmap("Test Bitmap 57", 100, 100)
        with bitmap_cleanup():
            test_sprite = create_sprite(test_bitmap)
            with sprite_cleanup():
                assert 0 == sprite_layer_index(test_sprite, "base_layer")
                layer_idx = sprite_add_layer(test_sprite, test_bitmap, "layer2")
                assert layer_idx == sprite_layer_index(test_sprite, "layer2")
                
    def test_sprite_layer_name_integration():
        test_bitmap = create_bitmap("Test Bitmap 58", 100, 100)
        with bitmap_cleanup():
            test_sprite = create_sprite(test_bitmap)
            with sprite_cleanup():
                layer_idx = sprite_add_layer(test_sprite, test_bitmap, "layer2")
                assert "" == sprite_layer_name(test_sprite, layer_idx)
                
    def test_sprite_layer_offset_named_integration():
        test_bitmap = create_bitmap("Test Bitmap 59", 100, 100)
        with bitmap_cleanup():
            test_sprite = create_sprite(test_bitmap)
            with sprite_cleanup():
                assert vector_to(0.0, 0.0) == sprite_layer_offset_named(test_sprite, "base_layer")
                sprite_set_layer_offset_named(test_sprite, "base_layer", vector_to(10.0, 10.0))
                assert vector_to(10.0, 10.0) == sprite_layer_offset_named(test_sprite, "base_layer")
                
    def test_sprite_layer_offset_integration():
        test_bitmap = create_bitmap("Test Bitmap 60", 100, 100)
        with bitmap_cleanup():
            test_sprite = create_sprite(test_bitmap)
            with sprite_cleanup():
                assert vector_to(0.0, 0.0) == sprite_layer_offset(test_sprite, 0)
                layer_idx = sprite_add_layer(test_sprite, test_bitmap, "layer2")
                sprite_set_layer_offset_at_index(test_sprite, layer_idx, vector_to(10.0, 10.0))
                assert vector_to(10.0, 10.0) == sprite_layer_offset(test_sprite, layer_idx)
                
    def test_sprite_layer_rectangle_named_integration():
        test_bitmap = create_bitmap("Test Bitmap 61", 100, 100)
        with bitmap_cleanup():
            test_sprite = create_sprite(test_bitmap)
            with sprite_cleanup():
                rect = sprite_layer_rectangle_named(test_sprite, "base_layer")
                assert 0.0 == rect.x
                assert 0.0 == rect.y
                assert 100.0 == rect.width
                assert 100.0 == rect.height
                
    def test_sprite_layer_rectangle_at_index_integration():
        test_bitmap = create_bitmap("Test Bitmap 62", 100, 100)
        with bitmap_cleanup():
            test_sprite = create_sprite(test_bitmap)
            with sprite_cleanup():
                rect = sprite_layer_rectangle_at_index(test_sprite, 0)
                assert 0.0 == rect.x
                assert 0.0 == rect.y
                assert 100.0 == rect.width
                assert 100.0 == rect.height
                
    def test_sprite_layer_width_named_integration():
        test_bitmap = create_bitmap("Test Bitmap 63", 100, 100)
        with bitmap_cleanup():
            test_sprite = create_sprite(test_bitmap)
            with sprite_cleanup():
                assert 100 == sprite_layer_width_named(test_sprite, "base_layer")
                sprite_add_layer(test_sprite, test_bitmap, "layer2")
                assert 100 == sprite_layer_width_named(test_sprite, "layer2")
                
    def test_sprite_layer_width_integration():
        test_bitmap = create_bitmap("Test Bitmap 64", 100, 100)
        with bitmap_cleanup():
            test_sprite = create_sprite(test_bitmap)
            with sprite_cleanup():
                assert 100 == sprite_layer_width(test_sprite, 0)
                layer_idx = sprite_add_layer(test_sprite, test_bitmap, "layer2")
                assert 100 == sprite_layer_width(test_sprite, layer_idx)
                
    def test_sprite_location_matrix_integration():
        test_bitmap = create_bitmap("Test Bitmap 65", 100, 100)
        with bitmap_cleanup():
            test_sprite = create_sprite(test_bitmap)
            with sprite_cleanup():
                sprite_set_position(test_sprite, point_at(100.0, 100.0))
                sprite_set_rotation(test_sprite, 45.0)
                matrix = sprite_location_matrix(test_sprite)
                assert 150.0 == matrix.elements[0][2]
                assert 1.0 == matrix.elements[2][2]
                
    def test_sprite_mass_integration():
        test_bitmap = create_bitmap("Test Bitmap 66", 100, 100)
        with bitmap_cleanup():
            test_sprite = create_sprite(test_bitmap)
            with sprite_cleanup():
                assert 1.0 == sprite_mass(test_sprite)
                sprite_set_mass(test_sprite, 10.0)
                assert 10.0 == sprite_mass(test_sprite)
                
    def test_sprite_move_from_anchor_point_integration():
        test_bitmap = create_bitmap("Test Bitmap 67", 100, 100)
        with bitmap_cleanup():
            test_sprite = create_sprite(test_bitmap)
            with sprite_cleanup():
                assert not sprite_move_from_anchor_point(test_sprite)
                sprite_set_move_from_anchor_point(test_sprite, true)
                assert sprite_move_from_anchor_point(test_sprite)
                
    def test_sprite_move_to_taking_seconds_integration():
        test_bitmap = create_bitmap("Test Bitmap 68", 100, 100)
        with bitmap_cleanup():
            test_sprite = create_sprite(test_bitmap)
            with sprite_cleanup():
                sprite_set_position(test_sprite, point_at(100.0, 100.0))
                sprite_move_to_taking_seconds(test_sprite, point_at(200.0, 200.0), 1.0)
                for _ in range(5):
                    update_sprite(test_sprite)
                    delay(300)
                    
                    sprite_center = center_point_of_sprite(test_sprite)
                    assert abs(200.0 - sprite_center.x) <= 2.0
                    assert abs(200.0 - sprite_center.y) <= 2.0
                    
    def test_sprite_name_integration():
        test_bitmap = create_bitmap("Test Bitmap 69", 100, 100)
        with bitmap_cleanup():
            test_sprite = create_sprite_named("Test Sprite 7", test_bitmap)
            with sprite_cleanup():
                assert "Test Sprite 7" == sprite_name(test_sprite)
                
    def test_sprite_named_integration():
        test_bitmap = create_bitmap("Test Bitmap 70", 100, 100)
        with bitmap_cleanup():
            test_sprite = create_sprite_named("Test Sprite 8", test_bitmap)
            with sprite_cleanup():
                assert test_sprite == sprite_named("Test Sprite 8")
                assert sprite_named("non_existent_sprite") is None
                
    def test_sprite_offscreen_integration():
        open_window("Test Window 5", 800, 600)
        with window_cleanup():
            test_bitmap = create_bitmap("Test Bitmap 71", 100, 100)
            with bitmap_cleanup():
                test_sprite = create_sprite(test_bitmap)
                with sprite_cleanup():
                    sprite_set_position(test_sprite, point_at(400.0, 300.0))
                    assert not sprite_offscreen(test_sprite)
                    sprite_set_position(test_sprite, point_at(-200.0, -200.0))
                    assert sprite_offscreen(test_sprite)
                    
    def test_sprite_on_screen_at_point_integration():
        open_window("Test Window 6", 800, 600)
        with window_cleanup():
            test_bitmap = create_bitmap("Test Bitmap 72", 100, 100)
            with bitmap_cleanup():
                clear_bitmap(test_bitmap, color_red())
                setup_collision_mask(test_bitmap)
                test_sprite = create_sprite(test_bitmap)
                with sprite_cleanup():
                    sprite_set_position(test_sprite, point_at(400.0, 300.0))
                    draw_sprite(test_sprite)
                    refresh_screen()
                    assert sprite_on_screen_at_point(test_sprite, point_at(451.0, 350.0))
                    assert not sprite_on_screen_at_point(test_sprite, point_at(0.0, 0.0))
                    
    def test_sprite_on_screen_at_integration():
        open_window("Test Window 7", 800, 600)
        with window_cleanup():
            test_bitmap = create_bitmap("Test Bitmap 73", 100, 100)
            with bitmap_cleanup():
                clear_bitmap(test_bitmap, color_red())
                setup_collision_mask(test_bitmap)
                test_sprite = create_sprite(test_bitmap)
                with sprite_cleanup():
                    sprite_set_position(test_sprite, point_at(400.0, 300.0))
                    draw_sprite(test_sprite)
                    refresh_screen()
                    assert sprite_on_screen_at(test_sprite, 451.0, 350.0)
                    assert not sprite_on_screen_at(test_sprite, 0.0, 0.0)
                    
    def test_sprite_position_integration():
        test_bitmap = create_bitmap("Test Bitmap 74", 100, 100)
        with bitmap_cleanup():
            test_sprite = create_sprite(test_bitmap)
            with sprite_cleanup():
                assert point_at(0.0, 0.0) == sprite_position(test_sprite)
                sprite_set_position(test_sprite, point_at(400.0, 300.0))
                assert point_at(400.0, 300.0) == sprite_position(test_sprite)
                
    def test_sprite_replay_animation_integration():
        test_bitmap = create_bitmap("Test Bitmap 75", 100, 100)
        with bitmap_cleanup():
            test_animation = load_animation_script("Test Script 8", "kermit.txt")
            with animation_script_cleanup():
                test_sprite = create_sprite_with_animation(test_bitmap, test_animation)
                with sprite_cleanup():
                    sprite_start_animation_named(test_sprite, "walkfront")
                    assert not sprite_animation_has_ended(test_sprite)
                    for _ in range(5):
                        update_sprite_percent(test_sprite, 100.0)
                        
                        assert sprite_animation_has_ended(test_sprite)
                        sprite_replay_animation(test_sprite)
                        assert not sprite_animation_has_ended(test_sprite)
                        
    def test_sprite_replay_animation_with_sound_integration():
        test_bitmap = create_bitmap("Test Bitmap 76", 100, 100)
        with bitmap_cleanup():
            test_animation = load_animation_script("Test Script 9", "startup.txt")
            with animation_script_cleanup():
                test_sprite = create_sprite_with_animation(test_bitmap, test_animation)
                with sprite_cleanup():
                    sprite_start_animation_named(test_sprite, "splash")
                    assert not sprite_animation_has_ended(test_sprite)
                    for _ in range(100):
                        update_sprite_animation_percent(test_sprite, 100.0)
                        
                        assert sprite_animation_has_ended(test_sprite)
                        sprite_replay_animation_with_sound(test_sprite, true)
                        assert sound_effect_playing_named("SwinGameStart")
                        assert not sprite_animation_has_ended(test_sprite)
                        
    def test_sprite_rotation_integration():
        test_bitmap = create_bitmap("Test Bitmap 77", 100, 100)
        with bitmap_cleanup():
            test_sprite = create_sprite(test_bitmap)
            with sprite_cleanup():
                assert 0.0 == sprite_rotation(test_sprite)
                sprite_set_rotation(test_sprite, 45.0)
                assert 45.0 == sprite_rotation(test_sprite)
                
    def test_sprite_scale_integration():
        test_bitmap = create_bitmap("Test Bitmap 78", 100, 100)
        with bitmap_cleanup():
            test_sprite = create_sprite(test_bitmap)
            with sprite_cleanup():
                assert 1.0 == sprite_scale(test_sprite)
                sprite_set_scale(test_sprite, 2.0)
                assert 2.0 == sprite_scale(test_sprite)
                
    def test_sprite_screen_rectangle_integration():
        open_window("Test Window 8", 800, 600)
        with window_cleanup():
            test_bitmap = create_bitmap("Test Bitmap 79", 100, 100)
            with bitmap_cleanup():
                test_animation = load_animation_script("Test Script 10", "kermit.txt")
                with animation_script_cleanup():
                    clear_bitmap(test_bitmap, color_white())
                    test_sprite = create_sprite_with_animation(test_bitmap, test_animation)
                    with sprite_cleanup():
                        sprite_start_animation_named(test_sprite, "walkfront")
                        sprite_set_position(test_sprite, point_at(0.0, 0.0))
                        rect = sprite_screen_rectangle(test_sprite)
                        assert 0.0 == rect.x
                        assert 0.0 == rect.y
                        assert 100.0 == rect.width
                        assert 100.0 == rect.height
                        
    def test_sprite_send_layer_backward_integration():
        test_bitmap = create_bitmap("Test Bitmap 80", 100, 100)
        with bitmap_cleanup():
            test_sprite = create_sprite(test_bitmap)
            with sprite_cleanup():
                layer1 = sprite_add_layer(test_sprite, test_bitmap, "layer1")
                sprite_show_layer(test_sprite, layer1)
                layer2 = sprite_add_layer(test_sprite, test_bitmap, "layer2")
                sprite_show_layer(test_sprite, layer2)
                visible_index = sprite_visible_index_of_layer(test_sprite, layer2)
                sprite_send_layer_backward(test_sprite, visible_index)
                assert 2 == sprite_visible_index_of_layer(test_sprite, layer2)
                
    def test_sprite_send_layer_to_back_integration():
        test_bitmap = create_bitmap("Test Bitmap 81", 100, 100)
        with bitmap_cleanup():
            test_sprite = create_sprite(test_bitmap)
            with sprite_cleanup():
                layer1 = sprite_add_layer(test_sprite, test_bitmap, "layer1")
                sprite_show_layer(test_sprite, layer1)
                layer2 = sprite_add_layer(test_sprite, test_bitmap, "layer2")
                sprite_show_layer(test_sprite, layer2)
                visible_index = sprite_visible_index_of_layer(test_sprite, layer2)
                sprite_send_layer_to_back(test_sprite, visible_index)
                assert 2 == sprite_visible_index_of_layer(test_sprite, layer2)
                
    def test_sprite_set_anchor_point_integration():
        test_bitmap = create_bitmap("Test Bitmap 82", 100, 100)
        with bitmap_cleanup():
            test_sprite = create_sprite(test_bitmap)
            with sprite_cleanup():
                assert point_at(50.0, 50.0) == sprite_anchor_point(test_sprite)
                sprite_set_anchor_point(test_sprite, point_at(25.0, 25.0))
                assert point_at(25.0, 25.0) == sprite_anchor_point(test_sprite)
                
    def test_sprite_set_collision_bitmap_integration():
        test_bitmap = create_bitmap("Test Bitmap 83", 100, 100)
        with bitmap_cleanup():
            test_sprite = create_sprite(test_bitmap)
            with sprite_cleanup():
                assert test_bitmap == sprite_collision_bitmap(test_sprite)
                new_bitmap = create_bitmap("Test Bitmap 84", 200, 200)
                sprite_set_collision_bitmap(test_sprite, new_bitmap)
                assert new_bitmap == sprite_collision_bitmap(test_sprite)
                
    def test_sprite_set_collision_kind_integration():
        test_bitmap = create_bitmap("Test Bitmap 85", 100, 100)
        with bitmap_cleanup():
            test_sprite = create_sprite(test_bitmap)
            with sprite_cleanup():
                assert CollisionTestKind.PixelCollisions == sprite_collision_kind(test_sprite)
                sprite_set_collision_kind(test_sprite, CollisionTestKind.AabbCollisions)
                assert CollisionTestKind.AabbCollisions == sprite_collision_kind(test_sprite)
                
    def test_sprite_set_dx_integration():
        test_bitmap = create_bitmap("Test Bitmap 86", 100, 100)
        with bitmap_cleanup():
            test_sprite = create_sprite(test_bitmap)
            with sprite_cleanup():
                assert 0.0 == sprite_dx(test_sprite)
                sprite_set_dx(test_sprite, 5.0)
                assert 5.0 == sprite_dx(test_sprite)
                
    def test_sprite_set_dy_integration():
        test_bitmap = create_bitmap("Test Bitmap 87", 100, 100)
        with bitmap_cleanup():
            test_sprite = create_sprite(test_bitmap)
            with sprite_cleanup():
                assert 0.0 == sprite_dy(test_sprite)
                sprite_set_dy(test_sprite, 5.0)
                assert 5.0 == sprite_dy(test_sprite)
                
    def test_sprite_set_heading_integration():
        test_bitmap = create_bitmap("Test Bitmap 88", 100, 100)
        with bitmap_cleanup():
            test_sprite = create_sprite(test_bitmap)
            with sprite_cleanup():
                sprite_set_velocity(test_sprite, vector_from_angle(90.0, 1.0))
                assert 90.0 == sprite_heading(test_sprite)
                sprite_set_heading(test_sprite, 45.0)
                assert 45.0 == sprite_heading(test_sprite)
                
    def test_sprite_set_layer_offset_named_integration():
        test_bitmap = create_bitmap("Test Bitmap 89", 100, 100)
        with bitmap_cleanup():
            test_sprite = create_sprite(test_bitmap)
            with sprite_cleanup():
                assert vector_to(0.0, 0.0) == sprite_layer_offset_named(test_sprite, "base_layer")
                sprite_set_layer_offset_named(test_sprite, "base_layer", vector_to(10.0, 10.0))
                assert vector_to(10.0, 10.0) == sprite_layer_offset_named(test_sprite, "base_layer")
                
    def test_sprite_set_layer_offset_at_index_integration():
        test_bitmap = create_bitmap("Test Bitmap 90", 100, 100)
        with bitmap_cleanup():
            test_sprite = create_sprite(test_bitmap)
            with sprite_cleanup():
                assert vector_to(0.0, 0.0) == sprite_layer_offset(test_sprite, 0)
                sprite_set_layer_offset_at_index(test_sprite, 0, vector_to(10.0, 10.0))
                assert vector_to(10.0, 10.0) == sprite_layer_offset(test_sprite, 0)
                
    def test_sprite_set_mass_integration():
        test_bitmap = create_bitmap("Test Bitmap 91", 100, 100)
        with bitmap_cleanup():
            test_sprite = create_sprite(test_bitmap)
            with sprite_cleanup():
                assert 1.0 == sprite_mass(test_sprite)
                sprite_set_mass(test_sprite, 10.0)
                assert 10.0 == sprite_mass(test_sprite)
                
    def test_sprite_set_move_from_anchor_point_integration():
        test_bitmap = create_bitmap("Test Bitmap 92", 100, 100)
        with bitmap_cleanup():
            test_sprite = create_sprite(test_bitmap)
            with sprite_cleanup():
                assert not sprite_move_from_anchor_point(test_sprite)
                sprite_set_move_from_anchor_point(test_sprite, true)
                assert sprite_move_from_anchor_point(test_sprite)
                
    def test_sprite_set_position_integration():
        test_bitmap = create_bitmap("Test Bitmap 93", 100, 100)
        with bitmap_cleanup():
            test_sprite = create_sprite(test_bitmap)
            with sprite_cleanup():
                assert point_at(0.0, 0.0) == sprite_position(test_sprite)
                sprite_set_position(test_sprite, point_at(100.0, 100.0))
                assert point_at(100.0, 100.0) == sprite_position(test_sprite)
                
    def test_sprite_set_rotation_integration():
        test_bitmap = create_bitmap("Test Bitmap 94", 100, 100)
        with bitmap_cleanup():
            test_sprite = create_sprite(test_bitmap)
            with sprite_cleanup():
                assert 0.0 == sprite_rotation(test_sprite)
                sprite_set_rotation(test_sprite, 45.0)
                assert 45.0 == sprite_rotation(test_sprite)
                
    def test_sprite_set_scale_integration():
        test_bitmap = create_bitmap("Test Bitmap 95", 100, 100)
        with bitmap_cleanup():
            test_sprite = create_sprite(test_bitmap)
            with sprite_cleanup():
                assert 1.0 == sprite_scale(test_sprite)
                sprite_set_scale(test_sprite, 2.0)
                assert 2.0 == sprite_scale(test_sprite)
                
    def test_sprite_set_speed_integration():
        test_bitmap = create_bitmap("Test Bitmap 96", 100, 100)
        with bitmap_cleanup():
            test_sprite = create_sprite(test_bitmap)
            with sprite_cleanup():
                sprite_set_velocity(test_sprite, vector_from_angle(0.0, 1.0))
                sprite_set_speed(test_sprite, 5.0)
                assert 5.0 == sprite_speed(test_sprite)
                
    def test_sprite_set_value_named_integration():
        test_bitmap = create_bitmap("Test Bitmap 97", 100, 100)
        with bitmap_cleanup():
            test_sprite = create_sprite(test_bitmap)
            with sprite_cleanup():
                assert not sprite_has_value(test_sprite, "test_value")
                sprite_add_value_with_default(test_sprite, "test_value", 0.0)
                sprite_set_value_named(test_sprite, "test_value", 10.5)
                assert 10.5 == sprite_value(test_sprite, "test_value")
                
    def test_sprite_set_velocity_integration():
        test_bitmap = create_bitmap("Test Bitmap 98", 100, 100)
        with bitmap_cleanup():
            test_sprite = create_sprite(test_bitmap)
            with sprite_cleanup():
                assert vector_to(0.0, 0.0) == sprite_velocity(test_sprite)
                sprite_set_velocity(test_sprite, vector_to(5.0, 5.0))
                assert vector_to(5.0, 5.0) == sprite_velocity(test_sprite)
                
    def test_sprite_set_x_integration():
        test_bitmap = create_bitmap("Test Bitmap 99", 100, 100)
        with bitmap_cleanup():
            test_sprite = create_sprite(test_bitmap)
            with sprite_cleanup():
                assert 0.0 == sprite_x(test_sprite)
                sprite_set_x(test_sprite, 150.0)
                assert 150.0 == sprite_x(test_sprite)
                
    def test_sprite_set_y_integration():
        test_bitmap = create_bitmap("Test Bitmap 100", 100, 100)
        with bitmap_cleanup():
            test_sprite = create_sprite(test_bitmap)
            with sprite_cleanup():
                assert 0.0 == sprite_y(test_sprite)
                sprite_set_y(test_sprite, 300.0)
                assert 300.0 == sprite_y(test_sprite)
                
    def test_sprite_show_layer_named_integration():
        test_bitmap = create_bitmap("Test Bitmap 101", 100, 100)
        with bitmap_cleanup():
            test_sprite = create_sprite(test_bitmap)
            with sprite_cleanup():
                layer_idx = sprite_add_layer(test_sprite, test_bitmap, "layer2")
                sprite_hide_layer_named(test_sprite, "layer2")
                assert 1 == sprite_visible_layer_count(test_sprite)
                assert layer_idx == sprite_show_layer_named(test_sprite, "layer2")
                assert 2 == sprite_visible_layer_count(test_sprite)
                
    def test_sprite_show_layer_integration():
        test_bitmap = create_bitmap("Test Bitmap 102", 100, 100)
        with bitmap_cleanup():
            test_sprite = create_sprite(test_bitmap)
            with sprite_cleanup():
                layer_idx = sprite_add_layer(test_sprite, test_bitmap, "layer2")
                sprite_hide_layer(test_sprite, layer_idx)
                assert 1 == sprite_visible_layer_count(test_sprite)
                assert layer_idx == sprite_show_layer(test_sprite, layer_idx)
                assert 2 == sprite_visible_layer_count(test_sprite)
                
    def test_sprite_speed_integration():
        test_bitmap = create_bitmap("Test Bitmap 103", 100, 100)
        with bitmap_cleanup():
            test_sprite = create_sprite(test_bitmap)
            with sprite_cleanup():
                assert 0.0 == sprite_speed(test_sprite)
                sprite_set_velocity(test_sprite, vector_to(3.0, 4.0))
                assert 5.0 == sprite_speed(test_sprite)
                
    def test_sprite_start_animation_named_integration():
        test_bitmap = create_bitmap("Test Bitmap 104", 100, 100)
        with bitmap_cleanup():
            test_animation = load_animation_script("Test Script 11", "kermit.txt")
            with animation_script_cleanup():
                test_sprite = create_sprite_with_animation(test_bitmap, test_animation)
                with sprite_cleanup():
                    sprite_start_animation_named(test_sprite, "walkfront")
                    assert not sprite_animation_has_ended(test_sprite)
                    for _ in range(5):
                        update_sprite_animation_percent(test_sprite, 100.0)
                        
                        assert sprite_animation_has_ended(test_sprite)
                        assert "walkfront" == sprite_animation_name(test_sprite)
                        
    def test_sprite_start_animation_named_with_sound_integration():
        test_bitmap = create_bitmap("Test Bitmap 105", 100, 100)
        with bitmap_cleanup():
            test_animation = load_animation_script("Test Script 12", "startup.txt")
            with animation_script_cleanup():
                test_sprite = create_sprite_with_animation(test_bitmap, test_animation)
                with sprite_cleanup():
                    sprite_start_animation_named_with_sound(test_sprite, "splash", true)
                    assert not sprite_animation_has_ended(test_sprite)
                    assert sound_effect_playing_named("SwinGameStart")
                    for _ in range(100):
                        update_sprite_animation_percent(test_sprite, 100.0)
                        
                        assert sprite_animation_has_ended(test_sprite)
                        assert "splash" == sprite_animation_name(test_sprite)
                        
    def test_sprite_start_animation_integration():
        test_bitmap = create_bitmap("Test Bitmap 106", 100, 100)
        with bitmap_cleanup():
            test_animation = load_animation_script("Test Script 13", "kermit.txt")
            with animation_script_cleanup():
                test_sprite = create_sprite_with_animation(test_bitmap, test_animation)
                with sprite_cleanup():
                    sprite_start_animation(test_sprite, 0)
                    assert not sprite_animation_has_ended(test_sprite)
                    for _ in range(5):
                        update_sprite_animation_percent(test_sprite, 100.0)
                        
                        assert sprite_animation_has_ended(test_sprite)
                        
    def test_sprite_start_animation_with_sound_integration():
        test_bitmap = create_bitmap("Test Bitmap 107", 100, 100)
        with bitmap_cleanup():
            test_animation = load_animation_script("Test Script 14", "startup.txt")
            with animation_script_cleanup():
                test_sprite = create_sprite_with_animation(test_bitmap, test_animation)
                with sprite_cleanup():
                    sprite_start_animation_with_sound(test_sprite, 0, true)
                    assert not sprite_animation_has_ended(test_sprite)
                    assert sound_effect_playing_named("SwinGameStart")
                    for _ in range(100):
                        update_sprite_animation_percent_with_sound(test_sprite, 100.0, true)
                        
                        assert sprite_animation_has_ended(test_sprite)
                        
    def test_sprite_stop_calling_on_event_integration():
        test_sprite_delegates = sprite_delegates();
        test_bitmap = create_bitmap("Test Bitmap 109", 100, 100)
        with bitmap_cleanup():
            test_sprite = create_sprite(test_bitmap)
            with sprite_cleanup():
                sprite_call_on_event(test_sprite, test_sprite_delegates.sprite_event_handler())
                update_sprite(test_sprite)
                assert test_sprite_delegates.event_called()
                sprite_stop_calling_on_event(test_sprite, test_sprite_delegates.sprite_event_handler())
                test_sprite_delegates.reset()
;                update_sprite(test_sprite)
                assert not test_sprite_delegates.event_called()
                
    def test_sprite_toggle_layer_visible_named_integration():
        test_bitmap = create_bitmap("Test Bitmap 110", 100, 100)
        with bitmap_cleanup():
            test_sprite = create_sprite(test_bitmap)
            with sprite_cleanup():
                sprite_add_layer(test_sprite, test_bitmap, "layer2")
                sprite_show_layer_named(test_sprite, "layer2")
                assert 2 == sprite_visible_layer_count(test_sprite)
                sprite_toggle_layer_visible_named(test_sprite, "layer2")
                assert 1 == sprite_visible_layer_count(test_sprite)
                sprite_toggle_layer_visible_named(test_sprite, "layer2")
                assert 2 == sprite_visible_layer_count(test_sprite)
                
    def test_sprite_toggle_layer_visible_integration():
        test_bitmap = create_bitmap("Test Bitmap 111", 100, 100)
        with bitmap_cleanup():
            test_sprite = create_sprite(test_bitmap)
            with sprite_cleanup():
                layer_idx = sprite_add_layer(test_sprite, test_bitmap, "layer2")
                sprite_show_layer(test_sprite, layer_idx)
                assert 2 == sprite_visible_layer_count(test_sprite)
                sprite_toggle_layer_visible(test_sprite, layer_idx)
                assert 1 == sprite_visible_layer_count(test_sprite)
                
    def test_sprite_value_integration():
        test_bitmap = create_bitmap("Test Bitmap 112", 100, 100)
        with bitmap_cleanup():
            test_sprite = create_sprite(test_bitmap)
            with sprite_cleanup():
                assert 3 == sprite_value_count(test_sprite)
                sprite_add_value_with_default(test_sprite, "test_value", 0.0)
                assert 0.0 == sprite_value(test_sprite, "test_value")
                
    def test_sprite_value_count_integration():
        test_bitmap = create_bitmap("Test Bitmap 113", 100, 100)
        with bitmap_cleanup():
            test_sprite = create_sprite(test_bitmap)
            with sprite_cleanup():
                assert 3 == sprite_value_count(test_sprite)
                sprite_add_value_with_default(test_sprite, "health", 0.0)
                sprite_add_value_with_default(test_sprite, "speed", 0.0)
                assert 5 == sprite_value_count(test_sprite)
                
    def test_sprite_velocity_integration():
        test_bitmap = create_bitmap("Test Bitmap 114", 100, 100)
        with bitmap_cleanup():
            test_sprite = create_sprite(test_bitmap)
            with sprite_cleanup():
                assert vector_to(0.0, 0.0) == sprite_velocity(test_sprite)
                sprite_set_velocity(test_sprite, vector_to(5.0, 5.0))
                assert vector_to(5.0, 5.0) == sprite_velocity(test_sprite)
                
    def test_sprite_visible_index_of_layer_named_integration():
        test_bitmap = create_bitmap("Test Bitmap 115", 100, 100)
        with bitmap_cleanup():
            test_sprite = create_sprite(test_bitmap)
            with sprite_cleanup():
                assert 0 == sprite_visible_index_of_layer_named(test_sprite, "base_layer")
                sprite_add_layer(test_sprite, test_bitmap, "layer2")
                sprite_show_layer_named(test_sprite, "layer2")
                assert 1 == sprite_visible_index_of_layer_named(test_sprite, "layer2")
                
    def test_sprite_visible_index_of_layer_integration():
        test_bitmap = create_bitmap("Test Bitmap 116", 100, 100)
        with bitmap_cleanup():
            test_sprite = create_sprite(test_bitmap)
            with sprite_cleanup():
                assert 0 == sprite_visible_index_of_layer(test_sprite, 0)
                layer_idx = sprite_add_layer(test_sprite, test_bitmap, "layer2")
                sprite_show_layer(test_sprite, layer_idx)
                assert 1 == sprite_visible_index_of_layer(test_sprite, layer_idx)
                
    def test_sprite_visible_layer_integration():
        test_bitmap = create_bitmap("Test Bitmap 117", 100, 100)
        with bitmap_cleanup():
            test_sprite = create_sprite(test_bitmap)
            with sprite_cleanup():
                assert 0 == sprite_visible_layer(test_sprite, 0)
                sprite_add_layer(test_sprite, test_bitmap, "layer2")
                sprite_show_layer_named(test_sprite, "layer2")
                assert 1 == sprite_visible_layer(test_sprite, 1)
                
    def test_sprite_visible_layer_count_integration():
        test_bitmap = create_bitmap("Test Bitmap 118", 100, 100)
        with bitmap_cleanup():
            test_sprite = create_sprite(test_bitmap)
            with sprite_cleanup():
                assert 1 == sprite_visible_layer_count(test_sprite)
                sprite_add_layer(test_sprite, test_bitmap, "layer2")
                sprite_show_layer_named(test_sprite, "layer2")
                assert 2 == sprite_visible_layer_count(test_sprite)
                sprite_hide_layer_named(test_sprite, "layer2")
                assert 1 == sprite_visible_layer_count(test_sprite)
                
    def test_sprite_visible_layer_id_integration():
        test_bitmap = create_bitmap("Test Bitmap 119", 100, 100)
        with bitmap_cleanup():
            test_sprite = create_sprite(test_bitmap)
            with sprite_cleanup():
                assert 0 == sprite_visible_layer_id(test_sprite, 0)
                sprite_add_layer(test_sprite, test_bitmap, "layer2")
                sprite_show_layer_named(test_sprite, "layer2")
                assert 1 == sprite_visible_layer_id(test_sprite, 1)
                
    def test_sprite_width_integration():
        test_bitmap = create_bitmap("Test Bitmap 120", 100, 100)
        with bitmap_cleanup():
            test_sprite = create_sprite(test_bitmap)
            with sprite_cleanup():
                assert 1.0 == sprite_scale(test_sprite)
                sprite_set_scale(test_sprite, 2.0)
                assert 2.0 == sprite_scale(test_sprite)
                
    def test_sprite_x_integration():
        test_bitmap = create_bitmap("Test Bitmap 121", 100, 100)
        with bitmap_cleanup():
            test_sprite = create_sprite(test_bitmap)
            with sprite_cleanup():
                assert 0.0 == sprite_x(test_sprite)
                sprite_set_x(test_sprite, 150.0)
                assert 150.0 == sprite_x(test_sprite)
                
    def test_sprite_y_integration():
        test_bitmap = create_bitmap("Test Bitmap 122", 100, 100)
        with bitmap_cleanup():
            test_sprite = create_sprite(test_bitmap)
            with sprite_cleanup():
                assert 0.0 == sprite_y(test_sprite)
                sprite_set_y(test_sprite, 200.0)
                assert 200.0 == sprite_y(test_sprite)
                
    def test_stop_calling_on_sprite_event_integration():
        test_sprite_delegates = sprite_delegates();
        test_bitmap = create_bitmap("Test Bitmap 108", 100, 100)
        with bitmap_cleanup():
            test_sprite = create_sprite(test_bitmap)
            with sprite_cleanup():
                call_on_sprite_event(test_sprite_delegates.sprite_event_handler())
                update_sprite(test_sprite)
                assert test_sprite_delegates.event_called()
                stop_calling_on_sprite_event(test_sprite_delegates.sprite_event_handler())
                test_sprite_delegates.reset()
;                update_sprite(test_sprite)
                assert not test_sprite_delegates.event_called()
                
    def test_update_all_sprites_integration():
        test_bitmap = create_bitmap("Test Bitmap 123", 100, 100)
        with bitmap_cleanup():
            test_sprite1 = create_sprite(test_bitmap)
            with sprite_cleanup():
                test_sprite2 = create_sprite(test_bitmap)
                sprite_set_velocity(test_sprite1, vector_to(10.0, 10.0))
                sprite_set_velocity(test_sprite2, vector_to(-10.0, -10.0))
                update_all_sprites()
                assert vector_to(10.0, 10.0) == sprite_velocity(test_sprite1)
                assert vector_to(-10.0, -10.0) == sprite_velocity(test_sprite2)
                
    def test_update_all_sprites_percent_integration():
        test_bitmap = create_bitmap("Test Bitmap 124", 100, 100)
        with bitmap_cleanup():
            test_sprite1 = create_sprite(test_bitmap)
            with sprite_cleanup():
                test_sprite2 = create_sprite(test_bitmap)
                sprite_set_velocity(test_sprite1, vector_to(100.0, 100.0))
                sprite_set_velocity(test_sprite2, vector_to(-100.0, -100.0))
                update_all_sprites_percent(0.5)
                assert 50.0 == sprite_x(test_sprite1)
                assert 50.0 == sprite_y(test_sprite1)
                assert -50.0 == sprite_x(test_sprite2)
                assert -50.0 == sprite_y(test_sprite2)
                
    def test_update_sprite_integration():
        test_bitmap = create_bitmap("Test Bitmap 125", 100, 100)
        with bitmap_cleanup():
            test_sprite = create_sprite(test_bitmap)
            with sprite_cleanup():
                sprite_set_velocity(test_sprite, vector_to(10.0, 10.0))
                initial_pos = sprite_position(test_sprite)
                update_sprite(test_sprite)
                assert initial_pos != sprite_position(test_sprite)
                
    def test_update_sprite_with_sound_integration():
        test_bitmap = create_bitmap("Test Bitmap 126", 100, 100)
        with bitmap_cleanup():
            test_animation = load_animation_script("Test Script 15", "startup.txt")
            with animation_script_cleanup():
                test_sprite = create_sprite_with_animation(test_bitmap, test_animation)
                with sprite_cleanup():
                    sprite_start_animation_named_with_sound(test_sprite, "splash", true)
                    update_sprite_with_sound(test_sprite, true)
                    assert sound_effect_playing_named("SwinGameStart")
                    stop_sound_effect_named("SwinGameStart")
                    update_sprite_with_sound(test_sprite, false)
                    assert not sound_effect_playing_named("SwinGameStart")
                    
    def test_update_sprite_percent_integration():
        test_bitmap = create_bitmap("Test Bitmap 127", 100, 100)
        with bitmap_cleanup():
            test_sprite = create_sprite(test_bitmap)
            with sprite_cleanup():
                sprite_set_velocity(test_sprite, vector_to(100.0, 100.0))
                update_sprite_percent(test_sprite, 0.5)
                assert 50.0 == sprite_x(test_sprite)
                assert 50.0 == sprite_y(test_sprite)
                
    def test_update_sprite_percent_with_sound_integration():
        test_animation = load_animation_script("Test Script 16", "startup.txt")
        with animation_script_cleanup():
            test_bitmap = create_bitmap("Test Bitmap 128", 100, 100)
            with bitmap_cleanup():
                test_sprite = create_sprite_with_animation(test_bitmap, test_animation)
                with sprite_cleanup():
                    sprite_start_animation_named_with_sound(test_sprite, "splash", true)
                    update_sprite_percent_with_sound(test_sprite, 0.5, true)
                    assert sound_effect_playing_named("SwinGameStart")
                    stop_sound_effect_named("SwinGameStart")
                    update_sprite_percent_with_sound(test_sprite, 0.5, false)
                    assert not sound_effect_playing_named("SwinGameStart")
                    
    def test_update_sprite_animation_integration():
        test_bitmap = create_bitmap("Test Bitmap 129", 100, 100)
        with bitmap_cleanup():
            test_animation = load_animation_script("Test Script 17", "kermit.txt")
            with animation_script_cleanup():
                test_sprite = create_sprite_with_animation(test_bitmap, test_animation)
                with sprite_cleanup():
                    sprite_start_animation_named(test_sprite, "walkfront")
                    assert not sprite_animation_has_ended(test_sprite)
                    for _ in range(50):
                        update_sprite_animation(test_sprite)
                        
                        assert sprite_animation_has_ended(test_sprite)
                        
    def test_update_sprite_animation_with_sound_integration():
        test_bitmap = create_bitmap("Test Bitmap 130", 100, 100)
        with bitmap_cleanup():
            test_animation = load_animation_script("Test Script 18", "startup.txt")
            with animation_script_cleanup():
                test_sprite = create_sprite_with_animation(test_bitmap, test_animation)
                with sprite_cleanup():
                    sprite_start_animation_named(test_sprite, "splash")
                    update_sprite_animation_with_sound(test_sprite, true)
                    assert sound_effect_playing_named("SwinGameStart")
                    stop_sound_effect_named("SwinGameStart")
                    for _ in range(100):
                        update_sprite_animation_with_sound(test_sprite, false)
                        
                        assert not sound_effect_playing_named("SwinGameStart")
                        
    def test_update_sprite_animation_percent_integration():
        test_bitmap = create_bitmap("Test Bitmap 131", 100, 100)
        with bitmap_cleanup():
            test_animation = load_animation_script("Test Script 19", "startup.txt")
            with animation_script_cleanup():
                test_sprite = create_sprite_with_animation(test_bitmap, test_animation)
                with sprite_cleanup():
                    sprite_start_animation_named(test_sprite, "splash")
                    assert not sprite_animation_has_ended(test_sprite)
                    for _ in range(100):
                        update_sprite_animation_percent(test_sprite, 100.0)
                        
                        assert sprite_animation_has_ended(test_sprite)
                        
    def test_update_sprite_animation_percent_with_sound_integration():
        test_bitmap = create_bitmap("Test Bitmap 132", 100, 100)
        with bitmap_cleanup():
            test_animation = load_animation_script("Test Script 20", "startup.txt")
            with animation_script_cleanup():
                test_sprite = create_sprite_with_animation(test_bitmap, test_animation)
                with sprite_cleanup():
                    sprite_start_animation_named(test_sprite, "splash")
                    assert not sprite_animation_has_ended(test_sprite)
                    update_sprite_animation_percent_with_sound(test_sprite, 100.0, true)
                    assert sound_effect_playing_named("SwinGameStart")
                    stop_sound_effect_named("SwinGameStart")
                    for _ in range(100):
                        update_sprite_animation_percent_with_sound(test_sprite, 100.0, false)
                        
                        assert not sound_effect_playing_named("SwinGameStart")
                        
    def test_vector_from_center_sprite_to_point_point_integration():
        test_bitmap = create_bitmap("Test Bitmap 133", 100, 100)
        with bitmap_cleanup():
            test_sprite = create_sprite(test_bitmap)
            with sprite_cleanup():
                sprite_set_position(test_sprite, point_at(0.0, 0.0))
                target_point = point_at(150.0, 150.0)
                vector = vector_from_center_sprite_to_point_point(test_sprite, target_point)
                assert 100.0 == vector.x
                assert 100.0 == vector.y
                
    def test_vector_from_to_integration():
        test_bitmap = create_bitmap("Test Bitmap 134", 100, 100)
        with bitmap_cleanup():
            test_sprite1 = create_sprite(test_bitmap)
            with sprite_cleanup():
                test_sprite2 = create_sprite(test_bitmap)
                sprite_set_position(test_sprite1, point_at(0.0, 0.0))
                sprite_set_position(test_sprite2, point_at(100.0, 100.0))
                vector = vector_from_to(test_sprite1, test_sprite2)
                assert 100.0 == vector.x
                assert 100.0 == vector.y
                
