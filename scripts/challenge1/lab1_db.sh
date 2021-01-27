#!/bin/bash
source config.sh

echo "Borrar Todo"
for container_id in $(docker ps -a | grep -v CONTAINER | awk '{print $1}'); do docker rm -f $container_id; done

echo "Creación de la RED"
docker network create $DOCKER_NETWORK

echo "Crear DB"
docker run --network $DOCKER_NETWORK -e "ACCEPT_EULA=$ACCEPT_EULA" -e "SA_PASSWORD=$DB_PASSWORD" -p $PORT_DB:$PORT_DB --name $DB_Container -h $DB_Container -d $URL_DB_CONTAINER

sleep 10

echo "Creacion Tabla"
docker exec $DB_Container /opt/mssql-tools/bin/sqlcmd -S $DB_HOST -U $DB_USER -P $DB_PASSWORD -Q "CREATE DATABASE $DB_NAME"

echo "Comprobación de Tabla"
docker exec $DB_Container /opt/mssql-tools/bin/sqlcmd -S $DB_HOST -U $DB_USER -P $DB_PASSWORD -Q "SELECT Name from sys.Databases"
docker exec $DB_Container /opt/mssql-tools/bin/sqlcmd -S $DB_HOST -U $DB_USER -P $DB_PASSWORD -Q "SELECT t.name from sys.tables t"

echo "Carga de los datos en la BD"
docker run --network $DOCKER_NETWORK -e SQLFQDN=$DB_Container -e SQLUSER=$DB_USER -e SQLPASS=$DB_PASSWORD -e SQLDB=$DB_NAME openhack/data-load:v1

echo "Carga de datos"
sleep 30
echo "Carga finalizada"


