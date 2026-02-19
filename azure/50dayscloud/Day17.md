**Create a Public Azure Blob Storage Container**

As part of the data migration process, the Nautilus DevOps team is actively creating several storage containers on Azure. They plan to utilize public Blob containers to store the relevant data. Given the ongoing migration of other infrastructure to Azure, it is logical to consolidate data storage within the Azure environment as well.

Create a new storage account named **nautilusst12176** and a public Blob container named **nautilus-blob-24629** within the storage account. Make sure anonymous read access for containers and blobs is enabled.

**Solution**:

* Go to the storage account and you will be navigated to storage center.
* Enter the storage account name "nautilusst12176".
* In the advanced section --> Allow enabling anonymous access on individual containers to be enabled and then click review+create-->create.
* Once created, go to the storage account.
* On the lfet side panel in the created storage account, there will be Data Storage-->containers-->click add container.
* Enter the container name "nautilus-blob-24629" and from the Anonymous access level dropdown choose--> Container (anonymous read access for containers and blobs).
* Click create after entering the container name.