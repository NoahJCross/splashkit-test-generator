uses SplashKit, TestFramework

type
TIntegrationTests = class(TTestCase)
published
procedure TIntegrationTests.TestAudioReadyIntegration;
begin
    AssertFalse(audio_ready());
    open_audio();
    AssertTrue(audio_ready());
    close_audio();
    AssertFalse(audio_ready());
end;
procedure TIntegrationTests.TestCloseAudioIntegration;
begin
    open_audio();
    close_audio();
    AssertFalse(audio_ready());
end;
procedure TIntegrationTests.TestOpenAudioIntegration;
begin
    AssertFalse(audio_ready());
    open_audio();
    AssertTrue(audio_ready());
    close_audio();
    AssertFalse(audio_ready());
end;
procedure TIntegrationTests.TestFadeMusicInNamedIntegration;
begin
    open_audio();
    testMusic := load_music("test_music", "280.mp3");
    fade_music_in("test_music", 1000);
    AssertTrue(music_volume() > 0.0);
    free_music(testMusic);
    close_audio();
end;
procedure TIntegrationTests.TestFadeMusicInNamedWithTimesIntegration;
begin
    open_audio();
    testMusic := load_music("test_music", "280.mp3");
    fade_music_in("test_music", 2, 1000);
    AssertTrue(music_volume() > 0.0);
    free_music(testMusic);
    close_audio();
end;
procedure TIntegrationTests.TestFadeMusicInIntegration;
begin
    open_audio();
    testMusic := load_music("test_music", "280.mp3");
    play_music(testMusic);
    fade_music_in(testMusic, 1000);
    AssertTrue(music_volume() > 0.0);
    free_music(testMusic);
    close_audio();
end;
procedure TIntegrationTests.TestFadeMusicInWithTimesIntegration;
begin
    open_audio();
    testMusic := load_music("test_music", "280.mp3");
    fade_music_in(testMusic, 2, 1000);
    AssertTrue(music_volume() > 0.0);
    free_music(testMusic);
    close_audio();
end;
procedure TIntegrationTests.TestFadeMusicOutIntegration;
begin
    open_audio();
    testMusic := load_music("test_music", "280.mp3");
    play_music(testMusic);
    fade_music_out(1000);
    AssertFalse(music_playing());
    free_music(testMusic);
    close_audio();
end;
procedure TIntegrationTests.TestFreeAllMusicIntegration;
begin
    open_audio();
    testMusic1 := load_music("test_music1", "280.mp3");
    testMusic2 := load_music("test_music2", "test.ogg");
    free_all_music();
    AssertFalse(has_music("test_music1"));
    AssertFalse(has_music("test_music2"));
    close_audio();
end;
procedure TIntegrationTests.TestFreeMusicIntegration;
begin
    open_audio();
    testMusic := load_music("test_music", "280.mp3");
    play_music(testMusic);
    free_music(testMusic);
    AssertFalse(music_playing());
    close_audio();
end;
procedure TIntegrationTests.TestHasMusicIntegration;
begin
    open_audio();
    testMusic := load_music("test_music", "280.mp3");
    AssertTrue(has_music("test_music"));
    free_music(testMusic);
    AssertFalse(has_music("test_music"));
    close_audio();
end;
procedure TIntegrationTests.TestLoadMusicIntegration;
begin
    open_audio();
    testMusic := load_music("test_music", "280.mp3");
    AssertTrue(music_valid(testMusic));
    free_music(testMusic);
    close_audio();
end;
procedure TIntegrationTests.TestMusicFilenameIntegration;
begin
    testMusic := load_music("test_music", "280.mp3");
    filename := music_filename(testMusic);
    AssertEquals(filename, "280.mp3");
    free_music(testMusic);
end;
procedure TIntegrationTests.TestMusicNameIntegration;
begin
    testMusic := load_music("test_music", "280.mp3");
    musicNameResult := music_name(testMusic);
    AssertEquals(musicNameResult, "test_music");
    free_music(testMusic);
