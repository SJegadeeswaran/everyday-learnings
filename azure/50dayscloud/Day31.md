**Day 31: Deploying and Managing a Web Application**

The Nautilus DevOps team is tasked with deploying a Python-based web application on Azure. You need to create a web app using the following specifications:

1) The Web App name should be devops-webapp.
2) It should be created in the West US region under the default resource group.
3) The publish option should be set to Code.
4) The Runtime Stack should be Python with Linux as the operating system.
5) Create a new App Service Plan named devops-learn-python with the SKU Basic B1.
6) Application Insights should be disabled.
7) Add tags:

    Name: WebAppLearning
    Environment: Dev

Make sure the web app is in Running state after creation.

**Solution**

* Search for Azure app services.
* Click create and choose webapp.
* Enter the web-app name, runtime stack and region.
* Make sure the publish option is set to code and the OS is set as Linux.
* In the pricing plan, create new named as devops-learn-python and choose the pricing plan as Basic B1.
* Ensure the "Enable Application Insights" is set to "No" in the "Monitor+Secure" section.
* Enter the tag values in the tag section.
* Click Review + Create-->Create.