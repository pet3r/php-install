#!/bin/sh

# Install build requirements
# PHP 7.2

if [ `whoami` != root ]; then
    echo 'Please run as root!'
    exit
fi

#    autoconf \             Xdebug
#    libbz2-dev \           BZip2
#    libc-client2007e-dev \ IMAP
#    libqdbm-dev \          Berkeley Database Libraries
#    libicu-dev \           International Components for Unicode
#    libkrb5-dev \          Kerberos
#    libmcrypt-dev \        Mcrypt
#    libqdbm-dev \          Quick Database Manager Libraries
#    libreadline-dev \      Readline
#    sqlite3                PDO SQLite

apt-get update
apt-get install --yes \
    autoconf \
    libbz2-dev \
    libdb-dev \
    libc-client2007e-dev \
    libcurl4-openssl-dev \
    libicu-dev \
    libkrb5-dev \
    libmcrypt-dev \
    libqdbm-dev \
    libssl-dev \
    libsodium-dev \
    libtidy-dev \
    libxml2-dev \
    libmysqlclient-dev \
    libxslt-dev \
    libreadline-dev \
    libzip-dev \
    sqlite3
