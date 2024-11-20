#!/bin/bash

if [ -f "./etc_hosts_addon" ]; then
    sudo cat "./etc_hosts_addon" >> /etc/hosts
fi
