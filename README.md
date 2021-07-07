# gke-rabbitmq-test

## Deploy a Kubernetes cluster in GKE and a RabbitMQ cluster too using Terraform. Additionaly 
##  go application for check service healht and send messages to a queue

This repo deploy a test scenario:
 - First deploy a private a GKE cluster on Google Cloud using Google Actions.Also deploy RabbitMQ operator and cluster.
 - Second build a  tiny go application, into a Docker and deploy  simple chart in GKE.

Keeping in mind the GKE cluster is private, with the goal to manage the cluster and the app deployments also  a Bastion VM machine is included.
I forget it! Bastion also is configure as github runner for run some Github Actions,again a need as soon as GKE cluster is private.



----------------------


## Requirements

- Google Cloud SDK
See https://cloud.google.com/sdk/docs/quickstart.
- Terraform CLI
See https://www.terraform.io/downloads.html.
- Create GCP service account & JSON key
Go to https://console.cloud.google.com/identity/serviceaccounts and create a service account. And a JSON key for it.


## Infra 

[link](.doc/gke.md)

## App

[link](.doc/app.md)

## GitHub Pipelines

[link](.doc/pipelines.md)


## Get cluster credentials
GET_CREDS="$(terraform output --state=terraform/terraform.tfstate get_credentials)"
${GET_CREDS}


--------------
# Documentation

[link](.doc/extdoc.md)


