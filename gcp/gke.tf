module "gke" {
  source                     = "terraform-google-modules/kubernetes-engine/google"
  project_id                 = var.project
  name                       = "gke-test-1"
  region                     = var.region
  zones                      = var.cluster_zones
  network                    = google_compute_network.vpc_network.name
  subnetwork                 = "us-east1"
  ip_range_pods              = "us-east1-01-gke-01-pods"
  ip_range_services          = "us-east1-01-gke-01-services"
  http_load_balancing        = false
  horizontal_pod_autoscaling = false
  network_policy             = true

  node_pools = [
    {
      name               = "default-node-pool"
      machine_type       = "e2-medium"
      min_count          = var.cluster_node_pool_min
      max_count          = var.cluster_node_pool_max
      local_ssd_count    = 0
      disk_size_gb       = 10
      disk_type          = "pd-standard"
      image_type         = "COS"
      auto_repair        = true
      auto_upgrade       = true
      service_account    = var.service_account
      preemptible        = true
      initial_node_count = 1
    },
  ]

  node_pools_oauth_scopes = {
    all = []

    default-node-pool = [
      "https://www.googleapis.com/auth/cloud-platform",
    ]
  }

  node_pools_labels = {
    all = {}

    default-node-pool = {
      default-node-pool = true
    }
  }

  node_pools_metadata = {
    all = {}

    default-node-pool = {
      node-pool-metadata-custom-value = "my-node-pool"
    }
  }

  node_pools_tags = {
    all = []

    default-node-pool = [
      "default-node-pool",
    ]
  }
}
