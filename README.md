# gke-rabbitmq-test
GKE and RabbitMQ Terraform

This terraform repo deploys private GKE cluster on Google Cloud using Google Actions.
Also deploy RabbitMQ operator, and cluster-

Keeping in mind the GKE cluster is private, thinking in  pourposes deploy a Bastion VM machine.

Based and copypasted  in:

https://orlando-thoeny.medium.com/create-a-private-gcp-kubernetes-cluster-using-terraform-1a830dd802a8
https://pavan1999-kumar.medium.com/deploying-rabbitmq-on-kubernetes-using-rabbitmq-cluster-operator-ef99f7a4e417


Documentation:
[Github google Actions](https://github.com/google-github-actions)

## Requirements

###  Google Cloud SDK
See https://cloud.google.com/sdk/docs/quickstart.

###  Terraform CLI
See https://www.terraform.io/downloads.html.

### Create GCP service account & JSON key

Go to https://console.cloud.google.com/identity/serviceaccounts and create a service account. And a JSON key for it.

### Configure Terraform variables
Replace the values as needed. environment/[dev,pro,etc].tfvars .
