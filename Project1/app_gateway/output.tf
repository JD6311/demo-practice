output "app_gateway_name" {
    value = azurerm_application_gateway.demo_gateway
  
}
output "public_ip" {
    value = azurerm_public_ip.jaydeep_vm_ip.id
  
}
/*output "public_ip_address_id " {
    value = azurerm_public_ip.jaydeep_vm_ip.ip_address
    
  
}*/
output "frontend_ip_configuration_name" {
    value = local.frontend_ip_configuration_name
  
}
output "subnet_id" {
    value = azurerm_subnet.jaydeep_vm_subnet.id
  
}