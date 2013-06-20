#!/bin/bash

#
# Purpose: One-key operation install nginx normal
# Date:        2013-06-18
# Author:      xtso520ok@gmail.com
# Environment: OS Linux, gcc, gcc-c++, make
# Des:         ...
#

export PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

NAME="nginx normal"
echo ===============================================================================
echo Install $NAME if required...
echo ===============================================================================
NOTE_ID=$(date +%Y%m%d-%s)

# Source prepare
DIR=/usr/local/src
cd $DIR
S_NGINX=$DIR/nginx-1.5.1
U_NGINX=http://nginx.org/download/nginx-1.5.1.tar.gz
[ -e $S_NGINX.tar.gz ] || wget $U_NGINX -O $S_NGINX.tar.gz && tar xzf $S_NGINX.tar.gz
S_PCRE=$DIR/pcre-8.33
U_PCRE=http://ncu.dl.sourceforge.net/project/pcre/pcre/8.33/pcre-8.33.tar.gz
[ -e $S_PCRE.tar.gz ] || wget $U_PCRE -O $S_PCRE.tar.gz && tar xzf $S_PCRE.tar.gz

# Operate
id www 2>&1 1>/dev/null
[ $? -eq 0 ] || useradd -M -s /bin/sh --uid=515 www
wget -q https://raw.github.com/xtso520ok/autoconf/master/nginx-normal/html/200.jpg -O $S_NGINX/html/200.jpg
wget -q https://raw.github.com/xtso520ok/autoconf/master/nginx-normal/html/404.html -O $S_NGINX/html/404.html
wget -q https://raw.github.com/xtso520ok/autoconf/master/nginx-normal/html/404.jpg -O $S_NGINX/html/404.jpg
wget -q https://raw.github.com/xtso520ok/autoconf/master/nginx-normal/html/500.html -O $S_NGINX/html/500.html
wget -q https://raw.github.com/xtso520ok/autoconf/master/nginx-normal/html/500.jpg -O $S_NGINX/html/500.jpg
wget -q https://raw.github.com/xtso520ok/autoconf/master/nginx-normal/html/favicon.ico -O $S_NGINX/html/favicon.ico
wget -q https://raw.github.com/xtso520ok/autoconf/master/nginx-normal/html/index.html -O $S_NGINX/html/index.html
mkdir -p $S_NGINX/conf/vhost
mv $S_NGINX/conf/nginx.conf{,.$NOTE_ID}
wget -q https://raw.github.com/xtso520ok/autoconf/master/nginx-normal/nginx.conf -O $S_NGINX/conf/nginx.conf
wget -q https://raw.github.com/xtso520ok/autoconf/master/nginx-normal/nginx-init -O $S_NGINX/conf/nginx-init
wget -q https://raw.github.com/xtso520ok/autoconf/master/nginx-normal/nginx-init -O $S_NGINX/conf/nginx-sysconfig
wget -q https://raw.github.com/xtso520ok/autoconf/master/nginx-normal/vhost/dir.i-david.org.conf -O $S_NGINX/conf/vhost/dir.i-david.org.conf


cd $DIR
sed -i 's/"1.5.1"/"1.5.1_1.0"/' $S_NGINX/src/core/nginx.h
sed -i 's/"nginx\/"/"DS\/"/' $S_NGINX/src/core/nginx.h
sed -i 's/"NGINX"/"DS"/' $S_NGINX/src/core/nginx.h
sed -i 's/"Server: nginx"/"Server: DS"/' $S_NGINX/src/http/ngx_http_header_filter_module.c


exit 0
# Install
cd $DIR
./configure --prefix=/usr/local/nginx-test --user=www --group=www --with-http_gzip_static_module --with-http_stub_status_module --with-pcre=$DIR/$NAME/pcre 
make
make install


