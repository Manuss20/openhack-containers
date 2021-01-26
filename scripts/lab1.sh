#!/bin/bash
source config.sh

echo "Eliminamos el contenedor"
docker rm $API_Container -f

echo "Compilamos la imagen API POI"
docker build -f /mnt/d/_dev/openhack-containers/dockerfiles/poi.dockerfile -t "tripinsights/poi:1.0" /mnt/d/_dev/openhack-containers/src/poi/ 

echo "Compilando"
sleep 30
echo "Compilado finalizado"

echo "Ejecutamos la imagen API POI"
docker run --network $DOCKER_NETWORK -d -p $PORT_API_EXT:$PORT_API --name $API_Container -e SQL_PASSWORD=$DB_PASSWORD -e SQL_SERVER=$DB_Container -e SQL_USER=$DB_USER -e SQL_DBNAME=$DB_NAME -e ASPNETCORE_ENVIRONMENT=$ENV_NETCORE tripinsights/poi:1.0

echo "Waiting"
sleep 10

echo "Testing"
curl -i -X GET "http://localhost:$PORT_API_EXT/api/poi"

