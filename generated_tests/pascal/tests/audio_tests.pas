uses SplashKit, TestFramework

type
TTestAudio = class(TTestCase)
protected
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
    AssertTrue(AudioReady());
    CloseAudio();
    AssertFalse(AudioReady());
end;
procedure TIntegrationTests.TestOpenAudioIntegration;
begin
    OpenAudio();
    AssertTrue(AudioReady());
    CloseAudio();
    AssertFalse(AudioReady());
end;
procedure TIntegrationTests.TestFadeMusicInNamedIntegration;
begin
    OpenAudio();
    testMusic := LoadMusic('test_music', 'magical_night.ogg');
    FadeMusicIn('test_music', 1000);
    AssertTrue(MusicPlaying());
    FreeMusic(testMusic);
    CloseAudio();
end;
procedure TIntegrationTests.TestFadeMusicInNamedWithTimesIntegration;
begin
    OpenAudio();
    testMusic := LoadMusic('test_music', 'magical_night.ogg');
    FadeMusicIn('test_music', 2, 1000);
    AssertTrue(MusicPlaying());
    FreeMusic(testMusic);
    CloseAudio();
end;
procedure TIntegrationTests.TestFadeMusicInIntegration;
begin
    OpenAudio();
    testMusic := LoadMusic('test_music', 'magical_night.ogg');
    FadeMusicIn(testMusic, 1000);
    AssertTrue(MusicPlaying());
    FreeMusic(testMusic);
    CloseAudio();
end;
procedure TIntegrationTests.TestFadeMusicInWithTimesIntegration;
begin
    OpenAudio();
    testMusic := LoadMusic('test_music', 'magical_night.ogg');
    FadeMusicIn(testMusic, 2, 1000);
    AssertTrue(MusicPlaying());
    FreeMusic(testMusic);
    CloseAudio();
end;
procedure TIntegrationTests.TestFadeMusicOutIntegration;
begin
    OpenAudio();
    testMusic := LoadMusic('test_music', 'magical_night.ogg');
    PlayMusic(testMusic);
    FadeMusicOut(1000);
    Delay(3000);
    AssertFalse(MusicPlaying());
    FreeMusic(testMusic);
    CloseAudio();
end;
procedure TIntegrationTests.TestFreeAllMusicIntegration;
begin
    OpenAudio();
    LoadMusic('test_music1', 'magical_night.ogg');
    LoadMusic('test_music2', 'dancingFrog.wav');
    FreeAllMusic();
    AssertFalse(HasMusic('test_music1'));
    AssertFalse(HasMusic('test_music2'));
    CloseAudio();
end;
procedure TIntegrationTests.TestFreeMusicIntegration;
begin
    OpenAudio();
    testMusic := LoadMusic('test_music', 'magical_night.ogg');
    PlayMusic(testMusic);
    FreeMusic(testMusic);
    AssertFalse(HasMusic('test_music'));
    CloseAudio();
end;
procedure TIntegrationTests.TestHasMusicIntegration;
begin
    OpenAudio();
    testMusic := LoadMusic('test_music', 'magical_night.ogg');
    AssertTrue(HasMusic('test_music'));
    FreeMusic(testMusic);
    AssertFalse(HasMusic('test_music'));
    CloseAudio();
end;
procedure TIntegrationTests.TestLoadMusicIntegration;
begin
    OpenAudio();
    testMusic := LoadMusic('test_music', 'magical_night.ogg');
    AssertNotNull(testMusic);
    AssertTrue(MusicValid(testMusic));
    FreeMusic(testMusic);
    CloseAudio();
end;
procedure TIntegrationTests.TestMusicFilenameIntegration;
begin
    OpenAudio();
    testMusic := LoadMusic('test_music', 'magical_night.ogg');
    AssertEquals(PathToResource('magical_night.ogg', ResourceKind.SOUND_RESOURCE), MusicFilename(testMusic));
    FreeMusic(testMusic);
    CloseAudio();
end;
procedure TIntegrationTests.TestMusicNameIntegration;
begin
    OpenAudio();
    testMusic := LoadMusic('test_music', 'magical_night.ogg');
    AssertEquals('test_music', MusicName(testMusic));
    FreeMusic(testMusic);
    CloseAudio();
