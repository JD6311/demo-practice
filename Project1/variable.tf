variable "resource_group_name" {
    default  = "sa1_test_eic_TejalDave"
  
}
variable "location" {
    default = "Southeast Asia"
  
}
variable "azurerm_kubernetes_cluster_name" {
    default = "jaydeep_demo_cluster"

  
}
variable "dns_prefix" {
    type = string
    default = "demotest"
    
    
  
}
variable "prefix" {
    default = "demotest"
  
}
    

/*variable "public_ip" {
 type = string
 description = "jaydeep_vm_ip"
}*/
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
/*variable "subnet" {
  default = "jaydeep_vm_subnet"
}*/

