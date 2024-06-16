#!/bin/bash

# Define a function named 'sum' that takes two parameters
sum() {
  a=$1
  b=$2
  result=$(($a + $b))
  echo "Result is: $result"
}

# Call 'sum' function with arguments 2 and 3
sum 2 3

# Read two numbers from user input
read -p "Enter num1: " arg1
read -p "Enter num2: " arg2

# Call 'sum' function with user-provided arguments
sum $arg1 $arg2
