#internal ClusterIP
resource "kubernetes_service" "node-internal-ip-service" {
  metadata {
    name      = "events-internal"
    namespace = kubernetes_namespace.n.metadata[0].name
  }
  spec {
    selector = {
      App = kubernetes_deployment.node-internal-deployment.spec.0.template.0.metadata[0].labels.App
    }
    port {
      port        = 80
      target_port = 8082
    }

    type = "ClusterIP"
  }
}


output "ip_status" {
  value = kubernetes_service.node-internal-ip-service.status
}