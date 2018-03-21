#!/usr/bin/env bash

source vars

cat $CA_ROOTDIR/intermediate/certs/intermediate.cert.pem \
	$CA_ROOTDIR/certs/ca.cert.pem > $CA_ROOTDIR/intermediate/certs/ca-chain.cert.pem

chmod 444 $CA_ROOTDIR/intermediate/certs/ca-chain.cert.pem

