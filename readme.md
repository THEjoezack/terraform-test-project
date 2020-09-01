# Terraform Test Project

This project contains a basic Terraform project to be used as a reference, for fun.

Check out gcp/main.tf for a listing of all resources, but roughly this will create a compute instance in a vpc with a public ip, and a storage bucket.

## Goals

Get some high level experience with some new-to-me technologies while re-enforcing some existing ones.

### Technologies Used

- Google Cloud Platform
  - Storage
  - Compute
  - VPC
  - DNS
  - gcloud
- Terraform
  - VS Code Plugin
- Helm

## Instructions

- Requires
  - gcp account
  - gcp project
  - kubectl
  - helm
  - gcloud installed
- Recommended VS Code Plugin for Terraform
- Manually create a project (using terraform-288015 as a stand-in below, can't provision projects without an org so this can't be dynamic)
- [Enable the following API](https://console.cloud.google.com/apis/library):
  - Compute Engine
  - Kubernetes API
  - Kubernetes Engine AP
  - Cloud Resource Manager
- Create a service account with "Project Editor" permission
- Create a json key for the service account (named gcp.key in below examples)

## Running the project

(note: substitute your project name below instead of terraform-288015)

```bash
cd gcp

# get th ball rolling
terraform init

# Record the changes required
terraform plan -out plan

# Apply the plan
terraform apply plan

# See the results of the compute provisioner, this file will record when ip are associated
cat .\ip_address.txt

# Refresh the outputs
terraform refresh

# Display the outputs
terraform output

gcloud config set project terraform-288015

gcloud container clusters get-credentials test-cluster --zone us-east1-d

# Tear it all down
terraform destroy
```

## TODO

Up next, let's get a basic cluster running up in GKE with a simple flask app running.

## Resources

- [Getting Started with Terraform on GCP](https://learn.hashicorp.com/tutorials/terraform/google-cloud-platform-builld?in=terraform/gcp-get-started)
- [GCP Provider Documentation](https://www.terraform.io/docs/providers/google/index.html)
- [Terraform Configuration Language Documentation](https://www.terraform.io/docs/configuration/index.html)
- [Terraform Examples](https://www.terraform.io/intro/examples/index.html)
- [GKE Terraform Resources](https://www.terraform.io/docs/providers/google/r/container_cluster.html)
- [GKE Terraform Guide](https://www.terraform.io/docs/providers/google/guides/using_gke_with_terraform.html)
- [Google's GKE Module](https://registry.terraform.io/modules/terraform-google-modules/kubernetes-engine/google/11.0.0)
