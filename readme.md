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

## Instructions

- Requires GCP Account, project
- Requires gcloud installed
- Recommended VS Code Plugin for Terraform
- Manually create a project (using terraform-288015 as a stand-in below, can't provision projects without an org so this can't be dynamic)
- Enable the Compute Engine API for this project: https://console.developers.google.com/apis/library/compute.googleapis.com?pli=1
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
