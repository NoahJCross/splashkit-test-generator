uses SplashKit, TestFramework, ../Helpers;
type
    TTestAudio = class(TTestCase)
    protected
        procedure Setup; override;
    end;
begin
    inherited;
    SetResourcesPath('/mnt/c/Users/Noahc/Documents/aYear_2_semester_2/TeamProject/GitHubRepo/splashkit_test_generator/resources');
end;
procedure TestAudioReadyIntegration;
begin
    OpenAudio();
    CleanupAudio := TAudioCleanup.Create;
    AssertTrue(AudioReady());
end;
procedure TestCloseAudioIntegration;
begin
    OpenAudio();
    CleanupAudio := TAudioCleanup.Create;
    AssertTrue(AudioReady());
    CloseAudio();
end;
procedure TestOpenAudioIntegration;
begin
    OpenAudio();
    CleanupAudio := TAudioCleanup.Create;
    AssertTrue(AudioReady());
    CloseAudio();
end;
procedure TestFadeMusicInNamedIntegration;
begin
    OpenAudio();
    CleanupAudio := TAudioCleanup.Create;
    LoadMusic('Test Music', 'magical_night.ogg');
    CleanupMusic := TMusicCleanup.Create;
    FadeMusicIn('Test Music', 1000);
    AssertTrue(MusicPlaying());
end;
procedure TestFadeMusicInNamedWithTimesIntegration;
begin
    OpenAudio();
    CleanupAudio := TAudioCleanup.Create;
    LoadMusic('Test Music', 'magical_night.ogg');
    CleanupMusic := TMusicCleanup.Create;
    FadeMusicIn('Test Music', 2, 1000);
    AssertTrue(MusicPlaying());
end;
procedure TestFadeMusicInIntegration;
begin
    OpenAudio();
    CleanupAudio := TAudioCleanup.Create;
    testMusic := LoadMusic('Test Music', 'magical_night.ogg');
    CleanupMusic := TMusicCleanup.Create;
    FadeMusicIn(testMusic, 1000);
    AssertTrue(MusicPlaying());
end;
procedure TestFadeMusicInWithTimesIntegration;
begin
    OpenAudio();
    CleanupAudio := TAudioCleanup.Create;
    testMusic := LoadMusic('Test Music', 'magical_night.ogg');
    CleanupMusic := TMusicCleanup.Create;
    FadeMusicIn(testMusic, 2, 1000);
    AssertTrue(MusicPlaying());
end;
procedure TestFadeMusicOutIntegration;
begin
    OpenAudio();
    CleanupAudio := TAudioCleanup.Create;
    testMusic := LoadMusic('Test Music', 'magical_night.ogg');
    CleanupMusic := TMusicCleanup.Create;
    PlayMusic(testMusic);
    FadeMusicOut(1000);
    Delay(1100);
    AssertFalse(MusicPlaying());
end;
procedure TestFreeAllMusicIntegration;
begin
    OpenAudio();
    CleanupAudio := TAudioCleanup.Create;
    LoadMusic('test_music1', 'magical_night.ogg');
    CleanupMusic := TMusicCleanup.Create;
    LoadMusic('test_music2', 'dancingFrog.wav');
    FreeAllMusic();
    AssertFalse(HasMusic('test_music1'));
    AssertFalse(HasMusic('test_music2'));
end;
procedure TestFreeMusicIntegration;
begin
    OpenAudio();
    CleanupAudio := TAudioCleanup.Create;
    testMusic := LoadMusic('Test Music', 'magical_night.ogg');
    CleanupMusic := TMusicCleanup.Create;
    PlayMusic(testMusic);
    FreeMusic(testMusic);
    AssertFalse(HasMusic('Test Music'));
end;
procedure TestHasMusicIntegration;
begin
    OpenAudio();
    CleanupAudio := TAudioCleanup.Create;
    testMusic := LoadMusic('Test Music', 'magical_night.ogg');
    CleanupMusic := TMusicCleanup.Create;
    AssertTrue(HasMusic('Test Music'));
    FreeMusic(testMusic);
    AssertFalse(HasMusic('Test Music'));
