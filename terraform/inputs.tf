variable "subnetname"{

 type = string
 description = "The name of the existing subnet"

}

variable "vnetname" {

 type = string
 description = "The name of the existing vnet"

}

variable "vnetrg"{

 type = string
 description = "The name of the vnet resource group"

}

variable "location"{

 type = string
 description = "The location for the deployment"  

}


variable "vmname" {

  type = string
  description = "Name of the VM"
  
}

variable "vmpassword" {

   type = string
   description = "Password for the VM"
   

}

variable "tenantid" {

   type = string
   description = "Tenant id for the VM"
   

}

variable "subscriptionid" {

   type = string
   description = "Subscription id for the VM"
   

}

variable "clientid" {

   type = string
   description = "Client id for the VM"
   

}

variable "clientsecret" {

   type = string
   description = "ClientSecret for the VM"
   

}
