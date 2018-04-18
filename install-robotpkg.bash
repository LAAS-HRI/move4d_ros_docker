#!/usr/bin/env bash

# test
set -e

#initialize robotpkg apt repositories
if [ ! -f /etc/apt/sources.list.d/robotpkg.list ];then
    echo adding robotpkg apt repository
    CODENAME=`lsb_release -sc`
    tee /etc/apt/sources.list.d/robotpkg.list <<EOF
deb http://robotpkg.openrobots.org/packages/debian/pub $CODENAME robotpkg
EOF
    curl http://robotpkg.openrobots.org/packages/debian/robotpkg.key |
       apt-key add -

    apt-get update

fi

