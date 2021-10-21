resource "kubernetes_deployment" "node-internal-deployment" {
  metadata {
    name = "internal-deployment"
    labels = {
      App = "events-internal"
    }
    namespace = kubernetes_namespace.n.metadata[0].name
  }

  spec {
    replicas                  = 1
    progress_deadline_seconds = 60
    selector {
      match_labels = {
        App = "events-internal"
      }
    }
    template {
      metadata {
        labels = {
          App = "events-internal"
        }
      }
      spec {
        container {
          image = "rkreber/internal-image:v0.1" #change image
          name  = "internal-container"
          image_pull_policy = "Always"
          resources {
            limits = {
              cpu    = "0.2"
              memory = "2562Mi"
            }
            requests = {
              cpu    = "0.1"
              memory = "50Mi"
            }
          }
        }
      }
    }
  }
}