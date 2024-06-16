#!/bin/bash

display() {
  directory=$1
  if [ -d "$directory" ]; then
    echo "Correct path: $directory"
    for file in "$directory"/*; do
      if [ -f "$file" ]; then
        echo "$file"
      fi
    done
  else
    echo "Directory not found"
  fi
}

display "/home/rps/"
