uses SplashKit, TestFramework

type
TIntegrationTests = class(TTestCase)
published
procedure TIntegrationTests.TestAudioReadyIntegration;
begin
    AssertFalse(AudioReady());
    OpenAudio();
    AssertTrue(AudioReady());
    CloseAudio();
    AssertFalse(AudioReady());
end;
procedure TIntegrationTests.TestCloseAudioIntegration;
begin
    OpenAudio();
    CloseAudio();
    AssertFalse(AudioReady());
end;
procedure TIntegrationTests.TestOpenAudioIntegration;
begin
    AssertFalse(AudioReady());
    OpenAudio();
    AssertTrue(AudioReady());
    CloseAudio();
    AssertFalse(AudioReady());
end;
procedure TIntegrationTests.TestFadeMusicInNamedIntegration;
begin
    OpenAudio();
    testMusic := LoadMusic("test_music", "280.mp3");
    FadeMusicIn("test_music", 1000);
    AssertTrue(MusicVolume() > 0.0);
    FreeMusic(testMusic);
    CloseAudio();
end;
procedure TIntegrationTests.TestFadeMusicInNamedWithTimesIntegration;
begin
    OpenAudio();
    testMusic := LoadMusic("test_music", "280.mp3");
    FadeMusicIn("test_music", 2, 1000);
    AssertTrue(MusicVolume() > 0.0);
    FreeMusic(testMusic);
    CloseAudio();
end;
procedure TIntegrationTests.TestFadeMusicInIntegration;
begin
    OpenAudio();
    testMusic := LoadMusic("test_music", "280.mp3");
    PlayMusic(testMusic);
    FadeMusicIn(testMusic, 1000);
    AssertTrue(MusicVolume() > 0.0);
    FreeMusic(testMusic);
    CloseAudio();
end;
procedure TIntegrationTests.TestFadeMusicInWithTimesIntegration;
begin
    OpenAudio();
    testMusic := LoadMusic("test_music", "280.mp3");
    FadeMusicIn(testMusic, 2, 1000);
    AssertTrue(MusicVolume() > 0.0);
    FreeMusic(testMusic);
    CloseAudio();
end;
procedure TIntegrationTests.TestFadeMusicOutIntegration;
begin
    OpenAudio();
    testMusic := LoadMusic("test_music", "280.mp3");
    PlayMusic(testMusic);
    FadeMusicOut(1000);
    AssertFalse(MusicPlaying());
    FreeMusic(testMusic);
    CloseAudio();
end;
procedure TIntegrationTests.TestFreeAllMusicIntegration;
begin
    OpenAudio();
    testMusic1 := LoadMusic("test_music1", "280.mp3");
    testMusic2 := LoadMusic("test_music2", "test.ogg");
    FreeAllMusic();
    AssertFalse(HasMusic("test_music1"));
    AssertFalse(HasMusic("test_music2"));
    CloseAudio();
end;
procedure TIntegrationTests.TestFreeMusicIntegration;
begin
    OpenAudio();
    testMusic := LoadMusic("test_music", "280.mp3");
    PlayMusic(testMusic);
    FreeMusic(testMusic);
    AssertFalse(MusicPlaying());
    CloseAudio();
end;
procedure TIntegrationTests.TestHasMusicIntegration;
begin
    OpenAudio();
    testMusic := LoadMusic("test_music", "280.mp3");
    AssertTrue(HasMusic("test_music"));
    FreeMusic(testMusic);
    AssertFalse(HasMusic("test_music"));
    CloseAudio();
end;
procedure TIntegrationTests.TestLoadMusicIntegration;
begin
    OpenAudio();
    testMusic := LoadMusic("test_music", "280.mp3");
    AssertTrue(MusicValid(testMusic));
    FreeMusic(testMusic);
    CloseAudio();
end;
procedure TIntegrationTests.TestMusicFilenameIntegration;
begin
    testMusic := LoadMusic("test_music", "280.mp3");
    filename := MusicFilename(testMusic);
    AssertEquals("280.mp3", filename);
    FreeMusic(testMusic);
end;
procedure TIntegrationTests.TestMusicNameIntegration;
begin
    testMusic := LoadMusic("test_music", "280.mp3");
    musicNameResult := MusicName(testMusic);
    AssertEquals("test_music", musicNameResult);
    FreeMusic(testMusic);
