#!/bin/bash

config=$(mktemp -t gpg-XXXXX)

# virtualbox entropy not enough
curl -s http://releases.ubuntu.com/14.04/ubuntu-14.04-desktop-amd64.iso > /dev/urandom &

echo "Creating GPG key..."
cat >${config}<<EOF
%echo Generating a basic OpenPGP key
Key-Type: DSA
Key-Length: 1024
Subkey-Type: ELG-E
Subkey-Length: 1024
Name-Real: blackbox dem
Name-Comment: blackbox demo
Name-Email: blackbox-demo@demo
Expire-Date: 0
Passphrase: demo
%commit
EOF

gpg --batch --gen-key ${config}

echo yes | blackbox_initialize

blackbox_addadmin $(gpg --export |  gpg --list-packets --textmode | sed '/keyid/!d; s/.*keyid \([0-9A-F]\{16\}\).*/\1/I' | uniq)
