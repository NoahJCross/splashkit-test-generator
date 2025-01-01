use splashkit::*;

pub struct SpriteDelegates {
  pub event_called: bool,
  pub float_function_call_count: i32,
  pub function_call_count: i32,
}

impl SpriteDelegates {
  pub fn new() -> Self {
      SpriteDelegates {
          event_called: false,
          float_function_call_count: 0,
          function_call_count: 0,
      }
  }
   pub fn sprite_float_callback(&mut self, _ptr: usize, _value: f32) {
      self.float_function_call_count += 1;
      self.event_called = true;
  }
   pub fn sprite_callback(&mut self, _ptr: usize) {
      self.function_call_count += 1;
      self.event_called = true;
  }
   pub fn sprite_event_callback(&mut self, _ptr: usize, _evt: i32) {
      self.event_called = true;
  }
   pub fn reset(&mut self) {
      self.float_function_call_count = 0;
      self.function_call_count = 0;
      self.event_called = false;
  }
}

pub struct KeyCallbacks {
  pub get_key_typed: KeyCode,
  pub get_key_down: KeyCode,
  pub get_key_up: KeyCode,
}

impl KeyCallbacks {
  pub fn new() -> Self {
      KeyCallbacks {
          get_key_typed: KeyCode::UnknownKey,
          get_key_down: KeyCode::UnknownKey,
          get_key_up: KeyCode::UnknownKey,
      }
  }
  pub fn on_key_typed(&mut self, key: i32) {
      self.get_key_typed = KeyCode::from(key);
  }
   pub fn on_key_down(&mut self, key: i32) {
      self.get_key_down = KeyCode::from(key);
  }
   pub fn on_key_up(&mut self, key: i32) {
      self.get_key_up = KeyCode::from(key);
  }
   pub fn reset(&mut self) {
      self.get_key_typed = KeyCode::UnknownKey;
      self.get_key_down = KeyCode::UnknownKey;
      self.get_key_up = KeyCode::UnknownKey;
  }
}

pub struct NotifierTracker {
  pub was_notified: bool,
}

impl NotifierTracker {
  pub fn new() -> Self {
      NotifierTracker {
          was_notified: false,
      }
  }
   pub fn on_free(&mut self, _resource: usize) {
      self.was_notified = true;
  }
   pub fn reset(&mut self) {
      self.was_notified = false;
  }
}

pub struct AnimationScriptCleanup;
impl AnimationScriptCleanup {
    pub fn new() -> Self { Self }
}
impl Drop for AnimationScriptCleanup {
    fn drop(&mut self) {
        free_all_animation_scripts();
    }
}

pub struct AnimationCleanup {
    animation: Animation,
}
impl AnimationCleanup {
    pub fn new(animation: Animation) -> Self {
        Self { animation }
    }
}
impl Drop for AnimationCleanup {
    fn drop(&mut self) {
        free_animation(self.animation);
    }
}

pub struct AudioCleanup;
impl AudioCleanup {
    pub fn new() -> Self { Self }
}
impl Drop for AudioCleanup {
    fn drop(&mut self) {
        close_audio();
    }
}

pub struct SoundEffectCleanup;
impl SoundEffectCleanup {
    pub fn new() -> Self { Self }
}
impl Drop for SoundEffectCleanup {
    fn drop(&mut self) {
        free_all_sound_effects();
    }
}

pub struct MusicCleanup;
impl MusicCleanup {
    pub fn new() -> Self { Self }
}
impl Drop for MusicCleanup {
    fn drop(&mut self) {
        free_all_music();
    }
}

pub struct WindowCleanup;
impl WindowCleanup {
    pub fn new() -> Self { Self }
}
impl Drop for WindowCleanup {
    fn drop(&mut self) {
        close_all_windows();
        set_camera_position(point_at(0.0, 0.0));
    }
}

pub struct BitmapCleanup;
impl BitmapCleanup {
    pub fn new() -> Self { Self }
}
impl Drop for BitmapCleanup {
    fn drop(&mut self) {
        free_all_bitmaps();
    }
}

pub struct SpriteCleanup;
impl SpriteCleanup {
    pub fn new() -> Self { Self }
}
impl Drop for SpriteCleanup {
    fn drop(&mut self) {
        free_all_sprites();
    }
}

pub struct FontCleanup;
impl FontCleanup {
    pub fn new() -> Self { Self }
}
impl Drop for FontCleanup {
    fn drop(&mut self) {
        free_all_fonts();
    }
}

pub struct RaspiCleanup;
impl RaspiCleanup {
    pub fn new() -> Self { Self }
}
impl Drop for RaspiCleanup {
    fn drop(&mut self) {
        raspi_cleanup();
    }
}

pub struct JsonCleanup;
impl JsonCleanup {
    pub fn new() -> Self { Self }
}
impl Drop for JsonCleanup {
    fn drop(&mut self) {
        free_all_json();
    }
}

pub struct ServerCleanup;
impl ServerCleanup {
    pub fn new() -> Self { Self }
}
impl Drop for ServerCleanup {
    fn drop(&mut self) {
        close_all_servers();
    }
}

pub struct ConnectionCleanup;
impl ConnectionCleanup {
    pub fn new() -> Self { Self }
}
impl Drop for ConnectionCleanup {
    fn drop(&mut self) {
        close_all_connections();
    }
}

pub struct ResourceCleanup {
    bundle_name: String,
}
impl ResourceCleanup {
    pub fn new(bundle_name: String) -> Self {
        Self { bundle_name }
    }
}
impl Drop for ResourceCleanup {
    fn drop(&mut self) {
        free_resource_bundle(self.bundle_name.clone());
    }
}

pub struct SpritePackCleanup {
    pack_name: String,
}
impl SpritePackCleanup {
    pub fn new(pack_name: String) -> Self {
        Self { pack_name }
    }
}
impl Drop for SpritePackCleanup {
    fn drop(&mut self) {
        free_sprite_pack(self.pack_name.clone());
    }
}

pub struct TimerCleanup;
impl TimerCleanup {
    pub fn new() -> Self { Self }
}
impl Drop for TimerCleanup {
    fn drop(&mut self) {
        free_all_timers();
    }
}

pub struct LoggerCleanup;
impl LoggerCleanup {
    pub fn new() -> Self { Self }
}
impl Drop for LoggerCleanup {
    fn drop(&mut self) {
        close_log_process();
    }
}
