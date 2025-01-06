#include <catch2/catch_all.hpp>
#include <limits>
#include "splashkit.h"
#include "../helpers.hpp"
struct TestAudioFixture
{
    TestAudioFixture()
    {
        set_resources_path("/mnt/c/Users/Noahc/Documents/aYear_2_semester_2/TeamProject/GitHubRepo/splashkit_test_generator/resources");
    }
};
TEST_CASE_METHOD(TestAudioFixture, "audio_ready_integration") {
    open_audio();
    audio_cleanup cleanup_audio;
    REQUIRE(audio_ready());
}
TEST_CASE_METHOD(TestAudioFixture, "close_audio_integration") {
    open_audio();
    audio_cleanup cleanup_audio;
    REQUIRE(audio_ready());
    close_audio();
}
TEST_CASE_METHOD(TestAudioFixture, "open_audio_integration") {
    open_audio();
    audio_cleanup cleanup_audio;
    REQUIRE(audio_ready());
    close_audio();
}
TEST_CASE_METHOD(TestAudioFixture, "fade_music_in_named_integration") {
    open_audio();
    audio_cleanup cleanup_audio;
    load_music("Test Music", "magical_night.ogg");
    music_cleanup cleanup_music;
    fade_music_in("Test Music", 1000);
    REQUIRE(music_playing());
}
TEST_CASE_METHOD(TestAudioFixture, "fade_music_in_named_with_times_integration") {
    open_audio();
    audio_cleanup cleanup_audio;
    load_music("Test Music", "magical_night.ogg");
    music_cleanup cleanup_music;
    fade_music_in("Test Music", 2, 1000);
    REQUIRE(music_playing());
}
TEST_CASE_METHOD(TestAudioFixture, "fade_music_in_integration") {
    open_audio();
    audio_cleanup cleanup_audio;
    auto test_music = load_music("Test Music", "magical_night.ogg");
    music_cleanup cleanup_music;
    fade_music_in(test_music, 1000);
    REQUIRE(music_playing());
}
TEST_CASE_METHOD(TestAudioFixture, "fade_music_in_with_times_integration") {
    open_audio();
    audio_cleanup cleanup_audio;
    auto test_music = load_music("Test Music", "magical_night.ogg");
    music_cleanup cleanup_music;
    fade_music_in(test_music, 2, 1000);
    REQUIRE(music_playing());
}
TEST_CASE_METHOD(TestAudioFixture, "fade_music_out_integration") {
    open_audio();
    audio_cleanup cleanup_audio;
    auto test_music = load_music("Test Music", "magical_night.ogg");
    music_cleanup cleanup_music;
    play_music(test_music);
    fade_music_out(1000);
    delay(1100);
    REQUIRE_FALSE(music_playing());
}
TEST_CASE_METHOD(TestAudioFixture, "free_all_music_integration") {
    open_audio();
    audio_cleanup cleanup_audio;
    load_music("test_music1", "magical_night.ogg");
    music_cleanup cleanup_music;
    load_music("test_music2", "dancingFrog.wav");
    free_all_music();
    REQUIRE_FALSE(has_music("test_music1"));
    REQUIRE_FALSE(has_music("test_music2"));
}
TEST_CASE_METHOD(TestAudioFixture, "free_music_integration") {
    open_audio();
    audio_cleanup cleanup_audio;
    auto test_music = load_music("Test Music", "magical_night.ogg");
    music_cleanup cleanup_music;
    play_music(test_music);
    free_music(test_music);
    REQUIRE_FALSE(has_music("Test Music"));
}
TEST_CASE_METHOD(TestAudioFixture, "has_music_integration") {
    open_audio();
    audio_cleanup cleanup_audio;
    auto test_music = load_music("Test Music", "magical_night.ogg");
    music_cleanup cleanup_music;
    REQUIRE(has_music("Test Music"));
    free_music(test_music);
    REQUIRE_FALSE(has_music("Test Music"));
}
TEST_CASE_METHOD(TestAudioFixture, "load_music_integration") {
    open_audio();
    audio_cleanup cleanup_audio;
    auto test_music = load_music("Test Music", "magical_night.ogg");
    music_cleanup cleanup_music;
    REQUIRE(test_music != nullptr);
    REQUIRE(music_valid(test_music));
}
TEST_CASE_METHOD(TestAudioFixture, "music_filename_integration") {
    open_audio();
    audio_cleanup cleanup_audio;
    auto test_music = load_music("Test Music", "magical_night.ogg");
    music_cleanup cleanup_music;
    REQUIRE(path_to_resource("magical_night.ogg", resource_kind::SOUND_RESOURCE) == music_filename(test_music));
}
TEST_CASE_METHOD(TestAudioFixture, "music_name_integration") {
    open_audio();
    audio_cleanup cleanup_audio;
    auto test_music = load_music("Test Music", "magical_night.ogg");
    music_cleanup cleanup_music;
    REQUIRE("Test Music" == music_name(test_music));
}
TEST_CASE_METHOD(TestAudioFixture, "music_named_integration") {
    open_audio();
    audio_cleanup cleanup_audio;
    auto test_music = load_music("Test Music", "magical_night.ogg");
    music_cleanup cleanup_music;
    auto named_music = music_named("Test Music");
    REQUIRE(test_music == named_music);
}
TEST_CASE_METHOD(TestAudioFixture, "music_playing_integration") {
    open_audio();
    audio_cleanup cleanup_audio;
    auto test_music = load_music("Test Music", "magical_night.ogg");
    music_cleanup cleanup_music;
    REQUIRE_FALSE(music_playing());
    play_music(test_music);
    REQUIRE(music_playing());
}
TEST_CASE_METHOD(TestAudioFixture, "music_valid_integration") {
    open_audio();
    audio_cleanup cleanup_audio;
    auto test_music = load_music("Test Music", "magical_night.ogg");
    music_cleanup cleanup_music;
    REQUIRE(music_valid(test_music));
    free_music(test_music);
    REQUIRE_FALSE(music_valid(test_music));
}
TEST_CASE_METHOD(TestAudioFixture, "music_volume_integration") {
    open_audio();
    audio_cleanup cleanup_audio;
    auto test_music = load_music("Test Music", "magical_night.ogg");
    music_cleanup cleanup_music;
    play_music(test_music);
    set_music_volume(0.5);
    REQUIRE(0.5 == music_volume());
}
TEST_CASE_METHOD(TestAudioFixture, "pause_music_integration") {
    open_audio();
    audio_cleanup cleanup_audio;
    auto test_music = load_music("Test Music", "magical_night.ogg");
    music_cleanup cleanup_music;
    play_music(test_music);
    pause_music();
    REQUIRE(music_playing());
}
TEST_CASE_METHOD(TestAudioFixture, "play_music_named_integration") {
    open_audio();
    audio_cleanup cleanup_audio;
    load_music("Test Music", "magical_night.ogg");
    music_cleanup cleanup_music;
    play_music("Test Music");
    REQUIRE(music_playing());
}
TEST_CASE_METHOD(TestAudioFixture, "play_music_named_with_times_integration") {
    open_audio();
    audio_cleanup cleanup_audio;
    load_music("Test Music", "magical_night.ogg");
    music_cleanup cleanup_music;
    play_music("Test Music", 2);
    REQUIRE(music_playing());
}
TEST_CASE_METHOD(TestAudioFixture, "play_music_integration") {
    open_audio();
    audio_cleanup cleanup_audio;
    auto test_music = load_music("Test Music", "magical_night.ogg");
    music_cleanup cleanup_music;
    play_music(test_music);
    REQUIRE(music_playing());
}
TEST_CASE_METHOD(TestAudioFixture, "play_music_with_times_integration") {
    open_audio();
    audio_cleanup cleanup_audio;
    auto test_music = load_music("Test Music", "magical_night.ogg");
    music_cleanup cleanup_music;
    play_music(test_music, 2);
    REQUIRE(music_playing());
}
TEST_CASE_METHOD(TestAudioFixture, "play_music_with_times_and_volume_integration") {
    open_audio();
    audio_cleanup cleanup_audio;
    auto test_music = load_music("Test Music", "magical_night.ogg");
    music_cleanup cleanup_music;
    play_music(test_music, 2, 0.75);
    REQUIRE(music_playing());
    REQUIRE(0.75 == music_volume());
}
TEST_CASE_METHOD(TestAudioFixture, "resume_music_integration") {
    open_audio();
    audio_cleanup cleanup_audio;
    auto test_music = load_music("Test Music", "magical_night.ogg");
    music_cleanup cleanup_music;
    play_music(test_music);
    pause_music();
    REQUIRE(music_playing());
    resume_music();
    REQUIRE(music_playing());
}
TEST_CASE_METHOD(TestAudioFixture, "set_music_volume_integration") {
    open_audio();
    audio_cleanup cleanup_audio;
    auto test_music = load_music("Test Music", "magical_night.ogg");
    music_cleanup cleanup_music;
    play_music(test_music);
    set_music_volume(0.5);
    REQUIRE(0.5 == music_volume());
}
TEST_CASE_METHOD(TestAudioFixture, "stop_music_integration") {
    open_audio();
    audio_cleanup cleanup_audio;
    auto test_music = load_music("Test Music", "magical_night.ogg");
    music_cleanup cleanup_music;
    play_music(test_music);
    stop_music();
    REQUIRE_FALSE(music_playing());
}
TEST_CASE_METHOD(TestAudioFixture, "fade_all_sound_effects_out_integration") {
    open_audio();
    audio_cleanup cleanup_audio;
    auto test_sound1 = load_sound_effect("Test Sound 1", "comedy_boing.wav");
    sound_effect_cleanup cleanup_sound_effect;
    auto test_sound2 = load_sound_effect("Test Sound 2", "comedy_boing.ogg");
    play_sound_effect(test_sound1);
    play_sound_effect(test_sound2);
    fade_all_sound_effects_out(1000);
    delay(1100);
    REQUIRE_FALSE(sound_effect_playing(test_sound1));
    REQUIRE_FALSE(sound_effect_playing(test_sound2));
}
TEST_CASE_METHOD(TestAudioFixture, "fade_sound_effect_out_integration") {
    open_audio();
    audio_cleanup cleanup_audio;
    auto test_sound = load_sound_effect("Test Sound", "breakdance.wav");
    sound_effect_cleanup cleanup_sound_effect;
    play_sound_effect(test_sound);
    fade_sound_effect_out(test_sound, 1000);
    delay(1100);
    REQUIRE_FALSE(sound_effect_playing(test_sound));
}
TEST_CASE_METHOD(TestAudioFixture, "free_all_sound_effects_integration") {
    open_audio();
    audio_cleanup cleanup_audio;
    load_sound_effect("Test Sound 1", "breakdance.wav");
    sound_effect_cleanup cleanup_sound_effect;
    load_sound_effect("Test Sound 2", "comedy_boing.ogg");
    free_all_sound_effects();
    REQUIRE_FALSE(has_sound_effect("Test Sound 1"));
    REQUIRE_FALSE(has_sound_effect("Test Sound 2"));
}
TEST_CASE_METHOD(TestAudioFixture, "free_sound_effect_integration") {
    open_audio();
    audio_cleanup cleanup_audio;
    auto test_sound = load_sound_effect("Test Sound", "breakdance.wav");
    sound_effect_cleanup cleanup_sound_effect;
    play_sound_effect(test_sound);
    free_sound_effect(test_sound);
    REQUIRE_FALSE(has_sound_effect("Test Sound"));
}
TEST_CASE_METHOD(TestAudioFixture, "has_sound_effect_integration") {
    open_audio();
    audio_cleanup cleanup_audio;
    auto test_sound = load_sound_effect("Test Sound", "breakdance.wav");
    sound_effect_cleanup cleanup_sound_effect;
    REQUIRE(has_sound_effect("Test Sound"));
    free_sound_effect(test_sound);
    REQUIRE_FALSE(has_sound_effect("Test Sound"));
}
TEST_CASE_METHOD(TestAudioFixture, "load_sound_effect_integration") {
    open_audio();
    audio_cleanup cleanup_audio;
    auto test_sound = load_sound_effect("Test Sound", "breakdance.wav");
    sound_effect_cleanup cleanup_sound_effect;
    REQUIRE(test_sound != nullptr);
    REQUIRE(has_sound_effect("Test Sound"));
}
TEST_CASE_METHOD(TestAudioFixture, "play_sound_effect_named_integration") {
    open_audio();
    audio_cleanup cleanup_audio;
    auto test_sound = load_sound_effect("Test Sound", "breakdance.wav");
    sound_effect_cleanup cleanup_sound_effect;
    play_sound_effect("Test Sound");
    REQUIRE(sound_effect_playing(test_sound));
}
TEST_CASE_METHOD(TestAudioFixture, "play_sound_effect_named_with_volume_integration") {
    open_audio();
    audio_cleanup cleanup_audio;
    auto test_sound = load_sound_effect("Test Sound", "breakdance.wav");
    sound_effect_cleanup cleanup_sound_effect;
    play_sound_effect("Test Sound", 0.75);
    REQUIRE(sound_effect_playing(test_sound));
}
TEST_CASE_METHOD(TestAudioFixture, "play_sound_effect_named_with_times_integration") {
    open_audio();
    audio_cleanup cleanup_audio;
    auto test_sound = load_sound_effect("Test Sound", "breakdance.wav");
    sound_effect_cleanup cleanup_sound_effect;
    play_sound_effect("Test Sound", 3);
    REQUIRE(sound_effect_playing(test_sound));
}
TEST_CASE_METHOD(TestAudioFixture, "play_sound_effect_named_with_times_and_volume_integration") {
    open_audio();
    audio_cleanup cleanup_audio;
    auto test_sound = load_sound_effect("Test Sound", "breakdance.wav");
    sound_effect_cleanup cleanup_sound_effect;
    play_sound_effect("Test Sound", 2, 0.75);
    REQUIRE(sound_effect_playing(test_sound));
}
TEST_CASE_METHOD(TestAudioFixture, "play_sound_effect_integration") {
    open_audio();
    audio_cleanup cleanup_audio;
    auto test_sound = load_sound_effect("Test Sound", "breakdance.wav");
    sound_effect_cleanup cleanup_sound_effect;
    play_sound_effect(test_sound);
    REQUIRE(sound_effect_playing(test_sound));
}
TEST_CASE_METHOD(TestAudioFixture, "play_sound_effect_with_volume_integration") {
    open_audio();
    audio_cleanup cleanup_audio;
    auto test_sound = load_sound_effect("Test Sound", "breakdance.wav");
    sound_effect_cleanup cleanup_sound_effect;
    play_sound_effect(test_sound, 0.75);
    REQUIRE(sound_effect_playing(test_sound));
}
TEST_CASE_METHOD(TestAudioFixture, "play_sound_effect_with_times_integration") {
    open_audio();
    audio_cleanup cleanup_audio;
    auto test_sound = load_sound_effect("Test Sound", "SwinGameStart.wav");
    sound_effect_cleanup cleanup_sound_effect;
    play_sound_effect(test_sound, 3);
    REQUIRE(sound_effect_playing(test_sound));
}
TEST_CASE_METHOD(TestAudioFixture, "play_sound_effect_with_times_and_volume_integration") {
    open_audio();
    audio_cleanup cleanup_audio;
    auto test_sound = load_sound_effect("Test Sound", "SwinGameStart.wav");
    sound_effect_cleanup cleanup_sound_effect;
    play_sound_effect(test_sound, 2, 0.75);
    REQUIRE(sound_effect_playing(test_sound));
}
TEST_CASE_METHOD(TestAudioFixture, "sound_effect_filename_integration") {
    open_audio();
    audio_cleanup cleanup_audio;
    auto test_sound = load_sound_effect("Test Sound", "SwinGameStart.wav");
    sound_effect_cleanup cleanup_sound_effect;
    REQUIRE(path_to_resource("SwinGameStart.wav", resource_kind::SOUND_RESOURCE) == sound_effect_filename(test_sound));
}
TEST_CASE_METHOD(TestAudioFixture, "sound_effect_name_integration") {
    open_audio();
    audio_cleanup cleanup_audio;
    auto test_sound = load_sound_effect("Test Sound", "SwinGameStart.wav");
    sound_effect_cleanup cleanup_sound_effect;
    REQUIRE("Test Sound" == sound_effect_name(test_sound));
}
TEST_CASE_METHOD(TestAudioFixture, "sound_effect_named_integration") {
    open_audio();
    audio_cleanup cleanup_audio;
    auto test_sound = load_sound_effect("Test Sound", "SwinGameStart.wav");
    sound_effect_cleanup cleanup_sound_effect;
    auto named_sound = sound_effect_named("Test Sound");
    REQUIRE(test_sound == named_sound);
}
TEST_CASE_METHOD(TestAudioFixture, "sound_effect_playing_named_integration") {
    open_audio();
    audio_cleanup cleanup_audio;
    load_sound_effect("Test Sound", "SwinGameStart.wav");
    sound_effect_cleanup cleanup_sound_effect;
    play_sound_effect("Test Sound");
    REQUIRE(sound_effect_playing("Test Sound"));
    stop_sound_effect("Test Sound");
    REQUIRE_FALSE(sound_effect_playing("Test Sound"));
}
TEST_CASE_METHOD(TestAudioFixture, "sound_effect_playing_integration") {
    open_audio();
    audio_cleanup cleanup_audio;
    auto test_sound = load_sound_effect("Test Sound", "SwinGameStart.wav");
    sound_effect_cleanup cleanup_sound_effect;
    play_sound_effect(test_sound);
    REQUIRE(sound_effect_playing(test_sound));
    stop_sound_effect(test_sound);
    REQUIRE_FALSE(sound_effect_playing(test_sound));
}
TEST_CASE_METHOD(TestAudioFixture, "sound_effect_valid_integration") {
    open_audio();
    audio_cleanup cleanup_audio;
    auto test_sound = load_sound_effect("Test Sound", "SwinGameStart.wav");
    sound_effect_cleanup cleanup_sound_effect;
    REQUIRE(test_sound != nullptr);
    REQUIRE(has_sound_effect("Test Sound"));
}
TEST_CASE_METHOD(TestAudioFixture, "stop_sound_effect_named_integration") {
    open_audio();
    audio_cleanup cleanup_audio;
    load_sound_effect("Test Sound", "SwinGameStart.wav");
    sound_effect_cleanup cleanup_sound_effect;
    play_sound_effect("Test Sound");
    stop_sound_effect("Test Sound");
    REQUIRE_FALSE(sound_effect_playing("Test Sound"));
}
TEST_CASE_METHOD(TestAudioFixture, "stop_sound_effect_integration") {
    open_audio();
    audio_cleanup cleanup_audio;
    auto test_sound = load_sound_effect("Test Sound", "SwinGameStart.wav");
    sound_effect_cleanup cleanup_sound_effect;
    play_sound_effect(test_sound);
    stop_sound_effect(test_sound);
    REQUIRE_FALSE(sound_effect_playing(test_sound));
}
