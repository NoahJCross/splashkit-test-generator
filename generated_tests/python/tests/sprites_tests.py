import pytest
from splashkit import *


def test_CallForAllSpritesWithValue_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_bitmap = CreateBitmap("test_bitmap", 100, 100)
    test_sprite1 = CreateSprite(test_bitmap)
    test_sprite2 = CreateSprite(test_bitmap)
    SpriteSetX(test_sprite1, 100)
    SpriteSetX(test_sprite2, 200)
    CallForAllSpritesWithValue(SpriteSetX(test_sprite1, 300), 300)
    assert SpriteX(test_sprite1) == 300
    assert SpriteX(test_sprite2) == 300
    FreeAllSprites()
    FreeBitmap(test_bitmap)
    CloseWindow(test_window)


def test_CallForAllSprites_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_bitmap = CreateBitmap("test_bitmap", 100, 100)
    test_sprite_1 = CreateSprite(test_bitmap)
    test_sprite_2 = CreateSprite(test_bitmap)
    SpriteSetX(test_sprite_1, 100)
    SpriteSetY(test_sprite_1, 100)
    SpriteSetX(test_sprite_2, 200)
    SpriteSetY(test_sprite_2, 200)
    CallForAllSprites(TestSpriteFunction())
    assert SpriteAt(test_sprite_1, PointAt(100, 100)) is True
    assert SpriteAt(test_sprite_2, PointAt(200, 200)) is True
    FreeAllSprites()
    FreeBitmap(test_bitmap)
    CloseWindow(test_window)


def test_CallOnSpriteEvent_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_bitmap = CreateBitmap("test_bitmap", 100, 100)
    test_sprite = CreateSprite(test_bitmap)
    CallOnSpriteEvent(OnSpriteEvent())
    ProcessEvents()
    SimulateMouseClick(Mousebutton.Left)
    ProcessEvents()
    assert MouseClicked(Mousebutton.Left) is True
    FreeSprite(test_sprite)
    FreeBitmap(test_bitmap)
    CloseWindow(test_window)


def test_CenterPoint_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_bitmap = CreateBitmap("test_bitmap", 100, 100)
    test_sprite = CreateSprite(test_bitmap)
    SpriteSetPosition(test_sprite, PointAt(100, 100))
    test_center_point = CenterPoint(test_sprite)
    assert test_center_point.x == 150
    assert test_center_point.y == 150
    FreeSprite(test_sprite)
    FreeBitmap(test_bitmap)
    CloseWindow(test_window)


def test_CreateSprite_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_bitmap = CreateBitmap("test_bitmap", 100, 100)
    test_sprite = CreateSprite(test_bitmap)
    assert test_sprite is not None
    FreeSprite(test_sprite)
    FreeBitmap(test_bitmap)
    CloseWindow(test_window)


def test_CreateSpriteWithAnimation_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_bitmap = CreateBitmap("test_bitmap", 100, 100)
    test_animation = LoadAnimationScript("test_animation", "kermit.txt")
    test_sprite = CreateSpriteWithAnimation(test_bitmap, test_animation)
    assert test_sprite is not None
    FreeSprite(test_sprite)
    FreeBitmap(test_bitmap)
    FreeAnimationScript(test_animation)
    CloseWindow(test_window)


def test_CreateSpriteWithBitmapNamed_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_bitmap = CreateBitmap("test_bitmap", 100, 100)
    test_sprite = CreateSpriteWithBitmapNamed("test_bitmap")
    assert test_sprite is not None
    FreeSprite(test_sprite)
    FreeBitmap(test_bitmap)
    CloseWindow(test_window)


def test_CreateSpriteNamed_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_bitmap = CreateBitmap("test_bitmap", 100, 100)
    test_sprite = CreateSpriteNamed("test_sprite", test_bitmap)
    assert test_sprite is not None
    FreeSprite(test_sprite)
    FreeBitmap(test_bitmap)
    CloseWindow(test_window)


def test_CreateSpriteNamedWithAnimation_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_bitmap = CreateBitmap("test_bitmap", 100, 100)
    test_animation = LoadAnimationScript("test_animation", "kermit.txt")
    test_sprite = CreateSpriteNamedWithAnimation("test_sprite", test_bitmap, test_animation)
    assert test_sprite is not None
    FreeSprite(test_sprite)
    FreeBitmap(test_bitmap)
    FreeAnimationScript(test_animation)
    CloseWindow(test_window)


def test_CreateSpriteWithBitmapAndAnimationNamed_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_bitmap = CreateBitmap("test_bitmap", 100, 100)
    test_sprite = CreateSpriteWithBitmapAndAnimationNamed("test_bitmap", "test_animation")
    assert test_sprite is not None
    FreeSprite(test_sprite)
    FreeBitmap(test_bitmap)
    CloseWindow(test_window)


def test_CreateSpritePack_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    CreateSpritePack("test_pack")
    assert HasSpritePack("test_pack") is True
    FreeSpritePack("test_pack")
    CloseWindow(test_window)


def test_CurrentSpritePack_integration():
    CreateSpritePack("test_pack")
    SelectSpritePack("test_pack")
    current_pack = CurrentSpritePack()
    assert current_pack == "test_pack"
    FreeSpritePack("test_pack")


def test_DrawAllSprites_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_bitmap = CreateBitmap("test_bitmap", 100, 100)
    test_sprite1 = CreateSprite(test_bitmap)
    test_sprite2 = CreateSprite(test_bitmap)
    SpriteSetX(test_sprite1, 100)
    SpriteSetY(test_sprite1, 100)
    SpriteSetX(test_sprite2, 200)
    SpriteSetY(test_sprite2, 200)
    DrawAllSprites()
    RefreshScreen()
    assert GetPixel(100, 100) != ColorWhite()
    assert GetPixel(200, 200) != ColorWhite()
    FreeAllSprites()
    FreeBitmap(test_bitmap)
    CloseWindow(test_window)


def test_DrawSpriteOffsetBy_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_bitmap = CreateBitmap("test_bitmap", 100, 100)
    test_sprite = CreateSprite(test_bitmap)
    SpriteSetPosition(test_sprite, PointAt(400, 300))
    DrawSpriteOffsetBy(test_sprite, VectorTo(50, 50))
    RefreshScreen()
    assert GetPixel(PointAt(450, 350)) != ColorWhite()
    FreeSprite(test_sprite)
    FreeBitmap(test_bitmap)
    CloseWindow(test_window)


def test_DrawSprite_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_bitmap = CreateBitmap("test_bitmap", 100, 100)
    test_sprite = CreateSprite(test_bitmap)
    SpriteSetPosition(test_sprite, PointAt(400, 300))
    DrawSprite(test_sprite)
    RefreshScreen()
    assert SpriteOnScreenAt(test_sprite, PointAt(400, 300)) is True
    FreeSprite(test_sprite)
    FreeBitmap(test_bitmap)
    CloseWindow(test_window)


def test_DrawSpriteOffsetXY_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_bitmap = CreateBitmap("test_bitmap", 100, 100)
    test_sprite = CreateSprite(test_bitmap)
    SpriteSetPosition(test_sprite, PointAt(400, 300))
    DrawSpriteOffsetXY(test_sprite, 50, 50)
    RefreshScreen()
    assert PointInCircle(PointAt(450, 350), SpriteCollisionCircle(test_sprite)) is True
    FreeSprite(test_sprite)
    FreeBitmap(test_bitmap)
    CloseWindow(test_window)


def test_FreeAllSprites_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_bitmap = CreateBitmap("test_bitmap", 100, 100)
    test_sprite = CreateSprite(test_bitmap)
    FreeAllSprites()
    assert HasSprite("test_sprite") is False
    FreeBitmap(test_bitmap)
    CloseWindow(test_window)


def test_FreeSprite_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_bitmap = CreateBitmap("test_bitmap", 100, 100)
    test_sprite = CreateSprite(test_bitmap)
    FreeSprite(test_sprite)
    FreeBitmap(test_bitmap)
    CloseWindow(test_window)


