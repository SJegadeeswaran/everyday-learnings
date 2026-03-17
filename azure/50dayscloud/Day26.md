**Deploying Virtual Machines in a Public Virtual Network**

The Nautilus DevOps Team has received a request from the Networking Team to set up a new public VNet to support a set of public-facing services. This VNet will host various resources that need to be accessible over the internet. As part of this setup, you need to ensure the VNet has public subnets with automatic public IP assignment for resources. Additionally, a new VM will be launched within this VNet to host public applications that require SSH access. This setup will enable the Networking Team to deploy and manage public-facing applications.

Create a public VNet named xfusion-pub-vnet, and a subnet named xfusion-pub-subnet under the same, make sure public IP is being auto-assigned to resources under this subnet. Further, create a VM named xfusion-pub-vm under this VNet. Make sure SSH port 22 is open for this instance and accessible over the internet. Use the Azure portal to complete the task and ensure that SSH access is configured correctly.

Notes:

    Create the resources only in the East US region.

**Solution**

* Go to Vnet-->Click create.
* Enter the vnet name as specified.
* Under IP addresses-->Click add Subnet.
* Enter the subnet name as specified.
* Click Review + Create-->Create.
* Go to CreateVM.
* Enter the VM name as specified-->Choose the VM image.
* Make availability options-->No infrastructure redundancy required.
* Choose disk as Standard SSD.
* In the networking section make sure the virtual network and subnet are selected as the one it is created earlier.
* Click create.
* Copy the pem file downloaded in the local machine to the azure-client host or the same the connected from the local machine also.
* Login ssh -i <pemfile> username@publicIP.