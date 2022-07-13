# VPC
resource "google_compute_network" "vpc" {
  name                    = "proyectodevopsort-vpc"
  auto_create_subnetworks = "false"
}

# Subnet
resource "google_compute_subnetwork" "subnet" {
  name          = "proyectodevopsort-subnet"
  region        = "southamerica-east1"
  network       = google_compute_network.vpc.name
  ip_cidr_range = "10.10.0.0/24"
}