terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
    }
  }
}

provider "google" {
  credentials = file("gcp.key")
  project     = var.project
  region      = var.region
  zone        = var.zone
}

resource "google_compute_address" "vm_static_ip" {
  name = "terraform-static-ip"
}

resource "google_compute_network" "vpc_network" {
  name = "terraform-network"
}

resource "google_compute_instance" "vm_instance" {
  name         = "terraform-instance"
  machine_type = "f1-micro"
  tags         = ["web", "dev"]
  provisioner "local-exec" {
    command = "echo ${google_compute_instance.vm_instance.name}:  ${google_compute_instance.vm_instance.network_interface[0].access_config[0].nat_ip} >> ip_address.txt"
  }
  depends_on = [google_storage_bucket.example_bucket]
  boot_disk {
    initialize_params {
      image = "cos-cloud/cos-stable"
    }
  }

  network_interface {
    network = google_compute_network.vpc_network.name
    access_config {
      nat_ip = google_compute_address.vm_static_ip.address
    }
  }
}

resource "google_storage_bucket" "example_bucket" {
  name     = var.bucket_name
  location = var.bucket_location

  website {
    main_page_suffix = "index.html"
    not_found_page   = "404.html"
  }
}
