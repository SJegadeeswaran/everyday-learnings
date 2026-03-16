**Expanding and Managing Disk Storage**

The Nautilus DevOps team needs to expand the storage capacity of an existing virtual machine and add an additional data disk to support increased workloads. This task requires resizing the existing VM disk and mounting a new data disk to the VM.

As a member of the team, perform the following steps:

1) Expand the existing VM datacenter-vm disk from 32Gi to 64Gi.

2) Also create a new standard HDD data disk named datacenter-disk of 64Gi and mount the disk to VM datacenter-vm at location /mnt/datacenter-disk.

* Stop the VM.
* Go to the VM-->Expand Settings-->Click Disks.
* Choose the disk-->Click Create Snapshot (Disallowed by policy, so this step be ignored).
* Choose the disk-->Under settings-->Size + performance
* Choose 64GiB and click save.
* Start the VM and SSH into the VM.
* Under Settings-->Disk
* Click Create and attach new disk-->Enter disk name, storage type (Standard HDD) & size.
* Click Apply.
* Run the command lsblk -o NAME,HCTL,SIZE,MOUNTPOINT | grep -i "sd" from azure-client host to find the newly added disk.
* Run the following commands from azure-client host

```
sudo parted /dev/sdc --script mklabel gpt mkpart xfspart xfs 0% 100%
sudo mkfs.xfs /dev/sdc1
sudo partprobe /dev/sdc1
sudo mkdir /mnt/datacenter-disk
sudo mount /dev/sdc1 /mnt/datacenter-disk
```
* Run sudo blkid to find the UUID
* Edit the /etc/fstab:

UUID=***** /mnt/datacenter-disk xfs   defaults,nofail   1   2

Reference: 
https://learn.microsoft.com/en-us/azure/virtual-machines/linux/attach-disk-portal