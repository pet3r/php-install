#!/bin/bash

# Build PHP
# PHP 7.0

if [ ! -d "$1" ]; then
    echo "Usage:"
    echo "$0 <php-src-dir>"
    echo "<php-src-dir> is a PHP source directory"
    exit 1
fi

$out = out.txt
if [ -f $out ]; then
    rm $out
fi
touch $out

src="$1"
#pushd $src

## CORE

#    --disable-cgi \
#    --disable-rpath \      Disable passing additional runtime library search paths
#    --enable-sysvsem \
#    --enable-sysvshm \
#    --enable-sysvmsg \
#    --with-apxs2 \         Build shared Apache 2.0 Handler module.

core_conf="\
     --disable-cgi \
     --with-config-file-path=/etc/php/7.0/cli \
     --with-config-file-scan-dir=/etc/php/7.0/cli/conf.d \
     --disable-short-tags \
"

## EXTENSION

#    --enable-bcmath \      BCMath Arbitrary Precision Mathematics 
#    --enable-dba=shared \  Database (Berkeley DB style) Abstraction Layer
#    --enable-intl \        Internationalization (wrapper for ICU library)
#    --enable-pcntl \       Unix style Process Control
#    --enable-phpdbg \      phpdbg provides an interactive environment to debug PHP
#    --enable-sockets \     low-level interface to the socket communication
#    --enable-dba=shared \
#    --with-bz2=/usr \      BZip2. Requirements: libbz2-dev
#    --with-db4=/usr \      DBA: Oracle Berkeley DB 4.x or 5.x support  
#    --with-gettext         Implements an Native Language Support API for internationalization.
#    --with-iconv-dir=/usr  character set conversion library
#    --with-mysqli \
#    --with-imap \          Req.: libc-client2007e-dev (Debian)
#    --with-kerberos \      Kerberos may needed for IMAP. Req.: libkrb5-dev
#    --with-pcre-regex= \
#    --with-qdbm=/usr       Quick Database Manager is a library of routines for managing a database
#    --with-sqlite3 \       SQLite3 support for PDO
#    --with-qdbm=/usr \

extension_conf="\
    --enable-bcmath \
    --enable-calendar \
    --enable-exif \
    --enable-ftp \
    --enable-intl \
    --enable-mbregex \
    --enable-mbstring \
    --enable-opcache \
    --enable-pcntl \
    --enable-phar \
    --enable-phpdbg \
    --enable-soap \
    --enable-sockets \
    --enable-zip \
    --with-bz2=/usr \
    --with-curl=/usr/bin/curl \
    --with-gettext \
    --with-iconv-dir=/usr \
    --with-icu-dir=/usr \
    --with-imap \
    --with-kerberos \
    --with-imap-ssl \
    --with-libxml-dir=/usr \
    --with-mcrypt \
    --with-openssl \
    --with-pdo-oci=instantclient,/usr,12.1 \
    --with-pdo-mysql \
    --with-pdo-sqlite= \
    --with-pear \
    --with-readline \
    --with-tidy=/usr \
    --with-xsl \
    --with-zlib \
"

$src/configure $core_conf $extension_conf | tee > $out

if [ $? = 0 ]; then
    make -j `cat /proc/cpuinfo | grep processor | wc -l`  | tee > $out
fi
if [ $? = 0 ]; then
    make -j `cat /proc/cpuinfo | grep processor | wc -l` test | tee > $out
fi

