#!/bin/bash

echo "Desplegando todas las imagenes al cluster"
kubectl apply -f .

# echo "Comprobamos el estado"
# while true; do k get pods; sleep 1; done

echo "Revisando POI"
kubectl exec poi-6d46744c55-9cbdp -- echo curl -i -X GET 'http://localhost/api/poi/healthcheck' 

echo "Revisando tripapi"
kubectl exec tripapi-85ddd9f94-5qkbs -- curl -i -X GET 'http://localhost/api/trips'

echo "Revisando userapi"
kubectl exec userapi-cd9db66cc-zcjgk -- curl -i -X GET 'http://localhost/api/user-java/healthcheck'

echo "Revisando userprofileapi"
kubectl exec userprofileapi-699f6f5f7c-mc799 -- curl -i -X GET 'http://localhost/api/user/healthcheck' 

echo "Revisando webapp"
kubectl exec webapp-8698c957f6-5977l -- curl -s 'http://localhost/' 

# echo "TRIPS_API_ENDPOINT"
# kubectl exec webapp-8698c957f6-5977l -- curl -s http://tripapi/api/trips
# echo "USERPROFILE_API_ENDPOINT"
# kubectl exec webapp-8698c957f6-5977l -- curl -s http://userprofileapi/api/user/
# kubectl exec webapp-8698c957f6-5977l -- env | sort
