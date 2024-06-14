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
module "kafka_topic" {
  source = "../../modules/kafka_topic"

  confluent_cloud_api_key    = var.confluent_cloud_api_key
  confluent_cloud_api_secret = var.confluent_cloud_api_secret
  kafka_cluster_id           = var.kafka_cluster_id
  topic_name                 = var.topic_name
  partitions_count           = var.partitions_count
  rest_endpoint              = var.rest_endpoint
  credentials_key            = var.credentials_key
  credentials_secret         = var.credentials_secret
}
