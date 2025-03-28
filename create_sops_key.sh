#!/bin/bash

gpg --batch --full-generate-key <<EOF
%no-protection
Key-Type: 1
Key-Length: 4096
Subkey-Type: 1
Subkey-Length: 4096
Expire-Date: 0
Name-Comment: test key for sops
Name-Real: windblow_key
EOF

GPG_KEY_SOPS=$(gpg --list-keys | grep windblow_key -B 1 | head -n 1 | tr -d ' ')


cat  >.sops.yaml <<EOF
creation_rules:
    - pgp: >-
        $GPG_KEY_SOPS
EOF
