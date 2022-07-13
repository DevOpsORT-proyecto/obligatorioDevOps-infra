# GKE cluster

resource "google_container_cluster" "primary" {
  name     = "proyectodevopsort-gke"
  location = "southamerica-east1"
  
  # We can't create a cluster with no node pool defined, but we want to only use
  # separately managed node pools. So we create the smallest possible default
  # node pool and immediately delete it.
  remove_default_node_pool = true
  initial_node_count       = 1

  network    = google_compute_network.vpc.name
  subnetwork = google_compute_subnetwork.subnet.name
}

# Separately Managed Node Pool
resource "google_container_node_pool" "primary_nodes" {
  name       = "gke-node-pool"
  location   = "southamerica-east1"
  cluster    = google_container_cluster.primary.name
  node_count = 1

  node_config {
    oauth_scopes = [
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
    ]

    labels = {
      env = "develop"
    }

    # preemptible  = true
    machine_type = "n1-standard-1"
    tags         = ["gke-node", "proyectodevopsort-gke"]
    metadata = {
      disable-legacy-endpoints = "true"
    }
  }
}