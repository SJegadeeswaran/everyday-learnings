**Day 35: Configuring Virtual Network Peering**

The Nautilus DevOps team has been tasked with demonstrating the use of VNet Peering to enable communication between two VNets. One VNet will be a private VNet that contains a private Azure VM, while the other will be a public VNet containing a publicly accessible Azure VM.

1) Existing Azure Resources:

    Public VM: devops-pub-vm is already in the public VNet.
    Private VNet and VM: devops-priv-vnet and devops-priv-vm exist in the private VNet with its subnet: devops-priv-subnet.

2) Create VNet Peering:

    Create a VNet Peering between the Public VNet and Private VNet.
    VNet Peering Name: devops-pub-to-priv-peering.

3) Test the Connection:

    SSH into the public VM and verify that you can ping the private VM.

Notes:

    Create the resources only in the East US region.

**Solution**

* Search for virtual networks
* Click the public vnet "devops-pub-vnet"
* Click settings from the left panel and choose peerings
* Click add
* Enter the peering name as "devops-pub-to-priv-peering"
* From the dropdown of virtual Network choose "devops-priv-vnet"
* Enter the peering link name as "devops-pub-to-priv-peering" in the Local virtual network summary section
* Click add button below
* Search for virtual machines and choose devops-pub-vm
* Login to the public vm from azure client host - azureuser@publicip
* Enter the command - ping ipaddress of the private vm (devops-priv-vm) to check the peering between public VM and private VM.