end;
procedure TIntegrationTests.TestMusicNamedIntegration;
begin
    OpenAudio();
    testMusic := LoadMusic('test_music', 'magical_night.ogg');
    namedMusic := MusicNamed('test_music');
    AssertEquals(testMusic, namedMusic);
    FreeMusic(testMusic);
    CloseAudio();
end;
procedure TIntegrationTests.TestMusicPlayingIntegration;
begin
    OpenAudio();
    testMusic := LoadMusic('test_music', 'magical_night.ogg');
    AssertFalse(MusicPlaying());
    PlayMusic(testMusic);
    AssertTrue(MusicPlaying());
    FreeMusic(testMusic);
    CloseAudio();
end;
procedure TIntegrationTests.TestMusicValidIntegration;
begin
    OpenAudio();
    testMusic := LoadMusic('test_music', 'magical_night.ogg');
    AssertTrue(MusicValid(testMusic));
    FreeMusic(testMusic);
    AssertFalse(MusicValid(testMusic));
    CloseAudio();
end;
procedure TIntegrationTests.TestMusicVolumeIntegration;
begin
    OpenAudio();
    testMusic := LoadMusic('test_music', 'magical_night.ogg');
    PlayMusic(testMusic);
    SetMusicVolume(0.5);
    AssertEquals(0.5, MusicVolume());
    FreeMusic(testMusic);
    CloseAudio();
end;
procedure TIntegrationTests.TestPauseMusicIntegration;
begin
    OpenAudio();
    testMusic := LoadMusic('test_music', 'magical_night.ogg');
    PlayMusic(testMusic);
    PauseMusic();
    AssertTrue(MusicPlaying());
    FreeMusic(testMusic);
    CloseAudio();
end;
procedure TIntegrationTests.TestPlayMusicNamedIntegration;
begin
    OpenAudio();
    testMusic := LoadMusic('test_music', 'magical_night.ogg');
    PlayMusic('test_music');
    AssertTrue(MusicPlaying());
    FreeMusic(testMusic);
    CloseAudio();
end;
procedure TIntegrationTests.TestPlayMusicNamedWithTimesIntegration;
begin
    OpenAudio();
    testMusic := LoadMusic('test_music', 'magical_night.ogg');
    PlayMusic('test_music', 2);
    AssertTrue(MusicPlaying());
    FreeMusic(testMusic);
    CloseAudio();
end;
procedure TIntegrationTests.TestPlayMusicIntegration;
begin
    OpenAudio();
    testMusic := LoadMusic('test_music', 'magical_night.ogg');
    PlayMusic(testMusic);
    AssertTrue(MusicPlaying());
    FreeMusic(testMusic);
    CloseAudio();
end;
procedure TIntegrationTests.TestPlayMusicWithTimesIntegration;
begin
    OpenAudio();
    testMusic := LoadMusic('test_music', 'magical_night.ogg');
    PlayMusic(testMusic, 2);
    AssertTrue(MusicPlaying());
    FreeMusic(testMusic);
    CloseAudio();
end;
procedure TIntegrationTests.TestPlayMusicWithTimesAndVolumeIntegration;
begin
    OpenAudio();
    testMusic := LoadMusic('test_music', 'magical_night.ogg');
    PlayMusic(testMusic, 2, 0.75);
    AssertTrue(MusicPlaying());
    AssertEquals(0.75, MusicVolume());
    FreeMusic(testMusic);
    CloseAudio();
end;
procedure TIntegrationTests.TestResumeMusicIntegration;
begin
    OpenAudio();
    testMusic := LoadMusic('test_music', 'magical_night.ogg');
    PlayMusic(testMusic);
    PauseMusic();
    AssertTrue(MusicPlaying());
    ResumeMusic();
    AssertTrue(MusicPlaying());
    FreeMusic(testMusic);
    CloseAudio();
end;
procedure TIntegrationTests.TestSetMusicVolumeIntegration;
begin
    OpenAudio();
    testMusic := LoadMusic('test_music', 'magical_night.ogg');
    PlayMusic(testMusic);
    SetMusicVolume(0.5);
    AssertEquals(0.5, MusicVolume());
    FreeMusic(testMusic);
    CloseAudio();
