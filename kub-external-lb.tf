#external load balancer
resource "kubernetes_service" "node-external-lb-service" {
  metadata {
    name      = "node-external-service"
    namespace = kubernetes_namespace.n.metadata[0].name
  }
  spec {
    selector = {
      App = kubernetes_deployment.node-external-deployment.spec.0.template.0.metadata[0].labels.App
    }
    port {
      port        = 80
      target_port = 8080
    }

    type = "LoadBalancer"
  }
}


output "lb_status" {
  value = kubernetes_service.node-external-lb-service.status
}