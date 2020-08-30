## Goals

Get some high level experience with some new stuff (like Terraform, Python, and Prometheus) while re-enforcing some basic devops skills (Docker/Kubernetes)

## Technologies
- terraform
- flask
- statsd
- prometheus
- grafana
- docker
- kubernetes
- skaffold
- networking
- gcp
  - container registry
  - cloud build


## Short-Term Goal

x get basic terraform example project running
- get a basic container running in a gcp project


## What have we done?

- installed terraform
- installed VS Code plugin from Hashicorp
- terraform init
- terraform apply/destroy the basic ngninx example
- gcloud components update
- manually create a gcp project (terraform-288015) (can't use [google_project](https://www.terraform.io/docs/providers/google/r/google_project.html) without an organization)
- enable the Compute Engine API for this project: https://console.developers.google.com/apis/library/compute.googleapis.com?pli=1
- create a service account with "Project Editor" permission
- create a json key for the service account
- gcloud config set project terraform-288015
- gcloud compute regions list  --filter="name~'east'"
- gcloud compute zones list --filter="name~'us-east'"
- created gcp/main.tf, populated the values from above (zone, project)
- `cd gcp && terraform init`
- `terraform plan`
- `terraform apply`
- gcloud compute networks list 

## Running the project

```bash
cd gcp
terraform apply
```

## Resources

- Getting Started with Terraform on GCP: https://learn.hashicorp.com/tutorials/terraform/google-cloud-platform-builld?in=terraform/gcp-get-started
- GCP Provider Documentation: https://www.terraform.io/docs/providers/google/index.html
- Terraform Configuration Language Documentation: https://www.terraform.io/docs/configuration/index.html