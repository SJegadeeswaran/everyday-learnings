**Assigning Public IP to Virtual Machines**

The Nautilus DevOps Team has received a new request from the Development Team to set up a new Azure Virtual Machine (VM). This VM will be used to host a new application that requires a stable public IP address. To ensure that the VM has a consistent public IP, a Static Public IP address needs to be associated with it. The VM will be named xfusion-vm, and the Static Public IP will be named xfusion-pip. This setup will help the Development Team to have a reliable and consistent access point for their application.

Create an Azure VM named xfusion-vm using any available Ubuntu image, with the VM size Standard_B1s.

Generate an SSH public key on the azure-client host and associate it with the VM for SSH access.

Associate a Static Public IP address named xfusion-pip with this VM.

Ensure the VM is accessible via SSH using the generated public key.

**Solution**:

* Go to the provided kodekloud terminal and do the ssh-keygen to generate id_rsa.pub file.
* Create a VM from the Azure portal with the specified region.
* While creating choose "Use existing public key" option from the dropdown for SSH public key source.
* Copy the public key in the SSH public key field.
* In the networking section, create public IP named "xfusion-pip". 
* Once VM is created, login to the VM using ssh azureuser@public-ip