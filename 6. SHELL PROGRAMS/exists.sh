#!/bin/bash

read -p "Enter the file name: " filename

if [ -e "$filename" ]; then
  echo "File exists."
else
  echo "File does not exist."
fi