end;
procedure TIntegrationTests.TestMusicNamedIntegration;
begin
    testMusic := LoadMusic("test_music", "280.mp3");
    retrievedMusic := MusicNamed("test_music");
    AssertEquals(retrievedMusic, testMusic);
    FreeMusic(testMusic);
end;
procedure TIntegrationTests.TestMusicPlayingIntegration;
begin
    OpenAudio();
    testMusic := LoadMusic("test_music", "280.mp3");
    PlayMusic(testMusic);
    AssertTrue(MusicPlaying());
    PauseMusic();
    AssertFalse(MusicPlaying());
    FreeMusic(testMusic);
    CloseAudio();
end;
procedure TIntegrationTests.TestMusicValidIntegration;
begin
    OpenAudio();
    testMusic := LoadMusic("test_music", "280.mp3");
    AssertTrue(MusicValid(testMusic));
    FreeMusic(testMusic);
    AssertFalse(MusicValid(testMusic));
    CloseAudio();
end;
procedure TIntegrationTests.TestMusicVolumeIntegration;
begin
    OpenAudio();
    testMusic := LoadMusic("test_music", "280.mp3");
    PlayMusic(testMusic);
    SetMusicVolume(0.5);
    AssertEquals(0.5, MusicVolume());
    FreeMusic(testMusic);
    CloseAudio();
end;
procedure TIntegrationTests.TestPauseMusicIntegration;
begin
    OpenAudio();
    testMusic := LoadMusic("test_music", "280.mp3");
    PlayMusic(testMusic);
    PauseMusic();
    AssertFalse(MusicPlaying());
    FreeMusic(testMusic);
    CloseAudio();
end;
procedure TIntegrationTests.TestPlayMusicNamedIntegration;
begin
    OpenAudio();
    testMusic := LoadMusic("test_music", "280.mp3");
    PlayMusic("test_music");
    AssertTrue(MusicPlaying());
    FreeMusic(testMusic);
    CloseAudio();
end;
procedure TIntegrationTests.TestPlayMusicNamedWithTimesIntegration;
begin
    OpenAudio();
    testMusic := LoadMusic("test_music", "280.mp3");
    PlayMusic("test_music", 2);
    AssertTrue(MusicPlaying());
    FreeMusic(testMusic);
    CloseAudio();
end;
procedure TIntegrationTests.TestPlayMusicIntegration;
begin
    OpenAudio();
    testMusic := LoadMusic("test_music", "280.mp3");
    PlayMusic(testMusic);
    AssertTrue(MusicPlaying());
    FreeMusic(testMusic);
    CloseAudio();
end;
procedure TIntegrationTests.TestPlayMusicWithTimesIntegration;
begin
    OpenAudio();
    testMusic := LoadMusic("test_music", "280.mp3");
    PlayMusic(testMusic, 2);
    AssertTrue(MusicPlaying());
    FreeMusic(testMusic);
    CloseAudio();
end;
procedure TIntegrationTests.TestPlayMusicWithTimesAndVolumeIntegration;
begin
    OpenAudio();
    testMusic := LoadMusic("test_music", "280.mp3");
    PlayMusic(testMusic, 2, 0.5);
    AssertTrue(MusicPlaying());
    AssertTrue((MusicVolume() >= 0.45) and (MusicVolume() <= 0.55));
    FreeMusic(testMusic);
    CloseAudio();
end;
procedure TIntegrationTests.TestResumeMusicIntegration;
begin
    OpenAudio();
    testMusic := LoadMusic("test_music", "280.mp3");
    PlayMusic(testMusic);
    PauseMusic();
    AssertFalse(MusicPlaying());
    ResumeMusic();
    AssertTrue(MusicPlaying());
    FreeMusic(testMusic);
    CloseAudio();
end;
procedure TIntegrationTests.TestSetMusicVolumeIntegration;
begin
    OpenAudio();
    testMusic := LoadMusic("test_music", "280.mp3");
    PlayMusic(testMusic);
    SetMusicVolume(0.5);
    AssertEquals(0.5, MusicVolume());
    FreeMusic(testMusic);
    CloseAudio();
