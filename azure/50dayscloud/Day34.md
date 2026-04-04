**Day 34: Enabling Internet Connectivity for Virtual Machines**

The Nautilus DevOps team has encountered an issue with an Azure VM named nautilus-vm. They are unable to install any packages on this VM due to connectivity issues. The team needs to identify the root cause of the problem and resolve it to restore normal operations.

    Investigate the connectivity issue preventing package installation on the Azure VM nautilus-vm.
    Implement a solution to resolve the connectivity issue and restore package installation capabilities on the VM.

Note: The SSH key required to access the Azure VM is already created and added to the VM's authorized keys. You can find the SSH key at /root/.ssh/id_rsa on the azure-client host.

Notes:

    Create the resources only in the East US region.

**Solution**

* Login to the VM using azureuser@publicip.
* Try running sudo apt-get update and the packages didn't get downloaded.
* Login to the azure portal and check the NSG.
* Delete the rule which blocks all outbound.
* Try running sudo apt-get update and the packages are now getting downloaded from the azure-client host.