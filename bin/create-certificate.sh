#!/usr/bin/env bash

# Check if a subdomain is provided as an argument
if [ -z "$1" ]; then
  echo "Please supply a subdomain to create a certificate for."
  echo "e.g. www.mysite.com"
  exit 1
fi

# Set domain variables
DOMAIN="$1"
COMMON_NAME=${2:-*.$1}
SUBJECT="/C=BR/ST=SP/L=Sao Paulo/O=vinicius/CN=$DOMAIN/emailAddress=vinicius.vrf@gmail.com"
NUM_OF_DAYS=999
EXT="authorityKeyIdentifier=keyid,issuer
basicConstraints=CA:FALSE
keyUsage=digitalSignature, nonRepudiation, keyEncipherment, dataEncipherment
subjectAltName=@alt_names

[alt_names]
DNS.1=$DOMAIN"

# File paths and extensions
ROOT_CA_KEY="rootCA.key"
ROOT_CA_PEM="rootCA.pem"
DEVICE_KEY="device.key"
DEVICE_CSR="device.csr"
DEVICE_CRT="device.crt"

# Generate rootCA key and certificate
openssl genrsa -out "$ROOT_CA_KEY" 2048
openssl req -x509 -new -nodes -key "$ROOT_CA_KEY" -sha256 -days 1024 -out "$ROOT_CA_PEM" -subj "$SUBJECT"

# Check if rootCA.pem was created successfully
if [ ! -f "$ROOT_CA_PEM" ]; then
  echo "Error: $ROOT_CA_PEM couldn't be created. Please try again!"
  exit 1
fi

# Create a new private key if one doesn't exist, or use the existing one if it does
KEY_OPT="-keyout"
if [ -f "$DEVICE_KEY" ]; then
  KEY_OPT="-key"
fi

printf "$EXT" > /tmp/__v3.ext

# Generate device key and certificate signing request (CSR)
openssl req -new -newkey rsa:2048 -sha256 -nodes "$KEY_OPT" "$DEVICE_KEY" -subj "$SUBJECT" -out "$DEVICE_CSR"
openssl x509 -req -in "$DEVICE_CSR" -CA "$ROOT_CA_PEM" -CAkey "$ROOT_CA_KEY" -CAcreateserial -out "$DEVICE_CRT" -days "$NUM_OF_DAYS" -sha256 -extfile /tmp/__v3.ext

# Move output files to final filenames
mv "$DEVICE_KEY" "$DOMAIN.key"
mv "$DEVICE_CSR" "$DOMAIN.csr"
mv "$DEVICE_CRT" "$DOMAIN.crt"

# Clean up temporary files
rm "$ROOT_CA_KEY" "$ROOT_CA_PEM" "$ROOT_CA_PEM.srl" /tmp/__v3.ext

printf "\n###########################################################################\n"
echo "Done!"
printf "###########################################################################\n\n"
echo "To use these files on your server, simply copy both $DOMAIN.csr and"
echo "$DOMAIN.key to your web server, and use them like so (for Apache, for example):"
printf "\n    SSLCertificateFile    /path_to_your_files/$DOMAIN.crt\n"
echo "    SSLCertificateKeyFile /path_to_your_files/$DOMAIN.key\n"
echo
echo "Remember to trust the generated certificate:"
echo "In Mac OS X, run:"
echo "sudo security add-trusted-cert -d -r trustRoot -k /Library/Keychains/System.keychain /path/to/$DOMAIN.crt"
