
**Day 41: Working with Azure Table Storage**

The Nautilus DevOps team is developing a simple 'To-Do' application using Azure Table Storage to store and manage tasks efficiently. The team needs to create an Azure Table to hold tasks, each identified by a unique taskId. Each task will have a description and a status, which indicates the progress of the task (e.g., 'completed' or 'in-progress').

Your task is to:

    Create an Azure Storage Account named datacentertablest7989 with a Table Storage table called tasks.
    Insert the following tasks into the table:
        Task 1: PartitionKey: 'tasks', RowKey: '1', description: 'Learn Table Storage', status: 'completed'
        Task 2: PartitionKey: 'tasks', RowKey: '2', description: 'Build To-Do App', status: 'in-progress'
    Verify that Task 1 has a status of 'completed' and Task 2 has a status of 'in-progress'.

Note: Use the Azure CLI to insert these tasks into the table.

Notes:

    Create the resources only in the eastus region.

**Solution**

* Search for storage accounts-->Click create.
* Enter the storage account name and choose region.
* Go to the created storage account-->Choose Data Storage-->Tables.
* Click + Table-->Enter the table name as tasks.
* Go to Security + Networking-->Choose access keys and copy the key from key1 or key2 to your local.

```
az storage entity insert --account-name <YourStorageAccountName> --table-name <YourTableName> --entity PartitionKey=Tasks RowKey=001 Title="" Status="" --account-key <YourAccountKey>

az storage entity insert --account-name datacentertablest7989 --table-name tasks --entity PartitionKey=tasks RowKey=1 description='Learn Table Storage' Status='completed' --account-key key1

az storage entity insert --account-name datacentertablest7989 --table-name tasks --entity PartitionKey=tasks RowKey=2 description='Build To-Do App' Status='in-progress' --account-key key1
```
To verify:

```
az storage entity query --table-name tasks --account-name <YourStorageAccountName> --output table

az storage entity query --table-name tasks --account-name datacentertablest7989 --output table
```

**Error**:

'Task 1' was not inserted with the correct status.

**Solution**

The user parameter status to be in lowercase instead of Status.

```
az storage entity insert --account-name <YourStorageAccountName> --table-name <YourTableName> --entity PartitionKey=Tasks RowKey=001 Title="" Status="" --account-key <YourAccountKey>

az storage entity insert --account-name datacentertablest7989 --table-name tasks --entity PartitionKey=tasks RowKey=1 description='Learn Table Storage' status='completed' --account-key key1

az storage entity insert --account-name datacentertablest7989 --table-name tasks --entity PartitionKey=tasks RowKey=2 description='Build To-Do App' status='in-progress' --account-key key1
```
To verify:

```
az storage entity query --table-name tasks --account-name <YourStorageAccountName> --output table

az storage entity query --table-name tasks --account-name datacentertablest7989 --output table
```