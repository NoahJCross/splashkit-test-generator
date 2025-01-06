using SplashKitSDK;
using static SplashKitSDK.SplashKit;
namespace SplashKitTests
{
    public class SpriteDelegates
    {
        public bool EventCalled { get; set; }
        public int FloatFunctionCallCount { get; private set; }
        public int FunctionCallCount { get; private set; }

        public void SpriteFloatFunction(nint ptr, float value)
        {
            FloatFunctionCallCount++;
            EventCalled = true;
        }

        public void SpriteFunction(nint ptr)
        {
            FunctionCallCount++;
            EventCalled = true;
        }

        public void SpriteEventHandler(nint ptr, int evt)
        {
            EventCalled = true;
        }

        public void Reset()
        {
            FloatFunctionCallCount = 0;
            FunctionCallCount = 0;
            EventCalled = false;
        }
    }

    public class KeyCallbacks
    {
        public KeyCode GetKeyTyped { get; private set; }
        public KeyCode GetKeyDown { get; private set; }
        public KeyCode GetKeyUp { get; private set; }

        public void OnKeyTyped(int key)
        {
            GetKeyTyped = (KeyCode)key;
        }

        public void OnKeyDown(int key)
        {
            GetKeyDown = (KeyCode)key;
        }

        public void OnKeyUp(int key)
        {
            GetKeyUp = (KeyCode)key;
        }

        public void Reset()
        {
            GetKeyTyped = 0;
            GetKeyDown = 0;
            GetKeyUp = 0;
        }
    }

    public class NotifierTracker
    {
        public bool WasNotified { get; private set; }

        public void OnFree(IntPtr resource)
        {
            WasNotified = true;
        }

        public void Reset()
        {
            WasNotified = false;
        }
    }
    public class AnimationScriptCleanup : IDisposable
    {
        public void Dispose()
        {
            FreeAllAnimationScripts();
        }
    }
    public class AnimationCleanup(Animation animation) : IDisposable
    {
        private readonly Animation _animation = animation;
        public void Dispose()
        {
            FreeAnimation(_animation);
        }
    }
    public class AudioCleanup : IDisposable
    {
        public void Dispose()
        {
            CloseAudio();
        }
    }
    public class SoundEffectCleanup : IDisposable
    {
        public void Dispose()
        {
            FreeAllSoundEffects();
        }
    }
    public class MusicCleanup : IDisposable
    {
        public void Dispose()
        {
            FreeAllMusic();
        }
    }
    public class WindowCleanup : IDisposable
    {
        public void Dispose()
        {
            CloseAllWindows();
            SetCameraPosition(PointAt(0, 0));
        }
    }
    public class BitmapCleanup : IDisposable
    {
        public void Dispose()
        {
            FreeAllBitmaps();
        }
    }
    public class SpriteCleanup : IDisposable
    {
        public void Dispose()
        {
            FreeAllSprites();
        }
    }
    public class FontCleanup : IDisposable
    {
        public void Dispose()
        {
            FreeAllFonts();
        }
    }
    public class RaspiCleanup : IDisposable
    {
        public void Dispose()
        {
            RaspiCleanup();
        }
    }
    public class JsonCleanup : IDisposable
    {
        public void Dispose()
        {
            FreeAllJson();
        }
    }
    public class ServerCleanup : IDisposable
    {
        public void Dispose()
        {
            CloseAllServers();
        }
    }
    public class ConnectionCleanup : IDisposable
    {
        public void Dispose()
        {
            CloseAllConnections();
        }
    }
    public class ResourceCleanup(string bundleName) : IDisposable
    {
        private readonly string _bundleName = bundleName;
        public void Dispose()
        {
            FreeResourceBundle(_bundleName);
        }
    }

    public class SpritePackCleanup(string spritePackName) : IDisposable
    {
        private readonly string _spritePackName = spritePackName;
        public void Dispose()
        {
            FreeSpritePack(_spritePackName);
        }
    }

    public class TimerCleanup : IDisposable
    {
        public void Dispose()
        {
            FreeAllTimers();
        }
    }
    public class LoggerCleanup : IDisposable
    {
        public void Dispose()
        {
            CloseLogProcess();
        }
    }
}