end;
procedure TestLoadMusicIntegration;
begin
    OpenAudio();
    CleanupAudio := TAudioCleanup.Create;
    testMusic := LoadMusic('Test Music', 'magical_night.ogg');
    CleanupMusic := TMusicCleanup.Create;
    AssertNotNull(testMusic);
    AssertTrue(MusicValid(testMusic));
end;
procedure TestMusicFilenameIntegration;
begin
    OpenAudio();
    CleanupAudio := TAudioCleanup.Create;
    testMusic := LoadMusic('Test Music', 'magical_night.ogg');
    CleanupMusic := TMusicCleanup.Create;
    AssertEquals(PathToResource('magical_night.ogg', ResourceKind.SOUND_RESOURCE), MusicFilename(testMusic));
end;
procedure TestMusicNameIntegration;
begin
    OpenAudio();
    CleanupAudio := TAudioCleanup.Create;
    testMusic := LoadMusic('Test Music', 'magical_night.ogg');
    CleanupMusic := TMusicCleanup.Create;
    AssertEquals('Test Music', MusicName(testMusic));
end;
procedure TestMusicNamedIntegration;
begin
    OpenAudio();
    CleanupAudio := TAudioCleanup.Create;
    testMusic := LoadMusic('Test Music', 'magical_night.ogg');
    CleanupMusic := TMusicCleanup.Create;
    namedMusic := MusicNamed('Test Music');
    AssertEquals(testMusic, namedMusic);
end;
procedure TestMusicPlayingIntegration;
begin
    OpenAudio();
    CleanupAudio := TAudioCleanup.Create;
    testMusic := LoadMusic('Test Music', 'magical_night.ogg');
    CleanupMusic := TMusicCleanup.Create;
    AssertFalse(MusicPlaying());
    PlayMusic(testMusic);
    AssertTrue(MusicPlaying());
end;
procedure TestMusicValidIntegration;
begin
    OpenAudio();
    CleanupAudio := TAudioCleanup.Create;
    testMusic := LoadMusic('Test Music', 'magical_night.ogg');
    CleanupMusic := TMusicCleanup.Create;
    AssertTrue(MusicValid(testMusic));
    FreeMusic(testMusic);
    AssertFalse(MusicValid(testMusic));
end;
procedure TestMusicVolumeIntegration;
begin
    OpenAudio();
    CleanupAudio := TAudioCleanup.Create;
    testMusic := LoadMusic('Test Music', 'magical_night.ogg');
    CleanupMusic := TMusicCleanup.Create;
    PlayMusic(testMusic);
    SetMusicVolume(0.5);
    AssertEquals(0.5, MusicVolume());
end;
procedure TestPauseMusicIntegration;
begin
    OpenAudio();
    CleanupAudio := TAudioCleanup.Create;
    testMusic := LoadMusic('Test Music', 'magical_night.ogg');
    CleanupMusic := TMusicCleanup.Create;
    PlayMusic(testMusic);
    PauseMusic();
    AssertTrue(MusicPlaying());
end;
procedure TestPlayMusicNamedIntegration;
begin
    OpenAudio();
    CleanupAudio := TAudioCleanup.Create;
    LoadMusic('Test Music', 'magical_night.ogg');
    CleanupMusic := TMusicCleanup.Create;
    PlayMusic('Test Music');
    AssertTrue(MusicPlaying());
end;
procedure TestPlayMusicNamedWithTimesIntegration;
begin
    OpenAudio();
    CleanupAudio := TAudioCleanup.Create;
    LoadMusic('Test Music', 'magical_night.ogg');
    CleanupMusic := TMusicCleanup.Create;
    PlayMusic('Test Music', 2);
    AssertTrue(MusicPlaying());
end;
procedure TestPlayMusicIntegration;
begin
    OpenAudio();
    CleanupAudio := TAudioCleanup.Create;
    testMusic := LoadMusic('Test Music', 'magical_night.ogg');
    CleanupMusic := TMusicCleanup.Create;
    PlayMusic(testMusic);
    AssertTrue(MusicPlaying());