def test_FreeSpritePack_integration():
    CreateSpritePack("test_pack")
    test_has_pack = HasSpritePack("test_pack")
    assert test_has_pack is True
    FreeSpritePack("test_pack")
    test_has_pack = HasSpritePack("test_pack")
    assert test_has_pack is False


def test_HasSprite_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_bitmap = CreateBitmap("test_bitmap", 100, 100)
    test_sprite = CreateSprite(test_bitmap)
    assert HasSprite("test_sprite") is True
    FreeSprite(test_sprite)
    FreeBitmap(test_bitmap)
    CloseWindow(test_window)


def test_HasSpritePack_integration():
    CreateSpritePack("test_pack")
    assert HasSpritePack("test_pack") is True
    assert HasSpritePack("non_existent_pack") is False
    FreeSpritePack("test_pack")


def test_MoveSprite_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_bitmap = CreateBitmap("test_bitmap", 100, 100)
    test_sprite = CreateSprite(test_bitmap)
    SpriteSetVelocity(test_sprite, VectorTo(10.0, 10.0))
    SpriteSetPosition(test_sprite, PointAt(100.0, 100.0))
    MoveSprite(test_sprite)
    ProcessEvents()
    assert SpritePosition(test_sprite) != PointAt(100.0, 100.0)
    FreeSprite(test_sprite)
    FreeBitmap(test_bitmap)
    CloseWindow(test_window)


def test_MoveSpriteByVector_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_bitmap = CreateBitmap("test_bitmap", 100, 100)
    test_sprite = CreateSprite(test_bitmap)
    SpriteSetPosition(test_sprite, PointAt(100, 100))
    MoveSpriteByVector(test_sprite, VectorTo(50, 50))
    ProcessEvents()
    assert SpriteX(test_sprite) == 150
    assert SpriteY(test_sprite) == 150
    FreeSprite(test_sprite)
    FreeBitmap(test_bitmap)
    CloseWindow(test_window)


def test_MoveSpriteByVectorPercent_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_bitmap = CreateBitmap("test_bitmap", 100, 100)
    test_sprite = CreateSprite(test_bitmap)
    SpriteSetPosition(test_sprite, PointAt(100.0, 100.0))
    MoveSpriteByVectorPercent(test_sprite, VectorTo(50.0, 50.0), 0.5)
    assert SpriteX(test_sprite) == 125.0
    assert SpriteY(test_sprite) == 125.0
    FreeSprite(test_sprite)
    FreeBitmap(test_bitmap)
    CloseWindow(test_window)


def test_MoveSpritePercent_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_bitmap = CreateBitmap("test_bitmap", 100, 100)
    test_sprite = CreateSprite(test_bitmap)
    SpriteSetPosition(test_sprite, PointAt(100.0, 100.0))
    SpriteSetVelocity(test_sprite, VectorTo(10.0, 10.0))
    MoveSpritePercent(test_sprite, 0.5)
    ProcessEvents()
    assert PointInCircle(PointAt(105.0, 105.0), SpriteCircle(test_sprite)) is True
    FreeSprite(test_sprite)
    FreeBitmap(test_bitmap)
    CloseWindow(test_window)


def test_MoveSpriteTo_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_bitmap = CreateBitmap("test_bitmap", 100, 100)
    test_sprite = CreateSprite(test_bitmap)
    MoveSpriteTo(test_sprite, 400.0, 300.0)
    assert SpriteX(test_sprite) == 400.0
    assert SpriteY(test_sprite) == 300.0
    FreeSprite(test_sprite)
    FreeBitmap(test_bitmap)
    CloseWindow(test_window)


def test_SelectSpritePack_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    CreateSpritePack("test_pack")
    test_sprite = CreateSprite("rocket_sprt.png")
    SelectSpritePack("test_pack")
    DrawAllSprites()
    assert SpriteOnScreenAt(test_sprite, PointAt(400, 300)) is True
    FreeAllSprites()
    FreeSpritePack("test_pack")
    CloseWindow(test_window)


def test_SpriteAddLayer_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_bitmap = CreateBitmap("test_bitmap", 100, 100)
    test_sprite = CreateSprite(test_bitmap)
    new_layer_bitmap = CreateBitmap("new_layer_bitmap", 50, 50)
    layer_index = SpriteAddLayer(test_sprite, new_layer_bitmap, "new_layer")
    assert layer_index > -1
    FreeSprite(test_sprite)
    FreeBitmap(test_bitmap)
    FreeBitmap(new_layer_bitmap)
    CloseWindow(test_window)


def test_SpriteAddToVelocity_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_bitmap = CreateBitmap("test_bitmap", 100, 100)
    test_sprite = CreateSprite(test_bitmap)
    SpriteSetPosition(test_sprite, PointAt(400, 300))
    SpriteAddToVelocity(test_sprite, VectorTo(10, 10))
    UpdateSprite(test_sprite)
    assert SpriteX(test_sprite) == 410
    assert SpriteY(test_sprite) == 310
    FreeSprite(test_sprite)
    FreeBitmap(test_bitmap)
    CloseWindow(test_window)


def test_SpriteAddValue_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_bitmap = CreateBitmap("test_bitmap", 100, 100)
    test_sprite = CreateSprite(test_bitmap)
    SpriteAddValue(test_sprite, "health")
    assert SpriteHasValue(test_sprite, "health") is True
    FreeSprite(test_sprite)
    FreeBitmap(test_bitmap)
    CloseWindow(test_window)


def test_SpriteAddValueWithDefault_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_bitmap = CreateBitmap("test_bitmap", 100, 100)
    test_sprite = CreateSprite(test_bitmap)
    SpriteAddValueWithDefault(test_sprite, "health", 100.0)
    assert SpriteHasValue(test_sprite, "health") is True
    assert SpriteValue(test_sprite, "health") == 100.0
    FreeSprite(test_sprite)
    FreeBitmap(test_bitmap)
    CloseWindow(test_window)


def test_SpriteAnchorPoint_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_bitmap = CreateBitmap("test_bitmap", 100, 100)
    test_sprite = CreateSprite(test_bitmap)
    test_anchor_point = SpriteAnchorPoint(test_sprite)
    assert test_anchor_point.x == 50
    assert test_anchor_point.y == 50
    FreeSprite(test_sprite)
    FreeBitmap(test_bitmap)
    CloseWindow(test_window)


def test_SpriteAnchorPosition_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_bitmap = CreateBitmap("test_bitmap", 100, 100)
    test_sprite = CreateSprite(test_bitmap)
    SpriteSetPosition(test_sprite, PointAt(100, 100))
    test_anchor_position = SpriteAnchorPosition(test_sprite)
    assert test_anchor_position.x == 100
    assert test_anchor_position.y == 100
    FreeSprite(test_sprite)
    FreeBitmap(test_bitmap)
    CloseWindow(test_window)


def test_SpriteAnimationHasEnded_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_bitmap = CreateBitmap("test_bitmap", 100, 100)
    test_sprite = CreateSprite(test_bitmap)
    SpriteStartAnimation(test_sprite, "default")
    UpdateSpriteAnimation(test_sprite)
    assert SpriteAnimationHasEnded(test_sprite) is False
    UpdateSpriteAnimation(test_sprite)
    assert SpriteAnimationHasEnded(test_sprite) is True
    FreeSprite(test_sprite)
    FreeBitmap(test_bitmap)
    CloseWindow(test_window)


def test_SpriteAnimationName_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_bitmap = CreateBitmap("test_bitmap", 100, 100)
    test_sprite = CreateSprite(test_bitmap)
    SpriteStartAnimation(test_sprite, "default")
    test_animation_name = SpriteAnimationName(test_sprite)
    assert test_animation_name == "default"
    FreeSprite(test_sprite)
    FreeBitmap(test_bitmap)
    CloseWindow(test_window)


