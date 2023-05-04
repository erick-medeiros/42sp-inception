#!/bin/sh

# TLS/SSL - Transport Layer Security / Secure Sockets Layer
# X.509 certificate stantard
# Security Certificate .crt - certified
# Encrypted Key .key - key
# Privacy Enhanced Mail Certificate .pem - certified and key
# Certificate Signing Request .csr - request
# Certificate Authority (CA)

CA_KEY=CA.key
CA_CRT=CA.crt
CA_INFO="/C=BR/ST=Sao Paulo/L=Sao Paulo/O=42 Sao Paulo/OU=42SP/CN=www.42sp.org.br/emailAddress=navemae@42sp.org.br"

CERTIFICATE_KEY=certificate.key
CERTIFICATE_CRT=certificate.crt
CERTIFICATE_CSR=certificate.csr

# 1. Creation of key and certificate for CA (Certificate Authority):
openssl req -x509 -sha256 -days 365 -nodes \
 -newkey rsa:2048 -keyout $CA_KEY -out $CA_CRT -subj "$CA_INFO"

# 2. Creation of Private Key:
openssl genrsa -out $CERTIFICATE_KEY 2048

# 3. Creating the Certificate Signing Request (CSR):
openssl req -new -key $CERTIFICATE_KEY -out $CERTIFICATE_CSR -subj "$CA_INFO"

# 4. Creating the CA-signed certificate:
openssl x509 -req -in $CERTIFICATE_CSR -CA $CA_CRT -CAkey $CA_KEY \
 -CAcreateserial -out $CERTIFICATE_CRT -days 365 -sha256