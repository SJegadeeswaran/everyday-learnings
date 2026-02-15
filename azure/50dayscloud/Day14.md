**Create and Attach Managed Disks in Azure**

The Nautilus DevOps team is strategizing the migration of a portion of their infrastructure to the Azure cloud. 
Recognizing the scale of this undertaking, they have opted to approach the migration in incremental steps rather than as a single massive transition. 
To achieve this, they have segmented large tasks into smaller, more manageable units. 

This granular approach enables the team to execute the migration in gradual phases, ensuring smoother implementation and minimizing disruption to ongoing operations. 
By breaking down the migration into smaller tasks, the Nautilus DevOps team can systematically progress through each stage, allowing for better control, risk mitigation, and optimization of resources throughout the migration process.

**Create a managed disk with the following requirements**:

Name of the disk should be nautilus-disk.

Disk type must be Standard_LRS.

Disk size must be 2 GiB.

**Solution**:

1.Go to disks.
2. Click create.
3. Enter the disk name as specified.
4. Choose the disk size to 2 GiB from the custom disk size.
5. Change the storage type as standard HDD (LRS).
6. Click review and create.