def test_SpriteAt_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_bitmap = CreateBitmap("test_bitmap", 100, 100)
    test_sprite = CreateSprite(test_bitmap)
    SpriteSetPosition(test_sprite, PointAt(400, 300))
    ProcessEvents()
    assert SpriteAt(test_sprite, PointAt(400, 300)) is True
    assert SpriteAt(test_sprite, PointAt(500, 400)) is False
    FreeSprite(test_sprite)
    FreeBitmap(test_bitmap)
    CloseWindow(test_window)


def test_SpriteBringLayerForward_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_bitmap = CreateBitmap("test_bitmap", 100, 100)
    test_sprite = CreateSprite(test_bitmap)
    layer_index = SpriteAddLayer(test_sprite, test_bitmap, "layer2")
    initial_layer_position = SpriteVisibleIndexOfLayer(test_sprite, layer_index)
    SpriteBringLayerForward(test_sprite, layer_index)
    new_layer_position = SpriteVisibleIndexOfLayer(test_sprite, layer_index)
    assert new_layer_position > initial_layer_position
    FreeSprite(test_sprite)
    FreeBitmap(test_bitmap)
    CloseWindow(test_window)


def test_SpriteBringLayerToFront_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_bitmap = CreateBitmap("test_bitmap", 100, 100)
    test_sprite = CreateSprite(test_bitmap)
    layer_index = SpriteAddLayer(test_sprite, test_bitmap, "layer2")
    SpriteBringLayerToFront(test_sprite, layer_index)
    assert SpriteVisibleIndexOfLayer(test_sprite, layer_index) == SpriteVisibleLayerCount(test_sprite)
    FreeSprite(test_sprite)
    FreeBitmap(test_bitmap)
    CloseWindow(test_window)


def test_SpriteCallOnEvent_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_bitmap = CreateBitmap("test_bitmap", 100, 100)
    test_sprite = CreateSprite(test_bitmap)
    SpriteCallOnEvent(test_sprite, OnSpriteEvent())
    ProcessEvents()
    SimulateMouseClick(Mousebutton.Left)
    ProcessEvents()
    assert SpriteEventOccurred(test_sprite) is True
    FreeSprite(test_sprite)
    FreeBitmap(test_bitmap)
    CloseWindow(test_window)


def test_SpriteCircle_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_bitmap = CreateBitmap("test_bitmap", 100, 100)
    test_sprite = CreateSprite(test_bitmap)
    test_circle = SpriteCircle(test_sprite)
    assert PointInCircle(PointAt(50, 50), test_circle) is True
    FreeSprite(test_sprite)
    FreeBitmap(test_bitmap)
    CloseWindow(test_window)


def test_SpriteCollisionBitmap_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_bitmap = CreateBitmap("test_bitmap", 100, 100)
    test_sprite = CreateSprite(test_bitmap)
    collision_bitmap = SpriteCollisionBitmap(test_sprite)
    assert BitmapWidth(collision_bitmap) == 100
    assert BitmapHeight(collision_bitmap) == 100
    FreeSprite(test_sprite)
    FreeBitmap(test_bitmap)
    CloseWindow(test_window)


def test_SpriteCollisionCircle_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_bitmap = CreateBitmap("test_bitmap", 100, 100)
    test_sprite = CreateSprite(test_bitmap)
    test_circle = SpriteCollisionCircle(test_sprite)
    assert PointInCircle(PointAt(50, 50), test_circle) is True
    FreeSprite(test_sprite)
    FreeBitmap(test_bitmap)
    CloseWindow(test_window)


def test_SpriteCollisionKind_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_bitmap = CreateBitmap("test_bitmap", 100, 100)
    test_sprite = CreateSprite(test_bitmap)
    SpriteSetCollisionKind(test_sprite, CollisionTestKind.PixelCollisions)
    assert SpriteCollisionKind(test_sprite) == CollisionTestKind.PixelCollisions
    FreeSprite(test_sprite)
    FreeBitmap(test_bitmap)
    CloseWindow(test_window)


def test_SpriteCollisionRectangle_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_bitmap = CreateBitmap("test_bitmap", 100, 100)
    test_sprite = CreateSprite(test_bitmap)
    test_rectangle = SpriteCollisionRectangle(test_sprite)
    assert test_rectangle.width == 100
    assert test_rectangle.height == 100
    FreeSprite(test_sprite)
    FreeBitmap(test_bitmap)
    CloseWindow(test_window)


def test_SpriteCurrentCell_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_bitmap = CreateBitmap("test_bitmap", 100, 100)
    test_sprite = CreateSprite(test_bitmap)
    SpriteStartAnimation(test_sprite, 0)
    UpdateSprite(test_sprite)
    assert SpriteCurrentCell(test_sprite) == 0
    FreeSprite(test_sprite)
    FreeBitmap(test_bitmap)
    CloseWindow(test_window)


def test_SpriteCurrentCellRectangle_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_bitmap = CreateBitmap("test_bitmap", 100, 100)
    test_sprite = CreateSprite(test_bitmap)
    test_rectangle = SpriteCurrentCellRectangle(test_sprite)
    assert RectangleLeft(test_rectangle) == 0
    assert RectangleTop(test_rectangle) == 0
    assert RectangleRight(test_rectangle) == BitmapWidth(test_bitmap)
    assert RectangleBottom(test_rectangle) == BitmapHeight(test_bitmap)
    FreeSprite(test_sprite)
    FreeBitmap(test_bitmap)
    CloseWindow(test_window)


def test_SpriteDx_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_bitmap = CreateBitmap("test_bitmap", 100, 100)
    test_sprite = CreateSprite(test_bitmap)
    SpriteSetDx(test_sprite, 5.0)
    assert SpriteDx(test_sprite) == 5.0
    FreeSprite(test_sprite)
    FreeBitmap(test_bitmap)
    CloseWindow(test_window)


def test_SpriteDy_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_bitmap = CreateBitmap("test_bitmap", 100, 100)
    test_sprite = CreateSprite(test_bitmap)
    SpriteSetDy(test_sprite, 5.0)
    assert SpriteDy(test_sprite) == 5.0
    FreeSprite(test_sprite)
    FreeBitmap(test_bitmap)
    CloseWindow(test_window)


def test_SpriteHasValue_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_bitmap = CreateBitmap("test_bitmap", 100, 100)
    test_sprite = CreateSprite(test_bitmap)
    SpriteAddValue(test_sprite, "health")
    assert SpriteHasValue(test_sprite, "health") is True
    assert SpriteHasValue(test_sprite, "mana") is False
    FreeSprite(test_sprite)
    FreeBitmap(test_bitmap)
    CloseWindow(test_window)


def test_SpriteHeading_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_bitmap = CreateBitmap("test_bitmap", 100, 100)
    test_sprite = CreateSprite(test_bitmap)
    SpriteSetVelocity(test_sprite, VectorTo(1.0, 1.0))
    test_heading = SpriteHeading(test_sprite)
    assert 45.0 <= test_heading <= 45.01
    FreeSprite(test_sprite)
    FreeBitmap(test_bitmap)
    CloseWindow(test_window)


def test_SpriteHeight_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_bitmap = CreateBitmap("test_bitmap", 100, 100)
    test_sprite = CreateSprite(test_bitmap)
    assert SpriteHeight(test_sprite) == 100
    FreeSprite(test_sprite)
    FreeBitmap(test_bitmap)
    CloseWindow(test_window)


def test_SpriteHideLayerNamed_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_bitmap = CreateBitmap("test_bitmap", 100, 100)
    test_sprite = CreateSprite(test_bitmap)
    layer_index = SpriteAddLayer(test_sprite, test_bitmap, "layer2")
    SpriteHideLayerNamed(test_sprite, "layer2")
    assert SpriteLayerVisible(test_sprite, layer_index) is False
    FreeSprite(test_sprite)
    FreeBitmap(test_bitmap)
    CloseWindow(test_window)


def test_SpriteHideLayer_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_bitmap = CreateBitmap("test_bitmap", 100, 100)
    test_sprite = CreateSprite(test_bitmap)
    layer_index = SpriteAddLayer(test_sprite, test_bitmap, "layer2")
    SpriteShowLayer(test_sprite, layer_index)
    SpriteHideLayer(test_sprite, layer_index)
    assert SpriteLayerVisible(test_sprite, layer_index) is False
    FreeSprite(test_sprite)
    FreeBitmap(test_bitmap)
    CloseWindow(test_window)


