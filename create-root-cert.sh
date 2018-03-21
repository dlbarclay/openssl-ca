#!/usr/bin/env bash

source vars

openssl req -config $CA_ROOTDIR/openssl.cnf \
	-key $CA_ROOTDIR/private/ca.key.pem \
	-new -x509 -days 7300 -sha256 -extensions v3_ca \
	-out $CA_ROOTDIR/certs/ca.cert.pem

