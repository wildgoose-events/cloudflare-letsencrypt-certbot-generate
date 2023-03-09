#!/bin/sh

# Arguments to variables
CLOUDFLARE_DNS_API_TOKEN=$1
DOMAIN_NAME=$2
NOTIFY_EMAIL=$3
CERTS_FILE_NAME=$4
DRY_RUN=$5

# Validating input variables
if [ -z "$CLOUDFLARE_DNS_API_TOKEN" ]; then
    echo "Please configure a valid Cloudflare DNS API Token"
    exit 1
fi
if [ -z "$DOMAIN_NAME" ]; then
    echo "Please provide a valid domain name to issue certificate"
    exit 1
fi
if [ -z "$NOTIFY_EMAIL" ]; then
    echo "Please provide a valid email address to set as notification email"
    exit 1
fi

# Preparing cloudflare credentials config file
mkdir -p /opt/cloudflare/
echo 'dns_cloudflare_api_token = '$CLOUDFLARE_DNS_API_TOKEN > /opt/cloudflare/credentials
chmod 600 /opt/cloudflare/credentials

if [[ $DRY_RUN == "true" ]]; then
    # Performing a dry run
    echo "Performing a dry run"
    certbot certonly --non-interactive --dns-cloudflare --dns-cloudflare-credentials /opt/cloudflare/credentials --agree-tos --email $NOTIFY_EMAIL -d $DOMAIN_NAME --server https://acme-v02.api.letsencrypt.org/directory --dry-run
else
    # Requesting for a certificate
    echo "Performing a dry run"
    certbot certonly --non-interactive --dns-cloudflare --dns-cloudflare-credentials /opt/cloudflare/credentials --agree-tos --email $NOTIFY_EMAIL -d $DOMAIN_NAME --server https://acme-v02.api.letsencrypt.org/directory
    # Compiling certificates and keys to a zip archive
    zip -j -r $CERTS_FILE_NAME.zip /etc/letsencrypt/live/$DOMAIN_NAME/
fi