def test_SpriteLayerNamed_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_bitmap = CreateBitmap("test_bitmap", 100, 100)
    test_sprite = CreateSprite(test_bitmap)
    SpriteAddLayer(test_sprite, test_bitmap, "layer2")
    test_layer_bitmap = SpriteLayerNamed(test_sprite, "layer2")
    assert test_layer_bitmap is not None
    FreeSprite(test_sprite)
    FreeBitmap(test_bitmap)
    CloseWindow(test_window)


def test_SpriteLayerAtIndex_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_bitmap = CreateBitmap("test_bitmap", 100, 100)
    test_sprite = CreateSprite(test_bitmap)
    layer_index = SpriteAddLayer(test_sprite, test_bitmap, "layer2")
    test_layer_bitmap = SpriteLayerAtIndex(test_sprite, layer_index)
    assert test_layer_bitmap is not None
    FreeSprite(test_sprite)
    FreeBitmap(test_bitmap)
    CloseWindow(test_window)


def test_SpriteLayerCircleNamed_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_bitmap = CreateBitmap("test_bitmap", 100, 100)
    test_sprite = CreateSprite(test_bitmap)
    test_circle = SpriteLayerCircleNamed(test_sprite, "layer1")
    assert PointInCircle(PointAt(50, 50), test_circle) is True
    FreeSprite(test_sprite)
    FreeBitmap(test_bitmap)
    CloseWindow(test_window)


def test_SpriteLayerCircleAtIndex_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_bitmap = CreateBitmap("test_bitmap", 100, 100)
    test_sprite = CreateSprite(test_bitmap)
    test_circle = SpriteLayerCircleAtIndex(test_sprite, 0)
    assert PointInCircle(PointAt(50, 50), test_circle) is True
    FreeSprite(test_sprite)
    FreeBitmap(test_bitmap)
    CloseWindow(test_window)


def test_SpriteLayerCount_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_bitmap = CreateBitmap("test_bitmap", 100, 100)
    test_sprite = CreateSprite(test_bitmap)
    assert SpriteLayerCount(test_sprite) == 1
    SpriteAddLayer(test_sprite, test_bitmap, "layer2")
    assert SpriteLayerCount(test_sprite) == 2
    FreeSprite(test_sprite)
    FreeBitmap(test_bitmap)
    CloseWindow(test_window)


def test_SpriteLayerHeightNamed_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_bitmap = CreateBitmap("test_bitmap", 100, 100)
    test_sprite = CreateSprite(test_bitmap)
    SpriteAddLayer(test_sprite, test_bitmap, "layer2")
    assert SpriteLayerHeightNamed(test_sprite, "layer2") == 100
    FreeSprite(test_sprite)
    FreeBitmap(test_bitmap)
    CloseWindow(test_window)


def test_SpriteLayerHeight_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_bitmap = CreateBitmap("test_bitmap", 100, 100)
    test_sprite = CreateSprite(test_bitmap)
    layer_height = SpriteLayerHeight(test_sprite, 0)
    assert layer_height == 100
    FreeSprite(test_sprite)
    FreeBitmap(test_bitmap)
    CloseWindow(test_window)


def test_SpriteLayerIndex_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_bitmap = CreateBitmap("test_bitmap", 100, 100)
    test_sprite = CreateSprite(test_bitmap)
    layer_index = SpriteAddLayer(test_sprite, test_bitmap, "layer2")
    assert SpriteLayerIndex(test_sprite, "layer2") == layer_index
    FreeSprite(test_sprite)
    FreeBitmap(test_bitmap)
    CloseWindow(test_window)


def test_SpriteLayerName_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_bitmap = CreateBitmap("test_bitmap", 100, 100)
    test_sprite = CreateSprite(test_bitmap)
    layer_index = SpriteAddLayer(test_sprite, test_bitmap, "layer2")
    assert SpriteLayerName(test_sprite, layer_index) == "layer2"
    FreeSprite(test_sprite)
    FreeBitmap(test_bitmap)
    CloseWindow(test_window)


def test_SpriteLayerOffsetNamed_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_bitmap = CreateBitmap("test_bitmap", 100, 100)
    test_sprite = CreateSprite(test_bitmap)
    SpriteSetLayerOffsetNamed(test_sprite, "layer1", VectorTo(10, 10))
    layer_offset = SpriteLayerOffsetNamed(test_sprite, "layer1")
    assert layer_offset.x == 10
    assert layer_offset.y == 10
    FreeSprite(test_sprite)
    FreeBitmap(test_bitmap)
    CloseWindow(test_window)


def test_SpriteLayerOffset_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_bitmap = CreateBitmap("test_bitmap", 100, 100)
    test_sprite = CreateSprite(test_bitmap)
    layer_index = SpriteAddLayer(test_sprite, test_bitmap, "layer2")
    SpriteSetLayerOffsetAtIndex(test_sprite, layer_index, VectorTo(10, 10))
    assert SpriteLayerOffset(test_sprite, layer_index) == VectorTo(10, 10)
    FreeSprite(test_sprite)
    FreeBitmap(test_bitmap)
    CloseWindow(test_window)


def test_SpriteLayerRectangleNamed_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_bitmap = CreateBitmap("test_bitmap", 100, 100)
    test_sprite = CreateSprite(test_bitmap)
    test_rectangle = SpriteLayerRectangleNamed(test_sprite, "layer1")
    assert RectangleLeft(test_rectangle) == 0
    assert RectangleTop(test_rectangle) == 0
    assert RectangleRight(test_rectangle) == 100
    assert RectangleBottom(test_rectangle) == 100
    FreeSprite(test_sprite)
    FreeBitmap(test_bitmap)
    CloseWindow(test_window)


def test_SpriteLayerRectangleAtIndex_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_bitmap = CreateBitmap("test_bitmap", 100, 100)
    test_sprite = CreateSprite(test_bitmap)
    test_rectangle = SpriteLayerRectangleAtIndex(test_sprite, 0)
    assert test_rectangle.width == BitmapWidth(test_bitmap)
    FreeSprite(test_sprite)
    FreeBitmap(test_bitmap)
    CloseWindow(test_window)


def test_SpriteLayerWidthNamed_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_bitmap = CreateBitmap("test_bitmap", 100, 100)
    test_sprite = CreateSprite(test_bitmap)
    SpriteAddLayer(test_sprite, test_bitmap, "layer2")
    assert SpriteLayerWidthNamed(test_sprite, "layer2") == 100
    FreeSprite(test_sprite)
    FreeBitmap(test_bitmap)
    CloseWindow(test_window)


def test_SpriteLayerWidth_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_bitmap = CreateBitmap("test_bitmap", 100, 100)
    test_sprite = CreateSprite(test_bitmap)
    assert SpriteLayerWidth(test_sprite, 0) == 100
    FreeSprite(test_sprite)
    FreeBitmap(test_bitmap)
    CloseWindow(test_window)


def test_SpriteLocationMatrix_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_bitmap = CreateBitmap("test_bitmap", 100, 100)
    test_sprite = CreateSprite(test_bitmap)
    SpriteSetPosition(test_sprite, PointAt(100.0, 100.0))
    SpriteSetRotation(test_sprite, 45.0)
    test_matrix = SpriteLocationMatrix(test_sprite)
    test_point = PointAt(50.0, 50.0)
    result_point = MatrixMultiplyPoint(test_matrix, test_point)
    assert 149.0 <= result_point.x <= 150.0
    assert 149.0 <= result_point.y <= 150.0
    FreeSprite(test_sprite)
    FreeBitmap(test_bitmap)
    CloseWindow(test_window)


def test_SpriteMass_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_bitmap = CreateBitmap("test_bitmap", 100, 100)
    test_sprite = CreateSprite(test_bitmap)
    SpriteSetMass(test_sprite, 10.0)
    assert SpriteMass(test_sprite) == 10.0
    FreeSprite(test_sprite)
    FreeBitmap(test_bitmap)
    CloseWindow(test_window)


