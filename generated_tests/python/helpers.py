import contextlib
from splashkit import *

class SpriteDelegates:
   def __init__(self):
       self.event_called = False
       self.float_function_call_count = 0
       self.function_call_count = 0
   
   def sprite_float_callback(self, ptr, value):
       self.float_function_call_count += 1
       self.event_called = True
   
   def sprite_callback(self, ptr):
       self.function_call_count += 1
       self.event_called = True
   
   def sprite_event_callback(self, ptr, evt):
       self.event_called = True
   
   def reset(self):
       self.float_function_call_count = 0
       self.function_call_count = 0
       self.event_called = False

class KeyCallbacks:
   def __init__(self):
       self.key_typed = 0
       self.key_down = 0
       self.key_up = 0
   
   def on_key_typed(self, key):
       self.key_typed = key
   
   def on_key_down(self, key):
       self.key_down = key
   
   def on_key_up(self, key):
       self.key_up = key
   
   def reset(self):
       self.key_typed = 0
       self.key_down = 0
       self.key_up = 0

class NotifierTracker:
   def __init__(self):
       self.was_notified = False
   
   def on_free(self, resource):
       self.was_notified = True
   
   def reset(self):
       self.was_notified = False

@contextlib.contextmanager
def animation_script_cleanup():
    try:
        yield
    finally:
        free_all_animation_scripts()

@contextlib.contextmanager
def animation_cleanup(animation):
    try:
        yield
    finally:
        free_animation(animation)

@contextlib.contextmanager
def audio_cleanup():
    try:
        yield
    finally:
        close_audio()

@contextlib.contextmanager
def sound_effect_cleanup():
    try:
        yield
    finally:
        free_all_sound_effects()

@contextlib.contextmanager
def music_cleanup():
    try:
        yield
    finally:
        free_all_music()

@contextlib.contextmanager
def window_cleanup():
    try:
        yield
    finally:
        close_all_windows()
        set_camera_position(point_at(0, 0))

@contextlib.contextmanager
def bitmap_cleanup():
    try:
        yield
    finally:
        free_all_bitmaps()

@contextlib.contextmanager
def sprite_cleanup():
    try:
        yield
    finally:
        free_all_sprites()

@contextlib.contextmanager
def font_cleanup():
    try:
        yield
    finally:
        free_all_fonts()

@contextlib.contextmanager
def raspi_cleanup():
    try:
        yield
    finally:
        raspi_cleanup()

@contextlib.contextmanager
def json_cleanup():
    try:
        yield
    finally:
        free_all_json()

@contextlib.contextmanager
def server_cleanup():
    try:
        yield
    finally:
        close_all_servers()

@contextlib.contextmanager
def connection_cleanup():
    try:
        yield
    finally:
        close_all_connections()

@contextlib.contextmanager
def resource_cleanup(bundle_name: str):
    try:
        yield
    finally:
        free_resource_bundle(bundle_name)

@contextlib.contextmanager
def sprite_pack_cleanup(pack_name: str):
    try:
        yield
    finally:
        free_sprite_pack(pack_name)

@contextlib.contextmanager
def timer_cleanup():
    try:
        yield
    finally:
        free_all_timers()

@contextlib.contextmanager
def logger_cleanup():
    try:
        yield
    finally:
        close_log_process()