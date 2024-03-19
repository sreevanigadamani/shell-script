#!/bin/bash


userid=$(id -u)
if [ $userid -ne 0]
then    
    echo "error: u r not root user"
    exit 1  # it will exit ,u should give 1-127 onther than 0
else    
    echo "info: u r root user"
fi
yum install git -y

if ($? -ne 0)
then 
    echo "installation is failure"
    exit 1
else
    echo "installation is success"
fi"