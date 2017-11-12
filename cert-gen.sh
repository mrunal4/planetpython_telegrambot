#!/bin/sh

### BEGIN INFO
# Provides:          cert-gen
# Short-Description: generates ssl certificates
# Description:       generates ssl certificates using certbot(letsencrypt)
### END INFO

set -e

if [ -d /etc/letsencrypt/live/$domain_name ]; then
    if [ -f /etc/letsencrypt/live/$domain_name/fullchain.pem ] && [ -f /etc/letsencrypt/live/$domain_name/privkey.pem ] ; then
        echo "Files already exist."
    else
        echo "Files doesn't exist, Hence generating"
        cd /root/certbot
        ./certbot-auto certonly --standalone -d $domain_name
    fi
elif [ ! -d /etc/letsencrypt/live/$domain_name ]; then
    echo "Files doesn't exist, Hence generating"
    cd /root/certbot
    ./certbot-auto certonly --standalone -d $domain_name
fi
