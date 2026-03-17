**Create an Azure Virtual Machine**

The Nautilus DevOps team is planning to migrate a portion of their infrastructure to the Azure cloud incrementally. As part of this migration, you are tasked with creating an Azure Virtual Machine (VM).

The requirements are:

1) Use the existing resource group.

2) The VM name must be datacenter-vm, it should be in West US region.

3) Use the Ubuntu 22.04 LTS image for the VM.

4) The VM size must be Standard_B1s.

5) Attach a default Network Security Group (NSG) that allows inbound SSH (port 22).

6) Attach a 30 GB storage disk of type Standard HDD.

7) The rest of the configurations should remain as default.

After completing these steps, make sure you can SSH into the virtual machine.

**Solution**:

* Type Virtual Machine from the Azure portal.
* Select the required parameters from the dropdown as specified.
* Choose a disk as specified and a network security group allowing port 22.
* Create a VM.
* The pem file would be downloaded to the local machine from a prompt.
* Copy the pem file to the azure-client host and try logging in to the VM using ssh -i pemfile username@publicIP.