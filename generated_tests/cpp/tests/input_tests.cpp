#include <catch2/catch_all.hpp>
#include <limits>
#include "splashkit.h"
#include "../helpers.hpp"
struct TestInputFixture
{
    TestInputFixture()
    {
        set_resources_path("/mnt/c/Users/Noahc/Documents/aYear_2_semester_2/TeamProject/GitHubRepo/splashkit_test_generator/resources");
    }
};
TEST_CASE_METHOD(TestInputFixture, "process_events_integration") {
    open_window("Test Window 1", 800, 600);
    window_cleanup cleanup_window;
    while (key_typed(key_code::A_KEY) == false) {
        process_events();
        clear_screen();
        draw_text("Test: process_events", color_black(), 10.0, 10.0);
        draw_text("Press A to test events", color_black(), 10.0, 30.0);
        draw_text("Key Typed: " << key_typed(key_code::A_KEY), color_black(), 10.0, 50.0);
        refresh_screen();
    }
    while (mouse_clicked(mouse_button::LEFT_BUTTON) == false) {
        process_events();
        clear_screen();
        draw_text("Test: process_events", color_black(), 10.0, 10.0);
        draw_text("Click left mouse button to test events", color_black(), 10.0, 30.0);
        draw_text("Mouse Clicked: " << mouse_clicked(mouse_button::LEFT_BUTTON), color_black(), 10.0, 50.0);
        refresh_screen();
    }
}
TEST_CASE_METHOD(TestInputFixture, "quit_requested_integration") {
    open_window("Test Window 2", 800, 600);
    window_cleanup cleanup_window;
    while (quit_requested() == false) {
        process_events();
        clear_screen();
        draw_text("Test: quit_requested", color_black(), 10.0, 10.0);
        draw_text("Close window to test quit requested", color_black(), 10.0, 30.0);
        draw_text("Quit Requested: " << quit_requested(), color_black(), 10.0, 50.0);
        refresh_screen();
    }
}
TEST_CASE_METHOD(TestInputFixture, "reset_quit_integration") {
    open_window("Test Window 3", 800, 600);
    window_cleanup cleanup_window;
    while (quit_requested() == false) {
        process_events();
        clear_screen();
        draw_text("Test: reset_quit", color_black(), 10.0, 10.0);
        draw_text("Close window to test reset quit", color_black(), 10.0, 30.0);
        draw_text("Quit Requested: " << quit_requested(), color_black(), 10.0, 50.0);
        refresh_screen();
    }
    reset_quit();
    while (key_down(key_code::SPACE_KEY) == false) {
        process_events();
        clear_screen();
        draw_text("Test: reset_quit", color_black(), 10.0, 10.0);
        draw_text("Press Space to end test after reset quit", color_black(), 10.0, 30.0);
        draw_text("Key Down: " << key_down(key_code::A_KEY), color_black(), 10.0, 50.0);
        refresh_screen();
    }
}
TEST_CASE_METHOD(TestInputFixture, "any_key_pressed_integration") {
    open_window("Test Window 4", 800, 600);
    window_cleanup cleanup_window;
    while (any_key_pressed() == false) {
        process_events();
        clear_screen();
        draw_text("Test: any_key_pressed", color_black(), 10.0, 10.0);
        draw_text("Press any key to test", color_black(), 10.0, 30.0);
        draw_text("Any Key Pressed: " << any_key_pressed(), color_black(), 10.0, 50.0);
        refresh_screen();
    }
    REQUIRE(any_key_pressed());
}
TEST_CASE_METHOD(TestInputFixture, "deregister_callback_on_key_down_integration") {
    auto callbacks = key_callbacks();
    open_window("Test Window 5", 800, 600);
    window_cleanup cleanup_window;
    register_callback_on_key_down(callbacks.on_key_down());
    while (callbacks.get_key_down() != key_code::A_KEY) {
        process_events();
        clear_screen();
        draw_text("Test: deregister_callback_on_key_down", color_black(), 10.0, 10.0);
        draw_text("Press A to test callback", color_black(), 10.0, 30.0);
        draw_text("Key Down: " << key_down(key_code::A_KEY), color_black(), 10.0, 50.0);
        draw_text("Callback received: " << key_name(callbacks.get_key_down()), color_black(), 10.0, 70.0);
        refresh_screen();
    }
    deregister_callback_on_key_down(callbacks.on_key_down());
    while (key_down(key_code::SPACE_KEY) == false) {
        process_events();
        clear_screen();
        draw_text("Test: deregister_callback_on_key_down", color_black(), 10.0, 10.0);
        draw_text("Press B to test deregistered callback on key down", color_black(), 10.0, 30.0);
        draw_text("Key Down: " << key_down(key_code::B_KEY), color_black(), 10.0, 50.0);
        draw_text("Callback received: " << key_name(callbacks.get_key_down()), color_black(), 10.0, 70.0);
        draw_text("Press Space to end test", color_black(), 10.0, 90.0);
        refresh_screen();
    }
}
TEST_CASE_METHOD(TestInputFixture, "deregister_callback_on_key_typed_integration") {
    auto callbacks = key_callbacks();
    open_window("Test Window 6", 800, 600);
    window_cleanup cleanup_window;
    register_callback_on_key_typed(callbacks.on_key_typed());
    while (callbacks.get_key_typed() != key_code::A_KEY) {
        process_events();
        clear_screen();
        draw_text("Test: deregister_callback_on_key_typed", color_black(), 10.0, 10.0);
        draw_text("Press A to test callback", color_black(), 10.0, 30.0);
        draw_text("Key Typed: " << key_typed(key_code::A_KEY), color_black(), 10.0, 50.0);
        draw_text("Callback received: " << key_name(callbacks.get_key_typed()), color_black(), 10.0, 70.0);
        refresh_screen();
    }
    deregister_callback_on_key_typed(callbacks.on_key_typed());
    while (key_down(key_code::SPACE_KEY) == false) {
        process_events();
        clear_screen();
        draw_text("Test: deregister_callback_on_key_typed", color_black(), 10.0, 10.0);
        draw_text("Press B to test deregistered callback on key typed", color_black(), 10.0, 30.0);
        draw_text("Key Typed: " << key_typed(key_code::B_KEY), color_black(), 10.0, 50.0);
        draw_text("Callback received: " << key_name(callbacks.get_key_typed()), color_black(), 10.0, 70.0);
        draw_text("Press Space to end test", color_black(), 10.0, 90.0);
        refresh_screen();
    }
}
TEST_CASE_METHOD(TestInputFixture, "deregister_callback_on_key_up_integration") {
    auto callbacks = key_callbacks();
    open_window("Test Window 7", 800, 600);
    window_cleanup cleanup_window;
    register_callback_on_key_up(callbacks.on_key_up());
    while (callbacks.get_key_up() != key_code::A_KEY) {
        process_events();
        clear_screen();
        draw_text("Test: deregister_callback_on_key_up", color_black(), 10.0, 10.0);
        draw_text("Press and release A to test callback", color_black(), 10.0, 30.0);
        draw_text("Key Up: " << key_up(key_code::A_KEY), color_black(), 10.0, 50.0);
        draw_text("Callback received: " << key_name(callbacks.get_key_up()), color_black(), 10.0, 70.0);
        refresh_screen();
    }
    deregister_callback_on_key_up(callbacks.on_key_up());
    while (key_down(key_code::SPACE_KEY) == false) {
        process_events();
        clear_screen();
        draw_text("Test: deregister_callback_on_key_up", color_black(), 10.0, 10.0);
        draw_text("Press and release B to test deregistered callback on key up", color_black(), 10.0, 30.0);
        draw_text("Key Up: " << key_up(key_code::B_KEY), color_black(), 10.0, 50.0);
        draw_text("Callback received: " << key_name(callbacks.get_key_up()), color_black(), 10.0, 70.0);
        draw_text("Press Space to end test", color_black(), 10.0, 90.0);
        refresh_screen();
    }
}
TEST_CASE_METHOD(TestInputFixture, "key_down_integration") {
    open_window("Test Window 8", 800, 600);
    window_cleanup cleanup_window;
    while (key_down(key_code::A_KEY) == false) {
        process_events();
        clear_screen();
        draw_text("Test: key_down", color_black(), 10.0, 10.0);
        draw_text("Press and hold A", color_black(), 10.0, 30.0);
        draw_text("Key Down: " << key_down(key_code::A_KEY), color_black(), 10.0, 50.0);
        refresh_screen();
    }
    while (key_down(key_code::A_KEY) != false) {
        process_events();
        clear_screen();
        draw_text("Test: key_down", color_black(), 10.0, 10.0);
        draw_text("Release A", color_black(), 10.0, 30.0);
        draw_text("Key Down: " << key_down(key_code::A_KEY), color_black(), 10.0, 50.0);
        refresh_screen();
    }
}
TEST_CASE_METHOD(TestInputFixture, "key_name_integration") {
    auto callbacks = key_callbacks();
    open_window("Test Window 9", 800, 600);
    window_cleanup cleanup_window;
    register_callback_on_key_typed(callbacks.on_key_typed());
    while (key_down(key_code::A_KEY) == false) {
        process_events();
        clear_screen();
        draw_text("Test: key_name", color_black(), 10.0, 10.0);
        draw_text("Press A to test key name", color_black(), 10.0, 30.0);
        draw_text("Key Name: " << key_name(callbacks.get_key_typed()), color_black(), 10.0, 50.0);
        refresh_screen();
    }
    while (key_down(key_code::RETURN_KEY) == false) {
        process_events();
        clear_screen();
        draw_text("Test: key_name", color_black(), 10.0, 10.0);
        draw_text("Press Enter to test key name", color_black(), 10.0, 30.0);
        draw_text("Key Name: " << key_name(callbacks.get_key_typed()), color_black(), 10.0, 50.0);
        refresh_screen();
    }
}
TEST_CASE_METHOD(TestInputFixture, "key_released_integration") {
    open_window("Test Window 10", 800, 600);
    window_cleanup cleanup_window;
    while (key_released(key_code::A_KEY) == false) {
        process_events();
        clear_screen();
        draw_text("Test: key_released", color_black(), 10.0, 10.0);
        draw_text("Press and release A", color_black(), 10.0, 30.0);
        draw_text("Key Released: " << key_released(key_code::A_KEY), color_black(), 10.0, 50.0);
        refresh_screen();
    }
}
TEST_CASE_METHOD(TestInputFixture, "key_typed_integration") {
    open_window("Test Window 11", 800, 600);
    window_cleanup cleanup_window;
    while (key_typed(key_code::A_KEY) == false) {
        process_events();
        clear_screen();
        draw_text("Test: key_typed", color_black(), 10.0, 10.0);
        draw_text("Press A to test key typed", color_black(), 10.0, 30.0);
        draw_text("Key Typed: " << key_typed(key_code::A_KEY), color_black(), 10.0, 50.0);
        refresh_screen();
    }
}
TEST_CASE_METHOD(TestInputFixture, "key_up_integration") {
    open_window("Test Window 12", 800, 600);
    window_cleanup cleanup_window;
    while (key_up(key_code::A_KEY) == false) {
        process_events();
        clear_screen();
        draw_text("Test: key_up", color_black(), 10.0, 10.0);
        draw_text("Press and release A", color_black(), 10.0, 30.0);
        draw_text("Key Up: " << key_up(key_code::A_KEY), color_black(), 10.0, 50.0);
        refresh_screen();
    }
}
TEST_CASE_METHOD(TestInputFixture, "register_callback_on_key_down_integration") {
    auto callbacks = key_callbacks();
    open_window("Test Window 13", 800, 600);
    window_cleanup cleanup_window;
    register_callback_on_key_down(callbacks.on_key_down());
    while (callbacks.get_key_down() != key_code::A_KEY) {
        process_events();
        clear_screen();
        draw_text("Test: register_callback_on_key_down", color_black(), 10.0, 10.0);
        draw_text("Press A to test callback on key down", color_black(), 10.0, 30.0);
        draw_text("Key Down: " << key_down(key_code::A_KEY), color_black(), 10.0, 50.0);
        draw_text("Callback received: " << key_name(callbacks.get_key_down()), color_black(), 10.0, 70.0);
        refresh_screen();
    }
    deregister_callback_on_key_down(callbacks.on_key_down());
}
TEST_CASE_METHOD(TestInputFixture, "register_callback_on_key_typed_integration") {
    auto callbacks = key_callbacks();
    open_window("Test Window 14", 800, 600);
    window_cleanup cleanup_window;
    register_callback_on_key_typed(callbacks.on_key_typed());
    while (callbacks.get_key_typed() != key_code::A_KEY) {
        process_events();
        clear_screen();
        draw_text("Test: register_callback_on_key_typed", color_black(), 10.0, 10.0);
        draw_text("Press A to test callback on key typed", color_black(), 10.0, 30.0);
        draw_text("Key Typed: " << key_typed(key_code::A_KEY), color_black(), 10.0, 50.0);
        draw_text("Callback received: " << key_name(callbacks.get_key_typed()), color_black(), 10.0, 70.0);
        refresh_screen();
    }
    deregister_callback_on_key_typed(callbacks.on_key_typed());
}
TEST_CASE_METHOD(TestInputFixture, "register_callback_on_key_up_integration") {
    auto callbacks = key_callbacks();
    open_window("Test Window 15", 800, 600);
    window_cleanup cleanup_window;
    register_callback_on_key_up(callbacks.on_key_up());
    while (callbacks.get_key_up() != key_code::A_KEY) {
        process_events();
        clear_screen();
        draw_text("Test: register_callback_on_key_up", color_black(), 10.0, 10.0);
        draw_text("Press and release A to test callback on key up", color_black(), 10.0, 30.0);
        draw_text("Key Up: " << key_up(key_code::A_KEY), color_black(), 10.0, 50.0);
        draw_text("Callback received: " << key_name(callbacks.get_key_up()), color_black(), 10.0, 70.0);
        refresh_screen();
    }
    deregister_callback_on_key_up(callbacks.on_key_up());
}
TEST_CASE_METHOD(TestInputFixture, "hide_mouse_integration") {
    open_window("Test Window 16", 800, 600);
    window_cleanup cleanup_window;
    while (key_down(key_code::H_KEY) == false) {
        process_events();
        clear_screen();
        draw_text("Test: hide_mouse", color_black(), 10.0, 10.0);
        draw_text("Press H to hide mouse", color_black(), 10.0, 30.0);
        draw_text("Mouse Shown: " << mouse_shown(), color_black(), 10.0, 50.0);
        refresh_screen();
    }
    hide_mouse();
    while (key_down(key_code::SPACE_KEY) == false) {
        process_events();
        clear_screen();
        draw_text("Test: hide_mouse", color_black(), 10.0, 10.0);
        draw_text("Mouse Shown: " << mouse_shown(), color_black(), 10.0, 30.0);
        draw_text("Press Space to end test", color_black(), 10.0, 50.0);
        refresh_screen();
    }
    show_mouse();
}
TEST_CASE_METHOD(TestInputFixture, "mouse_clicked_integration") {
    open_window("Test Window 17", 800, 600);
    window_cleanup cleanup_window;
    while (mouse_clicked(mouse_button::LEFT_BUTTON) == false) {
        process_events();
        clear_screen();
        draw_text("Test: mouse_clicked", color_black(), 10.0, 10.0);
        draw_text("Click left mouse button", color_black(), 10.0, 30.0);
        draw_text("Mouse Clicked: " << mouse_clicked(mouse_button::LEFT_BUTTON), color_black(), 10.0, 50.0);
        refresh_screen();
    }
}
TEST_CASE_METHOD(TestInputFixture, "mouse_down_integration") {
    open_window("Test Window 18", 800, 600);
    window_cleanup cleanup_window;
    while (mouse_down(mouse_button::LEFT_BUTTON) == false) {
        process_events();
        clear_screen();
        draw_text("Test: mouse_down", color_black(), 10.0, 10.0);
        draw_text("Press and hold left mouse button", color_black(), 10.0, 30.0);
        draw_text("Mouse Down: " << mouse_down(mouse_button::LEFT_BUTTON), color_black(), 10.0, 50.0);
        refresh_screen();
    }
    while (mouse_down(mouse_button::LEFT_BUTTON) != false) {
        process_events();
        clear_screen();
        draw_text("Test: mouse_down", color_black(), 10.0, 10.0);
        draw_text("Release left mouse button", color_black(), 10.0, 30.0);
        draw_text("Mouse Down: " << mouse_down(mouse_button::LEFT_BUTTON), color_black(), 10.0, 50.0);
        refresh_screen();
    }
}
TEST_CASE_METHOD(TestInputFixture, "mouse_movement_integration") {
    open_window("Test Window 19", 800, 600);
    window_cleanup cleanup_window;
    while (key_down(key_code::SPACE_KEY) == false) {
        process_events();
        clear_screen();
        auto movement = mouse_movement();
        draw_text("Test: mouse_movement", color_black(), 10.0, 10.0);
        draw_text("Move mouse to test movement", color_black(), 10.0, 30.0);
        draw_text("Mouse Movement: X=" << movement.x << ", Y=" << movement.y, color_black(), 10.0, 50.0);
        draw_text("Press Space to end test", color_black(), 10.0, 70.0);
        refresh_screen();
    }
}
TEST_CASE_METHOD(TestInputFixture, "mouse_position_integration") {
    open_window("Test Window 20", 800, 600);
    window_cleanup cleanup_window;
    while (key_down(key_code::SPACE_KEY) == false) {
        process_events();
        clear_screen();
        auto position = mouse_position();
        draw_text("Test: mouse_position", color_black(), 10.0, 10.0);
        draw_text("Move mouse to test position", color_black(), 10.0, 30.0);
        draw_text("Mouse Position: X=" << position.x << ", Y=" << position.y, color_black(), 10.0, 50.0);
        draw_text("Press Space to end test", color_black(), 10.0, 70.0);
        refresh_screen();
    }
}
TEST_CASE_METHOD(TestInputFixture, "mouse_position_vector_integration") {
    open_window("Test Window 21", 800, 600);
    window_cleanup cleanup_window;
    while (key_down(key_code::SPACE_KEY) == false) {
        process_events();
        clear_screen();
        auto position = mouse_position_vector();
        draw_text("Test: mouse_position_vector", color_black(), 10.0, 10.0);
        draw_text("Move mouse to test position", color_black(), 10.0, 30.0);
        draw_text("Mouse Position: X=" << position.x << ", Y=" << position.y, color_black(), 10.0, 50.0);
        draw_text("Press Space to end test", color_black(), 10.0, 70.0);
        refresh_screen();
    }
}
TEST_CASE_METHOD(TestInputFixture, "mouse_shown_integration") {
    open_window("Test Window 22", 800, 600);
    window_cleanup cleanup_window;
    while (key_down(key_code::H_KEY) == false) {
        process_events();
        clear_screen();
        draw_text("Test: mouse_shown", color_black(), 10.0, 10.0);
        draw_text("Press H to hide mouse", color_black(), 10.0, 30.0);
        draw_text("Mouse Shown: " << mouse_shown(), color_black(), 10.0, 50.0);
        refresh_screen();
    }
    hide_mouse();
    REQUIRE_FALSE(mouse_shown());
    while (key_down(key_code::S_KEY) == false) {
        process_events();
        clear_screen();
        draw_text("Test: mouse_shown", color_black(), 10.0, 10.0);
        draw_text("Press S to show mouse", color_black(), 10.0, 30.0);
        draw_text("Mouse Shown: " << mouse_shown(), color_black(), 10.0, 50.0);
        refresh_screen();
    }
    show_mouse();
    REQUIRE(mouse_shown());
}
TEST_CASE_METHOD(TestInputFixture, "mouse_up_integration") {
    open_window("Test Window 23", 800, 600);
    window_cleanup cleanup_window;
    while (mouse_up(mouse_button::LEFT_BUTTON) == false) {
        process_events();
        clear_screen();
        draw_text("Test: mouse_up", color_black(), 10.0, 10.0);
        draw_text("Click and release left mouse button", color_black(), 10.0, 30.0);
        draw_text("Mouse Up: " << mouse_up(mouse_button::LEFT_BUTTON), color_black(), 10.0, 50.0);
        refresh_screen();
    }
}
TEST_CASE_METHOD(TestInputFixture, "mouse_wheel_scroll_integration") {
    open_window("Test Window 24", 800, 600);
    window_cleanup cleanup_window;
    while (key_down(key_code::SPACE_KEY) == false) {
        process_events();
        clear_screen();
        auto scroll = mouse_wheel_scroll();
        draw_text("Test: mouse_wheel_scroll", color_black(), 10.0, 10.0);
        draw_text("Scroll mouse wheel to test", color_black(), 10.0, 30.0);
        draw_text("Scroll Value: X=" << scroll.x << ", Y=" << scroll.y, color_black(), 10.0, 50.0);
        draw_text("Press Space to end test", color_black(), 10.0, 70.0);
        refresh_screen();
    }
}
TEST_CASE_METHOD(TestInputFixture, "mouse_x_integration") {
    open_window("Test Window 25", 800, 600);
    window_cleanup cleanup_window;
    while (key_down(key_code::SPACE_KEY) == false) {
        process_events();
        clear_screen();
        draw_text("Test: mouse_x", color_black(), 10.0, 10.0);
        draw_text("Move mouse to test X position", color_black(), 10.0, 30.0);
        draw_text("Mouse Position: X=" << mouse_x() << ", Y=" << mouse_y(), color_black(), 10.0, 50.0);
        draw_text("Press Space to end test", color_black(), 10.0, 70.0);
        refresh_screen();
    }
}
TEST_CASE_METHOD(TestInputFixture, "mouse_y_integration") {
    open_window("Test Window 26", 800, 600);
    window_cleanup cleanup_window;
    while (key_down(key_code::SPACE_KEY) == false) {
        process_events();
        clear_screen();
        draw_text("Test: mouse_y", color_black(), 10.0, 10.0);
        draw_text("Move mouse to test Y position", color_black(), 10.0, 30.0);
        draw_text("Mouse Position: X=" << mouse_x() << ", Y=" << mouse_y(), color_black(), 10.0, 50.0);
        draw_text("Press Space to end test", color_black(), 10.0, 70.0);
        refresh_screen();
    }
}
TEST_CASE_METHOD(TestInputFixture, "move_mouse_integration") {
    open_window("Test Window 27", 800, 600);
    window_cleanup cleanup_window;
    while (key_down(key_code::M_KEY) == false) {
        process_events();
        clear_screen();
        draw_text("Test: move_mouse", color_black(), 10.0, 10.0);
        draw_text("Press M to move mouse to center", color_black(), 10.0, 30.0);
        draw_text("Mouse Position: X=" << mouse_x() << ", Y=" << mouse_y(), color_black(), 10.0, 50.0);
        refresh_screen();
    }
    while (key_down(key_code::SPACE_KEY) == false) {
        process_events();
        clear_screen();
        draw_text("Test: move_mouse", color_black(), 10.0, 10.0);
        draw_text("Mouse moved to center", color_black(), 10.0, 30.0);
        draw_text("Mouse Position: X=" << mouse_x() << ", Y=" << mouse_y(), color_black(), 10.0, 50.0);
        draw_text("Press Space to end test", color_black(), 10.0, 70.0);
        move_mouse(400.0, 300.0);
        refresh_screen();
    }
}
TEST_CASE_METHOD(TestInputFixture, "move_mouse_to_point_integration") {
    open_window("Test Window 28", 800, 600);
    window_cleanup cleanup_window;
    while (key_down(key_code::M_KEY) == false) {
        process_events();
        clear_screen();
        draw_text("Test: move_mouse_to_point", color_black(), 10.0, 10.0);
        draw_text("Press M to move mouse to center", color_black(), 10.0, 30.0);
        draw_text("Mouse Position: X=" << mouse_x() << ", Y=" << mouse_y(), color_black(), 10.0, 50.0);
        refresh_screen();
    }
    while (key_down(key_code::SPACE_KEY) == false) {
        process_events();
        clear_screen();
        draw_text("Test: move_mouse_to_point", color_black(), 10.0, 10.0);
        draw_text("Mouse moved to center", color_black(), 10.0, 30.0);
        draw_text("Mouse Position: X=" << mouse_x() << ", Y=" << mouse_y(), color_black(), 10.0, 50.0);
        draw_text("Press Space to end test", color_black(), 10.0, 70.0);
        move_mouse(point_at(400.0, 300.0));
        refresh_screen();
    }
}
TEST_CASE_METHOD(TestInputFixture, "show_mouse_integration") {
    open_window("Test Window 29", 800, 600);
    window_cleanup cleanup_window;
    hide_mouse();
    while (key_down(key_code::S_KEY) == false) {
        process_events();
        clear_screen();
        draw_text("Test: show_mouse", color_black(), 10.0, 10.0);
        draw_text("Press S to show mouse", color_black(), 10.0, 30.0);
        draw_text("Mouse Shown: " << mouse_shown(), color_black(), 10.0, 50.0);
        refresh_screen();
    }
    show_mouse();
    while (key_down(key_code::SPACE_KEY) == false) {
        process_events();
        clear_screen();
        draw_text("Test: show_mouse", color_black(), 10.0, 10.0);
        draw_text("Mouse Shown: " << mouse_shown(), color_black(), 10.0, 30.0);
        draw_text("Press Space to end test", color_black(), 10.0, 50.0);
        refresh_screen();
    }
}
TEST_CASE_METHOD(TestInputFixture, "show_mouse_with_boolean_integration") {
    open_window("Test Window 30", 800, 600);
    window_cleanup cleanup_window;
    while (key_down(key_code::H_KEY) == false) {
        process_events();
        clear_screen();
        draw_text("Test: show_mouse_with_boolean", color_black(), 10.0, 10.0);
        draw_text("Press H to hide mouse", color_black(), 10.0, 30.0);
        draw_text("Mouse Shown: " << mouse_shown(), color_black(), 10.0, 50.0);
        refresh_screen();
    }
    show_mouse(false);
    REQUIRE_FALSE(mouse_shown());
    while (key_down(key_code::S_KEY) == false) {
        process_events();
        clear_screen();
        draw_text("Test: show_mouse_with_boolean", color_black(), 10.0, 10.0);
        draw_text("Press S to show mouse", color_black(), 10.0, 30.0);
        draw_text("Mouse Shown: " << mouse_shown(), color_black(), 10.0, 50.0);
        refresh_screen();
    }
    show_mouse(true);
    REQUIRE(mouse_shown());
}
TEST_CASE_METHOD(TestInputFixture, "draw_collected_text_integration") {
    open_window("Test Window 31", 800, 600);
    window_cleanup cleanup_window;
    auto test_font = load_font("test_font", "hara.ttf");
    font_cleanup cleanup_font;
    start_reading_text(rectangle_from(100.0, 100.0, 200.0, 30.0));
    while (key_down(key_code::RETURN_KEY) == false) {
        process_events();
        clear_screen();
        draw_text("Test: draw_collected_text", color_black(), 10.0, 10.0);
        draw_text("Type some text, press Enter when done", color_black(), 10.0, 30.0);
        draw_collected_text(color_black(), test_font, 18, option_defaults());
        refresh_screen();
    }
    end_reading_text();
}
TEST_CASE_METHOD(TestInputFixture, "end_reading_text_integration") {
    open_window("Test Window 32", 800, 600);
    window_cleanup cleanup_window;
    start_reading_text(rectangle_from(100.0, 100.0, 200.0, 30.0));
    REQUIRE(reading_text());
    while (key_down(key_code::RETURN_KEY) == false) {
        process_events();
        clear_screen();
        draw_text("Test: end_reading_text", color_black(), 10.0, 10.0);
        draw_text("Type some text, press Enter when done", color_black(), 10.0, 30.0);
        draw_text("Reading Text: " << reading_text(), color_black(), 10.0, 50.0);
        refresh_screen();
    }
    end_reading_text();
    REQUIRE_FALSE(reading_text());
    while (key_down(key_code::SPACE_KEY) == false) {
        process_events();
        clear_screen();
        draw_text("Test: end_reading_text", color_black(), 10.0, 10.0);
        draw_text("Text input ended", color_black(), 10.0, 30.0);
        draw_text("Reading Text: " << reading_text(), color_black(), 10.0, 50.0);
        draw_text("Press Space to end test", color_black(), 10.0, 70.0);
        refresh_screen();
    }
}
TEST_CASE_METHOD(TestInputFixture, "end_reading_text_in_window_integration") {
    auto test_window = open_window("Test Window 33", 800, 600);
    window_cleanup cleanup_window;
    auto test_rectangle = rectangle_from(100.0, 100.0, 200.0, 30.0);
    start_reading_text(test_window, test_rectangle);
    REQUIRE(reading_text());
    while (key_down(key_code::RETURN_KEY) == false) {
        process_events();
        clear_screen();
        draw_text("Test: end_reading_text_in_window", color_black(), 10.0, 10.0);
        draw_text("Type some text, press Enter when done", color_black(), 10.0, 30.0);
        draw_text("Reading Text: " << reading_text(test_window), color_black(), 10.0, 50.0);
        refresh_screen();
    }
    end_reading_text(test_window);
    REQUIRE_FALSE(reading_text());
    while (key_down(key_code::SPACE_KEY) == false) {
        process_events();
        clear_screen();
        draw_text("Test: end_reading_text_in_window", color_black(), 10.0, 10.0);
        draw_text("Text input ended", color_black(), 10.0, 30.0);
        draw_text("Reading Text: " << reading_text(test_window), color_black(), 10.0, 50.0);
        draw_text("Press Space to end test", color_black(), 10.0, 70.0);
        refresh_screen();
    }
}
TEST_CASE_METHOD(TestInputFixture, "reading_text_integration") {
    open_window("Test Window 34", 800, 600);
    window_cleanup cleanup_window;
    start_reading_text(rectangle_from(100.0, 100.0, 200.0, 30.0));
    REQUIRE(reading_text());
    while (key_down(key_code::RETURN_KEY) == false) {
        process_events();
        clear_screen();
        draw_text("Test: reading_text", color_black(), 10.0, 10.0);
        draw_text("Type some text, press Enter when done", color_black(), 10.0, 30.0);
        draw_text("Reading Text: " << reading_text(), color_black(), 10.0, 50.0);
        refresh_screen();
    }
    end_reading_text();
    REQUIRE_FALSE(reading_text());
}
TEST_CASE_METHOD(TestInputFixture, "reading_text_in_window_integration") {
    auto test_window = open_window("Test Window 35", 800, 600);
    window_cleanup cleanup_window;
    auto test_rectangle = rectangle_from(100.0, 100.0, 200.0, 30.0);
    start_reading_text(test_window, test_rectangle);
    REQUIRE(reading_text(test_window));
    while (key_down(key_code::RETURN_KEY) == false) {
        process_events();
        clear_screen();
        draw_text("Test: reading_text_in_window", color_black(), 10.0, 10.0);
        draw_text("Type some text, press Enter when done", color_black(), 10.0, 30.0);
        draw_text("Reading Text: " << reading_text(test_window), color_black(), 10.0, 50.0);
        refresh_screen();
    }
    end_reading_text(test_window);
    REQUIRE_FALSE(reading_text(test_window));
}
TEST_CASE_METHOD(TestInputFixture, "start_reading_text_integration") {
    open_window("Test Window 36", 800, 600);
    window_cleanup cleanup_window;
    auto test_rect = rectangle_from(100.0, 100.0, 200.0, 30.0);
    start_reading_text(test_rect);
    REQUIRE(reading_text());
    while (key_down(key_code::RETURN_KEY) == false) {
        process_events();
        clear_screen();
        draw_text("Test: start_reading_text", color_black(), 10.0, 10.0);
        draw_text("Type some text, press Enter when done", color_black(), 10.0, 30.0);
        draw_text("Current Text: " << text_input(), color_black(), 10.0, 50.0);
        refresh_screen();
    }
    end_reading_text();
    REQUIRE_FALSE(reading_text());
}
TEST_CASE_METHOD(TestInputFixture, "start_reading_text_with_initial_text_integration") {
    open_window("Test Window 37", 800, 600);
    window_cleanup cleanup_window;
    auto test_rect = rectangle_from(100.0, 100.0, 200.0, 30.0);
    start_reading_text(test_rect, "Initial Text");
    REQUIRE(reading_text());
    while (key_down(key_code::RETURN_KEY) == false) {
        process_events();
        clear_screen();
        draw_text("Test: start_reading_text_with_initial_text", color_black(), 10.0, 10.0);
        draw_text("Type some text, press Enter when done", color_black(), 10.0, 30.0);
        draw_text("Current Text: " << text_input(), color_black(), 10.0, 50.0);
        refresh_screen();
    }
    end_reading_text();
    REQUIRE_FALSE(reading_text());
}
TEST_CASE_METHOD(TestInputFixture, "start_reading_text_in_window_integration") {
    auto test_window = open_window("Test Window 38", 800, 600);
    window_cleanup cleanup_window;
    auto test_rect = rectangle_from(100.0, 100.0, 200.0, 30.0);
    start_reading_text(test_window, test_rect);
    REQUIRE(reading_text());
    while (key_down(key_code::RETURN_KEY) == false) {
        process_events();
        clear_screen();
        draw_text("Test: start_reading_text_in_window", color_black(), 10.0, 10.0);
        draw_text("Type some text, press Enter when done", color_black(), 10.0, 30.0);
        draw_text("Current Text: " << text_input(test_window), color_black(), 10.0, 50.0);
        refresh_screen();
    }
    end_reading_text(test_window);
    REQUIRE_FALSE(reading_text());
}
TEST_CASE_METHOD(TestInputFixture, "start_reading_text_in_window_with_initial_text_integration") {
    auto test_window = open_window("Test Window 39", 800, 600);
    window_cleanup cleanup_window;
    auto test_rect = rectangle_from(100.0, 100.0, 200.0, 30.0);
    start_reading_text(test_window, test_rect, "Initial Text");
    REQUIRE(reading_text());
    while (key_down(key_code::RETURN_KEY) == false) {
        process_events();
        clear_screen();
        draw_text("Test: start_reading_text_in_window_with_initial_text", color_black(), 10.0, 10.0);
        draw_text("Type some text, press Enter when done", color_black(), 10.0, 30.0);
        draw_text("Current Text: " << text_input(test_window), color_black(), 10.0, 50.0);
        refresh_screen();
    }
    end_reading_text(test_window);
    REQUIRE_FALSE(reading_text());
}
TEST_CASE_METHOD(TestInputFixture, "text_entry_cancelled_integration") {
    open_window("Test Window 40", 800, 600);
    window_cleanup cleanup_window;
    start_reading_text(rectangle_from(100.0, 100.0, 200.0, 30.0));
    while (key_down(key_code::SPACE_KEY) == false) {
        process_events();
        clear_screen();
        draw_text("Test: text_entry_cancelled", color_black(), 10.0, 10.0);
        draw_text("Press Escape to cancel text entry", color_black(), 10.0, 30.0);
        draw_text("Text Entry Cancelled: " << text_entry_cancelled(), color_black(), 10.0, 50.0);
        draw_text("Press space to end test", color_black(), 10.0, 70.0);
        refresh_screen();
    }
    end_reading_text();
}
TEST_CASE_METHOD(TestInputFixture, "text_entry_cancelled_in_window_integration") {
    auto test_window = open_window("Test Window 41", 800, 600);
    window_cleanup cleanup_window;
    auto test_rect = rectangle_from(100.0, 100.0, 200.0, 30.0);
    start_reading_text(test_window, test_rect);
    while (key_down(key_code::SPACE_KEY) == false) {
        process_events();
        clear_screen();
        draw_text("Test: text_entry_cancelled_in_window", color_black(), 10.0, 10.0);
        draw_text("Press Escape to cancel text entry", color_black(), 10.0, 30.0);
        draw_text("Text Entry Cancelled: " << text_entry_cancelled(test_window), color_black(), 10.0, 50.0);
        draw_text("Press space to end test", color_black(), 10.0, 70.0);
        refresh_screen();
    }
    REQUIRE(text_entry_cancelled(test_window));
    end_reading_text(test_window);
}
TEST_CASE_METHOD(TestInputFixture, "text_input_integration") {
    open_window("Test Window 42", 800, 600);
    window_cleanup cleanup_window;
    start_reading_text(rectangle_from(100.0, 100.0, 200.0, 30.0));
    while (key_down(key_code::RETURN_KEY) == false) {
        process_events();
        clear_screen();
        draw_text("Test: text_input", color_black(), 10.0, 10.0);
        draw_text("Type some text, press Enter when done", color_black(), 10.0, 30.0);
        draw_text("Current Text: " << text_input(), color_black(), 10.0, 50.0);
        refresh_screen();
    }
    end_reading_text();
}
TEST_CASE_METHOD(TestInputFixture, "text_input_in_window_integration") {
    auto test_window = open_window("Test Window 43", 800, 600);
    window_cleanup cleanup_window;
    auto test_rect = rectangle_from(100.0, 100.0, 200.0, 30.0);
    start_reading_text(test_window, test_rect);
    while (key_down(key_code::RETURN_KEY) == false) {
        process_events();
        clear_screen();
        draw_text("Test: text_input_in_window", color_black(), 10.0, 10.0);
        draw_text("Type some text, press Enter when done", color_black(), 10.0, 30.0);
        draw_text("Current Text: " << text_input(test_window), color_black(), 10.0, 50.0);
        refresh_screen();
    }
    end_reading_text(test_window);
}
