#!/usr/bin/env bash

openssl req -config /root/ca/intermediate/openssl.cnf -new -sha256 \
	-key /root/ca/intermediate/private/intermediate.key.pem \
	-out /root/ca/intermediate/csr/intermediate.csr.pem

