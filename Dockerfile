# base image for automation testing QA
FROM ubuntu:20.04 
RUN date
RUN ln -s /usr/share/zoneinfo/Asia/Jakarta /etc/localtime
RUN apt-get update -y
RUN apt-get install -y groff less python3 python3-pip curl openjdk-8-jdk zip jq dbus tzdata -y
RUN pip install awscli && aws configure set default.region ap-southeast-1

