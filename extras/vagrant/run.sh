#!/bin/bash

# Figure out what system we are running on
if [ "$(uname)" <> "Darwin" ]; then
    OS_ID=$(grep '^ID=' /etc/os-release | cut -f2- -d= | sed -e 's/\"//g')
    OS_VERSION_ID=$(grep '^VERSION_ID=' /etc/os-release | cut -f2- -d= | sed -e 's/\"//g')
fi

if [ "$OS_ID" == "ubuntu" ]; then
    $OS_CODENAME=$UBUNTU_CODENAME
fi

echo "Starting VPP..."
if [ "$OS_ID" == "ubuntu" ] && [ "$OS_CODENAME" == "trusty" ] ; then
    sudo -E start vpp
else
    sudo -E service vpp start
fi
