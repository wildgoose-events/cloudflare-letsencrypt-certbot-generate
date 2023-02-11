FROM certbot/dns-cloudflare:latest
RUN apk add zip
COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]