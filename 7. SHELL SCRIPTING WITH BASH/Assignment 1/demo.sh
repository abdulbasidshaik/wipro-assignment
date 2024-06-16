#!/bin/bash

read -p "enter the file: " filename

if [ -e $filename ] then
  echo "file exists"
else
  echo "file not found"
fi

echo "checking the read permissions..."

if [ -r $filename ] then
  echo "file has read permissions."
else
  echo "file doesn't have read permissions."
fi
