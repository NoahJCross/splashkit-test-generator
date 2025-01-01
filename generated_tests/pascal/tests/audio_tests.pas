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
    AssertFalse(AudioReady());
    OpenAudio();
    CleanupAudio := TAudioCleanup.Create;
    AssertTrue(AudioReady());
    CloseAudio();
    AssertFalse(AudioReady());
end;
procedure TestCloseAudioIntegration;
begin
    OpenAudio();
    CleanupAudio := TAudioCleanup.Create;
    AssertTrue(AudioReady());
    CloseAudio();
    AssertFalse(AudioReady());
end;
procedure TestOpenAudioIntegration;
begin
    OpenAudio();
    CleanupAudio := TAudioCleanup.Create;
    AssertTrue(AudioReady());
    CloseAudio();
    AssertFalse(AudioReady());
end;
procedure TestFadeMusicInNamedIntegration;
begin
    OpenAudio();
    CleanupAudio := TAudioCleanup.Create;
    LoadMusic('test_music', 'magical_night.ogg');
    CleanupMusic := TMusicCleanup.Create;
    FadeMusicIn('test_music', 1000);
    AssertTrue(MusicPlaying());
end;
procedure TestFadeMusicInNamedWithTimesIntegration;
begin
    OpenAudio();
    CleanupAudio := TAudioCleanup.Create;
    LoadMusic('test_music', 'magical_night.ogg');
    CleanupMusic := TMusicCleanup.Create;
    FadeMusicIn('test_music', 2, 1000);
    AssertTrue(MusicPlaying());
end;
procedure TestFadeMusicInIntegration;
begin
    OpenAudio();
    CleanupAudio := TAudioCleanup.Create;
    testMusic := LoadMusic('test_music', 'magical_night.ogg');
    CleanupMusic := TMusicCleanup.Create;
    FadeMusicIn(testMusic, 1000);
    AssertTrue(MusicPlaying());
end;
procedure TestFadeMusicInWithTimesIntegration;
begin
    OpenAudio();
    CleanupAudio := TAudioCleanup.Create;
    testMusic := LoadMusic('test_music', 'magical_night.ogg');
    CleanupMusic := TMusicCleanup.Create;
    FadeMusicIn(testMusic, 2, 1000);
    AssertTrue(MusicPlaying());
end;
procedure TestFadeMusicOutIntegration;
begin
    OpenAudio();
    CleanupAudio := TAudioCleanup.Create;
    testMusic := LoadMusic('test_music', 'magical_night.ogg');
    CleanupMusic := TMusicCleanup.Create;
    PlayMusic(testMusic);
    FadeMusicOut(1000);
    Delay(3000);
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
    testMusic := LoadMusic('test_music', 'magical_night.ogg');
    CleanupMusic := TMusicCleanup.Create;
    PlayMusic(testMusic);
    FreeMusic(testMusic);
    AssertFalse(HasMusic('test_music'));
end;
procedure TestHasMusicIntegration;
begin
    OpenAudio();
    CleanupAudio := TAudioCleanup.Create;
    testMusic := LoadMusic('test_music', 'magical_night.ogg');
    CleanupMusic := TMusicCleanup.Create;
    AssertTrue(HasMusic('test_music'));
    FreeMusic(testMusic);
    AssertFalse(HasMusic('test_music'));
end;
procedure TestLoadMusicIntegration;
begin
    OpenAudio();
    CleanupAudio := TAudioCleanup.Create;
    testMusic := LoadMusic('test_music', 'magical_night.ogg');
    CleanupMusic := TMusicCleanup.Create;
    AssertNotNull(testMusic);
    AssertTrue(MusicValid(testMusic));
end;
procedure TestMusicFilenameIntegration;
begin
    OpenAudio();
    CleanupAudio := TAudioCleanup.Create;
    testMusic := LoadMusic('test_music', 'magical_night.ogg');
    CleanupMusic := TMusicCleanup.Create;
    AssertEquals(PathToResource('magical_night.ogg', ResourceKind.SOUND_RESOURCE), MusicFilename(testMusic));
end;
procedure TestMusicNameIntegration;
begin
    OpenAudio();
    CleanupAudio := TAudioCleanup.Create;
    testMusic := LoadMusic('test_music', 'magical_night.ogg');
    CleanupMusic := TMusicCleanup.Create;
    AssertEquals('test_music', MusicName(testMusic));
end;
procedure TestMusicNamedIntegration;
begin
    OpenAudio();
    CleanupAudio := TAudioCleanup.Create;
    testMusic := LoadMusic('test_music', 'magical_night.ogg');
    CleanupMusic := TMusicCleanup.Create;
    namedMusic := MusicNamed('test_music');
    AssertEquals(testMusic, namedMusic);
