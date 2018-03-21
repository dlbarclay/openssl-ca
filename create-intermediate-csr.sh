#!/usr/bin/env bash

source vars

openssl req -config $CA_ROOTDIR/intermediate/openssl.cnf -new -sha256 \
	-key $CA_ROOTDIR/intermediate/private/intermediate.key.pem \
	-out $CA_ROOTDIR/intermediate/csr/intermediate.csr.pem

