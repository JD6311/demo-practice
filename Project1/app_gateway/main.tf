
resource "azurerm_public_ip" "jaydeep_vm_ip" {
  name                = "jaydeep_vm_ip"
  resource_group_name = var.resource_group_name
  location            = var.location
  allocation_method   = "Static" 
  sku                 = "Standard"
  
}
resource "azurerm_virtual_network" "jaydeep-vm_network" {
  name                = var.virtual_network_name
  address_space       = var.address_space
  location            = var.location
  resource_group_name = var.resource_group_name
}

resource "azurerm_subnet" "jaydeep_vm_subnet" {
  name                 = var.subnet
  resource_group_name  = var.resource_group_name
  virtual_network_name = var.virtual_network_name
  address_prefixes     = var.address_prefixes


# Add depends_on to explicitly specify the dependency
  depends_on = [azurerm_virtual_network.jaydeep-vm_network]
}

/*resource "azurerm_network_interface" "jaydeep_vm_network_interface" {
   name                = var.network_interface_name
   location            = var.location
   resource_group_name = var.resource_group_name

   ip_configuration {
     name                          = var.ip_configuration
     subnet_id                     = azurerm_subnet.jaydeep_vm_subnet.id
     private_ip_address_allocation = var.ip_configuration
  }
    
   }*/

# since these variables are re-used - a locals block makes this more maintainable
locals {
  backend_address_pool_name      = "${azurerm_virtual_network.jaydeep-vm_network.name}-beap"
  frontend_port_name             = "${azurerm_virtual_network.jaydeep-vm_network.name}-feport"
  frontend_ip_configuration_name = "${azurerm_virtual_network.jaydeep-vm_network.name}-feip"
  http_setting_name              = "${azurerm_virtual_network.jaydeep-vm_network.name}-be-htst"
  listener_name                  = "${azurerm_virtual_network.jaydeep-vm_network.name}-httplstn"
  request_routing_rule_name      = "${azurerm_virtual_network.jaydeep-vm_network.name}-rqrt"
  redirect_configuration_name    = "${azurerm_virtual_network.jaydeep-vm_network.name}-rdrcfg"
}
resource "azurerm_application_gateway" "demo_gateway" {
  name                = var.azurerm_application_gateway
  resource_group_name = var.resource_group_name
  location            = var.location

  sku {
    name     = "Standard_v2"
    tier     =  "Standard_v2"
    #capacity = 2
  }
  autoscale_configuration {
   min_capacity = 0
   max_capacity = 10
   }

  gateway_ip_configuration {
    name      = "my-gateway-ip-configuration"
    subnet_id = azurerm_subnet.jaydeep_vm_subnet.id

  }

  frontend_port {
    name = local.frontend_port_name
    port = 80
  } 

  frontend_ip_configuration {
    name                 = local.frontend_ip_configuration_name
    public_ip_address_id = azurerm_public_ip.jaydeep_vm_ip.id
    
  
  }
  /*frontend_ip_configuration {
    name                 = "${local.frontend_ip_configuration_name}-private"
    subnet_id = "${azurerm_subnet.frontend.id}"
    private_ip_address_allocation = "Static"
    private_ip_address = var.private_ip_address
  }*/


  backend_address_pool {
    name = local.backend_address_pool_name
  }

  backend_http_settings {
    name                  = local.http_setting_name
    cookie_based_affinity = "Disabled"
    path                  = "/path1/"
    port                  = 80
    protocol              = "Http"
    request_timeout       = 60
    
  }
  

  http_listener {
    name                           = local.listener_name
    frontend_ip_configuration_name = local.frontend_ip_configuration_name
    frontend_port_name             = local.frontend_port_name
    protocol                       = "Http"
  }

  request_routing_rule {
    name                       = local.request_routing_rule_name
    priority                   = 9
    rule_type                  = "Basic"
    http_listener_name         = local.listener_name
    backend_address_pool_name  = local.backend_address_pool_name
    backend_http_settings_name = local.http_setting_name
  }
}