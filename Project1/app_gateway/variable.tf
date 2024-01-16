variable "resource_group_name" {
    default  = "sa1_test_eic_TejalDave"
  
}
variable "location" {
    default = "Southeast Asia"
  
}
variable "azurerm_kubernetes_cluster_name" {
    default = "jaydeep_demo_cluster_new"

}
variable "vm_name" {
    default = "jaydeep-vm"
  
}


variable "virtual_network_name" {
    default = "jaydeep-vm_network"
  
}

variable "username" {
    default  = "jaydeep-user"
  
}
variable "ssh_public_key_path" {
    default = "path"
  
}
variable "address_prefixes" {
    default = ["10.0.2.0/24"]
  
}
variable "ip_configuration" {
  default = "Static"
}
variable "admin_ssh_key" {
    default = "adminuser"
  
}
variable "connection_type" {
    default = "Type of connection"
    type = string
  
}

/*variable "public_ip" {
 type = string
 description = "jaydeep_vm_ip"
}*/


variable "subnet" {
  default = "jaydeep_vm_subnet"
}


variable "network_interface_name" {
  
  default = "jaydeep_vm_network_interface"
}


variable "azurerm_linux_virtual_machine" {
    default = "jaydeep_vm"
  
}

variable "address_space" {
    default = ["10.0.0.0/16"]
  
}
variable "azurerm_application_gateway" {
   default = "demo_gateway"
   type = string
  
}

variable "private_ip_address" {
    type = string
    default = "10.254.0.10"
  
}


variable "private_ip_id" {
  type = string
  description = "ID of the private IP address"
  default = "10.0.0.5"
}