end;
procedure TIntegrationTests.TestStopMusicIntegration;
begin
    OpenAudio();
    testMusic := LoadMusic('test_music', 'magical_night.ogg');
    PlayMusic(testMusic);
    StopMusic();
    AssertFalse(MusicPlaying());
    FreeMusic(testMusic);
    CloseAudio();
end;
procedure TIntegrationTests.TestFadeAllSoundEffectsOutIntegration;
begin
    OpenAudio();
    testSound1 := LoadSoundEffect('test_sound1', 'breakdance.wav');
    testSound2 := LoadSoundEffect('test_sound2', 'comedy_boing.ogg');
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
    testSound := LoadSoundEffect('test_sound', 'breakdance.wav');
    PlaySoundEffect(testSound);
    FadeSoundEffectOut(testSound, 1000);
    Delay(3000);
    AssertFalse(SoundEffectPlaying(testSound));
    FreeSoundEffect(testSound);
    CloseAudio();
end;
procedure TIntegrationTests.TestFreeAllSoundEffectsIntegration;
begin
    OpenAudio();
    LoadSoundEffect('test_sound1', 'breakdance.wav');
    LoadSoundEffect('test_sound2', 'comedy_boing.ogg');
    FreeAllSoundEffects();
    AssertFalse(HasSoundEffect('test_sound1'));
    AssertFalse(HasSoundEffect('test_sound2'));
    CloseAudio();
end;
procedure TIntegrationTests.TestFreeSoundEffectIntegration;
begin
    OpenAudio();
    testSound := LoadSoundEffect('test_sound', 'breakdance.wav');
    PlaySoundEffect(testSound);
    FreeSoundEffect(testSound);
    AssertFalse(HasSoundEffect('test_sound'));
    CloseAudio();
end;
procedure TIntegrationTests.TestHasSoundEffectIntegration;
begin
    OpenAudio();
    testSound := LoadSoundEffect('test_sound', 'breakdance.wav');
    AssertTrue(HasSoundEffect('test_sound'));
    FreeSoundEffect(testSound);
    AssertFalse(HasSoundEffect('test_sound'));
    CloseAudio();
end;
procedure TIntegrationTests.TestLoadSoundEffectIntegration;
begin
    OpenAudio();
    testSound := LoadSoundEffect('test_sound', 'breakdance.wav');
    AssertNotNull(testSound);
    AssertTrue(HasSoundEffect('test_sound'));
    FreeSoundEffect(testSound);
    CloseAudio();
end;
procedure TIntegrationTests.TestPlaySoundEffectNamedIntegration;
begin
    OpenAudio();
    testSound := LoadSoundEffect('test_sound', 'breakdance.wav');
    PlaySoundEffect('test_sound');
    AssertTrue(SoundEffectPlaying(testSound));
    FreeSoundEffect(testSound);
    CloseAudio();
end;
procedure TIntegrationTests.TestPlaySoundEffectNamedWithVolumeIntegration;
begin
    OpenAudio();
    testSound := LoadSoundEffect('test_sound', 'breakdance.wav');
    PlaySoundEffect('test_sound', 0.75);
    AssertTrue(SoundEffectPlaying(testSound));
    FreeSoundEffect(testSound);
    CloseAudio();
end;
procedure TIntegrationTests.TestPlaySoundEffectNamedWithTimesIntegration;
begin
    OpenAudio();
    testSound := LoadSoundEffect('test_sound', 'breakdance.wav');
    PlaySoundEffect('test_sound', 3);
    AssertTrue(SoundEffectPlaying(testSound));
    FreeSoundEffect(testSound);
    CloseAudio();
end;
procedure TIntegrationTests.TestPlaySoundEffectNamedWithTimesAndVolumeIntegration;
begin
    OpenAudio();
    testSound := LoadSoundEffect('test_sound', 'breakdance.wav');
    PlaySoundEffect('test_sound', 2, 0.75);
    AssertTrue(SoundEffectPlaying(testSound));
    FreeSoundEffect(testSound);
    CloseAudio();
end;
procedure TIntegrationTests.TestPlaySoundEffectIntegration;
begin
    OpenAudio();
    testSound := LoadSoundEffect('test_sound', 'breakdance.wav');
    PlaySoundEffect(testSound);
    AssertTrue(SoundEffectPlaying(testSound));
    FreeSoundEffect(testSound);
    CloseAudio();
