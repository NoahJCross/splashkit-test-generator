use std::*;
use splashkit::*;
#[cfg(test)]
mod test_json {
use super::*;
#[test]
fn test_create_json_integration() {
    let test_json = create_json();
    assert!(!test_json.is_null());
    free_json(test_json);
}
#[test]
fn test_create_json_from_string_integration() {
    let test_json = create_json_from_string("{\"name\":\"John\",\"age\":30,\"city\":\"New York\"}".to_string());
    assert!(json_has_key(test_json, "name".to_string()));
    assert_eq!("John".to_string(), json_read_string(test_json, "name".to_string()));
    free_json(test_json);
}
#[test]
fn test_free_all_json_integration() {
    let test_json1 = create_json();
    let test_json2 = create_json();
    let count1 = json_count_keys(test_json1);
    json_set_string(test_json1, "key".to_string(), "value".to_string());
    json_set_string(test_json2, "key".to_string(), "value".to_string());
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
    json_set_string(test_json, "key".to_string(), "value".to_string());
    free_json(test_json);
    assert!(!json_has_key(test_json, "key".to_string()));
}
#[test]
fn test_json_count_keys_integration() {
    let test_json = create_json();
    json_set_string(test_json, "key1".to_string(), "value1".to_string());
    json_set_number_integer(test_json, "key2".to_string(), 42);
    let key_count = json_count_keys(test_json);
    assert_eq!(2, key_count);
    free_json(test_json);
}
#[test]
fn test_json_from_color_integration() {
    let test_color = color_bright_green();
    let test_json = json_from_color(test_color);
    assert!(json_has_key(test_json, "color".to_string()));
    assert_eq!("#00ff00ff".to_string(), json_read_string(test_json, "color".to_string()));
    free_json(test_json);
    free_all_json();
}
#[test]
fn test_json_from_file_integration() {
    let test_json = json_from_file("person.json".to_string());
    assert!(!test_json.is_null());
    let test_value = json_read_string(test_json, "firstName".to_string());
    assert_eq!("John".to_string(), test_value);
    free_json(test_json);
}
#[test]
fn test_json_from_string_integration() {
    let test_json = json_from_string("{\"name\":\"John\",\"age\":30,\"city\":\"New York\"}".to_string());
    assert_eq!("John".to_string(), json_read_string(test_json, "name".to_string()));
    assert_eq!(30, json_read_number_as_int(test_json, "age".to_string()));
    assert_eq!("New York".to_string(), json_read_string(test_json, "city".to_string()));
    free_json(test_json);
}
#[test]
fn test_json_has_key_integration() {
    let test_json = create_json();
    json_set_string(test_json, "key1".to_string(), "value1".to_string());
    assert!(json_has_key(test_json, "key1".to_string()));
    assert!(!json_has_key(test_json, "key2".to_string()));
    free_json(test_json);
}
#[test]
fn test_json_read_array_of_double_integration() {
    let test_json = create_json();
    json_set_array_of_double(test_json, "numbers".to_string(), vec![1.1, 2.2, 3.3]);
    let mut out_result = vec![];
    json_read_array_of_double(test_json, "numbers".to_string(), &mut out_result);
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
    json_set_string(test_json1, "key1".to_string(), "value1".to_string());
    json_set_string(test_json2, "key2".to_string(), "value2".to_string());
    let test_json_array = vec![test_json1, test_json2];
    json_set_array_of_json(test_json, "array_key".to_string(), test_json_array);
    let mut out_result = vec![];
    json_read_array_of_json(test_json, "array_key".to_string(), &mut out_result);
    assert_eq!(2, out_result.len());
    free_json(test_json);
    free_json(test_json1);
    free_json(test_json2);
    free_all_json();
}
#[test]
fn test_json_read_array_of_string_integration() {
    let test_json = create_json();
    json_set_array_of_string(test_json, "test_array".to_string(), vec!["item1".to_string(), "item2".to_string(), "item3".to_string()]);
    let mut out_result = vec![];
    json_read_array_of_string(test_json, "test_array".to_string(), &mut out_result);
    assert_eq!(3, out_result.len());
    assert_eq!("item1".to_string(), out_result[0]);
    free_json(test_json);
}
#[test]
fn test_json_read_array_of_bool_integration() {
    let test_json = create_json();
    json_set_array_of_bool(test_json, "test_key".to_string(), vec![true, false, true]);
    let mut out_result = vec![];
    json_read_array_of_bool(test_json, "test_key".to_string(), &mut out_result);
    assert_eq!(3, out_result.len());
    assert!(out_result[0]);
    assert!(!out_result[1]);
    free_json(test_json);
}
#[test]
fn test_json_read_bool_integration() {
    let test_json = create_json();
    json_set_bool(test_json, "test_key".to_string(), true);
    assert!(json_read_bool(test_json, "test_key".to_string()));
    json_set_bool(test_json, "test_key".to_string(), false);
    assert!(!json_read_bool(test_json, "test_key".to_string()));
    free_json(test_json);
}
#[test]
fn test_json_read_number_integration() {
    let test_json = create_json();
    json_set_number_float(test_json, "test_key".to_string(), 42.5 as f32);
    let test_result = json_read_number(test_json, "test_key".to_string());
    assert_eq!(42.5, test_result);
    free_json(test_json);
}
#[test]
fn test_json_read_number_as_double_integration() {
    let test_json = create_json();
    json_set_number_double(test_json, "test_key".to_string(), 3.14);
    let test_result = json_read_number_as_double(test_json, "test_key".to_string());
    assert_eq!(3.14, test_result);
    free_json(test_json);
}
#[test]
fn test_json_read_number_as_int_integration() {
    let test_json = create_json();
    json_set_number_integer(test_json, "test_key".to_string(), 42);
    let test_result = json_read_number_as_int(test_json, "test_key".to_string());
    assert_eq!(42, test_result);
    free_json(test_json);
}
#[test]
fn test_json_read_object_integration() {
    let test_json = create_json();
    json_set_object(test_json, "nestedObject".to_string(), create_json());
    let read_json = json_read_object(test_json, "nestedObject".to_string());
    assert!(!read_json.is_null());
    free_json(test_json);
    free_json(read_json);
}
#[test]
fn test_json_read_string_integration() {
    let test_json = create_json();
    json_set_string(test_json, "test_key".to_string(), "test_value".to_string());
    let read_value = json_read_string(test_json, "test_key".to_string());
    assert_eq!("test_value".to_string(), read_value);
    free_json(test_json);
}
#[test]
fn test_json_set_array_of_string_integration() {
    let test_json = create_json();
    json_set_array_of_string(test_json, "test_key".to_string(), vec!["value1".to_string(), "value2".to_string(), "value3".to_string()]);
    let mut out_result = vec![];
    json_read_array_of_string(test_json, "test_key".to_string(), &mut out_result);
    assert_eq!(vec!["value1".to_string(), "value2".to_string(), "value3".to_string()], out_result);
    free_json(test_json);
}
#[test]
fn test_json_set_array_of_double_integration() {
    let test_json = create_json();
    json_set_array_of_double(test_json, "numbers".to_string(), vec![1.1, 2.2, 3.3]);
    let mut out_result = vec![];
    json_read_array_of_double(test_json, "numbers".to_string(), &mut out_result);
    assert_eq!(vec![1.1, 2.2, 3.3], out_result);
    free_json(test_json);
}
#[test]
fn test_json_set_array_of_bool_integration() {
    let test_json = create_json();
    json_set_array_of_bool(test_json, "test_key".to_string(), vec![true, false]);
    let mut out_result = vec![];
    json_read_array_of_bool(test_json, "test_key".to_string(), &mut out_result);
    assert_eq!(vec![true, false], out_result);
    free_json(test_json);
}
#[test]
fn test_json_set_array_of_json_integration() {
    let test_json = create_json();
    let test_json1 = create_json();
    let test_json2 = create_json();
    json_set_string(test_json1, "key1".to_string(), "value1".to_string());
    json_set_string(test_json2, "key2".to_string(), "value2".to_string());
    let test_json_array = vec![test_json1, test_json2];
    json_set_array_of_json(test_json, "array_key".to_string(), test_json_array);
    let mut out_result = vec![];
    json_read_array_of_json(test_json, "array_key".to_string(), &mut out_result);
    assert_eq!("value1".to_string(), json_read_string(out_result[0], "key1".to_string()));
    assert_eq!("value2".to_string(), json_read_string(out_result[1], "key2".to_string()));
    free_all_json();
}
#[test]
fn test_json_set_bool_integration() {
    let test_json = create_json();
    json_set_bool(test_json, "test_key".to_string(), true);
    assert!(json_has_key(test_json, "test_key".to_string()));
    assert!(json_read_bool(test_json, "test_key".to_string()));
    free_json(test_json);
}
#[test]
fn test_json_set_number_integer_integration() {
    let test_json = create_json();
    json_set_number_integer(test_json, "age".to_string(), 30);
    assert_eq!(30, json_read_number_as_int(test_json, "age".to_string()));
    free_json(test_json);
}
#[test]
fn test_json_set_number_double_integration() {
    let test_json = create_json();
    json_set_number_double(test_json, "test_key".to_string(), 3.14);
    assert_eq!(3.14, json_read_number_as_double(test_json, "test_key".to_string()));
    free_json(test_json);
}
#[test]
fn test_json_set_number_float_integration() {
    let test_json = create_json();
    json_set_number_float(test_json, "test_key".to_string(), 3.14 as f32);
    assert_eq!(3.140000104904175, json_read_number(test_json, "test_key".to_string()));
    free_json(test_json);
}
#[test]
fn test_json_set_object_integration() {
    let test_json = create_json();
    let test_nested_json = create_json();
    json_set_object(test_json, "nested".to_string(), test_nested_json);
    assert!(json_has_key(test_json, "nested".to_string()));
    free_json(test_json);
    free_json(test_nested_json);
    free_all_json();
}
#[test]
fn test_json_set_string_integration() {
    let test_json = create_json();
    json_set_string(test_json, "test_key".to_string(), "test_value".to_string());
    assert_eq!("test_value".to_string(), json_read_string(test_json, "test_key".to_string()));
    free_json(test_json);
}
#[test]
fn test_json_to_color_integration() {
    let test_json = create_json();
    json_set_string(test_json, "color".to_string(), "#ff0000ff".to_string());
    let test_color = json_to_color(test_json);
    assert_eq!("#ff0000ff".to_string(), color_to_string(test_color));
    free_json(test_json);
}
#[test]
fn test_json_to_file_integration() {
    let test_json = create_json();
    json_set_string(test_json, "testKey".to_string(), "testValue".to_string());
    json_to_file(test_json, "test.json".to_string());
    let loaded_json = json_from_file("test.json".to_string());
    assert_eq!("testValue".to_string(), json_read_string(loaded_json, "testKey".to_string()));
    free_json(test_json);
    free_json(loaded_json);
}
#[test]
fn test_json_to_string_integration() {
    let test_json = create_json();
    json_set_string(test_json, "key".to_string(), "value".to_string());
    let test_json_string = json_to_string(test_json);
    assert_ne!("".to_string(), test_json_string);
    free_json(test_json);
}
}
