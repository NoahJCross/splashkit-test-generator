import json

def swap_assertion_values(data):
    if isinstance(data, dict):
        if (data.get("step_type") == "assertion" and 
            data.get("compare", {}).get("compare_type") == "not_equal"):
            # Get the compare object
            compare = data["compare"]
            # Swap value1 and value2
            compare["value1"], compare["value2"] = compare["value2"], compare["value1"]
        
        # Recursively process all dictionary values
        for key, value in data.items():
            data[key] = swap_assertion_values(value)
            
    elif isinstance(data, list):
        # Recursively process all list items
        return [swap_assertion_values(item) for item in data]
        
    return data

def process_file(input_path, output_path):
    # Read the input file
    with open(input_path, 'r') as f:
        data = json.load(f)
    
    # Process the data
    modified_data = swap_assertion_values(data)
    
    # Write the modified data back to a file
    with open(output_path, 'w') as f:
        json.dump(modified_data, f, indent=2)

# Usage
input_file = "windows.json"
output_file = "windows.json"
process_file(input_file, output_file)