end;
procedure TestPlayMusicWithTimesIntegration;
begin
    OpenAudio();
    CleanupAudio := TAudioCleanup.Create;
    testMusic := LoadMusic('Test Music', 'magical_night.ogg');
    CleanupMusic := TMusicCleanup.Create;
    PlayMusic(testMusic, 2);
    AssertTrue(MusicPlaying());
end;
procedure TestPlayMusicWithTimesAndVolumeIntegration;
begin
    OpenAudio();
    CleanupAudio := TAudioCleanup.Create;
    testMusic := LoadMusic('Test Music', 'magical_night.ogg');
    CleanupMusic := TMusicCleanup.Create;
    PlayMusic(testMusic, 2, 0.75);
    AssertTrue(MusicPlaying());
    AssertEquals(0.75, MusicVolume());
end;
procedure TestResumeMusicIntegration;
begin
    OpenAudio();
    CleanupAudio := TAudioCleanup.Create;
    testMusic := LoadMusic('Test Music', 'magical_night.ogg');
    CleanupMusic := TMusicCleanup.Create;
    PlayMusic(testMusic);
    PauseMusic();
    AssertTrue(MusicPlaying());
    ResumeMusic();
    AssertTrue(MusicPlaying());
end;
procedure TestSetMusicVolumeIntegration;
begin
    OpenAudio();
    CleanupAudio := TAudioCleanup.Create;
    testMusic := LoadMusic('Test Music', 'magical_night.ogg');
    CleanupMusic := TMusicCleanup.Create;
    PlayMusic(testMusic);
    SetMusicVolume(0.5);
    AssertEquals(0.5, MusicVolume());
end;
procedure TestStopMusicIntegration;
begin
    OpenAudio();
    CleanupAudio := TAudioCleanup.Create;
    testMusic := LoadMusic('Test Music', 'magical_night.ogg');
    CleanupMusic := TMusicCleanup.Create;
    PlayMusic(testMusic);
    StopMusic();
    AssertFalse(MusicPlaying());
end;
procedure TestFadeAllSoundEffectsOutIntegration;
begin
    OpenAudio();
    CleanupAudio := TAudioCleanup.Create;
    testSound1 := LoadSoundEffect('Test Sound 1', 'comedy_boing.wav');
    CleanupSoundEffect := TSoundEffectCleanup.Create;
    testSound2 := LoadSoundEffect('Test Sound 2', 'comedy_boing.ogg');
    PlaySoundEffect(testSound1);
    PlaySoundEffect(testSound2);
    FadeAllSoundEffectsOut(1000);
    Delay(1100);
    AssertFalse(SoundEffectPlaying(testSound1));
    AssertFalse(SoundEffectPlaying(testSound2));
end;
procedure TestFadeSoundEffectOutIntegration;
begin
    OpenAudio();
    CleanupAudio := TAudioCleanup.Create;
    testSound := LoadSoundEffect('Test Sound', 'breakdance.wav');
    CleanupSoundEffect := TSoundEffectCleanup.Create;
    PlaySoundEffect(testSound);
    FadeSoundEffectOut(testSound, 1000);
    Delay(1100);
    AssertFalse(SoundEffectPlaying(testSound));
end;
procedure TestFreeAllSoundEffectsIntegration;
begin
    OpenAudio();
    CleanupAudio := TAudioCleanup.Create;
    LoadSoundEffect('Test Sound 1', 'breakdance.wav');
    CleanupSoundEffect := TSoundEffectCleanup.Create;
    LoadSoundEffect('Test Sound 2', 'comedy_boing.ogg');
    FreeAllSoundEffects();
    AssertFalse(HasSoundEffect('Test Sound 1'));
    AssertFalse(HasSoundEffect('Test Sound 2'));
end;
procedure TestFreeSoundEffectIntegration;
begin
    OpenAudio();
    CleanupAudio := TAudioCleanup.Create;
    testSound := LoadSoundEffect('Test Sound', 'breakdance.wav');
    CleanupSoundEffect := TSoundEffectCleanup.Create;
    PlaySoundEffect(testSound);
    FreeSoundEffect(testSound);
    AssertFalse(HasSoundEffect('Test Sound'));
