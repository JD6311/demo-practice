provider "azurerm" {
    features {
      
    }
  
}
module "k8s" {
  source = "./k8s"
  resource_group_name = var.resource_group_name
  location = var.location
  #prefix = var.prefix#"${var.prefix}-k8s443"
}
 
module "nginx_app" {
  source = "./nginx_app"
}



module "app_gateway" {
  source = "./app_gateway"
  resource_group_name = var.resource_group_name
  location = var.location
  #public_ip = var.public_ip
  private_ip_id = var.private_ip_address
  
  
}