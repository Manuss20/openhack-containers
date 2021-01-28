#!/bin/bash
# source config.sh

kubectl apply -f deployment_tripviewer.yaml -n tripviewer

kubectl apply -f deployment_poi.yaml -n tripapi
kubectl apply -f deployment_tripapi.yaml -n tripapi
kubectl apply -f deployment_userprofile.yaml -n tripapi
kubectl apply -f deployment-user-java.yaml -n tripapi