def test_SpriteMoveFromAnchorPoint_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_bitmap = CreateBitmap("test_bitmap", 100, 100)
    test_sprite = CreateSprite(test_bitmap)
    SpriteSetMoveFromAnchorPoint(test_sprite, true)
    assert SpriteMoveFromAnchorPoint(test_sprite) is True
    SpriteSetMoveFromAnchorPoint(test_sprite, false)
    assert SpriteMoveFromAnchorPoint(test_sprite) is False
    FreeSprite(test_sprite)
    FreeBitmap(test_bitmap)
    CloseWindow(test_window)


def test_SpriteMoveToTakingSeconds_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_bitmap = CreateBitmap("test_bitmap", 100, 100)
    test_sprite = CreateSprite(test_bitmap)
    SpriteSetPosition(test_sprite, PointAt(100, 100))
    SpriteMoveToTakingSeconds(test_sprite, PointAt(400, 300), 2.0)
    ProcessEvents()
    assert PointInCircle(PointAt(400, 300), SpriteCollisionCircle(test_sprite)) is True
    FreeSprite(test_sprite)
    FreeBitmap(test_bitmap)
    CloseWindow(test_window)


def test_SpriteName_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_bitmap = CreateBitmap("test_bitmap", 100, 100)
    test_sprite = CreateSprite(test_bitmap)
    assert SpriteName(test_sprite) == "test_sprite"
    FreeSprite(test_sprite)
    FreeBitmap(test_bitmap)
    CloseWindow(test_window)


def test_SpriteNamed_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_bitmap = CreateBitmap("test_bitmap", 100, 100)
    test_sprite = CreateSprite(test_bitmap)
    named_sprite = SpriteNamed("test_sprite")
    assert named_sprite is not None
    FreeSprite(test_sprite)
    FreeBitmap(test_bitmap)
    CloseWindow(test_window)


def test_SpriteOffscreen_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_bitmap = CreateBitmap("test_bitmap", 100, 100)
    test_sprite = CreateSprite(test_bitmap)
    SpriteSetPosition(test_sprite, PointAt(0, 0))
    assert SpriteOffscreen(test_sprite) is False
    SpriteSetPosition(test_sprite, PointAt(-100, -100))
    assert SpriteOffscreen(test_sprite) is True
    FreeSprite(test_sprite)
    FreeBitmap(test_bitmap)
    CloseWindow(test_window)


def test_SpriteOnScreenAtPoint_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_bitmap = CreateBitmap("test_bitmap", 100, 100)
    test_sprite = CreateSprite(test_bitmap)
    SpriteSetPosition(test_sprite, PointAt(100, 100))
    DrawSprite(test_sprite)
    RefreshScreen()
    assert SpriteOnScreenAtPoint(test_sprite, PointAt(100, 100)) is True
    assert SpriteOnScreenAtPoint(test_sprite, PointAt(1000, 1000)) is False
    FreeSprite(test_sprite)
    FreeBitmap(test_bitmap)
    CloseWindow(test_window)


def test_SpriteOnScreenAt_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_bitmap = CreateBitmap("test_bitmap", 100, 100)
    test_sprite = CreateSprite(test_bitmap)
    SpriteSetPosition(test_sprite, PointAt(100, 100))
    assert SpriteOnScreenAt(test_sprite, 100, 100) is True
    assert SpriteOnScreenAt(test_sprite, 1000, 1000) is False
    FreeSprite(test_sprite)
    FreeBitmap(test_bitmap)
    CloseWindow(test_window)


def test_SpritePosition_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_bitmap = CreateBitmap("test_bitmap", 100, 100)
    test_sprite = CreateSprite(test_bitmap)
    SpriteSetPosition(test_sprite, PointAt(100.0, 100.0))
    test_position = SpritePosition(test_sprite)
    assert test_position.x == 100.0
    assert test_position.y == 100.0
    FreeSprite(test_sprite)
    FreeBitmap(test_bitmap)
    CloseWindow(test_window)


def test_SpriteReplayAnimation_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_bitmap = CreateBitmap("test_bitmap", 100, 100)
    test_sprite = CreateSprite(test_bitmap)
    SpriteStartAnimation(test_sprite, 0)
    SpriteReplayAnimation(test_sprite)
    assert SpriteAnimationHasEnded(test_sprite) is True
    FreeSprite(test_sprite)
    FreeBitmap(test_bitmap)
    CloseWindow(test_window)


def test_SpriteReplayAnimationWithSound_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_bitmap = CreateBitmap("test_bitmap", 100, 100)
    test_sprite = CreateSprite(test_bitmap)
    SpriteReplayAnimationWithSound(test_sprite, true)
    FreeSprite(test_sprite)
    FreeBitmap(test_bitmap)
    CloseWindow(test_window)


def test_SpriteRotation_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_bitmap = CreateBitmap("test_bitmap", 100, 100)
    test_sprite = CreateSprite(test_bitmap)
    SpriteSetRotation(test_sprite, 45.0)
    assert SpriteRotation(test_sprite) == 45.0
    FreeSprite(test_sprite)
    FreeBitmap(test_bitmap)
    CloseWindow(test_window)


def test_SpriteScale_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_bitmap = CreateBitmap("test_bitmap", 100, 100)
    test_sprite = CreateSprite(test_bitmap)
    SpriteSetScale(test_sprite, 2.0)
    assert SpriteScale(test_sprite) == 2.0
    FreeSprite(test_sprite)
    FreeBitmap(test_bitmap)
    CloseWindow(test_window)


def test_SpriteScreenRectangle_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_bitmap = CreateBitmap("test_bitmap", 100, 100)
    test_sprite = CreateSprite(test_bitmap)
    SpriteSetPosition(test_sprite, PointAt(100, 100))
    test_rectangle = SpriteScreenRectangle(test_sprite)
    assert RectangleLeft(test_rectangle) == 100
    assert RectangleTop(test_rectangle) == 100
    FreeSprite(test_sprite)
    FreeBitmap(test_bitmap)
    CloseWindow(test_window)


def test_SpriteSendLayerBackward_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_bitmap = CreateBitmap("test_bitmap", 100, 100)
    test_sprite = CreateSprite(test_bitmap)
    layer_index = SpriteAddLayer(test_sprite, test_bitmap, "layer2")
    SpriteSendLayerBackward(test_sprite, layer_index)
    assert SpriteVisibleIndexOfLayer(test_sprite, layer_index) < 1
    FreeSprite(test_sprite)
    FreeBitmap(test_bitmap)
    CloseWindow(test_window)


def test_SpriteSendLayerToBack_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_bitmap = CreateBitmap("test_bitmap", 100, 100)
    test_sprite = CreateSprite(test_bitmap)
    layer_index = SpriteAddLayer(test_sprite, test_bitmap, "layer2")
    SpriteSendLayerToBack(test_sprite, layer_index)
    assert SpriteVisibleIndexOfLayer(test_sprite, layer_index) == 0
    FreeSprite(test_sprite)
    FreeBitmap(test_bitmap)
    CloseWindow(test_window)


def test_SpriteSetAnchorPoint_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_bitmap = CreateBitmap("test_bitmap", 100, 100)
    test_sprite = CreateSprite(test_bitmap)
    SpriteSetAnchorPoint(test_sprite, PointAt(50, 50))
    test_anchor_point = SpriteAnchorPoint(test_sprite)
    assert test_anchor_point.x == 50
    assert test_anchor_point.y == 50
    FreeSprite(test_sprite)
    FreeBitmap(test_bitmap)
    CloseWindow(test_window)


def test_SpriteSetCollisionBitmap_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_bitmap = CreateBitmap("test_bitmap", 100, 100)
    test_sprite = CreateSprite(test_bitmap)
    SpriteSetCollisionBitmap(test_sprite, test_bitmap)
    assert SpriteCollisionBitmap(test_sprite) == test_bitmap
    FreeSprite(test_sprite)
    FreeBitmap(test_bitmap)
    CloseWindow(test_window)


