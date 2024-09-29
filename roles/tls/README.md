# TLS

This role will install certbot with cloudflare plugin,
issue a wildcard certificate for your domain, and prepare it for use in haproxy.

Certbot should automatically set a systemd timer to renew certificates.

## Created files

- `/etc/certbot/cloudflare.ini`
- `/etc/letsencrypt/live/{{ domain }}/fullchain.pem`
- `/etc/letsencrypt/live/{{ domain }}/privkey.pem`
- `/etc/haproxy/certs/{{ domain }}.pem` - fullchain + privkey
