import pytest
from splashkit import *


def test_CallForAllSpritesWithValue_integration():
    test_window = open_window("Test Window", 800, 600)
    test_bitmap = create_bitmap("test_bitmap", 100, 100)
    test_sprite1 = create_sprite(test_bitmap)
    test_sprite2 = create_sprite(test_bitmap)
    sprite_set_x(test_sprite1, 100)
    sprite_set_x(test_sprite2, 200)
    call_for_all_sprites_with_value(sprite_set_x(test_sprite1, 300), 300)
    assert sprite_x(test_sprite1) == 300
    assert sprite_x(test_sprite2) == 300
    free_all_sprites()
    free_bitmap(test_bitmap)
    close_window(test_window)


def test_CallForAllSprites_integration():
    test_window = open_window("Test Window", 800, 600)
    test_bitmap = create_bitmap("test_bitmap", 100, 100)
    test_sprite_1 = create_sprite(test_bitmap)
    test_sprite_2 = create_sprite(test_bitmap)
    sprite_set_x(test_sprite_1, 100)
    sprite_set_y(test_sprite_1, 100)
    sprite_set_x(test_sprite_2, 200)
    sprite_set_y(test_sprite_2, 200)
    call_for_all_sprites(_test_sprite_function())
    assert sprite_at(test_sprite_1, point_at(100, 100)) is True
    assert sprite_at(test_sprite_2, point_at(200, 200)) is True
    free_all_sprites()
    free_bitmap(test_bitmap)
    close_window(test_window)


def test_CallOnSpriteEvent_integration():
    test_window = open_window("Test Window", 800, 600)
    test_bitmap = create_bitmap("test_bitmap", 100, 100)
    test_sprite = create_sprite(test_bitmap)
    call_on_sprite_event(_on_sprite_event())
    process_events()
    simulate_mouse_click(Mousebutton.Left)
    process_events()
    assert mouse_clicked(Mousebutton.Left) is True
    free_sprite(test_sprite)
    free_bitmap(test_bitmap)
    close_window(test_window)


def test_CenterPoint_integration():
    test_window = open_window("Test Window", 800, 600)
    test_bitmap = create_bitmap("test_bitmap", 100, 100)
    test_sprite = create_sprite(test_bitmap)
    sprite_set_position(test_sprite, point_at(100, 100))
    test_center_point = center_point(test_sprite)
    assert test_center_point.x == 150
    assert test_center_point.y == 150
    free_sprite(test_sprite)
    free_bitmap(test_bitmap)
    close_window(test_window)


def test_CreateSprite_integration():
    test_window = open_window("Test Window", 800, 600)
    test_bitmap = create_bitmap("test_bitmap", 100, 100)
    test_sprite = create_sprite(test_bitmap)
    assert test_sprite is not None
    free_sprite(test_sprite)
    free_bitmap(test_bitmap)
    close_window(test_window)


def test_CreateSpriteWithAnimation_integration():
    test_window = open_window("Test Window", 800, 600)
    test_bitmap = create_bitmap("test_bitmap", 100, 100)
    test_animation = load_animation_script("test_animation", "kermit.txt")
    test_sprite = create_sprite_with_animation(test_bitmap, test_animation)
    assert test_sprite is not None
    free_sprite(test_sprite)
    free_bitmap(test_bitmap)
    free_animation_script(test_animation)
    close_window(test_window)


def test_CreateSpriteWithBitmapNamed_integration():
    test_window = open_window("Test Window", 800, 600)
    test_bitmap = create_bitmap("test_bitmap", 100, 100)
    test_sprite = create_sprite_with_bitmap_named("test_bitmap")
    assert test_sprite is not None
    free_sprite(test_sprite)
    free_bitmap(test_bitmap)
    close_window(test_window)


def test_CreateSpriteNamed_integration():
    test_window = open_window("Test Window", 800, 600)
    test_bitmap = create_bitmap("test_bitmap", 100, 100)
    test_sprite = create_sprite_named("test_sprite", test_bitmap)
    assert test_sprite is not None
    free_sprite(test_sprite)
    free_bitmap(test_bitmap)
    close_window(test_window)


def test_CreateSpriteNamedWithAnimation_integration():
    test_window = open_window("Test Window", 800, 600)
    test_bitmap = create_bitmap("test_bitmap", 100, 100)
    test_animation = load_animation_script("test_animation", "kermit.txt")
    test_sprite = create_sprite_named_with_animation("test_sprite", test_bitmap, test_animation)
    assert test_sprite is not None
    free_sprite(test_sprite)
    free_bitmap(test_bitmap)
    free_animation_script(test_animation)
    close_window(test_window)


def test_CreateSpriteWithBitmapAndAnimationNamed_integration():
    test_window = open_window("Test Window", 800, 600)
    test_bitmap = create_bitmap("test_bitmap", 100, 100)
    test_sprite = create_sprite_with_bitmap_and_animation_named("test_bitmap", "test_animation")
    assert test_sprite is not None
    free_sprite(test_sprite)
    free_bitmap(test_bitmap)
    close_window(test_window)


def test_CreateSpritePack_integration():
    test_window = open_window("Test Window", 800, 600)
    create_sprite_pack("test_pack")
    assert has_sprite_pack("test_pack") is True
    free_sprite_pack("test_pack")
    close_window(test_window)


def test_CurrentSpritePack_integration():
    create_sprite_pack("test_pack")
    select_sprite_pack("test_pack")
    current_pack = current_sprite_pack()
    assert current_pack == "test_pack"
    free_sprite_pack("test_pack")


def test_DrawAllSprites_integration():
    test_window = open_window("Test Window", 800, 600)
    test_bitmap = create_bitmap("test_bitmap", 100, 100)
    test_sprite1 = create_sprite(test_bitmap)
    test_sprite2 = create_sprite(test_bitmap)
    sprite_set_x(test_sprite1, 100)
    sprite_set_y(test_sprite1, 100)
    sprite_set_x(test_sprite2, 200)
    sprite_set_y(test_sprite2, 200)
    draw_all_sprites()
    refresh_screen()
    assert get_pixel(100, 100) != color_white()
    assert get_pixel(200, 200) != color_white()
    free_all_sprites()
    free_bitmap(test_bitmap)
    close_window(test_window)


def test_DrawSpriteOffsetBy_integration():
    test_window = open_window("Test Window", 800, 600)
    test_bitmap = create_bitmap("test_bitmap", 100, 100)
    test_sprite = create_sprite(test_bitmap)
    sprite_set_position(test_sprite, point_at(400, 300))
    draw_sprite_offset_by(test_sprite, vector_to(50, 50))
    refresh_screen()
    assert get_pixel(point_at(450, 350)) != color_white()
    free_sprite(test_sprite)
    free_bitmap(test_bitmap)
    close_window(test_window)


def test_DrawSprite_integration():
    test_window = open_window("Test Window", 800, 600)
    test_bitmap = create_bitmap("test_bitmap", 100, 100)
    test_sprite = create_sprite(test_bitmap)
    sprite_set_position(test_sprite, point_at(400, 300))
    draw_sprite(test_sprite)
    refresh_screen()
    assert sprite_on_screen_at(test_sprite, point_at(400, 300)) is True
    free_sprite(test_sprite)
    free_bitmap(test_bitmap)
    close_window(test_window)


def test_DrawSpriteOffsetXY_integration():
    test_window = open_window("Test Window", 800, 600)
    test_bitmap = create_bitmap("test_bitmap", 100, 100)
    test_sprite = create_sprite(test_bitmap)
    sprite_set_position(test_sprite, point_at(400, 300))
    draw_sprite_offset_x_y(test_sprite, 50, 50)
    refresh_screen()
    assert point_in_circle(point_at(450, 350), sprite_collision_circle(test_sprite)) is True
    free_sprite(test_sprite)
    free_bitmap(test_bitmap)
    close_window(test_window)


def test_FreeAllSprites_integration():
    test_window = open_window("Test Window", 800, 600)
    test_bitmap = create_bitmap("test_bitmap", 100, 100)
    test_sprite = create_sprite(test_bitmap)
    free_all_sprites()
    assert has_sprite("test_sprite") is False
    free_bitmap(test_bitmap)
    close_window(test_window)


def test_FreeSprite_integration():
    test_window = open_window("Test Window", 800, 600)
    test_bitmap = create_bitmap("test_bitmap", 100, 100)
    test_sprite = create_sprite(test_bitmap)
    free_sprite(test_sprite)
    free_bitmap(test_bitmap)
    close_window(test_window)


