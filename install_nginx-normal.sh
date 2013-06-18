#!/bin/bash

#
# Purpose: One-key operation install nginx normal
# Date:    2013-06-18
# Author:  xtso520ok@gmail.com
# Dsc:     OS CentOS6.3x86_64
#

export PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

NAME=nginx-normal
echo ===============================================================================
echo Install $NAME if required...
echo ===============================================================================

which git 2>&1 | grep "no git" 
[ $? -eq 0 ] && yum install -y git.x86_64

DIR=/usr/local/src
mkdir -p $DIR/$NAME
cd $DIR/$NAME
git init
git remote add origin git@github.com:xtso520ok/nginx-normal.git
git pull origin master
git submodule init
git submodule update





