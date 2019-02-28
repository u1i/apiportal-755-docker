#!/usr/bin/bash

echo Building mock environment with sestatus and service for installer

echo "echo OK" > /tmp/printok
chmod a+x /tmp/printok

ln -s /tmp/printok /usr/bin/service
ln -s /tmp/printok /usr/bin/sestatus

# Do install with expect
echo 'portal ALL=(ALL) NOPASSWD: ALL' | sudo EDITOR='tee -a' visudo

/tmp/installer-wrapper.x