def test_SpriteSetCollisionKind_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_bitmap = CreateBitmap("test_bitmap", 100, 100)
    test_sprite = CreateSprite(test_bitmap)
    SpriteSetCollisionKind(test_sprite, CollisionTestKind.PixelCollisions)
    assert SpriteCollisionKind(test_sprite) == CollisionTestKind.PixelCollisions
    FreeSprite(test_sprite)
    FreeBitmap(test_bitmap)
    CloseWindow(test_window)


def test_SpriteSetDx_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_bitmap = CreateBitmap("test_bitmap", 100, 100)
    test_sprite = CreateSprite(test_bitmap)
    SpriteSetDx(test_sprite, 5.0)
    assert SpriteDx(test_sprite) == 5.0
    FreeSprite(test_sprite)
    FreeBitmap(test_bitmap)
    CloseWindow(test_window)


def test_SpriteSetDy_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_bitmap = CreateBitmap("test_bitmap", 100, 100)
    test_sprite = CreateSprite(test_bitmap)
    SpriteSetDy(test_sprite, 5.0)
    assert SpriteDy(test_sprite) == 5.0
    FreeSprite(test_sprite)
    FreeBitmap(test_bitmap)
    CloseWindow(test_window)


def test_SpriteSetHeading_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_bitmap = CreateBitmap("test_bitmap", 100, 100)
    test_sprite = CreateSprite(test_bitmap)
    SpriteSetHeading(test_sprite, 45.0)
    assert SpriteHeading(test_sprite) == 45.0
    FreeSprite(test_sprite)
    FreeBitmap(test_bitmap)
    CloseWindow(test_window)


def test_SpriteSetLayerOffsetNamed_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_bitmap = CreateBitmap("test_bitmap", 100, 100)
    test_sprite = CreateSprite(test_bitmap)
    SpriteSetLayerOffsetNamed(test_sprite, "layer1", VectorTo(10.0, 10.0))
    test_offset = SpriteLayerOffsetNamed(test_sprite, "layer1")
    assert test_offset.x == 10.0
    assert test_offset.y == 10.0
    FreeSprite(test_sprite)
    FreeBitmap(test_bitmap)
    CloseWindow(test_window)


def test_SpriteSetLayerOffsetAtIndex_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_bitmap = CreateBitmap("test_bitmap", 100, 100)
    test_sprite = CreateSprite(test_bitmap)
    SpriteSetLayerOffsetAtIndex(test_sprite, 0, VectorTo(10.0, 10.0))
    assert SpriteLayerOffset(test_sprite, 0) == VectorTo(10.0, 10.0)
    FreeSprite(test_sprite)
    FreeBitmap(test_bitmap)
    CloseWindow(test_window)


def test_SpriteSetMass_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_bitmap = CreateBitmap("test_bitmap", 100, 100)
    test_sprite = CreateSprite(test_bitmap)
    SpriteSetMass(test_sprite, 10.0)
    assert SpriteMass(test_sprite) == 10.0
    FreeSprite(test_sprite)
    FreeBitmap(test_bitmap)
    CloseWindow(test_window)


def test_SpriteSetMoveFromAnchorPoint_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_bitmap = CreateBitmap("test_bitmap", 100, 100)
    test_sprite = CreateSprite(test_bitmap)
    SpriteSetMoveFromAnchorPoint(test_sprite, true)
    assert SpriteMoveFromAnchorPoint(test_sprite) is True
    SpriteSetMoveFromAnchorPoint(test_sprite, false)
    assert SpriteMoveFromAnchorPoint(test_sprite) is False
    FreeSprite(test_sprite)
    FreeBitmap(test_bitmap)
    CloseWindow(test_window)


def test_SpriteSetPosition_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_bitmap = CreateBitmap("test_bitmap", 100, 100)
    test_sprite = CreateSprite(test_bitmap)
    SpriteSetPosition(test_sprite, PointAt(100, 100))
    assert SpriteX(test_sprite) == 100
    assert SpriteY(test_sprite) == 100
    FreeSprite(test_sprite)
    FreeBitmap(test_bitmap)
    CloseWindow(test_window)


def test_SpriteSetRotation_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_bitmap = CreateBitmap("test_bitmap", 100, 100)
    test_sprite = CreateSprite(test_bitmap)
    SpriteSetRotation(test_sprite, 45.0)
    assert SpriteRotation(test_sprite) == 45.0
    FreeSprite(test_sprite)
    FreeBitmap(test_bitmap)
    CloseWindow(test_window)


def test_SpriteSetScale_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_bitmap = CreateBitmap("test_bitmap", 100, 100)
    test_sprite = CreateSprite(test_bitmap)
    SpriteSetScale(test_sprite, 2.0)
    assert SpriteScale(test_sprite) == 2.0
    FreeSprite(test_sprite)
    FreeBitmap(test_bitmap)
    CloseWindow(test_window)


def test_SpriteSetSpeed_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_bitmap = CreateBitmap("test_bitmap", 100, 100)
    test_sprite = CreateSprite(test_bitmap)
    SpriteSetSpeed(test_sprite, 5.0)
    assert SpriteSpeed(test_sprite) == 5.0
    FreeSprite(test_sprite)
    FreeBitmap(test_bitmap)
    CloseWindow(test_window)


def test_SpriteSetValueNamed_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_bitmap = CreateBitmap("test_bitmap", 100, 100)
    test_sprite = CreateSprite(test_bitmap)
    SpriteAddValue(test_sprite, "test_value")
    SpriteSetValueNamed(test_sprite, "test_value", 10.5)
    assert SpriteValue(test_sprite, "test_value") == 10.5
    FreeSprite(test_sprite)
    FreeBitmap(test_bitmap)
    CloseWindow(test_window)


def test_SpriteSetVelocity_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_bitmap = CreateBitmap("test_bitmap", 100, 100)
    test_sprite = CreateSprite(test_bitmap)
    SpriteSetVelocity(test_sprite, VectorTo(5.0, 5.0))
    UpdateSprite(test_sprite)
    assert SpriteAt(test_sprite, PointAt(5.0, 5.0)) is True
    FreeSprite(test_sprite)
    FreeBitmap(test_bitmap)
    CloseWindow(test_window)


def test_SpriteSetX_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_bitmap = CreateBitmap("test_bitmap", 100, 100)
    test_sprite = CreateSprite(test_bitmap)
    SpriteSetX(test_sprite, 150.0)
    assert SpriteX(test_sprite) == 150.0
    FreeSprite(test_sprite)
    FreeBitmap(test_bitmap)
    CloseWindow(test_window)


def test_SpriteSetY_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_bitmap = CreateBitmap("test_bitmap", 100, 100)
    test_sprite = CreateSprite(test_bitmap)
    SpriteSetY(test_sprite, 300.0)
    assert SpriteY(test_sprite) == 300.0
    FreeSprite(test_sprite)
    FreeBitmap(test_bitmap)
    CloseWindow(test_window)


def test_SpriteShowLayerNamed_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_bitmap = CreateBitmap("test_bitmap", 100, 100)
    test_sprite = CreateSprite(test_bitmap)
    layer_index = SpriteAddLayer(test_sprite, test_bitmap, "layer2")
    result = SpriteShowLayerNamed(test_sprite, "layer2")
    assert result == 1
    FreeSprite(test_sprite)
    FreeBitmap(test_bitmap)
    CloseWindow(test_window)


def test_SpriteShowLayer_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_bitmap = CreateBitmap("test_bitmap", 100, 100)
    test_sprite = CreateSprite(test_bitmap)
    layer_index = SpriteAddLayer(test_sprite, test_bitmap, "layer2")
    SpriteHideLayer(test_sprite, 1)
    result = SpriteShowLayer(test_sprite, 1)
    assert result == 1
    FreeSprite(test_sprite)
    FreeBitmap(test_bitmap)
    CloseWindow(test_window)


