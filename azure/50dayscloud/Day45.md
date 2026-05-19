**Day 45: Azure Kubernetes Service (AKS) Setup and Management**

The Nautilus DevOps team is tasked with preparing an AKS cluster to deploy a Kubernetes-based application. The team has the following requirements:

    Create an AKS cluster named devops-aks.
    The Kubernetes version must be 1.33.0.
    The AKS cluster endpoint access must be private.
    Ensure the cluster is created in the Central US region.
    Edit the agentpool Node pools (delete all other node pool if exists) and configure the cluster with the following properties:
        Node size: D2s v3.
        Minimum node count: 1.
        Maximum node count: 2.

    Disable the Container Insights for now and disable all kind of monitoring as well.

The AKS cluster must be configured with high availability and private endpoint access. Verify that the cluster meets the requirements and is ready for workloads.

Notes:

    Create the resources only in the Central US region.
    Ensure that the Kubernetes version is 1.33.0.

**Solution**

* Search for Kubernetes services and click.
* Click create kubernetes cluster.
* Choose the resource group and enter the cluster name.
* Choose the kubernetes version.
* Choose the availability zones for zone1, zone2 and zone3.
* Click next and edit the agent pool.
* Choose the node size as given and enter the minimum and maximum node count.
* Click update.
* Click next and under networking section enable private cluster.
* Click next and from monitoring section disable logs, container insights and all the other alerts.

