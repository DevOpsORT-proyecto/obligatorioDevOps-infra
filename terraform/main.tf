# GCP Artifact Registry

resource "google_artifact_registry_repository" "proyecto-devops-ort" {

  provider = google-beta
  location = "southamerica-east1"
  repository_id = "proyecto-devops-ort"
  description = "DevopsORT Application Repo"
  format = "DOCKER"

}
