import pytest
from splashkit import *
from ..helpers import *
import contextlib
class TestAnimations:
    def setup_method(self):
        set_resources_path("/mnt/c/Users/Noahc/Documents/aYear_2_semester_2/TeamProject/GitHubRepo/splashkit_test_generator/resources")

    def test_animation_count_integration():
        test_script = load_animation_script("Test Script 1", "kermit.txt")
        with animation_script_cleanup():
            assert animation_count(test_script) > 0
            
    def test_animation_current_cell_integration():
        test_script = load_animation_script("Test Script 2", "kermit.txt")
        with animation_script_cleanup():
            test_animation = create_animation(test_script, "moonwalkback")
            with animation_cleanup(test_animation):
                assert animation_current_cell(test_animation) > -1
                
    def test_animation_current_vector_integration():
        test_script = load_animation_script("Test Script 3", "kermit.txt")
        with animation_script_cleanup():
            test_animation = create_animation(test_script, "moonwalkback")
            with animation_cleanup(test_animation):
                current_vector = animation_current_vector(test_animation)
                assert 0.0 == current_vector.x
                assert 0.0 == current_vector.y
                
    def test_animation_ended_integration():
        test_script = load_animation_script("Test Script 4", "kermit.txt")
        with animation_script_cleanup():
            test_animation = create_animation(test_script, "moonwalkback")
            with animation_cleanup(test_animation):
                assert not animation_ended(test_animation)
                for _ in range(50):
                    update_animation_percent(test_animation, 100.0)
                    
                    assert animation_ended(test_animation)
                    
    def test_animation_entered_frame_integration():
        test_script = load_animation_script("Test Script 5", "kermit.txt")
        with animation_script_cleanup():
            test_animation = create_animation(test_script, "walkfront")
            with animation_cleanup(test_animation):
                update_animation_percent(test_animation, 20.0)
                assert animation_entered_frame(test_animation)
                update_animation(test_animation)
                assert not animation_entered_frame(test_animation)
                
    def test_animation_frame_time_integration():
        test_script = load_animation_script("Test Script 6", "kermit.txt")
        with animation_script_cleanup():
            test_animation = create_animation(test_script, "walkfront")
            with animation_cleanup(test_animation):
                update_animation(test_animation)
                frame_time = animation_frame_time(test_animation)
                assert frame_time > 0.0
                
    def test_animation_index_integration():
        test_script = load_animation_script("Test Script 7", "kermit.txt")
        with animation_script_cleanup():
            assert animation_index(test_script, "walkfront") > -1
            assert -1 == animation_index(test_script, "NonExistentAnimation")
            
    def test_animation_name_integration():
        test_script = load_animation_script("Test Script 8", "kermit.txt")
        with animation_script_cleanup():
            test_animation = create_animation(test_script, "moonwalkback")
            with animation_cleanup(test_animation):
                anim_name = animation_name(test_animation)
                assert "moonwalkback" == anim_name
                
    def test_animation_script_name_integration():
        test_script = load_animation_script("Test Script 9", "kermit.txt")
        with animation_script_cleanup():
            assert "Test Script 9" == animation_script_name(test_script)
            
    def test_animation_script_named_integration():
        test_script = load_animation_script("Test Script 10", "kermit.txt")
        with animation_script_cleanup():
            animation_script_named("Test Script 10")
            assert test_script is not None
            assert test_script == test_script
            
    def test_assign_animation_with_script_integration():
        test_script = load_animation_script("Test Script 11", "kermit.txt")
        with animation_script_cleanup():
            test_animation = create_animation(test_script, "moonwalkback")
            with animation_cleanup(test_animation):
                assign_animation_with_script(test_animation, test_script, "walkfront")
                assert "walkfront" == animation_name(test_animation)
                
    def test_assign_animation_with_script_and_sound_integration():
        test_script = load_animation_script("Test Script 12", "kermit.txt")
        with animation_script_cleanup():
            test_animation = create_animation(test_script, "walkfront")
            with animation_cleanup(test_animation):
                assign_animation_with_script_and_sound(test_animation, test_script, "walkleft", true)
                assert "walkleft" == animation_name(test_animation)
                
    def test_assign_animation_index_with_script_integration():
        test_script = load_animation_script("Test Script 13", "kermit.txt")
        with animation_script_cleanup():
            test_animation = create_animation(test_script, "moonwalkback")
            with animation_cleanup(test_animation):
                assign_animation_index_with_script(test_animation, test_script, 0)
                assert "walkfront" == animation_name(test_animation)
                
    def test_assign_animation_index_with_script_and_sound_integration():
        test_script = load_animation_script("Test Script 14", "kermit.txt")
        with animation_script_cleanup():
            test_animation = create_animation(test_script, "moonwalkback")
            with animation_cleanup(test_animation):
                assign_animation_index_with_script_and_sound(test_animation, test_script, 0, true)
                assert "walkfront" == animation_name(test_animation)
                
    def test_assign_animation_with_script_named_integration():
        test_script = load_animation_script("Test Script 15", "kermit.txt")
        with animation_script_cleanup():
            test_animation = create_animation(test_script, "moonwalkback")
            with animation_cleanup(test_animation):
                assign_animation_with_script_named(test_animation, "Test Script 15", "walkfront")
                assert "walkfront" == animation_name(test_animation)
                
    def test_assign_animation_with_script_named_and_sound_integration():
        test_script = load_animation_script("Test Script 16", "kermit.txt")
        with animation_script_cleanup():
            test_animation = create_animation(test_script, "walkfront")
            with animation_cleanup(test_animation):
                assign_animation_with_script_named_and_sound(test_animation, "Test Script 16", "walkfront", true)
                assert "walkfront" == animation_name(test_animation)
                
    def test_assign_animation_index_integration():
        test_script = load_animation_script("Test Script 17", "kermit.txt")
        with animation_script_cleanup():
            test_animation = create_animation(test_script, "moonwalkback")
            with animation_cleanup(test_animation):
                assign_animation_index(test_animation, 0)
                assert 0 == animation_current_cell(test_animation)
                
    def test_assign_animation_index_with_sound_integration():
        test_script = load_animation_script("Test Script 18", "kermit.txt")
        with animation_script_cleanup():
            test_animation = create_animation_with_sound(test_script, "moonwalkback", false)
            with animation_cleanup(test_animation):
                assign_animation_index_with_sound(test_animation, 0, true)
                assert animation_entered_frame(test_animation)
                
    def test_assign_animation_integration():
        test_script = load_animation_script("Test Script 19", "kermit.txt")
        with animation_script_cleanup():
            test_animation = create_animation(test_script, "moonwalkback")
            with animation_cleanup(test_animation):
                assign_animation(test_animation, "walkfront")
                assert "walkfront" == animation_name(test_animation)
                
    def test_assign_animation_with_sound_integration():
        test_script = load_animation_script("Test Script 20", "kermit.txt")
        with animation_script_cleanup():
            test_animation = create_animation(test_script, "moonwalkback")
            with animation_cleanup(test_animation):
                assign_animation_with_sound(test_animation, "walkfront", true)
                assert "walkfront" == animation_name(test_animation)
                
    def test_create_animation_from_index_with_sound_integration():
        test_script = load_animation_script("Test Script 21", "kermit.txt")
        with animation_script_cleanup():
            test_animation = create_animation_from_index_with_sound(test_script, 0, true)
            with animation_cleanup(test_animation):
                assert test_animation is not None
                assert "walkfront" == animation_name(test_animation)
                
    def test_create_animation_integration():
        test_script = load_animation_script("Test Script 22", "kermit.txt")
        with animation_script_cleanup():
            test_animation = create_animation(test_script, "moonwalkback")
            with animation_cleanup(test_animation):
                assert test_animation is not None
                assert "moonwalkback" == animation_name(test_animation)
                
    def test_create_animation_with_sound_integration():
        test_script = load_animation_script("Test Script 23", "kermit.txt")
        with animation_script_cleanup():
            test_animation = create_animation_with_sound(test_script, "moonwalkback", true)
            with animation_cleanup(test_animation):
                assert test_animation is not None
                assert "moonwalkback" == animation_name(test_animation)
                
    def test_create_animation_from_script_named_integration():
        load_animation_script("Test Script 24", "kermit.txt")
        with animation_script_cleanup():
            test_animation = create_animation_from_script_named("Test Script 24", "moonwalkback")
            with animation_cleanup(test_animation):
                assert test_animation is not None
                assert "moonwalkback" == animation_name(test_animation)
                
    def test_create_animation_from_script_named_with_sound_integration():
        load_animation_script("Test Script 25", "kermit.txt")
        with animation_script_cleanup():
            test_animation = create_animation_from_script_named_with_sound("Test Script 25", "moonwalkback", true)
            with animation_cleanup(test_animation):
                assert test_animation is not None
                assert "moonwalkback" == animation_name(test_animation)
                
    def test_free_all_animation_scripts_integration():
        load_animation_script("Test Script 26", "kermit.txt")
        with animation_script_cleanup():
            load_animation_script("Test Script 27", "kermit.txt")
            assert has_animation_script("Test Script 26")
            assert has_animation_script("Test Script 27")
            free_all_animation_scripts()
            assert not has_animation_script("Test Script 26")
            assert not has_animation_script("Test Script 27")
            
    def test_free_animation_integration():
        test_script = load_animation_script("Test Script 28", "kermit.txt")
        with animation_script_cleanup():
            test_animation = create_animation(test_script, "moonwalkback")
            with animation_cleanup(test_animation):
                free_animation(test_animation)
                assert "" == animation_name(test_animation)
                assert animation_ended(test_animation)
                
    def test_free_animation_script_integration():
        test_script = load_animation_script("Test Script 29", "kermit.txt")
        with animation_script_cleanup():
            assert test_script is not None
            free_animation_script(test_script)
            assert not has_animation_script("Test Script 29")
            
    def test_free_animation_script_with_name_integration():
        load_animation_script("Test Script 30", "kermit.txt")
        with animation_script_cleanup():
            assert has_animation_script("Test Script 30")
            free_animation_script_with_name("Test Script 30")
            assert not has_animation_script("Test Script 30")
            
    def test_has_animation_named_integration():
        test_script = load_animation_script("Test Script 31", "kermit.txt")
        with animation_script_cleanup():
            assert has_animation_named(test_script, "walkfront")
            assert not has_animation_named(test_script, "NonExistentAnimation")
            
    def test_has_animation_script_integration():
        test_script = load_animation_script("Test Script 32", "kermit.txt")
        with animation_script_cleanup():
            assert has_animation_script("Test Script 32")
            free_animation_script(test_script)
            assert not has_animation_script("Test Script 32")
            
    def test_load_animation_script_integration():
        test_script = load_animation_script("Test Script 33", "kermit.txt")
        with animation_script_cleanup():
            assert test_script is not None
            script_name = animation_script_name(test_script)
            assert "Test Script 33" == script_name
            free_animation_script(test_script)
            assert not has_animation_script("Test Script 33")
            
    def test_restart_animation_integration():
        test_script = load_animation_script("Test Script 34", "kermit.txt")
        with animation_script_cleanup():
            test_animation = create_animation(test_script, "moonwalkback")
            with animation_cleanup(test_animation):
                for _ in range(50):
                    update_animation_percent(test_animation, 100.0)
                    
                    anim_ended = animation_ended(test_animation)
                    assert anim_ended
                    restart_animation(test_animation)
                    assert not animation_ended(test_animation)
                    
    def test_restart_animation_with_sound_integration():
        test_script = load_animation_script("Test Script 35", "kermit.txt")
        with animation_script_cleanup():
            test_animation = create_animation_with_sound(test_script, "moonwalkback", true)
            with animation_cleanup(test_animation):
                update_animation(test_animation)
                restart_animation_with_sound(test_animation, true)
                assert 3 == animation_current_cell(test_animation)
                
    def test_update_animation_percent_with_sound_integration():
        test_script = load_animation_script("Test Script 36", "kermit.txt")
        with animation_script_cleanup():
            test_animation = create_animation(test_script, "moonwalkback")
            with animation_cleanup(test_animation):
                update_animation_percent_with_sound(test_animation, 0.5, true)
                assert animation_frame_time(test_animation) > 0.0
                
    def test_update_animation_integration():
        test_script = load_animation_script("Test Script 37", "kermit.txt")
        with animation_script_cleanup():
            test_animation = create_animation(test_script, "moonwalkback")
            with animation_cleanup(test_animation):
                update_animation(test_animation)
                assert 0 != animation_current_cell(test_animation)
                
    def test_update_animation_percent_integration():
        test_script = load_animation_script("Test Script 38", "kermit.txt")
        with animation_script_cleanup():
            test_animation = create_animation(test_script, "walkfront")
            with animation_cleanup(test_animation):
                update_animation_percent(test_animation, 0.5)
                assert animation_frame_time(test_animation) > 0.0
                
