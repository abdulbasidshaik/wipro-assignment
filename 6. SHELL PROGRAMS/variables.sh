#!/bin/sh

name="pooja"
age=24

echo "name is $name and age is $age"
echo "name is $name \n age is $age"  # This will not interpret '\n' as a newline

unset age
echo "name is $name and age is $age"  # Age will be empty since it's unset

country="india"
echo "$country"

readonly country
country="India"  # This will cause an error because 'country' is readonly
