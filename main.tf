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
  cloud_api_key    = var.confluent_cloud_api_key    # optionally use CONFLUENT_CLOUD_API_KEY env var
  cloud_api_secret = var.confluent_cloud_api_secret # optionally use CONFLUENT_CLOUD_API_SECRET env var
}

#
#resource "confluent_tag" "pii" {
#  schema_registry_cluster {
#    id = var.schema_registry_cluster_id
#  }
#  rest_endpoint = var.schema_registry_rest_endpoint
#  credentials {
#    key    = var.schema_registry_api_key
#    secret = var.schema_registry_api_secret
#  }
#
#  name = "PII"
#  description = "Personally identifiable information"
#
#  lifecycle {
#    prevent_destroy = false
#  }
#}
#
## Apply the Tag/BusinessMetadata on a topic
#resource "confluent_tag_binding" "pii-topic-tagging" {
#  schema_registry_cluster {
#    id = var.schema_registry_cluster_id
#  }
#  rest_endpoint = var.schema_registry_rest_endpoint
#  credentials {
#    key    = var.schema_registry_api_key
#    secret = var.schema_registry_api_secret
#  }
#
#  tag_name = confluent_tag.pii.name
#  entity_name = "${var.schema_registry_cluster_id}:${var.kafka_cluster_id}:demo-pipeline-caja"
#  entity_type = "kafka_topic"
#
#  lifecycle {
#    prevent_destroy = false
#  }
#}

# Create all tags
module "tags" {
  source = "./tags"
  common_vars = local.common_vars
}

# Create all topics
module "topics" {
  source = "./topics"
  common_vars = local.common_vars
}





#resource "confluent_business_metadata" "owner_metadata" {
#  description = "The person responsible for the data"
#  name = "Data Owner"
#  attribute_definition { name = "Team" }
#  attribute_definition { name = "Email" }
#
#  schema_registry_cluster {
#    id = var.schema_registry_cluster_id
#  }
#  rest_endpoint = var.schema_registry_rest_endpoint
#  credentials {
#    key    = var.schema_registry_api_key
#    secret = var.schema_registry_api_secret
#  }
#
#  lifecycle {
#    prevent_destroy = false
#  }
#}
#
#resource "confluent_business_metadata_binding" "owner-binding" {
#  schema_registry_cluster {
#    id = var.schema_registry_cluster_id
#  }
#  rest_endpoint = var.schema_registry_rest_endpoint
#  credentials {
#    key    = var.schema_registry_api_key
#    secret = var.schema_registry_api_secret
#  }
#
#  business_metadata_name = confluent_business_metadata.owner_metadata.name
#  entity_name = "${var.schema_registry_cluster_id}:${var.kafka_cluster_id}:demo-pipeline-caja"
#  entity_type = "kafka_topic"
#  attributes = {
#    Team  = "INVIXO Stream Team"
#    Email = "foo@bar.com"
#  }
#
#  lifecycle {
#    prevent_destroy = false
#  }
#}
