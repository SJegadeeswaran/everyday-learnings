**Day 33: Integrating Virtual Machines with Application Load Balancer**

The Nautilus DevOps team is currently working on setting up a simple application on the Azure cloud. They aim to establish an Azure Load Balancer in front of a Virtual Machine (VM) where an Nginx server is currently running. While the Nginx server currently serves a sample page, the team plans to deploy the actual application later.

    Set up an Azure Load Balancer named xfusion-lb.
    Configure the Load Balancer’s frontend IP configuration with the name xfusion-lb-ip and assign a public IP address with the same name (xfusion-lb-ip).
    Create a backend pool named xfusion-backend-pool and add the VM running Nginx to this pool.
    Create a health probe named xfusion-health-probe on port 80 to check the VM's health.
    Set up a load balancer rule named xfusion-lb-rule to route traffic on port 80 to the backend pool on port 80.
    Add an inbound rule to the existing NSG of the VM to allow HTTP traffic on port 80.

    Notes:

    Create the resources only in the eastus region.

**Solution**

* Search for load balancer.
* Click create and choose standard load balancer.
* Choose the existing resource group.
* Enter the name as xfusion-lb, SKU as standard, type as public and tier as regional.
* Click Next: Frontend IP.
* Click Add a Frontend IP configuration.
* Enter the name of the frontend IP configuration as xfusion-lb-ip.
* Click create-new from the "Public IP address".
* Enter the name as "xfusion-lb-ip" and click save.
* Click save on the frontend IP configuration too.
* Click next to create backend pool.
* Enter the name of the backend pool as xfusion-backend-pool and choose a virtual network from the dropdown.
* Go to IP configurations and click add.
* Add the virtual machine and click save.
* Click Next to Inbound rules
* Click add a load balancing rule
* Enter the load balancing rule name-->Frontend IP address, Backend pool, port and the backend port as 80
* Click create new on the health probe and enter the health probe name.
* Click save.
* Click review+create
* Go to NSG-->Click the existing NSG
* Go to settings-->Click inbound security rules-->Choose the service as HTTP-->Enter the rule name and save.
