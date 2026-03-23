**Convert Public Azure Blob Container to Private**

The Nautilus DevOps team has been using Azure Blob Storage to manage their data. Recently, they realized that one of their containers, currently public, needs to be restricted for internal use only. Your task is to convert a public Azure Blob container to private.

Two blob containers named **datacenter-container-2061** and **datacenter-priv-3623** are available in the westus region within the storage account **datacenterst16836**. The **datacenter-container-2061** is currently public, and **datacenter-priv-3623** is private.

1) Convert the blob container **datacenter-container-2061** from public to private while leaving **datacenter-priv-3623** unchanged.

2) Make sure the access level for datacenter-container-2061 is set to private with no public access.

**Solution**:

* Go to the existing storage account (**datacenterst16836**) and navigate to existing containers (view both public and private containers).
* Click on the public container(**datacenter-container-2061**)
* Click change access level and from the dropdown change to private (no anonymous access).
* Verify that the **datacenter-container-2061** would have changed to private - "anonymous access level" from the data storage-->containers.