end;
procedure TestMusicPlayingIntegration;
begin
    OpenAudio();
    CleanupAudio := TAudioCleanup.Create;
    testMusic := LoadMusic('test_music', 'magical_night.ogg');
    CleanupMusic := TMusicCleanup.Create;
    AssertFalse(MusicPlaying());
    PlayMusic(testMusic);
    AssertTrue(MusicPlaying());
end;
procedure TestMusicValidIntegration;
begin
    OpenAudio();
    CleanupAudio := TAudioCleanup.Create;
    testMusic := LoadMusic('test_music', 'magical_night.ogg');
    CleanupMusic := TMusicCleanup.Create;
    AssertTrue(MusicValid(testMusic));
    FreeMusic(testMusic);
    AssertFalse(MusicValid(testMusic));
end;
procedure TestMusicVolumeIntegration;
begin
    OpenAudio();
    CleanupAudio := TAudioCleanup.Create;
    testMusic := LoadMusic('test_music', 'magical_night.ogg');
    CleanupMusic := TMusicCleanup.Create;
    PlayMusic(testMusic);
    SetMusicVolume(0.5);
    AssertEquals(0.5, MusicVolume());
end;
procedure TestPauseMusicIntegration;
begin
    OpenAudio();
    CleanupAudio := TAudioCleanup.Create;
    testMusic := LoadMusic('test_music', 'magical_night.ogg');
    CleanupMusic := TMusicCleanup.Create;
    PlayMusic(testMusic);
    PauseMusic();
    AssertTrue(MusicPlaying());
end;
procedure TestPlayMusicNamedIntegration;
begin
    OpenAudio();
    CleanupAudio := TAudioCleanup.Create;
    LoadMusic('test_music', 'magical_night.ogg');
    CleanupMusic := TMusicCleanup.Create;
    PlayMusic('test_music');
    AssertTrue(MusicPlaying());
end;
procedure TestPlayMusicNamedWithTimesIntegration;
begin
    OpenAudio();
    CleanupAudio := TAudioCleanup.Create;
    LoadMusic('test_music', 'magical_night.ogg');
    CleanupMusic := TMusicCleanup.Create;
    PlayMusic('test_music', 2);
    AssertTrue(MusicPlaying());
end;
procedure TestPlayMusicIntegration;
begin
    OpenAudio();
    CleanupAudio := TAudioCleanup.Create;
    testMusic := LoadMusic('test_music', 'magical_night.ogg');
    CleanupMusic := TMusicCleanup.Create;
    PlayMusic(testMusic);
    AssertTrue(MusicPlaying());
end;
procedure TestPlayMusicWithTimesIntegration;
begin
    OpenAudio();
    CleanupAudio := TAudioCleanup.Create;
    testMusic := LoadMusic('test_music', 'magical_night.ogg');
    CleanupMusic := TMusicCleanup.Create;
    PlayMusic(testMusic, 2);
    AssertTrue(MusicPlaying());
end;
procedure TestPlayMusicWithTimesAndVolumeIntegration;
begin
    OpenAudio();
    CleanupAudio := TAudioCleanup.Create;
    testMusic := LoadMusic('test_music', 'magical_night.ogg');
    CleanupMusic := TMusicCleanup.Create;
    PlayMusic(testMusic, 2, 0.75);
    AssertTrue(MusicPlaying());
    AssertEquals(0.75, MusicVolume());
end;
procedure TestResumeMusicIntegration;
begin
    OpenAudio();
    CleanupAudio := TAudioCleanup.Create;
    testMusic := LoadMusic('test_music', 'magical_night.ogg');
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
    testMusic := LoadMusic('test_music', 'magical_night.ogg');
    CleanupMusic := TMusicCleanup.Create;
    PlayMusic(testMusic);
    SetMusicVolume(0.5);
    AssertEquals(0.5, MusicVolume());
end;
procedure TestStopMusicIntegration;
begin
    OpenAudio();
    CleanupAudio := TAudioCleanup.Create;
    testMusic := LoadMusic('test_music', 'magical_night.ogg');
    CleanupMusic := TMusicCleanup.Create;
    PlayMusic(testMusic);
    StopMusic();
    AssertFalse(MusicPlaying());
