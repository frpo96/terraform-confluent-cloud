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
  cloud_api_key    = var.common_vars["confluent_cloud_api_key"]
  cloud_api_secret = var.common_vars["confluent_cloud_api_secret"]
}

resource "confluent_tag_binding" "this" {
  schema_registry_cluster {
    id = var.common_vars["schema_registry_cluster_id"]
  }
  rest_endpoint = var.common_vars["schema_registry_rest_endpoint"]
  credentials {
    key    = var.common_vars["schema_registry_api_key"]
    secret = var.common_vars["schema_registry_api_secret"]
  }

  tag_name     = var.tag_name
  entity_name  = "${var.common_vars["schema_registry_cluster_id"]}:${var.common_vars["kafka_cluster_id"]}:${var.topic_name}"
  entity_type  = "kafka_topic"

  lifecycle {
    prevent_destroy = false
  }
}
