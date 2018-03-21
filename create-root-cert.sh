#!/usr/bin/env bash

openssl req -config /root/ca/openssl.cnf \
	-key /root/ca/private/ca.key.pem \
	-new -x509 -days 7300 -sha256 -extensions v3_ca \
	-out /root/ca/certs/ca.cert.pem

