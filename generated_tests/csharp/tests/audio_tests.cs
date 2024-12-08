using Xunit;
using static SplashKitSDK.SplashKit;

namespace SplashKitTests
{
    public class IntegrationTests
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
            CloseAudio();
            Assert.False(AudioReady());
        }
        [Fact]
        public void TestOpenAudioIntegration()
        {
            Assert.False(AudioReady());
            OpenAudio();
            Assert.True(AudioReady());
            CloseAudio();
            Assert.False(AudioReady());
        }
        [Fact]
        public void TestFadeMusicInNamedIntegration()
        {
            OpenAudio();
            var testMusic = LoadMusic("test_music", "280.mp3");
            FadeMusicIn("test_music", 1000);
            Assert.True(MusicVolume() > 0.0);
            FreeMusic(testMusic);
            CloseAudio();
        }
        [Fact]
        public void TestFadeMusicInNamedWithTimesIntegration()
        {
            OpenAudio();
            var testMusic = LoadMusic("test_music", "280.mp3");
            FadeMusicIn("test_music", 2, 1000);
            Assert.True(MusicVolume() > 0.0);
            FreeMusic(testMusic);
            CloseAudio();
        }
        [Fact]
        public void TestFadeMusicInIntegration()
        {
            OpenAudio();
            var testMusic = LoadMusic("test_music", "280.mp3");
            PlayMusic(testMusic);
            FadeMusicIn(testMusic, 1000);
            Assert.True(MusicVolume() > 0.0);
            FreeMusic(testMusic);
            CloseAudio();
        }
        [Fact]
        public void TestFadeMusicInWithTimesIntegration()
        {
            OpenAudio();
            var testMusic = LoadMusic("test_music", "280.mp3");
            FadeMusicIn(testMusic, 2, 1000);
            Assert.True(MusicVolume() > 0.0);
            FreeMusic(testMusic);
            CloseAudio();
        }
        [Fact]
        public void TestFadeMusicOutIntegration()
        {
            OpenAudio();
            var testMusic = LoadMusic("test_music", "280.mp3");
            PlayMusic(testMusic);
            FadeMusicOut(1000);
            Assert.False(MusicPlaying());
            FreeMusic(testMusic);
            CloseAudio();
        }
        [Fact]
        public void TestFreeAllMusicIntegration()
        {
            OpenAudio();
            var testMusic1 = LoadMusic("test_music1", "280.mp3");
            var testMusic2 = LoadMusic("test_music2", "test.ogg");
            FreeAllMusic();
            Assert.False(HasMusic("test_music1"));
            Assert.False(HasMusic("test_music2"));
            CloseAudio();
        }
        [Fact]
        public void TestFreeMusicIntegration()
        {
            OpenAudio();
            var testMusic = LoadMusic("test_music", "280.mp3");
            PlayMusic(testMusic);
            FreeMusic(testMusic);
            Assert.False(MusicPlaying());
            CloseAudio();
        }
        [Fact]
        public void TestHasMusicIntegration()
        {
            OpenAudio();
            var testMusic = LoadMusic("test_music", "280.mp3");
            Assert.True(HasMusic("test_music"));
            FreeMusic(testMusic);
            Assert.False(HasMusic("test_music"));
            CloseAudio();
        }
        [Fact]
        public void TestLoadMusicIntegration()
        {
            OpenAudio();
            var testMusic = LoadMusic("test_music", "280.mp3");
            Assert.True(MusicValid(testMusic));
            FreeMusic(testMusic);
            CloseAudio();
        }
        [Fact]
        public void TestMusicFilenameIntegration()
        {
            var testMusic = LoadMusic("test_music", "280.mp3");
            var filename = MusicFilename(testMusic);
            Assert.Equal(filename, "280.mp3");
            FreeMusic(testMusic);
        }
        [Fact]
        public void TestMusicNameIntegration()
        {
            var testMusic = LoadMusic("test_music", "280.mp3");
            var musicNameResult = MusicName(testMusic);
            Assert.Equal(musicNameResult, "test_music");
            FreeMusic(testMusic);
        }
        [Fact]
        public void TestMusicNamedIntegration()
        {
            var testMusic = LoadMusic("test_music", "280.mp3");
            var retrievedMusic = MusicNamed("test_music");
            Assert.Equal(testMusic, retrievedMusic);
            FreeMusic(testMusic);
        }
        [Fact]
        public void TestMusicPlayingIntegration()
        {
            OpenAudio();
            var testMusic = LoadMusic("test_music", "280.mp3");
            PlayMusic(testMusic);
            Assert.True(MusicPlaying());
            PauseMusic();
            Assert.False(MusicPlaying());
            FreeMusic(testMusic);
            CloseAudio();
        }
        [Fact]
        public void TestMusicValidIntegration()
        {
            OpenAudio();
            var testMusic = LoadMusic("test_music", "280.mp3");
            Assert.True(MusicValid(testMusic));
            FreeMusic(testMusic);
            Assert.False(MusicValid(testMusic));
            CloseAudio();
        }
        [Fact]
        public void TestMusicVolumeIntegration()
        {
            OpenAudio();
            var testMusic = LoadMusic("test_music", "280.mp3");
            PlayMusic(testMusic);
            SetMusicVolume(0.5);
            Assert.Equal(MusicVolume(), 0.5);
            FreeMusic(testMusic);
            CloseAudio();
        }
        [Fact]
        public void TestPauseMusicIntegration()
        {
            OpenAudio();
            var testMusic = LoadMusic("test_music", "280.mp3");
            PlayMusic(testMusic);
            PauseMusic();
            Assert.False(MusicPlaying());
            FreeMusic(testMusic);
            CloseAudio();
        }
        [Fact]
        public void TestPlayMusicNamedIntegration()
        {
            OpenAudio();
            var testMusic = LoadMusic("test_music", "280.mp3");
            PlayMusic("test_music");
            Assert.True(MusicPlaying());
            FreeMusic(testMusic);
            CloseAudio();
        }
        [Fact]
        public void TestPlayMusicNamedWithTimesIntegration()
        {
            OpenAudio();
            var testMusic = LoadMusic("test_music", "280.mp3");
            PlayMusic("test_music", 2);
            Assert.True(MusicPlaying());
            FreeMusic(testMusic);
            CloseAudio();
        }
        [Fact]
        public void TestPlayMusicIntegration()
        {
            OpenAudio();
            var testMusic = LoadMusic("test_music", "280.mp3");
            PlayMusic(testMusic);
            Assert.True(MusicPlaying());
            FreeMusic(testMusic);
            CloseAudio();
        }
        [Fact]
        public void TestPlayMusicWithTimesIntegration()
        {
            OpenAudio();
            var testMusic = LoadMusic("test_music", "280.mp3");
            PlayMusic(testMusic, 2);
            Assert.True(MusicPlaying());
            FreeMusic(testMusic);
            CloseAudio();
        }
        [Fact]
        public void TestPlayMusicWithTimesAndVolumeIntegration()
        {
            OpenAudio();
            var testMusic = LoadMusic("test_music", "280.mp3");
            PlayMusic(testMusic, 2, 0.5);
            Assert.True(MusicPlaying());
            Assert.InRange(MusicVolume(), 0.45, 0.55);
            FreeMusic(testMusic);
            CloseAudio();
        }
        [Fact]
        public void TestResumeMusicIntegration()
        {
            OpenAudio();
            var testMusic = LoadMusic("test_music", "280.mp3");
            PlayMusic(testMusic);
            PauseMusic();
            Assert.False(MusicPlaying());
            ResumeMusic();
            Assert.True(MusicPlaying());
            FreeMusic(testMusic);
            CloseAudio();
        }
        [Fact]
        public void TestSetMusicVolumeIntegration()
        {
            OpenAudio();
            var testMusic = LoadMusic("test_music", "280.mp3");
            PlayMusic(testMusic);
            SetMusicVolume(0.5);
            Assert.Equal(MusicVolume(), 0.5);
            FreeMusic(testMusic);
            CloseAudio();
        }
        [Fact]
        public void TestStopMusicIntegration()
        {
            OpenAudio();
            var testMusic = LoadMusic("test_music", "280.mp3");
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
            var testSound1 = LoadSoundEffect("test_sound1", "test.ogg");
            var testSound2 = LoadSoundEffect("test_sound2", "error.wav");
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
            var testSound = LoadSoundEffect("test_sound", "test.ogg");
            PlaySoundEffect(testSound);
            FadeSoundEffectOut(testSound, 1000);
            Assert.False(SoundEffectPlaying(testSound));
            FreeSoundEffect(testSound);
            CloseAudio();
        }
        [Fact]
        public void TestFreeAllSoundEffectsIntegration()
        {
            OpenAudio();
            var testSound1 = LoadSoundEffect("test_sound1", "test.ogg");
            var testSound2 = LoadSoundEffect("test_sound2", "error.wav");
            FreeAllSoundEffects();
            Assert.False(HasSoundEffect("test_sound1"));
            Assert.False(HasSoundEffect("test_sound2"));
            CloseAudio();
        }
        [Fact]
        public void TestFreeSoundEffectIntegration()
        {
            OpenAudio();
            var testSound = LoadSoundEffect("test_sound", "test.ogg");
            PlaySoundEffect(testSound);
            FreeSoundEffect(testSound);
            Assert.False(SoundEffectValid(testSound));
            CloseAudio();
        }
        [Fact]
        public void TestHasSoundEffectIntegration()
        {
            OpenAudio();
            var testSound = LoadSoundEffect("test_sound", "test.ogg");
            Assert.True(HasSoundEffect("test_sound"));
            FreeSoundEffect(testSound);
            Assert.False(HasSoundEffect("test_sound"));
            CloseAudio();
        }
        [Fact]
        public void TestLoadSoundEffectIntegration()
        {
            OpenAudio();
            var testSound = LoadSoundEffect("test_sound", "test.ogg");
            Assert.True(SoundEffectValid(testSound));
            FreeSoundEffect(testSound);
            CloseAudio();
        }
        [Fact]
        public void TestPlaySoundEffectNamedIntegration()
        {
            OpenAudio();
            var testSound = LoadSoundEffect("test_sound", "test.ogg");
            PlaySoundEffect("test_sound");
            Assert.True(SoundEffectPlaying("test_sound"));
            FreeSoundEffect(testSound);
            CloseAudio();
        }
        [Fact]
        public void TestPlaySoundEffectNamedWithVolumeIntegration()
        {
            OpenAudio();
            var testSound = LoadSoundEffect("test_sound", "test.ogg");
            PlaySoundEffect("test_sound", 0.5);
            Assert.True(SoundEffectPlaying("test_sound"));
            FreeSoundEffect(testSound);
            CloseAudio();
        }
        [Fact]
        public void TestPlaySoundEffectNamedWithTimesIntegration()
        {
            OpenAudio();
            var testSound = LoadSoundEffect("test_sound", "test.ogg");
            PlaySoundEffect("test_sound", 3);
            Assert.True(SoundEffectPlaying("test_sound"));
            FreeSoundEffect(testSound);
            CloseAudio();
        }
        [Fact]
        public void TestPlaySoundEffectNamedWithTimesAndVolumeIntegration()
        {
            OpenAudio();
            var testSound = LoadSoundEffect("test_sound", "test.ogg");
            PlaySoundEffect("test_sound", 2, 0.5);
            Assert.True(SoundEffectPlaying("test_sound"));
            FreeSoundEffect(testSound);
            CloseAudio();
        }
        [Fact]
        public void TestPlaySoundEffectIntegration()
        {
            OpenAudio();
            var testSound = LoadSoundEffect("test_sound", "test.ogg");
            PlaySoundEffect(testSound);
            Assert.True(SoundEffectPlaying(testSound));
            FreeSoundEffect(testSound);
            CloseAudio();
        }
        [Fact]
        public void TestPlaySoundEffectWithVolumeIntegration()
        {
            OpenAudio();
            var testSound = LoadSoundEffect("test_sound", "test.ogg");
            PlaySoundEffect(testSound, 0.5);
            Assert.True(SoundEffectPlaying(testSound));
            FreeSoundEffect(testSound);
            CloseAudio();
        }
        [Fact]
        public void TestPlaySoundEffectWithTimesIntegration()
        {
            OpenAudio();
            var testSound = LoadSoundEffect("test_sound", "test.ogg");
            PlaySoundEffect(testSound, 3);
            Assert.True(SoundEffectPlaying(testSound));
            FreeSoundEffect(testSound);
            CloseAudio();
        }
        [Fact]
        public void TestPlaySoundEffectWithTimesAndVolumeIntegration()
        {
            OpenAudio();
            var testSound = LoadSoundEffect("test_sound", "test.ogg");
            PlaySoundEffect(testSound, 2, 0.5);
            Assert.True(SoundEffectPlaying(testSound));
            FreeSoundEffect(testSound);
            CloseAudio();
        }
        [Fact]
        public void TestSoundEffectFilenameIntegration()
        {
            var testSound = LoadSoundEffect("test_sound", "test.ogg");
            var testFilename = SoundEffectFilename(testSound);
            Assert.Equal(testFilename, "test.ogg");
            FreeSoundEffect(testSound);
        }
        [Fact]
        public void TestSoundEffectNameIntegration()
        {
            var testSound = LoadSoundEffect("test_sound", "test.ogg");
            var testSoundName = SoundEffectName(testSound);
            Assert.Equal(testSoundName, "test_sound");
            FreeSoundEffect(testSound);
        }
        [Fact]
        public void TestSoundEffectNamedIntegration()
        {
            OpenAudio();
            var testSound = LoadSoundEffect("test_sound", "test.ogg");
            var retrievedSound = SoundEffectNamed("test_sound");
            Assert.Equal(testSound, retrievedSound);
            FreeSoundEffect(testSound);
            CloseAudio();
        }
        [Fact]
        public void TestSoundEffectPlayingNamedIntegration()
        {
            OpenAudio();
            var testSound = LoadSoundEffect("test_sound", "test.ogg");
            PlaySoundEffect("test_sound");
            Assert.True(SoundEffectPlaying("test_sound"));
            StopSoundEffect("test_sound");
            Assert.False(SoundEffectPlaying("test_sound"));
            FreeSoundEffect(testSound);
            CloseAudio();
        }
        [Fact]
        public void TestSoundEffectPlayingIntegration()
        {
            OpenAudio();
            var testSound = LoadSoundEffect("test_sound", "test.ogg");
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
            var testSoundEffect = LoadSoundEffect("test_sound", "test.ogg");
            Assert.True(SoundEffectValid(testSoundEffect));
            FreeSoundEffect(testSoundEffect);
            CloseAudio();
        }
        [Fact]
        public void TestStopSoundEffectNamedIntegration()
        {
            OpenAudio();
            var testSound = LoadSoundEffect("test_sound", "test.ogg");
            PlaySoundEffect("test_sound");
            StopSoundEffect("test_sound");
            Assert.False(SoundEffectPlaying("test_sound"));
            FreeSoundEffect(testSound);
            CloseAudio();
        }
    }
}
