#!/bin/bash

#
# Purpose:     Auto commit to git
# Date:        2013-06-20
# Author:      xtso520ok@gmail.com
# Environment: OS Linux, gcc, gcc-c++, make, zlib
# Des:         ...
#

export PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

read -p "Commit dir: " dir
cd $dir
echo "Start commit $dir"
git status -s
git add *
git status -s
read -p "Commit description: " comment
git commit -m "$comment"
git status -s
git push origin master
git status -s


