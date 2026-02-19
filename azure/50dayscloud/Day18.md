**Copy Data to an Azure Blob Storage Container**

The Nautilus DevOps team is presently immersed in data migrations, transferring data from on-premise storage systems to Azure Blob containers. They have recently received some data that they intend to copy to one of the Blob containers.

A Blob container named **nautilus-blob-17934** already exists in the **eastus** region under the storage account **nautilusst7517**. Copy the file **/tmp/nautilus.txt** to the Blob container **nautilus-blob-17934**.

**Solution**:

* Go to the existing storage account and navigate to an existing container.
* Click those 3 dots of the container (nautilus-blob-17934) and click Generate SAS with read and write access.
* Copy the Blob SAS token and Blob SAS URL.
* Install the azcopy in the local machine using the following steps:

    * wget https://aka.ms/downloadazcopy-v10-linux
    * tar -xvf downloadazcopy-v10-linux
    * sudo cp ./azcopy_linux_amd64_*/azcopy /usr/bin/

* Use the following command to copy the file from the local machine to the azure blob container.

azcopy copy "C:\path\to\file.txt" "https://<storageaccount>.blob.core.windows.net/<container>/<blobname>?<SAS-token>"

* Once copied, go inside the azure blob continer **nautilus-blob-17934** to verify the file **nautilus.txt**