#!/bin/bash

read -p "enter the file : " filename

if [ -e $filename ]
then
 echo "file exists"
else
 echo "file not exists"
fi

echo "checking the read permissions"

if [ -r $filename ]
then
 echo "file has read permissions"
else
 echo "file doesnt have read permission"
fi