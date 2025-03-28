#!/bin/bash

openstack keypair create --public-key ~/.ssh/id_rsa.pub mykey


openstack security group rule create --proto tcp --dst-port 22 default

openstack server create --flavor 1 --image cirros-0.6.3-x86_64-disk \
  --security-group default --key-name mykey ecd77ace-2c07-4a03-95e6-d16cb5a0dd55 \
  --network ecd77ace-2c07-4a03-95e6-d16cb5a0dd55
