output "virtual_machine_id" {
  value = data.azurerm_virtual_machine.xxx.id
}

output "ssh_public_key" {
  value = azurerm_ssh_public_key.sshkey.public_key
}

output "virtual_machine_private_ip" {
  value = azurerm_network_interface.networkinterface.private_ip_address 
}
