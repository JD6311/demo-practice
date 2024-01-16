provider "kubernetes" {
  config_path = "~/.kube/config"
  
}


resource "kubernetes_deployment" "nginx_deployment" {
  metadata {
    name = "nginx-deployment"
  }
 
  spec {
    replicas = 2
 
    selector {
      match_labels = {
        app = "nginx"
      }
    }
 
    template {
      metadata {
        labels = {
          app = "nginx"
        }
      }
 
      spec {
        container {
          image = "nginx:latest"
          name  = "nginx"
        }
      }
    }
  }
}
 
# Expose NGINX service
resource "kubernetes_service" "nginx_service" {
  metadata {
    name = "nginx-service"
  }
 
  spec {
    selector = {
      app = "nginx"
    }
 
    port {
      protocol    = "TCP"
      port        = 80
      target_port = 80
    }
 
    type = "LoadBalancer"
  }
}