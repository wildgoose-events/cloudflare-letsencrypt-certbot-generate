# 🛡️🔐🪪 Cloudflare DNS LetsEncrypt Certificate Generator

GitHub action for generating LetsEncrypt certificate with DNS challenge for domains parked in Cloudflare

## Input

* `cloudflare_dns_api_token` - Cloudflare DNS API token with Zone:DNS:Edit permission
* `domain_name` - The fully qualified domain name for which certificate is required
* `email` - Email address (to notify on certificate expiry)
* `certs_file_name` - The name of file in which the generated keys and certificates will be stored (default name - certs)

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
      uses: shibme/cloudflare-letsencrypt-certbot-generate@main
      with:
        cloudflare_dns_api_token: ${{ secrets.CLOUDFLARE_DNS_API_TOKEN }}
        domain_name: ${{ secrets.DOMAIN_NAME }}
        email: ${{ secrets.EMAIL }}
        certs_file_name: my_certs
```
The generated keys and certificates will be available in `my_certs.zip` file to be consumed by consecutive steps