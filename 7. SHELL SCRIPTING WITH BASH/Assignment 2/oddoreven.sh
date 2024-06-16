#!/bin/bash

while true; do
  read -p "Enter numbers (separated by spaces, 0 to quit): " -a numbers

  for number in "${numbers[@]}"; do
        if [ "$number" -eq 0 ]; then
           echo "Exiting..."
           exit 0
        fi

        if [ $((number % 2)) -eq 0 ]; then
            echo "$number is even."
        else 
            echo "$number is odd."
        fi
  done
done

