resource "kubernetes_namespace" "n" {
  metadata {
    name = "node-ns"
  }
}