**Day 36: Managing Storage Lifecycle in Azure**

The Nautilus DevOps team needs to optimize data retention costs by automating the deletion of old blobs. They plan to implement Blob Lifecycle Management for a specific container in Azure Storage.
Task:

1) Create a Storage Account:

    Name the storage account xfusionstor1106.
    Set the region to East US.
    Use Locally-redundant storage (LRS) as the redundancy option.

2) Create a Blob Container:

    Name the container xfusion-container1106.

3) Upload a File to the Container:

    Upload the file named tempfile.txt to the container. The file is present under /root of the client host.

4) Configure Blob Lifecycle Management:

    Apply a Lifecycle Management rule named xfusion-del-rule to the container xfusion-container1106 to delete blobs after 7 days of last modification.

5) Validation:

    Verify that the Lifecycle Management rule named xfusion-del-rule is correctly applied.

Notes:

    Create the resources only in the East US region.
    Use the Azure Portal or Azure CLI for resource creation.
    Ensure the storage account and container are properly configured.

**Solution**

* Search for the storage account and click create.
* Enter the storage account name, region and redundancy-->Click create.
* Go to the created container and click Data Storage-->Containers.
* Click add container and enter the blob container name-->Click create.
* Enter the following command to upload a file to the blob container.

```
az storage blob upload --account-name <your_storage_account> --container-name <your_container> --name <blob_name_in_azure> --file <local_path_to_file> --auth-mode login.

az storage blob upload --account-name xfusionstor1106 --container-name xfusion-container1106 --name tempfile.txt --file /root/tempfile.txt --auth-mode login
```
* Go to the created storage account-->Data management-->Lifecycle management-->Click add a rule.
* Check all the other options and click next.
* In the base blobs section, choose last modified and enter 7 (more than section) then "delete the blob"-->Click add.