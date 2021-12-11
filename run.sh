#!/bin/bash
##############################################################################################
#  Copyright Accenture. All Rights Reserved.
#
#  SPDX-License-Identifier: Apache-2.0
##############################################################################################

set -e

echo "Starting build process..."

echo "Adding env variables..."
export PATH=/root/bin:$PATH

#Path to k8s config file
KUBECONFIG=/home/ubuntu/bevel/build/config

echo "Validatin network yaml"
ajv validate -s /home/ubuntu/bevel/platforms/network-schema.json -d /home/ubuntu/bevel/build/network.yaml 

echo "Running the playbook..."
exec ansible-playbook -vv /home/ubuntu/bevel/platforms/shared/configuration/site.yaml --inventory-file=/home/ubuntu/bevel/platforms/shared/inventory/ -e "@/home/ubuntu/bevel/build/network.yaml" -e 'ansible_python_interpreter=/usr/bin/python3'
