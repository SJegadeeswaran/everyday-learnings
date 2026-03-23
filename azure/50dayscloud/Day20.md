**Deploy Azure Resources Using ARM Template**

You are tasked with modifying an ARM template for deploying a virtual network. The current template is located in the /root/arm-templates directory under the filename vnet-deployment-template.json. You need to make the following changes to the template:

Change the name and displayName tag of the virtual network to arm-vnet-xfusion.

Update the addressPrefixes to 192.168.0.0/16.

Add one more tag named Environment with value KKE-xfusion.

After making these changes, you need to deploy the ARM template using the Azure CLI.

**Solution**

Use the following command to find out the resource group to use:

```
az group list --query '[].name' --output table | grep 'kml'
kml_rg_main-381458b141cf4aba

az deployment group create --resource-group kml_rg_main-381458b141cf4aba  --template-file /root/arm-templates/vnet-deployment-t
emplate.json

```

cat vnet-deployment-template.json:

```
{
    "$schema": "https://schema.management.azure.com/schemas/2019-04-01/deploymentTemplate.json#",
    "contentVersion": "1.0.0.0",
    "parameters": {},
    "functions": [],
    "variables": {},
    "resources": [
        {
            "name": "arm-vnet-xfusion",
            "type": "Microsoft.Network/virtualNetworks",
            "apiVersion": "2023-11-01",
            "location": "[resourceGroup().location]",
            "tags": {
                "displayName": "arm-vnet-xfusion",
                "Environment": "KKE-xfusion"            
            },
            "properties": {
                "addressSpace": {
                    "addressPrefixes": [
                        "192.168.0.0/16"
```