def test_FreeSpritePack_integration():
    create_sprite_pack("test_pack")
    test_has_pack = has_sprite_pack("test_pack")
    assert test_has_pack is True
    free_sprite_pack("test_pack")
    test_has_pack = has_sprite_pack("test_pack")
    assert test_has_pack is False


def test_HasSprite_integration():
    test_window = open_window("Test Window", 800, 600)
    test_bitmap = create_bitmap("test_bitmap", 100, 100)
    test_sprite = create_sprite(test_bitmap)
    assert has_sprite("test_sprite") is True
    free_sprite(test_sprite)
    free_bitmap(test_bitmap)
    close_window(test_window)


def test_HasSpritePack_integration():
    create_sprite_pack("test_pack")
    assert has_sprite_pack("test_pack") is True
    assert has_sprite_pack("non_existent_pack") is False
    free_sprite_pack("test_pack")


def test_MoveSprite_integration():
    test_window = open_window("Test Window", 800, 600)
    test_bitmap = create_bitmap("test_bitmap", 100, 100)
    test_sprite = create_sprite(test_bitmap)
    sprite_set_velocity(test_sprite, vector_to(10.0, 10.0))
    sprite_set_position(test_sprite, point_at(100.0, 100.0))
    move_sprite(test_sprite)
    process_events()
    assert sprite_position(test_sprite) != point_at(100.0, 100.0)
    free_sprite(test_sprite)
    free_bitmap(test_bitmap)
    close_window(test_window)


def test_MoveSpriteByVector_integration():
    test_window = open_window("Test Window", 800, 600)
    test_bitmap = create_bitmap("test_bitmap", 100, 100)
    test_sprite = create_sprite(test_bitmap)
    sprite_set_position(test_sprite, point_at(100, 100))
    move_sprite_by_vector(test_sprite, vector_to(50, 50))
    process_events()
    assert sprite_x(test_sprite) == 150
    assert sprite_y(test_sprite) == 150
    free_sprite(test_sprite)
    free_bitmap(test_bitmap)
    close_window(test_window)


def test_MoveSpriteByVectorPercent_integration():
    test_window = open_window("Test Window", 800, 600)
    test_bitmap = create_bitmap("test_bitmap", 100, 100)
    test_sprite = create_sprite(test_bitmap)
    sprite_set_position(test_sprite, point_at(100.0, 100.0))
    move_sprite_by_vector_percent(test_sprite, vector_to(50.0, 50.0), 0.5)
    assert sprite_x(test_sprite) == 125.0
    assert sprite_y(test_sprite) == 125.0
    free_sprite(test_sprite)
    free_bitmap(test_bitmap)
    close_window(test_window)


def test_MoveSpritePercent_integration():
    test_window = open_window("Test Window", 800, 600)
    test_bitmap = create_bitmap("test_bitmap", 100, 100)
    test_sprite = create_sprite(test_bitmap)
    sprite_set_position(test_sprite, point_at(100.0, 100.0))
    sprite_set_velocity(test_sprite, vector_to(10.0, 10.0))
    move_sprite_percent(test_sprite, 0.5)
    process_events()
    assert point_in_circle(point_at(105.0, 105.0), sprite_circle(test_sprite)) is True
    free_sprite(test_sprite)
    free_bitmap(test_bitmap)
    close_window(test_window)


def test_MoveSpriteTo_integration():
    test_window = open_window("Test Window", 800, 600)
    test_bitmap = create_bitmap("test_bitmap", 100, 100)
    test_sprite = create_sprite(test_bitmap)
    move_sprite_to(test_sprite, 400.0, 300.0)
    assert sprite_x(test_sprite) == 400.0
    assert sprite_y(test_sprite) == 300.0
    free_sprite(test_sprite)
    free_bitmap(test_bitmap)
    close_window(test_window)


def test_SelectSpritePack_integration():
    test_window = open_window("Test Window", 800, 600)
    create_sprite_pack("test_pack")
    test_sprite = create_sprite("rocket_sprt.png")
    select_sprite_pack("test_pack")
    draw_all_sprites()
    assert sprite_on_screen_at(test_sprite, point_at(400, 300)) is True
    free_all_sprites()
    free_sprite_pack("test_pack")
    close_window(test_window)


def test_SpriteAddLayer_integration():
    test_window = open_window("Test Window", 800, 600)
    test_bitmap = create_bitmap("test_bitmap", 100, 100)
    test_sprite = create_sprite(test_bitmap)
    new_layer_bitmap = create_bitmap("new_layer_bitmap", 50, 50)
    layer_index = sprite_add_layer(test_sprite, new_layer_bitmap, "new_layer")
    assert layer_index > -1
    free_sprite(test_sprite)
    free_bitmap(test_bitmap)
    free_bitmap(new_layer_bitmap)
    close_window(test_window)


def test_SpriteAddToVelocity_integration():
    test_window = open_window("Test Window", 800, 600)
    test_bitmap = create_bitmap("test_bitmap", 100, 100)
    test_sprite = create_sprite(test_bitmap)
    sprite_set_position(test_sprite, point_at(400, 300))
    sprite_add_to_velocity(test_sprite, vector_to(10, 10))
    update_sprite(test_sprite)
    assert sprite_x(test_sprite) == 410
    assert sprite_y(test_sprite) == 310
    free_sprite(test_sprite)
    free_bitmap(test_bitmap)
    close_window(test_window)


def test_SpriteAddValue_integration():
    test_window = open_window("Test Window", 800, 600)
    test_bitmap = create_bitmap("test_bitmap", 100, 100)
    test_sprite = create_sprite(test_bitmap)
    sprite_add_value(test_sprite, "health")
    assert sprite_has_value(test_sprite, "health") is True
    free_sprite(test_sprite)
    free_bitmap(test_bitmap)
    close_window(test_window)


def test_SpriteAddValueWithDefault_integration():
    test_window = open_window("Test Window", 800, 600)
    test_bitmap = create_bitmap("test_bitmap", 100, 100)
    test_sprite = create_sprite(test_bitmap)
    sprite_add_value_with_default(test_sprite, "health", 100.0)
    assert sprite_has_value(test_sprite, "health") is True
    assert sprite_value(test_sprite, "health") == 100.0
    free_sprite(test_sprite)
    free_bitmap(test_bitmap)
    close_window(test_window)


def test_SpriteAnchorPoint_integration():
    test_window = open_window("Test Window", 800, 600)
    test_bitmap = create_bitmap("test_bitmap", 100, 100)
    test_sprite = create_sprite(test_bitmap)
    test_anchor_point = sprite_anchor_point(test_sprite)
    assert test_anchor_point.x == 50
    assert test_anchor_point.y == 50
    free_sprite(test_sprite)
    free_bitmap(test_bitmap)
    close_window(test_window)


def test_SpriteAnchorPosition_integration():
    test_window = open_window("Test Window", 800, 600)
    test_bitmap = create_bitmap("test_bitmap", 100, 100)
    test_sprite = create_sprite(test_bitmap)
    sprite_set_position(test_sprite, point_at(100, 100))
    test_anchor_position = sprite_anchor_position(test_sprite)
    assert test_anchor_position.x == 100
    assert test_anchor_position.y == 100
    free_sprite(test_sprite)
    free_bitmap(test_bitmap)
    close_window(test_window)


def test_SpriteAnimationHasEnded_integration():
    test_window = open_window("Test Window", 800, 600)
    test_bitmap = create_bitmap("test_bitmap", 100, 100)
    test_sprite = create_sprite(test_bitmap)
    sprite_start_animation(test_sprite, "default")
    update_sprite_animation(test_sprite)
    assert sprite_animation_has_ended(test_sprite) is False
    update_sprite_animation(test_sprite)
    assert sprite_animation_has_ended(test_sprite) is True
    free_sprite(test_sprite)
    free_bitmap(test_bitmap)
    close_window(test_window)


def test_SpriteAnimationName_integration():
    test_window = open_window("Test Window", 800, 600)
    test_bitmap = create_bitmap("test_bitmap", 100, 100)
    test_sprite = create_sprite(test_bitmap)
    sprite_start_animation(test_sprite, "default")
    test_animation_name = sprite_animation_name(test_sprite)
    assert test_animation_name == "default"
    free_sprite(test_sprite)
    free_bitmap(test_bitmap)
    close_window(test_window)


def test_SpriteAt_integration():
    test_window = open_window("Test Window", 800, 600)
    test_bitmap = create_bitmap("test_bitmap", 100, 100)
    test_sprite = create_sprite(test_bitmap)
    sprite_set_position(test_sprite, point_at(400, 300))
    process_events()
    assert sprite_at(test_sprite, point_at(400, 300)) is True
    assert sprite_at(test_sprite, point_at(500, 400)) is False
    free_sprite(test_sprite)
    free_bitmap(test_bitmap)
    close_window(test_window)


