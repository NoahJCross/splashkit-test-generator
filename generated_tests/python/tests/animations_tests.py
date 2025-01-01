import pytest
from splashkit import *
from ..helpers import *
import contextlib
class TestAnimations:
    def setup_method(self):
        set_resources_path("/mnt/c/Users/Noahc/Documents/aYear_2_semester_2/TeamProject/GitHubRepo/splashkit_test_generator/resources")

    def test_animation_count_integration():
        test_script = load_animation_script("kermit", "kermit.txt")
        with animation_script_cleanup():
            count = animation_count(test_script)
            assert count > 0
            
    def test_animation_current_cell_integration():
        test_script = load_animation_script("kermit", "kermit.txt")
        with animation_script_cleanup():
            test_animation = create_animation(test_script, "moonwalkback")
            with animation_cleanup(test_animation):
                current_cell = animation_current_cell(test_animation)
                assert current_cell > -1
                
    def test_animation_current_vector_integration():
        test_script = load_animation_script("kermit", "kermit.txt")
        with animation_script_cleanup():
            test_animation = create_animation(test_script, "moonwalkback")
            with animation_cleanup(test_animation):
                current_vector = animation_current_vector(test_animation)
                assert 0.0 == current_vector.x
                assert 0.0 == current_vector.y
                
    def test_animation_ended_integration():
        test_script = load_animation_script("kermit", "kermit.txt")
        with animation_script_cleanup():
            test_animation = create_animation(test_script, "moonwalkback")
            with animation_cleanup(test_animation):
                assert not animation_ended(test_animation)
                for _ in range(50):
                    update_animation_percent(test_animation, 100.0)
                    
                    assert animation_ended(test_animation)
                    
    def test_animation_entered_frame_integration():
        test_script = load_animation_script("kermit", "kermit.txt")
        with animation_script_cleanup():
            test_animation = create_animation(test_script, "walkfront")
            with animation_cleanup(test_animation):
                update_animation_percent(test_animation, 20)
                assert animation_entered_frame(test_animation)
                update_animation(test_animation)
                assert not animation_entered_frame(test_animation)
                
    def test_animation_frame_time_integration():
        test_script = load_animation_script("kermit", "kermit.txt")
        with animation_script_cleanup():
            test_animation = create_animation(test_script, "walkfront")
            with animation_cleanup(test_animation):
                update_animation(test_animation)
                frame_time = animation_frame_time(test_animation)
                assert frame_time > 0.0
                
    def test_animation_index_integration():
        test_script = load_animation_script("kermit", "kermit.txt")
        with animation_script_cleanup():
            index = animation_index(test_script, "walkfront")
            assert index > -1
            non_existent_index = animation_index(test_script, "NonExistentAnimation")
            assert -1 == non_existent_index
            
    def test_animation_name_integration():
        test_script = load_animation_script("kermit", "kermit.txt")
        with animation_script_cleanup():
            test_animation = create_animation(test_script, "moonwalkback")
            with animation_cleanup(test_animation):
                anim_name = animation_name(test_animation)
                assert "moonwalkback" == anim_name
                
    def test_animation_script_name_integration():
        test_script = load_animation_script("kermit", "kermit.txt")
        with animation_script_cleanup():
            script_name = animation_script_name(test_script)
            assert "kermit" == script_name
            
    def test_animation_script_named_integration():
        test_script = load_animation_script("kermit", "kermit.txt")
        with animation_script_cleanup():
            animation_script_named("kermit")
            assert test_script is not None
            assert test_script == test_script
            
    def test_assign_animation_with_script_integration():
        test_script = load_animation_script("kermit", "kermit.txt")
        with animation_script_cleanup():
            test_animation = create_animation(test_script, "moonwalkback")
            with animation_cleanup(test_animation):
                assign_animation_with_script(test_animation, test_script, "walkfront")
                assert "walkfront" == animation_name(test_animation)
                
    def test_assign_animation_with_script_and_sound_integration():
        test_script = load_animation_script("kermit", "kermit.txt")
        with animation_script_cleanup():
            test_animation = create_animation(test_script, "walkfront")
            with animation_cleanup(test_animation):
                assign_animation_with_script_and_sound(test_animation, test_script, "walkleft", true)
                assert "walkleft" == animation_name(test_animation)
                
    def test_assign_animation_index_with_script_integration():
        test_script = load_animation_script("kermit", "kermit.txt")
        with animation_script_cleanup():
            test_animation = create_animation(test_script, "moonwalkback")
            with animation_cleanup(test_animation):
                assign_animation_index_with_script(test_animation, test_script, 0)
                assert "walkfront" == animation_name(test_animation)
                
    def test_assign_animation_index_with_script_and_sound_integration():
        test_script = load_animation_script("kermit", "kermit.txt")
        with animation_script_cleanup():
            test_animation = create_animation(test_script, "moonwalkback")
            with animation_cleanup(test_animation):
                assign_animation_index_with_script_and_sound(test_animation, test_script, 0, true)
                assert "walkfront" == animation_name(test_animation)
                
    def test_assign_animation_with_script_named_integration():
        test_script = load_animation_script("kermit", "kermit.txt")
        with animation_script_cleanup():
            test_animation = create_animation(test_script, "moonwalkback")
            with animation_cleanup(test_animation):
                assign_animation_with_script_named(test_animation, "kermit", "walkfront")
                assert "walkfront" == animation_name(test_animation)
                
    def test_assign_animation_with_script_named_and_sound_integration():
        test_script = load_animation_script("kermit", "kermit.txt")
        with animation_script_cleanup():
            test_animation = create_animation(test_script, "walkfront")
            with animation_cleanup(test_animation):
                assign_animation_with_script_named_and_sound(test_animation, "kermit", "walkfront", true)
                assert "walkfront" == animation_name(test_animation)
                
    def test_assign_animation_index_integration():
        test_script = load_animation_script("kermit", "kermit.txt")
        with animation_script_cleanup():
            test_animation = create_animation(test_script, "moonwalkback")
            with animation_cleanup(test_animation):
                assign_animation_index(test_animation, 0)
                assert 0 == animation_current_cell(test_animation)
                
    def test_assign_animation_index_with_sound_integration():
        test_script = load_animation_script("kermit", "kermit.txt")
        with animation_script_cleanup():
            test_animation = create_animation_with_sound(test_script, "moonwalkback", false)
            with animation_cleanup(test_animation):
                assign_animation_index_with_sound(test_animation, 0, true)
                assert animation_entered_frame(test_animation)
                
    def test_assign_animation_integration():
        test_script = load_animation_script("kermit", "kermit.txt")
        with animation_script_cleanup():
            test_animation = create_animation(test_script, "moonwalkback")
            with animation_cleanup(test_animation):
                assign_animation(test_animation, "walkfront")
                assert "walkfront" == animation_name(test_animation)
                
    def test_assign_animation_with_sound_integration():
        test_script = load_animation_script("kermit", "kermit.txt")
        with animation_script_cleanup():
            test_animation = create_animation(test_script, "moonwalkback")
            with animation_cleanup(test_animation):
                assign_animation_with_sound(test_animation, "walkfront", true)
                assert "walkfront" == animation_name(test_animation)
                
    def test_create_animation_from_index_with_sound_integration():
        test_script = load_animation_script("kermit", "kermit.txt")
        with animation_script_cleanup():
            test_animation = create_animation_from_index_with_sound(test_script, 0, true)
            with animation_cleanup(test_animation):
                assert test_animation is not None
                anim_name = animation_name(test_animation)
                assert "walkfront" == anim_name
                
    def test_create_animation_integration():
        test_script = load_animation_script("kermit", "kermit.txt")
        with animation_script_cleanup():
            test_animation = create_animation(test_script, "moonwalkback")
            with animation_cleanup(test_animation):
                assert test_animation is not None
                anim_name = animation_name(test_animation)
                assert "moonwalkback" == anim_name
                
    def test_create_animation_with_sound_integration():
        test_script = load_animation_script("kermit", "kermit.txt")
        with animation_script_cleanup():
            test_animation = create_animation_with_sound(test_script, "moonwalkback", true)
            with animation_cleanup(test_animation):
                assert test_animation is not None
                anim_name = animation_name(test_animation)
                assert "moonwalkback" == anim_name
                
    def test_create_animation_from_script_named_integration():
        load_animation_script("kermit", "kermit.txt")
        with animation_script_cleanup():
            test_animation = create_animation_from_script_named("kermit", "moonwalkback")
            with animation_cleanup(test_animation):
                assert test_animation is not None
                anim_name = animation_name(test_animation)
                assert "moonwalkback" == anim_name
                
    def test_create_animation_from_script_named_with_sound_integration():
        load_animation_script("test_script", "kermit.txt")
        with animation_script_cleanup():
            test_animation = create_animation_from_script_named_with_sound("test_script", "moonwalkback", true)
            with animation_cleanup(test_animation):
                assert test_animation is not None
                anim_name = animation_name(test_animation)
                assert "moonwalkback" == anim_name
                
    def test_free_all_animation_scripts_integration():
        load_animation_script("free_all_kermit1", "kermit.txt")
        with animation_script_cleanup():
            load_animation_script("free_all_kermit2", "kermit.txt")
            assert has_animation_script("free_all_kermit1")
            assert has_animation_script("free_all_kermit2")
            free_all_animation_scripts()
            assert not has_animation_script("free_all_kermit1")
            assert not has_animation_script("free_all_kermit2")
            
    def test_free_animation_integration():
        test_script = load_animation_script("kermit", "kermit.txt")
        with animation_script_cleanup():
            test_animation = create_animation(test_script, "moonwalkback")
            with animation_cleanup(test_animation):
                free_animation(test_animation)
                assert "" == animation_name(test_animation)
                assert animation_ended(test_animation)
                
    def test_free_animation_script_integration():
        test_script = load_animation_script("kermit", "kermit.txt")
        with animation_script_cleanup():
            assert test_script is not None
            free_animation_script(test_script)
            script_exists = has_animation_script("has_kermit")
            assert not script_exists
            
    def test_free_animation_script_with_name_integration():
        load_animation_script("free_kermit", "kermit.txt")
        with animation_script_cleanup():
            assert has_animation_script("free_kermit")
            free_animation_script_with_name("free_kermit")
            assert not has_animation_script("free_kermit")
            
    def test_has_animation_named_integration():
        test_script = load_animation_script("kermit", "kermit.txt")
        with animation_script_cleanup():
            has_walkfront = has_animation_named(test_script, "walkfront")
            assert has_walkfront
            has_nonexistent = has_animation_named(test_script, "NonExistentAnimation")
            assert not has_nonexistent
            
    def test_has_animation_script_integration():
        test_script = load_animation_script("has_kermit", "kermit.txt")
        with animation_script_cleanup():
            assert has_animation_script("has_kermit")
            free_animation_script(test_script)
            assert not has_animation_script("has_kermit")
            
    def test_load_animation_script_integration():
        test_script = load_animation_script("test_animation_name", "kermit.txt")
        with animation_script_cleanup():
            assert test_script is not None
            script_name = animation_script_name(test_script)
            assert "test_animation_name" == script_name
            free_animation_script(test_script)
            script_exists = has_animation_script("test_animation_name")
            assert not script_exists
            
    def test_restart_animation_integration():
        test_script = load_animation_script("kermit", "kermit.txt")
        with animation_script_cleanup():
            test_animation = create_animation(test_script, "moonwalkback")
            with animation_cleanup(test_animation):
                for _ in range(50):
                    update_animation_percent(test_animation, 100.0)
                    
                    anim_ended = animation_ended(test_animation)
                    assert anim_ended
                    restart_animation(test_animation)
                    anim_ended_after_restart = animation_ended(test_animation)
                    assert not anim_ended_after_restart
                    
    def test_restart_animation_with_sound_integration():
        test_script = load_animation_script("kermit", "kermit.txt")
        with animation_script_cleanup():
            test_animation = create_animation_with_sound(test_script, "moonwalkback", true)
            with animation_cleanup(test_animation):
                update_animation(test_animation)
                restart_animation_with_sound(test_animation, true)
                assert 3 == animation_current_cell(test_animation)
                
    def test_update_animation_percent_with_sound_integration():
        test_script = load_animation_script("kermit", "kermit.txt")
        with animation_script_cleanup():
            test_animation = create_animation(test_script, "moonwalkback")
            with animation_cleanup(test_animation):
                update_animation_percent_with_sound(test_animation, 0.5, true)
                assert animation_frame_time(test_animation) > 0.0
                
    def test_update_animation_integration():
        test_script = load_animation_script("kermit", "kermit.txt")
        with animation_script_cleanup():
            test_animation = create_animation(test_script, "moonwalkback")
            with animation_cleanup(test_animation):
                update_animation(test_animation)
                assert 0 != animation_current_cell(test_animation)
                
    def test_update_animation_percent_integration():
        test_script = load_animation_script("kermit", "kermit.txt")
        with animation_script_cleanup():
            test_animation = create_animation(test_script, "walkfront")
            with animation_cleanup(test_animation):
                update_animation_percent(test_animation, 0.5)
                assert animation_frame_time(test_animation) > 0.0
                
