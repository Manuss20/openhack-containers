#!/bin/bash

# echo "Desplegando todas las imagenes al cluster"
# kubectl apply -f .


kubectl config set-context --current --namespace=tripviewer
kubectl port-forward tripviewer-7bdbbd5bc-j92m2 8000:80

# echo "Revisando webapp"
# kubectl exec tripviewer-c98f84d69-lxgnp -- curl -s 'http://localhost/' 