def test_SpriteBringLayerForward_integration():
    test_window = open_window("Test Window", 800, 600)
    test_bitmap = create_bitmap("test_bitmap", 100, 100)
    test_sprite = create_sprite(test_bitmap)
    layer_index = sprite_add_layer(test_sprite, test_bitmap, "layer2")
    initial_layer_position = sprite_visible_index_of_layer(test_sprite, layer_index)
    sprite_bring_layer_forward(test_sprite, layer_index)
    new_layer_position = sprite_visible_index_of_layer(test_sprite, layer_index)
    assert new_layer_position > initial_layer_position
    free_sprite(test_sprite)
    free_bitmap(test_bitmap)
    close_window(test_window)


def test_SpriteBringLayerToFront_integration():
    test_window = open_window("Test Window", 800, 600)
    test_bitmap = create_bitmap("test_bitmap", 100, 100)
    test_sprite = create_sprite(test_bitmap)
    layer_index = sprite_add_layer(test_sprite, test_bitmap, "layer2")
    sprite_bring_layer_to_front(test_sprite, layer_index)
    assert sprite_visible_index_of_layer(test_sprite, layer_index) == sprite_visible_layer_count(test_sprite)
    free_sprite(test_sprite)
    free_bitmap(test_bitmap)
    close_window(test_window)


def test_SpriteCallOnEvent_integration():
    test_window = open_window("Test Window", 800, 600)
    test_bitmap = create_bitmap("test_bitmap", 100, 100)
    test_sprite = create_sprite(test_bitmap)
    sprite_call_on_event(test_sprite, _on_sprite_event())
    process_events()
    simulate_mouse_click(Mousebutton.Left)
    process_events()
    assert sprite_event_occurred(test_sprite) is True
    free_sprite(test_sprite)
    free_bitmap(test_bitmap)
    close_window(test_window)


def test_SpriteCircle_integration():
    test_window = open_window("Test Window", 800, 600)
    test_bitmap = create_bitmap("test_bitmap", 100, 100)
    test_sprite = create_sprite(test_bitmap)
    test_circle = sprite_circle(test_sprite)
    assert point_in_circle(point_at(50, 50), test_circle) is True
    free_sprite(test_sprite)
    free_bitmap(test_bitmap)
    close_window(test_window)


def test_SpriteCollisionBitmap_integration():
    test_window = open_window("Test Window", 800, 600)
    test_bitmap = create_bitmap("test_bitmap", 100, 100)
    test_sprite = create_sprite(test_bitmap)
    collision_bitmap = sprite_collision_bitmap(test_sprite)
    assert bitmap_width(collision_bitmap) == 100
    assert bitmap_height(collision_bitmap) == 100
    free_sprite(test_sprite)
    free_bitmap(test_bitmap)
    close_window(test_window)


def test_SpriteCollisionCircle_integration():
    test_window = open_window("Test Window", 800, 600)
    test_bitmap = create_bitmap("test_bitmap", 100, 100)
    test_sprite = create_sprite(test_bitmap)
    test_circle = sprite_collision_circle(test_sprite)
    assert point_in_circle(point_at(50, 50), test_circle) is True
    free_sprite(test_sprite)
    free_bitmap(test_bitmap)
    close_window(test_window)


def test_SpriteCollisionKind_integration():
    test_window = open_window("Test Window", 800, 600)
    test_bitmap = create_bitmap("test_bitmap", 100, 100)
    test_sprite = create_sprite(test_bitmap)
    sprite_set_collision_kind(test_sprite, CollisionTestKind.PixelCollisions)
    assert sprite_collision_kind(test_sprite) == CollisionTestKind.PixelCollisions
    free_sprite(test_sprite)
    free_bitmap(test_bitmap)
    close_window(test_window)


def test_SpriteCollisionRectangle_integration():
    test_window = open_window("Test Window", 800, 600)
    test_bitmap = create_bitmap("test_bitmap", 100, 100)
    test_sprite = create_sprite(test_bitmap)
    test_rectangle = sprite_collision_rectangle(test_sprite)
    assert test_rectangle.width == 100
    assert test_rectangle.height == 100
    free_sprite(test_sprite)
    free_bitmap(test_bitmap)
    close_window(test_window)


def test_SpriteCurrentCell_integration():
    test_window = open_window("Test Window", 800, 600)
    test_bitmap = create_bitmap("test_bitmap", 100, 100)
    test_sprite = create_sprite(test_bitmap)
    sprite_start_animation(test_sprite, 0)
    update_sprite(test_sprite)
    assert sprite_current_cell(test_sprite) == 0
    free_sprite(test_sprite)
    free_bitmap(test_bitmap)
    close_window(test_window)


def test_SpriteCurrentCellRectangle_integration():
    test_window = open_window("Test Window", 800, 600)
    test_bitmap = create_bitmap("test_bitmap", 100, 100)
    test_sprite = create_sprite(test_bitmap)
    test_rectangle = sprite_current_cell_rectangle(test_sprite)
    assert rectangle_left(test_rectangle) == 0
    assert rectangle_top(test_rectangle) == 0
    assert rectangle_right(test_rectangle) == bitmap_width(test_bitmap)
    assert rectangle_bottom(test_rectangle) == bitmap_height(test_bitmap)
    free_sprite(test_sprite)
    free_bitmap(test_bitmap)
    close_window(test_window)


def test_SpriteDx_integration():
    test_window = open_window("Test Window", 800, 600)
    test_bitmap = create_bitmap("test_bitmap", 100, 100)
    test_sprite = create_sprite(test_bitmap)
    sprite_set_dx(test_sprite, 5.0)
    assert sprite_dx(test_sprite) == 5.0
    free_sprite(test_sprite)
    free_bitmap(test_bitmap)
    close_window(test_window)


def test_SpriteDy_integration():
    test_window = open_window("Test Window", 800, 600)
    test_bitmap = create_bitmap("test_bitmap", 100, 100)
    test_sprite = create_sprite(test_bitmap)
    sprite_set_dy(test_sprite, 5.0)
    assert sprite_dy(test_sprite) == 5.0
    free_sprite(test_sprite)
    free_bitmap(test_bitmap)
    close_window(test_window)


def test_SpriteHasValue_integration():
    test_window = open_window("Test Window", 800, 600)
    test_bitmap = create_bitmap("test_bitmap", 100, 100)
    test_sprite = create_sprite(test_bitmap)
    sprite_add_value(test_sprite, "health")
    assert sprite_has_value(test_sprite, "health") is True
    assert sprite_has_value(test_sprite, "mana") is False
    free_sprite(test_sprite)
    free_bitmap(test_bitmap)
    close_window(test_window)


def test_SpriteHeading_integration():
    test_window = open_window("Test Window", 800, 600)
    test_bitmap = create_bitmap("test_bitmap", 100, 100)
    test_sprite = create_sprite(test_bitmap)
    sprite_set_velocity(test_sprite, vector_to(1.0, 1.0))
    test_heading = sprite_heading(test_sprite)
    assert 45.0 <= test_heading <= 45.01
    free_sprite(test_sprite)
    free_bitmap(test_bitmap)
    close_window(test_window)


def test_SpriteHeight_integration():
    test_window = open_window("Test Window", 800, 600)
    test_bitmap = create_bitmap("test_bitmap", 100, 100)
    test_sprite = create_sprite(test_bitmap)
    assert sprite_height(test_sprite) == 100
    free_sprite(test_sprite)
    free_bitmap(test_bitmap)
    close_window(test_window)


def test_SpriteHideLayerNamed_integration():
    test_window = open_window("Test Window", 800, 600)
    test_bitmap = create_bitmap("test_bitmap", 100, 100)
    test_sprite = create_sprite(test_bitmap)
    layer_index = sprite_add_layer(test_sprite, test_bitmap, "layer2")
    sprite_hide_layer_named(test_sprite, "layer2")
    assert sprite_layer_visible(test_sprite, layer_index) is False
    free_sprite(test_sprite)
    free_bitmap(test_bitmap)
    close_window(test_window)


def test_SpriteHideLayer_integration():
    test_window = open_window("Test Window", 800, 600)
    test_bitmap = create_bitmap("test_bitmap", 100, 100)
    test_sprite = create_sprite(test_bitmap)
    layer_index = sprite_add_layer(test_sprite, test_bitmap, "layer2")
    sprite_show_layer(test_sprite, layer_index)
    sprite_hide_layer(test_sprite, layer_index)
    assert sprite_layer_visible(test_sprite, layer_index) is False
    free_sprite(test_sprite)
    free_bitmap(test_bitmap)
    close_window(test_window)


