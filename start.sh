#!/bin/bash

vault secrets enable -version=1 -path=secret kv

minikube config set memory 5096
minikube config set kubernetes-version v1.16.13
minikube start 

cp ~/.minikube/ca.crt build/
cp ~/.minikube/profiles/minikube/client.key build/
cp ~/.minikube/profiles/minikube/client.crt build/
cp ~/.kube/config build/


echo "Finished Setting up vault and minikube"

