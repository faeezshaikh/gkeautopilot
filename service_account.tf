resource "kubernetes_service_account" "service_account" {
  metadata {
    name      = var.service_account_name
    namespace = kubernetes_namespace.namespace.metadata[0].name
  }
}
