#!/bin/bash

rm -f /var/run/chronyd.pid

/usr/sbin/chronyd -d 
