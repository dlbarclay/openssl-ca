#!/usr/bin/env bash

openssl genrsa -aes256 \
	-out /root/ca/intermediate/private/intermediate.key.pem 4096
chmod 400 /root/ca/intermediate/private/intermediate.key.pem

