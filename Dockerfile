# This is a Docker file
FROM centos:7
MAINTAINER abc@gmail.com
RUN yum install -y httpd \
zip\
unzip
ADD /home/ubuntu/photogenic.zip /var/www/html/
WORKDIR /var/www/html/
RUN unzip photogenic.zip
RUN cp -rvf photogenic/*
RUN rm -rf photogenic photogenic.zip
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
EXPOSE 80
