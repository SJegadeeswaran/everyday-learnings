**Automating User Data Configuration Using the CLI**

The Nautilus DevOps Team is working on setting up a new virtual machine (VM) to host a web server for a critical application. The team lead has requested you to create an Azure VM that will serve as a web server using Nginx. This VM will be part of the initial infrastructure setup for the Nautilus project. Ensuring that the server is correctly configured and accessible from the internet is crucial for the upcoming deployment phase.

As a member of the Nautilus DevOps Team, your task is to create a VM using Azure CLI with the following specifications:

Instance Name: The VM must be named devops-vm.

Image: Use any available Ubuntu image to create this VM.

Custom Script Extension/User Data: Configure the VM to run a custom script during its launch. This script should:

    Install the Nginx package.
    Start the Nginx service.

Network Security Group (NSG): Ensure that the VM allows HTTP traffic on port 80 from the internet.

Instructions:

    Use Azure CLI commands to set up the VM in the specified configuration.
    Ensure the VM is accessible from the internet on port 80.
    The Nginx service should be running after setup.


Use the Azure CLI commands to complete the task.

Notes:

    Create the resources only in the East US region.
    You may use the default resource group or create a new one if needed.


 **Solution**

 ```
 az vm create --resource-group kml_rg_main-c1b1ed0e32554803 --name devops-vm --location eastus --image Ubuntu2204 --size Standard_B1s --admin-username azureuser --generate-ssh-keys 

az vm open-port --resource-group kml_rg_main-c1b1ed0e32554803 --name devops-vm --port 80

az vm open-port --resource-group kml_rg_main-c1b1ed0e32554803 --name devops-vm --port 22

az vm delete --resource-group kml_rg_main-c1b1ed0e32554803 --name devops-vm --yes --force-deletion

az storage account create --name nginx12345 --resource-group kml_rg_main-c1b1ed0e32554803 --location eastus --sku Standard_LRS --kind StorageV2

az storage container create --account-name nginx12345 --name nginx --auth-mode login

az storage blob upload --account-name nginx12345 --container-name nginx --name nginx-blob --file /root/nginx.sh --auth-mode login

az storage blob list --container-name nginx --account-name nginx12345 --auth-mode login

az storage blob url --connection-string $connectionString --container-name nginx --name nginx-blob

az storage account show-connection-string --name nginx12345 --resource-group kml_rg_main-c1b1ed0e32554803 --query connectionString --output tsv

az storage account update --name nginx12345 --resource-group kml_rg_main-c1b1ed0e32554803 --allow-blob-public-access true

az storage blob download --container-name nginx --name nginx-blob --file /root/nginx/ --connection-string "https://nginx12345.blob.core.windows.net/"

az storage account show-connection-string --resource-group kml_rg_main-c1b1ed0e32554803 --name nginx12345


az vm extension set --resource-group kml_rg_main-c1b1ed0e32554803 --vm-name devops-vm --name nginx.sh --publisher Microsoft.Azure.Extensions --settings '{"fileUris": ["https://raw.githubusercontent.com"],"commandToExecute": "bash ./nginx.sh"}'
```