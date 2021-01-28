#!/bin/bash
# source config.sh
# set -e 

# # Create a resource group
# az group create --name $RESOURCE_GROUP_NAME --location $LOCATION

# # Create a virtual network and subnet
# az network vnet create \
#     --resource-group $RESOURCE_GROUP_NAME \
#     --name myVnet \
#     --address-prefixes 192.168.0.0/16 \
#     --subnet-name myAKSSubnet \
#     --subnet-prefix 192.168.1.0/24


# az network vnet create --resource-group hackresources --name myVnet --address-prefixes 192.168.0.0/16 --subnet-name myAKSSubnet --subnet-prefix 192.168.1.0/24


# # Create a service principal and read in the application ID
# SP=$(az ad sp create-for-rbac --output json)
# SP_ID=$(echo $SP | jq -r .appId)
# SP_PASSWORD=$(echo $SP | jq -r .password)

# {
#   "appId": "c40ec449-db64-4780-a7bc-c42689a95623",
#   "displayName": "azure-cli-2021-01-27-12-46-07",
#   "name": "http://azure-cli-2021-01-27-12-46-07",
#   "password": "rzlwGFBI2oKXK6EHbuCsbIBpO3_0e93Olq",
#   "tenant": "cbddfaac-0fb1-417c-aac3-8d2fa625eb0b"
# }


# SP=
# SP_ID="c40ec449-db64-4780-a7bc-c42689a95623"
# SP_PASSWORD="rzlwGFBI2oKXK6EHbuCsbIBpO3_0e93Olq"





# # Wait 15 seconds to make sure that service principal has propagated
# echo "Waiting for service principal to propagate..."
# sleep 15

# # Get the virtual network resource ID
# VNET_ID=$(az network vnet show --resource-group $RESOURCE_GROUP_NAME --name myVnet --query id -o tsv)
# az network vnet show --resource-group hackresources --name myVnet --query id -o tsv
# VNET_ID=/subscriptions/37d34961-9643-4b36-bb4d-d6490a5e747b/resourceGroups/hackresources/providers/Microsoft.Network/virtualNetw
# orks/myVnet

# az role assignment create --assignee c40ec449-db64-4780-a7bc-c42689a95623 --scope /subscriptions/37d34961-9643-4b36-bb4d-d6490a5e747b/resourceGroups/hackresources/providers/Microsoft.Network/virtualNetw
# orks/myVnet --role Contributor


# az role assignment create --assignee "c40ec449-db64-4780-a7bc-c42689a95623" --scope /subscriptions/37d34961-9643-4b36-bb4d-d6490a5e747b/resourceGroups/hackresources/providers/Microsoft.Network/virtualNetw
# orks/myVnet --role Network Contributor

# az role assignment create --assignee "c40ec449-db64-4780-a7bc-c42689a95623" --role "Network Contributor" --scope /subscriptions/37d34961-9643-4b36-bb4d-d6490a5e747b/resourceGroups/hackresources/providers/Microsoft.Network/virtualNetw


# az role assignment create --assignee "c40ec449-db64-4780-a7bc-c42689a95623" --scope /subscriptions/37d34961-9643-4b36-bb4d-d6490a5e747b/resourceGroups/hackresources/providers/Microsoft.Network/virtualNetw
# orks/myVnet

# # Assign the service principal Contributor permissions to the virtual network resource
# az role assignment create --assignee $SP_ID --scope $VNET_ID --role "Contributor"

# # Get the virtual network subnet resource ID
# SUBNET_ID=$(az network vnet subnet show --resource-group $RESOURCE_GROUP_NAME --vnet-name myVnet --name myAKSSubnet --query id -o tsv)


# SUBNET_ID=$(az network vnet subnet show --resource-group teamResources --vnet-name vnet --name myakssubnet --query id -o tsv)

# az network vnet subnet show --resource-group hackresources --vnet-name myVnet --name myAKSSubnet --query id -o tsv

# Create the AKS cluster and specify the virtual network and service principal information
# Enable network policy by using the `--network-policy` parameter
# az aks create \
#     --resource-group "hackresources" \
#     --name "clusterhack" \
#     --node-count 1 \
#     --generate-ssh-keys \
#     --network-plugin kubenet \
#     --service-cidr 10.0.0.0/16 \
#     --dns-service-ip 10.0.0.10 \
#     --pod-cidr 10.244.0.0/16 \
#     --docker-bridge-address 172.17.0.1/16 \
#     --vnet-subnet-id /subscriptions/37d34961-9643-4b36-bb4d-d6490a5e747b/resourceGroups/hackresources/providers/Microsoft.Network/virtualNetworks/myVnet/subnets/myAKSSubnet \
#     --service-principal "c40ec449-db64-4780-a7bc-c42689a95623" \
#     --client-secret "rzlwGFBI2oKXK6EHbuCsbIBpO3_0e93Olq" \


az aks create \
    --resource-group "teamResources" \
    --name "clusterhack2" \
    --node-count 1 \
    --generate-ssh-keys \
    --network-plugin kubenet \
    --service-cidr 10.3.1.0/24 \
    --dns-service-ip 10.3.1.10 \
    --pod-cidr 10.4.0.0/16 \
    --docker-bridge-address 172.17.0.1/16 \
    --vnet-subnet-id /subscriptions/37d34961-9643-4b36-bb4d-d6490a5e747b/resourceGroups/teamResources/providers/Microsoft.Network/virtualNetworks/vnet/subnets/myakssubnet \
    --service-principal "c40ec449-db64-4780-a7bc-c42689a95623" \
    --client-secret "rzlwGFBI2oKXK6EHbuCsbIBpO3_0e93Olq" \

