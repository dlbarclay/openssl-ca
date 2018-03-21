#!/usr/bin/env bash

source vars

openssl ca -config $CA_ROOTDIR/openssl.cnf -extensions v3_intermediate_ca \
	-days 3650 -notext -md sha256 \
	-in $CA_ROOTDIR/intermediate/csr/intermediate.csr.pem \
	-out $CA_ROOTDIR/intermediate/certs/intermediate.cert.pem

chmod 444 $CA_ROOTDIR/intermediate/certs/intermediate.cert.pem

