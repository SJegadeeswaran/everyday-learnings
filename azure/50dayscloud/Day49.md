**Day 48: VM Setup with Web Storage Integration**

The Nautilus DevOps team is tasked with setting up an environment to host a static web application. The application will serve static content from an Azure Storage Account, and a Virtual Machine (VM) will be configured to fetch and display this content using Nginx. The Azure Storage Account is used as a secure, centralized location for storing the index.html file. The team intentionally keeps this file outside the main source code repository, since that repository contains additional internal application code that should not be exposed to or accessed by the VM. By placing only the required static file in the Storage Account, the team can distribute this asset safely and independently of the full codebase.

The VM should securely download the index.html blob directly from the designated container (e.g., using Azure CLI, SAS URL, or REST API) and place it in Nginx’s web root directory so that it is served locally by Nginx. The Storage Account is not mounted, and the Static Website feature is not used. The VM retrieves the file during deployment and may re-fetch it whenever updates are needed. The resources must follow best practices for security, performance, and accessibility.


Task Details:
1) Create a Virtual Network (VNet) and Subnet:

Create a VNet named devops-vnet in the East US region.
Create a subnet named devops-subnet within the VNet for the VM.
2) Create an Azure Storage Account:

Create a storage account named devopsstor24022 in the East US region with Locally-redundant storage (LRS).
Create a Blob container named devops-container in the storage account.
Upload the index.html file located at /root on the client host to the container devops-container.
Ensure the Storage Account is private and not publicly accessible by disabling public access for the storage account.
3) Create a Virtual Machine (VM):

Create a VM named devops-vm in the East US region.

Use the devops-vnet and subnet devops-subnet for the VM.

Authentication: Use SSH public key authentication. (Please select use existing public key option, create public-key locally and paste contents of ~/.ssh/id_rsa.pub)

Install Nginx on the VM.

Download the index.html file using a command such as:

sudo az storage blob download --account-name devopsstor24022 --account-key xxxxx --container-name devops-container --name index.html --file /var/www/html/index.html

Ensure Nginx is configured to serve the file from /var/www/html/index.html.

4) Verify Setup:

Verify that the Nginx web server on the client host serves the index.html file correctly when accessing the VM's public IP address.
Note: Follow best practices for security, accessibility, and performance while configuring resources.

**Solution**

* Search for VNet.
* Click create and enter the vnet name.
* Click Review + create-->Create.
* Go to the created resource-->Click Settings.
* Go to subnets-->Click + Subnet.
* Enter the subnet name and click add.
* Search for storage account.
* Click create.
* Enter the storage account name and redundancy.
* Click Review + create.
* Go to the created storage account.
* Click Data Storage-->Containers.
* Click add containers and enter the name of the container.
* Click create.
* Upload index.html from /root on the client host to the created container.
* Search for virtual machines.
* Click create.
* Enter the VM name and choose the VM size as B1s
* Generate the SSH and copy to the locally created azure VM.
* Open ports 80 and 22
* Choose disk as standard HDD.
* In the networking section choose vnet as devops-vnet and subnet as devops-subnet.
* Click Review + create--> Create.
* Login to the newly created VM and install nginx

```
sudo apt update
sudo apt install nginx -y
```
* Download the index.html from storage container to the newly created azure VM

```
az storage blob download --account-name devopsstor24022 --container-name devops-container --name index.html  --file /var/www/html/index.html --auth-mode login
```

* Install az cli from the below command:

```
curl -fsSL 'https://azurecliprod.blob.core.windows.net/$root/deb_install.sh' | sudo bash
```

* Run curl -I http://localhost and verify the index.html

