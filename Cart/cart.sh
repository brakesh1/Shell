#!/bin/bash
dnf module disable nodejs -y

dnf module enable nodejs:18 -y

yum install nodejs -y

useradd roboshop

mkdir /app

curl -L -o /tmp/cart.zip https://roboshop-builds.s3.amazonaws.com/cart.zip

cd /app

unzip /tmp/cart.zip

npm install

cp /home/centos/Shell/Cart/cart.service /etc/systemd/system/cart.service

systemctl daemon-reload

systemctl enable cart

systemctl start cart
