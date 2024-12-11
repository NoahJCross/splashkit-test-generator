using Xunit;
using static SplashKitSDK.SplashKit;

namespace SplashKitTests
{
    public class TestAudio
    {
        [Fact]
        public void TestAudioReadyIntegration()
        {
            Assert.False(AudioReady());
            OpenAudio();
            Assert.True(AudioReady());
            CloseAudio();
            Assert.False(AudioReady());
        }
        [Fact]
        public void TestCloseAudioIntegration()
        {
            OpenAudio();
            Assert.True(AudioReady());
            CloseAudio();
            Assert.False(AudioReady());
        }
        [Fact]
        public void TestOpenAudioIntegration()
        {
            OpenAudio();
            Assert.True(AudioReady());
            CloseAudio();
            Assert.False(AudioReady());
        }
        [Fact]
        public void TestFadeMusicInNamedIntegration()
        {
            OpenAudio();
            var testMusic = LoadMusic("test_music", "magical_night.ogg");
            FadeMusicInNamed("test_music", 1000);
            Assert.True(MusicPlaying());
            FreeMusic(testMusic);
            CloseAudio();
        }
        [Fact]
        public void TestFadeMusicInNamedWithTimesIntegration()
        {
            OpenAudio();
            var testMusic = LoadMusic("test_music", "magical_night.ogg");
            FadeMusicInNamedWithTimes("test_music", 2, 1000);
            Assert.True(MusicPlaying());
            FreeMusic(testMusic);
            CloseAudio();
        }
        [Fact]
        public void TestFadeMusicInIntegration()
        {
            OpenAudio();
            var testMusic = LoadMusic("test_music", "magical_night.ogg");
            FadeMusicIn(testMusic, 1000);
            Assert.True(MusicPlaying());
            FreeMusic(testMusic);
            CloseAudio();
        }
        [Fact]
        public void TestFadeMusicInWithTimesIntegration()
        {
            OpenAudio();
            var testMusic = LoadMusic("test_music", "magical_night.ogg");
            FadeMusicInWithTimes(testMusic, 2, 1000);
            Assert.True(MusicPlaying());
            FreeMusic(testMusic);
            CloseAudio();
        }
        [Fact]
        public void TestFadeMusicOutIntegration()
        {
            OpenAudio();
            var testMusic = LoadMusic("test_music", "magical_night.ogg");
            PlayMusic(testMusic);
            FadeMusicOut(1000);
            Delay(3000);
            Assert.False(MusicPlaying());
            FreeMusic(testMusic);
            CloseAudio();
        }
        [Fact]
        public void TestFreeAllMusicIntegration()
        {
            OpenAudio();
            LoadMusic("test_music1", "magical_night.ogg");
            LoadMusic("test_music2", "dancingFrog.wav");
            FreeAllMusic();
            Assert.False(HasMusic("test_music1"));
            Assert.False(HasMusic("test_music2"));
            CloseAudio();
        }
        [Fact]
        public void TestFreeMusicIntegration()
        {
            OpenAudio();
            var testMusic = LoadMusic("test_music", "magical_night.ogg");
            PlayMusic(testMusic);
            FreeMusic(testMusic);
            Assert.False(HasMusic("test_music"));
            CloseAudio();
        }
        [Fact]
        public void TestHasMusicIntegration()
        {
            OpenAudio();
            var testMusic = LoadMusic("test_music", "magical_night.ogg");
            Assert.True(HasMusic("test_music"));
            FreeMusic(testMusic);
            Assert.False(HasMusic("test_music"));
            CloseAudio();
        }
        [Fact]
        public void TestLoadMusicIntegration()
        {
            OpenAudio();
            var testMusic = LoadMusic("test_music", "magical_night.ogg");
            Assert.NotNull(testMusic);
            Assert.True(MusicValid(testMusic));
            FreeMusic(testMusic);
            CloseAudio();
        }
        [Fact]
        public void TestMusicFilenameIntegration()
        {
            OpenAudio();
            var testMusic = LoadMusic("test_music", "magical_night.ogg");
            Assert.Equal(PathToResource("magical_night.ogg", ResourceKind.SoundResource), MusicFilename(testMusic));
            FreeMusic(testMusic);
            CloseAudio();
        }
        [Fact]
        public void TestMusicNameIntegration()
        {
            OpenAudio();
            var testMusic = LoadMusic("test_music", "magical_night.ogg");
            Assert.Equal("test_music", MusicName(testMusic));
            FreeMusic(testMusic);
            CloseAudio();
        }
        [Fact]
        public void TestMusicNamedIntegration()
        {
            OpenAudio();
            var testMusic = LoadMusic("test_music", "magical_night.ogg");
            var namedMusic = MusicNamed("test_music");
            Assert.Equal(testMusic, namedMusic);
            FreeMusic(testMusic);
            CloseAudio();
        }
        [Fact]
        public void TestMusicPlayingIntegration()
        {
            OpenAudio();
            var testMusic = LoadMusic("test_music", "magical_night.ogg");
            Assert.False(MusicPlaying());
            PlayMusic(testMusic);
            Assert.True(MusicPlaying());
            FreeMusic(testMusic);
            CloseAudio();
        }
        [Fact]
        public void TestMusicValidIntegration()
        {
            OpenAudio();
            var testMusic = LoadMusic("test_music", "magical_night.ogg");
            Assert.True(MusicValid(testMusic));
            FreeMusic(testMusic);
            Assert.False(MusicValid(testMusic));
            CloseAudio();
        }
        [Fact]
        public void TestMusicVolumeIntegration()
        {
            OpenAudio();
            var testMusic = LoadMusic("test_music", "magical_night.ogg");
            PlayMusic(testMusic);
            SetMusicVolume(0.5);
            Assert.Equal(0.5, MusicVolume());
            FreeMusic(testMusic);
            CloseAudio();
        }
        [Fact]
        public void TestPauseMusicIntegration()
        {
            OpenAudio();
            var testMusic = LoadMusic("test_music", "magical_night.ogg");
            PlayMusic(testMusic);
            PauseMusic();
            Assert.True(MusicPlaying());
            FreeMusic(testMusic);
            CloseAudio();
        }
        [Fact]
        public void TestPlayMusicNamedIntegration()
        {
            OpenAudio();
            var testMusic = LoadMusic("test_music", "magical_night.ogg");
            PlayMusicNamed("test_music");
            Assert.True(MusicPlaying());
            FreeMusic(testMusic);
            CloseAudio();
        }
        [Fact]
        public void TestPlayMusicNamedWithTimesIntegration()
        {
            OpenAudio();
            var testMusic = LoadMusic("test_music", "magical_night.ogg");
            PlayMusicNamedWithTimes("test_music", 2);
            Assert.True(MusicPlaying());
            FreeMusic(testMusic);
            CloseAudio();
        }
        [Fact]
        public void TestPlayMusicIntegration()
        {
            OpenAudio();
            var testMusic = LoadMusic("test_music", "magical_night.ogg");
            PlayMusic(testMusic);
            Assert.True(MusicPlaying());
            FreeMusic(testMusic);
            CloseAudio();
        }
        [Fact]
        public void TestPlayMusicWithTimesIntegration()
        {
            OpenAudio();
            var testMusic = LoadMusic("test_music", "magical_night.ogg");
            PlayMusicWithTimes(testMusic, 2);
            Assert.True(MusicPlaying());
            FreeMusic(testMusic);
            CloseAudio();
        }
        [Fact]
        public void TestPlayMusicWithTimesAndVolumeIntegration()
        {
            OpenAudio();
            var testMusic = LoadMusic("test_music", "magical_night.ogg");
            PlayMusicWithTimesAndVolume(testMusic, 2, 0.75);
            Assert.True(MusicPlaying());
            Assert.Equal(0.75, MusicVolume());
            FreeMusic(testMusic);
            CloseAudio();
        }
        [Fact]
        public void TestResumeMusicIntegration()
        {
            OpenAudio();
            var testMusic = LoadMusic("test_music", "magical_night.ogg");
            PlayMusic(testMusic);
            PauseMusic();
            Assert.True(MusicPlaying());
            ResumeMusic();
            Assert.True(MusicPlaying());
            FreeMusic(testMusic);
            CloseAudio();
        }
        [Fact]
        public void TestSetMusicVolumeIntegration()
        {
            OpenAudio();
            var testMusic = LoadMusic("test_music", "magical_night.ogg");
            PlayMusic(testMusic);
            SetMusicVolume(0.5);
            Assert.Equal(0.5, MusicVolume());
            FreeMusic(testMusic);
            CloseAudio();
        }
        [Fact]
        public void TestStopMusicIntegration()
        {
            OpenAudio();
            var testMusic = LoadMusic("test_music", "magical_night.ogg");
            PlayMusic(testMusic);
            StopMusic();
            Assert.False(MusicPlaying());
            FreeMusic(testMusic);
            CloseAudio();
        }
        [Fact]
        public void TestFadeAllSoundEffectsOutIntegration()
        {
            OpenAudio();
            var testSound1 = LoadSoundEffect("test_sound1", "breakdance.wav");
            var testSound2 = LoadSoundEffect("test_sound2", "comedy_boing.ogg");
            PlaySoundEffect(testSound1);
            PlaySoundEffect(testSound2);
            FadeAllSoundEffectsOut(1000);
            Assert.False(SoundEffectPlaying(testSound1));
            Assert.False(SoundEffectPlaying(testSound2));
            FreeAllSoundEffects();
            CloseAudio();
        }
        [Fact]
        public void TestFadeSoundEffectOutIntegration()
        {
            OpenAudio();
            var testSound = LoadSoundEffect("test_sound", "breakdance.wav");
            PlaySoundEffect(testSound);
            FadeSoundEffectOut(testSound, 1000);
            Delay(3000);
            Assert.False(SoundEffectPlaying(testSound));
            FreeSoundEffect(testSound);
            CloseAudio();
        }
        [Fact]
        public void TestFreeAllSoundEffectsIntegration()
        {
            OpenAudio();
            LoadSoundEffect("test_sound1", "breakdance.wav");
            LoadSoundEffect("test_sound2", "comedy_boing.ogg");
            FreeAllSoundEffects();
            Assert.False(HasSoundEffect("test_sound1"));
            Assert.False(HasSoundEffect("test_sound2"));
            CloseAudio();
        }
        [Fact]
        public void TestFreeSoundEffectIntegration()
        {
            OpenAudio();
            var testSound = LoadSoundEffect("test_sound", "breakdance.wav");
            PlaySoundEffect(testSound);
            FreeSoundEffect(testSound);
            Assert.False(HasSoundEffect("test_sound"));
            CloseAudio();
        }
        [Fact]
        public void TestHasSoundEffectIntegration()
        {
            OpenAudio();
            var testSound = LoadSoundEffect("test_sound", "breakdance.wav");
            Assert.True(HasSoundEffect("test_sound"));
            FreeSoundEffect(testSound);
            Assert.False(HasSoundEffect("test_sound"));
            CloseAudio();
        }
        [Fact]
        public void TestLoadSoundEffectIntegration()
        {
            OpenAudio();
            var testSound = LoadSoundEffect("test_sound", "breakdance.wav");
            Assert.NotNull(testSound);
            Assert.True(HasSoundEffect("test_sound"));
            FreeSoundEffect(testSound);
            CloseAudio();
        }
        [Fact]
        public void TestPlaySoundEffectNamedIntegration()
        {
            OpenAudio();
            var testSound = LoadSoundEffect("test_sound", "breakdance.wav");
            PlaySoundEffectNamed("test_sound");
            Assert.True(SoundEffectPlaying(testSound));
            FreeSoundEffect(testSound);
            CloseAudio();
        }
        [Fact]
        public void TestPlaySoundEffectNamedWithVolumeIntegration()
        {
            OpenAudio();
            var testSound = LoadSoundEffect("test_sound", "breakdance.wav");
            PlaySoundEffectNamedWithVolume("test_sound", 0.75);
            Assert.True(SoundEffectPlaying(testSound));
            FreeSoundEffect(testSound);
            CloseAudio();
        }
        [Fact]
        public void TestPlaySoundEffectNamedWithTimesIntegration()
        {
            OpenAudio();
            var testSound = LoadSoundEffect("test_sound", "breakdance.wav");
            PlaySoundEffectNamedWithTimes("test_sound", 3);
            Assert.True(SoundEffectPlaying(testSound));
            FreeSoundEffect(testSound);
            CloseAudio();
        }
        [Fact]
        public void TestPlaySoundEffectNamedWithTimesAndVolumeIntegration()
        {
            OpenAudio();
            var testSound = LoadSoundEffect("test_sound", "breakdance.wav");
            PlaySoundEffectNamedWithTimesAndVolume("test_sound", 2, 0.75);
            Assert.True(SoundEffectPlaying(testSound));
            FreeSoundEffect(testSound);
            CloseAudio();
        }
        [Fact]
        public void TestPlaySoundEffectIntegration()
        {
            OpenAudio();
            var testSound = LoadSoundEffect("test_sound", "breakdance.wav");
            PlaySoundEffect(testSound);
            Assert.True(SoundEffectPlaying(testSound));
            FreeSoundEffect(testSound);
            CloseAudio();
        }
        [Fact]
        public void TestPlaySoundEffectWithVolumeIntegration()
        {
            OpenAudio();
            var testSound = LoadSoundEffect("test_sound", "breakdance.wav");
            PlaySoundEffectWithVolume(testSound, 0.75);
            Assert.True(SoundEffectPlaying(testSound));
            FreeSoundEffect(testSound);
            CloseAudio();
        }
        [Fact]
        public void TestPlaySoundEffectWithTimesIntegration()
        {
            OpenAudio();
            var testSound = LoadSoundEffect("test_sound", "SwinGameStart.wav");
            PlaySoundEffectWithTimes(testSound, 3);
            Assert.True(SoundEffectPlaying(testSound));
            FreeSoundEffect(testSound);
            CloseAudio();
        }
        [Fact]
        public void TestPlaySoundEffectWithTimesAndVolumeIntegration()
        {
            OpenAudio();
            var testSound = LoadSoundEffect("test_sound", "SwinGameStart.wav");
            PlaySoundEffectWithTimesAndVolume(testSound, 2, 0.75);
            Assert.True(SoundEffectPlaying(testSound));
            FreeSoundEffect(testSound);
            CloseAudio();
        }
        [Fact]
        public void TestSoundEffectFilenameIntegration()
        {
            OpenAudio();
            var testSound = LoadSoundEffect("test_sound", "SwinGameStart.wav");
            Assert.Equal(PathToResource("SwinGameStart.wav", ResourceKind.SoundResource), SoundEffectFilename(testSound));
            FreeSoundEffect(testSound);
            CloseAudio();
        }
        [Fact]
        public void TestSoundEffectNameIntegration()
        {
            OpenAudio();
            var testSound = LoadSoundEffect("test_sound", "SwinGameStart.wav");
            Assert.Equal("test_sound", SoundEffectName(testSound));
            FreeSoundEffect(testSound);
            CloseAudio();
        }
        [Fact]
        public void TestSoundEffectNamedIntegration()
        {
            OpenAudio();
            var testSound = LoadSoundEffect("test_sound", "SwinGameStart.wav");
            var namedSound = SoundEffectNamed("test_sound");
            Assert.Equal(testSound, namedSound);
            FreeSoundEffect(testSound);
            CloseAudio();
        }
        [Fact]
        public void TestSoundEffectPlayingNamedIntegration()
        {
            OpenAudio();
            var testSound = LoadSoundEffect("test_sound", "SwinGameStart.wav");
            PlaySoundEffect("test_sound");
            Assert.True(SoundEffectPlayingNamed("test_sound"));
            StopSoundEffect("test_sound");
            Assert.False(SoundEffectPlayingNamed("test_sound"));
            FreeSoundEffect(testSound);
            CloseAudio();
        }
        [Fact]
        public void TestSoundEffectPlayingIntegration()
        {
            OpenAudio();
            var testSound = LoadSoundEffect("test_sound", "SwinGameStart.wav");
            PlaySoundEffect(testSound);
            Assert.True(SoundEffectPlaying(testSound));
            StopSoundEffect(testSound);
            Assert.False(SoundEffectPlaying(testSound));
            FreeSoundEffect(testSound);
            CloseAudio();
        }
        [Fact]
        public void TestSoundEffectValidIntegration()
        {
            OpenAudio();
            var testSound = LoadSoundEffect("test_sound", "SwinGameStart.wav");
            Assert.NotNull(testSound);
            Assert.True(HasSoundEffect("test_sound"));
            FreeSoundEffect(testSound);
            CloseAudio();
        }
        [Fact]
        public void TestStopSoundEffectNamedIntegration()
        {
            OpenAudio();
            var testSound = LoadSoundEffect("test_sound", "SwinGameStart.wav");
            PlaySoundEffect("test_sound");
            StopSoundEffectNamed("test_sound");
            Assert.False(SoundEffectPlaying("test_sound"));
            FreeSoundEffect(testSound);
            CloseAudio();
        }
        [Fact]
        public void TestStopSoundEffectIntegration()
        {
            OpenAudio();
            var testSound = LoadSoundEffect("test_sound", "SwinGameStart.wav");
            PlaySoundEffect(testSound);
            StopSoundEffect(testSound);
            Assert.False(SoundEffectPlaying(testSound));
            FreeSoundEffect(testSound);
            CloseAudio();
        }
    }
}
