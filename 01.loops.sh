#!/bin/bash

DATE=$(datw %+F)
LOGSDIR=/home/centos/shellscript-logs
SCRIPT_NAME=$0
LOGFILE=$LOGDIR/$0-$DATE.log
USERID=$(id -u)
R="\e[32m"
N="\e[0m"

if [ USERID -ne 0];
then 
    echo -e "$R error: please run this script with root acesss $N"
    exit 1
fi

VALIDATE(){
    if [ $1 -ne 0 ];
    then 
        echo -e "installing $2 ...$R failure $N"
        exit 1
    else
        echo -e "installing $2 ... $G success $N"
        
    fi
    }

# ll args are in $@
for i in $@
do 
    yum list installed $i 
    if [ $? -ne 0 ]
    then 
        echo "$i is not installed,lets install it"
        yum install  $i -y $>>$LOGFILE
        VALIDATE $? "$I"
    else
        echo -e "$Y $i is already installed $N"
    fi
done