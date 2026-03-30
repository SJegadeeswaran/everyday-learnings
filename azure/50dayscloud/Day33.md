**Day 33: Integrating Virtual Machines with Application Load Balancer**

The Nautilus DevOps team is currently working on setting up a simple application on the Azure cloud. They aim to establish an Azure Load Balancer in front of a Virtual Machine (VM) where an Nginx server is currently running. While the Nginx server currently serves a sample page, the team plans to deploy the actual application later.

    1. Set up an Azure Load Balancer named datacenter-lb.
    2. Configure the Load Balancer’s frontend IP configuration with the name datacenter-lb-ip and assign a public IP address with the same name (datacenter-lb-ip).
    3. Create a backend pool named datacenter-backend-pool and add the VM running Nginx to this pool.
    4. Create a health probe named datacenter-health-probe on port 80 to check the VM's health.
    5. Set up a load balancer rule named datacenter-lb-rule to route traffic on port 80 to the backend pool on port 80.
    6. Add an inbound rule to the existing NSG of the VM to allow HTTP traffic on port 80.

    Notes:

    Create the resources only in the eastus region.

**Solution**

