**Day 42: Backup and Delete Azure Storage Blob Container**

The Nautilus DevOps team is currently engaged in a cleanup process, focusing on removing unnecessary data and services from their Azure environment. As part of the migration process, several resources were created for one-time use only, necessitating a cleanup effort to optimize their Azure environment.

A private blob container named datacenter-blob-12695 already exists in the centralus region under storage account datacenterst16342.

1) Copy the contents of datacenter-blob-12695 blob container to the /opt directory on the azure-client host (the landing host once you load this lab).

2) Delete the blob container datacenter-blob-12695 from the storage account.

**Solution**

```
az storage blob download-batch --account-name <your_storage_account> --source <container_name> --destination <local_directory_path> --auth-mode login
az storage blob download-batch --account-name datacenterst16342 --source datacenter-blob-12695 --destination /opt --auth-mode login

az storage container delete --account-name <storage-account-name> --name <container-name> --auth-mode login
az storage container delete --account-name datacenterst16342 --name datacenter-blob-12695 --auth-mode login
```    
* Login to the azure portal
* Go to the storage account-->Data storage-->Containers
* Verify whether the container is deleted.