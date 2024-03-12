#!/bin/bash

echo "enter username"

read username #this is the variable where the value of the one user entered
# this is only for validation, u should not print in the termial
echo "username entered is : $username"

echo "enter password"
 read -s password
 echo "password entered is: $password"