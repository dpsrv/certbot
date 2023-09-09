#!/bin/ash -ex

cd $(dirname $0)
WD=$(pwd)
cd -

domains=$($WD/getDomains.sh /etc/bind/zones|tr '\n' ','|sed 's/,$//g')

certbot certonly -n --agree-tos -m $LETSENCRYPT_EMAIL --webroot -w /var/www/ -d "$domains"