end;
procedure TIntegrationTests.TestMusicNamedIntegration;
begin
    testMusic := load_music("test_music", "280.mp3");
    retrievedMusic := music_named("test_music");
    AssertEquals(testMusic, retrievedMusic);
    free_music(testMusic);
end;
procedure TIntegrationTests.TestMusicPlayingIntegration;
begin
    open_audio();
    testMusic := load_music("test_music", "280.mp3");
    play_music(testMusic);
    AssertTrue(music_playing());
    pause_music();
    AssertFalse(music_playing());
    free_music(testMusic);
    close_audio();
end;
procedure TIntegrationTests.TestMusicValidIntegration;
begin
    open_audio();
    testMusic := load_music("test_music", "280.mp3");
    AssertTrue(music_valid(testMusic));
    free_music(testMusic);
    AssertFalse(music_valid(testMusic));
    close_audio();
end;
procedure TIntegrationTests.TestMusicVolumeIntegration;
begin
    open_audio();
    testMusic := load_music("test_music", "280.mp3");
    play_music(testMusic);
    set_music_volume(0.5);
    AssertEquals(music_volume(), 0.5);
    free_music(testMusic);
    close_audio();
end;
procedure TIntegrationTests.TestPauseMusicIntegration;
begin
    open_audio();
    testMusic := load_music("test_music", "280.mp3");
    play_music(testMusic);
    pause_music();
    AssertFalse(music_playing());
    free_music(testMusic);
    close_audio();
end;
procedure TIntegrationTests.TestPlayMusicNamedIntegration;
begin
    open_audio();
    testMusic := load_music("test_music", "280.mp3");
    play_music("test_music");
    AssertTrue(music_playing());
    free_music(testMusic);
    close_audio();
end;
procedure TIntegrationTests.TestPlayMusicNamedWithTimesIntegration;
begin
    open_audio();
    testMusic := load_music("test_music", "280.mp3");
    play_music("test_music", 2);
    AssertTrue(music_playing());
    free_music(testMusic);
    close_audio();
end;
procedure TIntegrationTests.TestPlayMusicIntegration;
begin
    open_audio();
    testMusic := load_music("test_music", "280.mp3");
    play_music(testMusic);
    AssertTrue(music_playing());
    free_music(testMusic);
    close_audio();
end;
procedure TIntegrationTests.TestPlayMusicWithTimesIntegration;
begin
    open_audio();
    testMusic := load_music("test_music", "280.mp3");
    play_music(testMusic, 2);
    AssertTrue(music_playing());
    free_music(testMusic);
    close_audio();
end;
procedure TIntegrationTests.TestPlayMusicWithTimesAndVolumeIntegration;
begin
    open_audio();
    testMusic := load_music("test_music", "280.mp3");
    play_music(testMusic, 2, 0.5);
    AssertTrue(music_playing());
    AssertTrue((music_volume() >= 0.45) and (music_volume() <= 0.55));
    free_music(testMusic);
    close_audio();
end;
procedure TIntegrationTests.TestResumeMusicIntegration;
begin
    open_audio();
    testMusic := load_music("test_music", "280.mp3");
    play_music(testMusic);
    pause_music();
    AssertFalse(music_playing());
    resume_music();
    AssertTrue(music_playing());
    free_music(testMusic);
    close_audio();
end;
procedure TIntegrationTests.TestSetMusicVolumeIntegration;
begin
    open_audio();
    testMusic := load_music("test_music", "280.mp3");
    play_music(testMusic);
    set_music_volume(0.5);
    AssertEquals(music_volume(), 0.5);
    free_music(testMusic);
    close_audio();
end;
procedure TIntegrationTests.TestStopMusicIntegration;
begin
    open_audio();
    testMusic := load_music("test_music", "280.mp3");
    play_music(testMusic);
    stop_music();
    AssertFalse(music_playing());
    free_music(testMusic);
    close_audio();
