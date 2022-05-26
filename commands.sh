## Set variables ##
RESOURCE_GROUP=democliaskrg
RG_LOCATION=uksouth
AKS_CLUSTER_NAME=democliaskrgcluster
echo ${RESOURCE_GROUP} ${RG_LOCATION} ${AKS_CLUSTER_NAME}

# create RG ##
az group create --location ukwest --name democliaskrg --tag Dev

## Create an SP to use ##
az create spn

## Create AKS Cluster ##
az aks create \
    --resource-group ${RESOURCE_GROUP} \
    --name ${AKS_CLUSTER_NAME} \
    --enable-managed-identity \
    --generate-ssh-keys \
    --node-count 1 \
    --tag Dev

##### VARIFY CLUSTER IN PORTAL ###

## Connect cluster ##
az aks get-credentials --resource-group ${RESOURCE_GROUP} --name ${AKS_CLUSTER_NAME}

## Delete cluster ##
az aks delete --resource-group ${RESOURCE_GROUP} --name ${AKS_CLUSTER_NAME}



## backup ssh keys if required ##
cd $HOME/ .sshmkdir BACKUP-SSH-KEYS-democliaskrgcluster
cp identity-rsa* BACKUP-SSH-KEYS-democliaskrgcluster
ls -lrt BACKUP-SSH-KEYS-democliaskrgcluster
