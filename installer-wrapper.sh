#!/usr/bin/bash

echo Building mock environment with sestatus and service for installer

echo "echo OK" > /tmp/printok
chmod a+x /tmp/printok

ln -s /tmp/printok /usr/bin/service
ln -s /tmp/printok /usr/bin/sestatus

# Do install with expect
echo 'portal ALL=(ALL) NOPASSWD: ALL' | sudo EDITOR='tee -a' visudo

# Use expect to answer the questions
/tmp/installer-wrapper.x

# Change HTTP ports
sudo sed -i 's/443/8443/g' /etc/httpd/conf.d/ssl.conf
sudo sed -i 's/443/8443/g' /etc/httpd/conf.d/apiportal.conf
sudo sed -i 's/80/8080/g' /etc/httpd/conf/httpd.conf