end;
procedure TIntegrationTests.TestFadeAllSoundEffectsOutIntegration;
begin
    open_audio();
    testSound1 := load_sound_effect("test_sound1", "test.ogg");
    testSound2 := load_sound_effect("test_sound2", "error.wav");
    play_sound_effect(testSound1);
    play_sound_effect(testSound2);
    fade_all_sound_effects_out(1000);
    AssertFalse(sound_effect_playing(testSound1));
    AssertFalse(sound_effect_playing(testSound2));
    free_all_sound_effects();
    close_audio();
end;
procedure TIntegrationTests.TestFadeSoundEffectOutIntegration;
begin
    open_audio();
    testSound := load_sound_effect("test_sound", "test.ogg");
    play_sound_effect(testSound);
    fade_sound_effect_out(testSound, 1000);
    AssertFalse(sound_effect_playing(testSound));
    free_sound_effect(testSound);
    close_audio();
end;
procedure TIntegrationTests.TestFreeAllSoundEffectsIntegration;
begin
    open_audio();
    testSound1 := load_sound_effect("test_sound1", "test.ogg");
    testSound2 := load_sound_effect("test_sound2", "error.wav");
    free_all_sound_effects();
    AssertFalse(has_sound_effect("test_sound1"));
    AssertFalse(has_sound_effect("test_sound2"));
    close_audio();
end;
procedure TIntegrationTests.TestFreeSoundEffectIntegration;
begin
    open_audio();
    testSound := load_sound_effect("test_sound", "test.ogg");
    play_sound_effect(testSound);
    free_sound_effect(testSound);
    AssertFalse(sound_effect_valid(testSound));
    close_audio();
end;
procedure TIntegrationTests.TestHasSoundEffectIntegration;
begin
    open_audio();
    testSound := load_sound_effect("test_sound", "test.ogg");
    AssertTrue(has_sound_effect("test_sound"));
    free_sound_effect(testSound);
    AssertFalse(has_sound_effect("test_sound"));
    close_audio();
end;
procedure TIntegrationTests.TestLoadSoundEffectIntegration;
begin
    open_audio();
    testSound := load_sound_effect("test_sound", "test.ogg");
    AssertTrue(sound_effect_valid(testSound));
    free_sound_effect(testSound);
    close_audio();
end;
procedure TIntegrationTests.TestPlaySoundEffectNamedIntegration;
begin
    open_audio();
    testSound := load_sound_effect("test_sound", "test.ogg");
    play_sound_effect("test_sound");
    AssertTrue(sound_effect_playing("test_sound"));
    free_sound_effect(testSound);
    close_audio();
end;
procedure TIntegrationTests.TestPlaySoundEffectNamedWithVolumeIntegration;
begin
    open_audio();
    testSound := load_sound_effect("test_sound", "test.ogg");
    play_sound_effect("test_sound", 0.5);
    AssertTrue(sound_effect_playing("test_sound"));
    free_sound_effect(testSound);
    close_audio();
end;
procedure TIntegrationTests.TestPlaySoundEffectNamedWithTimesIntegration;
begin
    open_audio();
    testSound := load_sound_effect("test_sound", "test.ogg");
    play_sound_effect("test_sound", 3);
    AssertTrue(sound_effect_playing("test_sound"));
    free_sound_effect(testSound);
    close_audio();
end;
procedure TIntegrationTests.TestPlaySoundEffectNamedWithTimesAndVolumeIntegration;
begin
    open_audio();
    testSound := load_sound_effect("test_sound", "test.ogg");
    play_sound_effect("test_sound", 2, 0.5);
    AssertTrue(sound_effect_playing("test_sound"));
    free_sound_effect(testSound);
    close_audio();
