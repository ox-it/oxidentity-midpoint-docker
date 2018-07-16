#!/bin/sh

HOST=$1

set -e

cd /var/lib/ssl-ca/keys/
/usr/bin/req "${HOST}"
openssl x509 -req -in "${HOST}.req.pem" -CA /var/lib/ssl-ca/certs/docker-ca.crt.pem -CAkey /var/lib/ssl-ca/keys/docker-ca.key.pem -CAcreateserial \
  -out "/var/lib/ssl-ca/certs/${HOST}.crt.pem" -days 730 -sha256

