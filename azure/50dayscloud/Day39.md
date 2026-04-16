**Day 39: Deploying a Static Website Using Containers on Azure**

The Nautilus DevOps team has been tasked with creating an internal information portal for public access. As part of this project, they need to host a static website on Azure using an Azure Storage account. The Storage account must be configured for public access to allow external users to access the static website directly via the Azure Storage URL.

Task Requirements:

    Create an Azure Storage account named xfusionwebst3401 in an existing resource group.
    Configure the Storage account for static website hosting with index.html as the index document.
    Allow public access to the static website so that the website is publicly accessible.
    Upload the index.html file from the /root/ directory of the Azure client host to the Storage account's $web container.
    Verify that the website is accessible directly through the Azure Storage static website URL.

Notes:

    Create the resources only in the East US region.
    Use the Azure Storage account's $web container to host the static website files.
    
**Solution**

* Go to storage accounts.
* Click create-->Enter the values.
* Click Review + create-->Click create.
* Go to the created storage account.
* Click Data management on the left side of the panel.
* Click static website-->Choose enabled.
* Enter the index document name as index.html and copy the primary and secondary endpoints.
* Copy the contents of index.html from azure client host.
* Go to the Data Storage-->Containers.
* Choose $web container and upload the index.html file.
* Choose the primary endpoint or the secondary endpoint URL along with index.html file from the browser or using curl -v command.

**Error**

The website is not accessible via the Azure Storage static website URL.

**To reolve the error**

Copied the contents of index.html from azure client host instead of using my own contents for index.html file.