end;
procedure TIntegrationTests.TestPlaySoundEffectWithVolumeIntegration;
begin
    OpenAudio();
    testSound := LoadSoundEffect('test_sound', 'breakdance.wav');
    PlaySoundEffect(testSound, 0.75);
    AssertTrue(SoundEffectPlaying(testSound));
    FreeSoundEffect(testSound);
    CloseAudio();
end;
procedure TIntegrationTests.TestPlaySoundEffectWithTimesIntegration;
begin
    OpenAudio();
    testSound := LoadSoundEffect('test_sound', 'SwinGameStart.wav');
    PlaySoundEffect(testSound, 3);
    AssertTrue(SoundEffectPlaying(testSound));
    FreeSoundEffect(testSound);
    CloseAudio();
end;
procedure TIntegrationTests.TestPlaySoundEffectWithTimesAndVolumeIntegration;
begin
    OpenAudio();
    testSound := LoadSoundEffect('test_sound', 'SwinGameStart.wav');
    PlaySoundEffect(testSound, 2, 0.75);
    AssertTrue(SoundEffectPlaying(testSound));
    FreeSoundEffect(testSound);
    CloseAudio();
end;
procedure TIntegrationTests.TestSoundEffectFilenameIntegration;
begin
    OpenAudio();
    testSound := LoadSoundEffect('test_sound', 'SwinGameStart.wav');
    AssertEquals(PathToResource('SwinGameStart.wav', ResourceKind.SOUND_RESOURCE), SoundEffectFilename(testSound));
    FreeSoundEffect(testSound);
    CloseAudio();
end;
procedure TIntegrationTests.TestSoundEffectNameIntegration;
begin
    OpenAudio();
    testSound := LoadSoundEffect('test_sound', 'SwinGameStart.wav');
    AssertEquals('test_sound', SoundEffectName(testSound));
    FreeSoundEffect(testSound);
    CloseAudio();
end;
procedure TIntegrationTests.TestSoundEffectNamedIntegration;
begin
    OpenAudio();
    testSound := LoadSoundEffect('test_sound', 'SwinGameStart.wav');
    namedSound := SoundEffectNamed('test_sound');
    AssertEquals(testSound, namedSound);
    FreeSoundEffect(testSound);
    CloseAudio();
end;
procedure TIntegrationTests.TestSoundEffectPlayingNamedIntegration;
begin
    OpenAudio();
    testSound := LoadSoundEffect('test_sound', 'SwinGameStart.wav');
    PlaySoundEffect('test_sound');
    AssertTrue(SoundEffectPlaying('test_sound'));
    StopSoundEffect('test_sound');
    AssertFalse(SoundEffectPlaying('test_sound'));
    FreeSoundEffect(testSound);
    CloseAudio();
end;
procedure TIntegrationTests.TestSoundEffectPlayingIntegration;
begin
    OpenAudio();
    testSound := LoadSoundEffect('test_sound', 'SwinGameStart.wav');
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
    testSound := LoadSoundEffect('test_sound', 'SwinGameStart.wav');
    AssertNotNull(testSound);
    AssertTrue(HasSoundEffect('test_sound'));
    FreeSoundEffect(testSound);
    CloseAudio();
end;
procedure TIntegrationTests.TestStopSoundEffectNamedIntegration;
begin
    OpenAudio();
    testSound := LoadSoundEffect('test_sound', 'SwinGameStart.wav');
    PlaySoundEffect('test_sound');
    StopSoundEffect('test_sound');
    AssertFalse(SoundEffectPlaying('test_sound'));
    FreeSoundEffect(testSound);
    CloseAudio();
end;
procedure TIntegrationTests.TestStopSoundEffectIntegration;
begin
    OpenAudio();
    testSound := LoadSoundEffect('test_sound', 'SwinGameStart.wav');
    PlaySoundEffect(testSound);
    StopSoundEffect(testSound);
    AssertFalse(SoundEffectPlaying(testSound));
    FreeSoundEffect(testSound);
    CloseAudio();
end;
end;

procedure RegisterTests;
begin
#<Proc:0x00007f20a9d04780 /mnt/c/Users/Noahc/Documents/.Year 2 Semester 3/Team Project (A)/Github Repo/splashkit_test_generator/test_generator/config/languages/pascal_config.rb:128 (lambda)>
end;
