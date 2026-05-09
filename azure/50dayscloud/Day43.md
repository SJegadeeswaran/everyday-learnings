**Day 43: Configuring Azure VM with Application Gateway**

The Nautilus Development Team needs to set up a new Azure Virtual Machine (VM) and configure it to run a web server. This VM should be part of an Azure Application Gateway (AGW) setup to ensure high availability and better traffic management. The task involves creating a VM, setting up an AGW, configuring a backend pool, and ensuring the web server is accessible via the AGW public IP.

Create a Network Security Group (NSG): Create an NSG named nautilus-nsg and add an inbound security rule Allow-HTTP to allow TCP traffic on port 80.

Create a Virtual Machine: Create a VM named nautilus-vm using any available Ubuntu image. Configure the instance with the following settings:

    Size: Choose a lightweight VM size (e.g., Standard_B1s).

    Authentication: Use SSH public key authentication. (Please select use existing public key option, create public-key locally and paste contents of ~/.ssh/id_rsa.pub)

    OS Disk: Use a Standard HDD.

    Networking: Under the Advanced section, attach an existing NSG (e.g., nautilus-nsg).

Additionally, configure the instance to run a user data script during launch that:

    Install the Nginx package.

    Start the Nginx service.

Set up an Application Gateway: Set up an Azure Application Gateway named nautilus-agw with the following:

    Create and Associate it with a public IP address named nautilus-agw-ip.

    Attach the backend pool:nautilus-backendpool to the VM nautilus-vm.

    Select a subnet for the Application Gateway (you can create a new one if needed).

Configure HTTP Settings: Create an HTTP setting named nautilus-http-settings on port 80

Route Traffic: Add a listener named nautilus-listener and a routing rule named nautilus-routing-rule to route traffic from the AGW frontend to the backend pool:

    Listener: Frontend IP = public IP, Frontend port = 80, Protocol = HTTP

    Routing rule: Connects nautilus-listener to nautilus-backendpool using nautilus-http-settings.

NSG Adjustments: Make sure the NSG attached to the VM allows inbound TCP traffic on port 80, so the Nginx server running on nautilus-vm is accessible via the Application Gateway public IP.

Note: Wait for the Application Gateway resource to be fully deployed before proceeding with the next steps. Deployment may take several minutes to complete.  

Notes:

    Create the resources only in the West US region.

**Solution**

* Go to NSG-->Enter the name and region
* Click Review+Create
* Go to the created NSG
* On the left side of the panel-->Settings-->Choose Inbound Security rules.
* Choose service as HTTP-->Allow-->port 80
* Create a VM
* Enter the region, size and SSH public key
* Choose the disk
* In the Networking section-->network interface-->configure network security group-->choose the existing nsg created.

Install nginx:

```
#! /bin/bash
sudo apt update
sudo apt install nginx -y
sudo systemctl start nginx
``` 
* Search for application gateway and cick create application gateway.
* Choose the resource group name, region and application gateway name.
* Choose the virtual network and the subnet by newly creating one.
* Click next for Frontends.
* In the public IPv4 address section click add new and add the Public IPv4 address name.
* Click next for backends.
* Click add a backend pool.
* Enter the backend pool name and the target type and target.
* Click next for configuration.
* Click add routing rule-->Enter the rule name and priority as 1
* Under backend pool as target type enter the backend target and the backend settings by entering the backend name.
* Click review+create.





**Error**

Backend Pool 'xfusion-backendpool' does not exist.

