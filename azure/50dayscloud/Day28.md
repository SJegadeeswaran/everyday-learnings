**Day 28: Troubleshooting Public Virtual Network Configurations**

The Nautilus DevOps Team deployed an Nginx server on an Azure VM in a public VNet named devops-vnet. However, the server is still inaccessible from the internet.

As a DevOps team member, complete the following tasks:

    Verify VNet Configuration: Ensure devops-vnet allows internet access.
    Attach Public IP: A public IP named devops-pip already exists. Attach this public IP to the VM devops-vm to make it accessible from the internet.
    Ensure Accessibility: Confirm the VM devops-vm is accessible on port 80.

Notes:

    Create resources only in the East US region.
    Ensure the Network Security Group (NSG) is attached to the VM's NIC or subnet and configured to allow HTTP traffic on port 80.

* Go to the Vnet-->devops-vnet-->NSG
* Choose the NSG-->Create the inbound and outbound security rules for port 80
* Enter the public IP (devops-pip) and click associate.
* Enter the resource type as "network interface" and from network interface choose the VM listed.
* Tried ssh azureuser@public-ip didn't work
* Go to Vnet-->route table
* Choose the listed route table devops-rtb
* Delete the "Block Internet"
* Logged in to the VM and installed nginx:

```
sudo apt update
sudo apt install nginx -y
sudo systemctl status nginx
```
* Run curl http://public-ip:80
* Response received.
* Outbound rule can be deleted as by default we have AllowVnetOutBound & AllowInternetOutBound which is priority 65000 and 65001

When checked ended up with an error - "Route table 'devops-rtb' does not have a route to the internet."