def test_SpriteLayerNamed_integration():
    test_window = open_window("Test Window", 800, 600)
    test_bitmap = create_bitmap("test_bitmap", 100, 100)
    test_sprite = create_sprite(test_bitmap)
    sprite_add_layer(test_sprite, test_bitmap, "layer2")
    test_layer_bitmap = sprite_layer_named(test_sprite, "layer2")
    assert test_layer_bitmap is not None
    free_sprite(test_sprite)
    free_bitmap(test_bitmap)
    close_window(test_window)


def test_SpriteLayerAtIndex_integration():
    test_window = open_window("Test Window", 800, 600)
    test_bitmap = create_bitmap("test_bitmap", 100, 100)
    test_sprite = create_sprite(test_bitmap)
    layer_index = sprite_add_layer(test_sprite, test_bitmap, "layer2")
    test_layer_bitmap = sprite_layer_at_index(test_sprite, layer_index)
    assert test_layer_bitmap is not None
    free_sprite(test_sprite)
    free_bitmap(test_bitmap)
    close_window(test_window)


def test_SpriteLayerCircleNamed_integration():
    test_window = open_window("Test Window", 800, 600)
    test_bitmap = create_bitmap("test_bitmap", 100, 100)
    test_sprite = create_sprite(test_bitmap)
    test_circle = sprite_layer_circle_named(test_sprite, "layer1")
    assert point_in_circle(point_at(50, 50), test_circle) is True
    free_sprite(test_sprite)
    free_bitmap(test_bitmap)
    close_window(test_window)


def test_SpriteLayerCircleAtIndex_integration():
    test_window = open_window("Test Window", 800, 600)
    test_bitmap = create_bitmap("test_bitmap", 100, 100)
    test_sprite = create_sprite(test_bitmap)
    test_circle = sprite_layer_circle_at_index(test_sprite, 0)
    assert point_in_circle(point_at(50, 50), test_circle) is True
    free_sprite(test_sprite)
    free_bitmap(test_bitmap)
    close_window(test_window)


def test_SpriteLayerCount_integration():
    test_window = open_window("Test Window", 800, 600)
    test_bitmap = create_bitmap("test_bitmap", 100, 100)
    test_sprite = create_sprite(test_bitmap)
    assert sprite_layer_count(test_sprite) == 1
    sprite_add_layer(test_sprite, test_bitmap, "layer2")
    assert sprite_layer_count(test_sprite) == 2
    free_sprite(test_sprite)
    free_bitmap(test_bitmap)
    close_window(test_window)


def test_SpriteLayerHeightNamed_integration():
    test_window = open_window("Test Window", 800, 600)
    test_bitmap = create_bitmap("test_bitmap", 100, 100)
    test_sprite = create_sprite(test_bitmap)
    sprite_add_layer(test_sprite, test_bitmap, "layer2")
    assert sprite_layer_height_named(test_sprite, "layer2") == 100
    free_sprite(test_sprite)
    free_bitmap(test_bitmap)
    close_window(test_window)


def test_SpriteLayerHeight_integration():
    test_window = open_window("Test Window", 800, 600)
    test_bitmap = create_bitmap("test_bitmap", 100, 100)
    test_sprite = create_sprite(test_bitmap)
    layer_height = sprite_layer_height(test_sprite, 0)
    assert layer_height == 100
    free_sprite(test_sprite)
    free_bitmap(test_bitmap)
    close_window(test_window)


def test_SpriteLayerIndex_integration():
    test_window = open_window("Test Window", 800, 600)
    test_bitmap = create_bitmap("test_bitmap", 100, 100)
    test_sprite = create_sprite(test_bitmap)
    layer_index = sprite_add_layer(test_sprite, test_bitmap, "layer2")
    assert sprite_layer_index(test_sprite, "layer2") == layer_index
    free_sprite(test_sprite)
    free_bitmap(test_bitmap)
    close_window(test_window)


def test_SpriteLayerName_integration():
    test_window = open_window("Test Window", 800, 600)
    test_bitmap = create_bitmap("test_bitmap", 100, 100)
    test_sprite = create_sprite(test_bitmap)
    layer_index = sprite_add_layer(test_sprite, test_bitmap, "layer2")
    assert sprite_layer_name(test_sprite, layer_index) == "layer2"
    free_sprite(test_sprite)
    free_bitmap(test_bitmap)
    close_window(test_window)


def test_SpriteLayerOffsetNamed_integration():
    test_window = open_window("Test Window", 800, 600)
    test_bitmap = create_bitmap("test_bitmap", 100, 100)
    test_sprite = create_sprite(test_bitmap)
    sprite_set_layer_offset_named(test_sprite, "layer1", vector_to(10, 10))
    layer_offset = sprite_layer_offset_named(test_sprite, "layer1")
    assert layer_offset.x == 10
    assert layer_offset.y == 10
    free_sprite(test_sprite)
    free_bitmap(test_bitmap)
    close_window(test_window)


def test_SpriteLayerOffset_integration():
    test_window = open_window("Test Window", 800, 600)
    test_bitmap = create_bitmap("test_bitmap", 100, 100)
    test_sprite = create_sprite(test_bitmap)
    layer_index = sprite_add_layer(test_sprite, test_bitmap, "layer2")
    sprite_set_layer_offset_at_index(test_sprite, layer_index, vector_to(10, 10))
    assert sprite_layer_offset(test_sprite, layer_index) == vector_to(10, 10)
    free_sprite(test_sprite)
    free_bitmap(test_bitmap)
    close_window(test_window)


def test_SpriteLayerRectangleNamed_integration():
    test_window = open_window("Test Window", 800, 600)
    test_bitmap = create_bitmap("test_bitmap", 100, 100)
    test_sprite = create_sprite(test_bitmap)
    test_rectangle = sprite_layer_rectangle_named(test_sprite, "layer1")
    assert rectangle_left(test_rectangle) == 0
    assert rectangle_top(test_rectangle) == 0
    assert rectangle_right(test_rectangle) == 100
    assert rectangle_bottom(test_rectangle) == 100
    free_sprite(test_sprite)
    free_bitmap(test_bitmap)
    close_window(test_window)


def test_SpriteLayerRectangleAtIndex_integration():
    test_window = open_window("Test Window", 800, 600)
    test_bitmap = create_bitmap("test_bitmap", 100, 100)
    test_sprite = create_sprite(test_bitmap)
    test_rectangle = sprite_layer_rectangle_at_index(test_sprite, 0)
    assert test_rectangle.width == bitmap_width(test_bitmap)
    free_sprite(test_sprite)
    free_bitmap(test_bitmap)
    close_window(test_window)


def test_SpriteLayerWidthNamed_integration():
    test_window = open_window("Test Window", 800, 600)
    test_bitmap = create_bitmap("test_bitmap", 100, 100)
    test_sprite = create_sprite(test_bitmap)
    sprite_add_layer(test_sprite, test_bitmap, "layer2")
    assert sprite_layer_width_named(test_sprite, "layer2") == 100
    free_sprite(test_sprite)
    free_bitmap(test_bitmap)
    close_window(test_window)


def test_SpriteLayerWidth_integration():
    test_window = open_window("Test Window", 800, 600)
    test_bitmap = create_bitmap("test_bitmap", 100, 100)
    test_sprite = create_sprite(test_bitmap)
    assert sprite_layer_width(test_sprite, 0) == 100
    free_sprite(test_sprite)
    free_bitmap(test_bitmap)
    close_window(test_window)


def test_SpriteLocationMatrix_integration():
    test_window = open_window("Test Window", 800, 600)
    test_bitmap = create_bitmap("test_bitmap", 100, 100)
    test_sprite = create_sprite(test_bitmap)
    sprite_set_position(test_sprite, point_at(100.0, 100.0))
    sprite_set_rotation(test_sprite, 45.0)
    test_matrix = sprite_location_matrix(test_sprite)
    test_point = point_at(50.0, 50.0)
    result_point = matrix_multiply_point(test_matrix, test_point)
    assert 149.0 <= result_point.x <= 150.0
    assert 149.0 <= result_point.y <= 150.0
    free_sprite(test_sprite)
    free_bitmap(test_bitmap)
    close_window(test_window)


def test_SpriteMass_integration():
    test_window = open_window("Test Window", 800, 600)
    test_bitmap = create_bitmap("test_bitmap", 100, 100)
    test_sprite = create_sprite(test_bitmap)
    sprite_set_mass(test_sprite, 10.0)
    assert sprite_mass(test_sprite) == 10.0
    free_sprite(test_sprite)
    free_bitmap(test_bitmap)
    close_window(test_window)


