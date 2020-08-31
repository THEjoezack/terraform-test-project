variable "project" {
  default = "terraform-288015"
}

variable "credentials_file" {
  default = "gcp.key"
}

variable "region" {
  default = "us-east1"
}

variable "cluster_zones" {
  type    = list
  default = ["us-east1-c"]
}

variable "cluster_node_pool_min" {
  default = 1
}

variable "cluster_node_pool_max" {
  default = 2
}

variable "service_account" {
  default = "twitch-terraform-example@terraform-288015.iam.gserviceaccount.com"
}

variable "zone" {
  default = "us-east1-d"
}

variable "bucket_name" {
  default = "jzac-2020-08-30"
}

variable "bucket_location" {
  default = "US"
}
