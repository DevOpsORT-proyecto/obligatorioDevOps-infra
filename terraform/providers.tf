terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "4.27.0"
    }
  }
}

provider "google-beta" {
  project     = "proyectodevopsort"
  region      = "southamerica-east1"
  credentials = "gcpKey.json"
}

provider "google" {
  project     = "proyectodevopsort"
  region      = "southamerica-east1"
  credentials = "gcpKey.json"
}

