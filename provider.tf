terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "3.51.0"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = ">= 2.0.3"
    }

  }
}

provider "google" {
  credentials = file(var.credentials_file_path)

  project = var.project_id
  region  = var.region
  zone    = var.main_zone
}

provider "google-beta" {
  credentials = file(var.credentials_file_path)

  project = var.project_id
  region  = var.region
  zone    = var.main_zone
}


//provider google_container_cluster {
//  host  = "https://${data.google_container_cluster.default.endpoint}"
//  token = data.google_client_config.default.access_token
//  cluster_ca_certificate = base64decode(
//    data.google_container_cluster.default.master_auth[0].cluster_ca_certificate,
//  )
//}



//provider "google-beta" {
//  credentials = file(var.credentials_file_path)
//
//  project = var.project_id
//  region  = var.region
//  zone    = var.main_zone
//}
//
//module "gke_auth" {
//  source  = "terraform-google-modules/kubernetes-engine/google/modules/auth"
//  version = "~> 9.1"
//
//  project_id   = var.project_id
//  cluster_name = var.name
//  location     = var.region
//}