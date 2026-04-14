**Setting Up MySQL on a Virtual Machine in Azure**

The Nautilus DevOps team is tasked with integrating a PHP application hosted on an Azure VM with a MySQL database hosted on another Azure VM. This will validate the application's ability to connect to the database in the cloud.

    Create the MySQL VM:
        Create a VM named xfusion-mysql-vm using the MySQL Jetware image from the Azure Marketplace.
        Configure the VM in the Central US region.
        Use Password as the authentication type.
        Set the username as xfusion_admin and the password as Namin@123456.
        Allow inbound traffic on port 3306 to enable MySQL access.

    Setup the MySQL Database:
        SSH into the xfusion-mysql-vm.
        Use the sudo /jet/enter mysql command to access the MySQL shell.
        Create a database named xfusion_db.
        Create a MySQL user named xfusion_user with password password123.
        Grant all privileges on the xfusion_db database to this user.

    PHP VM Setup:
        A VM named xfusion-php-vm already exists in the East US region.
        This VM is hosting a PHP application and contains a pre-existing db_test.php file in the /var/www/html/ directory.

    Database Connection Configuration:
        Retrieve the public IP address of the xfusion-mysql-vm.
        Update the database connection settings in the db_test.php file to use the MySQL credentials and public IP address of the xfusion-mysql-vm.

    Validation:
        Access the db_test.php file from the xfusion-php-vm using its public IP address.
        Ensure the file displays the message Connected successfully, confirming the connection between the PHP application and the MySQL database.

Notes:

    Ensure the MySQL database allows inbound traffic on port 3306.
    Verify that the PHP application on the xfusion-php-vm successfully connects to the MySQL database on the xfusion-mysql-vm.


**Solution**

* Go to virtual machines and cick create VM
* Choose the default resource group and enter the virtual machine name
* Choose the region as CentralUS and the VM image as MySQL Jetware image.
* Choose the authentication type as password and enter the username and password.
* Go to the created VM resource
* Go to Networking-->Network settings-->Create port rule
* Click Inbound port rule--> Add source and destination as any-->Source port as '*' and destination port as 3306. Set action as allow
* login to the VM and use the following commands:

```
sudo /jet/enter mysql
CREATE DATABASE IF NOT EXISTS my_new_database;
CREATE DATABASE IF NOT EXISTS xfusion_db;
SHOW DATABASES;
USE my_new_database;
USE xfusion_db;
CREATE USER 'your_username'@'localhost' IDENTIFIED BY 'your_strong_password';
CREATE USER 'xfusion_user'@'%' IDENTIFIED BY 'password123';
GRANT ALL PRIVILEGES ON database_name.* TO 'your_username'@'localhost';
GRANT ALL PRIVILEGES ON xfusion_db.* TO 'xfusion_user'@'%';
```

* Login to xfusion-php-vm and get into the settings of db_test.php from 
/var/www/html/ directory.
* Update the servername, username, password and dbname.
* Go to the location of the folder /var/www/html/ and enter 
php db_test.php and we shall see Connected successfully or we can also do http://php-public-vm-ip/db_test.php to verify the connectivity.