def test_SpriteMoveFromAnchorPoint_integration():
    test_window = open_window("Test Window", 800, 600)
    test_bitmap = create_bitmap("test_bitmap", 100, 100)
    test_sprite = create_sprite(test_bitmap)
    sprite_set_move_from_anchor_point(test_sprite, true)
    assert sprite_move_from_anchor_point(test_sprite) is True
    sprite_set_move_from_anchor_point(test_sprite, false)
    assert sprite_move_from_anchor_point(test_sprite) is False
    free_sprite(test_sprite)
    free_bitmap(test_bitmap)
    close_window(test_window)


def test_SpriteMoveToTakingSeconds_integration():
    test_window = open_window("Test Window", 800, 600)
    test_bitmap = create_bitmap("test_bitmap", 100, 100)
    test_sprite = create_sprite(test_bitmap)
    sprite_set_position(test_sprite, point_at(100, 100))
    sprite_move_to_taking_seconds(test_sprite, point_at(400, 300), 2.0)
    process_events()
    assert point_in_circle(point_at(400, 300), sprite_collision_circle(test_sprite)) is True
    free_sprite(test_sprite)
    free_bitmap(test_bitmap)
    close_window(test_window)


def test_SpriteName_integration():
    test_window = open_window("Test Window", 800, 600)
    test_bitmap = create_bitmap("test_bitmap", 100, 100)
    test_sprite = create_sprite(test_bitmap)
    assert sprite_name(test_sprite) == "test_sprite"
    free_sprite(test_sprite)
    free_bitmap(test_bitmap)
    close_window(test_window)


def test_SpriteNamed_integration():
    test_window = open_window("Test Window", 800, 600)
    test_bitmap = create_bitmap("test_bitmap", 100, 100)
    test_sprite = create_sprite(test_bitmap)
    named_sprite = sprite_named("test_sprite")
    assert named_sprite is not None
    free_sprite(test_sprite)
    free_bitmap(test_bitmap)
    close_window(test_window)


def test_SpriteOffscreen_integration():
    test_window = open_window("Test Window", 800, 600)
    test_bitmap = create_bitmap("test_bitmap", 100, 100)
    test_sprite = create_sprite(test_bitmap)
    sprite_set_position(test_sprite, point_at(0, 0))
    assert sprite_offscreen(test_sprite) is False
    sprite_set_position(test_sprite, point_at(-100, -100))
    assert sprite_offscreen(test_sprite) is True
    free_sprite(test_sprite)
    free_bitmap(test_bitmap)
    close_window(test_window)


def test_SpriteOnScreenAtPoint_integration():
    test_window = open_window("Test Window", 800, 600)
    test_bitmap = create_bitmap("test_bitmap", 100, 100)
    test_sprite = create_sprite(test_bitmap)
    sprite_set_position(test_sprite, point_at(100, 100))
    draw_sprite(test_sprite)
    refresh_screen()
    assert sprite_on_screen_at_point(test_sprite, point_at(100, 100)) is True
    assert sprite_on_screen_at_point(test_sprite, point_at(1000, 1000)) is False
    free_sprite(test_sprite)
    free_bitmap(test_bitmap)
    close_window(test_window)


def test_SpriteOnScreenAt_integration():
    test_window = open_window("Test Window", 800, 600)
    test_bitmap = create_bitmap("test_bitmap", 100, 100)
    test_sprite = create_sprite(test_bitmap)
    sprite_set_position(test_sprite, point_at(100, 100))
    assert sprite_on_screen_at(test_sprite, 100, 100) is True
    assert sprite_on_screen_at(test_sprite, 1000, 1000) is False
    free_sprite(test_sprite)
    free_bitmap(test_bitmap)
    close_window(test_window)


def test_SpritePosition_integration():
    test_window = open_window("Test Window", 800, 600)
    test_bitmap = create_bitmap("test_bitmap", 100, 100)
    test_sprite = create_sprite(test_bitmap)
    sprite_set_position(test_sprite, point_at(100.0, 100.0))
    test_position = sprite_position(test_sprite)
    assert test_position.x == 100.0
    assert test_position.y == 100.0
    free_sprite(test_sprite)
    free_bitmap(test_bitmap)
    close_window(test_window)


def test_SpriteReplayAnimation_integration():
    test_window = open_window("Test Window", 800, 600)
    test_bitmap = create_bitmap("test_bitmap", 100, 100)
    test_sprite = create_sprite(test_bitmap)
    sprite_start_animation(test_sprite, 0)
    sprite_replay_animation(test_sprite)
    assert sprite_animation_has_ended(test_sprite) is True
    free_sprite(test_sprite)
    free_bitmap(test_bitmap)
    close_window(test_window)


def test_SpriteReplayAnimationWithSound_integration():
    test_window = open_window("Test Window", 800, 600)
    test_bitmap = create_bitmap("test_bitmap", 100, 100)
    test_sprite = create_sprite(test_bitmap)
    sprite_replay_animation_with_sound(test_sprite, true)
    free_sprite(test_sprite)
    free_bitmap(test_bitmap)
    close_window(test_window)


def test_SpriteRotation_integration():
    test_window = open_window("Test Window", 800, 600)
    test_bitmap = create_bitmap("test_bitmap", 100, 100)
    test_sprite = create_sprite(test_bitmap)
    sprite_set_rotation(test_sprite, 45.0)
    assert sprite_rotation(test_sprite) == 45.0
    free_sprite(test_sprite)
    free_bitmap(test_bitmap)
    close_window(test_window)


def test_SpriteScale_integration():
    test_window = open_window("Test Window", 800, 600)
    test_bitmap = create_bitmap("test_bitmap", 100, 100)
    test_sprite = create_sprite(test_bitmap)
    sprite_set_scale(test_sprite, 2.0)
    assert sprite_scale(test_sprite) == 2.0
    free_sprite(test_sprite)
    free_bitmap(test_bitmap)
    close_window(test_window)


def test_SpriteScreenRectangle_integration():
    test_window = open_window("Test Window", 800, 600)
    test_bitmap = create_bitmap("test_bitmap", 100, 100)
    test_sprite = create_sprite(test_bitmap)
    sprite_set_position(test_sprite, point_at(100, 100))
    test_rectangle = sprite_screen_rectangle(test_sprite)
    assert rectangle_left(test_rectangle) == 100
    assert rectangle_top(test_rectangle) == 100
    free_sprite(test_sprite)
    free_bitmap(test_bitmap)
    close_window(test_window)


def test_SpriteSendLayerBackward_integration():
    test_window = open_window("Test Window", 800, 600)
    test_bitmap = create_bitmap("test_bitmap", 100, 100)
    test_sprite = create_sprite(test_bitmap)
    layer_index = sprite_add_layer(test_sprite, test_bitmap, "layer2")
    sprite_send_layer_backward(test_sprite, layer_index)
    assert sprite_visible_index_of_layer(test_sprite, layer_index) < 1
    free_sprite(test_sprite)
    free_bitmap(test_bitmap)
    close_window(test_window)


def test_SpriteSendLayerToBack_integration():
    test_window = open_window("Test Window", 800, 600)
    test_bitmap = create_bitmap("test_bitmap", 100, 100)
    test_sprite = create_sprite(test_bitmap)
    layer_index = sprite_add_layer(test_sprite, test_bitmap, "layer2")
    sprite_send_layer_to_back(test_sprite, layer_index)
    assert sprite_visible_index_of_layer(test_sprite, layer_index) == 0
    free_sprite(test_sprite)
    free_bitmap(test_bitmap)
    close_window(test_window)


def test_SpriteSetAnchorPoint_integration():
    test_window = open_window("Test Window", 800, 600)
    test_bitmap = create_bitmap("test_bitmap", 100, 100)
    test_sprite = create_sprite(test_bitmap)
    sprite_set_anchor_point(test_sprite, point_at(50, 50))
    test_anchor_point = sprite_anchor_point(test_sprite)
    assert test_anchor_point.x == 50
    assert test_anchor_point.y == 50
    free_sprite(test_sprite)
    free_bitmap(test_bitmap)
    close_window(test_window)


def test_SpriteSetCollisionBitmap_integration():
    test_window = open_window("Test Window", 800, 600)
    test_bitmap = create_bitmap("test_bitmap", 100, 100)
    test_sprite = create_sprite(test_bitmap)
    sprite_set_collision_bitmap(test_sprite, test_bitmap)
    assert sprite_collision_bitmap(test_sprite) == test_bitmap
    free_sprite(test_sprite)
    free_bitmap(test_bitmap)
    close_window(test_window)


