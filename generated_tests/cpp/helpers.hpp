#include "splashkit.h"
#include <functional>
using sprite_float_function = std::function<void(void*, float)>;
using sprite_function = std::function<void(void*)>;
using sprite_event_handler = std::function<void(void*, int)>;
using key_callback = std::function<void(int)>;
using free_notifier = std::function<void(void*)>;

class SpriteDelegates {
private:
    int float_function_call_count = 0;
    int function_call_count = 0;
    bool event_called = false;

public:
    sprite_float_function sprite_float_function;
    sprite_function sprite_function;
    sprite_event_handler sprite_event_handler;
    std::function<void()> reset;

    SpriteDelegates() {
        sprite_float_function = [this](void* ptr, float value) {
            float_function_call_count++;
            event_called = true;
        };

        sprite_function = [this](void* ptr) {
            function_call_count++;
            event_called = true;
        };

        sprite_event_handler = [this](void* ptr, int evt) {
            event_called = true;
        };

        reset = [this]() {
            float_function_call_count = 0;
            function_call_count = 0;
            event_called = false;
        };
    }

    bool get_event_called() const { return event_called; }
    int get_float_function_call_count() const { return float_function_call_count; }
    int get_function_call_count() const { return function_call_count; }
};

class KeyCallbacks {
private:
    key_code get_key_typed = key_code(0);
    key_code get_key_down = key_code(0);
    key_code get_key_up = key_code(0);

public:
    key_callback on_key_typed;
    key_callback on_key_down;
    key_callback on_key_up;
    std::function<void()> reset;

    KeyCallbacks() {
        on_key_typed = [this](int key) {
            get_key_typed = key_code(key);
        };

        on_key_down = [this](int key) {
            get_key_down = key_code(key);
        };

        on_key_up = [this](int key) {
            get_key_up = key_code(key);
        };

        reset = [this]() {
            get_key_typed = key_code(0);
            get_key_down = key_code(0);
            get_key_up = key_code(0);
        };
    }

    key_code get_typed() const { return get_key_typed; }
    key_code get_down() const { return get_key_down; }
    key_code get_up() const { return get_key_up; }
};

class NotifierTracker {
private:
    bool was_notified = false;

public:
    free_notifier on_free;
    std::function<void()> reset;

    NotifierTracker() {
        on_free = [this](void* resource) {
            was_notified = true;
        };

        reset = [this]() {
            was_notified = false;
        };
    }

    bool get_was_notified() const { return was_notified; }
};

class AnimationScriptCleanup {
public:
    ~AnimationScriptCleanup() {
        free_all_animation_scripts();
    }
};

class AnimationCleanup {
private:
    animation _animation;
public:
    AnimationCleanup(animation anim) : _animation(anim) {}
    ~AnimationCleanup() {
        free_animation(_animation);
    }
};

class AudioCleanup {
public:
    ~AudioCleanup() {
        close_audio();
    }
};

class SoundEffectCleanup {
public:
    ~SoundEffectCleanup() {
        free_all_sound_effects();
    }
};

class MusicCleanup {
public:
    ~MusicCleanup() {
        free_all_music();
    }
};

class WindowCleanup {
public:
    ~WindowCleanup() {
        close_all_windows();
        set_camera_position(point_at(0, 0));
    }
};

class BitmapCleanup {
public:
    ~BitmapCleanup() {
        free_all_bitmaps();
    }
};

class SpriteCleanup {
public:
    ~SpriteCleanup() {
        free_all_sprites();
    }
};

class FontCleanup {
public:
    ~FontCleanup() {
        free_all_fonts();
    }
};

class RaspiCleanup {
public:
    ~RaspiCleanup() {
        raspi_cleanup();
    }
};

class JsonCleanup {
public:
    ~JsonCleanup() {
        free_all_json();
    }
};

class ServerCleanup {
public:
    ~ServerCleanup() {
        close_all_servers();
    }
};

class ConnectionCleanup {
public:
    ~ConnectionCleanup() {
        close_all_connections();
    }
};

class ResourceCleanup {
private:
    string _bundle_name;
public:
    ResourceCleanup(const string& bundle_name) : _bundle_name(bundle_name) {}
    ~ResourceCleanup() {
        free_resource_bundle(_bundle_name);
    }
};

class SpritePackCleanup {
private:
    string _sprite_pack_name;
public:
    SpritePackCleanup(const string& pack_name) : _sprite_pack_name(pack_name) {}
    ~SpritePackCleanup() {
        free_sprite_pack(_sprite_pack_name);
    }
};

class TimerCleanup {
public:
    ~TimerCleanup() {
        free_all_timers();
    }
};

class LoggerCleanup {
public:
    ~LoggerCleanup() {
        close_log_process();
    }
};