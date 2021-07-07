# gke-rabbitmq-test

## Deploy a Kubernetes cluster in GKE and a RabbitMQ cluster too using Terraform.

This repo deploys private a GKE cluster on Google Cloud using Google Actions.
Also deploy RabbitMQ operator and cluster.

Keeping in mind the GKE cluster is private, for manage the k8s a Bastion VM machine is included in de deployemts.

----------------------


## Requirements

- Google Cloud SDK
See https://cloud.google.com/sdk/docs/quickstart.
- Terraform CLI
See https://www.terraform.io/downloads.html.
- Create GCP service account & JSON key
Go to https://console.cloud.google.com/identity/serviceaccounts and create a service account. And a JSON key for it.


# Infra 

[link](.doc/gke.md)

# App

[link](.doc/app.md)

# GitHub Pipelines

[link](.doc/pipelines.md)


# Get cluster credentials
GET_CREDS="$(terraform output --state=terraform/terraform.tfstate get_credentials)"
${GET_CREDS}


--------------
# Documentation

[link](.doc/extdoc.md)