def test_SpriteSpeed_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_bitmap = CreateBitmap("test_bitmap", 100, 100)
    test_sprite = CreateSprite(test_bitmap)
    SpriteSetVelocity(test_sprite, VectorTo(5.0, 5.0))
    test_speed = SpriteSpeed(test_sprite)
    assert test_speed == 7.0710678118654755
    FreeSprite(test_sprite)
    FreeBitmap(test_bitmap)
    CloseWindow(test_window)


def test_SpriteStartAnimationNamed_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_bitmap = CreateBitmap("test_bitmap", 100, 100)
    test_sprite = CreateSprite(test_bitmap)
    SpriteStartAnimationNamed(test_sprite, "test_animation")
    assert SpriteAnimationName(test_sprite) is True
    FreeSprite(test_sprite)
    FreeBitmap(test_bitmap)
    CloseWindow(test_window)


def test_SpriteStartAnimationNamedWithSound_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_bitmap = CreateBitmap("test_bitmap", 100, 100)
    test_sprite = CreateSprite(test_bitmap)
    SpriteStartAnimationNamedWithSound(test_sprite, "test_animation", true)
    UpdateSprite(test_sprite)
    assert SpriteAnimationHasEnded(test_sprite) is True
    FreeSprite(test_sprite)
    FreeBitmap(test_bitmap)
    CloseWindow(test_window)


def test_SpriteStartAnimation_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_bitmap = CreateBitmap("test_bitmap", 100, 100)
    test_sprite = CreateSprite(test_bitmap)
    SpriteStartAnimation(test_sprite, 0)
    UpdateSprite(test_sprite)
    assert SpriteAnimationHasEnded(test_sprite) is True
    FreeSprite(test_sprite)
    FreeBitmap(test_bitmap)
    CloseWindow(test_window)


def test_SpriteStartAnimationWithSound_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_bitmap = CreateBitmap("test_bitmap", 100, 100)
    test_sprite = CreateSprite(test_bitmap)
    SpriteStartAnimationWithSound(test_sprite, 0, true)
    UpdateSprite(test_sprite)
    assert SpriteAnimationHasEnded(test_sprite) is True
    FreeSprite(test_sprite)
    FreeBitmap(test_bitmap)
    CloseWindow(test_window)


def test_SpriteStopCallingOnEvent_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_bitmap = CreateBitmap("test_bitmap", 100, 100)
    test_sprite = CreateSprite(test_bitmap)
    SpriteCallOnEvent(test_sprite, OnSpriteEvent())
    ProcessEvents()
    SimulateSpriteEvent(test_sprite)
    ProcessEvents()
    assert OnSpriteEventCalled() is True
    SpriteStopCallingOnEvent(test_sprite, OnSpriteEvent())
    ProcessEvents()
    SimulateSpriteEvent(test_sprite)
    ProcessEvents()
    assert OnSpriteEventCalled() is False
    FreeSprite(test_sprite)
    FreeBitmap(test_bitmap)
    CloseWindow(test_window)


def test_SpriteToggleLayerVisibleNamed_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_bitmap = CreateBitmap("test_bitmap", 100, 100)
    test_sprite = CreateSprite(test_bitmap)
    SpriteAddLayer(test_sprite, test_bitmap, "layer2")
    SpriteToggleLayerVisibleNamed(test_sprite, "layer2")
    assert SpriteVisibleLayerCount(test_sprite) is False
    SpriteToggleLayerVisibleNamed(test_sprite, "layer2")
    assert SpriteVisibleLayerCount(test_sprite) == 2
    FreeSprite(test_sprite)
    FreeBitmap(test_bitmap)
    CloseWindow(test_window)


def test_SpriteToggleLayerVisible_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_bitmap = CreateBitmap("test_bitmap", 100, 100)
    test_sprite = CreateSprite(test_bitmap)
    layer_index = SpriteAddLayer(test_sprite, test_bitmap, "layer2")
    SpriteHideLayer(test_sprite, layer_index)
    SpriteToggleLayerVisible(test_sprite, layer_index)
    assert SpriteVisibleLayerCount(test_sprite) is True
    FreeSprite(test_sprite)
    FreeBitmap(test_bitmap)
    CloseWindow(test_window)


def test_SpriteValue_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_bitmap = CreateBitmap("test_bitmap", 100, 100)
    test_sprite = CreateSprite(test_bitmap)
    SpriteAddValue(test_sprite, "test_value", 10.0)
    sprite_value_result = SpriteValue(test_sprite, "test_value")
    assert sprite_value_result == 10.0
    FreeSprite(test_sprite)
    FreeBitmap(test_bitmap)
    CloseWindow(test_window)


def test_SpriteValueCount_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_bitmap = CreateBitmap("test_bitmap", 100, 100)
    test_sprite = CreateSprite(test_bitmap)
    SpriteAddValue(test_sprite, "health")
    SpriteAddValue(test_sprite, "speed")
    assert SpriteValueCount(test_sprite) == 2
    FreeSprite(test_sprite)
    FreeBitmap(test_bitmap)
    CloseWindow(test_window)


def test_SpriteVelocity_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_bitmap = CreateBitmap("test_bitmap", 100, 100)
    test_sprite = CreateSprite(test_bitmap)
    SpriteSetVelocity(test_sprite, VectorTo(5.0, 5.0))
    test_velocity = SpriteVelocity(test_sprite)
    assert test_velocity.x == 5.0
    assert test_velocity.y == 5.0
    FreeAllSprites()
    FreeBitmap(test_bitmap)
    CloseWindow(test_window)


def test_SpriteVisibleIndexOfLayerNamed_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_bitmap = CreateBitmap("test_bitmap", 100, 100)
    test_sprite = CreateSprite(test_bitmap)
    SpriteAddLayer(test_sprite, test_bitmap, "layer2")
    layer_index = SpriteVisibleIndexOfLayerNamed(test_sprite, "layer2")
    assert layer_index == 1
    FreeSprite(test_sprite)
    FreeBitmap(test_bitmap)
    CloseWindow(test_window)


def test_SpriteVisibleIndexOfLayer_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_bitmap = CreateBitmap("test_bitmap", 100, 100)
    test_sprite = CreateSprite(test_bitmap)
    layer_index = SpriteAddLayer(test_sprite, test_bitmap, "layer2")
    SpriteShowLayer(test_sprite, layer_index)
    assert SpriteVisibleIndexOfLayer(test_sprite, layer_index) == 1
    FreeSprite(test_sprite)
    FreeBitmap(test_bitmap)
    CloseWindow(test_window)


def test_SpriteVisibleLayer_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_bitmap = CreateBitmap("test_bitmap", 100, 100)
    test_sprite = CreateSprite(test_bitmap)
    SpriteAddLayer(test_sprite, test_bitmap, "layer2")
    SpriteShowLayer(test_sprite, "layer2")
    assert SpriteVisibleLayer(test_sprite, 1) == 1
    FreeSprite(test_sprite)
    FreeBitmap(test_bitmap)
    CloseWindow(test_window)


def test_SpriteVisibleLayerCount_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_bitmap = CreateBitmap("test_bitmap", 100, 100)
    test_sprite = CreateSprite(test_bitmap)
    assert SpriteVisibleLayerCount(test_sprite) == 1
    SpriteAddLayer(test_sprite, test_bitmap, "layer2")
    SpriteShowLayer(test_sprite, "layer2")
    assert SpriteVisibleLayerCount(test_sprite) == 2
    FreeSprite(test_sprite)
    FreeBitmap(test_bitmap)
    CloseWindow(test_window)


def test_SpriteVisibleLayerId_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_bitmap = CreateBitmap("test_bitmap", 100, 100)
    test_sprite = CreateSprite(test_bitmap)
    SpriteAddLayer(test_sprite, test_bitmap, "layer2")
    SpriteShowLayer(test_sprite, "layer2")
    assert SpriteVisibleLayerId(test_sprite, 1) == 1
    FreeSprite(test_sprite)
    FreeBitmap(test_bitmap)
    CloseWindow(test_window)


