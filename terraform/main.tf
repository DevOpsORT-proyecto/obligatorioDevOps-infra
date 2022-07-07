# GCP Artifact Registry

resource "google_artifact_registry_repository" "proyecto-devops-ort" {

  provider = google-beta
  location = "southamerica-east1"
  repository_id = "proyecto-devops-ort"
  description = "DevopsORT Application Repo"
  format = "DOCKER"

}

resource "google_artifact_registry_repository_iam_member" "artifact-repo-iam" {
  
  provider = google-beta
  location = google_artifact_registry_repository.proyecto-devops-ort.location
  repository = google_artifact_registry_repository.proyecto-devops-ort.name
  role   = "roles/artifactregistry.reader"
  member = "allUsers"

}