end;
procedure TIntegrationTests.TestStopMusicIntegration;
begin
    OpenAudio();
    testMusic := LoadMusic("test_music", "280.mp3");
    PlayMusic(testMusic);
    StopMusic();
    AssertFalse(MusicPlaying());
    FreeMusic(testMusic);
    CloseAudio();
end;
procedure TIntegrationTests.TestFadeAllSoundEffectsOutIntegration;
begin
    OpenAudio();
    testSound1 := LoadSoundEffect("test_sound1", "test.ogg");
    testSound2 := LoadSoundEffect("test_sound2", "error.wav");
    PlaySoundEffect(testSound1);
    PlaySoundEffect(testSound2);
    FadeAllSoundEffectsOut(1000);
    AssertFalse(SoundEffectPlaying(testSound1));
    AssertFalse(SoundEffectPlaying(testSound2));
    FreeAllSoundEffects();
    CloseAudio();
end;
procedure TIntegrationTests.TestFadeSoundEffectOutIntegration;
begin
    OpenAudio();
    testSound := LoadSoundEffect("test_sound", "test.ogg");
    PlaySoundEffect(testSound);
    FadeSoundEffectOut(testSound, 1000);
    AssertFalse(SoundEffectPlaying(testSound));
    FreeSoundEffect(testSound);
    CloseAudio();
end;
procedure TIntegrationTests.TestFreeAllSoundEffectsIntegration;
begin
    OpenAudio();
    testSound1 := LoadSoundEffect("test_sound1", "test.ogg");
    testSound2 := LoadSoundEffect("test_sound2", "error.wav");
    FreeAllSoundEffects();
    AssertFalse(HasSoundEffect("test_sound1"));
    AssertFalse(HasSoundEffect("test_sound2"));
    CloseAudio();
end;
procedure TIntegrationTests.TestFreeSoundEffectIntegration;
begin
    OpenAudio();
    testSound := LoadSoundEffect("test_sound", "test.ogg");
    PlaySoundEffect(testSound);
    FreeSoundEffect(testSound);
    AssertFalse(SoundEffectValid(testSound));
    CloseAudio();
end;
procedure TIntegrationTests.TestHasSoundEffectIntegration;
begin
    OpenAudio();
    testSound := LoadSoundEffect("test_sound", "test.ogg");
    AssertTrue(HasSoundEffect("test_sound"));
    FreeSoundEffect(testSound);
    AssertFalse(HasSoundEffect("test_sound"));
    CloseAudio();
end;
procedure TIntegrationTests.TestLoadSoundEffectIntegration;
begin
    OpenAudio();
    testSound := LoadSoundEffect("test_sound", "test.ogg");
    AssertTrue(SoundEffectValid(testSound));
    FreeSoundEffect(testSound);
    CloseAudio();
end;
procedure TIntegrationTests.TestPlaySoundEffectNamedIntegration;
begin
    OpenAudio();
    testSound := LoadSoundEffect("test_sound", "test.ogg");
    PlaySoundEffect("test_sound");
    AssertTrue(SoundEffectPlaying("test_sound"));
    FreeSoundEffect(testSound);
    CloseAudio();
end;
procedure TIntegrationTests.TestPlaySoundEffectNamedWithVolumeIntegration;
begin
    OpenAudio();
    testSound := LoadSoundEffect("test_sound", "test.ogg");
    PlaySoundEffect("test_sound", 0.5);
    AssertTrue(SoundEffectPlaying("test_sound"));
    FreeSoundEffect(testSound);
    CloseAudio();
end;
procedure TIntegrationTests.TestPlaySoundEffectNamedWithTimesIntegration;
begin
    OpenAudio();
    testSound := LoadSoundEffect("test_sound", "test.ogg");
    PlaySoundEffect("test_sound", 3);
    AssertTrue(SoundEffectPlaying("test_sound"));
    FreeSoundEffect(testSound);
    CloseAudio();
end;
procedure TIntegrationTests.TestPlaySoundEffectNamedWithTimesAndVolumeIntegration;
begin
    OpenAudio();
    testSound := LoadSoundEffect("test_sound", "test.ogg");
    PlaySoundEffect("test_sound", 2, 0.5);
    AssertTrue(SoundEffectPlaying("test_sound"));
    FreeSoundEffect(testSound);
    CloseAudio();