def test_SpriteWidth_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_bitmap = CreateBitmap("test_bitmap", 100, 100)
    test_sprite = CreateSprite(test_bitmap)
    assert SpriteWidth(test_sprite) == 100
    FreeSprite(test_sprite)
    FreeBitmap(test_bitmap)
    CloseWindow(test_window)


def test_SpriteX_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_bitmap = CreateBitmap("test_bitmap", 100, 100)
    test_sprite = CreateSprite(test_bitmap)
    SpriteSetX(test_sprite, 150.0)
    assert SpriteX(test_sprite) == 150.0
    FreeSprite(test_sprite)
    FreeBitmap(test_bitmap)
    CloseWindow(test_window)


def test_SpriteY_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_bitmap = CreateBitmap("test_bitmap", 100, 100)
    test_sprite = CreateSprite(test_bitmap)
    SpriteSetY(test_sprite, 200.0)
    assert SpriteY(test_sprite) == 200.0
    FreeSprite(test_sprite)
    FreeBitmap(test_bitmap)
    CloseWindow(test_window)


def test_StopCallingOnSpriteEvent_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_bitmap = CreateBitmap("test_bitmap", 100, 100)
    test_sprite = CreateSprite(test_bitmap)
    CallOnSpriteEvent(OnSpriteEvent())
    ProcessEvents()
    SimulateSpriteEvent(test_sprite)
    ProcessEvents()
    assert SpriteEventOccurred(test_sprite) is True
    StopCallingOnSpriteEvent(OnSpriteEvent())
    ProcessEvents()
    SimulateSpriteEvent(test_sprite)
    ProcessEvents()
    assert SpriteEventOccurred(test_sprite) is False
    FreeSprite(test_sprite)
    FreeBitmap(test_bitmap)
    CloseWindow(test_window)


def test_UpdateAllSprites_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_bitmap = CreateBitmap("test_bitmap", 100, 100)
    test_sprite1 = CreateSprite(test_bitmap)
    test_sprite2 = CreateSprite(test_bitmap)
    SpriteSetPosition(test_sprite1, PointAt(100, 100))
    SpriteSetPosition(test_sprite2, PointAt(200, 200))
    SpriteSetVelocity(test_sprite1, VectorTo(1, 1))
    SpriteSetVelocity(test_sprite2, VectorTo(-1, -1))
    UpdateAllSprites()
    assert SpritePosition(test_sprite1) != PointAt(100, 100)
    assert SpritePosition(test_sprite2) != PointAt(200, 200)
    FreeAllSprites()
    CloseWindow(test_window)


def test_UpdateAllSpritesPercent_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_bitmap = CreateBitmap("test_bitmap", 100, 100)
    test_sprite1 = CreateSprite(test_bitmap)
    test_sprite2 = CreateSprite(test_bitmap)
    SpriteSetVelocity(test_sprite1, VectorTo(1.0, 1.0))
    SpriteSetVelocity(test_sprite2, VectorTo(-1.0, -1.0))
    UpdateAllSpritesPercent(0.5)
    assert SpriteAt(test_sprite1, PointAt(50.0, 50.0)) is True
    assert SpriteAt(test_sprite2, PointAt(50.0, 50.0)) is True
    FreeAllSprites()
    FreeBitmap(test_bitmap)
    CloseWindow(test_window)


def test_UpdateSprite_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_bitmap = CreateBitmap("test_bitmap", 100, 100)
    test_sprite = CreateSprite(test_bitmap)
    SpriteSetVelocity(test_sprite, VectorTo(1.0, 1.0))
    UpdateSprite(test_sprite)
    assert SpriteX(test_sprite) != 0.0
    assert SpriteY(test_sprite) != 0.0
    FreeSprite(test_sprite)
    FreeBitmap(test_bitmap)
    CloseWindow(test_window)


def test_UpdateSpriteWithSound_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_bitmap = CreateBitmap("test_bitmap", 100, 100)
    test_sprite = CreateSprite(test_bitmap)
    SpriteSetVelocity(test_sprite, VectorTo(1.0, 1.0))
    SpriteStartAnimation(test_sprite, 0, true)
    UpdateSpriteWithSound(test_sprite, true)
    assert SpriteX(test_sprite) != 0.0
    assert SpriteY(test_sprite) != 0.0
    FreeSprite(test_sprite)
    FreeBitmap(test_bitmap)
    CloseWindow(test_window)


def test_UpdateSpritePercent_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_bitmap = CreateBitmap("test_bitmap", 100, 100)
    test_sprite = CreateSprite(test_bitmap)
    SpriteSetPosition(test_sprite, PointAt(100.0, 100.0))
    SpriteSetVelocity(test_sprite, VectorTo(1.0, 1.0))
    UpdateSpritePercent(test_sprite, 0.5)
    assert PointInCircle(PointAt(100.5, 100.5), SpriteCollisionCircle(test_sprite)) is True
    FreeSprite(test_sprite)
    FreeBitmap(test_bitmap)
    CloseWindow(test_window)


def test_UpdateSpritePercentWithSound_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_bitmap = CreateBitmap("test_bitmap", 100, 100)
    test_sprite = CreateSprite(test_bitmap)
    SpriteSetPosition(test_sprite, PointAt(400, 300))
    UpdateSpritePercentWithSound(test_sprite, 0.5, true)
    FreeSprite(test_sprite)
    FreeBitmap(test_bitmap)
    CloseWindow(test_window)


def test_UpdateSpriteAnimation_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_bitmap = CreateBitmap("test_bitmap", 100, 100)
    test_sprite = CreateSprite(test_bitmap)
    SpriteStartAnimation(test_sprite, 0)
    UpdateSpriteAnimation(test_sprite)
    assert SpriteCurrentCell(test_sprite) > 0
    FreeSprite(test_sprite)
    FreeBitmap(test_bitmap)
    CloseWindow(test_window)


def test_UpdateSpriteAnimationWithSound_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_bitmap = CreateBitmap("test_bitmap", 100, 100)
    test_sprite = CreateSprite(test_bitmap)
    UpdateSpriteAnimationWithSound(test_sprite, true)
    assert SpriteAnimationHasEnded(test_sprite) is True
    FreeSprite(test_sprite)
    FreeBitmap(test_bitmap)
    CloseWindow(test_window)


def test_UpdateSpriteAnimationPercent_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_bitmap = CreateBitmap("test_bitmap", 100, 100)
    test_sprite = CreateSprite(test_bitmap)
    UpdateSpriteAnimationPercent(test_sprite, 0.5)
    FreeSprite(test_sprite)
    FreeBitmap(test_bitmap)
    CloseWindow(test_window)


def test_UpdateSpriteAnimationPercentWithSound_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_bitmap = CreateBitmap("test_bitmap", 100, 100)
    test_sprite = CreateSprite(test_bitmap)
    UpdateSpriteAnimationPercentWithSound(test_sprite, 0.5, true)
    FreeSprite(test_sprite)
    FreeBitmap(test_bitmap)
    CloseWindow(test_window)


def test_VectorFromCenterSpriteToPointPoint_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_bitmap = CreateBitmap("test_bitmap", 100, 100)
    test_sprite = CreateSprite(test_bitmap)
    SpriteSetPosition(test_sprite, PointAt(400, 300))
    test_vector = VectorFromCenterSpriteToPointPoint(test_sprite, PointAt(500, 400))
    assert test_vector.x == 100
    assert test_vector.y == 100
    FreeSprite(test_sprite)
    FreeBitmap(test_bitmap)
    CloseWindow(test_window)


def test_VectorFromTo_integration():
    test_window = OpenWindow("Test Window", 800, 600)
    test_bitmap = CreateBitmap("test_bitmap", 100, 100)
    test_sprite1 = CreateSprite(test_bitmap)
    test_sprite2 = CreateSprite(test_bitmap)
    SpriteSetPosition(test_sprite1, PointAt(100, 100))
    SpriteSetPosition(test_sprite2, PointAt(200, 200))
    test_vector = VectorFromTo(test_sprite1, test_sprite2)
    assert test_vector.x == 100
    assert test_vector.y == 100
    FreeAllSprites()
    CloseWindow(test_window)

