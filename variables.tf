variable "project_id" {
  type        = string
  description = "The ID of the project to create resources in"
}

variable "region" {
  type        = string
  description = "The region to use"
}

variable "main_zone" {
  type        = string
  description = "The zone to use as primary"
}

variable "cluster_node_zones" {
  type        = list(string)
  description = "The zones where Kubernetes cluster worker nodes should be located"
}

variable "credentials_file_path" {
  type        = string
  description = "The credentials JSON file used to authenticate with GCP"
}

variable "service_account" {
  type        = string
  description = "The GCP service account"
}

variable "storage-class" {
  type        = string
  description = "The storage class of the Storage Bucket to create"
}

variable "bucket-name" {
  type        = string
  description = "The  backend storage account name"
}

variable "name" {
  type        = string
  description = "The name of the cluster"
}

variable "githubtoken" {
  type        = string
  description = "GITHUB runner token"
  default     = "XXXXXXXXXXXXX"
}