end;
procedure TIntegrationTests.TestPlaySoundEffectIntegration;
begin
    open_audio();
    testSound := load_sound_effect("test_sound", "test.ogg");
    play_sound_effect(testSound);
    AssertTrue(sound_effect_playing(testSound));
    free_sound_effect(testSound);
    close_audio();
end;
procedure TIntegrationTests.TestPlaySoundEffectWithVolumeIntegration;
begin
    open_audio();
    testSound := load_sound_effect("test_sound", "test.ogg");
    play_sound_effect(testSound, 0.5);
    AssertTrue(sound_effect_playing(testSound));
    free_sound_effect(testSound);
    close_audio();
end;
procedure TIntegrationTests.TestPlaySoundEffectWithTimesIntegration;
begin
    open_audio();
    testSound := load_sound_effect("test_sound", "test.ogg");
    play_sound_effect(testSound, 3);
    AssertTrue(sound_effect_playing(testSound));
    free_sound_effect(testSound);
    close_audio();
end;
procedure TIntegrationTests.TestPlaySoundEffectWithTimesAndVolumeIntegration;
begin
    open_audio();
    testSound := load_sound_effect("test_sound", "test.ogg");
    play_sound_effect(testSound, 2, 0.5);
    AssertTrue(sound_effect_playing(testSound));
    free_sound_effect(testSound);
    close_audio();
end;
procedure TIntegrationTests.TestSoundEffectFilenameIntegration;
begin
    testSound := load_sound_effect("test_sound", "test.ogg");
    testFilename := sound_effect_filename(testSound);
    AssertEquals(testFilename, "test.ogg");
    free_sound_effect(testSound);
end;
procedure TIntegrationTests.TestSoundEffectNameIntegration;
begin
    testSound := load_sound_effect("test_sound", "test.ogg");
    testSoundName := sound_effect_name(testSound);
    AssertEquals(testSoundName, "test_sound");
    free_sound_effect(testSound);
end;
procedure TIntegrationTests.TestSoundEffectNamedIntegration;
begin
    open_audio();
    testSound := load_sound_effect("test_sound", "test.ogg");
    retrievedSound := sound_effect_named("test_sound");
    AssertEquals(testSound, retrievedSound);
    free_sound_effect(testSound);
    close_audio();
end;
procedure TIntegrationTests.TestSoundEffectPlayingNamedIntegration;
begin
    open_audio();
    testSound := load_sound_effect("test_sound", "test.ogg");
    play_sound_effect("test_sound");
    AssertTrue(sound_effect_playing("test_sound"));
    stop_sound_effect("test_sound");
    AssertFalse(sound_effect_playing("test_sound"));
    free_sound_effect(testSound);
    close_audio();
end;
procedure TIntegrationTests.TestSoundEffectPlayingIntegration;
begin
    open_audio();
    testSound := load_sound_effect("test_sound", "test.ogg");
    play_sound_effect(testSound);
    AssertTrue(sound_effect_playing(testSound));
    stop_sound_effect(testSound);
    AssertFalse(sound_effect_playing(testSound));
    free_sound_effect(testSound);
    close_audio();
end;
procedure TIntegrationTests.TestSoundEffectValidIntegration;
begin
    open_audio();
    testSoundEffect := load_sound_effect("test_sound", "test.ogg");
    AssertTrue(sound_effect_valid(testSoundEffect));
    free_sound_effect(testSoundEffect);
    close_audio();
end;
procedure TIntegrationTests.TestStopSoundEffectNamedIntegration;
begin
    open_audio();
    testSound := load_sound_effect("test_sound", "test.ogg");
    play_sound_effect("test_sound");
    stop_sound_effect("test_sound");
    AssertFalse(sound_effect_playing("test_sound"));
    free_sound_effect(testSound);
    close_audio();
end;
end;

procedure RegisterTests;
begin
TestFramework.RegisterTest(TIntegrationTests.Suite);
end;
