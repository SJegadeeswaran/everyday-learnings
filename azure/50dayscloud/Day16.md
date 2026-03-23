**Create a Private Azure Blob Storage Container**

As part of the data migration process, the Nautilus DevOps team is actively creating several storage containers on Azure. They plan to utilize private Blob containers to store the relevant data. Given the ongoing migration of other infrastructure to Azure, it is logical to consolidate data storage within the Azure environment as well.

Create a new storage account named **datacenterst623** and a private Blob container named **datacenter-blob-13590** within the storage account.

**Solution**:

* Go to the storage account and you will be navigated to storage center.
* Enter the storage account name "datacenterst623" and click review+create-->create.
* Once created, go to the storage account.
* On the lfet side panel in the created storage account, there will be Data Storage-->containers-->click add container.
* Enter the container name "datacenter-blob-13590" and by default we will see Anonymous access level was set to "Private (no anonymous access)" and disabled. This is because while creating storage accounts-->in the advanced section --> Allow enabling anonymous access on individual containers--> will be disabled by default.
* Click create after entering the container name.