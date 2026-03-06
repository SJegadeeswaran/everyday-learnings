**Configuring Instances with User Data**

The Nautilus DevOps Team is working on setting up a new virtual machine (VM) to host a web server for a critical application. The team lead has requested you to create an Azure VM that will serve as a web server using Nginx. This VM will be part of the initial infrastructure setup for the Nautilus project. Ensuring that the server is correctly configured and accessible from the internet is crucial for the upcoming deployment phase.

As a member of the Nautilus DevOps Team, your task is to create a VM with the following specifications:

Instance Name: The VM must be named xfusion-vm.

Image: Use any available Ubuntu image to create this VM.

Custom Script Extension/User Data: Configure the VM to run a custom script during its launch. This script should:

    Install the Nginx package.
    Start the Nginx service.

Network Security Group (NSG): Ensure that the VM allows HTTP traffic on port 80 from the internet.

Notes:

    Create the resources only in the East US region.
    You may use the default resource group or create a new one if needed.

**Solution**

* Navigate to Virtual Machines.
* Click create-->Enter the VM name as xfusion-vm.
* Choose EastUS region.
* Choose availability option as "no infrastructure redundancy required" and security type as "Trusted launch virtual machines".
* Select any of the Ubuntu image and the machine size.
* Select inbound ports to allow 80 along with 22.
* Choose OS disk type as Standard HDD.
* Go to Advanced tab and select the "Select an extension to install"
* Choose Custom script for linux from the search-->click Next.
* Create a file locally for nginx.sh and upload to the storage account.
* To upload to the storage account, with preferred storage type as Azure Blob storage, performance as standard and redundancy as GRS. Other settings will be set as default.
* Once the storage account is created, go to the Data storage-->Containers-->Add Container
* Once container is created, go inside the container, choose a file and  click upload.
* Once the file is uploaded, use browse from the "Configure Custom script for linux Extension" and choose the uploaded file from the storage container.
* Enter the command in the text box as "bash nginx.sh".
* Click create.
* Click Review + Create --> Create.

nginx.sh

#! /bin/bash
sudo apt update
sudo apt install nginx -y
sudo systemctl start nginx