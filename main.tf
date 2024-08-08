provider "google" {
  project = var.project_id
  region  = var.region
}

resource "google_container_cluster" "primary" {
  name               = var.cluster_name
  location           = var.region
  initial_node_count = 1

  autopilot {
    enabled = true
  }

  networking_mode = "VPC_NATIVE"
  subnetwork      = var.subnetwork

  ip_allocation_policy {
    use_ip_aliases = true
  }

  master_authorized_networks_config {
    cidr_blocks = var.master_authorized_networks
  }

  enable_shielded_nodes   = true
  enable_private_nodes    = true
  enable_private_endpoint = true

  network_policy {
    enabled = true
    provider = "CALICO"
  }

  addons_config {
    horizontal_pod_autoscaling {
      disabled = false
    }
    http_load_balancing {
      disabled = false
    }
    kubernetes_dashboard {
      disabled = true
    }
    network_policy_config {
      disabled = false
    }
  }
}

output "cluster_name" {
  value = google_container_cluster.primary.name
}

output "endpoint" {
  value = google_container_cluster.primary.endpoint
}

output "ca_certificate" {
  value = google_container_cluster.primary.master_auth.0.cluster_ca_certificate
}
