#!/bin/bash

if [ -f ./awsip ]; then
    mv ./awsip /usr/local/bin

else
    curl https://raw.githubusercontent.com/0xGuillaume/aws-ip-ranges/main/awsip -o /tmp/awsip
    chmod +x /tmp/awsip

    echo "[INFO] sudo required to move awsip to /usr/local/bin"
    sudo mv /tmp/awsip /usr/local/bin
fi
