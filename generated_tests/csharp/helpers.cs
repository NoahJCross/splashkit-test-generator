using SplashKitSDK;
using System.Runtime.InteropServices;
using static SplashKitSDK.SplashKit;
namespace SplashKitTests
{
    public class SpriteDelegates
    {
        public bool EventCalled { get; set; }
        public int FloatFunctionCallCount { get; private set; }
        public int FunctionCallCount { get; private set; }
        public SpriteFloatFunction SpriteFloatFunction { get; private set; }
        public SpriteFunction SpriteFunction { get; private set; }
        public SpriteEventHandler SpriteEventHandler { get; private set; }
        public Action Reset { get; private set; }
        public SpriteDelegates()
        {
            FloatFunctionCallCount = 0; 
            FunctionCallCount = 0;
            SpriteFloatFunction = (nint ptr, float value) => { 
                FloatFunctionCallCount++; 
                EventCalled = true; 
            };
            SpriteFunction = (nint ptr) => { 
                FunctionCallCount++;
                EventCalled = true; 
            };
            SpriteEventHandler = (nint ptr, int evt) => { EventCalled = true; };
            Reset = () => 
            {
                FloatFunctionCallCount = 0;
                FunctionCallCount = 0;
                EventCalled = false;
            };
        }
    }

    public class KeyCallbacks
    {
        public KeyCode GetKeyTyped { get; private set; }
        public KeyCode GetKeyDown { get; private set; }
        public KeyCode GetKeyUp { get; private set; }

        public KeyCallback OnKeyTyped { get; private set; }
        public KeyCallback OnKeyDown { get; private set; }
        public KeyCallback OnKeyUp { get; private set; }
        public Action Reset { get; private set; }

        public KeyCallbacks()
        {
            OnKeyTyped = (int key) => { GetKeyTyped = (KeyCode)key; };
            OnKeyDown = (int key) => { GetKeyDown = (KeyCode)key; };
            OnKeyUp = (int key) => { GetKeyUp = (KeyCode)key; };
            Reset = () => 
            {
                GetKeyTyped = 0;
                GetKeyDown = 0;
                GetKeyUp = 0;
            };
        }
    }

    public class NotifierTracker
    {
        public bool WasNotified { get; private set; }
        public FreeNotifier OnFree { get; private set; }
        public Action Reset { get; private set; }
            public NotifierTracker()
        {
            OnFree = (IntPtr resource) => { WasNotified = true; };
            Reset = () => { WasNotified = false; };
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