end;
procedure TIntegrationTests.TestPlaySoundEffectIntegration;
begin
    OpenAudio();
    testSound := LoadSoundEffect("test_sound", "test.ogg");
    PlaySoundEffect(testSound);
    AssertTrue(SoundEffectPlaying(testSound));
    FreeSoundEffect(testSound);
    CloseAudio();
end;
procedure TIntegrationTests.TestPlaySoundEffectWithVolumeIntegration;
begin
    OpenAudio();
    testSound := LoadSoundEffect("test_sound", "test.ogg");
    PlaySoundEffect(testSound, 0.5);
    AssertTrue(SoundEffectPlaying(testSound));
    FreeSoundEffect(testSound);
    CloseAudio();
end;
procedure TIntegrationTests.TestPlaySoundEffectWithTimesIntegration;
begin
    OpenAudio();
    testSound := LoadSoundEffect("test_sound", "test.ogg");
    PlaySoundEffect(testSound, 3);
    AssertTrue(SoundEffectPlaying(testSound));
    FreeSoundEffect(testSound);
    CloseAudio();
end;
procedure TIntegrationTests.TestPlaySoundEffectWithTimesAndVolumeIntegration;
begin
    OpenAudio();
    testSound := LoadSoundEffect("test_sound", "test.ogg");
    PlaySoundEffect(testSound, 2, 0.5);
    AssertTrue(SoundEffectPlaying(testSound));
    FreeSoundEffect(testSound);
    CloseAudio();
end;
procedure TIntegrationTests.TestSoundEffectFilenameIntegration;
begin
    testSound := LoadSoundEffect("test_sound", "test.ogg");
    testFilename := SoundEffectFilename(testSound);
    AssertEquals("test.ogg", testFilename);
    FreeSoundEffect(testSound);
end;
procedure TIntegrationTests.TestSoundEffectNameIntegration;
begin
    testSound := LoadSoundEffect("test_sound", "test.ogg");
    testSoundName := SoundEffectName(testSound);
    AssertEquals("test_sound", testSoundName);
    FreeSoundEffect(testSound);
end;
procedure TIntegrationTests.TestSoundEffectNamedIntegration;
begin
    OpenAudio();
    testSound := LoadSoundEffect("test_sound", "test.ogg");
    retrievedSound := SoundEffectNamed("test_sound");
    AssertEquals(retrievedSound, testSound);
    FreeSoundEffect(testSound);
    CloseAudio();
end;
procedure TIntegrationTests.TestSoundEffectPlayingNamedIntegration;
begin
    OpenAudio();
    testSound := LoadSoundEffect("test_sound", "test.ogg");
    PlaySoundEffect("test_sound");
    AssertTrue(SoundEffectPlaying("test_sound"));
    StopSoundEffect("test_sound");
    AssertFalse(SoundEffectPlaying("test_sound"));
    FreeSoundEffect(testSound);
    CloseAudio();
end;
procedure TIntegrationTests.TestSoundEffectPlayingIntegration;
begin
    OpenAudio();
    testSound := LoadSoundEffect("test_sound", "test.ogg");
    PlaySoundEffect(testSound);
    AssertTrue(SoundEffectPlaying(testSound));
    StopSoundEffect(testSound);
    AssertFalse(SoundEffectPlaying(testSound));
    FreeSoundEffect(testSound);
    CloseAudio();
end;
procedure TIntegrationTests.TestSoundEffectValidIntegration;
begin
    OpenAudio();
    testSoundEffect := LoadSoundEffect("test_sound", "test.ogg");
    AssertTrue(SoundEffectValid(testSoundEffect));
    FreeSoundEffect(testSoundEffect);
    CloseAudio();
end;
procedure TIntegrationTests.TestStopSoundEffectNamedIntegration;
begin
    OpenAudio();
    testSound := LoadSoundEffect("test_sound", "test.ogg");
    PlaySoundEffect("test_sound");
    StopSoundEffect("test_sound");
    AssertFalse(SoundEffectPlaying("test_sound"));
    FreeSoundEffect(testSound);
    CloseAudio();
end;
end;

procedure RegisterTests;
begin
TestFramework.RegisterTest(TIntegrationTests.Suite);
end;