def test_SpriteSetCollisionKind_integration():
    test_window = open_window("Test Window", 800, 600)
    test_bitmap = create_bitmap("test_bitmap", 100, 100)
    test_sprite = create_sprite(test_bitmap)
    sprite_set_collision_kind(test_sprite, CollisionTestKind.PixelCollisions)
    assert sprite_collision_kind(test_sprite) == CollisionTestKind.PixelCollisions
    free_sprite(test_sprite)
    free_bitmap(test_bitmap)
    close_window(test_window)


def test_SpriteSetDx_integration():
    test_window = open_window("Test Window", 800, 600)
    test_bitmap = create_bitmap("test_bitmap", 100, 100)
    test_sprite = create_sprite(test_bitmap)
    sprite_set_dx(test_sprite, 5.0)
    assert sprite_dx(test_sprite) == 5.0
    free_sprite(test_sprite)
    free_bitmap(test_bitmap)
    close_window(test_window)


def test_SpriteSetDy_integration():
    test_window = open_window("Test Window", 800, 600)
    test_bitmap = create_bitmap("test_bitmap", 100, 100)
    test_sprite = create_sprite(test_bitmap)
    sprite_set_dy(test_sprite, 5.0)
    assert sprite_dy(test_sprite) == 5.0
    free_sprite(test_sprite)
    free_bitmap(test_bitmap)
    close_window(test_window)


def test_SpriteSetHeading_integration():
    test_window = open_window("Test Window", 800, 600)
    test_bitmap = create_bitmap("test_bitmap", 100, 100)
    test_sprite = create_sprite(test_bitmap)
    sprite_set_heading(test_sprite, 45.0)
    assert sprite_heading(test_sprite) == 45.0
    free_sprite(test_sprite)
    free_bitmap(test_bitmap)
    close_window(test_window)


def test_SpriteSetLayerOffsetNamed_integration():
    test_window = open_window("Test Window", 800, 600)
    test_bitmap = create_bitmap("test_bitmap", 100, 100)
    test_sprite = create_sprite(test_bitmap)
    sprite_set_layer_offset_named(test_sprite, "layer1", vector_to(10.0, 10.0))
    test_offset = sprite_layer_offset_named(test_sprite, "layer1")
    assert test_offset.x == 10.0
    assert test_offset.y == 10.0
    free_sprite(test_sprite)
    free_bitmap(test_bitmap)
    close_window(test_window)


def test_SpriteSetLayerOffsetAtIndex_integration():
    test_window = open_window("Test Window", 800, 600)
    test_bitmap = create_bitmap("test_bitmap", 100, 100)
    test_sprite = create_sprite(test_bitmap)
    sprite_set_layer_offset_at_index(test_sprite, 0, vector_to(10.0, 10.0))
    assert sprite_layer_offset(test_sprite, 0) == vector_to(10.0, 10.0)
    free_sprite(test_sprite)
    free_bitmap(test_bitmap)
    close_window(test_window)


def test_SpriteSetMass_integration():
    test_window = open_window("Test Window", 800, 600)
    test_bitmap = create_bitmap("test_bitmap", 100, 100)
    test_sprite = create_sprite(test_bitmap)
    sprite_set_mass(test_sprite, 10.0)
    assert sprite_mass(test_sprite) == 10.0
    free_sprite(test_sprite)
    free_bitmap(test_bitmap)
    close_window(test_window)


def test_SpriteSetMoveFromAnchorPoint_integration():
    test_window = open_window("Test Window", 800, 600)
    test_bitmap = create_bitmap("test_bitmap", 100, 100)
    test_sprite = create_sprite(test_bitmap)
    sprite_set_move_from_anchor_point(test_sprite, true)
    assert sprite_move_from_anchor_point(test_sprite) is True
    sprite_set_move_from_anchor_point(test_sprite, false)
    assert sprite_move_from_anchor_point(test_sprite) is False
    free_sprite(test_sprite)
    free_bitmap(test_bitmap)
    close_window(test_window)


def test_SpriteSetPosition_integration():
    test_window = open_window("Test Window", 800, 600)
    test_bitmap = create_bitmap("test_bitmap", 100, 100)
    test_sprite = create_sprite(test_bitmap)
    sprite_set_position(test_sprite, point_at(100, 100))
    assert sprite_x(test_sprite) == 100
    assert sprite_y(test_sprite) == 100
    free_sprite(test_sprite)
    free_bitmap(test_bitmap)
    close_window(test_window)


def test_SpriteSetRotation_integration():
    test_window = open_window("Test Window", 800, 600)
    test_bitmap = create_bitmap("test_bitmap", 100, 100)
    test_sprite = create_sprite(test_bitmap)
    sprite_set_rotation(test_sprite, 45.0)
    assert sprite_rotation(test_sprite) == 45.0
    free_sprite(test_sprite)
    free_bitmap(test_bitmap)
    close_window(test_window)


def test_SpriteSetScale_integration():
    test_window = open_window("Test Window", 800, 600)
    test_bitmap = create_bitmap("test_bitmap", 100, 100)
    test_sprite = create_sprite(test_bitmap)
    sprite_set_scale(test_sprite, 2.0)
    assert sprite_scale(test_sprite) == 2.0
    free_sprite(test_sprite)
    free_bitmap(test_bitmap)
    close_window(test_window)


def test_SpriteSetSpeed_integration():
    test_window = open_window("Test Window", 800, 600)
    test_bitmap = create_bitmap("test_bitmap", 100, 100)
    test_sprite = create_sprite(test_bitmap)
    sprite_set_speed(test_sprite, 5.0)
    assert sprite_speed(test_sprite) == 5.0
    free_sprite(test_sprite)
    free_bitmap(test_bitmap)
    close_window(test_window)


def test_SpriteSetValueNamed_integration():
    test_window = open_window("Test Window", 800, 600)
    test_bitmap = create_bitmap("test_bitmap", 100, 100)
    test_sprite = create_sprite(test_bitmap)
    sprite_add_value(test_sprite, "test_value")
    sprite_set_value_named(test_sprite, "test_value", 10.5)
    assert sprite_value(test_sprite, "test_value") == 10.5
    free_sprite(test_sprite)
    free_bitmap(test_bitmap)
    close_window(test_window)


def test_SpriteSetVelocity_integration():
    test_window = open_window("Test Window", 800, 600)
    test_bitmap = create_bitmap("test_bitmap", 100, 100)
    test_sprite = create_sprite(test_bitmap)
    sprite_set_velocity(test_sprite, vector_to(5.0, 5.0))
    update_sprite(test_sprite)
    assert sprite_at(test_sprite, point_at(5.0, 5.0)) is True
    free_sprite(test_sprite)
    free_bitmap(test_bitmap)
    close_window(test_window)


def test_SpriteSetX_integration():
    test_window = open_window("Test Window", 800, 600)
    test_bitmap = create_bitmap("test_bitmap", 100, 100)
    test_sprite = create_sprite(test_bitmap)
    sprite_set_x(test_sprite, 150.0)
    assert sprite_x(test_sprite) == 150.0
    free_sprite(test_sprite)
    free_bitmap(test_bitmap)
    close_window(test_window)


def test_SpriteSetY_integration():
    test_window = open_window("Test Window", 800, 600)
    test_bitmap = create_bitmap("test_bitmap", 100, 100)
    test_sprite = create_sprite(test_bitmap)
    sprite_set_y(test_sprite, 300.0)
    assert sprite_y(test_sprite) == 300.0
    free_sprite(test_sprite)
    free_bitmap(test_bitmap)
    close_window(test_window)


def test_SpriteShowLayerNamed_integration():
    test_window = open_window("Test Window", 800, 600)
    test_bitmap = create_bitmap("test_bitmap", 100, 100)
    test_sprite = create_sprite(test_bitmap)
    layer_index = sprite_add_layer(test_sprite, test_bitmap, "layer2")
    result = sprite_show_layer_named(test_sprite, "layer2")
    assert result == 1
    free_sprite(test_sprite)
    free_bitmap(test_bitmap)
    close_window(test_window)


def test_SpriteShowLayer_integration():
    test_window = open_window("Test Window", 800, 600)
    test_bitmap = create_bitmap("test_bitmap", 100, 100)
    test_sprite = create_sprite(test_bitmap)
    layer_index = sprite_add_layer(test_sprite, test_bitmap, "layer2")
    sprite_hide_layer(test_sprite, 1)
    result = sprite_show_layer(test_sprite, 1)
    assert result == 1
    free_sprite(test_sprite)
    free_bitmap(test_bitmap)
    close_window(test_window)


