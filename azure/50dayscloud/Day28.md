**Day 28: Troubleshooting Public Virtual Network Configurations**

The Nautilus DevOps Team deployed an Nginx server on an Azure VM in a public VNet named xfusion-vnet. However, the server is still inaccessible from the internet.

As a DevOps team member, complete the following tasks:

    Verify VNet Configuration: Ensure xfusion-vnet allows internet access.
    Attach Public IP: A public IP named xfusion-pip already exists. Attach this public IP to the VM xfusion-vm to make it accessible from the internet.
    Ensure Accessibility: Confirm the VM xfusion-vm is accessible on port 80.

Notes:

    Create resources only in the East US region.
    Ensure the Network Security Group (NSG) is attached to the VM's NIC or subnet and configured to allow HTTP traffic on port 80.

**Steps tried**

* Search for nsg and choose xfusion-vmNSG
* Create the inbound and outbound security rules for port 80
* Enter the public IP (xfusion-pip) and click associate.
* Enter the resource type as "network interface" and from network interface choose the VMNic listed.
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

**Solution**

* Search for nsg and choose xfusion-vmNSG
* Create the inbound rules for port 80
* Enter the public IP (xfusion-pip) and click associate.
* Enter the resource type as "network interface" and from network interface choose the VMNic listed.    
* Go to Vnet-->route table
* Choose the listed route table xfusion-rtb
* Delete the "Block Internet"
* Go to xfusion-rtb route table and click add settings-->Routes 
* Add route-->destination type as IP addresses, CIDR as 0.0.0.0/0, next hop as Internet
* Logged in to the VM from azure client host and install nginx:

```
sudo apt update
sudo apt install nginx -y
sudo systemctl start nginx
sudo systemctl status nginx
```
* Go to VM and find the primary NIC public IP
* Run curl http://public-ip:80
* Response received.