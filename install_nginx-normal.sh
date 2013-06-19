#!/bin/bash

#
# Purpose: One-key operation install nginx normal
# Date:    2013-06-18
# Author:  xtso520ok@gmail.com
# Dsc:     OS Linux
#

export PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

NAME="nginx normal"
echo ===============================================================================
echo Install $NAME if required...
echo ===============================================================================

# Source prepare
DIR=/usr/local/src
cd $DIR
S_NGINX=$DIR/nginx-1.5.1
U_NGINX=http://nginx.org/download/nginx-1.5.1.tar.gz
[ -e $S_NGINX.tar.z ] ||　wget $U_NGINX -O $S_NGINX.tar.gz && tar xzf $S_NGINX.tar.gz
S_PCRE=$DIR/pcre-8.33
U_PCRE=http://ncu.dl.sourceforge.net/project/pcre/pcre/8.33/pcre-8.33.tar.gz
[ -e $S_PCRE.tar.z ] ||　wget $U_PCRE -O $S_PCRE.tar.gz && tar xzf $S_PCRE.tar.gz

# Operate
useradd -M -s /bin/sh --uid=515 www


# Install
cd $
./configure --prefix=/usr/local/nginx-test --user=www --group=www --with-http_gzip_static_module --with-http_stub_status_module --with-pcre=$DIR/$NAME/pcre 
make
make install


