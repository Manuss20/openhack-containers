#!/bin/bash

# echo "Desplegando todas las imagenes al cluster"
# kubectl apply -f .


kubectl config set-context --current --namespace=tripapi

echo "Revisando POI"
kubectl exec poi-6c7f7775f5-z5fxq    -- curl -is -X GET 'http://localhost/api/poi/healthcheck'

echo "Revisando tripapi"
kubectl exec trips-65d886959-rz7qm  -- curl -is -X GET 'http://localhost/api/trips'

echo "Revisando userapi"
kubectl exec user-java-76cf7b8f89-g6xfd  -- curl -is -X GET 'http://localhost/api/user-java/healthcheck'

echo "Revisando userprofileapi"
kubectl exec userprofile-5f958bfd85-rbhqb -- curl -is -X GET 'http://localhost/api/user/healthcheck' 

# echo "Revisando webapp"
# kubectl exec tripviewer-c98f84d69-lxgnp -- curl -s 'http://localhost/' 
