#!/bin/bash

dnf module disable nodejs -y

dnf module enable nodejs:18 -y

yum install nodejs -y

useradd roboshop

mkdir /app

curl -o /tmp/catalogue.zip https://roboshop-builds.s3.amazonaws.com/catalogue.zip

cd /app 

unzip /tmp/catalogue.zip

npm install 

cp /home/centos/Shell/Catalogue/catalogue.service /etc/systemd/system/catalogue.service

systemctl daemon-reload

systemctl enable catalogue

systemctl start catalogue

cp /home/centos/Shell/Catalogue/mongo.repo /etc/yum.repos.d/mongo.repo

yum install mongodb-org-shell -y

mongo --host 54.92.254.98 </app/schema/catalogue.js