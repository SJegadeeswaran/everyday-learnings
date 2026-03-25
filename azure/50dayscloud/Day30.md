**Day 30: Create Azure SQL Database**

The Nautilus Devops team is strategizing the migration of a portion of their infrastructure to Azure. Recognizing the scale of this undertaking, they have opted to approach the migration in incremental steps rather than as a single massive transition. Recently, they started working on creating and configuring some database instances on Azure.

For this task, create one publicly accessible Azure SQL Database instance along with the following details:

1) The name of the Azure SQL Database must be xfusion-sqldb.

2) The server name must be xfusion-server-15846 under southcentralus.

3) The compute + storage configuration should be Basic (For less demanding workloads).

4) The backup storage redundancy should be Locally-redundant backup storage.

5) Set the login admin username to xfusion-admin and set an appropriate password.

6) Set the database size to 2 GiB.

7) Keep the rest of the configurations as default. Finally, make sure the database is in the Ready state before submitting this task.


**Solution**

* Search for Azure SQL Database.
* Click create and enter the database name.
* Click the server details and enter the server name, location, authentication method as "Use SQL authentication" and enter the server admin login with password and confirm password.
* Click configure database from compute+storage and choose the service tier as  Basic (For less demanding workloads) and database size to 2GiB
* Choose backup storage redundancy as "Locally-redundant backup storage"
* Click review+create-->create.