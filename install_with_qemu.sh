#!/bin/bash

cloud-localds seed.img user-data.yaml metadata.yaml

qemu-system-x86_64  \
  -machine accel=kvm,type=q35 \
  -cpu host \
  -m 8G \
  -nographic \
  -device virtio-net-pci,netdev=net0 \
  -netdev user,id=net0,hostfwd=tcp::2222-:22 \
  -drive if=virtio,format=qcow2,file=${HOME}/images/jammy-server-cloudimg-amd64.img \
  -drive if=virtio,format=raw,file=seed.img