end;
procedure TestFadeAllSoundEffectsOutIntegration;
begin
    OpenAudio();
    CleanupAudio := TAudioCleanup.Create;
    testSound1 := LoadSoundEffect('test_sound1', 'comedy_boing.wav');
    CleanupSoundEffect := TSoundEffectCleanup.Create;
    testSound2 := LoadSoundEffect('test_sound2', 'comedy_boing.ogg');
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
    testSound := LoadSoundEffect('test_sound', 'breakdance.wav');
    CleanupSoundEffect := TSoundEffectCleanup.Create;
    PlaySoundEffect(testSound);
    FadeSoundEffectOut(testSound, 1000);
    Delay(3000);
    AssertFalse(SoundEffectPlaying(testSound));
end;
procedure TestFreeAllSoundEffectsIntegration;
begin
    OpenAudio();
    CleanupAudio := TAudioCleanup.Create;
    LoadSoundEffect('test_sound1', 'breakdance.wav');
    CleanupSoundEffect := TSoundEffectCleanup.Create;
    LoadSoundEffect('test_sound2', 'comedy_boing.ogg');
    FreeAllSoundEffects();
    AssertFalse(HasSoundEffect('test_sound1'));
    AssertFalse(HasSoundEffect('test_sound2'));
end;
procedure TestFreeSoundEffectIntegration;
begin
    OpenAudio();
    CleanupAudio := TAudioCleanup.Create;
    testSound := LoadSoundEffect('test_sound', 'breakdance.wav');
    CleanupSoundEffect := TSoundEffectCleanup.Create;
    PlaySoundEffect(testSound);
    FreeSoundEffect(testSound);
    AssertFalse(HasSoundEffect('test_sound'));
end;
procedure TestHasSoundEffectIntegration;
begin
    OpenAudio();
    CleanupAudio := TAudioCleanup.Create;
    testSound := LoadSoundEffect('test_sound', 'breakdance.wav');
    CleanupSoundEffect := TSoundEffectCleanup.Create;
    AssertTrue(HasSoundEffect('test_sound'));
    FreeSoundEffect(testSound);
    AssertFalse(HasSoundEffect('test_sound'));
end;
procedure TestLoadSoundEffectIntegration;
begin
    OpenAudio();
    CleanupAudio := TAudioCleanup.Create;
    testSound := LoadSoundEffect('test_sound', 'breakdance.wav');
    CleanupSoundEffect := TSoundEffectCleanup.Create;
    AssertNotNull(testSound);
    AssertTrue(HasSoundEffect('test_sound'));
end;
procedure TestPlaySoundEffectNamedIntegration;
begin
    OpenAudio();
    CleanupAudio := TAudioCleanup.Create;
    testSound := LoadSoundEffect('test_sound', 'breakdance.wav');
    CleanupSoundEffect := TSoundEffectCleanup.Create;
    PlaySoundEffect('test_sound');
    AssertTrue(SoundEffectPlaying(testSound));
end;
procedure TestPlaySoundEffectNamedWithVolumeIntegration;
begin
    OpenAudio();
    CleanupAudio := TAudioCleanup.Create;
    testSound := LoadSoundEffect('test_sound', 'breakdance.wav');
    CleanupSoundEffect := TSoundEffectCleanup.Create;
    PlaySoundEffect('test_sound', 0.75);
    AssertTrue(SoundEffectPlaying(testSound));
end;
procedure TestPlaySoundEffectNamedWithTimesIntegration;
begin
    OpenAudio();
    CleanupAudio := TAudioCleanup.Create;
    testSound := LoadSoundEffect('test_sound', 'breakdance.wav');
    CleanupSoundEffect := TSoundEffectCleanup.Create;
    PlaySoundEffect('test_sound', 3);
    AssertTrue(SoundEffectPlaying(testSound));
end;
procedure TestPlaySoundEffectNamedWithTimesAndVolumeIntegration;
begin
    OpenAudio();
    CleanupAudio := TAudioCleanup.Create;
    testSound := LoadSoundEffect('test_sound', 'breakdance.wav');
    CleanupSoundEffect := TSoundEffectCleanup.Create;
    PlaySoundEffect('test_sound', 2, 0.75);
    AssertTrue(SoundEffectPlaying(testSound));
end;
procedure TestPlaySoundEffectIntegration;
begin
    OpenAudio();
    CleanupAudio := TAudioCleanup.Create;
    testSound := LoadSoundEffect('test_sound', 'breakdance.wav');
    CleanupSoundEffect := TSoundEffectCleanup.Create;
    PlaySoundEffect(testSound);
    AssertTrue(SoundEffectPlaying(testSound));
