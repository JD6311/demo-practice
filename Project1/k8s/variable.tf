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
variable "azurerm_container_group" {
    default = "demo-group"
  
}