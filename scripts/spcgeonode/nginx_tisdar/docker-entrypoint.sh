#!/bin/sh

# Exit script in case of error
set -e

echo $"\n\n\n"
echo "-----------------------------------------------------"
echo "STARTING NGINX ENTRYPOINT ---------------------------"
date

# We make the config dir
mkdir -p "/spcgeonode-certificates/$LETSENCRYPT_MODE"

echo "Creating symbolic link for HTTPS certificate"
# for some reason, the ln -f flag doesn't work below...
# TODO : not DRY (reuse same scripts as docker-autoreload.sh)
rm -f /certificate_symlink
echo "Symlinking to certificates ..."
ln -sf "/spcgeonode-certificates/production" /certificate_symlink

echo "Replacing environement variables"
envsubst '\$HTTP_HOST \$HTTPS_HOST \$RESOLVER' < /etc/nginx/nginx.conf.envsubst > /etc/nginx/nginx.conf
envsubst '\$HTTP_HOST \$HTTPS_HOST \$RESOLVER' < /etc/nginx/nginx.https.available.conf.envsubst > /etc/nginx/nginx.https.available.conf

echo "Enabling or not https configuration"
if [ -z "${HTTPS_HOST}" ]; then 
        echo "" > /etc/nginx/nginx.https.enabled.conf
else
        ln -sf /etc/nginx/nginx.https.available.conf /etc/nginx/nginx.https.enabled.conf
fi

echo "-----------------------------------------------------"
echo "FINISHED NGINX ENTRYPOINT ---------------------------"
echo "-----------------------------------------------------"

# Run the CMD 
exec "$@"
