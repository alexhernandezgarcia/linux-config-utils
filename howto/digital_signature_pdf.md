# How to digitally sign PDFs

## Step by step

Following the section Configuring Okular in [Deep Dive: Using Okular to Digitally Sign PDFs](https://gregbur.me/2022/04/28/deep-dive-digitally-signing-pdfs-with-okular/)

1. Create data base
```
certutil -N -d ~/.pki/nssdb
```

2. Issue a self-signed certificate
```
certutil -S -d ~/.pki/nssdb -s "CN=<Full Name>;OU=<Machine name>;O=<Machine name>;L=<City>;ST=<State>;C=<Country code, e.g. CA>" -t ",,C,C" -n "<Machine name> NSS certutil certificate" -x
```

3. Confirm the creation of the certificate and private key
```
certutil -L -d ~/.pki/nssdb
```

4. Configure Okular

## Update a certificate

To simply issue a new self-signed certificate to replace an expired one:
```
certutil -S -d ~/.pki/nssdb -s "CN=<Full Name>;OU=<Machine name>;O=<Machine name>;L=<City>;ST=<State>;C=<Country code, e.g. CA>" -t ",,C,C" -n "<Machine name> NSS certutil certificate" -x
```
---

## Additional info that was useful at some point

Follow this:

https://gregbur.me/2022/04/28/deep-dive-digitally-signing-pdfs-with-okular/

---

1. Generate a self-signed SSL certificate with openssl

```
openssl req -x509 -newkey rsa:4096 -keyout ~/certificates/key.pem -out ~/certificates/cert.pem -sha256 -days 365
```

2. Create a PKCS12 certificate

```
openssl pkcs12 -export -out ~/certificates/certificate.pfx -inkey ~/certificates/key.pem -in ~/certificates/cert.pem
```

## References

- [Stack OverFlow: generate certificate](https://stackoverflow.com/questions/10175812/how-to-generate-a-self-signed-ssl-certificate-using-openssl)
- [Create PKCS12 certificate](https://www.ssl.com/how-to/create-a-pfx-p12-certificate-file-using-openssl/)
- [Digital Ocean: generate certificate](https://www.digitalocean.com/community/tutorials/how-to-create-a-self-signed-ssl-certificate-for-apache-in-ubuntu-20-04)
- [OpenSSL documentation](https://www.openssl.org/docs/)
- [TU Dresden](https://datashare.tu-dresden.de/index.php/s/j5BKKyJYZFBzGsB)
- [Okular documentation](https://docs.kde.org/stable5/en/okular/okular/signatures.html#adding_digital_signatures)
