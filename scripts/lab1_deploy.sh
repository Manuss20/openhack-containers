#!/bin/bash
source config.sh

az login
az acr login --name $ARC_NAME

echo "Preparando la imagen $CONTAINER_API:TAG_API para depslegar en ACR"
docker tag $CONTAINER_API:TAG_API $ARC_URL/$CONTAINER_API:TAG_API

echo "Preparando la imagen $CONTAINER_SQL:TAG_SQL para depslegar en ACR"
docker push $ARC_URL/$CONTAINER_API:TAG_API
echo "La imagen $CONTAINER_API:TAG_API ha sido publicada en ACR"

echo "Preparando la imagen $CONTAINER_SQL:TAG_SQL para depslegar en ACR"
docker tag $CONTAINER_SQL:TAG_SQL $ARC_URL/$CONTAINER_SQL:TAG_SQL

echo "Desplegando la imagen $CONTAINER_SQL:TAG_SQL"
docker push $ARC_URL/$CONTAINER_SQL:TAG_SQL
echo "La imagen $CONTAINER_SQL:TAG_SQL ha sido publicada en ACR"
