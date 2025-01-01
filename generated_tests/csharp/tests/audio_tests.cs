using Xunit;
using SplashKitSDK;
using static SplashKitSDK.SplashKit;
using HttpMethod = SplashKitSDK.HttpMethod;
namespace SplashKitTests
{
    public class TestAudio
    {
        public TestAudio()
        {
            SetResourcesPath("/mnt/c/Users/Noahc/Documents/aYear_2_semester_2/TeamProject/GitHubRepo/splashkit_test_generator/resources");
        }
        [Fact]
        public void TestAudioReadyIntegration() {
            Assert.False(AudioReady());
            OpenAudio();
            using var cleanupAudio = new AudioCleanup();
            Assert.True(AudioReady());
            CloseAudio();
            Assert.False(AudioReady());
        }
        [Fact]
        public void TestCloseAudioIntegration() {
            OpenAudio();
            using var cleanupAudio = new AudioCleanup();
            Assert.True(AudioReady());
            CloseAudio();
            Assert.False(AudioReady());
        }
        [Fact]
        public void TestOpenAudioIntegration() {
            OpenAudio();
            using var cleanupAudio = new AudioCleanup();
            Assert.True(AudioReady());
            CloseAudio();
            Assert.False(AudioReady());
        }
        [Fact]
        public void TestFadeMusicInNamedIntegration() {
            OpenAudio();
            using var cleanupAudio = new AudioCleanup();
            LoadMusic("test_music", "magical_night.ogg");
            using var cleanupMusic = new MusicCleanup();
            FadeMusicIn("test_music", 1000);
            Assert.True(MusicPlaying());
        }
        [Fact]
        public void TestFadeMusicInNamedWithTimesIntegration() {
            OpenAudio();
            using var cleanupAudio = new AudioCleanup();
            LoadMusic("test_music", "magical_night.ogg");
            using var cleanupMusic = new MusicCleanup();
            FadeMusicIn("test_music", 2, 1000);
            Assert.True(MusicPlaying());
        }
        [Fact]
        public void TestFadeMusicInIntegration() {
            OpenAudio();
            using var cleanupAudio = new AudioCleanup();
            var testMusic = LoadMusic("test_music", "magical_night.ogg");
            using var cleanupMusic = new MusicCleanup();
            FadeMusicIn(testMusic, 1000);
            Assert.True(MusicPlaying());
        }
        [Fact]
        public void TestFadeMusicInWithTimesIntegration() {
            OpenAudio();
            using var cleanupAudio = new AudioCleanup();
            var testMusic = LoadMusic("test_music", "magical_night.ogg");
            using var cleanupMusic = new MusicCleanup();
            FadeMusicIn(testMusic, 2, 1000);
            Assert.True(MusicPlaying());
        }
        [Fact]
        public void TestFadeMusicOutIntegration() {
            OpenAudio();
            using var cleanupAudio = new AudioCleanup();
            var testMusic = LoadMusic("test_music", "magical_night.ogg");
            using var cleanupMusic = new MusicCleanup();
            PlayMusic(testMusic);
            FadeMusicOut(1000);
            Delay(3000);
            Assert.False(MusicPlaying());
        }
        [Fact]
        public void TestFreeAllMusicIntegration() {
            OpenAudio();
            using var cleanupAudio = new AudioCleanup();
            LoadMusic("test_music1", "magical_night.ogg");
            using var cleanupMusic = new MusicCleanup();
            LoadMusic("test_music2", "dancingFrog.wav");
            FreeAllMusic();
            Assert.False(HasMusic("test_music1"));
            Assert.False(HasMusic("test_music2"));
        }
        [Fact]
        public void TestFreeMusicIntegration() {
            OpenAudio();
            using var cleanupAudio = new AudioCleanup();
            var testMusic = LoadMusic("test_music", "magical_night.ogg");
            using var cleanupMusic = new MusicCleanup();
            PlayMusic(testMusic);
            FreeMusic(testMusic);
            Assert.False(HasMusic("test_music"));
        }
        [Fact]
        public void TestHasMusicIntegration() {
            OpenAudio();
            using var cleanupAudio = new AudioCleanup();
            var testMusic = LoadMusic("test_music", "magical_night.ogg");
            using var cleanupMusic = new MusicCleanup();
            Assert.True(HasMusic("test_music"));
            FreeMusic(testMusic);
            Assert.False(HasMusic("test_music"));
        }
        [Fact]
        public void TestLoadMusicIntegration() {
            OpenAudio();
            using var cleanupAudio = new AudioCleanup();
            var testMusic = LoadMusic("test_music", "magical_night.ogg");
            using var cleanupMusic = new MusicCleanup();
            Assert.NotNull(testMusic);
            Assert.True(MusicValid(testMusic));
        }
        [Fact]
        public void TestMusicFilenameIntegration() {
            OpenAudio();
            using var cleanupAudio = new AudioCleanup();
            var testMusic = LoadMusic("test_music", "magical_night.ogg");
            using var cleanupMusic = new MusicCleanup();
            Assert.Equal(PathToResource("magical_night.ogg", ResourceKind.SoundResource), MusicFilename(testMusic));
        }
        [Fact]
        public void TestMusicNameIntegration() {
            OpenAudio();
            using var cleanupAudio = new AudioCleanup();
            var testMusic = LoadMusic("test_music", "magical_night.ogg");
            using var cleanupMusic = new MusicCleanup();
            Assert.Equal("test_music", MusicName(testMusic));
        }
        [Fact]
        public void TestMusicNamedIntegration() {
            OpenAudio();
            using var cleanupAudio = new AudioCleanup();
            var testMusic = LoadMusic("test_music", "magical_night.ogg");
            using var cleanupMusic = new MusicCleanup();
            var namedMusic = MusicNamed("test_music");
            Assert.Equal(testMusic, namedMusic);
        }
        [Fact]
        public void TestMusicPlayingIntegration() {
            OpenAudio();
            using var cleanupAudio = new AudioCleanup();
            var testMusic = LoadMusic("test_music", "magical_night.ogg");
            using var cleanupMusic = new MusicCleanup();
            Assert.False(MusicPlaying());
            PlayMusic(testMusic);
            Assert.True(MusicPlaying());
        }
        [Fact]
        public void TestMusicValidIntegration() {
            OpenAudio();
            using var cleanupAudio = new AudioCleanup();
            var testMusic = LoadMusic("test_music", "magical_night.ogg");
            using var cleanupMusic = new MusicCleanup();
            Assert.True(MusicValid(testMusic));
            FreeMusic(testMusic);
            Assert.False(MusicValid(testMusic));
        }
        [Fact]
        public void TestMusicVolumeIntegration() {
            OpenAudio();
            using var cleanupAudio = new AudioCleanup();
            var testMusic = LoadMusic("test_music", "magical_night.ogg");
            using var cleanupMusic = new MusicCleanup();
            PlayMusic(testMusic);
            SetMusicVolume(0.5);
            Assert.Equal(0.5, MusicVolume());
        }
        [Fact]
        public void TestPauseMusicIntegration() {
            OpenAudio();
            using var cleanupAudio = new AudioCleanup();
            var testMusic = LoadMusic("test_music", "magical_night.ogg");
            using var cleanupMusic = new MusicCleanup();
            PlayMusic(testMusic);
            PauseMusic();
            Assert.True(MusicPlaying());
        }
        [Fact]
        public void TestPlayMusicNamedIntegration() {
            OpenAudio();
            using var cleanupAudio = new AudioCleanup();
            LoadMusic("test_music", "magical_night.ogg");
            using var cleanupMusic = new MusicCleanup();
            PlayMusic("test_music");
            Assert.True(MusicPlaying());
        }
        [Fact]
        public void TestPlayMusicNamedWithTimesIntegration() {
            OpenAudio();
            using var cleanupAudio = new AudioCleanup();
            LoadMusic("test_music", "magical_night.ogg");
            using var cleanupMusic = new MusicCleanup();
            PlayMusic("test_music", 2);
            Assert.True(MusicPlaying());
        }
        [Fact]
        public void TestPlayMusicIntegration() {
            OpenAudio();
            using var cleanupAudio = new AudioCleanup();
            var testMusic = LoadMusic("test_music", "magical_night.ogg");
            using var cleanupMusic = new MusicCleanup();
            PlayMusic(testMusic);
            Assert.True(MusicPlaying());
        }
        [Fact]
        public void TestPlayMusicWithTimesIntegration() {
            OpenAudio();
            using var cleanupAudio = new AudioCleanup();
            var testMusic = LoadMusic("test_music", "magical_night.ogg");
            using var cleanupMusic = new MusicCleanup();
            PlayMusic(testMusic, 2);
            Assert.True(MusicPlaying());
        }
        [Fact]
        public void TestPlayMusicWithTimesAndVolumeIntegration() {
            OpenAudio();
            using var cleanupAudio = new AudioCleanup();
            var testMusic = LoadMusic("test_music", "magical_night.ogg");
            using var cleanupMusic = new MusicCleanup();
            PlayMusic(testMusic, 2, 0.75);
            Assert.True(MusicPlaying());
            Assert.Equal(0.75, MusicVolume());
        }
        [Fact]
        public void TestResumeMusicIntegration() {
            OpenAudio();
            using var cleanupAudio = new AudioCleanup();
            var testMusic = LoadMusic("test_music", "magical_night.ogg");
            using var cleanupMusic = new MusicCleanup();
            PlayMusic(testMusic);
            PauseMusic();
            Assert.True(MusicPlaying());
            ResumeMusic();
            Assert.True(MusicPlaying());
        }
        [Fact]
        public void TestSetMusicVolumeIntegration() {
            OpenAudio();
            using var cleanupAudio = new AudioCleanup();
            var testMusic = LoadMusic("test_music", "magical_night.ogg");
            using var cleanupMusic = new MusicCleanup();
            PlayMusic(testMusic);
            SetMusicVolume(0.5);
            Assert.Equal(0.5, MusicVolume());
        }
        [Fact]
        public void TestStopMusicIntegration() {
            OpenAudio();
            using var cleanupAudio = new AudioCleanup();
            var testMusic = LoadMusic("test_music", "magical_night.ogg");
            using var cleanupMusic = new MusicCleanup();
            PlayMusic(testMusic);
            StopMusic();
            Assert.False(MusicPlaying());
        }
        [Fact]
        public void TestFadeAllSoundEffectsOutIntegration() {
            OpenAudio();
            using var cleanupAudio = new AudioCleanup();
            var testSound1 = LoadSoundEffect("test_sound1", "comedy_boing.wav");
            using var cleanupSoundEffect = new SoundEffectCleanup();
            var testSound2 = LoadSoundEffect("test_sound2", "comedy_boing.ogg");
            PlaySoundEffect(testSound1);
            PlaySoundEffect(testSound2);
            FadeAllSoundEffectsOut(1000);
            Delay(1100);
            Assert.False(SoundEffectPlaying(testSound1));
            Assert.False(SoundEffectPlaying(testSound2));
        }
        [Fact]
        public void TestFadeSoundEffectOutIntegration() {
            OpenAudio();
            using var cleanupAudio = new AudioCleanup();
            var testSound = LoadSoundEffect("test_sound", "breakdance.wav");
            using var cleanupSoundEffect = new SoundEffectCleanup();
            PlaySoundEffect(testSound);
            FadeSoundEffectOut(testSound, 1000);
            Delay(3000);
            Assert.False(SoundEffectPlaying(testSound));
        }
        [Fact]
        public void TestFreeAllSoundEffectsIntegration() {
            OpenAudio();
            using var cleanupAudio = new AudioCleanup();
            LoadSoundEffect("test_sound1", "breakdance.wav");
            using var cleanupSoundEffect = new SoundEffectCleanup();
            LoadSoundEffect("test_sound2", "comedy_boing.ogg");
            FreeAllSoundEffects();
            Assert.False(HasSoundEffect("test_sound1"));
            Assert.False(HasSoundEffect("test_sound2"));
        }
        [Fact]
        public void TestFreeSoundEffectIntegration() {
            OpenAudio();
            using var cleanupAudio = new AudioCleanup();
            var testSound = LoadSoundEffect("test_sound", "breakdance.wav");
            using var cleanupSoundEffect = new SoundEffectCleanup();
            PlaySoundEffect(testSound);
            FreeSoundEffect(testSound);
            Assert.False(HasSoundEffect("test_sound"));
        }
        [Fact]
        public void TestHasSoundEffectIntegration() {
            OpenAudio();
            using var cleanupAudio = new AudioCleanup();
            var testSound = LoadSoundEffect("test_sound", "breakdance.wav");
            using var cleanupSoundEffect = new SoundEffectCleanup();
            Assert.True(HasSoundEffect("test_sound"));
            FreeSoundEffect(testSound);
            Assert.False(HasSoundEffect("test_sound"));
        }
        [Fact]
        public void TestLoadSoundEffectIntegration() {
            OpenAudio();
            using var cleanupAudio = new AudioCleanup();
            var testSound = LoadSoundEffect("test_sound", "breakdance.wav");
            using var cleanupSoundEffect = new SoundEffectCleanup();
            Assert.NotNull(testSound);
            Assert.True(HasSoundEffect("test_sound"));
        }
        [Fact]
        public void TestPlaySoundEffectNamedIntegration() {
            OpenAudio();
            using var cleanupAudio = new AudioCleanup();
            var testSound = LoadSoundEffect("test_sound", "breakdance.wav");
            using var cleanupSoundEffect = new SoundEffectCleanup();
            PlaySoundEffect("test_sound");
            Assert.True(SoundEffectPlaying(testSound));
        }
        [Fact]
        public void TestPlaySoundEffectNamedWithVolumeIntegration() {
            OpenAudio();
            using var cleanupAudio = new AudioCleanup();
            var testSound = LoadSoundEffect("test_sound", "breakdance.wav");
            using var cleanupSoundEffect = new SoundEffectCleanup();
            PlaySoundEffect("test_sound", 0.75);
            Assert.True(SoundEffectPlaying(testSound));
        }
        [Fact]
        public void TestPlaySoundEffectNamedWithTimesIntegration() {
            OpenAudio();
            using var cleanupAudio = new AudioCleanup();
            var testSound = LoadSoundEffect("test_sound", "breakdance.wav");
            using var cleanupSoundEffect = new SoundEffectCleanup();
            PlaySoundEffect("test_sound", 3);
            Assert.True(SoundEffectPlaying(testSound));
        }
        [Fact]
        public void TestPlaySoundEffectNamedWithTimesAndVolumeIntegration() {
            OpenAudio();
            using var cleanupAudio = new AudioCleanup();
            var testSound = LoadSoundEffect("test_sound", "breakdance.wav");
            using var cleanupSoundEffect = new SoundEffectCleanup();
            PlaySoundEffect("test_sound", 2, 0.75);
            Assert.True(SoundEffectPlaying(testSound));
        }
        [Fact]
        public void TestPlaySoundEffectIntegration() {
            OpenAudio();
            using var cleanupAudio = new AudioCleanup();
            var testSound = LoadSoundEffect("test_sound", "breakdance.wav");
            using var cleanupSoundEffect = new SoundEffectCleanup();
            PlaySoundEffect(testSound);
            Assert.True(SoundEffectPlaying(testSound));
        }
        [Fact]
        public void TestPlaySoundEffectWithVolumeIntegration() {
            OpenAudio();
            using var cleanupAudio = new AudioCleanup();
            var testSound = LoadSoundEffect("test_sound", "breakdance.wav");
            using var cleanupSoundEffect = new SoundEffectCleanup();
            PlaySoundEffect(testSound, 0.75);
            Assert.True(SoundEffectPlaying(testSound));
        }
        [Fact]
        public void TestPlaySoundEffectWithTimesIntegration() {
            OpenAudio();
            using var cleanupAudio = new AudioCleanup();
            var testSound = LoadSoundEffect("test_sound", "SwinGameStart.wav");
            using var cleanupSoundEffect = new SoundEffectCleanup();
            PlaySoundEffect(testSound, 3);
            Assert.True(SoundEffectPlaying(testSound));
        }
        [Fact]
        public void TestPlaySoundEffectWithTimesAndVolumeIntegration() {
            OpenAudio();
            using var cleanupAudio = new AudioCleanup();
            var testSound = LoadSoundEffect("test_sound", "SwinGameStart.wav");
            using var cleanupSoundEffect = new SoundEffectCleanup();
            PlaySoundEffect(testSound, 2, 0.75);
            Assert.True(SoundEffectPlaying(testSound));
        }
        [Fact]
        public void TestSoundEffectFilenameIntegration() {
            OpenAudio();
            using var cleanupAudio = new AudioCleanup();
            var testSound = LoadSoundEffect("test_sound", "SwinGameStart.wav");
            using var cleanupSoundEffect = new SoundEffectCleanup();
            Assert.Equal(PathToResource("SwinGameStart.wav", ResourceKind.SoundResource), SoundEffectFilename(testSound));
        }
        [Fact]
        public void TestSoundEffectNameIntegration() {
            OpenAudio();
            using var cleanupAudio = new AudioCleanup();
            var testSound = LoadSoundEffect("test_sound", "SwinGameStart.wav");
            using var cleanupSoundEffect = new SoundEffectCleanup();
            Assert.Equal("test_sound", SoundEffectName(testSound));
        }
        [Fact]
        public void TestSoundEffectNamedIntegration() {
            OpenAudio();
            using var cleanupAudio = new AudioCleanup();
            var testSound = LoadSoundEffect("test_sound", "SwinGameStart.wav");
            using var cleanupSoundEffect = new SoundEffectCleanup();
            var namedSound = SoundEffectNamed("test_sound");
            Assert.Equal(testSound, namedSound);
        }
        [Fact]
        public void TestSoundEffectPlayingNamedIntegration() {
            OpenAudio();
            using var cleanupAudio = new AudioCleanup();
            LoadSoundEffect("test_sound", "SwinGameStart.wav");
            using var cleanupSoundEffect = new SoundEffectCleanup();
            PlaySoundEffect("test_sound");
            Assert.True(SoundEffectPlaying("test_sound"));
            StopSoundEffect("test_sound");
            Assert.False(SoundEffectPlaying("test_sound"));
        }
        [Fact]
        public void TestSoundEffectPlayingIntegration() {
            OpenAudio();
            using var cleanupAudio = new AudioCleanup();
            var testSound = LoadSoundEffect("test_sound", "SwinGameStart.wav");
            using var cleanupSoundEffect = new SoundEffectCleanup();
            PlaySoundEffect(testSound);
            Assert.True(SoundEffectPlaying(testSound));
            StopSoundEffect(testSound);
            Assert.False(SoundEffectPlaying(testSound));
        }
        [Fact]
        public void TestSoundEffectValidIntegration() {
            OpenAudio();
            using var cleanupAudio = new AudioCleanup();
            var testSound = LoadSoundEffect("test_sound", "SwinGameStart.wav");
            using var cleanupSoundEffect = new SoundEffectCleanup();
            Assert.NotNull(testSound);
            Assert.True(HasSoundEffect("test_sound"));
        }
        [Fact]
        public void TestStopSoundEffectNamedIntegration() {
            OpenAudio();
            using var cleanupAudio = new AudioCleanup();
            LoadSoundEffect("test_sound", "SwinGameStart.wav");
            using var cleanupSoundEffect = new SoundEffectCleanup();
            PlaySoundEffect("test_sound");
            StopSoundEffect("test_sound");
            Assert.False(SoundEffectPlaying("test_sound"));
        }
        [Fact]
        public void TestStopSoundEffectIntegration() {
            OpenAudio();
            using var cleanupAudio = new AudioCleanup();
            var testSound = LoadSoundEffect("test_sound", "SwinGameStart.wav");
            using var cleanupSoundEffect = new SoundEffectCleanup();
            PlaySoundEffect(testSound);
            StopSoundEffect(testSound);
            Assert.False(SoundEffectPlaying(testSound));
        }
    }
}
