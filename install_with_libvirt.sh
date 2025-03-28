#!/bin/bash

sops --decript sops --decrypt user-data-sops.yaml > user-data.yaml

virt-install \
  --virt-type=kvm \
  --name test-devstack \
  --memory 8192 \
  --debug \
  --os-variant ubuntu22.04 \
  --vcpus 4 \
  --import \
  --noreboot \
  --disk size=20,backing_store="/home/windblow/images/jammy-server-cloudimg-amd64.img" \
  --network default \
  --cloud-init user-data="$(pwd)/user-data.yaml,meta-data=$(pwd)/metadata.yaml,network-config=$(pwd)/network-config.yaml"


ansible-playbook -i '192.168.122.221,' playbook.yml  --user ubuntu --become
