**Day 29: Working with Azure Container Registry (ACR)**

The Nautilus DevOps team has been tasked with setting up a containerized application. They need to create a Azure Container Registry (ACR) to store their Docker images. Once the repository is created, they will build a Docker image from a Dockerfile located on the azure-client host and push this image to the ACR repository. This process is essential for maintaining and deploying containerized applications in a streamlined manner.

1) Create a ACR repository named nautilusacr3350 under East US.

2) Pricing plan must be Basic.

3) Dockerfile already exists under /root/pyapp directory on azure-client host.

4) Build a Docker image using this Dockerfile and push the same to the newly created ACR repo. The image tag must be latest i.e nautilusacr3350:latest.

Notes:

    Create the resources only in East US region.

**Solution**

* Search for container registries.
* Click create.
* Enter the name, region and pricing plan as defined.
* Click Review + Create-->Create.
* Go to /root/pyapp directory on azure-client host and build a docker image using the command "docker build -t nautilusacr3350:latest ."
* Go to the created ACR-->Settings-->AccessKeys
* Select the checkbox for the Admin user.
* Under password click show and copy the password.
* Run the docker login nautilusacr3350.azurecr.io and enter the password.
* Tag the docker image as "docker tag nautilusacr3350:latest  nautilusacr3350.azurecr.io/nautilusacr3350:latest"
* Run the "sudo docker push nautilusacr3350.azurecr.io/nautilusacr3350:latest"
* Go to the created ACR-->Services-->Click Repositories to verify whether the image is available.