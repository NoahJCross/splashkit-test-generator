#include "splashkit.h"
#include <catch2/catch.hpp>

class TestAudio {
public:
    TEST_CASE("audio_ready_integration") {
        REQUIRE_FALSE(audio_ready());
        open_audio();
        REQUIRE(audio_ready());
        close_audio();
        REQUIRE_FALSE(audio_ready());
    }
    TEST_CASE("close_audio_integration") {
        open_audio();
        REQUIRE(audio_ready());
        close_audio();
        REQUIRE_FALSE(audio_ready());
    }
    TEST_CASE("open_audio_integration") {
        open_audio();
        REQUIRE(audio_ready());
        close_audio();
        REQUIRE_FALSE(audio_ready());
    }
    TEST_CASE("fade_music_in_named_integration") {
        open_audio();
        auto test_music = load_music("test_music", "magical_night.ogg");
        fade_music_in_named("test_music", 1000);
        REQUIRE(music_playing());
        free_music(test_music);
        close_audio();
    }
    TEST_CASE("fade_music_in_named_with_times_integration") {
        open_audio();
        auto test_music = load_music("test_music", "magical_night.ogg");
        fade_music_in_named_with_times("test_music", 2, 1000);
        REQUIRE(music_playing());
        free_music(test_music);
        close_audio();
    }
    TEST_CASE("fade_music_in_integration") {
        open_audio();
        auto test_music = load_music("test_music", "magical_night.ogg");
        fade_music_in(test_music, 1000);
        REQUIRE(music_playing());
        free_music(test_music);
        close_audio();
    }
    TEST_CASE("fade_music_in_with_times_integration") {
        open_audio();
        auto test_music = load_music("test_music", "magical_night.ogg");
        fade_music_in_with_times(test_music, 2, 1000);
        REQUIRE(music_playing());
        free_music(test_music);
        close_audio();
    }
    TEST_CASE("fade_music_out_integration") {
        open_audio();
        auto test_music = load_music("test_music", "magical_night.ogg");
        play_music(test_music);
        fade_music_out(1000);
        delay(3000);
        REQUIRE_FALSE(music_playing());
        free_music(test_music);
        close_audio();
    }
    TEST_CASE("free_all_music_integration") {
        open_audio();
        load_music("test_music1", "magical_night.ogg");
        load_music("test_music2", "dancingFrog.wav");
        free_all_music();
        REQUIRE_FALSE(has_music("test_music1"));
        REQUIRE_FALSE(has_music("test_music2"));
        close_audio();
    }
    TEST_CASE("free_music_integration") {
        open_audio();
        auto test_music = load_music("test_music", "magical_night.ogg");
        play_music(test_music);
        free_music(test_music);
        REQUIRE_FALSE(has_music("test_music"));
        close_audio();
    }
    TEST_CASE("has_music_integration") {
        open_audio();
        auto test_music = load_music("test_music", "magical_night.ogg");
        REQUIRE(has_music("test_music"));
        free_music(test_music);
        REQUIRE_FALSE(has_music("test_music"));
        close_audio();
    }
    TEST_CASE("load_music_integration") {
        open_audio();
        auto test_music = load_music("test_music", "magical_night.ogg");
        REQUIRE(test_music != nullptr);
        REQUIRE(music_valid(test_music));
        free_music(test_music);
        close_audio();
    }
    TEST_CASE("music_filename_integration") {
        open_audio();
        auto test_music = load_music("test_music", "magical_night.ogg");
        REQUIRE(path_to_resource("magical_night.ogg", ResourceKind::SOUND_RESOURCE) == music_filename(test_music));
        free_music(test_music);
        close_audio();
    }
    TEST_CASE("music_name_integration") {
        open_audio();
        auto test_music = load_music("test_music", "magical_night.ogg");
        REQUIRE("test_music" == music_name(test_music));
        free_music(test_music);
        close_audio();
    }
    TEST_CASE("music_named_integration") {
        open_audio();
        auto test_music = load_music("test_music", "magical_night.ogg");
        auto named_music = music_named("test_music");
        REQUIRE(test_music == named_music);
        free_music(test_music);
        close_audio();
    }
    TEST_CASE("music_playing_integration") {
        open_audio();
        auto test_music = load_music("test_music", "magical_night.ogg");
        REQUIRE_FALSE(music_playing());
        play_music(test_music);
        REQUIRE(music_playing());
        free_music(test_music);
        close_audio();
    }
    TEST_CASE("music_valid_integration") {
        open_audio();
        auto test_music = load_music("test_music", "magical_night.ogg");
        REQUIRE(music_valid(test_music));
        free_music(test_music);
        REQUIRE_FALSE(music_valid(test_music));
        close_audio();
    }
    TEST_CASE("music_volume_integration") {
        open_audio();
        auto test_music = load_music("test_music", "magical_night.ogg");
        play_music(test_music);
        set_music_volume(0.5);
        REQUIRE(0.5 == music_volume());
        free_music(test_music);
        close_audio();
    }
    TEST_CASE("pause_music_integration") {
        open_audio();
        auto test_music = load_music("test_music", "magical_night.ogg");
        play_music(test_music);
        pause_music();
        REQUIRE(music_playing());
        free_music(test_music);
        close_audio();
    }
    TEST_CASE("play_music_named_integration") {
        open_audio();
        auto test_music = load_music("test_music", "magical_night.ogg");
        play_music_named("test_music");
        REQUIRE(music_playing());
        free_music(test_music);
        close_audio();
    }
    TEST_CASE("play_music_named_with_times_integration") {
        open_audio();
        auto test_music = load_music("test_music", "magical_night.ogg");
        play_music_named_with_times("test_music", 2);
        REQUIRE(music_playing());
        free_music(test_music);
        close_audio();
    }
    TEST_CASE("play_music_integration") {
        open_audio();
        auto test_music = load_music("test_music", "magical_night.ogg");
        play_music(test_music);
        REQUIRE(music_playing());
        free_music(test_music);
        close_audio();
    }
    TEST_CASE("play_music_with_times_integration") {
        open_audio();
        auto test_music = load_music("test_music", "magical_night.ogg");
        play_music_with_times(test_music, 2);
        REQUIRE(music_playing());
        free_music(test_music);
        close_audio();
    }
    TEST_CASE("play_music_with_times_and_volume_integration") {
        open_audio();
        auto test_music = load_music("test_music", "magical_night.ogg");
        play_music_with_times_and_volume(test_music, 2, 0.75);
        REQUIRE(music_playing());
        REQUIRE(0.75 == music_volume());
        free_music(test_music);
        close_audio();
    }
    TEST_CASE("resume_music_integration") {
        open_audio();
        auto test_music = load_music("test_music", "magical_night.ogg");
        play_music(test_music);
        pause_music();
        REQUIRE(music_playing());
        resume_music();
        REQUIRE(music_playing());
        free_music(test_music);
        close_audio();
    }
    TEST_CASE("set_music_volume_integration") {
        open_audio();
        auto test_music = load_music("test_music", "magical_night.ogg");
        play_music(test_music);
        set_music_volume(0.5);
        REQUIRE(0.5 == music_volume());
        free_music(test_music);
        close_audio();
    }
    TEST_CASE("stop_music_integration") {
        open_audio();
        auto test_music = load_music("test_music", "magical_night.ogg");
        play_music(test_music);
        stop_music();
        REQUIRE_FALSE(music_playing());
        free_music(test_music);
        close_audio();
    }
    TEST_CASE("fade_all_sound_effects_out_integration") {
        open_audio();
        auto test_sound1 = load_sound_effect("test_sound1", "breakdance.wav");
        auto test_sound2 = load_sound_effect("test_sound2", "comedy_boing.ogg");
        play_sound_effect(test_sound1);
        play_sound_effect(test_sound2);
        fade_all_sound_effects_out(1000);
        REQUIRE_FALSE(sound_effect_playing(test_sound1));
        REQUIRE_FALSE(sound_effect_playing(test_sound2));
        free_all_sound_effects();
        close_audio();
    }
    TEST_CASE("fade_sound_effect_out_integration") {
        open_audio();
        auto test_sound = load_sound_effect("test_sound", "breakdance.wav");
        play_sound_effect(test_sound);
        fade_sound_effect_out(test_sound, 1000);
        delay(3000);
        REQUIRE_FALSE(sound_effect_playing(test_sound));
        free_sound_effect(test_sound);
        close_audio();
    }
    TEST_CASE("free_all_sound_effects_integration") {
        open_audio();
        load_sound_effect("test_sound1", "breakdance.wav");
        load_sound_effect("test_sound2", "comedy_boing.ogg");
        free_all_sound_effects();
        REQUIRE_FALSE(has_sound_effect("test_sound1"));
        REQUIRE_FALSE(has_sound_effect("test_sound2"));
        close_audio();
    }
    TEST_CASE("free_sound_effect_integration") {
        open_audio();
        auto test_sound = load_sound_effect("test_sound", "breakdance.wav");
        play_sound_effect(test_sound);
        free_sound_effect(test_sound);
        REQUIRE_FALSE(has_sound_effect("test_sound"));
        close_audio();
    }
    TEST_CASE("has_sound_effect_integration") {
        open_audio();
        auto test_sound = load_sound_effect("test_sound", "breakdance.wav");
        REQUIRE(has_sound_effect("test_sound"));
        free_sound_effect(test_sound);
        REQUIRE_FALSE(has_sound_effect("test_sound"));
        close_audio();
    }
    TEST_CASE("load_sound_effect_integration") {
        open_audio();
        auto test_sound = load_sound_effect("test_sound", "breakdance.wav");
        REQUIRE(test_sound != nullptr);
        REQUIRE(has_sound_effect("test_sound"));
        free_sound_effect(test_sound);
        close_audio();
    }
    TEST_CASE("play_sound_effect_named_integration") {
        open_audio();
        auto test_sound = load_sound_effect("test_sound", "breakdance.wav");
        play_sound_effect_named("test_sound");
        REQUIRE(sound_effect_playing(test_sound));
        free_sound_effect(test_sound);
        close_audio();
    }
    TEST_CASE("play_sound_effect_named_with_volume_integration") {
        open_audio();
        auto test_sound = load_sound_effect("test_sound", "breakdance.wav");
        play_sound_effect_named_with_volume("test_sound", 0.75);
        REQUIRE(sound_effect_playing(test_sound));
        free_sound_effect(test_sound);
        close_audio();
    }
    TEST_CASE("play_sound_effect_named_with_times_integration") {
        open_audio();
        auto test_sound = load_sound_effect("test_sound", "breakdance.wav");
        play_sound_effect_named_with_times("test_sound", 3);
        REQUIRE(sound_effect_playing(test_sound));
        free_sound_effect(test_sound);
        close_audio();
    }
    TEST_CASE("play_sound_effect_named_with_times_and_volume_integration") {
        open_audio();
        auto test_sound = load_sound_effect("test_sound", "breakdance.wav");
        play_sound_effect_named_with_times_and_volume("test_sound", 2, 0.75);
        REQUIRE(sound_effect_playing(test_sound));
        free_sound_effect(test_sound);
        close_audio();
    }
    TEST_CASE("play_sound_effect_integration") {
        open_audio();
        auto test_sound = load_sound_effect("test_sound", "breakdance.wav");
        play_sound_effect(test_sound);
        REQUIRE(sound_effect_playing(test_sound));
        free_sound_effect(test_sound);
        close_audio();
    }
    TEST_CASE("play_sound_effect_with_volume_integration") {
        open_audio();
        auto test_sound = load_sound_effect("test_sound", "breakdance.wav");
        play_sound_effect_with_volume(test_sound, 0.75);
        REQUIRE(sound_effect_playing(test_sound));
        free_sound_effect(test_sound);
        close_audio();
    }
    TEST_CASE("play_sound_effect_with_times_integration") {
        open_audio();
        auto test_sound = load_sound_effect("test_sound", "SwinGameStart.wav");
        play_sound_effect_with_times(test_sound, 3);
        REQUIRE(sound_effect_playing(test_sound));
        free_sound_effect(test_sound);
        close_audio();
    }
    TEST_CASE("play_sound_effect_with_times_and_volume_integration") {
        open_audio();
        auto test_sound = load_sound_effect("test_sound", "SwinGameStart.wav");
        play_sound_effect_with_times_and_volume(test_sound, 2, 0.75);
        REQUIRE(sound_effect_playing(test_sound));
        free_sound_effect(test_sound);
        close_audio();
    }
    TEST_CASE("sound_effect_filename_integration") {
        open_audio();
        auto test_sound = load_sound_effect("test_sound", "SwinGameStart.wav");
        REQUIRE(path_to_resource("SwinGameStart.wav", ResourceKind::SOUND_RESOURCE) == sound_effect_filename(test_sound));
        free_sound_effect(test_sound);
        close_audio();
    }
    TEST_CASE("sound_effect_name_integration") {
        open_audio();
        auto test_sound = load_sound_effect("test_sound", "SwinGameStart.wav");
        REQUIRE("test_sound" == sound_effect_name(test_sound));
        free_sound_effect(test_sound);
        close_audio();
    }
    TEST_CASE("sound_effect_named_integration") {
        open_audio();
        auto test_sound = load_sound_effect("test_sound", "SwinGameStart.wav");
        auto named_sound = sound_effect_named("test_sound");
        REQUIRE(test_sound == named_sound);
        free_sound_effect(test_sound);
        close_audio();
    }
    TEST_CASE("sound_effect_playing_named_integration") {
        open_audio();
        auto test_sound = load_sound_effect("test_sound", "SwinGameStart.wav");
        play_sound_effect("test_sound");
        REQUIRE(sound_effect_playing_named("test_sound"));
        stop_sound_effect("test_sound");
        REQUIRE_FALSE(sound_effect_playing_named("test_sound"));
        free_sound_effect(test_sound);
        close_audio();
    }
    TEST_CASE("sound_effect_playing_integration") {
        open_audio();
        auto test_sound = load_sound_effect("test_sound", "SwinGameStart.wav");
        play_sound_effect(test_sound);
        REQUIRE(sound_effect_playing(test_sound));
        stop_sound_effect(test_sound);
        REQUIRE_FALSE(sound_effect_playing(test_sound));
        free_sound_effect(test_sound);
        close_audio();
    }
    TEST_CASE("sound_effect_valid_integration") {
        open_audio();
        auto test_sound = load_sound_effect("test_sound", "SwinGameStart.wav");
        REQUIRE(test_sound != nullptr);
        REQUIRE(has_sound_effect("test_sound"));
        free_sound_effect(test_sound);
        close_audio();
    }
    TEST_CASE("stop_sound_effect_named_integration") {
        open_audio();
        auto test_sound = load_sound_effect("test_sound", "SwinGameStart.wav");
        play_sound_effect("test_sound");
        stop_sound_effect_named("test_sound");
        REQUIRE_FALSE(sound_effect_playing("test_sound"));
        free_sound_effect(test_sound);
        close_audio();
    }
    TEST_CASE("stop_sound_effect_integration") {
        open_audio();
        auto test_sound = load_sound_effect("test_sound", "SwinGameStart.wav");
        play_sound_effect(test_sound);
        stop_sound_effect(test_sound);
        REQUIRE_FALSE(sound_effect_playing(test_sound));
        free_sound_effect(test_sound);
        close_audio();
    }
};
