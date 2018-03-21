#!/usr/bin/env bash

if [ -z "$1" ]; then
	echo "No arguments!  $0 <COMMON_NAME>"
	exit 1;
fi

COMMON_NAME=$1

# Create key file
openssl genrsa -aes256 \
	-out "/root/ca/intermediate/private/$COMMON_NAME.key.pem" 2048
chmod 400 "/root/ca/intermediate/private/$COMMON_NAME.key.pem"

# Create certificate signing request
openssl req -config /root/ca/intermediate/openssl.cnf \
	-key "/root/ca/intermediate/private/$COMMON_NAME.key.pem" \
	-new -sha256 -out "/root/ca/intermediate/csr/$COMMON_NAME.csr.pem"

# Sign certificate signing request, create certificate file
openssl ca -config /root/ca/intermediate/openssl.cnf \
	-extensions server_cert -days 375 -notext -md sha256 \
	-in "/root/ca/intermediate/csr/$COMMON_NAME.csr.pem" \
	-out "/root/ca/intermediate/certs/$COMMON_NAME.cert.pem"
chmod 444 "/root/ca/intermediate/certs/$COMMON_NAME.cert.pem"

# Verify certificate
openssl verify -CAfile /root/ca/intermediate/certs/ca-chain.cert.pem \
	      "/root/ca/intermediate/certs/$COMMON_NAME.cert.pem"

