**Day 38: Running Containers on Azure Virtual Machines**

The Nautilus DevOps team needs to set up an Azure Virtual Machine (VM) to interact with an Azure Blob Storage container for storing and retrieving data. The team must create a private storage account, configure Blob Storage, and test the functionality.
Task:

1) Azure Virtual Machine Setup:

    The VM named xfusion-vm already exists in the East US region.

2) Create a Private Storage Account and Blob Container:

    Create a storage account named xfusionstor3254 in the East US region with Locally-redundant storage (LRS).
    Create a private Blob container named xfusion-container3254.

3) Retrieve Storage Account Key:

    Get the storage account's access key to configure access for the application.

4) Create a Test File:

    SSH into the VM and create a file named testfile.txt in the /home/azureuser directory with content: "this is a test file".

5) Upload the File to Blob Storage:

    Upload the testfile.txt file to the Blob container xfusion-container3254 using the Azure CLI command:

    az storage blob upload --account-name xfusionstor3254 --account-key <access-key> --container-name xfusion-container3254 --name testfile.txt --file /home/azureuser/testfile.txt

Notes:

    Create the resources only in the East US region.
    Use the Azure Portal or Azure CLI for resource creation.
    Ensure the storage account is private and secure.

**Solution**

* Go to storage accounts-->Click create
* Enter the storage account name in the East US region with Locally-redundant storage (LRS).
* Click Review+Create-->Create
* Go to the created storage account-->Data Storage-->Containers
* Click add container and make sure the anonymous access level is private and click create.
* Under Security+Networking-->Click access keys
* Copy the key and connection string
* Go to virtual machines and copy the public IP of the existing VM
* Since I couldn't login, I generated the pem file again from the VM-->Help section-->Reset password-->Enter the key pair name-->Update
* Create a test file with the contents
* Upload the file to the blob container using the following azure cli command

```
az storage blob upload --account-name <account-name> --account-key <access-key> --container-name <container-name> --name testfile.txt --file /home/azureuser/testfile.txt
```