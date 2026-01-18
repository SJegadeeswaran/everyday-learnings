terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.4.0"
    }
  }
}

provider "azurerm" {

  features{}
  tenant_id = var.tenantid
  subscription_id = var.subscriptionid
  client_id = var.clientid 
  client_secret = var.clientsecret  
}

data "azurerm_subnet" "subnet" {
  name                 = var.subnetname
  virtual_network_name = var.vnetname
  resource_group_name  = var.vnetrg
}

data "azurerm_virtual_network" "virtualnetwork" {
  name                = var.vnetname
  resource_group_name = var.vnetrg
}

data "azurerm_resource_group" "resourcegroup" {
  name = var.vnetrg
}

data "azurerm_virtual_machine" "xxx" {
  name                = var.vmname
  resource_group_name = var.vnetrg

}

resource "azurerm_network_interface" "networkinterface" {
  name                = "azurenetworkinterface"
  location            = var.location
  resource_group_name = var.vnetrg

  ip_configuration {
    name                          = "internal"
    subnet_id                     = data.azurerm_subnet.subnet.id
    private_ip_address_allocation = "Dynamic"
  }

}

resource "azurerm_linux_virtual_machine" "vmmachine" {
  name                = "xxx"
  resource_group_name = data.azurerm_resource_group.resourcegroup.name
  location            = var.location
  size                = "xxx"
  admin_username      = var.vmname
  admin_password      = var.vmpassword
  disable_password_authentication = false
  network_interface_ids = [
    azurerm_network_interface.networkinterface.id,
  ]  


  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }


}

resource "azurerm_ssh_public_key" "sshkey" {
  name                = "xxx"
  resource_group_name = data.azurerm_resource_group.resourcegroup.name
  location            = var.location
  public_key          = file("~/.ssh/id_rsa.pub")

provisioner "file" {
    source      = "/home/xxx/.ssh/authorized_keys"
    destination = "/home/xxx/.ssh/authorized_keys"

   connection {
    type     =  "ssh"
    user     =  var.vmname
    password =  var.vmpassword
    host     =  azurerm_network_interface.networkinterface.private_ip_address
 
 }

  }

provisioner "local-exec" {
    command = "ansible-playbook -u ami-builder -e hosts=${azurerm_network_interface.networkinterface.private_ip_address} nginx.yaml"
  }

}
