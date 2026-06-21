**Day 50: VM Setup and Configuration for Azure Application Gateway**

The Nautilus DevOps team needs to set up an Azure Application Gateway to manage traffic for a backend pool of virtual machines. The gateway will serve as a load balancer, distributing traffic across the VMs.

Task:
1) Azure Virtual Network and Subnet:

Create a Virtual Network (VNet) named datacenter-vnet in the East US region.
Create a Subnet named datacenter-subnet within the VNet for the VMs.
Create a Subnet named datacenter-apgw-subnet within the VNet for the Application Gateway.
2) Azure Virtual Machines:

Create two VMs named datacenter-vm1 and datacenter-vm2 in the East US region.
Install Nginx on both VMs.
Configure index.html on VM1 to display "Welcome to KKE Labs:Version 1".
Configure index.html on VM2 to display "Welcome to KKE Labs:Version 2".
3) Azure Application Gateway:

Create an Application Gateway named datacenter-apgw in the East US region.
Assign the datacenter-apgw-subnet to the Application Gateway.
Create a frontend IP configuration named datacenter-apgw-ip.
Add the VMs datacenter-vm1 and datacenter-vm2 to the backend pool.
Configure a basic routing rule to distribute traffic between the VMs.
4) Validation:

Verify that the Application Gateway distributes traffic to both VMs.
Ensure that accessing the Application Gateway URL displays either "Welcome to KKE Labs:Version 1" or "Welcome to KKE Labs:Version 2" depending on the load balancing.

Notes:

Create all resources in the East US region.
Use the Azure Portal or Azure CLI for resource creation.
Ensure proper routing and traffic distribution through the Application Gateway.

**Solution**

* Search for virtual network.
* Click create and enter the virtual network name.
* Click next and move to address space
* Click add subnet and create the subnets.
* Click Review + Create--> Create.
* Search for virtual machines.
* Click create and create VM's.
* Enter the VM name, choose the resource group, vm size and the disks.
* Once the VM is created, login to the VM.
* Install nginx using the command: sudo apt update && sudo apt install nginx -y
* Create index.html from the location /var/www/html/index.html
* sudo systemctl reload nginx to reload nginx.
* sudo systemctl status nginx to check the status of nginx.
* Repeat the same for other VM too.
* Search for application gateway.
* Click create.
* Choose the resource group and enter the application gateway name.
* Choose Basic for Tier.
* Assign the vnet and subnet
* Click Frontends.
* Click add new and enter datacenter-apgw-ip
* Click Backends-->Add a backend pool.
* Enter the name for backend pool and choose the target type and targets.
* Click configuration and click add routing rule.
* Enter the rule name and add priority as 1000.
* Enter the listener name and click add.
* Go to Backend targets.
* Choose the backend pool.
* Click add new for backend settings and enter the backend settings name.
* Click add and click Review + Create.