---
title: How to Enable HTTPs
pretext: >
  If you are reading this than HTTPs has likely been disabled. The majority of
  the OpenFlightHPC tools and applications will not function correctly.

  Please complete the following steps to start the HTTPs service:
---
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

### Enable and Start HTTPs

You are now ready to start the `HTTPs` server with:

```
flight www enable-https
```
