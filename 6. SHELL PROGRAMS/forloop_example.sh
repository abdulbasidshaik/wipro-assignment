#!/bin/bash

# Loop from 0 to 5
for (( i=0; i<=5; i++ ))
do
  echo "The given number $i"
done

# Loop from 1 to 10
for (( i=1; i<=10; i++ ))
do
  if [ $((i%2)) -eq 0 ]
  then
    echo "Even number is $i"
  fi
done


# OUTPUT:

<< $ chmod 777 loops_example.sh
$ ./loops_example.sh
The given number 0
The given number 1
The given number 2
The given number 3
The given number 4
The given number 5
Even number is 2
Even number is 4
Even number is 6
Even number is 8
Even number is 10
