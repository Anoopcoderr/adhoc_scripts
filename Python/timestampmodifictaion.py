from datetime import datetime, timedelta

def modify_date(original_date_str, days_to_add=1):
    # Convert the original date string to a datetime object
    original_date = datetime.strptime(original_date_str, "%Y-%m-%d %H:%M:%S")

    # Add days_to_add to the original date
    modified_date = original_date + timedelta(days=days_to_add)

    # Convert the modified date back to a string in the original format
    modified_date_str = modified_date.strftime("%Y-%m-%d %H:%M:%S")

    return modified_date_str

# Example usage
original_date_str = "2024-01-07 12:34:56"
modified_date_str = modify_date(original_date_str)

print(f"Original Date: {original_date_str}")
print(f"Modified Date: {modified_date_str}")
