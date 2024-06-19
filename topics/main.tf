# Configure the Confluent Provider
terraform {
  cloud {
    organization = "frpo-dev"

    workspaces {
      name = "confluent-cloud-github"
    }
  }
  required_providers {
    confluent = {
      source  = "confluentinc/confluent"
      version = "1.77.0"
    }
  }
}

# Option #1: Manage multiple clusters in the same Terraform workspace
provider "confluent" {
  cloud_api_key    = var.common_vars["confluent_cloud_api_key"]    # optionally use CONFLUENT_CLOUD_API_KEY env var
  cloud_api_secret = var.common_vars["confluent_cloud_api_secret"] # optionally use CONFLUENT_CLOUD_API_SECRET env var
}