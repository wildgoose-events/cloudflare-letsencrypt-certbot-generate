# 🚀 SSH for GitHub Actions

GitHub action for generating LetsEncrypt certificate with DNS challenge for domains parked in Cloudflare

## Input

* `cloudflare_dns_api_token` - Cloudflare DNS API token with Zone:DNS:Edit permission
* `domain_name` - The fully qualified domain name for which certificate is required
* `email` - Email address (to notify on certificate expiry)

## Usage

```yaml
name: Generate LetsEncrypt Certificate
on: [push]
jobs:

  build:
    name: build
    runs-on: ubuntu-latest
    steps:
    - name: Generate LetsEncrypt Cert
      uses: shibme/cloudflare-letsencrypt-certbot-action@main
      with:
        cloudflare_dns_api_token: ${{ secrets.CLOUDFLARE_DNS_API_TOKEN }}
        domain_name: ${{ secrets.DOMAIN_NAME }}
        email: ${{ secrets.EMAIL }}
```