#!/usr/bin/bash

echo Building mock environment with sestatus and service for installer

echo "echo OK" > /tmp/printok
chmod a+x /tmp/printok

ln -s /tmp/printok /usr/bin/service
ln -s /tmp/printok /usr/bin/sestatus

# Do install with expect

/tmp/installer-wrapper.x
