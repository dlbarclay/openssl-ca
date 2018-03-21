#!/usr/bin/env bash

source vars

if [ -z "$1" ]; then
	echo "No arguments!  $0 <COMMON_NAME>"
	exit 1;
fi

COMMON_NAME=$1

# Create key file
openssl genrsa -aes256 \
	-out "$CA_ROOTDIR/intermediate/private/$COMMON_NAME.key.pem" 2048
chmod 400 "$CA_ROOTDIR/intermediate/private/$COMMON_NAME.key.pem"

# Create certificate signing request
openssl req -config $CA_ROOTDIR/intermediate/openssl.cnf \
	-key "$CA_ROOTDIR/intermediate/private/$COMMON_NAME.key.pem" \
	-new -sha256 -out "$CA_ROOTDIR/intermediate/csr/$COMMON_NAME.csr.pem"

# Sign certificate signing request, create certificate file
openssl ca -config $CA_ROOTDIR/intermediate/openssl.cnf \
	-extensions server_cert -days 375 -notext -md sha256 \
	-in "$CA_ROOTDIR/intermediate/csr/$COMMON_NAME.csr.pem" \
	-out "$CA_ROOTDIR/intermediate/certs/$COMMON_NAME.cert.pem"
chmod 444 "$CA_ROOTDIR/intermediate/certs/$COMMON_NAME.cert.pem"

# Verify certificate
openssl verify -CAfile $CA_ROOTDIR/intermediate/certs/ca-chain.cert.pem \
	      "$CA_ROOTDIR/intermediate/certs/$COMMON_NAME.cert.pem"

