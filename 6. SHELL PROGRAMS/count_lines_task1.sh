#!/bin/bash

countlines() {
  filename=$1

  if [ -e "$filename" ]; then
    echo "File is present: $filename"
    lines=$(wc -l < "$filename")
    echo "Number of lines present in the file '$filename' is $lines"
  else
    echo "File '$filename' not found"
  fi
}

countlines "helloworld.sh"
