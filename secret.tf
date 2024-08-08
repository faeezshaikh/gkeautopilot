data "google_secret_manager_secret_version" "secret" {
  secret  = var.secret_manager_secret
  version = "latest"
}

resource "kubernetes_secret" "secret" {
  metadata {
    name      = var.secret_name
    namespace = kubernetes_namespace.namespace.metadata[0].name
  }

  data = {
    var.secret_data_key = data.google_secret_manager_secret_version.secret.secret_data
  }
}
