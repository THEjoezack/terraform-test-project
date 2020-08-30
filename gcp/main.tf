terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
    }
  }
}

provider "google" {

  credentials = file("gcp.key")

  project = "terraform-288015"
  region  = "us-east1"
  zone    = "us-east1-d"
}

resource "google_compute_network" "vpc_network" {
  name = "terraform-network"
}
