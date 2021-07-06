
module "google_networks" {
  source = "./modules/networks"

  project_id = var.project_id
  region     = var.region
}

module "google_kubernetes_cluster" {
  source                     = "./modules/kubernetes_cluster"
  name                       = var.name
  project_id                 = var.project_id
  region                     = var.region
  node_zones                 = var.cluster_node_zones
  service_account            = var.service_account
  network_name               = module.google_networks.network.name
  subnet_name                = module.google_networks.subnet.name
  master_ipv4_cidr_block     = module.google_networks.cluster_master_ip_cidr_range
  pods_ipv4_cidr_block       = module.google_networks.cluster_pods_ip_cidr_range
  services_ipv4_cidr_block   = module.google_networks.cluster_services_ip_cidr_range
  authorized_ipv4_cidr_block = "${module.bastion.ip}/32"
}

/*****************************************
  IAM Bindings GKE SVC
 *****************************************/
# allow GKE to pull images from GCR
#resource "google_project_iam_member" "gke" {
#  project = var.project_id
#  role    = "roles/storage.objectViewer"
#
#  member = "serviceAccount:${module.google_kubernetes_cluster.service_account}"
#}


module "bastion" {
  source = "./modules/bastion"

  project_id   = var.project_id
  region       = var.region
  zone         = var.main_zone
  bastion_name = "kalopsianetgke"
  network_name = module.google_networks.network.name
  subnet_name  = module.google_networks.subnet.name
}
