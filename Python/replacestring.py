def replace_string_in_file(file_path, old_string, new_string):
    try:
        # Read the content of the file
        with open(file_path, 'r') as file:
            content = file.read()

        # Replace the old string with the new string
        modified_content = content.replace(old_string, new_string)

        # Write the modified content back to the file
        with open(file_path, 'w') as file:
            file.write(modified_content)

        print(f"String replacement in {file_path} successful.")

    except Exception as e:
        print(f"Error: {e}")

# Example usage
file_path = 'example.txt'  # Replace with your file path
old_string = 'replace_me'
new_string = 'new_value'

replace_string_in_file(file_path, old_string, new_string)
