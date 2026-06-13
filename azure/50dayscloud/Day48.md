**Day 48: VM and ACR Integration for Storage**

The Nautilus DevOps team needs to set up an Azure Virtual Machine (VM) to interact with an Azure Blob Storage container for storing and retrieving data. The team must create a private storage account, configure Blob Storage, and test the functionality.

Task:
1) Azure Virtual Machine Setup:

Create a VM named nautilus-vm in the East US region.
Authentication: Use SSH public key authentication. (Please select use existing public key option, create public-key locally and paste contents of ~/.ssh/id_rsa.pub).
Install Docker and Azure CLI on the VM.
Pull the Docker image from the ACR and run it on the VM, ensuring it listens on port 80.
2) Azure Container Registry (ACR) Setup:

Create an ACR named nautilusacr5426 in the East US region.
The repository name should be nautilus/python-app.
Build the Docker image using the Dockerfile already given under /root/pyapp.
Push the Docker image to the ACR with the tag latest.
3) Create a Storage Account and Blob Container:

Create a storage account named nautilusstor5426 in the East US region with Locally-redundant storage (LRS).
Create a Blob container named nautilus-config.
Upload a file named config.json (available under /root/) to the container.
4) Validation:

Confirm that the application can be accessed on the browser.

Notes:

Create all resources in the East US region.
Use the Azure CLI or Azure Portal for resource creation.
The Dockerfile is already given under /root/pyapp. The image tag must be latest.
The repository name should be nautilus/python-app.

**Solution**

* Search for virtual machine and choose the existing reource group.
* Enter the VM name as provided.
* Choose OS as Ubuntu 24 and B-series for size.
* Choose the existing public key and enter the value.
* Open the ports 80 and 22.
* Choose standard HDD disk and create the VM.
* Install docker and make sure azure cli is installed.
* Search for container registry.
* Enter the registry name and location.
* Choose "Domain name label scope" as no reuse.
* Click Review + Create-->create.
* Go to the created container registry resource.
* Go to settings-->Access keys
* Enable admin user and copy the passwords.
* Build a dockerfile from the azure client host (from kodekloud terminal) and tag it as below and push to ACR.

```
docker build -t nautilusacr5426.azurecr.io/nautilus/python-app:latest .
docker push nautilusacr5426.azurecr.io/nautilus/python-app:latest
```
* Search for storage accounts.
* Click create.
* Enter the default resource group, storage account name and region.
* Choose the redundancy type from the dropdown.
* Click Review + create.
* Go to the created resource-->Data storage-->Containers.
* Click add container-->Create.
* Upload a file from /root/config.json from azure hosted VM to the azure VM (VM which was recently created).
* Download a file to the azure VM for docker to run the image.

```
az storage blob upload --account-name nautilusstor5426 --container-name nautilus-config --name config.json  --file /root/config.json --auth-mode login

az storage blob download --account-name nautilusstor5426 --container-name nautilus-config --name config.json  --file /root/config.json --auth-mode login
```

* Run the docker image in azure VM using the following command.

```
docker run -d -p 80:80 -v /home/azureuser/config.json:/app/config.json --name nautilus-app nautilusacr5426.azurecr.io/nautilus/python-app:latest
```
* Run a curl to check whether the application is working.

```
curl http://ipaddress
```