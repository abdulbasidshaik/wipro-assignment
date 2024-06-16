#!/bin/bash

# Initialize the array elements
fruits=("apple" "mango" "orange")

# Printing array elements using index
echo "${fruits[0]}"
echo "${fruits[1]}"

# Printing all elements in the array
echo "${fruits[@]}"

# Printing the length of the array
echo "${#fruits[@]}"

# Iterating over the array and printing each element
for fruit in "${fruits[@]}"
do
  echo "elements are $fruit"
done


# OUTPUT: 

# $ chmod 777 array_example.sh
# $ ./array_example.sh
# apple
# mango
# apple mango orange
# 3
# elements are apple
# elements are mango
# elements are orange
