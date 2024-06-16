
#!/bin/bash

# Function to count the number of lines in a file
count_lines() {
  local filename="$1"
  if [ ! -f "$filename" ]; then
    echo "File '$filename' not found!"
    return 1
  fi

  local line_count
  line_count=$(wc -l < "$filename")
  echo "The file '$filename' has $line_count lines."
}

# Main script logic
while true; do
  read -p "Enter a filename (or 'exit' to quit): " filename

  if [ "$filename" == "exit" ]; then
    echo "Exiting..."
    break
  fi

  count_lines "$filename"
done