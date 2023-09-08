#!/bin/bash -ex

. ${DPSRV_HOME}/rc/secrets/letsencrypt/setenv.sh

docker run -it --rm --name certbot \
	-v ${DPSRV_HOME}/rc/secrets/letsencrypt:/etc/letsencrypt \
	-v ${DPSRV_HOME}/var/lib/letsencrypt:/var/lib/letsencrypt \
	-v ${DPSRV_HOME}/var/www/:/var/www/ \
	certbot/certbot \
	--agree-tos -m $LETSENCRYPT_EMAIL -n --webroot -w /var/www/ "$@"
