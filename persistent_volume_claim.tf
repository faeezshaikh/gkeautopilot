resource "kubernetes_persistent_volume_claim" "pvc" {
  metadata {
    name      = var.pvc_name
    namespace = kubernetes_namespace.namespace.metadata[0].name
  }

  spec {
    storage_class_name = var.storage_class_name
    access_modes       = ["ReadWriteOnce"]
    resources {
      requests = {
        storage = var.storage_size
      }
    }
  }
}
