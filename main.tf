provider "google" {
  project = "project-dcad7949-48bb-49b8-a68"
  region  = "us-central1"
  zone    = "us-central1-a"
}

provider "google_service_account" "default" {
  account_id   = "terraform-sa"
  display_name = "Terraform Service Account"
}

provider "google_service_account_key" "default" {
  service_account_id = google_service_account.default.name
}

resource "google_compute_instance" "vm" {
  name         = "terraform-vm"
  machine_type = "e2-micro"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  network_interface {
    network = "default"
    access_config {}
  }
}