#include "splashkit.h"
#include <catch2/catch.hpp>

class TestInput {
public:
    TEST_CASE("process_events_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        while (key_typed(KeyCode::A_KEY) == false) {
            process_events();
            clear_screen();
            draw_text("Press A to test events", color_black(), 10, 10);
            draw_text(string("Key Typed: " << key_typed(KeyCode::A_KEY) << ""), color_black(), 10, 30);
            refresh_screen();
        }
        while (mouse_clicked(MouseButton::LEFT_BUTTON) == false) {
            process_events();
            clear_screen();
            draw_text("Click left mouse button to test events", color_black(), 10, 10);
            draw_text(string("Mouse Clicked: " << mouse_clicked(MouseButton::LEFT_BUTTON) << ""), color_black(), 10, 30);
            refresh_screen();
        }
        close_window(test_window);
    }
    TEST_CASE("quit_requested_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        while (quit_requested() == false) {
            process_events();
            clear_screen();
            draw_text("Press Escape to test quit", color_black(), 10, 10);
            draw_text(string("Quit Requested: " << quit_requested() << ""), color_black(), 10, 30);
            refresh_screen();
        }
        close_window(test_window);
    }
    TEST_CASE("reset_quit_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        while (quit_requested() == false) {
            process_events();
            clear_screen();
            draw_text("Press Escape to test quit", color_black(), 10, 10);
            draw_text(string("Quit Requested: " << quit_requested() << ""), color_black(), 10, 30);
            refresh_screen();
            reset_quit();
        }
        while (key_down(KeyCode::A_KEY) == false) {
            process_events();
            clear_screen();
            draw_text("Press A to continue after reset", color_black(), 10, 10);
            draw_text(string("Key Down: " << key_down(KeyCode::A_KEY) << ""), color_black(), 10, 30);
            refresh_screen();
        }
        close_window(test_window);
    }
    TEST_CASE("any_key_pressed_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        while (any_key_pressed() == false) {
            process_events();
            clear_screen();
            draw_text("Press any key to test", color_black(), 10, 10);
            draw_text(string("Any Key Pressed: " << any_key_pressed() << ""), color_black(), 10, 30);
            refresh_screen();
        }
        close_window(test_window);
    }
    TEST_CASE("deregister_callback_on_key_down_integration") {
        auto callbacks = key_callbacks();
        auto test_window = open_window("Test Window", 800, 600);
        register_callback_on_key_down(callbacks->on_key_down);
        while (key_down(KeyCode::A_KEY) == false) {
            process_events();
            clear_screen();
            draw_text("Press A to test callback", color_black(), 10, 10);
            draw_text(string("Key Down: " << key_down(KeyCode::A_KEY) << ""), color_black(), 10, 30);
            draw_text(string("Callback received: " << callbacks->get_key_down << ""), color_black(), 10, 50);
            refresh_screen();
            deregister_callback_on_key_down(callbacks->on_key_down);
        }
        while (key_down(KeyCode::B_KEY) == false) {
            process_events();
            clear_screen();
            draw_text("Press B to test deregistered callback", color_black(), 10, 10);
            draw_text(string("Key Down: " << key_down(KeyCode::B_KEY) << ""), color_black(), 10, 30);
            draw_text(string("Callback received: " << callbacks->get_key_down << ""), color_black(), 10, 50);
            refresh_screen();
        }
        close_window(test_window);
    }
    TEST_CASE("deregister_callback_on_key_typed_integration") {
        auto callbacks = key_callbacks();
        auto test_window = open_window("Test Window", 800, 600);
        register_callback_on_key_typed(callbacks->on_key_typed);
        while (key_typed(KeyCode::A_KEY) == false) {
            process_events();
            clear_screen();
            draw_text("Press A to test callback", color_black(), 10, 10);
            draw_text(string("Key Typed: " << key_typed(KeyCode::A_KEY) << ""), color_black(), 10, 30);
            draw_text(string("Callback received: " << callbacks->get_key_typed << ""), color_black(), 10, 50);
            refresh_screen();
            deregister_callback_on_key_typed(callbacks->on_key_typed);
        }
        while (key_typed(KeyCode::B_KEY) == false) {
            process_events();
            clear_screen();
            draw_text("Press B to test deregistered callback", color_black(), 10, 10);
            draw_text(string("Key Typed: " << key_typed(KeyCode::B_KEY) << ""), color_black(), 10, 30);
            draw_text(string("Callback received: " << callbacks->get_key_typed << ""), color_black(), 10, 50);
            refresh_screen();
        }
        close_window(test_window);
    }
    TEST_CASE("deregister_callback_on_key_up_integration") {
        auto callbacks = key_callbacks();
        auto test_window = open_window("Test Window", 800, 600);
        register_callback_on_key_up(callbacks->on_key_up);
        while (key_up(KeyCode::A_KEY) == false) {
            process_events();
            clear_screen();
            draw_text("Press and release A to test callback", color_black(), 10, 10);
            draw_text(string("Key Up: " << key_up(KeyCode::A_KEY) << ""), color_black(), 10, 30);
            draw_text(string("Callback received: " << callbacks->get_key_up << ""), color_black(), 10, 50);
            refresh_screen();
            deregister_callback_on_key_up(callbacks->on_key_up);
        }
        while (key_up(KeyCode::B_KEY) == false) {
            process_events();
            clear_screen();
            draw_text("Press and release B to test deregistered callback", color_black(), 10, 10);
            draw_text(string("Key Up: " << key_up(KeyCode::B_KEY) << ""), color_black(), 10, 30);
            draw_text(string("Callback received: " << callbacks->get_key_up << ""), color_black(), 10, 50);
            refresh_screen();
        }
        close_window(test_window);
    }
    TEST_CASE("key_down_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        while (key_down(KeyCode::A_KEY) == false) {
            process_events();
            clear_screen();
            draw_text("Press and hold A", color_black(), 10, 10);
            draw_text(string("Key Down: " << key_down(KeyCode::A_KEY) << ""), color_black(), 10, 30);
            refresh_screen();
        }
        while (key_down(KeyCode::A_KEY) != false) {
            process_events();
            clear_screen();
            draw_text("Release A", color_black(), 10, 10);
            draw_text(string("Key Down: " << key_down(KeyCode::A_KEY) << ""), color_black(), 10, 30);
            refresh_screen();
        }
        close_window(test_window);
    }
    TEST_CASE("key_name_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        while (key_down(KeyCode::A_KEY) == false) {
            process_events();
            clear_screen();
            draw_text("Press A to test key name", color_black(), 10, 10);
            draw_text(string("Key Name: " << key_name(KeyCode::A_KEY) << ""), color_black(), 10, 30);
            refresh_screen();
        }
        while (key_down(KeyCode::KEYPAD_ENTER) == false) {
            process_events();
            clear_screen();
            draw_text("Press Enter to test key name", color_black(), 10, 10);
            draw_text(string("Key Name: " << key_name(KeyCode::KEYPAD_ENTER) << ""), color_black(), 10, 30);
            refresh_screen();
        }
        close_window(test_window);
    }
    TEST_CASE("key_released_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        while (key_released(KeyCode::A_KEY) == false) {
            process_events();
            clear_screen();
            draw_text("Press and release A", color_black(), 10, 10);
            draw_text(string("Key Released: " << key_released(KeyCode::A_KEY) << ""), color_black(), 10, 30);
            refresh_screen();
        }
        close_window(test_window);
    }
    TEST_CASE("key_typed_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        while (key_typed(KeyCode::A_KEY) == false) {
            process_events();
            clear_screen();
            draw_text("Press A to test key typed", color_black(), 10, 10);
            draw_text(string("Key Typed: " << key_typed(KeyCode::A_KEY) << ""), color_black(), 10, 30);
            refresh_screen();
        }
        close_window(test_window);
    }
    TEST_CASE("key_up_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        while (key_up(KeyCode::A_KEY) == false) {
            process_events();
            clear_screen();
            draw_text("Press and release A", color_black(), 10, 10);
            draw_text(string("Key Up: " << key_up(KeyCode::A_KEY) << ""), color_black(), 10, 30);
            refresh_screen();
        }
        close_window(test_window);
    }
    TEST_CASE("register_callback_on_key_down_integration") {
        auto callbacks = key_callbacks();
        auto test_window = open_window("Test Window", 800, 600);
        register_callback_on_key_down(callbacks->on_key_down);
        while (key_down(KeyCode::A_KEY) == false) {
            process_events();
            clear_screen();
            draw_text("Press A to test callback", color_black(), 10, 10);
            draw_text(string("Key Down: " << key_down(KeyCode::A_KEY) << ""), color_black(), 10, 30);
            draw_text(string("Callback received: " << callbacks->get_key_down << ""), color_black(), 10, 50);
            refresh_screen();
        }
        deregister_callback_on_key_down(callbacks->on_key_down);
        close_window(test_window);
    }
    TEST_CASE("register_callback_on_key_typed_integration") {
        auto callbacks = key_callbacks();
        auto test_window = open_window("Test Window", 800, 600);
        register_callback_on_key_typed(callbacks->on_key_typed);
        while (key_typed(KeyCode::A_KEY) == false) {
            process_events();
            clear_screen();
            draw_text("Press A to test callback", color_black(), 10, 10);
            draw_text(string("Key Typed: " << key_typed(KeyCode::A_KEY) << ""), color_black(), 10, 30);
            draw_text(string("Callback received: " << callbacks->get_key_typed << ""), color_black(), 10, 50);
            refresh_screen();
        }
        deregister_callback_on_key_typed(callbacks->on_key_typed);
        close_window(test_window);
    }
    TEST_CASE("register_callback_on_key_up_integration") {
        auto callbacks = key_callbacks();
        auto test_window = open_window("Test Window", 800, 600);
        register_callback_on_key_up(callbacks->on_key_up);
        while (key_up(KeyCode::A_KEY) == false) {
            process_events();
            clear_screen();
            draw_text("Press and release A to test callback", color_black(), 10, 10);
            draw_text(string("Key Up: " << key_up(KeyCode::A_KEY) << ""), color_black(), 10, 30);
            draw_text(string("Callback received: " << callbacks->get_key_up << ""), color_black(), 10, 50);
            refresh_screen();
        }
        deregister_callback_on_key_up(callbacks->on_key_up);
        close_window(test_window);
    }
    TEST_CASE("hide_mouse_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        while (key_down(KeyCode::H_KEY) == false) {
            process_events();
            clear_screen();
            draw_text("Press H to hide mouse", color_black(), 10, 10);
            draw_text(string("Mouse Shown: " << mouse_shown() << ""), color_black(), 10, 30);
            refresh_screen();
            hide_mouse();
        }
        while (key_down(KeyCode::S_KEY) == false) {
            process_events();
            clear_screen();
            draw_text("Press S to show mouse", color_black(), 10, 10);
            draw_text(string("Mouse Shown: " << mouse_shown() << ""), color_black(), 10, 30);
            refresh_screen();
        }
        show_mouse();
        close_window(test_window);
    }
    TEST_CASE("mouse_clicked_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        while (mouse_clicked(MouseButton::LEFT_BUTTON) == false) {
            process_events();
            clear_screen();
            draw_text("Click left mouse button", color_black(), 10, 10);
            draw_text(string("Mouse Clicked: " << mouse_clicked(MouseButton::LEFT_BUTTON) << ""), color_black(), 10, 30);
            refresh_screen();
        }
        close_window(test_window);
    }
    TEST_CASE("mouse_down_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        while (mouse_down(MouseButton::LEFT_BUTTON) == false) {
            process_events();
            clear_screen();
            draw_text("Press and hold left mouse button", color_black(), 10, 10);
            draw_text(string("Mouse Down: " << mouse_down(MouseButton::LEFT_BUTTON) << ""), color_black(), 10, 30);
            refresh_screen();
        }
        while (mouse_down(MouseButton::LEFT_BUTTON) != false) {
            process_events();
            clear_screen();
            draw_text("Release left mouse button", color_black(), 10, 10);
            draw_text(string("Mouse Down: " << mouse_down(MouseButton::LEFT_BUTTON) << ""), color_black(), 10, 30);
            refresh_screen();
        }
        close_window(test_window);
    }
    TEST_CASE("mouse_movement_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        while (key_down(KeyCode::SPACE_KEY) == false) {
            process_events();
            clear_screen();
            auto movement = mouse_movement();
            draw_text("Move mouse to test movement", color_black(), 10, 10);
            draw_text(string("Mouse Position: X=" << mouse_x() << ", Y=" << mouse_y() << ""), color_black(), 10, 30);
            draw_text("Press Space to end test", color_black(), 10, 50);
            refresh_screen();
        }
        close_window(test_window);
    }
    TEST_CASE("mouse_position_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        while (key_down(KeyCode::SPACE_KEY) == false) {
            process_events();
            clear_screen();
            auto position = mouse_position();
            draw_text("Move mouse to test position", color_black(), 10, 10);
            draw_text(string("Mouse Position: X=" << mouse_x() << ", Y=" << mouse_y() << ""), color_black(), 10, 30);
            draw_text("Press Space to end test", color_black(), 10, 50);
            refresh_screen();
        }
        close_window(test_window);
    }
    TEST_CASE("mouse_position_vector_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        while (key_down(KeyCode::SPACE_KEY) == false) {
            process_events();
            clear_screen();
            auto position = mouse_position_vector();
            draw_text("Move mouse to test position", color_black(), 10, 10);
            draw_text(string("Mouse Position: X=" << mouse_x() << ", Y=" << mouse_y() << ""), color_black(), 10, 30);
            draw_text("Press Space to end test", color_black(), 10, 50);
            refresh_screen();
        }
        close_window(test_window);
    }
    TEST_CASE("mouse_shown_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        while (key_down(KeyCode::H_KEY) == false) {
            process_events();
            clear_screen();
            draw_text("Press H to hide mouse", color_black(), 10, 10);
            draw_text(string("Mouse Shown: " << mouse_shown() << ""), color_black(), 10, 30);
            refresh_screen();
            hide_mouse();
        }
        while (key_down(KeyCode::S_KEY) == false) {
            process_events();
            clear_screen();
            draw_text("Press S to show mouse", color_black(), 10, 10);
            draw_text(string("Mouse Shown: " << mouse_shown() << ""), color_black(), 10, 30);
            refresh_screen();
        }
        show_mouse();
        close_window(test_window);
    }
    TEST_CASE("mouse_up_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        while (mouse_up(MouseButton::LEFT_BUTTON) == false) {
            process_events();
            clear_screen();
            draw_text("Click and release left mouse button", color_black(), 10, 10);
            draw_text(string("Mouse Up: " << mouse_up(MouseButton::LEFT_BUTTON) << ""), color_black(), 10, 30);
            refresh_screen();
        }
        close_window(test_window);
    }
    TEST_CASE("mouse_wheel_scroll_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        while (key_down(KeyCode::SPACE_KEY) == false) {
            process_events();
            clear_screen();
            auto scroll = mouse_wheel_scroll();
            draw_text("Scroll mouse wheel to test", color_black(), 10, 10);
            draw_text(string("Mouse Position: X=" << mouse_x() << ", Y=" << mouse_y() << ""), color_black(), 10, 30);
            draw_text("Press Space to end test", color_black(), 10, 50);
            refresh_screen();
        }
        close_window(test_window);
    }
    TEST_CASE("mouse_x_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        while (key_down(KeyCode::SPACE_KEY) == false) {
            process_events();
            clear_screen();
            draw_text("Move mouse to test X position", color_black(), 10, 10);
            draw_text(string("Mouse Position: X=" << mouse_x() << ", Y=" << mouse_y() << ""), color_black(), 10, 30);
            draw_text("Press Space to end test", color_black(), 10, 50);
            refresh_screen();
        }
        close_window(test_window);
    }
    TEST_CASE("mouse_y_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        while (key_down(KeyCode::SPACE_KEY) == false) {
            process_events();
            clear_screen();
            draw_text("Move mouse to test Y position", color_black(), 10, 10);
            draw_text(string("Mouse Position: X=" << mouse_x() << ", Y=" << mouse_y() << ""), color_black(), 10, 30);
            draw_text("Press Space to end test", color_black(), 10, 50);
            refresh_screen();
        }
        close_window(test_window);
    }
    TEST_CASE("move_mouse_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        while (key_down(KeyCode::M_KEY) == false) {
            process_events();
            clear_screen();
            draw_text("Press M to move mouse to center", color_black(), 10, 10);
            draw_text(string("Mouse Position: X=" << mouse_x() << ", Y=" << mouse_y() << ""), color_black(), 10, 30);
            refresh_screen();
            move_mouse(400, 300);
        }
        while (key_down(KeyCode::SPACE_KEY) == false) {
            process_events();
            clear_screen();
            draw_text("Mouse moved to center", color_black(), 10, 10);
            draw_text(string("Mouse Position: X=" << mouse_x() << ", Y=" << mouse_y() << ""), color_black(), 10, 30);
            draw_text("Press Space to end test", color_black(), 10, 50);
            refresh_screen();
        }
        close_window(test_window);
    }
    TEST_CASE("move_mouse_to_point_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        while (key_down(KeyCode::M_KEY) == false) {
            process_events();
            clear_screen();
            draw_text("Press M to move mouse to center", color_black(), 10, 10);
            draw_text(string("Mouse Position: X=" << mouse_x() << ", Y=" << mouse_y() << ""), color_black(), 10, 30);
            refresh_screen();
            move_mouse(point_at(400, 300));
        }
        while (key_down(KeyCode::SPACE_KEY) == false) {
            process_events();
            clear_screen();
            draw_text("Mouse moved to center", color_black(), 10, 10);
            draw_text(string("Mouse Position: X=" << mouse_x() << ", Y=" << mouse_y() << ""), color_black(), 10, 30);
            draw_text("Press Space to end test", color_black(), 10, 50);
            refresh_screen();
        }
        close_window(test_window);
    }
    TEST_CASE("show_mouse_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        while (key_down(KeyCode::H_KEY) == false) {
            process_events();
            clear_screen();
            draw_text("Press H to hide mouse", color_black(), 10, 10);
            draw_text(string("Mouse Shown: " << mouse_shown() << ""), color_black(), 10, 30);
            refresh_screen();
            hide_mouse();
        }
        while (key_down(KeyCode::S_KEY) == false) {
            process_events();
            clear_screen();
            draw_text("Press S to show mouse", color_black(), 10, 10);
            draw_text(string("Mouse Shown: " << mouse_shown() << ""), color_black(), 10, 30);
            refresh_screen();
        }
        show_mouse();
        close_window(test_window);
    }
    TEST_CASE("show_mouse_with_boolean_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        while (key_down(KeyCode::H_KEY) == false) {
            process_events();
            clear_screen();
            draw_text("Press H to hide mouse", color_black(), 10, 10);
            draw_text(string("Mouse Shown: " << mouse_shown() << ""), color_black(), 10, 30);
            refresh_screen();
            show_mouse(false);
        }
        while (key_down(KeyCode::S_KEY) == false) {
            process_events();
            clear_screen();
            draw_text("Press S to show mouse", color_black(), 10, 10);
            draw_text(string("Mouse Shown: " << mouse_shown() << ""), color_black(), 10, 30);
            refresh_screen();
        }
        show_mouse(true);
        close_window(test_window);
    }
    TEST_CASE("draw_collected_text_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        auto test_font = load_font("test_font", "hara.ttf");
        start_reading_text(rectangle_from(100, 100, 200, 30));
        while (key_down(KeyCode::KEYPAD_ENTER) == false) {
            process_events();
            clear_screen();
            draw_text("Type some text, press Enter when done", color_black(), 10, 10);
            draw_collected_text(color_black(), test_font, 18, option_defaults());
            refresh_screen();
        }
        end_reading_text();
        free_font(test_font);
        close_window(test_window);
    }
    TEST_CASE("end_reading_text_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        start_reading_text(rectangle_from(100, 100, 200, 30));
        while (key_down(KeyCode::KEYPAD_ENTER) == false) {
            process_events();
            clear_screen();
            draw_text("Type some text, press Enter when done", color_black(), 10, 10);
            draw_text(string("Reading Text: " << reading_text() << ""), color_black(), 10, 30);
            refresh_screen();
            end_reading_text();
        }
        while (key_down(KeyCode::SPACE_KEY) == false) {
            process_events();
            clear_screen();
            draw_text("Text input ended", color_black(), 10, 10);
            draw_text(string("Reading Text: " << reading_text() << ""), color_black(), 10, 30);
            draw_text("Press Space to end test", color_black(), 10, 50);
            refresh_screen();
        }
        close_window(test_window);
    }
    TEST_CASE("end_reading_text_in_window_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        auto test_rectangle = rectangle_from(100, 100, 200, 30);
        start_reading_text(test_window, test_rectangle);
        while (key_down(KeyCode::KEYPAD_ENTER) == false) {
            process_events();
            clear_screen();
            draw_text("Type some text, press Enter when done", color_black(), 10, 10);
            draw_text(string("Reading Text: " << reading_text(test_window) << ""), color_black(), 10, 30);
            refresh_screen();
            end_reading_text(test_window);
        }
        while (key_down(KeyCode::SPACE_KEY) == false) {
            process_events();
            clear_screen();
            draw_text("Text input ended", color_black(), 10, 10);
            draw_text(string("Reading Text: " << reading_text(test_window) << ""), color_black(), 10, 30);
            draw_text("Press Space to end test", color_black(), 10, 50);
            refresh_screen();
        }
        close_window(test_window);
    }
    TEST_CASE("reading_text_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        start_reading_text(rectangle_from(100, 100, 200, 30));
        while (key_down(KeyCode::KEYPAD_ENTER) == false) {
            process_events();
            clear_screen();
            draw_text("Type some text, press Enter when done", color_black(), 10, 10);
            draw_text(string("Reading Text: " << reading_text() << ""), color_black(), 10, 30);
            refresh_screen();
        }
        end_reading_text();
        close_window(test_window);
    }
    TEST_CASE("reading_text_in_window_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        auto test_rectangle = rectangle_from(100, 100, 200, 30);
        start_reading_text(test_window, test_rectangle);
        while (key_down(KeyCode::KEYPAD_ENTER) == false) {
            process_events();
            clear_screen();
            draw_text("Type some text, press Enter when done", color_black(), 10, 10);
            draw_text(string("Reading Text: " << reading_text(test_window) << ""), color_black(), 10, 30);
            refresh_screen();
        }
        end_reading_text(test_window);
        close_window(test_window);
    }
    TEST_CASE("start_reading_text_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        auto test_rect = rectangle_from(100, 100, 200, 30);
        start_reading_text(test_rect);
        while (key_down(KeyCode::KEYPAD_ENTER) == false) {
            process_events();
            clear_screen();
            draw_text("Type some text, press Enter when done", color_black(), 10, 10);
            draw_text(string("Current Text: " << text_input() << ""), color_black(), 10, 30);
            refresh_screen();
        }
        end_reading_text();
        close_window(test_window);
    }
    TEST_CASE("start_reading_text_with_initial_text_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        auto test_rect = rectangle_from(100, 100, 200, 30);
        start_reading_text(test_rect, "Initial Text");
        while (key_down(KeyCode::KEYPAD_ENTER) == false) {
            process_events();
            clear_screen();
            draw_text("Type some text, press Enter when done", color_black(), 10, 10);
            draw_text(string("Current Text: " << text_input() << ""), color_black(), 10, 30);
            refresh_screen();
        }
        end_reading_text();
        close_window(test_window);
    }
    TEST_CASE("start_reading_text_in_window_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        auto test_rect = rectangle_from(100, 100, 200, 30);
        start_reading_text(test_window, test_rect);
        while (key_down(KeyCode::KEYPAD_ENTER) == false) {
            process_events();
            clear_screen();
            draw_text("Type some text, press Enter when done", color_black(), 10, 10);
            draw_text(string("Current Text: " << text_input(test_window) << ""), color_black(), 10, 30);
            refresh_screen();
        }
        end_reading_text(test_window);
        close_window(test_window);
    }
    TEST_CASE("start_reading_text_in_window_with_initial_text_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        auto test_rect = rectangle_from(100, 100, 200, 30);
        start_reading_text(test_window, test_rect, "Initial Text");
        while (key_down(KeyCode::KEYPAD_ENTER) == false) {
            process_events();
            clear_screen();
            draw_text("Type some text, press Enter when done", color_black(), 10, 10);
            draw_text(string("Current Text: " << text_input(test_window) << ""), color_black(), 10, 30);
            refresh_screen();
        }
        end_reading_text(test_window);
        close_window(test_window);
    }
    TEST_CASE("text_entry_cancelled_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        start_reading_text(rectangle_from(100, 100, 200, 30));
        while (key_down(KeyCode::ESCAPE_KEY) == false) {
            process_events();
            clear_screen();
            draw_text("Press Escape to cancel text entry", color_black(), 10, 10);
            draw_text(string("Text Entry Cancelled: " << text_entry_cancelled() << ""), color_black(), 10, 30);
            refresh_screen();
        }
        end_reading_text();
        close_window(test_window);
    }
    TEST_CASE("text_entry_cancelled_in_window_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        auto test_rect = rectangle_from(100, 100, 200, 30);
        start_reading_text(test_window, test_rect);
        while (key_down(KeyCode::ESCAPE_KEY) == false) {
            process_events();
            clear_screen();
            draw_text("Press Escape to cancel text entry", color_black(), 10, 10);
            draw_text(string("Text Entry Cancelled: " << text_entry_cancelled(test_window) << ""), color_black(), 10, 30);
            refresh_screen();
        }
        end_reading_text(test_window);
        close_window(test_window);
    }
    TEST_CASE("text_input_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        start_reading_text(rectangle_from(100, 100, 200, 30));
        while (key_down(KeyCode::KEYPAD_ENTER) == false) {
            process_events();
            clear_screen();
            draw_text("Type some text, press Enter when done", color_black(), 10, 10);
            draw_text(string("Current Text: " << text_input() << ""), color_black(), 10, 30);
            refresh_screen();
        }
        end_reading_text();
        close_window(test_window);
    }
    TEST_CASE("text_input_in_window_integration") {
        auto test_window = open_window("Test Window", 800, 600);
        auto test_rect = rectangle_from(100, 100, 200, 30);
        start_reading_text(test_window, test_rect);
        while (key_down(KeyCode::KEYPAD_ENTER) == false) {
            process_events();
            clear_screen();
            draw_text("Type some text, press Enter when done", color_black(), 10, 10);
            draw_text(string("Current Text: " << text_input(test_window) << ""), color_black(), 10, 30);
            refresh_screen();
        }
        end_reading_text(test_window);
        close_window(test_window);
    }
};
