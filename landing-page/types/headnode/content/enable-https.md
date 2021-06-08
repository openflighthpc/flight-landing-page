### Generate an SSL certificate

SSL certificates are generated with `flight www cert-gen`.

`LetsEncrypt` can be used to generate a certificate if the machine is
accessible via a public DNS by running:

```
flight www cert-gen --cert-type lets-encrypt --domain DOMAIN --email EMAIL
```

Alternatively a `SelfSigned` certificate can be generated with:

```
flight www cert-gen --cert-type self-signed --domain $(hostname -d)
```

### Enable and Start HTTPS

You are now ready to start the `HTTPS` server with:

```
flight www enable-https
```
