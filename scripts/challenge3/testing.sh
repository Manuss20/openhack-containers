#!/bin/bash

# echo "Desplegando todas las imagenes al cluster"
# kubectl apply -f .

# echo "Comprobamos el estado"
# while true; do k get pods; sleep 1; done

echo "Revisando POI"
kubectl exec poi-6c845c86b5-hblgg   -- curl -is -X GET 'http://localhost/api/poi/healthcheck'

echo "Revisando tripapi"
kubectl exec tripapi-85ddd9f94-bdwbt  -- curl -i -X GET 'http://localhost/api/trips'

echo "Revisando userapi"
kubectl exec userapi-cd9db66cc-jx82x  -- curl -i -X GET 'http://localhost/api/user-java/healthcheck'

echo "Revisando userprofileapi"
kubectl exec userprofileapi-699f6f5f7c-r6hhm -- curl -i -X GET 'http://localhost/api/user/healthcheck' 

echo "Revisando webapp"
kubectl exec webapp-8698c957f6-4tzpf -- curl -s 'http://localhost/' 

# echo "TRIPS_API_ENDPOINT"
# kubectl exec webapp-8698c957f6-5977l -- curl -s http://tripapi/api/trips
# echo "USERPROFILE_API_ENDPOINT"
# kubectl exec webapp-8698c957f6-5977l -- curl -s http://userprofileapi/api/user/
# kubectl exec webapp-8698c957f6-5977l -- env | sort
# echo curl -i -X GET 'http://10.0.116.14/api/poi/healthcheck' 

#  az aks get-credentials -n clusterhack2 -g teamResources -f .kube/config
#  az aks get-credentials -g teamResources --name clusterhack2 --admin -f ./kube/config