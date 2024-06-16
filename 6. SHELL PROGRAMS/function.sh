#!/bin/bash

# Function definition
greet() {
  echo "Hello all"
}

# Function call
greet

# Function definition with parameters
sum() {
  a=$1
  b=$2
  result=$(($a + $b))
  echo "Result of sum : $result"
}

# Function call with arguments
sum 2 3
