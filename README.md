# GKE Autopilot Terraform Module

This module provisions a GKE Autopilot cluster along with essential Kubernetes resources including a namespace, service account, secret, network policies, and a persistent volume claim.

## Usage

```hcl
module "gke" {
  source = "../modules/gke"

  project_id                = "your-gcp-project-id"
  region                    = "us-central1"
  cluster_name              = "my-cluster"
  subnetwork                = "projects/your-project-id/global/networks/your-subnetwork"
  master_authorized_networks = [
    {
      cidr_block = "0.0.0.0/0"
      display_name = "All Networks"
    }
  ]

  namespace_name            = "my-namespace"
  service_account_name      = "my-service-account"
  secret_name               = "my-secret"
  secret_data_key           = "password"
  secret_manager_secret     = "projects/your-project-id/secrets/my-secret"
  pvc_name                  = "my-pvc"
  storage_class_name        = "standard"
  storage_size              = "10Gi"
}