end;
procedure TestHasSoundEffectIntegration;
begin
    OpenAudio();
    CleanupAudio := TAudioCleanup.Create;
    testSound := LoadSoundEffect('Test Sound', 'breakdance.wav');
    CleanupSoundEffect := TSoundEffectCleanup.Create;
    AssertTrue(HasSoundEffect('Test Sound'));
    FreeSoundEffect(testSound);
    AssertFalse(HasSoundEffect('Test Sound'));
end;
procedure TestLoadSoundEffectIntegration;
begin
    OpenAudio();
    CleanupAudio := TAudioCleanup.Create;
    testSound := LoadSoundEffect('Test Sound', 'breakdance.wav');
    CleanupSoundEffect := TSoundEffectCleanup.Create;
    AssertNotNull(testSound);
    AssertTrue(HasSoundEffect('Test Sound'));
end;
procedure TestPlaySoundEffectNamedIntegration;
begin
    OpenAudio();
    CleanupAudio := TAudioCleanup.Create;
    testSound := LoadSoundEffect('Test Sound', 'breakdance.wav');
    CleanupSoundEffect := TSoundEffectCleanup.Create;
    PlaySoundEffect('Test Sound');
    AssertTrue(SoundEffectPlaying(testSound));
end;
procedure TestPlaySoundEffectNamedWithVolumeIntegration;
begin
    OpenAudio();
    CleanupAudio := TAudioCleanup.Create;
    testSound := LoadSoundEffect('Test Sound', 'breakdance.wav');
    CleanupSoundEffect := TSoundEffectCleanup.Create;
    PlaySoundEffect('Test Sound', 0.75);
    AssertTrue(SoundEffectPlaying(testSound));
end;
procedure TestPlaySoundEffectNamedWithTimesIntegration;
begin
    OpenAudio();
    CleanupAudio := TAudioCleanup.Create;
    testSound := LoadSoundEffect('Test Sound', 'breakdance.wav');
    CleanupSoundEffect := TSoundEffectCleanup.Create;
    PlaySoundEffect('Test Sound', 3);
    AssertTrue(SoundEffectPlaying(testSound));
end;
procedure TestPlaySoundEffectNamedWithTimesAndVolumeIntegration;
begin
    OpenAudio();
    CleanupAudio := TAudioCleanup.Create;
    testSound := LoadSoundEffect('Test Sound', 'breakdance.wav');
    CleanupSoundEffect := TSoundEffectCleanup.Create;
    PlaySoundEffect('Test Sound', 2, 0.75);
    AssertTrue(SoundEffectPlaying(testSound));
end;
procedure TestPlaySoundEffectIntegration;
begin
    OpenAudio();
    CleanupAudio := TAudioCleanup.Create;
    testSound := LoadSoundEffect('Test Sound', 'breakdance.wav');
    CleanupSoundEffect := TSoundEffectCleanup.Create;
    PlaySoundEffect(testSound);
    AssertTrue(SoundEffectPlaying(testSound));
end;
procedure TestPlaySoundEffectWithVolumeIntegration;
begin
    OpenAudio();
    CleanupAudio := TAudioCleanup.Create;
    testSound := LoadSoundEffect('Test Sound', 'breakdance.wav');
    CleanupSoundEffect := TSoundEffectCleanup.Create;
    PlaySoundEffect(testSound, 0.75);
    AssertTrue(SoundEffectPlaying(testSound));
end;
procedure TestPlaySoundEffectWithTimesIntegration;
begin
    OpenAudio();
    CleanupAudio := TAudioCleanup.Create;
    testSound := LoadSoundEffect('Test Sound', 'SwinGameStart.wav');
    CleanupSoundEffect := TSoundEffectCleanup.Create;
    PlaySoundEffect(testSound, 3);
    AssertTrue(SoundEffectPlaying(testSound));
