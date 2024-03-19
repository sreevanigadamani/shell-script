#!/bin/bash
DATE=$(date +%F-%H-%M-%S)
SCRIPT_NAME= $0
LOGFILE=/tmp/$SCRIPT_NAME-$DATE.log

R="\e[31m"
G="\[32m"
N="\e[0m"
# this function should validate the previous ommandand inform user it is success or failure
VALIDATE(){

#$1 --- it will receivethe argument1
if [ $1 -ne 0]
then    
    echo -e "$2 .... failure"
    exit 1  # it will exit ,u should give 1-127 onther than 0
else    
    echo -e "$2 .... success"
fi
}
userid=$(id -u)
if (userid -ne 0)
then 
    echo "error: u r not root user"
    exit 1  # it will exit ,u should give 1-127 onther than 0
else    
    echo "info: u r root user"
fi

#it is our responsibility again to check installation is success or not 
yum install mysql -y &>>$LOGFILE

VALIDATE $? "installing mysql"


yum intall postfix -y

VALIDATE $? "installing postfix"