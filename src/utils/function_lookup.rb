# frozen_string_literal: true

# Module for looking up tests and functions by their unique names
module FunctionLookup

  TODO_FUNCTIONS = [
    'simulate_key_press',
    'simulate_mouse_click',
    'simulate_key_release',
    'simulate_mouse_press',
    'simulate_mouse_release',
    'simulate_mouse_wheel_scroll',
    'simulate_mouse_move',
    'simulate_mouse_down',
    'simulate_mouse_up',
    'delete_file',
    'simulate_sprite_event',
    '_on_key_down',
    '_on_key_typed',
    '_on_key_up',
    'free_notifier',
    '_test_sprite_function',
    '_on_sprite_event',
    'sprite_event_occurred',
    'sprite_layer_visible',
    '_on_sprite_event_called',
    'todo',
    'size'
  ]

  # Determines the function name based on the step and configuration
  def self.determine_function_name(step, functions, config)
    if TODO_FUNCTIONS.include?(step[:function_name])
      step[:function_name]
    else
      config[:supports_overloading] ? get_function_by_unique_global_name(step[:function_name], functions).name : step[:function_name]
    end
  end

  # Retrieves a test with a given function name
  def self.get_test_by_function_name(function, group_tests)
    tests = group_tests[function.group]
    tests.find { |test| test[:name] == function.unique_global_name }
  end

  # Finds a function by its unique global name
  def self.get_function_by_unique_global_name(unique_global_name, functions)
    function = functions.find { |func| func.unique_global_name == unique_global_name.downcase }
    if function.nil?
      puts "Warning: Function with unique global name '#{unique_global_name}' not found"
    else
      function
    end
  end
end
