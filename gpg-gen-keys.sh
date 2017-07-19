#!/usr/bin/env bash

# This script generates a certifying master key with an associated subkey (see https://wiki.debian.org/Subkeys)

set -euf -o pipefail

RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m'

info() {
    echo -e "${GREEN}$1${NC}"
}

info "Generate keys"

while :; do
    echo "Please enter a passphrase for your GPG key:"
    echo "WARNING: You cannot use the single quotes char -> ' <- in your passwords."
    read -s -r  -e -p "GPG Key Passphrase:" GPG_KEY_PASSPHRASE
    echo ""
    read -s -r -e -p "Please Re-type your Passphrase:" GPG_KEY_PASSPHRASE_VERIF
    echo ""
    [ "$GPG_KEY_PASSPHRASE" = "$GPG_KEY_PASSPHRASE_VERIF" ] && break
    echo "Passwords don't match! Try again."
done

readonly GPG_HOMEDIR="./.gnupg"
readonly GPG_KEY_LENGTH=4096
readonly GPG_KEY_TYPE="RSA"
readonly GPG_KEY_NAME=${GPG_USER_NAME:-`git config user.name`}
readonly GPG_KEY_EMAIL=${GPG_USER_EMAIL:-`git config user.email`}

mkdir -p $GPG_HOMEDIR
chmod 700 $GPG_HOMEDIR

cat << EOF > $GPG_HOMEDIR/gpg.conf
auto-key-locate keyserver
keyserver hkps://hkps.pool.sks-keyservers.net
keyserver-options no-honor-keyserver-url
keyserver-options no-honor-keyserver-url
keyserver-options debug
keyserver-options verbose
personal-cipher-preferences AES256 AES192 AES CAST5
personal-digest-preferences SHA512 SHA384 SHA256 SHA224
default-preference-list SHA512 SHA384 SHA256 SHA224 AES256 AES192 AES CAST5 ZLIB BZIP2 ZIP Uncompressed
cert-digest-algo SHA512
s2k-cipher-algo AES256
s2k-digest-algo SHA512
charset utf-8
fixed-list-mode
no-comments
no-emit-version
keyid-format 0xlong
list-options show-uid-validity
verify-options show-uid-validity
with-fingerprint
use-agent
require-cross-certification
EOF

gpg --homedir $GPG_HOMEDIR --batch --gen-key <<EOT
Key-Type: $GPG_KEY_TYPE
Key-Length: $GPG_KEY_LENGTH
Subkey-Type:  $GPG_KEY_TYPE
Subkey-Length: $GPG_KEY_LENGTH
Subkey-Usage: sign encrypt auth
Name-Real: $GPG_KEY_NAME
Name-Email: $GPG_KEY_EMAIL
PassPhrase:$GPG_KEY_PASSPHRASE
Expire-Date: 0
%commit
EOT

GPG_KEY_ID=`gpg --homedir $GPG_HOMEDIR --list-keys --with-colons | grep "$GPG_KEY_EMAIL" | grep -Eo "[A-F0-9]{16}"`

info "Generated key $GPG_KEY_ID"

# TODO Create subkeys

info "Generate revocation certificates"

# Generate revocation certificate
gpg  --homedir $GPG_HOMEDIR --output  key-revocation-certificate.asc --gen-revoke $GPG_KEY_EMAIL

# To revoke your key: `gpg --import key-revocation-certificate.asc; gpg --keyserver .. --send-key $GPG_KEY_ID``

info "Make sure you backup $GPG_HOMEDIR then delete it. You might want to consider using srm."