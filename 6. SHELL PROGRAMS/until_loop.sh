#!/bin/bash

num=1
until [ $num -eq 10 ]; do
  echo "num is $num"
  num=$((num + 1))
done