def test_SpriteSpeed_integration():
    test_window = open_window("Test Window", 800, 600)
    test_bitmap = create_bitmap("test_bitmap", 100, 100)
    test_sprite = create_sprite(test_bitmap)
    sprite_set_velocity(test_sprite, vector_to(5.0, 5.0))
    test_speed = sprite_speed(test_sprite)
    assert test_speed == 7.0710678118654755
    free_sprite(test_sprite)
    free_bitmap(test_bitmap)
    close_window(test_window)


def test_SpriteStartAnimationNamed_integration():
    test_window = open_window("Test Window", 800, 600)
    test_bitmap = create_bitmap("test_bitmap", 100, 100)
    test_sprite = create_sprite(test_bitmap)
    sprite_start_animation_named(test_sprite, "test_animation")
    assert sprite_animation_name(test_sprite) is True
    free_sprite(test_sprite)
    free_bitmap(test_bitmap)
    close_window(test_window)


def test_SpriteStartAnimationNamedWithSound_integration():
    test_window = open_window("Test Window", 800, 600)
    test_bitmap = create_bitmap("test_bitmap", 100, 100)
    test_sprite = create_sprite(test_bitmap)
    sprite_start_animation_named_with_sound(test_sprite, "test_animation", true)
    update_sprite(test_sprite)
    assert sprite_animation_has_ended(test_sprite) is True
    free_sprite(test_sprite)
    free_bitmap(test_bitmap)
    close_window(test_window)


def test_SpriteStartAnimation_integration():
    test_window = open_window("Test Window", 800, 600)
    test_bitmap = create_bitmap("test_bitmap", 100, 100)
    test_sprite = create_sprite(test_bitmap)
    sprite_start_animation(test_sprite, 0)
    update_sprite(test_sprite)
    assert sprite_animation_has_ended(test_sprite) is True
    free_sprite(test_sprite)
    free_bitmap(test_bitmap)
    close_window(test_window)


def test_SpriteStartAnimationWithSound_integration():
    test_window = open_window("Test Window", 800, 600)
    test_bitmap = create_bitmap("test_bitmap", 100, 100)
    test_sprite = create_sprite(test_bitmap)
    sprite_start_animation_with_sound(test_sprite, 0, true)
    update_sprite(test_sprite)
    assert sprite_animation_has_ended(test_sprite) is True
    free_sprite(test_sprite)
    free_bitmap(test_bitmap)
    close_window(test_window)


def test_SpriteStopCallingOnEvent_integration():
    test_window = open_window("Test Window", 800, 600)
    test_bitmap = create_bitmap("test_bitmap", 100, 100)
    test_sprite = create_sprite(test_bitmap)
    sprite_call_on_event(test_sprite, _on_sprite_event())
    process_events()
    simulate_sprite_event(test_sprite)
    process_events()
    assert _on_sprite_event_called() is True
    sprite_stop_calling_on_event(test_sprite, _on_sprite_event())
    process_events()
    simulate_sprite_event(test_sprite)
    process_events()
    assert _on_sprite_event_called() is False
    free_sprite(test_sprite)
    free_bitmap(test_bitmap)
    close_window(test_window)


def test_SpriteToggleLayerVisibleNamed_integration():
    test_window = open_window("Test Window", 800, 600)
    test_bitmap = create_bitmap("test_bitmap", 100, 100)
    test_sprite = create_sprite(test_bitmap)
    sprite_add_layer(test_sprite, test_bitmap, "layer2")
    sprite_toggle_layer_visible_named(test_sprite, "layer2")
    assert sprite_visible_layer_count(test_sprite) is False
    sprite_toggle_layer_visible_named(test_sprite, "layer2")
    assert sprite_visible_layer_count(test_sprite) == 2
    free_sprite(test_sprite)
    free_bitmap(test_bitmap)
    close_window(test_window)


def test_SpriteToggleLayerVisible_integration():
    test_window = open_window("Test Window", 800, 600)
    test_bitmap = create_bitmap("test_bitmap", 100, 100)
    test_sprite = create_sprite(test_bitmap)
    layer_index = sprite_add_layer(test_sprite, test_bitmap, "layer2")
    sprite_hide_layer(test_sprite, layer_index)
    sprite_toggle_layer_visible(test_sprite, layer_index)
    assert sprite_visible_layer_count(test_sprite) is True
    free_sprite(test_sprite)
    free_bitmap(test_bitmap)
    close_window(test_window)


def test_SpriteValue_integration():
    test_window = open_window("Test Window", 800, 600)
    test_bitmap = create_bitmap("test_bitmap", 100, 100)
    test_sprite = create_sprite(test_bitmap)
    sprite_add_value(test_sprite, "test_value", 10.0)
    sprite_value_result = sprite_value(test_sprite, "test_value")
    assert sprite_value_result == 10.0
    free_sprite(test_sprite)
    free_bitmap(test_bitmap)
    close_window(test_window)


def test_SpriteValueCount_integration():
    test_window = open_window("Test Window", 800, 600)
    test_bitmap = create_bitmap("test_bitmap", 100, 100)
    test_sprite = create_sprite(test_bitmap)
    sprite_add_value(test_sprite, "health")
    sprite_add_value(test_sprite, "speed")
    assert sprite_value_count(test_sprite) == 2
    free_sprite(test_sprite)
    free_bitmap(test_bitmap)
    close_window(test_window)


def test_SpriteVelocity_integration():
    test_window = open_window("Test Window", 800, 600)
    test_bitmap = create_bitmap("test_bitmap", 100, 100)
    test_sprite = create_sprite(test_bitmap)
    sprite_set_velocity(test_sprite, vector_to(5.0, 5.0))
    test_velocity = sprite_velocity(test_sprite)
    assert test_velocity.x == 5.0
    assert test_velocity.y == 5.0
    free_all_sprites()
    free_bitmap(test_bitmap)
    close_window(test_window)


def test_SpriteVisibleIndexOfLayerNamed_integration():
    test_window = open_window("Test Window", 800, 600)
    test_bitmap = create_bitmap("test_bitmap", 100, 100)
    test_sprite = create_sprite(test_bitmap)
    sprite_add_layer(test_sprite, test_bitmap, "layer2")
    layer_index = sprite_visible_index_of_layer_named(test_sprite, "layer2")
    assert layer_index == 1
    free_sprite(test_sprite)
    free_bitmap(test_bitmap)
    close_window(test_window)


def test_SpriteVisibleIndexOfLayer_integration():
    test_window = open_window("Test Window", 800, 600)
    test_bitmap = create_bitmap("test_bitmap", 100, 100)
    test_sprite = create_sprite(test_bitmap)
    layer_index = sprite_add_layer(test_sprite, test_bitmap, "layer2")
    sprite_show_layer(test_sprite, layer_index)
    assert sprite_visible_index_of_layer(test_sprite, layer_index) == 1
    free_sprite(test_sprite)
    free_bitmap(test_bitmap)
    close_window(test_window)


def test_SpriteVisibleLayer_integration():
    test_window = open_window("Test Window", 800, 600)
    test_bitmap = create_bitmap("test_bitmap", 100, 100)
    test_sprite = create_sprite(test_bitmap)
    sprite_add_layer(test_sprite, test_bitmap, "layer2")
    sprite_show_layer(test_sprite, "layer2")
    assert sprite_visible_layer(test_sprite, 1) == 1
    free_sprite(test_sprite)
    free_bitmap(test_bitmap)
    close_window(test_window)


def test_SpriteVisibleLayerCount_integration():
    test_window = open_window("Test Window", 800, 600)
    test_bitmap = create_bitmap("test_bitmap", 100, 100)
    test_sprite = create_sprite(test_bitmap)
    assert sprite_visible_layer_count(test_sprite) == 1
    sprite_add_layer(test_sprite, test_bitmap, "layer2")
    sprite_show_layer(test_sprite, "layer2")
    assert sprite_visible_layer_count(test_sprite) == 2
    free_sprite(test_sprite)
    free_bitmap(test_bitmap)
    close_window(test_window)


def test_SpriteVisibleLayerId_integration():
    test_window = open_window("Test Window", 800, 600)
    test_bitmap = create_bitmap("test_bitmap", 100, 100)
    test_sprite = create_sprite(test_bitmap)
    sprite_add_layer(test_sprite, test_bitmap, "layer2")
    sprite_show_layer(test_sprite, "layer2")
    assert sprite_visible_layer_id(test_sprite, 1) == 1
    free_sprite(test_sprite)
    free_bitmap(test_bitmap)
    close_window(test_window)


