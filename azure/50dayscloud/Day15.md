**Create and Configure Network Security Group (NSG) in Azure**

The Nautilus DevOps team is strategizing the migration of a portion of their infrastructure to the Azure cloud. 
Recognizing the scale of this undertaking, they have opted to approach the migration in incremental steps rather than as a single massive transition. 
To achieve this, they have segmented large tasks into smaller, more manageable units. 
This granular approach enables the team to execute the migration in gradual phases, ensuring smoother implementation and minimizing disruption to ongoing operations. 

By breaking down the migration into smaller tasks, the Nautilus DevOps team can systematically progress through each stage, allowing for better control, risk mitigation, and optimization of resources throughout the migration process.

For this task, **create a network security group (NSG) with the following requirements**:

Name of the NSG should be xfusion-nsg.

Add an inbound security rule named Allow-HTTP for HTTP service on port 80, with the source CIDR range of 0.0.0.0/0.

Add another inbound security rule named Allow-SSH for SSH service on port 22, with the source CIDR range of 0.0.0.0/0.

**Solution**:

* Search and click for NSG.
* Click create NSG.
* Enter the NSG name and click create.
* Click the created NSG and in the left panel choose settings---> Inbound security rules.
* Choose the source as IP addresses and the CIDR range as 0.0.0.0/0.
* Choose service as HTTP and enter the name as "Allow-HTTP" and click add.
* Add another rule and choose source as IP addresses and the CIDR range as 0.0.0.0/0.
* Choose service as SSH and enter the rule name as "Allow-SSH" and click add.
