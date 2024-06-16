#!/bin/bash

sum() {
  echo "Inside the sum function"
  return 10
}

sum

result=$?
echo "Result is $result"
