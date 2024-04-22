#!/bin/bash

dnf module disable nodejs -y

dnf module enable nodejs:18 -y

yum install nodejs -y

useradd roboshop

mkdir /app

curl -L -o /tmp/user.zip https://roboshop-builds.s3.amazonaws.com/user.zip

cd /app 

unzip /tmp/user.zip
 
npm install 

cp /home/centos/Shell/User/user.service /etc/systemd/system/user.service

systemctl daemon-reload

systemctl enable user

systemctl start user

cp /home/centos/Shell/User/mongo.repo /etc/yum.repos.d/mongo.repo

yum install mongodb-org-shell -y

mongo --host MONGODB-SERVER-IPADDRESS </app/schema/user.js