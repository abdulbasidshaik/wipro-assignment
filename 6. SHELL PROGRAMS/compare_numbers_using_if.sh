#!/bin/bash

# Read the first number
read -p "Enter number 1: " num1
echo "The number 1 is $num1"

# Read the second number with a prompt
read -p "Enter number 2: " num2
echo "The number 2 is $num2"

# Check if num1 is greater than num2
if [ $num1 -gt $num2 ]; then
  echo "$num1 is greater than $num2"
fi
