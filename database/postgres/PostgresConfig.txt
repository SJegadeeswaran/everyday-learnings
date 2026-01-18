    Steps to install and configure PostgreSQL v9.2.23 in Centos 7

    Step1: sudo yum install postgresql-server postgresql-contrib
    Step2: sudo postgresql-setup initdb
    Step3: Initializing database ... OK
    Step4: sudo systemctl start postgresql
    Step5: sudo systemctl enable postgresql
    Step6: sudo -u postgres psql -c "SELECT version();"

    Creating PostgreSQL Role and Database:

    Step1:  sudo -u postgres psql or
    Step2:  sudo su -postgres and then psql
    Step3:  CREATE ROLE john;
    Step4: CREATE DATABASE johndb;
    Step5: GRANT ALL PRIVILEGES ON DATABASE johndb TO john;

    To drop a user: DROP USER IF EXISTS username;
    To alter user: ALTER USER rolename WITH PASSWORD 'rolename';
                    ALTER USER "xxxx" WITH LOGIN;

    To exit out of the PostgreSQL shell, type: \q


   sudo systemctl restart postgresql;
   ss -nlt | grep 5432

   Adding IP address:

   Step1: Navigate to vi /var/lib/pgsql/data/postgresql.conf
   Step2: Add the following to the list:

   TYPE DATABASE USER ADDRESS METHOD
   host all      all  IP/32   trust

   If it is a docker network IP, then that IP range also has to be added in the above list.


   Source: https://linuxize.com/post/how-to-install-postgresql-on-centos-7/






