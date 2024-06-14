# Configure the Confluent Provider
terraform {
  required_providers {
    confluent = {
      source  = "confluentinc/confluent"
      version = "1.77.0"
    }
  }
}

# Option #1: Manage multiple clusters in the same Terraform workspace
provider "confluent" {
  cloud_api_key    = var.confluent_cloud_api_key    # optionally use CONFLUENT_CLOUD_API_KEY env var
  cloud_api_secret = var.confluent_cloud_api_secret # optionally use CONFLUENT_CLOUD_API_SECRET env var
}

# Create the resources
resource "confluent_kafka_topic" "this" {
  kafka_cluster {
    id = var.kafka_cluster_id
  }
  topic_name         = var.topic_name
  partitions_count   = var.partitions_count
  rest_endpoint      = var.rest_endpoint
  credentials {
    key    = var.credentials_key
    secret = var.credentials_secret
  }

  lifecycle {
    prevent_destroy = false # statically set to false
  }
}
