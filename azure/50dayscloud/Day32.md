**Day 32: Synchronizing Containers Using the CLI**

As part of a data migration project, the team lead has tasked the team with migrating data from an existing Azure Blob container to a new Blob container. The existing container contains a substantial amount of data that must be accurately transferred to the new container. The team is responsible for creating the new Blob container and ensuring that all data from the existing container is copied or synced to the new container completely and accurately. It is imperative to perform thorough verification steps to confirm that all data has been successfully transferred to the new container without any loss or corruption.

As a member of the Nautilus DevOps Team, your task is to perform the following:

Create a New Private Azure Blob Container: Name the container datacenter-dest-10095 under the storage account datacenterst21460.

Data Migration: Migrate the file datacenter.txt from the existing datacenter-source-4761 container to the new datacenter-dest-10095 container.

Ensure Data Consistency: Ensure that both containers have the file datacenter.txt and confirm the file content is identical in both containers.

Use Azure CLI: Use the Azure CLI to perform the creation and data migration tasks.

**Solution**

*  az storage container create --account-name datacenterst21460  --name datacenter-dest-10095  --auth-mode login 