def test_SpriteWidth_integration():
    test_window = open_window("Test Window", 800, 600)
    test_bitmap = create_bitmap("test_bitmap", 100, 100)
    test_sprite = create_sprite(test_bitmap)
    assert sprite_width(test_sprite) == 100
    free_sprite(test_sprite)
    free_bitmap(test_bitmap)
    close_window(test_window)


def test_SpriteX_integration():
    test_window = open_window("Test Window", 800, 600)
    test_bitmap = create_bitmap("test_bitmap", 100, 100)
    test_sprite = create_sprite(test_bitmap)
    sprite_set_x(test_sprite, 150.0)
    assert sprite_x(test_sprite) == 150.0
    free_sprite(test_sprite)
    free_bitmap(test_bitmap)
    close_window(test_window)


def test_SpriteY_integration():
    test_window = open_window("Test Window", 800, 600)
    test_bitmap = create_bitmap("test_bitmap", 100, 100)
    test_sprite = create_sprite(test_bitmap)
    sprite_set_y(test_sprite, 200.0)
    assert sprite_y(test_sprite) == 200.0
    free_sprite(test_sprite)
    free_bitmap(test_bitmap)
    close_window(test_window)


def test_StopCallingOnSpriteEvent_integration():
    test_window = open_window("Test Window", 800, 600)
    test_bitmap = create_bitmap("test_bitmap", 100, 100)
    test_sprite = create_sprite(test_bitmap)
    call_on_sprite_event(_on_sprite_event())
    process_events()
    simulate_sprite_event(test_sprite)
    process_events()
    assert sprite_event_occurred(test_sprite) is True
    stop_calling_on_sprite_event(_on_sprite_event())
    process_events()
    simulate_sprite_event(test_sprite)
    process_events()
    assert sprite_event_occurred(test_sprite) is False
    free_sprite(test_sprite)
    free_bitmap(test_bitmap)
    close_window(test_window)


def test_UpdateAllSprites_integration():
    test_window = open_window("Test Window", 800, 600)
    test_bitmap = create_bitmap("test_bitmap", 100, 100)
    test_sprite1 = create_sprite(test_bitmap)
    test_sprite2 = create_sprite(test_bitmap)
    sprite_set_position(test_sprite1, point_at(100, 100))
    sprite_set_position(test_sprite2, point_at(200, 200))
    sprite_set_velocity(test_sprite1, vector_to(1, 1))
    sprite_set_velocity(test_sprite2, vector_to(-1, -1))
    update_all_sprites()
    assert sprite_position(test_sprite1) != point_at(100, 100)
    assert sprite_position(test_sprite2) != point_at(200, 200)
    free_all_sprites()
    close_window(test_window)


def test_UpdateAllSpritesPercent_integration():
    test_window = open_window("Test Window", 800, 600)
    test_bitmap = create_bitmap("test_bitmap", 100, 100)
    test_sprite1 = create_sprite(test_bitmap)
    test_sprite2 = create_sprite(test_bitmap)
    sprite_set_velocity(test_sprite1, vector_to(1.0, 1.0))
    sprite_set_velocity(test_sprite2, vector_to(-1.0, -1.0))
    update_all_sprites_percent(0.5)
    assert sprite_at(test_sprite1, point_at(50.0, 50.0)) is True
    assert sprite_at(test_sprite2, point_at(50.0, 50.0)) is True
    free_all_sprites()
    free_bitmap(test_bitmap)
    close_window(test_window)


def test_UpdateSprite_integration():
    test_window = open_window("Test Window", 800, 600)
    test_bitmap = create_bitmap("test_bitmap", 100, 100)
    test_sprite = create_sprite(test_bitmap)
    sprite_set_velocity(test_sprite, vector_to(1.0, 1.0))
    update_sprite(test_sprite)
    assert sprite_x(test_sprite) != 0.0
    assert sprite_y(test_sprite) != 0.0
    free_sprite(test_sprite)
    free_bitmap(test_bitmap)
    close_window(test_window)


def test_UpdateSpriteWithSound_integration():
    test_window = open_window("Test Window", 800, 600)
    test_bitmap = create_bitmap("test_bitmap", 100, 100)
    test_sprite = create_sprite(test_bitmap)
    sprite_set_velocity(test_sprite, vector_to(1.0, 1.0))
    sprite_start_animation(test_sprite, 0, true)
    update_sprite_with_sound(test_sprite, true)
    assert sprite_x(test_sprite) != 0.0
    assert sprite_y(test_sprite) != 0.0
    free_sprite(test_sprite)
    free_bitmap(test_bitmap)
    close_window(test_window)


def test_UpdateSpritePercent_integration():
    test_window = open_window("Test Window", 800, 600)
    test_bitmap = create_bitmap("test_bitmap", 100, 100)
    test_sprite = create_sprite(test_bitmap)
    sprite_set_position(test_sprite, point_at(100.0, 100.0))
    sprite_set_velocity(test_sprite, vector_to(1.0, 1.0))
    update_sprite_percent(test_sprite, 0.5)
    assert point_in_circle(point_at(100.5, 100.5), sprite_collision_circle(test_sprite)) is True
    free_sprite(test_sprite)
    free_bitmap(test_bitmap)
    close_window(test_window)


def test_UpdateSpritePercentWithSound_integration():
    test_window = open_window("Test Window", 800, 600)
    test_bitmap = create_bitmap("test_bitmap", 100, 100)
    test_sprite = create_sprite(test_bitmap)
    sprite_set_position(test_sprite, point_at(400, 300))
    update_sprite_percent_with_sound(test_sprite, 0.5, true)
    free_sprite(test_sprite)
    free_bitmap(test_bitmap)
    close_window(test_window)


def test_UpdateSpriteAnimation_integration():
    test_window = open_window("Test Window", 800, 600)
    test_bitmap = create_bitmap("test_bitmap", 100, 100)
    test_sprite = create_sprite(test_bitmap)
    sprite_start_animation(test_sprite, 0)
    update_sprite_animation(test_sprite)
    assert sprite_current_cell(test_sprite) > 0
    free_sprite(test_sprite)
    free_bitmap(test_bitmap)
    close_window(test_window)


def test_UpdateSpriteAnimationWithSound_integration():
    test_window = open_window("Test Window", 800, 600)
    test_bitmap = create_bitmap("test_bitmap", 100, 100)
    test_sprite = create_sprite(test_bitmap)
    update_sprite_animation_with_sound(test_sprite, true)
    assert sprite_animation_has_ended(test_sprite) is True
    free_sprite(test_sprite)
    free_bitmap(test_bitmap)
    close_window(test_window)


def test_UpdateSpriteAnimationPercent_integration():
    test_window = open_window("Test Window", 800, 600)
    test_bitmap = create_bitmap("test_bitmap", 100, 100)
    test_sprite = create_sprite(test_bitmap)
    update_sprite_animation_percent(test_sprite, 0.5)
    free_sprite(test_sprite)
    free_bitmap(test_bitmap)
    close_window(test_window)


def test_UpdateSpriteAnimationPercentWithSound_integration():
    test_window = open_window("Test Window", 800, 600)
    test_bitmap = create_bitmap("test_bitmap", 100, 100)
    test_sprite = create_sprite(test_bitmap)
    update_sprite_animation_percent_with_sound(test_sprite, 0.5, true)
    free_sprite(test_sprite)
    free_bitmap(test_bitmap)
    close_window(test_window)


def test_VectorFromCenterSpriteToPointPoint_integration():
    test_window = open_window("Test Window", 800, 600)
    test_bitmap = create_bitmap("test_bitmap", 100, 100)
    test_sprite = create_sprite(test_bitmap)
    sprite_set_position(test_sprite, point_at(400, 300))
    test_vector = vector_from_center_sprite_to_point_point(test_sprite, point_at(500, 400))
    assert test_vector.x == 100
    assert test_vector.y == 100
    free_sprite(test_sprite)
    free_bitmap(test_bitmap)
    close_window(test_window)


def test_VectorFromTo_integration():
    test_window = open_window("Test Window", 800, 600)
    test_bitmap = create_bitmap("test_bitmap", 100, 100)
    test_sprite1 = create_sprite(test_bitmap)
    test_sprite2 = create_sprite(test_bitmap)
    sprite_set_position(test_sprite1, point_at(100, 100))
    sprite_set_position(test_sprite2, point_at(200, 200))
    test_vector = vector_from_to(test_sprite1, test_sprite2)
    assert test_vector.x == 100
    assert test_vector.y == 100
    free_all_sprites()
    close_window(test_window)

