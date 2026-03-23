**Securing Virtual Machine SSH Access**

The Nautilus DevOps team needs to set up a new Virtual Machine (VM) on the Azure cloud that can be accessed securely from their landing host (azure-client). Follow the steps below to complete this task:

    Create an SSH Key: On the azure-client host, check if an SSH key already exists. If it doesn’t exist, create a new SSH key on the azure-client host that will be used for password-less SSH access.

    Create a Virtual Machine: Use the Azure Portal or Azure CLI to create a new Virtual Machine named datacenter-vm in the westus region. Set the VM size to Standard_B1s and configure the VM with SSH access for the azureuser account using the newly created SSH key.

    Configure SSH Access: Ensure that the SSH key from the azure-client host is added to the azureuser account on datacenter-vm, enabling secure, password-less SSH access from the azure-client host.

    Verify Connectivity: Test the connection from azure-client to datacenter-vm using SSH to confirm that password-less access has been set up correctly.

Complete these tasks entirely within the Azure Portal or Azure CLI.

**Solution**:

* Type ssh-keygen from azure-client host and generate id_rsa.pub
* Create Azure VM named 'datacenter-vm' from the portal using the public key and choose the given VM size and region.
* Select the disk as Standard_SSD
* Once created login to the azure vm from azure-client host.