#!/bin/bash
echo `pwd`
source_file="./etc_hosts_addon"
if [ -f $source_file ]; then
    # append if doesnt already exist
    grep -qxFf $source_file /etc/hosts || cat $source_file | sudo tee -a /etc/hosts
fi
