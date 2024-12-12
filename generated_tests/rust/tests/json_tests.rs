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
mod test_json {
use super::*;
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
    assert_eq!("John", json_read_string(test_json, "name"));
    free_json(test_json);
}
#[test]
fn test_free_all_json_integration() {
    let test_json1 = create_json();
    let test_json2 = create_json();
    let count1 = json_count_keys(test_json1);
    json_set_string(test_json1, "key", "value");
    json_set_string(test_json2, "key", "value");
    let count2 = json_count_keys(test_json2);
    assert!(count1 > 0);
    assert!(count2 > 0);
    free_all_json();
    let count1_after_free = json_count_keys(test_json1);
    let count2_after_free = json_count_keys(test_json2);
    assert_eq!(0, count1_after_free);
    assert_eq!(0, count2_after_free);
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
    assert_eq!(2, key_count);
    free_json(test_json);
}
#[test]
fn test_json_from_color_integration() {
    let test_color = color_bright_green();
    let test_json = json_from_color(test_color);
    assert!(json_has_key(test_json, "color"));
    assert_eq!("#00ff00ff", json_read_string(test_json, "color"));
    free_json(test_json);
    free_all_json();
}
#[test]
fn test_json_from_file_integration() {
    let test_json = json_from_file("person.json");
    assert!(test_json.is_some());
    let test_value = json_read_string(test_json, "firstName");
    assert_eq!("John", test_value);
    free_json(test_json);
}
#[test]
fn test_json_from_string_integration() {
    let test_json = json_from_string("{\"name\":\"John\",\"age\":30,\"city\":\"New York\"}");
    assert_eq!("John", json_read_string(test_json, "name"));
    assert_eq!(30, json_read_number_as_int(test_json, "age"));
    assert_eq!("New York", json_read_string(test_json, "city"));
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
    json_set_array_of_double(test_json, "numbers", vec![1.1, 2.2, 3.3]);
    let out_result = vec![];
    json_read_array_of_double(test_json, "numbers", &out_result);
    assert_eq!(1.1, out_result[0]);
    assert_eq!(2.2, out_result[1]);
    free_json(test_json);
    free_all_json();
}
#[test]
fn test_json_read_array_of_json_integration() {
    let test_json = create_json();
    let test_json1 = create_json();
    let test_json2 = create_json();
    json_set_string(test_json1, "key1", "value1");
    json_set_string(test_json2, "key2", "value2");
    let test_json_array = vec![test_json1, test_json2];
    json_set_array_of_json(test_json, "array_key", test_json_array);
    let out_result = vec![];
    json_read_array_of_json(test_json, "array_key", &out_result);
    assert_eq!(2, out_result.len());
    free_json(test_json);
    free_json(test_json1);
    free_json(test_json2);
    free_all_json();
}
#[test]
fn test_json_read_array_of_string_integration() {
    let test_json = create_json();
    json_set_array_of_string(test_json, "test_array", vec!["item1", "item2", "item3"]);
    let out_result = vec![];
    json_read_array_of_string(test_json, "test_array", &out_result);
    assert_eq!(3, out_result.len());
    assert_eq!("item1", out_result[0]);
    free_json(test_json);
}
#[test]
fn test_json_read_array_of_bool_integration() {
    let test_json = create_json();
    json_set_array_of_bool(test_json, "test_key", vec![true, false, true]);
    let out_result = vec![];
    json_read_array_of_bool(test_json, "test_key", &out_result);
    assert_eq!(3, out_result.len());
    assert!(out_result[0]);
    assert!(!out_result[1]);
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
    json_set_number_float(test_json, "test_key", 42.5 as f32);
    let test_result = json_read_number(test_json, "test_key");
    assert_eq!(42.5, test_result);
    free_json(test_json);
}
#[test]
fn test_json_read_number_as_double_integration() {
    let test_json = create_json();
    json_set_number_double(test_json, "test_key", 3.14);
    let test_result = json_read_number_as_double(test_json, "test_key");
    assert_eq!(3.14, test_result);
    free_json(test_json);
}
#[test]
fn test_json_read_number_as_int_integration() {
    let test_json = create_json();
    json_set_number_integer(test_json, "test_key", 42);
    let test_result = json_read_number_as_int(test_json, "test_key");
    assert_eq!(42, test_result);
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
    assert_eq!("test_value", read_value);
    free_json(test_json);
}
#[test]
fn test_json_set_array_of_string_integration() {
    let test_json = create_json();
    json_set_array_of_string(test_json, "test_key", vec!["value1", "value2", "value3"]);
    let out_result = vec![];
    json_read_array_of_string(test_json, "test_key", &out_result);
    assert_eq!(vec!["value1", "value2", "value3"], out_result);
    free_json(test_json);
}
#[test]
fn test_json_set_array_of_double_integration() {
    let test_json = create_json();
    json_set_array_of_double(test_json, "numbers", vec![1.1, 2.2, 3.3]);
    let out_result = vec![];
    json_read_array_of_double(test_json, "numbers", &out_result);
    assert_eq!(vec![1.1, 2.2, 3.3], out_result);
    free_json(test_json);
}
#[test]
fn test_json_set_array_of_bool_integration() {
    let test_json = create_json();
    json_set_array_of_bool(test_json, "test_key", vec![true, false]);
    let out_result = vec![];
    json_read_array_of_bool(test_json, "test_key", &out_result);
    assert_eq!(vec![true, false], out_result);
    free_json(test_json);
}
#[test]
fn test_json_set_array_of_json_integration() {
    let test_json = create_json();
    let test_json1 = create_json();
    let test_json2 = create_json();
    json_set_string(test_json1, "key1", "value1");
    json_set_string(test_json2, "key2", "value2");
    let test_json_array = vec![test_json1, test_json2];
    json_set_array_of_json(test_json, "array_key", test_json_array);
    let out_result = vec![];
    json_read_array_of_json(test_json, "array_key", &out_result);
    assert_eq!("value1", json_read_string(out_result[0], "key1"));
    assert_eq!("value2", json_read_string(out_result[1], "key2"));
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
    assert_eq!(30, json_read_number_as_int(test_json, "age"));
    free_json(test_json);
}
#[test]
fn test_json_set_number_double_integration() {
    let test_json = create_json();
    json_set_number_double(test_json, "test_key", 3.14);
    assert_eq!(3.14, json_read_number_as_double(test_json, "test_key"));
    free_json(test_json);
}
#[test]
fn test_json_set_number_float_integration() {
    let test_json = create_json();
    json_set_number_float(test_json, "test_key", 3.14 as f32);
    assert_eq!(3.140000104904175, json_read_number(test_json, "test_key"));
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
    assert_eq!("test_value", json_read_string(test_json, "test_key"));
    free_json(test_json);
}
#[test]
fn test_json_to_color_integration() {
    let test_json = create_json();
    json_set_string(test_json, "color", "#ff0000ff");
    let test_color = json_to_color(test_json);
    assert_eq!("#ff0000ff", color_to_string(test_color));
    free_json(test_json);
}
#[test]
fn test_json_to_file_integration() {
    let test_json = create_json();
    json_set_string(test_json, "testKey", "testValue");
    json_to_file(test_json, "test.json");
    let loaded_json = json_from_file("test.json");
    assert_eq!("testValue", json_read_string(loaded_json, "testKey"));
    free_json(test_json);
    free_json(loaded_json);
}
#[test]
fn test_json_to_string_integration() {
    let test_json = create_json();
    json_set_string(test_json, "key", "value");
    let test_json_string = json_to_string(test_json);
    assert_ne!("", test_json_string);
    free_json(test_json);
}
}
