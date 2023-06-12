#!/bin/bash
yum -y update
yum -y install ruby
yum -y install wget

cd /home/ec2-user || exit
wget https://aws-codedeploy-us-east-1.s3.us-east-1.amazonaws.com/latest/install
chmod +x ./install
./install auto
service codedeploy-agent start