use splashkit::*;
#[cfg(test)]
mod test_runner {
    pub fn run_tests_sequential(tests: &[&dyn Fn()]) {
        for test in tests {
            test();
        }
    }
}
#![test_runner(test_runner::run_tests_sequential)]
#[test]
fn test_create_json_integration() {
    let test_json = create_json();
    assert!(test_json.is_some());
    free_json(test_json);
}
#[test]
fn test_create_json_from_string_integration() {
    let test_json = create_json_from_string("{\"name\":\"John\",\"age\":30,\"city\":\"New York\"}");
    assert!(json_has_key(test_json, "name"));
    assert_eq!(json_read_string(test_json, "name"), "John");
    free_json(test_json);
}
#[test]
fn test_free_all_json_integration() {
    let test_json1 = create_json();
    let test_json2 = create_json();
    let count1 = json_count_keys(test_json1);
    let count2 = json_count_keys(test_json2);
    assert!(count1 > 0);
    assert!(count2 > 0);
    free_all_json();
    let count1_after_free = json_count_keys(test_json1);
    let count2_after_free = json_count_keys(test_json2);
    assert_eq!(count1_after_free, 0);
    assert_eq!(count2_after_free, 0);
}
#[test]
fn test_free_json_integration() {
    let test_json = create_json();
    json_set_string(test_json, "key", "value");
    free_json(test_json);
    assert!(!json_has_key(test_json, "key"));
}
#[test]
fn test_json_count_keys_integration() {
    let test_json = create_json();
    json_set_string(test_json, "key1", "value1");
    json_set_number_integer(test_json, "key2", 42);
    let key_count = json_count_keys(test_json);
    assert_eq!(key_count, 2);
    free_json(test_json);
}
#[test]
fn test_json_from_color_integration() {
    let test_color = color_bright_green();
    let test_json = json_from_color(test_color);
    assert!(json_has_key(test_json, "color"));
    assert_eq!(json_read_string(test_json, "color"), "#00ff00ff");
    free_json(test_json);
    free_all_json();
}
#[test]
fn test_json_from_file_integration() {
    let test_json = json_from_file("test.json");
    assert!(test_json.is_some());
    let test_value = json_read_string(test_json, "key");
    assert_eq!(test_value, "expected_value");
    free_json(test_json);
}
#[test]
fn test_json_from_string_integration() {
    let test_json = json_from_string("{\"name\":\"John\",\"age\":30,\"city\":\"New York\"}");
    assert_eq!(json_read_string(test_json, "name"), "John");
    assert_eq!(json_read_number_as_int(test_json, "age"), 30);
    assert_eq!(json_read_string(test_json, "city"), "New York");
    free_json(test_json);
}
#[test]
fn test_json_has_key_integration() {
    let test_json = create_json();
    json_set_string(test_json, "key1", "value1");
    assert!(json_has_key(test_json, "key1"));
    assert!(!json_has_key(test_json, "key2"));
    free_json(test_json);
}
#[test]
fn test_json_read_array_of_double_integration() {
    let test_json = create_json();
    json_set_array_of_double(test_json, "numbers", [1.1, 2.2, 3.3]);
    json_read_array_of_double(test_json, "numbers", {:value_type=>"list", :value=>[]});
    assert_eq!({:value_type=>"array_access", :array_name=>"out_result", :index=>0}, 3);
    assert_eq!({:value_type=>"array_access", :array_name=>"out_result", :index=>1}, 2.2);
    free_json(test_json);
    free_all_json();
}
#[test]
fn test_json_read_array_of_json_integration() {
    let test_json = create_json();
    let test_json_nested1 = create_json();
    let test_json_nested2 = create_json();
    json_set_string(test_json_nested1, "key1", "value1");
    json_set_string(test_json_nested2, "key2", "value2");
    json_set_array_of_json(test_json, "array_key", {:value_type=>"vector", :value=>[{:value_type=>"variable", :variable_name=>"test_json_nested1"}, {:value_type=>"variable", :variable_name=>"test_json_nested2"}]});
    json_read_array_of_json(test_json, "array_key", {:value_type=>"vector", :variable_name=>[]});
    assert_eq!(out_result, 2);
    free_json(test_json);
    free_json(test_json_nested1);
    free_json(test_json_nested2);
    free_all_json();
}
#[test]
fn test_json_read_array_of_string_integration() {
    let test_json = create_json();
    json_set_array_of_string(test_json, "test_array", ["item1", "item2", "item3"]);
    json_read_array_of_string(test_json, "test_array", out_result);
    assert_eq!(size, 3);
    assert_eq!(index_of_json0, "item1");
    free_json(test_json);
}
#[test]
fn test_json_read_array_of_bool_integration() {
    let test_json = create_json();
    json_set_array_of_bool(test_json, "test_key", "[true, false, true]");
    json_read_array_of_bool(test_json, "test_key", out_result);
    assert_eq!(size, 3);
    assert_eq!(index_of_json0, 0);
    assert_ne!(index_of_json1, 1);
    assert_eq!(index_of_json2, 2);
    free_json(test_json);
}
#[test]
fn test_json_read_bool_integration() {
    let test_json = create_json();
    json_set_bool(test_json, "test_key", true);
    assert!(json_read_bool(test_json, "test_key"));
    json_set_bool(test_json, "test_key", false);
    assert!(!json_read_bool(test_json, "test_key"));
    free_json(test_json);
}
#[test]
fn test_json_read_number_integration() {
    let test_json = create_json();
    json_set_number_float(test_json, "test_key", 42.5);
    let test_result = json_read_number(test_json, "test_key");
    assert_eq!(test_result, 42.5);
    free_json(test_json);
}
#[test]
fn test_json_read_number_as_double_integration() {
    let test_json = create_json();
    json_set_number_double(test_json, "test_key", 3.14);
    let test_result = json_read_number_as_double(test_json, "test_key");
    assert_eq!(test_result, 3.14);
    free_json(test_json);
}
#[test]
fn test_json_read_number_as_int_integration() {
    let test_json = create_json();
    json_set_number_integer(test_json, "test_key", 42);
    let test_result = json_read_number_as_int(test_json, "test_key");
    assert_eq!(test_result, 42);
    free_json(test_json);
}
#[test]
fn test_json_read_object_integration() {
    let test_json = create_json();
    json_set_object(test_json, "nestedObject", create_json());
    let read_json = json_read_object(test_json, "nestedObject");
    assert!(read_json.is_some());
    free_json(test_json);
    free_json(read_json);
}
#[test]
fn test_json_read_string_integration() {
    let test_json = create_json();
    json_set_string(test_json, "test_key", "test_value");
    let read_value = json_read_string(test_json, "test_key");
    assert_eq!(read_value, "test_value");
    free_json(test_json);
}
#[test]
fn test_json_set_array_of_string_integration() {
    let test_json = create_json();
    json_set_array_of_string(test_json, "test_key", ["value1", "value2", "value3"]);
    json_read_array_of_string(test_json, "test_key", {:value_type=>"list", :value=>[]});
    assert_eq!(test_result, 3);
    free_json(test_json);
}
#[test]
fn test_json_set_array_of_double_integration() {
    let test_json = create_json();
    json_set_array_of_double(test_json, "numbers", [1.1, 2.2, 3.3]);
    json_read_array_of_double(test_json, "numbers", {:value_type=>"list", :value=>[]});
    assert_eq!(read_numbers, [1.1, 2.2, 3.3]);
    free_json(test_json);
}
#[test]
fn test_json_set_array_of_bool_integration() {
    let test_json = create_json();
    json_set_array_of_bool(test_json, "test_key", "[true, false, true]");
    json_read_array_of_bool(test_json, "test_key", {:value_type=>"list", :value=>[]});
    assert_eq!(read_array, "[true, false, true]");
    free_json(test_json);
}
#[test]
fn test_json_set_array_of_json_integration() {
    let test_json = create_json();
    let test_json1 = create_json();
    let test_json2 = create_json();
    json_set_string(test_json1, "key1", "value1");
    json_set_string(test_json2, "key2", "value2");
    json_set_array_of_json(test_json, "array_key", [{:value_type=>"variable", :variable_name=>"test_json1"}, {:value_type=>"variable", :variable_name=>"test_json2"}]);
    assert_eq!(json_read_string(json_read_object(test_json, 0), "key1"), "value1");
    assert_eq!(json_read_string(json_read_object(read_array, 1), "key2"), "value2");
    free_json(test_json);
    free_json(test_json1);
    free_json(test_json2);
    free_all_json();
}
#[test]
fn test_json_set_bool_integration() {
    let test_json = create_json();
    json_set_bool(test_json, "test_key", true);
    assert!(json_has_key(test_json, "test_key"));
    assert!(json_read_bool(test_json, "test_key"));
    free_json(test_json);
}
#[test]
fn test_json_set_number_integer_integration() {
    let test_json = create_json();
    json_set_number_integer(test_json, "age", 30);
    assert_eq!(json_read_number_as_int(test_json, "age"), 30);
    free_json(test_json);
}
#[test]
fn test_json_set_number_double_integration() {
    let test_json = create_json();
    json_set_number_double(test_json, "test_key", 3.14);
    assert_eq!(json_read_number_as_double(test_json, "test_key"), 3.14);
    free_json(test_json);
}
#[test]
fn test_json_set_number_float_integration() {
    let test_json = create_json();
    json_set_number_float(test_json, "test_key", 3.14);
    assert_eq!(json_read_number(test_json, "test_key"), 3.14);
    free_json(test_json);
}
#[test]
fn test_json_set_object_integration() {
    let test_json = create_json();
    let test_nested_json = create_json();
    json_set_object(test_json, "nested", test_nested_json);
    assert!(json_has_key(test_json, "nested"));
    free_json(test_json);
    free_json(test_nested_json);
    free_all_json();
}
#[test]
fn test_json_set_string_integration() {
    let test_json = create_json();
    json_set_string(test_json, "test_key", "test_value");
    assert_eq!(json_read_string(test_json, "test_key"), "test_value");
    free_json(test_json);
}
#[test]
fn test_json_to_color_integration() {
    let test_json = create_json();
    json_set_string(test_json, "color", "#FF0000FF");
    let test_color = json_to_color(test_json);
    assert_eq!(color_to_string(test_color), "#FF0000FF");
    free_json(test_json);
}
#[test]
fn test_json_to_file_integration() {
    let test_json = create_json();
    json_set_string(test_json, "testKey", "testValue");
    json_to_file(test_json, "test.json");
    let loaded_json = json_from_file("test.json");
    assert_eq!(json_read_string(loaded_json, "testKey"), "testValue");
    free_json(test_json);
    free_json(loaded_json);
}
#[test]
fn test_json_to_string_integration() {
    let test_json = create_json();
    json_set_string(test_json, "key", "value");
    let test_json_string = json_to_string(test_json);
    assert_ne!(test_json_string, "");
    free_json(test_json);
}
