**Day 46: EventHub to Blob Storage Integration Setup**

The Nautilus DevOps team wants to integrate an Azure Virtual Machine with Azure Event Hubs and Azure Blob Storage for centralized log collection and backup. Follow these steps to complete the task:

    Create Azure Event Hubs Namespace:
        Create an Event Hubs namespace named devops-namespace in the East US region.
        Select the Standard pricing tier. Make sure to enable Enable Auto-inflate.

    Create an Event Hub:
        Within the namespace, create an Event Hub named devops-hub.

    Set Up Azure Blob Storage for Log Backup:
        Create a Storage Account named devopsst5747 in the East US region.
        Create a container named devops-backup-5953 within the Storage Account.
        Ensure the container is publicly accessible for read operations.

    Verify the Virtual Machine Configuration:
        The client host already has a Python script named send_logs.py located under /root. This script is used to send logs to the Event Hub.
        Create a Virtual Machine named devops-vm in the East US region.
        Copy the send_logs.py script from the client host to the /home/azureuser directory of the devops-vm.
        Modify the script on the VM to also back up the logs to the devops-backup-5953 container in the Azure Blob Storage account.

    Verify Logs:
        Ensure the logs are successfully sent to the Event Hub by checking the Event Hubs metrics in the Azure portal.
        Verify that the logs are backed up to the devops-backup-5953 container in the Azure Blob Storage.

Notes:

    Create the resources only in the East US region.
    Use the existing client host to copy the script to the VM.
    Verify both the Event Hubs metrics and the Blob Storage container for successful log ingestion and backup.

**Solution**

* Search for event hub.
* Click event hub-->create.
* Choose the default resource group and enter the namespace name.
* Choose pricing tier, region and enable auto-inflate.
* Click review+create.
* Go to the created resource.
* Click + Event Hub on the top.
* Enter the event hub name and click review+create.
* Search for storage accounts-->Click create.
* Enter the storage account name and region as EastUS.
* Once created, go to the created storage account-->overview-->properties-->click blob anonymous access
* Choose enabled-->Click save. The same can be done from Storage account-->Settings-->Configuration.
* Go to the created storage account-->Click Data Storage from the left side panel.
* Choose containers-->Click add containers.
* Enter the container name and choose Blob (anonymous read access for blobs only) and click create. 
* Search for virtual machines.
* Choose the default resource group, enter the VM name and change VM size.
* Choose a region and click Review + create.
* Choose availability zone as zone2 and OS disk type to Standard HDD.
* Click the created blob and choose security+networking.
* Click access keys and copy the connection string.
* Update the URL's in the python script for blob.
* Go to the event hub namespace-->Settings.
* Click Shared access policies and from RootManageSharedAccessKey, copy the primary connection string.
* Update the connection string in the python script for eventhub connection string.
* Check the backup name in the python script.
* Copy the python script to the azure VM using scp command: 

scp -i devops_key.pem send_logs.py azureuser@20.81.44.79:/home/azureuser/
send_logs.py

* Execute the python script using "python3 send_logs.py"

```
Traceback (most recent call last):
  File "/home/azureuser/send_logs.py", line 2, in <module>
    from azure.storage.blob import BlobServiceClient
ModuleNotFoundError: No module named 'azure'
```

Got to know the following modules to be installed:

```
pip install azure-identity
pip install azure-storage-blob

sudo apt update
sudo apt install python3-pip

azureuser@devops-vm:~$ pip install azure-identity
error: externally-managed-environment

× This environment is externally managed
╰─> To install Python packages system-wide, try apt install
    python3-xyz, where xyz is the package you are trying to
    install.
    
    If you wish to install a non-Debian-packaged Python package,
    create a virtual environment using python3 -m venv path/to/venv.
    Then use path/to/venv/bin/python and path/to/venv/bin/pip. Make
    sure you have python3-full installed.
    
    If you wish to install a non-Debian packaged Python application,
    it may be easiest to use pipx install xyz, which will manage a
    virtual environment for you. Make sure you have pipx installed.
    
    See /usr/share/doc/python3.12/README.venv for more information.

sudo python3 -m venv ~/logenv
The virtual environment was not created successfully because ensurepip is not
available.  On Debian/Ubuntu systems, you need to install the python3-venv
package using the following command.

sudo apt install python3.12-venv

 # Create the Virtual Environment
 python3 -m venv ~/logenv
  
 # Activate the Virtual Environment
 source ~/logenv/bin/activate
  
 # Install Azure SDKs (Inside venv)
 pip install azure-eventhub azure-storage-blob
 pip list | grep azure
 
 python3 send_logs.py
```

* Go to the created event hub
* Click the created namespace
* From the overview we shall see the data for requests. 
* Go to the created storage account-->Click container - devops-backup-3323
* logs.txt file will be created.