#!/bin/bash

# Read the first number
read -p "Enter number 1: " num1 #or read num1

# Read the second number with a prompt
read -p "Enter number 2: " num2 #or read num2

# Perform multiplication
mul=$((num1 * num2))

# Print the result
echo "Multiplication of $num1 and $num2 is: $mul"
