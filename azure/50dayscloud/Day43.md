**Day 43: Configuring Azure VM with Application Gateway**

The Nautilus Development Team needs to set up a new Azure Virtual Machine (VM) and configure it to run a web server. This VM should be part of an Azure Application Gateway (AGW) setup to ensure high availability and better traffic management. The task involves creating a VM, setting up an AGW, configuring a backend pool, and ensuring the web server is accessible via the AGW public IP.

Create a Network Security Group (NSG): Create an NSG named devops-nsg and add an inbound security rule Allow-HTTP to allow TCP traffic on port 80.

Create a Virtual Machine: Create a VM named devops-vm using any available Ubuntu image. Configure the instance with the following settings:

Size: Choose a lightweight VM size (e.g., Standard_B1s).

Authentication: Use SSH public key authentication. (Please select use existing public key option, create public-key locally and paste contents of ~/.ssh/id_rsa.pub)

OS Disk: Use a Standard HDD.

Networking: Under the Advanced section, attach an existing NSG (e.g., devops-nsg).

Additionally, configure the instance to run a user data script during launch that:

Install the Nginx package.

Start the Nginx service.

Set up an Application Gateway: Set up an Azure Application Gateway named devops-agw with the following:

Create and Associate it with a public IP address named devops-agw-ip.

Attach the backend pool:devops-backendpool to the VM devops-vm.

Select a subnet for the Application Gateway (you can create a new one if needed).

Configure HTTP Settings: Create an HTTP setting named devops-http-settings on port 80

Route Traffic: Add a listener named devops-listener and a routing rule named devops-routing-rule to route traffic from the AGW frontend to the backend pool:

Listener: Frontend IP = public IP, Frontend port = 80, Protocol = HTTP

Routing rule: Connects devops-listener to devops-backendpool using devops-http-settings.

NSG Adjustments: Make sure the NSG attached to the VM allows inbound TCP traffic on port 80, so the Nginx server running on devops-vm is accessible via the Application Gateway public IP.

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
* In the Networking section-->network interface-->configure network security group-->choose the existing nsg created newly.

Install nginx:

```
#! /bin/bash
sudo apt update
sudo apt install nginx -y
sudo systemctl start nginx
``` 
* Search for application gateway and cick create application gateway.
* Choose the resource group name, region and application gateway name.
* Change tier to basic.
* Choose the virtual network and the subnet by newly creating one.
* Click next for Frontends.
* In the public IPv4 address section click add new and add the Public IPv4 address name.    
* Click next for backends.
* Click add a backend pool.
* Enter the backend pool name and the target type as Virtual Machine and the target VM.
* Click add.
* Click next for configuration.
* Click add routing rule-->Enter the rule name as given and priority as 1000
* Under listener tab enter the listener name.
* Frontend IP as Public IPv4, protocol as HTTP, port as 80, Listener type as Basic which all are by default chosen and as provided too.
* Choose the backend targets tab and we see target type as "Backend Pool" selected by default.
* Choose the backend pool name.
* In the backend settings click add new.
* Enter the backend settings name as http settings name provided.
* Click tags-->review+create.
* Go the the created vnet--default subnet
* Add the created nsg in the  Network Security Group.
* Run the curl command as below with the application gateway IP address.

curl "http://frontend-ip:80/"