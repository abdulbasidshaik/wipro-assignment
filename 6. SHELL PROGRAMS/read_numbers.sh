#!/bin/sh

# Read the first number
echo "Enter number 1:"
read num1
echo "The number is $num1" 

# Read the second number with a prompt
read -p "Enter number 2: " num2
echo "The number is $num2"


: << 'Enter number 1:'
100
The number is 100
Enter number 2: 200
The number is 200