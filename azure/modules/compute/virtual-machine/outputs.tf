output "linux_virtual_machine_id" {
  value           = azurerm_linux_virtual_machine.linux-virtual-machine.id
  description     = "The ID of the Linux Virtual Machine."
}

output "linux_virtual_machine_identity" {
  value           = azurerm_linux_virtual_machine.linux-virtual-machine.identity
  description     = "The ID of the System Managed Service Principal."
}

output "linux_virtual_machine_virtual_machine_id" {
  value           = azurerm_linux_virtual_machine.linux-virtual-machine.virtual_machine_id
  description     = "A 128-bit identifier which uniquely identifies this Virtual Machine."
}