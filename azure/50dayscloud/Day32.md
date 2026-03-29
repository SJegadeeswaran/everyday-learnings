**Day 32: Synchronizing Containers Using the CLI**

As part of a data migration project, the team lead has tasked the team with migrating data from an existing Azure Blob container to a new Blob container. The existing container contains a substantial amount of data that must be accurately transferred to the new container. The team is responsible for creating the new Blob container and ensuring that all data from the existing container is copied or synced to the new container completely and accurately. It is imperative to perform thorough verification steps to confirm that all data has been successfully transferred to the new container without any loss or corruption.

As a member of the Nautilus DevOps Team, your task is to perform the following:

Create a New Private Azure Blob Container: Name the container datacenter-dest-10095 under the storage account datacenterst21460.

Data Migration: Migrate the file datacenter.txt from the existing datacenter-source-4761 container to the new datacenter-dest-10095 container.

Ensure Data Consistency: Ensure that both containers have the file datacenter.txt and confirm the file content is identical in both containers.

Use Azure CLI: Use the Azure CLI to perform the creation and data migration tasks.

**Solution**

```
az storage container create --name <container-name> --account-name <storage-account-name> --auth-mode login --public-access off

--auth-mode login denotes:	
“Don’t use account keys or SAS tokens — use my Azure identity (RBAC) instead.”

az storage container create --name datacenter-dest-15861  --account-name datacenterst701 --auth-mode login --public-access off

Copy using login (as there is no SAS URL)

az storage blob copy start --account-name mystorageaccount --destination-container container2 --destination-blob file.txt --source-container container1 --source-blob file.txt --auth-mode login

az storage blob copy start --account-name datacenterst701  --destination-container datacenter-dest-15861  --destination-blob datacenter.txt --source-container datacenter-source-2926 --source-blob  datacenter.txt --auth-mode login

To ensure data consistency between two containers by checking the size and last modified:

az storage blob show --account-name <account> --container-name container1 --name file.txt --query "{size:properties.contentLength, lastModified:properties.lastModified}"

az storage blob show --account-name datacenterst701 --container-name datacenter-dest-15861 --name datacenter.txt --query "{size:properties.contentLength, lastModified:properties.lastModified}"

az storage blob show --account-name datacenterst701 --container-name datacenter-source-2926 --name datacenter.txt --query "{size:properties.contentLength, lastModified:properties.lastModified}"
```