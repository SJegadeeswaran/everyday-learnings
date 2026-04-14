**Setting Up MySQL on a Virtual Machine in Azure**

The Nautilus DevOps team is tasked with integrating a PHP application hosted on an Azure VM with a MySQL database hosted on another Azure VM. This will validate the application's ability to connect to the database in the cloud.

    Create the MySQL VM:
        Create a VM named datacenter-mysql-vm using the MySQL Jetware image from the Azure Marketplace.
        Configure the VM in the Central US region.
        Use Password as the authentication type.
        Set the username as datacenter_admin and the password as Namin@123456.
        Allow inbound traffic on port 3306 to enable MySQL access.

    Setup the MySQL Database:
        SSH into the datacenter-mysql-vm.
        Use the sudo /jet/enter mysql command to access the MySQL shell.
        Create a database named datacenter_db.
        Create a MySQL user named datacenter_user with password password123.
        Grant all privileges on the datacenter_db database to this user.

    PHP VM Setup:
        A VM named datacenter-php-vm already exists in the East US region.
        This VM is hosting a PHP application and contains a pre-existing db_test.php file in the /var/www/html/ directory.

    Database Connection Configuration:
        Retrieve the public IP address of the datacenter-mysql-vm.
        Update the database connection settings in the db_test.php file to use the MySQL credentials and public IP address of the datacenter-mysql-vm.

    Validation:
        Access the db_test.php file from the datacenter-php-vm using its public IP address.
        Ensure the file displays the message Connected successfully, confirming the connection between the PHP application and the MySQL database.

Notes:

    Ensure the MySQL database allows inbound traffic on port 3306.
    Verify that the PHP application on the datacenter-php-vm successfully connects to the MySQL database on the datacenter-mysql-vm.

**Solution**

* Go to virtual machines and cick create VM
* Choose the default resource group and enter the virtual machine name
* Choose the region as CentralUS
* Choose the authentication type as password and enter the username and password.
* Go to the created VM resource
* Go to Networking-->Network settings-->Create port rule
* Click Inbound port rule--> Add source and destination as any-->Source port as '*' and destination port as 3306. Set action as allow
* login to the VM and install mysql using the following commands:

```
sudo apt update
sudo apt install mysql-server -y
sudo mysql_secure_installation
sudo systemctl status mysql
```

```
Step-by-Step Installation for MySQL on Ubuntu 24.04

    Update Package Index
    Ensure your local package index is up to date:
    bash

    sudo apt update

    Install MySQL Server
    Install the mysql-server package, which is included in the default Ubuntu 24.04 repositories:
    bash

    sudo apt install mysql-server -y

    Secure MySQL Installation
    Run the security script to set a root password, remove anonymous users, disallow remote root login, and remove the test database:
    bash

    sudo mysql_secure_installation

    Follow the prompts, setting a strong password and choosing 'Y' (Yes) for recommended security settings.
    Verify Service Status
    Confirm that the MySQL service is active and running:
    bash

    sudo systemctl status mysql

    If it is not running, start it with sudo systemctl start mysql. 

Accessing MySQL
You can log in as the root user using sudo without a password initially, as it uses the auth_socket plugin by default: 
bash

sudo mysql

Managing the Service

    Stop: sudo systemctl stop mysql
    Start: sudo systemctl start mysql
    Restart: sudo systemctl restart mysql
    Enable on boot: sudo systemctl enable mysql
```

* Create a database in mysql with username and password and grant all privileges on the database to this user.

Using Command Line (SQL)
This method is standard for developers and administrators. 

    Log in to MySQL: Open your terminal or MySQL Command Line Client and log in with an account that has administrative privileges (typically root).
    bash

    mysql -u root -p (can be skipped)

    Create the Database: Use the CREATE DATABASE statement followed by your desired name. It is recommended to use the IF NOT EXISTS clause to avoid errors if the name is already taken.
    sql

    ```
    CREATE DATABASE IF NOT EXISTS my_new_database;
    ```

    Verify Creation: List all databases to ensure yours is there.
    sql

    ```
    SHOW DATABASES;
    ```

    Select the Database: To start creating tables or adding data, you must tell MySQL which database to use.
    sql

    ```
    USE my_new_database;
    ``` 

```
CREATE USER 'datacenter_user'@'%' IDENTIFIED BY 'password123';
GRANT ALL PRIVILEGES ON database_name.* TO 'datacenter_user'@'%';
```

Show unique usernames only:

```
SELECT DISTINCT User FROM mysql.user;
```

This helps if you have multiple entries for the same user name with different host permissions.

Checking User Privileges
Once you have the username and host, you can check what that specific user is allowed to do: 

    Show privileges for a specific user:

    ```
    SHOW GRANTS FOR 'username'@'host';
    ```
```
SHOW GRANTS FOR 'datacenter_user'@'%';
``` 

* Login to datacenter-php-vm and get into the settings of db_test.php from /var/www/html/ directory.
* Update the servername, username, password and dbname.
 