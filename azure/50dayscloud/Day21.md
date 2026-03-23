**Assigning Public IP to Virtual Machines**

The Nautilus DevOps Team has received a new request from the Development Team to set up a new Azure Virtual Machine (VM). This VM will be used to host a new application that requires a stable public IP address. To ensure that the VM has a consistent public IP, a Static Public IP address needs to be associated with it. The VM will be named nautilus-vm, and the Static Public IP will be named nautilus-pip. This setup will help the Development Team to have a reliable and consistent access point for their application.

Create an Azure VM named nautilus-vm using any available Ubuntu image, with the VM size Standard_B1s.

Generate an SSH public key on the azure-client host and associate it with the VM for SSH access.

Associate a Static Public IP address named nautilus-pip with this VM.

Ensure the VM is accessible via SSH using the generated public key.

Notes:

    Perform all operations in the Central US region.

**Solution**:

* Go to the provided azure client host (kodekloud terminal) and do the ssh-keygen to generate id_rsa.pub file.
* Create a VM from the Azure portal.
* Enter the VM name (nautilus-vm) as provided and choose availability option as "no infrastructure redundancy required" and security type as "Trusted launch virtual machines".
* Enter VM size as Standard_B1s and Image as Ubuntu 24
* While creating choose "Use existing public key" option from the dropdown for SSH public key source.
* Copy the public key in the SSH public key field.
* In the disks section, choose OS disk type as "Standard HDD"  
* In the networking section, click create new for the public IP and enter name as "nautilus-pip"-->click OK.
* Click Review + create --> create
* Go the created VM and navigate to Networking section-->network settings-->click network interface-->IP configurations
* Click the ipconfig1 and verify the public IP address settings and the associate public ip address will be enabled for nautilus-pip.   
* Once VM is created, login to the VM using ssh azureuser@public-ip from azure client host (kodekloud terminal).