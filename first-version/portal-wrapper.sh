#!/usr/bin/bash

/usr/sbin/httpd -k start

echo looping
while [ 1 ]
do
  date
  sleep 60
done
