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

resource "confluent_schema" "this" {
  schema_registry_cluster {
    id = var.common_vars["schema_registry_cluster_id"]
  }
  rest_endpoint = var.common_vars["schema_registry_rest_endpoint"]
  subject_name  = "${var.topic_name}-value"
  format        = "AVRO" // FIXED TO AVRO
  schema        = file(var.schema_file_path)
  credentials {
    key    = var.common_vars["schema_registry_api_key"]
    secret = var.common_vars["schema_registry_api_secret"]
  }

  lifecycle {
    prevent_destroy = false
  }
}

# Create the resources
resource "confluent_kafka_topic" "this" {
  kafka_cluster {
    id = var.common_vars["kafka_cluster_id"]
  }
  topic_name       = var.topic_name
  partitions_count = var.partitions_count
  rest_endpoint    = var.common_vars["rest_endpoint"]
  credentials {
    key    = var.common_vars["credentials_key"]
    secret = var.common_vars["credentials_secret"]
  }

  lifecycle {
    prevent_destroy = false // statically set to false
  }
}
