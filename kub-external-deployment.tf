resource "kubernetes_deployment" "node-external-deployment" {
  metadata {
    name = "external-deployment"
    labels = {
      App = "events-external"
    }
    namespace = kubernetes_namespace.n.metadata[0].name
  }

  spec {
    replicas                  = 3
    progress_deadline_seconds = 60
    selector {
      match_labels = {
        App = "events-external"
      }
    }
    template {
      metadata {
        labels = {
          App = "events-external"
        }
      }
      spec {
        container {
          image = "rkreber/external-image:v0.2.2" #change image
          name  = "external-container"
          image_pull_policy = "Always"
          env {
            name = "SERVER"
            value = "http://events-internal"
          }
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