end;
procedure TestPlaySoundEffectWithTimesAndVolumeIntegration;
begin
    OpenAudio();
    CleanupAudio := TAudioCleanup.Create;
    testSound := LoadSoundEffect('Test Sound', 'SwinGameStart.wav');
    CleanupSoundEffect := TSoundEffectCleanup.Create;
    PlaySoundEffect(testSound, 2, 0.75);
    AssertTrue(SoundEffectPlaying(testSound));
end;
procedure TestSoundEffectFilenameIntegration;
begin
    OpenAudio();
    CleanupAudio := TAudioCleanup.Create;
    testSound := LoadSoundEffect('Test Sound', 'SwinGameStart.wav');
    CleanupSoundEffect := TSoundEffectCleanup.Create;
    AssertEquals(PathToResource('SwinGameStart.wav', ResourceKind.SOUND_RESOURCE), SoundEffectFilename(testSound));
end;
procedure TestSoundEffectNameIntegration;
begin
    OpenAudio();
    CleanupAudio := TAudioCleanup.Create;
    testSound := LoadSoundEffect('Test Sound', 'SwinGameStart.wav');
    CleanupSoundEffect := TSoundEffectCleanup.Create;
    AssertEquals('Test Sound', SoundEffectName(testSound));
end;
procedure TestSoundEffectNamedIntegration;
begin
    OpenAudio();
    CleanupAudio := TAudioCleanup.Create;
    testSound := LoadSoundEffect('Test Sound', 'SwinGameStart.wav');
    CleanupSoundEffect := TSoundEffectCleanup.Create;
    namedSound := SoundEffectNamed('Test Sound');
    AssertEquals(testSound, namedSound);
end;
procedure TestSoundEffectPlayingNamedIntegration;
begin
    OpenAudio();
    CleanupAudio := TAudioCleanup.Create;
    LoadSoundEffect('Test Sound', 'SwinGameStart.wav');
    CleanupSoundEffect := TSoundEffectCleanup.Create;
    PlaySoundEffect('Test Sound');
    AssertTrue(SoundEffectPlaying('Test Sound'));
    StopSoundEffect('Test Sound');
    AssertFalse(SoundEffectPlaying('Test Sound'));
end;
procedure TestSoundEffectPlayingIntegration;
begin
    OpenAudio();
    CleanupAudio := TAudioCleanup.Create;
    testSound := LoadSoundEffect('Test Sound', 'SwinGameStart.wav');
    CleanupSoundEffect := TSoundEffectCleanup.Create;
    PlaySoundEffect(testSound);
    AssertTrue(SoundEffectPlaying(testSound));
    StopSoundEffect(testSound);
    AssertFalse(SoundEffectPlaying(testSound));
end;
procedure TestSoundEffectValidIntegration;
begin
    OpenAudio();
    CleanupAudio := TAudioCleanup.Create;
    testSound := LoadSoundEffect('Test Sound', 'SwinGameStart.wav');
    CleanupSoundEffect := TSoundEffectCleanup.Create;
    AssertNotNull(testSound);
    AssertTrue(HasSoundEffect('Test Sound'));
end;
procedure TestStopSoundEffectNamedIntegration;
begin
    OpenAudio();
    CleanupAudio := TAudioCleanup.Create;
    LoadSoundEffect('Test Sound', 'SwinGameStart.wav');
    CleanupSoundEffect := TSoundEffectCleanup.Create;
    PlaySoundEffect('Test Sound');
    StopSoundEffect('Test Sound');
    AssertFalse(SoundEffectPlaying('Test Sound'));
end;
procedure TestStopSoundEffectIntegration;
begin
    OpenAudio();
    CleanupAudio := TAudioCleanup.Create;
    testSound := LoadSoundEffect('Test Sound', 'SwinGameStart.wav');
    CleanupSoundEffect := TSoundEffectCleanup.Create;
    PlaySoundEffect(testSound);
    StopSoundEffect(testSound);
    AssertFalse(SoundEffectPlaying(testSound));
end;
end;

procedure RegisterTests;
begin
    #<Proc:0x00007faa116e2450 /mnt/c/Users/Noahc/Documents/aYear_2_semester_2/TeamProject/GitHubRepo/splashkit_test_generator/test_generator/config/languages/pascal_config.rb:138 (lambda)>
end;
