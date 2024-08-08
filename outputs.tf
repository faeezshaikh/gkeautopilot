output "cluster_name" {
  value = google_container_cluster.primary.name
}

output "endpoint" {
  value = google_container_cluster.primary.endpoint
}

output "ca_certificate" {
  value = google_container_cluster.primary.master_auth.0.cluster_ca_certificate
}

output "namespace" {
  value = var.namespace_name
}

output "service_account" {
  value = var.service_account_name
}

output "pvc" {
  value = var.pvc_name
}
