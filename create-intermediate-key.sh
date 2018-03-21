#!/usr/bin/env bash

source vars

openssl genrsa -aes256 \
	-out $CA_ROOTDIR/intermediate/private/intermediate.key.pem 4096
chmod 400 $CA_ROOTDIR/intermediate/private/intermediate.key.pem

