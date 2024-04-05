#!/bin/bash

# Check if a time string is provided
if [ -z "$1" ]; then
    echo "Usage: $0 <time_string>"
    exit 1
fi

# Input time string
time_string="$1"

#trial
# List of time formats
formats=(
    "%Y-%m-%d %H:%M:%S"  # YYYY-MM-DD HH:MM:SS
    "%Y-%m-%d %I:%M:%S %p"  # YYYY-MM-DD HH:MM:SS AM/PM
    "%Y-%m-%d %H:%M:%S %Z"  # YYYY-MM-DD HH:MM:SS Timezone
    "%Y-%m-%dT%H:%M:%S%z"  # YYYY-MM-DDTHH:MM:SS Timezone
    "%Y-%m-%d"  # YYYY-MM-DD
    "%m/%d/%Y"  # MM/DD/YYYY
    "%d-%m-%Y"  # DD-MM-YYYY
    "%Y-%m-%d %H:%M"  # YYYY-MM-DD HH:MM
    "%Y-%m-%d %I:%M %p"  # YYYY-MM-DD HH:MM AM/PM
    "%H:%M:%S"  # HH:MM:SS
    "%I:%M:%S %p"  # HH:MM:SS AM/PM
    "%H:%M:%S %Z"  # HH:MM:SS Timezone
    "%H:%M"  # HH:MM
    "%I:%M %p"  # HH:MM AM/PM
)

# Convert and print time string for each format
for format in "${formats[@]}"; do
    echo "$(date +"$format" -d "$time_string")    $format"
done



#./convert_time_formats.sh "2024-04-04 14:30:00"

