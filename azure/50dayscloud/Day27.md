**Deploying Virtual Machines in a Private Virtual Network**

The Nautilus DevOps team is expanding their Azure infrastructure and requires the setup of a private Virtual Network (VNet) along with a subnet. This VNet and subnet configuration will ensure that resources deployed within them remain isolated from external networks and can only communicate within the VNet. Additionally, the team needs to provision a Virtual Machine (VM) under the newly created private VNet. This VM should be accessible over SSH from within the VNet only, allowing for secure communication and resource management within the Azure environment.

The name of the VNet must be datacenter-priv-vnet, create a subnet named datacenter-priv-subnet under the same. Further, create a Virtual Machine named datacenter-priv-vm under this VNet. Additionally, create a Network Security Group (NSG) named datacenter-priv-nsg, and ensure that the NSG rules for the VM allow access only from within the VNet's CIDR block. Ensure all resources are created in the Central US region.

Notes:

    Create the resources only in the Central US region.

**Solution**

* Go to Vnet-->Click create.
* Enter the vnet name as specified.
* Under IP addresses-->Click add Subnet.
* Enter the subnet name as specified.
* Click Review + Create-->Create.
* Go to CreateVM.
* Enter the VM name as specified-->Choose the VM image.
* Make availability options-->No infrastructure redundancy required.
* Choose disk as Standard HDD.
* In the networking section make sure the virtual network and subnet are selected as the one it is created earlier.
* Go to the NSG-->Settings-->Click Inbound Security rules-->Add
* Choose the source as IP address and enter the source IP addresses/CIDR ranges as defined in the private vnet while creating.
* Choose the desination as IP address and enter the destination IP addresses/CIDR ranges as defined in the private vnet while creating.
* Source port ranges as *, Service as SSH (as requested in the question), Destination port ranges as 22, protocol as "Any", Action as "Allow".
* Enter the rule name and description.
* Click Add.

The reason to add destination IP address with CIDR range is that, the traffic should not go to other resources in other vnet range. Eg. If source VM has to communicate and receive traffic only from particular vnet hosted for a DB.

Associating a Network Security Group (NSG) to a subnet in Microsoft Azure is mainly about centralized and consistent traffic control.


**Control traffic at a broader level**

When you attach an NSG to a subnet, its rules apply to all resources inside that subnet (VMs, NICs, etc.).
This avoids having to configure rules individually for each resource.

Example: Allow only port 80 (HTTP) for all web servers in a subnet.

**Simplify management**

Instead of managing multiple NSGs per VM, you define rules once at the subnet level.

Easier to maintain
Fewer chances of configuration mistakes
Better for large-scale environments

**Consistency across resources**

Any new resource added to that subnet automatically inherits the same security rules.

Associating an NSG with a subnet helps you:

Apply uniform security policies.
Reduce administrative overhead.
Segment your network securely.
Ensure automatic rule enforcement for all resources in that subnet.


* Go to NSG settings --> Subnet
* Click + Associate and select the "datacenter-priv-subnet"

**Note**

For this question, since it is only the VM resource we have added the nsg is not associated to a subnet.