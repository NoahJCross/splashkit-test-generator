using SplashKitSDK;
using static SplashKitSDK.SplashKit;
namespace SplashKitTests
{
    public class SpriteDelegates
    {
        private bool _eventCalled;
        private int _floatFunctionCallCount;
        private int _functionCallCount;


        public SpriteFloatFunction SpriteFloatFunction()
        {
            return (ptr, value) =>
            {
                _floatFunctionCallCount++;
                _eventCalled = true;
            };
        }

        public SpriteFunction SpriteFunction()
        {
            return (ptr) =>
            {
                _functionCallCount++;
                _eventCalled = true;
            };
        }

        public SpriteEventHandler SpriteEventHandler()
        {
            return (ptr, evt) =>
            {
                _eventCalled = true;
            };
        }

        public bool EventCalled() { return _eventCalled; }
        public int FloatFunctionCallCount() { return _floatFunctionCallCount; }
        public int FunctionCallCount() { return _functionCallCount; }

        public void Reset()
        {
            _floatFunctionCallCount = 0;
            _functionCallCount = 0;
            _eventCalled = false;
        }
    }

    public class KeyCallbacks
    {
        private KeyCode _lastKeyTyped;
        private KeyCode _lastKeyDown;
        private KeyCode _lastKeyUp;

        public KeyCallback OnKeyTyped()
        {
            return (key) => _lastKeyTyped = (KeyCode)key;
        }

        public KeyCallback OnKeyDown()
        {
            return (key) => _lastKeyDown = (KeyCode)key;
        }

        public KeyCallback OnKeyUp()
        {
            return (key) => _lastKeyUp = (KeyCode)key;
        }

        public KeyCode GetKeyTyped() { return _lastKeyTyped; }
        public KeyCode GetKeyDown() { return _lastKeyDown; }
        public KeyCode GetKeyUp() { return _lastKeyUp; }

        public void Reset()
        {
            _lastKeyTyped = 0;
            _lastKeyDown = 0;
            _lastKeyUp = 0;
        }
    }

    public class NotifierTracker
    {
        private bool _wasNotified;

        public FreeNotifier OnFree()
        {
            return (resource) => _wasNotified = true;
        }

        public bool WasNotified() { return _wasNotified; }

        public void Reset()
        {
            _wasNotified = false;
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
    public class RaspberryCleanup : IDisposable
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

    public class InterfaceFontCleanup : IDisposable
    {
        public void Dispose()
        {
            SetInterfaceFont(GetSystemFont());
        }
    }
    public class LayoutCleanup : IDisposable
    {
        public void Dispose()
        {
            ProcessEvents();
            ResetLayout();
            SetInterfaceStyle(InterfaceStyle.ShadedDarkStyle);
            ProcessEvents();
        }
    }
}