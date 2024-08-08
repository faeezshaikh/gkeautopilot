variable "project_id" {
  description = "The GCP project ID"
  type        = string
}

variable "region" {
  description = "The region where GKE cluster will be deployed"
  type        = string
}

variable "cluster_name" {
  description = "The name of the GKE cluster"
  type        = string
}

variable "subnetwork" {
  description = "The name of the subnetwork to be used by the GKE cluster"
  type        = string
}

variable "master_authorized_networks" {
  description = "A list of CIDR blocks that are allowed to connect to the GKE master"
  type        = list(object({
    cidr_block = string
    display_name = string
  }))
  default = []
}

variable "namespace_name" {
  description = "The name of the Kubernetes namespace"
  type        = string
}

variable "service_account_name" {
  description = "The name of the Kubernetes service account"
  type        = string
}

variable "secret_name" {
  description = "The name of the Kubernetes secret"
  type        = string
}

variable "secret_data_key" {
  description = "The key for the Kubernetes secret data"
  type        = string
}

variable "secret_manager_secret" {
  description = "The name of the secret in Google Secret Manager"
  type        = string
}

variable "pvc_name" {
  description = "The name of the Persistent Volume Claim"
  type        = string
}

variable "storage_class_name" {
  description = "The name of the StorageClass to use"
  type        = string
}

variable "storage_size" {
  description = "The size of the Persistent Volume Claim"
  type        = string
  default     = "10Gi"
}