end;
procedure TestPlaySoundEffectWithVolumeIntegration;
begin
    OpenAudio();
    CleanupAudio := TAudioCleanup.Create;
    testSound := LoadSoundEffect('test_sound', 'breakdance.wav');
    CleanupSoundEffect := TSoundEffectCleanup.Create;
    PlaySoundEffect(testSound, 0.75);
    AssertTrue(SoundEffectPlaying(testSound));
end;
procedure TestPlaySoundEffectWithTimesIntegration;
begin
    OpenAudio();
    CleanupAudio := TAudioCleanup.Create;
    testSound := LoadSoundEffect('test_sound', 'SwinGameStart.wav');
    CleanupSoundEffect := TSoundEffectCleanup.Create;
    PlaySoundEffect(testSound, 3);
    AssertTrue(SoundEffectPlaying(testSound));
end;
procedure TestPlaySoundEffectWithTimesAndVolumeIntegration;
begin
    OpenAudio();
    CleanupAudio := TAudioCleanup.Create;
    testSound := LoadSoundEffect('test_sound', 'SwinGameStart.wav');
    CleanupSoundEffect := TSoundEffectCleanup.Create;
    PlaySoundEffect(testSound, 2, 0.75);
    AssertTrue(SoundEffectPlaying(testSound));
end;
procedure TestSoundEffectFilenameIntegration;
begin
    OpenAudio();
    CleanupAudio := TAudioCleanup.Create;
    testSound := LoadSoundEffect('test_sound', 'SwinGameStart.wav');
    CleanupSoundEffect := TSoundEffectCleanup.Create;
    AssertEquals(PathToResource('SwinGameStart.wav', ResourceKind.SOUND_RESOURCE), SoundEffectFilename(testSound));
end;
procedure TestSoundEffectNameIntegration;
begin
    OpenAudio();
    CleanupAudio := TAudioCleanup.Create;
    testSound := LoadSoundEffect('test_sound', 'SwinGameStart.wav');
    CleanupSoundEffect := TSoundEffectCleanup.Create;
    AssertEquals('test_sound', SoundEffectName(testSound));
end;
procedure TestSoundEffectNamedIntegration;
begin
    OpenAudio();
    CleanupAudio := TAudioCleanup.Create;
    testSound := LoadSoundEffect('test_sound', 'SwinGameStart.wav');
    CleanupSoundEffect := TSoundEffectCleanup.Create;
    namedSound := SoundEffectNamed('test_sound');
    AssertEquals(testSound, namedSound);
end;
procedure TestSoundEffectPlayingNamedIntegration;
begin
    OpenAudio();
    CleanupAudio := TAudioCleanup.Create;
    LoadSoundEffect('test_sound', 'SwinGameStart.wav');
    CleanupSoundEffect := TSoundEffectCleanup.Create;
    PlaySoundEffect('test_sound');
    AssertTrue(SoundEffectPlaying('test_sound'));
    StopSoundEffect('test_sound');
    AssertFalse(SoundEffectPlaying('test_sound'));
end;
procedure TestSoundEffectPlayingIntegration;
begin
    OpenAudio();
    CleanupAudio := TAudioCleanup.Create;
    testSound := LoadSoundEffect('test_sound', 'SwinGameStart.wav');
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
    testSound := LoadSoundEffect('test_sound', 'SwinGameStart.wav');
    CleanupSoundEffect := TSoundEffectCleanup.Create;
    AssertNotNull(testSound);
    AssertTrue(HasSoundEffect('test_sound'));
end;
procedure TestStopSoundEffectNamedIntegration;
begin
    OpenAudio();
    CleanupAudio := TAudioCleanup.Create;
    LoadSoundEffect('test_sound', 'SwinGameStart.wav');
    CleanupSoundEffect := TSoundEffectCleanup.Create;
    PlaySoundEffect('test_sound');
    StopSoundEffect('test_sound');
    AssertFalse(SoundEffectPlaying('test_sound'));
end;
procedure TestStopSoundEffectIntegration;
begin
    OpenAudio();
    CleanupAudio := TAudioCleanup.Create;
    testSound := LoadSoundEffect('test_sound', 'SwinGameStart.wav');
    CleanupSoundEffect := TSoundEffectCleanup.Create;
    PlaySoundEffect(testSound);
    StopSoundEffect(testSound);
    AssertFalse(SoundEffectPlaying(testSound));
end;
end;

procedure RegisterTests;
begin
    #<Proc:0x00007fbbcab52da8 /mnt/c/Users/Noahc/Documents/aYear_2_semester_2/TeamProject/GitHubRepo/splashkit_test_generator/test_generator/config/languages/pascal_config.rb:138 (lambda)>
end;
