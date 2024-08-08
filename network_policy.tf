resource "kubernetes_network_policy" "allow_namespace_ingress" {
  metadata {
    name      = "${var.namespace_name}-ingress-allow"
    namespace = kubernetes_namespace.namespace.metadata[0].name
  }

  spec {
    pod_selector {}
    ingress {
      from {
        namespace_selector {
          match_labels = {
            "name" = var.namespace_name
          }
        }
      }
    }
  }
}

resource "kubernetes_network_policy" "deny_all_ingress" {
  metadata {
    name      = "${var.namespace_name}-ingress-deny"
    namespace = kubernetes_namespace.namespace.metadata[0].name
  }

  spec {
    pod_selector {}
    policy_types = ["Ingress"]

    ingress {
      from = []
    }
  }
}
