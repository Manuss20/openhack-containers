#!/bin/bash
source config.sh

az login
az acr login --name $ARC_NAME

echo "Preparando la imagen $CONTAINER_API para depslegar en ACR"
docker tag $CONTAINER_API $ARC_URL/$CONTAINER_API

echo "Preparando la imagen $CONTAINER_SQL para depslegar en ACR"
docker push $ARC_URL/$CONTAINER_API
echo "La imagen $CONTAINER_API ha sido publicada en ACR"

echo "Preparando la imagen $CONTAINER_SQL para depslegar en ACR"
docker tag $CONTAINER_SQL $ARC_URL/$CONTAINER_SQL

echo "Desplegando la imagen $CONTAINER_SQL"
docker push $ARC_URL/$CONTAINER_SQL
echo "La imagen $CONTAINER_SQL ha sido publicada en ACR"
