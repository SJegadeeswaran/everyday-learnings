**Day 47: SQL Database Migration and Setup**

The Nautilus DevOps team is strategizing the migration of a portion of their infrastructure to Azure. Recognizing the scale of this undertaking, they have opted to approach the migration in incremental steps rather than as a single massive transition. As part of this migration, they are focusing on setting up and managing Azure SQL Databases, implementing backup processes, and ensuring data recovery. Below are the tasks they require you to perform:

Task 1: Create an Azure SQL Database
Create a publicly accessible Azure SQL Database instance with the following details:

Database Name: datacenter-sqldb.
Server Name: datacenter-server-19462.
Location: West US
Backup Storage Redundancy: Locally-redundant backup storage.
Hardware Configuration: Basic (For less demanding workloads).
Admin Username: datacenter-admin.
Admin Password: Set an appropriate password.
Database Size: Set to 2 GiB.
Keep all other configurations as default.
Ensure the database is in the Ready state.

Task 2: Create a Storage Account
Create a Storage Account named datacenterst1884.
Configure a Blob Container named datacenter-container-873 within this storage account.
Task 3: Backup the Azure SQL Database
Take a backup of the Azure SQL Database instance datacenter-sqldb and store it in the Blob Container:

Storage Account: datacenterst1884.
Blob Container: datacenter-container-873.
Backup File Name: datacenter-db-backup.
Ensure the backup is fully exported to the blob container.

Task 4: Download the Backup
Download the backup file from the Blob Container to the /opt directory on the azure-client host.
Ensure the file is accessible and properly named based on its extension.
Requirements for Completion
Ensure the SQL Database is in the Ready state.
Confirm the backup is stored in the specified Blob Container.
Verify the backup file is successfully downloaded to the /opt directory on the client host.

**Solution**

* Search for Azure SQL database.
* Click create SQL database.
* Choose the default resource group.
* Enter the database name, server name and region.
* Choose backup storage redundancy as locally-redundant backup storage.
* In the Compute + storage click configure database
* Choose service tier as Basic (For less demanding workloads)
* Choose the data size as 2GB and click apply.

